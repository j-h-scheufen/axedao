-- ============================================================
-- STATEMENTS FOR: Antônio Cabeceiro
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Antônio Cabeceiro is the SUBJECT.
-- ============================================================

-- Antônio Cabeceiro student_of Pastinha
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
  NULL, NULL,
  '{"location": "Salvador, Bahia"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-71',
  E'Confirmed as student of Mestre Pastinha by Velhos Mestres: "M Antônio Cabeceiro (aluno de M Pastinha)". Training dates unknown, but occurred before he was active at Waldemar''s roda (~1953) and before teaching in Ilhéus (1956).',
  E'Confirmado como aluno de Mestre Pastinha por Velhos Mestres: "M Antônio Cabeceiro (aluno de M Pastinha)". Datas de treinamento desconhecidas, mas ocorreu antes de estar ativo na roda de Waldemar (~1953) e antes de ensinar em Ilhéus (1956).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Antônio Cabeceiro' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Antônio Cabeceiro associated_with Waldemar (trained at his roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Trained at Waldemar barracão roda"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira-connection.com/capoeira/2011/10/interview-with-mestre-joao-grande/',
  E'Cabeceiro was one of the formidable capoeiristas at Waldemar''s roda in Liberdade, Salvador. João Grande recalled: "Antônio Cabeceiro was as wicked as anything". He bought the game from João Grande and threw him into the street during a meia lua de costas (~1953-1954).',
  E'Cabeceiro era um dos capoeiristas formidáveis na roda de Waldemar na Liberdade, Salvador. João Grande lembrou: "Antônio Cabeceiro era malvado demais". Ele comprou o jogo de João Grande e o jogou na rua durante uma meia lua de costas (~1953-1954).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Antônio Cabeceiro' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Antônio Cabeceiro associated_with João Grande (São Sebastião festival 1956 + Waldemar's roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Contemporaries at Waldemar roda and São Sebastião festival Ilhéus 1956"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira-connection.com/capoeira/2011/10/interview-with-mestre-joao-grande/; velhosmestres.com/br/destaques-71',
  E'Cabeceiro and João Grande were contemporaries at Waldemar''s roda in Salvador (~1953-1954). In 1956, they demonstrated capoeira together at the Festa de São Sebastião in Ilhéus alongside João Pequeno, witnessed by young Boa Gente.',
  E'Cabeceiro e João Grande eram contemporâneos na roda de Waldemar em Salvador (~1953-1954). Em 1956, demonstraram capoeira juntos na Festa de São Sebastião em Ilhéus ao lado de João Pequeno, testemunhado pelo jovem Boa Gente.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Antônio Cabeceiro' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Antônio Cabeceiro associated_with João Pequeno (São Sebastião festival 1956)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Demonstrated capoeira together at São Sebastião festival Ilhéus 1956"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-71; nossa-tribo.com/mestre-boa-gente',
  E'Cabeceiro and João Pequeno demonstrated capoeira together at the Festa de São Sebastião in Ilhéus, 1956, alongside João Grande. This demonstration inspired young Boa Gente to begin training.',
  E'Cabeceiro e João Pequeno demonstraram capoeira juntos na Festa de São Sebastião em Ilhéus, 1956, ao lado de João Grande. Esta demonstração inspirou o jovem Boa Gente a começar a treinar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Antônio Cabeceiro' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Antônio Cabeceiro cultural_pioneer_of Ilhéus
-- NOTE: This is a person-to-group predicate but we can express this as a note
-- The predicate cultural_pioneer_of requires a group object, not a region
-- Capturing this in notes instead

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Antônio Cabeceiro associated_with Evanir (contemporaries at Waldemar's roda)
-- Evanir not yet in dataset - in persons-backlog.md as pending
-- Cabeceiro bought the game from João Grande who was playing with Evanir

-- ============================================================
-- NOTE: Boa Gente student_of Antônio Cabeceiro is in boa-gente.sql
-- (predicate flows from subject Boa Gente to object Antônio Cabeceiro)
-- Will need to update boa-gente.sql to activate that statement now
-- ============================================================
