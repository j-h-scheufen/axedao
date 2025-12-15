'use client';

import { Avatar, Button, Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { Camera, GlobeIcon, MailIcon } from 'lucide-react';
import Link from 'next/link';
import { useState } from 'react';

import ContactInfo from '@/components/ContactInfo';
import { FullDetailsModal } from '@/components/genealogy/ui';
import { userAtom, userAvatarUrlAtom } from '@/hooks/state/user';
import { getUserDisplayName } from '@/utils';

const UserProfile = () => {
  const { data: user, isFetching } = useAtomValue(userAtom);
  const avatarUrl = useAtomValue(userAvatarUrlAtom);
  const [showGenealogyModal, setShowGenealogyModal] = useState(false);

  if (!user || isFetching) return <Spinner />;

  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Avatar
        showFallback
        src={avatarUrl}
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex flex-col items-center gap-5 sm:gap-10 xs:flex-row">
          <div className="text-center xs:text-left">
            <div className="text-small capitalize text-default-500 flex justify-center xs:justify-start mt-2">
              {user.title}
            </div>
            <h3 className="text-lg font-medium">{getUserDisplayName(user)}</h3>
          </div>
          {user.profileId && (
            <Button
              size="sm"
              variant="bordered"
              startContent={<GlobeIcon className="h-4 w-4" />}
              onPress={() => setShowGenealogyModal(true)}
            >
              View Genealogy Profile
            </Button>
          )}
        </div>
        {user.email && !user.hideEmail && (
          <div className="flex gap-1 items-center text-default-400">
            <MailIcon className="h-4 w-4" />
            <Link
              href={`mailto:${user.email}`}
              className="text-small text-default-400 tracking-tight hover:text-primary"
            >
              {user.email}
            </Link>
          </div>
        )}
        <ContactInfo links={user.links} />
      </div>
      {user.profileId && (
        <FullDetailsModal
          isOpen={showGenealogyModal}
          onClose={() => setShowGenealogyModal(false)}
          entityType="person"
          entityId={user.profileId}
          entityName={getUserDisplayName(user)}
        />
      )}
    </div>
  );
};
export default UserProfile;
