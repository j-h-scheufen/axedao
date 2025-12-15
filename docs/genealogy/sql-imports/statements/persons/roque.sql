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

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- PRIMARY TEACHER (unnamed):
-- Roque's primary teacher was an unnamed tailor who lived on Peru hill
-- near Largo do Tanque - a friend of his father. Cannot create statement
-- until this person is identified.
--
-- FAMILY RELATIONSHIPS:
-- Roque family_of Chico Preto (father - Liberato Francisco Xavier)
-- Roque family_of Zé Bedeu (uncle)
-- Both need to be imported first.
--
-- TEACHERS/INFLUENCES (need import):
-- Roque trained_under Mucungê (learned berimbau from him)
--
-- CONTEMPORARIES (need import):
-- Roque associated_with Gajé (socialized with in Salvador)
-- Roque associated_with Índio (socialized with in Salvador)
-- Roque associated_with Tatu Bola (socialized with in Salvador)
-- Roque associated_with Bom Cabrito (socialized with in Salvador)
-- Roque associated_with Boca de Fumaça (socialized with in Salvador)
-- Roque associated_with Canjiquinha (socialized with in Salvador)
-- Roque associated_with Mário Buscapé (joined his Capoeiras do Bonfim group)
-- Roque associated_with Vermelho 27 (had contact in Rio)
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
