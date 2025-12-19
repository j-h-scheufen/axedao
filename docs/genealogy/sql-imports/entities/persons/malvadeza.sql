-- ============================================================
-- GENEALOGY PERSON: Malvadeza (José Martins dos Santos)
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1900, year):
-- Photographed at approximately 100 years old in 2000 at Feira de
-- São Joaquim with his son Mestre Curió. Using 1900 with "year"
-- precision since the photo documentation provides reasonable
-- confidence in the approximate birth year.
--
-- DEATH YEAR ESTIMATION (~2000s, decade):
-- A mass in his memory is held at ECAIG annual events, indicating
-- he is deceased. If he lived to 100+ (photographed in 2000), death
-- likely occurred in early 2000s. Using decade precision.
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
  'José Martins dos Santos',
  'Malvadeza',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1900,
  'year'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  2000,
  'decade'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'José Martins dos Santos, known as Malvadeza or Martim da Pemba, was a capoeirista and violeiro (seven-string guitar player) from Santo Amaro, Bahia. He was the father of Mestre Curió, one of Capoeira Angola''s most celebrated guardians, and the link between the old capoeira tradition of his father Pedro Virício and the modern era of the art.

José Martins was born around 1900 in Santo Amaro da Purificação, in the Recôncavo Baiano—a region renowned for producing legendary capoeiristas including Besouro Mangangá, who was his segundo primo (second cousin). He learned capoeira from his father Pedro Virício, known as "Curió Grande," continuing a family tradition that may have stretched back even further.

In addition to his skill in capoeira, José Martins was a talented musician. He was a close friend of Mestre Pastinha—the father of Capoeira Angola—and served as his violeiro, accompanying Pastinha musically. This connection to Pastinha would later influence his son''s path, as Mestre Curió would eventually become one of Pastinha''s most faithful disciples.

José Martins married Maria Bispo, known as "Pequena," who was also a capoeirista from a family of angoleiros in Santo Amaro. Together they had a son, Jaime Martins dos Santos, born January 23, 1937, in Candeias. Maria gave birth to Jaime during a roda de capoeira—a detail that speaks to how deeply capoeira was woven into this family''s life.

Beginning in 1943, when young Jaime was six years old, José Martins and his father Pedro Virício began teaching the boy capoeira. This dual-generational transmission—from grandfather and father simultaneously—immersed Jaime in the traditional methods and philosophy of Capoeira Angola. By 1951, at only fourteen, Jaime had already begun teaching capoeira himself.

José Martins lived to be approximately one hundred years old. In 2000, he was photographed with his son Mestre Curió at Feira de São Joaquim in Salvador—a remarkable image of father and son, both capoeiristas, representing nearly a century of continuous tradition.

After his death in the early 2000s, José Martins dos Santos is remembered annually at ECAIG (Escola de Capoeira Angola Irmãos Gêmeos), where a mass is held in his memory alongside Mestre Pastinha during the school''s annual Encontro Internacional de Capoeira Angola.',
  -- bio_pt
  E'José Martins dos Santos, conhecido como Malvadeza ou Martim da Pemba, foi um capoeirista e violeiro de Santo Amaro, Bahia. Ele foi o pai de Mestre Curió, um dos mais celebrados guardiões da Capoeira Angola, e o elo entre a antiga tradição de capoeira de seu pai Pedro Virício e a era moderna da arte.

José Martins nasceu por volta de 1900 em Santo Amaro da Purificação, no Recôncavo Baiano—uma região conhecida por produzir capoeiristas lendários incluindo Besouro Mangangá, que era seu primo segundo. Ele aprendeu capoeira com seu pai Pedro Virício, conhecido como "Curió Grande," continuando uma tradição familiar que pode ter se estendido ainda mais para trás.

Além de sua habilidade na capoeira, José Martins era um músico talentoso. Ele era amigo próximo de Mestre Pastinha—o pai da Capoeira Angola—e servia como seu violeiro, acompanhando Pastinha musicalmente. Esta conexão com Pastinha influenciaria mais tarde o caminho de seu filho, pois Mestre Curió eventualmente se tornaria um dos discípulos mais fiéis de Pastinha.

José Martins casou-se com Maria Bispo, conhecida como "Pequena," que também era capoeirista de uma família de angoleiros em Santo Amaro. Juntos tiveram um filho, Jaime Martins dos Santos, nascido em 23 de janeiro de 1937, em Candeias. Maria deu à luz Jaime durante uma roda de capoeira—um detalhe que fala de quão profundamente a capoeira estava entrelaçada na vida desta família.

A partir de 1943, quando o jovem Jaime tinha seis anos, José Martins e seu pai Pedro Virício começaram a ensinar capoeira ao menino. Esta transmissão de duas gerações—de avô e pai simultaneamente—imergiu Jaime nos métodos tradicionais e filosofia da Capoeira Angola. Em 1951, com apenas catorze anos, Jaime já havia começado a ensinar capoeira.

José Martins viveu até aproximadamente cem anos. Em 2000, ele foi fotografado com seu filho Mestre Curió na Feira de São Joaquim em Salvador—uma imagem notável de pai e filho, ambos capoeiristas, representando quase um século de tradição contínua.

Após sua morte no início dos anos 2000, José Martins dos Santos é lembrado anualmente na ECAIG (Escola de Capoeira Angola Irmãos Gêmeos), onde uma missa é celebrada em sua memória junto com Mestre Pastinha durante o Encontro Internacional de Capoeira Angola anual da escola.',
  -- achievements_en
  E'Transmitted capoeira tradition from father Pedro Virício to son Mestre Curió; Close friend and violeiro of Mestre Pastinha; Lived to approximately 100 years old; Maintained family capoeira tradition through prohibition era',
  -- achievements_pt
  E'Transmitiu tradição de capoeira do pai Pedro Virício para filho Mestre Curió; Amigo próximo e violeiro de Mestre Pastinha; Viveu até aproximadamente 100 anos; Manteve tradição familiar de capoeira durante era de proibição',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1900, year):
Photographed at ~100 years old in 2000 at Feira de São Joaquim with Mestre Curió. Using 1900 with year precision based on photo documentation.

DEATH YEAR ESTIMATION (2000, decade):
A mass in his memory is held at ECAIG annual events, confirming he is deceased. If photographed at 100 in 2000, death likely occurred in early 2000s. Using decade precision.

NAME VARIATIONS:
- "José Martins dos Santos" - full legal name
- "Malvadeza" - primary apelido
- "Martim da Pemba" - alternate apelido
- "Pena Dourada" - mentioned in one source (capoeducarte)
- "Zé Martins" - familiar form
- "Mestre Zé Martins" - used in photo caption on velhosmestres.com

OCCUPATION: lavrador (farmer)

BESOURO CONNECTION:
Mestre Curió states: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro (capoeirista que inspirou o filme ''Besouro''), que era primo segundo do meu pai."
This confirms Besouro Mangangá was José Martins'' second cousin.

MUSICAL ABILITY:
Violeiro (seven-string guitar player); close friend of Mestre Pastinha and accompanied him musically.

FAMILY:
- Father: Pedro Virício (Curió Velho) - capoeirista
- Wife: Maria Bispo (Pequena) - capoeirista
- Son: Jaime Martins dos Santos (Mestre Curió, b. 1937)
- Second cousin: Besouro Mangangá

MEDIA APPEARANCES:
- 2000: Photographed at ~100 years old with Mestre Curió at Feira de São Joaquim (velhosmestres.com photo)

TEACHERS:
- Pedro Virício (father)

STUDENTS:
- Jaime Martins dos Santos (son, Mestre Curió, from 1943)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1900, ano):
Fotografado com ~100 anos em 2000 na Feira de São Joaquim com Mestre Curió. Usando 1900 com precisão de ano baseado na documentação fotográfica.

ESTIMATIVA ANO DE FALECIMENTO (2000, década):
Uma missa em sua memória é celebrada nos eventos anuais da ECAIG, confirmando que faleceu. Se fotografado aos 100 em 2000, falecimento provavelmente ocorreu no início dos anos 2000. Usando precisão de década.

VARIAÇÕES DE NOME:
- "José Martins dos Santos" - nome legal completo
- "Malvadeza" - apelido principal
- "Martim da Pemba" - apelido alternativo
- "Pena Dourada" - mencionado em uma fonte (capoeducarte)
- "Zé Martins" - forma familiar
- "Mestre Zé Martins" - usado em legenda de foto no velhosmestres.com

PROFISSÃO: lavrador

CONEXÃO COM BESOURO:
Mestre Curió afirma: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro (capoeirista que inspirou o filme ''Besouro''), que era primo segundo do meu pai."
Isso confirma que Besouro Mangangá era primo segundo de José Martins.

HABILIDADE MUSICAL:
Violeiro; amigo próximo de Mestre Pastinha e o acompanhava musicalmente.

FAMÍLIA:
- Pai: Pedro Virício (Curió Velho) - capoeirista
- Esposa: Maria Bispo (Pequena) - capoeirista
- Filho: Jaime Martins dos Santos (Mestre Curió, n. 1937)
- Primo segundo: Besouro Mangangá

APARIÇÕES NA MÍDIA:
- 2000: Fotografado com ~100 anos com Mestre Curió na Feira de São Joaquim (foto velhosmestres.com)

MESTRES:
- Pedro Virício (pai)

ALUNOS:
- Jaime Martins dos Santos (filho, Mestre Curió, a partir de 1943)'
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
