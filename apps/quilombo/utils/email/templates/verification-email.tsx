import { Body, Button, Container, Head, Heading, Html, Img, Preview, Section, Text } from '@react-email/components';

import { emailStyles } from './styles';

interface VerificationEmailProps {
  verifyUrl: string;
  logoUrl: string;
  userName?: string;
}

export const VerificationEmail = ({ verifyUrl, logoUrl, userName }: VerificationEmailProps) => (
  <Html>
    <Head />
    <Preview>Verify your Quilombo account</Preview>
    <Body style={emailStyles.main}>
      <Container style={emailStyles.container}>
        <Section style={emailStyles.logoContainer}>
          <Img src={logoUrl} width={80} height={80} alt="Quilombo" style={emailStyles.logo} />
        </Section>
        <Heading style={emailStyles.h1}>Welcome to Quilombo!</Heading>
        <Text style={emailStyles.text}>{userName ? `Hi ${userName},` : 'Hi there,'}</Text>
        <Text style={emailStyles.text}>
          Thanks for signing up! Click the button below to verify your email address and activate your account.
        </Text>
        <Section style={emailStyles.buttonContainer}>
          <Button style={{ ...emailStyles.button, ...emailStyles.buttonPrimary }} href={verifyUrl}>
            Verify Email
          </Button>
        </Section>
        <Text style={emailStyles.text}>Or copy and paste this link into your browser:</Text>
        <Text style={{ ...emailStyles.link, ...emailStyles.linkPrimary }}>{verifyUrl}</Text>

        <Text style={emailStyles.divider}>---</Text>

        <Text style={emailStyles.text}>{userName ? `Olá ${userName},` : 'Olá,'}</Text>
        <Text style={emailStyles.text}>
          Obrigado por se cadastrar! Clique no botão acima para verificar seu endereço de email e ativar sua conta.
        </Text>

        <Text style={emailStyles.footer}>
          This link will expire in 30 minutes. If you didn't create this account, you can safely ignore this email.
        </Text>
        <Text style={emailStyles.footer}>
          Este link expirará em 30 minutos. Se você não criou esta conta, pode ignorar este email com segurança.
        </Text>
      </Container>
    </Body>
  </Html>
);

export default VerificationEmail;
