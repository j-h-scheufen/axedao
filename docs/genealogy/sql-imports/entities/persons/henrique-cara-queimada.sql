-- ============================================================
-- GENEALOGY PERSON: Henrique Cara Queimada
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Henrique was likely
-- an established practitioner by that time (age 25-40). This suggests
-- a birth year around 1880-1900. Using mid-point estimate with decade
-- precision: ~1890.
-- ============================================================
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Henrique',
  'Cara Queimada',
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
  E'Henrique Cara Queimada ("Henrique Burnt Face") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nThe origin of his apelido "Cara Queimada" has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Henrique Cara Queimada among the founding mestres. While four mestres were recognized as "donos e proprietários" (owners and proprietors) - Noronha, Livino, Totonho de Maré, and Amorzinho - the other 18 founding mestres, including Henrique Cara Queimada, were equally important contributors to the establishment and operation of this historic center.\n\nHenrique Cara Queimada was present during the center''s operation throughout the 1920s and 1930s, practicing capoeira during the dangerous era of police persecution under police chief "Pedrito" (1920-1927). The center was protected by Amorzinho, a civil guard whose position provided crucial protection from police raids.\n\nOn February 23, 1941, Henrique Cara Queimada would have been among the mestres present when Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Henrique Cara Queimada have been documented.',
  E'Henrique Cara Queimada foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nA origem de seu apelido "Cara Queimada" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Henrique Cara Queimada entre os mestres fundadores. Enquanto quatro mestres foram reconhecidos como "donos e proprietários" - Noronha, Livino, Totonho de Maré e Amorzinho - os outros 18 mestres fundadores, incluindo Henrique Cara Queimada, foram igualmente importantes contribuintes para o estabelecimento e operação deste centro histórico.\n\nHenrique Cara Queimada esteve presente durante a operação do centro ao longo das décadas de 1920 e 1930, praticando capoeira durante a perigosa era da perseguição policial sob o delegado "Pedrito" (1920-1927). O centro era protegido por Amorzinho, um guarda civil cuja posição fornecia proteção crucial contra as batidas policiais.\n\nEm 23 de fevereiro de 1941, Henrique Cara Queimada teria estado entre os mestres presentes quando Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Henrique Cara Queimada foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. First name "Henrique" is known. The origin of the apelido "Cara Queimada" has not been documented. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Primeiro nome "Henrique" é conhecido. A origem do apelido "Cara Queimada" não foi documentada. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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
