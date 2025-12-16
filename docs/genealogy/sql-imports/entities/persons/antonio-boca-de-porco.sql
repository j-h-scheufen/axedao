-- ============================================================
-- GENEALOGY PERSON: Antônio Boca de Porco
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- As a founding mestre of Gengibirra in the 1920s, Antônio Boca de Porco
-- was likely an established practitioner by that time (age 25-40). This
-- suggests a birth year around 1880-1900. Using mid-point estimate with
-- decade precision: ~1890.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Antônio',
  'Boca de Porco',
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
  E'Antônio Boca de Porco ("Pig Mouth") was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nBoca de Porco worked as a stevedore (estivador) - a dock worker who loaded and unloaded ships at Salvador''s busy port. This occupation was common among capoeiristas of his era, as the physically demanding work of the docks attracted strong, skilled fighters. The nickname "Boca de Porco" ("Pig Mouth") was distinctive and memorable, though the origin of this apelido has not been documented.\n\nMestre Noronha, in his handwritten manuscripts (completed April 29, 1976, later published as "O ABC da Capoeira Angola" in 1993), specifically listed "Antonio Boca de Porco stevedore" among the founding mestres of what he called "the first capoeira centre of the State of Bahia." The inclusion of his occupation alongside his name in Noronha''s careful documentation suggests it was an important part of his identity within the capoeira community.\n\nBoca de Porco was present at the historic gathering when, on February 23, 1941, Mestre Aberrê introduced Mestre Pastinha to the roda at Gengibirra, leading to Pastinha''s eventual assumption of leadership and the transformation of the center into the internationally famous CECA (Centro Esportivo de Capoeira Angola).\n\nNo further biographical details about Antônio Boca de Porco have been documented.',
  E'Antônio Boca de Porco ("Boca de Porco") foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nBoca de Porco trabalhava como estivador - um trabalhador portuário que carregava e descarregava navios no movimentado porto de Salvador. Esta ocupação era comum entre os capoeiristas de sua época, pois o trabalho fisicamente exigente das docas atraía lutadores fortes e habilidosos. O apelido "Boca de Porco" era distintivo e memorável, embora a origem deste apelido não tenha sido documentada.\n\nMestre Noronha, em seus manuscritos escritos à mão (concluídos em 29 de abril de 1976, posteriormente publicados como "O ABC da Capoeira Angola" em 1993), listou especificamente "Antonio Boca de Porco estivador" entre os mestres fundadores do que chamou de "o primeiro centro de capoeira do Estado da Bahia". A inclusão de sua ocupação junto ao seu nome na cuidadosa documentação de Noronha sugere que era uma parte importante de sua identidade dentro da comunidade de capoeira.\n\nBoca de Porco esteve presente na histórica reunião quando, em 23 de fevereiro de 1941, Mestre Aberrê apresentou Mestre Pastinha à roda do Gengibirra, levando à eventual assunção da liderança por Pastinha e à transformação do centro no internacionalmente famoso CECA (Centro Esportivo de Capoeira Angola).\n\nNenhum outro detalhe biográfico sobre Antônio Boca de Porco foi documentado.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia.',
  E'Birth year estimated at ~1890 (decade precision) based on active participation as founding mestre in 1920s. First name "Antônio" known. Worked as stevedore (dock worker) at Salvador''s port. The nickname "Boca de Porco" means "Pig Mouth" - origin of nickname not documented. No death date documented. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1890 (precisão de década) com base na participação ativa como mestre fundador na década de 1920. Primeiro nome "Antônio" conhecido. Trabalhava como estivador no porto de Salvador. O apelido "Boca de Porco" - origem do apelido não documentada. Nenhuma data de falecimento documentada. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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
