-- ============================================================
-- GENEALOGY PERSON: Besourinho
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
  'Besourinho',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-34']::text[],
  -- Capoeira-specific
  NULL,
  NULL,
  NULL,
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bilingual)
  E'Besourinho was a capoeirista active in Salvador in the early 20th century. His name means "little beetle" in Portuguese - a diminutive form, perhaps indicating he was smaller in stature, or a term of affection.

What little is known of Besourinho comes from the testimony of Mestre Onça Preta (Cícero Navarro, 1909-2006), who listed him among the masters under whom he trained as a boy in Salvador. "I had not one, but many mestres," Onça Preta recalled in a 1972 interview. "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... and many others, who today are deceased."

Tragically, Besourinho was among those who did not survive the brutal persecution conducted by Police Chief Pedro de Azevedo Gordilho, the infamous "Pedrito," who assumed command in 1920. Pedrito''s cavalry squadron conducted a systematic massacre of the old capoeira mestres. The killings were not in open combat but through assassination after capture - bodies would appear days later, thrown into the forest, their backs opened by knife cuts.

When Onça Preta recalled the fallen, Besourinho''s name came first: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino, and many others." With the death of these men, one chapter in the history of Bahian capoeira closed. A new generation - including Onça Preta himself, Mestre Bimba, Dois de Ouro, Juvenal, and Waldemar - rose from the silence, at the cost of much blood.

Nothing else is recorded about Besourinho - not his full name, his birthplace, his family, nor the specific circumstances of his death. He exists in history only as a name in an old man''s memory, a master who helped train one of the bridge figures between capoeira''s persecuted past and its legalized future.',
  E'Besourinho foi um capoeirista ativo em Salvador no início do século XX. Seu nome é um diminutivo de "besouro" em português - talvez indicando que era menor de estatura, ou um termo de carinho.

O pouco que se sabe de Besourinho vem do testemunho de Mestre Onça Preta (Cícero Navarro, 1909-2006), que o listou entre os mestres com quem treinou quando menino em Salvador. "Não tive um, mas muitos mestres," recordou Onça Preta em entrevista de 1972. "Ainda menino, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... e muitos outros, hoje mortos."

Tragicamente, Besourinho estava entre os que não sobreviveram à perseguição brutal conduzida pelo chefe de polícia Pedro de Azevedo Gordilho, o infame "Pedrito," que assumiu o comando em 1920. O esquadrão de cavalaria de Pedrito conduziu um massacre sistemático dos velhos mestres de capoeira. As mortes não eram em combate aberto, mas por assassinato após captura - os corpos apareciam dias depois, jogados no mato, as costas abertas de facadas.

Quando Onça Preta recordava os caídos, o nome de Besourinho vinha primeiro: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino, e muitos outros." Com a morte desses homens, um capítulo na história da capoeira baiana se encerrou. Uma nova geração - incluindo o próprio Onça Preta, Mestre Bimba, Dois de Ouro, Juvenal e Waldemar - emergiu do silêncio, ao custo de muito sangue.

Nada mais está registrado sobre Besourinho - nem seu nome completo, seu local de nascimento, sua família, nem as circunstâncias específicas de sua morte. Ele existe na história apenas como um nome na memória de um velho, um mestre que ajudou a treinar uma das figuras de transição entre o passado perseguido da capoeira e seu futuro legalizado.',
  NULL,
  NULL,
  -- Researcher notes (English)
  E'NAME: "Besourinho" means "little beetle" - a diminutive of "besouro."

BIRTH YEAR ESTIMATION (1880, decade precision): Onça Preta (b. 1909) was "still a boy" when training with Besourinho. If age 6-15 during training (1915-1924) and Besourinho was 25-45 when teaching, birth range = 1870-1899. Using 1880 as midpoint.

DEATH: Killed during Pedrito persecution (1920-1927). Exact date unknown. Manner: assassinated after capture by police cavalry, body found later in forest with knife wounds. Using 1925 as midpoint estimate with decade precision.

SOURCE: Single primary source - Onça Preta''s testimony recorded in velhosmestres.com/br/destaques-34. No other documentation found.

RELATIONSHIP: Teacher of Onça Preta. Onça Preta listed "pulei com... Besourinho" (I jumped with Besourinho) among his multiple teachers.

STYLE: Unknown. Pre-dates the Angola/Regional distinction (1930s). Likely practiced proto-Angola style common in Salvador at that time.',
  E'NOME: "Besourinho" significa "pequeno besouro" - um diminutivo de "besouro."

ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década): Onça Preta (n. 1909) era "ainda menino" quando treinava com Besourinho. Se tinha 6-15 anos durante o treino (1915-1924) e Besourinho tinha 25-45 anos quando ensinava, faixa de nascimento = 1870-1899. Usando 1880 como ponto médio.

MORTE: Morto durante a perseguição de Pedrito (1920-1927). Data exata desconhecida. Modo: assassinado após captura pela cavalaria da polícia, corpo encontrado depois no mato com ferimentos de faca. Usando 1925 como estimativa do ponto médio com precisão de década.

FONTE: Fonte primária única - testemunho de Onça Preta registrado em velhosmestres.com/br/destaques-34. Nenhuma outra documentação encontrada.

RELACIONAMENTO: Professor de Onça Preta. Onça Preta listou "pulei com... Besourinho" entre seus múltiplos professores.

ESTILO: Desconhecido. Anterior à distinção Angola/Regional (anos 1930). Provavelmente praticava o estilo proto-Angola comum em Salvador na época.'
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
