-- ============================================================
-- STATEMENTS FOR: Paulo Barroquinha
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Paulo Barroquinha is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Training companions at Trapiche de Baixo, Santo Amaro. Part of Besouro''s circle that met on Sundays and holidays to play capoeira. Described as a gang of capoeira resistance fighters who could always be relied upon to back one another up".}'::jsonb,
  'verified'::genealogy.confidence,
  'José Brigido Dorneles Antunes (via Antonio Liberac); Velhos Mestres; Papoeira.com; Professor Leiteiro',
  'Part of Besouro''s inner circle alongside Boca de Siri, Noca de Jacó, Doze Homens, and Canário Pardo. All were residents of Trapiche de Baixo, the poorest neighborhood of Santo Amaro.',
  'Parte do círculo íntimo de Besouro ao lado de Boca de Siri, Noca de Jacó, Doze Homens e Canário Pardo. Todos eram moradores do Trapiche de Baixo, o bairro mais pobre de Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Barroquinha' AND o.apelido = 'Besouro Mangangá'
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"membership_context": "Regular participant in Sunday training sessions at Matatu Preto in the 1930s. Mentioned as ''Pedro Paulo Barroquinha'' in Canjiquinha''s testimony".}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); velhosmestres.com/br/destaques-2',
  'Mentioned as "Pedro Paulo Barroquinha" in Canjiquinha''s testimony about Matatu Preto. Likely the same person as Paulo Barroquinha of Trapiche de Baixo who moved to Salvador after Besouro''s death in 1924.',
  'Mencionado como "Pedro Paulo Barroquinha" no testemunho de Canjiquinha sobre o Matatu Preto. Provavelmente a mesma pessoa que Paulo Barroquinha do Trapiche de Baixo que se mudou para Salvador após a morte de Besouro em 1924.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Paulo Barroquinha' AND g.name = 'Roda do Matatu Preto'
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
  'José Brigido Dorneles Antunes (via Antonio Liberac); Velhos Mestres; Papoeira.com',
  'One of Besouro''s companions at Trapiche de Baixo alongside Boca de Siri, Noca de Jacó, Doze Homens, and Canário Pardo. They were a gang of capoeira resistance fighters who trained together on Sundays.',
  'Um dos companheiros de Besouro no Trapiche de Baixo ao lado de Boca de Siri, Noca de Jacó, Doze Homens e Canário Pardo. Eram uma turma de lutadores de resistência da capoeira que treinavam juntos aos domingos.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Paulo Barroquinha' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
