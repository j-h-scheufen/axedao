'use client';

import { Button, Card, CardBody, CardFooter, CardHeader, Divider, Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { Building2Icon, PlusCircleIcon, SearchIcon, UserPlusIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { useState } from 'react';

import GroupSearchSelect from '@/components/genealogy/ui/GroupSearchSelect';
import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';
import ClaimGroupModal from './GroupProfile/ClaimGroupModal';
import DeclareMembershipModal from './DeclareMembershipModal';

type GroupProfile = {
  id: string;
  name: string;
  style: string | null;
  logo: string | null;
  isActive: boolean;
};

type WizardStep = 'intro' | 'search' | 'not-found';

/**
 * Wizard for associating a user with a group.
 * Flow:
 * 1. Intro - Ask if user is associated with a group
 * 2. Search - Search for group in genealogy database
 * 3. Actions based on search:
 *    a. Group found & user has profileId -> Declare membership (member_of relation)
 *    b. Group found & user lacks profileId -> Prompt to publish genealogy profile first
 *    c. Group not found -> Option to register new group
 */
const GroupAssociationWizard = () => {
  const router = useRouter();
  const { data: user, isFetching } = useAtomValue(currentUserAtom);
  const [wizardStep, setWizardStep] = useState<WizardStep>('intro');
  const [selectedGroup, setSelectedGroup] = useState<GroupProfile | null>(null);
  const [isClaimModalOpen, setIsClaimModalOpen] = useState(false);
  const [isMembershipModalOpen, setIsMembershipModalOpen] = useState(false);

  // Check pending group claims
  // TODO: Add usePendingGroupClaim() query when implementing that feature

  if (isFetching || !user) {
    return (
      <Card className="max-w-lg">
        <CardBody className="flex items-center justify-center py-12">
          <Spinner size="lg" />
        </CardBody>
      </Card>
    );
  }

  const hasGenealogyProfile = !!user.profileId;

  const handleGroupSelect = (group: GroupProfile) => {
    setSelectedGroup(group);

    if (hasGenealogyProfile) {
      // User has genealogy profile - can declare membership
      setIsMembershipModalOpen(true);
    } else {
      // User lacks genealogy profile - can claim admin rights
      setIsClaimModalOpen(true);
    }
  };

  const handleMembershipSuccess = () => {
    setIsMembershipModalOpen(false);
    setSelectedGroup(null);
    // Refresh to show updated group association
    router.refresh();
  };

  // Step 1: Intro - Are you part of a group?
  if (wizardStep === 'intro') {
    return (
      <Card className="max-w-lg">
        <CardHeader className="flex gap-3">
          <Building2Icon className="h-8 w-8 text-primary" />
          <div className="flex flex-col">
            <p className="text-xl font-semibold">Group Association</p>
            <p className="text-small text-default-500">Connect with your Capoeira group</p>
          </div>
        </CardHeader>
        <Divider />
        <CardBody className="gap-4">
          <p className="text-default-600">Are you a member of a Capoeira group?</p>

          {!hasGenealogyProfile && (
            <div className="p-4 bg-warning-50 dark:bg-warning-900/20 rounded-lg border border-warning-200 dark:border-warning-800">
              <p className="text-sm text-warning-700 dark:text-warning-300">
                <strong>Tip:</strong> To declare group membership, first{' '}
                <button
                  type="button"
                  className="underline font-medium"
                  onClick={() => router.push(`${PATHS.profile}/genealogy`)}
                >
                  publish your Capoeira identity
                </button>{' '}
                in the genealogy. This links your profile to your group.
              </p>
            </div>
          )}

          <div className="flex flex-col gap-3 mt-2">
            <Button
              color="primary"
              size="lg"
              startContent={<SearchIcon className="h-5 w-5" />}
              onPress={() => setWizardStep('search')}
            >
              Yes, find my group
            </Button>
            <Button
              color="default"
              variant="flat"
              size="lg"
              startContent={<PlusCircleIcon className="h-5 w-5" />}
              onPress={() => setWizardStep('not-found')}
            >
              My group is not registered yet
            </Button>
          </div>
        </CardBody>
      </Card>
    );
  }

  // Step 2: Search for group in genealogy
  if (wizardStep === 'search') {
    return (
      <>
        <Card className="max-w-lg">
          <CardHeader className="flex gap-3">
            <SearchIcon className="h-8 w-8 text-primary" />
            <div className="flex flex-col">
              <p className="text-xl font-semibold">Find Your Group</p>
              <p className="text-small text-default-500">Search the genealogy database</p>
            </div>
          </CardHeader>
          <Divider />
          <CardBody className="gap-4">
            <p className="text-default-600">Search for your group by name:</p>

            <GroupSearchSelect
              label="Group Name"
              placeholder="Type at least 3 characters..."
              onSelect={handleGroupSelect}
              onClear={() => setSelectedGroup(null)}
            />

            <div className="flex items-start gap-2 p-3 bg-default-50 rounded-lg mt-2">
              <UserPlusIcon className="h-5 w-5 text-default-500 flex-shrink-0 mt-0.5" />
              <div className="text-sm text-default-600">
                {hasGenealogyProfile ? (
                  <p>
                    <strong>When you find your group:</strong> You can declare yourself as a member, which creates a
                    relationship in your genealogy profile.
                  </p>
                ) : (
                  <p>
                    <strong>When you find your group:</strong> If you&apos;re involved with the group, you can claim
                    admin rights to manage its information.
                  </p>
                )}
              </div>
            </div>
          </CardBody>
          <Divider />
          <CardFooter className="justify-between">
            <Button variant="light" onPress={() => setWizardStep('intro')}>
              Back
            </Button>
            <Button color="default" variant="flat" onPress={() => setWizardStep('not-found')}>
              Can&apos;t find it
            </Button>
          </CardFooter>
        </Card>

        {/* Claim Modal - for users without genealogy profile */}
        {selectedGroup && !hasGenealogyProfile && (
          <ClaimGroupModal
            isOpen={isClaimModalOpen}
            onOpenChange={() => {
              setIsClaimModalOpen(false);
              setSelectedGroup(null);
            }}
            profileId={selectedGroup.id}
          />
        )}

        {/* Membership Modal - for users with genealogy profile */}
        {selectedGroup && hasGenealogyProfile && (
          <DeclareMembershipModal
            isOpen={isMembershipModalOpen}
            onClose={() => {
              setIsMembershipModalOpen(false);
              setSelectedGroup(null);
            }}
            group={selectedGroup}
            onSuccess={handleMembershipSuccess}
          />
        )}
      </>
    );
  }

  // Step 3: Group not found - Register new group
  if (wizardStep === 'not-found') {
    return (
      <Card className="max-w-lg">
        <CardHeader className="flex gap-3">
          <PlusCircleIcon className="h-8 w-8 text-primary" />
          <div className="flex flex-col">
            <p className="text-xl font-semibold">Register a New Group</p>
            <p className="text-small text-default-500">Add your group to the database</p>
          </div>
        </CardHeader>
        <Divider />
        <CardBody className="gap-4">
          <p className="text-default-600">
            If your group is not in our database yet, you can submit a registration request. An administrator will
            review your submission.
          </p>

          <div className="p-4 bg-primary-50 dark:bg-primary-900/20 rounded-lg border border-primary-200 dark:border-primary-800">
            <p className="text-sm text-primary-700 dark:text-primary-300">
              <strong>What you&apos;ll need:</strong>
            </p>
            <ul className="list-disc list-inside text-sm text-primary-600 dark:text-primary-400 mt-2 space-y-1">
              <li>The group&apos;s official name</li>
              <li>The style (Angola, Regional, Contemporânea, etc.)</li>
              <li>Your relationship to the group</li>
              <li>Any information that helps verify the group exists</li>
            </ul>
          </div>
        </CardBody>
        <Divider />
        <CardFooter className="justify-between">
          <Button variant="light" onPress={() => setWizardStep('search')}>
            Back to Search
          </Button>
          <Button color="primary" onPress={() => router.push('/groups/register')}>
            Register New Group
          </Button>
        </CardFooter>
      </Card>
    );
  }

  return null;
};

export default GroupAssociationWizard;
