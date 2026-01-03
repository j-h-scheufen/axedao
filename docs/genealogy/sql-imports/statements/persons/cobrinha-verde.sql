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
  '{"relationship_type": "other", "other_type": "cousin"}'::jsonb,
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
  'Pascoal taught Cobrinha Verde spiritual practices (mandinga): 65 prayers, patuá creation, corpo fechado. He was not a capoeira teacher but a mandingueiro who transmitted African-Brazilian mystical traditions. Cobrinha said: "The person who gave me this amulet was an African who, to this day, when I speak of him, my eyes fill with tears. He was called Uncle Pascoal".',
  'Pascoal ensinou a Cobrinha Verde práticas espirituais (mandinga): 65 orações, criação de patuá, corpo fechado. Ele não era professor de capoeira, mas um mandingueiro que transmitiu tradições místicas afro-brasileiras. Cobrinha disse: "A pessoa que me deu este amuleto foi um africano que, até hoje, quando falo dele, meus olhos se enchem de lágrimas. Ele se chamava Tio Pascoal".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Tio Pascoal'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Espinho Remoso
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
  '1916-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Capoeira Online (Cobrinha Verde), Portal Capoeira',
  'Cobrinha Verde learned from Espinho Remoso as part of his training with multiple Santo Amaro mestres. Espinho Remoso listed among: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Neco Canário Pardo.',
  'Cobrinha Verde aprendeu com Espinho Remoso como parte de seu treinamento com múltiplos mestres de Santo Amaro. Espinho Remoso listado entre: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Neco Canário Pardo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Maitá
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
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiographical testimony (Capoeira Connection, Capoeira Online, La Laue): "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him)..."',
  'Cobrinha Verde learned from Maitá after Besouro''s death in 1924. Maitá was listed first among Cobrinha Verde''s Santo Amaro teachers and notably had a samba song named after him, indicating his prominence in the community.',
  'Cobrinha Verde aprendeu com Maitá após a morte de Besouro em 1924. Maitá foi listado primeiro entre os professores de Cobrinha Verde em Santo Amaro e notavelmente tinha um samba com seu nome, indicando sua proeminência na comunidade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Maitá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Juvêncio Grosso
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
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiographical testimony (Capoeira Connection, Capoeira Online, La Laue, Velhos Mestres)',
  'Cobrinha Verde learned from Juvêncio Grosso as one of multiple Santo Amaro mestres after Besouro''s death in 1924. Listed in Cobrinha Verde''s testimony: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."',
  'Cobrinha Verde aprendeu com Juvêncio Grosso como um de múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Listado no testemunho de Cobrinha Verde: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Juvêncio Grosso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Dendê
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
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiographical testimony in "Capoeira e Mandingas" (1991) by Marcelino dos Santos',
  'Cobrinha Verde learned from Dendê as one of multiple Santo Amaro mestres after Besouro''s death in 1924. Listed fourth in Cobrinha Verde''s testimony: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."',
  'Cobrinha Verde aprendeu com Dendê como um de múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Listado em quarto lugar no testemunho de Cobrinha Verde: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde'
  AND o.apelido = 'Dendê' AND o.apelido_context IS NULL
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

-- Cobrinha Verde trained_under Tonha Rolo do Mar (razor technique)
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
  '1916-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"skill": "navalha", "skill_details": "razor on cord, in hands, and on feet"}'::jsonb,
  'verified'::genealogy.confidence,
  'Santos, Marcelino dos. "Capoeira e Mandingas: Cobrinha Verde" (1991): "O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar. Uma mulher."',
  E'Tonha Rolo do Mar taught Cobrinha Verde the specialized razor (navalha) technique in Santo Amaro. She was distinct from his other teachers—a woman who mastered the military technique of playing with knife and razor tied to a cord. This represents one of the earliest documented instances of a woman teaching a male capoeira mestre.',
  E'Tonha Rolo do Mar ensinou a Cobrinha Verde a técnica especializada de navalha em Santo Amaro. Ela era distinta de seus outros professores—uma mulher que dominava a técnica militar de jogar com faca e navalha amarradas no cordão. Isso representa uma das primeiras instâncias documentadas de uma mulher ensinando um mestre de capoeira masculino.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Tonha Rolo do Mar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
