import ENV from '@/config/environment';
import { MailjetProvider } from './mailjet';
import { SMTPProvider } from './smtp';
import type { EmailProvider } from './provider';

/**
 * Factory function to get the email provider
 * Returns SMTPProvider for local development (NEXT_PUBLIC_APP_ENV=local)
 * Returns MailjetProvider for development/production
 * Throws error if provider is not properly configured
 */
export const getEmailProvider = (): EmailProvider => {
  if (ENV.environment === 'local') {
    return new SMTPProvider();
  }
  return new MailjetProvider();
};

/**
 * Sends an invitation email to a potential new member
 * TODO: TEMPORARY INVITE-ONLY - Remove when opening to public
 *
 * @param to - Recipient email address
 * @param invitationCode - UUID invitation code
 * @param inviterName - Name of the person who sent the invitation
 * @throws Error if email provider is not configured or sending fails
 */
export const sendInvitationEmail = async (to: string, invitationCode: string, inviterName: string): Promise<void> => {
  const provider = getEmailProvider();
  await provider.sendInvitationEmail(to, invitationCode, inviterName);
};

/**
 * Sends a welcome email to a user who registered a new group
 *
 * @param to - Recipient email address
 * @param groupName - Name of the registered group
 * @param groupId - ID of the group for generating management URL
 * @param userName - Name of the user for personalization
 * @throws Error if email provider is not configured or sending fails
 */
export const sendGroupRegisteredEmail = async (
  to: string,
  groupName: string,
  groupId: string,
  userName: string
): Promise<void> => {
  const provider = getEmailProvider();
  await provider.sendGroupRegisteredEmail(to, groupName, groupId, userName);
};

export type { EmailProvider } from './provider';
