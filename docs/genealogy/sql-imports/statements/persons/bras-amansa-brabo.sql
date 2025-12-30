-- ============================================================
-- STATEMENTS FOR: Brás Amansa Brabo
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Brás Amansa Brabo is the SUBJECT.
-- ============================================================

-- Brás Amansa Brabo student_of Bimba
-- Source: O Globo Feb 16, 1982 (via velhosmestres.com): "almost all direct disciples of the legendary Bimba"
-- Also: Atenilo's testimony names him among Bimba's most trusted companions
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
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'O Globo Feb 16, 1982 (velhosmestres.com/br/cobrinha-1982-3); Atenilo testimony (Itapoan writings)',
  E'Training start date unknown. Relationship ended with Bimba''s death on Feb 5, 1974. Named as direct disciple in 1982 O Globo article and as one of Bimba''s most trusted companions in Atenilo''s testimony.',
  E'Data de início do treinamento desconhecida. Relacionamento terminou com a morte de Bimba em 5 de fevereiro de 1974. Nomeado como discípulo direto no artigo do O Globo de 1982 e como um dos companheiros mais confiáveis de Bimba no testemunho de Atenilo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Brás Amansa Brabo associated_with Atenilo
-- Source: Atenilo testimony - named together as Bimba's trusted companions
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
  '{"association_context": "Both named as Bimba''s most trusted companions alongside Crispim (Bimba''s eldest son). Training contemporaries at Centro de Cultura Física Regional."}'::jsonb,
  'verified'::genealogy.confidence,
  'Atenilo testimony preserved in Mestre Itapoan writings',
  E'Both were part of Bimba''s inner circle of trusted companions alongside Crispim. Contemporaries at Bimba''s academy.',
  E'Ambos faziam parte do círculo íntimo de companheiros de confiança de Bimba junto com Crispim. Contemporâneos na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following contemporaries from the 1982 O Globo article are
-- not yet in the dataset. Add statements after import:
--
-- Brás Amansa Brabo associated_with Vinte e Nove - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Vermelho 27 - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Medicina - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Banduê - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Capazans - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Ezequiel - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Xaréu - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Crispim - Bimba's son, inner circle companion
--
-- Itapoan is already in dataset but the association is less direct
-- (both listed in 1982 article, but Itapoan/Xaréu had founded Ginga by then)
