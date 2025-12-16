-- ============================================================
-- STATEMENTS FOR: Mucungê
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Mucungê is the SUBJECT.
-- ============================================================

-- Mucungê associated_with Waldemar (worked in bateria at his Barracão)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Worked in bateria at Waldemar''s Barracão in Liberdade, Salvador alongside Bugalho, Zacarias, and Ananias"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://sites.google.com/view/raridadesdacapoeira/mestre-ananias',
  E'Mucungê was part of the bateria at Mestre Waldemar''s legendary Barracão in the Liberdade neighborhood of Salvador during the 1950s, before migrating to Rio de Janeiro.',
  E'Mucungê fazia parte da bateria no lendário Barracão de Mestre Waldemar no bairro da Liberdade em Salvador durante os anos 1950, antes de migrar para o Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Onça Preta (co-founder of Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Co-founders of Grupo Filhos de Angola in Rio de Janeiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-51',
  E'Mucungê and Onça Preta were among the six co-founders of Grupo Filhos de Angola in Rio de Janeiro on July 21, 1960.',
  E'Mucungê e Onça Preta estavam entre os seis co-fundadores do Grupo Filhos de Angola no Rio de Janeiro em 21 de julho de 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Onça Preta' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Roque (co-founder of Filhos de Angola; taught him berimbau)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Co-founders of Grupo Filhos de Angola; Mucungê taught Roque berimbau"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Mucungê co-founded Filhos de Angola with Roque and taught him to play berimbau. Roque explicitly credits Mucungê for his berimbau skills.',
  E'Mucungê co-fundou o Filhos de Angola com Roque e o ensinou a tocar berimbau. Roque explicitamente credita Mucungê por suas habilidades no berimbau.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Paraná (participated in his 1963 LP recording)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Participated in Paraná''s 1963 CBS album recording as berimbau player"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/m-parana/',
  E'Mucungê was invited by Mestre Paraná to participate in the recording of his 1963 album "Capoeira: Mestre Paraná" on CBS Masterworks.',
  E'Mucungê foi convidado por Mestre Paraná para participar da gravação de seu álbum de 1963 "Capoeira: Mestre Paraná" pela CBS Masterworks.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Paraná' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Zacarias Boa Morte (bateria at Waldemar's; Circo Voador 1984)
-- NOTE: Zacarias Boa Morte not yet in dataset - adding to pending relationships

-- Mucungê associated_with João Pequeno (Circo Voador 1984 event)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Participated together at Mestre Camisa''s event at Circo Voador, Rio de Janeiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-51',
  E'Mucungê participated alongside João Pequeno and Zacarias Boa Morte at Mestre Camisa''s 1984 event at Circo Voador in Rio de Janeiro.',
  E'Mucungê participou ao lado de João Pequeno e Zacarias Boa Morte no evento de Mestre Camisa de 1984 no Circo Voador no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'João Pequeno' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Leopoldina (1997 events in Rio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1997-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Played berimbau together at capoeira events in Rio de Janeiro"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-51',
  E'In 1997, Mucungê was photographed playing berimbau alongside Mestre Leopoldina at Mestre Poraquê''s event in Rio.',
  E'Em 1997, Mucungê foi fotografado tocando berimbau ao lado de Mestre Leopoldina no evento de Mestre Poraquê no Rio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Leopoldina' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê co_founded Filhos de Angola (Rio, 1960)
-- NOTE: Filhos de Angola (Rio, 1960) group not yet in dataset - adding to pending relationships

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mucungê associated_with Zacarias Boa Morte - bateria at Waldemar's + Circo Voador 1984
-- Mucungê associated_with Bugalho - bateria at Waldemar's Barracão
-- Mucungê associated_with Ananias - bateria at Waldemar's Barracão
-- Mucungê co_founded Filhos de Angola (Rio, 1960) - group needs import first
-- Mucungê associated_with Dois de Ouro - co-founder of Filhos de Angola
-- Mucungê associated_with Baleado - co-founder of Filhos de Angola
-- Mucungê associated_with Imagem do Cão - co-founder of Filhos de Angola
-- Mucungê associated_with Mendonça - 1997 event at Mestre Poraquê's
-- Mucungê associated_with Poraquê - 1997 event host
-- Mucungê associated_with Dorado - 1997 Morro da Babilônia
-- Mucungê associated_with Garça - 1997 Morro da Babilônia
-- Mucungê associated_with Guará - 1997 Leme photo
-- ============================================================
