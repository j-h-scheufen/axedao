-- ============================================================
-- GENEALOGY PERSON: Zé do U
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Listed by Pastinha in 1967 as already deceased among practitioners
-- of "pure Capoeira de Angola." The other figures on this list were
-- active in the early-to-mid 20th century (Américo Ciência fought
-- Bimba in 1936; Amorzinho led Gengibirra until 1943), suggesting
-- Zé do U was likely born around 1880-1910. Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Confirmed dead by Pastinha's 1967 interview. As a contemporary of
-- the other angoleiros on the list (most active 1900s-1940s),
-- likely died in the 1950s-1960s. Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Zé do U', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Zé do U among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview, distinguishing these figures from the modernized Regional style.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Zé do U entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967, distinguindo essas figuras do estilo Regional modernizado.',
  1900, -- birth_year: estimated from context (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given association with Pastinha's circles
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Zé do U was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. His name appears in one of the most important primary sources in capoeira history: Mestre Pastinha''s 1967 interview with Revista Realidade magazine.\n\nIn February 1967, the 78-year-old Pastinha—nearly blind but still teaching at his academy in Pelourinho—spoke with journalist Roberto Freire about the great capoeiristas of the past. Pastinha listed Zé do U among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, and two women: Júlia Fogareira and Maria Homem.\n\nPastinha remarked of these figures: "Cada nome destes é uma história"—each of these names is a story. He observed that their apelidos revealed "who they were, how they fought," suggesting these nicknames encoded information about their fighting styles, personalities, or physical characteristics.\n\nThe apelido "Zé do U" follows a common Brazilian naming pattern where "Zé" (short for José) is followed by a geographic or occupational identifier. The "U" likely refers to a place, occupation, or characteristic—perhaps a neighborhood, street, or business where this capoeirista was known. Without additional documentation, the exact meaning remains unknown.\n\nBeyond Pastinha''s mention, no other documentation of Zé do U has been found. He represents one of the many capoeiristas whose contributions to the art have been largely lost to history, remembered only through the oral testimony of those who knew them.',
  -- bio_pt
  E'Zé do U foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Seu nome aparece em uma das mais importantes fontes primárias da história da capoeira: a entrevista de Mestre Pastinha à Revista Realidade em 1967.\n\nEm fevereiro de 1967, Pastinha, então com 78 anos—quase cego mas ainda ensinando em sua academia no Pelourinho—conversou com o jornalista Roberto Freire sobre os grandes capoeiristas do passado. Pastinha listou Zé do U entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, e duas mulheres: Júlia Fogareira e Maria Homem.\n\nPastinha comentou sobre essas figuras: "Cada nome destes é uma história." Ele observou que seus apelidos revelavam "quem eles eram, como lutavam"—sugerindo que esses apelidos codificavam informações sobre seus estilos de luta, personalidades ou características físicas.\n\nO apelido "Zé do U" segue um padrão comum de nomeação brasileira onde "Zé" (diminutivo de José) é seguido por um identificador geográfico ou ocupacional. O "U" provavelmente se refere a um lugar, ocupação ou característica—talvez um bairro, rua ou estabelecimento onde este capoeirista era conhecido. Sem documentação adicional, o significado exato permanece desconhecido.\n\nAlém da menção de Pastinha, nenhuma outra documentação sobre Zé do U foi encontrada. Ele representa um dos muitos capoeiristas cujas contribuições para a arte foram amplamente perdidas na história, lembrados apenas através do testemunho oral daqueles que os conheceram.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nListed by Pastinha in 1967 as already deceased among practitioners of "pure Capoeira de Angola." The other figures on this list were active in the early-to-mid 20th century, suggesting Zé do U was likely born around 1880-1910.\n\nDEATH YEAR ESTIMATION (1960, decade):\nConfirmed dead by Pastinha''s 1967 interview. As a contemporary of the other angoleiros on the list (most active 1900s-1940s), likely died in the 1950s-1960s.\n\nAPELIDO:\n"Zé do U" follows Brazilian naming convention: "Zé" (short for José) + "do U" (likely a place, occupation, or characteristic). The "U" could refer to a neighborhood, street corner, business, or distinguishing feature. Without additional sources, the exact meaning is unknown. Pastinha noted that these old angoleiros'' apelidos revealed "who they were, how they fought."\n\nSOURCE:\nRevista Realidade, February 1967, "É Luta, É Dança, É Capoeira" by Roberto Freire (photos by David Drew Zingg). This is a single-source profile; no additional documentation found.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\n1976 SOURCE VARIATION:\nA 1976 O Globo article (velhosmestres.com/br/pastinha-1976) reproduces a similar list of "angoleiros de briga" but includes Besouro and omits Zé Bom Pé. Zé do U appears in both versions, confirming his status among the legendary angoleiros.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nListado por Pastinha em 1967 como já falecido entre praticantes de "capoeira de Angola pura." As outras figuras dessa lista estavam ativas no início e meados do século XX, sugerindo que Zé do U provavelmente nasceu por volta de 1880-1910.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Como contemporâneo dos outros angoleiros da lista (maioria ativos nos anos 1900-1940), provavelmente morreu nos anos 1950-1960.\n\nAPELIDO:\n"Zé do U" segue a convenção de nomeação brasileira: "Zé" (diminutivo de José) + "do U" (provavelmente um lugar, ocupação ou característica). O "U" poderia se referir a um bairro, esquina, estabelecimento ou característica distintiva. Sem fontes adicionais, o significado exato é desconhecido. Pastinha observou que os apelidos desses velhos angoleiros revelavam "quem eles eram, como lutavam."\n\nFONTE:\nRevista Realidade, fevereiro de 1967, "É Luta, É Dança, É Capoeira" por Roberto Freire (fotos de David Drew Zingg). Este é um perfil de fonte única; nenhuma documentação adicional encontrada.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nVARIAÇÃO DA FONTE DE 1976:\nUm artigo de O Globo de 1976 (velhosmestres.com/br/pastinha-1976) reproduz uma lista similar de "angoleiros de briga" mas inclui Besouro e omite Zé Bom Pé. Zé do U aparece em ambas versões, confirmando seu status entre os angoleiros lendários.'
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
