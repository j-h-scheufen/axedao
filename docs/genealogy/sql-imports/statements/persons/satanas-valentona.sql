-- ============================================================
-- STATEMENTS FOR: Satanás (Valentona)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Satanás (valentona) is the SUBJECT.
-- DISTINCT from Roberto Satanás (Pastinha student).
-- ============================================================

-- Satanás (valentona) trained_under Mestre Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Capoeira Connection (2011): "Few women played in the 1940s and 1950s; among those who did, we highlight Nega Didi, Maria Homem, Satanás, Maria para o bonde and Calça rala, all students of Mestre Bimba"',
  E'Satanás was listed among the female students of Mestre Bimba during the 1940s-1950s, alongside Nega Didi, Maria Homem, Maria para o bonde, and Calça Rala. These women reportedly disguised as men to participate in rodas.',
  E'Satanás foi listada entre as alunas de Mestre Bimba durante os anos 1940-1950, junto com Nega Didi, Maria Homem, Maria para o bonde e Calça Rala. Essas mulheres supostamente se disfarçaram de homens para participar das rodas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Satanás' AND s.apelido_context = 'valentona' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Satanás associated_with Nega Didi - contemporary female capoeirista (pending import)
-- Satanás associated_with Calça Rala - contemporary female capoeirista (pending import)
-- Satanás associated_with Maria Pára o Bonde - contemporary female capoeirista (pending import)
-- NOTE: Maria Doze Homens IS in dataset but no specific documented interaction beyond being contemporaries
