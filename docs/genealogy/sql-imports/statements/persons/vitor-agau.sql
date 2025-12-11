-- ============================================================
-- STATEMENTS FOR: Vitor Agaú
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Vitor Agaú is the subject.
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
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta testimony, velhosmestres.com/br/destaques-34; O Dia newspaper 1972',
  E'Onça Preta (b. 1909) stated: "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... I had not one, but many mestres." Training was through public rodas rather than formal apprenticeship.',
  E'Onça Preta (n. 1909) afirmou: "Garoto ainda, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... Não tive um, mas muitos mestres." O treino era através de rodas públicas em vez de aprendizado formal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Vitor Agaú'
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
