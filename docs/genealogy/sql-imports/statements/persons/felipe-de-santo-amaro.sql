-- ============================================================
-- STATEMENTS FOR: Felipe de Santo Amaro
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Felipe de Santo Amaro is the SUBJECT.
-- ============================================================

-- Felipe trained_under Pastinha (CECA, Salvador)
-- Per UFRB honorary doctorate citation: "chegou a ser aluno da famosa Escola de Mestre Pastinha"
-- Exact dates unknown, but after 1947 (after Vivi de Popó)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'UFRB honorary doctorate citation',
  'Per UFRB: "chegou a ser aluno da famosa Escola de Mestre Pastinha" - date unknown, likely after 1947',
  'Conforme UFRB: "chegou a ser aluno da famosa Escola de Mestre Pastinha" - data desconhecida, provavelmente após 1947'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Felipe de Santo Amaro' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Felipe associated_with Marrom (velha guarda CD collaborations 1990s-2000s)
-- Documented as part of old guard who worked with Marrom on recordings
-- Marrom specifically sought out Felipe and other old mestres for CD recording projects
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "cd_recording_collaboration"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/master-marrom/, marrom.md report',
  'Marrom sought out Felipe as part of velha guarda for CD recording projects in 1990s-2000s',
  'Marrom procurou Felipe como parte da velha guarda para projetos de gravação de CDs nos anos 1990-2000'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Felipe de Santo Amaro'
  AND o.apelido = 'Marrom' AND COALESCE(o.apelido_context, '') = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- Felipe student_of Arlindo (Santo Amaro, 1945) - NEEDS IMPORT
-- First formal teacher, angoleiro

-- Felipe student_of Vivi de Popó (Santo Amaro, 1947) - NEEDS IMPORT
-- Pioneer at Bembé do Mercado; perfected Felipe's techniques

-- Felipe influenced_by Popó do Maculelê (encouraged him to join Capoeira Angola) - NEEDS IMPORT
-- Mestre Popó de Maculelê (1876-1969) encouraged Felipe to pursue Capoeira Angola

-- Felipe associated_with Cláudio da Feira (CD collaboration "Angoleiros do Sertão e do Recôncavo" 2004) - NEEDS IMPORT
-- Mestre Cláudio Costa, founder of Angoleiros do Sertão; specific CD collaboration

-- Felipe associated_with Curió (Mestres Navegantes 2019) - EXISTS but verify apelido
-- Specific recording project collaboration

-- Felipe associated_with Adó (Mestres Navegantes 2019) - NEEDS IMPORT
-- Specific recording project collaboration

-- Felipe associated_with Vavá (Documento Sonoro do Folclore Brasileiro 1988) - NEEDS IMPORT
-- Directed the academic recording project Felipe participated in

-- Carcará student_of Felipe (started with Vivi de Popó then became Felipe's student) - GOES IN carcara.sql
-- Per academic article: Mestre Carcará (Antônio dos Santos, b. Jan 3, 1942) trained under Felipe

-- ============================================================
-- NOT GENERATING (contemporaries, not direct collaboration):
-- ============================================================
-- Felipe and Gato Preto - both worked with Marrom but no direct collaboration documented
-- Felipe and Bigodinho - both worked with Marrom but no direct collaboration documented
-- Felipe and Boca Rica - both worked with Marrom but no direct collaboration documented
-- Felipe and João Grande - both worked with Marrom but no direct collaboration documented
-- Felipe and Brandão - both worked with Marrom but no direct collaboration documented
-- These are captured in notes_en/notes_pt as "OLD GUARD COLLABORATORS" for reference
-- ============================================================
