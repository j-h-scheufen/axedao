-- ============================================================
-- GENEALOGY PERSON: Brasília
-- Generated: 2025-12-20
-- ============================================================
-- "50 anos sem tirar a mão do chão" (50 years without taking hand off the ground)
-- Co-founder of Cordão de Ouro; Pioneer of capoeira in São Paulo
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
  'Antônio Cardoso Andrade',
  'Brasília',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-64', 'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/entrevista-com-mestre-brasilia/', 'https://pt.wikipedia.org/wiki/Mestre_Bras%C3%ADlia']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Brasília trained primarily in Capoeira Angola under Mestre Canjiquinha but became versatile in both styles. At Cordão de Ouro, he taught Capoeira Angola while Mestre Suassuna taught Capoeira Regional within the same space, demonstrating the complementary nature of the two traditions. His teaching encompasses the foundations of Capoeira Angola, Capoeira Regional, and contemporary Capoeira. He also integrated other Brazilian cultural manifestations into his work, including Maculelê, Samba de Roda, and Puxada de Rede.',
  E'Brasília treinou principalmente em Capoeira Angola sob Mestre Canjiquinha, mas se tornou versátil em ambos os estilos. No Cordão de Ouro, ele ensinava Capoeira Angola enquanto Mestre Suassuna ensinava Capoeira Regional no mesmo espaço, demonstrando a natureza complementar das duas tradições. Seu ensino abrange os fundamentos da Capoeira Angola, Capoeira Regional e Capoeira contemporânea. Ele também integrou outras manifestações culturais brasileiras em seu trabalho, incluindo Maculelê, Samba de Roda e Puxada de Rede.',
  -- Life dates
  1942,
  'exact'::genealogy.date_precision,
  'Alagoinhas, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Antônio Cardoso Andrade was born on May 29, 1942, in Alagoinhas, Bahia, into a humble family. As a child, he moved to Pedrão at age 6, then to Salvador at age 13, where his life would be transformed by capoeira. Before discovering his calling, he worked various trades: water carrier, bread vendor, luggage carrier, shoemaker, metalworker, mechanic, bricklayer, and painter. Raised by a single mother, he faced social prejudice but developed resilience that would serve him throughout his life.

At age 14, after a street fight, Brasília first witnessed capoeira but did not begin training until age 19. In 1961, after seeing a festival performance by Mestre Canjiquinha - the legendary "Joy of Capoeira" - he was captivated and became Canjiquinha''s disciple. For six years, he performed throughout Bahia and other Brazilian states, absorbing the art and philosophy of his master.

In 1965, at age 23 (some sources say 25), Brasília left Bahia for São Paulo with dreams of establishing capoeira in Brazil''s largest city. The beginning was hard - he arrived without connections, working as a mason while seeking his place in the capoeira world. His fortune changed when people from his hometown of Itabuna introduced him to Zé de Freitas''s academy, where he met Mestre Suassuna.

On September 1, 1967, Brasília and Suassuna together founded the Associação de Capoeira Cordão de Ouro in Vila Mariana, São Paulo. In an innovative arrangement, Brasília taught Capoeira Angola while Suassuna taught Capoeira Regional within the same space - a model that respected both traditions. After a short period, in 1969, Brasília decided to establish his own group: Associação de Capoeira São Bento Grande, which continues today as Escola de Capoeira Ginga Brasília.

Brasília was one of the "Grupo dos Nove" (Group of Nine) - Bahian capoeiristas who came to São Paulo in the 1960s and pioneered the art in the state. Ten years later, they received certificates from Mestre Bimba himself, recognizing them as precursors and creators of Capoeira in São Paulo - a remarkable honor from the founder of Capoeira Regional.

In 1981, Brasília honored his master by creating the Troféu Mestre Canjiquinha with support from the Federação Paulista de Capoeira (São Paulo Capoeira Federation). This trophy continues to recognize excellence in capoeira, keeping Canjiquinha''s memory alive.

From the 1970s, Brasília began international expansion. He lived in Japan for three years (1973-1975), returning multiple times (1986, 2000, 2002, 2008-2010). He also taught in Germany (1987), the United States (1995, 1997, 2008), Italy (1999), Korea, Belgium, Spain, England, and China - spreading Brazilian culture across continents.

Beyond teaching, Brasília is a prolific composer of capoeira music, samba, puxada de rede, maculelê, and other Brazilian rhythms. He recorded six albums: "Ginga Original" (1990), "Ginga Original II" (1993), "50 anos sem tirar a mão do chão" (2011), "Capoeira é de valor" (2015), and "Sorriso no rosto" (2020). His book "Vivência e Fundamentos de um Mestre de Capoeira" (Experience and Foundations of a Capoeira Master), published by Editora Circuito LW, documents his trajectory and philosophy.

Throughout his career, Brasília trained over 50,000 students through his academies. He holds positions as Vice-President of the Federação de Capoeira do Estado de São Paulo and is a member of the Honor Board of the Superior Council of Masters of São Paulo.

Despite taking different paths, Brasília and Suassuna remain friends, their partnership and friendship evident to this day. In 2010, Brasília celebrated 50 years in capoeira with a milestone event titled "50 ANOS SEM TIRAR A MÃO DO CHÃO" (50 Years Without Taking Hand Off the Ground) - reflecting his lifelong dedication to the art.

Brasília views capoeira holistically: "Capoeira is not just sport, it is a Brazilian cultural manifestation with very broad content: we have rhythm, poetry, music, choreography, defense, attack, spectacle, struggle and sport." This vision has guided his teaching for over six decades.',
  -- bio_pt
  E'Antônio Cardoso Andrade nasceu em 29 de maio de 1942, em Alagoinhas, Bahia, em uma família humilde. Quando criança, mudou-se para Pedrão aos 6 anos, depois para Salvador aos 13 anos, onde sua vida seria transformada pela capoeira. Antes de descobrir sua vocação, trabalhou em vários ofícios: carregador de água, vendedor de pão, carregador de bagagem, sapateiro, funileiro, mecânico, pedreiro e pintor. Criado por mãe solteira, enfrentou preconceito social, mas desenvolveu resiliência que o serviria ao longo de sua vida.

Aos 14 anos, após uma briga de rua, Brasília presenciou a capoeira pela primeira vez, mas não começou a treinar até os 19 anos. Em 1961, após ver uma apresentação de festival de Mestre Canjiquinha - a lendária "Alegria da Capoeira" - ele ficou cativado e se tornou discípulo de Canjiquinha. Por seis anos, ele se apresentou por toda a Bahia e outros estados brasileiros, absorvendo a arte e filosofia de seu mestre.

Em 1965, aos 23 anos (algumas fontes dizem 25), Brasília deixou a Bahia para São Paulo com sonhos de estabelecer a capoeira na maior cidade do Brasil. O início foi difícil - chegou sem conexões, trabalhando como pedreiro enquanto buscava seu lugar no mundo da capoeira. Sua sorte mudou quando pessoas de sua cidade natal de Itabuna o apresentaram à academia de Zé de Freitas, onde conheceu Mestre Suassuna.

Em 1° de setembro de 1967, Brasília e Suassuna juntos fundaram a Associação de Capoeira Cordão de Ouro em Vila Mariana, São Paulo. Em um arranjo inovador, Brasília ensinava Capoeira Angola enquanto Suassuna ensinava Capoeira Regional no mesmo espaço - um modelo que respeitava ambas as tradições. Após um curto período, em 1969, Brasília decidiu estabelecer seu próprio grupo: Associação de Capoeira São Bento Grande, que continua hoje como Escola de Capoeira Ginga Brasília.

Brasília foi um dos "Grupo dos Nove" - capoeiristas baianos que vieram para São Paulo nos anos 1960 e foram pioneiros da arte no estado. Dez anos depois, eles receberam certificados do próprio Mestre Bimba, reconhecendo-os como precursores e criadores da Capoeira em São Paulo - uma honra notável do fundador da Capoeira Regional.

Em 1981, Brasília honrou seu mestre criando o Troféu Mestre Canjiquinha com apoio da Federação Paulista de Capoeira. Este troféu continua a reconhecer a excelência na capoeira, mantendo viva a memória de Canjiquinha.

A partir dos anos 1970, Brasília iniciou sua expansão internacional. Ele viveu no Japão por três anos (1973-1975), retornando múltiplas vezes (1986, 2000, 2002, 2008-2010). Também ensinou na Alemanha (1987), Estados Unidos (1995, 1997, 2008), Itália (1999), Coreia, Bélgica, Espanha, Inglaterra e China - espalhando a cultura brasileira pelos continentes.

Além de ensinar, Brasília é um compositor prolífico de música de capoeira, samba, puxada de rede, maculelê e outros ritmos brasileiros. Ele gravou seis álbuns: "Ginga Original" (1990), "Ginga Original II" (1993), "50 anos sem tirar a mão do chão" (2011), "Capoeira é de valor" (2015) e "Sorriso no rosto" (2020). Seu livro "Vivência e Fundamentos de um Mestre de Capoeira", publicado pela Editora Circuito LW, documenta sua trajetória e filosofia.

Ao longo de sua carreira, Brasília treinou mais de 50.000 alunos através de suas academias. Ele ocupa posições como Vice-Presidente da Federação de Capoeira do Estado de São Paulo e é membro do Conselho de Honra do Conselho Superior de Mestres de São Paulo.

Apesar de terem tomado caminhos diferentes, Brasília e Suassuna permanecem amigos, sua parceria e amizade evidente até hoje. Em 2010, Brasília celebrou 50 anos na capoeira com um evento marcante intitulado "50 ANOS SEM TIRAR A MÃO DO CHÃO" - refletindo sua dedicação vitalícia à arte.

Brasília vê a capoeira de forma holística: "A capoeira não é só esporte, é uma manifestação cultural brasileira com conteúdo muito amplo: temos ritmo, poesia, música, coreografia, defesa, ataque, espetáculo, luta e esporte." Essa visão guiou seu ensino por mais de seis décadas.',
  -- achievements_en
  E'1961: Began training under Mestre Canjiquinha at age 19
1965: Migrated to São Paulo; pioneer of capoeira in the state
1967 (September 1): Co-founded Associação de Capoeira Cordão de Ouro with Mestre Suassuna in Vila Mariana, São Paulo
1969: Founded Associação de Capoeira São Bento Grande (now Ginga Brasília)
1970s: Received certificate from Mestre Bimba as precursor of Capoeira in São Paulo (as part of Grupo dos Nove)
1973-1975: Lived and taught in Japan for three years
1981: Created Troféu Mestre Canjiquinha with Federação Paulista de Capoeira
1990: Released first album "Ginga Original"
1993: Released "Ginga Original II"
2010: Celebrated "50 Anos Sem Tirar a Mão do Chão" milestone event
2011: Released album "50 anos sem tirar a mão do chão"
2015: Released album "Capoeira é de valor"
2020: Released album "Sorriso no rosto"
Published book "Vivência e Fundamentos de um Mestre de Capoeira" (Editora Circuito LW)
Vice-President of Federação de Capoeira do Estado de São Paulo
Member of Honor Board of Superior Council of Masters of São Paulo
Trained over 50,000 students through his academies
International teaching in Japan, Germany, USA, Italy, Korea, Belgium, Spain, England, and China',
  -- achievements_pt
  E'1961: Iniciou treinamento com Mestre Canjiquinha aos 19 anos
1965: Migrou para São Paulo; pioneiro da capoeira no estado
1967 (1° de setembro): Co-fundou Associação de Capoeira Cordão de Ouro com Mestre Suassuna em Vila Mariana, São Paulo
1969: Fundou Associação de Capoeira São Bento Grande (atual Ginga Brasília)
Anos 1970: Recebeu certificado de Mestre Bimba como precursor da Capoeira em São Paulo (como parte do Grupo dos Nove)
1973-1975: Viveu e ensinou no Japão por três anos
1981: Criou o Troféu Mestre Canjiquinha com a Federação Paulista de Capoeira
1990: Lançou primeiro álbum "Ginga Original"
1993: Lançou "Ginga Original II"
2010: Celebrou evento marco "50 Anos Sem Tirar a Mão do Chão"
2011: Lançou álbum "50 anos sem tirar a mão do chão"
2015: Lançou álbum "Capoeira é de valor"
2020: Lançou álbum "Sorriso no rosto"
Publicou livro "Vivência e Fundamentos de um Mestre de Capoeira" (Editora Circuito LW)
Vice-Presidente da Federação de Capoeira do Estado de São Paulo
Membro do Conselho de Honra do Conselho Superior de Mestres de São Paulo
Treinou mais de 50.000 alunos através de suas academias
Ensino internacional no Japão, Alemanha, EUA, Itália, Coreia, Bélgica, Espanha, Inglaterra e China',
  -- notes_en
  E'BIRTH DATE: May 29, 1942 (exact per velhosmestres.com, Wikipedia PT, SpCultura). Birthplace is Alagoinhas, Bahia (some sources emphasize he is "Baiano de Alagoinhas"). Moved to Pedrão age 6, then Salvador age 13.

NAME VARIATIONS:
- "Antônio Cardoso Andrade" (velhosmestres.com, Wikipedia PT)
- "Antonio Cardoso de Andrade" (Portal Capoeira)
Both forms appear in sources; using accented "Antônio" for consistency with Brazilian Portuguese.

TEACHER:
- Mestre Canjiquinha (Washington Bruno da Silva) - primary teacher from 1961; trained for 6 years performing throughout Bahia before moving to São Paulo in 1965

ASSOCIATIONS:
- Lived/trained with Mestres Bimba, Waldemar, João Pequeno, João Grande, Onça, Limão, Silvestre, Joel, Zé de Freitas

CORDÃO DE OURO FOUNDING:
- Founded September 1, 1967 in Vila Mariana, São Paulo with Mestre Suassuna
- Innovative arrangement: Brasília taught Angola, Suassuna taught Regional in same space
- Brasília departed ~1968-1969 to found São Bento Grande

GROUP EVOLUTION:
- 1969: Founded Associação de Capoeira São Bento Grande
- Later renamed to Escola de Capoeira Ginga Brasília (current name)
- Grupo dos Nove: Bahian capoeiristas who pioneered capoeira in São Paulo 1960s

BIMBA CERTIFICATE:
- Received in 1970s (approximately 10 years after arriving in SP)
- Recognition as "precursors and creators of Capoeira in São Paulo"
- Significant honor from founder of Capoeira Regional

JAPAN TRIPS:
- 1973-1975: Lived 3 years
- 1986, 2000, 2002, 2008-2010: Return visits

DISCOGRAPHY:
- 1990: "Ginga Original"
- 1993: "Ginga Original II"
- 2011: "50 anos sem tirar a mão do chão"
- 2015: "Capoeira é de valor"
- 2020: "Sorriso no rosto"
(6 albums total per velhosmestres.com)',
  -- notes_pt
  E'DATA DE NASCIMENTO: 29 de maio de 1942 (exata conforme velhosmestres.com, Wikipedia PT, SpCultura). Local de nascimento é Alagoinhas, Bahia (algumas fontes enfatizam que ele é "Baiano de Alagoinhas"). Mudou-se para Pedrão aos 6 anos, depois Salvador aos 13.

VARIAÇÕES DE NOME:
- "Antônio Cardoso Andrade" (velhosmestres.com, Wikipedia PT)
- "Antonio Cardoso de Andrade" (Portal Capoeira)
Ambas as formas aparecem nas fontes; usando "Antônio" acentuado por consistência com português brasileiro.

MESTRE:
- Mestre Canjiquinha (Washington Bruno da Silva) - professor principal desde 1961; treinou por 6 anos se apresentando por toda a Bahia antes de se mudar para São Paulo em 1965

ASSOCIAÇÕES:
- Viveu/treinou com Mestres Bimba, Waldemar, João Pequeno, João Grande, Onça, Limão, Silvestre, Joel, Zé de Freitas

FUNDAÇÃO DO CORDÃO DE OURO:
- Fundado 1° de setembro de 1967 em Vila Mariana, São Paulo com Mestre Suassuna
- Arranjo inovador: Brasília ensinava Angola, Suassuna ensinava Regional no mesmo espaço
- Brasília saiu ~1968-1969 para fundar São Bento Grande

EVOLUÇÃO DO GRUPO:
- 1969: Fundou Associação de Capoeira São Bento Grande
- Posteriormente renomeado para Escola de Capoeira Ginga Brasília (nome atual)
- Grupo dos Nove: capoeiristas baianos que foram pioneiros da capoeira em São Paulo anos 1960

CERTIFICADO DE BIMBA:
- Recebido nos anos 1970 (aproximadamente 10 anos após chegar em SP)
- Reconhecimento como "precursores e criadores da Capoeira em São Paulo"
- Honra significativa do fundador da Capoeira Regional

VIAGENS AO JAPÃO:
- 1973-1975: Viveu 3 anos
- 1986, 2000, 2002, 2008-2010: Visitas de retorno

DISCOGRAFIA:
- 1990: "Ginga Original"
- 1993: "Ginga Original II"
- 2011: "50 anos sem tirar a mão do chão"
- 2015: "Capoeira é de valor"
- 2020: "Sorriso no rosto"
(6 álbuns no total conforme velhosmestres.com)'
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
