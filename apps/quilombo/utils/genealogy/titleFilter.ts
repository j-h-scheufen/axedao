import type { Title } from '@/config/validation-schema';
import { titles } from '@/config/constants';

/**
 * Title level mapping - normalizes feminine/masculine variants to the same level.
 * Lower number = higher rank.
 *
 * Level 0: mestra/mestre (Master)
 * Level 1: contra-mestra/contra-mestre (Counter-Master)
 * Level 2: mestranda/mestrando/treinel (Master Candidate / Trainee at Master level)
 * Level 3: professora/professor (Professor)
 * Level 4: instrutora/instrutor (Instructor)
 * Level 5: graduada/graduado (Graduate)
 * Level 6: formada/formado (Formed)
 * Level 7: estagiaria/estagiario (Intern)
 * Level 8: estagianda/estagiando (Intern Candidate)
 * Level 9: monitora/monitor (Monitor)
 * Level 10: aluna/aluno (Student)
 * Level 11: iniciante (Beginner)
 */
export const TITLE_LEVELS: Record<Title, number> = {
  mestra: 0,
  mestre: 0,
  'contra-mestra': 1,
  'contra-mestre': 1,
  mestranda: 2,
  mestrando: 2,
  treinel: 2,
  professora: 3,
  professor: 3,
  instrutora: 4,
  instrutor: 4,
  graduada: 5,
  graduado: 5,
  formada: 6,
  formado: 6,
  estagiaria: 7,
  estagiario: 7,
  estagianda: 8,
  estagiando: 8,
  monitora: 9,
  monitor: 9,
  aluna: 10,
  aluno: 10,
  iniciante: 11,
};

/**
 * Human-readable labels for title levels (for UI dropdowns).
 * Sorted by level (highest rank first).
 */
export const TITLE_LEVEL_OPTIONS: Array<{ level: number; label: string; titles: Title[] }> = [
  { level: 0, label: 'Mestre/Mestra', titles: ['mestre', 'mestra'] },
  { level: 1, label: 'Contra-Mestre/Mestra', titles: ['contra-mestre', 'contra-mestra'] },
  { level: 2, label: 'Mestrando/Mestranda/Treinel', titles: ['mestrando', 'mestranda', 'treinel'] },
  { level: 3, label: 'Professor/Professora', titles: ['professor', 'professora'] },
  { level: 4, label: 'Instrutor/Instrutora', titles: ['instrutor', 'instrutora'] },
  { level: 5, label: 'Graduado/Graduada', titles: ['graduado', 'graduada'] },
  { level: 6, label: 'Formado/Formada', titles: ['formado', 'formada'] },
  { level: 7, label: 'Estagiario/Estagiaria', titles: ['estagiario', 'estagiaria'] },
  { level: 8, label: 'Estagiando/Estagianda', titles: ['estagiando', 'estagianda'] },
  { level: 9, label: 'Monitor/Monitora', titles: ['monitor', 'monitora'] },
  { level: 10, label: 'Aluno/Aluna', titles: ['aluno', 'aluna'] },
  { level: 11, label: 'Iniciante', titles: ['iniciante'] },
];

/**
 * Gets the normalized level for a title.
 * Lower number = higher rank.
 *
 * @param title - The capoeira title to get the level for
 * @returns The level number (0-12), or null for undefined/null/unknown titles
 *
 * @example
 * getTitleLevel('mestre') // returns 0
 * getTitleLevel('contra-mestra') // returns 1
 * getTitleLevel(null) // returns null
 * getTitleLevel('unknown') // returns null
 */
export function getTitleLevel(title: string | null | undefined): number | null {
  if (!title) return null;
  const level = TITLE_LEVELS[title as Title];
  return level !== undefined ? level : null;
}

/**
 * Gets all titles at or above a given level.
 *
 * @param maxLevel - Maximum level to include (lower = higher rank)
 * @returns Array of titles at or above the specified level
 *
 * @example
 * getTitlesAtOrAboveLevel(1) // returns ['mestra', 'mestre', 'contra-mestra', 'contra-mestre']
 */
export function getTitlesAtOrAboveLevel(maxLevel: number): Title[] {
  return titles.filter((title) => {
    const level = TITLE_LEVELS[title];
    return level !== undefined && level <= maxLevel;
  });
}

/**
 * Filters items by title level.
 * Items with titles at or above the specified level are included.
 * Items without titles are excluded.
 *
 * @param items - Array of items to filter
 * @param maxLevel - Maximum level to include (lower = higher rank, 0 = mestre only, 1 = contra-mestre+)
 * @param getTitleFn - Function to extract title from each item
 * @returns Filtered array with only items at or above the specified level
 *
 * @example
 * // Filter person profiles to contra-mestre and above
 * const highRank = filterByTitleLevel(profiles, 1, p => p.title);
 *
 * // Filter to mestre only
 * const mestres = filterByTitleLevel(profiles, 0, p => p.title);
 *
 * // Filter to professor and above
 * const professors = filterByTitleLevel(profiles, 3, p => p.title);
 */
export function filterByTitleLevel<T>(
  items: T[],
  maxLevel: number,
  getTitleFn: (item: T) => string | null | undefined
): T[] {
  return items.filter((item) => {
    const title = getTitleFn(item);
    const level = getTitleLevel(title);
    // Exclude items without titles, include items at or above maxLevel
    return level !== null && level <= maxLevel;
  });
}

/**
 * Checks if a title meets or exceeds a minimum level.
 *
 * @param title - The title to check
 * @param maxLevel - Maximum level allowed (lower = higher rank)
 * @returns true if title is at or above the level, false otherwise (including null titles)
 *
 * @example
 * isTitleAtOrAboveLevel('mestre', 1) // true (level 0 <= 1)
 * isTitleAtOrAboveLevel('professor', 1) // false (level 3 > 1)
 * isTitleAtOrAboveLevel(null, 1) // false
 */
export function isTitleAtOrAboveLevel(title: string | null | undefined, maxLevel: number): boolean {
  const level = getTitleLevel(title);
  return level !== null && level <= maxLevel;
}

/**
 * Gets the label for a specific title level.
 *
 * @param level - The level number (0-12)
 * @returns The human-readable label, or undefined if level is invalid
 */
export function getTitleLevelLabel(level: number): string | undefined {
  return TITLE_LEVEL_OPTIONS.find((opt) => opt.level === level)?.label;
}
