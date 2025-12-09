-- ============================================================
-- GENEALOGY PERSON IMPORT: Totonho de Maré
-- Generated: 2025-12-09
-- Primary Source: https://velhosmestres.com/en/featured-12
-- ============================================================
-- DEPENDENCIES: persons/aberre.sql, persons/onca-preta.sql, persons/geraldo-chapeleiro.sql, persons/creoni.sql, persons/chico-tres-pedacos.sql, persons/paulo-barroquinha.sql, persons/barboza.sql
-- ============================================================
--
-- BIRTH/DEATH DATES: Both confirmed exact from multiple sources.
-- Born September 17, 1894 on Ilha de Maré; died October 18, 1974.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Antonio Laurindo das Neves',
  'Totonho de Maré',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-12"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-totonho-de-mare/"}, {"type": "website", "url": "https://www.lalaue.com/learn-capoeira/mestre-totonho-de-mare/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Capoeira Angola; never founded an academy but taught informally at street parties; known for coining "galanteria da capoeira" to describe the nobility of old Bahian capoeiristas.',
  E'Capoeira Angola; nunca fundou uma academia mas ensinou informalmente em festas de rua; conhecido por cunhar "galanteria da capoeira" para descrever a nobreza dos antigos capoeiristas baianos.',
  -- Life dates
  1894,
  'exact'::genealogy.date_precision,
  'Ilha de Maré, Salvador, Bahia, Brazil',
  1974,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bilingual)
  E'Antônio Laurindo das Neves, known as Mestre Totonho de Maré, was born on September 17, 1894, on Ilha de Maré in the Bay of All Saints, to Manoel Gasparino Neves and Margarida Neves. He was five years younger than Mestre Pastinha, one year older than Besouro Mangangá, and six years older than Mestre Bimba—placing him at the center of capoeira''s foundational generation.\n\nTotonho de Maré claimed to have learned capoeira by himself, observing older practitioners play and then testing his skills on the streets of Salvador. He began playing in 1911 and became known for his physical strength, dexterity, and great stature, winning many physical duels throughout Bahia.\n\nFor many years he "reigned" on Ilha de Maré, which gave him his nickname. He worked as a wagoner, grocery store operator, and docker to support himself while teaching capoeira informally in different neighborhoods of Salvador. Unlike many contemporaries, he never founded an academy, preferring to teach at street parties and public gatherings.\n\nIn 1936, Samuel de Souza ("Querido de Deus") publicly stated that the Bahian championship title "deservedly belongs to Maré" over Bimba. That same year, Edison Carneiro praised him alongside Samuel Querido de Deus as "the best capoeiristas from Bahia." Carneiro later referenced him in "Negros Bantus" (1937) as both a capoeirista and docker.\n\nMestre Noronha recognized Totonho de Maré as one of the four "donos e proprietários" (owners and proprietors) of Gengibirra—the first centro of Capoeira Angola—alongside himself, Amorzinho, and Livino. In 1941, this group participated in founding CECA (Centro Esportivo de Capoeira Angola), handing leadership of their Gengibirra centro at Ladeira da Pedra to Mestre Pastinha.\n\nIn 1968, at age 74, Totonho de Maré appeared in the documentary "Dança de Guerra" directed by Jair Moura, demonstrating vadiação with Mestre Noronha—preserving footage of his playing style for future generations.\n\nIn his final interviews before his death, he expressed concern about the evolution of capoeira: "Capoeira de Angola is beautiful, but today it''s falsified...it used to be only for the love of the art." He praised Mestre Bimba as "a great mestre who fought a lot for the valorization of capoeira."\n\nTotonho de Maré died on October 18, 1974, at 80 years old. He is frequently honored in modern capoeira rodas through verses that reflect his elevated status within the tradition. He coined the expression "galanteria da capoeira" to describe the nobility and elegance of the old Bahian capoeiristas—a phrase that captures the dignity he saw in the art.',
  E'Antônio Laurindo das Neves, conhecido como Mestre Totonho de Maré, nasceu em 17 de setembro de 1894, na Ilha de Maré na Baía de Todos os Santos, filho de Manoel Gasparino Neves e Margarida Neves. Era cinco anos mais novo que Mestre Pastinha, um ano mais velho que Besouro Mangangá e seis anos mais velho que Mestre Bimba—colocando-o no centro da geração fundadora da capoeira.\n\nTotonho de Maré afirmou ter aprendido capoeira sozinho, observando praticantes mais velhos jogarem e depois testando suas habilidades nas ruas de Salvador. Começou a jogar em 1911 e ficou conhecido por sua força física, destreza e grande estatura, vencendo muitos duelos físicos por toda a Bahia.\n\nPor muitos anos ele "reinou" na Ilha de Maré, o que lhe deu seu apelido. Trabalhou como carroceiro, comerciante de mercearia e estivador para se sustentar enquanto ensinava capoeira informalmente em diferentes bairros de Salvador. Diferente de muitos contemporâneos, nunca fundou uma academia, preferindo ensinar em festas de rua e reuniões públicas.\n\nEm 1936, Samuel de Souza ("Querido de Deus") declarou publicamente que o título de campeão baiano "pertence merecidamente a Maré" sobre Bimba. Nesse mesmo ano, Edison Carneiro o elogiou junto com Samuel Querido de Deus como "os melhores capoeiristas da Bahia." Carneiro depois o referenciou em "Negros Bantus" (1937) como capoeirista e estivador.\n\nMestre Noronha reconheceu Totonho de Maré como um dos quatro "donos e proprietários" da Gengibirra—o primeiro centro de Capoeira Angola—junto com ele mesmo, Amorzinho e Livino. Em 1941, esse grupo participou da fundação do CECA (Centro Esportivo de Capoeira Angola), passando a liderança de seu centro Gengibirra na Ladeira da Pedra para Mestre Pastinha.\n\nEm 1968, aos 74 anos, Totonho de Maré apareceu no documentário "Dança de Guerra" dirigido por Jair Moura, demonstrando vadiação com Mestre Noronha—preservando filmagens de seu estilo de jogo para futuras gerações.\n\nEm suas entrevistas finais antes de sua morte, ele expressou preocupação com a evolução da capoeira: "Capoeira de Angola é bonita, mas hoje está falsificada...antes era só pelo amor à arte." Ele elogiou Mestre Bimba como "um grande mestre que lutou muito pela valorização da capoeira."\n\nTotonho de Maré morreu em 18 de outubro de 1974, aos 80 anos. Ele é frequentemente homenageado nas rodas de capoeira modernas através de versos que refletem seu status elevado dentro da tradição. Ele cunhou a expressão "galanteria da capoeira" para descrever a nobreza e elegância dos antigos capoeiristas baianos—uma frase que captura a dignidade que ele via na arte.',
  E'Co-founder of Gengibirra, the first centro of Capoeira Angola\nRecognized as one of the four "owners" of Gengibirra alongside Noronha, Amorzinho, and Livino\nPublicly declared by Samuel Querido de Deus as deserving Bahian championship over Bimba (1936)\nPraised by Edison Carneiro as one of "the best capoeiristas from Bahia"\nFeatured in documentary "Dança de Guerra" (1968) with Mestre Noronha\nCoined the expression "galanteria da capoeira"',
  E'Co-fundador da Gengibirra, o primeiro centro de Capoeira Angola\nReconhecido como um dos quatro "donos" da Gengibirra junto com Noronha, Amorzinho e Livino\nDeclarado publicamente por Samuel Querido de Deus como merecedor do campeonato baiano sobre Bimba (1936)\nElogiado por Edison Carneiro como um dos "melhores capoeiristas da Bahia"\nApresentado no documentário "Dança de Guerra" (1968) com Mestre Noronha\nCunhou a expressão "galanteria da capoeira"',
  -- Researcher notes
  E'BIRTH DATE: September 17, 1894 - confirmed in multiple sources including velhosmestres.com\nDEATH DATE: October 18, 1974 - confirmed in multiple sources\nPARENTS: Manoel Gasparino Neves and Margarida Neves\n\nTIMELINE:\n- 1911/1918: Started learning capoeira (sources vary - 1911 per nossa-tribo, 1918 per velhosmestres)\n- 1936: Declared by Querido de Deus as deserving Bahian championship\n- 1937: Referenced in Edison Carneiro''s "Negros Bantus"\n- 1941: Participated in founding CECA; handed Gengibirra to Pastinha\n- 1968: Featured in "Dança de Guerra" documentary\n- 1974: Final interviews with Diário de Notícias; died October 18\n\nOCCUPATIONS: Wagoner, grocery store operator, docker/stevedore\n\nKEY QUOTE: "Capoeira de Angola is beautiful, but today it''s falsified...it used to be only for the love of the art."\n\nPENDING RELATIONSHIPS:\n- Totonho de Maré co_founded Gengibirra (requires group import)\n- Totonho de Maré associated_with Mestre Noronha (contemporary, documented in film)\n- Totonho de Maré associated_with Aberrê (both at Matatu Preto per Canjiquinha)',
  E'DATA DE NASCIMENTO: 17 de setembro de 1894 - confirmado em múltiplas fontes incluindo velhosmestres.com\nDATA DE MORTE: 18 de outubro de 1974 - confirmado em múltiplas fontes\nPAIS: Manoel Gasparino Neves e Margarida Neves\n\nCRONOLOGIA:\n- 1911/1918: Começou a aprender capoeira (fontes variam - 1911 per nossa-tribo, 1918 per velhosmestres)\n- 1936: Declarado por Querido de Deus como merecedor do campeonato baiano\n- 1937: Referenciado em "Negros Bantus" de Edison Carneiro\n- 1941: Participou da fundação do CECA; passou Gengibirra para Pastinha\n- 1968: Apresentado no documentário "Dança de Guerra"\n- 1974: Entrevistas finais com Diário de Notícias; morreu em 18 de outubro\n\nOCUPAÇÕES: Carroceiro, comerciante de mercearia, estivador\n\nCITAÇÃO CHAVE: "Capoeira de Angola é bonita, mas hoje está falsificada...antes era só pelo amor à arte."\n\nRELACIONAMENTOS PENDENTES:\n- Totonho de Maré co_founded Gengibirra (requer importação do grupo)\n- Totonho de Maré associated_with Mestre Noronha (contemporâneo, documentado em filme)\n- Totonho de Maré associated_with Aberrê (ambos no Matatu Preto per Canjiquinha)'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Totonho de Maré associated_with Aberrê (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Part of the Matatu Preto training circle that included Onça Preta, Geraldo Chapeleiro, Creoni, Chico Três Pedaços, Paulo Barroquinha, and Barboza',
  'Parte do círculo de treino do Matatu Preto que incluía Onça Preta, Geraldo Chapeleiro, Creoni, Chico Três Pedaços, Paulo Barroquinha e Barboza'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré associated_with Onça Preta (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré associated_with Geraldo Chapeleiro (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Geraldo Chapeleiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré associated_with Creoni (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Creoni'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré associated_with Chico Três Pedaços (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré associated_with Paulo Barroquinha (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Paulo Barroquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré associated_with Barboza (Matatu Preto training group)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Barboza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/totonho-de-mare.sql',
  NULL,
  ARRAY['persons/aberre.sql', 'persons/onca-preta.sql', 'persons/geraldo-chapeleiro.sql', 'persons/creoni.sql', 'persons/chico-tres-pedacos.sql', 'persons/paulo-barroquinha.sql', 'persons/barboza.sql'],
  'Co-founder of Gengibirra (1941); contemporary of Bimba and Pastinha; featured in Dança de Guerra documentary (1968)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
