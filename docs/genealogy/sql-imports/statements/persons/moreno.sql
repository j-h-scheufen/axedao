-- ============================================================
-- STATEMENTS FOR: Moreno (Cobrinha Verde student)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Moreno is the SUBJECT.
--
-- CRITICAL NOTE ON NICKNAME AMBIGUITY:
-- "Moreno" was an extremely common nickname in Brazilian capoeira,
-- given to anyone with darker skin or hair. There were almost
-- certainly multiple "Morenos" in Salvador's capoeira scene.
-- Only the student_of relationship to Cobrinha Verde is documented
-- with reasonable confidence. Other relationships are uncertain.
-- ============================================================

-- Moreno student_of Cobrinha Verde
-- Source: Portuguese Wikipedia (Mestre Cobrinha Verde), capoeira.online
-- This is the ONLY relationship we can document with reasonable confidence.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown
  NULL, NULL, -- End date unknown
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'pt.wikipedia.org/wiki/Mestre_Cobrinha_Verde, capoeira.online/history/mestres/cobrinha-verde/',
  E'Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Gigante, and Eulampio. Exact dates of training unknown. Note: "Moreno" was an extremely common nickname - this may or may not be the same "Moreno" mentioned in other Salvador capoeira sources.',
  E'Listado como aluno de Cobrinha Verde junto com João Grande, João Pequeno, Gigante e Eulampio. Datas exatas de treinamento desconhecidas. Nota: "Moreno" era um apelido extremamente comum - este pode ou não ser o mesmo "Moreno" mencionado em outras fontes da capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moreno' AND s.apelido_context = 'Cobrinha Verde student'
  AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- RELATIONSHIPS NOT INCLUDED DUE TO UNCERTAINTY
-- ============================================================
-- The following relationships were considered but NOT included because
-- we cannot confirm the "Moreno" mentioned is the same person:
--
-- A "Moreno" appears in Gato Preto's 1999 interview as part of the
-- Itapuã bateria alongside João Pequeno, Albertino, and Valdomiro.
-- However, "Moreno" was such a common nickname that this could easily
-- be a different person, or even a transcription error from verbal interview.
--
-- NOT INCLUDED:
-- - Moreno associated_with João Pequeno (bateria companion) - UNCERTAIN IDENTITY
-- - Moreno associated_with Gato Preto (bateria companion) - UNCERTAIN IDENTITY
-- - Moreno associated_with Albertino (bateria companion) - UNCERTAIN IDENTITY
-- - Moreno associated_with Valdomiro (bateria companion) - UNCERTAIN IDENTITY
