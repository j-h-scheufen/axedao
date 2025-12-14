'use client';

import { Button, Modal, ModalBody, ModalContent, ModalHeader, useDisclosure } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useRouter } from 'next/navigation';
import { useCallback } from 'react';
import { PlusIcon } from 'lucide-react';

import { FieldInput } from '@/components/forms';
import { PATHS } from '@/config/constants';
import { type CreateNewGroupForm as FormType, createNewGroupFormSchema } from '@/config/validation-schema';
import { useCreateUnmanagedGroup } from '@/hooks/useGroup';

const CreateUnmanagedGroupModal = () => {
  const router = useRouter();
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const { createUnmanagedGroup, error } = useCreateUnmanagedGroup();

  const handleSubmit = useCallback(
    async (values: FormType, { resetForm }: { resetForm: () => void }) => {
      return createUnmanagedGroup(values).then((group) => {
        resetForm();
        onOpenChange();
        router.push(`${PATHS.groups}/${group.id}/edit`);
      });
    },
    [createUnmanagedGroup, onOpenChange, router]
  );

  const initValues: FormType = {
    name: '',
  };

  return (
    <>
      <Button color="primary" onPress={onOpen} startContent={<PlusIcon className="h-4 w-4" />}>
        Create Group
      </Button>
      <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
        <ModalContent>
          {(onClose) => (
            <>
              <ModalHeader className="flex flex-col gap-1">Create Unmanaged Group</ModalHeader>
              <ModalBody className="pb-6">
                <Formik<FormType>
                  initialValues={initValues}
                  onSubmit={handleSubmit}
                  validationSchema={createNewGroupFormSchema}
                >
                  {({ dirty, isValid, isSubmitting }: FormikProps<FormType>) => {
                    return (
                      <Form className="flex flex-col gap-3">
                        <Field name="name" label="Group Name" placeholder="Enter group name" as={FieldInput} />
                        {error && <div className="text-danger text-sm">{error.message}</div>}
                        <div className="flex gap-3 mt-2">
                          <Button variant="light" onPress={onClose} className="flex-1">
                            Cancel
                          </Button>
                          <Button
                            type="submit"
                            className="flex-1"
                            color="primary"
                            isLoading={isSubmitting}
                            disabled={!dirty || !isValid}
                          >
                            Create
                          </Button>
                        </div>
                      </Form>
                    );
                  }}
                </Formik>
              </ModalBody>
            </>
          )}
        </ModalContent>
      </Modal>
    </>
  );
};

export default CreateUnmanagedGroupModal;
