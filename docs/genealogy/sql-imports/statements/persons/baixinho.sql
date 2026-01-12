-- ============================================================
-- STATEMENTS FOR: Baixinho
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Baixinho is the SUBJECT.
-- This is Mestre Baixinho (José Eloy de Oliveira) of São Paulo.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- NOTE: Parent-child relationship (Baixinho → Marrom) is captured from
-- the child's side in marrom-sp.sql as: Marrom family_of Baixinho {son}
-- Per convention, we do NOT duplicate from the parent's side.

-- ============================================================
-- PENDING SIBLING RELATIONSHIPS
-- ============================================================
-- Baixinho has brothers Guerreiro and Macete (co-founders of GCAIG 1983).
-- Per convention, sibling relationships flow from YOUNGER to OLDER.
-- We do not have birth years for any of the three brothers.
--
-- WHEN IMPORTING Guerreiro and Macete:
-- - If relative ages are discovered, generate family_of from younger to older
-- - If ages remain unknown, document in the OLDEST brother's file (by naming
--   convention or best guess) with a note about the uncertainty
--
-- For now, these relationships are NOT generated here.

-- ============================================================
-- LINEAGE RELATIONSHIPS
-- ============================================================

-- Baixinho trained_under Pé de Chumbo (supervisor relationship)
-- Object: Mestre Pé de Chumbo (Gidalto Pereira Dias) - in persons-backlog.md, pending
-- Notes: "O Irmãos Guerreiros recebeu, durante alguns anos, a supervisão do
--        Mestre Pé-de-Chumbo, um dos primeiros angoleiros a desenvolver
--        trabalho nesta nova fase da Capoeira de Angola em São Paulo."
-- This was group supervision rather than individual training, but establishes
-- the lineage connection through Pé-de-Chumbo to João Pequeno/Pastinha.
-- Confidence: likely
-- Source: capoeira.jex.com.br, multiple GCAIG sources

-- NOTE: Baixinho's original teachers in Bahia are NOT documented in available sources.
-- If this information is discovered, add a student_of or trained_under relationship.

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- Baixinho co_founded Grupo Irmãos Guerreiros
-- Object: Grupo de Capoeira Angola Irmãos Guerreiros - in groups-backlog.md, pending
-- Started: 1983
-- Properties: { "role": "co_founder_patriarch" }
-- Source: Multiple sources confirm 1983 founding with Baixinho, Marrom, Guerreiro, Macete

-- Baixinho leads Grupo Irmãos Guerreiros
-- Object: Grupo Irmãos Guerreiros - in groups-backlog.md, pending
-- Notes: Founding patriarch. Currently Marrom is "at the forefront" but Baixinho
--        remains the founding leader.
-- Source: irmaosguerreiros.wixsite.com, Portal Capoeira

-- ============================================================
-- NOTE ON STUDENTS:
-- Students of Baixinho (e.g., Marrom, Perna) should have their
-- statements in THEIR own files with Baixinho as the OBJECT,
-- not here where Baixinho is the SUBJECT.
-- Example: Marrom student_of Baixinho → goes in marrom-sp.sql
-- Example: Perna student_of Baixinho → goes in perna.sql
-- ============================================================
