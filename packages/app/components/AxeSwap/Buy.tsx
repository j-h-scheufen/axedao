'use client';

import { useState, useEffect } from 'react';
import { debounce } from 'lodash';
import { parseUnits, formatUnits } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';

import ENV from '@/config/environment';
import {
  useReadIUniswapV2Router02GetAmountsOut,
  useWriteIUniswapV2Router01SwapExactTokensForTokens,
  useReadAxeBuyTax,
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
  const [usdInput, setUsdInput] = useState<string>('');
  const [axeOutput, setAxeOutput] = useState<AxeOutput>({ axeReceived: 0, axeDonated: 0 });
  const [showOutput, setShowOutput] = useState<boolean>(false);
  const { data: buyTax } = useReadAxeBuyTax({ address: ENV.axeTokenAddress });
  const { data: amountOut } = useReadIUniswapV2Router02GetAmountsOut({
    address: ENV.uniswapV2RouterAddress,
    args: [parseUnits(usdInput, 18), [ENV.axeSwapTokenAddress, ENV.axeTokenAddress]],
  });

  const { data: hash, isPending, writeContract: swap } = useWriteIUniswapV2Router01SwapExactTokensForTokens();
  const { isLoading, isSuccess, error: swapError } = useWaitForTransactionReceipt({ hash });

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

  useEffect(() => {
    onUpdate();
  }, [isSuccess, onUpdate]);

  const updateUsdInput = debounce((value: string) => {
    setUsdInput(value);
    setIsUpdating(false);
  }, 1000);

  const submit = () => {
    try {
      setIsSubmitting(true);
      const deadline = Math.floor(Date.now() / 1000) + 60 * 20; // 20 minutes from the current Unix time
      //TODO check for slippage and warn
      swap({
        address: ENV.uniswapV2RouterAddress,
        args: [
          parseUnits(usdInput, 18),
          parseUnits((axeOutput.axeReceived - axeOutput.axeReceived / slippageTolerance).toString(), 18), //
          [ENV.axeSwapTokenAddress, ENV.axeTokenAddress],
          account.address!,
          BigInt(deadline),
        ],
      });
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
        classNames={{ label: 'py-1', input: 'text-large number-to-text' }}
        startContent={
          <div className="pointer-events-none flex items-center">
            <span className="text-large text-default-400">$</span>
          </div>
        }
        onValueChange={(value: string) => {
          setIsUpdating(true);
          updateUsdInput(value);
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
        disabled={isPending || isUpdating}
        isLoading={isSubmitting}
        onClick={submit}
      >
        {isPending ? 'Confirming...' : isUpdating ? 'Updating ...' : 'Buy'}
      </Button>
      <div>
        {hash && <div className="mt-4">TX Receipt: {hash}</div>}
        {isLoading && <div className="mt-4">Waiting for confirmation...</div>}
        {isSuccess && <div className="mt-4">Transaction confirmed.</div>}
        {swapError && <div className="mt-4">Transaction failed: {swapError.message}</div>}
      </div>
    </div>
  );
};

export default Buy;
