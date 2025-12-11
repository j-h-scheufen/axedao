-- ============================================================
-- STATEMENTS FOR: Pirajé
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Pirajé is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, ng.id,
  jsonb_build_object(
    'association_context', jsonb_build_object(
      'en', 'Pirajé from Pará was among the most renowned fighters whose fame led him to covet challenging Nascimento Grande. Historical sources place him alongside other legendary valentões—Manezinho Camisa Preta, Pajeú, João Sabe Tudo—who sought to test themselves against Nascimento Grande''s undefeated reputation. The outcome of any actual challenge is not documented.',
      'pt', 'Pirajé do Pará estava entre os lutadores mais renomados cuja fama o levou a cobiçar desafiar Nascimento Grande. Fontes históricas o colocam ao lado de outros lendários valentões—Manezinho Camisa Preta, Pajeú, João Sabe Tudo—que buscaram se testar contra a reputação invicta de Nascimento Grande. O resultado de qualquer desafio real não está documentado.'
    )
  ),
  'uncertain'::genealogy.confidence,
  'Educando com Ginga; Grupo Capoeira Raça Negra',
  'Famous valentão from Pará who coveted challenging Nascimento Grande. No details of actual confrontation recorded. His fame indicates capoeira culture extended to northern Brazil.',
  'Famoso valentão do Pará que cobiçava desafiar Nascimento Grande. Nenhum detalhe de confronto real registrado. Sua fama indica que a cultura da capoeira se estendia ao norte do Brasil.'
FROM genealogy.person_profiles p, genealogy.person_profiles ng
WHERE p.apelido = 'Pirajé' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
