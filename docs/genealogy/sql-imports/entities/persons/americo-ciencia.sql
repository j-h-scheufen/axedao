-- ============================================================
-- GENEALOGY PERSON: Américo Ciência
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Active as a fighter in 1936 (Odeon Park fights against Bimba).
-- Bimba was born 1899, making him 37 in 1936.
-- As a contemporary who faced Bimba in challenge fights, Américo Ciência
-- was likely in his fighting prime (25-40 years old), meaning born ~1896-1911.
-- Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Pastinha listed him among the deceased in 1967 interview.
-- As an "angoleiro de briga" of his generation, likely died in the 1950s-1960s.
-- Using decade precision: 1960.
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
  'Américo Ciência', -- apelido
  NULL, -- title: no formal title documented; referred to as mestre in some sources but not consistently
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://velhosmestres.com/br/pastinha-1976', 'https://capoeira.online/history/mestres/mestre-bimba/']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly identified Américo Ciência as a practitioner of "pure Capoeira de Angola," distinguishing him from the modernized Regional style. His ability to fight both Henrique Bahia to a draw and face Bimba in a challenge match demonstrates his competence as a martial artist.',
  E'Capoeira de Angola tradicional. Pastinha explicitamente identificou Américo Ciência como praticante de "capoeira de Angola pura," distinguindo-o do estilo Regional modernizado. Sua capacidade de lutar com Henrique Bahia até um empate e enfrentar Bimba em uma luta de desafio demonstra sua competência como artista marcial.',
  1900, -- birth_year: estimated from 1936 fight activity (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given his involvement in Liberdade rodas
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Américo Ciência (also spelled Américo Sciencia in period newspapers) was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of "angoleiros de briga" (fighting angoleiros) - practitioners of traditional capoeira angola renowned for their combative prowess.\n\nIn February 1936, Américo Ciência fought Henrique Bahia in an exhibition match at the newly inaugurated Odeon Park in Salvador. The bout "ended with an undecided outcome" - a notable result given Bahia''s reputation.\n\nLater in 1936, Américo Ciência faced Mestre Bimba in the famous challenge series at Odeon Park where Bimba tested his Capoeira Regional against all comers. Bimba defeated four opponents that night - Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, and José Custódio "Zé I" dos Santos - earning the nickname "Três Pancadas" (Three Hits) for his devastating efficiency.\n\nAmérico Ciência was part of the informal capoeira angola gathering at the Gengibirra/Liberdade neighborhood in Salvador, where the best capoeiristas of Bahia convened on Sundays. This group included mestres such as Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, and Butique. In 1941, Mestre Pastinha assumed leadership of this group, which he later formalized as the Centro Esportivo de Capoeira Angola (CECA).\n\nIn 1967, Mestre Pastinha listed Américo Ciência among the deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, and others. Pastinha remarked of these figures: "They are already dead. Each of them has history" - and noted that their apelidos themselves revealed "who they were, how they fought."',
  -- bio_pt
  E'Américo Ciência (também grafado como Américo Sciencia em jornais da época) foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de "angoleiros de briga" - praticantes de capoeira angola tradicional renomados por sua destreza combativa.\n\nEm fevereiro de 1936, Américo Ciência lutou contra Henrique Bahia em uma luta de exibição no recém-inaugurado Odeon Park em Salvador. O combate "terminou com resultado indeciso" - um resultado notável dada a reputação de Bahia.\n\nMais tarde em 1936, Américo Ciência enfrentou Mestre Bimba na famosa série de desafios no Odeon Park, onde Bimba testou sua Capoeira Regional contra todos os desafiantes. Bimba derrotou quatro oponentes naquela noite - Henrique Bahia, Vítor Benedito Lopes, Américo Ciência e José Custódio "Zé I" dos Santos - ganhando o apelido de "Três Pancadas" por sua eficiência devastadora.\n\nAmérico Ciência fazia parte da reunião informal de capoeira angola no bairro do Gengibirra/Liberdade em Salvador, onde os melhores capoeiristas da Bahia se reuniam aos domingos. Este grupo incluía mestres como Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio e Butique. Em 1941, Mestre Pastinha assumiu a liderança deste grupo, que mais tarde formalizou como o Centro Esportivo de Capoeira Angola (CECA).\n\nEm 1967, Mestre Pastinha listou Américo Ciência entre os praticantes falecidos de "capoeira de Angola pura," junto com Bigode de Seda, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços e outros. Pastinha comentou sobre essas figuras: "Já morreram. Cada um deles tem história" - e observou que seus apelidos revelavam "quem eles eram, como lutavam."',
  NULL, -- achievements_en: no specific achievements beyond being recognized by Pastinha
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nActive as a fighter in 1936 (Odeon Park fights against Bimba). Bimba was born 1899, making him 37 in 1936. As a contemporary who faced Bimba in challenge fights, Américo Ciência was likely in his fighting prime (25-40 years old), meaning born ~1896-1911.\n\nDEATH YEAR ESTIMATION (1960, decade):\nPastinha listed him among the deceased in 1967 interview. As an "angoleiro de briga" of his generation, likely died in the 1950s-1960s.\n\nNAME VARIATION:\n- "Américo Ciência" - Pastinha 1967, velhosmestres.com\n- "Américo Sciencia" - Diário da Bahia, March 13, 1936 (newspaper)\n\n1936 ODEON PARK CONTEXT:\n- Odeon Park inaugurated February 6, 1936 in Praça da Sé, Salvador\n- Venue for fights and betting\n- Exhibition vs Henrique Bahia: "undecided outcome"\n- Challenge fight vs Bimba: defeated\n- Odeon Park deactivated July 1936\n\nLIBERDADE/GENGIBIRRA RODA:\n- Part of informal capoeira angola gathering before CECA\n- Contemporary mestres listed: Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique\n- NOTE: Américo Ciência NOT listed among the 22 founding mestres of Gengibirra proper (per Mestre Noronha''s manuscripts)\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nDEATH: Confirmed dead before 1967 interview; exact year unknown',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nAtivo como lutador em 1936 (lutas do Odeon Park contra Bimba). Bimba nasceu em 1899, tendo 37 anos em 1936. Como contemporâneo que enfrentou Bimba em lutas de desafio, Américo Ciência provavelmente estava em seu auge de luta (25-40 anos), significando nascido ~1896-1911.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nPastinha o listou entre os falecidos em entrevista de 1967. Como "angoleiro de briga" de sua geração, provavelmente morreu nos anos 1950-1960.\n\nVARIAÇÃO DE NOME:\n- "Américo Ciência" - Pastinha 1967, velhosmestres.com\n- "Américo Sciencia" - Diário da Bahia, 13 de março de 1936 (jornal)\n\nCONTEXTO DO ODEON PARK 1936:\n- Odeon Park inaugurado em 6 de fevereiro de 1936 na Praça da Sé, Salvador\n- Local para lutas e apostas\n- Exibição vs Henrique Bahia: "resultado indeciso"\n- Luta de desafio vs Bimba: derrotado\n- Odeon Park desativado em julho de 1936\n\nRODA DA LIBERDADE/GENGIBIRRA:\n- Parte da reunião informal de capoeira angola antes do CECA\n- Mestres contemporâneos listados: Antônio, Maré, Daniel, Livino Diogo, Alemão, Bulgário, Barbosa, Domingos Magalhães, Eulâmpio, Butique\n- NOTA: Américo Ciência NÃO está listado entre os 22 mestres fundadores do Gengibirra propriamente dito (conforme manuscritos de Mestre Noronha)\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nMORTE: Confirmado falecido antes da entrevista de 1967; ano exato desconhecido'
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
