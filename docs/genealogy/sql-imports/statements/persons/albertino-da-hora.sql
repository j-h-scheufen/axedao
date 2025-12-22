-- ============================================================
-- STATEMENTS FOR: Albertino da Hora
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Albertino da Hora is the SUBJECT.
-- ============================================================

-- Albertino da Hora student_of Pastinha
-- Primary training relationship at CECA (1950s-1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown
  NULL, NULL, -- End date unknown
  '{}'::jsonb,
  'verified'::genealogy.confidence, -- Multiple sources confirm: O Cruzeiro 1963, velhosmestres.com, numerous biographical sources
  'velhosmestres.com/br/pastinha-1963-1; O Cruzeiro May 4, 1963',
  E'Albertino da Hora trained at CECA (Centro Esportivo de Capoeira Angola) in Pelourinho under Mestre Pastinha during the academy''s golden era (1950s-1960s). He appears in the 1963 O Cruzeiro magazine article as one of Pastinha''s musicians and companions, and traveled with Pastinha''s group to Belo Horizonte in 1964.',
  E'Albertino da Hora treinou no CECA (Centro Esportivo de Capoeira Angola) no Pelourinho sob Mestre Pastinha durante a era dourada da academia (décadas de 1950-1960). Ele aparece no artigo da revista O Cruzeiro de 1963 como um dos músicos e comparsas de Pastinha, e viajou com o grupo de Pastinha para Belo Horizonte em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Albertino da Hora' AND s.apelido_context IS NULL
  AND o.apelido = 'Pastinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or
-- relationship direction is inverse - belongs in other file)
-- ============================================================
-- NOTE: These are CONTEMPORARIES, not teacher-student or other
-- directional relationships. The association should be documented
-- in the more prominent person's file:
--
-- João Grande associated_with Albertino da Hora (contemporaries at CECA)
--   → Belongs in joao-grande.sql when created
--
-- João Pequeno associated_with Albertino da Hora (bateria companions)
--   → Belongs in joao-pequeno.sql when created
--
-- Gildo Alfinete associated_with Albertino da Hora (traveled together to BH 1964)
--   → Belongs in gildo-alfinete.sql when created
--
-- Valdomiro associated_with Albertino da Hora (bateria companions)
--   → Belongs in valdomiro.sql when created
--
-- Gato Preto associated_with Albertino da Hora (bateria companions)
--   → Gato Preto already in dataset; relationship could be added there
--
-- Roberto Satanás associated_with Albertino da Hora (traveled together to BH 1964)
--   → Belongs in roberto-satanas.sql when created
-- ============================================================
