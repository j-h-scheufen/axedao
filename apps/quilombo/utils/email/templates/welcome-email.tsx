import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface WelcomeEmailProps {
  profileUrl: string;
  userName?: string;
}

export const WelcomeEmail = ({ profileUrl, userName }: WelcomeEmailProps) => (
  <Html>
    <Head />
    <Preview>Welcome to Quilombo! Your account is now active</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Welcome to Quilombo! 🎉</Heading>
        <Text style={text}>{userName ? `Hi ${userName},` : 'Hi there,'}</Text>
        <Text style={text}>
          Your account has been successfully activated! You're now part of a vibrant community connecting people through
          local groups and events.
        </Text>
        <Text style={heading2}>Here's what you can do:</Text>
        <Section style={features}>
          <Text style={feature}>
            <strong>✓ Create and join groups</strong> – Find your community
          </Text>
          <Text style={feature}>
            <strong>✓ Discover events</strong> – Connect in person
          </Text>
          <Text style={feature}>
            <strong>✓ Engage with your community</strong> – Build meaningful connections
          </Text>
          <Text style={feature}>
            <strong>✓ Participate in DAO governance</strong> – Shape the future together
          </Text>
        </Section>
        <Section style={buttonContainer}>
          <Button style={button} href={profileUrl}>
            Complete Your Profile
          </Button>
        </Section>
        <Text style={footer}>Questions? Just reply to this email – we're here to help!</Text>
      </Container>
    </Body>
  </Html>
);

export default WelcomeEmail;

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

const heading2 = {
  color: '#333',
  fontSize: '18px',
  fontWeight: 'bold',
  margin: '24px 0 12px',
  padding: '0 40px',
};

const text = {
  color: '#333',
  fontSize: '16px',
  lineHeight: '26px',
  padding: '0 40px',
};

const features = {
  padding: '0 40px',
};

const feature = {
  color: '#333',
  fontSize: '16px',
  lineHeight: '26px',
  margin: '8px 0',
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

const footer = {
  color: '#8898aa',
  fontSize: '12px',
  lineHeight: '16px',
  padding: '0 40px',
  marginTop: '24px',
  textAlign: 'center' as const,
};
