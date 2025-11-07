'use client';

import { SnackbarProvider } from 'notistack';
import type { PropsWithChildren } from 'react';

export default function Provider({ children }: PropsWithChildren) {
  return (
    <SnackbarProvider autoHideDuration={5000} anchorOrigin={{ horizontal: 'center', vertical: 'bottom' }} maxSnack={3}>
      {children}
    </SnackbarProvider>
  );
}
