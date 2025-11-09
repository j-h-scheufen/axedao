import type { GROUP_ROLES, IMAGE_TYPES, eventTypes } from '@/config/constants';
import type { SelectGroup, SelectUser, SelectGroupLocation, SelectEvent } from '../db/schema';
import type { Feature, Geometry, Point } from 'geojson';
import type { ZonedDateTime } from '@internationalized/date';
import type Supercluster from 'supercluster';

/**
 * This file defines API and app-level types that are wrapping the DB schema types in order to create a layer of separation
 * TODO: The app is missing a central types.d.ts definition.
 */

export type Group = Omit<SelectGroup, 'updatedAt'> & { countryCodes: string[] };

export type User = Omit<SelectUser, 'updatedAt'> & {
  groupName?: string;
};

export type GroupLocation = Omit<SelectGroupLocation, 'updatedAt'>;

export type Event = Omit<SelectEvent, 'updatedAt'>;

// Event type based on RawEvent with ZonedDateTime fields
export type ZonedEvent = Omit<Event, 'start' | 'end'> & {
  start: ZonedDateTime;
  end?: ZonedDateTime;
};

export type EventType = (typeof eventTypes)[number];

// GeoJSON Feature Properties for Event Locations on Global Map
export interface EventLocationFeatureProperties {
  // Event-specific data
  eventId: string;
  eventName: string;
  eventDescription?: string;
  eventType: EventType;
  eventStart: string; // ISO string for dates
  eventEnd?: string; // ISO string for dates
  eventIsAllDay: boolean;
  eventUrl?: string;
  eventImage?: string;
  countryCode?: string;

  // Creator/Group data
  creatorId: string;
  associatedGroups: string[];
  associatedUsers: string[];
}

// GeoJSON Feature type for Event Locations - extends standard Feature with custom properties
export type EventLocationFeature = Feature<Geometry, EventLocationFeatureProperties>;

// GeoJSON FeatureCollection type for Event Locations
export type EventLocationFeatureCollection = {
  type: 'FeatureCollection';
  features: EventLocationFeature[];
};

// GeoJSON Feature Properties for Group Locations on Global Map
export interface GroupLocationFeatureProperties {
  // Location-specific data
  locationId: string;
  locationName: string;
  locationDescription?: string;
  countryCode?: string;

  // Group data
  groupId: string;
  groupName: string;
  groupDescription?: string;
  groupLogo?: string;
  groupVerified: boolean;
  groupStyle?: string;
}

// GeoJSON Feature type for Group Locations - extends standard Feature with custom properties
export type GroupLocationFeature = Feature<Geometry, GroupLocationFeatureProperties>;

// GeoJSON FeatureCollection type for Group Locations
export type GroupLocationFeatureCollection = {
  type: 'FeatureCollection';
  features: GroupLocationFeature[];
};

// Deck.GL types for clusters and layers
// biome-ignore lint/complexity/noBannedTypes: on purpose
export type ClusterPropsFrom<TAgg extends object = {}> = Extract<
  ReturnType<Supercluster<GroupLocationFeatureProperties, TAgg>['getClusters']>[number]['properties'],
  { cluster: true }
>;
// biome-ignore lint/complexity/noBannedTypes: on purpose
export type ClusterFeature<TAgg extends object = {}> = Feature<Point, ClusterPropsFrom<TAgg>>;
export type ClusterDatum = { coordinates: [number, number]; point_count: number };
export type GroupLocationPoint = Feature<Point, GroupLocationFeatureProperties>;
export type GroupLocationPointDatum = GroupLocationFeatureProperties & { coordinates: [number, number]; icon: string };
export type EventLocationPoint = Feature<Point, EventLocationFeatureProperties>;
export type EventLocationPointDatum = EventLocationFeatureProperties & {
  coordinates: [number, number];
  eventType: EventType;
};

export type UserSession = {
  id: string;
  walletAddress: string | null;
  isGlobalAdmin: boolean;
};

export type AuthMethods = {
  notificationEmail: string | null;
  hasPassword: boolean;
  hasGoogle: boolean;
  hasWallet: boolean;
  googleEmail?: string;
  walletAddress?: string;
  userEmail?: string;
};

export type GroupMemberRole = (typeof GROUP_ROLES)[number];

export type GroupMember = User & { roles: GroupMemberRole[] };

export type ImageType = (typeof IMAGE_TYPES)[number];

export type UserSearchResult = {
  data: User[];
  totalCount: number;
  nextOffset: number | null;
};

export type GroupSearchResult = {
  data: Group[];
  totalCount: number;
  nextOffset: number | null;
};

export type EventSearchResult = {
  data: ZonedEvent[];
  totalCount: number;
  nextOffset: number | null;
};

export type SearchCitiesParams = { countryCode: string; searchTerm?: string };

export type Breadcrumb = {
  pathname: string;
  queryParams: string;
};
