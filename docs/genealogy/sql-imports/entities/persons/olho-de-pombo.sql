-- ============================================================
-- GENEALOGY PERSON: Olho de Pombo (Argemiro Grande Olho de Pombo)
-- Generated: 2025-12-15
-- ============================================================
-- IDENTITY NOTE:
-- Historical sources list "Algemiro Grande Olho de Pombo" as a single
-- entry among the 22 founding mestres of Gengibirra. The full descriptor
-- appears to be "Argemiro Grande Olho de Pombo" (Argemiro the Tall/Big,
-- Pigeon Eye), suggesting this is ONE person with a compound nickname.
-- Noronha's manuscripts note him as a longshoreman.
--
-- This file uses "Olho de Pombo" as the primary apelido for
-- discoverability, with full name variations noted.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Olho de Pombo was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Argemiro',
  'Olho de Pombo',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Olho de Pombo (full name: Argemiro Grande Olho de Pombo, meaning "Argemiro the Tall, Pigeon Eye") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nOlho de Pombo worked as a longshoreman (stevedore) on Salvador''s docks - a common occupation among capoeiristas of his era. The origin of the nickname "Olho de Pombo" (Pigeon Eye) has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Olho de Pombo among the founding mestres. Olho de Pombo was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Olho de Pombo have been documented.',
  E'Olho de Pombo (nome completo: Argemiro Grande Olho de Pombo, significando "Argemiro o Alto, Olho de Pombo") foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nOlho de Pombo trabalhava como estivador nos portos de Salvador - uma ocupação comum entre capoeiristas de sua época. A origem do apelido "Olho de Pombo" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Olho de Pombo entre os mestres fundadores. Olho de Pombo esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Olho de Pombo foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Full name documented in Mestre Noronha''s manuscripts as "Algemiro Grande Olho de Pombo", with profession listed as longshoreman. The name appears to be a compound descriptor: "Argemiro" (first name), "Grande" (tall/big), and "Olho de Pombo" (Pigeon Eye). Some sources have listed "Argemiro Grande" and "Olho de Pombo" as separate individuals, but historical evidence from Noronha''s manuscripts indicates this was one person. No death date documented.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Nome completo documentado nos manuscritos de Mestre Noronha como "Algemiro Grande Olho de Pombo", com profissão listada como estivador. O nome parece ser um descritor composto: "Argemiro" (primeiro nome), "Grande" (alto/grande), e "Olho de Pombo" (Olho de Pombo). Algumas fontes listaram "Argemiro Grande" e "Olho de Pombo" como indivíduos separados, mas evidências históricas dos manuscritos de Noronha indicam que era uma pessoa. Nenhuma data de falecimento documentada.'
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
