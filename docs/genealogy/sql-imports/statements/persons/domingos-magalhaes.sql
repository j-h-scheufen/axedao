-- ============================================================
-- STATEMENTS FOR: Domingos Magalhães
-- Generated: 2026-01-02
-- Updated: 2026-01-02 - Removed redundant associated_with statements
--   (Gengibirra membership already connects all roda participants)
-- ============================================================
-- Contains all relationships where Domingos Magalhães is the SUBJECT.
-- ============================================================

-- Domingos Magalhães member_of Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Participated in the Liberdade/Gengibirra roda pre-1941, documented in A Tarde 1969
-- NOTE: He was NOT among the 22 founding mestres - he was a regular participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A Tarde, February 24, 1969; velhosmestres.com/en/pastinha-1969-3',
  'Regular participant at the Liberdade/Gengibirra roda on Sundays. Listed among the mestres who gathered there, presided over by civil guard Amorzinho. NOT among the 22 founding mestres - was a participant rather than organizational founder.',
  'Participante regular na roda da Liberdade/Gengibirra aos domingos. Listado entre os mestres que se reuniam lá, presidida pelo guarda civil Amorzinho. NÃO estava entre os 22 mestres fundadores - era participante e não fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Domingos Magalhães'
  AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Domingos Magalhães associated_with Eulâmpio
-- Context: SPECIFIC relationship beyond roda membership - Pastinha named BOTH
-- as capable Federation organizers in 1969 interview
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Named together by Pastinha as capable Federation organizers (1969)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1969',
  'Pastinha named both as capable mestres who could organize a Federation in 1969: "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães... esses mestres poderiam fazer um bom trabalho."',
  'Pastinha nomeou ambos como mestres capazes que poderiam organizar uma Federação em 1969: "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães... esses mestres poderiam fazer um bom trabalho."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Domingos Magalhães' AND o.apelido = 'Eulâmpio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional associated_with statements for other
-- Gengibirra contemporaries. Membership in Gengibirra group
-- already connects all roda participants.
-- ============================================================
