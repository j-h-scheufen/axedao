import { Country } from 'country-state-city';
import { NextResponse } from 'next/server';

/**
 * Returns a list of countries with their names and isoCodes.
 * @returns a Country[]
 */
export async function GET() {
  const countries = Country.getAllCountries().map(({ name, isoCode }) => ({ name, isoCode }));
  return NextResponse.json(countries);
}
