import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface PasswordResetEmailProps {
  resetUrl: string;
  userName?: string;
}

export const PasswordResetEmail = ({ resetUrl, userName }: PasswordResetEmailProps) => (
  <Html>
    <Head />
    <Preview>Reset your Quilombo password</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Password Reset Request</Heading>
        <Text style={text}>{userName ? `Hi ${userName},` : 'Hi there,'}</Text>
        <Text style={text}>
          We received a request to reset your password. Click the button below to set a new password:
        </Text>
        <Section style={buttonContainer}>
          <Button style={button} href={resetUrl}>
            Reset Password
          </Button>
        </Section>
        <Text style={text}>Or copy and paste this link into your browser:</Text>
        <Text style={link}>{resetUrl}</Text>
        <Text style={footer}>
          This link will expire in 60 minutes. If you didn't request this password reset, please ignore this email. Your
          password will remain unchanged.
        </Text>
      </Container>
    </Body>
  </Html>
);

export default PasswordResetEmail;

const main = {
  backgroundColor: '#f6f9fc',
  fontFamily: '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif',
};

const container = {
  backgroundColor: '#ffffff',
  margin: '0 auto',
  padding: '20px 0 48px',
  marginBottom: '64px',
};

const h1 = {
  color: '#333',
  fontSize: '24px',
  fontWeight: 'bold',
  margin: '40px 0',
  padding: '0',
  textAlign: 'center' as const,
};

const text = {
  color: '#333',
  fontSize: '16px',
  lineHeight: '26px',
  padding: '0 40px',
};

const buttonContainer = {
  padding: '27px 0 27px',
  textAlign: 'center' as const,
};

const button = {
  backgroundColor: '#dc3545',
  borderRadius: '4px',
  color: '#fff',
  fontSize: '16px',
  fontWeight: 'bold',
  textDecoration: 'none',
  textAlign: 'center' as const,
  display: 'inline-block',
  padding: '12px 24px',
};

const link = {
  color: '#dc3545',
  fontSize: '14px',
  textDecoration: 'underline',
  padding: '0 40px',
  wordBreak: 'break-all' as const,
};

const footer = {
  color: '#8898aa',
  fontSize: '12px',
  lineHeight: '16px',
  padding: '0 40px',
  marginTop: '24px',
};
