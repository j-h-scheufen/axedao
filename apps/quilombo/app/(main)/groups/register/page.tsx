import RegisterGroupForm from '@/components/forms/group/RegisterGroupForm';

export const metadata = {
  title: 'Register Group | Quilombo',
  description: 'Submit a registration request for a new Capoeira group',
};

/**
 * Page for registering a new group that doesn't exist in the genealogy database.
 * Accessible via /groups/register
 */
export default function RegisterGroupPage() {
  return (
    <div className="container mx-auto px-4 py-8">
      <RegisterGroupForm />
    </div>
  );
}
