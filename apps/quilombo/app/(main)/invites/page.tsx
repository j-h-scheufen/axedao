'use client';

import PageHeading from '@/components/PageHeading';
import InviteMemberForm from '@/components/settings/InviteMemberForm';

const InvitesPage = () => {
  return (
    <div className="flex w-full flex-col items-center">
      <PageHeading>Invite Friends</PageHeading>

      <div className="flex w-full max-w-4xl flex-col gap-6 sm:px-4">
        <p className="text-default-500">
          Share Quilombo with your friends! Send them an invitation via email or generate a QR code they can scan.
        </p>

        <InviteMemberForm />
      </div>
    </div>
  );
};

export default InvitesPage;
