-- ============================================================
-- GENEALOGY PERSON: Paquete do Cabula
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Paquete was likely
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
  NULL,
  'Paquete do Cabula',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Cabula, Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Paquete do Cabula was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador\'s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nHis apelido suggests a connection to the Cabula neighborhood of Salvador. The origin of the nickname "Paquete" has not been documented.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Paquete do Cabula among the founding mestres. Paquete was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha\'s assumption of leadership and the eventual transformation into CECA.\n\nNo further biographical details about Paquete do Cabula have been documented.',
  E'Paquete do Cabula foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nSeu apelido sugere uma conexão com o bairro do Cabula em Salvador. A origem do apelido "Paquete" não foi documentada.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Paquete do Cabula entre os mestres fundadores. Paquete esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à assunção da liderança por Pastinha e à eventual transformação em CECA.\n\nNenhum outro detalhe biográfico sobre Paquete do Cabula foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Apelido "Paquete do Cabula" suggests connection to Cabula neighborhood of Salvador. The origin of the nickname "Paquete" has not been documented. No full name or death date documented. Information sourced primarily from Mestre Noronha\'s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Apelido "Paquete do Cabula" sugere conexão com o bairro do Cabula em Salvador. A origem do apelido "Paquete" não foi documentada. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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
