-- ============================================================
-- STATEMENTS FOR: Gildo Alfinete
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Gildo Alfinete is the SUBJECT.
-- ============================================================

-- Gildo Alfinete student_of Pastinha (1959-1981)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966, https://www.capoeirahub.net/mestres/68ab329ac7f660e1a7e643a2-mestre-gildo-alfinete',
  E'Began training at CECA (Centro Esportivo de Capoeira Angola) at Pelourinho 19 in 1959. Received diploma directly from Pastinha in 1963. Remained close disciple until Pastinha''s death on November 13, 1981. One of Pastinha''s most documented students due to his extensive archive of photographs and notebooks.',
  E'Começou a treinar no CECA (Centro Esportivo de Capoeira Angola) no Pelourinho 19 em 1959. Recebeu diploma diretamente de Pastinha em 1963. Permaneceu discípulo próximo até a morte de Pastinha em 13 de novembro de 1981. Um dos alunos mais documentados de Pastinha devido ao seu extenso arquivo de fotografias e cadernos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete received_title_from Pastinha (diploma 1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "capoeirista diploma"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.capoeirahub.net/mestres/68ab329ac7f660e1a7e643a2-mestre-gildo-alfinete',
  E'Received capoeirista diploma from Mestre Pastinha in 1963 after four years of training at CECA. This diploma placed him among Pastinha''s closest students. Exact date within 1963 not documented.',
  E'Recebeu diploma de capoeirista de Mestre Pastinha em 1963 após quatro anos de treinamento no CECA. Este diploma o colocou entre os alunos mais próximos de Pastinha. Data exata dentro de 1963 não documentada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete associated_with João Grande
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  '2015-10-12'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow CECA students and Dakar 1966 delegation members"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-22',
  E'Fellow students at CECA under Mestre Pastinha. Both were members of the historic 1966 Dakar delegation. Performed capoeira together at the First World Festival of Black Arts. Close personal and professional relationship documented through photographs spanning decades, including visits to João Grande''s academy and home. Relationship ended with Gildo''s death in 2015.',
  E'Colegas de treino no CECA sob Mestre Pastinha. Ambos foram membros da histórica delegação de Dakar 1966. Jogaram capoeira juntos no Primeiro Festival Mundial de Artes Negras. Relacionamento pessoal e profissional próximo documentado através de fotografias abrangendo décadas, incluindo visitas à academia e casa de João Grande. Relacionamento encerrado com a morte de Gildo em 2015.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete associated_with João Pequeno
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  '2011-12-09'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow CECA students under Mestre Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://cecab.org.br/palavras-chave/mestre-gildo-alfinete/',
  E'Fellow students at CECA under Mestre Pastinha. Attended João Pequeno''s 90th birthday celebration at Forte da Capoeira in Salvador. Close members of Pastinha''s inner circle. Relationship ended with João Pequeno''s death in December 2011.',
  E'Colegas de treino no CECA sob Mestre Pastinha. Participou da celebração do 90º aniversário de João Pequeno no Forte da Capoeira em Salvador. Membros próximos do círculo interno de Pastinha. Relacionamento encerrado com a morte de João Pequeno em dezembro de 2011.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete associated_with Gato Preto
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow members of Dakar 1966 delegation"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966',
  E'Fellow members of the 1966 Dakar delegation for the First World Festival of Black Arts. Both played in the bateria during performances. Multiple photographs document them performing together at Morro do Gato, Mercado Modelo, and other locations with different instrumental configurations.',
  E'Membros da delegação de Dakar 1966 para o Primeiro Festival Mundial de Artes Negras. Ambos tocaram na bateria durante as apresentações. Múltiplas fotografias documentam eles se apresentando juntos no Morro do Gato, Mercado Modelo e outros locais com diferentes configurações instrumentais.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gildo Alfinete associated_with Roberto Satanás - needs import first (Dakar 1966 delegation, 1964 BH trip)
-- Gildo Alfinete associated_with Camafeu de Oxossi - needs import first (Dakar 1966 delegation)
-- Gildo Alfinete associated_with Bola Sete - needs import first (2006 ABCA lecture together)
-- Gildo Alfinete associated_with Genésio Meio-Quilo - needs import (brother, compiled 2020 book)
