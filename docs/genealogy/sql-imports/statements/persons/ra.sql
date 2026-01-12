-- ============================================================
-- STATEMENTS FOR: Rã
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Rã is the SUBJECT.
-- ============================================================

-- Rã trained_under Suassuna (advanced training in CDO methodology, late 1980s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, tucsoncapoeira.org, portalcapoeira.com',
  'Trained with Suassuna through Cordão de Ouro methodology. Connection began when CDO invited Rã to USA in 1988. Sources confirm he "trained under many Mestres throughout Brasil, including Mestre Tarzan, Mestre Galo, and Mestre Suassuna".',
  'Treinou com Suassuna através da metodologia do Cordão de Ouro. Conexão começou quando CDO convidou Rã aos EUA em 1988. Fontes confirmam que ele "treinou sob muitos Mestres por todo o Brasil, incluindo Mestre Tarzan, Mestre Galo e Mestre Suassuna".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rã' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rã trained_under Tarzan (Jundiaí/Campinas region, 1974+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, portalcapoeira.com',
  'Tarzan was sent to the Campinas region by Suassuna in 1974 to establish capoeira in the area. Rã trained under him in Jundiaí alongside Mestre Galo. Sources confirm he "trained under many Mestres throughout Brasil, including Mestre Tarzan, Mestre Galo, and Mestre Suassuna".',
  'Tarzan foi enviado à região de Campinas por Suassuna em 1974 para estabelecer a capoeira na área. Rã treinou sob ele em Jundiaí junto com Mestre Galo. Fontes confirmam que ele "treinou sob muitos Mestres por todo o Brasil, incluindo Mestre Tarzan, Mestre Galo e Mestre Suassuna".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rã' AND o.apelido = 'Tarzan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rã student_of Galo (Jundiaí) - primary teacher in Jundiaí
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, jr.jor.br, jundiagora.com.br, lalaue.com',
  'Mestre Galo of Jundiaí was Rã''s first teacher. He ran Academia de Capoeira Rio Vermelho, the first capoeira academy in Jundiaí. Rã began training at age 14 (~1973). Galo gave Rã his apelido at his batizado ceremony at the Grêmio. As Rã recalled: "Ele era um cara das ruas, como eu. Me ensinou várias coisas" (He was a street guy, like me. He taught me several things). DISTINCT from Galo (Bimba student).',
  'Mestre Galo de Jundiaí foi o primeiro mestre de Rã. Ele dirigia a Academia de Capoeira Rio Vermelho, a primeira academia de capoeira em Jundiaí. Rã começou a treinar aos 14 anos (~1973). Galo deu a Rã seu apelido em sua cerimônia de batizado no Grêmio. Como Rã recordou: "Ele era um cara das ruas, como eu. Me ensinou várias coisas". DISTINTO de Galo (aluno de Bimba).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rã' AND o.apelido = 'Galo' AND o.apelido_context = 'Jundiaí'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rã baptized_by Galo (Jundiaí) - received apelido at batizado
-- NOTE: No specific date documented. Rã started training ~1973 at age 14.
-- Batizados typically occur after training period, so likely ~1974-1975.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"baptism": {"apelido_given": "Rã", "ceremony": "batizado", "location": "Grêmio, Jundiaí"}}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, jr.jor.br',
  'Mestre Galo gave Rã his apelido at his batizado ceremony at the Grêmio (a local club in Jundiaí). According to accounts, when Rã entered the roda, he "jumped and did pirouettes" with such energy that the nickname "Rã" (frog) stuck. No specific date documented; Rã began training ~1973.',
  'Mestre Galo deu a Rã seu apelido em sua cerimônia de batizado no Grêmio (um clube local em Jundiaí). Segundo relatos, quando Rã entrou na roda, "pulou e fez piruetas" com tanta energia que o apelido "Rã" (sapo) pegou. Data específica não documentada; Rã começou a treinar ~1973.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rã' AND o.apelido = 'Galo' AND o.apelido_context = 'Jundiaí'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rã associated_with Jelon Vieira - needs verification
--   Rã participated in folkloric shows choreographed by Jelon Vieira.
--   Relationship type unclear (performer in Jelon's ensemble vs workshop training).
--   Jelon Vieira already in dataset but relationship needs more documentation.
