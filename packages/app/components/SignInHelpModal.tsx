'use client';

import { Button } from '@nextui-org/button';
import { Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@nextui-org/modal';

type Props = { isOpen: boolean; onOpenChange: () => void };

/**
 *
 * @returns
 */
const SignInHelpModal = ({ isOpen, onOpenChange }: Props) => {
  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1 text-center">Hi There!</ModalHeader>
            <ModalBody>
              <p>
                Here at <i>Quilombo</i> we use a &lsquo;Digital Identity&rsquo; for login and to manage your Capoeira
                profile. A digital identity is a secure way to prove who you are online. This is done with the help of
                our partner{' '}
                <b>
                  <i>Silk</i>
                </b>
                .
              </p>
              <p>
                If you don&apos;t have a Silk account, yet, you can create one in a few easy steps and it&apos;s free:
              </p>
              <ol className="list-decimal list-inside">
                <li>
                  Click on <b>Connect with Silk</b>
                </li>
                <li>Enter your email and continue</li>
                <li>Choose a name and a password and submit</li>
                <li>Check your email inbox for a confirmation link from Silk and click it</li>
                <li>
                  Complete a bot challenge with a <b>slider</b> to proof you&apos;re human.
                </li>
              </ol>
              <p>
                <b>Important</b>: logging into your Silk account <i>always</i> requires both steps: your password and
                clicking a confirmation link sent via email.
              </p>
              <p>
                After your Silk account is connected, you can sign in to Quilombo by{' '}
                <i>&lsquo;signing a message&rsquo;</i>. This digital signature proves that you have unlocked your Silk
                account &#128521;
              </p>
            </ModalBody>
            <ModalFooter>
              <Button color="primary" onPress={onClose}>
                Got it. Let&apos;s go!
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default SignInHelpModal;
