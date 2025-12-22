-- ============================================================
-- STATEMENTS FOR: Mário Aleixo
-- Generated: 2025-12-22
-- ============================================================
-- Contains all relationships where Mário Aleixo is the SUBJECT.
-- ============================================================

-- Mário Aleixo trained_under Sada Miyako (jiu-jitsu, before 1913)
-- NOTE: Sada Miyako is not in genealogy dataset - not a capoeirista
-- This relationship is documented in notes_en/notes_pt but cannot be
-- expressed as a statement until decision is made on non-capoeira figures

-- Mário Aleixo associated_with Sinhozinho (collaborated on 1920 exhibitions)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "collaborated on capoeiragem exhibitions and teaching"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Jornal (March 13, 1920); capoeirahistory.com',
  'In 1916, Aleixo invited Sinhozinho to teach Greco-Roman wrestling at União dos Empregados do Comércio. By 1920, both participated in sports festival exhibitions documented in O Jornal.',
  'Em 1916, Aleixo convidou Sinhozinho para ensinar luta greco-romana na União dos Empregados do Comércio. Em 1920, ambos participaram de exibições de festival esportivo documentadas em O Jornal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Aleixo' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Aleixo influenced Zuma (through ginástica nacional methodology)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "contemporaries in Rio capoeira carioca movement"}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahistory.com; Zuma manual (1928)',
  'Both were part of the "ginástica nacional" movement in Rio de Janeiro. Aleixo taught at Gymnástico Português from 1920, where Zuma may have trained. Both influenced Bimba''s development of Regional.',
  'Ambos faziam parte do movimento de "ginástica nacional" no Rio de Janeiro. Aleixo ensinava no Gymnástico Português a partir de 1920, onde Zuma pode ter treinado. Ambos influenciaram o desenvolvimento da Regional de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Aleixo' AND o.apelido = 'Zuma'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mário Aleixo trained_under Raphael Lóthus - needs import first
--   (co-founded Escola de Ginástica Nacional 1916; learned capoeiragem methodology)
--
-- Mário Aleixo associated_with Raul Pederneiras - needs import first
--   (opened capoeiragem school together at Club Gymnástico Português, 1920)
--
-- Mário Aleixo associated_with Gustavo Senna - needs import first
--   (directed 1920 sports festival exhibitions together)
--
-- Mário Aleixo lost_to George Gracie - George Gracie not in dataset (jiu-jitsu)
--   (Vale Tudo match, early 1930s, Theatro Republica, lost by armlock)
