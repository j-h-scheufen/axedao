-- ============================================================
-- GENEALOGY PERSON IMPORT: Major Vidigal
-- Generated: 2025-12-08
-- Primary Source: https://pt.wikipedia.org/wiki/Miguel_Nunes_Vidigal
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
-- ============================================================
-- Major Miguel Nunes Vidigal (1745-1843)
-- The earliest named capoeira practitioner in documented history.
-- Paradoxically, the chief persecutor of capoeiristas was himself
-- a master of the art.
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
  'Miguel Nunes Vidigal',
  'Major Vidigal',
  NULL, -- Military title "Major" is not a capoeira rank
  NULL, -- No verified public domain portrait found
  '[{"type": "website", "url": "https://pt.wikipedia.org/wiki/Miguel_Nunes_Vidigal"}, {"type": "website", "url": "https://portalcapoeira.com/capoeira/curiosidades/major-miguel-nunes-vidigal/"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-style-distinction era
  'Pre-codification era. Style distinctions (Angola/Regional) did not exist. Vidigal practiced what would later be called capoeira carioca - the violent urban street form of Rio de Janeiro.',
  -- Life dates
  1745,
  'exact'::genealogy.date_precision,
  'Angra dos Reis, Brazil',
  1843,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (bio)
  E'Miguel Nunes Vidigal embodies one of capoeira history''s great paradoxes: the man who became the most feared persecutor of capoeiristas in early 19th-century Rio de Janeiro was himself a master of the very art he hunted.

Born December 1, 1745, in Angra dos Reis in the Captaincy of Rio de Janeiro, Vidigal rose through military ranks from a young age. He enlisted in a cavalry militia regiment and climbed steadily: ensign in 1782, lieutenant in 1784, captain in 1790, major in 1797. When the Portuguese royal family fled Napoleon''s invasion and arrived in Brazil in 1808, Vidigal became the first Brazilian-born commander of military forces in the newly formed United Kingdom of Portugal, Brazil and the Algarves.

In 1809, one year after the arrival of Dom João VI, the Police Secretariat was created and the Royal Police Guard was organized. Major Vidigal was appointed its chief. In this role, he became an implacable persecutor of candomblés, samba gatherings, and especially capoeiristas—"for whom he reserved special treatment, a kind of beatings and torture that he called ''Ceia dos Camarões''" (Shrimp Supper). The name came from the results of the lashing sessions: victims'' skin turned so pink they evoked the image of cooked shrimp.

Yet the irony was not lost on his contemporaries. His detractors described him as "a tall, fat man, of a grenadier''s caliber, slow, with a soft voice, but a skillful capoeira, with cold blood and agility beyond all proof, respected by the most fearsome thugs of his time. He played marvelously with the stick, knife, punch, and razor, and in head and foot blows he was unsurpassed."

In the writer Manuel Antônio de Almeida''s classic 1854 novel "Memórias de um Sargento de Milícias," Vidigal appears as a fictional character—the only rigorously historical figure in the narrative. Almeida wrote: "Major Vidigal, who first appeared in 1809, was for many years more than the chief—he was the owner of the colonial police. Highly skilled in operations, perverse and dictatorial in punishments, he was the horror of the unprotected classes of Rio de Janeiro."

His terrifying reputation gave rise to a Portuguese expression that endures to this day: "lá vem o Vidigal" (here comes Vidigal), meaning that something terrible was approaching.

Then came June 1828—a moment that would become a turning point in capoeira history. On June 9, German mercenary soldiers in Rio revolted after one of their comrades was sentenced to a brutal lashing by Major Francisco Pedro Drago. When the punishment was doubled to 200 sword strokes, the Germans freed their comrade and attacked the officer. Word spread quickly, and about 200 Irish mercenaries joined. The foreign soldiers seized weapons and liquor, sparking three days of citywide riots. They advanced toward the King''s palace, burned officers'' homes, and controlled large portions of the city. The imperial forces were overwhelmed—they simply lacked the numbers to contain the foreign mercenaries.

It was in this moment of crisis that the capoeiras entered history''s spotlight. According to tradition, Major Vidigal—the very man who had persecuted them with his "Shrimp Suppers"—called upon the enslaved capoeiristas for help. Slaveowners released their enslaved capoeiras to form militias. Armed with the authorities'' blessing, the capoeiras took to the streets.

An eyewitness left a vivid account: "Many Germans in São Cristovão managed to assemble in one location. Those who didn''t were confronted by a group of black capoeiras and engaged in deadly combat. Even when stationed and armed with rifles, the rebels couldn''t withstand the fists, stones, and sticks. They fell in the streets and public squares, either wounded or dead."

The success was almost immediate. Within three days, the revolt was crushed—thanks largely to the capoeiras. The final toll was devastating: approximately 240 mercenaries killed and over 300 wounded; on the defending side, around 120 dead and 180 wounded. The revolt''s leader, August von Steinhousen, was condemned to death. The mercenary battalions were dissolved and survivors deported.

A German observer captured the transformation''s significance: the enslaved "gained five decades'' worth of confidence in just three days, sensing their newfound power." Historian Carlos Eugênio Líbano Soares argues that this revolt was the single most important event in establishing capoeira''s dominance over Rio''s streets for the rest of the 19th century. The capoeiras had proven themselves indispensable—and terrifying.

Yet the paradox deepened. After the mutiny was suppressed, the Police Commissioner issued an edict prohibiting all blacks, especially slaves, from using any kind of weapons. The very effectiveness that saved the empire now made the capoeiras a greater threat in the eyes of the elite. If they could defeat armed European soldiers with fists and sticks, what might they do if they turned against their masters?

In 1820, Benedictine monks granted Vidigal an extensive property at the foot of Morro Dois Irmãos, stretching from the mountain slopes to the ocean. He developed this into the Chácara do Vidigal. On July 10, 1843, at the remarkable age of 98, Miguel Nunes Vidigal died on these lands—which today bear his name as the Vidigal neighborhood of Rio de Janeiro.

Who taught Vidigal capoeira remains unknown. The trail ends with him—the earliest named individual with documented capoeira skills in history. He represents capoeira''s complex position in Brazilian society: criminalized by the state, yet so effective that when crisis came, even the chief persecutor had to call on the very people he had tortured.',
  -- Achievements
  'First Brazilian-born commander of military forces in the United Kingdom of Portugal, Brazil and the Algarves (1808). Chief of the Royal Police Guard of Rio de Janeiro (1809). Rose to rank of Brigadier (1824). Immortalized as a character in the classic Brazilian novel "Memórias de um Sargento de Milícias" (1854). The Vidigal neighborhood of Rio de Janeiro is named after him. Recognized by contemporaries as an unsurpassed master of capoeira, knife, stick, and razor fighting.'
) RETURNING id AS major_vidigal_id;

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================
-- No statements generated because:
-- 1. Vidigal's teacher is unknown (the lineage trail ends here)
-- 2. No students are documented
-- 3. No capoeira groups existed in this formal sense during his era
-- 4. The Royal Police Guard was not a capoeira group
-- ============================================================

COMMIT;
