-- ============================================================
-- STATEMENTS FOR: Valdemar Santana (Leopardo Negro)
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Valdemar Santana is the SUBJECT.
-- Note: Valdemar trained under Hélio Gracie (BJJ) and Mestre Bimba (capoeira).
-- He is primarily a vale-tudo fighter but significant for connecting
-- Bahian capoeira with Rio de Janeiro competitive fighting.
-- ============================================================

-- Valdemar Santana trained_under Mestre Bimba (capoeira, youth in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraWiki, simonbjj.com, academia-lab.com, historyoffighting.com',
  E'Waldemar Santana trained Capoeira Regional under Mestre Bimba in Salvador during his youth. Multiple sources confirm this, describing him as training "during his youth in Salvador under the guidance of Mestre Manoel dos Reis Machado, known as Mestre Bimba". This capoeira foundation became the base for his later vale-tudo fighting career.',
  E'Waldemar Santana treinou Capoeira Regional com Mestre Bimba em Salvador durante sua juventude. Múltiplas fontes confirmam isso, descrevendo-o treinando "durante sua juventude em Salvador sob orientação de Mestre Manoel dos Reis Machado, conhecido como Mestre Bimba". Essa base de capoeira se tornou a fundação para sua posterior carreira de vale-tudo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopardo Negro' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdemar Santana associated_with Artur Emídio (brought him to Rio)
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
  '{"association_context": "Brought Artur Emídio from Bahia to Rio de Janeiro; known for famous photo of Santana holding Emídio overhead"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com, leopoldina.md, genaro.md, historyoffighting.com',
  E'Valdemar Santana was instrumental in bringing Artur Emídio from Bahia to Rio de Janeiro around 1954-1955. A famous photograph from the early 1960s shows Santana holding Emídio above his head with one hand. They shared an interest in capoeira and other martial arts, meeting with other young fighters like Mestre Genaro in the Rio martial arts scene.',
  E'Valdemar Santana foi fundamental para trazer Artur Emídio da Bahia para o Rio de Janeiro por volta de 1954-1955. Uma famosa fotografia do início dos anos 1960 mostra Santana segurando Emídio acima da cabeça com uma mão. Eles compartilhavam interesse pela capoeira e outras artes marciais, encontrando-se com outros jovens lutadores como Mestre Genaro na cena de artes marciais do Rio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopardo Negro' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdemar Santana family_of Valdo Santana (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources confirm brothers; Revista Carioca de Educação Física (2020)',
  E'Waldemar and Valdo Santana were brothers. Together they co-founded Academia Santana in Rio de Janeiro around 1955-1956, located above Bar Amarelinho in Cinelândia. The academy trained early Grupo Senzala founders.',
  E'Waldemar e Valdo Santana eram irmãos. Juntos co-fundaram a Academia Santana no Rio de Janeiro por volta de 1955-1956, localizada acima do Bar Amarelinho na Cinelândia. A academia treinou os primeiros fundadores do Grupo Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopardo Negro' AND o.apelido = 'Valdo Santana'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Valdemar Santana taught Mestre Pombo de Ouro (met 1969 in Manaus)
-- Pombo de Ouro NOT in dataset - needs import
-- Source: lalaue.com - "Met Mestre Valdemar Santana 'Leopardo Negro' in Manaus in 1969, who considered him to be his other Mestre"
-- Note: Predicate unclear - was it trained_under or student_of? Pombo considered Santana "his other Mestre"

-- Valdemar Santana discovered/mentored Rei Zulu (Casemiro Nascimento Martins, 1980)
-- Rei Zulu NOT in dataset - needs import (vale-tudo fighter, not capoeirista)
-- Note: Rei Zulu was a tarracá fighter, not primarily capoeira

-- ============================================================
-- RELATIONSHIPS WHERE VALDEMAR SANTANA IS OBJECT
-- (These belong in the SUBJECT's statement files)
-- ============================================================

-- Boa Gente trained_under Leopardo Negro (~1970s, vale-tudo)
-- → Goes in boa-gente.sql (already noted as pending there)

-- Bom Cabrito trained_under Leopardo Negro (1968, karate/hapkido/vale-tudo)
-- → Goes in bom-cabrito.sql

-- Paulo Flores trained_under Academia Santana (1962)
-- → Goes in paulo-flores.sql

-- Gato (Senzala) trained_under Academia Santana (early 1960s)
-- → Goes in gato-senzala.sql
