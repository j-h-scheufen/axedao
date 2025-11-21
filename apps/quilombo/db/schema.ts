import { relations, sql } from 'drizzle-orm';
import {
  type AnyPgColumn,
  boolean,
  geometry,
  index,
  json,
  jsonb,
  pgEnum,
  pgTable,
  primaryKey,
  text,
  timestamp,
  uniqueIndex,
  uuid,
  varchar,
} from 'drizzle-orm/pg-core';

import {
  linkTypes,
  styles,
  titles,
  eventTypes,
  accountStatuses,
  invitationTypes,
  invitationStatuses,
  groupClaimStatuses,
} from '@/config/constants';
import type { Feature, Geometry } from 'geojson';

export const titleEnum = pgEnum('title', titles);
export const linkTypeEnum = pgEnum('link_type', linkTypes);
export const styleEnum = pgEnum('style', styles);
export const eventTypeEnum = pgEnum('event_type', eventTypes);
export const accountStatusEnum = pgEnum('account_status', accountStatuses);
export const tokenTypeEnum = pgEnum('token_type', ['email_verification', 'password_reset']);
export const oauthProviderEnum = pgEnum('oauth_provider', ['google']);
// Invitation system - users can invite friends via QR codes or email
export const invitationTypeEnum = pgEnum('invitation_type', invitationTypes);
export const invitationStatusEnum = pgEnum('invitation_status', invitationStatuses);
// Group claim system - users can request to claim ownership of registered groups
export const groupClaimStatusEnum = pgEnum('group_claim_status', groupClaimStatuses);

export type LinkType = (typeof linkTypes)[number];
export type SocialLink = { type?: LinkType; url: string };

export const users = pgTable(
  'users',
  {
    id: uuid('id').primaryKey(),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at')
      .notNull()
      .$onUpdate(() => new Date()),
    name: varchar('name'),
    nickname: varchar('nickname'),
    title: titleEnum('title'),
    avatar: varchar('avatar'),
    email: text('email'),
    groupId: uuid('group_id').references((): AnyPgColumn => groups.id, { onDelete: 'set null' }),
    phone: varchar('phone'),
    walletAddress: varchar('wallet_address'),
    passwordHash: text('password_hash'),
    emailVerifiedAt: timestamp('email_verified_at'),
    accountStatus: accountStatusEnum('account_status').default('active').notNull(),
    isGlobalAdmin: boolean('is_global_admin').default(false).notNull(),
    links: json('links').$type<SocialLink[]>().notNull().default([]),
    // Invitation attribution - tracks who invited this user
    invitedBy: uuid('invited_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
  },
  (t) => [
    index('nickname_idx').on(t.nickname),
    index('title_idx').on(t.title),
    index('group_idx').on(t.groupId),
    uniqueIndex('email_idx').on(t.email),
    // Note: walletAddress is NOT unique - same wallet can be linked to multiple accounts
    // Wallet connection doesn't prove ownership, only SIWE signature does
    index('wallet_address_idx').on(t.walletAddress),
    // Index for invitation attribution queries
    index('invited_by_idx').on(t.invitedBy),
  ]
);

export const groups = pgTable(
  'groups',
  {
    id: uuid('id').primaryKey(),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at')
      .notNull()
      .$onUpdate(() => new Date()),
    name: varchar('name').notNull(),
    description: text('description'),
    style: styleEnum('style'),
    email: text('email'),
    logo: varchar('logo'),
    banner: varchar('banner'),
    leader: uuid('leader_id').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    founder: varchar('founder'),
    links: json('links').$type<SocialLink[]>().notNull().default([]),
    // Group lifecycle tracking for registration & claiming
    createdBy: uuid('created_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    claimedBy: uuid('claimed_by').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    claimedAt: timestamp('claimed_at'),
  },
  (t) => [
    index('name_idx').on(t.name),
    index('created_by_idx').on(t.createdBy),
    index('claimed_by_idx').on(t.claimedBy),
  ]
);

export const groupAdmins = pgTable(
  'group_admins',
  {
    groupId: uuid('group_id')
      .notNull()
      .references(() => groups.id, { onDelete: 'cascade' }),
    userId: uuid('user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),
  },
  (t) => [primaryKey({ columns: [t.groupId, t.userId] })]
);

export const verificationTokens = pgTable(
  'verification_tokens',
  {
    id: uuid('id').defaultRandom().primaryKey(),
    userId: uuid('user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),
    tokenHash: text('token_hash').notNull(),
    type: tokenTypeEnum('type').notNull(),
    expiresAt: timestamp('expires_at').notNull(),
    consumedAt: timestamp('consumed_at'),
    createdAt: timestamp('created_at').notNull().defaultNow(),
  },
  (t) => [index('token_hash_idx').on(t.tokenHash), index('user_token_type_idx').on(t.userId, t.type)]
);

export const oauthAccounts = pgTable(
  'oauth_accounts',
  {
    id: uuid('id').defaultRandom().primaryKey(),
    userId: uuid('user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),
    provider: oauthProviderEnum('provider').notNull(),
    providerUserId: text('provider_user_id').notNull(),
    providerEmail: text('provider_email'),
    createdAt: timestamp('created_at').notNull().defaultNow(),
  },
  (t) => [uniqueIndex('oauth_provider_user_idx').on(t.provider, t.providerUserId), index('oauth_user_idx').on(t.userId)]
);

// Invitation system - allows users to invite others via QR codes or email
export const invitations = pgTable(
  'invitations',
  {
    id: uuid('id').defaultRandom().primaryKey(),
    code: uuid('code').defaultRandom().notNull(),
    type: invitationTypeEnum('type').notNull(),
    invitedEmail: text('invited_email'), // Nullable for open invites
    createdBy: uuid('created_by')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    expiresAt: timestamp('expires_at').notNull(),
    status: invitationStatusEnum('status').notNull().default('pending'),
    acceptedAt: timestamp('accepted_at'), // Only for email_bound
    acceptedBy: uuid('accepted_by').references(() => users.id, { onDelete: 'set null' }), // Only for email_bound
  },
  (t) => [
    uniqueIndex('invitation_code_idx').on(t.code),
    index('invitation_email_idx').on(t.invitedEmail),
    index('invitation_created_by_idx').on(t.createdBy),
    index('invitation_status_idx').on(t.status),
    index('invitation_type_idx').on(t.type),
  ]
);

// Group verification history - tracks all verifications for future rewards
export const groupVerifications = pgTable(
  'group_verifications',
  {
    id: uuid('id').defaultRandom().primaryKey(),
    groupId: uuid('group_id')
      .notNull()
      .references(() => groups.id, { onDelete: 'cascade' }),
    userId: uuid('user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'set null' }),
    verifiedAt: timestamp('verified_at').notNull().defaultNow(),
    notes: text('notes'), // Optional - what was verified
  },
  (t) => [
    index('group_verification_group_idx').on(t.groupId),
    index('group_verification_user_idx').on(t.userId),
    index('group_verification_date_idx').on(t.verifiedAt),
  ]
);

// Group claims - tracks all claim requests (pending, approved, rejected)
export const groupClaims = pgTable(
  'group_claims',
  {
    id: uuid('id').defaultRandom().primaryKey(),
    groupId: uuid('group_id')
      .notNull()
      .references(() => groups.id, { onDelete: 'cascade' }),
    userId: uuid('user_id')
      .notNull()
      .references(() => users.id, { onDelete: 'set null' }),
    status: groupClaimStatusEnum('status').notNull().default('pending'),
    requestedAt: timestamp('requested_at').notNull().defaultNow(),
    processedAt: timestamp('processed_at'),
    processedBy: uuid('processed_by').references(() => users.id, { onDelete: 'set null' }),
    userMessage: text('user_message').notNull(), // Why they should be admin
    adminNotes: text('admin_notes'), // Admin's decision notes
  },
  (t) => [
    index('group_claim_group_idx').on(t.groupId),
    index('group_claim_user_idx').on(t.userId),
    index('group_claim_status_idx').on(t.status),
    index('group_claim_date_idx').on(t.requestedAt),
  ]
);

export const userGroupRelations = relations(users, ({ one }) => ({
  group: one(groups, {
    fields: [users.groupId],
    references: [groups.id],
  }),
}));

export const groupLocations = pgTable(
  'group_locations',
  {
    id: uuid('id').defaultRandom().primaryKey(),
    groupId: uuid('group_id')
      .notNull()
      .references(() => groups.id, { onDelete: 'cascade' }),
    name: varchar('name').notNull(),
    description: text('description'),
    feature: jsonb('feature').$type<Feature<Geometry>>().notNull(),

    /* derive geometry(Point,4326) from GeoJSON */
    location: geometry('location', { type: 'point', srid: 4326 })
      .generatedAlwaysAs(
        sql`ST_SetSRID(ST_MakePoint((( feature -> 'geometry' -> 'coordinates') ->> 0)::numeric, (( feature -> 'geometry' -> 'coordinates') ->> 1)::numeric), 4326)`
      )
      .notNull(),
    countryCode: varchar('country_code', { length: 2 }),
  },
  (t) => [
    index('group_id_idx').on(t.groupId), // For efficient subquery lookups
    index('groups_location_gix').using('gist', t.location),
    index('country_code_idx').on(t.countryCode),
  ]
);

export const events = pgTable(
  'events',
  {
    id: uuid('id').primaryKey(),
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at')
      .notNull()
      .$onUpdate(() => new Date()),
    name: text('name').notNull(),
    description: text('description'),
    start: timestamp('start').notNull(),
    end: timestamp('end'),
    isAllDay: boolean('is_all_day').notNull().default(false),
    type: eventTypeEnum('type').notNull(),
    url: text('url'),
    image: varchar('image'),
    feature: jsonb('feature').$type<Feature<Geometry>>().notNull(),
    location: geometry('location', { type: 'point', srid: 4326 })
      .generatedAlwaysAs(
        sql`ST_SetSRID(ST_MakePoint((( feature -> 'geometry' -> 'coordinates') ->> 0)::numeric, (( feature -> 'geometry' -> 'coordinates') ->> 1)::numeric), 4326)`
      )
      .notNull(),
    countryCode: varchar('country_code', { length: 2 }),
    creatorId: uuid('creator_id')
      .notNull()
      .references(() => users.id, { onDelete: 'cascade' }),
    associatedGroups: uuid('associated_groups').array().notNull().default([]),
    associatedUsers: uuid('associated_users').array().notNull().default([]),
  },
  (t) => [
    index('events_location_gix').using('gist', t.location),
    index('events_country_code_idx').on(t.countryCode),
    index('events_type_idx').on(t.type),
    index('events_start_idx').on(t.start),
    index('events_end_idx').on(t.end),
    index('events_associated_groups_idx').on(t.associatedGroups),
    index('events_associated_users_idx').on(t.associatedUsers),
  ]
);

export type InsertUser = typeof users.$inferInsert;
export type SelectUser = typeof users.$inferSelect;

export type InsertGroup = typeof groups.$inferInsert;
export type SelectGroup = typeof groups.$inferSelect;

export type InsertGroupAdmin = typeof groupAdmins.$inferInsert;
export type SelectGroupAdmin = typeof groupAdmins.$inferSelect;

export type InsertGroupLocation = typeof groupLocations.$inferInsert;
export type SelectGroupLocation = typeof groupLocations.$inferSelect;

export type InsertEvent = typeof events.$inferInsert;
export type SelectEvent = typeof events.$inferSelect;

export type InsertVerificationToken = typeof verificationTokens.$inferInsert;
export type SelectVerificationToken = typeof verificationTokens.$inferSelect;

export type InsertOAuthAccount = typeof oauthAccounts.$inferInsert;
export type SelectOAuthAccount = typeof oauthAccounts.$inferSelect;

export type InsertInvitation = typeof invitations.$inferInsert;
export type SelectInvitation = typeof invitations.$inferSelect;

export type InsertGroupVerification = typeof groupVerifications.$inferInsert;
export type SelectGroupVerification = typeof groupVerifications.$inferSelect;

export type InsertGroupClaim = typeof groupClaims.$inferInsert;
export type SelectGroupClaim = typeof groupClaims.$inferSelect;
