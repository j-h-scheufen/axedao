-- ============================================================
-- STATEMENTS FOR: Traíra
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Traíra is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Traíra student_of Waldemar
-- Started ~1947 at Escola de Capoeira Angola, Liberdade, Salvador
-- Primary formal teacher - Traíra managed Waldemar's roda
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki; multiple sources',
  'Traíra began formal training with Waldemar in 1947. He became so trusted that he managed Waldemar''s roda: "The late Traíra is who managed the roda. I''d arrive, give orders, then have beer" (Waldemar). Training continued until Traíra''s death ~1975.',
  'Traíra começou o treinamento formal com Waldemar em 1947. Tornou-se tão confiável que administrava a roda de Waldemar: "O finado Traíra é que tomava conta da roda. Eu chegava, dava as ordens e ia tomar cerveja" (Waldemar). Treinamento continuou até a morte de Traíra ~1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Cobrinha Verde
-- Recorded LP together (1962); contemporaries at Market Ramp rodas
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
  '{"association_context": "Recorded LP ''Capoeira da Bahia'' together (1962); photographed together at Market Ramp roda; contemporaries in Bahian capoeira Angola scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1962; multiple sources',
  'Recorded LP "Capoeira da Bahia" together with Cobrinha Verde and Gato Preto (1962). Both appear in LP booklet photos at Market Ramp roda. Both were prominent angoleiros in Salvador''s mid-century capoeira scene.',
  'Gravaram juntos o LP "Capoeira da Bahia" com Cobrinha Verde e Gato Preto (1962). Ambos aparecem nas fotos do encarte na roda da Rampa do Mercado. Ambos eram angoleiros proeminentes na cena da capoeira de Salvador em meados do século.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Bimba
-- Both appeared in film "Vadiação" (1954)
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
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both appeared in pioneering film ''Vadiação'' (1954) by Alexandre Robatto Filho; contemporaries in Salvador capoeira scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; film documentation',
  'Both appeared in the pioneering capoeira film "Vadiação" (1954) by Alexandre Robatto Filho. Though Bimba taught Regional and Traíra practiced Angola under Waldemar, they were contemporaries in Salvador''s capoeira scene.',
  'Ambos apareceram no pioneiro filme de capoeira "Vadiação" (1954) de Alexandre Robatto Filho. Embora Bimba ensinasse Regional e Traíra praticasse Angola com Waldemar, eram contemporâneos na cena da capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Pastinha
-- Jorge Amado compared them as the two most elegant players
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
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Contemporaries; Jorge Amado wrote (1945) that only Pastinha could match Traíra in beauty of movements and agility"}'::jsonb,
  'likely'::genealogy.confidence,
  'Jorge Amado, Bahia de Todos os Santos (1945)',
  'Jorge Amado wrote in 1945: "only Pastinha can compete with him [Traíra] in the beauty of movements, in agility, in the quickness of strikes." Both were leading Angola practitioners in Salvador, though no direct training relationship is documented.',
  'Jorge Amado escreveu em 1945: "só mesmo Pastinha pode competir com ele [Traíra] na beleza dos movimentos, na agilidade, na rigidez dos golpes." Ambos eram importantes praticantes de Angola em Salvador, embora nenhuma relação direta de treinamento seja documentada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra trained_under Juvêncio
-- First capoeira encounters ~1938 in São Félix rodas
-- Informal training before formal study with Waldemar
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
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Velhos Mestres; Capoeira Connection (Ananias interview); CapoeiraWiki',
  'Traíra''s first exposure to capoeira was in the rodas of Mestre Juvêncio in São Félix, around 1938. Mestre Ananias encountered Traíra at these gatherings on the docks during festivals. Informal training before his formal study with Waldemar beginning in 1947.',
  'O primeiro contato de Traíra com a capoeira foi nas rodas de Mestre Juvêncio em São Félix, por volta de 1938. Mestre Ananias encontrou Traíra nesses encontros nas docas durante as festas. Treinamento informal antes de seu estudo formal com Waldemar começando em 1947.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra'
  AND o.apelido = 'Juvêncio' AND o.apelido_context = 'São Félix'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Gato Preto
-- Recorded LP "Capoeira" together (1962); contemporaries in Salvador
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
  '{"association_context": "Recorded LP ''Capoeira'' together (1962) at Waldemar''s barracão with Cobrinha Verde; photographed together at Market Ramp roda"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/gato-1962; multiple sources',
  E'Recorded historic LP "Capoeira" (1962) together with Gato Preto and Cobrinha Verde at Mestre Waldemar''s barracão. Photos taken at Rampa do Mercado Modelo. Both were prominent angoleiros in Salvador.',
  E'Gravaram juntos o histórico LP "Capoeira" (1962) com Gato Preto e Cobrinha Verde no barracão de Mestre Waldemar. Fotos tiradas na Rampa do Mercado Modelo. Ambos eram angoleiros proeminentes em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra trained_under Severo do Pelourinho
-- Mentioned by Traíra as another teacher; timing unknown
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
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'unverified'::genealogy.confidence,
  'velhosmestres.com/en/featured-37 (Traíra profile)',
  'Traíra "later told that had also learned from Severo do Pelourinho" according to velhosmestres.com. No other details documented - neither timing, location, nor nature of training. Severo is a Layer Zero figure known only from this single indirect reference.',
  'Traíra "mais tarde disse que também aprendeu com Severo do Pelourinho" segundo velhosmestres.com. Nenhum outro detalhe documentado - nem momento, local, nem natureza do treinamento. Severo é uma figura de Camada Zero conhecida apenas por esta única referência indireta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Severo do Pelourinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- GROUP RELATIONSHIPS
-- Traíra member_of Roda de São Félix - PENDING
-- Participated in Juvêncio's dock rodas (~1938) before formal training with Waldemar
-- Group 'Roda de São Félix (Juvêncio)' needs import first - see groups-backlog.md

-- Note: Barba Branca's student_of Traíra relationship should be in barba-branca.sql
-- when that person is imported (per ownership rule: statement goes in subject's file)
