import { Body, Button, Container, Head, Heading, Html, Img, Preview, Section, Text } from '@react-email/components';

import { emailStyles } from './styles';

interface WelcomeEmailProps {
  profileUrl: string;
  logoUrl: string;
  userName?: string;
}

export const WelcomeEmail = ({ profileUrl, logoUrl, userName }: WelcomeEmailProps) => (
  <Html>
    <Head />
    <Preview>Welcome to Quilombo! Your account is now active</Preview>
    <Body style={emailStyles.main}>
      <Container style={emailStyles.container}>
        <Section style={emailStyles.logoContainer}>
          <Img src={logoUrl} width={80} height={80} alt="Quilombo" style={emailStyles.logo} />
        </Section>
        <Heading style={emailStyles.h1}>Welcome to Quilombo! 🎉</Heading>
        <Text style={emailStyles.text}>{userName ? `Hi ${userName},` : 'Hi there,'}</Text>
        <Text style={emailStyles.text}>
          Your account has been successfully activated! Quilombo is an app built by members of the global Capoeira
          community to connect with other Capoeristas and groups and find local events.
        </Text>
        <Text style={emailStyles.text}>
          We're constantly adding new features and would like to hear your ideas, too!
        </Text>
        <Text style={emailStyles.text}>Muito Ax&eacute;!</Text>
        <Text style={emailStyles.h2}>Here's what you can do:</Text>
        <Section style={emailStyles.section}>
          <Text style={emailStyles.feature}>
            <strong>✓ Register your group or join an existing one</strong> – Find your community
          </Text>
          <Text style={emailStyles.feature}>
            <strong>✓ Discover events and groups in your area</strong> – Connect in person
          </Text>
          <Text style={emailStyles.feature}>
            <strong>✓ Participate in DAO governance</strong> – Democratic decision-making within the community
          </Text>
        </Section>
        <Section style={emailStyles.buttonContainer}>
          <Button style={{ ...emailStyles.button, ...emailStyles.buttonPrimary }} href={profileUrl}>
            Complete Your Profile
          </Button>
        </Section>
        <Text style={emailStyles.footerCentered}>Questions? Just reply to this email – we're here to help!</Text>
      </Container>
    </Body>
  </Html>
);

export default WelcomeEmail;
