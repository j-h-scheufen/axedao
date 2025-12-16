-- ============================================================
-- STATEMENTS FOR: João Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where João Pequeno is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- João Pequeno student_of Pastinha
-- Primary formal teacher from ~1945 until Pastinha's death 1981
-- Promoted to treinel ~1945, became one of two principal heirs
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia; CECA official; Portal Capoeira; multiple sources',
  'João Pequeno joined Pastinha''s academy ~1943-1945, was promoted to treinel shortly after. Pastinha named him one of "the two most learned students" alongside João Grande. In 1970, Pastinha prophesied: "They will be the great capoeiras of the future." Relationship ended with Pastinha''s death Nov 13, 1981.',
  'João Pequeno ingressou na academia de Pastinha ~1943-1945, foi promovido a treinel pouco depois. Pastinha o nomeou um dos "dois alunos mais preparados" junto com João Grande. Em 1970, Pastinha profetizou: "Eles serão os grandes capoeiras do futuro." Relação terminou com a morte de Pastinha em 13/11/1981.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno trained_under Cobrinha Verde
-- Attended Cobrinha Verde's roda before joining Pastinha
-- Intermediate training ~1943, introduced by Barbosa
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CECA official; Portal Capoeira; multiple sources',
  'After arriving in Salvador in January 1943, João Pequeno attended Cobrinha Verde''s roda in Chame-Chame neighborhood, introduced by Barbosa. This was before joining Pastinha''s academy.',
  'Após chegar em Salvador em janeiro de 1943, João Pequeno frequentou a roda de Cobrinha Verde no bairro do Chame-Chame, apresentado por Barbosa. Isso foi antes de ingressar na academia de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno family_of Besouro Mangangá
-- Besouro was João Pequeno's father's cousin
-- First cousin once removed relationship
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "first_cousin_once_removed", "through": "father"}'::jsonb,
  'verified'::genealogy.confidence,
  'CECA official; Wikipedia; Portal Capoeira',
  'Besouro Mangangá was João Pequeno''s father''s cousin. João Pequeno himself stated: "Besouro Preto, de Santo Amaro was my father''s (Maximiano Pereira dos Santos) cousin."',
  'Besouro Mangangá era primo do pai de João Pequeno. O próprio João Pequeno afirmou: "Besouro Preto, de Santo Amaro era primo do meu pai (Maximiano Pereira dos Santos)."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno trained_under Barbosa
-- First formal training in Salvador (~1943)
-- Barbosa introduced him to Cobrinha Verde's roda
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CECA official; Velhos Mestres; Capoeira Connection',
  'João Pequeno''s capoeira learning "did not begin in an academy but with the carrier Barbosa from Largo Dois de Julho, who would take me to train and there was always a capoeira roda." Barbosa initiated João into capoeira and later took him to Cobrinha Verde''s roda in Chame-Chame.',
  'O aprendizado de capoeira de João Pequeno "não iniciou em academia e sim com o carregador Barbosa, do Largo Dois de Julho, que me levava pra treinar e sempre tinha roda de capoeira." Barbosa iniciou João na capoeira e depois o levou para a roda de Cobrinha Verde no Chame-Chame.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno'
  AND o.apelido = 'Barbosa' AND o.apelido_context = 'Cachoeira/Largo Dois de Julho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno trained_under Juvêncio
-- First capoeira teacher at Fazenda São Pedro, Mata de São João
-- Informal training ~1933-1943 while working on sugar cane plantation
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1933-01-01'::date, 'year'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CECA official; Portal Capoeira; Wikipedia PT; multiple sources',
  'João Pequeno''s first exposure to capoeira. At Fazenda São Pedro in Mata de São João, where he worked as a cattle herder for ten years (1933-1943), he met Juvêncio, a blacksmith and capoeirista, who introduced him to the art.',
  'Primeiro contato de João Pequeno com a capoeira. Na Fazenda São Pedro em Mata de São João, onde trabalhou como chamador de boi por dez anos (1933-1943), conheceu Juvêncio, um ferreiro e capoeirista, que o apresentou à arte.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno'
  AND o.apelido = 'Juvêncio' AND o.apelido_context = 'São Félix'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- João Pequeno associated_with João Grande - Fellow student of Pastinha, together they were the "two most learned students." Needs import first.
-- João Pequeno associated_with Gato Preto - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno associated_with Roberto Satanás - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno associated_with Gildo Alfinete - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno associated_with Camafeu de Oxossi - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno founded CECA (Centro Esportivo de Capoeira Angola) - Re-founded May 2, 1982 at Forte Santo Antônio. Group needs import first.
-- João Pequeno received_title_from Pastinha - Received mestre recognition. Exact date unknown.
