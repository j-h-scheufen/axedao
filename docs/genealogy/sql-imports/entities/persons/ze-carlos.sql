-- ============================================================
-- GENEALOGY PERSON: Zé Carlos
-- Generated: 2025-12-28
-- ============================================================
-- One of the first mestres of Capoeira Angola formed outside
-- Bahia (December 16, 1978). Co-founder of GCAP. Founder of
-- Grupo de Capoeira Angola N'Golo (1991) in Nova Iguaçu.
-- Continues teaching at Mercado das Pulgas in Santa Teresa,
-- Rio de Janeiro.
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
  'José Carlos Gonçalves',
  'Zé Carlos',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.angolangolo.com.br/', 'https://www.angolangolo.com.br/english/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Capoeira Angola purist in the Pastinha lineage, trained under Mestre Moraes. Founded Grupo de Capoeira Angola N''Golo to preserve and transmit the Angola tradition. The group name references the n''golo (zebra dance), a ritual of African tribes in Angola believed to have influenced the origins of capoeira. Emphasizes the philosophical and cultural dimensions of the art.',
  E'Purista da Capoeira Angola na linhagem de Pastinha, treinado por Mestre Moraes. Fundou o Grupo de Capoeira Angola N''Golo para preservar e transmitir a tradição de Angola. O nome do grupo referencia o n''golo (dança da zebra), um ritual das tribos africanas de Angola que se acredita ter influenciado as origens da capoeira. Enfatiza as dimensões filosóficas e culturais da arte.',
  -- Life dates (estimated: trained with Neco (b.1955) and Braga (b.1957), started 1973)
  1955,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'José Carlos Gonçalves, known as Mestre Zé Carlos, is one of the pioneers who helped establish Capoeira Angola outside of Bahia. He began his apprenticeship in 1973 with Mestre Moraes in Rio de Janeiro, shortly after Moraes arrived from Salvador for his military service. During the twelve years Moraes spent in Rio, he trained a core group of students who would become the first mestres of Capoeira Angola formed outside Bahia.

In December 1975, Zé Carlos made a pivotal journey to Salvador with a group that included Moraes, Braga, Neco, Marco Aurélio, Tete, and Amalha. During this trip, they visited Mestre Pastinha himself—the legendary guardian of Capoeira Angola. The group remained in Salvador for January, participating in Bonfim festival celebrations. This direct connection to the source of the tradition would profoundly shape Zé Carlos''s understanding and commitment to the art.

On December 16, 1978, at Parque Lage in Jardim Botânico, Rio de Janeiro, Zé Carlos received the rank of Mestre in a ceremonial advancement alongside his colleagues Braga and Neco. Marco Aurélio was simultaneously promoted to Contra-Mestre. Mestres Camisa and Preguiça attended as honored guests. These were the first mestres of Capoeira Angola formed outside of Bahia—a historic milestone that demonstrated the art could be authentically transmitted beyond its traditional heartland.

On October 5, 1980, at a craft fair in Cosme Velho in Rio''s south zone, Zé Carlos co-founded the Grupo de Capoeira Angola Pelourinho (GCAP) along with Mestres Moraes, Braga, and Neco, with Contra-Mestres Marco Aurélio and Peçanha (later known as Cobra Mansa). The founding idea originated from Mestre Neco, who envisioned an organization to oppose the Brazilian military government''s suppression of African culture and preserve Pastinha''s legacy. Mestre Braga designed the group''s iconic logo—a berimbau and two zebras fighting, symbolizing capoeira''s African origins.

In 1982, Mestre Moraes returned to Salvador, bringing Cobra Mansa with him. He left the three young Rio mestres—Braga, Neco, and Zé Carlos—with full autonomy and responsibility to continue his teachings.

In 1983, Zé Carlos began working with Capoeira Angola in Nova Iguaçu, in the Baixada Fluminense region of Rio de Janeiro. During 1991, he definitively left GCAP and founded the Grupo de Capoeira Angola N''Golo on December 10, 1991. The name "N''golo" was the idea of his wife Dona Rosemery (in memoriam), chosen because it refers to a ritual of African tribes in Angola based on the mating rite of zebras. According to tradition, the n''golo in Brazil, among the enslaved Africans, originated capoeira angola within the slave quarters.

In the group''s formation, Zé Carlos had the support of fellow capoeiristas and students who together have maintained the group''s activities for over three decades. He faced a significant physical challenge when he suffered an Achilles tendon injury on November 24, 1992. After surgery on March 4, 1993, he returned to active play on November 16, 1993—demonstrating the resilience that characterizes his dedication to the art.

In 1995, he began teaching at Academia Irmãos Reis in the Catete neighborhood. In February 1997, at the invitation of Mestre Braga, he moved to the UNE building in Catete, which became a central location for Capoeira Angola in Rio. That same year, the CCARJ (Centro de Capoeira Angola do Rio de Janeiro) was founded, with Mestres Braga, Zé Carlos, and Mano as representatives, along with Contramestre Lumumba and Professor Pedro (Chopinho). This center united the groups Flor da Gente, África Bantu, and N''Golo, providing multiple daily classes and consolidating the Angola community in Rio.

Grupo N''Golo left CCARJ and finished its classes at UNE in early 2002. From 2003 to 2005, the group occupied a space at the Centro Cultural Laurinda Santos Lobo.

Zé Carlos appeared in the documentary "Pastinha! Uma Vida Pela Capoeira" (1998), directed by Toninho Muricy, alongside Mestres Braga, Curió, and João Grande. He was also featured in the 1991 commemorative video celebrating ten years of GCAP activities in Rio de Janeiro, including a notable "Jogo do Dinheiro" (Money Game) with Mestre Armandinho.

Today, Grupo N''Golo conducts training and classes at the Mercado das Pulgas in the bohemian neighborhood of Santa Teresa, with additional spaces in Tijuca and Urca. Classes are taught by Mestre José Carlos and supported by his most experienced students. The group organizes a monthly roda on the last Wednesday of each month at the Mercado das Pulgas location. Mestre Zé Carlos continues to teach, maintaining the Angola tradition he learned from Mestre Moraes and carrying forward the legacy of Mestre Pastinha.',
  -- Extended content (bio_pt)
  E'José Carlos Gonçalves, conhecido como Mestre Zé Carlos, é um dos pioneiros que ajudaram a estabelecer a Capoeira Angola fora da Bahia. Começou sua aprendizagem em 1973 com Mestre Moraes no Rio de Janeiro, pouco depois de Moraes chegar de Salvador para seu serviço militar. Durante os doze anos que Moraes passou no Rio, treinou um grupo central de alunos que se tornariam os primeiros mestres de Capoeira Angola formados fora da Bahia.

Em dezembro de 1975, Zé Carlos fez uma jornada fundamental a Salvador com um grupo que incluía Moraes, Braga, Neco, Marco Aurélio, Tete e Amalha. Durante essa viagem, visitaram o próprio Mestre Pastinha—o lendário guardião da Capoeira Angola. O grupo permaneceu em Salvador em janeiro, participando das celebrações do festival do Bonfim. Essa conexão direta com a fonte da tradição moldaria profundamente a compreensão e o compromisso de Zé Carlos com a arte.

Em 16 de dezembro de 1978, no Parque Lage no Jardim Botânico, Rio de Janeiro, Zé Carlos recebeu o grau de Mestre em uma cerimônia de promoção junto com seus colegas Braga e Neco. Marco Aurélio foi simultaneamente promovido a Contra-Mestre. Os Mestres Camisa e Preguiça compareceram como convidados de honra. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia—um marco histórico que demonstrou que a arte poderia ser autenticamente transmitida além de sua terra natal tradicional.

Em 5 de outubro de 1980, em uma feira de artesanato em Cosme Velho na zona sul do Rio, Zé Carlos co-fundou o Grupo de Capoeira Angola Pelourinho (GCAP) junto com os Mestres Moraes, Braga e Neco, com os Contra-Mestres Marco Aurélio e Peçanha (mais tarde conhecido como Cobra Mansa). A ideia de fundação originou-se de Mestre Neco, que vislumbrou uma organização para se opor à supressão da cultura africana pelo governo militar brasileiro e preservar o legado de Pastinha. Mestre Braga desenhou o icônico logotipo do grupo—um berimbau e duas zebras lutando, simbolizando as origens africanas da capoeira.

Em 1982, Mestre Moraes retornou a Salvador, trazendo Cobra Mansa. Ele deixou os três jovens mestres cariocas—Braga, Neco e Zé Carlos—com total autonomia e responsabilidade para continuar seus ensinamentos.

Em 1983, Zé Carlos começou a trabalhar com Capoeira Angola em Nova Iguaçu, na região da Baixada Fluminense do Rio de Janeiro. Durante 1991, deixou definitivamente o GCAP e fundou o Grupo de Capoeira Angola N''Golo em 10 de dezembro de 1991. O nome "N''golo" foi ideia de sua esposa Dona Rosemery (in memoriam), escolhido porque se refere a um ritual das tribos africanas de Angola baseado no rito de acasalamento das zebras. Segundo a tradição, o n''golo no Brasil, entre os africanos escravizados, originou a capoeira angola no interior das senzalas.

Na formação do grupo, Zé Carlos contou com o apoio de colegas capoeiristas e alunos que juntos mantêm as atividades do grupo há mais de três décadas. Enfrentou um desafio físico significativo quando sofreu uma lesão no tendão de Aquiles em 24 de novembro de 1992. Após cirurgia em 4 de março de 1993, retornou ao jogo ativo em 16 de novembro de 1993—demonstrando a resiliência que caracteriza sua dedicação à arte.

Em 1995, começou a dar aulas na Academia Irmãos Reis no bairro do Catete. Em fevereiro de 1997, a convite de Mestre Braga, mudou-se para o prédio da UNE no Catete, que se tornou um local central para a Capoeira Angola no Rio. Nesse mesmo ano, foi fundado o CCARJ (Centro de Capoeira Angola do Rio de Janeiro), com os Mestres Braga, Zé Carlos e Mano como representantes, junto com Contramestre Lumumba e Professor Pedro (Chopinho). Este centro uniu os grupos Flor da Gente, África Bantu e N''Golo, oferecendo múltiplas aulas diárias e consolidando a comunidade de Angola no Rio.

O Grupo N''Golo deixou o CCARJ e encerrou suas aulas na UNE no início de 2002. De 2003 a 2005, o grupo ocupou um espaço no Centro Cultural Laurinda Santos Lobo.

Zé Carlos apareceu no documentário "Pastinha! Uma Vida Pela Capoeira" (1998), dirigido por Toninho Muricy, ao lado dos Mestres Braga, Curió e João Grande. Também foi destaque no vídeo comemorativo de 1991 celebrando dez anos de atividades do GCAP no Rio de Janeiro, incluindo um notável "Jogo do Dinheiro" com Mestre Armandinho.

Hoje, o Grupo N''Golo realiza seus treinos e aulas no Mercado das Pulgas no boêmio bairro de Santa Teresa, com espaços adicionais na Tijuca e Urca. As aulas são ministradas por Mestre José Carlos e apoiadas por seus alunos mais experientes. O grupo organiza uma roda mensal na última quarta-feira de cada mês no local do Mercado das Pulgas. Mestre Zé Carlos continua a ensinar, mantendo a tradição de Angola que aprendeu com Mestre Moraes e levando adiante o legado de Mestre Pastinha.',
  -- Achievements
  E'- One of the first mestres of Capoeira Angola formed outside of Bahia (December 16, 1978)
- Co-founder of Grupo de Capoeira Angola Pelourinho (GCAP) on October 5, 1980
- Founder of Grupo de Capoeira Angola N''Golo (December 10, 1991)
- Met Mestre Pastinha in Salvador (December 1975)
- Pioneer of Capoeira Angola in Nova Iguaçu, Baixada Fluminense (1983)
- Co-founder of CCARJ (Centro de Capoeira Angola do Rio de Janeiro) in 1997
- Featured in documentary "Pastinha! Uma Vida Pela Capoeira" (1998)
- Over 50 years maintaining Capoeira Angola tradition in Rio de Janeiro',
  E'- Um dos primeiros mestres de Capoeira Angola formados fora da Bahia (16 de dezembro de 1978)
- Co-fundador do Grupo de Capoeira Angola Pelourinho (GCAP) em 5 de outubro de 1980
- Fundador do Grupo de Capoeira Angola N''Golo (10 de dezembro de 1991)
- Conheceu Mestre Pastinha em Salvador (dezembro de 1975)
- Pioneiro da Capoeira Angola em Nova Iguaçu, Baixada Fluminense (1983)
- Co-fundador do CCARJ (Centro de Capoeira Angola do Rio de Janeiro) em 1997
- Participou do documentário "Pastinha! Uma Vida Pela Capoeira" (1998)
- Mais de 50 anos mantendo a tradição de Capoeira Angola no Rio de Janeiro',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1955, decade):
Fellow students Neco (born April 24, 1955) and Braga (born June 13, 1957) received mestre titles together with Zé Carlos on December 16, 1978. Zé Carlos started training in 1973. Assuming he was 18-20 years old when starting (typical for serious training), birth year would be ~1953-1955. Using decade precision, estimated 1955 to align with Neco''s documented birth year.

BIRTH PLACE: Not documented. Based in Rio de Janeiro throughout career.

TRAINING TIMELINE:
- 1973: Began training with Mestre Moraes in Rio de Janeiro
- December 1975: Traveled to Salvador to meet Pastinha with Moraes group
- December 16, 1978: Received Mestre title at Parque Lage

WIFE: Dona Rosemery (in memoriam) - suggested the name "N''Golo" for the group

ACHILLES TENDON INJURY TIMELINE:
- November 24, 1992: Injury
- March 4, 1993: Surgery
- November 16, 1993: Returned to active play

TEACHING LOCATIONS:
- 1983: Nova Iguaçu (started teaching)
- 1995: Academia Irmãos Reis, Catete
- February 1997: UNE building, Catete (invited by Braga)
- Early 2002: Left UNE
- 2003-2005: Centro Cultural Laurinda Santos Lobo
- Current: Mercado das Pulgas, Santa Teresa; also Tijuca and Urca

MEDIA APPEARANCES:
- 1991: "Dez Anos de Atividades" GCAP video (by Antonio Carlos Muricy) - "Jogo do Dinheiro" with Mestre Armandinho
- 1998: "Pastinha! Uma Vida Pela Capoeira" documentary (by Toninho Muricy)

CCARJ:
- Founded mid-1997
- Representatives: Mestres Braga, Zé Carlos, Mano; C/Mestre Lumumba; Professor Pedro (Chopinho)
- United groups: Flor da Gente, África Bantu, N''Golo
- Grupo N''Golo left CCARJ early 2002

STUDENTS: Specific named students not documented. Classes supported by "most experienced students."',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1955, década):
Os colegas Neco (nascido em 24 de abril de 1955) e Braga (nascido em 13 de junho de 1957) receberam títulos de mestre junto com Zé Carlos em 16 de dezembro de 1978. Zé Carlos começou a treinar em 1973. Assumindo que tinha 18-20 anos quando começou (típico para treinamento sério), o ano de nascimento seria ~1953-1955. Usando precisão de década, estimado 1955 para alinhar com o ano de nascimento documentado de Neco.

LOCAL DE NASCIMENTO: Não documentado. Baseado no Rio de Janeiro durante toda a carreira.

CRONOLOGIA DE TREINO:
- 1973: Começou a treinar com Mestre Moraes no Rio de Janeiro
- Dezembro de 1975: Viajou a Salvador para conhecer Pastinha com o grupo de Moraes
- 16 de dezembro de 1978: Recebeu título de Mestre no Parque Lage

ESPOSA: Dona Rosemery (in memoriam) - sugeriu o nome "N''Golo" para o grupo

CRONOLOGIA DA LESÃO DO TENDÃO DE AQUILES:
- 24 de novembro de 1992: Lesão
- 4 de março de 1993: Cirurgia
- 16 de novembro de 1993: Retornou ao jogo ativo

LOCAIS DE ENSINO:
- 1983: Nova Iguaçu (começou a ensinar)
- 1995: Academia Irmãos Reis, Catete
- Fevereiro de 1997: Prédio da UNE, Catete (convidado por Braga)
- Início de 2002: Deixou a UNE
- 2003-2005: Centro Cultural Laurinda Santos Lobo
- Atual: Mercado das Pulgas, Santa Teresa; também Tijuca e Urca

APARIÇÕES NA MÍDIA:
- 1991: Vídeo "Dez Anos de Atividades" do GCAP (por Antonio Carlos Muricy) - "Jogo do Dinheiro" com Mestre Armandinho
- 1998: Documentário "Pastinha! Uma Vida Pela Capoeira" (por Toninho Muricy)

CCARJ:
- Fundado em meados de 1997
- Representantes: Mestres Braga, Zé Carlos, Mano; C/Mestre Lumumba; Professor Pedro (Chopinho)
- Grupos unidos: Flor da Gente, África Bantu, N''Golo
- Grupo N''Golo deixou o CCARJ no início de 2002

ALUNOS: Alunos específicos não documentados. Aulas apoiadas pelos "alunos mais experientes."'
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
