import ENV from '@/config/environment';
import type { EmailProvider } from './provider';
import { emailTemplates } from './email-config';
import { renderEmailTemplate } from './email-helpers';

/**
 * Mailjet email provider implementation
 * Uses React Email for templates
 */
export class MailjetProvider implements EmailProvider {
  // biome-ignore lint/suspicious/noExplicitAny: Third-party library without official types
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
    const config = emailTemplates.verification;
    const template = config.getTemplate(token, userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: userName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const config = emailTemplates.passwordReset;
    const template = config.getTemplate(token, userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: userName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendWelcomeEmail(to: string, userName?: string): Promise<void> {
    const config = emailTemplates.welcome;
    const template = config.getTemplate(userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: userName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendInvitationEmail(to: string, invitationCode: string, inviterName: string): Promise<void> {
    const config = emailTemplates.invitation;
    const template = config.getTemplate(invitationCode, inviterName, to);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to }],
          Subject:
            typeof config.metadata.subject === 'function'
              ? config.metadata.subject(inviterName)
              : config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
        },
      ],
    });
  }

  async sendClaimSubmittedEmail(
    to: string,
    groupName: string,
    claimerName: string,
    claimerEmail: string,
    userMessage: string,
    adminPanelUrl: string
  ): Promise<void> {
    const config = emailTemplates.claimSubmitted;
    const template = config.getTemplate(groupName, claimerName, claimerEmail, userMessage, adminPanelUrl);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendClaimApprovedEmail(to: string, groupName: string, groupId: string, claimerName: string): Promise<void> {
    const config = emailTemplates.claimApproved;
    const template = config.getTemplate(groupName, groupId, claimerName);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: claimerName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendClaimRejectedEmail(to: string, groupName: string, claimerName: string, reason: string): Promise<void> {
    const config = emailTemplates.claimRejected;
    const template = config.getTemplate(groupName, claimerName, reason);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: claimerName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendGroupRegisteredEmail(to: string, groupName: string, groupId: string, userName: string): Promise<void> {
    const config = emailTemplates.groupRegistered;
    const template = config.getTemplate(groupName, groupId, userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: userName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendPersonClaimApprovedEmail(
    to: string,
    profileDisplayName: string,
    profileId: string,
    claimerName: string
  ): Promise<void> {
    const config = emailTemplates.personClaimApproved;
    const template = config.getTemplate(profileDisplayName, profileId, claimerName);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: claimerName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }

  async sendPersonClaimRejectedEmail(
    to: string,
    profileDisplayName: string,
    claimerName: string,
    reason: string
  ): Promise<void> {
    const config = emailTemplates.personClaimRejected;
    const template = config.getTemplate(profileDisplayName, claimerName, reason);
    const { html, text } = await renderEmailTemplate(template);

    await this.client.post('send', { version: 'v3.1' }).request({
      Messages: [
        {
          From: { Email: config.metadata.from.email, Name: config.metadata.from.name },
          To: [{ Email: to, Name: claimerName }],
          Subject: config.metadata.subject,
          TextPart: text,
          HTMLPart: html,
          CustomID: config.metadata.customId,
        },
      ],
    });
  }
}
