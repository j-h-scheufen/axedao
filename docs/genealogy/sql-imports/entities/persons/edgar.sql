-- ============================================================
-- GENEALOGY PERSON: Edgar (Dois Rios)
-- Generated: 2025-12-16
-- ============================================================
-- MINIMAL DOCUMENTATION: Only known from Madame Satã's memoirs.
-- No birth/death years, full name, or detailed biography available.
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
  NULL, -- Full name unknown
  'Edgar',
  'Dois Rios', -- Context to distinguish from other potential Edgars
  NULL, -- No known title
  NULL, -- No portrait available
  ARRAY['https://capoeirahistory.com/the-imprisonment-of-capoeiras-on-ilha-grande/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era
  'Carioca capoeira of the early 20th century. Imprisoned at Dois Rios Correctional Colony on Ilha Grande, where tiririca (a local variant of capoeira) was practiced among prisoners.',
  'Capoeira carioca do início do século XX. Preso na Colônia Correcional de Dois Rios na Ilha Grande, onde a tiririca (uma variante local da capoeira) era praticada entre os prisioneiros.',
  -- Life dates
  1900, -- Estimated: adult during early 20th century at Dois Rios
  'decade'::genealogy.date_precision,
  NULL, -- No birth place information
  NULL, -- No death year information
  NULL,
  NULL, -- No death place information
  -- bio_en
  E'Edgar is known only through a brief mention in Madame Satã''s prison memoirs. Although Madame Satã did not consider himself a capoeira practitioner, in his memoirs he mentions some "capoeira rogues" (malandros capoeiras) who were imprisoned in Dois Rios alongside him, including Sete Coroas (who was from Bahia), Edgar, and Americano.

The Dois Rios Correctional Colony (Colônia Correcional de Dois Rios) on Ilha Grande was established in 1894 to imprison "drunkards, beggars, prostitutes, capoeiras, and vagrants." The colony became notorious for its harsh conditions—poor food, disease, torture, and forced labor—earning it the nickname "Ilha da Maldição" (Isle of Damnation).

Among the prisoners, fighting techniques related to capoeira survived but were often called "tiririca" rather than capoeira. According to Seu Júlio, another long-term prisoner who arrived in 1958, older prisoners knew the fighting moves and passed them to younger inmates, but "avoided calling it capoeira." This reflects the continued stigmatization of capoeira even in prison settings.

Nothing else is known about Edgar—not his full name, origin, the nature of his crimes, or his fate after imprisonment.',
  -- bio_pt
  E'Edgar é conhecido apenas através de uma breve menção nas memórias de prisão de Madame Satã. Embora Madame Satã não se considerasse praticante de capoeira, em suas memórias ele menciona alguns "malandros capoeiras" que estavam presos em Dois Rios junto com ele, incluindo Sete Coroas (que era da Bahia), Edgar e Americano.

A Colônia Correcional de Dois Rios na Ilha Grande foi estabelecida em 1894 para prender "ébrios, mendigos, prostitutas, capoeiras e vadios." A colônia tornou-se notória por suas condições severas—má alimentação, doenças, tortura e trabalho forçado—ganhando o apelido de "Ilha da Maldição."

Entre os prisioneiros, as técnicas de luta relacionadas à capoeira sobreviveram, mas eram frequentemente chamadas de "tiririca" em vez de capoeira. Segundo Seu Júlio, outro prisioneiro de longa data que chegou em 1958, os presos mais velhos conheciam os golpes de luta e os passavam para os mais jovens, mas "evitavam chamar de capoeira." Isso reflete a contínua estigmatização da capoeira mesmo em ambientes prisionais.

Nada mais se sabe sobre Edgar—nem seu nome completo, origem, a natureza de seus crimes, ou seu destino após a prisão.',
  -- achievements_en
  NULL,
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'MINIMAL DOCUMENTATION: Edgar is mentioned only once in Madame Satã''s memoirs (published 1972 by Sylvan Paezzo) as one of the "capoeira rogues" imprisoned at Dois Rios alongside Sete Coroas and Americano.

BIRTH YEAR ESTIMATION (1900, decade precision): Edgar was an adult capoeirista at Dois Rios prison during Madame Satã''s time there (1920s-1960s). Mentioned alongside Sete Coroas (died 1923), though may not have been contemporaries. Using ~1900 as middle estimate for early 20th century adult.

ALTERNATE SPELLING: Source material uses "Edgard" (Portuguese spelling).

APELIDO_CONTEXT: Using "Dois Rios" to distinguish from potential other capoeiristas named Edgar.

TIME PERIOD: Early 20th century (likely 1900s-1940s based on the prison''s operation and Madame Satã''s presence there).

SOURCES:
- Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.
- Capoeira History: "The imprisonment of capoeiras on Ilha Grande"',
  -- Researcher notes (Portuguese)
  E'DOCUMENTAÇÃO MÍNIMA: Edgar é mencionado apenas uma vez nas memórias de Madame Satã (publicadas em 1972 por Sylvan Paezzo) como um dos "malandros capoeiras" presos em Dois Rios junto com Sete Coroas e Americano.

ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Edgar era um capoeirista adulto na prisão de Dois Rios durante o tempo de Madame Satã lá (1920s-1960s). Mencionado junto com Sete Coroas (morreu em 1923), embora possam não ter sido contemporâneos. Usando ~1900 como estimativa média para adulto do início do século XX.

GRAFIA ALTERNATIVA: O material fonte usa "Edgard" (grafia portuguesa).

APELIDO_CONTEXT: Usando "Dois Rios" para distinguir de outros potenciais capoeiristas chamados Edgar.

PERÍODO: Início do século XX (provavelmente 1900-1940 com base na operação da prisão e na presença de Madame Satã lá).

FONTES:
- Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.
- Capoeira History: "The imprisonment of capoeiras on Ilha Grande"'
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
