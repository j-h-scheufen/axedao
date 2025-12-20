-- ============================================================
-- STATEMENTS FOR: Decânio
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Decânio is the SUBJECT.
-- ============================================================

-- Decânio student_of Bimba (1938-1974)
-- Primary teacher-student relationship spanning 36 years
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Capoeira Connection, velhosmestres.com',
  'Decânio began training with Bimba in 1938 at age 16 while studying medicine. He kept this secret from his family initially. Bimba adopted him "like a son" from the first day. The relationship lasted 36 years until Bimba''s death on February 5, 1974.',
  'Decânio começou a treinar com Bimba em 1938 aos 16 anos enquanto estudava medicina. Ele manteve isso em segredo de sua família inicialmente. Bimba o adotou "como filho" desde o primeiro dia. O relacionamento durou 36 anos até a morte de Bimba em 5 de fevereiro de 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Decânio received_title_from Bimba (white handkerchief / mestre)
-- One of only four students to receive the highest graduation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "symbol": "lenço branco (white handkerchief)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira Connection, Bimba entity SQL, multiple sources',
  'One of only four students formally graduated to mestre level (white handkerchief) by Mestre Bimba during his lifetime. The others were Jair Moura, Miranda, and Edinho (the latter two now deceased).',
  'Um dos apenas quatro alunos formalmente graduados ao nível de mestre (lenço branco) por Mestre Bimba durante sua vida. Os outros foram Jair Moura, Miranda e Edinho (os dois últimos já falecidos).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Decânio associated_with João Pequeno (neighbor and friend)
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
  '2011-02-01'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Neighbors and close friends in Paripe, Salvador. Decânio served on CEDANZE Council of Honor (2003)."}'::jsonb,
  'verified'::genealogy.confidence,
  'Portal Capoeira, CEDANZE website',
  'Decânio lived near João Pequeno in the Paripe neighborhood of Salvador (Subúrbio Ferroviário). They were close friends. When CEDANZE was formalized in 2003, Decânio served on its Council of Honor.',
  'Decânio morava perto de João Pequeno no bairro de Paripe em Salvador (Subúrbio Ferroviário). Eram amigos próximos. Quando o CEDANZE foi formalizado em 2003, Decânio serviu em seu Conselho de Honra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Decânio associated_with Jair Moura (fellow white handkerchief recipient, training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '2011-02-01'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Fellow students of Mestre Bimba; both received lenço branco (white handkerchief); training companions at Bimba''s academy."}'::jsonb,
  'verified'::genealogy.confidence,
  'Bimba entity SQL, Jair Moura entity SQL, multiple sources',
  'Both Decânio and Jair Moura were among the only four students to receive the lenço branco from Mestre Bimba. They were training companions at Bimba''s academy. Association ended at Decânio''s death on February 1, 2011.',
  'Tanto Decânio quanto Jair Moura estavam entre os únicos quatro alunos a receber o lenço branco de Mestre Bimba. Eram companheiros de treino na academia de Bimba. A associação terminou com a morte de Decânio em 1º de fevereiro de 2011.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'Jair Moura'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Decânio associated_with Sisnando (Cisnando Lima) - co-pillars of Capoeira Regional
--   -> Sisnando pending import in persons-backlog.md
-- Decânio associated_with Miranda - fellow white handkerchief recipient
--   -> Miranda pending import in persons-backlog.md
-- Decânio associated_with Edinho - fellow white handkerchief recipient
--   -> Edinho pending import in persons-backlog.md
-- Decânio associated_with Tiburcinho - brought Tiburcinho to Bimba
--   -> Tiburcinho pending import in persons-backlog.md
-- Decânio associated_with Mestre Jean Pangolin - mentee relationship
--   -> Mestre Jean Pangolin NOT in backlog (contemporary figure, may not need import)
