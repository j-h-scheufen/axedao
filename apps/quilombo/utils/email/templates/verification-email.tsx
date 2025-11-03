import { Body, Button, Container, Head, Heading, Html, Img, Preview, Section, Text } from '@react-email/components';

import { emailStyles } from './styles';

interface VerificationEmailProps {
  verifyUrl: string;
  logoUrl: string;
  userName?: string;
}

export const VerificationEmail = ({ verifyUrl, logoUrl, userName }: VerificationEmailProps) => (
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
    <Preview>Verify your Quilombo account</Preview>
    <Body style={emailStyles.main} className="dark-mode-bg">
      <Container style={emailStyles.container} className="dark-mode-container">
        <Section style={emailStyles.logoContainer}>
          <Img src={logoUrl} width={80} height={80} alt="Quilombo" style={emailStyles.logo} />
        </Section>
        <Heading style={emailStyles.h1} className="dark-mode-heading">
          Welcome to Quilombo!
        </Heading>
        <Text style={emailStyles.text} className="dark-mode-text">
          {userName ? `Hi ${userName},` : 'Hi there,'}
        </Text>
        <Text style={emailStyles.text} className="dark-mode-text">
          Thanks for signing up! Click the button below to verify your email address and activate your account.
        </Text>
        <Section style={emailStyles.buttonContainer}>
          <Button style={{ ...emailStyles.button, ...emailStyles.buttonPrimary }} href={verifyUrl}>
            Verify Email
          </Button>
        </Section>
        <Text style={emailStyles.text} className="dark-mode-text">
          Or copy and paste this link into your browser:
        </Text>
        <Text style={{ ...emailStyles.link, ...emailStyles.linkPrimary }}>{verifyUrl}</Text>
        <Text style={emailStyles.footer} className="dark-mode-text">
          This link will expire in 30 minutes. If you didn't create this account, you can safely ignore this email.
        </Text>
      </Container>
    </Body>
  </Html>
);

export default VerificationEmail;
