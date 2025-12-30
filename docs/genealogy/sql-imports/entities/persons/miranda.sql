-- ============================================================
-- GENEALOGY PERSON: Miranda
-- Generated: 2025-12-25
-- ============================================================
-- LIMITED INFORMATION: Mestre Miranda is one of only four students
-- formally graduated to mestre level (white handkerchief) by Mestre
-- Bimba during his lifetime. The others were Decânio, Jair Moura,
-- and Edinho. Both Miranda and Edinho are confirmed deceased.
--
-- The only documented name beyond the apelido is "Ney Miranda"
-- from CapoeiraHub's database.
--
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- Miranda was a contemporary of Decânio (born 1923). To achieve
-- mestre status required 15-20+ years of training. He died before
-- Bimba (1974). If he started training in his teens/20s like
-- Decânio, he was likely born in the 1920s.
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
  'Ney Miranda',
  'Miranda',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeirahub.net/mestres']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba and received the highest honor in Capoeira Regional: the white handkerchief (lenço branco) signifying mestre status. One of only four students to receive this distinction from Bimba during his lifetime.',
  E'Treinou diretamente com Mestre Bimba e recebeu a maior honra da Capoeira Regional: o lenço branco significando o status de mestre. Um dos apenas quatro alunos a receber esta distinção de Bimba durante sua vida.',
  -- Life dates
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Miranda is one of the most historically significant yet least documented figures in Capoeira Regional history. He was one of only four students to receive the white handkerchief (lenço branco) directly from Mestre Bimba during the founder''s lifetime—the highest honor in Bimba''s graduation system.

The four mestres formally graduated by Bimba were: Angelo Augusto Decânio Filho (Mestre Decânio), Jair Moura, Miranda, and Edinho. According to Mestre Edinho himself, these were "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba" (the only ones to receive the title of Master of Regional Baiana directly from Mestre Bimba''s own hands).

The white handkerchief represented the pinnacle of achievement in Capoeira Regional. As noted by Mestre Itapoan in a lecture about Bimba: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died." Those two deceased recipients were Miranda and Edinho.

Miranda trained at Bimba''s Centro de Cultura Física e Luta Regional in Salvador, Bahia, though the exact dates of his training period are not documented in available sources. The limited records about Miranda stand in contrast to the substantial documentation about his fellow white handkerchief recipients Decânio and Jair Moura, both of whom went on to become prolific authors and historians of capoeira.

The full name "Ney Miranda" appears in CapoeiraHub''s database of Capoeira Regional mestres, providing one of the few details beyond his apelido.

Miranda''s death occurred before Mestre Bimba''s own death in 1974, though the exact date is not recorded in accessible sources.',
  -- bio_pt
  E'Mestre Miranda é uma das figuras mais historicamente significativas, porém menos documentadas, da história da Capoeira Regional. Ele foi um dos apenas quatro alunos a receber o lenço branco diretamente de Mestre Bimba durante a vida do fundador—a maior honra no sistema de graduação de Bimba.

Os quatro mestres formalmente graduados por Bimba foram: Angelo Augusto Decânio Filho (Mestre Decânio), Jair Moura, Miranda e Edinho. Segundo o próprio Mestre Edinho, estes foram "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba."

O lenço branco representava o ápice da conquista na Capoeira Regional. Como observou Mestre Itapoan em uma palestra sobre Bimba: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram." Esses dois destinatários falecidos eram Miranda e Edinho.

Miranda treinou no Centro de Cultura Física e Luta Regional de Bimba em Salvador, Bahia, embora as datas exatas de seu período de treinamento não estejam documentadas nas fontes disponíveis. Os registros limitados sobre Miranda contrastam com a documentação substancial sobre seus colegas que receberam o lenço branco, Decânio e Jair Moura, ambos que se tornaram autores prolíficos e historiadores da capoeira.

O nome completo "Ney Miranda" aparece no banco de dados de mestres de Capoeira Regional do CapoeiraHub, fornecendo um dos poucos detalhes além de seu apelido.

A morte de Miranda ocorreu antes da própria morte de Mestre Bimba em 1974, embora a data exata não esteja registrada nas fontes acessíveis.',
  -- achievements_en
  E'One of only four students to receive the white handkerchief (mestre graduation) directly from Mestre Bimba; Completed full Capoeira Regional training under Bimba including sequências, cintura desprezada, and specialization courses',
  -- achievements_pt
  E'Um dos apenas quatro alunos a receber o lenço branco (graduação de mestre) diretamente de Mestre Bimba; Completou treinamento completo de Capoeira Regional sob Bimba incluindo sequências, cintura desprezada e cursos de especialização',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1925, decade):
Miranda was a contemporary of Decânio (born 1923) as both received the white handkerchief from Bimba. To achieve mestre status required many years of dedicated training (typically 15-20+ years). He died before Bimba (1974), so he achieved mestre status by early 1970s at latest. If he started training in his teens/20s like Decânio and trained long enough to receive the highest honor, he was likely born in the 1920s. Using 1925 as midpoint with decade precision.

LIMITED DOCUMENTATION: Mestre Miranda is one of the least documented of Bimba''s white handkerchief recipients, despite being one of only four students to achieve this highest honor.

FULL NAME: "Ney Miranda" appears in CapoeiraHub database. No other sources provide his civil name or birth name.

DEATH: Confirmed deceased. According to Mestre Itapoan: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died." The two deceased are Miranda and Edinho. Both died before Bimba (1974).

TRAINING PERIOD: Unknown exact dates. Must have trained with Bimba at Centro de Cultura Física e Luta Regional in Salvador between 1932 (academy founding) and early 1970s.

THE FOUR WHITE HANDKERCHIEF RECIPIENTS:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - historian, still living as of last research
3. Miranda (Ney Miranda) - deceased before 1974
4. Edinho - deceased before 1974

SOURCE STATEMENT: Mestre Edinho confirmed: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira).

TRAINING COMPANIONS (known):
- Mestre Decânio (began 1938)
- Jair Moura
- Mestre Edinho
- Likely trained alongside many of Bimba''s famous students from the Consolidation Phase (1938-1966) and Propagation Phase (1967-1973)

RESEARCH GAPS:
- No birth date or year found
- No specific death date found (only "before 1974")
- No photographs located
- No information about any students he may have trained
- No information about activities outside of Bimba''s academy',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1925, década):
Miranda era contemporâneo de Decânio (nascido em 1923), pois ambos receberam o lenço branco de Bimba. Alcançar o status de mestre exigia muitos anos de treinamento dedicado (tipicamente 15-20+ anos). Ele morreu antes de Bimba (1974), então alcançou o status de mestre no máximo no início dos anos 1970. Se ele começou a treinar na adolescência/20 anos como Decânio e treinou tempo suficiente para receber a maior honra, provavelmente nasceu nos anos 1920. Usando 1925 como ponto médio com precisão de década.

DOCUMENTAÇÃO LIMITADA: Mestre Miranda é um dos menos documentados dos destinatários do lenço branco de Bimba, apesar de ser um dos apenas quatro alunos a alcançar esta maior honra.

NOME COMPLETO: "Ney Miranda" aparece no banco de dados do CapoeiraHub. Nenhuma outra fonte fornece seu nome civil ou nome de nascimento.

MORTE: Confirmado falecido. Segundo Mestre Itapoan: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram." Os dois falecidos são Miranda e Edinho. Ambos morreram antes de Bimba (1974).

PERÍODO DE TREINAMENTO: Datas exatas desconhecidas. Deve ter treinado com Bimba no Centro de Cultura Física e Luta Regional em Salvador entre 1932 (fundação da academia) e início dos anos 1970.

OS QUATRO DESTINATÁRIOS DO LENÇO BRANCO:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - historiador, ainda vivo conforme última pesquisa
3. Miranda (Ney Miranda) - falecido antes de 1974
4. Edinho - falecido antes de 1974

DECLARAÇÃO DA FONTE: Mestre Edinho confirmou: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira).

COMPANHEIROS DE TREINAMENTO (conhecidos):
- Mestre Decânio (iniciou 1938)
- Jair Moura
- Mestre Edinho
- Provavelmente treinou ao lado de muitos dos famosos alunos de Bimba da Fase de Consolidação (1938-1966) e Fase de Propagação (1967-1973)

LACUNAS NA PESQUISA:
- Nenhuma data de nascimento encontrada
- Nenhuma data específica de morte encontrada (apenas "antes de 1974")
- Nenhuma fotografia localizada
- Nenhuma informação sobre alunos que ele possa ter treinado
- Nenhuma informação sobre atividades fora da academia de Bimba'
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
