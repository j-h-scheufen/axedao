-- ============================================================
-- STATEMENTS FOR: Baleado
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Baleado is the SUBJECT.
-- ============================================================

-- Baleado co_founded Filhos de Angola (Rio 1960)
-- NOTE: Group entity must exist first. When genealogy.group_profiles
-- is populated with Filhos de Angola, this statement can be added.
-- The group should have name_context 'Rio 1960' to distinguish from
-- GCFA founded 1984 in Salvador.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Baleado co_founded Filhos de Angola (Rio 1960) - group import pending
-- Baleado associated_with Mucungê - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Dois de Ouro - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Onça Preta - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Imagem do Cão - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Roque - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Inglês - context: 'Roda da Central participant'
-- Baleado associated_with Vavá Moleque - context: 'Roda da Central participant'
-- Baleado associated_with Reginaldo - context: 'Roda da Central participant'
-- Baleado associated_with Paraná - context: 'Roda da Central participant'
-- Baleado associated_with Lamartine - context: 'Roda da Central participant'
-- Baleado associated_with Seu Menezes - context: 'Roda da Central participant'

-- ============================================================
-- RELATIONSHIPS WITH EXISTING ENTITIES
-- ============================================================
-- The following co-founders already exist in the dataset:
-- Onça Preta, Mucungê, Dois de Ouro, Roque

-- Baleado associated_with Onça Preta (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who migrated to Rio in the 1950s and participated in the Roda da Central.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que migraram para o Rio nos anos 1950 e participavam da Roda da Central.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baleado associated_with Mucungê (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who participated in the Roda da Central.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que participavam da Roda da Central.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Mucungê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baleado associated_with Dois de Ouro (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who participated in the Roda da Central.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que participavam da Roda da Central.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Dois de Ouro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baleado associated_with Roque (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who participated in the Roda da Central. Roque honored Baleado''s name on his academy banner in São João de Meriti.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que participavam da Roda da Central. Roque homenageou o nome de Baleado no banner de sua academia em São João de Meriti.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
