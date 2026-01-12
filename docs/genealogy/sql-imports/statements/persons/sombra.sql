-- ============================================================
-- STATEMENTS FOR: Sombra
-- Generated: 2026-01-12
-- Updated: 2026-01-12 (added Olívio Bispo relationship)
-- ============================================================
-- Contains all relationships where Sombra is the SUBJECT.
-- ============================================================

-- Sombra student_of Bispo (Olívio Bispo dos Santos)
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
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, londonschoolofcapoeira.com',
  E'Sombra joined the Bahia do Berimbau group in 1963 as the youngest and last member admitted. Trained under Mestre Olívio until his death in 1972. Upon seeing Sombra play, Olívio declared: "Você sabe a capoeira, precisa somente adquirir comportamento" (You know capoeira, you just need to acquire behavior). The older mestres entrusted Sombra with the mission to perpetuate and spread their tradition.',
  E'Sombra entrou no grupo Bahia do Berimbau em 1963 como o membro mais jovem e último a ser admitido. Treinou sob Mestre Olívio até sua morte em 1972. Ao ver Sombra jogar, Olívio declarou: "Você sabe a capoeira, precisa somente adquirir comportamento". Os mestres mais velhos confiaram a Sombra a missão de perpetuar e espalhar sua tradição.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sombra' AND o.apelido = 'Bispo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Sombra founded Associação de Capoeira Senzala de Santos - needs import first
--   Context: Founded 1975 at Rua Brás Cubas 227, Santos
--   Previously: Associação de Capoeira Zumbi (1972-1974)

-- ============================================================
-- STUDENT RELATIONSHIPS (Sombra as Object - NOT in this file)
-- ============================================================
-- The following students have Sombra as their teacher.
-- These relationships should go in each student's statements file:
--
-- Mestra Silvia Bazzarelli student_of Sombra (1980s, Santos)
--   Contra-Mestra 1989, Mestra 1994
--   Founded London School of Capoeira 1988
--
-- Mestre Marcos dos Santos student_of Sombra (1983-84, Santos)
--   Contra-Mestre 1995, Mestre 2006
--   London School of Capoeira
--
-- Mestre Beija-Flor student_of Sombra (Santos)
--   Recorded albums in Paris
--
-- Mestre Bahia student_of Sombra (Santos)
--   Recorded CD "Vozes de Senzala" with Sombra
--
-- Mestre Valtinho student_of Sombra (Santos)
--   First Contra-Mestre of Sombra
--
-- Mestre Valdir da Silva student_of Sombra (Santos)
--   Founded Capoeira Conviver, 20+ years in Santos/Manchester

-- ============================================================
-- ASSOCIATIONS (documented connections)
-- ============================================================
-- 1983 photograph at Mestre Suassuna's academy:
-- Sombra associated_with Suassuna - documented photo 1983
-- Sombra associated_with Gato Preto - documented photo 1983
-- Sombra associated_with Canjiquinha - documented photo 1983
-- Sombra associated_with Papo Amarelo - documented photo 1983
-- Sombra associated_with João Pequeno - documented photo 1983
--
-- These are not being generated as SQL statements because they
-- are mere presence in a group photograph, not documented working
-- relationships. They are documented in notes_en/notes_pt.
