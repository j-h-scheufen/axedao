-- ============================================================
-- GENEALOGY PERSON IMPORT: Gasolina
-- Generated: 2025-12-11
-- Primary Sources:
--   - https://velhosmestres.com/en/featured-34 (Onça Preta biography)
--   - https://www.lalaue.com/learn-capoeira/mestre-cobrinha-verde
--   - https://capoeira.online/history/mestres/cobrinha-verde/
--   - https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/
-- ============================================================
-- DEPENDENCIES: persons/cobrinha-verde.sql, persons/besouro-manganga.sql, persons/onca-preta.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1880 with 'decade' precision):
-- Gasolina was a contemporary of Besouro Mangangá (b. 1895, d. 1924) and taught
-- both Cobrinha Verde (b. 1912) and Onça Preta (b. 1909). Cobrinha Verde's
-- training with multiple Santo Amaro mestres began after Besouro's death in 1924.
-- Onça Preta trained with Gasolina "as a young boy." If Gasolina was teaching
-- in the 1920s and was peer/contemporary of Besouro, he was likely 10-20 years
-- older. He was killed during Pedrito persecution (1920-1926). If teaching
-- young students and killed while still active, likely born ~1870-1890.
-- Using 1880 as midpoint estimate.
--
-- DEATH: Killed during Pedrito persecution (1920-1926). Mestre Onça Preta
-- lists "Gasolinha" among those massacred by Police Chief Pedro de Azevedo
-- Gordilho's cavalry squad. Using 1925 as approximate death year.
--
-- NAME VARIATION: Sources use both "Gasolina" and "Gasolinha" (diminutive).
-- This appears to be the same person. "Gasolinha" is the more common form
-- in the Pedrito persecution accounts, while "Gasolina" appears in the
-- Cobrinha Verde testimony about Santo Amaro mestres.
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; known only by apelido
  'Gasolina',
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-34"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  E'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. His style would have been the undifferentiated capoeira of the Recôncavo and Salvador.',
  E'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão Angola/Regional. Seu estilo seria a capoeira indiferenciada do Recôncavo e Salvador.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1925,
  'approximate'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Gasolina was a capoeirista who moved between two worlds - the rural capoeira circles of Santo Amaro da Purificação in the Recôncavo Baiano and the urban streets of Salvador. His apelido ("gasoline") speaks to the industrial age that was transforming Brazil during his lifetime, though he practiced an art rooted in far older traditions.

In Santo Amaro, Gasolina was among the circle of mestres who trained the legendary Besouro Mangangá''s younger cousin, Rafael Alves França, who would become known as Mestre Cobrinha Verde. In an interview, Cobrinha Verde recounted his training: "My true mestre was Besouro, but I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo." This places Gasolina among the cohort of practitioners who kept capoeira alive in the cane fields and small towns of the Recôncavo.

In Salvador, Gasolina was part of the generation that trained young Cícero Navarro, who would later become Mestre Onça Preta. According to Onça Preta''s own testimony, as a boy he "trained with Samuel, Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê, and many others who are now dead."

The trajectory of Gasolina''s life ended in the brutal police repression of the 1920s. When Pedro de Azevedo Gordilho - the infamous "Pedrito" - became Chief of Police of Bahia in 1920, he launched a systematic campaign to exterminate capoeira practitioners. Mestre Onça Preta remembered the fallen: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino, and many others."

These were not deaths in open combat. Pedrito''s cavalry squad would capture capoeiristas and execute them in secret. The bodies would appear days later, thrown into the forest, their backs opened by knife cuts. "Few died of natural causes," Onça Preta said of his teachers'' generation. "The majority were assassinated."

With the death of Gasolina and so many others of his generation, an era ended. The knowledge they carried - the undifferentiated capoeira that existed before Bimba''s Regional and Pastinha''s formalized Angola - passed largely into the memories of their survivors like Cobrinha Verde and Onça Preta, who would become bridges to the documented era of capoeira history.',
  -- bio_pt
  E'Gasolina foi um capoeirista que transitava entre dois mundos - os círculos rurais de capoeira de Santo Amaro da Purificação no Recôncavo Baiano e as ruas urbanas de Salvador. Seu apelido ("gasolina") remete à era industrial que transformava o Brasil durante sua vida, embora praticasse uma arte enraizada em tradições muito mais antigas.

Em Santo Amaro, Gasolina estava entre o círculo de mestres que treinaram o primo mais novo do lendário Besouro Mangangá, Rafael Alves França, que se tornaria conhecido como Mestre Cobrinha Verde. Em uma entrevista, Cobrinha Verde relatou seu treinamento: "Meu verdadeiro mestre foi Besouro, mas aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um a um: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo." Isso coloca Gasolina entre a coorte de praticantes que mantiveram a capoeira viva nos canaviais e pequenas cidades do Recôncavo.

Em Salvador, Gasolina fazia parte da geração que treinou o jovem Cícero Navarro, que mais tarde se tornaria Mestre Onça Preta. Segundo o próprio testemunho de Onça Preta, quando menino ele "treinava com Samuel, Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê, e muitos outros que agora estão mortos."

A trajetória da vida de Gasolina terminou na brutal repressão policial dos anos 1920. Quando Pedro de Azevedo Gordilho - o infame "Pedrito" - tornou-se Chefe de Polícia da Bahia em 1920, lançou uma campanha sistemática para exterminar praticantes de capoeira. Mestre Onça Preta lembrou dos que caíram: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino, e muitos outros."

Estas não foram mortes em combate aberto. O esquadrão de cavalaria de Pedrito capturava capoeiristas e os executava em segredo. Os corpos apareciam dias depois, jogados no mato, as costas abertas de facadas. "Poucos morreram de morte natural," disse Onça Preta sobre a geração de seus mestres. "A maioria foi assassinada."

Com a morte de Gasolina e tantos outros de sua geração, uma era terminou. O conhecimento que carregavam - a capoeira indiferenciada que existia antes da Regional de Bimba e da Angola formalizada de Pastinha - passou em grande parte para as memórias de seus sobreviventes como Cobrinha Verde e Onça Preta, que se tornariam pontes para a era documentada da história da capoeira.',
  -- achievements_en
  'Teacher of Mestre Cobrinha Verde and Mestre Onça Preta; part of the generation of Santo Amaro mestres who preserved capoeira during the persecution era',
  -- achievements_pt
  'Professor de Mestre Cobrinha Verde e Mestre Onça Preta; parte da geração de mestres de Santo Amaro que preservou a capoeira durante a era de perseguição',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1880, decade precision): Gasolina was a contemporary of Besouro Mangangá (b. 1895) and taught both Cobrinha Verde (b. 1912) and Onça Preta (b. 1909). If he was peer/slightly older than Besouro and teaching young students in the 1920s, birth estimate is ~1870-1890. Using 1880 as midpoint.

DEATH YEAR ESTIMATION (~1925): Killed during Pedrito persecution (1920-1926) according to Mestre Onça Preta''s testimony. Using midpoint.

NAME VARIATION: Sources use both "Gasolina" and "Gasolinha" (diminutive form). The Santo Amaro sources (Cobrinha Verde testimony) use "Gasolina"; the Salvador/Pedrito persecution sources use "Gasolinha." This appears to be the same person with variant spelling/diminutive.

LOCATION: Active in both Santo Amaro da Purificação (Recôncavo) and Salvador. This dual presence is consistent with other capoeiristas of the era who moved between rural and urban contexts.

PENDING RELATIONSHIPS (require future imports):
- Maitá, Licurí, Joité, Dendê, Esperidião, Juvêncio Grosso, Espinho Remoso: contemporaries in Santo Amaro (associated_with when imported)

RELATIONSHIPS DEFINED IN THIS FILE:
- Onça Preta student_of Gasolina
- Cobrinha Verde trained_under Gasolina
- Gasolina associated_with Besouro Mangangá (contemporaries in Santo Amaro/Recôncavo)
- Gasolina associated_with Siri de Mangue (Santo Amaro mestres)
- Gasolina associated_with Doze Homens (Santo Amaro + Pedrito victims)
- Gasolina associated_with Neco Canário Pardo (Santo Amaro mestres)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década): Gasolina era contemporâneo de Besouro Mangangá (n. 1895) e ensinou tanto Cobrinha Verde (n. 1912) quanto Onça Preta (n. 1909). Se era par/ligeiramente mais velho que Besouro e ensinando jovens alunos nos anos 1920, estimativa de nascimento é ~1870-1890. Usando 1880 como ponto médio.

ESTIMATIVA DO ANO DE MORTE (~1925): Morto durante perseguição de Pedrito (1920-1926) segundo testemunho de Mestre Onça Preta. Usando ponto médio.

VARIAÇÃO DE NOME: Fontes usam tanto "Gasolina" quanto "Gasolinha" (forma diminutiva). As fontes de Santo Amaro (testemunho de Cobrinha Verde) usam "Gasolina"; as fontes de Salvador/perseguição de Pedrito usam "Gasolinha." Parece ser a mesma pessoa com variação de grafia/diminutivo.

LOCALIZAÇÃO: Ativo tanto em Santo Amaro da Purificação (Recôncavo) quanto em Salvador. Esta presença dupla é consistente com outros capoeiristas da era que transitavam entre contextos rurais e urbanos.

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- Maitá, Licurí, Joité, Dendê, Esperidião, Juvêncio Grosso, Espinho Remoso: contemporâneos em Santo Amaro (associated_with quando importados)

RELACIONAMENTOS DEFINIDOS NESTE ARQUIVO:
- Onça Preta student_of Gasolina
- Cobrinha Verde trained_under Gasolina
- Gasolina associated_with Besouro Mangangá (contemporâneos em Santo Amaro/Recôncavo)
- Gasolina associated_with Siri de Mangue (mestres de Santo Amaro)
- Gasolina associated_with Doze Homens (Santo Amaro + vítimas de Pedrito)
- Gasolina associated_with Neco Canário Pardo (mestres de Santo Amaro)'
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

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- Onça Preta student_of Gasolina
-- Note: Using student_of because Onça Preta explicitly called these his "mestres":
-- "Não tive um mestre, mas vários" (I didn't have one mestre, but many)
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
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Onça Preta biography: "as a boy, he trained with Samuel, Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê, and many others who are now dead"',
  E'Onça Preta (b. 1909) listed Gasolina among his mestres. Gasolina was killed during Pedrito persecution (~1925).',
  E'Onça Preta (n. 1909) listou Gasolina entre seus mestres. Gasolina foi morto durante a perseguição de Pedrito (~1925).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Gasolina (Santo Amaro mestres)
-- Note: Using trained_under because Cobrinha Verde said "My true mestre was Besouro,
-- but I learned from many mestres in Santo Amaro" - Besouro was student_of, others trained_under
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
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde interview: "My true mestre was Besouro, but I learned from many mestres in Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina..." (Capoeira Online, La Laue, Capoeira Connection)',
  E'Cobrinha Verde learned from Gasolina as part of his training with multiple Santo Amaro mestres after Besouro''s death in 1924. Training ended with Gasolina''s death during Pedrito persecution.',
  E'Cobrinha Verde aprendeu com Gasolina como parte de seu treinamento com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Treinamento terminou com a morte de Gasolina durante perseguição de Pedrito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gasolina associated_with Besouro Mangangá (contemporaries in Santo Amaro)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both active in Santo Amaro da Purificação during the same era; both part of the group of mestres who taught Cobrinha Verde"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony naming both as Santo Amaro mestres of his generation',
  'Both were part of the Santo Amaro capoeira community during Besouro''s active years. Gasolina was among the mestres who continued teaching after Besouro''s death.',
  'Ambos faziam parte da comunidade de capoeira de Santo Amaro durante os anos ativos de Besouro. Gasolina estava entre os mestres que continuaram ensinando após a morte de Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gasolina associated_with Siri de Mangue (contemporaries in Santo Amaro)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Both listed by Cobrinha Verde as Santo Amaro mestres from whom he learned capoeira"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens..."',
  'Both were part of the Santo Amaro capoeira teaching circle that trained Cobrinha Verde after Besouro''s death.',
  'Ambos faziam parte do círculo de ensino de capoeira de Santo Amaro que treinou Cobrinha Verde após a morte de Besouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gasolina associated_with Doze Homens (contemporaries; both Pedrito victims)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Both listed as Santo Amaro mestres who taught Cobrinha Verde; both killed during Pedrito persecution (1920-1926)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony (Santo Amaro mestres); Onça Preta testimony (Pedrito victims)',
  'Both were Santo Amaro capoeiristas who taught Cobrinha Verde and were killed during Pedrito''s persecution of capoeira.',
  'Ambos eram capoeiristas de Santo Amaro que ensinaram Cobrinha Verde e foram mortos durante a perseguição de Pedrito à capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gasolina associated_with Neco Canário Pardo (contemporaries in Santo Amaro)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Both listed by Cobrinha Verde as Santo Amaro mestres from whom he learned capoeira"}'::jsonb,
  'likely'::genealogy.confidence,
  'Cobrinha Verde testimony: "...Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo"',
  'Both were part of the Santo Amaro capoeira teaching circle that trained Cobrinha Verde.',
  'Ambos faziam parte do círculo de ensino de capoeira de Santo Amaro que treinou Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gasolina' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/gasolina.sql',
  NULL,
  ARRAY['persons/cobrinha-verde.sql', 'persons/besouro-manganga.sql', 'persons/onca-preta.sql', 'persons/siri-de-mangue.sql', 'persons/doze-homens.sql', 'persons/neco-canario-pardo.sql'],
  'Gasolina - capoeira teacher from Santo Amaro and Salvador; taught Cobrinha Verde and Onça Preta; killed during Pedrito persecution (~1925)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
