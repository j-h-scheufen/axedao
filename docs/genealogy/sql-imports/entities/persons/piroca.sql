-- ============================================================
-- GENEALOGY PERSON: Piroca
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890 based on active period in 1920s alongside
-- brother Pedro Porreta (also estimated ~1890). If 25-35 years old during
-- the December 1920 incident, birth = ~1885-1895. Using 1890 as midpoint.
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
  'Pedro de Alcântara da Conceição',
  'Piroca',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-9', 'https://velhosmestres.com/br/destaques-9', 'https://books.scielo.org/id/pvm8g']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s). Known for using razors in street fights alongside his brother Pedro Porreta. Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s). Conhecido por usar navalhas em brigas de rua ao lado de seu irmão Pedro Porreta. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bilingual)
  E'Pedro de Alcântara da Conceição, known as Piroca, was a capoeirista and valentão of early 20th century Salvador, Bahia. He was the brother of Pedro Celestino dos Santos (Pedro Porreta), and together they dominated the Baixa dos Sapateiros neighborhood.\n\nThe book "Mestres e capoeiras famosos da Bahia" features the two brothers together with the subtitle "Os donos do quarteirão" (The owners of the block), indicating their territorial control over their neighborhood in Salvador. The Baixa dos Sapateiros, nicknamed "Baixinha," was known as a gathering place for valentões, where police cavalry squads had frequent work combating crimes committed with headbutts (churuméla) and razors.\n\nPiroca''s only documented incident appears in a December 14, 1920 report in the A Tarde newspaper. In the Taboão area, José Batista da Cruz, nicknamed "Guruxinha," was attacked with razor cuts by Pedro Porreta, with Piroca assisting his brother. The victim later died from his injuries. This incident represents the violent street culture of capoeiristas during the First Republic era, when razors were common weapons and territorial disputes could turn deadly.\n\nUnlike his brother Pedro Porreta, whose later life is documented through court cases and confrontations with the valentona Chicão, Piroca appears to have had a less documented career. The existing records suggest he functioned as a loyal companion to his brother in their territorial activities.',
  E'Pedro de Alcântara da Conceição, conhecido como Piroca, foi um capoeirista e valentão do início do século XX em Salvador, Bahia. Era irmão de Pedro Celestino dos Santos (Pedro Porreta), e juntos dominavam o bairro da Baixa dos Sapateiros.\n\nO livro "Mestres e capoeiras famosos da Bahia" apresenta os dois irmãos juntos com o subtítulo "Os donos do quarteirão," indicando seu controle territorial sobre sua vizinhança em Salvador. A Baixa dos Sapateiros, apelidada de "Baixinha," era conhecida como local de reunião de valentões, onde os esquadrões de cavalaria da polícia tinham trabalho frequente combatendo crimes cometidos com cabeçadas (churuméla) e navalhas.\n\nO único incidente documentado de Piroca aparece em uma reportagem de 14 de dezembro de 1920 no jornal A Tarde. Na área do Taboão, José Batista da Cruz, apelidado "Guruxinha," foi atacado com cortes de navalha por Pedro Porreta, com Piroca auxiliando seu irmão. A vítima faleceu posteriormente devido aos ferimentos. Este incidente representa a cultura violenta das ruas dos capoeiristas durante a era da Primeira República, quando navalhas eram armas comuns e disputas territoriais podiam se tornar mortais.\n\nAo contrário de seu irmão Pedro Porreta, cuja vida posterior é documentada através de processos judiciais e confrontos com a valentona Chicão, Piroca parece ter tido uma carreira menos documentada. Os registros existentes sugerem que ele funcionava como companheiro leal de seu irmão em suas atividades territoriais.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with subtitle "Os donos do quarteirão" (The owners of the block) alongside his brother Pedro Porreta',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com subtítulo "Os donos do quarteirão" junto com seu irmão Pedro Porreta',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Active alongside brother Pedro Porreta in 1920. If 25-35 years old during the December 1920 incident, birth = ~1885-1895. Using 1890 as midpoint, matching brother''s estimate.\n\nFULL NAME DISCREPANCY:\n- "Pedro de Alcântara" - primary sources (A Tarde 1920, velhosmestres.com)\n- "Pedro de Alcântara da Conceição" - CDO Sergipe registry (MAJORITY among registries)\n\nBROTHER: Pedro Porreta (Pedro Celestino dos Santos) - frequent companion; different surnames suggest possibly half-brothers or naming based on different parents/patrons.\n\nTERRITORY: Baixa dos Sapateiros ("Baixinha"), Salvador - controlled jointly with brother.\n\nLEGAL RECORDS:\n- Dec 14, 1920: Participated in attack on Guruxinha (José Batista da Cruz) with razors in Taboão alongside brother Pedro Porreta; victim died from injuries (A Tarde newspaper)\n\nNOTE: Unlike Pedro Porreta, no later legal records or incidents documented for Piroca. His fate after 1920 is unknown.\n\nSOURCES: velhosmestres.com, "Mestres e capoeiras famosos da Bahia" (SciELO), A Tarde newspaper (Dec 14, 1920), CDO Sergipe registry.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Ativo ao lado do irmão Pedro Porreta em 1920. Se tinha 25-35 anos durante o incidente de dezembro de 1920, nascimento = ~1885-1895. Usando 1890 como ponto médio, combinando com a estimativa do irmão.\n\nDISCREPÂNCIA DO NOME COMPLETO:\n- "Pedro de Alcântara" - fontes primárias (A Tarde 1920, velhosmestres.com)\n- "Pedro de Alcântara da Conceição" - registro CDO Sergipe (MAIORIA entre registros)\n\nIRMÃO: Pedro Porreta (Pedro Celestino dos Santos) - companheiro frequente; sobrenomes diferentes sugerem possivelmente meio-irmãos ou nomes baseados em diferentes pais/padrinhos.\n\nTERRITÓRIO: Baixa dos Sapateiros ("Baixinha"), Salvador - controlado junto com o irmão.\n\nREGISTROS LEGAIS:\n- 14 dez 1920: Participou do ataque a Guruxinha (José Batista da Cruz) com navalhas no Taboão ao lado do irmão Pedro Porreta; vítima morreu dos ferimentos (jornal A Tarde)\n\nNOTA: Ao contrário de Pedro Porreta, nenhum registro legal ou incidente posterior documentado para Piroca. Seu destino após 1920 é desconhecido.\n\nFONTES: velhosmestres.com, "Mestres e capoeiras famosos da Bahia" (SciELO), jornal A Tarde (14 dez 1920), registro CDO Sergipe.'
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
