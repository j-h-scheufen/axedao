import SessionProvider from './session.provider';
import UiProvider from './ui.provider';
import QueryProvider from './query.provider';
import SnackbarProvider from './snackbar.provider';
import Web3Provider from './wagmi.provider';
import StateProvider from './jotai.provider';

export default async function Providers({ children }: { children: React.ReactNode }) {
  return (
    <SessionProvider>
      <UiProvider
        themeProps={{
          attribute: 'class',
          defaultTheme: 'dark',
          children: null,
        }}
      >
        <SnackbarProvider>
          <QueryProvider>
            {/* Note: Web3Provider and StateProvider rely on @tanstack/react-query. */}
            <Web3Provider>
              <StateProvider>{children}</StateProvider>
            </Web3Provider>
          </QueryProvider>
        </SnackbarProvider>
      </UiProvider>
    </SessionProvider>
  );
}
