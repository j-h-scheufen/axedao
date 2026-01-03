-- ============================================================
-- STATEMENTS FOR: Joel (São Paulo)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Joel (SP) is the SUBJECT.
-- Uses apelido_context = 'São Paulo' to match the entity.
-- ============================================================

-- Joel (SP) trained_under Zé de Freitas (CMTC Club, ~1965)
-- Note: Using trained_under rather than student_of because Joel's primary teacher was Arara
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'museudapessoa.org, wiki.urucungo.com.br',
  'Trained at CMTC Club where Zé de Freitas taught; listed as one of Zé de Freitas''s formed students; met Suassuna and Brasília at these classes (~1965)',
  'Treinou no Clube CMTC onde Zé de Freitas ensinava; listado como um dos alunos formados de Zé de Freitas; conheceu Suassuna e Brasília nestas aulas (~1965)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Zé de Freitas' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) received_title_from Bimba (mestre title, 1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-54, portalcapoeira.com',
  'Formally recognized as mestre by Mestre Bimba himself in 1972',
  'Formalmente reconhecido como mestre pelo próprio Mestre Bimba em 1972'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Suassuna (met at CMTC Club, 1965; Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Met at Zé de Freitas CMTC Club (1965); fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'museudapessoa.org, velhosmestres.com',
  'Met Suassuna at Zé de Freitas''s CMTC Club classes (~1965); both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Conheceu Suassuna nas aulas de Zé de Freitas no Clube CMTC (~1965); ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Suassuna' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Brasília (met at CMTC Club, 1965; Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Met at Zé de Freitas CMTC Club (1965); fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'museudapessoa.org, velhosmestres.com',
  'Met Brasília at Zé de Freitas''s CMTC Club classes (~1965); both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Conheceu Brasília nas aulas de Zé de Freitas no Clube CMTC (~1965); ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Brasília' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Ananias (Praça da República rodas; collaborated on 1979 LP)
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
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Frequented Praça da República rodas together; Ananias played atabaque/chorus on Joel 1979 LP"}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, discogs.com/release/13640671',
  'Regularly frequented Praça da República rodas together; Ananias participated in Joel''s 1979 LP recording (atabaque, chorus)',
  'Frequentavam juntos regularmente as rodas da Praça da República; Ananias participou da gravação do LP de Joel em 1979 (atabaque, coro)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Ananias' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Limão (Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Praça da República rodas; fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'Frequented Praça da República rodas together; both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Frequentavam juntos as rodas da Praça da República; ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Limão' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Silvestre (Praça da República rodas; Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Praça da República rodas; fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'Frequented Praça da República rodas together; both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Frequentavam juntos as rodas da Praça da República; ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Pinatti (Praça da República rodas; Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Praça da República rodas; fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'Frequented Praça da República rodas together; both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Frequentavam juntos as rodas da Praça da República; ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Pinatti' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Onça (SP) (Grupo dos Nove member)
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
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow Grupo dos Nove member (1971); Onça organized Bimba visit"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, journals.openedition.org',
  'Both recognized as Grupo dos Nove pioneers by Bimba (1971); Onça organized Bimba''s visit',
  'Ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971); Onça organizou a visita de Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) family_of Gilvan (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-54, fontedogravata.org',
  'Brothers; both born in Bahia (Santo Amaro/Feira de Santana region); both migrated to São Paulo in 1960s; both members of Grupo dos Nove (1971); Joel gave impassioned speech at Paulo Gomes funeral noting he had "already lost his brother Gilvan"',
  'Irmãos; ambos nascidos na Bahia (região de Santo Amaro/Feira de Santana); ambos migraram para São Paulo nos anos 1960; ambos membros do Grupo dos Nove (1971); Joel fez discurso emocionado no funeral de Paulo Gomes observando que "já havia perdido seu irmão Gilvan"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Gilvan' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Joel (SP) student_of Arara (Fernando Vasconcelos) - PRIMARY TEACHER - needs import first
-- Joel (SP) founded Associação de Capoeira Ilha de Itapuã - GROUP in backlog
-- Joel (SP) leads Organização Onças de São Paulo - GROUP needs research
-- Joel (SP) leads ABRACAP - Associação Brasil Capoeira - GROUP needs research
-- Joel (SP) associated_with Prof Dado - 1979 LP music director - needs import?
-- Joel (SP) associated_with Prof João Braz - 1979 LP musician - needs import?
-- Joel (SP) associated_with Mestre João - 1979 LP vocalist - needs import?
