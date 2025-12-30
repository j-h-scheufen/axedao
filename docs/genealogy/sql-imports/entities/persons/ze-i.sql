-- ============================================================
-- GENEALOGY PERSON: Zé I (José Custódio dos Santos)
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Active as a fighter in 1936 (Odeon Park fights against Bimba).
-- Bimba was born 1899, making him 37 in 1936. As a contemporary
-- capoeirista who faced Bimba in challenge fights, José Custódio
-- was likely in his fighting prime (25-40 years old), meaning born ~1896-1911.
-- Using decade precision: 1900.
--
-- DEATH YEAR: Unknown. No documentation found about his death.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'José Custódio dos Santos', -- name: full name documented
  'Zé I', -- apelido: documented nickname; newspaper spelled "Zéy"
  NULL, -- title: no formal title documented, but described as "fellow capoeira master"
  NULL, -- portrait: no image found
  ARRAY['https://capoeira.online/history/mestres/mestre-bimba/', 'http://capoeira-connection.com/capoeira/2011/10/mestre-bimba-capoeira-champion-challenges-all-bahian-fighters-1936/', 'https://www.lalaue.com/learn-capoeira/mestre-bimba/']::text[],
  NULL, -- style: capoeirista but style not documented (likely Angola given era)
  NULL, -- style_notes_en
  NULL, -- style_notes_pt
  1900, -- birth_year: estimated from 1936 fight activity (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given participation in local capoeira scene
  NULL, -- death_year: unknown
  NULL, -- death_year_precision
  NULL, -- death_place: unknown
  -- bio_en
  E'José Custódio dos Santos, known as "Zé I" (newspaper spelling: "Zéy"), was a capoeirista active in Salvador, Bahia, in the 1930s. He is remembered as one of the four opponents defeated by Mestre Bimba in the famous 1936 challenge series at Parque Odeon in Praça da Sé, Salvador—and notably, the only one among the four specifically identified as a "fellow capoeira master".\n\nIn 1936, Mestre Bimba issued an open challenge through the newspapers to fighters of any martial art style to test his Capoeira Regional. The fights were held at the newly inaugurated Parque Odeon under boxing-like rules developed by capoeirista Aníbal Burlamaqui. A point-scoring system was used: cabeçada (headbutt) takedowns worth 2-3 points, meia lua and armada strikes worth 1 point, tesoura (scissors) takedowns worth 2 points, and a headlock (gravata) worth 6 points.\n\nJosé Custódio stepped into the ring against Bimba on March 18, 1936. According to the Jornal A Tarde article from March 16, 1936, Bimba won the match decisively with a score of 15-2. Bimba himself later stated: "I won fifteen points to two, and not as it was reported". The newspaper noted that "Zéy did only one meia lua and armada hit and one tesoura hit"—accounting for his two points.\n\nAs a fellow capoeirista facing Bimba, José Custódio''s defeat was particularly significant for Bimba''s project of proving Regional''s superiority. While the other three opponents may have come from various fighting backgrounds, Zé I was explicitly a capoeira practitioner, making this a direct test of Bimba''s new methodology against traditional capoeira.\n\nThe apelido "Zé I" (Zé Primeiro/Zé One) likely distinguished him from other capoeiristas named José in the Salvador scene—a common practice when multiple practitioners shared the same first name.\n\nJosé Custódio was one of four opponents Bimba faced that night—alongside Henrique Bahia, Vítor Benedito Lopes, and Américo Ciência. Bimba won all four matches, earning the nickname "Três Pancadas" (Three Hits) for his devastating efficiency.',
  -- bio_pt
  E'José Custódio dos Santos, conhecido como "Zé I" (grafia de jornal: "Zéy"), foi um capoeirista ativo em Salvador, Bahia, nos anos 1930. Ele é lembrado como um dos quatro oponentes derrotados por Mestre Bimba na famosa série de desafios de 1936 no Parque Odeon na Praça da Sé, Salvador—e notavelmente, o único entre os quatro especificamente identificado como "mestre de capoeira".\n\nEm 1936, Mestre Bimba lançou um desafio aberto pelos jornais a lutadores de qualquer estilo de arte marcial para testar sua Capoeira Regional. As lutas foram realizadas no recém-inaugurado Parque Odeon sob regras semelhantes ao boxe desenvolvidas pelo capoeirista Aníbal Burlamaqui. Um sistema de pontuação foi utilizado: derrubadas por cabeçada valendo 2-3 pontos, golpes de meia lua e armada valendo 1 ponto, derrubadas por tesoura valendo 2 pontos, e gravata valendo 6 pontos.\n\nJosé Custódio entrou no ringue contra Bimba em 18 de março de 1936. De acordo com o artigo do Jornal A Tarde de 16 de março de 1936, Bimba venceu a luta de forma decisiva com um placar de 15-2. O próprio Bimba declarou posteriormente: "Ganhei quinze pontos a dois, e não como foi relatado". O jornal observou que "Zéy fez apenas um golpe de meia lua e armada e um golpe de tesoura"—contabilizando seus dois pontos.\n\nComo colega capoeirista enfrentando Bimba, a derrota de José Custódio foi particularmente significativa para o projeto de Bimba de provar a superioridade da Regional. Enquanto os outros três oponentes podem ter vindo de várias origens de luta, Zé I era explicitamente um praticante de capoeira, tornando isto um teste direto da nova metodologia de Bimba contra a capoeira tradicional.\n\nO apelido "Zé I" (Zé Primeiro) provavelmente o distinguia de outros capoeiristas chamados José no cenário de Salvador—uma prática comum quando múltiplos praticantes compartilhavam o mesmo primeiro nome.\n\nJosé Custódio foi um dos quatro oponentes que Bimba enfrentou naquela noite—junto com Henrique Bahia, Vítor Benedito Lopes e Américo Ciência. Bimba venceu todas as quatro lutas, ganhando o apelido "Três Pancadas" por sua eficiência devastadora.',
  NULL, -- achievements_en
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nActive as a fighter in 1936 (Odeon Park fights against Bimba). Bimba was born 1899, making him 37 in 1936. As a contemporary capoeirista who faced Bimba in challenge fights, José Custódio was likely in his fighting prime (25-40 years old), meaning born ~1896-1911.\n\nNAME VARIATIONS:\n- Full name: José Custódio dos Santos\n- Apelido: Zé I (Zé Primeiro / Zé One)\n- Newspaper spelling: "Zéy" (Jornal A Tarde, March 16, 1936)\n\nTHE ONLY FELLOW CAPOEIRISTA:\nAmong the four 1936 opponents, José Custódio is the only one explicitly described as a "fellow capoeira master". This made his defeat particularly significant for Bimba''s project of proving Regional''s superiority over traditional capoeira.\n\n1936 ODEON PARK CONTEXT:\n- Parque Odeon inaugurated February 6, 1936 in Praça da Sé, Salvador\n- Fight date: March 18, 1936\n- Score: Bimba won 15-2\n- Zé I''s scoring: "only one meia lua and armada hit and one tesoura hit" (2 points)\n- Odeon Park deactivated July 1936\n\nPOINT SCORING SYSTEM (from Jornal A Tarde):\n- Cabeçada to aú (takedown): 3 points\n- Cabeçada to aú (hit): 1 point\n- Cabeçada takedown: 2 points\n- Cabeçada hit: 1 point\n- Meia lua and armada in face: 1 point\n- Meia lua and armada hit: 1 point\n- Calcanheira: 1 point\n- Tesoura takedown: 2 points\n- Tesoura hit: 1 point\n- Balão açoitado: 2 points\n- Balão arqueado: 2 points\n- Headlock (gravata): 6 points\n\nBIMBA''S STATEMENT:\n"I won fifteen points to two, and not as it was reported".',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nAtivo como lutador em 1936 (lutas do Odeon Park contra Bimba). Bimba nasceu em 1899, tendo 37 anos em 1936. Como capoeirista contemporâneo que enfrentou Bimba em lutas de desafio, José Custódio provavelmente estava em seu auge de luta (25-40 anos), significando nascido ~1896-1911.\n\nVARIAÇÕES DE NOME:\n- Nome completo: José Custódio dos Santos\n- Apelido: Zé I (Zé Primeiro)\n- Grafia de jornal: "Zéy" (Jornal A Tarde, 16 de março de 1936)\n\nO ÚNICO CAPOEIRISTA COLEGA:\nEntre os quatro oponentes de 1936, José Custódio é o único explicitamente descrito como "mestre de capoeira colega". Isso tornou sua derrota particularmente significativa para o projeto de Bimba de provar a superioridade da Regional sobre a capoeira tradicional.\n\nCONTEXTO DO ODEON PARK 1936:\n- Parque Odeon inaugurado em 6 de fevereiro de 1936 na Praça da Sé, Salvador\n- Data da luta: 18 de março de 1936\n- Placar: Bimba venceu 15-2\n- Pontuação de Zé I: "apenas um golpe de meia lua e armada e um golpe de tesoura" (2 pontos)\n- Odeon Park desativado em julho de 1936\n\nSISTEMA DE PONTUAÇÃO (do Jornal A Tarde):\n- Cabeçada para aú (derrubada): 3 pontos\n- Cabeçada para aú (golpe): 1 ponto\n- Cabeçada derrubada: 2 pontos\n- Cabeçada golpe: 1 ponto\n- Meia lua e armada no rosto: 1 ponto\n- Meia lua e armada golpe: 1 ponto\n- Calcanheira: 1 ponto\n- Tesoura derrubada: 2 pontos\n- Tesoura golpe: 1 ponto\n- Balão açoitado: 2 pontos\n- Balão arqueado: 2 pontos\n- Gravata: 6 pontos\n\nDECLARAÇÃO DE BIMBA:\n"Ganhei quinze pontos a dois, e não como foi relatado".'
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
