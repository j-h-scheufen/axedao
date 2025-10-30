import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface VerificationEmailProps {
  verifyUrl: string;
  userName?: string;
}

export const VerificationEmail = ({ verifyUrl, userName }: VerificationEmailProps) => (
  <Html>
    <Head />
    <Preview>Verify your Quilombo account</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Welcome to Quilombo!</Heading>
        <Text style={text}>{userName ? `Hi ${userName},` : 'Hi there,'}</Text>
        <Text style={text}>
          Thanks for signing up! Click the button below to verify your email address and activate your account.
        </Text>
        <Section style={buttonContainer}>
          <Button style={button} href={verifyUrl}>
            Verify Email
          </Button>
        </Section>
        <Text style={text}>Or copy and paste this link into your browser:</Text>
        <Text style={link}>{verifyUrl}</Text>
        <Text style={footer}>
          This link will expire in 30 minutes. If you didn't create this account, you can safely ignore this email.
        </Text>
      </Container>
    </Body>
  </Html>
);

export default VerificationEmail;

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
  backgroundColor: '#22c55e',
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
  color: '#22c55e',
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
