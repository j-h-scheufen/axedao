-- ============================================================
-- STATEMENTS FOR: Roberto Satanás
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Roberto Satanás is the SUBJECT.
-- ============================================================

-- Roberto Satanás student_of Pastinha (CECA, 1960-1966)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-09-20'::date, 'exact'::genealogy.date_precision,
  '1966-04-24'::date, 'month'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-63',
  'Admitted to CECA September 20, 1960; received diploma March 31, 1963; left capoeira after Dakar trip (April 1966)',
  'Admitido no CECA em 20 de setembro de 1960; recebeu diploma em 31 de março de 1963; deixou a capoeira após a viagem a Dacar (abril de 1966)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roberto Satanás' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Roberto Satanás received_title_from Pastinha (diploma 1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-03-31'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "diploma"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-63',
  'Received diploma (graduation certificate) from Mestre Pastinha on March 31, 1963',
  'Recebeu diploma (certificado de graduação) de Mestre Pastinha em 31 de março de 1963'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roberto Satanás' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Roberto Satanás associated_with João Grande (Dakar 1966 delegation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-09-20'::date, 'year'::genealogy.date_precision,
  '1966-04-24'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Fellow students at CECA; both traveled to Dakar 1966"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1966',
  'Fellow students of Mestre Pastinha at CECA; both part of the delegation to Dakar 1966',
  'Colegas alunos de Mestre Pastinha no CECA; ambos parte da delegação a Dacar 1966'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roberto Satanás' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Roberto Satanás associated_with Gildo Alfinete (Dakar 1966 delegation, helped carry Pastinha)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-09-20'::date, 'year'::genealogy.date_precision,
  '1966-04-24'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Fellow students at CECA; both traveled to Dakar 1966; together helped Pastinha climb stairs at Piedade passport office"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1966',
  'Fellow students; together helped Pastinha climb stairs at Piedade to get his passport before Dakar trip',
  'Colegas alunos; juntos ajudaram Pastinha a subir as escadas na Piedade para obter seu passaporte antes da viagem a Dacar'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roberto Satanás' AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Roberto Satanás associated_with Gato Preto (Dakar 1966 delegation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-16'::date, 'exact'::genealogy.date_precision,
  '1966-04-24'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both traveled to Dakar 1966; performed together at the festival"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1966',
  'Both part of the delegation to Dakar 1966; performed at the festival while Pastinha sat in the shadow',
  'Ambos parte da delegação a Dacar 1966; se apresentaram no festival enquanto Pastinha ficava à sombra'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roberto Satanás' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Roberto Satanás associated_with Camafeu de Oxóssi - needs import first
--   (Dakar 1966 delegation; Camafeu played berimbau while Roberto performed)
-- Roberto Satanás associated_with Waldomiro Malvadeza - needs import first
--   (Fellow singer on 1969 LP "Capoeira Angola" recorded at Teatro Castro Alves)
-- Roberto Satanás associated_with Toinho - needs import first
--   (Participated together in 1964 Belo Horizonte trip)
-- ============================================================
-- NOTE: CECA group entity not yet in dataset - when imported, add:
-- Roberto Satanás member_of CECA (1960-1966)
-- ============================================================
