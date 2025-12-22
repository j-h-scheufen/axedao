-- ============================================================
-- GENEALOGY PERSON: Feliciano Bigode de Seda
-- Generated: 2025-12-15
-- Updated: 2025-12-20 (added Pastinha 1967 interview context)
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Feliciano was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
--
-- DEATH YEAR ESTIMATION:
-- Pastinha confirmed in 1967 interview that Bigode de Seda was "already dead."
-- Given he was a founding mestre of Gengibirra (~1920s), he was likely
-- born ~1890 and would have died sometime between 1940s-1960s.
-- Using 1960 as estimate with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Feliciano',
  'Bigode de Seda',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/']::text[],
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1960,
  'decade'::genealogy.date_precision,
  NULL,
  E'Bigode de Seda ("Silk Mustache") was one of the legendary capoeiristas of Bahia''s golden era. In a 1967 interview with Revista Realidade, Mestre Pastinha remembered him among the great capoeiristas of the past: "Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá." Pastinha noted that "pelo apelido dá para saber como eram, como lutavam" (from the nicknames alone you can know who they were, how they fought).\n\nBigode de Seda was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed him among the founding mestres attracted to the first organized Capoeira Centre. The center, led by four "donos e proprietários" (Noronha, Livino, Totonho de Maré, and Amorzinho), used the green and yellow colors of the Brazilian flag as their symbolic colors.\n\nBigode de Seda was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA (Centro Esportivo de Capoeira Angola). By 1967, Pastinha confirmed that Bigode de Seda, like all of that legendary generation, had passed away.',
  E'Bigode de Seda ("Bigode de Seda") foi um dos lendários capoeiristas da era de ouro da Bahia. Em uma entrevista de 1967 à Revista Realidade, Mestre Pastinha o lembrou entre os grandes capoeiristas do passado: "Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá." Pastinha observou que "pelo apelido dá para saber como eram, como lutavam" (pelos apelidos dá para saber quem eram, como lutavam).\n\nBigode de Seda foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), o listou entre os mestres fundadores atraídos ao primeiro Centro de Capoeira organizado. O centro, liderado por quatro "donos e proprietários" (Noronha, Livino, Totonho de Maré e Amorzinho), usava as cores verde e amarela da bandeira brasileira como suas cores simbólicas.\n\nBigode de Seda esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA (Centro Esportivo de Capoeira Angola). Em 1967, Pastinha confirmou que Bigode de Seda, como toda aquela geração lendária, havia falecido.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'BIRTH YEAR ESTIMATION (1890, decade):\nAs a founding mestre of Gengibirra in the 1920s, he was likely an established practitioner by that time (age 25-40), suggesting birth ~1880-1900.\n\nDEATH YEAR ESTIMATION (1960, decade):\nPastinha confirmed in 1967 interview (Revista Realidade) that Bigode de Seda was "já morto" (already dead). Given his activity in 1920s-1941, death likely occurred 1940s-1960s.\n\nNAME VARIATION:\n- "Bigode de Seda" - Pastinha 1967 interview, most sources (used as apelido)\n- "Feliciano Bigode de Seda" - Noronha manuscripts, some sources\nThese refer to the SAME PERSON. "Feliciano" is kept as given name; "Bigode de Seda" used as apelido for consistency with how Pastinha referred to him.\n\nMEDIA APPEARANCES:\n- 1967: Named by Mestre Pastinha in Revista Realidade interview as one of the legendary capoeiristas of the past.\n- 1993: Listed in "O ABC da Capoeira Angola" (Noronha manuscripts compiled by Frede Abreu) as founding mestre of Gengibirra.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, década):\nComo mestre fundador do Gengibirra na década de 1920, era provavelmente um praticante estabelecido naquela época (25-40 anos), sugerindo nascimento ~1880-1900.\n\nESTIMATIVA DO ANO DE MORTE (1960, década):\nPastinha confirmou em entrevista de 1967 (Revista Realidade) que Bigode de Seda estava "já morto". Dada sua atividade de 1920 a 1941, a morte provavelmente ocorreu entre 1940-1960.\n\nVARIAÇÃO DE NOME:\n- "Bigode de Seda" - entrevista de Pastinha 1967, maioria das fontes (usado como apelido)\n- "Feliciano Bigode de Seda" - manuscritos de Noronha, algumas fontes\nReferem-se à MESMA PESSOA. "Feliciano" mantido como nome de batismo; "Bigode de Seda" usado como apelido para consistência com como Pastinha se referia a ele.\n\nAPARIÇÕES NA MÍDIA:\n- 1967: Nomeado por Mestre Pastinha em entrevista à Revista Realidade como um dos lendários capoeiristas do passado.\n- 1993: Listado em "O ABC da Capoeira Angola" (manuscritos de Noronha compilados por Frede Abreu) como mestre fundador do Gengibirra.'
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
