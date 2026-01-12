-- ============================================================
-- STATEMENTS FOR: Soldado
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Soldado is the SUBJECT.
-- ============================================================

-- Soldado student_of Deraldo (primary teacher, graduated 1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-soldado/',
  'Soldado began training at Bonsucesso HQ at age 18 (~1971) and graduated from Mestre Deraldo in 1973. Deraldo was his primary graduating teacher.',
  'Soldado começou a treinar na sede de Bonsucesso aos 18 anos (~1971) e se formou com Mestre Deraldo em 1973. Deraldo foi seu mestre formador principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Soldado' AND o.apelido = 'Deraldo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Soldado trained_under Zé Grande (Bonfim) (co-teacher at Bonsucesso HQ)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-soldado/',
  'Soldado trained at Bonsucesso HQ under both Deraldo and Zé Grande (president of the Bonfim group). Started at age 18 (~1971).',
  'Soldado treinou na sede de Bonsucesso com Deraldo e Zé Grande (presidente do grupo Bonfim). Começou aos 18 anos (~1971).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Soldado' AND o.apelido = 'Zé Grande' AND o.apelido_context = 'Bonfim'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Soldado received_title_from Deraldo (graduation 1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "graduated/formado"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-soldado/',
  'In 1973, Soldado graduated from Mestre Deraldo and began teaching for the Bonfim group.',
  'Em 1973, Soldado se formou com Mestre Deraldo e começou a ensinar para o grupo Bonfim.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Soldado' AND o.apelido = 'Deraldo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Soldado received_title_from Mário Buscapé (white/blue belt 1992)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1992-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "white/blue belt (faixa branca/azul)"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-soldado/',
  'Bonfim founder Mestre Mário Buscapé gave Soldado the white/blue belt in 1992.',
  'O fundador do Bonfim, Mestre Mário Buscapé, deu a Soldado a faixa branca/azul em 1992.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Soldado' AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Soldado received_title_from Mário Buscapé (white belt 2012)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2012-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "white belt (faixa branca) - highest rank"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-soldado/',
  'Mestre Mário Buscapé elevated Soldado to the white belt—the highest rank in the Bonfim graduation system—in 2012.',
  'Mestre Mário Buscapé elevou Soldado à faixa branca—a graduação mais alta no sistema Bonfim—em 2012.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Soldado' AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Soldado trained_under Roberto Jacaré - needs import first
--   Context: Initial training 1963, Manguinhos branch of Bonfim
--
-- Soldado trained_under Carlinhos - needs import first
--   Context: Initial training 1963, Manguinhos branch of Bonfim
--   NOTE: This Carlinhos is from the Bonfim Manguinhos branch, not
--   the same as "Carlinhos de Recife" or "Carlinhos Ferraz"
--
-- GROUPS (pending - not yet in dataset as entities):
-- Soldado member_of Associação Cultural Bonfim (Grupo Bonfim)
--   Context: Member from 1963, graduated 1973, active through present
--
-- Soldado founded Santa Barbara núcleo (Del Castilho)
--   Context: 1973-1980, Bandeira 2 community, Del Castilho
--   NOTE: This was a núcleo of Bonfim group, not independent group
