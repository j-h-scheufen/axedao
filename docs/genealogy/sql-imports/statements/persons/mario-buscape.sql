-- ============================================================
-- STATEMENTS FOR: Mário Buscapé
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Mário Buscapé is the SUBJECT.
-- ============================================================

-- Mário Buscapé trained_under Siri de Mangue
-- His father and uncle trained with Siri de Mangue; Mário was exposed to this tradition
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário''s father José Bidel and uncle Dendê trained with Siri de Mangue. While Mário did not train directly under Siri, his capoeira came from this lineage. Influence is indirect through family teachers.',
  'O pai de Mário, José Bidel, e o tio Dendê treinaram com Siri de Mangue. Embora Mário não tenha treinado diretamente com Siri, sua capoeira veio dessa linhagem. A influência é indireta através dos professores da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé influenced_by Neco Canário Pardo (through family)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário''s father José Bidel and uncle Dendê associated with Canário Pardo (Neco Canário Pardo). The capoeira taught to Mário came from this Recôncavo tradition. Influence is indirect through family teachers.',
  'O pai de Mário, José Bidel, e o tio Dendê se associavam com Canário Pardo (Neco Canário Pardo). A capoeira ensinada a Mário veio dessa tradição do Recôncavo. A influência é indireta através dos professores da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé influenced_by Besouro Mangangá (through family lineage)
-- His father and uncle trained with companions of Besouro; Besouro visited their house
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'According to Mário, Besouro visited his family home (before Mário was born, as Besouro died 1924). His father and uncle associated with Besouro''s companions. The lineage tree shows: Besouro → Bidel → Dendê → Mário. Mário carried forward this lineage tradition.',
  'Segundo Mário, Besouro visitou a casa de sua família (antes de Mário nascer, pois Besouro morreu em 1924). Seu pai e tio se associavam com os companheiros de Besouro. A árvore genealógica mostra: Besouro → Bidel → Dendê → Mário. Mário deu continuidade a essa tradição de linhagem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé associated_with Artur Emídio
-- Frequented Artur Emídio's rodas in the 1950s
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Mário frequented Artur Emídio''s roda in Rio de Janeiro during the 1950s. Witnesses say Mário was impressed by Artur''s speed and elevated his own game. Both are among the four founding lineages of contemporary capoeira in Rio".}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Fellow founding lineage of contemporary capoeira in Rio de Janeiro. Mário frequented Artur Emídio''s roda in the 1950s and was impressed by his speed.',
  'Linhagem fundadora da capoeira contemporânea no Rio de Janeiro. Mário frequentava a roda de Artur Emídio nos anos 1950 e ficou impressionado com sua velocidade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé student_of Dendê (uncle)
-- Primary teacher; taught him from age 8 (~1942) in family backyard rodas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was Mário''s uncle and his first capoeira teacher. Starting around age 8 (1942), Mário learned capoeira in improvised rodas in the family''s backyard, with Dendê as his primary teacher.',
  'Dendê era tio de Mário e seu primeiro professor de capoeira. A partir dos 8 anos (1942), Mário aprendeu capoeira em rodas improvisadas no quintal da família, tendo Dendê como seu professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé'
  AND o.apelido = 'Dendê' AND o.apelido_context = 'São Francisco do Conde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé student_of José Bidel (father)
-- Father also trained him in capoeira alongside uncle Dendê
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'José Bidel was Mário''s father and also trained him in capoeira. Starting around age 8 (1942), Mário learned in improvised rodas in the family backyard from both his father and uncle Dendê.',
  'José Bidel era pai de Mário e também o treinou em capoeira. A partir dos 8 anos (1942), Mário aprendeu em rodas improvisadas no quintal da família com seu pai e tio Dendê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé family_of José Bidel (father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário was the son of José Bidel dos Santos. Born July 17, 1934 in São Francisco do Conde.',
  'Mário era filho de José Bidel dos Santos. Nasceu em 17 de julho de 1934 em São Francisco do Conde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé family_of Dendê (uncle)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "nephew"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was Mário''s uncle (brother of José Bidel). Mário was born July 17, 1934.',
  'Dendê era tio de Mário (irmão de José Bidel). Mário nasceu em 17 de julho de 1934.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé'
  AND o.apelido = 'Dendê' AND o.apelido_context = 'São Francisco do Conde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mário Buscapé founded Grupo Bonfim (1953) - group needs import
-- Mário Buscapé associated_with Zé Grande - primary student, took over academy; needs import
-- Mário Buscapé associated_with Deraldo - student, co-leader of Bonfim; needs import
-- Mário Buscapé associated_with Irineu dos Santos - first student at Cavan; needs import
-- Mário Buscapé associated_with Mestre Gary (Mestre 22) - learned from Zé Grande/Deraldo; needs import
-- Mário Buscapé associated_with Mestre Veludo - member of Bonfim group; needs import
