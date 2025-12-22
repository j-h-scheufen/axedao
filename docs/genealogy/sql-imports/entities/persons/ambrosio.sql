-- ============================================================
-- GENEALOGY PERSON: Ambrósio
-- Generated: 2025-12-21
-- ============================================================
-- Pre-Pastinha era capoeira Angola practitioner from Salvador.
-- Participated in the historic capoeira demonstration at the
-- II Congresso Afro-Brasileiro on January 14, 1937.
-- Listed among those who developed Capoeira Angola before
-- Pastinha's formal leadership.
-- ============================================================
--
-- IDENTITY:
-- - Full Name: Unknown
-- - Apelido: Ambrósio
-- - Title: NULL (no formal title system existed in his era)
--
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- - Active adult participating in II Congresso Afro-Brasileiro in 1937
-- - Listed among practitioners who "developed Capoeira Angola" before
--   Pastinha's era, suggesting established adult practitioner
-- - Contemporary of Samuel Querido de Deus (b.~1880), Barbosa (b.~1900),
--   Zeppelin (b.~1890)
-- - If born ~1890, would be 47 in 1937 - consistent with active
--   participation in public demonstration
-- - Estimated birth 1880-1900, using 1890 as midpoint
--
-- DEATH:
-- - Unknown; no death date recorded in sources
--
-- KEY HISTORICAL ROLE:
-- - 1937: Participated in capoeira Angola demonstration at II
--   Congresso Afro-Brasileiro, Club de Regatas Itapagipe, Salvador
-- - Listed on Mapa da Capoeira as one of those who developed
--   Capoeira Angola alongside Samuel Querido de Deus, Barbosa,
--   Onça Preta, Juvenal, Zeppelin, Neném, Zei, Barroso, Damião
--
-- SOURCES:
-- - Velhos Mestres (velhosmestres.com/br/destaques-38)
-- - Mapa da Capoeira (mapadacapoeira.com.br/descricaopontos.aspx?fk_ponto=14)
-- - Estado da Bahia newspaper (January 1937)
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
  'Ambrósio',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-38', 'https://www.mapadacapoeira.com.br/descricaopontos.aspx?fk_ponto=14']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-modern era capoeira Angola practitioner from Salvador. Active in the 1930s alongside the generation that included Querido de Deus, Barbosa, Onça Preta, Zeppelin, and Juvenal. His participation in the 1937 II Congresso Afro-Brasileiro demonstration indicates he was recognized among the established practitioners of the era.',
  E'Praticante de capoeira Angola da era pré-moderna de Salvador. Ativo na década de 1930 ao lado da geração que incluía Querido de Deus, Barbosa, Onça Preta, Zeppelin e Juvenal. Sua participação na demonstração do II Congresso Afro-Brasileiro de 1937 indica que era reconhecido entre os praticantes estabelecidos da época.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Ambrósio was one of the capoeiristas who participated in the historic demonstration of capoeira de Angola at the II Congresso Afro-Brasileiro (Second Afro-Brazilian Congress) held in Salvador on January 14, 1937. This landmark event, organized by folklorist Edison Carneiro and writer Aydano de Couto Ferraz, brought together intellectuals, researchers, and practitioners of Afro-Brazilian culture for what became a pivotal moment in the documentation and legitimization of capoeira.

The demonstration took place at the basketball court of Club de Regatas Itapagipe in the Ribeira neighborhood of Salvador. The newspaper Estado da Bahia announced that the "vadiação" (capoeira session) would be directed by Samuel Querido de Deus, who was "considered by his peers as the best capoeirista of Bahia." Ambrósio appeared among the listed participants alongside Barbosa, Onça Preta, Juvenal, Zeppelin, Bugaia, Fernandes, Eutíquio, Neném, Zei, Barroso, Arthur Mattos, Raphael, Edgar, Damião, and other practitioners of "the great art of Mangangá."

The II Congresso Afro-Brasileiro marked a turning point for capoeira''s public perception. Following the demonstrations, ethnographer Edison Carneiro and novelist Jorge Amado advocated for the creation of a federation of capoeiristas—an advocacy that helped shift capoeira''s image from a criminalized street practice to a recognized cultural tradition worthy of preservation and study.

Ambrósio belongs to the generation of angoleiros who developed Capoeira Angola before Mestre Pastinha''s formal leadership. The Mapa da Capoeira records that "Capoeira Angola was already being developed by Samuel Querido de Deus, Barbosa, Onça Preta, Juvenal, Zepelim, Neném, Zei, Ambrósio, Barroso, Damião and others" before Pastinha received the berimbau from Amorzinho, Antonio Maré, and Aberrê at the Gengibirra in 1941.

Little else is known about Ambrósio''s personal life. His real name, occupation, teachers, and the details of his life before and after 1937 remain undocumented. What is certain is that he belonged to the cohort of capoeiristas who practiced before the formal academy system emerged—the generation that learned in the streets, at dock areas, during festivals, and in the informal rodas that characterized pre-institutional capoeira in Bahia.',
  -- bio_pt
  E'Ambrósio foi um dos capoeiristas que participou da histórica demonstração de capoeira de Angola no II Congresso Afro-Brasileiro realizado em Salvador em 14 de janeiro de 1937. Este evento marcante, organizado pelo folclorista Edison Carneiro e pelo escritor Aydano de Couto Ferraz, reuniu intelectuais, pesquisadores e praticantes da cultura afro-brasileira no que se tornou um momento fundamental na documentação e legitimação da capoeira.

A demonstração ocorreu na quadra de basquete do Club de Regatas Itapagipe no bairro da Ribeira em Salvador. O jornal Estado da Bahia anunciou que a "vadiação" seria dirigida por Samuel Querido de Deus, que era "considerado por seus pares como o melhor capoeirista da Bahia." Ambrósio apareceu entre os participantes listados ao lado de Barbosa, Onça Preta, Juvenal, Zeppelin, Bugaia, Fernandes, Eutíquio, Neném, Zei, Barroso, Arthur Mattos, Raphael, Edgar, Damião e outros praticantes da "grande arte de Mangangá."

O II Congresso Afro-Brasileiro marcou uma virada na percepção pública da capoeira. Após as demonstrações, o etnógrafo Edison Carneiro e o romancista Jorge Amado advogaram pela criação de uma federação de capoeiristas—uma advocacia que ajudou a mudar a imagem da capoeira de uma prática de rua criminalizada para uma tradição cultural reconhecida digna de preservação e estudo.

Ambrósio pertence à geração de angoleiros que desenvolveu a Capoeira Angola antes da liderança formal de Mestre Pastinha. O Mapa da Capoeira registra que "A Capoeira Angola já vinha sendo desenvolvida por Samuel Querido de Deus, Barbosa, Onça Preta, Juvenal, Zepelim, Neném, Zei, Ambrósio, Barroso, Damião e outros" antes de Pastinha receber o berimbau de Amorzinho, Antonio Maré e Aberrê na Gengibirra em 1941.

Pouco mais se sabe sobre a vida pessoal de Ambrósio. Seu nome verdadeiro, ocupação, mestres e os detalhes de sua vida antes e depois de 1937 permanecem não documentados. O que é certo é que ele pertencia ao grupo de capoeiristas que praticavam antes do surgimento do sistema formal de academias—a geração que aprendeu nas ruas, em áreas portuárias, durante festivais e nas rodas informais que caracterizavam a capoeira pré-institucional na Bahia.',
  -- Achievements
  E'Participated in capoeira de Angola demonstration at II Congresso Afro-Brasileiro (January 14, 1937)
Part of the generation that developed Capoeira Angola before Pastinha''s formal leadership (pre-1941)
Listed among established practitioners in historical documentation by Edison Carneiro',
  E'Participou da demonstração de capoeira de Angola no II Congresso Afro-Brasileiro (14 de janeiro de 1937)
Parte da geração que desenvolveu a Capoeira Angola antes da liderança formal de Pastinha (antes de 1941)
Listado entre os praticantes estabelecidos na documentação histórica de Edison Carneiro',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade precision):
- Active adult participating in II Congresso Afro-Brasileiro demonstration in 1937
- Listed among those who "developed Capoeira Angola" before Pastinha''s leadership (pre-1941), suggesting established adult practitioner by mid-1930s
- Contemporary of Samuel Querido de Deus (b.~1880), Barbosa (b.~1900), Zeppelin (b.~1890)
- If born ~1890, would be 47 in 1937 - consistent with active participation and community standing
- Estimated birth 1880-1900, using 1890 as midpoint

DEATH: Unknown. No death date recorded in any sources consulted.

FULL NAME: Unknown. All sources refer only to "Ambrósio."

TITLE: No formal title recorded. The modern mestre/contra-mestre system did not exist in his era. He was a practicing capoeirista (vadiador) but there is no evidence he ran his own roda or had formal students.

CONTEMPORARIES AT 1937 CONGRESS:
The following participated alongside Ambrósio in the II Congresso Afro-Brasileiro demonstration:
- Samuel Querido de Deus (director of the exhibition)
- Barbosa (informant for Carneiro)
- Onça Preta
- Juvenal
- Zeppelin (informant for Carneiro)
- Bugaia
- Fernandes
- Eutíquio
- Neném
- Zei
- Barroso
- Arthur Mattos
- Raphael
- Edgar
- Damião

MAPA DA CAPOEIRA REFERENCE:
The official Centro Esportivo de Capoeira Angola de Mestre Pastinha registry lists Ambrósio among those who developed Capoeira Angola before Pastinha assumed leadership in 1941.

SOURCES:
- Velhos Mestres (velhosmestres.com/br/destaques-38) - primary source
- Mapa da Capoeira (mapadacapoeira.com.br) - CECA history
- Estado da Bahia newspaper (January 1937) - contemporary account',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, precisão de década):
- Adulto ativo participando da demonstração no II Congresso Afro-Brasileiro em 1937
- Listado entre os que "desenvolveram a Capoeira Angola" antes da liderança de Pastinha (antes de 1941), sugerindo praticante adulto estabelecido em meados dos anos 1930
- Contemporâneo de Samuel Querido de Deus (n.~1880), Barbosa (n.~1900), Zeppelin (n.~1890)
- Se nascido ~1890, teria 47 anos em 1937 - consistente com participação ativa e prestígio na comunidade
- Nascimento estimado 1880-1900, usando 1890 como ponto médio

MORTE: Desconhecida. Nenhuma data de morte registrada nas fontes consultadas.

NOME COMPLETO: Desconhecido. Todas as fontes referem-se apenas a "Ambrósio."

TÍTULO: Nenhum título formal registrado. O sistema moderno de mestre/contra-mestre não existia em sua era. Era um capoeirista praticante (vadiador) mas não há evidência de que mantinha sua própria roda ou tinha alunos formais.

CONTEMPORÂNEOS NO CONGRESSO DE 1937:
Os seguintes participaram ao lado de Ambrósio na demonstração do II Congresso Afro-Brasileiro:
- Samuel Querido de Deus (diretor da exibição)
- Barbosa (informante de Carneiro)
- Onça Preta
- Juvenal
- Zeppelin (informante de Carneiro)
- Bugaia
- Fernandes
- Eutíquio
- Neném
- Zei
- Barroso
- Arthur Mattos
- Raphael
- Edgar
- Damião

REFERÊNCIA DO MAPA DA CAPOEIRA:
O registro oficial do Centro Esportivo de Capoeira Angola de Mestre Pastinha lista Ambrósio entre os que desenvolveram a Capoeira Angola antes de Pastinha assumir a liderança em 1941.

FONTES:
- Velhos Mestres (velhosmestres.com/br/destaques-38) - fonte principal
- Mapa da Capoeira (mapadacapoeira.com.br) - história do CECA
- Jornal Estado da Bahia (janeiro de 1937) - relato contemporâneo'
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
