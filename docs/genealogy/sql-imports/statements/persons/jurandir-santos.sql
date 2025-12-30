-- ============================================================
-- STATEMENTS FOR: Jurandir Santos
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Jurandir Santos is the SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Jurandir Santos student_of João Grande
-- Primary teacher - his father; trained from early childhood
-- Ongoing relationship from birth through present
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraHub; 1library.org academic source; leiamaisba.com.br 2019',
  'Jurandir was trained by his father João Grande from early childhood. João Grande would wake Jurandir and his brother Jorge early in the morning to train together in their backyard, instilling a deep connection to Capoeira Angola as a way of life rooted in discipline, respect, and tradition. This represents organic, immersive transmission before the formalization of academy systems.',
  'Jurandir foi treinado por seu pai João Grande desde a primeira infância. João Grande acordava Jurandir e seu irmão Jorge cedo pela manhã para treinar juntos no quintal, incutindo uma conexão profunda com a Capoeira Angola como modo de vida enraizado em disciplina, respeito e tradição. Isso representa a transmissão orgânica e imersiva antes da formalização dos sistemas de academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir Santos' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Jurandir Santos family_of João Grande
-- Biological son of Mestre João Grande
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraHub; 1library.org; leiamaisba.com.br documentary 2019',
  'Jurandir Souza dos Santos is the son of Mestre João Grande (João Oliveira dos Santos). Multiple sources confirm this biological relationship, including the documentary "Mestre Pastinha, Rei da Capoeira" (2019) and academic research on CECA hierarchical structures.',
  'Jurandir Souza dos Santos é filho de Mestre João Grande (João Oliveira dos Santos). Múltiplas fontes confirmam esta relação biológica, incluindo o documentário "Mestre Pastinha, Rei da Capoeira" (2019) e pesquisa acadêmica sobre estruturas hierárquicas do CECA.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir Santos' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- Jurandir Santos family_of Jorge
-- Brother (both sons of João Grande, trained together in childhood)
-- Jorge is not yet in the dataset - needs import first

-- Jurandir Santos teaches_at AJPP-CECA (Academia de João Pequeno de Pastinha)
-- Was coordinator for evening training sessions at Forte Santo Antônio
-- Group AJPP-CECA is not yet in the dataset - needs import first

-- Jurandir Santos associated_with Contramestre Aranha (Isaac Damasceno)
-- Fellow coordinator at João Pequeno's academy (morning classes)
-- Aranha is not yet in the dataset - needs import first

-- Jurandir Santos associated_with Treinel Zoinho (Everaldo Santos)
-- Fellow coordinator at João Pequeno's academy
-- Zoinho is not yet in the dataset - needs import first
