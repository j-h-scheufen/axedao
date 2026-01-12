-- ============================================================
-- STATEMENTS FOR: Ferreirinha de Santo Amaro
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Ferreirinha de Santo Amaro is the SUBJECT.
-- ============================================================

-- Ferreirinha de Santo Amaro student_of Antônio Asa Branca
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-42',
  E'Ferreirinha arrived in Santo Amaro at age 10 in 1935 and began learning capoeira with Antônio Asa Branca. "They say that Mestre Antônio Asa Branca played capoeira best when he was drunk." Ferreirinha recounted stories of Asa Branca, including the famous incident where he kicked a policeman onto a wall seven palms high.',
  E'Ferreirinha chegou em Santo Amaro aos 10 anos em 1935 e começou a aprender capoeira com Antônio Asa Branca. "Dizem que Mestre Antônio Asa Branca jogava capoeira melhor quando estava bêbado." Ferreirinha contava histórias de Asa Branca, incluindo o famoso incidente em que ele chutou um policial para cima de um muro de sete palmos de altura.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ferreirinha de Santo Amaro' AND COALESCE(s.apelido_context, '') = 'Santo Amaro'
  AND o.apelido = 'Antônio Asa Branca'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ferreirinha de Santo Amaro associated_with João Pequeno
-- They knew each other personally and were "from the same period"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporaries"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-42',
  E'Ferreirinha knew João Pequeno personally. According to M Ivan''s testimony at velhosmestres.com, Ferreirinha and João Pequeno were "from the same period" and knew each other. Both were founding members of ABCA in 1987.',
  E'Ferreirinha conheceu João Pequeno pessoalmente. De acordo com o testemunho de M Ivan no velhosmestres.com, Ferreirinha e João Pequeno eram "da mesma época" e se conheciam. Ambos foram membros fundadores da ABCA em 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ferreirinha de Santo Amaro' AND COALESCE(s.apelido_context, '') = 'Santo Amaro'
  AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ferreirinha de Santo Amaro associated_with Pastinha
-- They knew each other personally, "spent a lot of time" together, "same period"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporaries"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-42',
  E'Ferreirinha knew Pastinha personally and "spent a lot of time with Pastinha, in fact. They were from the same period." This testimony from M Ivan at velhosmestres.com indicates a significant relationship beyond mere acquaintance.',
  E'Ferreirinha conheceu Pastinha pessoalmente e "passou muito tempo com Pastinha, de fato. Eram da mesma época." Este testemunho de M Ivan no velhosmestres.com indica um relacionamento significativo além de mero conhecimento.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ferreirinha de Santo Amaro' AND COALESCE(s.apelido_context, '') = 'Santo Amaro'
  AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- RELATIONSHIPS WHERE FERREIRINHA IS THE OBJECT (stored in other files):
-- ============================================================
-- Ivan de Santo Amaro student_of Ferreirinha de Santo Amaro
--   - Training period: 1976-~1986 (approximately a decade from age 10)
--   - Stored in ivan-de-santo-amaro.sql
--
-- Macaco (Santo Amaro) student_of Ferreirinha de Santo Amaro
--   - Training began 1970s, became mestre by 1985
--   - Macaco needs import first (in backlog)
--   - Will be stored in macaco.sql (with apelido_context 'Santo Amaro')
