-- ============================================================
-- STATEMENTS FOR: Marrom (São Paulo)
-- Generated: 2026-01-11
-- Updated: 2026-01-11 (Baixinho now in dataset)
-- ============================================================
-- Contains all relationships where Marrom (São Paulo) is the SUBJECT.
-- Uses apelido_context 'São Paulo' for disambiguation from Rio Marrom.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Marrom (SP) family_of Baixinho (son-father relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "son"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira.jex.com.br; irmaosguerreiros.wixsite.com; lalaue.com',
  'Biological son of Mestre Baixinho (José Eloy de Oliveira). Confirmed in multiple sources including Maré de Março CD documentation.',
  'Filho biológico de Mestre Baixinho (José Eloy de Oliveira). Confirmado em múltiplas fontes incluindo documentação do CD Maré de Março.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND COALESCE(s.apelido_context, '') = 'São Paulo'
  AND o.apelido = 'Baixinho' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Marrom (SP) student_of Baixinho (father/primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'irmaosguerreiros.wixsite.com; lalaue.com',
  'Marrom began training capoeira in 1978 at age 8 under his father Baixinho''s instruction at the family home in Taboão da Serra.',
  'Marrom começou a treinar capoeira em 1978 aos 8 anos de idade sob a instrução de seu pai Baixinho na casa da família em Taboão da Serra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND COALESCE(s.apelido_context, '') = 'São Paulo'
  AND o.apelido = 'Baixinho' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- Marrom (SP) trained_under Pé de Chumbo (supervisor)
-- Object: Mestre Pé de Chumbo (Gidalto Pereira Dias) - NOT in dataset, needs import
-- Notes: "O Irmãos Guerreiros recebeu, durante alguns anos, a supervisão do
--        Mestre Pé-de-Chumbo, um dos primeiros angoleiros a desenvolver
--        trabalho nesta nova fase da Capoeira de Angola em São Paulo."
-- Confidence: likely
-- Source: capoeira.jex.com.br

-- Marrom (SP) co_founded Grupo Irmãos Guerreiros
-- Object: Grupo de Capoeira Angola Irmãos Guerreiros - in groups-backlog.md, pending
-- Started: 1983
-- Properties: { "role": "co_founder", "founding_age": 13 }
-- Source: Multiple sources confirm 1983 founding

-- Marrom (SP) leads Grupo Irmãos Guerreiros
-- Object: Grupo Irmãos Guerreiros - in groups-backlog.md, pending
-- Notes: "At the forefront of the group's activities" - current leader of São Paulo operations
-- Source: irmaosguerreiros.wixsite.com

-- ============================================================
-- ADDITIONAL PENDING RELATIONSHIPS
-- ============================================================

-- Marrom (SP) family_of Guerreiro (uncle)
-- Object: Guerreiro - NOT in dataset, needs import
-- Properties: { "relationship_type": "nephew" }

-- Marrom (SP) family_of Macete (uncle)
-- Object: Macete - NOT in dataset, needs import
-- Properties: { "relationship_type": "nephew" }

-- ============================================================
-- NOTE ON STUDENTS:
-- Students of Marrom (e.g., Perna, Cunhadinho, Pintinha) should have
-- their statements in THEIR own files with Marrom as the OBJECT,
-- not here where Marrom is the SUBJECT.
-- Example: Perna student_of Marrom → goes in perna.sql
-- ============================================================
