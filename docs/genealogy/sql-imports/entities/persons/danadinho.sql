-- ============================================================
-- GENEALOGY PERSON: Danadinho
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1948, decade precision):
-- The Correio Braziliense (2011) states he "arrived in Brasília in 1961
-- at age 13, coming from Petrópolis." If 13 in 1961, born ~1948.
-- Sources refer to him as "o paraibano" (the Paraíban), indicating
-- birth in Paraíba state before family moved to Petrópolis/Brasília.
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
  'Cláudio José Queiroz',
  'Danadinho',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.gruposenzala.org/mestres-do-grupo.html',
    'https://iesambi.org.br/capoeira_arquivos/ascadf/mestrearraia.htm',
    'https://www.lalaue.com/learn-capoeira/mestre-peixinho/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'One of the founding red cords (cordas vermelhas) of Grupo Senzala, which developed an athletic, acrobatic style blending elements of Capoeira Regional and Angola. The Senzala methodology emphasizes systematic teaching sequences balanced with student creativity and spontaneity. The group pioneered open rodas welcoming all capoeiristas and a cord ranking system from white to red. Danadinho spent approximately one year training in Salvador at the Olondu Maré group, contributing to the construction of Senzala''s training methodology.',
  E'Um dos cordas vermelhas fundadores do Grupo Senzala, que desenvolveu um estilo atlético e acrobático mesclando elementos da Capoeira Regional e Angola. A metodologia Senzala enfatiza sequências de ensino sistemáticas equilibradas com criatividade e espontaneidade do aluno. O grupo foi pioneiro em rodas abertas acolhendo todos os capoeiristas e um sistema de graduação de cordas do branco ao vermelho. Danadinho passou aproximadamente um ano treinando em Salvador no grupo Olondu Maré, contribuindo para a construção da metodologia de treinamento da Senzala.',
  -- Life dates
  1948,
  'decade'::genealogy.date_precision,
  'Paraíba, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Cláudio José Queiroz, known as Mestre Danadinho (and earlier as "Claudio Brasília"), is one of the founding mestres of Grupo Senzala and a pioneering figure who brought capoeira to the Federal District of Brazil. Born in Paraíba, he arrived in Brasília in 1961 at age 13, coming from Petrópolis with his family who settled in Super Quadra 209 Sul—a housing block for military families.

In the early 1960s, Danadinho began training capoeira in Brasília under the influence of Mestre Arraia (Aldenor Benjamim), who had trained with masters in Salvador including exposure to both Mestre Pastinha and Mestre Bimba''s traditions. At the Colégio Elefante Branco, young capoeiristas gathered to train, with Danadinho among them alongside Hélio Tabosa (later Mestre Tabosa) and Alfredo "Fritz"—friends who would later help Grupo Senzala win the Berimbau de Ouro competition.

In 1964, while visiting a Judo academy in Brasília, Itamar (later Mestre Itamar) discovered that Cláudio also practiced capoeira. They began training together. That summer, when Cláudio traveled to Rio de Janeiro, he trained with Itamar in the courtyard of Itamar''s building in the Lapa neighborhood—an early seed of what would become Grupo Senzala.

In 1965, Danadinho joined the nascent Senzala group in Rio de Janeiro along with Peixinho and Itamar, becoming one of its core members. The founding nucleus included the three Flores brothers from Bahia (Paulo, Rafael, and Gilberto), plus Gato, Gil Velho, Garrincha, Preguiça, and Sorriso—teenagers who had been training together on the terrace of their apartment building in the Laranjeiras district since 1963.

During 1966, at a demonstration at a German Club in Rio, the group first introduced themselves as "Grupo Senzala"—the name referencing the slave quarters where enslaved people were held, a deliberate political and cultural statement connecting capoeira to Brazil''s history of resistance.

In 1967, with the help of Tabosa and Fritz from Brasília, Senzala entered the Berimbau de Ouro competition. Their pairs won that year and again the following year, establishing the group''s reputation. Danadinho also spent approximately one year training in Salvador at the Olondu Maré group, an experience that contributed strongly to the construction of Senzala''s training methodology.

Beyond capoeira, Danadinho became a distinguished architect. He studied architecture in Rio de Janeiro, worked with Oscar Niemeyer in Algeria, and served as superintendent of IPHAN (Brazil''s heritage institute). He became a professor of architecture at the Universidade de Brasília (UnB) and wrote his doctoral thesis on the relationship between capoeira and architecture.

Danadinho was the first to teach capoeira in the public schools of the Federal District, including at Colégio Elefante Branco where he had once trained. His teaching protected student activist Honestino Guimarães during the military dictatorship—an incident that led him to relocate to Rio de Janeiro for 17 years before eventually returning to Brasília.

Today, Mestre Danadinho remains one of the 17 active cordas vermelhas (red cords) of Grupo Senzala, alongside Paulo Flores, Gato, Gil Velho, Garrincha, Sorriso, Itamar, and others. He travels internationally lecturing on Brasília, Oscar Niemeyer, Lucio Costa, and capoeira—connecting the architecture of Brazil''s capital with its Afro-Brazilian martial art.',
  -- Extended content (bio_pt)
  E'Cláudio José Queiroz, conhecido como Mestre Danadinho (e anteriormente como "Claudio Brasília"), é um dos mestres fundadores do Grupo Senzala e uma figura pioneira que trouxe a capoeira para o Distrito Federal do Brasil. Nascido na Paraíba, chegou a Brasília em 1961 aos 13 anos, vindo de Petrópolis com sua família que se estabeleceu na Super Quadra 209 Sul—um bloco habitacional para famílias de militares.

No início dos anos 1960, Danadinho começou a treinar capoeira em Brasília sob a influência de Mestre Arraia (Aldenor Benjamim), que havia treinado com mestres em Salvador incluindo exposição às tradições de Mestre Pastinha e Mestre Bimba. No Colégio Elefante Branco, jovens capoeiristas se reuniam para treinar, com Danadinho entre eles ao lado de Hélio Tabosa (mais tarde Mestre Tabosa) e Alfredo "Fritz"—amigos que mais tarde ajudariam o Grupo Senzala a vencer a competição Berimbau de Ouro.

Em 1964, enquanto visitava uma academia de Judô em Brasília, Itamar (mais tarde Mestre Itamar) descobriu que Cláudio também praticava capoeira. Começaram a treinar juntos. Naquele verão, quando Cláudio viajou ao Rio de Janeiro, treinou com Itamar no pátio do prédio de Itamar no bairro da Lapa—uma semente inicial do que se tornaria o Grupo Senzala.

Em 1965, Danadinho juntou-se ao nascente grupo Senzala no Rio de Janeiro junto com Peixinho e Itamar, tornando-se um de seus membros centrais. O núcleo fundador incluía os três irmãos Flores da Bahia (Paulo, Rafael e Gilberto), mais Gato, Gil Velho, Garrincha, Preguiça e Sorriso—adolescentes que vinham treinando juntos no terraço de seu prédio no bairro de Laranjeiras desde 1963.

Durante 1966, em uma apresentação em um Clube Alemão no Rio, o grupo se apresentou pela primeira vez como "Grupo Senzala"—o nome referenciando as senzalas onde pessoas escravizadas eram mantidas, uma declaração política e cultural deliberada conectando a capoeira à história de resistência do Brasil.

Em 1967, com a ajuda de Tabosa e Fritz de Brasília, a Senzala entrou na competição Berimbau de Ouro. Suas duplas venceram naquele ano e novamente no ano seguinte, estabelecendo a reputação do grupo. Danadinho também passou aproximadamente um ano treinando em Salvador no grupo Olondu Maré, experiência que contribuiu fortemente para a construção da metodologia de treinamento da Senzala.

Além da capoeira, Danadinho tornou-se um arquiteto distinto. Estudou arquitetura no Rio de Janeiro, trabalhou com Oscar Niemeyer na Argélia e serviu como superintendente do IPHAN (instituto do patrimônio do Brasil). Tornou-se professor de arquitetura na Universidade de Brasília (UnB) e escreveu sua tese de doutorado sobre a relação entre capoeira e arquitetura.

Danadinho foi o primeiro a ensinar capoeira nas escolas públicas do Distrito Federal, incluindo no Colégio Elefante Branco onde uma vez havia treinado. Seu ensino protegeu o ativista estudantil Honestino Guimarães durante a ditadura militar—um incidente que o levou a se mudar para o Rio de Janeiro por 17 anos antes de eventualmente retornar a Brasília.

Hoje, Mestre Danadinho permanece um dos 17 cordas vermelhas ativos do Grupo Senzala, ao lado de Paulo Flores, Gato, Gil Velho, Garrincha, Sorriso, Itamar e outros. Ele viaja internacionalmente palestrando sobre Brasília, Oscar Niemeyer, Lucio Costa e capoeira—conectando a arquitetura da capital do Brasil com sua arte marcial afro-brasileira.',
  -- Achievements
  E'1961: Arrived in Brasília at age 13, beginning capoeira training
1964: Met Itamar in Brasília; began collaborative training that seeded Grupo Senzala
1965: Joined the founding nucleus of Grupo Senzala in Rio de Janeiro with Peixinho and Itamar
1966: Part of group that formally named themselves "Grupo Senzala" at German Club demonstration
1967: Helped Senzala win Berimbau de Ouro competition with friends Tabosa and Fritz from Brasília
1960s-70s: First professor to teach capoeira in public schools of the Federal District (Colégio Elefante Branco)
Career: Architect; worked with Oscar Niemeyer in Algeria; superintendent of IPHAN; professor at UnB
Doctorate: Thesis on relationship between capoeira and architecture
Present: One of 17 active cordas vermelhas (red cords) of Grupo Senzala
International: Lectures worldwide on Brasília architecture, Niemeyer, Lucio Costa, and capoeira',
  E'1961: Chegou a Brasília aos 13 anos, começando o treinamento de capoeira
1964: Conheceu Itamar em Brasília; começou treinamento colaborativo que semeou o Grupo Senzala
1965: Juntou-se ao núcleo fundador do Grupo Senzala no Rio de Janeiro com Peixinho e Itamar
1966: Parte do grupo que formalmente se nomeou "Grupo Senzala" em apresentação no Clube Alemão
1967: Ajudou a Senzala a vencer a competição Berimbau de Ouro com os amigos Tabosa e Fritz de Brasília
Anos 1960-70: Primeiro professor a ensinar capoeira nas escolas públicas do Distrito Federal (Colégio Elefante Branco)
Carreira: Arquiteto; trabalhou com Oscar Niemeyer na Argélia; superintendente do IPHAN; professor na UnB
Doutorado: Tese sobre a relação entre capoeira e arquitetura
Presente: Um dos 17 cordas vermelhas ativos do Grupo Senzala
Internacional: Palestra mundialmente sobre arquitetura de Brasília, Niemeyer, Lucio Costa e capoeira',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1948, decade precision):
Correio Braziliense (2011) states he arrived in Brasília in 1961 at age 13.
If 13 years old in 1961, born approximately 1948 (could be 1947-1949).
Sources describe him as "o paraibano" (the Paraíban), indicating birth in Paraíba.

NAME VARIATIONS:
- "Claudio Brasília" - early nickname before receiving apelido "Danadinho"
- "Cláudio José Queiroz" - confirmed in iesambi.org tribute he authored
- "Claudio Jose Queiroz" - appears in some Senzala histories

TEACHERS:
- Mestre Arraia (Aldenor Benjamim, 1946-2005) - Brasília; trained at Colégio Elefante Branco; Pastinha/Bimba lineage from Salvador
- Note: One source (capoeirailhagrande) claims he trained with "a formado of Mestre Bimba in Brasília, the Peixinho" but this appears to be an error—Peixinho was a contemporary who trained WITH Danadinho, not his teacher

STUDENTS:
- Mestre Gato de Silvestre (Julival do Espírito Santo, b.1952) - trained in Brasília before moving to São Paulo
- Mestre Peixinho (Marcelo Azevedo Guimarães, 1947-2011) - started training with Danadinho in Rio 1964

SENZALA FOUNDING MEMBERS (cordas vermelhas):
Original nucleus: Paulo Flores, Rafael Flores (†), Gilberto Flores, Gato, Gil Velho, Garrincha, Itamar, Peixinho (†2011), Claudio Danadinho, Preguiça, Sorriso

CURRENT ACTIVE CORDAS VERMELHAS (as of 2024):
Paulo Flores, Claudio Danadinho, Gato, Peixinho (†), Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, Azeite

MEDIA APPEARANCES:
- 2011: Interview in Correio Braziliense discussing architecture and capoeira
- Lectures internationally on Brasília, Oscar Niemeyer, Lucio Costa, and capoeira

CAREER OUTSIDE CAPOEIRA:
- Architect trained in Rio de Janeiro
- Worked with Oscar Niemeyer in Algeria
- Superintendent of IPHAN (Brazilian heritage institute)
- Professor of Architecture at Universidade de Brasília (UnB)
- PhD thesis on relationship between capoeira and architecture

LOCATION: Super Quadra 209 Sul, Brasília (family residence in 1960s)

CONNECTIONS TO HONESTINO GUIMARÃES:
Protected student activist during military dictatorship while teaching at Elefante Branco;
incident led him to relocate to Rio de Janeiro for 17 years before returning to Brasília',
  E'ESTIMATIVA ANO DE NASCIMENTO (1948, precisão década):
Correio Braziliense (2011) afirma que chegou a Brasília em 1961 aos 13 anos.
Se 13 anos em 1961, nascido aproximadamente 1948 (pode ser 1947-1949).
Fontes o descrevem como "o paraibano", indicando nascimento na Paraíba.

VARIAÇÕES DE NOME:
- "Claudio Brasília" - apelido inicial antes de receber apelido "Danadinho"
- "Cláudio José Queiroz" - confirmado em tributo no iesambi.org que ele escreveu
- "Claudio Jose Queiroz" - aparece em algumas histórias da Senzala

MESTRES:
- Mestre Arraia (Aldenor Benjamim, 1946-2005) - Brasília; treinou no Colégio Elefante Branco; linhagem Pastinha/Bimba de Salvador
- Nota: Uma fonte (capoeirailhagrande) afirma que ele treinou com "um formado de Mestre Bimba em Brasília, o Peixinho" mas isso parece ser um erro—Peixinho era um contemporâneo que treinou COM Danadinho, não seu professor

ALUNOS:
- Mestre Gato de Silvestre (Julival do Espírito Santo, n.1952) - treinou em Brasília antes de ir para São Paulo
- Mestre Peixinho (Marcelo Azevedo Guimarães, 1947-2011) - começou a treinar com Danadinho no Rio 1964

MEMBROS FUNDADORES DA SENZALA (cordas vermelhas):
Núcleo original: Paulo Flores, Rafael Flores (†), Gilberto Flores, Gato, Gil Velho, Garrincha, Itamar, Peixinho (†2011), Claudio Danadinho, Preguiça, Sorriso

CORDAS VERMELHAS ATIVOS ATUAIS (em 2024):
Paulo Flores, Claudio Danadinho, Gato, Peixinho (†), Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, Azeite

APARIÇÕES NA MÍDIA:
- 2011: Entrevista no Correio Braziliense discutindo arquitetura e capoeira
- Palestra internacionalmente sobre Brasília, Oscar Niemeyer, Lucio Costa e capoeira

CARREIRA FORA DA CAPOEIRA:
- Arquiteto formado no Rio de Janeiro
- Trabalhou com Oscar Niemeyer na Argélia
- Superintendente do IPHAN (instituto do patrimônio brasileiro)
- Professor de Arquitetura na Universidade de Brasília (UnB)
- Tese de doutorado sobre a relação entre capoeira e arquitetura

LOCALIZAÇÃO: Super Quadra 209 Sul, Brasília (residência da família nos anos 1960)

CONEXÕES COM HONESTINO GUIMARÃES:
Protegeu ativista estudantil durante a ditadura militar enquanto ensinava no Elefante Branco;
incidente o levou a se mudar para o Rio de Janeiro por 17 anos antes de retornar a Brasília'
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
