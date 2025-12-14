'use client';

import { Avatar, Button, Card, CardBody, CardFooter, CardHeader, Divider, Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { Building2Icon, CheckCircleIcon, KeyIcon, PlusCircleIcon, SearchIcon, UserPlusIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import { enqueueSnackbar } from 'notistack';

import GroupSearchSelect from '@/components/genealogy/ui/GroupSearchSelect';
import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { useFetchUserGroups } from '@/query/currentUser';
import { useAddRelationship } from '@/query/genealogyProfile';
import { useGroupClaimable } from '@/query/group';
import ClaimGroupModal from './GroupProfile/ClaimGroupModal';

type GroupProfile = {
  id: string;
  name: string;
  style: string | null;
  logo: string | null;
  isActive: boolean;
};

type WizardStep = 'intro' | 'search' | 'group-actions' | 'not-found';

/**
 * Wizard for associating a user with a group.
 * Flow:
 * 1. Intro - Ask if user is associated with a group
 * 2. Search - Search for group in genealogy database
 * 3. Group Actions - Show options based on user state and group claimability:
 *    a. User has profileId -> Declare membership inline
 *    b. User lacks profileId -> Prompt to publish genealogy profile first
 *    c. Group is claimable -> Offer admin claim (for operators/teachers)
 * 4. Not Found - Option to register new group
 */
const GroupAssociationWizard = () => {
  const router = useRouter();
  const { data: user, isFetching } = useAtomValue(currentUserAtom);
  const [wizardStep, setWizardStep] = useState<WizardStep>('intro');
  const [selectedGroup, setSelectedGroup] = useState<GroupProfile | null>(null);
  const [isClaimModalOpen, setIsClaimModalOpen] = useState(false);

  const addRelationshipMutation = useAddRelationship();
  const { data: userGroups } = useFetchUserGroups();

  // Get profile IDs of groups user is already a member of
  const memberOfGroupIds = (userGroups?.memberGroups.map((g) => g.profileId).filter(Boolean) as string[]) ?? [];

  // Check if selected group is claimable (not already managed)
  const { data: isClaimable, isLoading: isCheckingClaimable } = useGroupClaimable(selectedGroup?.id ?? null);

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
    setWizardStep('group-actions');
  };

  const handleDeclareMembership = async () => {
    if (!selectedGroup) return;

    try {
      await addRelationshipMutation.mutateAsync({
        predicate: 'member_of',
        objectType: 'group',
        objectId: selectedGroup.id,
      });

      enqueueSnackbar(`You are now listed as a member of ${selectedGroup.name}`, { variant: 'success' });
      // Reset wizard to intro state so user sees their updated memberships
      setSelectedGroup(null);
      setWizardStep('intro');
    } catch (error) {
      console.error('Error declaring membership:', error);
      enqueueSnackbar((error as Error).message || 'Failed to declare membership', { variant: 'error' });
    }
  };

  const handleClaimSuccess = () => {
    setIsClaimModalOpen(false);
    setSelectedGroup(null);
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
            memberOfGroupIds={memberOfGroupIds}
          />
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
    );
  }

  // Step 3: Group Actions - Show options based on user state and group claimability
  if (wizardStep === 'group-actions' && selectedGroup) {
    return (
      <>
        <Card className="max-w-lg">
          <CardHeader className="flex gap-3">
            <Avatar
              src={selectedGroup.logo || undefined}
              name={selectedGroup.name}
              size="lg"
              icon={<Building2Icon className="h-6 w-6" />}
            />
            <div className="flex flex-col">
              <p className="text-xl font-semibold">{selectedGroup.name}</p>
              {selectedGroup.style && <p className="text-small text-default-500 capitalize">{selectedGroup.style}</p>}
            </div>
          </CardHeader>
          <Divider />
          <CardBody className="gap-4">
            {/* Section 1: Membership Declaration */}
            <div className="space-y-3">
              <div className="flex items-center gap-2">
                <UserPlusIcon className="h-5 w-5 text-primary" />
                <p className="font-semibold">Declare Membership</p>
              </div>

              {hasGenealogyProfile ? (
                <div className="p-4 bg-default-50 rounded-lg">
                  <p className="text-sm text-default-600 mb-3">
                    Add a <strong>member_of</strong> relationship to your genealogy profile, publicly linking you to
                    this group.
                  </p>
                  <Button
                    color="primary"
                    startContent={<CheckCircleIcon className="h-4 w-4" />}
                    onPress={handleDeclareMembership}
                    isLoading={addRelationshipMutation.isPending}
                  >
                    Confirm Membership
                  </Button>
                </div>
              ) : (
                <div className="p-4 bg-warning-50 dark:bg-warning-900/20 rounded-lg border border-warning-200 dark:border-warning-800">
                  <p className="text-sm text-warning-700 dark:text-warning-300">
                    To declare membership, you need to publish your Capoeira identity first.
                  </p>
                  <Button
                    color="warning"
                    variant="flat"
                    size="sm"
                    className="mt-3"
                    onPress={() => router.push(`${PATHS.profile}/genealogy`)}
                  >
                    Publish My Identity
                  </Button>
                </div>
              )}
            </div>

            {/* Section 2: Admin Claim (only if group is claimable) */}
            {isCheckingClaimable ? (
              <div className="flex items-center gap-2 p-4 bg-default-50 rounded-lg">
                <Spinner size="sm" />
                <p className="text-sm text-default-500">Checking group status...</p>
              </div>
            ) : (
              isClaimable && (
                <div className="space-y-3 pt-2 border-t border-default-200">
                  <div className="flex items-center gap-2">
                    <KeyIcon className="h-5 w-5 text-secondary" />
                    <p className="font-semibold">Claim Admin Rights</p>
                  </div>

                  <div className="p-4 bg-default-50 rounded-lg">
                    <p className="text-sm text-default-600 mb-3">
                      Are you an <strong>operator or teacher</strong> of this group? You can request admin rights to
                      manage its information on Quilombo.
                    </p>
                    <Button
                      color="secondary"
                      variant="flat"
                      startContent={<KeyIcon className="h-4 w-4" />}
                      onPress={() => setIsClaimModalOpen(true)}
                    >
                      Request Admin Rights
                    </Button>
                  </div>
                </div>
              )
            )}
          </CardBody>
          <Divider />
          <CardFooter>
            <Button
              variant="light"
              onPress={() => {
                setSelectedGroup(null);
                setWizardStep('search');
              }}
            >
              Back to Search
            </Button>
          </CardFooter>
        </Card>

        {/* Claim Modal */}
        <ClaimGroupModal
          isOpen={isClaimModalOpen}
          onOpenChange={(open) => {
            if (!open) {
              setIsClaimModalOpen(false);
            }
          }}
          profileId={selectedGroup.id}
          onSuccess={handleClaimSuccess}
        />
      </>
    );
  }

  // Step 4: Group not found - Register new group
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
          <Button variant="light" onPress={() => setWizardStep('intro')}>
            Back
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
