import type { EmailProvider } from './provider';

/**
 * Mailjet email provider implementation
 * Note: Requires node-mailjet package to be installed
 * Install with: pnpm add node-mailjet @types/node-mailjet
 */
export class MailjetProvider implements EmailProvider {
  private client: any;

  constructor() {
    // Lazy import to avoid errors if mailjet is not installed yet
    try {
      // eslint-disable-next-line @typescript-eslint/no-var-requires
      const Mailjet = require('node-mailjet');
      this.client = Mailjet.apiConnect(process.env.MAILJET_API_KEY!, process.env.MAILJET_API_SECRET!);
    } catch (error) {
      console.error('Mailjet client initialization failed. Make sure node-mailjet is installed:', error);
      throw new Error('Mailjet not configured properly');
    }
  }

  async sendVerificationEmail(to: string, token: string, userName?: string): Promise<void> {
    const verifyUrl = `${process.env.NEXT_PUBLIC_APP_URL}/auth/verify-email?token=${token}`;

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'noreply@quilombo.app', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Verify your Quilombo account',
          TextPart: `Click this link to verify your email: ${verifyUrl}`,
          HTMLPart: `
            <h2>Welcome to Quilombo!</h2>
            <p>Click the button below to verify your email address:</p>
            <a href="${verifyUrl}" style="display: inline-block; padding: 12px 24px; background: #007bff; color: white; text-decoration: none; border-radius: 4px;">
              Verify Email
            </a>
            <p><small>This link expires in 30 minutes.</small></p>
            <p><small>If you didn't create this account, you can safely ignore this email.</small></p>
          `,
        },
      ],
    });
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const resetUrl = `${process.env.NEXT_PUBLIC_APP_URL}/auth/reset-password?token=${token}`;

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: 'noreply@quilombo.app', Name: 'Quilombo' },
          To: [{ Email: to, Name: userName }],
          Subject: 'Reset your Quilombo password',
          TextPart: `Click this link to reset your password: ${resetUrl}`,
          HTMLPart: `
            <h2>Password Reset Request</h2>
            <p>Click the button below to reset your password:</p>
            <a href="${resetUrl}" style="display: inline-block; padding: 12px 24px; background: #dc3545; color: white; text-decoration: none; border-radius: 4px;">
              Reset Password
            </a>
            <p><small>This link expires in 60 minutes. If you didn't request this, please ignore this email.</small></p>
          `,
        },
      ],
    });
  }
}
