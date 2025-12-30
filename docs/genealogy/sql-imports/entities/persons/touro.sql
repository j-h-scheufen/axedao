-- ============================================================
-- GENEALOGY PERSON: Touro
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH DATE: November 3, 1950 - Confirmed by multiple sources
-- including nossa-tribo.com and malandros-touro.com (via web search).
--
-- BIRTH PLACE: Cachoeiro do Itapemirim, Espírito Santo, Brazil
-- Came to Rio de Janeiro where he grew up.
--
-- STYLE: Mixed - Practices and preserves "Capoeira Angola de
-- São Bento Grande" - an aggressive form of Capoeira Angola from
-- Rio de Janeiro, descended from the Leopoldina lineage.
--
-- LINEAGE: Prata Preta (1868) → Campanhão (1900) → Quinzinho (1925)
-- → Leopoldina (1933-2007) → Celso Pepe (1949) → Touro (1950)
--
-- SIGNIFICANCE: "Living Legend of Carioca Capoeira"; founder of
-- Grupo de Capoeira Corda de Bambas (1964); preserves authentic
-- Rio capoeira tradition; known for rich knowledge of Brazilian
-- history; television actor; honored with "Homens de Fibra"
-- monument in Penha (2021).
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
  'Antônio Oliveira Bemvindo',
  'Touro',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://nossa-tribo.com/mestre-touro/',
    'https://capoeirahistory.com/mestre/master-celso-pepe-1949/'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Mestre Touro practices and preserves "Capoeira Angola de São Bento Grande" - an aggressive form of Capoeira Angola that developed in Rio de Janeiro. This style represents the authentic carioca tradition descending from the Leopoldina lineage. As Grande-Mestre Touro describes it, capoeira is a "game of dexterity, agility, flexibility and creativity". The style combines the malandro tradition of Rio''s street capoeira with the musical and ritualistic elements brought from Bahia, creating a uniquely carioca approach that is both martial and artistic.',
  E'Mestre Touro pratica e preserva a "Capoeira Angola de São Bento Grande" - uma forma agressiva de Capoeira Angola que se desenvolveu no Rio de Janeiro. Este estilo representa a autêntica tradição carioca descendente da linhagem de Leopoldina. Como Grande-Mestre Touro descreve, a capoeira é um "jogo de destreza, agilidade, flexibilidade e criatividade". O estilo combina a tradição malandra da capoeira de rua do Rio com os elementos musicais e ritualísticos trazidos da Bahia, criando uma abordagem exclusivamente carioca que é tanto marcial quanto artística.',
  -- Life dates
  1950,
  'exact'::genealogy.date_precision,
  'Cachoeiro do Itapemirim, Espírito Santo, Brazil',
  NULL,  -- Still alive as of 2021 (monument unveiling)
  NULL,
  NULL,
  -- Extended content (English)
  E'Antônio Oliveira Bemvindo, known as Mestre Touro, was born on November 3, 1950, in Cachoeiro do Itapemirim, Espírito Santo, Brazil. He moved to Rio de Janeiro where he would become one of the most significant figures in preserving the authentic carioca capoeira tradition.

His capoeira journey began in 1957 when, as a child in the Penha neighborhood, he was introduced to the art as a game by his childhood friend Celso Pepe. The two boys grew up together learning capoeira, with Touro later becoming one of Celso Pepe''s most accomplished students. In the Penha neighborhood, Celso Pepe''s students were famously known as "os alunos peludos de Pepe" (Pepe''s hairy pupils), a testament to their recognition in the local community.

In 1964, at just fourteen years old, Touro took over Grupo de Capoeira Cativeiro from his teacher Celso Pepe. On April 23, 1964, he established his own group, Grupo de Capoeira Corda de Bambas (also written as "Corda Bamba"), which would become one of the oldest continuously operating capoeira groups in Rio de Janeiro. The group''s headquarters was established on Rua Paul Muller, 363, in the Penha neighborhood.

Early in his career, Touro worked various jobs to support himself. He worked as a market worker carrying bags and freight, and after completing his military service, he spent three years as a stevedore (DTM). It was during his time on the docks that he met Banzo Africano, who introduced him to Tele Catch (television wrestling). This connection would prove pivotal, as actor José de Arimatéia spotted him and opened doors to television.

Touro developed a successful parallel career as an actor in Brazilian television. He appeared in numerous TV programs including the immensely popular comedy show "Os Trapalhões", as well as "Chico City" and "Praça da Alegria". He also worked in telenovelas such as "Escalada", "Memória de Amor", "Cambalacho", and "Escrava Isaura". In 1980, he appeared in the Brazilian comedy film "O Incrível Monstro Trapalhão", released in January 1981.

Throughout his career, Touro taught capoeira in numerous neighborhoods across Rio de Janeiro: Penha, Vista Alegre, Irajá, Parada de Lucas, Cordovil, Vigário Geral, Catete, Bonsucesso, Honório Gurgel, and Praça Tiradentes. His commitment to teaching helped spread the carioca style throughout the city and created new generations of capoeiristas.

His brother, Mestre Dentinho (Alcino Oliveira Bemvindo, 1952-2011), was also a renowned capoeirista. The two brothers competed together as part of the "unbeatable team" - the Guanabara team - which won the 1st Brazilian Capoeira Championship in 1973, securing victories in both individual and team competitions. Together, they led the famous "Roda da Penha", one of the most traditional capoeira circles in Rio de Janeiro, which is registered as Intangible Cultural Heritage of the Carioca people.

Touro entered politics when he met councilman Carlos de Carvalho, who employed him as a legislative assistant at the Municipal Chamber of Rio de Janeiro, a position he held for many years.

His capoeira work extended internationally, teaching in US cities including San Diego, Los Angeles, Dallas, Oakland, and Detroit, as well as Castellón and Valencia in Spain. His student Mestre Preto Velho (Dennis Newsome) founded Os Malandros de Mestre Touro in San Diego, California, to honor his teacher and propagate the carioca tradition internationally. Mestre Preto Velho became the first African born outside of Brazil to hold the title of "Master of Capoeira" in its 500 years of history.

On October 30, 2021, the "Homens de Fibra" (Men of Fiber) monument was inaugurated at Largo da Penha, at the junction of Avenidas Nossa Senhora da Penha and Braz de Pina, honoring Mestres Touro and Dentinho as "giant figures of Rio de Janeiro''s capoeira". The life-size statue depicts the brothers in characteristic capoeira movements, inspired by an old performance by Dentinho.

Mestre Touro is known as the "Living Legend of Carioca Capoeira" for his role in preserving the characteristics of capoeira from Rio de Janeiro and the carioca capoeiragem tradition. He is equally renowned for his rich knowledge of Brazilian history. His lineage represents the authentic carioca tradition: Prata Preta → Campanhão → Quinzinho → Leopoldina → Celso Pepe → Touro, connecting the nineteenth-century street capoeira of Rio to the contemporary global art form.',
  -- Extended content (Portuguese)
  E'Antônio Oliveira Bemvindo, conhecido como Mestre Touro, nasceu em 3 de novembro de 1950, em Cachoeiro do Itapemirim, Espírito Santo, Brasil. Mudou-se para o Rio de Janeiro onde se tornaria uma das figuras mais significativas na preservação da autêntica tradição da capoeira carioca.

Sua jornada na capoeira começou em 1957 quando, ainda criança no bairro da Penha, foi introduzido à arte como um jogo pelo seu amigo de infância Celso Pepe. Os dois meninos cresceram juntos aprendendo capoeira, e Touro mais tarde tornou-se um dos alunos mais realizados de Celso Pepe. No bairro da Penha, os alunos de Celso Pepe eram famosamente conhecidos como "os alunos peludos de Pepe", um testemunho de seu reconhecimento na comunidade local.

Em 1964, com apenas quatorze anos, Touro assumiu o Grupo de Capoeira Cativeiro de seu mestre Celso Pepe. Em 23 de abril de 1964, ele estabeleceu seu próprio grupo, Grupo de Capoeira Corda de Bambas (também escrito como "Corda Bamba"), que se tornaria um dos grupos de capoeira mais antigos em operação contínua no Rio de Janeiro. A sede do grupo foi estabelecida na Rua Paul Muller, 363, no bairro da Penha.

No início de sua carreira, Touro trabalhou em vários empregos para se sustentar. Trabalhou como carregador no mercado, transportando sacas e fretes, e após completar o serviço militar, passou três anos como estivador (DTM). Foi durante seu tempo nas docas que conheceu Banzo Africano, que o introduziu ao Tele Catch (luta livre televisiva). Esta conexão seria fundamental, pois o ator José de Arimatéia o descobriu e abriu portas para a televisão.

Touro desenvolveu uma carreira paralela de sucesso como ator na televisão brasileira. Apareceu em numerosos programas de TV incluindo o imensamente popular programa de comédia "Os Trapalhões", assim como "Chico City" e "Praça da Alegria". Também trabalhou em telenovelas como "Escalada", "Memória de Amor", "Cambalacho" e "Escrava Isaura". Em 1980, apareceu no filme de comédia brasileiro "O Incrível Monstro Trapalhão", lançado em janeiro de 1981.

Ao longo de sua carreira, Touro ensinou capoeira em numerosos bairros do Rio de Janeiro: Penha, Vista Alegre, Irajá, Parada de Lucas, Cordovil, Vigário Geral, Catete, Bonsucesso, Honório Gurgel e Praça Tiradentes. Seu compromisso com o ensino ajudou a difundir o estilo carioca por toda a cidade e criou novas gerações de capoeiristas.

Seu irmão, Mestre Dentinho (Alcino Oliveira Bemvindo, 1952-2011), também foi um capoeirista renomado. Os dois irmãos competiram juntos como parte do "time invencível" - a equipe Guanabara - que venceu o 1º Campeonato Brasileiro de Capoeira em 1973, conquistando vitórias nas modalidades individual e por equipes. Juntos, lideraram a famosa "Roda da Penha", uma das rodas de capoeira mais tradicionais do Rio de Janeiro, que é registrada como Patrimônio Cultural Imaterial do povo carioca.

Touro entrou na política quando conheceu o vereador Carlos de Carvalho, que o empregou como assessor legislativo na Câmara Municipal do Rio de Janeiro, cargo que ocupou por muitos anos.

Seu trabalho com a capoeira se estendeu internacionalmente, ensinando em cidades dos EUA incluindo San Diego, Los Angeles, Dallas, Oakland e Detroit, assim como Castellón e Valencia na Espanha. Seu aluno Mestre Preto Velho (Dennis Newsome) fundou Os Malandros de Mestre Touro em San Diego, Califórnia, para honrar seu mestre e propagar a tradição carioca internacionalmente. Mestre Preto Velho tornou-se o primeiro africano nascido fora do Brasil a receber o título de "Mestre de Capoeira" em seus 500 anos de história.

Em 30 de outubro de 2021, o monumento "Homens de Fibra" foi inaugurado no Largo da Penha, no cruzamento das Avenidas Nossa Senhora da Penha e Braz de Pina, homenageando os Mestres Touro e Dentinho como "figuras gigantes da capoeira carioca". A estátua em tamanho real retrata os irmãos em movimentos característicos da capoeira, inspirada em uma antiga apresentação de Dentinho.

Mestre Touro é conhecido como a "Lenda Viva da Capoeira Carioca" por seu papel na preservação das características da capoeira do Rio de Janeiro e da tradição da capoeiragem carioca. É igualmente renomado por seu rico conhecimento da história brasileira. Sua linhagem representa a autêntica tradição carioca: Prata Preta → Campanhão → Quinzinho → Leopoldina → Celso Pepe → Touro, conectando a capoeira de rua do século XIX no Rio à forma de arte global contemporânea.',
  -- Achievements (English)
  E'- Founder of Grupo de Capoeira Corda de Bambas (April 23, 1964), one of Rio''s oldest active groups
- "Living Legend of Carioca Capoeira" title for preserving authentic carioca tradition
- 1973: Won 1st Brazilian Capoeira Championship (individual and team) with Guanabara team alongside brother Dentinho
- Co-leader of Roda da Penha, registered as Intangible Cultural Heritage of Rio de Janeiro
- 2021: Honored with "Homens de Fibra" monument at Largo da Penha
- Television actor: Os Trapalhões, Chico City, Praça da Alegria, and telenovelas (Escalada, Memória de Amor, Cambalacho, Escrava Isaura)
- Film appearance: "O Incrível Monstro Trapalhão" (1980)
- International ambassador teaching in USA (San Diego, Los Angeles, Dallas, Oakland, Detroit) and Spain (Castellón, Valencia)
- Teacher of Mestre Preto Velho, first African born outside Brazil to receive Mestre title',
  -- Achievements (Portuguese)
  E'- Fundador do Grupo de Capoeira Corda de Bambas (23 de abril de 1964), um dos grupos mais antigos em atividade no Rio
- Título de "Lenda Viva da Capoeira Carioca" por preservar a autêntica tradição carioca
- 1973: Venceu o 1º Campeonato Brasileiro de Capoeira (individual e equipes) com a equipe Guanabara ao lado do irmão Dentinho
- Co-líder da Roda da Penha, registrada como Patrimônio Cultural Imaterial do Rio de Janeiro
- 2021: Homenageado com o monumento "Homens de Fibra" no Largo da Penha
- Ator de televisão: Os Trapalhões, Chico City, Praça da Alegria e telenovelas (Escalada, Memória de Amor, Cambalacho, Escrava Isaura)
- Aparição em filme: "O Incrível Monstro Trapalhão" (1980)
- Embaixador internacional ensinando nos EUA (San Diego, Los Angeles, Dallas, Oakland, Detroit) e Espanha (Castellón, Valencia)
- Mestre de Mestre Preto Velho, primeiro africano nascido fora do Brasil a receber o título de Mestre',
  -- Researcher notes (English)
  E'BIRTH DATE: November 3, 1950 - Confirmed by nossa-tribo.com and malandros-touro.com via web search.

BIRTH PLACE: Cachoeiro do Itapemirim, Espírito Santo - Same hometown as his brother Mestre Dentinho.

LINEAGE:
Prata Preta (b. 1868) → Campanhão (b. 1900) → Quinzinho (b. 1925) → Leopoldina (1933-2007) → Celso Pepe (b. 1949) → Touro (b. 1950)

TEACHERS:
- Mestre Celso Pepe (childhood friend, primary teacher, ~1957 onwards)

STUDENTS:
- Mestre Preto Velho (Dennis Newsome, b. June 21, 1958) - founder of Os Malandros de Mestre Touro
- Mestre Toni Vargas - received blue cord at Grupo Corda Bamba (mid-1970s)
- Mestre Braga (Antonio Neves Braga) - trained at Grupo Corda Bamba after Capoeira Regional Palmares disbanded
- Mestre Alcino Auê (Alcino Vieira Bemvindo) - nephew, son of Dentinho

FAMILY:
- Brother: Mestre Dentinho (Alcino Oliveira Bemvindo, 1952-2011)
- Nephew: Mestre Alcino Auê (Alcino Vieira Bemvindo, Dentinho''s son)

NOTE ON FAMILY: Sources describe Touro and Dentinho both as "brothers" and Alcino Auê as nephew of Touro and son of Dentinho. This is consistent. The "Homens de Fibra" monument honors them as brothers.

GROUPS FOUNDED/LED:
- Grupo de Capoeira Corda de Bambas (founded April 23, 1964; still active)
- Previously took over Grupo de Capoeira Cativeiro from Celso Pepe (1964)

TEACHING LOCATIONS:
- Penha (Rua Paul Muller, 363 - headquarters; also Rua Nicarágua 174, Leopoldinense academy until 1981)
- Vista Alegre, Irajá, Parada de Lucas, Cordovil, Vigário Geral, Catete, Bonsucesso, Honório Gurgel, Praça Tiradentes

MEDIA APPEARANCES:
- TV programs: Os Trapalhões, Chico City, Praça da Alegria
- Telenovelas: Escalada, Memória de Amor, Cambalacho, Escrava Isaura, and others
- Film: "O Incrível Monstro Trapalhão" (1980, released January 1981)

CAREER:
- Market worker (carrying bags, freight)
- Stevedore (DTM) - 3 years after military service; met Banzo Africano on docks
- Television actor - discovered by José de Arimatéia through Tele Catch connection
- Legislative assistant at Municipal Chamber of Rio de Janeiro (through councilman Carlos de Carvalho)

INTERNATIONAL WORK:
- USA: San Diego, Los Angeles, Dallas, Oakland, Detroit
- Spain: Castellón, Valencia

RODA DA PENHA: Traditional street roda co-led with Dentinho; registered as Intangible Cultural Heritage; took place during October-November festival season near Nossa Senhora da Penha church.

MONUMENT: "Homens de Fibra" inaugurated October 30, 2021, at Largo da Penha (junction of Avenidas Nossa Senhora da Penha and Braz de Pina); life-size statues depicting Touro and Dentinho in capoeira movements.

SOURCES CONSULTED:
- nossa-tribo.com/mestre-touro/ (primary)
- capoeirahistory.com/mestre/master-celso-pepe-1949/ (Celso Pepe profile with Touro info)
- capoeirahistory.com/the-penha-roda/ (Penha roda history)
- capoeirahistory.com/mestre/master-dentinho-1952-2011/ (Dentinho profile with family info)
- lalaue.com/learn-capoeira/mestre-toni-vargas (student info)
- lalaue.com/learn-capoeira/mestre-braga (student info)
- capoeirawiki.org/wiki/Toni_Vargas (student info)
- rodadecapoeira.com.br/mestre/Mestre-Touro (via web search)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 3 de novembro de 1950 - Confirmado por nossa-tribo.com e malandros-touro.com via busca web.

LOCAL DE NASCIMENTO: Cachoeiro do Itapemirim, Espírito Santo - Mesma cidade natal do irmão Mestre Dentinho.

LINHAGEM:
Prata Preta (n. 1868) → Campanhão (n. 1900) → Quinzinho (n. 1925) → Leopoldina (1933-2007) → Celso Pepe (n. 1949) → Touro (n. 1950)

MESTRES:
- Mestre Celso Pepe (amigo de infância, mestre principal, ~1957 em diante)

ALUNOS:
- Mestre Preto Velho (Dennis Newsome, n. 21 jun. 1958) - fundador de Os Malandros de Mestre Touro
- Mestre Toni Vargas - recebeu corda azul no Grupo Corda Bamba (meados dos anos 1970)
- Mestre Braga (Antonio Neves Braga) - treinou no Grupo Corda Bamba após dissolução do Capoeira Regional Palmares
- Mestre Alcino Auê (Alcino Vieira Bemvindo) - sobrinho, filho de Dentinho

FAMÍLIA:
- Irmão: Mestre Dentinho (Alcino Oliveira Bemvindo, 1952-2011)
- Sobrinho: Mestre Alcino Auê (Alcino Vieira Bemvindo, filho de Dentinho)

NOTA SOBRE FAMÍLIA: Fontes descrevem Touro e Dentinho como "irmãos" e Alcino Auê como sobrinho de Touro e filho de Dentinho. Isso é consistente. O monumento "Homens de Fibra" os homenageia como irmãos.

GRUPOS FUNDADOS/LIDERADOS:
- Grupo de Capoeira Corda de Bambas (fundado 23 de abril de 1964; ainda ativo)
- Anteriormente assumiu Grupo de Capoeira Cativeiro de Celso Pepe (1964)

LOCAIS DE ENSINO:
- Penha (Rua Paul Muller, 363 - sede; também Rua Nicarágua 174, academia Leopoldinense até 1981)
- Vista Alegre, Irajá, Parada de Lucas, Cordovil, Vigário Geral, Catete, Bonsucesso, Honório Gurgel, Praça Tiradentes

APARIÇÕES NA MÍDIA:
- Programas de TV: Os Trapalhões, Chico City, Praça da Alegria
- Telenovelas: Escalada, Memória de Amor, Cambalacho, Escrava Isaura, e outras
- Filme: "O Incrível Monstro Trapalhão" (1980, lançado em janeiro de 1981)

CARREIRA:
- Carregador de mercado (sacas, fretes)
- Estivador (DTM) - 3 anos após serviço militar; conheceu Banzo Africano nas docas
- Ator de televisão - descoberto por José de Arimatéia através da conexão com Tele Catch
- Assessor legislativo na Câmara Municipal do Rio de Janeiro (através do vereador Carlos de Carvalho)

TRABALHO INTERNACIONAL:
- EUA: San Diego, Los Angeles, Dallas, Oakland, Detroit
- Espanha: Castellón, Valencia

RODA DA PENHA: Roda de rua tradicional co-liderada com Dentinho; registrada como Patrimônio Cultural Imaterial; acontecia durante a temporada de festivais de outubro-novembro perto da igreja de Nossa Senhora da Penha.

MONUMENTO: "Homens de Fibra" inaugurado em 30 de outubro de 2021, no Largo da Penha (cruzamento das Avenidas Nossa Senhora da Penha e Braz de Pina); estátuas em tamanho real retratando Touro e Dentinho em movimentos de capoeira.

FONTES CONSULTADAS:
- nossa-tribo.com/mestre-touro/ (primária)
- capoeirahistory.com/mestre/master-celso-pepe-1949/ (perfil de Celso Pepe com info sobre Touro)
- capoeirahistory.com/the-penha-roda/ (história da roda da Penha)
- capoeirahistory.com/mestre/master-dentinho-1952-2011/ (perfil de Dentinho com info familiar)
- lalaue.com/learn-capoeira/mestre-toni-vargas (info de alunos)
- lalaue.com/learn-capoeira/mestre-braga (info de alunos)
- capoeirawiki.org/wiki/Toni_Vargas (info de alunos)
- rodadecapoeira.com.br/mestre/Mestre-Touro (via busca web)'
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
