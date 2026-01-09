-- ============================================================
-- STATEMENTS FOR: Fernando de Saubara
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Fernando de Saubara is the SUBJECT.
-- ============================================================

-- Fernando de Saubara student_of Pastinha
-- Fernando is documented as "one of the last remaining capoeiristas trained by Mestre Pastinha"
-- Training timeline uncertain; likely 1960s when Pastinha's CECA was active
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
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Fernando is described as "one of the last remaining capoeiristas trained by Mestre Pastinha" at the VI Rede Capoeira event (Jan 2025). Training dates not documented. Pastinha taught at CECA 1941-1973.',
  E'Fernando é descrito como "um dos últimos capoeiristas remanescentes formados por Mestre Pastinha" no evento VI Rede Capoeira (jan 2025). Datas de treinamento não documentadas. Pastinha ensinou no CECA 1941-1973.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS (contemporaries honored together)
-- ============================================================

-- Fernando de Saubara associated_with Virgílio da Fazenda Grande
-- Co-honorees at VI Rede Capoeira (January 2025) as octogenarian mestres
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22, 2025. Both octogenarian mestres trained by Pastinha (Virgílio indirectly through father Espinho Remoso and Paulo dos Anjos; Fernando directly).',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22 de janeiro de 2025. Ambos mestres octogenários formados por Pastinha (Virgílio indiretamente através do pai Espinho Remoso e Paulo dos Anjos; Fernando diretamente).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernando de Saubara associated_with Boa Gente
-- Co-honorees at VI Rede Capoeira (January 2025) as octogenarian mestres
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22, 2025. Both octogenarian mestres with connections to Pastinha lineage.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22 de janeiro de 2025. Ambos mestres octogenários com conexões à linhagem de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernando de Saubara associated_with Nô
-- Co-honorees at VI Rede Capoeira (January 2025) as octogenarian mestres
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Fernando de Saubara associated_with Baiano (Canjiquinha) - Edvaldo dos Santos Reis
--   VI Rede Capoeira 2025 co-honoree; Baiano is in backlog, not yet imported
