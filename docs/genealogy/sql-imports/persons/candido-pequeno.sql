-- ============================================================
-- GENEALOGY PERSON IMPORT: Cândido Pequeno
-- Generated: 2025-12-08
-- Primary Source: Mestre Noronha's manuscripts via velhosmestres.com, capoeirahistory.com
-- ============================================================
-- DEPENDENCIES: persons/noronha.sql (for student_of statement), groups/gengibirra.sql (for co_founded statement)
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1870 with 'decade' precision):
-- Referred to as "o velho Cândido Pequeno" (the old Cândido Pequeno) when
-- teaching 8-year-old Noronha in 1917. If he was 40-55 years old when
-- teaching in 1917, birth = ~1862-1877. Using 1870 as midpoint estimate.
-- Also described as "negro descendente de Angola" suggesting possibly
-- African-born or first-generation descendant.
--
-- DEATH: Unknown. No records of his death have been found.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (all columns from genealogy.person_profiles)
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Cândido da Costa',
  'Cândido Pequeno',
  NULL,  -- No formal title system existed; was recognized as "champion" but this was informal
  NULL,  -- No known portrait
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-9"}, {"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-stylistic era; taught what would later be called Capoeira Angola. Noronha credits him with teaching the solta and rabo-de-arraia techniques.',
  E'Era pré-estilística; ensinava o que mais tarde seria chamado de Capoeira Angola. Noronha o credita por ensinar as técnicas de solta e rabo-de-arraia.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'In the early 20th century, when capoeira was still a criminal offense in Brazil, Cândido Pequeno operated as one of its most respected practitioners in Salvador, Bahia. Known as "the champion of capoeira in the State of Bahia," he was recognized not just for his skill but for embodying the tradition itself. He was described as a "negro descendente de Angola" - a Black man of Angolan descent - and wore a small gold ring in his ear, the "argolinha de ouro" that historian Manuel Querino documented as a sign of strength and bravery among Bahian capoeiristas.\n\nIn 1917, in the alley called Beco de Xaréu, Cândido Pequeno was teaching capoeira when an 8-year-old boy named Daniel Coutinho arrived to learn. This boy would become Mestre Noronha, one of the most important documentarians of early capoeira history. Decades later, Noronha wrote of his teacher with profound reverence: "As champion of capoeira in the State of Bahia, this great master was the one who taught me capoeira angola with complete dedication." He learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia" from the old master.\n\nBy the 1920s, Cândido Pequeno was among the 22 founding mestres who established the Centro de Capoeira Angola at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood - what Noronha claimed was the first capoeira center in Bahia. Alongside him were his student Noronha, possibly a relative named Lúcio Pequeno, and many others who would shape the trajectory of capoeira Angola. The center adopted green and yellow - the colors of the Brazilian flag - symbolized on the clothes worn by its disciples.\n\nWhat happened to Cândido Pequeno after the 1920s is unknown. By 1941, when the surviving mestres handed the Gengibirra center to Mestre Pastinha, there is no mention of him. But through Noronha''s manuscripts, his legacy survived: the champion who wore the golden ring, who taught in the alleys when it was forbidden, who passed the art to the next generation.',
  E'No início do século XX, quando a capoeira ainda era crime no Brasil, Cândido Pequeno atuava como um dos seus praticantes mais respeitados em Salvador, Bahia. Conhecido como "o campeão da capoeira do Estado da Bahia," era reconhecido não apenas por sua habilidade, mas por personificar a própria tradição. Era descrito como "negro descendente de Angola" e usava uma pequena argola de ouro na orelha, a "argolinha de ouro" que o historiador Manuel Querino documentou como sinal de força e valentia entre os capoeiristas baianos.\n\nEm 1917, no beco chamado Beco de Xaréu, Cândido Pequeno estava ensinando capoeira quando um menino de 8 anos chamado Daniel Coutinho chegou para aprender. Este menino se tornaria Mestre Noronha, um dos mais importantes documentaristas da história da capoeira antiga. Décadas depois, Noronha escreveu sobre seu mestre com profunda reverência: "Campeão da capoeira do Estado da Bahia, esse grande mestre foi quem me ensinou a capoeira angola com toda dedicação." Ele aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia" com o velho mestre.\n\nNa década de 1920, Cândido Pequeno estava entre os 22 mestres fundadores que estabeleceram o Centro de Capoeira Angola na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade - o que Noronha afirmava ser o primeiro centro de capoeira da Bahia. Ao seu lado estavam seu aluno Noronha, possivelmente um parente chamado Lúcio Pequeno, e muitos outros que moldariam a trajetória da capoeira angola. O centro adotou o verde e amarelo - as cores da bandeira brasileira - simbolizados nas roupas usadas por seus discípulos.\n\nO que aconteceu com Cândido Pequeno depois da década de 1920 é desconhecido. Em 1941, quando os mestres sobreviventes entregaram o centro do Gengibirra a Mestre Pastinha, não há menção a ele. Mas através dos manuscritos de Noronha, seu legado sobreviveu: o campeão que usava a argola de ouro, que ensinava nos becos quando era proibido, que passou a arte para a próxima geração.',
  -- Achievements (bilingual)
  'Recognized as "champion of capoeira in the State of Bahia" by his contemporaries. Co-founded the Centro de Capoeira Angola at Ladeira de Pedra (Gengibirra) in the 1920s - claimed to be the first capoeira center in Bahia. Trained Mestre Noronha, who would become one of the most important documentarians of capoeira history.',
  'Reconhecido como "campeão da capoeira do Estado da Bahia" por seus contemporâneos. Co-fundou o Centro de Capoeira Angola na Ladeira de Pedra (Gengibirra) na década de 1920 - considerado o primeiro centro de capoeira da Bahia. Treinou Mestre Noronha, que se tornaria um dos mais importantes documentaristas da história da capoeira.',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Referred to as "o velho Cândido Pequeno" (the old Cândido Pequeno) when teaching 8-year-old Noronha in 1917. If he was 40-55 years old when teaching in 1917, birth = ~1862-1877. Using 1870 as midpoint estimate.\n\nORIGIN: Described as "negro descendente de Angola" suggesting African-born or first-generation descendant. Combined with the earring tradition documented by Manuel Querino, indicates strong African cultural identity.\n\nNAME: Also known as "Argolinha de Ouro" (Golden Little Ring) due to the small gold earring he wore. Full name recorded as Cândido da Costa.\n\nDEATH: Unknown. No records of his death have been found. Last documented activity was co-founding Gengibirra in the 1920s.\n\nPOSSIBLE RELATIVE: Lúcio Pequeno, also a founding mestre of Gengibirra, may be a brother or relative given the shared surname.\n\nPENDING RELATIONSHIPS (require future imports):\n- Noronha student_of Cândido Pequeno (1917-?)\n- Cândido Pequeno co_founded Gengibirra (1920s)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Referido como "o velho Cândido Pequeno" quando ensinava Noronha de 8 anos em 1917. Se tinha 40-55 anos quando ensinava em 1917, nascimento = ~1862-1877. Usando 1870 como estimativa do ponto médio.\n\nORIGEM: Descrito como "negro descendente de Angola" sugerindo nascido na África ou descendente de primeira geração. Combinado com a tradição do brinco documentada por Manuel Querino, indica forte identidade cultural africana.\n\nNOME: Também conhecido como "Argolinha de Ouro" (Pequena Argola de Ouro) devido ao pequeno brinco de ouro que usava. Nome completo registrado como Cândido da Costa.\n\nMORTE: Desconhecida. Nenhum registro de sua morte foi encontrado. Última atividade documentada foi a co-fundação do Gengibirra na década de 1920.\n\nPOSSÍVEL PARENTE: Lúcio Pequeno, também mestre fundador do Gengibirra, pode ser irmão ou parente dado o sobrenome compartilhado.\n\nRELACIONAMENTOS PENDENTES (requerem importações futuras):\n- Noronha student_of Cândido Pequeno (1917-?)\n- Cândido Pequeno co_founded Gengibirra (década de 1920)'
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
-- Only generate for entities that EXIST in our dataset
-- ============================================================

-- No statements can be generated yet:
-- - Noronha (student) not yet imported
-- - Gengibirra (group) not yet imported
-- - Lúcio Pequeno (possible relative) not yet imported
--
-- PENDING RELATIONSHIPS (for future imports):
--
-- 1. Noronha student_of Cândido Pequeno
--    Started: 1917 (year precision)
--    Ended: Unknown
--    Source: Noronha's manuscripts via velhosmestres.com
--    Notes: Noronha began training at age 8 in Beco de Xaréu
--
-- 2. Cândido Pequeno co_founded Gengibirra
--    Started: ~1920s (decade precision)
--    Source: Noronha's manuscripts
--    Notes: One of 22 founding mestres
--
-- 3. Cândido Pequeno associated_with Lúcio Pequeno
--    Type: Possible family (brother)
--    Confidence: uncertain
--    Source: Shared surname; both founding mestres of Gengibirra

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/candido-pequeno.sql',
  NULL,
  ARRAY['persons/noronha.sql', 'groups/gengibirra.sql']::text[],
  'Champion of capoeira in the State of Bahia; teacher of Mestre Noronha; co-founder of Gengibirra; known as Argolinha de Ouro'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
