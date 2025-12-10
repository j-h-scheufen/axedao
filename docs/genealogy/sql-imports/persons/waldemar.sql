-- ============================================================
-- GENEALOGY PERSON IMPORT: Mestre Waldemar
-- Generated: 2025-12-10
-- Primary Sources:
--   - https://velhosmestres.com/br/waldemar (main biography)
--   - https://velhosmestres.com/br/waldemar-1989-2 (1989 interview with Luiz Renato)
--   - https://velhosmestres.com/br/waldemar-1936 (early training)
--   - https://velhosmestres.com/br/waldemar-1970 (Diário de Notícias 1970)
--   - https://capoeira.online/history/mestres/mestre-waldemar/
--   - https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-waldemar/
-- ============================================================
-- DEPENDENCIES: persons/siri-de-mangue.sql, persons/neco-canario-pardo.sql,
--               persons/talabi.sql, persons/ricardo-de-ilha-de-mare.sql,
--               persons/pastinha.sql, persons/bimba.sql, persons/cobrinha-verde.sql,
--               persons/totonho-de-mare.sql, persons/besouro-manganga.sql
-- ============================================================
--
-- LIFE DATES:
-- Birth: February 22, 1916 on Ilha de Maré (verified by multiple sources)
-- Death: March 16, 1990 in Salvador (velhosmestres.com and Wikipedia)
-- Both dates are exact precision.
--
-- NAME: Waldemar Rodrigues da Paixão
-- Also known as: Waldemar da Liberdade, Waldemar do Pero Vaz, Sete Molas (Seven Springs)
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  'Waldemar Rodrigues da Paixão',
  'Waldemar',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  '[{"type": "website", "url": "https://velhosmestres.com/br/waldemar"}, {"type": "website", "url": "https://capoeira.online/history/mestres/mestre-waldemar/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Waldemar practiced and taught Capoeira Angola exclusively. He was known for his slow, low game with intricate footwork and head movements. He emphasized the traditional style learned from the old mestres of the Recôncavo and Periperi, preferring the strategic, patient approach over acrobatic displays. His style emphasized mandinga, malícia, and body control.',
  E'Waldemar praticava e ensinava exclusivamente Capoeira Angola. Era conhecido por seu jogo lento e baixo, com trabalho de pés intrincado e movimentos de cabeça. Enfatizava o estilo tradicional aprendido com os velhos mestres do Recôncavo e Periperi, preferindo a abordagem estratégica e paciente aos movimentos acrobáticos. Seu estilo enfatizava mandinga, malícia e controle corporal.',
  -- Life dates
  1916,
  'exact'::genealogy.date_precision,
  'Ilha de Maré, Salvador, Bahia, Brazil',
  1990,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Waldemar Rodrigues da Paixão was born on February 22, 1916, on Ilha de Maré, one of the islands in the Bay of All Saints near Salvador. He would become one of the most influential capoeira mestres of the 20th century, bridging the era of street capoeira and the modern academy system while stubbornly refusing to formalize his teaching.

In 1936, at age 20, Waldemar sought out training in Periperi, a working-class neighborhood in Salvador''s railway suburbs. "I learned capoeira in 1936 in Periperi," he recalled in a 1989 interview. "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four." He deliberately sought these teachers "to become professional," training for four years before he began teaching.

Siri de Mangue was a saveirista (boatman) from the Recôncavo who had been a training companion of the legendary Besouro Mangangá. Neco Canário Pardo taught him machete fighting. Talabi de Periperi was active at the "roda danada" (wild roda) where the old mestres gathered. Ricardo came from Waldemar''s own birthplace of Ilha de Maré. Through these four teachers, Waldemar inherited knowledge that stretched back to the pre-legalization era of capoeira.

By 1940, Waldemar established himself in the Corta-Braço slum—later renamed Liberdade—on the Estrada da Liberdade in Salvador. He built a straw-covered shed (barracão) where he held rodas every Sunday. Unlike Mestre Bimba with his academies and graduation system, and unlike Mestre Pastinha with his formal Centro Esportivo de Capoeira Angola, Waldemar never institutionalized his teaching. "At those times there wasn''t any Academy," he explained. "The Academy was everywhere there was a good shadow from the sun."

The Barracão de Waldemar became legendary. Every Sunday, capoeiristas from across Salvador gathered there. Waldemar earned the nickname "Sete Molas" (Seven Springs) for his agility—he could play capoeira without dirtying his white weekend clothes. He controlled his rodas with authority but without weapons, maintaining discipline through respect rather than force. "Everyone appreciates me, everyone likes me," he said.

His students included Zacarias Boa Morte (from 1942), José Cabelo Bom, Nagé, Traíra (from 1947), Bigodinho (from 1950), and many others. Traíra, who had served 11 years in prison for murder, came to Waldemar upon release. "The deceased Traíra took care of the roda," Waldemar recalled. "I went there, gave my order and went to have a beer. I was made." He taught using gestures and signals during play, indicating moves like tesoura and chibata without interrupting the game.

In 1942, Waldemar began selling decorated berimbaus at the Feira Água de Meninos market. He is credited with inventing the practice of painting and varnishing berimbaus, transforming them from rough instruments into works of art. He created a famous blue berimbau called "Azulão." This innovation became a significant source of income and established him as one of the master berimbau craftsmen of Bahia.

The 1950s brought recognition beyond the capoeira world. In 1953, Dorival Caymmi invited Waldemar to Rio de Janeiro for the show "Acontece que Sou Baiano" at the Casablanca nightclub. Waldemar brought twelve capoeiristas he had trained and performed for three months. This was one of the first times capoeira was presented publicly in Rio as entertainment. During this decade, ethnologists Anthony Leeds (1950) and Simone Dreyfus (1955) came to his Barracão to record the sounds of the berimbaus. Artists including sculptor Mário Cravo, painter Carybé, and photographer Pierre Verger frequented his sessions, documenting his capoeira through their work.

Waldemar also created the "Dentinho de Angola," a technique he described as potentially lethal—a heel strike to the throat. He deliberately did not teach it to his students for safety reasons.

In 1968, Waldemar stopped actively playing capoeira due to age and declining health, though he continued crafting berimbaus. He developed Parkinson''s disease in his later years but remained connected to the capoeira world. In 1984, despite his condition, he recorded an album with his friend Mestre Canjiquinha and participated in the I Encontro Nacional de Arte Capoeira in Rio de Janeiro, where he was described as "the oldest of all, considered the most important after the death of Mestre Pastinha."

Waldemar died on March 16, 1990, in Salvador. A neighborhood and a street in Bahia bear his name. He is remembered as "O Herói da Liberdade" (The Hero of Liberdade) and as one of the greatest mestres in the history of Capoeira Angola—a man who insisted on teaching the old way, in the open air, under a straw roof, preserving the street tradition even as capoeira moved into academies.',
  -- bio_pt
  E'Waldemar Rodrigues da Paixão nasceu em 22 de fevereiro de 1916, na Ilha de Maré, uma das ilhas da Baía de Todos os Santos perto de Salvador. Ele se tornaria um dos mestres de capoeira mais influentes do século XX, fazendo a ponte entre a era da capoeira de rua e o sistema moderno de academias, enquanto se recusava teimosamente a formalizar seu ensino.

Em 1936, aos 20 anos, Waldemar procurou treinamento em Periperi, um bairro popular no Subúrbio Ferroviário de Salvador. "Aprendi capoeira em 1936 em Periperi," recordou em uma entrevista de 1989. "Tive quatro mestres: Siri de Mangue, um; Canário Pardo, dois; Talavi, três e Ricardo de Ilha de Maré, quatro." Ele deliberadamente procurou esses professores "para se tornar profissional," treinando por quatro anos antes de começar a ensinar.

Siri de Mangue era um saveirista do Recôncavo que tinha sido companheiro de treino do lendário Besouro Mangangá. Neco Canário Pardo ensinou-lhe luta com facão. Talabi de Periperi era ativo na "roda danada" onde os velhos mestres se reuniam. Ricardo vinha do próprio local de nascimento de Waldemar, a Ilha de Maré. Através desses quatro professores, Waldemar herdou conhecimento que remontava à era pré-legalização da capoeira.

Por volta de 1940, Waldemar se estabeleceu na favela do Corta-Braço—mais tarde rebatizada de Liberdade—na Estrada da Liberdade em Salvador. Construiu um barracão coberto de palha onde realizava rodas todos os domingos. Diferente de Mestre Bimba com suas academias e sistema de graduação, e diferente de Mestre Pastinha com seu formal Centro Esportivo de Capoeira Angola, Waldemar nunca institucionalizou seu ensino. "Naquele tempo não havia Academia," explicou. "A Academia era em todo lugar que havia uma boa sombra do sol."

O Barracão de Waldemar se tornou lendário. Todo domingo, capoeiristas de toda Salvador se reuniam lá. Waldemar ganhou o apelido de "Sete Molas" por sua agilidade—ele podia jogar capoeira sem sujar suas roupas brancas de fim de semana. Controlava suas rodas com autoridade mas sem armas, mantendo a disciplina através do respeito em vez da força. "Todo mundo me aprecia, todo mundo gosta de mim," disse ele.

Seus alunos incluíam Zacarias Boa Morte (desde 1942), José Cabelo Bom, Nagé, Traíra (desde 1947), Bigodinho (desde 1950), e muitos outros. Traíra, que tinha cumprido 11 anos de prisão por homicídio, procurou Waldemar após a libertação. "O finado Traíra é que tomava conta da roda," recordou Waldemar. "Eu chegava lá, dava minha ordem e ia tomar minha cerveja. Eu era feito." Ele ensinava usando gestos e sinais durante o jogo, indicando movimentos como tesoura e chibata sem interromper o jogo.

Em 1942, Waldemar começou a vender berimbaus decorados na Feira Água de Meninos. É creditado como o inventor da prática de pintar e envernizar berimbaus, transformando-os de instrumentos rústicos em obras de arte. Criou um famoso berimbau azul chamado "Azulão." Esta inovação se tornou uma fonte significativa de renda e o estabeleceu como um dos mestres artesãos de berimbau da Bahia.

Os anos 1950 trouxeram reconhecimento além do mundo da capoeira. Em 1953, Dorival Caymmi convidou Waldemar ao Rio de Janeiro para o show "Acontece que Sou Baiano" na boate Casablanca. Waldemar levou doze capoeiristas que tinha treinado e se apresentou por três meses. Esta foi uma das primeiras vezes que a capoeira foi apresentada publicamente no Rio como entretenimento. Durante esta década, os etnólogos Anthony Leeds (1950) e Simone Dreyfus (1955) vieram ao seu Barracão para gravar os sons dos berimbaus. Artistas incluindo o escultor Mário Cravo, o pintor Carybé e o fotógrafo Pierre Verger frequentavam suas sessões, documentando sua capoeira através de suas obras.

Waldemar também criou o "Dentinho de Angola," uma técnica que descreveu como potencialmente letal—um golpe de calcanhar na garganta. Deliberadamente não a ensinava aos seus alunos por razões de segurança.

Em 1968, Waldemar parou de jogar capoeira ativamente devido à idade e saúde em declínio, embora continuasse fabricando berimbaus. Desenvolveu doença de Parkinson em seus últimos anos mas permaneceu conectado ao mundo da capoeira. Em 1984, apesar de sua condição, gravou um álbum com seu amigo Mestre Canjiquinha e participou do I Encontro Nacional de Arte Capoeira no Rio de Janeiro, onde foi descrito como "o mais velho de todos, considerado o mais importante após a morte de Mestre Pastinha."

Waldemar morreu em 16 de março de 1990, em Salvador. Um bairro e uma rua na Bahia levam seu nome. É lembrado como "O Herói da Liberdade" e como um dos maiores mestres da história da Capoeira Angola—um homem que insistiu em ensinar do jeito antigo, ao ar livre, sob um teto de palha, preservando a tradição de rua mesmo enquanto a capoeira se mudava para as academias.',
  -- achievements_en
  E'Established the legendary Barracão de Waldemar in Liberdade (1940-1968), one of the most important capoeira gathering points in Bahia
Invented the practice of painting and varnishing berimbaus (1942), creating decorated instruments including the famous "Azulão"
First capoeirista to perform publicly in Rio de Janeiro at the Casablanca nightclub with Dorival Caymmi (1953)
Documented by major artists and ethnologists: Pierre Verger, Carybé, Mário Cravo, Anthony Leeds, Simone Dreyfus
Created the "Dentinho de Angola" technique
Recorded album with Mestre Canjiquinha (1984) despite Parkinson''s disease
Participated in the I Encontro Nacional de Arte Capoeira (1984)
Honored with a neighborhood and street named after him in Salvador
Known as "O Herói da Liberdade" (The Hero of Liberdade)',
  -- achievements_pt
  E'Estabeleceu o lendário Barracão de Waldemar na Liberdade (1940-1968), um dos pontos de encontro de capoeira mais importantes da Bahia
Inventou a prática de pintar e envernizar berimbaus (1942), criando instrumentos decorados incluindo o famoso "Azulão"
Primeiro capoeirista a se apresentar publicamente no Rio de Janeiro na boate Casablanca com Dorival Caymmi (1953)
Documentado por grandes artistas e etnólogos: Pierre Verger, Carybé, Mário Cravo, Anthony Leeds, Simone Dreyfus
Criou a técnica "Dentinho de Angola"
Gravou álbum com Mestre Canjiquinha (1984) apesar da doença de Parkinson
Participou do I Encontro Nacional de Arte Capoeira (1984)
Homenageado com um bairro e uma rua com seu nome em Salvador
Conhecido como "O Herói da Liberdade"',
  -- Researcher notes (English)
  E'LIFE DATES:
Birth: February 22, 1916 - exact date confirmed by multiple sources (velhosmestres.com, Wikipedia, capoeira.online)
Death: March 16, 1990 - confirmed by velhosmestres.com

BIRTH PLACE: Ilha de Maré, an island in the Bay of All Saints near Salvador.

ALIASES: Waldemar da Liberdade, Waldemar do Pero Vaz, Sete Molas (Seven Springs - for his agility)

FOUR TEACHERS (confirmed in 1989 interview):
1. Siri de Mangue - saveirista from Recôncavo, training companion of Besouro
2. Neco Canário Pardo - machete teacher, companion of Besouro at Trapiche de Baixo
3. Talabi (Talavi) de Periperi - active at the "roda danada" in Periperi
4. Ricardo de Ilha de Maré - from Waldemar''s birthplace

TRAINING PERIOD: 1936-1940 (four years), began teaching in 1940

BARRACÃO: Established 1940 on Estrada da Liberdade in Corta-Braço slum (later Liberdade neighborhood). Operated until 1968.

STUDENTS (documented with dates):
- Zacarias Boa Morte (from 1942)
- José Cabelo Bom
- Nagé
- Traíra (from 1947) - ex-convict who managed the roda
- Bigodinho (from 1950) - frequented Barracão for 25+ years
- Olavo (from 1958)

RIO TRIP 1953: Invited by Dorival Caymmi for "Acontece que Sou Baiano" at Casablanca nightclub. Brought 12 trained capoeiristas. Performed 3 months.

BERIMBAU INNOVATION: Started painting/varnishing berimbaus in 1942 at Feira Água de Meninos. Created "Azulão" (famous blue berimbau).

DENTINHO DE ANGOLA: Technique he invented but refused to teach - heel strike to throat.

HEALTH: Parkinson''s disease in later years. Stopped playing in 1968 but continued making berimbaus.

1984 ALBUM: Recorded with Mestre Canjiquinha despite Parkinson''s.

RELATIONSHIPS WITH OTHER MESTRES: "Vadiado" (practiced) with Pastinha, Bimba, and Totonho de Maré according to 1970 interview.',
  -- Researcher notes (Portuguese)
  E'DATAS DE VIDA:
Nascimento: 22 de fevereiro de 1916 - data exata confirmada por múltiplas fontes (velhosmestres.com, Wikipedia, capoeira.online)
Morte: 16 de março de 1990 - confirmado por velhosmestres.com

LOCAL DE NASCIMENTO: Ilha de Maré, uma ilha na Baía de Todos os Santos perto de Salvador.

APELIDOS: Waldemar da Liberdade, Waldemar do Pero Vaz, Sete Molas (por sua agilidade)

QUATRO MESTRES (confirmado em entrevista de 1989):
1. Siri de Mangue - saveirista do Recôncavo, companheiro de treino de Besouro
2. Neco Canário Pardo - mestre de facão, companheiro de Besouro no Trapiche de Baixo
3. Talabi (Talavi) de Periperi - ativo na "roda danada" em Periperi
4. Ricardo de Ilha de Maré - do local de nascimento de Waldemar

PERÍODO DE TREINAMENTO: 1936-1940 (quatro anos), começou a ensinar em 1940

BARRACÃO: Estabelecido em 1940 na Estrada da Liberdade na favela do Corta-Braço (depois bairro da Liberdade). Funcionou até 1968.

ALUNOS (documentados com datas):
- Zacarias Boa Morte (desde 1942)
- José Cabelo Bom
- Nagé
- Traíra (desde 1947) - ex-presidiário que gerenciava a roda
- Bigodinho (desde 1950) - frequentou o Barracão por mais de 25 anos
- Olavo (desde 1958)

VIAGEM AO RIO 1953: Convidado por Dorival Caymmi para "Acontece que Sou Baiano" na boate Casablanca. Levou 12 capoeiristas treinados. Apresentou-se por 3 meses.

INOVAÇÃO DO BERIMBAU: Começou a pintar/envernizar berimbaus em 1942 na Feira Água de Meninos. Criou "Azulão" (famoso berimbau azul).

DENTINHO DE ANGOLA: Técnica que inventou mas se recusava a ensinar - golpe de calcanhar na garganta.

SAÚDE: Doença de Parkinson nos últimos anos. Parou de jogar em 1968 mas continuou fazendo berimbaus.

ÁLBUM DE 1984: Gravou com Mestre Canjiquinha apesar do Parkinson.

RELACIONAMENTOS COM OUTROS MESTRES: "Vadiou" (praticou) com Pastinha, Bimba e Totonho de Maré segundo entrevista de 1970.'
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
-- ============================================================

-- --- Person-to-Person: Training Relationships (Waldemar as student) ---

-- Waldemar student_of Siri de Mangue (first teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 1}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'First of four teachers. Siri de Mangue was a saveirista from the Recôncavo and training companion of Besouro Mangangá.',
  'Primeiro de quatro mestres. Siri de Mangue era saveirista do Recôncavo e companheiro de treino de Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Waldemar student_of Neco Canário Pardo (second teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 2}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Second of four teachers. Neco Canário Pardo was known for machete expertise and was a companion of Besouro at Trapiche de Baixo.',
  'Segundo de quatro mestres. Neco Canário Pardo era conhecido pela perícia com facão e era companheiro de Besouro no Trapiche de Baixo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Waldemar student_of Talabi (third teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 3}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Third of four teachers. Talabi (also spelled Talavi, Telabi, Calabi) was active at the "roda danada" (wild roda) in Periperi.',
  'Terceiro de quatro mestres. Talabi (também escrito Talavi, Telabi, Calabi) era ativo na "roda danada" em Periperi.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Talabi' AND o.apelido_context = 'de Periperi'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Waldemar student_of Ricardo de Ilha de Maré (fourth teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1940-01-01'::date, 'year'::genealogy.date_precision,
  '{"teacher_order": 4}'::jsonb,
  'verified'::genealogy.confidence,
  'Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Fourth of four teachers. Ricardo was from Ilha de Maré, the same island where Waldemar was born.',
  'Quarto de quatro mestres. Ricardo era da Ilha de Maré, a mesma ilha onde Waldemar nasceu.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Ricardo de Ilha de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Associations with contemporaries ---

-- Waldemar associated_with Pastinha (practiced together)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Contemporaries who practiced (''vadiado'') together in Salvador. Waldemar stated in 1970 interview that he had ''vadiado'' with Pastinha. Both were active in Salvador''s capoeira scene during the 1940s-1960s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias 1970 interview: Waldemar said he had "vadiado" with Pastinha, Bimba, and Totonho Maré',
  'Contemporary mestres who practiced together in Salvador. Waldemar and Pastinha were both active during the 1940s-1960s, representing different approaches to preserving capoeira Angola.',
  'Mestres contemporâneos que praticaram juntos em Salvador. Waldemar e Pastinha eram ambos ativos durante os anos 1940-1960, representando diferentes abordagens para preservar a capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Waldemar associated_with Bimba (practiced together)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Contemporaries who practiced (''vadiado'') together in Salvador. Waldemar stated in 1970 interview that he had ''vadiado'' with Bimba. Despite practicing different styles, they interacted in Salvador''s capoeira scene."}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias 1970 interview: Waldemar said he had "vadiado" with Pastinha, Bimba, and Totonho Maré',
  'Contemporary mestres who practiced together despite their different approaches. Waldemar (Angola) and Bimba (Regional) both operated in Salvador during the 1940s-1960s.',
  'Mestres contemporâneos que praticaram juntos apesar de suas abordagens diferentes. Waldemar (Angola) e Bimba (Regional) ambos atuavam em Salvador durante os anos 1940-1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Waldemar associated_with Totonho de Maré (practiced together, both from Ilha de Maré)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Both from Ilha de Maré; Waldemar stated in 1970 interview that he had ''vadiado'' with Totonho Maré. Totonho (b. 1894) was older and was a co-founder of Gengibirra."}'::jsonb,
  'verified'::genealogy.confidence,
  'Diário de Notícias 1970 interview: Waldemar said he had "vadiado" with Pastinha, Bimba, and Totonho Maré',
  'Both were from Ilha de Maré and practiced together. Totonho (1894-1974) was older and was one of the "owners and proprietors" of Gengibirra.',
  'Ambos eram da Ilha de Maré e praticavam juntos. Totonho (1894-1974) era mais velho e era um dos "donos e proprietários" da Gengibirra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Waldemar associated_with Cobrinha Verde (influenced each other)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Contemporary mestres in Salvador. Multiple sources indicate Waldemar had significant influence on Cobrinha Verde and vice versa. Cobrinha operated a roda in Chame-Chame while Waldemar operated in Liberdade. The 1962 LP ''Capoeira da Bahia'' was recorded at Waldemar''s residence with Cobrinha''s participation."}'::jsonb,
  'likely'::genealogy.confidence,
  'Capoeira.online, capoeira-connection.com; 1962 LP "Capoeira da Bahia" recorded at Waldemar''s residence',
  'Contemporary mestres who influenced each other. The 1962 LP "Capoeira da Bahia" was recorded at Waldemar''s residence. Both were important Angola mestres in Salvador.',
  'Mestres contemporâneos que se influenciaram mutuamente. O LP de 1962 "Capoeira da Bahia" foi gravado na residência de Waldemar. Ambos eram importantes mestres de Angola em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Waldemar' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/waldemar.sql',
  NULL,
  ARRAY[
    'persons/siri-de-mangue.sql',
    'persons/neco-canario-pardo.sql',
    'persons/talabi.sql',
    'persons/ricardo-de-ilha-de-mare.sql',
    'persons/pastinha.sql',
    'persons/bimba.sql',
    'persons/cobrinha-verde.sql',
    'persons/totonho-de-mare.sql'
  ],
  'Mestre Waldemar da Paixão (1916-1990) - Legendary capoeira Angola mestre from Ilha de Maré; founder of Barracão de Waldemar in Liberdade; inventor of painted berimbaus; known as "O Herói da Liberdade"'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
