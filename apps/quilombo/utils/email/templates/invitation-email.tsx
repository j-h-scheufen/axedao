import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface InvitationEmailProps {
  inviteUrl: string;
  inviterName: string;
  invitedEmail: string;
}

export const InvitationEmail = ({ inviteUrl, inviterName, invitedEmail }: InvitationEmailProps) => (
  <Html>
    <Head />
    <Preview>You've been invited to join Quilombo by {inviterName}</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>You're Invited to Quilombo!</Heading>
        <Text style={text}>
          <strong>{inviterName}</strong> has invited you to join <strong>Quilombo</strong>, the global Capoeira
          community platform.
        </Text>
        <Text style={text}>
          Quilombo connects Capoeira practitioners worldwide, helping you find groups, events, and fellow capoeiristas
          in your area and around the globe.
        </Text>
        <Section style={buttonContainer}>
          <Button style={button} href={inviteUrl}>
            Accept Invitation
          </Button>
        </Section>
        <Text style={text}>Or copy and paste this link into your browser:</Text>
        <Text style={link}>{inviteUrl}</Text>

        <Text style={divider}>---</Text>

        <Text style={text}>
          <strong>{inviterName}</strong> convidou você para participar do <strong>Quilombo</strong>, a plataforma global
          da comunidade de Capoeira.
        </Text>
        <Text style={text}>
          O Quilombo conecta praticantes de Capoeira em todo o mundo, ajudando você a encontrar grupos, eventos e
          capoeiristas na sua área e ao redor do globo.
        </Text>

        <Text style={footer}>
          This invitation was sent to <strong>{invitedEmail}</strong> and will expire in 30 days. If you didn't expect
          this invitation, you can safely ignore this email.
        </Text>
        <Text style={footer}>
          Este convite foi enviado para <strong>{invitedEmail}</strong> e expirará em 30 dias. Se você não esperava este
          convite, pode ignorar este email com segurança.
        </Text>
        <Text style={footer}>Need help? Contact us at support@quilombo.net</Text>
        <Text style={footer}>Precisa de ajuda? Entre em contato conosco em support@quilombo.net</Text>
      </Container>
    </Body>
  </Html>
);

export default InvitationEmail;

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
