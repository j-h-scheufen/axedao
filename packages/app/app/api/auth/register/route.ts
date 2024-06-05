import { fetchUserProfileByEmail, insertUser } from '@/db';
import { NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';
import { InferType, object, string } from 'yup';

const bodySchema = object({
  email: string().email().required(),
  // walletAddress: string().required(),
});
type Body = InferType<typeof bodySchema>;

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const valid = await bodySchema.validate(body);

    if (valid) {
      const { email /* walletAddress*/ } = body as Body;

      const userExists = await fetchUserProfileByEmail(email);
      if (userExists) {
        return Response.json(
          { error: true, message: 'Email is already registered' },
          {
            status: 400,
          },
        );
      }

      // const hashedWalletAddress = await hash(walletAddress, 10);
      const user = await insertUser({ email, id: uuidv4() /*, wallet_address: hashedWalletAddress*/ });
      return NextResponse.json(user);
    }

    return Response.json(
      { error: true, message: 'Invalid credentials' },
      {
        status: 401,
      },
    );
  } catch (e) {
    return Response.json(
      { error: true, message: 'An unexpected server error occurred' },
      {
        status: 500,
      },
    );
  }
}
