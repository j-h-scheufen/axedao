-- ============================================================
-- GENEALOGY PERSON: Lapinha
-- Generated: 2026-01-09
-- Primary Source: https://capoeirahistory.com/mestre/master-roque-1938/
-- ============================================================
-- DEPENDENCIES: roque.sql (primary teacher)
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (~1950s, decade precision):
-- - Paulo Siqueira started training ~1972 (born 1955)
-- - Sandrinha started ~1969 (born 1959)
-- - Roque taught at Pavãozinho for 12 years (~1960-1972), then various locations
-- - Lapinha "accompanied Roque at a later stage" of his teaching
-- - Still active in 2019 (interviewed for capoeirahistory.com)
-- Estimate: Born ~1950s to still be active as mestre in 2019.
--
-- FULL NAME SOURCE:
-- capoeirahistory.com Master Sandrinha article identifies Lapinha as
-- "Djalma Antônio Souza Nascimento" in the context of his 2019 interview.
--
-- PHOTOGRAPHIC EVIDENCE:
-- - "Masters Lapinha, Acordeon e Roque" (from Acervo M. Lapinha)
-- - "Masters Artur Emídio, Mendonça, Roque and Lapinha (crouched)" (M. Lapinha Collection)
-- Lapinha maintains a personal archive documenting Rio de Janeiro capoeira history.
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
  'Djalma Antônio Souza Nascimento',
  'Lapinha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-roque-1938/', 'https://capoeirahistory.com/students-of-mestre-roque/', 'https://capoeirahistory.com/mestre/master-sandrinha-1959/']::text[],
  'angola'::genealogy.style,
  E'Trained in the Bahian Angola tradition through Mestre Roque''s "line of São Bento"—a faster style of Angola that Roque brought from Salvador to Rio de Janeiro. This style was different from the capoeira of the Senzala group that dominated Rio''s Zona Sul.',
  E'Treinado na tradição Angola baiana através da "linha de São Bento" de Mestre Roque—um estilo de Angola mais rápido que Roque trouxe de Salvador para o Rio de Janeiro. Este estilo era diferente da capoeira do grupo Senzala que dominava a Zona Sul do Rio.',
  1955,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Djalma Antônio Souza Nascimento, known as Mestre Lapinha, is a capoeira mestre from the lineage of Mestre Roque in Rio de Janeiro. He joined Roque''s school at a later stage of Roque''s teaching career, after the master had already established himself as one of the four founding lineages of contemporary capoeira in Rio de Janeiro.\n\nLapinha trained under Roque alongside other students who would become significant figures in their own right: Sandrinha (recognized as possibly the first female mestra in Brazil), Paulo Siqueira (who would become a pioneer of capoeira in Germany), Poeira, Derli, and Cosme. Through this lineage, Lapinha inherited the Angola tradition of the "line of São Bento" that Roque brought from Bahia to Rio''s Zona Sul.\n\nBeyond his practice of capoeira, Lapinha became an important documentarian of Rio de Janeiro capoeira history. He maintains a personal archive (Acervo M. Lapinha) containing photographs from the capoeira community. Historical photos from his collection show him with notable mestres including Acordeon (of Mestre Bimba''s lineage), Artur Emídio, Mendonça, and his teacher Roque—documenting connections across different lineages and eras.\n\nIn 2019, Lapinha was interviewed for the Capoeira History documentation project, providing testimony about his training with Roque and his memories of fellow students. His account of Mestra Sandrinha reveals the intensity of the training environment: "This Sandrinha... she played a lot. Nobody could challenge her, no. Nobody would dare to provoke her." He described how Roque "loved her. He treated her like she was his daughter. And he incorporated capoeira into this woman."\n\nThrough his practice, teaching, and documentation efforts, Lapinha represents the continuation of Mestre Roque''s lineage into the contemporary era.',
  E'Djalma Antônio Souza Nascimento, conhecido como Mestre Lapinha, é um mestre de capoeira da linhagem de Mestre Roque no Rio de Janeiro. Ele entrou na escola de Roque em uma fase mais avançada da carreira de ensino do mestre, depois que este já havia se estabelecido como uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro.\n\nLapinha treinou com Roque junto com outros alunos que se tornariam figuras significativas por conta própria: Sandrinha (reconhecida como possivelmente a primeira mestra de capoeira no Brasil), Paulo Siqueira (que se tornaria pioneiro da capoeira na Alemanha), Poeira, Derli e Cosme. Através desta linhagem, Lapinha herdou a tradição Angola da "linha de São Bento" que Roque trouxe da Bahia para a Zona Sul do Rio.\n\nAlém de sua prática de capoeira, Lapinha se tornou um importante documentarista da história da capoeira no Rio de Janeiro. Ele mantém um arquivo pessoal (Acervo M. Lapinha) contendo fotografias da comunidade capoeirista. Fotos históricas de sua coleção o mostram com mestres notáveis incluindo Acordeon (da linhagem de Mestre Bimba), Artur Emídio, Mendonça e seu professor Roque—documentando conexões entre diferentes linhagens e épocas.\n\nEm 2019, Lapinha foi entrevistado para o projeto de documentação Capoeira History, fornecendo depoimento sobre seu treinamento com Roque e suas memórias de colegas de treino. Seu relato sobre Mestra Sandrinha revela a intensidade do ambiente de treinamento: "Essa Sandrinha... ela jogava muito. Ninguém podia desafiá-la, não. Ninguém se atrevia a provocá-la." Ele descreveu como Roque "a amava. Ele a tratava como se fosse sua filha. E ele incorporou a capoeira nesta mulher."\n\nAtravés de sua prática, ensino e esforços de documentação, Lapinha representa a continuação da linhagem de Mestre Roque na era contemporânea.',
  E'Student of Mestre Roque (Rio de Janeiro)\nMaintains personal archive documenting Rio de Janeiro capoeira history (Acervo M. Lapinha)\nContributed oral history testimony to Capoeira History documentation project (2019)\nPreserves the "line of São Bento" Angola tradition from Roque''s lineage',
  E'Aluno de Mestre Roque (Rio de Janeiro)\nMantém arquivo pessoal documentando a história da capoeira no Rio de Janeiro (Acervo M. Lapinha)\nContribuiu com depoimento de história oral para o projeto de documentação Capoeira History (2019)\nPreserva a tradição Angola da "linha de São Bento" da linhagem de Roque',
  E'BIRTH YEAR ESTIMATION (1955, decade precision):\n- Fellow student Paulo Siqueira was born 1955, started training ~1972\n- Fellow student Sandrinha was born 1959, started ~1969\n- Lapinha "accompanied Roque at a later stage" of his teaching career\n- Still active in 2019 (interviewed for capoeirahistory.com)\n- Estimate: Born ~1950s to be contemporary with other students and still active in 2019\n\nFULL NAME SOURCE:\ncapoeirahistory.com Master Sandrinha article identifies him as "Djalma Antônio Souza Nascimento" in context of 2019 interview.\n\nNAME DISCREPANCY:\n- "Lapinha" is also a neighborhood in Salvador (where Bigodinho ran Grupo Resistência)\n- This Lapinha is a PERSON, student of Roque in Rio de Janeiro\n- No indication of connection to Salvador''s Lapinha neighborhood\n\nTEACHERS:\n- Mestre Roque (primary teacher, "later stage" of Roque''s career, ~1970s-1980s)\n\nFELLOW STUDENTS UNDER ROQUE:\n- Sandrinha (Mestra) - "Nobody could challenge her"\n- Paulo Siqueira (Mestre) - Pioneer in Germany\n- Poeira (Mestre)\n- Derli (Mestre)\n- Cosme (Mestre)\n- Adilson/Camisa Preta (Mestre) - Senior student who took over academy\n\nMEDIA APPEARANCES:\n- 2019: Interview for Capoeira History documentation project\n\nPHOTOGRAPHIC ARCHIVE (Acervo M. Lapinha):\n- Photo with Mestres Acordeon and Roque\n- Photo with Mestres Artur Emídio, Mendonça, Roque (Lapinha crouched)\n- Archive used as source for capoeirahistory.com articles\n\nQUOTE ON SANDRINHA:\n"This Sandrinha... she played a lot. Nobody could challenge her, no. Nobody would dare to provoke her."\n"[Roque] loved her. He treated her like she was his daughter. And he incorporated capoeira into this woman."',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1955, precisão de década):\n- Colega de treino Paulo Siqueira nasceu em 1955, começou a treinar ~1972\n- Colega de treino Sandrinha nasceu em 1959, começou ~1969\n- Lapinha "acompanhou Roque em uma fase mais avançada" de sua carreira de ensino\n- Ainda ativo em 2019 (entrevistado para capoeirahistory.com)\n- Estimativa: Nascido nos anos 1950 para ser contemporâneo de outros alunos e ainda ativo em 2019\n\nFONTE DO NOME COMPLETO:\nArtigo da Master Sandrinha no capoeirahistory.com o identifica como "Djalma Antônio Souza Nascimento" no contexto da entrevista de 2019.\n\nDISCREPÂNCIA DE NOME:\n- "Lapinha" também é um bairro em Salvador (onde Bigodinho coordenava o Grupo Resistência)\n- Este Lapinha é uma PESSOA, aluno de Roque no Rio de Janeiro\n- Sem indicação de conexão com o bairro da Lapinha em Salvador\n\nMESTRES:\n- Mestre Roque (professor principal, "fase mais avançada" da carreira de Roque, ~anos 1970-1980)\n\nCOLEGAS DE TREINO SOB ROQUE:\n- Sandrinha (Mestra) - "Ninguém podia desafiá-la"\n- Paulo Siqueira (Mestre) - Pioneiro na Alemanha\n- Poeira (Mestre)\n- Derli (Mestre)\n- Cosme (Mestre)\n- Adilson/Camisa Preta (Mestre) - Aluno sênior que assumiu a academia\n\nAPARIÇÕES NA MÍDIA:\n- 2019: Entrevista para projeto de documentação Capoeira History\n\nARQUIVO FOTOGRÁFICO (Acervo M. Lapinha):\n- Foto com Mestres Acordeon e Roque\n- Foto com Mestres Artur Emídio, Mendonça, Roque (Lapinha agachado)\n- Arquivo usado como fonte para artigos do capoeirahistory.com\n\nCITAÇÃO SOBRE SANDRINHA:\n"Essa Sandrinha... ela jogava muito. Ninguém podia desafiá-la, não. Ninguém se atrevia a provocá-la."\n"[Roque] a amava. Ele a tratava como se fosse sua filha. E ele incorporou a capoeira nesta mulher."'
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
