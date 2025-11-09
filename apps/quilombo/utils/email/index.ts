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

export type { EmailProvider } from './provider';
