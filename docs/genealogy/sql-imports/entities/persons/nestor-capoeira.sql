-- ============================================================
-- GENEALOGY PERSON: Nestor Capoeira
-- Generated: 2025-12-15
-- ============================================================
-- Nestor Sezefredo dos Passos Neto (1946-2025), one of the most
-- influential capoeira authors and teachers, pioneer of capoeira
-- in Europe, author of 10+ books translated worldwide.
--
-- BIRTH DATE: September 29, 1946 - Confirmed by multiple sources.
-- DEATH DATE: March 29, 2025 - Confirmed by velhosmestres.com and
-- multiple obituaries.
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
  'Nestor Sezefredo dos Passos Neto',
  'Nestor Capoeira',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirawiki.org/wiki/Nestor_Capoeira',
    'https://capoeirahistory.com/master-nestor-capoeira/'
  ]::text[],
  -- Capoeira-specific
  'contemporanea'::genealogy.style,
  E'Nestor Capoeira developed his game within Grupo Senzala, one of the pioneering groups that created the "Senzala style" - a synthesis of Angola and Regional that became influential throughout Brazil. His teaching philosophy at Escola Nestor Capoeira emphasized freedom: students could choose whether to pursue graduation or wear uniforms. He described his approach as "Capoeira Contemporânea", combining traditional elements with modern pedagogical methods. His academic background in communication informed his analytical approach to capoeira''s philosophy and history.',
  E'Nestor Capoeira desenvolveu seu jogo dentro do Grupo Senzala, um dos grupos pioneiros que criaram o "estilo Senzala" - uma síntese de Angola e Regional que se tornou influente em todo o Brasil. Sua filosofia de ensino na Escola Nestor Capoeira enfatizava a liberdade: os alunos podiam escolher se queriam buscar graduação ou usar uniformes. Ele descreveu sua abordagem como "Capoeira Contemporânea", combinando elementos tradicionais com métodos pedagógicos modernos. Sua formação acadêmica em comunicação informou sua abordagem analítica da filosofia e história da capoeira.',
  -- Life dates
  1946,
  'exact'::genealogy.date_precision,
  'Belo Horizonte, Brazil',
  2025,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Nestor Sezefredo dos Passos Neto was born on September 29, 1946, in Belo Horizonte, Brazil. At nineteen, in 1965, he began learning capoeira from Mestre Leopoldina, the legendary mestre of Rio de Janeiro known for his synthesis of carioca tiririca and Bahian capoeira traditions.

In 1968, Nestor joined Grupo Senzala in Rio de Janeiro, one of the most influential capoeira groups of the era. There he trained under Mestre Preguiça (Walmir Oliveira) and began teaching as a contramestre under the supervision of Mestre Gato (Fernando C. de Albuquerque) at the Federal University of Rio de Janeiro. By 1969, at just twenty-three years old, he had achieved the "corda vermelha" (red cord), the highest rank in Senzala.

In 1971, Nestor became a pioneer of capoeira in Europe, traveling alone at age twenty-five to teach at the London School of Contemporary Dance. This made him likely the first Brazilian mestre to teach capoeira regularly in Europe. He spent three years touring European cities, spreading knowledge of the art across the continent. He continued traveling and teaching internationally between 1971 and 1996.

Beyond teaching, Nestor pursued an academic career. He earned an engineering degree from the Federal University of Rio de Janeiro (UFRJ) in 1969. Later, he obtained a Master''s degree from ECO-UFRJ in 1995, a PhD in Communication and Culture in 2001, and completed post-doctoral work at PUC-São Paulo.

In 1976, Nestor starred in the Brazilian adventure film "Cordão de Ouro", directed by Antônio Carlos da Fontoura. The film featured several notable capoeira mestres, including Mestre Leopoldina who played berimbau and sang, and Mestre Camisa who appeared in black body paint. It was a landmark film for representing capoeira in Brazilian cinema.

In 1990, after over two decades with Grupo Senzala, Nestor left to establish his own school, the Escola Nestor Capoeira. He began teaching at the Planetário da Gávea in Rio de Janeiro in 1992, with daily classes from 7 PM to 10 PM. In 2002, the school moved across the street to the Galpão das Artes Urbanas.

His teaching philosophy was distinctive: students who didn''t want to pursue graduation didn''t need any. Those who didn''t want to wear uniforms didn''t have to. This freedom reflected his broader philosophy about capoeira as a personal journey rather than a hierarchical institution.

Nestor Capoeira authored ten books on capoeira, translated into multiple languages with over 120,000 copies sold worldwide. His works include the "Trilogia do Jogador" (Player''s Trilogy): "Capoeira: Pequeno Manual do Jogador" (1981), "Galo Já Cantou" (1985), and "Capoeira: Os Fundamentos da Malícia" (1992). His English-language works - "The Little Capoeira Book", "Capoeira: Roots of the Dance-Fight-Game", and "A Street-Smart Song: Capoeira Philosophy and Inner Life" - became essential reading for capoeiristas worldwide. He also released music recordings including the LP "Galo Já Cantou" (1985) and the cassette "Os Fundamentos da Malícia" (1992).

Over more than twenty-five years at Escola Nestor Capoeira, he graduated several mestres: his son Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul, and Hugo Amendoim. Contramestres include Eduardo Montanha and Thiago Jamaica.

Nestor''s son, Mestre Jorge Itapuã Beiramar, became a mestre in his own right, a chiropractor and physiotherapist, and creator of the documentary film "Capoeira - Um Passo a Dois" (Capoeira - One Step for Two).

Nestor Capoeira died on March 29, 2025, in Rio de Janeiro, at the age of seventy-nine. He is remembered as a pioneer who brought capoeira to Europe, an intellectual who bridged academic study with practical mastery, and an author whose books introduced countless people worldwide to the art of capoeira.',
  -- Extended content (Portuguese)
  E'Nestor Sezefredo dos Passos Neto nasceu em 29 de setembro de 1946, em Belo Horizonte, Brasil. Aos dezenove anos, em 1965, começou a aprender capoeira com Mestre Leopoldina, o lendário mestre do Rio de Janeiro conhecido por sua síntese das tradições da tiririca carioca e da capoeira baiana.

Em 1968, Nestor entrou no Grupo Senzala no Rio de Janeiro, um dos grupos de capoeira mais influentes da época. Lá treinou com Mestre Preguiça (Walmir Oliveira) e começou a ensinar como contramestre sob a supervisão de Mestre Gato (Fernando C. de Albuquerque) na Universidade Federal do Rio de Janeiro. Em 1969, com apenas vinte e três anos, alcançou a "corda vermelha", o mais alto grau no Senzala.

Em 1971, Nestor tornou-se pioneiro da capoeira na Europa, viajando sozinho aos vinte e cinco anos para ensinar na London School of Contemporary Dance. Isso o tornou provavelmente o primeiro mestre brasileiro a ensinar capoeira regularmente na Europa. Passou três anos em turnê por cidades europeias, espalhando o conhecimento da arte pelo continente. Continuou viajando e ensinando internacionalmente entre 1971 e 1996.

Além de ensinar, Nestor seguiu carreira acadêmica. Formou-se em engenharia pela Universidade Federal do Rio de Janeiro (UFRJ) em 1969. Posteriormente, obteve mestrado pela ECO-UFRJ em 1995, doutorado em Comunicação e Cultura em 2001, e completou pós-doutorado na PUC-São Paulo.

Em 1976, Nestor estrelou o filme brasileiro de aventura "Cordão de Ouro", dirigido por Antônio Carlos da Fontoura. O filme contou com vários mestres de capoeira notáveis, incluindo Mestre Leopoldina que tocou berimbau e cantou, e Mestre Camisa que apareceu pintado de preto. Foi um filme marcante para a representação da capoeira no cinema brasileiro.

Em 1990, após mais de duas décadas no Grupo Senzala, Nestor saiu para estabelecer sua própria escola, a Escola Nestor Capoeira. Começou a ensinar no Planetário da Gávea no Rio de Janeiro em 1992, com aulas diárias das 19h às 22h. Em 2002, a escola mudou-se para o Galpão das Artes Urbanas, do outro lado da rua.

Sua filosofia de ensino era distintiva: alunos que não quisessem buscar graduação não precisavam. Aqueles que não quisessem usar uniforme não tinham obrigação. Essa liberdade refletia sua filosofia mais ampla sobre a capoeira como uma jornada pessoal em vez de uma instituição hierárquica.

Nestor Capoeira escreveu dez livros sobre capoeira, traduzidos para múltiplos idiomas com mais de 120.000 cópias vendidas mundialmente. Suas obras incluem a "Trilogia do Jogador": "Capoeira: Pequeno Manual do Jogador" (1981), "Galo Já Cantou" (1985) e "Capoeira: Os Fundamentos da Malícia" (1992). Suas obras em inglês - "The Little Capoeira Book", "Capoeira: Roots of the Dance-Fight-Game" e "A Street-Smart Song: Capoeira Philosophy and Inner Life" - tornaram-se leitura essencial para capoeiristas do mundo todo. Também lançou gravações musicais incluindo o LP "Galo Já Cantou" (1985) e a fita cassete "Os Fundamentos da Malícia" (1992).

Ao longo de mais de vinte e cinco anos na Escola Nestor Capoeira, graduou vários mestres: seu filho Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul e Hugo Amendoim. Contramestres incluem Eduardo Montanha e Thiago Jamaica.

O filho de Nestor, Mestre Jorge Itapuã Beiramar, tornou-se mestre por mérito próprio, quiropraxista e fisioterapeuta, e criador do documentário "Capoeira - Um Passo a Dois".

Nestor Capoeira faleceu em 29 de março de 2025, no Rio de Janeiro, aos setenta e nove anos. É lembrado como um pioneiro que levou a capoeira para a Europa, um intelectual que fez a ponte entre o estudo acadêmico e a maestria prática, e um autor cujos livros apresentaram inúmeras pessoas ao redor do mundo à arte da capoeira.',
  -- Achievements (English)
  E'- Pioneer of capoeira in Europe (1971), likely the first Brazilian mestre to teach there regularly
- Author of 10 books on capoeira, translated into 8+ languages, with over 120,000 copies sold
- PhD in Communication and Culture (2001), post-doctorate from PUC-São Paulo
- Starred in the film "Cordão de Ouro" (1976)
- Achieved highest rank (corda vermelha) in Grupo Senzala at age 23 (1969)
- Founded Escola Nestor Capoeira (1990), graduating 7 mestres
- Engineering degree from UFRJ (1969)
- Created the "Trilogia do Jogador" (Player''s Trilogy) - foundational capoeira literature
- Released LP "Galo Já Cantou" (1985) and cassette "Os Fundamentos da Malícia" (1992)
- Taught at UFRJ, Planetário da Gávea, and internationally',
  -- Achievements (Portuguese)
  E'- Pioneiro da capoeira na Europa (1971), provavelmente o primeiro mestre brasileiro a ensinar lá regularmente
- Autor de 10 livros sobre capoeira, traduzidos para 8+ idiomas, com mais de 120.000 cópias vendidas
- Doutor em Comunicação e Cultura (2001), pós-doutorado pela PUC-São Paulo
- Estrelou o filme "Cordão de Ouro" (1976)
- Alcançou o mais alto grau (corda vermelha) no Grupo Senzala aos 23 anos (1969)
- Fundou a Escola Nestor Capoeira (1990), graduando 7 mestres
- Engenheiro formado pela UFRJ (1969)
- Criou a "Trilogia do Jogador" - literatura fundamental da capoeira
- Lançou LP "Galo Já Cantou" (1985) e fita cassete "Os Fundamentos da Malícia" (1992)
- Ensinou na UFRJ, Planetário da Gávea e internacionalmente',
  -- Researcher notes (English)
  E'BIRTH DATE: September 29, 1946 - Confirmed by CapoeiraWiki, velhosmestres.com, and multiple sources.

DEATH DATE: March 29, 2025 - Confirmed by velhosmestres.com obituary notice (destaques-78) and tribute articles.

TRAINING TIMELINE:
- 1965: Began training under Mestre Leopoldina in Rio de Janeiro
- 1968: Joined Grupo Senzala; began teaching as contramestre under Mestre Gato at UFRJ
- 1969: Achieved corda vermelha (red cord) - highest rank in Senzala
- 1971-1974: Pioneered capoeira in Europe, starting at London School of Contemporary Dance
- 1976: Starred in film "Cordão de Ouro"
- 1990: Left Grupo Senzala, founded Escola Nestor Capoeira
- 1992: Began teaching at Planetário da Gávea
- 2002: Moved school to Galpão das Artes Urbanas

ACADEMIC CREDENTIALS:
- 1969: Engineering degree, UFRJ
- 1995: Master''s degree, ECO-UFRJ
- 2001: PhD in Communication and Culture, ECO-UFRJ
- Post-doc: PUC-São Paulo

BIBLIOGRAPHY (PRIMARY TITLES):
1. Capoeira: Pequeno Manual do Jogador (1981)
2. Galo Já Cantou (1985 - also LP)
3. Capoeira: Os Fundamentos da Malícia (1992 - also cassette)
4. A Balada de Noivo-da-Vida e Veneno-da-Madrugada (1997 - novel)
5. Capoeira: Roots of the Dance-Fight-Game (2002 - English)
6. A Street-Smart Song: Capoeira Philosophy and Inner Life (2006 - English)
7. The Little Capoeira Book (English version of Pequeno Manual)

FAMILY:
- Son: Jorge Itapuã Beiramar (mestre, filmmaker, physiotherapist)
- Son: Bruno Passos
- Ex-wife: Rosely Fátima Senise Lacreta (1946-2020)

SCHOOL GRADUATES (ENC, 25+ years):
Mestres (red cord): Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul, Hugo Amendoim
Contramestres (brown cord): Eduardo Montanha, Thiago Jamaica

PENDING RELATIONSHIPS (objects not yet in dataset):
- Nestor Capoeira trained_under Preguiça (Walmir Oliveira) at Senzala
- Nestor Capoeira associated_with Gato (Fernando C. de Albuquerque) - supervised his teaching at UFRJ
- Nestor Capoeira member_of Grupo Senzala (1968-1990)
- Nestor Capoeira founded Escola Nestor Capoeira (1990)

DOCUMENTARY INVOLVEMENT:
- 2005: Co-produced "Mestre Leopoldina - A Fina Flor da Malandragem" about his first teacher
- His son Jorge Itapuã Beiramar created "Capoeira - Um Passo a Dois"

DISCOGRAPHY:
- LP "Galo Já Cantou" (1985)
- Cassette "Os Fundamentos da Malícia" (1992)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 29 de setembro de 1946 - Confirmada por CapoeiraWiki, velhosmestres.com e múltiplas fontes.

DATA DE FALECIMENTO: 29 de março de 2025 - Confirmada por nota obituária do velhosmestres.com (destaques-78) e artigos de tributo.

CRONOLOGIA DE TREINAMENTO:
- 1965: Começou a treinar com Mestre Leopoldina no Rio de Janeiro
- 1968: Entrou no Grupo Senzala; começou a ensinar como contramestre sob Mestre Gato na UFRJ
- 1969: Alcançou corda vermelha - mais alto grau no Senzala
- 1971-1974: Pioneiro da capoeira na Europa, começando na London School of Contemporary Dance
- 1976: Estrelou no filme "Cordão de Ouro"
- 1990: Saiu do Grupo Senzala, fundou Escola Nestor Capoeira
- 1992: Começou a ensinar no Planetário da Gávea
- 2002: Mudou escola para Galpão das Artes Urbanas

CREDENCIAIS ACADÊMICAS:
- 1969: Graduação em Engenharia, UFRJ
- 1995: Mestrado, ECO-UFRJ
- 2001: Doutorado em Comunicação e Cultura, ECO-UFRJ
- Pós-doc: PUC-São Paulo

BIBLIOGRAFIA (TÍTULOS PRINCIPAIS):
1. Capoeira: Pequeno Manual do Jogador (1981)
2. Galo Já Cantou (1985 - também LP)
3. Capoeira: Os Fundamentos da Malícia (1992 - também cassete)
4. A Balada de Noivo-da-Vida e Veneno-da-Madrugada (1997 - romance)
5. Capoeira: Roots of the Dance-Fight-Game (2002 - inglês)
6. A Street-Smart Song: Capoeira Philosophy and Inner Life (2006 - inglês)
7. The Little Capoeira Book (versão inglês do Pequeno Manual)

FAMÍLIA:
- Filho: Jorge Itapuã Beiramar (mestre, cineasta, fisioterapeuta)
- Filho: Bruno Passos
- Ex-esposa: Rosely Fátima Senise Lacreta (1946-2020)

GRADUADOS DA ESCOLA (ENC, 25+ anos):
Mestres (corda vermelha): Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul, Hugo Amendoim
Contramestres (corda marrom): Eduardo Montanha, Thiago Jamaica

RELACIONAMENTOS PENDENTES (objetos ainda não no dataset):
- Nestor Capoeira trained_under Preguiça (Walmir Oliveira) no Senzala
- Nestor Capoeira associated_with Gato (Fernando C. de Albuquerque) - supervisionou seu ensino na UFRJ
- Nestor Capoeira member_of Grupo Senzala (1968-1990)
- Nestor Capoeira founded Escola Nestor Capoeira (1990)

ENVOLVIMENTO EM DOCUMENTÁRIOS:
- 2005: Co-produziu "Mestre Leopoldina - A Fina Flor da Malandragem" sobre seu primeiro mestre
- Seu filho Jorge Itapuã Beiramar criou "Capoeira - Um Passo a Dois"

DISCOGRAFIA:
- LP "Galo Já Cantou" (1985)
- Cassete "Os Fundamentos da Malícia" (1992)'
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
