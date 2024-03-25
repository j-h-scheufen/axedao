'use client';

import { useState, useEffect } from 'react';
import { debounce } from 'lodash';
import { parseUnits, formatUnits, Address } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { enqueueSnackbar, closeSnackbar, SnackbarKey } from 'notistack';

import ENV from '@/config/environment';
import {
  useReadIUniswapV2Router02GetAmountsOut,
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
  const [isSubmitting, setIsSubmitting] = useState<boolean>(false);
  const [isUpdating, setIsUpdating] = useState<boolean>(false);
  const [exceedsAllowance, setExceedsAllowance] = useState<boolean>(false);
  const [exceedsBalance, setExceedsBalance] = useState<boolean>(false);
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
  const { data: amountOut } = useReadIUniswapV2Router02GetAmountsOut({
    address: ENV.uniswapV2RouterAddress,
    args: [parseUnits(usdInput, 18), [ENV.axeSwapTokenAddress, ENV.axeTokenAddress]],
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

  useEffect(() => {
    if (amountOut && amountOut.length > 1 && amountOut[1] > 0) {
      const axeOut = Number(formatUnits(amountOut[1], 18));
      setAxeOutput({
        axeReceived: buyTax && buyTax > 0 ? axeOut - (axeOut / 10000) * Number(buyTax.toString()) : axeOut,
        axeDonated: buyTax && buyTax > 0 ? (axeOut / 10000) * Number(buyTax.toString()) : 0,
      });
      setShowOutput(true);
    } else setShowOutput(false);
  }, [amountOut, buyTax]);

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

  useEffect(() => {
    if (allowance && allowance < parseUnits(usdInput, 18)) {
      setExceedsAllowance(true);
    } else setExceedsAllowance(false);
  }, [usdInput, allowance]);

  // TODO use simulate contract to prepare and only then enable the Buy / Approve button
  // TODO calculate price impact to show % price move and warn (https://stackoverflow.com/questions/74282316/uniswap-v2-pool-priceimpact#:~:text=You%20can%20calculate%20the%20price,is%20ETH%2C%20k%20is%202%2C000%2C000%2C000.)

  // debouncing the usd input
  const updateInput = debounce((value: string) => {
    setUsdInput(value);
    if (swapBalance && swapBalance < parseUnits(value, 18)) {
      setExceedsBalance(true);
    } else setExceedsBalance(false);
    setIsUpdating(false);
  }, 1000);

  const submit = () => {
    try {
      setIsSubmitting(true);
      const bigInput = parseUnits(usdInput, 18);
      if (exceedsAllowance) {
        approve({ address: ENV.axeSwapTokenAddress, args: [ENV.uniswapV2RouterAddress, bigInput] });
      } else {
        const deadline = Math.floor(Date.now() / 1000) + 60 * 20; // 20 minutes from the current Unix time
        //TODO check for slippage and warn / adjust tolerance or block
        swap({
          address: ENV.uniswapV2RouterAddress,
          args: [
            parseUnits(usdInput, 18),
            parseUnits((axeOutput.axeReceived - axeOutput.axeReceived / slippageTolerance).toString(), 18),
            [ENV.axeSwapTokenAddress, ENV.axeTokenAddress],
            account.address!,
            BigInt(deadline),
          ],
        });
      }
    } catch (error) {
      console.error('Error during swap.', error);
      throw error;
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="flex w-auto flex-col items-center gap-2">
      <div>Your Balance: ${formatStableUnits(swapBalance)}</div>
      <Input
        label="You pay"
        type="number"
        placeholder="0.00"
        size="lg"
        isInvalid={exceedsBalance}
        errorMessage={exceedsBalance ? 'Input exceeds balance' : undefined}
        classNames={{ label: 'py-1', input: 'text-large number-to-text' }}
        startContent={
          <div className="pointer-events-none flex items-center">
            <span className="text-large text-default-400">$</span>
          </div>
        }
        onValueChange={(value: string) => {
          setIsUpdating(true);
          updateInput(value);
        }}
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
        className="mt-2 size-unit-lg w-full bg-green-500 text-large dark:bg-green-700"
        isDisabled={swapPending || approvePending || isUpdating || exceedsBalance}
        isLoading={isSubmitting}
        onClick={submit}
      >
        {swapPending ? 'Confirming...' : isUpdating ? 'Updating ...' : exceedsAllowance ? 'Approve' : 'Buy'}
      </Button>
    </div>
  );
};

export default Buy;
