'use client';

import { Avatar, Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { Building2Icon } from 'lucide-react';
import { enqueueSnackbar } from 'notistack';

import { useAddRelationship } from '@/query/genealogyProfile';

type GroupProfile = {
  id: string;
  name: string;
  style: string | null;
  logo: string | null;
};

type Props = {
  isOpen: boolean;
  onClose: () => void;
  group: GroupProfile;
  onSuccess?: () => void;
};

/**
 * Modal for declaring membership in a group.
 * Creates a member_of relationship between the user's person_profile and the group_profile.
 */
const DeclareMembershipModal = ({ isOpen, onClose, group, onSuccess }: Props) => {
  const addRelationshipMutation = useAddRelationship();

  const handleConfirm = async () => {
    try {
      await addRelationshipMutation.mutateAsync({
        predicate: 'member_of',
        objectType: 'group',
        objectId: group.id,
      });

      enqueueSnackbar(`You are now listed as a member of ${group.name}`, { variant: 'success' });
      onClose();
      onSuccess?.();
    } catch (error) {
      console.error('Error declaring membership:', error);
      enqueueSnackbar((error as Error).message || 'Failed to declare membership', { variant: 'error' });
    }
  };

  return (
    <Modal isOpen={isOpen} onOpenChange={(open) => !open && onClose()} size="md">
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1">Declare Membership</ModalHeader>
        <ModalBody>
          <div className="flex items-center gap-4 p-4 bg-default-50 rounded-lg">
            <Avatar
              src={group.logo || undefined}
              name={group.name}
              size="lg"
              icon={<Building2Icon className="h-6 w-6" />}
            />
            <div>
              <p className="font-semibold text-lg">{group.name}</p>
              {group.style && <p className="text-sm text-default-500 capitalize">{group.style}</p>}
            </div>
          </div>

          <p className="text-default-600 mt-4">
            This will add a <strong>member_of</strong> relationship to your genealogy profile, publicly linking you to
            this group.
          </p>

          <p className="text-sm text-default-500 mt-2">
            You can remove this relationship later from your genealogy profile settings.
          </p>
        </ModalBody>
        <ModalFooter>
          <Button color="default" variant="light" onPress={onClose}>
            Cancel
          </Button>
          <Button color="primary" onPress={handleConfirm} isLoading={addRelationshipMutation.isPending}>
            Confirm Membership
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default DeclareMembershipModal;
