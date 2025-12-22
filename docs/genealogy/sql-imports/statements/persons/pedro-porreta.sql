-- ============================================================
-- STATEMENTS FOR: Pedro Porreta
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Pedro Porreta is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Pedro Porreta associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were notorious capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were well-known valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões conhecidos em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedro Porreta' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Samuel, Nozinho, Duquinha, Escalvino)
-- share historical context but connections are via shared lawyer, captured in bios/notes.
-- Each links to Pedro Porreta from their own file; no M:N cross-references needed.
-- ============================================================

-- ------------------------------------------------------------
-- Pedro Porreta family_of Piroca (brothers)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  E'Pedro Porreta (Pedro Mineiro) and Piroca (Pedro de Alcântara) were brothers. Both were notorious valentões in Salvador during the 1920s. Sources describe Piroca as "the brother of the dreaded" (irmão do temido) Pedro Porreta.',
  E'Pedro Porreta (Pedro Mineiro) e Piroca (Pedro de Alcântara) eram irmãos. Ambos eram valentões notórios em Salvador durante os anos 1920. Fontes descrevem Piroca como "o irmão do temido" Pedro Porreta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedro Porreta' AND o.apelido = 'Piroca'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Note: Chicão associated_with Pedro Porreta exists in chicao.sql (lines 9-32)
