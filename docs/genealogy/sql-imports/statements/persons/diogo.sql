-- ============================================================
-- STATEMENTS FOR: Diogo (Espinho Remoso lineage)
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Diogo is the SUBJECT.
-- Note: Uses apelido_context = 'Espinho Remoso' to distinguish from
-- Livino Diogo and Diogo da Lapa.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Diogo student_of Espinho Remoso
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Scribd document on Espinho Remoso legacy',
  'Diogo was one of the students of Mestre Espinho Remoso. He trained at the Sunday rodas at Jaqueira do Carneiro in Fazenda Grande do Retiro and was trusted to conduct Espinho Remoso''s funeral in 1960.',
  'Diogo foi um dos alunos de Mestre Espinho Remoso. Ele treinou nas rodas de domingo em Jaqueira do Carneiro em Fazenda Grande do Retiro e foi encarregado de realizar o funeral de Espinho Remoso em 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Diogo' AND s.apelido_context = 'Espinho Remoso'
  AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS
-- ============================================================

-- Diogo associated_with Virgílio da Fazenda Grande (training companion, mentor role)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Older student who helped train young Virgílio at Jaqueira do Carneiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Portal Capoeira (Mestre Virgílio: Meio Século de Capoeira), capoeira-angola.org.au',
  'Espinho Remoso introduced his young son Virgílio (age 10 in 1954) to train directly with older capoeiristas including Diogo, Fulô, and Florzinho.',
  'Espinho Remoso apresentou seu filho jovem Virgílio (10 anos em 1954) para treinar diretamente com capoeiristas mais velhos incluindo Diogo, Fulô e Florzinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Diogo' AND s.apelido_context = 'Espinho Remoso'
  AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Diogo associated_with Adó - played capoeira together at Corpo e Movimento event (photo by James Sera)
-- Diogo associated_with Mestre Angola - played at event under his direction
-- Diogo member_of Roda de Jaqueira do Carneiro - when roda entity is imported
