import { City } from 'country-state-city';
import { NextRequest } from 'next/server';

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const countryCode = searchParams.get('countryCode');
  const searchTerm = searchParams.get('searchTerm');

  if (!countryCode) {
    return Response.json(
      { error: true, message: 'No country code received' },
      {
        status: 400,
      },
    );
  }

  const cities = City.getCitiesOfCountry(countryCode);
  let results = cities || [];
  if (searchTerm) {
    results = results.filter((city) => city.name.toLowerCase().includes(searchTerm.toLowerCase()));
  }

  return Response.json(results);
}
