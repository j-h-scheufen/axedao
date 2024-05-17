export async function POST(request: Request) {
  const body = await request.json();
  console.log('Create profile', body);
  // save email
  // send confirmation email
  // handle errors
  return Response.json({ success: true });
}

export async function PATCH(request: Request) {
  const body = await request.json();
  console.log('Update profile', body);
  // save email
  // send confirmation email
  // handle errors
  return Response.json({ success: true });
}
