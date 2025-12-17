-- ============================================================
-- GENEALOGY PERSON: Artur Emídio
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH DATE: March 31, 1930 - Confirmed by velhosmestres.com
-- DEATH DATE: May 3, 2011 - Confirmed by velhosmestres.com and
-- Portal Capoeira death notice.
--
-- STYLE: Regional - Trained in systematized Bahian capoeira from
-- Mestre Paizinho (Teodoro Ramos), who was a student of Mestre
-- Neném (African origin). Artur Emídio's teaching was described
-- as based on "the systematized method of Mestre Bimba," though
-- he was not a direct student of Bimba.
--
-- LINEAGE: Neném (African) → Paizinho (Teodoro Ramos) → Artur Emídio
--
-- SIGNIFICANCE: Pioneer of capoeira in Rio de Janeiro; established
-- one of the first formal capoeira academies in Rio (1955); key
-- lineage figure whose Sunday rodas were meeting points for
-- capoeiristas of all styles; pioneer of international capoeira
-- touring (1950s-60s); vale-tudo fighter defending capoeira in
-- the rings.
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
  'Artur Emídio de Oliveira',
  'Artur Emídio',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
    'https://velhosmestres.com/en/featured-69'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Artur Emídio was renowned for exceptional speed and efficiency - colleagues nicknamed his approach "the bolt" (o raio) for its quickness and directness. His capoeira combined the systematized Bahian method learned from Mestre Paizinho with practical fighting techniques acquired through his vale-tudo career. He briefly trained at the Gracie academy in Rio to supplement his ground game after his initial defeat. His Sunday rodas at Academia Artur Emídio were deliberately eclectic, welcoming mestres from all styles - Paraná, Mucungê, and others played in his orchestra. This fusion environment was crucial to the development of Contemporary Capoeira in Rio de Janeiro.',
  E'Artur Emídio era reconhecido pela velocidade e eficiência excepcionais - colegas apelidaram sua abordagem de "o raio" por sua rapidez e objetividade. Sua capoeira combinava o método sistematizado baiano aprendido com Mestre Paizinho com técnicas práticas de luta adquiridas em sua carreira de vale-tudo. Treinou brevemente na academia Gracie no Rio para complementar seu jogo de chão após sua derrota inicial. Suas rodas de domingo na Academia Artur Emídio eram deliberadamente ecléticas, recebendo mestres de todos os estilos - Paraná, Mucungê e outros tocavam em sua orquestra. Esse ambiente de fusão foi crucial para o desenvolvimento da Capoeira Contemporânea no Rio de Janeiro.',
  -- Life dates
  1930,
  'exact'::genealogy.date_precision,
  'Itabuna, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Artur Emídio de Oliveira was born on March 31, 1930, in Itabuna, southern Bahia, where his parents worked as farmers. He grew up in a modest house on Rua Direita in the Pontalzinho neighborhood and completed secondary school there. At age seven, in a time when capoeira was prohibited by law and considered a criminal offense, he began learning "in the street, on the pavement" from his master Teodoro Ramos, known as Paizinho, who would wake him at six each morning to train. Paizinho was a disciple of Mestre Neném, a capoeirista of African origin.

In his own recounting: "The practice of Capoeira was prohibited. They trained on top of hills, in alleyways, at night and always hidden. Many were the times that my Master was arrested. But the next day the bail was paid, and he would leave. And at night, he would return to teach Capoeira, practiced for love!"

When Paizinho died in 1945, the fifteen-year-old Artur took over his master''s academy. Despite his youth, he began teaching Paizinho''s former students and quickly gained recognition, even receiving visiting students from Salvador. Various legends surrounded Paizinho''s death - some claimed he died trying to fly from a coconut tree using palm leaves as wings, like Icarus. According to Artur Emídio, Paizinho actually died of meningitis.

By his early twenties, Artur delighted audiences at circuses and amusement parks in Itabuna with "luta livre" demonstrations. His ambition was to showcase "the value of the national fight" - capoeira. In 1953, he left Itabuna for São Paulo to fight Edgar Duro, a luta livre fighter, and won. On June 29, 1953, he faced Rudolf Hermanny, a student of Mestre Sinhozinho, in a bout fought under Burlamaqui''s capoeira rules with groundwork modifications. Hermanny''s aggression proved decisive - he knocked Artur down multiple times with kicks, landed a rasteira, and delivered a decisive stomp. The referee stopped the fight before a full knockout.

In 1954, Artur traveled to Rio de Janeiro to fight Hélio Gracie in a match that ended in a draw. After his defeat to Hermanny, he frequented the Gracie academy in Rio and learned jiu-jitsu techniques to complement his capoeira. In 1955, he moved permanently to Rio de Janeiro with his family.

In Rio, Artur established his school above the Rio Novo pharmacy at Avenida dos Democraticos 1313, where he also worked as a masseur - famously treating Miss Brazil contestant Martha Rocha in 1954. He then founded the Academia de Capoeira Artur Emídio on Rua Manuel Fontenele, near Higienópolis in the Bonsucesso neighborhood - one of the first formal capoeira academies in the city.

The most celebrated fight of his ring career came on April 13, 1957 (some sources say April 10), against Robson Gracie at Maracanãzinho. Artur had declared he would "do with Robson what Waldemar did with Hélio," showing confidence in capoeira''s effectiveness. The Diário Carioca reported that Artur was "brought to the ground at the very beginning" and subjected to "strangling from behind." The fight lasted only four minutes before Robson''s submission victory.

After this defeat, friends encouraged him to focus on teaching. His first student was Djalma Bandeira, who became a travel companion with whom Artur refined his skills. The Sunday roda at his academy became legendary - a meeting point where mestres from all over Brazil congregated. As Mestre Paulão recalled: "Masters from all over Brazil came to the roda of Artur Emídio... here the suburbs, the northern and the southern zones congregated, it was an eclectic capoeira." Excellent berimbau players like Mestres Paraná and Mucungê joined his orchestra.

With his student Djalma Bandeira, Artur performed in the folkloric show "Skindô." The cultural entrepreneur Abraham Medina engaged them for a show featuring the romantic singer Nelson Gonçalves that toured New York, Paris, Acapulco, and Buenos Aires. Artur Emídio is likely the first capoeirista to perform abroad, pioneering capoeira in the United States, France, Uruguay, and Argentina during the 1950s and early 1960s. Other famous shows included "Capital Samba" and the musical "Arco-Íris," featuring artists like Joãozinho da Goméia, Ary Barroso, and Mestre Paraná.

From the 1960s onward, Artur abandoned the ring and dedicated himself exclusively to capoeira. He gave displays throughout Rio, judged competitions including the famous Berimbau de Ouro, and became involved with the Cariocan Federation of Pugilism, which began institutionalizing capoeira. In 1987, he participated in an event with Bahian old masters at Circo Voador in Rio. In 1967, he and Mestre Bimba were photographed together at a capoeira symposium at Campos dos Afonsos in Rio - Artur later spoke of their "somewhat conflictual relationship."

He trained many students who became important masters: Leopoldina (from ~1954), Djalma Bandeira, Paulo Gomes, Mendonça, Celso do Engenho da Rainha, Vilela, Vilmar, and Roberval Serejo. Mestre Paulo Gomes, also from Itabuna, later founded ABRACAP (Capoeira Association of Brazil) in 1985 and advised São Paulo Governor Mário Covas on capoeira legislation.

Artur Emídio was part of a generation born in the 1930s that formed the core of contemporary Rio de Janeiro capoeira, alongside Leopoldina, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes, and Celso do Engenho. There is consensus that four lineages were the main influences on Contemporary Capoeira in Rio: Artur Emídio, Paraná, Mário Buscapé, and Roque.

An arthrosis in his left knee eventually prevented him from continuing to play and teach. He died on the afternoon of May 3, 2011, in Rio de Janeiro, at age 81. Portal Capoeira''s death notice declared: "Rio de Janeiro''s capoeira lost its greatest personality." The old guard of capoeira, in Rio and Bahia, knew that Artur was one of the greatest talents of all time. As his contemporaries said: "He did for capoeira what, to this day, all of us together still have not done."

A documentary film "From the Ring to the Stage" about his life, directed by Roberto Pereira and Ricardo Pereira, began recording in 2018 and was completed in 2023. Masters Genaro (1934-2022) and Polaco (1949-2021) provided testimonies before their deaths.',
  -- Extended content (Portuguese)
  E'Artur Emídio de Oliveira nasceu em 31 de março de 1930, em Itabuna, sul da Bahia, onde seus pais trabalhavam como fazendeiros. Cresceu em uma casa modesta na Rua Direita, no bairro do Pontalzinho, e completou o ensino secundário ali. Aos sete anos, em uma época em que a capoeira era proibida por lei e considerada infração penal, começou a aprender "na rua, no passeio" com seu mestre Teodoro Ramos, conhecido como Paizinho, que o acordava às seis da manhã para treinar. Paizinho era discípulo de Mestre Neném, um capoeirista de origem africana.

Em seu próprio relato: "A prática da Capoeira era proibida. Treinavam no alto dos morros, nos becos, à noite e sempre escondidos. Muitas foram as vezes que meu Mestre foi preso. Mas no dia seguinte a fiança era paga, e ele saía. E à noite, voltava a ensinar Capoeira, praticada por amor!"

Quando Paizinho morreu em 1945, o jovem Artur de quinze anos assumiu a academia de seu mestre. Apesar da pouca idade, começou a ensinar os antigos alunos de Paizinho e rapidamente ganhou reconhecimento, recebendo até alunos visitantes de Salvador. Várias lendas cercavam a morte de Paizinho - alguns afirmavam que ele morreu tentando voar de um coqueiro usando folhas de palmeira como asas, como Ícaro. Segundo Artur Emídio, Paizinho morreu de meningite.

Por volta dos vinte anos, Artur encantava plateias de circos e parques de diversões em Itabuna com demonstrações de "luta livre". Sua ambição era mostrar "o valor da luta nacional" - a capoeira. Em 1953, saiu de Itabuna para São Paulo para lutar contra Edgar Duro, lutador de luta livre, e venceu. Em 29 de junho de 1953, enfrentou Rudolf Hermanny, aluno de Mestre Sinhozinho, em uma luta disputada sob as regras de capoeira de Burlamaqui com modificações para luta no chão. A agressividade de Hermanny foi decisiva - derrubou Artur várias vezes com chutes, aplicou uma rasteira e desferiu um pisão decisivo. O árbitro parou a luta antes do nocaute completo.

Em 1954, Artur viajou ao Rio de Janeiro para lutar contra Hélio Gracie em uma luta que terminou empatada. Após sua derrota para Hermanny, frequentou a academia Gracie no Rio e aprendeu técnicas de jiu-jitsu para complementar sua capoeira. Em 1955, mudou-se permanentemente para o Rio de Janeiro com sua família.

No Rio, Artur estabeleceu sua escola acima da farmácia Rio Novo na Avenida dos Democraticos 1313, onde também trabalhava como massagista - atendendo famosamente a candidata a Miss Brasil Martha Rocha em 1954. Em seguida, fundou a Academia de Capoeira Artur Emídio na Rua Manuel Fontenele, perto de Higienópolis no bairro de Bonsucesso - uma das primeiras academias formais de capoeira da cidade.

A luta mais célebre de sua carreira nos ringues foi em 13 de abril de 1957 (algumas fontes dizem 10 de abril), contra Robson Gracie no Maracanãzinho. Artur havia declarado que faria "com Robson o que Waldemar fez com Hélio," demonstrando confiança na eficácia da capoeira. O Diário Carioca relatou que Artur foi "levado ao chão logo no início" e submetido a "estrangulamento por trás." A luta durou apenas quatro minutos antes da vitória por finalização de Robson.

Após essa derrota, amigos o encorajaram a se concentrar no ensino. Seu primeiro aluno foi Djalma Bandeira, que se tornou um companheiro de viagem com quem Artur aprimorou suas habilidades. A roda de domingo em sua academia tornou-se lendária - um ponto de encontro onde mestres de todo o Brasil se reuniam. Como Mestre Paulão lembrou: "Mestres de todo o Brasil vinham à roda de Artur Emídio... aqui se congregavam os subúrbios, as zonas norte e sul, era uma capoeira eclética." Excelentes tocadores de berimbau como Mestres Paraná e Mucungê participavam de sua orquestra.

Com seu aluno Djalma Bandeira, Artur se apresentou no show folclórico "Skindô." O empresário cultural Abraham Medina os contratou para um show com o cantor romântico Nelson Gonçalves que excursionou por Nova York, Paris, Acapulco e Buenos Aires. Artur Emídio é provavelmente o primeiro capoeirista a se apresentar no exterior, sendo pioneiro da capoeira nos Estados Unidos, França, Uruguai e Argentina durante os anos 1950 e início dos 1960. Outros shows famosos incluíram "Capital Samba" e o musical "Arco-Íris," com artistas como Joãozinho da Goméia, Ary Barroso e Mestre Paraná.

A partir dos anos 1960, Artur abandonou os ringues e se dedicou exclusivamente à capoeira. Fazia apresentações por todo o Rio, atuava como juiz em competições incluindo o famoso Berimbau de Ouro, e envolveu-se com a Federação Carioca de Pugilismo, que começou a institucionalizar a capoeira. Em 1987, participou de um evento com velhos mestres baianos no Circo Voador, no Rio. Em 1967, ele e Mestre Bimba foram fotografados juntos em um simpósio de capoeira em Campos dos Afonsos, no Rio - Artur depois falou de seu "relacionamento um tanto conflituoso."

Treinou muitos alunos que se tornaram mestres importantes: Leopoldina (a partir de ~1954), Djalma Bandeira, Paulo Gomes, Mendonça, Celso do Engenho da Rainha, Vilela, Vilmar e Roberval Serejo. Mestre Paulo Gomes, também de Itabuna, posteriormente fundou a ABRACAP (Associação de Capoeira do Brasil) em 1985 e assessorou o Governador de São Paulo Mário Covas em legislação sobre capoeira.

Artur Emídio fazia parte de uma geração nascida nos anos 1930 que formou o núcleo da capoeira contemporânea do Rio de Janeiro, ao lado de Leopoldina, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes e Celso do Engenho. Há consenso de que quatro linhagens foram as principais influências na Capoeira Contemporânea do Rio: Artur Emídio, Paraná, Mário Buscapé e Roque.

Uma artrose no joelho esquerdo eventualmente o impossibilitou de continuar jogando e ensinando. Faleceu na tarde de 3 de maio de 2011, no Rio de Janeiro, aos 81 anos. A nota de falecimento do Portal Capoeira declarou: "A capoeira do Rio de Janeiro perdeu sua maior personalidade." A velha guarda da capoeira, no Rio e na Bahia, sabia que Artur era um dos maiores talentos de todos os tempos. Como disseram seus contemporâneos: "Ele fez pela capoeira o que, até hoje, todos nós juntos ainda não fizemos."

Um documentário "Do Ringue ao Palco" sobre sua vida, dirigido por Roberto Pereira e Ricardo Pereira, começou a ser gravado em 2018 e foi concluído em 2023. Os Mestres Genaro (1934-2022) e Polaco (1949-2021) deram depoimentos antes de suas mortes.',
  -- Achievements (English)
  E'- Pioneer of capoeira in Rio de Janeiro; established one of the first formal academies in the city (1955)
- Likely the first capoeirista to perform internationally, touring New York, Paris, Acapulco, and Buenos Aires (1950s-60s)
- Vale-tudo fighter defending capoeira''s reputation in the rings against Rudolf Hermanny, Hélio Gracie, and Robson Gracie
- Judge at Berimbau de Ouro competition
- Sunday rodas at Academia Artur Emídio were crucial meeting points for the development of Contemporary Capoeira
- Featured performer in folkloric shows "Skindô," "Capital Samba," and musical "Arco-Íris"
- One of "four main lineages" of contemporary Rio de Janeiro capoeira
- Subject of documentary "From the Ring to the Stage" (2023)
- Took over Mestre Paizinho''s academy at age 15 (1945)',
  -- Achievements (Portuguese)
  E'- Pioneiro da capoeira no Rio de Janeiro; estabeleceu uma das primeiras academias formais da cidade (1955)
- Provavelmente o primeiro capoeirista a se apresentar internacionalmente, excursionando por Nova York, Paris, Acapulco e Buenos Aires (anos 1950-60)
- Lutador de vale-tudo defendendo a reputação da capoeira nos ringues contra Rudolf Hermanny, Hélio Gracie e Robson Gracie
- Juiz no Berimbau de Ouro
- Rodas de domingo na Academia Artur Emídio foram pontos de encontro cruciais para o desenvolvimento da Capoeira Contemporânea
- Artista em destaque nos shows folclóricos "Skindô," "Capital Samba," e no musical "Arco-Íris"
- Uma das "quatro principais linhagens" da capoeira contemporânea do Rio de Janeiro
- Tema do documentário "Do Ringue ao Palco" (2023)
- Assumiu a academia de Mestre Paizinho aos 15 anos (1945)',
  -- Researcher notes (English)
  E'BIRTH DATE: March 31, 1930 - Confirmed by velhosmestres.com ("31st of March 1930"). Capoeirahistory.com lists only "1930."

DEATH DATE: May 3, 2011 - Confirmed by velhosmestres.com and Portal Capoeira obituary.

FIGHT DATE DISCREPANCY: The Robson Gracie fight is dated April 13, 1957 by capoeirahistory.com, but April 10, 1957 by velhosmestres.com. Both confirm the defeat in approximately 4 minutes.

HÉLIO GRACIE FIGHT: Described as a "draw" by rodadecapoeira.com.br for the June 1, 1954 fight. This contradicts some sources that describe it as a loss. Using "draw" based on the fight record.

TEACHER LINEAGE: Neném (African) → Paizinho (Teodoro Ramos) → Artur Emídio. Mestre Neném is described as "of African origin" but no other details available.

PAIZINHO''S DEATH: Two conflicting stories exist - (1) meningitis (Artur''s account) vs (2) fell trying to fly with palm leaves from a coconut tree (folk legend).

RELATIONSHIP WITH BIMBA: Artur Emídio described having a "somewhat conflictual relationship" with Mestre Bimba. They met at the 1967 capoeira symposium in Campos dos Afonsos, Rio. Artur''s academy is described as based on "the systematized method of Mestre Bimba," but this was learned through Paizinho''s lineage, not directly from Bimba.

LEOPOLDINA TIMELINE: Velhosmestres.com states Leopoldina became Artur''s student in 1955. Raridadesdacapoeira says ~1954. The Leopoldina profile already exists and should have a statement added.

STUDENTS TO VERIFY:
- Leopoldina (exists in DB) - ~1954-1955
- Djalma Bandeira (pending in backlog) - first student
- Paulo Gomes (pending in backlog) - 1962
- Celso do Engenho da Rainha (pending in backlog)
- Mendonça - needs research
- Vilela - needs research
- Vilmar - needs research
- Roberval Serejo - needs research
- Genaro (pending in backlog) - 1955

DOCUMENTARY: "From the Ring to the Stage" (Do Ringue ao Palco), directors Roberto Pereira and Ricardo Pereira. Recording started 2018, completed 2023. Photography by Paulo do Vale. Research/script by Roberto Pereira. Production by Coletivo Volta do Mundo e Ina Ilha.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- velhosmestres.com/en/featured-69
- portalcapoeira.com (death notice)
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- sites.google.com/view/raridadesdacapoeira/mestre-leopoldina
- nossa-tribo.com/mestre-artur-emidio/',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 31 de março de 1930 - Confirmado por velhosmestres.com ("31 de março de 1930"). Capoeirahistory.com lista apenas "1930."

DATA DE FALECIMENTO: 3 de maio de 2011 - Confirmado por velhosmestres.com e obituário do Portal Capoeira.

DISCREPÂNCIA NA DATA DA LUTA: A luta contra Robson Gracie é datada de 13 de abril de 1957 por capoeirahistory.com, mas 10 de abril de 1957 por velhosmestres.com. Ambos confirmam a derrota em aproximadamente 4 minutos.

LUTA CONTRA HÉLIO GRACIE: Descrita como "empate" por rodadecapoeira.com.br para a luta de 1º de junho de 1954. Isso contradiz algumas fontes que descrevem como derrota. Usando "empate" baseado no registro de lutas.

LINHAGEM DE MESTRE: Neném (Africano) → Paizinho (Teodoro Ramos) → Artur Emídio. Mestre Neném é descrito como "de origem africana" mas nenhum outro detalhe está disponível.

MORTE DE PAIZINHO: Duas histórias conflitantes existem - (1) meningite (relato de Artur) vs (2) caiu tentando voar com folhas de palmeira de um coqueiro (lenda popular).

RELACIONAMENTO COM BIMBA: Artur Emídio descreveu ter um "relacionamento um tanto conflituoso" com Mestre Bimba. Eles se encontraram no simpósio de capoeira de 1967 em Campos dos Afonsos, Rio. A academia de Artur é descrita como baseada no "método sistematizado de Mestre Bimba," mas isso foi aprendido através da linhagem de Paizinho, não diretamente de Bimba.

CRONOLOGIA DE LEOPOLDINA: Velhosmestres.com afirma que Leopoldina se tornou aluno de Artur em 1955. Raridadesdacapoeira diz ~1954. O perfil de Leopoldina já existe e deve ter uma declaração adicionada.

ALUNOS A VERIFICAR:
- Leopoldina (existe no BD) - ~1954-1955
- Djalma Bandeira (pendente no backlog) - primeiro aluno
- Paulo Gomes (pendente no backlog) - 1962
- Celso do Engenho da Rainha (pendente no backlog)
- Mendonça - precisa pesquisa
- Vilela - precisa pesquisa
- Vilmar - precisa pesquisa
- Roberval Serejo - precisa pesquisa
- Genaro (pendente no backlog) - 1955

DOCUMENTÁRIO: "Do Ringue ao Palco" (From the Ring to the Stage), diretores Roberto Pereira e Ricardo Pereira. Gravação iniciada em 2018, concluída em 2023. Fotografia de Paulo do Vale. Pesquisa/roteiro de Roberto Pereira. Produção de Coletivo Volta do Mundo e Ina Ilha.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- velhosmestres.com/en/featured-69
- portalcapoeira.com (nota de falecimento)
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- sites.google.com/view/raridadesdacapoeira/mestre-leopoldina
- nossa-tribo.com/mestre-artur-emidio/'
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
