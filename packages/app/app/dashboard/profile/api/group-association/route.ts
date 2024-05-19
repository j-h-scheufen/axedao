export async function POST(request: Request) {
  const body = await request.json();
  console.log('Create new group and update profile', body);
  // create new group
  // update profile
  // handle errors
  return Response.json({ success: true });
}

export async function PATCH(request: Request) {
  const body = await request.json();
  console.log('Join group and update profile', body);
  // send group request??
  // update profile
  // handle errors
  return Response.json({ success: true });
}
