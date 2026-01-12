-- ============================================================
-- GENEALOGY PERSON: Loremil Machado
-- Generated: 2025-01-10
-- ============================================================
-- BIRTH YEAR ESTIMATION (1953, year precision):
-- Sources conflict between 1953 and 1954. CapoeiraWiki and most detailed
-- sources list May 10, 1953. Find a Grave lists 1954. New York Times
-- obituary described him as "40 years old" at death (March 11, 1994),
-- which would indicate birth in 1953-1954. Using 1953 as majority
-- consensus from detailed sources.
--
-- Full name: Josivaldo de Souza Machado
-- Also known as: Marretinha
-- Nephew and first-generation student of Mestre Nô (Norival Moreira de Oliveira)
-- Co-founder of capoeira in the United States with Jelon Vieira (1975)
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Josivaldo de Souza Machado',
  'Loremil',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirawiki.org/wiki/Loremil_Machado', 'https://en.wikipedia.org/wiki/Loremil_Machado']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Trained under Mestre Nô in Capoeira Angola; nephew and first-generation student of Nô. Known for his "wildly free and expressive jogo in the roda and in life." His style was marked by intensity, athleticism, and improvisational flair. Mestre Jelon Vieira recalled that "Loremil could spin on his head beautifully"—a movement that would later be incorporated into breakdancing as the "head spin" (peão de cabeça).',
  E'Treinou sob Mestre Nô em Capoeira Angola; sobrinho e aluno de primeira geração de Nô. Conhecido por seu "jogo selvagemente livre e expressivo na roda e na vida." Seu estilo era marcado por intensidade, atleticismo e flair improvisacional. Mestre Jelon Vieira lembrou que "Loremil conseguia girar na cabeça lindamente"—um movimento que mais tarde seria incorporado ao breakdancing como o "head spin" (peão de cabeça).',
  -- Life dates
  1953,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1994,
  'exact'::genealogy.date_precision,
  'Columbia-Presbyterian Hospital, Manhattan, New York',
  -- bio_en
  E'Josivaldo de Souza Machado (May 10, 1953 – March 11, 1994), known professionally as Loremil Machado and by his capoeira apelido "Marretinha," was a dancer, choreographer, percussionist, and capoeira mestre who helped introduce capoeira to the United States. He was a nephew and first-generation student of Mestre Nô (Norival Moreira de Oliveira), graduating among the first group of students from Nô''s academies in Salvador.

Loremil''s jogo was legendary. As one contemporaneous account described: "Loremil''s wildly free and expressive jogo in the roda and in life touched and inspired everyone who saw him." Unlike Mestres Acordeon and Jelon, who taught consistently, Loremil "never taught capoeira classes consistently," which may explain why his role as a founder of capoeira in the United States has sometimes been underrecognized.

In 1974, Loremil performed with the folkloric group Viva Bahia in the stage production "Três Marias" and came to New York City. The following year, in April 1975, he and fellow Bahian choreographer Jelon Vieira arrived in New York to perform in "Parto," a play by Brazilian playwrights Gilda Grillo and Maria Isabel Barreno. They became the first capoeira mestres to live and teach in the United States.

Their early work was humble but impactful. They performed capoeira demonstrations at public schools in the Bronx—the birthplace of hip-hop and breakdancing. Mestre Jelon recalled: "Loremil and I, both with our berimbau, would put a record on because there was no one to play for us while we were showing the boys capoeira. They were crazy about it. After each show, everybody wanted to talk to us and invited us to their break dancing circles. At that time, break dancing was totally different than it is today. It was more of a cultural movement than a commercial thing."

According to Mestre Acordeon: "These demonstrations by Mestre Jelon [Vieira] and Loremil Machado are considered by many to be responsible for the incorporation of capoeira movements into breakdancing." Scholar Matthias Röhrig Assunção confirms that "many people believe their performances inspired the break dance craze of the 1980s." Vieira specifically noted that kids "began incorporating capoeira into breakdance—moves like the ''head spin'' (peão de cabeça). Loremil could spin on his head beautifully."

In 1977, Loremil and Jelon founded "The Capoeiras of Bahia," which became the first company to bring traditional Afro-Brazilian dance and capoeira to the United States. The company was later renamed DanceBrazil in 1981 at the suggestion of choreographer Alvin Ailey. Loremil served as a featured dancer in DanceBrazil while also founding his own ensemble, the Loremil Machado Afro-Brazilian Dance Company.

Loremil taught at the Clark Center for the Performing Arts, where he joined a prestigious faculty that included Alvin Ailey, Fred Benjamin, and Charles Moore. He also taught at Lezlly Dance Studios in Manhattan. Among his notable students was award-winning playwright and poet Ntozake Shange, who recalled: "No, the place for me was Loremil Machado''s class for the end of the year. It was as important as a midnight mass. The class was full to the corners and we were all ready for our athletic, jumping, twirling, kicking, giving much quick knees and feet..."

For four or five years, Loremil and Jelon performed a weekly show of capoeira set to jazz music at the Cachaça nightclub on East 62nd Street, creating a unique fusion that captivated New York audiences. He also performed as a musician with the SARAVA BAHIA BAND and the Kotoko Society.

In 1980, pioneering Black filmmaker Warrington Hudlin directed "Capoeira of Brazil," a documentary short featuring Loremil, Jelon Vieira, and Eusebio da Silva. The film, produced by WGBH/Boston''s New Television Workshop in association with the Black Filmmakers Foundation, won the Blue Ribbon at the American Film Festival.

In 1990, Loremil participated in the National Black Arts Festival in Atlanta alongside notable masters including Mestre João Grande, Mestre Nô, Mestre Lua de Bobó, Cobra Mansa, and Moraes.

Loremil Machado died on March 11, 1994, at Columbia-Presbyterian Hospital in Manhattan. He was 40 years old. The cause of death was AIDS, as confirmed by his longtime friend, writer and dancer Barbara Browning, in her posthumous writings. The New York Times obituary noted: "Mr. Machado was known for the intensity of his dancing even in styles like the Brazilian martial arts form Capoeira, which calls as much for reckless daring as for skill, training and a great deal of physical energy."

Ntozake Shange''s posthumous book "Dance We Do" (Beacon Press) memorialized him as "the extraordinary capoeirista Loremil Machado, lost to AIDS in 1994." In 2019, the Clark Center 60th Anniversary celebration honored him with a celebration of Brazilian Dance featuring "samba and Orixa dance in Loremil Machado''s honor and style."

He is survived by his mother Joselina Candida de Sousa Machado, three brothers, and two sisters, all of Salvador, Bahia.',
  -- bio_pt
  E'Josivaldo de Souza Machado (10 de maio de 1953 – 11 de março de 1994), conhecido profissionalmente como Loremil Machado e pelo apelido de capoeira "Marretinha," foi um dançarino, coreógrafo, percussionista e mestre de capoeira que ajudou a introduzir a capoeira nos Estados Unidos. Era sobrinho e aluno de primeira geração de Mestre Nô (Norival Moreira de Oliveira), graduando-se entre o primeiro grupo de alunos das academias de Nô em Salvador.

O jogo de Loremil era lendário. Como um relato contemporâneo descreveu: "O jogo selvagemente livre e expressivo de Loremil na roda e na vida tocou e inspirou todos que o viram." Diferente dos Mestres Acordeon e Jelon, que ensinavam consistentemente, Loremil "nunca deu aulas de capoeira de forma consistente," o que pode explicar por que seu papel como fundador da capoeira nos Estados Unidos às vezes foi sub-reconhecido.

Em 1974, Loremil se apresentou com o grupo folclórico Viva Bahia na produção teatral "Três Marias" e veio para Nova York. No ano seguinte, em abril de 1975, ele e o coreógrafo baiano Jelon Vieira chegaram a Nova York para se apresentar em "Parto," uma peça das dramaturgas brasileiras Gilda Grillo e Maria Isabel Barreno. Tornaram-se os primeiros mestres de capoeira a morar e ensinar nos Estados Unidos.

Seu trabalho inicial foi humilde mas impactante. Fizeram demonstrações de capoeira em escolas públicas do Bronx—o berço do hip-hop e do breakdancing. Mestre Jelon lembrou: "Loremil e eu, ambos com nosso berimbau, colocávamos um disco porque não havia ninguém para tocar para nós enquanto mostrávamos a capoeira aos meninos. Eles ficavam loucos. Depois de cada apresentação, todos queriam conversar conosco e nos convidavam para seus círculos de break dance. Naquela época, o break dance era totalmente diferente do que é hoje. Era mais um movimento cultural do que algo comercial."

De acordo com Mestre Acordeon: "Essas demonstrações de Mestre Jelon [Vieira] e Loremil Machado são consideradas por muitos como responsáveis pela incorporação de movimentos de capoeira no breakdancing." O acadêmico Matthias Röhrig Assunção confirma que "muitas pessoas acreditam que suas apresentações inspiraram a febre do break dance dos anos 1980." Vieira especificamente notou que os garotos "começaram a incorporar capoeira no breakdance—movimentos como o ''head spin'' (peão de cabeça). Loremil conseguia girar na cabeça lindamente."

Em 1977, Loremil e Jelon fundaram "The Capoeiras of Bahia," que se tornou a primeira companhia a trazer dança tradicional afro-brasileira e capoeira para os Estados Unidos. A companhia foi posteriormente renomeada para DanceBrazil em 1981 por sugestão do coreógrafo Alvin Ailey. Loremil atuou como dançarino principal no DanceBrazil enquanto também fundava seu próprio conjunto, a Loremil Machado Afro-Brazilian Dance Company.

Loremil ensinou no Clark Center for the Performing Arts, onde se juntou a um corpo docente prestigiado que incluía Alvin Ailey, Fred Benjamin e Charles Moore. Também ensinou no Lezlly Dance Studios em Manhattan. Entre seus alunos notáveis estava a premiada dramaturga e poeta Ntozake Shange, que lembrou: "Não, o lugar para mim era a aula de Loremil Machado para o final do ano. Era tão importante quanto uma missa da meia-noite. A aula estava cheia até os cantos e estávamos todos prontos para nosso atleticismo, pulando, rodopiando, chutando, dando muitos joelhos e pés rápidos..."

Por quatro ou cinco anos, Loremil e Jelon apresentaram um show semanal de capoeira com música jazz no clube noturno Cachaça na East 62nd Street, criando uma fusão única que cativou o público nova-iorquino. Ele também se apresentou como músico com a SARAVA BAHIA BAND e a Kotoko Society.

Em 1980, o pioneiro cineasta negro Warrington Hudlin dirigiu "Capoeira of Brazil," um curta-metragem documentário apresentando Loremil, Jelon Vieira e Eusebio da Silva. O filme, produzido pelo New Television Workshop da WGBH/Boston em associação com a Black Filmmakers Foundation, ganhou a Fita Azul no American Film Festival.

Em 1990, Loremil participou do National Black Arts Festival em Atlanta ao lado de mestres notáveis incluindo Mestre João Grande, Mestre Nô, Mestre Lua de Bobó, Cobra Mansa e Moraes.

Loremil Machado faleceu em 11 de março de 1994, no Columbia-Presbyterian Hospital em Manhattan. Tinha 40 anos. A causa da morte foi AIDS, conforme confirmado por sua amiga de longa data, a escritora e dançarina Barbara Browning, em seus escritos póstumos. O obituário do New York Times observou: "O Sr. Machado era conhecido pela intensidade de sua dança mesmo em estilos como a forma de artes marciais brasileira Capoeira, que requer tanto ousadia imprudente quanto habilidade, treinamento e uma grande quantidade de energia física."

O livro póstumo de Ntozake Shange "Dance We Do" (Beacon Press) o memorizou como "o extraordinário capoeirista Loremil Machado, perdido para a AIDS em 1994." Em 2019, a celebração do 60º aniversário do Clark Center o homenageou com uma celebração de Dança Brasileira apresentando "samba e dança Orixá na honra e estilo de Loremil Machado."

Ele deixou sua mãe Joselina Candida de Sousa Machado, três irmãos e duas irmãs, todos de Salvador, Bahia.',
  -- achievements_en
  E'Co-founder of capoeira in the United States with Jelon Vieira (1975); Co-founded The Capoeiras of Bahia (1977, later DanceBrazil); Founded Loremil Machado Afro-Brazilian Dance Company; Featured dancer in DanceBrazil; Faculty at Clark Center for the Performing Arts alongside Alvin Ailey; Featured in "Capoeira of Brazil" documentary (1980, Blue Ribbon at American Film Festival); Performed at National Black Arts Festival Atlanta (1990); Credited with influencing the incorporation of capoeira movements into breakdancing; Weekly capoeira-jazz shows at Cachaça nightclub (4-5 years); Taught notable students including Ntozake Shange; Honored posthumously at Clark Center 60th Anniversary (2019)',
  -- achievements_pt
  E'Co-fundador da capoeira nos Estados Unidos com Jelon Vieira (1975); Co-fundou The Capoeiras of Bahia (1977, posteriormente DanceBrazil); Fundou Loremil Machado Afro-Brazilian Dance Company; Dançarino principal no DanceBrazil; Corpo docente no Clark Center for the Performing Arts ao lado de Alvin Ailey; Destaque no documentário "Capoeira of Brazil" (1980, Fita Azul no American Film Festival); Apresentou-se no National Black Arts Festival Atlanta (1990); Creditado por influenciar a incorporação de movimentos de capoeira no breakdancing; Shows semanais de capoeira-jazz no clube Cachaça (4-5 anos); Ensinou alunos notáveis incluindo Ntozake Shange; Homenageado postumamente no 60º aniversário do Clark Center (2019)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1953, year precision):
- CapoeiraWiki and Wikipedia list May 10, 1953
- Find a Grave lists 1954
- NY Times obituary says "40 years old" at death (March 1994)
- Using 1953 as majority consensus from detailed sources

DEATH DATE (March 11, 1994, exact precision):
- Confirmed across multiple sources
- Location: Columbia-Presbyterian Hospital, Manhattan
- Cause: AIDS (confirmed by Barbara Browning, longtime friend)

NAME DISCREPANCY:
- Full name: Josivaldo de Souza Machado (majority)
- Professional name: Loremil Machado
- Capoeira apelido: Marretinha
- Mother''s name: Joselina Candida de Sousa Machado

TEACHERS:
- Mestre Nô (Norival Moreira de Oliveira) - nephew and first-generation student
- Graduated among first group from Nô''s academies

STUDENTS:
- Ntozake Shange (playwright/poet) - documented student at his classes
- Julinda Lewis - studied dance with Loremil among other Black Dance masters

COLLABORATORS:
- Jelon Vieira - partner in introducing capoeira to USA; co-founded DanceBrazil
- Alvin Ailey - suggested DanceBrazil name; provided support
- Ellen Stewart - La MaMa founder; early supporter

MEDIA APPEARANCES:
- 1974: Performed with Viva Bahia in "Três Marias"
- 1975: Play "Parto" in NYC
- 1977: Clark Center summer festival performance
- 1978: Joyce Kilmer Park performance with Jelon
- 1979: Delacorte Theater Central Park (his company)
- 1980: "Capoeira of Brazil" documentary (Warrington Hudlin)
- 1978-1983: Weekly shows at Cachaça nightclub (4-5 years)
- 1990: National Black Arts Festival, Atlanta

TEACHING LOCATIONS:
- Clark Center for the Performing Arts, Manhattan
- Lezlly Dance Studios, Manhattan
- Various NYC venues

FAMILY (surviving at death):
- Mother: Joselina Candida de Sousa Machado (Salvador, Bahia)
- Three brothers (Salvador, Bahia)
- Two sisters (Salvador, Bahia)

NOTE ON HISTORICAL RECOGNITION:
Multiple sources note that unlike Jelon Vieira and Mestre Acordeon, Loremil "never taught capoeira classes consistently," which may explain why his foundational role in US capoeira has sometimes been underrecognized.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1953, precisão de ano):
- CapoeiraWiki e Wikipedia listam 10 de maio de 1953
- Find a Grave lista 1954
- Obituário do NY Times diz "40 anos" na morte (março 1994)
- Usando 1953 como consenso majoritário de fontes detalhadas

DATA DE FALECIMENTO (11 de março de 1994, precisão exata):
- Confirmada em múltiplas fontes
- Local: Columbia-Presbyterian Hospital, Manhattan
- Causa: AIDS (confirmado por Barbara Browning, amiga de longa data)

DISCREPÂNCIA DE NOME:
- Nome completo: Josivaldo de Souza Machado (maioria)
- Nome profissional: Loremil Machado
- Apelido de capoeira: Marretinha
- Nome da mãe: Joselina Candida de Sousa Machado

PROFESSORES:
- Mestre Nô (Norival Moreira de Oliveira) - sobrinho e aluno de primeira geração
- Graduou-se entre o primeiro grupo das academias de Nô

ALUNOS:
- Ntozake Shange (dramaturga/poeta) - aluna documentada em suas aulas
- Julinda Lewis - estudou dança com Loremil entre outros mestres de Dança Negra

COLABORADORES:
- Jelon Vieira - parceiro na introdução da capoeira nos EUA; co-fundou DanceBrazil
- Alvin Ailey - sugeriu o nome DanceBrazil; forneceu apoio
- Ellen Stewart - fundadora do La MaMa; apoiadora inicial

APARIÇÕES NA MÍDIA:
- 1974: Apresentou-se com Viva Bahia em "Três Marias"
- 1975: Peça "Parto" em NYC
- 1977: Apresentação no festival de verão do Clark Center
- 1978: Apresentação no Joyce Kilmer Park com Jelon
- 1979: Delacorte Theater Central Park (sua companhia)
- 1980: Documentário "Capoeira of Brazil" (Warrington Hudlin)
- 1978-1983: Shows semanais no clube Cachaça (4-5 anos)
- 1990: National Black Arts Festival, Atlanta

LOCAIS DE ENSINO:
- Clark Center for the Performing Arts, Manhattan
- Lezlly Dance Studios, Manhattan
- Vários locais em NYC

FAMÍLIA (sobreviventes na morte):
- Mãe: Joselina Candida de Sousa Machado (Salvador, Bahia)
- Três irmãos (Salvador, Bahia)
- Duas irmãs (Salvador, Bahia)

NOTA SOBRE RECONHECIMENTO HISTÓRICO:
Múltiplas fontes notam que diferente de Jelon Vieira e Mestre Acordeon, Loremil "nunca deu aulas de capoeira de forma consistente," o que pode explicar por que seu papel fundacional na capoeira americana às vezes foi sub-reconhecido.'
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
