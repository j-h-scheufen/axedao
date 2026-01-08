-- ============================================================
-- GENEALOGY PERSON: Juvêncio Grosso
-- Generated: 2026-01-03
-- ============================================================
-- DISAMBIGUATION:
-- This is Juvêncio Grosso from Santo Amaro da Purificação, one of
-- Cobrinha Verde's teachers. He is DISTINCT from Mestre Juvêncio
-- (apelido_context: 'São Félix'), the dock worker/blacksmith who
-- taught João Pequeno, Ananias, and Traíra in São Félix.
-- ============================================================
-- BIRTH YEAR ESTIMATION (1880, decade precision):
-- Juvêncio Grosso was active as a teacher when Cobrinha Verde
-- learned from him (after Besouro's death in 1924). Cobrinha Verde
-- (b. 1912) was 12 in 1924. If Juvêncio was an established teacher
-- by then (aged ~40-50), birth estimate is ~1874-1884. Using 1880.
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
  NULL, -- Full name unknown; known only by apelido
  'Juvêncio Grosso',
  NULL, -- No context needed; apelido is unique
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/cobrinha-1916', 'https://capoeira.online/history/mestres/cobrinha-verde/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the formal Angola/Regional split.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão formal Angola/Regional.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Juvêncio Grosso was a capoeirista from Santo Amaro da Purificação in the Recôncavo Baiano, active during the early 20th century. He is known from Mestre Cobrinha Verde''s autobiographical testimony, in which Cobrinha Verde listed the many mestres from whom he learned capoeira in his hometown.

Cobrinha Verde stated: "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."

Beyond this mention, no further biographical information has been found about Juvêncio Grosso. His presence in this list of Santo Amaro mestres places him among the generation contemporary with the legendary Besouro Mangangá (c. 1895-1924). The "Grosso" (thick/big) in his apelido likely referred to a physical characteristic.

Juvêncio Grosso represents the informal, pre-academy era of capoeira transmission in the Recôncavo Baiano, where young capoeiristas like Cobrinha Verde learned from multiple mestres in the community rather than a single formal teacher.',
  -- bio_pt
  E'Juvêncio Grosso era um capoeirista de Santo Amaro da Purificação no Recôncavo Baiano, ativo durante o início do século XX. Ele é conhecido pelo testemunho autobiográfico de Mestre Cobrinha Verde, no qual Cobrinha Verde listou os muitos mestres com quem aprendeu capoeira em sua cidade natal.

Cobrinha Verde declarou: "Aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um por um: Maitá (que até tinha um samba com nome dele), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."

Além desta menção, nenhuma outra informação biográfica foi encontrada sobre Juvêncio Grosso. Sua presença nesta lista de mestres de Santo Amaro o coloca entre a geração contemporânea do lendário Besouro Mangangá (c. 1895-1924). O "Grosso" em seu apelido provavelmente se referia a uma característica física.

Juvêncio Grosso representa a era informal e pré-academia da transmissão da capoeira no Recôncavo Baiano, onde jovens capoeiristas como Cobrinha Verde aprendiam de múltiplos mestres na comunidade ao invés de um único professor formal.',
  -- achievements_en
  'Teacher of Mestre Cobrinha Verde in Santo Amaro da Purificação; contemporary of Besouro Mangangá',
  -- achievements_pt
  'Professor de Mestre Cobrinha Verde em Santo Amaro da Purificação; contemporâneo de Besouro Mangangá',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1880, decade precision):
Active as a teacher when Cobrinha Verde (b. 1912) learned from him after Besouro''s death (1924). If he was an established teacher by then (aged ~40-50), birth estimate is ~1874-1884. Using 1880 as midpoint.

DEATH: Unknown. No records of his death have been found.

NAME: Full name unknown. Known only by his apelido "Juvêncio Grosso". The "Grosso" likely refers to a physical characteristic (thick, big).

DISAMBIGUATION:
This is Juvêncio Grosso from Santo Amaro da Purificação, one of Cobrinha Verde''s teachers. He is DISTINCT from Mestre Juvêncio (apelido_context: "São Félix"), the dock worker/blacksmith who taught João Pequeno, Ananias, and Traíra in São Félix.

The two Juvêncios were:
1. Juvêncio Grosso (this profile) - Santo Amaro, taught Cobrinha Verde, contemporary with Besouro (~1910s-1920s)
2. Mestre Juvêncio (São Félix) - São Félix/Mata de São João, dock worker/blacksmith, taught João Pequeno, Ananias, Traíra (~1930s-1940s)

STUDENTS:
- Cobrinha Verde (one of many teachers in Santo Amaro)

CONTEMPORARIES (other Santo Amaro teachers per Cobrinha Verde''s testimony):
- Maitá
- Licurí
- Joité
- Dendê
- Gasolina
- Siri de Mangue
- Doze Homens
- Esperidião
- Espinho Remoso
- Neco Canário Pardo

SOURCE LIMITATIONS:
Only known from Cobrinha Verde''s autobiographical testimony. No independent documentation has been found. Profile represents minimal documentation for genealogy tracking purposes.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década):
Ativo como professor quando Cobrinha Verde (n. 1912) aprendeu com ele após a morte de Besouro (1924). Se era um professor estabelecido na época (com ~40-50 anos), estimativa de nascimento é ~1874-1884. Usando 1880 como ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Nome completo desconhecido. Conhecido apenas por seu apelido "Juvêncio Grosso". O "Grosso" provavelmente se refere a uma característica física.

DESAMBIGUAÇÃO:
Este é Juvêncio Grosso de Santo Amaro da Purificação, um dos professores de Cobrinha Verde. Ele é DISTINTO de Mestre Juvêncio (apelido_context: "São Félix"), o estivador/ferreiro que ensinou João Pequeno, Ananias e Traíra em São Félix.

Os dois Juvêncios eram:
1. Juvêncio Grosso (este perfil) - Santo Amaro, ensinou Cobrinha Verde, contemporâneo de Besouro (~1910s-1920s)
2. Mestre Juvêncio (São Félix) - São Félix/Mata de São João, estivador/ferreiro, ensinou João Pequeno, Ananias, Traíra (~1930s-1940s)

ALUNOS:
- Cobrinha Verde (um de muitos professores em Santo Amaro)

CONTEMPORÂNEOS (outros professores de Santo Amaro por testemunho de Cobrinha Verde):
- Maitá
- Licurí
- Joité
- Dendê
- Gasolina
- Siri de Mangue
- Doze Homens
- Esperidião
- Espinho Remoso
- Neco Canário Pardo

LIMITAÇÕES DE FONTE:
Conhecido apenas pelo testemunho autobiográfico de Cobrinha Verde. Nenhuma documentação independente foi encontrada. Perfil representa documentação mínima para fins de rastreamento genealógico.'
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
