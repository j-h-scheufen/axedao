-- ============================================================
-- STATEMENTS FOR: Roque
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Roque is the SUBJECT.
-- Note: Relationships where Roque is the OBJECT (e.g., students)
-- belong in the student's statement file.
-- ============================================================

-- ------------------------------------------------------------
-- Roque trained_under Cobrinha Verde
-- "He also claims to have learned a lot from Cobrinha Verde"
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
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Roque claims to have learned a great deal from Cobrinha Verde in Salvador. His lineage descends from Tio Alípio through Besouro, continuing with Cobrinha Verde.',
  E'Roque afirma ter aprendido muito com Cobrinha Verde em Salvador. Sua linhagem descende de Tio Alípio, passando por Besouro, continuando com Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque trained_under Traíra
-- "socialized with... Traíra" / "trained under Mestre Traira"
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
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Roque trained under Mestre Traíra in Salvador and socialized with him as a young man.',
  E'Roque treinou com Mestre Traíra em Salvador e conviveu com ele quando jovem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque associated_with Onça Preta
-- Co-founders of Filhos de Angola (Rio, 1960)
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
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": {"en": "Co-founders of Grupo Filhos de Angola in Rio de Janeiro", "pt": "Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  E'Roque and Onça Preta co-founded Grupo Filhos de Angola together with Mucungê, Dois de Ouro, Baleado, and Imagem do Cão on July 21, 1960 in Rio de Janeiro.',
  E'Roque e Onça Preta co-fundaram o Grupo Filhos de Angola junto com Mucungê, Dois de Ouro, Baleado e Imagem do Cão em 21 de julho de 1960 no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque influenced_by Chico Preto (father - capoeirista)
-- No direct evidence of formal training, but family context
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1948-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'uncertain'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Chico Preto was a capoeirista who facilitated Roque''s introduction to capoeira. He connected Roque to his first formal teacher (unnamed tailor on Peru hill) and gave him access to the Mercado Modelo capoeira community. No direct evidence of formal training, but influence through family environment is culturally reasonable.',
  E'Chico Preto era um capoeirista que facilitou a introdução de Roque à capoeira. Ele conectou Roque ao seu primeiro professor formal (um alfaiate no Morro do Peru) e deu-lhe acesso à comunidade de capoeira do Mercado Modelo. Sem evidência direta de treinamento formal, mas influência através do ambiente familiar é culturalmente razoável.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque influenced_by Zé Bedeu (uncle - capoeirista)
-- No direct evidence of formal training, but family context
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'uncertain'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Zé Bedeu was Roque''s uncle and a capoeirista who taught his own son Marco Buscapé. Growing up in a family where both father and uncle practiced capoeira, Roque was exposed to the art from childhood. No direct evidence of formal training from Zé Bedeu, but family influence is culturally reasonable.',
  E'Zé Bedeu era tio de Roque e um capoeirista que ensinou seu próprio filho Marco Buscapé. Crescendo em uma família onde tanto o pai quanto o tio praticavam capoeira, Roque foi exposto à arte desde a infância. Sem evidência direta de treinamento formal de Zé Bedeu, mas influência familiar é culturalmente razoável.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque family_of Chico Preto (father)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "son"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Roque is the son of Chico Preto (Liberato Francisco Xavier). He was born in 1938 in Cachoeira and raised in the Nazaré neighborhood of Salvador.',
  E'Roque é filho de Chico Preto (Liberato Francisco Xavier). Nasceu em 1938 em Cachoeira e foi criado no bairro de Nazaré em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque family_of Zé Bedeu (uncle)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "nephew"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Zé Bedeu is Roque''s uncle - brother of his father Chico Preto. Both brothers were capoeiristas in Salvador.',
  E'Zé Bedeu é tio de Roque - irmão de seu pai Chico Preto. Ambos os irmãos eram capoeiristas em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque associated_with Boca de Fumaça
-- Socialized with at Mercado Modelo as youth (1948-1956)
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
  '1948-01-01'::date, 'decade'::genealogy.date_precision,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Socialized at Mercado Modelo in Salvador through father Chico Preto''s connections", "pt": "Conviveu no Mercado Modelo em Salvador através das conexões do pai Chico Preto"}}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'As a child, Roque socialized with Boca de Fumaça at Mercado Modelo in Salvador through his father Chico Preto''s connections as a fish vendor. Roque left Salvador for Rio in 1956.',
  E'Quando criança, Roque conviveu com Boca de Fumaça no Mercado Modelo em Salvador através das conexões de seu pai Chico Preto como peixeiro. Roque deixou Salvador para o Rio em 1956.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Boca de Fumaça'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque associated_with Tatu Bola
-- Socialized with at Mercado Modelo as youth (1948-1956)
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
  '1948-01-01'::date, 'decade'::genealogy.date_precision,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Socialized at Mercado Modelo in Salvador through father Chico Preto''s connections", "pt": "Conviveu no Mercado Modelo em Salvador através das conexões do pai Chico Preto"}}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'As a child, Roque socialized with Tatu Bola at Mercado Modelo in Salvador through his father Chico Preto''s connections as a fish vendor. Roque left Salvador for Rio in 1956.',
  E'Quando criança, Roque conviveu com Tatu Bola no Mercado Modelo em Salvador através das conexões de seu pai Chico Preto como peixeiro. Roque deixou Salvador para o Rio em 1956.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Tatu Bola'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque associated_with Bom Cabrito
-- Socialized with at Mercado Modelo as youth (1948-1956)
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
  '1948-01-01'::date, 'decade'::genealogy.date_precision,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Socialized at Mercado Modelo in Salvador through father Chico Preto''s connections", "pt": "Conviveu no Mercado Modelo em Salvador através das conexões do pai Chico Preto"}}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'As a child, Roque socialized with Bom Cabrito at Mercado Modelo in Salvador through his father Chico Preto''s connections as a fish vendor. Roque left Salvador for Rio in 1956.',
  E'Quando criança, Roque conviveu com Bom Cabrito no Mercado Modelo em Salvador através das conexões de seu pai Chico Preto como peixeiro. Roque deixou Salvador para o Rio em 1956.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Bom Cabrito'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque associated_with Canjiquinha
-- Socialized with at Mercado Modelo as youth (1948-1956)
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
  '1948-01-01'::date, 'decade'::genealogy.date_precision,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Socialized at Mercado Modelo in Salvador through father Chico Preto''s connections", "pt": "Conviveu no Mercado Modelo em Salvador através das conexões do pai Chico Preto"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'As a child, Roque socialized with Canjiquinha at Mercado Modelo in Salvador through his father Chico Preto''s connections as a fish vendor. Canjiquinha was already an established figure in the Salvador capoeira scene.',
  E'Quando criança, Roque conviveu com Canjiquinha no Mercado Modelo em Salvador através das conexões de seu pai Chico Preto como peixeiro. Canjiquinha já era uma figura estabelecida na cena da capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- PRIMARY TEACHER (unnamed):
-- Roque's primary teacher was an unnamed tailor who lived on Peru hill
-- near Largo do Tanque - a friend of his father. Cannot create statement
-- until this person is identified.
--
-- TEACHERS/INFLUENCES (need import):
-- Roque trained_under Mucungê (learned berimbau from him)
--
-- CONTEMPORARIES (need import):
-- Roque associated_with Gajé (socialized with in Salvador) - in backlog
-- Roque associated_with Mário Buscapé (joined his Capoeiras do Bonfim group)
-- Roque associated_with Vermelho 27 (had contact in Rio)
--
-- CONTEMPORARIES (DONE - SQL added above):
-- Roque associated_with Boca de Fumaça ✓
-- Roque associated_with Tatu Bola ✓
-- Roque associated_with Bom Cabrito ✓
-- Roque associated_with Canjiquinha ✓
-- Roque trained_under Traíra ✓ (see above)
--
-- FILHOS DE ANGOLA CO-FOUNDERS (need import):
-- Roque associated_with Mucungê (co-founder Filhos de Angola)
-- Roque associated_with Dois de Ouro (co-founder Filhos de Angola)
-- Roque associated_with Baleado (co-founder Filhos de Angola)
-- Roque associated_with Imagem do Cão (co-founder Filhos de Angola)
--
-- GROUP RELATIONSHIPS (need group imports):
-- Roque co_founded Filhos de Angola (group, 1960-07-21)
-- Roque member_of Capoeiras do Bonfim (Mário Buscapé's folkloric group)
--
-- ============================================================
