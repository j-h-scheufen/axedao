import 'dotenv/config';
import { migrate } from 'drizzle-orm/postgres-js/migrator';
import { client, db } from '.';

const main = async () => {
  try {
    // This will run migrations on the database, skipping the ones already applied
    await migrate(db, { migrationsFolder: './db/migrations' });
  } catch (error) {
    console.error(error);
  }

  // Don't forget to close the connection, otherwise the script will hang
  await client.end();
};

main();
