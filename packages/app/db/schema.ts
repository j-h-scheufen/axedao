import { titles } from '@/constants';
import { relations } from 'drizzle-orm';
import {
  AnyPgColumn,
  bigserial,
  boolean,
  index,
  pgEnum,
  pgTable,
  primaryKey,
  text,
  timestamp,
  uniqueIndex,
  uuid,
  varchar,
} from 'drizzle-orm/pg-core';

export const titleEnum = pgEnum('title', titles);
export const linkTypeEnum = pgEnum('link_type', ['twitter', 'facebook', 'instagram', 'linkedin']);

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
    email: text('email').notNull().unique(),
    groupId: uuid('group_id').references((): AnyPgColumn => groups.id, { onDelete: 'set null' }),
    phone: varchar('phone'),
    walletAddress: varchar('wallet_address'),
    isGlobalAdmin: boolean('is_global_admin').default(false),
  },
  (table) => {
    return {
      nicknameIdx: index('nickname_idx').on(table.nickname),
      titleIdx: index('title_idx').on(table.title),
      groupIdx: index('group_idx').on(table.groupId),
      emailIdx: uniqueIndex('email_idx').on(table.email),
    };
  },
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
    logo: varchar('logo'),
    banner: varchar('banner'),
    leader: uuid('leader_id').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    founder: varchar('founder'),
    verified: boolean('verified').notNull().default(false),
    city: varchar('city'),
    country: varchar('country').notNull(),
  },
  (table) => {
    return {
      nameIdx: uniqueIndex('name_idx').on(table.name),
    };
  },
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
  (table) => {
    return {
      pk: primaryKey({ columns: [table.groupId, table.userId] }),
    };
  },
);

export const links = pgTable(
  'links',
  {
    id: bigserial('id', { mode: 'number' }).primaryKey(),
    url: varchar('url').notNull(),
    type: linkTypeEnum('type'),
    ownerId: uuid('owner_id').notNull(),
  },
  (table) => {
    return {
      ownerIdx: index('owner_idx').on(table.ownerId),
    };
  },
);

/**
 * RELATIONS (app-level constraint declarations that help with the query API)
 */

export const userLinkRelations = relations(users, ({ many }) => ({
  links: many(links),
}));

export const groupLinkRelations = relations(groups, ({ many }) => ({
  links: many(links),
}));

export const linkUserRelations = relations(links, ({ one }) => ({
  owner: one(users, {
    fields: [links.ownerId],
    references: [users.id],
  }),
}));

export const linkGroupRelations = relations(links, ({ one }) => ({
  owner: one(groups, {
    fields: [links.ownerId],
    references: [groups.id],
  }),
}));

export const userGroupRelations = relations(users, ({ one }) => ({
  group: one(groups, {
    fields: [users.groupId],
    references: [groups.id],
  }),
}));

export type InsertUser = typeof users.$inferInsert;
export type SelectUser = typeof users.$inferSelect;

export type InsertGroup = typeof groups.$inferInsert;
export type SelectGroup = typeof groups.$inferSelect;

export type InsertGroupAdmin = typeof groupAdmins.$inferInsert;
export type SelectGroupAdmin = typeof groupAdmins.$inferSelect;

export type InsertLink = typeof links.$inferInsert;
export type SelectLink = typeof links.$inferSelect;
