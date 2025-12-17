-- ============================================================
-- GENEALOGY PERSON: José Bidel
-- Generated: 2025-12-16
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
  'José Bidel dos Santos',
  'José Bidel',
  NULL, -- Layer Zero proto-capoeirista; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira of the Recôncavo before the Angola/Regional split. Trained with companions of Besouro Mangangá including Siri de Mangue and Neco Canário Pardo.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana do Recôncavo antes da divisão Angola/Regional. Treinou com companheiros de Besouro Mangangá incluindo Siri de Mangue e Neco Canário Pardo.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'José Bidel dos Santos was a crabber from São Francisco do Conde in the Recôncavo Baiano. He made his living harvesting crabs from the mangrove estuaries of the Recôncavo, hard work that required intimate knowledge of the tides and marshlands. Like many working men of his generation in the Recôncavo, José Bidel practiced capoeira.

Along with his brother Dendê, José Bidel belonged to the network of capoeiristas connected to Besouro Mangangá and his companions in Santo Amaro. The two brothers associated with some of the most renowned capoeiristas of the early 20th century Recôncavo—Siri de Mangue, who worked as a saveirista (boatman) on the rivers, and Neco Canário Pardo, who taught machete fighting as well as capoeira. According to José Bidel''s son Mário, Besouro himself even visited their house, though this would have been before Mário was born, as Besouro was killed in 1924.

What we know of José Bidel comes primarily from the testimony of his son, Mário dos Santos, who would become known as Mestre Mário Buscapé. Mário describes learning capoeira beginning at age eight in improvised rodas in their family''s backyard. His uncle Dendê was his first teacher, but his father José Bidel also trained him in the art. The lineage that Mário learned—passed down from Besouro through his companions to Dendê and José Bidel—would eventually reach Rio de Janeiro, where Mário would become one of four founding figures of contemporary capoeira in that city.

José Bidel represents a critical link in capoeira history: a Layer Zero figure from the generation that knew Besouro''s companions directly, who preserved the traditional capoeira of the Recôncavo and transmitted it to the next generation before the formal codification of styles. Through his son''s teaching and the founding of Grupo Bonfim in 1953, the knowledge José Bidel carried forward from the working-class capoeiristas of São Francisco do Conde became part of the foundation of modern capoeira in Rio de Janeiro.

His life exemplifies the social reality of capoeira in the early 20th century Recôncavo—practiced by working men like crabbers, boatmen, and dock workers, passed informally through families and communities, existing in the margins of a society that had only recently abolished slavery and still treated its Afro-Brazilian population with systematic violence and exploitation.',
  -- bio_pt
  E'José Bidel dos Santos era um catador de caranguejos de São Francisco do Conde no Recôncavo Baiano. Ganhava a vida colhendo caranguejos dos estuários de mangue do Recôncavo, trabalho árduo que exigia conhecimento íntimo das marés e pântanos. Como muitos homens trabalhadores de sua geração no Recôncavo, José Bidel praticava capoeira.

Junto com seu irmão Dendê, José Bidel pertencia à rede de capoeiristas conectados a Besouro Mangangá e seus companheiros em Santo Amaro. Os dois irmãos se associavam com alguns dos capoeiristas mais renomados do Recôncavo do início do século XX—Siri de Mangue, que trabalhava como saveirista (barqueiro) nos rios, e Neco Canário Pardo, que ensinava luta de facão além de capoeira. Segundo o filho de José Bidel, Mário, o próprio Besouro chegou a visitar sua casa, embora isso tenha sido antes de Mário nascer, pois Besouro foi morto em 1924.

O que sabemos sobre José Bidel vem principalmente do testemunho de seu filho, Mário dos Santos, que se tornaria conhecido como Mestre Mário Buscapé. Mário descreve aprender capoeira a partir dos oito anos em rodas improvisadas no quintal de sua família. Seu tio Dendê foi seu primeiro professor, mas seu pai José Bidel também o treinou na arte. A linhagem que Mário aprendeu—passada de Besouro através de seus companheiros para Dendê e José Bidel—eventualmente chegaria ao Rio de Janeiro, onde Mário se tornaria uma das quatro figuras fundadoras da capoeira contemporânea naquela cidade.

José Bidel representa um elo crítico na história da capoeira: uma figura da Camada Zero da geração que conheceu diretamente os companheiros de Besouro, que preservou a capoeira tradicional do Recôncavo e a transmitiu para a próxima geração antes da codificação formal dos estilos. Através do ensino de seu filho e da fundação do Grupo Bonfim em 1953, o conhecimento que José Bidel levou adiante dos capoeiristas da classe trabalhadora de São Francisco do Conde tornou-se parte da base da capoeira moderna no Rio de Janeiro.

Sua vida exemplifica a realidade social da capoeira no Recôncavo do início do século XX—praticada por homens trabalhadores como catadores de caranguejo, barqueiros e trabalhadores portuários, passada informalmente através de famílias e comunidades, existindo às margens de uma sociedade que havia abolido recentemente a escravidão e ainda tratava sua população afro-brasileira com violência sistemática e exploração.',
  -- achievements_en
  'Father and teacher of Mestre Mário Buscapé; preserved Recôncavo capoeira lineage from Besouro''s era; transmitted traditional capoeira to the generation that would found contemporary Rio capoeira',
  -- achievements_pt
  'Pai e professor de Mestre Mário Buscapé; preservou a linhagem da capoeira do Recôncavo da era de Besouro; transmitiu a capoeira tradicional para a geração que fundaria a capoeira contemporânea do Rio',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1900, decade precision): José Bidel had a son born in 1934 (Mário Buscapé). If he was in his 30s when his son was born, birth estimate is ~1900-1910. He was old enough to have trained with Besouro''s companions (Siri de Mangue, Canário Pardo) who were active in the 1920s. Using 1900 as midpoint with decade precision.

DEATH: Unknown. No records found.

FAMILY: Brother of Dendê (Mário Buscapé''s uncle and first capoeira teacher). Father of Mário dos Santos (Mestre Mário Buscapé, 1934-2021). Wife Maria dos Anjos dos Santos was a shellfish gatherer (marisqueira).

OCCUPATION: Crabber (catador de caranguejos) in São Francisco do Conde.

LINEAGE DISCREPANCY: One web source (Capoeira Rotterdam) states "Besouro → Dendê → José Bidel → Mário Buscapé," suggesting Dendê taught José Bidel. However, Mário Buscapé''s own testimony (primary source) states Dendê was his uncle and José Bidel was his father, with both being brothers who trained together with Besouro''s companions. Both taught Mário. The relationship "Dendê → José Bidel" as teacher-student is UNCONFIRMED. More likely: both brothers learned from the same circle (Siri de Mangue, Canário Pardo) and both taught Mário.

BESOURO CONNECTION: According to Mário Buscapé, Besouro visited their house, but this must have been before Mário was born (pre-1924). José Bidel and Dendê were not direct students of Besouro but rather associated with his companions after his death.

PENDING RELATIONSHIPS (require SQL imports):
- Dendê: family_of (brother relationship)
- Mário Buscapé: family_of (father-son) - entity already imported

ACTIVE RELATIONSHIPS (entities already imported):
- Siri de Mangue: associated_with (training companions)
- Neco Canário Pardo: associated_with (training companions)
- Besouro Mangangá: associated_with (visited family home; trained with his companions)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): José Bidel teve um filho nascido em 1934 (Mário Buscapé). Se estava na casa dos 30 anos quando seu filho nasceu, estimativa de nascimento é ~1900-1910. Era velho o suficiente para ter treinado com os companheiros de Besouro (Siri de Mangue, Canário Pardo) que eram ativos nos anos 1920. Usando 1900 como ponto médio com precisão de década.

MORTE: Desconhecida. Nenhum registro encontrado.

FAMÍLIA: Irmão de Dendê (tio de Mário Buscapé e primeiro professor de capoeira). Pai de Mário dos Santos (Mestre Mário Buscapé, 1934-2021). Esposa Maria dos Anjos dos Santos era marisqueira.

OCUPAÇÃO: Catador de caranguejos em São Francisco do Conde.

DISCREPÂNCIA DE LINHAGEM: Uma fonte web (Capoeira Rotterdam) afirma "Besouro → Dendê → José Bidel → Mário Buscapé," sugerindo que Dendê ensinou José Bidel. No entanto, o próprio testemunho de Mário Buscapé (fonte primária) afirma que Dendê era seu tio e José Bidel era seu pai, sendo ambos irmãos que treinaram juntos com os companheiros de Besouro. Ambos ensinaram Mário. A relação "Dendê → José Bidel" como professor-aluno é NÃO CONFIRMADA. Mais provável: ambos os irmãos aprenderam do mesmo círculo (Siri de Mangue, Canário Pardo) e ambos ensinaram Mário.

CONEXÃO COM BESOURO: Segundo Mário Buscapé, Besouro visitou sua casa, mas isso deve ter sido antes de Mário nascer (pré-1924). José Bidel e Dendê não eram alunos diretos de Besouro, mas sim associados com seus companheiros após sua morte.

RELACIONAMENTOS PENDENTES (requerem importações SQL):
- Dendê: family_of (relação de irmãos)
- Mário Buscapé: family_of (pai-filho) - entidade já importada

RELACIONAMENTOS ATIVOS (entidades já importadas):
- Siri de Mangue: associated_with (companheiros de treino)
- Neco Canário Pardo: associated_with (companheiros de treino)
- Besouro Mangangá: associated_with (visitou casa da família; treinou com seus companheiros)'
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
