-- ============================================================
-- STATEMENTS FOR: Paulo Santo Amaro
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Paulo Santo Amaro is the SUBJECT.
-- Fellow contra-mestres (Fernandinho, Silvestre, Zé) documented in bio.
-- ============================================================

-- Paulo Santo Amaro student_of Caiçara
-- Source: velhosmestres.com - Listed as one of Caiçara's contramestres
-- who trained at Jardim Cruzeiro fish market
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, 'unknown'::genealogy.date_precision,
  NULL::date, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence, -- Single Tier 1 source (velhosmestres.com)
  'https://velhosmestres.com/en/featured-39',
  E'Became contra-mestre under Caiçara at the Jardim Cruzeiro fish market in Salvador''s Cidade Baixa. Per Omilad D''Angola: "Mestre Caiçara sold fish on the small market of Jardim Cruzerio... Here he got many to become his contramestres. Such as Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) and others."',
  E'Tornou-se contra-mestre sob Caiçara no mercado de peixe do Jardim Cruzeiro na Cidade Baixa de Salvador. Segundo Omilad D''Angola: "Mestre Caiçara vendia peixe na feirinha do Jardim Cruzeiro... Aqui ele pegava muitos para ser seus contramestres. Como Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) e outros."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Santo Amaro' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Gato Preto trained_under Paulo Santo Amaro relationship
-- This is documented in matumbecapoeira.com, but per convention
-- it should go in gato-preto.sql (where Gato Preto is the SUBJECT)
-- ============================================================
