-- ============================================================
-- STATEMENTS FOR: Bigodinho
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Bigodinho is the SUBJECT.
-- ============================================================

-- Bigodinho student_of Waldemar (Primary teacher, 1950-1970)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-11',
  E'Bigodinho began training with Mestre Waldemar at the Barracão in Liberdade in 1950 when he moved to Salvador. He frequented the Barracão for over 25 years, becoming one of the most respected capoeiristas there. Left capoeira in 1970 due to repression.',
  E'Bigodinho começou a treinar com Mestre Waldemar no Barracão na Liberdade em 1950 quando se mudou para Salvador. Frequentou o Barracão por mais de 25 anos, tornando-se um dos capoeiristas mais respeitados ali. Deixou a capoeira em 1970 devido à repressão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bigodinho' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bigodinho trained_under Auvelino (Berimbau instruction, 1950)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"instruction_type": "berimbau"}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-bigodinho/',
  E'Auvelino, described as a "legendary berimbau master," taught Bigodinho the berimbau when he arrived in Salvador in 1950. This instruction was foundational to Bigodinho''s later fame as a berimbau player and singer.',
  E'Auvelino, descrito como um "lendário mestre de berimbau," ensinou berimbau a Bigodinho quando ele chegou em Salvador em 1950. Esta instrução foi fundamental para a fama posterior de Bigodinho como tocador de berimbau e cantor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bigodinho' AND o.apelido = 'Auvelino' AND o.apelido_context = 'Salvador'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Bigodinho associated_with Traíra
-- Both frequented Waldemar's Barracão together for years (1950s-1960s).
-- Traíra IS in the database (traira.sql exists), but statement should go in traira.sql
-- since we document from younger/newer to older/established, and Traíra started at
-- Waldemar's Barracão in 1947, before Bigodinho arrived in 1950.

-- Bigodinho associated_with Zacarias Boa Morte
-- Both frequented Waldemar's Barracão together. Zacarias was Waldemar's first student (1942).
-- Zacarias Boa Morte is NOT in the database - in persons backlog as pending.

-- Bigodinho associated_with Boca Rica
-- Recorded CD "Capoeira Angola" together (2000/2002). Both were from Pastinha/Waldemar generation.
-- Boca Rica is in backlog (pending import as Pastinha student).
-- Statement would be: associated_with, properties: association_context = "Recorded CD together"

-- Bigodinho associated_with Lua Rasta
-- Close friend who encouraged Bigodinho's return to capoeira in 1997, organized 2007 tribute.
-- Lua Rasta is NOT in the database - needs to be added to persons backlog.

-- Bigodinho founded Grupo Resistência
-- Founded/coordinated this group in Lapinha, Salvador in the 1960s.
-- Grupo Resistência is in groups backlog (pending import).

-- Bigodinho member_of Viva Bahia (Grupo Folclórico)
-- Participated in this folkloric group coordinated by Emília Biancardi.
-- Viva Bahia is in groups backlog (pending import).
