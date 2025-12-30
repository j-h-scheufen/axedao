-- ============================================================
-- STATEMENTS FOR: Rafael Flores
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Rafael Flores is the SUBJECT.
-- ============================================================

-- Rafael Flores trained_under Mestre Bimba (2 months in Salvador, early 1963)
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
  '1963-03-01'::date, 'year'::genealogy.date_precision,
  '{"duration": "2 months", "context": "school vacation training"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.senzala.co.uk/history.html; http://velhosmestres.com/br/gato-1984; https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala',
  E'Two months of intensive training at Mestre Bimba''s academy in Salvador during school vacations in early 1963. Rafael trained alongside his brother Paulo. A capoeirista cousin introduced the Flores brothers to Bimba''s academy.',
  E'Dois meses de treinamento intensivo na academia de Mestre Bimba em Salvador durante as férias escolares no início de 1963. Rafael treinou ao lado de seu irmão Paulo. Um primo capoeirista apresentou os irmãos Flores à academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores trained_under Mestre Pastinha (exposure to Angola tradition)
-- Note: Some sources mention Pastinha training during Salvador visits
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
  '{"context": "exposure to Angola tradition during Salvador training"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://www.lalaue.com/capoeira-schools/grupo-senzala-capoeira/; https://www.senzala.co.uk/history.html',
  E'Several sources state the Flores brothers trained with "Master Bimba and Master Pastinha" during school vacations in Salvador. The extent of Pastinha training is unclear—may have been brief exposure rather than sustained study.',
  E'Várias fontes afirmam que os irmãos Flores treinaram com "Mestre Bimba e Mestre Pastinha" durante férias escolares em Salvador. A extensão do treinamento com Pastinha não é clara—pode ter sido exposição breve ao invés de estudo sustentado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores family_of Paulo Flores (brother)
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
  'Multiple Senzala sources; http://velhosmestres.com/br/gato-1984',
  E'Rafael and Paulo Flores Viana are brothers. Together with their brother Gilberto, they co-founded Grupo Senzala. Rafael was born in Bahia; Paulo was born in Rio de Janeiro.',
  E'Rafael e Paulo Flores Viana são irmãos. Junto com seu irmão Gilberto, co-fundaram o Grupo Senzala. Rafael nasceu na Bahia; Paulo nasceu no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'Paulo Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores associated_with João Grande (1988 meeting in Santa Luzia do Norte)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Rafael organized historic 1988 capoeira meeting in Santa Luzia do Norte where João Grande participated alongside Leopoldina and João Pequeno"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala; agitaeco.com.br obituary',
  E'In 1988, Rafael organized a historic capoeira meeting in Santa Luzia do Norte, Espírito Santo. João Grande participated alongside nearly all of Grupo Senzala, plus Mestres Leopoldina and João Pequeno—a remarkable convergence of Rio and Bahian capoeira traditions.',
  E'Em 1988, Rafael organizou um encontro de capoeira histórico em Santa Luzia do Norte, Espírito Santo. João Grande participou junto com quase todo o Grupo Senzala, mais os Mestres Leopoldina e João Pequeno—uma convergência notável das tradições de capoeira do Rio e da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores associated_with João Pequeno (1988 meeting in Santa Luzia do Norte)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Rafael organized historic 1988 capoeira meeting in Santa Luzia do Norte where João Pequeno participated alongside Leopoldina and João Grande"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala; agitaeco.com.br obituary',
  E'In 1988, Rafael organized a historic capoeira meeting in Santa Luzia do Norte, Espírito Santo. João Pequeno participated alongside nearly all of Grupo Senzala, plus Mestres Leopoldina and João Grande.',
  E'Em 1988, Rafael organizou um encontro de capoeira histórico em Santa Luzia do Norte, Espírito Santo. João Pequeno participou junto com quase todo o Grupo Senzala, mais os Mestres Leopoldina e João Grande.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores associated_with Leopoldina (1988 meeting in Santa Luzia do Norte)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Rafael organized historic 1988 capoeira meeting in Santa Luzia do Norte where Leopoldina participated alongside João Grande and João Pequeno"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala; agitaeco.com.br obituary',
  E'In 1988, Rafael organized a historic capoeira meeting in Santa Luzia do Norte, Espírito Santo. Mestre Leopoldina participated alongside nearly all of Grupo Senzala, plus Mestres João Grande and João Pequeno.',
  E'Em 1988, Rafael organizou um encontro de capoeira histórico em Santa Luzia do Norte, Espírito Santo. Mestre Leopoldina participou junto com quase todo o Grupo Senzala, mais os Mestres João Grande e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores trained_under Mestre Marcelino (Praça Mauá Pernambucan group, before 1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '{"context": "Pernambucan capoeira group at Praça Mauá port area"}'::jsonb,
  'verified'::genealogy.confidence,
  'http://velhosmestres.com/br/gato-1984',
  E'Rafael Flores trained with Mestre Marcelino''s Pernambucan capoeira group at Praça Mauá in Rio de Janeiro before traveling to Salvador in 1963 to study with Mestre Bimba. This early exposure to Pernambucan capoeira traditions contributed to the diverse influences that would later shape Grupo Senzala.',
  E'Rafael Flores treinou com o grupo de capoeira pernambucana de Mestre Marcelino na Praça Mauá no Rio de Janeiro antes de viajar para Salvador em 1963 para estudar com Mestre Bimba. Esta exposição inicial às tradições de capoeira pernambucana contribuiu para as diversas influências que mais tarde moldariam o Grupo Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'Marcelino' AND o.apelido_context = 'Praça Mauá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rafael Flores trained_under Valdo Santana (Academia Santana, Cinelândia, before 1963)
-- Note: "Waldo" in some sources is variant spelling of "Valdo"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '{"context": "Academia Santana above Bar Amarelinho in Cinelândia"}'::jsonb,
  'likely'::genealogy.confidence,
  'http://velhosmestres.com/br/gato-1984; https://www.revistacarioca.com.br/revistacarioca/article/view/116',
  E'Rafael Flores likely trained at Academia Santana in Cinelândia with his brother Paulo before they traveled to Salvador in 1963 to study with Mestre Bimba. Paulo is explicitly documented as training there in 1962; as brothers who trained together, Rafael almost certainly accompanied him. Valdo Santana (sometimes spelled "Waldo") co-founded the academy with his brother Waldemar Santana.',
  E'Rafael Flores provavelmente treinou na Academia Santana na Cinelândia com seu irmão Paulo antes de viajarem para Salvador em 1963 para estudar com Mestre Bimba. Paulo é explicitamente documentado como tendo treinado lá em 1962; como irmãos que treinavam juntos, Rafael quase certamente o acompanhou. Valdo Santana (às vezes escrito "Waldo") co-fundou a academia com seu irmão Waldemar Santana.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rafael Flores' AND o.apelido = 'Valdo Santana'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rafael Flores co_founded Grupo Senzala (1963/1966) - group needs import first
-- Rafael Flores founded Grupo Senzala "Patrimônio dos Pretos" (1988) - group needs import first
-- Note: Rafael Flores family_of Gilberto Flores - relationship captured in gilberto-flores.sql (Gilberto → Rafael direction)
-- Note: Paulo Flores family_of statement is bidirectional and already covered
-- Note: Gato statement direction is Gato student_of Paulo, association with Rafael is here
