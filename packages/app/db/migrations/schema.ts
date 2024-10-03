import {
  bigint,
  boolean,
  index,
  pgEnum,
  pgTable,
  text,
  timestamp,
  uniqueIndex,
  uuid,
  varchar,
  type AnyPgColumn,
} from 'drizzle-orm/pg-core';

export const linkType = pgEnum('link_type', ['twitter', 'facebook', 'instagram', 'linkedin']);
export const title = pgEnum('title', [
  'mestre',
  'contra-mestre',
  'mestrando',
  'professor',
  'instrutor',
  'monitor',
  'aluno-graduado',
  'aluno',
  'iniciante',
]);

export const users = pgTable(
  'users',
  {
    id: uuid('id').defaultRandom().primaryKey().notNull(),
    createdAt: timestamp('created_at', { withTimezone: true, mode: 'string' }).defaultNow().notNull(),
    name: varchar('name'),
    nickname: varchar('nickname'),
    avatar: varchar('avatar'),
    email: varchar('email'),
    title: title('title'),
    groupId: uuid('group_id')
      .references((): AnyPgColumn => groups.id, { onDelete: 'set null' })
      .references((): AnyPgColumn => groups.id, { onDelete: 'set null' }),
    updatedAt: timestamp('updated_at', { withTimezone: true, mode: 'string' }).defaultNow().notNull(),
    phone: text('phone'),
  },
  (table) => {
    return {
      emailIdx: uniqueIndex('email_idx').using('btree', table.email),
      groupIdx: index('group_idx').using('btree', table.groupId),
      nicknameIdx: index('nickname_idx').using('btree', table.nickname),
      titleIdx: index('title_idx').using('btree', table.title),
    };
  },
);

export const groups = pgTable(
  'groups',
  {
    id: uuid('id').defaultRandom().primaryKey().notNull(),
    createdAt: timestamp('created_at', { withTimezone: true, mode: 'string' }).defaultNow().notNull(),
    name: varchar('name').notNull(),
    description: text('description'),
    logo: varchar('logo'),
    banner: varchar('banner'),
    leaderId: uuid('leader_id')
      .references((): AnyPgColumn => users.id, { onDelete: 'set null' })
      .references((): AnyPgColumn => users.id, { onDelete: 'set null' }),
    founder: varchar('founder'),
    verified: boolean('verified').notNull(),
    updatedAt: timestamp('updated_at', { withTimezone: true, mode: 'string' }).defaultNow(),
    city: text('city'),
    country: text('country'),
  },
  (table) => {
    return {
      nameIdx: uniqueIndex('name_idx').using('btree', table.name),
    };
  },
);

export const groupAdmins = pgTable('group_admins', {
  groupId: uuid('group_id')
    .primaryKey()
    .notNull()
    .references(() => groups.id, { onDelete: 'cascade' })
    .references(() => groups.id, { onDelete: 'cascade' }),
  userId: uuid('user_id')
    .notNull()
    .references(() => users.id, { onDelete: 'cascade' })
    .references(() => users.id, { onDelete: 'cascade' }),
});

export const links = pgTable(
  'links',
  {
    // You can use { mode: "bigint" } if numbers are exceeding js number limitations
    id: bigint('id', { mode: 'number' })
      .primaryKey()
      .generatedByDefaultAsIdentity({
        name: 'links_id_seq',
        startWith: 1,
        increment: 1,
        minValue: 1,
        maxValue: 9223372036854775807,
        cache: 1,
      }),
    url: varchar('url').notNull(),
    type: linkType('type'),
    ownerId: uuid('owner_id').notNull(),
  },
  (table) => {
    return {
      ownerIdx: index('owner_idx').using('btree', table.ownerId),
    };
  },
);
