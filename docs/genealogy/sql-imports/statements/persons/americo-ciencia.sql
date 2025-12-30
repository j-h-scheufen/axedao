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

-- Américo Ciência associated_with Bimba (1936 Parque Odeon challenge fight)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Defeated by Bimba in 1936 Parque Odeon challenge - one of four opponents Bimba faced", "pt": "Derrotado por Bimba no desafio do Parque Odeon 1936 - um dos quatro oponentes que Bimba enfrentou"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal A Tarde, Mar 16, 1936',
  'Also fought exhibition match vs Henrique Bahia at Parque Odeon (Feb 18, 1936) with undecided outcome.',
  'Também lutou exibição contra Henrique Bahia no Parque Odeon (18 fev 1936) com resultado indeciso.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Américo Ciência' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
