import { relations } from 'drizzle-orm/relations';
import { groupAdmins, groups, users } from './schema';

export const usersRelations = relations(users, ({ one, many }) => ({
  group_groupId: one(groups, {
    fields: [users.groupId],
    references: [groups.id],
    relationName: 'users_groupId_groups_id',
  }),
  groups_leaderId: many(groups, {
    relationName: 'groups_leaderId_users_id',
  }),
  groupAdmins_userId: many(groupAdmins, {
    relationName: 'groupAdmins_userId_users_id',
  }),
}));

export const groupsRelations = relations(groups, ({ one, many }) => ({
  users_groupId: many(users, {
    relationName: 'users_groupId_groups_id',
  }),
  user_leaderId: one(users, {
    fields: [groups.leaderId],
    references: [users.id],
    relationName: 'groups_leaderId_users_id',
  }),
  groupAdmins_groupId: many(groupAdmins, {
    relationName: 'groupAdmins_groupId_groups_id',
  }),
}));

export const groupAdminsRelations = relations(groupAdmins, ({ one }) => ({
  group_groupId: one(groups, {
    fields: [groupAdmins.groupId],
    references: [groups.id],
    relationName: 'groupAdmins_groupId_groups_id',
  }),
  user_userId: one(users, {
    fields: [groupAdmins.userId],
    references: [users.id],
    relationName: 'groupAdmins_userId_users_id',
  }),
}));
