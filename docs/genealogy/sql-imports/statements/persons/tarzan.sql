-- ============================================================
-- STATEMENTS FOR: Tarzan
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Tarzan is the SUBJECT.
-- ============================================================

-- Tarzan student_of Suassuna (CDO São Paulo, late 1960s-early 1970s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirawiki.org, capoeirabeiramar.com, grupocordaodeouro.com.br',
  E'One of Suassuna''s first bambas (skilled students) at Cordão de Ouro in São Paulo after its founding in 1967. Listed alongside Lobão, Esdras Filho, Belisco, Almir das Areias, and Caio as the first generation of students.',
  E'Um dos primeiros bambas de Suassuna no Cordão de Ouro em São Paulo após sua fundação em 1967. Listado ao lado de Lobão, Esdras Filho, Belisco, Almir das Areias e Caio como a primeira geração de alunos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tarzan' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tarzan trained_under Medicina (Itabuna or via Cordão de Ouro lineage)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirabeiramar.com',
  E'Beira-Mar website states Tarzan''s lineage goes "from Mestre Medicina to Mestre Suassuna all the way back to Mestre Bimba." This indicates training under Medicina, possibly in Itabuna before Suassuna''s academy, or as part of the broader CDO lineage.',
  E'O site do Beira-Mar afirma que a linhagem de Tarzan passa "de Mestre Medicina para Mestre Suassuna até Mestre Bimba." Isso indica treinamento com Medicina, possivelmente em Itabuna antes da academia de Suassuna, ou como parte da linhagem mais ampla do CDO.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tarzan' AND o.apelido = 'Medicina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Tarzan founded Capoeira Beira Mar (group) - group not yet imported
-- Tarzan associated_with Lobão - contemporary (first bambas together)
-- Tarzan associated_with Esdras Filho - contemporary (first bambas together)
-- Tarzan associated_with Belisco - contemporary (first bambas together)
-- Tarzan associated_with Almir das Areias - contemporary (first bambas together)
-- Tarzan associated_with Caio (CDO) - contemporary (first bambas together)
-- Tarzan associated_with Mestre Galo (Jundiaí) - taught together in Jundiaí [Galo Jundiaí not in dataset]
-- ============================================================
