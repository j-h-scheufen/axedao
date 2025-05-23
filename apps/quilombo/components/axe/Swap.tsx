'use client';

import { Card, CardBody, Tab, Tabs } from '@heroui/react';
import { useCallback, useEffect, useState } from 'react';
import type { Address } from 'viem';
import { useAccount } from 'wagmi';

import ENV from '@/config/environment';
import { useReadErc20BalanceOf, useReadIUniswapV2PairGetReserves, useReadIUniswapV2PairToken0 } from '@/generated';
import Buy from './Buy';
import Sell from './Sell';

export type Reserves = { axe: bigint; swap: bigint; rate: number };

export type TradeFormProps = {
  reserves: Reserves;
  swapBalance?: bigint;
  axeBalance?: bigint;
  onUpdate: () => void;
};

const Swap: React.FC = () => {
  const account = useAccount();

  const { data: token0 } = useReadIUniswapV2PairToken0({ address: ENV.uniswapV2PairAddress });
  const { data: reservesResult, refetch: updateReserves } = useReadIUniswapV2PairGetReserves({
    address: ENV.uniswapV2PairAddress,
  });

  const [reserves, setReserves] = useState<Reserves>({
    axe: BigInt(0),
    swap: BigInt(0),
    rate: 0,
  });

  // set reserves and swap rate and determine token indexes
  useEffect(() => {
    if (reservesResult) {
      const reserves: Reserves =
        ENV.axeTokenAddress == token0
          ? { axe: reservesResult[0], swap: reservesResult[1], rate: 0 }
          : { axe: reservesResult[1], swap: reservesResult[0], rate: 0 };
      reserves.rate = reserves.axe > 0 ? Number((reserves.swap * 1000000n) / reserves.axe) / 1000000 : 0; // the multiplier determines the decimal precision!
      setReserves(reserves);
    }
  }, [reservesResult, token0]);

  const { data: axeBalance, refetch: updateAxeBalance } = useReadErc20BalanceOf({
    address: ENV.axeTokenAddress,
    args: [account.address as Address],
  });

  const { data: swapBalance, refetch: updateSwapBalance } = useReadErc20BalanceOf({
    address: ENV.axeSwapTokenAddress,
    args: [account.address as Address],
  });

  const update = useCallback(async () => {
    return Promise.all([updateAxeBalance(), updateSwapBalance(), updateReserves()]);
  }, [updateAxeBalance, updateSwapBalance, updateReserves]);

  return (
    <div className="inline-block w-full max-w-lg">
      <Tabs size="lg" aria-label="Buy / Sell Tabs" fullWidth>
        <Tab key="buy" title="Buy">
          <Card>
            <CardBody>
              <Buy reserves={reserves} axeBalance={axeBalance} swapBalance={swapBalance} onUpdate={update} />
            </CardBody>
          </Card>
        </Tab>
        <Tab key="sell" title="Sell">
          <Card>
            <CardBody>
              <Sell reserves={reserves} axeBalance={axeBalance} swapBalance={swapBalance} onUpdate={update} />
            </CardBody>
          </Card>
        </Tab>
      </Tabs>
    </div>
  );
};

export default Swap;
