-- ============================================================
-- STATEMENTS FOR: Besouro Mangangá
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Besouro Mangangá is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1908-01-01'::date, 'approximate'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Papoeira.com, Wikipedia - multiple sources agree',
  'Learned capoeira from Tio Alípio in Trapiche de Baixo, Santo Amaro, from a young age. Tio Alípio was an African ex-slave and Babalaô who worked at Engenho de Pantaleão.',
  'Aprendeu capoeira com Tio Alípio no Trapiche de Baixo, Santo Amaro, desde jovem. Tio Alípio era um ex-escravo africano e Babalaô que trabalhava no Engenho de Pantaleão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Besouro Mangangá' AND o.apelido = 'Tio Alípio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1908-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Papoeira.com - multiple sources document his training in Trapiche de Baixo',
  'Besouro moved to Trapiche de Baixo at age 13 (~1908) and trained/taught there until his death in 1924. The neighborhood "became his school."',
  'Besouro mudou-se para o Trapiche de Baixo aos 13 anos (~1908) e treinou/ensinou lá até sua morte em 1924. O bairro "tornou-se sua escola."'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Besouro Mangangá' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'teaches_at'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1912-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Papoeira.com - documented teaching Cobrinha Verde from 1912',
  'Besouro taught capoeira in secret at Trapiche de Baixo. When police appeared, he would send students away and face authorities alone.',
  'Besouro ensinava capoeira em segredo no Trapiche de Baixo. Quando a polícia aparecia, ele mandava os alunos embora e enfrentava as autoridades sozinho.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Besouro Mangangá' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
