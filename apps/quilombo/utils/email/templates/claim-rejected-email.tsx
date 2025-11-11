import { Body, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface ClaimRejectedEmailProps {
  groupName: string;
  claimerName: string;
  reason: string;
}

export const ClaimRejectedEmail = ({ groupName, claimerName, reason }: ClaimRejectedEmailProps) => (
  <Html>
    <Head />
    <Preview>Group claim update for {groupName}</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Group Claim Update</Heading>

        <Text style={text}>
          Hello <strong>{claimerName}</strong>,
        </Text>

        <Text style={text}>
          Thank you for your interest in claiming <strong>{groupName}</strong>. After reviewing your request, we were
          unable to approve your claim at this time.
        </Text>

        <Section style={infoBox}>
          <Text style={label}>Reason:</Text>
          <Text style={value}>{reason}</Text>
        </Section>

        <Text style={text}>
          If you believe this decision was made in error or if you have additional information to support your claim,
          please contact us at support@quilombo.net.
        </Text>

        <Text style={text}>We appreciate your engagement with the Quilombo community.</Text>

        <Text style={divider}>---</Text>

        <Text style={text}>
          Olá <strong>{claimerName}</strong>,
        </Text>

        <Text style={text}>
          Obrigado pelo seu interesse em reivindicar <strong>{groupName}</strong>. Após revisar sua solicitação, não
          pudemos aprovar sua reivindicação neste momento.
        </Text>

        <Text style={text}>
          Se você acredita que esta decisão foi feita por engano ou se você tem informações adicionais para apoiar sua
          reivindicação, entre em contato conosco em support@quilombo.net.
        </Text>

        <Text style={text}>Agradecemos seu envolvimento com a comunidade Quilombo.</Text>

        <Text style={footer}>Need help? Contact us at support@quilombo.net</Text>
        <Text style={footer}>Precisa de ajuda? Entre em contato conosco em support@quilombo.net</Text>
      </Container>
    </Body>
  </Html>
);

export default ClaimRejectedEmail;

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
  marginTop: '0',
  marginBottom: '8px',
};

const value = {
  color: '#333',
  fontSize: '14px',
  marginTop: '0',
  marginBottom: '0',
  whiteSpace: 'pre-wrap' as const,
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
