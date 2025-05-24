import { getServerSession } from 'next-auth';
import { NuqsAdapter } from 'nuqs/adapters/next/app';

import SessionProvider from './session.provider';
import UiProvider from './ui.provider';
import QueryProvider from './query.provider';
import SnackbarProvider from './snackbar.provider';
import Web3Provider from './wagmi.provider';
import StateProvider from './jotai.provider';
import { nextAuthOptions } from '@/config/next-auth-options';

const Providers = async ({ children }: { children: React.ReactNode }) => {
  const session = await getServerSession(nextAuthOptions);

  return (
    <SessionProvider session={session}>
      <UiProvider
        themeProps={{
          attribute: 'class',
          defaultTheme: 'dark',
          children: null,
        }}
      >
        <SnackbarProvider>
          <NuqsAdapter>
            {/* Note: Web3Provider and StateProvider rely on @tanstack/react-query. */}
            <QueryProvider>
              <Web3Provider>
                <StateProvider>{children}</StateProvider>
              </Web3Provider>
            </QueryProvider>
          </NuqsAdapter>
        </SnackbarProvider>
      </UiProvider>
    </SessionProvider>
  );
};

export default Providers;
