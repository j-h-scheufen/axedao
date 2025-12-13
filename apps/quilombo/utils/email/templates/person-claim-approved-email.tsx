import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface PersonClaimApprovedEmailProps {
  profileDisplayName: string;
  profileId: string;
  claimerName: string;
  profileUrl: string;
}

export const PersonClaimApprovedEmail = ({
  profileDisplayName,
  // biome-ignore lint/correctness/noUnusedFunctionParameters: profileId is passed through from email providers but not used in template
  profileId,
  claimerName,
  profileUrl,
}: PersonClaimApprovedEmailProps) => (
  <Html>
    <Head />
    <Preview>Your genealogy profile claim for {profileDisplayName} has been approved!</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Profile Claim Approved!</Heading>

        <Text style={text}>
          Great news, <strong>{claimerName}</strong>! Your request to claim the genealogy profile{' '}
          <strong>{profileDisplayName}</strong> has been approved.
        </Text>

        <Text style={text}>
          Your account is now linked to this genealogy profile. You can view and manage your profile in the Capoeira
          Genealogy.
        </Text>

        <Section style={buttonContainer}>
          <Button style={button} href={profileUrl}>
            View Your Profile
          </Button>
        </Section>

        <Text style={text}>Or copy and paste this link into your browser:</Text>
        <Text style={link}>{profileUrl}</Text>

        <Text style={divider}>---</Text>

        <Text style={text}>
          Boas noticias, <strong>{claimerName}</strong>! Sua solicitacao para reivindicar o perfil genealogico{' '}
          <strong>{profileDisplayName}</strong> foi aprovada.
        </Text>

        <Text style={text}>
          Sua conta agora esta vinculada a este perfil genealogico. Voce pode visualizar e gerenciar seu perfil na
          Genealogia da Capoeira.
        </Text>

        <Text style={footer}>Need help? Contact us at support@quilombo.net</Text>
        <Text style={footer}>Precisa de ajuda? Entre em contato conosco em support@quilombo.net</Text>
      </Container>
    </Body>
  </Html>
);

export default PersonClaimApprovedEmail;

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
