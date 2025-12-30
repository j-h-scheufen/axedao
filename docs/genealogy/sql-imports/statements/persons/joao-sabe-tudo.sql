-- ============================================================
-- STATEMENTS FOR: João Sabe Tudo
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where João Sabe Tudo is the subject.
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
  'person', jst.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Fierce rival and paradoxical friend. João Sabe Tudo was described as one of Nascimento Grande''s most fierce adversaries and one of the most feared fighters of Recife. He constantly challenged Nascimento to scheduled fights with specific times and places. Their legendary battle near the Largo da Paz bridge moved through the streets until they entered Igreja do Carmo, where a vicar intervened and they shook hands, never fighting again. Despite their rivalry, they were friends who organized parties together at Hotel Sobrado Grande on Rua Camboa do Carmo in Santo Antônio"., "pt": "Rival feroz e amigo paradoxal. João Sabe Tudo foi descrito como um dos adversários mais ferozes de Nascimento Grande e um dos lutadores mais temidos do Recife. Constantemente desafiava Nascimento para lutas marcadas com hora e local específicos. Sua batalha lendária perto da ponte do Largo da Paz moveu-se pelas ruas até entrarem na Igreja do Carmo, onde um vigário interveio e eles apertaram as mãos, nunca mais lutando. Apesar da rivalidade, eram amigos que organizavam festas juntos no Hotel Sobrado Grande na Rua Camboa do Carmo em Santo Antônio".}}'::jsonb,
  'likely'::genealogy.confidence,
  'Educando com Ginga; Grupo Capoeira Raça Negra; Various historical accounts of Recife valentões'
FROM genealogy.person_profiles jst, genealogy.person_profiles ng
WHERE jst.apelido = 'João Sabe Tudo' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
