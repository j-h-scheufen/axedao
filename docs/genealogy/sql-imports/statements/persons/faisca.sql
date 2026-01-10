-- ============================================================
-- STATEMENTS FOR: Faísca
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Faísca is the SUBJECT.
-- ============================================================

-- Faísca student_of João Pequeno (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1991-01-01'::date, 'year'::genealogy.date_precision,
  '2011-12-09'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://ceca-riovermelho.org.br/mestres/mestre-faisca/?lang=en',
  E'Primary teacher relationship. First lesson with João Pequeno in 1991 at USP. Moved to Salvador 1996 to train directly. João Pequeno guided Faísca to "keep CECA alive and the name of his academy." Relationship ended with João Pequeno''s death December 9, 2011.',
  E'Relação de mestre principal. Primeira aula com João Pequeno em 1991 na USP. Mudou-se para Salvador em 1996 para treinar diretamente. João Pequeno orientou Faísca a "manter o CECA vivo e o nome de sua academia." Relação encerrada com a morte de João Pequeno em 9 de dezembro de 2011.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Faísca' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Faísca received_title_from João Pequeno (mestre title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2001-10-14'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "Academia do Forte Santo Antônio Além do Carmo", "location": "Salvador, Bahia"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://ceca-riovermelho.org.br/mestres/mestre-faisca/?lang=en',
  E'On October 14, 2001, in an event at the Academia do Forte Santo Antônio Além do Carmo, Salvador-Ba, Luís Roberto Ricardo received from Mestre João Pequeno the title of "mestre", which formally introduced him as Mestre Faísca to the capoeira community.',
  E'Em 14 de outubro de 2001, em um evento na Academia do Forte Santo Antônio Além do Carmo, Salvador-Ba, Luís Roberto Ricardo recebeu de Mestre João Pequeno o título de "mestre", que o apresentou formalmente como Mestre Faísca à comunidade da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Faísca' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Faísca trained_under Izael (mentorship in São Carlos, pre-1991)
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
  '1991-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://ceca-riovermelho.org.br/mestres/mestre-faisca/?lang=en',
  E'Faísca sought mentorship from Mestre Izael Teixeira in São Carlos, SP, who accepted him. This was after founding his first group in Mococa and before meeting João Pequeno in 1991. Izael focused on Capoeira Regional de Mestre Bimba rather than Angola. When Izael opted to recover the Traditional Capoeira Regional, Faísca departed to continue his search for Capoeira Angola, eventually leading him to João Pequeno.',
  E'Faísca buscou orientação de Mestre Izael Teixeira em São Carlos, SP, que o aceitou. Isso foi depois de fundar seu primeiro grupo em Mococa e antes de conhecer João Pequeno em 1991. Izael focava na Capoeira Regional de Mestre Bimba e não na Angola. Quando Izael optou por resgatar a Capoeira Regional Tradicional, Faísca se desligou para continuar sua busca pela Capoeira Angola, eventualmente o levando a João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Faísca' AND o.apelido = 'Izael'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Faísca founded CEDANZE - needs group import first
-- Faísca leads CEDANZE - needs group import first
-- Faísca leads AJPP-CECA (Academia João Pequeno de Pastinha) - needs group import first
