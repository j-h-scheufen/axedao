-- ============================================================
-- STATEMENTS FOR: Manduca Tambor
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Manduca Tambor is the SUBJECT.
-- ============================================================

-- Manduca Tambor associated_with Pinta Preta da Lapa (killed him)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1870-01-07'::date, 'exact'::genealogy.date_precision,
  '1870-01-07'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Manduca Tambor delivered the fatal blow to Pinta Preta da Lapa on January 7, 1870, in retaliation for Pinta Preta''s attack on a Sociedade de Reis the previous night."}'::jsonb,
  'verified'::genealogy.confidence,
  'Carlos Eugênio Líbano Soares, "A Negregada Instituição" (1999); newspaper accounts from 1870; police records from 1872',
  'Manduca Tambor killed Pinta Preta da Lapa on Rua da Alfândega on January 7, 1870. This is the first documented newspaper reference to the Nagoas-Guaiamús rivalry. After the killing, Trindade posed as a victim and helped police arrest Nagoa capoeiras.',
  'Manduca Tambor matou Pinta Preta da Lapa na Rua da Alfândega em 7 de janeiro de 1870. Esta é a primeira referência documentada em jornais à rivalidade Nagoas-Guaiamús. Após o assassinato, Trindade se passou por vítima e ajudou a polícia a prender capoeiras Nagoas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Manduca Tambor' AND o.apelido = 'Pinta Preta da Lapa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- The following persons were involved in the January 1870 incident but are not yet imported:
--
-- ACCOMPLICES (Import? = ?):
-- - Antonico Moleque (Antônio Pereira da Silva / Antonico Capitão) - accomplice in killing Pinta Preta
-- - Prudêncio José Ferreira - accomplice in killing Pinta Preta
-- - José da Silva Balão - accomplice in killing Pinta Preta
--
-- OTHER FIGURES (Import? = no - not capoeiristas):
-- - Dr. Cereja (João Maria da Silva Seabra) - falsely confessed, acquitted; not documented as capoeirista
-- - Reginaldo - leader of the Sociedade de Reis; not a capoeirista
-- - Eduardo Felício - victim of the initial attack; not a capoeirista
