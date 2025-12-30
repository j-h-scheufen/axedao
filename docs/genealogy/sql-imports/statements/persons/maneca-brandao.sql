-- ============================================================
-- STATEMENTS FOR: Maneca Brandão
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Maneca Brandão is the SUBJECT.
-- ============================================================

-- Maneca Brandão student_of Bimba
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
  'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna, https://portalcapoeira.com/capoeira/publicacoes-e-artigos/itabuna-lancamento-do-livro-capoeira-de-luta-de-negro-a-exercicio-de-branco-no-cenario-grapiuna/',
  'Trained at Mestre Bimba''s Centro de Cultura Física Regional in Salvador. Zoião was his classmate. Multiple sources confirm: "Maneca Brandão, aluno do Mestre Bimba."',
  'Treinou no Centro de Cultura Física Regional de Mestre Bimba em Salvador. Zoião era seu colega de turma. Múltiplas fontes confirmam: "Maneca Brandão, aluno do Mestre Bimba."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maneca Brandão' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Maneca Brandão associated_with Sururú (street roda contemporaries in Itabuna)
-- NOTE: Sururú not yet in dataset - pending relationship
-- INSERT INTO genealogy.statements ...

-- Maneca Brandão associated_with Bigode de Arame (street roda contemporaries in Itabuna)
-- NOTE: Bigode de Arame not yet in dataset - pending relationship
-- INSERT INTO genealogy.statements ...

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Maneca Brandão associated_with Zoião - Zoião not yet in dataset
-- Classmates at Bimba's academy; Zoião helped with training at Major Dória academy

-- Maneca Brandão associated_with Sururú - Sururú not yet in dataset
-- Street roda contemporaries in Itabuna (1950s)

-- Maneca Brandão associated_with Bigode de Arame - not yet in dataset
-- Street roda contemporaries in Itabuna (1950s)

-- Maneca Brandão teaches_at Major Dória Academy - group not yet in dataset
-- Primary instructor from 1958

-- ============================================================
-- REVERSE RELATIONSHIPS (documented here, SQL in subject's file)
-- ============================================================

-- Suassuna student_of Maneca Brandão - RESOLVED in suassuna.sql
-- Primary teacher, ~1957-1958, Itabuna

-- Medicina trained_under Maneca Brandão - RESOLVED in medicina.sql
-- Trained at Major Dória's academy where Maneca Brandão was instructor
