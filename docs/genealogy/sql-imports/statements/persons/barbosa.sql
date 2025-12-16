-- ============================================================
-- STATEMENTS FOR: Barbosa (do Cabeça)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Barbosa is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
--
-- NOTE: Most significant relationships have Barbosa as OBJECT:
-- - João Pequeno trained_under Barbosa → goes in joao-pequeno.sql
-- These are listed in PENDING section for cross-reference.
-- ============================================================

-- ------------------------------------------------------------
-- Barbosa associated_with Querido de Deus
-- Both featured in Edison Carneiro's research on Angola capoeira
-- Both participated in 1937 II Congresso Afro-Brasileiro
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "II Congresso Afro-Brasileiro participants; Edison Carneiro informants"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Edison Carneiro "Negros Bantus" (1937)',
  'Both Barbosa and Querido de Deus were key informants for Edison Carneiro''s research on capoeira de Angola. Carneiro acknowledged receiving "o mais efficiente concurso de Samuel Querido de Deus, Barbosa e Zeppelin, quanto a capoeira de Angola" for his book. Both participated in the capoeira demonstration at II Congresso Afro-Brasileiro in January 1937.',
  'Tanto Barbosa quanto Querido de Deus foram informantes-chave para a pesquisa de Edison Carneiro sobre capoeira de Angola. Carneiro reconheceu ter recebido "o mais efficiente concurso de Samuel Querido de Deus, Barbosa e Zeppelin, quanto a capoeira de Angola" para seu livro. Ambos participaram da demonstracao de capoeira no II Congresso Afro-Brasileiro em janeiro de 1937.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Cachoeira/Largo Dois de Julho'
  AND o.apelido = 'Querido de Deus'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Barbosa associated_with Cobrinha Verde
-- Barbosa brought students to Cobrinha Verde's roda
-- Both active in Salvador capoeira scene 1940s-1950s
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Barbosa brought students to Cobrinha Verde roda in Chame-Chame"}'::jsonb,
  'verified'::genealogy.confidence,
  'CECA official; Velhos Mestres; Capoeira Connection',
  'Barbosa brought João Pequeno to train at Cobrinha Verde''s roda in the Chame-Chame neighborhood of Salvador around 1943. This indicates a collegial relationship where Barbosa directed interested practitioners to established teachers.',
  'Barbosa levou João Pequeno para treinar na roda de Cobrinha Verde no bairro do Chame-Chame em Salvador por volta de 1943. Isso indica uma relacao de colegas onde Barbosa direcionava praticantes interessados a professores estabelecidos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Cachoeira/Largo Dois de Julho'
  AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Barbosa associated_with Onça Preta
-- Both participated in 1937 II Congresso Afro-Brasileiro
-- Contemporaries in Salvador capoeira scene
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "II Congresso Afro-Brasileiro participants 1937"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Edison Carneiro research',
  'Both Barbosa and Onca Preta participated in the capoeira demonstration at the II Congresso Afro-Brasileiro in Ribeira, Salvador on January 14, 1937. This historic event brought together the leading capoeiristas of the era for formal documentation of the art.',
  'Tanto Barbosa quanto Onca Preta participaram da demonstracao de capoeira no II Congresso Afro-Brasileiro em Ribeira, Salvador em 14 de janeiro de 1937. Este evento historico reuniu os principais capoeiristas da epoca para documentacao formal da arte.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Cachoeira/Largo Dois de Julho'
  AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Barbosa associated_with Juvenal - Played together at II Congresso Afro-Brasileiro 1937; historical photo exists. Needs Juvenal import first.
-- Barbosa associated_with Zeppelin - Both informants for Edison Carneiro's research. Needs Zeppelin import first.
-- Barbosa associated_with Menino Gordo - Present together at 1953 Roça do Lobo roda. Needs Menino Gordo import first.

-- ============================================================
-- INVERSE RELATIONSHIPS (where Barbosa is OBJECT)
-- These go in the subject's statement file, not here.
-- Listed for cross-reference only.
-- ============================================================
-- João Pequeno trained_under Barbosa - Barbosa taught João Pequeno ~1943-1945; introduced him to Cobrinha Verde's roda. → goes in joao-pequeno.sql
