-- ============================================================
-- GENEALOGY PERSON: Ricardo de Ilha de Maré
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
  NULL, -- Full name unknown; known only by apelido and location
  'Ricardo de Ilha de Maré',
  NULL, -- Proto-mestre; formal title system didn't exist in his era
  NULL, -- No portrait available
  ARRAY['http://velhosmestres.com/en/waldemar-1989-2', 'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-waldemar/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. His style would have been the undifferentiated capoeira of Ilha de Maré.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão Angola/Regional. Seu estilo seria a capoeira indiferenciada da Ilha de Maré.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Ilha de Maré, Salvador, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Ricardo de Ilha de Maré was a capoeirista from Ilha de Maré, one of the islands in the Bay of All Saints (Baía de Todos os Santos) near Salvador. Little is known about his life beyond his crucial role as one of the teachers of Mestre Waldemar da Paixão, who would become one of the most influential figures in capoeira Angola history.

Ilha de Maré, where both Ricardo and Waldemar were born, was home to a strong capoeira tradition. The island produced several notable capoeiristas, including Mestre Totonho de Maré (born 1894), who was one of the co-founders of Gengibirra, the first centro of Capoeira Angola. This suggests that Ilha de Maré maintained an active capoeira community throughout the late 19th and early 20th centuries, with local mestres like Ricardo preserving and transmitting the art to younger generations on the island.

In his 1989 interview with Mestre Luiz Renato, Waldemar explicitly identified his four teachers: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four." Waldemar emphasized that he "asked these men to teach me so I could become professional," indicating that he sought out Ricardo deliberately for instruction.

Waldemar was born on Ilha de Maré in 1916 and began learning capoeira in 1936 at age 20. By that time, Ricardo was likely an established practitioner on the island, possibly one of the elder capoeiristas who maintained the tradition there. While some of Waldemar''s other teachers (Siri de Mangue, Canário Pardo, Talabi) were based in Santo Amaro, Periperi, and other mainland locations, Ricardo represented the island tradition that Waldemar grew up with.

Waldemar later stated about his teachers: "All of them were good and I learned from each one. So I need to give the credits to them all." This acknowledgment speaks to Ricardo''s significance as a teacher, even though his name is far less documented than those of Waldemar''s other instructors.

After completing his training around 1940, Waldemar moved to Salvador and began teaching in the Corta-Braço slum (later known as Liberdade), where his famous barracão would become one of the most important meeting points for Bahian capoeiristas. Through Waldemar''s students and lineage, the teachings of Ricardo de Ilha de Maré continue to influence capoeira to this day.

The island of Ilha de Maré is remembered in capoeira tradition through songs and verses, and it produced at least two documented mestres (Ricardo and Totonho de Maré) who shaped the art in the early 20th century. Ricardo''s legacy lives on primarily through Mestre Waldemar, whose preservation of traditional capoeira Angola has influenced countless practitioners worldwide.',
  -- bio_pt
  E'Ricardo de Ilha de Maré foi um capoeirista da Ilha de Maré, uma das ilhas da Baía de Todos os Santos perto de Salvador. Pouco se sabe sobre sua vida além de seu papel crucial como um dos professores de Mestre Waldemar da Paixão, que se tornaria uma das figuras mais influentes na história da capoeira Angola.

A Ilha de Maré, onde tanto Ricardo quanto Waldemar nasceram, abrigava uma forte tradição de capoeira. A ilha produziu vários capoeiristas notáveis, incluindo Mestre Totonho de Maré (nascido em 1894), que foi um dos co-fundadores da Gengibirra, o primeiro centro de Capoeira Angola. Isso sugere que a Ilha de Maré manteve uma comunidade ativa de capoeira ao longo do final do século XIX e início do século XX, com mestres locais como Ricardo preservando e transmitindo a arte para as gerações mais jovens na ilha.

Em sua entrevista de 1989 com Mestre Luiz Renato, Waldemar explicitamente identificou seus quatro professores: "Eu tive quatro mestres: Siri de Mangue, um; Canário Pardo, dois; Talavi, três, e Ricardo da Ilha de Maré, quatro." Waldemar enfatizou que "pedi a esses homens para me ensinar para que eu pudesse me tornar profissional," indicando que ele procurou Ricardo deliberadamente para instrução.

Waldemar nasceu na Ilha de Maré em 1916 e começou a aprender capoeira em 1936 aos 20 anos. Naquela época, Ricardo provavelmente era um praticante estabelecido na ilha, possivelmente um dos capoeiristas mais velhos que mantinham a tradição lá. Enquanto alguns dos outros professores de Waldemar (Siri de Mangue, Canário Pardo, Talabi) eram baseados em Santo Amaro, Periperi e outros locais do continente, Ricardo representava a tradição da ilha com a qual Waldemar cresceu.

Waldemar declarou mais tarde sobre seus professores: "Todos eram bons e aprendi com cada um. Então preciso dar os créditos a todos eles." Este reconhecimento fala da significância de Ricardo como professor, mesmo que seu nome seja muito menos documentado do que os dos outros instrutores de Waldemar.

Após completar seu treinamento por volta de 1940, Waldemar mudou-se para Salvador e começou a ensinar na favela do Corta-Braço (mais tarde conhecida como Liberdade), onde seu famoso barracão se tornaria um dos pontos de encontro mais importantes para os capoeiristas baianos. Através dos alunos e linhagem de Waldemar, os ensinamentos de Ricardo de Ilha de Maré continuam a influenciar a capoeira até hoje.

A ilha de Ilha de Maré é lembrada na tradição da capoeira através de canções e versos, e produziu pelo menos dois mestres documentados (Ricardo e Totonho de Maré) que moldaram a arte no início do século XX. O legado de Ricardo vive principalmente através de Mestre Waldemar, cuja preservação da capoeira Angola tradicional influenciou incontáveis praticantes em todo o mundo.',
  -- achievements_en
  E'One of four teachers of Mestre Waldemar da Paixão
Representative of Ilha de Maré capoeira tradition
Bridge between island and mainland capoeira traditions
Part of early 20th century Bahian capoeira lineage',
  -- achievements_pt
  E'Um dos quatro professores de Mestre Waldemar da Paixão
Representante da tradição de capoeira da Ilha de Maré
Ponte entre tradições de capoeira da ilha e do continente
Parte da linhagem da capoeira baiana do início do século XX',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Ricardo was teaching Mestre Waldemar starting in 1936 when Waldemar was 20. As an established mestre from Ilha de Maré teaching adults, he was likely in his 40s-50s at that time, placing birth around 1880-1900. Using 1890 as midpoint estimate.

DEATH DATE: Unknown. No records of his death have been found.

FULL NAME: Unknown. He is known only as "Ricardo from Ilha de Maré" or "Ricardo da Ilha de Maré" in Waldemar''s testimony.

LOCATION: Ilha de Maré is an island in the Bay of All Saints (Baía de Todos os Santos) near Salvador. It produced multiple notable capoeiristas including Totonho de Maré (born 1894) and Mestre Waldemar (born 1916).

SOURCE: Primary source is Mestre Waldemar''s 1989 interview where he stated: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four."

WALDEMAR''S QUOTE: "I asked these men to teach me so I could become professional."

TEACHING PERIOD: Taught Waldemar from approximately 1936-1940 (Waldemar started learning in 1936 at age 20 and began teaching in 1940).

PENDING RELATIONSHIPS (require SQL imports):
- Mestre Waldemar: trained_under Ricardo de Ilha de Maré (~1936-1940)
- Possible association with Totonho de Maré (both from same island, overlapping era)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Ricardo estava ensinando Mestre Waldemar a partir de 1936 quando Waldemar tinha 20 anos. Como um mestre estabelecido da Ilha de Maré ensinando adultos, ele provavelmente estava na casa dos 40-50 anos naquela época, colocando o nascimento por volta de 1880-1900. Usando 1890 como estimativa do ponto médio.

DATA DE MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME COMPLETO: Desconhecido. Ele é conhecido apenas como "Ricardo da Ilha de Maré" no testemunho de Waldemar.

LOCAL: Ilha de Maré é uma ilha na Baía de Todos os Santos perto de Salvador. Produziu múltiplos capoeiristas notáveis incluindo Totonho de Maré (nascido em 1894) e Mestre Waldemar (nascido em 1916).

FONTE: Fonte primária é a entrevista de Mestre Waldemar de 1989 onde ele declarou: "Eu tive quatro mestres: Siri de Mangue, um; Canário Pardo, dois; Talavi, três, e Ricardo da Ilha de Maré, quatro."

CITAÇÃO DE WALDEMAR: "Pedi a esses homens para me ensinar para que eu pudesse me tornar profissional."

PERÍODO DE ENSINO: Ensinou Waldemar de aproximadamente 1936-1940 (Waldemar começou a aprender em 1936 aos 20 anos e começou a ensinar em 1940).

RELACIONAMENTOS PENDENTES (requerem importações SQL):
- Mestre Waldemar: trained_under Ricardo de Ilha de Maré (~1936-1940)
- Possível associação com Totonho de Maré (ambos da mesma ilha, era sobreposta)'
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
