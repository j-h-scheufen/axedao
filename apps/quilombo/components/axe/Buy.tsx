'use client';

import { Button, Input } from '@heroui/react';
import type { FormikErrors } from 'formik';
import { useFormik } from 'formik';
import { debounce } from 'lodash';
import { enqueueSnackbar } from 'notistack';
import { useCallback, useEffect, useState } from 'react';
import { type Address, formatUnits, parseUnits } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';

import ENV from '@/config/environment';
import {
  useReadAxeBuyTax,
  useReadErc20Allowance,
  useReadIUniswapV2Router02GetAmountOut,
  useWriteErc20Approve,
  useWriteIUniswapV2Router02SwapExactTokensForTokensSupportingFeeOnTransferTokens,
} from '@/generated';
import { formatAxeUnits, formatStableUnits } from '@/utils/contract.utils';
import type { TradeFormProps } from './Swap';

const slippageTolerance = 100n; //basispoints

const Buy: React.FC<TradeFormProps> = ({ reserves, swapBalance, axeBalance, onUpdate }) => {
  const account = useAccount();
  const [isUpdating, setIsUpdating] = useState<boolean>(false);
  const [exceedsAllowance, setExceedsAllowance] = useState<boolean>(false);
  const [amountIn, setAmountIn] = useState<bigint>(0n);
  const [taxedOutput, setTaxedOutput] = useState<bigint>(0n);
  const [axeDonation, setAxeDonation] = useState<string>('0');

  /// WAGMI
  const { data: buyTax } = useReadAxeBuyTax({ address: ENV.axeTokenAddress });
  const { data: allowance, refetch: updateAllowance } = useReadErc20Allowance({
    address: ENV.axeSwapTokenAddress,
    args: [account.address as Address, ENV.uniswapV2RouterAddress],
  });
  const { data: amountOut } = useReadIUniswapV2Router02GetAmountOut({
    address: ENV.uniswapV2RouterAddress,
    args: [amountIn, reserves.swap, reserves.axe],
  });
  // SWAP
  const {
    data: swapHash,
    isPending: swapPending,
    writeContract: swap,
  } = useWriteIUniswapV2Router02SwapExactTokensForTokensSupportingFeeOnTransferTokens();
  const {
    isSuccess: swapSuccess,
    error: swapError,
    isLoading: swapLoading,
  } = useWaitForTransactionReceipt({ hash: swapHash });
  // APPROVE
  const { data: approveHash, isPending: approvePending, writeContract: approve } = useWriteErc20Approve();
  const {
    isSuccess: approveSuccess,
    error: approveError,
    isLoading: approveLoading,
  } = useWaitForTransactionReceipt({ hash: approveHash });

  // apply buyTax on getAmountsOut estimate as the Axé donation is taken from the swap output
  useEffect(() => {
    if (amountOut) {
      const taxedOutput = buyTax && buyTax > 0 ? amountOut - (amountOut / 10000n) * buyTax : amountOut;
      const donation = buyTax && buyTax > 0 ? (amountOut / 10000n) * buyTax : 0n;
      formik.setFieldValue(
        'amountOut',
        taxedOutput && taxedOutput > 0n ? Number(formatUnits(taxedOutput, 18)).toFixed(4).toLocaleString() : ''
      );
      setTaxedOutput(taxedOutput);
      setAxeDonation(formatAxeUnits(donation));
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [amountOut, buyTax]);

  // reactions to approve receipt outcome
  useEffect(() => {
    if (approveLoading) {
      enqueueSnackbar('Approval submitted. Please allow some time to confirm ...', {
        autoHideDuration: 10000,
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
        autoHideDuration: 12000,
      });
      // after swap is submitted, we clear out the form and swap-related state (resetForm does not trigger onChange!)
      formik.resetForm();
      setAmountIn(0n);
    } else if (swapSuccess) {
      enqueueSnackbar('Swap confirmed!');
      onUpdate();
    } else if (swapError) {
      enqueueSnackbar(`The Swap has failed: ${swapError.message}`);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [swapLoading, swapSuccess, swapError, onUpdate]);

  useEffect(() => {
    if (allowance !== undefined && allowance < amountIn) {
      setExceedsAllowance(true);
    } else setExceedsAllowance(false);
  }, [amountIn, allowance]);

  // TODO use simulate contract to prepare and only then enable the Buy / Approve button
  // TODO calculate price impact to show % price move and warn (https://stackoverflow.com/questions/74282316/uniswap-v2-pool-priceimpact#:~:text=You%20can%20calculate%20the%20price,is%20ETH%2C%20k%20is%202%2C000%2C000%2C000.)

  interface FormValues {
    amountIn: string;
    amountOut: string;
  }

  const handleSubmit = (values: FormValues) => {
    try {
      const bigInput = parseUnits(values.amountIn.toString(), 18);
      if (exceedsAllowance) {
        approve({ address: ENV.axeSwapTokenAddress, args: [ENV.uniswapV2RouterAddress, bigInput] });
      } else {
        const deadline = Math.floor(Date.now() / 1000) + 60 * 20; // 20 minutes from the current Unix time
        //TODO check for slippage and warn / adjust tolerance or block
        //TODO modal for user to review the TX before sending. That's also where the TX prep can be done best.
        if (taxedOutput) {
          swap({
            address: ENV.uniswapV2RouterAddress,
            args: [
              bigInput,
              taxedOutput - (taxedOutput / 10000n) * slippageTolerance,
              [ENV.axeSwapTokenAddress, ENV.axeTokenAddress],
              account.address!,
              BigInt(deadline),
            ],
          });
        }
      }
    } catch (error) {
      console.error('Error during swap.', error);
      throw error;
    }
  };

  const validateForm = useCallback(
    async (values: FormValues): Promise<FormikErrors<FormValues>> => {
      const errors: FormikErrors<FormValues> = {};
      if (!!values.amountIn) {
        const bigAmount = parseUnits(values.amountIn.toString(), 18); // Note: explicit cast toString() required here!
        if (swapBalance && swapBalance < bigAmount) errors.amountIn = 'Available balance exceeded';
      }
      return errors;
    },
    [swapBalance]
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
    setAmountIn(parseUnits(value, 18));
    setIsUpdating(false);
  }, 1000);

  return (
    <form onSubmit={formik.handleSubmit}>
      <div className="flex w-auto flex-col items-center gap-2">
        <div>Your Balance: ${formatStableUnits(swapBalance)}</div>
        <Input
          name="amountIn"
          label="You pay"
          type="number"
          placeholder="0.00"
          size="lg"
          classNames={{ label: 'py-1', input: 'text-large number-to-text' }}
          startContent={
            <div className="pointer-events-none flex items-center">
              <span className="text-large text-default-400">$</span>
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
          placeholder="0"
          disabled
          classNames={{ label: 'py-1', input: 'text-large' }}
          startContent={
            <div className="pointer-events-none flex items-center">
              <span className="text-large text-default-400">Axé</span>
            </div>
          }
          value={formik.values.amountOut}
          description={
            <span>
              You are donating {Number(buyTax) / 100}% ({axeDonation} Axé) to the{' '}
              <a href="https://axe.to.hns" className=" underline">
                Axé DAO
              </a>
            </span>
          }
        />
        <div>Your Balance: {formatAxeUnits(axeBalance)} Axé</div>

        <Button
          type="submit"
          size="lg"
          color="primary"
          className="mt-2 w-full"
          isDisabled={!formik.isValid || !formik.dirty || isUpdating || approvePending || swapPending}
          isLoading={formik.isSubmitting}
        >
          {swapPending ? 'Confirming...' : isUpdating ? 'Updating ...' : exceedsAllowance ? 'Approve' : 'Buy'}
        </Button>
      </div>
    </form>
  );
};

export default Buy;
