-- ============================================================
-- STATEMENTS FOR: Zeppelin
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Zeppelin is the SUBJECT.
--
-- Zeppelin is documented as a participant in the II Congresso
-- Afro-Brasileiro (1937) and as an informant for Edison Carneiro's
-- research. However, no formal teacher-student relationships are
-- documented for him.
--
-- EXISTING RELATIONSHIPS:
-- - associated_with Querido de Deus (contemporary, co-informant for Carneiro)
-- - associated_with Barbosa (contemporary, co-informant for Carneiro)
-- - associated_with Onça Preta (contemporary, 1937 Congress participant)
--
-- PENDING RELATIONSHIPS (objects not yet in dataset):
-- - associated_with Juvenal (1937 Congress participant) - needs import
-- - associated_with Bugaia (1937 Congress participant) - needs import
-- - associated_with Fernandes (1937 Congress participant) - needs import
-- - associated_with Eutíquio (1937 Congress participant) - needs import
-- - associated_with Neném (1937 Congress participant) - needs import
-- - associated_with Zei (1937 Congress participant) - needs import
-- - associated_with Arthur Mattos (1937 Congress participant) - needs import
-- - associated_with Raphael (1937 Congress participant) - needs import
-- - associated_with Edgar (1937 Congress participant) - needs import
-- ============================================================

-- Zeppelin associated_with Querido de Deus (co-informant for Edison Carneiro's research, 1937 Congress participant)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-14'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-informants for Edison Carneiro''s capoeira research in ''Negros Bantus'' (1937); both participated in II Congresso Afro-Brasileiro capoeira demonstration"}'::jsonb,
  'verified'::genealogy.confidence,
  'Edison Carneiro, "Negros Bantus" (1937); velhosmestres.com/br/destaques-38',
  E'Both named as key informants on capoeira de Angola in Edison Carneiro''s acknowledgments. Participated together in the historic capoeira demonstration at II Congresso Afro-Brasileiro (January 14, 1937) at Club de Regatas Itapagipe.',
  E'Ambos citados como informantes-chave sobre capoeira de Angola nos agradecimentos de Edison Carneiro. Participaram juntos da histórica demonstração de capoeira no II Congresso Afro-Brasileiro (14 de janeiro de 1937) no Club de Regatas Itapagipe.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeppelin' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Querido de Deus' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeppelin associated_with Barbosa (co-informant for Edison Carneiro's research, 1937 Congress participant)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-14'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-informants for Edison Carneiro''s capoeira research in ''Negros Bantus'' (1937); both participated in II Congresso Afro-Brasileiro capoeira demonstration"}'::jsonb,
  'verified'::genealogy.confidence,
  'Edison Carneiro, "Negros Bantus" (1937); velhosmestres.com/br/destaques-38',
  E'Both named as key informants on capoeira de Angola in Edison Carneiro''s acknowledgments. Participated together in the historic capoeira demonstration at II Congresso Afro-Brasileiro (January 14, 1937) at Club de Regatas Itapagipe.',
  E'Ambos citados como informantes-chave sobre capoeira de Angola nos agradecimentos de Edison Carneiro. Participaram juntos da histórica demonstração de capoeira no II Congresso Afro-Brasileiro (14 de janeiro de 1937) no Club de Regatas Itapagipe.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeppelin' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Barbosa' AND o.apelido_context = 'Cachoeira/Largo Dois de Julho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeppelin associated_with Onça Preta (1937 Congress participant)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-14'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow participants in II Congresso Afro-Brasileiro capoeira de Angola demonstration (1937)"}'::jsonb,
  'verified'::genealogy.confidence,
  'Estado da Bahia newspaper (January 1937); velhosmestres.com/br/destaques-38',
  E'Both participated in the capoeira de Angola demonstration at II Congresso Afro-Brasileiro (January 14, 1937) at Club de Regatas Itapagipe, directed by Samuel Querido de Deus.',
  E'Ambos participaram da demonstração de capoeira de Angola no II Congresso Afro-Brasileiro (14 de janeiro de 1937) no Club de Regatas Itapagipe, dirigida por Samuel Querido de Deus.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeppelin' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Onça Preta' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- The following contemporaries from the 1937 Congress are not yet
-- imported. When they are added, create associated_with statements:
--
-- Zeppelin associated_with Juvenal - 1937 Congress participant
-- Zeppelin associated_with Bugaia - 1937 Congress participant
-- Zeppelin associated_with Fernandes - 1937 Congress participant
-- Zeppelin associated_with Eutíquio - 1937 Congress participant
-- Zeppelin associated_with Neném - 1937 Congress participant; distinct from Neném (Noronha's father)
-- Zeppelin associated_with Zei - 1937 Congress participant
-- Zeppelin associated_with Arthur Mattos - 1937 Congress participant
-- Zeppelin associated_with Raphael - 1937 Congress participant
-- Zeppelin associated_with Edgar - 1937 Congress participant; may be same as "Edgard" in some sources
--
-- Note: Ambrósio, Barroso, and Damião are in the backlog but not yet imported
-- ============================================================
