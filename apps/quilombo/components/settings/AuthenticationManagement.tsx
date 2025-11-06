'use client';

import { useState, useEffect, useRef } from 'react';
import {
  Button,
  Divider,
  Chip,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Input,
  useDisclosure,
} from '@heroui/react';
import { signIn as nextAuthSignIn, useSession } from 'next-auth/react';
import { useAccount } from 'wagmi';
import { Formik, Form } from 'formik';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { enqueueSnackbar } from 'notistack';
import { setCookie } from 'cookies-next';

import { AUTH_COOKIES } from '@/config/constants';
import {
  changePasswordSchema,
  setPasswordSchema,
  type ChangePasswordForm,
  type SetPasswordForm,
  type AuthMethod,
} from '@/config/validation-schema';
import useAuth from '@/hooks/useAuth';
import { useFetchAuthMethods } from '@/query/currentUser';
import { QUERY_KEYS } from '@/query';

import ErrorText from '../ErrorText';

const AuthenticationManagement = () => {
  const { data: session } = useSession();
  const { address } = useAccount();
  const { connect } = useAuth();
  const queryClient = useQueryClient();
  const changePasswordModal = useDisclosure();
  const linkGoogleModal = useDisclosure();
  const removeAuthModal = useDisclosure();

  const [authMethodToRemove, setAuthMethodToRemove] = useState<AuthMethod | null>(null);
  const [error, setError] = useState<string | null>(null);
  const isLinkingWallet = useRef(false);

  // Fetch user's current auth methods
  const { data: authMethods, isLoading } = useFetchAuthMethods();

  // Change/Set password mutation
  const changePasswordMutation = useMutation({
    mutationFn: async (values: ChangePasswordForm | SetPasswordForm) => {
      const response = await fetch('/api/auth/change-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(values),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'Failed to change password');
      return data;
    },
    onSuccess: () => {
      const message = authMethods?.hasPassword ? 'Password changed successfully' : 'Password set successfully';
      enqueueSnackbar(message, { variant: 'success' });
      changePasswordModal.onClose();
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
      setError(null); // Clear errors on success
    },
    onError: (error: Error) => {
      setError(error.message);
    },
  });

  // Link Google account
  const handleLinkGoogle = async () => {
    setError(null); // Clear any previous errors
    linkGoogleModal.onClose();

    if (!session?.user?.id) {
      setError('No active session found');
      return;
    }

    // Set cookies to indicate this is intentional linking from Settings by logged-in user
    setCookie(AUTH_COOKIES.GOOGLE_LINKING, 'true', { maxAge: 300 }); // 5 minutes
    setCookie(AUTH_COOKIES.GOOGLE_LINKING_USER, session.user.id, { maxAge: 300 }); // 5 minutes
    await nextAuthSignIn('google', { callbackUrl: window.location.href });
  };

  // Link wallet - either connects wallet first, or directly links if already connected
  const handleLinkWallet = async () => {
    setError(null); // Clear any previous errors

    // If wallet is already connected (from previous session), directly link it
    if (address) {
      try {
        const response = await fetch('/api/auth/link-wallet', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ walletAddress: address }),
        });
        const data = await response.json();
        if (!response.ok) {
          throw new Error(data.error || 'Failed to link wallet');
        }
        queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
        enqueueSnackbar('Wallet linked successfully', { variant: 'success' });
      } catch (err) {
        const errorMessage = err instanceof Error ? err.message : 'Failed to link wallet';
        enqueueSnackbar(errorMessage, { variant: 'error' });
        setError(errorMessage);
      }
    } else {
      // No wallet connected yet, trigger connection flow
      isLinkingWallet.current = true;
      await connect();
    }
  };

  // Auto-link wallet when address becomes available after connecting
  useEffect(() => {
    if (isLinkingWallet.current && address && !authMethods?.hasWallet) {
      const linkWallet = async () => {
        try {
          const response = await fetch('/api/auth/link-wallet', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ walletAddress: address }),
          });
          const data = await response.json();
          if (!response.ok) {
            throw new Error(data.error || 'Failed to link wallet');
          }
          queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
          enqueueSnackbar('Wallet linked successfully', { variant: 'success' });
          isLinkingWallet.current = false;
        } catch (err) {
          const errorMessage = err instanceof Error ? err.message : 'Failed to link wallet';
          enqueueSnackbar(errorMessage, { variant: 'error' });
          setError(errorMessage);
          isLinkingWallet.current = false;
        }
      };
      linkWallet();
    }
  }, [address, authMethods?.hasWallet, queryClient]);

  // Remove auth method
  const removeAuthMutation = useMutation({
    mutationFn: async (method: AuthMethod) => {
      const response = await fetch(`/api/auth/remove-method`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ method }),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'Failed to remove auth method');
      return data;
    },
    onSuccess: () => {
      enqueueSnackbar('Authentication method removed', { variant: 'success' });
      queryClient.invalidateQueries({ queryKey: [QUERY_KEYS.currentUser.getAuthMethods] });
      removeAuthModal.onClose();
      setAuthMethodToRemove(null);
      setError(null); // Clear errors on success
    },
    onError: (error: Error) => {
      setError(error.message);
    },
  });

  const handleRemoveAuth = (method: AuthMethod) => {
    setError(null); // Clear any previous errors
    setAuthMethodToRemove(method);
    removeAuthModal.onOpen();
  };

  if (isLoading) {
    return <div>Loading authentication methods...</div>;
  }

  if (!authMethods) {
    return <div>Failed to load authentication methods</div>;
  }

  const activeMethodsCount = [authMethods.hasPassword, authMethods.hasGoogle, authMethods.hasWallet].filter(
    Boolean
  ).length;
  const canRemoveMethod = activeMethodsCount > 1;

  return (
    <>
      <div className="w-full flex flex-col gap-6">
        {/* Email/Password */}
        <div className="flex flex-col gap-3">
          <div className="flex flex-col sm:flex-row sm:justify-between sm:items-start gap-2">
            <div className="flex flex-col gap-2">
              <div className="flex items-center gap-2">
                <h4 className="font-semibold">Email/Password</h4>
                {authMethods.hasPassword ? (
                  <Chip size="sm" color="success" variant="flat">
                    Active
                  </Chip>
                ) : (
                  <Chip size="sm" color="default" variant="flat">
                    Not set
                  </Chip>
                )}
              </div>
              {authMethods.userEmail && (
                <p className="text-xs text-default-500">
                  {authMethods.userEmail}
                  {authMethods.userEmail === authMethods.notificationEmail && (
                    <span className="ml-2 text-success">• Contact email</span>
                  )}
                </p>
              )}
            </div>
            <div className="flex flex-wrap gap-2">
              {authMethods.hasPassword ? (
                <>
                  <Button
                    size="sm"
                    color="secondary"
                    variant="flat"
                    onPress={() => {
                      setError(null);
                      changePasswordModal.onOpen();
                    }}
                  >
                    Change Password
                  </Button>
                  <Button
                    size="sm"
                    color="danger"
                    variant="flat"
                    onPress={() => handleRemoveAuth('password')}
                    isDisabled={!canRemoveMethod}
                  >
                    Remove
                  </Button>
                </>
              ) : (
                <Button
                  size="sm"
                  color="primary"
                  variant="flat"
                  onPress={() => {
                    setError(null);
                    changePasswordModal.onOpen();
                  }}
                >
                  Set Password
                </Button>
              )}
            </div>
          </div>
          {!canRemoveMethod && authMethods.hasPassword && (
            <p className="text-xs text-warning">Add another method before removing password</p>
          )}
        </div>

        <Divider />

        {/* Google OAuth */}
        <div className="flex flex-col gap-3">
          <div className="flex flex-col sm:flex-row sm:justify-between sm:items-start gap-2">
            <div className="flex flex-col gap-2">
              <div className="flex items-center gap-2">
                <h4 className="font-semibold">Google Account</h4>
                {authMethods.hasGoogle ? (
                  <Chip size="sm" color="success" variant="flat">
                    Linked
                  </Chip>
                ) : (
                  <Chip size="sm" color="default" variant="flat">
                    Not linked
                  </Chip>
                )}
              </div>
              {authMethods.hasGoogle && authMethods.googleEmail && (
                <p className="text-xs text-default-500">
                  {authMethods.googleEmail}
                  {authMethods.googleEmail === authMethods.notificationEmail && !authMethods.userEmail && (
                    <span className="ml-2 text-success">• Contact email</span>
                  )}
                </p>
              )}
            </div>
            <div className="flex flex-wrap gap-2">
              {authMethods.hasGoogle ? (
                <Button
                  size="sm"
                  color="danger"
                  variant="flat"
                  onPress={() => handleRemoveAuth('google')}
                  isDisabled={!canRemoveMethod}
                >
                  Unlink
                </Button>
              ) : (
                <Button
                  size="sm"
                  color="primary"
                  variant="flat"
                  onPress={() => {
                    setError(null);
                    linkGoogleModal.onOpen();
                  }}
                >
                  Link Google
                </Button>
              )}
            </div>
          </div>
          {!canRemoveMethod && authMethods.hasGoogle && (
            <p className="text-xs text-warning">Add another method before unlinking Google</p>
          )}
        </div>

        <Divider />

        {/* Human Wallet */}
        <div className="flex flex-col gap-3">
          <div className="flex flex-col sm:flex-row sm:justify-between sm:items-start gap-2">
            <div className="flex flex-col gap-2">
              <div className="flex items-center gap-2">
                <h4 className="font-semibold">Human Wallet</h4>
                {authMethods.hasWallet ? (
                  <Chip size="sm" color="success" variant="flat">
                    Connected
                  </Chip>
                ) : (
                  <Chip size="sm" color="default" variant="flat">
                    Not connected
                  </Chip>
                )}
              </div>
              {authMethods.hasWallet && authMethods.walletAddress && (
                <p className="text-xs text-default-500 font-mono">
                  {authMethods.walletAddress.slice(0, 6)}...{authMethods.walletAddress.slice(-4)}
                </p>
              )}
            </div>
            <div className="flex flex-wrap gap-2">
              {authMethods.hasWallet ? (
                <Button
                  size="sm"
                  color="danger"
                  variant="flat"
                  onPress={() => handleRemoveAuth('wallet')}
                  isDisabled={!canRemoveMethod}
                >
                  Disconnect
                </Button>
              ) : (
                <Button size="sm" color="primary" variant="flat" onPress={handleLinkWallet}>
                  {address ? 'Link Wallet Address' : 'Connect Wallet'}
                </Button>
              )}
            </div>
          </div>
          {!canRemoveMethod && authMethods.hasWallet && (
            <p className="text-xs text-warning">Add another method before disconnecting wallet</p>
          )}
          {!authMethods.hasWallet && (
            <p className="text-xs text-default-500">Recommended: Add a wallet for web3 features</p>
          )}
        </div>
      </div>

      {/* Change Password Modal */}
      <Modal isOpen={changePasswordModal.isOpen} onClose={changePasswordModal.onClose}>
        <ModalContent>
          <ModalHeader>{authMethods.hasPassword ? 'Change Password' : 'Set Password'}</ModalHeader>
          <Formik
            initialValues={{ currentPassword: '', newPassword: '', confirmPassword: '' }}
            validationSchema={authMethods.hasPassword ? changePasswordSchema : setPasswordSchema}
            onSubmit={(values) => changePasswordMutation.mutate(values)}
          >
            {({ errors, touched, isSubmitting, handleChange, handleBlur, values }) => (
              <Form>
                <ModalBody>
                  {authMethods.hasPassword && (
                    <Input
                      name="currentPassword"
                      type="password"
                      label="Current Password"
                      value={values.currentPassword}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      isInvalid={touched.currentPassword && !!errors.currentPassword}
                      errorMessage={touched.currentPassword && errors.currentPassword}
                      isRequired
                    />
                  )}
                  <Input
                    name="newPassword"
                    type="password"
                    label="New Password"
                    value={values.newPassword}
                    onChange={handleChange}
                    onBlur={handleBlur}
                    isInvalid={touched.newPassword && !!errors.newPassword}
                    errorMessage={touched.newPassword && errors.newPassword}
                    isRequired
                  />
                  <Input
                    name="confirmPassword"
                    type="password"
                    label="Confirm New Password"
                    value={values.confirmPassword}
                    onChange={handleChange}
                    onBlur={handleBlur}
                    isInvalid={touched.confirmPassword && !!errors.confirmPassword}
                    errorMessage={touched.confirmPassword && errors.confirmPassword}
                    isRequired
                  />
                  {error && <ErrorText message={error} />}
                </ModalBody>
                <ModalFooter>
                  <Button variant="flat" onPress={changePasswordModal.onClose}>
                    Cancel
                  </Button>
                  <Button color="primary" type="submit" isLoading={isSubmitting}>
                    {authMethods.hasPassword ? 'Change Password' : 'Set Password'}
                  </Button>
                </ModalFooter>
              </Form>
            )}
          </Formik>
        </ModalContent>
      </Modal>

      {/* Link Google Modal */}
      <Modal isOpen={linkGoogleModal.isOpen} onClose={linkGoogleModal.onClose}>
        <ModalContent>
          <ModalHeader>Link Google Account</ModalHeader>
          <ModalBody>
            <p>You'll be redirected to Google to authorize linking your account.</p>
          </ModalBody>
          <ModalFooter>
            <Button variant="flat" onPress={linkGoogleModal.onClose}>
              Cancel
            </Button>
            <Button color="primary" onPress={handleLinkGoogle}>
              Continue with Google
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>

      {/* Remove Auth Method Modal */}
      <Modal isOpen={removeAuthModal.isOpen} onClose={removeAuthModal.onClose}>
        <ModalContent>
          <ModalHeader>Remove Authentication Method?</ModalHeader>
          <ModalBody>
            <p>Are you sure you want to remove this authentication method?</p>
            {authMethodToRemove && (
              <div className="mt-2 p-3 bg-warning-50 rounded">
                <p className="text-sm text-warning-700">
                  You will no longer be able to sign in using {authMethodToRemove === 'password' && 'email/password'}
                  {authMethodToRemove === 'google' && 'Google'}
                  {authMethodToRemove === 'wallet' && 'Human Wallet'}
                </p>
              </div>
            )}
            {error && <ErrorText message={error} />}
          </ModalBody>
          <ModalFooter>
            <Button variant="flat" onPress={removeAuthModal.onClose}>
              Cancel
            </Button>
            <Button
              color="danger"
              onPress={() => authMethodToRemove && removeAuthMutation.mutate(authMethodToRemove)}
              isLoading={removeAuthMutation.isPending}
            >
              Yes, Remove
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};

export default AuthenticationManagement;
