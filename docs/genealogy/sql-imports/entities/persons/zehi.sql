-- ============================================================
-- GENEALOGY PERSON: Zehí
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Zehí was likely
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
  'Zehí',
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
  E'Zehí (also spelled Zehi) was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nMestre Noronha, who documented the history of Gengibirra in his manuscripts (later published as "O ABC da Capoeira Angola" in 1993), listed Zehí among the founding mestres who established this historic center. The name appears with accent variation in different sources (Zehí/Zehi), reflecting the informal documentation practices of the era.\n\nZehí was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra. This event led to Pastinha''s assumption of leadership after the death of Mestre Amorzinho and the eventual transformation of the center into CECA (Centro Esportivo de Capoeira Angola).\n\nNo further biographical details about Zehí have been documented.',
  E'Zehí (também grafado Zehi) foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nMestre Noronha, que documentou a história do Gengibirra em seus manuscritos (posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou Zehí entre os mestres fundadores que estabeleceram este centro histórico. O nome aparece com variação de acento em diferentes fontes (Zehí/Zehi), refletindo as práticas informais de documentação da época.\n\nZehí esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra. Este evento levou à assunção da liderança por Pastinha após a morte de Mestre Amorzinho e à eventual transformação do centro em CECA (Centro Esportivo de Capoeira Angola).\n\nNenhum outro detalhe biográfico sobre Zehí foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. Name appears with spelling variation: Zehí/Zehi. No full name or death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. O nome aparece com variação de grafia: Zehí/Zehi. Nenhum nome completo ou data de falecimento documentados. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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
