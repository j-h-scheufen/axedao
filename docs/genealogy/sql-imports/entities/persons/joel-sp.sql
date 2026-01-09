-- ============================================================
-- GENEALOGY PERSON: Joel (São Paulo)
-- Generated: 2026-01-02
-- ============================================================
-- NOTE: This is Joel de Souza Menezes (1944-2020), the São Paulo pioneer.
-- DISTINCT FROM: Joel Lourenço do Espírito Santo (Rio de Janeiro Angola mestre).
-- Uses apelido_context = 'São Paulo' to distinguish.
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
  -- Identity
  'Joel de Souza Menezes',
  'Joel',
  'São Paulo',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://velhosmestres.com/br/destaques-54', 'https://velhosmestres.com/en/featured-54', 'https://portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-joel/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Joel trained under Mestre Arara, who was a graduated student of Mestre Bimba. In 1972, he was officially recognized as a mestre by Bimba himself. Joel was a staunch defender of capoeira''s Bahian roots and traditions, as reflected in his recordings, which "always speak of Bahia". His three LPs (1979, 1993, 1994) document traditional capoeira music including quadras corridas, berimbau toques, and Angola ladainhas.',
  E'Mestre Joel treinou com Mestre Arara, que era aluno formado de Mestre Bimba. Em 1972, foi oficialmente reconhecido como mestre pelo próprio Bimba. Joel era defensor fervoroso das raízes e tradições baianas da capoeira, como refletido em suas gravações, que "sempre falam da Bahia". Seus três LPs (1979, 1993, 1994) documentam música tradicional de capoeira incluindo quadras corridas, toques de berimbau e ladainhas de Angola.',
  -- Life dates
  1944,
  'exact'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  2020,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Joel de Souza Menezes was born on February 28, 1944, in Santo Amaro, a city in the Recôncavo Baiano that produced legendary capoeiristas including Mestre Traíra, Mestre Caiçara, and Mestre Bimba''s own father. Raised in Feira de Santana, he learned capoeira from Mestre Arara (Fernando Vasconcelos), who was a graduated student of Mestre Bimba from the propagation phase (1967-1973).\n\nIn 1964, at age twenty, Joel moved to São Paulo state, where he would spend most of his life disseminating capoeira. He founded the Associação de Capoeira Ilha de Itapuã, which became one of the principal capoeira academies in São Paulo and was among the eight founding associations of the Federação Paulista de Capoeira in 1974—the first capoeira federation in the world.\n\nThe CMTC Club (Companhia Municipal de Transportes Coletivos), where Mestre Zé de Freitas taught both capoeira and freestyle wrestling, became a crucial meeting point for Bahian capoeiristas arriving in São Paulo. It was at Zé de Freitas''s classes there that Joel first met Mestre Brasília and Mestre Suassuna around 1965—an encounter that would shape the future of São Paulo capoeira. Joel became one of Zé de Freitas''s students, consolidating his training with the pioneer who had brought capoeira from Bahia in 1959.\n\nJoel regularly frequented the famous rodas at Praça da República, the legendary Sunday gathering founded by Mestre Ananias in 1953 where the cream of São Paulo capoeira gathered. Sources note that "Mestre Chita, junto ao Mestre Ananias e Mestre Joel, é o capoeirista que mais se fez presente desde o início da roda em 1953"—though this may be slightly exaggerated, as Joel arrived in 1964.\n\nIn 1971, when Mestre Bimba visited São Paulo at the invitation of Mestre Onça, Bimba symbolically recognized a group of mestres as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo)—the famous "Grupo dos Nove" (Group of Nine). Joel was among these nine pioneers, alongside Suassuna, Brasília, his brother Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, and Onça. A historic photograph from around 1972 captures this moment: Standing are M Zé de Freitas, M Pinatti, M Suassuna, M Bimba, M Onça, M Joel, M Brasília; Squatting are M Gilvan (Joel''s brother), M Limão, M Silvestre.\n\nIn 1972, Joel was formally recognized as a mestre of capoeira by Mestre Bimba himself—a rare honor that connected him directly to the creator of Capoeira Regional.\n\nJoel was a pioneer in recording capoeira music. In 1979, he released his LP "Capoeira" through the Associação de Capoeira Ilha de Itapuã, manufactured by Gravações Elétricas S.A. and recorded at Studio Brasileiro De Som. The album featured prominent capoeiristas as musicians: Mestre Ananias played atabaque and sang chorus on multiple tracks, Prof João Braz contributed pandeiro, agogô, and chorus, Prof Dado served as music director and arranger while playing percussion and berimbau, and Mestre João provided solo vocals and pandeiro. The LP included quadras corridas, berimbau techniques, and Angola ladainhas.\n\nJoel followed this with "Capoeira Raiz" in 1993 and "Capoeira Volume 1" in 1994. As his son Mestre Dadá recalled, Joel was "um dos pioneiros nessa gravação, com músicas que sempre falam da Bahia" (one of the pioneers in these recordings, with songs that always speak of Bahia).\n\nBeyond his academy work, Joel held significant leadership positions: he was president of the Organização Onças de São Paulo and served as national president of the Associação Brasil Capoeira (ABRACAP).\n\nThroughout his career, Joel traveled internationally to spread capoeira, visiting Germany, South Africa, England, Argentina, and Spain. His last trip was to Spain before Carnival 2020, where his family believes he contracted COVID-19. He was hospitalized at Hospital Ernesto Simões in Salvador on May 12, 2020, and passed away on June 3, 2020, at age 76.\n\nSambista Leci Brandão declared that "a capoeira está de luto" (capoeira is in mourning) and that "Mestre Joel é uma referência da Capoeira Paulista" (Mestre Joel is a reference of São Paulo Capoeira). His legacy lives on through the countless capoeiristas he trained and the institutions he built.',
  -- bio_pt
  E'Joel de Souza Menezes nasceu em 28 de fevereiro de 1944, em Santo Amaro, cidade do Recôncavo Baiano que produziu capoeiristas lendários incluindo Mestre Traíra, Mestre Caiçara e o próprio pai de Mestre Bimba. Criado em Feira de Santana, aprendeu capoeira com Mestre Arara (Fernando Vasconcelos), que era aluno formado de Mestre Bimba da fase de propagação (1967-1973).\n\nEm 1964, aos vinte anos, Joel mudou-se para o estado de São Paulo, onde passaria a maior parte de sua vida disseminando a capoeira. Fundou a Associação de Capoeira Ilha de Itapuã, que se tornou uma das principais academias de capoeira de São Paulo e estava entre as oito associações fundadoras da Federação Paulista de Capoeira em 1974—a primeira federação de capoeira do mundo.\n\nO Clube CMTC (Companhia Municipal de Transportes Coletivos), onde Mestre Zé de Freitas ensinava tanto capoeira quanto luta livre, tornou-se um ponto de encontro crucial para capoeiristas baianos chegando a São Paulo. Foi nas aulas de Zé de Freitas lá que Joel conheceu Mestre Brasília e Mestre Suassuna por volta de 1965—um encontro que moldaria o futuro da capoeira paulista. Joel tornou-se um dos alunos de Zé de Freitas, consolidando seu treinamento com o pioneiro que havia trazido a capoeira da Bahia em 1959.\n\nJoel frequentava regularmente as famosas rodas na Praça da República, o lendário encontro dominical fundado por Mestre Ananias em 1953 onde a nata da capoeira paulista se reunia. Fontes observam que "Mestre Chita, junto ao Mestre Ananias e Mestre Joel, é o capoeirista que mais se fez presente desde o início da roda em 1953"—embora isso possa ser ligeiramente exagerado, já que Joel chegou em 1964.\n\nEm 1971, quando Mestre Bimba visitou São Paulo a convite de Mestre Onça, Bimba reconheceu simbolicamente um grupo de mestres como os "Percursores da Capoeira em São Paulo"—o famoso "Grupo dos Nove". Joel estava entre esses nove pioneiros, junto com Suassuna, Brasília, seu irmão Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas e Onça. Uma foto histórica de cerca de 1972 captura este momento: Em pé estão M Zé de Freitas, M Pinatti, M Suassuna, M Bimba, M Onça, M Joel, M Brasília; Agachados estão M Gilvan (irmão de Joel), M Limão, M Silvestre.\n\nEm 1972, Joel foi formalmente reconhecido como mestre de capoeira pelo próprio Mestre Bimba—uma honra rara que o conectou diretamente ao criador da Capoeira Regional.\n\nJoel foi um pioneiro na gravação de música de capoeira. Em 1979, lançou seu LP "Capoeira" pela Associação de Capoeira Ilha de Itapuã, fabricado pela Gravações Elétricas S.A. e gravado no Studio Brasileiro De Som. O álbum contou com capoeiristas proeminentes como músicos: Mestre Ananias tocou atabaque e cantou coro em várias faixas, Prof João Braz contribuiu com pandeiro, agogô e coro, Prof Dado serviu como diretor musical e arranjador enquanto tocava percussão e berimbau, e Mestre João fez vocais solo e pandeiro. O LP incluiu quadras corridas, técnicas de berimbau e ladainhas de Angola.\n\nJoel seguiu com "Capoeira Raiz" em 1993 e "Capoeira Volume 1" em 1994. Como seu filho Mestre Dadá recordou, Joel foi "um dos pioneiros nessa gravação, com músicas que sempre falam da Bahia".\n\nAlém de seu trabalho nas academias, Joel ocupou posições de liderança significativas: foi presidente da Organização Onças de São Paulo e serviu como presidente nacional da Associação Brasil Capoeira (ABRACAP).\n\nAo longo de sua carreira, Joel viajou internacionalmente para disseminar a capoeira, visitando Alemanha, África do Sul, Inglaterra, Argentina e Espanha. Sua última viagem foi à Espanha antes do Carnaval de 2020, onde sua família acredita que ele contraiu COVID-19. Ele foi internado no Hospital Ernesto Simões em Salvador em 12 de maio de 2020 e faleceu em 3 de junho de 2020, aos 76 anos.\n\nA sambista Leci Brandão declarou que "a capoeira está de luto" e que "Mestre Joel é uma referência da Capoeira Paulista". Seu legado continua através dos inúmeros capoeiristas que treinou e das instituições que construiu.',
  -- achievements_en
  E'1944 (Feb 28): Born in Santo Amaro, Bahia; raised in Feira de Santana
1960s: Learned capoeira from Mestre Arara (student of Mestre Bimba)
1964: Moved to São Paulo; founded Associação de Capoeira Ilha de Itapuã
~1965: Met Mestres Suassuna and Brasília at Zé de Freitas''s CMTC Club classes; trained under Zé de Freitas
1960s-70s: Regularly frequented Praça da República rodas with Mestre Ananias
1971: Recognized by Mestre Bimba as one of "Grupo dos Nove" pioneers of capoeira in São Paulo
1972: Formally recognized as mestre by Mestre Bimba
1974: Associação de Capoeira Ilha de Itapuã was one of 8 founding associations of Federação Paulista de Capoeira
1979: Released LP "Capoeira" with Mestre Ananias, Prof Dado, Prof João Braz, Mestre João
1993: Released LP "Capoeira Raiz"
1994: Released LP "Capoeira Volume 1"
2010: Habilitado for IPHAN Prêmio Viva Meu Mestre (recognized master aged 55+)
International travel to Germany, South Africa, England, Argentina, Spain for capoeira dissemination
President of Organização Onças de São Paulo
National president of Associação Brasil Capoeira (ABRACAP)',
  -- achievements_pt
  E'1944 (28 fev): Nasceu em Santo Amaro, Bahia; criado em Feira de Santana
Anos 1960: Aprendeu capoeira com Mestre Arara (aluno de Mestre Bimba)
1964: Mudou-se para São Paulo; fundou Associação de Capoeira Ilha de Itapuã
~1965: Conheceu Mestres Suassuna e Brasília nas aulas de Zé de Freitas no Clube CMTC; treinou com Zé de Freitas
Anos 1960-70: Frequentou regularmente as rodas da Praça da República com Mestre Ananias
1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
1972: Formalmente reconhecido como mestre por Mestre Bimba
1974: Associação de Capoeira Ilha de Itapuã foi uma das 8 associações fundadoras da Federação Paulista de Capoeira
1979: Lançou LP "Capoeira" com Mestre Ananias, Prof Dado, Prof João Braz, Mestre João
1993: Lançou LP "Capoeira Raiz"
1994: Lançou LP "Capoeira Volume 1"
2010: Habilitado para o Prêmio Viva Meu Mestre do IPHAN (mestre reconhecido com 55+ anos)
Viagens internacionais para Alemanha, África do Sul, Inglaterra, Argentina, Espanha para disseminação da capoeira
Presidente da Organização Onças de São Paulo
Presidente nacional da Associação Brasil Capoeira (ABRACAP)',
  -- notes_en
  E'NAME DISAMBIGUATION:
There are two distinct "Mestre Joels" in capoeira history:
1. Joel de Souza Menezes (THIS PERSON, 1944-2020) - Born Santo Amaro, raised Feira de Santana; student of Mestre Arara (Bimba lineage); recorded LP "Capoeira" (1979) with Associação de Capoeira Ilha de Itapuã; based in São Paulo; member of "Grupo dos Nove"
2. Joel Lourenço do Espírito Santo (c. 1910-?) - Bahian who organized capoeira Angola in Rio de Janeiro in the 1950s; recorded "Samba de Caboclo" (1977); different lineage, different era, different style

Using apelido_context = ''São Paulo'' to distinguish in database.

TEACHERS:
- Mestre Arara (Fernando Vasconcelos) - Primary teacher in Bahia; Arara was student of Bimba from propagation phase (1967-1973)
- Mestre Zé de Freitas - Trained at CMTC Club in São Paulo (1960s); listed as one of Zé de Freitas''s formed students

FAMILY:
- Brother: Mestre Gilvan (also member of "Grupo dos Nove")
- Son: Mestre Dadá (interviewed for obituary sources)

STUDENTS:
- Specific student names not documented in available sources
- Trained many at Associação de Capoeira Ilha de Itapuã over decades

MEDIA APPEARANCES:
- 1979: LP "Capoeira" - Associação de Capoeira Ilha de Itapuã / Gravações Elétricas S.A.
- 1993: LP "Capoeira Raiz"
- 1994: LP "Capoeira Volume 1"
- ~1972: Historic photograph with Grupo dos Nove and Mestre Bimba

1979 LP PERSONNEL:
- Mestre Joel - Producer, Director, Composer
- Prof Dado - Music Director, Arranger, Percussion, Berimbau
- Mestre Ananias - Atabaque, Chorus (tracks A1, A2, B1, B2)
- Prof João Braz - Pandeiro, Agogô, Chorus
- Mestre João - Solo Vocal, Pandeiro

GRUPOS DOS NOVE MEMBERS (recognized by Bimba 1971):
1. Suassuna - already in dataset
2. Brasília - already in dataset
3. Joel (this person) - importing now
4. Gilvan (Joel''s brother) - in backlog
5. Limão - already in dataset
6. Silvestre - already in dataset
7. Pinatti - already in dataset
8. Zé de Freitas - already in dataset
9. Onça (SP) - already in dataset

DEATH:
Died June 3, 2020 in Salvador from COVID-19 complications. Hospitalized since May 12, 2020 at Hospital Ernesto Simões. Had returned from Spain before Carnival 2020.',
  -- notes_pt
  E'DESAMBIGUAÇÃO DE NOME:
Existem dois "Mestre Joels" distintos na história da capoeira:
1. Joel de Souza Menezes (ESTA PESSOA, 1944-2020) - Nascido em Santo Amaro, criado em Feira de Santana; aluno de Mestre Arara (linhagem de Bimba); gravou LP "Capoeira" (1979) com Associação de Capoeira Ilha de Itapuã; baseado em São Paulo; membro do "Grupo dos Nove"
2. Joel Lourenço do Espírito Santo (c. 1910-?) - Baiano que organizou capoeira Angola no Rio de Janeiro nos anos 1950; gravou "Samba de Caboclo" (1977); linhagem diferente, época diferente, estilo diferente

Usando apelido_context = ''São Paulo'' para distinguir no banco de dados.

MESTRES:
- Mestre Arara (Fernando Vasconcelos) - Professor principal na Bahia; Arara era aluno de Bimba da fase de propagação (1967-1973)
- Mestre Zé de Freitas - Treinou no Clube CMTC em São Paulo (anos 1960); listado como um dos alunos formados de Zé de Freitas

FAMÍLIA:
- Irmão: Mestre Gilvan (também membro do "Grupo dos Nove")
- Filho: Mestre Dadá (entrevistado para fontes de obituário)

ALUNOS:
- Nomes específicos de alunos não documentados em fontes disponíveis
- Treinou muitos na Associação de Capoeira Ilha de Itapuã ao longo de décadas

APARIÇÕES NA MÍDIA:
- 1979: LP "Capoeira" - Associação de Capoeira Ilha de Itapuã / Gravações Elétricas S.A.
- 1993: LP "Capoeira Raiz"
- 1994: LP "Capoeira Volume 1"
- ~1972: Foto histórica com Grupo dos Nove e Mestre Bimba

EQUIPE DO LP 1979:
- Mestre Joel - Produtor, Diretor, Compositor
- Prof Dado - Diretor Musical, Arranjador, Percussão, Berimbau
- Mestre Ananias - Atabaque, Coro (faixas A1, A2, B1, B2)
- Prof João Braz - Pandeiro, Agogô, Coro
- Mestre João - Vocal Solo, Pandeiro

MEMBROS DO GRUPO DOS NOVE (reconhecidos por Bimba 1971):
1. Suassuna - já no dataset
2. Brasília - já no dataset
3. Joel (esta pessoa) - importando agora
4. Gilvan (irmão de Joel) - no backlog
5. Limão - já no dataset
6. Silvestre - já no dataset
7. Pinatti - já no dataset
8. Zé de Freitas - já no dataset
9. Onça (SP) - já no dataset

FALECIMENTO:
Morreu em 3 de junho de 2020 em Salvador por complicações de COVID-19. Internado desde 12 de maio de 2020 no Hospital Ernesto Simões. Havia retornado da Espanha antes do Carnaval de 2020.'
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
