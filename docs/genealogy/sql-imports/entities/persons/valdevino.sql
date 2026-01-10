-- ============================================================
-- GENEALOGY PERSON: Valdevino
-- Generated: 2025-01-09
-- Primary Source: Valdemar de Oliveira "Frevo, Capoeira e Passo" (1942)
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade precision):
-- Active as capoeirista in Recife in early 1900s.
-- Arrested during police campaigns that peaked 1904-1911.
-- If active as adult capoeirista in 1900s, likely born 1860-1880.
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
  'Valdevino',
  NULL,
  NULL,
  ARRAY['http://www.ofrevo.com/2014/01/valdemar-de-oliveira-frevo-capoeira-e.html']::text[],
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
  E'Valdevino was a capoeirista in Recife at the turn of the 20th century. His name appears in the historical record due to his arrest during police suppression campaigns against capoeira in the city.

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo", the police began a campaign against the capoeiras, sending Valdevino, João de Totó, and Jovino dos Coelhos to detention, others to the prison island of Fernando de Noronha, and others directly to the morgue.

The police campaign against capoeiras in Recife was part of a broader Republican-era crackdown. The suppression intensified under Police Chief Santos Moreira (1904-1908) and later Ulisses Costa (around 1911). Santos Moreira, following the example of Rio''s Sampaio Ferraz, "sent some to the cemetery (for having resisted arrest), others to Detention, the most dangerous to Fernando de Noronha."

Valdevino was part of the generation of capoeiristas whose ginga and kicks, performed in front of the rival carnival bands of Recife, were eventually transformed into the "passo"—the foundational dance of frevo. The bands of "Quarto" (4th Artillery Battalion) and "Espanha" (National Guard) paraded through Recife protected by the agility, bravery, clubs, and knives of capoeiras like him.

The suppression of Recife''s capoeira practitioners culminated around 1912, coinciding with the birth of frevo as a distinct musical and dance form. The jumps and ginga of these capoeiristas were their legacy to Pernambuco''s culture.',
  E'Valdevino foi um capoeirista no Recife na virada do século XX. Seu nome aparece no registro histórico devido à sua prisão durante as campanhas de repressão policial contra a capoeira na cidade.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo", a polícia iniciou uma campanha contra os capoeiras, mandando Valdevino, João de Totó e Jovino dos Coelhos para a detenção, outros para a ilha-prisão de Fernando de Noronha, e outros diretamente para o necrotério.

A campanha policial contra os capoeiras no Recife fazia parte de uma repressão mais ampla da era republicana. A supressão se intensificou sob o Chefe de Polícia Santos Moreira (1904-1908) e depois Ulisses Costa (por volta de 1911). Santos Moreira, seguindo o exemplo de Sampaio Ferraz no Rio, "mandou alguns para o cemitério (por terem reagido à prisão), outros para a Detenção, os mais temíveis para Fernando de Noronha."

Valdevino fazia parte da geração de capoeiristas cuja ginga e chutes, executados na frente das bandas rivais de carnaval do Recife, foram eventualmente transformados no "passo"—a dança fundamental do frevo. As bandas do "Quarto" (4º Batalhão de Artilharia) e "Espanha" (Guarda Nacional) desfilavam pelo Recife protegidas pela agilidade, bravura, cacetes e facas de capoeiristas como ele.

A supressão dos praticantes de capoeira do Recife culminou por volta de 1912, coincidindo com o nascimento do frevo como forma musical e de dança distinta. Os saltos e a ginga desses capoeiristas foram seu legado para a cultura de Pernambuco.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Active as capoeirista in Recife in early 1900s. Arrested during police campaigns that peaked 1904-1911. If active as adult capoeirista in 1900s, likely born 1860-1880. Using 1870 as midpoint estimate.

DEATH: Unknown. Some arrested capoeiras were sent to Fernando de Noronha, others killed by police ("directly to the morgue"). Valdevino''s specific fate is not recorded.

NAME: Only known by apelido "Valdevino". Full name unknown.

CONTEMPORARIES: Arrested alongside Jovino dos Coelhos (died July 5, 1909) and João de Totó.

PRIMARY SOURCES:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)
- O Frevo website summary of Oliveira''s work',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Ativo como capoeirista no Recife no início dos anos 1900. Preso durante campanhas policiais que atingiram o auge 1904-1911. Se ativo como capoeirista adulto nos anos 1900, provavelmente nasceu 1860-1880. Usando 1870 como estimativa do ponto médio.

MORTE: Desconhecida. Alguns capoeiras presos foram enviados a Fernando de Noronha, outros mortos pela polícia ("diretamente para o necrotério"). O destino específico de Valdevino não está registrado.

NOME: Conhecido apenas pelo apelido "Valdevino". Nome completo desconhecido.

CONTEMPORÂNEOS: Preso junto com Jovino dos Coelhos (morreu em 5 de julho de 1909) e João de Totó.

FONTES PRIMÁRIAS:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)
- Resumo do site O Frevo sobre a obra de Oliveira'
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
