-- ============================================================
-- STATEMENTS FOR: Marcos (Marco Ayala)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Marcos is the SUBJECT.
-- ============================================================

-- Marcos student_of Zé Maria (1993-1996)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1993-08-01'::date, 'month'::genealogy.date_precision,
  '1996-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeiraecuador.com/historia/',
  'Primary teacher. Started capoeira training in 1993 when Zé Maria founded the first capoeira school in Ecuador (Companhia ZEMA de Capoeira). When Zé Maria returned to Brazil in 1996, he entrusted the school to Marco Ayala, then a student at Escuela Politécnica Nacional. This training relationship transformed Marco from student to successor.',
  'Professor principal. Começou o treinamento de capoeira em 1993 quando Zé Maria fundou a primeira escola de capoeira no Equador (Companhia ZEMA de Capoeira). Quando Zé Maria retornou ao Brasil em 1996, ele confiou a escola a Marco Ayala, então estudante na Escuela Politécnica Nacional. Esta relação de treinamento transformou Marco de aluno a sucessor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marcos' AND o.apelido = 'Zé Maria'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marcos received_title_from Zé Maria (November 2011 - Mestre title)
-- Note: Who exactly conferred the mestre title is not explicitly stated in sources,
-- but as Zé Maria was his primary teacher and the lineage head, he is the most likely source.
-- However, since this is inferred rather than explicitly confirmed, marking as 'likely' confidence.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2011-11-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeiraecuador.com/historia/',
  'Became the first Ecuadorian Mestre of Capoeira in November 2011, after nearly two decades of dedication. While Zé Maria is the logical source as his primary teacher and lineage head, the exact ceremony details are not documented.',
  'Tornou-se o primeiro Mestre de Capoeira equatoriano em novembro de 2011, após quase duas décadas de dedicação. Embora Zé Maria seja a fonte lógica como seu professor principal e líder da linhagem, os detalhes exatos da cerimônia não estão documentados.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marcos' AND o.apelido = 'Zé Maria'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (groups not yet in dataset)
-- ============================================================

-- Marcos leads Grupo ZEMA de Capoeira Ecuador - NEEDS GROUP IMPORT
--   Led from 1996 when Zé Maria returned to Brazil
--   Group renamed from Companhia ZEMA in 2004

-- Marcos founded Rumizumbi - NEEDS GROUP IMPORT
--   Founded early 2012 after receiving mestre title (November 2011)
--   Name fuses Rumiñahui (Incan general) and Zumbí (Palmares leader)

-- ============================================================
-- NOTES
-- ============================================================
-- COMPLETED RELATIONSHIPS:
-- - Marcos student_of Zé Maria (1993-1996) - DONE
-- - Marcos received_title_from Zé Maria (November 2011) - DONE (marked as 'likely')
--
-- STILL PENDING:
-- 1. His groups (Grupo Zema Ecuador, Rumizumbi) are not yet in the dataset
--
-- Note: Perninha's student_of Marcos statement is in perninha.sql (ownership rule)
-- Note: JuanG, Manos, Poncho statements will go in their respective files when imported
