import { type NextRequest, NextResponse } from 'next/server';

import { fetchAllGroupLocationsWithGroups } from '@/db';
import type { GroupLocationFeatureCollection } from '@/types/model';

export async function GET(_request: NextRequest): Promise<NextResponse> {
  try {
    // Test database connection first
    try {
      const locationsWithGroups = await fetchAllGroupLocationsWithGroups();

      if (locationsWithGroups.length === 0) {
        return NextResponse.json({
          type: 'FeatureCollection',
          features: [],
        });
      }

      const featureCollection: GroupLocationFeatureCollection = {
        type: 'FeatureCollection',
        features: locationsWithGroups.map((locationWithGroup) => ({
          ...locationWithGroup.feature,
          properties: {
            // Location-specific data
            locationId: locationWithGroup.id,
            locationName: locationWithGroup.name,
            locationDescription: locationWithGroup.description || undefined,
            countryCode: locationWithGroup.countryCode || undefined,

            // Group data
            groupId: locationWithGroup.group.id,
            groupName: locationWithGroup.group.name,
            groupDescription: locationWithGroup.group.description || undefined,
            groupLogo: locationWithGroup.group.logo || undefined,
            groupVerified: locationWithGroup.group.verified,
            groupStyle: locationWithGroup.group.style || undefined,
          },
        })),
      };

      return NextResponse.json(featureCollection);
    } catch (dbError) {
      console.error('Database error:', dbError);
      return NextResponse.json(
        { error: 'Database connection failed', details: dbError instanceof Error ? dbError.message : 'Unknown error' },
        { status: 500 }
      );
    }
  } catch (error) {
    console.error('Error fetching locations:', error);
    return NextResponse.json({ error: 'Failed to fetch locations' }, { status: 500 });
  }
}
