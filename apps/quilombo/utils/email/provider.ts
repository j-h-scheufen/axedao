/**
 * Email provider interface for sending authentication-related emails
 */
export interface EmailProvider {
  /**
   * Sends an email verification link to a user
   * @param to - Recipient email address
   * @param token - Plain text verification token
   * @param userName - Optional user name for personalization
   */
  sendVerificationEmail(to: string, token: string, userName?: string): Promise<void>;

  /**
   * Sends a password reset link to a user
   * @param to - Recipient email address
   * @param token - Plain text reset token
   * @param userName - Optional user name for personalization
   */
  sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void>;

  /**
   * Sends a welcome email when account is activated
   * @param to - Recipient email address
   * @param userName - Optional user name for personalization
   */
  sendWelcomeEmail(to: string, userName?: string): Promise<void>;
}
