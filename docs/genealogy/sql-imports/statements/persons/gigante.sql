-- ============================================================
-- STATEMENTS FOR: Gigante
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Gigante is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Gigante student_of Cobrinha Verde (primary teacher)
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
  '1935-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-7; cobrinha-verde.md confirms Gigante as student',
  'Started learning capoeira in a backyard at Jardim Suspenso da Barra with Mestre Cobrinha Verde. This was his primary/initial teacher.',
  'Começou a aprender capoeira em um quintal no Jardim Suspenso da Barra com Mestre Cobrinha Verde. Este foi seu professor primário/inicial.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante student_of Pastinha
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
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-7; portalcapoeira.com',
  'After training with Cobrinha Verde, Gigante continued his training under Mestre Pastinha at CECA.',
  'Após treinar com Cobrinha Verde, Gigante continuou seu treinamento com Mestre Pastinha no CECA.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante trained_under Bimba (later switched to Regional)
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
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-7 - "changed parties going to mestre Bimba''s academy"',
  'After training in Angola tradition with Cobrinha Verde and Pastinha, Gigante "changed parties" (mudou de partido) and went to train at Mestre Bimba''s Regional academy. Bimba considered him "the best berimbau player in Bahia".',
  'Após treinar na tradição Angola com Cobrinha Verde e Pastinha, Gigante "mudou de partido" e foi treinar na academia Regional de Mestre Bimba. Bimba o considerava "o melhor tocador de berimbau da Bahia".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Menino Gordo da Curva Grande (parceiro)
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
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Parceiros (partners/companions) in Salvador capoeira scene; often confused because they looked very similar"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-7 - "was Menino Gordo''s buddy (often mistaken with him as he looked alike)"',
  'Gigante and Menino Gordo da Curva Grande were "parceiros" (partners) in the Salvador capoeira scene. Sources note they were often confused because they "looked very similar".',
  'Gigante e Menino Gordo da Curva Grande eram "parceiros" na cena de capoeira de Salvador. Fontes notam que eram frequentemente confundidos porque "eram muito parecidos".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Menino Gordo da Curva Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Noronha (contemporary in 1940s Salvador)
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
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br obituary - "dedicated to capoeira since the 1940s, when he lived alongside Aberrê, Noronha, Barbosa, Traíra, Najé"',
  'Gigante lived alongside (conviveu com) Noronha and other famous capoeiristas of the 1940s Salvador scene.',
  'Gigante conviveu com Noronha e outros famosos capoeiristas da cena de Salvador dos anos 1940.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Barbosa (contemporary in 1940s Salvador)
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
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br obituary - "dedicated to capoeira since the 1940s, when he lived alongside Aberrê, Noronha, Barbosa, Traíra, Najé"',
  'Gigante lived alongside (conviveu com) Barbosa and other famous capoeiristas of the 1940s Salvador scene.',
  'Gigante conviveu com Barbosa e outros famosos capoeiristas da cena de Salvador dos anos 1940.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Barbosa' AND COALESCE(o.apelido_context, '') = 'Salvador'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Traíra (contemporary in 1940s Salvador)
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
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br obituary - "dedicated to capoeira since the 1940s, when he lived alongside Aberrê, Noronha, Barbosa, Traíra, Najé"',
  'Gigante lived alongside (conviveu com) Traíra and other famous capoeiristas of the 1940s Salvador scene.',
  'Gigante conviveu com Traíra e outros famosos capoeiristas da cena de Salvador dos anos 1940.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Curió (1980 Seminar participants)
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
  '1980-06-04'::date, 'exact'::genealogy.date_precision,
  '1980-06-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Co-participants at 1980 First Regional Capoeira Seminar (Frede Abreu), Barris, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1980; curio.md',
  'Gigante and Curió both participated in researcher Frede Abreu''s landmark "First Regional Capoeira Seminar and Festival of Capoeira Rhythms" (June 4-8, 1980 in Barris, Salvador). This event reunited the old guard of Capoeira Angola.',
  'Gigante e Curió ambos participaram do histórico "Primeiro Seminário Regional de Capoeira e Festival de Ritmos da Capoeira" do pesquisador Frede Abreu (4-8 de junho de 1980 em Barris, Salvador). Este evento reuniu a velha guarda da Capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Curió'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with João Grande (1980 Seminar participants)
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
  '1980-06-04'::date, 'exact'::genealogy.date_precision,
  '1980-06-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Co-participants at 1980 First Regional Capoeira Seminar (Frede Abreu), Barris, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1980; curio.md',
  'Gigante and João Grande both participated in researcher Frede Abreu''s landmark "First Regional Capoeira Seminar and Festival of Capoeira Rhythms" (June 4-8, 1980 in Barris, Salvador).',
  'Gigante e João Grande ambos participaram do histórico "Primeiro Seminário Regional de Capoeira e Festival de Ritmos da Capoeira" do pesquisador Frede Abreu (4-8 de junho de 1980 em Barris, Salvador).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Ezequiel (1980 Seminar participants)
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
  '1980-06-04'::date, 'exact'::genealogy.date_precision,
  '1980-06-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Co-participants at 1980 First Regional Capoeira Seminar (Frede Abreu), Barris, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1980',
  'Gigante and Ezequiel both participated in Frede Abreu''s "First Regional Capoeira Seminar" (June 4-8, 1980).',
  'Gigante e Ezequiel ambos participaram do "Primeiro Seminário Regional de Capoeira" de Frede Abreu (4-8 de junho de 1980).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gigante associated_with Aberrê (contemporary in 1940s Salvador)
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
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br obituary - "dedicated to capoeira since the 1940s, when he lived alongside Aberrê, Noronha, Barbosa, Traíra, Najé"',
  'Gigante lived alongside (conviveu com) Aberrê and other famous capoeiristas of the 1940s Salvador scene. Aberrê (Antônio Raimundo Argolo) died September 1942, so their overlap was brief but contemporaneous.',
  'Gigante conviveu com Aberrê e outros famosos capoeiristas da cena de Salvador dos anos 1940. Aberrê (Antônio Raimundo Argolo) morreu em setembro de 1942, então sua convivência foi breve mas contemporânea.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gigante' AND o.apelido = 'Aberrê' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Gigante associated_with Najé - needs import first (contemporary in 1940s)
-- Gigante founded Academia Capoeira São Gonçalo - needs group import first
-- ============================================================
