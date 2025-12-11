-- ============================================================
-- STATEMENTS FOR: Cobrinha Verde
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Cobrinha Verde is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'year'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interviews; multiple sources confirm',
  'Began learning capoeira from Besouro at age 4 in 1916. Besouro was his cousin (aunt Maria Haifa was Besouro''s mother) and raised as his brother. On his deathbed, Besouro passed his "spirit to teach capoeira" to Cobrinha Verde.',
  'Começou a aprender capoeira com Besouro aos 4 anos em 1916. Besouro era seu primo (tia Maria Haifa era mãe de Besouro) e criado como seu irmão. Em seu leito de morte, Besouro passou seu "espírito de ensinar capoeira" para Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"relationship_type": "other"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo - multiple sources confirm family relationship',
  'Cobrinha Verde''s aunt Maria Haifa was Besouro''s mother. Besouro was raised by Cobrinha''s mother Maria Narcisa Bispo, making them effectively brothers as well as cousins.',
  'A tia de Cobrinha Verde, Maria Haifa, era mãe de Besouro. Besouro foi criado pela mãe de Cobrinha, Maria Narcisa Bispo, tornando-os efetivamente irmãos além de primos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  started_at, started_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"apelido_given": "Cobrinha Verde"}'::jsonb,
  '1916-01-01'::date, 'approximate'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interview',
  'Besouro named him "Cobrinha Verde" (little green snake) because of his exceptional speed and agility with his legs.',
  'Besouro o nomeou "Cobrinha Verde" por causa de sua excepcional velocidade e agilidade com as pernas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1916-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"membership_context": "Began training with cousin Besouro at age 4 (1912/1916). Part of the Trapiche de Baixo community until Besouro''s death in 1924."}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Nossa Tribo; Cobrinha Verde interviews',
  'Began training with his cousin Besouro Mangangá at Trapiche de Baixo around age 4 (1912-1916). Cobrinha Verde was the youngest member of the community, trained until Besouro''s death in 1924.',
  'Começou a treinar com seu primo Besouro Mangangá no Trapiche de Baixo por volta dos 4 anos de idade (1912-1916). Cobrinha Verde era o membro mais jovem da comunidade, treinou até a morte de Besouro em 1924.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Cobrinha Verde' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Gasolina
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
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde interview: "My true mestre was Besouro, but I learned from many mestres in Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina..." (Capoeira Online, La Laue, Capoeira Connection)',
  E'Cobrinha Verde learned from Gasolina as part of his training with multiple Santo Amaro mestres after Besouro''s death in 1924. Training ended with Gasolina''s death during Pedrito persecution.',
  E'Cobrinha Verde aprendeu com Gasolina como parte de seu treinamento com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Treinamento terminou com a morte de Gasolina durante perseguição de Pedrito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Siri de Mangue
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo, Lalaue - multiple sources confirm Siri de Mangue as one of Cobrinha Verde''s teachers',
  'Cobrinha Verde learned from multiple Santo Amaro mestres after Besouro''s death in 1924. Siri de Mangue was among them alongside Maitá, Licurí, Joité, Dendê, and others.',
  'Cobrinha Verde aprendeu com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Siri de Mangue estava entre eles junto com Maitá, Licurí, Joité, Dendê e outros.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde influenced_by Tio Pascoal
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"discipline": "mandinga"}'::jsonb,
  'verified'::genealogy.confidence,
  'Marcelino dos Santos, "Capoeira e Mandingas: Cobrinha Verde" (1991); Cobrinha Verde interview',
  'Pascoal taught Cobrinha Verde spiritual practices (mandinga): 65 prayers, patuá creation, corpo fechado. He was not a capoeira teacher but a mandingueiro who transmitted African-Brazilian mystical traditions. Cobrinha said: "The person who gave me this amulet was an African who, to this day, when I speak of him, my eyes fill with tears. He was called Uncle Pascoal."',
  'Pascoal ensinou a Cobrinha Verde práticas espirituais (mandinga): 65 orações, criação de patuá, corpo fechado. Ele não era professor de capoeira, mas um mandingueiro que transmitiu tradições místicas afro-brasileiras. Cobrinha disse: "A pessoa que me deu este amuleto foi um africano que, até hoje, quando falo dele, meus olhos se enchem de lágrimas. Ele se chamava Tio Pascoal."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Tio Pascoal'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde associated_with Pastinha (CECA membership)
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
  'person'::genealogy.entity_type, cv.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1955-08-12'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Member #28 at CECA; admitted August 12, 1955; shared teaching duties with Pastinha, instructing students in singing, berimbau, and movements"}'::jsonb,
  'verified'::genealogy.confidence,
  'Pastinha''s official membership book; velhosmestres.com/br/cobrinha-1912-1',
  'Cobrinha Verde was member #28 at CECA, sharing teaching responsibilities with Pastinha. Taught João Grande and João Pequeno specific techniques including floor-touching mandinga.',
  'Cobrinha Verde era membro #28 no CECA, compartilhando responsabilidades de ensino com Pastinha. Ensinou a João Grande e João Pequeno técnicas específicas incluindo a mandinga de tocar o chão.'
FROM genealogy.person_profiles cv, genealogy.person_profiles p
WHERE cv.apelido = 'Cobrinha Verde' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
