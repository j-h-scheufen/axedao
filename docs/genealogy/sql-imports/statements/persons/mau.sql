-- ============================================================
-- STATEMENTS FOR: Mau
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Mau is the SUBJECT.
-- ============================================================

-- Mau student_of Gato Preto (primary teacher from 1968)
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
  'velhosmestres.com/br/gato-1968-1',
  'Marcelino (Mestre Mau) began learning capoeira with Mestre Gato Preto at age 26 in 1968 at Engenho Velho da Federação, Salvador.',
  'Marcelino (Mestre Mau) começou a aprender capoeira com Mestre Gato Preto aos 26 anos em 1968 no Engenho Velho da Federação, Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mau' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mau influenced_by Cobrinha Verde (mentor relationship - Cobrinha attended his academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '1983-05-12'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1982-3, Capoeira e Mandingas (1991)',
  'Cobrinha Verde attended Mau''s academy on Sundays and "felt at home" there. Mau documented Cobrinha Verde''s life in his 1991 book. Relationship ended with Cobrinha Verde''s death in 1983.',
  'Cobrinha Verde frequentava a academia de Mau aos domingos e "se sentia em casa" lá. Mau documentou a vida de Cobrinha Verde em seu livro de 1991. Relacionamento terminou com a morte de Cobrinha Verde em 1983.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mau' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mau co_founded Capoeira 3 Amigos (1974)
-- NOTE: Group not yet imported - will generate when group exists
-- INSERT INTO genealogy.statements ...
-- WHERE s.apelido = 'Mau' AND o.name = 'Capoeira 3 Amigos'

-- Mau co_founded Filhos de Oxalá (1974)
-- NOTE: Group not yet imported - will generate when group exists
-- INSERT INTO genealogy.statements ...
-- WHERE s.apelido = 'Mau' AND o.name = 'Filhos de Oxalá'

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mau co_founded Capoeira 3 Amigos - needs group import first
-- Mau co_founded Filhos de Oxalá - needs group import first
-- NOTE: Bom Cabrito relationship will be captured via co_founded when group is imported
-- ============================================================
