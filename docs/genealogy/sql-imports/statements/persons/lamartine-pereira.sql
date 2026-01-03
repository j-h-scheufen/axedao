-- ============================================================
-- STATEMENTS FOR: Lamartine Pereira
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Lamartine Pereira is the SUBJECT.
-- Relationships where Lamartine Pereira is the OBJECT should be in
-- the statement files of the respective subjects.
-- ============================================================

-- [Lamartine Pereira] student_of [Artur Emídio]
-- Primary teacher-student relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
  E'Lamartine Pereira trained with Mestre Artur Emídio, learning the systematized Bahian method. Based on his apprenticeship with Artur Emídio and in close collaboration with the master, Lamartine documented capoeira movements in his books. In 1961, he taught the Navy capoeira course "with the assistance of his master Artur Emídio and Djalma Bandeira." This training relationship likely began around 1959 when Lamartine graduated from EsEFEx.',
  E'Lamartine Pereira treinou com Mestre Artur Emídio, aprendendo o método sistematizado baiano. Baseado em seu aprendizado com Artur Emídio e em estreita colaboração com o mestre, Lamartine documentou os movimentos de capoeira em seus livros. Em 1961, ele ensinou o curso de capoeira da Marinha "com a assistência de seu mestre Artur Emídio e Djalma Bandeira." Essa relação de treinamento provavelmente começou por volta de 1959, quando Lamartine se formou na EsEFEx.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Lamartine Pereira] trained_under [Djalma Bandeira]
-- Secondary training relationship - trained alongside Djalma who was Artur's first student
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
  E'Lamartine "started practicing capoeira with Mestre Artur Emídio and his disciple Djalma Bandeira." Djalma was Artur Emídio''s first student and served as an assistant in teaching the 1961 Navy course alongside Lamartine.',
  E'Lamartine "começou a praticar capoeira com Mestre Artur Emídio e seu discípulo Djalma Bandeira." Djalma era o primeiro aluno de Artur Emídio e serviu como assistente no ensino do curso da Marinha de 1961 junto com Lamartine.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Djalma Bandeira' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Lamartine Pereira] associated_with [Artur Emídio]
-- Collaboration on Navy course and book documentation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-03-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Collaborated on Navy capoeira course (1961) and book documentation; Artur served as technical model for illustrations", "pt": "Colaboraram no curso de capoeira da Marinha (1961) e documentação do livro; Artur serviu como modelo técnico para ilustrações"}}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
  E'Lamartine administered the Navy capoeira course (March 1961) "with the assistance of his master Artur Emídio and Djalma Bandeira," teaching 208 officers and enlisted men. His book "Capoeiragem" was "based on his apprenticeship with Artur Emídio and in close collaboration with the master" and used illustrations of techniques similar to Artur''s, who was "known for exceptional movement execution."',
  E'Lamartine administrou o curso de capoeira da Marinha (março de 1961) "com a assistência de seu mestre Artur Emídio e Djalma Bandeira", ensinando 208 oficiais e praças. Seu livro "Capoeiragem" foi "baseado em seu aprendizado com Artur Emídio e em estreita colaboração com o mestre" e usou ilustrações de técnicas semelhantes às de Artur, que era "conhecido pela execução excepcional de movimentos."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Lamartine Pereira] associated_with [Djalma Bandeira]
-- Navy course collaboration
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-03-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Co-instructors of Navy capoeira methodology course (1961)", "pt": "Co-instrutores do curso de metodologia de capoeira da Marinha (1961)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'In 1961, Djalma Bandeira and Artur Emídio participated in the official introduction of capoeira into the Brazilian Navy. Working with Lieutenant Lamartine Pereira da Costa, the duo assisted in teaching a course on the "methodology of teaching capoeira" to 208 officers and enlisted men at the Navy Sports Centre.',
  E'Em 1961, Djalma Bandeira e Artur Emídio participaram da introdução oficial da capoeira na Marinha do Brasil. Trabalhando com o Tenente Lamartine Pereira da Costa, a dupla auxiliou no ensino de um curso sobre a "metodologia de ensino de capoeira" para 208 oficiais e praças no Centro de Esportes da Marinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Djalma Bandeira' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NO PENDING RELATIONSHIPS
-- ============================================================
-- All teachers (Artur Emídio, Djalma Bandeira) exist in database.
-- No students documented - Lamartine was primarily an author/researcher.
-- No group founded - his contribution was through publications and the
-- Navy course, not through establishing a capoeira group.
-- ============================================================
