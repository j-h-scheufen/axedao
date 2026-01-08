-- ============================================================
-- STATEMENTS FOR: Lua Rasta
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Lua Rasta is the SUBJECT.
-- ============================================================

-- Lua Rasta trained_under Bimba (1 year training, 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'last.fm, artesanatodabahia.com.br',
  E'Trained with Bimba for one year (1968) before transferring to Canjiquinha.',
  E'Treinou com Bimba por um ano (1968) antes de se transferir para Canjiquinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua Rasta' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua Rasta student_of Canjiquinha (primary mentor, 1969-onwards)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'last.fm, lalaue.com, artesanatodabahia.com.br',
  E'Primary mentor. Joined Canjiquinha''s academy and folkloric group Aberrê in 1969. Developed capoeira as theatrical language under his guidance.',
  E'Mentor principal. Ingressou na academia de Canjiquinha e no grupo folclórico Aberrê em 1969. Desenvolveu a capoeira como linguagem teatral sob sua orientação.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua Rasta' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua Rasta associated_with Bigodinho (close friend, encouraged return 1997)
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
  '{"association_context": "Close friend; encouraged Bigodinho''s return to capoeira in 1997; organized Tributo a Mestre Bigodinho (2007/2008)"}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, lalaue.com, velhosmestres.com',
  E'Close friend who encouraged Bigodinho''s return to capoeira in 1997 after nearly three decades absence. Co-organized the "Tributo a Mestre Bigodinho" celebration in Acupe (August 2008) with Mestre Ivan de Santo Amaro.',
  E'Amigo próximo que incentivou o retorno de Bigodinho à capoeira em 1997 após quase três décadas de ausência. Co-organizou a celebração "Tributo a Mestre Bigodinho" em Acupe (agosto de 2008) com Mestre Ivan de Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua Rasta' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Lua Rasta member_of Viva Bahia (1970) - Grupo Viva Bahia in groups backlog
-- Lua Rasta member_of Conjunto Folclórico Aberrê (1969) - Group in backlog
-- Lua Rasta founded Ateliê Percussivo - Workshop/organization not in dataset
-- Lua Rasta founded Bando Anunciador - Group not in dataset
-- Lua Rasta associated_with Mestre Olavo (fellow Mestre Artesão 2021) - Not in dataset
-- Lua Rasta associated_with Mestre Ivan de Santo Amaro (co-organizer Tributo 2007) - Not in dataset
-- Lua Rasta associated_with Nelson Maleiro (taught encourar technique) - Not capoeirista; do not import
