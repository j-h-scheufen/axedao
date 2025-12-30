-- ============================================================
-- GENEALOGY PERSON: Bentevi
-- Migrated: 2025-12-11
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
  NULL,  -- Full name unknown
  'Bentevi',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  ARRAY[]::text[],  -- No dedicated web pages about this individual
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro. Named after the bem-te-vi bird (Pitangus sulphuratus), known for its aggressive territorial behavior.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro. Nomeado pelo pássaro bem-te-vi (Pitangus sulphuratus), conhecido por seu comportamento territorial agressivo.',
  -- Life dates
  1820,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed based on activity location
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- bio_en
  E'Bentevi - also written as "Bem-te-vi" - was one of the "perigosos capoeiras" (dangerous capoeiristas) of mid-19th century Rio de Janeiro. His name survives in two of the earliest written sources on capoeira: Plácido de Abreu''s 1886 work "Os Capoeiras" and Melo Morais Filho''s 1888 "Festas e Tradições Populares do Brasil".

Both sources list Bentevi among the most feared street fighters of the 1850s, alongside Mamede, Aleixo Açougueiro, Pedro Cobra, and Quebra Coco. According to these accounts, the legendary Manduca da Praia "attended the full-time school of roguery and bravery on the streets of Rio de Janeiro during the era of dangerous capoeiras such as Mamede, Aleixo Açougueiro, Pedro Cobra, Bem-te-vi, and Quebra Coco".

His apelido comes from the bem-te-vi bird (Pitangus sulphuratus), one of the most common and recognizable birds in Brazil. The name literally translates to "I saw you well" - mimicking the bird''s distinctive call. The bem-te-vi is known for its bold yellow breast and aggressive territorial behavior, fearlessly attacking much larger birds that enter its territory. Whether Bentevi earned this name for his bold appearance, his loud presence, or his fearless fighting style is unknown.

This was an era before berimbau and music defined the practice. Capoeira carioca was a street fighting system where practitioners excelled "in the use of the razor and dagger; in the handling of the Petrópolis - a long hardwood club, inseparable companion of the tough guys of the time - in the cunning of the sweep and trip; and with the punch, headbutt and rabo-de-arraia".

No individual exploits of Bentevi survive. We do not know if he belonged to the Nagoas or Guaiamums, the two great rival maltas that divided Rio de Janeiro. He exists now only as a name on a list of dangerous men in the earliest capoeira literature - but the bem-te-vi bird continues to sing throughout Brazil, carrying his memory in its name.',
  -- bio_pt
  E'Bentevi - também escrito como "Bem-te-vi" - foi um dos "perigosos capoeiras" do Rio de Janeiro em meados do século XIX. Seu nome sobrevive em duas das fontes escritas mais antigas sobre capoeira: a obra de 1886 de Plácido de Abreu "Os Capoeiras" e "Festas e Tradições Populares do Brasil" de 1888 de Melo Morais Filho.

Ambas as fontes listam Bentevi entre os mais temidos lutadores de rua da década de 1850, ao lado de Mamede, Aleixo Açougueiro, Pedro Cobra e Quebra Coco. Segundo estes relatos, o lendário Manduca da Praia "cursou a escola de horário integral da malandragem e da valentia das ruas do Rio de Janeiro na época de perigosos capoeiras como Mamede, Aleixo Açougueiro, Pedro Cobra, Bem-te-vi e Quebra Coco".

Seu apelido vem do pássaro bem-te-vi (Pitangus sulphuratus), uma das aves mais comuns e reconhecíveis do Brasil. O nome literalmente significa "eu te vi bem" - imitando o canto distintivo do pássaro. O bem-te-vi é conhecido por seu peito amarelo marcante e comportamento territorial agressivo, atacando corajosamente pássaros muito maiores que entram em seu território. Se Bentevi ganhou este nome por sua aparência ousada, sua presença barulhenta, ou seu estilo de luta destemido é desconhecido.

Esta era uma era antes que o berimbau e a música definissem a prática. A capoeira carioca era um sistema de luta de rua onde os praticantes se destacavam "no uso da navalha e do punhal; no manejo do Petrópolis - um comprido porrete de madeira-de-lei, companheiro inseparável dos valentões da época - na malícia da banda e da rasteira; e no soco, cabeçada e rabo-de-arraia".

Nenhuma façanha individual de Bentevi sobrevive. Não sabemos se ele pertencia aos Nagoas ou Guaiamuns, as duas grandes maltas rivais que dividiam o Rio de Janeiro. Ele existe agora apenas como um nome em uma lista de homens perigosos na literatura mais antiga sobre capoeira - mas o pássaro bem-te-vi continua a cantar por todo o Brasil, carregando sua memória em seu nome.',
  -- achievements_en
  'Recognized as one of the most dangerous capoeiristas of his era in Rio de Janeiro; Named in two earliest written sources on capoeira (Plácido de Abreu 1886, Melo Morais Filho 1888)',
  -- achievements_pt
  'Reconhecido como um dos mais perigosos capoeiristas de sua era no Rio de Janeiro; Nomeado nas duas fontes escritas mais antigas sobre capoeira (Plácido de Abreu 1886, Melo Morais Filho 1888)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1820, decade precision): Documented as a "perigoso capoeira" active around 1850 in Rio de Janeiro. If he was an established, feared capoeirista at that time, he was likely 25-40 years old, placing birth in the 1810s-1830s range. Using 1820 as midpoint.

NAME SPELLING: Appears as both "Bentevi" and "Bem-te-vi" in sources. Both spellings refer to the same person and the same bird.

APELIDO: Named after the bem-te-vi bird (Pitangus sulphuratus), known for aggressive territorial behavior and its distinctive "bem-te-vi" call meaning "I saw you well".

DEATH: Unknown. No records of his death or later life have been found.

SOURCES: Named in both Plácido de Abreu''s "Os Capoeiras" (1886) and Melo Morais Filho''s "Festas e Tradições Populares do Brasil" (1888). All modern sources trace back to these two primary documents.

AFFILIATION: Malta affiliation (Nagoa or Guaiamum) is unknown.

PENDING RELATIONSHIPS:
- associated_with Manduca da Praia (contemporaries in 1850s Rio) - EXISTS
- associated_with Mamede (contemporaries in 1850s Rio) - EXISTS
- associated_with Aleixo Açougueiro (contemporaries in 1850s Rio) - EXISTS
- associated_with Pedro Cobra (contemporaries in 1850s Rio) - EXISTS
- associated_with Quebra Coco (contemporaries in 1850s Rio)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1820, precisão de década): Documentado como um "perigoso capoeira" ativo por volta de 1850 no Rio de Janeiro. Se ele era um capoeirista estabelecido e temido naquela época, provavelmente tinha 25-40 anos, colocando o nascimento no intervalo de 1810-1830. Usando 1820 como ponto médio.

GRAFIA DO NOME: Aparece como "Bentevi" e "Bem-te-vi" nas fontes. Ambas as grafias referem-se à mesma pessoa e ao mesmo pássaro.

APELIDO: Nomeado em homenagem ao pássaro bem-te-vi (Pitangus sulphuratus), conhecido pelo comportamento territorial agressivo e seu canto distintivo "bem-te-vi" significando "eu te vi bem".

MORTE: Desconhecida. Nenhum registro de sua morte ou vida posterior foi encontrado.

FONTES: Nomeado em ambos "Os Capoeiras" de Plácido de Abreu (1886) e "Festas e Tradições Populares do Brasil" de Melo Morais Filho (1888). Todas as fontes modernas remontam a estes dois documentos primários.

AFILIAÇÃO: Afiliação à malta (Nagoa ou Guaiamum) é desconhecida.

RELACIONAMENTOS PENDENTES:
- associated_with Manduca da Praia (contemporâneos no Rio dos anos 1850) - EXISTE
- associated_with Mamede (contemporâneos no Rio dos anos 1850) - EXISTE
- associated_with Aleixo Açougueiro (contemporâneos no Rio dos anos 1850) - EXISTE
- associated_with Pedro Cobra (contemporâneos no Rio dos anos 1850) - EXISTE
- associated_with Quebra Coco (contemporâneos no Rio dos anos 1850)'
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
