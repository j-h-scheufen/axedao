-- ============================================================
-- GENEALOGY PERSON: Janja
-- Generated: 2025-12-28
-- ============================================================
-- Pioneer female angoleira; historian and educator; co-founder
-- of GCAP Salvador (1982) and Grupo Nzinga (1995). Professor at
-- UFBA. Leader of Rede Angoleira de Mulheres (RAM). Key figure
-- in women's capoeira movements and anti-racist activism.
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
  'Rosângela Costa Araújo',
  'Janja',
  'mestra'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/general/capoeira-and-gender-womens-empowerment/', 'https://mandingueira.ca/tag/mestra-janja/', 'https://portalcapoeira.com/capoeira/eventos-agenda/nzinga-30-anos-de-capoeira-angola/', 'https://nzinga-marburg.com/2018/02/06/mestras-e-mestres/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Follows the Capoeira Angola lineage of Mestre Pastinha through GCAP. Emphasizes capoeira as a tool for anti-racist and anti-sexist struggle, not merely as sport or spectacle. Co-created the Orquestra Nzinga de Berimbaus (1999) which performs pieces connecting capoeira with other Afro-Brazilian traditions including jongo, tambor-de-crioula, and bumba-meu-boi. Her approach integrates capoeira with education, research, and social activism, emphasizing "Oralidade, Comunidade, Brincadeira, Jogo, Espiritualidade e Ancestralidade" (Orality, Community, Play, Game, Spirituality, and Ancestry).',
  E'Segue a linhagem de Capoeira Angola de Mestre Pastinha através do GCAP. Enfatiza a capoeira como instrumento de luta antirracista e antissexista, não apenas como esporte ou espetáculo. Co-criou a Orquestra Nzinga de Berimbaus (1999) que executa peças conectando capoeira com outras tradições afro-brasileiras incluindo jongo, tambor-de-crioula e bumba-meu-boi. Sua abordagem integra capoeira com educação, pesquisa e ativismo social, enfatizando "Oralidade, Comunidade, Brincadeira, Jogo, Espiritualidade e Ancestralidade".',
  -- Life dates
  1959,
  'exact'::genealogy.date_precision,
  'Feira de Santana, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Rosângela Costa Araújo was born on October 4, 1959, in Feira de Santana, Bahia. She came from a white maternal family with no connection to Afro-Brazilian culture and initially had no interest in capoeira during adolescence. She first studied physical education but left it all behind the first time she entered the roda of the Grupo de Capoeira Angola Pelourinho in Salvador, where she found what she had been seeking: a way to think about the body and historical identity at the same time.

In 1983, Janja began training with GCAP in Salvador under Mestre Moraes. This experience proved transformative, allowing her to explore body and historical identity through African cultural perspectives. She also trained with Mestre João Grande and Mestre Cobra Mansa during her years at GCAP. While training, she graduated in History from the Federal University of Bahia (UFBA).

Janja spent fifteen years in the trajectory within GCAP, becoming a contra-mestra. In 1995, she moved to São Paulo to pursue graduate studies at the University of São Paulo''s Faculty of Education, focusing on Philosophy and Education. That same year, she founded the Instituto Nzinga de Estudos da Capoeira Angola e Tradições Educativas Banto no Brasil, together with Mestra Paulinha (Paula Barreto) and Mestre Poloca (Paulo Barreto)—both fellow disciples of Moraes, João Grande, and Cobra Mansa at GCAP.

Grupo Nzinga was named after Queen Nzinga Mbandi Ngola (1581-1663), the warrior queen of Matamba and Angola who led four decades of resistance against Portuguese colonization. The organization was committed to the practice and research of capoeira within the lineage of Mestre Pastinha, operating as an instrument of anti-racist and anti-sexist struggle focused on social justice. In 2001, the Instituto Nzinga gained formal institutional identity as INCAB, establishing headquarters in Jardim Colombo (2003), an underprivileged São Paulo neighborhood.

In 1999, Janja created the Orquestra Nzinga de Berimbaus, which aims to cultivate and disseminate the berimbau, its African origin, and its possibilities of execution. The orchestra released the CD "Nzinga Capoeira Angola" in June 2003, featuring musical pieces that establish connections between capoeira rhythms and other Afro-Brazilian musical traditions.

Janja completed her Master''s degree and Doctorate in Education from the University of São Paulo. She later earned a Post-Doctorate in Social Sciences from PUC/SP. After returning to Salvador, she assumed the coordination of the Department of Women for the Secretary of the Promotion of Equality of the State of Bahia (SEPROMI) and later became a professor in the Department of Education at the Federal University of Bahia. Today, she is a Professor in the Department of Gender and Feminism Studies at the Faculty of Philosophy and Human Sciences at UFBA, and a Permanent Professor in the Graduate Program in Interdisciplinary Studies on Women, Gender and Feminism (PPGNEIM) and in the Doctorate in Knowledge Dissemination (DMMDC-UFBA).

In September 2004, Janja received the honorary title of "Paulistana Citizen" from the São Paulo City Council for her outstanding work in preserving and fighting for the values of the country''s black community. In 2013, she was awarded the title of "Bahian Citizen" from the Salvador City Council.

Janja leads the Rede Angoleira de Mulheres (RAM - Network of Angoleira Women), coordinating projects for affirmative action supporting Black students'' entrance into university. She helped organize events such as the VI Congresso Badauê of Women Capoeiristas and established an international conference for women angoleiras in Atlanta, USA. She also co-publishes the magazine "Toques d''Angola."

The internationalization of Grupo Nzinga began in 2005, with the opening of centers in Marburg (Germany) and Mexico City. As of 2020, on its 25th anniversary, Nzinga operated in five Brazilian cities (São Paulo, Salvador, Brasília, Rio de Janeiro, and others) and twelve international cities including Maputo (Mozambique), London (England), Tokyo (Japan), and Atlanta (USA). The group continues its mission of fighting racism and gender discrimination, publishing manifestos against machismo in capoeira communities.',
  -- Extended content (bio_pt)
  E'Rosângela Costa Araújo nasceu em 4 de outubro de 1959, em Feira de Santana, Bahia. Veio de uma família materna branca sem conexão com a cultura afro-brasileira e inicialmente não tinha interesse pela capoeira durante a adolescência. Primeiro estudou educação física, mas abandonou tudo na primeira vez que entrou na roda do Grupo de Capoeira Angola Pelourinho em Salvador, onde encontrou o que estava buscando: uma maneira de pensar o corpo e a identidade histórica ao mesmo tempo.

Em 1983, Janja começou a treinar no GCAP em Salvador sob a orientação de Mestre Moraes. Esta experiência provou-se transformadora, permitindo-lhe explorar corpo e identidade histórica através de perspectivas culturais africanas. Ela também treinou com Mestre João Grande e Mestre Cobra Mansa durante seus anos no GCAP. Enquanto treinava, graduou-se em História pela Universidade Federal da Bahia (UFBA).

Janja passou quinze anos na trajetória dentro do GCAP, tornando-se contra-mestra. Em 1995, mudou-se para São Paulo para cursar pós-graduação na Faculdade de Educação da Universidade de São Paulo, com foco em Filosofia e Educação. No mesmo ano, fundou o Instituto Nzinga de Estudos da Capoeira Angola e Tradições Educativas Banto no Brasil, junto com Mestra Paulinha (Paula Barreto) e Mestre Poloca (Paulo Barreto)—ambos também discípulos de Moraes, João Grande e Cobra Mansa no GCAP.

O Grupo Nzinga foi nomeado em homenagem à Rainha Nzinga Mbandi Ngola (1581-1663), a rainha guerreira de Matamba e Angola que liderou quatro décadas de resistência contra a colonização portuguesa. A organização foi comprometida com a prática e pesquisa de capoeira dentro da linhagem de Mestre Pastinha, operando como um instrumento de luta antirracista e antissexista focado na justiça social. Em 2001, o Instituto Nzinga ganhou identidade institucional formal como INCAB, estabelecendo sede no Jardim Colombo (2003), um bairro carente de São Paulo.

Em 1999, Janja criou a Orquestra Nzinga de Berimbaus, que visa cultivar e difundir o berimbau, sua origem africana e suas possibilidades de execução. A orquestra lançou o CD "Nzinga Capoeira Angola" em junho de 2003, com peças musicais que estabelecem conexões entre os ritmos de capoeira e outras tradições musicais afro-brasileiras.

Janja completou seu Mestrado e Doutorado em Educação pela Universidade de São Paulo. Posteriormente obteve Pós-Doutorado em Ciências Sociais pela PUC/SP. Após retornar a Salvador, assumiu a coordenação do Departamento de Mulheres da Secretaria de Promoção da Igualdade do Estado da Bahia (SEPROMI) e posteriormente tornou-se professora no Departamento de Educação da Universidade Federal da Bahia. Hoje, é Professora no Departamento de Estudos de Gênero e Feminismo da Faculdade de Filosofia e Ciências Humanas da UFBA, e Professora Permanente no Programa de Pós-Graduação em Estudos Interdisciplinares sobre Mulheres, Gênero e Feminismo (PPGNEIM) e no Doutorado em Difusão do Conhecimento (DMMDC-UFBA).

Em setembro de 2004, Janja recebeu o título honorífico de "Cidadã Paulistana" da Câmara Municipal de São Paulo por seu destacado trabalho na preservação e luta pelos valores da comunidade negra do país. Em 2013, foi agraciada com o título de "Cidadã Baiana" pela Câmara Municipal de Salvador.

Janja lidera a Rede Angoleira de Mulheres (RAM), coordenando projetos de ação afirmativa apoiando a entrada de estudantes negros na universidade. Ajudou a organizar eventos como o VI Congresso Badauê de Mulheres Capoeiristas e estabeleceu uma conferência internacional para mulheres angoleiras em Atlanta, EUA. Também co-publica a revista "Toques d''Angola."

A internacionalização do Grupo Nzinga começou em 2005, com a abertura de centros em Marburg (Alemanha) e Cidade do México. Em 2020, em seu 25º aniversário, o Nzinga operava em cinco cidades brasileiras (São Paulo, Salvador, Brasília, Rio de Janeiro e outras) e doze cidades internacionais incluindo Maputo (Moçambique), Londres (Inglaterra), Tóquio (Japão) e Atlanta (EUA). O grupo continua sua missão de combater o racismo e a discriminação de gênero, publicando manifestos contra o machismo nas comunidades de capoeira.',
  -- Achievements (achievements_en)
  E'- Co-founded Grupo de Capoeira Angola Pelourinho (GCAP) in Salvador, 1982 (with Moraes returning from Rio)
- Founded Grupo Nzinga de Capoeira Angola (1995) with Mestra Paulinha and Mestre Poloca - now in 5 Brazilian cities and 12 international locations
- Created Orquestra Nzinga de Berimbaus (1999) - released CD "Nzinga Capoeira Angola" (2003)
- PhD in Education from University of São Paulo (USP)
- Post-Doctorate in Social Sciences from PUC/SP
- History degree from Federal University of Bahia (UFBA)
- Professor in Department of Gender and Feminism Studies at UFBA
- Permanent Professor in PPGNEIM (Graduate Program in Women, Gender and Feminism Studies) at UFBA
- "Paulistana Citizen" title (2004) - São Paulo City Council
- "Bahian Citizen" title (2013) - Salvador City Council
- Leader of Rede Angoleira de Mulheres (RAM - Network of Angoleira Women)
- Co-publisher of "Toques d''Angola" magazine
- Organized VI Congresso Badauê of Women Capoeiristas
- Established international conference for women angoleiras in Atlanta
- Coordinator, Department of Women, SEPROMI (Secretary of the Promotion of Equality of the State of Bahia)',
  E'- Co-fundou o Grupo de Capoeira Angola Pelourinho (GCAP) em Salvador, 1982 (com Moraes retornando do Rio)
- Fundou o Grupo Nzinga de Capoeira Angola (1995) com Mestra Paulinha e Mestre Poloca - agora em 5 cidades brasileiras e 12 locais internacionais
- Criou a Orquestra Nzinga de Berimbaus (1999) - lançou CD "Nzinga Capoeira Angola" (2003)
- Doutorado em Educação pela Universidade de São Paulo (USP)
- Pós-Doutorado em Ciências Sociais pela PUC/SP
- Graduação em História pela Universidade Federal da Bahia (UFBA)
- Professora no Departamento de Estudos de Gênero e Feminismo da UFBA
- Professora Permanente no PPGNEIM (Programa de Pós-Graduação em Estudos Interdisciplinares sobre Mulheres, Gênero e Feminismo) na UFBA
- Título de "Cidadã Paulistana" (2004) - Câmara Municipal de São Paulo
- Título de "Cidadã Baiana" (2013) - Câmara Municipal de Salvador
- Líder da Rede Angoleira de Mulheres (RAM)
- Co-editora da revista "Toques d''Angola"
- Organizou o VI Congresso Badauê de Mulheres Capoeiristas
- Estabeleceu conferência internacional para mulheres angoleiras em Atlanta
- Coordenadora, Departamento de Mulheres, SEPROMI (Secretaria de Promoção da Igualdade do Estado da Bahia)',
  -- Researcher notes (notes_en)
  E'BIRTH DATE: October 4, 1959 confirmed by Portuguese Wikipedia and multiple sources.

BIRTHPLACE DISCREPANCY:
- "Feira de Santana" - Portuguese Wikipedia (primary source)
- "Salvador" - CapoeiraHistory.com, Mandingueira, some English sources
Using Feira de Santana as this appears in the more authoritative Portuguese Wikipedia article.

GCAP INVOLVEMENT:
- Sources state she was "one of the founders" (uma das fundadoras) of GCAP Salvador in 1982
- However, GCAP was formally founded October 5, 1980 in Rio de Janeiro
- Moraes returned to Salvador in 1982 with Cobra Mansa
- Janja likely joined GCAP when it was re-established/expanded in Salvador in 1982-1983
- Most sources say she "started training" (começou a treinar) with GCAP in 1983
- She spent 15 years with GCAP (1983-1995 = 12 years; OR 1980-1995 = 15 years)
- Using 1983 as training start date based on majority of sources

TEACHERS:
- Mestre Moraes (primary, GCAP director)
- Mestre João Grande (GCAP, also taught at Pastinha''s CECA)
- Mestre Cobra Mansa (GCAP, arrived Salvador 1982)

TITLE PROGRESSION:
- Contramestra at GCAP (before 1995)
- Mestra title date unknown - likely received after founding Nzinga (1995+)

GRUPO NZINGA FOUNDING:
- 1995: Founded in São Paulo when Janja moved there for graduate studies
- Co-founders: Mestra Paulinha (Paula Barreto, sociologist) and Mestre Poloca (Paulo Barreto, geographer)
- 2001: INCAB formal registration
- 2003: Headquarters in Jardim Colombo, São Paulo
- 2005: International expansion (Marburg, Mexico City)
- 2020: 25th anniversary - 5 Brazilian cities, 12 international cities

NAME DISAMBIGUATION:
- DISTINCT from "Escola de Capoeira Angola Nzinga" (Germany) founded 1985 by Mestre Paulo Siqueira
- Both named after Queen Nzinga but completely separate organizations with different lineages

PHOTOGRAPH: Library of Congress has photograph (2008) by André Cypriano showing "Capoeira with Master Janja at the Instituto Nzinga de Estudos da Capoeira Angola e Tradições Educativas Banto, in the quilombola community of Alto da Sereia, Salvador."

MAGAZINE CLARIFICATION:
- Some sources mention "Real D''Angola" magazine - appears to be error
- Correct magazine name is "Toques d''Angola" (first issue April 2003)',
  E'DATA DE NASCIMENTO: 4 de outubro de 1959 confirmada pela Wikipedia em português e múltiplas fontes.

DISCREPÂNCIA DE LOCAL DE NASCIMENTO:
- "Feira de Santana" - Wikipedia em português (fonte primária)
- "Salvador" - CapoeiraHistory.com, Mandingueira, algumas fontes em inglês
Usando Feira de Santana pois aparece no artigo mais autoritativo da Wikipedia em português.

ENVOLVIMENTO NO GCAP:
- Fontes afirmam que ela foi "uma das fundadoras" do GCAP Salvador em 1982
- No entanto, o GCAP foi formalmente fundado em 5 de outubro de 1980 no Rio de Janeiro
- Moraes retornou a Salvador em 1982 com Cobra Mansa
- Janja provavelmente se juntou ao GCAP quando foi restabelecido/expandido em Salvador em 1982-1983
- A maioria das fontes diz que ela "começou a treinar" com o GCAP em 1983
- Passou 15 anos no GCAP (1983-1995 = 12 anos; OU 1980-1995 = 15 anos)
- Usando 1983 como data de início do treinamento baseado na maioria das fontes

MESTRES:
- Mestre Moraes (principal, diretor do GCAP)
- Mestre João Grande (GCAP, também ensinou no CECA de Pastinha)
- Mestre Cobra Mansa (GCAP, chegou em Salvador 1982)

PROGRESSÃO DE TÍTULO:
- Contramestra no GCAP (antes de 1995)
- Data do título de Mestra desconhecida - provavelmente recebido após fundar o Nzinga (1995+)

FUNDAÇÃO DO GRUPO NZINGA:
- 1995: Fundado em São Paulo quando Janja se mudou para lá para estudos de pós-graduação
- Co-fundadores: Mestra Paulinha (Paula Barreto, socióloga) e Mestre Poloca (Paulo Barreto, geógrafo)
- 2001: Registro formal do INCAB
- 2003: Sede no Jardim Colombo, São Paulo
- 2005: Expansão internacional (Marburg, Cidade do México)
- 2020: 25º aniversário - 5 cidades brasileiras, 12 cidades internacionais

DESAMBIGUAÇÃO DE NOME:
- DISTINTA da "Escola de Capoeira Angola Nzinga" (Alemanha) fundada em 1985 por Mestre Paulo Siqueira
- Ambas nomeadas em homenagem à Rainha Nzinga mas organizações completamente separadas com linhagens diferentes

FOTOGRAFIA: Library of Congress tem fotografia (2008) de André Cypriano mostrando "Capoeira com Mestra Janja no Instituto Nzinga de Estudos da Capoeira Angola e Tradições Educativas Banto, na comunidade quilombola de Alto da Sereia, Salvador."

ESCLARECIMENTO SOBRE REVISTA:
- Algumas fontes mencionam revista "Real D''Angola" - parece ser erro
- Nome correto da revista é "Toques d''Angola" (primeira edição abril de 2003)'
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
