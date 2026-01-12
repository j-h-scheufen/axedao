-- ============================================================
-- STATEMENTS FOR: Formiga (Niterói)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Formiga (Niterói) is the SUBJECT.
-- Uses apelido_context 'Niterói' to distinguish from other Formiga profiles.
-- ============================================================

-- Formiga (Niterói) student_of Zé Baiano
-- Primary teacher; Angola lineage from Mestre Gato Preto
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira - Vadiando Entre Amigos',
  'Primary teacher; Formiga described as "disciple of Mestre Zé Baiano (lineage of Mestre Gato Preto, Berimbau de Ouro da Bahia)"',
  'Professor primário; Formiga descrito como "discípulo do Mestre Zé Baiano (linhagem do Mestre Gato Preto, Berimbau de Ouro da Bahia)"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND s.apelido_context = 'Niterói'
  AND o.apelido = 'Zé Baiano'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga (Niterói) associated_with Marrom (Rio de Janeiro)
-- Co-precursor of "Vadiando Entre Amigos" movement (1990s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "co_precursor_vadiando_entre_amigos"}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira - Vadiando Entre Amigos',
  'Co-precursor of "Vadiando Entre Amigos" movement; itinerant rodas across Rio (1990s-2002)',
  'Co-precursor do movimento "Vadiando Entre Amigos"; rodas itinerantes pelo Rio (anos 1990-2002)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND s.apelido_context = 'Niterói'
  AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Formiga (Niterói) associated_with Camaleão - needs import first
--   Co-precursor of "Vadiando Entre Amigos" movement; based at Morro do Turano, Tijuca
--
-- Formiga (Niterói) founded Grupo Ilê de Angola (1996) - group needs import
--   Co-founded with students including Ricardinho
--
-- Formiga (Niterói) leads Grupo Ilê de Angola - group needs import
--   Current leadership role
--
-- Ricardinho student_of Formiga (Niterói) - Ricardinho needs import first
--   Started 1984 in Badu community; professor 1992; contramestre 1996; now mestre
