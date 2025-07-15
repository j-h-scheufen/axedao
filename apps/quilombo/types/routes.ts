/**
 * Route parameters for dynamic routes
 */

export type SearchParams = {
  [key: string]: string | string[] | undefined;
};

export type GroupAndLocationParams = {
  groupId: string;
  locationId: string;
};

// For API route handlers
export type RouteParamsUser = {
  params: Promise<{ userId: string }>;
};

export type RouteParamsGroup = {
  params: Promise<{ groupId: string }>;
};

export type RouteParamsGroupAndUser = {
  params: Promise<{ groupId: string; userId: string }>;
};

export type RouteParamsGroupAndLocation = {
  params: Promise<GroupAndLocationParams>;
};
