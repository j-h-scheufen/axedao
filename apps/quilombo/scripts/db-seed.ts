#!/usr/bin/env tsx
/**
 * Seeds the local database with test data
 * Usage: tsx scripts/db-seed.ts
 */

import { createDatabaseConnection } from '../db/connection';
import * as schema from '../db/schema';
import { hash } from 'bcrypt';
import { v4 as uuidv4 } from 'uuid';

const LOCAL_DATABASE_URL = 'postgres://postgres:mypassword@localhost:5433/postgres';

async function seed() {
  console.log('🌱 Seeding local database...');

  const { db } = createDatabaseConnection(LOCAL_DATABASE_URL);

  try {
    // Create test users - fully activated as if they went through the invitation flow
    const password = await hash('password123', 10);

    const testUsers = [
      {
        id: uuidv4(),
        email: 'admin@test.com',
        name: 'Admin User',
        passwordHash: password,
        accountStatus: 'active' as const,
        emailVerifiedAt: new Date(),
        isGlobalAdmin: true,
        title: 'mestre' as const,
        createdAt: new Date(),
      },
      {
        id: uuidv4(),
        email: 'user1@test.com',
        name: 'Maria Silva',
        passwordHash: password,
        accountStatus: 'active' as const,
        emailVerifiedAt: new Date(),
        isGlobalAdmin: false,
        title: 'aluna' as const,
        createdAt: new Date(),
      },
      {
        id: uuidv4(),
        email: 'user2@test.com',
        name: 'João Santos',
        passwordHash: password,
        accountStatus: 'active' as const,
        emailVerifiedAt: new Date(),
        isGlobalAdmin: false,
        title: 'professor' as const,
        createdAt: new Date(),
      },
    ];

    console.log('Creating fully activated test users...');
    await db.insert(schema.users).values(testUsers);
    console.log(`✅ Created ${testUsers.length} active users (email verified)`);

    console.log('\n🎉 Seeding completed successfully!');
    console.log('\nTest accounts (all fully activated):');
    console.log('  admin@test.com / password123 (Global Admin, Mestre)');
    console.log('  user1@test.com / password123 (Maria Silva, Aluna)');
    console.log('  user2@test.com / password123 (João Santos, Professor)');

    process.exit(0);
  } catch (error) {
    console.error('❌ Seeding failed:', error);
    process.exit(1);
  }
}

seed();
