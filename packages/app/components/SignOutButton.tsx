'use client';

import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { LogOutIcon } from 'lucide-react';
import { signOut, useSession } from 'next-auth/react';
import { useEffect, useState } from 'react';
import { useDisconnect } from 'wagmi';

const SignOutButton = () => {
  const [isLoading, setIsLoading] = useState(false);
  const session = useSession();
  const { status } = session;
  const { disconnect } = useDisconnect();

  useEffect(() => {
    if (status === 'unauthenticated') setIsLoading(false);
  }, [status, setIsLoading]);

  if (status === 'unauthenticated') return null;

  return (
    <Button
      variant="bordered"
      isIconOnly
      className="w-10 max-w-10 !min-w-[unset] !px-0"
      onPress={async () => {
        setIsLoading(true);
        disconnect();
        signOut({ redirect: false });
      }}
    >
      {isLoading ? <Spinner size="sm" /> : <LogOutIcon className="h-4 w-4 text-default-500" />}
    </Button>
  );
};
export default SignOutButton;
