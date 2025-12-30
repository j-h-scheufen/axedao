-- ============================================================
-- STATEMENTS FOR: Nô
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Nô is the SUBJECT.
-- ============================================================

-- Nô student_of Cutica (primary teacher from 1952, awarded diploma Sept 18, 1964)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1964-09-18'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Cutica and his brother Nilton were Nô''s primary teachers in Massaranduba from 1952. They jointly awarded him his diploma on September 18, 1964, certifying him to teach.',
  E'Cutica e seu irmão Nilton foram os principais mestres de Nô em Massaranduba a partir de 1952. Eles conjuntamente concederam seu diploma em 18 de setembro de 1964, certificando-o para ensinar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Cutica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô received_title_from Cutica (diploma Sept 18, 1964)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-09-18'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "diploma", "ceremony": "joint with Nilton"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://nossa-tribo.com/mestre-no/',
  E'On September 18, 1964, Cutica and Nilton jointly awarded Nô his diploma, certifying him to teach. This was his formal recognition as a capoeira teacher.',
  E'Em 18 de setembro de 1964, Cutica e Nilton conjuntamente concederam a Nô seu diploma, certificando-o para ensinar. Este foi seu reconhecimento formal como professor de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Cutica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô trained_under Zeca do Uruguai (elder master, from 1952)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://nossa-tribo.com/mestre-no/',
  E'Mestre Zeca do Uruguai was one of the elder masters to whom Nilton and Cutica introduced young Norival in 1952. Zeca taught at a space beside his house in the Uruguai neighborhood.',
  E'Mestre Zeca do Uruguai era um dos mestres mais velhos a quem Nilton e Cutica apresentaram o jovem Norival em 1952. Zeca ensinava em um espaço ao lado de sua casa no bairro do Uruguai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô associated_with Waldemar (consecration at his roda ~1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Consecrated as capoeirista at Waldemar''s roda during Ribeira festa"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Around 1963, at the festa of Ribeira in Salvador, Nô was consecrated as a capoeirista in Mestre Waldemar''s roda. This was his public recognition by the great mestres of Salvador.',
  E'Por volta de 1963, na festa da Ribeira em Salvador, Nô foi consagrado como capoeirista na roda de Mestre Waldemar. Este foi seu reconhecimento público pelos grandes mestres de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô associated_with Traíra (witnessed consecration ~1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Witnessed Nô''s consecration at Ribeira festa roda"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Mestre Traíra was one of the renowned mestres present at Nô''s consecration at the Ribeira festa around 1963, where Nô demonstrated his worth.',
  E'Mestre Traíra era um dos mestres renomados presentes na consagração de Nô na festa da Ribeira por volta de 1963, onde Nô demonstrou seu valor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô associated_with Cobrinha Verde (witnessed consecration ~1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Witnessed Nô''s consecration at Ribeira festa roda"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Mestre Cobrinha Verde was one of the renowned mestres present at Nô''s consecration at the Ribeira festa around 1963, where Nô demonstrated his worth.',
  E'Mestre Cobrinha Verde era um dos mestres renomados presentes na consagração de Nô na festa da Ribeira por volta de 1963, onde Nô demonstrou seu valor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô associated_with Canjiquinha (witnessed consecration ~1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Witnessed Nô''s consecration at Ribeira festa roda"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Mestre Canjiquinha was one of the renowned mestres present at Nô''s consecration at the Ribeira festa around 1963, where Nô demonstrated his worth.',
  E'Mestre Canjiquinha era um dos mestres renomados presentes na consagração de Nô na festa da Ribeira por volta de 1963, onde Nô demonstrou seu valor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô trained_under Olegário (grandfather, first teacher from 1949)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-01-01'::date, 'year'::genealogy.date_precision,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Olegário was Nô''s maternal grandfather and his first capoeira teacher. From 1949 (when Nô was 4) until the family moved to Salvador in 1952, Olegário shared what he knew of capoeira with his grandson. Though not a formal mestre, he "opened the door to the world of capoeira" for Nô.',
  E'Olegário era o avô materno de Nô e seu primeiro professor de capoeira. De 1949 (quando Nô tinha 4 anos) até a família se mudar para Salvador em 1952, Olegário compartilhou o que sabia de capoeira com seu neto. Embora não fosse um mestre formal, ele "abriu a porta para o mundo da capoeira" para Nô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Olegário' AND o.apelido_context = 'Itaparica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô family_of Olegário (grandson-grandfather relationship)
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
  '{"relationship_type": "grandson (maternal)"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://capoeirapalmares.co.uk/mestre-no/',
  E'Nô is the maternal grandson of Olegário Veridiano Moreira. Nô lived with his maternal grandparents (Olegário and Joana Albertina Moreira) on Itaparica Island until approximately age 5-6.',
  E'Nô é o neto materno de Olegário Veridiano Moreira. Nô morou com seus avós maternos (Olegário e Joana Albertina Moreira) na Ilha de Itaparica até aproximadamente 5-6 anos de idade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Olegário' AND o.apelido_context = 'Itaparica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô trained_under Pierrô (elder master from 1952)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39, https://nossa-tribo.com/mestre-no/',
  E'Pierrô was one of the elder masters to whom Nilton and Cutica introduced young Norival in 1952. He taught at a space beside Mestre Zeca''s house in the Uruguai neighborhood. Pierrô, Zeca, and Nilton organized and commanded many capoeira angola rodas in the streets where Nô trained.',
  E'Pierrô era um dos mestres mais velhos a quem Nilton e Cutica apresentaram o jovem Norival em 1952. Ele ensinava em um espaço ao lado da casa de Mestre Zeca no bairro do Uruguai. Pierrô, Zeca e Nilton organizavam e comandavam muitas rodas de capoeira angola nas ruas onde Nô treinou.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Pierrô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô student_of Nilton (primary teacher from 1952, awarded diploma Sept 18, 1964)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1964-09-18'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://velhosmestres.com/en/featured-39',
  E'Nilton and his brother Cutica were Nô''s primary teachers in Massaranduba from 1952. Nilton, the firstborn of 19 siblings, introduced young Norival to the elder masters Pierrô and Zeca do Uruguai. In 1963, at the festa of Ribeira, Nilton told Nô to "buy the game" at Waldemar''s roda, leading to his consecration. They jointly awarded him his diploma on September 18, 1964.',
  E'Nilton e seu irmão Cutica foram os principais mestres de Nô em Massaranduba a partir de 1952. Nilton, o primogênito de 19 irmãos, apresentou o jovem Norival aos mestres mais velhos Pierrô e Zeca do Uruguai. Em 1963, na festa da Ribeira, Nilton disse a Nô para "comprar o jogo" na roda de Waldemar, levando à sua consagração. Eles conjuntamente concederam seu diploma em 18 de setembro de 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Nilton'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nô received_title_from Nilton (diploma Sept 18, 1964, joint with Cutica)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-09-18'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "diploma", "ceremony": "joint with Cutica"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-72, https://nossa-tribo.com/mestre-no/',
  E'On September 18, 1964, Nilton and Cutica jointly awarded Nô his diploma, certifying him to teach. The diploma is preserved in Mestre Nô''s personal archive.',
  E'Em 18 de setembro de 1964, Nilton e Cutica conjuntamente concederam a Nô seu diploma, certificando-o para ensinar. O diploma está preservado no arquivo pessoal de Mestre Nô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nô' AND o.apelido = 'Nilton'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Nô founded Academia de Capoeira Angola Retintos (November 1964)
--   NEEDS GROUP IMPORT

-- Nô founded Academia de Capoeira Angola Orixás da Bahia (1969)
--   NEEDS GROUP IMPORT

-- Nô founded Grupo de Capoeira Angola Palmares da Bahia / ABCCP (November 20, 1979)
--   NEEDS GROUP IMPORT

-- Nô leads ABCCP (Associação Brasileira Cultural de Capoeira Palmares)
--   NEEDS GROUP IMPORT
