-- ============================================================
-- GENEALOGY PERSON IMPORT: Major Vidigal
-- Generated: 2025-12-08
-- Primary Source: https://pt.wikipedia.org/wiki/Miguel_Nunes_Vidigal
-- ============================================================
-- DEPENDENCIES: none
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
  style_notes_en,
  style_notes_pt,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
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
  'Era pré-codificação. Distinções de estilo (Angola/Regional) não existiam. Vidigal praticava o que mais tarde seria chamado de capoeira carioca - a forma urbana violenta de rua do Rio de Janeiro.',
  -- Life dates
  1745,
  'exact'::genealogy.date_precision,
  'Angra dos Reis, Brazil',
  1843,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Miguel Nunes Vidigal embodies one of capoeira history''s great paradoxes: the man who became the most feared persecutor of capoeiristas in early 19th-century Rio de Janeiro was himself a master of the very art he hunted.

Born December 1, 1745, in Angra dos Reis, Vidigal rose through military ranks from a young age. He became the first Brazilian-born commander of military forces when the Portuguese royal family arrived in Brazil in 1808. In 1809, he was appointed chief of the newly formed Royal Police Guard.

In this role, he became an implacable persecutor of candomblés, samba gatherings, and especially capoeiristas—"for whom he reserved special treatment, a kind of beatings and torture that he called ''Ceia dos Camarões''" (Shrimp Supper). The name came from the results of the lashing sessions: victims'' skin turned so pink they evoked the image of cooked shrimp.

Yet the irony was not lost on his contemporaries. His detractors described him as "a skillful capoeira, with cold blood and agility beyond all proof, respected by the most fearsome thugs of his time. He played marvelously with the stick, knife, punch, and razor, and in head and foot blows he was unsurpassed."

His terrifying reputation gave rise to a Portuguese expression: "lá vem o Vidigal" (here comes Vidigal), meaning something terrible was approaching.

In June 1828, German and Irish mercenary soldiers revolted. The imperial forces were overwhelmed. In this crisis, tradition holds that Vidigal called upon the very capoeiras he had persecuted. Slaveowners released their enslaved capoeiristas to form militias. An eyewitness recorded: "Even when stationed and armed with rifles, the rebels couldn''t withstand the fists, stones, and sticks. They fell in the streets and public squares, either wounded or dead."

Within three days the revolt was crushed—thanks largely to the capoeiras. Historian Carlos Eugênio Líbano Soares argues this was the single most important event in establishing capoeira''s dominance over Rio''s streets.

He was immortalized in Manuel Antônio de Almeida''s 1854 novel "Memórias de um Sargento de Milícias." In 1820, Benedictine monks granted him land at the foot of Morro Dois Irmãos. He died there on July 10, 1843, at age 98. The area is now the Vidigal neighborhood of Rio de Janeiro.

Who taught Vidigal capoeira remains unknown—the lineage trail ends with him.',
  -- bio_pt
  E'Miguel Nunes Vidigal incorpora um dos grandes paradoxos da história da capoeira: o homem que se tornou o mais temido perseguidor de capoeiristas no Rio de Janeiro do início do século XIX era ele próprio um mestre da arte que caçava.

Nascido em 1º de dezembro de 1745, em Angra dos Reis, Vidigal subiu nas patentes militares desde jovem. Tornou-se o primeiro comandante brasileiro nato das forças militares quando a família real portuguesa chegou ao Brasil em 1808. Em 1809, foi nomeado chefe da recém-formada Guarda Real de Polícia.

Neste papel, tornou-se um implacável perseguidor de candomblés, rodas de samba e especialmente capoeiristas—"para quem reservava tratamento especial, um tipo de surras e torturas que chamava de ''Ceia dos Camarões''". O nome vinha do resultado das sessões de açoite: a pele das vítimas ficava tão rosa que evocava a imagem de camarões cozidos.

No entanto, a ironia não passou despercebida por seus contemporâneos. Seus detratores o descreviam como "um hábil capoeira, de sangue frio e agilidade além de toda prova, respeitado pelos mais temíveis valentões de seu tempo. Jogava maravilhosamente com pau, faca, soco e navalha, e em golpes de cabeça e pé era insuperável."

Sua aterrorizante reputação deu origem a uma expressão portuguesa: "lá vem o Vidigal", significando que algo terrível se aproximava.

Em junho de 1828, soldados mercenários alemães e irlandeses se revoltaram. As forças imperiais foram dominadas. Nesta crise, a tradição conta que Vidigal convocou os próprios capoeiras que havia perseguido. Senhores de escravos liberaram seus capoeiristas escravizados para formar milícias. Uma testemunha ocular registrou: "Mesmo estacionados e armados com rifles, os rebeldes não conseguiam resistir aos punhos, pedras e paus. Caíam nas ruas e praças públicas, feridos ou mortos."

Em três dias a revolta foi esmagada—graças em grande parte aos capoeiras. O historiador Carlos Eugênio Líbano Soares argumenta que este foi o evento mais importante para estabelecer a dominância da capoeira nas ruas do Rio.

Foi imortalizado no romance de 1854 de Manuel Antônio de Almeida "Memórias de um Sargento de Milícias". Em 1820, monges beneditinos concederam-lhe terras ao pé do Morro Dois Irmãos. Morreu lá em 10 de julho de 1843, aos 98 anos. A área é hoje o bairro do Vidigal no Rio de Janeiro.

Quem ensinou capoeira a Vidigal permanece desconhecido—a trilha da linhagem termina com ele.',
  -- achievements_en
  'First Brazilian-born commander of military forces in the United Kingdom of Portugal, Brazil and the Algarves (1808). Chief of the Royal Police Guard of Rio de Janeiro (1809). Rose to rank of Brigadier (1824). Immortalized as a character in the classic Brazilian novel "Memórias de um Sargento de Milícias" (1854). The Vidigal neighborhood of Rio de Janeiro is named after him. Recognized by contemporaries as an unsurpassed master of capoeira, knife, stick, and razor fighting.',
  -- achievements_pt
  'Primeiro comandante brasileiro nato das forças militares no Reino Unido de Portugal, Brasil e Algarves (1808). Chefe da Guarda Real de Polícia do Rio de Janeiro (1809). Alcançou o posto de Brigadeiro (1824). Imortalizado como personagem no clássico romance brasileiro "Memórias de um Sargento de Milícias" (1854). O bairro do Vidigal no Rio de Janeiro tem seu nome. Reconhecido pelos contemporâneos como mestre insuperável de capoeira, faca, pau e navalha.',
  -- Researcher notes (English)
  E'BIRTH DATE: December 1, 1745 - exact date documented in historical sources.

DEATH DATE: July 10, 1843 - exact date documented. Died at age 98.

PARADOX: The most feared persecutor of capoeiristas in early 19th-century Rio de Janeiro was himself a documented master of capoeira. His detractors described him as "a skillful capoeira, with cold blood and agility beyond all proof."

TEACHER: Unknown. The lineage trail ends with him—we do not know who taught Vidigal capoeira.

MERCENARY REVOLT (1828): When German and Irish mercenary soldiers revolted, Vidigal called upon the very capoeiras he had persecuted. Within three days the revolt was crushed—largely thanks to the capoeiristas.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 1º de dezembro de 1745 - data exata documentada em fontes históricas.

DATA DE MORTE: 10 de julho de 1843 - data exata documentada. Morreu aos 98 anos.

PARADOXO: O perseguidor mais temido dos capoeiristas no Rio de Janeiro do início do século XIX era ele próprio um mestre documentado de capoeira. Seus detratores o descreviam como "um hábil capoeira, de sangue frio e agilidade além de toda prova."

PROFESSOR: Desconhecido. A trilha de linhagem termina com ele—não sabemos quem ensinou capoeira a Vidigal.

REVOLTA DOS MERCENÁRIOS (1828): Quando soldados mercenários alemães e irlandeses se revoltaram, Vidigal convocou os próprios capoeiras que havia perseguido. Em três dias a revolta foi esmagada—em grande parte graças aos capoeiristas.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year,
  birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place,
  death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision,
  death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en,
  bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en,
  achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================
-- No statements generated because:
-- 1. Vidigal's teacher is unknown (the lineage trail ends here)
-- 2. No students are documented
-- 3. No capoeira groups existed in this formal sense during his era
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/major-vidigal.sql',
  NULL,
  ARRAY[]::text[],
  'Police chief and capoeira master (1745-1843); earliest named individual with documented capoeira skills'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
