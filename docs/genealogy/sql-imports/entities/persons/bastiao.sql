-- ============================================================
-- GENEALOGY PERSON: Bastiao
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Minimal individual documentation; known primarily from lists of
-- capoeiristas defended by Cosme de Farias.
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
  -- Extended content (bilingual)
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Sebastião de Souza',
  'Bastião',
  NULL,
  NULL,
  ARRAY['https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s-1930s). Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s-1930s). As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1895,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Bastião was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is remembered as part of a group of legendary valentões (tough guys) who were defended in court by Major Cosme de Farias, the famous "rábula" (self-taught lawyer) who represented over 30,000 poor and marginalized people in Bahia.\n\nThe name "Bastião" is likely a diminutive of "Sebastião," and some sources mention "Sebastião de Souza" as one of the capoeiristas who worked as capangas (political henchmen) for Bahian politicians during the First Republic. These capangas served as enforcers for political figures including former governors Joaquim José de Seabra (1855-1942) and Antônio Moniz (1881-1940).\n\nBastião is consistently listed alongside other famous capoeiristas of his era who were defended by Cosme de Farias, including Pedro Porreta, Chico Três Pedaços, Samuel da Calçada, Nozinho da Cocheira, Duquinha, and Escalvino. This group represents an important chapter in the history of capoeira in Bahia, when the practice was still criminalized and practitioners often found themselves in conflict with the law.\n\nUnlike some of his contemporaries, Bastião does not have a dedicated chapter in "Mestres e capoeiras famosos da Bahia," suggesting that less detailed historical documentation exists about him individually compared to figures like Pedro Porreta or Nozinho da Cocheira.',
  E'Bastião foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. É lembrado como parte de um grupo de valentões lendários que foram defendidos em tribunais pelo Major Cosme de Farias, o famoso "rábula" (advogado autodidata) que representou mais de 30.000 pessoas pobres e marginalizadas na Bahia.\n\nO nome "Bastião" é provavelmente um diminutivo de "Sebastião," e algumas fontes mencionam "Sebastião de Souza" como um dos capoeiristas que trabalhavam como capangas (jagunços políticos) para políticos baianos durante a Primeira República. Esses capangas serviam como executores para figuras políticas incluindo os ex-governadores Joaquim José de Seabra (1855-1942) e Antônio Moniz (1881-1940).\n\nBastião é consistentemente listado junto com outros capoeiristas famosos de sua era que foram defendidos por Cosme de Farias, incluindo Pedro Porreta, Chico Três Pedaços, Samuel da Calçada, Nozinho da Cocheira, Duquinha e Escalvino. Este grupo representa um capítulo importante na história da capoeira na Bahia, quando a prática ainda era criminalizada e os praticantes frequentemente se encontravam em conflito com a lei.\n\nDiferente de alguns de seus contemporâneos, Bastião não tem um capítulo dedicado em "Mestres e capoeiras famosos da Bahia," sugerindo que existe menos documentação histórica detalhada sobre ele individualmente comparado a figuras como Pedro Porreta ou Nozinho da Cocheira.',
  -- Achievements
  'Remembered as one of the legendary capoeiristas defended by Cosme de Farias; documented in Bahian capoeira historiography',
  'Lembrado como um dos capoeiristas lendários defendidos por Cosme de Farias; documentado na historiografia da capoeira baiana',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: "Bastião" is likely diminutive of "Sebastião." Full name possibly "Sebastião de Souza" based on sources listing political capangas. UNCONFIRMED.\n\nLIMITED DOCUMENTATION: Unlike other contemporaries (Pedro Porreta, Nozinho da Cocheira), Bastião does not have a dedicated chapter in "Mestres e capoeiras famosos da Bahia."\n\nSOURCES: Primarily known from Revista Capoeirando article on Cosme de Farias; Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: "Bastião" é provavelmente diminutivo de "Sebastião." Nome completo possivelmente "Sebastião de Souza" baseado em fontes listando capangas políticos. NÃO CONFIRMADO.\n\nDOCUMENTAÇÃO LIMITADA: Diferente de outros contemporâneos (Pedro Porreta, Nozinho da Cocheira), Bastião não tem um capítulo dedicado em "Mestres e capoeiras famosos da Bahia."\n\nFONTES: Conhecido principalmente pelo artigo da Revista Capoeirando sobre Cosme de Farias; artigo Sankofa USP.'
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
