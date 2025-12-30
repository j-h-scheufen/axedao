-- ============================================================
-- STATEMENTS FOR: Antonio Padroeiro
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Antonio Padroeiro is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', ap.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Dangerous adversary who attempted to kill Nascimento Grande. After being disarmed in their confrontation, Padroeiro was beaten to death. One of only two enemies explicitly named as Nascimento Grande''s most dangerous challengers (alongside Corre Hoje)"., "pt": "Adversário perigoso que tentou matar Nascimento Grande. Depois de ser desarmado em seu confronto, Padroeiro foi espancado até a morte. Um dos únicos dois inimigos explicitamente nomeados como os desafiantes mais perigosos de Nascimento Grande (junto com Corre Hoje)".}}'::jsonb,
  'likely'::genealogy.confidence,
  'Educando com Ginga: Nascimento Grande biography'
FROM genealogy.person_profiles ap, genealogy.person_profiles ng
WHERE ap.apelido = 'Antonio Padroeiro' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
