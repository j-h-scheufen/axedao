-- ============================================================
-- STATEMENTS FOR: Manezinho Camisa Preta
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Manezinho Camisa Preta is the subject.
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
  'person', mc.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Legendary Rio de Janeiro valentão who challenged Nascimento Grande to a fight to the death at Largo da Carioca. The battle was so intense it was described as transforming the plaza into the Peloponnese. Nascimento Grande killed him in this epic confrontation.", "pt": "Lendário valentão do Rio de Janeiro que desafiou Nascimento Grande para um combate de morte no Largo da Carioca. A batalha foi tão intensa que foi descrita como transformando a praça no Peloponeso. Nascimento Grande o matou neste confronto épico."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Multiple sources about Nascimento Grande including Casa do Engenho, Educando com Ginga, Grupo Capoeira Raça Negra'
FROM genealogy.person_profiles mc, genealogy.person_profiles ng
WHERE mc.apelido = 'Manezinho Camisa Preta' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
