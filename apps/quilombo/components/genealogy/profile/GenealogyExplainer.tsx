'use client';

import { Button, Card, CardBody, CardFooter, CardHeader, Divider } from '@heroui/react';
import { AlertTriangleIcon, CheckCircleIcon, GlobeIcon, LockIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';

import { PATHS } from '@/config/constants';

type GenealogyExplainerProps = {
  onContinue: () => void;
};

/**
 * Explainer component shown to first-time users before publishing to genealogy.
 * Educates users about what publishing means and what data becomes public.
 */
const GenealogyExplainer = ({ onContinue }: GenealogyExplainerProps) => {
  const router = useRouter();

  return (
    <Card className="max-w-2xl mx-auto">
      <CardHeader className="flex gap-3">
        <GlobeIcon className="h-8 w-8 text-primary" />
        <div className="flex flex-col">
          <p className="text-xl font-semibold">Join the Capoeira Genealogy</p>
          <p className="text-small text-default-500">Contribute to the living historical record</p>
        </div>
      </CardHeader>
      <Divider />
      <CardBody className="gap-4">
        <p className="text-default-600">
          The Capoeira Genealogy is a <strong>publicly accessible database</strong> documenting the history, lineages,
          and connections within the global Capoeira community.
        </p>
        <p className="text-default-600">
          By publishing your profile, you are contributing to this living historical record.
        </p>

        <Card className="bg-warning-50 dark:bg-warning-900/20 border border-warning-200 dark:border-warning-800">
          <CardBody className="gap-2">
            <div className="flex items-start gap-2">
              <AlertTriangleIcon className="h-5 w-5 text-warning-600 dark:text-warning-400 flex-shrink-0 mt-0.5" />
              <div>
                <p className="font-medium text-warning-700 dark:text-warning-300">
                  Important: The information you share will be:
                </p>
                <ul className="mt-2 space-y-1 text-warning-600 dark:text-warning-400 text-sm">
                  <li>• Publicly visible to anyone (including non-registered users)</li>
                  <li>• Searchable as part of the lineage network</li>
                  <li>• Part of the permanent historical record</li>
                </ul>
              </div>
            </div>
          </CardBody>
        </Card>

        <div className="grid md:grid-cols-2 gap-4">
          <div className="space-y-2">
            <div className="flex items-center gap-2 text-success-600 dark:text-success-400">
              <CheckCircleIcon className="h-5 w-5" />
              <span className="font-medium">What you can publish:</span>
            </div>
            <ul className="space-y-1 text-default-500 text-sm pl-7">
              <li>• Your Capoeira name (apelido) and title</li>
              <li>• Your portrait image</li>
              <li>• Your biography and style</li>
              <li>• Your declared relationships (mestres, groups)</li>
            </ul>
          </div>

          <div className="space-y-2">
            <div className="flex items-center gap-2 text-default-600">
              <LockIcon className="h-5 w-5" />
              <span className="font-medium">What stays private:</span>
            </div>
            <ul className="space-y-1 text-default-500 text-sm pl-7">
              <li>• Your email and phone number</li>
              <li>• Your wallet address</li>
              <li>• Your personal social media links</li>
              <li>• Your app account details</li>
            </ul>
          </div>
        </div>
      </CardBody>
      <Divider />
      <CardFooter className="justify-end gap-2">
        <Button variant="light" onPress={() => router.push(PATHS.profile)}>
          Cancel
        </Button>
        <Button color="primary" onPress={onContinue}>
          I Understand, Continue
        </Button>
      </CardFooter>
    </Card>
  );
};

export default GenealogyExplainer;
