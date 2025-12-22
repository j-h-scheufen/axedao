-- ============================================================
-- STATEMENTS FOR: Zuma
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Zuma is the SUBJECT.
-- ============================================================

-- Zuma associated_with Bimba (Bimba studied Zuma's methods; Bimba's 1936 challenges used Zuma's rules)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Bimba studied Zuma''s methods alongside Sinhozinho and Mario Aleixo; Bimba''s 1936 challenge matches were fought under Zuma''s boxing-like competition rules"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com; en.wikipedia.org/wiki/Manuel_dos_Reis_Machado',
  'Documented that Bimba studied methods of Sinhozinho, Mario Aleixo, and Zuma. Bimba''s famous 1936 challenges against Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, and José Custódio "Zé I" dos Santos were conducted under Zuma''s 1928 ruleset.',
  'Documentado que Bimba estudou métodos de Sinhozinho, Mario Aleixo e Zuma. Os famosos desafios de Bimba em 1936 contra Henrique Bahia, Vítor Benedito Lopes, Américo Ciência e José Custódio "Zé I" dos Santos foram conduzidos sob as regras de 1928 de Zuma.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zuma' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zuma associated_with Sinhozinho (fellow Rio de Janeiro capoeira intellectuals, both developed sport-focused capoeira)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Rio de Janeiro capoeira intellectuals who developed sport-focused variants; both worked to legitimize capoeira as national gymnastics"}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahistory.com; lalaue.com',
  'Both Zuma and Sinhozinho were part of the 1920s-1930s movement of white, middle-class Rio de Janeiro intellectuals seeking to destigmatize capoeira. Both developed combat-focused approaches stripped of music and ritual. Bimba is documented studying methods of both. Whether they directly collaborated is not documented.',
  'Tanto Zuma quanto Sinhozinho faziam parte do movimento dos anos 1920-1930 de intelectuais brancos de classe média do Rio de Janeiro buscando destigmatizar a capoeira. Ambos desenvolveram abordagens focadas em combate sem música e ritual. Bimba está documentado estudando métodos de ambos. Se colaboraram diretamente não está documentado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zuma' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zuma associated_with Mario Aleixo - Both part of 1920s Rio capoeira intellectual movement; Mario Aleixo taught at Gymnástico Português from 1920; Zuma may have trained there
-- Zuma associated_with Raul Pederneiras - Fellow capoeira advocate; journalist/cartoonist who wrote two-column article praising Zuma's manual in Jornal do Brasil
-- Zuma associated_with Mário Santos - Lawyer who wrote preface to 1928 manual and posed for 20 photographs as Zuma's opponent
