-- ============================================================
-- STATEMENTS FOR: Leopoldina
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Leopoldina is the SUBJECT.
-- ============================================================

-- Leopoldina student_of Quinzinho (1951 - ~1954)
-- Leopoldina's first master in tiririca, the capoeira without berimbau.
-- Training began when Leopoldina was 18, met Quinzinho around Central Station.
-- Ended when Quinzinho was murdered in prison around 1954.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1951-01-01'::date, 'year'::genealogy.date_precision,
  '1954-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/general/master-leopoldina-part-1/',
  E'Quinzinho was Leopoldina''s first master, teaching him tiririca - Rio''s street capoeira without berimbau, descended from 19th-century maltas. Training began around 1950-1951 when Leopoldina was 18 and ended when Quinzinho was murdered in prison around 1954. Leopoldina trained in front of Quinzinho''s house every day at 7am and became the only person who could truly play with his master.',
  E'Quinzinho foi o primeiro mestre de Leopoldina, ensinando-lhe tiririca - a capoeira de rua do Rio sem berimbau, descendente das maltas do século XIX. O treinamento começou por volta de 1950-1951 quando Leopoldina tinha 18 anos e terminou quando Quinzinho foi assassinado na prisão por volta de 1954. Leopoldina treinava na frente da casa de Quinzinho todos os dias às 7h e tornou-se a única pessoa que realmente conseguia jogar com seu mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopoldina' AND o.apelido = 'Quinzinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Leopoldina student_of Artur Emídio (~1954-1955+)
-- After Quinzinho's death, Leopoldina learned Bahian capoeira with berimbau
-- from Artur Emídio, who had been brought to Rio by Valdemar Santana.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/general/master-leopoldina-part-1/; https://sites.google.com/view/raridadesdacapoeira/mestre-leopoldina',
  E'After Quinzinho''s murder, Leopoldina learned from Artur Emídio, whom Valdemar Santana had brought from Bahia. This introduced him to Bahian capoeira played with berimbau - a completely different world from what Quinzinho had taught. Leopoldina recalled: "Artur começou a crescer...e percebi que ele era mais fera ainda que o Quinzinho" (Artur progressively dominated, and I realized he was even fiercer than Quinzinho). Some sources date this to 1954, others to 1955 when Artur formally moved to Rio.',
  E'Após o assassinato de Quinzinho, Leopoldina aprendeu com Artur Emídio, que Valdemar Santana havia trazido da Bahia. Isso o introduziu à capoeira baiana tocada com berimbau - um mundo completamente diferente do que Quinzinho havia ensinado. Leopoldina lembrou: "Artur começou a crescer...e percebi que ele era mais fera ainda que o Quinzinho." Algumas fontes datam isso de 1954, outras de 1955 quando Artur se mudou formalmente para o Rio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopoldina' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Leopoldina associated_with Mangueira (1961-1974)
-- Organized 60 capoeiristas for Mangueira samba school parades.
-- First school to integrate capoeira in parades.
-- Mangueira is a samba school, not currently in our groups model.

-- ============================================================
-- REVERSE RELATIONSHIPS (documented here for reference)
-- These statements belong in OTHER persons' statement files:
-- ============================================================

-- Nestor Capoeira student_of Leopoldina (1965-1968)
-- Goes in: statements/persons/nestor-capoeira.sql
-- Nestor was initiated by Leopoldina in 1965, joined Senzala in 1968.

-- Celso Pepe student_of Leopoldina (~1956-1960s)
-- Goes in: statements/persons/celso-pepe.sql
-- Celso learned Angola game and São Bento Pequeno from Leopoldina at
-- Academia Guanabara. Leopoldina was 23 years old at the time (~1956).
-- They performed together on TV and at events from 1959-60 onward.

-- Mestre Touro is part of Leopoldina's lineage via Celso Pepe:
-- Leopoldina → Celso Pepe → Mestre Touro
-- This extends the premodern Rio lineage to the present day.
