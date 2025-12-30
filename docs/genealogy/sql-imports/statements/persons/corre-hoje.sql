-- ============================================================
-- STATEMENTS FOR: Corre Hoje
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Corre Hoje is the subject.
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
  'person', ch.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Enemy of Nascimento Grande. Organized an attack with seven men to kill him but was killed in the attempt. Sources conflict on whether he was shot by Nascimento Grande in self-defense or struck by a stray bullet intended for Nascimento"., "pt": "Inimigo de Nascimento Grande. Organizou um ataque com sete homens para matá-lo mas foi morto na tentativa. Fontes conflitam se foi baleado por Nascimento Grande em legítima defesa ou atingido por uma bala perdida destinada a Nascimento".}}'::jsonb,
  'likely'::genealogy.confidence,
  'Educando com Ginga (https://educando-com-ginga.webnode.page/), Mestre Brizola (https://mestrebrizola.webnode.com.br/)'
FROM genealogy.person_profiles ch, genealogy.person_profiles ng
WHERE ch.apelido = 'Corre Hoje' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
