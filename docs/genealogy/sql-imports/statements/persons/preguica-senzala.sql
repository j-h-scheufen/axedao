-- ============================================================
-- STATEMENTS FOR: Preguiça (Senzala)
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Preguiça (Senzala) is the SUBJECT.
-- Uses apelido_context 'Senzala' to distinguish from Preguiça (Filhos de Bimba).
-- ============================================================

-- Preguiça student_of Bimba (trained at academy in Salvador before moving to Rio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/index.php/mestres/interview-mestre-preguica/; https://simplycapoeira.co.nz/index.php/about-capoeira/senzala/',
  E'Preguiça trained at Mestre Bimba''s academy in Salvador, Bahia, before moving to Rio de Janeiro in 1963. This formal training provided the Regional foundation for his later Senzala methodology.',
  E'Preguiça treinou na academia de Mestre Bimba em Salvador, Bahia, antes de mudar para o Rio de Janeiro em 1963. Este treinamento formal forneceu a base Regional para sua metodologia Senzala posterior.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Preguiça' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Preguiça associated_with Gato (Berimbau de Ouro partner 1967-1969)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Berimbau de Ouro competition partners; fellow Grupo Senzala founders"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/index.php/mestres/interview-mestre-preguica/; Portal Capoeira interview with Mestre Gato',
  E'Preguiça and Gato partnered to win the Berimbau de Ouro competition in 1967 and 1968, representing Grupo Senzala. In 1969, they were barred from competing as recognized masters and instead trained Mosquito and Borracha to win the third trophy. Both are founding red cords of Grupo Senzala.',
  E'Preguiça e Gato se juntaram para vencer a competição Berimbau de Ouro em 1967 e 1968, representando o Grupo Senzala. Em 1969, foram barrados de competir como mestres reconhecidos e em vez disso treinaram Mosquito e Borracha para ganhar o terceiro troféu. Ambos são cordões vermelhos fundadores do Grupo Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Preguiça' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Gato' AND o.apelido_context = 'Senzala'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Preguiça associated_with Paulo Flores (fellow Senzala founder)
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
  '{"association_context": "fellow Grupo Senzala founders; trained together in Rio"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/index.php/mestres/interview-mestre-preguica/',
  E'Preguiça and Paulo Flores were both founding members of Grupo Senzala in Rio de Janeiro. Paulo, who had trained at Mestre Bimba''s academy, was instrumental in establishing the early Senzala methodology.',
  E'Preguiça e Paulo Flores foram ambos membros fundadores do Grupo Senzala no Rio de Janeiro. Paulo, que havia treinado na academia de Mestre Bimba, foi fundamental para estabelecer a metodologia inicial do Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Preguiça' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Paulo Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Preguiça student_of Gilson Capoeira (childhood teacher in Periperí, Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-preguica/',
  E'Gilson Capoeira was Preguiça''s first capoeira teacher. In 1959, the homeless 12-year-old Waldenkolk Oliveira met Gilson in the Periperí neighborhood of Salvador while wandering the poor neighborhoods of Calçadas and Ribeira. Gilson taught him his first capoeira moves and introduced him to Mestre Bimba''s academy, transforming his life.',
  E'Gilson Capoeira foi o primeiro professor de capoeira de Preguiça. Em 1959, o menino de rua de 12 anos Waldenkolk Oliveira conheceu Gilson no bairro de Periperí em Salvador enquanto vagava pelos bairros pobres de Calçadas e Ribeira. Gilson ensinou seus primeiros movimentos de capoeira e o apresentou à academia de Mestre Bimba, transformando sua vida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Preguiça' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Gilson Capoeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Preguiça trained Mosquito (1969 Berimbau de Ouro) - needs Mosquito import first
-- Preguiça trained Borracha (1969 Berimbau de Ouro) - needs Borracha import first
-- Preguiça member_of Vem Camará (folkloric group, 1965) - needs Vem Camará import first
-- Preguiça co_founded Grupo Senzala - needs Grupo Senzala import first
-- Preguiça founded Omulu Guanabara Capoeira - needs Omulu Guanabara import first
-- Preguiça founded Omulu Capoeira (California) - needs Omulu Capoeira import first

-- NOTE: Nestor Capoeira student_of Preguiça should be in nestor-capoeira.sql (object is Preguiça)
