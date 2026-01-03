-- ============================================================
-- STATEMENTS FOR: Dendê (merged identity)
-- Generated: 2026-01-03 (merged from dende-sfc.sql and dende-santo-amaro.sql)
-- ============================================================
-- Contains all relationships where Dendê is the SUBJECT.
-- This merged file combines relationships from both Santo Amaro
-- and São Francisco do Conde sources.
-- ============================================================

-- ============================================================
-- BESOURO'S COMPANIONS (associated_with - training peers)
-- NOTE: Source says Dendê "met up with" and "trained with" these
-- capoeiristas, indicating peers/contemporaries, NOT teacher-student.
-- ============================================================

-- Dendê associated_with Siri de Mangue (training companion)
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
  NULL, NULL,
  '{"association_context": "Training companions in the Recôncavo capoeira circle; both part of Besouro''s network of practitioners"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com): "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro"',
  'Dendê and Siri de Mangue were training companions in Besouro Mangangá''s circle. Sources describe them as contemporaries who "met up with" each other, not as teacher-student.',
  'Dendê e Siri de Mangue eram companheiros de treino no círculo de Besouro Mangangá. Fontes os descrevem como contemporâneos que "se encontravam", não como professor-aluno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Neco Canário Pardo (training companion)
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
  NULL, NULL,
  '{"association_context": "Training companions in the Recôncavo capoeira circle; both part of Besouro''s network of practitioners"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com): "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro"',
  'Dendê and Canário Pardo (Neco Canário Pardo) were training companions in Besouro Mangangá''s circle. Sources describe them as contemporaries who "met up with" each other, not as teacher-student.',
  'Dendê e Canário Pardo (Neco Canário Pardo) eram companheiros de treino no círculo de Besouro Mangangá. Fontes os descrevem como contemporâneos que "se encontravam", não como professor-aluno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- BESOURO'S CIRCLE (associated_with)
-- ============================================================

-- Dendê associated_with Besouro Mangangá
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
  '{"association_context": "Part of Besouro''s circle of companions in the Recôncavo; Besouro reportedly visited Dendê''s family home"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com)',
  'Dendê was part of Besouro Mangangá''s circle of companions in the Recôncavo. According to Mário Buscapé, Besouro visited their family home. Ended with Besouro''s death in 1924.',
  'Dendê fazia parte do círculo de companheiros de Besouro Mangangá no Recôncavo. Segundo Mário Buscapé, Besouro visitou a casa da família. Terminou com a morte de Besouro em 1924.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Dendê family_of Mário Buscapé (uncle)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "uncle", "family_side": "unknown"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com)',
  'Dendê was the uncle of Mário Buscapé. Also served as his first capoeira teacher from ~1942.',
  'Dendê era tio de Mário Buscapé. Também serviu como seu primeiro professor de capoeira a partir de ~1942.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê family_of José Bidel (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brother", "details": "Brothers who both practiced capoeira and trained with Besouro''s companions; both taught Mário Buscapé"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com)',
  'Dendê and José Bidel were brothers. Both practiced capoeira, trained with Besouro''s companions, and together taught Mário Buscapé.',
  'Dendê e José Bidel eram irmãos. Ambos praticavam capoeira, treinaram com os companheiros de Besouro e juntos ensinaram Mário Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- SANTO AMARO CONTEMPORARIES (associated_with)
-- All fellow teachers of Cobrinha Verde
-- ============================================================

-- Dendê associated_with Maitá
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde after Besouro''s death in 1924"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Dendê and Maitá were contemporaries in the Santo Amaro capoeira community. Both listed by Cobrinha Verde among the mestres from whom he learned.',
  'Dendê e Maitá eram contemporâneos na comunidade de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre os mestres com quem aprendeu.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Maitá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Licurí
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Licurí'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Joité
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Joité'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Gasolina
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
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde; Gasolina killed during Pedrito persecution"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Gasolina was killed during the Pedrito persecution of capoeiristas.',
  'Companheiro professor de capoeira de Santo Amaro. Gasolina foi morto durante a perseguição de Pedrito aos capoeiristas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Doze Homens
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde; Doze Homens was one of Besouro''s companions"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Doze Homens was one of Besouro Mangangá''s companions.',
  'Companheiro professor de capoeira de Santo Amaro. Doze Homens era um dos companheiros de Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Esperidião
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Esperidião'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Juvêncio Grosso
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Juvêncio Grosso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Espinho Remoso
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
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: The "Cobrinha Verde trained_under Dendê" statement
-- belongs in cobrinha-verde.sql (subject = Cobrinha Verde).
-- ============================================================
