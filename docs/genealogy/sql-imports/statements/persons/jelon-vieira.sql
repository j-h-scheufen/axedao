-- ============================================================
-- STATEMENTS FOR: Jelon Vieira
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Jelon is the SUBJECT.
-- ============================================================

-- Jelon trained_under Ezequiel (Regional from 1969)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-jelon/, https://www.arts.gov/honors/heritage/jelon-vieira',
  E'Primary Regional teacher. Jelon met Ezequiel in 1969 and studied Capoeira Regional under his guidance. Named Capoeira Luanda (2007) in honor of Ezequiel''s Grupo Luanda (1964).',
  E'Professor principal de Regional. Jelon conheceu Ezequiel em 1969 e estudou Capoeira Regional sob sua orientação. Nomeou Capoeira Luanda (2007) em homenagem ao Grupo Luanda de Ezequiel (1964).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jelon' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jelon trained_under Bimba (attended classes at CCFR)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://danceprogram.duke.edu/visiting-artist/mestre-jelon-vieira, https://festival.si.edu/2017/on-the-move/mestre-jelon-vieira/smithsonian',
  E'Attended classes at Mestre Bimba''s Centro de Cultura Física e Luta Regional. Not a primary student but trained there through Ezequiel''s connection.',
  E'Frequentou aulas no Centro de Cultura Física e Luta Regional de Mestre Bimba. Não era aluno principal mas treinou lá através da conexão com Ezequiel.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jelon' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jelon associated_with João Grande (invited him to USA 1989, LP collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "performance partners, LP collaborator"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-22, https://festival.si.edu/2017/on-the-move/mestre-jelon-vieira/smithsonian',
  E'Toured Europe with Viva Bahia/Viva Brasil in 1974. In 1989, invited João Grande to tour USA, catalyzing his permanent move to NYC. Recorded 1989 LP together. Both received NEA National Heritage Fellowship.',
  E'Excursionou pela Europa com Viva Bahia/Viva Brasil em 1974. Em 1989, convidou João Grande para turnê nos EUA, catalisando sua mudança permanente para NYC. Gravaram LP de 1989 juntos. Ambos receberam NEA National Heritage Fellowship.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jelon' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jelon student_of Bobô (Angola teacher, considered "true mestre")
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.arts.gov/honors/heritage/jelon-vieira, https://festival.si.edu/2017/on-the-move/mestre-jelon-vieira/smithsonian',
  E'Primary Angola teacher in Santo Amaro da Purificação. Jelon found Bobô''s school through a friend when seeking a capoeira academy farther from his mother''s house. Considered Bobô his "true mestre" and dedicated his 2008 NEA National Heritage Fellowship to him. Recorded 1989 LP together with João Grande and João Pequeno.',
  E'Professor principal de Angola em Santo Amaro da Purificação. Jelon encontrou a escola de Bobô através de um amigo quando buscava uma academia de capoeira mais longe da casa de sua mãe. Considerava Bobô seu "verdadeiro mestre" e dedicou a ele seu NEA National Heritage Fellowship de 2008. Gravaram LP de 1989 juntos com João Grande e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jelon' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jelon student_of Emerito (first capoeira contact, ~1963, Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-jelon/, https://festival.si.edu/2017/on-the-move/mestre-jelon-vieira/smithsonian',
  E'First capoeira teacher. Jelon encountered Emerito at the end of the Engenho Velho de Brotas bus line on a Saturday afternoon (~1963, age 10). Emerito invited him to train at his house where his entire family practiced. Later transitioned to training with Mestre Bobô.',
  E'Primeiro professor de capoeira. Jelon encontrou Emerito no final da linha de ônibus do Engenho Velho de Brotas em uma tarde de sábado (~1963, aos 10 anos). Emerito o convidou para treinar em sua casa onde toda sua família praticava. Depois passou a treinar com Mestre Bobô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jelon' AND o.apelido = 'Emerito'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Jelon associated_with Loremil Machado - co-founder DanceBrazil, together introduced capoeira to USA - needs Loremil import
-- Jelon founded DanceBrazil (1977/1981) - needs DanceBrazil group import
-- Jelon founded Capoeira Foundation (1980) - needs Capoeira Foundation group import
-- Jelon co_founded Capoeira Luanda (2007) - needs Capoeira Luanda group import
-- Jelon associated_with Alvin Ailey - mentor, named DanceBrazil - not capoeirista (do not import)
-- Jelon associated_with Ellen Stewart - La MaMa founder, early supporter - not capoeirista (do not import)
-- Jelon associated_with Emília Biancardi - Viva Bahia founder, toured together 1974 - not capoeirista (do not import)

-- Jelon associated_with João Pequeno (1989 LP recording)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "LP recording collaborator"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-22',
  E'João Pequeno participated in Jelon''s 1989 LP "Capoeira - Afro-Brazilian Art Form" alongside João Grande and Mestre Bobô.',
  E'João Pequeno participou do LP de 1989 de Jelon "Capoeira - Afro-Brazilian Art Form" ao lado de João Grande e Mestre Bobô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jelon' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
