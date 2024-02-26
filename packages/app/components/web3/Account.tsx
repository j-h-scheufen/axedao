'use client';

import { useAccount, useAccountEffect, useConnect, useDisconnect, useEnsAvatar, useEnsName } from 'wagmi';
import { localhost } from 'wagmi/chains';
import { injected } from 'wagmi/connectors';
import { Image } from '@nextui-org/image';
import { Button } from '@nextui-org/button';

// import { config as env } from '@/config/environment';

const Account: React.FC = () => {
  const account = useAccount();
  const { connect } = useConnect();
  const { disconnect } = useDisconnect();
  const { data: ensName } = useEnsName({ address: account.address });
  const { data: ensAvatar } = useEnsAvatar({ name: ensName! });

  useAccountEffect({
    onConnect(data) {
      console.log('Connected!', data);
    },
    onDisconnect() {
      console.log('Disconnected!');
    },
  });

  return account?.isConnected && account.address ? (
    <div>
      {ensAvatar && <Image alt="ENS Avatar" src={ensAvatar} />}
      {account.address && <div>{ensName ? `${ensName} (${account.address})` : account.address}</div>}
      <button onClick={() => disconnect()}>Disconnect</button>
    </div>
  ) : (
    <Button
      onClick={() => {
        try {
          window.ethereum.login().then(() => connect({ connector: injected(), chainId: localhost.id }));
        } catch (error) {
          console.warn('Login aborted.', error);
        }
      }}
    >
      Signup / Login
    </Button>
  );
};

// Login modal with other login options
// window.ethereum
// .loginSelector()
// .then((value: 'silk' | 'injected' | 'walletconnect') => {
//   if (value === 'walletconnect')
//     connect({
//       connector: walletConnect({
//         projectId: env.walletConnectProjectId,
//       }),
//     });
//   else connect({ connector: injected() });
// });

export default Account;
