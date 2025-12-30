-- ============================================================
-- GENEALOGY PERSON: Ananias
-- Generated: 2025-12-21
-- ============================================================
-- Known as the "Father of São Paulo Capoeira"
-- Founder of Roda da Praça da República (1953)
-- ============================================================
-- BIRTH DATE: October 4, 1924 (confirmed by Wikipedia PT)
-- Some sources say "December 1924" - likely confusion with birth
-- month vs registration date. Using October 4 per Wikipedia.
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
  'Ananias Ferreira',
  'Ananias',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY[
    'https://velhosmestres.com/en/featured-8',
    'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-ananias/',
    'https://capoeira.online/history/mestres/mestre-ananias/',
    'https://palitocapoeira.com.br/capoeira/mestre-ananias/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Ananias embodied the traditional Bahian capoeira angola. He emphasized the complete integration of capoeira, samba de roda, and Candomblé as interconnected expressions of Afro-Brazilian culture. His game was characterized by the old-school style learned in the informal rodas of the Recôncavo, where "no one gave classes... everyone got together and played". He rejected what he saw as the deterioration of modern capoeira, lamenting that contemporary practice was "all slow" and lacked respect for capoeira angola, which "should be low and high, a lively game". As a priest of Candomblé (Ogã), he integrated spiritual practice with his teaching.',
  E'Ananias personificava a capoeira angola tradicional baiana. Enfatizava a integração completa da capoeira, samba de roda e Candomblé como expressões interconectadas da cultura afro-brasileira. Seu jogo era caracterizado pelo estilo da velha guarda aprendido nas rodas informais do Recôncavo, onde "ninguém dava aulas... todo mundo se juntava e jogava". Ele rejeitava o que via como deterioração da capoeira moderna, lamentando que a prática contemporânea era "tudo devagar" e faltava respeito pela capoeira angola, que "devia ser baixa e alta, um jogo animado". Como sacerdote de Candomblé (Ogã), integrava a prática espiritual ao seu ensino.',
  -- Life dates
  1924,
  'exact'::genealogy.date_precision,
  'São Félix, Bahia, Brazil',
  2016,
  'exact'::genealogy.date_precision,
  'Bela Vista, São Paulo, Brazil',
  -- bio_en
  E'Ananias Ferreira was born on October 4, 1924, in São Félix, Bahia—a town in the Recôncavo Baiano region that lives and breathes the African force in Brazilian soil, offering capoeira, samba, and Candomblé as foundational pillars of culture. Son of samba player João Ferreira de Souza and Joventina dos Santos Ferreira, young Ananias grew up immersed in Afro-Brazilian traditions.

In 1938, at age fourteen, he began learning capoeira in the rodas organized by Mestre Juvêncio, a dock worker who held informal gatherings on the docks of São Félix during the festivals of Igreja de São Deus Menino and Senhor São Félix. As Ananias later recalled: "Juvêncio was the mestre. He was a dock worker who did capoeira on the docks of São Félix... Nobody taught classes, but the real master was Juvêncio, everyone got together and played".

These rodas gathered remarkable practitioners: João de Zazá, the brothers Toy and Roxinho, the brothers Alvelino and Santos from Muritiba, Caial, Café, and Estevão—a factory guard at the "Letialvi" cigar factory whom Ananias remembered as having "capoeira perversa" (vicious capoeira). A young Traíra from nearby Cachoeira also attended these gatherings. At age fourteen, Ananias said, "you start to feel capoeira in your blood".

In 1942, Ananias moved to Salvador and settled in the Liberdade neighborhood. From 1942 to 1946, he trained with Mestre Canjiquinha in the space of Mestre Pastinha, playing in Pastinha''s bateria during street rodas alongside Mestre Gato Preto. From 1946 to 1953, he trained with Mestre Waldemar at the legendary Barracão in Liberdade''s Corta-Braço area. During this period, he trained alongside the great names: Pastinha, Nagé, Onça Preta, Noronha, Dorival (Waldemar''s brother), Traíra, Cobrinha Verde, Bugalho, Zacaria, Bom Cabelo, and Mucungê. Waldemar eventually gave him the position of contra-mestre de bateria after rigorous testing by the mestres.

In 1953, everything changed. Theater producers Wilson and Sérgio Maia came to Corta-Braço seeking capoeiristas for the São Paulo theater scene. Ananias, along with Evaristo Martins Vieira, Jonas Ferreira dos Santos, and Adão Felix Reis, traveled to "the land of drizzle" (a terra da garoa—São Paulo). Upon arriving, Ananias founded the Associação de Capoeira Angola Senhor do Bonfim and established the legendary Sunday roda at Praça da República—a tradition that would endure for over sixty years.

In São Paulo, Ananias collaborated with theatrical giants including playwright Plínio Marcos and poet Solano Trindade. In 1960, he appeared in the first production of "O Pagador de Promessas" at Teatro Brasileiro de Comédia (TBC), directed by Flávio Rangel. The play''s 1962 film adaptation by Anselmo Duarte won the Palme d''Or at Cannes. Ananias contributed to the film''s soundtrack. He continued in theater, appearing in "Balbina de Iansã" (1970) and "Jesus Homem" (1980), both written by Plínio Marcos.

Throughout his life, Ananias served as an Ogã—a ceremonial leader in Candomblé de Angola. He saw capoeira, samba de roda, and Candomblé as inseparable expressions of African heritage in Brazil. He learned samba from his father and old Bahian musicians in candomblé temples and samba rodas.

In 1979, Ananias appeared on Mestre Joel''s LP alongside Dadinho and João Bráz. At age 80 in 2004, he recorded his first capoeira CD, "Original Ao Vivo", with his disciples. In 2007, at 83, he released a samba de roda CD with Grupo Garoa do Recôncavo—a group formed by his disciples that presented the traditional hard samba of the Recôncavo Baiano. In 2009, he was featured in the documentary "Cantador de Chula".

The Praça da República became an institution. For over fifty years, every Sunday, capoeiristas from all styles—Angola, Regional, Contemporânea—gathered at his roda. Mestres Suassuna, Camisa, Moraes, and countless others passed through. In the early 1990s, disciples who had formed in this roda created the Casa Mestre Ananias—Centro Paulistano de Capoeira e Tradições Baianas, located on Rua Conselheiro Ramalho in the Bixiga neighborhood. Contramestre Rafael trained directly under him, and Rodrigo Minhoca, who spent from 1995 until Ananias''s death learning from him, now leads the Casa.

In a 2005 interview, at age 81, Ananias reflected on what capoeira requires: "Be dedicated in order to learn everything in capoeira, from the instruments to the game". He lamented modern practice: contemporary capoeira was "all slow" and lacked respect for capoeira angola, which "should be low and high, a lively game". He admired practitioners like Nagé, Onça Preta, Maré, Traíra, Bom Cabelo, Zacarias, and Caiçara—the latter described as "devilishly good".

Mestre Ananias died on July 21, 2016, in Bela Vista, São Paulo, at age 91. His velório was held at Casa Mestre Ananias, and he was buried at Cemitério Carmosina in Itaquera. He is remembered as the father of São Paulo capoeira—a guardian of authentic Bahian traditions who brought the full breadth of Afro-Brazilian culture from the Recôncavo to the metropolis.',
  -- bio_pt
  E'Ananias Ferreira nasceu em 4 de outubro de 1924, em São Félix, Bahia—uma cidade no Recôncavo Baiano que vive e respira a força africana em solo brasileiro, oferecendo capoeira, samba e Candomblé como pilares fundamentais da cultura. Filho do sambista João Ferreira de Souza e de Joventina dos Santos Ferreira, o jovem Ananias cresceu imerso nas tradições afro-brasileiras.

Em 1938, aos quatorze anos, começou a aprender capoeira nas rodas organizadas por Mestre Juvêncio, um estivador que realizava encontros informais nas docas de São Félix durante as festas da Igreja de São Deus Menino e Senhor São Félix. Como Ananias recordou mais tarde: "Juvêncio era o mestre. Ele era estivador e fazia capoeira na beira do cais de São Félix... Ninguém ensinava, mas o mestre mesmo era o Juvêncio, todo mundo se reunia e pronto".

Essas rodas reuniam praticantes notáveis: João de Zazá, os irmãos Toy e Roxinho, os irmãos Alvelino e Santos de Muritiba, Caial, Café, e Estevão—um vigia da fábrica de charutos "Letialvi" que Ananias lembrava como tendo "capoeira perversa". Um jovem Traíra de Cachoeira também frequentava esses encontros. Aos quatorze anos, disse Ananias, "você começa a sentir a capoeira no sangue".

Em 1942, Ananias mudou-se para Salvador e estabeleceu-se no bairro da Liberdade. De 1942 a 1946, treinou com Mestre Canjiquinha no espaço de Mestre Pastinha, tocando na bateria de Pastinha durante rodas de rua ao lado de Mestre Gato Preto. De 1946 a 1953, treinou com Mestre Waldemar no lendário Barracão na área do Corta-Braço da Liberdade. Durante esse período, treinou ao lado dos grandes nomes: Pastinha, Nagé, Onça Preta, Noronha, Dorival (irmão de Waldemar), Traíra, Cobrinha Verde, Bugalho, Zacaria, Bom Cabelo e Mucungê. Waldemar eventualmente lhe deu a posição de contra-mestre de bateria após testes rigorosos pelos mestres.

Em 1953, tudo mudou. Os produtores de teatro Wilson e Sérgio Maia vieram ao Corta-Braço buscando capoeiristas para a cena teatral paulistana. Ananias, junto com Evaristo Martins Vieira, Jonas Ferreira dos Santos e Adão Felix Reis, viajou para "a terra da garoa" (São Paulo). Ao chegar, Ananias fundou a Associação de Capoeira Angola Senhor do Bonfim e estabeleceu a lendária roda de domingo na Praça da República—uma tradição que perduraria por mais de sessenta anos.

Em São Paulo, Ananias colaborou com gigantes do teatro, incluindo o dramaturgo Plínio Marcos e o poeta Solano Trindade. Em 1960, apareceu na primeira produção de "O Pagador de Promessas" no Teatro Brasileiro de Comédia (TBC), dirigida por Flávio Rangel. A adaptação cinematográfica de 1962 por Anselmo Duarte ganhou a Palma de Ouro em Cannes. Ananias contribuiu para a trilha sonora do filme. Continuou no teatro, aparecendo em "Balbina de Iansã" (1970) e "Jesus Homem" (1980), ambas escritas por Plínio Marcos.

Ao longo de sua vida, Ananias serviu como Ogã—um líder cerimonial no Candomblé de Angola. Ele via capoeira, samba de roda e Candomblé como expressões inseparáveis da herança africana no Brasil. Aprendeu samba com seu pai e velhos músicos baianos em terreiros de candomblé e rodas de samba.

Em 1979, Ananias apareceu no LP de Mestre Joel ao lado de Dadinho e João Bráz. Aos 80 anos em 2004, gravou seu primeiro CD de capoeira, "Original Ao Vivo", com seus discípulos. Em 2007, aos 83, lançou um CD de samba de roda com o Grupo Garoa do Recôncavo—um grupo formado por seus discípulos que apresentava o samba de roda tradicional do Recôncavo Baiano. Em 2009, foi destaque no documentário "Cantador de Chula".

A Praça da República tornou-se uma instituição. Por mais de cinquenta anos, todo domingo, capoeiristas de todos os estilos—Angola, Regional, Contemporânea—se reuniam em sua roda. Mestres Suassuna, Camisa, Moraes e incontáveis outros passaram por lá. No início dos anos 1990, discípulos formados nessa roda criaram a Casa Mestre Ananias—Centro Paulistano de Capoeira e Tradições Baianas, localizada na Rua Conselheiro Ramalho, no bairro do Bixiga. Contramestre Rafael treinou diretamente com ele, e Rodrigo Minhoca, que passou de 1995 até a morte de Ananias aprendendo com ele, agora lidera a Casa.

Em uma entrevista de 2005, aos 81 anos, Ananias refletiu sobre o que a capoeira exige: "Seja dedicado para aprender tudo na capoeira, dos instrumentos ao jogo". Ele lamentava a prática moderna: a capoeira contemporânea era "tudo devagar" e faltava respeito pela capoeira angola, que "devia ser baixa e alta, um jogo animado". Admirava praticantes como Nagé, Onça Preta, Maré, Traíra, Bom Cabelo, Zacarias e Caiçara—este último descrito como "diabólico".

Mestre Ananias faleceu em 21 de julho de 2016, em Bela Vista, São Paulo, aos 91 anos. Seu velório foi realizado na Casa Mestre Ananias, e foi sepultado no Cemitério Carmosina em Itaquera. É lembrado como o pai da capoeira paulistana—um guardião das tradições baianas autênticas que trouxe toda a amplitude da cultura afro-brasileira do Recôncavo para a metrópole.',
  -- achievements_en
  E'1953: Founded Associação de Capoeira Angola Senhor do Bonfim in São Paulo
1953: Established the legendary Sunday roda at Praça da República, maintained for 60+ years
1960: Appeared in first production of "O Pagador de Promessas" at TBC (later Palme d''Or winner film)
1970: Appeared in "Balbina de Iansã" by Plínio Marcos
1979: Recorded with Mestre Joel''s LP
1980: Appeared in "Jesus Homem" by Plínio Marcos
2004: First capoeira CD "Original Ao Vivo" at age 80
2007: Samba de Roda CD with Grupo Garoa do Recôncavo at age 83
2009: Featured in documentary "Cantador de Chula"
Pioneer of capoeira in São Paulo - considered the "father" of São Paulo capoeira
Preserved and transmitted traditional Recôncavo samba de roda in São Paulo',
  -- achievements_pt
  E'1953: Fundou a Associação de Capoeira Angola Senhor do Bonfim em São Paulo
1953: Estabeleceu a lendária roda de domingo na Praça da República, mantida por mais de 60 anos
1960: Apareceu na primeira produção de "O Pagador de Promessas" no TBC (depois filme vencedor da Palma de Ouro)
1970: Apareceu em "Balbina de Iansã" de Plínio Marcos
1979: Gravou no LP de Mestre Joel
1980: Apareceu em "Jesus Homem" de Plínio Marcos
2004: Primeiro CD de capoeira "Original Ao Vivo" aos 80 anos
2007: CD de Samba de Roda com Grupo Garoa do Recôncavo aos 83 anos
2009: Destaque no documentário "Cantador de Chula"
Pioneiro da capoeira em São Paulo - considerado o "pai" da capoeira paulistana
Preservou e transmitiu o samba de roda tradicional do Recôncavo em São Paulo',
  -- notes_en
  E'BIRTH DATE DISCREPANCY:
- Wikipedia PT: October 4, 1924 (São Félix, 4 de outubro de 1924)
- velhosmestres.com: December 1924
- wiki.urucungo.com.br: December 1, 1924
Using October 4, 1924 per Wikipedia PT as most specific source.

DEATH DATE: July 21, 2016 (confirmed by Wikipedia PT, IPHAN notice, velhosmestres.com)

PARENTS:
- Father: João Ferreira de Souza (samba player)
- Mother: Joventina dos Santos Ferreira

TEACHERS (chronological):
- Mestre Juvêncio (1938+, São Félix dock rodas)
- Mestre Canjiquinha (1942-1946, at Pastinha''s space in Liberdade)
- Mestre Waldemar (1946-1953, Barracão de Waldemar, Liberdade)

TRAINING COMPANIONS (São Félix):
- João de Zazá
- Brothers Toy and Roxinho
- Brothers Alvelino and Santos (Muritiba)
- Caial
- Estevão (factory guard, "capoeira perversa")
- Traíra (Cachoeira)
- Café (Cachoeira)

TRAINING COMPANIONS (Salvador):
- Pastinha
- Nagé
- Onça Preta
- Noronha
- Dorival (Waldemar''s brother)
- Traíra
- Cobrinha Verde
- Bugalho
- Zacaria
- Bom Cabelo
- Mucungê
- Gato Preto

TITLE FROM WALDEMAR: Received contra-mestre de bateria after rigorous testing by the mestres.

DIPLOMA FROM CANJIQUINHA: Ananias said he "got his diploma" from Canjiquinha, though "at that time, there wasn''t this business of diplomas".

MOVE TO SÃO PAULO (1953):
- Recruited by producers Wilson and Sérgio Maia for theater
- Traveled with Evaristo Martins Vieira, Jonas Ferreira dos Santos, Adão Felix Reis
- Founded Associação de Capoeira Angola Senhor do Bonfim upon arrival

MEDIA APPEARANCES:
- 1960: "O Pagador de Promessas" (TBC production, Flávio Rangel director)
- 1962: Film "O Pagador de Promessas" (contributed to soundtrack)
- 1970: "Balbina de Iansã" (Plínio Marcos)
- 1979: Mestre Joel''s LP (with Dadinho, João Bráz)
- 1980: "Jesus Homem" (Plínio Marcos)
- 2004: CD "Original Ao Vivo" (age 80)
- 2007: CD "Samba de Roda" with Grupo Garoa do Recôncavo (age 83)
- 2009: Documentary "Cantador de Chula"

CANDOMBLÉ: Served as Ogã (ceremonial leader) in Candomblé de Angola

RODA DA PRAÇA DA REPÚBLICA: Famous capoeiristas who passed through include Suassuna, Camisa, Moraes, and many others from all styles

STUDENTS/DISCIPLES:
- Contramestre Rafael (trained directly)
- Rodrigo Minhoca/Mestre Minhoca (1995-2016, now leads Casa Mestre Ananias)

CASA MESTRE ANANIAS:
- 1990s: Founded by disciples from Praça da República roda
- 1997-2000: Started in São Judas neighborhood
- 2007: Reopened in Bela Vista/Bixiga neighborhood
- Address: Rua Conselheiro Ramalho, 939/945, Bela Vista, São Paulo

FUNERAL (July 21, 2016):
- Velório at Casa Mestre Ananias (8:00-14:00)
- Burial at Cemitério Carmosina, Itaquera',
  -- notes_pt
  E'DISCREPÂNCIA NA DATA DE NASCIMENTO:
- Wikipedia PT: 4 de outubro de 1924 (São Félix)
- velhosmestres.com: dezembro de 1924
- wiki.urucungo.com.br: 1 de dezembro de 1924
Usando 4 de outubro de 1924 conforme Wikipedia PT como fonte mais específica.

DATA DE MORTE: 21 de julho de 2016 (confirmado por Wikipedia PT, nota do IPHAN, velhosmestres.com)

PAIS:
- Pai: João Ferreira de Souza (sambista)
- Mãe: Joventina dos Santos Ferreira

MESTRES (cronológico):
- Mestre Juvêncio (1938+, rodas nas docas de São Félix)
- Mestre Canjiquinha (1942-1946, no espaço de Pastinha na Liberdade)
- Mestre Waldemar (1946-1953, Barracão de Waldemar, Liberdade)

COMPANHEIROS DE TREINO (São Félix):
- João de Zazá
- Irmãos Toy e Roxinho
- Irmãos Alvelino e Santos (Muritiba)
- Caial
- Estevão (vigia de fábrica, "capoeira perversa")
- Traíra (Cachoeira)
- Café (Cachoeira)

COMPANHEIROS DE TREINO (Salvador):
- Pastinha
- Nagé
- Onça Preta
- Noronha
- Dorival (irmão de Waldemar)
- Traíra
- Cobrinha Verde
- Bugalho
- Zacaria
- Bom Cabelo
- Mucungê
- Gato Preto

TÍTULO DE WALDEMAR: Recebeu contra-mestre de bateria após testes rigorosos pelos mestres.

DIPLOMA DE CANJIQUINHA: Ananias disse que "tirou seu diploma" com Canjiquinha, embora "naquele tempo, não tinha esse negócio de diploma".

MUDANÇA PARA SÃO PAULO (1953):
- Recrutado pelos produtores Wilson e Sérgio Maia para teatro
- Viajou com Evaristo Martins Vieira, Jonas Ferreira dos Santos, Adão Felix Reis
- Fundou Associação de Capoeira Angola Senhor do Bonfim ao chegar

APARIÇÕES NA MÍDIA:
- 1960: "O Pagador de Promessas" (produção TBC, diretor Flávio Rangel)
- 1962: Filme "O Pagador de Promessas" (contribuiu para trilha sonora)
- 1970: "Balbina de Iansã" (Plínio Marcos)
- 1979: LP de Mestre Joel (com Dadinho, João Bráz)
- 1980: "Jesus Homem" (Plínio Marcos)
- 2004: CD "Original Ao Vivo" (80 anos)
- 2007: CD "Samba de Roda" com Grupo Garoa do Recôncavo (83 anos)
- 2009: Documentário "Cantador de Chula"

CANDOMBLÉ: Serviu como Ogã (líder cerimonial) no Candomblé de Angola

RODA DA PRAÇA DA REPÚBLICA: Capoeiristas famosos que passaram incluem Suassuna, Camisa, Moraes e muitos outros de todos os estilos

ALUNOS/DISCÍPULOS:
- Contramestre Rafael (treinou diretamente)
- Rodrigo Minhoca/Mestre Minhoca (1995-2016, agora lidera Casa Mestre Ananias)

CASA MESTRE ANANIAS:
- Anos 1990: Fundada por discípulos da roda da Praça da República
- 1997-2000: Começou no bairro São Judas
- 2007: Reaberta no bairro Bela Vista/Bixiga
- Endereço: Rua Conselheiro Ramalho, 939/945, Bela Vista, São Paulo

FUNERAL (21 de julho de 2016):
- Velório na Casa Mestre Ananias (8:00-14:00)
- Sepultamento no Cemitério Carmosina, Itaquera'
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
