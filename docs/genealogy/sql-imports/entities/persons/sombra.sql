-- ============================================================
-- GENEALOGY PERSON: Sombra
-- Generated: 2026-01-12
-- ============================================================
-- BIRTH YEAR: Sources conflict between 1941 and 1942.
-- - velhosmestres.com: February 6, 1941
-- - senzaladesantos.nl: February 6, 1941
-- - londonschoolofcapoeira.com: February 6, 1941
-- - capoeiraparisfrancesenzaladesantos.wordpress.com: February 6, 1942
-- - zumbicapoeira.wordpress.com: February 6, 1942
-- - diariodolitoral.com.br: 1941
-- - January 2024 (5º Rede Capoeira): 82 years old → born 1941 or 1942
-- February 6, 1941 is the majority position from most reliable sources.
-- Using 1941 with 'year' precision.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Roberto Teles de Oliveira',
  'Sombra',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-56', 'https://www.lalaue.com/capoeira-schools/senzala-de-santos/', 'https://www.londonschoolofcapoeira.com/about-the-school/origins', 'https://senzaladesantos.nl/mestre-sombra/']::text[],
  -- Capoeira-specific
  'contemporanea'::genealogy.style,
  E'Mestre Sombra practices and teaches a style that evolved from the Bahian roots brought by Mestre Olívio Bispo dos Santos to the port city of Santos in the 1960s. His Senzala de Santos lineage emphasizes individual development of each student and the philosophy "At Senzala we are all aspects of the same face" (Na Senzala todos somos aspectos da mesma face). The style maintains Bahian rhythms and techniques while adapting to competitive formats introduced in the 1987 Jogos Abertos. He has trained thousands of students who carry his methodology to groups across Europe, Africa, and the Americas.',
  E'Mestre Sombra pratica e ensina um estilo que evoluiu das raízes baianas trazidas por Mestre Olívio Bispo dos Santos para a cidade portuária de Santos na década de 1960. Sua linhagem Senzala de Santos enfatiza o desenvolvimento individual de cada aluno e a filosofia "Na Senzala todos somos aspectos da mesma face". O estilo mantém os ritmos e técnicas baianas enquanto se adapta aos formatos competitivos introduzidos nos Jogos Abertos de 1987. Ele treinou milhares de alunos que levam sua metodologia para grupos em toda a Europa, África e Américas.',
  -- Life dates
  1941,
  'year'::genealogy.date_precision,
  'Santa Rosa de Lima, Sergipe, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Roberto Teles de Oliveira, known as Mestre Sombra, was born on February 6, 1941 in Santa Rosa de Lima, a small municipality in Sergipe state in northeastern Brazil. Born into a family of small merchants, he would later discover that his father had been enslaved—connecting him personally to capoeira''s historical roots as a form of African resistance in Brazil.

As a young boy between the ages of 7 and 10, Sombra learned his first capoeira movements, though his formal training would not begin until much later. He initially worked in construction in Aracaju, Sergipe''s capital, before making a significant life change in 1962 when he migrated 1,800 kilometers south to Santos, the major port city of São Paulo state.

In 1963, Sombra''s brother introduced him to a group of capoeiristas meeting in Itapema (now Vicente de Carvalho, in Guarujá municipality), on the other side of the Santos estuary. There he met Mestre Olívio Bispo dos Santos, a Bahian retired from the coffee baggers'' union (sindicato dos ensacadores) who was about 60 years old at the time. The group, called "Bahia do Berimbau," met in the backyard of a house with twelve older men, and young Sombra was the only youth among them. Upon seeing Sombra play capoeira, Mestre Olívio declared: "You know capoeira, you just need to acquire behavior" (Você sabe a capoeira, precisa somente adquirir comportamento).

The group met on Sundays, and Sombra dedicated himself to learning under Mestre Olívio''s guidance. In 1968, he began employment as a dock worker at Companhia Docas de Santos, where he would remain until his retirement in 1993.

When Mestre Olívio passed away in 1972, Sombra assumed leadership of the group and transformed it into the Associação de Capoeira Zumbi, naming it after the legendary leader of Quilombo dos Palmares. In 1974, the association registered with the Federação Paulista de Capoeira and changed its name to "Senzala"—the Portuguese word for slave quarters on plantations. In 1975, Mestre Sombra secured a permanent location for the academy at Rua Brás Cubas 227 in Santos, where it remains to this day. (Note: The academy formally opened at this location in 1978 according to some sources.)

Mestre Sombra played an instrumental role in introducing capoeira as a competitive sport, actively participating in the inclusion of capoeira as a modality in the Jogos Abertos (Open Games) in 1987. This helped legitimize capoeira within São Paulo''s sporting establishment.

The Associação de Capoeira Senzala de Santos has trained over 5,000 students over its 50-year history, producing multiple generations of professors, contra-mestres, and mestres recognized by both the Federação Paulista de Capoeira and the Confederação Brasileira de Capoeira. As his students opened their own academies throughout Santos and the Baixada Santista region, Mestre Sombra became president of the Liga Santista de Capoeira (Santos Capoeira League). He also served as Coordinator of the Conselho da Comunidade Negra de Santos (Black Community Council of Santos).

His students have spread capoeira to more than 15 countries worldwide, including Spain, USA, Greece, Netherlands, England, Wales, France, Norway, and across Africa (Kenya, including Nairobi and Mombasa). Notable cities where Senzala de Santos alumni teach include Boston, Berlin, Düsseldorf, Munich, Paris, Barcelona, San Francisco, Oslo, and Manchester.

Among his most prominent students are Mestra Silvia Bazzarelli, who opened the first established capoeira school in the United Kingdom (London School of Capoeira) in 1988; Mestre Marcos dos Santos, who joined the London school in 1992 and received his mestre belt in 2006; Mestre Beija-Flor, who has collaborated with Sombra on recordings; Mestre Bahia, who recorded a CD with him in Santos; and Mestre Valtinho, his first contra-mestre.

After retiring from the Santos docks in 1993, Mestre Sombra opened "Bazar Senzala," a retail shop selling capoeira clothing and accessories in downtown Santos.

Since 2015, Mestre Sombra has promoted the International Capoeira Meetings in the city of Santos every two years, bringing renowned masters from Bahia and around the world to participate. In 2016, he recorded the album "Todos a Cantar" (29 minutes), featuring live performances with masters and teachers from the Senzala de Santos community.

In January 2024, at 82 years old, Mestre Sombra was among 14 octogenarian capoeira masters honored at the 5º Rede Capoeira event in Salvador, receiving a Sankofa sculpture—a bird symbolizing "the necessity of knowing the past to develop a better future." He was recognized alongside legendary figures including Mestre João Grande, Mestre Acordeon, Mestre Boca Rica, Mestre Brandão, and Mestre Felipe de Santo Amaro.

A 1983 photograph at Mestre Suassuna''s academy in São Paulo captures Mestre Sombra alongside Mestres Gato Preto, Canjiquinha, Papo Amarelo, João Pequeno, and other prominent figures—testifying to his acceptance among the giants of capoeira.

At 83 years old (2025), Mestre Sombra continues as technical supervisor of FUPES (Fundação Pró-Esporte de Santos) and mentors Santos'' competitive capoeira team, which swept the 67th Jogos Regionais with eight gold medals. He emphasizes that success comes from "trabalho, treinamento e afinco" (work, training, and dedication) rather than natural talent, and cautions that "many are playing without following" the fundamental regulations that preserve capoeira''s spirit.',
  -- bio_pt
  E'Roberto Teles de Oliveira, conhecido como Mestre Sombra, nasceu em 6 de fevereiro de 1941 em Santa Rosa de Lima, um pequeno município no estado de Sergipe, no nordeste do Brasil. Nascido em uma família de pequenos comerciantes, ele descobriria mais tarde que seu pai havia sido escravizado—conectando-o pessoalmente às raízes históricas da capoeira como forma de resistência africana no Brasil.

Quando menino, entre 7 e 10 anos de idade, Sombra aprendeu seus primeiros movimentos de capoeira, embora seu treinamento formal só começasse muito mais tarde. Inicialmente trabalhou na construção civil em Aracaju, capital de Sergipe, antes de fazer uma mudança significativa em sua vida em 1962, quando migrou 1.800 quilômetros para o sul até Santos, a principal cidade portuária do estado de São Paulo.

Em 1963, o irmão de Sombra o apresentou a um grupo de capoeiristas que se reunia em Itapema (hoje Vicente de Carvalho, no município de Guarujá), do outro lado do estuário de Santos. Lá ele conheceu Mestre Olívio Bispo dos Santos, um baiano aposentado do sindicato dos ensacadores de café que tinha cerca de 60 anos na época. O grupo, chamado "Bahia do Berimbau", se reunia nos fundos de uma casa com doze homens mais velhos, e o jovem Sombra era o único jovem entre eles. Ao ver Sombra jogar capoeira, Mestre Olívio declarou: "Você sabe a capoeira, precisa somente adquirir comportamento".

O grupo se reunia aos domingos, e Sombra se dedicou a aprender sob a orientação de Mestre Olívio. Em 1968, começou a trabalhar como estivador na Companhia Docas de Santos, onde permaneceria até sua aposentadoria em 1993.

Quando Mestre Olívio faleceu em 1972, Sombra assumiu a liderança do grupo e o transformou na Associação de Capoeira Zumbi, nomeando-a em homenagem ao lendário líder do Quilombo dos Palmares. Em 1974, a associação se registrou na Federação Paulista de Capoeira e mudou seu nome para "Senzala"—a palavra portuguesa para as habitações de escravos nas fazendas. Em 1975, Mestre Sombra garantiu um local permanente para a academia na Rua Brás Cubas 227 em Santos, onde permanece até hoje. (Nota: A academia foi formalmente inaugurada neste endereço em 1978 segundo algumas fontes.)

Mestre Sombra desempenhou um papel fundamental na introdução da capoeira como esporte competitivo, participando ativamente da inclusão da capoeira como modalidade nos Jogos Abertos em 1987. Isso ajudou a legitimar a capoeira dentro do estabelecimento esportivo de São Paulo.

A Associação de Capoeira Senzala de Santos treinou mais de 5.000 alunos ao longo de seus 50 anos de história, produzindo múltiplas gerações de professores, contra-mestres e mestres reconhecidos tanto pela Federação Paulista de Capoeira quanto pela Confederação Brasileira de Capoeira. À medida que seus alunos abriam suas próprias academias por toda Santos e região da Baixada Santista, Mestre Sombra tornou-se presidente da Liga Santista de Capoeira. Ele também serviu como Coordenador do Conselho da Comunidade Negra de Santos.

Seus alunos espalharam a capoeira para mais de 15 países em todo o mundo, incluindo Espanha, EUA, Grécia, Holanda, Inglaterra, País de Gales, França, Noruega e por toda a África (Quênia, incluindo Nairóbi e Mombasa). Cidades notáveis onde os ex-alunos da Senzala de Santos ensinam incluem Boston, Berlim, Düsseldorf, Munique, Paris, Barcelona, San Francisco, Oslo e Manchester.

Entre seus alunos mais proeminentes estão Mestra Silvia Bazzarelli, que abriu a primeira escola estabelecida de capoeira no Reino Unido (London School of Capoeira) em 1988; Mestre Marcos dos Santos, que se juntou à escola de Londres em 1992 e recebeu seu cinto de mestre em 2006; Mestre Beija-Flor, que colaborou com Sombra em gravações; Mestre Bahia, que gravou um CD com ele em Santos; e Mestre Valtinho, seu primeiro contra-mestre.

Após se aposentar das docas de Santos em 1993, Mestre Sombra abriu o "Bazar Senzala", uma loja de roupas e acessórios de capoeira no centro de Santos.

Desde 2015, Mestre Sombra promove os Encontros Internacionais de Capoeira na cidade de Santos a cada dois anos, trazendo mestres renomados da Bahia e de todo o mundo para participar. Em 2016, gravou o álbum "Todos a Cantar" (29 minutos), com performances ao vivo com mestres e professores da comunidade Senzala de Santos.

Em janeiro de 2024, aos 82 anos, Mestre Sombra foi um dos 14 mestres de capoeira octogenários homenageados no 5º Rede Capoeira em Salvador, recebendo uma escultura Sankofa—um pássaro simbolizando "a necessidade de conhecer o passado para desenvolver um futuro melhor". Ele foi reconhecido ao lado de figuras lendárias incluindo Mestre João Grande, Mestre Acordeon, Mestre Boca Rica, Mestre Brandão e Mestre Felipe de Santo Amaro.

Uma fotografia de 1983 na academia de Mestre Suassuna em São Paulo captura Mestre Sombra ao lado de Mestres Gato Preto, Canjiquinha, Papo Amarelo, João Pequeno e outras figuras proeminentes—testemunhando sua aceitação entre os gigantes da capoeira.

Aos 83 anos (2025), Mestre Sombra continua como supervisor técnico da FUPES (Fundação Pró-Esporte de Santos) e orienta a equipe competitiva de capoeira de Santos, que dominou os 67º Jogos Regionais com oito medalhas de ouro. Ele enfatiza que o sucesso vem de "trabalho, treinamento e afinco" ao invés de talento natural, e adverte que "muitos estão jogando sem seguir" os regulamentos fundamentais que preservam o espírito da capoeira.',
  -- achievements_en
  E'Founder and President of Associação de Capoeira Senzala de Santos (1975-present); President of Liga Santista de Capoeira (Santos Capoeira League); Coordinator of Conselho da Comunidade Negra de Santos (Black Community Council of Santos); Pioneer in introducing capoeira to Jogos Abertos (1987); Trained over 5,000 students across 50+ years; Spread capoeira to 15+ countries worldwide; Prêmio Berimbau de Ouro (Golden Berimbau Award, 2020, Salvador); Honras ao Mérito Quintino Lacerda; Medalha ao Mérito Brás Cubas; Medalha Coração Nordestino; Invited by Ministry of Culture for official recognition of capoeira as Intangible Cultural Heritage; Honored as "Herói Popular" at 5º Rede Capoeira (January 2024, Salvador); Technical Supervisor of FUPES (Fundação Pró-Esporte de Santos); Recorded "Todos a Cantar" album (2016); Organized biennial International Capoeira Meetings in Santos (since 2015); Academy celebrated 50th anniversary (2025)',
  -- achievements_pt
  E'Fundador e Presidente da Associação de Capoeira Senzala de Santos (1975-presente); Presidente da Liga Santista de Capoeira; Coordenador do Conselho da Comunidade Negra de Santos; Pioneiro na introdução da capoeira nos Jogos Abertos (1987); Treinou mais de 5.000 alunos em 50+ anos; Espalhou a capoeira para 15+ países no mundo; Prêmio Berimbau de Ouro (2020, Salvador); Honras ao Mérito Quintino Lacerda; Medalha ao Mérito Brás Cubas; Medalha Coração Nordestino; Convidado pelo Ministério da Cultura para o ato oficial de reconhecimento da capoeira como Patrimônio Imaterial; Homenageado como "Herói Popular" no 5º Rede Capoeira (janeiro 2024, Salvador); Supervisor Técnico da FUPES (Fundação Pró-Esporte de Santos); Gravou álbum "Todos a Cantar" (2016); Organizou Encontros Internacionais de Capoeira bienais em Santos (desde 2015); Academia celebrou 50º aniversário (2025)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1941, year precision):
- velhosmestres.com: February 6, 1941
- senzaladesantos.nl: February 6, 1941
- londonschoolofcapoeira.com: February 6, 1941
- diariodolitoral.com.br: 1941
- capoeiraparisfrancesenzaladesantos.wordpress.com: February 6, 1942
- zumbicapoeira.wordpress.com: February 6, 1942
- January 2024 (5º Rede Capoeira): 82 years old → born 1941 or early 1942
Majority of sources and most authoritative (velhosmestres.com) agree on 1941. Using February 6, 1941 with year precision.

NAME: Roberto Teles de Oliveira - consistent across all sources.

TEACHERS:
- Mestre Olívio Bispo dos Santos (1963-1972, Itapema/Vicente de Carvalho, Bahia do Berimbau group)

STUDENTS (documented Mestres/Mestras):
- Mestra Silvia Bazzarelli (Contra-Mestra 1989, Mestra 1994)
- Mestre Marcos dos Santos (Contra-Mestre 1995, Mestre 2006)
- Mestre Beija-Flor (recorded albums with Sombra)
- Mestre Bahia (recorded CD with Sombra in Santos)
- Mestre Valtinho (first Contra-Mestre of Sombra)
- Mestre Valdir da Silva (founded Capoeira Conviver, 20+ years in Santos)

TRAINING TIMELINE:
- ~1948-1951: First capoeira movements (ages 7-10)
- 1963: Began formal training with Mestre Olívio in Santos
- 1972: Assumed leadership after Mestre Olívio''s death

GROUP EVOLUTION:
- 1963: Joined Bahia do Berimbau (Mestre Olívio)
- 1972: Transformed to Associação de Capoeira Zumbi
- 1974: Registered with Federação Paulista de Capoeira as "Senzala"
- 1975: Secured permanent location Rua Brás Cubas 227
- 1978: Academy formally opened at current location (some sources)

NOTABLE ASSOCIATIONS:
- 1983: Photographed at Mestre Suassuna''s academy with Mestres Gato Preto, Canjiquinha, Papo Amarelo, João Pequeno

CAREER TIMELINE:
- 1962: Migrated to Santos from Sergipe
- 1968: Began work at Companhia Docas de Santos
- 1987: Helped introduce capoeira to Jogos Abertos
- 1993: Retired from docks; opened Bazar Senzala
- 2015: Started biennial International Capoeira Meetings
- 2016: Recorded "Todos a Cantar" album
- 2020: Prêmio Berimbau de Ouro (Salvador)
- 2024: Honored at 5º Rede Capoeira

FAMILY CONNECTION:
His father was enslaved - discovered later in life, connecting him personally to capoeira''s resistance heritage.

2024 REDE CAPOEIRA CO-HONOREES:
João Grande (91), Acordeon (80), Boca Rica (87), Brandão (94), Felipe de Santo Amaro (96), Olavo (81), Pelé da Bomba (89), Brasília (81), Virgílio (89), Cafuné (85), Carcará (81), Curió (84), Celso (84)',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1941, precisão ano):
- velhosmestres.com: 6 de fevereiro de 1941
- senzaladesantos.nl: 6 de fevereiro de 1941
- londonschoolofcapoeira.com: 6 de fevereiro de 1941
- diariodolitoral.com.br: 1941
- capoeiraparisfrancesenzaladesantos.wordpress.com: 6 de fevereiro de 1942
- zumbicapoeira.wordpress.com: 6 de fevereiro de 1942
- Janeiro 2024 (5º Rede Capoeira): 82 anos → nascido 1941 ou início de 1942
Maioria das fontes e mais autoritativa (velhosmestres.com) concordam com 1941. Usando 6 de fevereiro de 1941 com precisão de ano.

NOME: Roberto Teles de Oliveira - consistente em todas as fontes.

PROFESSORES:
- Mestre Olívio Bispo dos Santos (1963-1972, Itapema/Vicente de Carvalho, grupo Bahia do Berimbau)

ALUNOS (Mestres/Mestras documentados):
- Mestra Silvia Bazzarelli (Contra-Mestra 1989, Mestra 1994)
- Mestre Marcos dos Santos (Contra-Mestre 1995, Mestre 2006)
- Mestre Beija-Flor (gravou álbuns com Sombra)
- Mestre Bahia (gravou CD com Sombra em Santos)
- Mestre Valtinho (primeiro Contra-Mestre de Sombra)
- Mestre Valdir da Silva (fundou Capoeira Conviver, 20+ anos em Santos)

LINHA DO TEMPO DE TREINAMENTO:
- ~1948-1951: Primeiros movimentos de capoeira (idades 7-10)
- 1963: Começou treinamento formal com Mestre Olívio em Santos
- 1972: Assumiu liderança após morte de Mestre Olívio

EVOLUÇÃO DO GRUPO:
- 1963: Entrou no Bahia do Berimbau (Mestre Olívio)
- 1972: Transformou em Associação de Capoeira Zumbi
- 1974: Registrado na Federação Paulista de Capoeira como "Senzala"
- 1975: Garantiu local permanente Rua Brás Cubas 227
- 1978: Academia formalmente inaugurada no local atual (algumas fontes)

ASSOCIAÇÕES NOTÁVEIS:
- 1983: Fotografado na academia de Mestre Suassuna com Mestres Gato Preto, Canjiquinha, Papo Amarelo, João Pequeno

LINHA DO TEMPO DA CARREIRA:
- 1962: Migrou para Santos de Sergipe
- 1968: Começou trabalho na Companhia Docas de Santos
- 1987: Ajudou a introduzir capoeira nos Jogos Abertos
- 1993: Aposentou das docas; abriu Bazar Senzala
- 2015: Iniciou Encontros Internacionais de Capoeira bienais
- 2016: Gravou álbum "Todos a Cantar"
- 2020: Prêmio Berimbau de Ouro (Salvador)
- 2024: Homenageado no 5º Rede Capoeira

CONEXÃO FAMILIAR:
Seu pai foi escravizado - descoberto mais tarde na vida, conectando-o pessoalmente à herança de resistência da capoeira.

CO-HOMENAGEADOS REDE CAPOEIRA 2024:
João Grande (91), Acordeon (80), Boca Rica (87), Brandão (94), Felipe de Santo Amaro (96), Olavo (81), Pelé da Bomba (89), Brasília (81), Virgílio (89), Cafuné (85), Carcará (81), Curió (84), Celso (84)'
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
