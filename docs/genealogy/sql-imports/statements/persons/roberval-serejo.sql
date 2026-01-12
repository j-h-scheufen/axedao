-- ============================================================
-- STATEMENTS FOR: Roberval Serejo
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Roberval Serejo is the SUBJECT.
-- ============================================================

-- Roberval Serejo student_of Artur Emídio
-- Training in Rio de Janeiro while serving in the Navy, late 1950s
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,  -- Late 1950s
  '1959-01-01'::date, 'year'::genealogy.date_precision,    -- Before founding Grupo Bantu
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'cev.org.br/biblioteca/capoeira-no-do-maranhao-uma-historia-memoria-contraditoria/; capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
  E'Trained with Artur Emídio in Rio de Janeiro while serving in the Navy as a diver. Serejo was part of the wave of students who learned from Artur Emídio''s influential academy in Bonsucesso. He later brought this Rio de Janeiro capoeira tradition to Maranhão.',
  E'Treinou com Artur Emídio no Rio de Janeiro enquanto servia na Marinha como escafandrista. Serejo fez parte da onda de alunos que aprenderam na influente academia de Artur Emídio em Bonsucesso. Depois levou essa tradição da capoeira carioca para o Maranhão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roberval Serejo' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FOUNDED RELATIONSHIPS
-- ============================================================

-- Roberval Serejo founded Grupo Bantu de Capoeira
-- Note: Group not yet in dataset - adding to pending section
-- This statement should be generated once the group is imported

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Roberval Serejo founded Grupo Bantu de Capoeira (1959) - needs group import first
--   First formally organized capoeira group in Maranhão
--   Also known as "Academia Bantu"
--   Located in São Pantaleão neighborhood, São Luís
--
-- Note: Students Patinho and Bezerra will have statements in their
-- own files once imported, with Roberval Serejo as the object.
