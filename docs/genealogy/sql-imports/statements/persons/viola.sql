-- ============================================================
-- STATEMENTS FOR: Viola (Central Penitentiary)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Viola is the SUBJECT.
-- ============================================================

-- Viola associated_with Madame Satã (fellow prisoner at Central Penitentiary)
-- Note: Madame Satã documented Viola in his memoirs as "the king of capoeira
-- in the port area of Rio" during his Central Penitentiary experience.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision, -- Madame Satã at Central Penitentiary in 1947
  NULL, NULL,
  '{"association_context": "fellow_prisoner_central_penitentiary"}'::jsonb,
  'likely'::genealogy.confidence,
  'Memórias de Madame Satã (1972); Capoeira History',
  'Viola was mentioned by Madame Satã in his memoirs as "the king of capoeira in the port area of Rio" during his time at the Central Penitentiary. Whether they were direct contemporaries or Viola was known to Satã by reputation is unclear.',
  'Viola foi mencionado por Madame Satã em suas memórias como "o rei da capoeira na zona portuária do Rio" durante seu tempo na Penitenciária Central. Se eram contemporâneos diretos ou se Viola era conhecido por Satã por reputação não está claro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Viola' AND s.apelido_context = 'Central Penitentiary'
  AND o.apelido = 'Madame Satã'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified. Viola's teachers, students, and other associates
-- are unknown. His dominance in the port area suggests he would have
-- known other port-area capoeiristas like Prata Preta, but no specific
-- documented connections exist beyond Madame Satã's mention.
-- ============================================================
