-- ============================================================
-- GENEALOGY PERSON: Curió Velho (Pedro Virício)
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1870s, decade):
-- José Martins dos Santos (his son) was photographed at ~100 years old
-- in 2000, suggesting José was born ~1900. Pedro Virício as his father
-- would have been born one generation earlier (~1870-1880). Pedro was
-- still alive and actively teaching capoeira to young Curió in 1943,
-- when he would have been ~65-73 years old if born in the 1870s.
-- Using 1875 as midpoint estimate with decade precision.
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
  'Pedro Virício',
  'Curió Velho',
  'grandfather of Mestre Curió',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1875,
  'decade'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Pedro Virício, known as Curió or "Curió Grande" (Big Curió), was one of the great angoleiros of Santo Amaro and Salvador in the late 19th and early 20th centuries. He is the patriarch of a four-generation capoeira lineage that produced one of Capoeira Angola''s most celebrated guardians: his grandson Mestre Curió.

Pedro Virício earned the apelido "Curió" (a Brazilian songbird known for its melodious voice and fighting spirit) through his prowess in capoeira. The nickname would later pass to his grandson Jaime Martins dos Santos, who inherited not only the name but the distinctive style—locals would say "It''s the same game as grandfather!" when watching young Jaime play.

Santo Amaro da Purificação, in the Recôncavo Baiano, was fertile ground for capoeira in Pedro Virício''s time. The region produced legendary practitioners including Besouro Mangangá, and the art flourished in the dock areas, church festivals, and rural communities. According to family accounts, Pedro Virício was connected to this tradition, with some sources suggesting he may have been related to an earlier "Besouro de Santo Amaro"—distinct from the famous Besouro Mangangá.

Pedro Virício married and had a son, José Martins dos Santos (later known as Malvadeza), whom he trained in capoeira. Together, Pedro and José would transmit the family tradition to the next generation. Beginning in 1943, when his grandson Jaime was only six years old, Pedro Virício took an active role in teaching the boy capoeira alongside José. Despite his advanced age—likely in his late 60s or early 70s—Pedro remained capable of transmitting the physical and philosophical foundations of Capoeira Angola.

Mestre Curió speaks of his grandfather with reverence, describing him as "um dos grandes angoleiros da cidade de Salvador" (one of the great angoleiros of the city of Salvador). The family''s deep roots in capoeira—extending at least to Pedro Virício and possibly to his own father—allowed Curió to declare himself "filho de angoleiro, neto de angoleiro, bisneto de angoleiro" (son, grandson, and great-grandson of capoeira practitioners).

Pedro Virício represents the generation of capoeiristas who practiced during the period of prohibition (1890-1937), when the art was criminalized in Brazil. That he maintained and transmitted the tradition despite legal persecution speaks to his dedication to preserving this cultural heritage.',
  -- bio_pt
  E'Pedro Virício, conhecido como Curió ou "Curió Grande", foi um dos grandes angoleiros de Santo Amaro e Salvador no final do século XIX e início do século XX. Ele é o patriarca de uma linhagem de capoeira de quatro gerações que produziu um dos mais celebrados guardiões da Capoeira Angola: seu neto Mestre Curió.

Pedro Virício ganhou o apelido "Curió" (um pássaro brasileiro conhecido por sua voz melodiosa e espírito combativo) através de sua habilidade na capoeira. O apelido passaria depois para seu neto Jaime Martins dos Santos, que herdou não apenas o nome mas o estilo distintivo—os locais diziam "É o mesmo jogo do avô!" ao ver o jovem Jaime jogar.

Santo Amaro da Purificação, no Recôncavo Baiano, era terreno fértil para a capoeira no tempo de Pedro Virício. A região produziu praticantes lendários incluindo Besouro Mangangá, e a arte floresceu nas áreas portuárias, festas de igreja e comunidades rurais. Segundo relatos familiares, Pedro Virício estava conectado a esta tradição, com algumas fontes sugerindo que ele pode ter sido parente de um "Besouro de Santo Amaro" anterior—distinto do famoso Besouro Mangangá.

Pedro Virício casou-se e teve um filho, José Martins dos Santos (mais tarde conhecido como Malvadeza), a quem treinou na capoeira. Juntos, Pedro e José transmitiriam a tradição familiar para a próxima geração. A partir de 1943, quando seu neto Jaime tinha apenas seis anos, Pedro Virício assumiu papel ativo no ensino de capoeira ao menino junto com José. Apesar de sua idade avançada—provavelmente na casa dos 60 ou 70 anos—Pedro permanecia capaz de transmitir os fundamentos físicos e filosóficos da Capoeira Angola.

Mestre Curió fala de seu avô com reverência, descrevendo-o como "um dos grandes angoleiros da cidade de Salvador". As raízes profundas da família na capoeira—estendendo-se pelo menos até Pedro Virício e possivelmente até seu próprio pai—permitiram a Curió declarar-se "filho de angoleiro, neto de angoleiro, bisneto de angoleiro".

Pedro Virício representa a geração de capoeiristas que praticaram durante o período de proibição (1890-1937), quando a arte era criminalizada no Brasil. Que ele tenha mantido e transmitido a tradição apesar da perseguição legal fala de sua dedicação em preservar este patrimônio cultural.',
  -- achievements_en
  E'Patriarch of multi-generational capoeira family; Transmitted apelido "Curió" and Angola tradition to grandson Mestre Curió; One of the great angoleiros of Santo Amaro/Salvador; Maintained capoeira practice through prohibition era (1890-1937)',
  -- achievements_pt
  E'Patriarca de família de capoeira multi-geracional; Transmitiu apelido "Curió" e tradição Angola para neto Mestre Curió; Um dos grandes angoleiros de Santo Amaro/Salvador; Manteve prática de capoeira durante era de proibição (1890-1937)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1875, decade):
José Martins dos Santos photographed at ~100 years old in 2000 → born ~1900. Pedro Virício as his father would have been born one generation earlier (~1870-1880). Still actively teaching capoeira in 1943, which is plausible for late 60s/early 70s age. Using 1875 as midpoint estimate.

NAME VARIATIONS:
- "Pedro Virício" - most common spelling
- "Pedro Vinícius Curió" - variant in tribunademinas.com article
- "Curió" - primary apelido
- "Curió Grande" - to distinguish from grandson
- "Curió Velho" - to distinguish from grandson
- "Curió de Santo Amaro" - regional designation

Using apelido "Curió Velho" with context "grandfather of Mestre Curió" to distinguish from his famous grandson.

FAMILY:
- Son: José Martins dos Santos (Malvadeza)
- Grandson: Jaime Martins dos Santos (Mestre Curió, b. 1937)
- Daughter-in-law: Maria Bispo (Pequena)

BESOURO CONNECTION DISCREPANCY:
Multiple versions exist regarding the family''s connection to Besouro:
1. Besouro Mangangá was "primo segundo" (second cousin) of José Martins dos Santos
2. An earlier "Besouro de Santo Amaro" (not Mangangá) was Pedro Virício''s father
3. Some sources conflate these, calling Besouro Mangangá "bisavô" of Curió

The most reliable version appears to be that Besouro Mangangá was a second cousin of José Martins, while there may have been an earlier Besouro in direct ancestry. This needs further investigation.

TEACHERS:
- Unknown; possibly learned from his father (potentially connected to earlier Besouro de Santo Amaro)

STUDENTS:
- José Martins dos Santos (son, Malvadeza)
- Jaime Martins dos Santos (grandson, Mestre Curió, from 1943)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1875, década):
José Martins dos Santos fotografado com ~100 anos em 2000 → nascido ~1900. Pedro Virício como seu pai teria nascido uma geração antes (~1870-1880). Ainda ensinando capoeira ativamente em 1943, o que é plausível para idade de final dos 60/início dos 70. Usando 1875 como estimativa média.

VARIAÇÕES DE NOME:
- "Pedro Virício" - grafia mais comum
- "Pedro Vinícius Curió" - variante em artigo tribunademinas.com
- "Curió" - apelido principal
- "Curió Grande" - para distinguir do neto
- "Curió Velho" - para distinguir do neto
- "Curió de Santo Amaro" - designação regional

Usando apelido "Curió Velho" com contexto "avô de Mestre Curió" para distinguir de seu famoso neto.

FAMÍLIA:
- Filho: José Martins dos Santos (Malvadeza)
- Neto: Jaime Martins dos Santos (Mestre Curió, n. 1937)
- Nora: Maria Bispo (Pequena)

DISCREPÂNCIA CONEXÃO COM BESOURO:
Existem múltiplas versões sobre a conexão da família com Besouro:
1. Besouro Mangangá era "primo segundo" de José Martins dos Santos
2. Um "Besouro de Santo Amaro" anterior (não Mangangá) era pai de Pedro Virício
3. Algumas fontes confundem estes, chamando Besouro Mangangá de "bisavô" de Curió

A versão mais confiável parece ser que Besouro Mangangá era primo segundo de José Martins, enquanto pode ter havido um Besouro anterior na ancestralidade direta. Isso precisa de investigação adicional.

MESTRES:
- Desconhecido; possivelmente aprendeu com seu pai (potencialmente conectado ao Besouro de Santo Amaro anterior)

ALUNOS:
- José Martins dos Santos (filho, Malvadeza)
- Jaime Martins dos Santos (neto, Mestre Curió, a partir de 1943)'
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
