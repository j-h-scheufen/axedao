import { registrationFormSchema } from '@/constants/schemas';
import { fetchUserProfileByEmail, insertUser } from '@/db';
import { NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';
import { InferType } from 'yup';

type Body = InferType<typeof registrationFormSchema>;

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const valid = await registrationFormSchema.validate(body);

    if (valid) {
      const { email, name } = body as Body;

      const userExists = await fetchUserProfileByEmail(email);
      if (userExists) {
        return Response.json(
          { error: true, message: 'Email is already registered' },
          {
            status: 400,
          },
        );
      }

      const user = await insertUser({ id: uuidv4(), email, name });
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
