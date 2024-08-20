import { City } from 'country-state-city';
import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

export async function GET(request: NextRequest) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'User not authenticated' },
      {
        status: 401,
      },
    );
  }

  const { searchParams } = new URL(request.url);
  const countryCode = searchParams.get('countryCode');
  const searchTerm = searchParams.get('searchTerm') || '';

  if (!countryCode) {
    return Response.json(
      { error: true, message: 'No country code received' },
      {
        status: 400,
      },
    );
  }

  const cities = City.getCitiesOfCountry(countryCode);
  const searchResults = cities
    ?.filter((city) => city.name.toLowerCase().startsWith(searchTerm.toLowerCase()))
    .slice(0, 50);
  return Response.json(searchResults);
}
