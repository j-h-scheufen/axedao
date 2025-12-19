'use client';

import { Avatar, Button, Card, CardBody, addToast } from '@heroui/react';
import { Field, Form, Formik, type FormikHelpers } from 'formik';
import { ArrowLeft } from 'lucide-react';

import FieldTextarea from '@/components/forms/FieldTextarea';
import { claimPersonFormSchema } from '@/config/validation-schema';
import { useClaimPersonMutation } from '@/query/genealogyProfile';

import { useOnboarding } from '../contexts/OnboardingContext';

type ClaimFormValues = {
  userMessage: string;
};

/**
 * ClaimFormStep - Form to submit claim verification message
 *
 * Shows the selected profile and a form for the user to explain why this is their profile.
 * On submit, creates the claim and navigates to FinalStep.
 */
export function ClaimFormStep() {
  const { state, goToStep, goBack, canGoBack, setSubmittedClaim } = useOnboarding();
  const { selectedClaimProfile } = state;

  const claimMutation = useClaimPersonMutation();

  // Safety check - should have a selected profile
  if (!selectedClaimProfile) {
    // Redirect back to claim check if no profile selected
    goToStep('claim-check');
    return null;
  }

  const getDisplayName = () => {
    return selectedClaimProfile.apelido || selectedClaimProfile.name || 'this profile';
  };

  const handleSubmit = async (values: ClaimFormValues, helpers: FormikHelpers<ClaimFormValues>) => {
    try {
      await claimMutation.mutateAsync({
        personProfileId: selectedClaimProfile.id,
        userMessage: values.userMessage.trim(),
      });

      addToast({
        title: 'Claim submitted',
        description: 'Your request to claim this profile has been submitted for review.',
        color: 'success',
      });

      // Store claim info for final step messaging
      setSubmittedClaim({
        profileId: selectedClaimProfile.id,
        profileApelido: selectedClaimProfile.apelido,
      });

      helpers.resetForm();

      // Navigate to final step
      goToStep('final');
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Failed to submit claim';
      addToast({
        title: 'Error',
        description: message,
        color: 'danger',
      });
    }
  };

  return (
    <div className="space-y-5">
      {/* Intro message */}
      <div className="text-center">
        <h2 className="text-xl font-semibold mb-2">Claim This Profile</h2>
        <p className="text-sm text-default-500">Request to link this genealogy profile to your account</p>
      </div>

      {/* Profile preview card */}
      <Card>
        <CardBody className="p-4">
          <div className="flex items-center gap-4">
            <Avatar
              src={selectedClaimProfile.portrait || undefined}
              name={getDisplayName()}
              size="lg"
              className="flex-shrink-0"
            />
            <div className="flex-grow min-w-0">
              {selectedClaimProfile.title && (
                <p className="text-xs text-default-500 uppercase tracking-wide">{selectedClaimProfile.title}</p>
              )}
              <p className="text-lg font-semibold truncate">{getDisplayName()}</p>
              {selectedClaimProfile.name && selectedClaimProfile.apelido && (
                <p className="text-sm text-default-500 truncate">{selectedClaimProfile.name}</p>
              )}
            </div>
          </div>
        </CardBody>
      </Card>

      {/* Claim form */}
      <Formik<ClaimFormValues>
        initialValues={{ userMessage: '' }}
        validationSchema={claimPersonFormSchema}
        onSubmit={handleSubmit}
      >
        {({ isSubmitting }) => (
          <Form className="space-y-5">
            {/* Explanation */}
            <div className="p-4 rounded-xl bg-gradient-to-r from-primary/10 to-transparent">
              <p className="text-sm text-default-600">
                To claim this profile, please explain how you can verify that this is your profile. An administrator
                will review your request.
              </p>
            </div>

            {/* Message field */}
            <Card>
              <CardBody className="p-4">
                <Field
                  as={FieldTextarea}
                  name="userMessage"
                  label="Verification message"
                  placeholder="E.g., I was batizado by Mestre X in 2010 at event Y. My group is Z and I can provide..."
                  minRows={4}
                  description="Minimum 20 characters. Provide details that help verify your identity."
                />
              </CardBody>
            </Card>

            {/* Submit button */}
            <div className="flex flex-col sm:flex-row gap-3 justify-center pt-2">
              <Button
                color="primary"
                size="lg"
                type="submit"
                isLoading={isSubmitting}
                isDisabled={isSubmitting}
                className="min-w-[180px]"
              >
                Submit Claim Request
              </Button>
            </div>

            {/* Note */}
            <p className="text-xs text-default-400 text-center">
              You&apos;ll receive an email when your claim is reviewed.
            </p>

            {/* Back button */}
            {canGoBack && (
              <div className="fixed bottom-0 left-0 right-0 z-50 bg-background pb-4 px-2 sm:px-4 pt-3 border-t border-default-200 md:static md:z-auto md:bg-transparent md:pb-0 md:px-0 md:pt-4 md:border-t-0">
                <Button
                  variant="light"
                  color="default"
                  startContent={<ArrowLeft className="w-4 h-4" />}
                  onPress={goBack}
                  isDisabled={isSubmitting}
                >
                  Back
                </Button>
              </div>
            )}
          </Form>
        )}
      </Formik>
    </div>
  );
}

export default ClaimFormStep;
