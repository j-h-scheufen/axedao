'use client';

import { useState, useEffect } from 'react';
import { Button, Modal, ModalContent, ModalHeader, ModalBody, ModalFooter } from '@heroui/react';
import { useAccount } from 'wagmi';
import { useMutation } from '@tanstack/react-query';
import { useSession } from 'next-auth/react';
import { enqueueSnackbar } from 'notistack';

import useAuth from '@/hooks/useAuth';

import ErrorText from './ErrorText';

interface WalletRequiredModalProps {
  isOpen: boolean;
  onClose: () => void;
  onWalletConnected?: () => void;
  hasWallet?: boolean; // Whether user already has wallet linked in DB
}

/**
 * Modal that prompts users to connect a Human Wallet when trying to use
 * features that require blockchain transactions.
 *
 * Handles two scenarios:
 * 1. No wallet linked (hasWallet=false): Connect AND link wallet to account
 *    - After linking, the session is refreshed to include the new wallet address
 * 2. Wallet linked but not connected (hasWallet=true): Just connect, no linking needed
 *
 * Provides two options:
 * 1. Connect Wallet - Initiates wallet connection (and linking if needed)
 * 2. Cancel - Close modal without connecting
 *
 * After successful connection, executes optional callback (useful for
 * continuing the action that triggered the modal).
 */
const WalletRequiredModal = ({ isOpen, onClose, onWalletConnected, hasWallet = false }: WalletRequiredModalProps) => {
  const { connect } = useAuth();
  const { address, isConnected } = useAccount();
  const { update: updateSession } = useSession();
  const [error, setError] = useState<string | null>(null);
  const [isConnecting, setIsConnecting] = useState(false);
  const [waitingForWallet, setWaitingForWallet] = useState(false);

  // Link wallet mutation
  const linkWalletMutation = useMutation({
    mutationFn: async (walletAddress: string) => {
      const response = await fetch('/api/auth/link-wallet', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ walletAddress }),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'Failed to link wallet');
      return data;
    },
    onSuccess: async () => {
      // Refresh session to include newly linked wallet address
      await updateSession();
      enqueueSnackbar('Wallet connected successfully', { variant: 'success' });
      setError(null);
      setIsConnecting(false);
      setWaitingForWallet(false);
      onClose();
      // Execute callback after successful connection (e.g., retry the protected action)
      if (onWalletConnected) {
        onWalletConnected();
      }
    },
    onError: async (error: Error) => {
      // Handle case where wallet is already linked but session hasn't propagated yet
      // This can happen if user re-clicks the protected action quickly after linking
      if (
        error.message.includes('already linked') ||
        error.message.includes('already in use') ||
        error.message.includes('already associated')
      ) {
        // Wallet is already linked in DB, just refresh session and close
        await updateSession();
        enqueueSnackbar('Wallet connected successfully', { variant: 'success' });
        setError(null);
        setIsConnecting(false);
        setWaitingForWallet(false);
        onClose();
        if (onWalletConnected) {
          onWalletConnected();
        }
      } else {
        // Real error - show to user
        setError(error.message);
        setIsConnecting(false);
        setWaitingForWallet(false);
      }
    },
  });

  // Reactively handle wallet connection - triggered when wagmi detects connected wallet
  useEffect(() => {
    // Only proceed if we're actively waiting for wallet connection
    if (!waitingForWallet) return;

    // Check if wallet is now connected with an address
    if (isConnected && address) {
      setWaitingForWallet(false);

      if (hasWallet) {
        // Wallet already linked in session, just connecting is enough
        enqueueSnackbar('Wallet connected successfully', { variant: 'success' });
        setError(null);
        setIsConnecting(false);
        onClose();
        if (onWalletConnected) {
          onWalletConnected();
        }
      } else {
        // No wallet linked, need to link it
        linkWalletMutation.mutate(address);
      }
    }
  }, [waitingForWallet, isConnected, address, hasWallet, onClose, onWalletConnected, linkWalletMutation]);

  const handleConnectWallet = async () => {
    try {
      setError(null);
      setIsConnecting(true);

      // Connect wallet via useAuth - this will trigger Human Wallet UI
      await connect();

      // Set flag to watch for wallet connection via useEffect
      // The useEffect will reactively handle the connection when wagmi detects it
      setWaitingForWallet(true);
    } catch (_err) {
      setIsConnecting(false);
      setWaitingForWallet(false);
      setError('Failed to connect wallet. Please try again.');
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} size="md">
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1">
          <h3 className="text-2xl text-center">Wallet Required</h3>
        </ModalHeader>
        <ModalBody className="gap-4">
          <p className="text-default-600 text-center">
            This feature requires a digital wallet to perform blockchain transactions.
          </p>

          <div className="bg-default-100 rounded-lg p-4 text-sm">
            <p className="font-semibold mb-2">What is Human Wallet?</p>
            <p className="text-default-600">
              A secure wallet for the Axé community that lets you participate in governance and receive Axé tokens.
            </p>
          </div>

          <div className="bg-primary-50 rounded-lg p-4 text-sm">
            <p className="font-semibold mb-2 text-primary-700">What happens next?</p>
            <p className="text-primary-700 mb-2">You'll be asked to authenticate with Human Wallet to unlock it.</p>
            <p className="text-primary-700 text-xs">
              <strong>Tip:</strong> Use the same email or Google account you used for Quilombo for easier account
              management.
            </p>
          </div>

          {error && <ErrorText message={error} />}
        </ModalBody>
        <ModalFooter className="flex flex-col sm:flex-row gap-2">
          <Button variant="flat" onPress={onClose} className="w-full sm:w-auto">
            Cancel
          </Button>
          <Button
            color="primary"
            onPress={handleConnectWallet}
            isLoading={isConnecting || linkWalletMutation.isPending}
            className="w-full sm:w-auto"
          >
            Connect Wallet
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default WalletRequiredModal;
