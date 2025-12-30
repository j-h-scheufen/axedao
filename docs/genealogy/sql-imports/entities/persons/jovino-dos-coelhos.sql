-- ============================================================
-- GENEALOGY PERSON: Jovino dos Coelhos
-- Generated: 2025-12-15
-- Primary Source: Valdemar de Oliveira "Frevo, Capoeira e Passo" (1942)
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade precision):
-- Active as prominent valentão in late 1800s/early 1900s Recife.
-- Died July 5, 1909. If he was 35-50 at death, birth = ~1859-1874.
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
  'Jovino Pedro de Alcântara',
  'Jovino dos Coelhos',
  NULL,
  NULL,
  ARRAY['https://www.academia.edu/7186292/Capoeira_e_capoeiras_entre_a_Guarda_Negra_e_a_Educação_Física_no_Recife']::text[],
  -- Capoeira-specific
  NULL,
  NULL,
  NULL,
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  1909,
  'exact'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  -- Extended content (bilingual)
  E'Jovino dos Coelhos was one of the most notable valentões (tough guys) of Recife in the late 19th and early 20th centuries. According to Oscar Mello in "Recife Sangrento" (1937), he was protected by politicians and committed "all sorts of horrors" in the city.

He was famous for being nearly impossible to arrest—it took more than ten policemen to apprehend him. An exemplary swimmer, when surrounded by police he would escape by throwing himself into the waters of the Capibaribe River. He also handled a large pointed knife with exceptional skill.

Jovino was among the capoeira leaders who protected the rival carnival bands in Recife. The bands of "Quarto" (4th Artillery Battalion) and "Espanha" (National Guard) paraded during Pernambuco carnival protected by the agility, bravery, clubs, and knives of capoeiras like him. These capoeiristas performed in front of the bands using ginga and kicks that were eventually transformed into the "passo"—the foundational dance of frevo.

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo", the police began a campaign against the capoeiras, sending Valdevino, João de Totó, and Jovino dos Coelhos to detention, others to the prison island of Fernando de Noronha, and others directly to the morgue.

The newspaper Correio do Recife reported on his death on July 5, 1909, referring to him as a "bandido" (bandit). Items found in his pockets included notes to various individuals. Of all the valentões of Recife carnival—Jovino dos Coelhos, Nicolau do Poço, João de Totó—only Nascimento Grande was considered more fearsome.',
  E'Jovino dos Coelhos foi um dos valentões mais notáveis do Recife no final do século XIX e início do século XX. Segundo Oscar Mello em "Recife Sangrento" (1937), era protegido por políticos e cometia "toda sorte de horrores" na cidade.

Era famoso por ser quase impossível de prender—eram necessários mais de dez policiais para capturá-lo. Nadador exemplar, quando cercado pela polícia escapava lançando-se nas águas do Rio Capibaribe. Também manejava uma grande faca pontuda com habilidade excepcional.

Jovino estava entre os líderes de capoeira que protegiam as bandas rivais de carnaval no Recife. As bandas do "Quarto" (4º Batalhão de Artilharia) e "Espanha" (Guarda Nacional) desfilavam durante o carnaval de Pernambuco protegidas pela agilidade, bravura, cacetes e facas de capoeiristas como ele. Esses capoeiristas se apresentavam na frente das bandas usando ginga e golpes de pé que eventualmente foram transformados no "passo"—a dança fundamental do frevo.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo", a polícia iniciou uma campanha contra os capoeiras, mandando Valdevino, João de Totó e Jovino dos Coelhos para a detenção, outros para a ilha-prisão de Fernando de Noronha, e outros diretamente para o necrotério.

O jornal Correio do Recife noticiou sua morte em 5 de julho de 1909, referindo-se a ele como "bandido". Entre os itens encontrados em seus bolsos havia bilhetes para várias pessoas. De todos os valentões do carnaval do Recife—Jovino dos Coelhos, Nicolau do Poço, João de Totó—apenas Nascimento Grande era considerado mais temível.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Active as prominent valentão in late 1800s/early 1900s Recife. Died July 5, 1909. If he was 35-50 at death, birth = ~1859-1874. Using 1870 as midpoint estimate.

DEATH: July 5, 1909 (exact) - reported in Correio do Recife newspaper.

NAME: Full name Jovino Pedro de Alcântara recorded in historical sources.

PRIMARY SOURCES:
- Oscar Mello, "Recife Sangrento" (1937)
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)
- Correio do Recife, July 5, 1909',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Ativo como valentão proeminente no final dos anos 1800/início dos anos 1900 no Recife. Morreu em 5 de julho de 1909. Se tinha 35-50 anos na morte, nascimento = ~1859-1874. Usando 1870 como estimativa do ponto médio.

MORTE: 5 de julho de 1909 (exata) - noticiada no jornal Correio do Recife.

NOME: Nome completo Jovino Pedro de Alcântara registrado em fontes históricas.

FONTES PRIMÁRIAS:
- Oscar Mello, "Recife Sangrento" (1937)
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)
- Correio do Recife, 5 de julho de 1909'
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
