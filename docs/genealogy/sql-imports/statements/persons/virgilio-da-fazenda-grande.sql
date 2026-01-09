-- ============================================================
-- STATEMENTS FOR: Virgílio da Fazenda Grande
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Virgílio da Fazenda Grande is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Virgílio da Fazenda Grande student_of Espinho Remoso (father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira (2008), Tribuna do Recôncavo (2025)',
  'Virgílio was initiated into capoeira by his father at age 10 at Jaqueira do Carneiro, behind Retiro',
  'Virgílio foi iniciado na capoeira por seu pai aos 10 anos em Jaqueira do Carneiro, atrás do Retiro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Virgílio da Fazenda Grande trained_under Caiçara
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Portal Capoeira (2008)',
  'Brief training with Caiçara after father Espinho Remoso''s death',
  'Treinamento breve com Caiçara após a morte do pai Espinho Remoso'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TITLE CONFERRAL
-- ============================================================

-- Virgílio da Fazenda Grande received_title_from Paulo dos Anjos
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira (2008), ABCA WordPress',
  'Received title of Mestre de Capoeira Angola from Paulo dos Anjos, disciple of Canjiquinha',
  'Recebeu título de Mestre de Capoeira Angola de Paulo dos Anjos, discípulo de Canjiquinha'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'Paulo dos Anjos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES / ASSOCIATIONS
-- ============================================================

-- Virgílio da Fazenda Grande associated_with João Grande (1988 article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-07-30'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Named together as two of eight surviving great master-angoleiros in 1988 Tribuna da Bahia article"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna da Bahia, Caderno de Cultura (July 30, 1988)',
  'Both named in article "A resistência da capoeira" as among eight surviving great master-angoleiros',
  'Ambos nomeados no artigo "A resistência da capoeira" como entre os oito grandes mestres-angoleiros sobreviventes'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Virgílio da Fazenda Grande associated_with João Pequeno (1988 article + ABCA)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-07-30'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow ABCA members; both named among eight surviving great master-angoleiros in 1988"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna da Bahia (July 30, 1988), ABCA records',
  'João Pequeno was first ABCA president (1987); both named in 1988 Tribuna article',
  'João Pequeno foi primeiro presidente da ABCA (1987); ambos nomeados no artigo da Tribuna de 1988'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Virgílio da Fazenda Grande leads ABCA - needs ABCA group import first
-- Virgílio da Fazenda Grande associated_with Bigodinho - Bigodinho exists but association is informal (ABCA roda companions)
-- Virgílio da Fazenda Grande associated_with Nô - Nô exists but association is informal (ABCA roda companions)
-- Virgílio da Fazenda Grande associated_with Boca Rica - Boca Rica exists but association is informal (ABCA roda companions)
-- Virgílio da Fazenda Grande associated_with Pelé da Bomba - Pelé da Bomba exists but association is informal (ABCA roda companions)
