-- ============================================================
-- GENEALOGY PERSON: Leão do Norte
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
  NULL, -- Full name unknown
  'Leão do Norte',
  NULL, -- No formal title; proto-mestre era
  NULL, -- No portrait available
  ARRAY['https://capoeirahistory.com/black-shirt/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era
  'Pre-codification carioca capoeira. Described as "um capoeira valente das ruas" (a tough/brave capoeira from the streets). Part of the generation of Rio de Janeiro street capoeiristas who practiced despite criminalization in 1890.',
  'Capoeira carioca pré-codificação. Descrito como "um capoeira valente das ruas." Parte da geração de capoeiristas de rua do Rio de Janeiro que praticavam apesar da criminalização de 1890.',
  -- Life dates
  1875,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown; nickname suggests connection to northern Brazil
  1911,
  'year'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Leão do Norte ("Lion of the North") was a capoeirista and malandro active in Rio de Janeiro in the early twentieth century. His nickname suggests he may have originated from the northern regions of Brazil—perhaps Pernambuco, Bahia, or another state that sent migrants to Rio during this era—though this remains unconfirmed.

What we know of Leão do Norte comes primarily from newspaper accounts of his death and its aftermath. He was described as "um capoeira valente das ruas" (a tough capoeira from the streets) and was a great friend of Miguel Camisa Preta, one of the most famous malandros of the era.

Around 1911, Leão do Norte was killed by Cabo Elpídio Ribeiro da Rocha, a police officer of the Brigada Militar. The circumstances of his death are not documented in available sources, but his killing sparked a blood feud. Miguel Camisa Preta swore vengeance for his friend''s death.

The rivalry between Miguel and Elpídio "began a year before" Miguel''s own death in 1912, directly tied to Leão do Norte''s killing. Miguel confronted the police officer at least twice before their final encounter. In one confrontation, Miguel was shot in the leg and both men ended up at the police station. Miguel recovered but disappeared from public view for about a year.

On July 12, 1912, the vendetta reached its conclusion—but not as Miguel had hoped. Elpídio, accompanied by another officer, shot Miguel dead at Rua Núncio in downtown Rio. Leão do Norte''s death had set in motion a cycle of violence that claimed his avenger as well.

Little else is known about Leão do Norte. His apelido (nickname) lived on in newspaper accounts as the spark that ignited the fatal rivalry between Miguel Camisa Preta and Elpídio Ribeiro da Rocha. He represents the countless unnamed capoeiristas of the First Republic era whose lives and deaths went largely unrecorded, known to us only through the shadows they cast on the more documented figures around them.',
  -- bio_pt
  E'Leão do Norte era um capoeirista e malandro ativo no Rio de Janeiro no início do século XX. Seu apelido sugere que ele pode ter se originado das regiões do norte do Brasil—talvez Pernambuco, Bahia ou outro estado que enviava migrantes ao Rio durante essa época—embora isso permaneça não confirmado.

O que sabemos de Leão do Norte vem principalmente de relatos de jornais sobre sua morte e suas consequências. Ele foi descrito como "um capoeira valente das ruas" e era grande amigo de Miguel Camisa Preta, um dos malandros mais famosos da época.

Por volta de 1911, Leão do Norte foi morto pelo Cabo Elpídio Ribeiro da Rocha, um policial da Brigada Militar. As circunstâncias de sua morte não estão documentadas nas fontes disponíveis, mas sua morte desencadeou uma rixa de sangue. Miguel Camisa Preta jurou vingança pela morte de seu amigo.

A rivalidade entre Miguel e Elpídio "começara um ano antes" da própria morte de Miguel em 1912, diretamente ligada à morte de Leão do Norte. Miguel confrontou o policial pelo menos duas vezes antes do encontro final. Em um confronto, Miguel foi baleado na perna e ambos foram parar na delegacia. Miguel se recuperou, mas desapareceu da vista do público por cerca de um ano.

Em 12 de julho de 1912, a vendeta chegou à sua conclusão—mas não como Miguel esperava. Elpídio, acompanhado de outro policial, matou Miguel a tiros na Rua Núncio no centro do Rio. A morte de Leão do Norte havia colocado em movimento um ciclo de violência que também reivindicou seu vingador.

Pouco mais se sabe sobre Leão do Norte. Seu apelido viveu nos relatos de jornais como a faísca que acendeu a rivalidade fatal entre Miguel Camisa Preta e Elpídio Ribeiro da Rocha. Ele representa os incontáveis capoeiristas sem nome da era da Primeira República, cujas vidas e mortes permaneceram em grande parte não registradas, conhecidos por nós apenas através das sombras que projetaram sobre as figuras mais documentadas ao seu redor.',
  -- achievements_en
  'Known as a "tough capoeira from the streets" in early 20th century Rio de Janeiro; his death at the hands of police officer Elpídio sparked a blood feud that led to the death of Miguel Camisa Preta',
  -- achievements_pt
  'Conhecido como "um capoeira valente das ruas" no Rio de Janeiro do início do século XX; sua morte nas mãos do policial Elpídio desencadeou uma rixa de sangue que levou à morte de Miguel Camisa Preta',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1875, decade precision): Described as "um capoeira valente das ruas" (tough capoeira from the streets) at time of death (~1911). If he was an established street capoeirista and "great friend" of Miguel Camisa Preta (who was active 1902-1912), likely 30-40 years old when killed. Birth = ~1871-1881. Using 1875 as midpoint.

DEATH: ~1911 (year precision). Killed by Cabo Elpídio Ribeiro da Rocha of the Brigada Militar. Source states the rivalry between Miguel and Elpídio "began a year before" Miguel''s death on July 12, 1912, directly linked to Elpídio killing Leão do Norte.

NAME: Full name unknown. "Leão do Norte" (Lion of the North) suggests possible origin from northern Brazil (Pernambuco, Bahia, etc.), but this is speculation based on nickname convention.

KILLER: Cabo Elpídio Ribeiro da Rocha (police officer, Brigada Militar). Same officer who later killed Miguel Camisa Preta on July 12, 1912. Elpídio later died in a fire after saving a child.

FRIENDSHIP: Described as "grande amigo" (great friend) of Miguel Camisa Preta. His death triggered Miguel''s vendetta against Elpídio.

LIMITED DOCUMENTATION: Unlike his more famous friend Miguel Camisa Preta, Leão do Norte appears only in the context of his death and its consequences. This is typical of many capoeiristas from this era whose stories survived only through their connections to more documented figures.

SOURCE LIMITATION: All information comes from newspaper accounts (A Noite, A Gazeta de Notícias) reporting on Miguel Camisa Preta''s death, which provided context about the rivalry with Elpídio.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1875, precisão de década): Descrito como "um capoeira valente das ruas" no momento da morte (~1911). Se era um capoeirista de rua estabelecido e "grande amigo" de Miguel Camisa Preta (que atuava de 1902-1912), provavelmente tinha 30-40 anos quando foi morto. Nascimento = ~1871-1881. Usando 1875 como ponto médio.

MORTE: ~1911 (precisão de ano). Morto pelo Cabo Elpídio Ribeiro da Rocha da Brigada Militar. A fonte afirma que a rivalidade entre Miguel e Elpídio "começara um ano antes" da morte de Miguel em 12 de julho de 1912, diretamente ligada à morte de Leão do Norte por Elpídio.

NOME: Nome completo desconhecido. "Leão do Norte" sugere possível origem do norte do Brasil (Pernambuco, Bahia, etc.), mas isso é especulação baseada na convenção do apelido.

ASSASSINO: Cabo Elpídio Ribeiro da Rocha (policial da Brigada Militar). Mesmo oficial que mais tarde matou Miguel Camisa Preta em 12 de julho de 1912. Elpídio morreu posteriormente em um incêndio após salvar uma criança.

AMIZADE: Descrito como "grande amigo" de Miguel Camisa Preta. Sua morte desencadeou a vendeta de Miguel contra Elpídio.

DOCUMENTAÇÃO LIMITADA: Diferente de seu amigo mais famoso Miguel Camisa Preta, Leão do Norte aparece apenas no contexto de sua morte e suas consequências. Isso é típico de muitos capoeiristas dessa época, cujas histórias sobreviveram apenas através de suas conexões com figuras mais documentadas.

LIMITAÇÃO DAS FONTES: Todas as informações vêm de relatos de jornais (A Noite, A Gazeta de Notícias) que reportavam a morte de Miguel Camisa Preta, que forneceram contexto sobre a rivalidade com Elpídio.'
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
