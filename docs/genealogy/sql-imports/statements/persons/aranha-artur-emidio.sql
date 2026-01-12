-- ============================================================
-- STATEMENTS FOR: Aranha (Artur Emídio)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Aranha (Artur Emídio) is the SUBJECT.
--
-- NOTE: Uses apelido_context 'Artur Emídio' to distinguish this Aranha
-- from other capoeiristas with the same apelido.
-- ============================================================

-- Aranha trained_under Artur Emídio
-- Context: Trained at Artur Emídio's academy in Bonsucesso, Rio de Janeiro;
-- appears in historic photo from the academy (André Lacé collection)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
  E'Aranha appears in historic photo at Artur Emídio''s academy and participated in rodas there. Exact training period unknown.',
  E'Aranha aparece em foto histórica na academia de Artur Emídio e participou de rodas lá. Período exato de treinamento desconhecido.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aranha' AND s.apelido_context = 'Artur Emídio'
  AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES (NOT generating associated_with statements)
-- ============================================================
-- Per genealogy guidelines, we do NOT generate associated_with statements
-- merely for appearing in the same photo or roda. These are contemporaries:
--
-- From historic photo at Artur Emídio's academy (André Lacé collection):
-- - Mintirinha (standing)
-- - Zé Pedro (berimbau)
-- - Djalma (pandeiro)
-- - Silas (standing)
-- - Celso (standing)
-- - Luiz Malhado (crouched)
-- - Cigano (crouched)
-- - Artur Emídio (crouched)
-- - André Lacé (crouched)
-- - Preguiça (crouched)
--
-- From Zé Pedro's roda musicians (1973-1979):
-- - Zé Pedro (berimbau)
-- - Djalma (pandeiro)
-- - Silas (atabaque)
--
-- No specific documented interactions beyond shared presence in photos/rodas.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- No pending relationships - all relationships are to documented entities.
-- ============================================================
