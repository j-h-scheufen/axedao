-- ============================================================
-- GENEALOGY PERSON IMPORT: Plácido de Abreu
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://capoeirawiki.org/wiki/Pl%C3%A1cido_de_Abreu
--   - https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/
--   - https://www.capoeiranews.com.br/2017/04/placido-de-abreu-um-capoeirista.html
--   - https://cev.org.br/comunidade/capoeira/debate/placido-abreu-morreu-com-heroicidade-amouco/
--   - Carlos Eugênio Líbano Soares, "A Negregada Instituição" (1999), p. 193
-- ============================================================
-- DEPENDENCIES: persons/manduca-da-praia.sql
-- ============================================================
-- NOTES:
-- - Birth date: One source (CEV) gives March 12, 1857; most sources say simply "1857".
--   Using 1857 with 'year' precision as most conservative.
-- - Death date: February 1894 (exact day unknown). Using 'month' precision.
-- - Profile type: Historian/amateur capoeirista - he practiced capoeira in youth but
--   his primary significance is as author of the first book on capoeira.
-- - Pseudonym "Pompeo Steel" - used for literary works.
-- - His second book "Nagôas e Guayamús" is now considered lost.
-- - He was arrested in January 1872 during police crackdowns on capoeira gangs.
-- - He was implicated in the June 1889 assassination attempt on Emperor Pedro II.
-- - He was assassinated by firing squad near Copacabana tunnel, February 1894.
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
  'Plácido de Abreu Morais',
  'Plácido de Abreu',
  NULL,
  NULL,
  '[
    {"type": "website", "url": "https://capoeirawiki.org/wiki/Pl%C3%A1cido_de_Abreu"},
    {"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/"}
  ]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Amateur capoeirista in his youth; participated in Rio de Janeiro capoeira rodas during the 1870s. His primary significance is as historian and chronicler rather than practitioner. Style distinctions (Angola/Regional) did not yet exist in his era.',
  -- Life dates
  1857,
  'year'::genealogy.date_precision,
  'Portugal',
  1894,
  'month'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content
  E'Plácido de Abreu Morais was born in Portugal in 1857 and immigrated to Brazil as a teenager during the 1870s, like many Portuguese seeking economic opportunity in the New World. After arriving in Rio de Janeiro, he found work as a clerk (caixeiro) and later as a typographer in a printing house that published newspapers and small literary works.

Like many young immigrants of his time, Abreu was drawn into the street culture of the city and participated in capoeira rodas, becoming what sources describe as an "amateur capoeirista." In January 1872, during intense police repression led by Ludgero Gonçalves da Silva, he was arrested for investigation regarding a homicide—though the outcome of this case is not recorded.

His contemporary Coelho Neto described him as "a poet, playwright and journalist" and a colleague of noted republican figures Lopes Trovão and Pardal Mallet at the combative newspaper O Combate. Another contemporary described him as "a mix of capoeira fighter, republican activist and writer."

Abreu transitioned from street fighting to literary pursuits, learning typography and writing novels, theatrical pieces, and poetry. His most significant work, Os Capoeiras, was published in 1886 by Tipografia José Alves Editor in Rio de Janeiro. It is considered the first book dedicated entirely to capoeira. The work is divided into two parts: the first is a semi-ethnographic study that functions as a sociological essay on the capoeira scene, and the second is a fictional novella set in the capoeira underworld.

In his introduction, titled "Two Words," Abreu wrote: "When I started this book, my aim was to describe the atrocities committed by capoeiras since ancient times. It is a difficult task to study capoeiragem, from its primitive times, because its origin is not well known."

The book documented the two great rival maltas (gangs) of Rio de Janeiro: the Guaiamús (whose color was red) and the Nagôas (whose color was white). He recorded that the Guaiamú were centered at São Francisco church under the famous chief Leandro Bonaparte, with secondary locations at Santa Rita, Ouro Preto, Marinha, and São Domingos de Gusmão. They trained on Livramento hill at a site called Mango Tree. The Nagôas were centered at Santa Lucia church under the leadership of Manduca da Praia, with secondary locations at São José, Lapa, Santa Ana, Moura, and Bolinha de Prata. They trained at Russell beach and Pinto hill.

Abreu documented how both groups operated hierarchically with chiefs, assistants, "policemen," and rank-and-file soldiers. Training progressed from bare-hand exercises to wooden weapons to live blades, with sessions often becoming bloody. He recorded several murders, including Jorge-Marinha''s killing of a Nagoa member at Rua dos Ourives and subsequent retaliatory deaths of Pinta Preta da Lapa, Jacó, and Alemãozinho.

He also provided an extensive glossary of capoeira slang: distorcer (to disguise), tungar (to wound), lamparina (a slap), chifrada (headbutt), jangada (police jail), and palácio de cristal (detention house).

Notably, Abreu rejected the oral tradition of African origins: "In Africa we do not know capoeiragem, but only some headbutts." He similarly dismissed Indigenous attribution, noting that native peoples lacked the specific attack and defense techniques capoeiras employed. This position is now understood to be incorrect.

Although Abreu had practiced capoeira in his youth, he later denounced it in his writings as a practice associated with criminality and urban violence. His complex relationship with capoeira reflects broader tensions within Brazilian society during the transition from Empire to Republic.

A fervent republican, Abreu collaborated with Sampaio Ferraz on the newspaper Correio do Povo and with Lopes Trovão on O Combate—the same Sampaio Ferraz who, as Chief of Police after 1889, would become the most ruthless persecutor of capoeiras in Brazilian history. Abreu was implicated in the June 1889 assassination attempt against Emperor Pedro II, though the actual attacker was Adriano Augusto do Valle.

His second book, Nagôas e Guayamús, is now considered lost.

After the proclamation of the Republic in November 1889, Abreu grew disillusioned with the authoritarianism of President Floriano Peixoto, who unconstitutionally refused to call elections after assuming power. When the Revolta da Armada broke out in September 1893—a naval revolt led by Admirals Custódio José de Melo and Saldanha da Gama against the regime—Abreu supported the insurgents.

In February 1894, Plácido de Abreu was executed by firing squad near the Copacabana tunnel. According to Coelho Neto''s account, he "died with the heroism of an amouco, shot in the Copacabana tunnel" while walking in darkness. He was betrayed by an officer and shot in the back. Despite weakening from prolonged imprisonment, he attempted to stand after falling against the wall, grinding his teeth as he faced his executioners. Some historians believe his murder was politically motivated due to his activism and opposition to the Floriano regime.

Though he died in obscurity at approximately 37 years of age, Abreu''s work has gained renewed recognition among historians and capoeira scholars. Os Capoeiras remains one of the earliest and most detailed contemporary accounts of capoeira, its practitioners, and its place in Brazilian society at the end of the 19th century—a rare window into the world of the maltas before the republican purge that would scatter them to Fernando de Noronha and drive capoeira underground.',
  'Author of Os Capoeiras (1886) - the first book dedicated entirely to capoeira; Documented the Nagôas and Guaiamús maltas, their territories, leaders, and organizational structure; Created an extensive glossary of 19th-century capoeira slang; Provided eyewitness accounts of malta violence and training methods; His work is cited by historians including Carlos Eugênio Líbano Soares in A Negregada Instituição; Facilitated modern translations by Mestre Itapoan (Portuguese) and Matthias Röhrig Assunção (English)'
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
-- Plácido documented Manduca extensively in Os Capoeiras
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
    "association_context": "Plácido de Abreu documented Manduca da Praia extensively in Os Capoeiras (1886) as the chief of the Santa Lucia party (Nagôas). As an amateur capoeirista in Rio during the 1870s-1880s, Abreu had insider knowledge of the malta world and documented Manduca''s exploits and leadership."
  }'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, Os Capoeiras (1886); CapoeiraWiki; Capoeira History'
FROM genealogy.person_profiles pa, genealogy.person_profiles mp
WHERE pa.apelido = 'Plácido de Abreu'
  AND mp.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- The following relationships cannot be created yet because
-- the related persons are not in the dataset:
--
-- Leandro Bonaparte:
--   predicate: associated_with
--   properties: { "association_context": "Plácido documented Leandro Bonaparte
--                 as the famous chief of the Saint Francis party (Guaiamú).
--                 Insider knowledge from his time as amateur capoeirista." }
--
-- Jorge Marinha:
--   predicate: associated_with
--   properties: { "association_context": "Plácido documented Jorge Marinha as
--                 chief of the Marinha gang and killer of a Nagoa member at
--                 Rua dos Ourives." }
--
-- Note: Sampaio Ferraz and Lopes Trovão are NOT capoeiristas and should
-- NOT be imported to the genealogy. They are historical figures who
-- interacted with capoeira culture but were not practitioners.
--
-- Note: The maltas Nagôas and Guaiamús are NOT capoeira groups in the modern
-- sense - they were street gangs that used capoeira. They should NOT be
-- imported as groups.

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/placido-de-abreu.sql',
  NULL,
  ARRAY['persons/manduca-da-praia.sql'],
  'First capoeira historian; author of Os Capoeiras (1886)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
