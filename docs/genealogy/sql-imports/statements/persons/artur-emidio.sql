-- ============================================================
-- STATEMENTS FOR: Artur Emídio
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Artur Emídio is the SUBJECT.
-- ============================================================

-- Artur Emídio founded Grupo Artur Emídio (1955)
-- NOTE: Group not yet in dataset - will be added when group is imported
-- INSERT INTO genealogy.statements ...

-- ============================================================
-- TEACHER RELATIONSHIPS
-- ============================================================

-- Artur Emídio student_of Paizinho (Teodoro Ramos) - 1937-1945
-- Primary mestre who taught him from age 7 until Paizinho's death
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-69; capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
  E'Artur Emídio began training with Mestre Paizinho (Teodoro Ramos) in 1937 at age seven. Paizinho would wake him at 6 AM daily for practice. Training occurred "in the street, on the pavement" and "on hilltops, in alleyways, at night and always hidden" due to capoeira''s criminalization. Relationship ended with Paizinho''s death from meningitis in 1945, when 15-year-old Artur took over his master''s academy.',
  E'Artur Emídio começou a treinar com Mestre Paizinho (Teodoro Ramos) em 1937 aos sete anos. Paizinho o acordava às 6 da manhã diariamente para treinar. O treinamento ocorria "na rua, no passeio" e "no alto dos morros, nos becos, à noite e sempre escondidos" devido à criminalização da capoeira. A relação terminou com a morte de Paizinho por meningite em 1945, quando Artur de 15 anos assumiu a academia de seu mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Artur Emídio' AND o.apelido = 'Paizinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- - Artur Emídio trained_under [Gracie Academy] - ~1953-1955
--   Brief training after defeat to Rudolf Hermanny
--   Not a formal student_of relationship
--
-- GROUP RELATIONSHIPS:
-- - Artur Emídio founded "Grupo Artur Emídio" / "Academia de Capoeira Artur Emídio"
--   Founded 1955 in Rio de Janeiro, Rua Manuel Fontenele, Bonsucesso
--   Group not yet in dataset
-- ============================================================

-- Artur Emídio associated_with Bimba (met at 1967 symposium)
-- Using association_context to describe the documented connection
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Met at 1967 capoeira symposium at Campos dos Afonsos, Rio de Janeiro. Artur Emídio later described their relationship as \"somewhat conflictual.\" Photo of them together exists from this event."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-69; nossa-tribo.com/mestre-artur-emidio/',
  'Documented meeting at 1967 symposium. Not a teacher-student relationship. Artur''s academy was described as based on "the systematized method of Mestre Bimba" but this was learned through his own lineage (Paizinho), not directly from Bimba.',
  'Encontro documentado no simpósio de 1967. Não era uma relação professor-aluno. A academia de Artur era descrita como baseada no "método sistematizado de Mestre Bimba" mas isso foi aprendido através de sua própria linhagem (Paizinho), não diretamente de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Artur Emídio' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Statements where Artur Emídio is the OBJECT
-- (students learning FROM him) go in each student's file:
--
-- These exist in LEOPOLDINA.SQL (already imported):
-- - Leopoldina student_of Artur Emídio (~1954-1955)
--
-- These will be added when students are imported:
-- - Djalma Bandeira student_of Artur Emídio (first student)
-- - Paulo Gomes student_of Artur Emídio (1962)
-- - Celso do Engenho da Rainha student_of Artur Emídio
-- - Mendonça student_of Artur Emídio
-- - Vilela student_of Artur Emídio
-- - Vilmar student_of Artur Emídio
-- - Roberval Serejo student_of Artur Emídio
-- - Genaro student_of Artur Emídio (1955)
-- ============================================================
