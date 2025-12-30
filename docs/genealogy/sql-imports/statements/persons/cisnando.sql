-- ============================================================
-- STATEMENTS FOR: Cisnando
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Cisnando is the SUBJECT.
-- ============================================================

-- Cisnando student_of Bimba (~1932-1974)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1932-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeiradabahia.portalcapoeira.com/dr-jos-qcisnandoq-lima-a-pedra-fundamental-da-regional/',
  E'Cisnando found Bimba in the Curuzú neighborhood of Liberdade while studying medicine. Though initially refused because capoeira was "for Black people," Cisnando endured Bimba''s gravata test (three minutes in a neck lock) and was accepted. More than a student, Cisnando became a collaborator who contributed academic methodology to Bimba''s system.',
  E'Cisnando encontrou Bimba no bairro do Curuzú, na Liberdade, enquanto estudava medicina. Embora inicialmente recusado porque capoeira era "para gente preta," Cisnando suportou o teste da gravata de Bimba (três minutos em uma chave de pescoço) e foi aceito. Mais que um aluno, Cisnando tornou-se um colaborador que contribuiu com metodologia acadêmica para o sistema de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cisnando' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cisnando trained_under Takeo Yano (jiu-jitsu, before 1932)
-- NOTE: Takeo Yano is not in genealogy database - not a capoeirista
-- This relationship is documented in notes_en/notes_pt only

-- Cisnando associated_with Decânio (fellow pillars of Regional)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both were university-educated students of Bimba who formed the two intellectual pillars of Capoeira Regional. Both contributed academic methodology and institutional legitimacy to the art.", "pt": "Ambos eram alunos universitários de Bimba que formaram os dois pilares intelectuais da Capoeira Regional. Ambos contribuíram com metodologia acadêmica e legitimidade institucional para a arte."}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira-da-bahia/dr-jose-qcisnandoq-lima-a-pedra-fundamental-da-regional/',
  E'Cisnando (Initial Phase, 1930-1937) and Decânio (Consolidation Phase, from 1938) formed the two intellectual "pillars" upon which Bimba built Capoeira Regional. Both were university-educated professionals (medicine) who gave the art academic structure and social legitimacy.',
  E'Cisnando (Fase Inicial, 1930-1937) e Decânio (Fase de Consolidação, a partir de 1938) formaram os dois "pilares" intelectuais sobre os quais Bimba construiu a Capoeira Regional. Ambos eram profissionais com educação universitária (medicina) que deram à arte estrutura acadêmica e legitimidade social.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cisnando' AND o.apelido = 'Decânio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Cisnando trained_under Takeo Yano (jiu-jitsu) - NOT APPLICABLE: Yano not a capoeirista, will not be imported
-- Cisnando trained_under Takamatsu (karate) - NOT APPLICABLE: Takamatsu not a capoeirista, will not be imported
-- Cisnando trained_under Mitsuyo Maeda (jiu-jitsu) - DISPUTED: Some sources mention, primary sources do not confirm; Maeda not a capoeirista
--
-- NOTE: The Centro de Cultura Física e Luta Regional (Bimba's academy) is in groups-backlog.md.
-- Once imported, a member_of relationship could be added, but Cisnando's relationship was more
-- collaborative than formal membership - he helped BUILD the academy/system.
