-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2025-12-17T14:34:05.112Z
-- ============================================================
--
-- New entity files: 14
-- Changed entity files: 0
-- New statement files: 14
-- Changed statement files: 0
-- Deleted files: 0
-- Unchanged files: 260
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/americo-ciencia.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Américo Ciência
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Active as a fighter in 1936 (Odeon Park fights against Bimba).
-- Bimba was born 1899, making him 37 in 1936.
-- As a contemporary who faced Bimba in challenge fights, Américo Ciência
-- was likely in his fighting prime (25-40 years old), meaning born ~1896-1911.
-- Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Pastinha listed him among the deceased in 1967 interview.
-- As an "angoleiro de briga" of his generation, likely died in the 1950s-1960s.
-- Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Américo Ciência', -- apelido
  NULL, -- title: no formal title documented; referred to as mestre in some sources but not consistently
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://velhosmestres.com/br/pastinha-1976', 'https://capoeira.online/history/mestres/mestre-bimba/']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly identified Américo Ciência as a practitioner of "pure Capoeira de Angola," distinguishing him from the modernized Regional style. His ability to fight both Henrique Bahia to a draw and face Bimba in a challenge match demonstrates his competence as a martial artist.',
  E'Capoeira de Angola tradicional. Pastinha explicitamente identificou Américo Ciência como praticante de "capoeira de Angola pura," distinguindo-o do estilo Regional modernizado. Sua capacidade de lutar com Henrique Bahia até um empate e enfrentar Bimba em uma luta de desafio demonstra sua competência como artista marcial.',
  1900, -- birth_year: estimated from 1936 fight activity (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given his involvement in Liberdade rodas
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Américo Ciência (also spelled Américo Sciencia in period newspapers) was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of "angoleiros de briga" (fighting angoleiros) - practitioners of traditional capoeira angola renowned for their combative prowess.\n\nIn February 1936, Américo Ciência fought Henrique Bahia in an exhibition match at the newly inaugurated Odeon Park in Salvador. The bout "ended with an undecided outcome" - a notable result given Bahia''s reputation.\n\nLater in 1936, Américo Ciência faced Mestre Bimba in the famous challenge series at Odeon Park where Bimba tested his Capoeira Regional against all comers. Bimba defeated four opponents that night - Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, and José Custódio "Zé I" dos Santos - earning the nickname "Três Pancadas" (Three Hits) for his devastating efficiency.\n\nAmérico Ciência was part of the informal capoeira angola gathering at the Gengibirra/Liberdade neighborhood in Salvador, where the best capoeiristas of Bahia convened on Sundays. This group included mestres such as Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, and Butique. In 1941, Mestre Pastinha assumed leadership of this group, which he later formalized as the Centro Esportivo de Capoeira Angola (CECA).\n\nIn 1967, Mestre Pastinha listed Américo Ciência among the deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, and others. Pastinha remarked of these figures: "They are already dead. Each of them has history" - and noted that their apelidos themselves revealed "who they were, how they fought."',
  -- bio_pt
  E'Américo Ciência (também grafado como Américo Sciencia em jornais da época) foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de "angoleiros de briga" - praticantes de capoeira angola tradicional renomados por sua destreza combativa.\n\nEm fevereiro de 1936, Américo Ciência lutou contra Henrique Bahia em uma luta de exibição no recém-inaugurado Odeon Park em Salvador. O combate "terminou com resultado indeciso" - um resultado notável dada a reputação de Bahia.\n\nMais tarde em 1936, Américo Ciência enfrentou Mestre Bimba na famosa série de desafios no Odeon Park, onde Bimba testou sua Capoeira Regional contra todos os desafiantes. Bimba derrotou quatro oponentes naquela noite - Henrique Bahia, Vítor Benedito Lopes, Américo Ciência e José Custódio "Zé I" dos Santos - ganhando o apelido de "Três Pancadas" por sua eficiência devastadora.\n\nAmérico Ciência fazia parte da reunião informal de capoeira angola no bairro do Gengibirra/Liberdade em Salvador, onde os melhores capoeiristas da Bahia se reuniam aos domingos. Este grupo incluía mestres como Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio e Butique. Em 1941, Mestre Pastinha assumiu a liderança deste grupo, que mais tarde formalizou como o Centro Esportivo de Capoeira Angola (CECA).\n\nEm 1967, Mestre Pastinha listou Américo Ciência entre os praticantes falecidos de "capoeira de Angola pura," junto com Bigode de Seda, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços e outros. Pastinha comentou sobre essas figuras: "Já morreram. Cada um deles tem história" - e observou que seus apelidos revelavam "quem eles eram, como lutavam."',
  NULL, -- achievements_en: no specific achievements beyond being recognized by Pastinha
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nActive as a fighter in 1936 (Odeon Park fights against Bimba). Bimba was born 1899, making him 37 in 1936. As a contemporary who faced Bimba in challenge fights, Américo Ciência was likely in his fighting prime (25-40 years old), meaning born ~1896-1911.\n\nDEATH YEAR ESTIMATION (1960, decade):\nPastinha listed him among the deceased in 1967 interview. As an "angoleiro de briga" of his generation, likely died in the 1950s-1960s.\n\nNAME VARIATION:\n- "Américo Ciência" - Pastinha 1967, velhosmestres.com\n- "Américo Sciencia" - Diário da Bahia, March 13, 1936 (newspaper)\n\n1936 ODEON PARK CONTEXT:\n- Odeon Park inaugurated February 6, 1936 in Praça da Sé, Salvador\n- Venue for fights and betting\n- Exhibition vs Henrique Bahia: "undecided outcome"\n- Challenge fight vs Bimba: defeated\n- Odeon Park deactivated July 1936\n\nLIBERDADE/GENGIBIRRA RODA:\n- Part of informal capoeira angola gathering before CECA\n- Contemporary mestres listed: Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique\n- NOTE: Américo Ciência NOT listed among the 22 founding mestres of Gengibirra proper (per Mestre Noronha''s manuscripts)\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nDEATH: Confirmed dead before 1967 interview; exact year unknown',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nAtivo como lutador em 1936 (lutas do Odeon Park contra Bimba). Bimba nasceu em 1899, tendo 37 anos em 1936. Como contemporâneo que enfrentou Bimba em lutas de desafio, Américo Ciência provavelmente estava em seu auge de luta (25-40 anos), significando nascido ~1896-1911.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nPastinha o listou entre os falecidos em entrevista de 1967. Como "angoleiro de briga" de sua geração, provavelmente morreu nos anos 1950-1960.\n\nVARIAÇÃO DE NOME:\n- "Américo Ciência" - Pastinha 1967, velhosmestres.com\n- "Américo Sciencia" - Diário da Bahia, 13 de março de 1936 (jornal)\n\nCONTEXTO DO ODEON PARK 1936:\n- Odeon Park inaugurado em 6 de fevereiro de 1936 na Praça da Sé, Salvador\n- Local para lutas e apostas\n- Exibição vs Henrique Bahia: "resultado indeciso"\n- Luta de desafio vs Bimba: derrotado\n- Odeon Park desativado em julho de 1936\n\nRODA DA LIBERDADE/GENGIBIRRA:\n- Parte da reunião informal de capoeira angola antes do CECA\n- Mestres contemporâneos listados: Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique\n- NOTA: Américo Ciência NÃO está listado entre os 22 mestres fundadores do Gengibirra propriamente dito (conforme manuscritos de Mestre Noronha)\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nMORTE: Confirmado falecido antes da entrevista de 1967; ano exato desconhecido'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/bastiao.sql (NEW)
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

-- Source: entities/persons/bugalho.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bugalho
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1900, decade):
-- Bugalho was active as a dock worker in Salvador during the first
-- decades of the 20th century. His student Pelé da Bomba (born 1934)
-- started learning from him in 1946 at age 12. If Bugalho was teaching
-- at that time and already a recognized berimbau master, he was likely
-- 40-50 years old, placing birth around 1896-1906. Pastinha listed him
-- among "deceased" practitioners of "pure Capoeira de Angola" in 1967,
-- so he died before 1967. The 1955 Pierre Verger photographs and 1960
-- INA documentary show him still active. Estimate birth ~1900 with
-- decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name,
  apelido,
  title,
  portrait,
  public_links,
  style,
  style_notes_en,
  style_notes_pt,
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  notes_en,
  notes_pt
) VALUES (
  'Edmundo Joaquim',
  'Bugalho',
  NULL,
  NULL,
  ARRAY['https://esquiva.wordpress.com/mestres/mestre-bugalho/', 'https://velhosmestres.com/br/waldemar-1955-3']::text[],
  'angola'::genealogy.style,
  E'Renowned berimbau master and singer. Played São Bento Grande with particular virtuosity, especially during moonlit nights. Part of the select group of 20th century singers and berimbau players alongside Waldemar, Caiçara, and Traíra.',
  E'Renomado mestre de berimbau e cantador. Tocava São Bento Grande com particular virtuosismo, especialmente em noites de lua cheia. Fazia parte do seleto grupo de cantadores e tocadores de berimbau do século XX ao lado de Waldemar, Caiçara e Traíra.',
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Edmundo Joaquim was known in the capoeira world as Bugalho. His nickname came from the size of his eyes—according to capoeiristas of his time, they looked like two "bugalhos" (round growths found on oak trees).

Bugalho worked as a dock worker (carregador de embarcações), loading and unloading boats in Salvador during the first decades of the 20th century. The labor was hard, with long hours under the tropical sun. But during his rest periods, on moonlit nights, Bugalho would make his way to Praia da Preguiça beach. There, with the sea as backdrop, he would play berimbau and sing. His music carried from the beach up to the cidade alta (upper city).

Those who heard him said he was one of the greatest berimbau players of old Bahia and a master in the art of singing. He excelled particularly at São Bento Grande, a rhythm demanding both technical skill and endurance. "He was one of the best," recalled his student Pelé da Bomba decades later. "He played São Bento Grande very well, especially on moonlit nights."

Bugalho frequented the legendary rodas at Mestre Waldemar''s barracão in the Corta Braço region (now Avenida Peixe), near the old Estrada dos Boiadeiros in the Liberdade neighborhood. He was also a regular presence at the ramp of the old Mercado Modelo and at Salvador''s festas de largo (street festivals). Alongside Waldemar, Caiçara, and Traíra, Bugalho composed the select group of cantadores and tocadores who defined the sound of 20th century capoeira in the streets of old Bahia.

Pierre Verger photographed Bugalho playing berimbau at Waldemar''s barracão around 1955, documenting these sessions for O Cruzeiro magazine. The images show Bugalho alongside Traíra and Nelson, the berimbaus in their hands. In 1960, French television captured him in the documentary "Voyage sans passeport," playing capoeira on Itapuã beach with Waldemar, Caiçara, and Traíra.

One source claims Bugalho was the first to extract wire from tires by hand ("na raça") without burning them—before this, berimbau strings came from fence wire or were burned and rusty. He is also credited by this source with starting to make berimbaus to sell at the Água de Meninos market and inventing a special paint for them, creating a famous blue berimbau named "Azulão." However, most sources attribute these innovations to Mestre Waldemar. The historiographical discrepancy remains unresolved.

On the moonlit sands of Praia da Preguiça, Bugalho encountered the young Natalício Neves da Silva, a boy from Governador Mangabeira. It was 1946, and Natalício was twelve years old. Bugalho taught him to gingar during those rest hours and full moon nights. "Segui a tradição do meu mestre, Bugalho," Natalício would later say, "um grande tocador de berimbau. Ele era um dos melhores." (I followed my master''s tradition, Bugalho, a great berimbau player. He was one of the best.) The boy would become Mestre Pelé da Bomba—the "Gogó de Ouro" (Golden Throat) of Bahia—who carried Bugalho''s musical lineage into the 21st century.

Mestre Pastinha listed Bugalho among the legendary deceased practitioners of "pure Capoeira de Angola" in 1967, placing him alongside Américo Ciência, Amorzinho, Chico Três Pedaços, Doze Homens, and others. This indicates Bugalho died sometime before 1967. His exact death date remains unknown.',
  E'Edmundo Joaquim era conhecido no mundo da capoeira como Bugalho. Seu apelido veio do tamanho de seus olhos—segundo os capoeiristas de sua época, pareciam dois "bugalhos" (excrescências redondas encontradas em carvalhos).

Bugalho trabalhava como carregador de embarcações, carregando e descarregando barcos em Salvador nas primeiras décadas do século XX. O trabalho era pesado, com longas horas sob o sol tropical. Mas durante seus períodos de descanso, em noites de lua cheia, Bugalho ia até a Praia da Preguiça. Lá, com o mar como cenário, tocava berimbau e cantava. Sua música ecoava da praia até a cidade alta.

Aqueles que o ouviram diziam que ele era um dos maiores tocadores de berimbau da antiga Bahia e um mestre na arte de cantar. Destacava-se particularmente no São Bento Grande, um ritmo que exige habilidade técnica e resistência. "Ele era um dos melhores," recordou seu aluno Pelé da Bomba décadas depois. "Tocava muito bem o São Bento Grande, principalmente quando era noite de lua."

Bugalho frequentava as lendárias rodas no barracão de Mestre Waldemar na região do Corta Braço (atual Avenida Peixe), perto da antiga Estrada dos Boiadeiros no bairro da Liberdade. Era também presença assídua na rampa do antigo Mercado Modelo e nas festas de largo de Salvador. Ao lado de Waldemar, Caiçara e Traíra, Bugalho compunha o seleto grupo de cantadores e tocadores que definiu o som da capoeira do século XX nas ruas da velha Bahia.

Pierre Verger fotografou Bugalho tocando berimbau no barracão de Waldemar por volta de 1955, documentando essas sessões para a revista O Cruzeiro. As imagens mostram Bugalho ao lado de Traíra e Nelson, os berimbaus em suas mãos. Em 1960, a televisão francesa o capturou no documentário "Voyage sans passeport," jogando capoeira na praia de Itapuã com Waldemar, Caiçara e Traíra.

Uma fonte afirma que Bugalho foi o primeiro a extrair arame de pneus à mão ("na raça") sem queimá-los—antes disso, as cordas de berimbau vinham de arame de cerca ou eram queimadas e enferrujadas. Ele também é creditado por essa fonte com começar a fazer berimbaus para vender na feira de Água de Meninos e inventar uma pintura especial para eles, criando um famoso berimbau azul chamado "Azulão." No entanto, a maioria das fontes atribui essas inovações a Mestre Waldemar. A discrepância historiográfica permanece não resolvida.

Nas areias enluaradas da Praia da Preguiça, Bugalho encontrou o jovem Natalício Neves da Silva, um menino de Governador Mangabeira. Era 1946, e Natalício tinha doze anos. Bugalho ensinou-lhe a gingar durante aquelas horas de descanso e noites de lua cheia. "Segui a tradição do meu mestre, Bugalho," diria Natalício mais tarde, "um grande tocador de berimbau. Ele era um dos melhores." O menino se tornaria Mestre Pelé da Bomba—o "Gogó de Ouro" da Bahia—que carregou a linhagem musical de Bugalho até o século XXI.

Mestre Pastinha listou Bugalho entre os lendários praticantes falecidos da "pura Capoeira de Angola" em 1967, colocando-o ao lado de Américo Ciência, Amorzinho, Chico Três Pedaços, Doze Homens e outros. Isso indica que Bugalho morreu em algum momento antes de 1967. Sua data exata de morte permanece desconhecida.',
  E'Recognized by Mestre Pastinha as legendary practitioner of pure Capoeira de Angola (1967)
Renowned berimbau virtuoso, particularly skilled at São Bento Grande
Master of singing in capoeira
Photographed by Pierre Verger at Mestre Waldemar''s barracão (~1955)
Filmed in French documentary "Voyage sans passeport" (January 9, 1960)
Taught Mestre Pelé da Bomba, the "Gogó de Ouro" (Golden Throat) of Bahia
Member of the select group of 20th century singers and berimbau players alongside Waldemar, Caiçara, and Traíra',
  E'Reconhecido por Mestre Pastinha como lendário praticante da pura Capoeira de Angola (1967)
Renomado virtuose do berimbau, particularmente habilidoso no São Bento Grande
Mestre do canto na capoeira
Fotografado por Pierre Verger no barracão de Mestre Waldemar (~1955)
Filmado no documentário francês "Voyage sans passeport" (9 de janeiro de 1960)
Ensinou Mestre Pelé da Bomba, o "Gogó de Ouro" da Bahia
Membro do seleto grupo de cantadores e tocadores do século XX ao lado de Waldemar, Caiçara e Traíra',
  E'BIRTH YEAR ESTIMATION (1900, decade):
Bugalho was a dock worker in Salvador "during the first decades of the 20th century." His student Pelé da Bomba (born Dec 25, 1934) began learning from him in 1946 at the Mercado Modelo ramp at age 12. If Bugalho was already a recognized berimbau master and teaching at that time, he was likely 40-50 years old, placing birth around 1896-1906. The 1955 Pierre Verger photographs show him active. Pastinha listed him among "deceased" practitioners in 1967. Estimate birth ~1900 with decade precision.

DEATH YEAR: Unknown. Died before 1967 (listed as deceased by Pastinha). Still alive in 1960 (documented in film).

NAME ETYMOLOGY:
"Bugalho" refers to round growths on oak trees. His eyes resembled two bugalhos according to contemporaries.

TEACHERS:
- Mestre Waldemar (~1940s) - frequented his barracão in Liberdade

STUDENTS:
- Mestre Pelé da Bomba (Natalício Neves da Silva, 1934-2024) - began 1946 at Mercado Modelo ramp

MEDIA APPEARANCES:
- ~1953: Photographed by Alice Brill at Waldemar''s barracão (alongside Waldemar, Cabelo Bom, Traíra)
- ~1955: Photographed by Pierre Verger at Waldemar''s barracão (alongside Traíra, Nelson)
- 1960 Jan 9: Filmed in "Voyage sans passeport" documentary by French TV (INA.fr), Itapuã beach with Waldemar, Caiçara, Traíra

RODA LOCATIONS:
- Barracão de Waldemar, Corta Braço / Avenida Peixe, Liberdade, Salvador
- Rampa do Mercado Modelo, Salvador
- Praia da Preguiça, Salvador (practice/teaching location)
- Festas de largo (street festivals), Salvador

BERIMBAU/AZULÃO DISCREPANCY:
One source (Esquiva de Rua) claims Bugalho was first to: (1) extract tire wire by hand without burning, (2) sell berimbaus at Água de Meninos market, (3) invent special paint and create "Azulão." Most other sources (velhosmestres, Waldemar''s own testimony) credit these innovations to Mestre Waldemar. Possible explanation: Bugalho may have contributed to or co-developed these techniques with Waldemar. No conclusive resolution.

RECOGNITION BY PASTINHA:
In 1967, Mestre Pastinha listed Bugalho among deceased practitioners of "pure Capoeira de Angola" alongside: Américo Ciência, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, década):
Bugalho era carregador de embarcações em Salvador "nas primeiras décadas do século XX." Seu aluno Pelé da Bomba (nascido em 25 de dezembro de 1934) começou a aprender com ele em 1946 na rampa do Mercado Modelo aos 12 anos. Se Bugalho já era um reconhecido mestre de berimbau e ensinava naquela época, provavelmente tinha 40-50 anos, situando seu nascimento por volta de 1896-1906. As fotografias de Pierre Verger de 1955 o mostram ativo. Pastinha listou-o entre praticantes "falecidos" em 1967. Estimativa de nascimento ~1900 com precisão de década.

ANO DE MORTE: Desconhecido. Morreu antes de 1967 (listado como falecido por Pastinha). Ainda vivo em 1960 (documentado em filme).

ETIMOLOGIA DO NOME:
"Bugalho" refere-se a excrescências redondas em carvalhos. Seus olhos pareciam dois bugalhos segundo os contemporâneos.

MESTRES:
- Mestre Waldemar (~anos 1940) - frequentou seu barracão na Liberdade

ALUNOS:
- Mestre Pelé da Bomba (Natalício Neves da Silva, 1934-2024) - começou em 1946 na rampa do Mercado Modelo

APARIÇÕES EM MÍDIA:
- ~1953: Fotografado por Alice Brill no barracão de Waldemar (ao lado de Waldemar, Cabelo Bom, Traíra)
- ~1955: Fotografado por Pierre Verger no barracão de Waldemar (ao lado de Traíra, Nelson)
- 1960 Jan 9: Filmado no documentário "Voyage sans passeport" pela TV francesa (INA.fr), praia de Itapuã com Waldemar, Caiçara, Traíra

LOCAIS DE RODA:
- Barracão de Waldemar, Corta Braço / Avenida Peixe, Liberdade, Salvador
- Rampa do Mercado Modelo, Salvador
- Praia da Preguiça, Salvador (local de prática/ensino)
- Festas de largo, Salvador

DISCREPÂNCIA BERIMBAU/AZULÃO:
Uma fonte (Esquiva de Rua) afirma que Bugalho foi o primeiro a: (1) extrair arame de pneu à mão sem queimar, (2) vender berimbaus na feira de Água de Meninos, (3) inventar pintura especial e criar o "Azulão." A maioria das outras fontes (velhosmestres, depoimento do próprio Waldemar) creditam essas inovações a Mestre Waldemar. Possível explicação: Bugalho pode ter contribuído ou co-desenvolvido essas técnicas com Waldemar. Sem resolução conclusiva.

RECONHECIMENTO POR PASTINHA:
Em 1967, Mestre Pastinha listou Bugalho entre praticantes falecidos da "pura Capoeira de Angola" ao lado de: Américo Ciência, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem.'
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

-- Source: entities/persons/duquinha.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Duquinha
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Known alongside Escalvino as "Os irmaos terror" (The terror brothers).
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
  NULL,
  'Duquinha',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
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
  E'Duquinha was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is featured in "Mestres e capoeiras famosos da Bahia" together with Escalvino (Luís Escalvino), sharing the ominous subtitle "Os irmãos terror" (The terror brothers). This pairing suggests they were either biological brothers or such close associates that they operated as a fearsome duo in Salvador''s streets.\n\nThe name "Duquinha" is a diminutive form, likely derived from "Duque" (Duke), which may have been an ironic or aspirational nickname common among the marginalized populations of early 20th century Salvador. Such nicknames often carried a mix of humor and menace.\n\nDuquinha was among the capoeiristas who worked as capangas (political henchmen) for Bahian politicians during the First Republic. These enforcers provided muscle during electoral disputes and served the interests of powerful political figures. Sources list him alongside other political capangas including Inocêncio Sete Mortes, Estevinho, Samuel da Calçada, Sebastião de Souza, and Pedro Mineiro.\n\nThe "terror brothers" designation indicates that Duquinha and Escalvino together were particularly feared in Salvador''s underworld. Whether this reputation came from political enforcement, street fighting, or a combination of both, their joint notoriety was significant enough to earn them a shared chapter in the historical record.\n\nDuquinha was defended in court by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, gamblers, and the poor.',
  E'Duquinha foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. Ele é apresentado em "Mestres e capoeiras famosos da Bahia" junto com Escalvino (Luís Escalvino), compartilhando o ominoso subtítulo "Os irmãos terror." Esse emparelhamento sugere que eram irmãos biológicos ou associados tão próximos que operavam como uma dupla temível nas ruas de Salvador.\n\nO nome "Duquinha" é uma forma diminutiva, provavelmente derivada de "Duque," que pode ter sido um apelido irônico ou aspiracional comum entre as populações marginalizadas do início do século XX em Salvador. Tais apelidos frequentemente carregavam uma mistura de humor e ameaça.\n\nDuquinha estava entre os capoeiristas que trabalhavam como capangas (jagunços políticos) para políticos baianos durante a Primeira República. Esses executores forneciam a força durante disputas eleitorais e serviam aos interesses de poderosas figuras políticas. As fontes o listam junto com outros capangas políticos incluindo Inocêncio Sete Mortes, Estevinho, Samuel da Calçada, Sebastião de Souza e Pedro Mineiro.\n\nA designação "irmãos terror" indica que Duquinha e Escalvino juntos eram particularmente temidos no submundo de Salvador. Se essa reputação veio da aplicação política, brigas de rua, ou uma combinação de ambos, sua notoriedade conjunta foi significativa o suficiente para lhes render um capítulo compartilhado no registro histórico.\n\nDuquinha foi defendido em tribunal pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas, jogadores e pobres.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with Escalvino under title "Os irmãos terror" (The terror brothers); documented role as political capanga during the First Republic',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com Escalvino sob o título "Os irmãos terror"; papel documentado como capanga político durante a Primeira República',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: Full name unknown. "Duquinha" is diminutive form, likely from "Duque" (Duke).\n\nPARTNERSHIP: Listed with Escalvino (Luís Escalvino) as "Os irmãos terror" (The terror brothers). May be biological brothers or close associates.\n\nPOLITICAL ROLE: Listed among capoeiristas who worked as capangas during First Republic.\n\nBOOK CHAPTER: Shares chapter with Escalvino "Os irmãos terror" in "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: Nome completo desconhecido. "Duquinha" é forma diminutiva, provavelmente de "Duque."\n\nPARCERIA: Listado com Escalvino (Luís Escalvino) como "Os irmãos terror." Podem ser irmãos biológicos ou associados próximos.\n\nPAPEL POLÍTICO: Listado entre os capoeiristas que trabalhavam como capangas durante a Primeira República.\n\nCAPÍTULO NO LIVRO: Compartilha capítulo com Escalvino "Os irmãos terror" em "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, artigo Sankofa USP.'
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

-- Source: entities/persons/escalvino.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Escalvino
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Known alongside Duquinha as "Os irmaos terror" (The terror brothers).
-- Also spelled "Scalvino" in some sources.
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
  'Luís Escalvino',
  'Escalvino',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://velhosmestres.com/br/destaques-9', 'https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
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
  E'Luís Escalvino, also known simply as Escalvino (sometimes spelled Scalvino), was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is featured in "Mestres e capoeiras famosos da Bahia" together with Duquinha, sharing the ominous subtitle "Os irmãos terror" (The terror brothers). This pairing suggests they were either biological brothers or such close associates that they operated as a fearsome duo in Salvador''s streets.\n\nEscalvino was noted among the protected capoeiristas of his era - practitioners who had influential patrons in Salvador''s society. This protection network was common during the First Republic, when capoeiristas often served as capangas (political henchmen) for powerful politicians and in return received a degree of protection from prosecution. The relationship was mutually beneficial: politicians gained enforcers for electoral disputes, while capoeiristas gained allies who could intervene when they faced legal trouble.\n\nThe "terror brothers" designation indicates that Escalvino and Duquinha together were particularly feared in Salvador''s underworld. Whether this reputation came from political enforcement, street fighting, or a combination of both, their joint notoriety was significant enough to earn them a shared chapter in the historical record.\n\nEscalvino was defended in court by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, gamblers, and the poor. Farias was known for his emotional appeals rather than strict legal arguments, portraying his clients as "defenseless people trusting in justice''s righteousness."\n\nUnlike some other capoeiristas from this era whose names survive only as mentions in lists, Escalvino''s inclusion with a dedicated (shared) chapter in "Mestres e capoeiras famosos da Bahia" indicates that his story was considered significant enough to preserve for future generations.',
  E'Luís Escalvino, também conhecido simplesmente como Escalvino (às vezes escrito Scalvino), foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. Ele é apresentado em "Mestres e capoeiras famosos da Bahia" junto com Duquinha, compartilhando o ominoso subtítulo "Os irmãos terror." Esse emparelhamento sugere que eram irmãos biológicos ou associados tão próximos que operavam como uma dupla temível nas ruas de Salvador.\n\nEscalvino foi notado entre os capoeiristas protegidos de sua era - praticantes que tinham padrinhos influentes na sociedade de Salvador. Esta rede de proteção era comum durante a Primeira República, quando os capoeiristas frequentemente serviam como capangas (jagunços políticos) para políticos poderosos e em troca recebiam um grau de proteção contra processos. A relação era mutuamente benéfica: os políticos ganhavam executores para disputas eleitorais, enquanto os capoeiristas ganhavam aliados que podiam intervir quando enfrentavam problemas legais.\n\nA designação "irmãos terror" indica que Escalvino e Duquinha juntos eram particularmente temidos no submundo de Salvador. Se essa reputação veio da aplicação política, brigas de rua, ou uma combinação de ambos, sua notoriedade conjunta foi significativa o suficiente para lhes render um capítulo compartilhado no registro histórico.\n\nEscalvino foi defendido em tribunal pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas, jogadores e pobres. Farias era conhecido por seus apelos emocionais ao invés de argumentos legais estritos, retratando seus clientes como "pessoas indefesas confiando na retidão da justiça."\n\nDiferente de alguns outros capoeiristas desta era cujos nomes sobrevivem apenas como menções em listas, a inclusão de Escalvino com um capítulo dedicado (compartilhado) em "Mestres e capoeiras famosos da Bahia" indica que sua história foi considerada significativa o suficiente para ser preservada para as gerações futuras.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with Duquinha under title "Os irmãos terror" (The terror brothers); noted among protected capoeiristas with influential patrons',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com Duquinha sob o título "Os irmãos terror"; notado entre os capoeiristas protegidos com padrinhos influentes',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: Full name "Luís Escalvino" per Velhos Mestres. Also spelled "Scalvino" in some sources.\n\nPARTNERSHIP: Listed with Duquinha as "Os irmãos terror" (The terror brothers). May be biological brothers or close associates.\n\nPROTECTION: Noted among protected capoeiristas with influential patrons in Salvador society.\n\nBOOK CHAPTER: Shares chapter with Duquinha "Os irmãos terror" in "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Velhos Mestres (destaques-9), Revista Capoeirando, Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: Nome completo "Luís Escalvino" conforme Velhos Mestres. Também escrito "Scalvino" em algumas fontes.\n\nPARCERIA: Listado com Duquinha como "Os irmãos terror." Podem ser irmãos biológicos ou associados próximos.\n\nPROTEÇÃO: Notado entre os capoeiristas protegidos com padrinhos influentes na sociedade de Salvador.\n\nCAPÍTULO NO LIVRO: Compartilha capítulo com Duquinha "Os irmãos terror" em "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Velhos Mestres (destaques-9), Revista Capoeirando, artigo Sankofa USP.'
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

-- Source: entities/persons/finado-manteiga.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Finado Manteiga
-- Generated: 2025-12-17
-- ============================================================
-- LAYER ZERO HISTORICAL FIGURE
-- Very limited documentation - known only through Onça Preta's
-- 1972 testimony (O Dia newspaper / velhosmestres.com)
-- ============================================================
-- DEATH YEAR ESTIMATION:
-- Killed during Pedrito persecution. Pedrito (Pedro de Azevedo
-- Gordilho) was chief of police from 1920 until his power was
-- curtailed by Governor Juracy Magalhães in the early 1930s.
-- Most persecution deaths occurred 1920-1925. Using 1925 as
-- approximate death year with 'decade' precision.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- If killed as an active capoeirista in 1920s, likely born
-- 1870-1900. Using 1890 with 'decade' precision as midpoint
-- estimate for an adult capoeirista killed circa 1920-1925.
-- ============================================================
-- APELIDO NOTE:
-- "Finado" means "deceased" in Portuguese. This prefix was likely
-- added posthumously by Onça Preta when recalling the victims,
-- meaning his apelido during life was probably just "Manteiga"
-- (meaning "butter"). Using full form as recorded in testimony.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Finado Manteiga',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-34', 'https://velhosmestres.com/br/destaques-34']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'Finado Manteiga was a capoeirista in early 20th century Salvador who was killed during the brutal persecution led by Police Chief Pedro de Azevedo Gordilho, known as "Pedrito." This persecution, which began in 1920 when Pedrito assumed command of the Bahian police cavalry, represented one of the darkest periods in capoeira history.\n\nMestre Onça Preta, who witnessed this era as a boy, recalled Finado Manteiga among the fallen in a 1972 O Dia newspaper interview: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino and many others." According to Onça Preta, Pedrito''s cavalry squad "conducted a real massacre among the old capoeira masters, not in open combat. Generally he assassinated them after capture, with the body appearing days later thrown in the woods, the back opened by knife cuts."\n\nThe prefix "Finado" (meaning "deceased" in Portuguese) was likely added posthumously by Onça Preta when recalling the fallen. His apelido during life was probably simply "Manteiga" (meaning "butter"). The use of nicknames was typical of the era when capoeiristas protected their identities, as the practice of capoeira was criminalized under the 1890 Penal Code.\n\nNo further biographical details about Finado Manteiga survive beyond this single reference in Onça Preta''s testimony, making him one of the many anonymous victims of state violence against Afro-Brazilian culture and resistance.',
  E'Finado Manteiga foi um capoeirista do início do século XX em Salvador que foi morto durante a perseguição brutal liderada pelo Chefe de Polícia Pedro de Azevedo Gordilho, conhecido como "Pedrito." Esta perseguição, que começou em 1920 quando Pedrito assumiu o comando da cavalaria da polícia baiana, representou um dos períodos mais sombrios da história da capoeira.\n\nMestre Onça Preta, que testemunhou essa era quando menino, recordou Finado Manteiga entre os que tombaram em uma entrevista ao jornal O Dia em 1972: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros." Segundo Onça Preta, o esquadrão de cavalaria de Pedrito "empreendeu verdadeiro massacre entre os velhos mestres do jogo, não em combate aberto. Em geral os assassinava após a captura, aparecendo o corpo dias depois atirado ao mato, as costas abertas de facadas."\n\nO prefixo "Finado" (significando "falecido" em português) foi provavelmente adicionado postumamente por Onça Preta ao recordar os que tombaram. Seu apelido em vida era provavelmente simplesmente "Manteiga." O uso de apelidos era típico da época em que capoeiristas protegiam suas identidades, já que a prática da capoeira era criminalizada pelo Código Penal de 1890.\n\nNenhum outro detalhe biográfico sobre Finado Manteiga sobrevive além desta única referência no testemunho de Onça Preta, tornando-o uma das muitas vítimas anônimas da violência estatal contra a cultura e resistência afro-brasileira.',
  NULL,
  NULL,
  E'LAYER ZERO FIGURE - MINIMAL DOCUMENTATION

DEATH YEAR ESTIMATION (1925, decade):
Killed during Pedrito persecution. Pedro de Azevedo Gordilho was police chief from 1920 until curtailed by Governor Juracy Magalhães in early 1930s. Most persecution deaths 1920-1925.

BIRTH YEAR ESTIMATION (1890, decade):
If killed as active adult capoeirista in 1920s (age 25-45), birth range 1875-1900. Using 1890 as midpoint.

SOLE SOURCE:
Onça Preta testimony (1972 O Dia newspaper, reproduced at velhosmestres.com). Named among "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" who were killed.

APELIDO NOTE:
"Finado" = "deceased" in Portuguese. Prefix likely added posthumously by Onça Preta. Original apelido probably just "Manteiga" (= "butter"). Origins of nickname unknown.

NO RELATIONSHIPS DOCUMENTED:
No teachers, students, or group affiliations documented. Only known through Onça Preta''s recollection of victims of Pedrito persecution.

PENDING RELATIONSHIPS:
- associated_with Mãozinha (contemporary, fellow victim)
- associated_with Besourinho (contemporary, fellow victim)
- associated_with Doze Homens (contemporary, fellow victim)
- associated_with Gasolinha (contemporary, fellow victim)',
  E'FIGURA LAYER ZERO - DOCUMENTAÇÃO MÍNIMA

ESTIMATIVA ANO DE MORTE (1925, década):
Morto durante perseguição de Pedrito. Pedro de Azevedo Gordilho foi chefe de polícia de 1920 até ser contido pelo Governador Juracy Magalhães no início dos anos 1930. Maioria das mortes por perseguição 1920-1925.

ESTIMATIVA ANO DE NASCIMENTO (1890, década):
Se morto como capoeirista adulto ativo nos anos 1920 (idade 25-45), faixa de nascimento 1875-1900. Usando 1890 como ponto médio.

FONTE ÚNICA:
Testemunho de Onça Preta (jornal O Dia 1972, reproduzido em velhosmestres.com). Citado entre "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" que foram mortos.

NOTA SOBRE O APELIDO:
"Finado" = "falecido" em português. Prefixo provavelmente adicionado postumamente por Onça Preta. Apelido original provavelmente apenas "Manteiga." Origens do apelido desconhecidas.

SEM RELACIONAMENTOS DOCUMENTADOS:
Nenhum mestre, aluno ou afiliação a grupo documentado. Conhecido apenas através da recordação de Onça Preta das vítimas da perseguição de Pedrito.

RELACIONAMENTOS PENDENTES:
- associated_with Mãozinha (contemporâneo, companheiro de vítima)
- associated_with Besourinho (contemporâneo, companheiro de vítima)
- associated_with Doze Homens (contemporâneo, companheiro de vítima)
- associated_with Gasolinha (contemporâneo, companheiro de vítima)'
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

-- Source: entities/persons/jurandir-bimba-1949.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Jurandir (Bimba student, 1949)
-- Generated: 2025-12-17
-- ============================================================
-- Uses apelido_context='Bimba 1949' to distinguish from:
-- - Mestre Jurandir Nascimento (GCAP pioneer, FICA co-founder)
-- - Mestre Jurandir Santos (son of Mestre João Grande)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  NULL,  -- Full name unknown
  'Jurandir',
  'Bimba 1949',  -- Context to distinguish from other Jurandirs
  NULL,  -- No formal title found
  NULL,  -- No historical portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Jurandir trained under Mestre Bimba in Capoeira Regional. He also practiced judo, demonstrating the cross-training that was becoming more common among Bimba''s students in response to challenges from other martial arts. His participation in the 1949 challenge shows he was considered one of Bimba''s capable fighters.',
  E'Jurandir treinou com Mestre Bimba em Capoeira Regional. Ele também praticava judô, demonstrando o treinamento cruzado que estava se tornando mais comum entre os alunos de Bimba em resposta a desafios de outras artes marciais. Sua participação no desafio de 1949 mostra que ele era considerado um dos lutadores capazes de Bimba.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Jurandir was a student of Mestre Bimba who trained in Capoeira Regional and also practiced judo. He represented Bimba''s academy in the historic 1949 capoeira challenge at Estádio Carioca in Rio de Janeiro.

In February 1949, Mestre Sinhozinho, the leading figure of capoeira carioca in Rio de Janeiro, challenged Mestre Bimba''s Capoeira Regional school. Bimba''s group, which was touring São Paulo at the time, had been claiming superiority and was eager for real fighting ("pra valer") rather than just exhibition matches. They traveled to Rio to answer the challenge.

The event was organized by the Federação Metropolitana de Pugilismo (Metropolitan Federation of Pugilism) and held over two days at the Estádio Carioca on Avenida Passos in downtown Rio. It included not only the inter-capoeira matches but also a team of catch wrestlers who had similarly challenged Bimba''s academy.

On April 2, 1949, Jurandir faced Luiz "Cirandinha" Pereira Aguiar, Sinhozinho''s student and a heavyweight weightlifter described as "Brazilian capoeira champion." The fight ended quickly: Cirandinha knocked Jurandir out in the first round with a devastating body kick. Jurandir claimed the blow was a foul, but witnesses and the ring doctor ruled otherwise, and the result stood.

The same event saw another of Bimba''s students, Fernando Rodrigues Perez, lose to Rudolf Hermanny (only 17 years old) in just two minutes, with Perez''s arm injured by a kick. The defeats were significant enough that Bimba reportedly studied movements from Sinhozinho''s fighters afterward to incorporate into his own style.

Little else is known about Jurandir''s life before or after this challenge. His participation marks him as one of Bimba''s capable fighters during a crucial period of inter-style rivalry in Brazilian capoeira history.',
  -- bio_pt
  E'Jurandir foi um aluno de Mestre Bimba que treinou Capoeira Regional e também praticava judô. Ele representou a academia de Bimba no histórico desafio de capoeira de 1949 no Estádio Carioca no Rio de Janeiro.

Em fevereiro de 1949, Mestre Sinhozinho, a principal figura da capoeira carioca no Rio de Janeiro, desafiou a escola de Capoeira Regional de Mestre Bimba. O grupo de Bimba, que estava em turnê por São Paulo na época, vinha reivindicando superioridade e estava ansioso por lutas reais ("pra valer") em vez de apenas exibições. Eles viajaram para o Rio para responder ao desafio.

O evento foi organizado pela Federação Metropolitana de Pugilismo e realizado em dois dias no Estádio Carioca na Avenida Passos, no centro do Rio. Incluiu não apenas as lutas inter-capoeira, mas também uma equipe de lutadores de catch que havia similarmente desafiado a academia de Bimba.

Em 2 de abril de 1949, Jurandir enfrentou Luiz "Cirandinha" Pereira Aguiar, aluno de Sinhozinho e halterofilista peso-pesado descrito como "campeão brasileiro de capoeira." A luta terminou rapidamente: Cirandinha nocauteou Jurandir no primeiro round com um devastador chute no corpo. Jurandir alegou que o golpe foi falta, mas testemunhas e o médico do ringue decidiram de forma contrária, e o resultado foi mantido.

O mesmo evento viu outro aluno de Bimba, Fernando Rodrigues Perez, perder para Rudolf Hermanny (apenas 17 anos) em apenas dois minutos, com o braço de Perez lesionado por um chute. As derrotas foram significativas o suficiente para que Bimba supostamente estudasse movimentos dos lutadores de Sinhozinho depois para incorporar em seu próprio estilo.

Pouco mais se sabe sobre a vida de Jurandir antes ou depois deste desafio. Sua participação o marca como um dos lutadores capazes de Bimba durante um período crucial de rivalidade inter-estilos na história da capoeira brasileira.',
  -- achievements_en
  NULL,  -- No documented achievements beyond the 1949 fight
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1920, decade precision): No birth or death dates found for Jurandir. Based on his participation as an established fighter representing Bimba''s academy in 1949, if he was 25-35 years old, birth would be approximately 1914-1934. Using 1920 as midpoint estimate with decade precision.

DEATH: Unknown. No records found.

NAME: Only "Jurandir" appears in sources. No full name documented.

DISTINCT FROM OTHER JURANDIRS:
- NOT Mestre Jurandir Nascimento (GCAP pioneer, FICA co-founder, born in Rio de Janeiro, started capoeira 1970)
- NOT Mestre Jurandir Santos (Jurandir Souza dos Santos, son of Mestre João Grande)

CROSS-TRAINING: Sources note he "also practiced judo," indicating the cross-training response to challenges from other martial arts that was becoming common among Bimba''s fighters.

1949 CHALLENGE:
- Opponent: Luiz "Cirandinha" Pereira Aguiar (Sinhozinho''s student)
- Result: Lost by KO in Round 1
- Method: Body kick
- Controversy: Jurandir claimed foul, overruled by witnesses and ring doctor

TEACHERS:
- Mestre Bimba (confirmed)

MEDIA APPEARANCES:
- April 2, 1949: Featured in newspaper A Noite coverage of the Capoeira Challenge at Estádio Carioca',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, precisão de década): Nenhuma data de nascimento ou morte encontrada para Jurandir. Com base em sua participação como lutador estabelecido representando a academia de Bimba em 1949, se ele tinha 25-35 anos, o nascimento seria aproximadamente 1914-1934. Usando 1920 como estimativa do ponto médio com precisão de década.

MORTE: Desconhecida. Nenhum registro encontrado.

NOME: Apenas "Jurandir" aparece nas fontes. Nenhum nome completo documentado.

DISTINTO DE OUTROS JURANDIRS:
- NÃO É Mestre Jurandir Nascimento (pioneiro do GCAP, co-fundador da FICA, nascido no Rio de Janeiro, começou capoeira 1970)
- NÃO É Mestre Jurandir Santos (Jurandir Souza dos Santos, filho de Mestre João Grande)

TREINAMENTO CRUZADO: Fontes notam que ele "também praticava judô," indicando a resposta de treinamento cruzado a desafios de outras artes marciais que estava se tornando comum entre os lutadores de Bimba.

DESAFIO DE 1949:
- Oponente: Luiz "Cirandinha" Pereira Aguiar (aluno de Sinhozinho)
- Resultado: Perdeu por nocaute no 1o round
- Método: Chute no corpo
- Controvérsia: Jurandir alegou falta, rejeitado por testemunhas e médico do ringue

PROFESSORES:
- Mestre Bimba (confirmado)

APARIÇÕES NA MÍDIA:
- 2 de abril de 1949: Destaque na cobertura do jornal A Noite sobre o Desafio de Capoeira no Estádio Carioca'
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

-- Source: entities/persons/maozinha.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Mãozinha
-- Generated: 2025-12-17
-- ============================================================
-- LAYER ZERO HISTORICAL FIGURE
-- Very limited documentation - known only through Onça Preta's
-- 1972 testimony (O Dia newspaper / velhosmestres.com)
-- ============================================================
-- DEATH YEAR ESTIMATION:
-- Killed during Pedrito persecution. Pedrito (Pedro de Azevedo
-- Gordilho) was chief of police from 1920 until his power was
-- curtailed by Governor Juracy Magalhães in the early 1930s.
-- Most persecution deaths occurred 1920-1925. Using 1925 as
-- approximate death year with 'decade' precision.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- If killed as an active capoeirista in 1920s, likely born
-- 1870-1900. Using 1890 with 'decade' precision as midpoint
-- estimate for an adult capoeirista killed circa 1920-1925.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Mãozinha',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-34', 'https://velhosmestres.com/br/destaques-34']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'Mãozinha was a capoeirista in early 20th century Salvador who was killed during the brutal persecution led by Police Chief Pedro de Azevedo Gordilho, known as "Pedrito." This persecution, which began in 1920 when Pedrito assumed command of the Bahian police cavalry, represented one of the darkest periods in capoeira history.\n\nMestre Onça Preta, who witnessed this era as a boy, recalled Mãozinha among the fallen in a 1972 O Dia newspaper interview: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino and many others." According to Onça Preta, Pedrito''s cavalry squad "conducted a real massacre among the old capoeira masters, not in open combat. Generally he assassinated them after capture, with the body appearing days later thrown in the woods, the back opened by knife cuts."\n\nThe apelido "Mãozinha" (meaning "little hand" in Portuguese) was typical of the era when capoeiristas used nicknames to protect their identities, as the practice of capoeira was criminalized under the 1890 Penal Code. No further biographical details about Mãozinha survive beyond this single reference in Onça Preta''s testimony, making him one of the many anonymous victims of state violence against Afro-Brazilian culture and resistance.',
  E'Mãozinha foi um capoeirista do início do século XX em Salvador que foi morto durante a perseguição brutal liderada pelo Chefe de Polícia Pedro de Azevedo Gordilho, conhecido como "Pedrito." Esta perseguição, que começou em 1920 quando Pedrito assumiu o comando da cavalaria da polícia baiana, representou um dos períodos mais sombrios da história da capoeira.\n\nMestre Onça Preta, que testemunhou essa era quando menino, recordou Mãozinha entre os que tombaram em uma entrevista ao jornal O Dia em 1972: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros." Segundo Onça Preta, o esquadrão de cavalaria de Pedrito "empreendeu verdadeiro massacre entre os velhos mestres do jogo, não em combate aberto. Em geral os assassinava após a captura, aparecendo o corpo dias depois atirado ao mato, as costas abertas de facadas."\n\nO apelido "Mãozinha" (diminutivo de "mão") era típico da época em que capoeiristas usavam apelidos para proteger suas identidades, já que a prática da capoeira era criminalizada pelo Código Penal de 1890. Nenhum outro detalhe biográfico sobre Mãozinha sobrevive além desta única referência no testemunho de Onça Preta, tornando-o uma das muitas vítimas anônimas da violência estatal contra a cultura e resistência afro-brasileira.',
  NULL,
  NULL,
  E'LAYER ZERO FIGURE - MINIMAL DOCUMENTATION

DEATH YEAR ESTIMATION (1925, decade):
Killed during Pedrito persecution. Pedro de Azevedo Gordilho was police chief from 1920 until curtailed by Governor Juracy Magalhães in early 1930s. Most persecution deaths 1920-1925.

BIRTH YEAR ESTIMATION (1890, decade):
If killed as active adult capoeirista in 1920s (age 25-45), birth range 1875-1900. Using 1890 as midpoint.

SOLE SOURCE:
Onça Preta testimony (1972 O Dia newspaper, reproduced at velhosmestres.com). Named among "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" who were killed.

APELIDO MEANING:
"Mãozinha" = "little hand" in Portuguese. Origins of nickname unknown.

NO RELATIONSHIPS DOCUMENTED:
No teachers, students, or group affiliations documented. Only known through Onça Preta''s recollection of victims of Pedrito persecution.

PENDING RELATIONSHIPS:
- associated_with Besourinho (contemporary, fellow victim)
- associated_with Doze Homens (contemporary, fellow victim)
- associated_with Gasolinha (contemporary, fellow victim)',
  E'FIGURA LAYER ZERO - DOCUMENTAÇÃO MÍNIMA

ESTIMATIVA ANO DE MORTE (1925, década):
Morto durante perseguição de Pedrito. Pedro de Azevedo Gordilho foi chefe de polícia de 1920 até ser contido pelo Governador Juracy Magalhães no início dos anos 1930. Maioria das mortes por perseguição 1920-1925.

ESTIMATIVA ANO DE NASCIMENTO (1890, década):
Se morto como capoeirista adulto ativo nos anos 1920 (idade 25-45), faixa de nascimento 1875-1900. Usando 1890 como ponto médio.

FONTE ÚNICA:
Testemunho de Onça Preta (jornal O Dia 1972, reproduzido em velhosmestres.com). Citado entre "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" que foram mortos.

SIGNIFICADO DO APELIDO:
"Mãozinha" = diminutivo de "mão". Origens do apelido desconhecidas.

SEM RELACIONAMENTOS DOCUMENTADOS:
Nenhum mestre, aluno ou afiliação a grupo documentado. Conhecido apenas através da recordação de Onça Preta das vítimas da perseguição de Pedrito.

RELACIONAMENTOS PENDENTES:
- associated_with Besourinho (contemporâneo, companheiro de vítima)
- associated_with Doze Homens (contemporâneo, companheiro de vítima)
- associated_with Gasolinha (contemporâneo, companheiro de vítima)'
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

-- Source: entities/persons/nage-pedrito-victim.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Nagé (Pedrito victim)
-- Generated: 2025-12-17
-- ============================================================
-- LAYER ZERO HISTORICAL FIGURE
-- Very limited documentation - known only through Onça Preta's
-- 1972 testimony (O Dia newspaper / velhosmestres.com)
-- ============================================================
-- CRITICAL IDENTITY NOTE:
-- This is a DISTINCT person from Mestre Nagé (José Anastácio de
-- Santana, ~1923-1958), who was born AFTER the Pedrito persecution
-- ended. Mestre Nagé was photographed by Pierre Verger (1948),
-- appeared in 1954 film "Vadiação", and was subject of Frede
-- Abreu's 2017 book. Using apelido_context to distinguish.
-- ============================================================
-- DEATH YEAR ESTIMATION:
-- Killed during Pedrito persecution. Pedrito (Pedro de Azevedo
-- Gordilho) was chief of police from 1920 until his power was
-- curtailed by Governor Juracy Magalhães in the early 1930s.
-- Most persecution deaths occurred 1920-1925. Using 1925 as
-- approximate death year with 'decade' precision.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- If killed as an active capoeirista in 1920s, likely born
-- 1870-1900. Using 1890 with 'decade' precision as midpoint
-- estimate for an adult capoeirista killed circa 1920-1925.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Nagé',
  'Pedrito victim',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-34', 'https://velhosmestres.com/br/destaques-34']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'Nagé was a capoeirista in early 20th century Salvador who was killed during the brutal persecution led by Police Chief Pedro de Azevedo Gordilho, known as "Pedrito." This persecution, which began in 1920 when Pedrito assumed command of the Bahian police cavalry, represented one of the darkest periods in capoeira history.\n\nNote: This individual is DISTINCT from Mestre Nagé (José Anastácio de Santana, ~1923-1958), who was born after the Pedrito persecution ended and became a notable figure photographed by Pierre Verger and documented in Frede Abreu''s 2017 book "Nagé, o homem que lutou capoeira até morrer." The sharing of apelidos was common in capoeira.\n\nMestre Onça Preta, who witnessed this era as a boy, recalled this Nagé among the fallen in a 1972 O Dia newspaper interview: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino and many others." According to Onça Preta, Pedrito''s cavalry squad "conducted a real massacre among the old capoeira masters, not in open combat. Generally he assassinated them after capture, with the body appearing days later thrown in the woods, the back opened by knife cuts."\n\nNo further biographical details about this Nagé survive beyond this single reference in Onça Preta''s testimony, making him one of the many anonymous victims of state violence against Afro-Brazilian culture and resistance.',
  E'Nagé foi um capoeirista do início do século XX em Salvador que foi morto durante a perseguição brutal liderada pelo Chefe de Polícia Pedro de Azevedo Gordilho, conhecido como "Pedrito." Esta perseguição, que começou em 1920 quando Pedrito assumiu o comando da cavalaria da polícia baiana, representou um dos períodos mais sombrios da história da capoeira.\n\nNota: Este indivíduo é DISTINTO de Mestre Nagé (José Anastácio de Santana, ~1923-1958), que nasceu após o fim da perseguição de Pedrito e tornou-se uma figura notável fotografada por Pierre Verger e documentada no livro de Frede Abreu de 2017 "Nagé, o homem que lutou capoeira até morrer." O compartilhamento de apelidos era comum na capoeira.\n\nMestre Onça Preta, que testemunhou essa era quando menino, recordou este Nagé entre os que tombaram em uma entrevista ao jornal O Dia em 1972: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros." Segundo Onça Preta, o esquadrão de cavalaria de Pedrito "empreendeu verdadeiro massacre entre os velhos mestres do jogo, não em combate aberto. Em geral os assassinava após a captura, aparecendo o corpo dias depois atirado ao mato, as costas abertas de facadas."\n\nNenhum outro detalhe biográfico sobre este Nagé sobrevive além desta única referência no testemunho de Onça Preta, tornando-o uma das muitas vítimas anônimas da violência estatal contra a cultura e resistência afro-brasileira.',
  NULL,
  NULL,
  E'LAYER ZERO FIGURE - MINIMAL DOCUMENTATION

CRITICAL IDENTITY DISTINCTION:
This is a DISTINCT person from Mestre Nagé (José Anastácio de Santana, ~1923-1958). That Nagé:
- Born ~1923 in Coqueiros de Paraguaçu (AFTER Pedrito persecution)
- Died 1958 (stabbed in fight over berimbau)
- Photographed by Pierre Verger (1948) and Marcel Gautherot (1954)
- Appeared in 1954 film "Vadiação"
- Subject of Frede Abreu''s 2017 book "Nagé, o homem que lutou capoeira até morrer"
Using apelido_context "Pedrito victim" to distinguish.

DEATH YEAR ESTIMATION (1925, decade):
Killed during Pedrito persecution. Pedro de Azevedo Gordilho was police chief from 1920 until curtailed by Governor Juracy Magalhães in early 1930s. Most persecution deaths 1920-1925.

BIRTH YEAR ESTIMATION (1890, decade):
If killed as active adult capoeirista in 1920s (age 25-45), birth range 1875-1900. Using 1890 as midpoint.

SOLE SOURCE:
Onça Preta testimony (1972 O Dia newspaper, reproduced at velhosmestres.com). Named among "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" who were killed.

NO RELATIONSHIPS DOCUMENTED:
No teachers, students, or group affiliations documented. Only known through Onça Preta''s recollection of victims of Pedrito persecution.

PENDING RELATIONSHIPS:
- associated_with Mãozinha (contemporary, fellow victim)
- associated_with Besourinho (contemporary, fellow victim)
- associated_with Finado Manteiga (contemporary, fellow victim)
- associated_with Gasolinha (contemporary, fellow victim)',
  E'FIGURA LAYER ZERO - DOCUMENTAÇÃO MÍNIMA

DISTINÇÃO CRÍTICA DE IDENTIDADE:
Esta é uma pessoa DISTINTA de Mestre Nagé (José Anastácio de Santana, ~1923-1958). Aquele Nagé:
- Nascido ~1923 em Coqueiros de Paraguaçu (APÓS a perseguição de Pedrito)
- Morreu em 1958 (esfaqueado em briga por berimbau)
- Fotografado por Pierre Verger (1948) e Marcel Gautherot (1954)
- Apareceu no filme "Vadiação" de 1954
- Tema do livro de Frede Abreu de 2017 "Nagé, o homem que lutou capoeira até morrer"
Usando apelido_context "Pedrito victim" para distinguir.

ESTIMATIVA ANO DE MORTE (1925, década):
Morto durante perseguição de Pedrito. Pedro de Azevedo Gordilho foi chefe de polícia de 1920 até ser contido pelo Governador Juracy Magalhães no início dos anos 1930. Maioria das mortes por perseguição 1920-1925.

ESTIMATIVA ANO DE NASCIMENTO (1890, década):
Se morto como capoeirista adulto ativo nos anos 1920 (idade 25-45), faixa de nascimento 1875-1900. Usando 1890 como ponto médio.

FONTE ÚNICA:
Testemunho de Onça Preta (jornal O Dia 1972, reproduzido em velhosmestres.com). Citado entre "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" que foram mortos.

SEM RELACIONAMENTOS DOCUMENTADOS:
Nenhum mestre, aluno ou afiliação a grupo documentado. Conhecido apenas através da recordação de Onça Preta das vítimas da perseguição de Pedrito.

RELACIONAMENTOS PENDENTES:
- associated_with Mãozinha (contemporâneo, companheiro de vítima)
- associated_with Besourinho (contemporâneo, companheiro de vítima)
- associated_with Finado Manteiga (contemporâneo, companheiro de vítima)
- associated_with Gasolinha (contemporâneo, companheiro de vítima)'
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

-- Source: entities/persons/nozinho-da-cocheira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Nozinho da Cocheira
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Known as "Valente trabalhador" (Brave worker).
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
  NULL,
  'Nozinho da Cocheira',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
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
  E'Nozinho da Cocheira was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is featured in "Mestres e capoeiras famosos da Bahia" with the subtitle "Valente trabalhador" (Brave worker), which distinguishes him among his contemporaries as someone known for both his courage and his work ethic.\n\nThe nickname "da Cocheira" (of the stable/coach house) likely refers to his workplace or neighborhood. In early 20th century Salvador, many capoeiristas were identified by their occupations or the areas where they lived and worked. A cocheira was a place where horses and carriages were kept, and working there would have required physical strength and offered proximity to the transportation networks that were vital to Salvador''s economy.\n\nUnlike some of his contemporaries who were known primarily as political capangas (henchmen) or street fighters, Nozinho da Cocheira''s epithet emphasizes his identity as a worker who also happened to be brave - suggesting a more positive characterization that combined capoeira skill with honest labor.\n\nNozinho was defended in court by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, gamblers, and the poor. Farias was known for his emotional appeals rather than strict legal arguments, portraying his clients as "defenseless people trusting in justice''s righteousness."\n\nHis dedicated chapter in "Mestres e capoeiras famosos da Bahia" indicates that the historians who documented Salvador''s capoeira heritage considered his story significant enough to preserve. The "valente trabalhador" subtitle suggests a man who earned respect through both his physical prowess and his dedication to work.',
  E'Nozinho da Cocheira foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. Ele é apresentado em "Mestres e capoeiras famosos da Bahia" com o subtítulo "Valente trabalhador," que o distingue entre seus contemporâneos como alguém conhecido tanto por sua coragem quanto por sua ética de trabalho.\n\nO apelido "da Cocheira" provavelmente refere-se ao seu local de trabalho ou bairro. No início do século XX em Salvador, muitos capoeiristas eram identificados por suas ocupações ou pelas áreas onde viviam e trabalhavam. Uma cocheira era um lugar onde cavalos e carruagens eram mantidos, e trabalhar lá teria exigido força física e oferecido proximidade com as redes de transporte que eram vitais para a economia de Salvador.\n\nDiferente de alguns de seus contemporâneos que eram conhecidos principalmente como capangas políticos ou brigadores de rua, o epíteto de Nozinho da Cocheira enfatiza sua identidade como um trabalhador que também era corajoso - sugerindo uma caracterização mais positiva que combinava habilidade na capoeira com trabalho honesto.\n\nNozinho foi defendido em tribunal pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas, jogadores e pobres. Farias era conhecido por seus apelos emocionais ao invés de argumentos legais estritos, retratando seus clientes como "pessoas indefesas confiando na retidão da justiça."\n\nSeu capítulo dedicado em "Mestres e capoeiras famosos da Bahia" indica que os historiadores que documentaram o patrimônio capoeirista de Salvador consideraram sua história significativa o suficiente para ser preservada. O subtítulo "valente trabalhador" sugere um homem que ganhou respeito tanto por sua destreza física quanto por sua dedicação ao trabalho.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with dedicated chapter "Valente trabalhador" (Brave worker); distinguished among contemporaries for combining bravery with honest work',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com capítulo dedicado "Valente trabalhador"; distinguido entre contemporâneos por combinar coragem com trabalho honesto',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: Full name unknown. "da Cocheira" (of the stable/coach house) likely refers to workplace.\n\nCHARACTERIZATION: Subtitle "Valente trabalhador" distinguishes him from contemporaries known primarily as capangas - emphasizes honest labor combined with bravery.\n\nBOOK CHAPTER: Has dedicated chapter "Valente trabalhador" in "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: Nome completo desconhecido. "da Cocheira" provavelmente refere-se ao local de trabalho.\n\nCARACTERIZAÇÃO: Subtítulo "Valente trabalhador" o distingue de contemporâneos conhecidos principalmente como capangas - enfatiza trabalho honesto combinado com coragem.\n\nCAPÍTULO NO LIVRO: Tem capítulo dedicado "Valente trabalhador" em "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, artigo Sankofa USP.'
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

-- Source: entities/persons/paulo-cesar-de-moura.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Paulo César de Moura
-- Generated: 2025-12-17
-- ============================================================
-- LAYER ZERO HISTORICAL FIGURE
-- Very limited documentation - known only through Onça Preta's
-- 1972 testimony (O Dia newspaper / velhosmestres.com)
-- ============================================================
-- DEATH YEAR ESTIMATION:
-- Killed during Pedrito persecution. Pedrito (Pedro de Azevedo
-- Gordilho) was chief of police from 1920 until his power was
-- curtailed by Governor Juracy Magalhães in the early 1930s.
-- Most persecution deaths occurred 1920-1925. Using 1925 as
-- approximate death year with 'decade' precision.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- If killed as an active capoeirista in 1920s, likely born
-- 1870-1900. Using 1890 with 'decade' precision as midpoint
-- estimate for an adult capoeirista killed circa 1920-1925.
-- ============================================================
-- NAME NOTE:
-- Unlike most persecution victims who are known only by apelidos,
-- Paulo César de Moura appears to be a full name (first name +
-- middle name + surname). This is unusual and may indicate he was
-- of higher social standing or that his full name was particularly
-- memorable to Onça Preta.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Paulo César de Moura',
  'Paulo César de Moura',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-34', 'https://velhosmestres.com/br/destaques-34']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'Paulo César de Moura was a capoeirista in early 20th century Salvador who was killed during the brutal persecution led by Police Chief Pedro de Azevedo Gordilho, known as "Pedrito." This persecution, which began in 1920 when Pedrito assumed command of the Bahian police cavalry, represented one of the darkest periods in capoeira history.\n\nUnlike most persecution victims who are remembered only by apelidos (nicknames), Paulo César de Moura is recorded with what appears to be his full name, suggesting he may have been of higher social standing or that his identity was particularly memorable to those who survived the era.\n\nMestre Onça Preta, who witnessed this era as a boy, recalled Paulo César de Moura among the fallen in a 1972 O Dia newspaper interview: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino and many others." According to Onça Preta, Pedrito''s cavalry squad "conducted a real massacre among the old capoeira masters, not in open combat. Generally he assassinated them after capture, with the body appearing days later thrown in the woods, the back opened by knife cuts."\n\nNo further biographical details about Paulo César de Moura survive beyond this single reference in Onça Preta''s testimony, making him one of the many victims of state violence against Afro-Brazilian culture and resistance.',
  E'Paulo César de Moura foi um capoeirista do início do século XX em Salvador que foi morto durante a perseguição brutal liderada pelo Chefe de Polícia Pedro de Azevedo Gordilho, conhecido como "Pedrito." Esta perseguição, que começou em 1920 quando Pedrito assumiu o comando da cavalaria da polícia baiana, representou um dos períodos mais sombrios da história da capoeira.\n\nAo contrário da maioria das vítimas da perseguição que são lembradas apenas por apelidos, Paulo César de Moura é registrado com o que parece ser seu nome completo, sugerindo que ele pode ter sido de posição social mais elevada ou que sua identidade era particularmente memorável para aqueles que sobreviveram à era.\n\nMestre Onça Preta, que testemunhou essa era quando menino, recordou Paulo César de Moura entre os que tombaram em uma entrevista ao jornal O Dia em 1972: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros." Segundo Onça Preta, o esquadrão de cavalaria de Pedrito "empreendeu verdadeiro massacre entre os velhos mestres do jogo, não em combate aberto. Em geral os assassinava após a captura, aparecendo o corpo dias depois atirado ao mato, as costas abertas de facadas."\n\nNenhum outro detalhe biográfico sobre Paulo César de Moura sobrevive além desta única referência no testemunho de Onça Preta, tornando-o uma das muitas vítimas da violência estatal contra a cultura e resistência afro-brasileira.',
  NULL,
  NULL,
  E'LAYER ZERO FIGURE - MINIMAL DOCUMENTATION

DEATH YEAR ESTIMATION (1925, decade):
Killed during Pedrito persecution. Pedro de Azevedo Gordilho was police chief from 1920 until curtailed by Governor Juracy Magalhães in early 1930s. Most persecution deaths 1920-1925.

BIRTH YEAR ESTIMATION (1890, decade):
If killed as active adult capoeirista in 1920s (age 25-45), birth range 1875-1900. Using 1890 as midpoint.

SOLE SOURCE:
Onça Preta testimony (1972 O Dia newspaper, reproduced at velhosmestres.com). Named among "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" who were killed.

NAME NOTE:
Unlike most persecution victims known only by apelidos, "Paulo César de Moura" appears to be a full name (first + middle + surname). This is unusual and may indicate higher social standing or that his full identity was particularly memorable to survivors. Using full name in both name and apelido fields since no separate apelido is recorded.

NO RELATIONSHIPS DOCUMENTED:
No teachers, students, or group affiliations documented. Only known through Onça Preta''s recollection of victims of Pedrito persecution.

PENDING RELATIONSHIPS:
- associated_with Mãozinha (contemporary, fellow victim)
- associated_with Besourinho (contemporary, fellow victim)
- associated_with Finado Manteiga (contemporary, fellow victim)
- associated_with Gasolinha (contemporary, fellow victim)',
  E'FIGURA LAYER ZERO - DOCUMENTAÇÃO MÍNIMA

ESTIMATIVA ANO DE MORTE (1925, década):
Morto durante perseguição de Pedrito. Pedro de Azevedo Gordilho foi chefe de polícia de 1920 até ser contido pelo Governador Juracy Magalhães no início dos anos 1930. Maioria das mortes por perseguição 1920-1925.

ESTIMATIVA ANO DE NASCIMENTO (1890, década):
Se morto como capoeirista adulto ativo nos anos 1920 (idade 25-45), faixa de nascimento 1875-1900. Usando 1890 como ponto médio.

FONTE ÚNICA:
Testemunho de Onça Preta (jornal O Dia 1972, reproduzido em velhosmestres.com). Citado entre "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" que foram mortos.

NOTA SOBRE O NOME:
Diferente da maioria das vítimas da perseguição conhecidas apenas por apelidos, "Paulo César de Moura" parece ser um nome completo (primeiro + meio + sobrenome). Isso é incomum e pode indicar posição social mais elevada ou que sua identidade completa era particularmente memorável para os sobreviventes. Usando nome completo em ambos os campos name e apelido já que nenhum apelido separado é registrado.

SEM RELACIONAMENTOS DOCUMENTADOS:
Nenhum mestre, aluno ou afiliação a grupo documentado. Conhecido apenas através da recordação de Onça Preta das vítimas da perseguição de Pedrito.

RELACIONAMENTOS PENDENTES:
- associated_with Mãozinha (contemporâneo, companheiro de vítima)
- associated_with Besourinho (contemporâneo, companheiro de vítima)
- associated_with Finado Manteiga (contemporâneo, companheiro de vítima)
- associated_with Gasolinha (contemporâneo, companheiro de vítima)'
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

-- Source: entities/persons/pedro-porreta.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Pedro Porreta
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890 based on active period 1920s-1930s.
-- If 30-40 years old during documented incidents (1920-1931), birth ~1880-1901.
-- Using 1890 as midpoint estimate with decade precision.
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
  'Pedro Celestino dos Santos',
  'Pedro Porreta',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://www.mapadacapoeira.com.br/descricaoPontos.aspx?fk_ponto=8']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s-1930s). Known for using razors in street fights, a common weapon among capoeiristas of this period. Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s-1930s). Conhecido por usar navalhas em brigas de rua, uma arma comum entre os capoeiristas deste período. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  1930,
  'approximate'::genealogy.date_precision,
  'Salvador, Brazil',
  -- Extended content (bilingual)
  E'Pedro Celestino dos Santos, known as Pedro Porreta, was one of the most notorious capoeiristas of early 20th century Salvador, Bahia. He was a fish seller at the Mercado de Santa Bárbara in the Pilar District, a famous meeting place for capoeira practitioners.\n\nPorreta dominated the Baixa dos Sapateiros area (nicknamed "Baixinha"), functioning as a local authority figure who "maintained order and disorder" in the region. He lived on Rua do Tijolo and had support from allied politicians and police. His brother, Pedro de Alcântara, known as "Piroca," often accompanied him in street confrontations. The book "Mestres e capoeiras famosos da Bahia" features them together with the subtitle "Os donos do quarteirão" (The owners of the block).\n\nHis first documented conflict appears in a December 14, 1920 A Tarde newspaper report. In the Taboão area, José Batista da Cruz, nicknamed "Guruxinha," was attacked with razor cuts by Pedro Porreta, assisted by his brother Piroca. The victim later died from his injuries.\n\nPorreta''s reputation extended to Salvador''s prostitution zones, where documents identify him as a cafetão (pimp). His companion Josepha Alves de Araújo stated that "the offender is known as a troublemaker and has been arrested several times by police."\n\nIn 1931, he was accused of assaulting Josepha Alves de Araújo. He was defended by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, and the poor. Farias argued that Porreta "was in a state of complete mental disturbance," and he was acquitted.\n\nOne of the most emblematic cases of his life occurred on September 28, 1929. Pedro Porreta invaded the room of Francisca Albino dos Santos, known as Chicão, a formidable valentona (tough woman) and prostitute known to police. Porreta was searching for intimate clothing belonging to one of his companions. Feeling violated, Chicão struck him with precise blows that resulted in several injuries. The newspapers reported the "valente Porreta" arriving at the police station badly beaten.\n\nSome time after this confrontation, Pedro Porreta was assassinated, and Chicão was the main suspect.',
  E'Pedro Celestino dos Santos, conhecido como Pedro Porreta, foi um dos capoeiristas mais notórios do início do século XX em Salvador, Bahia. Era vendedor de peixe no Mercado de Santa Bárbara, no Distrito do Pilar, famoso local de encontro dos praticantes de capoeira.\n\nPorreta dominava a área da Baixa dos Sapateiros (apelidada de "Baixinha"), funcionando como uma figura de autoridade local que "mantinha a ordem e a desordem" na região. Morava na Rua do Tijolo e tinha apoio de políticos aliados e policiais. Seu irmão, Pedro de Alcântara, conhecido como "Piroca," frequentemente o acompanhava em confrontos de rua. O livro "Mestres e capoeiras famosos da Bahia" os apresenta juntos com o subtítulo "Os donos do quarteirão."\n\nSeu primeiro conflito documentado aparece em uma reportagem do jornal A Tarde de 14 de dezembro de 1920. Na área do Taboão, José Batista da Cruz, apelidado "Guruxinha," foi atacado com cortes de navalha por Pedro Porreta, auxiliado por seu irmão Piroca. A vítima faleceu posteriormente devido aos ferimentos.\n\nA reputação de Porreta estendia-se às zonas de prostituição de Salvador, onde documentos o identificam como cafetão. Sua companheira Josepha Alves de Araújo afirmou que "o ofensor é conhecido como desordeiro e tem sido preso diversas vezes pela polícia."\n\nEm 1931, ele foi acusado de agredir Josepha Alves de Araújo. Foi defendido pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas e pobres. Farias argumentou que Porreta "estava em estado de completa perturbação mental," e ele foi absolvido.\n\nUm dos casos mais emblemáticos de sua vida ocorreu em 28 de setembro de 1929. Pedro Porreta invadiu o quarto de Francisca Albino dos Santos, conhecida como Chicão, uma formidável valentona e prostituta conhecida da polícia. Porreta procurava roupas íntimas pertencentes a uma de suas companheiras. Sentindo-se violada, Chicão desferiu-lhe golpes certeiros que resultaram em várias lesões. Os jornais noticiaram o "valente Porreta" chegando muito machucado na delegacia.\n\nAlgum tempo depois desse confronto, Pedro Porreta foi assassinado, e Chicão foi a principal suspeita.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with subtitle "Os donos do quarteirão" (The owners of the block); documented in multiple court cases and newspaper reports from the 1920s-1930s',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com subtítulo "Os donos do quarteirão"; documentado em múltiplos processos judiciais e reportagens de jornais dos anos 1920-1930',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Active period documented 1920-1931. If 30-40 years old during incidents, birth = ~1880-1901. Using 1890 as midpoint.\n\nDEATH: Assassinated "some time after" September 1929 confrontation with Chicão (Francisca Albino dos Santos). Chicão was main suspect. Exact date unknown.\n\nNAME: Full name Pedro Celestino dos Santos documented in sources.\n\nBROTHER: Piroca (Pedro de Alcântara) - frequent companion in street confrontations.\n\nOCCUPATION: Fish seller at Mercado de Santa Bárbara, Pilar District. Also identified as cafetão (pimp) in prostitution zones.\n\nRESIDENCE: Rua do Tijolo, Salvador.\n\nTERRITORY: Dominated Baixa dos Sapateiros ("Baixinha") area.\n\nLEGAL RECORDS:\n- Dec 14, 1920: Attacked Guruxinha with razors (victim died)\n- Sept 28, 1929: Defeated by Chicão\n- 1931: Assault on Josepha Alves de Araújo; defended by Cosme de Farias; acquitted\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Mapa da Capoeira, Revista Capoeirando, Sankofa USP article, A Tarde newspaper.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Período de atividade documentado 1920-1931. Se tinha 30-40 anos durante os incidentes, nascimento = ~1880-1901. Usando 1890 como ponto médio.\n\nMORTE: Assassinado "algum tempo depois" do confronto de setembro de 1929 com Chicão (Francisca Albino dos Santos). Chicão foi a principal suspeita. Data exata desconhecida.\n\nNOME: Nome completo Pedro Celestino dos Santos documentado nas fontes.\n\nIRMÃO: Piroca (Pedro de Alcântara) - companheiro frequente em confrontos de rua.\n\nOCUPAÇÃO: Vendedor de peixe no Mercado de Santa Bárbara, Distrito do Pilar. Também identificado como cafetão nas zonas de prostituição.\n\nRESIDÊNCIA: Rua do Tijolo, Salvador.\n\nTERRITÓRIO: Dominava a área da Baixa dos Sapateiros ("Baixinha").\n\nREGISTROS LEGAIS:\n- 14 dez 1920: Atacou Guruxinha com navalhas (vítima morreu)\n- 28 set 1929: Derrotado por Chicão\n- 1931: Agressão a Josepha Alves de Araújo; defendido por Cosme de Farias; absolvido\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Mapa da Capoeira, Revista Capoeirando, artigo Sankofa USP, jornal A Tarde.'
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

-- Source: entities/persons/samuel-da-calcada.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Samuel da Calcada
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Known as "O capadocio da politica" (The political rogue).
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
  NULL,
  'Samuel da Calçada',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
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
  E'Samuel da Calçada was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is featured in "Mestres e capoeiras famosos da Bahia" with the revealing subtitle "O capadócio da política" (The political rogue/bully), which speaks to his role in the intersection of capoeira and politics during the First Republic.\n\nThe term "capadócio" in early 20th century Brazil referred to a street tough, bully, or rogue - someone who lived by their wits and physical prowess on the margins of society. Samuel da Calçada was among the capoeiristas who worked as capangas (political henchmen) for powerful Bahian politicians. These enforcers provided muscle during electoral disputes and served the interests of figures like former governors Joaquim José de Seabra (1855-1942) and Antônio Moniz (1881-1940).\n\nThe nickname "da Calçada" (of the sidewalk/street) likely refers to his territory or origins in Salvador''s street culture. This was a common naming convention among capoeiristas of the era, who were often identified by their neighborhoods, workplaces, or physical characteristics.\n\nSamuel da Calçada was defended in court by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, gamblers, and the poor. Farias was known for his emotional appeals rather than strict legal arguments, portraying his clients as "defenseless people trusting in justice''s righteousness."\n\nHis inclusion in "Mestres e capoeiras famosos da Bahia" with a dedicated chapter indicates he was a significant figure in Salvador''s capoeira community, someone whose story was considered important enough to preserve for future generations.',
  E'Samuel da Calçada foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. Ele é apresentado em "Mestres e capoeiras famosos da Bahia" com o revelador subtítulo "O capadócio da política," que fala sobre seu papel na interseção entre capoeira e política durante a Primeira República.\n\nO termo "capadócio" no Brasil do início do século XX referia-se a um valentão de rua, brigão ou malandro - alguém que vivia de sua esperteza e destreza física nas margens da sociedade. Samuel da Calçada estava entre os capoeiristas que trabalhavam como capangas (jagunços políticos) para poderosos políticos baianos. Esses executores forneciam a força durante disputas eleitorais e serviam aos interesses de figuras como os ex-governadores Joaquim José de Seabra (1855-1942) e Antônio Moniz (1881-1940).\n\nO apelido "da Calçada" provavelmente refere-se ao seu território ou origens na cultura de rua de Salvador. Esta era uma convenção comum de nomeação entre os capoeiristas da época, que eram frequentemente identificados por seus bairros, locais de trabalho ou características físicas.\n\nSamuel da Calçada foi defendido em tribunal pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas, jogadores e pobres. Farias era conhecido por seus apelos emocionais ao invés de argumentos legais estritos, retratando seus clientes como "pessoas indefesas confiando na retidão da justiça."\n\nSua inclusão em "Mestres e capoeiras famosos da Bahia" com um capítulo dedicado indica que ele foi uma figura significativa na comunidade capoeirista de Salvador, alguém cuja história foi considerada importante o suficiente para ser preservada para as gerações futuras.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with dedicated chapter "O capadócio da política" (The political rogue); documented role in political networks of First Republic Bahia',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com capítulo dedicado "O capadócio da política"; papel documentado nas redes políticas da Bahia da Primeira República',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: Full name unknown. "da Calçada" (of the sidewalk/street) likely refers to territory or street culture origins.\n\nPOLITICAL ROLE: Listed among capoeiristas who worked as capangas for governors Seabra and Antônio Moniz.\n\nBOOK CHAPTER: Has dedicated chapter "O capadócio da política" in "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: Nome completo desconhecido. "da Calçada" provavelmente refere-se ao território ou origens na cultura de rua.\n\nPAPEL POLÍTICO: Listado entre os capoeiristas que trabalhavam como capangas dos governadores Seabra e Antônio Moniz.\n\nCAPÍTULO NO LIVRO: Tem capítulo dedicado "O capadócio da política" em "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, artigo Sankofa USP.'
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

-- Source: entities/persons/ze-bom-pe.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zé Bom Pé
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Listed by Pastinha in 1967 as already deceased among practitioners
-- of "pure Capoeira de Angola." The other figures on this list were
-- active in the early-to-mid 20th century, suggesting Zé Bom Pé was
-- likely born around 1880-1910. Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Confirmed dead by Pastinha's 1967 interview. As a contemporary of
-- the other angoleiros on the list (most active 1900s-1940s),
-- likely died in the 1950s-1960s. Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Zé Bom Pé', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Zé Bom Pé among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview, distinguishing these figures from the modernized Regional style.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Zé Bom Pé entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967, distinguindo essas figuras do estilo Regional modernizado.',
  1900, -- birth_year: estimated from context (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given association with Pastinha's circles
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Zé Bom Pé was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. His name appears in one of the most important primary sources in capoeira history: Mestre Pastinha''s 1967 interview with Revista Realidade magazine.\n\nIn February 1967, the 78-year-old Pastinha—nearly blind but still teaching at his academy in Pelourinho—spoke with journalist Roberto Freire about the great capoeiristas of the past. Pastinha listed Zé Bom Pé among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, and two women: Júlia Fogareira and Maria Homem.\n\nPastinha remarked of these figures: "They are already dead. Each of them has history." He observed that their apelidos revealed "who they were, how they fought"—suggesting these nicknames encoded information about their fighting styles, personalities, or physical characteristics.\n\nBeyond this mention, no other documentation of Zé Bom Pé has been found. He represents one of the many capoeiristas whose contributions to the art have been largely lost to history, remembered only through the oral testimony of those who knew them.',
  -- bio_pt
  E'Zé Bom Pé foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Seu nome aparece em uma das mais importantes fontes primárias da história da capoeira: a entrevista de Mestre Pastinha à Revista Realidade em 1967.\n\nEm fevereiro de 1967, Pastinha, então com 78 anos—quase cego mas ainda ensinando em sua academia no Pelourinho—conversou com o jornalista Roberto Freire sobre os grandes capoeiristas do passado. Pastinha listou Zé Bom Pé entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, e duas mulheres: Júlia Fogareira e Maria Homem.\n\nPastinha comentou sobre essas figuras: "Já morreram. Cada um deles tem história." Ele observou que seus apelidos revelavam "quem eles eram, como lutavam"—sugerindo que esses apelidos codificavam informações sobre seus estilos de luta, personalidades ou características físicas.\n\nAlém dessa menção, nenhuma outra documentação sobre Zé Bom Pé foi encontrada. Ele representa um dos muitos capoeiristas cujas contribuições para a arte foram amplamente perdidas na história, lembrados apenas através do testemunho oral daqueles que os conheceram.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nListed by Pastinha in 1967 as already deceased among practitioners of "pure Capoeira de Angola." The other figures on this list were active in the early-to-mid 20th century, suggesting Zé Bom Pé was likely born around 1880-1910.\n\nDEATH YEAR ESTIMATION (1960, decade):\nConfirmed dead by Pastinha''s 1967 interview. As a contemporary of the other angoleiros on the list (most active 1900s-1940s), likely died in the 1950s-1960s.\n\nAPELIDO:\n"Bom Pé" translates to "Good Foot" in Portuguese. Pastinha noted that these old angoleiros'' apelidos revealed "who they were, how they fought," suggesting the nickname may reference strong kicking ability or footwork.\n\nSOURCE:\nRevista Realidade, February 1967, "É Luta, É Dança, É Capoeira" by Roberto Freire (photos by David Drew Zingg). This is a single-source profile; no additional documentation found.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nNOT LISTED IN 1976 SOURCE:\nNotably, a 1976 source (velhosmestres.com/br/pastinha-1976) reproduces a similar list of "angoleiros de briga" but substitutes Besouro for Zé Bom Pé and omits some names. The 1967 source is considered primary.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nListado por Pastinha em 1967 como já falecido entre praticantes de "capoeira de Angola pura." As outras figuras dessa lista estavam ativas no início e meados do século XX, sugerindo que Zé Bom Pé provavelmente nasceu por volta de 1880-1910.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Como contemporâneo dos outros angoleiros da lista (maioria ativos nos anos 1900-1940), provavelmente morreu nos anos 1950-1960.\n\nAPELIDO:\n"Bom Pé" significa literalmente "Bom Pé" em português. Pastinha observou que os apelidos desses velhos angoleiros revelavam "quem eles eram, como lutavam," sugerindo que o apelido pode fazer referência a forte habilidade de chute ou jogo de pés.\n\nFONTE:\nRevista Realidade, fevereiro de 1967, "É Luta, É Dança, É Capoeira" por Roberto Freire (fotos de David Drew Zingg). Este é um perfil de fonte única; nenhuma documentação adicional encontrada.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nNÃO LISTADO NA FONTE DE 1976:\nNotavelmente, uma fonte de 1976 (velhosmestres.com/br/pastinha-1976) reproduz uma lista similar de "angoleiros de briga" mas substitui Besouro por Zé Bom Pé e omite alguns nomes. A fonte de 1967 é considerada primária.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- ============================================================
-- PHASE 2: UPSERT STATEMENTS
-- ============================================================

-- Source: statements/persons/americo-ciencia.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Américo Ciência
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Américo Ciência is the SUBJECT.
-- ============================================================

-- Américo Ciência associated_with Gengibirra (pre-CECA Liberdade roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  NULL, NULL, -- started_at unknown; active in 1936-1941 based on sources
  '1941-02-23'::date, 'exact'::genealogy.date_precision, -- ended when Pastinha took over
  '{"association_context": {"en": "Member of the informal capoeira angola gathering at Liberdade that preceded CECA", "pt": "Membro da reunião informal de capoeira angola na Liberdade que antecedeu o CECA"}}'::jsonb,
  'likely'::genealogy.confidence,
  'A Tarde newspaper, February 24, 1969 (reproduced at velhosmestres.com/en/pastinha-1969-3)',
  'Listed among mestres at the Liberdade/Gengibirra roda alongside Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique. Note: NOT among the 22 founding mestres of Gengibirra per Noronha''s manuscripts - suggesting he was a regular participant but not an organizational founder.',
  'Listado entre os mestres na roda da Liberdade/Gengibirra junto com Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique. Nota: NÃO entre os 22 mestres fundadores do Gengibirra conforme manuscritos de Noronha - sugerindo que era um participante regular mas não um fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Américo Ciência' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or relationship direction reversed)
-- ============================================================
-- NOTE: Bimba defeated Américo Ciência in 1936 - but there is no "defeated" predicate.
-- This is documented in Bimba's bio, not as a statement relationship.
-- Similarly, the exhibition vs Henrique Bahia is historical context, not a relationship.

-- Source: statements/persons/bastiao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bastiao
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Bastiao is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Bastiao associated_with Pedro Porreta (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bastião' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bastiao associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bastião' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Samuel, Nozinho, Duquinha, Escalvino)
-- share historical context but no direct personal relationships documented.
-- Connection is via shared lawyer, captured in bios/notes.
-- ============================================================

-- Source: statements/persons/bugalho.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bugalho
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Bugalho is the SUBJECT.
-- ============================================================

-- Bugalho student_of Waldemar
-- Bugalho frequented Waldemar's barracão as one of his regular capoeiristas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'esquiva.wordpress.com/mestres/mestre-bugalho, velhosmestres.com/br/waldemar-1955-3',
  E'Bugalho frequented Waldemar''s barracão in Liberdade as a regular capoeirista and berimbau player. Sources describe him as one of Waldemar''s bambas. He was photographed by Pierre Verger at the barracão (~1955) and filmed in "Voyage sans passeport" (1960) with Waldemar.',
  E'Bugalho frequentava o barracão de Waldemar na Liberdade como capoeirista e tocador de berimbau regular. Fontes o descrevem como um dos bambas de Waldemar. Foi fotografado por Pierre Verger no barracão (~1955) e filmado em "Voyage sans passeport" (1960) com Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bugalho' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bugalho associated_with Pastinha (recognized by him in 1967)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "recognized as legendary pure Angola capoeirista"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1967, pastinha.md',
  E'In 1967, Mestre Pastinha listed Bugalho among deceased practitioners of "pure Capoeira de Angola." This establishes Bugalho was recognized by Pastinha as a legendary figure in traditional capoeira.',
  E'Em 1967, Mestre Pastinha listou Bugalho entre os praticantes falecidos da "pura Capoeira de Angola." Isso estabelece que Bugalho era reconhecido por Pastinha como figura lendária na capoeira tradicional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bugalho' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Pelé da Bomba student_of Bugalho - PENDING: Pelé da Bomba not yet in dataset
--   Natalício Neves da Silva (1934-2024), the "Gogó de Ouro" of Bahia
--   Started learning from Bugalho in 1946 at Mercado Modelo ramp at age 12
--   Primary source: velhosmestres.com/br/destaques-20

-- Source: statements/persons/duquinha.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Duquinha
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Duquinha is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Duquinha associated_with Escalvino ("Os irmaos terror" - The terror brothers)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Known together as ''Os irmãos terror'' (The terror brothers); shared chapter in ''Mestres e capoeiras famosos da Bahia''; may be biological brothers or close associates"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestres e capoeiras famosos da Bahia (SciELO Books)',
  'Known together as "Os irmãos terror" (The terror brothers) in Salvador''s capoeira underworld during the 1920s-1930s',
  'Conhecidos juntos como "Os irmãos terror" no submundo capoeirista de Salvador durante os anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Duquinha' AND o.apelido = 'Escalvino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Duquinha associated_with Pedro Porreta (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Duquinha' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Duquinha associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Duquinha' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Samuel, Nozinho)
-- share historical context but no direct personal relationships documented.
-- Connection is via shared lawyer, captured in bios/notes.
-- Escalvino relationship ("Os irmãos terror") captured above.
-- ============================================================

-- Source: statements/persons/escalvino.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Escalvino
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Escalvino is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Escalvino associated_with Duquinha ("Os irmaos terror" - The terror brothers)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Known together as ''Os irmãos terror'' (The terror brothers); shared chapter in ''Mestres e capoeiras famosos da Bahia''; may be biological brothers or close associates"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestres e capoeiras famosos da Bahia (SciELO Books)',
  'Known together as "Os irmãos terror" (The terror brothers) in Salvador''s capoeira underworld during the 1920s-1930s',
  'Conhecidos juntos como "Os irmãos terror" no submundo capoeirista de Salvador durante os anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Escalvino' AND o.apelido = 'Duquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Escalvino associated_with Pedro Porreta (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Escalvino' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Escalvino associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Escalvino' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Samuel, Nozinho)
-- share historical context but no direct personal relationships documented.
-- Connection is via shared lawyer, captured in bios/notes.
-- Duquinha relationship ("Os irmãos terror") captured above.
-- ============================================================

-- Source: statements/persons/finado-manteiga.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Finado Manteiga
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Finado Manteiga is the SUBJECT.
-- ============================================================

-- No statements can be generated at this time.
-- Finado Manteiga is known only through Onça Preta's 1972 testimony as one
-- of the capoeiristas killed during Pedrito persecution (1920s).
-- No teachers, students, or group affiliations are documented.

-- ============================================================
-- NOTE: Pedrito persecution victims share historical context but no direct
-- personal relationships documented. Connection is through shared persecution,
-- captured in bios/notes. No M:N cross-references created.
-- ============================================================

-- Source: statements/persons/jurandir-bimba-1949.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Jurandir (Bimba 1949)
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Jurandir (Bimba student) is the SUBJECT.
-- Uses apelido_context='Bimba 1949' to match the entity.
-- ============================================================

-- Jurandir student_of Bimba
-- Confirmed: Jurandir trained under Mestre Bimba and represented his academy in 1949
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com',
  'Jurandir trained at Mestre Bimba''s academy and represented it in the 1949 challenge against Sinhozinho''s school',
  'Jurandir treinou na academia de Mestre Bimba e a representou no desafio de 1949 contra a escola de Sinhozinho'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir' AND s.apelido_context = 'Bimba 1949'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Jurandir associated_with Fernando Rodrigues Perez - fellow Bimba student who fought alongside him in 1949
--   Fernando Rodrigues Perez needs import first (currently in backlog)

-- Source: statements/persons/maozinha.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Mãozinha
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Mãozinha is the SUBJECT.
-- ============================================================

-- No statements can be generated at this time.
-- Mãozinha is known only through Onça Preta's 1972 testimony as one
-- of the capoeiristas killed during Pedrito persecution (1920s).
-- No teachers, students, or group affiliations are documented.

-- ============================================================
-- NOTE: Pedrito persecution victims share historical context but no direct
-- personal relationships documented. Connection is through shared persecution,
-- captured in bios/notes. No M:N cross-references created.
-- ============================================================

-- Source: statements/persons/nage-pedrito-victim.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Nagé (Pedrito victim)
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Nagé (Pedrito victim) is the SUBJECT.
-- Note: This is DISTINCT from Mestre Nagé (José Anastácio de Santana, 1923-1958)
-- ============================================================

-- No statements can be generated at this time.
-- Nagé (Pedrito victim) is known only through Onça Preta's 1972 testimony as one
-- of the capoeiristas killed during Pedrito persecution (1920s).
-- No teachers, students, or group affiliations are documented.

-- ============================================================
-- NOTE: Pedrito persecution victims share historical context but no direct
-- personal relationships documented. Connection is through shared persecution,
-- captured in bios/notes. No M:N cross-references created.
-- ============================================================

-- Source: statements/persons/nozinho-da-cocheira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Nozinho da Cocheira
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Nozinho da Cocheira is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Nozinho da Cocheira associated_with Pedro Porreta (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nozinho da Cocheira' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nozinho da Cocheira associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nozinho da Cocheira' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Samuel, Duquinha, Escalvino)
-- share historical context but no direct personal relationships documented.
-- Connection is via shared lawyer, captured in bios/notes.
-- ============================================================

-- Source: statements/persons/paulo-cesar-de-moura.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Paulo César de Moura
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Paulo César de Moura is the SUBJECT.
-- ============================================================

-- No statements can be generated at this time.
-- Paulo César de Moura is known only through Onça Preta's 1972 testimony as one
-- of the capoeiristas killed during Pedrito persecution (1920s).
-- No teachers, students, or group affiliations are documented.

-- ============================================================
-- NOTE: Pedrito persecution victims share historical context but no direct
-- personal relationships documented. Connection is through shared persecution,
-- captured in bios/notes. No M:N cross-references created.
-- ============================================================

-- Source: statements/persons/pedro-porreta.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Pedro Porreta
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Pedro Porreta is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Pedro Porreta associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were notorious capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were well-known valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões conhecidos em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedro Porreta' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Samuel, Nozinho, Duquinha, Escalvino)
-- share historical context but connections are via shared lawyer, captured in bios/notes.
-- Each links to Pedro Porreta from their own file; no M:N cross-references needed.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Pedro Porreta associated_with Piroca (Pedro de Alcântara) - brother, needs import first
-- Pedro Porreta associated_with Chicão (Francisca Albino dos Santos) - adversary who defeated and killed him, needs import first

-- Source: statements/persons/samuel-da-calcada.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Samuel da Calcada
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Samuel da Calcada is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Samuel da Calcada associated_with Pedro Porreta (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s; both worked as political capangas"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by Cosme de Farias and worked as political capangas',
  'Ambos eram valentões em Salvador que foram defendidos por Cosme de Farias e trabalhavam como capangas políticos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Samuel da Calçada' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Samuel da Calcada associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Samuel da Calçada' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Nozinho, Duquinha, Escalvino)
-- share historical context but no direct personal relationships documented.
-- Connection is via shared lawyer, captured in bios/notes.
-- ============================================================

-- Source: statements/persons/ze-bom-pe.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zé Bom Pé
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Zé Bom Pé is the SUBJECT.
--
-- NOTE: This is a single-source profile (Pastinha's 1967 interview).
-- No specific relationships are documented where Zé Bom Pé is the subject.
-- His teachers, students, and group affiliations are unknown.
-- ============================================================

-- No statements to insert at this time.
-- Zé Bom Pé is known only from Pastinha's mention of him as a deceased
-- practitioner of "pure Capoeira de Angola" in February 1967.

-- ============================================================
-- RELATIONSHIPS WHERE ZÉ BOM PÉ IS THE OBJECT (for reference)
-- These statements belong in OTHER entities' statement files.
-- ============================================================
-- Pastinha associated_with Zé Bom Pé - Listed him among legendary angoleiros
--   (This would go in pastinha.sql if we chose to document it)
--
-- Note: The "associated_with" predicate with Pastinha is implicit through
-- Pastinha's testimony, but Zé Bom Pé may have died before Pastinha
-- formalized CECA (1941). No direct evidence of interaction exists.

-- ============================================================
-- PENDING RELATIONSHIPS (no documentation exists)
-- ============================================================
-- Zé Bom Pé student_of [Unknown Teacher] - No teacher documented
-- Zé Bom Pé member_of [Unknown Group] - No group affiliation documented
-- Zé Bom Pé associated_with [Unknown Contemporaries] - No documented associates

COMMIT;
