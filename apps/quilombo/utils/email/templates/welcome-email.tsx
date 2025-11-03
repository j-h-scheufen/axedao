import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

import { emailStyles } from './styles';

interface WelcomeEmailProps {
  profileUrl: string;
  logoUrl: string;
  userName?: string;
}

export const WelcomeEmail = ({ profileUrl, logoUrl, userName }: WelcomeEmailProps) => (
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
    <Preview>Welcome to Quilombo! Your account is now active</Preview>
    <Body style={emailStyles.main} className="dark-mode-bg">
      <Container style={emailStyles.container} className="dark-mode-container">
        <Section style={emailStyles.logoContainer}>
          <img src={logoUrl} width="80" height="80" alt="Quilombo" style={emailStyles.logo} />
        </Section>
        <Heading style={emailStyles.h1} className="dark-mode-heading">
          Welcome to Quilombo! 🎉
        </Heading>
        <Text style={emailStyles.text} className="dark-mode-text">
          {userName ? `Hi ${userName},` : 'Hi there,'}
        </Text>
        <Text style={emailStyles.text} className="dark-mode-text">
          Your account has been successfully activated! You're now part of a vibrant community connecting people through
          local groups and events.
        </Text>
        <Text style={emailStyles.h2} className="dark-mode-heading">
          Here's what you can do:
        </Text>
        <Section style={emailStyles.section}>
          <Text style={emailStyles.feature} className="dark-mode-text">
            <strong>✓ Create and join groups</strong> – Find your community
          </Text>
          <Text style={emailStyles.feature} className="dark-mode-text">
            <strong>✓ Discover events</strong> – Connect in person
          </Text>
          <Text style={emailStyles.feature} className="dark-mode-text">
            <strong>✓ Engage with your community</strong> – Build meaningful connections
          </Text>
          <Text style={emailStyles.feature} className="dark-mode-text">
            <strong>✓ Participate in DAO governance</strong> – Shape the future together
          </Text>
        </Section>
        <Section style={emailStyles.buttonContainer}>
          <Button style={{ ...emailStyles.button, ...emailStyles.buttonPrimary }} href={profileUrl}>
            Complete Your Profile
          </Button>
        </Section>
        <Text style={emailStyles.footerCentered} className="dark-mode-text">
          Questions? Just reply to this email – we're here to help!
        </Text>
      </Container>
    </Body>
  </Html>
);

export default WelcomeEmail;
