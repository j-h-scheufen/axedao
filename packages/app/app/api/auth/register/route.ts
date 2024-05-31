import { NextResponse } from 'next/server';
// import { hash } from 'bcrypt';
// import { v4 as uuidv4 } from 'uuid';
import { fetchUsers /*, insertUser */ } from '@/db';

export async function POST(/* request: Request */) {
  try {
    // const { email, password } = (await request.json()) as { email: string; password: string };
    // // TODO validate

    // const hashedPassword = await hash(password, 10);
    // const user = await insertUser({ email, id: uuidv4(), password: hashedPassword });

    // mock
    const users = await fetchUsers();
    return NextResponse.json(users[0]);
  } catch (e) {
    console.log({ e });
    return NextResponse.json({});
  }
}
