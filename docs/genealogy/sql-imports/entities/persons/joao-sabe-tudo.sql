-- ============================================================
-- GENEALOGY PERSON: João Sabe Tudo
-- Migrated: 2025-12-11
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
  NULL,
  'João Sabe Tudo',
  NULL,
  NULL,
  ARRAY['https://capoeiraracanegra.webnode.page/lendas-da-capoeira/nascimento-grande/']::text[],
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s valentão culture and street fighting tradition.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado à cultura dos valentões do Recife e à tradição de luta de rua.',
  -- Life dates
  1850,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'João Sabe Tudo ("João Knows Everything") was one of the most feared fighters and valentões of late 19th century Recife, Pernambuco. Described as "nó cego" (stubborn, obstinate - literally "blind knot"), he was paradoxically both the fiercest rival and closest friend of Nascimento Grande, the legendary capoeirista who dominated Pernambuco.\n\nJoão''s fame spread across Brazil alongside other notorious valentões like Pirajé from Pará, Manezinho Camisa Preta from Rio de Janeiro, and Pajeú from the Pernambuco backcountry. All coveted Nascimento Grande''s reputation as the greatest fighter, and João was relentless in his challenges.\n\nHe lived to challenge "O Capoeira" (Nascimento Grande), constantly summoning him to scheduled fights at specific times and places. Yet curiously, despite this ongoing rivalry, they were friends who organized festas (parties) together at Hotel Sobrado Grande, located on Rua Camboa do Carmo in the Santo Antônio neighborhood of Recife.\n\nTheir most famous confrontation occurred one Sunday morning near the bridge at Largo da Paz. The two rivals encountered each other unexpectedly, and there was no time for discussion—the fight began immediately. João Sabe Tudo drew his peixeira (a traditional Brazilian fighting knife), while Nascimento Grande wielded his famous 15-kilogram cane called "a volta."\n\nThe two fighters, with advances, retreats, and feints, descended Rua Imperial with a crowd following. They reached Praça Sérgio Loreto, advanced further, and arrived at the Matriz de São José, where they entered the Igreja do Carmo. Inside the church, a vicar intervened, demanding they cease fighting in "the house of God." Respecting the priest''s words, they accepted a draw, shook hands, and never fought again.\n\nAnother account describes an even more violent scheduled battle in front of the Church of Carmo, where stick fighting continued for hours. The two fighters resembled "fighting roosters." When the fight ended, Nascimento Grande placed João Sabe Tudo on his back and carried him to the hospital, bathed in blood.\n\nDespite these brutal confrontations, their friendship endured. They continued to host parties together, embodying the complex honor code of Recife''s valentão culture—men who could be mortal enemies in combat yet brothers in celebration.',
  -- bio_pt
  E'João Sabe Tudo foi um dos lutadores mais temidos e valentões do Recife de finais do século XIX, Pernambuco. Descrito como "nó cego" (teimoso, obstinado), era paradoxalmente tanto o rival mais feroz quanto o amigo mais próximo de Nascimento Grande, o lendário capoeirista que dominava Pernambuco.\n\nA fama de João se espalhou pelo Brasil ao lado de outros notórios valentões como Pirajé do Pará, Manezinho Camisa Preta do Rio de Janeiro, e Pajeú do sertão pernambucano. Todos cobiçavam a reputação de Nascimento Grande como o maior lutador, e João era incansável em seus desafios.\n\nEle vivia a desafiar "O Capoeira" (Nascimento Grande), constantemente convocando-o para brigas com local e hora marcada. Porém, curiosamente, apesar desta rivalidade contínua, eram amigos que promoviam festas juntos no Hotel Sobrado Grande, localizado na Rua Camboa do Carmo no bairro de Santo Antônio, Recife.\n\nSeu confronto mais famoso ocorreu num domingo de manhã perto da ponte do Largo da Paz. Os dois rivais se encontraram inesperadamente, e não houve tempo para discussões—a briga começou imediatamente. João Sabe Tudo sacou sua peixeira (faca de luta tradicional brasileira), enquanto Nascimento Grande empunhava sua famosa bengala de 15 quilos chamada "a volta."\n\nOs dois lutadores, em avanços, recuos e negaças, desceram a Rua Imperial com uma multidão acompanhando. Atingiram a Praça Sérgio Loreto, avançaram mais e chegaram à Matriz de São José, onde entraram na Igreja do Carmo. Dentro da igreja, um vigário interveio, exigindo que parassem de lutar na "casa de Deus." Respeitando as palavras do padre, aceitaram um empate, apertaram as mãos e nunca mais lutaram.\n\nOutro relato descreve uma batalha ainda mais violenta marcada em frente à Igreja do Carmo, onde a luta de bengala continuou por horas. Os dois lutadores pareciam "galos de briga." Quando a luta terminou, Nascimento Grande colocou João Sabe Tudo nas costas e o levou ao hospital, banhado em sangue.\n\nApesar destes confrontos brutais, sua amizade perdurou. Continuaram a dar festas juntos, incorporando o complexo código de honra da cultura dos valentões do Recife—homens que podiam ser inimigos mortais em combate, mas irmãos na celebração.',
  -- achievements_en
  'One of the most feared fighters of Recife; Survived legendary battles with Nascimento Grande; Maintained complex rivalry-friendship with the greatest capoeirista of Pernambuco; Part of the valentão culture that influenced frevo',
  -- achievements_pt
  'Um dos lutadores mais temidos do Recife; Sobreviveu a batalhas lendárias com Nascimento Grande; Manteve complexa rivalidade-amizade com o maior capoeirista de Pernambuco; Parte da cultura dos valentões que influenciou o frevo',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION: c. 1850 (decade precision). João Sabe Tudo was a contemporary and rival of Nascimento Grande (1842-1936). To be an effective rival and "one of the most feared fighters of Recife," he would need to be in his physical prime during the late 19th century. If their famous fights occurred during the 1880s-1900s (Nascimento''s prime), João would likely be born around 1840-1860. A birth year of c. 1850 makes him roughly 8 years younger than Nascimento, placing him at ages 30-50 during the prime rivalry period.\n\nDEATH DATE: Unknown. No sources mention his death.\n\nWEAPON: Peixeira (traditional Brazilian fighting knife).\n\nPERSONALITY: "Nó cego" (stubborn/obstinate). Constantly challenged Nascimento Grande to scheduled fights, yet maintained friendship.\n\nCONFLICTING ACCOUNTS: Multiple versions of their fights exist:\n1. Spontaneous Sunday morning encounter at Largo da Paz, ending in Igreja do Carmo with vicar intervention\n2. Pre-scheduled violent battle in front of Igreja do Carmo, ending with João hospitalized\n\nBoth versions may represent different fights, or the same event told differently. The church intervention and continued friendship appear in multiple sources.\n\nHOTEL SOBRADO GRANDE: Located on Rua Camboa do Carmo in Santo Antônio neighborhood. Venue for parties hosted by João and Nascimento together.\n\nVALENTÃO CULTURE: Part of Recife''s carnival capoeira tradition. These fighters'' ginga and movements influenced the development of frevo dance, now UNESCO Intangible Cultural Heritage.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO: c. 1850 (precisão de década). João Sabe Tudo foi contemporâneo e rival de Nascimento Grande (1842-1936). Para ser um rival efetivo e "um dos lutadores mais temidos do Recife," precisaria estar em seu auge físico durante o final do século XIX. Se suas famosas lutas ocorreram durante os anos 1880-1900 (auge de Nascimento), João provavelmente nasceu por volta de 1840-1860. Um ano de nascimento de c. 1850 o torna aproximadamente 8 anos mais jovem que Nascimento, colocando-o com idades de 30-50 durante o período de rivalidade principal.\n\nDATA DE MORTE: Desconhecida. Nenhuma fonte menciona sua morte.\n\nARMA: Peixeira (faca de luta tradicional brasileira).\n\nPERSONALIDADE: "Nó cego" (teimoso/obstinado). Constantemente desafiava Nascimento Grande para lutas marcadas, mas mantinha a amizade.\n\nRELATOS CONFLITANTES: Existem múltiplas versões de suas lutas:\n1. Encontro espontâneo domingo de manhã no Largo da Paz, terminando na Igreja do Carmo com intervenção do vigário\n2. Batalha violenta pré-agendada em frente à Igreja do Carmo, terminando com João hospitalizado\n\nAmbas as versões podem representar lutas diferentes, ou o mesmo evento contado de formas diferentes. A intervenção na igreja e a amizade continuada aparecem em múltiplas fontes.\n\nHOTEL SOBRADO GRANDE: Localizado na Rua Camboa do Carmo no bairro de Santo Antônio. Local das festas organizadas por João e Nascimento juntos.\n\nCULTURA DOS VALENTÕES: Parte da tradição carnavalesca de capoeira do Recife. A ginga e movimentos destes lutadores influenciaram o desenvolvimento da dança do frevo, agora Patrimônio Cultural Imaterial da UNESCO.'
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
