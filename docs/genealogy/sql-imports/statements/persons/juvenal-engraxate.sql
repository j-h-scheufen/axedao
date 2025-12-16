-- ============================================================
-- STATEMENTS FOR: Juvenal Engraxate (Juvenal Hermenegildo da Cruz)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Juvenal Engraxate is the SUBJECT.
-- ============================================================

-- Juvenal Engraxate student_of Samuel Querido de Deus
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
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'O Cruzeiro magazine (1948); Velhos Mestres; Jorge Amado (Bahía de Todos os Santos, 1944)',
  'Juvenal was formally recognized as Mestre by Samuel Querido de Deus. "This title was given to me by Samuel Querido-de-Deus," Juvenal recounted. "Samuel liked my qualities and saw my future." Juvenal described his teacher as "uma onça" (a jaguar).',
  'Juvenal foi formalmente reconhecido como Mestre por Samuel Querido de Deus. "Este título me foi dado por Samuel Querido-de-Deus," Juvenal contou. "Samuel gostava das minhas qualidades e via meu futuro." Juvenal descrevia seu professor como "uma onça".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Juvenal Engraxate' AND o.apelido = 'Querido de Deus'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Juvenal Engraxate co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1941-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Portal Capoeira; Nossa Tribo',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra. The four "donos e proprietários" were Noronha, Livino, Totonho de Maré, and Amorzinho, with 18 other mestres including Juvenal as co-founders.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra. Os quatro "donos e proprietários" eram Noronha, Livino, Totonho de Maré e Amorzinho, com outros 18 mestres incluindo Juvenal como cofundadores.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Juvenal Engraxate' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS
-- ============================================================
-- Juvenal Engraxate associated_with Barbosa - Played together at II Congresso Afro-Brasileiro 1937
-- Waiting for: Barbosa import
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'associated_with'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   '1937-01-01'::date, 'year'::genealogy.date_precision,
--   '1937-12-31'::date, 'year'::genealogy.date_precision,
--   '{"event": "II Congresso Afro-Brasileiro"}'::jsonb,
--   'verified'::genealogy.confidence,
--   'Historical photographs from II Congresso Afro-Brasileiro (1937)',
--   'Juvenal and Barbosa played capoeira together at the II Congresso Afro-Brasileiro in 1937. Historical photographs of this event survive.',
--   'Juvenal e Barbosa jogaram capoeira juntos no II Congresso Afro-Brasileiro em 1937. Fotografias históricas deste evento sobrevivem.'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Juvenal Engraxate' AND o.apelido = 'Barbosa'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
-- ============================================================

-- ============================================================
-- STUDENT RELATIONSHIPS (documented students)
-- ============================================================
-- Students: Reginaldo, Antonio, Evangelista, Romenil Assis da Cruz (son)
-- Note: These individuals need their own person_profile imports before relationships can be established
-- ============================================================
