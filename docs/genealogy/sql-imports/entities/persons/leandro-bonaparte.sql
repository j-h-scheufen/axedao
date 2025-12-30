-- ============================================================
-- GENEALOGY PERSON: Leandro Bonaparte
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1830, decade precision):
-- Active as chief of São Francisco party during the 1870s-1880s, the peak
-- period of malta activity. As a "famous" chief leading one of the largest
-- parties within the Guaiamú federation, he would likely have been in his
-- 30s-50s during this period. Using the same methodology as for Manduca
-- da Praia (his rival/contemporary who was born ~1820s and active ~1850),
-- Leandro would have been born in the 1830s to be a mature gang leader
-- by the 1870s-1880s. Recorded with `decade` precision.
--
-- DEATH: Unknown. No records found, but capoeira practice was criminalized
-- in 1890 and the maltas were suppressed by Sampaio Ferraz. He would have
-- been in his 50s-60s at that time.
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
  NULL,  -- Full name unknown
  'Leandro Bonaparte',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  ARRAY['https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/']::text[],
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro. The Guaiamú faction he led was known for training with razors and knives, a weapon tradition attributed to Portuguese immigrants who joined the maltas after 1850.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro. A facção Guaiamú que liderava era conhecida pelo treinamento com navalhas e facas, tradição de armas atribuída aos imigrantes portugueses que se juntaram às maltas após 1850.',
  -- Life dates
  1830,
  'decade'::genealogy.date_precision,
  NULL,  -- Birth place unknown, presumably Rio de Janeiro
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- bio_en
  E'Leandro Bonaparte was the chief of the São Francisco party, described by Plácido de Abreu in his 1886 book "Os Capoeiras" as "the great centre" of the Guaiamú federation. The São Francisco party was the most important of the Guaiamú parishes, and Bonaparte''s leadership made him one of the most powerful figures in Rio de Janeiro''s capoeira underworld.

The Guaiamú and Nagoa were the two major federations that controlled the capoeira maltas of Rio de Janeiro during the second half of the 19th century. While the Nagoas operated in the peripheral Cidade Velha and allied with the Conservative Party, the Guaiamús controlled the central Cidade Nova and aligned with the Republicans of the Liberal Party. Their rivalry played out in bloody street battles, political violence, and ritualized confrontations.

Under Bonaparte''s leadership, the Guaiamú federation included the parishes of São Francisco, Santa Rita, Marinha, Ouro Preto, and São Domingos de Gusmão, along with numerous smaller affiliated gangs. These groups were known as "houses" or "provinces", and members identified themselves by wearing red - the color of the Guaiamú. When enemy capoeiras met in a tavern, the Guaiamú would pour brandy on the ground and dance on it, then pour red wine over the brandy - symbolically stepping on the Nagoa''s white color and placing their red above it. This gesture was enough to start a fight, as no capoeira would tolerate seeing his color stepped upon.

The Guaiamú trained their novices on the hill of Livramento at a place called "Mango Tree". The rehearsals took place regularly on Sunday mornings and consisted of head and foot exercises and knife and razor blows. The most famous capoeiras served as instructors. Training progressed from clean hands to wooden weapons to actual blades.

The maltas were organized with military precision: chief, assistant, policemen, and rank-and-file soldiers. This structure allowed them to function both as territorial protection networks and as political muscle. During elections, capoeiras were hired as capangas (henchmen) by politicians to intimidate voters and attack opposition newspapers. The Liberal-aligned Guaiamú specifically targeted the Conservative-supporting press.

Bonaparte''s São Francisco party, along with the other Guaiamú groups, represented a new phase in capoeira history. The Guaiamús were characterized by their mixed composition - unlike the Nagoas, who were reportedly limited to African-born practitioners, the Guaiamú assimilated immigrants (particularly Portuguese after 1850), Creoles, free men, and even intellectuals. This diversity brought new weapons to capoeira: the razor is specifically attributed to Portuguese influence within the Guaiamú ranks.',
  -- bio_pt
  E'Leandro Bonaparte era o chefe do partido de São Francisco, descrito por Plácido de Abreu em seu livro de 1886 "Os Capoeiras" como "o grande centro" da federação Guaiamú. O partido de São Francisco era o mais importante das freguesias Guaiamú, e a liderança de Bonaparte o tornava uma das figuras mais poderosas no submundo da capoeira do Rio de Janeiro.

Os Guaiamú e Nagoa eram as duas maiores federações que controlavam as maltas de capoeira do Rio de Janeiro durante a segunda metade do século XIX. Enquanto os Nagoas operavam na periférica Cidade Velha e se aliavam ao Partido Conservador, os Guaiamús controlavam a central Cidade Nova e se alinhavam aos Republicanos do Partido Liberal. Sua rivalidade se manifestava em batalhas de rua sangrentas, violência política e confrontos ritualizados.

Sob a liderança de Bonaparte, a federação Guaiamú incluía as freguesias de São Francisco, Santa Rita, Marinha, Ouro Preto e São Domingos de Gusmão, junto com numerosas gangues menores afiliadas. Esses grupos eram conhecidos como "casas" ou "províncias", e os membros se identificavam usando vermelho - a cor do Guaiamú. Quando capoeiras inimigos se encontravam em uma taverna, o Guaiamú despejava aguardente no chão e dançava sobre ela, depois despejava vinho tinto sobre a aguardente - simbolicamente pisando na cor branca dos Nagoa e colocando seu vermelho acima. Este gesto era suficiente para iniciar uma briga, pois nenhum capoeira toleraria ver sua cor pisoteada.

Os Guaiamú treinavam seus novatos no morro do Livramento em um lugar chamado "Mangueira". Os ensaios aconteciam regularmente nas manhãs de domingo e consistiam em exercícios de cabeça e pé e golpes de faca e navalha. Os capoeiras mais famosos serviam como instrutores. O treinamento progredia de mãos limpas para armas de madeira até lâminas reais.

As maltas eram organizadas com precisão militar: chefe, assistente, policiais e soldados de base. Essa estrutura permitia que funcionassem tanto como redes de proteção territorial quanto como força política. Durante as eleições, capoeiras eram contratados como capangas por políticos para intimidar eleitores e atacar jornais de oposição. Os Guaiamú alinhados aos Liberais especificamente atacavam a imprensa que apoiava os Conservadores.

O partido de São Francisco de Bonaparte, junto com os outros grupos Guaiamú, representava uma nova fase na história da capoeira. Os Guaiamús eram caracterizados por sua composição mista - diferente dos Nagoas, que supostamente eram limitados a praticantes nascidos na África, os Guaiamú assimilavam imigrantes (particularmente portugueses após 1850), crioulos, homens livres e até intelectuais. Essa diversidade trouxe novas armas para a capoeira: a navalha é especificamente atribuída à influência portuguesa nas fileiras dos Guaiamú.',
  -- achievements_en
  'Chief of São Francisco party, the primary center of the Guaiamú federation; Led the largest and most influential parish within the Guaiamú coalition; Contemporary and rival of Manduca da Praia (Nagoa chief)',
  -- achievements_pt
  'Chefe do partido de São Francisco, o centro principal da federação Guaiamú; Liderou a maior e mais influente freguesia dentro da coalizão Guaiamú; Contemporâneo e rival de Manduca da Praia (chefe Nagoa)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1830, decade precision): Active as chief of São Francisco party during the 1870s-1880s, the peak period of malta activity. As a "famous" chief leading one of the largest parties within the Guaiamú federation, he would have been in his 30s-50s during this period. Using the same methodology as for Manduca da Praia (his rival/contemporary who was born ~1820s and active ~1850), Leandro would have been born in the 1830s to be a mature gang leader by the 1870s-1880s.

NAME: Only "Leandro Bonaparte" is recorded. The name "Bonaparte" is unusual for a Brazilian of this era - it may be a apelido or possibly indicates Portuguese or other European ancestry, consistent with the Guaiamú''s mixed composition.

PRIMARY SOURCE: Plácido de Abreu, "Os Capoeiras" (1886). Abreu described him as "o chefe famoso" (the famous chief) of São Francisco, identifying it as the "grande centro" (great center) of the Guaiamú.

SECONDARY SOURCES: José Alexandre Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1906), also lists "Bonaparte, Leandro" among famous capoeiras of Rio.

DEATH: Unknown. The maltas were suppressed after 1889-1890 when the Republican government criminalized capoeira under Sampaio Ferraz''s police campaigns.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1830, precisão de década): Ativo como chefe do partido de São Francisco durante a década de 1870-1880, o período de maior atividade das maltas. Como um chefe "famoso" liderando um dos maiores partidos dentro da federação Guaiamú, ele teria entre 30-50 anos durante este período. Usando a mesma metodologia de Manduca da Praia (seu rival/contemporâneo que nasceu ~1820 e estava ativo ~1850), Leandro teria nascido na década de 1830 para ser um líder maduro de gangue na década de 1870-1880.

NOME: Apenas "Leandro Bonaparte" está registrado. O nome "Bonaparte" é incomum para um brasileiro desta era - pode ser um apelido ou possivelmente indica ascendência portuguesa ou outra europeia, consistente com a composição mista dos Guaiamú.

FONTE PRIMÁRIA: Plácido de Abreu, "Os Capoeiras" (1886). Abreu o descreveu como "o chefe famoso" de São Francisco, identificando-o como o "grande centro" dos Guaiamú.

FONTES SECUNDÁRIAS: José Alexandre Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1906), também lista "Bonaparte, Leandro" entre os famosos capoeiras do Rio.

MORTE: Desconhecida. As maltas foram suprimidas após 1889-1890 quando o governo republicano criminalizou a capoeira sob as campanhas policiais de Sampaio Ferraz.'
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
