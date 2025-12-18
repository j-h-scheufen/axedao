-- ============================================================
-- GENEALOGY PERSON: Sete Mortes
-- Generated: 2025-12-18
-- ============================================================
-- Full name: Inocêncio Sete Mortes
-- Born 1883 in Juazeiro, sertão da Bahia - DOCUMENTED
-- Active as guarda civil 1ª classe during Gov. Antônio Moniz
-- administration (1916-1920) and as political capanga.
-- Active as capoeirista in Salvador during second decade of Republic.
-- Died before Pastinha's 1967 interview.
--
-- DEATH YEAR ESTIMATION (1950, decade precision):
-- No death date documented. Pastinha listed him among deceased
-- angoleiros in 1967. Born 1883, if active until 1920s-1930s,
-- likely died mid-century. Using decade precision: 1950.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Inocêncio Sete Mortes', -- name
  'Sete Mortes', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967', 'https://books.scielo.org/id/pvm8g']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Sete Mortes among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview. Known as a skilled handler of the navalha (straight razor), alongside Caboclinho and Noca de Jacó.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Sete Mortes entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967. Conhecido como hábil manejador da navalha, ao lado de Caboclinho e Noca de Jacó.',
  1883, -- birth_year: documented
  'year'::genealogy.date_precision, -- birth_year_precision
  'Juazeiro, Bahia', -- birth_place: documented from sertão
  1950, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Inocêncio Sete Mortes was a capoeirista and political enforcer in Salvador, Bahia, whose life bridged the worlds of street fighting, politics, and capoeira during the First Republic. Born in 1883 in Juazeiro, in the sertão (backlands) of Bahia, he would become known as "o temível facínora" (the fearsome ruffian)—a reputation that placed him among the most notorious figures of Salvador''s early 20th century underworld.\n\nSete Mortes was very active in the world of capoeiragem in Salvador during the second decade of the Republic (1910s). His activities, however, were not restricted to capoeira. During the administration of Governor Antônio Moniz Sodré de Aragão (1916-1920), he served as a guarda civil de 1ª classe (first-class civil guard) and was accused of being a capanga—a political enforcer—for the governor.\n\nHistorical analysis clarifies an error in popular fiction: while Jorge Amado''s novels suggested Sete Mortes worked with the notorious police chief Pedro de Azevedo Gordilho ("Pedrito"), documentation shows his actual patron was Police Chief Álvaro José de Cova. A request made by Cova to Dr. Magalhães to allow Sete Mortes and his family to continue living in an old building at Mont Serrat explicitly revealed this relationship with Governor Moniz and his police chief.\n\nSete Mortes was among the capoeiristas known for their skill with the navalha (straight razor), alongside Caboclinho and Noca de Jacó. In an era when many capoeiristas supplemented their fighting techniques with blades, this skill added to his fearsome reputation. He is featured in "Mestres e Capoeiras famosos da Bahia" (2009) with the subtitle "O temível facínora!"—indicating his story was considered important enough to preserve in the historical record.\n\nIn 1967, at 78 years old and nearly blind, Mestre Pastinha spoke with journalist Roberto Freire for Revista Realidade about the great capoeiristas of the past. He listed Sete Mortes among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, and others. Pastinha noted: "Cada nome destes é uma história"—each of these names is a story.',
  -- bio_pt
  E'Inocêncio Sete Mortes foi um capoeirista e capanga político em Salvador, Bahia, cuja vida atravessou os mundos da briga de rua, política e capoeira durante a Primeira República. Nascido em 1883 em Juazeiro, no sertão da Bahia, ele se tornaria conhecido como "o temível facínora"—uma reputação que o colocou entre as figuras mais notórias do submundo soteropolitano do início do século XX.\n\nSete Mortes foi bastante ativo no mundo da capoeiragem em Salvador durante a segunda década da República (anos 1910). Suas atividades, no entanto, não se restringiam à capoeira. Durante a administração do Governador Antônio Moniz Sodré de Aragão (1916-1920), ele serviu como guarda civil de 1ª classe e era acusado de ser capanga do governador.\n\nA análise histórica esclarece um erro na ficção popular: enquanto os romances de Jorge Amado sugeriam que Sete Mortes trabalhava com o notório chefe de polícia Pedro de Azevedo Gordilho ("Pedrito"), a documentação mostra que seu verdadeiro patrono era o Chefe de Polícia Álvaro José de Cova. Um requerimento feito por Cova ao Dr. Magalhães para permitir que Sete Mortes e sua família continuassem morando em um velho prédio em Mont Serrat explicitou essa relação com o Governador Moniz e seu chefe de polícia.\n\nSete Mortes estava entre os capoeiristas conhecidos por sua habilidade com a navalha, ao lado de Caboclinho e Noca de Jacó. Em uma era em que muitos capoeiristas suplementavam suas técnicas de luta com lâminas, essa habilidade aumentava sua reputação temível. Ele é apresentado em "Mestres e Capoeiras famosos da Bahia" (2009) com o subtítulo "O temível facínora!"—indicando que sua história foi considerada importante o suficiente para ser preservada no registro histórico.\n\nEm 1967, aos 78 anos e quase cego, Mestre Pastinha conversou com o jornalista Roberto Freire para a Revista Realidade sobre os grandes capoeiristas do passado. Ele listou Sete Mortes entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, e outros. Pastinha observou: "Cada nome destes é uma história."',
  -- achievements_en
  E'Featured in "Mestres e Capoeiras famosos da Bahia" with dedicated chapter "O temível facínora!" (The fearsome ruffian)\nKnown as skilled handler of the navalha (straight razor)\nListed by Mestre Pastinha among practitioners of "pure Capoeira de Angola"',
  -- achievements_pt
  E'Apresentado em "Mestres e Capoeiras famosos da Bahia" com capítulo dedicado "O temível facínora!"\nConhecido como hábil manejador da navalha\nListado por Mestre Pastinha entre praticantes de "capoeira de Angola pura"',
  -- notes_en
  E'BIRTH YEAR (1883, year precision):\nDocumented as born in 1883 in Juazeiro, sertão da Bahia. Source: "Capoeira, identidade e gênero: ensaios sobre a história social da capoeira no Brasil" (EDUFBA, 2009), chapter "Pedrito, Sete Mortes e a ficção amadiana" by Oliveira & Leal.\n\nDEATH YEAR ESTIMATION (1950, decade):\nConfirmed dead by Pastinha''s 1967 interview. Born 1883, active through 1910s-1920s. Likely died mid-century.\n\nPOLITICAL CONNECTIONS:\n- Governor Antônio Moniz Sodré de Aragão (1916-1920): served as guarda civil 1ª classe and capanga\n- Police Chief Álvaro José de Cova: patron who defended his housing at Mont Serrat\n- NOT Pedrito as Jorge Amado''s fiction suggested\n\nOCCUPATIONAL CONTEXT:\n"Guarda civil de 1ª classe" - first-class civil guard, a position that provided cover for political enforcement work during electoral disputes.\n\nNAVALHA SKILL:\nListed among capoeiristas skilled with the navalha (straight razor) alongside Caboclinho and Noca de Jacó.\n\nAPELIDO:\n"Sete Mortes" means "Seven Deaths" in Portuguese. This fearsome nickname likely relates to his reputation as a dangerous fighter, though no specific explanation of its origin has been documented.\n\nJORGE AMADO FICTION:\nAmado''s novels (Tenda dos Milagres, Jubiabá) portrayed capoeiristas in political contexts, but erroneously linked Sete Mortes to Pedrito. Historical research clarifies the actual connection was to Álvaro Cova.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nOTHER POLITICAL CAPANGAS (contemporaries):\nSamuel da Calçada, Duquinha, Escalvino (Luís Escalvino), Estevinho, Sebastião de Souza, Pedro Mineiro',
  -- notes_pt
  E'ANO DE NASCIMENTO (1883, precisão de ano):\nDocumentado como nascido em 1883 em Juazeiro, sertão da Bahia. Fonte: "Capoeira, identidade e gênero: ensaios sobre a história social da capoeira no Brasil" (EDUFBA, 2009), capítulo "Pedrito, Sete Mortes e a ficção amadiana" de Oliveira & Leal.\n\nESTIMATIVA DE ANO DE MORTE (1950, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Nascido em 1883, ativo nos anos 1910-1920. Provavelmente morreu em meados do século.\n\nCONEXÕES POLÍTICAS:\n- Governador Antônio Moniz Sodré de Aragão (1916-1920): serviu como guarda civil 1ª classe e capanga\n- Chefe de Polícia Álvaro José de Cova: patrono que defendeu sua moradia em Mont Serrat\n- NÃO Pedrito como a ficção de Jorge Amado sugeria\n\nCONTEXTO OCUPACIONAL:\n"Guarda civil de 1ª classe" - posição que fornecia cobertura para trabalho de execução política durante disputas eleitorais.\n\nHABILIDADE COM NAVALHA:\nListado entre capoeiristas hábeis com a navalha ao lado de Caboclinho e Noca de Jacó.\n\nAPELIDO:\n"Sete Mortes" significa "Seven Deaths" em inglês. Esse apelido temível provavelmente se relaciona à sua reputação como lutador perigoso, embora nenhuma explicação específica de sua origem tenha sido documentada.\n\nFICÇÃO DE JORGE AMADO:\nOs romances de Amado (Tenda dos Milagres, Jubiabá) retrataram capoeiristas em contextos políticos, mas erroneamente ligaram Sete Mortes a Pedrito. A pesquisa histórica esclarece que a conexão real era com Álvaro Cova.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nOUTROS CAPANGAS POLÍTICOS (contemporâneos):\nSamuel da Calçada, Duquinha, Escalvino (Luís Escalvino), Estevinho, Sebastião de Souza, Pedro Mineiro'
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
