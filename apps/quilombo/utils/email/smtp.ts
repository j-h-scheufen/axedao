import nodemailer from 'nodemailer';

import ENV from '@/config/environment';
import type { EmailProvider } from './provider';
import { emailTemplates } from './email-config';
import { renderEmailTemplate } from './email-helpers';

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
    const config = emailTemplates.verification;
    const template = config.getTemplate(token, userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent verification email to ${to}`);
  }

  async sendPasswordResetEmail(to: string, token: string, userName?: string): Promise<void> {
    const config = emailTemplates.passwordReset;
    const template = config.getTemplate(token, userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent password reset email to ${to}`);
  }

  async sendWelcomeEmail(to: string, userName?: string): Promise<void> {
    const config = emailTemplates.welcome;
    const template = config.getTemplate(userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent welcome email to ${to}`);
  }

  async sendInvitationEmail(to: string, invitationCode: string, inviterName: string): Promise<void> {
    const config = emailTemplates.invitation;
    const template = config.getTemplate(invitationCode, inviterName, to);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject:
        typeof config.metadata.subject === 'function' ? config.metadata.subject(inviterName) : config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent invitation email to ${to}`);
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

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent claim submitted notification to ${to}`);
    console.log(`[SMTP] Group: ${groupName}, Claimer: ${claimerName}`);
  }

  async sendClaimApprovedEmail(to: string, groupName: string, groupId: string, claimerName: string): Promise<void> {
    const config = emailTemplates.claimApproved;
    const template = config.getTemplate(groupName, groupId, claimerName);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent claim approved email to ${to}`);
    console.log(`[SMTP] Group: ${groupName} (${groupId})`);
  }

  async sendClaimRejectedEmail(to: string, groupName: string, claimerName: string, reason: string): Promise<void> {
    const config = emailTemplates.claimRejected;
    const template = config.getTemplate(groupName, claimerName, reason);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent claim rejected email to ${to}`);
    console.log(`[SMTP] Group: ${groupName}`);
  }

  async sendGroupRegisteredEmail(to: string, groupName: string, groupId: string, userName: string): Promise<void> {
    const config = emailTemplates.groupRegistered;
    const template = config.getTemplate(groupName, groupId, userName);
    const { html, text } = await renderEmailTemplate(template);

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent group registered email to ${to}`);
    console.log(`[SMTP] Group: ${groupName} (${groupId})`);
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

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent person claim approved email to ${to}`);
    console.log(`[SMTP] Profile: ${profileDisplayName} (${profileId})`);
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

    await this.transporter.sendMail({
      from: `"${config.metadata.from.name}" <${config.metadata.from.email}>`,
      to,
      subject: config.metadata.subject,
      text,
      html,
    });

    console.log(`[SMTP] Sent person claim rejected email to ${to}`);
    console.log(`[SMTP] Profile: ${profileDisplayName}`);
  }
}
