import ENV, { getBaseUrl } from './config/environment';

/**
 * Next.js instrumentation hook - runs once on server startup
 * Used to log important configuration information
 */
export async function register() {
  if (process.env.NEXT_RUNTIME === 'nodejs') {
    console.log('\n========================================');
    console.log('Quilombo Configuration');
    console.log('========================================');
    console.log(`App Environment: ${ENV.environment}`);
    console.log(`Wallet Environment: ${ENV.walletEnvironment}`);
    console.log(`Chain Environment: ${ENV.chainEnvironment}`);
    console.log(`Base URL: ${getBaseUrl()}`);

    if (ENV.environment === 'development') {
      console.log(`Email Provider: SMTP (${ENV.smtpHost}:${ENV.smtpPort})`);
    } else {
      console.log(`Email Provider: Mailjet`);
    }

    console.log('========================================\n');
  }
}
