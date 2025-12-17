-- ============================================================
-- GENEALOGY PERSON: João Grande
-- Generated: 2025-12-15
-- ============================================================
-- One of the two principal heirs of Mestre Pastinha alongside
-- João Pequeno. Pioneer of capoeira angola in the United States.
-- Represented Brazil at Dakar Festival 1966. Founded Capoeira
-- Angola Center in New York City (1990). Still teaching at 91.
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
  'João Oliveira dos Santos',
  'João Grande',
  'mestre'::genealogy.title,
  'https://commons.wikimedia.org/wiki/File:MestreJoaoGrande.jpg',
  ARRAY['https://en.wikipedia.org/wiki/Jo%C3%A3o_Grande', 'https://joaogrande.org/', 'https://www.arts.gov/honors/heritage/joao-oliveira-dos-santos-mestre-joao-grande']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of Mestre Pastinha. Known for spreading the floor-touching mandinga movements he learned from Mestre Cobrinha Verde—a mystical practice of touching the floor as if making sorcery or asking for protection. Teaches capoeira "the African way, as a philosophy and a way of life, respecting the roots, history and tradition." His academy features berimbaus, historical photographs, and African cultural artifacts reflecting his deep appreciation for African culture.',
  E'Capoeira Angola pura na tradição de Mestre Pastinha. Conhecido por difundir os movimentos de mandinga de tocar o chão que aprendeu com Mestre Cobrinha Verde—uma prática mística de tocar o chão como se fizesse feitiçaria ou pedisse proteção. Ensina capoeira "do jeito africano, como filosofia e modo de vida, respeitando as raízes, história e tradição." Sua academia apresenta berimbaus, fotografias históricas e artefatos culturais africanos refletindo sua profunda apreciação pela cultura africana.',
  -- Life dates
  1933,
  'exact'::genealogy.date_precision,
  'Itagi, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'João Oliveira dos Santos was born on January 15, 1933, in the village of Itagi in southern Bahia. As a child, he worked alongside his family in the fields as a cattle herder. His mother died when he was young, and he never attended school.

At the age of ten, he saw a movement called "corta capim" for the first time—a crouching technique where one leg swings in a circle while hopping over it with the other. Fascinated, he asked what it was called and was told it was "the Dance of the Nagos," a dance of the African descendants in Salvador.

Ten years later, at age twenty, João left his rural life and arrived in Salvador, the birthplace of capoeira. At Roca do Lobo, he witnessed his first proper capoeira roda. Present were mestres Menino Gordo, João Pequeno, Mestre Barbosa, and Cobrinha Verde—one of the most skillful players of that era. João Pequeno sent him to Mestre Pastinha, who had an academy in the Cardeal Pequeno neighborhood of Brotas.

Pastinha accepted João as a student at the relatively late age of twenty. It was Pastinha who gave him the name "João Grande" (Big John) to distinguish him from the shorter João Pequeno, who had been training with Pastinha for two years prior. Together, the two Joãos became Pastinha''s "two most learned students"—the principal heirs to the Angola tradition. From Cobrinha Verde, João Grande learned the floor-touching mandinga movements that became emblematic of capoeira angola, which he later spread throughout the world.

In 1966, João Grande traveled to Dakar, Senegal, with Mestre Pastinha to demonstrate capoeira at the first World Festival of Black Arts (Festival des Arts Nègres). The delegation included Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. Pastinha, suffering from vision problems, played atabaque while the others performed.

In 1968, João Grande received his diploma from Pastinha, becoming a full-fledged mestre of capoeira angola.

He subsequently toured Europe and the Middle East with Viva Bahia, a pioneering folk group directed by Emília Biancardi that performed Afro-Brazilian arts including capoeira, samba, maculelê, candomblé, and puxada da rede. In 1974, he was part of another European tour. Painter Carybé documented João Grande in his artistic documentation of African culture in Bahia.

After Pastinha''s death on November 13, 1981, João Grande withdrew from the capoeira world and took a job at a gas station. He continued to perform in a limited capacity in folkloric shows for tourists.

In the mid-1980s, Mestre Moraes and Mestre Cobra Mansa persuaded him to come out of retirement. He began teaching with their organization, Grupo Capoeira Angola Pelourinho (GCAP).

In 1989, Mestre Jelon Vieira invited him to tour the United States. The tour was a tremendous success. In 1990, he performed at the National Black Arts Festival in Atlanta and at the Schomburg Center for Research in Black Culture in New York City. Ken Dossar and Daniel Dawson had invited him to Atlanta; Nego Gato invited him to teach in Harlem.

João Grande decided he liked the United States and settled in New York City in 1990. With help from Tisch Rosen (Risadinha), an English student and university professor, he established the Capoeira Angola Center on 14th Street in Manhattan. He has taught hundreds of students there—"Japanese, Germans, Africans, Americans, and women"—never needing to speak English because his students learn Portuguese for the rodas.

Today, the Capoeira Angola Center of Mestre João Grande has affiliates in Arizona, Finland, Italy, Japan, Los Angeles, Oakland, Serbia, Kenya, San Diego, and Illinois. He continues to teach at his academy at 350 Fort Washington Avenue, New York, holding classes and rodas with Mestre João Grande every Sunday.

At 91 years old (turning 92 in January 2025), Mestre João Grande has dedicated more than 70 years to capoeira angola. He is recognized as one of the most respected Grand Masters in the world—one of only two living grand masters of capoeira angola alongside João Pequeno''s successor, Mestre Faísca.',
  -- Extended content (bio_pt)
  E'João Oliveira dos Santos nasceu em 15 de janeiro de 1933, na vila de Itagi, no sul da Bahia. Quando criança, trabalhava com a família nos campos como vaqueiro. Sua mãe morreu quando ele era jovem, e nunca frequentou a escola.

Aos dez anos, viu pela primeira vez um movimento chamado "corta capim"—uma técnica agachada onde uma perna gira em círculo enquanto salta sobre ela com a outra. Fascinado, perguntou como se chamava e foi informado que era "a Dança dos Nagôs," uma dança dos descendentes africanos em Salvador.

Dez anos depois, aos vinte anos, João deixou sua vida rural e chegou a Salvador, o berço da capoeira. Em Roca do Lobo, testemunhou sua primeira roda de capoeira. Presentes estavam os mestres Menino Gordo, João Pequeno, Mestre Barbosa e Cobrinha Verde—um dos jogadores mais habilidosos daquela época. João Pequeno o enviou a Mestre Pastinha, que tinha uma academia no bairro Cardeal Pequeno de Brotas.

Pastinha aceitou João como aluno na idade relativamente tardia de vinte anos. Foi Pastinha quem lhe deu o nome "João Grande" para distingui-lo do mais baixo João Pequeno, que já treinava com Pastinha há dois anos. Juntos, os dois Joãos tornaram-se os "dois alunos mais preparados" de Pastinha—os principais herdeiros da tradição Angola. De Cobrinha Verde, João Grande aprendeu os movimentos de mandinga de tocar o chão que se tornaram emblemáticos da capoeira angola, os quais depois espalhou pelo mundo.

Em 1966, João Grande viajou para Dakar, Senegal, com Mestre Pastinha para demonstrar capoeira no primeiro Festival Mundial de Artes Negras (Festival des Arts Nègres). A delegação incluía Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Pastinha, sofrendo de problemas de visão, tocou atabaque enquanto os outros se apresentavam.

Em 1968, João Grande recebeu seu diploma de Pastinha, tornando-se um mestre completo de capoeira angola.

Posteriormente, excursionou pela Europa e Oriente Médio com Viva Bahia, um grupo folclórico pioneiro dirigido por Emília Biancardi que apresentava artes afro-brasileiras incluindo capoeira, samba, maculelê, candomblé e puxada da rede. Em 1974, participou de outra turnê europeia. O pintor Carybé documentou João Grande em sua documentação artística da cultura africana na Bahia.

Após a morte de Pastinha em 13 de novembro de 1981, João Grande se afastou do mundo da capoeira e trabalhou em um posto de gasolina. Continuou a se apresentar de forma limitada em shows folclóricos para turistas.

Em meados da década de 1980, Mestre Moraes e Mestre Cobra Mansa o persuadiram a sair da aposentadoria. Começou a ensinar com a organização deles, Grupo Capoeira Angola Pelourinho (GCAP).

Em 1989, Mestre Jelon Vieira o convidou para uma turnê pelos Estados Unidos. A turnê foi um tremendo sucesso. Em 1990, apresentou-se no National Black Arts Festival em Atlanta e no Schomburg Center for Research in Black Culture em Nova York. Ken Dossar e Daniel Dawson o haviam convidado para Atlanta; Nego Gato o convidou para ensinar no Harlem.

João Grande decidiu que gostava dos Estados Unidos e se estabeleceu em Nova York em 1990. Com a ajuda de Tisch Rosen (Risadinha), uma estudante de inglês e professora universitária, estabeleceu o Capoeira Angola Center na 14th Street em Manhattan. Ensinou centenas de alunos lá—"japoneses, alemães, africanos, americanos e mulheres"—nunca precisando falar inglês porque seus alunos aprendem português para as rodas.

Hoje, o Capoeira Angola Center de Mestre João Grande tem afiliados no Arizona, Finlândia, Itália, Japão, Los Angeles, Oakland, Sérvia, Quênia, San Diego e Illinois. Continua ensinando em sua academia na 350 Fort Washington Avenue, Nova York, realizando aulas e rodas com Mestre João Grande todo domingo.

Aos 91 anos (completando 92 em janeiro de 2025), Mestre João Grande dedicou mais de 70 anos à capoeira angola. É reconhecido como um dos Grão-Mestres mais respeitados do mundo—um dos únicos dois grão-mestres vivos da capoeira angola junto com o sucessor de João Pequeno, Mestre Faísca.',
  -- Achievements
  E'- Doctorate of Humane Letters from Upsala College, East Orange, New Jersey (1995)
- National Heritage Fellowship from National Endowment for the Arts (2001) - highest US honor for traditional arts
- Grand Cross of the Order of Cultural Merit (Grã-Cruz da Ordem do Mérito Cultural) from President Dilma Rousseff (November 9, 2015) - highest Brazilian cultural award
- Represented Brazil at First World Festival of Black Arts, Dakar, Senegal (1966)
- Diploma from Mestre Pastinha (1968) - full mestre recognition
- Founded Capoeira Angola Center of Mestre João Grande, New York City (1990)
- International affiliates in Arizona, Finland, Italy, Japan, Los Angeles, Oakland, Serbia, Kenya, San Diego, Illinois
- Pioneer of capoeira angola in the United States
- Over 70 years dedicated to capoeira angola
- Participated in 2017 Smithsonian Folklife Festival, leading master classes
- Multiple audio CDs and DVDs documenting capoeira angola',
  E'- Doutorado Honoris Causa pela Upsala College, East Orange, New Jersey (1995)
- National Heritage Fellowship do National Endowment for the Arts (2001) - maior honraria americana para artes tradicionais
- Grã-Cruz da Ordem do Mérito Cultural pela Presidente Dilma Rousseff (9 de novembro de 2015) - maior prêmio cultural brasileiro
- Representou o Brasil no Primeiro Festival Mundial de Artes Negras, Dakar, Senegal (1966)
- Diploma de Mestre Pastinha (1968) - reconhecimento completo como mestre
- Fundou o Capoeira Angola Center de Mestre João Grande, Nova York (1990)
- Afiliados internacionais no Arizona, Finlândia, Itália, Japão, Los Angeles, Oakland, Sérvia, Quênia, San Diego, Illinois
- Pioneiro da capoeira angola nos Estados Unidos
- Mais de 70 anos dedicados à capoeira angola
- Participou do Smithsonian Folklife Festival 2017, conduzindo master classes
- Múltiplos CDs e DVDs documentando a capoeira angola',
  -- Researcher notes (notes_en)
  E'Birth date confirmed as January 15, 1933 across multiple sources (Wikipedia, Velhos Mestres, NEA, Smithsonian). Birth place confirmed as Itagi, Bahia. João Grande is still alive and teaching in New York as of 2024-2025—classes scheduled through January 2025 with a "Fruta Madura 2025" event planned reuniting him with Mestre Dunga after 38 years. Velhos Mestres celebrated his 92nd birthday (January 2025). NEA states he received honorary doctorate from Upsala College in 1993, while other sources say 1994 or 1995—using 1995 as most commonly cited. He arrived in Salvador at age 20 (1953), joining Pastinha shortly after João Pequeno had already trained with Pastinha for two years. The mandinga floor-touching movements were specifically taught to him by Cobrinha Verde and later spread by João Grande. Dakar 1966 delegation included six capoeiristas: Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. Diploma received from Pastinha in 1968. Mestre Moraes considers João Grande his "true teacher." Capoeira Hub lists Mestre Jurandir Santos as his son and student, though this could not be independently confirmed in other sources.',
  E'Data de nascimento confirmada como 15 de janeiro de 1933 em múltiplas fontes (Wikipedia, Velhos Mestres, NEA, Smithsonian). Local de nascimento confirmado como Itagi, Bahia. João Grande ainda está vivo e ensinando em Nova York em 2024-2025—aulas programadas até janeiro de 2025 com evento "Fruta Madura 2025" planejado reunindo-o com Mestre Dunga após 38 anos. Velhos Mestres celebrou seu 92º aniversário (janeiro de 2025). NEA afirma que recebeu doutorado honorário da Upsala College em 1993, enquanto outras fontes dizem 1994 ou 1995—usando 1995 como mais comumente citado. Chegou em Salvador aos 20 anos (1953), juntando-se a Pastinha pouco depois de João Pequeno já ter treinado com Pastinha por dois anos. Os movimentos de mandinga de tocar o chão foram especificamente ensinados a ele por Cobrinha Verde e depois difundidos por João Grande. A delegação de Dakar 1966 incluía seis capoeiristas: Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Diploma recebido de Pastinha em 1968. Mestre Moraes considera João Grande seu "verdadeiro mestre." Capoeira Hub lista Mestre Jurandir Santos como seu filho e aluno, embora isso não tenha sido confirmado independentemente em outras fontes.'
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
