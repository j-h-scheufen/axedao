import { Body, Container, Head, Heading, Html, Preview, Text } from '@react-email/components';

interface PersonClaimRejectedEmailProps {
  profileDisplayName: string;
  claimerName: string;
  reason: string;
}

export const PersonClaimRejectedEmail = ({
  profileDisplayName,
  claimerName,
  reason,
}: PersonClaimRejectedEmailProps) => (
  <Html>
    <Head />
    <Preview>Your genealogy profile claim for {profileDisplayName} has been reviewed</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Profile Claim Reviewed</Heading>

        <Text style={text}>
          Dear <strong>{claimerName}</strong>,
        </Text>

        <Text style={text}>
          We have reviewed your request to claim the genealogy profile <strong>{profileDisplayName}</strong>. After
          careful consideration, we were unable to approve your claim at this time.
        </Text>

        <Text style={reasonBox}>
          <strong>Reason:</strong>
          <br />
          {reason}
        </Text>

        <Text style={text}>
          If you believe this decision was made in error, or if you have additional information that could help verify
          your identity, please contact our support team.
        </Text>

        <Text style={divider}>---</Text>

        <Text style={text}>
          Prezado(a) <strong>{claimerName}</strong>,
        </Text>

        <Text style={text}>
          Analisamos sua solicitacao para reivindicar o perfil genealogico <strong>{profileDisplayName}</strong>. Apos
          uma analise cuidadosa, nao foi possivel aprovar sua solicitacao neste momento.
        </Text>

        <Text style={reasonBox}>
          <strong>Motivo:</strong>
          <br />
          {reason}
        </Text>

        <Text style={text}>
          Se voce acredita que esta decisao foi tomada por engano, ou se tiver informacoes adicionais que possam ajudar
          a verificar sua identidade, entre em contato com nossa equipe de suporte.
        </Text>

        <Text style={footer}>Need help? Contact us at support@quilombo.net</Text>
        <Text style={footer}>Precisa de ajuda? Entre em contato conosco em support@quilombo.net</Text>
      </Container>
    </Body>
  </Html>
);

export default PersonClaimRejectedEmail;

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

const reasonBox = {
  color: '#333',
  fontSize: '14px',
  lineHeight: '24px',
  padding: '16px 20px',
  margin: '20px 40px',
  backgroundColor: '#f8fafc',
  borderRadius: '8px',
  border: '1px solid #e2e8f0',
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
