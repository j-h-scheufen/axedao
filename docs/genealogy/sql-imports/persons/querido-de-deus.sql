-- ============================================================
-- GENEALOGY PERSON IMPORT: Querido de Deus
-- Generated: 2025-12-11
-- Primary Source: https://velhosmestres.com/br/destaques-36
-- ============================================================
-- DEPENDENCIES: persons/onca-preta.sql, persons/bimba.sql, persons/pastinha.sql
-- ============================================================
--
-- Samuel Querido de Deus (Samuel Francisco Barreto de Souza)
-- One of the greatest capoeiristas of 1930s Salvador. Fisherman by profession.
-- Featured in Jorge Amado's "Capitães de Areia" (1937) and "Bahia de Todos os Santos" (1945).
-- Photographed by Ruth Landes at Itapagipe roda (1938), images now at Smithsonian.
-- Edison Carneiro called him "the best capoeirista ever seen."
--
-- BIRTH YEAR ESTIMATION (1880 with 'decade' precision):
-- Jorge Amado wrote in 1944 that "over sixty winters have passed since Samuel was born,"
-- placing his birth in the early 1880s. Using 1880 as the estimate.
--
-- DEATH YEAR ESTIMATION (1947 with 'decade' precision):
-- In O Cruzeiro magazine (January 10, 1948), Juvenal speaks of him in the past tense.
-- He was still alive for the 1938 Ruth Landes photographs and the 1944 Jorge Amado
-- profile. Death likely occurred between 1944 and early 1948.
-- Using 1947 as midpoint estimate with decade precision.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (all columns from genealogy.person_profiles)
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
  'Samuel Francisco Barreto de Souza',
  'Querido de Deus',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/br/destaques-36"}, {"type": "website", "url": "https://velhosmestres.com/en/featured-36"}, {"type": "website", "url": "https://capoeirawiki.org/wiki/Querido_de_Deus"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-samuel-querido-de-deus/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure traditional Capoeira Angola. Known for his exceptional rabo-de-arraia (stingray tail kick) which Jorge Amado described as having "elegance" unmatched by any other capoeirista. Mestre Waldemar characterized him as a "sopeiro" (one who waits for openings) and "crocodilo" - patient, waiting for opponents to attack before delivering devastating counterstrikes like headbutts. Unlike Bimba''s Regional which emphasized clinching and grappling, Samuel''s game remained purely Angola.',
  E'Capoeira Angola tradicional pura. Conhecido por seu excepcional rabo-de-arraia que Jorge Amado descreveu como tendo "elegância" incomparável a qualquer outro capoeirista. Mestre Waldemar o caracterizou como um "sopeiro" (aquele que espera por aberturas) e "crocodilo" - paciente, esperando os oponentes atacarem antes de desferir contra-ataques devastadores como cabeçadas. Diferente da Regional de Bimba que enfatizava clinch e agarramento, o jogo de Samuel permanecia puramente Angola.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1947,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'When Onça Preta was still a boy on the streets of Salvador, one name already passed from mouth to mouth among the dock workers and fishermen: Samuel Querido de Deus. By the 1930s, he was considered the undisputed king of capoeira in Bahia de Todos os Santos.

Samuel Francisco Barreto de Souza earned the nickname "Querido de Deus" (Beloved of God). He was a fisherman by trade, operating his own saveiro from the Port of Bahia, crossing the seas to southern waters and returning to sell his catch at the Mercado Modelo. Jorge Amado described him in 1944 as a tall, muscular man with an "indefinite color" shaped by years at sea - his complexion defied categorization, showing traces perhaps of indigenous or Italian blood mixed with African heritage, all weathered by sun and salt wind into something uniquely his own. His curly hair had begun turning white by then, marking over sixty winters of life.

There was no better capoeira player at the festivals of Nossa Senhora da Conceição da Praia in the first week of December than Querido de Deus. These annual celebrations at the basilica in Salvador''s Cidade Baixa drew capoeiristas from across Bahia to demonstrate their skill. Samuel dominated these gatherings year after year, defeating all challengers with a game that combined patience and devastating precision. "Whoever he plays - it could be a 20-year-old guy, it could be the most agile or most technical guy in the world - Samuel Querido de Deus shows that he is still the Capoeira king of Bahia," wrote one chronicler. "Even his students stare wide-eyed with amazement at his rabo-de-arraia, because no one has ever seen such elegance."

In 1936, the Bahian press covered a public challenge between Samuel and Mestre Bimba, then a rising figure promoting his Luta Regional Baiana. The newspapers O Imparcial and Diário da Bahia reported the dispute over who held the true title of "maximum capoeira master" in the state. Bimba''s response was measured: "Regarding Mr. Samuel de Souza, it is completely up to him to arrange a fight or a demonstration, so that the people who know us so well are not deceived." Whether they ever faced each other directly remains unrecorded.

The following year, 1937, brought Samuel into the intellectual spotlight. Edison Carneiro, the folklorist and researcher, included him as a key informant on Capoeira Angola in his book "Negros Bantus." Carneiro would later declare Samuel "the best capoeirista we''ve ever seen" - high praise from a scholar who had witnessed countless mestres. On January 14, 1937, Samuel led a Capoeira Angola exhibition at the II Afro-Brazilian Congress in Salvador, demonstrating the traditional art before intellectuals, researchers, and dignitaries. He played his famous game against Onça Preta before luminaries like Edison Carneiro and Jorge Amado.

Samuel''s legacy extends into literature. Jorge Amado featured him in "Capitães de Areia" (1937), where he appears as "Querido de Deus" - a capoeirista friend of the gang who taught the art to some of its members. The character was drawn directly from the real Samuel, complete with the mystique and skill that made him legendary on the docks of Salvador. Amado returned to him in "Bahia de Todos os Santos" (1945), painting a vivid portrait: "the Capoeira king of Bahia de Todos os Santos."

On September 18, 1938, American anthropologist Ruth Landes, accompanied by Edison Carneiro, witnessed a roda in Itapagipe. Her photographs - now archived at the Smithsonian Institution - captured Samuel in action against Onça Preta. In her book "The City of Women" (1947), Landes described arriving at the spot where men were forming for capoeira: "Two capoeirists were squatting facing the musicians - one was the champion Beloved of God, with the Christian name of Samuel. He was tall, mulatto, middle-aged, muscular, a fisherman by profession." She documented how he smiled constantly while performing complex movements with prodigious agility.

His fame crossed borders. North Americans paid dearly to see him fight, and Brazilian cinematographers filmed his exhibitions. Yet Samuel showed a characteristic generosity - when poor Brazilian filmmakers approached him, he not only declined payment but invited them to lunch, though he had demanded large fees from wealthy foreign spectators.

Mestre Waldemar, reflecting in 1989, offered a more critical assessment: "Samuel Querido de Deus was good but was also a sopeiro. Just in the game. He would wait for you to jump to give you a headbutt. When you wanted to attack him back, he didn''t want to play anymore. He was a crocodile." This patience - the ability to draw opponents into attack and then deliver devastating counters - was perhaps the secret of his dominance.

Samuel trained at least one formal student who carried his legacy forward: Juvenal Hermenegildo da Cruz, known as "Juvenal Engraxate" (Juvenal the Shoeshine). Samuel formally granted Juvenal the title of mestre, recognizing his qualities and potential. "This title was given to me by Samuel Querido-de-Deus," Juvenal later recounted. "Samuel liked my qualities and saw my future." Juvenal described his teacher as "uma onça" (a jaguar) and proclaimed that "Querido-de-Deus never lost a fight!" After Samuel''s death, Juvenal continued the lineage, teaching at the ramp of the Mercado Modelo to dock workers and stevedores - the same community Samuel had served as a fisherman.

Despite not founding an academy or leaving behind many formal disciples, Samuel''s influence remained profound. He left no written teachings, but his legacy lives through songs, stories, and the admiration of later mestres. He stands alongside Aberrê, Antônio Maré, Besouro, Bimba, and Pastinha as one of the first generation of modern capoeira mestres - the group born in the late 19th century who transformed a persecuted street practice into a recognized art form.

Samuel Querido de Deus died sometime in the mid-1940s. By January 1948, when O Cruzeiro magazine interviewed Juvenal about his roda at the Mercado Modelo, they spoke of Samuel in the past tense. The king of capoeira had passed, but his crown lived on in the memory of every capoeirista who had witnessed his elegance in the roda.',
  -- bio_pt
  E'Quando Onça Preta ainda era um menino nas ruas de Salvador, um nome já passava de boca em boca entre os estivadores e pescadores: Samuel Querido de Deus. Na década de 1930, ele era considerado o rei indiscutível da capoeira na Bahia de Todos os Santos.

Samuel Francisco Barreto de Souza ganhou o apelido de "Querido de Deus" (Amado por Deus). Era pescador de profissão, operando seu próprio saveiro no Porto da Bahia, cruzando os mares para as águas do sul e retornando para vender seu pescado no Mercado Modelo. Jorge Amado o descreveu em 1944 como um homem alto e musculoso com uma "cor indefinida" moldada por anos no mar - sua tez desafiava categorização, mostrando traços talvez de sangue indígena ou italiano misturado com herança africana, tudo curtido pelo sol e vento salgado em algo unicamente seu. Seu cabelo crespo já começava a embranquecer nessa época, marcando mais de sessenta invernos de vida.

Não havia melhor jogador de capoeira nas festas de Nossa Senhora da Conceição da Praia na primeira semana de dezembro do que Querido de Deus. Essas celebrações anuais na basílica na Cidade Baixa de Salvador atraíam capoeiristas de toda a Bahia para demonstrar sua habilidade. Samuel dominava esses encontros ano após ano, derrotando todos os desafiantes com um jogo que combinava paciência e precisão devastadora. "Quem quer que jogue com ele - pode ser um rapaz de 20 anos, pode ser o cara mais ágil ou mais técnico do mundo - Samuel Querido de Deus mostra que ainda é o Rei da Capoeira da Bahia," escreveu um cronista. "Até seus alunos ficam de olhos arregalados de espanto com seu rabo-de-arraia, porque ninguém jamais viu tamanha elegância."

Em 1936, a imprensa baiana cobriu um desafio público entre Samuel e Mestre Bimba, então uma figura ascendente promovendo sua Luta Regional Baiana. Os jornais O Imparcial e Diário da Bahia noticiaram a disputa sobre quem detinha o verdadeiro título de "mestre máximo da capoeira" no estado. A resposta de Bimba foi comedida: "Com respeito ao Sr. Samuel de Souza, cabe inteiramente a ele arranjar uma luta ou uma demonstração, para que o povo que nos conhece tão bem não seja enganado." Se eles algum dia se enfrentaram diretamente permanece sem registro.

O ano seguinte, 1937, trouxe Samuel aos holofotes intelectuais. Edison Carneiro, o folclorista e pesquisador, o incluiu como informante-chave sobre Capoeira Angola em seu livro "Negros Bantus." Carneiro mais tarde declararia Samuel "o melhor capoeirista que já vimos" - alto elogio de um estudioso que havia testemunhado incontáveis mestres. Em 14 de janeiro de 1937, Samuel liderou uma exibição de Capoeira Angola no II Congresso Afro-Brasileiro em Salvador, demonstrando a arte tradicional perante intelectuais, pesquisadores e dignitários. Ele jogou seu famoso jogo contra Onça Preta diante de luminares como Edison Carneiro e Jorge Amado.

O legado de Samuel se estende à literatura. Jorge Amado o apresentou em "Capitães de Areia" (1937), onde ele aparece como "Querido de Deus" - um capoeirista amigo do bando que ensinou a arte a alguns de seus membros. O personagem foi tirado diretamente do Samuel real, completo com a mística e habilidade que o tornaram lendário nas docas de Salvador. Amado voltou a ele em "Bahia de Todos os Santos" (1945), pintando um retrato vívido: "o Rei da Capoeira da Bahia de Todos os Santos."

Em 18 de setembro de 1938, a antropóloga americana Ruth Landes, acompanhada de Edison Carneiro, testemunhou uma roda em Itapagipe. Suas fotografias - agora arquivadas na Smithsonian Institution - capturaram Samuel em ação contra Onça Preta. Em seu livro "The City of Women" (1947), Landes descreveu a chegada ao local onde os homens se formavam para a capoeira: "Dois capoeiristas estavam agachados de frente para os músicos - um era o campeão Querido de Deus, com o nome cristão de Samuel. Era alto, mulato, de meia-idade, musculoso, pescador de profissão." Ela documentou como ele sorria constantemente enquanto executava movimentos complexos com prodigiosa agilidade.

Sua fama atravessou fronteiras. Norte-americanos pagavam caro para vê-lo lutar, e cinegrafistas brasileiros filmaram suas exibições. Ainda assim, Samuel mostrava uma generosidade característica - quando cineastas brasileiros pobres o abordaram, ele não só recusou pagamento como os convidou para almoçar, embora tivesse exigido grandes honorários de espectadores estrangeiros ricos.

Mestre Waldemar, refletindo em 1989, ofereceu uma avaliação mais crítica: "Samuel Querido de Deus era bom mas era sopeiro também. Só de jogo. Ficava esperando você pular pra ele dar uma cabeçada. Quando você queria forrar ele não queria mais jogar. Era crocodilo." Essa paciência - a capacidade de atrair oponentes para o ataque e então desferir contra-ataques devastadores - era talvez o segredo de sua dominância.

Samuel treinou pelo menos um aluno formal que levou seu legado adiante: Juvenal Hermenegildo da Cruz, conhecido como "Juvenal Engraxate." Samuel formalmente concedeu a Juvenal o título de mestre, reconhecendo suas qualidades e potencial. "Este título me foi dado por Samuel Querido-de-Deus," Juvenal mais tarde contou. "Samuel gostava das minhas qualidades e via meu futuro." Juvenal descrevia seu professor como "uma onça" e proclamava que "Querido-de-Deus nunca perdeu uma luta!" Após a morte de Samuel, Juvenal continuou a linhagem, ensinando na rampa do Mercado Modelo para estivadores e trabalhadores portuários - a mesma comunidade que Samuel havia servido como pescador.

Apesar de não ter fundado uma academia ou deixado muitos discípulos formais, a influência de Samuel permaneceu profunda. Ele não deixou ensinamentos escritos, mas seu legado vive através de canções, histórias e a admiração de mestres posteriores. Ele está ao lado de Aberrê, Antônio Maré, Besouro, Bimba e Pastinha como um dos mestres da primeira geração da capoeira moderna - o grupo nascido no final do século XIX que transformou uma prática de rua perseguida em uma forma de arte reconhecida.

Samuel Querido de Deus morreu em algum momento na metade da década de 1940. Em janeiro de 1948, quando a revista O Cruzeiro entrevistou Juvenal sobre sua roda no Mercado Modelo, falavam de Samuel no passado. O rei da capoeira havia partido, mas sua coroa vivia na memória de todo capoeirista que havia testemunhado sua elegância na roda.',
  -- achievements_en
  E'Recognized by Edison Carneiro as "the best capoeirista ever seen"
Dominated the annual festivals at Nossa Senhora da Conceição da Praia in December
Led Capoeira Angola exhibition at the II Afro-Brazilian Congress in Salvador (January 14, 1937)
Featured as informant in Edison Carneiro''s "Negros Bantus" (1937)
Immortalized in Jorge Amado''s "Capitães de Areia" (1937) and "Bahia de Todos os Santos" (1945)
Photographed by anthropologist Ruth Landes at Itapagipe roda (September 18, 1938); images archived at Smithsonian Institution
Publicly challenged Mestre Bimba for title of "maximum capoeira master" of Bahia (1936)
Established a capoeira lineage through his student Juvenal (Juvenal Engraxate)
Known internationally; North American audiences paid to see his exhibitions',
  -- achievements_pt
  E'Reconhecido por Edison Carneiro como "o melhor capoeirista que já vimos"
Dominou os festivais anuais de Nossa Senhora da Conceição da Praia em dezembro
Liderou exibição de Capoeira Angola no II Congresso Afro-Brasileiro em Salvador (14 de janeiro de 1937)
Destacado como informante no livro "Negros Bantus" de Edison Carneiro (1937)
Imortalizado em "Capitães de Areia" (1937) e "Bahia de Todos os Santos" (1945) de Jorge Amado
Fotografado pela antropóloga Ruth Landes na roda de Itapagipe (18 de setembro de 1938); imagens arquivadas na Smithsonian Institution
Desafiou publicamente Mestre Bimba pelo título de "mestre máximo da capoeira" da Bahia (1936)
Estabeleceu uma linhagem de capoeira através de seu aluno Juvenal (Juvenal Engraxate)
Conhecido internacionalmente; audiências norte-americanas pagaram para ver suas exibições',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1880, decade precision):
Jorge Amado wrote in 1944 that "over sixty winters have passed since Samuel was born," placing his birth in the early 1880s. Using 1880 as midpoint estimate.

DEATH YEAR ESTIMATION (1947, decade precision):
In O Cruzeiro magazine (January 10, 1948), Juvenal speaks of him in the past tense. He was still alive for the 1938 Ruth Landes photographs and the 1944 Jorge Amado profile. Death likely occurred between 1944-1948. Using 1947 as estimate.

NAME: Full name recorded as Samuel Francisco Barreto de Souza across multiple sources.

TITLE: Called "mestre" by contemporaries and later sources, though formal title system did not exist in his era. His student Juvenal referred to him as "Mestre Samuel."

PHYSICAL DESCRIPTION: Multiple sources agree on tall, muscular build. Jorge Amado described indefinite skin color shaped by seafaring - mulatto with possible indigenous or Italian traces. Ruth Landes described him as "tall, mulatto, middle-aged, muscular."

BIMBA CHALLENGE (1936): Covered by O Imparcial (March 12) and Diário da Bahia (March 13). No record of actual fight taking place. Bimba''s response was measured, suggesting Samuel arrange a fight "so people are not deceived."

STUDENT LINEAGE: Mestre Juvenal Hermenegildo da Cruz (Juvenal Engraxate, 1919-1998) was his formal student. Juvenal trained approximately 28 students at Mercado Modelo ramp, continuing Samuel''s legacy.

PENDING RELATIONSHIPS (require future imports):
- Juvenal (Juvenal Engraxate) student_of Querido de Deus',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década):
Jorge Amado escreveu em 1944 que "mais de sessenta invernos se passaram desde que Samuel nasceu," colocando seu nascimento no início da década de 1880. Usando 1880 como estimativa do ponto médio.

ESTIMATIVA DO ANO DE MORTE (1947, precisão de década):
Na revista O Cruzeiro (10 de janeiro de 1948), Juvenal fala dele no passado. Ele ainda estava vivo para as fotografias de Ruth Landes de 1938 e o perfil de Jorge Amado de 1944. A morte provavelmente ocorreu entre 1944-1948. Usando 1947 como estimativa.

NOME: Nome completo registrado como Samuel Francisco Barreto de Souza em múltiplas fontes.

TÍTULO: Chamado de "mestre" por contemporâneos e fontes posteriores, embora o sistema formal de títulos não existisse em sua era. Seu aluno Juvenal se referia a ele como "Mestre Samuel."

DESCRIÇÃO FÍSICA: Múltiplas fontes concordam em estatura alta e constituição musculosa. Jorge Amado descreveu cor de pele indefinida moldada pela vida marítima - mulato com possíveis traços indígenas ou italianos. Ruth Landes o descreveu como "alto, mulato, meia-idade, musculoso."

DESAFIO A BIMBA (1936): Coberto por O Imparcial (12 de março) e Diário da Bahia (13 de março). Sem registro de luta real acontecendo. A resposta de Bimba foi comedida, sugerindo que Samuel arranjasse uma luta "para que o povo não seja enganado."

LINHAGEM DE ALUNOS: Mestre Juvenal Hermenegildo da Cruz (Juvenal Engraxate, 1919-1998) foi seu aluno formal. Juvenal treinou aproximadamente 28 alunos na rampa do Mercado Modelo, continuando o legado de Samuel.

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- Juvenal (Juvenal Engraxate) student_of Querido de Deus'
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

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- Use ON CONFLICT DO NOTHING for idempotent sync
-- ============================================================

-- --- Person-to-Person: Contemporary Association ---

-- Querido de Deus associated_with Onça Preta (played famous roda together, documented by Ruth Landes 1938)
-- Onça Preta IS in dataset
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, q.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-14'::date, 'exact'::genealogy.date_precision,
  '1938-09-18'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Famous contemporaries in 1930s Salvador. Played together at the II Afro-Brazilian Congress (January 14, 1937) witnessed by Edison Carneiro and Jorge Amado. Also played together in Ruth Landes'' documented roda at Itapagipe (September 18, 1938). Onça Preta trained under Samuel alongside other mestres."}'::jsonb,
  'verified'::genealogy.confidence,
  'Ruth Landes "The City of Women" (1947); Smithsonian Institution photographs; velhosmestres.com',
  'Samuel and Onça Preta played together at major documented events: the 1937 Afro-Brazilian Congress and the 1938 Itapagipe roda photographed by Ruth Landes. Onça Preta listed Samuel as one of his teachers.',
  'Samuel e Onça Preta jogaram juntos em eventos documentados importantes: o Congresso Afro-Brasileiro de 1937 e a roda de Itapagipe de 1938 fotografada por Ruth Landes. Onça Preta listou Samuel como um de seus professores.'
FROM genealogy.person_profiles q, genealogy.person_profiles o
WHERE q.apelido = 'Querido de Deus' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Onça Preta student_of Querido de Deus
-- Onça Preta listed Samuel as one of his teachers
-- Note: Using student_of because Onça Preta explicitly called these his "mestres":
-- "Não tive um mestre, mas vários" (I didn't have one mestre, but many)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, o.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, q.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta interview 1972 (O Dia newspaper); velhosmestres.com',
  'Onça Preta (b. 1909) stated in interviews that he trained under multiple mestres as a boy in Salvador, including "Samuel" (Samuel Querido de Deus). He recalled: "I had not one, but many mestres... Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê..."',
  'Onça Preta (n. 1909) declarou em entrevistas que treinou com múltiplos mestres quando menino em Salvador, incluindo "Samuel" (Samuel Querido de Deus). Ele recordou: "Não tive um, mas muitos mestres... Ainda menino, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê..."'
FROM genealogy.person_profiles o, genealogy.person_profiles q
WHERE o.apelido = 'Onça Preta' AND q.apelido = 'Querido de Deus'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Querido de Deus associated_with Bimba (public challenge 1936, contemporaries in Salvador)
-- Bimba IS in dataset
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, q.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, b.id,
  '1936-03-12'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Public challenge between the two masters in 1936 over the title of maximum capoeira master of Bahia. Reported in O Imparcial (March 12) and Diário da Bahia (March 13). Bimba''s measured response suggested arranging a fight ''so people are not deceived.'' No record of actual fight occurring. Represented opposing poles of Bahian capoeira: Samuel''s traditional Angola vs Bimba''s modernizing Regional."}'::jsonb,
  'verified'::genealogy.confidence,
  'O Imparcial (March 12, 1936); Diário da Bahia (March 13, 1936); velhosmestres.com',
  'Public challenge over the title of "maximum capoeira master" of Bahia. Bimba responded that Samuel should arrange a fight "so people are not deceived." No record of the fight occurring.',
  'Desafio público pelo título de "mestre máximo da capoeira" da Bahia. Bimba respondeu que Samuel deveria arranjar uma luta "para que o povo não seja enganado." Sem registro de luta acontecendo.'
FROM genealogy.person_profiles q, genealogy.person_profiles b
WHERE q.apelido = 'Querido de Deus' AND b.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Querido de Deus associated_with Pastinha (contemporaries in 1930s Salvador; both first-generation mestres)
-- Pastinha IS in dataset
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, q.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1947-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Both were first-generation mestres of modern capoeira Angola in Salvador. Onça Preta trained under both of them. While Pastinha would later codify and institutionalize Capoeira Angola at CECA, Samuel was recognized as the greatest practitioner of the 1930s without founding an academy."}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta interviews; velhosmestres.com; capoeirahistory.com',
  'Both recognized as first-generation mestres of Capoeira Angola in Salvador. Onça Preta trained under both. Samuel was the dominant figure of the 1930s while Pastinha would later codify the style.',
  'Ambos reconhecidos como mestres da primeira geração da Capoeira Angola em Salvador. Onça Preta treinou com ambos. Samuel era a figura dominante dos anos 1930 enquanto Pastinha mais tarde codificaria o estilo.'
FROM genealogy.person_profiles q, genealogy.person_profiles p
WHERE q.apelido = 'Querido de Deus' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/querido-de-deus.sql',
  NULL,
  ARRAY['persons/onca-preta.sql', 'persons/bimba.sql', 'persons/pastinha.sql']::text[],
  'Samuel Francisco Barreto de Souza (Querido de Deus); "The greatest capoeirista of 1930s Salvador"; Fisherman; Featured in Jorge Amado works; Photographed by Ruth Landes (1938)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- When these entities are imported, add the following statements:
--
-- STUDENTS:
-- 1. Juvenal (Juvenal Engraxate / Juvenal Hermenegildo da Cruz) student_of Querido de Deus
--    - confidence: verified
--    - source: "velhosmestres.com; O Cruzeiro (Jan 10, 1948)"
--    - note: Samuel formally granted Juvenal the mestre title. Juvenal continued teaching at Mercado Modelo ramp.
--
-- CONTEMPORARIES:
-- 2. Totonho de Maré associated_with Querido de Deus
--    - Edison Carneiro wrote that "the aces of capoeira in Bahia were the fisherman Samuel Querido de Deus and the docker Maré"
--    - NOTE: "Antonio Maré" = "Totonho de Maré" (Antonio Laurindo das Neves) - IMPLEMENTED in totonho-de-mare.sql
--
-- ============================================================
