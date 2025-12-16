-- ============================================================
-- STATEMENTS FOR: Paulo Gomes
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Paulo Gomes is the SUBJECT.
-- ============================================================

-- Paulo Gomes student_of Artur Emídio
-- Started training in Rio de Janeiro in 1962
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/, velhosmestres.com/br/destaques-55',
  E'Paulo Gomes learned capoeira from Artur Emídio at his academy in Bonsucesso, Rio de Janeiro. Trained alongside Leopoldina, Celso do Engenho, and Djalma Bandeira. Graduated as mestre at this academy.',
  E'Paulo Gomes aprendeu capoeira com Artur Emídio em sua academia em Bonsucesso, Rio de Janeiro. Treinou ao lado de Leopoldina, Celso do Engenho e Djalma Bandeira. Formou-se mestre nesta academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Gomes' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Gomes associated_with Leopoldina (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training companion at Artur Emídio''s academy"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/',
  E'Trained together at Mestre Artur Emídio''s academy in Bonsucesso, Rio de Janeiro.',
  E'Treinaram juntos na academia de Mestre Artur Emídio em Bonsucesso, Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Gomes' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Gomes associated_with Djalma Bandeira (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training companion at Artur Emídio''s academy"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/',
  E'Trained together at Mestre Artur Emídio''s academy in Bonsucesso, Rio de Janeiro.',
  E'Treinaram juntos na academia de Mestre Artur Emídio em Bonsucesso, Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Gomes' AND o.apelido = 'Djalma Bandeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Paulo Gomes associated_with Celso do Engenho - training companion; Celso pending in backlog
-- Paulo Gomes founded Ilha de Maré - group not yet in dataset
-- Paulo Gomes founded ABRACAP - group not yet in dataset
-- Paulo Gomes taught Valdir Sales - person needs backlog entry
-- Paulo Gomes taught Josias da Silva - person in backlog (Cobra Mansa import)
-- Paulo Gomes taught Maria Pandeiro - person needs backlog entry
-- Paulo Gomes taught Jorginho (Jorge Machado Silva) - person needs backlog entry
-- Paulo Gomes taught Fernandão - person needs backlog entry
