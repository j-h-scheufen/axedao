-- ============================================================
-- GENEALOGY PERSON: Cafuné
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH YEAR ESTIMATION (1938, year precision):
-- He was 82 years old in March 2021 interview, 80 years old in
-- 2018 A TARDE article, 85 years old in January 2024. This
-- consistently points to birth in 1938 or late 1939.
-- Most sources align with 1938.
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
  'Sérgio Fachinetti Dória',
  'Cafuné',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://atarde.com.br/muito/ha-100-anos-o-baiano-mestre-bimba-criou-a-capoeira-regional-1017593', 'https://clinicadecapoeira2014.wordpress.com/mestres/', 'https://portalcapoeira.com/capoeira/noticias-atualidades/ele-nao-joga-capoeira-ele-faz-cafune-historias-da-academia-do-mestre-bimba/', 'https://edufba.ufba.br/livros-publicados/ele-nao-joga-capoeira-ele-faz-cafune-historias-da-academia-do-mestre-bimba']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Cafuné is one of the oldest living disciples of Mestre Bimba. He preserves and transmits the traditional Capoeira Regional methodology, emphasizing Bimba''s philosophy that capoeira teaches not just fighting but "the art of living well" (a arte de bem viver). He collaborates with Mestre Nenel at Fundação Mestre Bimba and Filhos de Bimba Escola de Capoeira, and serves on the foundation''s Curator Council.',
  E'Mestre Cafuné é um dos mais antigos discípulos vivos de Mestre Bimba. Ele preserva e transmite a metodologia tradicional da Capoeira Regional, enfatizando a filosofia de Bimba de que a capoeira ensina não apenas a luta, mas "a arte de bem viver". Ele colabora com Mestre Nenel na Fundação Mestre Bimba e Filhos de Bimba Escola de Capoeira, e faz parte do Conselho Curador da fundação.',
  -- Life dates
  1938,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Sérgio Fachinetti Dória, known as Mestre Cafuné, was born in 1938 in Salvador, Bahia. He works as a carpenter (marceneiro) and has dedicated over five decades to capoeira.

In 1966, Cafuné read an interview with Mestre Bimba in a newspaper and was inspired to seek out the legendary creator of Capoeira Regional. He traveled a considerable distance from the Polo Petroquímico de Camaçari, where he worked, to the historic Pelourinho district in Salvador. He recalls being a timid, fearful person at the time: "I passed through Baixa dos Sapateiros with fear and climbed the hill with my legs trembling".

When he first knocked on the door of Bimba''s Centro de Cultura Física Regional, he was turned away. He soon discovered a small sign on the door that read: "Visit, 2 thousand cruzeiros. Monthly fee, 2 thousand cruzeiros". Rather than pay for a mere visit, Cafuné decided to pay the monthly fee and returned to enroll as a student. Bimba gave him his first lesson that day.

From his very first class, Bimba imparted wisdom that extended beyond physical technique: "When you arrive somewhere, don''t enter immediately. First you observe, see when you can enter, when you can exit, be careful". This teaching became a guiding philosophy for Cafuné: "He taught us to have respect for spaces, be more observant, more balanced—it''s something with a very broad meaning".

Cafuné remained a student at Bimba''s academy until the master departed for Goiânia in 1971, heartbroken by the lack of government support in Bahia. During this time, the batizado ceremonies took place on Sundays at the academy in Nordeste de Amaralina. It was at his batizado that Bimba personally bestowed his nickname: after Cafuné''s first game in a complete roda, the master declared, "his name is Cafuné—he doesn''t play capoeira, he does cafuné" (referring to a gentle caress). And so his identity in capoeira was born.

Cafuné graduated (formatura) in August 1967, earning the right to teach.

In the 1980s, Cafuné sought a tranquil place to live and moved to Lauro de Freitas, a municipality just north of Salvador. He bought a small property (sítio) on the banks of the Ipitanga River, which at the time was clean and full of fish. After a partnership that did not work out, he eventually moved to the Araqui community in Lauro de Freitas, where he established his woodworking shop and continues to reside today.

Cafuné has three children and three grandchildren. He practices Candomblé, maintaining the connection between capoeira and Afro-Brazilian spiritual traditions that was so important to Mestre Bimba himself.

In December 2011, Cafuné published "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" (He doesn''t play capoeira, he does cafuné: stories from Mestre Bimba''s academy) through EDUFBA (Editora da Universidade Federal da Bahia). The 107-page book collects articles originally written for a specialized capoeira magazine, bringing together memories, recollections, and emotions from his time as Bimba''s student. It includes a photo booklet of the master and presents a critical examination of capoeira''s history as "a form of struggle for Black people" during slavery.

Cafuné is a member of the Curator Council (Conselho Curador) of the Fundação Mestre Bimba. He has served three times as vice president of the foundation, once as secretary, and once as public relations director. He also works with Mestre Nenel at Filhos de Bimba Escola de Capoeira, traveling throughout Brazil and internationally to conduct workshops and lectures for groups exceeding 200 young people.

Speaking about Mestre Bimba''s legacy, Cafuné has clarified a common misconception: "Many people say Bimba died in misery, but this isn''t exactly true. At the time of his death, Bimba was sustaining at least three families in three separate houses that he owned". He notes that Bimba had "more than 200 disciples and 600 students", but laments that some students lost their reference and stopped practicing capoeira after the master''s death: "He was who encouraged us to continue".

For Cafuné, keeping Capoeira Regional alive is a form of resistance. He notes the ongoing difficulty in obtaining effective support for capoeira, stating that "the political class does not value the practice". Despite these challenges, he continues to affirm that the capoeira represents "a divisor of waters" (a watershed moment) in his life.

In January 2024, at 85 years old, Mestre Cafuné was among 14 octogenarian capoeira masters honored at the 5º Rede Capoeira event in Salvador. He received a symbolic Sankofa bird sculpture alongside legendary figures including Mestre João Grande (91), Mestre Acordeon (80), Mestre Boca Rica (87), Mestre Brandão (94), and Mestre Felipe de Santo Amaro (96).

In the municipality of Lauro de Freitas where he resides, Cafuné collaborates with existing capoeira groups regardless of whether they practice Angola, Regional, or any other style—helping organize groups through lectures and participating in workshops and courses.',
  -- bio_pt
  E'Sérgio Fachinetti Dória, conhecido como Mestre Cafuné, nasceu em 1938 em Salvador, Bahia. Trabalha como marceneiro e dedicou mais de cinco décadas à capoeira.

Em 1966, Cafuné leu uma entrevista com Mestre Bimba em um jornal e foi inspirado a procurar o lendário criador da Capoeira Regional. Viajou uma distância considerável do Polo Petroquímico de Camaçari, onde trabalhava, até o histórico bairro do Pelourinho em Salvador. Ele recorda ter sido uma pessoa tímida e medrosa na época: "Passava pela Baixa dos Sapateiros com medo e subia a ladeira com as pernas tremendo".

Quando bateu pela primeira vez na porta do Centro de Cultura Física Regional de Bimba, foi dispensado. Logo descobriu uma pequena placa na porta que dizia: "Visita, 2 mil cruzeiros. Mensalidade, 2 mil cruzeiros". Ao invés de pagar por uma mera visita, Cafuné decidiu pagar a mensalidade e voltou para se matricular como aluno. Bimba deu-lhe sua primeira aula naquele dia.

Desde sua primeira aula, Bimba transmitiu sabedoria que ia além da técnica física: "Quando você chegar em algum lugar, não entre imediatamente. Primeiro você observa, vê quando pode entrar, quando pode sair, tenha cuidado". Este ensinamento tornou-se uma filosofia orientadora para Cafuné: "Ele nos ensinou a ter respeito pelos espaços, ser mais observador, mais equilibrado—é algo com um significado muito amplo".

Cafuné permaneceu como aluno na academia de Bimba até a partida do mestre para Goiânia em 1971, desolado pela falta de apoio governamental na Bahia. Durante esse tempo, as cerimônias de batizado aconteciam aos domingos na academia do Nordeste de Amaralina. Foi em seu batizado que Bimba pessoalmente lhe deu o apelido: após o primeiro jogo de Cafuné em uma roda completa, o mestre declarou: "o nome dele é Cafuné—ele não joga capoeira, ele faz cafuné" (referindo-se a um carinho suave). E assim nasceu sua identidade na capoeira.

Cafuné formou-se em agosto de 1967, conquistando o direito de ensinar.

Na década de 1980, Cafuné buscou um lugar tranquilo para viver e mudou-se para Lauro de Freitas, um município ao norte de Salvador. Comprou um pequeno sítio às margens do Rio Ipitanga, que na época era limpo e cheio de peixes. Após uma parceria que não deu certo, eventualmente mudou-se para a comunidade de Araqui em Lauro de Freitas, onde estabeleceu sua marcenaria e continua residindo até hoje.

Cafuné tem três filhos e três netos. Pratica Candomblé, mantendo a conexão entre a capoeira e as tradições espirituais afro-brasileiras que era tão importante para o próprio Mestre Bimba.

Em dezembro de 2011, Cafuné publicou "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" pela EDUFBA (Editora da Universidade Federal da Bahia). O livro de 107 páginas reúne artigos originalmente escritos para uma revista especializada em capoeira, trazendo memórias, recordações e emoções de seu tempo como aluno de Bimba. Inclui um encarte fotográfico do mestre e apresenta um exame crítico da história da capoeira como "uma forma de luta do povo negro" durante a escravidão.

Cafuné é membro do Conselho Curador da Fundação Mestre Bimba. Ocupou três vezes o cargo de vice-presidente da fundação, uma vez como secretário e uma vez como diretor de relações públicas. Também trabalha com Mestre Nenel na Filhos de Bimba Escola de Capoeira, viajando por todo o Brasil e internacionalmente para conduzir oficinas e palestras para grupos de mais de 200 jovens.

Falando sobre o legado de Mestre Bimba, Cafuné esclareceu um equívoco comum: "Muitas pessoas dizem que Bimba morreu na miséria, mas isso não é exatamente verdade. Na época de sua morte, Bimba sustentava pelo menos três famílias em três casas separadas que ele possuía". Ele observa que Bimba tinha "mais de 200 discípulos e 600 alunos", mas lamenta que alguns alunos perderam a referência e pararam de praticar capoeira após a morte do mestre: "Ele era quem nos animava a continuar".

Para Cafuné, manter a Capoeira Regional viva é uma forma de resistência. Ele nota a dificuldade contínua em obter apoio efetivo para a capoeira, afirmando que "a classe política não valoriza a prática". Apesar desses desafios, ele continua a afirmar que a capoeira representa "um divisor de águas" em sua vida.

Em janeiro de 2024, aos 85 anos, Mestre Cafuné estava entre 14 mestres octogenários de capoeira homenageados no 5º Rede Capoeira em Salvador. Ele recebeu uma escultura simbólica do pássaro Sankofa ao lado de figuras lendárias incluindo Mestre João Grande (91), Mestre Acordeon (80), Mestre Boca Rica (87), Mestre Brandão (94) e Mestre Felipe de Santo Amaro (96).

No município de Lauro de Freitas onde reside, Cafuné colabora com grupos de capoeira existentes independentemente de praticarem Angola, Regional ou qualquer outro estilo—ajudando a organizar grupos através de palestras e participando de oficinas e cursos.',
  -- achievements_en
  E'Author of "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" (EDUFBA, 2011); Member of the Curator Council (Conselho Curador) of Fundação Mestre Bimba; Three-time Vice President of Fundação Mestre Bimba; Secretary and Public Relations Director of Fundação Mestre Bimba; One of the oldest living disciples of Mestre Bimba; Honored at 5º Rede Capoeira (2024) alongside 13 other octogenarian masters; Active teacher and workshop facilitator for 50+ years; Collaborated with groups of 200+ young people',
  -- achievements_pt
  E'Autor de "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" (EDUFBA, 2011); Membro do Conselho Curador da Fundação Mestre Bimba; Três vezes Vice-Presidente da Fundação Mestre Bimba; Secretário e Diretor de Relações Públicas da Fundação Mestre Bimba; Um dos mais antigos discípulos vivos de Mestre Bimba; Homenageado no 5º Rede Capoeira (2024) ao lado de 13 outros mestres octogenários; Professor ativo e facilitador de oficinas por mais de 50 anos; Colaborou com grupos de mais de 200 jovens',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1938, year precision):
- Interview March 2021: 82 years old → born 1938 or 1939
- A TARDE 2018: 80 years old → born 1938
- January 2024: 85 years old → born 1938 or 1939
- Clínica de Capoeira 2014: 76 years old → born 1938
Most consistent with 1938.

NAME DISCREPANCY:
- "Sérgio Fachinetti Dória" - EDUFBA, Clínica de Capoeira (MAJORITY)
- "Sérgio Dória" - A TARDE (shortened form)
Using full name: Sérgio Fachinetti Dória

TEACHERS:
- Mestre Bimba (1966-1971, Salvador, Centro de Cultura Física Regional)

TRAINING TIMELINE:
- 1966: Began training with Mestre Bimba
- August 1967: Graduated (formatura)
- 1971: Remained until Bimba left for Goiânia

BATIZADO: Received apelido "Cafuné" directly from Mestre Bimba at batizado ceremony in Nordeste de Amaralina. Bimba declared: "his name is Cafuné—he doesn''t play capoeira, he does cafuné".

FUNDAÇÃO MESTRE BIMBA ROLES:
- Member of Conselho Curador (Curator Council)
- Three times Vice President
- Once Secretary
- Once Public Relations Director

RESIDENCE:
- 1980s: Moved to Lauro de Freitas
- Currently: Araqui community, Lauro de Freitas, Bahia

CANDOMBLÉ: Practices Candomblé (mentioned in 2021 interview)

FAMILY: Three children, three grandchildren

PROFESSION: Marceneiro (carpenter/woodworker)

PUBLICATIONS:
- "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" (EDUFBA, December 2011)
  - ISBN: 978-85-232-0833-2
  - Pages: 107
  - Format: 15 x 21 cm, softcover
  - Price: R$ 40.00
  - Launched: December 15, 2011 at Biblioteca Universitária de Saúde da UFBA

MEDIA APPEARANCES:
- 2018: Featured in A TARDE article on 100 years of Capoeira Regional
- 2021: Interview at Blog do Márcio Wesley
- 2024: Honored at 5º Rede Capoeira event (January 24-27, Salvador)

2024 REDE CAPOEIRA HONOREES (alongside Cafuné):
- Mestre João Grande (91)
- Mestre Acordeon (80)
- Mestre Boca Rica (87)
- Mestre Brandão (94)
- Mestre Felipe de Santo Amaro (96)
- Mestre Olavo (81)
- Mestre Pelé da Bomba (89)
- Mestre Brasília (81)
- Mestre Virgílio (89)
- Mestre Carcará (81)
- Mestre Curió (84)
- Mestre Celso (84)
- Mestre Sombra (82)

INTERNATIONAL TRAVEL: Mentioned traveling to Switzerland for workshops',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1938, precisão ano):
- Entrevista março 2021: 82 anos → nascido 1938 ou 1939
- A TARDE 2018: 80 anos → nascido 1938
- Janeiro 2024: 85 anos → nascido 1938 ou 1939
- Clínica de Capoeira 2014: 76 anos → nascido 1938
Mais consistente com 1938.

DISCREPÂNCIA DE NOME:
- "Sérgio Fachinetti Dória" - EDUFBA, Clínica de Capoeira (MAIORIA)
- "Sérgio Dória" - A TARDE (forma abreviada)
Usando nome completo: Sérgio Fachinetti Dória

PROFESSORES:
- Mestre Bimba (1966-1971, Salvador, Centro de Cultura Física Regional)

LINHA DO TEMPO DE TREINAMENTO:
- 1966: Começou a treinar com Mestre Bimba
- Agosto 1967: Formatura
- 1971: Permaneceu até Bimba partir para Goiânia

BATIZADO: Recebeu o apelido "Cafuné" diretamente de Mestre Bimba na cerimônia de batizado no Nordeste de Amaralina. Bimba declarou: "o nome dele é Cafuné—ele não joga capoeira, ele faz cafuné".

CARGOS NA FUNDAÇÃO MESTRE BIMBA:
- Membro do Conselho Curador
- Três vezes Vice-Presidente
- Uma vez Secretário
- Uma vez Diretor de Relações Públicas

RESIDÊNCIA:
- Década de 1980: Mudou-se para Lauro de Freitas
- Atualmente: Comunidade de Araqui, Lauro de Freitas, Bahia

CANDOMBLÉ: Pratica Candomblé (mencionado em entrevista de 2021)

FAMÍLIA: Três filhos, três netos

PROFISSÃO: Marceneiro

PUBLICAÇÕES:
- "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" (EDUFBA, dezembro 2011)
  - ISBN: 978-85-232-0833-2
  - Páginas: 107
  - Formato: 15 x 21 cm, brochura
  - Preço: R$ 40,00
  - Lançamento: 15 de dezembro de 2011 na Biblioteca Universitária de Saúde da UFBA

APARIÇÕES NA MÍDIA:
- 2018: Destaque em artigo do A TARDE sobre 100 anos da Capoeira Regional
- 2021: Entrevista no Blog do Márcio Wesley
- 2024: Homenageado no evento 5º Rede Capoeira (24-27 janeiro, Salvador)

HOMENAGEADOS NO REDE CAPOEIRA 2024 (junto com Cafuné):
- Mestre João Grande (91)
- Mestre Acordeon (80)
- Mestre Boca Rica (87)
- Mestre Brandão (94)
- Mestre Felipe de Santo Amaro (96)
- Mestre Olavo (81)
- Mestre Pelé da Bomba (89)
- Mestre Brasília (81)
- Mestre Virgílio (89)
- Mestre Carcará (81)
- Mestre Curió (84)
- Mestre Celso (84)
- Mestre Sombra (82)

VIAGENS INTERNACIONAIS: Mencionado viajando para a Suíça para oficinas'
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
