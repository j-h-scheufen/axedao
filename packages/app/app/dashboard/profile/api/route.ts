export async function POST(request: Request) {
  const body = await request.json();
  console.log('Create profile', body);
  // save profile
  // handle errors
  return Response.json({ success: true });
}

export async function PATCH(request: Request) {
  const body = await request.json();
  console.log('Update profile', body);
  // update profile
  // handle errors
  return Response.json({ success: true });
}
