-- ============================================================
-- STATEMENTS FOR: Américo Ciência
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Américo Ciência is the SUBJECT.
-- ============================================================

-- Américo Ciência associated_with Gengibirra (pre-CECA Liberdade roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  NULL, NULL, -- started_at unknown; active in 1936-1941 based on sources
  '1941-02-23'::date, 'exact'::genealogy.date_precision, -- ended when Pastinha took over
  '{"association_context": {"en": "Member of the informal capoeira angola gathering at Liberdade that preceded CECA", "pt": "Membro da reunião informal de capoeira angola na Liberdade que antecedeu o CECA"}}'::jsonb,
  'likely'::genealogy.confidence,
  'A Tarde newspaper, February 24, 1969 (reproduced at velhosmestres.com/en/pastinha-1969-3)',
  'Listed among mestres at the Liberdade/Gengibirra roda alongside Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique. Note: NOT among the 22 founding mestres of Gengibirra per Noronha''s manuscripts - suggesting he was a regular participant but not an organizational founder.',
  'Listado entre os mestres na roda da Liberdade/Gengibirra junto com Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique. Nota: NÃO entre os 22 mestres fundadores do Gengibirra conforme manuscritos de Noronha - sugerindo que era um participante regular mas não um fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Américo Ciência' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or relationship direction reversed)
-- ============================================================
-- NOTE: Bimba defeated Américo Ciência in 1936 - but there is no "defeated" predicate.
-- This is documented in Bimba's bio, not as a statement relationship.
-- Similarly, the exhibition vs Henrique Bahia is historical context, not a relationship.
