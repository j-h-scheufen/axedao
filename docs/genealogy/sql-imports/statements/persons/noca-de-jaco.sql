-- ============================================================
-- STATEMENTS FOR: Noca de Jacó
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Noca de Jacó is the subject.
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
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Training companions at Trapiche de Baixo capoeira rodas in Santo Amaro da Purificação; documented by Professor Leiteiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Besouro (velhosmestres.com/br/besouro)',
  'Companions who trained together in the memorable capoeira rodas at Trapiche de Baixo that "hypnotized anybody who would go by"',
  'Companheiros que treinavam juntos nas memoráveis rodas de capoeira no Trapiche de Baixo que "hipnotizavam qualquer um que passasse"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Noca de Jacó' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"membership_context": "Training companion at Trapiche de Baixo. Part of Besouro''s circle that met on Sundays and holidays".}'::jsonb,
  'verified'::genealogy.confidence,
  'José Brigido Dorneles Antunes (via Antonio Liberac); Velhos Mestres; Professor Leiteiro',
  'One of Besouro''s companions at Trapiche de Baixo alongside Paulo Barroquinha, Boca de Siri, Doze Homens, and Canário Pardo. They were a gang of capoeira resistance fighters who trained together on Sundays.',
  'Um dos companheiros de Besouro no Trapiche de Baixo ao lado de Paulo Barroquinha, Boca de Siri, Doze Homens e Canário Pardo. Eram uma turma de lutadores de resistência da capoeira que treinavam juntos aos domingos.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Noca de Jacó' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
