-- ============================================================
-- GENEALOGY PERSON: Dendê (Recôncavo)
-- Generated: 2026-01-03 (merged from dende-sfc.sql and dende-santo-amaro.sql)
-- ============================================================
-- MERGED IDENTITY: Sources mention "Dendê from Santo Amaro" (Cobrinha Verde's
-- teacher) and "Dendê from São Francisco do Conde" (Mário Buscapé's uncle).
-- These towns share a border (~15-25km apart) in the Recôncavo Baiano.
-- Circumstantial evidence strongly suggests ONE person active across both areas:
-- - Same unusual apelido ("Dendê" = palm oil)
-- - Same decade of birth (1890s estimate)
-- - Same era of activity (1920s-1940s)
-- - Compatible timeline: teaching Cobrinha Verde in 1920s (age 30s),
--   teaching nephew Mário Buscapé in 1940s (age 50s)
-- - Same social circle (Besouro's companions)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown
  'Dendê',
  NULL, -- No context needed - merged identity
  NULL, -- Pre-codification era; proto_mestre but no formal title documented
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  NULL, -- Pre-codification era; Bahian Recôncavo tradition before Angola/Regional distinction
  E'Proto-mestre from the Bahian Recôncavo, active in Santo Amaro da Purificação and São Francisco do Conde. Trained with Besouro Mangangá''s companions including Siri de Mangue and Canário Pardo. One of Cobrinha Verde''s teachers in Santo Amaro after Besouro''s death (1924). Uncle and first capoeira teacher of Mário Buscapé, teaching him in family backyard rodas starting around 1942.',
  E'Proto-mestre do Recôncavo Baiano, ativo em Santo Amaro da Purificação e São Francisco do Conde. Treinou com os companheiros de Besouro Mangangá, incluindo Siri de Mangue e Canário Pardo. Um dos professores de Cobrinha Verde em Santo Amaro após a morte de Besouro (1924). Tio e primeiro professor de capoeira de Mário Buscapé, ensinando-o em rodas no quintal da família a partir de cerca de 1942.',
  1890, 'decade'::genealogy.date_precision, 'Recôncavo Baiano, Bahia, Brazil',
  NULL, 'unknown'::genealogy.date_precision, NULL,
  -- bio_en
  E'Dendê was a capoeirista from the Bahian Recôncavo region, active in Santo Amaro da Purificação and the neighboring municipality of São Francisco do Conde. He was part of the generation that trained with Besouro Mangangá''s companions and helped transmit traditional capoeira to the next generation.

According to Mestre Cobrinha Verde''s testimony in "Capoeira e Mandingas" (1991): "My true mestre was Besouro, but I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo." Cobrinha Verde (born 1912) learned from these mestres after Besouro''s assassination in 1924, suggesting Dendê was already an established teacher in his 30s at that time.

Dendê was also the uncle and first capoeira teacher of Mário Buscapé, who later became one of the four founding figures of contemporary capoeira in Rio de Janeiro. According to Mário''s testimony, both his father José Bidel dos Santos and his uncle Dendê practiced capoeira and associated with famous capoeiristas of the Recôncavo, including Siri de Mangue, Canário Pardo, and Besouro from Santo Amaro. The legendary Besouro Mangangá reportedly visited their family home before Mário was born.

Starting around 1942, when Mário was approximately eight years old, Dendê began teaching his nephew capoeira in improvised rodas held in the family''s backyard in São Francisco do Conde. Dendê served as Mário''s primary teacher during these formative years, alongside Mário''s father José Bidel.

Sources mention "Dendê from Santo Amaro" and "Dendê from São Francisco do Conde" as potentially distinct individuals. However, these neighboring municipalities share a border (only 15-25km apart), and the circumstantial evidence strongly suggests this was one person active across the interconnected Recôncavo region: same unusual apelido, same birth decade, same era of activity, same social circle of Besouro''s companions, and a timeline perfectly compatible with one life.

Dendê remains a Layer Zero figure—a proto-mestre from the pre-codification era whose legacy lives on through the students he trained: Cobrinha Verde, who became a legendary mestre and bridge to the documented lineage, and Mário Buscapé, who brought the Recôncavo tradition to Rio de Janeiro.',
  -- bio_pt
  E'Dendê foi um capoeirista da região do Recôncavo Baiano, ativo em Santo Amaro da Purificação e no município vizinho de São Francisco do Conde. Fazia parte da geração que treinou com os companheiros de Besouro Mangangá e ajudou a transmitir a capoeira tradicional para a próxima geração.

Segundo o testemunho de Mestre Cobrinha Verde em "Capoeira e Mandingas" (1991): "O meu mestre verdadeiro foi Besouro, mas eu aprendi com muitos mestres em Santo Amaro. Vou dar o nome de um por um: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo." Cobrinha Verde (nascido em 1912) aprendeu com esses mestres após o assassinato de Besouro em 1924, sugerindo que Dendê já era um professor estabelecido em seus 30 anos naquela época.

Dendê também era tio e primeiro professor de capoeira de Mário Buscapé, que mais tarde se tornou uma das quatro figuras fundadoras da capoeira contemporânea no Rio de Janeiro. Segundo o testemunho de Mário, tanto seu pai José Bidel dos Santos quanto seu tio Dendê praticavam capoeira e se associavam com famosos capoeiristas do Recôncavo, incluindo Siri de Mangue, Canário Pardo e Besouro de Santo Amaro. O lendário Besouro Mangangá teria visitado a casa da família antes de Mário nascer.

A partir de cerca de 1942, quando Mário tinha aproximadamente oito anos, Dendê começou a ensinar capoeira ao sobrinho em rodas improvisadas no quintal da família em São Francisco do Conde. Dendê serviu como professor principal de Mário durante esses anos formativos, ao lado do pai de Mário, José Bidel.

As fontes mencionam "Dendê de Santo Amaro" e "Dendê de São Francisco do Conde" como indivíduos potencialmente distintos. No entanto, esses municípios vizinhos compartilham fronteira (apenas 15-25km de distância), e as evidências circunstanciais sugerem fortemente que era uma pessoa ativa na região interconectada do Recôncavo: mesmo apelido incomum, mesma década de nascimento, mesma era de atividade, mesmo círculo social dos companheiros de Besouro, e uma linha do tempo perfeitamente compatível com uma vida.

Dendê permanece uma figura da Camada Zero—um proto-mestre da era pré-codificação cujo legado vive através dos alunos que treinou: Cobrinha Verde, que se tornou um mestre lendário e ponte para a linhagem documentada, e Mário Buscapé, que levou a tradição do Recôncavo para o Rio de Janeiro.',
  -- achievements_en
  E'Teacher of Cobrinha Verde in Santo Amaro da Purificação (1920s); First capoeira teacher of Mário Buscapé in São Francisco do Conde (1940s); Part of the generation that maintained capoeira during the prohibition era (1890-1937); Trained with Besouro Mangangá''s companions (Siri de Mangue, Canário Pardo); Critical link transmitting Recôncavo capoeira tradition to both Salvador and Rio de Janeiro lineages',
  -- achievements_pt
  E'Professor de Cobrinha Verde em Santo Amaro da Purificação (anos 1920); Primeiro professor de capoeira de Mário Buscapé em São Francisco do Conde (anos 1940); Parte da geração que manteve a capoeira durante a era de proibição (1890-1937); Treinou com os companheiros de Besouro Mangangá (Siri de Mangue, Canário Pardo); Elo crítico transmitindo a tradição da capoeira do Recôncavo para as linhagens de Salvador e Rio de Janeiro',
  -- notes_en
  E'MERGED IDENTITY ANALYSIS:
Sources mention two potentially distinct figures:
1. "Dendê from Santo Amaro" - Listed by Cobrinha Verde among his teachers (1920s)
2. "Dendê from São Francisco do Conde" - Uncle and teacher of Mário Buscapé (1940s)

EVIDENCE FOR ONE PERSON:
- Geographic proximity: Santo Amaro and São Francisco do Conde share a border (~15-25km apart)
- Same unusual apelido: "Dendê" (palm oil) is not common
- Same birth decade: Both estimates point to 1890s
- Same era of activity: 1920s-1940s
- Same social circle: Both connected to Besouro''s companions (Siri de Mangue, Canário Pardo)
- Compatible timeline for one life:
  * 1920s: Teaching Cobrinha Verde in Santo Amaro (age ~30s)
  * 1940s: Teaching nephew Mário Buscapé in São Francisco do Conde (age ~50s)

The circumstantial evidence strongly suggests ONE person active across the interconnected Recôncavo region. Different sources emphasized different localities based on their informants'' perspectives (Cobrinha Verde = Santo Amaro; Mário Buscapé = São Francisco do Conde), but the Recôncavo was a small, interconnected region where capoeiristas moved freely between neighboring towns.

BIRTH YEAR ESTIMATION (1890, decade):
- Needed to be adult (20+) by 1920s to train with Besouro''s companions and teach Cobrinha Verde
- Still actively teaching nephew Mário in 1942 when Mário was 8
- Age 30-35 when teaching Cobrinha Verde (1920s) is reasonable for an established teacher
- Age 50-55 when teaching Mário (1942) is consistent with being an uncle

TRAINING COMPANIONS (associated_with):
- Siri de Mangue (1920s) - training companion, NOT teacher-student
- Neco Canário Pardo (1920s) - training companion, NOT teacher-student
- Besouro Mangangá - part of his circle of companions
NOTE: Sources say Dendê "met up with" these capoeiristas, indicating peers who trained together, not a hierarchical relationship.

STUDENTS:
- Cobrinha Verde (Rafael Alves França, 1912-1983) - trained_under, ~1924-1929
- Mário Buscapé (Mário dos Santos, 1934-2021) - as uncle/first teacher, ~1942+

FAMILY:
- Uncle of Mário Buscapé
- Brother of José Bidel (Mário''s father) - both practiced capoeira together

CONTEMPORARIES (associated_with):
- Maitá, Licurí, Joité, Gasolina, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso (all Santo Amaro teachers of Cobrinha Verde)

PRIMARY SOURCES:
1. Cobrinha Verde autobiographical testimony in Marcelino dos Santos "Capoeira e Mandingas" (1991), p.11-23
2. Mário Buscapé testimony on capoeirahistory.com',
  -- notes_pt
  E'ANÁLISE DE IDENTIDADE MESCLADA:
As fontes mencionam duas figuras potencialmente distintas:
1. "Dendê de Santo Amaro" - Listado por Cobrinha Verde entre seus professores (anos 1920)
2. "Dendê de São Francisco do Conde" - Tio e professor de Mário Buscapé (anos 1940)

EVIDÊNCIAS PARA UMA PESSOA:
- Proximidade geográfica: Santo Amaro e São Francisco do Conde compartilham fronteira (~15-25km de distância)
- Mesmo apelido incomum: "Dendê" (óleo de palma) não é comum
- Mesma década de nascimento: Ambas as estimativas apontam para os anos 1890
- Mesma era de atividade: anos 1920-1940
- Mesmo círculo social: Ambos conectados aos companheiros de Besouro (Siri de Mangue, Canário Pardo)
- Linha do tempo compatível para uma vida:
  * Anos 1920: Ensinando Cobrinha Verde em Santo Amaro (idade ~30 anos)
  * Anos 1940: Ensinando sobrinho Mário Buscapé em São Francisco do Conde (idade ~50 anos)

As evidências circunstanciais sugerem fortemente UMA pessoa ativa na região interconectada do Recôncavo. Diferentes fontes enfatizaram diferentes localidades baseadas nas perspectivas de seus informantes (Cobrinha Verde = Santo Amaro; Mário Buscapé = São Francisco do Conde), mas o Recôncavo era uma região pequena e interconectada onde capoeiristas se moviam livremente entre cidades vizinhas.

ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
- Precisava ser adulto (20+) nos anos 1920 para treinar com os companheiros de Besouro e ensinar Cobrinha Verde
- Ainda ensinando ativamente o sobrinho Mário em 1942 quando Mário tinha 8 anos
- Idade 30-35 ao ensinar Cobrinha Verde (anos 1920) é razoável para um professor estabelecido
- Idade 50-55 ao ensinar Mário (1942) é consistente com ser tio

COMPANHEIROS DE TREINO (associated_with):
- Siri de Mangue (anos 1920) - companheiro de treino, NÃO professor-aluno
- Neco Canário Pardo (anos 1920) - companheiro de treino, NÃO professor-aluno
- Besouro Mangangá - parte de seu círculo de companheiros
NOTA: Fontes dizem que Dendê "se encontrava com" esses capoeiristas, indicando pares que treinavam juntos, não uma relação hierárquica.

ALUNOS:
- Cobrinha Verde (Rafael Alves França, 1912-1983) - trained_under, ~1924-1929
- Mário Buscapé (Mário dos Santos, 1934-2021) - como tio/primeiro professor, ~1942+

FAMÍLIA:
- Tio de Mário Buscapé
- Irmão de José Bidel (pai de Mário) - ambos praticavam capoeira juntos

CONTEMPORÂNEOS (associated_with):
- Maitá, Licurí, Joité, Gasolina, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso (todos professores de Cobrinha Verde em Santo Amaro)

FONTES PRIMÁRIAS:
1. Testemunho autobiográfico de Cobrinha Verde em Marcelino dos Santos "Capoeira e Mandingas" (1991), p.11-23
2. Testemunho de Mário Buscapé em capoeirahistory.com'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
