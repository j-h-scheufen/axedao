-- ============================================================
-- STATEMENTS FOR: Plácido de Abreu
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Plácido de Abreu is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type,
  subject_id,
  predicate,
  object_type,
  object_id,
  properties,
  confidence,
  source
)
SELECT
  'person',
  pa.id,
  'associated_with',
  'person',
  mp.id,
  '{
    "association_context": {
      "en": "Plácido de Abreu documented Manduca da Praia extensively in Os Capoeiras (1886) as the chief of the Santa Lucia party (Nagôas). As an amateur capoeirista in Rio during the 1870s-1880s, Abreu had insider knowledge of the malta world and documented Manduca''s exploits and leadership.",
      "pt": "Plácido de Abreu documentou Manduca da Praia extensivamente em Os Capoeiras (1886) como o chefe do partido de Santa Lucia (Nagôas). Como capoeirista amador no Rio durante as décadas de 1870-1880, Abreu tinha conhecimento interno do mundo das maltas e documentou as façanhas e liderança de Manduca."
    }
  }'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, Os Capoeiras (1886); CapoeiraWiki; Capoeira History'
FROM genealogy.person_profiles pa, genealogy.person_profiles mp
WHERE pa.apelido = 'Plácido de Abreu'
  AND mp.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
