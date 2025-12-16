-- ============================================================
-- GENEALOGY PERSON: Dendê (São Francisco do Conde)
-- Generated: 2025-12-16
-- ============================================================
-- Uncle of Mário Buscapé; first capoeira teacher; trained with
-- Besouro's companions in the Recôncavo; proto-mestre figure.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  NULL, -- Full name unknown
  'Dendê',
  'São Francisco do Conde', -- Critical: distinguishes from Dendê of Santo Amaro and other Dendês
  NULL, -- Pre-codification era; likely proto_mestre but no formal title documented
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Bahian Recôncavo tradition before Angola/Regional distinction
  'Capoeirista from São Francisco do Conde in the Bahian Recôncavo. Trained with Besouro Mangangá''s companions including Siri de Mangue and Canário Pardo. Taught capoeira to his nephew Mário Buscapé in family backyard rodas starting around 1942. Part of the Recôncavo capoeira tradition of the early 20th century.',
  'Capoeirista de São Francisco do Conde no Recôncavo Baiano. Treinou com os companheiros de Besouro Mangangá, incluindo Siri de Mangue e Canário Pardo. Ensinou capoeira ao sobrinho Mário Buscapé em rodas no quintal da família a partir de cerca de 1942. Parte da tradição da capoeira do Recôncavo do início do século XX.',
  -- Life dates
  1890, -- Estimated: would need to be adult by 1920s to train with Besouro's companions, and still teaching in 1942
  'decade'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Dendê was a capoeirista from São Francisco do Conde in the Bahian Recôncavo region. He was the uncle and first capoeira teacher of Mário Buscapé, who later became one of the four founding figures of contemporary capoeira in Rio de Janeiro.

According to Mário Buscapé''s testimony, both his father José Bidel dos Santos and his uncle Dendê practiced capoeira and associated with famous capoeiristas of the Recôncavo, including Siri de Mangue, Canário Pardo, and Besouro from Santo Amaro. According to Mário, the legendary Besouro Mangangá even visited their family home, though this would have been before Mário was born, as Besouro was killed in 1924.

Starting around 1942, when Mário was approximately eight years old, Dendê began teaching his nephew capoeira in improvised rodas held in the family''s backyard. Dendê served as Mário''s primary teacher during these formative years, alongside Mário''s father José Bidel, who also trained him.

Dendê represented a direct link in the lineage from Besouro Mangangá to the contemporary capoeira scene. Lineage records show the connection: Besouro → Bidel → Dendê → Mário Buscapé. Through his teaching, Dendê helped preserve and transmit the traditional Bahian Recôncavo capoeira that his nephew would later bring to Rio de Janeiro in the early 1950s, where it became one of the foundational influences on the modern capoeira movement.

Little else is documented about Dendê''s life, training methods, or other students. He remains one of many Layer Zero capoeira figures—practitioners from the pre-codification era whose legacy lives on primarily through the students they trained and the lineages they helped establish.',
  -- bio_pt
  E'Dendê foi um capoeirista de São Francisco do Conde na região do Recôncavo Baiano. Era tio e primeiro professor de capoeira de Mário Buscapé, que mais tarde se tornou uma das quatro figuras fundadoras da capoeira contemporânea no Rio de Janeiro.

Segundo o testemunho de Mário Buscapé, tanto seu pai José Bidel dos Santos quanto seu tio Dendê praticavam capoeira e se associavam com famosos capoeiristas do Recôncavo, incluindo Siri de Mangue, Canário Pardo e Besouro de Santo Amaro. Segundo Mário, o lendário Besouro Mangangá até visitou a casa da família, embora isso tenha acontecido antes de Mário nascer, pois Besouro foi morto em 1924.

A partir de cerca de 1942, quando Mário tinha aproximadamente oito anos de idade, Dendê começou a ensinar capoeira ao sobrinho em rodas improvisadas no quintal da família. Dendê serviu como professor principal de Mário durante esses anos formativos, ao lado do pai de Mário, José Bidel, que também o treinou.

Dendê representou um elo direto na linhagem de Besouro Mangangá até a cena contemporânea da capoeira. Registros de linhagem mostram a conexão: Besouro → Bidel → Dendê → Mário Buscapé. Através de seu ensino, Dendê ajudou a preservar e transmitir a capoeira tradicional do Recôncavo Baiano que seu sobrinho mais tarde levaria ao Rio de Janeiro no início dos anos 1950, onde se tornou uma das influências fundamentais no movimento moderno da capoeira.

Pouco mais está documentado sobre a vida de Dendê, métodos de ensino ou outros alunos. Ele permanece uma das muitas figuras da Camada Zero da capoeira—praticantes da era pré-codificação cujo legado vive principalmente através dos alunos que treinaram e das linhagens que ajudaram a estabelecer.',
  -- achievements_en
  'First capoeira teacher of Mário Buscapé; Transmitted traditional Bahian Recôncavo capoeira tradition to the next generation; Link in the lineage from Besouro Mangangá to contemporary capoeira',
  -- achievements_pt
  'Primeiro professor de capoeira de Mário Buscapé; Transmitiu a tradição da capoeira tradicional do Recôncavo Baiano para a próxima geração; Elo na linhagem de Besouro Mangangá até a capoeira contemporânea',
  -- Researcher notes (English)
  E'APELIDO_CONTEXT: Set to "São Francisco do Conde" to distinguish from multiple other capoeiristas named Dendê, including:
- Dendê from Santo Amaro (already in database)
- A Dendê listed among teachers of Cobrinha Verde
- Possibly others in the historical record

IDENTITY CONFUSION: Web research revealed potential confusion between different people named Dendê:
1. Mestre Cobrinha Verde listed a "Dendê" among his teachers in Santo Amaro
2. One lineage source shows "Besouro → Dendê → José Bidel → Mário Buscapé"
3. Another shows "Besouro → Bidel → Dendê → Mário Buscapé"

The most reliable account comes from Mário Buscapé himself, who stated that BOTH his father (José Bidel) and uncle (Dendê) taught him, and that both trained with Besouro''s companions. The lineage likely represents that both Bidel and Dendê were students of Besouro''s tradition (possibly through intermediaries like Siri de Mangue), and both taught Mário.

BIRTH YEAR: Estimated as 1890s (decade precision) based on:
- Would need to be an adult (20+) by the 1920s to train with Besouro''s active companions
- Was still actively teaching nephew Mário in 1942 when Mário was 8
- Typical age range would be 40s-50s when teaching in 1942
- This suggests birth around 1890-1900

TITLE: Left as NULL. While he clearly taught capoeira and was respected enough to be Mário''s primary teacher, there is no evidence he held a formal "mestre" title. This was the pre-codification era in the Recôncavo when such titles were not yet formalized. He could be considered a "proto-mestre" figure.

STYLE: NULL - Pre-codification era. The Angola/Regional distinction had not yet emerged when Dendê was teaching in the 1940s in the Recôncavo.

LINEAGE POSITION: Dendê is documented as a critical transmission link in one of the four founding lineages of contemporary capoeira in Rio de Janeiro. The chain goes: Besouro''s companions (Siri de Mangue, Canário Pardo) → Dendê/Bidel → Mário Buscapé → Zé Grande/Deraldo → multiple Rio mestres.

FAMILY RELATIONSHIP: Uncle of Mário Buscapé. Brother-in-law to José Bidel (Mário''s father), or possibly brother to Mário''s mother Maria dos Anjos dos Santos. Sources don''t specify which side of the family.',
  -- Researcher notes (Portuguese)
  E'APELIDO_CONTEXT: Definido como "São Francisco do Conde" para distinguir de múltiplos outros capoeiristas chamados Dendê, incluindo:
- Dendê de Santo Amaro (já no banco de dados)
- Um Dendê listado entre os professores de Cobrinha Verde
- Possivelmente outros no registro histórico

CONFUSÃO DE IDENTIDADE: A pesquisa web revelou potencial confusão entre diferentes pessoas chamadas Dendê:
1. Mestre Cobrinha Verde listou um "Dendê" entre seus professores em Santo Amaro
2. Uma fonte de linhagem mostra "Besouro → Dendê → José Bidel → Mário Buscapé"
3. Outra mostra "Besouro → Bidel → Dendê → Mário Buscapé"

O relato mais confiável vem do próprio Mário Buscapé, que afirmou que TANTO seu pai (José Bidel) quanto seu tio (Dendê) o ensinaram, e que ambos treinaram com os companheiros de Besouro. A linhagem provavelmente representa que tanto Bidel quanto Dendê foram alunos da tradição de Besouro (possivelmente através de intermediários como Siri de Mangue), e ambos ensinaram Mário.

ANO DE NASCIMENTO: Estimado como 1890 (precisão de década) baseado em:
- Precisaria ser adulto (20+) nos anos 1920 para treinar com os companheiros ativos de Besouro
- Ainda estava ensinando ativamente o sobrinho Mário em 1942 quando Mário tinha 8 anos
- Faixa etária típica seria 40-50 anos ao ensinar em 1942
- Isso sugere nascimento por volta de 1890-1900

TÍTULO: Deixado como NULL. Embora ele claramente ensinasse capoeira e fosse respeitado o suficiente para ser o professor principal de Mário, não há evidência de que possuísse um título formal de "mestre". Esta era a era pré-codificação no Recôncavo, quando tais títulos ainda não eram formalizados. Ele poderia ser considerado uma figura "proto-mestre".

ESTILO: NULL - Era pré-codificação. A distinção Angola/Regional ainda não havia surgido quando Dendê estava ensinando nos anos 1940 no Recôncavo.

POSIÇÃO NA LINHAGEM: Dendê está documentado como um elo crítico de transmissão em uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro. A cadeia vai: Companheiros de Besouro (Siri de Mangue, Canário Pardo) → Dendê/Bidel → Mário Buscapé → Zé Grande/Deraldo → múltiplos mestres do Rio.

RELAÇÃO FAMILIAR: Tio de Mário Buscapé. Cunhado de José Bidel (pai de Mário), ou possivelmente irmão da mãe de Mário, Maria dos Anjos dos Santos. As fontes não especificam de que lado da família.'
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
