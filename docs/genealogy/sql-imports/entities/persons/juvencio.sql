-- ============================================================
-- GENEALOGY PERSON: Juvêncio
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Juvêncio was active as a mestre in the late 1930s-early 1940s:
-- - Taught João Pequeno at Fazenda São Pedro (1933-1943)
-- - Held rodas in São Félix when Ananias began learning (1938)
-- - Traíra encountered him in São Félix rodas (~1938)
-- If he was a mature, established mestre in 1938 (aged ~40-50),
-- this places his birth around 1888-1898. Using 1890 as midpoint.
-- ============================================================
-- DISAMBIGUATION:
-- This is Mestre Juvêncio, the dock worker/blacksmith from São Félix
-- and Mata de São João. NOT to be confused with Juvêncio Grosso, a
-- different capoeirista from Santo Amaro who taught Cobrinha Verde.
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
  'Juvêncio',
  'São Félix', -- Context to distinguish from Juvêncio Grosso of Santo Amaro
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-ananias/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the formal Angola/Regional split. His informal roda style—gathering practitioners during festivals without formal classes—represents the authentic communal transmission of capoeira.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão formal Angola/Regional. Seu estilo de roda informal—reunindo praticantes durante festas sem aulas formais—representa a transmissão comunitária autêntica da capoeira.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Recôncavo Baiano, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Juvêncio was a working-class capoeirista from the Recôncavo Baiano who combined his professional trades with informal capoeira instruction. He worked as both a ferreiro (blacksmith) at Fazenda São Pedro in Mata de São João and as an estivador (dock worker) in São Félix—two of the traditional occupations that spread capoeira through Bahia''s coastal and agricultural regions.

In São Félix, a town on the banks of the Paraguaçu River adjacent to Cachoeira, Juvêncio organized rodas on the docks during religious festivals, particularly the celebrations of Igreja de São Deus Menino and Senhor São Félix. According to Mestre Ananias, who began learning in these rodas in 1938: "Juvêncio was the mestre. He was a dock worker who did capoeira on the docks of São Félix... Nobody taught classes, but the real master was Juvêncio, everyone got together and played."

This description captures the informal, communal nature of capoeira transmission in the Recôncavo before the era of formal academies. The roda at São Félix gathered practitioners including João de Zazá, brothers Toy and Roxinho, brothers Alvelino and Santos from Muritiba, Caial, and Estevão—a factory guard at the "Letialvi" cigar factory whom Ananias remembered as having "capoeira perversa" (vicious capoeira). Traíra from Cachoeira and Café also participated in these gatherings.

At Fazenda São Pedro in Mata de São João, Juvêncio worked as a blacksmith and introduced young João Pequeno to capoeira during the decade (1933-1943) João Pequeno spent working on the sugar cane plantation as a cattle herder. This was João Pequeno''s first contact with the art that would define his 79-year teaching career.

Juvêncio represents the bridge generation between the legendary era of Besouro Mangangá (who died in 1924) and the formal academies of Pastinha and Waldemar. Through his informal teaching, he influenced several practitioners who would become major lineage figures: João Pequeno would become one of Pastinha''s two principal heirs; Ananias would found the famous Roda da Praça da República in São Paulo; and Traíra would manage Mestre Waldemar''s roda and record a historic LP.

The fact that Juvêncio worked in multiple locations—Mata de São João (60km north of Salvador on the coast) and São Félix (in the Recôncavo)—reflects the mobility of working-class Bahians who moved between agricultural plantations, river ports, and coastal towns seeking employment. This mobility also helped spread capoeira across the region.',
  -- bio_pt
  E'Juvêncio era um capoeirista da classe trabalhadora do Recôncavo Baiano que combinava seus ofícios profissionais com o ensino informal de capoeira. Trabalhava tanto como ferreiro na Fazenda São Pedro em Mata de São João quanto como estivador em São Félix—duas das ocupações tradicionais que espalharam a capoeira pelas regiões costeiras e agrícolas da Bahia.

Em São Félix, cidade às margens do Rio Paraguaçu, adjacente a Cachoeira, Juvêncio organizava rodas nas docas durante festas religiosas, particularmente as celebrações da Igreja de São Deus Menino e Senhor São Félix. Segundo Mestre Ananias, que começou a aprender nessas rodas em 1938: "Juvêncio era o mestre. Ele era estivador e fazia capoeira na beira do cais de São Félix... Ninguém ensinava, mas o mestre mesmo era o Juvêncio, todo mundo se reunia e pronto."

Esta descrição captura a natureza informal e comunitária da transmissão da capoeira no Recôncavo antes da era das academias formais. A roda em São Félix reunia praticantes incluindo João de Zazá, os irmãos Toy e Roxinho, os irmãos Alvelino e Santos de Muritiba, Caial, e Estevão—um vigia da fábrica de charutos "Letialvi" que Ananias lembrava como tendo "capoeira perversa." Traíra de Cachoeira e Café também participavam desses encontros.

Na Fazenda São Pedro em Mata de São João, Juvêncio trabalhava como ferreiro e apresentou o jovem João Pequeno à capoeira durante a década (1933-1943) que João Pequeno passou trabalhando na plantação de cana-de-açúcar como chamador de boi. Este foi o primeiro contato de João Pequeno com a arte que definiria sua carreira de 79 anos de ensino.

Juvêncio representa a geração-ponte entre a era lendária de Besouro Mangangá (que morreu em 1924) e as academias formais de Pastinha e Waldemar. Através de seu ensino informal, ele influenciou vários praticantes que se tornariam figuras importantes de linhagem: João Pequeno se tornaria um dos dois principais herdeiros de Pastinha; Ananias fundaria a famosa Roda da Praça da República em São Paulo; e Traíra gerenciaria a roda de Mestre Waldemar e gravaria um LP histórico.

O fato de Juvêncio trabalhar em múltiplos locais—Mata de São João (60km ao norte de Salvador na costa) e São Félix (no Recôncavo)—reflete a mobilidade dos baianos da classe trabalhadora que se moviam entre plantações agrícolas, portos fluviais e cidades costeiras em busca de emprego. Esta mobilidade também ajudou a espalhar a capoeira pela região.',
  -- achievements_en
  'First capoeira teacher of Mestre João Pequeno (1933-1943); teacher of Mestre Ananias (1938+); teacher of Mestre Traíra (~1938); organizer of traditional rodas in São Félix during religious festivals; representative of pre-academic capoeira transmission in the Recôncavo',
  -- achievements_pt
  'Primeiro professor de capoeira de Mestre João Pequeno (1933-1943); professor de Mestre Ananias (1938+); professor de Mestre Traíra (~1938); organizador de rodas tradicionais em São Félix durante festas religiosas; representante da transmissão pré-acadêmica da capoeira no Recôncavo',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1890, decade precision):
Juvêncio was active as a mestre in the late 1930s-early 1940s. He taught João Pequeno (1933-1943) and was organizing rodas in São Félix when Ananias began learning (1938). If he was a mature, established mestre in 1938 (aged ~40-50), birth estimate is ~1888-1898. Using 1890 as midpoint.

DEATH: Unknown. No records of his death have been found.

NAME: Full name unknown. Known only by his apelido "Juvêncio."

DISAMBIGUATION:
This is Mestre Juvêncio, the dock worker/blacksmith who worked in São Félix and Mata de São João. He is DISTINCT from Juvêncio Grosso, a different capoeirista from Santo Amaro da Purificação who was listed among Cobrinha Verde''s teachers.

PROFESSIONS:
- Ferreiro (blacksmith) at Fazenda São Pedro, Mata de São João
- Estivador (dock worker) in São Félix

TEACHING LOCATIONS:
- Fazenda São Pedro, Mata de São João (where João Pequeno learned, 1933-1943)
- Docks of São Félix (where Ananias and Traíra learned, ~1938)

STUDENTS:
- João Pequeno (later became one of Pastinha''s two principal heirs)
- Ananias (later founded Roda da Praça da República in São Paulo)
- Traíra (later managed Waldemar''s roda, recorded historic LP)

RODA PARTICIPANTS (São Félix):
- João de Zazá
- Brothers Toy and Roxinho
- Brothers Alvelino and Santos (from Muritiba)
- Caial
- Estevão (cigar factory guard, "capoeira perversa")
- Traíra (from Cachoeira)
- Café (from Cachoeira)

FESTIVALS:
His rodas in São Félix coincided with festivals of Igreja de São Deus Menino and Senhor São Félix.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década):
Juvêncio estava ativo como mestre no final dos anos 1930-início dos anos 1940. Ensinou João Pequeno (1933-1943) e organizava rodas em São Félix quando Ananias começou a aprender (1938). Se era um mestre maduro e estabelecido em 1938 (com ~40-50 anos), estimativa de nascimento é ~1888-1898. Usando 1890 como ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Nome completo desconhecido. Conhecido apenas por seu apelido "Juvêncio."

DESAMBIGUAÇÃO:
Este é Mestre Juvêncio, o estivador/ferreiro que trabalhou em São Félix e Mata de São João. Ele é DISTINTO de Juvêncio Grosso, um capoeirista diferente de Santo Amaro da Purificação que foi listado entre os professores de Cobrinha Verde.

PROFISSÕES:
- Ferreiro na Fazenda São Pedro, Mata de São João
- Estivador em São Félix

LOCAIS DE ENSINO:
- Fazenda São Pedro, Mata de São João (onde João Pequeno aprendeu, 1933-1943)
- Cais de São Félix (onde Ananias e Traíra aprenderam, ~1938)

ALUNOS:
- João Pequeno (posteriormente tornou-se um dos dois principais herdeiros de Pastinha)
- Ananias (posteriormente fundou a Roda da Praça da República em São Paulo)
- Traíra (posteriormente gerenciou a roda de Waldemar, gravou LP histórico)

PARTICIPANTES DA RODA (São Félix):
- João de Zazá
- Irmãos Toy e Roxinho
- Irmãos Alvelino e Santos (de Muritiba)
- Caial
- Estevão (vigia da fábrica de charutos, "capoeira perversa")
- Traíra (de Cachoeira)
- Café (de Cachoeira)

FESTAS:
Suas rodas em São Félix coincidiam com festas da Igreja de São Deus Menino e Senhor São Félix.'
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
