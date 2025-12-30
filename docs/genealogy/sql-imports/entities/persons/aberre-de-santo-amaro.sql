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
  E'Praticava capoeira pré-codificada em Santo Amaro da Purificação no Recôncavo Baiano. Seu estilo de ensino enfatizava "os segredos e mistérios da capoeiragem". Como o Aberrê de Salvador, carregava uma bengala tanto por elegância quanto como arma em potencial.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio)
  E'Little is known about Antônio Rufino dos Santos beyond his role as the teacher of Mestre Caiçara. If he existed as a separate person from Aberrê de Salvador (Antônio Raimundo Argolo), he was a mestre active in the capoeira scene of Santo Amaro da Purificação—a city in the Recôncavo Baiano region around the Bay of All Saints—in the early 20th century.

In 1938, a 14-year-old Antônio Conceição Moraes (later Mestre Caiçara) began learning capoeira from "Mestre Aberrê de Santo Amaro". According to multiple sources including Mestre Gildo Alfinete, this teacher''s full name was Antônio Rufino dos Santos. Aberrê taught Caiçara "os segredos e mistérios da capoeiragem"—the secrets and mysteries of the practice of capoeira.

The most telling evidence for two distinct Aberrês comes from Mestre Caiçara''s own testimony. According to sources, Caiçara distinguished between two masters: his teacher "José Rufino" and a different Aberrê connected to Pastinha whom he called "José Raimundo". This distinction aligns with the documented names: Antônio **Rufino** dos Santos (Santo Amaro) vs. Antônio **Raimundo** Argolo (Salvador).

The bengala (walking cane) that became Mestre Caiçara''s trademark was given to him by his Mestre Aberrê before the mestre''s death. According to Caiçara, his master also carried a bengala—both for practical use and as a sign of elegance. In the hands of a capoeirista, such a cane could become a deadly weapon. The timing of his death is unclear.

If Aberrê de Santo Amaro was teaching in 1938, he was likely born sometime in the 1880s-1900s. A mestre teaching a new student would typically be at least in his 30s-40s, suggesting birth around 1890-1905.

**Why this matters:** Both Mestre Canjiquinha and Mestre Caiçara consistently denied connection to Pastinha''s lineage throughout their lives. If Canjiquinha trained under the Salvador Aberrê (who invited Pastinha to Gengibirra in 1941), why would he deny the connection? The "Two Aberrês" theory provides an explanation: perhaps both students were telling the truth because there were indeed two different teachers named Aberrê.',
  -- bio_pt
  E'Pouco se sabe sobre Antônio Rufino dos Santos além de seu papel como professor de Mestre Caiçara. Se ele existiu como pessoa separada de Aberrê de Salvador (Antônio Raimundo Argolo), foi um mestre ativo na cena da capoeira de Santo Amaro da Purificação—uma cidade no Recôncavo Baiano em torno da Baía de Todos os Santos—no início do século XX.

Em 1938, Antônio Conceição Moraes, de 14 anos (mais tarde Mestre Caiçara), começou a aprender capoeira com "Mestre Aberrê de Santo Amaro". Segundo múltiplas fontes, incluindo Mestre Gildo Alfinete, o nome completo deste professor era Antônio Rufino dos Santos. Aberrê ensinou a Caiçara "os segredos e mistérios da capoeiragem".

A evidência mais reveladora para dois Aberrês distintos vem do próprio testemunho de Mestre Caiçara. Segundo fontes, Caiçara distinguia entre dois mestres: seu professor "José Rufino" e um Aberrê diferente conectado a Pastinha que ele chamava de "José Raimundo". Essa distinção alinha com os nomes documentados: Antônio **Rufino** dos Santos (Santo Amaro) vs. Antônio **Raimundo** Argolo (Salvador).

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
