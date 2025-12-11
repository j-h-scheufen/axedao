-- ============================================================
-- STATEMENTS FOR: Tio Alípio
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Tio Alípio is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1888-01-01'::date, 'year'::genealogy.date_precision,
  'likely'::genealogy.confidence,
  'Velhos Mestres: "Em 1888, Alípio mudou para Trapiche de Baixo"',
  'After abolition in 1888, Tio Alípio moved to Trapiche de Baixo neighborhood where he lived and continued practicing/teaching capoeira.',
  'Após a abolição em 1888, Tio Alípio se mudou para o bairro de Trapiche de Baixo onde viveu e continuou praticando/ensinando capoeira.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Tio Alípio' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'teaches_at'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1888-01-01'::date, 'year'::genealogy.date_precision,
  'likely'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interview: "O mestre mais famoso dentro de Santo Amaro chamava-se Alípio"',
  'Tio Alípio was the primary capoeira teacher in Santo Amaro area, teaching in the sugarcane fields and Trapiche de Baixo neighborhood.',
  'Tio Alípio foi o principal professor de capoeira na região de Santo Amaro, ensinando nos canaviais e no bairro de Trapiche de Baixo.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Tio Alípio' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
