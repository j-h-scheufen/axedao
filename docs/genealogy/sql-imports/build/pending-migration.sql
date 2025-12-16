-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2025-12-16T12:19:22.131Z
-- ============================================================
--
-- New entity files: 56
-- Changed entity files: 1
-- New statement files: 56
-- Changed statement files: 2
-- Deleted files: 0
-- Unchanged files: 145
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/aberre-de-santo-amaro.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Aberrê de Santo Amaro
-- Generated: 2025-12-15
-- ============================================================
-- DISPUTED IDENTITY: This person MAY be distinct from Aberrê de
-- Salvador (Antônio Raimundo Argolo, 1895-1942). Evidence supports
-- two different people with the apelido "Aberrê":
--   1. Antônio Raimundo Argolo (Salvador) - taught Canjiquinha
--   2. Antônio Rufino dos Santos (Santo Amaro) - taught Caiçara
--
-- BIRTH YEAR ESTIMATION: If teaching in 1938, likely born 1890-1905.
-- Using 1890 with decade precision as conservative estimate.
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
  'Antônio Rufino dos Santos',
  'Aberrê',
  'Santo Amaro',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-27', 'https://decapoeira.org/en/mestre-caicara/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Practiced pre-codified capoeira in Santo Amaro da Purificação in the Recôncavo Baiano. His teaching style emphasized "the secrets and mysteries of capoeiragem" (the practice of capoeira). Like the Salvador Aberrê, he carried a bengala (walking cane) both for elegance and as a potential weapon.',
  E'Praticava capoeira pré-codificada em Santo Amaro da Purificação no Recôncavo Baiano. Seu estilo de ensino enfatizava "os segredos e mistérios da capoeiragem." Como o Aberrê de Salvador, carregava uma bengala tanto por elegância quanto como arma em potencial.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio)
  E'Little is known about Antônio Rufino dos Santos beyond his role as the teacher of Mestre Caiçara. If he existed as a separate person from Aberrê de Salvador (Antônio Raimundo Argolo), he was a mestre active in the capoeira scene of Santo Amaro da Purificação—a city in the Recôncavo Baiano region around the Bay of All Saints—in the early 20th century.

In 1938, a 14-year-old Antônio Conceição Moraes (later Mestre Caiçara) began learning capoeira from "Mestre Aberrê de Santo Amaro." According to multiple sources including Mestre Gildo Alfinete, this teacher''s full name was Antônio Rufino dos Santos. Aberrê taught Caiçara "os segredos e mistérios da capoeiragem"—the secrets and mysteries of the practice of capoeira.

The most telling evidence for two distinct Aberrês comes from Mestre Caiçara''s own testimony. According to sources, Caiçara distinguished between two masters: his teacher "José Rufino" and a different Aberrê connected to Pastinha whom he called "José Raimundo." This distinction aligns with the documented names: Antônio **Rufino** dos Santos (Santo Amaro) vs. Antônio **Raimundo** Argolo (Salvador).

The bengala (walking cane) that became Mestre Caiçara''s trademark was given to him by his Mestre Aberrê before the mestre''s death. According to Caiçara, his master also carried a bengala—both for practical use and as a sign of elegance. In the hands of a capoeirista, such a cane could become a deadly weapon. The timing of his death is unclear.

If Aberrê de Santo Amaro was teaching in 1938, he was likely born sometime in the 1880s-1900s. A mestre teaching a new student would typically be at least in his 30s-40s, suggesting birth around 1890-1905.

**Why this matters:** Both Mestre Canjiquinha and Mestre Caiçara consistently denied connection to Pastinha''s lineage throughout their lives. If Canjiquinha trained under the Salvador Aberrê (who invited Pastinha to Gengibirra in 1941), why would he deny the connection? The "Two Aberrês" theory provides an explanation: perhaps both students were telling the truth because there were indeed two different teachers named Aberrê.',
  -- bio_pt
  E'Pouco se sabe sobre Antônio Rufino dos Santos além de seu papel como professor de Mestre Caiçara. Se ele existiu como pessoa separada de Aberrê de Salvador (Antônio Raimundo Argolo), foi um mestre ativo na cena da capoeira de Santo Amaro da Purificação—uma cidade no Recôncavo Baiano em torno da Baía de Todos os Santos—no início do século XX.

Em 1938, Antônio Conceição Moraes, de 14 anos (mais tarde Mestre Caiçara), começou a aprender capoeira com "Mestre Aberrê de Santo Amaro." Segundo múltiplas fontes, incluindo Mestre Gildo Alfinete, o nome completo deste professor era Antônio Rufino dos Santos. Aberrê ensinou a Caiçara "os segredos e mistérios da capoeiragem."

A evidência mais reveladora para dois Aberrês distintos vem do próprio testemunho de Mestre Caiçara. Segundo fontes, Caiçara distinguia entre dois mestres: seu professor "José Rufino" e um Aberrê diferente conectado a Pastinha que ele chamava de "José Raimundo." Essa distinção alinha com os nomes documentados: Antônio **Rufino** dos Santos (Santo Amaro) vs. Antônio **Raimundo** Argolo (Salvador).

A bengala que se tornou marca registrada de Mestre Caiçara foi dada a ele por seu Mestre Aberrê antes da morte do mestre. Segundo Caiçara, seu mestre também carregava uma bengala—tanto para uso prático quanto como sinal de elegância. Nas mãos de um capoeirista, tal bengala poderia se tornar uma arma mortal. O momento de sua morte é incerto.

Se Aberrê de Santo Amaro estava ensinando em 1938, provavelmente nasceu em algum momento nas décadas de 1880-1900. Um mestre ensinando um novo aluno normalmente teria pelo menos 30-40 anos, sugerindo nascimento por volta de 1890-1905.

**Por que isso importa:** Tanto Mestre Canjiquinha quanto Mestre Caiçara negaram consistentemente conexão com a linhagem de Pastinha ao longo de suas vidas. Se Canjiquinha treinou sob o Aberrê de Salvador (que convidou Pastinha para Gengibirra em 1941), por que ele negaria a conexão? A teoria dos "Dois Aberrês" fornece uma explicação: talvez ambos os alunos estivessem dizendo a verdade porque havia de fato dois professores diferentes chamados Aberrê.',
  -- achievements
  E'~1938: Began teaching Mestre Caiçara (Antônio Conceição Moraes) in Santo Amaro
Passed his bengala (walking cane) to Caiçara before death—became Caiçara''s trademark
Taught "os segredos e mistérios da capoeiragem" (the secrets and mysteries of capoeira)',
  -- achievements_pt
  E'~1938: Começou a ensinar Mestre Caiçara (Antônio Conceição Moraes) em Santo Amaro
Passou sua bengala para Caiçara antes da morte—tornou-se marca registrada de Caiçara
Ensinou "os segredos e mistérios da capoeiragem"',
  -- notes (researcher metadata)
  E'DISPUTED IDENTITY: This profile documents a POSSIBLE SECOND individual named "Aberrê" distinct from the well-documented Antônio Raimundo Argolo of Salvador (1895-1942). Key evidence: (1) Different full names - Raimundo Argolo vs Rufino dos Santos; (2) Caiçara''s direct testimony distinguishing "José Rufino" (his teacher) from "José Raimundo" (Pastinha''s Aberrê); (3) Different origins - Salvador vs Santo Amaro; (4) Both Canjiquinha and Caiçara denied Pastinha lineage. Sources: velhosmestres.com/br/destaques-27 (identifies teacher as "M Aberré de Santo Amaro (Antônio Rufino dos Santos)"), decapoeira.org, ipcb-rj.com.br/?p=617 (discusses controversy), esquiva.wordpress.com. Birth year estimated based on teaching timeline (1938). Death date unknown. Uses apelido_context="Santo Amaro" to distinguish from Salvador Aberrê. Confidence: DISPUTED - treat as likely but unverified separate person.',
  -- notes_pt
  E'IDENTIDADE DISPUTADA: Este perfil documenta um POSSÍVEL SEGUNDO indivíduo chamado "Aberrê" distinto do bem documentado Antônio Raimundo Argolo de Salvador (1895-1942). Evidências principais: (1) Nomes completos diferentes - Raimundo Argolo vs Rufino dos Santos; (2) Testemunho direto de Caiçara distinguindo "José Rufino" (seu professor) de "José Raimundo" (Aberrê de Pastinha); (3) Origens diferentes - Salvador vs Santo Amaro; (4) Tanto Canjiquinha quanto Caiçara negaram linhagem de Pastinha. Fontes: velhosmestres.com/br/destaques-27 (identifica professor como "M Aberré de Santo Amaro (Antônio Rufino dos Santos)"), decapoeira.org, ipcb-rj.com.br/?p=617 (discute controvérsia), esquiva.wordpress.com. Ano de nascimento estimado com base na linha do tempo de ensino (1938). Data de morte desconhecida. Usa apelido_context="Santo Amaro" para distinguir do Aberrê de Salvador. Confiança: DISPUTADA - tratar como provavelmente uma pessoa separada mas não verificada.'
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

-- Source: entities/persons/americano.sql (NEW)
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

-- Source: entities/persons/andre-jansen.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: André Jansen
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION: Unknown. Active as championship-level
-- capoeirista and professional goalkeeper in 1935-1940s. If he
-- was 25-35 during peak activity (1935-1945), birth would be
-- approximately 1900-1920. Using decade precision for 1910.
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
  'André Jansen',
  NULL,  -- No formal capoeira title in carioca tradition
  NULL,  -- No portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/']::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'André Jansen practiced capoeira carioca under Mestre Sinhozinho, a combat-focused style distinct from both Angola and Regional. His training emphasized fighting effectiveness, incorporating elements of boxing, Greco-Roman wrestling, and other martial arts. The style stripped away music and ritual in favor of pure combat technique.',
  E'André Jansen praticou capoeira carioca sob Mestre Sinhozinho, um estilo focado em combate distinto tanto do Angola quanto da Regional. Seu treinamento enfatizava eficácia no combate, incorporando elementos de boxe, luta greco-romana e outras artes marciais. O estilo eliminava música e rituais em favor da técnica de combate pura.',
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  NULL,  -- Birth place unknown, likely Rio de Janeiro
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'André Jansen was the foremost fighter of Mestre Sinhozinho''s first generation of students. A goalkeeper for Botafogo Football Club, he simultaneously held the title of champion of capoeiragem in Rio de Janeiro (campeão carioca de capoeiragem). The Rio press considered him "the absolute master of Brazilian fighting" (mestre absoluto da luta brasileira) and "the best capoeira of his time in Brazil."

Jansen traveled throughout Brazil during the 1940s demonstrating the effectiveness of his martial art. His reputation was such that he became one of the most recognized names in Brazilian combat sports of that era.

On October 30, 1935, Jansen participated in a landmark event at Parque Boa Vista in Salvador, Bahia. Promoters of a major boxing event invited him to inaugurate the presentations in a confrontation with Ricardo Nibbon, a student of George Gracie who held titles in jiu-jitsu and catch-as-catch-can wrestling. As a preliminary to Jansen''s bout, Mestre Bimba and his students demonstrated their Bahian Regional fighting style (Luta Regional Baiana) to the public—one of the earliest documented public exhibitions of what would become Capoeira Regional.

This Salvador event represented a significant moment in capoeira history: the encounter between the established Rio de Janeiro tradition of capoeiragem carioca and the emerging Bahian Regional style. Jansen embodied Sinhozinho''s combat-focused approach to capoeira—stripped of music and ritual, mixed with techniques from wrestling and boxing, and trained for effectiveness in actual fighting.

Jansen was among the prominent students who trained at Sinhozinho''s academies in Ipanema, alongside names like Rudolf Hermanny (judo champion and World Cup football coach), Luiz "Cirandinha" Pereira Aguiar (weightlifter and capoeira champion), Antonio Carlos "Tom" Jobim (legendary Bossa Nova musician), and Olympic Committee president Sylvio de Magalhães Padilha.',
  -- bio_pt
  E'André Jansen foi o principal lutador da primeira geração de alunos de Mestre Sinhozinho. Goleiro do Botafogo Football Club, ele simultaneamente detinha o título de campeão carioca de capoeiragem. A imprensa carioca o considerava "o mestre absoluto da luta brasileira" e "o melhor capoeira de sua época no Brasil."

Jansen viajou pelo Brasil durante a década de 1940 demonstrando a eficácia de sua arte marcial. Sua reputação era tal que ele se tornou um dos nomes mais reconhecidos nos esportes de combate brasileiros daquela época.

Em 30 de outubro de 1935, Jansen participou de um evento marcante no Parque Boa Vista em Salvador, Bahia. Promotores de um grande evento de boxe o convidaram para inaugurar as apresentações em um confronto com Ricardo Nibbon, um aluno de George Gracie que detinha títulos em jiu-jitsu e luta livre. Como preliminar à luta de Jansen, Mestre Bimba e seus alunos demonstraram seu estilo de Luta Regional Baiana ao público—uma das primeiras exibições públicas documentadas do que se tornaria a Capoeira Regional.

Este evento em Salvador representou um momento significativo na história da capoeira: o encontro entre a tradição estabelecida da capoeiragem carioca do Rio de Janeiro e o estilo Regional baiano emergente. Jansen personificava a abordagem focada em combate de Sinhozinho para a capoeira—despojada de música e ritual, misturada com técnicas de luta livre e boxe, e treinada para eficácia em combate real.

Jansen estava entre os alunos proeminentes que treinaram nas academias de Sinhozinho em Ipanema, ao lado de nomes como Rudolf Hermanny (campeão de judô e técnico da Copa do Mundo), Luiz "Cirandinha" Pereira Aguiar (halterofilista e campeão de capoeira), Antonio Carlos "Tom" Jobim (lendário músico da Bossa Nova), e o presidente do Comitê Olímpico Sylvio de Magalhães Padilha.',
  -- achievements_en
  'Champion of capoeiragem in Rio de Janeiro (campeão carioca de capoeiragem); Considered by the Rio press "the absolute master of Brazilian fighting" and "the best capoeira of his time in Brazil"; Goalkeeper of Botafogo Football Club; Toured multiple Brazilian states demonstrating capoeira''s fighting effectiveness; Participated in landmark 1935 Salvador event alongside Mestre Bimba''s first public Regional exhibition',
  -- achievements_pt
  'Campeão carioca de capoeiragem; Considerado pela imprensa carioca "o mestre absoluto da luta brasileira" e "o melhor capoeira de sua época no Brasil"; Goleiro do Botafogo Football Club; Percorreu vários estados brasileiros demonstrando a eficácia da capoeira como luta; Participou do evento histórico de 1935 em Salvador ao lado da primeira exibição pública da Regional de Mestre Bimba',
  -- Researcher notes (English)
  E'BIRTH YEAR: Unknown. Estimated ~1910 (decade precision) based on peak activity in 1935-1940s. If he was 25-35 during his championship period, he would have been born between approximately 1900-1920.

DEATH YEAR: Unknown. No death date found in any source.

BOTAFOGO CONNECTION: Multiple sources confirm he was a goalkeeper for Botafogo Football Club. However, he does not appear in the documented roster of famous Botafogo goalkeepers from 1930-1940 (Roberto Gomes Pedrosa, Germano, Aymoré Moreira). This could indicate he was a reserve goalkeeper, played briefly, or that the "Botafogo" reference is to a different period or role.

FIRST GENERATION: Sources explicitly state André Jansen was "the highlight of this first generation" trained by Sinhozinho. This distinguishes him from Rudolf Hermanny, who was "the highlight of the last generation."

1935 SALVADOR EVENT: The October 30, 1935 event at Parque Boa Vista is significant as it brought together Rio''s capoeira carioca tradition (via Jansen) with Salvador''s emerging Regional style (via Bimba''s exhibition). Jansen''s opponent Ricardo Nibbon was a jiu-jitsu practitioner, not a capoeirista.

TITLE: No formal capoeira title. Capoeira carioca did not use the title system that developed in Bahia.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-sinhozinho-1891-1962/ (primary)
- rohermanny.tripod.com
- recantodasletras.com.br/artigos-de-esporte/7260229
- Existing sinhozinho.sql in genealogy database',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: Desconhecido. Estimado ~1910 (precisão de década) baseado na atividade de pico em 1935-1940. Se tinha 25-35 anos durante seu período de campeonato, teria nascido entre aproximadamente 1900-1920.

ANO DE MORTE: Desconhecido. Nenhuma data de morte encontrada em qualquer fonte.

CONEXÃO COM BOTAFOGO: Múltiplas fontes confirmam que ele era goleiro do Botafogo Football Club. No entanto, ele não aparece na lista documentada de goleiros famosos do Botafogo de 1930-1940 (Roberto Gomes Pedrosa, Germano, Aymoré Moreira). Isso pode indicar que era goleiro reserva, jogou brevemente, ou que a referência "Botafogo" é de um período ou função diferente.

PRIMEIRA GERAÇÃO: Fontes afirmam explicitamente que André Jansen era "o destaque desta primeira geração" treinada por Sinhozinho. Isso o distingue de Rudolf Hermanny, que era "o destaque da última geração."

EVENTO DE SALVADOR 1935: O evento de 30 de outubro de 1935 no Parque Boa Vista é significativo pois reuniu a tradição da capoeira carioca do Rio (via Jansen) com o estilo Regional emergente de Salvador (via exibição de Bimba). O oponente de Jansen, Ricardo Nibbon, era praticante de jiu-jitsu, não capoeirista.

TÍTULO: Sem título formal de capoeira. A capoeira carioca não usava o sistema de títulos que se desenvolveu na Bahia.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-sinhozinho-1891-1962/ (primária)
- rohermanny.tripod.com
- recantodasletras.com.br/artigos-de-esporte/7260229
- sinhozinho.sql existente no banco de dados de genealogia'
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

-- Source: entities/persons/antonio-boca-de-porco.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Antônio Boca de Porco
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Antônio Boca de Porco
-- was likely an established practitioner by that time (age 25-40). This
-- suggests a birth year around 1880-1900. Using mid-point estimate with
-- decade precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Antônio',
  'Boca de Porco',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Antônio Boca de Porco ("Pig Mouth") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nBoca de Porco worked as a stevedore (estivador) - a dock worker who loaded and unloaded ships at Salvador''s busy port. This occupation was common among capoeiristas of his era, as the physically demanding work of the docks attracted strong, skilled fighters. The nickname "Boca de Porco" ("Pig Mouth") was distinctive and memorable, though the origin of this apelido has not been documented.\n\nMestre Noronha, in his handwritten manuscripts (completed April 29, 1976, later published as "O ABC da Capoeira Angola" in 1993), specifically listed "Antonio Boca de Porco stevedore" among the founding mestres of what he called "the first capoeira centre of the State of Bahia." The inclusion of his occupation alongside his name in Noronha''s careful documentation suggests it was an important part of his identity within the capoeira community.\n\nBoca de Porco was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s eventual assumption of leadership and the transformation of the center into the internationally famous CECA (Centro Esportivo de Capoeira Angola).\n\nNo further biographical details about Antônio Boca de Porco have been documented.',
  E'Antônio Boca de Porco ("Boca de Porco") foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nBoca de Porco trabalhava como estivador - um trabalhador portuário que carregava e descarregava navios no movimentado porto de Salvador. Esta ocupação era comum entre os capoeiristas de sua época, pois o trabalho fisicamente exigente das docas atraía lutadores fortes e habilidosos. O apelido "Boca de Porco" era distintivo e memorável, embora a origem deste apelido não tenha sido documentada.\n\nMestre Noronha, em seus manuscritos escritos à mão (concluídos em 29 de abril de 1976, posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou especificamente "Antonio Boca de Porco estivador" entre os mestres fundadores do que chamou de "o primeiro centro de capoeira do Estado da Bahia". A inclusão de sua ocupação junto ao seu nome na cuidadosa documentação de Noronha sugere que era uma parte importante de sua identidade dentro da comunidade de capoeira.\n\nBoca de Porco esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à eventual assunção da liderança por Pastinha e à transformação do centro no internacionalmente famoso CECA (Centro Esportivo de Capoeira Angola).\n\nNenhum outro detalhe biográfico sobre Antônio Boca de Porco foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. First name "Antônio" known. Worked as stevedore (dock worker) at Salvador''s port. The nickname "Boca de Porco" means "Pig Mouth" - origin of nickname not documented. No death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Primeiro nome "Antônio" conhecido. Trabalhava como estivador no porto de Salvador. O apelido "Boca de Porco" - origem do apelido não documentada. Nenhuma data de falecimento documentada. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/antonio-corro.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Antônio Corró
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR: 1870 - Confirmed by velhosmestres.com
-- This places his birth during slavery in Brazil (Lei Áurea 1888).
-- As an ex-slave born in 1870, he would have been 18 at abolition.
--
-- DEATH YEAR: Unknown. When he began teaching Paraná in 1932,
-- he was 62 years old. Given his age and the fact that Paraná
-- left for Rio in 1945, Corró likely died in the late 1930s or
-- early 1940s, but no documentation confirms this.
--
-- SIGNIFICANCE: Layer Zero proto-mestre. One of the last
-- generation of capoeiristas born into slavery who transmitted
-- the art to the 20th century masters. His only documented
-- student, Mestre Paraná, became one of four founding lineages
-- of Contemporary Capoeira in Rio de Janeiro.
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
  NULL,  -- Full name unknown
  'Antônio Corró',
  NULL::genealogy.title,  -- Formal titles did not exist in this era
  NULL,  -- No known photographs
  ARRAY[
    'https://velhosmestres.com/br/destaques-14'
  ]::text[],
  -- Capoeira-specific
  NULL::genealogy.style,  -- Angola/Regional distinction came later
  NULL,
  NULL,
  -- Life dates
  1870,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',  -- Inferred from work location and slavery context
  NULL,  -- Death year unknown
  NULL::genealogy.date_precision,
  NULL,
  -- Extended content (English)
  E'Antônio Corró was born in 1870, during the final decades of slavery in Brazil. He was an enslaved person who gained freedom either through manumission or the Lei Áurea (Golden Law) of 1888, when he would have been eighteen years old. He was illiterate, as was common for the enslaved population denied access to education.

Corró worked as a cart driver (carroceiro) at the Cais Dourado in Salvador—a location that in the late 19th and early 20th centuries was legendary as a gathering point for capoeiristas. The Cais Dourado and the surrounding Pilar district were zones of commerce, maritime labor, and notoriously, capoeira. Stevedores, dock workers, and saveiristas congregated there, and the area witnessed frequent clashes between capoeiristas and police under the persecution of figures like José Alvaro Cova.

In 1932, when Corró was sixty-two years old, he began teaching capoeira to young Oswaldo Lisboa dos Santos—later known as Mestre Paraná—in the Alto das Pombas neighborhood, in the Federação district of Salvador. This places Corró among the last generation of capoeiristas who had been born into slavery and who transmitted the art to what would become the modern era.

Corró''s fate after the early 1930s is undocumented. When Mestre Paraná left Salvador for Rio de Janeiro in February 1945, Corró would have been seventy-five years old, if still alive. No record of his death has been found.

Though Corró left almost no historical trace beyond the testimony of his student, his legacy endures through Mestre Paraná, who became one of the four founding lineages of Contemporary Capoeira in Rio de Janeiro. Through Paraná, Corró''s lineage extends to Grupo Muzenza and countless practitioners worldwide. He represents the anonymous layer of African and Afro-Brazilian ancestors who preserved and transmitted capoeira through the era of criminalization and persecution.',
  -- Extended content (Portuguese)
  E'Antônio Corró nasceu em 1870, durante as últimas décadas da escravidão no Brasil. Foi uma pessoa escravizada que obteve liberdade seja por alforria ou pela Lei Áurea de 1888, quando teria dezoito anos de idade. Era analfabeto, como era comum para a população escravizada privada de acesso à educação.

Corró trabalhava como carroceiro no Cais Dourado em Salvador—um local que no final do século XIX e início do século XX era lendário como ponto de encontro de capoeiristas. O Cais Dourado e o entorno do bairro do Pilar eram zonas de comércio, trabalho marítimo e, notoriamente, capoeira. Estivadores, trabalhadores portuários e saveiristas se congregavam ali, e a área testemunhou frequentes confrontos entre capoeiristas e a polícia sob a perseguição de figuras como José Alvaro Cova.

Em 1932, quando Corró tinha sessenta e dois anos, começou a ensinar capoeira ao jovem Oswaldo Lisboa dos Santos—mais tarde conhecido como Mestre Paraná—no bairro do Alto das Pombas, na região da Federação em Salvador. Isso posiciona Corró entre a última geração de capoeiristas que havia nascido na escravidão e que transmitiu a arte para o que se tornaria a era moderna.

O destino de Corró após o início dos anos 1930 não está documentado. Quando Mestre Paraná deixou Salvador rumo ao Rio de Janeiro em fevereiro de 1945, Corró teria setenta e cinco anos, se ainda estivesse vivo. Nenhum registro de sua morte foi encontrado.

Embora Corró tenha deixado quase nenhum vestígio histórico além do testemunho de seu aluno, seu legado perdura através de Mestre Paraná, que se tornou uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro. Através de Paraná, a linhagem de Corró se estende ao Grupo Muzenza e incontáveis praticantes pelo mundo. Ele representa a camada anônima de ancestrais africanos e afro-brasileiros que preservaram e transmitiram a capoeira através da era de criminalização e perseguição.',
  -- Achievements (English)
  E'- Teacher of Mestre Paraná, one of four founding lineages of Contemporary Capoeira in Rio de Janeiro
- One of the last generation of capoeiristas born into slavery
- Transmitted capoeira across the transition from criminalization (1890) to legalization (1930s)',
  -- Achievements (Portuguese)
  E'- Mestre de Mestre Paraná, uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro
- Uma das últimas gerações de capoeiristas nascidos na escravidão
- Transmitiu a capoeira através da transição da criminalização (1890) à legalização (anos 1930)',
  -- Researcher notes (English)
  E'BIRTH YEAR: 1870 - Per velhosmestres.com and capoeiranews.com.br, confirmed as exact.
Born during slavery (Lei Áurea 1888 = abolition).

DEATH YEAR: Unknown. He was 62 in 1932 when he began teaching Paraná.
If alive when Paraná left in 1945, he would have been 75.
No death records found.

WORK LOCATION: Cais Dourado, Salvador
- This was a legendary gathering point for capoeiristas in late 19th/early 20th century
- Zone of commerce, dock workers, stevedores, saveiristas
- Witnessed frequent conflicts between capoeiristas and police
- Connected to figures like Besouro, Tico, Caboclinho, Pedro Porreta

TEACHING LOCATION: Alto das Pombas, Federação neighborhood, Salvador
- Also the birth neighborhood of Mestre Paraná

KNOWN STUDENTS:
- Mestre Paraná (Oswaldo Lisboa dos Santos) - began 1932

TEACHERS: Unknown
- Corró was born in 1870, so he likely learned capoeira in the 1880s-1890s
- During this period, capoeira was criminalized (1890 Penal Code)
- His teachers would have been born around 1830-1850, during slavery

TITLE: NULL - Formal titles like "mestre" did not exist in the modern sense
during Corró''s active years. He is described as teaching Paraná, but
without the organizational structure of later academies.

STYLE: NULL - The Angola/Regional distinction emerged in the 1930s with
Mestre Bimba''s Capoeira Regional. Corró''s capoeira predated this divide.

NAME NOTE: Sometimes spelled "Corró" with accent, sometimes "Corro" without.
Using "Antônio Corró" as the standardized form.

SOURCES:
- velhosmestres.com/br/destaques-14 (primary)
- capoeiranews.com.br/2021/04/mestre-parana-1922-1972.html
- capoeirahistory.com/mestre/master-parana-1922-1972/',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: 1870 - Conforme velhosmestres.com e capoeiranews.com.br, confirmado como exato.
Nascido durante a escravidão (Lei Áurea 1888 = abolição).

ANO DE FALECIMENTO: Desconhecido. Tinha 62 anos em 1932 quando começou a ensinar Paraná.
Se estivesse vivo quando Paraná partiu em 1945, teria 75 anos.
Nenhum registro de óbito encontrado.

LOCAL DE TRABALHO: Cais Dourado, Salvador
- Era um lendário ponto de encontro de capoeiristas no final do século XIX/início do XX
- Zona de comércio, trabalhadores portuários, estivadores, saveiristas
- Testemunhou frequentes conflitos entre capoeiristas e polícia
- Conectado a figuras como Besouro, Tico, Caboclinho, Pedro Porreta

LOCAL DE ENSINO: Alto das Pombas, bairro da Federação, Salvador
- Também o bairro de nascimento de Mestre Paraná

ALUNOS CONHECIDOS:
- Mestre Paraná (Oswaldo Lisboa dos Santos) - começou em 1932

MESTRES: Desconhecidos
- Corró nasceu em 1870, então provavelmente aprendeu capoeira nos anos 1880-1890
- Durante este período, capoeira era criminalizada (Código Penal de 1890)
- Seus mestres teriam nascido por volta de 1830-1850, durante a escravidão

TÍTULO: NULL - Títulos formais como "mestre" não existiam no sentido moderno
durante os anos ativos de Corró. Ele é descrito como ensinando Paraná, mas
sem a estrutura organizacional das academias posteriores.

ESTILO: NULL - A distinção Angola/Regional surgiu nos anos 1930 com a
Capoeira Regional de Mestre Bimba. A capoeira de Corró precedeu esta divisão.

NOTA SOBRE O NOME: Às vezes escrito "Corró" com acento, às vezes "Corro" sem.
Usando "Antônio Corró" como forma padronizada.

FONTES:
- velhosmestres.com/br/destaques-14 (primária)
- capoeiranews.com.br/2021/04/mestre-parana-1922-1972.html
- capoeirahistory.com/mestre/master-parana-1922-1972/'
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

-- Source: entities/persons/antonio-galindeu.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Antônio Galindeu (Antonio Galindo)
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- Galindeu died at 80 years old. If active as a founding mestre of Gengibirra
-- in the 1920s (age 30-40), death around 1940s-1950s suggests birth around
-- 1860-1870. However, if he was older at Gengibirra's founding (age 50-60),
-- he could have been born around 1870-1880. Using the information that he
-- died at 80 years old and was an established mestre by 1920s, estimating
-- birth year at ~1860 with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Antônio',
  'Galindeu',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1860,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Antônio Galindeu, also known as Antonio Galindo, was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nGalindeu was described as "velho mestre do passado, praticante de ritos africanos" (old master of the past, practitioner of African rites), indicating his deep connection to African spiritual traditions. He was particularly respected in the Cabrito region of the Recôncavo Baiano, where he had a large following among devotees of Iansã (Oyá), the Yoruba orisha of winds, storms, and transformation.\n\nAccording to Mestre Noronha''s manuscripts, Galindeu organized the annual Yemanjá celebrations held on February 2nd in Cabrito. These festivities were major community events where a platform would be set up in the churchyard, and the celebrations included samba, batuque, and capoeira, lasting for three days. Galindeu''s role as organizer of these events demonstrates his standing as a community leader who bridged capoeira, African spiritual practices, and popular culture.\n\nGalindeu lived to be eighty years old, making him one of the elder statesmen among the Gengibirra founders. His longevity and respect in both the capoeira and religious communities of the Recôncavo made him an important bridge between generations of practitioners.',
  E'Antônio Galindeu, também conhecido como Antonio Galindo, foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nGalindeu foi descrito como "velho mestre do passado, praticante de ritos africanos", indicando sua profunda conexão com as tradições espirituais africanas. Ele era particularmente respeitado na região de Cabrito no Recôncavo Baiano, onde tinha grande número de seguidores entre os devotos de Iansã (Oyá), a orixá iorubá dos ventos, tempestades e transformação.\n\nSegundo os manuscritos de Mestre Noronha, Galindeu organizava as celebrações anuais de Yemanjá realizadas no dia 2 de fevereiro em Cabrito. Essas festividades eram grandes eventos comunitários onde um tablado era montado no adro da igreja, e as celebrações incluíam samba, batuque e capoeira, durando três dias. O papel de Galindeu como organizador desses eventos demonstra sua posição como líder comunitário que conectava a capoeira, as práticas espirituais africanas e a cultura popular.\n\nGalindeu viveu até os oitenta anos de idade, tornando-se um dos veteranos mais velhos entre os fundadores do Gengibirra. Sua longevidade e respeito tanto nas comunidades de capoeira quanto religiosas do Recôncavo fizeram dele uma importante ponte entre gerações de praticantes.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia. Respected spiritual leader and organizer of major cultural celebrations in Cabrito, Recôncavo Baiano.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia. Respeitado líder espiritual e organizador de grandes celebrações culturais em Cabrito, Recôncavo Baiano.',
  E'Birth year estimated at ~1860 (decade precision) based on dying at age 80 and being an established mestre by 1920s. Also known as "Antonio Galindo" (spelling variation). First name "Antônio" is known. Recognized as "velho mestre do passado, praticante de ritos africanos" with strong following among Iansã devotees in Cabrito. Organized annual Yemanjá celebrations on February 2nd in Cabrito featuring samba, batuque, and capoeira lasting three days. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1860 (precisão de década) baseado no fato de ter falecido aos 80 anos e ser um mestre estabelecido na década de 1920. Também conhecido como "Antonio Galindo" (variação ortográfica). Primeiro nome "Antônio" é conhecido. Reconhecido como "velho mestre do passado, praticante de ritos africanos" com grande número de seguidores entre os devotos de Iansã em Cabrito. Organizava celebrações anuais de Yemanjá em 2 de fevereiro em Cabrito com samba, batuque e capoeira durando três dias. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/artur-emidio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Artur Emídio
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH DATE: March 31, 1930 - Confirmed by velhosmestres.com
-- DEATH DATE: May 3, 2011 - Confirmed by velhosmestres.com and
-- Portal Capoeira death notice.
--
-- STYLE: Regional - Trained in systematized Bahian capoeira from
-- Mestre Paizinho (Teodoro Ramos), who was a student of Mestre
-- Neném (African origin). Artur Emídio's teaching was described
-- as based on "the systematized method of Mestre Bimba," though
-- he was not a direct student of Bimba.
--
-- LINEAGE: Neném (African) → Paizinho (Teodoro Ramos) → Artur Emídio
--
-- SIGNIFICANCE: Pioneer of capoeira in Rio de Janeiro; established
-- one of the first formal capoeira academies in Rio (1955); key
-- lineage figure whose Sunday rodas were meeting points for
-- capoeiristas of all styles; pioneer of international capoeira
-- touring (1950s-60s); vale-tudo fighter defending capoeira in
-- the rings.
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
  'Artur Emídio de Oliveira',
  'Artur Emídio',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
    'https://velhosmestres.com/en/featured-69'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Artur Emídio was renowned for exceptional speed and efficiency - colleagues nicknamed his approach "the bolt" (o raio) for its quickness and directness. His capoeira combined the systematized Bahian method learned from Mestre Paizinho with practical fighting techniques acquired through his vale-tudo career. He briefly trained at the Gracie academy in Rio to supplement his ground game after his initial defeat. His Sunday rodas at Academia Artur Emídio were deliberately eclectic, welcoming mestres from all styles - Paraná, Mucungê, and others played in his orchestra. This fusion environment was crucial to the development of Contemporary Capoeira in Rio de Janeiro.',
  E'Artur Emídio era reconhecido pela velocidade e eficiência excepcionais - colegas apelidaram sua abordagem de "o raio" por sua rapidez e objetividade. Sua capoeira combinava o método sistematizado baiano aprendido com Mestre Paizinho com técnicas práticas de luta adquiridas em sua carreira de vale-tudo. Treinou brevemente na academia Gracie no Rio para complementar seu jogo de chão após sua derrota inicial. Suas rodas de domingo na Academia Artur Emídio eram deliberadamente ecléticas, recebendo mestres de todos os estilos - Paraná, Mucungê e outros tocavam em sua orquestra. Esse ambiente de fusão foi crucial para o desenvolvimento da Capoeira Contemporânea no Rio de Janeiro.',
  -- Life dates
  1930,
  'exact'::genealogy.date_precision,
  'Itabuna, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Artur Emídio de Oliveira was born on March 31, 1930, in Itabuna, southern Bahia, where his parents worked as farmers. He grew up in a modest house on Rua Direita in the Pontalzinho neighborhood and completed secondary school there. At age seven, in a time when capoeira was prohibited by law and considered a criminal offense, he began learning "in the street, on the pavement" from his master Teodoro Ramos, known as Paizinho, who would wake him at six each morning to train. Paizinho was a disciple of Mestre Neném, a capoeirista of African origin.

In his own recounting: "The practice of Capoeira was prohibited. They trained on top of hills, in alleyways, at night and always hidden. Many were the times that my Master was arrested. But the next day the bail was paid, and he would leave. And at night, he would return to teach Capoeira, practiced for love!"

When Paizinho died in 1945, the fifteen-year-old Artur took over his master''s academy. Despite his youth, he began teaching Paizinho''s former students and quickly gained recognition, even receiving visiting students from Salvador. Various legends surrounded Paizinho''s death - some claimed he died trying to fly from a coconut tree using palm leaves as wings, like Icarus. According to Artur Emídio, Paizinho actually died of meningitis.

By his early twenties, Artur delighted audiences at circuses and amusement parks in Itabuna with "luta livre" demonstrations. His ambition was to showcase "the value of the national fight" - capoeira. In 1953, he left Itabuna for São Paulo to fight Edgar Duro, a luta livre fighter, and won. On June 29, 1953, he faced Rudolf Hermanny, a student of Mestre Sinhozinho, in a bout fought under Burlamaqui''s capoeira rules with groundwork modifications. Hermanny''s aggression proved decisive - he knocked Artur down multiple times with kicks, landed a rasteira, and delivered a decisive stomp. The referee stopped the fight before a full knockout.

In 1954, Artur traveled to Rio de Janeiro to fight Hélio Gracie in a match that ended in a draw. After his defeat to Hermanny, he frequented the Gracie academy in Rio and learned jiu-jitsu techniques to complement his capoeira. In 1955, he moved permanently to Rio de Janeiro with his family.

In Rio, Artur established his school above the Rio Novo pharmacy at Avenida dos Democraticos 1313, where he also worked as a masseur - famously treating Miss Brazil contestant Martha Rocha in 1954. He then founded the Academia de Capoeira Artur Emídio on Rua Manuel Fontenele, near Higienópolis in the Bonsucesso neighborhood - one of the first formal capoeira academies in the city.

The most celebrated fight of his ring career came on April 13, 1957 (some sources say April 10), against Robson Gracie at Maracanãzinho. Artur had declared he would "do with Robson what Waldemar did with Hélio," showing confidence in capoeira''s effectiveness. The Diário Carioca reported that Artur was "brought to the ground at the very beginning" and subjected to "strangling from behind." The fight lasted only four minutes before Robson''s submission victory.

After this defeat, friends encouraged him to focus on teaching. His first student was Djalma Bandeira, who became a travel companion with whom Artur refined his skills. The Sunday roda at his academy became legendary - a meeting point where mestres from all over Brazil congregated. As Mestre Paulão recalled: "Masters from all over Brazil came to the roda of Artur Emídio... here the suburbs, the northern and the southern zones congregated, it was an eclectic capoeira." Excellent berimbau players like Mestres Paraná and Mucungê joined his orchestra.

With his student Djalma Bandeira, Artur performed in the folkloric show "Skindô." The cultural entrepreneur Abraham Medina engaged them for a show featuring the romantic singer Nelson Gonçalves that toured New York, Paris, Acapulco, and Buenos Aires. Artur Emídio is likely the first capoeirista to perform abroad, pioneering capoeira in the United States, France, Uruguay, and Argentina during the 1950s and early 1960s. Other famous shows included "Capital Samba" and the musical "Arco-Íris," featuring artists like Joãozinho da Goméia, Ary Barroso, and Mestre Paraná.

From the 1960s onward, Artur abandoned the ring and dedicated himself exclusively to capoeira. He gave displays throughout Rio, judged competitions including the famous Berimbau de Ouro, and became involved with the Cariocan Federation of Pugilism, which began institutionalizing capoeira. In 1987, he participated in an event with Bahian old masters at Circo Voador in Rio. In 1967, he and Mestre Bimba were photographed together at a capoeira symposium at Campos dos Afonsos in Rio - Artur later spoke of their "somewhat conflictual relationship."

He trained many students who became important masters: Leopoldina (from ~1954), Djalma Bandeira, Paulo Gomes, Mendonça, Celso do Engenho da Rainha, Vilela, Vilmar, and Roberval Serejo. Mestre Paulo Gomes, also from Itabuna, later founded ABRACAP (Capoeira Association of Brazil) in 1985 and advised São Paulo Governor Mário Covas on capoeira legislation.

Artur Emídio was part of a generation born in the 1930s that formed the core of contemporary Rio de Janeiro capoeira, alongside Leopoldina, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes, and Celso do Engenho. There is consensus that four lineages were the main influences on Contemporary Capoeira in Rio: Artur Emídio, Paraná, Mário Buscapé, and Roque.

An arthrosis in his left knee eventually prevented him from continuing to play and teach. He died on the afternoon of May 3, 2011, in Rio de Janeiro, at age 81. Portal Capoeira''s death notice declared: "Rio de Janeiro''s capoeira lost its greatest personality." The old guard of capoeira, in Rio and Bahia, knew that Artur was one of the greatest talents of all time. As his contemporaries said: "He did for capoeira what, to this day, all of us together still have not done."

A documentary film "From the Ring to the Stage" about his life, directed by Roberto Pereira and Ricardo Pereira, began recording in 2018 and was completed in 2023. Masters Genaro (1934-2022) and Polaco (1949-2021) provided testimonies before their deaths.',
  -- Extended content (Portuguese)
  E'Artur Emídio de Oliveira nasceu em 31 de março de 1930, em Itabuna, sul da Bahia, onde seus pais trabalhavam como fazendeiros. Cresceu em uma casa modesta na Rua Direita, no bairro do Pontalzinho, e completou o ensino secundário ali. Aos sete anos, em uma época em que a capoeira era proibida por lei e considerada infração penal, começou a aprender "na rua, no passeio" com seu mestre Teodoro Ramos, conhecido como Paizinho, que o acordava às seis da manhã para treinar. Paizinho era discípulo de Mestre Neném, um capoeirista de origem africana.

Em seu próprio relato: "A prática da Capoeira era proibida. Treinavam no alto dos morros, nos becos, à noite e sempre escondidos. Muitas foram as vezes que meu Mestre foi preso. Mas no dia seguinte a fiança era paga, e ele saía. E à noite, voltava a ensinar Capoeira, praticada por amor!"

Quando Paizinho morreu em 1945, o jovem Artur de quinze anos assumiu a academia de seu mestre. Apesar da pouca idade, começou a ensinar os antigos alunos de Paizinho e rapidamente ganhou reconhecimento, recebendo até alunos visitantes de Salvador. Várias lendas cercavam a morte de Paizinho - alguns afirmavam que ele morreu tentando voar de um coqueiro usando folhas de palmeira como asas, como Ícaro. Segundo Artur Emídio, Paizinho morreu de meningite.

Por volta dos vinte anos, Artur encantava plateias de circos e parques de diversões em Itabuna com demonstrações de "luta livre". Sua ambição era mostrar "o valor da luta nacional" - a capoeira. Em 1953, saiu de Itabuna para São Paulo para lutar contra Edgar Duro, lutador de luta livre, e venceu. Em 29 de junho de 1953, enfrentou Rudolf Hermanny, aluno de Mestre Sinhozinho, em uma luta disputada sob as regras de capoeira de Burlamaqui com modificações para luta no chão. A agressividade de Hermanny foi decisiva - derrubou Artur várias vezes com chutes, aplicou uma rasteira e desferiu um pisão decisivo. O árbitro parou a luta antes do nocaute completo.

Em 1954, Artur viajou ao Rio de Janeiro para lutar contra Hélio Gracie em uma luta que terminou empatada. Após sua derrota para Hermanny, frequentou a academia Gracie no Rio e aprendeu técnicas de jiu-jitsu para complementar sua capoeira. Em 1955, mudou-se permanentemente para o Rio de Janeiro com sua família.

No Rio, Artur estabeleceu sua escola acima da farmácia Rio Novo na Avenida dos Democraticos 1313, onde também trabalhava como massagista - atendendo famosamente a candidata a Miss Brasil Martha Rocha em 1954. Em seguida, fundou a Academia de Capoeira Artur Emídio na Rua Manuel Fontenele, perto de Higienópolis no bairro de Bonsucesso - uma das primeiras academias formais de capoeira da cidade.

A luta mais célebre de sua carreira nos ringues foi em 13 de abril de 1957 (algumas fontes dizem 10 de abril), contra Robson Gracie no Maracanãzinho. Artur havia declarado que faria "com Robson o que Waldemar fez com Hélio," demonstrando confiança na eficácia da capoeira. O Diário Carioca relatou que Artur foi "levado ao chão logo no início" e submetido a "estrangulamento por trás." A luta durou apenas quatro minutos antes da vitória por finalização de Robson.

Após essa derrota, amigos o encorajaram a se concentrar no ensino. Seu primeiro aluno foi Djalma Bandeira, que se tornou um companheiro de viagem com quem Artur aprimorou suas habilidades. A roda de domingo em sua academia tornou-se lendária - um ponto de encontro onde mestres de todo o Brasil se reuniam. Como Mestre Paulão lembrou: "Mestres de todo o Brasil vinham à roda de Artur Emídio... aqui se congregavam os subúrbios, as zonas norte e sul, era uma capoeira eclética." Excelentes tocadores de berimbau como Mestres Paraná e Mucungê participavam de sua orquestra.

Com seu aluno Djalma Bandeira, Artur se apresentou no show folclórico "Skindô." O empresário cultural Abraham Medina os contratou para um show com o cantor romântico Nelson Gonçalves que excursionou por Nova York, Paris, Acapulco e Buenos Aires. Artur Emídio é provavelmente o primeiro capoeirista a se apresentar no exterior, sendo pioneiro da capoeira nos Estados Unidos, França, Uruguai e Argentina durante os anos 1950 e início dos 1960. Outros shows famosos incluíram "Capital Samba" e o musical "Arco-Íris," com artistas como Joãozinho da Goméia, Ary Barroso e Mestre Paraná.

A partir dos anos 1960, Artur abandonou os ringues e se dedicou exclusivamente à capoeira. Fazia apresentações por todo o Rio, atuava como juiz em competições incluindo o famoso Berimbau de Ouro, e envolveu-se com a Federação Carioca de Pugilismo, que começou a institucionalizar a capoeira. Em 1987, participou de um evento com velhos mestres baianos no Circo Voador, no Rio. Em 1967, ele e Mestre Bimba foram fotografados juntos em um simpósio de capoeira em Campos dos Afonsos, no Rio - Artur depois falou de seu "relacionamento um tanto conflituoso."

Treinou muitos alunos que se tornaram mestres importantes: Leopoldina (a partir de ~1954), Djalma Bandeira, Paulo Gomes, Mendonça, Celso do Engenho da Rainha, Vilela, Vilmar e Roberval Serejo. Mestre Paulo Gomes, também de Itabuna, posteriormente fundou a ABRACAP (Associação de Capoeira do Brasil) em 1985 e assessorou o Governador de São Paulo Mário Covas em legislação sobre capoeira.

Artur Emídio fazia parte de uma geração nascida nos anos 1930 que formou o núcleo da capoeira contemporânea do Rio de Janeiro, ao lado de Leopoldina, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes e Celso do Engenho. Há consenso de que quatro linhagens foram as principais influências na Capoeira Contemporânea do Rio: Artur Emídio, Paraná, Mário Buscapé e Roque.

Uma artrose no joelho esquerdo eventualmente o impossibilitou de continuar jogando e ensinando. Faleceu na tarde de 3 de maio de 2011, no Rio de Janeiro, aos 81 anos. A nota de falecimento do Portal Capoeira declarou: "A capoeira do Rio de Janeiro perdeu sua maior personalidade." A velha guarda da capoeira, no Rio e na Bahia, sabia que Artur era um dos maiores talentos de todos os tempos. Como disseram seus contemporâneos: "Ele fez pela capoeira o que, até hoje, todos nós juntos ainda não fizemos."

Um documentário "Do Ringue ao Palco" sobre sua vida, dirigido por Roberto Pereira e Ricardo Pereira, começou a ser gravado em 2018 e foi concluído em 2023. Os Mestres Genaro (1934-2022) e Polaco (1949-2021) deram depoimentos antes de suas mortes.',
  -- Achievements (English)
  E'- Pioneer of capoeira in Rio de Janeiro; established one of the first formal academies in the city (1955)
- Likely the first capoeirista to perform internationally, touring New York, Paris, Acapulco, and Buenos Aires (1950s-60s)
- Vale-tudo fighter defending capoeira''s reputation in the rings against Rudolf Hermanny, Hélio Gracie, and Robson Gracie
- Judge at Berimbau de Ouro competition
- Sunday rodas at Academia Artur Emídio were crucial meeting points for the development of Contemporary Capoeira
- Featured performer in folkloric shows "Skindô," "Capital Samba," and musical "Arco-Íris"
- One of "four main lineages" of contemporary Rio de Janeiro capoeira
- Subject of documentary "From the Ring to the Stage" (2023)
- Took over Mestre Paizinho''s academy at age 15 (1945)',
  -- Achievements (Portuguese)
  E'- Pioneiro da capoeira no Rio de Janeiro; estabeleceu uma das primeiras academias formais da cidade (1955)
- Provavelmente o primeiro capoeirista a se apresentar internacionalmente, excursionando por Nova York, Paris, Acapulco e Buenos Aires (anos 1950-60)
- Lutador de vale-tudo defendendo a reputação da capoeira nos ringues contra Rudolf Hermanny, Hélio Gracie e Robson Gracie
- Juiz no Berimbau de Ouro
- Rodas de domingo na Academia Artur Emídio foram pontos de encontro cruciais para o desenvolvimento da Capoeira Contemporânea
- Artista em destaque nos shows folclóricos "Skindô," "Capital Samba," e no musical "Arco-Íris"
- Uma das "quatro principais linhagens" da capoeira contemporânea do Rio de Janeiro
- Tema do documentário "Do Ringue ao Palco" (2023)
- Assumiu a academia de Mestre Paizinho aos 15 anos (1945)',
  -- Researcher notes (English)
  E'BIRTH DATE: March 31, 1930 - Confirmed by velhosmestres.com ("31st of March 1930"). Capoeirahistory.com lists only "1930."

DEATH DATE: May 3, 2011 - Confirmed by velhosmestres.com and Portal Capoeira obituary.

FIGHT DATE DISCREPANCY: The Robson Gracie fight is dated April 13, 1957 by capoeirahistory.com, but April 10, 1957 by velhosmestres.com. Both confirm the defeat in approximately 4 minutes.

HÉLIO GRACIE FIGHT: Described as a "draw" by rodadecapoeira.com.br for the June 1, 1954 fight. This contradicts some sources that describe it as a loss. Using "draw" based on the fight record.

TEACHER LINEAGE: Neném (African) → Paizinho (Teodoro Ramos) → Artur Emídio. Mestre Neném is described as "of African origin" but no other details available.

PAIZINHO''S DEATH: Two conflicting stories exist - (1) meningitis (Artur''s account) vs (2) fell trying to fly with palm leaves from a coconut tree (folk legend).

RELATIONSHIP WITH BIMBA: Artur Emídio described having a "somewhat conflictual relationship" with Mestre Bimba. They met at the 1967 capoeira symposium in Campos dos Afonsos, Rio. Artur''s academy is described as based on "the systematized method of Mestre Bimba," but this was learned through Paizinho''s lineage, not directly from Bimba.

LEOPOLDINA TIMELINE: Velhosmestres.com states Leopoldina became Artur''s student in 1955. Raridadesdacapoeira says ~1954. The Leopoldina profile already exists and should have a statement added.

STUDENTS TO VERIFY:
- Leopoldina (exists in DB) - ~1954-1955
- Djalma Bandeira (pending in backlog) - first student
- Paulo Gomes (pending in backlog) - 1962
- Celso do Engenho da Rainha (pending in backlog)
- Mendonça - needs research
- Vilela - needs research
- Vilmar - needs research
- Roberval Serejo - needs research
- Genaro (pending in backlog) - 1955

DOCUMENTARY: "From the Ring to the Stage" (Do Ringue ao Palco), directors Roberto Pereira and Ricardo Pereira. Recording started 2018, completed 2023. Photography by Paulo do Vale. Research/script by Roberto Pereira. Production by Coletivo Volta do Mundo e Ina Ilha.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- velhosmestres.com/en/featured-69
- portalcapoeira.com (death notice)
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- sites.google.com/view/raridadesdacapoeira/mestre-leopoldina
- nossa-tribo.com/mestre-artur-emidio/',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 31 de março de 1930 - Confirmado por velhosmestres.com ("31 de março de 1930"). Capoeirahistory.com lista apenas "1930."

DATA DE FALECIMENTO: 3 de maio de 2011 - Confirmado por velhosmestres.com e obituário do Portal Capoeira.

DISCREPÂNCIA NA DATA DA LUTA: A luta contra Robson Gracie é datada de 13 de abril de 1957 por capoeirahistory.com, mas 10 de abril de 1957 por velhosmestres.com. Ambos confirmam a derrota em aproximadamente 4 minutos.

LUTA CONTRA HÉLIO GRACIE: Descrita como "empate" por rodadecapoeira.com.br para a luta de 1º de junho de 1954. Isso contradiz algumas fontes que descrevem como derrota. Usando "empate" baseado no registro de lutas.

LINHAGEM DE MESTRE: Neném (Africano) → Paizinho (Teodoro Ramos) → Artur Emídio. Mestre Neném é descrito como "de origem africana" mas nenhum outro detalhe está disponível.

MORTE DE PAIZINHO: Duas histórias conflitantes existem - (1) meningite (relato de Artur) vs (2) caiu tentando voar com folhas de palmeira de um coqueiro (lenda popular).

RELACIONAMENTO COM BIMBA: Artur Emídio descreveu ter um "relacionamento um tanto conflituoso" com Mestre Bimba. Eles se encontraram no simpósio de capoeira de 1967 em Campos dos Afonsos, Rio. A academia de Artur é descrita como baseada no "método sistematizado de Mestre Bimba," mas isso foi aprendido através da linhagem de Paizinho, não diretamente de Bimba.

CRONOLOGIA DE LEOPOLDINA: Velhosmestres.com afirma que Leopoldina se tornou aluno de Artur em 1955. Raridadesdacapoeira diz ~1954. O perfil de Leopoldina já existe e deve ter uma declaração adicionada.

ALUNOS A VERIFICAR:
- Leopoldina (existe no BD) - ~1954-1955
- Djalma Bandeira (pendente no backlog) - primeiro aluno
- Paulo Gomes (pendente no backlog) - 1962
- Celso do Engenho da Rainha (pendente no backlog)
- Mendonça - precisa pesquisa
- Vilela - precisa pesquisa
- Vilmar - precisa pesquisa
- Roberval Serejo - precisa pesquisa
- Genaro (pendente no backlog) - 1955

DOCUMENTÁRIO: "Do Ringue ao Palco" (From the Ring to the Stage), diretores Roberto Pereira e Ricardo Pereira. Gravação iniciada em 2018, concluída em 2023. Fotografia de Paulo do Vale. Pesquisa/roteiro de Roberto Pereira. Produção de Coletivo Volta do Mundo e Ina Ilha.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- velhosmestres.com/en/featured-69
- portalcapoeira.com (nota de falecimento)
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- sites.google.com/view/raridadesdacapoeira/mestre-leopoldina
- nossa-tribo.com/mestre-artur-emidio/'
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

-- Source: entities/persons/auvelino.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Auvelino
-- Generated: 2025-12-15
-- ============================================================
-- EXTREMELY LIMITED DOCUMENTATION:
-- Auvelino is mentioned only in connection with teaching Bigodinho
-- the berimbau in 1950 when he arrived in Salvador. No full name,
-- birth/death dates, teachers, or other students are documented.
-- Described as "legendary berimbau master" but unclear if he was
-- a formal capoeira mestre or primarily an instrumentalist/craftsman.
--
-- BIRTH YEAR ESTIMATION:
-- If active as a "master" teacher in 1950, likely born 1900-1920.
-- Using 1910 as midpoint estimate with decade precision.
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
  'Auvelino',
  'Salvador', -- Context to distinguish from Alvelino of São Félix/Muritiba
  NULL, -- Title uncertain - may not have been formal mestre
  NULL, -- No portrait available
  NULL, -- No stable public links
  -- Capoeira-specific
  NULL, -- Style uncertain - berimbau mastery predates Angola/Regional split
  NULL,
  NULL,
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Auvelino was a berimbau master active in Salvador in the mid-20th century. He is remembered primarily for teaching Bigodinho (Reinaldo Santana) the art of the berimbau when the young man arrived in Salvador in 1950.

Sources describe Auvelino as a "legendary berimbau master" who welcomed Bigodinho and taught him "the secrets of the art of this instrument." This instruction proved foundational—Bigodinho would become renowned for his berimbau playing and singing throughout his career.

Beyond this connection to Bigodinho, virtually nothing is documented about Auvelino''s life. We do not know his full name, where he came from, who taught him, or whether he had other notable students. The designation "mestre" appears in some sources but it is unclear whether this was a formal capoeira title or simply recognition of his berimbau expertise.

Auvelino represents the many skilled practitioners and craftsmen who transmitted capoeira knowledge without leaving formal documentation—figures whose contributions survive only in the memories and skills of those they taught.',
  -- bio_pt
  E'Auvelino era um mestre de berimbau ativo em Salvador em meados do século XX. É lembrado principalmente por ensinar Bigodinho (Reinaldo Santana) a arte do berimbau quando o jovem chegou em Salvador em 1950.

As fontes descrevem Auvelino como um "lendário mestre de berimbau" que acolheu Bigodinho e lhe ensinou "os segredos da arte deste instrumento." Essa instrução provou ser fundamental—Bigodinho se tornaria renomado por seu toque de berimbau e canto ao longo de sua carreira.

Além dessa conexão com Bigodinho, praticamente nada está documentado sobre a vida de Auvelino. Não sabemos seu nome completo, de onde veio, quem o ensinou, ou se teve outros alunos notáveis. A designação "mestre" aparece em algumas fontes, mas não está claro se era um título formal de capoeira ou simplesmente reconhecimento de sua expertise com o berimbau.

Auvelino representa os muitos praticantes e artesãos habilidosos que transmitiram conhecimento da capoeira sem deixar documentação formal—figuras cujas contribuições sobrevivem apenas nas memórias e habilidades daqueles que ensinaram.',
  -- achievements_en
  E'Taught Bigodinho (Reinaldo Santana) the berimbau (1950)
Described as "legendary berimbau master" in Salvador',
  -- achievements_pt
  E'Ensinou berimbau a Bigodinho (Reinaldo Santana) (1950)
Descrito como "lendário mestre de berimbau" em Salvador',
  -- Researcher notes (English)
  E'DOCUMENTATION STATUS: Extremely limited. Auvelino appears only in biographical accounts of Mestre Bigodinho.

SOURCES:
- Lalaue (lalaue.com/learn-capoeira/mestre-bigodinho/)
- Nossa Tribo (nossa-tribo.com/mestre-bigodinho/)
These are the only sources that mention Auvelino by name.

WHAT WE KNOW:
1. Active in Salvador circa 1950
2. Described as "legendary berimbau master" or "mestre de berimbau"
3. Taught Bigodinho the berimbau when he arrived in Salvador in 1950
4. Bigodinho met him in the Cabula area of Salvador

WHAT WE DON''T KNOW:
- Full name
- Birth/death dates or locations
- Teachers or lineage
- Other students
- Whether "mestre" was a formal capoeira title
- Whether he played capoeira or was primarily an instrumentalist/craftsman
- Any connection to other documented capoeiristas of the era

BIRTH YEAR ESTIMATION:
If teaching Bigodinho (born 1933) as a "master" in 1950, Auvelino was likely at least 30-50 years old at that time, suggesting birth between 1900-1920. Used 1910 with decade precision.

DISTINCT FROM:
Alvelino (from Muritiba) - different person who participated in São Félix rodas with Juvêncio and his brother Santos. That Alvelino is from a different location and time context.

CONFIDENCE: Uncertain - only documented through secondary sources describing Bigodinho''s training.',
  -- Researcher notes (Portuguese)
  E'STATUS DA DOCUMENTAÇÃO: Extremamente limitado. Auvelino aparece apenas em relatos biográficos de Mestre Bigodinho.

FONTES:
- Lalaue (lalaue.com/learn-capoeira/mestre-bigodinho/)
- Nossa Tribo (nossa-tribo.com/mestre-bigodinho/)
Essas são as únicas fontes que mencionam Auvelino pelo nome.

O QUE SABEMOS:
1. Ativo em Salvador por volta de 1950
2. Descrito como "lendário mestre de berimbau" ou "mestre de berimbau"
3. Ensinou berimbau a Bigodinho quando ele chegou em Salvador em 1950
4. Bigodinho o conheceu na área do Cabula em Salvador

O QUE NÃO SABEMOS:
- Nome completo
- Datas ou locais de nascimento/morte
- Mestres ou linhagem
- Outros alunos
- Se "mestre" era um título formal de capoeira
- Se jogava capoeira ou era principalmente instrumentista/artesão
- Qualquer conexão com outros capoeiristas documentados da época

ESTIMATIVA DO ANO DE NASCIMENTO:
Se estava ensinando Bigodinho (nascido em 1933) como "mestre" em 1950, Auvelino provavelmente tinha pelo menos 30-50 anos naquela época, sugerindo nascimento entre 1900-1920. Usado 1910 com precisão de década.

DISTINTO DE:
Alvelino (de Muritiba) - pessoa diferente que participava das rodas de São Félix com Juvêncio e seu irmão Santos. Esse Alvelino é de um local e contexto temporal diferente.

CONFIANÇA: Incerta - documentado apenas através de fontes secundárias descrevendo o treinamento de Bigodinho.'
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

-- Source: entities/persons/baleado.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Baleado
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- No birth date documented. Baleado was described as being "already
-- in Rio" when Onça Preta (b. 1909) arrived in the late 1950s.
-- He was a co-founder of Filhos de Angola in 1960 alongside Onça Preta
-- (b. 1909), Roque (b. 1938), and Dois de Ouro (est. 1920s).
-- Given he was established in Rio before 1959 and was a peer of
-- Onça Preta and Dois de Ouro, he was likely born circa 1910s-1920s.
-- Using 1920 as decade estimate (precision: decade).
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Baleado', 'mestre'::genealogy.title, NULL,
  NULL,
  'angola'::genealogy.style,
  E'Bahian angoleiro who was part of the migration of traditional capoeira practitioners from Salvador to Rio de Janeiro in the 1950s. His style was rooted in the Bahian Angola tradition.',
  E'Angoleiro baiano que fez parte da migração de capoeiristas tradicionais de Salvador para o Rio de Janeiro nos anos 1950. Seu estilo estava enraizado na tradição da Angola baiana.',
  1920, 'decade'::genealogy.date_precision, 'Bahia, Brazil',
  NULL, NULL, NULL,
  E'Baleado was a Bahian angoleiro who was among the wave of capoeiristas who migrated from Salvador to Rio de Janeiro in the 1950s. His story is intertwined with the founding of one of Rio''s most important early capoeira groups and the legendary Roda da Central.

By the time Onça Preta arrived in Rio in the late 1950s, Baleado was already established in the city, part of a small community of Bahian capoeiristas who had preceded the larger migration. On July 21, 1960, he joined forces with five other Bahian angoleiros - Mucungê, Dois de Ouro, Onça Preta, Imagem do Cão, and Roque - to co-found Grupo Filhos de Angola (Sons of Angola). This group became pioneers in teaching capoeira in Rio de Janeiro, particularly in the Southern Zone.

Baleado was a regular at the famous Roda da Central, a legendary street roda that took place during carnival in Rio de Janeiro from the 1950s until the construction of the Sambódromo in 1983. The roda formed spontaneously between the official samba parade route on Avenida Presidente Vargas and the Central do Brasil train station. It ran continuously for 24 hours over the three days and nights of carnival - described as "a roda more dangerous than any that ever existed in Rio de Janeiro," a gathering of bambas where the games were often hard and violent.

Mestre Roque recalled the names that populated this legendary roda: "Na Central? Era Inglês, Mucungê, Onça Preta, Baleado, Vavá Moleque, Reginaldo... Seu Menezes, Lamartine, Paraná..." Baleado''s name appears among these giants of Rio capoeira history, his reputation having earned him a place on the banner of Roque''s academy in São João de Meriti, alongside the other bambas of the era.

Like many of the Bahian migrants who brought capoeira angola to Rio, Baleado remains a figure whose life details are largely undocumented. His full name, birth and death dates, and specific training lineage have been lost to history. What survives is his connection to a transformative moment in capoeira history - when Bahian angoleiros established the roots of what would become contemporary capoeira in Rio de Janeiro.',
  E'Baleado foi um angoleiro baiano que fez parte da onda de capoeiristas que migraram de Salvador para o Rio de Janeiro nos anos 1950. Sua história está entrelaçada com a fundação de um dos primeiros e mais importantes grupos de capoeira do Rio e com a lendária Roda da Central.

Quando Onça Preta chegou ao Rio no final dos anos 1950, Baleado já estava estabelecido na cidade, parte de uma pequena comunidade de capoeiristas baianos que haviam precedido a migração maior. Em 21 de julho de 1960, ele se uniu a cinco outros angoleiros baianos - Mucungê, Dois de Ouro, Onça Preta, Imagem do Cão e Roque - para co-fundar o Grupo Filhos de Angola. Este grupo tornou-se pioneiro no ensino de capoeira no Rio de Janeiro, particularmente na Zona Sul.

Baleado era frequentador assíduo da famosa Roda da Central, uma lendária roda de rua que acontecia durante o carnaval no Rio de Janeiro desde os anos 1950 até a construção do Sambódromo em 1983. A roda se formava espontaneamente entre o trajeto oficial do desfile de samba na Avenida Presidente Vargas e a estação de trem Central do Brasil. Funcionava continuamente por 24 horas durante os três dias e noites do carnaval - descrita como "uma roda mais perigosa do que qualquer outra que já existiu no Rio de Janeiro," uma reunião de bambas onde os jogos eram frequentemente duros e violentos.

Mestre Roque recordava os nomes que povoavam esta lendária roda: "Na Central? Era Inglês, Mucungê, Onça Preta, Baleado, Vavá Moleque, Reginaldo... Seu Menezes, Lamartine, Paraná..." O nome de Baleado aparece entre esses gigantes da história da capoeira carioca, sua reputação tendo lhe rendido um lugar no banner da academia de Roque em São João de Meriti, ao lado dos outros bambas da era.

Como muitos dos migrantes baianos que trouxeram a capoeira angola para o Rio, Baleado permanece uma figura cujos detalhes de vida são em grande parte não documentados. Seu nome completo, datas de nascimento e morte, e linhagem específica de treinamento foram perdidos para a história. O que sobrevive é sua conexão com um momento transformador na história da capoeira - quando angoleiros baianos estabeleceram as raízes do que se tornaria a capoeira contemporânea no Rio de Janeiro.',
  E'Co-founded Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960)\nParticipated in the legendary Roda da Central (1950s-1983)\nListed among the bambas honored on Mestre Roque''s academy banner',
  E'Co-fundou o Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960)\nParticipou da lendária Roda da Central (anos 1950-1983)\nListado entre os bambas homenageados no banner da academia de Mestre Roque',
  E'Full name unknown. Birth and death dates unknown. Birth year estimated circa 1910s-1920s based on: being established in Rio before Onça Preta (b. 1909) arrived in the late 1950s; being a peer co-founder of Filhos de Angola alongside Onça Preta, Roque (b. 1938), and Dois de Ouro (est. 1920s); participating in the Roda da Central during its peak years. No documented teachers or students. Title of ''mestre'' assigned based on his role as co-founder of Filhos de Angola and his reputation among the bambas of Rio capoeira.

FOUNDING DATE DISCREPANCY: The founding date of Filhos de Angola has two reported dates - June 27, 1960 (velhosmestres.com Portuguese) and July 21, 1960 (velhosmestres.com English and capoeirahistory.com). July 21, 1960 used as primary based on more detailed English source.

SOURCES: capoeirahistory.com (Students of Mestre Roque article), velhosmestres.com (O ABC de Grandes Mestres de Capoeira), Revista EntreRios academic article on Roda da Central.',
  E'Nome completo desconhecido. Datas de nascimento e morte desconhecidas. Ano de nascimento estimado circa anos 1910-1920 baseado em: estar estabelecido no Rio antes da chegada de Onça Preta (n. 1909) no final dos anos 1950; ser co-fundador do Filhos de Angola ao lado de Onça Preta, Roque (n. 1938) e Dois de Ouro (est. anos 1920); participar da Roda da Central durante seus anos de auge. Nenhum mestre ou aluno documentado. Título de ''mestre'' atribuído com base em seu papel como co-fundador do Filhos de Angola e sua reputação entre os bambas da capoeira carioca.

DISCREPÂNCIA NA DATA DE FUNDAÇÃO: A data de fundação do Filhos de Angola tem duas versões relatadas - 27 de junho de 1960 (velhosmestres.com português) e 21 de julho de 1960 (velhosmestres.com inglês e capoeirahistory.com). 21 de julho de 1960 usado como primário baseado em fonte inglesa mais detalhada.

FONTES: capoeirahistory.com (artigo Students of Mestre Roque), velhosmestres.com (O ABC de Grandes Mestres de Capoeira), artigo acadêmico da Revista EntreRios sobre a Roda da Central.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/barbosa.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Barbosa (do Cabeça)
-- Generated: 2025-12-15
-- ============================================================
-- Porter (carregador) from Cachoeira who worked at Largo Dois de Julho
-- market in Salvador. Key figure in capoeira history: participated in
-- 1937 II Congresso Afro-Brasileiro, featured in Edison Carneiro's
-- "Negros Bantus" as informant on Angola capoeira, taught João Pequeno,
-- and was present when João Grande discovered capoeira in 1953.
-- ============================================================
--
-- IDENTITY:
-- - Full Name: Unknown (only "Barbosa" recorded)
-- - Apelido: Barbosa (also "Barbosa do Cabeça" - referring to Cabeça market)
-- - Title: NULL (recognized as mestre by peers but no formal title recorded)
--
-- DISAMBIGUATION:
-- - DISTINCT from "Barboza" (Matatu Preto group) - different person mentioned
--   only in Canjiquinha's 1989 testimony about Sunday training at Matatu Preto
-- - This Barbosa has documented origin (Cachoeira), occupation (porter at
--   Largo Dois de Julho), participation in 1937 Congress, and teaching of
--   João Pequeno - none of which applies to the other Barboza
--
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- - Active adult participating in II Congresso Afro-Brasileiro in 1937
-- - Teaching João Pequeno in 1943 (teachers typically 30-50 years old)
-- - Still active at 1953 roda (if born 1900, would be 53)
-- - From Cachoeira, moved to Salvador to work as porter
-- - Estimated birth 1890-1910, using 1900 as midpoint
--
-- DEATH:
-- - Unknown; still active in 1953
-- - No death date recorded in sources
--
-- KEY HISTORICAL ROLE:
-- - 1937: Participated in capoeira demonstration at II Congresso Afro-Brasileiro
-- - 1937: Featured in Edison Carneiro's "Negros Bantus" as informant
-- - 1943-1945: Taught João Pequeno before he joined Pastinha
-- - 1953: Present at Roça do Lobo roda when João Grande discovered capoeira
--
-- WALDEMAR'S ASSESSMENT:
-- - "Barbosa do Cabeça, carregador da pesada, o capoeira de melhor técnica
--    que já vi" (Diário de Notícias, 1970)
-- - "The heavy-load porter, the capoeirista with the best technique I've ever seen"
--
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
  'Barbosa',
  'Cachoeira/Largo Dois de Julho',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-38']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-modern era capoeira Angola practitioner from Cachoeira, Bahia. Mestre Waldemar described him as "the capoeirista with the best technique I have ever seen." Known for exceptional technique and singing ability. Participated in the formal documentation of capoeira Angola traditions through Edison Carneiro''s research.',
  E'Praticante de capoeira Angola da era pre-moderna de Cachoeira, Bahia. Mestre Waldemar o descreveu como "o capoeira de melhor tecnica que ja vi." Conhecido pela tecnica excepcional e habilidade no canto. Participou da documentacao formal das tradicoes da capoeira Angola atraves da pesquisa de Edison Carneiro.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Cachoeira, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Barbosa, known as Barbosa do Cabeca, was a capoeirista from Cachoeira in the Bahian Reconcavo who became an important figure in Salvador''s capoeira scene during the 1930s-1950s. He worked as a carregador (porter) at the Largo Dois de Julho market—a location also known as "Cabeca"—carrying heavy loads in the commercial heart of Salvador.\n\nIn January 1937, Barbosa participated in the historic capoeira demonstration at the II Congresso Afro-Brasileiro, held at the Club de Regatas Itapagipe in Ribeira, Salvador. The congress, organized by Edison Carneiro and Aydano de Couto Ferraz, was a landmark event in the formal documentation of Afro-Brazilian culture. Barbosa appeared alongside Juvenal, Onca Preta, Zeppelin, and other prominent capoeiristas of the era. That same year, Carneiro featured Barbosa in his book "Negros Bantus" as one of the key informants on capoeira de Angola. His name appeared prominently in Carneiro''s acknowledgments, listed immediately after Querido de Deus—an indication of his standing in the capoeira community.\n\nMestre Waldemar, himself one of the greatest figures in capoeira history, held Barbosa in the highest regard. In a 1970 interview with Diario de Noticias, Waldemar declared: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi" ("Barbosa do Cabeca, the heavy-load porter, the capoeirista with the best technique I have ever seen"). Waldemar also noted that Barbosa possessed exceptional singing ability, describing his voice as comparable to his own renowned vocal skills.\n\nBarbosa played a pivotal role in connecting João Pequeno to the Salvador capoeira world. When João Pequeno arrived in Salvador in January 1943, working as a bricklayer, a colleague named Candido recognized his interest in capoeira and directed him to meet Barbosa at Largo Dois de Julho. As João Pequeno later recounted, his capoeira learning "did not begin in an academy but with the carrier Barbosa from Largo Dois de Julho, who would take me to train and there was always a capoeira roda." Barbosa initiated João into capoeira and then took him to the roda of Mestre Cobrinha Verde in the Chame-Chame neighborhood—setting João Pequeno on the path that would eventually lead him to Mestre Pastinha.\n\nA decade later, in 1953, Barbosa was present at a roda in Roca do Lobo when a young man named João Grande first encountered capoeira. At this gathering, which included Menino Gordo, João Pequeno, and Cobrinha Verde, João Grande asked what he was witnessing. When told it was capoeira, he asked to learn. Barbosa and the others directed him to João Pequeno, who in turn took him to Mestre Pastinha—beginning another legendary capoeira journey.\n\nThrough his role in introducing both João Pequeno and João Grande to capoeira, Barbosa served as a crucial bridge figure connecting rural Bahian capoeira practitioners to Salvador''s organized capoeira scene. His participation in Edison Carneiro''s research helped preserve knowledge of capoeira de Angola at a critical moment in its history.',
  -- Extended content (bio_pt)
  E'Barbosa, conhecido como Barbosa do Cabeca, era um capoeirista de Cachoeira no Reconcavo Baiano que se tornou uma figura importante na cena da capoeira de Salvador durante os anos 1930-1950. Ele trabalhava como carregador no mercado do Largo Dois de Julho—local tambem conhecido como "Cabeca"—carregando cargas pesadas no coracao comercial de Salvador.\n\nEm janeiro de 1937, Barbosa participou da historica demonstracao de capoeira no II Congresso Afro-Brasileiro, realizado no Club de Regatas Itapagipe em Ribeira, Salvador. O congresso, organizado por Edison Carneiro e Aydano de Couto Ferraz, foi um evento marcante na documentacao formal da cultura afro-brasileira. Barbosa apareceu ao lado de Juvenal, Onca Preta, Zeppelin e outros capoeiristas proeminentes da epoca. No mesmo ano, Carneiro apresentou Barbosa em seu livro "Negros Bantus" como um dos principais informantes sobre capoeira de Angola. Seu nome apareceu de forma proeminente nos agradecimentos de Carneiro, listado imediatamente apos Querido de Deus—uma indicacao de sua posicao na comunidade capoeirista.\n\nMestre Waldemar, ele proprio uma das maiores figuras da historia da capoeira, tinha Barbosa na mais alta estima. Em uma entrevista de 1970 ao Diario de Noticias, Waldemar declarou: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi." Waldemar tambem observou que Barbosa possuia habilidade excepcional no canto, descrevendo sua voz como comparavel as suas proprias habilidades vocais renomadas.\n\nBarbosa desempenhou um papel fundamental na conexao de João Pequeno com o mundo da capoeira em Salvador. Quando João Pequeno chegou a Salvador em janeiro de 1943, trabalhando como pedreiro, um colega chamado Candido reconheceu seu interesse em capoeira e o direcionou para conhecer Barbosa no Largo Dois de Julho. Como João Pequeno relatou mais tarde, seu aprendizado de capoeira "nao iniciou em academia e sim com o carregador Barbosa, do Largo Dois de Julho, que me levava pra treinar e sempre tinha roda de capoeira." Barbosa iniciou João na capoeira e depois o levou para a roda de Mestre Cobrinha Verde no bairro do Chame-Chame—colocando João Pequeno no caminho que eventualmente o levaria a Mestre Pastinha.\n\nUma decada depois, em 1953, Barbosa estava presente em uma roda na Roca do Lobo quando um jovem chamado João Grande encontrou a capoeira pela primeira vez. Neste encontro, que incluia Menino Gordo, João Pequeno e Cobrinha Verde, João Grande perguntou o que estava testemunhando. Quando lhe disseram que era capoeira, ele pediu para aprender. Barbosa e os outros o direcionaram para João Pequeno, que por sua vez o levou a Mestre Pastinha—iniciando outra lendaria jornada na capoeira.\n\nAtraves de seu papel na introducao tanto de João Pequeno quanto de João Grande a capoeira, Barbosa serviu como uma figura-ponte crucial conectando praticantes de capoeira do interior da Bahia a cena organizada de capoeira de Salvador. Sua participacao na pesquisa de Edison Carneiro ajudou a preservar o conhecimento da capoeira de Angola em um momento critico de sua historia.',
  -- Achievements
  E'Participated in capoeira demonstration at II Congresso Afro-Brasileiro (January 1937)\nFeatured as informant in Edison Carneiro''s "Negros Bantus" (1937)\nIntroduced João Pequeno to Salvador capoeira scene (1943)\nPresent at 1953 roda where João Grande discovered capoeira\nRecognized by Mestre Waldemar as having "the best technique I have ever seen"',
  E'Participou da demonstracao de capoeira no II Congresso Afro-Brasileiro (janeiro de 1937)\nApresentado como informante em "Negros Bantus" de Edison Carneiro (1937)\nIntroduziu João Pequeno na cena da capoeira de Salvador (1943)\nPresente na roda de 1953 onde João Grande descobriu a capoeira\nReconhecido por Mestre Waldemar como tendo "a melhor tecnica que ja vi"',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1900, decade precision):\n- Active adult at 1937 Congress (if teaching/demonstrating, likely 25-50 years old)\n- Teaching João Pequeno in 1943 (teachers typically 30-50)\n- Still active at 1953 roda\n- If born ~1900, would be 37 in 1937, 43 in 1943, 53 in 1953 - plausible\n- From Cachoeira originally; moved to Salvador for work\n\nDEATH: Unknown. Last documented appearance is 1953 roda at Roca do Lobo.\n\nFULL NAME: Unknown. All sources refer only to "Barbosa" or "Barbosa do Cabeca" (referring to Cabeca market area at Largo Dois de Julho).\n\nTITLE: Not formally titled in sources, but functionally acted as teacher/mestre. Waldemar''s praise and his role in introducing students to capoeira suggests he held informal mestre status in the community.\n\nDISAMBIGUATION:\nThis "Barbosa" is DISTINCT from "Barboza" in the Matatu Preto training group:\n- Barbosa (this person): From Cachoeira, porter at Largo Dois de Julho, participated in 1937 Congress, taught João Pequeno, active 1937-1953\n- Barboza (other person): Only known from Canjiquinha''s 1989 testimony about Matatu Preto Sunday trainings in 1930s, no occupation/origin recorded\nUsing apelido_context "Cachoeira/Largo Dois de Julho" to differentiate.\n\nSOURCES:\n- Velhos Mestres (velhosmestres.com/br/destaques-38) - primary biographical source\n- CECA official (ceca-riovermelho.org.br) - João Pequeno biography\n- Capoeira Connection - João Grande interview\n\nWALDEMAR QUOTE: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi" (Diario de Noticias, 1970)',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, precisao de decada):\n- Adulto ativo no Congresso de 1937 (se ensinando/demonstrando, provavelmente 25-50 anos)\n- Ensinando João Pequeno em 1943 (professores tipicamente 30-50)\n- Ainda ativo na roda de 1953\n- Se nascido ~1900, teria 37 em 1937, 43 em 1943, 53 em 1953 - plausivel\n- Originalmente de Cachoeira; mudou-se para Salvador para trabalhar\n\nMORTE: Desconhecida. Ultima aparicao documentada e na roda de 1953 na Roca do Lobo.\n\nNOME COMPLETO: Desconhecido. Todas as fontes referem-se apenas a "Barbosa" ou "Barbosa do Cabeca" (referindo-se a area do mercado Cabeca no Largo Dois de Julho).\n\nTITULO: Nao titulado formalmente nas fontes, mas funcionalmente atuava como professor/mestre. O elogio de Waldemar e seu papel na introducao de alunos a capoeira sugere que ele tinha status informal de mestre na comunidade.\n\nDESAMBIGUACAO:\nEste "Barbosa" e DISTINTO de "Barboza" no grupo de treino do Matatu Preto:\n- Barbosa (esta pessoa): De Cachoeira, carregador no Largo Dois de Julho, participou do Congresso de 1937, ensinou João Pequeno, ativo 1937-1953\n- Barboza (outra pessoa): Conhecido apenas pelo testemunho de Canjiquinha de 1989 sobre treinos de domingo no Matatu Preto nos anos 1930, sem ocupacao/origem registrada\nUsando apelido_context "Cachoeira/Largo Dois de Julho" para diferenciar.\n\nFONTES:\n- Velhos Mestres (velhosmestres.com/br/destaques-38) - fonte biografica principal\n- CECA oficial (ceca-riovermelho.org.br) - biografia de João Pequeno\n- Capoeira Connection - entrevista de João Grande\n\nCITACAO DE WALDEMAR: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi" (Diario de Noticias, 1970)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/bigodinho.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bigodinho
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH PLACE NOTE:
-- Sources disagree: Some say "Santo Amaro" (Portal Capoeira), others say
-- "Conceição de Feira" (nossa-tribo.com, lalaue.com, Portal Capoeira alternate).
-- All sources agree he was RAISED in Acupe, a district of Santo Amaro.
-- Using "Conceição de Feira" as birth place per majority of detailed sources,
-- noting he grew up in Acupe.
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
  'Reinaldo Santana',
  'Bigodinho',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://www.lalaue.com/learn-capoeira/mestre-bigodinho/', 'https://velhosmestres.com/en/featured-11']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Bigodinho practiced Capoeira Angola in the traditional style learned from Mestre Waldemar da Paixão. He was particularly renowned for his berimbau playing and his singing of ladainhas and corridos, which had a distinctive, personal style. Also proficient in samba-de-roda, reflecting the integrated nature of Recôncavo musical traditions.',
  E'Bigodinho praticava Capoeira Angola no estilo tradicional aprendido com Mestre Waldemar da Paixão. Era particularmente renomado por seu toque de berimbau e por sua forma de cantar ladainhas e corridos, que tinha um estilo muito particular e pessoal. Também era exímio no samba-de-roda, refletindo a natureza integrada das tradições musicais do Recôncavo.',
  -- Life dates
  1933,
  'exact'::genealogy.date_precision,
  'Conceição de Feira, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Santa Casa de Misericórdia de Santo Amaro, Bahia, Brazil',
  -- bio_en
  E'Reinaldo Santana, known as Mestre Bigodinho, was born on September 13, 1933, in Conceição de Feira, Bahia. He grew up in Acupe, a district of Santo Amaro in the Recôncavo Baiano region, immersed in the rich cultural traditions of the area—an environment where capoeira, samba-de-roda, and candomblé wove together in daily life.

In 1950, at age seventeen, Bigodinho moved to Cabula in Salvador. There he encountered the legendary berimbau master Auvelino, who taught him the secrets of the instrument that would make him famous. That same year, he began learning capoeira with Mestre Waldemar Rodrigues da Paixão at the famous Barracão on Estrada da Liberdade.

For more than 25 years, Bigodinho frequented Mestre Waldemar''s Barracão—a time when, according to him, "boys and women did not play." At the Barracão he mingled with famous capoeiristas including Traíra, Zacarias Boa Morte, and many others. He became one of the most respected practitioners there, absorbing the traditional Angola style that Waldemar taught informally under his straw-roofed shed.

By 1960, Bigodinho had become a professor of Capoeira Angola and established Grupo Resistência in the Lapinha neighborhood of Salvador. This was a crucial period marked by intense police repression of capoeira rodas. Despite the hostile environment, he persevered in teaching and preserving the tradition.

In 1968, Bigodinho was recognized as a mestre. He also participated in the Grupo Folclórico "Viva Bahia," coordinated by ethnomusicologist Emília Biancardi, which played an important role in spreading capoeira throughout Brazil and the world during a time when the art still faced social stigma.

The repression and discrimination of the era eventually took their toll. In the early 1970s, Bigodinho stepped away from capoeira, remaining absent from the community for nearly three decades. Then, in 1997, encouraged by his friend Mestre Lua Rasta, he returned to active participation in the capoeira world.

His comeback led to renewed recognition. In 2000, he recorded the CD "Capoeira Angola" with Mestre Boca Rica (another student of Pastinha), showcasing his talent as a singer and composer of both capoeira songs and samba-de-roda. In 2002, he appeared in a documentary by Paulo "Gabiru" Siqueira alongside Mestre Boca Rica.

In 2007, Mestre Lua Rasta organized the "Tributo a Mestre Bigodinho" in Acupe. The event transformed the streets of his childhood home into a festive celebration, with capoeiristas of all lineages honoring him. The tribute was recorded in a documentary directed by Gabriela Barreto, capturing Bigodinho''s joy as he paraded through the streets being acclaimed by all present.

Researcher Frede Abreu noted that Mestre Bigodinho had great importance in the revitalization process of Capoeira Angola in the 1970s and 1980s, due to the depth of traditional knowledge he possessed from his decades at Waldemar''s Barracão.

On April 5, 2011, Mestre Bigodinho died at the Santa Casa de Misericórdia de Santo Amaro—the same hospital where the legendary Besouro Mangangá had died in 1924. He was 77 years old. He is remembered as one of the greatest representatives of popular culture in Bahia, a guardian of the old traditions who bridged the era of repression to the modern capoeira revival.

As he once said about capoeira: "It is like a pharmacy: you have pain in your leg, in your muscle... so you do some capoeira jumping with the guys, when you come back you''ll be fine." And on its nature: "Capoeira is personal defense and each person defends themselves as they can in the moment of necessity. Capoeira is not about bravery."',
  -- bio_pt
  E'Reinaldo Santana, conhecido como Mestre Bigodinho, nasceu em 13 de setembro de 1933 em Conceição de Feira, Bahia. Cresceu em Acupe, distrito de Santo Amaro no Recôncavo Baiano, imerso nas ricas tradições culturais da região—um ambiente onde capoeira, samba-de-roda e candomblé se entrelaçavam na vida cotidiana.

Em 1950, aos dezessete anos, Bigodinho se mudou para o Cabula em Salvador. Lá conheceu o lendário mestre de berimbau Auvelino, que lhe ensinou os segredos do instrumento que o tornaria famoso. No mesmo ano, começou a aprender capoeira com Mestre Waldemar Rodrigues da Paixão no famoso Barracão na Estrada da Liberdade.

Por mais de 25 anos, Bigodinho frequentou o Barracão de Mestre Waldemar—uma época em que, segundo ele, "meninos e mulheres não jogavam." No Barracão conviveu com famosos capoeiristas como Traíra, Zacarias Boa Morte e muitos outros. Tornou-se um dos praticantes mais respeitados ali, absorvendo o estilo tradicional de Angola que Waldemar ensinava informalmente sob seu telhado de palha.

Por volta de 1960, Bigodinho já era professor de Capoeira Angola e estabeleceu o Grupo Resistência no bairro da Lapinha em Salvador. Foi um período crucial marcado pela intensa repressão policial às rodas de capoeira. Apesar do ambiente hostil, ele perseverou no ensino e na preservação da tradição.

Em 1968, Bigodinho foi reconhecido como mestre. Também participou do Grupo Folclórico "Viva Bahia", coordenado pela etnomusicóloga Emília Biancardi, que desempenhou papel importante na disseminação da capoeira pelo Brasil e pelo mundo, numa época em que a arte ainda enfrentava estigma social.

A repressão e discriminação da época eventualmente cobraram seu preço. No início dos anos 1970, Bigodinho se afastou da capoeira, permanecendo ausente da comunidade por quase três décadas. Então, em 1997, incentivado por seu amigo Mestre Lua Rasta, voltou à participação ativa no mundo da capoeira.

Seu retorno levou a um renovado reconhecimento. Em 2000, gravou o CD "Capoeira Angola" com Mestre Boca Rica (outro aluno de Pastinha), mostrando seu talento como cantor e compositor tanto de músicas de capoeira quanto de samba-de-roda. Em 2002, apareceu em um documentário de Paulo "Gabiru" Siqueira ao lado de Mestre Boca Rica.

Em 2007, Mestre Lua Rasta organizou o "Tributo a Mestre Bigodinho" em Acupe. O evento transformou as ruas de seu lar de infância em uma celebração festiva, com capoeiristas de todas as linhagens homenageando-o. O tributo foi gravado em um documentário dirigido por Gabriela Barreto, capturando a alegria de Bigodinho ao desfilar pelas ruas sendo aclamado por todos os presentes.

O pesquisador Frede Abreu observou que Mestre Bigodinho teve grande importância no processo de revitalização da Capoeira Angola nos anos 1970 e 1980, devido à profundidade do conhecimento tradicional que possuía de suas décadas no Barracão de Waldemar.

Em 5 de abril de 2011, Mestre Bigodinho morreu na Santa Casa de Misericórdia de Santo Amaro—o mesmo hospital onde o lendário Besouro Mangangá havia morrido em 1924. Tinha 77 anos. É lembrado como um dos maiores representantes da cultura popular da Bahia, um guardião das antigas tradições que fez a ponte entre a era de repressão e o renascimento moderno da capoeira.

Como ele uma vez disse sobre capoeira: "É como uma farmácia: você tem dor na perna, no músculo... então você faz uns pulos de capoeira com os caras, quando voltar vai estar bem." E sobre sua natureza: "Capoeira é defesa pessoal e cada pessoa se defende como pode no momento de necessidade. Capoeira não é sobre valentia."',
  -- achievements_en
  E'Frequented Mestre Waldemar''s legendary Barracão for over 25 years (1950-1970s)
Founded and coordinated Grupo Resistência in Lapinha, Salvador (1960s)
Became mestre in 1968
Participated in Grupo Folclórico "Viva Bahia" coordinated by Emília Biancardi
Recorded CD "Capoeira Angola" with Mestre Boca Rica (2000)
Subject of documentary "Tributo a Mestre Bigodinho" directed by Gabriela Barreto (2007)
Recognized by researcher Frede Abreu for his importance in the revitalization of Capoeira Angola in the 1970s-80s
Renowned berimbau player and singer/composer of ladainhas, corridos, and samba-de-roda',
  -- achievements_pt
  E'Frequentou o lendário Barracão de Mestre Waldemar por mais de 25 anos (1950-década de 1970)
Fundou e coordenou o Grupo Resistência na Lapinha, Salvador (década de 1960)
Tornou-se mestre em 1968
Participou do Grupo Folclórico "Viva Bahia" coordenado por Emília Biancardi
Gravou CD "Capoeira Angola" com Mestre Boca Rica (2000)
Tema do documentário "Tributo a Mestre Bigodinho" dirigido por Gabriela Barreto (2007)
Reconhecido pelo pesquisador Frede Abreu por sua importância na revitalização da Capoeira Angola nos anos 1970-80
Renomado tocador de berimbau e cantor/compositor de ladainhas, corridos e samba-de-roda',
  -- Researcher notes (English)
  E'LIFE DATES:
Birth: September 13, 1933 - exact date confirmed by multiple sources (Portal Capoeira, velhosmestres.com)
Death: April 5, 2011 - confirmed by multiple sources (Portal Capoeira, lalaue.com)

BIRTH PLACE DISCREPANCY:
- Portal Capoeira (mestres page): Santo Amaro, Bahia
- Nossa-tribo.com, lalaue.com, Portal Capoeira (crônicas): Conceição de Feira, Bahia
- All sources agree he was RAISED in Acupe (district of Santo Amaro)
Using Conceição de Feira as most detailed sources specify this, noting Acupe as where he grew up.

DEATH LOCATION: Santa Casa de Misericórdia de Santo Amaro - same hospital where Besouro Mangangá died (1924).

ALIASES: Also known as "Gigante" per persons-backlog.md (need verification)

PRIMARY TEACHER: Mestre Waldemar Rodrigues da Paixão
- Training period: 1950-1970 (20 years documented attendance)
- Frequented Barracão for 25+ years total

BERIMBAU TEACHER: Auvelino (1950 in Salvador)
- Described as "legendary berimbau master"
- Taught Bigodinho the berimbau when he first arrived in Salvador

CONTEMPORARIES AT BARRACÃO:
- Traíra (João Ramos do Nascimento)
- Zacarias Boa Morte
- Many others unnamed in sources

GRUPO RESISTÊNCIA:
- Founded/coordinated by Bigodinho in 1960
- Located in Lapinha neighborhood, Salvador
- Teaching during period of police repression

VIVA BAHIA:
- Folkloric group coordinated by Emília Biancardi
- Founded 1962, pioneering folk group
- Bigodinho was a participant (not founder)

CD WITH BOCA RICA:
- Title: "Capoeira Angola"
- Release: Discogs lists 2002, velhosmestres.com says 2000
- 37 songs, 58 minutes
- Shows capoeira AND samba-de-roda compositions

DOCUMENTARIES:
1. Paulo "Gabiru" Siqueira documentary (2002) - with Boca Rica
2. "Tributo a Mestre Bigodinho" (2007) - directed by Gabriela Barreto

FREDE ABREU RECOGNITION:
Researcher noted Bigodinho''s importance in Capoeira Angola revitalization (1970s-80s) due to traditional knowledge from Waldemar''s era.

HIATUS: 1970-1997 (27 years) - left due to repression and discrimination
RETURN: 1997, encouraged by Mestre Lua Rasta

QUOTES:
1. "[Capoeira] is like a pharmacy: you have pain in your leg, in your muscle...so you do some capoeira jumping with the guys, when you come back you''ll be fine."
2. "Capoeira is personal defense and each person defends themselves as they can in the moment of necessity. Capoeira is not about bravery."
3. "Capoeira não se faz, se joga" (Capoeira is not made, it is played) - title of Portal Capoeira article

ASSOCIATIONS TO IMPORT:
- Mestre Boca Rica (Manoel Silva) - pending in backlog (Pastinha student)
- Mestre Lua Rasta - NOT in database, needs to be added to backlog
- Auvelino (berimbau master) - NOT in database, needs investigation
- Grupo Resistência - pending in groups backlog',
  -- Researcher notes (Portuguese)
  E'DATAS DE VIDA:
Nascimento: 13 de setembro de 1933 - data exata confirmada por múltiplas fontes (Portal Capoeira, velhosmestres.com)
Morte: 5 de abril de 2011 - confirmado por múltiplas fontes (Portal Capoeira, lalaue.com)

DISCREPÂNCIA DO LOCAL DE NASCIMENTO:
- Portal Capoeira (página de mestres): Santo Amaro, Bahia
- Nossa-tribo.com, lalaue.com, Portal Capoeira (crônicas): Conceição de Feira, Bahia
- Todas as fontes concordam que ele FOI CRIADO em Acupe (distrito de Santo Amaro)
Usando Conceição de Feira pois as fontes mais detalhadas especificam isto, notando Acupe como onde cresceu.

LOCAL DA MORTE: Santa Casa de Misericórdia de Santo Amaro - mesmo hospital onde Besouro Mangangá morreu (1924).

APELIDOS: Também conhecido como "Gigante" conforme persons-backlog.md (precisa verificação)

MESTRE PRINCIPAL: Mestre Waldemar Rodrigues da Paixão
- Período de treinamento: 1950-1970 (20 anos de frequência documentada)
- Frequentou o Barracão por mais de 25 anos no total

MESTRE DE BERIMBAU: Auvelino (1950 em Salvador)
- Descrito como "lendário mestre de berimbau"
- Ensinou berimbau a Bigodinho quando ele chegou em Salvador

CONTEMPORÂNEOS NO BARRACÃO:
- Traíra (João Ramos do Nascimento)
- Zacarias Boa Morte
- Muitos outros não nomeados nas fontes

GRUPO RESISTÊNCIA:
- Fundado/coordenado por Bigodinho em 1960
- Localizado no bairro da Lapinha, Salvador
- Ensino durante período de repressão policial

VIVA BAHIA:
- Grupo folclórico coordenado por Emília Biancardi
- Fundado em 1962, grupo folclórico pioneiro
- Bigodinho era participante (não fundador)

CD COM BOCA RICA:
- Título: "Capoeira Angola"
- Lançamento: Discogs lista 2002, velhosmestres.com diz 2000
- 37 músicas, 58 minutos
- Mostra composições de capoeira E samba-de-roda

DOCUMENTÁRIOS:
1. Documentário de Paulo "Gabiru" Siqueira (2002) - com Boca Rica
2. "Tributo a Mestre Bigodinho" (2007) - dirigido por Gabriela Barreto

RECONHECIMENTO DE FREDE ABREU:
Pesquisador notou a importância de Bigodinho na revitalização da Capoeira Angola (1970-80) devido ao conhecimento tradicional da era de Waldemar.

HIATO: 1970-1997 (27 anos) - saiu devido à repressão e discriminação
RETORNO: 1997, incentivado por Mestre Lua Rasta

CITAÇÕES:
1. "[Capoeira] é como uma farmácia: você tem dor na perna, no músculo... então você faz uns pulos de capoeira com os caras, quando voltar vai estar bem."
2. "Capoeira é defesa pessoal e cada pessoa se defende como pode no momento de necessidade. Capoeira não é sobre valentia."
3. "Capoeira não se faz, se joga" - título do artigo do Portal Capoeira

ASSOCIAÇÕES PARA IMPORTAR:
- Mestre Boca Rica (Manoel Silva) - pendente no backlog (aluno de Pastinha)
- Mestre Lua Rasta - NÃO está no banco de dados, precisa ser adicionado ao backlog
- Auvelino (mestre de berimbau) - NÃO está no banco de dados, precisa investigação
- Grupo Resistência - pendente no backlog de grupos'
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

-- Source: entities/persons/bom-nome.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bom Nome (Bonome)
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Bom Nome was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Bom Nome',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Bom Nome (also spelled Bonome, meaning "Good Name" in Portuguese) was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nThe Gengibirra center was led by four "donos e proprietários" (owners and proprietors): Noronha, Livino, Totonho de Maré, and Amorzinho. Bom Nome was among the founding mestres who gathered regularly at this historic location, alongside notable figures such as Onça Preta, Bigode de Seda, and Juvenal Engraxate.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Bom Nome among the founding mestres of this pioneering capoeira angola organization. Bom Nome was present during the period when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nThe spelling variation "Bonome" appears in some historical documents, though "Bom Nome" is more commonly used in contemporary references. No further biographical details about Bom Nome have been documented.',
  E'Bom Nome (também grafado como Bonome) foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nO centro Gengibirra era liderado por quatro "donos e proprietários": Noronha, Livino, Totonho de Maré e Amorzinho. Bom Nome estava entre os mestres fundadores que se reuniam regularmente neste local histórico, ao lado de figuras notáveis como Onça Preta, Bigode de Seda e Juvenal Engraxate.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Bom Nome entre os mestres fundadores desta organização pioneira de capoeira angola. Bom Nome esteve presente durante o período em que, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nA variação ortográfica "Bonome" aparece em alguns documentos históricos, embora "Bom Nome" seja mais comumente usado em referências contemporâneas. Nenhum outro detalhe biográfico sobre Bom Nome foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Also spelled "Bonome" in some historical documents. The apelido "Bom Nome" means "Good Name" in Portuguese. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Também grafado como "Bonome" em alguns documentos históricos. O apelido "Bom Nome" significa "Good Name" em inglês. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/caicara.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Caiçara
-- Generated: 2025-12-15
-- ============================================================
-- Mestre Caiçara was one of the most legendary and controversial figures
-- in Capoeira Angola history. Known for his hard fighting style, powerful
-- voice, and iconic bengala (walking cane) inherited from his teacher.
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
  'Antônio Conceição Moraes',
  'Caiçara',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://capoeirawiki.org/wiki/Mestre_Cai%C3%A7ara', 'https://www.capoeirahub.net/mestres/686db8791a348b787f2a06c1-mestre-caicara']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Caiçara was known for a "hard and efficient style" that contrasted sharply with Mestre Pastinha''s softer approach. His technique was described as "formidable and effective." Beyond pure capoeira, he trained in jiu-jitsu, boxing, freestyle wrestling, and Greco-Roman wrestling—skills he used in his many street confrontations. His trademark was the bengala (walking cane) inherited from Mestre Aberrê, which he used both for elegance and as a deadly weapon. He accumulated 27 scars from bullets, razors, knives, daggers, and machetes throughout his life.',
  E'Caiçara era conhecido por um "estilo duro e eficiente" que contrastava fortemente com a abordagem mais suave de Mestre Pastinha. Sua técnica era descrita como "formidável e eficaz." Além da capoeira pura, ele treinava jiu-jitsu, boxe, luta livre e luta greco-romana—habilidades que usava em seus muitos confrontos de rua. Sua marca registrada era a bengala herdada de Mestre Aberrê, que usava tanto para elegância quanto como arma mortal. Acumulou 27 cicatrizes de balas, navalhas, facas, punhais e facões ao longo de sua vida.',
  -- Life dates
  1924,
  'exact'::genealogy.date_precision,
  'Cachoeira de São Félix, Bahia, Brazil',
  1997,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Antônio Conceição Moraes was born on May 8, 1924, in Cachoeira de São Félix, a city in the Recôncavo Baiano region that he described as "a place of many mysteries and much magic." His mother, Dona Adélia Maria da Conceição, was a Yalorixá (Candomblé priestess) who prepared him from childhood for religious responsibilities. Before capoeira, he worked as a magarefe (butcher)—a common trade for young men in the region.

In 1938, at age 14, Caiçara began learning capoeira from Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos), who taught him "os segredos e mistérios da capoeiragem"—the secrets and mysteries of the practice of capoeira. Before Aberrê''s death, the mestre passed to Caiçara the bengala (walking cane) that would become his trademark for the next fifty years. Like his teacher, Caiçara carried it both for elegance and as a weapon.

Later, Caiçara refined his berimbau playing and singing skills under Mestre Waldemar at the legendary Barracão in Liberdade. This dual training gave him both the fighting foundation from Aberrê and the musical mastery that would make him famous as "a great singer" with a voice described as "contagious and hypnotic."

Beyond capoeira, Caiçara trained in jiu-jitsu, boxing, freestyle wrestling, and Greco-Roman wrestling. He was arrested repeatedly for fighting and capoeira violations, yet police officers are said to have respected and hesitated to detain him. During the 1960s, he and Mestre Traíra worked as political enforcers for Salvador''s Mayor Antônio Carlos Magalhães.

Caiçara claimed adolescent involvement with the cangaceiros—the famous rural bandits of northeastern Brazil—possessing photographic evidence allegedly held by his family. He displayed his 27 scars from weapons with pride, declaring: "I am a sorcerer!"

In 1954, he appeared in "Vadiação," the short documentary film directed by Alexandre Robatto Filho, alongside Mestre Bimba, Waldemar, Traíra, and Curió. In 1969, he recorded the LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara," featuring vocalist Grácia Maria. The album was re-released in 1973 and 1993. He appeared in "The Spirit of Samba: Black Music of Brazil" (1982), was interviewed on Rádio Roquette Pinto''s "Roda de Capoeira" (1975), and participated in the Programa Nacional de Capoeira (1989).

The famous confrontation with Mestre Bimba occurred in the 1960s at a graduation event in Amaralina. Caiçara provoked Bimba''s disciples, declaring himself "the master." When they finally played, Bimba applied a devastating "bênção" (blessing kick), breaking Caiçara''s nose and lips. Bimba''s response was iconic: "Isso é que é jogo de perna, meu filho"—"That''s footwork, my son."

In November 1972, as Bimba prepared to leave Salvador for Goiânia (never to return), Caiçara apologized. According to witnesses, he said: "I am Bahia''s third master after you and Mestre Pastinha. Forgive my arrogance; don''t leave. Bahia needs you." This reconciliation came too late—Bimba left and died two years later in poverty.

Caiçara became the most respected figure in Pelourinho, Salvador''s historic center, commanding respect from criminals, police, and nightlife figures alike. He founded two Candomblé temples, continuing his mother''s religious lineage, though he later distanced himself from organized religion, criticizing institutional corruption.

He founded the Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara, represented by green and red colors. His students included Zé de Freitas, Fernandinho, Sabú, and according to some sources, Sandrinha—though her primary teacher was Mestre Roque. He influenced the "Angola da Penha" movement in Rio de Janeiro.

Known for sharp wit, Caiçara''s famous phrases included: "Roupa de homem não dá em menino!" (Adult''s clothing doesn''t fit a boy!)—criticizing young capoeiristas who claimed master status. Another was: "Está aprendendo a soletrar e já acha que sabe ler" (He''s learning to spell and already thinks he can read).

Mestre Caiçara died on August 26, 1997, in Salvador, Bahia, after 59 years of capoeira practice. He remains one of the most controversial and legendary figures in capoeira history—a mandingueiro who bridged the street culture of old Bahia with the preservation of Capoeira Angola.',
  -- bio_pt
  E'Antônio Conceição Moraes nasceu em 8 de maio de 1924, em Cachoeira de São Félix, uma cidade no Recôncavo Baiano que ele descrevia como "um lugar de muitos mistérios e muita magia." Sua mãe, Dona Adélia Maria da Conceição, era Yalorixá (sacerdotisa do Candomblé) que o preparou desde a infância para responsabilidades religiosas. Antes da capoeira, trabalhou como magarefe (açougueiro)—um ofício comum para jovens da região.

Em 1938, aos 14 anos, Caiçara começou a aprender capoeira com Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos), que lhe ensinou "os segredos e mistérios da capoeiragem." Antes da morte de Aberrê, o mestre passou a Caiçara a bengala que se tornaria sua marca registrada pelos próximos cinquenta anos. Como seu professor, Caiçara a carregava tanto para elegância quanto como arma.

Mais tarde, Caiçara aperfeiçoou seu toque de berimbau e canto sob Mestre Waldemar no lendário Barracão na Liberdade. Este duplo treinamento lhe deu tanto a base de luta de Aberrê quanto o domínio musical que o tornaria famoso como "um grande cantador" com voz descrita como "contagiante e hipnótica."

Além da capoeira, Caiçara treinou jiu-jitsu, boxe, luta livre e luta greco-romana. Foi preso repetidamente por brigas e violações de capoeira, mas dizem que os policiais o respeitavam e hesitavam em detê-lo. Durante a década de 1960, ele e Mestre Traíra trabalharam como capangas políticos para o prefeito de Salvador, Antônio Carlos Magalhães.

Caiçara alegava envolvimento adolescente com os cangaceiros—os famosos bandidos rurais do Nordeste brasileiro—possuindo evidências fotográficas supostamente mantidas por sua família. Exibia suas 27 cicatrizes de armas com orgulho, declarando: "Eu sou feiticeiro!"

Em 1954, apareceu em "Vadiação," o curta-metragem documental dirigido por Alexandre Robatto Filho, ao lado de Mestre Bimba, Waldemar, Traíra e Curió. Em 1969, gravou o LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara," com a vocalista Grácia Maria. O álbum foi relançado em 1973 e 1993. Apareceu em "The Spirit of Samba: Black Music of Brazil" (1982), foi entrevistado no "Roda de Capoeira" da Rádio Roquette Pinto (1975), e participou do Programa Nacional de Capoeira (1989).

O famoso confronto com Mestre Bimba ocorreu na década de 1960 em um evento de formatura em Amaralina. Caiçara provocou os discípulos de Bimba, declarando-se "o mestre." Quando finalmente jogaram, Bimba aplicou uma devastadora "bênção," quebrando o nariz e os lábios de Caiçara. A resposta de Bimba foi icônica: "Isso é que é jogo de perna, meu filho."

Em novembro de 1972, enquanto Bimba se preparava para deixar Salvador rumo a Goiânia (para nunca mais voltar), Caiçara se desculpou. Segundo testemunhas, ele disse: "Sou o terceiro mestre da Bahia depois de você e Mestre Pastinha. Perdoe minha arrogância; não vá embora. A Bahia precisa de você." Esta reconciliação veio tarde demais—Bimba partiu e morreu dois anos depois na pobreza.

Caiçara se tornou a figura mais respeitada do Pelourinho, centro histórico de Salvador, comandando respeito de criminosos, policiais e figuras da vida noturna. Fundou dois terreiros de Candomblé, continuando a linhagem religiosa de sua mãe, embora mais tarde tenha se distanciado da religião organizada, criticando a corrupção institucional.

Fundou a Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara, representada pelas cores verde e vermelha. Seus alunos incluíam Zé de Freitas, Fernandinho, Sabú e, segundo algumas fontes, Sandrinha—embora seu professor principal tenha sido Mestre Roque. Ele influenciou o movimento "Angola da Penha" no Rio de Janeiro.

Conhecido pelo humor afiado, as frases famosas de Caiçara incluíam: "Roupa de homem não dá em menino!"—criticando jovens capoeiristas que reivindicavam o título de mestre. Outra era: "Está aprendendo a soletrar e já acha que sabe ler."

Mestre Caiçara morreu em 26 de agosto de 1997, em Salvador, Bahia, após 59 anos de prática de capoeira. Ele permanece como uma das figuras mais controversas e lendárias da história da capoeira—um mandingueiro que fez a ponte entre a cultura de rua da velha Bahia e a preservação da Capoeira Angola.',
  -- achievements_en
  E'1938: Began training under Mestre Aberrê de Santo Amaro; received Aberrê''s bengala (walking cane) that became his trademark
1954: Appeared in the documentary short film "Vadiação" directed by Alexandre Robatto Filho
1969: Released LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" with vocalist Grácia Maria (re-released 1973, 1993)
1975: Featured on Rádio Roquette Pinto''s "Roda de Capoeira" program
1982: Appeared in documentary "The Spirit of Samba: Black Music of Brazil" by Jeremy Marre
1987: Participated in major capoeira events in Rio de Janeiro and Ouro Preto
1989: Featured in Programa Nacional de Capoeira
Founded Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara (green and red colors)
Founded two Candomblé temples in Salvador
Trained notable students including Zé de Freitas, Fernandinho, and Sabú
59 years of continuous capoeira practice (1938-1997)',
  -- achievements_pt
  E'1938: Começou a treinar com Mestre Aberrê de Santo Amaro; recebeu a bengala de Aberrê que se tornou sua marca registrada
1954: Apareceu no curta-metragem documental "Vadiação" dirigido por Alexandre Robatto Filho
1969: Lançou LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" com a vocalista Grácia Maria (relançado em 1973, 1993)
1975: Destaque no programa "Roda de Capoeira" da Rádio Roquette Pinto
1982: Apareceu no documentário "The Spirit of Samba: Black Music of Brazil" de Jeremy Marre
1987: Participou de grandes eventos de capoeira no Rio de Janeiro e Ouro Preto
1989: Destaque no Programa Nacional de Capoeira
Fundou a Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara (cores verde e vermelha)
Fundou dois terreiros de Candomblé em Salvador
Treinou alunos notáveis incluindo Zé de Freitas, Fernandinho e Sabú
59 anos de prática contínua de capoeira (1938-1997)',
  -- Researcher notes (English)
  E'LIFE DATES:
Birth: May 8, 1924 - confirmed by multiple sources (velhosmestres.com, capoeirawiki.org, capoeirahub.net)
Death: August 26, 1997 - confirmed by multiple sources
Birth place: Cachoeira de São Félix (also written as "Cachoeira de São Felix") in the Recôncavo Baiano

MOTHER: Dona Adélia Maria da Conceição - Yalorixá (Candomblé priestess)

TEACHERS:
1. Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos) - primary teacher from 1938
   NOTE: Some sources identify Caiçara''s Aberrê as distinct from Pastinha''s Aberrê (Antônio Raimundo Argolo)
2. Mestre Waldemar - refined berimbau and singing skills (1950s)

STUDENTS (per CapoeiraHub and other sources):
- Mestre Limão (São Paulo)
- Mestre Wilson Sereno (Rio de Janeiro)
- Mestre Laercio (Berlin, Germany)
- Mestre Sabu/Sabú (Goiás)
- Mestre Fernandinho (Bahia)
- Mestre José de Freitas / Zé de Freitas (Alagoinhas, Bahia)
- Mestre Robertino da Hora (Salvador, Bahia)
- Mestre Valdomiro (Brazil)

NOTE ON SANDRINHA: CapoeiraWiki lists "Sandrinha" as Caiçara''s student, but other sources (ResearchGate) identify her primary teacher as Mestre Roque. She trained at Grupo Bantus de Capoeira. The connection to Caiçara may be indirect or secondary.

FILM/RECORDINGS:
- 1954: "Vadiação" (short film by Alexandre Robatto Filho) with Bimba, Waldemar, Traíra, Curió
- 1964: Photographed by Helinä Rautavaara
- 1969: LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" with Grácia Maria
- 1975: Radio interview on "Roda de Capoeira" (Rádio Roquette Pinto)
- 1982: Documentary "The Spirit of Samba: Black Music of Brazil" (Jeremy Marre)
- 1989: Programa Nacional de Capoeira

BIMBA CONFRONTATION: The fight occurred in the 1960s at a graduation in Amaralina. Caiçara was defeated with a "bênção" (blessing kick) that broke his nose and lips. They reconciled in November 1972 before Bimba left for Goiânia.

CANDOMBLÉ: Founded two temples, continuing his mother''s lineage. Later distanced himself, criticizing "corruption" in organized religion.

CLAIM OF CANGAÇO INVOLVEMENT: Caiçara claimed adolescent association with Lampião''s cangaceiros, allegedly possessing photographic evidence. Authenticity debated.

WORK: Worked as magarefe (butcher) in youth. In the 1960s, worked as political enforcer for Mayor ACM with Mestre Traíra.

27 SCARS: Displayed scars from bullets, razors, knives, daggers, and machetes with pride.',
  -- Researcher notes (Portuguese)
  E'DATAS DE VIDA:
Nascimento: 8 de maio de 1924 - confirmado por múltiplas fontes (velhosmestres.com, capoeirawiki.org, capoeirahub.net)
Morte: 26 de agosto de 1997 - confirmado por múltiplas fontes
Local de nascimento: Cachoeira de São Félix (também escrito como "Cachoeira de São Felix") no Recôncavo Baiano

MÃE: Dona Adélia Maria da Conceição - Yalorixá (sacerdotisa do Candomblé)

MESTRES:
1. Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos) - professor principal desde 1938
   NOTA: Algumas fontes identificam o Aberrê de Caiçara como distinto do Aberrê de Pastinha (Antônio Raimundo Argolo)
2. Mestre Waldemar - aperfeiçoou habilidades de berimbau e canto (anos 1950)

ALUNOS (per CapoeiraHub e outras fontes):
- Mestre Limão (São Paulo)
- Mestre Wilson Sereno (Rio de Janeiro)
- Mestre Laercio (Berlim, Alemanha)
- Mestre Sabu/Sabú (Goiás)
- Mestre Fernandinho (Bahia)
- Mestre José de Freitas / Zé de Freitas (Alagoinhas, Bahia)
- Mestre Robertino da Hora (Salvador, Bahia)
- Mestre Valdomiro (Brasil)

NOTA SOBRE SANDRINHA: CapoeiraWiki lista "Sandrinha" como aluna de Caiçara, mas outras fontes (ResearchGate) identificam seu professor principal como Mestre Roque. Ela treinou no Grupo Bantus de Capoeira. A conexão com Caiçara pode ser indireta ou secundária.

FILME/GRAVAÇÕES:
- 1954: "Vadiação" (curta de Alexandre Robatto Filho) com Bimba, Waldemar, Traíra, Curió
- 1964: Fotografado por Helinä Rautavaara
- 1969: LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" com Grácia Maria
- 1975: Entrevista de rádio no "Roda de Capoeira" (Rádio Roquette Pinto)
- 1982: Documentário "The Spirit of Samba: Black Music of Brazil" (Jeremy Marre)
- 1989: Programa Nacional de Capoeira

CONFRONTO COM BIMBA: A luta ocorreu na década de 1960 em uma formatura em Amaralina. Caiçara foi derrotado com uma "bênção" que quebrou seu nariz e lábios. Eles se reconciliaram em novembro de 1972 antes de Bimba partir para Goiânia.

CANDOMBLÉ: Fundou dois terreiros, continuando a linhagem de sua mãe. Mais tarde se distanciou, criticando "corrupção" na religião organizada.

ALEGAÇÃO DE ENVOLVIMENTO COM CANGAÇO: Caiçara alegava associação adolescente com os cangaceiros de Lampião, supostamente possuindo evidências fotográficas. Autenticidade debatida.

TRABALHO: Trabalhou como magarefe (açougueiro) na juventude. Nos anos 1960, trabalhou como capanga político para o prefeito ACM com Mestre Traíra.

27 CICATRIZES: Exibia cicatrizes de balas, navalhas, facas, punhais e facões com orgulho.'
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

-- Source: entities/persons/canjiquinha.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Canjiquinha
-- Generated: 2025-12-15
-- ============================================================
-- Known as "A Alegria da Capoeira" (The Joy of Capoeira)
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
  'Washington Bruno da Silva',
  'Canjiquinha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://esquiva.wordpress.com/mestres/mestre-canjiquinha/', 'https://velhosmestres.com/br/destaques-13', 'https://www.lalaue.com/learn-capoeira/mestre-canjiquinha/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Canjiquinha refused to emphasize differences between Angola and Regional, viewing them as primarily different rhythms rather than fundamentally separate arts. He held the berimbau at chest height and played left-handed (vaqueta in left hand), a distinctive technique. Created several new toques and games: Muzenza (from candomblé, used to signal unwanted people), Samango (for fighting in confined spaces), Samba de Angola (relaxation after the roda), and Banguela de Angola (rapid instrumental toque without singing for training beginners). Integrated maculelê and other Afro-Brazilian dances into his capoeira demonstrations.',
  E'Canjiquinha recusava-se a enfatizar diferenças entre Angola e Regional, vendo-as principalmente como ritmos diferentes ao invés de artes fundamentalmente separadas. Segurava o berimbau na altura do peito e tocava com a mão esquerda (baqueta na mão esquerda), uma técnica distintiva. Criou vários toques e jogos novos: Muzenza (do candomblé, usado para sinalizar pessoas indesejadas), Samango (para lutar em espaços confinados), Samba de Angola (relaxamento após a roda), e Banguela de Angola (toque instrumental rápido sem canto para treinar iniciantes). Integrou maculelê e outras danças afro-brasileiras em suas demonstrações de capoeira.',
  -- Life dates
  1925,
  'exact'::genealogy.date_precision,
  'Rua Maciel de Baixo n° 6, Salvador, Bahia, Brazil',
  1994,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio)
  E'Washington Bruno da Silva was born on September 25, 1925, on Rua Maciel de Baixo n° 6 in Salvador, son of tailor José Bruno da Silva and washerwoman Amália Maria da Conceição. He grew up to become one of the most influential capoeiristas of the 20th century, known throughout Brazil as "A Alegria da Capoeira" - the Joy of Capoeira.

In 1935, at just 10 years old, Washington began learning capoeira from Mestre Raimundo Aberrê at Baixa do Tubo in Matatu Pequeno. For seven years (1935-1942), he absorbed the art from one of the great pre-codification mestres. The boy who came to Aberrê knew only one samba - "Canjiquinha Quente" by Roberto Martin (1937) - and it was all he could sing. His friends gave him the nickname that would follow him forever.

Son of a washerwoman, Canjiquinha worked as a shoemaker, food delivery person, and typist. He was also a goalkeeper for Ypiranga Esporte Clube and sang boleros in Salvador''s nightlife. In 1942, the same year Aberrê died of a heart attack in a roda, Canjiquinha began working at City Hall as a loader, later becoming a mimeograph operator.

By 1950, Canjiquinha had become a contra-mestre under Mestre Pastinha. In 1951, he played goalkeeper for Ipiranga. In 1954, he began teaching capoeira formally, and in 1955 married Ivone. His daughter Juciara was born in 1965.

On May 22, 1952, Canjiquinha officially registered his group: Associação de Capoeira Canjiquinha e seus Amigos. It would become one of Salvador''s main training centers for new capoeiristas, producing mestres who spread the art worldwide.

In 1959, Canjiquinha traveled to Rio de Janeiro and Porto Alegre with Pastinha''s group. The following year, American researcher Janice Marie Smith recorded him - one of the earliest audio documentations of his voice and music.

In 1962, Canjiquinha''s image reached international audiences through two landmark films: "O Pagador de Promessas" (The Given Word) by Anselmo Duarte - which won the Palme d''Or at Cannes - and "Barravento" by Glauber Rocha. He appeared in more films over the years: "Operação Tumulto," "Capitães de Areia," "Senhor dos Navegantes," and "A Moça Daquela Hora."

From the 1960s, when capoeira became better known in Brazil, Canjiquinha''s academy became a primary training center. In 1963, he taught at the Naval Base. In 1970, he participated in the "Berimbau de Ouro" event. In 1981, the Federação Paulista de Capoeira, with support from Mestre Brasília, created the Troféu Mestre Canjiquinha to honor him.

In September 1986, Canjiquinha recorded a landmark LP with Mestre Waldemar at Boca do Rio studio in Salvador. The liner notes, written by Mestre Itapoan, describe Waldemar as the greatest singer of the rodas da Bahia and Canjiquinha as representing "the mischievous and mocking way of making capoeira a serious instrument." The album featured 34 tracks with a chorus including Mestres Itapoan, Suassuna, Ezequiel, and Geni.

In 1988, Canjiquinha wrote his book "A Alegria da Capoeira," published in 1989. That same year, he founded the Academia de Canjiquinha e Seus Amigos in the Colina do Mar neighborhood - his final academy.

Throughout his life, Canjiquinha innovated. He is credited with creating the toques Muzenza, Samango, Samba de Angola, and Banguela de Angola. Mestre Geni confirmed these as Canjiquinha''s creations. He claimed to be the first to integrate maculelê into capoeira demonstrations. His unique berimbau technique - holding the instrument at chest height, playing left-handed - became his signature.

On November 8, 1994, Mestre Canjiquinha died in Salvador. Despite his cultural significance, he died in poverty - a fate shared by many great mestres of his generation.

He left behind a vision: "Capoeira has no creed, no color, no flag - it belongs to the people, it will travel the world." Through his students - Paulo dos Anjos, Geni, Lua Rasta, Mestre Brasília, Antonio Diabo, Manoel Pé de Bode, and many others - that vision became reality.',
  -- bio_pt
  E'Washington Bruno da Silva nasceu em 25 de setembro de 1925, na Rua Maciel de Baixo n° 6 em Salvador, filho do alfaiate José Bruno da Silva e da lavadeira Amália Maria da Conceição. Ele cresceu para se tornar um dos capoeiristas mais influentes do século XX, conhecido em todo o Brasil como "A Alegria da Capoeira."

Em 1935, com apenas 10 anos, Washington começou a aprender capoeira com Mestre Raimundo Aberrê na Baixa do Tubo no Matatu Pequeno. Por sete anos (1935-1942), ele absorveu a arte de um dos grandes mestres pré-codificação. O menino que veio para Aberrê só conhecia um samba - "Canjiquinha Quente" de Roberto Martin (1937) - e era tudo que ele conseguia cantar. Seus amigos lhe deram o apelido que o seguiria para sempre.

Filho de lavadeira, Canjiquinha trabalhou como sapateiro, entregador de comida e datilógrafo. Ele também foi goleiro do Ypiranga Esporte Clube e cantor de boleros na vida noturna de Salvador. Em 1942, no mesmo ano em que Aberrê morreu de ataque cardíaco em uma roda, Canjiquinha começou a trabalhar na Prefeitura como carregador, depois se tornando operador de mimeógrafo.

Por volta de 1950, Canjiquinha havia se tornado contra-mestre sob Mestre Pastinha. Em 1951, jogou como goleiro no Ipiranga. Em 1954, começou a ensinar capoeira formalmente, e em 1955 casou-se com Ivone. Sua filha Juciara nasceu em 1965.

Em 22 de maio de 1952, Canjiquinha registrou oficialmente seu grupo: Associação de Capoeira Canjiquinha e seus Amigos. Se tornaria um dos principais centros de treinamento de Salvador para novos capoeiristas, produzindo mestres que espalharam a arte pelo mundo.

Em 1959, Canjiquinha viajou para Rio de Janeiro e Porto Alegre com o grupo de Pastinha. No ano seguinte, a pesquisadora americana Janice Marie Smith o gravou - uma das primeiras documentações em áudio de sua voz e música.

Em 1962, a imagem de Canjiquinha alcançou audiências internacionais através de dois filmes marcantes: "O Pagador de Promessas" de Anselmo Duarte - que ganhou a Palma de Ouro em Cannes - e "Barravento" de Glauber Rocha. Ele apareceu em mais filmes ao longo dos anos: "Operação Tumulto," "Capitães de Areia," "Senhor dos Navegantes," e "A Moça Daquela Hora."

A partir dos anos 1960, quando a capoeira se tornou mais conhecida no Brasil, a academia de Canjiquinha se tornou um centro de treinamento primário. Em 1963, ele ensinou na Base Naval. Em 1970, participou do evento "Berimbau de Ouro." Em 1981, a Federação Paulista de Capoeira, com apoio de Mestre Brasília, criou o Troféu Mestre Canjiquinha para homenageá-lo.

Em setembro de 1986, Canjiquinha gravou um LP marcante com Mestre Waldemar no estúdio Boca do Rio em Salvador. As notas do encarte, escritas por Mestre Itapoan, descrevem Waldemar como o maior cantor das rodas da Bahia e Canjiquinha como representando "o jeito malicioso e zombeteiro de fazer da capoeira um instrumento sério." O álbum apresentou 34 faixas com um coro incluindo Mestres Itapoan, Suassuna, Ezequiel e Geni.

Em 1988, Canjiquinha escreveu seu livro "A Alegria da Capoeira," publicado em 1989. No mesmo ano, fundou a Academia de Canjiquinha e Seus Amigos no bairro de Colina do Mar - sua última academia.

Ao longo de sua vida, Canjiquinha inovou. Ele é creditado pela criação dos toques Muzenza, Samango, Samba de Angola e Banguela de Angola. Mestre Geni confirmou estas como criações de Canjiquinha. Ele afirmava ser o primeiro a integrar o maculelê em demonstrações de capoeira. Sua técnica única de berimbau - segurando o instrumento na altura do peito, tocando com a mão esquerda - se tornou sua marca registrada.

Em 8 de novembro de 1994, Mestre Canjiquinha morreu em Salvador. Apesar de sua importância cultural, ele morreu na pobreza - um destino compartilhado por muitos grandes mestres de sua geração.

Ele deixou uma visão: "A capoeira não tem credo, não tem cor, não tem bandeira - ela pertence ao povo, ela vai correr o mundo." Através de seus alunos - Paulo dos Anjos, Geni, Lua Rasta, Mestre Brasília, Antonio Diabo, Manoel Pé de Bode, e muitos outros - essa visão se tornou realidade.',
  -- achievements
  E'1952: Founded Associação de Capoeira Canjiquinha e seus Amigos (May 22)
1959: Traveled with Pastinha''s group to Rio de Janeiro and Porto Alegre
1960: Recorded by Janice Marie Smith - early audio documentation of capoeira
1962: Appeared in "O Pagador de Promessas" (Palme d''Or winner) and "Barravento"
1962-1970s: Appeared in multiple Brazilian films: "Operação Tumulto," "Capitães de Areia," "Senhor dos Navegantes," "A Moça Daquela Hora"
1970: Participated in Berimbau de Ouro event
1981: Honored with Troféu Mestre Canjiquinha by Federação Paulista de Capoeira
1986: Recorded landmark LP with Mestre Waldemar at Boca do Rio studio
1988-1989: Wrote and published "A Alegria da Capoeira"
1988: Founded Academia de Canjiquinha e Seus Amigos in Colina do Mar
Created toques: Muzenza, Samango, Samba de Angola, Banguela de Angola
First to integrate maculelê into capoeira demonstrations
Trained numerous mestres who spread capoeira internationally',
  -- achievements_pt
  E'1952: Fundou a Associação de Capoeira Canjiquinha e seus Amigos (22 de maio)
1959: Viajou com o grupo de Pastinha para Rio de Janeiro e Porto Alegre
1960: Gravado por Janice Marie Smith - documentação em áudio pioneira da capoeira
1962: Apareceu em "O Pagador de Promessas" (vencedor da Palma de Ouro) e "Barravento"
1962-1970s: Apareceu em múltiplos filmes brasileiros: "Operação Tumulto," "Capitães de Areia," "Senhor dos Navegantes," "A Moça Daquela Hora"
1970: Participou do evento Berimbau de Ouro
1981: Homenageado com o Troféu Mestre Canjiquinha pela Federação Paulista de Capoeira
1986: Gravou LP marcante com Mestre Waldemar no estúdio Boca do Rio
1988-1989: Escreveu e publicou "A Alegria da Capoeira"
1988: Fundou a Academia de Canjiquinha e Seus Amigos na Colina do Mar
Criou os toques: Muzenza, Samango, Samba de Angola, Banguela de Angola
Primeiro a integrar maculelê em demonstrações de capoeira
Treinou inúmeros mestres que espalharam a capoeira internacionalmente',
  -- notes (researcher metadata)
  E'Birth date: September 25, 1925 (exact). Death date: November 8, 1994 (exact) per velhosmestres.com. Parents: José Bruno da Silva (tailor) and Amália Maria da Conceição (washerwoman). Teacher was Mestre Raimundo Aberrê (Antônio Raimundo Argolo) - training period 1935-1942. Apelido comes from Roberto Martin''s 1937 song "Canjiquinha Quente" - the only samba he knew. The 1960 recording by Janice Marie Smith is preserved audio documentation. 1950 contra-mestre date under Pastinha per velhosmestres.com timeline. Multiple films documented. 1986 CD with Waldemar recorded September 16, 1986 (some sources say 1984, but primary documentation confirms 1986). Book "A Alegria da Capoeira" written 1988, published 1989 by Editora A Rasteira. Toques (Muzenza, Samango, Samba de Angola, Banguela de Angola) confirmed as his creations by Mestre Geni. The "Centro esportivo de Capoeira Angola" mentioned in some sources refers to his association with Pastinha''s CECA (he was contra-mestre there in 1950), not a separate organization.',
  -- notes_pt
  E'Data de nascimento: 25 de setembro de 1925 (exata). Data de morte: 8 de novembro de 1994 (exata) conforme velhosmestres.com. Pais: José Bruno da Silva (alfaiate) e Amália Maria da Conceição (lavadeira). Professor foi Mestre Raimundo Aberrê (Antônio Raimundo Argolo) - período de treinamento 1935-1942. Apelido vem da música de Roberto Martin de 1937 "Canjiquinha Quente" - o único samba que ele sabia. A gravação de 1960 por Janice Marie Smith é documentação em áudio preservada. Data de contra-mestre de 1950 sob Pastinha conforme linha do tempo velhosmestres.com. Múltiplos filmes documentados. CD de 1986 com Waldemar gravado em 16 de setembro de 1986 (algumas fontes dizem 1984, mas documentação primária confirma 1986). Livro "A Alegria da Capoeira" escrito em 1988, publicado em 1989 pela Editora A Rasteira. Toques (Muzenza, Samango, Samba de Angola, Banguela de Angola) confirmados como suas criações por Mestre Geni. O "Centro esportivo de Capoeira Angola" mencionado em algumas fontes refere-se à sua associação com o CECA de Pastinha (ele foi contra-mestre lá em 1950), não uma organização separada.'
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

-- Source: entities/persons/celso-do-engenho.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Celso do Engenho
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH DATE: October 24, 1939 - Confirmed by Wikipedia PT
-- and capoeirahistory.com.
--
-- DEATH DATE: Still alive as of 2024 (age 85).
-- Instagram posts from 2024-2025 show him active, described as
-- "79 anos de história" (79 years of history/experience).
--
-- STYLE: Mixed/Contemporary - His style was developed
-- "independently of the capoeira schism" according to ACER
-- Cornwall, combining elements learned from Artur Emídio with
-- influences from Rio's diverse capoeira community.
--
-- LINEAGE: Paizinho → Artur Emídio → Celso do Engenho
--
-- SIGNIFICANCE: Key Rio de Janeiro mestre; founder of ACER
-- (1973); one of oldest active living capoeira masters; part of
-- foundational generation of contemporary Rio capoeira alongside
-- Artur Emídio, Leopoldina, Mário Buscapé, Djalma Bandeira,
-- Roque, Paulo Gomes; winner of Prêmio Viva Meu Mestre (2011);
-- important oral history source documenting early Rio capoeira
-- (1910-1950), providing testimony about his cousin "Americano"
-- who practiced "tiririca" at Ilha Grande prison.
--
-- ALTERNATE NAMES: Wikipedia mentions "Celso Galo de Briga" as
-- an alternate name in the backlog notes, but this was not found
-- in any web sources during research.
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
  'Celso Carvalho do Nascimento',
  'Celso do Engenho',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://pt.wikipedia.org/wiki/Mestre_Celso',
    'https://capoeirahistory.com/masters-in-rio-de-janeiro/'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Celso do Engenho''s style was developed "independently of the capoeira schism" between Angola and Regional, according to ACER Cornwall. Training under Mestre Artur Emídio at his academy in Bonsucesso, Rio de Janeiro, Celso absorbed the eclectic environment of Artur''s legendary Sunday rodas, where mestres from all over Brazil - Paraná, Mucungê, and others - would gather. His style reflects this fusion environment that was crucial to the development of Contemporary Capoeira in Rio de Janeiro. At 85 years old, he remains the oldest active Capoeira Master teaching and playing in Rio.',
  E'O estilo de Celso do Engenho foi desenvolvido "independentemente do cisma da capoeira" entre Angola e Regional, segundo a ACER Cornwall. Treinando com Mestre Artur Emídio em sua academia em Bonsucesso, Rio de Janeiro, Celso absorveu o ambiente eclético das lendárias rodas de domingo de Artur, onde mestres de todo o Brasil - Paraná, Mucungê e outros - se reuniam. Seu estilo reflete esse ambiente de fusão que foi crucial para o desenvolvimento da Capoeira Contemporânea no Rio de Janeiro. Aos 85 anos, ele permanece o mais antigo Mestre de Capoeira ativo ensinando e jogando no Rio.',
  -- Life dates
  1939,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (English)
  E'Celso Carvalho do Nascimento, known as Mestre Celso or Celso do Engenho, was born on October 24, 1939, in Rio de Janeiro. He belongs to a generation of capoeiristas born in the 1930s who formed the core from which contemporary capoeira developed in Rio de Janeiro, alongside mestres Artur Emídio, Leopoldina, Mário Buscapé, Djalma Bandeira, Roque, and Paulo Gomes.

Celso learned capoeira from Mestre Artur Emídio at his academy in Bonsucesso, one of the first formal capoeira academies in Rio de Janeiro. There he trained and graduated as a Master along with other important names such as Leopoldina and Djalma Bandeira. A historic photograph from Artur Emídio''s academy shows Celso standing alongside prominent figures including Mintirinha, Aranha, Zé Pedro, Djalma, Silas, Luiz Malhado, Cigano, Artur Emídio, André Lacé, and Preguiça.

In 1973, Celso founded the Associação de Capoeira Engenho da Rainha (ACER) in the Engenho da Rainha suburb of Rio de Janeiro, a working-class neighborhood in the Zona Norte. The organization continues to operate today, with Celso serving as president, and has expanded internationally with branches in the UK including Devon and Cornwall.

During the 1960s and 70s, Celso was recognized as one of the most prominent capoeiristas in Rio de Janeiro. Mestre Gary (Mestre 22 da Bonfim), recalling this dangerous era, listed the notable capoeiristas of the time: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon."

Celso trained students who became important figures in their own right. By 1969, his students João Marcos and Adilson Vitor were teaching at the Furgão club in the Pilares neighborhood, where Master Rui Charuto practiced with them. Celso''s nephew Luizão also became a respected figure in the capoeira community. His son Professor Bicudo continues the lineage, leading ACER branches in Surrey, UK. Student Sunil Ninjinho emerged as "one of the best students from Engenho da Rainha group" and was graded in Brazil during Mestre Celso''s 70th birthday celebration.

Celso has made significant contributions to capoeira history through his oral testimonies. In an important interview recorded on April 23, 2002, he provided valuable accounts of capoeira practices in Rio de Janeiro before the arrival of organized academies. He recalled observing factory worker Maneca performing capoeira-like movements in 1954, noting that practitioners at the time "didn''t say it was capoeira... they said he was a malandro [cunning guy]."

Most significantly, Celso provided testimony about his cousin known as "Americano," who had been imprisoned at Ilha Grande. Celso recounted: "I had a cousin who was also imprisoned at Ilha Grande. Americano, that was his nickname. This cousin of mine also did some capoeira things, rolling on the ground, throwing legs, giving headbutts, but he said that was tiririca, they did it there at Ilha Grande in the prison." This testimony documents the practice of capoeira-like movements called "tiririca" within Rio''s prison system, demonstrating how capoeira techniques persisted under different names during the era of prohibition.

Celso was emphatic that he only saw an actual roda de capoeira after Artur Emídio came to Rio de Janeiro: "The first time I saw a capoeira roda was at Arthur Emídio''s academy in Praça Mauá, in 1959." When asked to define capoeira, Mestre Celso offered the philosophical response: "Capoeira is capoeira" - suggesting the art transcends simple definition.

In 2011, Celso was one of 100 winners of the first edition of the Prêmio Viva Meu Mestre, created by the Instituto do Patrimônio Histórico e Artístico Nacional (IPHAN). This award recognizes capoeira masters aged 55 years or older whose life trajectory has fundamentally contributed to the transmission and continuity of capoeira in Brazil.

As of 2024, Mestre Celso remains active and is described as "the oldest active, living Master teaching and playing Capoeira in Rio." Having trained capoeira for over 65 years, he continues to be a vital link to the foundational era of contemporary Rio de Janeiro capoeira.',
  -- Extended content (Portuguese)
  E'Celso Carvalho do Nascimento, conhecido como Mestre Celso ou Celso do Engenho, nasceu em 24 de outubro de 1939, no Rio de Janeiro. Pertence a uma geração de capoeiristas nascidos nos anos 1930 que formou o núcleo a partir do qual a capoeira contemporânea se desenvolveu no Rio de Janeiro, ao lado dos mestres Artur Emídio, Leopoldina, Mário Buscapé, Djalma Bandeira, Roque e Paulo Gomes.

Celso aprendeu capoeira com Mestre Artur Emídio em sua academia em Bonsucesso, uma das primeiras academias formais de capoeira do Rio de Janeiro. Lá treinou e se formou Mestre junto com outros nomes importantes como Leopoldina e Djalma Bandeira. Uma fotografia histórica da academia de Artur Emídio mostra Celso em pé ao lado de figuras proeminentes incluindo Mintirinha, Aranha, Zé Pedro, Djalma, Silas, Luiz Malhado, Cigano, Artur Emídio, André Lacé e Preguiça.

Em 1973, Celso fundou a Associação de Capoeira Engenho da Rainha (ACER) no subúrbio de Engenho da Rainha, no Rio de Janeiro, um bairro de classe trabalhadora na Zona Norte. A organização continua operando hoje, com Celso servindo como presidente, e expandiu-se internacionalmente com filiais no Reino Unido incluindo Devon e Cornualha.

Durante os anos 1960 e 70, Celso era reconhecido como um dos capoeiristas mais proeminentes do Rio de Janeiro. Mestre Gary (Mestre 22 da Bonfim), recordando essa era perigosa, listou os capoeiristas notáveis da época: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon."

Celso treinou alunos que se tornaram figuras importantes. Em 1969, seus alunos João Marcos e Adilson Vitor ensinavam no clube Furgão no bairro de Pilares, onde Mestre Rui Charuto praticava com eles. O sobrinho de Celso, Luizão, também se tornou uma figura respeitada na comunidade de capoeira. Seu filho Professor Bicudo continua a linhagem, liderando filiais da ACER em Surrey, no Reino Unido. O aluno Sunil Ninjinho emergiu como "um dos melhores alunos do grupo Engenho da Rainha" e foi graduado no Brasil durante a celebração do 70º aniversário de Mestre Celso.

Celso fez contribuições significativas para a história da capoeira através de seus depoimentos orais. Em uma importante entrevista gravada em 23 de abril de 2002, ele forneceu relatos valiosos sobre práticas de capoeira no Rio de Janeiro antes da chegada das academias organizadas. Recordou observar o operário Maneca fazendo movimentos semelhantes à capoeira em 1954, notando que os praticantes na época "não diziam que era capoeira... diziam que ele era um cara malandro."

Mais significativamente, Celso forneceu testemunho sobre seu primo conhecido como "Americano," que havia sido preso na Ilha Grande. Celso relatou: "Eu tinha um primo que também, teve preso na Ilha Grande. Americano, né o apelido dele era Americano. Esse meu primo fazia também algumas coisas de capoeira, rolava no chão, jogava a perna, dava cabeçada, mas ele já dizia que aquilo era tiririca, eles faziam lá na Ilha Grande no presídio." Este testemunho documenta a prática de movimentos semelhantes à capoeira chamados "tiririca" dentro do sistema prisional do Rio, demonstrando como as técnicas de capoeira persistiram sob diferentes nomes durante a era da proibição.

Celso foi enfático que só viu uma roda de capoeira real depois que Artur Emídio chegou ao Rio de Janeiro: "A primeira vez que eu vi uma roda de capoeira foi na academia de Arthur Emídio na Praça Mauá, em 1959." Quando perguntado para definir capoeira, Mestre Celso ofereceu a resposta filosófica: "Capoeira é capoeira" - sugerindo que a arte transcende definição simples.

Em 2011, Celso foi um dos 100 vencedores da primeira edição do Prêmio Viva Meu Mestre, criado pelo Instituto do Patrimônio Histórico e Artístico Nacional (IPHAN). Este prêmio reconhece mestres de capoeira com 55 anos ou mais cuja trajetória de vida contribuiu fundamentalmente para a transmissão e continuidade da capoeira no Brasil.

Em 2024, Mestre Celso permanece ativo e é descrito como "o mais antigo Mestre ativo e vivo ensinando e jogando Capoeira no Rio." Tendo treinado capoeira por mais de 65 anos, ele continua sendo um elo vital com a era fundacional da capoeira contemporânea do Rio de Janeiro.',
  -- Achievements (English)
  E'- Founder of Associação de Capoeira Engenho da Rainha (ACER) in 1973
- Winner of Prêmio Viva Meu Mestre 2011 (IPHAN) - recognizing lifetime contribution to capoeira
- Part of foundational generation of contemporary Rio de Janeiro capoeira (1930s birth cohort)
- Oldest active living capoeira master in Rio de Janeiro as of 2024
- Over 65 years of capoeira practice and teaching
- International expansion of ACER to UK (Devon, Cornwall, Surrey)
- Important oral history source documenting early Rio capoeira practices (1910-1950)
- Provided testimony documenting "tiririca" practice at Ilha Grande prison',
  -- Achievements (Portuguese)
  E'- Fundador da Associação de Capoeira Engenho da Rainha (ACER) em 1973
- Vencedor do Prêmio Viva Meu Mestre 2011 (IPHAN) - reconhecendo contribuição vitalícia à capoeira
- Parte da geração fundacional da capoeira contemporânea do Rio de Janeiro (geração nascida nos anos 1930)
- Mestre de capoeira ativo mais antigo vivo no Rio de Janeiro em 2024
- Mais de 65 anos de prática e ensino de capoeira
- Expansão internacional da ACER para o Reino Unido (Devon, Cornualha, Surrey)
- Fonte importante de história oral documentando práticas iniciais de capoeira no Rio (1910-1950)
- Forneceu testemunho documentando prática de "tiririca" na prisão de Ilha Grande',
  -- Researcher notes (English)
  E'BIRTH DATE: October 24, 1939 - Confirmed by Wikipedia PT ("Rio de Janeiro, 24 de outubro de 1939").

DEATH STATUS: Still alive as of 2024. Instagram posts from 2024-2025 describe him with "79 anos de história" (79 years of history/experience in capoeira). ACER UK website (outdated) mentioned him at 75 years old having trained for 55 years.

ALTERNATE NAME "CELSO GALO DE BRIGA": The backlog entry mentioned this nickname, but it was NOT FOUND in any web sources during research. No confirmation of this alternate name.

TEACHER: Artur Emídio - Confirmed by Wikipedia, capoeirahistory.com, velhosmestres.com. Celso trained at Artur''s academy in Bonsucesso alongside Leopoldina and Djalma Bandeira.

STUDENTS CONFIRMED:
- João Marcos - taught at Furgão club, Pilares (1969)
- Adilson Vitor - taught at Furgão club, Pilares (1969)
- Sunil Ninjinho - described as "one of the best students"
- Professor Bicudo - son, leads ACER UK branches

FAMILY:
- Luizão - nephew, respected capoeirista
- Cousin "Americano" - practiced tiririca at Ilha Grande prison (not a capoeirista to be imported, but connection to existing Americano profile in DB)

ACER FOUNDING: 1973 (informal). Legal registration CNPJ 62.163.576/0001-27 shows founding date 11/08/2025, but this appears to be a reregistration. Earlier CNPJ 01.282.344/0001-01 shows founding 12/06/1996 (now closed). The 1973 date refers to informal founding.

TESTIMONY SOURCE: Academic article "A capoeira no Rio de Janeiro (1910-1950): narrativas de mestre Celso" published in Revista Morpheus (UNIRIO). Interview dated April 23, 2002.

AMERICANO CONNECTION: The "Americano" mentioned by Celso may be the same person already in the database as "Americano (Dois Rios)" - added from Sete Coroas/Madame Satã import. This needs verification but suggests overlap between the sources.

FOUR RIO LINEAGES: capoeirahistory.com identifies four main lineages of Contemporary Capoeira in Rio: Artur Emídio, Paraná, Mário Buscapé, and Roque. Celso is part of the Artur Emídio lineage but is listed separately among the "1930s generation" alongside the founders.

SOURCES CONSULTED:
- pt.wikipedia.org/wiki/Mestre_Celso
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-rui-charuto-1959/
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- capoeiraliberdade.net.br/view/historia.php
- capoeira.fandom.com/wiki/La_Capoeira_à_Rio_de_Janeiro_1910_-_1950
- seer.unirio.br/morpheus/article/view/4102
- capoeiracornwall.co.uk (ACER UK)
- econodata.com.br (ACER CNPJ records)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 24 de outubro de 1939 - Confirmado pela Wikipedia PT ("Rio de Janeiro, 24 de outubro de 1939").

STATUS DE FALECIMENTO: Ainda vivo em 2024. Posts do Instagram de 2024-2025 descrevem-no com "79 anos de história" (79 anos de história/experiência em capoeira). Site da ACER UK (desatualizado) mencionava-o com 75 anos tendo treinado por 55 anos.

NOME ALTERNATIVO "CELSO GALO DE BRIGA": A entrada do backlog mencionava este apelido, mas NÃO FOI ENCONTRADO em nenhuma fonte web durante a pesquisa. Sem confirmação deste nome alternativo.

MESTRE: Artur Emídio - Confirmado pela Wikipedia, capoeirahistory.com, velhosmestres.com. Celso treinou na academia de Artur em Bonsucesso junto com Leopoldina e Djalma Bandeira.

ALUNOS CONFIRMADOS:
- João Marcos - ensinava no clube Furgão, Pilares (1969)
- Adilson Vitor - ensinava no clube Furgão, Pilares (1969)
- Sunil Ninjinho - descrito como "um dos melhores alunos"
- Professor Bicudo - filho, lidera filiais da ACER UK

FAMÍLIA:
- Luizão - sobrinho, capoeirista respeitado
- Primo "Americano" - praticava tiririca na prisão de Ilha Grande (não é capoeirista a ser importado, mas conexão com perfil Americano existente no BD)

FUNDAÇÃO DA ACER: 1973 (informal). Registro legal CNPJ 62.163.576/0001-27 mostra data de fundação 11/08/2025, mas isso parece ser um re-registro. CNPJ anterior 01.282.344/0001-01 mostra fundação 12/06/1996 (agora encerrado). A data de 1973 refere-se à fundação informal.

FONTE DO TESTEMUNHO: Artigo acadêmico "A capoeira no Rio de Janeiro (1910-1950): narrativas de mestre Celso" publicado na Revista Morpheus (UNIRIO). Entrevista datada de 23 de abril de 2002.

CONEXÃO AMERICANO: O "Americano" mencionado por Celso pode ser a mesma pessoa já no banco de dados como "Americano (Dois Rios)" - adicionado da importação Sete Coroas/Madame Satã. Isso precisa de verificação mas sugere sobreposição entre as fontes.

QUATRO LINHAGENS DO RIO: capoeirahistory.com identifica quatro principais linhagens da Capoeira Contemporânea no Rio: Artur Emídio, Paraná, Mário Buscapé e Roque. Celso faz parte da linhagem Artur Emídio mas é listado separadamente entre a "geração dos anos 1930" junto com os fundadores.

FONTES CONSULTADAS:
- pt.wikipedia.org/wiki/Mestre_Celso
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-rui-charuto-1959/
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- capoeiraliberdade.net.br/view/historia.php
- capoeira.fandom.com/wiki/La_Capoeira_à_Rio_de_Janeiro_1910_-_1950
- seer.unirio.br/morpheus/article/view/4102
- capoeiracornwall.co.uk (ACER UK)
- econodata.com.br (registros CNPJ ACER)'
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

-- Source: entities/persons/cimento.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Cimento
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Cimento was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Cimento',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Cimento was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nThe origin of his apelido "Cimento" has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Cimento among the founding mestres who gathered during the criminalization era to preserve traditional capoeira. Cimento was present during the pivotal period when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Cimento have been documented.',
  E'Cimento foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nA origem de seu apelido "Cimento" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Cimento entre os mestres fundadores que se reuniam durante a era da criminalização para preservar a capoeira tradicional. Cimento esteve presente durante o período crucial quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Cimento foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. The origin of the apelido "Cimento" has not been documented. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. A origem do apelido "Cimento" não foi documentada. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/cobra-mansa.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Cobra Mansa
-- Generated: 2025-12-15
-- ============================================================
-- Birth date: May 19, 1960 (exact, per CapoeiraWiki)
-- Still alive as of 2025
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Cinézio Feliciano Peçanha',
  'Cobra Mansa',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://en.wikipedia.org/wiki/Cobra_Mansa',
    'https://capoeirawiki.org/wiki/Cobra_Mansa',
    'https://www.capoeirahub.net/mestres/649fc22f82e3bf0014166fcf-mestre-cobra-mansa',
    'https://capoeira.online/history/mestres/mestre-cobra-mansa/',
    'https://capoeirahistory.com/master-cobra-mansa-phd/'
  ]::text[],
  'angola'::genealogy.style,
  E'Known for his graceful and deceptive style of play. His nicknames ("Cobra Mansa" meaning "tamed snake" and "Cobrinha" meaning "little snake") describe his movement in the roda. His ability to transform situations through innovative and acrobatic solutions has made him one of the most influential angoleiros of his generation. Unlike some Angola purists, he has traveled in Regional circles and worked to mend old disagreements between the two styles. His style continues to be respected through both the Capoeira Angola and Capoeira Regional communities.',
  E'Conhecido por seu estilo gracioso e enganador de jogo. Seus apelidos ("Cobra Mansa" e "Cobrinha") descrevem seu movimento na roda. Sua capacidade de transformar situações através de soluções inovadoras e acrobáticas o tornou um dos angoleiros mais influentes de sua geração. Diferente de alguns puristas da Angola, ele transitou em círculos da Regional e trabalhou para reparar antigas desavenças entre os dois estilos. Seu estilo continua sendo respeitado tanto nas comunidades de Capoeira Angola quanto de Capoeira Regional.',
  1960,
  'exact'::genealogy.date_precision,
  'Duque de Caxias, Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  E'Cinézio Feliciano Peçanha was born on May 19, 1960, in Duque de Caxias, a city near Rio de Janeiro. His childhood was marked by struggle—he worked as a street performer doing acrobatic tricks to survive. As a circus street vendor at Circo Picolino, he developed the physical skills that would later define his capoeira.

In 1973, at thirteen years old, he began learning capoeira in his neighborhood with Josias da Silva and Raimundo. He played in the Duque de Caxias street rodas and co-founded the Caxias Street Roda with Rogerio Russo and Peixinho de Caxias—a roda that continues to this day.

In 1974, everything changed. Cobra Mansa witnessed Mestre Moraes play in the Roda of Central Brazil and was so captivated that he became his student. This relationship would define his trajectory. He followed Moraes when the mestre went to Belo Horizonte, where Cobra Mansa worked as a police officer for two years (1979-1981).

In 1981, Cobra Mansa accompanied Moraes to Salvador, where together they founded the Grupo de Capoeira Angola Pelourinho (GCAP). This was a crucial moment: Capoeira Angola was in severe decline following Pastinha''s death that same year. The art form was seen as something for elderly men. The arrival of these young, energetic practitioners revitalized the community.

In the mid-1980s, Cobra Mansa and Moraes accomplished something remarkable: they convinced Mestre João Grande to return to teaching after he had withdrawn from capoeira following Pastinha''s death. This intervention helped preserve a direct lineage to the old mestres. In 1986, Moraes graduated Cobra Mansa to the rank of Mestre.

In 1993, Cobra Mansa earned a degree in Physical Education from the Catholic University of Salvador. The following year, on invitation from the Ausar Auset Society—an organization promoting African culture—he moved to Washington, D.C. to teach Capoeira Angola to children. What was meant to be a six-month stay extended as his classes grew in popularity, spreading to George Washington University (where he became adjunct professor), Mount Rainier''s Joe''s Movement Emporium, and Gold''s Gym in Van Ness.

After philosophical differences with Moraes over the direction of GCAP, Cobra Mansa departed in 1995-1996 and founded the International Capoeira Angola Foundation (FICA) with Mestre Jurandir Nascimento and Mestre Valmir Damasceno. FICA became the largest Capoeira Angola organization in the world, with affiliates across the United States, Brazil, Europe, Asia, and Africa.

In 2004, Cobra Mansa returned to Brazil and established Kilombo Tenondé, an eco-cultural center with sites in Coutos (Salvador) and Valença, Bahia. The project combines his dual passions: capoeira and permaculture. He obtained his Permaculture Design Certificate in 2007 and has worked in agroecology, bioconstruction, and agroforestry.

From 2010 to 2013, he participated in a major research project on the Angolan roots of capoeira, funded by the UK Arts and Humanities Research Council. He traveled to Angola and Mozambique to study the n''golo martial art and other African traditions that may have contributed to capoeira''s development. This research produced the documentary "Jogo de Corpo: Capoeira e Ancestralidade" (2013), which he co-directed with Matthias Assunção and Richard Pakleppa. The film won six international awards, including the Ousmane Sembene Development Film Award at the Zanzibar International Film Festival.

In 2019, he completed his PhD at the Federal University of Bahia with a thesis titled "Gingando na linha da Kalunga: Capoeira Angola, Engolo e a construção da Ancestralidade" (Gingando on the Kalunga Line: Capoeira Angola, Engolo and the Building of Ancestrality).

In 2023, Cobra Mansa officially joined Mukânda Capoeira Angola, a collective founded by his former students, and began establishing an affiliate group in Bonfim, Bahia.',
  E'Cinézio Feliciano Peçanha nasceu em 19 de maio de 1960, em Duque de Caxias, cidade próxima ao Rio de Janeiro. Sua infância foi marcada pela luta—trabalhava como artista de rua fazendo truques acrobáticos para sobreviver. Como vendedor ambulante no Circo Picolino, desenvolveu as habilidades físicas que mais tarde definiriam sua capoeira.

Em 1973, aos treze anos, começou a aprender capoeira em seu bairro com Josias da Silva e Raimundo. Jogava nas rodas de rua de Duque de Caxias e co-fundou a Roda de Caxias com Rogerio Russo e Peixinho de Caxias—uma roda que continua até hoje.

Em 1974, tudo mudou. Cobra Mansa viu Mestre Moraes jogar na Roda do Central do Brasil e ficou tão cativado que se tornou seu aluno. Essa relação definiria sua trajetória. Ele seguiu Moraes quando o mestre foi para Belo Horizonte, onde Cobra Mansa trabalhou como policial por dois anos (1979-1981).

Em 1981, Cobra Mansa acompanhou Moraes a Salvador, onde juntos fundaram o Grupo de Capoeira Angola Pelourinho (GCAP). Este foi um momento crucial: a Capoeira Angola estava em severo declínio após a morte de Pastinha naquele mesmo ano. A arte era vista como coisa de homens idosos. A chegada desses jovens praticantes enérgicos revitalizou a comunidade.

Em meados dos anos 1980, Cobra Mansa e Moraes realizaram algo notável: convenceram Mestre João Grande a voltar a ensinar depois que ele havia se afastado da capoeira após a morte de Pastinha. Essa intervenção ajudou a preservar uma linhagem direta com os velhos mestres. Em 1986, Moraes formou Cobra Mansa ao grau de Mestre.

Em 1993, Cobra Mansa formou-se em Educação Física pela Universidade Católica de Salvador. No ano seguinte, a convite da Ausar Auset Society—uma organização que promove a cultura africana—mudou-se para Washington, D.C. para ensinar Capoeira Angola para crianças. O que deveria ser uma estadia de seis meses se estendeu à medida que suas aulas cresceram em popularidade, espalhando-se para a George Washington University (onde se tornou professor adjunto), Joe''s Movement Emporium em Mount Rainier e Gold''s Gym em Van Ness.

Após diferenças filosóficas com Moraes sobre a direção do GCAP, Cobra Mansa partiu em 1995-1996 e fundou a Fundação Internacional de Capoeira Angola (FICA) com Mestre Jurandir Nascimento e Mestre Valmir Damasceno. A FICA tornou-se a maior organização de Capoeira Angola do mundo, com afiliados nos Estados Unidos, Brasil, Europa, Ásia e África.

Em 2004, Cobra Mansa retornou ao Brasil e estabeleceu o Kilombo Tenondé, um centro eco-cultural com sedes em Coutos (Salvador) e Valença, Bahia. O projeto combina suas duas paixões: capoeira e permacultura. Obteve seu Certificado de Design em Permacultura em 2007 e trabalha com agroecologia, bioconstrução e agrofloresta.

De 2010 a 2013, participou de um grande projeto de pesquisa sobre as raízes angolanas da capoeira, financiado pelo Arts and Humanities Research Council do Reino Unido. Viajou para Angola e Moçambique para estudar a arte marcial n''golo e outras tradições africanas que podem ter contribuído para o desenvolvimento da capoeira. Essa pesquisa produziu o documentário "Jogo de Corpo: Capoeira e Ancestralidade" (2013), que co-dirigiu com Matthias Assunção e Richard Pakleppa. O filme ganhou seis prêmios internacionais, incluindo o Prêmio Ousmane Sembene de Desenvolvimento no Festival Internacional de Cinema de Zanzibar.

Em 2019, completou seu doutorado na Universidade Federal da Bahia com a tese "Gingando na linha da Kalunga: Capoeira Angola, Engolo e a construção da Ancestralidade".

Em 2023, Cobra Mansa juntou-se oficialmente ao Mukânda Capoeira Angola, um coletivo fundado por seus ex-alunos, e começou a estabelecer um grupo afiliado em Bonfim, Bahia.',
  E'- Founded FICA/ICAF (1995/1996) - largest Capoeira Angola organization in the world
- PhD in Culture and Society from Federal University of Bahia (2019)
- Degree in Physical Education from Catholic University of Salvador (1993)
- Permaculture Design Certificate (2007)
- Co-directed "Jogo de Corpo: Capoeira e Ancestralidade" documentary (2013)
  - Ousmane Sembene Development Film Award at ZIFF 2014
  - Best Editing Prize at Portsmouth International Film Festival 2014
  - Public History Prize from Royal Historical Society
  - Six international awards total
- Adjunct Professor at George Washington University
- Founder of Kilombo Tenondé eco-cultural center (2004)
- Co-founder of Grupo Capoeira Angola Pelourinho (GCAP) (1981)
- Co-founder of Caxias Street Roda
- Principal figure in 1980s Capoeira Angola revival
- Helped convince Mestre João Grande to return to teaching (mid-1980s)
- Research on Angolan roots of capoeira in Angola and Mozambique (2010-2013)
- Authored songs including "Jogo De Dentro Jogo De Fora" and "Valente Besouro"',
  E'- Fundou FICA/ICAF (1995/1996) - maior organização de Capoeira Angola do mundo
- Doutorado em Cultura e Sociedade pela Universidade Federal da Bahia (2019)
- Graduação em Educação Física pela Universidade Católica de Salvador (1993)
- Certificado de Design em Permacultura (2007)
- Co-dirigiu o documentário "Jogo de Corpo: Capoeira e Ancestralidade" (2013)
  - Prêmio Ousmane Sembene de Desenvolvimento no ZIFF 2014
  - Prêmio de Melhor Edição no Portsmouth International Film Festival 2014
  - Prêmio de História Pública da Royal Historical Society
  - Seis prêmios internacionais no total
- Professor Adjunto na George Washington University
- Fundador do Kilombo Tenondé centro eco-cultural (2004)
- Co-fundador do Grupo Capoeira Angola Pelourinho (GCAP) (1981)
- Co-fundador da Roda de Caxias
- Figura principal no renascimento da Capoeira Angola nos anos 1980
- Ajudou a convencer Mestre João Grande a voltar a ensinar (meados dos anos 1980)
- Pesquisa sobre as raízes angolanas da capoeira em Angola e Moçambique (2010-2013)
- Autor de músicas incluindo "Jogo De Dentro Jogo De Fora" e "Valente Besouro"',
  E'Also known as Cobrinha and Cobrinha Mansa.

FICA founding date discrepancy: Some sources cite 1995, others 1996. The organization was likely established informally in 1995 after the First International Capoeira Angola Encounter, with formal incorporation in 1996.

GCAP founding date discrepancy: GCAP was formally founded October 5, 1980 in Cosme Velho, Rio de Janeiro. Cobra Mansa joined in 1981 when it moved to Salvador. Some sources say he co-founded it, others that he joined after the founding.

Prior occupations: photographer, circus street vendor (Circo Picolino), police officer (Belo Horizonte, 2 years 1979-1981).

Left FICA circa 2020s - some groups that were directly tied to him faced the question of whether to leave or stay. Mukânda Capoeira Angola was formed in 2021 by his former students (Contramestre Everson Leão, Contramestre Medusa, Contramestre Toca, Treinel Kathi).

Collaborated with Projeto Axé, a movement supporting at-risk youth in Salvador.

Birth date of May 19, 1960 per CapoeiraWiki; other sources only list 1960.',
  E'Também conhecido como Cobrinha e Cobrinha Mansa.

Discrepância na data de fundação da FICA: Algumas fontes citam 1995, outras 1996. A organização foi provavelmente estabelecida informalmente em 1995 após o Primeiro Encontro Internacional de Capoeira Angola, com incorporação formal em 1996.

Discrepância na data de fundação do GCAP: O GCAP foi formalmente fundado em 5 de outubro de 1980 em Cosme Velho, Rio de Janeiro. Cobra Mansa entrou em 1981 quando se mudou para Salvador. Algumas fontes dizem que ele co-fundou, outras que ele entrou após a fundação.

Ocupações anteriores: fotógrafo, vendedor ambulante de circo (Circo Picolino), policial (Belo Horizonte, 2 anos 1979-1981).

Deixou a FICA por volta dos anos 2020 - alguns grupos diretamente ligados a ele enfrentaram a questão de sair ou permanecer. Mukânda Capoeira Angola foi formado em 2021 por seus ex-alunos (Contramestre Everson Leão, Contramestre Medusa, Contramestre Toca, Treinel Kathi).

Colaborou com o Projeto Axé, um movimento de apoio a jovens em situação de risco em Salvador.

Data de nascimento de 19 de maio de 1960 conforme CapoeiraWiki; outras fontes listam apenas 1960.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/dende-sfc.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Dendê (São Francisco do Conde)
-- Generated: 2025-12-16
-- ============================================================
-- Uncle of Mário Buscapé; first capoeira teacher; trained with
-- Besouro's companions in the Recôncavo; proto-mestre figure.
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
  'Dendê',
  'São Francisco do Conde', -- Critical: distinguishes from Dendê of Santo Amaro and other Dendês
  NULL, -- Pre-codification era; likely proto_mestre but no formal title documented
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Bahian Recôncavo tradition before Angola/Regional distinction
  'Capoeirista from São Francisco do Conde in the Bahian Recôncavo. Trained with Besouro Mangangá''s companions including Siri de Mangue and Canário Pardo. Taught capoeira to his nephew Mário Buscapé in family backyard rodas starting around 1942. Part of the Recôncavo capoeira tradition of the early 20th century.',
  'Capoeirista de São Francisco do Conde no Recôncavo Baiano. Treinou com os companheiros de Besouro Mangangá, incluindo Siri de Mangue e Canário Pardo. Ensinou capoeira ao sobrinho Mário Buscapé em rodas no quintal da família a partir de cerca de 1942. Parte da tradição da capoeira do Recôncavo do início do século XX.',
  -- Life dates
  1890, -- Estimated: would need to be adult by 1920s to train with Besouro's companions, and still teaching in 1942
  'decade'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Dendê was a capoeirista from São Francisco do Conde in the Bahian Recôncavo region. He was the uncle and first capoeira teacher of Mário Buscapé, who later became one of the four founding figures of contemporary capoeira in Rio de Janeiro.

According to Mário Buscapé''s testimony, both his father José Bidel dos Santos and his uncle Dendê practiced capoeira and associated with famous capoeiristas of the Recôncavo, including Siri de Mangue, Canário Pardo, and Besouro from Santo Amaro. According to Mário, the legendary Besouro Mangangá even visited their family home, though this would have been before Mário was born, as Besouro was killed in 1924.

Starting around 1942, when Mário was approximately eight years old, Dendê began teaching his nephew capoeira in improvised rodas held in the family''s backyard. Dendê served as Mário''s primary teacher during these formative years, alongside Mário''s father José Bidel, who also trained him.

Dendê represented a direct link in the lineage from Besouro Mangangá to the contemporary capoeira scene. Lineage records show the connection: Besouro → Bidel → Dendê → Mário Buscapé. Through his teaching, Dendê helped preserve and transmit the traditional Bahian Recôncavo capoeira that his nephew would later bring to Rio de Janeiro in the early 1950s, where it became one of the foundational influences on the modern capoeira movement.

Little else is documented about Dendê''s life, training methods, or other students. He remains one of many Layer Zero capoeira figures—practitioners from the pre-codification era whose legacy lives on primarily through the students they trained and the lineages they helped establish.',
  -- bio_pt
  E'Dendê foi um capoeirista de São Francisco do Conde na região do Recôncavo Baiano. Era tio e primeiro professor de capoeira de Mário Buscapé, que mais tarde se tornou uma das quatro figuras fundadoras da capoeira contemporânea no Rio de Janeiro.

Segundo o testemunho de Mário Buscapé, tanto seu pai José Bidel dos Santos quanto seu tio Dendê praticavam capoeira e se associavam com famosos capoeiristas do Recôncavo, incluindo Siri de Mangue, Canário Pardo e Besouro de Santo Amaro. Segundo Mário, o lendário Besouro Mangangá até visitou a casa da família, embora isso tenha acontecido antes de Mário nascer, pois Besouro foi morto em 1924.

A partir de cerca de 1942, quando Mário tinha aproximadamente oito anos de idade, Dendê começou a ensinar capoeira ao sobrinho em rodas improvisadas no quintal da família. Dendê serviu como professor principal de Mário durante esses anos formativos, ao lado do pai de Mário, José Bidel, que também o treinou.

Dendê representou um elo direto na linhagem de Besouro Mangangá até a cena contemporânea da capoeira. Registros de linhagem mostram a conexão: Besouro → Bidel → Dendê → Mário Buscapé. Através de seu ensino, Dendê ajudou a preservar e transmitir a capoeira tradicional do Recôncavo Baiano que seu sobrinho mais tarde levaria ao Rio de Janeiro no início dos anos 1950, onde se tornou uma das influências fundamentais no movimento moderno da capoeira.

Pouco mais está documentado sobre a vida de Dendê, métodos de ensino ou outros alunos. Ele permanece uma das muitas figuras da Camada Zero da capoeira—praticantes da era pré-codificação cujo legado vive principalmente através dos alunos que treinaram e das linhagens que ajudaram a estabelecer.',
  -- achievements_en
  'First capoeira teacher of Mário Buscapé; Transmitted traditional Bahian Recôncavo capoeira tradition to the next generation; Link in the lineage from Besouro Mangangá to contemporary capoeira',
  -- achievements_pt
  'Primeiro professor de capoeira de Mário Buscapé; Transmitiu a tradição da capoeira tradicional do Recôncavo Baiano para a próxima geração; Elo na linhagem de Besouro Mangangá até a capoeira contemporânea',
  -- Researcher notes (English)
  E'APELIDO_CONTEXT: Set to "São Francisco do Conde" to distinguish from multiple other capoeiristas named Dendê, including:
- Dendê from Santo Amaro (already in database)
- A Dendê listed among teachers of Cobrinha Verde
- Possibly others in the historical record

IDENTITY CONFUSION: Web research revealed potential confusion between different people named Dendê:
1. Mestre Cobrinha Verde listed a "Dendê" among his teachers in Santo Amaro
2. One lineage source shows "Besouro → Dendê → José Bidel → Mário Buscapé"
3. Another shows "Besouro → Bidel → Dendê → Mário Buscapé"

The most reliable account comes from Mário Buscapé himself, who stated that BOTH his father (José Bidel) and uncle (Dendê) taught him, and that both trained with Besouro''s companions. The lineage likely represents that both Bidel and Dendê were students of Besouro''s tradition (possibly through intermediaries like Siri de Mangue), and both taught Mário.

BIRTH YEAR: Estimated as 1890s (decade precision) based on:
- Would need to be an adult (20+) by the 1920s to train with Besouro''s active companions
- Was still actively teaching nephew Mário in 1942 when Mário was 8
- Typical age range would be 40s-50s when teaching in 1942
- This suggests birth around 1890-1900

TITLE: Left as NULL. While he clearly taught capoeira and was respected enough to be Mário''s primary teacher, there is no evidence he held a formal "mestre" title. This was the pre-codification era in the Recôncavo when such titles were not yet formalized. He could be considered a "proto-mestre" figure.

STYLE: NULL - Pre-codification era. The Angola/Regional distinction had not yet emerged when Dendê was teaching in the 1940s in the Recôncavo.

LINEAGE POSITION: Dendê is documented as a critical transmission link in one of the four founding lineages of contemporary capoeira in Rio de Janeiro. The chain goes: Besouro''s companions (Siri de Mangue, Canário Pardo) → Dendê/Bidel → Mário Buscapé → Zé Grande/Deraldo → multiple Rio mestres.

FAMILY RELATIONSHIP: Uncle of Mário Buscapé. Brother-in-law to José Bidel (Mário''s father), or possibly brother to Mário''s mother Maria dos Anjos dos Santos. Sources don''t specify which side of the family.',
  -- Researcher notes (Portuguese)
  E'APELIDO_CONTEXT: Definido como "São Francisco do Conde" para distinguir de múltiplos outros capoeiristas chamados Dendê, incluindo:
- Dendê de Santo Amaro (já no banco de dados)
- Um Dendê listado entre os professores de Cobrinha Verde
- Possivelmente outros no registro histórico

CONFUSÃO DE IDENTIDADE: A pesquisa web revelou potencial confusão entre diferentes pessoas chamadas Dendê:
1. Mestre Cobrinha Verde listou um "Dendê" entre seus professores em Santo Amaro
2. Uma fonte de linhagem mostra "Besouro → Dendê → José Bidel → Mário Buscapé"
3. Outra mostra "Besouro → Bidel → Dendê → Mário Buscapé"

O relato mais confiável vem do próprio Mário Buscapé, que afirmou que TANTO seu pai (José Bidel) quanto seu tio (Dendê) o ensinaram, e que ambos treinaram com os companheiros de Besouro. A linhagem provavelmente representa que tanto Bidel quanto Dendê foram alunos da tradição de Besouro (possivelmente através de intermediários como Siri de Mangue), e ambos ensinaram Mário.

ANO DE NASCIMENTO: Estimado como 1890 (precisão de década) baseado em:
- Precisaria ser adulto (20+) nos anos 1920 para treinar com os companheiros ativos de Besouro
- Ainda estava ensinando ativamente o sobrinho Mário em 1942 quando Mário tinha 8 anos
- Faixa etária típica seria 40-50 anos ao ensinar em 1942
- Isso sugere nascimento por volta de 1890-1900

TÍTULO: Deixado como NULL. Embora ele claramente ensinasse capoeira e fosse respeitado o suficiente para ser o professor principal de Mário, não há evidência de que possuísse um título formal de "mestre". Esta era a era pré-codificação no Recôncavo, quando tais títulos ainda não eram formalizados. Ele poderia ser considerado uma figura "proto-mestre".

ESTILO: NULL - Era pré-codificação. A distinção Angola/Regional ainda não havia surgido quando Dendê estava ensinando nos anos 1940 no Recôncavo.

POSIÇÃO NA LINHAGEM: Dendê está documentado como um elo crítico de transmissão em uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro. A cadeia vai: Companheiros de Besouro (Siri de Mangue, Canário Pardo) → Dendê/Bidel → Mário Buscapé → Zé Grande/Deraldo → múltiplos mestres do Rio.

RELAÇÃO FAMILIAR: Tio de Mário Buscapé. Cunhado de José Bidel (pai de Mário), ou possivelmente irmão da mãe de Mário, Maria dos Anjos dos Santos. As fontes não especificam de que lado da família.'
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

-- Source: entities/persons/djalma-bandeira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Djalma Bandeira
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR: 1934 - Confirmed by capoeirahistory.com
-- DEATH YEAR: 1988 - Confirmed by capoeirahistory.com
--
-- STYLE: Regional/Contemporary - Inherited from his teacher Artur
-- Emídio. Described as "upright and objective capoeira" which he
-- developed through his prize-fighting background. Notably, despite
-- his training in jiu-jitsu, karate, and Portuguese stick fighting,
-- he never applied these in his capoeira game.
--
-- LINEAGE: Neném (African) → Paizinho → Artur Emídio → Djalma Bandeira
--
-- SIGNIFICANCE: First student of Mestre Artur Emídio; travel companion
-- on pioneering international capoeira tours (New York, Paris, Buenos
-- Aires, Acapulco); participated in official introduction of capoeira
-- to Brazilian Navy (1961); founder of Grupo de Capoeira Djalma
-- Bandeira at IAPC in Olaria; referee adviser to Capoeira Directorate
-- of Brazilian Federation of Pugilism (1975); trained students who
-- became important mestres including Vilmar.
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
  'Djalma Bandeira Lima',
  'Djalma Bandeira',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Djalma Bandeira''s style was described as "upright and objective capoeira" - characteristics he acquired through his prize-fighting career in the 1950s. Despite his extensive cross-training in jiu-jitsu (with the Gracies in Copacabana), karate (at Kobucana academy on Largo da Carioca), and Portuguese stick fighting, he was notable for never applying these techniques in his capoeira game. He was very technical and demanding, requiring his students to wear uniforms. His approach reflected the systematized Bahian method transmitted through his teacher Artur Emídio, though his personal style became more direct and combative through his ring experience.',
  E'O estilo de Djalma Bandeira era descrito como uma "capoeira ereta e objetiva" - características que adquiriu através de sua carreira de lutador profissional nos anos 1950. Apesar de seu extenso treinamento cruzado em jiu-jitsu (com os Gracies em Copacabana), karatê (na academia Kobucana no Largo da Carioca) e jogo do pau português, ele era notável por nunca aplicar essas técnicas em seu jogo de capoeira. Era muito técnico e exigente, demandando que seus alunos usassem uniformes. Sua abordagem refletia o método sistematizado baiano transmitido através de seu mestre Artur Emídio, embora seu estilo pessoal tenha se tornado mais direto e combativo através de sua experiência nos ringues.',
  -- Life dates
  1934,
  'exact'::genealogy.date_precision,
  'Sergipe, Brazil',
  1988,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Djalma Bandeira Lima was born in 1934 in Sergipe and spent the greater part of his life in the neighborhood of Olaria, in the northern suburbs of Rio de Janeiro. By profession, he was a tailor.

He learned capoeira from Mestre Artur Emídio de Oliveira, becoming his very first student and building what writer André Lacé Lopes described as a partnership akin to "Don Quixote and Sancho Panza." This close professional and personal relationship would define much of his capoeira career.

A lover of martial arts, Djalma studied jiu-jitsu with the Gracie family in Copacabana, karate at the Kobucana academy on Largo da Carioca, and became an expert practitioner of Portuguese stick fighting (jogo do pau). This passion for combat sports led him to work as a professional fighter during the 1950s and participate in competitions, though without much success. In one such fight against Angelito Cruz, Djalma lost after his opponent applied a footlock. According to his student Mestre Vilmar, he eventually quit fighting to devote himself entirely to capoeira.

His dedication resulted in a famous partnership with Artur Emídio. The two traveled together performing in shows on Brazilian popular culture, with both responsible for the capoeira aspect of these productions. Working with producers Abraão Medina and Carlos Machado, they performed throughout Brazil and internationally - in Buenos Aires, Acapulco, New York, Paris, cities in the Iberian Peninsula, and many other locations. Some of these shows became famous in Rio de Janeiro, including "Capital Samba," "Skindô," and the musical "Arco-Íris," which featured great artists such as Joãozinho da Goméia, Ary Barroso, and Mestre Paraná.

In 1961, Djalma Bandeira and Artur Emídio participated in the official introduction of capoeira into the Brazilian Navy. Working with Lieutenant Lamartine Pereira da Costa from the School of Physical Education, the duo assisted in teaching a course on the "methodology of teaching capoeira" to 208 officers and enlisted men at the Navy Sports Centre. The objective was to train capoeira monitors who would propagate the practice throughout all Navy establishments.

Despite his journey being marked by his partnership with Artur Emídio and their shows, Djalma Bandeira established himself as a significant capoeira teacher and martial arts researcher in his own right. He started to organize capoeira classes in Olaria, specifically at the IAPC Residential Complex Community Centre, where he founded Grupo de Capoeira Djalma Bandeira. He taught children for free and began staging exhibitions with students from his group.

One of his most notable students was Mestre Vilmar (Vilmar Brito Cruz), who described his teacher as "one of the best capoeira masters that a suburb of Rio de Janeiro has ever produced, in a time when the best capoeira in the world was played in the suburbs of Rio." Celso Pepe, who later became an important mestre himself, was a neighbor at the IAPC estate and first encountered capoeira in 1957 through Djalma''s Sunday classes. Though initially refused due to his young age of eight, Celso watched Djalma''s training and rodas, later crediting Djalma with teaching him the São Bento Grande game.

Djalma Bandeira also participated in the early stages of regulating capoeira practice in Rio de Janeiro. In 1975, he was appointed referee adviser to the Capoeira Directorate of the Brazilian Federation of Pugilism (where capoeira was administratively housed at the time).

He was part of a whole generation of capoeiristas born in the 1930s - including Artur Emídio, Leopoldina, Mário Buscapé, Roque, Paulo Gomes, and Celso do Engenho - who formed the core from which contemporary capoeira developed in Rio de Janeiro. During the sixties and seventies, the North Zone''s finest capoeira was concentrated in Bonsucesso and surrounding neighborhoods like Higienópolis and Olaria, where masters like Artur Emídio, Paraná, Djalma Bandeira, Mário Buscapé, and Mentirinha lived, worked, or taught.

Those who knew him described Djalma as "frank and sincere, almost rude, a good character, a good friend." He died in 1988, at approximately 54 years of age.',
  -- Extended content (Portuguese)
  E'Djalma Bandeira Lima nasceu em 1934 em Sergipe e passou a maior parte de sua vida no bairro de Olaria, nos subúrbios norte do Rio de Janeiro. De profissão, era alfaiate.

Aprendeu capoeira com Mestre Artur Emídio de Oliveira, tornando-se seu primeiro aluno e construindo o que o escritor André Lacé Lopes descreveu como uma parceria semelhante a "Dom Quixote e Sancho Pança." Essa relação profissional e pessoal próxima definiria grande parte de sua carreira na capoeira.

Amante das artes marciais, Djalma estudou jiu-jitsu com a família Gracie em Copacabana, karatê na academia Kobucana no Largo da Carioca e tornou-se praticante especialista do jogo do pau português. Essa paixão por esportes de combate o levou a trabalhar como lutador profissional durante os anos 1950 e participar de competições, embora sem muito sucesso. Em uma dessas lutas contra Angelito Cruz, Djalma perdeu após seu oponente aplicar uma chave de pé. Segundo seu aluno Mestre Vilmar, ele eventualmente abandonou as lutas para se dedicar inteiramente à capoeira.

Sua dedicação resultou em uma famosa parceria com Artur Emídio. Os dois viajavam juntos se apresentando em shows sobre cultura popular brasileira, ambos responsáveis pelo aspecto de capoeira dessas produções. Trabalhando com os produtores Abraão Medina e Carlos Machado, se apresentaram por todo o Brasil e internacionalmente - em Buenos Aires, Acapulco, Nova York, Paris, cidades da Península Ibérica e muitos outros locais. Alguns desses shows se tornaram famosos no Rio de Janeiro, incluindo "Capital Samba," "Skindô" e o musical "Arco-Íris," que contou com grandes artistas como Joãozinho da Goméia, Ary Barroso e Mestre Paraná.

Em 1961, Djalma Bandeira e Artur Emídio participaram da introdução oficial da capoeira na Marinha do Brasil. Trabalhando com o Tenente Lamartine Pereira da Costa da Escola de Educação Física, a dupla auxiliou no ensino de um curso sobre a "metodologia de ensino de capoeira" para 208 oficiais e praças no Centro de Esportes da Marinha. O objetivo era formar monitores de capoeira que propagariam a prática em todos os estabelecimentos da Marinha.

Apesar de sua trajetória ser marcada pela parceria com Artur Emídio e seus shows, Djalma Bandeira se estabeleceu como um significativo professor de capoeira e pesquisador de artes marciais por mérito próprio. Começou a organizar aulas de capoeira em Olaria, especificamente no Centro Comunitário do Conjunto Residencial do IAPC, onde fundou o Grupo de Capoeira Djalma Bandeira. Ensinava crianças gratuitamente e começou a fazer exibições com alunos de seu grupo.

Um de seus alunos mais notáveis foi Mestre Vilmar (Vilmar Brito Cruz), que descreveu seu professor como "um dos melhores mestres de capoeira que um subúrbio do Rio de Janeiro já produziu, em uma época em que a melhor capoeira do mundo era jogada nos subúrbios do Rio." Celso Pepe, que mais tarde se tornou um importante mestre, era vizinho no conjunto IAPC e conheceu a capoeira pela primeira vez em 1957 através das aulas de domingo de Djalma. Embora inicialmente recusado devido à sua pouca idade de oito anos, Celso assistia aos treinos e rodas de Djalma, creditando-o mais tarde por ensinar-lhe o jogo de São Bento Grande.

Djalma Bandeira também participou dos estágios iniciais da regulamentação da prática de capoeira no Rio de Janeiro. Em 1975, foi nomeado conselheiro de arbitragem da Diretoria de Capoeira da Confederação Brasileira de Pugilismo (onde a capoeira estava administrativamente alocada na época).

Ele fazia parte de toda uma geração de capoeiristas nascidos nos anos 1930 - incluindo Artur Emídio, Leopoldina, Mário Buscapé, Roque, Paulo Gomes e Celso do Engenho - que formou o núcleo a partir do qual a capoeira contemporânea se desenvolveu no Rio de Janeiro. Durante os anos sessenta e setenta, a melhor capoeiragem da Zona Norte estava concentrada em Bonsucesso e bairros vizinhos como Higienópolis e Olaria, onde mestres como Artur Emídio, Paraná, Djalma Bandeira, Mário Buscapé e Mentirinha moravam, trabalhavam ou ensinavam.

Aqueles que o conheciam descreviam Djalma como "franco e sincero, quase rude, de bom caráter, um bom amigo." Ele faleceu em 1988, com aproximadamente 54 anos de idade.',
  -- Achievements (English)
  E'- First student of Mestre Artur Emídio
- Pioneer of international capoeira performance touring (New York, Paris, Buenos Aires, Acapulco, Iberian Peninsula) in the 1950s-60s
- Participated in official introduction of capoeira to Brazilian Navy (1961)
- Founder of Grupo de Capoeira Djalma Bandeira at IAPC Residential Complex, Olaria
- Appointed referee adviser to Capoeira Directorate of Brazilian Federation of Pugilism (1975)
- Taught children free of charge in the northern suburbs of Rio de Janeiro
- Featured performer in folklore shows "Capital Samba," "Skindô," and musical "Arco-Íris"
- Part of founding generation of contemporary capoeira in Rio de Janeiro
- Expert in Portuguese stick fighting (jogo do pau)',
  -- Achievements (Portuguese)
  E'- Primeiro aluno de Mestre Artur Emídio
- Pioneiro em turnês internacionais de apresentação de capoeira (Nova York, Paris, Buenos Aires, Acapulco, Península Ibérica) nos anos 1950-60
- Participou da introdução oficial da capoeira na Marinha do Brasil (1961)
- Fundador do Grupo de Capoeira Djalma Bandeira no Conjunto Residencial do IAPC, Olaria
- Nomeado conselheiro de arbitragem da Diretoria de Capoeira da Confederação Brasileira de Pugilismo (1975)
- Ensinou crianças gratuitamente nos subúrbios norte do Rio de Janeiro
- Artista em destaque nos shows folclóricos "Capital Samba," "Skindô" e musical "Arco-Íris"
- Parte da geração fundadora da capoeira contemporânea no Rio de Janeiro
- Especialista em jogo do pau português',
  -- Researcher notes (English)
  E'BIRTH YEAR: 1934 - Confirmed by capoeirahistory.com. Sergipe is the stated birthplace, though no more specific location is given.

DEATH YEAR: 1988 - Confirmed by capoeirahistory.com. Death place assumed to be Rio de Janeiro where he lived.

RELATIONSHIP WITH ARTUR EMÍDIO: Described as "his first student" and characterized by André Lacé Lopes as a "Don Quixote and Sancho Panza" partnership. The two traveled extensively together and performed as a duo.

MARTIAL ARTS CROSS-TRAINING: Despite training in jiu-jitsu (Gracie family), karate (Kobucana academy), and Portuguese stick fighting, sources emphasize he "never applied jiu-jitsu or karate in his capoeira game." This suggests a purist approach to capoeira despite his eclectic martial arts background.

PROFESSIONAL FIGHTING: Worked as a professional fighter in the 1950s "without much success." Lost to Angelito Cruz by footlock.

STUDENTS:
- Mestre Vilmar (Vilmar Brito Cruz) - confirmed student, gave testimony about Djalma
- Celso Pepe - neighbor at IAPC; observed Djalma''s classes from 1957; credits Djalma with teaching São Bento Grande game; was also trained by Leopoldina

NAVY COURSE (1961): Assisted Lamartine Pereira da Costa in teaching 208 naval personnel. Lamartine was also a student of Artur Emídio. This represents one of the first institutional adoptions of capoeira by Brazilian military.

GRUPO DE CAPOEIRA DJALMA BANDEIRA: Founded at IAPC Residential Complex in Olaria. The IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) was a social security housing estate. The group established itself at the Community Centre there.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/ (primary)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-celso-pepe-1949/
- capoeirahistory.com/mestre/professor-lamartine-eng-1935/
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: 1934 - Confirmado por capoeirahistory.com. Sergipe é o local de nascimento indicado, embora não seja dado local mais específico.

ANO DE FALECIMENTO: 1988 - Confirmado por capoeirahistory.com. Local de falecimento presumido ser Rio de Janeiro, onde ele morava.

RELACIONAMENTO COM ARTUR EMÍDIO: Descrito como "seu primeiro aluno" e caracterizado por André Lacé Lopes como uma parceria "Dom Quixote e Sancho Pança". Os dois viajaram extensivamente juntos e se apresentavam como dupla.

TREINAMENTO CRUZADO EM ARTES MARCIAIS: Apesar de treinar jiu-jitsu (família Gracie), karatê (academia Kobucana) e jogo do pau português, as fontes enfatizam que ele "nunca aplicou jiu-jitsu ou karatê em seu jogo de capoeira." Isso sugere uma abordagem purista à capoeira apesar de seu histórico eclético em artes marciais.

LUTAS PROFISSIONAIS: Trabalhou como lutador profissional nos anos 1950 "sem muito sucesso." Perdeu para Angelito Cruz por chave de pé.

ALUNOS:
- Mestre Vilmar (Vilmar Brito Cruz) - aluno confirmado, deu depoimento sobre Djalma
- Celso Pepe - vizinho no IAPC; observou as aulas de Djalma desde 1957; credita a Djalma o ensino do jogo de São Bento Grande; também foi treinado por Leopoldina

CURSO DA MARINHA (1961): Auxiliou Lamartine Pereira da Costa no ensino de 208 militares navais. Lamartine também era aluno de Artur Emídio. Isso representa uma das primeiras adoções institucionais da capoeira pelas forças armadas brasileiras.

GRUPO DE CAPOEIRA DJALMA BANDEIRA: Fundado no Conjunto Residencial do IAPC em Olaria. O IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) era um conjunto habitacional da previdência social. O grupo se estabeleceu no Centro Comunitário de lá.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/ (primária)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-celso-pepe-1949/
- capoeirahistory.com/mestre/professor-lamartine-eng-1935/
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/'
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

-- Source: entities/persons/dois-de-ouro.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Dois de Ouro
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- No birth date documented. He was active in street rodas at Mercado
-- Modelo in the 1980s-1990s and died November 2001. Mestre Bira de Oxóssi
-- first learned from him in 1975, and Tonho Matéria played with him
-- "quando garoto" (as a boy) in street rodas during festas de largo.
-- Given he was a co-founder of Filhos de Angola in 1960 (alongside
-- Onça Preta born 1909 and Roque born 1938), he was likely born
-- circa 1920s. Using 1920 as decade estimate (precision: decade).
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Dois de Ouro', 'mestre'::genealogy.title, NULL,
  ARRAY['https://esquiva.wordpress.com/mestres/mestre-dois-de-ouro/']::text[],
  'angola'::genealogy.style,
  E'Dois de Ouro defined his style as "capoeira angoregional de rua" (street angoregional capoeira) - a blend that combined Angola traditions with the speed and technique of street capoeira. He was known for his distinctive rasteiras (leg sweeps) and his fast, cunning gameplay.',
  E'Dois de Ouro definia seu estilo como "capoeira angoregional de rua" - uma mistura que combinava tradições da Angola com a velocidade e técnica da capoeira de rua. Era conhecido por suas rasteiras distintas e seu jogo rápido e mandingueiro.',
  1920, 'decade'::genealogy.date_precision, 'Salvador, Bahia',
  2001, 'month'::genealogy.date_precision, 'Salvador, Bahia',
  E'Dois de Ouro was a Bahian angoleiro whose name remains synonymous with street capoeira in Salvador. A member of the Associação Brasileira de Capoeira Angola in Salvador, he was recognized for his precision, speed, and cunning gameplay - described by those who witnessed him as "um capoeirista desconfiado, rápido e mandingueiro" who executed rasteiras (leg sweeps) in a distinctive and memorable way.\n\nHe was part of the wave of Bahian capoeiristas who migrated to Rio de Janeiro in the 1950s. On July 21, 1960, together with fellow Bahian angoleiros Mucungê, Baleado, Onça Preta, Imagem do Cão, and Roque, he co-founded Grupo Filhos de Angola in Rio de Janeiro. This group became pioneers in teaching capoeira in the city, participating in tournaments like the Berimbau de Ouro (1967) and folkloric exhibitions such as "Uma Noite na Bahia."\n\nDespite his time in Rio, Dois de Ouro maintained strong ties to Salvador, where he continued to participate in the rodas de rua (street rodas) at festas de largo and at the Mercado Modelo. He was remembered alongside legendary figures including Caicara, Eziquiel, Canjiquinha, Paulo dos Anjos, Desente, and Bom Cabrito.\n\nHe passed away in November 2001 in Salvador, leaving behind students who preserve his memory. Mestre Bira de Oxóssi, who describes Dois de Ouro as his "mestre na angola," learned from him the fundamentals of what Dois de Ouro called "capoeira angoregional de rua." Contramestre Sergio Ferreira also trained with him and learned the art of making berimbaus from his hands.\n\nIn the book "Mestres e capoeiras famosos da Bahia," a chapter is dedicated to him: "Dois de Ouro: O capoeira de rua" (The street capoeirista). As he himself often said: "A capoeira foi um dom que Deus me deu" (Capoeira was a gift that God gave me).',
  E'Dois de Ouro foi um angoleiro baiano cujo nome permanece sinônimo de capoeira de rua em Salvador. Membro da Associação Brasileira de Capoeira Angola em Salvador, era reconhecido por sua precisão, velocidade e jogo mandingueiro - descrito por aqueles que o viram como "um capoeirista desconfiado, rápido e mandingueiro" que executava rasteiras de um jeito especial e memorável.\n\nFez parte da onda de capoeiristas baianos que migraram para o Rio de Janeiro nos anos 1950. Em 21 de julho de 1960, junto com outros angoleiros baianos Mucungê, Baleado, Onça Preta, Imagem do Cão e Roque, co-fundou o Grupo Filhos de Angola no Rio de Janeiro. Este grupo tornou-se pioneiro no ensino de capoeira na cidade, participando de torneios como o Berimbau de Ouro (1967) e apresentações folclóricas como "Uma Noite na Bahia."\n\nApesar de seu tempo no Rio, Dois de Ouro manteve fortes laços com Salvador, onde continuou a participar das rodas de rua nas festas de largo e no Mercado Modelo. Era lembrado ao lado de figuras lendárias incluindo Caicara, Eziquiel, Canjiquinha, Paulo dos Anjos, Desente e Bom Cabrito.\n\nFaleceu em novembro de 2001 em Salvador, deixando alunos que preservam sua memória. Mestre Bira de Oxóssi, que descreve Dois de Ouro como seu "mestre na angola," aprendeu com ele os fundamentos do que Dois de Ouro chamava de "capoeira angoregional de rua." Contramestre Sergio Ferreira também treinou com ele e aprendeu a arte de fazer berimbaus de suas mãos.\n\nNo livro "Mestres e capoeiras famosos da Bahia," um capítulo é dedicado a ele: "Dois de Ouro: O capoeira de rua." Como ele mesmo costumava dizer: "A capoeira foi um dom que Deus me deu."',
  E'Co-founded Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960)\nFeatured in book "Mestres e capoeiras famosos da Bahia"\nParticipated in Berimbau de Ouro tournament (1967)\nPerformed in folkloric show "Uma Noite na Bahia"\nTaught fundamentals to Mestre Bira de Oxóssi\nTaught berimbau making to Contramestre Sergio Ferreira',
  E'Co-fundador do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960)\nDestaque no livro "Mestres e capoeiras famosos da Bahia"\nParticipou do torneio Berimbau de Ouro (1967)\nApresentou-se no show folclórico "Uma Noite na Bahia"\nEnsinou fundamentos ao Mestre Bira de Oxóssi\nEnsinou fabricação de berimbau ao Contramestre Sergio Ferreira',
  E'Full name unknown. Birth year estimated circa 1920s based on: active as mestre in 1960 co-founding Filhos de Angola alongside contemporaries Onça Preta (b. 1909) and Roque (b. 1938); active in Salvador street rodas through the 1980s-1990s; died November 2001. Death month from esquiva.wordpress.com which gives date as "11-2001." Tonho Matéria recalls playing with him "quando garoto" (as a boy) in street rodas. The founding date of Filhos de Angola has two reported dates: June 27, 1960 (velhosmestres.com Portuguese) and July 21, 1960 (velhosmestres.com English); July 21 used as primary based on more detailed source.',
  E'Nome completo desconhecido. Ano de nascimento estimado circa anos 1920 baseado em: ativo como mestre em 1960 co-fundando Filhos de Angola ao lado de contemporâneos Onça Preta (n. 1909) e Roque (n. 1938); ativo nas rodas de rua de Salvador durante os anos 1980-1990; faleceu em novembro de 2001. Mês de falecimento de esquiva.wordpress.com que dá a data como "11-2001." Tonho Matéria lembra de ter jogado com ele "quando garoto" nas rodas de rua. A data de fundação do Filhos de Angola tem duas versões: 27 de junho de 1960 (velhosmestres.com português) e 21 de julho de 1960 (velhosmestres.com inglês); 21 de julho usado como primário baseado em fonte mais detalhada.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/edgar.sql (NEW)
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

-- Source: entities/persons/feliciano-bigode-de-seda.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Feliciano Bigode de Seda
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Feliciano was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Feliciano Bigode de Seda',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Feliciano "Bigode de Seda" ("Silk Mustache") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nThe origin of his nickname "Bigode de Seda" has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Feliciano Bigode de Seda among the founding mestres and noted him as one of the many skilled capoeiristas who were attracted to the first organized Capoeira Centre. The center, led by four "donos e proprietários" (Noronha, Livino, Totonho de Maré, and Amorzinho), used the green and yellow colors of the Brazilian flag as their symbolic colors.\n\nFeliciano was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA (Centro Esportivo de Capoeira Angola).\n\nNo further biographical details about Feliciano Bigode de Seda have been documented.',
  E'Feliciano "Bigode de Seda" ("Bigode de Seda") foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nA origem de seu apelido "Bigode de Seda" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Feliciano Bigode de Seda entre os mestres fundadores e o destacou como um dos muitos capoeiristas habilidosos que foram atraídos ao primeiro Centro de Capoeira organizado. O centro, liderado por quatro "donos e proprietários" (Noronha, Livino, Totonho de Maré e Amorzinho), usava as cores verde e amarela da bandeira brasileira como suas cores simbólicas.\n\nFeliciano esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA (Centro Esportivo de Capoeira Angola).\n\nNenhum outro detalhe biográfico sobre Feliciano Bigode de Seda foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. The origin of the nickname "Bigode de Seda" has not been documented. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. A origem do apelido "Bigode de Seda" não foi documentada. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/forro.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Forró
-- Generated: 2025-12-15
-- Primary Sources: https://forum-brasil.de/capoeira/
--                  https://www.lalaue.com/hannover/capoeira-angola-hannover-aldeia-de-angola/
--                  https://www.capoeira-angola-hannover.de/
-- ============================================================
-- DEPENDENCIES: Marrom (Rio de Janeiro) must exist
-- ============================================================
--
-- FULL APELIDO: Forró Àlágbè (also written Forró Alabé)
-- Using simplified "Forró" as apelido for database compatibility.
--
-- BIRTH YEAR:
-- Born 1976 (confirmed via oral history: will turn 50 in 2026).
-- Using 1976 with 'exact' precision.
--
-- TRAINING HISTORY:
-- - Origin: Belém do Pará, Northern Brazil
-- - Lived and worked in Rio de Janeiro for nearly 20 years as actor, percussionist, capoeira teacher
-- - Trained under Mestre Marrom (Ngoma Capoeira Angola) in Rio de Janeiro
-- - 2004: Made Contra-Mestre by Mestre Marrom in Rio de Janeiro (per user oral history)
-- - Later received Mestre title (exact date unknown)
-- - Moved to Germany (currently Hannover, also teaches in Berlin)
--
-- GROUP AFFILIATIONS:
-- - Ngoma Capoeira Angola (student/affiliate of Mestre Marrom)
-- - Centro Cultural Aldeia de Angola (founded in Hannover, Germany)
-- - Forum Brasil Berlin (teaches children's capoeira)
--
-- PROFESSIONAL BACKGROUND:
-- - Actor (15+ years in Rio de Janeiro)
-- - Percussionist specializing in Afro-Brazilian rhythms
-- - Co-leads "Batucajé" music project with Sigga Glitz (wife)
-- - Extensive work with children and youth education in Germany
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Joelson Menezes da Silva',
  'Forró',
  NULL,
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeira-angola-hannover.de/', 'https://www.lalaue.com/hannover/capoeira-angola-hannover-aldeia-de-angola/', 'https://forum-brasil.de/capoeira/']::text[],
  'angola'::genealogy.style,
  E'Mestre Forró teaches traditional Capoeira Angola, emphasizing the art''s African and Afro-Brazilian roots. His approach integrates movement with music, percussion, and dance from Afro-Brazilian popular culture. Beyond pure capoeira technique, he brings elements of Candomblé rhythms and northeastern Brazilian traditions into his practice, reflecting both his Amazonian origins and his years studying in Rio de Janeiro under Mestre Marrom.',
  E'Mestre Forró ensina Capoeira Angola tradicional, enfatizando as raízes africanas e afro-brasileiras da arte. Sua abordagem integra movimento com música, percussão e dança da cultura popular afro-brasileira. Além da técnica pura de capoeira, ele traz elementos dos ritmos do Candomblé e das tradições nordestinas brasileiras para sua prática, refletindo tanto suas origens amazônicas quanto seus anos de estudo no Rio de Janeiro sob Mestre Marrom.',
  1976,
  'exact'::genealogy.date_precision,
  'Belém, Pará, Brazil',
  NULL,
  NULL,
  NULL,
  E'Joelson Menezes da Silva was born in Belém do Pará in northern Brazil in 1976. From a young age, he dedicated himself to researching and teaching Afro-Brazilian culture, eventually working across various regions of Brazil for nearly two decades as an actor, percussionist, and capoeira teacher.\n\nIn Rio de Janeiro, Forró spent approximately fifteen years immersed in the city''s cultural scene. There he trained in Capoeira Angola under Mestre Marrom (Henrique Anastácio de Jesus), becoming part of the growing community around Marrom Capoeira & Alunos (later renamed Ngoma Capoeira Angola). In 2004, Mestre Marrom formally recognized his development by conferring the title of Contra-Mestre upon him in Rio.\n\nAfter nearly two decades in Brazil''s southeast, Forró relocated to Germany around 2012, settling in Hannover where he established his own center: Centro Cultural Aldeia de Angola. The group, also known as Capoeira Angola Hannover-Aldeia de Angola, offers regular training in Hannover and Hildesheim, along with children''s classes and cultural workshops.\n\nIn Germany, Mestre Forró has become an active figure in cultural education. He has worked with numerous schools and youth programs throughout Lower Saxony, including the Astrid-Lindgren-School (2008), "Youth and Justice" project (2010), Käthe-Kollwitz-School, IGS Kronsberg, and various summer programs. Since 2020, he has partnered with KinderKulturAbo for primary school programs, and participated in the "Culture Makes Strong" project with Hildesheim Music School.\n\nBeyond Hannover, Forró teaches children''s capoeira classes at Forum Brasil in Berlin, where he works with students ages 3-11. He also travels throughout Europe conducting workshops, sharing his knowledge of capoeira Angola, Afro-Brazilian percussion, and popular dances like forró and samba de roda.\n\nTogether with his wife Sigga Glitz, a trained musician from northern Germany who has devoted herself to Brazilian culture, Forró co-leads "Batucajé"—a musical project that takes audiences on a journey through Brazilian rhythms. His full apelido, "Forró Àlágbè," reflects both the northeastern Brazilian dance/music tradition and the Yoruba term "àlágbè" (drummer/master of sacred drums), acknowledging his dual expertise in capoeira and percussion.\n\nToday, Mestre Forró continues to bridge Afro-Brazilian traditions and German cultural education, using capoeira as a tool for anti-racist education and cultural preservation.',
  E'Joelson Menezes da Silva nasceu em Belém do Pará, no norte do Brasil, em 1976. Desde jovem, dedicou-se a pesquisar e ensinar a cultura afro-brasileira, eventualmente trabalhando em várias regiões do Brasil por quase duas décadas como ator, percussionista e professor de capoeira.\n\nNo Rio de Janeiro, Forró passou aproximadamente quinze anos imerso na cena cultural da cidade. Lá ele treinou Capoeira Angola sob Mestre Marrom (Henrique Anastácio de Jesus), tornando-se parte da crescente comunidade em torno do Marrom Capoeira & Alunos (posteriormente renomeado Ngoma Capoeira Angola). Em 2004, Mestre Marrom reconheceu formalmente seu desenvolvimento conferindo-lhe o título de Contra-Mestre no Rio.\n\nApós quase duas décadas no sudeste do Brasil, Forró mudou-se para a Alemanha por volta de 2012, estabelecendo-se em Hannover onde fundou seu próprio centro: Centro Cultural Aldeia de Angola. O grupo, também conhecido como Capoeira Angola Hannover-Aldeia de Angola, oferece treinamento regular em Hannover e Hildesheim, junto com aulas para crianças e oficinas culturais.\n\nNa Alemanha, Mestre Forró tornou-se uma figura ativa na educação cultural. Ele trabalhou com numerosas escolas e programas de juventude em toda a Baixa Saxônia, incluindo a Escola Astrid-Lindgren (2008), projeto "Juventude e Justiça" (2010), Escola Käthe-Kollwitz, IGS Kronsberg e vários programas de verão. Desde 2020, ele tem parceria com KinderKulturAbo para programas de escolas primárias, e participou do projeto "Cultura Fortalece" com a Escola de Música de Hildesheim.\n\nAlém de Hannover, Forró ensina aulas de capoeira para crianças no Forum Brasil em Berlim, onde trabalha com alunos de 3 a 11 anos. Ele também viaja por toda a Europa conduzindo oficinas, compartilhando seu conhecimento de capoeira Angola, percussão afro-brasileira e danças populares como forró e samba de roda.\n\nJunto com sua esposa Sigga Glitz, uma musicista treinada do norte da Alemanha que se dedicou à cultura brasileira, Forró co-lidera "Batucajé"—um projeto musical que leva o público a uma jornada pelos ritmos brasileiros. Seu apelido completo, "Forró Àlágbè," reflete tanto a tradição de dança/música do nordeste brasileiro quanto o termo iorubá "àlágbè" (tocador de tambor/mestre de tambores sagrados), reconhecendo sua dupla expertise em capoeira e percussão.\n\nHoje, Mestre Forró continua a construir pontes entre as tradições afro-brasileiras e a educação cultural alemã, usando a capoeira como ferramenta para educação antirracista e preservação cultural.',
  E'Founded Centro Cultural Aldeia de Angola (Hannover, Germany)\nEstablished Capoeira Angola presence in Hannover and Hildesheim\nPioneer of capoeira-based cultural education in Lower Saxony schools\nExtensive children''s education work (2008-present)\nPartner of KinderKulturAbo primary school programs (2020+)\nParticipant in "Culture Makes Strong" (Kultur macht stark) federal education program\nCo-founder of Batucajé Afro-Brazilian music project\nInternational workshop leader throughout Europe\nRegular instructor at Forum Brasil Berlin',
  E'Fundou o Centro Cultural Aldeia de Angola (Hannover, Alemanha)\nEstabeleceu presença de Capoeira Angola em Hannover e Hildesheim\nPioneiro da educação cultural baseada em capoeira nas escolas da Baixa Saxônia\nExtenso trabalho de educação infantil (2008-presente)\nParceiro dos programas de escolas primárias KinderKulturAbo (2020+)\nParticipante do programa federal de educação "Cultura Fortalece" (Kultur macht stark)\nCo-fundador do projeto de música afro-brasileira Batucajé\nLíder de oficinas internacionais por toda a Europa\nInstrutor regular no Forum Brasil Berlin',
  E'FULL APELIDO: Forró Àlágbè (also written Forró Alabé)\nThe name combines:\n- "Forró" - northeastern Brazilian dance/music genre (also his birthplace region''s culture)\n- "Àlágbè" - Yoruba term for drummer/master of sacred drums in Candomblé\n\nBIRTH YEAR: 1976 (confirmed via oral history: will turn 50 in 2026).\n\nTIMELINE:\n- 1976: Born in Belém, Pará, northern Brazil\n- ~1990s-2000s: Worked as actor, percussionist, capoeira teacher in Rio de Janeiro (~15-20 years)\n- 2004: Made Contra-Mestre by Mestre Marrom in Rio de Janeiro (oral history confirmation)\n- ~2012: Moved to Germany (sources state "12 years" as of 2024/2025)\n- 2008+: Began cultural education work in German schools\n- Unknown: Received Mestre title\n\nTEACHING LOCATIONS:\n- Hannover: Centro Cultural Aldeia de Angola (Allerweg 7, 30449 Hannover)\n- Hildesheim: Regular training\n- Berlin: Forum Brasil (children''s classes)\n- Europe: International workshops\n\nFAMILY:\n- Wife: Sigga Glitz (musician, co-leads Batucajé)\n\nLINEAGE:\n- Mestre Marrom (Ngoma Capoeira Angola) → direct teacher\n- Through Marrom: connection to João Pequeno → Pastinha lineage',
  E'APELIDO COMPLETO: Forró Àlágbè (também escrito Forró Alabé)\nO nome combina:\n- "Forró" - gênero de dança/música do nordeste brasileiro (também a cultura de sua região de nascimento)\n- "Àlágbè" - termo iorubá para tocador de tambor/mestre de tambores sagrados no Candomblé\n\nANO DE NASCIMENTO: 1976 (confirmado via história oral: completará 50 anos em 2026).\n\nCRONOLOGIA:\n- 1976: Nasceu em Belém, Pará, norte do Brasil\n- ~Anos 1990-2000: Trabalhou como ator, percussionista, professor de capoeira no Rio de Janeiro (~15-20 anos)\n- 2004: Feito Contra-Mestre por Mestre Marrom no Rio de Janeiro (confirmação por história oral)\n- ~2012: Mudou-se para a Alemanha (fontes indicam "12 anos" em 2024/2025)\n- 2008+: Começou trabalho de educação cultural em escolas alemãs\n- Desconhecido: Recebeu título de Mestre\n\nLOCAIS DE ENSINO:\n- Hannover: Centro Cultural Aldeia de Angola (Allerweg 7, 30449 Hannover)\n- Hildesheim: Treinamento regular\n- Berlim: Forum Brasil (aulas para crianças)\n- Europa: Oficinas internacionais\n\nFAMÍLIA:\n- Esposa: Sigga Glitz (musicista, co-lidera Batucajé)\n\nLINHAGEM:\n- Mestre Marrom (Ngoma Capoeira Angola) → professor direto\n- Através de Marrom: conexão com João Pequeno → linhagem de Pastinha'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/gato-preto.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Gato Preto
-- Generated: 2025-12-15
-- Primary Source: https://velhosmestres.com/br/gatopreto
-- ============================================================
-- DEPENDENCIES: cobrinha-verde.sql, waldemar.sql, pastinha.sql (teachers)
-- ============================================================
--
-- BIRTH YEAR DISCREPANCY (1930 vs 1929):
-- Sources conflict on birth year:
-- - 1930: CapoeiraWiki, Velhos Mestres (main profile), Capoeira Online
-- - 1929: Lalaue, some velhosmestres.com articles, 1970 A Tarde article
-- - Gato Preto himself stated 1930 on a 2001 CD recording
-- Using 1930 as primary (his own statement) with 'year' precision.
--
-- NAME DISCREPANCY:
-- Full name appears in sources as:
-- - "José Gabriel Góes" - most common (CapoeiraWiki, velhosmestres.com, multiple)
-- - "José Luiz Gabriel" - Capoeira Online
-- Father's name also varies: "Eutíquio Lúcio Góes" / "Eutíquio Lúcio Chagas"
-- Using "José Gabriel Góes" as the majority spelling.
--
-- NICKNAME ORIGIN: Called "Gato" (cat) for his childhood agility in jumps
-- and "Preto" (black) for his skin color. Full nickname = "Black Cat"
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'José Gabriel Góes',
  'Gato Preto',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/gatopreto', 'https://capoeirawiki.org/wiki/Gato_Preto', 'https://capoeira.online/history/mestres/mestre-gato-preto/']::text[],
  'angola'::genealogy.style,
  E'Gato Preto was a pure angoleiro, trained in the tradition of Mestre Cobrinha Verde and influenced by Pastinha. Known for his cat-like agility and cunning in the roda - qualities that earned him his nickname. He was recognized as one of the greatest berimbau players of his era, earning the title "O Berimbau de Ouro da Bahia" (The Golden Berimbau of Bahia) at Teatro Castro Alves, competing against Canjiquinha and Vermelho 27. His berimbau, named "Tirateima" (resolves the question), was famous for its distinctive sound. Gato Preto advocated for traditional Angola capoeira, emphasizing its 180 distinct techniques and opposing the foreign martial arts influences in Regional. He also mastered the bateria instruments as contra-mestre de bateria under both Pastinha and Cobrinha Verde.',
  E'Gato Preto era um angoleiro puro, treinado na tradição de Mestre Cobrinha Verde e influenciado por Pastinha. Conhecido pela agilidade e astúcia felinas na roda - qualidades que lhe renderam o apelido. Foi reconhecido como um dos maiores tocadores de berimbau de sua época, conquistando o título de "O Berimbau de Ouro da Bahia" no Teatro Castro Alves, competindo contra Canjiquinha e Vermelho 27. Seu berimbau, chamado "Tirateima" (resolve a questão), era famoso pelo som distintivo. Gato Preto defendia a capoeira Angola tradicional, enfatizando suas 180 técnicas distintas e opondo-se às influências de artes marciais estrangeiras na Regional. Também dominava os instrumentos da bateria como contra-mestre de bateria tanto de Pastinha quanto de Cobrinha Verde.',
  1930,
  'year'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  2002,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'José Gabriel Góes was born on March 19, 1930, on Rua do Pilar in Santo Amaro da Purificação, Bahia—the same town that produced Besouro Mangangá and Cobrinha Verde. His father, Eutíquio Lúcio Góes, was himself a respected capoeirista, and it was under his tutelage that young José began learning capoeira at just eight years old in 1938.\n\nThe training was rigorous. In a small enclosed room, his father would attack him with a maculelê stick or machete to make him learn to defend himself. When José made mistakes, he was corrected—until one day he delivered such a powerful cabeçada that his father fell. After that, his father stopped teaching him. His uncle João Catarino, a student of the legendary Besouro Mangangá, continued his education until João Catarino died of a hemorrhage.\n\nIn 1942, at around age 12, José moved to São Braz, where he began studying with Mestre Léo. By then, people already said he had nothing left to learn. At seventeen, he moved to Salvador, where he became a disciple of Mestre Cobrinha Verde, also from Santo Amaro. This relationship would define his career.\n\nFrom 1950-1951, Gato Preto served as contra-mestre de bateria at Mestre Pastinha''s academy—assistant master of the percussion ensemble. From 1952-1954, he held the same position at Cobrinha Verde''s Centro Esportivo de Capoeira Angola Dois de Julho. He was also trained by Mestre Waldemar da Paixão during this period.\n\nIn 1955, at around age 25, Gato Preto founded his own academy—Academia de Capoeira Baiana—becoming one of the youngest mestres when the first formal academies emerged. From 1958-1967, he operated at Mirante da Barra in Salvador.\n\nHis international debut came on April 21, 1960, when he performed at the inauguration of Brasília. He also performed for President João Goulart. In 1961, he began touring Brazil extensively, including shows for Manchete magazine and the Festa do Candango.\n\nIn April 1966, Gato Preto achieved a historic milestone: he traveled to Dakar, Senegal, as part of the Brazilian delegation to the I Festival Mundial das Artes Negras. Under the command of the nearly blind Mestre Pastinha, alongside João Grande, Gildo Alfinete, Roberto Satanás, Camafeu de Oxossi, and babalorixá Olga de Alaketu, he performed for 10,000 people at Friendship Stadium. This was the first time capoeira had been brought to Africa. Pastinha could not perform due to his health, so Gato Preto, Roberto Satanás, and Gildo were the main players, while Camafeu played berimbau. A local African musician reportedly told them: "Capoeira is in Brasil, your capoeira angola is in Brasil. Our people took it there and now you are showing it here." Gato Preto himself later expressed disappointment discovering capoeira did not exist in Africa.\n\nThe historic LP "Capoeira" (1962), released by Editora Xauã, featured Gato Preto alongside Mestres Traíra and Cobrinha Verde. Recorded at Mestre Waldemar''s barracão with photographs taken at the Rampa do Mercado Modelo, this recording is considered one of the earliest musical documents of capoeira.\n\nGato Preto was not just a capoeirista—he was a cultural ambassador. He brought maculelê from his homeland of Santo Amaro to the wider world, teaching it throughout Brazil. He was also an expert atabaque player and served as ogã huntó at the traditional Gêge nation terreiro, Zogodô Bogum Malê Rundó (Terreiro do Bogum), since the time of the former Mãe Runhó.\n\nIn 1970, he won the Berimbau de Ouro at the Festival Folclórico de Capoeira e Toques de Berimbau, competing against other Brazilian mestres including Canjiquinha and Vermelho 27. Writer Jorge Amado immortalized him in his books. He traveled internationally to France, Portugal, United States, Mexico, Korea, Nigeria, and elsewhere.\n\nIn the 1970s, Gato Preto operated academies at Rua do Báu in Garcia and Boca do Rio, taught by his students including Espinho Remoso. By July 1976, he participated in the "African Diaspora" festival in the United States with Olga de Alaketu and others. Later that year, at age 46, he was relocating to Brasília to establish a new academy.\n\nIn the 1980s and 1990s, he taught in São Paulo at SESC Ipiranga with his disciple Contramestre Pinguim (Luiz Antonio Nascimento Cardoso). In 2001, Pinguim received the title of contramestre of capoeira at the Terreiro do Bogum in Salvador, awarded by Gato Preto himself.\n\nBeyond capoeira, Gato Preto worked as a fisherman, frame-layer, blacksmith, and master berimbau maker—noted as exceptionally skilled in the latter craft. He worked in capoeira for over 40 years without monetary compensation, driven purely by love of the art.\n\nMestre Zé Baiano wrote in 1984: "With him I perfected my knowledge of Capoeira Angola and everything involving it: song rhythm, game, battery formation, social coexistence and fundamentals."\n\nGato Preto had two sons who continued his legacy: Sinésio Souza Góes (Mestre Gato II, born September 7, 1950) and José Souza Góes (Mestre Zeca, also known as Gatinho or Gato III, born April 16, 1956). He had only one sibling: Carlos "Cazoza" Góes (born 1932).\n\nMestre Gato Preto died on August 6, 2002, in Salvador. A monument called "Arena da Capoeira" featuring his statue stands in Salvador, Bahia—permanent testament to his influence. His legacy continues through students like Mestre Mau (Marcelino), Mestre Boa Gente, Contramestre Pinguim, and through his sons who carry forward the family tradition.',
  E'José Gabriel Góes nasceu em 19 de março de 1930, na Rua do Pilar em Santo Amaro da Purificação, Bahia—a mesma cidade que produziu Besouro Mangangá e Cobrinha Verde. Seu pai, Eutíquio Lúcio Góes, era ele próprio um capoeirista respeitado, e foi sob sua tutela que o jovem José começou a aprender capoeira com apenas oito anos, em 1938.\n\nO treinamento era rigoroso. Em um pequeno quarto fechado, seu pai o atacava com um bastão de maculelê ou facão para fazê-lo aprender a se defender. Quando José errava, era corrigido—até que um dia ele deu uma cabeçada tão forte que seu pai caiu. Depois disso, seu pai parou de ensiná-lo. Seu tio João Catarino, aluno do lendário Besouro Mangangá, continuou sua educação até morrer de hemorragia.\n\nEm 1942, com cerca de 12 anos, José mudou-se para São Braz, onde começou a estudar com Mestre Léo. A essa altura, as pessoas já diziam que ele não tinha mais nada a aprender. Aos dezessete anos, mudou-se para Salvador, onde se tornou discípulo de Mestre Cobrinha Verde, também de Santo Amaro. Essa relação definiria sua carreira.\n\nDe 1950-1951, Gato Preto serviu como contra-mestre de bateria na academia de Mestre Pastinha—mestre assistente do conjunto de percussão. De 1952-1954, ocupou a mesma posição no Centro Esportivo de Capoeira Angola Dois de Julho de Cobrinha Verde. Também foi treinado por Mestre Waldemar da Paixão durante este período.\n\nEm 1955, com cerca de 25 anos, Gato Preto fundou sua própria academia—Academia de Capoeira Baiana—tornando-se um dos mestres mais jovens quando as primeiras academias formais surgiram. De 1958-1967, operou no Mirante da Barra em Salvador.\n\nSua estreia internacional veio em 21 de abril de 1960, quando se apresentou na inauguração de Brasília. Também se apresentou para o Presidente João Goulart. Em 1961, começou a excursionar extensivamente pelo Brasil, incluindo shows para a revista Manchete e a Festa do Candango.\n\nEm abril de 1966, Gato Preto alcançou um marco histórico: viajou a Dacar, Senegal, como parte da delegação brasileira ao I Festival Mundial das Artes Negras. Sob o comando do quase cego Mestre Pastinha, ao lado de João Grande, Gildo Alfinete, Roberto Satanás, Camafeu de Oxossi e a babalorixá Olga de Alaketu, ele se apresentou para 10.000 pessoas no Estádio da Amizade. Esta foi a primeira vez que a capoeira foi levada à África. Pastinha não pôde se apresentar devido à saúde, então Gato Preto, Roberto Satanás e Gildo foram os principais jogadores, enquanto Camafeu tocava berimbau. Um músico africano local teria dito a eles: "A capoeira está no Brasil, sua capoeira angola está no Brasil. Nosso povo a levou para lá e agora vocês estão mostrando aqui." O próprio Gato Preto expressou depois decepção ao descobrir que a capoeira não existia na África.\n\nO histórico LP "Capoeira" (1962), lançado pela Editora Xauã, apresentou Gato Preto ao lado de Mestres Traíra e Cobrinha Verde. Gravado no barracão de Mestre Waldemar com fotografias tiradas na Rampa do Mercado Modelo, esta gravação é considerada um dos primeiros documentos musicais da capoeira.\n\nGato Preto não era apenas um capoeirista—era um embaixador cultural. Levou o maculelê de sua terra natal, Santo Amaro, para o mundo, ensinando-o por todo o Brasil. Era também um tocador de atabaque especialista e servia como ogã huntó no tradicional terreiro da nação Gêge, Zogodô Bogum Malê Rundó (Terreiro do Bogum), desde os tempos da antiga Mãe Runhó.\n\nEm 1970, ganhou o Berimbau de Ouro no Festival Folclórico de Capoeira e Toques de Berimbau, competindo contra outros mestres brasileiros incluindo Canjiquinha e Vermelho 27. O escritor Jorge Amado o imortalizou em seus livros. Viajou internacionalmente para França, Portugal, Estados Unidos, México, Coreia, Nigéria e outros lugares.\n\nNos anos 1970, Gato Preto operava academias na Rua do Báu no Garcia e na Boca do Rio, ensinadas por seus alunos incluindo Espinho Remoso. Em julho de 1976, participou do festival "Diáspora Africana" nos Estados Unidos com Olga de Alaketu e outros. Mais tarde naquele ano, aos 46 anos, estava se mudando para Brasília para estabelecer uma nova academia.\n\nNos anos 1980 e 1990, ensinou em São Paulo no SESC Ipiranga com seu discípulo Contramestre Pinguim (Luiz Antonio Nascimento Cardoso). Em 2001, Pinguim recebeu o título de contramestre de capoeira no Terreiro do Bogum em Salvador, conferido pelo próprio Gato Preto.\n\nAlém da capoeira, Gato Preto trabalhou como pescador, marceneiro, ferreiro e mestre fabricante de berimbaus—notado como excepcionalmente habilidoso neste último ofício. Trabalhou na capoeira por mais de 40 anos sem compensação monetária, movido puramente pelo amor à arte.\n\nMestre Zé Baiano escreveu em 1984: "Com ele aperfeiçoei meu conhecimento da Capoeira Angola e tudo que a envolve: ritmo do canto, jogo, formação da bateria, convivência social e fundamentos."\n\nGato Preto teve dois filhos que continuaram seu legado: Sinésio Souza Góes (Mestre Gato II, nascido em 7 de setembro de 1950) e José Souza Góes (Mestre Zeca, também conhecido como Gatinho ou Gato III, nascido em 16 de abril de 1956). Tinha apenas um irmão: Carlos "Cazoza" Góes (nascido em 1932).\n\nMestre Gato Preto morreu em 6 de agosto de 2002, em Salvador. Um monumento chamado "Arena da Capoeira" apresentando sua estátua está em Salvador, Bahia—testamento permanente de sua influência. Seu legado continua através de alunos como Mestre Mau (Marcelino), Mestre Boa Gente, Contramestre Pinguim, e através de seus filhos que levam adiante a tradição familiar.',
  E'Berimbau de Ouro da Bahia - Teatro Castro Alves (1970)\nRepresented Brazil at I Festival Mundial das Artes Negras, Dakar (1966)\nRecorded historic LP "Capoeira" with Traíra and Cobrinha Verde (1962)\nPerformed at inauguration of Brasília (1960)\nPerformed for President João Goulart\nFounded Academia de Capoeira Baiana (1955)\nContra-mestre de bateria for Mestre Pastinha (1950-1951)\nContra-mestre de bateria for Mestre Cobrinha Verde (1952-1954)\nImmortalized in Jorge Amado''s books\nStatue erected at "Arena da Capoeira" monument in Salvador\nBrought maculelê from Santo Amaro to wider Brazil\nRecorded two CDs (1999 with Pedro Feitosa; 2001 with Mestres Marrom, Garça, Dorado)',
  E'Berimbau de Ouro da Bahia - Teatro Castro Alves (1970)\nRepresentou o Brasil no I Festival Mundial das Artes Negras, Dacar (1966)\nGravou o histórico LP "Capoeira" com Traíra e Cobrinha Verde (1962)\nApresentou-se na inauguração de Brasília (1960)\nApresentou-se para o Presidente João Goulart\nFundou a Academia de Capoeira Baiana (1955)\nContra-mestre de bateria de Mestre Pastinha (1950-1951)\nContra-mestre de bateria de Mestre Cobrinha Verde (1952-1954)\nImortalizado nos livros de Jorge Amado\nEstátua erguida no monumento "Arena da Capoeira" em Salvador\nLevou o maculelê de Santo Amaro para todo o Brasil\nGravou dois CDs (1999 com Pedro Feitosa; 2001 com Mestres Marrom, Garça, Dorado)',
  E'BIRTH YEAR DISCREPANCY (1930 vs 1929):\nSources conflict: 1930 (CapoeiraWiki, Velhos Mestres main profile, Capoeira Online) vs 1929 (Lalaue, some velhosmestres articles, 1970 A Tarde). Gato Preto stated 1930 on his 2001 CD. Using 1930 as primary (his own statement).\n\nDEATH DATE: August 6, 2002 - confirmed by multiple sources.\n\nNAME VARIATIONS:\n- "José Gabriel Góes" - most common\n- "José Luiz Gabriel" - Capoeira Online\n- Father: "Eutíquio Lúcio Góes" or "Eutíquio Lúcio Chagas"\n\nNICKNAME: "Gato" (cat) for childhood agility; "Preto" (black) for skin color.\n\nTEACHERS:\n- Eutíquio Lúcio Góes (father, began 1938)\n- João Catarino (uncle, student of Besouro, after father stopped teaching)\n- Mestre Léo (São Braz, from 1942)\n- Mestre Cobrinha Verde (primary mentor from age 17 in Salvador, 1947)\n- Mestre Pastinha (served as contra-mestre de bateria 1950-1951)\n- Mestre Waldemar da Paixão (trained under him)\n\nSTUDENTS:\n- Mestre Mau (Marcelino)\n- Mestre Boa Gente\n- Contramestre Pinguim (Luiz Antonio Nascimento Cardoso)\n- Espinho Remoso (taught at Gato Preto''s academies)\n- Mestre Zeca (José Souza Góes) - son\n- Mestre Gato II (Sinésio Souza Góes) - son\n- Mário Bom Cabrito\n\nFAMILY:\n- Father: Eutíquio Lúcio Góes (died 1954)\n- Uncle: João Catarino (student of Besouro)\n- Brother: Carlos "Cazoza" Góes (born 1932)\n- Son: Sinésio Souza Góes (Mestre Gato II, born Sept 7, 1950)\n- Son: José Souza Góes (Mestre Zeca/Gatinho/Gato III, born April 16, 1956, died March 25, 2024)\n\nBERIMBAU: Named "Tirateima" (resolves the question) - famous for distinctive sound.\n\nRELIGIOUS ROLE: Ogã huntó at Terreiro do Bogum (Zogodô Bogum Malê Rundó), Gêge nation, since time of Mãe Runhó.\n\nOTHER PROFESSIONS: Fisherman, frame-layer, blacksmith, master berimbau maker.\n\nACADEMIES:\n- Academia de Capoeira Baiana (founded 1955)\n- Mirante da Barra, Salvador (1958-1967)\n- Rua do Báu, Garcia, Salvador (1970s)\n- Boca do Rio, Salvador (1970s)\n- Planned Brasília academy (1976)\n- SESC Ipiranga, São Paulo (1990s)\n\nDAKAR 1966 DELEGATION:\nPastinha (leader), João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, Camafeu de Oxossi, Olga de Alaketu. Performed at Friendship Stadium for 10,000 people.',
  E'DISCREPÂNCIA DE ANO DE NASCIMENTO (1930 vs 1929):\nFontes conflitantes: 1930 (CapoeiraWiki, perfil principal Velhos Mestres, Capoeira Online) vs 1929 (Lalaue, alguns artigos velhosmestres, A Tarde 1970). Gato Preto afirmou 1930 em seu CD de 2001. Usando 1930 como primário (sua própria declaração).\n\nDATA DE MORTE: 6 de agosto de 2002 - confirmada por múltiplas fontes.\n\nVARIAÇÕES DE NOME:\n- "José Gabriel Góes" - mais comum\n- "José Luiz Gabriel" - Capoeira Online\n- Pai: "Eutíquio Lúcio Góes" ou "Eutíquio Lúcio Chagas"\n\nAPELIDO: "Gato" pela agilidade na infância; "Preto" pela cor da pele.\n\nMESTRES:\n- Eutíquio Lúcio Góes (pai, começou 1938)\n- João Catarino (tio, aluno de Besouro, após o pai parar de ensinar)\n- Mestre Léo (São Braz, a partir de 1942)\n- Mestre Cobrinha Verde (mentor principal desde 17 anos em Salvador, 1947)\n- Mestre Pastinha (serviu como contra-mestre de bateria 1950-1951)\n- Mestre Waldemar da Paixão (treinou com ele)\n\nALUNOS:\n- Mestre Mau (Marcelino)\n- Mestre Boa Gente\n- Contramestre Pinguim (Luiz Antonio Nascimento Cardoso)\n- Espinho Remoso (ensinou nas academias de Gato Preto)\n- Mestre Zeca (José Souza Góes) - filho\n- Mestre Gato II (Sinésio Souza Góes) - filho\n- Mário Bom Cabrito\n\nFAMÍLIA:\n- Pai: Eutíquio Lúcio Góes (morreu 1954)\n- Tio: João Catarino (aluno de Besouro)\n- Irmão: Carlos "Cazoza" Góes (nascido 1932)\n- Filho: Sinésio Souza Góes (Mestre Gato II, nascido 7 set 1950)\n- Filho: José Souza Góes (Mestre Zeca/Gatinho/Gato III, nascido 16 abril 1956, morreu 25 março 2024)\n\nBERIMBAU: Chamado "Tirateima" (resolve a questão) - famoso pelo som distintivo.\n\nPAPEL RELIGIOSO: Ogã huntó no Terreiro do Bogum (Zogodô Bogum Malê Rundó), nação Gêge, desde os tempos de Mãe Runhó.\n\nOUTRAS PROFISSÕES: Pescador, marceneiro, ferreiro, mestre fabricante de berimbau.\n\nACADEMIAS:\n- Academia de Capoeira Baiana (fundada 1955)\n- Mirante da Barra, Salvador (1958-1967)\n- Rua do Báu, Garcia, Salvador (anos 1970)\n- Boca do Rio, Salvador (anos 1970)\n- Academia planejada em Brasília (1976)\n- SESC Ipiranga, São Paulo (anos 1990)\n\nDELEGAÇÃO DACAR 1966:\nPastinha (líder), João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, Camafeu de Oxossi, Olga de Alaketu. Apresentaram no Estádio da Amizade para 10.000 pessoas.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/geraldo-pe-de-abelha.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Geraldo Pé de Abelha
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Geraldo Pé de Abelha
-- was likely an established practitioner by that time (age 25-40).
-- This suggests a birth year around 1880-1900. Using mid-point estimate
-- with decade precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Geraldo Pé de Abelha',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Geraldo Pé de Abelha (meaning "Bee Foot") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nThe distinctive nickname "Pé de Abelha" (Bee Foot) set him apart among the many capoeiristas of his era, though the origin of this moniker has not been documented. Like many of his contemporaries at Gengibirra, Geraldo Pé de Abelha practiced capoeira during a dangerous period when practitioners faced police persecution and imprisonment.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), remembered Geraldo Pé de Abelha among the "bambas" (skilled fighters) of capoeira''s past. He was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Geraldo Pé de Abelha have been documented.',
  E'Geraldo Pé de Abelha foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nO apelido distintivo "Pé de Abelha" o diferenciava entre os muitos capoeiristas de sua época, embora a origem deste apelido não tenha sido documentada. Como muitos de seus contemporâneos no Gengibirra, Geraldo Pé de Abelha praticava capoeira durante um período perigoso quando os praticantes enfrentavam perseguição policial e prisão.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), lembrou de Geraldo Pé de Abelha entre os "bambas" (lutadores habilidosos) do passado da capoeira. Ele esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Geraldo Pé de Abelha foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Nickname "Pé de Abelha" means "Bee Foot" - origin unknown. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Apelido "Pé de Abelha" - origem desconhecida. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/henrique-cara-queimada.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Henrique Cara Queimada
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Henrique was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Henrique',
  'Cara Queimada',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Henrique Cara Queimada ("Henrique Burnt Face") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nThe origin of his apelido "Cara Queimada" has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Henrique Cara Queimada among the founding mestres. While four mestres were recognized as "donos e proprietários" (owners and proprietors) - Noronha, Livino, Totonho de Maré, and Amorzinho - the other 18 founding mestres, including Henrique Cara Queimada, were equally important contributors to the establishment and operation of this historic center.\n\nHenrique Cara Queimada was present during the center''s operation throughout the 1920s and 1930s, practicing capoeira during the dangerous era of police persecution under police chief "Pedrito" (1920-1927). The center was protected by Amorzinho, a civil guard whose position provided crucial protection from police raids.\n\nOn February 23, 1941, Henrique Cara Queimada would have been among the mestres present when Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Henrique Cara Queimada have been documented.',
  E'Henrique Cara Queimada foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nA origem de seu apelido "Cara Queimada" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Henrique Cara Queimada entre os mestres fundadores. Enquanto quatro mestres foram reconhecidos como "donos e proprietários" - Noronha, Livino, Totonho de Maré e Amorzinho - os outros 18 mestres fundadores, incluindo Henrique Cara Queimada, foram igualmente importantes contribuintes para o estabelecimento e operação deste centro histórico.\n\nHenrique Cara Queimada esteve presente durante a operação do centro ao longo das décadas de 1920 e 1930, praticando capoeira durante a perigosa era da perseguição policial sob o delegado "Pedrito" (1920-1927). O centro era protegido por Amorzinho, um guarda civil cuja posição fornecia proteção crucial contra as batidas policiais.\n\nEm 23 de fevereiro de 1941, Henrique Cara Queimada teria estado entre os mestres presentes quando Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Henrique Cara Queimada foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. First name "Henrique" is known. The origin of the apelido "Cara Queimada" has not been documented. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Primeiro nome "Henrique" é conhecido. A origem do apelido "Cara Queimada" não foi documentada. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/imagem-do-cao.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Imagem do Cão
-- Generated: 2025-12-16
-- ============================================================
-- MINIMAL DOCUMENTATION: Imagem do Cão appears only as one of
-- the six co-founders of Grupo Filhos de Angola (Rio de Janeiro,
-- July 21, 1960). No birth/death dates, full name, or other
-- biographical details documented in available sources.
--
-- BIRTH YEAR ESTIMATION: ~1920s (decade estimate) based on
-- being a contemporary of the other Filhos de Angola co-founders
-- (Onça Preta b.1909, Roque b.1938, Dois de Ouro ~1920s,
-- Mucungê ~1930s, Baleado ~1920s). As a Bahian angoleiro
-- who migrated to Rio in the 1950s and co-founded a group
-- in 1960, he was likely born between 1910-1930.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Imagem do Cão',
  'mestre'::genealogy.title,
  NULL,
  NULL,
  'angola'::genealogy.style,
  E'Bahian angoleiro who migrated to Rio de Janeiro in the 1950s. Part of the traditional Angola style brought from Salvador to Rio alongside fellow Bahians Mucungê, Dois de Ouro, Baleado, Onça Preta, and Roque.',
  E'Angoleiro baiano que migrou para o Rio de Janeiro nos anos 1950. Parte do estilo tradicional de Angola trazido de Salvador para o Rio junto com os baianos Mucungê, Dois de Ouro, Baleado, Onça Preta e Roque.',
  1920,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Imagem do Cão (Image of the Dog) was a Bahian angoleiro who was among the wave of capoeiristas who migrated from Salvador to Rio de Janeiro in the 1950s. His story is one of the least documented among the founders of what would become contemporary capoeira in Rio, yet his name is permanently inscribed in the founding moment of one of the city''s most important early groups.\n\nBy the time Onça Preta arrived in Rio in the late 1950s, Imagem do Cão was already established in the city, part of a small community of Bahian capoeiristas who had preceded the larger migration. On July 21, 1960, he joined forces with five other Bahian angoleiros - Mucungê, Dois de Ouro, Baleado, Onça Preta, and Roque - to co-found Grupo Filhos de Angola (Sons of Angola) in Rio de Janeiro.\n\nThis group represented a cultural movement that pioneered capoeira teaching in Rio''s favelas, particularly in the Southern Zone. While Mestre Roque established his academy in Pavão/Pavãozinho and became the most visible leader, Grupo Filhos de Angola was a collective effort by these six Bahian migrants who brought their traditional Angola style to a new city. The group participated in tournaments and competitions that helped disseminate capoeira, including the Berimbau de Ouro (1967), and performed in folkloric exhibitions such as "Uma Noite na Bahia" (A Night in Bahia).\n\nLike his fellow co-founders Baleado and Dois de Ouro, Imagem do Cão remains a figure whose life details are largely lost to history. His full name, birth and death dates, teachers, students, and later activities are undocumented. What survives is his connection to a transformative moment in capoeira history - when Bahian angoleiros established the roots of what would become contemporary capoeira in Rio de Janeiro.\n\nHis apelido, meaning "Image of the Dog" or "Dog''s Image," follows the tradition of capoeira nicknames that could reference physical appearance, personality traits, or memorable incidents.',
  E'Imagem do Cão (Imagem do Cachorro) foi um angoleiro baiano que fez parte da onda de capoeiristas que migraram de Salvador para o Rio de Janeiro nos anos 1950. Sua história é uma das menos documentadas entre os fundadores do que se tornaria a capoeira contemporânea no Rio, mas seu nome está permanentemente inscrito no momento fundador de um dos primeiros e mais importantes grupos da cidade.\n\nQuando Onça Preta chegou ao Rio no final dos anos 1950, Imagem do Cão já estava estabelecido na cidade, parte de uma pequena comunidade de capoeiristas baianos que haviam precedido a migração maior. Em 21 de julho de 1960, ele se uniu a cinco outros angoleiros baianos - Mucungê, Dois de Ouro, Baleado, Onça Preta e Roque - para co-fundar o Grupo Filhos de Angola no Rio de Janeiro.\n\nEste grupo representou um movimento cultural que foi pioneiro no ensino de capoeira nas favelas do Rio, particularmente na Zona Sul. Enquanto Mestre Roque estabeleceu sua academia no Pavão/Pavãozinho e tornou-se o líder mais visível, o Grupo Filhos de Angola foi um esforço coletivo destes seis migrantes baianos que trouxeram seu estilo tradicional de Angola para uma nova cidade. O grupo participou de torneios e competições que ajudaram a disseminar a capoeira, incluindo o Berimbau de Ouro (1967), e se apresentou em shows folclóricos como "Uma Noite na Bahia."\n\nAssim como seus companheiros co-fundadores Baleado e Dois de Ouro, Imagem do Cão permanece uma figura cujos detalhes de vida estão em grande parte perdidos para a história. Seu nome completo, datas de nascimento e morte, mestres, alunos e atividades posteriores não estão documentados. O que sobrevive é sua conexão com um momento transformador na história da capoeira - quando angoleiros baianos estabeleceram as raízes do que se tornaria a capoeira contemporânea no Rio de Janeiro.\n\nSeu apelido, significando "Imagem do Cão" ou "Imagem do Cachorro," segue a tradição de apelidos da capoeira que podiam referenciar aparência física, traços de personalidade ou incidentes memoráveis.',
  E'Co-founder of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960)',
  E'Co-fundador do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960)',
  E'MINIMAL DOCUMENTATION: Only documented connection is as co-founder of Grupo Filhos de Angola (Rio, 1960). No full name, birth/death dates, teachers, students, or later activities recorded in available sources. Birth year estimated at ~1920s based on being contemporary of other Filhos de Angola co-founders who were active adults in the 1950s-60s. Unlike better-documented co-founders Onça Preta (extensive velhosmestres.com timeline) and Roque (capoeirahistory.com profile, MIS RJ interviews), Imagem do Cão''s individual story has not been preserved. He may have been among the Bahian angoleiros who participated in the Roda da Central (Carnival street roda 1950s-1983), but this is speculation. Sources note Baleado was "already in Rio" when Onça Preta arrived (late 1950s), suggesting some co-founders preceded others; Imagem do Cão''s arrival timing is unknown.',
  E'DOCUMENTAÇÃO MÍNIMA: Única conexão documentada é como co-fundador do Grupo Filhos de Angola (Rio, 1960). Sem nome completo, datas de nascimento/morte, mestres, alunos ou atividades posteriores registradas nas fontes disponíveis. Ano de nascimento estimado em ~anos 1920 baseado em ser contemporâneo dos outros co-fundadores do Filhos de Angola que eram adultos ativos nos anos 1950-60. Diferente dos co-fundadores melhor documentados Onça Preta (cronologia extensa no velhosmestres.com) e Roque (perfil no capoeirahistory.com, entrevistas MIS RJ), a história individual de Imagem do Cão não foi preservada. Ele pode ter sido um dos angoleiros baianos que participavam da Roda da Central (roda de rua do Carnaval anos 1950-1983), mas isso é especulação. Fontes indicam que Baleado "já estava no Rio" quando Onça Preta chegou (final dos anos 1950), sugerindo que alguns co-fundadores precederam outros; o momento da chegada de Imagem do Cão é desconhecido.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/isidio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Isídio
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade precision):
-- Isídio was described as "velho" (old) and a "discípulo velho" (old disciple)
-- at Bonfim Church when Cobrinha Verde (b. 1912) was a youth in the 1920s.
-- If he was 50-70 years old in the 1920s, birth range would be 1850-1880.
-- Using 1870 as midpoint estimate with decade precision.
--
-- Cobrinha Verde's testimony (from 1991) states Isídio was "already dead today"
-- (está morto hoje), indicating he died sometime before 1991, likely much earlier
-- given his advanced age in the 1920s.
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
  NULL, -- Full name unknown
  'Isídio',
  NULL, -- Not a capoeira mestre; mandingueiro/spiritual practitioner
  NULL, -- No images exist of this historical figure
  ARRAY['https://capoeira.online/history/mestres/cobrinha-verde/', 'https://angoleiro.wordpress.com/tag/patua/']::text[],
  -- Capoeira-specific
  NULL, -- Not documented as a capoeirista; mandingueiro (spiritual practitioner)
  'Not documented as a capoeirista. Described as a "discípulo velho" (old disciple) at Bonfim Church in Salvador. Provided materials for Cobrinha Verde''s protective patuá at Tio Pascoal''s direction. Likely a mandingueiro or spiritual practitioner associated with the Afro-Brazilian religious traditions centered at Bonfim Church.',
  'Não documentado como capoeirista. Descrito como "discípulo velho" na Igreja do Bonfim em Salvador. Forneceu materiais para o patuá protetor de Cobrinha Verde sob orientação de Tio Pascoal. Provavelmente um mandingueiro ou praticante espiritual associado às tradições religiosas afro-brasileiras centradas na Igreja do Bonfim.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown; likely Salvador, Bahia
  NULL, -- Death year unknown; confirmed deceased before 1991
  'unknown'::genealogy.date_precision,
  'Salvador, Bahia, Brazil', -- Presumed; he was based at Bonfim Church in Salvador
  -- bio_en
  E'Isídio was an "old disciple" (discípulo velho) based at the Church of Nosso Senhor do Bonfim in Salvador, Bahia. He is known solely through the testimony of Mestre Cobrinha Verde, who identified him as the source of materials used to create his legendary protective patuá.

According to Cobrinha Verde''s account, the African mandingueiro Tio Pascoal instructed the young Rafael Alves França (later Cobrinha Verde) to seek out Isídio at Bonfim Church. Cobrinha recounted: "So old Pascoal told me that there was an old disciple named Isídio (he is dead today) in Bonfim Church, who could get me the material to make an amulet."

The young Cobrinha traveled to Salvador and obtained the necessary materials from Isídio. He then brought these items back to Tio Pascoal in Santo Amaro da Purificação, who assembled them into the completed patuá with specific instructions for its use. This amulet became central to Cobrinha Verde''s legend—it was said to be alive, jumping when placed on a clean plate, and protected him through three years of violence in the Bahian sertão as a member of Colonel Horácio de Matos'' band.

The description of Isídio as a "discípulo" (disciple) suggests he was himself a practitioner within a lineage of spiritual tradition—perhaps a student of an earlier mandingueiro, or a member of a religious brotherhood associated with Bonfim Church. The Church of Nosso Senhor do Bonfim occupies a unique position in Bahian religious life, serving as a site of syncretism between Catholic and Candomblé traditions, where Nosso Senhor do Bonfim is identified with the Orixá Oxalá.

That Tio Pascoal knew of Isídio and could direct Cobrinha Verde to him suggests a network of spiritual practitioners spanning Santo Amaro and Salvador—a hidden community that maintained African-Brazilian mystical traditions despite persecution.

Nothing more is known of Isídio''s life, training, or other activities. He represents the countless unnamed practitioners who preserved and transmitted African-Brazilian spiritual traditions during the late 19th and early 20th centuries.',
  -- bio_pt
  E'Isídio foi um "discípulo velho" baseado na Igreja de Nosso Senhor do Bonfim em Salvador, Bahia. Ele é conhecido exclusivamente através do testemunho de Mestre Cobrinha Verde, que o identificou como a fonte dos materiais usados para criar seu lendário patuá protetor.

Segundo o relato de Cobrinha Verde, o mandingueiro africano Tio Pascoal instruiu o jovem Rafael Alves França (mais tarde Cobrinha Verde) a procurar Isídio na Igreja do Bonfim. Cobrinha contou: "Então o velho Pascoal me disse que havia um discípulo velho de nome Isídio (está morto hoje) na Igreja do Bonfim, que poderia me conseguir o material para fazer um amuleto."

O jovem Cobrinha viajou a Salvador e obteve os materiais necessários de Isídio. Ele então trouxe esses itens de volta para Tio Pascoal em Santo Amaro da Purificação, que os montou no patuá completo com instruções específicas para seu uso. Este amuleto tornou-se central na lenda de Cobrinha Verde—dizia-se que era vivo, pulando quando colocado em um prato limpo, e o protegeu através de três anos de violência no sertão baiano como membro do bando do Coronel Horácio de Matos.

A descrição de Isídio como "discípulo" sugere que ele próprio era um praticante dentro de uma linhagem de tradição espiritual—talvez aluno de um mandingueiro anterior, ou membro de uma irmandade religiosa associada à Igreja do Bonfim. A Igreja de Nosso Senhor do Bonfim ocupa uma posição única na vida religiosa baiana, servindo como local de sincretismo entre tradições católicas e do Candomblé, onde Nosso Senhor do Bonfim é identificado com o Orixá Oxalá.

Que Tio Pascoal conhecesse Isídio e pudesse direcionar Cobrinha Verde até ele sugere uma rede de praticantes espirituais abrangendo Santo Amaro e Salvador—uma comunidade oculta que mantinha tradições místicas afro-brasileiras apesar da perseguição.

Nada mais se sabe sobre a vida, formação ou outras atividades de Isídio. Ele representa os incontáveis praticantes anônimos que preservaram e transmitiram tradições espirituais afro-brasileiras durante o final do século XIX e início do século XX.',
  -- achievements_en
  'Provided materials for Mestre Cobrinha Verde''s legendary patuá at Tio Pascoal''s direction; represents the network of spiritual practitioners who preserved African-Brazilian mystical traditions at Bonfim Church in Salvador',
  -- achievements_pt
  'Forneceu materiais para o lendário patuá de Mestre Cobrinha Verde sob orientação de Tio Pascoal; representa a rede de praticantes espirituais que preservaram tradições místicas afro-brasileiras na Igreja do Bonfim em Salvador',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Described as "velho" (old) and a "discípulo velho" (old disciple) when Cobrinha Verde (b. 1912) was a youth in the 1920s. If he was 50-70 years old when providing the patuá materials, birth range would be 1850-1880. Using 1870 as midpoint estimate.

DEATH: Cobrinha Verde''s testimony (given around 1991 for Mestre Mau''s book) explicitly states "está morto hoje" (he is dead today). Given his advanced age in the 1920s, death likely occurred decades before 1991, but no specific date is available.

IDENTITY: The title "discípulo" (disciple) suggests he was a spiritual student/practitioner within a tradition, not a founder or leader. His association with Bonfim Church places him within the syncretic Catholic-Candomblé tradition of Salvador.

ROLE: Provider of materials for patuá creation. Did not create the patuá himself—that was done by Tio Pascoal. The specific materials are not documented.

RELATIONSHIP TO TIO PASCOAL: Unclear whether Isídio was Pascoal''s student, fellow practitioner, or simply a contact known to supply spiritual materials. The fact that Pascoal knew how to direct Cobrinha Verde to him suggests a pre-existing connection.

LOCATION: Based at Igreja do Bonfim in Salvador. This church is a major pilgrimage site and center of Afro-Brazilian religious syncretism, where Catholic Nosso Senhor do Bonfim is identified with Candomblé Orixá Oxalá.

NOT A DOCUMENTED CAPOEIRISTA: There is no evidence Isídio practiced capoeira. He appears to be purely a spiritual/religious practitioner.

PRIMARY SOURCE: All information derives from Cobrinha Verde''s testimony preserved in "Capoeira e Mandingas: Cobrinha Verde" by Marcelino dos Santos (Mestre Mau), 1991.

SECONDARY SOURCES: Capoeira.online quotes the relevant passage directly.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Descrito como "velho" e "discípulo velho" quando Cobrinha Verde (n. 1912) era jovem nos anos 1920. Se tinha 50-70 anos quando forneceu os materiais do patuá, o intervalo de nascimento seria 1850-1880. Usando 1870 como estimativa do ponto médio.

MORTE: O testemunho de Cobrinha Verde (dado por volta de 1991 para o livro de Mestre Mau) afirma explicitamente "está morto hoje". Dada sua idade avançada nos anos 1920, a morte provavelmente ocorreu décadas antes de 1991, mas nenhuma data específica está disponível.

IDENTIDADE: O título "discípulo" sugere que era um estudante/praticante espiritual dentro de uma tradição, não um fundador ou líder. Sua associação com a Igreja do Bonfim o coloca dentro da tradição sincrética Católica-Candomblé de Salvador.

PAPEL: Fornecedor de materiais para criação de patuá. Não criou o patuá ele mesmo—isso foi feito por Tio Pascoal. Os materiais específicos não são documentados.

RELACIONAMENTO COM TIO PASCOAL: Incerto se Isídio era aluno de Pascoal, colega praticante, ou simplesmente um contato conhecido por fornecer materiais espirituais. O fato de Pascoal saber como direcionar Cobrinha Verde até ele sugere uma conexão pré-existente.

LOCALIZAÇÃO: Baseado na Igreja do Bonfim em Salvador. Esta igreja é um importante local de peregrinação e centro de sincretismo religioso afro-brasileiro, onde o Nosso Senhor do Bonfim católico é identificado com o Orixá Oxalá do Candomblé.

NÃO É CAPOEIRISTA DOCUMENTADO: Não há evidência de que Isídio praticasse capoeira. Ele parece ser puramente um praticante espiritual/religioso.

FONTE PRIMÁRIA: Toda informação deriva do testemunho de Cobrinha Verde preservado em "Capoeira e Mandingas: Cobrinha Verde" por Marcelino dos Santos (Mestre Mau), 1991.

FONTES SECUNDÁRIAS: Capoeira.online cita a passagem relevante diretamente.'
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

-- Source: entities/persons/joao-de-toto.sql (NEW)
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

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo," João de Totó was one of the capoeiristas targeted by police crackdowns in the early 1900s. The police campaign against the capoeiras sent Valdevino, João de Totó, and Jovino dos Coelhos to detention, others to Fernando de Noronha (the notorious prison island off the coast of Pernambuco), and others directly to the morgue.

João de Totó was part of the capoeira maltas that organized around the rival military bands during carnival season. The bands of "Quarto" (4th Artillery Battalion) and "Espanha" (National Guard) paraded through Recife protected by the agility, bravery, clubs, and knives of capoeiras like him. These capoeiristas performed ginga and kicks that were eventually transformed into the "passo"—the foundational dance of frevo.

The suppression of Recife''s capoeira maltas culminated around 1912, coinciding with the birth of frevo as a distinct musical and dance form. The jumps and ginga of these capoeiristas were their legacy to Pernambuco''s culture.

Of all the valentões of Recife carnival—Jovino dos Coelhos, Nicolau do Poço, João de Totó—only Nascimento Grande was considered more fearsome.',
  E'João de Totó foi um dos famosos capoeiras cujos nomes estão preservados na história do carnaval do Recife. Estava entre os valentões que se apresentavam na frente das bandas rivais de carnaval no final do século XIX e início do século XX em Pernambuco.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo," João de Totó foi um dos capoeiristas alvos da repressão policial no início dos anos 1900. A campanha policial contra os capoeiras mandou Valdevino, João de Totó e Jovino dos Coelhos para a detenção, outros para Fernando de Noronha (a notória ilha-prisão na costa de Pernambuco), e outros diretamente para o necrotério.

João de Totó fazia parte das maltas de capoeira que se organizavam em torno das bandas militares rivais durante a temporada de carnaval. As bandas do "Quarto" (4º Batalhão de Artilharia) e "Espanha" (Guarda Nacional) desfilavam pelo Recife protegidas pela agilidade, bravura, cacetes e facas de capoeiristas como ele. Esses capoeiristas executavam ginga e chutes que eventualmente foram transformados no "passo"—a dança fundamental do frevo.

A supressão das maltas de capoeira do Recife culminou por volta de 1912, coincidindo com o nascimento do frevo como forma musical e de dança distinta. Os saltos e a ginga desses capoeiristas foram seu legado para a cultura de Pernambuco.

De todos os valentões do carnaval do Recife—Jovino dos Coelhos, Nicolau do Poço, João de Totó—apenas Nascimento Grande era considerado mais temível.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Active as prominent valentão in late 1800s/early 1900s Recife. Arrested during police campaigns in early 1900s alongside Jovino dos Coelhos. If active as adult in 1890s-1900s, likely born 1860-1880. Using 1870 as midpoint estimate.

DEATH: Unknown. No death records found.

NAME: Only known by apelido "João de Totó." Full name unknown. Note: There is a neighborhood in Recife called "Totó" but the connection to this person is unclear.

PRIMARY SOURCES:
- Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Ativo como valentão proeminente no final dos anos 1800/início dos anos 1900 no Recife. Preso durante campanhas policiais no início dos anos 1900 junto com Jovino dos Coelhos. Se ativo como adulto nos anos 1890-1900, provavelmente nasceu 1860-1880. Usando 1870 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro de morte encontrado.

NOME: Conhecido apenas pelo apelido "João de Totó." Nome completo desconhecido. Nota: Há um bairro no Recife chamado "Totó" mas a conexão com esta pessoa não é clara.

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

-- Source: entities/persons/joao-grande.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: João Grande
-- Generated: 2025-12-15
-- ============================================================
-- One of the two principal heirs of Mestre Pastinha alongside
-- João Pequeno. Pioneer of capoeira angola in the United States.
-- Represented Brazil at Dakar Festival 1966. Founded Capoeira
-- Angola Center in New York City (1990). Still teaching at 91.
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
  'João Oliveira dos Santos',
  'João Grande',
  'mestre'::genealogy.title,
  'https://commons.wikimedia.org/wiki/File:MestreJoaoGrande.jpg',
  ARRAY['https://en.wikipedia.org/wiki/Jo%C3%A3o_Grande', 'https://joaogrande.org/', 'https://www.arts.gov/honors/heritage/joao-oliveira-dos-santos-mestre-joao-grande']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of Mestre Pastinha. Known for spreading the floor-touching mandinga movements he learned from Mestre Cobrinha Verde—a mystical practice of touching the floor as if making sorcery or asking for protection. Teaches capoeira "the African way, as a philosophy and a way of life, respecting the roots, history and tradition." His academy features berimbaus, historical photographs, and African cultural artifacts reflecting his deep appreciation for African culture.',
  E'Capoeira Angola pura na tradição de Mestre Pastinha. Conhecido por difundir os movimentos de mandinga de tocar o chão que aprendeu com Mestre Cobrinha Verde—uma prática mística de tocar o chão como se fizesse feitiçaria ou pedisse proteção. Ensina capoeira "do jeito africano, como filosofia e modo de vida, respeitando as raízes, história e tradição." Sua academia apresenta berimbaus, fotografias históricas e artefatos culturais africanos refletindo sua profunda apreciação pela cultura africana.',
  -- Life dates
  1933,
  'exact'::genealogy.date_precision,
  'Itagi, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'João Oliveira dos Santos was born on January 15, 1933, in the village of Itagi in southern Bahia. As a child, he worked alongside his family in the fields as a cattle herder. His mother died when he was young, and he never attended school.

At the age of ten, he saw a movement called "corta capim" for the first time—a crouching technique where one leg swings in a circle while hopping over it with the other. Fascinated, he asked what it was called and was told it was "the Dance of the Nagos," a dance of the African descendants in Salvador.

Ten years later, at age twenty, João left his rural life and arrived in Salvador, the birthplace of capoeira. At Roca do Lobo, he witnessed his first proper capoeira roda. Present were mestres Menino Gordo, João Pequeno, Mestre Barbosa, and Cobrinha Verde—one of the most skillful players of that era. João Pequeno sent him to Mestre Pastinha, who had an academy in the Cardeal Pequeno neighborhood of Brotas.

Pastinha accepted João as a student at the relatively late age of twenty. It was Pastinha who gave him the name "João Grande" (Big John) to distinguish him from the shorter João Pequeno, who had been training with Pastinha for two years prior. Together, the two Joãos became Pastinha''s "two most learned students"—the principal heirs to the Angola tradition. From Cobrinha Verde, João Grande learned the floor-touching mandinga movements that became emblematic of capoeira angola, which he later spread throughout the world.

In 1966, João Grande traveled to Dakar, Senegal, with Mestre Pastinha to demonstrate capoeira at the first World Festival of Black Arts (Festival des Arts Nègres). The delegation included Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. Pastinha, suffering from vision problems, played atabaque while the others performed.

In 1968, João Grande received his diploma from Pastinha, becoming a full-fledged mestre of capoeira angola.

He subsequently toured Europe and the Middle East with Viva Bahia, a pioneering folk group directed by Emília Biancardi that performed Afro-Brazilian arts including capoeira, samba, maculelê, candomblé, and puxada da rede. In 1974, he was part of another European tour. Painter Carybé documented João Grande in his artistic documentation of African culture in Bahia.

After Pastinha''s death on November 13, 1981, João Grande withdrew from the capoeira world and took a job at a gas station. He continued to perform in a limited capacity in folkloric shows for tourists.

In the mid-1980s, Mestre Moraes and Mestre Cobra Mansa persuaded him to come out of retirement. He began teaching with their organization, Grupo Capoeira Angola Pelourinho (GCAP).

In 1989, Mestre Jelon Vieira invited him to tour the United States. The tour was a tremendous success. In 1990, he performed at the National Black Arts Festival in Atlanta and at the Schomburg Center for Research in Black Culture in New York City. Ken Dossar and Daniel Dawson had invited him to Atlanta; Nego Gato invited him to teach in Harlem.

João Grande decided he liked the United States and settled in New York City in 1990. With help from Tisch Rosen (Risadinha), an English student and university professor, he established the Capoeira Angola Center on 14th Street in Manhattan. He has taught hundreds of students there—"Japanese, Germans, Africans, Americans, and women"—never needing to speak English because his students learn Portuguese for the rodas.

Today, the Capoeira Angola Center of Mestre João Grande has affiliates in Arizona, Finland, Italy, Japan, Los Angeles, Oakland, Serbia, Kenya, San Diego, and Illinois. He continues to teach at his academy at 350 Fort Washington Avenue, New York, holding classes and rodas with Mestre João Grande every Sunday.

At 91 years old (turning 92 in January 2025), Mestre João Grande has dedicated more than 70 years to capoeira angola. He is recognized as one of the most respected Grand Masters in the world—one of only two living grand masters of capoeira angola alongside João Pequeno''s successor, Mestre Faísca.',
  -- Extended content (bio_pt)
  E'João Oliveira dos Santos nasceu em 15 de janeiro de 1933, na vila de Itagi, no sul da Bahia. Quando criança, trabalhava com a família nos campos como vaqueiro. Sua mãe morreu quando ele era jovem, e nunca frequentou a escola.

Aos dez anos, viu pela primeira vez um movimento chamado "corta capim"—uma técnica agachada onde uma perna gira em círculo enquanto salta sobre ela com a outra. Fascinado, perguntou como se chamava e foi informado que era "a Dança dos Nagôs," uma dança dos descendentes africanos em Salvador.

Dez anos depois, aos vinte anos, João deixou sua vida rural e chegou a Salvador, o berço da capoeira. Em Roca do Lobo, testemunhou sua primeira roda de capoeira. Presentes estavam os mestres Menino Gordo, João Pequeno, Mestre Barbosa e Cobrinha Verde—um dos jogadores mais habilidosos daquela época. João Pequeno o enviou a Mestre Pastinha, que tinha uma academia no bairro Cardeal Pequeno de Brotas.

Pastinha aceitou João como aluno na idade relativamente tardia de vinte anos. Foi Pastinha quem lhe deu o nome "João Grande" para distingui-lo do mais baixo João Pequeno, que já treinava com Pastinha há dois anos. Juntos, os dois Joãos tornaram-se os "dois alunos mais preparados" de Pastinha—os principais herdeiros da tradição Angola. De Cobrinha Verde, João Grande aprendeu os movimentos de mandinga de tocar o chão que se tornaram emblemáticos da capoeira angola, os quais depois espalhou pelo mundo.

Em 1966, João Grande viajou para Dakar, Senegal, com Mestre Pastinha para demonstrar capoeira no primeiro Festival Mundial de Artes Negras (Festival des Arts Nègres). A delegação incluía Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Pastinha, sofrendo de problemas de visão, tocou atabaque enquanto os outros se apresentavam.

Em 1968, João Grande recebeu seu diploma de Pastinha, tornando-se um mestre completo de capoeira angola.

Posteriormente, excursionou pela Europa e Oriente Médio com Viva Bahia, um grupo folclórico pioneiro dirigido por Emília Biancardi que apresentava artes afro-brasileiras incluindo capoeira, samba, maculelê, candomblé e puxada da rede. Em 1974, participou de outra turnê europeia. O pintor Carybé documentou João Grande em sua documentação artística da cultura africana na Bahia.

Após a morte de Pastinha em 13 de novembro de 1981, João Grande se afastou do mundo da capoeira e trabalhou em um posto de gasolina. Continuou a se apresentar de forma limitada em shows folclóricos para turistas.

Em meados da década de 1980, Mestre Moraes e Mestre Cobra Mansa o persuadiram a sair da aposentadoria. Começou a ensinar com a organização deles, Grupo Capoeira Angola Pelourinho (GCAP).

Em 1989, Mestre Jelon Vieira o convidou para uma turnê pelos Estados Unidos. A turnê foi um tremendo sucesso. Em 1990, apresentou-se no National Black Arts Festival em Atlanta e no Schomburg Center for Research in Black Culture em Nova York. Ken Dossar e Daniel Dawson o haviam convidado para Atlanta; Nego Gato o convidou para ensinar no Harlem.

João Grande decidiu que gostava dos Estados Unidos e se estabeleceu em Nova York em 1990. Com a ajuda de Tisch Rosen (Risadinha), uma estudante de inglês e professora universitária, estabeleceu o Capoeira Angola Center na 14th Street em Manhattan. Ensinou centenas de alunos lá—"japoneses, alemães, africanos, americanos e mulheres"—nunca precisando falar inglês porque seus alunos aprendem português para as rodas.

Hoje, o Capoeira Angola Center de Mestre João Grande tem afiliados no Arizona, Finlândia, Itália, Japão, Los Angeles, Oakland, Sérvia, Quênia, San Diego e Illinois. Continua ensinando em sua academia na 350 Fort Washington Avenue, Nova York, realizando aulas e rodas com Mestre João Grande todo domingo.

Aos 91 anos (completando 92 em janeiro de 2025), Mestre João Grande dedicou mais de 70 anos à capoeira angola. É reconhecido como um dos Grão-Mestres mais respeitados do mundo—um dos únicos dois grão-mestres vivos da capoeira angola junto com o sucessor de João Pequeno, Mestre Faísca.',
  -- Achievements
  E'- Doctorate of Humane Letters from Upsala College, East Orange, New Jersey (1995)
- National Heritage Fellowship from National Endowment for the Arts (2001) - highest US honor for traditional arts
- Grand Cross of the Order of Cultural Merit (Grã-Cruz da Ordem do Mérito Cultural) from President Dilma Rousseff (November 9, 2015) - highest Brazilian cultural award
- Represented Brazil at First World Festival of Black Arts, Dakar, Senegal (1966)
- Diploma from Mestre Pastinha (1968) - full mestre recognition
- Founded Capoeira Angola Center of Mestre João Grande, New York City (1990)
- International affiliates in Arizona, Finland, Italy, Japan, Los Angeles, Oakland, Serbia, Kenya, San Diego, Illinois
- Pioneer of capoeira angola in the United States
- Over 70 years dedicated to capoeira angola
- Participated in 2017 Smithsonian Folklife Festival, leading master classes
- Multiple audio CDs and DVDs documenting capoeira angola',
  E'- Doutorado Honoris Causa pela Upsala College, East Orange, New Jersey (1995)
- National Heritage Fellowship do National Endowment for the Arts (2001) - maior honraria americana para artes tradicionais
- Grã-Cruz da Ordem do Mérito Cultural pela Presidente Dilma Rousseff (9 de novembro de 2015) - maior prêmio cultural brasileiro
- Representou o Brasil no Primeiro Festival Mundial de Artes Negras, Dakar, Senegal (1966)
- Diploma de Mestre Pastinha (1968) - reconhecimento completo como mestre
- Fundou o Capoeira Angola Center de Mestre João Grande, Nova York (1990)
- Afiliados internacionais no Arizona, Finlândia, Itália, Japão, Los Angeles, Oakland, Sérvia, Quênia, San Diego, Illinois
- Pioneiro da capoeira angola nos Estados Unidos
- Mais de 70 anos dedicados à capoeira angola
- Participou do Smithsonian Folklife Festival 2017, conduzindo master classes
- Múltiplos CDs e DVDs documentando a capoeira angola',
  -- Researcher notes (notes_en)
  E'Birth date confirmed as January 15, 1933 across multiple sources (Wikipedia, Velhos Mestres, NEA, Smithsonian). Birth place confirmed as Itagi, Bahia. João Grande is still alive and teaching in New York as of 2024-2025—classes scheduled through January 2025 with a "Fruta Madura 2025" event planned reuniting him with Mestre Dunga after 38 years. Velhos Mestres celebrated his 92nd birthday (January 2025). NEA states he received honorary doctorate from Upsala College in 1993, while other sources say 1994 or 1995—using 1995 as most commonly cited. He arrived in Salvador at age 20 (1953), joining Pastinha shortly after João Pequeno had already trained with Pastinha for two years. The mandinga floor-touching movements were specifically taught to him by Cobrinha Verde and later spread by João Grande. Dakar 1966 delegation included six capoeiristas: Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. Diploma received from Pastinha in 1968. Mestre Moraes considers João Grande his "true teacher." Capoeira Hub lists Mestre Jurandir Santos as his son and student, though this could not be independently confirmed in other sources.',
  E'Data de nascimento confirmada como 15 de janeiro de 1933 em múltiplas fontes (Wikipedia, Velhos Mestres, NEA, Smithsonian). Local de nascimento confirmado como Itagi, Bahia. João Grande ainda está vivo e ensinando em Nova York em 2024-2025—aulas programadas até janeiro de 2025 com evento "Fruta Madura 2025" planejado reunindo-o com Mestre Dunga após 38 anos. Velhos Mestres celebrou seu 92º aniversário (janeiro de 2025). NEA afirma que recebeu doutorado honorário da Upsala College em 1993, enquanto outras fontes dizem 1994 ou 1995—usando 1995 como mais comumente citado. Chegou em Salvador aos 20 anos (1953), juntando-se a Pastinha pouco depois de João Pequeno já ter treinado com Pastinha por dois anos. Os movimentos de mandinga de tocar o chão foram especificamente ensinados a ele por Cobrinha Verde e depois difundidos por João Grande. A delegação de Dakar 1966 incluía seis capoeiristas: Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Diploma recebido de Pastinha em 1968. Mestre Moraes considera João Grande seu "verdadeiro mestre." Capoeira Hub lista Mestre Jurandir Santos como seu filho e aluno, embora isso não tenha sido confirmado independentemente em outras fontes.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/joao-pequeno.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: João Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- One of the two principal heirs of Mestre Pastinha. Re-founded
-- Centro Esportivo de Capoeira Angola (CECA) in 1982 after
-- Pastinha's death, preserving the Angola tradition. Taught
-- until his 90s at Forte Santo Antônio, Salvador.
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
  'João Pereira dos Santos',
  'João Pequeno',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Jo%C3%A3o_Pereira_dos_Santos', 'https://ceca-riovermelho.org.br/mestres/mestre-joao-pequeno/?lang=en', 'https://joaopequeno.portalcapoeira.com/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of Mestre Pastinha. Emphasized the spiritual and cultural dimensions alongside technique. Known for preserving Pastinha''s authentic teaching methodology and the philosophical foundations of Angola capoeira. Taught that capoeira is a path of self-knowledge, not just physical technique.',
  E'Capoeira Angola pura na tradição de Mestre Pastinha. Enfatizava as dimensões espirituais e culturais junto com a técnica. Conhecido por preservar a metodologia autêntica de ensino de Pastinha e os fundamentos filosóficos da capoeira Angola. Ensinava que a capoeira é um caminho de autoconhecimento, não apenas técnica física.',
  -- Life dates
  1917,
  'exact'::genealogy.date_precision,
  'Araci, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'João Pereira dos Santos was born on December 27, 1917, in Araci, a small town in the interior of Bahia, north of Feira de Santana. His father, Maximiliano Pereira dos Santos, was a cowboy at Fazenda Vargem do Canto; his mother, Maria Clemença de Jesus, was a ceramicist of indigenous descent. Through his father, he was related to the legendary Besouro Mangangá—Besouro was his father''s cousin.

He spent his early years in rural Bahia. In 1933, when he was fifteen, severe drought drove him to flee on foot to Alagoinhas, then to Mata de São João, where he worked for ten years on a sugar cane plantation as a cattle herder. It was there, at Fazenda São Pedro, that a blacksmith named Juvêncio first introduced him to capoeira.

At age 25, with his parents'' permission, João moved to Salvador in January 1943. Working as a bricklayer and streetcar conductor, he found his way back to capoeira through a man named Barbosa, a dock worker who took him to the roda of Mestre Cobrinha Verde in the Chame-Chame neighborhood. One day, a man named Vicente Ferreira Pastinha came announcing he wanted to organize Salvador''s capoeira, inviting everyone to the Bigode, an old soap factory. João went—and his life changed forever.

Shortly after joining Pastinha''s academy, João was promoted to treinel (trainer) around 1945. Pastinha nicknamed him "Cobra Mansa" (Gentle Snake), though he became known as João Pequeno to distinguish him from the taller João Grande. Together with João Grande, he became one of Pastinha''s "two most learned students"—the principal heirs to the Angola tradition.

In 1966, João Pequeno represented Brazil at the Premier Festival des Arts Nègres in Dakar, Senegal, alongside Pastinha, João Grande, Gato Preto, Roberto Satanás, Gildo Alfinete, and Camafeu de Oxossi—a landmark moment in capoeira''s international recognition.

When Pastinha grew blind in his later years, João Pequeno and João Grande ran the academy. Pastinha entrusted his legacy to them, saying in 1970: "They will be the great capoeiras of the future and for this I worked and fought with them and for them. They will be true masters, not improvised teachers."

After Pastinha''s death on November 13, 1981, and the closing of the original CECA at Pelourinho, João Pequeno persevered through these difficult years. On May 2, 1982, he re-founded the Centro Esportivo de Capoeira Angola at Forte Santo Antônio Além do Carmo—a 17th-century military fortress he transformed into a cultural center. Pastinha had told him: "Only the body dies, the spirit lives forever. João, you take care of this."

For nearly three decades, the Forte became a pilgrimage site for capoeiristas worldwide seeking to learn from the source. Into his 90s, João Pequeno continued teaching, embodying Pastinha''s vision of capoeira as a path of self-knowledge and cultural preservation.

Out of 94 years of life, Mestre João Pequeno dedicated 79 of them to capoeira. He died on December 9, 2011, eighteen days before his 94th birthday, leaving behind a lineage that includes many of today''s most prominent Angola mestres.',
  -- Extended content (bio_pt)
  E'João Pereira dos Santos nasceu em 27 de dezembro de 1917, em Araci, uma pequena cidade no interior da Bahia, ao norte de Feira de Santana. Seu pai, Maximiliano Pereira dos Santos, era vaqueiro na Fazenda Vargem do Canto; sua mãe, Maria Clemença de Jesus, era ceramista de descendência indígena. Pelo lado paterno, era parente do lendário Besouro Mangangá—Besouro era primo de seu pai.

Passou seus primeiros anos na Bahia rural. Em 1933, quando tinha quinze anos, uma seca severa o fez fugir a pé para Alagoinhas, depois para Mata de São João, onde trabalhou por dez anos em uma plantação de cana-de-açúcar como vaqueiro. Foi lá, na Fazenda São Pedro, que um ferreiro chamado Juvêncio o apresentou pela primeira vez à capoeira.

Aos 25 anos, com permissão dos pais, João mudou-se para Salvador em janeiro de 1943. Trabalhando como pedreiro e condutor de bonde, reencontrou a capoeira através de um homem chamado Barbosa, um estivador que o levou à roda de Mestre Cobrinha Verde no bairro do Chame-Chame. Um dia, um homem chamado Vicente Ferreira Pastinha veio anunciando que queria organizar a capoeira de Salvador, convidando todos para o Bigode, uma antiga fábrica de sabão. João foi—e sua vida mudou para sempre.

Pouco depois de ingressar na academia de Pastinha, João foi promovido a treinel (instrutor) por volta de 1945. Pastinha o apelidou de "Cobra Mansa," embora ficasse conhecido como João Pequeno para distingui-lo do mais alto João Grande. Junto com João Grande, tornou-se um dos "dois alunos mais preparados" de Pastinha—os principais herdeiros da tradição Angola.

Em 1966, João Pequeno representou o Brasil no Premier Festival des Arts Nègres em Dakar, Senegal, ao lado de Pastinha, João Grande, Gato Preto, Roberto Satanás, Gildo Alfinete e Camafeu de Oxossi—um momento marcante no reconhecimento internacional da capoeira.

Quando Pastinha ficou cego em seus últimos anos, João Pequeno e João Grande dirigiam a academia. Pastinha confiou-lhes seu legado, dizendo em 1970: "Eles serão os grandes capoeiras do futuro e para isso trabalhei e lutei com eles e por eles. Serão mestres mesmo, não professores de improviso."

Após a morte de Pastinha em 13 de novembro de 1981, e o fechamento do CECA original no Pelourinho, João Pequeno perseverou nesses anos difíceis. Em 2 de maio de 1982, refundou o Centro Esportivo de Capoeira Angola no Forte Santo Antônio Além do Carmo—uma fortaleza militar do século XVII que transformou em centro cultural. Pastinha havia lhe dito: "Só o corpo morre, o espírito vive para sempre. João, você cuida disso."

Por quase três décadas, o Forte tornou-se local de peregrinação para capoeiristas do mundo todo que buscavam aprender da fonte. Aos 90 anos, João Pequeno continuava ensinando, incorporando a visão de Pastinha da capoeira como caminho de autoconhecimento e preservação cultural.

De 94 anos de vida, Mestre João Pequeno dedicou 79 deles à capoeira. Faleceu em 9 de dezembro de 2011, dezoito dias antes de completar 94 anos, deixando uma linhagem que inclui muitos dos mestres de Angola mais proeminentes da atualidade.',
  -- Achievements
  E'- Re-founded Centro Esportivo de Capoeira Angola (CECA) at Forte Santo Antônio (1982)
- Represented Brazil at Premier Festival des Arts Nègres, Dakar, Senegal (1966)
- Doctor Honoris Causa from Federal University of Bahia
- Doctor Honoris Causa from Federal University of Uberlândia
- Citizen of Salvador (Municipal Chamber)
- Commander of the Order of Cultural Merit (Brazilian Government, President Lula)
- Grand Master of the Order of Merit of Palmares (Alagoas State)
- Taught capoeira for 79 years, continuing into his 90s
- Trained numerous mestres who spread Angola capoeira worldwide',
  E'- Refundou o Centro Esportivo de Capoeira Angola (CECA) no Forte Santo Antônio (1982)
- Representou o Brasil no Premier Festival des Arts Nègres, Dakar, Senegal (1966)
- Doutor Honoris Causa pela Universidade Federal da Bahia
- Doutor Honoris Causa pela Universidade Federal de Uberlândia
- Cidadão de Salvador (Câmara Municipal)
- Comendador da Ordem do Mérito Cultural (Governo Brasileiro, Presidente Lula)
- Grão-Mestre da Ordem do Mérito dos Palmares (Estado de Alagoas)
- Ensinou capoeira por 79 anos, continuando aos 90 anos
- Formou numerosos mestres que espalharam a capoeira Angola pelo mundo',
  -- Researcher notes (notes_en)
  E'Birth date confirmed as December 27, 1917 across multiple sources (Wikipedia, CECA official site, Portal Capoeira). Death date December 9, 2011 confirmed. Family connection to Besouro Mangangá through father''s side (Besouro was father''s cousin). First capoeira teacher was Juvêncio in Mata de São João, but primary formal training under Pastinha from ~1945. The nickname "Cobra Mansa" was given by Pastinha but "João Pequeno" became the common name to distinguish from João Grande. Sources vary on exact date of treinel promotion (around 1945). Re-founding of CECA dated to May 2, 1982 in multiple sources.',
  E'Data de nascimento confirmada como 27 de dezembro de 1917 em múltiplas fontes (Wikipedia, site oficial do CECA, Portal Capoeira). Data de falecimento 9 de dezembro de 2011 confirmada. Conexão familiar com Besouro Mangangá pelo lado paterno (Besouro era primo do pai). Primeiro professor de capoeira foi Juvêncio em Mata de São João, mas treinamento formal principal com Pastinha a partir de ~1945. O apelido "Cobra Mansa" foi dado por Pastinha mas "João Pequeno" tornou-se o nome comum para distingui-lo de João Grande. Fontes variam sobre data exata da promoção a treinel (por volta de 1945). Refundação do CECA datada de 2 de maio de 1982 em múltiplas fontes.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/joel-lourenco.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Joel Lourenço
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- No exact birth year documented. However, he was described as
-- part of the same "generation" as Paraná (1922-1972) and Onça
-- Preta (1909-2006). He was a government worker in Rio by 1946
-- and already established as a capoeira organizer by 1953.
-- Working backwards: if active professionally in 1946, likely
-- born between 1900-1920. Using 1910 as midpoint estimate with
-- decade precision.
--
-- DEATH: Unknown. Still alive in 1980 (Museu de Folclore event).
-- Wife Ismarina documented in legal proceedings 2003, but this
-- doesn't confirm Joel's status at that time.
--
-- SIGNIFICANCE: Pioneer in using "capoeira de Angola" to register
-- his school in Rio de Janeiro. Organized and directed Bahian
-- capoeiristas in Rio during the 1950s. Featured prominently in
-- Edison Carneiro's 1953 article as embodying "a herança espiritual
-- de Angola" (the spiritual heritage of Angola). Core member of
-- the three Bahian mestres (with Paraná and Onça Preta) from whom
-- contemporary capoeira developed in Rio.
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
  'Joel Lourenço do Espírito Santo',
  'Joel Lourenço',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://velhosmestres.com/br/destaques-35',
    'https://capoeirahistory.com/masters-in-rio-de-janeiro/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Joel Lourenço was described by Edison Carneiro in 1953 as the person among all his companions in whom "a herança espiritual de Angola" (the spiritual heritage of Angola) was most evident. He organized and directed exhibitions of Bahian capoeiristas in Rio without commanding through force, instead relying on his skill in navigating the individualistic capoeira community. He was known for being "ágil como um gato" (agile as a cat) with the characteristics typical of Angolan capoeira practitioners.',
  E'Joel Lourenço foi descrito por Edison Carneiro em 1953 como a pessoa entre todos os seus companheiros em quem "a herança espiritual de Angola" era mais evidente. Ele organizou e dirigiu exibições de capoeiristas baianos no Rio sem comandar pela força, contando com sua habilidade em navegar a comunidade individualista da capoeira. Era conhecido por ser "ágil como um gato" com as características típicas dos praticantes de capoeira de Angola.',
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,  -- Death place unknown
  -- Extended content (English)
  E'Joel Lourenço do Espírito Santo was a Bahian capoeirista who played a pivotal role in establishing and organizing capoeira de Angola in Rio de Janeiro during the 1950s. Born in Bahia at an unknown date, he migrated to Rio de Janeiro and by 1946 was working for the municipal government, first at the Secretaria Geral de Administração (Departamento do Pessoal) and later with the 11º Distrito de Obras da Prefeitura.

In 1953, Edison Carneiro featured Joel Lourenço prominently in his article "A Arte dos Moleques de Sinhá" published in Flan magazine. Carneiro described him as the person among all his companions in whom the spiritual heritage of Angola was most evident: "Talvez seja esse negro, entre todos os seus companheiros, aquele em quem é mais patente a herança espiritual de Angola." Joel was recognized for his ability to organize and direct capoeira demonstrations, earning trust through skill rather than force in navigating the individualistic capoeira community. He was described as "ágil como um gato" (agile as a cat).

Joel Lourenço was one of the pioneers in using the term "capoeira de Angola" when registering his school''s name in Rio de Janeiro, at a time when the "utilitarian capoeira" of Sinhozinho was more prominent in the city. His students, however, did not continue using the "capoeira de Angola" designation, nor did they achieve the same prominence as their teacher.

In 1962, Joel Lourenço participated in the Rio de Janeiro staging of "O Pagador de Promessas" by Dias Gomes, alongside Mestre Paraná''s Conjunto Folclórico de Capoeira São Bento Pequeno. That same year, Onça Preta was documented as a member of Joel Lourenço''s capoeira Angola group.

Joel Lourenço maintained deep connections to both capoeira and samba communities. He was the son-in-law of Antenor dos Santos, a member of the Diretoria de Samba (Samba Board) of Portela, one of Rio''s most famous samba schools. He resided at Rua Itaúba, 243 in Madureira, a neighborhood in Rio''s northern zone known for its strong Afro-Brazilian cultural traditions.

In 1977, Joel Lourenço recorded an album "Samba de Caboclo" with his group, captured on February 27 in São João do Meriti, Rio de Janeiro. The recording featured Felipe da Encarnação alongside Joel Lourenço and was supervised by Aloysio de Alencar Pinto.

He participated in the First Folklore Festival in 1961 and continued his cultural activities into his later years. On March 14, 1980, he performed at the opening of the Museu de Folclore Edison Carneiro—a fitting tribute given Edison Carneiro''s early recognition of his significance to capoeira de Angola.

Joel Lourenço composed at least one capoeira song about the berimbau that was well-received among practitioners. Together with Paraná and Onça Preta, he formed part of the core group of Bahian mestres from whom a whole generation of capoeiristas born in the 1930s learned, forming the foundation from which contemporary capoeira developed in Rio de Janeiro.',
  -- Extended content (Portuguese)
  E'Joel Lourenço do Espírito Santo foi um capoeirista baiano que desempenhou papel fundamental no estabelecimento e organização da capoeira de Angola no Rio de Janeiro durante os anos 1950. Nascido na Bahia em data desconhecida, migrou para o Rio de Janeiro e em 1946 já trabalhava para o governo municipal, primeiro na Secretaria Geral de Administração (Departamento do Pessoal) e depois no 11º Distrito de Obras da Prefeitura.

Em 1953, Edison Carneiro destacou Joel Lourenço em seu artigo "A Arte dos Moleques de Sinhá" publicado na revista Flan. Carneiro o descreveu como a pessoa entre todos os seus companheiros em quem a herança espiritual de Angola era mais evidente: "Talvez seja esse negro, entre todos os seus companheiros, aquele em quem é mais patente a herança espiritual de Angola." Joel era reconhecido por sua habilidade em organizar e dirigir demonstrações de capoeira, conquistando confiança através da habilidade e não da força ao navegar a comunidade individualista da capoeira. Era descrito como "ágil como um gato".

Joel Lourenço foi um dos pioneiros a utilizar o termo "capoeira de Angola" ao registrar o nome de sua escola no Rio de Janeiro, numa época em que a "capoeira utilitária" de Sinhozinho era mais proeminente na cidade. Seus alunos, no entanto, não deram continuidade à denominação "capoeira de Angola", nem alcançaram o mesmo destaque que seu mestre.

Em 1962, Joel Lourenço participou da montagem carioca de "O Pagador de Promessas" de Dias Gomes, ao lado do Conjunto Folclórico de Capoeira São Bento Pequeno de Mestre Paraná. No mesmo ano, Onça Preta foi documentado como membro do grupo de capoeira Angola de Joel Lourenço.

Joel Lourenço manteve conexões profundas tanto com a comunidade da capoeira quanto do samba. Era genro de Antenor dos Santos, membro da Diretoria de Samba da Portela, uma das mais famosas escolas de samba do Rio. Residia na Rua Itaúba, 243 em Madureira, um bairro da zona norte do Rio conhecido por suas fortes tradições culturais afro-brasileiras.

Em 1977, Joel Lourenço gravou um álbum "Samba de Caboclo" com seu grupo, registrado em 27 de fevereiro em São João do Meriti, Rio de Janeiro. A gravação contou com Felipe da Encarnação ao lado de Joel Lourenço e foi supervisionada por Aloysio de Alencar Pinto.

Participou do Primeiro Festival Folclórico em 1961 e continuou suas atividades culturais até idade avançada. Em 14 de março de 1980, apresentou-se na inauguração do Museu de Folclore Edison Carneiro—uma homenagem adequada dado o reconhecimento precoce de Edison Carneiro sobre sua importância para a capoeira de Angola.

Joel Lourenço compôs pelo menos uma música de capoeira sobre o berimbau que foi bem recebida entre os praticantes. Junto com Paraná e Onça Preta, formou parte do grupo central de mestres baianos com quem toda uma geração de capoeiristas nascidos nos anos 1930 aprendeu, formando a base a partir da qual a capoeira contemporânea se desenvolveu no Rio de Janeiro.',
  -- Achievements (English)
  E'- Pioneer in using "capoeira de Angola" to register his school name in Rio de Janeiro
- Organized and directed Bahian capoeiristas in Rio de Janeiro (1950s)
- Featured prominently in Edison Carneiro''s "A Arte dos Moleques de Sinhá" (1953)
- Performed in "O Pagador de Promessas" (Rio production, 1962)
- Participated in First Folklore Festival (1961)
- Recorded "Samba de Caboclo" album with his group (1977)
- Performed at opening of Museu de Folclore Edison Carneiro (1980)
- Composed capoeira song about the berimbau',
  -- Achievements (Portuguese)
  E'- Pioneiro em usar "capoeira de Angola" para registrar o nome de sua escola no Rio de Janeiro
- Organizou e dirigiu capoeiristas baianos no Rio de Janeiro (anos 1950)
- Destacado no artigo de Edison Carneiro "A Arte dos Moleques de Sinhá" (1953)
- Atuou em "O Pagador de Promessas" (produção carioca, 1962)
- Participou do Primeiro Festival Folclórico (1961)
- Gravou o álbum "Samba de Caboclo" com seu grupo (1977)
- Apresentou-se na inauguração do Museu de Folclore Edison Carneiro (1980)
- Compôs música de capoeira sobre o berimbau',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION:
- No exact birth year documented
- Contemporary of Paraná (1922-1972) and Onça Preta (1909-2006)
- Government worker in Rio by 1946; established capoeira organizer by 1953
- Estimated 1910 with decade precision based on career timeline

DEATH: Unknown
- Still active in 1980 (Museu de Folclore performance)
- Wife Ismarina do Espírito Santo documented in 2003 legal proceedings
- No death date found in sources

FULL NAME VARIANTS:
- Joel Lourenço do Espírito Santo (full name per velhosmestres.com)
- Joel Lourenço dos Santos (per some sources - may be error)
- Mestre Joel (common reference)

FAMILY:
- Wife: Ismarina do Espírito Santo (documented 2003)
- Father-in-law: Antenor dos Santos (Portela samba school Diretoria de Samba)

RESIDENCE:
- Rua Itaúba, 243, Madureira, Rio de Janeiro

PROFESSION:
- Municipal government worker: Secretaria Geral de Administração, Departamento do Pessoal (1946-1947)
- Later: 11º Distrito de Obras da Prefeitura

KEY DATES:
- 1946-1955: Documented in Rio de Janeiro newspapers and government records
- 1953: Featured in Edison Carneiro''s "A Arte dos Moleques de Sinhá" (Flan magazine, May 31)
- 1961: First Folklore Festival
- 1962: O Pagador de Promessas; Onça Preta documented in his group
- 1977 Feb 27: Samba de Caboclo recording (São João do Meriti)
- 1980 Mar 14: Museu de Folclore Edison Carneiro opening exhibition

TEACHER: UNKNOWN
- No documentation found about who taught Joel Lourenço in Bahia
- Described as having "herança espiritual de Angola" but no lineage specified

GROUP:
- Led capoeira Angola group in Rio (Onça Preta was member in 1962)
- Pioneer in registering school as "capoeira de Angola"
- Students did not continue using "capoeira de Angola" designation

RECORDINGS:
- 1977: "Samba de Caboclo - RJ" (7", 33⅓ RPM) - Grupo Joel Lourenço
  - Recorded: São João do Meriti, Feb 27, 1977
  - Recording by: José Moreira Frade
  - Supervision/editing: Aloysio de Alencar Pinto
  - Featured: Felipe da Encarnação, Joel Lourenço do Espirito Santo

DISTINCTION FROM OTHER "MESTRE JOELS":
- Joel de Souza Menezes (1944-2020) is a DIFFERENT person
  - Born Santo Amaro, raised Feira de Santana
  - Student of Mestre Arara (Bimba lineage)
  - Recorded 1979 LP "Capoeira" (Associação de Capoeira Ilha de Itapuã)
  - Based in São Paulo
- Our Joel Lourenço (Rio/Angola) is distinct from this Joel de Souza Menezes (Salvador/Bimba lineage)

SOURCES CONSULTED:
- velhosmestres.com/br/destaques-35 (primary biographical source)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-parana-1922-1972/
- discogs.com (Samba de Caboclo release)
- Academic paper on capoeira angola implantation in Rio (Semantic Scholar)
- Lalaue.com (Mestre Joel disambiguation)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO:
- Nenhum ano de nascimento exato documentado
- Contemporâneo de Paraná (1922-1972) e Onça Preta (1909-2006)
- Funcionário do governo no Rio em 1946; organizador de capoeira estabelecido em 1953
- Estimado 1910 com precisão de década baseado na cronologia de carreira

FALECIMENTO: Desconhecido
- Ainda ativo em 1980 (apresentação no Museu de Folclore)
- Esposa Ismarina do Espírito Santo documentada em procedimentos legais de 2003
- Nenhuma data de falecimento encontrada nas fontes

VARIANTES DO NOME COMPLETO:
- Joel Lourenço do Espírito Santo (nome completo per velhosmestres.com)
- Joel Lourenço dos Santos (per algumas fontes - pode ser erro)
- Mestre Joel (referência comum)

FAMÍLIA:
- Esposa: Ismarina do Espírito Santo (documentada 2003)
- Sogro: Antenor dos Santos (Diretoria de Samba da Portela)

RESIDÊNCIA:
- Rua Itaúba, 243, Madureira, Rio de Janeiro

PROFISSÃO:
- Funcionário do governo municipal: Secretaria Geral de Administração, Departamento do Pessoal (1946-1947)
- Depois: 11º Distrito de Obras da Prefeitura

DATAS CHAVE:
- 1946-1955: Documentado em jornais do Rio de Janeiro e registros governamentais
- 1953: Destacado no artigo de Edison Carneiro "A Arte dos Moleques de Sinhá" (revista Flan, 31 de maio)
- 1961: Primeiro Festival Folclórico
- 1962: O Pagador de Promessas; Onça Preta documentado em seu grupo
- 1977 Fev 27: Gravação Samba de Caboclo (São João do Meriti)
- 1980 Mar 14: Inauguração do Museu de Folclore Edison Carneiro

MESTRE: DESCONHECIDO
- Nenhuma documentação encontrada sobre quem ensinou Joel Lourenço na Bahia
- Descrito como tendo "herança espiritual de Angola" mas sem linhagem especificada

GRUPO:
- Liderou grupo de capoeira Angola no Rio (Onça Preta era membro em 1962)
- Pioneiro em registrar escola como "capoeira de Angola"
- Alunos não continuaram usando a denominação "capoeira de Angola"

GRAVAÇÕES:
- 1977: "Samba de Caboclo - RJ" (7", 33⅓ RPM) - Grupo Joel Lourenço
  - Gravado: São João do Meriti, 27 Fev 1977
  - Gravação por: José Moreira Frade
  - Supervisão/edição: Aloysio de Alencar Pinto
  - Participação: Felipe da Encarnação, Joel Lourenço do Espirito Santo

DISTINÇÃO DE OUTROS "MESTRE JOELS":
- Joel de Souza Menezes (1944-2020) é uma pessoa DIFERENTE
  - Nascido em Santo Amaro, criado em Feira de Santana
  - Aluno de Mestre Arara (linhagem Bimba)
  - Gravou LP "Capoeira" 1979 (Associação de Capoeira Ilha de Itapuã)
  - Baseado em São Paulo
- Nosso Joel Lourenço (Rio/Angola) é distinto deste Joel de Souza Menezes (Salvador/linhagem Bimba)

FONTES CONSULTADAS:
- velhosmestres.com/br/destaques-35 (fonte biográfica principal)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-parana-1922-1972/
- discogs.com (lançamento Samba de Caboclo)
- Artigo acadêmico sobre implantação da capoeira angola no Rio (Semantic Scholar)
- Lalaue.com (desambiguação Mestre Joel)'
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

-- Source: entities/persons/jose-bidel.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: José Bidel
-- Generated: 2025-12-16
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
  'José Bidel dos Santos',
  'José Bidel',
  NULL, -- Layer Zero proto-capoeirista; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira of the Recôncavo before the Angola/Regional split. Trained with companions of Besouro Mangangá including Siri de Mangue and Neco Canário Pardo.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana do Recôncavo antes da divisão Angola/Regional. Treinou com companheiros de Besouro Mangangá incluindo Siri de Mangue e Neco Canário Pardo.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'José Bidel dos Santos was a crabber from São Francisco do Conde in the Recôncavo Baiano. He made his living harvesting crabs from the mangrove estuaries of the Recôncavo, hard work that required intimate knowledge of the tides and marshlands. Like many working men of his generation in the Recôncavo, José Bidel practiced capoeira.

Along with his brother Dendê, José Bidel belonged to the network of capoeiristas connected to Besouro Mangangá and his companions in Santo Amaro. The two brothers associated with some of the most renowned capoeiristas of the early 20th century Recôncavo—Siri de Mangue, who worked as a saveirista (boatman) on the rivers, and Neco Canário Pardo, who taught machete fighting as well as capoeira. According to José Bidel''s son Mário, Besouro himself even visited their house, though this would have been before Mário was born, as Besouro was killed in 1924.

What we know of José Bidel comes primarily from the testimony of his son, Mário dos Santos, who would become known as Mestre Mário Buscapé. Mário describes learning capoeira beginning at age eight in improvised rodas in their family''s backyard. His uncle Dendê was his first teacher, but his father José Bidel also trained him in the art. The lineage that Mário learned—passed down from Besouro through his companions to Dendê and José Bidel—would eventually reach Rio de Janeiro, where Mário would become one of four founding figures of contemporary capoeira in that city.

José Bidel represents a critical link in capoeira history: a Layer Zero figure from the generation that knew Besouro''s companions directly, who preserved the traditional capoeira of the Recôncavo and transmitted it to the next generation before the formal codification of styles. Through his son''s teaching and the founding of Grupo Bonfim in 1953, the knowledge José Bidel carried forward from the working-class capoeiristas of São Francisco do Conde became part of the foundation of modern capoeira in Rio de Janeiro.

His life exemplifies the social reality of capoeira in the early 20th century Recôncavo—practiced by working men like crabbers, boatmen, and dock workers, passed informally through families and communities, existing in the margins of a society that had only recently abolished slavery and still treated its Afro-Brazilian population with systematic violence and exploitation.',
  -- bio_pt
  E'José Bidel dos Santos era um catador de caranguejos de São Francisco do Conde no Recôncavo Baiano. Ganhava a vida colhendo caranguejos dos estuários de mangue do Recôncavo, trabalho árduo que exigia conhecimento íntimo das marés e pântanos. Como muitos homens trabalhadores de sua geração no Recôncavo, José Bidel praticava capoeira.

Junto com seu irmão Dendê, José Bidel pertencia à rede de capoeiristas conectados a Besouro Mangangá e seus companheiros em Santo Amaro. Os dois irmãos se associavam com alguns dos capoeiristas mais renomados do Recôncavo do início do século XX—Siri de Mangue, que trabalhava como saveirista (barqueiro) nos rios, e Neco Canário Pardo, que ensinava luta de facão além de capoeira. Segundo o filho de José Bidel, Mário, o próprio Besouro chegou a visitar sua casa, embora isso tenha sido antes de Mário nascer, pois Besouro foi morto em 1924.

O que sabemos sobre José Bidel vem principalmente do testemunho de seu filho, Mário dos Santos, que se tornaria conhecido como Mestre Mário Buscapé. Mário descreve aprender capoeira a partir dos oito anos em rodas improvisadas no quintal de sua família. Seu tio Dendê foi seu primeiro professor, mas seu pai José Bidel também o treinou na arte. A linhagem que Mário aprendeu—passada de Besouro através de seus companheiros para Dendê e José Bidel—eventualmente chegaria ao Rio de Janeiro, onde Mário se tornaria uma das quatro figuras fundadoras da capoeira contemporânea naquela cidade.

José Bidel representa um elo crítico na história da capoeira: uma figura da Camada Zero da geração que conheceu diretamente os companheiros de Besouro, que preservou a capoeira tradicional do Recôncavo e a transmitiu para a próxima geração antes da codificação formal dos estilos. Através do ensino de seu filho e da fundação do Grupo Bonfim em 1953, o conhecimento que José Bidel levou adiante dos capoeiristas da classe trabalhadora de São Francisco do Conde tornou-se parte da base da capoeira moderna no Rio de Janeiro.

Sua vida exemplifica a realidade social da capoeira no Recôncavo do início do século XX—praticada por homens trabalhadores como catadores de caranguejo, barqueiros e trabalhadores portuários, passada informalmente através de famílias e comunidades, existindo às margens de uma sociedade que havia abolido recentemente a escravidão e ainda tratava sua população afro-brasileira com violência sistemática e exploração.',
  -- achievements_en
  'Father and teacher of Mestre Mário Buscapé; preserved Recôncavo capoeira lineage from Besouro''s era; transmitted traditional capoeira to the generation that would found contemporary Rio capoeira',
  -- achievements_pt
  'Pai e professor de Mestre Mário Buscapé; preservou a linhagem da capoeira do Recôncavo da era de Besouro; transmitiu a capoeira tradicional para a geração que fundaria a capoeira contemporânea do Rio',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1900, decade precision): José Bidel had a son born in 1934 (Mário Buscapé). If he was in his 30s when his son was born, birth estimate is ~1900-1910. He was old enough to have trained with Besouro''s companions (Siri de Mangue, Canário Pardo) who were active in the 1920s. Using 1900 as midpoint with decade precision.

DEATH: Unknown. No records found.

FAMILY: Brother of Dendê (Mário Buscapé''s uncle and first capoeira teacher). Father of Mário dos Santos (Mestre Mário Buscapé, 1934-2021). Wife Maria dos Anjos dos Santos was a shellfish gatherer (marisqueira).

OCCUPATION: Crabber (catador de caranguejos) in São Francisco do Conde.

LINEAGE DISCREPANCY: One web source (Capoeira Rotterdam) states "Besouro → Dendê → José Bidel → Mário Buscapé," suggesting Dendê taught José Bidel. However, Mário Buscapé''s own testimony (primary source) states Dendê was his uncle and José Bidel was his father, with both being brothers who trained together with Besouro''s companions. Both taught Mário. The relationship "Dendê → José Bidel" as teacher-student is UNCONFIRMED. More likely: both brothers learned from the same circle (Siri de Mangue, Canário Pardo) and both taught Mário.

BESOURO CONNECTION: According to Mário Buscapé, Besouro visited their house, but this must have been before Mário was born (pre-1924). José Bidel and Dendê were not direct students of Besouro but rather associated with his companions after his death.

PENDING RELATIONSHIPS (require SQL imports):
- Dendê: family_of (brother relationship)
- Mário Buscapé: family_of (father-son) - entity already imported

ACTIVE RELATIONSHIPS (entities already imported):
- Siri de Mangue: associated_with (training companions)
- Neco Canário Pardo: associated_with (training companions)
- Besouro Mangangá: associated_with (visited family home; trained with his companions)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): José Bidel teve um filho nascido em 1934 (Mário Buscapé). Se estava na casa dos 30 anos quando seu filho nasceu, estimativa de nascimento é ~1900-1910. Era velho o suficiente para ter treinado com os companheiros de Besouro (Siri de Mangue, Canário Pardo) que eram ativos nos anos 1920. Usando 1900 como ponto médio com precisão de década.

MORTE: Desconhecida. Nenhum registro encontrado.

FAMÍLIA: Irmão de Dendê (tio de Mário Buscapé e primeiro professor de capoeira). Pai de Mário dos Santos (Mestre Mário Buscapé, 1934-2021). Esposa Maria dos Anjos dos Santos era marisqueira.

OCUPAÇÃO: Catador de caranguejos em São Francisco do Conde.

DISCREPÂNCIA DE LINHAGEM: Uma fonte web (Capoeira Rotterdam) afirma "Besouro → Dendê → José Bidel → Mário Buscapé," sugerindo que Dendê ensinou José Bidel. No entanto, o próprio testemunho de Mário Buscapé (fonte primária) afirma que Dendê era seu tio e José Bidel era seu pai, sendo ambos irmãos que treinaram juntos com os companheiros de Besouro. Ambos ensinaram Mário. A relação "Dendê → José Bidel" como professor-aluno é NÃO CONFIRMADA. Mais provável: ambos os irmãos aprenderam do mesmo círculo (Siri de Mangue, Canário Pardo) e ambos ensinaram Mário.

CONEXÃO COM BESOURO: Segundo Mário Buscapé, Besouro visitou sua casa, mas isso deve ter sido antes de Mário nascer (pré-1924). José Bidel e Dendê não eram alunos diretos de Besouro, mas sim associados com seus companheiros após sua morte.

RELACIONAMENTOS PENDENTES (requerem importações SQL):
- Dendê: family_of (relação de irmãos)
- Mário Buscapé: family_of (pai-filho) - entidade já importada

RELACIONAMENTOS ATIVOS (entidades já importadas):
- Siri de Mangue: associated_with (companheiros de treino)
- Neco Canário Pardo: associated_with (companheiros de treino)
- Besouro Mangangá: associated_with (visitou casa da família; treinou com seus companheiros)'
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

-- Source: entities/persons/jovino-dos-coelhos.sql (NEW)
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

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo," the police began a campaign against the capoeiras, sending Valdevino, João de Totó, and Jovino dos Coelhos to detention, others to the prison island of Fernando de Noronha, and others directly to the morgue.

The newspaper Correio do Recife reported on his death on July 5, 1909, referring to him as a "bandido" (bandit). Items found in his pockets included notes to various individuals. Of all the valentões of Recife carnival—Jovino dos Coelhos, Nicolau do Poço, João de Totó—only Nascimento Grande was considered more fearsome.',
  E'Jovino dos Coelhos foi um dos valentões mais notáveis do Recife no final do século XIX e início do século XX. Segundo Oscar Mello em "Recife Sangrento" (1937), era protegido por políticos e cometia "toda sorte de horrores" na cidade.

Era famoso por ser quase impossível de prender—eram necessários mais de dez policiais para capturá-lo. Nadador exemplar, quando cercado pela polícia escapava lançando-se nas águas do Rio Capibaribe. Também manejava uma grande faca pontuda com habilidade excepcional.

Jovino estava entre os líderes de capoeira que protegiam as bandas rivais de carnaval no Recife. As bandas do "Quarto" (4º Batalhão de Artilharia) e "Espanha" (Guarda Nacional) desfilavam durante o carnaval de Pernambuco protegidas pela agilidade, bravura, cacetes e facas de capoeiristas como ele. Esses capoeiristas se apresentavam na frente das bandas usando ginga e golpes de pé que eventualmente foram transformados no "passo"—a dança fundamental do frevo.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo," a polícia iniciou uma campanha contra os capoeiras, mandando Valdevino, João de Totó e Jovino dos Coelhos para a detenção, outros para a ilha-prisão de Fernando de Noronha, e outros diretamente para o necrotério.

O jornal Correio do Recife noticiou sua morte em 5 de julho de 1909, referindo-se a ele como "bandido." Entre os itens encontrados em seus bolsos havia bilhetes para várias pessoas. De todos os valentões do carnaval do Recife—Jovino dos Coelhos, Nicolau do Poço, João de Totó—apenas Nascimento Grande era considerado mais temível.',
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

-- Source: entities/persons/julio-franca.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Júlio França
-- Generated: 2025-12-15
-- ============================================================
-- SOURCE: A Tarde newspaper article by Reynivaldo Brito, May 2, 1982
-- (archived at velhosmestres.com/br/cobrinha-1982-5)
--
-- BIRTH YEAR ESTIMATION:
-- No birth year documented. Júlio was described as a "great capoeirista"
-- who would "forcefully replace" his father in 1982, suggesting he was
-- an adult and accomplished practitioner. Cobrinha Verde was 70 in 1982.
-- If Júlio was born when Cobrinha was 25-35 (1937-1947), Júlio would have
-- been 35-45 in 1982. Estimate: ~1940 (decade precision).
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
  NULL, -- Full name unknown; only "Júlio" mentioned in source
  'Júlio França',
  NULL, -- No title documented
  NULL, -- No portrait available
  NULL, -- No public links
  -- Capoeira-specific
  'angola'::genealogy.style,
  'Inherited the Angola tradition directly from his father Mestre Cobrinha Verde, making him part of the Besouro Mangangá lineage.',
  'Herdou a tradição Angola diretamente de seu pai Mestre Cobrinha Verde, tornando-o parte da linhagem de Besouro Mangangá.',
  -- Life dates
  1940,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil', -- Assumed; Cobrinha Verde lived in Salvador
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Júlio França was the son and disciple of Mestre Cobrinha Verde (Rafael Alves França), one of the most respected capoeira masters of his era and cousin of the legendary Besouro Mangangá.

In May 1982, the newspaper A Tarde published a profile of the Bahian capoeira masters, reporting that Cobrinha Verde, then 70 years old and suffering from serious cardiac problems, was living at Júlio''s home. The article described Júlio as "his disciple and a great capoeirista, who will forcefully replace him"—indicating that by 1982, Júlio was already an accomplished practitioner prepared to carry on his father''s legacy.

This lineage is significant: through his father, Júlio França stands as a direct heir to the teachings that originated with Besouro Mangangá. Cobrinha Verde received his training from Besouro starting at age four and promised his dying cousin that he would teach capoeira freely, a promise he kept throughout his life.

What happened to Júlio after his father''s death in May 1983 is not documented in available sources. Whether he continued teaching at his father''s Centro Esportivo de Capoeira Angola Dois de Julho or elsewhere remains unknown.',
  -- bio_pt
  E'Júlio França era filho e discípulo de Mestre Cobrinha Verde (Rafael Alves França), um dos mestres de capoeira mais respeitados de sua época e primo do lendário Besouro Mangangá.

Em maio de 1982, o jornal A Tarde publicou um perfil dos mestres de capoeira baianos, relatando que Cobrinha Verde, então com 70 anos e sofrendo de sérios problemas cardíacos, estava morando na casa de Júlio. O artigo descreveu Júlio como "seu discípulo e grande capoeirista, o qual forçosamente o substituirá"—indicando que em 1982, Júlio já era um praticante realizado preparado para continuar o legado de seu pai.

Esta linhagem é significativa: através de seu pai, Júlio França se posiciona como herdeiro direto dos ensinamentos que se originaram com Besouro Mangangá. Cobrinha Verde recebeu seu treinamento de Besouro desde os quatro anos de idade e prometeu ao seu primo moribundo que ensinaria capoeira gratuitamente, uma promessa que manteve durante toda sua vida.

O que aconteceu com Júlio após a morte de seu pai em maio de 1983 não está documentado nas fontes disponíveis. Se ele continuou ensinando no Centro Esportivo de Capoeira Angola Dois de Julho de seu pai ou em outro lugar permanece desconhecido.',
  -- achievements_en
  'Designated heir to Cobrinha Verde''s capoeira legacy; described as a "great capoeirista" in 1982 A Tarde article',
  -- achievements_pt
  'Herdeiro designado do legado de capoeira de Cobrinha Verde; descrito como "grande capoeirista" em artigo de A Tarde de 1982',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION: No birth date documented. Estimated ~1940 based on:
- In 1982, Cobrinha Verde (born 1912, age 70) was living with Júlio
- Júlio was described as ready to "forcefully replace" his father, suggesting maturity (35-45 years old)
- If Cobrinha Verde became a father between ages 25-35 (1937-1947), Júlio would have been born around 1940

FULL NAME: Only "Júlio" is mentioned in the primary source. "Júlio França" is derived from his father''s surname (Rafael Alves França). His actual registered name may differ.

TITLE: No formal capoeira title documented. The 1982 article calls him a "great capoeirista" but does not use "mestre."

DEATH: Unknown. No sources document his fate after 1983.

SOURCE: A Tarde newspaper, May 2, 1982, article by Reynivaldo Brito (text and photos), archived at velhosmestres.com/br/cobrinha-1982-5

PENDING INFORMATION:
- Verify full name from other sources
- Determine if he continued teaching after Cobrinha Verde''s death
- Find death date if deceased',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO: Nenhuma data de nascimento documentada. Estimado ~1940 baseado em:
- Em 1982, Cobrinha Verde (nascido em 1912, com 70 anos) estava morando com Júlio
- Júlio foi descrito como pronto para "forçosamente substituir" seu pai, sugerindo maturidade (35-45 anos)
- Se Cobrinha Verde se tornou pai entre os 25-35 anos (1937-1947), Júlio teria nascido por volta de 1940

NOME COMPLETO: Apenas "Júlio" é mencionado na fonte primária. "Júlio França" é derivado do sobrenome de seu pai (Rafael Alves França). Seu nome registrado real pode ser diferente.

TÍTULO: Nenhum título formal de capoeira documentado. O artigo de 1982 o chama de "grande capoeirista" mas não usa "mestre."

MORTE: Desconhecida. Nenhuma fonte documenta seu destino após 1983.

FONTE: Jornal A Tarde, 2 de maio de 1982, artigo de Reynivaldo Brito (texto e fotos), arquivado em velhosmestres.com/br/cobrinha-1982-5

INFORMAÇÕES PENDENTES:
- Verificar nome completo de outras fontes
- Determinar se ele continuou ensinando após a morte de Cobrinha Verde
- Encontrar data de morte se falecido'
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

-- Source: entities/persons/juvenal-engraxate.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Juvenal Engraxate (Juvenal Hermenegildo da Cruz)
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR: 1919 (exact date: January 31, 1919)
-- DEATH YEAR: 1998 (exact date: March 20, 1998)
-- FULL NAME: Juvenal Hermenegildo da Cruz
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Juvenal Hermenegildo da Cruz',
  'Juvenal Engraxate',
  'mestre'::genealogy.title,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1919,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1998,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'Juvenal Hermenegildo da Cruz, known in the capoeira world as "Juvenal Engraxate" or "Mestre Juvenal," was one of the most prominent names in Bahian capoeira during the 1930s and 1940s. Born on January 31, 1919, he was a natural defender of Capoeira Angola and became a bridge between the legendary early masters and the modern era.

The nickname "Engraxate" (shoeshine boy) came from his early work as a shoeshine boy near the Lacerda Elevator in Salvador. Like many capoeiristas of his era who came from Salvador''s urban poor, Juvenal worked humble jobs while dedicating himself to the art of capoeira.

Juvenal was formally recognized as a Mestre by the legendary Samuel Querido de Deus, the "king of capoeira." "This title was given to me by Samuel Querido-de-Deus," Juvenal later recounted. "Samuel liked my qualities and saw my future." Juvenal described his teacher as "uma onça" (a jaguar) and proclaimed that "Querido-de-Deus never lost a fight!" This formal transmission of the mestre title represents an important lineage connection in capoeira angola history.

According to journalist Cláudio Tavares, Juvenal was not a thug or a professional capoeirista who could be hired for "small services" like some capoeiristas of the time. Instead, Juvenal was a worker - a stevedore (dockworker) who spent hours of the day and even night in hard labor. Like most old capoeiristas who worked at the docks, stevedores took advantage of their rest hours after meals to practice and teach capoeira by the waterfront.

Juvenal held his capoeira rodas at the dock ramps of the old Mercado Modelo, at the Festas de Largo (street festivals), and frequented a "Barracão" where capoeira rodas were held in Chame Chame. He also played capoeira at the ramp of Conceição da Praia, where he was known as the champion.

In 1941, Juvenal was among the founding mestres of the Centro Nacional de Capoeira de Origem Angola (Gengibirra) at Ladeira de Pedra in the Liberdade neighborhood. This historic center, which would later pass to Mestre Pastinha''s leadership and become CECA, represented the first organized effort to preserve traditional Capoeira Angola. The four "donos e proprietários" (owners) were Noronha, Livino, Totonho de Maré, and Amorzinho, with 18 other mestres including Juvenal as co-founders.

Juvenal gained wider recognition in the 1940s. In 1946, the newspaper O Momento published an article on June 16 called "The disciples of mestre Juvenal challenge a capoeirista," mentioning Juvenal as the champion of Conceição da Praia. In 1948, the photographer Pierre Verger captured images of Juvenal for O Cruzeiro magazine, one of Brazil''s most important publications. In January 1948, O Cruzeiro published the article "Capoeira mata um!" (Capoeira kills one!) highlighting Mestre Juvenal and his roda at the Mercado Modelo.

In 1937, Juvenal played at the II Congresso Afro-Brasileiro (Second Afro-Brazilian Congress) alongside other legendary mestres including Barbosa. Historical photographs from this event survive, documenting this important cultural moment.

Jorge Amado, in his 1944 novel "Bahía de Todos os Santos," mentioned Mestre Juvenal in a section dedicated to Samuel Querido de Deus, describing Juvenal as "twenty years old, the most agile, the most technical" among the capoeira players. This literary recognition cemented Juvenal''s reputation as one of the great young talents of his generation.

Juvenal recorded a capoeira album in the 1940s, sung in Yoruba, Caboclo, and Portuguese, making him one of the early documenters of capoeira music and traditions. In September 1953, the Official Gazette listed Juvenal Hermenegildo da Cruz as a sailor at the Salvador Customs House, confirming his maritime employment.

With his authority as a recognized mestre, Juvenal condemned Capoeira Regional, saying: "Regional is not capoeira. It has similar traits to Angola. It has moves acquired from other fights." This stance reflected the traditionalist position of many Angola mestres during the Angola-Regional debates of the mid-20th century.

One of Mestre Juvenal''s famous phrases was: "A capoeira é minha cachaça" (Capoeira is my cachaça) - expressing how capoeira was his passion and lifeblood.

Among his students were Reginaldo, Antonio, Evangelista, and his son Romenil Assis da Cruz (from his first wife, Nair Pereira de Assis). Later, Juvenal married Olga Maria Santos da Cruz and had a daughter, Olga Silva da Cruz. Through these students and family members, Juvenal''s lineage continued into future generations.

Juvenal represented the second generation of Bahian capoeira mestres - following the first generation of Bimba, Pastinha, and Besouro, but alongside peers like Cobrinha Verde, Noronha, Waldemar, and Onça Preta. This generation bridged the criminalization era (when capoeira was illegal until 1940) and the modern period of capoeira''s cultural recognition.

Mestre Juvenal Hermenegildo da Cruz passed away on March 20, 1998, at the age of 79, leaving behind a rich legacy in the history of Capoeira Angola.',
  E'Juvenal Hermenegildo da Cruz, conhecido no mundo da capoeira como "Juvenal Engraxate" ou "Mestre Juvenal," foi um dos nomes mais proeminentes da capoeira baiana durante as décadas de 1930 e 1940. Nascido em 31 de janeiro de 1919, era um defensor natural da Capoeira Angola e se tornou uma ponte entre os lendários mestres iniciais e a era moderna.

O apelido "Engraxate" veio de seu trabalho inicial como engraxate perto do Elevador Lacerda em Salvador. Como muitos capoeiristas de sua época que vinham dos pobres urbanos de Salvador, Juvenal trabalhava em empregos humildes enquanto se dedicava à arte da capoeira.

Juvenal foi formalmente reconhecido como Mestre pelo lendário Samuel Querido de Deus, o "rei da capoeira." "Este título me foi dado por Samuel Querido-de-Deus," Juvenal mais tarde contou. "Samuel gostava das minhas qualidades e via meu futuro." Juvenal descrevia seu professor como "uma onça" e proclamava que "Querido-de-Deus nunca perdeu uma luta!" Esta transmissão formal do título de mestre representa uma importante conexão de linhagem na história da capoeira angola.

Segundo o jornalista Cláudio Tavares, Juvenal não era um bandido ou capoeirista profissional que poderia ser contratado para "pequenos serviços" como alguns capoeiristas da época. Em vez disso, Juvenal era um trabalhador - um estivador que passava horas do dia e até da noite em trabalho pesado. Como a maioria dos antigos capoeiristas que trabalhavam nas docas, os estivadores aproveitavam suas horas de descanso após as refeições para praticar e ensinar capoeira à beira-mar.

Juvenal realizava suas rodas de capoeira nas rampas das docas do antigo Mercado Modelo, nas Festas de Largo, e frequentava um "Barracão" onde rodas de capoeira eram realizadas em Chame Chame. Ele também jogava capoeira na rampa da Conceição da Praia, onde era conhecido como o campeão.

Em 1941, Juvenal estava entre os mestres fundadores do Centro Nacional de Capoeira de Origem Angola (Gengibirra) na Ladeira de Pedra no bairro da Liberdade. Este centro histórico, que mais tarde passaria para a liderança de Mestre Pastinha e se tornaria CECA, representou o primeiro esforço organizado para preservar a Capoeira Angola tradicional. Os quatro "donos e proprietários" eram Noronha, Livino, Totonho de Maré e Amorzinho, com outros 18 mestres incluindo Juvenal como cofundadores.

Juvenal ganhou reconhecimento mais amplo na década de 1940. Em 1946, o jornal O Momento publicou um artigo em 16 de junho chamado "Os discípulos do mestre Juvenal desafiam um capoeirista," mencionando Juvenal como o campeão da Conceição da Praia. Em 1948, o fotógrafo Pierre Verger capturou imagens de Juvenal para a revista O Cruzeiro, uma das publicações mais importantes do Brasil. Em janeiro de 1948, O Cruzeiro publicou o artigo "Capoeira mata um!" destacando Mestre Juvenal e sua roda no Mercado Modelo.

Em 1937, Juvenal jogou no II Congresso Afro-Brasileiro ao lado de outros mestres lendários incluindo Barbosa. Fotografias históricas deste evento sobrevivem, documentando este importante momento cultural.

Jorge Amado, em seu romance de 1944 "Bahía de Todos os Santos," mencionou Mestre Juvenal em uma seção dedicada a Samuel Querido de Deus, descrevendo Juvenal como "com vinte anos, o mais ágil, o mais técnico" entre os jogadores de capoeira. Este reconhecimento literário cimentou a reputação de Juvenal como um dos grandes jovens talentos de sua geração.

Juvenal gravou um álbum de capoeira na década de 1940, cantado em iorubá, caboclo e português, tornando-se um dos primeiros documentadores da música e tradições da capoeira. Em setembro de 1953, o Diário Oficial listou Juvenal Hermenegildo da Cruz como marinheiro na Alfândega de Salvador, confirmando seu emprego marítimo.

Com sua autoridade como mestre reconhecido, Juvenal condenou a Capoeira Regional, dizendo: "Regional não é capoeira. Tem traços semelhantes à Angola. Tem movimentos adquiridos de outras lutas." Esta posição refletia a posição tradicionalista de muitos mestres de Angola durante os debates Angola-Regional de meados do século XX.

Uma das frases famosas de Mestre Juvenal era: "A capoeira é minha cachaça" - expressando como a capoeira era sua paixão e sangue vital.

Entre seus alunos estavam Reginaldo, Antonio, Evangelista e seu filho Romenil Assis da Cruz (de sua primeira esposa, Nair Pereira de Assis). Mais tarde, Juvenal casou-se com Olga Maria Santos da Cruz e teve uma filha, Olga Silva da Cruz. Através desses alunos e membros da família, a linhagem de Juvenal continuou nas gerações futuras.

Juvenal representou a segunda geração de mestres de capoeira baianos - seguindo a primeira geração de Bimba, Pastinha e Besouro, mas ao lado de pares como Cobrinha Verde, Noronha, Waldemar e Onça Preta. Esta geração conectou a era da criminalização (quando a capoeira era ilegal até 1940) e o período moderno de reconhecimento cultural da capoeira.

Mestre Juvenal Hermenegildo da Cruz faleceu em 20 de março de 1998, aos 79 anos, deixando um rico legado na história da Capoeira Angola.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.
Formally recognized as Mestre by the legendary Samuel Querido de Deus.
Champion of Conceição da Praia, documented in 1946 newspaper coverage.
Photographed by Pierre Verger for O Cruzeiro magazine (1948), gaining national recognition.
Performed at the II Congresso Afro-Brasileiro (1937) alongside other legendary mestres.
Recorded one of the early capoeira albums in the 1940s, sung in Yoruba, Caboclo, and Portuguese.
Featured in Jorge Amado''s 1944 novel "Bahía de Todos os Santos" as "the most agile, the most technical" capoeirista.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.
Formalmente reconhecido como Mestre pelo lendário Samuel Querido de Deus.
Campeão da Conceição da Praia, documentado em cobertura jornalística de 1946.
Fotografado por Pierre Verger para a revista O Cruzeiro (1948), ganhando reconhecimento nacional.
Apresentou-se no II Congresso Afro-Brasileiro (1937) ao lado de outros mestres lendários.
Gravou um dos primeiros álbuns de capoeira na década de 1940, cantado em iorubá, caboclo e português.
Apresentado no romance de Jorge Amado de 1944 "Bahía de Todos os Santos" como o capoeirista "mais ágil, mais técnico".',
  E'Full name: Juvenal Hermenegildo da Cruz. Born January 31, 1919, died March 20, 1998. "Engraxate" nickname from his work as shoeshine boy near Lacerda Elevator. Also worked as stevedore at Salvador docks and as sailor at Customs House (1953). Second generation of Bahian mestres alongside Cobrinha Verde, Noronha, Waldemar. Jorge Amado described him as age 20 in 1944, which aligns with 1919 birth year. Students included Reginaldo, Antonio, Evangelista, and his son Romenil Assis da Cruz. Married first to Nair Pereira de Assis, then to Olga Maria Santos da Cruz (daughter: Olga Silva da Cruz). Famous saying: "A capoeira é minha cachaça" (Capoeira is my cachaça). Traditionalist stance against Capoeira Regional. Information from Velhos Mestres, O Cruzeiro magazine, Jorge Amado''s novel, Pierre Verger photographs.',
  E'Nome completo: Juvenal Hermenegildo da Cruz. Nasceu em 31 de janeiro de 1919, faleceu em 20 de março de 1998. Apelido "Engraxate" de seu trabalho como engraxate perto do Elevador Lacerda. Também trabalhou como estivador nas docas de Salvador e como marinheiro na Alfândega (1953). Segunda geração de mestres baianos ao lado de Cobrinha Verde, Noronha, Waldemar. Jorge Amado o descreveu como tendo 20 anos em 1944, o que se alinha com o ano de nascimento de 1919. Alunos incluíram Reginaldo, Antonio, Evangelista e seu filho Romenil Assis da Cruz. Casado primeiro com Nair Pereira de Assis, depois com Olga Maria Santos da Cruz (filha: Olga Silva da Cruz). Frase famosa: "A capoeira é minha cachaça". Posição tradicionalista contra a Capoeira Regional. Informações de Velhos Mestres, revista O Cruzeiro, romance de Jorge Amado, fotografias de Pierre Verger.'
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

-- Source: entities/persons/juvencio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Juvêncio
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Juvêncio was active as a mestre in the late 1930s-early 1940s:
-- - Taught João Pequeno at Fazenda São Pedro (1933-1943)
-- - Held rodas in São Félix when Ananias began learning (1938)
-- - Traíra encountered him in São Félix rodas (~1938)
-- If he was a mature, established mestre in 1938 (aged ~40-50),
-- this places his birth around 1888-1898. Using 1890 as midpoint.
-- ============================================================
-- DISAMBIGUATION:
-- This is Mestre Juvêncio, the dock worker/blacksmith from São Félix
-- and Mata de São João. NOT to be confused with Juvêncio Grosso, a
-- different capoeirista from Santo Amaro who taught Cobrinha Verde.
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
  NULL, -- Full name unknown; known only by apelido
  'Juvêncio',
  'São Félix', -- Context to distinguish from Juvêncio Grosso of Santo Amaro
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-ananias/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the formal Angola/Regional split. His informal roda style—gathering practitioners during festivals without formal classes—represents the authentic communal transmission of capoeira.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão formal Angola/Regional. Seu estilo de roda informal—reunindo praticantes durante festas sem aulas formais—representa a transmissão comunitária autêntica da capoeira.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Recôncavo Baiano, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Juvêncio was a working-class capoeirista from the Recôncavo Baiano who combined his professional trades with informal capoeira instruction. He worked as both a ferreiro (blacksmith) at Fazenda São Pedro in Mata de São João and as an estivador (dock worker) in São Félix—two of the traditional occupations that spread capoeira through Bahia''s coastal and agricultural regions.

In São Félix, a town on the banks of the Paraguaçu River adjacent to Cachoeira, Juvêncio organized rodas on the docks during religious festivals, particularly the celebrations of Igreja de São Deus Menino and Senhor São Félix. According to Mestre Ananias, who began learning in these rodas in 1938: "Juvêncio was the mestre. He was a dock worker who did capoeira on the docks of São Félix... Nobody taught classes, but the real master was Juvêncio, everyone got together and played."

This description captures the informal, communal nature of capoeira transmission in the Recôncavo before the era of formal academies. The roda at São Félix gathered practitioners including João de Zazá, brothers Toy and Roxinho, brothers Alvelino and Santos from Muritiba, Caial, and Estevão—a factory guard at the "Letialvi" cigar factory whom Ananias remembered as having "capoeira perversa" (vicious capoeira). Traíra from Cachoeira and Café also participated in these gatherings.

At Fazenda São Pedro in Mata de São João, Juvêncio worked as a blacksmith and introduced young João Pequeno to capoeira during the decade (1933-1943) João Pequeno spent working on the sugar cane plantation as a cattle herder. This was João Pequeno''s first contact with the art that would define his 79-year teaching career.

Juvêncio represents the bridge generation between the legendary era of Besouro Mangangá (who died in 1924) and the formal academies of Pastinha and Waldemar. Through his informal teaching, he influenced several practitioners who would become major lineage figures: João Pequeno would become one of Pastinha''s two principal heirs; Ananias would found the famous Roda da Praça da República in São Paulo; and Traíra would manage Mestre Waldemar''s roda and record a historic LP.

The fact that Juvêncio worked in multiple locations—Mata de São João (60km north of Salvador on the coast) and São Félix (in the Recôncavo)—reflects the mobility of working-class Bahians who moved between agricultural plantations, river ports, and coastal towns seeking employment. This mobility also helped spread capoeira across the region.',
  -- bio_pt
  E'Juvêncio era um capoeirista da classe trabalhadora do Recôncavo Baiano que combinava seus ofícios profissionais com o ensino informal de capoeira. Trabalhava tanto como ferreiro na Fazenda São Pedro em Mata de São João quanto como estivador em São Félix—duas das ocupações tradicionais que espalharam a capoeira pelas regiões costeiras e agrícolas da Bahia.

Em São Félix, cidade às margens do Rio Paraguaçu, adjacente a Cachoeira, Juvêncio organizava rodas nas docas durante festas religiosas, particularmente as celebrações da Igreja de São Deus Menino e Senhor São Félix. Segundo Mestre Ananias, que começou a aprender nessas rodas em 1938: "Juvêncio era o mestre. Ele era estivador e fazia capoeira na beira do cais de São Félix... Ninguém ensinava, mas o mestre mesmo era o Juvêncio, todo mundo se reunia e pronto."

Esta descrição captura a natureza informal e comunitária da transmissão da capoeira no Recôncavo antes da era das academias formais. A roda em São Félix reunia praticantes incluindo João de Zazá, os irmãos Toy e Roxinho, os irmãos Alvelino e Santos de Muritiba, Caial, e Estevão—um vigia da fábrica de charutos "Letialvi" que Ananias lembrava como tendo "capoeira perversa." Traíra de Cachoeira e Café também participavam desses encontros.

Na Fazenda São Pedro em Mata de São João, Juvêncio trabalhava como ferreiro e apresentou o jovem João Pequeno à capoeira durante a década (1933-1943) que João Pequeno passou trabalhando na plantação de cana-de-açúcar como chamador de boi. Este foi o primeiro contato de João Pequeno com a arte que definiria sua carreira de 79 anos de ensino.

Juvêncio representa a geração-ponte entre a era lendária de Besouro Mangangá (que morreu em 1924) e as academias formais de Pastinha e Waldemar. Através de seu ensino informal, ele influenciou vários praticantes que se tornariam figuras importantes de linhagem: João Pequeno se tornaria um dos dois principais herdeiros de Pastinha; Ananias fundaria a famosa Roda da Praça da República em São Paulo; e Traíra gerenciaria a roda de Mestre Waldemar e gravaria um LP histórico.

O fato de Juvêncio trabalhar em múltiplos locais—Mata de São João (60km ao norte de Salvador na costa) e São Félix (no Recôncavo)—reflete a mobilidade dos baianos da classe trabalhadora que se moviam entre plantações agrícolas, portos fluviais e cidades costeiras em busca de emprego. Esta mobilidade também ajudou a espalhar a capoeira pela região.',
  -- achievements_en
  'First capoeira teacher of Mestre João Pequeno (1933-1943); teacher of Mestre Ananias (1938+); teacher of Mestre Traíra (~1938); organizer of traditional rodas in São Félix during religious festivals; representative of pre-academic capoeira transmission in the Recôncavo',
  -- achievements_pt
  'Primeiro professor de capoeira de Mestre João Pequeno (1933-1943); professor de Mestre Ananias (1938+); professor de Mestre Traíra (~1938); organizador de rodas tradicionais em São Félix durante festas religiosas; representante da transmissão pré-acadêmica da capoeira no Recôncavo',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1890, decade precision):
Juvêncio was active as a mestre in the late 1930s-early 1940s. He taught João Pequeno (1933-1943) and was organizing rodas in São Félix when Ananias began learning (1938). If he was a mature, established mestre in 1938 (aged ~40-50), birth estimate is ~1888-1898. Using 1890 as midpoint.

DEATH: Unknown. No records of his death have been found.

NAME: Full name unknown. Known only by his apelido "Juvêncio."

DISAMBIGUATION:
This is Mestre Juvêncio, the dock worker/blacksmith who worked in São Félix and Mata de São João. He is DISTINCT from Juvêncio Grosso, a different capoeirista from Santo Amaro da Purificação who was listed among Cobrinha Verde''s teachers.

PROFESSIONS:
- Ferreiro (blacksmith) at Fazenda São Pedro, Mata de São João
- Estivador (dock worker) in São Félix

TEACHING LOCATIONS:
- Fazenda São Pedro, Mata de São João (where João Pequeno learned, 1933-1943)
- Docks of São Félix (where Ananias and Traíra learned, ~1938)

STUDENTS:
- João Pequeno (later became one of Pastinha''s two principal heirs)
- Ananias (later founded Roda da Praça da República in São Paulo)
- Traíra (later managed Waldemar''s roda, recorded historic LP)

RODA PARTICIPANTS (São Félix):
- João de Zazá
- Brothers Toy and Roxinho
- Brothers Alvelino and Santos (from Muritiba)
- Caial
- Estevão (cigar factory guard, "capoeira perversa")
- Traíra (from Cachoeira)
- Café (from Cachoeira)

FESTIVALS:
His rodas in São Félix coincided with festivals of Igreja de São Deus Menino and Senhor São Félix.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década):
Juvêncio estava ativo como mestre no final dos anos 1930-início dos anos 1940. Ensinou João Pequeno (1933-1943) e organizava rodas em São Félix quando Ananias começou a aprender (1938). Se era um mestre maduro e estabelecido em 1938 (com ~40-50 anos), estimativa de nascimento é ~1888-1898. Usando 1890 como ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Nome completo desconhecido. Conhecido apenas por seu apelido "Juvêncio."

DESAMBIGUAÇÃO:
Este é Mestre Juvêncio, o estivador/ferreiro que trabalhou em São Félix e Mata de São João. Ele é DISTINTO de Juvêncio Grosso, um capoeirista diferente de Santo Amaro da Purificação que foi listado entre os professores de Cobrinha Verde.

PROFISSÕES:
- Ferreiro na Fazenda São Pedro, Mata de São João
- Estivador em São Félix

LOCAIS DE ENSINO:
- Fazenda São Pedro, Mata de São João (onde João Pequeno aprendeu, 1933-1943)
- Cais de São Félix (onde Ananias e Traíra aprenderam, ~1938)

ALUNOS:
- João Pequeno (posteriormente tornou-se um dos dois principais herdeiros de Pastinha)
- Ananias (posteriormente fundou a Roda da Praça da República em São Paulo)
- Traíra (posteriormente gerenciou a roda de Waldemar, gravou LP histórico)

PARTICIPANTES DA RODA (São Félix):
- João de Zazá
- Irmãos Toy e Roxinho
- Irmãos Alvelino e Santos (de Muritiba)
- Caial
- Estevão (vigia da fábrica de charutos, "capoeira perversa")
- Traíra (de Cachoeira)
- Café (de Cachoeira)

FESTAS:
Suas rodas em São Félix coincidiam com festas da Igreja de São Deus Menino e Senhor São Félix.'
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

-- Source: entities/persons/leandro-bonaparte.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Leandro Bonaparte
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1830, decade precision):
-- Active as chief of São Francisco party during the 1870s-1880s, the peak
-- period of malta activity. As a "famous" chief leading one of the largest
-- parties within the Guaiamú federation, he would likely have been in his
-- 30s-50s during this period. Using the same methodology as for Manduca
-- da Praia (his rival/contemporary who was born ~1820s and active ~1850),
-- Leandro would have been born in the 1830s to be a mature gang leader
-- by the 1870s-1880s. Recorded with `decade` precision.
--
-- DEATH: Unknown. No records found, but capoeira practice was criminalized
-- in 1890 and the maltas were suppressed by Sampaio Ferraz. He would have
-- been in his 50s-60s at that time.
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
  'Leandro Bonaparte',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  ARRAY['https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/']::text[],
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro. The Guaiamú faction he led was known for training with razors and knives, a weapon tradition attributed to Portuguese immigrants who joined the maltas after 1850.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro. A facção Guaiamú que liderava era conhecida pelo treinamento com navalhas e facas, tradição de armas atribuída aos imigrantes portugueses que se juntaram às maltas após 1850.',
  -- Life dates
  1830,
  'decade'::genealogy.date_precision,
  NULL,  -- Birth place unknown, presumably Rio de Janeiro
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- bio_en
  E'Leandro Bonaparte was the chief of the São Francisco party, described by Plácido de Abreu in his 1886 book "Os Capoeiras" as "the great centre" of the Guaiamú federation. The São Francisco party was the most important of the Guaiamú parishes, and Bonaparte''s leadership made him one of the most powerful figures in Rio de Janeiro''s capoeira underworld.

The Guaiamú and Nagoa were the two major federations that controlled the capoeira maltas of Rio de Janeiro during the second half of the 19th century. While the Nagoas operated in the peripheral Cidade Velha and allied with the Conservative Party, the Guaiamús controlled the central Cidade Nova and aligned with the Republicans of the Liberal Party. Their rivalry played out in bloody street battles, political violence, and ritualized confrontations.

Under Bonaparte''s leadership, the Guaiamú federation included the parishes of São Francisco, Santa Rita, Marinha, Ouro Preto, and São Domingos de Gusmão, along with numerous smaller affiliated gangs. These groups were known as "houses" or "provinces," and members identified themselves by wearing red - the color of the Guaiamú. When enemy capoeiras met in a tavern, the Guaiamú would pour brandy on the ground and dance on it, then pour red wine over the brandy - symbolically stepping on the Nagoa''s white color and placing their red above it. This gesture was enough to start a fight, as no capoeira would tolerate seeing his color stepped upon.

The Guaiamú trained their novices on the hill of Livramento at a place called "Mango Tree." The rehearsals took place regularly on Sunday mornings and consisted of head and foot exercises and knife and razor blows. The most famous capoeiras served as instructors. Training progressed from clean hands to wooden weapons to actual blades.

The maltas were organized with military precision: chief, assistant, policemen, and rank-and-file soldiers. This structure allowed them to function both as territorial protection networks and as political muscle. During elections, capoeiras were hired as capangas (henchmen) by politicians to intimidate voters and attack opposition newspapers. The Liberal-aligned Guaiamú specifically targeted the Conservative-supporting press.

Bonaparte''s São Francisco party, along with the other Guaiamú groups, represented a new phase in capoeira history. The Guaiamús were characterized by their mixed composition - unlike the Nagoas, who were reportedly limited to African-born practitioners, the Guaiamú assimilated immigrants (particularly Portuguese after 1850), Creoles, free men, and even intellectuals. This diversity brought new weapons to capoeira: the razor is specifically attributed to Portuguese influence within the Guaiamú ranks.',
  -- bio_pt
  E'Leandro Bonaparte era o chefe do partido de São Francisco, descrito por Plácido de Abreu em seu livro de 1886 "Os Capoeiras" como "o grande centro" da federação Guaiamú. O partido de São Francisco era o mais importante das freguesias Guaiamú, e a liderança de Bonaparte o tornava uma das figuras mais poderosas no submundo da capoeira do Rio de Janeiro.

Os Guaiamú e Nagoa eram as duas maiores federações que controlavam as maltas de capoeira do Rio de Janeiro durante a segunda metade do século XIX. Enquanto os Nagoas operavam na periférica Cidade Velha e se aliavam ao Partido Conservador, os Guaiamús controlavam a central Cidade Nova e se alinhavam aos Republicanos do Partido Liberal. Sua rivalidade se manifestava em batalhas de rua sangrentas, violência política e confrontos ritualizados.

Sob a liderança de Bonaparte, a federação Guaiamú incluía as freguesias de São Francisco, Santa Rita, Marinha, Ouro Preto e São Domingos de Gusmão, junto com numerosas gangues menores afiliadas. Esses grupos eram conhecidos como "casas" ou "províncias", e os membros se identificavam usando vermelho - a cor do Guaiamú. Quando capoeiras inimigos se encontravam em uma taverna, o Guaiamú despejava aguardente no chão e dançava sobre ela, depois despejava vinho tinto sobre a aguardente - simbolicamente pisando na cor branca dos Nagoa e colocando seu vermelho acima. Este gesto era suficiente para iniciar uma briga, pois nenhum capoeira toleraria ver sua cor pisoteada.

Os Guaiamú treinavam seus novatos no morro do Livramento em um lugar chamado "Mangueira." Os ensaios aconteciam regularmente nas manhãs de domingo e consistiam em exercícios de cabeça e pé e golpes de faca e navalha. Os capoeiras mais famosos serviam como instrutores. O treinamento progredia de mãos limpas para armas de madeira até lâminas reais.

As maltas eram organizadas com precisão militar: chefe, assistente, policiais e soldados de base. Essa estrutura permitia que funcionassem tanto como redes de proteção territorial quanto como força política. Durante as eleições, capoeiras eram contratados como capangas por políticos para intimidar eleitores e atacar jornais de oposição. Os Guaiamú alinhados aos Liberais especificamente atacavam a imprensa que apoiava os Conservadores.

O partido de São Francisco de Bonaparte, junto com os outros grupos Guaiamú, representava uma nova fase na história da capoeira. Os Guaiamús eram caracterizados por sua composição mista - diferente dos Nagoas, que supostamente eram limitados a praticantes nascidos na África, os Guaiamú assimilavam imigrantes (particularmente portugueses após 1850), crioulos, homens livres e até intelectuais. Essa diversidade trouxe novas armas para a capoeira: a navalha é especificamente atribuída à influência portuguesa nas fileiras dos Guaiamú.',
  -- achievements_en
  'Chief of São Francisco party, the primary center of the Guaiamú federation; Led the largest and most influential parish within the Guaiamú coalition; Contemporary and rival of Manduca da Praia (Nagoa chief)',
  -- achievements_pt
  'Chefe do partido de São Francisco, o centro principal da federação Guaiamú; Liderou a maior e mais influente freguesia dentro da coalizão Guaiamú; Contemporâneo e rival de Manduca da Praia (chefe Nagoa)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1830, decade precision): Active as chief of São Francisco party during the 1870s-1880s, the peak period of malta activity. As a "famous" chief leading one of the largest parties within the Guaiamú federation, he would have been in his 30s-50s during this period. Using the same methodology as for Manduca da Praia (his rival/contemporary who was born ~1820s and active ~1850), Leandro would have been born in the 1830s to be a mature gang leader by the 1870s-1880s.

NAME: Only "Leandro Bonaparte" is recorded. The name "Bonaparte" is unusual for a Brazilian of this era - it may be a apelido or possibly indicates Portuguese or other European ancestry, consistent with the Guaiamú''s mixed composition.

PRIMARY SOURCE: Plácido de Abreu, "Os Capoeiras" (1886). Abreu described him as "o chefe famoso" (the famous chief) of São Francisco, identifying it as the "grande centro" (great center) of the Guaiamú.

SECONDARY SOURCES: José Alexandre Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1906), also lists "Bonaparte, Leandro" among famous capoeiras of Rio.

DEATH: Unknown. The maltas were suppressed after 1889-1890 when the Republican government criminalized capoeira under Sampaio Ferraz''s police campaigns.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1830, precisão de década): Ativo como chefe do partido de São Francisco durante a década de 1870-1880, o período de maior atividade das maltas. Como um chefe "famoso" liderando um dos maiores partidos dentro da federação Guaiamú, ele teria entre 30-50 anos durante este período. Usando a mesma metodologia de Manduca da Praia (seu rival/contemporâneo que nasceu ~1820 e estava ativo ~1850), Leandro teria nascido na década de 1830 para ser um líder maduro de gangue na década de 1870-1880.

NOME: Apenas "Leandro Bonaparte" está registrado. O nome "Bonaparte" é incomum para um brasileiro desta era - pode ser um apelido ou possivelmente indica ascendência portuguesa ou outra europeia, consistente com a composição mista dos Guaiamú.

FONTE PRIMÁRIA: Plácido de Abreu, "Os Capoeiras" (1886). Abreu o descreveu como "o chefe famoso" de São Francisco, identificando-o como o "grande centro" dos Guaiamú.

FONTES SECUNDÁRIAS: José Alexandre Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1906), também lista "Bonaparte, Leandro" entre os famosos capoeiras do Rio.

MORTE: Desconhecida. As maltas foram suprimidas após 1889-1890 quando o governo republicano criminalizou a capoeira sob as campanhas policiais de Sampaio Ferraz.'
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

-- Source: entities/persons/leopoldina.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Leopoldina
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH DATE: February 12, 1933 - Confirmed by multiple sources.
-- Some sources state "December 2, 1933" (Capoeira Fandom) but the
-- majority, including capoeirahistory.com and Raridades da Capoeira,
-- confirm February 12. One source notes he was born "on a carnival
-- Saturday," which aligns with February 1933.
--
-- DEATH DATE: October 17, 2007 - Universally confirmed.
-- Location: São José dos Campos, SP.
--
-- STYLE: Mixed - Trained first in tiririca (Rio street capoeira
-- without berimbau) under Quinzinho, then in Bahian capoeira
-- with berimbau under Artur Emídio. Later influenced by Angola
-- from suburban Rio angoleiros (c. 1963). This unique synthesis
-- made him respected by both Angoleiros and Regionalistas.
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
  'Demerval Lopes de Lacerda',
  'Leopoldina',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found; photos exist in André Lacé collection
  ARRAY[
    'https://en.wikipedia.org/wiki/Mestre_Leopoldina',
    'https://capoeirahistory.com/general/master-leopoldina-part-1/',
    'https://www.lalaue.com/learn-capoeira/mestre-leopoldina/',
    'https://sites.google.com/view/raridadesdacapoeira/mestre-leopoldina'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Leopoldina''s game was frequently described as quick, unpredictable, and full of mandinga. He synthesized two distinct traditions: the tiririca of carioca street fighters (learned from Quinzinho) and the Bahian capoeira with berimbau (learned from Artur Emídio). Later, around 1963, he was influenced by angoleiros at suburban Rio backyard rodas, which Artur Emídio noted was making Leopoldina "very slow." This unique fusion made him respected by both Angoleiros and Regionalistas. He was renowned for his mastery of the berimbau and his musical compositions, including the ladainha "Pareço Ganga Zumbi." His teaching emphasized kindness - he would not allow older students to hit beginners.',
  E'O jogo de Leopoldina era frequentemente descrito como rápido, imprevisível e cheio de mandinga. Ele sintetizou duas tradições distintas: a tiririca dos lutadores de rua cariocas (aprendida com Quinzinho) e a capoeira baiana com berimbau (aprendida com Artur Emídio). Mais tarde, por volta de 1963, foi influenciado por angoleiros nas rodas de quintal do subúrbio do Rio, o que Artur Emídio notou estar deixando Leopoldina "muito lento." Essa fusão única o tornou respeitado tanto por Angoleiros quanto por Regionalistas. Era renomado por sua maestria no berimbau e suas composições musicais, incluindo a ladainha "Pareço Ganga Zumbi." Seu ensino enfatizava a gentileza - não permitia que alunos mais velhos batessem nos iniciantes.',
  -- Life dates
  1933,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  2007,
  'exact'::genealogy.date_precision,
  'São José dos Campos, SP, Brazil',
  -- Extended content (English)
  E'Demerval Lopes de Lacerda, known as Mestre Leopoldina, was born on a carnival Saturday in Rio de Janeiro in 1933. His mother could not care for him, and he was often beaten and neglected by the relatives who took him in. As a child, he ran away and slept in train wagons, selling sweets to railroad workers at Central do Brasil station. His apelido allegedly derived from a Rio train station or a locomotive he used to imitate.

By seventeen, he had entered SAM (Serviço de Assistência ao Menor), a child care service, where he developed strong swimming skills. At eighteen, in 1951, he left SAM and began selling newspapers, eventually organizing a team of newsboys. It was during this time that he encountered Joaquim Felix - known as Quinzinho - a feared malandro with criminal convictions for murder, who led a gang and had already served time in the Colônia Penal.

Quinzinho was a capoeirista of the old style: tiririca, the capoeira without berimbau of the carioca reprobates, descended from the violent gangs of 19th-century Rio. His teaching method was informal - "do it like this... do it like that" - followed by harsh sparring. Leopoldina came every day at seven to train in front of Quinzinho''s house. Within months, he became the only person who could truly play with his master.

A few years later, Quinzinho was arrested again and murdered inside the prison. Leopoldina disappeared from the streets, fearing reprisal from Quinzinho''s enemies. When he returned, he learned that Valdemar Santana, a famous fighter, had brought a Bahian named Artur Emídio to Rio. Around 1954, Leopoldina became Artur''s student, learning Bahian capoeira played to the berimbau - a completely different world from what Quinzinho had taught.

Leopoldina worked at Cais do Porto on the docks and joined Resistência, a dock capoeira group. He retired before age 45 due to a work accident, then devoted himself fully to capoeira. In 1961, he began teaching at Academia Guanabara in Rio de Janeiro. His classes were small - typically four to eight students - and he never taught for more than five years in the same location. He emphasized rodas and games rather than technique drills.

That same year, 1961, at age twenty-eight, he first paraded with Mangueira samba school at Carnival. Mangueira was the first samba school to include capoeira in its parades, giving the art great visibility. Leopoldina organized sixty capoeiristas to perform demonstrations in Mangueira''s V.C. Entende wing. He maintained this partnership until about 1974.

Nestor Capoeira met Leopoldina in 1965 and was initiated into capoeira by him. Nestor would later become a prominent author and maker of the 2005 documentary "Mestre Leopoldina - A Fina Flor da Malandragem" (The Finest Flower of Roguishness), directed by Rose La Creta, which won the DOCTV 2004 contest and premiered internationally at Forum des Images in Paris. Celso Pepe also learned from Leopoldina at Academia Guanabara, absorbing the Angola game and São Bento Pequeno style.

Leopoldina taught capoeira at Atlética, the sports department of UFRJ (Federal University of Rio de Janeiro). Through capoeira, he traveled internationally to Switzerland, Italy, Amsterdam, Germany, and Senegal. From about 1990 onward, international travel became a regular part of his life. He developed close friendships with Grupo Senzala in São Paulo.

Beyond capoeira, Leopoldina introduced his students to Brazilian popular culture: samba, candomblé, and umbanda. He became associated with the spiritual entity Zé Pelintra from Umbanda - a trickster spirit that embodied the malandro philosophy. His famous saying, "A capoeira é a maçonaria da malandragem" (Capoeira is the freemasonry of roguishness), captured his worldview.

In 2005, when he was over seventy years old, he remained in excellent physical condition, playing at a fast pace with four or more young capoeiristas. He was one of the best-known masters of his time, alongside Mestres João Pequeno and João Grande. He died on October 17, 2007, in São José dos Campos.

Mestre Leopoldina was more than a capoeirista - he was a symbol of Rio''s malandragem, cultural resistance, and the fusion between Capoeira Angola, Regional, and Carioca traditions. He is remembered by both Angoleiros and Regionalistas as a good-humored old master representing the authentic malícia and malandragem of traditional capoeira.',
  -- Extended content (Portuguese)
  E'Demerval Lopes de Lacerda, conhecido como Mestre Leopoldina, nasceu num sábado de carnaval no Rio de Janeiro em 1933. Sua mãe não pôde cuidar dele, e foi frequentemente espancado e negligenciado pelos parentes que o acolheram. Quando criança, fugiu e dormia em vagões de trem, vendendo doces para os ferroviários na estação Central do Brasil. Seu apelido teria derivado de uma estação de trem do Rio ou de uma locomotiva que ele costumava imitar.

Aos dezessete anos, havia entrado no SAM (Serviço de Assistência ao Menor), onde desenvolveu fortes habilidades de natação. Aos dezoito, em 1951, saiu do SAM e começou a vender jornais, eventualmente organizando uma equipe de jornaleiros. Foi durante esse período que encontrou Joaquim Felix - conhecido como Quinzinho - um temido malandro com condenações criminais por homicídio, que liderava uma gangue e já havia cumprido pena na Colônia Penal.

Quinzinho era um capoeirista do estilo antigo: tiririca, a capoeira sem berimbau dos malandros cariocas, descendente das gangues violentas do Rio do século XIX. Seu método de ensino era informal - "faz assim... faz assim" - seguido de luta dura. Leopoldina vinha todos os dias às sete para treinar na frente da casa de Quinzinho. Em poucos meses, tornou-se a única pessoa que conseguia realmente jogar com seu mestre.

Alguns anos depois, Quinzinho foi preso novamente e assassinado dentro da prisão. Leopoldina sumiu das ruas, temendo represálias dos inimigos de Quinzinho. Quando voltou, soube que Valdemar Santana, um lutador famoso, havia trazido um baiano chamado Artur Emídio para o Rio. Por volta de 1954, Leopoldina tornou-se aluno de Artur, aprendendo a capoeira baiana tocada ao berimbau - um mundo completamente diferente do que Quinzinho havia ensinado.

Leopoldina trabalhou no Cais do Porto nas docas e integrou o Resistência, um grupo de capoeira dos estivadores. Aposentou-se antes dos 45 anos devido a um acidente de trabalho, depois se dedicou inteiramente à capoeira. Em 1961, começou a ensinar na Academia Guanabara no Rio de Janeiro. Suas turmas eram pequenas - tipicamente quatro a oito alunos - e nunca ensinou por mais de cinco anos no mesmo local. Enfatizava rodas e jogos em vez de treinos de técnica.

Naquele mesmo ano, 1961, aos vinte e oito anos, desfilou pela primeira vez com a escola de samba Mangueira no Carnaval. Mangueira foi a primeira escola de samba a incluir capoeira em seus desfiles, dando grande visibilidade à arte. Leopoldina organizou sessenta capoeiristas para fazer demonstrações na ala V.C. Entende da Mangueira. Manteve essa parceria até cerca de 1974.

Nestor Capoeira conheceu Leopoldina em 1965 e foi iniciado na capoeira por ele. Nestor mais tarde se tornaria um proeminente autor e realizador do documentário de 2005 "Mestre Leopoldina - A Fina Flor da Malandragem," dirigido por Rose La Creta, que ganhou o concurso DOCTV 2004 e estreou internacionalmente no Forum des Images em Paris. Celso Pepe também aprendeu com Leopoldina na Academia Guanabara, absorvendo o jogo de Angola e o estilo São Bento Pequeno.

Leopoldina ensinou capoeira na Atlética, o departamento de esportes da UFRJ (Universidade Federal do Rio de Janeiro). Através da capoeira, viajou internacionalmente para Suíça, Itália, Amsterdã, Alemanha e Senegal. A partir de cerca de 1990, viagens internacionais tornaram-se parte regular de sua vida. Desenvolveu amizades próximas com o Grupo Senzala em São Paulo.

Além da capoeira, Leopoldina apresentou seus alunos à cultura popular brasileira: samba, candomblé e umbanda. Tornou-se associado à entidade espiritual Zé Pelintra da Umbanda - um espírito malandro que encarnava a filosofia da malandragem. Sua famosa frase, "A capoeira é a maçonaria da malandragem," capturava sua visão de mundo.

Em 2005, quando tinha mais de setenta anos, permanecia em excelente condição física, jogando em ritmo acelerado com quatro ou mais jovens capoeiristas. Era um dos mestres mais conhecidos de seu tempo, ao lado dos Mestres João Pequeno e João Grande. Faleceu em 17 de outubro de 2007, em São José dos Campos.

Mestre Leopoldina foi mais que um capoeirista - foi um símbolo da malandragem carioca, da resistência cultural e da fusão entre Capoeira Angola, Regional e as tradições cariocas. É lembrado tanto por Angoleiros quanto por Regionalistas como um velho mestre bem-humorado representando a autêntica malícia e malandragem da capoeira tradicional.',
  -- Achievements (English)
  E'- Featured in documentary "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), directed by Rose La Creta, winner of DOCTV 2004
- Organized 60 capoeiristas for Mangueira samba school parades (1961-1974)
- First samba school-capoeira integration, giving capoeira national visibility
- Author of the ladainha "Pareço Ganga Zumbi"
- Taught at UFRJ (Federal University of Rio de Janeiro)
- International ambassador traveling to Switzerland, Italy, Amsterdam, Germany, and Senegal
- Participated in the film "Cordão de Ouro" (1977)
- One of the "five main lineages" of contemporary Rio de Janeiro capoeira',
  -- Achievements (Portuguese)
  E'- Protagonista do documentário "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), dirigido por Rose La Creta, vencedor do DOCTV 2004
- Organizou 60 capoeiristas para os desfiles da escola de samba Mangueira (1961-1974)
- Primeira integração escola de samba-capoeira, dando visibilidade nacional à capoeira
- Autor da ladainha "Pareço Ganga Zumbi"
- Ensinou na UFRJ (Universidade Federal do Rio de Janeiro)
- Embaixador internacional viajando para Suíça, Itália, Amsterdã, Alemanha e Senegal
- Participou do filme "Cordão de Ouro" (1977)
- Uma das "cinco principais linhagens" da capoeira contemporânea do Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH DATE DISCREPANCY: Most sources cite February 12, 1933. Capoeira Fandom wiki lists December 2, 1933. The February date is corroborated by multiple sources including capoeirahistory.com, Raridades da Capoeira, and Jogo da Vida. One source notes he was born "on a carnival Saturday" which aligns with February. Using February 12, 1933 as the confirmed date.

APELIDO ORIGIN: Sources suggest the nickname derived from either a Rio train station (Estação Leopoldina) or a locomotive he used to imitate as a child selling sweets on trains.

LINEAGE CONTEXT: Leopoldina represents the rare "premodern" Rio lineage - descended from Quinzinho and the tiririca tradition rather than from Bahian mestres. The lineage extends back through: Quinzinho (b.~1927) → Campanhão (b. 1900) → Prata Preta (b. 1868).

TRAINING TIMELINE:
- 1951: Met Quinzinho, began training in tiririca
- ~1954: Quinzinho murdered; Leopoldina switched to Artur Emídio
- ~1956: Celso Pepe began learning from Leopoldina at Academia Guanabara
- 1961: Began teaching at Academia Guanabara; first Mangueira parade
- ~1963: Influenced by suburban angoleiros
- 1965: Nestor Capoeira began training under him
- 1974: Ended Mangueira partnership

DOCUMENTARY: "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), 52 minutes. Director: Rose La Creta. Co-production: Ministério da Cultura, Secretaria do Audiovisual, ABEPEC, TV Cultura. Won DOCTV 2004 contest. International premiere June 24, 2005 at Forum des Images, Paris.

CONTEMPORARY CONTEXT: Leopoldina was part of a generation of capoeiristas born in the 1930s who formed the core of contemporary Rio capoeira, including Artur Emídio, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes, and Celso do Engenho.

PENDING RELATIONSHIPS (requires imports):
- Nestor Capoeira student_of Leopoldina (1965-1968) - Nestor Capoeira not yet imported
- Celso Pepe student_of Leopoldina (~1956-1960s) - Celso Pepe not yet imported

COMPLETED RELATIONSHIPS:
- Leopoldina student_of Artur Emídio (~1954+) - Statement added when Artur Emídio was imported',
  -- Researcher notes (Portuguese)
  E'DISCREPÂNCIA NA DATA DE NASCIMENTO: A maioria das fontes cita 12 de fevereiro de 1933. A wiki Capoeira Fandom lista 2 de dezembro de 1933. A data de fevereiro é corroborada por múltiplas fontes incluindo capoeirahistory.com, Raridades da Capoeira e Jogo da Vida. Uma fonte nota que ele nasceu "num sábado de carnaval" o que se alinha com fevereiro. Usando 12 de fevereiro de 1933 como data confirmada.

ORIGEM DO APELIDO: Fontes sugerem que o apelido derivou de uma estação de trem do Rio (Estação Leopoldina) ou de uma locomotiva que ele costumava imitar quando criança vendendo doces nos trens.

CONTEXTO DA LINHAGEM: Leopoldina representa a rara linhagem "pré-moderna" do Rio - descendente de Quinzinho e da tradição da tiririca em vez dos mestres baianos. A linhagem se estende através de: Quinzinho (n.~1927) → Campanhão (n. 1900) → Prata Preta (n. 1868).

CRONOLOGIA DO TREINAMENTO:
- 1951: Conheceu Quinzinho, começou a treinar tiririca
- ~1954: Quinzinho assassinado; Leopoldina passou para Artur Emídio
- ~1956: Celso Pepe começou a aprender com Leopoldina na Academia Guanabara
- 1961: Começou a ensinar na Academia Guanabara; primeiro desfile na Mangueira
- ~1963: Influenciado por angoleiros do subúrbio
- 1965: Nestor Capoeira começou a treinar com ele
- 1974: Encerrou parceria com Mangueira

DOCUMENTÁRIO: "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), 52 minutos. Diretora: Rose La Creta. Coprodução: Ministério da Cultura, Secretaria do Audiovisual, ABEPEC, TV Cultura. Ganhou concurso DOCTV 2004. Estreia internacional em 24 de junho de 2005 no Forum des Images, Paris.

CONTEXTO CONTEMPORÂNEO: Leopoldina fazia parte de uma geração de capoeiristas nascidos nos anos 1930 que formaram o núcleo da capoeira contemporânea do Rio, incluindo Artur Emídio, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes e Celso do Engenho.

RELACIONAMENTOS PENDENTES (requer importações):
- Nestor Capoeira student_of Leopoldina (1965-1968) - Nestor Capoeira ainda não importado
- Celso Pepe student_of Leopoldina (~1956-1960s) - Celso Pepe ainda não importado

RELACIONAMENTOS COMPLETADOS:
- Leopoldina student_of Artur Emídio (~1954+) - Declaração adicionada quando Artur Emídio foi importado'
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

-- Source: entities/persons/lucio-pequeno.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Lúcio Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1880, decade precision):
-- Active as founding mestre of Gengibirra in 1920s. Assuming
-- he was 30-45 years old when founding an organized capoeira
-- center (typical mestre age for leadership), birth = 1875-1895.
-- Using 1880 as midpoint estimate.
--
-- RELATIONSHIP TO CÂNDIDO PEQUENO:
-- Shares surname with Cândido Pequeno, but NO SOURCE confirms any
-- family relationship. The shared surname may be coincidental.
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
  NULL,  -- Full name unknown
  'Lúcio Pequeno',
  NULL,  -- No disambiguation context needed
  NULL,  -- No formal title documented
  NULL,  -- No known portrait
  ARRAY['https://en.wikipedia.org/wiki/Capoeira_Angola']::text[],  -- Wikipedia article listing the 22 founding mestres
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-stylistic era; practiced what would later be called Capoeira Angola. The Gengibirra center had codified combat rules and formal organization predating the Angola/Regional split of the 1930s.',
  E'Era pré-estilística; praticava o que mais tarde seria chamado de Capoeira Angola. O centro Gengibirra tinha regras de combate codificadas e organização formal antes da divisão Angola/Regional da década de 1930.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',  -- Assumed based on Gengibirra location
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Lúcio Pequeno appears in history as one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the first organized capoeira center in Bahia. The center was established in the 1920s at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood in Salvador.\n\nThis information comes from the manuscripts of Mestre Noronha (Daniel Coutinho, 1909-1977), one of the most important primary sources documenting early 20th century capoeira in Salvador. In his handwritten notebooks, completed in 1976 and published posthumously in 1993, Noronha listed all 22 founding mestres of Gengibirra. Lúcio Pequeno''s name appears immediately after Cândido Pequeno "Argolinha de Ouro" (Golden Little Ring), the "champion of capoeira in the State of Bahia" who was Noronha''s own teacher from 1917.\n\nLúcio and Cândido share the surname "Pequeno," but no source confirms any family relationship between them. In Salvador''s capoeira world of the early 1900s, surnames were not always hereditary - they could reflect nicknames, physical characteristics, or adopted names. The shared surname may be coincidental.\n\nLúcio Pequeno was part of the founding generation that sought to organize and legitimize capoeira angola at a time when the practice was still criminalized in Brazil. The Gengibirra center adopted green and yellow - the colors of the Brazilian flag - as its official colors, wore them on their clothes, and established clear combat rules.\n\nIn 1941, following the death of Amorzinho, the surviving mestres handed the center to Mestre Pastinha. There is no mention of Lúcio Pequeno in connection with this 1941 transfer, suggesting he may have died or departed the group before then. Beyond his name in Noronha''s list, nothing else is known about Lúcio Pequeno.',
  E'Lúcio Pequeno aparece na história como um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, o primeiro centro de capoeira organizado na Bahia. O centro foi estabelecido na década de 1920 na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade, em Salvador.\n\nEsta informação vem dos manuscritos de Mestre Noronha (Daniel Coutinho, 1909-1977), uma das mais importantes fontes primárias documentando a capoeira do início do século XX em Salvador. Em seus cadernos manuscritos, completados em 1976 e publicados postumamente em 1993, Noronha listou todos os 22 mestres fundadores do Gengibirra. O nome de Lúcio Pequeno aparece imediatamente após Cândido Pequeno "Argolinha de Ouro", o "campeão da capoeira do Estado da Bahia" que foi o próprio mestre de Noronha a partir de 1917.\n\nLúcio e Cândido compartilham o sobrenome "Pequeno," mas nenhuma fonte confirma qualquer relação familiar entre eles. No mundo da capoeira de Salvador do início de 1900, os sobrenomes nem sempre eram hereditários - podiam refletir apelidos, características físicas ou nomes adotados. O sobrenome compartilhado pode ser coincidência.\n\nLúcio Pequeno fez parte da geração fundadora que buscou organizar e legitimar a capoeira angola numa época em que a prática ainda era criminalizada no Brasil. O centro do Gengibirra adotou o verde e amarelo - as cores da bandeira brasileira - como suas cores oficiais, vestiam-nas em suas roupas e estabeleceram regras de combate claras.\n\nEm 1941, após a morte de Amorzinho, os mestres sobreviventes entregaram o centro a Mestre Pastinha. Não há menção de Lúcio Pequeno em conexão com essa transferência de 1941, sugerindo que ele pode ter morrido ou deixado o grupo antes disso. Além de seu nome na lista de Noronha, nada mais se sabe sobre Lúcio Pequeno.',
  -- Achievements (bilingual)
  'Co-founded the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra (Gengibirra) in the 1920s - the first organized Capoeira Angola center in Bahia. One of the 22 founding mestres documented in Mestre Noronha''s manuscripts.',
  'Co-fundou o Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra (Gengibirra) na década de 1920 - o primeiro centro de Capoeira Angola organizado na Bahia. Um dos 22 mestres fundadores documentados nos manuscritos de Mestre Noronha.',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1880, decade precision): Active as founding mestre of Gengibirra in 1920s. Assuming he was 30-45 years old when co-founding an organized capoeira center, birth = 1875-1895. Using 1880 as midpoint.\n\nDEATH: Unknown. No records found. Not mentioned in 1941 transfer to Pastinha, suggesting possible death before then.\n\nFULL NAME: Unknown. Only apelido recorded.\n\nSHARED SURNAME: Shares surname "Pequeno" with Cândido Pequeno (Argolinha de Ouro), also a Gengibirra founder. However, NO SOURCE confirms any family relationship. The shared surname may be coincidental.\n\nSOLE SOURCE: The only documentation of Lúcio Pequeno''s existence is Mestre Noronha''s manuscripts (O ABC da Capoeira Angola, completed 1976, published 1993).\n\nPENDING RELATIONSHIPS:\n- Lúcio Pequeno co_founded Gengibirra (1920s)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década): Ativo como mestre fundador do Gengibirra na década de 1920. Assumindo que tinha 30-45 anos quando co-fundou um centro de capoeira organizado, nascimento = 1875-1895. Usando 1880 como ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado. Não mencionado na transferência de 1941 para Pastinha, sugerindo possível morte antes disso.\n\nNOME COMPLETO: Desconhecido. Apenas apelido registrado.\n\nSOBRENOME COMPARTILHADO: Compartilha sobrenome "Pequeno" com Cândido Pequeno (Argolinha de Ouro), também fundador do Gengibirra. No entanto, NENHUMA FONTE confirma qualquer relação familiar. O sobrenome compartilhado pode ser coincidência.\n\nFONTE ÚNICA: A única documentação da existência de Lúcio Pequeno são os manuscritos de Mestre Noronha (O ABC da Capoeira Angola, concluído em 1976, publicado em 1993).\n\nRELACIONAMENTOS PENDENTES:\n- Lúcio Pequeno co_founded Gengibirra (década de 1920)'
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

-- Source: entities/persons/madeira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Madeira
-- Generated: 2025-12-16
-- ============================================================
-- Contemporary mestre from São Luís, Maranhão, Brazil.
-- Founder of Grupo Siri de Mangue. Teaching since 1974.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- Started martial arts (karate) at age 13. Has been teaching capoeira
-- since 1974. If he was in his early 20s when he started teaching,
-- birth year would be ~1950-1955. Using decade precision.
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
  'Madeira',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/', 'https://siridemangue.twoday.net/']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Mestre Madeira developed his own approach he calls "Estilo Novo" (New Style), which he initially intended to teach only to his ten children before expanding to a wider student body. His style combines traditional Capoeira Angola elements from Mestre Waldemar''s lineage with additional disciplines including Maculelê and his own self-defense system called "Siri do Brasil." He also incorporates Samba do Sirí into his teaching.',
  E'Mestre Madeira desenvolveu sua própria abordagem que ele chama de "Estilo Novo," que inicialmente pretendia ensinar apenas a seus dez filhos antes de expandir para um grupo maior de alunos. Seu estilo combina elementos tradicionais de Capoeira Angola da linhagem de Mestre Waldemar com disciplinas adicionais incluindo Maculelê e seu próprio sistema de autodefesa chamado "Siri do Brasil." Ele também incorpora Samba do Sirí em seu ensino.',
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  'São Luís, Maranhão, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Madeira is a contemporary capoeira mestre from São Luís, Maranhão, who has been teaching capoeira since 1974. His journey in martial arts began at age thirteen when he met his first karate teacher—an encounter that ignited a lifelong dedication to combat disciplines. Martial arts, he has said, never let him go.

After more than thirty-five years of practice and teaching, Madeira became the first Capoeira master to return to his home district in São Luís. The meetings with Mestre Waldemar were particularly formative for him. Waldemar (1916-1990), the legendary Bahian mestre known as "O Herói da Liberdade," represented the purest lineage of Capoeira Angola—a direct connection to the historical mestre Siri de Mangue, the saveirista who had been a training companion of the legendary Besouro Mangangá.

In honor of Mestre Waldemar and his favorite teacher Siri de Mangue, Madeira named his group "Siri de Mangue." He also received the honors of a mestre from three legendary figures: João Pequeno (one of Pastinha''s two principal heirs), Canjiquinha ("A Alegria da Capoeira"), and Suassuna (co-founder of Cordão de Ouro).

Initially, Madeira wanted only to teach the art of his "Estilo Novo" (New Style) to his ten children. But the teaching expanded, and Grupo Siri de Mangue grew beyond family. The group now practices and teaches Capoeira, Maculelê, Siri do Brasil (Madeira''s self-defense system), and Samba do Sirí.

From São Luís, Madeira''s influence has spread internationally. Grupo Siri de Mangue now has a presence in Brazil, Austria, Tanzania, Colombia, and Norway. In Austria, Professor Sarapó has established branches in Vienna and Linz, building a European base for Madeira''s teachings. A documentary about Mestre Madeira is currently in production.

Madeira remains based in São Luís, Maranhão, where he continues to teach. His personal philosophy is captured in his saying: "Capoeira é minha vida, berimbau é minha voz" (Capoeira is my life, the berimbau is my voice).',
  -- bio_pt
  E'Mestre Madeira é um mestre de capoeira contemporâneo de São Luís, Maranhão, que ensina capoeira desde 1974. Sua jornada nas artes marciais começou aos treze anos quando conheceu seu primeiro professor de karatê—um encontro que despertou uma dedicação vitalícia às disciplinas de combate. As artes marciais, como ele disse, nunca mais o deixaram.

Após mais de trinta e cinco anos de prática e ensino, Madeira tornou-se o primeiro mestre de Capoeira a retornar ao seu bairro de origem em São Luís. Os encontros com Mestre Waldemar foram particularmente formativos para ele. Waldemar (1916-1990), o lendário mestre baiano conhecido como "O Herói da Liberdade," representava a mais pura linhagem de Capoeira Angola—uma conexão direta com o mestre histórico Siri de Mangue, o saveirista que havia sido companheiro de treino do lendário Besouro Mangangá.

Em homenagem a Mestre Waldemar e seu mestre favorito Siri de Mangue, Madeira nomeou seu grupo "Siri de Mangue." Ele também recebeu as honras de mestre de três figuras lendárias: João Pequeno (um dos dois principais herdeiros de Pastinha), Canjiquinha ("A Alegria da Capoeira") e Suassuna (co-fundador do Cordão de Ouro).

Inicialmente, Madeira queria apenas ensinar a arte de seu "Estilo Novo" para seus dez filhos. Mas o ensino se expandiu, e o Grupo Siri de Mangue cresceu além da família. O grupo agora pratica e ensina Capoeira, Maculelê, Siri do Brasil (sistema de autodefesa de Madeira) e Samba do Sirí.

De São Luís, a influência de Madeira se espalhou internacionalmente. O Grupo Siri de Mangue agora tem presença no Brasil, Áustria, Tanzânia, Colômbia e Noruega. Na Áustria, Professor Sarapó estabeleceu filiais em Viena e Linz, construindo uma base europeia para os ensinamentos de Madeira. Um documentário sobre Mestre Madeira está atualmente em produção.

Madeira continua baseado em São Luís, Maranhão, onde continua a ensinar. Sua filosofia pessoal é capturada em seu ditado: "Capoeira é minha vida, berimbau é minha voz."',
  -- achievements_en
  E'Founded Grupo Siri de Mangue in São Luís, Maranhão
Teaching capoeira since 1974 (50+ years)
First capoeira master to return to his home district in São Luís
Received mestre title from Mestre João Pequeno
Received mestre title from Mestre Canjiquinha
Received mestre title from Mestre Suassuna
Expanded Grupo Siri de Mangue to Brazil, Austria, Tanzania, Colombia, and Norway
Created "Estilo Novo" methodology
Developed "Siri do Brasil" self-defense system
Documentary currently in production about his life and work',
  -- achievements_pt
  E'Fundou o Grupo Siri de Mangue em São Luís, Maranhão
Ensinando capoeira desde 1974 (mais de 50 anos)
Primeiro mestre de capoeira a retornar ao seu bairro de origem em São Luís
Recebeu título de mestre de Mestre João Pequeno
Recebeu título de mestre de Mestre Canjiquinha
Recebeu título de mestre de Mestre Suassuna
Expandiu o Grupo Siri de Mangue para Brasil, Áustria, Tanzânia, Colômbia e Noruega
Criou a metodologia "Estilo Novo"
Desenvolveu o sistema de autodefesa "Siri do Brasil"
Documentário atualmente em produção sobre sua vida e trabalho',
  -- notes_en
  E'FULL NAME: Unknown from available sources. Only referred to as "Mestre Madeira."

BIRTH YEAR ESTIMATION: Started martial arts (karate) at age 13. Teaching capoeira since 1974. If he was in his early 20s when he began teaching, birth year would be ~1950-1955. Using decade precision with 1950 as estimate.

TRAINING HISTORY:
- Started with karate at age 13
- Deeply influenced by meetings with Mestre Waldemar
- Named group after Waldemar''s favorite mestre (historical Siri de Mangue)
- Received mestre title/honors from João Pequeno, Canjiquinha, and Suassuna

RELATIONSHIP TO WALDEMAR: The nature of Madeira''s relationship to Waldemar is described as "meetings" (Treffen) that "particularly influenced" him. This suggests he was NOT a direct formal student but was influenced through encounters/workshops. Waldemar died in 1990, so any contact occurred before then. Using "influenced_by" rather than "student_of" for this relationship.

GRUPO SIRI DE MANGUE:
- Founded in São Luís, Maranhão (exact year unknown)
- Named after historical capoeirista Siri de Mangue (Waldemar''s teacher)
- Presence in Brazil, Austria, Tanzania, Colombia, Norway
- Teaches Capoeira, Maculelê, Siri do Brasil (self-defense), Samba do Sirí
- Professor Sarapó leads Austrian branch (Vienna, Linz)

STYLE: Described as "Estilo Novo" (New Style) - not pure Angola or Regional

SOURCES: siridemangue.com, tips.at article, various Austrian capoeira sources. Limited Portuguese-language documentation found.',
  -- notes_pt
  E'NOME COMPLETO: Desconhecido nas fontes disponíveis. Referido apenas como "Mestre Madeira."

ESTIMATIVA DO ANO DE NASCIMENTO: Começou artes marciais (karatê) aos 13 anos. Ensinando capoeira desde 1974. Se ele estava na casa dos 20 anos quando começou a ensinar, o ano de nascimento seria ~1950-1955. Usando precisão de década com 1950 como estimativa.

HISTÓRICO DE TREINAMENTO:
- Começou com karatê aos 13 anos
- Profundamente influenciado por encontros com Mestre Waldemar
- Nomeou o grupo em homenagem ao mestre favorito de Waldemar (Siri de Mangue histórico)
- Recebeu título/honras de mestre de João Pequeno, Canjiquinha e Suassuna

RELAÇÃO COM WALDEMAR: A natureza da relação de Madeira com Waldemar é descrita como "encontros" (Treffen) que "particularmente o influenciaram." Isso sugere que ele NÃO foi aluno formal direto, mas foi influenciado através de encontros/oficinas. Waldemar morreu em 1990, então qualquer contato ocorreu antes disso. Usando "influenced_by" ao invés de "student_of" para esta relação.

GRUPO SIRI DE MANGUE:
- Fundado em São Luís, Maranhão (ano exato desconhecido)
- Nomeado em homenagem ao capoeirista histórico Siri de Mangue (mestre de Waldemar)
- Presença no Brasil, Áustria, Tanzânia, Colômbia, Noruega
- Ensina Capoeira, Maculelê, Siri do Brasil (autodefesa), Samba do Sirí
- Professor Sarapó lidera a filial austríaca (Viena, Linz)

ESTILO: Descrito como "Estilo Novo" - não é Angola ou Regional pura

FONTES: siridemangue.com, artigo tips.at, várias fontes de capoeira austríacas. Documentação limitada em português encontrada.'
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

-- Source: entities/persons/mario-buscape.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Mário Buscapé
-- Generated: 2025-12-16
-- ============================================================
-- One of four founding lineages of contemporary capoeira in
-- Rio de Janeiro. Pioneer who brought Bahian capoeira to Rio.
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
  'Mário dos Santos',
  'Mário Buscapé',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  -- Capoeira-specific
  NULL, -- Mixed Bahian tradition; learned before formal style distinctions in Rio
  'Learned capoeira in the Bahian Recôncavo from his uncle Dendê and father José Bidel, who trained with Besouro, Siri de Mangue, and Canário Pardo. His style combined the traditional Bahian capoeira brought to Rio with practical academy teaching methods. His Bonfim group became known for training high-level competitors.',
  'Aprendeu capoeira no Recôncavo Baiano com seu tio Dendê e pai José Bidel, que treinaram com Besouro, Siri de Mangue e Canário Pardo. Seu estilo combinava a capoeira tradicional baiana trazida ao Rio com métodos práticos de ensino em academia. Seu grupo Bonfim tornou-se conhecido por formar competidores de alto nível.',
  -- Life dates
  1934,
  'exact'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  2021,
  'exact'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  -- bio_en
  E'Mário dos Santos, known as Mário Buscapé, was born on July 17, 1934, in a village near São Francisco do Conde in the Bahian Recôncavo. His mother, Maria dos Anjos dos Santos, was a shellfish gatherer, and his father, José Bidel dos Santos, was a crabber. Both his father and his uncle Dendê practiced capoeira and associated with famous capoeiristas of the Recôncavo—Siri de Mangue, Canário Pardo, and Besouro from Santo Amaro. According to Mário, Besouro even visited his house, though this would have been before Mário was born, as Besouro was killed in 1924.

At age eight, Mário began learning capoeira in improvised rodas in his family''s backyard, with his uncle Dendê as his first teacher. His father José Bidel also trained him, establishing the lineage that ran from Besouro through Bidel and Dendê to Mário himself.

In the early 1950s, seeking better opportunities, Mário traveled to Rio de Janeiro with an aunt. He settled in the poor neighborhood of Jacarezinho and found work laying panels and covers on the railroad. Later, he worked for many years at the Cavan company, which manufactured lamp posts.

At Cavan, Mário met Irineu dos Santos and began teaching him the fundamentals of capoeira. Through Irineu, he quickly won other followers, including Irineu''s brothers Zé Grande and Deraldo—all from the dos Santos family, also from Bahia but not related to Mário. On January 6, 1953, they founded the capoeira group Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in São Cristóvão but soon outgrew it due to the large number of students. They moved the academy to Olaria, where they trained many accomplished capoeiristas. Zé Grande stood out as their best disciple. The Bonfim group, led by Mário Buscapé, became famous in Rio de Janeiro for training high-level competitors who often won the competitions that began being organized in the city from the mid-1960s.

During this period, Mário frequented the roda of Mestre Artur Emídio, one of the few regular rodas in 1950s Rio. Witnesses from that era say Mário was very impressed with the speed of Artur Emídio''s game and subsequently elevated his own performance.

In 1969, Mário returned to Bahia, and his students Zé Grande and Deraldo took over leadership of the Bonfim group in Rio. The group continued to flourish under their direction. It was only many years later, in 1994, that students of Bonfim brought the master back to Rio de Janeiro.

There is consensus among capoeira historians that four lineages were the main influences in the formation of Contemporary Capoeira in Rio de Janeiro: those of Artur Emídio, Paraná, Mário Buscapé, and Roque. As M. Levi stated, these four "started to work in closed spaces of academies, introduced uniforms, organisation, etc. From these four the majority of capoeira masters here in Rio de Janeiro derived."

Mário Buscapé also participated in the folkloric group Capoeiras do Bonfim, which performed shows and exhibitions in Rio. Mestre Roque, another of the four founding lineages, joined this folkloric group.

In 2016, Mário published his memoir, "A saga de uma lenda viva" (The Saga of a Living Legend), edited by Paulinho Salmon and published by Azougue in Rio de Janeiro.

At the time of a 2017 ceremony honoring his 83rd birthday in São Francisco do Conde, he was recognized as "the father of Capoeira in São Francisco do Conde" and the 13th "cordão de ouro" (gold cord) in Brazil—one of the highest honors in the capoeira community.

Mário Buscapé passed away on August 19, 2021, in his native São Francisco do Conde, Bahia. As one practitioner declared at his 2017 celebration: "Mestre Mário is the root of everything."',
  -- bio_pt
  E'Mário dos Santos, conhecido como Mário Buscapé, nasceu em 17 de julho de 1934, em um vilarejo próximo a São Francisco do Conde, no Recôncavo Baiano. Sua mãe, Maria dos Anjos dos Santos, era marisqueira, e seu pai, José Bidel dos Santos, era catador de caranguejos. Tanto seu pai quanto seu tio Dendê praticavam capoeira e se associavam com famosos capoeiristas do Recôncavo—Siri de Mangue, Canário Pardo e Besouro de Santo Amaro. Segundo Mário, Besouro até visitou sua casa, embora isso tenha sido antes de Mário nascer, pois Besouro foi morto em 1924.

Aos oito anos, Mário começou a aprender capoeira em rodas improvisadas no quintal de sua família, tendo seu tio Dendê como primeiro professor. Seu pai José Bidel também o treinou, estabelecendo a linhagem que ia de Besouro, passando por Bidel e Dendê, até o próprio Mário.

No início dos anos 1950, buscando melhores oportunidades, Mário viajou para o Rio de Janeiro com uma tia. Estabeleceu-se no bairro pobre de Jacarezinho e encontrou trabalho colocando placas e coberturas na ferrovia. Depois, trabalhou por muitos anos na empresa Cavan, que fabricava postes de luz.

Na Cavan, Mário conheceu Irineu dos Santos e começou a ensinar-lhe os fundamentos da capoeira. Através de Irineu, rapidamente conquistou outros seguidores, incluindo os irmãos de Irineu, Zé Grande e Deraldo—todos da família dos Santos, também da Bahia, mas sem parentesco com Mário. Em 6 de janeiro de 1953, fundaram o grupo de capoeira Bonfim, também conhecido como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço em São Cristóvão, mas logo ficou pequeno devido ao grande número de alunos. Mudaram a academia para Olaria, onde treinaram muitos capoeiristas talentosos. Zé Grande destacou-se como o melhor discípulo. O grupo Bonfim, liderado por Mário Buscapé, tornou-se famoso no Rio de Janeiro por formar competidores de alto nível que frequentemente venciam as competições que começaram a ser organizadas na cidade a partir de meados dos anos 1960.

Durante este período, Mário frequentava a roda de Mestre Artur Emídio, uma das poucas rodas regulares no Rio dos anos 1950. Testemunhas daquela época dizem que Mário ficou muito impressionado com a velocidade do jogo de Artur Emídio e posteriormente elevou seu próprio desempenho.

Em 1969, Mário retornou à Bahia, e seus alunos Zé Grande e Deraldo assumiram a liderança do grupo Bonfim no Rio. O grupo continuou a prosperar sob sua direção. Foi apenas muitos anos depois, em 1994, que alunos do Bonfim trouxeram o mestre de volta ao Rio de Janeiro.

Há consenso entre os historiadores da capoeira de que quatro linhagens foram as principais influências na formação da Capoeira Contemporânea no Rio de Janeiro: as de Artur Emídio, Paraná, Mário Buscapé e Roque. Como M. Levi afirmou, esses quatro "começaram a trabalhar em espaços fechados de academias, introduziram uniformes, organização, etc. Desses quatro derivou a maioria dos mestres de capoeira aqui no Rio de Janeiro."

Mário Buscapé também participou do grupo folclórico Capoeiras do Bonfim, que realizava shows e apresentações no Rio. Mestre Roque, outra das quatro linhagens fundadoras, integrou este grupo folclórico.

Em 2016, Mário publicou suas memórias, "A saga de uma lenda viva," editado por Paulinho Salmon e publicado pela Azougue no Rio de Janeiro.

Na época de uma cerimônia em 2017 homenageando seus 83 anos em São Francisco do Conde, ele foi reconhecido como "o pai da Capoeira em São Francisco do Conde" e o 13º "cordão de ouro" no Brasil—uma das mais altas honrarias na comunidade da capoeira.

Mário Buscapé faleceu em 19 de agosto de 2021, em sua cidade natal, São Francisco do Conde, Bahia. Como um praticante declarou em sua celebração de 2017: "Mestre Mário é a raiz de tudo."',
  -- achievements_en
  'Founder of Grupo Bonfim (January 6, 1953); One of four founding lineages of contemporary capoeira in Rio de Janeiro; 13th "cordão de ouro" in Brazil; Pioneer who brought Bahian capoeira to Rio de Janeiro; Author of "A saga de uma lenda viva" (2016); Recognized as "the father of Capoeira in São Francisco do Conde"',
  -- achievements_pt
  'Fundador do Grupo Bonfim (6 de janeiro de 1953); Uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro; 13º "cordão de ouro" no Brasil; Pioneiro que trouxe a capoeira baiana para o Rio de Janeiro; Autor de "A saga de uma lenda viva" (2016); Reconhecido como "o pai da Capoeira em São Francisco do Conde"',
  -- Researcher notes (English)
  E'BIRTH DATE: July 17, 1934 (exact), per São Francisco do Conde municipal records and capoeirahistory.com.

DEATH DATE: August 19, 2021 (exact), per capoeirahistory.com.

MOVE TO RIO: Sources give conflicting dates. Capoeirahistory.com says "early 1950s"; capoeiraliberdade.net.br says 1951 (age 17) but also mentions 1957. The Bonfim group was founded January 6, 1953, so Mário must have arrived before that date.

LINEAGE: The lineage tree from capoeiraliberdade.net.br shows: Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo. This places Mário''s father José Bidel and uncle Dendê as direct links to the Besouro era.

FAMILY CONNECTIONS: Note distinction between Mário Buscapé (son of José Bidel, from São Francisco do Conde) and Marco Buscapé (son of Zé Bedeu, cousin to Mestre Roque). These are DIFFERENT people from different families.

STYLE: Left as NULL because he learned traditional Bahian capoeira before the strict Angola/Regional division was formalized in Rio. His training came from the Recôncavo tradition associated with Besouro''s companions.

MILITARY SERVICE: The São Francisco do Conde municipal website mentions he enlisted in the Brazilian Army at age 21 (1955), which would have been AFTER founding Bonfim (1953). This timeline discrepancy may indicate return trips between Rio and Bahia, or the military service occurred during a different period.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 17 de julho de 1934 (exata), segundo registros municipais de São Francisco do Conde e capoeirahistory.com.

DATA DE MORTE: 19 de agosto de 2021 (exata), segundo capoeirahistory.com.

MUDANÇA PARA O RIO: Fontes dão datas conflitantes. Capoeirahistory.com diz "início dos anos 1950"; capoeiraliberdade.net.br diz 1951 (aos 17 anos) mas também menciona 1957. O grupo Bonfim foi fundado em 6 de janeiro de 1953, então Mário deve ter chegado antes dessa data.

LINHAGEM: A árvore genealógica de capoeiraliberdade.net.br mostra: Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo. Isso coloca o pai de Mário, José Bidel, e o tio Dendê como elos diretos com a era de Besouro.

CONEXÕES FAMILIARES: Note a distinção entre Mário Buscapé (filho de José Bidel, de São Francisco do Conde) e Marco Buscapé (filho de Zé Bedeu, primo de Mestre Roque). São pessoas DIFERENTES de famílias diferentes.

ESTILO: Deixado como NULL porque ele aprendeu capoeira tradicional baiana antes da divisão estrita Angola/Regional ser formalizada no Rio. Seu treinamento veio da tradição do Recôncavo associada aos companheiros de Besouro.

SERVIÇO MILITAR: O site da prefeitura de São Francisco do Conde menciona que ele se alistou no Exército Brasileiro aos 21 anos (1955), o que seria DEPOIS de fundar o Bonfim (1953). Esta discrepância na linha do tempo pode indicar viagens de ida e volta entre Rio e Bahia, ou o serviço militar ocorreu em um período diferente.'
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

-- Source: entities/persons/marrom.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Marrom
-- Generated: 2025-12-15
-- Primary Source: https://capoeirahistory.com/master-marrom/
-- ============================================================
-- DEPENDENCIES: None (primary teacher entities need import)
-- ============================================================
--
-- NOTE: There are TWO different Mestres Marrom in Brazil:
-- 1) THIS FILE: Henrique Anastácio de Jesus (Rio de Janeiro) - Ngoma Capoeira Angola
-- 2) OTHER: Son of Mestre Baixinho, São Paulo - Grupo Irmãos Guerreiros (founded 1983)
--
-- This file is for the RIO DE JANEIRO Mestre Marrom only.
--
-- BIRTH DATE: September 6, 1963 - confirmed by asso-oya.com and CapoeiraHub
--
-- TRAINING HISTORY:
-- - Childhood: First introduction to capoeira in Itabuna
-- - 1976: Moved to Rio de Janeiro (~age 13)
-- - Rio: Trained with Mestre Canela (Engenho Novo)
-- - Rio: Trained with Mestre Peixinho da Senzala (earned red rope - Regional)
-- - 1990s: Transitioned to capoeira Angola research
-- - Angola influences: M. Nô, M. Angolinha, M. Gato Preto, M. Bigodinho,
--   M. Boca Rica, M. Felipe, M. Brandão, M. João Grande
--
-- GROUP EVOLUTION:
-- - 1990: Founded "Marrom Capoeira & Alunos"
-- - 1998: First European branch (Paris) via student Guará
-- - 2018: Renamed to "Ngoma Capoeira Angola" (political statement)
--
-- CULTURAL CONTRIBUTIONS:
-- - 3+ CDs with old mestres (Gato Preto, Bigodinho, Boca Rica, Felipe)
-- - Children's Capoeira Encounters (e.g., 5th in Nov 2000 with 400 children)
-- - Co-precursor of "Vadiando Entre Amigos" movement
-- - Friday roda at Copa Leme (historic meeting point)
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Henrique Anastácio de Jesus',
  'Marrom',
  'Rio de Janeiro',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/master-marrom/', 'https://www.lalaue.com/learn-capoeira/mestre-marrom/', 'https://www.capoeirahub.net/mestres?lang=en']::text[],
  'angola'::genealogy.style,
  E'Mestre Marrom began his capoeira training in Regional style, earning a red rope from Mestre Peixinho of Grupo Senzala. In the 1990s, he turned to capoeira Angola, researching its roots and traditions by studying with the "old guard" of Bahian mestres—Gato Preto, Bigodinho, Boca Rica, Felipe, Brandão, and João Grande. His teaching philosophy emphasizes embodiment over instruction; he corrects students "for doing a movement with the wrong feeling." His school employs African-centered pedagogical approaches.',
  E'Mestre Marrom começou seu treinamento de capoeira no estilo Regional, ganhando corda vermelha de Mestre Peixinho do Grupo Senzala. Nos anos 1990, voltou-se para a capoeira Angola, pesquisando suas raízes e tradições estudando com a "velha guarda" de mestres baianos—Gato Preto, Bigodinho, Boca Rica, Felipe, Brandão e João Grande. Sua filosofia de ensino enfatiza a incorporação sobre a instrução; ele corrige alunos "por fazer um movimento com o sentimento errado." Sua escola emprega abordagens pedagógicas centradas na África.',
  1963,
  'exact'::genealogy.date_precision,
  'Itabuna, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Henrique Anastácio de Jesus was born on September 6, 1963, in Itabuna, Bahia, where he received his first introduction to capoeira as a child. In 1976, at around age thirteen, he moved to Rio de Janeiro and settled in Engenho Novo, a neighborhood in the north zone of the city.\n\nIn Rio, young Henrique began serious capoeira training with Mestre Canela in Engenho Novo. He then trained with Mestre Peixinho, one of the founding masters of Grupo Senzala, and earned a red rope—a high grade in the Regional system. During this period, he was part of the Senzala school at Travessa Angrense in Rio.\n\nIn the 1990s, like several other former Regional practitioners, Marrom became increasingly interested in capoeira Angola. This transformation was inspired by encounters with distinct angoleiro players from Bahia and by Mestre Nô, who pointed him toward the traditional path. The study of roots and traditions became his chief goal.\n\nMarrom began extensive research work, paying homage to the old capoeira masters across Brazil. He developed relationships with the "old guard" of capoeira Angola: Mestres Gato Preto, Bigodinho, Boca Rica, Felipe from Santo Amaro, Brandão, and João Grande. This collaboration resulted in three CDs recorded together, preserving their voices and music for future generations.\n\nIn 1990, Mestre Marrom and his students formalized their research work by naming the group "Marrom Capoeira & Alunos" (Marrom Capoeira and Students)—a name that recognizes the importance of everyone in the practice, as capoeira is fundamentally a group activity.\n\nMarrom established his school at the foot of the Babilônia favela in the Leme neighborhood of Rio''s South Zone, where he gives classes twice daily throughout the week. The space contains historical photographs of old mestres, African imagery, drums, berimbaus, and other cultural artifacts. Capoeiristas from around the world visit year-round to study with him.\n\nOn Friday evenings, the traditional roda at Copa Leme became a meeting place for dozens of mestres and capoeiristas. Alongside Mestres Formiga and Camaleão, Marrom became one of the precursors of the "Vadiando Entre Amigos" (Playing Among Friends) movement—described as one of the most beautiful movements in capoeira Angola.\n\nIn 1998, his student Mestre Guará founded the first European sister school in Paris, initially called "Marrom Capoeira e Alunos, Paris," which later developed into the École de Capoeira Angola de Paris (ECAP). This marked the beginning of Ngoma''s international expansion.\n\nIn November 2000, Marrom organized the 5th Children''s Capoeira Encounter at Copaleme in Rio de Janeiro, bringing together four hundred children between ages 2 and 12. Legendary Mestre Gato Preto from Bahia visited the event. A newspaper article from Jornal do Brasil (November 27, 2000) noted Marrom had been practicing capoeira for 20 years at that point. His philosophy: "Occupying the mind with capoeira, they stay far from drugs."\n\nSince the 1990s, Marrom and his students formed an important part of Rio''s growing capoeira Angola community, alongside other notable rodas led by Mestres Russo, Camaleão, Formiga, and Angolinha. Many of his students are now consecrated masters themselves, spreading capoeira Angola throughout Europe and beyond: Guará in France, Ferradura in Rio, Contra-Mestre Carcará in Finland, Contra-Mestre Stéph in Paris.\n\nIn 2018, after a long period of reflection and as a political statement, Mestre Anastácio renamed his school "Ngoma" to reaffirm the Black and African origins of capoeira Angola. Ngoma runs a social project called Casa Ngoma Angola at Morro da Babilônia, offering not just capoeira but tutoring classes, meals, and community support—particularly during the COVID-19 pandemic with the "Babilônia contra covid" project supported by Fiocruz.\n\nMestre Ferradura, one of his principal students, described him as "a disciple of Mestre João Pequeno de Pastinha." The connection to João Pequeno places Marrom within the direct lineage of Mestre Pastinha, the patriarch of capoeira Angola.\n\nToday, Ngoma Capoeira Angola has representatives in Paris, Berlin, Scotland, and other locations worldwide, continuing to spread the traditions of capoeira Angola. Mestre Marrom, now in his early sixties, continues teaching at his school in Leme, receiving capoeiristas from around the world and preserving the traditions he spent decades researching.',
  E'Henrique Anastácio de Jesus nasceu em 6 de setembro de 1963, em Itabuna, Bahia, onde recebeu sua primeira introdução à capoeira quando criança. Em 1976, com cerca de treze anos, mudou-se para o Rio de Janeiro e estabeleceu-se no Engenho Novo, um bairro da zona norte da cidade.\n\nNo Rio, o jovem Henrique começou o treinamento sério de capoeira com Mestre Canela no Engenho Novo. Depois treinou com Mestre Peixinho, um dos mestres fundadores do Grupo Senzala, e ganhou uma corda vermelha—uma graduação alta no sistema Regional. Durante este período, fez parte da escola Senzala na Travessa Angrense no Rio.\n\nNos anos 1990, como vários outros ex-praticantes de Regional, Marrom tornou-se cada vez mais interessado em capoeira Angola. Esta transformação foi inspirada por encontros com distintos angoleiros da Bahia e por Mestre Nô, que o indicou o caminho tradicional. O estudo das raízes e tradições tornou-se seu objetivo principal.\n\nMarrom iniciou um extenso trabalho de pesquisa, homenageando os velhos mestres de capoeira por todo o Brasil. Desenvolveu relações com a "velha guarda" da capoeira Angola: Mestres Gato Preto, Bigodinho, Boca Rica, Felipe de Santo Amaro, Brandão e João Grande. Esta colaboração resultou em três CDs gravados juntos, preservando suas vozes e música para as gerações futuras.\n\nEm 1990, Mestre Marrom e seus alunos formalizaram seu trabalho de pesquisa nomeando o grupo "Marrom Capoeira & Alunos"—um nome que reconhece a importância de todos na prática, pois a capoeira é fundamentalmente uma atividade de grupo.\n\nMarrom estabeleceu sua escola aos pés da favela da Babilônia no bairro do Leme, na Zona Sul do Rio, onde dá aulas duas vezes ao dia durante toda a semana. O espaço contém fotografias históricas de velhos mestres, imagens africanas, tambores, berimbaus e outros artefatos culturais. Capoeiristas de todo o mundo visitam durante todo o ano para estudar com ele.\n\nNas noites de sexta-feira, a roda tradicional no Copa Leme tornou-se ponto de encontro de dezenas de mestres e capoeiristas. Ao lado dos Mestres Formiga e Camaleão, Marrom tornou-se um dos precursores do movimento "Vadiando Entre Amigos"—descrito como um dos mais belos movimentos da capoeira Angola.\n\nEm 1998, seu aluno Mestre Guará fundou a primeira escola-irmã europeia em Paris, inicialmente chamada "Marrom Capoeira e Alunos, Paris," que depois se desenvolveu na École de Capoeira Angola de Paris (ECAP). Isto marcou o início da expansão internacional do Ngoma.\n\nEm novembro de 2000, Marrom organizou o 5º Encontro de Capoeira Infantil no Copaleme no Rio de Janeiro, reunindo quatrocentas crianças entre 2 e 12 anos. O lendário Mestre Gato Preto da Bahia visitou o evento. Uma matéria do Jornal do Brasil (27 de novembro de 2000) notou que Marrom praticava capoeira há 20 anos naquele ponto. Sua filosofia: "Ocupando a mente com capoeira, eles ficam longe das drogas."\n\nDesde os anos 1990, Marrom e seus alunos formaram uma parte importante da crescente comunidade de capoeira Angola do Rio, ao lado de outras rodas notáveis lideradas pelos Mestres Russo, Camaleão, Formiga e Angolinha. Muitos de seus alunos são agora mestres consagrados, espalhando a capoeira Angola pela Europa e além: Guará na França, Ferradura no Rio, Contra-Mestre Carcará na Finlândia, Contra-Mestre Stéph em Paris.\n\nEm 2018, após um longo período de reflexão e como declaração política, Mestre Anastácio renomeou sua escola para "Ngoma" para reafirmar as origens Negras e Africanas da capoeira Angola. Ngoma administra um projeto social chamado Casa Ngoma Angola no Morro da Babilônia, oferecendo não apenas capoeira mas aulas de reforço, refeições e apoio comunitário—particularmente durante a pandemia de COVID-19 com o projeto "Babilônia contra covid" apoiado pela Fiocruz.\n\nMestre Ferradura, um de seus principais alunos, o descreveu como "um discípulo de Mestre João Pequeno de Pastinha." A conexão com João Pequeno coloca Marrom dentro da linhagem direta de Mestre Pastinha, o patriarca da capoeira Angola.\n\nHoje, Ngoma Capoeira Angola tem representantes em Paris, Berlim, Escócia e outros locais no mundo, continuando a espalhar as tradições da capoeira Angola. Mestre Marrom, agora no início de seus sessenta anos, continua ensinando em sua escola no Leme, recebendo capoeiristas de todo o mundo e preservando as tradições que passou décadas pesquisando.',
  E'Founder of Ngoma Capoeira Angola (formerly Marrom Capoeira & Alunos, 1990)\nRecorded 3+ CDs with old guard mestres (Gato Preto, Bigodinho, Boca Rica, Felipe)\n2001 CD recording with Mestres Gato Preto, Garça, Dorado\nCo-precursor of "Vadiando Entre Amigos" movement\nEstablished international capoeira Angola presence in Europe (Paris 1998)\nOrganizer of Children''s Capoeira Encounters (400+ children)\nFounder of Casa Ngoma Angola social project at Morro da Babilônia\nOver 30 years dedicated to teaching and preserving capoeira Angola traditions\nMentored numerous students who became mestres across Europe and Americas',
  E'Fundador do Ngoma Capoeira Angola (anteriormente Marrom Capoeira & Alunos, 1990)\nGravou 3+ CDs com mestres da velha guarda (Gato Preto, Bigodinho, Boca Rica, Felipe)\nGravação de CD de 2001 com Mestres Gato Preto, Garça, Dorado\nCo-precursor do movimento "Vadiando Entre Amigos"\nEstabeleceu presença internacional de capoeira Angola na Europa (Paris 1998)\nOrganizador de Encontros de Capoeira Infantil (400+ crianças)\nFundador do projeto social Casa Ngoma Angola no Morro da Babilônia\nMais de 30 anos dedicados ao ensino e preservação das tradições da capoeira Angola\nOrientou numerosos alunos que se tornaram mestres na Europa e Américas',
  E'NOTE: There are TWO different Mestres Marrom in Brazil:\n1) THIS PROFILE: Henrique Anastácio de Jesus (Rio de Janeiro) - Ngoma Capoeira Angola\n2) OTHER: Son of Mestre Baixinho, São Paulo - Grupo Irmãos Guerreiros (founded 1983)\n\nUsing apelido_context ''Rio de Janeiro'' for disambiguation.\n\nTRAINING HISTORY:\n- Childhood: First introduction to capoeira in Itabuna, Bahia\n- 1976: Moved to Rio de Janeiro (~age 13)\n- Rio: Trained with Mestre Canela (Engenho Novo) - first formal teacher\n- Rio: Trained with Mestre Peixinho da Senzala (earned red rope - Regional)\n- 1990s: Transitioned to capoeira Angola\n- Angola influences: M. Nô (inspiration), M. Angolinha (Rio reference), M. Gato Preto, M. Bigodinho, M. Boca Rica, M. Felipe, M. Brandão, M. João Grande\n\nLINEAGE CLAIM: Mestre Ferradura describes Marrom as "a disciple of Mestre João Pequeno de Pastinha" - placing him in direct Pastinha lineage.\n\nGROUP EVOLUTION:\n- 1990: Founded "Marrom Capoeira & Alunos"\n- 1998: First European branch (Paris) via student Guará\n- 2018: Renamed to "Ngoma Capoeira Angola" (political statement affirming African/Black origins)\n\nSTUDENTS (partial list):\n- Mestre Ferradura (Omri Ferradura Breda) - started 1991, graduated mestre 2010\n- Mestre Guará (Guaracy Paulino da Conceição) - France, founded Paris branch 1998\n- Contra-Mestre Chorão - Salvador/USA, founded Grupo Capoeira Angola do Acupe 1994\n- Contra-Mestre Carcará - Finland (Helsinki)\n- Contra-Mestre Stéph - Paris (Association Oyà, 2018)\n- Contra-Mestra Tatiana - Rio de Janeiro, co-founder of Ngoma\n- Garça, Dorado, Forro, Fábio Chapéu de Coro\n\nCULTURAL CONTRIBUTIONS:\n- 3+ CDs with old mestres preserving their music\n- 2001 CD with Mestres Gato Preto, Garça, Dorado (per velhosmestres.com)\n- Children''s Capoeira Encounters (5th in Nov 2000: 400 children, visited by Gato Preto)\n- Co-precursor of "Vadiando Entre Amigos" movement with Mestres Formiga and Camaleão\n- Friday roda at Copa Leme (historic meeting point for Rio angoleiros)\n\nSOCIAL PROJECTS:\n- Casa Ngoma Angola at Morro da Babilônia\n- "Babilônia contra covid" project (2020) - supported by Fiocruz\n- Tutoring, meals, psychosocial support for community\n\nLOCATIONS:\n- School at foot of Favela Babilônia, Leme, Rio de Janeiro\n- Previously: Ladeira Ary Barroso do Copaleme\n- International: Paris, Berlin, Scotland, Helsinki',
  E'NOTA: Existem DOIS Mestres Marrom diferentes no Brasil:\n1) ESTE PERFIL: Henrique Anastácio de Jesus (Rio de Janeiro) - Ngoma Capoeira Angola\n2) OUTRO: Filho de Mestre Baixinho, São Paulo - Grupo Irmãos Guerreiros (fundado 1983)\n\nUsando apelido_context ''Rio de Janeiro'' para desambiguação.\n\nHISTÓRICO DE TREINAMENTO:\n- Infância: Primeira introdução à capoeira em Itabuna, Bahia\n- 1976: Mudou-se para o Rio de Janeiro (~13 anos)\n- Rio: Treinou com Mestre Canela (Engenho Novo) - primeiro professor formal\n- Rio: Treinou com Mestre Peixinho da Senzala (ganhou corda vermelha - Regional)\n- Anos 1990: Transição para capoeira Angola\n- Influências Angola: M. Nô (inspiração), M. Angolinha (referência Rio), M. Gato Preto, M. Bigodinho, M. Boca Rica, M. Felipe, M. Brandão, M. João Grande\n\nAFIRMAÇÃO DE LINHAGEM: Mestre Ferradura descreve Marrom como "um discípulo de Mestre João Pequeno de Pastinha" - colocando-o na linhagem direta de Pastinha.\n\nEVOLUÇÃO DO GRUPO:\n- 1990: Fundou "Marrom Capoeira & Alunos"\n- 1998: Primeira filial europeia (Paris) via aluno Guará\n- 2018: Renomeado para "Ngoma Capoeira Angola" (declaração política afirmando origens Africanas/Negras)\n\nALUNOS (lista parcial):\n- Mestre Ferradura (Omri Ferradura Breda) - começou 1991, graduado mestre 2010\n- Mestre Guará (Guaracy Paulino da Conceição) - França, fundou filial Paris 1998\n- Contra-Mestre Chorão - Salvador/EUA, fundou Grupo Capoeira Angola do Acupe 1994\n- Contra-Mestre Carcará - Finlândia (Helsinque)\n- Contra-Mestre Stéph - Paris (Association Oyà, 2018)\n- Contra-Mestra Tatiana - Rio de Janeiro, co-fundadora do Ngoma\n- Garça, Dorado, Forro, Fábio Chapéu de Coro\n\nCONTRIBUIÇÕES CULTURAIS:\n- 3+ CDs com velhos mestres preservando sua música\n- CD 2001 com Mestres Gato Preto, Garça, Dorado (per velhosmestres.com)\n- Encontros de Capoeira Infantil (5º em nov 2000: 400 crianças, visitado por Gato Preto)\n- Co-precursor do movimento "Vadiando Entre Amigos" com Mestres Formiga e Camaleão\n- Roda de sexta-feira no Copa Leme (ponto de encontro histórico para angoleiros do Rio)\n\nPROJETOS SOCIAIS:\n- Casa Ngoma Angola no Morro da Babilônia\n- Projeto "Babilônia contra covid" (2020) - apoiado pela Fiocruz\n- Reforço escolar, refeições, apoio psicossocial para comunidade\n\nLOCALIZAÇÕES:\n- Escola ao pé da Favela Babilônia, Leme, Rio de Janeiro\n- Anteriormente: Ladeira Ary Barroso do Copaleme\n- Internacional: Paris, Berlim, Escócia, Helsinque'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/moraes.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Moraes
-- Generated: 2025-12-15
-- ============================================================
-- Central figure in the 1980s Capoeira Angola revival. Founded
-- GCAP (Grupo de Capoeira Angola Pelourinho) in 1980. Persuaded
-- João Grande to return from retirement. Grammy-nominated musician.
-- PhD in Culture and Society from UFBA. Codified the musical
-- structure of Capoeira Angola bateria.
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
  'Pedro Moraes Trindade',
  'Moraes',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Pedro_Moraes_Trindade', 'https://www.lalaue.com/learn-capoeira/mestre-moraes/', 'https://capoeira.online/history/mestres/mestre-moraes/', 'https://www.capoeirahub.net/mestres/649edb5948085400142322ee-mestre-moraes']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Advocate for the philosophical and African roots of Capoeira Angola, distancing from commercial and martial-arts aspects. Codified the Angolan musical style and defined its basic instrumental ensemble (bateria). Requires GCAP members to be versed in all aspects of capoeira angola music. Believes the source of capoeira is the n''golo (zebra dance), a ritual combat performed by young warriors in southwestern Angola. Philosophy emphasizes the roda as a symbolic representation of the world, with movements representing life''s adversities.',
  E'Defensor das raízes filosóficas e africanas da Capoeira Angola, distanciando-se dos aspectos comerciais e marciais. Codificou o estilo musical angolano e definiu seu conjunto instrumental básico (bateria). Exige que os membros do GCAP dominem todos os aspectos da música de capoeira angola. Acredita que a origem da capoeira é o n''golo (dança da zebra), um combate ritual realizado por jovens guerreiros no sudoeste de Angola. Sua filosofia enfatiza a roda como uma representação simbólica do mundo, com os movimentos representando as adversidades da vida.',
  -- Life dates
  1950,
  'exact'::genealogy.date_precision,
  'Ilha de Maré, Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Pedro Moraes Trindade was born on February 9, 1950, on Ilha de Maré, an island in the Bay of All Saints near Salvador, Bahia. His father was a capoeirista who introduced him to the art at the age of seven.

Around 1958, at approximately eight years old, Moraes began training at Mestre Pastinha''s academy, the Centro Esportivo de Capoeira Angola (CECA) in the Pelourinho neighborhood of Salvador. By this time, Pastinha was already going blind and no longer taught classes directly. The academy was run by his students Mestre João Grande and Mestre João Pequeno. Moraes considers João Grande his true teacher, deeply impressed by the way João Grande played capoeira.

In 1970, Moraes joined the Brazilian Marines and was transferred to Rio de Janeiro. There, he established the first school to teach Capoeira Angola outside of Bahia. By 1974, he was already instructing in the northern suburb of Belfort Roxo. His Rio students included those who would become renowned mestres themselves: Mestre Braga, Mestre Neco, and Mestre José Carlos (Zé Carlos).

On December 16, 1978, at Parque Lage in Rio de Janeiro, Moraes promoted Braga, Neco, and Zé Carlos to the rank of Mestre, and Marco Aurélio to Contra-Mestre. These were the first mestres of Capoeira Angola formed outside of Bahia.

On October 5, 1980, at an artisan fair in Cosme Velho in the south zone of Rio de Janeiro, the Grupo de Capoeira Angola Pelourinho (GCAP) was formally founded with a demonstration of capoeira and maculelê. The founding idea came from Mestre Neco, with the goal of opposing the Brazilian military government''s suppression of African culture. The group''s logo—a berimbau and two zebras fighting, referencing capoeira''s African origins—was designed by Mestre Braga. The founding mestres were Moraes, Braga, Neco, and Zé Carlos, with Contra-Mestres Marco Aurélio and Peçanha (later known as Cobra Mansa).

In 1982, Moraes returned to Salvador, bringing his top student Cobra Mansa with him. Their return revitalized the Salvador capoeira community at a time when Capoeira Angola was in severe decline—overshadowed by the more popular Capoeira Regional. Moraes left the three young Rio mestres with full autonomy to continue his teaching, promoting Marco Aurélio to mestre before departing.

In the mid-1980s, Moraes and Cobra Mansa accomplished something remarkable: they convinced Mestre João Grande to return to teaching Capoeira Angola. João Grande had withdrawn from capoeira after Pastinha''s death in 1981, working at a gas station. Their persuasion brought one of the most important living links to Pastinha back into active teaching—ultimately leading to João Grande''s move to New York City in 1990.

GCAP became one of the most recognized Capoeira Angola organizations in the world. The group established strong connections with Black consciousness movements in Salvador, particularly Ilê Aiyê and Olodum. GCAP advocated for the inclusion of African and Afro-Brazilian traditions in the practice of capoeira angola, fighting against the commercialization and martial-arts-ification of the art.

Moraes codified the musical structure of Capoeira Angola, defining its basic instrumental ensemble (bateria) and requiring GCAP members to master all aspects of the music. He authored six compositions, including ladainhas and corridos.

Parallel to his capoeira work, Moraes pursued extensive formal education. He obtained a degree in Vernacular Letters with English from Universidade Católica do Salvador in 1991. He earned a Master''s degree in Social History from the Federal University of Bahia (UFBA), and completed a Doctorate in the Multidisciplinary Program in Culture and Society, also at UFBA. For many years, he worked as a teacher of English and Portuguese at public schools in Bahia.

In 2004, his album "Brincando na Roda" (Playing in the Roda), recorded with GCAP and released by Smithsonian Folkways Recordings, received a Grammy Award nomination in the Best Traditional World Music Album category. This was the first and only capoeira recording to be nominated for a Grammy.

Moraes is a strong advocate for "capoeira without prejudice," speaking against discriminatory practices within capoeira, including the use of pejorative nicknames that he argues perpetuate slavery''s legacy. He has presented at TEDx Pelourinho on bullying and prejudice in capoeira.

Today, GCAP maintains its headquarters in Salvador with schools in Ceará, Rio Grande do Sul, São Paulo, and Japan. Mestre Moraes continues to direct GCAP as a cultural outreach project, having trained over twenty students who became mestres themselves, including Cobra Mansa, Janja, Paulinha, Poloca, Valmir, and Jurandir—many of whom went on to found their own organizations spreading Capoeira Angola worldwide.',
  -- Extended content (bio_pt)
  E'Pedro Moraes Trindade nasceu em 9 de fevereiro de 1950, na Ilha de Maré, uma ilha na Baía de Todos os Santos próxima a Salvador, Bahia. Seu pai era capoeirista e o introduziu à arte aos sete anos de idade.

Por volta de 1958, com aproximadamente oito anos, Moraes começou a treinar na academia de Mestre Pastinha, o Centro Esportivo de Capoeira Angola (CECA), no bairro do Pelourinho em Salvador. Nessa época, Pastinha já estava ficando cego e não dava mais aulas diretamente. A academia era dirigida por seus alunos Mestre João Grande e Mestre João Pequeno. Moraes considera João Grande seu verdadeiro mestre, profundamente impressionado pela forma como João Grande jogava capoeira.

Em 1970, Moraes ingressou na Marinha do Brasil e foi transferido para o Rio de Janeiro. Lá, estabeleceu a primeira escola a ensinar Capoeira Angola fora da Bahia. Em 1974, já estava dando aulas no subúrbio norte de Belfort Roxo. Entre seus alunos cariocas estavam aqueles que se tornariam mestres renomados: Mestre Braga, Mestre Neco e Mestre José Carlos (Zé Carlos).

Em 16 de dezembro de 1978, no Parque Lage no Rio de Janeiro, Moraes promoveu Braga, Neco e Zé Carlos ao grau de Mestre, e Marco Aurélio a Contra-Mestre. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia.

Em 5 de outubro de 1980, em uma feira de artesanato em Cosme Velho, na zona sul do Rio de Janeiro, o Grupo de Capoeira Angola Pelourinho (GCAP) foi formalmente fundado com uma demonstração de capoeira e maculelê. A ideia de fundação veio de Mestre Neco, com o objetivo de se opor à perseguição da cultura africana pelo governo militar brasileiro. O logotipo do grupo—um berimbau e duas zebras lutando, referenciando as origens africanas da capoeira—foi desenhado por Mestre Braga. Os mestres fundadores foram Moraes, Braga, Neco e Zé Carlos, com os Contra-Mestres Marco Aurélio e Peçanha (mais tarde conhecido como Cobra Mansa).

Em 1982, Moraes retornou a Salvador, trazendo seu melhor aluno Cobra Mansa. O retorno deles revitalizou a comunidade de capoeira de Salvador em um momento em que a Capoeira Angola estava em severo declínio—ofuscada pela mais popular Capoeira Regional. Moraes deixou os três jovens mestres cariocas com total autonomia para continuar seus ensinamentos, promovendo Marco Aurélio a mestre antes de partir.

Em meados da década de 1980, Moraes e Cobra Mansa realizaram algo notável: convenceram Mestre João Grande a voltar a ensinar Capoeira Angola. João Grande havia se afastado da capoeira após a morte de Pastinha em 1981, trabalhando em um posto de gasolina. A persuasão deles trouxe de volta ao ensino ativo um dos mais importantes elos vivos com Pastinha—levando finalmente à mudança de João Grande para Nova York em 1990.

O GCAP tornou-se uma das organizações de Capoeira Angola mais reconhecidas do mundo. O grupo estabeleceu fortes conexões com movimentos de consciência negra em Salvador, particularmente Ilê Aiyê e Olodum. O GCAP advogou pela inclusão de tradições africanas e afro-brasileiras na prática da capoeira angola, lutando contra a comercialização e a marcialização da arte.

Moraes codificou a estrutura musical da Capoeira Angola, definindo seu conjunto instrumental básico (bateria) e exigindo que os membros do GCAP dominassem todos os aspectos da música. Ele compôs seis músicas, incluindo ladainhas e corridos.

Paralelamente ao seu trabalho com capoeira, Moraes buscou extensa educação formal. Obteve graduação em Letras Vernáculas com Inglês pela Universidade Católica do Salvador em 1991. Conquistou o título de Mestre em História Social pela Universidade Federal da Bahia (UFBA), e completou o Doutorado no Programa Multidisciplinar em Cultura e Sociedade, também na UFBA. Por muitos anos, trabalhou como professor de Inglês e Português em escolas públicas da Bahia.

Em 2004, seu álbum "Brincando na Roda", gravado com o GCAP e lançado pela Smithsonian Folkways Recordings, recebeu uma indicação ao Grammy Award na categoria Melhor Álbum de Música Tradicional do Mundo. Esta foi a primeira e única gravação de capoeira a ser indicada ao Grammy.

Moraes é um forte defensor da "capoeira sem preconceito," falando contra práticas discriminatórias dentro da capoeira, incluindo o uso de apelidos pejorativos que ele argumenta perpetuam o legado da escravidão. Apresentou-se no TEDx Pelourinho sobre bullying e preconceito na capoeira.

Hoje, o GCAP mantém sua sede em Salvador com escolas no Ceará, Rio Grande do Sul, São Paulo e Japão. Mestre Moraes continua dirigindo o GCAP como um projeto de extensão cultural, tendo formado mais de vinte alunos que se tornaram mestres, incluindo Cobra Mansa, Janja, Paulinha, Poloca, Valmir e Jurandir—muitos dos quais fundaram suas próprias organizações espalhando a Capoeira Angola pelo mundo.',
  -- Achievements
  E'- Founded Grupo de Capoeira Angola Pelourinho (GCAP) on October 5, 1980 - one of the world''s most recognized Capoeira Angola organizations
- Grammy Award nomination (2004) for "Brincando na Roda" - first and only capoeira recording nominated for a Grammy
- PhD in Culture and Society from Federal University of Bahia (UFBA)
- Master''s degree in Social History from UFBA
- Degree in Vernacular Letters with English from Universidade Católica do Salvador (1991)
- Codified the musical structure of Capoeira Angola bateria
- Formed the first mestres of Capoeira Angola outside of Bahia (1978)
- Persuaded Mestre João Grande to return from retirement (mid-1980s)
- Central figure in the 1980s Capoeira Angola revival
- Trained 20+ students who became mestres (Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir, etc.)
- GCAP schools in Salvador, Ceará, Rio Grande do Sul, São Paulo, and Japan
- TEDx Pelourinho speaker on prejudice in capoeira',
  E'- Fundou o Grupo de Capoeira Angola Pelourinho (GCAP) em 5 de outubro de 1980 - uma das organizações de Capoeira Angola mais reconhecidas do mundo
- Indicação ao Grammy Award (2004) por "Brincando na Roda" - primeira e única gravação de capoeira indicada ao Grammy
- Doutorado em Cultura e Sociedade pela Universidade Federal da Bahia (UFBA)
- Mestrado em História Social pela UFBA
- Graduação em Letras Vernáculas com Inglês pela Universidade Católica do Salvador (1991)
- Codificou a estrutura musical da bateria de Capoeira Angola
- Formou os primeiros mestres de Capoeira Angola fora da Bahia (1978)
- Convenceu Mestre João Grande a sair da aposentadoria (meados dos anos 1980)
- Figura central no renascimento da Capoeira Angola nos anos 1980
- Formou mais de 20 alunos que se tornaram mestres (Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir, etc.)
- Escolas do GCAP em Salvador, Ceará, Rio Grande do Sul, São Paulo e Japão
- Palestrante no TEDx Pelourinho sobre preconceito na capoeira',
  -- Researcher notes (notes_en)
  E'BIRTH DATE: February 9, 1950 is consistently reported across sources (Wikipedia, Lalaue, CapoeiraHub, Nossa-Tribo). One source (Raridades da Capoeira) mentions 1959 as an alternative, but this appears to be an error - using 1950 as primary date.

BIRTH PLACE: Ilha de Maré, an island in the Bay of All Saints near Salvador, confirmed across all sources.

NAME VARIATIONS: Also reported as "Pedro Martinez Trindade" in some sources - using "Pedro Moraes Trindade" as most common.

TRAINING TIMELINE: Sources consistently state he began training around age 7-8, which would be ~1957-1958. Trained at Pastinha''s academy where João Grande and João Pequeno were the primary instructors (Pastinha was blind by this time).

GCAP FOUNDING: October 5, 1980 at Cosme Velho artisan fair is the documented founding date. The idea came from Mestre Neco. Logo designed by Mestre Braga.

MESTRE TITLE: Unclear when Moraes himself received the mestre title. He was already teaching by 1974 in Rio and formed other mestres in 1978, suggesting he was recognized as mestre by then.

RIO PERIOD: 1970-1982 (12 years). Joined Marines 1970, returned to Salvador 1982.

GRAMMY: "Brincando na Roda" was nominated in 2004 for Best Traditional World Music Album. Some sources incorrectly cite 1984.

STUDENTS: Over 22 documented students who became mestres per CapoeiraHub, including Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir, and others.

PENDING RELATIONSHIPS (objects not yet in dataset):
- Moraes founded GCAP (group not yet imported)
- Moraes trained Cobra Mansa, Braga, Neco, Zé Carlos, Marco Aurélio, Janja, Paulinha, Poloca, Valmir, Jurandir (persons not yet imported)',
  E'DATA DE NASCIMENTO: 9 de fevereiro de 1950 é relatado consistentemente em todas as fontes (Wikipedia, Lalaue, CapoeiraHub, Nossa-Tribo). Uma fonte (Raridades da Capoeira) menciona 1959 como alternativa, mas isso parece ser um erro - usando 1950 como data principal.

LOCAL DE NASCIMENTO: Ilha de Maré, uma ilha na Baía de Todos os Santos perto de Salvador, confirmado em todas as fontes.

VARIAÇÕES DE NOME: Também relatado como "Pedro Martinez Trindade" em algumas fontes - usando "Pedro Moraes Trindade" como mais comum.

CRONOLOGIA DE TREINO: Fontes consistentemente afirmam que começou a treinar por volta dos 7-8 anos, o que seria ~1957-1958. Treinou na academia de Pastinha onde João Grande e João Pequeno eram os instrutores principais (Pastinha já estava cego nessa época).

FUNDAÇÃO DO GCAP: 5 de outubro de 1980 na feira de artesanato de Cosme Velho é a data de fundação documentada. A ideia veio de Mestre Neco. Logotipo desenhado por Mestre Braga.

TÍTULO DE MESTRE: Não está claro quando o próprio Moraes recebeu o título de mestre. Já estava ensinando em 1974 no Rio e formou outros mestres em 1978, sugerindo que já era reconhecido como mestre nessa época.

PERÍODO NO RIO: 1970-1982 (12 anos). Entrou na Marinha em 1970, retornou a Salvador em 1982.

GRAMMY: "Brincando na Roda" foi indicado em 2004 para Melhor Álbum de Música Tradicional do Mundo. Algumas fontes incorretamente citam 1984.

ALUNOS: Mais de 22 alunos documentados que se tornaram mestres por CapoeiraHub, incluindo Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir e outros.

RELACIONAMENTOS PENDENTES (objetos ainda não no dataset):
- Moraes fundou GCAP (grupo ainda não importado)
- Moraes treinou Cobra Mansa, Braga, Neco, Zé Carlos, Marco Aurélio, Janja, Paulinha, Poloca, Valmir, Jurandir (pessoas ainda não importadas)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/moreno.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Moreno (Cobrinha Verde student)
-- Generated: 2025-12-15
-- ============================================================
-- CRITICAL CONTEXT ON NICKNAME:
-- "Moreno" (brown-skinned, dark-haired) is an EXTREMELY common
-- nickname in Brazil, especially in capoeira where apelidos were
-- often based on physical appearance. There were likely MULTIPLE
-- people called "Moreno" in Salvador's capoeira scene.
--
-- This profile represents the specific "Moreno" documented as a
-- student of Mestre Cobrinha Verde in Portuguese Wikipedia and
-- capoeira.online sources.
--
-- IMPORTANT: The "Moreno" mentioned in Gato Preto's 1999 interview
-- as part of the Itapuã bateria may or may NOT be the same person.
-- We cannot confirm this connection - it could be:
-- - The same person (plausible given overlapping circles)
-- - A different Moreno entirely
-- - A transcription error from verbal interview
--
-- Other documented "Morenos" in Salvador capoeira:
-- - Albertino da Hora (nicknamed "Moreno") - Pastinha student, 1963-1964 photos
-- - Gaguinho Moreno - listed separately among Pastinha's students
--
-- Full name unknown. No birth/death dates documented.
-- Using apelido_context 'Cobrinha Verde student' to disambiguate.
--
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- Moreno was listed as a training companion of João Pequeno (born 1917)
-- and João Grande (born 1933) under Mestre Cobrinha Verde. A "Moreno"
-- also played bateria at Itapuã rodas in the 1950s-1960s alongside
-- João Pequeno. If the same person, he would have been an established
-- musician (25-40 years old) during this period, placing birth around
-- 1915-1935. Using 1925 as midpoint estimate between João Pequeno's
-- and João Grande's birth years.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown
  'Moreno',
  'Cobrinha Verde student', -- Disambiguates from other Morenos
  NULL, -- No title documented
  NULL, -- No portrait available
  NULL, -- No stable public links
  'angola'::genealogy.style,
  E'Trained under Mestre Cobrinha Verde in the traditional Angola style of Santo Amaro and Salvador. A "Moreno" is also documented playing in the bateria at Itapuã rodas (1950s-1960s) - possibly the same person, but uncertain given how common the nickname was.',
  E'Treinou com Mestre Cobrinha Verde no estilo Angola tradicional de Santo Amaro e Salvador. Um "Moreno" também está documentado tocando na bateria nas rodas de Itapuã (décadas de 1950-1960) - possivelmente a mesma pessoa, mas incerto dado quão comum era o apelido.',
  1925, -- Estimated: midpoint between training companions João Pequeno (1917) and João Grande (1933)
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown, likely Salvador area
  NULL, -- Death year unknown
  NULL,
  NULL,
  E'Moreno was a student of Mestre Cobrinha Verde, the legendary cousin of Besouro Mangangá. He is listed alongside João Grande, João Pequeno, Gigante, and Eulampio as one of Cobrinha Verde''s students in Portuguese Wikipedia and capoeira.online sources.\n\nBeyond this basic identification as a Cobrinha Verde student, virtually nothing is documented about Moreno''s life. His full name, birth and death dates, and whether he achieved any formal title all remain unknown.\n\nNote: "Moreno" (brown-skinned, dark-haired) was an extremely common nickname in Brazilian capoeira, often given based on physical appearance. There were almost certainly multiple people called "Moreno" in Salvador''s capoeira scene during this era.',
  E'Moreno foi aluno de Mestre Cobrinha Verde, o lendário primo de Besouro Mangangá. Ele é listado junto com João Grande, João Pequeno, Gigante e Eulampio como um dos alunos de Cobrinha Verde na Wikipédia em português e nas fontes do capoeira.online.\n\nAlém desta identificação básica como aluno de Cobrinha Verde, praticamente nada está documentado sobre a vida de Moreno. Seu nome completo, datas de nascimento e morte, e se ele alcançou algum título formal, tudo permanece desconhecido.\n\nNota: "Moreno" (de pele morena, cabelo escuro) era um apelido extremamente comum na capoeira brasileira, frequentemente dado com base na aparência física. Quase certamente havia múltiplas pessoas chamadas "Moreno" na cena da capoeira de Salvador durante essa época.',
  NULL, -- No specific achievements documented
  NULL,
  E'SOURCES: Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Gigante, and Eulampio in Portuguese Wikipedia (Mestre Cobrinha Verde) and capoeira.online.\n\nIMPORTANT - NICKNAME AMBIGUITY: "Moreno" was an extremely common nickname in Brazilian capoeira, given to anyone with darker skin or hair. There were almost certainly multiple "Morenos" in Salvador''s capoeira scene. A "Moreno" also appears in Gato Preto''s 1999 interview as part of the Itapuã bateria, but we CANNOT confirm this is the same person - could be coincidence, different person, or transcription error from verbal interview.\n\nOther documented "Morenos" in Salvador capoeira:\n- Albertino da Hora (nicknamed "Moreno") - Pastinha''s CECA, documented in 1963-1964 photos\n- Gaguinho Moreno - listed separately among Pastinha''s students\n\nNo full name, birth/death dates, or title documented for this Cobrinha Verde student.',
  E'FONTES: Listado como aluno de Cobrinha Verde junto com João Grande, João Pequeno, Gigante e Eulampio na Wikipédia em português (Mestre Cobrinha Verde) e capoeira.online.\n\nIMPORTANTE - AMBIGUIDADE DO APELIDO: "Moreno" era um apelido extremamente comum na capoeira brasileira, dado a qualquer pessoa com pele ou cabelo mais escuro. Quase certamente havia múltiplos "Morenos" na cena da capoeira de Salvador. Um "Moreno" também aparece na entrevista de Gato Preto de 1999 como parte da bateria de Itapuã, mas NÃO PODEMOS confirmar que seja a mesma pessoa - pode ser coincidência, pessoa diferente, ou erro de transcrição de entrevista verbal.\n\nOutros "Morenos" documentados na capoeira de Salvador:\n- Albertino da Hora (apelidado "Moreno") - CECA de Pastinha, documentado em fotos de 1963-1964\n- Gaguinho Moreno - listado separadamente entre os alunos de Pastinha\n\nSem nome completo, datas de nascimento/morte ou título documentados para este aluno de Cobrinha Verde.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/mucunge.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Mucungê
-- Generated: 2025-12-16
-- Primary Sources: velhosmestres.com, capoeirahistory.com
-- ============================================================
-- DEPENDENCIES: waldemar.sql (trained at Barracão do Waldemar with bateria)
-- ============================================================
--
-- FULL NAME: Unknown
-- His apelido "Mucungê" likely derives from the town Mucugê in the Chapada
-- Diamantina region of Bahia, suggesting either origin there or connection to it.
--
-- BIRTH YEAR ESTIMATION:
-- No birth year documented. Based on:
-- 1. Active in bateria at Waldemar's Barracão in the 1950s
-- 2. Co-founded Filhos de Angola in 1960 (would need to be at least 25+)
-- 3. Still active in 1997 events (documented photos)
-- 4. Died March 8, 1998 from respiratory failure
-- Estimating birth around 1920s-1930s. Using 1930 with decade precision.
--
-- DEATH DATE:
-- According to death certificate (cited in "A Roda da Central" academic article):
-- Died March 8, 1998 of respiratory failure while residing in Queimados, RJ.
--
-- ORIGIN:
-- Bahian migrant to Rio de Janeiro. Participated in Mestre Waldemar's
-- bateria in Salvador alongside Bugalho, Zacarias, and Ananias before
-- migrating to Rio in the 1950s.
--
-- KNOWN FOR:
-- - Exceptional berimbau skills - described as "legendary"
-- - Taught berimbau to Mestre Roque
-- - Participated in Mestre Paraná's 1963 LP recording
-- - Co-founded Grupo Filhos de Angola (Rio, July 21, 1960)
-- - Key figure at Roda da Central (Carnival street roda, 1950s-1983)
-- - "Bamba" (tough guy) remembered by old masters in documentary testimony
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Mucungê',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-51', 'https://capoeirahistory.com/m-parana/', 'https://capoeirahistory.com/central-station-roda/']::text[],
  'angola'::genealogy.style,
  E'Mucungê was renowned primarily as a berimbau virtuoso rather than for his game in the roda. His exceptional skill on the instrument made him a sought-after musician for recordings and performances. He represented the traditional Angola style brought from Bahia to Rio de Janeiro.',
  E'Mucungê era conhecido principalmente como um virtuose do berimbau, mais do que pelo seu jogo na roda. Sua habilidade excepcional no instrumento o tornava um músico requisitado para gravações e apresentações. Ele representava o estilo tradicional da Angola trazido da Bahia para o Rio de Janeiro.',
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1998,
  'exact'::genealogy.date_precision,
  'Queimados, Rio de Janeiro, Brazil',
  E'Mucungê was a Bahian angoleiro who migrated to Rio de Janeiro in the 1950s, becoming one of the key figures in establishing capoeira angola in the city. His apelido likely derives from the town of Mucugê in the Chapada Diamantina region of Bahia.\n\nIn Salvador, before migrating to Rio, Mucungê was part of the inner circle at Mestre Waldemar''s legendary Barracão in the Liberdade neighborhood. There he worked in the bateria alongside Bugalho, Zacarias Boa Morte, and Mestre Ananias—the rhythmic foundation that powered the weekly rodas that attracted academics, artists, and journalists throughout the 1950s.\n\nMucungê became legendary for his mastery of the berimbau. Mestre Roque, one of the four founding lineage figures of contemporary capoeira in Rio, asserts that he learned to play berimbau from Mucungê after arriving in Rio. Multiple sources describe Mucungê as "well-known for his skills as a berimbau player" rather than for his game, suggesting he was primarily valued as a musician.\n\nOn July 21, 1960, Mucungê co-founded Grupo Filhos de Angola in Rio de Janeiro together with Roque, Onça Preta, Dois de Ouro, Baleado, and Imagem do Cão. This group of Bahian angoleiros created a cultural movement that pioneered capoeira teaching in Rio''s favelas, particularly in the Zona Sul.\n\nIn 1963, Mestre Paraná invited Mucungê to participate in recording his landmark album "Capoeira: Mestre Paraná," released on CBS Masterworks. According to André Luiz Lacé Lopes, Mucungê was one of two Bahian capoeiristas invited alongside Santo Amaro (though Mestre Gegê recalled the second musician as Onça Preta).\n\nMucungê was one of the "bambas"—the tough guys—who defined the legendary Roda da Central, the spontaneous capoeira circle that formed during Carnival between the samba parade route on Avenida Presidente Vargas and Central Station. This roda ran continuously for four days and nights until 1983. Mestre Roque remembered: "Na Central? Era Inglês, Mucungê, Onça Preta, Baleado, Vavá Moleque, Reginaldo, quem mais? É... Seu Menezes, Lamartine, Paraná..."\n\nThroughout the 1980s and 1990s, Mucungê remained active in Rio''s capoeira community. In 1984, he participated in Mestre Camisa''s event at Circo Voador alongside mestres João Pequeno and Zacarias Boa Morte. In 1987, he attended a gathering of elderly mestres from Bahia in Rio. Photographs from 1997 show him at events in Morro da Babilônia (Leme) with Mestres Dorado and Garça, and at Mestre Poraquê''s event playing berimbau with Mestres Mendonça and Leopoldina.\n\nMucungê died on March 8, 1998, from respiratory failure while residing in Queimados, Rio de Janeiro. His death certificate, cited in the academic article "A Roda da Central," confirms these details. The documentary film "Roda da Central" preserves the oral testimony of masters who remembered Mucungê as one of the key protagonists of that undocumented annual street tradition.\n\nMucungê is referenced in traditional capoeira songs, including a ladainha honoring Mestre Bimba that mentions "Ensinando a Mucungê" (teaching Mucungê), indicating his recognition within the broader capoeira community.',
  E'Mucungê foi um angoleiro baiano que migrou para o Rio de Janeiro nos anos 1950, tornando-se uma das figuras-chave no estabelecimento da capoeira angola na cidade. Seu apelido provavelmente deriva da cidade de Mucugê, na região da Chapada Diamantina na Bahia.\n\nEm Salvador, antes de migrar para o Rio, Mucungê fazia parte do círculo íntimo no lendário Barracão de Mestre Waldemar no bairro da Liberdade. Lá ele trabalhava na bateria ao lado de Bugalho, Zacarias Boa Morte e Mestre Ananias—a base rítmica que impulsionava as rodas semanais que atraíam acadêmicos, artistas e jornalistas durante os anos 1950.\n\nMucungê tornou-se lendário por sua maestria no berimbau. Mestre Roque, uma das quatro linhagens fundadoras da capoeira contemporânea no Rio, afirma que aprendeu a tocar berimbau com Mucungê após chegar ao Rio. Múltiplas fontes descrevem Mucungê como "conhecido por suas habilidades como tocador de berimbau" mais do que pelo seu jogo, sugerindo que ele era valorizado principalmente como músico.\n\nEm 21 de julho de 1960, Mucungê co-fundou o Grupo Filhos de Angola no Rio de Janeiro junto com Roque, Onça Preta, Dois de Ouro, Baleado e Imagem do Cão. Este grupo de angoleiros baianos criou um movimento cultural que foi pioneiro no ensino de capoeira nas favelas do Rio, particularmente na Zona Sul.\n\nEm 1963, Mestre Paraná convidou Mucungê para participar da gravação de seu álbum marcante "Capoeira: Mestre Paraná," lançado pela CBS Masterworks. Segundo André Luiz Lacé Lopes, Mucungê foi um dos dois capoeiristas baianos convidados ao lado de Santo Amaro (embora Mestre Gegê lembrasse do segundo músico como Onça Preta).\n\nMucungê foi um dos "bambas"—os valentões—que definiram a lendária Roda da Central, a roda de capoeira espontânea que se formava durante o Carnaval entre o percurso do desfile de samba na Avenida Presidente Vargas e a Estação Central. Esta roda funcionava continuamente por quatro dias e noites até 1983. Mestre Roque lembrava: "Na Central? Era Inglês, Mucungê, Onça Preta, Baleado, Vavá Moleque, Reginaldo, quem mais? É... Seu Menezes, Lamartine, Paraná..."\n\nAo longo das décadas de 1980 e 1990, Mucungê permaneceu ativo na comunidade de capoeira do Rio. Em 1984, participou do evento de Mestre Camisa no Circo Voador ao lado dos mestres João Pequeno e Zacarias Boa Morte. Em 1987, participou de um encontro de mestres idosos da Bahia no Rio. Fotografias de 1997 o mostram em eventos no Morro da Babilônia (Leme) com os Mestres Dorado e Garça, e no evento de Mestre Poraquê tocando berimbau com os Mestres Mendonça e Leopoldina.\n\nMucungê faleceu em 8 de março de 1998, por insuficiência respiratória, enquanto residia em Queimados, Rio de Janeiro. Sua certidão de óbito, citada no artigo acadêmico "A Roda da Central," confirma esses detalhes. O documentário "Roda da Central" preserva o testemunho oral de mestres que lembravam Mucungê como um dos protagonistas principais daquela tradição de rua anual não documentada.\n\nMucungê é referenciado em canções tradicionais de capoeira, incluindo uma ladainha em homenagem a Mestre Bimba que menciona "Ensinando a Mucungê" (ensinando a Mucungê), indicando seu reconhecimento dentro da comunidade mais ampla de capoeira.',
  E'Co-founder of Grupo Filhos de Angola (Rio de Janeiro, July 21, 1960)\nRenowned berimbau virtuoso - taught berimbau to Mestre Roque\nParticipated in Mestre Paraná''s 1963 CBS album recording\nMember of bateria at Mestre Waldemar''s Barracão in Salvador\nKey protagonist of Roda da Central (Carnival street roda, 1950s-1983)\nParticipated in Circo Voador event with João Pequeno and Zacarias (1984)\nReferenced in traditional ladainha honoring Mestre Bimba\nTestimony preserved in "Roda da Central" documentary',
  E'Co-fundador do Grupo Filhos de Angola (Rio de Janeiro, 21 de julho de 1960)\nRenomado virtuose do berimbau - ensinou berimbau a Mestre Roque\nParticipou da gravação do álbum CBS de Mestre Paraná em 1963\nMembro da bateria no Barracão de Mestre Waldemar em Salvador\nProtagonista principal da Roda da Central (roda de rua do Carnaval, anos 1950-1983)\nParticipou do evento no Circo Voador com João Pequeno e Zacarias (1984)\nReferenciado em ladainha tradicional em homenagem a Mestre Bimba\nTestemunho preservado no documentário "Roda da Central"',
  E'BIRTH YEAR ESTIMATION:\nNo birth year documented. Estimated ~1930 (decade precision) based on:\n- Active in Waldemar''s bateria in Salvador 1950s\n- Co-founded Filhos de Angola 1960 (would need to be adult)\n- Still photographed at events in 1997\n- Died March 8, 1998\n\nDEATH DATE:\nDeath certificate cited in academic article "A Roda da Central: a capoeira de rua carioca, décadas de 1950 a 1970" (Revista EntreRios):\n- Date: March 8, 1998\n- Cause: Respiratory failure\n- Residence at death: Queimados, RJ\n\nNAME/APELIDO ORIGIN:\nApelido likely derives from Mucugê, a town in Chapada Diamantina, Bahia. Full name unknown.\n\nPARANÁ LP RECORDING (1963):\nConflicting accounts of second musician:\n- André Luiz Lacé Lopes says: Mucungê and Santo Amaro\n- Mestre Gegê says: Mucungê and Onça Preta\nMucungê''s participation confirmed by both sources.\n\nKEY LOCATIONS:\n- Salvador: Waldemar''s Barracão (bateria member, 1950s)\n- Rio: Roda da Central (Carnival, until 1983)\n- Rio: Morro da Babilônia, Leme (1997 visit)\n- Queimados, RJ (final residence)\n\nCONTEMPORARIES (Rio):\n- Roque, Onça Preta, Dois de Ouro, Baleado, Imagem do Cão (Filhos de Angola co-founders)\n- Paraná, Inglês, Vavá Moleque, Reginaldo, Seu Menezes, Lamartine (Roda da Central)\n- João Pequeno, Zacarias Boa Morte (1984 Circo Voador)\n- Leopoldina, Mendonça, Poraquê (1997 events)\n- Dorado, Garça, Guará (Morro da Babilônia 1997)\n\nCONTEMPORARIES (Salvador):\n- Waldemar da Liberdade (roda leader)\n- Bugalho, Zacarias, Ananias (bateria)\n\nDOCUMENTARY EVIDENCE:\n- Photographs in André Lacé Collection\n- Audio recordings: ladainha (1996, 1:10), corrido (1984, 0:45)\n- "Roda da Central" documentary (oral testimony of 8 old masters)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO:\nNenhum ano de nascimento documentado. Estimado ~1930 (precisão de década) baseado em:\n- Ativo na bateria de Waldemar em Salvador nos anos 1950\n- Co-fundou Filhos de Angola em 1960 (precisaria ser adulto)\n- Ainda fotografado em eventos em 1997\n- Faleceu em 8 de março de 1998\n\nDATA DE FALECIMENTO:\nCertidão de óbito citada no artigo acadêmico "A Roda da Central: a capoeira de rua carioca, décadas de 1950 a 1970" (Revista EntreRios):\n- Data: 8 de março de 1998\n- Causa: Insuficiência respiratória\n- Residência no óbito: Queimados, RJ\n\nORIGEM DO NOME/APELIDO:\nApelido provavelmente deriva de Mucugê, uma cidade na Chapada Diamantina, Bahia. Nome completo desconhecido.\n\nGRAVAÇÃO DO LP DE PARANÁ (1963):\nRelatos conflitantes sobre o segundo músico:\n- André Luiz Lacé Lopes diz: Mucungê e Santo Amaro\n- Mestre Gegê diz: Mucungê e Onça Preta\nParticipação de Mucungê confirmada por ambas as fontes.\n\nLOCAIS PRINCIPAIS:\n- Salvador: Barracão de Waldemar (membro da bateria, anos 1950)\n- Rio: Roda da Central (Carnaval, até 1983)\n- Rio: Morro da Babilônia, Leme (visita em 1997)\n- Queimados, RJ (última residência)\n\nCONTEMPORÂNEOS (Rio):\n- Roque, Onça Preta, Dois de Ouro, Baleado, Imagem do Cão (co-fundadores do Filhos de Angola)\n- Paraná, Inglês, Vavá Moleque, Reginaldo, Seu Menezes, Lamartine (Roda da Central)\n- João Pequeno, Zacarias Boa Morte (Circo Voador 1984)\n- Leopoldina, Mendonça, Poraquê (eventos de 1997)\n- Dorado, Garça, Guará (Morro da Babilônia 1997)\n\nCONTEMPORÂNEOS (Salvador):\n- Waldemar da Liberdade (líder da roda)\n- Bugalho, Zacarias, Ananias (bateria)\n\nEVIDÊNCIA DOCUMENTAL:\n- Fotografias na Coleção André Lacé\n- Gravações de áudio: ladainha (1996, 1:10), corrido (1984, 0:45)\n- Documentário "Roda da Central" (testemunho oral de 8 mestres antigos)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/nestor-capoeira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Nestor Capoeira
-- Generated: 2025-12-15
-- ============================================================
-- Nestor Sezefredo dos Passos Neto (1946-2025), one of the most
-- influential capoeira authors and teachers, pioneer of capoeira
-- in Europe, author of 10+ books translated worldwide.
--
-- BIRTH DATE: September 29, 1946 - Confirmed by multiple sources.
-- DEATH DATE: March 29, 2025 - Confirmed by velhosmestres.com and
-- multiple obituaries.
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
  'Nestor Sezefredo dos Passos Neto',
  'Nestor Capoeira',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirawiki.org/wiki/Nestor_Capoeira',
    'https://capoeirahistory.com/master-nestor-capoeira/'
  ]::text[],
  -- Capoeira-specific
  'contemporanea'::genealogy.style,
  E'Nestor Capoeira developed his game within Grupo Senzala, one of the pioneering groups that created the "Senzala style" - a synthesis of Angola and Regional that became influential throughout Brazil. His teaching philosophy at Escola Nestor Capoeira emphasized freedom: students could choose whether to pursue graduation or wear uniforms. He described his approach as "Capoeira Contemporânea," combining traditional elements with modern pedagogical methods. His academic background in communication informed his analytical approach to capoeira''s philosophy and history.',
  E'Nestor Capoeira desenvolveu seu jogo dentro do Grupo Senzala, um dos grupos pioneiros que criaram o "estilo Senzala" - uma síntese de Angola e Regional que se tornou influente em todo o Brasil. Sua filosofia de ensino na Escola Nestor Capoeira enfatizava a liberdade: os alunos podiam escolher se queriam buscar graduação ou usar uniformes. Ele descreveu sua abordagem como "Capoeira Contemporânea," combinando elementos tradicionais com métodos pedagógicos modernos. Sua formação acadêmica em comunicação informou sua abordagem analítica da filosofia e história da capoeira.',
  -- Life dates
  1946,
  'exact'::genealogy.date_precision,
  'Belo Horizonte, Brazil',
  2025,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Nestor Sezefredo dos Passos Neto was born on September 29, 1946, in Belo Horizonte, Brazil. At nineteen, in 1965, he began learning capoeira from Mestre Leopoldina, the legendary mestre of Rio de Janeiro known for his synthesis of carioca tiririca and Bahian capoeira traditions.

In 1968, Nestor joined Grupo Senzala in Rio de Janeiro, one of the most influential capoeira groups of the era. There he trained under Mestre Preguiça (Walmir Oliveira) and began teaching as a contramestre under the supervision of Mestre Gato (Fernando C. de Albuquerque) at the Federal University of Rio de Janeiro. By 1969, at just twenty-three years old, he had achieved the "corda vermelha" (red cord), the highest rank in Senzala.

In 1971, Nestor became a pioneer of capoeira in Europe, traveling alone at age twenty-five to teach at the London School of Contemporary Dance. This made him likely the first Brazilian mestre to teach capoeira regularly in Europe. He spent three years touring European cities, spreading knowledge of the art across the continent. He continued traveling and teaching internationally between 1971 and 1996.

Beyond teaching, Nestor pursued an academic career. He earned an engineering degree from the Federal University of Rio de Janeiro (UFRJ) in 1969. Later, he obtained a Master''s degree from ECO-UFRJ in 1995, a PhD in Communication and Culture in 2001, and completed post-doctoral work at PUC-São Paulo.

In 1976, Nestor starred in the Brazilian adventure film "Cordão de Ouro," directed by Antônio Carlos da Fontoura. The film featured several notable capoeira mestres, including Mestre Leopoldina who played berimbau and sang, and Mestre Camisa who appeared in black body paint. It was a landmark film for representing capoeira in Brazilian cinema.

In 1990, after over two decades with Grupo Senzala, Nestor left to establish his own school, the Escola Nestor Capoeira. He began teaching at the Planetário da Gávea in Rio de Janeiro in 1992, with daily classes from 7 PM to 10 PM. In 2002, the school moved across the street to the Galpão das Artes Urbanas.

His teaching philosophy was distinctive: students who didn''t want to pursue graduation didn''t need any. Those who didn''t want to wear uniforms didn''t have to. This freedom reflected his broader philosophy about capoeira as a personal journey rather than a hierarchical institution.

Nestor Capoeira authored ten books on capoeira, translated into multiple languages with over 120,000 copies sold worldwide. His works include the "Trilogia do Jogador" (Player''s Trilogy): "Capoeira: Pequeno Manual do Jogador" (1981), "Galo Já Cantou" (1985), and "Capoeira: Os Fundamentos da Malícia" (1992). His English-language works - "The Little Capoeira Book," "Capoeira: Roots of the Dance-Fight-Game," and "A Street-Smart Song: Capoeira Philosophy and Inner Life" - became essential reading for capoeiristas worldwide. He also released music recordings including the LP "Galo Já Cantou" (1985) and the cassette "Os Fundamentos da Malícia" (1992).

Over more than twenty-five years at Escola Nestor Capoeira, he graduated several mestres: his son Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul, and Hugo Amendoim. Contramestres include Eduardo Montanha and Thiago Jamaica.

Nestor''s son, Mestre Jorge Itapuã Beiramar, became a mestre in his own right, a chiropractor and physiotherapist, and creator of the documentary film "Capoeira - Um Passo a Dois" (Capoeira - One Step for Two).

Nestor Capoeira died on March 29, 2025, in Rio de Janeiro, at the age of seventy-nine. He is remembered as a pioneer who brought capoeira to Europe, an intellectual who bridged academic study with practical mastery, and an author whose books introduced countless people worldwide to the art of capoeira.',
  -- Extended content (Portuguese)
  E'Nestor Sezefredo dos Passos Neto nasceu em 29 de setembro de 1946, em Belo Horizonte, Brasil. Aos dezenove anos, em 1965, começou a aprender capoeira com Mestre Leopoldina, o lendário mestre do Rio de Janeiro conhecido por sua síntese das tradições da tiririca carioca e da capoeira baiana.

Em 1968, Nestor entrou no Grupo Senzala no Rio de Janeiro, um dos grupos de capoeira mais influentes da época. Lá treinou com Mestre Preguiça (Walmir Oliveira) e começou a ensinar como contramestre sob a supervisão de Mestre Gato (Fernando C. de Albuquerque) na Universidade Federal do Rio de Janeiro. Em 1969, com apenas vinte e três anos, alcançou a "corda vermelha," o mais alto grau no Senzala.

Em 1971, Nestor tornou-se pioneiro da capoeira na Europa, viajando sozinho aos vinte e cinco anos para ensinar na London School of Contemporary Dance. Isso o tornou provavelmente o primeiro mestre brasileiro a ensinar capoeira regularmente na Europa. Passou três anos em turnê por cidades europeias, espalhando o conhecimento da arte pelo continente. Continuou viajando e ensinando internacionalmente entre 1971 e 1996.

Além de ensinar, Nestor seguiu carreira acadêmica. Formou-se em engenharia pela Universidade Federal do Rio de Janeiro (UFRJ) em 1969. Posteriormente, obteve mestrado pela ECO-UFRJ em 1995, doutorado em Comunicação e Cultura em 2001, e completou pós-doutorado na PUC-São Paulo.

Em 1976, Nestor estrelou o filme brasileiro de aventura "Cordão de Ouro," dirigido por Antônio Carlos da Fontoura. O filme contou com vários mestres de capoeira notáveis, incluindo Mestre Leopoldina que tocou berimbau e cantou, e Mestre Camisa que apareceu pintado de preto. Foi um filme marcante para a representação da capoeira no cinema brasileiro.

Em 1990, após mais de duas décadas no Grupo Senzala, Nestor saiu para estabelecer sua própria escola, a Escola Nestor Capoeira. Começou a ensinar no Planetário da Gávea no Rio de Janeiro em 1992, com aulas diárias das 19h às 22h. Em 2002, a escola mudou-se para o Galpão das Artes Urbanas, do outro lado da rua.

Sua filosofia de ensino era distintiva: alunos que não quisessem buscar graduação não precisavam. Aqueles que não quisessem usar uniforme não tinham obrigação. Essa liberdade refletia sua filosofia mais ampla sobre a capoeira como uma jornada pessoal em vez de uma instituição hierárquica.

Nestor Capoeira escreveu dez livros sobre capoeira, traduzidos para múltiplos idiomas com mais de 120.000 cópias vendidas mundialmente. Suas obras incluem a "Trilogia do Jogador": "Capoeira: Pequeno Manual do Jogador" (1981), "Galo Já Cantou" (1985) e "Capoeira: Os Fundamentos da Malícia" (1992). Suas obras em inglês - "The Little Capoeira Book," "Capoeira: Roots of the Dance-Fight-Game" e "A Street-Smart Song: Capoeira Philosophy and Inner Life" - tornaram-se leitura essencial para capoeiristas do mundo todo. Também lançou gravações musicais incluindo o LP "Galo Já Cantou" (1985) e a fita cassete "Os Fundamentos da Malícia" (1992).

Ao longo de mais de vinte e cinco anos na Escola Nestor Capoeira, graduou vários mestres: seu filho Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul e Hugo Amendoim. Contramestres incluem Eduardo Montanha e Thiago Jamaica.

O filho de Nestor, Mestre Jorge Itapuã Beiramar, tornou-se mestre por mérito próprio, quiropraxista e fisioterapeuta, e criador do documentário "Capoeira - Um Passo a Dois."

Nestor Capoeira faleceu em 29 de março de 2025, no Rio de Janeiro, aos setenta e nove anos. É lembrado como um pioneiro que levou a capoeira para a Europa, um intelectual que fez a ponte entre o estudo acadêmico e a maestria prática, e um autor cujos livros apresentaram inúmeras pessoas ao redor do mundo à arte da capoeira.',
  -- Achievements (English)
  E'- Pioneer of capoeira in Europe (1971), likely the first Brazilian mestre to teach there regularly
- Author of 10 books on capoeira, translated into 8+ languages, with over 120,000 copies sold
- PhD in Communication and Culture (2001), post-doctorate from PUC-São Paulo
- Starred in the film "Cordão de Ouro" (1976)
- Achieved highest rank (corda vermelha) in Grupo Senzala at age 23 (1969)
- Founded Escola Nestor Capoeira (1990), graduating 7 mestres
- Engineering degree from UFRJ (1969)
- Created the "Trilogia do Jogador" (Player''s Trilogy) - foundational capoeira literature
- Released LP "Galo Já Cantou" (1985) and cassette "Os Fundamentos da Malícia" (1992)
- Taught at UFRJ, Planetário da Gávea, and internationally',
  -- Achievements (Portuguese)
  E'- Pioneiro da capoeira na Europa (1971), provavelmente o primeiro mestre brasileiro a ensinar lá regularmente
- Autor de 10 livros sobre capoeira, traduzidos para 8+ idiomas, com mais de 120.000 cópias vendidas
- Doutor em Comunicação e Cultura (2001), pós-doutorado pela PUC-São Paulo
- Estrelou o filme "Cordão de Ouro" (1976)
- Alcançou o mais alto grau (corda vermelha) no Grupo Senzala aos 23 anos (1969)
- Fundou a Escola Nestor Capoeira (1990), graduando 7 mestres
- Engenheiro formado pela UFRJ (1969)
- Criou a "Trilogia do Jogador" - literatura fundamental da capoeira
- Lançou LP "Galo Já Cantou" (1985) e fita cassete "Os Fundamentos da Malícia" (1992)
- Ensinou na UFRJ, Planetário da Gávea e internacionalmente',
  -- Researcher notes (English)
  E'BIRTH DATE: September 29, 1946 - Confirmed by CapoeiraWiki, velhosmestres.com, and multiple sources.

DEATH DATE: March 29, 2025 - Confirmed by velhosmestres.com obituary notice (destaques-78) and tribute articles.

TRAINING TIMELINE:
- 1965: Began training under Mestre Leopoldina in Rio de Janeiro
- 1968: Joined Grupo Senzala; began teaching as contramestre under Mestre Gato at UFRJ
- 1969: Achieved corda vermelha (red cord) - highest rank in Senzala
- 1971-1974: Pioneered capoeira in Europe, starting at London School of Contemporary Dance
- 1976: Starred in film "Cordão de Ouro"
- 1990: Left Grupo Senzala, founded Escola Nestor Capoeira
- 1992: Began teaching at Planetário da Gávea
- 2002: Moved school to Galpão das Artes Urbanas

ACADEMIC CREDENTIALS:
- 1969: Engineering degree, UFRJ
- 1995: Master''s degree, ECO-UFRJ
- 2001: PhD in Communication and Culture, ECO-UFRJ
- Post-doc: PUC-São Paulo

BIBLIOGRAPHY (PRIMARY TITLES):
1. Capoeira: Pequeno Manual do Jogador (1981)
2. Galo Já Cantou (1985 - also LP)
3. Capoeira: Os Fundamentos da Malícia (1992 - also cassette)
4. A Balada de Noivo-da-Vida e Veneno-da-Madrugada (1997 - novel)
5. Capoeira: Roots of the Dance-Fight-Game (2002 - English)
6. A Street-Smart Song: Capoeira Philosophy and Inner Life (2006 - English)
7. The Little Capoeira Book (English version of Pequeno Manual)

FAMILY:
- Son: Jorge Itapuã Beiramar (mestre, filmmaker, physiotherapist)
- Son: Bruno Passos
- Ex-wife: Rosely Fátima Senise Lacreta (1946-2020)

SCHOOL GRADUATES (ENC, 25+ years):
Mestres (red cord): Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul, Hugo Amendoim
Contramestres (brown cord): Eduardo Montanha, Thiago Jamaica

PENDING RELATIONSHIPS (objects not yet in dataset):
- Nestor Capoeira trained_under Preguiça (Walmir Oliveira) at Senzala
- Nestor Capoeira associated_with Gato (Fernando C. de Albuquerque) - supervised his teaching at UFRJ
- Nestor Capoeira member_of Grupo Senzala (1968-1990)
- Nestor Capoeira founded Escola Nestor Capoeira (1990)

DOCUMENTARY INVOLVEMENT:
- 2005: Co-produced "Mestre Leopoldina - A Fina Flor da Malandragem" about his first teacher
- His son Jorge Itapuã Beiramar created "Capoeira - Um Passo a Dois"

DISCOGRAPHY:
- LP "Galo Já Cantou" (1985)
- Cassette "Os Fundamentos da Malícia" (1992)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 29 de setembro de 1946 - Confirmada por CapoeiraWiki, velhosmestres.com e múltiplas fontes.

DATA DE FALECIMENTO: 29 de março de 2025 - Confirmada por nota obituária do velhosmestres.com (destaques-78) e artigos de tributo.

CRONOLOGIA DE TREINAMENTO:
- 1965: Começou a treinar com Mestre Leopoldina no Rio de Janeiro
- 1968: Entrou no Grupo Senzala; começou a ensinar como contramestre sob Mestre Gato na UFRJ
- 1969: Alcançou corda vermelha - mais alto grau no Senzala
- 1971-1974: Pioneiro da capoeira na Europa, começando na London School of Contemporary Dance
- 1976: Estrelou no filme "Cordão de Ouro"
- 1990: Saiu do Grupo Senzala, fundou Escola Nestor Capoeira
- 1992: Começou a ensinar no Planetário da Gávea
- 2002: Mudou escola para Galpão das Artes Urbanas

CREDENCIAIS ACADÊMICAS:
- 1969: Graduação em Engenharia, UFRJ
- 1995: Mestrado, ECO-UFRJ
- 2001: Doutorado em Comunicação e Cultura, ECO-UFRJ
- Pós-doc: PUC-São Paulo

BIBLIOGRAFIA (TÍTULOS PRINCIPAIS):
1. Capoeira: Pequeno Manual do Jogador (1981)
2. Galo Já Cantou (1985 - também LP)
3. Capoeira: Os Fundamentos da Malícia (1992 - também cassete)
4. A Balada de Noivo-da-Vida e Veneno-da-Madrugada (1997 - romance)
5. Capoeira: Roots of the Dance-Fight-Game (2002 - inglês)
6. A Street-Smart Song: Capoeira Philosophy and Inner Life (2006 - inglês)
7. The Little Capoeira Book (versão inglês do Pequeno Manual)

FAMÍLIA:
- Filho: Jorge Itapuã Beiramar (mestre, cineasta, fisioterapeuta)
- Filho: Bruno Passos
- Ex-esposa: Rosely Fátima Senise Lacreta (1946-2020)

GRADUADOS DA ESCOLA (ENC, 25+ anos):
Mestres (corda vermelha): Jorge Itapuã Beiramar, Wagner Lagartixa, Pedro Bruno Chacal, Raphael Logam Bonezinho, Rafael Barba, Henrique Azul, Hugo Amendoim
Contramestres (corda marrom): Eduardo Montanha, Thiago Jamaica

RELACIONAMENTOS PENDENTES (objetos ainda não no dataset):
- Nestor Capoeira trained_under Preguiça (Walmir Oliveira) no Senzala
- Nestor Capoeira associated_with Gato (Fernando C. de Albuquerque) - supervisionou seu ensino na UFRJ
- Nestor Capoeira member_of Grupo Senzala (1968-1990)
- Nestor Capoeira founded Escola Nestor Capoeira (1990)

ENVOLVIMENTO EM DOCUMENTÁRIOS:
- 2005: Co-produziu "Mestre Leopoldina - A Fina Flor da Malandragem" sobre seu primeiro mestre
- Seu filho Jorge Itapuã Beiramar criou "Capoeira - Um Passo a Dois"

DISCOGRAFIA:
- LP "Galo Já Cantou" (1985)
- Cassete "Os Fundamentos da Malícia" (1992)'
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

-- Source: entities/persons/nicolau-do-poco.sql (NEW)
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

According to Valdemar de Oliveira''s 1942 work "Frevo, Capoeira e Passo," young men from good families liked to go with Nicolau do Poço or Nascimento Grande to break up pastoral plays just for the enjoyment of doing so—a testament to his status as a prominent figure in Recife''s nightlife and street culture.

Nicolau was part of the capoeira groups that organized around the rival military bands: the "Partido do 4º" (also called "Banha Cheirosa") supporting the 4th Artillery Battalion band, and the "Partido Espanha" (also called "Cabeças Secas") supporting the National Guard band. These capoeiristas performed ginga and kicks in front of the bands during carnival parades—movements that were eventually transformed into the "passo," the foundational dance of frevo.

The police gradually cracked down on the "moleques de banda de música" and their leaders, including Nicolau do Poço, João de Totó, and Jovino dos Coelhos, until neutralizing the greatest of them all, Nascimento Grande. The suppression of Recife''s capoeira maltas culminated around 1912, coinciding with the formalization of frevo as a distinct musical and dance form.

Of all the valentões of Recife carnival, only Nascimento Grande was considered more fearsome than figures like Nicolau do Poço.',
  E'Nicolau do Poço foi um dos famosos capoeiras cujos nomes estão preservados na história do carnaval do Recife. Estava entre os "moleques de banda de música" e líderes de malta que se apresentavam na frente das bandas de carnaval no final do século XIX e início do século XX em Pernambuco.

De acordo com a obra de Valdemar de Oliveira de 1942 "Frevo, Capoeira e Passo," rapazes de boas famílias gostavam de ir com Nicolau do Poço ou Nascimento Grande para arrebentar pastoris apenas pelo prazer de fazê-lo—um testemunho de seu status como figura proeminente na vida noturna e cultura de rua do Recife.

Nicolau fazia parte dos grupos de capoeira que se organizavam em torno das bandas militares rivais: o "Partido do 4º" (também chamado "Banha Cheirosa") apoiando a banda do 4º Batalhão de Artilharia, e o "Partido Espanha" (também chamado "Cabeças Secas") apoiando a banda da Guarda Nacional. Esses capoeiristas executavam ginga e chutes na frente das bandas durante os desfiles de carnaval—movimentos que eventualmente foram transformados no "passo," a dança fundamental do frevo.

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

NOME: Conhecido apenas pelo apelido "Nicolau do Poço." Nome completo desconhecido.

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

-- Source: entities/persons/olho-de-pombo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Olho de Pombo (Argemiro Grande Olho de Pombo)
-- Generated: 2025-12-15
-- ============================================================
-- IDENTITY NOTE:
-- Historical sources list "Algemiro Grande Olho de Pombo" as a single
-- entry among the 22 founding mestres of Gengibirra. The full descriptor
-- appears to be "Argemiro Grande Olho de Pombo" (Argemiro the Tall/Big,
-- Pigeon Eye), suggesting this is ONE person with a compound nickname.
-- Noronha's manuscripts note him as a longshoreman.
--
-- This file uses "Olho de Pombo" as the primary apelido for
-- discoverability, with full name variations noted.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Olho de Pombo was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Argemiro',
  'Olho de Pombo',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Olho de Pombo (full name: Argemiro Grande Olho de Pombo, meaning "Argemiro the Tall, Pigeon Eye") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nOlho de Pombo worked as a longshoreman (stevedore) on Salvador''s docks - a common occupation among capoeiristas of his era. The origin of the nickname "Olho de Pombo" (Pigeon Eye) has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Olho de Pombo among the founding mestres. Olho de Pombo was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Olho de Pombo have been documented.',
  E'Olho de Pombo (nome completo: Argemiro Grande Olho de Pombo, significando "Argemiro o Alto, Olho de Pombo") foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nOlho de Pombo trabalhava como estivador nos portos de Salvador - uma ocupação comum entre capoeiristas de sua época. A origem do apelido "Olho de Pombo" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Olho de Pombo entre os mestres fundadores. Olho de Pombo esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Olho de Pombo foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Full name documented in Mestre Noronha''s manuscripts as "Algemiro Grande Olho de Pombo", with profession listed as longshoreman. The name appears to be a compound descriptor: "Argemiro" (first name), "Grande" (tall/big), and "Olho de Pombo" (Pigeon Eye). Some sources have listed "Argemiro Grande" and "Olho de Pombo" as separate individuals, but historical evidence from Noronha''s manuscripts indicates this was one person. No death date documented.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Nome completo documentado nos manuscritos de Mestre Noronha como "Algemiro Grande Olho de Pombo", com profissão listada como estivador. O nome parece ser um descritor composto: "Argemiro" (primeiro nome), "Grande" (alto/grande), e "Olho de Pombo" (Olho de Pombo). Algumas fontes listaram "Argemiro Grande" e "Olho de Pombo" como indivíduos separados, mas evidências históricas dos manuscritos de Noronha indicam que era uma pessoa. Nenhuma data de falecimento documentada.'
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

-- Source: entities/persons/paquete-do-cabula.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Paquete do Cabula
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Paquete was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Paquete do Cabula',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Cabula, Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Paquete do Cabula was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador\'s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nHis apelido suggests a connection to the Cabula neighborhood of Salvador. The origin of the nickname "Paquete" has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Paquete do Cabula among the founding mestres. Paquete was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha\'s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Paquete do Cabula have been documented.',
  E'Paquete do Cabula foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nSeu apelido sugere uma conexão com o bairro do Cabula em Salvador. A origem do apelido "Paquete" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Paquete do Cabula entre os mestres fundadores. Paquete esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Paquete do Cabula foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Apelido "Paquete do Cabula" suggests connection to Cabula neighborhood of Salvador. The origin of the nickname "Paquete" has not been documented. No full name or death date documented. Information sourced primarily from Mestre Noronha\'s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Apelido "Paquete do Cabula" sugere conexão com o bairro do Cabula em Salvador. A origem do apelido "Paquete" não foi documentada. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/parana.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Paraná
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH DATE: September 25, 1922 - Confirmed by velhosmestres.com
-- (NOT 1910/1911 as initially suggested in backlog)
--
-- DEATH DATE: March 7, 1972 - Confirmed by multiple sources
-- Location: Rio de Janeiro, at IPASE workplace
-- Cause: Cardiac arrest
-- Burial: Cemitério do Murundu, Realengo
--
-- SIGNIFICANCE: One of four founding lineages of Contemporary
-- Capoeira in Rio de Janeiro (alongside Artur Emídio, Mário
-- Buscapé, and Roque). Renowned berimbau master and craftsman.
-- First to record commercial capoeira LP with CBS (1963).
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
  'Oswaldo Lisboa dos Santos',
  'Paraná',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-parana-1922-1972/',
    'https://velhosmestres.com/br/destaques-14',
    'https://www.lalaue.com/learn-capoeira/mestre-parana/'
  ]::text[],
  -- Capoeira-specific
  NULL::genealogy.style,  -- Style not formally classified; taught before Angola/Regional distinction solidified in Rio
  E'Paraná was renowned primarily as a berimbau master rather than for a particular fighting style. A carpenter by trade, he meticulously handcrafted his berimbaus using coated strings and varnished wood. His 1963 CBS recording demonstrates sophisticated tuning across three berimbaus (viola, médio, gunga) with fixed pitches for instrumental tracks. He played berimbau for Artur Emídio''s rodas and collaborated with Bahian musicians Mucungê and Onça Preta on recordings.',
  E'Paraná era reconhecido principalmente como mestre de berimbau e não por um estilo de luta específico. Carpinteiro de profissão, fabricava meticulosamente seus berimbaus usando cordas revestidas e madeira envernizada. Sua gravação de 1963 pela CBS demonstra afinação sofisticada em três berimbaus (viola, médio, gunga) com alturas fixas para faixas instrumentais. Tocava berimbau nas rodas de Artur Emídio e colaborou com os músicos baianos Mucungê e Onça Preta nas gravações.',
  -- Life dates
  1922,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1972,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Oswaldo Lisboa dos Santos, known as Mestre Paraná, was born on September 25, 1922, in Salvador, Bahia. His parents were Cândido Lisboa dos Santos and Albertina Maria dos Santos. In 1932, at age ten, he began learning capoeira in the Alto das Pombas neighborhood with Mestre Antônio Corró—an ex-slave born in 1870, illiterate, who worked as a cart driver at Cais Dourado in Salvador.

In February 1945, Paraná moved to Rio de Janeiro with his wife Maura Bastos (1920-1989) shortly after leaving the Brazilian Navy, where he had trained in boxing and completed his military service. In June 1945, he was hired by IPASE (Instituto de Pensões e Assistência aos Servidores do Estado) as a specialized craftsman, a position he held until his death.

Paraná lived in the Bonsucesso neighborhood in Rio''s northern zone and began teaching capoeira in his backyard during the 1950s. His wife Maura, known affectionately as "Tia Maura," played a fundamental role in receiving and caring for the many young students who came to train. In 1950, according to Mestre Polaco, he founded the Conjunto Folclórico de Capoeira São Bento Pequeno on Rua Miguel Burnier. The group later evolved into the foundation from which Grupo Muzenza traces its entire formation.

In the capoeira universe, Paraná became known primarily as an excellent berimbau player. A carpenter by profession and training, he carefully manufactured his own berimbaus using coated strings and varnished wood. His meticulous attention to tuning is documented in musicological analysis of his recordings—he maintained fixed pitches across the viola (Db4-Eb4), médio (B3-Db4), and gunga (Ab3-Bb3) for instrumental tracks, unifying to Ab3-Bb3 for vocal tracks to match the song''s key.

The Grupo São Bento Pequeno presented itself at various types of shows, disseminating Afro-Brazilian culture in "Bahian Nights" organized by social clubs and carnival schools, carnival parades, and theatre productions. Most notably, Paraná participated as a berimbau player in the Rio de Janeiro staging of "O Pagador de Promessas" by Dias Gomes in 1962, alongside fellow capoeirista Joel Lourenço.

Paraná collaborated extensively with the pioneering Black dancer Mercedes Baptista, participating in shows and festivals including the IV Festival Folclórico do Distrito Federal in August 1966, where the Teatro Nacional de Brasília was also inaugurated. In 1969, he traveled to Lisbon with Mercedes Batista''s dance group.

His great ability as a musician allowed him to record, in 1963, a single record with four tracks for CBS, called "Capoeira – Mestre Paraná." The EP 45 featured tracks entitled "São Bento Grande," "São Bento Pequeno," "Angola," and "Avise a meu Mano." According to Mestre Gegê, Onça Preta played pandeiro on this recording, and Mestre Mucungê also participated. Musicologist André Luiz Lacé Lopez notes that Paraná invited Bahian musicians Mucungê and Santo Amaro to participate.

Paraná was the first capoeirista to play berimbau at the Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro and reportedly the only capoeira master to hold a Musicians'' Guild card for the berimbau. His musical influence extended to the next generation—Mestre Genaro learned to play berimbau directly from him and later created a song called "Paranaê" incorporating the name of his music teacher.

He frequently directed the percussion section during Artur Emídio''s Sunday rodas, and his Sunday rodas became legendary meeting points. At these gatherings, notable artists including Maria Bethânia, Caetano Veloso, Jards Macalé, Mestres Mintirinha and Genaro, and music producer Nelson Motta appeared.

There is consensus among Rio de Janeiro capoeira historians that four lineages were the main influences in the formation of Contemporary Capoeira in the city: Artur Emídio, Paraná, Mário Buscapé, and Roque. As Mestre Levi stated, these four "started to work in closed spaces of academies, introduced uniforms, organisation, etc. From these four the majority of capoeira masters here in Rio de Janeiro derived."

Mestre Paraná died on March 7, 1972, at age 49, victim of a cardiac arrest at his IPASE workplace where he worked as a carpenter. He was buried in the Cemitério do Murundu in Realengo. His ability and talent playing berimbau is always highlighted by masters who had the opportunity to meet him.',
  -- Extended content (Portuguese)
  E'Oswaldo Lisboa dos Santos, conhecido como Mestre Paraná, nasceu em 25 de setembro de 1922, em Salvador, Bahia. Seus pais eram Cândido Lisboa dos Santos e Albertina Maria dos Santos. Em 1932, aos dez anos, começou a aprender capoeira no bairro do Alto das Pombas com Mestre Antônio Corró—um ex-escravo nascido em 1870, analfabeto, que trabalhava como carroceiro no Cais Dourado em Salvador.

Em fevereiro de 1945, Paraná mudou-se para o Rio de Janeiro com sua esposa Maura Bastos (1920-1989) logo após deixar a Marinha do Brasil, onde havia treinado boxe e completado seu serviço militar. Em junho de 1945, foi admitido no IPASE (Instituto de Pensões e Assistência aos Servidores do Estado) como artífice especializado, cargo que ocupou até sua morte.

Paraná morou no bairro de Bonsucesso, na zona norte do Rio, e começou a ensinar capoeira em seu quintal durante os anos 1950. Sua esposa Maura, conhecida carinhosamente como "Tia Maura," desempenhou papel fundamental no acolhimento e cuidado dos muitos jovens alunos que vinham treinar. Em 1950, segundo Mestre Polaco, fundou o Conjunto Folclórico de Capoeira São Bento Pequeno na Rua Miguel Burnier. O grupo posteriormente evoluiu para a base da qual o Grupo Muzenza traça toda a sua formação.

No universo da capoeira, Paraná ficou conhecido principalmente como excelente tocador de berimbau. Carpinteiro de profissão e formação, fabricava cuidadosamente seus próprios berimbaus usando cordas revestidas e madeira envernizada. Sua atenção meticulosa à afinação está documentada em análises musicológicas de suas gravações—ele mantinha alturas fixas na viola (Ré♭4-Mi♭4), médio (Si3-Ré♭4) e gunga (Lá♭3-Si♭3) para faixas instrumentais, unificando para Lá♭3-Si♭3 nas faixas vocais para combinar com a tonalidade da canção.

O Grupo São Bento Pequeno apresentou-se em vários tipos de shows, disseminando a cultura afro-brasileira em "Noites Baianas" organizadas por clubes sociais e escolas de samba, desfiles de carnaval e produções teatrais. Mais notavelmente, Paraná participou como tocador de berimbau na montagem carioca de "O Pagador de Promessas" de Dias Gomes em 1962, ao lado do capoeirista Joel Lourenço.

Paraná colaborou extensivamente com a pioneira bailarina negra Mercedes Baptista, participando de shows e festivais incluindo o IV Festival Folclórico do Distrito Federal em agosto de 1966, onde o Teatro Nacional de Brasília também foi inaugurado. Em 1969, viajou a Lisboa com o grupo de dança de Mercedes Batista.

Sua grande habilidade como músico permitiu-lhe gravar, em 1963, um disco single com quatro faixas pela CBS, chamado "Capoeira – Mestre Paraná." O EP 45 apresentava as faixas "São Bento Grande," "São Bento Pequeno," "Angola" e "Avise a meu Mano." Segundo Mestre Gegê, Onça Preta tocou pandeiro nesta gravação, e Mestre Mucungê também participou. O musicólogo André Luiz Lacé Lopez nota que Paraná convidou os músicos baianos Mucungê e Santo Amaro para participar.

Paraná foi o primeiro capoeirista a tocar berimbau na Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro e supostamente o único mestre de capoeira a possuir carteira do Sindicato dos Músicos para o berimbau. Sua influência musical estendeu-se à geração seguinte—Mestre Genaro aprendeu a tocar berimbau diretamente com ele e depois criou uma canção chamada "Paranaê" incorporando o nome de seu mestre de música.

Ele frequentemente dirigia a seção de percussão durante as rodas de domingo de Artur Emídio, e suas rodas de domingo tornaram-se lendários pontos de encontro. Nesses encontros, apareciam artistas notáveis incluindo Maria Bethânia, Caetano Veloso, Jards Macalé, Mestres Mintirinha e Genaro, e o produtor musical Nelson Motta.

Há consenso entre os historiadores da capoeira carioca de que quatro linhagens foram as principais influências na formação da Capoeira Contemporânea na cidade: Artur Emídio, Paraná, Mário Buscapé e Roque. Como Mestre Levi afirmou, esses quatro "começaram a trabalhar em espaços fechados de academias, introduziram uniformes, organização, etc. Desses quatro derivou a maioria dos mestres de capoeira aqui no Rio de Janeiro."

Mestre Paraná faleceu em 7 de março de 1972, aos 49 anos, vítima de colapso cardíaco em seu local de trabalho no IPASE, onde trabalhava como carpinteiro. Foi sepultado no Cemitério do Murundu em Realengo. Sua habilidade e talento tocando berimbau é sempre destacado pelos mestres que tiveram a oportunidade de conhecê-lo.',
  -- Achievements (English)
  E'- One of four founding lineages of Contemporary Capoeira in Rio de Janeiro
- Recorded first commercial capoeira EP with CBS (1963): "Capoeira – Mestre Paraná"
- First capoeirista to play berimbau at Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro
- Only capoeira master with Musicians'' Guild card for berimbau
- Founded Conjunto Folclórico de Capoeira São Bento Pequeno (1950)
- Performed in "O Pagador de Promessas" (Rio production, 1962)
- Participated in IV Festival Folclórico do Distrito Federal (1966)
- Collaborated internationally with Mercedes Baptista dance group (Lisbon, 1969)
- Master berimbau craftsman using distinctive varnished wood and coated strings',
  -- Achievements (Portuguese)
  E'- Uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro
- Gravou o primeiro EP comercial de capoeira pela CBS (1963): "Capoeira – Mestre Paraná"
- Primeiro capoeirista a tocar berimbau na Orquestra Sinfônica do Teatro Municipal do Rio de Janeiro
- Único mestre de capoeira com carteira do Sindicato dos Músicos para berimbau
- Fundou o Conjunto Folclórico de Capoeira São Bento Pequeno (1950)
- Atuou em "O Pagador de Promessas" (produção carioca, 1962)
- Participou do IV Festival Folclórico do Distrito Federal (1966)
- Colaborou internacionalmente com o grupo de dança de Mercedes Baptista (Lisboa, 1969)
- Mestre artesão de berimbau usando madeira envernizada e cordas revestidas distintivas',
  -- Researcher notes (English)
  E'BIRTH YEAR DISCREPANCY:
- velhosmestres.com and capoeirahistory.com: September 25, 1922 (exact)
- backlog initially suggested 1910/1911, but this appears incorrect
- Using 1922 based on multiple reliable sources

DEATH DATE: March 7, 1972 - Confirmed by velhosmestres.com and capoeirahistory.com
- Cause: Cardiac arrest at IPASE workplace
- Burial: Cemitério do Murundu, Realengo

FAMILY:
- Parents: Cândido Lisboa dos Santos and Albertina Maria dos Santos
- Wife: Maura Bastos (August 28, 1920 – June 8, 1989)

TEACHER: Antônio Corró
- Born 1870, ex-slave, illiterate, cart driver at Cais Dourado
- Taught at Alto das Pombas, Salvador
- Paraná trained with him from 1932 (age 10)
- Corró is NOT yet in database; needs import

BAHIA PHASE (1922-1945):
- Training location: Alto das Pombas, Salvador
- Teacher: Antônio Corró only documented teacher
- No other documented training companions in Bahia

RIO PHASE (1945-1972):
- Lived: Flamengo, Bonsucesso, Realengo (various periods)
- Work: IPASE (Instituto de Pensões e Assistência aos Servidores do Estado)
- Founded: Grupo São Bento Pequeno (1950)
- Association with: Artur Emídio (played berimbau at his rodas), Onça Preta (musical collaboration), Mucungê (musical collaboration), Joel Lourenço (O Pagador de Promessas), Mercedes Baptista (dance collaborations), Genaro (taught berimbau)

KNOWN STUDENTS:
- Mestre Polaco (José Roberto Rocha) - began 1956, received nickname from Paraná
- Mestre Genaro - learned berimbau from Paraná
- Mestre Mintirinha - mentioned as appearing at his rodas

MUSICAL RECORDING (1963):
- Label: CBS
- Format: EP 45 (single with four tracks)
- Tracks: "São Bento Grande," "São Bento Pequeno," "Angola," "Avise a meu Mano"
- Collaborators: Onça Preta (pandeiro), Mucungê (per Mestre Gegê and musicologist André Luiz Lacé Lopez)
- Alternative collaborator claimed: Santo Amaro (per André Luiz Lacé Lopez)

STYLE NOTE:
- Style is NULL because Paraná was known primarily for berimbau mastery rather than a particular fighting style
- He taught in the transitional period before Angola/Regional distinction fully consolidated in Rio
- His group is described as "folclórico" emphasizing cultural performance

GROUP LINEAGE:
- Grupo Muzenza traces its formation entirely to Paraná''s Grupo São Bento Pequeno

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-parana-1922-1972/
- velhosmestres.com/br/destaques-14
- velhosmestres.com/en/featured-14
- lalaue.com/learn-capoeira/mestre-parana/
- portalcapoeira.com/capoeira/mestres/mestre-parana/
- capoeirahistory.com/m-parana/ (musical legacy analysis)',
  -- Researcher notes (Portuguese)
  E'DISCREPÂNCIA DO ANO DE NASCIMENTO:
- velhosmestres.com e capoeirahistory.com: 25 de setembro de 1922 (exato)
- backlog inicialmente sugeriu 1910/1911, mas isso parece incorreto
- Usando 1922 baseado em múltiplas fontes confiáveis

DATA DE FALECIMENTO: 7 de março de 1972 - Confirmado por velhosmestres.com e capoeirahistory.com
- Causa: Colapso cardíaco no local de trabalho (IPASE)
- Sepultamento: Cemitério do Murundu, Realengo

FAMÍLIA:
- Pais: Cândido Lisboa dos Santos e Albertina Maria dos Santos
- Esposa: Maura Bastos (28 de agosto de 1920 – 8 de junho de 1989)

MESTRE: Antônio Corró
- Nascido em 1870, ex-escravo, analfabeto, carroceiro no Cais Dourado
- Ensinava no Alto das Pombas, Salvador
- Paraná treinou com ele a partir de 1932 (10 anos)
- Corró NÃO está no banco de dados; precisa importar

FASE BAHIA (1922-1945):
- Local de treino: Alto das Pombas, Salvador
- Mestre: Antônio Corró único mestre documentado
- Nenhum outro companheiro de treino documentado na Bahia

FASE RIO (1945-1972):
- Morou: Flamengo, Bonsucesso, Realengo (vários períodos)
- Trabalho: IPASE (Instituto de Pensões e Assistência aos Servidores do Estado)
- Fundou: Grupo São Bento Pequeno (1950)
- Associação com: Artur Emídio (tocava berimbau nas rodas dele), Onça Preta (colaboração musical), Mucungê (colaboração musical), Joel Lourenço (O Pagador de Promessas), Mercedes Baptista (colaborações de dança), Genaro (ensinou berimbau)

ALUNOS CONHECIDOS:
- Mestre Polaco (José Roberto Rocha) - começou em 1956, recebeu apelido de Paraná
- Mestre Genaro - aprendeu berimbau com Paraná
- Mestre Mintirinha - mencionado como frequentador de suas rodas

GRAVAÇÃO MUSICAL (1963):
- Gravadora: CBS
- Formato: EP 45 (single com quatro faixas)
- Faixas: "São Bento Grande," "São Bento Pequeno," "Angola," "Avise a meu Mano"
- Colaboradores: Onça Preta (pandeiro), Mucungê (per Mestre Gegê e musicólogo André Luiz Lacé Lopez)
- Colaborador alternativo alegado: Santo Amaro (per André Luiz Lacé Lopez)

NOTA DE ESTILO:
- Estilo é NULL porque Paraná era conhecido principalmente pela maestria no berimbau e não por um estilo de luta específico
- Ele ensinou no período de transição antes da distinção Angola/Regional se consolidar no Rio
- Seu grupo é descrito como "folclórico" enfatizando a performance cultural

LINHAGEM DE GRUPO:
- Grupo Muzenza traça toda sua formação ao Grupo São Bento Pequeno de Paraná

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-parana-1922-1972/
- velhosmestres.com/br/destaques-14
- velhosmestres.com/en/featured-14
- lalaue.com/learn-capoeira/mestre-parana/
- portalcapoeira.com/capoeira/mestres/mestre-parana/
- capoeirahistory.com/m-parana/ (análise do legado musical)'
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

-- Source: entities/persons/paulo-gomes.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Paulo Gomes
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH DATE: January 25, 1941 - Confirmed by capoeirahistory.com
-- and velhosmestres.com.
--
-- DEATH DATE: September 23, 1998 - Confirmed by velhosmestres.com;
-- capoeirahistory.com lists only year 1998.
--
-- STYLE: Regional - Trained under Mestre Artur Emídio who taught
-- the systematized Bahian method; Paulo Gomes was described as
-- "the only successor of Mestre Bimba in Brazil" and "the hope
-- that regional capoeira will continue to exist."
--
-- LINEAGE: Neném (African) → Paizinho → Artur Emídio → Paulo Gomes
--
-- SIGNIFICANCE: Pioneer of capoeira in Baixada Fluminense and
-- São Paulo; founder of Centro de Capoeira Ilha de Maré (1963)
-- and ABRACAP (1985); credited with creating the batizado ceremony
-- in capoeira; helped establish August 3rd as Capoeirista Day
-- in São Paulo; advisor to Governor Mário Covas; murdered in 1998.
--
-- ALTERNATE APELIDO: "Galo Cego" mentioned in velhosmestres.com
-- but not widely used; keeping primary apelido as "Paulo Gomes"
-- which is how he is known in lineage references.
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
  'Paulo Gomes da Cruz',
  'Paulo Gomes',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/',
    'https://velhosmestres.com/br/destaques-55'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Paulo Gomes was trained in the Regional style by Mestre Artur Emídio, who taught the systematized Bahian method derived from his teacher Paizinho. Paulo Gomes was described as "the only successor of Mestre Bimba in Brazil" and "the hope that regional capoeira will continue to exist" at a time when many practitioners were mixing Regional with Angola. His emphasis was on preserving pure Regional technique.',
  E'Paulo Gomes foi treinado no estilo Regional por Mestre Artur Emídio, que ensinava o método baiano sistematizado derivado de seu mestre Paizinho. Paulo Gomes foi descrito como "o único sucessor de Mestre Bimba no Brasil" e "a esperança de que a capoeira regional continue a existir" em uma época em que muitos praticantes estavam misturando Regional com Angola. Sua ênfase era preservar a técnica Regional pura.',
  -- Life dates
  1941,
  'exact'::genealogy.date_precision,
  'Itabuna, Bahia, Brazil',
  1998,
  'exact'::genealogy.date_precision,
  'São Paulo, Brazil',
  -- Extended content (English)
  E'Paulo Gomes da Cruz was born on January 25, 1941, in Itabuna, southern Bahia—a cocoa-producing region and the birthplace of writer Jorge Amado. Like many Bahians of his generation, he migrated to Rio de Janeiro seeking better opportunities.

In the carioca capital, Paulo Gomes learned capoeira from Mestre Artur Emídio, who was also from Itabuna and ran an academy in Bonsucesso, a suburb north of the city center. At Artur Emídio''s academy, he trained alongside other future mestres: Leopoldina, Celso do Engenho da Rainha, and Djalma Bandeira. It was there that he earned his capoeira name and graduated to the rank of mestre.

His capoeira genealogy traces a distinguished Bahian lineage: "son" of Mestre Artur Emídio (1930-2011), "grandson" of Mestre Paizinho (Teodoro Ramos), and "great-grandson" of Mestre Neném, a capoeirista of African origin.

On June 11, 1963, Paulo Gomes founded the Centro de Capoeira Ilha de Maré—reportedly the first to institutionalize the batizado (baptism ceremony) as a formal graduation ritual in capoeira. In 1967, he established an academy on Rua Augusta 1351 in São Paulo. He recalled that while he had 30 male students there, "in Rio, in three years, I trained more than 30 women."

In the 1960s, Paulo Gomes moved to the Baixada Fluminense, specifically to São João de Meriti in the Coelho da Rocha neighborhood. There he became a foundational figure, training mestres who would establish capoeira across the region. His principal disciples included Mestre Valdir Sales (1942-2019), who founded the Associação de Capoeira Valdir Sales in São João de Meriti, and Mestre Josias da Silva, who established the Associação de Capoeira Josias da Silva in Nova Iguaçu and Duque de Caxias.

The famous Sunday roda at Zé Pedro''s academy in Bonsucesso (1973-1979) featured Paulo Gomes among its regular participants, alongside Artur Emídio, Mintirinha, Khorvo, Luis Malhado, Macaco Preto, Nilson Arerê, and Paulão Muzenza. These gatherings were legendary for their intensity—"his roda only had bambas, tough guys," recalled Mestre Valdir Sales.

In São Paulo, Paulo Gomes became one of the founders of a new capoeira community. In 1985, he created the Associação do Brasil da Capoeira (ABRACAP—Brazilian Capoeira Association). That same year, he helped establish State Law nº 4.649, designating August 3rd as "Dia do Capoeirista" (Capoeirista Day) in São Paulo. He served as an advisor to Governor Mário Covas on capoeira-related matters.

Among his São Paulo students was Mestra Maria Pandeiro (Roberta Maria Neves), who began training with him in 1980 at the Academia Ilha de Maré. She later founded Capoeira Dandara in Bremen, Germany (2002). Another notable student was Jorginho (Jorge Machado Silva), a 12-year-old prodigy of whom Paulo Gomes said: "This kid is the great hope of capoeira regional, he''s too good."

He published a book, *Capoeira: a arte marcial brasileira* (Capoeira: The Brazilian Martial Art), and recorded a CD, *Roda de Capoeira da Ilha de Maré*.

Paulo Gomes met a tragic end on September 23, 1998. He was murdered inside his Ilha de Maré academy, located at Avenida Brigadeiro Luis Antonio 3940 in São Paulo. The attack occurred during evening classes around 9 PM when a bailiff, accompanied by another man, entered and shot him. Two other capoeiristas—Mestre Fernandão (director of ABRACAP and a regular at the Praça da República roda) and Cristhiano—were wounded trying to intervene. Paulo Gomes died at the hospital. The motive was a debt he owed to a car rental company.

His wake was held in the academy hall, filled with homages from fellow masters. He was buried at the São Pedro Cemetery with traditional capoeira songs and berimbau music—a fitting farewell for a mestre who had devoted his life to preserving and spreading capoeira Regional.',
  -- Extended content (Portuguese)
  E'Paulo Gomes da Cruz nasceu em 25 de janeiro de 1941, em Itabuna, sul da Bahia—região produtora de cacau e terra natal do escritor Jorge Amado. Como muitos baianos de sua geração, migrou para o Rio de Janeiro em busca de melhores oportunidades.

Na capital carioca, Paulo Gomes aprendeu capoeira com Mestre Artur Emídio, também de Itabuna, que mantinha uma academia em Bonsucesso, subúrbio ao norte do centro da cidade. Na academia de Artur Emídio, treinou ao lado de outros futuros mestres: Leopoldina, Celso do Engenho da Rainha e Djalma Bandeira. Foi lá que recebeu seu nome de capoeira e se formou mestre.

Sua genealogia capoeirística traça uma linhagem baiana distinta: "filho" de Mestre Artur Emídio (1930-2011), "neto" de Mestre Paizinho (Teodoro Ramos) e "bisneto" de Mestre Neném, um capoeirista de origem africana.

Em 11 de junho de 1963, Paulo Gomes fundou o Centro de Capoeira Ilha de Maré—supostamente o primeiro a institucionalizar o batizado como ritual formal de graduação na capoeira. Em 1967, estabeleceu uma academia na Rua Augusta 1351, em São Paulo. Ele lembrava que, enquanto tinha 30 alunos homens lá, "no Rio, em três anos, formei mais de 30 mulheres."

Nos anos 1960, Paulo Gomes mudou-se para a Baixada Fluminense, especificamente para São João de Meriti, no bairro Coelho da Rocha. Ali tornou-se uma figura fundamental, treinando mestres que estabeleceriam a capoeira por toda a região. Seus principais discípulos incluíam Mestre Valdir Sales (1942-2019), que fundou a Associação de Capoeira Valdir Sales em São João de Meriti, e Mestre Josias da Silva, que estabeleceu a Associação de Capoeira Josias da Silva em Nova Iguaçu e Duque de Caxias.

A famosa roda de domingo na academia de Zé Pedro em Bonsucesso (1973-1979) contava com Paulo Gomes entre seus participantes regulares, ao lado de Artur Emídio, Mintirinha, Khorvo, Luis Malhado, Macaco Preto, Nilson Arerê e Paulão Muzenza. Esses encontros eram lendários por sua intensidade—"a roda dele só tinha bamba, cara duro," recordou Mestre Valdir Sales.

Em São Paulo, Paulo Gomes tornou-se um dos fundadores de uma nova comunidade de capoeira. Em 1985, criou a Associação do Brasil da Capoeira (ABRACAP). Nesse mesmo ano, ajudou a estabelecer a Lei Estadual nº 4.649, designando 3 de agosto como "Dia do Capoeirista" em São Paulo. Serviu como assessor do Governador Mário Covas em assuntos relacionados à capoeira.

Entre seus alunos paulistanos estava Mestra Maria Pandeiro (Roberta Maria Neves), que começou a treinar com ele em 1980 na Academia Ilha de Maré. Ela posteriormente fundou a Capoeira Dandara em Bremen, Alemanha (2002). Outro aluno notável foi Jorginho (Jorge Machado Silva), um prodígio de 12 anos sobre quem Paulo Gomes disse: "Este garoto é a grande esperança da capoeira regional, ele é bom demais."

Publicou um livro, *Capoeira: a arte marcial brasileira*, e gravou um CD, *Roda de Capoeira da Ilha de Maré*.

Paulo Gomes encontrou um fim trágico em 23 de setembro de 1998. Foi assassinado dentro de sua academia Ilha de Maré, localizada na Avenida Brigadeiro Luis Antonio 3940, em São Paulo. O ataque ocorreu durante as aulas noturnas, por volta das 21h, quando um oficial de justiça, acompanhado de outro homem, entrou e atirou nele. Dois outros capoeiristas—Mestre Fernandão (diretor da ABRACAP e frequentador da roda da Praça da República) e Cristhiano—ficaram feridos ao tentar intervir. Paulo Gomes morreu no hospital. O motivo foi uma dívida que ele tinha com uma locadora de carros.

Seu velório foi realizado no salão da academia, repleto de homenagens de mestres companheiros. Foi enterrado no Cemitério São Pedro ao som de cantigas tradicionais de capoeira e música de berimbau—uma despedida apropriada para um mestre que dedicou sua vida a preservar e disseminar a capoeira Regional.',
  -- Achievements (English)
  E'- Founded Centro de Capoeira Ilha de Maré (June 11, 1963), credited with institutionalizing the batizado ceremony
- Established first capoeira baptism ceremony in São Paulo (1967)
- Founded ABRACAP - Associação do Brasil da Capoeira (1985)
- Helped establish State Law nº 4.649 designating August 3rd as "Dia do Capoeirista" in São Paulo
- Advisor to São Paulo Governor Mário Covas on capoeira matters
- Pioneer of capoeira in Baixada Fluminense and São Paulo
- Published *Capoeira: a arte marcial brasileira* (1982)
- Recorded CD *Roda de Capoeira da Ilha de Maré*
- Trained more than 30 women capoeiristas in Rio de Janeiro
- Described as "the only successor of Mestre Bimba in Brazil"',
  -- Achievements (Portuguese)
  E'- Fundou o Centro de Capoeira Ilha de Maré (11 de junho de 1963), creditado por institucionalizar a cerimônia do batizado
- Realizou a primeira cerimônia de batizado de capoeira em São Paulo (1967)
- Fundou a ABRACAP - Associação do Brasil da Capoeira (1985)
- Ajudou a estabelecer a Lei Estadual nº 4.649 designando 3 de agosto como "Dia do Capoeirista" em São Paulo
- Assessor do Governador de São Paulo Mário Covas em assuntos de capoeira
- Pioneiro da capoeira na Baixada Fluminense e São Paulo
- Publicou *Capoeira: a arte marcial brasileira* (1982)
- Gravou CD *Roda de Capoeira da Ilha de Maré*
- Formou mais de 30 mulheres capoeiristas no Rio de Janeiro
- Descrito como "o único sucessor de Mestre Bimba no Brasil"',
  -- Researcher notes (English)
  E'BIRTH DATE: January 25, 1941 - Confirmed by both capoeirahistory.com and velhosmestres.com.

DEATH DATE: September 23, 1998 - Velhosmestres.com provides exact date; capoeirahistory.com lists only "1998." Death occurred inside his academy during evening class.

ALTERNATE APELIDO: Velhosmestres.com mentions "Galo Cego" as an alternate apelido, but this is not widely used in other sources. "Paulo Gomes" is the primary name used in lineage references.

BATIZADO CLAIM: Velhosmestres.com credits Paulo Gomes with creating/institutionalizing the batizado ceremony in capoeira. This is a significant claim that may require further verification, as other sources attribute formal graduation ceremonies to Mestre Bimba. The claim may refer specifically to the formal institutionalization of the ceremony as a graduation ritual rather than its origin.

TRAINING TIMELINE:
- 1962: Began training with Artur Emídio in Rio de Janeiro (per velhosmestres.com)
- 1963: Founded Ilha de Maré (June 11)
- 1960s: Moved to Baixada Fluminense (São João de Meriti)
- 1967: Opened São Paulo academy at Rua Augusta 1351

STUDENTS TO VERIFY:
- Valdir Sales (1942-2019) - exists in sources, confirmed
- Josias da Silva - exists in sources; currently in persons backlog from Cobra Mansa import
- Maria Pandeiro (Roberta Maria Neves) - trained 1980-1985; should add to backlog
- Jorginho (Jorge Machado Silva) - child prodigy; needs backlog entry
- Fernandão - director of ABRACAP; wounded during attack; needs backlog entry

ACADEMY LOCATION DISCREPANCY: Velhosmestres.com gives São Paulo academy location as Rua Augusta 1351 (1967), while capoeirahistory.com lists final location as Avenida Brigadeiro Luis Antonio 3940. These may represent different phases of the academy.

ZÉ PEDRO RODA: Paulo Gomes was a regular participant at the famous Sunday roda at Zé Pedro''s academy in Bonsucesso (1973-1979).

DEATH CIRCUMSTANCES: Shot during evening class by bailiff over car rental debt. Mestre Fernandão and Cristhiano wounded. Wake held at academy with capoeira tributes. Buried at São Pedro Cemetery.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- velhosmestres.com/br/destaques-55
- capoeirahistory.com/the-roda-at-ze-pedros/
- capoeira-dandara.de/en/maria_en.php',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 25 de janeiro de 1941 - Confirmado por capoeirahistory.com e velhosmestres.com.

DATA DE FALECIMENTO: 23 de setembro de 1998 - Velhosmestres.com fornece data exata; capoeirahistory.com lista apenas "1998." A morte ocorreu dentro de sua academia durante aula noturna.

APELIDO ALTERNATIVO: Velhosmestres.com menciona "Galo Cego" como apelido alternativo, mas não é amplamente usado em outras fontes. "Paulo Gomes" é o nome principal usado em referências de linhagem.

ALEGAÇÃO SOBRE BATIZADO: Velhosmestres.com credita Paulo Gomes por criar/institucionalizar a cerimônia de batizado na capoeira. Esta é uma alegação significativa que pode requerer verificação adicional, pois outras fontes atribuem cerimônias formais de graduação a Mestre Bimba. A alegação pode se referir especificamente à institucionalização formal da cerimônia como ritual de graduação, e não à sua origem.

CRONOLOGIA DE TREINAMENTO:
- 1962: Começou a treinar com Artur Emídio no Rio de Janeiro (por velhosmestres.com)
- 1963: Fundou Ilha de Maré (11 de junho)
- Anos 1960: Mudou-se para Baixada Fluminense (São João de Meriti)
- 1967: Abriu academia em São Paulo na Rua Augusta 1351

ALUNOS A VERIFICAR:
- Valdir Sales (1942-2019) - existe nas fontes, confirmado
- Josias da Silva - existe nas fontes; atualmente no backlog de pessoas do import de Cobra Mansa
- Maria Pandeiro (Roberta Maria Neves) - treinou 1980-1985; adicionar ao backlog
- Jorginho (Jorge Machado Silva) - prodígio infantil; precisa entrada no backlog
- Fernandão - diretor da ABRACAP; ferido durante ataque; precisa entrada no backlog

DISCREPÂNCIA DE LOCALIZAÇÃO DA ACADEMIA: Velhosmestres.com dá localização da academia de São Paulo como Rua Augusta 1351 (1967), enquanto capoeirahistory.com lista localização final como Avenida Brigadeiro Luis Antonio 3940. Podem representar fases diferentes da academia.

RODA DE ZÉ PEDRO: Paulo Gomes era participante regular da famosa roda de domingo na academia de Zé Pedro em Bonsucesso (1973-1979).

CIRCUNSTÂNCIAS DA MORTE: Baleado durante aula noturna por oficial de justiça por dívida com locadora de carros. Mestre Fernandão e Cristhiano feridos. Velório realizado na academia com tributos de capoeira. Enterrado no Cemitério São Pedro.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- velhosmestres.com/br/destaques-55
- capoeirahistory.com/the-roda-at-ze-pedros/
- capoeira-dandara.de/en/maria_en.php'
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

-- Source: entities/persons/percilio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Percílio (Percílio Engraxate)
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Percílio was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Percílio',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Percílio, also known as Percílio Engraxate ("Percílio the Shoeshine"), was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nLike many capoeiristas of his era, Percílio worked as a shoeshine boy (engraxate) - a common occupation among Salvador''s urban poor. The nickname "Engraxate" distinguished him from other practitioners, similar to his contemporary Juvenal Engraxate (Juvenal Hermenegildo da Cruz), who shared the same profession.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), remembered Percílio among the "bambas" (skilled fighters) of capoeira''s past. Percílio was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Percílio have been documented.',
  E'Percílio, também conhecido como Percílio Engraxate, foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nComo muitos capoeiristas de sua época, Percílio trabalhava como engraxate - uma ocupação comum entre os pobres urbanos de Salvador. O apelido "Engraxate" o distinguia de outros praticantes, semelhante ao seu contemporâneo Juvenal Engraxate (Juvenal Hermenegildo da Cruz), que compartilhava a mesma profissão.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), lembrou de Percílio entre os "bambas" (lutadores habilidosos) do passado da capoeira. Percílio esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Percílio foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Also known as "Percílio Engraxate" - the nickname indicates his profession as a shoeshine boy. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Também conhecido como "Percílio Engraxate" - o apelido indica sua profissão como engraxate. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/rogerio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Rogério
-- Generated: 2025-12-15
-- ============================================================
-- Pioneer of Capoeira Angola in Europe. Co-founded ACAD (1992)
-- in Kassel, Germany - one of the first Capoeira Angola
-- organizations established in Europe. Titled mestre by both
-- Moraes (GCAP) and Cobra Mansa (FICA) in 1989.
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
  'Rogério Soares Peixoto',
  'Rogério',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://casadobrada.wordpress.com/mestre-rogerio-en/', 'https://www.lalaue.com/capoeira-schools/associacao-de-capoeira-angola-dobrada/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira Angola practitioner. Trained under both GCAP (Mestre Moraes) and FICA (Mestre Cobra Mansa) lineages. Emphasizes preservation of Angola traditions and rituals without distortion. Teaches across multiple cities in Germany, maintaining the traditional bateria and ritual aspects of the art.',
  E'Praticante tradicional de Capoeira Angola. Treinado sob as linhagens do GCAP (Mestre Moraes) e FICA (Mestre Cobra Mansa). Enfatiza a preservação das tradições e rituais da Angola sem distorção. Ensina em várias cidades na Alemanha, mantendo a bateria tradicional e os aspectos rituais da arte.',
  -- Life dates
  1954,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Rogério Soares Peixoto was born in 1954 in Rio de Janeiro, Brazil. He began his capoeira journey in 1972, at the age of eighteen, in his hometown.

Through seventeen years of dedicated training, Rogério developed under the tutelage of two of the most important figures in the Capoeira Angola revival: Mestre Moraes (founder of GCAP) and Mestre Cobra Mansa (founder of FICA). In 1989, he received the title of Mestre de Capoeira Angola from both masters—a dual recognition that reflects his immersion in both major Angola lineages.

Shortly after becoming mestre, Rogério founded the first Capoeira Angola school in Belo Horizonte, Minas Gerais. This was a significant achievement—bringing traditional Angola practice to a city that had not previously had a dedicated Angola academy.

In May 1990, capoeirista Índio (Carlos Roberto Gallo) invited Rogério to travel to Germany. The move would prove permanent. Settling in Kassel, Rogério began teaching Capoeira Angola in a country where the art form was still largely unknown.

In 1992, Rogério and Índio formally established the Associação de Capoeira Angola Dobrada (ACAD) in Kassel. This was one of the first Capoeira Angola organizations founded on European soil—a reverse of the typical pattern where Brazilian groups expand outward to Europe. The organization''s name references the "Angola Dobrada" berimbau toque, a doubled variation of the traditional Angola rhythm.

The group''s stated mission is "to cultivate, spread and maintain the art and rituals of Capoeira Angola in accordance with the tradition"—without distorting its essence.

Today, Rogério lives in Düsseldorf and teaches regularly in Frankfurt, Kassel, Hamburg, and Freiburg. ACAD has expanded to include locations across three countries: Germany (Frankfurt, Freiburg, Hamburg, Karlsruhe, Kassel), Italy (Bologna, Cesena), and Brazil (Belo Horizonte, São Gonçalo do Rio das Pedras, Curitiba). The organization hosts three annual international meetings rotating between Freiburg (May), Cesena (July/September), and Belo Horizonte (November).

In 2004, Rogério conferred the mestre title upon his co-founder Índio—twelve years after they had established ACAD together. This titling confirmed the lineage continuation through Rogério''s teaching.

Rogério is recognized as "one of the most important representatives of Capoeira Angola in Brazil and in Europe." His work has helped establish the foundations for Capoeira Angola''s presence in German-speaking countries, inspiring subsequent generations of practitioners.',
  -- Extended content (bio_pt)
  E'Rogério Soares Peixoto nasceu em 1954 no Rio de Janeiro, Brasil. Começou sua jornada na capoeira em 1972, aos dezoito anos, em sua cidade natal.

Através de dezessete anos de treinamento dedicado, Rogério se desenvolveu sob a tutela de duas das figuras mais importantes no renascimento da Capoeira Angola: Mestre Moraes (fundador do GCAP) e Mestre Cobra Mansa (fundador da FICA). Em 1989, recebeu o título de Mestre de Capoeira Angola de ambos os mestres—um reconhecimento duplo que reflete sua imersão em ambas as principais linhagens da Angola.

Logo após se tornar mestre, Rogério fundou a primeira escola de Capoeira Angola em Belo Horizonte, Minas Gerais. Esta foi uma conquista significativa—trazendo a prática tradicional da Angola para uma cidade que não tinha anteriormente uma academia dedicada à Angola.

Em maio de 1990, o capoeirista Índio (Carlos Roberto Gallo) convidou Rogério para viajar à Alemanha. A mudança se tornaria permanente. Estabelecendo-se em Kassel, Rogério começou a ensinar Capoeira Angola em um país onde a arte ainda era amplamente desconhecida.

Em 1992, Rogério e Índio estabeleceram formalmente a Associação de Capoeira Angola Dobrada (ACAD) em Kassel. Esta foi uma das primeiras organizações de Capoeira Angola fundadas em solo europeu—um reverso do padrão típico onde grupos brasileiros se expandem para a Europa. O nome da organização faz referência ao toque de berimbau "Angola Dobrada", uma variação dobrada do ritmo tradicional da Angola.

A missão declarada do grupo é "cultivar, difundir e manter viva a arte e os rituais da Capoeira Angola de acordo com a tradição"—sem deformar sua essência.

Hoje, Rogério vive em Düsseldorf e ensina regularmente em Frankfurt, Kassel, Hamburgo e Freiburg. A ACAD expandiu-se para incluir locais em três países: Alemanha (Frankfurt, Freiburg, Hamburgo, Karlsruhe, Kassel), Itália (Bolonha, Cesena) e Brasil (Belo Horizonte, São Gonçalo do Rio das Pedras, Curitiba). A organização realiza três encontros internacionais anuais alternando entre Freiburg (maio), Cesena (julho/setembro) e Belo Horizonte (novembro).

Em 2004, Rogério conferiu o título de mestre ao seu co-fundador Índio—doze anos após terem estabelecido a ACAD juntos. Esta titulação confirmou a continuação da linhagem através do ensino de Rogério.

Rogério é reconhecido como "um dos mais importantes representantes da Capoeira Angola no Brasil e na Europa." Seu trabalho ajudou a estabelecer as bases para a presença da Capoeira Angola nos países de língua alemã, inspirando gerações subsequentes de praticantes.',
  -- Achievements
  E'- Co-founded Associação de Capoeira Angola Dobrada (ACAD) in 1992 - one of the first Capoeira Angola organizations in Europe
- Founded the first Capoeira Angola school in Belo Horizonte, Minas Gerais (1989)
- Received mestre title from both Mestre Moraes (GCAP) and Mestre Cobra Mansa (FICA) in 1989
- Established ACAD presence in 11+ locations across 3 countries (Germany, Italy, Brazil)
- Titled Mestre Índio in 2004
- Pioneer of Capoeira Angola in Germany (arrived 1990)
- Recognized as "one of the most important representatives of Capoeira Angola in Brazil and in Europe"
- Casa Dobrada project: building academia de capoeira angola with residence in Belo Horizonte',
  E'- Co-fundou a Associação de Capoeira Angola Dobrada (ACAD) em 1992 - uma das primeiras organizações de Capoeira Angola na Europa
- Fundou a primeira escola de Capoeira Angola em Belo Horizonte, Minas Gerais (1989)
- Recebeu o título de mestre tanto de Mestre Moraes (GCAP) quanto de Mestre Cobra Mansa (FICA) em 1989
- Estabeleceu presença da ACAD em mais de 11 locais em 3 países (Alemanha, Itália, Brasil)
- Titulou Mestre Índio em 2004
- Pioneiro da Capoeira Angola na Alemanha (chegou em 1990)
- Reconhecido como "um dos mais importantes representantes da Capoeira Angola no Brasil e na Europa"
- Projeto Casa Dobrada: construção de academia de capoeira angola com residência em Belo Horizonte',
  -- Researcher notes (notes_en)
  E'TRAINING PERIOD: 1972-1989 (17 years before receiving mestre title). Trained in Rio de Janeiro.

TEACHERS: Received mestre title from both Mestre Moraes (GCAP) and Mestre Cobra Mansa (FICA) in 1989. This dual recognition is unusual—most mestres are titled by a single organization. The exact nature of his training relationship with each mestre is not documented in available sources.

BIRTH YEAR: 1954 is consistent across all sources (Casa Dobrada, Lalaue). Exact date not specified.

BELO HORIZONTE SCHOOL: Founded "soon after" 1989—the first Capoeira Angola school in that city. Exact founding date not documented.

MOVE TO GERMANY: May 1990 (invited by Índio). Settled in Kassel initially, now resides in Düsseldorf.

ACAD FOUNDING: 1992 in Kassel, Germany. Co-founded with Mestre Índio (Carlos Roberto Gallo, b. 1963).

MESTRE ÍNDIO DISAMBIGUATION: The Mestre Índio who co-founded ACAD (Carlos Roberto Gallo, b. 1963, Várzea da Palma, MG) is a DIFFERENT PERSON from Mestre Índio do Mercado Modelo (Manoel Olimpio De Souza, b. 1950, who founded Grupo Oxóssi in 1968).

WELLINGTON-NEGÃO: Contra-Mestre who teaches in ACAD Curitiba. Students who trained under Rogério and Wellington-Negão include Treinel Kathi of Mukânda Berlin.

CURRENT STATUS: Still active (as of 2025). Lives in Düsseldorf, teaches in Frankfurt, Kassel, Hamburg, Freiburg.

WEBSITE: capoeira-angola-net.jimdoweb.com (returns 403 error, may be archived or restricted).',
  E'PERÍODO DE TREINAMENTO: 1972-1989 (17 anos antes de receber título de mestre). Treinou no Rio de Janeiro.

PROFESSORES: Recebeu título de mestre tanto de Mestre Moraes (GCAP) quanto de Mestre Cobra Mansa (FICA) em 1989. Este reconhecimento duplo é incomum—a maioria dos mestres é titulada por uma única organização. A natureza exata de sua relação de treinamento com cada mestre não está documentada nas fontes disponíveis.

ANO DE NASCIMENTO: 1954 é consistente em todas as fontes (Casa Dobrada, Lalaue). Data exata não especificada.

ESCOLA EM BELO HORIZONTE: Fundada "logo após" 1989—a primeira escola de Capoeira Angola naquela cidade. Data exata de fundação não documentada.

MUDANÇA PARA ALEMANHA: Maio de 1990 (convidado por Índio). Estabeleceu-se em Kassel inicialmente, agora reside em Düsseldorf.

FUNDAÇÃO DA ACAD: 1992 em Kassel, Alemanha. Co-fundada com Mestre Índio (Carlos Roberto Gallo, n. 1963).

DESAMBIGUAÇÃO DE MESTRE ÍNDIO: O Mestre Índio que co-fundou a ACAD (Carlos Roberto Gallo, n. 1963, Várzea da Palma, MG) é uma PESSOA DIFERENTE de Mestre Índio do Mercado Modelo (Manoel Olimpio De Souza, n. 1950, que fundou o Grupo Oxóssi em 1968).

WELLINGTON-NEGÃO: Contra-Mestre que ensina na ACAD Curitiba. Alunos que treinaram sob Rogério e Wellington-Negão incluem Treinel Kathi do Mukânda Berlin.

STATUS ATUAL: Ainda ativo (em 2025). Mora em Düsseldorf, ensina em Frankfurt, Kassel, Hamburgo, Freiburg.

WEBSITE: capoeira-angola-net.jimdoweb.com (retorna erro 403, pode estar arquivado ou restrito).'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/rudolf-hermanny.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Rudolf Hermanny
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION (1931): He was described as 17 years old
-- in April 1949, which places his birth between April 1931 and
-- April 1932. Sources suggest August 16, 1931 in São Paulo.
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
  'Rudolf de Otero Hermanny',
  'Rudolf Hermanny',
  NULL,  -- No formal capoeira title; primarily known by his name
  NULL,  -- No public domain portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho/', 'https://rohermanny.tripod.com/']::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'Rudolf Hermanny practiced capoeira carioca under Mestre Sinhozinho, a combat-focused style distinct from both Angola and Regional. His training emphasized fighting effectiveness, incorporating elements of Greco-Roman wrestling, boxing, and judo. He demonstrated traditional techniques including the baiana and quarenta e um dobrado. His fighting style combined capoeira kicks (rabo de arraia, rasteira) with boxing defense and wrestling techniques.',
  E'Rudolf Hermanny praticou capoeira carioca sob Mestre Sinhozinho, um estilo focado em combate distinto tanto do Angola quanto da Regional. Seu treinamento enfatizava eficácia no combate, incorporando elementos de luta greco-romana, boxe e judô. Ele demonstrava técnicas tradicionais incluindo a baiana e quarenta e um dobrado. Seu estilo de luta combinava chutes de capoeira (rabo de arraia, rasteira) com defesa de boxe e técnicas de luta.',
  -- Life dates
  1931,
  'year'::genealogy.date_precision,
  'São Paulo, Brazil',
  NULL,  -- Possibly still alive (LinkedIn profile exists)
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Rudolf de Otero Hermanny was born on August 16, 1931, in São Paulo. As a young man, his family migrated to the State of Guanabara (now Rio de Janeiro), where he would become one of the most accomplished fighters trained by Mestre Sinhozinho and one of the prominent names in Brazilian capoeira history.

Hermanny began training at Sinhozinho''s academies in Ipanema during the mid-1940s, alongside other notable students including his brother Bruno. His training went beyond capoeira to include boxing, weightlifting, and the practical combat methods that Sinhozinho taught. He demonstrated traditional capoeira carioca techniques including the baiana and quarenta e um dobrado, while also training with judoka Augusto Cordeiro, who served as Sinhozinho''s combat consultant.

At just seventeen years old, Hermanny gained national attention in the famous 1949 Capoeira Challenge. On April 1, 1949, newspaper A Noite announced "Capoeira Challenge - Sinhozinho of the Federal District against Master Bimba from Bahia." The event was organized by the Federação Metropolitana de Pugilismo and held over two days at the Estádio Carioca on Avenida Passos in downtown Rio. In the second bout on April 7, young Hermanny faced Fernando Rodrigues Perez, a student of Mestre Bimba''s Capoeira Regional. Hermanny dominated the fight, defeating Perez in just two minutes and injuring his arm with a devastating kick. According to reports, Bimba himself was so impressed by some of the movements he witnessed that he incorporated them into his own style.

Four years later, Hermanny represented Sinhozinho again in a challenge against the Gracie family. On March 17, 1953, a vale tudo charity event was held at the Vasco da Gama stadium for drought relief in northeastern Brazil. Hermanny faced Guanair Vial Gomes, who was significantly heavier and had a wrestling background. The Gracie fighter dominated the opening minutes with ground and pound, but Hermanny escaped to his feet and controlled the remainder of the match. After one hour and ten minutes, with Gomes heavily battered and Hermanny looking fresher, Carlos Gracie called for the match to be stopped and declared a draw. Hermanny remains the only capoeirista known to have fought a jiu-jitsu practitioner for over an hour without losing.

On June 29, 1953, Hermanny fought another significant bout at the Palácio de Alumínio under Burlamaqui''s capoeira rules (with groundwork modifications). His opponent was Artur Emídio de Oliveira, a Capoeira Regional fighter from Bahia and a popular vale tudo competitor. Carlos and Hélio Gracie were among the spectators. Hermanny controlled the first round with roundhouse kicks and palm strikes, defending with a boxing guard. In the second round, he came out with increased aggression, knocking Emídio down several times with kicks before landing his own rasteira. In a decisive moment, Hermanny timed a stomp on Emídio''s face as the latter was getting up, then followed with strikes and a throw that drove referee Jayme Ferreira to stop the fight before Emídio was fully knocked out.

Beyond capoeira, Hermanny achieved significant success in other disciplines. He became a Brazilian and Pan-American judo team champion in Mexico in 1960, earning the nickname "the Bear." He served as a lecturer at the Federal University of Rio de Janeiro (UFRJ) in physical education, and coached the Brazilian Football Team during the 1966 World Cup in England. He was instrumental in the development of judo in Brazil, reportedly suggesting to Georges Mehdi that he train in Japan, and later helped protect Mehdi''s academy when Gracie students attempted to assault it.

André Lacé Lopes, a fellow student of Sinhozinho, wrote a book titled "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002), documenting their master and his most famous fighting student. A biography of Hermanny himself was published in 2003 by Ediouro, organized by Luiz Carlos Lisboa.

Hermanny''s career represents a unique chapter in capoeira history. He demonstrated that Sinhozinho''s combat-focused approach to capoeira carioca could compete effectively against both Bahian Regional and Brazilian jiu-jitsu. His victories against Bimba''s students in 1949 were among the few documented instances where capoeira carioca defeated Regional in formal competition.',
  -- bio_pt
  E'Rudolf de Otero Hermanny nasceu em 16 de agosto de 1931 em São Paulo. Quando jovem, sua família migrou para o Estado da Guanabara (atual Rio de Janeiro), onde ele se tornaria um dos lutadores mais realizados treinados por Mestre Sinhozinho e um dos nomes destacados na história da capoeira brasileira.

Hermanny começou a treinar nas academias de Sinhozinho em Ipanema durante meados da década de 1940, ao lado de outros alunos notáveis, incluindo seu irmão Bruno. Seu treinamento foi além da capoeira para incluir boxe, halterofilismo e os métodos de combate prático que Sinhozinho ensinava. Ele demonstrava técnicas tradicionais da capoeira carioca incluindo a baiana e quarenta e um dobrado, enquanto também treinava com o judoca Augusto Cordeiro, que servia como consultor de combate de Sinhozinho.

Com apenas dezessete anos, Hermanny ganhou atenção nacional no famoso Desafio de Capoeira de 1949. Em 1º de abril de 1949, o jornal A Noite anunciou "Desafio de Capoeira - Sinhozinho do Distrito Federal contra Mestre Bimba da Bahia". O evento foi organizado pela Federação Metropolitana de Pugilismo e realizado em dois dias no Estádio Carioca na Avenida Passos, no centro do Rio. Na segunda luta em 7 de abril, o jovem Hermanny enfrentou Fernando Rodrigues Perez, um aluno da Capoeira Regional de Mestre Bimba. Hermanny dominou a luta, derrotando Perez em apenas dois minutos e lesionando seu braço com um chute devastador. Segundo relatos, o próprio Bimba ficou tão impressionado com alguns dos movimentos que presenciou que os incorporou em seu próprio estilo.

Quatro anos depois, Hermanny representou Sinhozinho novamente em um desafio contra a família Gracie. Em 17 de março de 1953, um evento beneficente de vale tudo foi realizado no estádio do Vasco da Gama para auxílio às vítimas da seca no Nordeste. Hermanny enfrentou Guanair Vial Gomes, que era significativamente mais pesado e tinha experiência em luta livre. O lutador Gracie dominou os minutos iniciais com ground and pound, mas Hermanny escapou para os pés e controlou o restante da luta. Após uma hora e dez minutos, com Gomes muito castigado e Hermanny parecendo mais fresco, Carlos Gracie pediu que a luta fosse interrompida e declarada empate. Hermanny permanece como o único capoeirista conhecido por ter lutado contra um praticante de jiu-jitsu por mais de uma hora sem perder.

Em 29 de junho de 1953, Hermanny lutou outra luta significativa no Palácio de Alumínio sob as regras de capoeira de Burlamaqui (com modificações para luta de solo). Seu oponente era Artur Emídio de Oliveira, um lutador de Capoeira Regional da Bahia e um popular competidor de vale tudo. Carlos e Hélio Gracie estavam entre os espectadores. Hermanny controlou o primeiro round com chutes circulares e golpes com a palma, defendendo-se com guarda de boxe. No segundo round, ele veio com agressividade aumentada, derrubando Emídio várias vezes com chutes antes de aplicar sua própria rasteira. Em um momento decisivo, Hermanny cronometrou um pisão no rosto de Emídio enquanto este se levantava, depois seguiu com golpes e uma projeção que levou o árbitro Jayme Ferreira a parar a luta antes que Emídio fosse completamente nocauteado.

Além da capoeira, Hermanny alcançou sucesso significativo em outras disciplinas. Tornou-se campeão brasileiro e pan-americano de judô por equipes no México em 1960, ganhando o apelido de "o Urso". Serviu como professor na Universidade Federal do Rio de Janeiro (UFRJ) em educação física, e foi técnico da Seleção Brasileira de Futebol durante a Copa do Mundo de 1966 na Inglaterra. Ele foi fundamental no desenvolvimento do judô no Brasil, supostamente sugerindo a Georges Mehdi que treinasse no Japão, e depois ajudou a proteger a academia de Mehdi quando alunos Gracie tentaram atacá-la.

André Lacé Lopes, um colega aluno de Sinhozinho, escreveu um livro intitulado "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002), documentando seu mestre e seu aluno lutador mais famoso. Uma biografia do próprio Hermanny foi publicada em 2003 pela Ediouro, organizada por Luiz Carlos Lisboa.

A carreira de Hermanny representa um capítulo único na história da capoeira. Ele demonstrou que a abordagem focada em combate de Sinhozinho para a capoeira carioca podia competir efetivamente tanto contra a Regional baiana quanto contra o jiu-jitsu brasileiro. Suas vitórias contra os alunos de Bimba em 1949 estavam entre as poucas instâncias documentadas em que a capoeira carioca derrotou a Regional em competição formal.',
  -- achievements_en
  'Defeated Fernando Rodrigues Perez (Mestre Bimba''s student) in 2 minutes at the 1949 Capoeira Challenge at Estádio Carioca; Fought to a draw with Guanair Gomes (Gracie representative) for 1 hour 10 minutes at the 1953 vale tudo challenge; Defeated Artur Emídio by referee stoppage in 1953 under Burlamaqui''s capoeira rules; Brazilian and Pan-American Judo team champion (Mexico, 1960); Lecturer at Federal University of Rio de Janeiro (UFRJ); Physical conditioning coach for Brazilian Football Team at 1966 World Cup; Subject of book "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002)',
  -- achievements_pt
  'Derrotou Fernando Rodrigues Perez (aluno de Mestre Bimba) em 2 minutos no Desafio de Capoeira de 1949 no Estádio Carioca; Lutou até empate com Guanair Gomes (representante Gracie) por 1 hora e 10 minutos no desafio de vale tudo de 1953; Derrotou Artur Emídio por interrupção do árbitro em 1953 sob as regras de capoeira de Burlamaqui; Campeão brasileiro e pan-americano de judô por equipes (México, 1960); Professor da Universidade Federal do Rio de Janeiro (UFRJ); Preparador físico da Seleção Brasileira de Futebol na Copa do Mundo de 1966; Tema do livro "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" (2002)',
  -- Researcher notes (English)
  E'BIRTH YEAR (1931): Multiple sources confirm he was 17 years old in April 1949, placing his birth between April 1931 and April 1932. One source indicates August 16, 1931, in São Paulo. Using 1931 with year precision.

DEATH: Unknown. A LinkedIn profile exists for "Rudolf de Otero Hermanny" listed as Professor at INTERCON CLEAN ROOM in Rio de Janeiro, suggesting he may still be alive (would be ~93 years old in 2024). No obituary found.

NICKNAME: Known as "the Bear" (o Urso) in judo circles due to his physical presence.

NAME: Full name Rudolf de Otero Hermanny. Using "Rudolf Hermanny" as apelido since he is commonly referenced by his surname, not a traditional capoeira nickname.

TRAINING: Trained under Mestre Sinhozinho at his academies in Ipanema. Also trained with judoka Augusto Cordeiro, who served as Sinhozinho''s combat consultant. Brother Bruno also trained under Sinhozinho. 1948 photograph shows him boxing against Pedro Gomes at ENEFD.

FIGHT RECORD:
- April 7, 1949: Defeated Fernando Rodrigues Perez (Bimba''s student) in 2 minutes at Estádio Carioca - injured Perez''s arm with a kick
- March 17, 1953: Drew with Guanair Vial Gomes (Gracie representative) after 1h10m at Vasco da Gama stadium
- June 29, 1953: Defeated Artur Emídio by referee stoppage (KO) at Palácio de Alumínio

OTHER CAREERS:
- Physical educator at UFRJ
- Brazilian and Pan-American Judo champion (Mexico 1960)
- Coach of Brazilian Football Team at 1966 World Cup
- Protected Georges Mehdi''s judo academy from Gracie attackers

SOURCES:
- capoeirahistory.com/mestre/master-sinhozinho/
- rohermanny.tripod.com (Sinhozinho tribute site by Hermanny)
- A Noite newspaper, April 1, 1949
- Book: "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" by André Lacé Lopes (2002)
- Wikipedia: Agenor Moreira Sampaio',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1931): Múltiplas fontes confirmam que ele tinha 17 anos em abril de 1949, colocando seu nascimento entre abril de 1931 e abril de 1932. Uma fonte indica 16 de agosto de 1931, em São Paulo. Usando 1931 com precisão de ano.

MORTE: Desconhecida. Existe um perfil no LinkedIn para "Rudolf de Otero Hermanny" listado como Professor no INTERCON CLEAN ROOM no Rio de Janeiro, sugerindo que ele pode ainda estar vivo (teria ~93 anos em 2024). Nenhum obituário encontrado.

APELIDO: Conhecido como "o Urso" nos círculos de judô devido à sua presença física.

NOME: Nome completo Rudolf de Otero Hermanny. Usando "Rudolf Hermanny" como apelido já que ele é comumente referenciado pelo sobrenome, não um apelido tradicional de capoeira.

TREINAMENTO: Treinou sob Mestre Sinhozinho em suas academias em Ipanema. Também treinou com o judoca Augusto Cordeiro, que servia como consultor de combate de Sinhozinho. Irmão Bruno também treinou sob Sinhozinho. Fotografia de 1948 mostra ele lutando boxe contra Pedro Gomes na ENEFD.

HISTÓRICO DE LUTAS:
- 7 de abril de 1949: Derrotou Fernando Rodrigues Perez (aluno de Bimba) em 2 minutos no Estádio Carioca - lesionou o braço de Perez com um chute
- 17 de março de 1953: Empatou com Guanair Vial Gomes (representante Gracie) após 1h10m no estádio do Vasco da Gama
- 29 de junho de 1953: Derrotou Artur Emídio por interrupção do árbitro (nocaute) no Palácio de Alumínio

OUTRAS CARREIRAS:
- Educador físico na UFRJ
- Campeão brasileiro e pan-americano de judô (México 1960)
- Técnico da Seleção Brasileira de Futebol na Copa do Mundo de 1966
- Protegeu a academia de judô de Georges Mehdi de atacantes Gracie

FONTES:
- capoeirahistory.com/mestre/master-sinhozinho/
- rohermanny.tripod.com (site de tributo a Sinhozinho por Hermanny)
- Jornal A Noite, 1º de abril de 1949
- Livro: "A Capoeiragem no Rio de Janeiro, Primeiro Ensaio – Sinhozinho e Rudolf Hermanny" de André Lacé Lopes (2002)
- Wikipedia: Agenor Moreira Sampaio'
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

-- Source: entities/persons/zehi.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zehí
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Zehí was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Zehí',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Zehí (also spelled Zehi) was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Zehí among the founding mestres who established this historic center. The name appears with accent variation in different sources (Zehí/Zehi), reflecting the informal documentation practices of the era.\n\nZehí was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra. This event led to Pastinha''s assumption of leadership after the death of Mestre Amorzinho and the eventual transformation of the center into CECA (Centro Esportivo de Capoeira Angola).\n\nNo further biographical details about Zehí have been documented.',
  E'Zehí (também grafado Zehi) foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Zehí entre os mestres fundadores que estabeleceram este centro histórico. O nome aparece com variação de acento em diferentes fontes (Zehí/Zehi), refletindo as práticas informais de documentação da época.\n\nZehí esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra. Este evento levou à assunção da liderança por Pastinha após a morte de Mestre Amorzinho e à eventual transformação do centro em CECA (Centro Esportivo de Capoeira Angola).\n\nNenhum outro detalhe biográfico sobre Zehí foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Name appears with spelling variation: Zehí/Zehi. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. O nome aparece com variação de grafia: Zehí/Zehi. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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

-- Source: entities/persons/vitor-agau.sql (CHANGED)
-- ============================================================
-- GENEALOGY PERSON: Vitor Agaú
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
  NULL,
  'Vitor Agaú',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-34']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-dates the Angola/Regional stylistic distinction. Associated with the Capoeira Angola tradition through his presence at CECA founding.',
  E'Anterior à distinção estilística Angola/Regional. Associado à tradição da Capoeira Angola por sua presença na fundação do CECA.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1960,
  'decade'::genealogy.date_precision,
  NULL,
  -- Extended content (bio_en)
  E'Vitor Agaú was one of the early mestres of capoeira in Salvador, Bahia, active during the early twentieth century. His name appears in the oral testimonies of several capoeiristas who learned from him or played alongside him in the great rodas of that era.

Mestre Onça Preta (Cícero Navarro, 1909-2006), recounting his youth in a 1972 interview, listed Vitor Agaú among the masters under whom he trained as a boy in Salvador. "I had not one, but many mestres," Onça Preta recalled. "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... and many others, who today are deceased." This testimony places Vitor Agaú alongside the greatest names of Bahian capoeira in the 1920s and 1930s - Samuel Querido de Deus (considered by many the greatest capoeirista of 1930s Salvador), Vicente Pastinha, and Raimundo Aberrê.

Unlike Besourinho and Gasolina, who were killed during the brutal persecution of capoeiristas by Police Chief Pedro de Azevedo Gordilho ("Pedrito") in the 1920s, Vitor Agaú survived to see capoeira emerge from the shadows. On February 23, 1941, he was among the mestres present at the historic gathering at Ladeira de Pedra in the Gengibirra neighborhood of Liberdade, where civil guard Amorzinho passed leadership of the traditional roda to Mestre Pastinha. This moment marked the founding of the Centro Esportivo de Capoeira Angola (CECA), the first academy dedicated to preserving the traditional Angolan style.

Mestre Pastinha''s own account lists "Vitor H.D." among those present alongside Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Olampio, Zeir, Alemão filho de Maré, Domingo de Milhães, Beraldo Izaque dos Santos, Pinião José Chibata, and Ricardo B. dos Santos.

Vitor Agaú also taught the next generation. Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002), who grew up in the Curva Grande neighborhood, learned capoeira starting at age four from three teachers: Menino Gordo da Curva Grande, Roque, and Victor H.U. (as his name appears in this source). Gaguinho Preto later passed through Pastinha''s CECA and trained with Zeca do Uruguai, but his foundational years were shaped by these early mestres including Vitor Agaú.

Mestre Roque also recalled playing capoeira with Vitor Agaú: "I jumped with Pastinha, Caiçara, Vitor Agaú, Onça Preta and many other masters of my time." This places Vitor Agaú in the active roda circuit of Salvador through at least the 1940s.

Little else is known about Vitor Agaú. His full name remains unrecorded - the initials "H.D." or "H.U." that appear in some sources may represent his surname, but its meaning has been lost. He left no written records, founded no academy, and his death went undocumented. Yet through the testimony of those he taught and played with, his name endures as one of the links in the chain that connects modern Capoeira Angola to its roots in early twentieth-century Salvador.',
  -- bio_pt
  E'Vitor Agaú foi um dos primeiros mestres de capoeira em Salvador, Bahia, ativo no início do século XX. Seu nome aparece nos testemunhos orais de vários capoeiristas que aprenderam com ele ou jogaram ao seu lado nas grandes rodas daquela época.

Mestre Onça Preta (Cícero Navarro, 1909-2006), relembrando sua juventude em entrevista de 1972, listou Vitor Agaú entre os mestres com quem treinou quando menino em Salvador. "Não tive um, mas muitos mestres," recordou Onça Preta. "Garoto ainda, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... e muitos outros, hoje mortos." Este testemunho coloca Vitor Agaú ao lado dos maiores nomes da capoeira baiana nas décadas de 1920 e 1930 - Samuel Querido de Deus (considerado por muitos o maior capoeirista de Salvador nos anos 1930), Vicente Pastinha e Raimundo Aberrê.

Diferentemente de Besourinho e Gasolina, que foram mortos durante a perseguição brutal aos capoeiristas pelo chefe de polícia Pedro de Azevedo Gordilho ("Pedrito") nos anos 1920, Vitor Agaú sobreviveu para ver a capoeira emergir das sombras. Em 23 de fevereiro de 1941, estava entre os mestres presentes no encontro histórico na Ladeira de Pedra, no bairro Gengibirra da Liberdade, onde o guarda civil Amorzinho passou a liderança da roda tradicional para Mestre Pastinha. Este momento marcou a fundação do Centro Esportivo de Capoeira Angola (CECA), a primeira academia dedicada a preservar o estilo tradicional angolano.

O próprio relato de Mestre Pastinha lista "Vitor H.D." entre os presentes ao lado de Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Olampio, Zeir, Alemão filho de Maré, Domingo de Milhães, Beraldo Izaque dos Santos, Pinião José Chibata e Ricardo B. dos Santos.

Vitor Agaú também ensinou a próxima geração. Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002), que cresceu no bairro da Curva Grande, aprendeu capoeira a partir dos quatro anos de idade com três professores: Menino Gordo da Curva Grande, Roque e Victor H.U. (como seu nome aparece nesta fonte). Gaguinho Preto depois passou pelo CECA de Pastinha e treinou com Zeca do Uruguai, mas seus anos de formação foram moldados por esses primeiros mestres, incluindo Vitor Agaú.

Mestre Roque também recordou jogar capoeira com Vitor Agaú: "Pulei com Pastinha, Caiçara, Vitor Agaú, Onça Preta e muitos outros mestres da minha época." Isto coloca Vitor Agaú no circuito ativo de rodas de Salvador pelo menos até os anos 1940.

Pouco mais se sabe sobre Vitor Agaú. Seu nome completo permanece não registrado - as iniciais "H.D." ou "H.U." que aparecem em algumas fontes podem representar seu sobrenome, mas seu significado se perdeu. Ele não deixou registros escritos, não fundou academia, e sua morte passou sem documentação. Ainda assim, através do testemunho daqueles que ele ensinou e com quem jogou, seu nome perdura como um dos elos na corrente que conecta a Capoeira Angola moderna às suas raízes no início do século XX em Salvador.',
  -- achievements_en
  E'One of the mestres present at the founding of CECA on February 23, 1941
Teacher of Mestre Onça Preta (Cícero Navarro, 1909-2006)
Teacher of Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002)
Survived the Pedrito persecution of the 1920s
Contemporary of Samuel Querido de Deus, Vicente Pastinha, and Raimundo Aberrê',
  -- achievements_pt
  E'Um dos mestres presentes na fundação do CECA em 23 de fevereiro de 1941
Professor de Mestre Onça Preta (Cícero Navarro, 1909-2006)
Professor de Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002)
Sobreviveu à perseguição de Pedrito nos anos 1920
Contemporâneo de Samuel Querido de Deus, Vicente Pastinha e Raimundo Aberrê',
  -- notes_en
  E'NAME VARIATIONS:
- Vitor Agaú (most common apelido, used by Onça Preta)
- Vitor H.D. (Mestre Pastinha''s listing of CECA founders)
- Victor H.U. (velhosmestres.com listing for Gaguinho Preto''s teacher)
Full name unknown. The initials may represent his surname but their meaning is lost.

BIRTH YEAR ESTIMATION (1880, decade precision):
He was teaching Onça Preta (b. 1909) as a boy (c. 1915-1925). If he was 30-50 when teaching, birth = ~1865-1895. He also taught Gaguinho Preto (b. 1934, started age 4 in 1938). To be an established teacher across both eras, using 1880 as midpoint estimate.

DEATH: Unknown exact date. Onça Preta stated in 1972 that his teachers including Vitor Agaú were "hoje mortos" (now deceased). He survived Pedrito persecution (1920s) as he was present at CECA founding 1941. Estimate death ~1950s-1960s, using 1960 with decade precision.

TITLE: No formal title recorded. Called "mestre" implicitly through his role as teacher and presence at CECA founding.

STYLE: Pre-dates Angola/Regional distinction (1930s). Associated with traditional Capoeira Angola through CECA.

SOURCES: Primary source is Onça Preta''s testimony recorded in velhosmestres.com and 1972 O Dia newspaper interview. Secondary sources include Mestre Pastinha''s account of CECA founders and Gaguinho Preto''s biographical information.

RESOLVED RELATIONSHIPS (see vitor-agau.sql statements):
- associated_with Pastinha (CECA founding)
- associated_with Aberrê (CECA founding)
- associated_with Noronha (CECA founding)
- associated_with Amorzinho (Gengibirra/CECA founding)
- associated_with Livino (CECA founding)

PENDING RELATIONSHIPS (require future imports):
- taught Gaguinho Preto (Everaldo Arcanjo de Assis)
- associated_with Samuel Querido de Deus
- associated_with Mestre Roque
- member_of CECA (founding member 1941)',
  -- notes_pt
  E'VARIAÇÕES DE NOME:
- Vitor Agaú (apelido mais comum, usado por Onça Preta)
- Vitor H.D. (listagem de Mestre Pastinha dos fundadores do CECA)
- Victor H.U. (listagem do velhosmestres.com para professor de Gaguinho Preto)
Nome completo desconhecido. As iniciais podem representar seu sobrenome, mas seu significado se perdeu.

ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década):
Estava ensinando Onça Preta (n. 1909) quando menino (c. 1915-1925). Se tinha 30-50 anos quando ensinava, nascimento = ~1865-1895. Também ensinou Gaguinho Preto (n. 1934, começou aos 4 anos em 1938). Para ser professor estabelecido em ambas as eras, usando 1880 como estimativa do ponto médio.

MORTE: Data exata desconhecida. Onça Preta afirmou em 1972 que seus professores incluindo Vitor Agaú estavam "hoje mortos." Sobreviveu à perseguição de Pedrito (anos 1920) pois estava presente na fundação do CECA em 1941. Estimativa de morte ~1950s-1960s, usando 1960 com precisão de década.

TÍTULO: Nenhum título formal registrado. Chamado de "mestre" implicitamente através de seu papel como professor e presença na fundação do CECA.

ESTILO: Anterior à distinção Angola/Regional (anos 1930). Associado à Capoeira Angola tradicional através do CECA.

FONTES: Fonte primária é o testemunho de Onça Preta registrado em velhosmestres.com e entrevista ao jornal O Dia de 1972. Fontes secundárias incluem o relato de Mestre Pastinha sobre os fundadores do CECA e informações biográficas de Gaguinho Preto.

RELACIONAMENTOS RESOLVIDOS (ver statements vitor-agau.sql):
- associated_with Pastinha (fundação CECA)
- associated_with Aberrê (fundação CECA)
- associated_with Noronha (fundação CECA)
- associated_with Amorzinho (fundação Gengibirra/CECA)
- associated_with Livino (fundação CECA)

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- taught Gaguinho Preto (Everaldo Arcanjo de Assis)
- associated_with Samuel Querido de Deus
- associated_with Mestre Roque
- member_of CECA (membro fundador 1941)'
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

-- ============================================================
-- PHASE 2: UPSERT STATEMENTS
-- ============================================================

-- Source: statements/persons/aberre-de-santo-amaro.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Aberrê de Santo Amaro
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Aberrê de Santo Amaro is the SUBJECT.
-- NOTE: Uses apelido_context='Santo Amaro' to distinguish from
-- the Salvador Aberrê (Antônio Raimundo Argolo).
-- ============================================================

-- NO ACTIVE STATEMENTS
-- Aberrê de Santo Amaro has no relationships where he is the SUBJECT
-- that reference entities currently in the dataset.

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- When Mestre Caiçara is imported, add to his statements file:
-- Caiçara student_of Aberrê (context: Santo Amaro) - training started 1938
--
-- Note: The relationship flows from student to teacher, so the statement
-- belongs in caiçara.sql, NOT here.

-- Source: statements/persons/americano.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Americano (Dois Rios)
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Americano is the SUBJECT.
-- ============================================================

-- Americano associated_with Sete Coroas (fellow prisoners at Dois Rios)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Both identified as capoeira rogues imprisoned at Dois Rios Correctional Colony on Ilha Grande", "pt": "Ambos identificados como malandros capoeiras presos na Colônia Correcional de Dois Rios na Ilha Grande"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.',
  'Mentioned together in Madame Satã''s prison memoirs as capoeira rogues at Dois Rios. Sete Coroas was from Bahia.',
  'Mencionados juntos nas memórias de prisão de Madame Satã como malandros capoeiras em Dois Rios. Sete Coroas era da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Americano' AND COALESCE(s.apelido_context, '') = 'Dois Rios'
  AND o.apelido = 'Sete Coroas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Americano associated_with Edgar (fellow prisoners at Dois Rios)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Both identified as capoeira rogues imprisoned at Dois Rios Correctional Colony on Ilha Grande", "pt": "Ambos identificados como malandros capoeiras presos na Colônia Correcional de Dois Rios na Ilha Grande"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.',
  'Mentioned together in Madame Satã''s prison memoirs as capoeira rogues at Dois Rios.',
  'Mencionados juntos nas memórias de prisão de Madame Satã como malandros capoeiras em Dois Rios.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Americano' AND COALESCE(s.apelido_context, '') = 'Dois Rios'
  AND o.apelido = 'Edgar' AND COALESCE(o.apelido_context, '') = 'Dois Rios'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS
-- ============================================================
-- No teacher-student relationships documented for Americano.
-- No students documented.
-- POSSIBLE CONNECTION: May be the same person as Mestre Celso's
-- cousin who practiced tiririca at Ilha Grande. If verified,
-- would add family_of relationship with Mestre Celso.
-- ============================================================

-- Source: statements/persons/andre-jansen.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: André Jansen
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where André Jansen is the SUBJECT.
-- ============================================================

-- André Jansen student_of Sinhozinho
-- Primary teacher relationship - trained at Sinhozinho's academies in Ipanema
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-sinhozinho-1891-1962/',
  E'André Jansen was described as "the highlight of [Sinhozinho''s] first generation" of students. He trained at Sinhozinho''s academies in Ipanema during the 1930s-1940s. Sinhozinho praised him as his best student of that era, before Rudolf Hermanny emerged in the later generation.',
  E'André Jansen foi descrito como "o destaque da primeira geração" de alunos de Sinhozinho. Treinou nas academias de Sinhozinho em Ipanema durante as décadas de 1930-1940. Sinhozinho o elogiou como seu melhor aluno daquela época, antes de Rudolf Hermanny emergir na geração posterior.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'André Jansen' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NON-CAPOEIRA OPPONENTS (not imported to database)
-- ============================================================
-- André Jansen faced Ricardo Nibbon (George Gracie student, jiu-jitsu/catch-as-catch-can)
-- at Parque Boa Vista, Salvador, October 30, 1935.
-- Ricardo Nibbon was NOT a capoeirista - he was a jiu-jitsu practitioner.
-- This fight is documented in the bio and notes but no statement is created.
-- ============================================================

-- Source: statements/persons/antonio-boca-de-porco.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Antônio Boca de Porco
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Antônio Boca de Porco is the SUBJECT.
-- ============================================================

-- Antônio Boca de Porco co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Boca de Porco' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Antônio Boca de Porco.
-- No students documented.
-- ============================================================

-- Source: statements/persons/antonio-corro.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Antônio Corró
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Antônio Corró is the SUBJECT.
--
-- NOTE: As a Layer Zero figure, Corró has no documented teachers
-- or contemporaries that can be linked. His teachers would have
-- been born around 1830-1850, during slavery, and are unknown.
-- ============================================================

-- ============================================================
-- NO ACTIVE STATEMENTS
-- ============================================================
-- Antônio Corró has no documented relationships where he is the
-- SUBJECT. His only known relationship is as teacher of Mestre
-- Paraná, which is recorded in parana.sql with Paraná as subject.

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- None identified. Corró's teachers are unknown.

-- ============================================================
-- NOTE: Relationships where Antônio Corró is the OBJECT
-- ============================================================
-- These go in the OTHER person's statements file per ownership rule:
-- Paraná student_of Antônio Corró (1932) → parana.sql

-- Source: statements/persons/antonio-galindeu.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Antônio Galindeu
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Antônio Galindeu is the SUBJECT.
-- ============================================================

-- Antônio Galindeu co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Galindeu' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Antônio Galindeu.
-- No students documented.
-- ============================================================

-- Source: statements/persons/artur-emidio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Artur Emídio
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Artur Emídio is the SUBJECT.
-- ============================================================

-- Artur Emídio founded Grupo Artur Emídio (1955)
-- NOTE: Group not yet in dataset - will be added when group is imported
-- INSERT INTO genealogy.statements ...

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships require the object entities to be
-- imported first:
--
-- TEACHER RELATIONSHIPS:
-- - Artur Emídio student_of Paizinho (Teodoro Ramos) - ~1937-1945
--   Primary mestre who taught him from age 7 until death
--   Paizinho not yet in dataset - needs import
--
-- - Artur Emídio trained_under [Gracie Academy] - ~1953-1955
--   Brief training after defeat to Rudolf Hermanny
--   Not a formal student_of relationship
--
-- GROUP RELATIONSHIPS:
-- - Artur Emídio founded "Grupo Artur Emídio" / "Academia de Capoeira Artur Emídio"
--   Founded 1955 in Rio de Janeiro, Rua Manuel Fontenele, Bonsucesso
--   Group not yet in dataset
--
-- ASSOCIATED_WITH (contemporaries):
-- - Artur Emídio associated_with Bimba (met at 1967 symposium; "somewhat conflictual relationship")
--   Bimba exists in dataset - but this is NOT a student_of relationship
--
-- ============================================================

-- Artur Emídio associated_with Bimba (met at 1967 symposium)
-- Using association_context to describe the documented connection
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Met at 1967 capoeira symposium at Campos dos Afonsos, Rio de Janeiro. Artur Emídio later described their relationship as \"somewhat conflictual.\" Photo of them together exists from this event."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-69; nossa-tribo.com/mestre-artur-emidio/',
  'Documented meeting at 1967 symposium. Not a teacher-student relationship. Artur''s academy was described as based on "the systematized method of Mestre Bimba" but this was learned through his own lineage (Paizinho), not directly from Bimba.',
  'Encontro documentado no simpósio de 1967. Não era uma relação professor-aluno. A academia de Artur era descrita como baseada no "método sistematizado de Mestre Bimba" mas isso foi aprendido através de sua própria linhagem (Paizinho), não diretamente de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Artur Emídio' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Statements where Artur Emídio is the OBJECT
-- (students learning FROM him) go in each student's file:
--
-- These exist in LEOPOLDINA.SQL (already imported):
-- - Leopoldina student_of Artur Emídio (~1954-1955)
--
-- These will be added when students are imported:
-- - Djalma Bandeira student_of Artur Emídio (first student)
-- - Paulo Gomes student_of Artur Emídio (1962)
-- - Celso do Engenho da Rainha student_of Artur Emídio
-- - Mendonça student_of Artur Emídio
-- - Vilela student_of Artur Emídio
-- - Vilmar student_of Artur Emídio
-- - Roberval Serejo student_of Artur Emídio
-- - Genaro student_of Artur Emídio (1955)
-- ============================================================

-- Source: statements/persons/auvelino.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Auvelino
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Auvelino is the SUBJECT.
-- NOTE: Auvelino has no documented teachers, students, or
-- group affiliations where HE is the subject. The only
-- documented relationship is Bigodinho trained_under Auvelino,
-- which belongs in bigodinho.sql.
-- ============================================================

-- No statements to generate for Auvelino as subject.
-- His only documented relationship is as OBJECT:
-- Bigodinho trained_under Auvelino (1950, berimbau instruction)
-- This statement exists in bigodinho.sql

-- ============================================================
-- PENDING RELATIONSHIPS (not enough information)
-- ============================================================

-- Auvelino's teachers: Unknown - no lineage documented
-- Auvelino's other students: Unknown - only Bigodinho documented
-- Auvelino's group affiliations: Unknown
-- Auvelino's contemporaries: Possibly Mestre Waldemar (both active in Salvador 1950)
--   but no documented connection between them

-- If future research reveals:
-- - Who taught Auvelino: Add Auvelino trained_under [teacher]
-- - Other students: Those students' files would contain [student] trained_under Auvelino
-- - Group membership: Add Auvelino member_of [group]

-- Source: statements/persons/baleado.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Baleado
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Baleado is the SUBJECT.
-- ============================================================

-- Baleado co_founded Filhos de Angola (Rio 1960)
-- NOTE: Group entity must exist first. When genealogy.group_profiles
-- is populated with Filhos de Angola, this statement can be added.
-- The group should have name_context 'Rio 1960' to distinguish from
-- GCFA founded 1984 in Salvador.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Baleado co_founded Filhos de Angola (Rio 1960) - group import pending
-- Baleado associated_with Mucungê - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Dois de Ouro - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Onça Preta - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Imagem do Cão - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Roque - context: 'co-founder Filhos de Angola, Roda da Central participant'
-- Baleado associated_with Inglês - context: 'Roda da Central participant'
-- Baleado associated_with Vavá Moleque - context: 'Roda da Central participant'
-- Baleado associated_with Reginaldo - context: 'Roda da Central participant'
-- Baleado associated_with Paraná - context: 'Roda da Central participant'
-- Baleado associated_with Lamartine - context: 'Roda da Central participant'
-- Baleado associated_with Seu Menezes - context: 'Roda da Central participant'

-- ============================================================
-- RELATIONSHIPS WITH EXISTING ENTITIES
-- ============================================================
-- The following co-founders already exist in the dataset:
-- Onça Preta, Mucungê, Dois de Ouro, Roque

-- Baleado associated_with Onça Preta (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who migrated to Rio in the 1950s and participated in the Roda da Central.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que migraram para o Rio nos anos 1950 e participavam da Roda da Central.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baleado associated_with Mucungê (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who participated in the Roda da Central.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que participavam da Roda da Central.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Mucungê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baleado associated_with Dois de Ouro (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who participated in the Roda da Central.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que participavam da Roda da Central.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Dois de Ouro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baleado associated_with Roque (co-founder Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "co-founder Filhos de Angola, Roda da Central participant"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-51, capoeirahistory.com/students-of-mestre-roque/',
  E'Co-founders of Grupo Filhos de Angola in Rio de Janeiro (July 21, 1960). Both were Bahian angoleiros who participated in the Roda da Central. Roque honored Baleado''s name on his academy banner in São João de Meriti.',
  E'Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro (21 de julho de 1960). Ambos eram angoleiros baianos que participavam da Roda da Central. Roque homenageou o nome de Baleado no banner de sua academia em São João de Meriti.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baleado' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/barbosa.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Barbosa (do Cabeça)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Barbosa is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
--
-- NOTE: Most significant relationships have Barbosa as OBJECT:
-- - João Pequeno trained_under Barbosa → goes in joao-pequeno.sql
-- These are listed in PENDING section for cross-reference.
-- ============================================================

-- ------------------------------------------------------------
-- Barbosa associated_with Querido de Deus
-- Both featured in Edison Carneiro's research on Angola capoeira
-- Both participated in 1937 II Congresso Afro-Brasileiro
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "II Congresso Afro-Brasileiro participants; Edison Carneiro informants"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Edison Carneiro "Negros Bantus" (1937)',
  'Both Barbosa and Querido de Deus were key informants for Edison Carneiro''s research on capoeira de Angola. Carneiro acknowledged receiving "o mais efficiente concurso de Samuel Querido de Deus, Barbosa e Zeppelin, quanto a capoeira de Angola" for his book. Both participated in the capoeira demonstration at II Congresso Afro-Brasileiro in January 1937.',
  'Tanto Barbosa quanto Querido de Deus foram informantes-chave para a pesquisa de Edison Carneiro sobre capoeira de Angola. Carneiro reconheceu ter recebido "o mais efficiente concurso de Samuel Querido de Deus, Barbosa e Zeppelin, quanto a capoeira de Angola" para seu livro. Ambos participaram da demonstracao de capoeira no II Congresso Afro-Brasileiro em janeiro de 1937.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Cachoeira/Largo Dois de Julho'
  AND o.apelido = 'Querido de Deus'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Barbosa associated_with Cobrinha Verde
-- Barbosa brought students to Cobrinha Verde's roda
-- Both active in Salvador capoeira scene 1940s-1950s
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Barbosa brought students to Cobrinha Verde roda in Chame-Chame"}'::jsonb,
  'verified'::genealogy.confidence,
  'CECA official; Velhos Mestres; Capoeira Connection',
  'Barbosa brought João Pequeno to train at Cobrinha Verde''s roda in the Chame-Chame neighborhood of Salvador around 1943. This indicates a collegial relationship where Barbosa directed interested practitioners to established teachers.',
  'Barbosa levou João Pequeno para treinar na roda de Cobrinha Verde no bairro do Chame-Chame em Salvador por volta de 1943. Isso indica uma relacao de colegas onde Barbosa direcionava praticantes interessados a professores estabelecidos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Cachoeira/Largo Dois de Julho'
  AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Barbosa associated_with Onça Preta
-- Both participated in 1937 II Congresso Afro-Brasileiro
-- Contemporaries in Salvador capoeira scene
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "II Congresso Afro-Brasileiro participants 1937"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Edison Carneiro research',
  'Both Barbosa and Onca Preta participated in the capoeira demonstration at the II Congresso Afro-Brasileiro in Ribeira, Salvador on January 14, 1937. This historic event brought together the leading capoeiristas of the era for formal documentation of the art.',
  'Tanto Barbosa quanto Onca Preta participaram da demonstracao de capoeira no II Congresso Afro-Brasileiro em Ribeira, Salvador em 14 de janeiro de 1937. Este evento historico reuniu os principais capoeiristas da epoca para documentacao formal da arte.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Cachoeira/Largo Dois de Julho'
  AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Barbosa associated_with Juvenal - Played together at II Congresso Afro-Brasileiro 1937; historical photo exists. Needs Juvenal import first.
-- Barbosa associated_with Zeppelin - Both informants for Edison Carneiro's research. Needs Zeppelin import first.
-- Barbosa associated_with Menino Gordo - Present together at 1953 Roça do Lobo roda. Needs Menino Gordo import first.

-- ============================================================
-- INVERSE RELATIONSHIPS (where Barbosa is OBJECT)
-- These go in the subject's statement file, not here.
-- Listed for cross-reference only.
-- ============================================================
-- João Pequeno trained_under Barbosa - Barbosa taught João Pequeno ~1943-1945; introduced him to Cobrinha Verde's roda. → goes in joao-pequeno.sql

-- Source: statements/persons/bigodinho.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bigodinho
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Bigodinho is the SUBJECT.
-- ============================================================

-- Bigodinho student_of Waldemar (Primary teacher, 1950-1970)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-11',
  E'Bigodinho began training with Mestre Waldemar at the Barracão in Liberdade in 1950 when he moved to Salvador. He frequented the Barracão for over 25 years, becoming one of the most respected capoeiristas there. Left capoeira in 1970 due to repression.',
  E'Bigodinho começou a treinar com Mestre Waldemar no Barracão na Liberdade em 1950 quando se mudou para Salvador. Frequentou o Barracão por mais de 25 anos, tornando-se um dos capoeiristas mais respeitados ali. Deixou a capoeira em 1970 devido à repressão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bigodinho' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bigodinho trained_under Auvelino (Berimbau instruction, 1950)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"instruction_type": "berimbau"}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-bigodinho/',
  E'Auvelino, described as a "legendary berimbau master," taught Bigodinho the berimbau when he arrived in Salvador in 1950. This instruction was foundational to Bigodinho''s later fame as a berimbau player and singer.',
  E'Auvelino, descrito como um "lendário mestre de berimbau," ensinou berimbau a Bigodinho quando ele chegou em Salvador em 1950. Esta instrução foi fundamental para a fama posterior de Bigodinho como tocador de berimbau e cantor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bigodinho' AND o.apelido = 'Auvelino' AND o.apelido_context = 'Salvador'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Bigodinho associated_with Traíra
-- Both frequented Waldemar's Barracão together for years (1950s-1960s).
-- Traíra IS in the database (traira.sql exists), but statement should go in traira.sql
-- since we document from younger/newer to older/established, and Traíra started at
-- Waldemar's Barracão in 1947, before Bigodinho arrived in 1950.

-- Bigodinho associated_with Zacarias Boa Morte
-- Both frequented Waldemar's Barracão together. Zacarias was Waldemar's first student (1942).
-- Zacarias Boa Morte is NOT in the database - in persons backlog as pending.

-- Bigodinho associated_with Boca Rica
-- Recorded CD "Capoeira Angola" together (2000/2002). Both were from Pastinha/Waldemar generation.
-- Boca Rica is in backlog (pending import as Pastinha student).
-- Statement would be: associated_with, properties: association_context = "Recorded CD together"

-- Bigodinho associated_with Lua Rasta
-- Close friend who encouraged Bigodinho's return to capoeira in 1997, organized 2007 tribute.
-- Lua Rasta is NOT in the database - needs to be added to persons backlog.

-- Bigodinho founded Grupo Resistência
-- Founded/coordinated this group in Lapinha, Salvador in the 1960s.
-- Grupo Resistência is in groups backlog (pending import).

-- Bigodinho member_of Viva Bahia (Grupo Folclórico)
-- Participated in this folkloric group coordinated by Emília Biancardi.
-- Viva Bahia is in groups backlog (pending import).

-- Source: statements/persons/bom-nome.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bom Nome
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Bom Nome is the SUBJECT.
-- ============================================================

-- Bom Nome co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Classical texts of capoeira history',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Bom Nome' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Bom Nome.
-- No students documented.
-- ============================================================

-- Source: statements/persons/caicara.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Caiçara
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Caiçara is the SUBJECT.
-- ============================================================

-- Caiçara student_of Aberrê de Santo Amaro (1938-?)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27, capoeirawiki.org, cachoeirabahia.jethsys.com',
  'Caiçara began training under Mestre Aberrê de Santo Amaro at age 14 in 1938. Aberrê taught him "os segredos e mistérios da capoeiragem" (the secrets and mysteries of capoeira). Before Aberrê''s death, he passed his bengala (walking cane) to Caiçara, which became Caiçara''s trademark.',
  'Caiçara começou a treinar com Mestre Aberrê de Santo Amaro aos 14 anos em 1938. Aberrê ensinou-lhe "os segredos e mistérios da capoeiragem." Antes da morte de Aberrê, ele passou sua bengala para Caiçara, que se tornou a marca registrada de Caiçara.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Aberrê' AND o.apelido_context = 'Santo Amaro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara student_of Waldemar (1950s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27, capoeirawiki.org, capoeirahub.net',
  'Caiçara trained under Mestre Waldemar at the legendary Barracão in Liberdade, Salvador, during the 1950s. Sources particularly note his development of berimbau and singing skills, which made him famous as "a great singer" with a "contagious and hypnotic" voice. CapoeiraHub lists Waldemar as one of his primary teachers.',
  'Caiçara treinou com Mestre Waldemar no lendário Barracão na Liberdade, Salvador, durante os anos 1950. As fontes destacam particularmente seu desenvolvimento de habilidades de berimbau e canto, que o tornaram famoso como "um grande cantador" com voz "contagiante e hipnótica." CapoeiraHub lista Waldemar como um de seus professores principais.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Bimba (confrontation 1960s, reconciliation 1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '1972-11-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": {"en": "Rivalry and reconciliation. Caiçara challenged Bimba at Amaralina graduation event, was defeated by bênção (blessing kick) that broke his nose and lips. Reconciled in November 1972 before Bimba left Salvador.", "pt": "Rivalidade e reconciliação. Caiçara desafiou Bimba em evento de formatura em Amaralina, foi derrotado por uma bênção que quebrou seu nariz e lábios. Reconciliaram em novembro de 1972 antes de Bimba deixar Salvador."}}'::jsonb,
  'verified'::genealogy.confidence,
  'cachoeirabahia.jethsys.com, capoeirawiki.org',
  'Famous confrontation at Amaralina graduation event in the 1960s. Caiçara declared himself "the master" and was defeated by Bimba''s devastating bênção. Bimba''s response: "Isso é que é jogo de perna, meu filho" (That''s footwork, my son). In November 1972, Caiçara apologized: "I am Bahia''s third master after you and Mestre Pastinha. Forgive my arrogance; don''t leave. Bahia needs you."',
  'Famoso confronto em evento de formatura em Amaralina nos anos 1960. Caiçara declarou-se "o mestre" e foi derrotado pela devastadora bênção de Bimba. Resposta de Bimba: "Isso é que é jogo de perna, meu filho." Em novembro de 1972, Caiçara se desculpou: "Sou o terceiro mestre da Bahia depois de você e Mestre Pastinha. Perdoe minha arrogância; não vá embora. A Bahia precisa de você."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Traíra (work as political enforcers 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both worked as political enforcers for Salvador Mayor Antônio Carlos Magalhães in the 1960s. Also appeared together in 1954 film Vadiação.", "pt": "Ambos trabalharam como capangas políticos para o prefeito de Salvador Antônio Carlos Magalhães nos anos 1960. Também apareceram juntos no filme Vadiação de 1954."}}'::jsonb,
  'likely'::genealogy.confidence,
  'cachoeirabahia.jethsys.com, decapoeira.org',
  'Caiçara and Traíra worked together as political security/enforcers for Salvador Mayor Antônio Carlos Magalhães during the 1960s. Both were fellow Cachoeiranos (from the Cachoeira region). They also appeared together in the 1954 documentary "Vadiação."',
  'Caiçara e Traíra trabalharam juntos como seguranças/capangas políticos para o prefeito de Salvador Antônio Carlos Magalhães durante os anos 1960. Ambos eram cachoeiranos (da região de Cachoeira). Também apareceram juntos no documentário "Vadiação" de 1954.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with João Pequeno (documented photograph 1987)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres photographed together at capoeira events in Rio de Janeiro and Ouro Preto (1987).", "pt": "Mestres de Angola contemporâneos fotografados juntos em eventos de capoeira no Rio de Janeiro e Ouro Preto (1987)."}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Documented in photographs with João Pequeno, João Grande, Gato Preto, and Canjiquinha at various events. Appeared together at major capoeira events in Rio de Janeiro and Ouro Preto in 1987.',
  'Documentado em fotografias com João Pequeno, João Grande, Gato Preto e Canjiquinha em vários eventos. Apareceram juntos em grandes eventos de capoeira no Rio de Janeiro e Ouro Preto em 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with João Grande (contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres in Salvador capoeira scene. Photographed together at various events.", "pt": "Mestres de Angola contemporâneos na cena da capoeira de Salvador. Fotografados juntos em vários eventos."}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Photographed with João Grande at capoeira events. Both were major figures in the Salvador Angola capoeira scene.',
  'Fotografado com João Grande em eventos de capoeira. Ambos eram figuras importantes na cena da Capoeira Angola de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Gato Preto (contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres photographed together at capoeira events.", "pt": "Mestres de Angola contemporâneos fotografados juntos em eventos de capoeira."}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Photographed with Gato Preto at capoeira events. Both were major figures in the Salvador Angola capoeira scene.',
  'Fotografado com Gato Preto em eventos de capoeira. Ambos eram figuras importantes na cena da Capoeira Angola de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Canjiquinha (contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres, both reportedly trained under Aberrê (possibly different Aberrês per Two Aberrês theory). Photographed together at capoeira events.", "pt": "Mestres de Angola contemporâneos, ambos supostamente treinados sob Aberrê (possivelmente diferentes Aberrês conforme teoria dos Dois Aberrês). Fotografados juntos em eventos de capoeira."}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Both Caiçara and Canjiquinha claimed Aberrê as their teacher, though possibly different individuals (the "Two Aberrês" theory). Both denied connection to Pastinha''s lineage. Photographed together at capoeira events.',
  'Tanto Caiçara quanto Canjiquinha alegavam Aberrê como seu professor, embora possivelmente indivíduos diferentes (a teoria dos "Dois Aberrês"). Ambos negavam conexão com a linhagem de Pastinha. Fotografados juntos em eventos de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have objects that need to be imported first.
-- Once imported, create statements where THAT PERSON is the subject.
--
-- STUDENTS OF CAIÇARA (these go in their respective files as "X student_of Caiçara"):
-- - Mestre Limão (São Paulo) student_of Caiçara - pending import
-- - Mestre Wilson Sereno (Rio de Janeiro) student_of Caiçara - pending import
-- - Mestre Laercio (Berlin, Germany) student_of Caiçara - pending import
-- - Mestre Sabu/Sabú (Goiás) student_of Caiçara - pending import (same as in backlog)
-- - Mestre Fernandinho (Bahia) student_of Caiçara - pending import
-- - Mestre José de Freitas / Zé de Freitas (Alagoinhas, Bahia) student_of Caiçara - pending import
-- - Mestre Robertino da Hora (Salvador, Bahia) student_of Caiçara - pending import
-- - Mestre Valdomiro (Brazil) student_of Caiçara - pending import
--
-- NOTE: CapoeiraWiki lists "Sandrinha" as Caiçara's student, but other research
-- identifies her primary teacher as Mestre Roque. Do NOT add "Sandrinha student_of Caiçara"
-- unless clearer evidence emerges.
--
-- GROUP FOUNDED BY CAIÇARA:
-- - Caiçara founded Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara - needs group import
--
-- FILM ASSOCIATIONS (not genealogy statements but documented):
-- - 1954: Appeared in "Vadiação" with Bimba, Waldemar, Traíra, Curió
-- - 1982: Appeared in "The Spirit of Samba: Black Music of Brazil"

-- Source: statements/persons/canjiquinha.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Canjiquinha
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Canjiquinha is the SUBJECT.
-- ============================================================

-- Canjiquinha student_of Aberrê (1935-1942)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, esquiva.wordpress.com',
  'Canjiquinha began training under Aberrê at age 10 in 1935 at Baixa do Tubo, Matatu Pequeno. Training ended with Aberrê''s death in September 1942.',
  'Canjiquinha começou a treinar com Aberrê aos 10 anos em 1935 na Baixa do Tubo, Matatu Pequeno. O treinamento terminou com a morte de Aberrê em setembro de 1942.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Canjiquinha trained_under Pastinha (1950s - achieved contra-mestre rank)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com',
  'By 1950, Canjiquinha had become a contra-mestre under Mestre Pastinha. He participated in rodas at Pastinha''s academy and traveled with his group to Rio de Janeiro and Porto Alegre in 1959.',
  'Por volta de 1950, Canjiquinha havia se tornado contra-mestre sob Mestre Pastinha. Ele participou de rodas na academia de Pastinha e viajou com seu grupo para Rio de Janeiro e Porto Alegre em 1959.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Canjiquinha associated_with Waldemar (1986 recording partnership)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Recorded landmark LP together at Boca do Rio studio, Salvador. Both described as heirs of capoeira roots from Siri de Mangue and Aberrê.", "pt": "Gravaram LP marcante juntos no estúdio Boca do Rio, Salvador. Ambos descritos como herdeiros das raízes da capoeira de Siri de Mangue e Aberrê."}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1986, Discogs',
  'Canjiquinha and Waldemar recorded a 34-track LP on September 16, 1986 at Boca do Rio studio in Salvador. Liner notes by Mestre Itapoan described them as "heirs of the roots" from masters Siri de Mangue and Aberrê. Chorus included Mestres Itapoan, Suassuna, Ezequiel, and Geni.',
  'Canjiquinha e Waldemar gravaram um LP de 34 faixas em 16 de setembro de 1986 no estúdio Boca do Rio em Salvador. Notas do encarte por Mestre Itapoan os descreveu como "herdeiros das raízes" dos mestres Siri de Mangue e Aberrê. Coro incluiu Mestres Itapoan, Suassuna, Ezequiel e Geni.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canjiquinha' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have objects that need to be imported first.
-- Once imported, create statements where THAT PERSON is the subject.
--
-- STUDENTS OF CANJIQUINHA (these go in their respective files as "X student_of Canjiquinha"):
-- - Paulo dos Anjos (José Paulo dos Anjos) student_of Canjiquinha - pending import
-- - Geni (José Serafim Ferreira Junior, Madame Geni) student_of Canjiquinha - pending import
-- - Lua Rasta student_of Canjiquinha - already in backlog
-- - Mestre Brasília student_of Canjiquinha - pending import
-- - Antonio Diabo student_of Canjiquinha - pending import
-- - Victor Careca student_of Canjiquinha - pending import
-- - Robertão student_of Canjiquinha - pending import
-- - Manoel Pé de Bode student_of Canjiquinha - pending import
-- - Cristo Seco student_of Canjiquinha - pending import
-- - Burro Inchado student_of Canjiquinha - pending import
--
-- GROUPS FOUNDED/LED BY CANJIQUINHA:
-- - Canjiquinha founded Associação de Capoeira Canjiquinha e seus Amigos (1952) - needs group import
-- - Canjiquinha founded Academia de Canjiquinha e Seus Amigos (1988, Colina do Mar) - needs group import

-- Source: statements/persons/celso-do-engenho.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Celso do Engenho
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Celso do Engenho is the SUBJECT.
--
-- KEY RELATIONSHIPS:
-- - student_of Artur Emídio (confirmed by multiple sources)
-- - founded ACER (1973)
--
-- PENDING: Students João Marcos, Adilson Vitor, Sunil Ninjinho,
-- and Professor Bicudo are not yet in database.
-- ============================================================

-- Celso do Engenho student_of Artur Emídio
-- Confirmed by Wikipedia PT, capoeirahistory.com, velhosmestres.com
-- Training at Academia Artur Emídio in Bonsucesso, Rio de Janeiro
-- First saw roda de capoeira at Artur's academy in 1959
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/masters-in-rio-de-janeiro/, pt.wikipedia.org/wiki/Mestre_Celso',
  E'Celso trained at Artur Emídio''s academy in Bonsucesso alongside Leopoldina and Djalma Bandeira. He stated: "The first time I saw a capoeira roda was at Arthur Emídio''s academy in Praça Mauá, in 1959." A historic photo from the academy shows Celso standing with other students and mestres.',
  E'Celso treinou na academia de Artur Emídio em Bonsucesso junto com Leopoldina e Djalma Bandeira. Ele afirmou: "A primeira vez que eu vi uma roda de capoeira foi na academia de Arthur Emídio na Praça Mauá, em 1959." Uma foto histórica da academia mostra Celso em pé com outros alunos e mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Celso do Engenho' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Celso do Engenho founded ACER (1973)
--   - ACER (Associação de Capoeira Engenho da Rainha) not yet in groups table
--   - Add to groups-backlog.md for future import
--
-- STUDENTS (not yet in database):
-- - João Marcos - taught at Furgão club, Pilares (1969)
-- - Adilson Vitor - taught at Furgão club, Pilares (1969)
-- - Sunil Ninjinho - "one of the best students"
-- - Professor Bicudo - son, leads ACER UK
--
-- FAMILY:
-- - Luizão - nephew, capoeirista
--
-- ASSOCIATE:
-- - Cousin "Americano" - practiced tiririca at Ilha Grande
--   Note: May be same person as "Americano (Dois Rios)" already in DB
--   This relationship would be family_of if confirmed as same person
-- ============================================================

-- Source: statements/persons/cimento.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Cimento
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Cimento is the SUBJECT.
-- ============================================================

-- Cimento co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Cimento' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Cimento.
-- No students documented.
-- ============================================================

-- Source: statements/persons/cobra-mansa.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Cobra Mansa
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Cobra Mansa is the SUBJECT.
-- Relationships where Cobra Mansa is the OBJECT go in the
-- object's statement file (e.g., valmir.sql would have
-- "Valmir student_of Cobra Mansa").
-- ============================================================

-- Cobra Mansa student_of Moraes (primary teacher 1974-1986+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: capoeira.online, capoeirawiki.org, lalaue.com',
  'Primary teacher relationship. Cobra Mansa saw Moraes play in the Roda of Central Brazil in 1974 and became his student. Received mestre title from Moraes in 1986. Followed Moraes to Belo Horizonte (1979) and Salvador (1981).',
  'Relação de mestre principal. Cobra Mansa viu Moraes jogar na Roda do Central do Brasil em 1974 e se tornou seu aluno. Recebeu título de mestre de Moraes em 1986. Seguiu Moraes para Belo Horizonte (1979) e Salvador (1981).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa received_title_from Moraes (mestre 1986)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: capoeira.online, capoeirawiki.org, capoeirahistory.com',
  'Graduated to mestre by Moraes in 1986.',
  'Formado mestre por Moraes em 1986.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa trained_under João Grande (at GCAP mid-1980s)
-- After João Grande returned to teaching (convinced by Cobra Mansa and Moraes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1985-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: capoeira.online, joaogrande.org, nossa-tribo.com',
  'Cobra Mansa trained with João Grande at GCAP in the mid-1980s after helping convince him to return to teaching. This training contributed to preserving the direct Pastinha lineage through the Dois Joãos.',
  'Cobra Mansa treinou com João Grande no GCAP em meados dos anos 1980, após ajudar a convencê-lo a voltar a ensinar. Este treinamento contribuiu para preservar a linhagem direta de Pastinha através dos Dois Joãos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobra Mansa associated_with João Grande (convinced him to return to teaching)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Together with Moraes, convinced João Grande to return to teaching capoeira angola after his withdrawal following Pastinha''s death in 1981", "pt": "Junto com Moraes, convenceu João Grande a voltar a ensinar capoeira angola após seu afastamento seguindo a morte de Pastinha em 1981"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Wikipedia, joaogrande.org, nossa-tribo.com',
  'Cobra Mansa and Moraes found João Grande working at a gas station and convinced him to return to teaching. This happened in the mid-1980s.',
  'Cobra Mansa e Moraes encontraram João Grande trabalhando em um posto de gasolina e o convenceram a voltar a ensinar. Isso aconteceu em meados dos anos 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobra Mansa' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Cobra Mansa trained_under Josias da Silva (1973) - needs import
-- Cobra Mansa trained_under Raimundo (1973) - needs import
-- Cobra Mansa associated_with Rogerio Russo (co-founded Caxias Street Roda) - needs import
-- Cobra Mansa associated_with Peixinho de Caxias (co-founded Caxias Street Roda) - needs import
-- Cobra Mansa co_founded GCAP (1980/1981) - group not yet imported
-- Cobra Mansa founded FICA (1995/1996) - group not yet imported
-- Cobra Mansa founded Kilombo Tenondé (2004) - group not yet imported
-- Cobra Mansa departed_from GCAP (1995/1996) - group not yet imported
-- Cobra Mansa member_of Mukânda Capoeira Angola (2023) - group not yet imported

-- Source: statements/persons/dende-sfc.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Dendê (São Francisco do Conde)
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Dendê (SFC) is the SUBJECT.
-- ============================================================

-- Dendê (SFC) trained_under Siri de Mangue
-- Per Mário Buscapé's testimony: "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro from Santo Amaro."
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê trained with Siri de Mangue, one of Besouro Mangangá''s companions in the Recôncavo. This training connection is documented through the testimony of his nephew Mário Buscapé.',
  'Dendê treinou com Siri de Mangue, um dos companheiros de Besouro Mangangá no Recôncavo. Esta conexão de treinamento é documentada através do testemunho de seu sobrinho Mário Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) trained_under Neco Canário Pardo
-- Per Mário Buscapé's testimony about his father and uncle training with Canário Pardo
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê trained with Canário Pardo (Neco Canário Pardo), another of Besouro Mangangá''s companions in the Recôncavo. This is documented through Mário Buscapé''s testimony.',
  'Dendê treinou com Canário Pardo (Neco Canário Pardo), outro dos companheiros de Besouro Mangangá no Recôncavo. Isso é documentado através do testemunho de Mário Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) associated_with Besouro Mangangá
-- According to Mário, Besouro visited their family home; Dendê was part of Besouro's circle of companions
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Dendê trained with Besouro''s companions and according to Mário Buscapé, Besouro visited their family home. Part of the Recôncavo capoeira circle."}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Besouro Mangangá visited Dendê''s family home (before Mário was born). Dendê was part of the capoeira circle in the Recôncavo that included Besouro and his companions. Ended with Besouro''s death in 1924.',
  'Besouro Mangangá visitou a casa da família de Dendê (antes de Mário nascer). Dendê fazia parte do círculo da capoeira no Recôncavo que incluía Besouro e seus companheiros. Terminou com a morte de Besouro em 1924.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) family_of Mário Buscapé
-- Uncle and first capoeira teacher
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "uncle", "family_side": "unknown"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was the uncle of Mário Buscapé. Sources do not specify whether he was brother to Mário''s father José Bidel or to Mário''s mother Maria dos Anjos dos Santos.',
  'Dendê era tio de Mário Buscapé. As fontes não especificam se ele era irmão do pai de Mário, José Bidel, ou da mãe de Mário, Maria dos Anjos dos Santos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê (SFC) family_of José Bidel
-- Brothers who trained together with Besouro's companions and both taught Mário
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother", "details": "Brothers who both practiced capoeira and trained together with Besouro''s companions (Siri de Mangue, Canário Pardo); both taught capoeira to Mário Buscapé"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê and José Bidel were brothers. Both practiced capoeira and trained with companions of Besouro Mangangá. Together they taught capoeira to Mário Buscapé in improvised rodas in their family backyard.',
  'Dendê e José Bidel eram irmãos. Ambos praticavam capoeira e treinaram com companheiros de Besouro Mangangá. Juntos ensinaram capoeira a Mário Buscapé em rodas improvisadas no quintal da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context = 'São Francisco do Conde'
  AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/djalma-bandeira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Djalma Bandeira
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Djalma Bandeira is the SUBJECT.
-- Relationships where Djalma Bandeira is the OBJECT should be in
-- the statement files of the respective subjects.
-- ============================================================

-- [Djalma Bandeira] student_of [Artur Emídio]
-- Primary teacher-student relationship. Djalma was Artur Emídio's first student.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'Djalma Bandeira was Artur Emídio''s first student. After Artur abandoned the ring in 1957, "friends encouraged him to focus on teaching. His first student was Djalma Bandeira, who became a travel companion with whom Artur refined his skills." André Lacé Lopes compared their partnership to "Don Quixote and Sancho Panza."',
  E'Djalma Bandeira foi o primeiro aluno de Artur Emídio. Depois que Artur abandonou os ringues em 1957, "amigos o encorajaram a se concentrar no ensino. Seu primeiro aluno foi Djalma Bandeira, que se tornou um companheiro de viagem com quem Artur aprimorou suas habilidades." André Lacé Lopes comparou sua parceria a "Dom Quixote e Sancho Pança."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Djalma Bandeira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Djalma Bandeira] associated_with [Artur Emídio]
-- Performance partnership for international folklore shows
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "travel companion and performance partner for international folklore shows including Skindô, Capital Samba, and Arco-Íris"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'The two traveled together performing in shows on Brazilian popular culture, both responsible for the capoeira aspect. Working with producers Abraão Medina and Carlos Machado, they toured New York, Paris, Buenos Aires, Acapulco, and the Iberian Peninsula. Shows included "Capital Samba," "Skindô," and musical "Arco-Íris" featuring Joãozinho da Goméia, Ary Barroso, and Mestre Paraná.',
  E'Os dois viajavam juntos se apresentando em shows sobre cultura popular brasileira, ambos responsáveis pelo aspecto de capoeira. Trabalhando com os produtores Abraão Medina e Carlos Machado, excursionaram por Nova York, Paris, Buenos Aires, Acapulco e Península Ibérica. Os shows incluíram "Capital Samba," "Skindô" e o musical "Arco-Íris" com Joãozinho da Goméia, Ary Barroso e Mestre Paraná.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Djalma Bandeira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- [Djalma Bandeira] founded [Grupo de Capoeira Djalma Bandeira]
--   - Group needs to be imported first; founded at IAPC Residential Complex, Olaria
--
-- [Djalma Bandeira] associated_with [Lamartine Pereira]
--   - Navy capoeira course instructors (1961)
--   - Lamartine Pereira needs to be imported first
--
-- [Djalma Bandeira] associated_with [Leopoldina]
--   - Contemporary colleagues in Rio; performed together
--   - Leopoldina exists in DB; statement could be added if more evidence found
--   - Currently only documented as peers in "contemporary Rio generation"
--
-- Note: Students Vilmar and Celso Pepe should have statements in THEIR files
-- as "student_of Djalma Bandeira" - not here.
-- ============================================================

-- Source: statements/persons/dois-de-ouro.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Dois de Ouro
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Dois de Ouro is the SUBJECT.
-- ============================================================

-- Dois de Ouro co_founded Filhos de Angola (Rio 1960)
-- On July 21, 1960, Dois de Ouro co-founded this group with Mucungê,
-- Baleado, Onça Preta, Imagem do Cão, and Roque
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founded Grupo Filhos de Angola in Rio de Janeiro alongside Mucungê, Baleado, Onça Preta, Imagem do Cão, and Roque.',
  'Co-fundou o Grupo Filhos de Angola no Rio de Janeiro junto com Mucungê, Baleado, Onça Preta, Imagem do Cão e Roque.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.name = 'Filhos de Angola'
  AND COALESCE(o.name_context, '') = 'Rio 1960'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro member_of Associação Brasileira de Capoeira Angola
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://esquiva.wordpress.com/mestres/mestre-dois-de-ouro/',
  'Member of the Associação Brasileira de Capoeira Angola in Salvador, Bahia.',
  'Membro da Associação Brasileira de Capoeira Angola em Salvador, Bahia.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.name = 'Associação Brasileira de Capoeira Angola'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro associated_with Onça Preta (co-founded Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Filhos de Angola"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founder of Grupo Filhos de Angola alongside Onça Preta.',
  'Co-fundador do Grupo Filhos de Angola junto com Onça Preta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro associated_with Roque (co-founded Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Filhos de Angola"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founder of Grupo Filhos de Angola alongside Roque.',
  'Co-fundador do Grupo Filhos de Angola junto com Roque.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro associated_with Mucungê (co-founded Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Filhos de Angola"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founder of Grupo Filhos de Angola alongside Mucungê.',
  'Co-fundador do Grupo Filhos de Angola junto com Mucungê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Mucungê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Dois de Ouro associated_with Baleado - needs Baleado import first
-- Dois de Ouro associated_with Imagem do Cão - needs Imagem do Cão import first
-- ============================================================
-- STUDENT RELATIONSHIPS (where Dois de Ouro is the OBJECT)
-- These should go in the student's file, NOT here:
-- ============================================================
-- Bira de Oxóssi student_of Dois de Ouro - goes in bira-de-oxossi.sql
-- Sergio Ferreira trained_under Dois de Ouro - goes in sergio-ferreira.sql
-- Mestre Trovoada [relationship unclear] Dois de Ouro - needs research

-- Source: statements/persons/edgar.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Edgar (Dois Rios)
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Edgar is the SUBJECT.
-- ============================================================

-- Edgar associated_with Sete Coroas (fellow prisoners at Dois Rios)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Both identified as capoeira rogues imprisoned at Dois Rios Correctional Colony on Ilha Grande", "pt": "Ambos identificados como malandros capoeiras presos na Colônia Correcional de Dois Rios na Ilha Grande"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.',
  'Mentioned together in Madame Satã''s prison memoirs as capoeira rogues at Dois Rios. Sete Coroas was from Bahia.',
  'Mencionados juntos nas memórias de prisão de Madame Satã como malandros capoeiras em Dois Rios. Sete Coroas era da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edgar' AND COALESCE(s.apelido_context, '') = 'Dois Rios'
  AND o.apelido = 'Sete Coroas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Edgar associated_with Americano (fellow prisoners at Dois Rios)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Both identified as capoeira rogues imprisoned at Dois Rios Correctional Colony on Ilha Grande", "pt": "Ambos identificados como malandros capoeiras presos na Colônia Correcional de Dois Rios na Ilha Grande"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paezzo, Sylvan. "Memórias de Madame Satã." Rio de Janeiro: Lidador, 1972.',
  'Mentioned together in Madame Satã''s prison memoirs as capoeira rogues at Dois Rios.',
  'Mencionados juntos nas memórias de prisão de Madame Satã como malandros capoeiras em Dois Rios.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edgar' AND COALESCE(s.apelido_context, '') = 'Dois Rios'
  AND o.apelido = 'Americano' AND COALESCE(o.apelido_context, '') = 'Dois Rios'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS
-- ============================================================
-- No teacher-student relationships documented for Edgar.
-- No students documented.
-- Madame Satã was not his teacher; they were fellow prisoners.
-- ============================================================

-- Source: statements/persons/feliciano-bigode-de-seda.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Feliciano Bigode de Seda
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Feliciano Bigode de Seda is the SUBJECT.
-- ============================================================

-- Feliciano Bigode de Seda co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Feliciano Bigode de Seda' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Feliciano Bigode de Seda.
-- No students documented.
-- ============================================================

-- Source: statements/persons/forro.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Forró
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Forró is the SUBJECT.
-- ============================================================

-- Forró student_of Marrom (Rio de Janeiro)
-- Primary teacher-student relationship; trained in Rio de Janeiro
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://forum-brasil.de/capoeira/, oral history',
  'Trained under Mestre Marrom in Rio de Janeiro during his ~15-20 years in the city. Part of the Marrom Capoeira & Alunos / Ngoma community.',
  'Treinou sob Mestre Marrom no Rio de Janeiro durante seus ~15-20 anos na cidade. Parte da comunidade Marrom Capoeira & Alunos / Ngoma.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Forró' AND s.apelido_context IS NULL
  AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Forró received_title_from Marrom (Contra-Mestre title, 2004)
-- Conferral of Contra-Mestre title in Rio de Janeiro
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2004-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre", "location": "Rio de Janeiro, Brazil"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Oral history (user confirmation)',
  'Made Contra-Mestre by Mestre Marrom in Rio de Janeiro in 2004.',
  'Feito Contra-Mestre por Mestre Marrom no Rio de Janeiro em 2004.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Forró' AND s.apelido_context IS NULL
  AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Forró founded Aldeia de Angola - group not yet imported
-- Forró teaches_at Ngoma Capoeira Angola (Berlin) - group not yet imported
-- Forró teaches_at Forum Brasil Berlin - group not yet imported (not a capoeira group)
-- Forró cultural_pioneer_of Germany (Hannover) - would need group/region entity

-- Source: statements/persons/gato-preto.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Gato Preto
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Gato Preto is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Gato Preto student_of Cobrinha Verde
-- Primary mentor from age 17 in Salvador (1947)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki; multiple sources',
  'At seventeen (1947), Gato Preto moved to Salvador and became a disciple of Mestre Cobrinha Verde, also from Santo Amaro. This was his primary mentor relationship. Later served as contra-mestre de bateria at Cobrinha Verde''s academy (1952-1954). Relationship continued until Cobrinha Verde''s death in 1983.',
  'Aos dezessete anos (1947), Gato Preto mudou-se para Salvador e tornou-se discípulo de Mestre Cobrinha Verde, também de Santo Amaro. Esta foi sua principal relação de mentoria. Depois serviu como contra-mestre de bateria na academia de Cobrinha Verde (1952-1954). O relacionamento continuou até a morte de Cobrinha Verde em 1983.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto trained_under Waldemar
-- Trained under Waldemar da Paixão; frequented his barracão
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraWiki; velhosmestres.com; Capoeira Online',
  'Gato Preto trained under Mestre Waldemar da Paixão. The 1962 LP "Capoeira" was recorded at Waldemar''s barracão. Waldemar described him as "a good fellow" and noted his father Eutíquio was "a good capoeira master."',
  'Gato Preto treinou com Mestre Waldemar da Paixão. O LP "Capoeira" de 1962 foi gravado no barracão de Waldemar. Waldemar o descreveu como "um bom sujeito" e observou que seu pai Eutíquio era "um bom mestre de capoeira."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto trained_under Pastinha
-- Served as contra-mestre de bateria (1950-1951)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  '1951-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki',
  'Gato Preto served as contra-mestre de bateria (assistant master of the percussion ensemble) at Mestre Pastinha''s academy from 1950-1951. Later accompanied Pastinha to Dakar in 1966 as part of the Brazilian delegation.',
  'Gato Preto serviu como contra-mestre de bateria na academia de Mestre Pastinha de 1950-1951. Depois acompanhou Pastinha a Dacar em 1966 como parte da delegação brasileira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Traíra
-- Recorded LP "Capoeira" together (1962)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Recorded LP ''Capoeira'' together (1962) at Waldemar''s barracão with Cobrinha Verde; contemporaries in Salvador Angola capoeira scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/gato-1962; multiple sources',
  'Recorded historic LP "Capoeira" (1962) together with Traíra and Cobrinha Verde at Mestre Waldemar''s barracão. Photos taken at Rampa do Mercado Modelo. Both were prominent angoleiros in Salvador.',
  'Gravaram juntos o histórico LP "Capoeira" (1962) com Traíra e Cobrinha Verde no barracão de Mestre Waldemar. Fotos tiradas na Rampa do Mercado Modelo. Ambos eram angoleiros proeminentes em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Bimba
-- Contemporaries in Salvador; compared to legendary masters
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Contemporaries in Salvador capoeira scene; 1976 article described Gato Preto as comparable to legendary masters Bimba, Pastinha, Cobrinha Verde, and Besouro"}'::jsonb,
  'likely'::genealogy.confidence,
  'Correio Braziliense 1976; velhosmestres.com',
  'Contemporaries in Salvador. A 1976 newspaper article described Gato Preto as comparable to legendary masters Bimba, Pastinha, Cobrinha Verde, and Besouro.',
  'Contemporâneos em Salvador. Um artigo de jornal de 1976 descreveu Gato Preto como comparável aos lendários mestres Bimba, Pastinha, Cobrinha Verde e Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Gato Preto associated_with Besouro Mangangá
-- Connected through uncle João Catarino (Besouro's student)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Connected through lineage: Gato Preto''s uncle João Catarino was a student of Besouro Mangangá; both from Santo Amaro da Purificação"}'::jsonb,
  'likely'::genealogy.confidence,
  'CapoeiraWiki; velhosmestres.com',
  'Gato Preto''s uncle João Catarino was a student of Besouro Mangangá. Both Besouro and Gato Preto were from Santo Amaro da Purificação. Through his uncle, Gato Preto inherited some of Besouro''s teachings.',
  'O tio de Gato Preto, João Catarino, era aluno de Besouro Mangangá. Tanto Besouro quanto Gato Preto eram de Santo Amaro da Purificação. Através de seu tio, Gato Preto herdou alguns dos ensinamentos de Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato Preto' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- PERSON RELATIONSHIPS - TEACHERS (not in dataset)

-- Gato Preto student_of Eutíquio Lúcio Góes (father) - PENDING
-- His father taught him from age 8 (1938) until the powerful cabeçada incident
-- Object 'Eutíquio Lúcio Góes' needs import - add to backlog? Historical figure, not mestre

-- Gato Preto trained_under João Catarino (uncle) - PENDING
-- Uncle, student of Besouro Mangangá, continued teaching after father stopped
-- Object 'João Catarino' needs import - add to backlog

-- Gato Preto trained_under Léo (Mestre Léo from São Braz) - PENDING
-- Trained with Léo in São Braz from 1942
-- Object 'Léo' needs import - add to backlog

-- PERSON RELATIONSHIPS - STUDENTS (not in dataset)

-- Note: Student relationships go in the STUDENT's file per ownership rule.
-- These students need to be imported and their files should contain:
-- - Mestre Mau (Marcelino) student_of Gato Preto
-- - Mestre Boa Gente student_of Gato Preto
-- - Contramestre Pinguim student_of Gato Preto
-- - Mestre Zeca (son) student_of Gato Preto
-- - Mestre Gato II (Sinésio, son) student_of Gato Preto
-- - Mestre Zé Baiano trained_under Gato Preto (from 1984)

-- PERSON RELATIONSHIPS - ASSOCIATES (not in dataset)

-- Gato Preto associated_with João Grande - PENDING
-- Part of Dakar 1966 delegation together; contemporaries at CECA
-- Object 'João Grande' needs import - see persons-backlog.md

-- Gato Preto associated_with Gildo Alfinete - PENDING
-- Part of Dakar 1966 delegation together
-- Object 'Gildo Alfinete' needs import

-- Gato Preto associated_with Roberto Satanás - PENDING
-- Part of Dakar 1966 delegation together; performed capoeira alongside each other
-- Object 'Roberto Satanás' needs import

-- Gato Preto associated_with Camafeu de Oxossi - PENDING
-- Part of Dakar 1966 delegation; played berimbau at festival
-- Object 'Camafeu de Oxossi' needs import

-- Gato Preto associated_with Canjiquinha - PENDING
-- Competed against Canjiquinha for Berimbau de Ouro (1970)
-- Object 'Canjiquinha' needs import - see persons-backlog.md

-- Gato Preto associated_with Vermelho 27 - PENDING
-- Competed against Vermelho 27 for Berimbau de Ouro (1970)
-- Object 'Vermelho 27' needs import - see persons-backlog.md

-- GROUP RELATIONSHIPS (not in dataset)

-- Gato Preto founded Academia de Capoeira Baiana - PENDING
-- Founded his own academy in 1955
-- Group needs import

-- Gato Preto teaches_at CECA - PENDING
-- Served as contra-mestre de bateria at Pastinha's academy (1950-1951)
-- Group 'CECA' needs import - see groups-backlog.md

-- Gato Preto teaches_at Centro Esportivo de Capoeira Angola Dois de Julho - PENDING
-- Served as contra-mestre de bateria at Cobrinha Verde's academy (1952-1954)
-- Group needs import - see groups-backlog.md

-- Source: statements/persons/geraldo-pe-de-abelha.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Geraldo Pé de Abelha
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Geraldo Pé de Abelha is the SUBJECT.
-- ============================================================

-- Geraldo Pé de Abelha co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Geraldo Pé de Abelha' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Geraldo Pé de Abelha.
-- No students documented.
-- ============================================================

-- Source: statements/persons/henrique-cara-queimada.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Henrique Cara Queimada
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Henrique Cara Queimada is the SUBJECT.
-- ============================================================

-- Henrique Cara Queimada co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Cara Queimada' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Henrique Cara Queimada.
-- No students documented.
-- ============================================================

-- Source: statements/persons/imagem-do-cao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Imagem do Cão
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Imagem do Cão is the SUBJECT.
--
-- NOTE: Imagem do Cão has minimal documentation. The only confirmed
-- relationship is as co-founder of Grupo Filhos de Angola (1960).
-- No teachers, students, or other relationships are documented.
-- ============================================================

-- Imagem do Cão co_founded Grupo Filhos de Angola (Rio 1960)
-- NOTE: Group not yet in dataset - pending import from groups-backlog.md
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'co_founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   '1960-07-21'::date, 'exact'::genealogy.date_precision,
--   NULL, NULL,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'velhosmestres.com/br/destaques-51',
--   'Co-founded Grupo Filhos de Angola in Rio de Janeiro on July 21, 1960 together with Mucungê, Dois de Ouro, Baleado, Onça Preta, and Roque',
--   'Co-fundou o Grupo Filhos de Angola no Rio de Janeiro em 21 de julho de 1960 junto com Mucungê, Dois de Ouro, Baleado, Onça Preta e Roque'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Imagem do Cão' AND o.name = 'Filhos de Angola (Rio 1960)'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Imagem do Cão co_founded Filhos de Angola (Rio 1960) - group pending import
--
-- ============================================================
-- UNKNOWN RELATIONSHIPS (not documented)
-- ============================================================
-- No teachers documented
-- No students documented
-- No training companions documented (may have trained with Filhos de Angola co-founders)
-- Possibly participated in Roda da Central (1950s-1983) but not confirmed

-- Source: statements/persons/isidio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Isídio
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Isídio is the SUBJECT.
--
-- NOTE: There are no confirmed relationships where Isídio is the subject.
-- The only documented connection is that Cobrinha Verde obtained patuá
-- materials FROM Isídio, meaning Cobrinha Verde is the subject of that
-- relationship. That statement belongs in cobrinha-verde.sql.
-- ============================================================

-- NO STATEMENTS TO GENERATE
--
-- Isídio's role was passive/recipient: he provided materials to Cobrinha Verde.
-- The relationship direction is: Cobrinha Verde → obtained_materials_from → Isídio
-- However, "obtained_materials_from" is not a valid predicate in our schema.
--
-- The most appropriate modeling is:
-- - Isídio associated_with Tio Pascoal (if they were fellow practitioners)
-- - However, this is speculative - we only know Pascoal knew of Isídio
--
-- Given the uncertainty, no statements are generated for Isídio.
-- His existence is documented but relationships are uncertain.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset OR uncertain)
-- ============================================================
-- Isídio associated_with Tio Pascoal - SPECULATIVE: Pascoal knew how to
--   direct Cobrinha Verde to Isídio, suggesting a connection, but the
--   nature of this connection is unknown. Could be: teacher-student,
--   fellow practitioners, members of same religious brotherhood, or
--   simply acquaintances within the mandingueiro network.
--   NOT GENERATING due to insufficient evidence.

-- Source: statements/persons/joao-de-toto.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: João de Totó
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where João de Totó is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- --- Person-to-Person: Associations ---

-- João de Totó associated_with Nascimento Grande
-- Both were prominent valentões of Recife carnival in late 1800s/early 1900s
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both were valentões of Recife carnival, mentioned together as the most feared capoeiristas. Of all the valentões—Jovino dos Coelhos, Nicolau do Poço, João de Totó—Nascimento Grande was the most feared."}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  'Both were prominent valentões of Recife carnival who performed in front of carnival bands.',
  'Ambos eram valentões proeminentes do carnaval do Recife que se apresentavam na frente das bandas de carnaval.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João de Totó' AND o.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- João de Totó associated_with Valdevino - arrested together during police campaigns
-- (requires Valdevino import first)

-- Source: statements/persons/joao-grande.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: João Grande
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where João Grande is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- João Grande student_of Pastinha
-- Primary formal teacher from 1953 until Pastinha's death 1981
-- Became one of "the two most learned students" with João Pequeno
-- Diploma received 1968
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia; NEA; Smithsonian; Velhos Mestres; multiple sources',
  'João Grande joined Pastinha''s academy at the Cardeal Pequeno neighborhood of Brotas in 1953 at age 20. João Pequeno had been training with Pastinha for two years prior. Pastinha named him one of "the two most learned students" alongside João Pequeno. In 1970, Pastinha prophesied: "They will be the great capoeiras of the future." Received diploma in 1968. Relationship ended with Pastinha''s death Nov 13, 1981.',
  'João Grande ingressou na academia de Pastinha no bairro Cardeal Pequeno de Brotas em 1953 aos 20 anos. João Pequeno já treinava com Pastinha há dois anos antes. Pastinha o nomeou um dos "dois alunos mais preparados" junto com João Pequeno. Em 1970, Pastinha profetizou: "Eles serão os grandes capoeiras do futuro." Recebeu diploma em 1968. Relação terminou com a morte de Pastinha em 13/11/1981.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande received_title_from Pastinha
-- Diploma (mestre recognition) received in 1968
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "diploma conferral"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia; NEA; Smithsonian; Velhos Mestres',
  'João Grande was awarded his diploma of capoeira from Pastinha in 1968, making him a full-fledged mestre of capoeira angola. This was the formal recognition of his mastery after 15 years of training.',
  'João Grande recebeu seu diploma de capoeira de Pastinha em 1968, tornando-o mestre completo de capoeira angola. Este foi o reconhecimento formal de sua maestria após 15 anos de treinamento.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande trained_under Cobrinha Verde
-- Learned floor-touching mandinga movements from him
-- Also attended his rodas before/during Pastinha academy period
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Velhos Mestres; Lalaue; Nossa Tribo; CapoeiraHub',
  'When João Grande arrived in Salvador in 1953, he witnessed his first roda where Cobrinha Verde was present as "one of the most skillful players of that era." Cobrinha Verde was responsible for introducing the act of touching the floor many times as if making sorcery or asking for protection—this floor-touching mandinga movement was later spread by João Grande, who had learned it from Cobrinha Verde. Cobrinha Verde also "shared the work with Mestre Pastinha, where he passed on his knowledge to his students, which included the future masters, João Grande and João Pequeno."',
  'Quando João Grande chegou em Salvador em 1953, testemunhou sua primeira roda onde Cobrinha Verde estava presente como "um dos jogadores mais habilidosos daquela época." Cobrinha Verde foi responsável por introduzir o ato de tocar o chão muitas vezes como se fizesse feitiçaria ou pedisse proteção—esse movimento de mandinga de tocar o chão foi depois difundido por João Grande, que o aprendeu de Cobrinha Verde. Cobrinha Verde também "dividia o trabalho com Mestre Pastinha, onde passou seu conhecimento para seus alunos, que incluíam os futuros mestres, João Grande e João Pequeno."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande trained_under Barbosa
-- Met Barbosa upon arriving in Salvador 1953
-- Barbosa directed him toward João Pequeno and Pastinha
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '1953-12-31'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Nossa Tribo; Revista Pesquisa Fapesp; Wikipedia',
  'When João Grande arrived in Salvador at age 20, he met Mestre Barbosa at the roda at Roca do Lobo. He asked Barbosa if he could study capoeira, and Barbosa sent him to João Pequeno, who then sent him to Mestre Pastinha. This was João Grande''s first contact with organized capoeira in Salvador.',
  'Quando João Grande chegou em Salvador aos 20 anos, conheceu Mestre Barbosa na roda de Roca do Lobo. Perguntou a Barbosa se poderia estudar capoeira, e Barbosa o enviou a João Pequeno, que então o enviou a Mestre Pastinha. Este foi o primeiro contato de João Grande com a capoeira organizada em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande'
  AND o.apelido = 'Barbosa' AND o.apelido_context = 'Cachoeira/Largo Dois de Julho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande associated_with João Pequeno
-- Fellow student of Pastinha; the "two most learned students"
-- Together became principal heirs of Angola tradition
-- Traveled together to Dakar 1966
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow students of Pastinha; together they were the two principal heirs of the Angola tradition"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia; NEA; Smithsonian; Velhos Mestres; CECA official',
  'João Pequeno had been training with Pastinha for two years when João Grande arrived. João Pequeno directed João Grande to Pastinha''s academy. Together they became Pastinha''s "two most learned students." In 1970, Pastinha declared: "They will be the great capoeiras of the future and for this I worked and fought with them and for them. They will be true masters, not improvised teachers." Both traveled to Dakar 1966 with Pastinha. When Pastinha grew blind, the two Joãos ran the academy together. João Grande was nicknamed to distinguish him from the shorter João Pequeno.',
  'João Pequeno já treinava com Pastinha há dois anos quando João Grande chegou. João Pequeno direcionou João Grande para a academia de Pastinha. Juntos tornaram-se os "dois alunos mais preparados" de Pastinha. Em 1970, Pastinha declarou: "Eles serão os grandes capoeiras do futuro e para isso trabalhei e lutei com eles e por eles. Serão mestres mesmo, não professores de improviso." Ambos viajaram para Dakar 1966 com Pastinha. Quando Pastinha ficou cego, os dois Joãos dirigiam a academia juntos. João Grande recebeu o apelido para distingui-lo do mais baixo João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Grande associated_with Gato Preto
-- Traveled together to Dakar 1966 as part of Brazilian delegation
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow members of Brazilian delegation to 1966 Dakar Festival of Black Arts"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Wikipedia; Smithsonian',
  'João Grande and Gato Preto traveled together as part of the six-person Brazilian capoeira delegation to the First World Festival of Black Arts in Dakar, Senegal, April 1-24, 1966. The delegation included Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. Photos show them performing together at Daniel Soreno Theatre.',
  'João Grande e Gato Preto viajaram juntos como parte da delegação brasileira de seis capoeiristas para o Primeiro Festival Mundial de Artes Negras em Dakar, Senegal, 1-24 de abril de 1966. A delegação incluía Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Fotos mostram-nos se apresentando juntos no Teatro Daniel Soreno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Grande' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- João Grande associated_with Roberto Satanás - Traveled together to Dakar 1966. Needs import first.
-- João Grande associated_with Gildo Alfinete - Traveled together to Dakar 1966. Needs import first.
-- João Grande associated_with Camafeu de Oxossi - Traveled together to Dakar 1966. Needs import first.
-- João Grande associated_with Menino Gordo - Present at first roda João Grande witnessed in Salvador. Needs import first.
-- João Grande member_of Viva Bahia - Toured Europe/Middle East 1970s with Emília Biancardi's folk group. Group not in dataset.
-- João Grande member_of GCAP - Taught with Grupo Capoeira Angola Pelourinho mid-1980s after coming out of retirement. Group not in dataset.
-- João Grande founded Capoeira Angola Center - Founded 1990 in New York City. Group not in dataset.
-- João Grande student (Moraes) - RESOLVED: see moraes.sql (Moraes student_of João Grande)
-- João Grande student (Cobra Mansa) - RESOLVED: see cobra-mansa.sql (Cobra Mansa trained_under João Grande)
-- João Grande student (Jurandir Santos) - Listed as his son and student per CapoeiraHub. Jurandir not yet imported.
-- João Grande student (Marquinho) - Student who began training in 2000 per CapoeiraHub. Marquinho not yet imported.

-- Source: statements/persons/joao-pequeno.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: João Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where João Pequeno is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- João Pequeno student_of Pastinha
-- Primary formal teacher from ~1945 until Pastinha's death 1981
-- Promoted to treinel ~1945, became one of two principal heirs
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia; CECA official; Portal Capoeira; multiple sources',
  'João Pequeno joined Pastinha''s academy ~1943-1945, was promoted to treinel shortly after. Pastinha named him one of "the two most learned students" alongside João Grande. In 1970, Pastinha prophesied: "They will be the great capoeiras of the future." Relationship ended with Pastinha''s death Nov 13, 1981.',
  'João Pequeno ingressou na academia de Pastinha ~1943-1945, foi promovido a treinel pouco depois. Pastinha o nomeou um dos "dois alunos mais preparados" junto com João Grande. Em 1970, Pastinha profetizou: "Eles serão os grandes capoeiras do futuro." Relação terminou com a morte de Pastinha em 13/11/1981.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno trained_under Cobrinha Verde
-- Attended Cobrinha Verde's roda before joining Pastinha
-- Intermediate training ~1943, introduced by Barbosa
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CECA official; Portal Capoeira; multiple sources',
  'After arriving in Salvador in January 1943, João Pequeno attended Cobrinha Verde''s roda in Chame-Chame neighborhood, introduced by Barbosa. This was before joining Pastinha''s academy.',
  'Após chegar em Salvador em janeiro de 1943, João Pequeno frequentou a roda de Cobrinha Verde no bairro do Chame-Chame, apresentado por Barbosa. Isso foi antes de ingressar na academia de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno family_of Besouro Mangangá
-- Besouro was João Pequeno's father's cousin
-- First cousin once removed relationship
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "first_cousin_once_removed", "through": "father"}'::jsonb,
  'verified'::genealogy.confidence,
  'CECA official; Wikipedia; Portal Capoeira',
  'Besouro Mangangá was João Pequeno''s father''s cousin. João Pequeno himself stated: "Besouro Preto, de Santo Amaro was my father''s (Maximiano Pereira dos Santos) cousin."',
  'Besouro Mangangá era primo do pai de João Pequeno. O próprio João Pequeno afirmou: "Besouro Preto, de Santo Amaro era primo do meu pai (Maximiano Pereira dos Santos)."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno trained_under Barbosa
-- First formal training in Salvador (~1943)
-- Barbosa introduced him to Cobrinha Verde's roda
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CECA official; Velhos Mestres; Capoeira Connection',
  'João Pequeno''s capoeira learning "did not begin in an academy but with the carrier Barbosa from Largo Dois de Julho, who would take me to train and there was always a capoeira roda." Barbosa initiated João into capoeira and later took him to Cobrinha Verde''s roda in Chame-Chame.',
  'O aprendizado de capoeira de João Pequeno "não iniciou em academia e sim com o carregador Barbosa, do Largo Dois de Julho, que me levava pra treinar e sempre tinha roda de capoeira." Barbosa iniciou João na capoeira e depois o levou para a roda de Cobrinha Verde no Chame-Chame.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno'
  AND o.apelido = 'Barbosa' AND o.apelido_context = 'Cachoeira/Largo Dois de Julho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- João Pequeno trained_under Juvêncio
-- First capoeira teacher at Fazenda São Pedro, Mata de São João
-- Informal training ~1933-1943 while working on sugar cane plantation
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1933-01-01'::date, 'year'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CECA official; Portal Capoeira; Wikipedia PT; multiple sources',
  'João Pequeno''s first exposure to capoeira. At Fazenda São Pedro in Mata de São João, where he worked as a cattle herder for ten years (1933-1943), he met Juvêncio, a blacksmith and capoeirista, who introduced him to the art.',
  'Primeiro contato de João Pequeno com a capoeira. Na Fazenda São Pedro em Mata de São João, onde trabalhou como chamador de boi por dez anos (1933-1943), conheceu Juvêncio, um ferreiro e capoeirista, que o apresentou à arte.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Pequeno'
  AND o.apelido = 'Juvêncio' AND o.apelido_context = 'São Félix'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- João Pequeno associated_with João Grande - Fellow student of Pastinha, together they were the "two most learned students." Needs import first.
-- João Pequeno associated_with Gato Preto - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno associated_with Roberto Satanás - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno associated_with Gildo Alfinete - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno associated_with Camafeu de Oxossi - Traveled together to Dakar 1966. Needs import first (in backlog).
-- João Pequeno founded CECA (Centro Esportivo de Capoeira Angola) - Re-founded May 2, 1982 at Forte Santo Antônio. Group needs import first.
-- João Pequeno received_title_from Pastinha - Received mestre recognition. Exact date unknown.

-- Source: statements/persons/joel-lourenco.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Joel Lourenço
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Joel Lourenço is the SUBJECT.
-- ============================================================

-- NOTE: Joel Lourenço's teacher is UNKNOWN. No documentation found
-- about who taught him capoeira in Bahia. Edison Carneiro's 1953
-- article describes him as having "herança espiritual de Angola"
-- but does not specify lineage.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or unknown)
-- ============================================================
-- Joel Lourenço student_of [UNKNOWN] - No teacher documented
-- Joel Lourenço associated_with Felipe da Encarnação - Felipe recorded on his 1977 album; needs import first
-- Joel Lourenço associated_with Antenor dos Santos - Father-in-law, Portela samba school; NOT a capoeirista, do not import

-- ============================================================
-- STATEMENTS WHERE JOEL LOURENÇO IS OBJECT (for reference)
-- These go in the SUBJECT's file, not here:
-- ============================================================
-- Onça Preta member_of Joel Lourenço's group (1962) - goes in onca-preta.sql
-- Paraná associated_with Joel Lourenço (O Pagador de Promessas 1962) - already noted in parana.sql

-- Source: statements/persons/jose-bidel.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: José Bidel
-- Generated: 2025-12-16
-- ============================================================
-- This file contains all relationships where José Bidel is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- José Bidel associated_with Besouro Mangangá
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Besouro visited José Bidel''s house according to Mário Buscapé; José Bidel trained with Besouro''s companions (Siri de Mangue, Canário Pardo) in the Recôncavo network"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony via capoeirahistory.com; capoeira-toulouse.fr',
  'Besouro visited the family home before Mário was born (pre-1924). José Bidel belonged to the network of capoeiristas connected to Besouro in the Recôncavo.',
  'Besouro visitou a casa da família antes de Mário nascer (pré-1924). José Bidel pertencia à rede de capoeiristas conectados a Besouro no Recôncavo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- José Bidel associated_with Siri de Mangue
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Training companions in the Recôncavo network; both from São Francisco do Conde/Santo Amaro region; part of Besouro''s extended circle"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé direct testimony: "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro from Santo Amaro"',
  'Training companions in the Recôncavo. Both worked in water-related professions (crabber and boatman) and practiced capoeira.',
  'Companheiros de treino no Recôncavo. Ambos trabalhavam em profissões relacionadas à água (catador de caranguejo e barqueiro) e praticavam capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- José Bidel associated_with Neco Canário Pardo
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Training companions in the Recôncavo network; both associated with Besouro''s circle in Santo Amaro region"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé direct testimony: "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro from Santo Amaro"',
  'Training companions in the Recôncavo. José Bidel trained with Canário Pardo, who was known as both a capoeirista and machete teacher.',
  'Companheiros de treino no Recôncavo. José Bidel treinou com Canário Pardo, que era conhecido tanto como capoeirista quanto professor de facão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- José Bidel family_of Mário Buscapé (father-son)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "father", "details": "José Bidel taught capoeira to his son Mário alongside his brother Dendê in improvised rodas in their backyard"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé direct testimony via capoeirahistory.com',
  'José Bidel was the father of Mário Buscapé. Along with his brother Dendê, he taught capoeira to Mário starting at age 8 in backyard rodas.',
  'José Bidel era o pai de Mário Buscapé. Junto com seu irmão Dendê, ensinou capoeira a Mário a partir dos 8 anos em rodas no quintal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/jovino-dos-coelhos.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Jovino dos Coelhos
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Jovino dos Coelhos is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- --- Person-to-Person: Associations ---

-- Jovino dos Coelhos associated_with Nascimento Grande
-- Both were prominent valentões of Recife carnival in late 1800s/early 1900s
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  '1909-07-05'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both were valentões of Recife carnival, mentioned together as the most feared capoeiristas. Of all the valentões—Jovino dos Coelhos, Nicolau do Poço, João de Totó—Nascimento Grande was the most feared."}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942); Oscar Mello, "Recife Sangrento" (1937)',
  'Both were prominent valentões of Recife carnival who performed in front of carnival bands. Ended with Jovino''s death on July 5, 1909.',
  'Ambos eram valentões proeminentes do carnaval do Recife que se apresentavam na frente das bandas de carnaval. Terminou com a morte de Jovino em 5 de julho de 1909.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jovino dos Coelhos' AND o.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Jovino dos Coelhos associated_with Valdevino - arrested together during police campaigns
-- (requires Valdevino import first)

-- Source: statements/persons/julio-franca.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Júlio França
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Júlio França is the SUBJECT.
-- ============================================================

-- Júlio França student_of Cobrinha Verde
-- Source: A Tarde newspaper, May 2, 1982 - describes Júlio as
-- Cobrinha Verde's "discípulo" (disciple/student)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown (childhood)
  '1983-05-12'::date, 'exact'::genealogy.date_precision, -- Ended with Cobrinha Verde's death
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde newspaper, May 2, 1982, by Reynivaldo Brito (velhosmestres.com/br/cobrinha-1982-5)',
  'Júlio was Cobrinha Verde''s son and described as his "discípulo e grande capoeirista" (disciple and great capoeirista) in 1982. This was a primary teacher-student relationship, not just family instruction.',
  'Júlio era filho de Cobrinha Verde e descrito como seu "discípulo e grande capoeirista" em 1982. Esta era uma relação primária mestre-aluno, não apenas instrução familiar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlio França' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Júlio França family_of Cobrinha Verde
-- Relationship type: son
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde newspaper, May 2, 1982 (velhosmestres.com/br/cobrinha-1982-5)',
  'Júlio was the biological son of Cobrinha Verde (Rafael Alves França). In 1982, Cobrinha Verde was living at Júlio''s home due to health issues.',
  'Júlio era filho biológico de Cobrinha Verde (Rafael Alves França). Em 1982, Cobrinha Verde estava morando na casa de Júlio devido a problemas de saúde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlio França' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- None identified - Cobrinha Verde is already in the dataset
-- ============================================================

-- Source: statements/persons/juvenal-engraxate.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Juvenal Engraxate (Juvenal Hermenegildo da Cruz)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Juvenal Engraxate is the SUBJECT.
-- ============================================================

-- Juvenal Engraxate student_of Samuel Querido de Deus
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'O Cruzeiro magazine (1948); Velhos Mestres; Jorge Amado (Bahía de Todos os Santos, 1944)',
  'Juvenal was formally recognized as Mestre by Samuel Querido de Deus. "This title was given to me by Samuel Querido-de-Deus," Juvenal recounted. "Samuel liked my qualities and saw my future." Juvenal described his teacher as "uma onça" (a jaguar).',
  'Juvenal foi formalmente reconhecido como Mestre por Samuel Querido de Deus. "Este título me foi dado por Samuel Querido-de-Deus," Juvenal contou. "Samuel gostava das minhas qualidades e via meu futuro." Juvenal descrevia seu professor como "uma onça".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Juvenal Engraxate' AND o.apelido = 'Querido de Deus'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Juvenal Engraxate co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1941-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Portal Capoeira; Nossa Tribo',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra. The four "donos e proprietários" were Noronha, Livino, Totonho de Maré, and Amorzinho, with 18 other mestres including Juvenal as co-founders.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra. Os quatro "donos e proprietários" eram Noronha, Livino, Totonho de Maré e Amorzinho, com outros 18 mestres incluindo Juvenal como cofundadores.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Juvenal Engraxate' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS
-- ============================================================
-- Juvenal Engraxate associated_with Barbosa - Played together at II Congresso Afro-Brasileiro 1937
-- Waiting for: Barbosa import
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'associated_with'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   '1937-01-01'::date, 'year'::genealogy.date_precision,
--   '1937-12-31'::date, 'year'::genealogy.date_precision,
--   '{"event": "II Congresso Afro-Brasileiro"}'::jsonb,
--   'verified'::genealogy.confidence,
--   'Historical photographs from II Congresso Afro-Brasileiro (1937)',
--   'Juvenal and Barbosa played capoeira together at the II Congresso Afro-Brasileiro in 1937. Historical photographs of this event survive.',
--   'Juvenal e Barbosa jogaram capoeira juntos no II Congresso Afro-Brasileiro em 1937. Fotografias históricas deste evento sobrevivem.'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Juvenal Engraxate' AND o.apelido = 'Barbosa'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
-- ============================================================

-- ============================================================
-- STUDENT RELATIONSHIPS (documented students)
-- ============================================================
-- Students: Reginaldo, Antonio, Evangelista, Romenil Assis da Cruz (son)
-- Note: These individuals need their own person_profile imports before relationships can be established
-- ============================================================

-- Source: statements/persons/juvencio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Juvêncio
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Juvêncio is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================
-- NOTE: Juvêncio has no SUBJECT statements because:
-- - He was the older generation (taught João Pequeno, Ananias, Traíra)
-- - trained_under relationships are owned by the STUDENT (subject)
-- - See joao-pequeno.sql, traira.sql for relationships TO Juvêncio
-- ============================================================

-- No active statements - Juvêncio is the object (teacher), not subject, in known relationships.

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- GROUP RELATIONSHIPS
-- Juvêncio leads Roda de São Félix - PENDING
-- Informal dock rodas during Igreja de São Deus Menino and Senhor São Félix festivals (~1930s-40s)
-- Group 'Roda de São Félix (Juvêncio)' needs import first - see groups-backlog.md

-- PERSON RELATIONSHIPS
-- Juvêncio associated_with Ananias - Ananias learned in his rodas (1938+). Needs Ananias import first.
-- Juvêncio associated_with João de Zazá - Participated in São Félix rodas. Needs import first (unknown person).
-- Juvêncio associated_with Estevão - Cigar factory guard, "capoeira perversa." Needs import first (unknown person).
-- Juvêncio associated_with Caial - Participated in São Félix rodas. Needs import first (unknown person).
-- Juvêncio associated_with Café - From Cachoeira, participated in São Félix rodas. Needs import first (unknown person).
-- Juvêncio associated_with Toy - Brother, participated in São Félix rodas. Needs import first (unknown person).
-- Juvêncio associated_with Roxinho - Brother of Toy, participated in São Félix rodas. Needs import first (unknown person).
-- Juvêncio associated_with Alvelino - From Muritiba, participated in São Félix rodas. Needs import first (unknown person).
-- Juvêncio associated_with Santos - Brother of Alvelino, from Muritiba, participated in São Félix rodas. Needs import first (unknown person).

-- Source: statements/persons/leandro-bonaparte.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Leandro Bonaparte
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Leandro Bonaparte is the SUBJECT.
-- ============================================================

-- Leandro Bonaparte associated_with Manduca da Praia (rival/contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1870-01-01'::date, 'decade'::genealogy.date_precision,
  '1890-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "rival_gang_leader"}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Leandro Bonaparte (chief of São Francisco party, Guaiamú federation) and Manduca da Praia (chief of Santa Luzia party, Nagoa federation) were the two principal leaders of the rival capoeira federations in Rio de Janeiro. The Guaiamú wore red, the Nagoa wore white. Their confrontations defined the era.',
  'Leandro Bonaparte (chefe do partido de São Francisco, federação Guaiamú) e Manduca da Praia (chefe do partido de Santa Luzia, federação Nagoa) foram os dois principais líderes das federações rivais de capoeira no Rio de Janeiro. Os Guaiamú usavam vermelho, os Nagoa usavam branco. Seus confrontos definiram a era.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leandro Bonaparte' AND o.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Leandro Bonaparte leads São Francisco party (Guaiamú) - GROUP not in dataset
--   The São Francisco party was a territorial capoeira malta organized
--   around the São Francisco parish. Groups/maltas are not currently
--   tracked in the genealogy database as they were informal territorial
--   organizations rather than formal capoeira groups.
--
-- Leandro Bonaparte associated_with Jorge Marinha (contemporary gang leader)
--   Jorge Marinha was listed in persons-backlog as chief of Marinha gang,
--   which was part of the Guaiamú federation. However, no additional
--   information about Jorge Marinha was found in research. May be
--   referenced to the Marinha PARISH (Santa Rita, Marinha, etc.) rather
--   than a person named Jorge Marinha.
-- ============================================================

-- Source: statements/persons/leopoldina.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Leopoldina
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Leopoldina is the SUBJECT.
-- ============================================================

-- Leopoldina student_of Quinzinho (1951 - ~1954)
-- Leopoldina's first master in tiririca, the capoeira without berimbau.
-- Training began when Leopoldina was 18, met Quinzinho around Central Station.
-- Ended when Quinzinho was murdered in prison around 1954.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1951-01-01'::date, 'year'::genealogy.date_precision,
  '1954-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/general/master-leopoldina-part-1/',
  E'Quinzinho was Leopoldina''s first master, teaching him tiririca - Rio''s street capoeira without berimbau, descended from 19th-century maltas. Training began around 1950-1951 when Leopoldina was 18 and ended when Quinzinho was murdered in prison around 1954. Leopoldina trained in front of Quinzinho''s house every day at 7am and became the only person who could truly play with his master.',
  E'Quinzinho foi o primeiro mestre de Leopoldina, ensinando-lhe tiririca - a capoeira de rua do Rio sem berimbau, descendente das maltas do século XIX. O treinamento começou por volta de 1950-1951 quando Leopoldina tinha 18 anos e terminou quando Quinzinho foi assassinado na prisão por volta de 1954. Leopoldina treinava na frente da casa de Quinzinho todos os dias às 7h e tornou-se a única pessoa que realmente conseguia jogar com seu mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopoldina' AND o.apelido = 'Quinzinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Leopoldina student_of Artur Emídio (~1954-1955+)
-- After Quinzinho's death, Leopoldina learned Bahian capoeira with berimbau
-- from Artur Emídio, who had been brought to Rio by Valdemar Santana.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/general/master-leopoldina-part-1/; https://sites.google.com/view/raridadesdacapoeira/mestre-leopoldina',
  E'After Quinzinho''s murder, Leopoldina learned from Artur Emídio, whom Valdemar Santana had brought from Bahia. This introduced him to Bahian capoeira played with berimbau - a completely different world from what Quinzinho had taught. Leopoldina recalled: "Artur começou a crescer...e percebi que ele era mais fera ainda que o Quinzinho" (Artur progressively dominated, and I realized he was even fiercer than Quinzinho). Some sources date this to 1954, others to 1955 when Artur formally moved to Rio.',
  E'Após o assassinato de Quinzinho, Leopoldina aprendeu com Artur Emídio, que Valdemar Santana havia trazido da Bahia. Isso o introduziu à capoeira baiana tocada com berimbau - um mundo completamente diferente do que Quinzinho havia ensinado. Leopoldina lembrou: "Artur começou a crescer...e percebi que ele era mais fera ainda que o Quinzinho." Algumas fontes datam isso de 1954, outras de 1955 quando Artur se mudou formalmente para o Rio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Leopoldina' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Leopoldina associated_with Mangueira (1961-1974)
-- Organized 60 capoeiristas for Mangueira samba school parades.
-- First school to integrate capoeira in parades.
-- Mangueira is a samba school, not currently in our groups model.

-- ============================================================
-- REVERSE RELATIONSHIPS (documented here for reference)
-- These statements belong in OTHER persons' statement files:
-- ============================================================

-- Nestor Capoeira student_of Leopoldina (1965-1968)
-- Goes in: statements/persons/nestor-capoeira.sql
-- Nestor was initiated by Leopoldina in 1965, joined Senzala in 1968.

-- Celso Pepe student_of Leopoldina (~1956-1960s)
-- Goes in: statements/persons/celso-pepe.sql
-- Celso learned Angola game and São Bento Pequeno from Leopoldina at
-- Academia Guanabara. Leopoldina was 23 years old at the time (~1956).
-- They performed together on TV and at events from 1959-60 onward.

-- Mestre Touro is part of Leopoldina's lineage via Celso Pepe:
-- Leopoldina → Celso Pepe → Mestre Touro
-- This extends the premodern Rio lineage to the present day.

-- Source: statements/persons/lucio-pequeno.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Lúcio Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Lúcio Pequeno is the SUBJECT.
-- ============================================================

-- Lúcio Pequeno co_founded Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Source: Mestre Noronha's manuscripts (O ABC da Capoeira Angola, 1976/1993)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1922-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Mestre Noronha, O ABC da Capoeira Angola (1976/1993)',
  'Listed among the 22 founding mestres of Gengibirra in Mestre Noronha''s manuscripts. Precise founding year uncertain but documented as 1920s; using 1922 based on some sources.',
  'Listado entre os 22 mestres fundadores do Gengibirra nos manuscritos de Mestre Noronha. Ano exato de fundação incerto mas documentado como década de 1920; usando 1922 baseado em algumas fontes.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Lúcio Pequeno' AND s.apelido_context IS NULL
  AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- POSSIBLE RELATIONSHIPS (uncertain, not imported)
-- ============================================================
-- Lúcio Pequeno family_of Cândido Pequeno
-- REASON NOT IMPORTED: Shared surname suggests possible relationship,
-- but NO SOURCE explicitly confirms family connection. The relationship
-- is speculative based on surname only. Would require discovering
-- primary evidence to import.
-- ============================================================

-- Source: statements/persons/madeira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Madeira
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Madeira is the SUBJECT.
-- ============================================================

-- Madeira influenced_by Waldemar
-- Note: The relationship is described as "meetings" that "particularly influenced" him,
-- not formal student-teacher. Using influenced_by.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1990-03-16'::date, 'exact'::genealogy.date_precision, -- Waldemar died March 16, 1990
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
  E'German sources describe Madeira''s relationship to Waldemar as "meetings" (Treffen) that "particularly influenced" (prägten) him. Named his group in honor of Waldemar''s favorite mestre.',
  E'Fontes alemãs descrevem a relação de Madeira com Waldemar como "encontros" (Treffen) que "particularmente o influenciaram" (prägten). Nomeou seu grupo em homenagem ao mestre favorito de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madeira' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Madeira received_title_from João Pequeno
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
  E'Sources state Madeira "received the honors of a master by João Pequeno, Canjiquinha, and Suassuna." Exact date unknown.',
  E'Fontes afirmam que Madeira "recebeu as honras de mestre de João Pequeno, Canjiquinha e Suassuna." Data exata desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madeira' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Madeira received_title_from Canjiquinha
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
  E'Sources state Madeira "received the honors of a master by João Pequeno, Canjiquinha, and Suassuna." Canjiquinha died Nov 8, 1994, so title was received before then.',
  E'Fontes afirmam que Madeira "recebeu as honras de mestre de João Pequeno, Canjiquinha e Suassuna." Canjiquinha morreu em 8 de novembro de 1994, então o título foi recebido antes disso.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madeira' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Madeira received_title_from Suassuna
-- NOTE: Suassuna (Reinaldo Ramos Suassuna) is NOT yet imported.
-- Suassuna is listed in persons-backlog.md as pending.
-- When imported, add this statement:
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'received_title_from'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   NULL, NULL,
--   NULL, NULL,
--   '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
--   'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
--   E'Sources state Madeira "received the honors of a master by João Pequeno, Canjiquinha, and Suassuna."',
--   E'Fontes afirmam que Madeira "recebeu as honras de mestre de João Pequeno, Canjiquinha e Suassuna."'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Madeira' AND o.apelido = 'Suassuna';

-- Madeira founded Grupo Siri de Mangue
-- NOTE: Grupo Siri de Mangue is NOT yet imported.
-- Grupo Siri de Mangue is listed in groups-backlog.md as pending.
-- When imported, add this statement:
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   NULL, NULL, -- Exact founding year unknown
--   NULL, NULL,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
--   E'Madeira founded Grupo Siri de Mangue in São Luís, Maranhão, Brazil.',
--   E'Madeira fundou o Grupo Siri de Mangue em São Luís, Maranhão, Brasil.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Madeira' AND o.name = 'Grupo Siri de Mangue';

-- Madeira leads Grupo Siri de Mangue
-- NOTE: Add when Grupo Siri de Mangue is imported.
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'leads'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   NULL, NULL,
--   NULL, NULL,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
--   E'Madeira is the founder and current leader of Grupo Siri de Mangue.',
--   E'Madeira é o fundador e atual líder do Grupo Siri de Mangue.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Madeira' AND o.name = 'Grupo Siri de Mangue';

-- Source: statements/persons/mario-buscape.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Mário Buscapé
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Mário Buscapé is the SUBJECT.
-- ============================================================

-- Mário Buscapé trained_under Siri de Mangue
-- His father and uncle trained with Siri de Mangue; Mário was exposed to this tradition
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário''s father José Bidel and uncle Dendê trained with Siri de Mangue. While Mário did not train directly under Siri, his capoeira came from this lineage. Influence is indirect through family teachers.',
  'O pai de Mário, José Bidel, e o tio Dendê treinaram com Siri de Mangue. Embora Mário não tenha treinado diretamente com Siri, sua capoeira veio dessa linhagem. A influência é indireta através dos professores da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé influenced_by Neco Canário Pardo (through family)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário''s father José Bidel and uncle Dendê associated with Canário Pardo (Neco Canário Pardo). The capoeira taught to Mário came from this Recôncavo tradition. Influence is indirect through family teachers.',
  'O pai de Mário, José Bidel, e o tio Dendê se associavam com Canário Pardo (Neco Canário Pardo). A capoeira ensinada a Mário veio dessa tradição do Recôncavo. A influência é indireta através dos professores da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé influenced_by Besouro Mangangá (through family lineage)
-- His father and uncle trained with companions of Besouro; Besouro visited their house
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'According to Mário, Besouro visited his family home (before Mário was born, as Besouro died 1924). His father and uncle associated with Besouro''s companions. The lineage tree shows: Besouro → Bidel → Dendê → Mário. Mário carried forward this lineage tradition.',
  'Segundo Mário, Besouro visitou a casa de sua família (antes de Mário nascer, pois Besouro morreu em 1924). Seu pai e tio se associavam com os companheiros de Besouro. A árvore genealógica mostra: Besouro → Bidel → Dendê → Mário. Mário deu continuidade a essa tradição de linhagem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé associated_with Artur Emídio
-- Frequented Artur Emídio's rodas in the 1950s
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Mário frequented Artur Emídio''s roda in Rio de Janeiro during the 1950s. Witnesses say Mário was impressed by Artur''s speed and elevated his own game. Both are among the four founding lineages of contemporary capoeira in Rio."}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Fellow founding lineage of contemporary capoeira in Rio de Janeiro. Mário frequented Artur Emídio''s roda in the 1950s and was impressed by his speed.',
  'Linhagem fundadora da capoeira contemporânea no Rio de Janeiro. Mário frequentava a roda de Artur Emídio nos anos 1950 e ficou impressionado com sua velocidade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé student_of Dendê (uncle)
-- Primary teacher; taught him from age 8 (~1942) in family backyard rodas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was Mário''s uncle and his first capoeira teacher. Starting around age 8 (1942), Mário learned capoeira in improvised rodas in the family''s backyard, with Dendê as his primary teacher.',
  'Dendê era tio de Mário e seu primeiro professor de capoeira. A partir dos 8 anos (1942), Mário aprendeu capoeira em rodas improvisadas no quintal da família, tendo Dendê como seu professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé'
  AND o.apelido = 'Dendê' AND o.apelido_context = 'São Francisco do Conde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé student_of José Bidel (father)
-- Father also trained him in capoeira alongside uncle Dendê
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'José Bidel was Mário''s father and also trained him in capoeira. Starting around age 8 (1942), Mário learned in improvised rodas in the family backyard from both his father and uncle Dendê.',
  'José Bidel era pai de Mário e também o treinou em capoeira. A partir dos 8 anos (1942), Mário aprendeu em rodas improvisadas no quintal da família com seu pai e tio Dendê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé family_of José Bidel (father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário was the son of José Bidel dos Santos. Born July 17, 1934 in São Francisco do Conde.',
  'Mário era filho de José Bidel dos Santos. Nasceu em 17 de julho de 1934 em São Francisco do Conde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé family_of Dendê (uncle)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "nephew"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was Mário''s uncle (brother of José Bidel). Mário was born July 17, 1934.',
  'Dendê era tio de Mário (irmão de José Bidel). Mário nasceu em 17 de julho de 1934.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé'
  AND o.apelido = 'Dendê' AND o.apelido_context = 'São Francisco do Conde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mário Buscapé founded Grupo Bonfim (1953) - group needs import
-- Mário Buscapé associated_with Zé Grande - primary student, took over academy; needs import
-- Mário Buscapé associated_with Deraldo - student, co-leader of Bonfim; needs import
-- Mário Buscapé associated_with Irineu dos Santos - first student at Cavan; needs import
-- Mário Buscapé associated_with Mestre Gary (Mestre 22) - learned from Zé Grande/Deraldo; needs import
-- Mário Buscapé associated_with Mestre Veludo - member of Bonfim group; needs import

-- Source: statements/persons/marrom.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Marrom (Rio de Janeiro)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Marrom is the SUBJECT.
-- Note: Uses apelido_context 'Rio de Janeiro' to distinguish from São Paulo Marrom.
-- ============================================================

-- Marrom trained_under Gato Preto (old guard collaboration, 1990s+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/, https://velhosmestres.com/en/gato-2000-5',
  'Part of Marrom''s research with old guard mestres in 1990s; recorded CDs together (2001); Gato Preto visited Marrom''s 5th Children''s Encounter (Nov 2000)',
  'Parte da pesquisa de Marrom com mestres da velha guarda nos anos 1990; gravaram CDs juntos (2001); Gato Preto visitou o 5º Encontro Infantil de Marrom (nov 2000)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom trained_under João Grande (old guard collaboration, 1990s+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.helloasso.com/associations/association-oya/collectes/mestre-marrom-contra-mestre-tatiana-en-france',
  'Studied with João Grande as part of old guard research; João Grande listed among major Angola influences',
  'Estudou com João Grande como parte de pesquisa com velha guarda; João Grande listado entre principais influências Angola'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom trained_under João Pequeno (lineage claim per Mestre Ferradura)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://oberlincapoeiraangola.wordpress.com/meet-the-hosts/',
  'Mestre Ferradura describes Marrom as "a disciple of Mestre João Pequeno de Pastinha"; exact nature of training unclear but places Marrom in Pastinha lineage',
  'Mestre Ferradura descreve Marrom como "um discípulo de Mestre João Pequeno de Pastinha"; natureza exata do treinamento incerta mas coloca Marrom na linhagem de Pastinha'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Marrom trained_under Canela - NEEDS IMPORT: Mestre Canela (Rio de Janeiro, Engenho Novo)
--   First formal teacher in Rio after 1976; Regional style training

-- Marrom trained_under Peixinho - NEEDS IMPORT: Mestre Peixinho (Senzala, Rio de Janeiro)
--   Trained with Peixinho da Senzala, earned red rope (Regional)

-- Marrom influenced_by Nô - NEEDS IMPORT: Mestre Nô (Norival Moreira de Oliveira)
--   Bahian mestre who inspired Marrom's turn to capoeira Angola

-- Marrom influenced_by Angolinha - NEEDS IMPORT: Mestre Angolinha (Isak Ignácio, Rio de Janeiro)
--   Rio Angola reference; Marrom had him as major influence in 1990s

-- Marrom trained_under Bigodinho - NEEDS IMPORT: Mestre Bigodinho (Reinaldo Santana)
--   Part of old guard collaboration; recorded CDs together

-- Marrom trained_under Boca Rica - NEEDS IMPORT: Mestre Boca Rica (Manoel Silva)
--   Part of old guard collaboration; recorded CDs together

-- Marrom trained_under Felipe - NEEDS IMPORT: Mestre Felipe (Santo Amaro)
--   Part of old guard collaboration; recorded CDs together

-- Marrom trained_under Brandão - NEEDS IMPORT: Mestre Brandão
--   Part of old guard collaboration; recorded CDs together

-- Marrom founded Ngoma Capoeira Angola (2018) - NEEDS GROUP IMPORT
--   Renamed from "Marrom Capoeira & Alunos" (1990)
--   Located at Morro da Babilônia, Leme, Rio de Janeiro

-- Marrom associated_with "Vadiando Entre Amigos" movement - NEEDS GROUP/MOVEMENT IMPORT
--   Co-precursor with Mestres Formiga and Camaleão (1990s-2000s)

-- Source: statements/persons/moraes.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Moraes
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Moraes is the SUBJECT.
-- Per ownership rule: statements go in the file named after SUBJECT.
-- ============================================================

-- Moraes student_of João Grande
-- Primary teacher-student relationship. Moraes considers João Grande his "true teacher."
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-moraes/, https://capoeira.online/history/mestres/mestre-moraes/',
  E'Moraes began training at Pastinha''s academy around age 8 (~1958). João Grande and João Pequeno ran the classes as Pastinha was blind. Moraes states he considers João Grande his true teacher due to the impression made by the way João Grande played capoeira.',
  E'Moraes começou a treinar na academia de Pastinha por volta dos 8 anos (~1958). João Grande e João Pequeno davam as aulas pois Pastinha estava cego. Moraes afirma considerar João Grande seu verdadeiro mestre devido à impressão causada pela forma como João Grande jogava capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moraes' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Moraes trained_under João Pequeno
-- Trained at Pastinha's academy where João Pequeno was one of the instructors
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-moraes/, https://capoeira.online/history/mestres/mestre-moraes/',
  E'Moraes trained at Pastinha''s academy where João Pequeno was one of the two principal instructors (alongside João Grande). João Pequeno and João Grande ran the academy as Pastinha was blind.',
  E'Moraes treinou na academia de Pastinha onde João Pequeno era um dos dois instrutores principais (junto com João Grande). João Pequeno e João Grande dirigiam a academia pois Pastinha estava cego.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moraes' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Moraes trained_under Pastinha
-- Academy training at CECA, though Pastinha was blind and no longer teaching directly
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-moraes/',
  E'Moraes trained at Mestre Pastinha''s Centro Esportivo de Capoeira Angola (CECA). However, by this time Pastinha was already going blind and no longer taught classes directly. Using ''trained_under'' rather than ''student_of'' to reflect that the actual instruction came from João Grande and João Pequeno.',
  E'Moraes treinou no Centro Esportivo de Capoeira Angola (CECA) de Mestre Pastinha. No entanto, nessa época Pastinha já estava ficando cego e não dava mais aulas diretamente. Usando ''trained_under'' em vez de ''student_of'' para refletir que a instrução real veio de João Grande e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moraes' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- These relationships require the object entity to be imported first.
-- Add to persons-backlog.md and groups-backlog.md as appropriate.
-- ============================================================

-- Person-to-Group relationships (GCAP not yet imported):
-- Moraes founded GCAP - Founded October 5, 1980 in Rio de Janeiro

-- Person-to-Person relationships:
-- Cobra Mansa student_of Moraes - RESOLVED: see cobra-mansa.sql (Cobra Mansa student_of Moraes)
-- Braga student_of Moraes - Met 1975; mestre 1978; co-founded GCAP
-- Neco student_of Moraes - Mestre 1978; co-founded GCAP; originated GCAP idea
-- Zé Carlos student_of Moraes - Mestre 1978; co-founded GCAP; later founded N'Golo
-- Marco Aurélio student_of Moraes - Contramestre 1978; mestre ~1982
-- Janja student_of Moraes - Started GCAP 1983; founded Grupo Nzinga 1995
-- Paulinha student_of Moraes - Contramestra 1990; co-founded Nzinga
-- Poloca student_of Moraes - Contramestre at GCAP; co-founded Nzinga
-- Valmir student_of Moraes - Started GCAP 1982; mestre 2003; leads FICA-Salvador
-- Jurandir student_of Moraes - Pioneer of GCAP; founded N'GOLO Angola 1990

-- Note: When these persons/groups are imported, their relationship statements
-- should go in THEIR respective statement files (e.g., cobra-mansa.sql should
-- contain "Cobra Mansa student_of Moraes"), not in this file.

-- Source: statements/persons/moreno.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Moreno (Cobrinha Verde student)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Moreno is the SUBJECT.
--
-- CRITICAL NOTE ON NICKNAME AMBIGUITY:
-- "Moreno" was an extremely common nickname in Brazilian capoeira,
-- given to anyone with darker skin or hair. There were almost
-- certainly multiple "Morenos" in Salvador's capoeira scene.
-- Only the student_of relationship to Cobrinha Verde is documented
-- with reasonable confidence. Other relationships are uncertain.
-- ============================================================

-- Moreno student_of Cobrinha Verde
-- Source: Portuguese Wikipedia (Mestre Cobrinha Verde), capoeira.online
-- This is the ONLY relationship we can document with reasonable confidence.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown
  NULL, NULL, -- End date unknown
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'pt.wikipedia.org/wiki/Mestre_Cobrinha_Verde, capoeira.online/history/mestres/cobrinha-verde/',
  E'Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Gigante, and Eulampio. Exact dates of training unknown. Note: "Moreno" was an extremely common nickname - this may or may not be the same "Moreno" mentioned in other Salvador capoeira sources.',
  E'Listado como aluno de Cobrinha Verde junto com João Grande, João Pequeno, Gigante e Eulampio. Datas exatas de treinamento desconhecidas. Nota: "Moreno" era um apelido extremamente comum - este pode ou não ser o mesmo "Moreno" mencionado em outras fontes da capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moreno' AND s.apelido_context = 'Cobrinha Verde student'
  AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- RELATIONSHIPS NOT INCLUDED DUE TO UNCERTAINTY
-- ============================================================
-- The following relationships were considered but NOT included because
-- we cannot confirm the "Moreno" mentioned is the same person:
--
-- A "Moreno" appears in Gato Preto's 1999 interview as part of the
-- Itapuã bateria alongside João Pequeno, Albertino, and Valdomiro.
-- However, "Moreno" was such a common nickname that this could easily
-- be a different person, or even a transcription error from verbal interview.
--
-- NOT INCLUDED:
-- - Moreno associated_with João Pequeno (bateria companion) - UNCERTAIN IDENTITY
-- - Moreno associated_with Gato Preto (bateria companion) - UNCERTAIN IDENTITY
-- - Moreno associated_with Albertino (bateria companion) - UNCERTAIN IDENTITY
-- - Moreno associated_with Valdomiro (bateria companion) - UNCERTAIN IDENTITY

-- Source: statements/persons/mucunge.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Mucungê
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Mucungê is the SUBJECT.
-- ============================================================

-- Mucungê associated_with Waldemar (worked in bateria at his Barracão)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Worked in bateria at Waldemar''s Barracão in Liberdade, Salvador alongside Bugalho, Zacarias, and Ananias"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://sites.google.com/view/raridadesdacapoeira/mestre-ananias',
  E'Mucungê was part of the bateria at Mestre Waldemar''s legendary Barracão in the Liberdade neighborhood of Salvador during the 1950s, before migrating to Rio de Janeiro.',
  E'Mucungê fazia parte da bateria no lendário Barracão de Mestre Waldemar no bairro da Liberdade em Salvador durante os anos 1950, antes de migrar para o Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Onça Preta (co-founder of Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Co-founders of Grupo Filhos de Angola in Rio de Janeiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-51',
  E'Mucungê and Onça Preta were among the six co-founders of Grupo Filhos de Angola in Rio de Janeiro on July 21, 1960.',
  E'Mucungê e Onça Preta estavam entre os seis co-fundadores do Grupo Filhos de Angola no Rio de Janeiro em 21 de julho de 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Onça Preta' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Roque (co-founder of Filhos de Angola; taught him berimbau)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Co-founders of Grupo Filhos de Angola; Mucungê taught Roque berimbau"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Mucungê co-founded Filhos de Angola with Roque and taught him to play berimbau. Roque explicitly credits Mucungê for his berimbau skills.',
  E'Mucungê co-fundou o Filhos de Angola com Roque e o ensinou a tocar berimbau. Roque explicitamente credita Mucungê por suas habilidades no berimbau.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Paraná (participated in his 1963 LP recording)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Participated in Paraná''s 1963 CBS album recording as berimbau player"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/m-parana/',
  E'Mucungê was invited by Mestre Paraná to participate in the recording of his 1963 album "Capoeira: Mestre Paraná" on CBS Masterworks.',
  E'Mucungê foi convidado por Mestre Paraná para participar da gravação de seu álbum de 1963 "Capoeira: Mestre Paraná" pela CBS Masterworks.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Paraná' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Zacarias Boa Morte (bateria at Waldemar's; Circo Voador 1984)
-- NOTE: Zacarias Boa Morte not yet in dataset - adding to pending relationships

-- Mucungê associated_with João Pequeno (Circo Voador 1984 event)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Participated together at Mestre Camisa''s event at Circo Voador, Rio de Janeiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-51',
  E'Mucungê participated alongside João Pequeno and Zacarias Boa Morte at Mestre Camisa''s 1984 event at Circo Voador in Rio de Janeiro.',
  E'Mucungê participou ao lado de João Pequeno e Zacarias Boa Morte no evento de Mestre Camisa de 1984 no Circo Voador no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'João Pequeno' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê associated_with Leopoldina (1997 events in Rio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1997-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Played berimbau together at capoeira events in Rio de Janeiro"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-51',
  E'In 1997, Mucungê was photographed playing berimbau alongside Mestre Leopoldina at Mestre Poraquê''s event in Rio.',
  E'Em 1997, Mucungê foi fotografado tocando berimbau ao lado de Mestre Leopoldina no evento de Mestre Poraquê no Rio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mucungê' AND s.apelido_context IS NULL
  AND o.apelido = 'Leopoldina' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mucungê co_founded Filhos de Angola (Rio, 1960)
-- NOTE: Filhos de Angola (Rio, 1960) group not yet in dataset - adding to pending relationships

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mucungê associated_with Zacarias Boa Morte - bateria at Waldemar's + Circo Voador 1984
-- Mucungê associated_with Bugalho - bateria at Waldemar's Barracão
-- Mucungê associated_with Ananias - bateria at Waldemar's Barracão
-- Mucungê co_founded Filhos de Angola (Rio, 1960) - group needs import first
-- Mucungê associated_with Dois de Ouro - co-founder of Filhos de Angola
-- Mucungê associated_with Baleado - co-founder of Filhos de Angola
-- Mucungê associated_with Imagem do Cão - co-founder of Filhos de Angola
-- Mucungê associated_with Mendonça - 1997 event at Mestre Poraquê's
-- Mucungê associated_with Poraquê - 1997 event host
-- Mucungê associated_with Dorado - 1997 Morro da Babilônia
-- Mucungê associated_with Garça - 1997 Morro da Babilônia
-- Mucungê associated_with Guará - 1997 Leme photo
-- ============================================================

-- Source: statements/persons/nestor-capoeira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Nestor Capoeira
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Nestor Capoeira is the SUBJECT.
-- Relationships where Nestor Capoeira is the OBJECT should be in
-- the subject person's file.
-- ============================================================

-- Nestor Capoeira student_of Leopoldina (1965-1968)
-- Primary teacher who initiated Nestor into capoeira
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com, capoeirawiki.org, velhosmestres.com',
  'Nestor was initiated into capoeira by Mestre Leopoldina in 1965. He continued training until joining Grupo Senzala in 1968. Nestor later co-produced the 2005 documentary "Mestre Leopoldina - A Fina Flor da Malandragem" about his first teacher.',
  'Nestor foi iniciado na capoeira por Mestre Leopoldina em 1965. Continuou treinando até entrar no Grupo Senzala em 1968. Nestor posteriormente co-produziu o documentário de 2005 "Mestre Leopoldina - A Fina Flor da Malandragem" sobre seu primeiro mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nestor Capoeira' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- These relationships will be added when the objects are imported.
-- ============================================================

-- Nestor Capoeira trained_under Preguiça (Walmir Oliveira)
-- At Grupo Senzala (1968-1990)
-- Preguiça not yet in dataset

-- Nestor Capoeira associated_with Gato (Fernando C. de Albuquerque)
-- Supervised Nestor's teaching as contramestre at UFRJ (1968)
-- Gato not yet in dataset
-- association_context: "Gato supervised Nestor's contramestre teaching at UFRJ"

-- Nestor Capoeira member_of Grupo Senzala (1968-1990)
-- Achieved corda vermelha (highest rank) in 1969
-- Grupo Senzala not yet in dataset

-- Nestor Capoeira founded Escola Nestor Capoeira (1990)
-- Founded after leaving Grupo Senzala
-- Escola Nestor Capoeira not yet in dataset

-- Nestor Capoeira cultural_pioneer_of Europe (1971)
-- First Brazilian mestre to teach capoeira regularly in Europe
-- Would need a different predicate or location entity structure

-- Source: statements/persons/nicolau-do-poco.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Nicolau do Poço
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Nicolau do Poço is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- --- Person-to-Person: Associations ---

-- Nicolau do Poço associated_with Nascimento Grande
-- Both were prominent valentões of Recife carnival in late 1800s/early 1900s
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both were valentões of Recife carnival. Valdemar de Oliveira notes that young men from good families liked to go with Nicolau do Poço or Nascimento Grande to break up pastoral plays for enjoyment."}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  'Nicolau do Poço and Nascimento Grande were both prominent figures in Recife''s nightlife and street culture. Young men of good families sought their company to break up pastoral plays.',
  'Nicolau do Poço e Nascimento Grande eram ambos figuras proeminentes na vida noturna e cultura de rua do Recife. Rapazes de boas famílias buscavam sua companhia para arrebentar pastoris.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nicolau do Poço' AND o.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified

-- Source: statements/persons/olho-de-pombo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Olho de Pombo
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Olho de Pombo is the SUBJECT.
-- ============================================================

-- Olho de Pombo co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Contemporary Capoeira History',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra. Listed in Noronha manuscripts as part of "Algemiro Grande Olho de Pombo longshoreman" entry. Worked as longshoreman (estivador).',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra. Listado nos manuscritos de Noronha como parte da entrada "Algemiro Grande Olho de Pombo estivador". Trabalhava como estivador.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Olho de Pombo' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Olho de Pombo.
-- No students documented.
-- ============================================================

-- Source: statements/persons/paquete-do-cabula.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Paquete do Cabula
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Paquete do Cabula is the SUBJECT.
-- ============================================================

-- Paquete do Cabula co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Paquete do Cabula' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Paquete do Cabula.
-- No students documented.
-- ============================================================

-- Source: statements/persons/parana.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Paraná
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Paraná is the SUBJECT.
-- Relationships where Paraná is the OBJECT go in the other
-- person's statements file.
-- ============================================================

-- ============================================================
-- TEACHER RELATIONSHIPS
-- ============================================================

-- Paraná student_of Antônio Corró (primary teacher, 1932)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1932-01-01'::date, 'year'::genealogy.date_precision,
  '1945-02-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-14, capoeiranews.com.br',
  E'Paraná began learning capoeira from Antônio Corró in 1932 at age 10 in the Alto das Pombas neighborhood, Federação district of Salvador. Corró was 62 years old at the time, an ex-slave born in 1870 who worked as a cart driver at the Cais Dourado. This training continued until Paraná left for Rio de Janeiro in February 1945.',
  E'Paraná começou a aprender capoeira com Antônio Corró em 1932 aos 10 anos no bairro do Alto das Pombas, região da Federação em Salvador. Corró tinha 62 anos na época, um ex-escravo nascido em 1870 que trabalhava como carroceiro no Cais Dourado. Este treinamento continuou até Paraná partir para o Rio de Janeiro em fevereiro de 1945.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND o.apelido = 'Antônio Corró'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- MUSICAL/PROFESSIONAL ASSOCIATIONS
-- ============================================================

-- Paraná associated_with Artur Emídio (played berimbau at his rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  '1972-03-07'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Paraná frequently played berimbau at Artur Emídio''s Sunday rodas and directed the percussion section"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com, velhosmestres.com',
  E'Paraná was a regular collaborator at Artur Emídio''s legendary Sunday rodas in Bonsucesso. According to Mestre Leopoldina, "it was Mestre Paraná who played the berimbau at Artur''s academy." Paraná also participated in the show "Arco-Íris" featuring Mestre Artur Emídio.',
  E'Paraná era um colaborador regular nas lendárias rodas de domingo de Artur Emídio em Bonsucesso. Segundo Mestre Leopoldina, "era Mestre Paraná quem tocava o berimbau na academia de Artur." Paraná também participou do show "Arco-Íris" com Mestre Artur Emídio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paraná associated_with Onça Preta (musical collaboration on 1963 LP)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Onça Preta played pandeiro on Paraná''s 1963 CBS LP recording"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-34',
  E'According to Mestre Gegê, Onça Preta played pandeiro on Paraná''s historic 1963 LP "Capoeira – Mestre Paraná" for CBS.',
  E'Segundo Mestre Gegê, Onça Preta tocou pandeiro no histórico LP de Paraná de 1963 "Capoeira – Mestre Paraná" pela CBS.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- Paraná founded Grupo São Bento Pequeno
-- PENDING: Grupo São Bento Pequeno not yet in database
-- Founded 1950 on Rua Miguel Burnier, Rio de Janeiro
-- Later became foundation for Grupo Muzenza

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Paraná associated_with Mucungê (1963 LP collaboration) - Mucungê needs import first
-- Paraná associated_with Joel Lourenço (O Pagador de Promessas 1962) - Joel Lourenço needs import first
-- Paraná associated_with Genaro (taught berimbau) - Genaro needs import first
-- Paraná associated_with Polaco (teacher, gave nickname 1956) - Polaco needs import first
-- Paraná associated_with Mintirinha (appeared at rodas) - Mintirinha needs import first
-- Paraná founded Grupo São Bento Pequeno (1950) - Group needs import first

-- ============================================================
-- NOTE: Relationships where Paraná is the OBJECT
-- ============================================================
-- These go in the OTHER person's statements file per ownership rule:
-- Polaco student_of Paraná (1956) → polaco.sql
-- Genaro trained_under Paraná (learned berimbau) → genaro.sql
-- Mintirinha associated_with Paraná (appeared at rodas) → mintirinha.sql

-- Source: statements/persons/paulo-gomes.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Paulo Gomes
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Paulo Gomes is the SUBJECT.
-- ============================================================

-- Paulo Gomes student_of Artur Emídio
-- Started training in Rio de Janeiro in 1962
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/, velhosmestres.com/br/destaques-55',
  E'Paulo Gomes learned capoeira from Artur Emídio at his academy in Bonsucesso, Rio de Janeiro. Trained alongside Leopoldina, Celso do Engenho, and Djalma Bandeira. Graduated as mestre at this academy.',
  E'Paulo Gomes aprendeu capoeira com Artur Emídio em sua academia em Bonsucesso, Rio de Janeiro. Treinou ao lado de Leopoldina, Celso do Engenho e Djalma Bandeira. Formou-se mestre nesta academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Gomes' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Gomes associated_with Leopoldina (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training companion at Artur Emídio''s academy"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/',
  E'Trained together at Mestre Artur Emídio''s academy in Bonsucesso, Rio de Janeiro.',
  E'Treinaram juntos na academia de Mestre Artur Emídio em Bonsucesso, Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Gomes' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Gomes associated_with Djalma Bandeira (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training companion at Artur Emídio''s academy"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/',
  E'Trained together at Mestre Artur Emídio''s academy in Bonsucesso, Rio de Janeiro.',
  E'Treinaram juntos na academia de Mestre Artur Emídio em Bonsucesso, Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Gomes' AND o.apelido = 'Djalma Bandeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Paulo Gomes associated_with Celso do Engenho - training companion; Celso pending in backlog
-- Paulo Gomes founded Ilha de Maré - group not yet in dataset
-- Paulo Gomes founded ABRACAP - group not yet in dataset
-- Paulo Gomes taught Valdir Sales - person needs backlog entry
-- Paulo Gomes taught Josias da Silva - person in backlog (Cobra Mansa import)
-- Paulo Gomes taught Maria Pandeiro - person needs backlog entry
-- Paulo Gomes taught Jorginho (Jorge Machado Silva) - person needs backlog entry
-- Paulo Gomes taught Fernandão - person needs backlog entry

-- Source: statements/persons/percilio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Percílio
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Percílio is the SUBJECT.
-- ============================================================

-- Percílio co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Percílio' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Percílio.
-- No students documented.
-- ============================================================

-- Source: statements/persons/rogerio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Rogério
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Rogério is the SUBJECT.
-- ============================================================

-- Rogério received_title_from Moraes (1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Received mestre title from Mestre Moraes (GCAP) in 1989. Part of dual recognition alongside Cobra Mansa.',
  E'Recebeu título de mestre de Mestre Moraes (GCAP) em 1989. Parte de reconhecimento duplo junto com Cobra Mansa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Moraes' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério received_title_from Cobra Mansa (1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Received mestre title from Mestre Cobra Mansa (FICA) in 1989. Part of dual recognition alongside Moraes.',
  E'Recebeu título de mestre de Mestre Cobra Mansa (FICA) em 1989. Parte de reconhecimento duplo junto com Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Cobra Mansa' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério trained_under Moraes (1972-1989)
-- Note: Using trained_under rather than student_of since exact training relationship unclear
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Trained under Moraes. Started capoeira in Rio de Janeiro in 1972, titled mestre 1989. Training period 17 years. Exact nature of training relationship not specified in sources.',
  E'Treinou com Moraes. Começou capoeira no Rio de Janeiro em 1972, titulado mestre em 1989. Período de treinamento de 17 anos. Natureza exata da relação de treinamento não especificada nas fontes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Moraes' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério trained_under Cobra Mansa (1970s-1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Trained under Cobra Mansa. Titled by Cobra Mansa (FICA) in 1989. Training start date unknown.',
  E'Treinou com Cobra Mansa. Titulado por Cobra Mansa (FICA) em 1989. Data de início do treinamento desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Cobra Mansa' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério cultural_pioneer_of Germany (1990)
-- Note: One of the first to bring Capoeira Angola to Germany
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'cultural_pioneer_of'::genealogy.predicate,
  'person'::genealogy.entity_type, s.id, -- Self-referential for country pioneering
  '1990-05-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"country": "Germany", "context": "One of the first to bring Capoeira Angola to Germany. Arrived May 1990, founded ACAD 1992 in Kassel."}'::jsonb,
  'verified'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Pioneer of Capoeira Angola in Germany. Arrived May 1990, founded ACAD in Kassel 1992—one of the first Capoeira Angola organizations in Europe.',
  E'Pioneiro da Capoeira Angola na Alemanha. Chegou em maio de 1990, fundou a ACAD em Kassel em 1992—uma das primeiras organizações de Capoeira Angola na Europa.'
FROM genealogy.person_profiles s
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rogério co_founded ACAD (1992) - ACAD group not yet imported
-- Rogério leads ACAD (1992-present) - ACAD group not yet imported
-- Rogério gave_title_to Mestre Índio (2004) - Índio person not yet imported
-- Rogério trained Mestre Matthias (Freiburg) - person not yet imported
-- Rogério trained Mestre Ricardo (Freiburg) - person not yet imported
-- Rogério trained Contra-mestre Iran Joter (Belo Horizonte) - person not yet imported
-- Rogério trained Contra-mestre Wellington-Negão (Curitiba) - person not yet imported
-- Rogério trained Contra-mestre Bruno (Bologna) - person not yet imported

-- Source: statements/persons/rudolf-hermanny.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Rudolf Hermanny
-- Generated: 2025-12-16
-- ============================================================
-- This file contains all relationships where Rudolf Hermanny is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Rudolf Hermanny student_of Sinhozinho
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho/; A Noite newspaper April 1, 1949; rohermanny.tripod.com',
  'Rudolf Hermanny trained under Mestre Sinhozinho at his academies in Ipanema during the mid-1940s through 1962. He was Sinhozinho''s most famous fighting student, representing the school in challenges against Mestre Bimba''s Regional (1949), the Gracie family (1953), and Artur Emídio (1953). His 1949 victory over Bimba''s student Perez reportedly impressed Bimba enough to incorporate some movements into Regional.',
  'Rudolf Hermanny treinou sob Mestre Sinhozinho em suas academias em Ipanema desde meados da década de 1940 até 1962. Ele foi o aluno lutador mais famoso de Sinhozinho, representando a escola em desafios contra a Regional de Mestre Bimba (1949), a família Gracie (1953) e Artur Emídio (1953). Sua vitória em 1949 sobre o aluno de Bimba, Perez, supostamente impressionou Bimba o suficiente para incorporar alguns movimentos na Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rudolf Hermanny associated_with Cirandinha (training partner)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training partner at Sinhozinho''s academy"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho/; nossa-tribo.com',
  'Rudolf Hermanny and Cirandinha (Luiz Pereira de Aguiar) were the two primary fighting representatives of Sinhozinho''s school. Together they represented capoeira carioca in the 1949 challenge against Bimba''s Regional and the 1953 challenge against the Gracie family at Vasco da Gama stadium.',
  'Rudolf Hermanny e Cirandinha (Luiz Pereira de Aguiar) foram os dois principais representantes de luta da escola de Sinhozinho. Juntos representaram a capoeira carioca no desafio de 1949 contra a Regional de Bimba e no desafio de 1953 contra a família Gracie no estádio do Vasco da Gama.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Cirandinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rudolf Hermanny trained_under Augusto Cordeiro - needs import first (judoka/combat consultant to Sinhozinho)
-- Rudolf Hermanny associated_with Bruno Hermanny - needs import first (brother, also trained under Sinhozinho)
-- Rudolf Hermanny associated_with André Lacé Lopes - needs import first (fellow Sinhozinho student, author of book about them)

-- Source: statements/persons/zehi.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zehí
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Zehí is the SUBJECT.
-- ============================================================

-- Zehí co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres; Contemporary Capoeira',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Zehí' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Zehí.
-- No students documented.
-- ============================================================

-- Source: statements/persons/traira.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Traíra
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Traíra is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Traíra student_of Waldemar
-- Started ~1947 at Escola de Capoeira Angola, Liberdade, Salvador
-- Primary formal teacher - Traíra managed Waldemar's roda
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki; multiple sources',
  'Traíra began formal training with Waldemar in 1947. He became so trusted that he managed Waldemar''s roda: "The late Traíra is who managed the roda. I''d arrive, give orders, then have beer" (Waldemar). Training continued until Traíra''s death ~1975.',
  'Traíra começou o treinamento formal com Waldemar em 1947. Tornou-se tão confiável que administrava a roda de Waldemar: "O finado Traíra é que tomava conta da roda. Eu chegava, dava as ordens e ia tomar cerveja" (Waldemar). Treinamento continuou até a morte de Traíra ~1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Cobrinha Verde
-- Recorded LP together (1962); contemporaries at Market Ramp rodas
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Recorded LP ''Capoeira da Bahia'' together (1962); photographed together at Market Ramp roda; contemporaries in Bahian capoeira Angola scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1962; multiple sources',
  'Recorded LP "Capoeira da Bahia" together with Cobrinha Verde and Gato Preto (1962). Both appear in LP booklet photos at Market Ramp roda. Both were prominent angoleiros in Salvador''s mid-century capoeira scene.',
  'Gravaram juntos o LP "Capoeira da Bahia" com Cobrinha Verde e Gato Preto (1962). Ambos aparecem nas fotos do encarte na roda da Rampa do Mercado. Ambos eram angoleiros proeminentes na cena da capoeira de Salvador em meados do século.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Bimba
-- Both appeared in film "Vadiação" (1954)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both appeared in pioneering film ''Vadiação'' (1954) by Alexandre Robatto Filho; contemporaries in Salvador capoeira scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; film documentation',
  'Both appeared in the pioneering capoeira film "Vadiação" (1954) by Alexandre Robatto Filho. Though Bimba taught Regional and Traíra practiced Angola under Waldemar, they were contemporaries in Salvador''s capoeira scene.',
  'Ambos apareceram no pioneiro filme de capoeira "Vadiação" (1954) de Alexandre Robatto Filho. Embora Bimba ensinasse Regional e Traíra praticasse Angola com Waldemar, eram contemporâneos na cena da capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Pastinha
-- Jorge Amado compared them as the two most elegant players
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Contemporaries; Jorge Amado wrote (1945) that only Pastinha could match Traíra in beauty of movements and agility"}'::jsonb,
  'likely'::genealogy.confidence,
  'Jorge Amado, Bahia de Todos os Santos (1945)',
  'Jorge Amado wrote in 1945: "only Pastinha can compete with him [Traíra] in the beauty of movements, in agility, in the quickness of strikes." Both were leading Angola practitioners in Salvador, though no direct training relationship is documented.',
  'Jorge Amado escreveu em 1945: "só mesmo Pastinha pode competir com ele [Traíra] na beleza dos movimentos, na agilidade, na rigidez dos golpes." Ambos eram importantes praticantes de Angola em Salvador, embora nenhuma relação direta de treinamento seja documentada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra trained_under Juvêncio
-- First capoeira encounters ~1938 in São Félix rodas
-- Informal training before formal study with Waldemar
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Velhos Mestres; Capoeira Connection (Ananias interview); CapoeiraWiki',
  'Traíra''s first exposure to capoeira was in the rodas of Mestre Juvêncio in São Félix, around 1938. Mestre Ananias encountered Traíra at these gatherings on the docks during festivals. Informal training before his formal study with Waldemar beginning in 1947.',
  'O primeiro contato de Traíra com a capoeira foi nas rodas de Mestre Juvêncio em São Félix, por volta de 1938. Mestre Ananias encontrou Traíra nesses encontros nas docas durante as festas. Treinamento informal antes de seu estudo formal com Waldemar começando em 1947.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra'
  AND o.apelido = 'Juvêncio' AND o.apelido_context = 'São Félix'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- GROUP RELATIONSHIPS
-- Traíra member_of Roda de São Félix - PENDING
-- Participated in Juvêncio's dock rodas (~1938) before formal training with Waldemar
-- Group 'Roda de São Félix (Juvêncio)' needs import first - see groups-backlog.md

-- PERSON RELATIONSHIPS
-- Traíra trained_under Severo do Pelourinho - PENDING
-- Mentioned by Traíra as another teacher
-- Little is known about Severo do Pelourinho
-- Object 'Severo do Pelourinho' needs import first - see persons-backlog.md

-- Traíra associated_with Gato Preto - PENDING
-- Recorded LP together (1962)
-- Object 'Gato Preto' needs import first - see persons-backlog.md

-- Note: Barba Branca's student_of Traíra relationship should be in barba-branca.sql
-- when that person is imported (per ownership rule: statement goes in subject's file)

-- Source: statements/persons/vitor-agau.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Vitor Agaú
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Vitor Agaú is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- NOTE: Onça Preta student_of Vitor Agaú is in statements/persons/onca-preta.sql (subject's file)

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941 at Ladeira de Pedra in Gengibirra. Vitor H.D. is listed in Mestre Pastinha''s account of the mestres present when Amorzinho passed leadership to Pastinha."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account via jogodavidaweb.wordpress.com; capoeira.fandom.com/wiki/Mestre_Pastinha',
  E'Both were among the mestres present when civil guard Amorzinho passed leadership of the traditional roda at Gengibirra to Pastinha, founding CECA on February 23, 1941.',
  E'Ambos estavam entre os mestres presentes quando o guarda civil Amorzinho passou a liderança da roda tradicional no Gengibirra para Pastinha, fundando o CECA em 23 de fevereiro de 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles p
WHERE v.apelido = 'Vitor Agaú' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Aberrê (CECA founding mestres)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941 at Ladeira de Pedra in Gengibirra."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account via jogodavidaweb.wordpress.com; Mestre Noronha manuscripts',
  'Both were among the founding mestres present at CECA''s establishment in 1941.',
  'Ambos estavam entre os mestres fundadores presentes no estabelecimento do CECA em 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles a
WHERE v.apelido = 'Vitor Agaú' AND a.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Noronha (CECA founding mestres)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, n.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941. Noronha was one of the four ''donos e proprietários'' of Gengibirra."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts',
  'Both were among the founding mestres present at CECA''s establishment in 1941.',
  'Ambos estavam entre os mestres fundadores presentes no estabelecimento do CECA em 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles n
WHERE v.apelido = 'Vitor Agaú' AND n.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Amorzinho (CECA founding mestres)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the founding mestres of Gengibirra/CECA. Amorzinho was one of the four organizational leaders who passed leadership to Pastinha in 1941."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts; velhosmestres.com',
  'Both were among the founding mestres of Gengibirra and present at CECA''s establishment. Amorzinho died in 1943.',
  'Ambos estavam entre os mestres fundadores do Gengibirra e presentes no estabelecimento do CECA. Amorzinho morreu em 1943.'
FROM genealogy.person_profiles v, genealogy.person_profiles a
WHERE v.apelido = 'Vitor Agaú' AND a.apelido = 'Amorzinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Livino (CECA founding mestres)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, l.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941. Livino was one of the four ''donos e proprietários'' of Gengibirra."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts',
  'Both were among the founding mestres present at CECA''s establishment in 1941.',
  'Ambos estavam entre os mestres fundadores presentes no estabelecimento do CECA em 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles l
WHERE v.apelido = 'Vitor Agaú' AND l.apelido = 'Livino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

COMMIT;
