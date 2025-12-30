-- ============================================================
-- STATEMENTS FOR: César-Maneta
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where César-Maneta is the subject.
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "César-Maneta killed Alemãozinho near the old Teatro Lírico do Campo in 1870, as part of the vendetta cycle documented by Plácido de Abreu. César-Maneta was specifically described as ''famous'' by Abreu."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'César-Maneta was the killer of Alemãozinho. Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho (killed by César-Maneta) → César-Maneta (killed by João-Lagalhé).',
  'César-Maneta foi o assassino de Alemãozinho. Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho (morto por César-Maneta) → César-Maneta (morto por João-Lagalhé).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'César-Maneta' AND o.apelido = 'Alemãozinho'
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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Jacó was killed before Alemãozinho; César-Maneta killed Alemãozinho and was later killed himself."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta.',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'César-Maneta' AND o.apelido = 'Jacó'
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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Pinta Preta''s death (Jan 7, 1870) triggered the cycle that eventually involved César-Maneta as both killer (of Alemãozinho) and victim (of João-Lagalhé)."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta. Pinta Preta''s death initiated the cycle.',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta. A morte de Pinta Preta iniciou o ciclo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'César-Maneta' AND o.apelido = 'Pinta Preta da Lapa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
