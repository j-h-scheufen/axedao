-- ============================================================
-- STATEMENTS FOR: Quinzinho
-- Migrated: 2025-12-11
-- Updated: 2025-12-20 - Added trained_under Campanhão relationship
-- ============================================================
-- This file contains all relationships where Quinzinho is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Quinzinho trained_under Campanhão
-- Per Os Malandros de Mestre Touro lineage documentation
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
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'uncertain'::genealogy.confidence,
  'Os Malandros de Mestre Touro lineage (malandros-touro.com)',
  E'Per Os Malandros lineage: Campanhão → Quinzinho. Quinzinho (b. ~1925) would have trained under Campanhão (b. around 1900, likely earlier) in the 1940s. Single source; no corroboration found in other capoeira historical sources.',
  E'Conforme linhagem Os Malandros: Campanhão → Quinzinho. Quinzinho (n. ~1925) teria treinado com Campanhão (n. por volta de 1900, provavelmente antes) nos anos 1940. Fonte única; nenhuma corroboração encontrada em outras fontes históricas de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quinzinho' AND o.apelido = 'Campanhão'
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both part of the premodern Rio capoeira/malandro generation that transmitted capoeira to the modern era; described together as the best-known figures of this lineage"}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahistory.com: "Madame Satã (1900–76) and Quinzinho (the teacher of Leopoldina) are the best known of this generation"',
  'Both were part of the premodern Rio malandro generation. Sete Coroas died in 1923, when Quinzinho would have been a child (~4 years old), so they were not direct peers, but are grouped together as representing the old carioca capoeira tradition.',
  'Ambos faziam parte da geração pré-moderna de malandros do Rio. Sete Coroas morreu em 1923, quando Quinzinho seria uma criança (~4 anos), então não eram pares diretos, mas são agrupados como representantes da antiga tradição de capoeira carioca.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quinzinho' AND o.apelido = 'Sete Coroas'
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the premodern Rio capoeira generation that bridged old malandro traditions to modern capoeira; documented as the best-known figures who transmitted something to the next generation"}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahistory.com: "Madame Satã (1900–76) and Quinzinho (the teacher of Leopoldina) are the best known of this generation, which still managed to transmit something to modern capoeira"',
  'Quinzinho (b. ~1927) was younger than Madame Satã (b. 1900) by about 27 years, but both were active in Rio''s malandro world during the late 1940s-early 1950s. They represent the bridge between old carioca capoeira and modern traditions.',
  'Quinzinho (n. ~1927) era mais novo que Madame Satã (n. 1900) por cerca de 27 anos, mas ambos estavam ativos no mundo malandro do Rio no final dos anos 1940 e início dos 1950. Representam a ponte entre a velha capoeira carioca e as tradições modernas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quinzinho' AND o.apelido = 'Madame Satã'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
