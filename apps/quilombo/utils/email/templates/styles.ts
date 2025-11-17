/**
 * Shared styles for email templates
 * Ensures consistent branding and layout across all emails
 */

export const emailStyles = {
  // Main body styles
  main: {
    backgroundColor: '#f6f9fc',
    fontFamily: '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif',
  },

  // Container styles
  container: {
    backgroundColor: '#ffffff',
    margin: '0 auto',
    padding: '20px 0 48px',
    marginBottom: '64px',
  },

  // Logo styles
  logoContainer: {
    textAlign: 'center' as const,
    padding: '20px 0',
  },

  logo: {
    margin: '0 auto',
  },

  // Heading styles
  h1: {
    color: '#333',
    fontSize: '24px',
    fontWeight: 'bold',
    margin: '40px 0',
    padding: '0',
    textAlign: 'center' as const,
  },

  h2: {
    color: '#333',
    fontSize: '18px',
    fontWeight: 'bold',
    margin: '24px 0 12px',
    padding: '0 40px',
  },

  // Text styles
  text: {
    color: '#333',
    fontSize: '16px',
    lineHeight: '26px',
    padding: '0 40px',
  },

  textCentered: {
    color: '#333',
    fontSize: '16px',
    lineHeight: '26px',
    padding: '0 40px',
    textAlign: 'center' as const,
  },

  // Button styles
  buttonContainer: {
    padding: '27px 0 27px',
    textAlign: 'center' as const,
  },

  button: {
    borderRadius: '4px',
    color: '#fff',
    fontSize: '16px',
    fontWeight: 'bold',
    textDecoration: 'none',
    textAlign: 'center' as const,
    display: 'inline-block',
    padding: '12px 24px',
  },

  // Button variants
  buttonPrimary: {
    backgroundColor: '#22c55e',
  },

  buttonDanger: {
    backgroundColor: '#dc3545',
  },

  // Link styles
  link: {
    fontSize: '14px',
    textDecoration: 'underline',
    padding: '0 40px',
    wordBreak: 'break-all' as const,
  },

  linkPrimary: {
    color: '#22c55e',
  },

  linkDanger: {
    color: '#dc3545',
  },

  // Divider for bilingual content
  divider: {
    color: '#8898aa',
    fontSize: '16px',
    textAlign: 'center' as const,
    padding: '0 40px',
    marginTop: '32px',
    marginBottom: '32px',
  },

  // Footer styles
  footer: {
    color: '#8898aa',
    fontSize: '12px',
    lineHeight: '16px',
    padding: '0 40px',
    marginTop: '8px',
  },

  footerCentered: {
    color: '#8898aa',
    fontSize: '12px',
    lineHeight: '16px',
    padding: '0 40px',
    marginTop: '8px',
    textAlign: 'center' as const,
  },

  // Section styles
  section: {
    padding: '0 40px',
  },

  // Feature list styles (for welcome email)
  feature: {
    color: '#333',
    fontSize: '16px',
    lineHeight: '26px',
    margin: '8px 0',
  },
};
