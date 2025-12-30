-- ============================================================
-- STATEMENTS FOR: Boca Rica
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Boca Rica is the SUBJECT.
-- ============================================================

-- Boca Rica student_of Pastinha (primary teacher at CECA, 1952 onwards)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, bocarica.wordpress.com, capoeira-connection.com interview',
  'Direct student of Mestre Pastinha at CECA from 1952 until Pastinha''s death in 1981. Boca Rica described Pastinha as "a philosopher" and "my second father". Accompanied Pastinha until his final days and continued to spread his legacy.',
  'Aluno direto de Mestre Pastinha no CECA de 1952 até a morte de Pastinha em 1981. Boca Rica descreveu Pastinha como "um filósofo" e "meu segundo pai". Acompanhou Pastinha até seus últimos dias e continuou a espalhar seu legado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boca Rica' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boca Rica trained_under Waldemar (additional training at barracão)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'bocarica.wordpress.com, velhosmestres.com',
  'Frequented Mestre Waldemar''s famous barracão at Passeio de Aguinelo in Liberdade neighborhood. Learned berimbau rhythms from Waldemar alongside his primary training with Pastinha.',
  'Frequentava o famoso barracão de Mestre Waldemar no Passeio de Aguinelo no bairro da Liberdade. Aprendeu toques de berimbau com Waldemar junto com seu treino principal com Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boca Rica' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boca Rica associated_with Bigodinho (collaborator on recordings and events)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "musical collaborators"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, discogs.com, capoeirashop.fr',
  'Close musical collaborators. Recorded collaborative CD "Capoeira Angola" together in 2000 (37 songs). Both shared passion for samba-de-roda. Photographed together with other mestres in 1960s. Participated together in 1988 Velha Guarda event.',
  'Colaboradores musicais próximos. Gravaram CD colaborativo "Capoeira Angola" juntos em 2000 (37 cantigas). Ambos compartilhavam paixão pelo samba-de-roda. Fotografados juntos com outros mestres nos anos 1960. Participaram juntos do evento Velha Guarda de 1988.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boca Rica' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Boca Rica founded ECAB (Escola de Capoeira Angola da Bahia) - ECAB not in groups dataset
-- Boca Rica member_of CECA - CECA not in groups dataset
-- Boca Rica member_of ABCA (board member) - ABCA not in groups dataset
-- Boca Rica associated_with Viva Bahia (folkloric group) - Viva Bahia not in groups dataset
-- Boca Rica associated_with João Pequeno (photographed together 1960s) - João Pequeno pending import
-- Boca Rica associated_with Curió (photographed together, Velha Guarda events) - Curió done, can add later
-- Boca Rica associated_with Olavo (photographed together 1960s) - Olavo pending import
