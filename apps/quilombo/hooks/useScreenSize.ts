'use client';

import { useState, useEffect } from 'react';

const useScreenSize = () => {
  // Use consistent default values for SSR to avoid hydration mismatch
  const [screenSize, setScreenSize] = useState<{
    width: number;
    height: number;
  }>({
    width: 390,
    height: 844,
  });

  useEffect(() => {
    const handleResize = () => {
      setScreenSize({
        width: window.innerWidth,
        height: window.innerHeight,
      });
    };

    // Set actual size on mount
    handleResize();
    window.addEventListener('resize', handleResize);

    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, []);

  return screenSize;
};

export default useScreenSize;
