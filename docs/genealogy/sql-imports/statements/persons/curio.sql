-- ============================================================
-- STATEMENTS FOR: Curió
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Curió is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- Primary teacher: Mestre Pastinha (joined CECA 1968)
-- Family training: Father and grandfather (from 1943)
-- ============================================================

-- Curió student_of Pastinha (joined CECA April 10, 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-04-10'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'On April 10, 1968, Curió formally joined Mestre Pastinha''s CECA (Centro Esportivo de Capoeira Angola) in Pelourinho. He absorbed not only technique but the philosophical foundations of Capoeira Angola. He describes himself as "a faithful custodian of capoeira angola''s immaterial knowledge".',
  E'Em 10 de abril de 1968, Curió ingressou formalmente no CECA (Centro Esportivo de Capoeira Angola) de Mestre Pastinha no Pelourinho. Ele absorveu não apenas técnica, mas os fundamentos filosóficos da Capoeira Angola. Ele se descreve como "um fiel guardião do conhecimento imaterial da capoeira angola".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with Waldemar (1950s roda participation)
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
  NULL, NULL,
  '{"association_context": "roda_participation"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió appears in 1954 photographs at Mestre Waldemar''s legendary barracão in Liberdade, captured by French photographer Marcel Gautherot (IMS collection). This places him among the vibrant roda scene of 1950s Salvador.',
  E'Curió aparece em fotografias de 1954 no lendário barracão de Mestre Waldemar na Liberdade, capturadas pelo fotógrafo francês Marcel Gautherot (coleção IMS). Isso o coloca entre a vibrante cena de rodas da Salvador dos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with Cobrinha Verde (1980 seminar, contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-06-04'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "seminar_participants"}'::jsonb, 'verified'::genealogy.confidence,
  'http://velhosmestres.com/en/cobrinha-1980',
  E'Curió participated alongside Cobrinha Verde in Frede Abreu''s First Regional Capoeira Seminar (June 4-8, 1980) in Barris, Salvador. This event helped "rediscover" Cobrinha Verde and reunited the old guard of Capoeira Angola.',
  E'Curió participou ao lado de Cobrinha Verde no Primeiro Seminário Regional de Capoeira de Frede Abreu (4-8 de junho de 1980) em Barris, Salvador. Este evento ajudou a "redescobrir" Cobrinha Verde e reuniu a velha guarda da Capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with João Grande (fellow Pastinha students, 1980 seminar)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow_students_of_Pastinha"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió and João Grande were fellow disciples of Mestre Pastinha at CECA. They participated together in the 1980 First Regional Capoeira Seminar and worked alongside each other in Frede Abreu''s project to bring capoeira into Salvador''s municipal schools.',
  E'Curió e João Grande foram companheiros discípulos de Mestre Pastinha no CECA. Participaram juntos no Primeiro Seminário Regional de Capoeira de 1980 e trabalharam lado a lado no projeto de Frede Abreu para levar a capoeira às escolas municipais de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with João Pequeno (fellow Pastinha students, 1988 Velha Guarda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow_students_of_Pastinha"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-25',
  E'Curió and João Pequeno were fellow disciples of Mestre Pastinha at CECA. In 1988, they participated together in the Velha Guarda event in Florianópolis with Mestres Bobó, Nó, and Boa Gente. Mestre Pintor was also graduated by João Pequeno while training under Curió during his Bahia period.',
  E'Curió e João Pequeno foram companheiros discípulos de Mestre Pastinha no CECA. Em 1988, participaram juntos no evento Velha Guarda em Florianópolis com os Mestres Bobó, Nó e Boa Gente. Mestre Pintor também foi graduado por João Pequeno enquanto treinava com Curió durante seu período na Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- NOTE: ECAIG (Escola de Capoeira Angola Irmãos Gêmeos) not yet imported
-- Curió founded ECAIG - group not yet imported
-- Curió leads ECAIG - group not yet imported
-- Curió member_of CECA - group not yet imported
-- Curió member_of ABCA (director 2000-2002) - group not yet imported

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- NOTE: Curió family_of Curió Velho (grandchild) relationship removed.
-- The grandfather lineage is already established through:
--   Curió -> Malvadeza (child) -> Curió Velho (child)
-- Direct grandchild relationship is redundant and can be inferred from the chain.

-- Curió family_of Malvadeza (child relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "child"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Mestre Curió is the son of José Martins dos Santos (Malvadeza). His father taught him capoeira beginning in 1943, when Curió was six years old.',
  E'Mestre Curió é filho de José Martins dos Santos (Malvadeza). Seu pai lhe ensinou capoeira a partir de 1943, quando Curió tinha seis anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió family_of Pequena (child relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "child"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Mestre Curió is the son of Maria Bispo (Pequena). His mother was also a capoeirista from a family of angoleiros in Santo Amaro. She gave birth to him within a roda de capoeira.',
  E'Mestre Curió é filho de Maria Bispo (Pequena). Sua mãe também era capoeirista de uma família de angoleiros em Santo Amaro. Ela deu à luz a ele dentro de uma roda de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Pequena'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió student_of Curió Velho (grandfather, family training from 1943)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió began learning capoeira from his grandfather Pedro Virício (Curió Velho) and father in 1943, when he was six years old. Locals said "It''s the same game as grandfather!" when watching young Curió play.',
  E'Curió começou a aprender capoeira com seu avô Pedro Virício (Curió Velho) e pai em 1943, quando tinha seis anos. Os locais diziam "É o mesmo jogo do avô!" ao ver o jovem Curió jogar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió student_of Malvadeza (father, family training from 1943)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió began learning capoeira from his father José Martins dos Santos (Malvadeza) and grandfather in 1943, when he was six years old. His father was also a violeiro who accompanied Mestre Pastinha musically.',
  E'Curió começou a aprender capoeira com seu pai José Martins dos Santos (Malvadeza) e avô em 1943, quando tinha seis anos. Seu pai também era violeiro que acompanhava Mestre Pastinha musicalmente.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with Gigante (1980 seminar participant)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1980 capoeira seminar participants"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Both participated in a 1980 capoeira seminar together.',
  E'Ambos participaram de um seminário de capoeira em 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Gigante'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with Boca Rica (1988 Fortaleza Velha Guarda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1988 Fortaleza Velha Guarda event"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Both participated in the 1988 Fortaleza Velha Guarda (Old Guard) event.',
  E'Ambos participaram do evento Velha Guarda em Fortaleza em 1988.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Boca Rica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Curió associated_with Bobó - 1988 Florianópolis Velha Guarda, needs import
-- Curió founded ECAIG - group not yet imported
-- Curió leads ECAIG - group not yet imported
-- Curió member_of CECA - group not yet imported
-- Curió member_of ABCA - group not yet imported

-- ============================================================
-- NOTE: Relationships where Curió is OBJECT (to be added to other person files):
-- ============================================================
-- Pintor trained_under Curió (Bahia training period) - to add to pintor.sql
-- Mestra Jararaca student_of Curió - Jararaca not yet imported
-- Mestre Augusto Januário student_of Curió - not yet imported
-- Mestre Marcelo Angola student_of Curió (began August 1985) - not yet imported
