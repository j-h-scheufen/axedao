'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { useRouter } from 'next/navigation';
import { useState } from 'react';

import { PATHS } from '@/config/constants';
import { useDeleteGenealogyProfile } from '@/query/genealogyProfile';

type DeleteProfileModalProps = {
  isOpen: boolean;
  onClose: () => void;
};

/**
 * Confirmation modal for deleting genealogy profile.
 * Shows warning about permanent deletion of profile and relationships.
 */
const DeleteProfileModal = ({ isOpen, onClose }: DeleteProfileModalProps) => {
  const router = useRouter();
  const deleteMutation = useDeleteGenealogyProfile();
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const handleDelete = async () => {
    try {
      setErrorMessage(null);
      await deleteMutation.mutateAsync();
      onClose();
      router.push(PATHS.profile);
    } catch (error) {
      console.error('Error deleting genealogy profile:', error);
      setErrorMessage(error instanceof Error ? error.message : 'Failed to delete profile');
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} size="lg">
      <ModalContent>
        <ModalHeader>Delete Genealogy Profile</ModalHeader>
        <ModalBody>
          <div className="space-y-4">
            <p className="text-default-700">
              Are you sure you want to delete your genealogy profile? This action <strong>cannot be undone</strong>.
            </p>

            <div className="bg-warning-50 border border-warning-200 rounded-lg p-4">
              <p className="text-warning-800 font-semibold mb-2">⚠️ What will be deleted:</p>
              <ul className="text-warning-700 text-sm space-y-1 list-disc list-inside">
                <li>Your public genealogy profile and all its data</li>
                <li>All relationships you've declared (mestres, groups)</li>
                <li>Your presence in the genealogy tree visualization</li>
              </ul>
            </div>

            <p className="text-default-500 text-sm">
              Note: Cached copies of your profile may exist on the web even after deletion. You can re-publish your
              profile later if you change your mind.
            </p>

            {errorMessage && (
              <div className="bg-danger-50 border border-danger-200 rounded-lg p-3">
                <p className="text-danger-700 text-sm">{errorMessage}</p>
              </div>
            )}
          </div>
        </ModalBody>
        <ModalFooter>
          <Button variant="light" onPress={onClose} isDisabled={deleteMutation.isPending}>
            Cancel
          </Button>
          <Button color="danger" onPress={handleDelete} isLoading={deleteMutation.isPending}>
            Delete Profile
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default DeleteProfileModal;
