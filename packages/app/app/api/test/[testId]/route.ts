import { getServerSession } from 'next-auth/next';

export async function GET(/* request: NextRequest */) {
  const session = await getServerSession();
  console.log('SESSION IN TEST ROUTE: ', session);

  return Response.json({});
}
