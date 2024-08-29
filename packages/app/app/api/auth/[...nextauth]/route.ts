import NextAuth from 'next-auth';
import { NextRequest } from 'next/server';

import { nextAuthOptions } from './config';

interface RouteHandlerContext {
  params: { nextauth: string[] };
}

// For more information on each option (and a full list of options) go to
// https://next-auth.js.org/configuration/options
const handler = async (req: NextRequest, context: RouteHandlerContext) => {
  return await NextAuth(req, context, nextAuthOptions);
};

export { handler as GET, handler as POST };
