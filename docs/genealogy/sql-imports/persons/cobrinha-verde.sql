-- ============================================================
-- GENEALOGY PERSON IMPORT: Cobrinha Verde
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://velhosmestres.com/en/cobrinhaverde (Velhos Mestres)
--   - https://velhosmestres.com/br/cobrinha-1912-1 (Pastinha's registration book)
--   - https://capoeira.online/history/mestres/cobrinha-verde/
--   - https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/
--   - https://nossa-tribo.com/mestre-cobrinha-verde-o-primo-de-besouro-manganga/
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt
) VALUES (
  -- Identity
  'Rafael Alves França',
  'Cobrinha Verde',
  'mestre'::genealogy.title,
  NULL, -- No public domain portrait available
  '[{"type": "website", "url": "https://velhosmestres.com/en/cobrinhaverde"}, {"type": "website", "url": "https://capoeira.online/history/mestres/cobrinha-verde/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  'Transitional era figure. Learned pre-codification capoeira from Besouro and the Santo Amaro mestres; later collaborated with both Mestre Bimba and Mestre Pastinha, identifying primarily with the Angola tradition.',
  'Figura da era de transição. Aprendeu capoeira pré-codificação com Besouro e os mestres de Santo Amaro; posteriormente colaborou tanto com Mestre Bimba quanto com Mestre Pastinha, identificando-se principalmente com a tradição Angola.',
  -- Life dates
  1912,
  'exact'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1983,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Rafael Alves França was born on October 24, 1912, in Santo Amaro da Purificação—a town in the Recôncavo Baiano that he called "the birthplace of Bahian capoeira." His parents were João Alves França and Maria Narcisa Bispo.

His connection to capoeira began through blood: his aunt Maria Haifa was the mother of Besouro Mangangá. Besouro was raised by Cobrinha''s mother, making them effectively brothers as well as cousins. At four years old, in 1916, Rafael began learning capoeira from Besouro. His cousin gave him the nickname "Cobrinha Verde" (little green snake) because of his exceptional speed and agility. According to Cobrinha: "It was Besouro himself, my mestre, who gave me my nickname because I was very quick."

Beyond Besouro, he learned from many other mestres in Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, and Neco Canário Pardo. Neco taught him the machete, while a woman named Tonha Rolo do Mar taught him the razor technique.

His mystical education came from an African named Tio Pascoal, a neighbor of his grandmother. From Pascoal he learned the mandingas of the patuá, prayers, and corpo fechado (closed body protection). Cobrinha claimed to possess a patuá with magical powers: "It was alive and would jump when left on a virgin plate."

At seventeen, in 1929, Cobrinha joined the band of Colonel Horácio de Matos in the Lençóis region of the Bahian sertão. He earned 10 mil-réis per day to fight with police. He spent three years and six months with the band. One midnight, he dreamed his father''s spirit asked him to leave; he woke and fled while everyone slept.

He traveled to Manaus, living with an indigenous woman and having two children. Around age 22, he joined the 1930 Revolution under Getúlio Vargas, achieving the rank of 3rd Sergeant. Of his battalion of 85 men, only he survived.

After leaving the army, in 1935 he began teaching capoeira at Fazenda Garcia—and here is a remarkable detail: he gave instruction to Mestre Bimba and helped him teach his students at Bogum, Engenho Velho da Federação. This places Cobrinha as an influence on Regional capoeira''s development, not just Angola.

He also collaborated with Mestre Pastinha''s academy, instructing students in singing, berimbau playing, and capoeira movements. Pastinha''s official membership book lists him as member number 28, admitted August 12, 1955. His roda became one of the most respected in Salvador, alongside those of Mestre Bimba, Mestre Pastinha, and Mestre Waldemar. For many years he taught at his Centro Esportivo de Capoeira Angola Dois de Julho.

Cobrinha Verde was one of the only capoeiristas who knew the "Santa Maria" game—a dangerous technique of fighting with a razor blade wedged between the toes. He also introduced to Capoeira Angola the practice of touching the floor repeatedly during play, as if releasing mandinga. This gesture became emblematic of Angola capoeira and was spread by Mestre João Grande.

In 1962, he recorded an LP "Capoeira da Bahia" with Mestre Traíra and Mestre Gato Preto, now considered a masterpiece and one of the earliest musical documents of capoeira.

Cobrinha Verde never charged money to teach capoeira—he worked as a pedreiro (stonemason). This fulfilled a deathbed promise to Besouro: "On his deathbed, Besouro told me that I was the only one to whom he was giving his spirit to teach capoeira."

By 1982, he was the last surviving "old master" in Bahia. He died in 1983, leaving a legacy that bridges the legendary era of Besouro to the documented lineage that continues today.',
  -- bio_pt
  E'Rafael Alves França nasceu em 24 de outubro de 1912, em Santo Amaro da Purificação—cidade do Recôncavo Baiano que ele chamava de "o berço da capoeira baiana." Seus pais eram João Alves França e Maria Narcisa Bispo.

Sua conexão com a capoeira começou pelo sangue: sua tia Maria Haifa era mãe de Besouro Mangangá. Besouro foi criado pela mãe de Cobrinha, tornando-os efetivamente irmãos além de primos. Com quatro anos, em 1916, Rafael começou a aprender capoeira com Besouro. Seu primo deu-lhe o apelido "Cobrinha Verde" por causa de sua excepcional velocidade e agilidade. Segundo Cobrinha: "Foi o próprio Besouro, meu mestre, quem me deu meu apelido porque eu era muito rápido."

Além de Besouro, aprendeu com muitos outros mestres em Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso e Neco Canário Pardo. Neco ensinou-lhe o facão, enquanto uma mulher chamada Tonha Rolo do Mar ensinou-lhe a técnica da navalha.

Sua educação mística veio de um africano chamado Tio Pascoal, vizinho de sua avó. De Pascoal ele aprendeu as mandingas do patuá, orações e corpo fechado. Cobrinha afirmava possuir um patuá com poderes mágicos: "Era vivo e pulava quando deixado em um prato virgem."

Aos dezessete anos, em 1929, Cobrinha juntou-se ao bando do Coronel Horácio de Matos na região de Lençóis do sertão baiano. Ganhava 10 mil-réis por dia para lutar com a polícia. Passou três anos e seis meses com o bando. Uma meia-noite, sonhou que o espírito de seu pai pedia que partisse; acordou e fugiu enquanto todos dormiam.

Viajou para Manaus, vivendo com uma indígena e tendo dois filhos. Por volta dos 22 anos, juntou-se à Revolução de 1930 sob Getúlio Vargas, alcançando o posto de 3º Sargento. De seu batalhão de 85 homens, apenas ele sobreviveu.

Após deixar o exército, em 1935 começou a ensinar capoeira na Fazenda Garcia—e aqui está um detalhe notável: ele dava instrução a Mestre Bimba e ajudava-o a ensinar seus alunos no Bogum, Engenho Velho da Federação. Isso coloca Cobrinha como uma influência no desenvolvimento da Capoeira Regional, não apenas Angola.

Também colaborou com a academia de Mestre Pastinha, instruindo alunos em canto, toque de berimbau e movimentos de capoeira. O livro oficial de membros de Pastinha o lista como membro número 28, admitido em 12 de agosto de 1955. Sua roda tornou-se uma das mais respeitadas de Salvador, junto com as de Mestre Bimba, Mestre Pastinha e Mestre Waldemar. Por muitos anos ensinou em seu Centro Esportivo de Capoeira Angola Dois de Julho.

Cobrinha Verde era um dos únicos capoeiristas que conhecia o jogo "Santa Maria"—uma técnica perigosa de luta com navalha presa entre os dedos dos pés. Ele também introduziu na Capoeira Angola a prática de tocar o chão repetidamente durante o jogo, como se liberando mandinga. Este gesto tornou-se emblemático da capoeira Angola e foi difundido por Mestre João Grande.

Em 1962, gravou o LP "Capoeira da Bahia" com Mestre Traíra e Mestre Gato Preto, hoje considerado uma obra-prima e um dos primeiros documentos musicais da capoeira.

Cobrinha Verde nunca cobrou dinheiro para ensinar capoeira—trabalhava como pedreiro. Isso cumpria uma promessa de leito de morte a Besouro: "Em seu leito de morte, Besouro me disse que eu era o único a quem ele estava dando seu espírito para ensinar capoeira."

Em 1982, era o último "mestre velho" sobrevivente na Bahia. Morreu em 1983, deixando um legado que conecta a era lendária de Besouro à linhagem documentada que continua hoje.',
  -- achievements_en
  'Bridge between Besouro Mangangá and the modern lineage; introduced the floor-touching mandinga gesture to Capoeira Angola; collaborated with both Mestre Bimba and Mestre Pastinha; recorded landmark LP "Capoeira da Bahia" (1962); master of the Santa Maria razor technique; claimed to be first capoeirista to present outside Salvador',
  -- achievements_pt
  'Ponte entre Besouro Mangangá e a linhagem moderna; introduziu o gesto de mandinga de tocar o chão na Capoeira Angola; colaborou tanto com Mestre Bimba quanto com Mestre Pastinha; gravou o LP marcante "Capoeira da Bahia" (1962); mestre da técnica de navalha Santa Maria; afirmou ser o primeiro capoeirista a se apresentar fora de Salvador'
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
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- Cobrinha Verde was student_of Besouro Mangangá (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'year'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interviews; multiple sources confirm',
  'Began learning capoeira from Besouro at age 4 in 1916. Besouro was his cousin (aunt Maria Haifa was Besouro''s mother) and raised as his brother. On his deathbed, Besouro passed his "spirit to teach capoeira" to Cobrinha Verde.',
  'Começou a aprender capoeira com Besouro aos 4 anos em 1916. Besouro era seu primo (tia Maria Haifa era mãe de Besouro) e criado como seu irmão. Em seu leito de morte, Besouro passou seu "espírito de ensinar capoeira" para Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- Cobrinha Verde was family_of Besouro Mangangá (cousins)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"relationship_type": "other"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo - multiple sources confirm family relationship',
  'Cobrinha Verde''s aunt Maria Haifa was Besouro''s mother. Besouro was raised by Cobrinha''s mother Maria Narcisa Bispo, making them effectively brothers as well as cousins.',
  'A tia de Cobrinha Verde, Maria Haifa, era mãe de Besouro. Besouro foi criado pela mãe de Cobrinha, Maria Narcisa Bispo, tornando-os efetivamente irmãos além de primos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- --- Person-to-Person: Recognition ---

-- Besouro baptized Cobrinha Verde (gave him his apelido)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  started_at, started_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"apelido_given": "Cobrinha Verde"}'::jsonb,
  '1916-01-01'::date, 'approximate'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interview',
  'Besouro named him "Cobrinha Verde" (little green snake) because of his exceptional speed and agility with his legs.',
  'Besouro o nomeou "Cobrinha Verde" por causa de sua excepcional velocidade e agilidade com as pernas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/cobrinha-verde.sql',
  NULL,
  ARRAY['persons/besouro-manganga.sql'],
  'Mestre Cobrinha Verde (1912-1983); cousin and student of Besouro; bridge between legendary era and documented lineage'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

-- ============================================================
-- NOTES
-- ============================================================
--
-- Birth Year: Using October 24, 1912 based on Pastinha's official records.
--
-- Pending relationships (require SQL imports):
-- - trained_under: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue,
--   Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo
-- - trained_under: Tonha Rolo do Mar (razor technique)
-- - influenced_by: Tio Pascoal (mandingas, corpo fechado)
-- - associated_with: Mestre Bimba (helped teach at his academy 1935)
-- - associated_with: Mestre Pastinha (member of CECA, collaborated)
-- - founded: Centro Esportivo de Capoeira Angola Dois de Julho
-- ============================================================
