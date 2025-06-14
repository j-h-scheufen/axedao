import ENV from '@/config/environment';
import { getServerSession } from 'next-auth';
import { nextAuthOptions } from '@/config/next-auth-options';
import { NextResponse } from 'next/server';

const SUBGRAPH_URL = 'https://gateway.thegraph.com/api/subgraphs/id/6LrdYRsmUcy433RvFFQsKyM7G6fPYQGQEuUzLLSfxLgG';

export async function POST(request: Request) {
  const session = await getServerSession(nextAuthOptions);

  // the middleware should protect this route, but just in case
  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { query, variables } = await request.json();

    const response = await fetch(SUBGRAPH_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${ENV.graphApiKey}`,
      },
      body: JSON.stringify({
        query,
        variables,
        operationName: null,
      }),
    });

    if (!response.ok) {
      console.error('GraphQL response not OK:', response.status, response.statusText);
      const text = await response.text();
      console.error('Response body:', text);
      return NextResponse.json(
        { error: `GraphQL request failed: ${response.statusText}` },
        { status: response.status }
      );
    }

    const data = await response.json();
    return NextResponse.json(data);
  } catch (error) {
    console.error('GraphQL API error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}
