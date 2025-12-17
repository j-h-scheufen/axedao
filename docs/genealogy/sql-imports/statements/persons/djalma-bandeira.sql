-- ============================================================
-- STATEMENTS FOR: Djalma Bandeira
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Djalma Bandeira is the SUBJECT.
-- Relationships where Djalma Bandeira is the OBJECT should be in
-- the statement files of the respective subjects.
-- ============================================================

-- [Djalma Bandeira] student_of [Artur Emídio]
-- Primary teacher-student relationship. Djalma was Artur Emídio's first student.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'Djalma Bandeira was Artur Emídio''s first student. After Artur abandoned the ring in 1957, "friends encouraged him to focus on teaching. His first student was Djalma Bandeira, who became a travel companion with whom Artur refined his skills." André Lacé Lopes compared their partnership to "Don Quixote and Sancho Panza."',
  E'Djalma Bandeira foi o primeiro aluno de Artur Emídio. Depois que Artur abandonou os ringues em 1957, "amigos o encorajaram a se concentrar no ensino. Seu primeiro aluno foi Djalma Bandeira, que se tornou um companheiro de viagem com quem Artur aprimorou suas habilidades." André Lacé Lopes comparou sua parceria a "Dom Quixote e Sancho Pança."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Djalma Bandeira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Djalma Bandeira] associated_with [Artur Emídio]
-- Performance partnership for international folklore shows
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "travel companion and performance partner for international folklore shows including Skindô, Capital Samba, and Arco-Íris"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'The two traveled together performing in shows on Brazilian popular culture, both responsible for the capoeira aspect. Working with producers Abraão Medina and Carlos Machado, they toured New York, Paris, Buenos Aires, Acapulco, and the Iberian Peninsula. Shows included "Capital Samba," "Skindô," and musical "Arco-Íris" featuring Joãozinho da Goméia, Ary Barroso, and Mestre Paraná.',
  E'Os dois viajavam juntos se apresentando em shows sobre cultura popular brasileira, ambos responsáveis pelo aspecto de capoeira. Trabalhando com os produtores Abraão Medina e Carlos Machado, excursionaram por Nova York, Paris, Buenos Aires, Acapulco e Península Ibérica. Os shows incluíram "Capital Samba," "Skindô" e o musical "Arco-Íris" com Joãozinho da Goméia, Ary Barroso e Mestre Paraná.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Djalma Bandeira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- [Djalma Bandeira] founded [Grupo de Capoeira Djalma Bandeira]
--   - Group needs to be imported first; founded at IAPC Residential Complex, Olaria
--
-- [Djalma Bandeira] associated_with [Lamartine Pereira]
--   - Navy capoeira course instructors (1961)
--   - Lamartine Pereira needs to be imported first
--
-- [Djalma Bandeira] associated_with [Leopoldina]
--   - Contemporary colleagues in Rio; performed together
--   - Leopoldina exists in DB; statement could be added if more evidence found
--   - Currently only documented as peers in "contemporary Rio generation"
--
-- Note: Students Vilmar and Celso Pepe should have statements in THEIR files
-- as "student_of Djalma Bandeira" - not here.
-- ============================================================
