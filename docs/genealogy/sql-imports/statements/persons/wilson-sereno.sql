-- ============================================================
-- STATEMENTS FOR: Wilson Sereno
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Wilson Sereno is the SUBJECT.
-- ============================================================

-- Wilson Sereno student_of Caiçara (primary teacher)
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
  'capoeirahub.net/mestres/693dbe24de8a6d001517e9fe-mestre-wilson-sereno',
  E'Wilson Sereno trained under Mestre Caiçara (Antônio Conceição Moraes, 1924-1997) in Salvador. CapoeiraHub emphasizes this was his primary teacher ("especially Mestre Caiçara"). CapoeiraHub also lists Wilson Sereno among Caiçara''s students. This was likely during the 1950s-1960s in Salvador before Wilson Sereno''s migration to Rio de Janeiro.',
  E'Wilson Sereno treinou com Mestre Caiçara (Antônio Conceição Moraes, 1924-1997) em Salvador. CapoeiraHub enfatiza que este foi seu professor principal ("especialmente Mestre Caiçara"). CapoeiraHub também lista Wilson Sereno entre os alunos de Caiçara. Isso foi provavelmente durante os anos 1950-1960 em Salvador antes da migração de Wilson Sereno para o Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Wilson Sereno' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Wilson Sereno trained_under Cobrinha Verde
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
  'capoeirahub.net/mestres/693dbe24de8a6d001517e9fe-mestre-wilson-sereno',
  E'Wilson Sereno "studied with Mestre Cobrinha Verde" (Rafael Alves França, 1912-1983) according to CapoeiraHub. Cobrinha Verde was the legendary mestre who was cousin and student of Besouro Mangangá, and who introduced the floor-touching mandinga gesture to Capoeira Angola. This training would have occurred in Salvador, probably in the 1950s-1960s. Designated as trained_under rather than student_of since Caiçara is specified as the primary teacher.',
  E'Wilson Sereno "estudou com Mestre Cobrinha Verde" (Rafael Alves França, 1912-1983) de acordo com CapoeiraHub. Cobrinha Verde era o lendário mestre que era primo e aluno de Besouro Mangangá, e que introduziu o gesto de mandinga de tocar o chão na Capoeira Angola. Este treinamento teria ocorrido em Salvador, provavelmente nos anos 1950-1960. Designado como trained_under em vez de student_of já que Caiçara é especificado como o professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Wilson Sereno' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Wilson Sereno trained_under Bimba
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
  'capoeirahub.net/mestres/693dbe24de8a6d001517e9fe-mestre-wilson-sereno',
  E'Wilson Sereno "studied with Mestre Bimba" (Manuel dos Reis Machado, 1899-1974) according to CapoeiraHub. Bimba was the founder of Capoeira Regional. This cross-lineage training—studying under both Angola (Caiçara, Cobrinha Verde) and Regional (Bimba) mestres—was not unusual for serious capoeiristas in mid-20th century Salvador. Designated as trained_under rather than student_of since Caiçara is specified as the primary teacher.',
  E'Wilson Sereno "estudou com Mestre Bimba" (Manuel dos Reis Machado, 1899-1974) de acordo com CapoeiraHub. Bimba foi o fundador da Capoeira Regional. Este treinamento entre linhagens—estudar com mestres de Angola (Caiçara, Cobrinha Verde) e Regional (Bimba)—não era incomum para capoeiristas sérios em Salvador de meados do século XX. Designado como trained_under em vez de student_of já que Caiçara é especificado como o professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Wilson Sereno' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Wilson Sereno associated_with Moraes (contemporaries at Casa do Marinheiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both taught/practiced capoeira at Casa do Marinheiro on Avenida Brasil in Rio de Janeiro during the early 1970s. Moraes came to Rio as a Navy marine; Casa do Marinheiro was a Navy-affiliated facility.", "pt": "Ambos ensinavam/praticavam capoeira na Casa do Marinheiro na Avenida Brasil no Rio de Janeiro durante o início dos anos 1970. Moraes veio ao Rio como fuzileiro naval; Casa do Marinheiro era uma instalação afiliada à Marinha."}}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahub.net/mestres/693dbe24de8a6d001517e9fe-mestre-wilson-sereno, academic literature on capoeira angola in Rio 1970-1981',
  E'CapoeiraHub states that Wilson Sereno "taught in Rio at Casa Marinheiro, a place that Mestre Moraes also frequented." This connection places Wilson Sereno at an important early venue for Capoeira Angola in Rio de Janeiro during the formative years before GCAP''s founding in 1980.',
  E'CapoeiraHub afirma que Wilson Sereno "ensinava no Rio na Casa Marinheiro, um lugar que Mestre Moraes também frequentava." Esta conexão posiciona Wilson Sereno em um importante local inicial para a Capoeira Angola no Rio de Janeiro durante os anos formativos antes da fundação do GCAP em 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Wilson Sereno' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have objects that need to be imported first.
-- Once imported, create statements where THAT PERSON is the subject.
--
-- STUDENTS OF WILSON SERENO (these go in their respective files as "X student_of Wilson Sereno"):
-- - Mestre Nilson da Penha (Rio de Janeiro) student_of Wilson Sereno - pending import
--
-- NOTE: Limited documentation on Wilson Sereno's complete student roster.
-- CapoeiraHub only lists Nilson da Penha.
--
-- ============================================================
