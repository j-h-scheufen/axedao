-- ============================================================
-- STATEMENTS FOR: João Grande
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where João Grande is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- João Grande student_of Pastinha
-- Primary formal teacher from 1953 until Pastinha's death 1981
-- Became one of "the two most learned students" with João Pequeno
-- Diploma received 1968
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
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia; NEA; Smithsonian; Velhos Mestres; multiple sources',
  'João Grande joined Pastinha''s academy at the Cardeal Pequeno neighborhood of Brotas in 1953 at age 20. João Pequeno had been training with Pastinha for two years prior. Pastinha named him one of "the two most learned students" alongside João Pequeno. In 1970, Pastinha prophesied: "They will be the great capoeiras of the future." Received diploma in 1968. Relationship ended with Pastinha''s death Nov 13, 1981.',
  'João Grande ingressou na academia de Pastinha no bairro Cardeal Pequeno de Brotas em 1953 aos 20 anos. João Pequeno já treinava com Pastinha há dois anos antes. Pastinha o nomeou um dos "dois alunos mais preparados" junto com João Pequeno. Em 1970, Pastinha profetizou: "Eles serão os grandes capoeiras do futuro." Recebeu diploma em 1968. Relação terminou com a morte de Pastinha em 13/11/1981.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande received_title_from Pastinha
-- Diploma (mestre recognition) received in 1968
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "diploma conferral"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia; NEA; Smithsonian; Velhos Mestres',
  'João Grande was awarded his diploma of capoeira from Pastinha in 1968, making him a full-fledged mestre of capoeira angola. This was the formal recognition of his mastery after 15 years of training.',
  'João Grande recebeu seu diploma de capoeira de Pastinha em 1968, tornando-o mestre completo de capoeira angola. Este foi o reconhecimento formal de sua maestria após 15 anos de treinamento.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande trained_under Cobrinha Verde
-- Learned floor-touching mandinga movements from him
-- Also attended his rodas before/during Pastinha academy period
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
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Velhos Mestres; Lalaue; Nossa Tribo; CapoeiraHub',
  'When João Grande arrived in Salvador in 1953, he witnessed his first roda where Cobrinha Verde was present as "one of the most skillful players of that era." Cobrinha Verde was responsible for introducing the act of touching the floor many times as if making sorcery or asking for protection—this floor-touching mandinga movement was later spread by João Grande, who had learned it from Cobrinha Verde. Cobrinha Verde also "shared the work with Mestre Pastinha, where he passed on his knowledge to his students, which included the future masters, João Grande and João Pequeno."',
  'Quando João Grande chegou em Salvador em 1953, testemunhou sua primeira roda onde Cobrinha Verde estava presente como "um dos jogadores mais habilidosos daquela época." Cobrinha Verde foi responsável por introduzir o ato de tocar o chão muitas vezes como se fizesse feitiçaria ou pedisse proteção—esse movimento de mandinga de tocar o chão foi depois difundido por João Grande, que o aprendeu de Cobrinha Verde. Cobrinha Verde também "dividia o trabalho com Mestre Pastinha, onde passou seu conhecimento para seus alunos, que incluíam os futuros mestres, João Grande e João Pequeno."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande trained_under Barbosa
-- Met Barbosa upon arriving in Salvador 1953
-- Barbosa directed him toward João Pequeno and Pastinha
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
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '1953-12-31'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Nossa Tribo; Revista Pesquisa Fapesp; Wikipedia',
  'When João Grande arrived in Salvador at age 20, he met Mestre Barbosa at the roda at Roca do Lobo. He asked Barbosa if he could study capoeira, and Barbosa sent him to João Pequeno, who then sent him to Mestre Pastinha. This was João Grande''s first contact with organized capoeira in Salvador.',
  'Quando João Grande chegou em Salvador aos 20 anos, conheceu Mestre Barbosa na roda de Roca do Lobo. Perguntou a Barbosa se poderia estudar capoeira, e Barbosa o enviou a João Pequeno, que então o enviou a Mestre Pastinha. Este foi o primeiro contato de João Grande com a capoeira organizada em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande'
  AND o.apelido = 'Barbosa' AND o.apelido_context = 'Cachoeira/Largo Dois de Julho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande associated_with João Pequeno
-- Fellow student of Pastinha; the "two most learned students"
-- Together became principal heirs of Angola tradition
-- Traveled together to Dakar 1966
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
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow students of Pastinha; together they were the two principal heirs of the Angola tradition"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia; NEA; Smithsonian; Velhos Mestres; CECA official',
  'João Pequeno had been training with Pastinha for two years when João Grande arrived. João Pequeno directed João Grande to Pastinha''s academy. Together they became Pastinha''s "two most learned students." In 1970, Pastinha declared: "They will be the great capoeiras of the future and for this I worked and fought with them and for them. They will be true masters, not improvised teachers." Both traveled to Dakar 1966 with Pastinha. When Pastinha grew blind, the two Joãos ran the academy together. João Grande was nicknamed to distinguish him from the shorter João Pequeno.',
  'João Pequeno já treinava com Pastinha há dois anos quando João Grande chegou. João Pequeno direcionou João Grande para a academia de Pastinha. Juntos tornaram-se os "dois alunos mais preparados" de Pastinha. Em 1970, Pastinha declarou: "Eles serão os grandes capoeiras do futuro e para isso trabalhei e lutei com eles e por eles. Serão mestres mesmo, não professores de improviso." Ambos viajaram para Dakar 1966 com Pastinha. Quando Pastinha ficou cego, os dois Joãos dirigiam a academia juntos. João Grande recebeu o apelido para distingui-lo do mais baixo João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande associated_with Gato Preto
-- Traveled together to Dakar 1966 as part of Brazilian delegation
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
  '1966-04-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow members of Brazilian delegation to 1966 Dakar Festival of Black Arts"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Wikipedia; Smithsonian',
  'João Grande and Gato Preto traveled together as part of the six-person Brazilian capoeira delegation to the First World Festival of Black Arts in Dakar, Senegal, April 1-24, 1966. The delegation included Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. Photos show them performing together at Daniel Soreno Theatre.',
  'João Grande e Gato Preto viajaram juntos como parte da delegação brasileira de seis capoeiristas para o Primeiro Festival Mundial de Artes Negras em Dakar, Senegal, 1-24 de abril de 1966. A delegação incluía Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Fotos mostram-nos se apresentando juntos no Teatro Daniel Soreno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- João Grande associated_with Roberto Satanás - Traveled together to Dakar 1966. Needs import first.
-- João Grande associated_with Gildo Alfinete - Traveled together to Dakar 1966. Needs import first.
-- João Grande associated_with Camafeu de Oxossi - Traveled together to Dakar 1966. Needs import first.
-- João Grande associated_with Menino Gordo - Present at first roda João Grande witnessed in Salvador. Needs import first.
-- João Grande member_of Viva Bahia - Toured Europe/Middle East 1970s with Emília Biancardi's folk group. Group not in dataset.
-- João Grande member_of GCAP - Taught with Grupo Capoeira Angola Pelourinho mid-1980s after coming out of retirement. Group not in dataset.
-- João Grande founded Capoeira Angola Center - Founded 1990 in New York City. Group not in dataset.
-- João Grande student (Moraes) - RESOLVED: see moraes.sql (Moraes student_of João Grande)
-- João Grande student (Cobra Mansa) - RESOLVED: see cobra-mansa.sql (Cobra Mansa trained_under João Grande)
-- João Grande student (Jurandir Santos) - Listed as his son and student per CapoeiraHub. Jurandir not yet imported.
-- João Grande student (Marquinho) - Student who began training in 2000 per CapoeiraHub. Marquinho not yet imported.
