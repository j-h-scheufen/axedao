/**
 * Visual feedback component showing password strength requirements.
 * Displays checkmarks for met requirements and empty circles for unmet ones.
 *
 * @param password Current password value to validate against requirements
 */
export const PasswordRequirements = ({ password }: { password: string }) => {
  const requirements = [
    { label: 'At least 12 characters', test: (p: string) => p.length >= 12 },
    { label: 'One uppercase letter', test: (p: string) => /[A-Z]/.test(p) },
    { label: 'One lowercase letter', test: (p: string) => /[a-z]/.test(p) },
    { label: 'One number', test: (p: string) => /[0-9]/.test(p) },
    { label: 'One special character', test: (p: string) => /[!@#$%^&*(),.?":{}|<>]/.test(p) },
  ];

  if (!password) return null;

  return (
    <div className="text-xs space-y-1 mb-2">
      <p className="text-default-600 font-medium">Password Requirements:</p>
      {requirements.map((req) => (
        <div key={req.label} className="flex items-center gap-2">
          <span className={req.test(password) ? 'text-success' : 'text-default-400'}>
            {req.test(password) ? '✓' : '○'}
          </span>
          <span className={req.test(password) ? 'text-success' : 'text-default-600'}>{req.label}</span>
        </div>
      ))}
    </div>
  );
};
