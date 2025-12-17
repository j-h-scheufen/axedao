-- ============================================================
-- STATEMENTS FOR: Dendê (São Francisco do Conde)
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Dendê (SFC) is the SUBJECT.
-- ============================================================

-- Dendê (SFC) trained_under Siri de Mangue
-- Per Mário Buscapé's testimony: "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro from Santo Amaro."
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê trained with Siri de Mangue, one of Besouro Mangangá''s companions in the Recôncavo. This training connection is documented through the testimony of his nephew Mário Buscapé.',
  'Dendê treinou com Siri de Mangue, um dos companheiros de Besouro Mangangá no Recôncavo. Esta conexão de treinamento é documentada através do testemunho de seu sobrinho Mário Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) trained_under Neco Canário Pardo
-- Per Mário Buscapé's testimony about his father and uncle training with Canário Pardo
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê trained with Canário Pardo (Neco Canário Pardo), another of Besouro Mangangá''s companions in the Recôncavo. This is documented through Mário Buscapé''s testimony.',
  'Dendê treinou com Canário Pardo (Neco Canário Pardo), outro dos companheiros de Besouro Mangangá no Recôncavo. Isso é documentado através do testemunho de Mário Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) associated_with Besouro Mangangá
-- According to Mário, Besouro visited their family home; Dendê was part of Besouro's circle of companions
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Dendê trained with Besouro''s companions and according to Mário Buscapé, Besouro visited their family home. Part of the Recôncavo capoeira circle."}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Besouro Mangangá visited Dendê''s family home (before Mário was born). Dendê was part of the capoeira circle in the Recôncavo that included Besouro and his companions. Ended with Besouro''s death in 1924.',
  'Besouro Mangangá visitou a casa da família de Dendê (antes de Mário nascer). Dendê fazia parte do círculo da capoeira no Recôncavo que incluía Besouro e seus companheiros. Terminou com a morte de Besouro em 1924.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) family_of Mário Buscapé
-- Uncle and first capoeira teacher
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "uncle", "family_side": "unknown"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was the uncle of Mário Buscapé. Sources do not specify whether he was brother to Mário''s father José Bidel or to Mário''s mother Maria dos Anjos dos Santos.',
  'Dendê era tio de Mário Buscapé. As fontes não especificam se ele era irmão do pai de Mário, José Bidel, ou da mãe de Mário, Maria dos Anjos dos Santos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) family_of José Bidel
-- Brothers who trained together with Besouro's companions and both taught Mário
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother", "details": "Brothers who both practiced capoeira and trained together with Besouro''s companions (Siri de Mangue, Canário Pardo); both taught capoeira to Mário Buscapé"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê and José Bidel were brothers. Both practiced capoeira and trained with companions of Besouro Mangangá. Together they taught capoeira to Mário Buscapé in improvised rodas in their family backyard.',
  'Dendê e José Bidel eram irmãos. Ambos praticavam capoeira e treinaram com companheiros de Besouro Mangangá. Juntos ensinaram capoeira a Mário Buscapé em rodas improvisadas no quintal da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
