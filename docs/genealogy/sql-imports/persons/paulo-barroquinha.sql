-- ============================================================
-- GENEALOGY PERSON IMPORT: Paulo Barroquinha
-- Generated: 2025-12-09
-- Primary Sources:
--   - https://velhosmestres.com/br/besouro
--   - https://velhosmestres.com/en/besouro
--   - https://papoeira.com/en/who-was-besouro-preto-de-manganga/
--   - https://capoeira.online/history/mestres/besouro-manganga/
--   - https://esquiva.wordpress.com/mestres/mestre-aberre/
--   - https://velhosmestres.com/br/destaques-2
--   - Antonio Liberac Cardoso Simões Pires research on Besouro Mangangá
-- ============================================================
-- DEPENDENCIES: persons/besouro-manganga.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Paulo Barroquinha was a companion of Besouro Mangangá (b. 1895, d. 1924) at
-- Trapiche de Baixo in Santo Amaro. If he was a peer (similar age to Besouro or
-- slightly older), he was likely born around 1885-1900.
--
-- A "Pedro Paulo Barroquinha" also appears in Canjiquinha's testimony about the
-- Matatu Preto training group in Salvador (1930s), alongside Aberrê, Onça Preta,
-- and others. If this is the same person, it suggests he was active from the
-- 1910s through at least the 1930s. If born ~1890, he would have been:
--   - ~20-34 years old during Besouro's prime (1910-1924)
--   - ~40-50 years old at Matatu Preto sessions (1930s)
--
-- Using 1890 as estimate with decade precision.
--
-- DEATH: Unknown. No records of his death have been found.
--
-- NAME VARIATION: May also have been known as "Pedro Paulo Barroquinha"
-- (per Canjiquinha's testimony about Matatu Preto, Salvador). Unclear if
-- this is the same person or a different individual.
--
-- APELIDO MEANING: "Barroquinha" is the diminutive of "barroca" - meaning
-- a small gully, ravine, or hole caused by erosion. It's also associated
-- with the Ladeira da Barroquinha neighborhood in Salvador's historic center,
-- an important Afro-Brazilian cultural site. The name may indicate his origin
-- from such a place or a physical characteristic.
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; possibly "Pedro Paulo" based on Canjiquinha testimony
  'Paulo Barroquinha',
  NULL, -- No formal title in his era
  NULL, -- No portrait available
  '[{"type": "website", "url": "https://velhosmestres.com/br/besouro"}, {"type": "website", "url": "https://papoeira.com/en/who-was-besouro-preto-de-manganga/"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. The capoeira of Trapiche de Baixo was practical and street-oriented.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão Angola/Regional. A capoeira do Trapiche de Baixo era prática e voltada para a rua.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Trapiche de Baixo, Santo Amaro da Purificação, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Paulo Barroquinha was one of the capoeiristas who formed the legendary circle around Besouro Mangangá in Santo Amaro da Purificação during the early 20th century. According to José Brigido Dorneles Antunes, who knew Besouro personally and reported to historian Antonio Liberac Cardoso Simões Pires, Paulo Barroquinha was among Besouro''s closest companions: "His companions were: Paulo Barroquinha, Boca de Siri, Doze Homens, Noca de Jacó and Canário Pardo. They all lived in the area of Trapiche de Baixo."

Trapiche de Baixo was the poorest neighborhood of Santo Amaro, a place where African cultural traditions persisted despite the 1890 penal code that criminalized both capoeira and Candomblé. It was here, in the shadow of the sugar mills and along the banks of the Subaé River, that a community of capoeiristas trained together, played together, and protected each other.

According to Professor Leiteiro, these companions "were with him in the memorable capoeira rodas that hypnotized anybody that would go by." Multiple sources describe this group as "a gang of capoeira resistance fighters who trained together on Sundays and could always be relied upon to back one another up." Besouro''s circle also included Siri de Mangue and Maria Doze Homens—a rare female capoeirista whose name suggests she had the strength of twelve men.

Nothing else is recorded about Paulo Barroquinha''s life—not his trade, not his family, not his fate after Besouro''s assassination in 1924. Like many capoeiristas of the pre-modern era, he exists in history primarily through his association with a legendary figure, a name in a list of companions who together represented an underground tradition of resistance and cultural preservation.

A capoeirista named "Pedro Paulo Barroquinha" also appears in Mestre Canjiquinha''s testimony about the Sunday training sessions at Matatu Preto in Salvador during the 1930s. Canjiquinha recalled: "On Sundays, all those capoeiristas would come—Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, the late Barboza, and this citizen called Antonio Raimundo, nicknamed by all Aberrê." Whether this is the same person who moved from Santo Amaro to Salvador after Besouro''s death, or a different individual with a similar name, remains unclear.',
  -- bio_pt
  E'Paulo Barroquinha foi um dos capoeiristas que formaram o lendário círculo em torno de Besouro Mangangá em Santo Amaro da Purificação no início do século XX. Segundo José Brigido Dorneles Antunes, que conheceu Besouro pessoalmente e relatou ao historiador Antonio Liberac Cardoso Simões Pires, Paulo Barroquinha estava entre os companheiros mais próximos de Besouro: "Seus companheiros eram: Paulo Barroquinha, Boca de Siri, Doze Homens, Noca de Jacó e Canário Pardo. Todos moravam na área do Trapiche de Baixo."

Trapiche de Baixo era o bairro mais pobre de Santo Amaro, um lugar onde as tradições culturais africanas persistiam apesar do código penal de 1890 que criminalizava tanto a capoeira quanto o Candomblé. Era ali, à sombra dos engenhos de açúcar e às margens do Rio Subaé, que uma comunidade de capoeiristas treinava juntos, jogava juntos e se protegiam mutuamente.

Segundo o Professor Leiteiro, esses companheiros "eram com ele nas memoráveis rodas de capoeira que hipnotizavam quem quer que passasse." Múltiplas fontes descrevem esse grupo como "uma gangue de lutadores de resistência da capoeira que treinavam juntos aos domingos e sempre podiam contar uns com os outros." O círculo de Besouro também incluía Siri de Mangue e Maria Doze Homens—uma rara capoeirista mulher cujo nome sugere que ela tinha a força de doze homens.

Nada mais foi registrado sobre a vida de Paulo Barroquinha—nem seu ofício, nem sua família, nem seu destino após o assassinato de Besouro em 1924. Como muitos capoeiristas da era pré-moderna, ele existe na história principalmente através de sua associação com uma figura lendária, um nome em uma lista de companheiros que juntos representavam uma tradição clandestina de resistência e preservação cultural.

Um capoeirista chamado "Pedro Paulo Barroquinha" também aparece no testemunho de Mestre Canjiquinha sobre as sessões de treino de domingo no Matatu Preto em Salvador durante os anos 1930. Canjiquinha lembrou: "Aos domingos, vinham todos aqueles capoeiristas—Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, o finado Barboza e esse cidadão chamado Antonio Raimundo, apelidado por todos Aberrê." Se este é a mesma pessoa que se mudou de Santo Amaro para Salvador após a morte de Besouro, ou um indivíduo diferente com nome semelhante, permanece incerto.',
  -- achievements_en
  'Training companion of Besouro Mangangá at Trapiche de Baixo; member of the legendary Sunday capoeira circle in Santo Amaro; recognized as one of the "timeless figures of the Recôncavo" alongside Boca de Siri, Doze Homens, Noca de Jacó, and Canário Pardo',
  -- achievements_pt
  'Companheiro de treino de Besouro Mangangá no Trapiche de Baixo; membro do lendário círculo de capoeira de domingo em Santo Amaro; reconhecido como uma das "figuras atemporais do Recôncavo" ao lado de Boca de Siri, Doze Homens, Noca de Jacó e Canário Pardo',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Paulo Barroquinha was a companion of Besouro Mangangá (b. 1895, d. 1924) at Trapiche de Baixo in Santo Amaro. If he was a peer (similar age), he was likely born around 1885-1900. If the "Pedro Paulo Barroquinha" at Matatu Preto (1930s Salvador) is the same person, he would have been active for 20+ years, suggesting birth ~1890. Using 1890 as midpoint estimate.

DEATH: Unknown. No records of his death have been found.

NAME VARIATION: May also be known as "Pedro Paulo Barroquinha" per Canjiquinha''s testimony about Matatu Preto. Unclear if same person or different individual.

APELIDO MEANING: "Barroquinha" = diminutive of "barroca" (ravine/gully from erosion). Also the name of a historic neighborhood in Salvador. May indicate origin or physical characteristic.

PRIMARY SOURCE: José Brigido Dorneles Antunes (contemporary who knew Besouro) reported to historian Antonio Liberac Cardoso Simões Pires.

TWO POSSIBLE CONTEXTS:
1. Santo Amaro (1910s-1924): Companion of Besouro at Trapiche de Baixo with Boca de Siri, Noca de Jacó, Doze Homens, Canário Pardo
2. Salvador (1930s): "Pedro Paulo Barroquinha" at Matatu Preto with Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços

POSSIBLE RECONCILIATION: After Besouro''s death in 1924, many capoeiristas from Santo Amaro moved to Salvador. Paulo Barroquinha may have been among them, later appearing at the Matatu Preto training sessions.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Paulo Barroquinha era companheiro de Besouro Mangangá (n. 1895, m. 1924) no Trapiche de Baixo em Santo Amaro. Se era um par (idade similar), provavelmente nasceu por volta de 1885-1900. Se o "Pedro Paulo Barroquinha" do Matatu Preto (Salvador anos 1930) é a mesma pessoa, ele teria sido ativo por 20+ anos, sugerindo nascimento ~1890. Usando 1890 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

VARIAÇÃO DE NOME: Pode também ser conhecido como "Pedro Paulo Barroquinha" conforme testemunho de Canjiquinha sobre o Matatu Preto. Incerto se é a mesma pessoa ou indivíduo diferente.

SIGNIFICADO DO APELIDO: "Barroquinha" = diminutivo de "barroca" (ravina/vala de erosão). Também nome de um bairro histórico em Salvador. Pode indicar origem ou característica física.

FONTE PRIMÁRIA: José Brigido Dorneles Antunes (contemporâneo que conheceu Besouro) relatou ao historiador Antonio Liberac Cardoso Simões Pires.

DOIS POSSÍVEIS CONTEXTOS:
1. Santo Amaro (1910s-1924): Companheiro de Besouro no Trapiche de Baixo com Boca de Siri, Noca de Jacó, Doze Homens, Canário Pardo
2. Salvador (anos 1930): "Pedro Paulo Barroquinha" no Matatu Preto com Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços

POSSÍVEL RECONCILIAÇÃO: Após a morte de Besouro em 1924, muitos capoeiristas de Santo Amaro se mudaram para Salvador. Paulo Barroquinha pode ter sido um deles, aparecendo posteriormente nas sessões de treino do Matatu Preto.'
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

-- --- Person-to-Person: Training & Lineage ---

-- Paulo Barroquinha associated_with Besouro Mangangá (training companions)
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
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Training companions at Trapiche de Baixo, Santo Amaro. Part of Besouro''s circle that met on Sundays and holidays to play capoeira. Described as a gang of capoeira resistance fighters who could always be relied upon to back one another up."}'::jsonb,
  'verified'::genealogy.confidence,
  'José Brigido Dorneles Antunes (via Antonio Liberac); Velhos Mestres; Papoeira.com; Professor Leiteiro',
  'Part of Besouro''s inner circle alongside Boca de Siri, Noca de Jacó, Doze Homens, and Canário Pardo. All were residents of Trapiche de Baixo, the poorest neighborhood of Santo Amaro.',
  'Parte do círculo íntimo de Besouro ao lado de Boca de Siri, Noca de Jacó, Doze Homens e Canário Pardo. Todos eram moradores do Trapiche de Baixo, o bairro mais pobre de Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Barroquinha' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Barroquinha associated_with Siri de Mangue (training companions)
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
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of Besouro Mangangá''s training circle at Trapiche de Baixo, Santo Amaro. Trained together on Sundays and holidays."}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources list both as training companions of Besouro at Trapiche de Baixo',
  'Fellow members of Besouro''s Sunday training circle in Santo Amaro.',
  'Companheiros do círculo de treino de domingo de Besouro em Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Barroquinha' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo Barroquinha associated_with Neco Canário Pardo (training companions)
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
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of Besouro Mangangá''s training circle at Trapiche de Baixo, Santo Amaro. José Brigido Dorneles Antunes listed both as Besouro''s companions."}'::jsonb,
  'verified'::genealogy.confidence,
  'José Brigido Dorneles Antunes (via Antonio Liberac); Professor Leiteiro',
  'Fellow members of Besouro''s circle alongside Boca de Siri, Noca de Jacó, and Doze Homens.',
  'Companheiros do círculo de Besouro ao lado de Boca de Siri, Noca de Jacó e Doze Homens.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Barroquinha' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Relationships with Boca de Siri, Noca de Jacó, Doze Homens pending - require their SQL imports

-- ============================================================
-- SALVADOR MATATU PRETO RELATIONSHIPS (1930s)
-- These assume Paulo Barroquinha = Pedro Paulo Barroquinha (likely same person)
-- ============================================================

-- Paulo Barroquinha associated_with Onça Preta (Matatu Preto training companions)
-- NOTE: Assessment is "likely" same person based on: name pattern (Pedro Paulo → Paulo),
-- timeline (Santo Amaro 1910s-1924, Salvador 1930s), migration pattern (many Santo Amaro
-- capoeiristas moved to Salvador after Besouro's death), and rare apelido occurrence.
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
  '1930-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both trained at Matatu Preto, Salvador, in the 1930s. Part of the Sunday training group around Mestre Aberrê. Identity based on assessment that Paulo Barroquinha (Santo Amaro) and Pedro Paulo Barroquinha (Salvador) are the same person."}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); Velhos Mestres; Esquiva Wordpress',
  'IF Paulo Barroquinha = Pedro Paulo Barroquinha: Both were part of the Matatu Preto Sunday training group in the 1930s with Aberrê, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, and Barboza.',
  'SE Paulo Barroquinha = Pedro Paulo Barroquinha: Ambos faziam parte do grupo de treino de domingo no Matatu Preto nos anos 1930 com Aberrê, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços e Barboza.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Barroquinha' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Additional Matatu Preto relationships pending - require imports of:
-- - Geraldo Chapeleiro
-- - Totonho de Maré
-- - Creoni
-- - Chico Três Pedaços
-- - Barboza

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/paulo-barroquinha.sql',
  NULL,
  ARRAY['persons/besouro-manganga.sql', 'persons/siri-de-mangue.sql', 'persons/neco-canario-pardo.sql', 'persons/onca-preta.sql'],
  'Paulo Barroquinha - training companion of Besouro Mangangá at Trapiche de Baixo, Santo Amaro (1910s-1924); likely same person as Pedro Paulo Barroquinha at Matatu Preto, Salvador (1930s); one of the timeless figures of the Recôncavo'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
