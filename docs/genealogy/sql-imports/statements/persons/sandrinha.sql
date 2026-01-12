-- ============================================================
-- STATEMENTS FOR: Sandrinha
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Sandrinha is the SUBJECT.
-- ============================================================

-- Sandrinha student_of Roque (primary teacher, began ~1969)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-sandrinha-1959/, capoeirahistory.com/mestre/master-roque-1938/',
  E'Sandrinha began training under Mestre Roque at age 10 (~1969) at the Associação de Moradores do Pavão/Pavãozinho in Rio de Janeiro. She grew up in the same favela where Roque taught, and his academy became her second home. Roque himself stated that he "graduated the first capoeira mestra in Brazil", referring to Sandrinha.',
  E'Sandrinha começou a treinar com Mestre Roque aos 10 anos (~1969) na Associação de Moradores do Pavão/Pavãozinho no Rio de Janeiro. Ela cresceu na mesma favela onde Roque ensinava, e sua academia tornou-se um segundo lar. O próprio Roque declarou que "formou a primeira mestra de capoeira no Brasil", referindo-se a Sandrinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sandrinha' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Sandrinha received_title_from Roque (mestra, 1970s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestra"}}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-sandrinha-1959/, periodicos.sbu.unicamp.br/ojs/index.php/conexoes/article/view/8674321',
  E'Sandrinha was recognized as mestra in the 1970s, making her the first woman to formally receive this rank in Brazilian capoeira. According to Mestre Roque''s own testimony, he "graduated the first capoeira mestra in Brazil". The 2023 UNICAMP study confirms: "foi reconhecida mestra na década de 1970".',
  E'Sandrinha foi reconhecida como mestra nos anos 1970, tornando-se a primeira mulher a receber formalmente este título na capoeira brasileira. De acordo com o próprio depoimento de Mestre Roque, ele "formou a primeira mestra de capoeira no Brasil". O estudo UNICAMP de 2023 confirma: "foi reconhecida mestra na década de 1970".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sandrinha' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Sandrinha trained_under Caiçara (also graduated by, date unknown)
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
  'capoeirahistory.com/mestre/master-sandrinha-1959/',
  E'capoeirahistory.com states Sandrinha was "Also graduated by Mestre Caiçara". This secondary graduation connected her to the Salvador Angola scene through the legendary and controversial mestre known for his hard style and iconic bengala. Timeline and context of this training are unknown.',
  E'capoeirahistory.com afirma que Sandrinha foi "Também graduada por Mestre Caiçara". Esta graduação secundária conectou-a à cena de Angola de Salvador através do lendário e controverso mestre conhecido por seu estilo duro e icônica bengala. Linha do tempo e contexto deste treinamento são desconhecidos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sandrinha' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet imported):
-- - Sandrinha teaches_at Grupo Bantus de Capoeira (Roque) - needs group import
-- - Sandrinha member_of Filhos de Angola (Rio 1960) - needs group import
-- - Sandrinha associated_with Grupo Sabata - needs group import (performed with)
-- - Sandrinha associated_with Filhos de Obá - needs group import (performed with in Salvador)
--
-- NOTE: CapoeiraWiki lists Sandrinha as Caiçara's student but the caicara.sql
-- statements file notes: "Do NOT add 'Sandrinha student_of Caiçara' unless
-- clearer evidence emerges." The capoeirahistory.com source says "Also graduated
-- by Mestre Caiçara" which we've captured as trained_under (secondary graduation).
