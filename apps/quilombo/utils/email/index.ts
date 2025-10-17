import { MailjetProvider } from './mailjet';
import type { EmailProvider } from './provider';
import { StubEmailProvider } from './stub';

/**
 * Factory function to get the appropriate email provider
 * Uses StubEmailProvider in development or when Mailjet is not configured
 * Uses MailjetProvider in production with proper credentials
 */
export const getEmailProvider = (): EmailProvider => {
  if (process.env.NODE_ENV === 'development' || !process.env.MAILJET_API_KEY) {
    return new StubEmailProvider();
  }
  return new MailjetProvider();
};

export type { EmailProvider } from './provider';
