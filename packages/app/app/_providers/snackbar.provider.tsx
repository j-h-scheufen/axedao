'use client';

import { PropsWithChildren } from 'react';
import { SnackbarProvider } from 'notistack';

export function Provider({ children }: PropsWithChildren) {
  return (
    <SnackbarProvider autoHideDuration={5000} anchorOrigin={{ horizontal: 'right', vertical: 'bottom' }}>
      {children}
    </SnackbarProvider>
  );
}
