-- ============================================================
-- STATEMENTS FOR: Cafuné
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Cafuné is the SUBJECT.
-- ============================================================

-- Cafuné student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A TARDE 2018, Blog do Márcio Wesley 2021, Clínica de Capoeira 2014',
  E'Began training in 1966 after reading newspaper interview with Bimba. Traveled from Polo Petroquímico de Camaçari to Pelourinho. Graduated August 1967. Remained until Bimba left for Goiânia in 1971.',
  E'Começou a treinar em 1966 após ler entrevista de Bimba em jornal. Viajou do Polo Petroquímico de Camaçari ao Pelourinho. Formou-se em agosto de 1967. Permaneceu até Bimba partir para Goiânia em 1971.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cafuné' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cafuné baptized_by Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"baptism": {"apelido_given": "Cafuné", "location": "Nordeste de Amaralina, Salvador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'A TARDE 2018, Blog do Márcio Wesley 2021, Portal Capoeira',
  E'Received apelido at batizado ceremony in Nordeste de Amaralina. Bimba declared: "his name is Cafuné—he doesn''t play capoeira, he does cafuné" (a gentle caress).',
  E'Recebeu apelido na cerimônia de batizado no Nordeste de Amaralina. Bimba declarou: "o nome dele é Cafuné—ele não joga capoeira, ele faz cafuné" (um carinho suave).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cafuné' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cafuné associated_with Nenel
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1994-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Works together at Fundação Mestre Bimba and Filhos de Bimba Escola de Capoeira, travels internationally for workshops"}'::jsonb,
  'verified'::genealogy.confidence,
  'Fundação Mestre Bimba website, A TARDE 2018',
  E'Cafuné works with Nenel at Fundação Mestre Bimba (member of Curator Council) and Filhos de Bimba Escola de Capoeira. They travel together conducting workshops.',
  E'Cafuné trabalha com Nenel na Fundação Mestre Bimba (membro do Conselho Curador) e Filhos de Bimba Escola de Capoeira. Viajam juntos conduzindo oficinas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cafuné' AND o.apelido = 'Nenel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (groups not yet in dataset)
-- ============================================================
-- Cafuné member_of Fundação Mestre Bimba - needs group import first
-- Cafuné member_of Filhos de Bimba Escola de Capoeira - needs group import first
