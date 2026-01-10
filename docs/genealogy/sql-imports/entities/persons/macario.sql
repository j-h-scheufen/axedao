-- ============================================================
-- GENEALOGY PERSON: Macário
-- Generated: 2026-01-09
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1920 (decade precision)
-- Macário was an expert capoeirista at Mestre Waldemar's barracão in
-- 1953-1954, described among "snakes, experts." If 25-40 when at
-- peak expertise, suggests birth ~1913-1929. Using 1920 as midpoint.
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown
  'Macário',
  NULL, -- No title documented
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/en/featured-44', 'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-joao-grande/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place not documented
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Macário was one of the expert capoeiristas who trained at Mestre Waldemar''s legendary barracão in the Liberdade neighborhood of Salvador during the early 1950s.

In a 1989 interview, Mestre João Grande recalled the atmosphere at Waldemar''s roda: "I always went to Waldemar''s. It got heated. My god! The guys were all snakes there. Evanir, Tatá, Bom Cabelo, Chita, Macário, Sete Molas, Zacarias." All were described as "extremely good."

João Grande specifically remembered playing with Macário: "I went to play with Chita, Macário, Diogo; those guys were good!" This direct recollection places Macário among the skilled practitioners who tested João Grande during his formative years at Waldemar''s roda.

Macário was part of a circle of expert capoeiristas who made Waldemar''s barracão one of the most challenging places for young players in Salvador. Beyond his inclusion in João Grande''s testimony, no other biographical details about Macário have been documented. His story survives as part of the collective memory of Waldemar''s legendary Sunday rodas.',
  -- bio_pt
  E'Macário foi um dos capoeiristas experts que treinavam no lendário barracão de Mestre Waldemar no bairro da Liberdade em Salvador durante o início dos anos 1950.

Em uma entrevista de 1989, Mestre João Grande relembrou a atmosfera na roda de Waldemar: "Eu sempre ia na de Waldemar. Pegava fogo. Meu Deus! Ali só tinha cobra. Evanir, Tatá, Bom Cabelo, Chita, Macário, Sete Molas, Zacarias." Todos foram descritos como "extremamente bons."

João Grande lembrou especificamente de jogar com Macário: "Eu ia jogar com Chita, Macário, Diogo; esses caras eram bons!" Esta recordação direta coloca Macário entre os praticantes habilidosos que testaram João Grande durante seus anos de formação na roda de Waldemar.

Macário fazia parte de um círculo de capoeiristas experts que faziam do barracão de Waldemar um dos lugares mais desafiadores para jovens jogadores em Salvador. Além de sua inclusão no testemunho de João Grande, nenhum outro detalhe biográfico sobre Macário foi documentado. Sua história sobrevive como parte da memória coletiva das lendárias rodas de domingo de Waldemar.',
  -- achievements_en
  NULL,
  -- achievements_pt
  NULL,
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Macário was an expert capoeirista at Mestre Waldemar''s barracão in 1953-1954, described among "snakes, experts." If 25-40 when at peak expertise, suggests birth ~1913-1929. Using 1920 as midpoint with decade precision.

NAME:
Only known as "Macário" - no full name or title documented. Not referred to as "Mestre."

NOTE: In some transcriptions, "Chita Macário" appears to run together, but the velhosmestres.com source confirms they are two separate individuals listed in enumeration.

TRAINING COMPANIONS at Waldemar''s roda (per João Grande 1989 testimony):
- Evanir, Tatá, Bom Cabelo (José Cabelo Bom), Chita, Sete Molas, Zacarias Boa Morte, Diogo

SOURCE:
Primary documentation comes from João Grande''s 1989 interview, published on Capoeira Connection (interview conducted September 1, 2004 by Poloca; translated by Shayna McHugh October 2005). Also referenced on velhosmestres.com in Zacarias Boa Morte profile.

OPEN QUESTIONS:
- Death date unknown
- Full civil name unknown
- Whether he continued in capoeira after the mid-1950s',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1920, década):
Macário era um capoeirista expert no barracão de Mestre Waldemar em 1953-1954, descrito entre "cobras, peritos." Se tinha 25-40 anos no auge da expertise, sugere nascimento ~1913-1929. Usando 1920 como ponto médio com precisão de década.

NOME:
Conhecido apenas como "Macário" - nenhum nome completo ou título documentado. Não referido como "Mestre."

NOTA: Em algumas transcrições, "Chita Macário" aparece junto, mas a fonte velhosmestres.com confirma que são dois indivíduos separados listados em enumeração.

COMPANHEIROS DE TREINO na roda de Waldemar (per testemunho de João Grande 1989):
- Evanir, Tatá, Bom Cabelo (José Cabelo Bom), Chita, Sete Molas, Zacarias Boa Morte, Diogo

FONTE:
Documentação primária vem da entrevista de João Grande de 1989, publicada no Capoeira Connection (entrevista conduzida em 1 de setembro de 2004 por Poloca; traduzida por Shayna McHugh em outubro de 2005). Também referenciado em velhosmestres.com no perfil de Zacarias Boa Morte.

QUESTÕES EM ABERTO:
- Data de morte desconhecida
- Nome civil completo desconhecido
- Se continuou na capoeira após meados dos anos 1950'
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
