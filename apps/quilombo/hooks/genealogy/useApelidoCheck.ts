'use client';

import { debounce } from 'lodash';
import { useCallback, useEffect, useMemo, useState } from 'react';

import type { ApelidoCheckResult } from '@/db';

/** Debounce delay for apelido checking (ms) */
const APELIDO_CHECK_DEBOUNCE = 800;

type UseApelidoCheckOptions = {
  /** Profile ID to exclude from check (for edits) */
  excludeProfileId?: string;
  /** Whether to enable checking */
  enabled?: boolean;
};

type UseApelidoCheckReturn = {
  /** Current check result */
  result: ApelidoCheckResult | null;
  /** Whether a check is in progress */
  isChecking: boolean;
  /** Error message if check failed */
  error: string | null;
  /** Trigger a check with current values */
  checkApelido: (apelido: string, apelidoContext?: string | null) => void;
  /** Clear the current result */
  clearResult: () => void;
};

/**
 * Hook for debounced apelido uniqueness checking.
 *
 * @param options - Configuration options
 * @returns Check result, loading state, and trigger function
 *
 * @example
 * ```tsx
 * const { result, isChecking, checkApelido } = useApelidoCheck();
 *
 * // Call on input change (debounced internally)
 * checkApelido(values.apelido, values.apelidoContext);
 *
 * // Check result
 * if (result?.requiresContext) {
 *   // Show context field
 * }
 * if (!result?.isAvailable) {
 *   // Show error
 * }
 * ```
 */
export function useApelidoCheck(options: UseApelidoCheckOptions = {}): UseApelidoCheckReturn {
  const { excludeProfileId, enabled = true } = options;

  const [result, setResult] = useState<ApelidoCheckResult | null>(null);
  const [isChecking, setIsChecking] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // The actual API call
  const performCheck = useCallback(
    async (apelido: string, apelidoContext?: string | null) => {
      if (!apelido.trim()) {
        setResult(null);
        setError(null);
        return;
      }

      setIsChecking(true);
      setError(null);

      try {
        const response = await fetch('/api/genealogy/persons/check-apelido', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            apelido: apelido.trim(),
            apelidoContext: apelidoContext?.trim() || null,
            excludeProfileId,
          }),
        });

        if (!response.ok) {
          const data = await response.json();
          throw new Error(data.error || 'Failed to check apelido');
        }

        const data: ApelidoCheckResult = await response.json();
        setResult(data);
      } catch (err) {
        console.error('Error checking apelido:', err);
        setError(err instanceof Error ? err.message : 'Failed to check apelido');
        setResult(null);
      } finally {
        setIsChecking(false);
      }
    },
    [excludeProfileId]
  );

  // Debounced version of the check
  const debouncedCheck = useMemo(
    () =>
      debounce((apelido: string, apelidoContext?: string | null) => {
        performCheck(apelido, apelidoContext);
      }, APELIDO_CHECK_DEBOUNCE),
    [performCheck]
  );

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      debouncedCheck.cancel();
    };
  }, [debouncedCheck]);

  // Public check function
  const checkApelido = useCallback(
    (apelido: string, apelidoContext?: string | null) => {
      if (!enabled) return;

      // Show checking state immediately
      if (apelido.trim()) {
        setIsChecking(true);
      }

      debouncedCheck(apelido, apelidoContext);
    },
    [enabled, debouncedCheck]
  );

  const clearResult = useCallback(() => {
    debouncedCheck.cancel();
    setResult(null);
    setError(null);
    setIsChecking(false);
  }, [debouncedCheck]);

  return {
    result,
    isChecking,
    error,
    checkApelido,
    clearResult,
  };
}

export default useApelidoCheck;
