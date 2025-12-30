-- ============================================================
-- GENEALOGY PERSON: Paulo Flores
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1947, decade precision):
-- Brother Rafael Flores died November 5, 2016 at age 68 (born ~1948).
-- Mestre Gato quotes "Rafael of Bahia, Paulo born in Rio" suggesting
-- Paulo was born in Rio de Janeiro (not Bahia like Rafael).
-- In early 1963, Paulo and Rafael were young enough to be returning
-- to Salvador for "school vacations" to train with Bimba, suggesting
-- teenage years. If training at age 15-17 in 1963, born ~1945-1948.
-- Using 1947 as midpoint estimate with decade precision.
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
  'Paulo Flores Viana',
  'Paulo Flores',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.gruposenzala.org/mestres-do-grupo.html',
    'https://www.senzala.co.uk/history.html',
    'https://www.senzalamidlands.co.uk/group-senzala-since-1963/',
    'https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala',
    'https://www.lalaue.com/capoeira-schools/grupo-senzala-capoeira/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'One of the founding cordas vermelhas (red cords) of Grupo Senzala, Paulo Flores trained directly with Mestre Bimba in Salvador in 1963 before returning to Rio de Janeiro. Together with his brothers Rafael and Gilberto, he developed the Senzala methodology that blended Capoeira Regional technique with elements of Capoeira Angola and Rio''s street capoeira traditions. The Senzala style emphasized systematic training sequences, creativity in the roda, and open rodas welcoming capoeiristas from all groups. Paulo''s early teaching at the Laranjeiras terrace helped establish the foundations of what would become one of the most influential capoeira organizations in the world.',
  E'Um dos cordas vermelhas fundadores do Grupo Senzala, Paulo Flores treinou diretamente com Mestre Bimba em Salvador em 1963 antes de retornar ao Rio de Janeiro. Junto com seus irmãos Rafael e Gilberto, desenvolveu a metodologia Senzala que mesclava técnica da Capoeira Regional com elementos da Capoeira Angola e tradições de capoeira de rua do Rio. O estilo Senzala enfatizava sequências de treinamento sistemáticas, criatividade na roda e rodas abertas acolhendo capoeiristas de todos os grupos. O ensino inicial de Paulo no terraço de Laranjeiras ajudou a estabelecer as bases do que se tornaria uma das organizações de capoeira mais influentes do mundo.',
  -- Life dates
  1947,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Paulo Flores Viana is one of the founding mestres of Grupo Senzala and a pioneering figure who helped establish capoeira in Rio de Janeiro''s academic and cultural landscape. Born in Rio de Janeiro—the only one of the three Flores brothers not born in Bahia—Paulo grew up with strong ties to Salvador through his family''s roots in Brazil''s capoeira heartland.

In early 1963, during school vacations in Salvador, Paulo and his brother Rafael spent two months training at Mestre Bimba''s legendary academy. A capoeirista cousin had introduced Paulo to the academy, and this intensive training under the master of Capoeira Regional would prove foundational. Some sources also indicate the brothers trained with Mestre Pastinha, exposing them to Capoeira Angola traditions as well.

Upon returning to Rio de Janeiro later in 1963, Paulo organized weekly training sessions on the terrace of the apartment building where the Flores family lived in the Laranjeiras neighborhood. These informal gatherings on the rooftop terrace quickly attracted local youth. Paulo was reluctant at first—"I am only a student, so how can I teach you?" he reportedly told Fernando (later Mestre Gato), who had witnessed Paulo''s impressive skills at a party. But the young Bahian relented, and the terrace sessions grew.

In 1962, before the Bahia training, Paulo had begun learning capoeira in Rio at Academia Santana, run by Mestre Valdo Santana—brother of the famous fighter Valdemar Santana. This early exposure in Rio combined with his Bahian training to give Paulo a unique perspective bridging the two capoeira centers.

The founding nucleus of what would become Grupo Senzala took shape around the Flores brothers'' terrace: Paulo, Rafael, and Gilberto Flores, along with Gato, Gil Velho, Garrincha, Itamar, Peixinho, Danadinho, Preguiça, and Sorriso—teenagers who trained together and would become the generation to revolutionize capoeira teaching methodology.

In 1964, Academia Santana invited Paulo Flores and Gato to represent them at the Berimbau de Prata competition in Santa Teresa. Remarkably, the young capoeiristas placed third, competing against established groups including Mestre Artur Emídio''s.

The group moved from the Laranjeiras terrace to Largo de Machado in 1966. That same year, during an exhibition at the German Club (Clube Germânico), Paulo Flores suggested the name "Grupo Senzala"—a powerful political and cultural statement referencing the slave quarters where enslaved Africans were held on Brazilian plantations. The name declared capoeira''s connection to resistance and liberation.

In 1967, with the help of friends Tabosa and Fritz from Brasília, Grupo Senzala entered the prestigious Berimbau de Ouro tournament. The group won the championship for three consecutive years (1967-1969), permanently securing the trophy and establishing Senzala as a force in Brazilian capoeira. The group''s success brought national attention to their innovative teaching methods.

Mestre Gato later reflected on the collaborative nature of their success: "Rafael of Bahia, Paulo born in Rio and Gato from Pernambuco formed the triple base of the future Grupo Senzala". This geographic diversity—Bahia, Rio, and Pernambuco—enriched the group with different regional perspectives and styles.

Today, Mestre Paulo Flores remains one of the 17 active cordas vermelhas (red cords) of Grupo Senzala, alongside Danadinho, Gato, Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, and Azeite. His brother Rafael passed away on November 5, 2016, at age 68, and Peixinho died in May 2011. But the collaborative leadership model they pioneered continues, with Grupo Senzala having graduated over 96 mestres and influenced the methodology of most major capoeira organizations worldwide.',
  -- Extended content (bio_pt)
  E'Paulo Flores Viana é um dos mestres fundadores do Grupo Senzala e uma figura pioneira que ajudou a estabelecer a capoeira no cenário acadêmico e cultural do Rio de Janeiro. Nascido no Rio de Janeiro—o único dos três irmãos Flores não nascido na Bahia—Paulo cresceu com fortes laços com Salvador através das raízes de sua família no coração da capoeira brasileira.

No início de 1963, durante as férias escolares em Salvador, Paulo e seu irmão Rafael passaram dois meses treinando na lendária academia de Mestre Bimba. Um primo capoeirista havia apresentado Paulo à academia, e esse treinamento intensivo sob o mestre da Capoeira Regional provaria ser fundamental. Algumas fontes também indicam que os irmãos treinaram com Mestre Pastinha, expondo-os também às tradições da Capoeira Angola.

Ao retornar ao Rio de Janeiro mais tarde em 1963, Paulo organizou sessões de treinamento semanais no terraço do prédio onde a família Flores morava no bairro de Laranjeiras. Esses encontros informais no terraço rapidamente atraíram a juventude local. Paulo foi relutante no início—"Sou apenas um aluno, como posso ensinar você?" ele teria dito a Fernando (mais tarde Mestre Gato), que havia testemunhado as impressionantes habilidades de Paulo em uma festa. Mas o jovem baiano cedeu, e as sessões no terraço cresceram.

Em 1962, antes do treinamento na Bahia, Paulo havia começado a aprender capoeira no Rio na Academia Santana, dirigida por Mestre Valdo Santana—irmão do famoso lutador Valdemar Santana. Essa exposição inicial no Rio combinada com seu treinamento baiano deu a Paulo uma perspectiva única ligando os dois centros de capoeira.

O núcleo fundador do que se tornaria o Grupo Senzala tomou forma ao redor do terraço dos irmãos Flores: Paulo, Rafael e Gilberto Flores, junto com Gato, Gil Velho, Garrincha, Itamar, Peixinho, Danadinho, Preguiça e Sorriso—adolescentes que treinavam juntos e se tornariam a geração a revolucionar a metodologia de ensino da capoeira.

Em 1964, a Academia Santana convidou Paulo Flores e Gato para representá-los na competição Berimbau de Prata em Santa Teresa. Notavelmente, os jovens capoeiristas ficaram em terceiro lugar, competindo contra grupos estabelecidos incluindo o de Mestre Artur Emídio.

O grupo mudou-se do terraço de Laranjeiras para o Largo de Machado em 1966. Nesse mesmo ano, durante uma exibição no Clube Germânico, Paulo Flores sugeriu o nome "Grupo Senzala"—uma poderosa declaração política e cultural referenciando as senzalas onde africanos escravizados eram mantidos nas plantações brasileiras. O nome declarava a conexão da capoeira com resistência e libertação.

Em 1967, com a ajuda dos amigos Tabosa e Fritz de Brasília, o Grupo Senzala entrou no prestigioso torneio Berimbau de Ouro. O grupo venceu o campeonato por três anos consecutivos (1967-1969), assegurando permanentemente o troféu e estabelecendo o Senzala como uma força na capoeira brasileira. O sucesso do grupo trouxe atenção nacional para seus métodos de ensino inovadores.

Mestre Gato mais tarde refletiu sobre a natureza colaborativa de seu sucesso: "Rafael da Bahia, Paulo nascido no Rio e Gato de Pernambuco formaram a base tripla do futuro Grupo Senzala". Essa diversidade geográfica—Bahia, Rio e Pernambuco—enriqueceu o grupo com diferentes perspectivas e estilos regionais.

Hoje, Mestre Paulo Flores permanece como um dos 17 cordas vermelhas ativos do Grupo Senzala, ao lado de Danadinho, Gato, Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda e Azeite. Seu irmão Rafael faleceu em 5 de novembro de 2016, aos 68 anos, e Peixinho morreu em maio de 2011. Mas o modelo de liderança colaborativa que eles pioneiraram continua, com o Grupo Senzala tendo formado mais de 96 mestres e influenciado a metodologia da maioria das principais organizações de capoeira em todo o mundo.',
  -- Achievements
  E'- Co-founder of Grupo Senzala (1963, formally named 1966)
- Suggested the name "Grupo Senzala" at the German Club exhibition (1966)
- Trained with Mestre Bimba in Salvador (1963, two months of intensive training)
- Third place at Berimbau de Prata competition with Mestre Gato (1964)
- Part of founding nucleus that won Berimbau de Ouro three consecutive years (1967-1969)
- One of 17 active cordas vermelhas (red cords) of Grupo Senzala
- Pioneered Senzala teaching methodology blending Regional and Angola traditions
- Introduced systematic training sequences that influenced capoeira groups worldwide
- Early training at Academia Santana under Mestre Valdo Santana in Rio (1962)',
  E'- Co-fundador do Grupo Senzala (1963, formalmente nomeado 1966)
- Sugeriu o nome "Grupo Senzala" na exibição do Clube Germânico (1966)
- Treinou com Mestre Bimba em Salvador (1963, dois meses de treinamento intensivo)
- Terceiro lugar na competição Berimbau de Prata com Mestre Gato (1964)
- Parte do núcleo fundador que venceu o Berimbau de Ouro por três anos consecutivos (1967-1969)
- Um dos 17 cordas vermelhas ativos do Grupo Senzala
- Pioneiro na metodologia de ensino Senzala mesclando tradições Regional e Angola
- Introduziu sequências de treinamento sistemáticas que influenciaram grupos de capoeira mundialmente
- Treinamento inicial na Academia Santana sob Mestre Valdo Santana no Rio (1962)',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1947, decade precision):
Brother Rafael Flores died November 5, 2016 at age 68 (per obituary headlines), suggesting Rafael born ~1948.
Paulo and Rafael trained together during school vacations in early 1963 at Bimba''s academy—indicating teenage years.
Mestre Gato''s quote states "Rafael of Bahia, Paulo born in Rio"—confirming Paulo was born in Rio de Janeiro.
If training at age 15-17 in 1963, birth year ~1945-1948. Using 1947 as midpoint with decade precision.

BIRTHPLACE:
- Rio de Janeiro - per Mestre Gato quote in Portal Capoeira interview
- Some sources say all three brothers are "from Bahia" (family origin, not birthplace)
- Rafael was born in Bahia, Paulo born in Rio (family moved from Salvador to Rio)

NAME:
- "Paulo Flores Viana" - official Senzala website (gruposenzala.org)
- "Paulo Flores" - common abbreviated form
- Using "Paulo Flores" as apelido (how he is known in capoeira community)

TEACHERS:
- Mestre Bimba (Regional) - 2 months training in Salvador, early 1963, with brother Rafael
- Mestre Pastinha (Angola) - some sources indicate training with Pastinha as well
- Mestre Valdo Santana - Academia Santana in Rio, 1962 (before Salvador trip)
- Note: Capoeirista cousin introduced him to Bimba''s academy

TRAINING COMPANIONS (founding nucleus):
- Rafael Flores (brother, †Nov 5, 2016 at age 68)
- Gilberto Flores (brother)
- Gato (Fernando Campelo Cavalcanti de Albuquerque, b.1947)
- Gil Velho (Gato''s brother)
- Garrincha
- Itamar
- Peixinho (Marcelo Azevedo Guimarães, 1947-2011)
- Claudio Danadinho (Cláudio José Queiroz)
- Preguiça
- Sorriso

CURRENT ACTIVE CORDAS VERMELHAS (as of 2024):
Paulo Flores, Claudio Danadinho, Gato, Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, Azeite
Deceased: Rafael Flores (†2016), Peixinho (†2011)

TIMELINE:
- 1962: Began training at Academia Santana (Valdo Santana) in Rio
- Early 1963: 2 months training at Mestre Bimba''s academy in Salvador with Rafael
- 1963: Organized weekly training sessions on Laranjeiras terrace with brothers
- 1964: Berimbau de Prata competition (3rd place with Gato, representing Academia Santana)
- 1966: Group moved to Largo de Machado
- 1966: Suggested name "Grupo Senzala" at German Club exhibition
- 1967-1969: Senzala won Berimbau de Ouro three consecutive years
- Present: One of 17 active cordas vermelhas

LOCATIONS:
- Laranjeiras, Rio de Janeiro (family apartment terrace, training site 1963-1966)
- Largo de Machado, Rio de Janeiro (group relocated 1966)
- Cinelândia, Rio de Janeiro (Valdo Santana''s academy location)

FAMILY:
- Brother: Rafael Flores Viana (†Nov 5, 2016, age 68)
- Brother: Gilberto Flores (status unknown)
- Note: Family originally from Salvador, moved to Rio de Janeiro',
  E'ESTIMATIVA ANO DE NASCIMENTO (1947, precisão década):
Irmão Rafael Flores morreu em 5 de novembro de 2016 aos 68 anos (conforme manchetes de obituário), sugerindo que Rafael nasceu ~1948.
Paulo e Rafael treinaram juntos durante férias escolares no início de 1963 na academia de Bimba—indicando adolescência.
Citação de Mestre Gato afirma "Rafael da Bahia, Paulo nascido no Rio"—confirmando que Paulo nasceu no Rio de Janeiro.
Se treinando aos 15-17 anos em 1963, ano de nascimento ~1945-1948. Usando 1947 como ponto médio com precisão de década.

LOCAL DE NASCIMENTO:
- Rio de Janeiro - conforme citação de Mestre Gato em entrevista Portal Capoeira
- Algumas fontes dizem que os três irmãos são "da Bahia" (origem familiar, não local de nascimento)
- Rafael nasceu na Bahia, Paulo nasceu no Rio (família mudou de Salvador para Rio)

NOME:
- "Paulo Flores Viana" - site oficial Senzala (gruposenzala.org)
- "Paulo Flores" - forma abreviada comum
- Usando "Paulo Flores" como apelido (como é conhecido na comunidade de capoeira)

MESTRES:
- Mestre Bimba (Regional) - 2 meses de treino em Salvador, início de 1963, com irmão Rafael
- Mestre Pastinha (Angola) - algumas fontes indicam treino com Pastinha também
- Mestre Valdo Santana - Academia Santana no Rio, 1962 (antes da viagem a Salvador)
- Nota: Primo capoeirista o apresentou à academia de Bimba

COMPANHEIROS DE TREINO (núcleo fundador):
- Rafael Flores (irmão, †5 nov 2016 aos 68 anos)
- Gilberto Flores (irmão)
- Gato (Fernando Campelo Cavalcanti de Albuquerque, n.1947)
- Gil Velho (irmão de Gato)
- Garrincha
- Itamar
- Peixinho (Marcelo Azevedo Guimarães, 1947-2011)
- Claudio Danadinho (Cláudio José Queiroz)
- Preguiça
- Sorriso

CORDAS VERMELHAS ATIVOS ATUAIS (em 2024):
Paulo Flores, Claudio Danadinho, Gato, Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, Azeite
Falecidos: Rafael Flores (†2016), Peixinho (†2011)

CRONOLOGIA:
- 1962: Começou a treinar na Academia Santana (Valdo Santana) no Rio
- Início 1963: 2 meses treinando na academia de Mestre Bimba em Salvador com Rafael
- 1963: Organizou sessões de treino semanais no terraço de Laranjeiras com os irmãos
- 1964: Competição Berimbau de Prata (3º lugar com Gato, representando Academia Santana)
- 1966: Grupo mudou para Largo de Machado
- 1966: Sugeriu nome "Grupo Senzala" em exibição no Clube Germânico
- 1967-1969: Senzala venceu Berimbau de Ouro por três anos consecutivos
- Presente: Um dos 17 cordas vermelhas ativos

LOCALIZAÇÕES:
- Laranjeiras, Rio de Janeiro (terraço do apartamento familiar, local de treino 1963-1966)
- Largo de Machado, Rio de Janeiro (grupo realocou 1966)
- Cinelândia, Rio de Janeiro (localização da academia de Valdo Santana)

FAMÍLIA:
- Irmão: Rafael Flores Viana (†5 nov 2016, 68 anos)
- Irmão: Gilberto Flores (situação desconhecida)
- Nota: Família originalmente de Salvador, mudou para Rio de Janeiro'
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
