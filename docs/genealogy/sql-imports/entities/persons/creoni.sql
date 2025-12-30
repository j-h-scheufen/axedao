-- ============================================================
-- GENEALOGY PERSON: Creoni
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
  'Creoni',
  NULL,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the Matatu Preto training circle during the 1930s. Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo no círculo de treino do Matatu Preto durante a década de 1930. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Creoni was a capoeirista active in Salvador, Bahia during the 1930s. He was a regular participant in the Sunday rodas at Matatu Preto in the Matatu neighborhood, alongside other notable practitioners of the era.\n\nAccording to Mestre Canjiquinha''s testimony, Creoni was among the capoeiristas who gathered at Matatu Preto around 1935: "There was a lowland called Matatu Preto, a hill in the Matatu neighborhood and down below there was a square, a terreiro. There, on Sundays, all these capoeiristas would come - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, the late Barboza, and this citizen called Antonio Raimundo, nicknamed by everyone Aberrê".\n\nThis training circle was significant in the history of capoeira Angola in Salvador. It was through these Sunday gatherings that Mestre Aberrê taught young Canjiquinha, who was then only 10 years old. The Matatu Preto rodas served as an informal training ground where experienced capoeiristas passed on their knowledge to the next generation.\n\nCreoni''s presence among this group of notable capoeiristas suggests he was a respected practitioner of the era, though detailed biographical information about him has been lost to time. His name is preserved through the oral testimonies collected from old mestres of Bahia.',
  E'Creoni foi um capoeirista ativo em Salvador, Bahia, durante a década de 1930. Ele era participante assíduo das rodas de domingo no Matatu Preto, no bairro do Matatu, junto com outros praticantes notáveis da época.\n\nDe acordo com o depoimento de Mestre Canjiquinha, Creoni estava entre os capoeiristas que se reuniam no Matatu Preto por volta de 1935: "Tinha uma baixada chamada Matatu Preto, um morro no bairro do Matatu e lá embaixo tinha um largo, um terreiro. Lá, aos domingos, vinham todos esses capoeiristas - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, finado Barboza, e esse cidadão chamado Antônio Raimundo, apelidado por todos de Aberrê".\n\nEste círculo de treino foi significativo na história da capoeira Angola em Salvador. Foi através desses encontros de domingo que Mestre Aberrê ensinou o jovem Canjiquinha, que tinha então apenas 10 anos. As rodas do Matatu Preto serviam como um campo de treino informal onde capoeiristas experientes passavam seu conhecimento para a próxima geração.\n\nA presença de Creoni entre esse grupo de capoeiristas notáveis sugere que ele era um praticante respeitado da época, embora informações biográficas detalhadas sobre ele tenham se perdido no tempo. Seu nome é preservado através dos depoimentos orais coletados dos velhos mestres da Bahia.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1905, decade precision): Active capoeirista at Matatu Preto training circle in 1935. If 25-40 years old when active in 1935, birth = ~1895-1910. Using 1905 as midpoint estimate.\n\nDEATH: Unknown. No records of his death have been found.\n\nNAME: Only known by the apelido "Creoni". Origin of nickname unknown.\n\nSOURCES: Sole source is Mestre Canjiquinha''s testimony (1989) about the Matatu Preto gatherings circa 1935. No other documentation found.\n\nLIMITED INFORMATION: Unlike other Matatu Preto contemporaries (Geraldo Chapeleiro, Chico Três Pedaços), Creoni does not appear in other historical records, suggesting he may have been less prominent or left capoeira earlier.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década): Capoeirista ativo no círculo de treino do Matatu Preto em 1935. Se tinha 25-40 anos quando ativo em 1935, nascimento = ~1895-1910. Usando 1905 como estimativa do ponto médio.\n\nMORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.\n\nNOME: Conhecido apenas pelo apelido "Creoni". Origem do apelido desconhecida.\n\nFONTES: Única fonte é o depoimento de Mestre Canjiquinha (1989) sobre os encontros do Matatu Preto por volta de 1935. Nenhuma outra documentação encontrada.\n\nINFORMAÇÕES LIMITADAS: Diferente de outros contemporâneos do Matatu Preto (Geraldo Chapeleiro, Chico Três Pedaços), Creoni não aparece em outros registros históricos, sugerindo que pode ter sido menos proeminente ou deixou a capoeira mais cedo.'
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
