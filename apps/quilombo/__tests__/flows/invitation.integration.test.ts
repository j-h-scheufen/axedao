/**
 * Integration tests for invitation business flow
 * Tests the complete invitation workflow from creation to signup
 *
 * Business Flow:
 * 1. User creates invitation (email-bound or open)
 * 2. Recipient validates invitation code
 * 3. Recipient signs up using invitation code
 * 4. System marks invitation as accepted and links users
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { and, eq, gte } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';
import type { InvitationType } from '@/types/model';

describe('Invitation Flow (Integration Tests)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  // Test data
  let inviterId: string;
  let inviterEmail: string;
  let recipientEmail: string;

  beforeAll(async () => {
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();

    // Create inviter user
    inviterId = uuidv4();
    inviterEmail = 'inviter@example.com';
    recipientEmail = 'recipient@example.com';

    await db.insert(schema.users).values({
      id: inviterId,
      email: inviterEmail,
      nickname: 'Inviter',
      isGlobalAdmin: false,
    });
  });

  // Helper functions that use test database instance
  async function createInvitation(
    createdBy: string,
    type: InvitationType,
    invitedEmail?: string
  ): Promise<schema.SelectInvitation> {
    const expiresAt = new Date();
    if (type === 'email_bound') {
      expiresAt.setDate(expiresAt.getDate() + 30);
    } else {
      expiresAt.setHours(expiresAt.getHours() + 72);
    }

    if (type === 'email_bound' && invitedEmail) {
      await db
        .update(schema.invitations)
        .set({ status: 'expired' })
        .where(
          and(
            eq(schema.invitations.type, 'email_bound'),
            eq(schema.invitations.invitedEmail, invitedEmail.toLowerCase()),
            eq(schema.invitations.status, 'pending')
          )
        );
    } else if (type === 'open') {
      await invalidateUserOpenInvites(createdBy);
    }

    const invitations = await db
      .insert(schema.invitations)
      .values({
        createdBy,
        type,
        invitedEmail: invitedEmail?.toLowerCase() || null,
        expiresAt,
        status: 'pending',
      })
      .returning();

    if (!invitations.length) {
      throw new Error('Failed to create invitation');
    }

    return invitations[0];
  }

  async function findValidInvitation(code: string, email?: string): Promise<schema.SelectInvitation | null> {
    const invitation = await db.query.invitations.findFirst({
      where: and(
        eq(schema.invitations.code, code),
        eq(schema.invitations.status, 'pending'),
        gte(schema.invitations.expiresAt, new Date())
      ),
    });

    if (!invitation) return null;

    if (invitation.type === 'email_bound') {
      if (!email || invitation.invitedEmail !== email.toLowerCase()) {
        return null;
      }
    }

    return invitation;
  }

  async function markInvitationAccepted(code: string, acceptedBy: string): Promise<void> {
    await db
      .update(schema.invitations)
      .set({
        status: 'accepted',
        acceptedAt: new Date(),
        acceptedBy,
      })
      .where(eq(schema.invitations.code, code));
  }

  async function getUserActiveOpenInvite(userId: string): Promise<schema.SelectInvitation | undefined> {
    return await db.query.invitations.findFirst({
      where: and(
        eq(schema.invitations.createdBy, userId),
        eq(schema.invitations.type, 'open'),
        eq(schema.invitations.status, 'pending'),
        gte(schema.invitations.expiresAt, new Date())
      ),
    });
  }

  async function invalidateUserOpenInvites(userId: string): Promise<void> {
    await db
      .update(schema.invitations)
      .set({ status: 'expired' })
      .where(
        and(
          eq(schema.invitations.createdBy, userId),
          eq(schema.invitations.type, 'open'),
          eq(schema.invitations.status, 'pending')
        )
      );
  }

  async function insertUser(userValues: schema.InsertUser) {
    const rows = await db.insert(schema.users).values(userValues).returning();
    return rows[0];
  }

  async function fetchUser(userId: string): Promise<schema.SelectUser | undefined> {
    return await db.query.users.findFirst({
      where: eq(schema.users.id, userId),
    });
  }

  describe('Email-Bound Invitation Flow', () => {
    it('should complete full email-bound invitation workflow', async () => {
      // Step 1: Create email-bound invitation
      const invitation = await createInvitation(inviterId, 'email_bound', recipientEmail);

      expect(invitation.type).toBe('email_bound');
      expect(invitation.invitedEmail).toBe(recipientEmail.toLowerCase());
      expect(invitation.status).toBe('pending');
      expect(invitation.createdBy).toBe(inviterId);
      expect(invitation.code).toBeTruthy();

      // Step 2: Validate invitation code with matching email
      const validInvitation = await findValidInvitation(invitation.code, recipientEmail);

      expect(validInvitation).toBeTruthy();
      expect(validInvitation?.code).toBe(invitation.code);
      expect(validInvitation?.invitedEmail).toBe(recipientEmail.toLowerCase());

      // Step 3: Signup - create new user with invitation attribution
      const newUserId = uuidv4();
      await insertUser({
        id: newUserId,
        email: recipientEmail,
        nickname: 'NewUser',
        invitedBy: inviterId,
        isGlobalAdmin: false,
      });

      // Step 4: Mark invitation as accepted
      await markInvitationAccepted(invitation.code, newUserId);

      // Verify final state
      const acceptedInvitation = await db.query.invitations.findFirst({
        where: eq(schema.invitations.code, invitation.code),
      });

      expect(acceptedInvitation?.status).toBe('accepted');
      expect(acceptedInvitation?.acceptedBy).toBe(newUserId);
      expect(acceptedInvitation?.acceptedAt).toBeTruthy();

      // Verify user was created with invitation attribution
      const newUser = await fetchUser(newUserId);
      expect(newUser?.invitedBy).toBe(inviterId);
    });

    it('should reject validation with mismatched email', async () => {
      const invitation = await createInvitation(inviterId, 'email_bound', recipientEmail);

      // Try to validate with wrong email
      const validInvitation = await findValidInvitation(invitation.code, 'wrong@example.com');

      expect(validInvitation).toBeNull();
    });

    it('should reject validation without email for email-bound invitation', async () => {
      const invitation = await createInvitation(inviterId, 'email_bound', recipientEmail);

      // Try to validate without providing email
      const validInvitation = await findValidInvitation(invitation.code);

      expect(validInvitation).toBeNull();
    });

    it('should replace existing pending invitation for same email', async () => {
      // Create first invitation
      const invitation1 = await createInvitation(inviterId, 'email_bound', recipientEmail);

      // Create second invitation for same email
      const invitation2 = await createInvitation(inviterId, 'email_bound', recipientEmail);

      // First invitation should be expired
      const expiredInvitation = await db.query.invitations.findFirst({
        where: eq(schema.invitations.code, invitation1.code),
      });

      expect(expiredInvitation?.status).toBe('expired');

      // Second invitation should be pending
      expect(invitation2.status).toBe('pending');
      expect(invitation2.code).not.toBe(invitation1.code);
    });

    it('should handle case-insensitive email matching', async () => {
      const invitation = await createInvitation(inviterId, 'email_bound', 'Test@Example.COM');

      // Validate with different casing
      const validInvitation = await findValidInvitation(invitation.code, 'test@example.com');

      expect(validInvitation).toBeTruthy();
      expect(validInvitation?.invitedEmail).toBe('test@example.com');
    });

    it('should set correct expiry for email-bound invitations (30 days)', async () => {
      const beforeCreate = new Date();
      const invitation = await createInvitation(inviterId, 'email_bound', recipientEmail);
      const afterCreate = new Date();

      const expiresAt = new Date(invitation.expiresAt);
      const expectedMin = new Date(beforeCreate.getTime() + 29 * 24 * 60 * 60 * 1000); // 29 days
      const expectedMax = new Date(afterCreate.getTime() + 31 * 24 * 60 * 60 * 1000); // 31 days

      expect(expiresAt.getTime()).toBeGreaterThan(expectedMin.getTime());
      expect(expiresAt.getTime()).toBeLessThan(expectedMax.getTime());
    });
  });

  describe('Open Invitation Flow', () => {
    it('should complete full open invitation workflow', async () => {
      // Step 1: Create open invitation (QR code)
      const invitation = await createInvitation(inviterId, 'open');

      expect(invitation.type).toBe('open');
      expect(invitation.invitedEmail).toBeNull();
      expect(invitation.status).toBe('pending');
      expect(invitation.createdBy).toBe(inviterId);

      // Step 2: Validate invitation code (no email required)
      const validInvitation = await findValidInvitation(invitation.code);

      expect(validInvitation).toBeTruthy();
      expect(validInvitation?.code).toBe(invitation.code);

      // Step 3: Signup - create new user with invitation attribution
      const newUserId = uuidv4();
      await insertUser({
        id: newUserId,
        email: 'anyuser@example.com',
        nickname: 'AnyUser',
        invitedBy: inviterId,
        isGlobalAdmin: false,
      });

      // Note: Open invitations are NOT marked as accepted (reusable within expiry)
      // Verify user was created with invitation attribution
      const newUser = await fetchUser(newUserId);
      expect(newUser?.invitedBy).toBe(inviterId);

      // Invitation should still be pending and reusable
      const stillValidInvitation = await findValidInvitation(invitation.code);
      expect(stillValidInvitation).toBeTruthy();
      expect(stillValidInvitation?.status).toBe('pending');
    });

    it('should invalidate previous open invites when creating new one', async () => {
      // Create first open invitation
      const invitation1 = await createInvitation(inviterId, 'open');

      // Verify it's active
      const activeInvite1 = await getUserActiveOpenInvite(inviterId);
      expect(activeInvite1?.code).toBe(invitation1.code);

      // Create second open invitation
      const invitation2 = await createInvitation(inviterId, 'open');

      // First invitation should be expired
      const expiredInvitation = await db.query.invitations.findFirst({
        where: eq(schema.invitations.code, invitation1.code),
      });

      expect(expiredInvitation?.status).toBe('expired');

      // Only second invitation should be active
      const activeInvite2 = await getUserActiveOpenInvite(inviterId);
      expect(activeInvite2?.code).toBe(invitation2.code);
    });

    it('should set correct expiry for open invitations (72 hours)', async () => {
      const beforeCreate = new Date();
      const invitation = await createInvitation(inviterId, 'open');
      const afterCreate = new Date();

      const expiresAt = new Date(invitation.expiresAt);
      const expectedMin = new Date(beforeCreate.getTime() + 71 * 60 * 60 * 1000); // 71 hours
      const expectedMax = new Date(afterCreate.getTime() + 73 * 60 * 60 * 1000); // 73 hours

      expect(expiresAt.getTime()).toBeGreaterThan(expectedMin.getTime());
      expect(expiresAt.getTime()).toBeLessThan(expectedMax.getTime());
    });

    it('should allow multiple signups with same open invitation', async () => {
      const invitation = await createInvitation(inviterId, 'open');

      // First signup
      const user1Id = uuidv4();
      await insertUser({
        id: user1Id,
        email: 'user1@example.com',
        nickname: 'User1',
        invitedBy: inviterId,
        isGlobalAdmin: false,
      });

      // Second signup with same invitation code
      const user2Id = uuidv4();
      await insertUser({
        id: user2Id,
        email: 'user2@example.com',
        nickname: 'User2',
        invitedBy: inviterId,
        isGlobalAdmin: false,
      });

      // Both users should have invitation attribution
      const user1 = await fetchUser(user1Id);
      const user2 = await fetchUser(user2Id);

      expect(user1?.invitedBy).toBe(inviterId);
      expect(user2?.invitedBy).toBe(inviterId);

      // Invitation should still be valid
      const stillValidInvitation = await findValidInvitation(invitation.code);
      expect(stillValidInvitation).toBeTruthy();
    });
  });

  describe('Invitation Validation Edge Cases', () => {
    it('should reject expired invitation', async () => {
      // Create invitation
      const invitation = await createInvitation(inviterId, 'email_bound', recipientEmail);

      // Manually expire it
      await db
        .update(schema.invitations)
        .set({ expiresAt: new Date(Date.now() - 1000) }) // 1 second ago
        .where(eq(schema.invitations.code, invitation.code));

      // Try to validate
      const validInvitation = await findValidInvitation(invitation.code, recipientEmail);

      expect(validInvitation).toBeNull();
    });

    it('should reject already accepted invitation', async () => {
      const invitation = await createInvitation(inviterId, 'email_bound', recipientEmail);

      // Create user and accept invitation
      const userId = uuidv4();
      await insertUser({
        id: userId,
        email: recipientEmail,
        nickname: 'NewUser',
        invitedBy: inviterId,
        isGlobalAdmin: false,
      });
      await markInvitationAccepted(invitation.code, userId);

      // Try to validate again
      const validInvitation = await findValidInvitation(invitation.code, recipientEmail);

      expect(validInvitation).toBeNull();
    });

    it('should reject invitation with invalid code', async () => {
      const validInvitation = await findValidInvitation(uuidv4(), recipientEmail);

      expect(validInvitation).toBeNull();
    });

    it('should handle concurrent invitation creates for same email', async () => {
      // Create two invitations concurrently for same email
      const [invitation1, invitation2] = await Promise.all([
        createInvitation(inviterId, 'email_bound', recipientEmail),
        createInvitation(inviterId, 'email_bound', recipientEmail),
      ]);

      // Both should succeed with different codes
      expect(invitation1.code).not.toBe(invitation2.code);

      // At least one should be pending
      const validInvitations = await db.query.invitations.findMany({
        where: and(
          eq(schema.invitations.invitedEmail, recipientEmail.toLowerCase()),
          eq(schema.invitations.status, 'pending')
        ),
      });

      expect(validInvitations.length).toBeGreaterThan(0);
    });
  });

  describe('Invitation Attribution', () => {
    it('should track invitation chain across multiple users', async () => {
      // User A invites User B
      const invitation1 = await createInvitation(inviterId, 'email_bound', 'userb@example.com');

      const userBId = uuidv4();
      await insertUser({
        id: userBId,
        email: 'userb@example.com',
        nickname: 'UserB',
        invitedBy: inviterId,
        isGlobalAdmin: false,
      });

      await markInvitationAccepted(invitation1.code, userBId);

      // User B invites User C
      const invitation2 = await createInvitation(userBId, 'email_bound', 'userc@example.com');

      const userCId = uuidv4();
      await insertUser({
        id: userCId,
        email: 'userc@example.com',
        nickname: 'UserC',
        invitedBy: userBId,
        isGlobalAdmin: false,
      });

      await markInvitationAccepted(invitation2.code, userCId);

      // Verify attribution chain
      const userB = await fetchUser(userBId);
      const userC = await fetchUser(userCId);

      expect(userB?.invitedBy).toBe(inviterId);
      expect(userC?.invitedBy).toBe(userBId);
    });

    it('should allow users without invitation to signup (invitedBy null)', async () => {
      const organicUserId = uuidv4();
      await insertUser({
        id: organicUserId,
        email: 'organic@example.com',
        nickname: 'OrganicUser',
        invitedBy: null,
        isGlobalAdmin: false,
      });

      const user = await fetchUser(organicUserId);
      expect(user?.invitedBy).toBeNull();
    });
  });

  describe('Manual Invalidation', () => {
    it('should invalidate all open invites for a user', async () => {
      // Create multiple open invitations
      const _invitation1 = await createInvitation(inviterId, 'open');
      const _invitation2 = await createInvitation(inviterId, 'open'); // This auto-invalidates _invitation1

      // Manually invalidate all
      await invalidateUserOpenInvites(inviterId);

      // Neither should be active
      const activeInvite = await getUserActiveOpenInvite(inviterId);
      expect(activeInvite).toBeUndefined();

      // Both should be expired
      const expiredInvitations = await db.query.invitations.findMany({
        where: and(
          eq(schema.invitations.createdBy, inviterId),
          eq(schema.invitations.type, 'open'),
          eq(schema.invitations.status, 'expired')
        ),
      });

      expect(expiredInvitations.length).toBe(2);
    });

    it('should not affect email-bound invitations when invalidating open invites', async () => {
      // Create email-bound and open invitations
      const emailInvitation = await createInvitation(inviterId, 'email_bound', recipientEmail);
      const openInvitation = await createInvitation(inviterId, 'open');

      // Invalidate open invites
      await invalidateUserOpenInvites(inviterId);

      // Email-bound should still be valid
      const validEmailInvitation = await findValidInvitation(emailInvitation.code, recipientEmail);
      expect(validEmailInvitation).toBeTruthy();

      // Open should be expired
      const validOpenInvitation = await findValidInvitation(openInvitation.code);
      expect(validOpenInvitation).toBeNull();
    });
  });
});
