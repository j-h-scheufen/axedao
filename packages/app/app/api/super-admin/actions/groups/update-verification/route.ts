import { isGlobalAdmin, updateGroup } from '@/db';
import { getToken } from 'next-auth/jwt';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(req: NextRequest) {
  const token = await getToken({ req });
  if (!token?.sub) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const isUserGlobalAdmin = await isGlobalAdmin(token.sub);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const data: { id: string; verified: boolean } = await req.json();
  const { id, verified } = data;
  await updateGroup({ id, verified });
  return NextResponse.json({ success: true });
}
