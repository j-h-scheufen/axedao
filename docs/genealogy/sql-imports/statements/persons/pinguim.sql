-- ============================================================
-- STATEMENTS FOR: Pinguim
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Pinguim is the SUBJECT.
-- ============================================================

-- Pinguim student_of Gato Preto (primary teacher from 1991)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1991-01-01'::date, 'year'::genealogy.date_precision,
  '2002-08-06'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://sites.usp.br/nucleoartesafrobrasileiras/contramestre-pinguim/',
  E'Met Gato Preto in 1991 through work with Firmino Pitanga''s Batá-Kotô dance company. Under Gato Preto''s mentorship, Pinguim came to know the values, practices, history, memory, and heritage of the old capoeira mestres. The relationship continued until Gato Preto''s death on August 6, 2002.',
  E'Conheceu Gato Preto em 1991 através de trabalho com a companhia de dança Batá-Kotô de Firmino Pitanga. Sob a mentoria de Gato Preto, Pinguim passou a conhecer os valores, práticas, história, memória e herança dos velhos mestres da capoeira. A relação continuou até a morte de Gato Preto em 6 de agosto de 2002.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinguim' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pinguim received_title_from Gato Preto (contramestre title 2001)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2001-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contramestre", "location": "Terreiro do Bogum (Zogodô Bogum Malê Rundó), Salvador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/gato-2001-1',
  E'Received contramestre title in 2001 at Terreiro do Bogum (Zogodô Bogum Malê Rundó), a traditional Jeje nation terreiro in Engenho Velho da Federação, Salvador. The ceremony was significant as Gato Preto himself served as ogã huntó at this terreiro. Photo documentation shows Gato Preto, Pinguim, and Mestre Boa Gente at the ceremony.',
  E'Recebeu título de contramestre em 2001 no Terreiro do Bogum (Zogodô Bogum Malê Rundó), um tradicional terreiro da nação Jeje no Engenho Velho da Federação, Salvador. A cerimônia foi significativa pois o próprio Gato Preto servia como ogã huntó neste terreiro. Documentação fotográfica mostra Gato Preto, Pinguim e Mestre Boa Gente na cerimônia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinguim' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Pinguim trained_under Mestre Pato (Valdenor Batista da Silva) - first teacher at Rio Pequeno, SP (1983-1984)
--   Mestre Pato needs import first - added to persons-backlog.md
--
-- Pinguim founded Guerreiros de Senzala (1997)
--   Guerreiros de Senzala already in groups-backlog.md (line 43)
--   When group is imported: Pinguim founded Guerreiros de Senzala
--
-- Pinguim leads Núcleo de Artes Afro-Brasileiras (from 2007)
--   Núcleo de Artes Afro-Brasileiras needs import first - needs to be added to groups-backlog.md
--   When imported: Pinguim leads Núcleo de Artes Afro-Brasileiras (started 2007)
