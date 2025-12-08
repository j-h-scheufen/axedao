-- ============================================================
-- GENEALOGY PERSON IMPORT: Nascimento Grande
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://www.historyoffighting.com/mestre-jose-antonio-do-nascimento.php
--   - https://capoeiraracanegra.webnode.page/lendas-da-capoeira/nascimento-grande/
--   - https://www.educandocomginga.com (José Nascimento da Silva entry)
--   - https://www.capoeira-gcb31.com/capoeira/histoire/nascimento-grande/
--   - José Mariano, Jornal do Commercio, Recife, 20/02/1936
--   - Portal Capoeira, Portal São Francisco (frevo history)
-- ============================================================
-- DEPENDENCIES: persons/manduca-da-praia.sql
-- ============================================================
-- NOTES:
-- - Name discrepancy: Some sources list "José Antonio do Nascimento", others
--   "José Nascimento da Silva". Both appear to refer to the same person.
--   Using "José Nascimento da Silva" as primary (more Brazilian sources agree)
--   with "José Antonio do Nascimento" noted as alternate.
-- - Age at death discrepancy: Most sources say 94 (1842-1936), one source
--   (Casa do Engenho) claims "over 100 years old". Using 94 as more reliable.
-- - Known portrait exists at:
--   https://image.jimcdn.com/app/cms/image/transf/none/path/s46d1cab83898657f/image/i5a2e7653ec57e804/version/1595340637/image.jpg
--   (Not included pending portrait upload API implementation)
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (upsert pattern for idempotent sync)
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
  'José Nascimento da Silva',
  'Nascimento Grande',
  NULL,
  NULL,
  '[
    {"type": "website", "url": "https://en.wikipedia.org/wiki/Nascimento_Grande"},
    {"type": "website", "url": "https://www.historyoffighting.com/mestre-jose-antonio-do-nascimento.php"},
    {"type": "website", "url": "https://capoeiraracanegra.webnode.page/lendas-da-capoeira/nascimento-grande/"}
  ]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s carnival capoeira tradition.',
  -- Life dates
  1842,
  'year'::genealogy.date_precision,
  'Pernambuco, Brazil',
  1936,
  'year'::genealogy.date_precision,
  'Jacarepaguá, Rio de Janeiro, Brazil',
  -- Extended content
  E'José Nascimento da Silva—also recorded in some sources as José Antonio do Nascimento—was the most feared capoeirista in the history of Pernambuco, known simply as "O Capoeira" in his time. His name "Nascimento Grande" (Big Birth or Great Nascimento) came from his imposing size: he stood 2 meters tall and weighed between 120-130 kilograms.

He worked as a stevedore at the Port of Recife, where his immense strength was legendary. Witnesses reported he could carry two 60-kilo sacks simultaneously, one under each arm. He always wore a large sloped hat, carried a rubber cape draped over his arm, and wielded a famous 15-kilogram cane he called "a volta" (the return).

Despite his fearsome reputation, contemporaries described him as gentle, courteous, and well-educated, with what one source called "a Bruce Lee-like gaze"—calm but alert. One account said he had "a heart as big as the Capibaribe River," that he made great friends wherever he went, was "extremely honest—even his enemies recognized this"—and would "cry like melted butter at the most ordinary things in life."

He was believed to possess "corpo fechado" (closed body), a form of spiritual protection making him invincible to physical harm. Some said he had been attacked multiple times by gunfire at point-blank range and was never wounded. This was attributed to an amulet containing a "Santo Lenço" (Holy Cloth) that he carried. He attended church regularly and consulted with a Pai de Santo (Candomblé priest), practicing defumação (spiritual fumigation) for protection.

Nascimento Grande never lost a fight. And he never refused one. The press of his era, after weighing all accounts, granted him the title "Herói Popular" (Popular Hero), noting that he only ever fought in self-defense throughout his entire life.

His fame attracted challengers from across Brazil: Pirajé from Pará, Manezinho Camisa Preta from Rio de Janeiro, and Pajeú from the Pernambuco sertão. Two of his most dangerous enemies were Corre Hoje and Antonio Padroeiro. Corre Hoje once attacked him with seven armed men—but died from a stray bullet during the confrontation. Antonio Padroeiro was disarmed and beaten to death. When a criminal named Pajéu attacked him, Nascimento Grande swept him with a rasteira and dressed him in women''s clothes, leaving him to public ridicule.

During a trip to Rio de Janeiro, Nascimento Grande killed the legendary capoeirista Manezinho Camisa Preta, who had challenged him to a fight to the death. This battle, fought at Largo da Carioca, was described as transforming the plaza into "the Peloponnese"—a reference to the epic scale of the combat.

His most famous rivalry was with João Sabe Tudo ("João Knows Everything"), paradoxically also his friend. They avoided each other, but one Sunday morning they ran into each other near the bridge at Largo da Paz. There was no time for discussions—João drew a peixeira (knife), Nascimento his cane—and the fight began while crowds gathered. The battle moved through the streets until they found themselves inside the Igreja do Carmo. A vicar appeared, demanding they cease fighting in "the house of God." Both men complied out of respect, shook hands, and never fought again. Despite their combative history, they remained friends and hosted parties together at Hotel Sobrado Grande on Rua Camboa do Carmo in the Santo Antônio neighborhood.

Nascimento Grande was part of Recife''s carnival capoeira tradition. In the mid-19th century, two military bands dominated the city''s carnival: the Espanha band (National Guard Corps, named for its Spanish conductor) and the Quarto band (4th Artillery Battalion, which departed for the Paraguay War in 1865). These bands spawned rival capoeira factions: the "Partido do 4º" (also called "Banha Cheirosa") and the "Partido Espanha" (also called "Cabeças Secas"). These capoeiristas, known as "Brabos e Valentões" (Tough Guys and Ruffians), performed in front of the bands using ginga and kicks that were eventually transformed into the "passo"—the dance performed to the sound of frevo. In this way, Nascimento Grande''s legacy extends beyond capoeira to the very origins of Pernambuco''s most famous cultural expression.

He was celebrated by Brazil''s intellectual elite. Sociologist Gilberto Freyre, novelist José Lins do Rego, folklorist Câmara Cascudo, and writer Gilberto Amado all knew him personally. José Mariano—the famous abolitionist politician and father of poet Olegário Mariano—documented his exploits in the Jornal do Commercio (Recife, February 20, 1936). José Mariano recorded one remarkable incident: at age 93, Nascimento Grande went to the Paraguaçu open market and bought a pineapple from a Portuguese vendor. The vendor, noting his advanced age, cheated him with a fruit that had a rotten section. When Nascimento returned to complain, the vendor dismissed him and challenged the old man. Nascimento "went at his throat, the way capoeiristas from Recife dealt with sailors." The vendor survived only because he was left "barely breathing."

Of all the valentões who left their names in Recife''s carnival history—Jovino dos Coelhos, Nicolau do Poço, João de Totó—Nascimento Grande was the most feared. When he died at 94 in Jacarepaguá, Rio de Janeiro, in 1936, Gilberto Freyre petitioned the government for an official tribute. The cordel poet João Martins de Ataíde (1880-1959), the greatest editor of cordel literature of his time, immortalized him in verse: "Nascimento aged / His hair turned white / But his wrinkled face / Never took a blow."

As one source concluded: "Hercules is a myth; Nascimento Grande truly existed. His deeds are recorded in the newspapers of Recife."',
  'Granted title "Herói Popular" (Popular Hero) by the Recife press; Never lost a fight in his entire life; Killed rival Manezinho Camisa Preta in legendary fight at Largo da Carioca, Rio de Janeiro; Celebrated by Brazilian intellectuals including Gilberto Freyre, Câmara Cascudo, José Lins do Rego, and Gilberto Amado; Documented in Jornal do Commercio by abolitionist José Mariano (1936); Immortalized in cordel poetry by João Martins de Ataíde; His fighting style influenced the "passo" dance of frevo'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links,
  style = EXCLUDED.style,
  style_notes = EXCLUDED.style_notes,
  birth_year = EXCLUDED.birth_year,
  birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place,
  death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision,
  death_place = EXCLUDED.death_place,
  bio = EXCLUDED.bio,
  achievements = EXCLUDED.achievements,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- Using ON CONFLICT DO NOTHING for idempotent sync
-- ============================================================

-- --- Person-to-Person: Contemporaries ---

-- Association with Manduca da Praia (exists in dataset)
-- Both are legendary capoeiristas representing their regions
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
  ng.id,
  'associated_with',
  'person',
  mp.id,
  '{
    "association_context": "Contemporaries representing the three great regional capoeira legends of the 19th century. Nascimento Grande dominated Pernambuco while Manduca da Praia dominated Rio de Janeiro. They are frequently mentioned together in historical accounts as the most famous capoeiristas of their era, alongside Besouro Mangangá of Bahia."
  }'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources including History of Fighting, Grupo Capoeira Raça Negra, Nossa Tribo'
FROM genealogy.person_profiles ng, genealogy.person_profiles mp
WHERE ng.apelido = 'Nascimento Grande'
  AND mp.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- The following relationships cannot be created yet because
-- the related persons are not in the dataset:
--
-- João Sabe Tudo:
--   predicate: associated_with
--   properties: { "association_context": "Rival and friend; fought at Igreja do Carmo
--                 but also hosted parties together at Hotel Sobrado Grande in Santo Antônio.
--                 Their legendary fight at Largo da Paz was stopped by a vicar." }
--
-- Manezinho Camisa Preta:
--   predicate: associated_with
--   properties: { "association_context": "Rio de Janeiro valentão who challenged
--                 Nascimento Grande to a fight to the death. Nascimento killed him
--                 in an epic battle at Largo da Carioca." }
--
-- Besouro Mangangá:
--   predicate: associated_with
--   properties: { "association_context": "Contemporaries representing capoeira in their
--                 respective regions (Pernambuco/Bahia); shared similar reputation
--                 and corpo fechado beliefs" }
--
-- Corre Hoje:
--   predicate: associated_with
--   properties: { "association_context": "Mortal enemy who attacked with 7 men;
--                 died from stray bullet during the confrontation" }
--
-- Antonio Padroeiro:
--   predicate: associated_with
--   properties: { "association_context": "Mortal enemy who attempted assassination;
--                 disarmed and beaten to death by Nascimento Grande" }
--
-- Pirajé (Pará), Pajéu (Pernambuco sertão):
--   These were challengers from other regions.

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/nascimento-grande.sql',
  NULL,
  ARRAY['persons/manduca-da-praia.sql'],
  'Most feared capoeirista of Pernambuco (1842-1936); influenced frevo dance'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
