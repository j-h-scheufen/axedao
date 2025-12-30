-- ============================================================
-- GENEALOGY PERSON: Besouro Gago
-- Generated: 2025-12-27
-- ============================================================
-- IDENTITY NOTE: "Besouro Gago" means "Besouro the Stutterer" in
-- Portuguese. This is a DISTINCT person from the legendary Besouro
-- Mangangá (Manoel Henrique Pereira, 1895-1924). The similar apelido
-- "Besouro" was a common nickname in capoeira circles.
--
-- SOURCE RELIABILITY: This person is documented by only ONE source
-- (Grupo Liberdade Capoeira website) which lists him as one of
-- Waldemar's teachers. HOWEVER, this directly contradicts Waldemar's
-- own 1989 interview where he explicitly named "four mestres" - and
-- Besouro Gago was not among them.
--
-- BIRTH YEAR ESTIMATION (~1890, decade):
-- If Besouro Gago taught Waldemar in Periperi during 1936-1940, he
-- would have been an experienced capoeirista of teaching age (40-60).
-- This suggests birth around 1880-1900. Using 1890 as midpoint estimate.
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
  NULL,
  'Besouro Gago',
  'Periperi',
  NULL, -- No documented title
  NULL, -- No portrait available
  ARRAY['https://grupoliberdadecapoeira.com.br/linhagem-mestres/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Besouro Gago ("Besouro the Stutterer") is a minimally documented capoeirista who appears in a single secondary source as one of the teachers of Mestre Waldemar da Liberdade. The Grupo Liberdade Capoeira website lists him alongside Siri de Mangue, Canário Pardo, Zé Talabi, and Ricardo da Ilha de Maré as instructors who taught Waldemar during his training period in Periperi (1936-1940).

However, this claim presents a significant historical discrepancy. In his own 1989 interview, Mestre Waldemar explicitly stated: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four." He did not mention Besouro Gago. This primary source testimony—from Waldemar himself—directly contradicts the claim that Besouro Gago was one of his teachers.

The name "Besouro" (beetle) was a common apelido in capoeira circles during this era, and should not be confused with the legendary Besouro Mangangá (Manoel Henrique Pereira, 1895-1924). The addition of "Gago" (stutterer) distinguishes this person. Nothing is known about his origins, training, or fate.

Given the single-source nature of this claim and its contradiction with Waldemar''s own testimony, the relationship between Besouro Gago and Waldemar should be treated with extreme caution until corroborating evidence emerges.',
  -- bio_pt
  E'Besouro Gago ("Besouro o Gago") é um capoeirista minimamente documentado que aparece em uma única fonte secundária como um dos professores de Mestre Waldemar da Liberdade. O site do Grupo Liberdade Capoeira o lista junto com Siri de Mangue, Canário Pardo, Zé Talabi e Ricardo da Ilha de Maré como instrutores que ensinaram Waldemar durante seu período de treinamento em Periperi (1936-1940).

No entanto, esta afirmação apresenta uma discrepância histórica significativa. Em sua própria entrevista de 1989, Mestre Waldemar declarou explicitamente: "Tive quatro mestres: Siri de Mangue, um; Canário Pardo, dois; Talavi, três e Ricardo de Ilha de Maré, quatro." Ele não mencionou Besouro Gago. Este testemunho de fonte primária—do próprio Waldemar—contradiz diretamente a alegação de que Besouro Gago foi um de seus professores.

O nome "Besouro" era um apelido comum nos círculos de capoeira durante esta época, e não deve ser confundido com o lendário Besouro Mangangá (Manoel Henrique Pereira, 1895-1924). A adição de "Gago" (gago) distingue esta pessoa. Nada se sabe sobre suas origens, treinamento ou destino.

Dada a natureza de fonte única desta afirmação e sua contradição com o próprio testemunho de Waldemar, a relação entre Besouro Gago e Waldemar deve ser tratada com extrema cautela até que evidências corroborativas surjam.',
  -- achievements_en
  NULL,
  -- achievements_pt
  NULL,
  -- notes_en
  E'IDENTITY:
Apelido: "Besouro Gago" (Besouro the Stutterer)
DISTINCT from Besouro Mangangá (Manoel Henrique Pereira, 1895-1924)
Uses apelido_context=''Periperi'' to distinguish from other potential Besouros

SINGLE SOURCE:
Listed ONLY by Grupo Liberdade Capoeira website as teacher of Waldemar
URL: https://grupoliberdadecapoeira.com.br/linhagem-mestres/

PRIMARY SOURCE CONTRADICTION:
Waldemar 1989 interview (velhosmestres.com): "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four."
Besouro Gago NOT mentioned by Waldemar himself.

BIRTH YEAR ESTIMATION (1890, decade):
If teaching in Periperi 1936-1940, likely born ~1880-1900
Using 1890 as midpoint estimate

POSSIBLE EXPLANATIONS FOR DISCREPANCY:
1. Source error on Grupo Liberdade website
2. Besouro Gago taught informally (not counted by Waldemar as one of his "four mestres")
3. Confusion with another practitioner
4. Later oral tradition that Waldemar did not confirm

NOTE: The original backlog entry had "Besouro Gazo" - this was likely a spelling variant; correct Portuguese is "Gago" (stutterer)',
  -- notes_pt
  E'IDENTIDADE:
Apelido: "Besouro Gago"
DISTINTO de Besouro Mangangá (Manoel Henrique Pereira, 1895-1924)
Usa apelido_context=''Periperi'' para distinguir de outros potenciais Besouros

FONTE ÚNICA:
Listado APENAS pelo site do Grupo Liberdade Capoeira como professor de Waldemar
URL: https://grupoliberdadecapoeira.com.br/linhagem-mestres/

CONTRADIÇÃO COM FONTE PRIMÁRIA:
Entrevista de Waldemar 1989 (velhosmestres.com): "Tive quatro mestres: Siri de Mangue, um; Canário Pardo, dois; Talavi, três e Ricardo de Ilha de Maré, quatro."
Besouro Gago NÃO mencionado pelo próprio Waldemar.

ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
Se ensinando em Periperi 1936-1940, provavelmente nascido ~1880-1900
Usando 1890 como estimativa de ponto médio

POSSÍVEIS EXPLICAÇÕES PARA A DISCREPÂNCIA:
1. Erro de fonte no site do Grupo Liberdade
2. Besouro Gago ensinava informalmente (não contado por Waldemar como um de seus "quatro mestres")
3. Confusão com outro praticante
4. Tradição oral posterior que Waldemar não confirmou

NOTA: A entrada original do backlog tinha "Besouro Gazo" - provavelmente uma variante ortográfica; o português correto é "Gago" (gago)'
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
