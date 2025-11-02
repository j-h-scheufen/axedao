import { Body, Button, Container, Head, Heading, Html, Img, Preview, Section, Text } from '@react-email/components';

import { emailStyles } from './styles';

interface PasswordResetEmailProps {
  resetUrl: string;
  logoUrl: string;
  userName?: string;
}

export const PasswordResetEmail = ({ resetUrl, logoUrl, userName }: PasswordResetEmailProps) => (
  <Html>
    <Head>
      <style>
        {`
          @media (prefers-color-scheme: dark) {
            .dark-mode-bg { background-color: #1a1a1a !important; }
            .dark-mode-container { background-color: #2d2d2d !important; }
            .dark-mode-text { color: #e0e0e0 !important; }
            .dark-mode-heading { color: #ffffff !important; }
          }
        `}
      </style>
    </Head>
    <Preview>Reset your Quilombo password</Preview>
    <Body style={emailStyles.main} className="dark-mode-bg">
      <Container style={emailStyles.container} className="dark-mode-container">
        <Section style={emailStyles.logoContainer}>
          <Img src={logoUrl} width="80" height="80" alt="Quilombo" style={emailStyles.logo} />
        </Section>
        <Heading style={emailStyles.h1} className="dark-mode-heading">
          Password Reset Request
        </Heading>
        <Text style={emailStyles.text} className="dark-mode-text">
          {userName ? `Hi ${userName},` : 'Hi there,'}
        </Text>
        <Text style={emailStyles.text} className="dark-mode-text">
          We received a request to reset your password. Click the button below to set a new password:
        </Text>
        <Section style={emailStyles.buttonContainer}>
          <Button style={{ ...emailStyles.button, ...emailStyles.buttonDanger }} href={resetUrl}>
            Reset Password
          </Button>
        </Section>
        <Text style={emailStyles.text} className="dark-mode-text">
          Or copy and paste this link into your browser:
        </Text>
        <Text style={{ ...emailStyles.link, ...emailStyles.linkDanger }}>{resetUrl}</Text>
        <Text style={emailStyles.footer} className="dark-mode-text">
          This link will expire in 60 minutes. If you didn't request this password reset, please ignore this email. Your
          password will remain unchanged.
        </Text>
      </Container>
    </Body>
  </Html>
);

export default PasswordResetEmail;
