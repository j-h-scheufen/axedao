'use client';

import useAuth from '@/hooks/useAuth';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { LogOutIcon } from 'lucide-react';
import { useSession } from 'next-auth/react';

const SignOutButton = () => {
  const session = useSession();
  const { isSigningOut, actions } = useAuth();

  const authenticated = session?.status === 'authenticated';

  if (!authenticated) return null;

  return (
    <Button variant="bordered" isIconOnly className="w-10 max-w-10 !min-w-[unset] !px-0" onPress={actions.signOut}>
      {isSigningOut ? <Spinner size="sm" /> : <LogOutIcon className="h-4 w-4 text-default-500" />}
    </Button>
  );
};
export default SignOutButton;
