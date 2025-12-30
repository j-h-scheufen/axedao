-- ============================================================
-- STATEMENTS FOR: Henrique Bahia
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Henrique Bahia is the SUBJECT.
-- ============================================================

-- Henrique Bahia associated_with Américo Ciência (exhibition match)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-02-18'::date, 'exact'::genealogy.date_precision,
  '1936-02-18'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "Exhibition match at Parque Odeon, Praça da Sé, Salvador - ended with undecided outcome", "pt": "Luta de exibição no Parque Odeon, Praça da Sé, Salvador - terminou com resultado indeciso"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário da Bahia, March 13, 1936',
  'Exhibition match at newly inaugurated Parque Odeon. The press and public criticized it as "a joke of a match" - reflecting debates about whether capoeira angola was suitable for competitive ring fighting.',
  'Luta de exibição no recém-inaugurado Parque Odeon. A imprensa e o público criticaram como "uma piada de luta" - refletindo debates sobre se a capoeira angola era adequada para lutas competitivas de ringue.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Henrique Bahia' AND o.apelido = 'Américo Ciência'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Henrique Bahia associated_with Bimba (1936 Parque Odeon challenge fight)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-02-07'::date, 'exact'::genealogy.date_precision,
  '1936-02-07'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "Defeated by Bimba in 1936 Parque Odeon challenge - thrown with pontapé no peito (kick to chest)", "pt": "Derrotado por Bimba no desafio do Parque Odeon 1936 - derrubado com pontapé no peito"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias, Feb 7, 1936; Estado da Bahia, 1936',
  'First to accept Bimba''s newspaper challenge. Bimba called him "digno adversário" (worthy adversary).',
  'Primeiro a aceitar o desafio de Bimba nos jornais. Bimba o chamou de "digno adversário".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Henrique Bahia' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
