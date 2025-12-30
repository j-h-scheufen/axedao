-- ============================================================
-- STATEMENTS FOR: Chico Me Dá
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Chico Me Dá is the SUBJECT.
--
-- NOTE: No documented relationships found. Chico Me Dá is known only
-- from Mestre Pastinha's 1967 interview where he was listed among
-- deceased practitioners of "pure Capoeira de Angola". No teachers,
-- students, group affiliations, or specific incidents are documented.
-- ============================================================

-- ============================================================
-- CONTEMPORARY ASSOCIATION (as associated_with)
-- ============================================================
-- Chico Me Dá was listed by Pastinha alongside other legendary
-- angoleiros as practitioners of the same generation and style.
-- This implies a contemporaneous association within the capoeira
-- community of early 20th century Salvador, though no direct
-- interactions are documented.

-- Chico Me Dá associated_with Pastinha (same generation of angoleiros)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Listed by Pastinha among practitioners of pure Capoeira de Angola"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Realidade, February 1967 (Pastinha interview)',
  E'Pastinha listed Chico Me Dá among 17 deceased practitioners of "pure Capoeira de Angola" in his 1967 interview. This indicates Chico Me Dá was a known figure in the capoeira community of Salvador and recognized by Pastinha as belonging to the same tradition.',
  E'Pastinha listou Chico Me Dá entre 17 praticantes falecidos de "capoeira de Angola pura" em sua entrevista de 1967. Isso indica que Chico Me Dá era uma figura conhecida na comunidade da capoeira de Salvador e reconhecido por Pastinha como pertencente à mesma tradição.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Me Dá' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional documentation found)
-- ============================================================
-- No teacher relationships (student_of, trained_under) documented
-- No student relationships documented
-- No group affiliations documented
-- No title conferred documented
-- No baptism documented
--
-- If future research uncovers any of the following, they should be
-- added as statements:
-- - Who taught Chico Me Dá capoeira
-- - Any students he may have trained
-- - Any groups or rodas he frequented
-- - Any specific incidents or fights involving him
-- - Origin of his distinctive apelido
-- ============================================================
