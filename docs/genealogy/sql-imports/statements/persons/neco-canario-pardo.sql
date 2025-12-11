-- ============================================================
-- STATEMENTS FOR: Neco Canário Pardo
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Neco Canário Pardo is the subject.
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
  'person', ncp.id,
  'associated_with',
  'person', besouro.id,
  '{"association_context": {"en": "Both were companions at Trapiche de Baixo in Santo Amaro da Purificação. They were part of the legendary capoeira circle that included Paulo Barroquinha, Boca de Siri, Noca de Jacó, and Doze Homens. Professor Leiteiro documented they ''were his companions in the memorable capoeira rodas.''", "pt": "Ambos eram companheiros no Trapiche de Baixo em Santo Amaro da Purificação. Faziam parte do lendário círculo de capoeira que incluía Paulo Barroquinha, Boca de Siri, Noca de Jacó e Doze Homens. Professor Leiteiro documentou que ''eram seus companheiros nas memoráveis rodas de capoeira.''"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Professor Leiteiro account via velhosmestres.com/br/besouro'
FROM genealogy.person_profiles ncp, genealogy.person_profiles besouro
WHERE ncp.apelido = 'Neco Canário Pardo' AND besouro.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', cv.id,
  'trained_under',
  'person', ncp.id,
  '{"training_type": {"en": "Machete (facão) technique", "pt": "Técnica de facão"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiography: "Neco Canário Pardo was my machete teacher" (capoeira-connection.com, capoeira.online)'
FROM genealogy.person_profiles cv, genealogy.person_profiles ncp
WHERE cv.apelido = 'Cobrinha Verde' AND ncp.apelido = 'Neco Canário Pardo'
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
  '{"membership_context": "Training companion at Trapiche de Baixo. Part of Besouro''s circle that met on Sundays and holidays."}'::jsonb,
  'verified'::genealogy.confidence,
  'José Brigido Dorneles Antunes (via Antonio Liberac); Velhos Mestres; Professor Leiteiro',
  'One of Besouro''s companions at Trapiche de Baixo alongside Paulo Barroquinha, Boca de Siri, Noca de Jacó, and Doze Homens. They were a gang of capoeira resistance fighters who trained together on Sundays.',
  'Um dos companheiros de Besouro no Trapiche de Baixo ao lado de Paulo Barroquinha, Boca de Siri, Noca de Jacó e Doze Homens. Eram uma turma de lutadores de resistência da capoeira que treinavam juntos aos domingos.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Neco Canário Pardo' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
