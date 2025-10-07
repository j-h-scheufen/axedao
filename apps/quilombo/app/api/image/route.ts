import type { NextRequest } from 'next/server';
import { NextResponse } from 'next/server';
import sharp from 'sharp';
import { getServerSession } from 'next-auth';

import { nextAuthOptions } from '@/config/next-auth-options';
import { getImageUrl } from '@/utils';

export async function GET(req: NextRequest) {
  // Session check
  const session = await getServerSession(nextAuthOptions);
  if (!session) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(req.url);
  const cid = searchParams.get('cid');
  const size = parseInt(searchParams.get('size') || '32', 10);
  const border = parseInt(searchParams.get('border') || '2', 10);
  // const borderColor = searchParams.get('borderColor') || '#fff';

  if (!cid) {
    return NextResponse.json({ error: 'Missing cid' }, { status: 400 });
  }

  const imageUrl = getImageUrl(cid);
  if (!imageUrl) {
    return NextResponse.json({ error: 'Invalid cid' }, { status: 400 });
  }

  try {
    const response = await fetch(new URL(imageUrl));
    if (!response.ok) throw new Error('Failed to fetch image');
    const buffer = Buffer.from(await response.arrayBuffer());

    const s = size;
    const b = border;
    const r = s / 2 - b / 2;

    // SVG for alpha mask (just a white circle, no background)
    const maskSvg = `
      <svg width="${s}" height="${s}">
        <circle cx="${s / 2}" cy="${s / 2}" r="${r}" fill="white"/>
      </svg>
    `;

    // SVG for border (transparent fill, only stroke)
    // const borderSvg = `
    //   <svg width="${s}" height="${s}">
    //     <circle cx="${s / 2}" cy="${s / 2}" r="${r}" fill="none" stroke="${borderColor}" stroke-width="${b}"/>
    //   </svg>
    // `;

    const output = await sharp(buffer)
      .resize(s, s, { kernel: sharp.kernel.lanczos3 })
      .composite([{ input: Buffer.from(maskSvg), blend: 'dest-in' }])
      .png({ compressionLevel: 9 })
      .toBuffer();

    const res = new NextResponse(new Uint8Array(output), {
      status: 200,
      headers: {
        'Content-Type': 'image/png',
        'Cache-Control': 'public, max-age=31536000, immutable',
      },
    });
    return res;
  } catch {
    return NextResponse.json({ error: 'Image processing error' }, { status: 500 });
  }
}
