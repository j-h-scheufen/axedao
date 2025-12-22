-- ============================================================
-- STATEMENTS FOR: Maria Homem
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Maria Homem is the SUBJECT.
-- ============================================================

-- Maria Homem associated_with Júlia Fogareira (fellow female capoeirista)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1902-01-01'::date, 'decade'::genealogy.date_precision,
  '1911-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Fellow legendary female capoeiristas; both named by Pastinha among angoleiros de briga"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo 1976; velhosmestres.com/br/pastinha-1976; velhosmestres.com/en/pastinha-1969-3',
  'Both were the only two women listed by Mestre Pastinha in his 1976 O Globo interview and his 1988 book among legendary fighters. They practiced capoeira during the same 1902-1911 era in Salvador.',
  'Ambas foram as únicas duas mulheres listadas por Mestre Pastinha em sua entrevista ao O Globo de 1976 e em seu livro de 1988 entre lutadores lendários. Praticaram capoeira durante a mesma era 1902-1911 em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maria Homem' AND o.apelido = 'Júlia Fogareira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Maria Homem associated_with Palmeirona - needs import first
-- Maria Homem associated_with Maria Pernambucana - needs import first
-- Maria Homem trained_under [unknown masters] - no specific masters named
