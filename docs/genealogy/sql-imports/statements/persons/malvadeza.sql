-- ============================================================
-- STATEMENTS FOR: Malvadeza (José Martins dos Santos)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Malvadeza is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Malvadeza student_of Curió Velho (learned from father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'José Martins dos Santos (Malvadeza) learned capoeira from his father Pedro Virício (Curió Velho), continuing the family tradition of Capoeira Angola in Santo Amaro.',
  E'José Martins dos Santos (Malvadeza) aprendeu capoeira com seu pai Pedro Virício (Curió Velho), continuando a tradição familiar de Capoeira Angola em Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Malvadeza family_of Curió Velho (child-parent relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "child"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'José Martins dos Santos (Malvadeza) was the son of Pedro Virício (Curió Velho).',
  E'José Martins dos Santos (Malvadeza) era filho de Pedro Virício (Curió Velho).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Malvadeza family_of Pequena (spouse relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "spouse"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'José Martins dos Santos (Malvadeza) was married to Maria Bispo (Pequena). Both were capoeiristas from Santo Amaro.',
  E'José Martins dos Santos (Malvadeza) era casado com Maria Bispo (Pequena). Ambos eram capoeiristas de Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Pequena'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS
-- ============================================================

-- Malvadeza associated_with Pastinha (friend and violeiro)
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
  '{"association_context": "friend_and_musician"}'::jsonb, 'verified'::genealogy.confidence,
  'https://tribunademinas.com.br/noticias/cultura/14-07-2019/abracem-nossa-historia-e-nos-respeitem-pede-mestre-curio.html',
  E'José Martins dos Santos (Malvadeza) was a close friend of Mestre Pastinha and served as his violeiro (seven-string guitar player), accompanying him musically.',
  E'José Martins dos Santos (Malvadeza) era amigo próximo de Mestre Pastinha e servia como seu violeiro, acompanhando-o musicalmente.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Malvadeza associated_with Besouro Mangangá (second cousin)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "segundo primo"}'::jsonb, 'verified'::genealogy.confidence,
  'https://tribunademinas.com.br/noticias/cultura/14-07-2019/abracem-nossa-historia-e-nos-respeitem-pede-mestre-curio.html',
  E'Besouro Mangangá was the "primo segundo" (second cousin) of José Martins dos Santos (Malvadeza), as stated by Mestre Curió: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro... que era primo segundo do meu pai."',
  E'Besouro Mangangá era "primo segundo" de José Martins dos Santos (Malvadeza), conforme declarado por Mestre Curió: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro... que era primo segundo do meu pai."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Malvadeza is OBJECT:
-- ============================================================
-- Curió student_of Malvadeza - to add to curio.sql (family training from 1943)
-- Curió family_of Malvadeza - to add to curio.sql (parent relationship)
-- Curió Velho family_of Malvadeza - in curio-velho.sql (parent relationship)
