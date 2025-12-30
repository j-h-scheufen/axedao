-- ============================================================
-- STATEMENTS FOR: Acordeon
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Acordeon is the SUBJECT.
-- Relationships where Acordeon is the OBJECT go in the
-- object's statement file (e.g., suelly.sql would have
-- "Suelly student_of Acordeon").
-- ============================================================

-- Acordeon student_of Bimba (primary teacher 1958+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Velhos Mestres, Lalaue, Ajitu Capoeira, Prabook',
  'Primary teacher relationship. Acordeon entered Mestre Bimba''s academy in 1958 and became one of only ten mestres certified by Bimba. He was considered one of the best disciples of Mestre Bimba.',
  'Relação de mestre principal. Acordeon entrou na academia de Mestre Bimba em 1958 e se tornou um dos apenas dez mestres certificados por Bimba. Foi considerado um dos melhores discípulos de Mestre Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Acordeon' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Acordeon received_title_from Bimba (mestre, early 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Lalaue, USAdojo, Mesa Capoeira - "one of ten mestres certified by Mestre Bimba"',
  'Acordeon is one of only ten mestres certified by Mestre Bimba, Patron of Capoeira. Exact date unknown but likely early 1960s based on opening his first academy in 1959.',
  'Acordeon é um dos apenas dez mestres certificados por Mestre Bimba, Patrono da Capoeira. Data exata desconhecida mas provavelmente início dos anos 1960 baseado na abertura de sua primeira academia em 1959.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Acordeon' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Acordeon associated_with Cobra Mansa (photographed together 1990)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Photographed together in 1990, documented on Velhos Mestres. Both are major figures in the global capoeira community though from different lineages (Bimba vs Pastinha)"., "pt": "Fotografados juntos em 1990, documentado no Velhos Mestres. Ambos são figuras importantes na comunidade global de capoeira embora de linhagens diferentes (Bimba vs Pastinha)".}}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres (velhosmestres.com/br/destaques-76)',
  'Both are leading figures in the global capoeira community representing different lineages. Photographed together in 1990.',
  'Ambos são figuras líderes na comunidade global de capoeira representando diferentes linhagens. Fotografados juntos em 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Acordeon' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- PERSON-TO-PERSON (pending - need to import these persons):
-- Acordeon associated_with Mestre Onça/Ayrton Neves Moura (co-founded K-poeira 1968)
-- Acordeon associated_with Mestre Rã/Cassio Martinho (co-founded UCA)
-- Acordeon associated_with Mestra Suelly/Suellen Einarsen (wife; student since 1982; promoted to mestra 2000)
-- Acordeon associated_with Mestre Suassuna (collaborated on 1985 Smithsonian album)
-- Acordeon associated_with Dennis Broughton (student; California Brazil Camp founder; collaborated on 1985 album)
-- Acordeon associated_with Mestre Recruta/Chris Montiel (student; promoted to mestre 2016)
-- Acordeon associated_with Mestre Besouro (UCA) (student; promoted to mestre 2022)
-- Acordeon associated_with Mestre Avestruz (student since 1981)
-- Acordeon associated_with Mestre Mata Mosquito/Silver Cruz (student; recently promoted)

-- PERSON-TO-GROUP (pending - need to import these groups):
-- Acordeon founded Grupo Folclórico da Bahia (1964/1966)
-- Acordeon co_founded K-poeira São Paulo (1968) with Mestre Onça
-- Acordeon co_founded United Capoeira Association (UCA) with Mestre Rã
-- Acordeon founded Capoeira Arts Foundation, Berkeley
-- Acordeon co_founded Capoeira Arts Café, Berkeley (1998) with Mestre Rã
-- Acordeon founded Projeto Kirimurê (social program)
-- Acordeon co_founded IBEC (Brazilian Institute for the Study of Capoeira)
-- Acordeon member_of ABCP (Brazilian Association of Capoeira Teachers)
-- Acordeon founded World Capoeira Association
-- Acordeon leads Corpo Santo (musical group)
