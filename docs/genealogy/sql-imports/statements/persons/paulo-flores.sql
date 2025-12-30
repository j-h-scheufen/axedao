-- ============================================================
-- STATEMENTS FOR: Paulo Flores
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Paulo Flores is the SUBJECT.
-- ============================================================

-- Paulo Flores trained_under Mestre Bimba (2 months in Salvador, early 1963)
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
  'https://www.senzala.co.uk/history.html; https://capoeirailhagrande.wordpress.com/o-grupo-senzala/',
  E'Two months of intensive training at Mestre Bimba''s academy in Salvador during school vacations in early 1963. Paulo trained alongside his brother Rafael. A capoeirista cousin introduced Paulo to Bimba''s academy.',
  E'Dois meses de treinamento intensivo na academia de Mestre Bimba em Salvador durante as férias escolares no início de 1963. Paulo treinou ao lado de seu irmão Rafael. Um primo capoeirista apresentou Paulo à academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Flores' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Flores trained_under Mestre Pastinha (exposure to Angola tradition)
-- Note: Some sources mention Pastinha training, though primary sources emphasize Bimba
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
  'https://www.lalaue.com/capoeira-schools/grupo-senzala-capoeira/',
  E'Several sources state the Flores brothers trained with "Master Bimba and Master Pastinha" during school vacations in Salvador. The extent of Pastinha training is unclear—may have been brief exposure rather than sustained study.',
  E'Várias fontes afirmam que os irmãos Flores treinaram com "Mestre Bimba e Mestre Pastinha" durante férias escolares em Salvador. A extensão do treinamento com Pastinha não é clara—pode ter sido exposição breve ao invés de estudo sustentado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Flores' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Flores family_of Rafael Flores (brother, co-founder)
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
  E'Paulo and Rafael Flores Viana are brothers. Together with their brother Gilberto, they co-founded Grupo Senzala. Paulo was born in Rio de Janeiro; Rafael was born in Bahia.',
  E'Paulo e Rafael Flores Viana são irmãos. Junto com seu irmão Gilberto, co-fundaram o Grupo Senzala. Paulo nasceu no Rio de Janeiro; Rafael nasceu na Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Flores' AND o.apelido = 'Rafael Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Flores trained_under Valdo Santana (Academia Santana, Rio, 1962)
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
  NULL, NULL,
  '{"context": "Early capoeira training before Salvador trip"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.senzala.co.uk/history.html; https://www.senzalamidlands.co.uk/group-senzala-since-1963/',
  E'In 1962, before his training in Salvador with Mestre Bimba, Paulo Flores began learning capoeira at Academia Santana in Rio de Janeiro, run by Mestre Valdo Santana—brother of the famous fighter Waldemar Santana. This early exposure combined with his Bahian training gave Paulo a unique perspective bridging the two capoeira centers.',
  E'Em 1962, antes de seu treinamento em Salvador com Mestre Bimba, Paulo Flores começou a aprender capoeira na Academia Santana no Rio de Janeiro, dirigida por Mestre Valdo Santana—irmão do famoso lutador Waldemar Santana. Essa exposição inicial combinada com seu treinamento baiano deu a Paulo uma perspectiva única ligando os dois centros de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Flores' AND o.apelido = 'Valdo Santana'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Paulo Flores co_founded Grupo Senzala (1963/1966) - group needs import first
-- Note: Paulo Flores family_of Gilberto Flores - relationship captured in gilberto-flores.sql (Gilberto → Paulo direction)
-- Note: Gato statement is in gato-senzala.sql (Gato student_of Paulo Flores)
