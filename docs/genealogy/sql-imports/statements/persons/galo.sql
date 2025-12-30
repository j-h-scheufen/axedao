-- ============================================================
-- STATEMENTS FOR: Galo (Luciano José Costa Figueiredo)
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Galo is the SUBJECT.
-- Per ownership rule: statements go in the file named after the SUBJECT.
-- ============================================================

-- ============================================================
-- TEACHER RELATIONSHIP: Galo student_of Bimba
-- ============================================================
-- Galo trained at Mestre Bimba's Centro de Cultura Física e Luta Regional
-- Graduated with lenço azul (formado status) during propagation phase (1967-1973)

INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  '1973-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Hélio Campos (Mestre Xaréu), "Capoeira Regional: a escola de Mestre Bimba" (UFBA); Esdras M. Santos, "Conversando sobre capoeira"',
  E'Trained at Centro de Cultura Física e Luta Regional in Terreiro de Jesus, Salvador. Graduated with lenço azul (blue handkerchief) indicating formado status. Listed among notable students of the propagation phase (1967-1973). Graduated alongside Eziquiel Martins Marinho (Mestre Ezequiel).',
  E'Treinou no Centro de Cultura Física e Luta Regional no Terreiro de Jesus, Salvador. Formou-se com lenço azul indicando status de formado. Listado entre os alunos notáveis da fase de propagação (1967-1973). Formou-se ao lado de Eziquiel Martins Marinho (Mestre Ezequiel).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TRAINING COMPANION: Galo associated_with Ezequiel
-- ============================================================
-- Graduated lenço azul together at Mestre Bimba's academy

INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraNews (Texto: Boa Alma); Hélio Campos (Mestre Xaréu), UFBA repository',
  E'Training companions at Mestre Bimba''s academy. Graduated lenço azul (blue handkerchief, formado status) together in the same graduation ceremony.',
  E'Companheiros de treino na academia de Mestre Bimba. Formaram-se com lenço azul (status de formado) juntos na mesma cerimônia de formatura.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TRAINING COMPANION: Galo associated_with Itapoan
-- ============================================================
-- Participated together in Candomblé visit with Mestre Bimba

INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'Hélio Campos (Mestre Xaréu), "Capoeira Regional: a escola de Mestre Bimba" (UFBA)',
  E'Training companions at Mestre Bimba''s academy. Participated together in visit to Mãe Alice''s Candomblé terreiro (Oiá Padê da Riméia) at Alto da Santa Cruz, alongside Russo, Bolão, and Xaréu.',
  E'Companheiros de treino na academia de Mestre Bimba. Participaram juntos da visita ao terreiro de Candomblé de Mãe Alice (Oiá Padê da Riméia) no Alto da Santa Cruz, junto com Russo, Bolão e Xaréu.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Galo associated_with Russo (Eglon) - participated in Candomblé visit together
--   Russo not yet imported; add to backlog
-- Galo associated_with Bolão (José Valmório de Lacerda) - participated in Candomblé visit together
--   Bolão not yet imported; add to backlog
-- Galo associated_with Xaréu (Hélio Campos) - participated in Candomblé visit together
--   Xaréu in backlog but not yet imported
-- Galo associated_with Boinha (Batista Sampaio) - fellow propagation phase student
--   Boinha not yet imported; add to backlog
-- Galo associated_with Prego (Roberto Fernando Diez) - fellow propagation phase student
--   Prego not yet imported; add to backlog
-- Galo associated_with Arara (Fernando Vasconcelos) - fellow propagation phase student
--   Arara not yet imported; add to backlog
-- Galo associated_with Volta Grande (Jorge Valente) - fellow propagation phase student
--   Volta Grande not yet imported; add to backlog
-- Galo associated_with Macaco (Gilson Sacramento) - fellow propagation phase student
--   Macaco not yet imported; add to backlog
-- Galo associated_with Canhão (Augusto Salvador Brito) - fellow propagation phase student
--   Canhão not yet imported; add to backlog
