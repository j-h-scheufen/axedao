-- ============================================================
-- GENEALOGY PERSON: Valter Pepe
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1949 (decade precision)
-- Born approximately same year as brother Celso Pepe (1949).
-- Celso was born 1949 and describes Walter Hugo as "his brother"
-- who trained alongside him. The three boys (Hugo, Pelé, Celso)
-- practiced together behind the IAPC building and were Leopoldina's
-- first students together. Likely same age as Celso or slightly
-- older (Celso refers to him as older brother in some sources).
--
-- BIRTH PLACE: Rio de Janeiro, Brazil
-- The Pepe family lived at IAPC housing estate in Olaria district.
--
-- STYLE: Mixed - Trained under both Leopoldina (Angola/São Bento
-- Pequeno) and observed Djalma Bandeira (São Bento Grande), same
-- as brother Celso.
--
-- LINEAGE: Prata Preta → Campanhão → Quinzinho → Leopoldina → Valter Pepe
--
-- SIGNIFICANCE: One of Leopoldina's first three students (alongside
-- Celso Pepe and Pelé); photographed at Almir Ribeiro Academy 1962;
-- visited Leopoldina in early 2000s confirming ongoing relationship;
-- became mestre.
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
  'Walter Hugo Pepe',
  'Valter Pepe',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-celso-pepe-1949/'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Valter Pepe trained under the same dual-lineage as his brother Celso, learning from both Leopoldina and Djalma Bandeira. From Leopoldina, he absorbed the Angola game and São Bento Pequeno - the low, cunning style rooted in Rio''s malandro tradition. By observing Djalma Bandeira''s classes and rodas at the IAPC, he also learned the São Bento Grande game - an upright, objective style from the Artur Emídio lineage. This blend of styles was characteristic of the "Cariocan capoeira" developed in Rio during this era.',
  E'Valter Pepe treinou sob a mesma dupla linhagem que seu irmão Celso, aprendendo tanto com Leopoldina quanto com Djalma Bandeira. De Leopoldina, absorveu o jogo de Angola e São Bento Pequeno - o estilo baixo e manhoso enraizado na tradição malandra do Rio. Ao observar as aulas e rodas de Djalma Bandeira no IAPC, também aprendeu o jogo de São Bento Grande - um estilo ereto e objetivo da linhagem de Artur Emídio. Essa mistura de estilos era característica da "capoeira carioca" desenvolvida no Rio durante essa época.',
  -- Life dates
  1949,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,  -- No death year confirmed; was alive in early 2000s
  NULL,
  NULL,
  -- Extended content (English)
  E'Walter Hugo Pepe, known as Mestre Valter Pepe, was among the first students of Mestre Leopoldina in Rio de Janeiro. He was the brother of Mestre Celso Pepe, and together with their childhood friend Luiz Garcia Filho (nicknamed Pelé), these three boys formed the nucleus of Leopoldina''s earliest students.

The Pepe brothers grew up in a housing estate called IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) in the Olaria district of Rio de Janeiro. Their father, Hugo Pepe, had served as a soldier in the Brazilian Armed Forces during World War II, participating in the Battle of Monte Castelo in Italy.

In 1957, Celso Pepe discovered capoeira by observing classes taught by Djalma Bandeira at the IAPC Community Centre. When young Celso asked to participate, Djalma refused, saying he was too young. Undeterred, Celso joined forces with his brother Walter Hugo and their friend Pelé. The three boys practiced capoeira movements on their own behind a building at the IAPC for several months, trying to imitate all the movements they saw in Djalma''s classes.

At the same time, the brothers enrolled at the Academia Guanabara, where they practiced judo, jiu-jitsu, and freestyle fighting. One day, a thin black man arrived at the academy, and the teacher Vinagre announced: "This guy is a capoeirista." It was Leopoldina, then only 23 years old and recently trained by Artur Emídio. Celso insisted so persistently that he wanted capoeira classes that Leopoldina eventually agreed to give the boys training on a Sunday, under an almond tree in the pátio of the Guanabara Academy. According to Celso, those three boys - Hugo, Pelé, and himself - were the first students of Leopoldina.

A 1962 photograph documents Mestres Celso and Valter Pepe at the Almir Ribeiro Academy in Tijuca, Rio de Janeiro. In this image, Valter Pepe is shown performing a "Queda de Rins" (a fundamental capoeira movement where the practitioner balances on the arms with knees resting on elbows), while Celso is visible as the second berimbau player, with the instrument supported vertically on the ground.

The relationship between the Pepe brothers and their teacher Leopoldina endured for decades. In the early 2000s, Leopoldina received Valter and Celso Pepe at his home in Cidade de Deus, Rio de Janeiro, demonstrating the lasting bonds forged through capoeira.

Valter Pepe achieved the title of mestre, carrying forward the lineage of Leopoldina that traces back through Quinzinho, Campanhão, and Prata Preta to the nineteenth-century street capoeira of Rio de Janeiro.',
  -- Extended content (Portuguese)
  E'Walter Hugo Pepe, conhecido como Mestre Valter Pepe, estava entre os primeiros alunos de Mestre Leopoldina no Rio de Janeiro. Era irmão de Mestre Celso Pepe, e junto com seu amigo de infância Luiz Garcia Filho (apelidado de Pelé), esses três meninos formaram o núcleo dos primeiros alunos de Leopoldina.

Os irmãos Pepe cresceram em um conjunto habitacional chamado IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) no bairro de Olaria, no Rio de Janeiro. Seu pai, Hugo Pepe, havia servido como soldado nas Forças Armadas Brasileiras durante a Segunda Guerra Mundial, participando da Batalha de Monte Castelo na Itália.

Em 1957, Celso Pepe descobriu a capoeira observando as aulas ministradas por Djalma Bandeira no Centro Comunitário do IAPC. Quando o jovem Celso pediu para participar, Djalma recusou, dizendo que ele era muito jovem. Sem desistir, Celso juntou forças com seu irmão Walter Hugo e o amigo Pelé. Os três meninos praticavam movimentos de capoeira sozinhos atrás de um prédio do IAPC por vários meses, tentando imitar todos os movimentos que viam nas aulas de Djalma.

Ao mesmo tempo, os irmãos se matricularam na Academia Guanabara, onde praticavam judô, jiu-jitsu e luta livre. Um dia, um homem negro magro chegou à academia, e o professor Vinagre anunciou: "Esse cara é um capoeirista." Era Leopoldina, então com apenas 23 anos e recém-treinado por Artur Emídio. Celso insistiu tão persistentemente que queria aulas de capoeira que Leopoldina eventualmente concordou em dar treinamento aos meninos num domingo, debaixo de uma amendoeira no pátio da Academia Guanabara. Segundo Celso, aqueles três meninos - Hugo, Pelé e ele próprio - foram os primeiros alunos de Leopoldina.

Uma fotografia de 1962 documenta os Mestres Celso e Valter Pepe na Academia Almir Ribeiro na Tijuca, Rio de Janeiro. Nesta imagem, Valter Pepe aparece fazendo uma "Queda de Rins" (um movimento fundamental da capoeira onde o praticante se equilibra nos braços com os joelhos apoiados nos cotovelos), enquanto Celso é visível como o segundo berimbau, com o instrumento apoiado verticalmente no chão.

A relação entre os irmãos Pepe e seu mestre Leopoldina perdurou por décadas. No início dos anos 2000, Leopoldina recebeu Valter e Celso Pepe em sua casa em Cidade de Deus, Rio de Janeiro, demonstrando os laços duradouros forjados através da capoeira.

Valter Pepe alcançou o título de mestre, levando adiante a linhagem de Leopoldina que remonta através de Quinzinho, Campanhão e Prata Preta à capoeira de rua do século XIX no Rio de Janeiro.',
  -- Achievements (English)
  E'- One of Leopoldina''s first three students (with Celso Pepe and Pelé) at Academia Guanabara (~1957)
- Photographed at Almir Ribeiro Academy, Tijuca (1962)
- Achieved title of Mestre
- Part of the pioneering generation that developed contemporary capoeira in Rio de Janeiro
- Maintained lifelong relationship with Mestre Leopoldina',
  -- Achievements (Portuguese)
  E'- Um dos primeiros três alunos de Leopoldina (com Celso Pepe e Pelé) na Academia Guanabara (~1957)
- Fotografado na Academia Almir Ribeiro, Tijuca (1962)
- Alcançou título de Mestre
- Parte da geração pioneira que desenvolveu a capoeira contemporânea no Rio de Janeiro
- Manteve relacionamento vitalício com Mestre Leopoldina',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1949, decade):
Born approximately same year as brother Celso Pepe (1949). Celso describes Walter Hugo as "his brother" who trained alongside him from ~1957 when Celso was 8 years old. Likely same age or slightly older than Celso. Using decade precision as no exact birth date found.

NAME DISCREPANCY:
- "Walter Hugo Pepe" - full name per capoeirahistory.com
- "Valter Pepe" - apelido used in capoeira context
- "Hugo" - abbreviated name used by brother Celso when describing first students of Leopoldina
Using "Valter Pepe" as apelido following established convention.

TEACHERS:
- Mestre Leopoldina (primary teacher, formal classes at Academia Guanabara from ~1957)
- Mestre Djalma Bandeira (observed classes/rodas at IAPC from 1957)

TRAINING COMPANIONS:
- Celso Pepe (brother)
- Luiz Garcia Filho "Pelé" (childhood friend)

MEDIA APPEARANCES:
- 1962: Photo at Almir Ribeiro Academy, Tijuca - performing Queda de Rins alongside Celso Pepe
- Early 2000s: Photo visiting Leopoldina at Cidade de Deus with Celso

FAMILY:
- Father: Hugo Pepe (WWII veteran, Battle of Monte Castelo)
- Brother: Celso Pepe (Mestre, founder of Grupo Capoeira Cativeiro)

LINEAGE (through Leopoldina):
Prata Preta (b. 1868) → Campanhão (b. ~1900) → Quinzinho (b. ~1927) → Leopoldina (1933-2007) → Valter Pepe (b. ~1949)

DEATH STATUS:
No death year confirmed. Was alive in early 2000s when photographed visiting Leopoldina. Current status unknown.

NAMING CONTEXT:
Like his brother Celso, Valter uses his family surname "Pepe" as part of his apelido. This is unusual as most capoeiristas use descriptive apelidos rather than surnames.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-celso-pepe-1949/ (primary - information derived from brother''s profile)
- velhosmestres.com (no direct profile found)
- nossa-tribo.com (Mestre Touro lineage information)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1949, década):
Nascido aproximadamente no mesmo ano que o irmão Celso Pepe (1949). Celso descreve Walter Hugo como "seu irmão" que treinou ao seu lado desde ~1957, quando Celso tinha 8 anos. Provavelmente da mesma idade ou ligeiramente mais velho que Celso. Usando precisão de década pois não foi encontrada data de nascimento exata.

DISCREPÂNCIA DE NOME:
- "Walter Hugo Pepe" - nome completo conforme capoeirahistory.com
- "Valter Pepe" - apelido usado no contexto da capoeira
- "Hugo" - nome abreviado usado pelo irmão Celso ao descrever os primeiros alunos de Leopoldina
Usando "Valter Pepe" como apelido seguindo a convenção estabelecida.

MESTRES:
- Mestre Leopoldina (mestre principal, aulas formais na Academia Guanabara desde ~1957)
- Mestre Djalma Bandeira (observou aulas/rodas no IAPC desde 1957)

COMPANHEIROS DE TREINO:
- Celso Pepe (irmão)
- Luiz Garcia Filho "Pelé" (amigo de infância)

APARIÇÕES NA MÍDIA:
- 1962: Foto na Academia Almir Ribeiro, Tijuca - fazendo Queda de Rins ao lado de Celso Pepe
- Início dos anos 2000: Foto visitando Leopoldina em Cidade de Deus com Celso

FAMÍLIA:
- Pai: Hugo Pepe (veterano da 2ª Guerra Mundial, Batalha de Monte Castelo)
- Irmão: Celso Pepe (Mestre, fundador do Grupo Capoeira Cativeiro)

LINHAGEM (através de Leopoldina):
Prata Preta (n. 1868) → Campanhão (n. ~1900) → Quinzinho (n. ~1927) → Leopoldina (1933-2007) → Valter Pepe (n. ~1949)

STATUS DE FALECIMENTO:
Nenhum ano de falecimento confirmado. Estava vivo no início dos anos 2000 quando fotografado visitando Leopoldina. Status atual desconhecido.

CONTEXTO DO NOME:
Como seu irmão Celso, Valter usa seu sobrenome de família "Pepe" como parte de seu apelido. Isso é incomum, pois a maioria dos capoeiristas usa apelidos descritivos em vez de sobrenomes.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-celso-pepe-1949/ (primária - informação derivada do perfil do irmão)
- velhosmestres.com (nenhum perfil direto encontrado)
- nossa-tribo.com (informação de linhagem de Mestre Touro)'
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
