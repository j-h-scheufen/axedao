-- ============================================================
-- GENEALOGY PERSON: Roberval Serejo
-- Generated: 2026-01-10
-- ============================================================
-- BIRTH YEAR ESTIMATION (1936, year precision):
-- Sources indicate he was born in 1936. The CEV (Centro Esportivo
-- Virtual) academic article explicitly states "Mestre Roberval
-- Serejo (1936-1971)".
--
-- DEATH YEAR (1971, year precision):
-- Died in 1971 while working on the construction of Porto do
-- Itaqui in São Luís, Maranhão. He was a Navy diver (escafandrista)
-- and died during this work assignment. Multiple sources confirm
-- this date.
--
-- NAME DISCREPANCY:
-- Some sources spell his name as "Roberval Cereja" (likely
-- transcription error or regional pronunciation). The academic
-- sources and Artur Emídio's student lists use "Roberval Serejo".
--
-- ORIGIN: Sources describe him as "maranhense" (from Maranhão)
-- who went to Rio de Janeiro to serve in the Navy, where he
-- learned capoeira from Mestre Artur Emídio. He later returned
-- to Maranhão for the Porto do Itaqui construction project.
--
-- SIGNIFICANCE: Pioneer of capoeira in Maranhão; founded Grupo
-- Bantu de Capoeira (1959), the first organized capoeira group
-- in the state; bridge between Rio de Janeiro capoeira tradition
-- and the Maranhão region; trained several important figures
-- including Mestre Patinho and Mestre Bezerra.
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
  NULL,  -- Full name unknown
  'Roberval Serejo',
  'mestre'::genealogy.title,
  NULL,  -- No portrait found
  ARRAY[
    'https://cev.org.br/biblioteca/capoeira-no-do-maranhao-uma-historia-memoria-contraditoria/',
    'https://capoeirahistory.com/mestre/master-artur-emidio-1930-2011/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Roberval Serejo brought a distinctive style to Maranhão - described in some sources as "primitive" capoeira, rooted in Rio de Janeiro traditions through his training with Mestre Artur Emídio. His approach combined the Bahian systematized method that characterized Artur Emídio''s lineage with practical fighting applications. As Mestre Patinho later recalled, Serejo''s training emphasized capoeira as a "corporal dialogue" rather than choreography.',
  E'Roberval Serejo trouxe um estilo distintivo para o Maranhão - descrito em algumas fontes como capoeira "primitiva", enraizada nas tradições cariocas através de seu treinamento com Mestre Artur Emídio. Sua abordagem combinava o método sistematizado baiano que caracterizava a linhagem de Artur Emídio com aplicações práticas de luta. Como Mestre Patinho mais tarde recordou, o treinamento de Serejo enfatizava a capoeira como um "diálogo corporal" em vez de coreografia.',
  -- Life dates
  1936,
  'year'::genealogy.date_precision,
  'Maranhão, Brazil',  -- Described as "maranhense"
  1971,
  'year'::genealogy.date_precision,
  'São Luís, Maranhão, Brazil',  -- Died during Porto do Itaqui construction
  -- Extended content (English)
  E'Roberval Serejo was born in 1936 in Maranhão, Brazil. As a young man, he joined the Brazilian Navy (Marinha de Guerra) as a diver (escafandrista) and was stationed in Rio de Janeiro. There, he discovered capoeira and became a student of Mestre Artur Emídio, one of the pioneers of contemporary capoeira in Rio who had established an influential academy in the Bonsucesso neighborhood.

Having learned from one of the great masters of Rio de Janeiro, Serejo returned to his home state of Maranhão in the late 1950s, assigned to work on the construction of Porto do Itaqui, a major port being developed in São Luís. Upon arriving, he found that capoeira already had deep roots in the region - the rodas of Mestre Diniz were already happening at Praça Deodoro, where a local variant of the art called "carioca" had been practiced since the mid-19th century.

In 1959, Serejo established Grupo Bantu de Capoeira (also known as Academia Bantu), the first formally organized capoeira group in Maranhão. The founding members included Babalu, Jessé Lobão, Patinho, Bizerra, Manuel Peitudinho, Murilo, Lourinho, Elmo Cascavel, and Alô. The academy was centered in the São Pantaleão neighborhood, which became a hub for capoeira activity in the city.

Serejo''s approach was described as coming from "a different school... of a ''primitive'' capoeira" - a style rooted in the Rio traditions through figures like Artur Emídio, and by extension the Bahian lineage of Mestre Paizinho and Mestre Neném. His teachings attracted young practitioners, including Antônio José da Conceição Ramos, who would later become the legendary Mestre Patinho. Patinho received his first lessons from Jessé Lobão and then trained under Roberval Serejo for approximately two years.

Another significant disciple was Mestre Bezerra, who later carried the capoeira traditions to Pará state, where he became one of three principal masters who restructured capoeira in that region during the 1970s "hippie era." Bezerra developed capoeira in its sportive aspects, representing an encounter between historical local capoeira and the matrices brought from Maranhão.

The narrative of capoeira in Maranhão is often dominated by Mestre Sapo (Anselmo Barnabé Rodrigues), who arrived in 1966 with the Quarteto Aberrê led by Mestre Canjiquinha. However, scholars have begun to recognize that Roberval Serejo''s work predated Sapo''s arrival and was crucial in establishing an organized structure for capoeira transmission in the state.

Tragically, Roberval Serejo died in 1971 while working on the Porto do Itaqui construction project. His death cut short a promising career, but his legacy lived on through his students and the foundation he laid for organized capoeira in Maranhão. The Grupo Bantu de Capoeira he founded represented a bridge between Rio de Janeiro''s capoeira traditions and the emerging scene in northern Brazil, ensuring that the art form would take root and flourish in Maranhão long before it gained mainstream recognition.',
  -- Extended content (Portuguese)
  E'Roberval Serejo nasceu em 1936 no Maranhão, Brasil. Quando jovem, ingressou na Marinha de Guerra brasileira como escafandrista e foi designado para o Rio de Janeiro. Lá, descobriu a capoeira e tornou-se aluno de Mestre Artur Emídio, um dos pioneiros da capoeira contemporânea no Rio que havia estabelecido uma academia influente no bairro de Bonsucesso.

Tendo aprendido com um dos grandes mestres do Rio de Janeiro, Serejo retornou ao seu estado natal do Maranhão no final dos anos 1950, designado para trabalhar na construção do Porto do Itaqui, um importante porto em desenvolvimento em São Luís. Ao chegar, descobriu que a capoeira já tinha raízes profundas na região - as rodas de Mestre Diniz já aconteciam na Praça Deodoro, onde uma variante local da arte chamada "carioca" era praticada desde meados do século XIX.

Em 1959, Serejo estabeleceu o Grupo Bantu de Capoeira (também conhecido como Academia Bantu), o primeiro grupo de capoeira formalmente organizado no Maranhão. Os membros fundadores incluíam Babalu, Jessé Lobão, Patinho, Bizerra, Manuel Peitudinho, Murilo, Lourinho, Elmo Cascavel e Alô. A academia era centrada no bairro de São Pantaleão, que se tornou um polo de atividade capoeirística na cidade.

A abordagem de Serejo foi descrita como vinda de "uma escola diferente... de uma capoeira ''primitiva''" - um estilo enraizado nas tradições cariocas através de figuras como Artur Emídio, e por extensão a linhagem baiana de Mestre Paizinho e Mestre Neném. Seus ensinamentos atraíram jovens praticantes, incluindo Antônio José da Conceição Ramos, que mais tarde se tornaria o lendário Mestre Patinho. Patinho recebeu suas primeiras lições de Jessé Lobão e depois treinou sob Roberval Serejo por aproximadamente dois anos.

Outro discípulo significativo foi Mestre Bezerra, que mais tarde levou as tradições da capoeira para o estado do Pará, onde se tornou um dos três principais mestres que reestruturaram a capoeira naquela região durante a "era hippie" dos anos 1970. Bezerra desenvolveu a capoeira em seus aspectos esportivos, representando um encontro entre a capoeira histórica local e as matrizes trazidas do Maranhão.

A narrativa da capoeira no Maranhão é frequentemente dominada por Mestre Sapo (Anselmo Barnabé Rodrigues), que chegou em 1966 com o Quarteto Aberrê liderado por Mestre Canjiquinha. No entanto, estudiosos começaram a reconhecer que o trabalho de Roberval Serejo antecedeu a chegada de Sapo e foi crucial para estabelecer uma estrutura organizada para a transmissão da capoeira no estado.

Tragicamente, Roberval Serejo morreu em 1971 enquanto trabalhava no projeto de construção do Porto do Itaqui. Sua morte interrompeu uma carreira promissora, mas seu legado viveu através de seus alunos e da base que ele estabeleceu para a capoeira organizada no Maranhão. O Grupo Bantu de Capoeira que ele fundou representou uma ponte entre as tradições da capoeira carioca e a cena emergente no norte do Brasil, garantindo que a arte se enraizasse e florescesse no Maranhão muito antes de ganhar reconhecimento popular.',
  -- Achievements (English)
  E'- Founded Grupo Bantu de Capoeira (1959), the first formally organized capoeira group in Maranhão
- Pioneer of organized capoeira in Maranhão, predating Mestre Sapo''s arrival
- Student of Mestre Artur Emídio, one of the key figures of Contemporary Capoeira in Rio de Janeiro
- Trained Mestre Patinho, who became a legendary figure in Maranhão capoeira
- Trained Mestre Bezerra, who later brought capoeira to Pará state
- Bridge between Rio de Janeiro capoeira traditions and northern Brazil',
  -- Achievements (Portuguese)
  E'- Fundou o Grupo Bantu de Capoeira (1959), o primeiro grupo de capoeira formalmente organizado no Maranhão
- Pioneiro da capoeira organizada no Maranhão, antecedendo a chegada de Mestre Sapo
- Aluno de Mestre Artur Emídio, uma das figuras-chave da Capoeira Contemporânea no Rio de Janeiro
- Treinou Mestre Patinho, que se tornou uma figura lendária na capoeira maranhense
- Treinou Mestre Bezerra, que mais tarde levou a capoeira para o estado do Pará
- Ponte entre as tradições da capoeira carioca e o norte do Brasil',
  -- Researcher notes (English)
  E'BIRTH YEAR (1936, year precision):
CEV academic article explicitly states "Mestre Roberval Serejo (1936-1971)". No exact birth date found.

DEATH YEAR (1971, year precision):
Confirmed by multiple sources. Died while working on Porto do Itaqui construction. Was a Navy diver (escafandrista) at the time.

NAME DISCREPANCY:
- "Roberval Serejo" - used by capoeirahistory.com, CEV academic sources, Artur Emídio reports
- "Roberval Cereja" - used in interview with Mestre Índio Maranhão (likely transcription error)
Using "Roberval Serejo" as canonical form based on majority of academic sources.

ORIGIN:
Sources describe him as "maranhense" (from Maranhão) who went to Rio de Janeiro for Navy service. Some sources say he came "from Rio de Janeiro for the construction of Porto do Itaqui" - this indicates his Navy posting was in Rio before reassignment to Maranhão.

TEACHERS:
- Mestre Artur Emídio (confirmed by capoeirahistory.com student list and CEV article)
- Style described as "primitive capoeira" with roots in Rio traditions

STUDENTS:
- Mestre Patinho (Antônio José da Conceição Ramos, 1953-2017) - trained for ~2 years
- Mestre Bezerra - later went to Pará, developed sportive capoeira
- Other Academia Bantu members trained under him

GRUPO BANTU FOUNDING MEMBERS (1959):
Roberval Serejo, Babalu, Jessé Lobão, Patinho, Bizerra, Manuel Peitudinho, Murilo, Lourinho, Elmo Cascavel, Alô

TIMELINE:
- Late 1950s: Arrives in Maranhão for Porto do Itaqui construction
- 1959: Founds Grupo Bantu de Capoeira
- 1960s: Teaches at Academia Bantu in São Pantaleão neighborhood
- 1966: Mestre Sapo arrives with Quarteto Aberrê
- 1968: Quarteto Aberrê returns; Sapo settles in São Luís
- 1971: Serejo dies during construction work

LOCAL CAPOEIRA CONTEXT:
When Serejo arrived, rodas of Mestre Diniz already existed at Praça Deodoro. Local variant called "carioca" had been practiced since mid-1800s.

PORTO DO ITAQUI:
Construction began 1960 by DNPVN (Departamento Nacional de Portos e Vias Navegáveis). Port became operational in 1972, one year after Serejo''s death.

SOURCES CONSULTED:
- cev.org.br/biblioteca/capoeira-no-do-maranhao-uma-historia-memoria-contraditoria/
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- capoeirahistory.com/general/in-the-hippie-era-the-rediscovery-of-capoeira-in-para-in-the-1970s/
- recantodasletras.com.br/artigos-de-esporte/7186431 (Mestre Índio interview)
- oimparcial.com.br/noticias/2017/06/morre-mestre-patinho-aos-64-anos/',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1936, precisão de ano):
Artigo acadêmico do CEV afirma explicitamente "Mestre Roberval Serejo (1936-1971)". Nenhuma data exata de nascimento encontrada.

ANO DE FALECIMENTO (1971, precisão de ano):
Confirmado por múltiplas fontes. Morreu enquanto trabalhava na construção do Porto do Itaqui. Era escafandrista da Marinha na época.

DISCREPÂNCIA DE NOME:
- "Roberval Serejo" - usado por capoeirahistory.com, fontes acadêmicas do CEV, relatórios de Artur Emídio
- "Roberval Cereja" - usado em entrevista com Mestre Índio Maranhão (provável erro de transcrição)
Usando "Roberval Serejo" como forma canônica baseado na maioria das fontes acadêmicas.

ORIGEM:
Fontes o descrevem como "maranhense" que foi ao Rio de Janeiro para servir na Marinha. Algumas fontes dizem que veio "do Rio de Janeiro para a construção do Porto do Itaqui" - isso indica que sua designação na Marinha era no Rio antes de ser transferido para o Maranhão.

MESTRES:
- Mestre Artur Emídio (confirmado pela lista de alunos do capoeirahistory.com e artigo do CEV)
- Estilo descrito como "capoeira primitiva" com raízes nas tradições cariocas

ALUNOS:
- Mestre Patinho (Antônio José da Conceição Ramos, 1953-2017) - treinou por ~2 anos
- Mestre Bezerra - depois foi para o Pará, desenvolveu capoeira esportiva
- Outros membros da Academia Bantu treinaram com ele

MEMBROS FUNDADORES DO GRUPO BANTU (1959):
Roberval Serejo, Babalu, Jessé Lobão, Patinho, Bizerra, Manuel Peitudinho, Murilo, Lourinho, Elmo Cascavel, Alô

CRONOLOGIA:
- Final dos anos 1950: Chega ao Maranhão para construção do Porto do Itaqui
- 1959: Funda o Grupo Bantu de Capoeira
- Anos 1960: Ensina na Academia Bantu no bairro de São Pantaleão
- 1966: Mestre Sapo chega com o Quarteto Aberrê
- 1968: Quarteto Aberrê retorna; Sapo se estabelece em São Luís
- 1971: Serejo morre durante trabalho de construção

CONTEXTO LOCAL DA CAPOEIRA:
Quando Serejo chegou, as rodas de Mestre Diniz já existiam na Praça Deodoro. Variante local chamada "carioca" era praticada desde meados do século XIX.

PORTO DO ITAQUI:
Construção iniciada em 1960 pelo DNPVN (Departamento Nacional de Portos e Vias Navegáveis). Porto tornou-se operacional em 1972, um ano após a morte de Serejo.

FONTES CONSULTADAS:
- cev.org.br/biblioteca/capoeira-no-do-maranhao-uma-historia-memoria-contraditoria/
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- capoeirahistory.com/general/in-the-hippie-era-the-rediscovery-of-capoeira-in-para-in-the-1970s/
- recantodasletras.com.br/artigos-de-esporte/7186431 (entrevista com Mestre Índio)
- oimparcial.com.br/noticias/2017/06/morre-mestre-patinho-aos-64-anos/'
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
