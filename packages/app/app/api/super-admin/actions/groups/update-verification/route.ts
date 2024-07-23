import { updateGroup } from '@/db';
import { NextRequest } from 'next/server';

export async function POST(request: NextRequest) {
  const data: { id: string; verified: boolean } = await request.json();
  const { id, verified } = data;
  await updateGroup({ id, verified });
  return Response.json({ success: true });
}
