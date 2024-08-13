import { Country } from 'country-state-city';
import { getServerSession } from 'next-auth';

export async function GET() {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'User not authenticated' },
      {
        status: 401,
      },
    );
  }

  const countries = Country.getAllCountries().map(({ name, isoCode }) => ({ name, isoCode }));
  return Response.json(countries);
}
