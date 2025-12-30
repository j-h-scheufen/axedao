-- ============================================================
-- GENEALOGY PERSON: João de Totó
-- Generated: 2025-12-15
-- Primary Source: Valdemar de Oliveira "Frevo, Capoeira e Passo" (1942)
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade precision):
-- Active as prominent valentão in late 1800s/early 1900s Recife.
-- Arrested during police campaigns in early 1900s alongside Jovino dos Coelhos.
-- If active as adult in 1890s-1900s, likely born 1860-1880.
-- Using 1870 as midpoint estimate.
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
  NULL,
  'João de Totó',
  NULL,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  NULL,
  NULL,
  NULL,
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bilingual)
  E'João de Totó was one of the famous capoeiras whose names are preserved in the history of Recife''s carnival. He was among the valentões (tough guys) who performed in front of the rival carnival bands in late 19th and early 20th century Pernambuco.

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo", João de Totó was one of the capoeiristas targeted by police crackdowns in the early 1900s. The police campaign against the capoeiras sent Valdevino, João de Totó, and Jovino dos Coelhos to detention, others to Fernando de Noronha (the notorious prison island off the coast of Pernambuco), and others directly to the morgue.

João de Totó was part of the capoeira maltas that organized around the rival military bands during carnival season. The bands of "Quarto" (4th Artillery Battalion) and "Espanha" (National Guard) paraded through Recife protected by the agility, bravery, clubs, and knives of capoeiras like him. These capoeiristas performed ginga and kicks that were eventually transformed into the "passo"—the foundational dance of frevo.

The suppression of Recife''s capoeira maltas culminated around 1912, coinciding with the birth of frevo as a distinct musical and dance form. The jumps and ginga of these capoeiristas were their legacy to Pernambuco''s culture.

Of all the valentões of Recife carnival—Jovino dos Coelhos, Nicolau do Poço, João de Totó—only Nascimento Grande was considered more fearsome.',
  E'João de Totó foi um dos famosos capoeiras cujos nomes estão preservados na história do carnaval do Recife. Estava entre os valentões que se apresentavam na frente das bandas rivais de carnaval no final do século XIX e início do século XX em Pernambuco.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo", João de Totó foi um dos capoeiristas alvos da repressão policial no início dos anos 1900. A campanha policial contra os capoeiras mandou Valdevino, João de Totó e Jovino dos Coelhos para a detenção, outros para Fernando de Noronha (a notória ilha-prisão na costa de Pernambuco), e outros diretamente para o necrotério.

João de Totó fazia parte das maltas de capoeira que se organizavam em torno das bandas militares rivais durante a temporada de carnaval. As bandas do "Quarto" (4º Batalhão de Artilharia) e "Espanha" (Guarda Nacional) desfilavam pelo Recife protegidas pela agilidade, bravura, cacetes e facas de capoeiristas como ele. Esses capoeiristas executavam ginga e chutes que eventualmente foram transformados no "passo"—a dança fundamental do frevo.

A supressão das maltas de capoeira do Recife culminou por volta de 1912, coincidindo com o nascimento do frevo como forma musical e de dança distinta. Os saltos e a ginga desses capoeiristas foram seu legado para a cultura de Pernambuco.

De todos os valentões do carnaval do Recife—Jovino dos Coelhos, Nicolau do Poço, João de Totó—apenas Nascimento Grande era considerado mais temível.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Active as prominent valentão in late 1800s/early 1900s Recife. Arrested during police campaigns in early 1900s alongside Jovino dos Coelhos. If active as adult in 1890s-1900s, likely born 1860-1880. Using 1870 as midpoint estimate.

DEATH: Unknown. No death records found.

NAME: Only known by apelido "João de Totó". Full name unknown. Note: There is a neighborhood in Recife called "Totó" but the connection to this person is unclear.

PRIMARY SOURCES:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Ativo como valentão proeminente no final dos anos 1800/início dos anos 1900 no Recife. Preso durante campanhas policiais no início dos anos 1900 junto com Jovino dos Coelhos. Se ativo como adulto nos anos 1890-1900, provavelmente nasceu 1860-1880. Usando 1870 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro de morte encontrado.

NOME: Conhecido apenas pelo apelido "João de Totó". Nome completo desconhecido. Nota: Há um bairro no Recife chamado "Totó" mas a conexão com esta pessoa não é clara.

FONTES PRIMÁRIAS:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)'
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
