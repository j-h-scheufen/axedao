-- ============================================================
-- STATEMENTS FOR: Canjiquinha
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Canjiquinha is the SUBJECT.
-- ============================================================

-- Canjiquinha student_of Aberrê (1935-1942)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, esquiva.wordpress.com',
  'Canjiquinha began training under Aberrê at age 10 in 1935 at Baixa do Tubo, Matatu Pequeno. Training ended with Aberrê''s death in September 1942.',
  'Canjiquinha começou a treinar com Aberrê aos 10 anos em 1935 na Baixa do Tubo, Matatu Pequeno. O treinamento terminou com a morte de Aberrê em setembro de 1942.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Canjiquinha trained_under Pastinha (1950s - achieved contra-mestre rank)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com',
  'By 1950, Canjiquinha had become a contra-mestre under Mestre Pastinha. He participated in rodas at Pastinha''s academy and traveled with his group to Rio de Janeiro and Porto Alegre in 1959.',
  'Por volta de 1950, Canjiquinha havia se tornado contra-mestre sob Mestre Pastinha. Ele participou de rodas na academia de Pastinha e viajou com seu grupo para Rio de Janeiro e Porto Alegre em 1959.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Canjiquinha associated_with Waldemar (1986 recording partnership)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Recorded landmark LP together at Boca do Rio studio, Salvador. Both described as heirs of capoeira roots from Siri de Mangue and Aberrê"., "pt": "Gravaram LP marcante juntos no estúdio Boca do Rio, Salvador. Ambos descritos como herdeiros das raízes da capoeira de Siri de Mangue e Aberrê".}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1986, Discogs',
  'Canjiquinha and Waldemar recorded a 34-track LP on September 16, 1986 at Boca do Rio studio in Salvador. Liner notes by Mestre Itapoan described them as "heirs of the roots" from masters Siri de Mangue and Aberrê. Chorus included Mestres Itapoan, Suassuna, Ezequiel, and Geni.',
  'Canjiquinha e Waldemar gravaram um LP de 34 faixas em 16 de setembro de 1986 no estúdio Boca do Rio em Salvador. Notas do encarte por Mestre Itapoan os descreveu como "herdeiros das raízes" dos mestres Siri de Mangue e Aberrê. Coro incluiu Mestres Itapoan, Suassuna, Ezequiel e Geni.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Canjiquinha trained_under Zeca do Uruguai (berimbau instruction)
-- Note: Zeca taught Canjiquinha the berimbau, not capoeira movement
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"instruction_type": "berimbau"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  'Canjiquinha learned berimbau from Zeca do Uruguai. He recalled: "He showed me how to play, taught me rhythms and lots of songs... that the berimbau reigns the capoeira roda". This was berimbau instruction specifically, not primary capoeira training (which was under Aberrê).',
  'Canjiquinha aprendeu berimbau com Zeca do Uruguai. Ele lembrava: "Ele me mostrou como tocar, me ensinou ritmos e muitas cantigas... que o berimbau manda na roda de capoeira". Esta foi instrução de berimbau especificamente, não treinamento principal de capoeira (que foi com Aberrê).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have objects that need to be imported first.
-- Once imported, create statements where THAT PERSON is the subject.
--
-- STUDENTS OF CANJIQUINHA (these go in their respective files as "X student_of Canjiquinha"):
-- - Paulo dos Anjos (José Paulo dos Anjos) student_of Canjiquinha - pending import
-- - Geni (José Serafim Ferreira Junior, Madame Geni) student_of Canjiquinha - pending import
-- - Lua Rasta student_of Canjiquinha - already in backlog
-- - Mestre Brasília student_of Canjiquinha - pending import
-- - Antonio Diabo student_of Canjiquinha - pending import
-- - Victor Careca student_of Canjiquinha - pending import
-- - Robertão student_of Canjiquinha - pending import
-- - Manoel Pé de Bode student_of Canjiquinha - pending import
-- - Cristo Seco student_of Canjiquinha - pending import
-- - Burro Inchado student_of Canjiquinha - pending import
--
-- GROUPS FOUNDED/LED BY CANJIQUINHA:
-- - Canjiquinha founded Associação de Capoeira Canjiquinha e seus Amigos (1952) - needs group import
-- - Canjiquinha founded Academia de Canjiquinha e Seus Amigos (1988, Colina do Mar) - needs group import
