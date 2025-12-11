-- ============================================================
-- STATEMENTS FOR: Gasolina
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Gasolina is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Onça Preta biography: "as a boy, he trained with Samuel, Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê, and many others who are now dead"',
  E'Onça Preta (b. 1909) listed Gasolina among his mestres. Gasolina was killed during Pedrito persecution (~1925).',
  E'Onça Preta (n. 1909) listou Gasolina entre seus mestres. Gasolina foi morto durante a perseguição de Pedrito (~1925).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde interview: "My true mestre was Besouro, but I learned from many mestres in Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina..." (Capoeira Online, La Laue, Capoeira Connection)',
  E'Cobrinha Verde learned from Gasolina as part of his training with multiple Santo Amaro mestres after Besouro''s death in 1924. Training ended with Gasolina''s death during Pedrito persecution.',
  E'Cobrinha Verde aprendeu com Gasolina como parte de seu treinamento com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Treinamento terminou com a morte de Gasolina durante perseguição de Pedrito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both active in Santo Amaro da Purificação during the same era; both part of the group of mestres who taught Cobrinha Verde"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony naming both as Santo Amaro mestres of his generation',
  'Both were part of the Santo Amaro capoeira community during Besouro''s active years. Gasolina was among the mestres who continued teaching after Besouro''s death.',
  'Ambos faziam parte da comunidade de capoeira de Santo Amaro durante os anos ativos de Besouro. Gasolina estava entre os mestres que continuaram ensinando após a morte de Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Both listed by Cobrinha Verde as Santo Amaro mestres from whom he learned capoeira"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens..."',
  'Both were part of the Santo Amaro capoeira teaching circle that trained Cobrinha Verde after Besouro''s death.',
  'Ambos faziam parte do círculo de ensino de capoeira de Santo Amaro que treinou Cobrinha Verde após a morte de Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Both listed as Santo Amaro mestres who taught Cobrinha Verde; both killed during Pedrito persecution (1920-1926)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony (Santo Amaro mestres); Onça Preta testimony (Pedrito victims)',
  'Both were Santo Amaro capoeiristas who taught Cobrinha Verde and were killed during Pedrito''s persecution of capoeira.',
  'Ambos eram capoeiristas de Santo Amaro que ensinaram Cobrinha Verde e foram mortos durante a perseguição de Pedrito à capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Both listed by Cobrinha Verde as Santo Amaro mestres from whom he learned capoeira"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony: "...Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo"',
  'Both were part of the Santo Amaro capoeira teaching circle that trained Cobrinha Verde.',
  'Ambos faziam parte do círculo de ensino de capoeira de Santo Amaro que treinou Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
