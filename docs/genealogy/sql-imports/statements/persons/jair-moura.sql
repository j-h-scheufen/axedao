-- ============================================================
-- STATEMENTS FOR: Jair Moura
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Jair Moura is the SUBJECT.
-- ============================================================

-- Jair Moura student_of Bimba (late 1950s-1974)
-- Primary teacher-student relationship
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
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraWiki, Correio 24 Horas obituary, Mestre Nenel testimony',
  'Jair Moura began training with Mestre Bimba in the late 1950s. According to Mestre Nenel: "He was a student of my father since the 1950s". The relationship lasted until Bimba''s death on February 5, 1974. Nenel described him as "one of the guys most well-regarded by my father".',
  'Jair Moura começou a treinar com Mestre Bimba no final dos anos 1950. Segundo Mestre Nenel: "Ele era aluno de meu pai desde a década de 1950". A relação durou até a morte de Bimba em 5 de fevereiro de 1974. Nenel o descreveu como "um dos caras mais bem considerados pelo meu pai".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura received_title_from Bimba (white handkerchief / mestre)
-- The LAST of only four students to receive the highest graduation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "symbol": "lenço branco (white handkerchief)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Nenel testimony (Correio 24 Horas), CapoeiraWiki, multiple obituary sources',
  'One of only four students formally graduated to mestre level (white handkerchief) by Mestre Bimba during his lifetime. According to Mestre Nenel (Bimba''s son): "He was the last capoeirista to receive the Lenço Branco from my father". The others were Decânio, Miranda, and Edinho (the latter two deceased before Bimba).',
  'Um dos apenas quatro alunos formalmente graduados ao nível de mestre (lenço branco) por Mestre Bimba durante sua vida. Segundo Mestre Nenel (filho de Bimba): "Ele foi o último capoeirista a receber o Lenço Branco de meu pai". Os outros foram Decânio, Miranda e Edinho (os dois últimos falecidos antes de Bimba).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with Totonho de Maré (documented in "Dança de Guerra" 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring Totonho de Maré; also photographed together."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-12, CapoeiraWiki',
  'Jair Moura directed "Dança de Guerra" (1968) featuring Mestre Totonho de Maré. A photograph from 1968 shows Jair Moura and Mestre Maré together. Jair Moura also conducted an interview with Totonho de Maré (audio preserved at velhosmestres.com). In 1970, he wrote about Tiburcinho for A Tarde newspaper.',
  'Jair Moura dirigiu "Dança de Guerra" (1968) com Mestre Totonho de Maré. Uma fotografia de 1968 mostra Jair Moura e Mestre Maré juntos. Jair Moura também conduziu uma entrevista com Totonho de Maré (áudio preservado em velhosmestres.com). Em 1970, escreveu sobre Tiburcinho para o jornal A Tarde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with Noronha (documented in "Dança de Guerra" 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring Noronha in a vadiação with Totonho de Maré."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-12, CapoeiraWiki',
  'Jair Moura directed "Dança de Guerra" (1968) which included a brief vadiação between Mestres Noronha and Maré. The Instituto Jair Moura (founded by Frede Abreu) later proposed the "Centenário do Mestre Noronha" based on Noronha''s birth date from his death certificate.',
  'Jair Moura dirigiu "Dança de Guerra" (1968) que incluiu uma breve vadiação entre Mestres Noronha e Maré. O Instituto Jair Moura (fundado por Frede Abreu) posteriormente propôs o "Centenário do Mestre Noronha" baseado na data de nascimento de Noronha em sua certidão de óbito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with João Grande (documented in "Dança de Guerra" 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring João Grande."}'::jsonb,
  'likely'::genealogy.confidence,
  'SecultBA note, CapoeiraWiki (some sources list João Grande in the documentary)',
  'Jair Moura directed "Dança de Guerra" (1968). Some sources (including SecultBA official note) list João Grande among the masters featured, alongside Bimba and João Pequeno.',
  'Jair Moura dirigiu "Dança de Guerra" (1968). Algumas fontes (incluindo nota oficial da SecultBA) listam João Grande entre os mestres apresentados, junto com Bimba e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with João Pequeno (documented in "Dança de Guerra" 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring João Pequeno."}'::jsonb,
  'likely'::genealogy.confidence,
  'SecultBA note, CapoeiraWiki (some sources list João Pequeno in the documentary)',
  'Jair Moura directed "Dança de Guerra" (1968). Some sources (including SecultBA official note) list João Pequeno among the masters featured, alongside Bimba and João Grande.',
  'Jair Moura dirigiu "Dança de Guerra" (1968). Algumas fontes (incluindo nota oficial da SecultBA) listam João Pequeno entre os mestres apresentados, junto com Bimba e João Grande.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with Itapoan (co-presenter at 1980 First Regional Capoeira Seminar)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-presenters at the 1980 First Regional Capoeira Seminar in Salvador, organized alongside Carlos Senna, Albano Marinho, and Ordep Serra."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1980',
  'Jair Moura and Itapoan were both presenters at the 1980 First Regional Capoeira Seminar in Salvador, which brought together main Bahian masters of different lineages and styles.',
  'Jair Moura e Itapoan foram ambos apresentadores no Primeiro Seminário Regional de Capoeira de 1980 em Salvador, que reuniu os principais mestres baianos de diferentes linhagens e estilos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Jair Moura associated_with Tiburcinho - filmed in "Dança de Guerra" (1968); wrote A Tarde article 1970
--   -> Tiburcinho pending import in persons-backlog.md
-- Jair Moura associated_with Nenel - Nenel provided testimony about Jair Moura
--   -> Nenel pending import in persons-backlog.md
-- Jair Moura associated_with Carlos Senna - co-presenter at 1980 First Regional Capoeira Seminar
--   -> Carlos Senna now imported (done)
-- Jair Moura associated_with Frede Abreu (Frederico José de Abreu) - close friend and fellow researcher
--   -> Frede Abreu added to backlog (historian, may need import as researcher type)
-- Jair Moura associated_with Glauber Rocha - friendship
--   -> Glauber Rocha NOT capoeira figure - do not import
