-- ============================================================
-- STATEMENTS FOR: Adilson (Brasília)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Adilson (Brasília) is the SUBJECT.
-- Note: Uses apelido_context = 'Brasília' to distinguish from other Adilsons.
-- ============================================================

-- Adilson (Brasília) associated_with Tabosa (training companion)
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
  NULL, NULL,
  '{"association_context": {"en": "Training companions in Brasília; met at SQS 209; competed together at Berimbau de Ouro 1967-1969", "pt": "Companheiros de treino em Brasília; conheceram-se na SQS 209; competiram juntos no Berimbau de Ouro 1967-1969"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'Met at SQS 209 pilotis (~1965). Tabosa described as "one of the most agile capoeiristas in Brazil." Competed together at Berimbau de Ouro. Arraia later visited Adilson''s roda with Tabosa.',
  E'Conheceram-se nos pilotis da SQS 209 (~1965). Tabosa descrito como "um dos mais ágeis capoeiristas do Brasil." Competiram juntos no Berimbau de Ouro. Arraia depois visitou a roda de Adilson com Tabosa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Tabosa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Danadinho (training companion)
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
  NULL, NULL,
  '{"association_context": {"en": "Training companions in Brasília; met at SQS 209 pilotis", "pt": "Companheiros de treino em Brasília; conheceram-se nos pilotis da SQS 209"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://pt.wikipedia.org/wiki/Mestre_Adilson',
  E'Met at SQS 209 pilotis in Brasília (~1965). Danadinho later became Grupo Senzala co-founder.',
  E'Conheceram-se nos pilotis da SQS 209 em Brasília (~1965). Danadinho depois se tornou co-fundador do Grupo Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Danadinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Arraia (contemporary; visited his roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Arraia visited Adilson''s roda with Mestre Tabosa after returning to Brasília from Bahia; NOT a teacher-student relationship", "pt": "Arraia visitou a roda de Adilson com Mestre Tabosa após retornar a Brasília da Bahia; NÃO foi relação professor-aluno"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'Arraia observed: "In Bahia there was much cunning, but nothing compared to the power of your strikes." Met after Arraia returned from Salvador to Brasília.',
  E'Arraia observou: "Na Bahia existia muita malícia no jogo, porém não viu nada comparável à potência dos nossos golpes." Conheceram-se após Arraia retornar de Salvador para Brasília.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Arraia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Bimba (met in Goiânia 1972-1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '1973-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Met in Goiânia at Mestre Osvaldo''s academy; played in roda directed by Bimba; Bimba observed silently after Adilson defeated Mestre Onça", "pt": "Conheceram-se em Goiânia na academia de Mestre Osvaldo; jogou em roda dirigida por Bimba; Bimba observou em silêncio após Adilson derrotar Mestre Onça"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'Adilson met Bimba in Goiânia 1972-1973 at Mestre Osvaldo''s academy. Played in roda with Bimba directing and Mestre Gigante on pandeiro. Defeated Mestre Onça (Bimba''s adopted son). Bimba later inquired about Adilson''s student Leonides ("Diabo louro").',
  E'Adilson conheceu Bimba em Goiânia 1972-1973 na academia de Mestre Osvaldo. Jogou em roda com Bimba dirigindo e Mestre Gigante no pandeiro. Derrotou Mestre Onça (filho adotivo de Bimba). Bimba depois perguntou sobre o aluno de Adilson, Leonides ("Diabo louro").'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Acordeon (competed at 1977 championship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Faced each other in final of Campeonato Brasileiro 1977 at Clube Botafogo; Acordeon won controversially; later reconciled", "pt": "Enfrentaram-se na final do Campeonato Brasileiro 1977 no Clube Botafogo; Acordeon venceu de forma controversa; depois se reconciliaram"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'1977 Campeonato Brasileiro de Capoeira final at Clube Botafogo no Mourisco. Adilson finished 2nd, won technical highlight trophy. Judges'' decision was controversial (audience contested). Years later, Acordeon acknowledged Adilson''s skill.',
  E'Final do Campeonato Brasileiro de Capoeira 1977 no Clube Botafogo no Mourisco. Adilson terminou em 2º, ganhou troféu de destaque técnico. Decisão dos juízes foi controversa (público contestou). Anos depois, Acordeon reconheceu a habilidade de Adilson.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Adilson (Brasília) associated_with Fritz (Alfredo) - training companion at SQS 209, Brasília (~1965); competed together at Berimbau de Ouro
--   → Fritz needs import first (in backlog as "Fritz | Alfredo | - | Danadinho import")
-- Adilson (Brasília) founded Grupo Adilson Capoeira - group needs import first
--   → Add Grupo Adilson Capoeira to groups-backlog.md
-- Adilson (Brasília) associated_with Mestre Osvaldo (Goiânia) - hosted encounter with Bimba 1972-1973
--   → Mestre Osvaldo de Souza needs import (Goiânia, brought Bimba to Goiânia)
-- Adilson (Brasília) associated_with Mestre Gigante - played pandeiro at Goiânia roda with Bimba
--   → Mestre Gigante needs verification/import
-- Adilson (Brasília) associated_with Mestre Onça (Bimba's adopted son) - defeated in Goiânia roda
--   → NOTE: This is NOT the same as Onça (SP) or Onça Tigre - this is Bimba's adopted son
--   → Needs import with apelido_context to distinguish

-- ============================================================
-- STUDENTS (to be added when imported)
-- ============================================================
-- Adilson (Brasília) [teacher] → Mestre AC (Antônio Carlos)
-- Adilson (Brasília) [teacher] → Mestre Jomar
-- Adilson (Brasília) [teacher] → Mestre Roberto (Negão/Robertão)
-- Adilson (Brasília) [teacher] → Mestre Marquinhos (Marcus Vinícius) - deceased
-- Adilson (Brasília) [teacher] → Leonides ("Diabo louro")
-- Adilson (Brasília) [teacher] → Sergio-Maluco (taught in Sobradinho)
-- Adilson (Brasília) [teacher] → Abadá (taught at Colégio Rosário)
-- Adilson (Brasília) [teacher] → Ferrugem
