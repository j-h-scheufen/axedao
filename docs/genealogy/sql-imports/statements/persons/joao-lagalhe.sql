-- ============================================================
-- STATEMENTS FOR: João-Lagalhé
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where João-Lagalhé is the subject.
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
  '{"association_context": "João-Lagalhé killed César-Maneta on Praia do Peixe (Fish Beach) in 1870, continuing the vendetta cycle documented by Plácido de Abreu. This was shortly after César-Maneta had killed Alemãozinho".}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'João-Lagalhé was the killer of César-Maneta. Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta (killed by João-Lagalhé).',
  'João-Lagalhé foi o assassino de César-Maneta. Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta (morto por João-Lagalhé).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'César-Maneta'
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
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Alemãozinho was killed by César-Maneta; João-Lagalhé then killed César-Maneta in retaliation".}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence. João-Lagalhé killed César-Maneta, who had killed Alemãozinho.',
  'Parte da sequência de vingança documentada. João-Lagalhé matou César-Maneta, que havia matado Alemãozinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'Alemãozinho'
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
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Jacó was an earlier victim in the sequence; João-Lagalhé later killed César-Maneta".}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (killer).',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (assassino).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'Jacó'
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
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Pinta Preta''s death (Jan 7, 1870) triggered the cycle that eventually led to João-Lagalhé killing César-Maneta".}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (killer). Pinta Preta''s death initiated the cycle.',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (assassino). A morte de Pinta Preta iniciou o ciclo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'Pinta Preta da Lapa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
