-- ============================================================
-- STATEMENTS FOR: Tabosa (Hélio Tabosa de Moraes)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Tabosa is the SUBJECT.
-- ============================================================

-- Tabosa student_of Arraia (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'IPHAN Capoeira registry; Portal Capoeira; Arraia person report',
  'Primary teacher at Colégio Elefante Branco, Brasília. Tabosa embraced Arraia''s teaching philosophy: "ensinamento direto, olho no olho, ginga com ginga"',
  'Professor principal no Colégio Elefante Branco, Brasília. Tabosa abraçou a filosofia de ensino de Arraia: "ensinamento direto, olho no olho, ginga com ginga"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Arraia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tabosa trained_under Onça Tigre (secondary influence)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'IPHAN Capoeira registry (lists both Arraia and Onça Tigre as instructors)',
  'Secondary teacher per IPHAN registry. Onça Tigre had founded the first capoeira school in the Federal District in 1964.',
  'Professor secundário conforme registro IPHAN. Onça Tigre havia fundado a primeira escola de capoeira no Distrito Federal em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Onça Tigre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tabosa influenced_by Waldemar da Liberdade
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Portal Capoeira - Ás de Ouro 88 article',
  'Waldemar presented Tabosa with "Ás de Ouro 88" berimbau at I Jornada de Capoeira Ouro Preto (1987) and Salvador (1988), recognizing his stature.',
  'Waldemar presenteou Tabosa com berimbau "Ás de Ouro 88" na I Jornada de Capoeira Ouro Preto (1987) e Salvador (1988), reconhecendo sua estatura.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tabosa associated_with Danadinho (training companion, Berimbau de Ouro collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Training companions at Colégio Elefante Branco; together won Berimbau de Ouro 1967-1969 with Grupo Senzala"}'::jsonb,
  'verified'::genealogy.confidence,
  'Danadinho person report; Portal Capoeira; Arraia person report',
  'Both trained under Arraia at Colégio Elefante Branco. Together with Fritz, helped Senzala win Berimbau de Ouro 1967-1969.',
  'Ambos treinaram com Arraia no Colégio Elefante Branco. Junto com Fritz, ajudaram Senzala a vencer Berimbau de Ouro 1967-1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Danadinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Tabosa associated_with Fritz (Alfredo) - training companion at Elefante Branco; helped win Berimbau de Ouro 1967-1969 - needs Fritz import
-- Tabosa associated_with Adilson (Brasília) - competed together at Berimbau de Ouro; Arraia visited his roda with Tabosa - needs Adilson import
-- Tabosa teaches_at Academia Tabosa - founded 1974; needs Academia Tabosa group import
-- Tabosa teaches_at UnB (1965-) - introduced capoeira to university; needs UnB group import if tracked
-- Tabosa associated_with Mestre Zulu - Zulu trained with Tabosa at UnB 1970; needs Zulu import
-- Tabosa associated_with Mestre Itapoan - together at 1988 Salvador event when Waldemar presented berimbau; Itapoan already exists
-- Tabosa associated_with Mestre Pombo de Ouro - honored together at Capoeira Regional Centenary 2017; needs Pombo de Ouro import

-- ============================================================
-- ADDITIONAL PERSON-TO-GROUP RELATIONSHIPS TO ADD WHEN GROUPS EXIST
-- ============================================================
-- Tabosa teaches_at Academia Tabosa - founded 1974 quadra 505 Sul, first official capoeira academy in Brasília
-- Tabosa member_of Grupo Senzala - competed with them 1967-1969 Berimbau de Ouro (not founder, but affiliated)
-- Tabosa regional_coordinator_of FECADF (Federação de Capoeira do Distrito Federal) - honored pioneer 1997
