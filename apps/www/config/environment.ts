type ConfigType = {
  appUrl: string;
};

// const envMode = process.env.NEXT_PUBLIC_APP_ENV?.toLowerCase();

const ENV: ConfigType = {
  appUrl: required(process.env.NEXT_PUBLIC_APP_URL, 'NEXT_PUBLIC_APP_URL'),
};

function required(value: string | undefined, name: string): string {
  if (!value) {
    throw new Error(`Missing required environment variable ${name}`);
  }
  return value;
}

export default ENV;
