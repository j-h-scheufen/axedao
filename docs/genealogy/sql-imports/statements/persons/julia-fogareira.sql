-- ============================================================
-- STATEMENTS FOR: Júlia Fogareira
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Júlia Fogareira is the SUBJECT.
-- ============================================================

-- Júlia Fogareira trained_under Pastinha
-- Context: Pastinha testified that she "learned the art not only with
-- Mestre Pastinha but also with other masters of the time" (1902-1911)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1902-01-01'::date, 'decade'::genealogy.date_precision,
  '1911-12-31'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1969-3',
  'Pastinha testified in 1969 (A Tarde) that between 1902-1911, women including Júlia Fogareira "learned the art not only with Mestre Pastinha but also with other masters of the time." Pastinha was born 1889, so he was 13-22 during this period - already teaching while young.',
  'Pastinha testemunhou em 1969 (A Tarde) que entre 1902-1911, mulheres incluindo Júlia Fogareira "aprenderam a arte não só com Mestre Pastinha mas também com outros mestres da época." Pastinha nasceu em 1889, então tinha 13-22 anos durante esse período - já ensinando enquanto jovem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlia Fogareira' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Júlia Fogareira associated_with Maria Homem
-- Context: Both were among the famous female capoeiristas of 1902-1911 era
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1902-01-01'::date, 'decade'::genealogy.date_precision,
  '1911-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Fellow female capoeiristas in early 20th century Salvador; both listed by Pastinha among legendary practitioners", "pt": "Companheiras capoeiristas no início do século XX em Salvador; ambas listadas por Pastinha entre praticantes lendárias"}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/pastinha-1976',
  'Both women listed together by Pastinha in 1976 O Globo interview among the generation of "angoleiros de briga" - the only two women among legendary male fighters like Besouro, Américo Ciência, etc.',
  'Ambas as mulheres listadas juntas por Pastinha em entrevista ao O Globo de 1976 entre a geração de "angoleiros de briga" - as únicas duas mulheres entre lutadores lendários como Besouro, Américo Ciência, etc.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlia Fogareira' AND o.apelido = 'Maria Homem'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Júlia Fogareira associated_with Palmeirona - needs import first
-- Júlia Fogareira associated_with Maria Pernambucana - needs import first
-- ============================================================
