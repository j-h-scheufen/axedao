-- ============================================================
-- STATEMENTS FOR: Zé Pedro
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Zé Pedro is the SUBJECT.
-- ============================================================

-- Zé Pedro student_of Mário Buscapé
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-ze-pedro/',
  'Learned capoeira at Mário Buscapé''s academy; developed berimbau skills and chula singing there; met Paulão Muzenza and Mintirinha at this academy',
  'Aprendeu capoeira na academia de Mário Buscapé; desenvolveu habilidades de berimbau e canto de chulas lá; conheceu Paulão Muzenza e Mintirinha nesta academia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Pedro' AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Pedro associated_with Paulão Muzenza (lifelong friendship, roda companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "lifelong_friendship_roda_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-ze-pedro/',
  'Great friend and constant companion in rodas and life; met at Mário Buscapé''s academy; Paulão encouraged Zé Pedro''s career advancement',
  'Grande amigo e companheiro constante nas rodas e na vida; conheceram-se na academia de Mário Buscapé; Paulão encorajou o avanço na carreira de Zé Pedro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Pedro' AND o.apelido = 'Paulão' AND o.apelido_context = 'Muzenza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Pedro associated_with Mintirinha (lifelong friendship, shared first academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "lifelong_friendship_training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-ze-pedro/',
  'Met at Mário Buscapé''s academy; shared first academy space in Jacarepaguá (Pequenos Libertadores); lifelong companions in capoeira',
  'Conheceram-se na academia de Mário Buscapé; compartilharam primeiro espaço de academia em Jacarepaguá (Pequenos Libertadores); companheiros de toda a vida na capoeira'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Pedro' AND o.apelido = 'Mintirinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zé Pedro associated_with Dentinho - prominent at Zé Pedro's roda 1970s
--   → Dentinho needs import
-- Zé Pedro associated_with Touro - listed among prominent Rio capoeiristas at Zé Pedro's roda
--   → Touro needs import
-- Zé Pedro associated_with Silas - co-founder of Kapoarte; roda participant
--   → Silas is in persons-backlog.md (pending import)
-- Zé Pedro associated_with Khorvo - regular at Zé Pedro's roda
--   → Khorvo needs import
-- Zé Pedro associated_with Nilson Arerê - regular at Zé Pedro's roda
--   → Nilson Arerê needs import
-- Zé Pedro associated_with Macaco Preto - regular at Zé Pedro's roda
--   → Macaco Preto needs import
-- Zé Pedro associated_with Luiz Peito Queimado - advanced student
--   → Luiz Peito Queimado needs import
-- Zé Pedro associated_with Paulinho Guaiamum - advanced student
--   → Paulinho Guaiamum needs import
