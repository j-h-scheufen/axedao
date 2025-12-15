import type { ReactElement } from 'react';
import { getBaseUrl } from '@/config/environment';
import { VerificationEmail } from './templates/verification-email';
import { PasswordResetEmail } from './templates/password-reset-email';
import { WelcomeEmail } from './templates/welcome-email';
import { InvitationEmail } from './templates/invitation-email';
import { ClaimSubmittedEmail } from './templates/claim-submitted-email';
import { ClaimApprovedEmail } from './templates/claim-approved-email';
import { ClaimRejectedEmail } from './templates/claim-rejected-email';
import { GroupRegisteredEmail } from './templates/group-registered-email';
import { PersonClaimApprovedEmail } from './templates/person-claim-approved-email';
import { PersonClaimRejectedEmail } from './templates/person-claim-rejected-email';

/**
 * Email metadata and configuration
 * Centralized location for all email subjects, senders, and template props
 */

export interface EmailMetadata {
  subject: string;
  from: { email: string; name: string };
  customId?: string;
}

export const EMAIL_SENDERS = {
  support: { email: 'support@quilombo.net', name: 'Quilombo' },
  community: { email: 'join@quilombo.net', name: 'Quilombo Community' },
} as const;

export const LOGO_URL = 'https://quilombo.net/quilombo-icon-192x192.png';

/**
 * Email template configurations
 */
export const emailTemplates = {
  verification: {
    metadata: {
      subject: 'Verify your Quilombo account',
      from: EMAIL_SENDERS.support,
      customId: 'email-verification',
    },
    getTemplate: (token: string, userName?: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const verifyUrl = `${baseUrl}/auth/verify-email?token=${token}`;
      return VerificationEmail({ verifyUrl, logoUrl: LOGO_URL, userName });
    },
  },
  passwordReset: {
    metadata: {
      subject: 'Reset your Quilombo password',
      from: EMAIL_SENDERS.support,
      customId: 'password-reset',
    },
    getTemplate: (token: string, userName?: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const resetUrl = `${baseUrl}/auth/reset-password?token=${token}`;
      return PasswordResetEmail({ resetUrl, logoUrl: LOGO_URL, userName });
    },
  },
  welcome: {
    metadata: {
      subject: 'Welcome to Quilombo!',
      from: EMAIL_SENDERS.support,
      customId: 'welcome',
    },
    getTemplate: (userName?: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const profileUrl = `${baseUrl}/profile`;
      return WelcomeEmail({ profileUrl, logoUrl: LOGO_URL, userName });
    },
  },
  invitation: {
    metadata: {
      subject: (inviterName: string) => `${inviterName} invited you to join Quilombo`,
      from: EMAIL_SENDERS.community,
    },
    getTemplate: (invitationCode: string, inviterName: string, invitedEmail: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const inviteUrl = `${baseUrl}/auth/signup?code=${invitationCode}&email=${encodeURIComponent(invitedEmail)}`;
      return InvitationEmail({ inviteUrl, inviterName, invitedEmail });
    },
  },
  claimSubmitted: {
    metadata: {
      subject: 'New Group Claim Request',
      from: EMAIL_SENDERS.support,
      customId: 'claim-submitted',
    },
    getTemplate: (
      groupName: string,
      claimerName: string,
      claimerEmail: string,
      userMessage: string,
      adminPanelUrl: string
    ): ReactElement => {
      return ClaimSubmittedEmail({ groupName, claimerName, claimerEmail, userMessage, adminPanelUrl });
    },
  },
  claimApproved: {
    metadata: {
      subject: 'Your group claim has been approved',
      from: EMAIL_SENDERS.support,
      customId: 'claim-approved',
    },
    getTemplate: (groupName: string, groupId: string, claimerName: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const groupManagementUrl = `${baseUrl}/groups/${groupId}`;
      return ClaimApprovedEmail({ groupName, groupId, claimerName, groupManagementUrl });
    },
  },
  claimRejected: {
    metadata: {
      subject: 'Your group claim has been rejected',
      from: EMAIL_SENDERS.support,
      customId: 'claim-rejected',
    },
    getTemplate: (groupName: string, claimerName: string, reason: string): ReactElement => {
      return ClaimRejectedEmail({ groupName, claimerName, reason });
    },
  },
  groupRegistered: {
    metadata: {
      subject: 'Group registration successful',
      from: EMAIL_SENDERS.support,
      customId: 'group-registered',
    },
    getTemplate: (groupName: string, groupId: string, userName: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const groupManagementUrl = `${baseUrl}/groups/${groupId}/edit`;
      return GroupRegisteredEmail({ groupName, groupId, userName, groupManagementUrl });
    },
  },
  personClaimApproved: {
    metadata: {
      subject: 'Your genealogy profile claim has been approved',
      from: EMAIL_SENDERS.support,
      customId: 'person-claim-approved',
    },
    getTemplate: (profileDisplayName: string, profileId: string, claimerName: string): ReactElement => {
      const baseUrl = getBaseUrl();
      const profileUrl = `${baseUrl}/genealogy/${profileId}`;
      return PersonClaimApprovedEmail({ profileDisplayName, profileId, claimerName, profileUrl });
    },
  },
  personClaimRejected: {
    metadata: {
      subject: 'Your genealogy profile claim has been reviewed',
      from: EMAIL_SENDERS.support,
      customId: 'person-claim-rejected',
    },
    getTemplate: (profileDisplayName: string, claimerName: string, reason: string): ReactElement => {
      return PersonClaimRejectedEmail({ profileDisplayName, claimerName, reason });
    },
  },
} as const;
