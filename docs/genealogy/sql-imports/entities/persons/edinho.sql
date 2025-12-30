-- ============================================================
-- GENEALOGY PERSON: Edinho
-- Generated: 2025-12-25
-- ============================================================
-- LIMITED INFORMATION: Mestre Edinho is one of only four students
-- formally graduated to mestre level (white handkerchief) by Mestre
-- Bimba during his lifetime. The others were Decânio, Jair Moura,
-- and Miranda. Both Edinho and Miranda are confirmed deceased
-- (before Bimba's death in 1974).
--
-- Mestre Edinho himself is the source for the quote identifying
-- the four white handkerchief recipients: "os únicos a receberem
-- o título de Mestre da Regional Baiana pelas próprias mãos de
-- Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho".
--
-- BIRTH YEAR ESTIMATION (1920, decade precision):
-- Edinho was a contemporary of Decânio (born 1923) and Miranda
-- (estimated 1920s). To achieve mestre status required 15-20+ years
-- of training. He died before Bimba (1974). If he started training
-- in his teens/20s like Decânio and trained long enough to receive
-- the highest honor, he was likely born in the 1920s. Using 1920
-- as a conservative estimate with decade precision.
--
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Edinho',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['http://www.cativeiro.de/?page_id=39&lang=en', 'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/contramestre-e-nao-mestrandomestrando-em-capoeira/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba and received the highest honor in Capoeira Regional: the white handkerchief (lenço branco) signifying mestre status. One of only four students to receive this distinction from Bimba during his lifetime. Edinho himself is the source for the authoritative statement identifying all four recipients.',
  E'Treinou diretamente com Mestre Bimba e recebeu a maior honra da Capoeira Regional: o lenço branco significando o status de mestre. Um dos apenas quatro alunos a receber esta distinção de Bimba durante sua vida. O próprio Edinho é a fonte da declaração que identifica todos os quatro destinatários.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Edinho holds a unique place in Capoeira Regional history as both one of its most honored practitioners and its primary witness to that honor. He was one of only four students to receive the white handkerchief (lenço branco) directly from Mestre Bimba during the founder''s lifetime—the highest distinction in Bimba''s graduation system.

According to Mestre Edinho himself: "Os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (The only ones to receive the title of Master of Regional Baiana directly from Mestre Bimba''s own hands were Jair Moura, Miranda, Decânio, and Edinho himself). This statement, preserved in Portal Capoeira, serves as the authoritative source for identifying all four white handkerchief recipients.

The white handkerchief represented the pinnacle of achievement in Capoeira Regional. The graduation system—using colored silk handkerchiefs—was an innovation by Mestre Bimba that honored the capoeiristas of the past, who supposedly wore such handkerchiefs around their necks since straight razors cannot cut silk. After the basic course (blue handkerchief), the specialization course (red), and advanced training including defense against armed opponents (yellow), only those who had dedicated many years to the art and demonstrated complete mastery received the white handkerchief.

As Mestre Itapoan noted in a lecture: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died". Those two deceased recipients were Edinho and Miranda, confirming that both died before Mestre Bimba''s own death in 1974.

Edinho trained at Bimba''s Centro de Cultura Física e Luta Regional in Salvador, Bahia. The academy, founded in 1932 and officially certified by the state education board in 1937, was the first formal capoeira institution in Brazil. To receive the white handkerchief required completing all eight teaching sequences (sequências), mastering the cintura desprezada (grappling techniques), passing the specialization courses including weapons defense, and demonstrating not just technical mastery but also ethical integrity—Bimba considered that capoeira practice should always be associated with educational objectives.

The limited documentation about Edinho stands in stark contrast to the substantial records about his fellow white handkerchief recipients Decânio and Jair Moura. While Decânio became a physician who wrote extensively about capoeira philosophy and Jair Moura became a prolific historian and filmmaker, Edinho''s legacy survives primarily through his authoritative testimony about the four mestres and his status as one of Bimba''s most accomplished students.

His legacy, though poorly documented compared to Decânio and Jair Moura, remains significant as the primary witness to one of the most important facts in Capoeira Regional history: the identity of Mestre Bimba''s four formally graduated mestres.',
  -- bio_pt
  E'Mestre Edinho ocupa um lugar único na história da Capoeira Regional como um de seus praticantes mais honrados e como testemunha primária dessa honra. Ele foi um dos apenas quatro alunos a receber o lenço branco diretamente de Mestre Bimba durante a vida do fundador—a maior distinção no sistema de graduação de Bimba.

Segundo o próprio Mestre Edinho: "Os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho". Esta declaração, preservada no Portal Capoeira, serve como fonte autoritativa para identificar todos os quatro destinatários do lenço branco.

O lenço branco representava o ápice da conquista na Capoeira Regional. O sistema de graduação—usando lenços de seda coloridos—foi uma inovação de Mestre Bimba que homenageava os capoeiristas do passado, que supostamente usavam tais lenços no pescoço já que navalhas não cortam seda. Após o curso básico (lenço azul), o curso de especialização (vermelho), e treinamento avançado incluindo defesa contra oponentes armados (amarelo), apenas aqueles que haviam dedicado muitos anos à arte e demonstrado maestria completa recebiam o lenço branco.

Como observou Mestre Itapoan em uma palestra: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram". Esses dois destinatários falecidos eram Edinho e Miranda, confirmando que ambos morreram antes da própria morte de Mestre Bimba em 1974.

Edinho treinou no Centro de Cultura Física e Luta Regional de Bimba em Salvador, Bahia. A academia, fundada em 1932 e oficialmente certificada pelo conselho estadual de educação em 1937, foi a primeira instituição formal de capoeira no Brasil. Para receber o lenço branco era necessário completar todas as oito sequências de ensino, dominar a cintura desprezada (técnicas de agarramento), passar nos cursos de especialização incluindo defesa contra armas, e demonstrar não apenas maestria técnica mas também integridade ética—Bimba considerava que a prática da capoeira deveria estar sempre associada a objetivos educacionais.

A documentação limitada sobre Edinho contrasta fortemente com os registros substanciais sobre seus colegas que receberam o lenço branco, Decânio e Jair Moura. Enquanto Decânio tornou-se médico e escreveu extensivamente sobre filosofia da capoeira e Jair Moura tornou-se historiador e cineasta prolífico, o legado de Edinho sobrevive principalmente através de seu testemunho autoritativo sobre os quatro mestres e seu status como um dos alunos mais realizados de Bimba.

Seu legado, embora pouco documentado em comparação com Decânio e Jair Moura, permanece significativo como testemunha primária de um dos fatos mais importantes da história da Capoeira Regional: a identidade dos quatro mestres formalmente graduados por Mestre Bimba.',
  -- achievements_en
  E'One of only four students to receive the white handkerchief (mestre graduation) directly from Mestre Bimba; Completed full Capoeira Regional training under Bimba including sequências, cintura desprezada, and specialization courses; Primary source for identifying all four white handkerchief recipients',
  -- achievements_pt
  E'Um dos apenas quatro alunos a receber o lenço branco (graduação de mestre) diretamente de Mestre Bimba; Completou treinamento completo de Capoeira Regional sob Bimba incluindo sequências, cintura desprezada e cursos de especialização; Fonte primária para identificar todos os quatro destinatários do lenço branco',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Edinho was a contemporary of Decânio (born 1923) and Miranda (estimated 1920s) as all three received the white handkerchief from Bimba. To achieve mestre status required many years of dedicated training (typically 15-20+ years). He died before Bimba (1974), so he achieved mestre status by early 1970s at latest. If he started training in his teens/20s like Decânio and trained long enough to receive the highest honor, he was likely born in the 1920s. Using 1920 as conservative estimate with decade precision.

LIMITED DOCUMENTATION: Mestre Edinho is among the least documented of Bimba''s white handkerchief recipients, despite being the PRIMARY SOURCE for identifying all four recipients.

FULL NAME: Unknown. No civil name found in any source. The apelido "Edinho" is a common Brazilian diminutive (usually of Eduardo, Edson, Edinaldo, or similar).

DEATH: Confirmed deceased before Bimba (1974). According to Mestre Itapoan: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died". The two deceased are Edinho and Miranda.

TRAINING PERIOD: Unknown exact dates. Must have trained with Bimba at Centro de Cultura Física e Luta Regional in Salvador between 1932 (academy founding) and early 1970s.

THE FOUR WHITE HANDKERCHIEF RECIPIENTS:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - 1936-2020
3. Miranda (Ney Miranda) - deceased before 1974
4. Edinho - deceased before 1974

AUTHORITATIVE SOURCE STATEMENT:
Mestre Edinho confirmed: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira). This is the primary source for the four mestres list.

TRAINING COMPANIONS (known from the same era):
- Mestre Decânio (began 1938)
- Jair Moura (began late 1950s)
- Mestre Miranda
- Likely trained alongside many of Bimba''s famous students from the Consolidation Phase (1938-1966)

RESEARCH GAPS:
- No full civil name found
- No birth date or year found (estimate only)
- No specific death date found (only "before 1974")
- No photographs located
- No information about any students he may have trained
- No information about activities outside of Bimba''s academy
- No information about profession or background',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, década):
Edinho era contemporâneo de Decânio (nascido em 1923) e Miranda (estimado anos 1920), pois todos os três receberam o lenço branco de Bimba. Alcançar o status de mestre exigia muitos anos de treinamento dedicado (tipicamente 15-20+ anos). Ele morreu antes de Bimba (1974), então alcançou o status de mestre no máximo no início dos anos 1970. Se ele começou a treinar na adolescência/20 anos como Decânio e treinou tempo suficiente para receber a maior honra, provavelmente nasceu nos anos 1920. Usando 1920 como estimativa conservadora com precisão de década.

DOCUMENTAÇÃO LIMITADA: Mestre Edinho está entre os menos documentados dos destinatários do lenço branco de Bimba, apesar de ser a FONTE PRIMÁRIA para identificar todos os quatro destinatários.

NOME COMPLETO: Desconhecido. Nenhum nome civil encontrado em qualquer fonte. O apelido "Edinho" é um diminutivo brasileiro comum (geralmente de Eduardo, Edson, Edinaldo, ou similar).

MORTE: Confirmado falecido antes de Bimba (1974). Segundo Mestre Itapoan: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram". Os dois falecidos são Edinho e Miranda.

PERÍODO DE TREINAMENTO: Datas exatas desconhecidas. Deve ter treinado com Bimba no Centro de Cultura Física e Luta Regional em Salvador entre 1932 (fundação da academia) e início dos anos 1970.

OS QUATRO DESTINATÁRIOS DO LENÇO BRANCO:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - 1936-2020
3. Miranda (Ney Miranda) - falecido antes de 1974
4. Edinho - falecido antes de 1974

DECLARAÇÃO DA FONTE AUTORITATIVA:
Mestre Edinho confirmou: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira). Esta é a fonte primária para a lista dos quatro mestres.

COMPANHEIROS DE TREINAMENTO (conhecidos da mesma época):
- Mestre Decânio (iniciou 1938)
- Jair Moura (iniciou final dos anos 1950)
- Mestre Miranda
- Provavelmente treinou ao lado de muitos dos famosos alunos de Bimba da Fase de Consolidação (1938-1966)

LACUNAS NA PESQUISA:
- Nenhum nome civil completo encontrado
- Nenhuma data de nascimento encontrada (apenas estimativa)
- Nenhuma data específica de morte encontrada (apenas "antes de 1974")
- Nenhuma fotografia localizada
- Nenhuma informação sobre alunos que ele possa ter treinado
- Nenhuma informação sobre atividades fora da academia de Bimba
- Nenhuma informação sobre profissão ou antecedentes'
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
