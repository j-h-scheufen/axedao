import { Body, Button, Container, Head, Heading, Html, Img, Preview, Section, Text } from '@react-email/components';

import { emailStyles } from './styles';

interface PasswordResetEmailProps {
  resetUrl: string;
  logoUrl: string;
  userName?: string;
}

export const PasswordResetEmail = ({ resetUrl, logoUrl, userName }: PasswordResetEmailProps) => (
  <Html>
    <Head />
    <Preview>Reset your Quilombo password</Preview>
    <Body style={emailStyles.main}>
      <Container style={emailStyles.container}>
        <Section style={emailStyles.logoContainer}>
          <Img src={logoUrl} width={80} height={80} alt="Quilombo" style={emailStyles.logo} />
        </Section>
        <Heading style={emailStyles.h1}>Password Reset Request</Heading>
        <Text style={emailStyles.text}>{userName ? `Hi ${userName},` : 'Hi there,'}</Text>
        <Text style={emailStyles.text}>
          We received a request to reset your password. Click the button below to set a new password:
        </Text>
        <Section style={emailStyles.buttonContainer}>
          <Button style={{ ...emailStyles.button, ...emailStyles.buttonDanger }} href={resetUrl}>
            Reset Password
          </Button>
        </Section>
        <Text style={emailStyles.text}>Or copy and paste this link into your browser:</Text>
        <Text style={{ ...emailStyles.link, ...emailStyles.linkDanger }}>{resetUrl}</Text>
        <Text style={emailStyles.footer}>
          This link will expire in 60 minutes. If you didn't request this password reset, please ignore this email. Your
          password will remain unchanged.
        </Text>
      </Container>
    </Body>
  </Html>
);

export default PasswordResetEmail;
