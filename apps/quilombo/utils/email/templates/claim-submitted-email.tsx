import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface ClaimSubmittedEmailProps {
  groupName: string;
  claimerName: string;
  claimerEmail: string;
  userMessage: string;
  adminPanelUrl: string;
}

export const ClaimSubmittedEmail = ({
  groupName,
  claimerName,
  claimerEmail,
  userMessage,
  adminPanelUrl,
}: ClaimSubmittedEmailProps) => (
  <Html>
    <Head />
    <Preview>New group claim request from {claimerName}</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>New Group Claim Request</Heading>

        <Text style={text}>
          <strong>{claimerName}</strong> ({claimerEmail}) has submitted a request to claim <strong>{groupName}</strong>.
        </Text>

        <Section style={infoBox}>
          <Text style={label}>Group:</Text>
          <Text style={value}>{groupName}</Text>

          <Text style={label}>Claimer:</Text>
          <Text style={value}>
            {claimerName} ({claimerEmail})
          </Text>

          <Text style={label}>Message:</Text>
          <Text style={value}>{userMessage}</Text>
        </Section>

        <Section style={buttonContainer}>
          <Button style={button} href={adminPanelUrl}>
            Review Claim Request
          </Button>
        </Section>

        <Text style={text}>Or copy and paste this link into your browser:</Text>
        <Text style={link}>{adminPanelUrl}</Text>

        <Text style={divider}>---</Text>

        <Text style={text}>
          <strong>{claimerName}</strong> ({claimerEmail}) enviou uma solicitação para reivindicar{' '}
          <strong>{groupName}</strong>.
        </Text>

        <Text style={footer}>This is an automated notification from Quilombo.</Text>
        <Text style={footer}>Esta é uma notificação automática do Quilombo.</Text>
      </Container>
    </Body>
  </Html>
);

export default ClaimSubmittedEmail;

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
  marginTop: '16px',
};

const infoBox = {
  backgroundColor: '#f8f9fa',
  border: '1px solid #e9ecef',
  borderRadius: '4px',
  margin: '24px 40px',
  padding: '16px',
};

const label = {
  color: '#666',
  fontSize: '14px',
  fontWeight: 'bold',
  marginTop: '12px',
  marginBottom: '4px',
};

const value = {
  color: '#333',
  fontSize: '14px',
  marginTop: '0',
  marginBottom: '0',
  whiteSpace: 'pre-wrap' as const,
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

const divider = {
  color: '#8898aa',
  fontSize: '16px',
  textAlign: 'center' as const,
  padding: '0 40px',
  marginTop: '32px',
  marginBottom: '32px',
};

const footer = {
  color: '#8898aa',
  fontSize: '12px',
  lineHeight: '16px',
  padding: '0 40px',
  marginTop: '8px',
};
