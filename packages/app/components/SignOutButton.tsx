'use client';

import { Button, ButtonProps } from '@nextui-org/button';
import { Spinner } from '@nextui-org/spinner';
import { LogOutIcon } from 'lucide-react';
import { useSession } from 'next-auth/react';
import { useState } from 'react';

import useAuth from '@/hooks/useAuth';

const SignOutButton = (props: ButtonProps) => {
  const session = useSession();
  const [isLoading, setIsLoading] = useState(false);
  const { logout } = useAuth();

  if (session.status === 'unauthenticated') return null;

  return (
    <Button
      variant="bordered"
      isIconOnly
      className="w-10 max-w-10 !min-w-[unset] !px-0"
      onPress={async () => {
        setIsLoading(true);
        await logout();
        setIsLoading(false);
      }}
      {...props}
    >
      {isLoading ? <Spinner size="sm" color="default" /> : <LogOutIcon className="h-4 w-4 text-default-500" />}
    </Button>
  );
};

export default SignOutButton;
