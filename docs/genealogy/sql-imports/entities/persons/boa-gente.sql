-- ============================================================
-- GENEALOGY PERSON: Boa Gente
-- Generated: 2025-12-27
-- ============================================================
-- FULL NAME NOTE: Sources vary between "Vivaldo Conceição Rodrigues"
-- and "Vivaldo Rodrigues Conceição" - using the more common order.
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
  'Vivaldo Conceição Rodrigues',
  'Boa Gente',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-71', 'https://www.lalaue.com/learn-capoeira/mestre-boa-gente', 'https://nossa-tribo.com/mestre-boa-gente/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Boa Gente trained in the Angola tradition under Mestre Gato Preto at the Escola Baiana de Capoeira Angola, but his martial arts foundation extends far beyond capoeira. His training under vale-tudo champion Valdemar Santana ("Leopardo Negro") made him a formidable fighter who blended capoeira''s movement with combat effectiveness. He later studied Taekwondo with Professor Lee. His teaching style integrates capoeira with elements of other martial arts, creating what sources describe as "a blend of capoeira with oriental martial arts". He is an active member of ABCA (Associação Brasileira de Capoeira Angola), affirming his Angola roots despite his eclectic martial arts background.',
  E'Boa Gente treinou na tradição Angola sob Mestre Gato Preto na Escola Baiana de Capoeira Angola, mas sua formação em artes marciais vai muito além da capoeira. Seu treinamento sob o campeão de vale-tudo Valdemar Santana ("Leopardo Negro") o tornou um lutador formidável que mesclava o movimento da capoeira com eficácia de combate. Posteriormente estudou Taekwondo com Professor Lee. Seu estilo de ensino integra a capoeira com elementos de outras artes marciais, criando o que fontes descrevem como "uma mescla de capoeira com artes marciais orientais". É membro ativo da ABCA (Associação Brasileira de Capoeira Angola), afirmando suas raízes na Angola apesar de seu eclético histórico em artes marciais.',
  -- Life dates
  1945,
  'exact'::genealogy.date_precision,
  'Ibicaraí, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Vivaldo Conceição Rodrigues was born on May 17, 1945, in Ibicaraí, in the southern region of Bahia. Capoeira Angola captured his heart in 1956 in Ilhéus, during the celebration of Saint Sebastian, patron saint of the city. Watching mestres João Grande, João Pequeno, and Antônio Cabeceiro play capoeira sparked something in the eleven-year-old boy.

There were no capoeira schools in Ilhéus at the time. Boa Gente learned in the traditional manner—watching others in the roda and applying what he saw, the same way capoeira had been transmitted for generations. His first teacher was Mestre Antônio Cabeceiro, a student of Mestre Pastinha, who taught him on the streets of Ilhéus.

Fate brought him to Salvador, searching for his brother Dominguinhos. In the capital, he found his way to the Escola Baiana de Capoeira Angola at Mirante do Calabar, where he trained under Mestre Gato Preto for many years, from 1960 to 1970. Photographs from December 1963 show a young Boa Gente playing pandeiro at Gato Preto''s roda during the Festa da Boa Viagem at Dona Pompilha''s school. Decades later, it was Boa Gente who helped identify the people in these historic photographs for the Velhos Mestres archive.

When Valdemar Santana, the legendary "Leopardo Negro" (Black Leopard) and Brazilian vale-tudo champion, visited the Escola Baiana de Capoeira Angola, he was so impressed by Boa Gente that he invited him to train at his MMA academy. The intensity and dedication that had served Boa Gente in capoeira translated directly to fighting. In 1974, he became the MMA champion of Bahia.

His martial arts journey didn''t stop there. In 1972, while at Casa de Pedra watching a presentation by the Sons of Oba group, Professor Lee invited him to train Korean Karate. Together, they co-founded the Taekwondo Association of Bahia.

After his time with Gato Preto, Boa Gente sought to deepen his understanding of Capoeira Regional. He went to train at Mestre Bimba''s academy—by then under the supervision of Mestre Vermelho 27, as Bimba had departed for Goiânia. Vermelho 27 provided the rigorous training Boa Gente sought, and afterwards invited him to collaborate in preserving Bimba''s legacy after the mestre''s death in 1974.

In 1981, Boa Gente founded the Associação de Capoeira Mestre Boa Gente. He dedicated himself to social work in the neighborhoods of Vale das Pedrinhas, Nordeste de Amaralina, and Santa Cruz. For nearly twenty years, he taught at the Colégio São Paulo, one of the most prestigious educational institutions in Bahia, becoming a pioneer in teaching capoeira to children and adolescents in private schools.

His reputation spread internationally. He conducted workshops across Brazil, the United States (New York, Los Angeles, San Francisco, Las Vegas), Europe (Lisbon), and Australia. In 1993, he taught actor Mark Dacascos for the film "Only the Strong", contributing to what remains the only Hollywood film showcasing capoeira from beginning to end. In 2000, he participated in the celebrations of the 500 years of Brazil in Porto Seguro alongside his old teacher Mestre Gato Preto.

Today, Mestre Boa Gente remains active, teaching and supervising classes daily in Vale das Pedrinhas. He is one of the main promoters of Capoeira Angola and an active member of the ABCA (Associação Brasileira de Capoeira Angola), the most important representative institution of Capoeira Angola in Brazil.',
  -- bio_pt
  E'Vivaldo Conceição Rodrigues nasceu em 17 de maio de 1945, em Ibicaraí, no sul da Bahia. A Capoeira Angola capturou seu coração em 1956 em Ilhéus, durante a celebração de São Sebastião, padroeiro da cidade. Ver os mestres João Grande, João Pequeno e Antônio Cabeceiro jogando capoeira acendeu algo no menino de onze anos.

Não havia escolas de capoeira em Ilhéus naquela época. Boa Gente aprendeu da maneira tradicional—observando os outros na roda e aplicando o que via, da mesma forma que a capoeira havia sido transmitida por gerações. Seu primeiro professor foi Mestre Antônio Cabeceiro, aluno de Mestre Pastinha, que o ensinou nas ruas de Ilhéus.

O destino o trouxe a Salvador, em busca de seu irmão Dominguinhos. Na capital, encontrou seu caminho até a Escola Baiana de Capoeira Angola no Mirante do Calabar, onde treinou sob Mestre Gato Preto por muitos anos, de 1960 a 1970. Fotografias de dezembro de 1963 mostram um jovem Boa Gente tocando pandeiro na roda de Gato Preto durante a Festa da Boa Viagem na escolinha de Dona Pompilha. Décadas depois, foi Boa Gente quem ajudou a identificar as pessoas nessas fotografias históricas para o arquivo Velhos Mestres.

Quando Valdemar Santana, o lendário "Leopardo Negro" e campeão brasileiro de vale-tudo, visitou a Escola Baiana de Capoeira Angola, ficou tão impressionado com Boa Gente que o convidou para treinar em sua academia de MMA. A intensidade e dedicação que haviam servido Boa Gente na capoeira se traduziram diretamente para a luta. Em 1974, tornou-se campeão de MMA da Bahia.

Sua jornada nas artes marciais não parou por aí. Em 1972, enquanto estava na Casa de Pedra assistindo a uma apresentação do grupo Filhos de Oba, Professor Lee o convidou para treinar Karatê Coreano. Juntos, co-fundaram a Associação de Taekwondo da Bahia.

Após seu tempo com Gato Preto, Boa Gente buscou aprofundar seu entendimento da Capoeira Regional. Foi treinar na academia de Mestre Bimba—então sob supervisão de Mestre Vermelho 27, já que Bimba havia partido para Goiânia. Vermelho 27 proporcionou o treinamento rigoroso que Boa Gente buscava, e depois o convidou a colaborar na preservação do legado de Bimba após a morte do mestre em 1974.

Em 1981, Boa Gente fundou a Associação de Capoeira Mestre Boa Gente. Dedicou-se ao trabalho social nos bairros do Vale das Pedrinhas, Nordeste de Amaralina e Santa Cruz. Por quase vinte anos, ensinou no Colégio São Paulo, uma das mais prestigiadas instituições educacionais da Bahia, tornando-se pioneiro no ensino de capoeira para crianças e adolescentes em escolas particulares.

Sua reputação se espalhou internacionalmente. Conduziu workshops pelo Brasil, Estados Unidos (Nova York, Los Angeles, São Francisco, Las Vegas), Europa (Lisboa) e Austrália. Em 1993, ensinou o ator Mark Dacascos para o filme "Only the Strong", contribuindo para o que permanece o único filme de Hollywood mostrando capoeira do início ao fim. Em 2000, participou das celebrações dos 500 anos do Brasil em Porto Seguro ao lado de seu antigo professor Mestre Gato Preto.

Hoje, Mestre Boa Gente permanece ativo, ensinando e supervisionando aulas diariamente no Vale das Pedrinhas. É um dos principais promotores da Capoeira Angola e membro ativo da ABCA (Associação Brasileira de Capoeira Angola), a mais importante instituição representativa da Capoeira Angola no Brasil.',
  -- achievements_en
  E'MMA champion of Bahia (1974); Co-founder of Taekwondo Association of Bahia (1972); Founded Associação de Capoeira Mestre Boa Gente (1981); Nearly 20 years teaching at Colégio São Paulo; Trained Mark Dacascos for "Only the Strong" (1993); International workshops in USA, Europe, Australia; Active member of ABCA; Pioneer in teaching capoeira to children in schools; Participated in Brazil 500 years celebrations in Porto Seguro (2000)',
  -- achievements_pt
  E'Campeão de MMA da Bahia (1974); Co-fundador da Associação de Taekwondo da Bahia (1972); Fundou a Associação de Capoeira Mestre Boa Gente (1981); Quase 20 anos ensinando no Colégio São Paulo; Treinou Mark Dacascos para "Only the Strong" (1993); Workshops internacionais em EUA, Europa, Austrália; Membro ativo da ABCA; Pioneiro no ensino de capoeira para crianças em escolas; Participou das celebrações de 500 anos do Brasil em Porto Seguro (2000)',
  -- Researcher notes (English)
  E'FULL NAME: Vivaldo Conceição Rodrigues (or Vivaldo Rodrigues Conceição - sources vary on order)

BIRTH DATE: May 17, 1945 (exact, multiple sources confirm)

BIRTHPLACE: Ibicaraí, southern Bahia (not Salvador)

TEACHERS:
- Mestre Antônio Cabeceiro (~1956, Ilhéus) - student of Pastinha, taught on streets
- Mestre Gato Preto (1960-1970, Salvador) - at Escola Baiana de Capoeira Angola, Mirante do Calabar
- Mestre Vermelho 27 (post-1970) - at Bimba''s academy (CCFR)
- Valdemar Santana "Leopardo Negro" (~1970s) - MMA/vale-tudo training
- Professor Lee (1972) - Taekwondo training

STUDENTS:
- Mestre Pintor (Paulo César Leite dos Santos) - trained during his Bahia period, as teenager
- Students at Vale das Pedrinhas, Nordeste de Amaralina, Santa Cruz
- Students at Colégio São Paulo (~20 years)

MEDIA APPEARANCES:
- Dec 31, 1963: Photographed by Helinä Rautavaara at Festa da Boa Viagem, playing pandeiro
- 1987: I Batismo de Capoeira Ajagunã de Palmares (Ilha de Santa Catarina)
- 1993: "Only the Strong" film - trained Mark Dacascos
- 2000: Brazil 500 years celebrations in Porto Seguro

RELATIONSHIPS TO BIMBA PRESERVATION:
After Mestre Bimba''s death (Feb 1974), Boa Gente was part of group collaborating with Vermelho 27 to preserve academy: alongside Ferro Velho (Mestre Durval), Vermelho Boxel, Mestre Bahia, and Mestre Bando.

BROTHER: Dominguinhos (capoeirista, lived in Salvador)

ORGANIZATIONS:
- Associação de Capoeira Mestre Boa Gente (founded 1981)
- Co-founder, Associação de Taekwondo da Bahia (1972)
- Active member, ABCA (Associação Brasileira de Capoeira Angola)

TEACHING LOCATIONS IN SALVADOR:
- Vale das Pedrinhas (current)
- Nordeste de Amaralina
- Santa Cruz
- Colégio São Paulo (~20 years)

INTERNATIONAL TEACHING: USA (NY, LA, SF, Las Vegas), Portugal (Lisbon), Australia',
  -- Researcher notes (Portuguese)
  E'NOME COMPLETO: Vivaldo Conceição Rodrigues (ou Vivaldo Rodrigues Conceição - fontes variam na ordem)

DATA DE NASCIMENTO: 17 de maio de 1945 (exata, múltiplas fontes confirmam)

LOCAL DE NASCIMENTO: Ibicaraí, sul da Bahia (não Salvador)

MESTRES:
- Mestre Antônio Cabeceiro (~1956, Ilhéus) - aluno de Pastinha, ensinou nas ruas
- Mestre Gato Preto (1960-1970, Salvador) - na Escola Baiana de Capoeira Angola, Mirante do Calabar
- Mestre Vermelho 27 (pós-1970) - na academia de Bimba (CCFR)
- Valdemar Santana "Leopardo Negro" (~anos 1970) - treinamento de MMA/vale-tudo
- Professor Lee (1972) - treinamento de Taekwondo

ALUNOS:
- Mestre Pintor (Paulo César Leite dos Santos) - treinou durante seu período na Bahia, ainda adolescente
- Alunos no Vale das Pedrinhas, Nordeste de Amaralina, Santa Cruz
- Alunos no Colégio São Paulo (~20 anos)

APARIÇÕES NA MÍDIA:
- 31 dez 1963: Fotografado por Helinä Rautavaara na Festa da Boa Viagem, tocando pandeiro
- 1987: I Batismo de Capoeira Ajagunã de Palmares (Ilha de Santa Catarina)
- 1993: Filme "Only the Strong" - treinou Mark Dacascos
- 2000: Celebrações de 500 anos do Brasil em Porto Seguro

RELAÇÃO COM PRESERVAÇÃO DO LEGADO DE BIMBA:
Após a morte de Mestre Bimba (fev 1974), Boa Gente fez parte do grupo colaborando com Vermelho 27 para preservar a academia: ao lado de Ferro Velho (Mestre Durval), Vermelho Boxel, Mestre Bahia e Mestre Bando.

IRMÃO: Dominguinhos (capoeirista, morava em Salvador)

ORGANIZAÇÕES:
- Associação de Capoeira Mestre Boa Gente (fundada 1981)
- Co-fundador, Associação de Taekwondo da Bahia (1972)
- Membro ativo, ABCA (Associação Brasileira de Capoeira Angola)

LOCAIS DE ENSINO EM SALVADOR:
- Vale das Pedrinhas (atual)
- Nordeste de Amaralina
- Santa Cruz
- Colégio São Paulo (~20 anos)

ENSINO INTERNACIONAL: EUA (NY, LA, SF, Las Vegas), Portugal (Lisboa), Austrália'
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
