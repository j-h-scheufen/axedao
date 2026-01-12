-- ============================================================
-- GENEALOGY PERSON: Chita
-- Generated: 2026-01-09
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1920 (decade precision)
-- Chita was an expert capoeirista at Mestre Waldemar's barracão in
-- 1953-1954, described among "snakes, experts." If 25-40 when at
-- peak expertise, suggests birth ~1913-1929. Using 1920 as midpoint.
-- ============================================================
-- NOTE: This is Chita from Salvador/Waldemar's roda. A different
-- Mestre Chita (Itamar da Conceição Magalhães, d. 2020) trained
-- under Baleardo in São Gonçalo/Niterói, Rio de Janeiro area.
-- Also distinct from "Mestre Chita" of São Paulo's Praça da República.
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
  'Chita',
  'Waldemar roda', -- Context to distinguish from other Chitas
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
  E'Chita was one of the expert capoeiristas who trained at Mestre Waldemar''s legendary barracão in the Liberdade neighborhood of Salvador during the early 1950s.

In a 1989 interview, Mestre João Grande recalled the atmosphere at Waldemar''s roda: "I always went to Waldemar''s. It got heated. My god! The guys were all snakes there. Evanir, Tatá, Bom Cabelo, Chita, Macário, Sete Molas, Zacarias." All were described as "extremely good."

João Grande specifically mentioned Chita among those he particularly enjoyed watching play: "And of the newer ones, from 1950 on, I liked seeing Waldemar''s students: Diogo, Chita, Evanir." He also recalled playing with Chita directly: "I went to play with Chita, Macário, Diogo; those guys were good!"

Chita was part of a circle of skilled practitioners who made Waldemar''s barracão one of the most challenging places for young capoeiristas in Salvador. Beyond his inclusion in João Grande''s testimony, no other biographical details about Chita have been documented. His story survives as part of the collective memory of Waldemar''s legendary Sunday rodas.',
  -- bio_pt
  E'Chita foi um dos capoeiristas experts que treinavam no lendário barracão de Mestre Waldemar no bairro da Liberdade em Salvador durante o início dos anos 1950.

Em uma entrevista de 1989, Mestre João Grande relembrou a atmosfera na roda de Waldemar: "Eu sempre ia na de Waldemar. Pegava fogo. Meu Deus! Ali só tinha cobra. Evanir, Tatá, Bom Cabelo, Chita, Macário, Sete Molas, Zacarias." Todos foram descritos como "extremamente bons."

João Grande mencionou especificamente Chita entre aqueles que gostava particularmente de ver jogar: "E dos mais novos, de 1950 pra cá, eu gostava de ver os alunos de Waldemar: Diogo, Chita, Evanir." Ele também recordou jogar diretamente com Chita: "Eu ia jogar com Chita, Macário, Diogo; esses caras eram bons!"

Chita fazia parte de um círculo de praticantes habilidosos que faziam do barracão de Waldemar um dos lugares mais desafiadores para jovens capoeiristas em Salvador. Além de sua inclusão no testemunho de João Grande, nenhum outro detalhe biográfico sobre Chita foi documentado. Sua história sobrevive como parte da memória coletiva das lendárias rodas de domingo de Waldemar.',
  -- achievements_en
  NULL,
  -- achievements_pt
  NULL,
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Chita was an expert capoeirista at Mestre Waldemar''s barracão in 1953-1954, described among "snakes, experts." If 25-40 when at peak expertise, suggests birth ~1913-1929. Using 1920 as midpoint with decade precision.

NAME:
Only known as "Chita" - no full name or title documented. Not referred to as "Mestre."

DISAMBIGUATION:
- This Chita is from Salvador, Bahia and trained at Waldemar''s barracão in the 1950s
- DIFFERENT from Mestre Chita (Itamar da Conceição Magalhães, d. December 13, 2020) who trained under Baleardo in São Gonçalo/Niterói (Rio de Janeiro area)
- DIFFERENT from "Mestre Chita" of São Paulo who frequented Praça da República rodas with Ananias and Joel

TRAINING COMPANIONS at Waldemar''s roda (per João Grande 1989 testimony):
- Evanir, Tatá, Bom Cabelo (José Cabelo Bom), Macário, Sete Molas, Zacarias Boa Morte, Diogo

SOURCE:
Primary documentation comes from João Grande''s 1989 interview, published on Capoeira Connection (interview conducted September 1, 2004 by Poloca; translated by Shayna McHugh October 2005). Also referenced on velhosmestres.com in Zacarias Boa Morte profile.

OPEN QUESTIONS:
- Death date unknown
- Full civil name unknown
- Whether he continued in capoeira after the mid-1950s',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1920, década):
Chita era um capoeirista expert no barracão de Mestre Waldemar em 1953-1954, descrito entre "cobras, peritos." Se tinha 25-40 anos no auge da expertise, sugere nascimento ~1913-1929. Usando 1920 como ponto médio com precisão de década.

NOME:
Conhecido apenas como "Chita" - nenhum nome completo ou título documentado. Não referido como "Mestre."

DESAMBIGUAÇÃO:
- Este Chita é de Salvador, Bahia e treinou no barracão de Waldemar nos anos 1950
- DIFERENTE de Mestre Chita (Itamar da Conceição Magalhães, f. 13 de dezembro de 2020) que treinou com Baleardo em São Gonçalo/Niterói (área do Rio de Janeiro)
- DIFERENTE de "Mestre Chita" de São Paulo que frequentava as rodas da Praça da República com Ananias e Joel

COMPANHEIROS DE TREINO na roda de Waldemar (per testemunho de João Grande 1989):
- Evanir, Tatá, Bom Cabelo (José Cabelo Bom), Macário, Sete Molas, Zacarias Boa Morte, Diogo

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
