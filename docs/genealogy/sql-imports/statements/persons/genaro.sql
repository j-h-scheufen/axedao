-- ============================================================
-- STATEMENTS FOR: Genaro
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Genaro is the SUBJECT.
-- ============================================================

-- Genaro student_of Artur Emídio
-- Primary training relationship from 1955 onwards
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-genaro-1934/',
  'Became Artur Emídio''s student after meeting him in Rio around 1953-1955. First presentation was at ACM Lapa in 1955.',
  'Tornou-se aluno de Artur Emídio após conhecê-lo no Rio por volta de 1953-1955. Primeira apresentação foi na ACM Lapa em 1955.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Genaro' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Genaro trained_under Paraná
-- Learned berimbau from Mestre Paraná at Artur Emídio's rodas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"training_focus": "berimbau"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-genaro-1934/',
  'Learned berimbau from Mestre Paraná, who often directed the bateria at Artur Emídio''s rodas. Genaro accompanied him and developed his berimbau skills under Paraná''s instruction.',
  'Aprendeu berimbau com Mestre Paraná, que frequentemente dirigia a bateria nas rodas de Artur Emídio. Genaro o acompanhava e desenvolveu suas habilidades de berimbau sob a instrução de Paraná.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Genaro' AND o.apelido = 'Paraná'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Genaro associated_with Djalma Bandeira
-- Fellow student of Artur Emídio, performed together
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Fellow students of Artur Emídio who performed together on TV Rio 1957"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-genaro-1934/',
  'Both were students of Mestre Artur Emídio. They performed together on TV Rio''s "A Noite dos Escravos" in 1957, invited by Haroldo Costa.',
  'Ambos foram alunos de Mestre Artur Emídio. Apresentaram-se juntos no programa "A Noite dos Escravos" da TV Rio em 1957, convidados por Haroldo Costa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Genaro' AND o.apelido = 'Djalma Bandeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Genaro associated_with Vilela - Fellow student of Artur Emídio, performed together on TV Rio 1957; Vilela in backlog
-- Genaro associated_with Polaco - Fellow guardian of Rio capoeira history; Polaco not in dataset
