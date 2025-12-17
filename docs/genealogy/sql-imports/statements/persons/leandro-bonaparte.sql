-- ============================================================
-- STATEMENTS FOR: Leandro Bonaparte
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Leandro Bonaparte is the SUBJECT.
-- ============================================================

-- Leandro Bonaparte associated_with Manduca da Praia (rival/contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1870-01-01'::date, 'decade'::genealogy.date_precision,
  '1890-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "rival_gang_leader"}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Leandro Bonaparte (chief of São Francisco party, Guaiamú federation) and Manduca da Praia (chief of Santa Luzia party, Nagoa federation) were the two principal leaders of the rival capoeira federations in Rio de Janeiro. The Guaiamú wore red, the Nagoa wore white. Their confrontations defined the era.',
  'Leandro Bonaparte (chefe do partido de São Francisco, federação Guaiamú) e Manduca da Praia (chefe do partido de Santa Luzia, federação Nagoa) foram os dois principais líderes das federações rivais de capoeira no Rio de Janeiro. Os Guaiamú usavam vermelho, os Nagoa usavam branco. Seus confrontos definiram a era.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leandro Bonaparte' AND o.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Leandro Bonaparte leads São Francisco party (Guaiamú) - GROUP not in dataset
--   The São Francisco party was a territorial capoeira malta organized
--   around the São Francisco parish. Groups/maltas are not currently
--   tracked in the genealogy database as they were informal territorial
--   organizations rather than formal capoeira groups.
--
-- Leandro Bonaparte associated_with Jorge Marinha (contemporary gang leader)
--   Jorge Marinha was listed in persons-backlog as chief of Marinha gang,
--   which was part of the Guaiamú federation. However, no additional
--   information about Jorge Marinha was found in research. May be
--   referenced to the Marinha PARISH (Santa Rita, Marinha, etc.) rather
--   than a person named Jorge Marinha.
-- ============================================================
