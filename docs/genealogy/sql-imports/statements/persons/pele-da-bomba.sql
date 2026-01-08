-- ============================================================
-- STATEMENTS FOR: Pelé da Bomba
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Pelé da Bomba is the SUBJECT.
-- ============================================================

-- Pelé da Bomba student_of Bugalho
-- Primary teacher-student relationship from 1946 at Mercado Modelo ramp
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1946-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-20, portalcapoeira.com, esquiva.wordpress.com',
  E'Pelé da Bomba began learning capoeira at age 12 (1946) with Mestre Bugalho at the ramp of the old Mercado Modelo in Salvador. Bugalho, a dock worker, taught him to gingar during rest hours and on moonlit nights at Praia da Preguiça. Pelé said: "Segui a tradição do meu mestre, Bugalho, um grande tocador de berimbau. Ele era um dos melhores." (I followed my master''s tradition, Bugalho, a great berimbau player. He was one of the best.)',
  E'Pelé da Bomba começou a aprender capoeira aos 12 anos (1946) com Mestre Bugalho na rampa do antigo Mercado Modelo em Salvador. Bugalho, um carregador de embarcações, ensinava-o a gingar durante as horas de descanso e nas noites de lua na Praia da Preguiça. Pelé disse: "Segui a tradição do meu mestre, Bugalho, um grande tocador de berimbau. Ele era um dos melhores."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Bugalho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba trained_under Waldemar
-- Frequented Waldemar's barracão for rodas; not primary student but regular attendee
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com, esquiva.wordpress.com',
  E'Pelé da Bomba frequented Mestre Waldemar''s legendary barracão in Pero Vaz (Corta Braço), Liberdade neighborhood. When Pelé arrived, Waldemar would greet him: "Lá vem Satanás!" (Here comes Satan!). He participated in the rodas but Bugalho was his primary teacher.',
  E'Pelé da Bomba frequentava o lendário barracão de Mestre Waldemar em Pero Vaz (Corta Braço), bairro da Liberdade. Quando Pelé chegava, Waldemar o cumprimentava: "Lá vem Satanás!". Participava das rodas, mas Bugalho era seu mestre principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Zacarias Boa Morte
-- Attended his Sunday afternoon rodas
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
  '{"association_context": "roda participant"}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com',
  E'Pelé da Bomba attended Sunday afternoon rodas directed by Zacarias Boa Morte in Salvador. He later sang at Zacarias''s funeral and seventh-day mass.',
  E'Pelé da Bomba frequentava as rodas das tardes de domingo dirigidas por Zacarias Boa Morte em Salvador. Posteriormente cantou no funeral e missa de sétimo dia de Zacarias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Zacarias Boa Morte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Canjiquinha
-- Performed together in tourist shows at Praça da Sé
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
  '{"association_context": "performance group colleague"}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, esquiva.wordpress.com',
  E'Pelé da Bomba performed with Mestre Canjiquinha''s group at the Belvedere da Praça da Sé, doing tourist shows featuring capoeira, maculelê, puxada de rede (net pulling), and samba de roda.',
  E'Pelé da Bomba se apresentava com o grupo de Mestre Canjiquinha no Belvedere da Praça da Sé, fazendo shows para turistas com capoeira, maculelê, puxada de rede e samba de roda.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Caiçara
-- Contemporary; sang at Caiçara's funeral
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
  '{"association_context": "contemporary, sang at funeral"}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com',
  E'Pelé da Bomba was a contemporary of Mestre Caiçara. When Caiçara died, Pelé emotionally sang at his funeral and seventh-day mass.',
  E'Pelé da Bomba era contemporâneo de Mestre Caiçara. Quando Caiçara morreu, Pelé cantou emocionado em seu funeral e missa de sétimo dia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Bom Cabrito
-- Contemporary; sang at Bom Cabrito's funeral
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
  '{"association_context": "contemporary, sang at funeral"}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com',
  E'Pelé da Bomba was a contemporary of Mestre Bom Cabrito. When Bom Cabrito died, Pelé emotionally sang at his funeral.',
  E'Pelé da Bomba era contemporâneo de Mestre Bom Cabrito. Quando Bom Cabrito morreu, Pelé cantou emocionado em seu funeral.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Bom Cabrito'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with João Pequeno
-- Both served on ABCA Council of Masters; photographed together
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
  '{"association_context": "ABCA colleagues"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, mapadacapoeira.com.br',
  E'Pelé da Bomba and João Pequeno both served on the ABCA (Associação Brasileira de Capoeira Angola) Council of Masters. They were photographed together at ABCA events. Both operated academies at the Forte de Santo Antônio Além do Carmo.',
  E'Pelé da Bomba e João Pequeno ambos serviram no Conselho de Mestres da ABCA (Associação Brasileira de Capoeira Angola). Foram fotografados juntos em eventos da ABCA. Ambos operavam academias no Forte de Santo Antônio Além do Carmo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Gato Preto
-- Photographed together at ABCA; contemporaries
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
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Gato Preto were contemporaries in Salvador''s capoeira community. They were photographed together at ABCA events.',
  E'Pelé da Bomba e Gato Preto eram contemporâneos na comunidade de capoeira de Salvador. Foram fotografados juntos em eventos da ABCA.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Barba Branca
-- Photographed together; both ABCA members
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
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Barba Branca were photographed together at ABCA events in Salvador.',
  E'Pelé da Bomba e Barba Branca foram fotografados juntos em eventos da ABCA em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Barba Branca'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Boa Gente
-- Photographed together; both ABCA members
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
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Boa Gente were photographed together at ABCA events in Salvador.',
  E'Pelé da Bomba e Boa Gente foram fotografados juntos em eventos da ABCA em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Gildo Alfinete
-- Photographed together at ABCA events
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
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Gildo Alfinete were photographed together at ABCA events in Salvador.',
  E'Pelé da Bomba e Gildo Alfinete foram fotografados juntos em eventos da ABCA em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Índio (Mercado Modelo) student_of Pelé da Bomba
--   Manoel Olímpio de Souza (1955-); student whom Pelé told "You can go into the world, you are a Master of Capoeira"
--   Founded Grupo de Capoeira Oxóssi (1969); pioneer of capoeira in Rio Grande do Sul
--   Already in backlog - when imported, add statement: Índio student_of Pelé da Bomba
--
-- Pelé da Bomba member_of ABCA (Associação Brasileira de Capoeira Angola)
--   Council of Masters member; later president
--   Group in backlog - when imported, add statement
--
-- Pelé da Bomba member_of Viva Bahia
--   Folkloric group founded by Emília Biancardi (1962)
--   Group in backlog - when imported, add statement
