-- ============================================================
-- STATEMENTS FOR: Bruno Hermanny
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Bruno Hermanny is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Bruno Hermanny student_of Sinhozinho
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/',
  'Bruno Hermanny trained under Mestre Sinhozinho at his academies in Ipanema during the mid-1940s alongside his brother Rudolf. He is listed among the notable students on the rohermanny.tripod.com tribute site: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..." While Rudolf became famous as a capoeira fighter representing Sinhozinho, Bruno channeled his athleticism into aquatic sports.',
  'Bruno Hermanny treinou sob Mestre Sinhozinho em suas academias em Ipanema durante meados da década de 1940 ao lado de seu irmão Rudolf. Ele está listado entre os alunos notáveis no site de tributo rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..." Enquanto Rudolf se tornou famoso como lutador de capoeira representando Sinhozinho, Bruno canalizou seu atletismo para esportes aquáticos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bruno Hermanny family_of Rudolf Hermanny (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/; https://pt.wikipedia.org/wiki/Bruno_Hermanny; Diário de Justiça do Rio de Janeiro legal records',
  'Bruno de Otero Hermanny and Rudolf de Otero Hermanny were brothers, both sons of Arthur Hermanny and Elisabeth de Otero. They both trained at Mestre Sinhozinho''s academies in Ipanema during the mid-1940s. While Rudolf became famous as a capoeira fighter, Bruno became a champion in underwater fishing and other aquatic sports. Their sibling relationship is confirmed by legal documents from Diário de Justiça do Rio de Janeiro and their shared surname "de Otero Hermanny".',
  'Bruno de Otero Hermanny e Rudolf de Otero Hermanny eram irmãos, ambos filhos de Arthur Hermanny e Elisabeth de Otero. Ambos treinaram nas academias de Mestre Sinhozinho em Ipanema durante meados da década de 1940. Enquanto Rudolf se tornou famoso como lutador de capoeira, Bruno se tornou campeão em pesca subaquática e outros esportes aquáticos. A relação de irmãos é confirmada por documentos legais do Diário de Justiça do Rio de Janeiro e seu sobrenome compartilhado "de Otero Hermanny".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'Rudolf Hermanny'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bruno Hermanny associated_with Cirandinha (fellow training partner at Sinhozinho's)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "fellow student at Sinhozinho''s academy in Ipanema"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://rohermanny.tripod.com/; https://capoeirahistory.com/mestre/master-sinhozinho/',
  'Bruno Hermanny and Cirandinha (Luiz Pereira de Aguiar) were fellow students at Mestre Sinhozinho''s academies in Ipanema during the mid-1940s. While they trained during the same period, Cirandinha became one of Sinhozinho''s primary fighting representatives alongside Bruno''s brother Rudolf, competing in the 1949 and 1953 challenges.',
  'Bruno Hermanny e Cirandinha (Luiz Pereira de Aguiar) foram colegas alunos nas academias de Mestre Sinhozinho em Ipanema durante meados da década de 1940. Enquanto treinaram no mesmo período, Cirandinha se tornou um dos principais representantes de luta de Sinhozinho ao lado do irmão de Bruno, Rudolf, competindo nos desafios de 1949 e 1953.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'Cirandinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bruno Hermanny associated_with André Jansen (fellow training partner at Sinhozinho's)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "fellow student at Sinhozinho''s academy in Ipanema"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/',
  'Bruno Hermanny and André Jansen were both listed among Sinhozinho''s notable students on rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..."',
  'Bruno Hermanny e André Jansen foram listados entre os alunos notáveis de Sinhozinho em rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'André Jansen'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: The following relationship is FAMILY, not capoeira:
-- Bruno Hermanny family_of Thereza Hermanny - sister (1930-2015), married Tom Jobim; NOT a capoeirista
-- Bruno Hermanny family_of Corina Hermanny Freire - sister; NOT a capoeirista
-- These non-capoeira family relationships are documented in notes but not imported as statements.
