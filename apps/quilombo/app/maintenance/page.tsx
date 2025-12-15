import Image from 'next/image';

export const metadata = {
  title: 'Maintenance | Quilombo',
  description: 'Quilombo is currently under maintenance',
};

export default function MaintenancePage() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-background to-content1 px-4">
      <div className="text-center max-w-md">
        <div className="mb-8">
          <Image
            src="/quilombo-icon-192x192.png"
            alt="Quilombo"
            width={120}
            height={120}
            className="mx-auto opacity-80"
            priority
          />
        </div>

        <h1 className="text-3xl font-bold text-foreground mb-4">Under Maintenance</h1>

        <p className="text-lg text-foreground/70">
          We&apos;re making some improvements to Quilombo. We&apos;ll be back as soon as possible.
        </p>
      </div>
    </div>
  );
}
