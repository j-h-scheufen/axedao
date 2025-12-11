-- ============================================================
-- STATEMENTS FOR: Vitor Agaú
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Vitor Agaú is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- NOTE: Onça Preta student_of Vitor Agaú is in statements/persons/onca-preta.sql (subject's file)

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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941 at Ladeira de Pedra in Gengibirra. Vitor H.D. is listed in Mestre Pastinha''s account of the mestres present when Amorzinho passed leadership to Pastinha."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account via jogodavidaweb.wordpress.com; capoeira.fandom.com/wiki/Mestre_Pastinha',
  E'Both were among the mestres present when civil guard Amorzinho passed leadership of the traditional roda at Gengibirra to Pastinha, founding CECA on February 23, 1941.',
  E'Ambos estavam entre os mestres presentes quando o guarda civil Amorzinho passou a liderança da roda tradicional no Gengibirra para Pastinha, fundando o CECA em 23 de fevereiro de 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles p
WHERE v.apelido = 'Vitor Agaú' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
