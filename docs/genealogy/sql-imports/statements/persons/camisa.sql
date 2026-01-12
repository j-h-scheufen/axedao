-- ============================================================
-- STATEMENTS FOR: Camisa
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Camisa is the SUBJECT.
-- ============================================================

-- Camisa trained_under Camisa Roxa (initial training, brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-connection.com, lalaue.com, abadarodos.wordpress.com',
  E'Camisa began learning capoeira at age 7 from his older brother Camisa Roxa at Fazenda Estiva. From 1963, Camisa Roxa taught the lessons he learned at Bimba''s academy to his younger siblings.',
  E'Camisa começou a aprender capoeira aos 7 anos com seu irmão mais velho Camisa Roxa na Fazenda Estiva. A partir de 1963, Camisa Roxa ensinava aos irmãos mais novos as lições que aprendia na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa student_of Bimba (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-connection.com, lalaue.com, capoeirahistory.com, Wikipedia',
  E'Joined Mestre Bimba''s academy in Salvador at age 12 (1967). Graduated as aluno formado at age 14 in 1969. Fourth family member to graduate from Bimba''s course. Graduation companions: Macarrão, Onça Negra, Torpedo.',
  E'Ingressou na academia de Mestre Bimba em Salvador aos 12 anos (1967). Formou-se como aluno formado aos 14 anos em 1969. Quarto membro da família a formar no curso de Bimba. Companheiros de formatura: Macarrão, Onça Negra, Torpedo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa family_of Camisa Roxa (brothers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brothers"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, Wikipedia, all sources',
  E'Youngest of four brothers who trained with Mestre Bimba. Camisa Roxa was eldest brother and first teacher.',
  E'Caçula de quatro irmãos que treinaram com Mestre Bimba. Camisa Roxa era irmão mais velho e primeiro professor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Note: Camisa's family connections to Ermival and Pedrinho are implicit
-- through their shared family_of relationship to Camisa Roxa.
-- See ermival.sql and pedrinho-carneiro.sql for their family_of statements.

-- Camisa associated_with Nenel (training companions at Bimba)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training companions at Mestre Bimba''s academy"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-connection.com interview',
  E'Trained together at Mestre Bimba''s academy in Salvador. Camisa mentioned Nenel among his training companions.',
  E'Treinaram juntos na academia de Mestre Bimba em Salvador. Camisa mencionou Nenel entre seus companheiros de treino.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Nenel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa associated_with Nestor Capoeira (film, Senzala)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "film Cordão de Ouro (1977), Grupo Senzala colleagues"}'::jsonb, 'verified'::genealogy.confidence,
  'IMDB, Portal Capoeira, multiple sources',
  E'Appeared together in film "Cordão de Ouro" (1977). Both were members of Grupo Senzala in Rio de Janeiro.',
  E'Apareceram juntos no filme "Cordão de Ouro" (1977). Ambos eram membros do Grupo Senzala no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Nestor Capoeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa associated_with Leopoldina (film)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "film Cordão de Ouro (1977)"}'::jsonb, 'verified'::genealogy.confidence,
  'IMDB, Portal Capoeira',
  E'Appeared together in film "Cordão de Ouro" (1977). Leopoldina played berimbau and sang while Camisa performed capoeira.',
  E'Apareceram juntos no filme "Cordão de Ouro" (1977). Leopoldina tocava berimbau e cantava enquanto Camisa jogava capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa associated_with Moraes (Spring Encounter 1992)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1992-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1992 Spring Encounter in Salzburg, Austria"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com',
  E'Participated together in the first Spring Encounter in Salzburg, Austria (1992), organized by Camisa Roxa. Event included Camisa, Moraes, and Mestre Santana.',
  E'Participaram juntos do primeiro Encontro de Primavera em Salzburg, Áustria (1992), organizado por Camisa Roxa. Evento incluiu Camisa, Moraes e Mestre Santana.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Camisa founded Abadá-Capoeira - group needs import first
-- Camisa member_of Grupo Senzala - group needs import first
-- Camisa member_of Olodum Maré - group needs import first
-- NOTE: Graduation companions (Macarrão, Onça Negra, Torpedo) documented in bio and notes.
-- No associated_with statements needed - context is clear from narrative.
-- Camisa associated_with Peixinho (Senzala) - film "Cordão de Ouro", Senzala colleague, in backlog
-- Camisa associated_with Santana (Abadá) - 1992 Spring Encounter, in backlog
