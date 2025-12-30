-- ============================================================
-- STATEMENTS FOR: Peixinho
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Peixinho is the SUBJECT.
-- ============================================================

-- Peixinho trained_under Danadinho (1964)
-- First instructor when Peixinho arrived in Rio de Janeiro
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira.online, lalaue.com, raridadesdacapoeira',
  'Initial capoeira training when Peixinho arrived in Rio de Janeiro. Danadinho was from Brasília and had trained under Mestre Arraia.',
  'Treinamento inicial de capoeira quando Peixinho chegou ao Rio de Janeiro. Danadinho era de Brasília e havia treinado com Mestre Arraia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Peixinho' AND o.apelido = 'Danadinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Peixinho student_of Paulo Flores (1965 onward)
-- Primary teacher, Bahian who trained with Bimba and Pastinha
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira.online, senzalamidlands.co.uk, gruposenzala.org',
  'Primary teacher from 1965 onward. Paulo Flores was the leader who trained at Bimba''s and Pastinha''s academies in Salvador. They trained together on the terrace in Laranjeiras, forming the nucleus of Grupo Senzala.',
  'Professor principal de 1965 em diante. Paulo Flores era o líder que treinou nas academias de Bimba e Pastinha em Salvador. Treinaram juntos no terraço em Laranjeiras, formando o núcleo do Grupo Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Peixinho' AND o.apelido = 'Paulo Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Peixinho student_of Rafael Flores (1965 onward)
-- Co-teacher with his brother Paulo Flores
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira.online, lalaue.com, senzalamidlands.co.uk',
  'Rafael Flores and his brother Paulo trained Peixinho and the founding members of Grupo Senzala from 1965. Rafael had trained with Bimba and Pastinha in Salvador.',
  'Rafael Flores e seu irmão Paulo treinaram Peixinho e os membros fundadores do Grupo Senzala a partir de 1965. Rafael havia treinado com Bimba e Pastinha em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Peixinho' AND o.apelido = 'Rafael Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Peixinho co_founded Grupo Senzala (1965, formally 1966)
-- One of the founding cordas vermelhas
-- NOTE: Grupo Senzala not yet in dataset - PENDING IMPORT

-- Peixinho associated_with Gato (Senzala)
-- Fellow founding corda vermelha of Grupo Senzala
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Founding cordas vermelhas of Grupo Senzala; trained together from 1965; won Berimbau de Ouro 1967-1969"}'::jsonb,
  'verified'::genealogy.confidence,
  'gruposenzala.org, senzalamidlands.co.uk, senzala.co.uk',
  'Fellow founding red cord of Grupo Senzala. Both trained on the terrace in Laranjeiras from 1965 and were part of the team that won the Berimbau de Ouro three consecutive years.',
  'Corda vermelha fundador do Grupo Senzala. Ambos treinaram no terraço em Laranjeiras a partir de 1965 e fizeram parte da equipe que venceu o Berimbau de Ouro três anos consecutivos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Peixinho' AND o.apelido = 'Gato' AND o.apelido_context = 'Senzala'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or group)
-- ============================================================
-- Peixinho co_founded Grupo Senzala (1965/1966) - GROUP NOT YET IMPORTED
-- Peixinho associated_with Itamar (Senzala) - PERSON NOT YET IMPORTED
--   Context: Co-founders of Travessa Angrense academy (1974); trained together from 1965
-- Peixinho associated_with Gil Velho - PERSON NOT YET IMPORTED
--   Context: Founding corda vermelha of Grupo Senzala
-- Peixinho associated_with Garrincha (Senzala) - PERSON NOT YET IMPORTED
--   Context: Founding corda vermelha; organized First European Capoeira Encounter together (1987)
-- Peixinho associated_with Sorriso (Senzala) - PERSON NOT YET IMPORTED
--   Context: Founding corda vermelha; organized First European Capoeira Encounter together (1987)
-- Peixinho associated_with Preguiça (Senzala) - PERSON NOT YET IMPORTED
--   Context: Founding corda vermelha of Grupo Senzala
-- Peixinho associated_with Toni Vargas - PERSON NOT YET IMPORTED
--   Context: Organized First European Capoeira Encounter together (1987)

-- ============================================================
-- REVERSE RELATIONSHIPS (where Peixinho is the OBJECT)
-- These should be added to the SUBJECT's statement file:
-- ============================================================
-- Marrom student_of Peixinho → goes in marrom.sql (already imported)
-- Elias student_of Peixinho → goes in elias.sql (not yet imported)
-- Arruda student_of Peixinho → goes in arruda.sql (not yet imported)
-- Chão trained_under Arruda (who trained_under Peixinho) → goes in chao.sql
-- China student_of Peixinho → goes in china.sql (not yet imported)
