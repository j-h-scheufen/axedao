-- ============================================================
-- GENEALOGY PERSON: Americano (Dois Rios)
-- Generated: 2025-12-16
-- ============================================================
-- MINIMAL DOCUMENTATION: Known from Madame Satã's memoirs.
-- May be the same person as Mestre Celso's cousin who practiced
-- tiririca at Ilha Grande - this connection is unverified.
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
  'Americano',
  'Dois Rios', -- Context to distinguish from other potential Americanos
  NULL, -- No known title
  NULL, -- No portrait available
  ARRAY['https://capoeirahistory.com/the-imprisonment-of-capoeiras-on-ilha-grande/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era
  'Carioca capoeira of the early 20th century. Imprisoned at Dois Rios Correctional Colony on Ilha Grande, where tiririca (a local variant of capoeira) was practiced among prisoners. If identical to Mestre Celso''s cousin, he specifically practiced tiririca with its characteristic ground movements, leg kicks, and headbutts.',
  'Capoeira carioca do início do século XX. Preso na Colônia Correcional de Dois Rios na Ilha Grande, onde a tiririca (uma variante local da capoeira) era praticada entre os prisioneiros. Se for idêntico ao primo de Mestre Celso, ele praticava especificamente a tiririca com seus movimentos característicos no chão, chutes e cabeçadas.',
  -- Life dates
  1900, -- Estimated: adult during early 20th century at Dois Rios
  'decade'::genealogy.date_precision,
  NULL, -- No birth place information
  NULL, -- No death year information
  NULL,
  NULL, -- No death place information
  -- bio_en
  E'Americano is known primarily through a brief mention in Madame Satã''s prison memoirs. Although Madame Satã did not consider himself a capoeira practitioner, in his memoirs he mentions some "capoeira rogues" (malandros capoeiras) who were imprisoned in Dois Rios alongside him, including Sete Coroas (who was from Bahia), Edgar, and Americano.

The Dois Rios Correctional Colony (Colônia Correcional de Dois Rios) on Ilha Grande was established in 1894 to imprison "drunkards, beggars, prostitutes, capoeiras, and vagrants." The colony became notorious for its harsh conditions, earning it the nickname "Ilha da Maldição" (Isle of Damnation).

A potentially significant connection exists: Mestre Celso Carvalho do Nascimento (born 1939), a respected capoeira mestre from Rio de Janeiro, mentioned in an interview that he had a cousin nicknamed "Americano" who was imprisoned at the Colony and knew how to do tiririca. According to Mestre Celso, tiririca involved playing on the ground, throwing leg kicks at someone standing up to make them fall, and delivering headbutts. Practitioners at Ilha Grande avoided calling it capoeira.

Whether Mestre Celso''s cousin is the same Americano mentioned by Madame Satã remains unverified. If they are the same person, it would place Americano''s imprisonment in a timeframe that overlaps with both Madame Satã and Sete Coroas. If different, the coincidence of the same unusual nickname and the same prison suggests tiririca practitioners at Dois Rios may have formed an identifiable group.

Nothing else is known about Americano—not his full name, origin, the nature of his crimes, or his fate after imprisonment.',
  -- bio_pt
  E'Americano é conhecido principalmente através de uma breve menção nas memórias de prisão de Madame Satã. Embora Madame Satã não se considerasse praticante de capoeira, em suas memórias ele menciona alguns "malandros capoeiras" que estavam presos em Dois Rios junto com ele, incluindo Sete Coroas (que era da Bahia), Edgar e Americano.

A Colônia Correcional de Dois Rios na Ilha Grande foi estabelecida em 1894 para prender "ébrios, mendigos, prostitutas, capoeiras e vadios." A colônia tornou-se notória por suas condições severas, ganhando o apelido de "Ilha da Maldição."

Uma conexão potencialmente significativa existe: Mestre Celso Carvalho do Nascimento (nascido em 1939), um respeitado mestre de capoeira do Rio de Janeiro, mencionou em uma entrevista que tinha um primo apelidado de "Americano" que foi preso na Colônia e sabia fazer tiririca. Segundo Mestre Celso, a tiririca envolvia jogar no chão, dar chutes nas pernas de alguém em pé para derrubá-lo e dar cabeçadas. Os praticantes na Ilha Grande evitavam chamar de capoeira.

Se o primo de Mestre Celso é o mesmo Americano mencionado por Madame Satã permanece não verificado. Se forem a mesma pessoa, isso colocaria a prisão de Americano em um período que coincide com Madame Satã e Sete Coroas. Se diferentes, a coincidência do mesmo apelido incomum e da mesma prisão sugere que os praticantes de tiririca em Dois Rios podem ter formado um grupo identificável.

Nada mais se sabe sobre Americano—nem seu nome completo, origem, a natureza de seus crimes, ou seu destino após a prisão.',
  -- achievements_en
  NULL,
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'MINIMAL DOCUMENTATION: Americano is mentioned in Madame Satã''s memoirs (published 1972 by Sylvan Paezzo) as one of the "capoeira rogues" imprisoned at Dois Rios alongside Sete Coroas and Edgar.

POSSIBLE IDENTITY CONNECTION: Mestre Celso Carvalho do Nascimento (b. 1939) mentioned having a cousin called "Americano" who was imprisoned at the Colony and practiced tiririca. This could be the same person, but the connection is UNVERIFIED.

BIRTH YEAR ESTIMATION (1900, decade precision): Americano was an adult capoeirista at Dois Rios prison during Madame Satã''s time there (1920s-1960s). Mentioned alongside Sete Coroas (died 1923), though may not have been contemporaries. If identical to Mestre Celso''s cousin, he would have been of a generation older than Celso (b. 1939). Using ~1900 as middle estimate.

TIRIRICA DISTINCTION: Mestre Celso described tiririca as distinct from capoeira - involving ground play, leg kicks from the ground, and headbutts. Prisoners at Ilha Grande avoided calling it capoeira, reflecting continued stigmatization.

APELIDO_CONTEXT: Using "Dois Rios" to distinguish from potential other capoeiristas named Americano.

TIME PERIOD: Early 20th century (likely 1900s-1940s based on the prison''s operation and Madame Satã''s presence there).

SOURCES:
- Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.
- Capoeira History: "The imprisonment of capoeiras on Ilha Grande"
- Gabriel da Silva Vidal Cid. "A capoeira no Rio de Janeiro (1910-1950): narrativas de mestre Celso." Revista Morpheus, 2003.',
  -- Researcher notes (Portuguese)
  E'DOCUMENTAÇÃO MÍNIMA: Americano é mencionado nas memórias de Madame Satã (publicadas em 1972 por Sylvan Paezzo) como um dos "malandros capoeiras" presos em Dois Rios junto com Sete Coroas e Edgar.

POSSÍVEL CONEXÃO DE IDENTIDADE: Mestre Celso Carvalho do Nascimento (n. 1939) mencionou ter um primo chamado "Americano" que foi preso na Colônia e praticava tiririca. Poderia ser a mesma pessoa, mas a conexão NÃO ESTÁ VERIFICADA.

ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Americano era um capoeirista adulto na prisão de Dois Rios durante o tempo de Madame Satã lá (1920s-1960s). Mencionado junto com Sete Coroas (morreu em 1923), embora possam não ter sido contemporâneos. Se for idêntico ao primo de Mestre Celso, seria de uma geração mais velha que Celso (n. 1939). Usando ~1900 como estimativa média.

DISTINÇÃO DA TIRIRICA: Mestre Celso descreveu a tiririca como distinta da capoeira - envolvendo jogo no chão, chutes das pernas a partir do chão e cabeçadas. Os prisioneiros na Ilha Grande evitavam chamar de capoeira, refletindo a estigmatização contínua.

APELIDO_CONTEXT: Usando "Dois Rios" para distinguir de outros potenciais capoeiristas chamados Americano.

PERÍODO: Início do século XX (provavelmente 1900-1940 com base na operação da prisão e na presença de Madame Satã lá).

FONTES:
- Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.
- Capoeira History: "The imprisonment of capoeiras on Ilha Grande"
- Gabriel da Silva Vidal Cid. "A capoeira no Rio de Janeiro (1910-1950): narrativas de mestre Celso." Revista Morpheus, 2003.'
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
