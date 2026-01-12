-- ============================================================
-- STATEMENTS FOR: Zé Baiano
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Zé Baiano is the SUBJECT.
-- ============================================================

-- Zé Baiano student_of Gato Preto (primary mentor for Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  '2002-08-06'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.camaracaragua.sp.gov.br/noticias/ver/titulo-de-merito-cultura-e-entregue-a-mestre-ze-baiano-638',
  E'Primary mentor for Capoeira Angola. In his own words: "In 1984 I got to know the late Mestre Gato Preto-BA (José Gabriel Goés/Berimbau de ouro de Santo Amaro). With him I perfected my knowledge of Capoeira Angola and all it involves: Singing rhythm, Game, Bateria formation, Social coexistence and Foundations of Capoeira Angola. I keep alive the traditions passed to me by Mestre Gato." Relationship ended with Gato Preto''s death on August 6, 2002.',
  E'Mentor principal para Capoeira Angola. Em suas próprias palavras: "Em 1984 conheci o finado Mestre Gato Preto-BA (José Gabriel Goés/Berimbau de ouro de Santo Amaro). Com ele aperfeiçoei meus conhecimentos de Capoeira Angola e tudo que ela envolve: Ritmo de canto, Jogo, Formação de bateria, Convivência social e Fundamentos de Capoeira Angola. Mantenho vivas as tradições que me foram passadas por Mestre Gato." Relação terminou com a morte de Gato Preto em 6 de agosto de 2002.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Baiano' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Baiano received_title_from Gato Preto (mestre title on December 27, 1986)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-12-27'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.camaracaragua.sp.gov.br/noticias/ver/titulo-de-merito-cultura-e-entregue-a-mestre-ze-baiano-638',
  E'Graduated in Capoeira de Angola on December 27, 1986. This formal graduation conferred the title of mestre in the traditional Angola lineage.',
  E'Formou-se em Capoeira de Angola em 27 de dezembro de 1986. Esta formatura formal conferiu o título de mestre na linhagem tradicional de Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Baiano' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Baiano associated_with Formiga (international collaboration)
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
  '{"association_context": {"en": "Collaborated on capoeira presentations in Rio de Janeiro and Niterói", "pt": "Colaborou em apresentações de capoeira no Rio de Janeiro e Niterói"}}'::jsonb,
  'likely'::genealogy.confidence,
  'https://www.camaracaragua.sp.gov.br/noticias/ver/titulo-de-merito-cultura-e-entregue-a-mestre-ze-baiano-638',
  E'Collaborated with Mestre Formiga on capoeira presentations in Rio de Janeiro and Niterói. Formiga is the son of Mestre Bimba.',
  E'Colaborou com Mestre Formiga em apresentações de capoeira no Rio de Janeiro e Niterói. Formiga é filho de Mestre Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Baiano' AND o.apelido = 'Formiga' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Baiano associated_with Pinguim (fellow students of Gato Preto)
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
  '{"association_context": {"en": "Fellow students of Mestre Gato Preto; both trained in São Paulo in 1990s-2000s", "pt": "Colegas de Mestre Gato Preto; ambos treinaram em São Paulo nos anos 1990-2000"}}'::jsonb,
  'likely'::genealogy.confidence,
  'https://velhosmestres.com/en/gatopreto',
  E'Both trained under Mestre Gato Preto in São Paulo. Zé Baiano from 1984 and Pinguim from 1991. Both continued Gato Preto''s lineage after his death in 2002.',
  E'Ambos treinaram com Mestre Gato Preto em São Paulo. Zé Baiano a partir de 1984 e Pinguim a partir de 1991. Ambos continuaram a linhagem de Gato Preto após sua morte em 2002.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Baiano' AND o.apelido = 'Pinguim'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Baiano trained_under Lobão (Regional training, 1973-~1984)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.camaracaragua.sp.gov.br/noticias/ver/titulo-de-merito-cultura-e-entregue-a-mestre-ze-baiano-638',
  E'Began formal training in Capoeira Regional in 1973 under Professor Lobão (Everaldo Bispo de Souza) in São José dos Campos. Lobão had co-founded the first capoeira academy in Vale do Paraíba in 1971. Zé Baiano trained Regional until 1984 when he met Mestre Gato Preto and transitioned to Angola.',
  E'Começou treinamento formal de Capoeira Regional em 1973 com Professor Lobão (Everaldo Bispo de Souza) em São José dos Campos. Lobão havia co-fundado a primeira academia de capoeira do Vale do Paraíba em 1971. Zé Baiano treinou Regional até 1984 quando conheceu Mestre Gato Preto e fez a transição para Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Baiano' AND o.apelido = 'Lobão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- Zé Baiano founded Escola de Capoeira Angola Rei Zumbi - needs group import
--   Founded 1980 in Caraguatatuba; 11 affiliated groups; Ponto de Cultura
--
-- Zé Baiano associated_with Shimamoto - needs Shimamoto import
--   Context: Collaborated in Japan
--
-- Zé Baiano associated_with Siri - needs Siri import
--   Context: Collaborated in Finland; Finland workshop 2017
--
-- Zé Baiano associated_with Jaime - needs investigation
--   Context: Collaborated in Sorocaba
--
-- Zé Baiano associated_with Lagartixa - needs investigation
--   Context: Collaborated in São José dos Campos
