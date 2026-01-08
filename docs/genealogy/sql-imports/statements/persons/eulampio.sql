-- ============================================================
-- STATEMENTS FOR: Eulâmpio
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Eulâmpio is the SUBJECT.
-- ============================================================

-- Eulâmpio student_of Cobrinha Verde
-- Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Moreno, Gigante
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeira.online/history/mestres/cobrinha-verde/, https://pt.wikipedia.org/wiki/Mestre_Cobrinha_Verde',
  E'Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Moreno, and Gigante in Portuguese Wikipedia and capoeira.online sources. Called "brother" by Cobrinha Verde in his autobiography, suggesting extremely close relationship. Training dates unknown.',
  E'Listado como aluno de Cobrinha Verde junto com João Grande, João Pequeno, Moreno e Gigante na Wikipédia em português e fontes do capoeira.online. Chamado de "irmão" por Cobrinha Verde em sua autobiografia, sugerindo relacionamento extremamente próximo. Datas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eulâmpio' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eulâmpio associated_with Cobrinha Verde
-- "Brother" designation indicates close personal/professional bond beyond student-teacher
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "Called brother by Cobrinha Verde; accompanied him to naval base presentation with Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.online/history/mestres/cobrinha-verde/',
  E'Cobrinha Verde stated "Eu e Eulâmpio - aquele que eu chamava de irmão" (Eulampio - who I called my brother) in his autobiography, describing their attendance at a naval base presentation in São Tomé de Paripe with Mestre Pastinha. The "brother" designation indicates an extraordinarily close bond.',
  E'Cobrinha Verde declarou "Eu e Eulâmpio - aquele que eu chamava de irmão" em sua autobiografia, descrevendo sua participação em uma apresentação na base naval de São Tomé de Paripe com Mestre Pastinha. A designação de "irmão" indica um vínculo extraordinariamente próximo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eulâmpio' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eulâmpio associated_with Pastinha
-- Traveled together to naval base presentation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "Accompanied Pastinha and Cobrinha Verde to naval base presentation at São Tomé de Paripe"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.online/history/mestres/cobrinha-verde/',
  E'Eulâmpio accompanied Mestre Pastinha and Cobrinha Verde to a capoeira presentation at the São Tomé de Paripe naval base, as recounted in Cobrinha Verde''s autobiography.',
  E'Eulâmpio acompanhou Mestre Pastinha e Cobrinha Verde a uma apresentação de capoeira na base naval de São Tomé de Paripe, conforme relatado na autobiografia de Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eulâmpio' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eulâmpio member_of Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Participated in the Liberdade/Gengibirra roda pre-1941, documented in A Tarde 1969
-- NOTE: He was NOT among the 22 founding mestres - he was a regular participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A Tarde, February 24, 1969; velhosmestres.com/en/pastinha-1969-3',
  'Regular participant at the Liberdade/Gengibirra roda on Sundays. Listed among the mestres who gathered there. NOT among the 22 founding mestres - was a participant rather than organizational founder.',
  'Participante regular na roda da Liberdade/Gengibirra aos domingos. Listado entre os mestres que se reuniam lá. NÃO estava entre os 22 mestres fundadores - era participante e não fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Eulâmpio'
  AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional associated_with statements for other
-- Gengibirra contemporaries. Membership in Gengibirra group
-- already connects all roda participants.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Eulâmpio co_founded CECA - CECA group profile needs import first
