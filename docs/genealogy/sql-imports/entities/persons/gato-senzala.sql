-- ============================================================
-- GENEALOGY PERSON: Gato (Senzala)
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH DATE: June 14, 1947 (exact, per Portal Capoeira interview,
-- MIS RJ series, capoeirahistory.com)
-- BIRTHPLACE: Recife, Pernambuco - moved to Rio de Janeiro in 1952
-- FULL NAME: Fernando Campelo Cavalcanti de Albuquerque
--
-- TITLE: Received mestre recognition after third Berimbau de Ouro
-- victory (1969) when barred from competition for being masters
--
-- STYLE: Regional/Contemporânea - trained initially with Paulo Flores
-- (Bimba lineage), visited Mestre Bimba's academy 1968, developed
-- Senzala methodology blending Regional, Angola, and Sinhozinho
--
-- NOTE: Uses apelido_context 'Senzala' to distinguish from:
-- - Mestre Gato Preto (José Gabriel Góes) - Salvador/CECA lineage
-- - Mestre Gato (Silvestre) - São Paulo/Amazon lineage
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
  -- Extended content (bilingual)
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  'Fernando Campelo Cavalcanti de Albuquerque',
  'Gato',
  'Senzala',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.gruposenzala.org/mestre-gato.html',
    'https://capoeirahistory.com/master-gato/',
    'https://www.lalaue.com/learn-capoeira/mestre-gato',
    'https://www.senzala.co.uk/history.html',
    'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-gato/',
    'https://www.radio.mis.rj.gov.br/news-455-mestre-gato-registra-sua-histOria-na-sErie-especial-memOria-da-capoeira-do-mis-rj'
  ]::text[],
  'contemporanea'::genealogy.style,
  E'Mestre Gato developed his capoeira within Grupo Senzala, pioneering the "Senzala style" that blended Capoeira Regional technique, Angola ground game, and Rio carioca elements. He helped create systematic training methodologies that would influence capoeira groups worldwide. His approach combined Mestre Bimba''s structured sequences with creativity and spontaneity, establishing Senzala as a technical and organizational reference for the art.',
  E'Mestre Gato desenvolveu sua capoeira dentro do Grupo Senzala, sendo pioneiro no "estilo Senzala" que mesclava técnica da Capoeira Regional, jogo de chão da Angola e elementos cariocas do Rio. Ajudou a criar metodologias de treinamento sistemáticas que influenciariam grupos de capoeira mundialmente. Sua abordagem combinou as sequências estruturadas de Mestre Bimba com criatividade e espontaneidade, estabelecendo o Senzala como referência técnica e organizacional para a arte.',
  1947,
  'exact'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  NULL,
  NULL,
  E'Fernando Campelo Cavalcanti de Albuquerque, known as Mestre Gato, was born on June 14, 1947, in Recife, Pernambuco, Brazil. In 1952, at age five, he moved with his family to Rio de Janeiro, where his capoeira journey would begin.

In 1963, at a party, Gato encountered Paulo Flores Viana, a young Bahian who had trained at Mestre Bimba''s academy in Salvador. Impressed by Paulo''s capoeira abilities, Gato became friends with him and began training on the terrace of Paulo''s apartment building in the Laranjeiras district. Alongside Paulo''s brothers Rafael and Gilberto, and a growing group of teenagers, they formed the nucleus of what would become Grupo Senzala.

In 1964, Gato and Paulo represented Santana academy at the "Berimbau de Prata" competition, placing third. By 1966, when the group performed at a German Club and formally introduced themselves as "Grupo Senzala", Gato was already one of its core members.

In 1967, Gato began teaching capoeira at Brazil''s two most prestigious universities—UFRJ (where he studied Civil Engineering) and PUC-RJ—becoming the first to introduce capoeira at these institutions. That same year, he and Mestre Preguiça represented Grupo Senzala at the first Berimbau de Ouro tournament held at Feira da Providência around Lagoa Rodrigo de Freitas. They won. They won again in 1968. When they attempted to enter the third competition in 1969, the Capoeira Association barred them, declaring that their record had earned them recognition as masters—not students. Gato and Preguiça protested they were students, not masters. The association replied that two consecutive victories had established their master status. Unable to compete, they trained Mosquito and Borracha, who won the third Berimbau de Ouro, permanently securing the trophy for Senzala.

In 1968, Gato visited Mestre Bimba''s academy in Salvador. He also trained with Mestres Ezequiel, Saci, and Popó in Santo Amaro da Purificação, and participated in Sunday rodas at Mestre Artur Emídio''s academy in Bonsucesso (since 1965). He trained with Mestre Acordeon when Acordeon visited Rio. He connected with Mestre Suassuna and Paulo Gomes in São Paulo, building bridges across Brazil''s capoeira communities.

In 1972, Gato participated in discussions about capoeira regulation in Brazil. In 1973, he received registration number 12 in the General Register of Capoeira Masters of Brazil as a green and white cord from the Brazilian Boxing Confederation—an early attempt to formalize capoeira''s status.

In 1989, Gato traveled to Newcastle, England, to pursue a Master''s degree in Water Resources Systems Engineering. While studying, he discovered that "the English have rhythm and like to fight", and organized capoeira rodas at the university. The success led him to create Grupo Senzala of Great Britain (GSGB), expanding the Senzala presence internationally.

In 1991, back in Rio, Gato organized the 25 Years of Grupo Senzala festival at the UERJ campus, bringing together red-cord members and capoeiristas from across Brazil. That same year, he graduated his son Pedro as instructor.

In October 2011, Gato received the Prêmio Viva Meu Mestre (2010 Edition), awarded by IPHAN (Brazil''s Institute of National Historical and Artistic Heritage) to honor masters who preserve capoeira''s cultural tradition. By 2014, he was appointed Titular Counselor on the Council of Capoeira Masters of Rio de Janeiro State, and by 2017, he became a full member of IPHAN''s coordinated Rio de Janeiro State Council of Mestres.

On March 27, 2024, Mestre Gato recorded his oral testimony for the "Memória da Capoeira" special series at MIS RJ (Museum of Image and Sound), documenting four generations of Rio capoeira masters since the 1940s. The session was conducted by Mestre Paulão Kikongo, Mestra Celi, his son Mestre Pedro, and his wife Maria Beatriz Albuquerque.

As of 2025, Mestre Gato continues organizing the annual "Vadiação Senzala" gathering and participates in international capoeira events. Under his leadership, Capoeira Senzala has graduated 96 mestres (red belts), with 75 currently serving as group representatives. He remains one of the founding red cords who helped establish the collaborative leadership model that defines Grupo Senzala—one of the most influential capoeira organizations in the world.',
  E'Fernando Campelo Cavalcanti de Albuquerque, conhecido como Mestre Gato, nasceu em 14 de junho de 1947, em Recife, Pernambuco, Brasil. Em 1952, aos cinco anos, mudou-se com sua família para o Rio de Janeiro, onde sua jornada na capoeira começaria.

Em 1963, em uma festa, Gato conheceu Paulo Flores Viana, um jovem baiano que havia treinado na academia de Mestre Bimba em Salvador. Impressionado com as habilidades de Paulo na capoeira, Gato tornou-se seu amigo e começou a treinar no terraço do prédio de Paulo no bairro de Laranjeiras. Junto com os irmãos de Paulo, Rafael e Gilberto, e um grupo crescente de adolescentes, formaram o núcleo do que se tornaria o Grupo Senzala.

Em 1964, Gato e Paulo representaram a academia Santana na competição "Berimbau de Prata", conquistando o terceiro lugar. Em 1966, quando o grupo se apresentou em um Clube Alemão e se apresentou formalmente como "Grupo Senzala", Gato já era um de seus membros centrais.

Em 1967, Gato começou a ensinar capoeira nas duas universidades mais prestigiadas do Brasil—UFRJ (onde estudava Engenharia Civil) e PUC-RJ—tornando-se o primeiro a introduzir a capoeira nessas instituições. Nesse mesmo ano, ele e Mestre Preguiça representaram o Grupo Senzala no primeiro torneio Berimbau de Ouro realizado na Feira da Providência, ao redor da Lagoa Rodrigo de Freitas. Eles venceram. Venceram novamente em 1968. Quando tentaram participar da terceira competição em 1969, a Associação de Capoeira os barrou, declarando que seu histórico lhes havia rendido reconhecimento como mestres—não alunos. Gato e Preguiça protestaram que eram alunos, não mestres. A associação respondeu que duas vitórias consecutivas haviam estabelecido seu status de mestre. Impossibilitados de competir, treinaram Mosquito e Borracha, que venceram o terceiro Berimbau de Ouro, assegurando permanentemente o troféu para o Senzala.

Em 1968, Gato visitou a academia de Mestre Bimba em Salvador. Também treinou com os Mestres Ezequiel, Saci e Popó em Santo Amaro da Purificação, e participou de rodas dominicais na academia de Mestre Artur Emídio em Bonsucesso (desde 1965). Treinou com Mestre Acordeon quando este visitava o Rio. Conectou-se com Mestre Suassuna e Paulo Gomes em São Paulo, construindo pontes entre as comunidades de capoeira do Brasil.

Em 1972, Gato participou de discussões sobre a regulamentação da capoeira no Brasil. Em 1973, recebeu o registro número 12 no Cadastro Geral dos Mestres de Capoeira do Brasil como cordão verde e branco da Confederação Brasileira de Pugilismo—uma tentativa inicial de formalizar o status da capoeira.

Em 1989, Gato viajou para Newcastle, Inglaterra, para cursar mestrado em Engenharia de Sistemas de Recursos Hídricos. Enquanto estudava, descobriu que "os ingleses têm ritmo e gostam de lutar", e organizou rodas de capoeira na universidade. O sucesso o levou a criar o Grupo Senzala da Grã-Bretanha (GSGB), expandindo a presença do Senzala internacionalmente.

Em 1991, de volta ao Rio, Gato organizou o festival dos 25 Anos do Grupo Senzala no campus da UERJ, reunindo membros de cordão vermelho e capoeiristas de todo o Brasil. Nesse mesmo ano, formou seu filho Pedro como instrutor.

Em outubro de 2011, Gato recebeu o Prêmio Viva Meu Mestre (Edição 2010), concedido pelo IPHAN (Instituto do Patrimônio Histórico e Artístico Nacional) para homenagear mestres que preservam a tradição cultural da capoeira. Em 2014, foi nomeado Conselheiro Titular do Conselho de Mestres de Capoeira do Estado do Rio de Janeiro, e em 2017, tornou-se membro pleno do Conselho Estadual de Mestres do Rio de Janeiro coordenado pelo IPHAN.

Em 27 de março de 2024, Mestre Gato registrou seu depoimento oral para a série especial "Memória da Capoeira" no MIS RJ (Museu da Imagem e do Som), documentando quatro gerações de mestres de capoeira do Rio desde os anos 1940. A sessão foi conduzida por Mestre Paulão Kikongo, Mestra Celi, seu filho Mestre Pedro e sua esposa Maria Beatriz Albuquerque.

Em 2025, Mestre Gato continua organizando o encontro anual "Vadiação Senzala" e participa de eventos internacionais de capoeira. Sob sua liderança, a Capoeira Senzala formou 96 mestres (cordões vermelhos), com 75 atualmente servindo como representantes do grupo. Ele permanece como um dos cordões vermelhos fundadores que ajudaram a estabelecer o modelo de liderança colaborativa que define o Grupo Senzala—uma das organizações de capoeira mais influentes do mundo.',
  E'- Introduced capoeira at UFRJ and PUC-RJ (1967)—first to teach at these prestigious universities
- Won Berimbau de Ouro tournament with Preguiça (1967, 1968), trained winning team (1969)
- Co-founder of Grupo Senzala (formally named 1966)
- Founded Grupo Senzala of Great Britain (GSGB, 1989/1990)
- Prêmio Viva Meu Mestre – Edição 2010 (IPHAN, awarded October 2011)
- Registration #12 in General Register of Capoeira Masters of Brazil (1973)
- Titular Counselor, Council of Capoeira Masters of Rio de Janeiro State (2014)
- Full Member, IPHAN Rio de Janeiro State Council of Mestres (2017)
- Graduated 96 mestres (red belts) through Capoeira Senzala
- Master''s degree in Water Resources Systems Engineering (Newcastle University, 1989)
- MIS RJ "Memória da Capoeira" oral history recording (2024)',
  E'- Introduziu a capoeira na UFRJ e PUC-RJ (1967)—primeiro a ensinar nessas universidades de prestígio
- Venceu o torneio Berimbau de Ouro com Preguiça (1967, 1968), treinou equipe vencedora (1969)
- Co-fundador do Grupo Senzala (formalmente nomeado 1966)
- Fundou o Grupo Senzala da Grã-Bretanha (GSGB, 1989/1990)
- Prêmio Viva Meu Mestre – Edição 2010 (IPHAN, concedido outubro 2011)
- Registro nº 12 no Cadastro Geral dos Mestres de Capoeira do Brasil (1973)
- Conselheiro Titular, Conselho de Mestres de Capoeira do Estado do Rio de Janeiro (2014)
- Membro Pleno, Conselho Estadual de Mestres do Rio de Janeiro do IPHAN (2017)
- Formou 96 mestres (cordões vermelhos) através da Capoeira Senzala
- Mestrado em Engenharia de Sistemas de Recursos Hídricos (Newcastle University, 1989)
- Gravação de história oral "Memória da Capoeira" do MIS RJ (2024)',
  E'PRIMARY TEACHER:
- Paulo Flores Viana (1963 onward) - initial mentor and primary teacher; trained at Mestre Bimba''s academy in Salvador

INFLUENCES (exposure through visits/rodas, not formal instruction):
- Mestre Artur Emídio - attended Sunday open rodas at his Bonsucesso academy (1965+)
- Mestre Acordeon - trained alongside during Rio visits (peers through Flores brothers)
- Mestre Bimba - visited his Salvador academy in 1968 (pilgrimage, not sustained training)
- Mestres Ezequiel, Saci, Popó - brief training during visit to Santo Amaro da Purificação (1968)

STUDENTS:
- Mestre Pedro (Fernando''s son) - graduated 1991 as instructor, later mestre; cultural producer
- Nestor Capoeira - supervised his teaching at UFRJ (1968)
- 96 mestres (red belts) graduated through Capoeira Senzala system

BERIMBAU DE OURO COMPETITIONS:
- 1964: Berimbau de Prata with Paulo Flores - 3rd place (Santana academy)
- 1967: Berimbau de Ouro with Preguiça - 1st place (Grupo Senzala)
- 1968: Berimbau de Ouro with Preguiça - 1st place (Grupo Senzala)
- 1969: Barred as recognized masters; trained Mosquito and Borracha who won

FAMILY:
- Wife: Maria Beatriz Albuquerque (artisanal teacher)
- Son: Mestre Pedro (cultural producer, professor, capoeira coordinator)

ORGANIZATIONS:
- Grupo Senzala de Capoeira de Santa Tereza (founded March 30, 1994, Rio de Janeiro)
- Grupo Senzala of Great Britain (GSGB, founded 1989/1990)

NAME DISCREPANCY:
- "Fernando Campelo Cavalcanti de Albuquerque" - Portal Capoeira interview, capoeirahistory.com (MAJORITY)
- "Fernando C. de Albuquerque" - Some sources abbreviate middle names
- "Fernando Albuquerque" - Simplified version used in some English sources

BIRTH YEAR DISCREPANCY:
- 1947 (June 14) - Portal Capoeira interview, capoeirahistory.com, MIS RJ (MAJORITY)
- 1948 - Lalaue, Senzala Midlands (calculated from "age 16 in 1964")
- Using 1947 as confirmed by primary Brazilian sources',
  E'PROFESSORES:
- Paulo Flores Viana (1963 em diante) - mentor inicial, treinou na academia de Mestre Bimba em Salvador
- Mestre Artur Emídio - frequentou rodas dominicais em sua academia em Bonsucesso (1965+)
- Mestre Acordeon - treinou com ele durante visitas ao Rio
- Mestre Bimba - visitou sua academia em Salvador (1968)
- Mestres Ezequiel, Saci, Popó - treinou com eles em Santo Amaro da Purificação (1968)

ALUNOS:
- Mestre Pedro (filho de Fernando) - formado 1991 como instrutor, depois mestre; produtor cultural
- Nestor Capoeira - supervisionou seu ensino na UFRJ (1968)
- 96 mestres (cordões vermelhos) formados através do sistema Capoeira Senzala

COMPETIÇÕES BERIMBAU DE OURO:
- 1964: Berimbau de Prata com Paulo Flores - 3º lugar (academia Santana)
- 1967: Berimbau de Ouro com Preguiça - 1º lugar (Grupo Senzala)
- 1968: Berimbau de Ouro com Preguiça - 1º lugar (Grupo Senzala)
- 1969: Barrados como mestres reconhecidos; treinaram Mosquito e Borracha que venceram

FAMÍLIA:
- Esposa: Maria Beatriz Albuquerque (professora artesanal)
- Filho: Mestre Pedro (produtor cultural, professor, coordenador de capoeira)

ORGANIZAÇÕES:
- Grupo Senzala de Capoeira de Santa Tereza (fundado 30 de março de 1994, Rio de Janeiro)
- Grupo Senzala da Grã-Bretanha (GSGB, fundado 1989/1990)

DISCREPÂNCIA DE NOME:
- "Fernando Campelo Cavalcanti de Albuquerque" - Entrevista Portal Capoeira, capoeirahistory.com (MAIORIA)
- "Fernando C. de Albuquerque" - Algumas fontes abreviam nomes do meio
- "Fernando Albuquerque" - Versão simplificada usada em algumas fontes inglesas

DISCREPÂNCIA DE ANO DE NASCIMENTO:
- 1947 (14 de junho) - Entrevista Portal Capoeira, capoeirahistory.com, MIS RJ (MAIORIA)
- 1948 - Lalaue, Senzala Midlands (calculado de "16 anos em 1964")
- Usando 1947 conforme confirmado por fontes primárias brasileiras'
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
