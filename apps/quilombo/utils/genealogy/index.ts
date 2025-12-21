/**
 * Genealogy utilities for filtering and processing genealogy data.
 */

export {
  TITLE_LEVELS,
  TITLE_LEVEL_OPTIONS,
  getTitleLevel,
  getTitlesAtOrAboveLevel,
  filterByTitleLevel,
  isTitleAtOrAboveLevel,
  getTitleLevelLabel,
} from './titleFilter';

export { isPresumedDeceased, shouldIncludePersonNode, type PersonFilterConfig } from './personFilter';
