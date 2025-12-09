-- ============================================================
-- GENEALOGY PERSON IMPORT: Siri de Mangue
-- Generated: 2025-12-09
-- Primary Sources:
--   - https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-siri-de-mangue
--   - https://biriba.io/en/songs/38 (ladainha lyrics and context)
--   - https://velhosmestres.com/en/cobrinha-1924
--   - https://portalcapoeira.com/capoeira/cronicas-da-capoeiragem/historias-do-reconcavo/
--   - https://4capoeirathoughts.wordpress.com/2009/10/17/mestre-waldemar-da-paixao/
--   - Documentary: "Memórias do Recôncavo: Besouro e Outros Capoeiras" (2008), dir. Pedro Abib
-- ============================================================
-- DEPENDENCIES: persons/besouro-manganga.sql, persons/cobrinha-verde.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1880, decade precision):
-- Siri de Mangue was a training companion of Besouro Mangangá (b. 1895) and also
-- taught Cobrinha Verde (b. 1912). Cobrinha Verde's training with multiple Santo
-- Amaro mestres began after Besouro's death in 1924, when Cobrinha was 12. If
-- Siri was teaching in the 1920s-1930s and was peer/contemporary of Besouro, he
-- was likely 5-15 years older than Besouro. He also taught Mestre Waldemar starting
-- in 1936 when Waldemar was 20. If Siri was still teaching at 50-60 years old in
-- 1936, that places his birth around 1876-1886. Using 1880 as midpoint estimate.
--
-- DEATH: Unknown. No records found. Last documented activity: teaching Mestre
-- Waldemar around 1936.
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
  NULL, -- Full name unknown; known only by apelido
  'Siri de Mangue',
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  '[{"type": "website", "url": "https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-siri-de-mangue"}, {"type": "website", "url": "https://biriba.io/en/songs/38"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. His style would have been the undifferentiated capoeira of the Recôncavo.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão Angola/Regional. Seu estilo seria a capoeira indiferenciada do Recôncavo.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Recôncavo Baiano, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Siri de Mangue was a saveirista—a boatman who worked the traditional sailing vessels that transported agricultural goods along the Rio Subaé and other waterways of the Recôncavo Baiano. The rivers of the Recôncavo, particularly the Rio Subaé, carried all the agricultural production from the Cachoeira and Maragogipe regions to Salvador. The men who guided these small boats lived their lives by the rhythm of the tides, and many of them were capoeiristas. Among them, Siri de Mangue was said to be one of the most renowned in the art of capoeiragem, though no one knew his real name.

His apelido—"mangrove crab"—was suggestive of his profession. Like the siri crab that thrives in the brackish waters where rivers meet the sea, he navigated the liminal spaces between land and water, city and countryside. The life of a saveirista was hard and required toughness, and the capoeira practiced by these river workers had a practical edge.

Siri de Mangue belonged to the circle of capoeiristas around Besouro Mangangá in Santo Amaro da Purificação. Multiple sources describe them as training companions who met on Sundays and holidays to play capoeira. Paulo Barroquinha, Canário Pardo, and Maria Doze Homens were also part of this group—described by some as "a gang of capoeira resistance fighters who trained together on Sundays and could always be relied upon to back one another up."

Some sources describe Siri de Mangue as both a training companion and a student of Besouro. After Besouro''s death in 1924, his legacy lived on through several disciples, and Siri de Mangue is consistently listed among them alongside Cobrinha Verde.

What makes Siri de Mangue especially significant is his role as a teacher. Mestre Cobrinha Verde learned from him along with the other great capoeiristas of Santo Amaro—Maitá, Licurí, Joité, Dendê, Gasolina, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, and Neco Canário Pardo. More crucially, he was one of the teachers of Mestre Waldemar da Paixão, who stated plainly: "My name is Waldemar Rodrigues da Paixão, I was born in 1916, I learned Capoeira from Siri de Mangue, Canário Pardo, Calabi de Periperi... I took four years learning, in 1940 I was teaching on Pero Vaz."

This places Siri de Mangue as a critical link in the capoeira lineage—a bridge between the legendary era of Besouro and the documented traditions that Waldemar would preserve at his famous Barracão. Through Waldemar''s students and through those influenced by Cobrinha Verde, the teachings of this anonymous boatman continue to shape capoeira today.

The traditional ladainha "Abre os olhos Siri de Mangue" celebrates his memory: "Open your eyes, Siri de Mangue / Not every time is the same / See that the March tide / Is the guaiamum tide / Between big and small / Today not one escapes me / Siri is going crazy / In the grasp of the guaiamum." The song plays on the metaphor of the mangrove crab caught by the larger guaiamum crab—perhaps a warning about alertness, perhaps a tribute to a man who knew the dangers of both the tides and the streets.',
  -- bio_pt
  E'Siri de Mangue era um saveirista—um barqueiro que trabalhava nos veleiros tradicionais que transportavam produtos agrícolas pelo Rio Subaé e outras vias navegáveis do Recôncavo Baiano. Pelos rios da região do Recôncavo, principalmente pelo Rio Subaé, escoava toda a produção agrícola da região de Cachoeira e Maragogipe para Salvador. Os homens que guiavam essas pequenas embarcações viviam suas vidas pelo ritmo das marés, e muitos deles eram capoeiristas. Entre eles, Siri de Mangue era considerado um dos mais renomados na arte da capoeiragem, embora ninguém soubesse seu nome verdadeiro.

Seu apelido—"caranguejo do mangue"—era sugestivo de sua profissão. Como o siri que vive nas águas salobras onde os rios encontram o mar, ele navegava os espaços liminares entre terra e água, cidade e campo. A vida de saveirista era dura e exigia resistência, e a capoeira praticada por esses trabalhadores do rio tinha uma vantagem prática.

Siri de Mangue pertencia ao círculo de capoeiristas em torno de Besouro Mangangá em Santo Amaro da Purificação. Múltiplas fontes os descrevem como companheiros de treino que se encontravam aos domingos e feriados para jogar capoeira. Paulo Barroquinha, Canário Pardo e Maria Doze Homens também faziam parte desse grupo—descrito por alguns como "uma gangue de lutadores de resistência da capoeira que treinavam juntos aos domingos e sempre podiam contar uns com os outros."

Algumas fontes descrevem Siri de Mangue tanto como companheiro de treino quanto como aluno de Besouro. Após a morte de Besouro em 1924, seu legado continuou através de vários discípulos, e Siri de Mangue é consistentemente listado entre eles ao lado de Cobrinha Verde.

O que torna Siri de Mangue especialmente significativo é seu papel como professor. Mestre Cobrinha Verde aprendeu com ele junto com os outros grandes capoeiristas de Santo Amaro—Maitá, Licurí, Joité, Dendê, Gasolina, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso e Neco Canário Pardo. Mais crucialmente, ele foi um dos professores de Mestre Waldemar da Paixão, que declarou claramente: "Meu nome é Waldemar Rodrigues da Paixão, nasci em 1916, aprendi Capoeira com Siri de Mangue, Canário Pardo, Calabi de Periperi... Levei quatro anos aprendendo, em 1940 estava ensinando na Pero Vaz."

Isso coloca Siri de Mangue como um elo crítico na linhagem da capoeira—uma ponte entre a era lendária de Besouro e as tradições documentadas que Waldemar preservaria em seu famoso Barracão. Através dos alunos de Waldemar e daqueles influenciados por Cobrinha Verde, os ensinamentos deste barqueiro anônimo continuam a moldar a capoeira hoje.

A tradicional ladainha "Abre os olhos Siri de Mangue" celebra sua memória: "Abre os olhos Siri de Mangue / Todo tempo não é um / Veja que a maré de março / É maré de guaiamum / Entre grandes e pequenos / Hoje não me escapa um / Siri tá se vendo doido / Na presa do guaiamu." A música joga com a metáfora do siri do mangue capturado pelo guaiamum maior—talvez um aviso sobre vigilância, talvez um tributo a um homem que conhecia os perigos tanto das marés quanto das ruas.',
  -- achievements_en
  'Training companion of Besouro Mangangá; teacher of Mestre Cobrinha Verde and Mestre Waldemar da Paixão; honored in the traditional ladainha "Abre os olhos Siri de Mangue"; documentary subject in "Memórias do Recôncavo" (2008)',
  -- achievements_pt
  'Companheiro de treino de Besouro Mangangá; professor de Mestre Cobrinha Verde e Mestre Waldemar da Paixão; homenageado na ladainha tradicional "Abre os olhos Siri de Mangue"; tema do documentário "Memórias do Recôncavo" (2008)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1880, decade precision): Siri de Mangue was a training companion of Besouro Mangangá (b. 1895) and taught both Cobrinha Verde (b. 1912) and Mestre Waldemar (b. 1916, started learning from Siri around 1936). If he was peer/slightly older than Besouro and still teaching in 1936 at age 50-60, birth estimate is ~1876-1886. Using 1880 as midpoint.

DEATH: Unknown. No records of his death have been found.

NAME: Full name unknown. Known only by his apelido "Siri de Mangue" (mangrove crab), which references his occupation as a saveirista (boatman) on the rivers of the Recôncavo.

OCCUPATION: Saveirista - transported agricultural goods by boat on the Rio Subaé and other waterways between the Recôncavo interior and Salvador.

SONG CONFUSION: The ladainha mentions both "Siri de Mangue" and "Siri de Coroa" as separate figures. One version of the song references Gamboa (Rio de Janeiro), suggesting possible conflation with a Rio capoeirista. Our subject is the Bahian Siri de Mangue from the Recôncavo.

PENDING RELATIONSHIPS (require SQL imports):
- Mestre Waldemar: student_of Siri de Mangue (~1936-1940)

ACTIVE RELATIONSHIPS (entities already imported):
- Besouro Mangangá: associated_with as training companions
- Cobrinha Verde: student_of Siri de Mangue (post-1924)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década): Siri de Mangue era companheiro de treino de Besouro Mangangá (n. 1895) e ensinou tanto Cobrinha Verde (n. 1912) quanto Mestre Waldemar (n. 1916, começou a aprender com Siri por volta de 1936). Se era par/ligeiramente mais velho que Besouro e ainda ensinando em 1936 aos 50-60 anos, estimativa de nascimento é ~1876-1886. Usando 1880 como ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Nome completo desconhecido. Conhecido apenas por seu apelido "Siri de Mangue" (caranguejo do mangue), que referencia sua ocupação como saveirista (barqueiro) nos rios do Recôncavo.

OCUPAÇÃO: Saveirista - transportava produtos agrícolas de barco no Rio Subaé e outras vias navegáveis entre o interior do Recôncavo e Salvador.

CONFUSÃO DA MÚSICA: A ladainha menciona tanto "Siri de Mangue" quanto "Siri de Coroa" como figuras separadas. Uma versão da música referencia Gamboa (Rio de Janeiro), sugerindo possível confusão com um capoeirista carioca. Nosso sujeito é o Siri de Mangue baiano do Recôncavo.

RELACIONAMENTOS PENDENTES (requerem importações SQL):
- Mestre Waldemar: student_of Siri de Mangue (~1936-1940)

RELACIONAMENTOS ATIVOS (entidades já importadas):
- Besouro Mangangá: associated_with como companheiros de treino
- Cobrinha Verde: student_of Siri de Mangue (pós-1924)'
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

-- Siri de Mangue associated_with Besouro Mangangá (training companions)
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
  '{"association_context": "Training companions in Santo Amaro; part of Besouro''s circle that met on Sundays and holidays to play capoeira. Some sources also describe Siri as a student of Besouro."}'::jsonb,
  'likely'::genealogy.confidence,
  'Papoeira.com, Capoeira Fandom Wiki, multiple sources describe them as training companions',
  'Part of Besouro''s circle of capoeiristas in Santo Amaro that included Paulo Barroquinha, Canário Pardo, and Maria Doze Homens. Described as "a gang of capoeira resistance fighters."',
  'Parte do círculo de capoeiristas de Besouro em Santo Amaro que incluía Paulo Barroquinha, Canário Pardo e Maria Doze Homens. Descrito como "uma gangue de lutadores de resistência da capoeira."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Siri de Mangue' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde was student_of Siri de Mangue
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
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo, Lalaue - multiple sources confirm Siri de Mangue as one of Cobrinha Verde''s teachers',
  'Cobrinha Verde learned from multiple Santo Amaro mestres after Besouro''s death in 1924. Siri de Mangue was among them alongside Maitá, Licurí, Joité, Dendê, and others.',
  'Cobrinha Verde aprendeu com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Siri de Mangue estava entre eles junto com Maitá, Licurí, Joité, Dendê e outros.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Mestre Waldemar relationship pending - requires Waldemar SQL import
-- Waldemar learned from Siri de Mangue starting ~1936; stated this in interviews

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/siri-de-mangue.sql',
  NULL,
  ARRAY['persons/besouro-manganga.sql', 'persons/cobrinha-verde.sql'],
  'Siri de Mangue - saveirista (boatman) and capoeirista from the Recôncavo; training companion of Besouro; teacher of Cobrinha Verde and Mestre Waldemar'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
