export async function POST(request: Request) {
  const body = await request.json();
  console.log('Registration', body);
  // save email
  // send confirmation email
  // handle errors
  return Response.json({ success: true });
}
