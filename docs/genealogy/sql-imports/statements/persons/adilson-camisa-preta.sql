-- ============================================================
-- STATEMENTS FOR: Adilson Camisa Preta
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Adilson Camisa Preta is the SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Adilson Camisa Preta student_of Roque
-- Primary teacher; Adilson became Roque's senior student
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Adilson trained under Mestre Roque at the Pavao/Pavaozinho academy, becoming his most advanced student. Training start date unknown, but by the early 1970s Adilson was ready to take over the school.',
  E'Adilson treinou sob Mestre Roque na academia do Pavao/Pavaozinho, tornando-se seu aluno mais avancado. Data de inicio do treinamento desconhecida, mas no inicio dos anos 1970 Adilson estava pronto para assumir a escola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson Camisa Preta' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- Adilson Camisa Preta received_title_from Roque
--   - Implied: as Roque's senior student who took over the school, he was
--     likely formally graduated by Roque, though this is not explicitly documented
--   - Confidence would be 'likely' if added
--
-- Adilson Camisa Preta teaches_at Grupo Bantus de Capoeira
--   - Taught at this group founded by Mestre Roque
--   - Needs group import first (in groups-backlog.md)
--
-- Adilson Camisa Preta associated_with Mercedes Batista
--   - Collaborated with Mercedes Batista (first Black dancer at Rio Municipal Theatre)
--   - Mercedes Batista is NOT a capoeirista - do not import to genealogy
--   - Association documented in bio text only
--
-- Adilson Camisa Preta associated_with Aroldo Costa
--   - Collaborated with Aroldo Costa (Afro-Brazilian cultural figure)
--   - Aroldo Costa is NOT a capoeirista - do not import to genealogy
--   - Association documented in bio text only
--
-- ============================================================
