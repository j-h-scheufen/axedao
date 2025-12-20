-- ============================================================
-- STATEMENTS FOR: Gato Preto
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Gato Preto is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Gato Preto student_of Cobrinha Verde
-- Primary mentor from age 17 in Salvador (1947)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki; multiple sources',
  'At seventeen (1947), Gato Preto moved to Salvador and became a disciple of Mestre Cobrinha Verde, also from Santo Amaro. This was his primary mentor relationship. Later served as contra-mestre de bateria at Cobrinha Verde''s academy (1952-1954). Relationship continued until Cobrinha Verde''s death in 1983.',
  'Aos dezessete anos (1947), Gato Preto mudou-se para Salvador e tornou-se discípulo de Mestre Cobrinha Verde, também de Santo Amaro. Esta foi sua principal relação de mentoria. Depois serviu como contra-mestre de bateria na academia de Cobrinha Verde (1952-1954). O relacionamento continuou até a morte de Cobrinha Verde em 1983.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto trained_under Waldemar
-- Trained under Waldemar da Paixão; frequented his barracão
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraWiki; velhosmestres.com; Capoeira Online',
  'Gato Preto trained under Mestre Waldemar da Paixão. The 1962 LP "Capoeira" was recorded at Waldemar''s barracão. Waldemar described him as "a good fellow" and noted his father Eutíquio was "a good capoeira master."',
  'Gato Preto treinou com Mestre Waldemar da Paixão. O LP "Capoeira" de 1962 foi gravado no barracão de Waldemar. Waldemar o descreveu como "um bom sujeito" e observou que seu pai Eutíquio era "um bom mestre de capoeira."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto trained_under Pastinha
-- Served as contra-mestre de bateria (1950-1951)
-- ------------------------------------------------------------
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
  '1951-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki',
  'Gato Preto served as contra-mestre de bateria (assistant master of the percussion ensemble) at Mestre Pastinha''s academy from 1950-1951. Later accompanied Pastinha to Dakar in 1966 as part of the Brazilian delegation.',
  'Gato Preto serviu como contra-mestre de bateria na academia de Mestre Pastinha de 1950-1951. Depois acompanhou Pastinha a Dacar em 1966 como parte da delegação brasileira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Traíra
-- Recorded LP "Capoeira" together (1962)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Recorded LP ''Capoeira'' together (1962) at Waldemar''s barracão with Cobrinha Verde; contemporaries in Salvador Angola capoeira scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/gato-1962; multiple sources',
  'Recorded historic LP "Capoeira" (1962) together with Traíra and Cobrinha Verde at Mestre Waldemar''s barracão. Photos taken at Rampa do Mercado Modelo. Both were prominent angoleiros in Salvador.',
  'Gravaram juntos o histórico LP "Capoeira" (1962) com Traíra e Cobrinha Verde no barracão de Mestre Waldemar. Fotos tiradas na Rampa do Mercado Modelo. Ambos eram angoleiros proeminentes em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Bimba
-- Contemporaries in Salvador; compared to legendary masters
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Contemporaries in Salvador capoeira scene; 1976 article described Gato Preto as comparable to legendary masters Bimba, Pastinha, Cobrinha Verde, and Besouro"}'::jsonb,
  'likely'::genealogy.confidence,
  'Correio Braziliense 1976; velhosmestres.com',
  'Contemporaries in Salvador. A 1976 newspaper article described Gato Preto as comparable to legendary masters Bimba, Pastinha, Cobrinha Verde, and Besouro.',
  'Contemporâneos em Salvador. Um artigo de jornal de 1976 descreveu Gato Preto como comparável aos lendários mestres Bimba, Pastinha, Cobrinha Verde e Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Besouro Mangangá
-- Connected through uncle João Catarino (Besouro's student)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Connected through lineage: Gato Preto''s uncle João Catarino was a student of Besouro Mangangá; both from Santo Amaro da Purificação"}'::jsonb,
  'likely'::genealogy.confidence,
  'CapoeiraWiki; velhosmestres.com',
  'Gato Preto''s uncle João Catarino was a student of Besouro Mangangá. Both Besouro and Gato Preto were from Santo Amaro da Purificação. Through his uncle, Gato Preto inherited some of Besouro''s teachings.',
  'O tio de Gato Preto, João Catarino, era aluno de Besouro Mangangá. Tanto Besouro quanto Gato Preto eram de Santo Amaro da Purificação. Através de seu tio, Gato Preto herdou alguns dos ensinamentos de Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Canjiquinha
-- 1970 Berimbau de Ouro competition rivals
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Competitors at 1970 Berimbau de Ouro competition; both prominent berimbau masters of their era"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki',
  E'Both competed in the 1970 Berimbau de Ouro competition in Salvador. Both were renowned berimbau masters of their generation, representing different lineages of the Angola tradition.',
  E'Ambos competiram no concurso Berimbau de Ouro de 1970 em Salvador. Ambos eram renomados mestres de berimbau de sua geração, representando diferentes linhagens da tradição Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Vermelho 27
-- 1970 Berimbau de Ouro competition rivals
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Competitors at 1970 Berimbau de Ouro competition"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki',
  E'Both competed in the 1970 Berimbau de Ouro competition in Salvador. Vermelho 27 was a student of Bimba while Gato Preto came from the Angola lineage.',
  E'Ambos competiram no concurso Berimbau de Ouro de 1970 em Salvador. Vermelho 27 era aluno de Bimba enquanto Gato Preto vinha da linhagem Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- PERSON RELATIONSHIPS - TEACHERS (not in dataset)

-- Gato Preto student_of Eutíquio Lúcio Góes (father) - PENDING
-- His father taught him from age 8 (1938) until the powerful cabeçada incident
-- Object 'Eutíquio Lúcio Góes' needs import - add to backlog? Historical figure, not mestre

-- Gato Preto trained_under João Catarino (uncle) - PENDING
-- Uncle, student of Besouro Mangangá, continued teaching after father stopped
-- Object 'João Catarino' needs import - add to backlog

-- Gato Preto trained_under Léo (Mestre Léo from São Braz) - PENDING
-- Trained with Léo in São Braz from 1942
-- Object 'Léo' needs import - add to backlog

-- PERSON RELATIONSHIPS - STUDENTS (not in dataset)

-- Note: Student relationships go in the STUDENT's file per ownership rule.
-- These students need to be imported and their files should contain:
-- - Mestre Mau (Marcelino) student_of Gato Preto
-- - Mestre Boa Gente student_of Gato Preto
-- - Contramestre Pinguim student_of Gato Preto
-- - Mestre Zeca (son) student_of Gato Preto
-- - Mestre Gato II (Sinésio, son) student_of Gato Preto
-- - Mestre Zé Baiano trained_under Gato Preto (from 1984)

-- PERSON RELATIONSHIPS - ASSOCIATES (Dakar 1966 delegation - covered from other sides)
-- Note: The following Dakar 1966 relationships are already defined in other files:
-- - Roberto Satanás associated_with Gato Preto (in roberto-satanas.sql)
-- - Camafeu de Oxossi associated_with Gato Preto (in camafeu-de-oxossi.sql)
-- - Gildo Alfinete associated_with Gato Preto (in gildo-alfinete.sql)
-- - João Grande associated_with Gato Preto (in joao-grande.sql)

-- GROUP RELATIONSHIPS (not in dataset)

-- Gato Preto founded Academia de Capoeira Baiana - PENDING
-- Founded his own academy in 1955
-- Group needs import

-- Gato Preto teaches_at CECA - PENDING
-- Served as contra-mestre de bateria at Pastinha's academy (1950-1951)
-- Group 'CECA' needs import - see groups-backlog.md

-- Gato Preto teaches_at Centro Esportivo de Capoeira Angola Dois de Julho - PENDING
-- Served as contra-mestre de bateria at Cobrinha Verde's academy (1952-1954)
-- Group needs import - see groups-backlog.md
