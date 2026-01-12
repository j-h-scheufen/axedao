-- ============================================================
-- STATEMENTS FOR: Ivan de Santo Amaro
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Ivan de Santo Amaro is the SUBJECT.
-- ============================================================

-- Ivan de Santo Amaro student_of Ferreirinha de Santo Amaro
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1976-01-01'::date, 'year'::genealogy.date_precision,
  '1986-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-42',
  E'Ivan began training with Mestre Ferreirinha in 1976 at age 10, continuing for approximately a decade. Ferreirinha taught from his modest 3x3 meter home in Santo Amaro da Purificação. Ivan later testified: "Nobody could play berimbau like him."',
  E'Ivan começou a treinar com Mestre Ferreirinha em 1976 aos 10 anos, continuando por aproximadamente uma década. Ferreirinha ensinava em sua modesta casa de 3x3 metros em Santo Amaro da Purificação. Ivan mais tarde testemunhou: "Ninguém tocava berimbau como ele."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ivan de Santo Amaro'
  AND o.apelido = 'Ferreirinha de Santo Amaro' AND COALESCE(o.apelido_context, '') = 'Santo Amaro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ivan de Santo Amaro associated_with Lua Rasta (co-organized Tributo a Mestre Bigodinho)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2008-08-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "co_organized_event"}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/eventos-agenda/bahia-tributo-a-mestre-bigodinho/',
  E'Co-organized "Tributo a Mestre Bigodinho" (August 22-24, 2008) in Salvador and Santo Amaro. Ivan represented ACANA (Associação de Capoeira Netos de Angola), Lua Rasta represented Ateliê Percussivo.',
  E'Co-organizou o "Tributo a Mestre Bigodinho" (22-24 de agosto de 2008) em Salvador e Santo Amaro. Ivan representou a ACANA (Associação de Capoeira Netos de Angola), Lua Rasta representou o Ateliê Percussivo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ivan de Santo Amaro' AND o.apelido = 'Lua Rasta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ivan de Santo Amaro associated_with Bigodinho (organized tribute to him)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2008-08-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "organized_tribute"}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/eventos-agenda/bahia-tributo-a-mestre-bigodinho/',
  E'Co-organized "Tributo a Mestre Bigodinho" (August 22-24, 2008), a three-day celebration honoring Mestre Bigodinho in Salvador and Santo Amaro, culminating in Acupe (Bigodinho''s childhood home).',
  E'Co-organizou o "Tributo a Mestre Bigodinho" (22-24 de agosto de 2008), uma celebração de três dias homenageando Mestre Bigodinho em Salvador e Santo Amaro, culminando em Acupe (lar de infância de Bigodinho).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ivan de Santo Amaro' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Ivan de Santo Amaro founded ACANA
--   - ACANA (Associação de Capoeira Aprender Netos de Angola) needs import first
--   - Founded: October 9, 2005
--   - Location: Rua do Coentro Miúdo, Santo Amaro da Purificação
