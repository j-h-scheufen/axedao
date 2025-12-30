-- ============================================================
-- GENEALOGY PERSON: Paraná
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH DATE: September 25, 1922 - Confirmed by velhosmestres.com
-- (NOT 1910/1911 as initially suggested in backlog)
--
-- DEATH DATE: March 7, 1972 - Confirmed by multiple sources
-- Location: Rio de Janeiro, at IPASE workplace
-- Cause: Cardiac arrest
-- Burial: Cemitério do Murundu, Realengo
--
-- SIGNIFICANCE: One of four founding lineages of Contemporary
-- Capoeira in Rio de Janeiro (alongside Artur Emídio, Mário
-- Buscapé, and Roque). Renowned berimbau master and craftsman.
-- First to record commercial capoeira LP with CBS (1963).
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
  'Oswaldo Lisboa dos Santos',
  'Paraná',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-parana-1922-1972/',
    'https://velhosmestres.com/br/destaques-14',
    'https://www.lalaue.com/learn-capoeira/mestre-parana/'
  ]::text[],
  -- Capoeira-specific
  NULL::genealogy.style,  -- Style not formally classified; taught before Angola/Regional distinction solidified in Rio
  E'Paraná was renowned primarily as a berimbau master rather than for a particular fighting style. A carpenter by trade, he meticulously handcrafted his berimbaus using coated strings and varnished wood. His 1963 CBS recording demonstrates sophisticated tuning across three berimbaus (viola, médio, gunga) with fixed pitches for instrumental tracks. He played berimbau for Artur Emídio''s rodas and collaborated with Bahian musicians Mucungê and Onça Preta on recordings.',
  E'Paraná era reconhecido principalmente como mestre de berimbau e não por um estilo de luta específico. Carpinteiro de profissão, fabricava meticulosamente seus berimbaus usando cordas revestidas e madeira envernizada. Sua gravação de 1963 pela CBS demonstra afinação sofisticada em três berimbaus (viola, médio, gunga) com alturas fixas para faixas instrumentais. Tocava berimbau nas rodas de Artur Emídio e colaborou com os músicos baianos Mucungê e Onça Preta nas gravações.',
  -- Life dates
  1922,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1972,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Oswaldo Lisboa dos Santos, known as Mestre Paraná, was born on September 25, 1922, in Salvador, Bahia. His parents were Cândido Lisboa dos Santos and Albertina Maria dos Santos. In 1932, at age ten, he began learning capoeira in the Alto das Pombas neighborhood with Mestre Antônio Corró—an ex-slave born in 1870, illiterate, who worked as a cart driver at Cais Dourado in Salvador.

In February 1945, Paraná moved to Rio de Janeiro with his wife Maura Bastos (1920-1989) shortly after leaving the Brazilian Navy, where he had trained in boxing and completed his military service. In June 1945, he was hired by IPASE (Instituto de Pensões e Assistência aos Servidores do Estado) as a specialized craftsman, a position he held until his death.

Paraná lived in the Bonsucesso neighborhood in Rio''s northern zone and began teaching capoeira in his backyard during the 1950s. His wife Maura, known affectionately as "Tia Maura", played a fundamental role in receiving and caring for the many young students who came to train. In 1950, according to Mestre Polaco, he founded the Conjunto Folclórico de Capoeira São Bento Pequeno on Rua Miguel Burnier. The group later evolved into the foundation from which Grupo Muzenza traces its entire formation.

In the capoeira universe, Paraná became known primarily as an excellent berimbau player. A carpenter by profession and training, he carefully manufactured his own berimbaus using coated strings and varnished wood. His meticulous attention to tuning is documented in musicological analysis of his recordings—he maintained fixed pitches across the viola (Db4-Eb4), médio (B3-Db4), and gunga (Ab3-Bb3) for instrumental tracks, unifying to Ab3-Bb3 for vocal tracks to match the song''s key.

The Grupo São Bento Pequeno presented itself at various types of shows, disseminating Afro-Brazilian culture in "Bahian Nights" organized by social clubs and carnival schools, carnival parades, and theatre productions. Most notably, Paraná participated as a berimbau player in the Rio de Janeiro staging of "O Pagador de Promessas" by Dias Gomes in 1962, alongside fellow capoeirista Joel Lourenço.

Paraná collaborated extensively with the pioneering Black dancer Mercedes Baptista, participating in shows and festivals including the IV Festival Folclórico do Distrito Federal in August 1966, where the Teatro Nacional de Brasília was also inaugurated. In 1969, he traveled to Lisbon with Mercedes Batista''s dance group.

His great ability as a musician allowed him to record, in 1963, a single record with four tracks for CBS, called "Capoeira – Mestre Paraná". The EP 45 featured tracks entitled "São Bento Grande", "São Bento Pequeno", "Angola", and "Avise a meu Mano". According to Mestre Gegê, Onça Preta played pandeiro on this recording, and Mestre Mucungê also participated. Musicologist André Luiz Lacé Lopez notes that Paraná invited Bahian musicians Mucungê and Santo Amaro to participate.

Paraná was the first capoeirista to play berimbau at the Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro and reportedly the only capoeira master to hold a Musicians'' Guild card for the berimbau. His musical influence extended to the next generation—Mestre Genaro learned to play berimbau directly from him and later created a song called "Paranaê" incorporating the name of his music teacher.

He frequently directed the percussion section during Artur Emídio''s Sunday rodas, and his Sunday rodas became legendary meeting points. At these gatherings, notable artists including Maria Bethânia, Caetano Veloso, Jards Macalé, Mestres Mintirinha and Genaro, and music producer Nelson Motta appeared.

There is consensus among Rio de Janeiro capoeira historians that four lineages were the main influences in the formation of Contemporary Capoeira in the city: Artur Emídio, Paraná, Mário Buscapé, and Roque. As Mestre Levi stated, these four "started to work in closed spaces of academies, introduced uniforms, organisation, etc. From these four the majority of capoeira masters here in Rio de Janeiro derived".

Mestre Paraná died on March 7, 1972, at age 49, victim of a cardiac arrest at his IPASE workplace where he worked as a carpenter. He was buried in the Cemitério do Murundu in Realengo. His ability and talent playing berimbau is always highlighted by masters who had the opportunity to meet him.',
  -- Extended content (Portuguese)
  E'Oswaldo Lisboa dos Santos, conhecido como Mestre Paraná, nasceu em 25 de setembro de 1922, em Salvador, Bahia. Seus pais eram Cândido Lisboa dos Santos e Albertina Maria dos Santos. Em 1932, aos dez anos, começou a aprender capoeira no bairro do Alto das Pombas com Mestre Antônio Corró—um ex-escravo nascido em 1870, analfabeto, que trabalhava como carroceiro no Cais Dourado em Salvador.

Em fevereiro de 1945, Paraná mudou-se para o Rio de Janeiro com sua esposa Maura Bastos (1920-1989) logo após deixar a Marinha do Brasil, onde havia treinado boxe e completado seu serviço militar. Em junho de 1945, foi admitido no IPASE (Instituto de Pensões e Assistência aos Servidores do Estado) como artífice especializado, cargo que ocupou até sua morte.

Paraná morou no bairro de Bonsucesso, na zona norte do Rio, e começou a ensinar capoeira em seu quintal durante os anos 1950. Sua esposa Maura, conhecida carinhosamente como "Tia Maura", desempenhou papel fundamental no acolhimento e cuidado dos muitos jovens alunos que vinham treinar. Em 1950, segundo Mestre Polaco, fundou o Conjunto Folclórico de Capoeira São Bento Pequeno na Rua Miguel Burnier. O grupo posteriormente evoluiu para a base da qual o Grupo Muzenza traça toda a sua formação.

No universo da capoeira, Paraná ficou conhecido principalmente como excelente tocador de berimbau. Carpinteiro de profissão e formação, fabricava cuidadosamente seus próprios berimbaus usando cordas revestidas e madeira envernizada. Sua atenção meticulosa à afinação está documentada em análises musicológicas de suas gravações—ele mantinha alturas fixas na viola (Ré♭4-Mi♭4), médio (Si3-Ré♭4) e gunga (Lá♭3-Si♭3) para faixas instrumentais, unificando para Lá♭3-Si♭3 nas faixas vocais para combinar com a tonalidade da canção.

O Grupo São Bento Pequeno apresentou-se em vários tipos de shows, disseminando a cultura afro-brasileira em "Noites Baianas" organizadas por clubes sociais e escolas de samba, desfiles de carnaval e produções teatrais. Mais notavelmente, Paraná participou como tocador de berimbau na montagem carioca de "O Pagador de Promessas" de Dias Gomes em 1962, ao lado do capoeirista Joel Lourenço.

Paraná colaborou extensivamente com a pioneira bailarina negra Mercedes Baptista, participando de shows e festivais incluindo o IV Festival Folclórico do Distrito Federal em agosto de 1966, onde o Teatro Nacional de Brasília também foi inaugurado. Em 1969, viajou a Lisboa com o grupo de dança de Mercedes Batista.

Sua grande habilidade como músico permitiu-lhe gravar, em 1963, um disco single com quatro faixas pela CBS, chamado "Capoeira – Mestre Paraná". O EP 45 apresentava as faixas "São Bento Grande", "São Bento Pequeno", "Angola" e "Avise a meu Mano". Segundo Mestre Gegê, Onça Preta tocou pandeiro nesta gravação, e Mestre Mucungê também participou. O musicólogo André Luiz Lacé Lopez nota que Paraná convidou os músicos baianos Mucungê e Santo Amaro para participar.

Paraná foi o primeiro capoeirista a tocar berimbau na Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro e supostamente o único mestre de capoeira a possuir carteira do Sindicato dos Músicos para o berimbau. Sua influência musical estendeu-se à geração seguinte—Mestre Genaro aprendeu a tocar berimbau diretamente com ele e depois criou uma canção chamada "Paranaê" incorporando o nome de seu mestre de música.

Ele frequentemente dirigia a seção de percussão durante as rodas de domingo de Artur Emídio, e suas rodas de domingo tornaram-se lendários pontos de encontro. Nesses encontros, apareciam artistas notáveis incluindo Maria Bethânia, Caetano Veloso, Jards Macalé, Mestres Mintirinha e Genaro, e o produtor musical Nelson Motta.

Há consenso entre os historiadores da capoeira carioca de que quatro linhagens foram as principais influências na formação da Capoeira Contemporânea na cidade: Artur Emídio, Paraná, Mário Buscapé e Roque. Como Mestre Levi afirmou, esses quatro "começaram a trabalhar em espaços fechados de academias, introduziram uniformes, organização, etc. Desses quatro derivou a maioria dos mestres de capoeira aqui no Rio de Janeiro".

Mestre Paraná faleceu em 7 de março de 1972, aos 49 anos, vítima de colapso cardíaco em seu local de trabalho no IPASE, onde trabalhava como carpinteiro. Foi sepultado no Cemitério do Murundu em Realengo. Sua habilidade e talento tocando berimbau é sempre destacado pelos mestres que tiveram a oportunidade de conhecê-lo.',
  -- Achievements (English)
  E'- One of four founding lineages of Contemporary Capoeira in Rio de Janeiro
- Recorded first commercial capoeira EP with CBS (1963): "Capoeira – Mestre Paraná"
- First capoeirista to play berimbau at Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro
- Only capoeira master with Musicians'' Guild card for berimbau
- Founded Conjunto Folclórico de Capoeira São Bento Pequeno (1950)
- Performed in "O Pagador de Promessas" (Rio production, 1962)
- Participated in IV Festival Folclórico do Distrito Federal (1966)
- Collaborated internationally with Mercedes Baptista dance group (Lisbon, 1969)
- Master berimbau craftsman using distinctive varnished wood and coated strings',
  -- Achievements (Portuguese)
  E'- Uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro
- Gravou o primeiro EP comercial de capoeira pela CBS (1963): "Capoeira – Mestre Paraná"
- Primeiro capoeirista a tocar berimbau na Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro
- Único mestre de capoeira com carteira do Sindicato dos Músicos para berimbau
- Fundou o Conjunto Folclórico de Capoeira São Bento Pequeno (1950)
- Atuou em "O Pagador de Promessas" (produção carioca, 1962)
- Participou do IV Festival Folclórico do Distrito Federal (1966)
- Colaborou internacionalmente com o grupo de dança de Mercedes Baptista (Lisboa, 1969)
- Mestre artesão de berimbau usando madeira envernizada e cordas revestidas distintivas',
  -- Researcher notes (English)
  E'BIRTH YEAR DISCREPANCY:
- velhosmestres.com and capoeirahistory.com: September 25, 1922 (exact)
- backlog initially suggested 1910/1911, but this appears incorrect
- Using 1922 based on multiple reliable sources

DEATH DATE: March 7, 1972 - Confirmed by velhosmestres.com and capoeirahistory.com
- Cause: Cardiac arrest at IPASE workplace
- Burial: Cemitério do Murundu, Realengo

FAMILY:
- Parents: Cândido Lisboa dos Santos and Albertina Maria dos Santos
- Wife: Maura Bastos (August 28, 1920 – June 8, 1989)

TEACHER: Antônio Corró
- Born 1870, ex-slave, illiterate, cart driver at Cais Dourado
- Taught at Alto das Pombas, Salvador
- Paraná trained with him from 1932 (age 10)
- Corró is NOT yet in database; needs import

BAHIA PHASE (1922-1945):
- Training location: Alto das Pombas, Salvador
- Teacher: Antônio Corró only documented teacher
- No other documented training companions in Bahia

RIO PHASE (1945-1972):
- Lived: Flamengo, Bonsucesso, Realengo (various periods)
- Work: IPASE (Instituto de Pensões e Assistência aos Servidores do Estado)
- Founded: Grupo São Bento Pequeno (1950)
- Association with: Artur Emídio (played berimbau at his rodas), Onça Preta (musical collaboration), Mucungê (musical collaboration), Joel Lourenço (O Pagador de Promessas), Mercedes Baptista (dance collaborations), Genaro (taught berimbau)

KNOWN STUDENTS:
- Mestre Polaco (José Roberto Rocha) - began 1956, received nickname from Paraná
- Mestre Genaro - learned berimbau from Paraná
- Mestre Mintirinha - mentioned as appearing at his rodas

MUSICAL RECORDING (1963):
- Label: CBS
- Format: EP 45 (single with four tracks)
- Tracks: "São Bento Grande", "São Bento Pequeno", "Angola", "Avise a meu Mano"
- Collaborators: Onça Preta (pandeiro), Mucungê (per Mestre Gegê and musicologist André Luiz Lacé Lopez)
- Alternative collaborator claimed: Santo Amaro (per André Luiz Lacé Lopez)

STYLE NOTE:
- Style is NULL because Paraná was known primarily for berimbau mastery rather than a particular fighting style
- He taught in the transitional period before Angola/Regional distinction fully consolidated in Rio
- His group is described as "folclórico" emphasizing cultural performance

GROUP LINEAGE:
- Grupo Muzenza traces its formation entirely to Paraná''s Grupo São Bento Pequeno

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-parana-1922-1972/
- velhosmestres.com/br/destaques-14
- velhosmestres.com/en/featured-14
- lalaue.com/learn-capoeira/mestre-parana/
- portalcapoeira.com/capoeira/mestres/mestre-parana/
- capoeirahistory.com/m-parana/ (musical legacy analysis)',
  -- Researcher notes (Portuguese)
  E'DISCREPÂNCIA DO ANO DE NASCIMENTO:
- velhosmestres.com e capoeirahistory.com: 25 de setembro de 1922 (exato)
- backlog inicialmente sugeriu 1910/1911, mas isso parece incorreto
- Usando 1922 baseado em múltiplas fontes confiáveis

DATA DE FALECIMENTO: 7 de março de 1972 - Confirmado por velhosmestres.com e capoeirahistory.com
- Causa: Colapso cardíaco no local de trabalho (IPASE)
- Sepultamento: Cemitério do Murundu, Realengo

FAMÍLIA:
- Pais: Cândido Lisboa dos Santos e Albertina Maria dos Santos
- Esposa: Maura Bastos (28 de agosto de 1920 – 8 de junho de 1989)

MESTRE: Antônio Corró
- Nascido em 1870, ex-escravo, analfabeto, carroceiro no Cais Dourado
- Ensinava no Alto das Pombas, Salvador
- Paraná treinou com ele a partir de 1932 (10 anos)
- Corró NÃO está no banco de dados; precisa importar

FASE BAHIA (1922-1945):
- Local de treino: Alto das Pombas, Salvador
- Mestre: Antônio Corró único mestre documentado
- Nenhum outro companheiro de treino documentado na Bahia

FASE RIO (1945-1972):
- Morou: Flamengo, Bonsucesso, Realengo (vários períodos)
- Trabalho: IPASE (Instituto de Pensões e Assistência aos Servidores do Estado)
- Fundou: Grupo São Bento Pequeno (1950)
- Associação com: Artur Emídio (tocava berimbau nas rodas dele), Onça Preta (colaboração musical), Mucungê (colaboração musical), Joel Lourenço (O Pagador de Promessas), Mercedes Baptista (colaborações de dança), Genaro (ensinou berimbau)

ALUNOS CONHECIDOS:
- Mestre Polaco (José Roberto Rocha) - começou em 1956, recebeu apelido de Paraná
- Mestre Genaro - aprendeu berimbau com Paraná
- Mestre Mintirinha - mencionado como frequentador de suas rodas

GRAVAÇÃO MUSICAL (1963):
- Gravadora: CBS
- Formato: EP 45 (single com quatro faixas)
- Faixas: "São Bento Grande", "São Bento Pequeno", "Angola", "Avise a meu Mano"
- Colaboradores: Onça Preta (pandeiro), Mucungê (per Mestre Gegê e musicólogo André Luiz Lacé Lopez)
- Colaborador alternativo alegado: Santo Amaro (per André Luiz Lacé Lopez)

NOTA DE ESTILO:
- Estilo é NULL porque Paraná era conhecido principalmente pela maestria no berimbau e não por um estilo de luta específico
- Ele ensinou no período de transição antes da distinção Angola/Regional se consolidar no Rio
- Seu grupo é descrito como "folclórico" enfatizando a performance cultural

LINHAGEM DE GRUPO:
- Grupo Muzenza traça toda sua formação ao Grupo São Bento Pequeno de Paraná

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-parana-1922-1972/
- velhosmestres.com/br/destaques-14
- velhosmestres.com/en/featured-14
- lalaue.com/learn-capoeira/mestre-parana/
- portalcapoeira.com/capoeira/mestres/mestre-parana/
- capoeirahistory.com/m-parana/ (análise do legado musical)'
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
