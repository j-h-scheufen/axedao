import type { EmailProvider } from './provider';

/**
 * Stub email provider for development
 * Logs emails to console instead of sending them
 */
export class StubEmailProvider implements EmailProvider {
  async sendVerificationEmail(to: string, token: string, userName?: string): Promise<void> {
    const url = `${process.env.NEXT_PUBLIC_APP_URL}/auth/verify-email?token=${token}`;
    console.log('📧 [STUB] Verification email:', {
      to,
      userName,
      url,
      subject: 'Verify your Quilombo account',
    });
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const url = `${process.env.NEXT_PUBLIC_APP_URL}/auth/reset-password?token=${token}`;
    console.log('📧 [STUB] Password reset email:', {
      to,
      userName,
      url,
      subject: 'Reset your Quilombo password',
    });
  }
}
