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

  /**
   * Sends an invitation email to a potential new member
   * @param to - Recipient email address
   * @param invitationCode - UUID invitation code
   * @param inviterName - Name of the person who sent the invitation
   */
  sendInvitationEmail(to: string, invitationCode: string, inviterName: string): Promise<void>;

  /**
   * Sends a notification email to support when a group claim is submitted
   * @param to - Support email address (support@quilombo.net)
   * @param groupName - Name of the group being claimed
   * @param claimerName - Name of the user claiming the group
   * @param claimerEmail - Email of the user claiming the group
   * @param userMessage - Message from the claimer explaining why they should be admin
   * @param adminPanelUrl - URL to the admin panel to review the claim
   */
  sendClaimSubmittedEmail(
    to: string,
    groupName: string,
    claimerName: string,
    claimerEmail: string,
    userMessage: string,
    adminPanelUrl: string
  ): Promise<void>;

  /**
   * Sends an approval notification email to the claimer
   * @param to - Claimer's email address
   * @param groupName - Name of the claimed group
   * @param groupId - ID of the group for generating management URL
   * @param claimerName - Name of the claimer for personalization
   */
  sendClaimApprovedEmail(to: string, groupName: string, groupId: string, claimerName: string): Promise<void>;

  /**
   * Sends a rejection notification email to the claimer
   * @param to - Claimer's email address
   * @param groupName - Name of the group
   * @param claimerName - Name of the claimer for personalization
   * @param reason - Admin's reason for rejection
   */
  sendClaimRejectedEmail(to: string, groupName: string, claimerName: string, reason: string): Promise<void>;

  /**
   * Sends a welcome email to a user who registered a new group
   * @param to - User's email address
   * @param groupName - Name of the registered group
   * @param groupId - ID of the group for generating management URL
   * @param userName - Name of the user for personalization
   */
  sendGroupRegisteredEmail(to: string, groupName: string, groupId: string, userName: string): Promise<void>;

  /**
   * Sends an approval notification email for a person profile claim
   * @param to - Claimer's email address
   * @param profileDisplayName - Display name of the claimed profile (apelido or name)
   * @param profileId - ID of the profile for generating profile URL
   * @param claimerName - Name of the claimer for personalization
   */
  sendPersonClaimApprovedEmail(
    to: string,
    profileDisplayName: string,
    profileId: string,
    claimerName: string
  ): Promise<void>;

  /**
   * Sends a rejection notification email for a person profile claim
   * @param to - Claimer's email address
   * @param profileDisplayName - Display name of the claimed profile (apelido or name)
   * @param claimerName - Name of the claimer for personalization
   * @param reason - Admin's reason for rejection
   */
  sendPersonClaimRejectedEmail(
    to: string,
    profileDisplayName: string,
    claimerName: string,
    reason: string
  ): Promise<void>;
}
