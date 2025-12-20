-- ============================================================
-- STATEMENTS FOR: Campanhão
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Campanhão is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Campanhão trained_under Prata Preta
-- Note: Source states Campanhão born "around 1900" but for a meaningful
-- training relationship with Prata Preta (deported Dec 1904), he was likely
-- born earlier (early-to-mid 1890s), making him a teenager when Prata Preta
-- was still active.
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
  E'Per Os Malandros lineage: Prata Preta → Campanhão. Source states Campanhão born "around 1900" but for a meaningful training relationship with Prata Preta (deported Dec 1904), he was likely born earlier (early-to-mid 1890s), making him a teenager when Prata Preta was still active. Single source; no corroboration found.',
  E'Conforme linhagem Os Malandros: Prata Preta → Campanhão. A fonte indica nascimento "por volta de 1900", mas para uma relação de treinamento significativa com Prata Preta (deportado dez. 1904), ele provavelmente nasceu antes (início/meados dos anos 1890), tornando-o adolescente quando Prata Preta ainda estava ativo. Fonte única; nenhuma corroboração encontrada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Campanhão' AND o.apelido = 'Prata Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
