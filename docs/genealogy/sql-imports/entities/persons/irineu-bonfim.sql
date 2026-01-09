-- ============================================================
-- GENEALOGY PERSON: Irineu (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930, decade precision):
-- Irineu was the first student of Mário Buscapé at the Cavan company in the
-- early 1950s in Rio de Janeiro. He and his brothers Zé Grande and Deraldo
-- came from Bahia. Irineu must have been old enough to work at Cavan when he
-- met Mário. By 1953 when Bonfim was founded, he was skilled enough to be
-- a co-founder. Estimating birth around 1930 places him in his early 20s at
-- founding—consistent with the timeline of his brothers (~1930 estimates).
-- ============================================================
-- NOTE: No title (mestre/professor) found in sources. His brothers Zé Grande
-- and Deraldo became mestres and co-leaders of Bonfim from 1969. Irineu is
-- only mentioned as first student and co-founder, not as instructor or leader.
-- ============================================================
-- APELIDO CONTEXT: "Bonfim" distinguishes him as the Irineu from the Bonfim
-- lineage in Rio de Janeiro, in case other persons named Irineu are imported.
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
  'Irineu dos Santos',
  'Irineu',
  'Bonfim', -- Distinguishes from other potential Irineu entries
  NULL, -- No title confirmed in sources
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era
  E'Irineu learned capoeira directly from Mário Buscapé in the early 1950s, making him the first recipient of the Bahian Recôncavo tradition that Mário brought to Rio de Janeiro. No details about his individual style have survived in the historical record.',
  E'Irineu aprendeu capoeira diretamente com Mário Buscapé no início dos anos 1950, tornando-se o primeiro receptor da tradição do Recôncavo Baiano que Mário trouxe para o Rio de Janeiro. Nenhum detalhe sobre seu estilo individual sobreviveu no registro histórico.',
  -- Life dates
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil', -- From Bahia like his brothers, exact location unknown
  NULL, -- Unknown
  NULL,
  NULL,
  -- bio_en
  E'Irineu dos Santos holds a unique place in the history of capoeira in Rio de Janeiro as the very first student of Mestre Mário Buscapé. A native of Bahia, Irineu came to Rio de Janeiro in the early 1950s along with his brothers Zé Grande and Deraldo—all from the dos Santos family, but unrelated to their future teacher Mário dos Santos (Mário Buscapé) despite sharing the same surname.

The encounter that would help establish one of the four founding lineages of contemporary capoeira in Rio occurred at the Cavan company, which manufactured lamp posts for use throughout the city. Mário Buscapé worked there for many years after arriving from Bahia. It was at Cavan that Mário met Irineu and began teaching him "the first steps of capoeira."

Through Irineu, Mário quickly won other followers to practice capoeira, including Irineu''s brothers Zé Grande and Deraldo. As historian André Lacé documented, these initial students formed the core group that would transform Rio''s capoeira landscape. On January 6, 1953, they founded the Associação Cultural Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in the neighborhood of São Cristóvão. As Lacé wrote: "They didn''t stay there for long, because the space became small due to the large number of students. They moved the academy to the neighborhood of Olaria, a spacious and pleasant place, and there they never stopped, training great capoeiristas."

While his brothers Zé Grande and Deraldo went on to become mestres and take over leadership of Grupo Bonfim when Mário returned to Bahia in 1969, the historical record is silent about Irineu''s subsequent career. His brothers are mentioned in the testimony of their students—Mestre Gary (Mestre 22) and Mestre Soldado, among others—but Irineu does not appear in these later accounts. Whether he continued practicing capoeira, relocated, or simply preferred a quieter role in the group''s development remains unknown.

What is certain is Irineu''s foundational role: he was the bridge that connected Mário Buscapé to the dos Santos brothers, enabling the transmission of Bahian capoeira traditions to a new generation in Rio de Janeiro. Without Irineu''s initial receptivity to Mário''s teaching at Cavan, the Bonfim lineage—one of the four that historians credit with shaping contemporary capoeira in Rio—might never have emerged.',
  -- bio_pt
  E'Irineu dos Santos ocupa um lugar único na história da capoeira no Rio de Janeiro como o primeiro aluno de Mestre Mário Buscapé. Natural da Bahia, Irineu veio para o Rio de Janeiro no início dos anos 1950 junto com seus irmãos Zé Grande e Deraldo—todos da família dos Santos, mas sem parentesco com seu futuro professor Mário dos Santos (Mário Buscapé), apesar de compartilharem o mesmo sobrenome.

O encontro que ajudaria a estabelecer uma das quatro linhagens fundadoras da capoeira contemporânea no Rio ocorreu na empresa Cavan, que fabricava postes de luz para uso em toda a cidade. Mário Buscapé trabalhou lá por muitos anos após chegar da Bahia. Foi na Cavan que Mário conheceu Irineu e começou a ensinar-lhe "os primeiros passos da capoeira."

Através de Irineu, Mário rapidamente conquistou outros seguidores para praticar capoeira, incluindo os irmãos de Irineu, Zé Grande e Deraldo. Como o historiador André Lacé documentou, esses alunos iniciais formaram o grupo central que transformaria o cenário da capoeira no Rio. Em 6 de janeiro de 1953, fundaram a Associação Cultural Bonfim, também conhecida como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço no bairro de São Cristóvão. Como Lacé escreveu: "Não ficaram lá por muito tempo, porque o espaço ficou pequeno devido ao grande número de alunos. Mudaram a academia para o bairro de Olaria, um lugar espaçoso e agradável, e lá nunca pararam, treinando grandes capoeiristas."

Enquanto seus irmãos Zé Grande e Deraldo se tornaram mestres e assumiram a liderança do Grupo Bonfim quando Mário retornou à Bahia em 1969, o registro histórico silencia sobre a carreira subsequente de Irineu. Seus irmãos são mencionados no depoimento de seus alunos—Mestre Gary (Mestre 22) e Mestre Soldado, entre outros—mas Irineu não aparece nesses relatos posteriores. Se ele continuou praticando capoeira, se mudou, ou simplesmente preferiu um papel mais discreto no desenvolvimento do grupo permanece desconhecido.

O que é certo é o papel fundamental de Irineu: ele foi a ponte que conectou Mário Buscapé aos irmãos dos Santos, possibilitando a transmissão das tradições da capoeira baiana para uma nova geração no Rio de Janeiro. Sem a receptividade inicial de Irineu ao ensino de Mário na Cavan, a linhagem Bonfim—uma das quatro que os historiadores creditam como formadoras da capoeira contemporânea no Rio—poderia nunca ter surgido.',
  -- achievements_en
  'First student of Mestre Mário Buscapé in Rio de Janeiro; Co-founder of Associação Cultural Bonfim (January 6, 1953); Bridge figure who connected Mário Buscapé to the dos Santos brothers',
  -- achievements_pt
  'Primeiro aluno de Mestre Mário Buscapé no Rio de Janeiro; Co-fundador da Associação Cultural Bonfim (6 de janeiro de 1953); Figura de ligação que conectou Mário Buscapé aos irmãos dos Santos',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1930, decade):
Irineu met Mário Buscapé at the Cavan company in the early 1950s. He must have been old enough to work at an industrial company (lamp post manufacturer) at that time—likely late teens or early 20s. By January 6, 1953, he was skilled enough to be a co-founder of Grupo Bonfim. Estimating birth around 1930 places him in his early 20s at founding, consistent with his brothers Zé Grande and Deraldo (also ~1930 estimates).

FULL NAME: Irineu dos Santos. He was from the dos Santos family (same as brothers Zé Grande and Deraldo), from Bahia. NOT related to Mário dos Santos (Mário Buscapé) despite the same surname.

TITLE STATUS: No title (mestre, professor, etc.) was found in any sources. His brothers Zé Grande and Deraldo are consistently referred to as "Mestre," but Irineu is only described as "first student" and co-founder. This may indicate:
1. He did not achieve mestre status
2. He left capoeira before becoming mestre
3. The historical record simply lost track of his development

HISTORICAL SILENCE: Irineu disappears from the historical record after the founding of Bonfim (1953). His brothers appear in testimonies from Mestre Gary (1957 onwards) and Mestre Soldado (1970s), but Irineu is never mentioned as a teacher or leader. When Mário Buscapé returned to Bahia in 1969, only Zé Grande and Deraldo are credited with taking over leadership.

TEACHERS:
- Mário Buscapé (primary, early 1950s, Cavan company, Rio de Janeiro)

STUDENTS:
- None documented

GROUP FOUNDING:
- Co-founded Associação Cultural Bonfim: January 6, 1953 (with Mário Buscapé, Zé Grande, Deraldo)

SOURCES:
All information comes from the capoeirahistory.com article on Mário Buscapé, which is the only source that mentions Irineu by name. The article draws on historian André Lacé''s research.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Irineu conheceu Mário Buscapé na empresa Cavan no início dos anos 1950. Ele deve ter idade suficiente para trabalhar em uma empresa industrial (fabricante de postes de luz) naquela época—provavelmente no final da adolescência ou início dos 20 anos. Em 6 de janeiro de 1953, ele era habilidoso o suficiente para ser co-fundador do Grupo Bonfim. Estimar nascimento por volta de 1930 o coloca no início dos 20 anos na fundação, consistente com seus irmãos Zé Grande e Deraldo (também estimativas de ~1930).

NOME COMPLETO: Irineu dos Santos. Ele era da família dos Santos (mesma dos irmãos Zé Grande e Deraldo), da Bahia. NÃO é parente de Mário dos Santos (Mário Buscapé) apesar do mesmo sobrenome.

STATUS DE TÍTULO: Nenhum título (mestre, professor, etc.) foi encontrado em qualquer fonte. Seus irmãos Zé Grande e Deraldo são consistentemente referidos como "Mestre," mas Irineu é descrito apenas como "primeiro aluno" e co-fundador. Isso pode indicar:
1. Ele não alcançou o status de mestre
2. Ele deixou a capoeira antes de se tornar mestre
3. O registro histórico simplesmente perdeu o rastro de seu desenvolvimento

SILÊNCIO HISTÓRICO: Irineu desaparece do registro histórico após a fundação do Bonfim (1953). Seus irmãos aparecem em depoimentos de Mestre Gary (1957 em diante) e Mestre Soldado (anos 1970), mas Irineu nunca é mencionado como professor ou líder. Quando Mário Buscapé retornou à Bahia em 1969, apenas Zé Grande e Deraldo são creditados com assumir a liderança.

MESTRES:
- Mário Buscapé (principal, início dos anos 1950, empresa Cavan, Rio de Janeiro)

ALUNOS:
- Nenhum documentado

FUNDAÇÃO DO GRUPO:
- Co-fundou Associação Cultural Bonfim: 6 de janeiro de 1953 (com Mário Buscapé, Zé Grande, Deraldo)

FONTES:
Todas as informações vêm do artigo de capoeirahistory.com sobre Mário Buscapé, que é a única fonte que menciona Irineu pelo nome. O artigo baseia-se na pesquisa do historiador André Lacé.'
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
