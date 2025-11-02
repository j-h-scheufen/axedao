import { atom } from 'jotai';
import { atomWithStorage } from 'jotai/utils';

// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public

type StoredInvitation = {
  code: string;
  type: 'open';
  expiresAt: string;
  inviteLink: string;
  createdAt: string;
};

/**
 * Stores the currently active QR code invitation.
 * Persisted to localStorage to survive page refreshes.
 * Only stores 'open' type invitations (QR codes for events).
 */
export const activeQRInvitationAtom = atomWithStorage<StoredInvitation | null>('quilombo:active-qr-invitation', null);

/**
 * Computed atom that checks if the stored QR invitation is still valid.
 * Returns the invitation if valid, null if expired or doesn't exist.
 */
export const validQRInvitationAtom = atom<StoredInvitation | null>((get) => {
  const invitation = get(activeQRInvitationAtom);
  if (!invitation) return null;

  const expiryDate = new Date(invitation.expiresAt);
  const now = new Date();

  // Check if expired
  if (now >= expiryDate) {
    return null;
  }

  return invitation;
});

/**
 * Helper atom to check if there's a valid QR invitation.
 */
export const hasValidQRInvitationAtom = atom<boolean>((get) => {
  return get(validQRInvitationAtom) !== null;
});
