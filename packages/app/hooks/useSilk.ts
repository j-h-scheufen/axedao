'use client';

import { useCallback, useEffect, useState } from 'react';
import { initSilk } from '@silk-wallet/silk-wallet-sdk';

const useSilk = () => {
  const [isInitialized, setIsInitialized] = useState(window.ethereum?.login === 'function');

  useEffect(() => {
    if (isInitialized) return;
    const silk = initSilk();
    window.ethereum = silk;
    setIsInitialized(true);
  }, [isInitialized]);

  const login = useCallback(async () => {
    try {
      if (!isInitialized) throw new Error('Silk is not initialized');
      await window.ethereum.loginSelector('silk');
    } catch (error) {
      console.log(error);
    }
  }, [isInitialized]);

  return { login, isInitialized };
};

export default useSilk;
