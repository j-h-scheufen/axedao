-- ============================================================
-- STATEMENTS FOR: Gegê
-- Generated: 2025-12-30
-- ============================================================
-- Contains all relationships where Gegê is the SUBJECT.
-- ============================================================

-- Gegê trained_under Waldemar (Salvador - learned berimbau fabrication)
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
  'aldeiacapoeira.com/mestregege.html',
  E'In Salvador, Gegê learned to fabricate painted berimbaus from Mestre Waldemar. This was before his 1965 move to Rio de Janeiro.',
  E'Em Salvador, Gegê aprendeu a fabricar berimbaus pintados com Mestre Waldemar. Isso foi antes de sua mudança para o Rio de Janeiro em 1965.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gegê' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gegê associated_with Barbosa (Duque de Caxias) - co-pioneers of Caxias capoeira
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "co-pioneers of capoeira in Duque de Caxias"}'::jsonb, 'verified'::genealogy.confidence,
  'aldeiacapoeira.com/mestregege.html',
  E'Together with Mestre Barbosa, Gegê is considered one of the pioneers of capoeira in the neighborhood of Caxias in Rio de Janeiro.',
  E'Junto com Mestre Barbosa, Gegê é considerado um dos pioneiros da capoeira no bairro de Caxias no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gegê' AND o.apelido = 'Barbosa' AND o.apelido_context = 'Duque de Caxias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gegê associated_with Raimundo (Caxias) - fellow "mestres imprescindíveis"
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
  '{"association_context": "mestres imprescindíveis de Caxias; contributed to Museu Vivo da Capoeira"}'::jsonb, 'verified'::genealogy.confidence,
  'lurdinha.org/site/roda-livre-de-caxias-completa-50-anos/',
  E'Gegê, Raimundo, and Levi are named as the "mestres imprescindíveis" (indispensable masters) of capoeira in Caxias, who together built the Museu Vivo da Capoeira.',
  E'Gegê, Raimundo e Levi são nomeados como os "mestres imprescindíveis" da capoeira em Caxias, que juntos construíram o Museu Vivo da Capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gegê' AND o.apelido = 'Raimundo' AND o.apelido_context = 'Duque de Caxias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gegê trained_under Sete (Bahia - first exposure to capoeira and Afro-Brazilian culture)
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
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'aldeiacapoeira.com/mestregege.html',
  E'Mestre Sete was Gegê''s first teacher, introducing him to capoeira and Afro-Brazilian culture in Maragojipe, Bahia during his childhood. This training ended when Gegê moved to Rio de Janeiro in 1965.',
  E'Mestre Sete foi o primeiro professor de Gegê, introduzindo-o à capoeira e à cultura afro-brasileira em Maragojipe, Bahia durante sua infância. Este treinamento terminou quando Gegê mudou-se para o Rio de Janeiro em 1965.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gegê' AND o.apelido = 'Sete' AND o.apelido_context = 'Gegê teacher'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gegê trained_under Fernandinho (Rio de Janeiro, 1965+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'aldeiacapoeira.com/mestregege.html',
  E'After arriving in Rio de Janeiro in 1965, Gegê trained under Fernandinho, who was a student of Caiçara.',
  E'Após chegar ao Rio de Janeiro em 1965, Gegê treinou com Fernandinho, que era aluno de Caiçara.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gegê' AND o.apelido = 'Fernandinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gegê associated_with Levi (Caxias) - fellow "mestre imprescindível", built Museu Vivo da Capoeira together
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
  '{"association_context": "mestres imprescindíveis de Caxias; built Museu Vivo da Capoeira together"}'::jsonb, 'verified'::genealogy.confidence,
  'lurdinha.org/site/roda-livre-de-caxias-completa-50-anos/',
  E'Gegê, Raimundo, and Levi are named as the "mestres imprescindíveis" (indispensable masters) of capoeira in Caxias, who together built the Museu Vivo da Capoeira.',
  E'Gegê, Raimundo e Levi são nomeados como os "mestres imprescindíveis" da capoeira em Caxias, que juntos construíram o Museu Vivo da Capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gegê' AND o.apelido = 'Levi' AND o.apelido_context = 'Duque de Caxias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gegê affiliated_with Guaiamuns Nagôs of Mestre Zé Pedro (Bonsucesso) - needs Zé Pedro import first
-- Gegê founded Grupo Maragojipe de Capoeira - needs group import first
-- Gegê associated_with Mestre Burguês - organized first Muzenza LP 1988; needs import
-- Gegê associated_with Mestre Paulão (Muzenza founder) - CD collaboration; needs import
