-- ============================================================
-- GENEALOGY PERSON: Eleutério de Souza
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
  'Eleutério de Souza',
  'Eleutério',
  NULL,
  NULL,
  ARRAY['https://www.academia.edu/7186292/Capoeira_e_capoeiras_entre_a_Guarda_Negra_e_a_Educação_Física_no_Recife']::text[],
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s valentão culture and dock worker traditions.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado à cultura dos valentões do Recife e às tradições dos trabalhadores portuários.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Eleutério de Souza, known as "O preto Eleutério" (Black Eleutério), was a founding figure in Recife''s labor movement and one of the city''s feared valentões during the late 19th and early 20th centuries.

According to the Jornal Pequeno of November 9, 1938, Eleutério was "one of the founders of the primitive stevedore work in Pernambuco." The Stevedores Union of Pernambuco (SINDESTIVA/PE), founded March 19, 1891 by formerly enslaved workers, became the oldest stevedores union in Latin America. Many of its founders, like Eleutério, had emerged from slavery just three years earlier and immediately organized to fight for their rights and better working conditions.

Beyond his role in the labor movement, Eleutério was a "valiant man" who "made an era in Recife in his youth." He was deeply connected to the political machinery of the era, "always preferred by old politicians" who employed him as their bodyguard, "especially during complicated elections." This was common practice in Recife and throughout Brazil, where capoeiristas and valentões served as enforcers during the fraud-ridden elections of the First Republic, dissolving rival political gatherings, intimidating voters, and providing muscle for their patrons.

In 1907, Eleutério was involved in disturbances on a train returning from a religious festival, alongside Adama and Formigão—fellow valentões of the era. This incident places him among the network of capoeiristas and tough men who dominated Recife''s streets in this period, walking openly armed through neighborhoods like Santo Antônio, São José, and Afogados.

The documentary record suggests Eleutério''s prime occurred earlier than the other named valentões of the period. His founding role in the stevedore movement indicates he was already an established figure by 1891, and by 1907 he may have been among the elder statesmen of Recife''s valentão community.',
  -- bio_pt
  E'Eleutério de Souza, conhecido como "O preto Eleutério," foi uma figura fundadora no movimento trabalhista do Recife e um dos temidos valentões da cidade no final do século XIX e início do século XX.

Segundo o Jornal Pequeno de 9 de novembro de 1938, Eleutério foi "um dos fundadores da primitiva estiva em Pernambuco." O Sindicato dos Estivadores de Pernambuco (SINDESTIVA/PE), fundado em 19 de março de 1891 por trabalhadores anteriormente escravizados, tornou-se o mais antigo sindicato de estivadores da América Latina. Muitos de seus fundadores, como Eleutério, haviam emergido da escravidão apenas três anos antes e imediatamente se organizaram para lutar por seus direitos e melhores condições de trabalho.

Além de seu papel no movimento trabalhista, Eleutério era um "homem valente" que "na sua mocidade fez época no Recife." Ele estava profundamente conectado à maquinaria política da época, "sempre preferido pelos antigos políticos" que o empregavam como guarda-costas, "principalmente por ocasião de eleições intrincadas." Esta era uma prática comum no Recife e em todo o Brasil, onde capoeiristas e valentões serviam como capangas durante as eleições fraudulentas da Primeira República, dissolvendo reuniões políticas rivais, intimidando eleitores e fornecendo força para seus patronos.

Em 1907, Eleutério se envolveu em distúrbios em um trem que retornava de uma festividade religiosa, ao lado de Adama e Formigão—valentões contemporâneos. Este incidente o coloca entre a rede de capoeiristas e homens valentes que dominavam as ruas do Recife neste período, andando abertamente armados pelos bairros de Santo Antônio, São José e Afogados.

O registro documental sugere que o auge de Eleutério ocorreu antes dos outros valentões nomeados do período. Seu papel fundador no movimento dos estivadores indica que ele já era uma figura estabelecida por volta de 1891, e em 1907 ele pode ter estado entre os veteranos da comunidade de valentões do Recife.',
  -- achievements_en
  'One of the founders of the primitive stevedore work in Pernambuco; Trusted bodyguard of politicians during complicated elections; Made an era in Recife in his youth',
  -- achievements_pt
  'Um dos fundadores da primitiva estiva em Pernambuco; Guarda-costas de confiança de políticos durante eleições intrincadas; Fez época no Recife na sua mocidade',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1860, decade precision): Eleutério was described as having "made an era in Recife in his youth" and was a founder of the "primitive stevedore work" in Pernambuco. The stevedores union (SINDESTIVA/PE) was founded in 1891 by formerly enslaved workers. If Eleutério was 25-35 when helping organize stevedore work around 1891, his birth would be ~1856-1866. By 1907 (train incident), he would have been a mature, established figure. By 1938 when Jornal Pequeno wrote about him, he would have been elderly or recently deceased. Using 1860 as midpoint estimate.

DEATH DATE: Unknown. The 1938 Jornal Pequeno article may be an obituary or memorial, suggesting he died around or before this date, but no specific date has been found.

APELIDO: Known as "O preto Eleutério" (Black Eleutério). The term "preto" indicates he was a Black man, likely formerly enslaved or descended from the enslaved.

PROFESSION: Stevedore (dock worker); founding figure in Pernambuco''s stevedore movement.

POLITICAL ROLE: Served as bodyguard to politicians during elections—a common role for valentões in the First Republic era.

1907 TRAIN INCIDENT: Involved in disturbances on a train returning from a religious festival, along with Adama and Formigão.

SOURCES: Primary source is Jornal Pequeno, November 9, 1938 (cited in Israel Ozanam''s dissertation). Academic context from Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife."',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1860, precisão de década): Eleutério foi descrito como tendo "fez época no Recife na sua mocidade" e era um fundador da "primitiva estiva em Pernambuco." O sindicato dos estivadores (SINDESTIVA/PE) foi fundado em 1891 por trabalhadores anteriormente escravizados. Se Eleutério tinha 25-35 anos quando ajudou a organizar o trabalho de estiva por volta de 1891, seu nascimento seria por volta de 1856-1866. Em 1907 (incidente do trem), ele já seria uma figura madura e estabelecida. Em 1938 quando o Jornal Pequeno escreveu sobre ele, ele estaria idoso ou recentemente falecido. Usando 1860 como estimativa do ponto médio.

DATA DE MORTE: Desconhecida. O artigo do Jornal Pequeno de 1938 pode ser um obituário ou memorial, sugerindo que ele faleceu por volta ou antes desta data, mas nenhuma data específica foi encontrada.

APELIDO: Conhecido como "O preto Eleutério." O termo "preto" indica que ele era um homem negro, provavelmente anteriormente escravizado ou descendente de escravizados.

PROFISSÃO: Estivador (trabalhador portuário); figura fundadora no movimento dos estivadores de Pernambuco.

PAPEL POLÍTICO: Servia como guarda-costas de políticos durante eleições—papel comum para valentões na era da Primeira República.

INCIDENTE DO TREM DE 1907: Envolvido em distúrbios em um trem que retornava de uma festividade religiosa, junto com Adama e Formigão.

FONTES: Fonte primária é o Jornal Pequeno de 9 de novembro de 1938 (citado na dissertação de Israel Ozanam). Contexto acadêmico de Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife."'
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
