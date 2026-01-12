-- ============================================================
-- STATEMENTS FOR: Sabú
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Sabú is the SUBJECT.
-- ============================================================

-- Sabú student_of Caiçara (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'EFDeportes, CapoeiraHub, Revista UFG',
  E'Primary teacher relationship. Sabú "graduated" under Mestre Caiçara in Salvador. For Sabú, Caiçara represented "ethics, posture, perseverance" and "had confidence in what he was practicing and teaching". Caiçara''s repertoire became the foundation of Sabú''s teaching.',
  E'Relação de professor principal. Sabú "formou" com Mestre Caiçara em Salvador. Para Sabú, Caiçara representava "ética, postura, perseverança" e "tinha segurança no que praticava e ensinava". O repertório de Caiçara tornou-se a base do ensino de Sabú.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sabú' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Sabú trained_under Pastinha (brief training in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'EFDeportes',
  E'Trained "almost two years" with Mestre Pastinha in Salvador, learning the foundational philosophy of Capoeira Angola before completing his formal training under Caiçara.',
  E'Treinou "quase dois anos" com Mestre Pastinha em Salvador, aprendendo a filosofia fundamental da Capoeira Angola antes de completar seu treinamento formal com Caiçara.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sabú' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Sabú trained_under Noronha (training in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'EFDeportes',
  E'Trained with Mestre Noronha in Salvador, after Pastinha and before completing formal training under Caiçara. Noronha was the historian and co-founder of the Gengibirra center.',
  E'Treinou com Mestre Noronha em Salvador, após Pastinha e antes de completar treinamento formal com Caiçara. Noronha era o historiador e co-fundador do centro do Gengibirra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sabú' AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Sabú trained_under Leopardo Negro (Vale Tudo and Luta Livre training in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"discipline": "Vale Tudo, Luta Livre"}'::jsonb, 'verified'::genealogy.confidence,
  'EFDeportes',
  E'Trained Vale Tudo and Luta Livre (not capoeira) under Valdemar Santana (Leopardo Negro) in Salvador. These fighting skills provided financial resources to support Sabú''s capoeira work and led to his professional wrestling career.',
  E'Treinou Vale Tudo e Luta Livre (não capoeira) com Valdemar Santana (Leopardo Negro) em Salvador. Essas habilidades de luta forneceram recursos financeiros para apoiar o trabalho de Sabú com capoeira e levaram à sua carreira de luta profissional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sabú' AND o.apelido = 'Leopardo Negro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Sabú founded Terreiro de Capoeira Angola (Vila Redenção) - group needs import first
-- Sabú founded Federação Goiana de Capoeira - group needs import first
-- Sabú associated_with Osvaldo de Souza (Goiânia) - fellow pioneer in Goiânia; pending import
-- Sabú associated_with Bimba - knew Bimba personally in Goiânia 1972-1974; Bimba exists in dataset but relationship is contextual/contemporary not formal training
