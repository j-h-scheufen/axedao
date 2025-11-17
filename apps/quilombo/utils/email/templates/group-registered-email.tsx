import { Body, Button, Container, Head, Heading, Html, Preview, Section, Text } from '@react-email/components';

interface GroupRegisteredEmailProps {
  groupName: string;
  groupId: string;
  userName: string;
  groupManagementUrl: string;
}

export const GroupRegisteredEmail = ({
  groupName,
  // biome-ignore lint/correctness/noUnusedFunctionParameters: groupId is passed through from email providers but not used in template
  groupId,
  userName,
  groupManagementUrl,
}: GroupRegisteredEmailProps) => (
  <Html>
    <Head />
    <Preview>Your group {groupName} has been registered.</Preview>
    <Body style={main}>
      <Container style={container}>
        <Heading style={h1}>Group registration successful</Heading>

        <Text style={text}>
          Thank you, <strong>{userName}</strong>, for registering <strong>{groupName}</strong> on Quilombo!
        </Text>

        <Text style={text}>You are now the administrator of this group. As an admin, you can:</Text>

        <Text style={featureText}>✓ Edit your group's name, description, and contact information</Text>
        <Text style={featureText}>✓ Promote other group members to admin</Text>
        <Text style={featureText}>✓ Remove members from the group</Text>

        <Section style={buttonContainer}>
          <Button style={button} href={groupManagementUrl}>
            Edit Group
          </Button>
        </Section>

        <Text style={text}>Or copy and paste this link into your browser:</Text>
        <Text style={link}>{groupManagementUrl}</Text>

        <Text style={divider}>---</Text>

        <Text style={text}>
          Obrigado, <strong>{userName}</strong>, por registrar <strong>{groupName}</strong> no Quilombo!
        </Text>

        <Text style={text}>Agora você é o administrador deste grupo. Como administrador, você pode:</Text>

        <Text style={featureText}>✓ Editar o nome, descrição e informações de contato do grupo</Text>
        <Text style={featureText}>✓ Promover outros membros do grupo a administrador</Text>
        <Text style={featureText}>✓ Remover membros do grupo</Text>

        <Text style={footer}>Need help? Contact us at support@quilombo.net</Text>
        <Text style={footer}>Precisa de ajuda? Entre em contato conosco em support@quilombo.net</Text>
      </Container>
    </Body>
  </Html>
);

export default GroupRegisteredEmail;

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

const featureText = {
  color: '#333',
  fontSize: '16px',
  lineHeight: '26px',
  padding: '0 40px',
  marginTop: '8px',
  marginBottom: '8px',
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
