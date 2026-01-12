-- ============================================================
-- GENEALOGY PERSON: Aranha (Artur Emídio)
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1940, decade precision):
-- Active at Artur Emídio's academy and playing berimbau at Zé Pedro's
-- roda in the 1970s. Musicians/practitioners typically 25-45 during
-- prime activity. If active ~1965-1975, birth ~1925-1950.
-- Using ~1940 as midpoint estimate.
--
-- APELIDO CONTEXT: "Artur Emídio" - distinguishes from other Aranhas:
-- - Aranha (Niterói) = Crespiniano Bonifácio de Andrade, b. 1959
-- - Indio Aranha = student of Mestre Paraná
-- - Aranha (Minas Gerais/Colombia) = Joelson Borges de Oliveira
--
-- SOURCE: André Lacé photo collection; capoeirahistory.com documentation
-- of historic photos from Artur Emídio's academy and Zé Pedro's roda.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Aranha',
  'Artur Emídio',
  NULL,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-artur-emidio-1930-2011/', 'https://capoeirahistory.com/the-roda-at-ze-pedros/']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Trained at Artur Emídio''s academy in Bonsucesso, Rio de Janeiro. Known as a berimbau player at Zé Pedro''s legendary Sunday rodas in the 1970s.',
  E'Treinou na academia de Artur Emídio em Bonsucesso, Rio de Janeiro. Conhecido como tocador de berimbau nas lendárias rodas de domingo de Zé Pedro nos anos 1970.',
  -- Life dates
  1940,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Aranha was a capoeirista active in Rio de Janeiro during the 1960s and 1970s who trained at Mestre Artur Emídio''s academy in Bonsucesso—one of the first formal capoeira academies in the city.

He appears in a historic photograph from the André Lacé collection showing Mestre Artur Emídio''s female students distributing a cordel (traditional Brazilian poetry pamphlet). The photo caption from Capoeira History identifies the gathering as featuring "some of the biggest names in capoeira," including Mintirinha, Aranha, Zé Pedro (berimbau), Djalma (pandeiro), Silas, Celso, Luiz Malhado, Cigano, Artur Emídio, André Lacé, and Preguiça.

Aranha was known as a berimbau player and participated in the legendary Sunday rodas at Zé Pedro''s space on Rua Uranos, 497 in Bonsucesso. These weekly gatherings, which ran from 1973 to 1979, became a crucial meeting point for capoeiristas from across Rio de Janeiro. As documented by Capoeira History, the roda brought together practitioners from "the suburbs, the northern and the southern zones," creating what Mestre Paulão described as "an eclectic capoeira."

At these rodas, Aranha played berimbau alongside other musicians including Zé Pedro (also berimbau), Djalma (pandeiro), and Silas (atabaque). André Lacé made a radio broadcast for Rádio Roquette Pinto in 1975 that documented the musicality of these gatherings.

The Sunday roda at Artur Emídio''s academy and the subsequent roda at Zé Pedro''s played a crucial role in the development of Contemporary Capoeira in Rio de Janeiro, serving as a meeting point where masters from all over Brazil—including renowned berimbau players like Mestres Paraná and Mucungê—would gather and exchange techniques and traditions.

Little is known about Aranha''s biography beyond his presence in these historic photos and rodas. His full name, title, and other biographical details remain undocumented in available sources.',
  -- bio_pt
  E'Aranha foi um capoeirista ativo no Rio de Janeiro durante os anos 1960 e 1970 que treinou na academia de Mestre Artur Emídio em Bonsucesso—uma das primeiras academias formais de capoeira da cidade.

Ele aparece em uma fotografia histórica da coleção de André Lacé mostrando as alunas de Mestre Artur Emídio distribuindo um cordel. A legenda da foto do Capoeira History identifica o encontro como apresentando "alguns dos maiores nomes da capoeira," incluindo Mintirinha, Aranha, Zé Pedro (berimbau), Djalma (pandeiro), Silas, Celso, Luiz Malhado, Cigano, Artur Emídio, André Lacé e Preguiça.

Aranha era conhecido como tocador de berimbau e participava das lendárias rodas de domingo no espaço de Zé Pedro na Rua Uranos, 497 em Bonsucesso. Esses encontros semanais, que ocorreram de 1973 a 1979, tornaram-se um ponto de encontro crucial para capoeiristas de todo o Rio de Janeiro. Como documentado pelo Capoeira History, a roda reunia praticantes "dos subúrbios, das zonas norte e sul," criando o que Mestre Paulão descreveu como "uma capoeira eclética."

Nessas rodas, Aranha tocava berimbau junto com outros músicos incluindo Zé Pedro (também berimbau), Djalma (pandeiro) e Silas (atabaque). André Lacé fez uma transmissão de rádio para a Rádio Roquette Pinto em 1975 que documentou a musicalidade desses encontros.

A roda de domingo na academia de Artur Emídio e a roda subsequente em Zé Pedro tiveram papel crucial no desenvolvimento da Capoeira Contemporânea no Rio de Janeiro, servindo como ponto de encontro onde mestres de todo o Brasil—incluindo renomados tocadores de berimbau como Mestres Paraná e Mucungê—se reuniam para trocar técnicas e tradições.

Pouco se sabe sobre a biografia de Aranha além de sua presença nessas fotos e rodas históricas. Seu nome completo, título e outros detalhes biográficos permanecem não documentados nas fontes disponíveis.',
  -- achievements_en
  E'Featured in historic photo at Artur Emídio''s academy (André Lacé collection); Berimbau player at Zé Pedro''s legendary Sunday rodas (1973-1979); Part of the foundational generation of Contemporary Capoeira in Rio de Janeiro',
  -- achievements_pt
  E'Presente em foto histórica na academia de Artur Emídio (coleção André Lacé); Tocador de berimbau nas lendárias rodas de domingo de Zé Pedro (1973-1979); Parte da geração fundacional da Capoeira Contemporânea no Rio de Janeiro',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1940, decade precision):
- Active at Artur Emídio''s academy and Zé Pedro''s roda 1960s-1970s
- Musicians/practitioners typically 25-45 during prime activity
- Estimate: born ~1925-1950, using 1940 as midpoint

NAME DISAMBIGUATION:
Multiple capoeiristas share the apelido "Aranha":
- Aranha (Artur Emídio) = THIS ENTRY - Rio de Janeiro, 1960s-70s, Artur Emídio lineage
- Aranha (Niterói) = Crespiniano Bonifácio de Andrade, b. 1959, Samanco/Vieira lineage
- Indio Aranha = Student of Mestre Paraná, separate person
- Aranha (Minas Gerais) = Joelson Borges de Oliveira, founded Nativos in Colombia

RODA LOCATION: Rua Uranos, 497, Bonsucesso, Rio de Janeiro

HISTORIC PHOTO (André Lacé Collection):
- Setting: Artur Emídio''s academy
- Event: Female students distributing cordel
- People identified (standing): Mintirinha, Aranha, Zé Pedro (berimbau), Djalma (pandeiro), Silas, Celso
- People identified (crouched): Luiz Malhado, Cigano, Artur Emídio, André Lacé, Preguiça

ZÉ PEDRO''S RODA MUSICIANS:
- Aranha (berimbau)
- Zé Pedro (berimbau)
- Djalma (pandeiro)
- Silas (atabaque)

MEDIA APPEARANCES:
- 1975: Radio broadcast by André Lacé for Rádio Roquette Pinto documenting Zé Pedro''s roda

LIMITED DOCUMENTATION:
- No full name found
- No formal title documented
- No birth/death dates confirmed
- Single primary source: capoeirahistory.com via André Lacé collection',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1940, precisão de década):
- Ativo na academia de Artur Emídio e na roda de Zé Pedro nos anos 1960-70
- Músicos/praticantes tipicamente 25-45 durante período de atividade principal
- Estimativa: nascido ~1925-1950, usando 1940 como ponto médio

DESAMBIGUAÇÃO DE NOME:
Múltiplos capoeiristas compartilham o apelido "Aranha":
- Aranha (Artur Emídio) = ESTA ENTRADA - Rio de Janeiro, anos 1960-70, linhagem Artur Emídio
- Aranha (Niterói) = Crespiniano Bonifácio de Andrade, n. 1959, linhagem Samanco/Vieira
- Indio Aranha = Aluno de Mestre Paraná, pessoa separada
- Aranha (Minas Gerais) = Joelson Borges de Oliveira, fundou Nativos na Colômbia

LOCAL DA RODA: Rua Uranos, 497, Bonsucesso, Rio de Janeiro

FOTO HISTÓRICA (Coleção André Lacé):
- Cenário: Academia de Artur Emídio
- Evento: Alunas distribuindo cordel
- Pessoas identificadas (em pé): Mintirinha, Aranha, Zé Pedro (berimbau), Djalma (pandeiro), Silas, Celso
- Pessoas identificadas (agachados): Luiz Malhado, Cigano, Artur Emídio, André Lacé, Preguiça

MÚSICOS DA RODA DE ZÉ PEDRO:
- Aranha (berimbau)
- Zé Pedro (berimbau)
- Djalma (pandeiro)
- Silas (atabaque)

APARIÇÕES NA MÍDIA:
- 1975: Transmissão de rádio por André Lacé para Rádio Roquette Pinto documentando a roda de Zé Pedro

DOCUMENTAÇÃO LIMITADA:
- Nome completo não encontrado
- Título formal não documentado
- Datas de nascimento/morte não confirmadas
- Fonte primária única: capoeirahistory.com via coleção André Lacé'
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
