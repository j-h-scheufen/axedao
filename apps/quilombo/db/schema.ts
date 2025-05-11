import { linkTypes, styles, titles } from '@/config/constants';
import { relations } from 'drizzle-orm';
import {
  type AnyPgColumn,
  boolean,
  index,
  json,
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
export const linkTypeEnum = pgEnum('link_type', linkTypes);
export const styleEnum = pgEnum('style', styles);

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
    walletAddress: varchar('wallet_address').notNull(),
    isGlobalAdmin: boolean('is_global_admin').default(false).notNull(),
    links: json('links').$type<SocialLink[]>().notNull().default([]),
  },
  (table) => {
    return {
      nicknameIdx: index('nickname_idx').on(table.nickname),
      titleIdx: index('title_idx').on(table.title),
      groupIdx: index('group_idx').on(table.groupId),
      emailIdx: index('email_idx').on(table.email),
      walletAddressIdx: uniqueIndex('wallet_address_idx').on(table.walletAddress),
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
    style: styleEnum('style'),
    email: text('email'),
    logo: varchar('logo'),
    banner: varchar('banner'),
    leader: uuid('leader_id').references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    founder: varchar('founder'),
    verified: boolean('verified').notNull().default(false),
    city: varchar('city'),
    country: varchar('country').notNull(),
    links: json('links').$type<SocialLink[]>().notNull().default([]),
  },
  (table) => {
    return {
      nameIdx: index('name_idx').on(table.name),
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
