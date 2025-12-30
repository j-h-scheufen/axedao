-- ============================================================
-- STATEMENTS FOR: Bamba
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Bamba is the SUBJECT.
-- ============================================================

-- Bamba student_of Vermelho 27
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  '1996-05-18'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira interview; Lalaue; UNICAR München',
  E'Primary mestre at ACMB. Bamba began training at the Associação de Capoeira Mestre Bimba in 1977, introduced by Vermelho Boxel. Trained under Vermelho 27 until his death on May 18, 1996. Received mestre diploma from Vermelho 27.',
  E'Mestre principal na ACMB. Bamba começou a treinar na Associação de Capoeira Mestre Bimba em 1977, apresentado por Vermelho Boxel. Treinou sob Vermelho 27 até sua morte em 18 de maio de 1996. Recebeu diploma de mestre de Vermelho 27.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bamba' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bamba received_title_from Vermelho 27
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'Portal Capoeira interview',
  E'Received mestre diploma from Vermelho 27. Exact date unknown.',
  E'Recebeu diploma de mestre de Vermelho 27. Data exata desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bamba' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Bamba trained_under Vermelho Boxel (Cecílio de Jesus Calheiros) - first mestre, street training 1977; needs import
-- Bamba trained_under Coringa - assisted at ACMB; needs import
-- Bamba trained_under Ferro Velho (Durval) - assisted at ACMB, great influence; pending in backlog
-- Bamba trained_under Boa Gente - assisted at ACMB; pending in backlog
-- Bamba trained_under Bahia - assisted at ACMB; pending in backlog
-- Bamba leads Associação de Capoeira Mestre Bimba (ACMB) - 1986-present; group pending in backlog
