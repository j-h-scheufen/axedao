'use client';

import { useEffect, useState } from 'react';
import { useAccount } from 'wagmi';
import { Card, CardBody } from '@nextui-org/card';
import { Tabs, Tab } from '@nextui-org/tabs';
import { Address } from 'viem';

import ENV from '@/config/environment';
import Buy from '@/components/AxeSwap/Buy';
import { useReadIUniswapV2PairGetReserves, useReadIUniswapV2PairToken0, useReadErc20BalanceOf } from '@/generated';

export type Reserves = { axe: bigint; swap: bigint; rate: number };

export type TradeFormProps = {
  reserves: Reserves;
  swapBalance?: bigint;
  axeBalance?: bigint;
  onUpdate: () => void;
};

const AxeSwap: React.FC = () => {
  const account = useAccount();

  const { data: token0 } = useReadIUniswapV2PairToken0({ address: ENV.uniswapV2PairAddress });
  const { data: reservesResult } = useReadIUniswapV2PairGetReserves({ address: ENV.uniswapV2PairAddress });

  const [reserves, setReserves] = useState<Reserves>({ axe: BigInt(0), swap: BigInt(0), rate: 0 });

  useEffect(() => {
    if (reservesResult) {
      const reserves: Reserves =
        ENV.axeTokenAddress == token0
          ? { axe: reservesResult[0], swap: reservesResult[1], rate: 0 }
          : { axe: reservesResult[1], swap: reservesResult[0], rate: 0 };
      reserves.rate = reserves.axe > 0 ? Number((reserves.swap * 10000n) / reserves.axe) / 10000 : 0;
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

  const update = () => {
    updateAxeBalance();
    updateSwapBalance();
  };

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
        <Tab key="sell" title="Sell"></Tab>
      </Tabs>
    </div>
  );
};

export default AxeSwap;
