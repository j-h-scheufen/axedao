'use client';

import { useState, useEffect, useCallback } from 'react';
import { debounce } from 'lodash';
import { parseUnits, formatUnits, Address } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { enqueueSnackbar, closeSnackbar, SnackbarKey } from 'notistack';
import { useFormik, FormikErrors, FormikHelpers } from 'formik';

import ENV from '@/config/environment';
import {
  useReadIUniswapV2Router02GetAmountOut,
  useReadErc20Allowance,
  useReadAxeBuyTax,
  useWriteErc20Approve,
  useWriteIUniswapV2Router01SwapExactTokensForTokens,
} from '@/generated';
import { formatAxeUnits, formatStableUnits } from '@/utils/contract.utils';
import { TradeFormProps } from './AxeSwap';

type AxeOutput = {
  axeReceived: number;
  axeDonated: number;
};

const slippageTolerance = 100; //basispoints

const Buy: React.FC<TradeFormProps> = ({ reserves, swapBalance, axeBalance, onUpdate }) => {
  const account = useAccount();
  const [isUpdating, setIsUpdating] = useState<boolean>(false);
  const [exceedsAllowance, setExceedsAllowance] = useState<boolean>(false);
  const [showOutput, setShowOutput] = useState<boolean>(false);
  const [usdInput, setUsdInput] = useState<string>('');
  const [axeOutput, setAxeOutput] = useState<AxeOutput>({ axeReceived: 0, axeDonated: 0 });
  const [txNotificationKey, setTxNotificationKey] = useState<SnackbarKey | null>(null);

  /// WAGMI
  const { data: buyTax } = useReadAxeBuyTax({ address: ENV.axeTokenAddress });
  const { data: allowance, refetch: updateAllowance } = useReadErc20Allowance({
    address: ENV.axeSwapTokenAddress,
    args: [account.address as Address, ENV.uniswapV2RouterAddress],
  });
  const { data: amountOut } = useReadIUniswapV2Router02GetAmountOut({
    address: ENV.uniswapV2RouterAddress,
    args: [parseUnits(usdInput, 18), reserves.swap, reserves.axe],
  });
  const {
    data: swapHash,
    isPending: swapPending,
    writeContract: swap,
  } = useWriteIUniswapV2Router01SwapExactTokensForTokens();
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

  // apply buyTax on getAmountsOut estimate as the Axé donation is taken from the swap output
  useEffect(() => {
    if (amountOut && amountOut > 0n) {
      const axeOut = Number(formatUnits(amountOut, 18));
      setAxeOutput({
        axeReceived: buyTax && buyTax > 0 ? axeOut - (axeOut / 10000) * Number(buyTax.toString()) : axeOut,
        axeDonated: buyTax && buyTax > 0 ? (axeOut / 10000) * Number(buyTax.toString()) : 0,
      });
      setShowOutput(true);
    } else setShowOutput(false);
  }, [amountOut, buyTax]);

  // reactions to approve receipt outcome
  useEffect(() => {
    if (approveLoading) {
      setTxNotificationKey(
        enqueueSnackbar('Approval submitted. Please allow some time to confirm ...', {
          autoHideDuration: 12000,
        }),
      );
    } else if (approveSuccess) {
      if (txNotificationKey) {
        closeSnackbar(txNotificationKey);
        setTxNotificationKey(null);
      }
      enqueueSnackbar('Approval confirmed!');
      updateAllowance();
    } else if (approveError) {
      enqueueSnackbar(`The Approval has failed: ${approveError.message}`);
    }
  }, [approveLoading, approveSuccess, approveError, updateAllowance]);

  // reactions to swap receipt outcome
  useEffect(() => {
    if (swapLoading) {
      setTxNotificationKey(
        enqueueSnackbar('Swap submitted. Please allow some time to confirm ...', {
          autoHideDuration: 12000,
        }),
      );
    } else if (swapSuccess) {
      if (txNotificationKey) {
        closeSnackbar(txNotificationKey);
        setTxNotificationKey(null);
      }
      enqueueSnackbar('Swap confirmed!');
      onUpdate();
    } else if (swapError) {
      enqueueSnackbar(`The Swap has failed: ${swapError.message}`);
    }
  }, [swapLoading, swapSuccess, swapError]);

  useEffect(() => {
    if (allowance && allowance < parseUnits(usdInput, 18)) {
      setExceedsAllowance(true);
    } else setExceedsAllowance(false);
  }, [usdInput, allowance]);

  // TODO use simulate contract to prepare and only then enable the Buy / Approve button
  // TODO calculate price impact to show % price move and warn (https://stackoverflow.com/questions/74282316/uniswap-v2-pool-priceimpact#:~:text=You%20can%20calculate%20the%20price,is%20ETH%2C%20k%20is%202%2C000%2C000%2C000.)

  const handleSubmit = (values: FormValues, { setSubmitting }: FormikHelpers<FormValues>) => {
    try {
      const bigInput = parseUnits(values.amountIn.toString(), 18);
      if (exceedsAllowance) {
        approve({ address: ENV.axeSwapTokenAddress, args: [ENV.uniswapV2RouterAddress, bigInput] });
      } else {
        const deadline = Math.floor(Date.now() / 1000) + 60 * 20; // 20 minutes from the current Unix time
        //TODO check for slippage and warn / adjust tolerance or block
        swap({
          address: ENV.uniswapV2RouterAddress,
          args: [
            bigInput,
            parseUnits((axeOutput.axeReceived - (axeOutput.axeReceived / 10000) * slippageTolerance).toString(), 18),
            [ENV.axeSwapTokenAddress, ENV.axeTokenAddress],
            account.address!,
            BigInt(deadline),
          ],
        });
        formik.resetForm();
      }
    } catch (error) {
      console.error('Error during swap.', error);
      throw error;
    } finally {
      setSubmitting(false);
    }
  };

  interface FormValues {
    amountIn: string;
  }

  const validateForm = useCallback(
    async (values: FormValues): Promise<FormikErrors<FormValues>> => {
      const errors: FormikErrors<FormValues> = {};
      if (!!values.amountIn) {
        const bigAmount = parseUnits(values.amountIn.toString(), 18); // Note: explicit cast toString() required here!
        if (swapBalance && swapBalance < bigAmount) errors.amountIn = 'Available balance exceeded';
      }
      return errors;
    },
    [swapBalance],
  );

  const formik = useFormik<FormValues>({
    initialValues: {
      amountIn: '',
    },
    onSubmit: handleSubmit,
    validate: validateForm,
  });

  // debounce the input that leads to recalculations
  const handleChange = debounce((value: string) => {
    setUsdInput(value);
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
          disabled
          classNames={{ label: 'py-1', input: 'text-large' }}
          startContent={
            <div className="pointer-events-none flex items-center">
              <span className="text-large text-default-400">Axé</span>
            </div>
          }
          value={axeOutput.axeReceived > 0 ? axeOutput.axeReceived.toFixed(4).toLocaleString() : '0'}
          description={
            showOutput ? (
              <span>
                You are donating {Number(buyTax) / 100}% (
                {axeOutput.axeDonated < 1 ? '< 1' : Math.trunc(axeOutput.axeDonated)} Axé) to the{' '}
                <a href="https://axe.to.hns" className=" underline">
                  Axé DAO
                </a>
              </span>
            ) : (
              ''
            )
          }
        />
        <div>Your Balance: {formatAxeUnits(axeBalance)} Axé</div>

        <Button
          type="submit"
          className="mt-2 size-unit-lg w-full bg-green-500 text-large dark:bg-green-700"
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
