import { initSilk } from '@silk-wallet/silk-wallet-sdk';
import { SilkEthereumProviderInterface } from '@silk-wallet/silk-wallet-sdk/dist/lib/provider/types';
import { ChainNotConfiguredError, createConnector } from '@wagmi/core';
import { Chain, getAddress, SwitchChainError, UserRejectedRequestError } from 'viem';

import { SILK_METHOD } from '@silk-wallet/silk-interface-core';

export default function silk(referralCode?: string) {
  let silkProvider: SilkEthereumProviderInterface | null = null;

  return createConnector<SilkEthereumProviderInterface>((config) => ({
    id: 'silk',
    name: 'Silk Security Connector',
    type: 'Silk',
    async connect({ chainId } = {}) {
      try {
        config.emitter.emit('message', {
          type: 'connecting',
        });
        const provider = await this.getProvider();

        provider.on('accountsChanged', this.onAccountsChanged);
        provider.on('chainChanged', this.onChainChanged);
        provider.on('disconnect', this.onDisconnect.bind(this));

        if (!provider.connected) {
          try {
            provider.login();
          } catch (error) {
            console.error('Unable to login', error);
            throw new UserRejectedRequestError('User rejected login' as unknown as Error);
          }
        }

        let currentChainId = await this.getChainId();
        if (chainId && currentChainId !== chainId) {
          const chain = await this.switchChain!({ chainId }).catch((error) => {
            if (error.code === UserRejectedRequestError.code) throw error;
            return { id: currentChainId };
          });
          currentChainId = chain?.id ?? currentChainId;
        }

        const accounts = await this.getAccounts();

        return { accounts, chainId: currentChainId };
      } catch (error) {
        console.error('error while connecting', error);
        this.onDisconnect();
        throw new UserRejectedRequestError('Something went wrong' as unknown as Error);
      }
    },
    async getAccounts() {
      const provider = await this.getProvider();
      const accounts = await provider.request({
        method: SILK_METHOD.eth_accounts,
      });

      if (accounts && Array.isArray(accounts)) return accounts.map((x: string) => getAddress(x));
      return [];
    },
    async getChainId() {
      const provider = await this.getProvider();
      const chainId = await provider.request({ method: SILK_METHOD.eth_chainId });
      return Number(chainId);
    },

    async getProvider(): Promise<SilkEthereumProviderInterface> {
      if (silkProvider) {
        return silkProvider;
      }

      silkProvider = initSilk(referralCode);
      return silkProvider;
    },

    async isAuthorized() {
      try {
        const accounts = await this.getAccounts();
        return !!accounts.length;
      } catch {
        return false;
      }
    },
    async switchChain({ chainId }): Promise<Chain> {
      try {
        const chain = config.chains.find((x) => x.id === chainId);
        if (!chain) throw new SwitchChainError(new ChainNotConfiguredError());

        const provider = await this.getProvider();
        await provider.request({
          method: SILK_METHOD.wallet_addEthereumChain,
          params: [
            {
              chainId: `0x${chain.id.toString(16)}`,
              chainName: chain.name,
              rpcTarget: chain.rpcUrls.default.http[0],
              nativeCurrency: chain.nativeCurrency,
              logo: chain.nativeCurrency?.symbol,
              decimals: chain.nativeCurrency?.decimals || 18,
              ticker: chain.nativeCurrency?.symbol || 'ETH',
              tickerName: chain.nativeCurrency?.name || 'Ethereum',
              rpcUrls: chain.rpcUrls,
              blockExplorerUrls: chain.blockExplorers,
            },
          ],
        });
        console.info('Chain Added: ', chain.name);
        await provider.request({
          method: SILK_METHOD.wallet_switchEthereumChain,
          params: [`0x${chain.id.toString(16)}`],
        });
        console.info('Chain Switched to ', chain.name);
        config.emitter.emit('change', {
          chainId,
        });
        return chain;
      } catch (error: unknown) {
        console.error('Error: Cannot change chain', error);
        throw new SwitchChainError(error as Error);
      }
    },

    async disconnect(): Promise<void> {
      const provider = await this.getProvider();
      console.log('Disconnecting');
      // TODO: Silk does not have a logout method
      provider.uiMessageManager.removeListener('accountsChanged', this.onAccountsChanged);
      provider.uiMessageManager.removeListener('chainChanged', this.onChainChanged);
    },

    onAccountsChanged(accounts) {
      if (accounts.length === 0) config.emitter.emit('disconnect');
      else
        config.emitter.emit('change', {
          accounts: accounts.map((x) => getAddress(x)),
        });
    },

    onChainChanged(chain) {
      const chainId = Number(chain);
      config.emitter.emit('change', { chainId });
    },

    onDisconnect(): void {
      config.emitter.emit('disconnect');
    },
  }));
}
