-- ============================================================
-- GENEALOGY PERSON: Celso do Engenho
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH DATE: October 24, 1939 - Confirmed by Wikipedia PT
-- and capoeirahistory.com.
--
-- DEATH DATE: Still alive as of 2024 (age 85).
-- Instagram posts from 2024-2025 show him active, described as
-- "79 anos de história" (79 years of history/experience).
--
-- STYLE: Mixed/Contemporary - His style was developed
-- "independently of the capoeira schism" according to ACER
-- Cornwall, combining elements learned from Artur Emídio with
-- influences from Rio's diverse capoeira community.
--
-- LINEAGE: Paizinho → Artur Emídio → Celso do Engenho
--
-- SIGNIFICANCE: Key Rio de Janeiro mestre; founder of ACER
-- (1973); one of oldest active living capoeira masters; part of
-- foundational generation of contemporary Rio capoeira alongside
-- Artur Emídio, Leopoldina, Mário Buscapé, Djalma Bandeira,
-- Roque, Paulo Gomes; winner of Prêmio Viva Meu Mestre (2011);
-- important oral history source documenting early Rio capoeira
-- (1910-1950), providing testimony about his cousin "Americano"
-- who practiced "tiririca" at Ilha Grande prison.
--
-- ALTERNATE NAMES: Wikipedia mentions "Celso Galo de Briga" as
-- an alternate name in the backlog notes, but this was not found
-- in any web sources during research.
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
  'Celso Carvalho do Nascimento',
  'Celso do Engenho',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://pt.wikipedia.org/wiki/Mestre_Celso',
    'https://capoeirahistory.com/masters-in-rio-de-janeiro/'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Celso do Engenho''s style was developed "independently of the capoeira schism" between Angola and Regional, according to ACER Cornwall. Training under Mestre Artur Emídio at his academy in Bonsucesso, Rio de Janeiro, Celso absorbed the eclectic environment of Artur''s legendary Sunday rodas, where mestres from all over Brazil - Paraná, Mucungê, and others - would gather. His style reflects this fusion environment that was crucial to the development of Contemporary Capoeira in Rio de Janeiro. At 85 years old, he remains the oldest active Capoeira Master teaching and playing in Rio.',
  E'O estilo de Celso do Engenho foi desenvolvido "independentemente do cisma da capoeira" entre Angola e Regional, segundo a ACER Cornwall. Treinando com Mestre Artur Emídio em sua academia em Bonsucesso, Rio de Janeiro, Celso absorveu o ambiente eclético das lendárias rodas de domingo de Artur, onde mestres de todo o Brasil - Paraná, Mucungê e outros - se reuniam. Seu estilo reflete esse ambiente de fusão que foi crucial para o desenvolvimento da Capoeira Contemporânea no Rio de Janeiro. Aos 85 anos, ele permanece o mais antigo Mestre de Capoeira ativo ensinando e jogando no Rio.',
  -- Life dates
  1939,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (English)
  E'Celso Carvalho do Nascimento, known as Mestre Celso or Celso do Engenho, was born on October 24, 1939, in Rio de Janeiro. He belongs to a generation of capoeiristas born in the 1930s who formed the core from which contemporary capoeira developed in Rio de Janeiro, alongside mestres Artur Emídio, Leopoldina, Mário Buscapé, Djalma Bandeira, Roque, and Paulo Gomes.

Celso learned capoeira from Mestre Artur Emídio at his academy in Bonsucesso, one of the first formal capoeira academies in Rio de Janeiro. There he trained and graduated as a Master along with other important names such as Leopoldina and Djalma Bandeira. A historic photograph from Artur Emídio''s academy shows Celso standing alongside prominent figures including Mintirinha, Aranha, Zé Pedro, Djalma, Silas, Luiz Malhado, Cigano, Artur Emídio, André Lacé, and Preguiça.

In 1973, Celso founded the Associação de Capoeira Engenho da Rainha (ACER) in the Engenho da Rainha suburb of Rio de Janeiro, a working-class neighborhood in the Zona Norte. The organization continues to operate today, with Celso serving as president, and has expanded internationally with branches in the UK including Devon and Cornwall.

During the 1960s and 70s, Celso was recognized as one of the most prominent capoeiristas in Rio de Janeiro. Mestre Gary (Mestre 22 da Bonfim), recalling this dangerous era, listed the notable capoeiristas of the time: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon".

Celso trained students who became important figures in their own right. By 1969, his students João Marcos and Adilson Vitor were teaching at the Furgão club in the Pilares neighborhood, where Master Rui Charuto practiced with them. Celso''s nephew Luizão also became a respected figure in the capoeira community. His son Professor Bicudo continues the lineage, leading ACER branches in Surrey, UK. Student Sunil Ninjinho emerged as "one of the best students from Engenho da Rainha group" and was graded in Brazil during Mestre Celso''s 70th birthday celebration.

Celso has made significant contributions to capoeira history through his oral testimonies. In an important interview recorded on April 23, 2002, he provided valuable accounts of capoeira practices in Rio de Janeiro before the arrival of organized academies. He recalled observing factory worker Maneca performing capoeira-like movements in 1954, noting that practitioners at the time "didn''t say it was capoeira... they said he was a malandro [cunning guy]".

Most significantly, Celso provided testimony about his cousin known as "Americano", who had been imprisoned at Ilha Grande. Celso recounted: "I had a cousin who was also imprisoned at Ilha Grande. Americano, that was his nickname. This cousin of mine also did some capoeira things, rolling on the ground, throwing legs, giving headbutts, but he said that was tiririca, they did it there at Ilha Grande in the prison". This testimony documents the practice of capoeira-like movements called "tiririca" within Rio''s prison system, demonstrating how capoeira techniques persisted under different names during the era of prohibition.

Celso was emphatic that he only saw an actual roda de capoeira after Artur Emídio came to Rio de Janeiro: "The first time I saw a capoeira roda was at Arthur Emídio''s academy in Praça Mauá, in 1959". When asked to define capoeira, Mestre Celso offered the philosophical response: "Capoeira is capoeira" - suggesting the art transcends simple definition.

In 2011, Celso was one of 100 winners of the first edition of the Prêmio Viva Meu Mestre, created by the Instituto do Patrimônio Histórico e Artístico Nacional (IPHAN). This award recognizes capoeira masters aged 55 years or older whose life trajectory has fundamentally contributed to the transmission and continuity of capoeira in Brazil.

As of 2024, Mestre Celso remains active and is described as "the oldest active, living Master teaching and playing Capoeira in Rio". Having trained capoeira for over 65 years, he continues to be a vital link to the foundational era of contemporary Rio de Janeiro capoeira.',
  -- Extended content (Portuguese)
  E'Celso Carvalho do Nascimento, conhecido como Mestre Celso ou Celso do Engenho, nasceu em 24 de outubro de 1939, no Rio de Janeiro. Pertence a uma geração de capoeiristas nascidos nos anos 1930 que formou o núcleo a partir do qual a capoeira contemporânea se desenvolveu no Rio de Janeiro, ao lado dos mestres Artur Emídio, Leopoldina, Mário Buscapé, Djalma Bandeira, Roque e Paulo Gomes.

Celso aprendeu capoeira com Mestre Artur Emídio em sua academia em Bonsucesso, uma das primeiras academias formais de capoeira do Rio de Janeiro. Lá treinou e se formou Mestre junto com outros nomes importantes como Leopoldina e Djalma Bandeira. Uma fotografia histórica da academia de Artur Emídio mostra Celso em pé ao lado de figuras proeminentes incluindo Mintirinha, Aranha, Zé Pedro, Djalma, Silas, Luiz Malhado, Cigano, Artur Emídio, André Lacé e Preguiça.

Em 1973, Celso fundou a Associação de Capoeira Engenho da Rainha (ACER) no subúrbio de Engenho da Rainha, no Rio de Janeiro, um bairro de classe trabalhadora na Zona Norte. A organização continua operando hoje, com Celso servindo como presidente, e expandiu-se internacionalmente com filiais no Reino Unido incluindo Devon e Cornualha.

Durante os anos 1960 e 70, Celso era reconhecido como um dos capoeiristas mais proeminentes do Rio de Janeiro. Mestre Gary (Mestre 22 da Bonfim), recordando essa era perigosa, listou os capoeiristas notáveis da época: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon".

Celso treinou alunos que se tornaram figuras importantes. Em 1969, seus alunos João Marcos e Adilson Vitor ensinavam no clube Furgão no bairro de Pilares, onde Mestre Rui Charuto praticava com eles. O sobrinho de Celso, Luizão, também se tornou uma figura respeitada na comunidade de capoeira. Seu filho Professor Bicudo continua a linhagem, liderando filiais da ACER em Surrey, no Reino Unido. O aluno Sunil Ninjinho emergiu como "um dos melhores alunos do grupo Engenho da Rainha" e foi graduado no Brasil durante a celebração do 70º aniversário de Mestre Celso.

Celso fez contribuições significativas para a história da capoeira através de seus depoimentos orais. Em uma importante entrevista gravada em 23 de abril de 2002, ele forneceu relatos valiosos sobre práticas de capoeira no Rio de Janeiro antes da chegada das academias organizadas. Recordou observar o operário Maneca fazendo movimentos semelhantes à capoeira em 1954, notando que os praticantes na época "não diziam que era capoeira... diziam que ele era um cara malandro".

Mais significativamente, Celso forneceu testemunho sobre seu primo conhecido como "Americano", que havia sido preso na Ilha Grande. Celso relatou: "Eu tinha um primo que também, teve preso na Ilha Grande. Americano, né o apelido dele era Americano. Esse meu primo fazia também algumas coisas de capoeira, rolava no chão, jogava a perna, dava cabeçada, mas ele já dizia que aquilo era tiririca, eles faziam lá na Ilha Grande no presídio". Este testemunho documenta a prática de movimentos semelhantes à capoeira chamados "tiririca" dentro do sistema prisional do Rio, demonstrando como as técnicas de capoeira persistiram sob diferentes nomes durante a era da proibição.

Celso foi enfático que só viu uma roda de capoeira real depois que Artur Emídio chegou ao Rio de Janeiro: "A primeira vez que eu vi uma roda de capoeira foi na academia de Arthur Emídio na Praça Mauá, em 1959". Quando perguntado para definir capoeira, Mestre Celso ofereceu a resposta filosófica: "Capoeira é capoeira" - sugerindo que a arte transcende definição simples.

Em 2011, Celso foi um dos 100 vencedores da primeira edição do Prêmio Viva Meu Mestre, criado pelo Instituto do Patrimônio Histórico e Artístico Nacional (IPHAN). Este prêmio reconhece mestres de capoeira com 55 anos ou mais cuja trajetória de vida contribuiu fundamentalmente para a transmissão e continuidade da capoeira no Brasil.

Em 2024, Mestre Celso permanece ativo e é descrito como "o mais antigo Mestre ativo e vivo ensinando e jogando Capoeira no Rio". Tendo treinado capoeira por mais de 65 anos, ele continua sendo um elo vital com a era fundacional da capoeira contemporânea do Rio de Janeiro.',
  -- Achievements (English)
  E'- Founder of Associação de Capoeira Engenho da Rainha (ACER) in 1973
- Winner of Prêmio Viva Meu Mestre 2011 (IPHAN) - recognizing lifetime contribution to capoeira
- Part of foundational generation of contemporary Rio de Janeiro capoeira (1930s birth cohort)
- Oldest active living capoeira master in Rio de Janeiro as of 2024
- Over 65 years of capoeira practice and teaching
- International expansion of ACER to UK (Devon, Cornwall, Surrey)
- Important oral history source documenting early Rio capoeira practices (1910-1950)
- Provided testimony documenting "tiririca" practice at Ilha Grande prison',
  -- Achievements (Portuguese)
  E'- Fundador da Associação de Capoeira Engenho da Rainha (ACER) em 1973
- Vencedor do Prêmio Viva Meu Mestre 2011 (IPHAN) - reconhecendo contribuição vitalícia à capoeira
- Parte da geração fundacional da capoeira contemporânea do Rio de Janeiro (geração nascida nos anos 1930)
- Mestre de capoeira ativo mais antigo vivo no Rio de Janeiro em 2024
- Mais de 65 anos de prática e ensino de capoeira
- Expansão internacional da ACER para o Reino Unido (Devon, Cornualha, Surrey)
- Fonte importante de história oral documentando práticas iniciais de capoeira no Rio (1910-1950)
- Forneceu testemunho documentando prática de "tiririca" na prisão de Ilha Grande',
  -- Researcher notes (English)
  E'BIRTH DATE: October 24, 1939 - Confirmed by Wikipedia PT ("Rio de Janeiro, 24 de outubro de 1939").

DEATH STATUS: Still alive as of 2024. Instagram posts from 2024-2025 describe him with "79 anos de história" (79 years of history/experience in capoeira). ACER UK website (outdated) mentioned him at 75 years old having trained for 55 years.

ALTERNATE NAME "CELSO GALO DE BRIGA": The backlog entry mentioned this nickname, but it was NOT FOUND in any web sources during research. No confirmation of this alternate name.

TEACHER: Artur Emídio - Confirmed by Wikipedia, capoeirahistory.com, velhosmestres.com. Celso trained at Artur''s academy in Bonsucesso alongside Leopoldina and Djalma Bandeira.

STUDENTS CONFIRMED:
- João Marcos - taught at Furgão club, Pilares (1969)
- Adilson Vitor - taught at Furgão club, Pilares (1969)
- Sunil Ninjinho - described as "one of the best students"
- Professor Bicudo - son, leads ACER UK branches

FAMILY:
- Luizão - nephew, respected capoeirista
- Cousin "Americano" - practiced tiririca at Ilha Grande prison (not a capoeirista to be imported, but connection to existing Americano profile in DB)

ACER FOUNDING: 1973 (informal). Legal registration CNPJ 62.163.576/0001-27 shows founding date 11/08/2025, but this appears to be a reregistration. Earlier CNPJ 01.282.344/0001-01 shows founding 12/06/1996 (now closed). The 1973 date refers to informal founding.

TESTIMONY SOURCE: Academic article "A capoeira no Rio de Janeiro (1910-1950): narrativas de mestre Celso" published in Revista Morpheus (UNIRIO). Interview dated April 23, 2002.

AMERICANO CONNECTION: The "Americano" mentioned by Celso may be the same person already in the database as "Americano (Dois Rios)" - added from Sete Coroas/Madame Satã import. This needs verification but suggests overlap between the sources.

FOUR RIO LINEAGES: capoeirahistory.com identifies four main lineages of Contemporary Capoeira in Rio: Artur Emídio, Paraná, Mário Buscapé, and Roque. Celso is part of the Artur Emídio lineage but is listed separately among the "1930s generation" alongside the founders.

SOURCES CONSULTED:
- pt.wikipedia.org/wiki/Mestre_Celso
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-rui-charuto-1959/
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- capoeiraliberdade.net.br/view/historia.php
- capoeira.fandom.com/wiki/La_Capoeira_à_Rio_de_Janeiro_1910_-_1950
- seer.unirio.br/morpheus/article/view/4102
- capoeiracornwall.co.uk (ACER UK)
- econodata.com.br (ACER CNPJ records)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 24 de outubro de 1939 - Confirmado pela Wikipedia PT ("Rio de Janeiro, 24 de outubro de 1939").

STATUS DE FALECIMENTO: Ainda vivo em 2024. Posts do Instagram de 2024-2025 descrevem-no com "79 anos de história" (79 anos de história/experiência em capoeira). Site da ACER UK (desatualizado) mencionava-o com 75 anos tendo treinado por 55 anos.

NOME ALTERNATIVO "CELSO GALO DE BRIGA": A entrada do backlog mencionava este apelido, mas NÃO FOI ENCONTRADO em nenhuma fonte web durante a pesquisa. Sem confirmação deste nome alternativo.

MESTRE: Artur Emídio - Confirmado pela Wikipedia, capoeirahistory.com, velhosmestres.com. Celso treinou na academia de Artur em Bonsucesso junto com Leopoldina e Djalma Bandeira.

ALUNOS CONFIRMADOS:
- João Marcos - ensinava no clube Furgão, Pilares (1969)
- Adilson Vitor - ensinava no clube Furgão, Pilares (1969)
- Sunil Ninjinho - descrito como "um dos melhores alunos"
- Professor Bicudo - filho, lidera filiais da ACER UK

FAMÍLIA:
- Luizão - sobrinho, capoeirista respeitado
- Primo "Americano" - praticava tiririca na prisão de Ilha Grande (não é capoeirista a ser importado, mas conexão com perfil Americano existente no BD)

FUNDAÇÃO DA ACER: 1973 (informal). Registro legal CNPJ 62.163.576/0001-27 mostra data de fundação 11/08/2025, mas isso parece ser um re-registro. CNPJ anterior 01.282.344/0001-01 mostra fundação 12/06/1996 (agora encerrado). A data de 1973 refere-se à fundação informal.

FONTE DO TESTEMUNHO: Artigo acadêmico "A capoeira no Rio de Janeiro (1910-1950): narrativas de mestre Celso" publicado na Revista Morpheus (UNIRIO). Entrevista datada de 23 de abril de 2002.

CONEXÃO AMERICANO: O "Americano" mencionado por Celso pode ser a mesma pessoa já no banco de dados como "Americano (Dois Rios)" - adicionado da importação Sete Coroas/Madame Satã. Isso precisa de verificação mas sugere sobreposição entre as fontes.

QUATRO LINHAGENS DO RIO: capoeirahistory.com identifica quatro principais linhagens da Capoeira Contemporânea no Rio: Artur Emídio, Paraná, Mário Buscapé e Roque. Celso faz parte da linhagem Artur Emídio mas é listado separadamente entre a "geração dos anos 1930" junto com os fundadores.

FONTES CONSULTADAS:
- pt.wikipedia.org/wiki/Mestre_Celso
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-rui-charuto-1959/
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- capoeiraliberdade.net.br/view/historia.php
- capoeira.fandom.com/wiki/La_Capoeira_à_Rio_de_Janeiro_1910_-_1950
- seer.unirio.br/morpheus/article/view/4102
- capoeiracornwall.co.uk (ACER UK)
- econodata.com.br (registros CNPJ ACER)'
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
