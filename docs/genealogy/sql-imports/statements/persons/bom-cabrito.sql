-- ============================================================
-- STATEMENTS FOR: Bom Cabrito
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Bom Cabrito is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- Primary teachers: Cobrinha Verde and Gato Preto
-- ============================================================

-- Bom Cabrito student_of Cobrinha Verde (~1950s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-57',
  E'Primary teacher. Bom Cabrito began training with Cobrinha Verde in the 1950s in Salvador. Cobrinha Verde was one of the legendary Angola mestres who trained under Besouro Mangangá.',
  E'Mestre principal. Bom Cabrito começou a treinar com Cobrinha Verde nos anos 1950 em Salvador. Cobrinha Verde era um dos lendários mestres de Angola que treinou com Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bom Cabrito student_of Gato Preto (~1950s-1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-57',
  E'Primary teacher. Bom Cabrito trained with Gato Preto in the 1950s-1960s. By 1963, he was documented at Gato Preto''s academy at Mirante do Calabar. Gato Preto noted in 1970 that Bom Cabrito "already teaches capoeira there in Faísca."',
  E'Mestre principal. Bom Cabrito treinou com Gato Preto nos anos 1950-1960. Em 1963, foi documentado na academia de Gato Preto no Mirante do Calabar. Gato Preto observou em 1970 que Bom Cabrito "já ensina capoeira lá no Faísca."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- VALE-TUDO / MARTIAL ARTS TRAINING
-- ============================================================

-- Bom Cabrito trained_under Valdemar Santana "Leopardo Negro" (1968, karate/hapkido/vale-tudo)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"context": "Karate, hapkido, and vale-tudo training - not capoeira"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-57',
  E'In 1968, Bom Cabrito expanded his martial arts training, practicing karate, hapkido, and vale-tudo at the academy of Waldemar Santana "Leopardo Negro" (the famous vale-tudo fighter who defeated Hélio Gracie in 1955). This is NOT Mestre Waldemar da Paixão (the Angola mestre from Salvador).',
  E'Em 1968, Bom Cabrito expandiu seu treinamento em artes marciais, praticando karatê, hapkido e vale-tudo na academia de Waldemar Santana "Leopardo Negro" (o famoso lutador de vale-tudo que derrotou Hélio Gracie em 1955). Este NÃO é Mestre Waldemar da Paixão (o mestre de Angola de Salvador).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Leopardo Negro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- Bom Cabrito member_of ABCA (1987-2000)
-- NOTE: Relationship active once ABCA is imported
-- INSERT INTO genealogy.statements ...
-- WHERE s.apelido = 'Bom Cabrito' AND o.name = 'Associação Brasileira de Capoeira Angola'

-- Bom Cabrito founded Centro Cultural de Capoeira Angola Arte e Manha (1993)
-- NOTE: Relationship active once group is imported
-- INSERT INTO genealogy.statements ...
-- WHERE s.apelido = 'Bom Cabrito' AND o.name = 'Centro Cultural de Capoeira Angola Arte e Manha'

-- ============================================================
-- ASSOCIATIONS WITH CONTEMPORARIES
-- ============================================================

-- Bom Cabrito associated_with Waldemar (1984 Circo Voador event)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-11-26'::date, 'month'::genealogy.date_precision,
  '1984-12-02'::date, 'month'::genealogy.date_precision,
  '{"association_context": "I Encontro Nacional de Arte Capoeira, Circo Voador, Rio de Janeiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/waldemar-1984',
  E'Played berimbau together at I Encontro Nacional de Arte Capoeira (Circo Voador, Nov-Dec 1984). Both were among the seven traditional Old Masters from Bahia at this event.',
  E'Tocaram berimbau juntos no I Encontro Nacional de Arte Capoeira (Circo Voador, nov-dez 1984). Ambos estavam entre os sete Velhos Mestres tradicionais da Bahia neste evento.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bom Cabrito associated_with Canjiquinha (1969 Seminar and 1984 Circo Voador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Seminário de Capoeira Campos dos Afonsos (1969) and I Encontro Nacional de Arte Capoeira (1984)"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/gato-1984',
  E'Both participated in the 1969 Seminário de Capoeira at Campos dos Afonsos, Rio de Janeiro. They were also together at the 1984 Circo Voador event as part of the seven traditional Bahian Old Masters.',
  E'Ambos participaram do Seminário de Capoeira de 1969 em Campos dos Afonsos, Rio de Janeiro. Estavam também juntos no evento do Circo Voador de 1984 como parte dos sete Velhos Mestres tradicionais baianos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bom Cabrito associated_with Atenilo (1984 Circo Voador event)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-11-26'::date, 'month'::genealogy.date_precision,
  '1984-12-02'::date, 'month'::genealogy.date_precision,
  '{"association_context": "I Encontro Nacional de Arte Capoeira, Circo Voador, Rio de Janeiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/waldemar-1984',
  E'Both were among the seven traditional Old Masters from Bahia at the 1984 Circo Voador event in Rio de Janeiro.',
  E'Ambos estavam entre os sete Velhos Mestres tradicionais da Bahia no evento do Circo Voador de 1984 no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bom Cabrito associated_with João Pequeno (ABCA leadership)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-07-03'::date, 'year'::genealogy.date_precision,
  '2000-05-22'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "ABCA leadership - João Pequeno as President, Bom Cabrito as Treasurer"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.mapadacapoeira.com.br/descricaopontos.aspx?fk_ponto=12',
  E'Served together on ABCA''s first elected board (1987). João Pequeno was President and Bom Cabrito was Treasurer. They continued as ABCA colleagues until Bom Cabrito''s death in 2000.',
  E'Serviram juntos na primeira diretoria eleita da ABCA (1987). João Pequeno era Presidente e Bom Cabrito era Tesoureiro. Continuaram como colegas na ABCA até a morte de Bom Cabrito em 2000.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bom Cabrito associated_with Curió (ABCA Council of Masters)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "ABCA Council of Masters"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-57',
  E'Both were members of ABCA''s Council of Masters. Documented in numerous photographs together throughout the 1990s.',
  E'Ambos eram membros do Conselho de Mestres da ABCA. Documentados em numerosas fotografias juntos ao longo dos anos 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bom Cabrito' AND o.apelido = 'Curió'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Bom Cabrito associated_with Paulo dos Anjos - ABCA Vice-President (1987), both on first board
-- Bom Cabrito associated_with Nô - ABCA Technical Director (1987), both on first board
-- Bom Cabrito associated_with Renê - ABCA Social Director (1987), both on first board
-- Bom Cabrito associated_with Moa do Katendê - photographed together 1990s
-- Bom Cabrito associated_with Boca Rica - photographed together 1990s
-- Bom Cabrito associated_with Pelé da Bomba - photographed together 1990s
-- Bom Cabrito associated_with Boa Gente - photographed together 1990s
-- Bom Cabrito associated_with Mala - photographed together 1990s
-- Bom Cabrito associated_with Gildo Alfinete - photographed together 1996 at Farol da Barra
-- Bom Cabrito associated_with Ananias - photographed together 1990s
-- Bom Cabrito associated_with Mão Branca - photographed together 1997 in São Paulo
-- Bom Cabrito member_of ABCA - group not yet imported
-- Bom Cabrito founded Centro Cultural de Capoeira Angola Arte e Manha - group not yet imported
