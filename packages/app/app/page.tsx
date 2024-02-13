'use client';

import { useReadContract, useAccount } from 'wagmi';
import { switchChain } from '@wagmi/core';
import { localhost } from 'wagmi/chains';

import { config as env } from '../config/environment';
import { abi } from '../../contracts/artifacts/contracts/AXE.sol/AXE.json';
import wagmiConfig from '@/config/wagmi';
import { Button } from '@nextui-org/button';

const switchNetwork = async () => {
  await switchChain(wagmiConfig, { chainId: localhost.id });
};

export default function Home() {
  const account = useAccount();
  // useEffect(() => {
  //   (async () => {
  //     await switchNetwork();
  //   })();
  // }, []);

  const axeBalance = useReadContract({
    address: env.axeTokenAddress as `0x${string}`,
    abi: abi,
    functionName: 'balanceOf',
    // args: [account.address],
    args: ['0x6EF543d0Cce1171F696f82cB6f698133037d5b32'],
    account: account.address,
  });

  return (
    <section className="flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <div className="inline-block max-w-lg justify-center text-center">
        {/* <div>AXÉ address: {env.axeTokenAddress}</div> */}
        {/* <div>ABI: {JSON.stringify(abi)}</div> */}
        <div>Chain: {account.chain?.name}</div>
        <div>Balance: {JSON.stringify(axeBalance)}</div>
        <div className="my-8 flex flex-col">
          <div className="flex">
            <div>Balance: </div>
            <div>{(axeBalance.data as string) || '0'} $AXÉ</div>
          </div>
        </div>
        <Button onClick={() => switchNetwork()}>Network</Button>
      </div>
    </section>
  );
}
