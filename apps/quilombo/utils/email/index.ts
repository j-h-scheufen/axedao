import { MailjetProvider } from './mailjet';
import type { EmailProvider } from './provider';

/**
 * Factory function to get the email provider
 * Returns MailjetProvider configured with credentials from environment
 * Throws error if Mailjet is not properly configured
 */
export const getEmailProvider = (): EmailProvider => {
  return new MailjetProvider();
};

export type { EmailProvider } from './provider';
