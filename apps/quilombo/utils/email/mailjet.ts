import { render } from '@react-email/components';

import { getBaseUrl } from '@/config/environment';
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
    const baseUrl = getBaseUrl();
    const verifyUrl = `${baseUrl}/auth/verify-email?token=${token}`;
    const logoUrl = `${baseUrl}/quilombo-icon-192x192.png`;

    const html = await render(VerificationEmail({ verifyUrl, logoUrl, userName }));
    const text = await render(VerificationEmail({ verifyUrl, logoUrl, userName }), { plainText: true });

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'support@quilombo.net', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Verify your Quilombo account',
          TextPart: text,
          HTMLPart: html,
          CustomID: 'email-verification',
        },
      ],
    });
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const baseUrl = getBaseUrl();
    const resetUrl = `${baseUrl}/auth/reset-password?token=${token}`;
    const logoUrl = `${baseUrl}/quilombo-icon-192x192.png`;

    const html = await render(PasswordResetEmail({ resetUrl, logoUrl, userName }));
    const text = await render(PasswordResetEmail({ resetUrl, logoUrl, userName }), { plainText: true });

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'support@quilombo.net', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Reset your Quilombo password',
          TextPart: text,
          HTMLPart: html,
          CustomID: 'password-reset',
        },
      ],
    });
  }

  async sendWelcomeEmail(to: string, userName?: string): Promise<void> {
    const baseUrl = getBaseUrl();
    const profileUrl = `${baseUrl}/profile`;
    const logoUrl = `${baseUrl}/quilombo-icon-192x192.png`;

    const html = await render(WelcomeEmail({ profileUrl, logoUrl, userName }));
    const text = await render(WelcomeEmail({ profileUrl, logoUrl, userName }), { plainText: true });

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'support@quilombo.net', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Welcome to Quilombo!',
          TextPart: text,
          HTMLPart: html,
          CustomID: 'welcome',
        },
      ],
    });
  }
}
