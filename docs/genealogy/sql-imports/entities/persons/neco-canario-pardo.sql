-- ============================================================
-- GENEALOGY PERSON: Neco Canário Pardo
-- Migrated: 2025-12-11
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
  NULL,
  'Neco Canário Pardo',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/besouro']::text[],
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for machete expertise and the traditional capoeira of Santo Amaro da Purificação.',
  'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecido pela perícia com o facão e pela capoeira tradicional de Santo Amaro da Purificação.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Neco Canário Pardo was a capoeirista of Santo Amaro da Purificação who specialized in machete fighting. He was part of the legendary circle of capoeiristas at Trapiche de Baixo—Santo Amaro''s poorest neighborhood—who trained and played alongside the famous Besouro Mangangá in the early 20th century.

According to Professor Leiteiro, Neco Canário Pardo was among the companions of Besouro alongside Paulo Barroquinha, Boca de Siri, Noca de Jacó, and Doze Homens. All were residents of Trapiche de Baixo and "were his companions in the memorable capoeira rodas that hypnotized anybody who would go by."

His significance extends through his students. Mestre Cobrinha Verde, Besouro''s cousin and the bridge between the legendary era and documented lineage, explicitly named Neco Canário Pardo as his machete teacher: "Neco Canário Pardo was my machete teacher." This specialized knowledge in blade combat complemented Cobrinha''s capoeira training under Besouro.

Neco Canário Pardo also taught Mestre Waldemar da Paixão (1916-1990), who would become one of the most influential capoeira Angola mestres of his generation. Waldemar stated: "I learned Capoeira from Siri de Mangue, Canário Pardo, Calabi de Periperi..." This places Neco Canário Pardo as a critical lineage figure connecting the era of Besouro to the modern academy structure that emerged in Salvador.

Some sources mention that his brother was Mestre Atenilo (nicknamed "Relâmpago da Regional"), who was also known as "Cordão de Ouro"—though other sources attribute the name Cordão de Ouro to Besouro Mangangá himself. This discrepancy remains unresolved in the historical record.

Unlike his student Cobrinha Verde who went on to teach publicly and leave detailed oral testimonies, little else is known about Neco Canário Pardo''s life beyond his role as a machete expert and companion of Besouro. His legacy lives on through the lineages of both Cobrinha Verde and Mestre Waldemar.',
  -- bio_pt
  E'Neco Canário Pardo foi um capoeirista de Santo Amaro da Purificação especializado em luta com facão. Fazia parte do lendário círculo de capoeiristas do Trapiche de Baixo—o bairro mais pobre de Santo Amaro—que treinavam e jogavam ao lado do famoso Besouro Mangangá no início do século XX.

Segundo o Professor Leiteiro, Neco Canário Pardo estava entre os companheiros de Besouro junto com Paulo Barroquinha, Boca de Siri, Noca de Jacó e Doze Homens. Todos eram moradores do Trapiche de Baixo e "eram seus companheiros nas memoráveis rodas de capoeira que hipnotizavam qualquer um que passasse."

Sua importância se estende através de seus alunos. Mestre Cobrinha Verde, primo de Besouro e ponte entre a era lendária e a linhagem documentada, explicitamente nomeou Neco Canário Pardo como seu mestre de facão: "Neco Canário Pardo foi meu mestre de facão." Este conhecimento especializado em combate com lâminas complementava o treinamento de capoeira de Cobrinha sob Besouro.

Neco Canário Pardo também ensinou Mestre Waldemar da Paixão (1916-1990), que se tornaria um dos mestres de capoeira Angola mais influentes de sua geração. Waldemar declarou: "Aprendi Capoeira com Siri de Mangue, Canário Pardo, Calabi de Periperi..." Isso coloca Neco Canário Pardo como uma figura crucial de linhagem conectando a era de Besouro à estrutura moderna de academias que surgiu em Salvador.

Algumas fontes mencionam que seu irmão era Mestre Atenilo (apelidado "Relâmpago da Regional"), também conhecido como "Cordão de Ouro"—embora outras fontes atribuam o nome Cordão de Ouro ao próprio Besouro Mangangá. Esta discrepância permanece não resolvida no registro histórico.

Diferente de seu aluno Cobrinha Verde que passou a ensinar publicamente e deixar testemunhos orais detalhados, pouco mais se sabe sobre a vida de Neco Canário Pardo além de seu papel como especialista em facão e companheiro de Besouro. Seu legado vive através das linhagens de Cobrinha Verde e Mestre Waldemar.',
  -- achievements_en
  'Machete teacher to Mestre Cobrinha Verde; Teacher of Mestre Waldemar da Paixão; Companion of Besouro Mangangá at Trapiche de Baixo rodas',
  -- achievements_pt
  'Mestre de facão de Mestre Cobrinha Verde; Mestre de Mestre Waldemar da Paixão; Companheiro de Besouro Mangangá nas rodas do Trapiche de Baixo',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION: c. 1880 (decade precision). Neco Canário Pardo was a companion of Besouro Mangangá (born 1895) at Trapiche de Baixo. He taught Cobrinha Verde (born 1912) machete from ~1916, and also taught Mestre Waldemar starting 1936. To be an established adult companion of Besouro in the 1910s-1920s, he was likely 10-20 years older than Besouro. If born ~1875-1885, he would be ~30-40 when teaching Cobrinha, ~40-50 during Besouro''s prime, and ~50-60 when teaching Waldemar. Using midpoint: c. 1880.

DEATH DATE: Unknown.

NAME VARIATION: Some sources list "Neco" and "Canário Pardo" as separate individuals, while Cobrinha Verde''s direct testimony treats "Neco Canário Pardo" as a single person. We follow Cobrinha''s testimony as the primary source.

BROTHER: According to some sources, Mestre Atenilo ("Relâmpago da Regional") was his brother and may have been known as "Cordão de Ouro." However, Mestre Waldemar attributed the name Cordão de Ouro to Besouro himself. This remains disputed.

LOCATION: Active in Trapiche de Baixo, described as the poorest neighborhood of Santo Amaro da Purificação.

SPECIALIZATION: Explicitly identified as machete (facão) teacher. Razorblade technique was taught by a different person (Tonha Rolo do Mar taught Cobrinha the navalha).

TEACHING TIMELINE: Taught Cobrinha Verde in the 1910s-1920s (Cobrinha born 1912, learned from age 4). Taught Mestre Waldemar who began in 1936.

SOURCES: Primary sources include Cobrinha Verde''s autobiography (velhosmestres.com), Mestre Waldemar interview, Professor Leiteiro''s accounts.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO: c. 1880 (precisão de década). Neco Canário Pardo era companheiro de Besouro Mangangá (nascido em 1895) no Trapiche de Baixo. Ensinou facão a Cobrinha Verde (nascido em 1912) a partir de ~1916, e também ensinou Mestre Waldemar a partir de 1936. Para ser um companheiro adulto estabelecido de Besouro nos anos 1910-1920, ele provavelmente era 10-20 anos mais velho que Besouro. Se nascido ~1875-1885, teria ~30-40 anos ensinando Cobrinha, ~40-50 durante o auge de Besouro, e ~50-60 ensinando Waldemar. Usando ponto médio: c. 1880.

DATA DE MORTE: Desconhecida.

VARIAÇÃO DE NOME: Algumas fontes listam "Neco" e "Canário Pardo" como indivíduos separados, enquanto o testemunho direto de Cobrinha Verde trata "Neco Canário Pardo" como uma única pessoa. Seguimos o testemunho de Cobrinha como fonte primária.

IRMÃO: Segundo algumas fontes, Mestre Atenilo ("Relâmpago da Regional") era seu irmão e pode ter sido conhecido como "Cordão de Ouro." No entanto, Mestre Waldemar atribuiu o nome Cordão de Ouro ao próprio Besouro. Isto permanece disputado.

LOCAL: Ativo no Trapiche de Baixo, descrito como o bairro mais pobre de Santo Amaro da Purificação.

ESPECIALIZAÇÃO: Explicitamente identificado como mestre de facão. Técnica de navalha era ensinada por outra pessoa (Tonha Rolo do Mar ensinou Cobrinha a navalha).

LINHA DO TEMPO DE ENSINO: Ensinou Cobrinha Verde nos anos 1910-1920 (Cobrinha nascido em 1912, aprendeu desde os 4 anos). Ensinou Mestre Waldemar que começou em 1936.

FONTES: Fontes primárias incluem autobiografia de Cobrinha Verde (velhosmestres.com), entrevista de Mestre Waldemar, relatos do Professor Leiteiro.'
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
