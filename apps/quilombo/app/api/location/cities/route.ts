import { City } from 'country-state-city';
import { type NextRequest, NextResponse } from 'next/server';

/**
 * Returns a list of cities in the specified country and optionally filtered by name
 * @param request - The request object
 * @param countryCode - URL param (required)
 * @param searchTerm - URL param (optional)
 * @returns the list of filtered cities as City[]
 */
export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const countryCode = searchParams.get('countryCode');
  const searchTerm = searchParams.get('searchTerm');

  if (!countryCode) {
    return NextResponse.json(
      { error: true, message: 'Missing countryCode' },
      {
        status: 400,
      }
    );
  }

  const cities = City.getCitiesOfCountry(countryCode);
  let results = cities || [];
  if (searchTerm) {
    results = results.filter((city) => city.name.toLowerCase().includes(searchTerm.toLowerCase()));
  }

  return NextResponse.json(results);
}
