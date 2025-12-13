-- ============================================================
-- GENEALOGY PERSON: Barboza
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Barboza',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-2']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) became formalized. Part of the Matatu Preto training group in Salvador.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional) se formalizarem. Parte do grupo de treino do Matatu Preto em Salvador.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Barboza was a capoeirista who practiced in Salvador, Bahia, during the 1930s. He was part of the legendary Sunday training gatherings at Matatu Preto—a lowland area in the Matatu neighborhood where capoeiristas would meet in an open square (terreiro) to train and play.\n\nAccording to Mestre Canjiquinha''s 1989 testimony about the Matatu Preto group: "On Sundays, all those capoeiristas would come—Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, the late Barboza, and this citizen called Antonio Raimundo, nicknamed by all Aberrê."\n\nThe reference to "finado Barboza" (the late Barboza) indicates he had already passed away by 1989 when Canjiquinha recorded this testimony. This is the only known documentation of Barboza—no records survive of his full name, his trade, his teachers, or the circumstances of his death.\n\nBarboza trained alongside some of the most significant figures in capoeira history: Mestre Aberrê (who led the sessions and later trained both Canjiquinha and Caiçara), Onça Preta (who would go on to establish capoeira Angola in Rio de Janeiro), and Totonho de Maré (co-founder of Gengibirra and recognized as one of the finest capoeiristas of his era).\n\nLike many capoeiristas of the pre-modern era, Barboza exists in history primarily as a name in an oral tradition—a figure remembered by his contemporaries but whose individual story was never recorded. His presence in Canjiquinha''s testimony reminds us how much of capoeira''s history was preserved only in the memories of those who lived it.',
  E'Barboza foi um capoeirista que praticava em Salvador, Bahia, durante os anos 1930. Ele fazia parte dos lendários encontros de treino de domingo no Matatu Preto—uma baixada no bairro do Matatu onde os capoeiristas se reuniam em um terreiro para treinar e jogar.\n\nSegundo o testemunho de Mestre Canjiquinha de 1989 sobre o grupo do Matatu Preto: "Aos domingos, vinham todos aqueles capoeiristas—Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, o finado Barboza e esse cidadão chamado Antonio Raimundo, apelidado por todos Aberrê."\n\nA referência a "finado Barboza" indica que ele já havia falecido em 1989 quando Canjiquinha gravou este testemunho. Esta é a única documentação conhecida de Barboza—não sobrevivem registros de seu nome completo, seu ofício, seus professores ou as circunstâncias de sua morte.\n\nBarboza treinou ao lado de algumas das figuras mais significativas da história da capoeira: Mestre Aberrê (que liderava as sessões e depois treinou tanto Canjiquinha quanto Caiçara), Onça Preta (que viria a estabelecer a capoeira Angola no Rio de Janeiro), e Totonho de Maré (co-fundador da Gengibirra e reconhecido como um dos melhores capoeiristas de sua era).\n\nComo muitos capoeiristas da era pré-moderna, Barboza existe na história principalmente como um nome em uma tradição oral—uma figura lembrada por seus contemporâneos mas cuja história individual nunca foi registrada. Sua presença no testemunho de Canjiquinha nos lembra quanto da história da capoeira foi preservada apenas nas memórias daqueles que a viveram.',
  NULL,
  NULL,
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1900, decade precision): Part of Matatu Preto training group in 1930s Salvador. If 25-40 years old then, born ~1890-1910. Using 1900 as midpoint.\n\nDEATH: Unknown exact date. Referred to as "finado" (the late) by Canjiquinha in 1989 testimony, indicating death sometime between the 1930s and 1989.\n\nNAME: Only "Barboza" is recorded. No full name or alternate spellings found.\n\nSOURCE: Single source - Mestre Canjiquinha''s 1989 testimony about the Matatu Preto training group. This is the only known documentation of Barboza.\n\nNOTE: Very limited information available. The person exists in the historical record solely through this one testimony.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Parte do grupo de treino do Matatu Preto em Salvador nos anos 1930. Se tinha 25-40 anos então, nasceu ~1890-1910. Usando 1900 como ponto médio.\n\nMORTE: Data exata desconhecida. Referido como "finado" por Canjiquinha em testemunho de 1989, indicando morte em algum momento entre os anos 1930 e 1989.\n\nNOME: Apenas "Barboza" está registrado. Nenhum nome completo ou grafias alternativas encontrados.\n\nFONTE: Fonte única - testemunho de Mestre Canjiquinha de 1989 sobre o grupo de treino do Matatu Preto. Esta é a única documentação conhecida de Barboza.\n\nNOTA: Informações muito limitadas disponíveis. A pessoa existe no registro histórico apenas através deste único testemunho.'
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
