-- ============================================================
-- STATEMENTS FOR: Môa do Katendê
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Môa do Katendê is the SUBJECT.
-- ============================================================

-- Môa do Katendê student_of Bobô (primary teacher, 1962-1987)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Began training at age 8 (1962) at Academia de Capoeira Angola Cinco Estrelas. Graduated as Mestre Bobô''s first mestre on April 5, 1987, alongside Lua de Bobó.',
  E'Começou a treinar aos 8 anos (1962) na Academia de Capoeira Angola Cinco Estrelas. Formado como primeiro mestre de Mestre Bobô em 5 de abril de 1987, ao lado de Lua de Bobó.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê received_title_from Bobô (mestre title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "Graduation ceremony at Academia de Capoeira Angola Cinco Estrelas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Received mestre title from Mestre Bobô on April 5, 1987. Evaluation panel included Mestres João Grande, João Pequeno, Vermelho, and Dona Romélia (Mestre Pastinha''s wife).',
  E'Recebeu título de mestre de Mestre Bobô em 5 de abril de 1987. Banca avaliadora incluiu Mestres João Grande, João Pequeno, Vermelho e Dona Romélia (esposa de Mestre Pastinha).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Lua de Bobó (fellow first-generation mestres)
-- NOTE: Lua de Bobó is not yet in the dataset - will be added to backlog
-- INSERT statement prepared for when Lua de Bobó is imported:
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'associated_with'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   '1962-01-01'::date, 'year'::genealogy.date_precision,
--   '{"association_context": {"en": "Fellow students of Mestre Bobô; both graduated as first mestres together on April 5, 1987", "pt": "Colegas alunos de Mestre Bobô; ambos formados como primeiros mestres juntos em 5 de abril de 1987"}}'::jsonb,
--   'verified'::genealogy.confidence,
--   'https://velhosmestres.com/en/featured-43',
--   E'Training companions at Academia de Capoeira Angola Cinco Estrelas under Mestre Bobô. Both graduated as Bobô''s first two mestres on April 5, 1987.',
--   E'Companheiros de treino na Academia de Capoeira Angola Cinco Estrelas sob Mestre Bobô. Ambos formados como os dois primeiros mestres de Bobô em 5 de abril de 1987.'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Lua de Bobó';

-- Môa do Katendê associated_with João Grande (evaluation panel member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "João Grande was on the evaluation panel that graduated Môa as mestre on April 5, 1987", "pt": "João Grande estava na banca avaliadora que formou Môa como mestre em 5 de abril de 1987"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://dicionariompb.com.br/artista/moa-do-katende/',
  E'João Grande was part of the evaluation panel (alongside João Pequeno, Vermelho, and Dona Romélia) that graduated Môa do Katendê as mestre on April 5, 1987.',
  E'João Grande fez parte da banca avaliadora (junto com João Pequeno, Vermelho e Dona Romélia) que formou Môa do Katendê como mestre em 5 de abril de 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with João Pequeno (evaluation panel member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "João Pequeno was on the evaluation panel that graduated Môa as mestre on April 5, 1987", "pt": "João Pequeno estava na banca avaliadora que formou Môa como mestre em 5 de abril de 1987"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://dicionariompb.com.br/artista/moa-do-katende/',
  E'João Pequeno was part of the evaluation panel (alongside João Grande, Vermelho, and Dona Romélia) that graduated Môa do Katendê as mestre on April 5, 1987.',
  E'João Pequeno fez parte da banca avaliadora (junto com João Grande, Vermelho e Dona Romélia) que formou Môa do Katendê como mestre em 5 de abril de 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Pelé da Bomba (ABCA contemporaries, photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "ABCA contemporaries; photographed together at rodas and ABCA events", "pt": "Contemporâneos na ABCA; fotografados juntos em rodas e eventos da ABCA"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both served in ABCA leadership (Môa as Cultural Director 1998-2002, President 2003; Pelé da Bomba as President). Photographed together at various events.',
  E'Ambos serviram na liderança da ABCA (Môa como Diretor Cultural 1998-2002, Presidente 2003; Pelé da Bomba como Presidente). Fotografados juntos em vários eventos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Pelé da Bomba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Boa Gente (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "Contemporary angoleiros photographed together at rodas", "pt": "Angoleiros contemporâneos fotografados juntos em rodas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both were active angoleiros in Salvador''s ABCA community. Photographed together at rodas documented on velhosmestres.com.',
  E'Ambos eram angoleiros ativos na comunidade da ABCA em Salvador. Fotografados juntos em rodas documentadas em velhosmestres.com.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Gildo Alfinete (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "Contemporary angoleiros photographed together at rodas", "pt": "Angoleiros contemporâneos fotografados juntos em rodas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both were active angoleiros in Salvador. Photographed together at rodas documented on velhosmestres.com.',
  E'Ambos eram angoleiros ativos em Salvador. Fotografados juntos em rodas documentadas em velhosmestres.com.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Bigodinho (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "Contemporary angoleiros photographed together at rodas", "pt": "Angoleiros contemporâneos fotografados juntos em rodas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both were active angoleiros in Salvador. Photographed together at rodas documented on velhosmestres.com.',
  E'Ambos eram angoleiros ativos em Salvador. Fotografados juntos em rodas documentadas em velhosmestres.com.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PERSON-TO-GROUP RELATIONSHIPS
-- ============================================================

-- NOTE: Academia de Capoeira Angola Cinco Estrelas is not yet imported as a group.
-- When imported, add:
-- Môa do Katendê member_of Academia de Capoeira Angola Cinco Estrelas (1962-present)
-- Môa do Katendê teaches_at Academia de Capoeira Angola Cinco Estrelas (1987-2018)

-- NOTE: ABCA is not yet imported as a group.
-- When imported, add:
-- Môa do Katendê leads ABCA (2003) with properties for president role
-- Môa do Katendê associated_with ABCA (1997-2003) with cultural director role

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Môa do Katendê associated_with Lua de Bobó - needs import first (fellow first-generation mestre)
-- Môa do Katendê associated_with Vermelho 27 - evaluation panel; already exists but need to verify apelido matches
-- Môa do Katendê associated_with Romélia - Pastinha's wife on evaluation panel; needs import first
-- Môa do Katendê associated_with Mala - photographed together; needs import first
-- Môa do Katendê member_of Academia de Capoeira Angola Cinco Estrelas - group needs import first
-- Môa do Katendê teaches_at Academia de Capoeira Angola Cinco Estrelas - group needs import first
-- Môa do Katendê founded Afoxé Badauê (1978) - group needs import first
-- Môa do Katendê founded Afoxé Amigos do Katendê (1994/1995) - group needs import first
-- Môa do Katendê co_founded Agremiação Gunga (1999/2003) - group needs import first
-- Môa do Katendê leads ABCA (2003) - group needs import first
