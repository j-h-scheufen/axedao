-- ============================================================
-- STATEMENTS FOR: Ziza (Pedro Rosemberg de Alcântara da Silva)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Ziza is the SUBJECT.
-- ============================================================

-- ============================================================
-- COMPLETED RELATIONSHIPS
-- ============================================================

-- Note: Ziza's relationships with Rui Henrique and Bené as co-founders of IUNA
-- will be expressed through their shared co_founded relationship with the group
-- once Grupo IUNA is imported. No associated_with statements needed between
-- co-founders.

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- Ziza co_founded Grupo IUNA (1975)
-- PENDING: Grupo IUNA (Irmãos Unidos das Nações Africanas) needs import first
-- - Founded 1975 in Rio de Janeiro
-- - Co-founders: Ziza, Rui Henrique, Bené
-- NOTE: This is the Rio de Janeiro IUNA, DISTINCT from Grupo Iuna de Capoeira
--       Angola (Belo Horizonte, 1983, founded by Mestre Primo)

-- Ziza co_founded Grupo Resistência (1987)
-- PENDING: Grupo Resistência (Rio de Janeiro) needs import first
-- - Founded 1987 in Rio de Janeiro
-- - Co-founder: Mestre Puma (Paulo César Almeida do Prado)
-- NOTE: DISTINCT from Grupo Resistência (Salvador, 1960s, founded by Bigodinho)

-- Ziza received_title_from [Unknown]
-- PENDING: No documentation of who awarded Ziza his mestre title or when
-- This remains a gap in the documentation

-- ============================================================
-- STUDENTS (Ziza as mentor/formador)
-- ============================================================

-- The following students received their mestre title from Ziza.
-- These relationships are owned by the STUDENT files (subject = student).
-- Documented here for reference:
--
-- Puma received_title_from Ziza (1996)
-- - Will be in puma.sql when Mestre Puma is imported
-- - Properties: title_grant: {title: 'mestre'}
-- - Notes: Puma began capoeira 1977 in Sergipe; joined Grupo Resistência;
--          became mestre after ~19 years
--
-- Marco Aurélio trained_under Ziza (via Grupo Resistência)
-- - Will be in marco-aurelio.sql when Mestre Marco Aurélio is imported
-- - Started capoeira 1987; joined Grupo Resistência 1997
-- - Note: Marco Aurélio was formed mestre by ABC (Puma's group) in 2017,
--         not directly by Ziza

-- ============================================================
-- ZÉ PEDRO'S RODA PARTICIPATION
-- ============================================================

-- Ziza participated in the legendary roda at Zé Pedro's academy in Bonsucesso
-- (1973-1979). This is documented in the bio/notes rather than as a formal
-- statement, as it represents regular roda participation rather than a formal
-- membership relationship. If Mestre Zé Pedro is imported, an associated_with
-- relationship could be added:
--
-- Ziza associated_with Zé Pedro
-- PENDING: Mestre Zé Pedro needs import first
-- - Context: Participated in legendary Sunday roda (1973-1979)
-- - Location: Rua Uranos 497, Bonsucesso, Rio de Janeiro
-- - Properties: association_context: 'Participated in Zé Pedro''s legendary
--               Sunday roda (1973-1979)'

-- ============================================================
-- NOTES ON TRAINING LINEAGE
-- ============================================================
-- No confirmed teacher relationship for Ziza has been documented.
-- His co-founder Rui Henrique was a student of Mestre Zé Maria, but
-- whether Ziza also trained under Zé Maria is not verified.
-- Once this is confirmed, add:
-- Ziza student_of/trained_under [Teacher]
