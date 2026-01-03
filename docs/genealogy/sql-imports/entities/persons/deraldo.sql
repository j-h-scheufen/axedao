-- ============================================================
-- GENEALOGY PERSON: Deraldo
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930, decade precision):
-- Deraldo was a brother of Zé Grande and Irineu dos Santos, all from Bahia.
-- They came to Rio in the early 1950s. Deraldo was already established as
-- an instructor by 1957 when Gary (age 12) began training at Bonfim. He
-- became co-leader of the group in 1969 when Mário Buscapé returned to Bahia.
-- Estimating birth around 1930 places him in his early 20s when Bonfim was
-- founded in 1953—consistent with being skilled enough to co-found a group.
-- ============================================================
-- NOTE: This Deraldo (dos Santos family, Bonfim/Rio) is DIFFERENT from
-- Mestre Deraldo Ferreira (Santos, São Paulo), who teaches Capoeira Angola
-- in Cambridge, Massachusetts, and was certified by Mestre João Pequeno.
-- These are TWO SEPARATE PEOPLE with the same apelido.
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
  NULL, -- Full name unknown; from the dos Santos family
  'Deraldo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/', 'https://capoeirahistory.com/master-soldado/', 'https://capoeirahistory.com/the-penha-roda/', 'https://capoeiraliberdade.net.br/view/historia.php']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era
  E'Deraldo learned capoeira from Mário Buscapé, who brought Bahian Recôncavo traditions to Rio de Janeiro. Like his brother Zé Grande, his style was practical and competitive, emphasizing training high-level fighters who excelled in Rio''s competitions from the mid-1960s. He was part of the "dangerous" era of capoeira in the 1960s-70s, characterized by constant headbutts and rasteiras, without uniforms or cords. Mestre Gary recalled this period as one where practitioners wore normal clothing and identified simply as "capoeira players."',
  E'Deraldo aprendeu capoeira com Mário Buscapé, que trouxe as tradições do Recôncavo Baiano para o Rio de Janeiro. Como seu irmão Zé Grande, seu estilo era prático e competitivo, enfatizando o treinamento de lutadores de alto nível que se destacavam nas competições do Rio a partir de meados dos anos 1960. Ele fazia parte da era "perigosa" da capoeira nos anos 1960-70, caracterizada por cabeçadas e rasteiras constantes, sem uniformes ou cordas. Mestre Gary recordava este período como uma época em que os praticantes usavam roupas normais e se identificavam simplesmente como "jogadores de capoeira."',
  -- Life dates
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil', -- From Bahia like his brothers, exact location unknown
  NULL, -- Status unknown; no death confirmation found
  NULL,
  NULL,
  -- bio_en
  E'Deraldo was one of the foundational figures in establishing the Bonfim capoeira lineage in Rio de Janeiro. A native of Bahia, he came to Rio de Janeiro in the early 1950s along with his brothers Irineu dos Santos and Zé Grande—all from the dos Santos family, unrelated to their teacher Mário dos Santos (Mário Buscapé) despite sharing the same surname.

When Mário Buscapé began teaching capoeira at the Cavan company where he worked, Irineu was his first student. Through Irineu, Mário soon won other followers, including Zé Grande and Deraldo. On January 6, 1953, they founded the Associação Cultural Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in the neighborhood of São Cristóvão. As historian André Lacé wrote: "They didn''t stay there for long, because the space became small due to the large number of students. They moved the academy to the neighborhood of Olaria, a spacious and pleasant place, and there they never stopped, training great capoeiristas."

The Bonfim group, led by Mário Buscapé, became famous in Rio de Janeiro for training high-level competitors who often won the competitions that began being organized in the city from the mid-1960s.

In 1969, when Mário Buscapé returned to Bahia, Deraldo and his brother Zé Grande took over leadership of the Bonfim group. While Zé Grande served as president, Deraldo was instrumental in the daily teaching operations. The group''s headquarters was later established in the Bonsucesso neighborhood, and it continued to flourish under their direction.

Deraldo was directly responsible for graduating Mestre Soldado in 1973. According to Mestre Soldado''s testimony, at age 18 he "started training with Mestres Deraldo and Zé Grande (the president of the Bonfim group)" at the main headquarters in Bonsucesso. "In 1973, Soldado graduated from Mestre Deraldo and began teaching for the group," creating the Santa Barbara nucleus in the Bandeira 2 community in Del Castilho, where he taught until 1980.

Mestre Gary (Mestre 22), who began training at Bonfim in 1957 at age 12, learned from both Deraldo and Zé Grande. Recalling the capoeira scene of the 1960s and 70s, Gary listed the prominent capoeiristas: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—and myself, Mestre 22 da Bonfim."

Deraldo, along with his brother Zé Grande, Mestres Dentinho, and Mintirinha, is credited as one of the initiators of the capoeira roda at the Festa da Penha. By the 1970s, this roda established itself as one of the main street rodas in Rio de Janeiro, taking place during the festival month (October-November).',
  -- bio_pt
  E'Deraldo foi uma das figuras fundamentais no estabelecimento da linhagem de capoeira Bonfim no Rio de Janeiro. Natural da Bahia, ele veio para o Rio de Janeiro no início dos anos 1950 junto com seus irmãos Irineu dos Santos e Zé Grande—todos da família dos Santos, sem parentesco com seu professor Mário dos Santos (Mário Buscapé) apesar de compartilharem o mesmo sobrenome.

Quando Mário Buscapé começou a ensinar capoeira na empresa Cavan onde trabalhava, Irineu foi seu primeiro aluno. Através de Irineu, Mário logo conquistou outros seguidores, incluindo Zé Grande e Deraldo. Em 6 de janeiro de 1953, fundaram a Associação Cultural Bonfim, também conhecida como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço no bairro de São Cristóvão. Como o historiador André Lacé escreveu: "Não ficaram lá por muito tempo, porque o espaço ficou pequeno devido ao grande número de alunos. Mudaram a academia para o bairro de Olaria, um lugar espaçoso e agradável, e lá nunca pararam, treinando grandes capoeiristas."

O grupo Bonfim, liderado por Mário Buscapé, tornou-se famoso no Rio de Janeiro por formar competidores de alto nível que frequentemente venciam as competições que começaram a ser organizadas na cidade a partir de meados dos anos 1960.

Em 1969, quando Mário Buscapé retornou à Bahia, Deraldo e seu irmão Zé Grande assumiram a liderança do grupo Bonfim. Enquanto Zé Grande atuava como presidente, Deraldo era fundamental nas operações diárias de ensino. A sede do grupo foi posteriormente estabelecida no bairro de Bonsucesso, e continuou a prosperar sob sua direção.

Deraldo foi diretamente responsável por formar Mestre Soldado em 1973. Segundo o depoimento de Mestre Soldado, aos 18 anos ele "começou a treinar com os Mestres Deraldo e Zé Grande (o presidente do grupo Bonfim)" na sede principal em Bonsucesso. "Em 1973, Soldado se formou com Mestre Deraldo e começou a ensinar para o grupo," criando o núcleo Santa Barbara na comunidade Bandeira 2, em Del Castilho, onde ensinou até 1980.

Mestre Gary (Mestre 22), que começou a treinar no Bonfim em 1957 aos 12 anos, aprendeu com Deraldo e Zé Grande. Relembrando a cena da capoeira dos anos 1960 e 70, Gary listou os capoeiristas proeminentes: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—e eu mesmo, Mestre 22 da Bonfim."

Deraldo, junto com seu irmão Zé Grande, os Mestres Dentinho e Mintirinha, é creditado como um dos iniciadores da roda de capoeira na Festa da Penha. Nos anos 1970, esta roda se estabeleceu como uma das principais rodas de rua do Rio de Janeiro, ocorrendo durante o mês do festival (outubro-novembro).',
  -- achievements_en
  'Co-founder of Associação Cultural Bonfim (January 6, 1953); Co-leader of Grupo Bonfim (from 1969) with brother Zé Grande; Initiator of the Roda da Penha (1960s); Graduated Mestre Soldado (1973); Trained Mestre Gary (Mestre 22); Key figure in training high-level competitors who won Rio competitions in the 1960s-70s',
  -- achievements_pt
  'Co-fundador da Associação Cultural Bonfim (6 de janeiro de 1953); Co-líder do Grupo Bonfim (a partir de 1969) com o irmão Zé Grande; Iniciador da Roda da Penha (anos 1960); Formou Mestre Soldado (1973); Treinou Mestre Gary (Mestre 22); Figura fundamental no treinamento de competidores de alto nível que venciam competições no Rio nos anos 1960-70',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1930, decade):
Deraldo came to Rio with his brothers Irineu and Zé Grande in the early 1950s. He was already co-leading and teaching by 1957 when Gary (age 12) began training. Estimating birth around 1930 places him in his early 20s at the founding of Bonfim in 1953. The "decade" precision reflects limited documentation.

FULL NAME: Unknown. He was from the dos Santos family (same as brothers Irineu and Zé Grande), from Bahia. NOT related to Mário dos Santos (Mário Buscapé) despite the same surname.

NAME DISAMBIGUATION:
This "Deraldo" (Bonfim/Rio) is DIFFERENT from Mestre Deraldo Ferreira, who teaches Capoeira Angola in Cambridge, Massachusetts. Deraldo Ferreira was born in Santos, São Paulo, certified by Mestre João Pequeno in 1991/2004, and moved to Boston in 1986. They are TWO SEPARATE PEOPLE.

DEATH STATUS: Unknown. No death date or confirmation found in sources. His brother "Zé Grande" is confirmed deceased (sources refer to "the late Master Zé Grande"), but no similar reference for Deraldo.

TEACHERS:
- Mário Buscapé (primary, ~early 1950s, Rio de Janeiro)

STUDENTS:
- Mestre Gary / Mestre 22 (began 1957, age 12; co-taught with Zé Grande)
- Mestre Soldado (graduated 1973; trained at Bonsucesso HQ)

GROUP LEADERSHIP:
- Co-founded Associação Cultural Bonfim: January 6, 1953 (with Mário Buscapé, Irineu, Zé Grande)
- Took over leadership: 1969 (when Mário returned to Bahia)
- Co-leader with brother Zé Grande (who served as president)
- Headquarters: Initially São Cristóvão, then Olaria, later Bonsucesso

RODA INVOLVEMENT:
- Roda da Penha: credited as initiator (1960s), with Zé Grande, Dentinho, Mintirinha

MEDIA: None found. Mário Buscapé''s 2016 memoir "A saga de uma lenda viva" (Azougue, Rio) may contain more details about Deraldo.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Deraldo veio para o Rio com seus irmãos Irineu e Zé Grande no início dos anos 1950. Ele já estava co-liderando e ensinando em 1957 quando Gary (12 anos) começou a treinar. Estimar nascimento por volta de 1930 o coloca no início dos 20 anos na fundação do Bonfim em 1953. A precisão de "década" reflete documentação limitada.

NOME COMPLETO: Desconhecido. Ele era da família dos Santos (mesma dos irmãos Irineu e Zé Grande), da Bahia. NÃO é parente de Mário dos Santos (Mário Buscapé) apesar do mesmo sobrenome.

DESAMBIGUAÇÃO DE NOME:
Este "Deraldo" (Bonfim/Rio) é DIFERENTE de Mestre Deraldo Ferreira, que ensina Capoeira Angola em Cambridge, Massachusetts. Deraldo Ferreira nasceu em Santos, São Paulo, foi certificado por Mestre João Pequeno em 1991/2004, e mudou-se para Boston em 1986. São DUAS PESSOAS DIFERENTES.

STATUS DE MORTE: Desconhecido. Nenhuma data ou confirmação de morte encontrada nas fontes. Seu irmão "Zé Grande" está confirmado como falecido (fontes referem-se ao "saudoso Mestre Zé Grande"), mas nenhuma referência similar para Deraldo.

MESTRES:
- Mário Buscapé (principal, ~início dos anos 1950, Rio de Janeiro)

ALUNOS:
- Mestre Gary / Mestre 22 (começou 1957, 12 anos; co-ensinou com Zé Grande)
- Mestre Soldado (formado 1973; treinou na sede de Bonsucesso)

LIDERANÇA DO GRUPO:
- Co-fundou Associação Cultural Bonfim: 6 de janeiro de 1953 (com Mário Buscapé, Irineu, Zé Grande)
- Assumiu liderança: 1969 (quando Mário retornou à Bahia)
- Co-líder com irmão Zé Grande (que atuou como presidente)
- Sede: Inicialmente São Cristóvão, depois Olaria, posteriormente Bonsucesso

ENVOLVIMENTO EM RODAS:
- Roda da Penha: creditado como iniciador (anos 1960), com Zé Grande, Dentinho, Mintirinha

MÍDIA: Nenhuma encontrada. As memórias de Mário Buscapé de 2016 "A saga de uma lenda viva" (Azougue, Rio) podem conter mais detalhes sobre Deraldo.'
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
