-- ============================================================
-- STATEMENTS FOR: Miranda
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Miranda is the SUBJECT.
-- ============================================================

-- Miranda student_of Bimba (primary teacher relationship)
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Mestre Edinho depoimento (Portal Capoeira); Mestre Itapoan lecture (Capoeira Connection)',
  E'One of only four students to receive the white handkerchief (mestre graduation) directly from Mestre Bimba. Trained at Centro de Cultura Física e Luta Regional in Salvador. Exact training dates unknown.',
  E'Um dos apenas quatro alunos a receber o lenço branco (graduação de mestre) diretamente de Mestre Bimba. Treinou no Centro de Cultura Física e Luta Regional em Salvador. Datas exatas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Miranda' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Miranda received_title_from Bimba (white handkerchief / mestre)
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
  '{"title_grant": {"title": "mestre", "ceremony": "lenço branco ceremony"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Edinho depoimento (Portal Capoeira); Mestre Itapoan lecture (Capoeira Connection)',
  E'One of only four students to receive the white handkerchief (lenço branco) directly from Mestre Bimba during his lifetime. The others were Decânio, Jair Moura, and Edinho.',
  E'Um dos apenas quatro alunos a receber o lenço branco diretamente de Mestre Bimba durante sua vida. Os outros foram Decânio, Jair Moura e Edinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Miranda' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
