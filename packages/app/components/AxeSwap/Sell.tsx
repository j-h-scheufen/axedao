'use client';

import { useState, useEffect, useCallback } from 'react';
import { debounce } from 'lodash';
import { parseUnits, formatUnits, Address } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { enqueueSnackbar } from 'notistack';
import { useFormik, FormikErrors, FormikHelpers } from 'formik';

import ENV from '@/config/environment';
import {
  useReadIUniswapV2Router02GetAmountOut,
  useReadErc20Allowance,
  useReadAxeSellTax,
  useWriteErc20Approve,
  useWriteIUniswapV2Router02SwapExactTokensForTokensSupportingFeeOnTransferTokens,
} from '@/generated';
import { formatAxeUnits, formatStableUnits } from '@/utils/contract.utils';
import { TradeFormProps } from './AxeSwap';

const slippageTolerance = 100n; //basispoints

const Buy: React.FC<TradeFormProps> = ({ reserves, swapBalance, axeBalance, onUpdate }) => {
  const account = useAccount();
  const [isUpdating, setIsUpdating] = useState<boolean>(false);
  const [exceedsAllowance, setExceedsAllowance] = useState<boolean>(false);
  const [amountIn, setAmountIn] = useState<bigint>(0n);
  const [taxedInput, setTaxedInput] = useState<bigint>(0n);
  const [axeDonation, setAxeDonation] = useState<string>('0');

  /// WAGMI
  const { data: sellTax } = useReadAxeSellTax({ address: ENV.axeTokenAddress });
  const { data: allowance, refetch: updateAllowance } = useReadErc20Allowance({
    address: ENV.axeTokenAddress,
    args: [account.address as Address, ENV.uniswapV2RouterAddress],
  });
  const { data: amountOut } = useReadIUniswapV2Router02GetAmountOut({
    address: ENV.uniswapV2RouterAddress,
    args: [taxedInput, reserves.axe, reserves.swap],
  });
  const {
    data: swapHash,
    isPending: swapPending,
    writeContract: swap,
  } = useWriteIUniswapV2Router02SwapExactTokensForTokensSupportingFeeOnTransferTokens();
  const { data: approveHash, isPending: approvePending, writeContract: approve } = useWriteErc20Approve();
  const {
    isSuccess: swapSuccess,
    error: swapError,
    isLoading: swapLoading,
  } = useWaitForTransactionReceipt({ hash: swapHash });
  const {
    isSuccess: approveSuccess,
    error: approveError,
    isLoading: approveLoading,
  } = useWaitForTransactionReceipt({ hash: approveHash });

  // update amountOut from getAmount estimate
  // the axe donation was subtracted from the input before the estimate, so the estimate should be accurate
  useEffect(() => {
    formik.setFieldValue(
      'amountOut',
      amountOut && amountOut > 0n ? Number(formatUnits(amountOut, 18)).toFixed(4).toLocaleString() : '',
    );
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [amountOut]);

  // reactions to approve receipt outcome
  useEffect(() => {
    if (approveLoading) {
      enqueueSnackbar('Approval submitted. Please allow some time to confirm ...', {
        autoHideDuration: 12000,
      });
    } else if (approveSuccess) {
      enqueueSnackbar('Approval confirmed!');
      updateAllowance();
    } else if (approveError) {
      enqueueSnackbar(`The Approval has failed: ${approveError.message}`);
    }
  }, [approveLoading, approveSuccess, approveError, updateAllowance]);

  // reactions to swap receipt outcome
  useEffect(() => {
    if (swapLoading) {
      enqueueSnackbar('Swap submitted. Please allow some time to confirm ...', {
        autoHideDuration: 10000,
      });
      // after swap is submitted, we clear out the form and swap-related state (resetForm does not trigger onChange!)
      formik.resetForm();
      setTaxedInput(0n);
      setAxeDonation('0');
    } else if (swapSuccess) {
      enqueueSnackbar('Swap confirmed!');
      onUpdate();
    } else if (swapError) {
      enqueueSnackbar(`The Swap has failed: ${swapError.message}`);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [swapLoading, swapSuccess, swapError, onUpdate]);

  useEffect(() => {
    if (allowance && allowance < amountIn) {
      setExceedsAllowance(true);
    } else setExceedsAllowance(false);
  }, [amountIn, allowance]);

  // TODO use simulate contract to prepare and only then enable the Buy / Approve button
  // TODO calculate price impact to show % price move and warn (https://stackoverflow.com/questions/74282316/uniswap-v2-pool-priceimpact#:~:text=You%20can%20calculate%20the%20price,is%20ETH%2C%20k%20is%202%2C000%2C000%2C000.)

  interface FormValues {
    amountIn: string;
    amountOut: string;
  }

  const handleSubmit = (values: FormValues, { setSubmitting }: FormikHelpers<FormValues>) => {
    try {
      const bigInput = parseUnits(values.amountIn.toString(), 18);
      if (exceedsAllowance) {
        approve({ address: ENV.axeTokenAddress, args: [ENV.uniswapV2RouterAddress, bigInput] });
      } else {
        const deadline = Math.floor(Date.now() / 1000) + 60 * 20; // 20 minutes from the current Unix time
        //TODO check for slippage and warn / adjust tolerance or block
        //TODO modal for user to review the TX before sending. That's also where the TX prep can be done best.
        if (amountOut) {
          swap({
            address: ENV.uniswapV2RouterAddress,
            args: [
              bigInput,
              amountOut - (amountOut / 10000n) * slippageTolerance,
              [ENV.axeTokenAddress, ENV.axeSwapTokenAddress],
              account.address!,
              BigInt(deadline),
            ],
          });
        }
      }
    } catch (error) {
      console.error('Error during swap.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  const validateForm = useCallback(
    async (values: FormValues): Promise<FormikErrors<FormValues>> => {
      const errors: FormikErrors<FormValues> = {};
      if (!!values.amountIn) {
        const bigAmount = parseUnits(values.amountIn.toString(), 18); // Note: explicit cast toString() required here!
        if (axeBalance && axeBalance < bigAmount) errors.amountIn = 'Available balance exceeded';
      }
      return errors;
    },
    [axeBalance],
  );

  const formik = useFormik<FormValues>({
    initialValues: {
      amountIn: '',
      amountOut: '',
    },
    onSubmit: handleSubmit,
    validate: validateForm,
  });

  // debounce the input that leads to recalculations
  const handleChange = debounce((value: string) => {
    const bigInput = parseUnits(value, 18);
    setAmountIn(bigInput);
    setAxeDonation(sellTax && sellTax > 0 ? formatAxeUnits((bigInput / 10000n) * sellTax) : '');
    setTaxedInput(sellTax && sellTax > 0 ? bigInput - (bigInput / 10000n) * sellTax : bigInput);
    setIsUpdating(false);
  }, 2000);

  return (
    <form onSubmit={formik.handleSubmit}>
      <div className="flex w-auto flex-col items-center gap-2">
        <div>Your Balance: {formatAxeUnits(axeBalance)} Axé</div>
        <Input
          name="amountIn"
          label="You pay"
          type="number"
          placeholder="0"
          size="lg"
          classNames={{ label: 'py-1', input: 'text-large number-to-text' }}
          startContent={
            <div className="pointer-events-none flex items-center">
              <span className="text-large text-default-400">Axé</span>
            </div>
          }
          value={formik.values.amountIn}
          onChange={(event) => {
            setIsUpdating(true);
            handleChange(event?.target.value);
            formik.handleChange(event);
          }}
          onBlur={formik.handleBlur}
          isInvalid={formik.touched.amountIn && !!formik.errors.amountIn}
          errorMessage={formik.errors.amountIn}
        />
        <div className="my-1">1 Axé &#8776; ${reserves.rate}</div>
        <Input
          label="You receive"
          type="number"
          size="lg"
          placeholder="0.00"
          disabled
          classNames={{ label: 'py-1', input: 'text-large' }}
          startContent={
            <div className="pointer-events-none flex items-center">
              <span className="text-large text-default-400">$</span>
            </div>
          }
          value={formik.values.amountOut}
          description={
            <span>
              You are donating {Number(sellTax) / 100}% ({axeDonation} Axé) to the{' '}
              <a href="https://axe.to.hns" className=" underline">
                Axé DAO
              </a>
            </span>
          }
        />
        <div>Your Balance: ${formatStableUnits(swapBalance)}</div>

        <Button
          type="submit"
          className="mt-2 size-unit-lg w-full bg-orange-200 text-large dark:bg-orange-700"
          isDisabled={!formik.isValid || !formik.dirty || isUpdating || approvePending || swapPending}
          isLoading={formik.isSubmitting}
        >
          {swapPending ? 'Confirming...' : isUpdating ? 'Updating ...' : exceedsAllowance ? 'Approve' : 'Sell'}
        </Button>
      </div>
    </form>
  );
};

export default Buy;
