-- ============================================================
-- GENEALOGY PERSON: Chicão
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1900 (decade precision)
-- Active as valentona in late 1920s-1930s. If 25-35 during the 1929
-- confrontation with Pedro Porreta, birth = ~1894-1904.
-- Using 1900 as midpoint estimate.
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
  'Francisca Albino dos Santos',
  'Chicão',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://books.scielo.org/id/pvm8g']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era practitioner. No formal style designation existed during her active period (1920s-1930s). Known for hand-to-hand combat skills and possibly weapon handling (razors, knives) common among capoeiristas of the period. Her precise fighting techniques are undocumented, but her ability to defeat the notorious Pedro Porreta suggests significant combat prowess.',
  E'Praticante da era pré-moderna. Nenhuma designação formal de estilo existia durante seu período de atividade (1920s-1930s). Conhecida por habilidades de combate corpo a corpo e possivelmente manuseio de armas (navalhas, facas) comuns entre os capoeiristas do período. Suas técnicas de luta precisas não são documentadas, mas sua capacidade de derrotar o notório Pedro Porreta sugere considerável destreza em combate.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Francisca Albino dos Santos, known as Chicão, was a formidable valentona (tough woman) who operated in the streets and brothels of early 20th century Salvador, Bahia. In a world where capoeira was criminalized and female practitioners were exceptionally rare, Chicão carved out a fearsome reputation that made her name synonymous with female defiance.\n\nChicão worked as a prostitute and was well-known to the police forces of Salvador. The book "Mestres e capoeiras famosos da Bahia" dedicates a chapter to her titled "Chicão: Tá pensando o quê?" (What are you thinking?), situating her among the legendary figures of Bahian capoeiragem.\n\nThe most documented episode of her life occurred on September 28, 1929. Pedro Porreta, one of Salvador''s most notorious capoeiristas and the man known as one of "Os donos do quarteirão" (The owners of the block) in the Baixa dos Sapateiros neighborhood, invaded Chicão''s room. He was searching for intimate clothing belonging to one of his female companions who resided with Chicão. Feeling violated, Chicão unleashed a barrage of precise blows that left Porreta badly beaten. The newspapers of the era reported the "valente Porreta" - this feared fish seller and pimp who had killed men and dominated entire neighborhoods - arriving at the police station covered in injuries.\n\nChicão was detained for the assault, but her story did not end there. Some time after this confrontation, Pedro Porreta was assassinated, and Chicão emerged as the main suspect. Whether she was ever convicted remains unclear in the historical record, but the episode cemented her reputation as a woman who could not only stand up to Salvador''s most dangerous men but eliminate them entirely.\n\nThe academic Paula Juliana Foltran in her doctoral thesis "Mulheres Incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" includes a chapter titled "Chicão, a última dos tempos dos valentes" (Chicão, the last of the brave times), examining how Chicão''s story has been treated in capoeira historiography and challenging the "masculinization of bravery and disorder" that has often erased women from capoeira''s violent past.\n\nChicão stands alongside other legendary valentonas of Bahia - Salomé, Maria Doze Homens, Angélica Endiabrada, Rosa Palmeirão, Massú, and Catu - women whose handling of razors, knives, and their own fists led researchers to believe they were indeed capoeiristas, even when formal proof is elusive. The scenarios were the streets, the brothels, the prostitution zones. The motives were jealousy, alcohol, personal rivalries. These were the defining characteristics of the old capoeiristas of Bahia, and Chicão exemplified them as powerfully as any man.',
  E'Francisca Albino dos Santos, conhecida como Chicão, foi uma formidável valentona que operava nas ruas e bordéis de Salvador, Bahia, no início do século XX. Em um mundo onde a capoeira era criminalizada e praticantes femininas eram excepcionalmente raras, Chicão construiu uma reputação temível que tornou seu nome sinônimo de desafio feminino.\n\nChicão trabalhava como prostituta e era bem conhecida pelas forças policiais de Salvador. O livro "Mestres e capoeiras famosos da Bahia" dedica um capítulo a ela intitulado "Chicão: Tá pensando o quê?", situando-a entre as figuras lendárias da capoeiragem baiana.\n\nO episódio mais documentado de sua vida ocorreu em 28 de setembro de 1929. Pedro Porreta, um dos capoeiristas mais notórios de Salvador e o homem conhecido como um dos "Os donos do quarteirão" no bairro da Baixa dos Sapateiros, invadiu o quarto de Chicão. Ele procurava roupas íntimas pertencentes a uma de suas companheiras que residia com Chicão. Sentindo-se ultrajada, Chicão desferiu uma série de golpes certeiros que deixaram Porreta muito machucado. Os jornais da época noticiaram o "valente Porreta" - este temido vendedor de peixe e cafetão que havia matado homens e dominado bairros inteiros - chegando à delegacia coberto de ferimentos.\n\nChicão foi detida pela agressão, mas sua história não terminou ali. Algum tempo depois desse confronto, Pedro Porreta foi assassinado, e Chicão surgiu como a principal suspeita. Se ela foi condenada permanece obscuro no registro histórico, mas o episódio cimentou sua reputação como uma mulher que não só podia enfrentar os homens mais perigosos de Salvador, mas eliminá-los completamente.\n\nA acadêmica Paula Juliana Foltran em sua tese de doutorado "Mulheres Incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" inclui um capítulo intitulado "Chicão, a última dos tempos dos valentes", examinando como a história de Chicão foi tratada na historiografia da capoeira e desafiando a "masculinização da valentia e da desordem" que frequentemente apagou as mulheres do passado violento da capoeira.\n\nChicão está ao lado de outras lendárias valentonas da Bahia - Salomé, Maria Doze Homens, Angélica Endiabrada, Rosa Palmeirão, Massú e Catu - mulheres cujo manuseio de navalhas, facas e seus próprios punhos levou pesquisadores a acreditar que eram de fato capoeiristas, mesmo quando a prova formal é elusiva. Os cenários eram as ruas, os bordéis, as zonas de prostituição. Os motivos eram ciúmes, bebidas, rivalidades pessoais. Estas eram as características definidoras dos antigos capoeiristas da Bahia, e Chicão as exemplificou tão poderosamente quanto qualquer homem.',
  -- Achievements
  'Defeated Pedro Porreta, one of Salvador''s most notorious valentões, on September 28, 1929; featured in "Mestres e capoeiras famosos da Bahia" with chapter titled "Chicão: Tá pensando o quê?"; subject of academic study in Paula Juliana Foltran''s "Mulheres Incorrigíveis" (2019/2021); recognized as one of the legendary valentonas of early 20th century Bahia',
  'Derrotou Pedro Porreta, um dos valentões mais notórios de Salvador, em 28 de setembro de 1929; apresentada em "Mestres e capoeiras famosos da Bahia" com capítulo intitulado "Chicão: Tá pensando o quê?"; tema de estudo acadêmico na tese de Paula Juliana Foltran "Mulheres Incorrigíveis" (2019/2021); reconhecida como uma das lendárias valentonas da Bahia do início do século XX',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1900, decade precision): Active as valentona in late 1920s-1930s. If 25-35 during the 1929 confrontation with Pedro Porreta, birth = ~1894-1904. Using 1900 as midpoint.\n\nDEATH: Unknown. No records found of her death.\n\nNAME: Full name Francisca Albino dos Santos documented in sources. "Chicão" is a masculine-form nickname (augmentative of "Chico/Francisco"), possibly indicating her tough reputation.\n\nOCCUPATION: Prostitute ("valente prostituta conhecida das esquadras policiais").\n\nLEGAL RECORDS:\n- Sept 28, 1929: Assaulted Pedro Porreta after he invaded her room; detained\n- Post-1929: Main suspect in Pedro Porreta''s murder\n\nCONTEMPORARIES (Female Valentonas 1920s-1930s):\n- Salomé (student of Doze Homens)\n- Maria Doze Homens\n- Angélica Endiabrada (1910-1920s)\n- Rosa Palmeirão\n- Massú\n- Catu\n- Almerinda\n- Menininha\n\nACADEMIC SOURCES:\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (EDUFBA, 2009) - chapter "Chicão: Tá pensando o quê?"\n- Paula Juliana Foltran, "Mulheres Incorrigíveis" (thesis 2019, book 2021) - chapter "Chicão, a última dos tempos dos valentes"\n- Arruda, "Salvador, Ruas de Sangue" - source for valentona context\n\nSOURCES: Espeto Capoeira blog, SciELO Books ("Mestres e capoeiras famosos da Bahia"), Portal Capoeira, Dandara Editora (Mulheres Incorrigíveis), UnB Repository (Foltran thesis).',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Ativa como valentona no final dos anos 1920-1930. Se tinha 25-35 anos durante o confronto de 1929 com Pedro Porreta, nascimento = ~1894-1904. Usando 1900 como ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado de sua morte.\n\nNOME: Nome completo Francisca Albino dos Santos documentado nas fontes. "Chicão" é um apelido de forma masculina (aumentativo de "Chico/Francisco"), possivelmente indicando sua reputação de durona.\n\nOCUPAÇÃO: Prostituta ("valente prostituta conhecida das esquadras policiais").\n\nREGISTROS LEGAIS:\n- 28 set 1929: Agrediu Pedro Porreta após ele invadir seu quarto; detida\n- Pós-1929: Principal suspeita do assassinato de Pedro Porreta\n\nCONTEMPORÂNEAS (Valentonas 1920s-1930s):\n- Salomé (aluna de Doze Homens)\n- Maria Doze Homens\n- Angélica Endiabrada (1910-1920s)\n- Rosa Palmeirão\n- Massú\n- Catu\n- Almerinda\n- Menininha\n\nFONTES ACADÊMICAS:\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (EDUFBA, 2009) - capítulo "Chicão: Tá pensando o quê?"\n- Paula Juliana Foltran, "Mulheres Incorrigíveis" (tese 2019, livro 2021) - capítulo "Chicão, a última dos tempos dos valentes"\n- Arruda, "Salvador, Ruas de Sangue" - fonte para contexto de valentonas\n\nFONTES: Blog Espeto Capoeira, SciELO Books ("Mestres e capoeiras famosos da Bahia"), Portal Capoeira, Dandara Editora (Mulheres Incorrigíveis), Repositório UnB (tese Foltran).'
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
