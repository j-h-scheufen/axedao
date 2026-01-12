-- ============================================================
-- STATEMENTS FOR: Nagé (José Anastácio de Santana)
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Nagé is the SUBJECT.
-- ============================================================

-- Nagé trained_under Waldemar - association with Waldemar's Barracão documented
-- Note: Waldemar mentions Nagé as one of his students/associates in 1989 interview
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'decade'::genealogy.date_precision,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989-2 - Waldemar lists Nagé among his students/associates',
  'Nagé was part of the scene at Waldemar''s Barracão in Corta Braço. Waldemar mentioned him in 1989: "um preto por nome Nagé—que juntaram cinco homens pra matar ele"',
  'Nagé fazia parte da cena no Barracão de Waldemar em Corta Braço. Waldemar mencionou-o em 1989: "um preto por nome Nagé—que juntaram cinco homens pra matar ele"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Traíra - contemporaries; both in Vadiação 1954
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-11-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Film collaborators in Vadiação (1954); contemporaries at Waldemar''s Barracão"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1954 - Both appear in film Vadiação (1954)',
  'Both appeared in Alexandre Robatto Filho''s pioneering documentary "Vadiação" in November 1954, filmed at Mestre Waldemar''s gathering',
  'Ambos apareceram no documentário pioneiro "Vadiação" de Alexandre Robatto Filho em novembro de 1954, filmado no encontro de Mestre Waldemar'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Zacarias Boa Morte - contemporaries; both in Vadiação 1954
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-11-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Film collaborators in Vadiação (1954); contemporaries at Waldemar''s Barracão"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1954 - Both appear in film Vadiação (1954)',
  'Both appeared in Alexandre Robatto Filho''s pioneering documentary "Vadiação" in November 1954; Zacarias played berimbau in bateria',
  'Ambos apareceram no documentário pioneiro "Vadiação" de Alexandre Robatto Filho em novembro de 1954; Zacarias tocou berimbau na bateria'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Zacarias Boa Morte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Curió Velho - played together in Vadiação 1954
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-11-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Game partners in Vadiação (1954) - played together in second game sequence"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1954 - Nagé played with "(old) Curió" in second game sequence of Vadiação',
  'In the film Vadiação (1954), Nagé played in the second game sequence alongside the older Curió (Pedro Virício)',
  'No filme Vadiação (1954), Nagé jogou na segunda sequência de jogo ao lado do Curió mais velho (Pedro Virício)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Gigante - contemporaries in 1940s Salvador
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'correio24horas.com.br 2016 - Gigante obituary lists Nagé among contemporaries',
  'Gigante "conviveu" (lived alongside) Nagé in 1940s Salvador, per his 2016 obituary',
  'Gigante conviveu com Nagé na Salvador dos anos 1940, conforme seu obituário de 2016'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Gigante'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Aberrê - contemporaries in 1940s Salvador (per Gigante obituary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br 2016 - Gigante obituary lists both as contemporaries',
  'Both mentioned in Gigante''s obituary as 1940s Salvador contemporaries he lived alongside',
  'Ambos mencionados no obituário de Gigante como contemporâneos da Salvador dos anos 1940 com quem ele conviveu'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Noronha - contemporaries in 1940s Salvador (per Gigante obituary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br 2016 - Gigante obituary lists both as contemporaries',
  'Both mentioned in Gigante''s obituary as 1940s Salvador contemporaries he lived alongside',
  'Ambos mencionados no obituário de Gigante como contemporâneos da Salvador dos anos 1940 com quem ele conviveu'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nagé associated_with Barbosa - contemporaries in 1940s Salvador (per Gigante obituary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Contemporaries in 1940s Salvador capoeira scene"}'::jsonb,
  'likely'::genealogy.confidence,
  'correio24horas.com.br 2016 - Gigante obituary lists both as contemporaries',
  'Both mentioned in Gigante''s obituary as 1940s Salvador contemporaries he lived alongside',
  'Ambos mencionados no obituário de Gigante como contemporâneos da Salvador dos anos 1940 com quem ele conviveu'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nagé' AND s.apelido_context IS NULL AND o.apelido = 'Barbosa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None - all known associates are already in dataset
