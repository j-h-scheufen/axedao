-- ============================================================
-- STATEMENTS FOR: Boa Viagem (Catacumba)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Boa Viagem is the SUBJECT.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Seu Júlio trained_under Boa Viagem - Seu Júlio not yet in dataset
-- Context: Training partners at Catacumba favela and Lagoa Rodrigo de Freitas (1950s)
-- Both also served time at Dois Rios
-- Backlog says Seu Júlio "learned from Boa Viagem" → trained_under relationship
-- When Seu Júlio is imported, generate in seu-julio.sql:
--   Seu Júlio trained_under Boa Viagem

-- Boa Viagem associated_with Edgar (Dois Rios) - Edgar exists in dataset
-- Context: Both served time at Dois Rios Correctional Colony, Ilha Grande
-- NOTE: No documented direct interaction - only share imprisonment location

-- Boa Viagem associated_with Americano (Dois Rios) - Americano exists in dataset
-- Context: Both served time at Dois Rios Correctional Colony, Ilha Grande
-- NOTE: No documented direct interaction - only share imprisonment location

-- ============================================================
-- NOTES ON RELATIONSHIP DECISIONS
-- ============================================================
--
-- Per the import guidelines on associated_with usage:
-- "associated_with requires a SPECIFIC, DOCUMENTED connection"
--
-- While Boa Viagem, Edgar, and Americano all served time at Dois Rios,
-- we have NO documentation of direct interaction between them.
-- The only documented relationship is between Boa Viagem and Seu Júlio
-- (training partners at Catacumba/Lagoa, both served at Dois Rios).
--
-- Therefore, we are NOT generating associated_with statements for
-- Boa Viagem ↔ Edgar or Boa Viagem ↔ Americano. These contemporaries
-- are documented in the bio text instead.
--
-- The relationship with Seu Júlio will be generated when Seu Júlio
-- is imported. Since the backlog indicates Seu Júlio "learned from
-- Boa Viagem," the relationship should be:
--   Seu Júlio trained_under Boa Viagem
-- (generated in seu-julio.sql, not here)
-- ============================================================
