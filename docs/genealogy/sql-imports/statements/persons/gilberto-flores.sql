-- ============================================================
-- STATEMENTS FOR: Gilberto Flores
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Gilberto Flores is the SUBJECT.
-- ============================================================
-- FAMILY RELATIONSHIP STRUCTURE (per user instruction):
-- The three Flores brothers are connected in a triangle with 3 relations:
-- - Gilberto → Rafael (family_of) - Rafael was the leader
-- - Paulo → Rafael (already exists in paulo-flores.sql)
-- - Gilberto → Paulo (family_of)
-- ============================================================

-- Gilberto Flores trained_under Mestre Bimba (school vacations in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"context": "school vacation training in Salvador with brothers Paulo and Rafael"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.senzala.co.uk/history.html; https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala; https://www.lalaue.com/capoeira-schools/grupo-senzala-capoeira/',
  E'Multiple sources confirm all three Flores brothers trained with Mestre Bimba during school vacations in Salvador. While Paulo and Rafael''s two-month training in early 1963 is specifically documented, Gilberto''s training is described as part of the group ("the brothers trained with Bimba").',
  E'Múltiplas fontes confirmam que os três irmãos Flores treinaram com Mestre Bimba durante férias escolares em Salvador. Enquanto o treinamento de dois meses de Paulo e Rafael no início de 1963 é especificamente documentado, o treinamento de Gilberto é descrito como parte do grupo ("os irmãos treinaram com Bimba").'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilberto Flores' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gilberto Flores trained_under Mestre Pastinha (exposure to Angola tradition)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"context": "exposure to Angola tradition during Salvador school vacations"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://www.lalaue.com/capoeira-schools/grupo-senzala-capoeira/; https://www.senzala.co.uk/history.html',
  E'Several sources state the Flores brothers trained with "Master Bimba and Master Pastinha" during school vacations in Salvador. The extent of Pastinha training is unclear—may have been brief exposure rather than sustained study.',
  E'Várias fontes afirmam que os irmãos Flores treinaram com "Mestre Bimba e Mestre Pastinha" durante férias escolares em Salvador. A extensão do treinamento com Pastinha não é clara—pode ter sido exposição breve ao invés de estudo sustentado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilberto Flores' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gilberto Flores family_of Rafael Flores (brother - Rafael was the leader)
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
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple Senzala sources; https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala; http://velhosmestres.com/br/gato-1984',
  E'Gilberto and Rafael Flores are brothers. Together with their brother Paulo, they co-founded Grupo Senzala. Rafael served as the group''s leader and spokesperson for approximately the first 20 years.',
  E'Gilberto e Rafael Flores são irmãos. Junto com seu irmão Paulo, co-fundaram o Grupo Senzala. Rafael serviu como líder e porta-voz do grupo por aproximadamente os primeiros 20 anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilberto Flores' AND o.apelido = 'Rafael Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gilberto Flores family_of Paulo Flores (brother)
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
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple Senzala sources; https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala',
  E'Gilberto and Paulo Flores are brothers. Together with their brother Rafael, they co-founded Grupo Senzala in Rio de Janeiro in 1963.',
  E'Gilberto e Paulo Flores são irmãos. Junto com seu irmão Rafael, co-fundaram o Grupo Senzala no Rio de Janeiro em 1963.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilberto Flores' AND o.apelido = 'Paulo Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gilberto Flores co_founded Grupo Senzala (1963/1966) - group needs import first
-- Note: The triangle of family relationships is complete:
--   - Gilberto → Rafael (this file)
--   - Paulo → Rafael (paulo-flores.sql)
--   - Gilberto → Paulo (this file)
