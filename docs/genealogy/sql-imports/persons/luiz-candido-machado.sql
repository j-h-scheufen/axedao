-- ============================================================
-- GENEALOGY PERSON IMPORT: Luiz Cândido Machado
-- Generated: 2025-12-11
-- Primary Sources:
--   - https://papoeira.com/en/mestre-bimba-his-early-life-and-introduction-to-capoeira/
--   - https://nossa-tribo.com/what-is-batuque/
--   - https://capoeirawiki.org/wiki/Batuque
--   - https://www.martialnet.it/en/south-american-martial-arts/capoeira/great-masters-of-capoeira/mestre-bimba/
--   - http://antigo.acordacultura.org.br/herois/heroi/mestrebimba (via Google search snippet)
--   - https://capoeiraocec.webnode.com.br/a-arte-capoeira/mestre-bimba/
-- ============================================================
-- DEPENDENCIES: none
-- ============================================================
--
-- NOTE: Luiz Cândido Machado was the father of Mestre Bimba and a champion
-- of batuque, an extinct Afro-Brazilian combat sport of predominantly Angolan
-- origins. Sources describe him as "ex-escravizado" (formerly enslaved) and
-- of Bantu descent ("descendente de banto"). One source identifies him as
-- a "caboclo de Feira de Santana," suggesting mixed African-indigenous heritage.
--
-- BIRTH YEAR ESTIMATION (1860 with 'decade' precision):
-- No documented birth date. Estimation based on:
-- 1) Son Bimba born November 23, 1899
-- 2) Luiz was established as a batuque champion by the time Bimba was a child
-- 3) Slavery abolished in Brazil in 1888; if he was "ex-escravizado," he was
--    likely born before 1888
-- 4) If Luiz was 30-45 years old when Bimba was born (1899), birth = 1854-1869
-- 5) Using 1860 as midpoint estimate with decade precision
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
  'Luiz Cândido Machado',
  'Luiz Cândido Machado',
  NULL,
  NULL,
  '[]'::jsonb,
  -- Capoeira-specific
  NULL,
  E'Practitioner of batuque, an extinct Afro-Brazilian combat sport of predominantly Angolan origins. Batuque was a wrestling-like game played in Bahia where one player stood in the center in a defensive position while attackers attempted to knock them down using leg sweeps (rasteiras), hip strikes, and techniques such as rapa, baú, banda lisa, and encruzilhada. The game was played to berimbau, tambourine, scraper, and singing. Luiz Cândido was a local champion who taught batuque to his son Mestre Bimba.',
  E'Praticante de batuque, um esporte de combate afro-brasileiro extinto de origem predominantemente angolana. O batuque era um jogo semelhante à luta livre jogado na Bahia onde um jogador ficava no centro em posição defensiva enquanto atacantes tentavam derrubá-lo usando rasteiras, golpes de quadril e técnicas como rapa, baú, banda lisa e encruzilhada. O jogo era acompanhado por berimbau, pandeiro, reco-reco e canto. Luiz Cândido era um campeão local que ensinou batuque ao seu filho Mestre Bimba.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Feira de Santana, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Luiz Cândido Machado was a formerly enslaved man of Bantu descent who became a renowned champion of batuque in late 19th century Bahia. Sources describe him as a "caboclo de Feira de Santana" (a person of mixed African and indigenous heritage from the interior Bahian city of Feira de Santana), though other sources emphasize his Bantu African lineage.

Batuque was a combat game of predominantly Angolan origins that flourished in Bahia before becoming extinct in the early 20th century. The game was fought in circles, with one player defending a central position while attackers attempted to knock them down using sweeping techniques, hip strikes, and powerful leg movements. Edison Carneiro documented that batuque was played to berimbau, tambourine, scraper, and singing—sharing musical elements with capoeira. Techniques included rapa, baú, banda lisa, and encruzilhada.

By the time his son Manoel dos Reis Machado (Mestre Bimba) was born in 1899, Luiz Cândido was already celebrated at street festivals (festas de largo) as a "great batuqueiro" and a "champion of batuque." His reputation was such that he was known throughout Salvador''s black community.

Luiz Cândido taught batuque to his son Bimba. The young Bimba learned from his father and also observed his mother Maria Martinha do Bonfim, who was respected among batuqueiros and was said to be "boa de perna" (good with her legs).

In an interview documented by Waldeloir Rego in his 1968 book "Capoeira Angola: Ensaio Sócio-Etnográfico," Bimba himself stated that he drew upon batuque techniques when creating Capoeira Regional. When asked about his influences, Bimba replied (in Portuguese): "se valeu de golpes de Batuque, como Banda armada, Banda fechada, Encruzilhada, Rapa, Cruz de carreira e Baú" (that he made use of batuque strikes, such as Banda armada, Banda fechada, Encruzilhada, Rapa, Cruz de carreira and Baú). This provides direct evidence that Bimba consciously incorporated techniques from the batuque tradition his father had taught him.

Nestor Capoeira, in his writings on capoeira history, further argues that many of the rasteiras (leg sweeps) that distinguish Regional from Angola likely derive from batuque.

Little else is documented about Luiz Cândido''s life. The date of his death is unknown. What is certain is that he was a master of an extinct African-derived combat art, and that his son grew up observing and learning this tradition.',
  -- bio_pt
  E'Luiz Cândido Machado foi um homem ex-escravizado de ascendência banto que se tornou um renomado campeão de batuque na Bahia do final do século XIX. Fontes o descrevem como um "caboclo de Feira de Santana" (uma pessoa de herança mista africana e indígena da cidade do interior baiano de Feira de Santana), embora outras fontes enfatizem sua linhagem africana banto.

O batuque era um jogo de combate de origem predominantemente angolana que floresceu na Bahia antes de se extinguir no início do século XX. O jogo era lutado em círculos, com um jogador defendendo uma posição central enquanto atacantes tentavam derrubá-lo usando técnicas de rasteira, golpes de quadril e movimentos poderosos de pernas. Edison Carneiro documentou que o batuque era jogado ao som de berimbau, pandeiro, reco-reco e canto—compartilhando elementos musicais com a capoeira. As técnicas incluíam rapa, baú, banda lisa e encruzilhada.

Quando seu filho Manoel dos Reis Machado (Mestre Bimba) nasceu em 1899, Luiz Cândido já era celebrado nas festas de largo como um "grande batuqueiro" e "campeão de batuque." Sua reputação era tal que ele era conhecido em toda a comunidade negra de Salvador.

Luiz Cândido ensinou batuque ao seu filho Bimba. O jovem Bimba aprendeu com seu pai e também observou sua mãe Maria Martinha do Bonfim, que era respeitada entre os batuqueiros e era considerada "boa de perna."

Em uma entrevista documentada por Waldeloir Rego em seu livro de 1968 "Capoeira Angola: Ensaio Sócio-Etnográfico," o próprio Bimba afirmou que utilizou técnicas de batuque ao criar a Capoeira Regional. Quando perguntado sobre suas influências, Bimba respondeu: "se valeu de golpes de Batuque, como Banda armada, Banda fechada, Encruzilhada, Rapa, Cruz de carreira e Baú." Isso fornece evidência direta de que Bimba conscientemente incorporou técnicas da tradição de batuque que seu pai lhe ensinou.

Nestor Capoeira, em seus escritos sobre a história da capoeira, argumenta ainda que muitas das rasteiras que distinguem a Regional da Angola provavelmente derivam do batuque.

Pouco mais está documentado sobre a vida de Luiz Cândido. A data de sua morte é desconhecida. O que é certo é que ele foi um mestre de uma arte de combate extinta de origem africana, e que seu filho cresceu observando e aprendendo essa tradição.',
  -- achievements_en
  E'Champion of batuque in late 19th century Bahia; Celebrated at street festivals (festas de largo) as a "great batuqueiro"; Taught batuque to his son Mestre Bimba, who explicitly credited these techniques as influences on Capoeira Regional',
  -- achievements_pt
  E'Campeão de batuque na Bahia do final do século XIX; Celebrado nas festas de largo como um "grande batuqueiro"; Ensinou batuque ao seu filho Mestre Bimba, que explicitamente creditou essas técnicas como influências na Capoeira Regional',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1860, decade precision):
No documented birth date. Son Mestre Bimba was born November 23, 1899. If Luiz was 30-45 when Bimba was born, he was born approximately 1854-1869. Using 1860 as midpoint estimate.

ENSLAVED STATUS:
One source (Acorda Cultura / Fundação Cultural Palmares) explicitly describes him as "ex-escravizado, descendente de banto" (formerly enslaved, of Bantu descent). Slavery was abolished in Brazil in 1888.

BIRTHPLACE CONFLICT:
One source (martialnet.it) states he was a "caboclo de Feira de Santana" (person of mixed heritage from Feira de Santana). This conflicts with the "descendente de banto" description. Both may be accurate if "caboclo" refers to cultural/geographic identity rather than strictly racial. Using Feira de Santana as birthplace per available sources.

NAME VARIANT:
One source (madrugacapoeira.webnode.page) gives his name as "Luiz Cândido Xavier" instead of "Machado." This appears to be an error; all other sources use "Machado."

DEATH:
Unknown. No records of his death have been found.

FAMILY:
- Wife/Partner: Maria Martinha do Bonfim (from Cachoeira, Bahia; also respected among batuqueiros)
- Son: Manoel dos Reis Machado (Mestre Bimba, 1899-1974)

RELATIONSHIP TO BIMBA:
The backlog notes two predicates:
1. Bimba trained_under Luiz Cândido Machado with properties {"discipline": "batuque"}
2. Bimba family_of Luiz Cândido Machado with properties {"relationship_type": "parent"}',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1860, precisão de década):
Nenhuma data de nascimento documentada. Filho Mestre Bimba nasceu em 23 de novembro de 1899. Se Luiz tinha 30-45 anos quando Bimba nasceu, ele nasceu aproximadamente entre 1854-1869. Usando 1860 como estimativa do ponto médio.

STATUS DE ESCRAVIZADO:
Uma fonte (Acorda Cultura / Fundação Cultural Palmares) o descreve explicitamente como "ex-escravizado, descendente de banto." A escravidão foi abolida no Brasil em 1888.

CONFLITO DE LOCAL DE NASCIMENTO:
Uma fonte (martialnet.it) afirma que ele era um "caboclo de Feira de Santana." Isso conflita com a descrição de "descendente de banto." Ambos podem estar corretos se "caboclo" se refere à identidade cultural/geográfica em vez de estritamente racial. Usando Feira de Santana como local de nascimento conforme fontes disponíveis.

VARIANTE DO NOME:
Uma fonte (madrugacapoeira.webnode.page) dá seu nome como "Luiz Cândido Xavier" em vez de "Machado." Isso parece ser um erro; todas as outras fontes usam "Machado."

MORTE:
Desconhecida. Nenhum registro de sua morte foi encontrado.

FAMÍLIA:
- Esposa/Companheira: Maria Martinha do Bonfim (de Cachoeira, Bahia; também respeitada entre os batuqueiros)
- Filho: Manoel dos Reis Machado (Mestre Bimba, 1899-1974)

RELACIONAMENTO COM BIMBA:
O backlog nota dois predicados:
1. Bimba trained_under Luiz Cândido Machado com propriedades {"discipline": "batuque"}
2. Bimba family_of Luiz Cândido Machado com propriedades {"relationship_type": "parent"}'
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
-- Only generate for entities that EXIST in our dataset
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- Mestre Bimba trained_under Luiz Cândido Machado (batuque)
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
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"discipline": "batuque"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; Bimba credited father for batuque training; Waldeloir Rego 1968',
  'Bimba learned batuque techniques from his father, who was a champion of this combat sport. These techniques (banda armada, banda fechada, encruzilhada, rapa, cruz de carreira, baú) were later incorporated into Capoeira Regional.',
  'Bimba aprendeu técnicas de batuque de seu pai, que era campeão deste esporte de combate. Essas técnicas (banda armada, banda fechada, encruzilhada, rapa, cruz de carreira, baú) foram posteriormente incorporadas à Capoeira Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Luiz Cândido Machado'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Family ---

-- Mestre Bimba family_of Luiz Cândido Machado (son-father relationship)
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
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1899-11-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "parent"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; universally documented as Bimba''s father',
  'Luiz Cândido Machado was Mestre Bimba''s father. Bimba was born November 23, 1899.',
  'Luiz Cândido Machado foi o pai de Mestre Bimba. Bimba nasceu em 23 de novembro de 1899.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Luiz Cândido Machado'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (require future imports)
-- ============================================================
-- The following relationships cannot be generated yet because
-- the objects do not exist in our dataset:
--
-- FAMILY:
-- - Luiz Cândido Machado family_of Maria Martinha do Bonfim (spouse/partner)
--   Note: Maria is mentioned as also being respected among batuqueiros
--         and being "boa de perna" (good with her legs)
--
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/luiz-candido-machado.sql',
  NULL,
  ARRAY['persons/bimba.sql'],
  'Father of Mestre Bimba; champion of batuque; formerly enslaved person of Bantu descent; his batuque techniques became foundational to Capoeira Regional'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
