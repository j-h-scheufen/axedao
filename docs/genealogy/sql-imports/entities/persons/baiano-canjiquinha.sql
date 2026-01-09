-- ============================================================
-- GENEALOGY PERSON: Baiano (Canjiquinha)
-- Generated: 2026-01-03
-- ============================================================
-- Uses apelido_context 'Canjiquinha' to distinguish from other
-- mestres named Baiano.
-- ============================================================
-- BIRTH DATE: August 30, 1945 (exact) per capoeiraengenho.wordpress.com
-- (discrepancy: user notes say ~1944, but official group site says 1945)
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
  'Edvaldo dos Santos Reis',
  'Baiano',
  'Canjiquinha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeiraengenho.wordpress.com/mestres-cmestres/m-baiano/', 'https://capoeira.iphan.gov.br/grupo/infor/69']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Trained in both Angola (under Canjiquinha) and Regional (completed Bimba''s course 1962). As a professor of folk dances and Afro Dance graduate from Rio Academy, integrated capoeira with broader Afro-Brazilian dance traditions. His group Capoeira Engenho teaches a synthesis approach drawing from both traditions.',
  E'Treinado tanto em Angola (sob Canjiquinha) quanto em Regional (completou o curso de Bimba em 1962). Como professor de danças folclóricas e graduado em Dança Afro pela Academia Rio, integrou a capoeira com tradições mais amplas de dança afro-brasileira. Seu grupo Capoeira Engenho ensina uma abordagem de síntese extraindo de ambas as tradições.',
  -- Life dates
  1945,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio)
  E'Edvaldo dos Santos Reis was born on August 30, 1945, in Salvador, Bahia, the son of Jacinto José dos Reis and Alice Apostola dos Santos. At just ten years old, he began learning capoeira from Washington Bruno da Silva—Mestre Canjiquinha, known as "a alegria da capoeira" (the joy of capoeira). This seven-year apprenticeship (1955-1962) under one of capoeira''s most innovative and beloved mestres would shape his entire life.

In 1962, Edvaldo also completed a Regional Capoeira course administered by Mestre Bimba in Salvador, expanding his technical repertoire beyond his Angola foundation. That same year, he entered military service as a fuzileiro naval (naval marine) in Bahia and later transferred to Rio de Janeiro—a move that would define the trajectory of his life''s work.

While in Rio de Janeiro, Edvaldo pursued formal dance education, graduating in Afro Dance from Academia Rio. This training enabled him to understand capoeira within the broader context of African diaspora movement traditions and positioned him as both a martial artist and a cultural educator.

On January 1, 1970, Edvaldo founded the Associação de Capoeira Engenho (ACE) in the then-state of Guanabara (now Rio de Janeiro). The organization became a pioneering institution in the post-capital federal era, actively participating in the structuring of capoeira''s legal and sporting framework. Edvaldo contributed directly to drafting the bylaws and regulations for capoeira through the Confederação Brasileira de Pugilismo in Rio de Janeiro.

His performance career took him across the globe. As a professor of folk dances, he participated in show groups including Rio Antigo, Palmares, Postais da Bahia, and Brasil Canta e Dança. As a cultural promoter, he brought capoeira performances to more than 30 countries. One of his most celebrated moments came during a New Year''s celebration at the palace of King Hassan II of Morocco, where he received a standing ovation from the monarch himself.

As a composer, Edvaldo created numerous songs that were adopted in capoeira rodas throughout Brazil and abroad, though specific titles remain undocumented in available sources.

In Rio de Janeiro, Edvaldo developed intensive work with samba schools, particularly the famous Salgueiro, for more than 15 years. His activities blended capoeira with Afro dance instruction. He also worked at SESC Tijuca for over 20 years, developing programs for seniors, children, teenagers, adolescents, and university students.

In 1995, ACE began work in the Costa Barros neighborhood, gaining community recognition by 1996. The organization has grown into a major cultural institution with 8 mestres, 20 contra-mestres, and 40 instructors. It has expanded to multiple Brazilian states (Bahia, São Paulo, Alagoas) and international locations (Italy, Spain, Germany, Greece, Holland, Argentina).

In 1996, Edvaldo received the title of Capoeira Master with the White Cord—representing 30 years as a Capoeira Master—from the Federação de Capoeira do Estado do Rio de Janeiro.

At the VI Rede Capoeira event in January 2025 (January 22-25, at Doca 1, Polo de Economia Criativa, Comércio, Salvador), Mestre Baiano—now over 80 years old—received the Sankofa trophy as a "herói popular" (popular hero). He was honored alongside fellow octogenarian mestres Virgílio da Fazenda Grande, Boa Gente, Fernando de Saubara, and Nô. The Sankofa symbol—an African bird with its head turned backwards—represents returning to the past to resignify the present and build the future.

His son, Antonio Marcos dos A. Reis (Mestre Grandão), continues his legacy, having trained under his father from childhood and now coordinating capoeira activities throughout Camaçari, Bahia.',
  -- bio_pt
  E'Edvaldo dos Santos Reis nasceu em 30 de agosto de 1945, em Salvador, Bahia, filho de Jacinto José dos Reis e Alice Apostola dos Santos. Com apenas dez anos de idade, começou a aprender capoeira com Washington Bruno da Silva—Mestre Canjiquinha, conhecido como "a alegria da capoeira". Este aprendizado de sete anos (1955-1962) sob um dos mestres mais inovadores e amados da capoeira moldaria toda a sua vida.

Em 1962, Edvaldo também completou um curso de Capoeira Regional administrado por Mestre Bimba em Salvador, expandindo seu repertório técnico além de sua base de Angola. No mesmo ano, entrou no serviço militar como fuzileiro naval na Bahia e depois foi transferido para o Rio de Janeiro—uma mudança que definiria a trajetória do trabalho de sua vida.

Enquanto estava no Rio de Janeiro, Edvaldo buscou educação formal em dança, graduando-se em Dança Afro pela Academia Rio. Este treinamento permitiu que ele entendesse a capoeira dentro do contexto mais amplo das tradições de movimento da diáspora africana e o posicionou tanto como artista marcial quanto como educador cultural.

Em 1º de janeiro de 1970, Edvaldo fundou a Associação de Capoeira Engenho (ACE) no então estado da Guanabara (atual Rio de Janeiro). A organização tornou-se uma instituição pioneira na era pós-capital federal, participando ativamente da estruturação do enquadramento legal e esportivo da capoeira. Edvaldo contribuiu diretamente para a redação dos estatutos e regulamentos da capoeira através da Confederação Brasileira de Pugilismo no Rio de Janeiro.

Sua carreira de apresentações o levou ao redor do mundo. Como professor de danças folclóricas, participou de grupos de show incluindo Rio Antigo, Palmares, Postais da Bahia e Brasil Canta e Dança. Como promotor cultural, levou espetáculos de capoeira para mais de 30 países. Um de seus momentos mais celebrados veio durante uma celebração de Ano Novo no palácio do Rei Hassan II do Marrocos, onde recebeu uma ovação de pé do próprio monarca.

Como compositor, Edvaldo criou numerosas músicas que foram adotadas em rodas de capoeira por todo o Brasil e no exterior, embora títulos específicos permaneçam sem documentação nas fontes disponíveis.

No Rio de Janeiro, Edvaldo desenvolveu trabalho intenso com escolas de samba, particularmente a famosa Salgueiro, por mais de 15 anos. Suas atividades mesclavam capoeira com instrução de dança afro. Ele também trabalhou no SESC Tijuca por mais de 20 anos, desenvolvendo programas para idosos, crianças, adolescentes e estudantes universitários.

Em 1995, a ACE começou um trabalho no bairro de Costa Barros, ganhando reconhecimento das comunidades em 1996. A organização cresceu para se tornar uma grande instituição cultural com 8 mestres, 20 contra-mestres e 40 instrutores. Expandiu-se para múltiplos estados brasileiros (Bahia, São Paulo, Alagoas) e localidades internacionais (Itália, Espanha, Alemanha, Grécia, Holanda, Argentina).

Em 1996, Edvaldo recebeu o título de Mestre de Capoeira com a Corda Branca—representando 30 anos como Mestre de Capoeira—da Federação de Capoeira do Estado do Rio de Janeiro.

No VI Rede Capoeira em janeiro de 2025 (22-25 de janeiro, na Doca 1, Polo de Economia Criativa, Comércio, Salvador), Mestre Baiano—agora com mais de 80 anos—recebeu o troféu Sankofa como "herói popular". Foi homenageado ao lado dos mestres octogenários Virgílio da Fazenda Grande, Boa Gente, Fernando de Saubara e Nô. O símbolo Sankofa—um pássaro africano com a cabeça voltada para trás—representa retornar ao passado para ressignificar o presente e construir o futuro.

Seu filho, Antonio Marcos dos A. Reis (Mestre Grandão), continua seu legado, tendo treinado sob seu pai desde a infância e agora coordenando atividades de capoeira por todo Camaçari, Bahia.',
  -- achievements
  E'1955: Began training under Mestre Canjiquinha in Salvador (age 10)
1962: Completed Mestre Bimba''s Regional Capoeira course in Salvador
1962: Entered military service as fuzileiro naval in Bahia, later Rio de Janeiro
~1960s: Graduated in Afro Dance from Academia Rio, Rio de Janeiro
1970: Founded Associação de Capoeira Engenho (January 1)
~1970s: Active participation in drafting capoeira bylaws with Confederação Brasileira de Pugilismo
~1970s-1990s: Performed capoeira shows in 30+ countries
~1980s: Received standing ovation from King Hassan II of Morocco at New Year''s palace celebration
1981-1996: Worked with Salgueiro samba school (15+ years)
~1990s-2010s: Taught at SESC Tijuca (20+ years)
1996: Received title of Capoeira Master with White Cord (30 years as mestre) from FCERJ
2025: Received Sankofa trophy as "popular hero" at VI Rede Capoeira (January)',
  -- achievements_pt
  E'1955: Iniciou treinamento com Mestre Canjiquinha em Salvador (10 anos)
1962: Completou o curso de Capoeira Regional de Mestre Bimba em Salvador
1962: Entrou no serviço militar como fuzileiro naval na Bahia, depois Rio de Janeiro
~1960s: Graduou-se em Dança Afro pela Academia Rio, Rio de Janeiro
1970: Fundou a Associação de Capoeira Engenho (1º de janeiro)
~1970s: Participação ativa na elaboração dos estatutos da capoeira com a Confederação Brasileira de Pugilismo
~1970s-1990s: Apresentou espetáculos de capoeira em 30+ países
~1980s: Recebeu ovação de pé do Rei Hassan II do Marrocos em celebração de Ano Novo no palácio
1981-1996: Trabalhou com a escola de samba Salgueiro (15+ anos)
~1990s-2010s: Ensinou no SESC Tijuca (20+ anos)
1996: Recebeu título de Mestre de Capoeira com Corda Branca (30 anos como mestre) da FCERJ
2025: Recebeu troféu Sankofa como "herói popular" no VI Rede Capoeira (janeiro)',
  -- notes (researcher metadata)
  E'BIRTH DATE: August 30, 1945 per capoeiraengenho.wordpress.com. User input suggested ~1944, but official group site confirms 1945.

PARENTS: Jacinto José dos Reis and Alice Apostola dos Santos

TEACHERS:
- Mestre Canjiquinha (Washington Bruno da Silva) - primary teacher, 1955-1962, Salvador
- Mestre Bimba (Manoel dos Reis Machado) - Regional course, 1962, Salvador

STUDENTS (notable):
- Mestre Grandão (Antonio Marcos dos A. Reis) - son, trained from childhood
- Mestre Chaminé (documented on Capoeira Engenho website)
- Multiple mestres, contra-mestres through ACE organization

APELIDO: "Baiano" - common in capoeira for practitioners from Bahia who settle elsewhere; uses apelido_context ''Canjiquinha'' to distinguish from other Baianos (there are multiple mestres named Baiano)

MILITARY SERVICE: Fuzileiro naval (Brazilian Marine) in Bahia and Rio de Janeiro

ORGANIZATION STATS (as of 2017 IPHAN registry):
- 8 mestres, 20 contra-mestres, 40 instructors, 5 formally trained students
- Registered as "Ponto de Cultura" (official cultural recognition)
- Headquarters: Rua Cândido Macedo Júnior, 8, Costa Barros, Rio de Janeiro (CEP 21532-190)
- CNPJ: 03.932.540/0001-00 (registered 30/06/2000)

VI REDE CAPOEIRA 2025 HONOREES:
- Mestre Virgílio da Fazenda Grande
- Mestre Boa Gente (Vivaldo Conceição Rodrigues)
- Mestre Fernando de Saubara (Antônio Fernando da Silva)
- Mestre Baiano (Edvaldo dos Santos Reis) - this profile
- Mestre Nô (Norival Moreira de Oliveira)
Event dates: January 22-25, 2025, Doca 1, Polo de Economia Criativa, Salvador',
  -- notes_pt
  E'DATA DE NASCIMENTO: 30 de agosto de 1945 conforme capoeiraengenho.wordpress.com. Entrada do usuário sugeriu ~1944, mas site oficial do grupo confirma 1945.

PAIS: Jacinto José dos Reis e Alice Apostola dos Santos

MESTRES:
- Mestre Canjiquinha (Washington Bruno da Silva) - mestre principal, 1955-1962, Salvador
- Mestre Bimba (Manoel dos Reis Machado) - curso Regional, 1962, Salvador

ALUNOS (notáveis):
- Mestre Grandão (Antonio Marcos dos A. Reis) - filho, treinou desde a infância
- Mestre Chaminé (documentado no site Capoeira Engenho)
- Múltiplos mestres, contra-mestres através da organização ACE

APELIDO: "Baiano" - comum na capoeira para praticantes da Bahia que se estabelecem em outros lugares; usa apelido_context ''Canjiquinha'' para distinguir de outros Baianos (existem múltiplos mestres chamados Baiano)

SERVIÇO MILITAR: Fuzileiro naval na Bahia e Rio de Janeiro

ESTATÍSTICAS DA ORGANIZAÇÃO (conforme registro IPHAN 2017):
- 8 mestres, 20 contra-mestres, 40 instrutores, 5 alunos formalmente treinados
- Registrado como "Ponto de Cultura" (reconhecimento cultural oficial)
- Sede: Rua Cândido Macedo Júnior, 8, Costa Barros, Rio de Janeiro (CEP 21532-190)
- CNPJ: 03.932.540/0001-00 (registrado 30/06/2000)

HOMENAGEADOS VI REDE CAPOEIRA 2025:
- Mestre Virgílio da Fazenda Grande
- Mestre Boa Gente (Vivaldo Conceição Rodrigues)
- Mestre Fernando de Saubara (Antônio Fernando da Silva)
- Mestre Baiano (Edvaldo dos Santos Reis) - este perfil
- Mestre Nô (Norival Moreira de Oliveira)
Datas do evento: 22-25 de janeiro de 2025, Doca 1, Polo de Economia Criativa, Salvador'
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
