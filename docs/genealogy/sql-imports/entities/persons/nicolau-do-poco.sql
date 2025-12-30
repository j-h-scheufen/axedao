-- ============================================================
-- GENEALOGY PERSON: Nicolau do Poço
-- Generated: 2025-12-15
-- Primary Source: Valdemar de Oliveira "Frevo, Capoeira e Passo" (1942)
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade precision):
-- Active as prominent valentão in late 1800s/early 1900s Recife.
-- Mentioned alongside Nascimento Grande (1842-1936) and contemporaries.
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
  'Nicolau do Poço',
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
  E'Nicolau do Poço was one of the famous capoeiras whose names are preserved in the history of Recife''s carnival. He was among the "moleques de banda de música" (band boys) and malta leaders who performed in front of carnival bands in late 19th and early 20th century Pernambuco.

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo", young men from good families liked to go with Nicolau do Poço or Nascimento Grande to break up pastoral plays just for the enjoyment of doing so—a testament to his status as a prominent figure in Recife''s nightlife and street culture.

Nicolau was part of the capoeira groups that organized around the rival military bands: the "Partido do 4º" (also called "Banha Cheirosa") supporting the 4th Artillery Battalion band, and the "Partido Espanha" (also called "Cabeças Secas") supporting the National Guard band. These capoeiristas performed ginga and kicks in front of the bands during carnival parades—movements that were eventually transformed into the "passo", the foundational dance of frevo.

The police gradually cracked down on the "moleques de banda de música" and their leaders, including Nicolau do Poço, João de Totó, and Jovino dos Coelhos, until neutralizing the greatest of them all, Nascimento Grande. The suppression of Recife''s capoeira maltas culminated around 1912, coinciding with the formalization of frevo as a distinct musical and dance form.

Of all the valentões of Recife carnival, only Nascimento Grande was considered more fearsome than figures like Nicolau do Poço.',
  E'Nicolau do Poço foi um dos famosos capoeiras cujos nomes estão preservados na história do carnaval do Recife. Estava entre os "moleques de banda de música" e líderes de malta que se apresentavam na frente das bandas de carnaval no final do século XIX e início do século XX em Pernambuco.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo", rapazes de boas famílias gostavam de ir com Nicolau do Poço ou Nascimento Grande para arrebentar pastoris apenas pelo prazer de fazê-lo—um testemunho de seu status como figura proeminente na vida noturna e cultura de rua do Recife.

Nicolau fazia parte dos grupos de capoeira que se organizavam em torno das bandas militares rivais: o "Partido do 4º" (também chamado "Banha Cheirosa") apoiando a banda do 4º Batalhão de Artilharia, e o "Partido Espanha" (também chamado "Cabeças Secas") apoiando a banda da Guarda Nacional. Esses capoeiristas executavam ginga e chutes na frente das bandas durante os desfiles de carnaval—movimentos que eventualmente foram transformados no "passo", a dança fundamental do frevo.

A polícia gradualmente reprimiu os "moleques de banda de música" e seus líderes, incluindo Nicolau do Poço, João de Totó e Jovino dos Coelhos, até neutralizar o maior de todos, Nascimento Grande. A supressão das maltas de capoeira do Recife culminou por volta de 1912, coincidindo com a formalização do frevo como forma musical e de dança distinta.

De todos os valentões do carnaval do Recife, apenas Nascimento Grande era considerado mais temível do que figuras como Nicolau do Poço.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Active as prominent valentão in late 1800s/early 1900s Recife. Mentioned alongside Nascimento Grande (1842-1936) and contemporaries. If active as adult in 1890s-1900s, likely born 1860-1880. Using 1870 as midpoint estimate.

DEATH: Unknown. No death records found.

NAME: Only known by apelido "Nicolau do Poço" (Nicolas of the Well). Full name unknown.

PRIMARY SOURCES:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)
- CEV: Historia da Capoeira',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Ativo como valentão proeminente no final dos anos 1800/início dos anos 1900 no Recife. Mencionado ao lado de Nascimento Grande (1842-1936) e contemporâneos. Se ativo como adulto nos anos 1890-1900, provavelmente nasceu 1860-1880. Usando 1870 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro de morte encontrado.

NOME: Conhecido apenas pelo apelido "Nicolau do Poço". Nome completo desconhecido.

FONTES PRIMÁRIAS:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)
- CEV: Historia da Capoeira'
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
