/**
 * Route parameters for dynamic routes
 */

export type SearchParams = {
  [key: string]: string | string[] | undefined;
};

export type UserParams = {
  userId: string;
};

export type GroupParams = {
  groupId: string;
};

export type GroupAndUserParams = GroupParams & UserParams;

// For API route handlers
export type RouteParamsUser = {
  params: Promise<UserParams>;
};

export type RouteParamsGroup = {
  params: Promise<GroupParams>;
};

export type RouteParamsGroupAndUser = {
  params: Promise<GroupAndUserParams>;
};
