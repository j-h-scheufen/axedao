import { db } from '@/db';
import { sql } from 'drizzle-orm';

export const fetchAllTables = async () => {
  const tables = await db.execute(
    sql`
      SELECT table_name
      FROM information_schema.tables
      WHERE table_schema = 'public'
        AND table_type = 'BASE TABLE';
    `,
  );
  return Array.from(tables);
};

// Drop all tables in the schema
export const dropAllTables = async () => {
  const tables = await fetchAllTables();
  if (!tables.length) return;
  const tableStrings = tables.map(({ table_name }) => table_name).join(', ');
  try {
    await db.execute(sql`DROP TABLE IF EXISTS ${tableStrings} CASCADE;`);
    console.log('All tables dropped successfully');
  } catch (error) {
    console.error('Error dropping tables:', error);
  }
};
