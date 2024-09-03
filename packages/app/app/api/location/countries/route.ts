import { Country } from 'country-state-city';
import { NextResponse } from 'next/server';

export async function GET() {
  const countries = Country.getAllCountries().map(({ name, isoCode }) => ({ name, isoCode }));
  return NextResponse.json(countries);
}
