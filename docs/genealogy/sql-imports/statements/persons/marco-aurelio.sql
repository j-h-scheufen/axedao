-- ============================================================
-- STATEMENTS FOR: Marco Aurélio
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Marco Aurélio is the SUBJECT.
-- ============================================================

-- Marco Aurélio student_of Moraes (~1970s-1982)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  '1982-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Africa Bantu Genève, Angola Ngolo',
  'Primary teacher. Began training ~July 1975 at Clube Gurilandia in Botafogo, Rio de Janeiro. Continued until Moraes returned to Salvador in 1982.',
  'Mestre principal. Começou a treinar ~julho de 1975 no Clube Gurilandia em Botafogo, Rio de Janeiro. Continuou até Moraes retornar a Salvador em 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio received_title_from Moraes (contra-mestre, December 16, 1978)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-12-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre", "ceremony": "Parque Lage ceremony", "location": "Parque Lage, Jardim Botânico, Rio de Janeiro"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève, Lalaue',
  'Promoted to contra-mestre on December 16, 1978 at Parque Lage ceremony. Braga, Neco, and Zé Carlos received mestre titles at same event. Mestres Camisa and Preguiça attended as guests.',
  'Promovido a contra-mestre em 16 de dezembro de 1978 na cerimônia do Parque Lage. Braga, Neco e Zé Carlos receberam títulos de mestre no mesmo evento. Mestres Camisa e Preguiça compareceram como convidados.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio received_title_from Moraes (mestre, ~1982)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "location": "Rio de Janeiro"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève, Lalaue',
  'Promoted to mestre by Moraes shortly before Moraes returned to Salvador in 1982.',
  'Promovido a mestre por Moraes pouco antes de Moraes retornar a Salvador em 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio associated_with Pastinha (met in Salvador, December 1975)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-12-28'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Met during December 1975 trip to Salvador with Moraes, Braga, Neco, Zé Carlos, Tete, and Amalha. Pastinha remembered Moraes as ''Pedrinho''. Group remained for January Bonfim festival."}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève',
  'Met Mestre Pastinha during trip to Salvador in December 1975.',
  'Conheceu Mestre Pastinha durante viagem a Salvador em dezembro de 1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio co_founded GCAP (October 5, 1980)
-- NOTE: GCAP not yet in database - add to groups backlog
-- INSERT INTO genealogy.statements ...
-- SELECT ... WHERE s.apelido = 'Marco Aurélio' AND o.name = 'Grupo de Capoeira Angola Pelourinho'

-- Marco Aurélio associated_with Braga (fellow student, GCAP co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow student of Moraes from ~July 1975; traveled to Salvador together December 1975; promoted together at Parque Lage December 16, 1978 (Braga to mestre, Marco Aurélio to contra-mestre); GCAP co-founders October 5, 1980"}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève',
  'Fellow student and GCAP co-founder. Trained together under Moraes from 1975.',
  'Colega aluno e co-fundador do GCAP. Treinaram juntos sob Moraes a partir de 1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Braga'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio associated_with Neco (fellow student, GCAP co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow student of Moraes from ~July 1975; traveled to Salvador together December 1975; promoted together at Parque Lage December 16, 1978 (Neco to mestre, Marco Aurélio to contra-mestre); GCAP co-founders October 5, 1980"}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève',
  'Fellow student and GCAP co-founder. Trained together under Moraes from 1975.',
  'Colega aluno e co-fundador do GCAP. Treinaram juntos sob Moraes a partir de 1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Neco'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio associated_with Zé Carlos (fellow student, GCAP co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow student of Moraes from ~July 1975; traveled to Salvador together December 1975; promoted together at Parque Lage December 16, 1978 (Zé Carlos to mestre, Marco Aurélio to contra-mestre); GCAP co-founders October 5, 1980"}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève',
  'Fellow student and GCAP co-founder. Trained together under Moraes from 1975.',
  'Colega aluno e co-fundador do GCAP. Treinaram juntos sob Moraes a partir de 1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Zé Carlos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Aurélio associated_with Cobra Mansa (fellow student, GCAP co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow student of Moraes from ~July 1975 (Peçanha); both contra-mestres at GCAP founding October 5, 1980"}'::jsonb,
  'verified'::genealogy.confidence,
  'Africa Bantu Genève',
  'Fellow student and GCAP co-founder. Both served as contra-mestres at GCAP founding.',
  'Colega aluno e co-fundador do GCAP. Ambos serviam como contra-mestres na fundação do GCAP.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Aurélio' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Marco Aurélio founded [capoeira angola group in Niterói] - group not yet documented
-- Marco Aurélio [teacher of] Armandinho - Armandinho exists in backlog but not yet imported
-- Marco Aurélio co_founded GCAP - GCAP exists in groups-backlog but not yet imported
