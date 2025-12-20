-- ============================================================
-- GENEALOGY PERSON: Zeppelin
-- Generated: 2025-12-20
-- ============================================================
-- Pre-Pastinha era capoeira Angola practitioner from Salvador.
-- Key informant for Edison Carneiro's 1937 "Negros Bantus" research.
-- Participated in the historic capoeira demonstration at the
-- II Congresso Afro-Brasileiro on January 14, 1937.
-- ============================================================
--
-- IDENTITY:
-- - Full Name: Unknown
-- - Apelido: Zeppelin (also spelled "Zepelim" in Portuguese)
-- - Title: NULL (no formal title system existed in his era)
--
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- - Active adult participating in II Congresso Afro-Brasileiro in 1937
-- - Named as informant for Edison Carneiro's research (required
--   maturity and standing in the community)
-- - Contemporary of Samuel Querido de Deus (b.~1880) and Barbosa (b.~1900)
-- - If born ~1890, would be 47 in 1937 - consistent with active
--   participation and recognition as informant
-- - Estimated birth 1880-1900, using 1890 as midpoint
--
-- DEATH:
-- - Unknown; no death date recorded in sources
--
-- KEY HISTORICAL ROLE:
-- - 1937: Participated in capoeira Angola demonstration at II
--   Congresso Afro-Brasileiro, Club de Regatas Itapagipe, Salvador
-- - 1937: Featured in Edison Carneiro's "Negros Bantus" as informant
--   on capoeira de Angola, listed alongside Querido de Deus and Barbosa
-- - Listed on Mapa da Capoeira alongside Ambrósio, Barroso, Neném,
--   Zei, Damião and other pre-Pastinha era practitioners
--
-- SOURCES:
-- - Velhos Mestres (velhosmestres.com/br/destaques-38)
-- - Estado da Bahia newspaper (January 1937)
-- - Edison Carneiro, "Negros Bantus" (1937)
-- - Capoeira History (capoeirahistory.com)
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
  NULL,
  'Zeppelin',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-38']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-modern era capoeira Angola practitioner from Salvador. Active in the 1930s alongside the generation that included Querido de Deus, Barbosa, Onça Preta, and Juvenal. His prominence is indicated by Edison Carneiro''s inclusion of him as an informant on capoeira de Angola in "Negros Bantus" (1937), where his name appears immediately after Querido de Deus and Barbosa.',
  E'Praticante de capoeira Angola da era pré-moderna de Salvador. Ativo na década de 1930 ao lado da geração que incluía Querido de Deus, Barbosa, Onça Preta e Juvenal. Sua proeminência é indicada pela inclusão por Edison Carneiro como informante sobre capoeira de Angola em "Negros Bantus" (1937), onde seu nome aparece imediatamente após Querido de Deus e Barbosa.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Zeppelin was one of the capoeiristas who participated in the historic demonstration of capoeira de Angola at the II Congresso Afro-Brasileiro held in Salvador on January 14, 1937. This landmark event, organized by folklorist Edison Carneiro and writer Aydano de Couto Ferraz, brought together intellectuals, researchers, and practitioners of Afro-Brazilian culture for what became a pivotal moment in the documentation and legitimization of capoeira.

The demonstration took place at the basketball court of Club de Regatas Itapagipe in the Ribeira neighborhood. Samuel "Querido de Deus," considered by his peers as the best capoeirista in Bahia, directed the exhibition. The newspaper Estado da Bahia described the participants in the "vadiação" as including Barbosa, Onça Preta, Juvenal, Zeppelin, Bugaia, Fernandes, Eutíquio, Neném, Zei, Ambrósio, Barroso, Arthur Mattos, Raphael, Edgar, Damião, and other practitioners of "the great art of Mangangá."

Zeppelin''s significance extends beyond his participation in this single event. Edison Carneiro included him as one of the key informants on capoeira de Angola in his groundbreaking book "Negros Bantus" (1937), which contains the first in-depth scholarly study of capoeira. In the preface, Carneiro acknowledged the "most efficient assistance" he received from "Samuel ''Querido de Deus,'' Barbosa and Zeppelin, regarding capoeira de Angola." That Zeppelin''s name appears alongside these two giants of early capoeira suggests he held considerable standing in the community of practitioners.

The II Congresso Afro-Brasileiro marked a turning point in how Brazilian intellectuals and the government viewed capoeira. Following the demonstrations by Querido de Deus, Zeppelin, and their companions, ethnographer Edison Carneiro and novelist Jorge Amado advocated for the creation of a federation of capoeiristas. This advocacy helped shift capoeira''s image from a criminalized street practice to a recognized cultural tradition worthy of preservation and study.

Little else is known about Zeppelin''s personal life. His apelido (nickname), which evokes the famous German airships of the era, suggests he may have acquired the name during the 1920s-1930s when zeppelins captured the public imagination. His real name, occupation, teachers, and the details of his life before and after 1937 remain undocumented.

What is certain is that Zeppelin belonged to the generation of angoleiros who practiced capoeira before the formal academy system emerged—before Pastinha''s Centro Esportivo de Capoeira Angola (1941) and even before Bimba''s Regional systematization gained widespread acceptance. These were the capoeiristas who learned in the streets, at dock areas, during festivals, and in the informal rodas that characterized pre-institutional capoeira.',
  -- bio_pt
  E'Zeppelin foi um dos capoeiristas que participou da histórica demonstração de capoeira de Angola no II Congresso Afro-Brasileiro realizado em Salvador em 14 de janeiro de 1937. Este evento marcante, organizado pelo folclorista Edison Carneiro e pelo escritor Aydano de Couto Ferraz, reuniu intelectuais, pesquisadores e praticantes da cultura afro-brasileira no que se tornou um momento fundamental na documentação e legitimação da capoeira.

A demonstração ocorreu na quadra de basquete do Club de Regatas Itapagipe no bairro da Ribeira. Samuel "Querido de Deus," considerado por seus pares como o melhor capoeirista da Bahia, dirigiu a exibição. O jornal Estado da Bahia descreveu os participantes da "vadiação" incluindo Barbosa, Onça Preta, Juvenal, Zeppelin, Bugaia, Fernandes, Eutíquio, Neném, Zei, Ambrósio, Barroso, Arthur Mattos, Raphael, Edgar, Damião e outros praticantes da "grande arte de Mangangá."

A importância de Zeppelin vai além de sua participação neste único evento. Edison Carneiro o incluiu como um dos principais informantes sobre capoeira de Angola em seu livro pioneiro "Negros Bantus" (1937), que contém o primeiro estudo acadêmico aprofundado sobre capoeira. No prefácio, Carneiro reconheceu a "mais eficiente assistência" que recebeu de "Samuel ''Querido de Deus,'' Barbosa e Zeppelin, sobre a capoeira de Angola." O fato de o nome de Zeppelin aparecer ao lado destes dois gigantes da capoeira antiga sugere que ele tinha considerável prestígio na comunidade de praticantes.

O II Congresso Afro-Brasileiro marcou uma virada na forma como intelectuais brasileiros e o governo viam a capoeira. Após as demonstrações de Querido de Deus, Zeppelin e seus companheiros, o etnógrafo Edison Carneiro e o romancista Jorge Amado advogaram pela criação de uma federação de capoeiristas. Esta advocacia ajudou a mudar a imagem da capoeira de uma prática de rua criminalizada para uma tradição cultural reconhecida digna de preservação e estudo.

Pouco mais se sabe sobre a vida pessoal de Zeppelin. Seu apelido, que evoca os famosos dirigíveis alemães da época, sugere que ele pode ter adquirido o nome durante os anos 1920-1930 quando os zepelins capturavam a imaginação pública. Seu nome verdadeiro, ocupação, mestres e os detalhes de sua vida antes e depois de 1937 permanecem não documentados.

O que é certo é que Zeppelin pertencia à geração de angoleiros que praticavam capoeira antes do surgimento do sistema formal de academias—antes do Centro Esportivo de Capoeira Angola de Pastinha (1941) e até mesmo antes da sistematização Regional de Bimba ganhar ampla aceitação. Estes eram os capoeiristas que aprenderam nas ruas, em áreas portuárias, durante festivais e nas rodas informais que caracterizavam a capoeira pré-institucional.',
  -- Achievements
  E'Participated in capoeira de Angola demonstration at II Congresso Afro-Brasileiro (January 14, 1937)
Featured as informant on capoeira de Angola in Edison Carneiro''s "Negros Bantus" (1937)
Listed alongside Samuel Querido de Deus and Barbosa as key contributor to Carneiro''s capoeira research
Part of the historic group that helped legitimize capoeira through academic documentation',
  E'Participou da demonstração de capoeira de Angola no II Congresso Afro-Brasileiro (14 de janeiro de 1937)
Destacado como informante sobre capoeira de Angola em "Negros Bantus" de Edison Carneiro (1937)
Listado ao lado de Samuel Querido de Deus e Barbosa como contribuidor-chave para a pesquisa de Carneiro sobre capoeira
Parte do grupo histórico que ajudou a legitimar a capoeira através da documentação acadêmica',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade precision):
- Active adult participating in II Congresso Afro-Brasileiro demonstration in 1937
- Named as informant for Edison Carneiro''s "Negros Bantus" (1937), requiring maturity and standing in the community
- Contemporary of Samuel Querido de Deus (b.~1880, died ~1947) and Barbosa (b.~1900)
- If born ~1890, would be 47 in 1937 - consistent with active participation and recognition
- Estimated birth 1880-1900, using 1890 as midpoint

DEATH: Unknown. No death date recorded in any sources consulted.

FULL NAME: Unknown. All sources refer only to "Zeppelin" or "Zepelim" (Portuguese spelling).

APELIDO ORIGIN: The name "Zeppelin" likely derives from the famous German airships that captivated public imagination in the 1920s-1930s. The Graf Zeppelin made a highly publicized visit to Brazil in 1930, which may have inspired the nickname.

SPELLING VARIATIONS:
- "Zeppelin" - English/German spelling
- "Zepelim" - Portuguese spelling (used in Estado da Bahia newspaper and some sources)

TITLE: No formal title recorded. The modern mestre/contra-mestre system did not exist in his era. He was a practicing capoeirista (vadiador) but there is no evidence he ran his own roda or had formal students.

CONTEMPORARIES AT 1937 CONGRESS:
The following participated alongside Zeppelin in the II Congresso Afro-Brasileiro demonstration:
- Samuel Querido de Deus (director of the exhibition)
- Barbosa (also informant for Carneiro)
- Onça Preta
- Juvenal
- Bugaia
- Fernandes
- Eutíquio
- Neném
- Zei
- Ambrósio
- Barroso
- Arthur Mattos
- Raphael
- Edgar
- Damião

CARNEIRO ACKNOWLEDGMENT:
Edison Carneiro wrote in "Negros Bantus": "the most efficient assistance [...] from Samuel ''Querido de Deus,'' Barbosa and Zeppelin, regarding capoeira de Angola."
This indicates Zeppelin was among the top three capoeira informants for this seminal research.

SOURCES:
- Velhos Mestres (velhosmestres.com/br/destaques-38) - primary source
- Estado da Bahia newspaper (January 1937) - contemporary account
- Edison Carneiro, "Negros Bantus" (1937) - acknowledgments
- Capoeira History (capoeirahistory.com) - context',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, precisão de década):
- Adulto ativo participando da demonstração no II Congresso Afro-Brasileiro em 1937
- Citado como informante para "Negros Bantus" de Edison Carneiro (1937), exigindo maturidade e prestígio na comunidade
- Contemporâneo de Samuel Querido de Deus (n.~1880, m.~1947) e Barbosa (n.~1900)
- Se nascido ~1890, teria 47 anos em 1937 - consistente com participação ativa e reconhecimento
- Nascimento estimado 1880-1900, usando 1890 como ponto médio

MORTE: Desconhecida. Nenhuma data de morte registrada nas fontes consultadas.

NOME COMPLETO: Desconhecido. Todas as fontes referem-se apenas a "Zeppelin" ou "Zepelim."

ORIGEM DO APELIDO: O nome "Zeppelin" provavelmente deriva dos famosos dirigíveis alemães que cativaram a imaginação pública nos anos 1920-1930. O Graf Zeppelin fez uma visita altamente divulgada ao Brasil em 1930, o que pode ter inspirado o apelido.

VARIAÇÕES DE GRAFIA:
- "Zeppelin" - grafia em inglês/alemão
- "Zepelim" - grafia em português (usada no jornal Estado da Bahia e algumas fontes)

TÍTULO: Nenhum título formal registrado. O sistema moderno de mestre/contra-mestre não existia em sua era. Era um capoeirista praticante (vadiador) mas não há evidência de que mantinha sua própria roda ou tinha alunos formais.

CONTEMPORÂNEOS NO CONGRESSO DE 1937:
Os seguintes participaram ao lado de Zeppelin na demonstração do II Congresso Afro-Brasileiro:
- Samuel Querido de Deus (diretor da exibição)
- Barbosa (também informante de Carneiro)
- Onça Preta
- Juvenal
- Bugaia
- Fernandes
- Eutíquio
- Neném
- Zei
- Ambrósio
- Barroso
- Arthur Mattos
- Raphael
- Edgar
- Damião

RECONHECIMENTO DE CARNEIRO:
Edison Carneiro escreveu em "Negros Bantus": "a mais eficiente assistência [...] de Samuel ''Querido de Deus,'' Barbosa e Zeppelin, sobre a capoeira de Angola."
Isto indica que Zeppelin estava entre os três principais informantes de capoeira para esta pesquisa seminal.

FONTES:
- Velhos Mestres (velhosmestres.com/br/destaques-38) - fonte principal
- Jornal Estado da Bahia (janeiro de 1937) - relato contemporâneo
- Edison Carneiro, "Negros Bantus" (1937) - agradecimentos
- Capoeira History (capoeirahistory.com) - contexto'
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
