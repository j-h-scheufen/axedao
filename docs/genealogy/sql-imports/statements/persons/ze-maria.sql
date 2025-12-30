-- ============================================================
-- STATEMENTS FOR: Zé Maria (José Maria da Silva)
-- Generated: 2025-12-29
-- Updated: 2025-12-29 (added Paulinho Salmon and Euclides Paes relationships)
-- ============================================================
-- Contains all relationships where Zé Maria is the SUBJECT.
-- ============================================================

-- Zé Maria trained_under Paulinho Salmon (1966)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://centrodomundo.org/mestre-zé-maría',
  'Trained under Paulo Salmon in Tijuca, Rio de Janeiro (1966). Salmon and Euclides Paes taught Zé Maria the famous "Pulo do Gato" technique. When both mestres discontinued training for work reasons, they authorized Zé Maria to continue teaching in their place.',
  'Treinou sob Paulo Salmon em Tijuca, Rio de Janeiro (1966). Salmon e Euclides Paes ensinaram a Zé Maria a famosa técnica do "Pulo do Gato." Quando ambos os mestres descontinuaram o treinamento por motivos de trabalho, autorizaram Zé Maria a continuar ensinando em seu lugar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Maria' AND o.apelido = 'Paulinho Salmon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Maria trained_under Euclides Paes (1966)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://centrodomundo.org/mestre-zé-maría',
  'Trained under Euclides Paes in Tijuca, Rio de Janeiro (1966). Euclides Paes and Paulinho Salmon taught Zé Maria the famous "Pulo do Gato" technique. When both mestres discontinued training for work reasons, they authorized Zé Maria to continue teaching in their place.',
  'Treinou sob Euclides Paes em Tijuca, Rio de Janeiro (1966). Euclides Paes e Paulinho Salmon ensinaram a Zé Maria a famosa técnica do "Pulo do Gato." Quando ambos os mestres descontinuaram o treinamento por motivos de trabalho, autorizaram Zé Maria a continuar ensinando em seu lugar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Maria' AND o.apelido = 'Euclides Paes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (anonymous teacher)
-- ============================================================

-- Zé Maria trained_under Unknown Bahian Military Man (1962-1964)
--   Cannot create statement - person identity unknown
--   Description: Old Bahian military man in Tijuca who did not call himself mestre
--   but was an excellent capoeirista in his youth

-- ============================================================
-- PENDING RELATIONSHIPS (groups not yet in dataset)
-- ============================================================

-- Zé Maria founded Grupo de Capoeira do Império da Tijuca - NEEDS GROUP IMPORT
--   Founded December 20, 1967 on Rua Conde de Bomfim, Tijuca, Rio de Janeiro
--   Later renamed: Associação Tijuca de Capoeira (1969), Grupo Zéma de Capoeira (1972)

-- Zé Maria founded Companhia ZEMA de Capoeira (Ecuador) - NEEDS GROUP IMPORT
--   Founded August 1993 in Ecuador
--   First capoeira group in Ecuador; led until 1996

-- Zé Maria cultural_pioneer_of Ecuador - could be added but requires country entity or properties
--   Pioneer of capoeira in Ecuador (August 1993)

-- ============================================================
-- NOTES
-- ============================================================
-- COMPLETED RELATIONSHIPS:
-- - Zé Maria trained_under Paulinho Salmon (1966) - DONE
-- - Zé Maria trained_under Euclides Paes (1966) - DONE
--
-- STILL PENDING:
-- 1. His first teacher is anonymous (old Bahian military man)
-- 2. His groups (Império da Tijuca, Grupo Zéma) are not yet in the dataset
--
-- Note: Canela's student_of Zé Maria statement is in canela.sql (ownership rule)
-- Note: Rui Henrique's student_of Zé Maria statement will go in rui-henrique.sql when imported
