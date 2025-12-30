-- ============================================================
-- GENEALOGY PERSON: Auvelino
-- Generated: 2025-12-15
-- ============================================================
-- EXTREMELY LIMITED DOCUMENTATION:
-- Auvelino is mentioned only in connection with teaching Bigodinho
-- the berimbau in 1950 when he arrived in Salvador. No full name,
-- birth/death dates, teachers, or other students are documented.
-- Described as "legendary berimbau master" but unclear if he was
-- a formal capoeira mestre or primarily an instrumentalist/craftsman.
--
-- BIRTH YEAR ESTIMATION:
-- If active as a "master" teacher in 1950, likely born 1900-1920.
-- Using 1910 as midpoint estimate with decade precision.
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
  NULL, -- Full name unknown
  'Auvelino',
  'Salvador', -- Context to distinguish from Alvelino of São Félix/Muritiba
  NULL, -- Title uncertain - may not have been formal mestre
  NULL, -- No portrait available
  NULL, -- No stable public links
  -- Capoeira-specific
  NULL, -- Style uncertain - berimbau mastery predates Angola/Regional split
  NULL,
  NULL,
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Auvelino was a berimbau master active in Salvador in the mid-20th century. He is remembered primarily for teaching Bigodinho (Reinaldo Santana) the art of the berimbau when the young man arrived in Salvador in 1950.

Sources describe Auvelino as a "legendary berimbau master" who welcomed Bigodinho and taught him "the secrets of the art of this instrument". This instruction proved foundational—Bigodinho would become renowned for his berimbau playing and singing throughout his career.

Beyond this connection to Bigodinho, virtually nothing is documented about Auvelino''s life. We do not know his full name, where he came from, who taught him, or whether he had other notable students. The designation "mestre" appears in some sources but it is unclear whether this was a formal capoeira title or simply recognition of his berimbau expertise.

Auvelino represents the many skilled practitioners and craftsmen who transmitted capoeira knowledge without leaving formal documentation—figures whose contributions survive only in the memories and skills of those they taught.',
  -- bio_pt
  E'Auvelino era um mestre de berimbau ativo em Salvador em meados do século XX. É lembrado principalmente por ensinar Bigodinho (Reinaldo Santana) a arte do berimbau quando o jovem chegou em Salvador em 1950.

As fontes descrevem Auvelino como um "lendário mestre de berimbau" que acolheu Bigodinho e lhe ensinou "os segredos da arte deste instrumento". Essa instrução provou ser fundamental—Bigodinho se tornaria renomado por seu toque de berimbau e canto ao longo de sua carreira.

Além dessa conexão com Bigodinho, praticamente nada está documentado sobre a vida de Auvelino. Não sabemos seu nome completo, de onde veio, quem o ensinou, ou se teve outros alunos notáveis. A designação "mestre" aparece em algumas fontes, mas não está claro se era um título formal de capoeira ou simplesmente reconhecimento de sua expertise com o berimbau.

Auvelino representa os muitos praticantes e artesãos habilidosos que transmitiram conhecimento da capoeira sem deixar documentação formal—figuras cujas contribuições sobrevivem apenas nas memórias e habilidades daqueles que ensinaram.',
  -- achievements_en
  E'Taught Bigodinho (Reinaldo Santana) the berimbau (1950)
Described as "legendary berimbau master" in Salvador',
  -- achievements_pt
  E'Ensinou berimbau a Bigodinho (Reinaldo Santana) (1950)
Descrito como "lendário mestre de berimbau" em Salvador',
  -- Researcher notes (English)
  E'DOCUMENTATION STATUS: Extremely limited. Auvelino appears only in biographical accounts of Mestre Bigodinho.

SOURCES:
- Lalaue (lalaue.com/learn-capoeira/mestre-bigodinho/)
- Nossa Tribo (nossa-tribo.com/mestre-bigodinho/)
These are the only sources that mention Auvelino by name.

WHAT WE KNOW:
1. Active in Salvador circa 1950
2. Described as "legendary berimbau master" or "mestre de berimbau"
3. Taught Bigodinho the berimbau when he arrived in Salvador in 1950
4. Bigodinho met him in the Cabula area of Salvador

WHAT WE DON''T KNOW:
- Full name
- Birth/death dates or locations
- Teachers or lineage
- Other students
- Whether "mestre" was a formal capoeira title
- Whether he played capoeira or was primarily an instrumentalist/craftsman
- Any connection to other documented capoeiristas of the era

BIRTH YEAR ESTIMATION:
If teaching Bigodinho (born 1933) as a "master" in 1950, Auvelino was likely at least 30-50 years old at that time, suggesting birth between 1900-1920. Used 1910 with decade precision.

DISTINCT FROM:
Alvelino (from Muritiba) - different person who participated in São Félix rodas with Juvêncio and his brother Santos. That Alvelino is from a different location and time context.

CONFIDENCE: Uncertain - only documented through secondary sources describing Bigodinho''s training.',
  -- Researcher notes (Portuguese)
  E'STATUS DA DOCUMENTAÇÃO: Extremamente limitado. Auvelino aparece apenas em relatos biográficos de Mestre Bigodinho.

FONTES:
- Lalaue (lalaue.com/learn-capoeira/mestre-bigodinho/)
- Nossa Tribo (nossa-tribo.com/mestre-bigodinho/)
Essas são as únicas fontes que mencionam Auvelino pelo nome.

O QUE SABEMOS:
1. Ativo em Salvador por volta de 1950
2. Descrito como "lendário mestre de berimbau" ou "mestre de berimbau"
3. Ensinou berimbau a Bigodinho quando ele chegou em Salvador em 1950
4. Bigodinho o conheceu na área do Cabula em Salvador

O QUE NÃO SABEMOS:
- Nome completo
- Datas ou locais de nascimento/morte
- Mestres ou linhagem
- Outros alunos
- Se "mestre" era um título formal de capoeira
- Se jogava capoeira ou era principalmente instrumentista/artesão
- Qualquer conexão com outros capoeiristas documentados da época

ESTIMATIVA DO ANO DE NASCIMENTO:
Se estava ensinando Bigodinho (nascido em 1933) como "mestre" em 1950, Auvelino provavelmente tinha pelo menos 30-50 anos naquela época, sugerindo nascimento entre 1900-1920. Usado 1910 com precisão de década.

DISTINTO DE:
Alvelino (de Muritiba) - pessoa diferente que participava das rodas de São Félix com Juvêncio e seu irmão Santos. Esse Alvelino é de um local e contexto temporal diferente.

CONFIANÇA: Incerta - documentado apenas através de fontes secundárias descrevendo o treinamento de Bigodinho.'
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
