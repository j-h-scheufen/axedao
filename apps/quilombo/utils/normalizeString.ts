/**
 * Normalizes a string for accent-insensitive comparison.
 * Removes diacritical marks (accents) and converts to lowercase.
 *
 * Examples:
 * - "José" -> "jose"
 * - "Capoeirão" -> "capoeirap"
 * - "Müller" -> "muller"
 *
 * @param str - The string to normalize
 * @returns The normalized string without accents, in lowercase
 */
export function normalizeString(str: string): string {
  return str
    .normalize('NFD') // Decompose combined characters into base + diacritics
    .replace(/[\u0300-\u036f]/g, '') // Remove diacritical marks
    .toLowerCase();
}

/**
 * Checks if a string matches a search term using accent-insensitive comparison.
 *
 * @param value - The value to search in
 * @param searchTerm - The search term to look for
 * @returns True if the normalized value contains the normalized search term
 */
export function matchesNormalized(value: string | null | undefined, searchTerm: string): boolean {
  if (!value) return false;
  return normalizeString(value).includes(normalizeString(searchTerm));
}
