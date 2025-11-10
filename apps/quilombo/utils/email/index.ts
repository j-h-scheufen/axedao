import ENV from '@/config/environment';
import { MailjetProvider } from './mailjet';
import { SMTPProvider } from './smtp';
import type { EmailProvider } from './provider';

/**
 * Factory function to get the email provider
 * Returns SMTPProvider for local development (NEXT_PUBLIC_APP_ENV=development)
 * Returns MailjetProvider for staging/production
 * Throws error if provider is not properly configured
 */
export const getEmailProvider = (): EmailProvider => {
  if (ENV.environment === 'development') {
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

export type { EmailProvider } from './provider';
