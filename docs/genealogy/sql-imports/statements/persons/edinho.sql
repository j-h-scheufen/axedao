-- ============================================================
-- STATEMENTS FOR: Edinho
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Edinho is the SUBJECT.
-- ============================================================

-- Edinho student_of Bimba
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
  'Portal Capoeira; Cativeiro.de; Capoeira Connection lectures',
  E'Edinho was a student at Bimba''s Centro de Cultura Física e Luta Regional in Salvador. Start and end dates unknown. Edinho died before Bimba (1974).',
  E'Edinho foi aluno do Centro de Cultura Física e Luta Regional de Bimba em Salvador. Datas de início e fim desconhecidas. Edinho morreu antes de Bimba (1974).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edinho' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Edinho received_title_from Bimba (lenço branco / mestre)
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
  'Mestre Itapoan lecture (Capoeira Connection); Mestre Edinho quote (Portal Capoeira); Cativeiro.de',
  E'One of only four students to receive the lenço branco (white handkerchief) directly from Mestre Bimba''s hands—the highest honor in Capoeira Regional. The four recipients were: Decânio, Jair Moura, Miranda, and Edinho. Exact date unknown but before Bimba''s death (1974).',
  E'Um dos apenas quatro alunos a receber o lenço branco diretamente das mãos de Mestre Bimba—a maior honra na Capoeira Regional. Os quatro destinatários foram: Decânio, Jair Moura, Miranda e Edinho. Data exata desconhecida mas antes da morte de Bimba (1974).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edinho' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
