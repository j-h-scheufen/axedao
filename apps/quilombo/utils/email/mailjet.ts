import { render } from '@react-email/components';

import ENV from '@/config/environment';
import type { EmailProvider } from './provider';
import { VerificationEmail } from './templates/verification-email';
import { PasswordResetEmail } from './templates/password-reset-email';
import { WelcomeEmail } from './templates/welcome-email';

/**
 * Mailjet email provider implementation
 * Uses React Email for templates
 */
export class MailjetProvider implements EmailProvider {
  private client: any;

  constructor() {
    // Lazy import to avoid errors if mailjet is not installed yet
    try {
      // eslint-disable-next-line @typescript-eslint/no-var-requires
      const Mailjet = require('node-mailjet');
      this.client = Mailjet.apiConnect(ENV.mailjetApiKey, ENV.mailjetApiSecret);
    } catch (error) {
      console.error('Mailjet client initialization failed. Make sure node-mailjet is installed:', error);
      throw new Error('Mailjet not configured properly');
    }
  }

  async sendVerificationEmail(to: string, token: string, userName?: string): Promise<void> {
    const verifyUrl = `${process.env.NEXT_PUBLIC_APP_URL}/auth/verify-email?token=${token}`;

    const html = await render(VerificationEmail({ verifyUrl, userName }));
    const text = await render(VerificationEmail({ verifyUrl, userName }), { plainText: true });

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'support@quilombo.net', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Verify your Quilombo account',
          TextPart: text,
          HTMLPart: html,
        },
      ],
    });
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const resetUrl = `${process.env.NEXT_PUBLIC_APP_URL}/auth/reset-password?token=${token}`;

    const html = await render(PasswordResetEmail({ resetUrl, userName }));
    const text = await render(PasswordResetEmail({ resetUrl, userName }), { plainText: true });

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'support@quilombo.net', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Reset your Quilombo password',
          TextPart: text,
          HTMLPart: html,
        },
      ],
    });
  }

  async sendWelcomeEmail(to: string, userName?: string): Promise<void> {
    const profileUrl = `${process.env.NEXT_PUBLIC_APP_URL}/profile`;

    const html = await render(WelcomeEmail({ profileUrl, userName }));
    const text = await render(WelcomeEmail({ profileUrl, userName }), { plainText: true });

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'support@quilombo.net', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Welcome to Quilombo!',
          TextPart: text,
          HTMLPart: html,
        },
      ],
    });
  }
}
