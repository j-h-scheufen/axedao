-- ============================================================
-- GENEALOGY PERSON: Nenel
-- Generated: 2025-12-20
-- ============================================================
-- Mestre Nenel (Manoel Nascimento Machado) - son of Mestre Bimba
-- Born September 26, 1960 in Salvador, Bahia
-- Living guardian of Capoeira Regional legacy
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
  'Manoel Nascimento Machado',
  'Nenel',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://fundacaomestrebimba.org.br/mestre-nenel/', 'https://www.capoeirabayarea.com/our-mestres-teachers', 'https://www.capoeiradet.org/capoeira-regional/mestre-nenel', 'https://capoeiraatl.com/capoeira-regional/mestre-nenel/', 'https://papoeira.com/en/interview-with-mestre-nenel-son-of-mestre-bimba/', 'https://www.loc.gov/pictures/item/2020638871/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Nenel is the definitive authority on authentic Capoeira Regional as taught by his father, Mestre Bimba. He insists on preserving the complete methodology: methods (teaching sequences), rituals (ceremonies, protocols), and principles (philosophical foundations). He rescued and organized the 12 toques of Capoeira Regional from his father''s legacy—work that could only have been accomplished by someone who lived alongside Mestre Bimba. He is a master of the berimbau and teaches specialized courses in berimbau musicality. His teaching preserves the charanga bateria (one berimbau, two pandeiros), the eight teaching sequences, cintura desprezada, and the graduation system (colored handkerchiefs).',
  E'Mestre Nenel é a autoridade definitiva sobre a autêntica Capoeira Regional como ensinada por seu pai, Mestre Bimba. Ele insiste na preservação da metodologia completa: métodos (sequências de ensino), rituais (cerimônias, protocolos) e princípios (fundamentos filosóficos). Ele resgatou e organizou os 12 toques da Capoeira Regional do legado de seu pai—trabalho que só poderia ter sido realizado por alguém que viveu ao lado de Mestre Bimba. É mestre do berimbau e ministra cursos especializados em musicalidade do berimbau. Seu ensino preserva a bateria charanga (um berimbau, dois pandeiros), as oito sequências de ensino, cintura desprezada e o sistema de graduação (lenços coloridos).',
  -- Life dates
  1960,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Manoel Nascimento Machado, known as Mestre Nenel, was born on September 26, 1960, in Salvador, Bahia—the son of Manoel dos Reis Machado (Mestre Bimba), the legendary creator of Capoeira Regional, and Berenice da Conceição Nascimento. He was raised by Alice Maria da Cruz, known as Mãe Alice, a woman deeply connected to both Bimba''s academy and Bahian spiritual traditions.

Mãe Alice was one of the main Ialorixás (Candomblé priestesses) of the Nordeste de Amaralina region. She worked helping Mestre Bimba at his academy on Terreiro de Jesus, behind the church of São Domingos, performing general services and earning extra money washing and organizing students'' clothes. Bimba later bought land for her to establish her terreiro, and in 1962 she founded Oiá Padê da Riméia in Alto da Santa Cruz. Before establishing her own terreiro, she organized the folkloric Candomblé presentations during Bimba''s baptism and graduation parties—a testament to the deep connection between capoeira and Afro-Brazilian spiritual traditions.

As a young child, Nenel spent many of his days in his father''s academy, the Centro de Cultura Física Regional. At six years old in 1966, he formally began capoeira training, earning his blue scarf after completing the basic course. He graduated in June 1967 alongside his brother Demerval dos Santos Machado (known as Formiga), at only seven years of age. Even at this young age, he participated in demonstration groups performing capoeira, samba duro, maculelê, and puxada de rede, traveling with his father throughout Bahia and beyond.

In 1972, Mestre Bimba and his family moved to Goiânia in the state of Goiás, disappointed by the lack of government support in Bahia. When his father''s health declined, Nenel and his brother Formiga taught classes in Goiânia, carrying on the Regional methodology. Mestre Bimba died on February 5, 1974, leaving fourteen-year-old Nenel to assume custodianship of his father''s legacy.

Nenel, like many of his siblings, worked various occupations to make ends meet—a period of hardship that tested his commitment to capoeira. Then, in 1975, he heard the call of capoeira. Despite financial difficulties, he moved to Brasília where he founded his first academy: Associação de Capoeira Mestre Bimba Filho. That same year, at just fifteen years old, he was consecrated mestre de capoeira in Brasília—a recognition of both his lineage and his demonstrated mastery.

In September 1977, Nenel returned to Salvador. He competed in capoeira championships, played street capoeira, and performed in folkloric shows while continuing to work various jobs. In the 1977 and 1978 Campeonato Baiano de Capoeira, he became bi-campeão (two-time champion), competing in sports format while representing Ginga Associação de Capoeira.

From 1984 to 1986, he administered classes at Mestre Moise Sucuiba''s academy, gradually building his reputation as a transmitter of Mestre Bimba''s authentic methodology. On June 10, 1986, he founded the Associação de Capoeira Filhos de Bimba, based at the Fitness Academy of Genivaldo Garcia in the Amaralina neighborhood of Salvador. In 1989, the school was transferred to the School of Arts and Trades as part of an educational project. In 1998, the school was renamed Filhos de Bimba – Escola de Capoeira.

The Fundação Mestre Bimba (FUMEB) was conceived by Bimba''s disciples and admirers, under Mestre Nenel''s leadership, starting in April 1993 and officially established as a non-profit institution on November 30, 1994. Recognized as Municipal and State Public Utility, the Foundation operates from a historic building at Rua Maciel de Baixo, 51 in Salvador''s Pelourinho district. It preserves and displays historical artifacts including Mestre Bimba''s famous berimbau from the 1960s, the Thomé de Souza Medal, and the Doctor Honoris Causa diploma issued by UFBA.

Mestre Nenel''s most significant scholarly contribution is the rescue and organization of the 12 toques (rhythms) of Capoeira Regional. These distinct berimbau rhythms—including São Bento Grande da Regional, Iúna, Cavalaria, and the Hino da Capoeira Regional—were left by his father but could only have been systematically organized by someone who lived with Mestre Bimba and understood his methodology intimately.

In 2018, Mestre Nenel, with organizer Lia Sfoggia, published "Bimba: Um século da Capoeira Regional" (Bimba: A Century of Capoeira Regional) through EDUFBA, the Federal University of Bahia''s publishing house. This bilingual book (Portuguese/English) exposes the trajectories of both Bimba and Nenel, documenting the practices, clothing, musical instruments, and philosophy of authentic Capoeira Regional.

Today, Mestre Nenel resides in Salvador with his partner, Mestra Preguiça (not to be confused with the Senzala mestre of the same name)—the first woman to receive the white scarf in Capoeira Regional. Mestra Preguiça, who has been trained at Filhos de Bimba since 1995 and was consecrated mestra in 2010, is recognized as a symbol of Black women''s resistance in capoeira and has worked with children through Projeto Capoerê since 1994.

Mestre Nenel is the Executive President of both the Fundação Mestre Bimba and Filhos de Bimba Escola de Capoeira, as well as coordinator of the Projeto Social Capoerê—a free initiative that has served over 8,000 children and adolescents in Bahia, São Paulo, Minas Gerais, and Santa Catarina. He is also a founding member of the Associação Brasileira de Capoeira Regional (Brazilian Association of Capoeira Regional).

By 2022—marking the school''s 36th anniversary—Filhos de Bimba had expanded to schools in six Brazilian states and international locations including England, Belgium, Italy, Canada, Croatia, Germany, and Lebanon. In the United States, there are branches in Fort Worth (Texas), the Bay Area (California), Atlanta (Georgia), and Detroit (Michigan).

Mestre Nenel has successfully fulfilled his father''s vision that Capoeira Regional was created for the world. He participates in seminars and festivals, teaches courses internationally, and closely follows the work of his disciples across the globe. In an interview, he reflected on his relationship with his father: "At the same time that he was a father, he was a mestre too... Though he is physically absent, he continues being my mestre."',
  -- bio_pt
  E'Manoel Nascimento Machado, conhecido como Mestre Nenel, nasceu em 26 de setembro de 1960, em Salvador, Bahia—filho de Manoel dos Reis Machado (Mestre Bimba), o lendário criador da Capoeira Regional, e Berenice da Conceição Nascimento. Foi criado por Alice Maria da Cruz, conhecida como Mãe Alice, uma mulher profundamente conectada tanto à academia de Bimba quanto às tradições espirituais baianas.

Mãe Alice foi uma das principais Ialorixás do bairro de Nordeste de Amaralina. Ela trabalhava ajudando Mestre Bimba em sua academia no Terreiro de Jesus, atrás da igreja de São Domingos, realizando serviços gerais e ganhando dinheiro extra lavando e organizando as roupas dos alunos. Bimba posteriormente comprou um terreno para ela estabelecer seu terreiro, e em 1962 ela fundou o Oiá Padê da Riméia no Alto da Santa Cruz. Antes de estabelecer seu próprio terreiro, ela organizava as apresentações folclóricas de Candomblé durante as festas de batizado e formatura de Bimba—um testemunho da profunda conexão entre a capoeira e as tradições espirituais afro-brasileiras.

Quando criança, Nenel passava muitos de seus dias na academia de seu pai, o Centro de Cultura Física Regional. Aos seis anos, em 1966, começou formalmente o treinamento de capoeira, conquistando seu lenço azul após completar o curso básico. Formou-se em junho de 1967 junto com seu irmão Demerval dos Santos Machado (conhecido como Formiga), com apenas sete anos de idade. Mesmo tão jovem, participava de grupos de demonstração apresentando capoeira, samba duro, maculelê e puxada de rede, viajando com seu pai pela Bahia e além.

Em 1972, Mestre Bimba e sua família mudaram-se para Goiânia, no estado de Goiás, desapontados com a falta de apoio governamental na Bahia. Quando a saúde de seu pai declinou, Nenel e seu irmão Formiga ministravam aulas em Goiânia, continuando a metodologia Regional. Mestre Bimba morreu em 5 de fevereiro de 1974, deixando Nenel, então com quatorze anos, como guardião do legado de seu pai.

Nenel, como muitos de seus irmãos, trabalhou em diversas ocupações para sobreviver—um período de dificuldades que testou seu compromisso com a capoeira. Então, em 1975, ouviu o chamado da capoeira. Apesar das dificuldades financeiras, mudou-se para Brasília onde fundou sua primeira academia: Associação de Capoeira Mestre Bimba Filho. No mesmo ano, com apenas quinze anos, foi consagrado mestre de capoeira em Brasília—um reconhecimento tanto de sua linhagem quanto de sua maestria demonstrada.

Em setembro de 1977, Nenel retornou a Salvador. Competiu em campeonatos de capoeira, jogou capoeira de rua e se apresentou em shows folclóricos enquanto continuava trabalhando em diversos empregos. Nos Campeonatos Baianos de Capoeira de 1977 e 1978, tornou-se bicampeão, competindo em formato esportivo representando a Ginga Associação de Capoeira.

De 1984 a 1986, administrou aulas na academia de Mestre Moise Sucuiba, construindo gradualmente sua reputação como transmissor da metodologia autêntica de Mestre Bimba. Em 10 de junho de 1986, fundou a Associação de Capoeira Filhos de Bimba, sediada na Academia de Fitness de Genivaldo Garcia no bairro de Amaralina em Salvador. Em 1989, a escola foi transferida para a Escola de Artes e Ofícios como parte de um projeto educacional. Em 1998, a escola foi renomeada para Filhos de Bimba – Escola de Capoeira.

A Fundação Mestre Bimba (FUMEB) foi concebida pelos discípulos e admiradores de Bimba, sob a liderança de Mestre Nenel, a partir de abril de 1993, sendo oficialmente estabelecida como instituição sem fins lucrativos em 30 de novembro de 1994. Reconhecida como Utilidade Pública Municipal e Estadual, a Fundação opera a partir de um edifício histórico na Rua Maciel de Baixo, 51, no bairro do Pelourinho em Salvador. Ela preserva e exibe artefatos históricos incluindo o famoso berimbau de Mestre Bimba dos anos 1960, a Medalha Thomé de Souza e o diploma de Doutor Honoris Causa emitido pela UFBA.

A contribuição acadêmica mais significativa de Mestre Nenel é o resgate e organização dos 12 toques (ritmos) da Capoeira Regional. Esses ritmos distintos de berimbau—incluindo São Bento Grande da Regional, Iúna, Cavalaria e o Hino da Capoeira Regional—foram deixados por seu pai, mas só poderiam ter sido sistematicamente organizados por alguém que viveu com Mestre Bimba e compreendeu sua metodologia intimamente.

Em 2018, Mestre Nenel, com a organizadora Lia Sfoggia, publicou "Bimba: Um século da Capoeira Regional" pela EDUFBA, a editora da Universidade Federal da Bahia. Este livro bilíngue (português/inglês) expõe as trajetórias de Bimba e Nenel, documentando as práticas, vestimentas, instrumentos musicais e filosofia da autêntica Capoeira Regional.

Hoje, Mestre Nenel reside em Salvador com sua companheira, Mestra Preguiça (não confundir com o mestre da Senzala de mesmo nome)—a primeira mulher a receber o lenço branco na Capoeira Regional. Mestra Preguiça, que treina na Filhos de Bimba desde 1995 e foi consagrada mestra em 2010, é reconhecida como símbolo da resistência das mulheres negras na capoeira e trabalha com crianças através do Projeto Capoerê desde 1994.

Mestre Nenel é o Presidente Executivo tanto da Fundação Mestre Bimba quanto da Filhos de Bimba Escola de Capoeira, além de coordenador do Projeto Social Capoerê—uma iniciativa gratuita que já atendeu mais de 8.000 crianças e adolescentes na Bahia, São Paulo, Minas Gerais e Santa Catarina. Ele também é membro fundador da Associação Brasileira de Capoeira Regional.

Em 2022—marcando o 36º aniversário da escola—a Filhos de Bimba expandiu para escolas em seis estados brasileiros e locais internacionais incluindo Inglaterra, Bélgica, Itália, Canadá, Croácia, Alemanha e Líbano. Nos Estados Unidos, há filiais em Fort Worth (Texas), Bay Area (Califórnia), Atlanta (Geórgia) e Detroit (Michigan).

Mestre Nenel cumpriu com sucesso a visão de seu pai de que a Capoeira Regional foi criada para o mundo. Ele participa de seminários e festivais, ministra cursos internacionalmente e acompanha de perto o trabalho de seus discípulos ao redor do globo. Em uma entrevista, ele refletiu sobre seu relacionamento com seu pai: "Ao mesmo tempo que ele era um pai, ele era um mestre também... Embora ele esteja fisicamente ausente, ele continua sendo meu mestre."',
  -- achievements_en
  E'Rescued and systematized the 12 toques (rhythms) of Capoeira Regional; Two-time Bahian Capoeira Champion (1977, 1978); Founded Filhos de Bimba Escola de Capoeira (1986); Co-founded and serves as Executive President of Fundação Mestre Bimba (1994); Author of "Bimba: Um século da Capoeira Regional" (2018, EDUFBA); Coordinator of Projeto Social Capoerê (8,000+ youth served); Founding member of Associação Brasileira de Capoeira Regional; Expanded Filhos de Bimba to 6 Brazilian states and 8+ countries; Master berimbau player and specialized instructor; Served as judge at multiple capoeira festivals; Recognized as the global reference and living authority on authentic Capoeira Regional',
  -- achievements_pt
  E'Resgatou e sistematizou os 12 toques (ritmos) da Capoeira Regional; Bicampeão Baiano de Capoeira (1977, 1978); Fundou a Filhos de Bimba Escola de Capoeira (1986); Cofundou e é Presidente Executivo da Fundação Mestre Bimba (1994); Autor de "Bimba: Um século da Capoeira Regional" (2018, EDUFBA); Coordenador do Projeto Social Capoerê (8.000+ jovens atendidos); Membro fundador da Associação Brasileira de Capoeira Regional; Expandiu a Filhos de Bimba para 6 estados brasileiros e 8+ países; Mestre de berimbau e instrutor especializado; Atuou como juiz em vários festivais de capoeira; Reconhecido como a referência global e autoridade viva da autêntica Capoeira Regional',
  -- notes_en
  E'BIRTH DATE: September 26, 1960, Salvador, Bahia - confirmed across multiple sources (Fundação Mestre Bimba official site, Papoeira interview, Capoeira Bay Area, Capoeira Detroit, Library of Congress).

FAMILY:
- Father: Mestre Bimba (Manoel dos Reis Machado) - creator of Capoeira Regional
- Mother: Berenice da Conceição Nascimento
- Raised by: Alice Maria da Cruz (Mãe Alice) - Ialorixá, Candomblé priestess, founded Oiá Padê da Riméia in 1962
- Brother: Formiga (Demerval dos Santos Machado) - graduated alongside Nenel in June 1967
- Partner: Mestra Preguiça - first woman mestra in Capoeira Regional (consecrated 2010)

MESTRE BIMBA HAD 12 REGISTERED CHILDREN (many more illegitimate). Nenel and Formiga are the sons who continued his capoeira legacy.

TRAINING TIMELINE:
- 1966: Began formal capoeira training at age 6
- 1967 (June): Graduated with blue scarf alongside brother Formiga
- 1967-1974: Participated in demonstration groups, traveled with father
- 1975: Consecrated mestre in Brasília at age 15

CAREER TIMELINE:
- 1975: Founded first academy in Brasília (Associação de Capoeira Mestre Bimba Filho)
- 1977 (September): Returned to Salvador
- 1977, 1978: Bi-campeão (two-time champion) Campeonato Baiano de Capoeira
- 1984-1986: Taught at Mestre Moise Sucuiba''s academy
- 1986 (June 10): Founded Associação de Capoeira Filhos de Bimba in Amaralina
- 1989: Transferred school to School of Arts and Trades
- 1993 (April 22): Began conception of Fundação Mestre Bimba
- 1994 (November 30): FUMEB officially established
- 1998: School renamed to Filhos de Bimba – Escola de Capoeira
- 2018: Published "Bimba: Um século da Capoeira Regional" (EDUFBA)

MAE ALICE (Alice Maria da Cruz):
- Raised Nenel
- Worked at Bimba''s academy at Terreiro de Jesus
- One of main Ialorixás of Nordeste de Amaralina
- Founded Oiá Padê da Riméia in Alto da Santa Cruz (1962)
- Organized folkloric Candomblé presentations for Bimba''s batizado/graduation parties
- Bimba bought her land to establish her terreiro

12 TOQUES OF CAPOEIRA REGIONAL (rescued by Nenel):
Nenel is credited with rescuing and systematizing the 12 berimbau rhythms of Regional that his father created, including São Bento Grande da Regional, Iúna, Cavalaria, Idalina, and the Hino da Capoeira Regional.

PUBLICATIONS:
- "Bimba: Um século da Capoeira Regional" (2018, EDUFBA) - organized by Lia Sfoggia, bilingual Portuguese/English

MEDIA APPEARANCES:
- 2008: Photographed by André Cypriano for "Capoeira" portfolio (Library of Congress collection)

PROJETO CAPOERÊ:
- Social initiative offering free capoeira classes to underprivileged youth
- Served 8,000+ children and adolescents
- Operating in Bahia, São Paulo, Minas Gerais, Santa Catarina

FILHOS DE BIMBA INTERNATIONAL LOCATIONS (as of 2022):
- Brazil: 6 states
- USA: Fort Worth TX, Bay Area CA, Atlanta GA, Detroit MI
- Europe: England, Belgium, Italy, Croatia, Germany
- Middle East: Lebanon
- Americas: Canada

MESTRA PREGUIÇA:
- Full name unknown
- First woman to receive white scarf in Capoeira Regional
- Training at Filhos de Bimba since 1995
- Consecrated mestra in 2010
- Working with Projeto Capoerê since 1994
- DISTINCT from Mestre Preguiça (Walmir Oliveira) of Grupo Senzala',
  -- notes_pt
  E'DATA DE NASCIMENTO: 26 de setembro de 1960, Salvador, Bahia - confirmado em múltiplas fontes (site oficial da Fundação Mestre Bimba, entrevista Papoeira, Capoeira Bay Area, Capoeira Detroit, Library of Congress).

FAMÍLIA:
- Pai: Mestre Bimba (Manoel dos Reis Machado) - criador da Capoeira Regional
- Mãe: Berenice da Conceição Nascimento
- Criado por: Alice Maria da Cruz (Mãe Alice) - Ialorixá, sacerdotisa do Candomblé, fundou Oiá Padê da Riméia em 1962
- Irmão: Formiga (Demerval dos Santos Machado) - formou-se junto com Nenel em junho de 1967
- Companheira: Mestra Preguiça - primeira mulher mestra na Capoeira Regional (consagrada 2010)

MESTRE BIMBA TEVE 12 FILHOS REGISTRADOS (muitos mais ilegítimos). Nenel e Formiga são os filhos que continuaram seu legado na capoeira.

LINHA DO TEMPO DE TREINAMENTO:
- 1966: Começou treinamento formal de capoeira aos 6 anos
- 1967 (junho): Formou-se com lenço azul junto com irmão Formiga
- 1967-1974: Participou de grupos de demonstração, viajou com o pai
- 1975: Consagrado mestre em Brasília aos 15 anos

LINHA DO TEMPO DA CARREIRA:
- 1975: Fundou primeira academia em Brasília (Associação de Capoeira Mestre Bimba Filho)
- 1977 (setembro): Retornou a Salvador
- 1977, 1978: Bicampeão do Campeonato Baiano de Capoeira
- 1984-1986: Ensinou na academia de Mestre Moise Sucuiba
- 1986 (10 de junho): Fundou Associação de Capoeira Filhos de Bimba em Amaralina
- 1989: Transferiu escola para Escola de Artes e Ofícios
- 1993 (22 de abril): Iniciou concepção da Fundação Mestre Bimba
- 1994 (30 de novembro): FUMEB oficialmente estabelecida
- 1998: Escola renomeada para Filhos de Bimba – Escola de Capoeira
- 2018: Publicou "Bimba: Um século da Capoeira Regional" (EDUFBA)

MÃE ALICE (Alice Maria da Cruz):
- Criou Nenel
- Trabalhava na academia de Bimba no Terreiro de Jesus
- Uma das principais Ialorixás do Nordeste de Amaralina
- Fundou Oiá Padê da Riméia no Alto da Santa Cruz (1962)
- Organizava apresentações folclóricas de Candomblé para festas de batizado/formatura de Bimba
- Bimba comprou terreno para ela estabelecer seu terreiro

12 TOQUES DA CAPOEIRA REGIONAL (resgatados por Nenel):
Nenel é creditado por resgatar e sistematizar os 12 ritmos de berimbau da Regional que seu pai criou, incluindo São Bento Grande da Regional, Iúna, Cavalaria, Idalina e o Hino da Capoeira Regional.

PUBLICAÇÕES:
- "Bimba: Um século da Capoeira Regional" (2018, EDUFBA) - organizado por Lia Sfoggia, bilíngue português/inglês

APARIÇÕES NA MÍDIA:
- 2008: Fotografado por André Cypriano para portfólio "Capoeira" (coleção Library of Congress)

PROJETO CAPOERÊ:
- Iniciativa social oferecendo aulas gratuitas de capoeira para jovens carentes
- Atendeu 8.000+ crianças e adolescentes
- Operando na Bahia, São Paulo, Minas Gerais, Santa Catarina

FILHOS DE BIMBA LOCALIZAÇÕES INTERNACIONAIS (até 2022):
- Brasil: 6 estados
- EUA: Fort Worth TX, Bay Area CA, Atlanta GA, Detroit MI
- Europa: Inglaterra, Bélgica, Itália, Croácia, Alemanha
- Oriente Médio: Líbano
- Américas: Canadá

MESTRA PREGUIÇA:
- Nome completo desconhecido
- Primeira mulher a receber lenço branco na Capoeira Regional
- Treinando na Filhos de Bimba desde 1995
- Consagrada mestra em 2010
- Trabalhando com Projeto Capoerê desde 1994
- DISTINTA de Mestre Preguiça (Walmir Oliveira) do Grupo Senzala'
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
