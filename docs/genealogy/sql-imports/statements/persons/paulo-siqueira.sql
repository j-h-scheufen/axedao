-- ============================================================
-- STATEMENTS FOR: Paulo Siqueira
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Paulo Siqueira is the SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Paulo Siqueira student_of Roque
-- Trained at Roque's academy on Morro do Pavão from ~1972
-- Note: Primary teacher was Adilson, but under Roque's guidance
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
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Paulo Siqueira began training at Mestre Roque''s academy on Morro do Pavão around 1972. While Adilson was his primary instructor, Roque provided overall guidance and the academy bore his name. Paulo is recognized as one of Roque''s students.',
  E'Paulo Siqueira começou a treinar na academia de Mestre Roque no Morro do Pavão por volta de 1972. Embora Adilson fosse seu instrutor principal, Roque fornecia orientação geral e a academia levava seu nome. Paulo é reconhecido como um dos alunos de Roque.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Siqueira' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- NOTE: cultural_pioneer_of Germany statement REMOVED
-- The entity_type enum only supports 'person' and 'group', not 'country'.
-- Paulo Siqueira's pioneering role in Germany is documented in his bio and
-- achievements fields in the entity SQL file.
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Paulo Siqueira student_of Adilson Camisa Preta
-- Primary teacher who graduated him as mestre
-- "Mestre Adilson was his only Mestre until Adilson's death"
-- "great influence in the life of Paulo Siqueira, as capoeirista and person"
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
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '1995-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Paulo Siqueira began training under Mestre Adilson "Camisa Preta" around 1972 at Mestre Roque''s academy on Morro do Pavao. Adilson was his primary teacher and "had great influence in the life of Paulo Siqueira, as capoeirista and person". Adilson was Paulo''s only mestre until Adilson''s death in the 1990s.',
  E'Paulo Siqueira comecou a treinar sob Mestre Adilson "Camisa Preta" por volta de 1972 na academia de Mestre Roque no Morro do Pavao. Adilson foi seu professor principal e "teve grande influencia na vida de Paulo Siqueira, como capoeirista e pessoa". Adilson foi o unico mestre de Paulo ate a morte de Adilson nos anos 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Siqueira' AND o.apelido = 'Adilson Camisa Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Paulo Siqueira received_title_from Adilson Camisa Preta
-- Received mestre title from Adilson (before Adilson's death in 1990s)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Paulo Siqueira received the mestre title from Mestre Adilson "Camisa Preta". Exact date unknown, but occurred before Adilson''s death in the 1990s.',
  E'Paulo Siqueira recebeu o titulo de mestre de Mestre Adilson "Camisa Preta". Data exata desconhecida, mas ocorreu antes da morte de Adilson nos anos 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Siqueira' AND o.apelido = 'Adilson Camisa Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- Paulo Siqueira founded Escola de Capoeira Nzinga (group)
--   - Founded 1985 in Hamburg
--   - Needs group import first (in groups-backlog.md)
--
-- ============================================================
