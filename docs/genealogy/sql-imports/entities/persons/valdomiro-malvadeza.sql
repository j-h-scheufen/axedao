-- ============================================================
-- GENEALOGY PERSON: Valdomiro Malvadeza (CECA student)
-- Generated: 2025-12-19
-- ============================================================
-- Student of Mestre Pastinha at CECA (Centro Esportivo de
-- Capoeira Angola). Singer on the historic 1969 LP "Capoeira
-- Angola - Mestre Pastinha e sua academia".
--
-- DISTINCT FROM: José Martins dos Santos "Malvadeza" (Curió's
-- father), who is a separate person already imported with
-- apelido = 'Malvadeza' and no apelido_context.
--
-- This person requires apelido_context = 'CECA student' to
-- distinguish from the other Malvadeza.
--
-- BATERIA PARTICIPATION:
-- Per Mestre Gato Preto's 1999 interview: "Na roda, João
-- Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".
--
-- 1969 LP RECORDING:
-- "Capoeira Angola - Mestre Pastinha e sua academia" (Philips
-- R 765.097 L) - recorded live at Teatro Castro Alves, Salvador.
-- Singers: Mestre Pastinha, Waldomiro Malvadeza, Roberto Satanás.
-- Produced by João Mello. Liner notes by Jorge Amado.
--
-- STILL ACTIVE 1999: Documented in Portal Capoeira chronicle -
-- author played with "Mestre Valdomiro Malvadeza (discípulo de
-- Mestre Pastinha) no Cruzeiro, Pelourinho/Bahia" in 1999.
--
-- BIRTH YEAR ESTIMATION (1930, decade precision):
-- - Active at CECA in 1950s-1960s as adult performer
-- - Recorded on 1969 LP as singer (required adult proficiency)
-- - Still playing in 1999 at ~69 years old (plausible)
-- - Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)
-- - Estimate: ~1930 ± 5 years, using decade precision
--
-- NAME VARIATIONS: Also spelled "Waldomiro Malvadeza" on LP
-- credits and some sources.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown; only "Valdomiro" documented
  'Valdomiro Malvadeza',
  'CECA student', -- Distinguishes from José Martins "Malvadeza" (Curió's father)
  'mestre'::genealogy.title, -- Referred to as "Mestre Valdomiro Malvadeza" in sources
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/pastinha-1969-1', 'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/cronica-a-capoeira-vai-a-luta/']::text[],
  'angola'::genealogy.style,
  E'Trained in the traditional Capoeira Angola style under Mestre Pastinha at CECA. Recognized as a singer (cantador) and bateria player. His voice is preserved on the historic 1969 LP recording alongside Mestre Pastinha.',
  E'Treinado no estilo tradicional de Capoeira Angola sob Mestre Pastinha no CECA. Reconhecido como cantador e tocador de bateria. Sua voz está preservada na histórica gravação do LP de 1969 ao lado de Mestre Pastinha.',
  1930, -- Estimated: active at CECA 1950s-60s, recorded 1969 LP, still playing 1999
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown, likely Salvador or Recôncavo Baiano
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Valdomiro Malvadeza (also spelled Waldomiro) was a student of Mestre Pastinha at the Centro Esportivo de Capoeira Angola (CECA) in the Pelourinho district of Salvador, Bahia. He was part of the generation of angoleiros who trained at CECA during its golden era in the 1950s-1960s, alongside mestres such as João Grande, João Pequeno, Gildo Alfinete, Albertino da Hora, Curió, and Gato Preto.

Valdomiro was recognized for his skills as both a bateria player and a singer (cantador). Mestre Gato Preto, in a 1999 interview, recalled the composition of the bateria at Pastinha''s rodas: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria" ("In the roda, João Pequeno, Moreno, Albertino, Valdomiro, and I made up the bateria"). This places Valdomiro among the core musicians who accompanied the rodas at CECA.

His voice is preserved on one of the most important recordings in capoeira history: the 1969 LP "Capoeira Angola - Mestre Pastinha e sua academia" (Philips R 765.097 L). Recorded live at the Teatro Castro Alves in Salvador, the album featured singing by Mestre Pastinha, Waldomiro Malvadeza, and Roberto Satanás. The liner notes were written by the renowned novelist Jorge Amado, J.B. Colmenero, and Mestre Pastinha himself. The album included traditional ladainhas and capoeira songs, with the bateria consisting of two berimbaus, two pandeiros, agogô, and reco-reco.

Unlike some of his contemporaries, Valdomiro was not among the delegation that traveled to Dakar, Senegal for the First International Festival of Black Arts in April 1966.

Valdomiro remained active in Salvador''s capoeira community for decades. In 1999, according to a chronicle published in Portal Capoeira, the author had "the honor of playing capoeira in 1999 with Mestre Valdomiro Malvadeza (disciple of Mestre Pastinha) at Cruzeiro, Pelourinho/Bahia". The Cruzeiro do São Francisco is the historic location where CECA was originally located (Largo do Cruzeiro de São Francisco), suggesting Valdomiro continued to practice at or near the birthplace of formal Capoeira Angola instruction.

',
  -- bio_pt
  E'Valdomiro Malvadeza (também grafado Waldomiro) foi aluno de Mestre Pastinha no Centro Esportivo de Capoeira Angola (CECA) no bairro do Pelourinho em Salvador, Bahia. Ele fez parte da geração de angoleiros que treinaram no CECA durante sua era dourada nas décadas de 1950-1960, junto com mestres como João Grande, João Pequeno, Gildo Alfinete, Albertino da Hora, Curió e Gato Preto.

Valdomiro era reconhecido por suas habilidades tanto como tocador de bateria quanto como cantador. Mestre Gato Preto, em uma entrevista de 1999, recordou a composição da bateria nas rodas de Pastinha: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria". Isto coloca Valdomiro entre os músicos principais que acompanhavam as rodas no CECA.

Sua voz está preservada em uma das gravações mais importantes da história da capoeira: o LP de 1969 "Capoeira Angola - Mestre Pastinha e sua academia" (Philips R 765.097 L). Gravado ao vivo no Teatro Castro Alves em Salvador, o álbum apresentou canto de Mestre Pastinha, Waldomiro Malvadeza e Roberto Satanás. As notas de capa foram escritas pelo renomado romancista Jorge Amado, J.B. Colmenero e pelo próprio Mestre Pastinha. O álbum incluiu ladainhas tradicionais e cantos de capoeira, com a bateria composta por dois berimbaus, dois pandeiros, agogô e reco-reco.

Diferente de alguns de seus contemporâneos, Valdomiro não estava entre a delegação que viajou para Dakar, Senegal para o Primeiro Festival Internacional de Artes Negras em abril de 1966.

Valdomiro permaneceu ativo na comunidade de capoeira de Salvador por décadas. Em 1999, segundo uma crônica publicada no Portal Capoeira, o autor teve "a honra de jogar capoeira em 1999 com o Mestre Valdomiro Malvadeza (discípulo de Mestre Pastinha) no Cruzeiro, Pelourinho/Bahia". O Cruzeiro do São Francisco é a localização histórica onde o CECA estava originalmente localizado (Largo do Cruzeiro de São Francisco), sugerindo que Valdomiro continuou a praticar no ou próximo ao local de nascimento do ensino formal de Capoeira Angola.

',
  -- achievements_en
  E'Trained under Mestre Pastinha at CECA during its golden era (1950s-1960s)\nSinger on the historic 1969 LP "Capoeira Angola - Mestre Pastinha e sua academia"\nCore bateria player at Pastinha''s rodas alongside João Pequeno, Albertino, and Gato Preto\nStill active as mestre in Salvador''s Pelourinho in 1999',
  -- achievements_pt
  E'Treinou sob Mestre Pastinha no CECA durante sua era dourada (décadas de 1950-1960)\nCantador no histórico LP de 1969 "Capoeira Angola - Mestre Pastinha e sua academia"\nTocador principal de bateria nas rodas de Pastinha junto com João Pequeno, Albertino e Gato Preto\nAinda ativo como mestre no Pelourinho de Salvador em 1999',
  -- notes_en
  E'NAME VARIATIONS:
- "Valdomiro Malvadeza" - common spelling
- "Waldomiro Malvadeza" - LP credits and some sources

DISAMBIGUATION: This is DISTINCT from José Martins dos Santos "Malvadeza" (Curió''s father), a violeiro from Santo Amaro. That person is imported with apelido = ''Malvadeza'' and no context. This entry uses apelido_context = ''CECA student''.

TEACHER: Mestre Pastinha - trained at CECA in Pelourinho

CONTEMPORARIES AT CECA:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Gildo Alfinete
- Roberto Satanás (Roberto Pereira)
- Albertino da Hora (also known as "Moreno")
- Gato Preto (José Gabriel Góes)
- Curió (Jaime Martins dos Santos)
- Bola Sete
- Boca Rica

BATERIA COMPANIONS (per Gato Preto 1999):
- João Pequeno, Moreno (Albertino), Gato Preto

1969 LP RECORDING:
- Title: "Capoeira Angola - Mestre Pastinha e sua academia"
- Label: Philips (R 765.097 L)
- Location: Teatro Castro Alves, Salvador
- Singers: Mestre Pastinha, Waldomiro Malvadeza, Roberto Satanás
- Producer: João Mello
- Liner notes: Jorge Amado, J.B. Colmenero, Mestre Pastinha
- Bateria: Two berimbaus, two pandeiros, agogô, reco-reco

STILL ACTIVE 1999: Played capoeira at Cruzeiro, Pelourinho per Portal Capoeira chronicle.

NOT IN DAKAR 1966: Did not travel to Senegal with Pastinha''s delegation.

BIRTH YEAR ESTIMATION (1930, decade):
- Active at CECA in 1950s-1960s as adult performer
- Recorded on 1969 LP as singer (required adult proficiency)
- Still playing in 1999 at ~69 years old (plausible)
- Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)
- Estimate: ~1930 ± 5 years

DEATH YEAR: Unknown.',
  -- notes_pt
  E'VARIAÇÕES DE NOME:
- "Valdomiro Malvadeza" - grafia comum
- "Waldomiro Malvadeza" - créditos do LP e algumas fontes

DESAMBIGUAÇÃO: Este é DISTINTO de José Martins dos Santos "Malvadeza" (pai de Curió), um violeiro de Santo Amaro. Essa pessoa está importada com apelido = ''Malvadeza'' e sem contexto. Esta entrada usa apelido_context = ''CECA student''.

MESTRE: Mestre Pastinha - treinou no CECA no Pelourinho

CONTEMPORÂNEOS NO CECA:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Gildo Alfinete
- Roberto Satanás (Roberto Pereira)
- Albertino da Hora (também conhecido como "Moreno")
- Gato Preto (José Gabriel Góes)
- Curió (Jaime Martins dos Santos)
- Bola Sete
- Boca Rica

COMPANHEIROS DE BATERIA (conforme Gato Preto 1999):
- João Pequeno, Moreno (Albertino), Gato Preto

GRAVAÇÃO LP 1969:
- Título: "Capoeira Angola - Mestre Pastinha e sua academia"
- Gravadora: Philips (R 765.097 L)
- Local: Teatro Castro Alves, Salvador
- Cantores: Mestre Pastinha, Waldomiro Malvadeza, Roberto Satanás
- Produtor: João Mello
- Notas de capa: Jorge Amado, J.B. Colmenero, Mestre Pastinha
- Bateria: Dois berimbaus, dois pandeiros, agogô, reco-reco

AINDA ATIVO 1999: Jogou capoeira no Cruzeiro, Pelourinho conforme crônica do Portal Capoeira.

NÃO FOI A DAKAR 1966: Não viajou para o Senegal com a delegação de Pastinha.

ESTIMATIVA ANO DE NASCIMENTO (1930, década):
- Ativo no CECA nas décadas de 1950-1960 como performer adulto
- Gravou no LP de 1969 como cantor (requeria proficiência adulta)
- Ainda jogando em 1999 aos ~69 anos (plausível)
- Contemporâneo de Gato Preto (n. 1930), João Grande (n. 1933), Curió (n. 1937)
- Estimativa: ~1930 ± 5 anos

ANO DE MORTE: Desconhecido.'
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
