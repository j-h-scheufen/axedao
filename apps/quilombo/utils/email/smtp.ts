import { render } from '@react-email/components';
import nodemailer from 'nodemailer';

import { getBaseUrl } from '@/config/environment';
import ENV from '@/config/environment';
import type { EmailProvider } from './provider';
import { VerificationEmail } from './templates/verification-email';
import { PasswordResetEmail } from './templates/password-reset-email';
import { WelcomeEmail } from './templates/welcome-email';

/**
 * SMTP email provider implementation for local development
 * Sends emails through a local SMTP server (e.g., Inbucket)
 * Uses React Email for templates, same as production
 */
export class SMTPProvider implements EmailProvider {
  private transporter: nodemailer.Transporter;

  constructor() {
    this.transporter = nodemailer.createTransport({
      host: ENV.smtpHost,
      port: ENV.smtpPort,
      secure: false, // No TLS for local development
      tls: {
        rejectUnauthorized: false, // Accept self-signed certs
      },
    });

    console.log(`[SMTP] Email provider configured for ${ENV.smtpHost}:${ENV.smtpPort}`);
  }

  async sendVerificationEmail(to: string, token: string, userName?: string): Promise<void> {
    const baseUrl = getBaseUrl();
    const verifyUrl = `${baseUrl}/auth/verify-email?token=${token}`;
    const logoUrl = 'https://quilombo.net/quilombo-icon-192x192.png';

    const html = await render(VerificationEmail({ verifyUrl, logoUrl, userName }));
    const text = await render(VerificationEmail({ verifyUrl, logoUrl, userName }), { plainText: true });

    await this.transporter.sendMail({
      from: '"Quilombo" <support@quilombo.net>',
      to,
      subject: 'Verify your Quilombo account',
      text,
      html,
    });

    console.log(`[SMTP] Sent verification email to ${to}`);
    console.log(`[SMTP] Verification URL: ${verifyUrl}`);
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const baseUrl = getBaseUrl();
    const resetUrl = `${baseUrl}/auth/reset-password?token=${token}`;
    const logoUrl = 'https://quilombo.net/quilombo-icon-192x192.png';

    const html = await render(PasswordResetEmail({ resetUrl, logoUrl, userName }));
    const text = await render(PasswordResetEmail({ resetUrl, logoUrl, userName }), { plainText: true });

    await this.transporter.sendMail({
      from: '"Quilombo" <support@quilombo.net>',
      to,
      subject: 'Reset your Quilombo password',
      text,
      html,
    });

    console.log(`[SMTP] Sent password reset email to ${to}`);
    console.log(`[SMTP] Reset URL: ${resetUrl}`);
  }

  async sendWelcomeEmail(to: string, userName?: string): Promise<void> {
    const baseUrl = getBaseUrl();
    const profileUrl = `${baseUrl}/profile`;
    const logoUrl = 'https://quilombo.net/quilombo-icon-192x192.png';

    const html = await render(WelcomeEmail({ profileUrl, logoUrl, userName }));
    const text = await render(WelcomeEmail({ profileUrl, logoUrl, userName }), { plainText: true });

    await this.transporter.sendMail({
      from: '"Quilombo" <support@quilombo.net>',
      to,
      subject: 'Welcome to Quilombo!',
      text,
      html,
    });

    console.log(`[SMTP] Sent welcome email to ${to}`);
  }
}
