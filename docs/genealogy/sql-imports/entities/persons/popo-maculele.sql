-- ============================================================
-- GENEALOGY PERSON: Popó do Maculelê
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH YEAR: 1876 (exact, per CapoeiraWiki, CapoeiraHub, multiple sources)
-- DEATH YEAR: 1969 (exact, per CapoeiraWiki, CapoeiraHub)
--
-- FULL NAME: Paulino Almeida de Andrade (some sources: Paulino Aluísio de Andrade)
-- BIRTHPLACE: Santo Amaro da Purificação, Bahia, Brazil
-- DEATH PLACE: Santo Amaro, Bahia, Brazil
--
-- SIGNIFICANCE: Known as the "Pai do Maculelê no Brasil" (Father of Maculelê
-- in Brazil). Revived and popularized maculelê in 1943 after the tradition
-- had nearly disappeared. Formed Conjunto de Maculelê de Santo Amaro.
-- Performed at III Congresso Brasileiro de Folclore (1957). Taught visitors
-- including Mestre Gato (Senzala) in 1968. Also practiced capoeira.
--
-- TEACHERS: João Oléa, Tiaju (Tia Jô), Zé do Brinquinho - all formerly
-- enslaved Africans of Malê descent who preserved maculelê traditions.
--
-- NOTE: Uses apelido "Popó do Maculelê" to distinguish from possible
-- other capoeiristas named Popó.
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
  'Paulino Almeida de Andrade',
  'Popó do Maculelê',
  NULL,
  NULL,
  NULL,
  ARRAY[
    'https://capoeirawiki.org/wiki/Paulino_Almeida_de_Andrade',
    'https://www.capoeirahub.net/mestres/68a1f7360223926ddbeeb1fe-mestre-popo?lang=en',
    'https://www.recantodasletras.com.br/artigos-de-esporte/7902673'
  ]::text[],
  'angola'::genealogy.style,
  E'Popó was primarily known as the reviver of maculelê—an Afro-Brazilian stick-fighting dance tradition from Santo Amaro da Purificação. While sources describe him as both a capoeirista and maculelê master, his legendary status derives from maculelê preservation. He learned from formerly enslaved Africans of Malê descent and described maculelê as simultaneously "luta e dança" (fight and dance).',
  E'Popó foi conhecido principalmente como o revitalizador do maculelê—uma tradição afro-brasileira de dança-luta com bastões de Santo Amaro da Purificação. Embora as fontes o descrevam como capoeirista e mestre de maculelê, seu status lendário deriva da preservação do maculelê. Aprendeu com africanos anteriormente escravizados de origem Malê e descreveu o maculelê como simultaneamente "luta e dança".',
  1876,
  'exact'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1969,
  'exact'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  E'Paulino Almeida de Andrade, known as Popó do Maculelê or simply Mestre Popó, was born on March 15, 1876, in Santo Amaro da Purificação, Bahia—a city in the Recôncavo Baiano region known as the birthplace of Bahian capoeira and a crucible of Afro-Brazilian cultural traditions.

The son of a fisherman, Popó grew up immersed in the living memory of slavery. He learned maculelê—an Afro-Brazilian stick-fighting dance of profound dramatic intensity—from a group of elderly formerly enslaved Africans of Malê descent: João Oléa, Tiaju (Tia Jô), and Zé do Brinquinho. The Malês were Muslim warriors from West Africa who had led the largest urban slave revolt in Brazilian history in Bahia in 1835. From these teachers, Popó absorbed not only the movements and rhythms of maculelê but its spiritual and historical significance as an art of resistance.

In the early 20th century, as the generation of former slaves passed away, maculelê began disappearing from the patron saint festivals of Santo Amaro. The tradition seemed destined to die with its practitioners. But in 1943, Popó—then 67 years old—decided to act. Drawing on his memories, he gathered his children, grandchildren, and neighbors on Rua da Linha in Santo Amaro and began teaching them the dance. As he later stated: "eles eram livres, mas quem botou o Maculelê fui eu mesmo" (they were free, but I myself established Maculelê).

He formed the Conjunto de Maculelê de Santo Amaro, which became widely known for its performances at the annual festivals held from December 8 through February 2. In July 1957, Popó led his group of 15 performers to the III Congresso Brasileiro de Folclore in Salvador, where they performed in the courtyard of the Feminine Institute, accompanied by three drums, a caxixi, and an agogô. They received a warm reception from the congress attendees.

On December 16, 1968, researcher Maria Mutti interviewed Popó in Santo Amaro da Purificação. The 92-year-old master provided detailed instruction on the instruments, musical functions, costumes, and historical context of maculelê—knowledge that would prove invaluable for future practitioners and scholars.

That same year, in 1968, Mestre Gato of Grupo Senzala visited Santo Amaro da Purificação and attended classes and rodas with Popó, along with Mestres Ezequiel and Saci. This visit, in the final year of Popó''s life, connected the young Rio de Janeiro capoeirista to the deep Bahian traditions that the elder master had preserved.

Popó described maculelê as both "luta e dança" (fight and dance)—a dual nature reflecting its historical function as training disguised as celebration. He integrated musical and choreographic elements from candomblé, with the three drums (Rum, Rumpi, and Lê) providing the rhythmic foundation while performers struck wooden sticks (grimas) in synchronized patterns.

Popó''s son Zezinho later moved to Salvador, where he met Mestre Bimba, the creator of Capoeira Regional. Through this connection, Bimba adopted maculelê for demonstrations and as physical training for his students, incorporating the Santo Amaro tradition into the broader capoeira curriculum. Zezinho''s version of maculelê differed from his father''s, having been adapted to capoeira. Bimba also received maculelê knowledge from another source: Tiburcinho de Jaguaripe, a batuque master introduced to him by Dr. Ângelo Decânio in the 1950s, who contributed songs and choreography from the Recôncavo tradition. Through these combined influences from Santo Amaro and Jaguaripe, maculelê became an integral part of Capoeira Regional training and spread to capoeira groups worldwide.

Popó died on September 16, 1969, at the age of 93, in Santo Amaro. His legacy continues through his descendants—including his grandson Evilásio de Andrade (Vivi de Popó) and great-great-grandson Mestre Tampinha (Valmir Andrade da Silva), who today introduces himself as "grandson of Vivi de Popó and great-great-grandson of Popó do Maculelê."

Just as Capoeira Angola had Mestre Pastinha as its great defender, maculelê had Popó do Maculelê. He transformed what could have been lost forever into a vibrant tradition now practiced across Brazil and in capoeira academies worldwide. As one source puts it, he was "a fisherman''s son from Santo Amaro who carried an old fire into a new century."',
  E'Paulino Almeida de Andrade, conhecido como Popó do Maculelê ou simplesmente Mestre Popó, nasceu em 15 de março de 1876, em Santo Amaro da Purificação, Bahia—uma cidade na região do Recôncavo Baiano conhecida como o berço da capoeira baiana e um cadinho de tradições culturais afro-brasileiras.

Filho de pescador, Popó cresceu imerso na memória viva da escravidão. Aprendeu o maculelê—uma dança-luta afro-brasileira com bastões de profunda intensidade dramática—com um grupo de idosos africanos anteriormente escravizados de origem Malê: João Oléa, Tiaju (Tia Jô) e Zé do Brinquinho. Os Malês eram guerreiros muçulmanos da África Ocidental que haviam liderado a maior revolta urbana de escravos da história brasileira na Bahia em 1835. Desses professores, Popó absorveu não apenas os movimentos e ritmos do maculelê, mas seu significado espiritual e histórico como arte de resistência.

No início do século XX, à medida que a geração de ex-escravos falecia, o maculelê começou a desaparecer das festas do padroeiro de Santo Amaro. A tradição parecia destinada a morrer com seus praticantes. Mas em 1943, Popó—então com 67 anos—decidiu agir. Baseando-se em suas memórias, reuniu seus filhos, netos e vizinhos na Rua da Linha em Santo Amaro e começou a ensinar-lhes a dança. Como ele declarou mais tarde: "eles eram livres, mas quem botou o Maculelê fui eu mesmo."

Ele formou o Conjunto de Maculelê de Santo Amaro, que ficou amplamente conhecido por suas apresentações nos festivais anuais realizados de 8 de dezembro a 2 de fevereiro. Em julho de 1957, Popó liderou seu grupo de 15 apresentadores ao III Congresso Brasileiro de Folclore em Salvador, onde se apresentaram no pátio do Instituto Feminino, acompanhados por três tambores, um caxixi e um agogô. Receberam uma recepção calorosa dos congressistas.

Em 16 de dezembro de 1968, a pesquisadora Maria Mutti entrevistou Popó em Santo Amaro da Purificação. O mestre de 92 anos forneceu instruções detalhadas sobre os instrumentos, funções musicais, figurinos e contexto histórico do maculelê—conhecimento que se mostraria inestimável para futuros praticantes e estudiosos.

Nesse mesmo ano, em 1968, Mestre Gato do Grupo Senzala visitou Santo Amaro da Purificação e assistiu a aulas e rodas com Popó, junto com os Mestres Ezequiel e Saci. Esta visita, no último ano de vida de Popó, conectou o jovem capoeirista do Rio de Janeiro às profundas tradições baianas que o mestre mais velho havia preservado.

Popó descreveu o maculelê como simultaneamente "luta e dança"—uma natureza dual que refletia sua função histórica como treinamento disfarçado de celebração. Ele integrou elementos musicais e coreográficos do candomblé, com os três tambores (Rum, Rumpi e Lê) fornecendo a base rítmica enquanto os apresentadores batiam bastões de madeira (grimas) em padrões sincronizados.

O filho de Popó, Zezinho, mais tarde mudou-se para Salvador, onde conheceu Mestre Bimba, o criador da Capoeira Regional. Através dessa conexão, Bimba adotou o maculelê para demonstrações e como treinamento físico para seus alunos, incorporando a tradição de Santo Amaro ao currículo mais amplo da capoeira. A versão do maculelê de Zezinho diferia da de seu pai, tendo sido adaptada à capoeira. Bimba também recebeu conhecimento de maculelê de outra fonte: Tiburcinho de Jaguaripe, um mestre de batuque apresentado a ele pelo Dr. Ângelo Decânio na década de 1950, que contribuiu com cantigas e coreografias da tradição do Recôncavo. Através dessas influências combinadas de Santo Amaro e Jaguaripe, o maculelê tornou-se parte integrante do treinamento de Capoeira Regional e se espalhou para grupos de capoeira em todo o mundo.

Popó morreu em 16 de setembro de 1969, aos 93 anos, em Santo Amaro. Seu legado continua através de seus descendentes—incluindo seu neto Evilásio de Andrade (Vivi de Popó) e bisneto Mestre Tampinha (Valmir Andrade da Silva), que hoje se apresenta como "neto de Vivi de Popó e bisneto de Popó do Maculelê."

Assim como a Capoeira Angola teve Mestre Pastinha como seu grande defensor, o maculelê teve Popó do Maculelê. Ele transformou o que poderia ter sido perdido para sempre em uma tradição vibrante agora praticada em todo o Brasil e em academias de capoeira em todo o mundo. Como uma fonte coloca, ele foi "filho de pescador de Santo Amaro que carregou um fogo antigo para um novo século."',
  E'- Revived and popularized maculelê in Santo Amaro da Purificação (1943)
- Considered "Pai do Maculelê no Brasil" (Father of Maculelê in Brazil)
- Founded Conjunto de Maculelê de Santo Amaro (1943)
- Performed at III Congresso Brasileiro de Folclore in Salvador (July 1957)
- Interviewed by Maria Mutti documenting maculelê traditions (December 16, 1968)
- Received visitors from Grupo Senzala including Mestre Gato (1968)
- His son Zezinho introduced maculelê to Mestre Bimba in Salvador
- Preserved tradition learned from formerly enslaved Malê Africans
- Legacy continues through five generations of descendants',
  E'- Revitalizou e popularizou o maculelê em Santo Amaro da Purificação (1943)
- Considerado "Pai do Maculelê no Brasil"
- Fundou o Conjunto de Maculelê de Santo Amaro (1943)
- Apresentou-se no III Congresso Brasileiro de Folclore em Salvador (julho 1957)
- Entrevistado por Maria Mutti documentando tradições do maculelê (16 de dezembro de 1968)
- Recebeu visitantes do Grupo Senzala incluindo Mestre Gato (1968)
- Seu filho Zezinho introduziu o maculelê a Mestre Bimba em Salvador
- Preservou tradição aprendida com africanos Malês anteriormente escravizados
- Legado continua através de cinco gerações de descendentes',
  E'BIRTH DATE: March 15, 1876 (exact)
Death: September 16, 1969 (exact, age 93)

NAME DISCREPANCY:
- "Paulino Almeida de Andrade" - CapoeiraWiki, most sources (MAJORITY)
- "Paulino Aluísio de Andrade" - CPPA, Quilombo das Camélias
- "Paulo Andrade (Popó)" - Velhos Mestres 1957 congress reference
Using "Paulino Almeida de Andrade" as most common in primary sources.

TEACHERS (Maculelê):
- João Oléa - formerly enslaved African of Malê descent
- Tiaju (Tia Jô) - formerly enslaved African of Malê descent
- Zé do Brinquinho - formerly enslaved African of Malê descent
These were Popó''s sources for maculelê tradition. No capoeira teachers documented.

STUDENTS/DESCENDANTS:
- Zezinho (son) - moved to Salvador, met Mestre Bimba, introduced maculelê to capoeira; adapted maculelê to capoeira style
- Vavá de Popó (child) - mentioned in 1968 interview
- Raimunda (daughter) - mentioned in 1968 interview
- Vivi de Popó (Evilásio de Andrade) - grandson; continued maculelê tradition
- Mestre Tampinha (Valmir Andrade da Silva) - great-great-grandson; currently active

MEDIA APPEARANCES:
- July 1957: Performance at III Congresso Brasileiro de Folclore, Salvador (Instituto Feminino courtyard)
- December 16, 1968: Interview with researcher Maria Mutti in Santo Amaro da Purificação

GROUP FOUNDED:
- Conjunto de Maculelê de Santo Amaro (1943) - 15 performers; performed at festivals Dec 8 - Feb 2

CONNECTION TO CAPOEIRA:
Mestre Gato (Senzala) visited Santo Amaro da Purificação in 1968 and attended "aulas e rodas" with Popó, Ezequiel, and Saci. This was in the final year of Popó''s life.

NOTE: While sources consistently describe Popó as both a capoeirista and maculelê master, his documented legacy is primarily in maculelê. No formal title (Mestre) documented for capoeira specifically. The visitation by Gato in 1968 suggests he was recognized in local capoeira community.',
  E'DATA DE NASCIMENTO: 15 de março de 1876 (exato)
Morte: 16 de setembro de 1969 (exato, 93 anos)

DISCREPÂNCIA DE NOME:
- "Paulino Almeida de Andrade" - CapoeiraWiki, maioria das fontes (MAIORIA)
- "Paulino Aluísio de Andrade" - CPPA, Quilombo das Camélias
- "Paulo Andrade (Popó)" - Referência ao congresso de 1957 do Velhos Mestres
Usando "Paulino Almeida de Andrade" como mais comum nas fontes primárias.

PROFESSORES (Maculelê):
- João Oléa - africano anteriormente escravizado de origem Malê
- Tiaju (Tia Jô) - africano anteriormente escravizado de origem Malê
- Zé do Brinquinho - africano anteriormente escravizado de origem Malê
Estes foram as fontes de Popó para a tradição do maculelê. Nenhum professor de capoeira documentado.

ALUNOS/DESCENDENTES:
- Zezinho (filho) - mudou-se para Salvador, conheceu Mestre Bimba, introduziu o maculelê à capoeira; adaptou o maculelê ao estilo da capoeira
- Vavá de Popó (filho) - mencionado na entrevista de 1968
- Raimunda (filha) - mencionada na entrevista de 1968
- Vivi de Popó (Evilásio de Andrade) - neto; continuou a tradição do maculelê
- Mestre Tampinha (Valmir Andrade da Silva) - bisneto; atualmente ativo

APARIÇÕES NA MÍDIA:
- Julho 1957: Apresentação no III Congresso Brasileiro de Folclore, Salvador (pátio do Instituto Feminino)
- 16 de dezembro de 1968: Entrevista com pesquisadora Maria Mutti em Santo Amaro da Purificação

GRUPO FUNDADO:
- Conjunto de Maculelê de Santo Amaro (1943) - 15 apresentadores; apresentou-se em festivais de 8 dez - 2 fev

CONEXÃO COM A CAPOEIRA:
Mestre Gato (Senzala) visitou Santo Amaro da Purificação em 1968 e assistiu a "aulas e rodas" com Popó, Ezequiel e Saci. Isso foi no último ano de vida de Popó.

NOTA: Embora as fontes consistentemente descrevam Popó como capoeirista e mestre de maculelê, seu legado documentado é principalmente no maculelê. Nenhum título formal (Mestre) documentado especificamente para capoeira. A visitação de Gato em 1968 sugere que ele era reconhecido na comunidade local de capoeira.'
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
