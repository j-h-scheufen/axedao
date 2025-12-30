-- ============================================================
-- STATEMENTS FOR: Cobra Mansa
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Cobra Mansa is the SUBJECT.
-- Relationships where Cobra Mansa is the OBJECT go in the
-- object's statement file (e.g., valmir.sql would have
-- "Valmir student_of Cobra Mansa").
-- ============================================================

-- Cobra Mansa student_of Moraes (primary teacher 1974-1986+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: capoeira.online, capoeirawiki.org, lalaue.com',
  'Primary teacher relationship. Cobra Mansa saw Moraes play in the Roda of Central Brazil in 1974 and became his student. Received mestre title from Moraes in 1986. Followed Moraes to Belo Horizonte (1979) and Salvador (1981).',
  'Relação de mestre principal. Cobra Mansa viu Moraes jogar na Roda do Central do Brasil em 1974 e se tornou seu aluno. Recebeu título de mestre de Moraes em 1986. Seguiu Moraes para Belo Horizonte (1979) e Salvador (1981).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa received_title_from Moraes (mestre 1986)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: capoeira.online, capoeirawiki.org, capoeirahistory.com',
  'Graduated to mestre by Moraes in 1986.',
  'Formado mestre por Moraes em 1986.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa trained_under João Grande (at GCAP mid-1980s)
-- After João Grande returned to teaching (convinced by Cobra Mansa and Moraes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1985-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: capoeira.online, joaogrande.org, nossa-tribo.com',
  'Cobra Mansa trained with João Grande at GCAP in the mid-1980s after helping convince him to return to teaching. This training contributed to preserving the direct Pastinha lineage through the Dois Joãos.',
  'Cobra Mansa treinou com João Grande no GCAP em meados dos anos 1980, após ajudar a convencê-lo a voltar a ensinar. Este treinamento contribuiu para preservar a linhagem direta de Pastinha através dos Dois Joãos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa associated_with João Grande (convinced him to return to teaching)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Together with Moraes, convinced João Grande to return to teaching capoeira angola after his withdrawal following Pastinha''s death in 1981", "pt": "Junto com Moraes, convenceu João Grande a voltar a ensinar capoeira angola após seu afastamento seguindo a morte de Pastinha em 1981"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Wikipedia, joaogrande.org, nossa-tribo.com',
  'Cobra Mansa and Moraes found João Grande working at a gas station and convinced him to return to teaching. This happened in the mid-1980s.',
  'Cobra Mansa e Moraes encontraram João Grande trabalhando em um posto de gasolina e o convenceram a voltar a ensinar. Isso aconteceu em meados dos anos 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa trained_under Josias da Silva (1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Wikipedia, capoeira.online, lalaue.com, acaz.site',
  'First capoeira teacher. Cobra Mansa began learning capoeira in 1973 at age 13 in Duque de Caxias with Josias da Silva and Raimundo. In 1974, he became student of Moraes.',
  'Primeiro professor de capoeira. Cobra Mansa começou a aprender capoeira em 1973 aos 13 anos em Duque de Caxias com Josias da Silva e Raimundo. Em 1974, tornou-se aluno de Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'Josias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa trained_under Raimundo (1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Wikipedia, capoeira.online, lalaue.com, acaz.site',
  'Early teacher alongside Josias da Silva. Cobra Mansa began learning capoeira in 1973 at age 13 in Duque de Caxias with Josias da Silva and Raimundo. In 1974, he became student of Moraes.',
  'Professor inicial junto com Josias da Silva. Cobra Mansa começou a aprender capoeira em 1973 aos 13 anos em Duque de Caxias com Josias da Silva e Raimundo. Em 1974, tornou-se aluno de Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'Raimundo' AND o.apelido_context = 'Duque de Caxias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Cobra Mansa associated_with Russo (Jonas Rabelo - Mestre Russo de Caxias) - co-founded Caxias Street Roda - needs import
-- Cobra Mansa associated_with Peixe (Itamar da Silva Barbosa - Mestre Peixe de Caxias) - co-founded Caxias Street Roda - needs import
-- NOTE: English sources incorrectly use "Rogerio Russo" (real name: Jonas Rabelo) and "Peixinho" (actual apelido: Peixe)
-- Cobra Mansa co_founded GCAP (1980/1981) - group not yet imported
-- Cobra Mansa founded FICA (1995/1996) - group not yet imported
-- Cobra Mansa founded Kilombo Tenondé (2004) - group not yet imported
-- Cobra Mansa departed_from GCAP (1995/1996) - group not yet imported
-- Cobra Mansa member_of Mukânda Capoeira Angola (2023) - group not yet imported
