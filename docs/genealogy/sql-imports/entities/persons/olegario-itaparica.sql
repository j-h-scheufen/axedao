-- ============================================================
-- GENEALOGY PERSON: Olegário (Itaparica)
-- Generated: 2025-12-29
-- ============================================================
-- Full Name: Olegário Veridiano Moreira
-- Title: NULL (not a formal mestre)
-- Occupation: Fisherman
-- Location: Vila de Coroa, Ilha de Itaparica, Bahia
--
-- Grandfather of Mestre Nô (Norival Moreira de Oliveira). First
-- introduced his grandson to capoeira in 1949, when Nô was four
-- years old. Not a formal mestre, but described by his grandson
-- as the man who "opened the door to the world of capoeira".
-- Olegário was a fisherman who would watch capoeira rodas in
-- Salvador when he came to sell his catch.
--
-- BIRTH YEAR ESTIMATION (~1890, decade):
-- If Olegário was a grandfather teaching a 4-year-old in 1949,
-- typical grandfather age would be 50-65 years old. This suggests
-- birth between 1884-1899. Midpoint estimate: ~1890.
--
-- Source: velhosmestres.com, edgardigital.ufba.br, capoeirapalmares.co.uk
--
-- NOTE: DISTINCT from Olegário (teacher of Gato Preto) - that is
-- a different person from Santo Amaro/Salvador. This Olegário is
-- specifically from Itaparica Island and is Mestre Nô's grandfather.
--
-- CAUTION: The "Olegário teacher of Gato Preto" claim comes from a
-- single source (gen.campodemandinga.com.br). The Gato Preto report
-- does NOT list Olegário among his teachers. This could be false info,
-- the same person, or a different undocumented Olegário. Requires
-- careful verification before importing as separate entity.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Olegário Veridiano Moreira',
  'Olegário',
  'Itaparica',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-72', 'https://velhosmestres.com/br/destaques-72', 'https://capoeirapalmares.co.uk/mestre-no/']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Ilha de Itaparica, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Olegário Veridiano Moreira was a fisherman who lived in the village of Coroa on Ilha de Itaparica, an island across the Bay of All Saints from Salvador. He was the maternal grandfather of Norival Moreira de Oliveira (Mestre Nô), one of the most influential capoeira angola mestres in history.\n\nOlegário was not a formal capoeira mestre. He was a pescador—a fisherman—as fishing was the way of life on the island. However, when he traveled to Salvador to sell his catch at the markets, he would watch the capoeira rodas taking place in the streets and waterfront areas of the city.\n\nIn 1949, when his grandson Norival was just four years old, Olegário began sharing what he knew of capoeira with the boy. Young Norival lived with his maternal grandparents—Olegário and his wife Joana Albertina Moreira—until he was approximately five or six years old. During this time, Olegário gave him his first exposure to the art, teaching him movements he had observed in the Salvador rodas.\n\nAs Mestre Nô himself later recalled: "My first instructions in Capoeira were given by my grandfather, Olegário. It was him who gave me the most incentive in this art of Capoeira". Though Olegário could not offer formal training in the manner of the city mestres, he "opened the door to the world of capoeira" for his grandson—a door that would lead Norival to become one of the most prolific teachers in capoeira history, graduating over 100 students to the rank of mestre.\n\nIn 1952, when Norival was seven, the family moved to Massaranduba in Salvador''s Cidade Baixa, where the boy''s formal training began with Mestres Nilton and Cutica. But the seed had been planted years earlier by his grandfather on the island, watching and learning in the informal way that characterized capoeira transmission before the era of formal academies.',
  E'Olegário Veridiano Moreira era um pescador que vivia na vila de Coroa na Ilha de Itaparica, uma ilha através da Baía de Todos os Santos, em frente a Salvador. Ele era o avô materno de Norival Moreira de Oliveira (Mestre Nô), um dos mestres de capoeira angola mais influentes da história.\n\nOlegário não era um mestre formal de capoeira. Ele era pescador—a pesca era o modo de vida na ilha. No entanto, quando viajava a Salvador para vender seu pescado nos mercados, ele assistia às rodas de capoeira que aconteciam nas ruas e áreas portuárias da cidade.\n\nEm 1949, quando seu neto Norival tinha apenas quatro anos, Olegário começou a compartilhar o que sabia de capoeira com o menino. O jovem Norival morava com seus avós maternos—Olegário e sua esposa Joana Albertina Moreira—até ter aproximadamente cinco ou seis anos. Durante esse tempo, Olegário lhe deu sua primeira exposição à arte, ensinando-lhe movimentos que havia observado nas rodas de Salvador.\n\nComo o próprio Mestre Nô recordou mais tarde: "Minhas primeiras instruções na Capoeira foram dadas pelo meu avô, Olegário. Foi ele quem me deu o maior incentivo nesta arte da Capoeira". Embora Olegário não pudesse oferecer treinamento formal à maneira dos mestres da cidade, ele "abriu a porta para o mundo da capoeira" para seu neto—uma porta que levaria Norival a se tornar um dos professores mais prolíficos da história da capoeira, graduando mais de 100 alunos ao nível de mestre.\n\nEm 1952, quando Norival tinha sete anos, a família se mudou para Massaranduba na Cidade Baixa de Salvador, onde o treinamento formal do menino começou com os Mestres Nilton e Cutica. Mas a semente havia sido plantada anos antes por seu avô na ilha, observando e aprendendo da maneira informal que caracterizava a transmissão da capoeira antes da era das academias formais.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (~1890, decade precision):\nIf Olegário was a grandfather teaching a 4-year-old in 1949, typical grandfather age would be 50-65 years old. This suggests birth between 1884-1899. Midpoint estimate: ~1890.\n\nFAMILY:\n- Wife: Joana Albertina Moreira\n- Grandson: Norival Moreira de Oliveira (Mestre Nô, b. 1945)\n- Relationship: Maternal grandfather (Nô lived with maternal grandparents until age 5-6)\n\nOCCUPATION:\n- Fisherman (pescador) on Ilha de Itaparica\n- Would travel to Salvador to sell fish, where he observed capoeira rodas\n\nLOCATION:\n- Vila de Coroa, Ilha de Itaparica, Bahia\n\nCAMPOEIRA ROLE:\n- Not a formal mestre or titled capoeirista\n- Observed rodas in Salvador during fish-selling trips\n- Shared his observations with grandson Norival (Mestre Nô) from 1949\n- Described by Mestre Nô as the one who "opened the door to the world of capoeira"\n- Gave Nô his "first instructions" and "most incentive" in the art\n\nDISTINCTION:\n- DISTINCT from Olegário (teacher of Gato Preto) mentioned in Campo de Mandinga genealogy\n- This Olegário is specifically from Itaparica Island and is Mestre Nô''s grandfather\n- Uses apelido_context ''Itaparica'' to distinguish',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1890, precisão de década):\nSe Olegário era avô ensinando um garoto de 4 anos em 1949, a idade típica de um avô seria 50-65 anos. Isso sugere nascimento entre 1884-1899. Estimativa central: ~1890.\n\nFAMÍLIA:\n- Esposa: Joana Albertina Moreira\n- Neto: Norival Moreira de Oliveira (Mestre Nô, n. 1945)\n- Relação: Avô materno (Nô morou com os avós maternos até os 5-6 anos)\n\nOCUPAÇÃO:\n- Pescador na Ilha de Itaparica\n- Viajava a Salvador para vender peixe, onde observava rodas de capoeira\n\nLOCAL:\n- Vila de Coroa, Ilha de Itaparica, Bahia\n\nPAPEL NA CAPOEIRA:\n- Não era um mestre formal ou capoeirista titulado\n- Observava rodas em Salvador durante viagens para vender peixe\n- Compartilhou suas observações com o neto Norival (Mestre Nô) a partir de 1949\n- Descrito por Mestre Nô como aquele que "abriu a porta para o mundo da capoeira"\n- Deu a Nô suas "primeiras instruções" e "maior incentivo" na arte\n\nDISTINÇÃO:\n- DISTINTO de Olegário (professor de Gato Preto) mencionado na genealogia Campo de Mandinga\n- Este Olegário é especificamente da Ilha de Itaparica e é o avô de Mestre Nô\n- Usa apelido_context ''Itaparica'' para distinguir'
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
