-- ============================================================
-- STATEMENTS FOR: Celso do Engenho
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Celso do Engenho is the SUBJECT.
--
-- KEY RELATIONSHIPS:
-- - student_of Artur Emídio (confirmed by multiple sources)
-- - founded ACER (1973)
--
-- PENDING: Students João Marcos, Adilson Vitor, Sunil Ninjinho,
-- and Professor Bicudo are not yet in database.
-- ============================================================

-- Celso do Engenho student_of Artur Emídio
-- Confirmed by Wikipedia PT, capoeirahistory.com, velhosmestres.com
-- Training at Academia Artur Emídio in Bonsucesso, Rio de Janeiro
-- First saw roda de capoeira at Artur's academy in 1959
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/masters-in-rio-de-janeiro/, pt.wikipedia.org/wiki/Mestre_Celso',
  E'Celso trained at Artur Emídio''s academy in Bonsucesso alongside Leopoldina and Djalma Bandeira. He stated: "The first time I saw a capoeira roda was at Arthur Emídio''s academy in Praça Mauá, in 1959". A historic photo from the academy shows Celso standing with other students and mestres.',
  E'Celso treinou na academia de Artur Emídio em Bonsucesso junto com Leopoldina e Djalma Bandeira. Ele afirmou: "A primeira vez que eu vi uma roda de capoeira foi na academia de Arthur Emídio na Praça Mauá, em 1959". Uma foto histórica da academia mostra Celso em pé com outros alunos e mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Celso do Engenho' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Celso do Engenho founded ACER (1973)
--   - ACER (Associação de Capoeira Engenho da Rainha) not yet in groups table
--   - Add to groups-backlog.md for future import
--
-- STUDENTS (not yet in database):
-- - João Marcos - taught at Furgão club, Pilares (1969)
-- - Adilson Vitor - taught at Furgão club, Pilares (1969)
-- - Sunil Ninjinho - "one of the best students"
-- - Professor Bicudo - son, leads ACER UK
--
-- FAMILY:
-- - Luizão - nephew, capoeirista
--
-- ASSOCIATE:
-- - Cousin "Americano" - practiced tiririca at Ilha Grande
--   Note: May be same person as "Americano (Dois Rios)" already in DB
--   This relationship would be family_of if confirmed as same person
-- ============================================================
