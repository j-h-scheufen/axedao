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

-- ------------------------------------------------------------
-- Gato Preto student_of Eutíquio
-- First teacher (father); trained 1938-1942 until cabeçada incident
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
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; capoeira.online; capoeira-connection.com',
  E'Gato Preto began learning capoeira at age 8 (1938) from his father Eutíquio Lúcio Góes in Santo Amaro da Purificação. Training took place in a small enclosed room where his father would attack with a maculelê stick or machete. Around age 12 (1942), after Gato Preto delivered a powerful cabeçada that knocked his father down, Eutíquio stopped teaching him. Eutíquio himself had learned from his father, the African Oleriano de Góes.',
  E'Gato Preto começou a aprender capoeira aos 8 anos (1938) com seu pai Eutíquio Lúcio Góes em Santo Amaro da Purificação. O treinamento acontecia em um pequeno quarto fechado onde seu pai atacava com bastão de maculelê ou facão. Por volta dos 12 anos (1942), depois que Gato Preto deu uma cabeçada poderosa que derrubou seu pai, Eutíquio parou de ensiná-lo. O próprio Eutíquio havia aprendido com seu pai, o africano Oleriano de Góes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Eutíquio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto family_of Eutíquio (son)
-- José Gabriel Góes was the son of Eutíquio Lúcio Góes
-- ------------------------------------------------------------
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
  '{"relationship_type": "son"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com; capoeira.online; USP Núcleo de Artes Afro-Brasileiras',
  'José Gabriel Góes (Gato Preto) was the son of Eutíquio Lúcio Góes. He stated: "Aprendi capoeira com meu pai" (I learned capoeira from my father). He began training with his father at age 8 in Santo Amaro da Purificação.',
  'José Gabriel Góes (Gato Preto) era filho de Eutíquio Lúcio Góes. Ele afirmou: "Aprendi capoeira com meu pai" (Aprendi capoeira com meu pai). Começou a treinar com seu pai aos 8 anos em Santo Amaro da Purificação.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Eutíquio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Gato Preto family_of Oleriano de Góes (grandson) relationship removed.
-- The grandfather lineage is already established through:
--   Gato Preto -> Eutíquio (son) -> Oleriano de Góes (son)
-- Direct grandson relationship is redundant and can be inferred from the chain.

-- ------------------------------------------------------------
-- Gato Preto trained_under João Catarino (uncle)
-- Uncle, student of Besouro Mangangá, continued teaching after father stopped
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
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com; capoeira.online; capoeira-connection.com',
  E'After Gato Preto''s father Eutíquio stopped teaching him around 1942 (following the cabeçada incident), his uncle João Catarino continued his education. João Catarino was a student of Besouro Mangangá. Gato Preto testified: "Depois veio meu tio, João Catarino, aluno de Besouro, até que ele morreu de derrame, que a turma chamava de congestão" (Then came my uncle, João Catarino, a student of Besouro, until he died of a stroke).',
  E'Depois que o pai de Gato Preto, Eutíquio, parou de ensiná-lo por volta de 1942 (após o incidente da cabeçada), seu tio João Catarino continuou sua educação. João Catarino era aluno de Besouro Mangangá. Gato Preto testemunhou: "Depois veio meu tio, João Catarino, aluno de Besouro, até que ele morreu de derrame, que a turma chamava de congestão".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'João Catarino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto family_of João Catarino (nephew)
-- José Gabriel Góes was the nephew of João Catarino
-- ------------------------------------------------------------
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
  '{"relationship_type": "nephew"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com; capoeira.online; capoeira-connection.com',
  'José Gabriel Góes (Gato Preto) was the nephew of João Catarino. He referred to him as "meu tio" (my uncle). João Catarino was the brother of Eutíquio (Gato Preto''s father), both sons of the African Oleriano de Góes.',
  'José Gabriel Góes (Gato Preto) era sobrinho de João Catarino. Ele se referia a ele como "meu tio". João Catarino era irmão de Eutíquio (pai de Gato Preto), ambos filhos do africano Oleriano de Góes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'João Catarino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto trained_under Léo (São Braz)
-- Trained in São Braz from 1942 as part of weekend training group
-- NOTE: Léo entity uses apelido_context='São Braz' to distinguish from other Léos
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
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/gatopreto; velhosmestres.com/br/gato-1999-4',
  E'In 1942, at around age 12, Gato Preto moved to São Braz where he began studying with Mestre Léo. Léo led a weekend capoeira group that included Messias, Zinho, Genesio, Lao, Tomazinho, Jaime, and Chumbinho. As Gato Preto recalled: "E Léo era o mestre." By then, people already said Gato Preto had nothing left to learn. In 1947, at seventeen, Gato Preto moved to Salvador to train with Cobrinha Verde.',
  E'Em 1942, com cerca de 12 anos, Gato Preto mudou-se para São Braz onde começou a estudar com Mestre Léo. Léo liderava um grupo de capoeira de fim de semana que incluía Messias, Zinho, Genesio, Lao, Tomazinho, Jaime e Chumbinho. Como Gato Preto recordou: "E Léo era o mestre." A essa altura, as pessoas já diziam que Gato Preto não tinha mais nada a aprender. Em 1947, aos dezessete anos, Gato Preto mudou-se para Salvador para treinar com Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Léo' AND o.apelido_context = 'São Braz'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

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
