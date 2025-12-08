-- ============================================================
-- GENEALOGY PERSON IMPORT: Manduca da Praia
-- Generated: 2025-12-08
-- Primary Sources:
--   - Plácido de Abreu, "Os Capoeiras" (1886)
--   - https://sites.google.com/view/raridadesdacapoeira/manduca-da-praia
--   - https://www.historyoffighting.com/mestre-manduca-da-praia.php
--   - https://papoeira.com/en/capoeira-song-manduca-da-praia-lyrics-translation-history/
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
-- ============================================================
-- Manduca da Praia was one of the most celebrated capoeiristas of
-- 19th-century Rio de Janeiro. Chief of the Santa Luzia party within
-- the Nagoa federation, he was known for his elegant appearance,
-- undefeated fighting record, and political connections.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  title,
  portrait,
  public_links,
  -- Capoeira-specific
  style,
  style_notes,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content
  bio,
  achievements
) VALUES (
  -- Identity
  'Manoel Alves da Silva',
  'Manduca da Praia',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[{"type": "website", "url": "https://en.wikipedia.org/wiki/Manduca_da_Praia"}, {"type": "website", "url": "https://www.historyoffighting.com/mestre-manduca-da-praia.php"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro.',
  -- Life dates
  NULL,  -- Birth year unknown; active around 1850
  'unknown'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed, as he was based there
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- Extended content
  'Manduca da Praia was a man who defied the expectations of his era. In mid-19th century Rio de Janeiro, capoeiristas typically fell into one of two paths: the violent underworld of the maltas or prison. Manduca navigated a third way.

His full name is recorded as Manoel Alves da Silva in most sources, though one account lists him as Arthur Bento dos Santos.

He was described as "pardo claro" - a light-skinned mulatto - tall and powerfully built, with a graying pointed beard. But it was his appearance that set him apart from the street fighters of his day. He dressed like a gentleman: leather jacket, white beaver hat, pocket watch with gold chain, polished shoes, and always his walking cane - which doubled as his weapon of choice.

His legitimate business was a fish stall in the São José parish marketplace, where he was known not just for selling seafood but for holding court, sharing stories of his exploits with eager listeners. The income from fish alone could not account for his lifestyle. He supplemented it with bodyguard work for politicians, building the connections that would prove invaluable.

According to Plácido de Abreu''s 1886 book "Os Capoeiras," Manduca was chief of the Santa Luzia party within the Nagoa federation - one of the two great rival factions that divided Rio de Janeiro. The Nagoas wore white as their identifying color. Yet despite this leadership role, some accounts describe him as deliberately keeping distance from gang activities that might harm his business interests.

He started his career young, reportedly at Lavadinho, where he made his name in the brutal sport of running with bulls. His weapons included the knife, razor blade (favored by capoeira gangs of the time), the "petrópolis" (a long hardwood cudgel), and his ever-present cane. His capoeira techniques were comprehensive: the banda and rasteira (sweeps), punches, the headbutt in its various forms, and the devastating rabo de arraia (stingray tail kick).

The fight that cemented his legend was against a Portuguese Deputy named Santana. Santana was known for his physical strength and skill with the stick. Hearing of Manduca''s reputation, he publicly challenged him. These street fights were vicious affairs - no rules, ending only with knockout or submission. Manduca won decisively. But what happened next revealed his character: the two men left the fight with mutual respect and reportedly became friends.

He faced 27 criminal charges for assault and grievous bodily harm over his career. He was acquitted every single time. His political connections from bodyguard work ensured that witnesses would speak in his favor and charges would not stick.

At the Penha festival, one of Rio''s major religious celebrations, he found himself fighting a group of armed pilgrims. He left them all unconscious.

Among his contemporaries in the dangerous world of Rio capoeiragem were Mamede, Aleixo Açougueiro, Pedro Cobra, Bentevi, and Quebra Coco - names that survive only as fragments in the historical record.

What set Manduca apart was not just his fighting ability - though he was reportedly undefeated - but his ability to command respect in multiple worlds: the violent street culture of the maltas, the respectable commerce of the marketplace, and the political sphere where he served as protector. In an era when capoeiristas were hunted and imprisoned, he built a life of relative prosperity and lasting fame.',
  -- Achievements
  'Chief of Santa Luzia party (Nagoa federation); Undefeated in street fighting career; Acquitted of all 27 criminal charges; Famous victory over Portuguese Deputy Santana'
) RETURNING id AS manduca_da_praia_id;

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================
-- No statements can be generated yet as no related entities
-- (other persons or groups from this era) exist in the dataset.
--
-- Future imports needed:
-- - Santa Luzia Party / Nagoa Federation (group)
-- - Deputy Santana (person - if deemed importable)
-- - Contemporary capoeiristas: Mamede, Aleixo Açougueiro, Pedro Cobra,
--   Bentevi, Quebra Coco
-- ============================================================

COMMIT;
