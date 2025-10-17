import crypto from 'crypto';

/**
 * Generates a cryptographically secure random token
 * @returns URL-safe base64 encoded random token (32 bytes = 43 chars)
 */
export function generateToken(): string {
  return crypto.randomBytes(32).toString('base64url');
}

/**
 * Hashes a token using SHA-256 for secure storage
 * @param token - Plain text token to hash
 * @returns Hex-encoded SHA-256 hash
 */
export function hashToken(token: string): string {
  return crypto.createHash('sha256').update(token).digest('hex');
}

/**
 * Timing-safe comparison of a plaintext token against a stored hash
 * @param plaintext - Plain text token from user
 * @param hash - Stored SHA-256 hash
 * @returns True if token matches hash, false otherwise
 */
export function compareTokens(plaintext: string, hash: string): boolean {
  const plaintextHash = hashToken(plaintext);
  const a = new Uint8Array(Buffer.from(plaintextHash, 'hex'));
  const b = new Uint8Array(Buffer.from(hash, 'hex'));
  return crypto.timingSafeEqual(a, b);
}
