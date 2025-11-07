import bcrypt from 'bcrypt';

const BCRYPT_ROUNDS = 12;

/**
 * Hashes a password using bcrypt with a cost factor of 12
 * @param password - Plain text password to hash
 * @returns Bcrypt hash string
 */
export async function hashPassword(password: string): Promise<string> {
  return bcrypt.hash(password, BCRYPT_ROUNDS);
}

/**
 * Verifies a password against a bcrypt hash
 * @param password - Plain text password to verify
 * @param hash - Bcrypt hash to compare against
 * @returns True if password matches, false otherwise
 */
export async function verifyPassword(password: string, hash: string): Promise<boolean> {
  return bcrypt.compare(password, hash);
}
