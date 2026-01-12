-- ============================================================
-- STATEMENTS FOR: Seu Júlio
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Seu Júlio is the SUBJECT.
-- ============================================================

-- Seu Júlio trained_under Boa Viagem (Catacumba)
-- Boa Viagem was described as a "friend" and training partner
-- They practiced capoeira together at Catacumba and Lagoa Rodrigo de Freitas
-- before both were imprisoned at Dois Rios
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/the-imprisonment-of-capoeiras-on-ilha-grande/',
  'Trained together at Catacumba favela and Lagoa Rodrigo de Freitas before imprisonment. Seu Júlio described Boa Viagem as "a friend" with whom he practiced capoeira.',
  'Treinaram juntos na favela da Catacumba e Lagoa Rodrigo de Freitas antes da prisão. Seu Júlio descreveu Boa Viagem como "um amigo" com quem praticava capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Seu Júlio' AND o.apelido = 'Boa Viagem' AND o.apelido_context = 'Catacumba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Seu Júlio associated_with Madame Satã
-- Met at Dois Rios prison; traveled together to Rio to testify in court
-- Seu Júlio provided testimony about Satã's behavior and work in prison
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "prison_contemporaries"}'::jsonb, 'verified'::genealogy.confidence,
  'journals.openedition.org/vibrant/4101',
  'Met at Dois Rios prison; traveled together to Rio de Janeiro to testify in court. Seu Júlio provided detailed testimony about Satã''s work and behavior in prison (domestic tasks, pig breeding, privileged housing).',
  'Conheceram-se na prisão de Dois Rios; viajaram juntos ao Rio de Janeiro para testemunhar em tribunal. Seu Júlio forneceu testemunho detalhado sobre o trabalho e comportamento de Satã na prisão (tarefas domésticas, criação de porcos, alojamento privilegiado).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Seu Júlio' AND o.apelido = 'Madame Satã'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTES ON OTHER CONTEMPORARIES
-- ============================================================
-- Seu Júlio was contemporary at Dois Rios with:
-- - Edgar (Dois Rios) - already imported
-- - Americano (Dois Rios) - already imported
-- - Sete Coroas - already imported (though died 1923, before Júlio arrived)
--
-- These are NOT added as associated_with statements because:
-- - Sete Coroas died in 1923 (before Júlio's imprisonment)
-- - Edgar and Americano: no documented direct interaction beyond
--   being mentioned in Madame Satã's memoirs as fellow prisoners
-- ============================================================
