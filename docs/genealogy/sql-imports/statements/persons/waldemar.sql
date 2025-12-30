-- ============================================================
-- STATEMENTS FOR: Waldemar
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Waldemar is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 1}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'First of four teachers. Siri de Mangue was a saveirista from the Recôncavo and training companion of Besouro Mangangá.',
  'Primeiro de quatro mestres. Siri de Mangue era saveirista do Recôncavo e companheiro de treino de Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 2}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Second of four teachers. Neco Canário Pardo was known for machete expertise and was a companion of Besouro at Trapiche de Baixo.',
  'Segundo de quatro mestres. Neco Canário Pardo era conhecido pela perícia com facão e era companheiro de Besouro no Trapiche de Baixo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 3}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Third of four teachers. Talabi (also spelled Talavi, Telabi, Calabi) was active at the "roda danada" (wild roda) in Periperi.',
  'Terceiro de quatro mestres. Talabi (também escrito Talavi, Telabi, Calabi) era ativo na "roda danada" em Periperi.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Talabi' AND o.apelido_context = 'de Periperi'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 4}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Fourth of four teachers. Ricardo was from Ilha de Maré, the same island where Waldemar was born.',
  'Quarto de quatro mestres. Ricardo era da Ilha de Maré, a mesma ilha onde Waldemar nasceu.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Ricardo de Ilha de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- DISPUTED: Besouro Gago as fifth teacher
-- ============================================================
-- Source: Grupo Liberdade Capoeira website lists Besouro Gago
-- as one of Waldemar's teachers alongside the four confirmed ones.
--
-- CONTRADICTION: Waldemar's own 1989 interview explicitly states
-- "I had FOUR mestres" and names only the four above. He did NOT
-- mention Besouro Gago.
--
-- This statement is preserved with 'disputed' confidence to ensure
-- the claim is queryable and not lost, while clearly marking that
-- it contradicts primary source testimony.
-- ============================================================
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'disputed'::genealogy.confidence,
  'Grupo Liberdade Capoeira website (grupoliberdadecapoeira.com.br/linhagem-mestres/)',
  'DISPUTED: Listed by Grupo Liberdade Capoeira as a fifth teacher, but this CONTRADICTS Waldemar''s own 1989 interview where he explicitly stated "I had four mestres" and named only Siri de Mangue, Canário Pardo, Talavi, and Ricardo. Besouro Gago ("the Stutterer") is distinct from Besouro Mangangá.',
  'CONTESTADO: Listado pelo Grupo Liberdade Capoeira como quinto professor, mas isso CONTRADIZ a própria entrevista de Waldemar de 1989 onde ele declarou explicitamente "Tive quatro mestres" e nomeou apenas Siri de Mangue, Canário Pardo, Talavi e Ricardo. Besouro Gago ("o Gago") é distinto de Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Besouro Gago' AND o.apelido_context = 'Periperi'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Contemporaries who practiced (''vadiado'') together in Salvador. Waldemar stated in 1970 interview that he had ''vadiado'' with Pastinha. Both were active in Salvador''s capoeira scene during the 1940s-1960s".}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias 1970 interview: Waldemar said he had "vadiado" with Pastinha, Bimba, and Totonho Maré',
  'Contemporary mestres who practiced together in Salvador. Waldemar and Pastinha were both active during the 1940s-1960s, representing different approaches to preserving capoeira Angola.',
  'Mestres contemporâneos que praticaram juntos em Salvador. Waldemar e Pastinha eram ambos ativos durante os anos 1940-1960, representando diferentes abordagens para preservar a capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Contemporaries who practiced (''vadiado'') together in Salvador. Waldemar stated in 1970 interview that he had ''vadiado'' with Bimba. Despite practicing different styles, they interacted in Salvador''s capoeira scene".}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias 1970 interview: Waldemar said he had "vadiado" with Pastinha, Bimba, and Totonho Maré',
  'Contemporary mestres who practiced together despite their different approaches. Waldemar (Angola) and Bimba (Regional) both operated in Salvador during the 1940s-1960s.',
  'Mestres contemporâneos que praticaram juntos apesar de suas abordagens diferentes. Waldemar (Angola) e Bimba (Regional) ambos atuavam em Salvador durante os anos 1940-1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Both from Ilha de Maré; Waldemar stated in 1970 interview that he had ''vadiado'' with Totonho Maré. Totonho (b. 1894) was older and was a co-founder of Gengibirra".}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias 1970 interview: Waldemar said he had "vadiado" with Pastinha, Bimba, and Totonho Maré',
  'Both were from Ilha de Maré and practiced together. Totonho (1894-1974) was older and was one of the "owners and proprietors" of Gengibirra.',
  'Ambos eram da Ilha de Maré e praticavam juntos. Totonho (1894-1974) era mais velho e era um dos "donos e proprietários" da Gengibirra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Contemporary mestres in Salvador. Multiple sources indicate Waldemar had significant influence on Cobrinha Verde and vice versa. Cobrinha operated a roda in Chame-Chame while Waldemar operated in Liberdade. The 1962 LP ''Capoeira da Bahia'' was recorded at Waldemar''s residence with Cobrinha''s participation".}'::jsonb,
  'likely'::genealogy.confidence,
  'Capoeira.online, capoeira-connection.com; 1962 LP "Capoeira da Bahia" recorded at Waldemar''s residence',
  'Contemporary mestres who influenced each other. The 1962 LP "Capoeira da Bahia" was recorded at Waldemar''s residence. Both were important Angola mestres in Salvador.',
  'Mestres contemporâneos que se influenciaram mutuamente. O LP de 1962 "Capoeira da Bahia" foi gravado na residência de Waldemar. Ambos eram importantes mestres de Angola em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
