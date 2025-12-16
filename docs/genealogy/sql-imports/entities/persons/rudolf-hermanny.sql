-- ============================================================
-- GENEALOGY PERSON: Rudolf Hermanny
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION (1931): He was described as 17 years old
-- in April 1949, which places his birth between April 1931 and
-- April 1932. Sources suggest August 16, 1931 in São Paulo.
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
  'Rudolf de Otero Hermanny',
  'Rudolf Hermanny',
  NULL,  -- No formal capoeira title; primarily known by his name
  NULL,  -- No public domain portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho/', 'https://rohermanny.tripod.com/']::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'Rudolf Hermanny practiced capoeira carioca under Mestre Sinhozinho, a combat-focused style distinct from both Angola and Regional. His training emphasized fighting effectiveness, incorporating elements of Greco-Roman wrestling, boxing, and judo. He demonstrated traditional techniques including the baiana and quarenta e um dobrado. His fighting style combined capoeira kicks (rabo de arraia, rasteira) with boxing defense and wrestling techniques.',
  E'Rudolf Hermanny praticou capoeira carioca sob Mestre Sinhozinho, um estilo focado em combate distinto tanto do Angola quanto da Regional. Seu treinamento enfatizava eficácia no combate, incorporando elementos de luta greco-romana, boxe e judô. Ele demonstrava técnicas tradicionais incluindo a baiana e quarenta e um dobrado. Seu estilo de luta combinava chutes de capoeira (rabo de arraia, rasteira) com defesa de boxe e técnicas de luta.',
  -- Life dates
  1931,
  'year'::genealogy.date_precision,
  'São Paulo, Brazil',
  NULL,  -- Possibly still alive (LinkedIn profile exists)
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Rudolf de Otero Hermanny was born on August 16, 1931, in São Paulo. As a young man, his family migrated to the State of Guanabara (now Rio de Janeiro), where he would become one of the most accomplished fighters trained by Mestre Sinhozinho and one of the prominent names in Brazilian capoeira history.

Hermanny began training at Sinhozinho''s academies in Ipanema during the mid-1940s, alongside other notable students including his brother Bruno. His training went beyond capoeira to include boxing, weightlifting, and the practical combat methods that Sinhozinho taught. He demonstrated traditional capoeira carioca techniques including the baiana and quarenta e um dobrado, while also training with judoka Augusto Cordeiro, who served as Sinhozinho''s combat consultant.

At just seventeen years old, Hermanny gained national attention in the famous 1949 Capoeira Challenge. On April 1, 1949, newspaper A Noite announced "Capoeira Challenge - Sinhozinho of the Federal District against Master Bimba from Bahia." The event was organized by the Federação Metropolitana de Pugilismo and held over two days at the Estádio Carioca on Avenida Passos in downtown Rio. In the second bout on April 7, young Hermanny faced Fernando Rodrigues Perez, a student of Mestre Bimba''s Capoeira Regional. Hermanny dominated the fight, defeating Perez in just two minutes and injuring his arm with a devastating kick. According to reports, Bimba himself was so impressed by some of the movements he witnessed that he incorporated them into his own style.

Four years later, Hermanny represented Sinhozinho again in a challenge against the Gracie family. On March 17, 1953, a vale tudo charity event was held at the Vasco da Gama stadium for drought relief in northeastern Brazil. Hermanny faced Guanair Vial Gomes, who was significantly heavier and had a wrestling background. The Gracie fighter dominated the opening minutes with ground and pound, but Hermanny escaped to his feet and controlled the remainder of the match. After one hour and ten minutes, with Gomes heavily battered and Hermanny looking fresher, Carlos Gracie called for the match to be stopped and declared a draw. Hermanny remains the only capoeirista known to have fought a jiu-jitsu practitioner for over an hour without losing.

On June 29, 1953, Hermanny fought another significant bout at the Palácio de Alumínio under Burlamaqui''s capoeira rules (with groundwork modifications). His opponent was Artur Emídio de Oliveira, a Capoeira Regional fighter from Bahia and a popular vale tudo competitor. Carlos and Hélio Gracie were among the spectators. Hermanny controlled the first round with roundhouse kicks and palm strikes, defending with a boxing guard. In the second round, he came out with increased aggression, knocking Emídio down several times with kicks before landing his own rasteira. In a decisive moment, Hermanny timed a stomp on Emídio''s face as the latter was getting up, then followed with strikes and a throw that drove referee Jayme Ferreira to stop the fight before Emídio was fully knocked out.

Beyond capoeira, Hermanny achieved significant success in other disciplines. He became a Brazilian and Pan-American judo team champion in Mexico in 1960, earning the nickname "the Bear." He served as a lecturer at the Federal University of Rio de Janeiro (UFRJ) in physical education, and coached the Brazilian Football Team during the 1966 World Cup in England. He was instrumental in the development of judo in Brazil, reportedly suggesting to Georges Mehdi that he train in Japan, and later helped protect Mehdi''s academy when Gracie students attempted to assault it.

André Lacé Lopes, a fellow student of Sinhozinho, wrote a book titled "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002), documenting their master and his most famous fighting student. A biography of Hermanny himself was published in 2003 by Ediouro, organized by Luiz Carlos Lisboa.

Hermanny''s career represents a unique chapter in capoeira history. He demonstrated that Sinhozinho''s combat-focused approach to capoeira carioca could compete effectively against both Bahian Regional and Brazilian jiu-jitsu. His victories against Bimba''s students in 1949 were among the few documented instances where capoeira carioca defeated Regional in formal competition.',
  -- bio_pt
  E'Rudolf de Otero Hermanny nasceu em 16 de agosto de 1931 em São Paulo. Quando jovem, sua família migrou para o Estado da Guanabara (atual Rio de Janeiro), onde ele se tornaria um dos lutadores mais realizados treinados por Mestre Sinhozinho e um dos nomes destacados na história da capoeira brasileira.

Hermanny começou a treinar nas academias de Sinhozinho em Ipanema durante meados da década de 1940, ao lado de outros alunos notáveis, incluindo seu irmão Bruno. Seu treinamento foi além da capoeira para incluir boxe, halterofilismo e os métodos de combate prático que Sinhozinho ensinava. Ele demonstrava técnicas tradicionais da capoeira carioca incluindo a baiana e quarenta e um dobrado, enquanto também treinava com o judoca Augusto Cordeiro, que servia como consultor de combate de Sinhozinho.

Com apenas dezessete anos, Hermanny ganhou atenção nacional no famoso Desafio de Capoeira de 1949. Em 1º de abril de 1949, o jornal A Noite anunciou "Desafio de Capoeira - Sinhozinho do Distrito Federal contra Mestre Bimba da Bahia". O evento foi organizado pela Federação Metropolitana de Pugilismo e realizado em dois dias no Estádio Carioca na Avenida Passos, no centro do Rio. Na segunda luta em 7 de abril, o jovem Hermanny enfrentou Fernando Rodrigues Perez, um aluno da Capoeira Regional de Mestre Bimba. Hermanny dominou a luta, derrotando Perez em apenas dois minutos e lesionando seu braço com um chute devastador. Segundo relatos, o próprio Bimba ficou tão impressionado com alguns dos movimentos que presenciou que os incorporou em seu próprio estilo.

Quatro anos depois, Hermanny representou Sinhozinho novamente em um desafio contra a família Gracie. Em 17 de março de 1953, um evento beneficente de vale tudo foi realizado no estádio do Vasco da Gama para auxílio às vítimas da seca no Nordeste. Hermanny enfrentou Guanair Vial Gomes, que era significativamente mais pesado e tinha experiência em luta livre. O lutador Gracie dominou os minutos iniciais com ground and pound, mas Hermanny escapou para os pés e controlou o restante da luta. Após uma hora e dez minutos, com Gomes muito castigado e Hermanny parecendo mais fresco, Carlos Gracie pediu que a luta fosse interrompida e declarada empate. Hermanny permanece como o único capoeirista conhecido por ter lutado contra um praticante de jiu-jitsu por mais de uma hora sem perder.

Em 29 de junho de 1953, Hermanny lutou outra luta significativa no Palácio de Alumínio sob as regras de capoeira de Burlamaqui (com modificações para luta de solo). Seu oponente era Artur Emídio de Oliveira, um lutador de Capoeira Regional da Bahia e um popular competidor de vale tudo. Carlos e Hélio Gracie estavam entre os espectadores. Hermanny controlou o primeiro round com chutes circulares e golpes com a palma, defendendo-se com guarda de boxe. No segundo round, ele veio com agressividade aumentada, derrubando Emídio várias vezes com chutes antes de aplicar sua própria rasteira. Em um momento decisivo, Hermanny cronometrou um pisão no rosto de Emídio enquanto este se levantava, depois seguiu com golpes e uma projeção que levou o árbitro Jayme Ferreira a parar a luta antes que Emídio fosse completamente nocauteado.

Além da capoeira, Hermanny alcançou sucesso significativo em outras disciplinas. Tornou-se campeão brasileiro e pan-americano de judô por equipes no México em 1960, ganhando o apelido de "o Urso". Serviu como professor na Universidade Federal do Rio de Janeiro (UFRJ) em educação física, e foi técnico da Seleção Brasileira de Futebol durante a Copa do Mundo de 1966 na Inglaterra. Ele foi fundamental no desenvolvimento do judô no Brasil, supostamente sugerindo a Georges Mehdi que treinasse no Japão, e depois ajudou a proteger a academia de Mehdi quando alunos Gracie tentaram atacá-la.

André Lacé Lopes, um colega aluno de Sinhozinho, escreveu um livro intitulado "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002), documentando seu mestre e seu aluno lutador mais famoso. Uma biografia do próprio Hermanny foi publicada em 2003 pela Ediouro, organizada por Luiz Carlos Lisboa.

A carreira de Hermanny representa um capítulo único na história da capoeira. Ele demonstrou que a abordagem focada em combate de Sinhozinho para a capoeira carioca podia competir efetivamente tanto contra a Regional baiana quanto contra o jiu-jitsu brasileiro. Suas vitórias contra os alunos de Bimba em 1949 estavam entre as poucas instâncias documentadas em que a capoeira carioca derrotou a Regional em competição formal.',
  -- achievements_en
  'Defeated Fernando Rodrigues Perez (Mestre Bimba''s student) in 2 minutes at the 1949 Capoeira Challenge at Estádio Carioca; Fought to a draw with Guanair Gomes (Gracie representative) for 1 hour 10 minutes at the 1953 vale tudo challenge; Defeated Artur Emídio by referee stoppage in 1953 under Burlamaqui''s capoeira rules; Brazilian and Pan-American Judo team champion (Mexico, 1960); Lecturer at Federal University of Rio de Janeiro (UFRJ); Physical conditioning coach for Brazilian Football Team at 1966 World Cup; Subject of book "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002)',
  -- achievements_pt
  'Derrotou Fernando Rodrigues Perez (aluno de Mestre Bimba) em 2 minutos no Desafio de Capoeira de 1949 no Estádio Carioca; Lutou até empate com Guanair Gomes (representante Gracie) por 1 hora e 10 minutos no desafio de vale tudo de 1953; Derrotou Artur Emídio por interrupção do árbitro em 1953 sob as regras de capoeira de Burlamaqui; Campeão brasileiro e pan-americano de judô por equipes (México, 1960); Professor da Universidade Federal do Rio de Janeiro (UFRJ); Preparador físico da Seleção Brasileira de Futebol na Copa do Mundo de 1966; Tema do livro "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002)',
  -- Researcher notes (English)
  E'BIRTH YEAR (1931): Multiple sources confirm he was 17 years old in April 1949, placing his birth between April 1931 and April 1932. One source indicates August 16, 1931, in São Paulo. Using 1931 with year precision.

DEATH: Unknown. A LinkedIn profile exists for "Rudolf de Otero Hermanny" listed as Professor at INTERCON CLEAN ROOM in Rio de Janeiro, suggesting he may still be alive (would be ~93 years old in 2024). No obituary found.

NICKNAME: Known as "the Bear" (o Urso) in judo circles due to his physical presence.

NAME: Full name Rudolf de Otero Hermanny. Using "Rudolf Hermanny" as apelido since he is commonly referenced by his surname, not a traditional capoeira nickname.

TRAINING: Trained under Mestre Sinhozinho at his academies in Ipanema. Also trained with judoka Augusto Cordeiro, who served as Sinhozinho''s combat consultant. Brother Bruno also trained under Sinhozinho. 1948 photograph shows him boxing against Pedro Gomes at ENEFD.

FIGHT RECORD:
- April 7, 1949: Defeated Fernando Rodrigues Perez (Bimba''s student) in 2 minutes at Estádio Carioca - injured Perez''s arm with a kick
- March 17, 1953: Drew with Guanair Vial Gomes (Gracie representative) after 1h10m at Vasco da Gama stadium
- June 29, 1953: Defeated Artur Emídio by referee stoppage (KO) at Palácio de Alumínio

OTHER CAREERS:
- Physical educator at UFRJ
- Brazilian and Pan-American Judo champion (Mexico 1960)
- Coach of Brazilian Football Team at 1966 World Cup
- Protected Georges Mehdi''s judo academy from Gracie attackers

SOURCES:
- capoeirahistory.com/mestre/master-sinhozinho/
- rohermanny.tripod.com (Sinhozinho tribute site by Hermanny)
- A Noite newspaper, April 1, 1949
- Book: "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" by André Lacé Lopes (2002)
- Wikipedia: Agenor Moreira Sampaio',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1931): Múltiplas fontes confirmam que ele tinha 17 anos em abril de 1949, colocando seu nascimento entre abril de 1931 e abril de 1932. Uma fonte indica 16 de agosto de 1931, em São Paulo. Usando 1931 com precisão de ano.

MORTE: Desconhecida. Existe um perfil no LinkedIn para "Rudolf de Otero Hermanny" listado como Professor no INTERCON CLEAN ROOM no Rio de Janeiro, sugerindo que ele pode ainda estar vivo (teria ~93 anos em 2024). Nenhum obituário encontrado.

APELIDO: Conhecido como "o Urso" nos círculos de judô devido à sua presença física.

NOME: Nome completo Rudolf de Otero Hermanny. Usando "Rudolf Hermanny" como apelido já que ele é comumente referenciado pelo sobrenome, não um apelido tradicional de capoeira.

TREINAMENTO: Treinou sob Mestre Sinhozinho em suas academias em Ipanema. Também treinou com o judoca Augusto Cordeiro, que servia como consultor de combate de Sinhozinho. Irmão Bruno também treinou sob Sinhozinho. Fotografia de 1948 mostra ele lutando boxe contra Pedro Gomes na ENEFD.

HISTÓRICO DE LUTAS:
- 7 de abril de 1949: Derrotou Fernando Rodrigues Perez (aluno de Bimba) em 2 minutos no Estádio Carioca - lesionou o braço de Perez com um chute
- 17 de março de 1953: Empatou com Guanair Vial Gomes (representante Gracie) após 1h10m no estádio do Vasco da Gama
- 29 de junho de 1953: Derrotou Artur Emídio por interrupção do árbitro (nocaute) no Palácio de Alumínio

OUTRAS CARREIRAS:
- Educador físico na UFRJ
- Campeão brasileiro e pan-americano de judô (México 1960)
- Técnico da Seleção Brasileira de Futebol na Copa do Mundo de 1966
- Protegeu a academia de judô de Georges Mehdi de atacantes Gracie

FONTES:
- capoeirahistory.com/mestre/master-sinhozinho/
- rohermanny.tripod.com (site de tributo a Sinhozinho por Hermanny)
- Jornal A Noite, 1º de abril de 1949
- Livro: "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" de André Lacé Lopes (2002)
- Wikipedia: Agenor Moreira Sampaio'
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
