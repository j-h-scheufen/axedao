-- ============================================================
-- Rename predicate: granted_title_to -> received_title_from
-- ============================================================
-- Reason: Consistency with direction convention.
-- All predicates follow "subject received/learned FROM object" pattern:
--   - student_of: Subject learned FROM object
--   - trained_under: Subject trained WITH object
--   - baptized_by: Subject baptized BY object
--   - received_title_from: Subject received title FROM object (was backwards)
-- ============================================================

-- Rename the enum value
ALTER TYPE genealogy.predicate RENAME VALUE 'granted_title_to' TO 'received_title_from';
