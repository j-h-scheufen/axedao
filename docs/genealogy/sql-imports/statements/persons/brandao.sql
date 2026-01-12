-- ============================================================
-- STATEMENTS FOR: Brandão
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Brandão is the SUBJECT.
-- ============================================================

-- Brandão student_of Waldemar (1950)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-52',
  'Began training with Mestre Waldemar in 1950, encouraged by a friend from sports. Waldemar operated the Barracão de Waldemar on Estrada da Liberdade in Salvador from 1940-1968.',
  'Começou a treinar com Mestre Waldemar em 1950, encorajado por um amigo do esporte. Waldemar operava o Barracão de Waldemar na Estrada da Liberdade em Salvador de 1940-1968.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brandão' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Waldemar' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Brandão associated_with Marrom (1990s CD recordings)
-- Note: This is a research/preservation collaboration, not a training relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "cd_recording_collaboration"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/master-marrom/',
  'Part of the old guard (velha guarda) of Bahian angoleiros who collaborated with Mestre Marrom on CD recordings preserving traditional capoeira Angola music. Listed alongside Gato Preto, Bigodinho, Boca Rica, Felipe, and João Grande.',
  'Parte da velha guarda de angoleiros baianos que colaborou com Mestre Marrom em gravações de CDs preservando a música tradicional da capoeira Angola. Listado junto com Gato Preto, Bigodinho, Boca Rica, Felipe e João Grande.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brandão' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Beto student_of Brandão - needs Beto import first
--   Primary teacher-student relationship; Beto became Contra-mestre under his father
--
-- Beto family_of Brandão - needs Beto import first
--   Properties: {relationship_type: son}
--   Born November 7, 1970
