-- ============================================================
-- STATEMENTS FOR: Zeppelin
-- Generated: 2025-12-20
-- Updated: 2025-12-21 (removed redundant Congress co-attendance relationships)
-- ============================================================
-- Contains all relationships where Zeppelin is the SUBJECT.
--
-- Zeppelin was one of three key informants for Edison Carneiro's
-- capoeira research in "Negros Bantus" (1937), alongside Querido
-- de Deus and Barbosa. This co-informant relationship is meaningful
-- and documented below.
--
-- Event co-attendance (1937 Congress) is NOT modeled as statements
-- to avoid N*(N-1)/2 redundant relationships. Congress participation
-- is documented in bio/notes instead.
-- ============================================================

-- Zeppelin associated_with Querido de Deus (co-informant for Edison Carneiro's research)
-- This is a MEANINGFUL collaboration - they worked together as primary
-- informants for Carneiro's groundbreaking capoeira documentation.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-informants for Edison Carneiro''s capoeira research in ''Negros Bantus'' (1937)"}'::jsonb,
  'verified'::genealogy.confidence,
  'Edison Carneiro, "Negros Bantus" (1937) preface acknowledgments',
  E'Edison Carneiro acknowledged receiving "the most efficient assistance" from "Samuel ''Querido de Deus,'' Barbosa and Zeppelin, regarding capoeira de Angola". This places Zeppelin among the top three capoeira informants for this seminal research.',
  E'Edison Carneiro reconheceu ter recebido "a mais eficiente assistência" de "Samuel ''Querido de Deus,'' Barbosa e Zeppelin, sobre a capoeira de Angola". Isto coloca Zeppelin entre os três principais informantes de capoeira para esta pesquisa seminal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeppelin' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Querido de Deus' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeppelin associated_with Barbosa (co-informant for Edison Carneiro's research)
-- This is a MEANINGFUL collaboration - they worked together as primary
-- informants for Carneiro's groundbreaking capoeira documentation.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-informants for Edison Carneiro''s capoeira research in ''Negros Bantus'' (1937)"}'::jsonb,
  'verified'::genealogy.confidence,
  'Edison Carneiro, "Negros Bantus" (1937) preface acknowledgments',
  E'Edison Carneiro acknowledged receiving "the most efficient assistance" from "Samuel ''Querido de Deus,'' Barbosa and Zeppelin, regarding capoeira de Angola". This places Zeppelin and Barbosa among the top three capoeira informants for this seminal research.',
  E'Edison Carneiro reconheceu ter recebido "a mais eficiente assistência" de "Samuel ''Querido de Deus,'' Barbosa e Zeppelin, sobre a capoeira de Angola". Isto coloca Zeppelin e Barbosa entre os três principais informantes de capoeira para esta pesquisa seminal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeppelin' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Barbosa' AND o.apelido_context = 'Cachoeira/Largo Dois de Julho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOT MODELED AS STATEMENTS (event co-attendance only):
-- ============================================================
-- The following relationships are NOT created because they represent
-- mere event co-attendance at the 1937 Congress, not meaningful
-- personal connections:
--
-- - Zeppelin with Onça Preta, Juvenal, Bugaia, Fernandes, Eutíquio,
--   Neném, Zei, Ambrósio, Barroso, Arthur Mattos, Raphael, Edgar, Damião
--
-- These contemporaries are documented in Zeppelin's bio and notes.
-- ============================================================
