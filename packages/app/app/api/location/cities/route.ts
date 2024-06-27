import { authOptions } from '@/app/auth';
import { City } from 'country-state-city';
import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

export async function POST(request: NextRequest) {
  const session = await getServerSession(authOptions);
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'User not authenticated' },
      {
        status: 401,
      },
    );
  }

  const body = await request.json();
  if (!body.countryCode) {
    return Response.json(
      { error: true, message: 'No country code received' },
      {
        status: 400,
      },
    );
  }

  const countryCode: string = body.countryCode;
  const cities = City.getCitiesOfCountry(countryCode);
  return Response.json(cities);
}
