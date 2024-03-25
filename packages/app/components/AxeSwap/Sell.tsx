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
  useReadIUniswapV2Router02GetAmountOut,
  useReadErc20Allowance,
  useReadAxeSellTax,
  useWriteErc20Approve,
  useWriteIUniswapV2Router01SwapExactTokensForTokens,
} from '@/generated';
import { formatAxeUnits, formatStableUnits } from '@/utils/contract.utils';
import { TradeFormProps } from './AxeSwap';

type SwapOutput = {
  swapReceived: number;
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
  const [amountIn, setAmountIn] = useState<string>('');
  const [taxedInput, setTaxedInput] = useState<bigint>(0n);
  const [swapOutput, setSwapOutput] = useState<SwapOutput>({ swapReceived: 0, axeDonated: 0 });
  const [txNotificationKey, setTxNotificationKey] = useState<SnackbarKey | null>(null);

  /// WAGMI
  const { data: sellTax } = useReadAxeSellTax({ address: ENV.axeTokenAddress });
  const { data: allowance, refetch: updateAllowance } = useReadErc20Allowance({
    address: ENV.axeTokenAddress,
    args: [account.address as Address, ENV.uniswapV2RouterAddress],
  });
  const { data: amountOut } = useReadIUniswapV2Router02GetAmountOut({
    address: ENV.uniswapV2RouterAddress,
    args: [taxedInput, reserves.swap, reserves.axe],
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

  // apply sellTax on getAmountsOut estimate as the Axé is taken from the swap output
  useEffect(() => {
    if (amountOut && amountOut > 0n) {
      setSwapOutput({
        ...swapOutput,
        swapReceived: Number(formatUnits(amountOut, 18)),
      });
      setShowOutput(true);
    } else setShowOutput(false);
  }, [amountOut]);

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
    if (allowance && allowance < parseUnits(amountIn, 18)) {
      setExceedsAllowance(true);
    } else setExceedsAllowance(false);
  }, [amountIn, allowance]);

  // TODO use simulate contract to prepare and only then enable the Buy / Approve button
  // TODO calculate price impact to show % price move and warn (https://stackoverflow.com/questions/74282316/uniswap-v2-pool-priceimpact#:~:text=You%20can%20calculate%20the%20price,is%20ETH%2C%20k%20is%202%2C000%2C000%2C000.)

  // debouncing the input
  const updateInput = debounce((value: string) => {
    setAmountIn(value);
    const bigInput = parseUnits(value, 18);
    setSwapOutput({
      ...swapOutput,
      axeDonated: sellTax && sellTax > 0 ? Number(formatUnits((bigInput / 10000n) * sellTax, 18)) : 0,
    });
    setTaxedInput(sellTax && sellTax > 0 ? bigInput - (bigInput / 10000n) * sellTax : bigInput);
    if (axeBalance && axeBalance < bigInput) {
      setExceedsBalance(true);
    } else setExceedsBalance(false);
    setIsUpdating(false);
  }, 1000);

  const submit = () => {
    try {
      setIsSubmitting(true);
      const bigInput = parseUnits(amountIn, 18);
      if (exceedsAllowance) {
        approve({ address: ENV.axeTokenAddress, args: [ENV.uniswapV2RouterAddress, bigInput] });
      } else {
        const deadline = Math.floor(Date.now() / 1000) + 60 * 20; // 20 minutes from the current Unix time
        //TODO check for slippage and warn / adjust tolerance or block
        swap({
          address: ENV.uniswapV2RouterAddress,
          args: [
            bigInput,
            parseUnits(
              (swapOutput.swapReceived - (swapOutput.swapReceived / 10000) * slippageTolerance).toString(),
              18,
            ),
            [ENV.axeTokenAddress, ENV.axeSwapTokenAddress],
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
      <div>Your Balance: {formatAxeUnits(axeBalance)} Axé</div>
      <Input
        label="You pay"
        type="number"
        placeholder="0"
        size="lg"
        isInvalid={exceedsBalance}
        errorMessage={exceedsBalance ? 'Input exceeds balance' : undefined}
        classNames={{ label: 'py-1', input: 'text-large number-to-text' }}
        startContent={
          <div className="pointer-events-none flex items-center">
            <span className="text-large text-default-400">Axé</span>
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
            <span className="text-large text-default-400">$</span>
          </div>
        }
        value={swapOutput.swapReceived > 0 ? swapOutput.swapReceived.toFixed(4).toLocaleString() : '0'}
        description={
          showOutput ? (
            <span>
              You are donating {Number(sellTax) / 100}% (
              {swapOutput.axeDonated < 1 ? '< 1' : Math.trunc(swapOutput.axeDonated)} Axé) to the{' '}
              <a href="https://axe.to.hns" className=" underline">
                Axé DAO
              </a>
            </span>
          ) : (
            ''
          )
        }
      />
      <div>Your Balance: ${formatStableUnits(swapBalance)}</div>

      <Button
        className="mt-2 size-unit-lg w-full bg-orange-200 text-large dark:bg-orange-700"
        isDisabled={swapPending || approvePending || isUpdating || exceedsBalance}
        isLoading={isSubmitting}
        onClick={submit}
      >
        {swapPending ? 'Confirming...' : isUpdating ? 'Updating ...' : exceedsAllowance ? 'Approve' : 'Sell'}
      </Button>
    </div>
  );
};

export default Buy;
