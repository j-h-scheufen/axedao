-- ============================================================
-- STATEMENTS FOR: Major Dória
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Major Dória is the SUBJECT.
-- Note: Major Dória was NOT a capoeirista - he was a patron/founder.
-- His relationships are to the academy he founded (as `founded`)
-- and to the instructors he recruited (as `associated_with`).
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Major Dória founded Academia Cultura Física e Capoeira Major Dória (1958)
--   - GROUP NOT YET IMPORTED - add to groups-backlog.md
--
-- Major Dória associated_with Maneca Brandão - PERSON EXISTS
--   Context: Recruited Maneca Brandão to be primary capoeira instructor at his academy (1958)
--
-- Major Dória associated_with Zoião - PERSON EXISTS
--   Context: Zoião assisted with training at the academy alongside Maneca Brandão
--
-- Major Dória associated_with Amélia Prado - PERSON NOT IMPORTED
--   Context: She provided the building for the academy
--   Note: Not a capoeirista - do not import to persons backlog

-- ============================================================
-- ACTUAL RELATIONSHIPS (objects exist in dataset)
-- ============================================================

-- Major Dória associated_with Maneca Brandão (recruited as instructor)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "patron-instructor: Major Dória recruited Maneca Brandão to teach capoeira at Academia Major Dória in Itabuna"}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, velhosmestres.com, 4capoeirathoughts.wordpress.com',
  E'Major Dória recruited Mestre Maneca Brandão (a formado of Bimba) to be the primary capoeira instructor at his newly established Academia Cultura Física e Capoeira Major Dória in Itabuna in 1958. Maneca Brandão was the son of Ubaldino Brandão, a former mayor of Itabuna, which may have facilitated the connection.',
  E'Major Dória recrutou Mestre Maneca Brandão (um formado de Bimba) para ser o instrutor principal de capoeira na recém-fundada Academia Cultura Física e Capoeira Major Dória em Itabuna em 1958. Maneca Brandão era filho de Ubaldino Brandão, um ex-prefeito de Itabuna, o que pode ter facilitado a conexão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Major Dória' AND o.apelido = 'Maneca Brandão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Major Dória associated_with Zoião (assistant instructor)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "patron-instructor: Zoião sometimes assisted Maneca Brandão with training at Major Dória''s academy"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-17, cdosergipe.wixsite.com',
  E'Mestre Zoião, classmate of Maneca Brandão from Mestre Bimba''s academy, sometimes helped with training sessions at Major Dória''s academy in Itabuna. This brought a second formado of Bimba to assist in establishing Capoeira Regional in southern Bahia.',
  E'Mestre Zoião, colega de turma de Maneca Brandão na academia de Mestre Bimba, às vezes ajudava nos treinamentos na academia do Major Dória em Itabuna. Isso trouxe um segundo formado de Bimba para auxiliar no estabelecimento da Capoeira Regional no sul da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Major Dória' AND o.apelido = 'Zoião'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING GROUP RELATIONSHIP
-- ============================================================
-- When Academia Cultura Física e Capoeira Major Dória is imported as a group:
--
-- Major Dória founded Academia Cultura Física e Capoeira Major Dória
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   '1958-01-01'::date, 'year'::genealogy.date_precision,
--   NULL, NULL,
--   '{}'::jsonb,
--   'verified'::genealogy.confidence,
--   'portalcapoeira.com, 4capoeirathoughts.wordpress.com',
--   E'Major Dória founded the Academia Cultura Física e Capoeira Major Dória in 1958, the first formal capoeira academy in Itabuna.',
--   E'Major Dória fundou a Academia Cultura Física e Capoeira Major Dória em 1958, a primeira academia formal de capoeira em Itabuna.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Major Dória' AND o.name = 'Academia Cultura Física e Capoeira Major Dória'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
