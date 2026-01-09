-- ============================================================
-- STATEMENTS FOR: Fernandinho
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Fernandinho is the SUBJECT.
-- ============================================================

-- Fernandinho trained_under Nilton (brother, first capoeira teacher in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'First capoeira training from older brother Nilton in Massaranduba, Salvador. Nilton had trained under Ninho, Pierrô, and Zeca do Uruguai.',
  E'Primeiro treinamento de capoeira com irmão mais velho Nilton em Massaranduba, Salvador. Nilton havia treinado com Ninho, Pierrô e Zeca do Uruguai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Nilton' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho student_of Caiçara (primary teacher in Rio de Janeiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Fernandinho became contra-mestre under Mestre Caiçara in Rio de Janeiro. Caiçara was known for training contra-mestres from his fish market in Jardim Cruzeiro.',
  E'Fernandinho tornou-se contra-mestre de Mestre Caiçara no Rio de Janeiro. Caiçara era conhecido por treinar contra-mestres de seu mercado de peixe no Jardim Cruzeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho received_title_from Caiçara (contra-mestre title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Received contra-mestre title from Mestre Caiçara. Diploma signed by Silvestre (Ferreirinha), fellow contra-mestre of Caiçara.',
  E'Recebeu título de contra-mestre de Mestre Caiçara. Diploma assinado por Silvestre (Ferreirinha), também contra-mestre de Caiçara.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho associated_with Silvestre (diploma signed by Silvestre)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "diploma_signatory"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Silvestre (Ferreirinha), as fellow contra-mestre of Caiçara, signed Fernandinho''s contra-mestre diploma.',
  E'Silvestre (Ferreirinha), como colega contra-mestre de Caiçara, assinou o diploma de contra-mestre de Fernandinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho family_of Nilton (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Younger brother of Nilton Moraes Paes. Both sons of the Moraes Paes family of Massaranduba.',
  E'Irmão mais novo de Nilton Moraes Paes. Ambos filhos da família Moraes Paes de Massaranduba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Nilton' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho family_of Cutica (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Younger brother of Cutica (Nelson Moraes Paes). Both sons of the Moraes Paes family of Massaranduba.',
  E'Irmão mais novo de Cutica (Nelson Moraes Paes). Ambos filhos da família Moraes Paes de Massaranduba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Cutica' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Fernandinho associated_with Dentinho - needs import first (Dentinho was Fernandinho's student; mentioned in esquiva.wordpress.com testimony)
-- Fernandinho associated_with Mestre Zé - needs import first (fellow contra-mestre of Caiçara)
-- Fernandinho associated_with Paulo Santo Amaro - needs import first (fellow contra-mestre of Caiçara)
-- Fernandinho associated_with Camisa - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Gado - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Macaco Preto - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Macaco Branco - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Touro - already in dataset as "Touro" but needs verification if same person
-- Fernandinho associated_with Nacional - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Medeiros - needs verification and import (contemporary in Rio)
