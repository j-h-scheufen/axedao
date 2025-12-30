-- ============================================================
-- STATEMENTS FOR: Zé I (José Custódio dos Santos)
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Zé I is the SUBJECT.
-- ============================================================

-- Zé I associated_with Bimba (1936 Parque Odeon challenge fight)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-03-18'::date, 'exact'::genealogy.date_precision,
  '1936-03-18'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "Defeated by Bimba 15-2 in 1936 Parque Odeon challenge - the only opponent explicitly identified as a fellow capoeira master", "pt": "Derrotado por Bimba 15-2 no desafio do Parque Odeon 1936 - o único oponente explicitamente identificado como mestre de capoeira"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal A Tarde, Mar 16, 1936',
  'Scored only 2 points: one meia lua/armada hit and one tesoura hit. His defeat was significant as a direct test of Bimba''s Regional against traditional capoeira.',
  'Marcou apenas 2 pontos: um golpe de meia lua/armada e um golpe de tesoura. Sua derrota foi significativa como teste direto da Regional de Bimba contra a capoeira tradicional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé I' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- 1937 II CONGRESSO AFRO-BRASILEIRO PARTICIPATION
-- ============================================================
-- Zé I participated in the 1937 Congress demonstration alongside
-- 15+ other capoeiristas. This event participation is documented
-- in his bio and notes, NOT as individual associated_with
-- relationships (which would create massive redundancy).
--
-- CONTEMPORARIES AT 1937 CONGRESS (documented in bio, not as statements):
-- - Samuel Querido de Deus (director), Barbosa, Ambrósio, Onça Preta,
--   Juvenal, Zeppelin, Bugaia, Fernandes, Eutíquio, Neném, Barroso,
--   Arthur Mattos, Raphael, Edgar, Damião
-- ============================================================
