-- ============================================================
-- GENEALOGY PERSON: Formigão
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
  NULL,
  'Formigão',
  NULL,
  NULL,
  '[
    {"type": "website", "url": "https://www.academia.edu/7186292/Capoeira_e_capoeiras_entre_a_Guarda_Negra_e_a_Educação_Física_no_Recife"}
  ]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s valentão culture.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado à cultura dos valentões do Recife.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Formigão was a valentão of Recife in the early 20th century, known primarily for his involvement in the 1907 train incident alongside two of the city''s other feared figures: Adama and Eleutério de Souza.

In 1907, these three men were responsible for disturbances on a train returning from a religious festival. Such incidents were common in this era—valentões and capoeiristas often traveled together to festivals, pilgrimages, and celebrations, and confrontations could erupt on the journey home. The religious festivals of Pernambuco drew large crowds and provided opportunities for rivalries to flare up.

Little else is documented about Formigão beyond this single incident. His name (meaning "big ant" in Portuguese) was likely a street nickname given for some physical or behavioral characteristic. He belonged to the network of tough men who dominated Recife''s streets during the final years of the 19th century and the first decade of the 20th, a period when valentões walked openly armed through neighborhoods like Santo Antônio, São José, and Afogados.

The era of the "brabos" (tough men) in Recife came to an end around 1912, and the fate of Formigão after this period is unknown.',
  -- bio_pt
  E'Formigão foi um valentão do Recife no início do século XX, conhecido principalmente por seu envolvimento no incidente do trem de 1907 ao lado de duas outras figuras temidas da cidade: Adama e Eleutério de Souza.

Em 1907, estes três homens foram responsáveis por distúrbios em um trem que retornava de uma festividade religiosa. Tais incidentes eram comuns nesta época—valentões e capoeiristas frequentemente viajavam juntos para festivais, romarias e celebrações, e confrontos podiam eclodir na viagem de volta. As festas religiosas de Pernambuco atraíam grandes multidões e proporcionavam oportunidades para rivalidades se inflamarem.

Pouco mais está documentado sobre Formigão além deste único incidente. Seu nome (significando "formiga grande" em português) era provavelmente um apelido de rua dado por alguma característica física ou comportamental. Ele pertencia à rede de homens valentes que dominavam as ruas do Recife durante os anos finais do século XIX e a primeira década do século XX, um período em que valentões andavam abertamente armados pelos bairros de Santo Antônio, São José e Afogados.

A era dos "brabos" no Recife chegou ao fim por volta de 1912, e o destino de Formigão após este período é desconhecido.',
  -- achievements_en
  NULL,
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Formigão was active in 1907 (train incident) as a valentão alongside Adama and Eleutério de Souza. To be an established valentão by 1907, he would likely have been 25-40 years old, placing his birth around 1867-1882. Using 1870 as midpoint estimate, consistent with Adama''s estimated birth year.

DEATH DATE: Unknown. The era of the "brabos" in Recife ended around 1912.

APELIDO: "Formigão" means "big ant" in Portuguese—likely a street nickname based on some physical or behavioral characteristic.

FULL NAME: Unknown.

1907 TRAIN INCIDENT: Involved in disturbances on a train returning from a religious festival, along with Adama and Eleutério de Souza. This is the only documented incident involving Formigão.

SOURCES: Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife" (2013 dissertation). Limited primary source documentation available.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Formigão estava ativo em 1907 (incidente do trem) como valentão ao lado de Adama e Eleutério de Souza. Para ser um valentão estabelecido por volta de 1907, ele provavelmente teria 25-40 anos, colocando seu nascimento por volta de 1867-1882. Usando 1870 como estimativa do ponto médio, consistente com a estimativa de nascimento de Adama.

DATA DE MORTE: Desconhecida. A era dos "brabos" no Recife terminou por volta de 1912.

APELIDO: "Formigão" significa uma formiga grande em português—provavelmente um apelido de rua baseado em alguma característica física ou comportamental.

NOME COMPLETO: Desconhecido.

INCIDENTE DO TREM DE 1907: Envolvido em distúrbios em um trem que retornava de uma festividade religiosa, junto com Adama e Eleutério de Souza. Este é o único incidente documentado envolvendo Formigão.

FONTES: Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife" (dissertação de 2013). Documentação de fonte primária limitada disponível.'
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
