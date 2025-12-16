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

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Traíra trained_under Juvencio - PENDING
-- First capoeira encounters ~1938 in São Felix rodas
-- Juvencio was a dock worker who held informal rodas during festivals
-- Object 'Juvencio' needs import first - see persons-backlog.md

-- Traíra trained_under Severo do Pelourinho - PENDING
-- Mentioned by Traíra as another teacher
-- Little is known about Severo do Pelourinho
-- Object 'Severo do Pelourinho' needs import first - see persons-backlog.md

-- Traíra associated_with Gato Preto - PENDING
-- Recorded LP together (1962)
-- Object 'Gato Preto' needs import first - see persons-backlog.md

-- Note: Barba Branca's student_of Traíra relationship should be in barba-branca.sql
-- when that person is imported (per ownership rule: statement goes in subject's file)
