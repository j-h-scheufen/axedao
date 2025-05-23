'use client';

import { Button } from "@heroui/button";
import { Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, useDisclosure } from "@heroui/modal";
import { useAtomValue } from 'jotai';
import { useCallback, useEffect } from 'react';

import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { getCookie, setCookie } from 'cookies-next';
import { useRouter } from 'next/navigation';

/**
 * This modal automatically opens on first login (and page reload) if the user hasn't filled out
 * at least a name or nickname. It sets a cookie that expires after 24 hours to prevent the modal from
 * showing up again. If the user still hasn't completed the described fields after that
 * time, the modal would be displayed again.
 */
const OnboardingModal = () => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  const router = useRouter();
  const { data: user } = useAtomValue(currentUserAtom);

  useEffect(() => {
    if (user && !user.name && !user.nickname) {
      const skipOnboarding = getCookie('quilombo.skipOnboarding');
      if (skipOnboarding === 'true') return;
      onOpen();
    }
  }, [user, onOpen]);

  const handleClose = useCallback(
    async (target: string) => {
      setCookie('quilombo.skipOnboarding', true, {
        expires: new Date(Date.now() + 1000 * 60 * 60 * 24), // we give the user 24 hrs before reminding again
      });

      router.push(target);
    },
    [router],
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} isDismissable={false} isKeyboardDismissDisabled={true}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">Hi There! Que bom te ver.</ModalHeader>
            <ModalBody>
              <p>
                Nice to meet you! You probably just signed up or haven&apos;t filled out some basic information, yet, so
                we don&apos;t know how to address you.
              </p>
              <p>Do you have a nickname? Are you a mestre or mestra ... or initiante? Which group do you belong to?</p>
              <p>
                Head over to &apos;<b>My Profile</b>&apos; and let the community know who you are. You can also do this
                later at any time by going to &apos;<b>My Profile</b>&apos; in the user menu on the top right.
              </p>
            </ModalBody>
            <ModalFooter>
              <Button color="secondary" variant="light" onPress={() => handleClose(PATHS.search).then(onClose)}>
                Browse around
              </Button>
              <Button color="primary" onPress={() => handleClose(`${PATHS.profile}/edit`).then(onClose)}>
                Take me to My Profile
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default OnboardingModal;
