-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2025-12-15T11:26:49.488Z
-- ============================================================
--
-- New entity files: 6
-- Changed entity files: 3
-- New statement files: 6
-- Changed statement files: 0
-- Deleted files: 0
-- Unchanged files: 133
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/adilson-camisa-preta.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Adilson (Camisa Preta)
-- Generated: 2025-12-15
-- Primary Sources:
--   https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/
--   https://capoeuropa.org/nzinga-geschichte-schule/
--   https://capoeuropa.org/historia-da-escola/
-- ============================================================
-- DEPENDENCIES: roque.sql (teacher)
-- ============================================================
--
-- IDENTITY:
-- - Full Name: Adilson (surname unknown)
-- - Apelido: Adilson Camisa Preta (also known as "Adilson" or "Camisa Preta")
-- - Apelido Context: Used to distinguish from other "Adilson" figures in capoeira
--   (e.g., Adilson Alves da Silva in Brasilia)
--
-- BIRTH YEAR:
-- - 1952, exact - stated explicitly in capoeuropa.org
-- - Born in Rio de Janeiro
-- - Raised in Morro do Cantagalo, Ipanema
--
-- DEATH:
-- - 1990s (decade precision) - no exact date available
-- - "He died in the 1990s" - capoeuropa.org
-- - Death location: Rio de Janeiro (assumed, no explicit source)
--
-- TRAINING:
-- - Primary teacher: Mestre Roque
-- - Trained at Pavao/Pavaozinho academy
-- - Became Roque's senior student, took over school leadership ~1970
--
-- CAREER:
-- - Took command of Roque's school in early 1970s
-- - Taught at Morro do Pavaozinho in Copacabana
-- - Expert in malandragem (street wisdom, tricks and feints)
-- - Performance career: "Bahia Saraza" show, Intercontinental Hotel in Vidigal,
--   Galeria Alasca
-- - Collaborated with Mercedes Batista (first Black dancer at Rio Municipal Theatre)
--   and Aroldo Costa (Afro-Brazilian cultural figure)
-- - Graduated Paulo Siqueira as mestre
--
-- STYLE NOTES:
-- - Taught in the Angola tradition from Mestre Roque's "Linha de Sao Bento"
-- - Known for malandragem expertise - the cunning, improvisation, and trickery
--   characteristic of capoeira's malandro heritage
--
-- DISAMBIGUATION:
-- - DISTINCT from "Adilson" (Adilson Alves da Silva) - Brasilia mestre born May 30,
--   1952 in Marechal Hermes, moved to Brasilia 1961, became doctor (CRM-DF 3207)
-- - DISTINCT from "Miguel Camisa Preta" (Alfredo Francisco Soares) - Rio malandro
--   assassinated July 12, 1912, became Umbanda entity
-- - DISTINCT from "Manezinho Camisa Preta" - Rio valentao who sought to challenge
--   Nascimento Grande in 19th century Recife
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Adilson Camisa Preta',
  'Rio de Janeiro, Roque lineage',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/', 'https://capoeuropa.org/nzinga-geschichte-schule/', 'https://capoeuropa.org/historia-da-escola/']::text[],
  'angola'::genealogy.style,
  E'Adilson practiced and taught Capoeira Angola in the tradition of Mestre Roque''s "Linha de Sao Bento" - a faster, more dynamic style of Angola brought from Bahia to Rio de Janeiro. He was renowned for his deep expertise in malandragem - the cunning, improvisation, deception, and street wisdom that characterized capoeira''s malandro heritage. His mastery of these elements made him a respected teacher of both capoeira technique and the cultural philosophy underlying the art.',
  E'Adilson praticava e ensinava Capoeira Angola na tradicao da "Linha de Sao Bento" de Mestre Roque - um estilo de Angola mais rapido e dinamico trazido da Bahia para o Rio de Janeiro. Era conhecido por seu profundo dominio da malandragem - a astucia, improvisacao, engano e sabedoria das ruas que caracterizavam a heranca malandra da capoeira. Seu dominio desses elementos o tornou um professor respeitado tanto da tecnica de capoeira quanto da filosofia cultural subjacente a arte.',
  1952,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  1995,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  E'Adilson, known as Adilson Camisa Preta ("Black Shirt Adilson"), was born in 1952 in Rio de Janeiro and grew up in the Morro do Cantagalo favela in Ipanema. He became a student of Mestre Roque, one of the founders of Grupo Filhos de Angola and a pioneer of capoeira in Rio de Janeiro''s favelas.\n\nBy the early 1970s, Adilson had become Roque''s most advanced student. When Roque decided to step back from daily teaching at the Pavao/Pavaozinho academy, he entrusted leadership to Adilson. As Paulo Siqueira recalled: "Mestre Roque was teaching, but he already wanted to leave for personal reasons, wanting to stop there and hand over to his most advanced student, Adilson."\n\nAdilson established himself at the Morro do Pavaozinho in Copacabana, transforming the community space into what one contemporary described as "like a quilombo, where capoeira was practised in a very different way to the academies in the South Zone." The academy served primarily poor residents of the Pavao and Cantagalo hills, operating in a spontaneous, traditional style distinct from the more formal Senzala-influenced academies in the Zona Sul.\n\nAdilson was renowned for his expertise in malandragem - the street wisdom, cunning, and improvisational trickery that formed capoeira''s cultural heart. His profound understanding of malandragem extended beyond capoeira technique to encompass the life and ways of his community. This knowledge made him both a formidable player and an influential teacher who could transmit not just movements but the philosophy underlying them.\n\nBeyond the roda, Adilson built connections with important figures in Afro-Brazilian culture. He collaborated with Aroldo Costa and Mercedes Batista, the pioneering choreographer who had been the first Black dancer to perform at Rio de Janeiro''s Municipal Theatre. Through Adilson, his students gained access to this broader cultural world. He brought students to perform in concert halls, including Almir Sinclair''s "Bahia Saraza" show at venues like the Galeria Alasca and the Intercontinental Hotel in Vidigal.\n\nPaulo Siqueira, who began training at the Pavao academy around 1972, became Adilson''s most prominent student. As Siqueira progressed, Adilson told him: "You''re not going to pay for capoeira any more. Now you''re going to work with me." Siqueira would later describe Adilson as having "great influence in the life of Paulo Siqueira, as capoeirista and person." Adilson remained Paulo''s sole mestre throughout his training, eventually graduating him as mestre before Adilson''s death.\n\nAdilson died in the 1990s. His legacy continues through Mestre Paulo Siqueira, who went on to found the Escola de Capoeira Nzinga in Germany in 1985, becoming one of the first to bring capoeira to Europe and making it known across the continent. Through Paulo and the Nzinga school, Adilson''s lineage now extends from the favelas of Rio de Janeiro to Hamburg, Hannover, and Kiel.',
  E'Adilson, conhecido como Adilson Camisa Preta, nasceu em 1952 no Rio de Janeiro e cresceu na favela do Morro do Cantagalo em Ipanema. Tornou-se aluno de Mestre Roque, um dos fundadores do Grupo Filhos de Angola e pioneiro da capoeira nas favelas do Rio de Janeiro.\n\nNo inicio dos anos 1970, Adilson ja era o aluno mais avancado de Roque. Quando Roque decidiu se afastar do ensino diario na academia do Pavao/Pavaozinho, confiou a lideranca a Adilson. Como Paulo Siqueira relembrou: "Mestre Roque estava ensinando, mas ele ja queria sair por razoes pessoais, querendo parar ali e passar para seu aluno mais avancado, Adilson."\n\nAdilson se estabeleceu no Morro do Pavaozinho em Copacabana, transformando o espaco comunitario no que um contemporaneo descreveu como "um quilombo, onde a capoeira era praticada de uma forma muito diferente das academias da Zona Sul." A academia atendia principalmente os moradores pobres dos morros do Pavao e Cantagalo, operando em um estilo espontaneo e tradicional distinto das academias mais formais influenciadas pelo Senzala na Zona Sul.\n\nAdilson era conhecido por sua expertise em malandragem - a sabedoria das ruas, astucia e truques improvisados que formavam o coracao cultural da capoeira. Seu profundo entendimento da malandragem ia alem da tecnica de capoeira para abranger a vida e os costumes de sua comunidade. Esse conhecimento o tornava tanto um jogador formidavel quanto um professor influente que podia transmitir nao apenas movimentos, mas a filosofia por tras deles.\n\nAlem da roda, Adilson construiu conexoes com figuras importantes da cultura afro-brasileira. Ele colaborou com Aroldo Costa e Mercedes Batista, a coreografa pioneira que foi a primeira dancarina negra a se apresentar no Teatro Municipal do Rio de Janeiro. Atraves de Adilson, seus alunos ganhavam acesso a esse mundo cultural mais amplo. Ele levava alunos para se apresentar em casas de shows, incluindo o espetaculo "Bahia Saraza" de Almir Sinclair em locais como a Galeria Alasca e o Hotel Intercontinental no Vidigal.\n\nPaulo Siqueira, que comecou a treinar na academia do Pavao por volta de 1972, tornou-se o aluno mais proeminente de Adilson. Quando Siqueira progrediu, Adilson disse a ele: "Voce nao vai mais pagar pela capoeira. Agora voce vai trabalhar comigo." Siqueira mais tarde descreveria Adilson como tendo "grande influencia na vida de Paulo Siqueira, como capoeirista e pessoa." Adilson permaneceu como unico mestre de Paulo durante todo seu treinamento, eventualmente graduando-o como mestre antes da morte de Adilson.\n\nAdilson morreu nos anos 1990. Seu legado continua atraves de Mestre Paulo Siqueira, que fundou a Escola de Capoeira Nzinga na Alemanha em 1985, tornando-se um dos primeiros a trazer a capoeira para a Europa e torna-la conhecida pelo continente. Atraves de Paulo e da escola Nzinga, a linhagem de Adilson agora se estende das favelas do Rio de Janeiro ate Hamburgo, Hannover e Kiel.',
  E'Senior student of Mestre Roque; successor to leadership of Pavao/Pavaozinho academy\nExpert in malandragem (street wisdom and capoeira trickery)\nGraduated Mestre Paulo Siqueira - pioneer of capoeira in Germany/Europe\nCollaborated with Mercedes Batista and Aroldo Costa in Afro-Brazilian cultural work\nPerformed in "Bahia Saraza" show and at major Rio venues\nBridge figure connecting favela capoeira to professional performance world',
  E'Aluno senior de Mestre Roque; sucessor na lideranca da academia do Pavao/Pavaozinho\nEspecialista em malandragem (sabedoria das ruas e truques de capoeira)\nFormou Mestre Paulo Siqueira - pioneiro da capoeira na Alemanha/Europa\nColaborou com Mercedes Batista e Aroldo Costa em trabalho cultural afro-brasileiro\nApresentou-se no espetaculo "Bahia Saraza" e em importantes locais do Rio\nFigura ponte conectando a capoeira das favelas ao mundo profissional de performance',
  E'BIRTH YEAR: 1952 (exact) - explicitly stated in capoeuropa.org: "born in 1952 in Rio de Janeiro"\n\nDEATH YEAR: 1990s (decade precision)\n- capoeuropa.org states "He died in the 1990s" but notes "I don''t know the exact date"\n- Using 1995 as midpoint estimate with decade precision\n- Death location assumed Rio de Janeiro (no explicit source)\n\nFULL NAME:\n- Surname unknown; all sources refer to him only as "Adilson" or "Adilson Camisa Preta"\n- Cannot determine if "Adilson" is given name or surname\n\nAPELIDO CONTEXT:\n- Used "Rio de Janeiro, Roque lineage" to distinguish from Adilson Alves da Silva (Brasilia)\n- The Wikipedia "Mestre Adilson" page refers to the Brasilia mestre, not this person\n\nNICKNAME ORIGIN:\n- "Camisa Preta" (Black Shirt) - origin of nickname not documented\n- DISTINCT from Miguel Camisa Preta (early 20th century malandro)\n- DISTINCT from Manezinho Camisa Preta (19th century valentao)\n\nTRAINING:\n- Student of Mestre Roque at Pavao/Pavaozinho\n- Became Roque''s "most advanced student" and took over school leadership ~1970\n\nSTUDENTS:\n- Paulo Siqueira (began ~1972, graduated as mestre before Adilson''s death)\n- Other students likely but not documented by name\n\nCULTURAL COLLABORATIONS:\n- Mercedes Batista: First Black dancer at Rio Municipal Theatre; choreographer\n- Aroldo Costa: Afro-Brazilian cultural figure (details unclear)\n\nPERFORMANCE WORK:\n- "Bahia Saraza" show by Almir Sinclair\n- Galeria Alasca (Rio)\n- Intercontinental Hotel in Vidigal (Rio)\n\nGROUP AFFILIATION:\n- Taught at Grupo Bantus de Capoeira (founded by Mestre Roque)\n- Associated with Filhos de Angola lineage through Roque\n\nACADEMY DESCRIPTION:\n- Morro do Pavaozinho, Copacabana\n- Described as "like a quilombo" - different from Zona Sul academies\n- More spontaneous and traditional style',
  E'ANO DE NASCIMENTO: 1952 (exato) - declarado explicitamente em capoeuropa.org: "nascido em 1952 no Rio de Janeiro"\n\nANO DE MORTE: Anos 1990 (precisao de decada)\n- capoeuropa.org afirma "Ele morreu nos anos 1990" mas nota "Eu nao sei a data exata"\n- Usando 1995 como estimativa de ponto medio com precisao de decada\n- Local da morte presumido Rio de Janeiro (sem fonte explicita)\n\nNOME COMPLETO:\n- Sobrenome desconhecido; todas as fontes referem-se a ele apenas como "Adilson" ou "Adilson Camisa Preta"\n- Nao e possivel determinar se "Adilson" e nome proprio ou sobrenome\n\nCONTEXTO DO APELIDO:\n- Usado "Rio de Janeiro, linhagem Roque" para distinguir de Adilson Alves da Silva (Brasilia)\n- A pagina da Wikipedia "Mestre Adilson" refere-se ao mestre de Brasilia, nao a esta pessoa\n\nORIGEM DO APELIDO:\n- "Camisa Preta" - origem do apelido nao documentada\n- DISTINTO de Miguel Camisa Preta (malandro do inicio do seculo XX)\n- DISTINTO de Manezinho Camisa Preta (valentao do seculo XIX)\n\nTREINAMENTO:\n- Aluno de Mestre Roque no Pavao/Pavaozinho\n- Tornou-se o "aluno mais avancado" de Roque e assumiu a lideranca da escola ~1970\n\nALUNOS:\n- Paulo Siqueira (comecou ~1972, formado mestre antes da morte de Adilson)\n- Outros alunos provaveis mas nao documentados por nome\n\nCOLABORACOES CULTURAIS:\n- Mercedes Batista: Primeira dancarina negra no Teatro Municipal do Rio; coreografa\n- Aroldo Costa: Figura cultural afro-brasileira (detalhes incertos)\n\nTRABALHO DE PERFORMANCE:\n- Espetaculo "Bahia Saraza" de Almir Sinclair\n- Galeria Alasca (Rio)\n- Hotel Intercontinental no Vidigal (Rio)\n\nAFILIACAO A GRUPO:\n- Ensinou no Grupo Bantus de Capoeira (fundado por Mestre Roque)\n- Associado a linhagem Filhos de Angola atraves de Roque\n\nDESCRICAO DA ACADEMIA:\n- Morro do Pavaozinho, Copacabana\n- Descrita como "um quilombo" - diferente das academias da Zona Sul\n- Estilo mais espontaneo e tradicional'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/chico-preto.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Chico Preto
-- Generated: 2025-12-15
-- Primary Source: https://capoeirahistory.com/mestre/master-roque-1938/
-- ============================================================
-- DEPENDENCIES: None (foundational figure)
-- ============================================================
--
-- BIRTH YEAR ESTIMATION:
-- - Son Roque born 1938 (exact)
-- - Chico Preto described as "well-known capoeira" when Roque was young
-- - By 1948 (when Roque started training at age 10), Chico Preto was established
--   with connections in the capoeira community at Mercado Modelo
-- - If Chico Preto was 25-35 when Roque was born, he'd be born ~1903-1913
-- - Estimate: 1910 (decade precision) - allows him to be in his 30s-40s
--   during Roque's formative years at the Mercado Modelo
--
-- IDENTITY:
-- - Full name: Liberato Francisco Xavier
-- - Apelido: Chico Preto
-- - Profession: Fish vendor (peixeiro) at Mercado Modelo, Salvador
-- - Status: Described as "well-known capoeira" (capoeirista)
--
-- FAMILY:
-- - Father of Mestre Roque (Roque Mendes dos Santos, b. 1938)
-- - Brother of Ze Bedeu (another capoeirista, father of Marco Buscape)
--
-- CAPOEIRA CONNECTIONS:
-- - Had a friend who was a tailor on Peru hill near Largo do Tanque -
--   this tailor became Roque's first capoeira teacher in 1948
-- - Through his position at Mercado Modelo, connected to many famous
--   capoeiristas of the era: Gaje, Indio, Tatu Bola, Bom Cabrito,
--   Boca de Fumaca, Traira, Canjiquinha, Cobrinha Verde
--
-- HISTORICAL CONTEXT:
-- - Mercado Modelo was a hub for capoeira in Salvador during the 1940s
-- - Other notable capoeiristas at the market included Mestre Bugalho,
--   Mestre Waldemar (who sold berimbaus there from 1942), and others
-- - The Rampa do Mercado (Market Ramp) was a famous capoeira location
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Liberato Francisco Xavier',
  'Chico Preto',
  NULL,
  NULL,
  ARRAY[]::text[],
  NULL,
  NULL,
  NULL,
  1910,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Liberato Francisco Xavier, known as Chico Preto, was a capoeirista and fish vendor (peixeiro) who operated a stand at the famous Mercado Modelo in Salvador, Bahia.\n\nThe Mercado Modelo was not just a market—it was a hub of Bahian culture and capoeira during the mid-20th century. The Rampa do Mercado (Market Ramp) was a renowned gathering place for capoeiristas, and vendors like Chico Preto were connected to the vibrant community of practitioners who worked and played there. Mestre Waldemar began selling his hand-painted berimbaus at the nearby Agua de Meninos fair in 1942, and mestres like Bugalho were fixtures at the market ramp.\n\nChico Preto was the father of Mestre Roque (Roque Mendes dos Santos, born 1938 in Cachoeira), one of four founding lineages of contemporary capoeira in Rio de Janeiro. His brother Ze Bedeu was also a capoeirista who would father and train Marco Buscape.\n\nThrough his position at the Mercado Modelo and his connections in the capoeira community, Chico Preto facilitated his son''s introduction to the art. When Roque was ten years old in 1948, Chico Preto arranged for him to train with a friend—a tailor who lived on Peru hill near Largo do Tanque. This tailor became Roque''s first formal teacher.\n\nYoung Roque, through his father''s market connections, socialized with many of the famous capoeiristas of the era: Gaje, Indio, Tatu Bola, Bom Cabrito, Boca de Fumaca, Traira, Canjiquinha, and Cobrinha Verde. Roque would later claim that he "learned a lot from Cobrinha Verde" and that his lineage descended from Tio Alipio through Besouro, continuing with Cobrinha Verde.\n\nChico Preto represents the generation of capoeiristas who practiced during the transition period—when capoeira was legalized in 1937 after decades of prohibition, and the art began moving from the streets into academies. His role in connecting his son to the capoeira community helped establish one of the major lineages in Rio de Janeiro.',
  E'Liberato Francisco Xavier, conhecido como Chico Preto, era um capoeirista e peixeiro que tinha uma banca no famoso Mercado Modelo em Salvador, Bahia.\n\nO Mercado Modelo nao era apenas um mercado—era um centro da cultura baiana e da capoeira em meados do seculo XX. A Rampa do Mercado era um renomado ponto de encontro para capoeiristas, e vendedores como Chico Preto estavam conectados a vibrante comunidade de praticantes que trabalhavam e jogavam ali. Mestre Waldemar comecou a vender seus berimbaus pintados a mao na feira de Agua de Meninos em 1942, e mestres como Bugalho eram figuras constantes na rampa do mercado.\n\nChico Preto era pai de Mestre Roque (Roque Mendes dos Santos, nascido em 1938 em Cachoeira), uma das quatro linhagens fundadoras da capoeira contemporanea no Rio de Janeiro. Seu irmao Ze Bedeu tambem era capoeirista e seria pai e mestre de Marco Buscape.\n\nAtraves de sua posicao no Mercado Modelo e suas conexoes na comunidade da capoeira, Chico Preto facilitou a introducao de seu filho na arte. Quando Roque tinha dez anos em 1948, Chico Preto providenciou para que ele treinasse com um amigo—um alfaiate que morava no Morro do Peru, perto do Largo do Tanque. Este alfaiate se tornou o primeiro professor formal de Roque.\n\nO jovem Roque, atraves das conexoes de seu pai no mercado, conviveu com muitos dos famosos capoeiristas da epoca: Gaje, Indio, Tatu Bola, Bom Cabrito, Boca de Fumaca, Traira, Canjiquinha e Cobrinha Verde. Roque mais tarde afirmaria que "aprendeu muito com Cobrinha Verde" e que sua linhagem descendia de Tio Alipio, passando por Besouro e continuando com Cobrinha Verde.\n\nChico Preto representa a geracao de capoeiristas que praticaram durante o periodo de transicao—quando a capoeira foi legalizada em 1937 apos decadas de proibicao, e a arte comecou a se mover das ruas para as academias. Seu papel em conectar seu filho a comunidade da capoeira ajudou a estabelecer uma das principais linhagens no Rio de Janeiro.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION:\n- Son Roque born 1938 (exact)\n- By 1948, Chico Preto was an established capoeirista with connections at Mercado Modelo\n- If 25-35 when Roque was born: birth ~1903-1913\n- Using 1910 with decade precision\n\nNO TITLE:\n- Described as "well-known capoeira" but not as mestre\n- No formal title documented\n\nSTYLE:\n- No specific style documented\n- His son Roque practiced Angola (line of Sao Bento)\n- Style left NULL due to lack of direct evidence\n\nFAMILY:\n- Father of Mestre Roque (b. 1938)\n- Brother of Ze Bedeu (capoeirista, father of Marco Buscape)\n\nCONNECTIONS:\n- Friend: unnamed tailor on Peru hill (Roque''s first teacher)\n- Known contemporaries through market: Gaje, Indio, Tatu Bola, Bom Cabrito, Boca de Fumaca, Traira, Canjiquinha, Cobrinha Verde\n\nDEATH:\n- No death date documented\n- Son Roque was still alive as of 2018',
  E'ESTIMATIVA DO ANO DE NASCIMENTO:\n- Filho Roque nascido em 1938 (exato)\n- Em 1948, Chico Preto era um capoeirista estabelecido com conexoes no Mercado Modelo\n- Se tinha 25-35 quando Roque nasceu: nascimento ~1903-1913\n- Usando 1910 com precisao de decada\n\nSEM TITULO:\n- Descrito como "capoeira conhecido" mas nao como mestre\n- Nenhum titulo formal documentado\n\nESTILO:\n- Nenhum estilo especifico documentado\n- Seu filho Roque praticava Angola (linha de Sao Bento)\n- Estilo deixado NULL por falta de evidencia direta\n\nFAMILIA:\n- Pai de Mestre Roque (n. 1938)\n- Irmao de Ze Bedeu (capoeirista, pai de Marco Buscape)\n\nCONEXOES:\n- Amigo: alfaiate nao identificado no Morro do Peru (primeiro professor de Roque)\n- Contemporaneos conhecidos atraves do mercado: Gaje, Indio, Tatu Bola, Bom Cabrito, Boca de Fumaca, Traira, Canjiquinha, Cobrinha Verde\n\nMORTE:\n- Nenhuma data de morte documentada\n- Filho Roque ainda estava vivo em 2018'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/paulo-siqueira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Paulo Siqueira
-- Generated: 2025-12-15
-- Primary Sources:
--   https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/
--   https://capoeuropa.org/historia-da-escola/
--   https://capoeirawiki.org/wiki/Paulo_Siqueira
-- ============================================================
-- DEPENDENCIES: Roque (exists), Adilson/Camisa Preta (pending)
-- ============================================================
--
-- IDENTITY:
-- - Full name: Paulo Siqueira
-- - Apelido: Paulo Siqueira (also known simply as "Siqueira" in theater circles)
-- - Born: May 6, 1955, Rio de Janeiro (Bonsucesso neighborhood)
-- - Title: Mestre (received from Mestre Adilson)
-- - Style: Angola
--
-- TRAINING LINEAGE:
-- - Began training ~1972 at Mestre Roque's academy on Morro do Pavão
-- - Primary teacher: Mestre Adilson "Camisa Preta" (Roque's senior student)
-- - Also trained under general guidance of Mestre Roque
-- - Received mestre title from Adilson (date unknown, before Adilson's death in 1990s)
--
-- CAREER IN GERMANY:
-- - Early 1980s: Invited to Germany by theater producer "Herr Ulm"
-- - Initially based in Hannover, teaching small group of 15 people
-- - 1985: Hired by Zeppelin theater owner in Hamburg, settled there
-- - 1985: Founded Escola de Capoeira Nzinga (Hamburg, expanded to Hannover and Kiel)
-- - 1987-2004: Organized Capoeira Sommer-Meeting in Hamburg
--   (7-day event, 300 participants, largest capoeira event outside Brazil at the time)
--
-- ADDITIONAL TRAINING:
-- - Classical dance scholarship from choreographer Mercedes Baptista
-- - Performance career: "Bahia Saravá" show, Intercontinental Hotel, etc.
--
-- CURRENT STATUS (as of research):
-- - Still alive, teaching in Hamburg, Hannover, and Kiel
-- - Writing first book about history of capoeira in Europe
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Paulo Siqueira',
  'Paulo Siqueira',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/', 'https://capoeirawiki.org/wiki/Paulo_Siqueira', 'https://capoeuropa.org/historia-da-escola/']::text[],
  'angola'::genealogy.style,
  E'Paulo Siqueira practices and teaches Capoeira Angola in the lineage of Mestre Roque, through his primary teacher Mestre Adilson "Camisa Preta." His style comes from the "line of São Bento" tradition brought from Bahia to Rio de Janeiro.',
  E'Paulo Siqueira pratica e ensina Capoeira Angola na linhagem de Mestre Roque, através de seu professor principal Mestre Adilson "Camisa Preta." Seu estilo vem da tradição da "linha de São Bento" trazida da Bahia para o Rio de Janeiro.',
  1955,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil (Bonsucesso)',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Paulo Siqueira was born on May 6, 1955, in Rio de Janeiro, growing up between the North Zone neighborhoods of Bonsucesso, Ramos, Olaria, and Penha, and the South Zone areas of Flamengo and Botafogo. His first encounter with capoeira came during carnival festivities when he observed practitioners warming up for a parade at a Portela samba school gathering in Candelária.\n\nAround 1972, encouraged by his friend Rubens—a fireman and capoeirista from the Cantagalo favela—Paulo began training at Mestre Roque''s academy on Morro do Pavão in Copacabana. At that time, Mestre Roque was already planning to hand over the academy to his most advanced student, Adilson "Camisa Preta." Paulo trained primarily under Adilson, with Roque providing overall guidance. Adilson became his sole mestre and would have "great influence in the life of Paulo Siqueira, as capoeirista and person."\n\nAlongside his capoeira training, Paulo pursued a performance career. He received a classical dance scholarship from the renowned choreographer Mercedes Baptista, who emphasized versatility for capoeiristas seeking professional performance work. He performed in theater productions and concert halls, including the "Bahia Saravá" show and events at the Intercontinental Hotel. In Rio''s performance circles, he became known simply as "Siqueira."\n\nAfter years of dedicated training, Adilson graduated Paulo Siqueira as a mestre—a recognition Paulo received from his teacher before Adilson''s death in the 1990s.\n\nIn the early 1980s, a German theater producer called "Herr Ulm" saw Paulo play capoeira and hired him for a tour in Germany. He was based in Hannover on a one-year contract, where he began teaching his first classes to a small group of fifteen people. In 1985, a woman who owned the Zeppelin theater in Hamburg hired him to teach and offered him a place to live. He settled in Hamburg and founded Escola de Capoeira Nzinga, later expanding to Hannover and Kiel.\n\nIn 1987, Mestre Paulo Siqueira launched the Capoeira Sommer-Meeting in Hamburg—a groundbreaking seven-day event combining workshops, lectures, and rodas. The event attracted 300 participants, with a closing performance at Hamburg''s "Fabrik" venue drawing up to 600 attendees. It was the largest capoeira event outside Brazil at the time and one of the first major capoeira gatherings in Europe. The Sommer-Meeting continued annually until 2004, setting standards for capoeira events outside Brazil and significantly elevating the quality and visibility of capoeira in Europe.\n\nMestre Paulo Siqueira was one of the first to bring capoeira to Europe and make it known on the continent. He continues to teach Capoeira Angola in Hamburg, Hannover, and Kiel, and is working on his first book about the history of capoeira in Europe.',
  E'Paulo Siqueira nasceu em 6 de maio de 1955 no Rio de Janeiro, crescendo entre os bairros da Zona Norte de Bonsucesso, Ramos, Olaria e Penha, e as áreas da Zona Sul de Flamengo e Botafogo. Seu primeiro encontro com a capoeira aconteceu durante as festividades de carnaval, quando observou praticantes se aquecendo para um desfile em uma reunião da escola de samba Portela na Candelária.\n\nPor volta de 1972, incentivado por seu amigo Rubens—um bombeiro e capoeirista da favela do Cantagalo—Paulo começou a treinar na academia de Mestre Roque no Morro do Pavão em Copacabana. Naquela época, Mestre Roque já planejava passar a academia para seu aluno mais avançado, Adilson "Camisa Preta." Paulo treinou principalmente sob Adilson, com Roque fornecendo orientação geral. Adilson se tornou seu único mestre e teria "grande influência na vida de Paulo Siqueira, como capoeirista e pessoa."\n\nParalelamente ao seu treinamento de capoeira, Paulo seguiu uma carreira de performance. Ele recebeu uma bolsa de dança clássica da renomada coreógrafa Mercedes Baptista, que enfatizava versatilidade para capoeiristas que buscavam trabalho profissional de performance. Ele se apresentou em produções teatrais e casas de shows, incluindo o espetáculo "Bahia Saravá" e eventos no Hotel Intercontinental. Nos círculos de performance do Rio, ele ficou conhecido simplesmente como "Siqueira."\n\nApós anos de treinamento dedicado, Adilson graduou Paulo Siqueira como mestre—um reconhecimento que Paulo recebeu de seu professor antes da morte de Adilson nos anos 1990.\n\nNo início dos anos 1980, um produtor de teatro alemão chamado "Herr Ulm" viu Paulo jogar capoeira e o contratou para uma turnê na Alemanha. Ele ficou baseado em Hannover com um contrato de um ano, onde começou a dar suas primeiras aulas para um pequeno grupo de quinze pessoas. Em 1985, uma mulher que era dona do teatro Zeppelin em Hamburgo o contratou para ensinar e ofereceu-lhe um lugar para morar. Ele se estabeleceu em Hamburgo e fundou a Escola de Capoeira Nzinga, depois expandindo para Hannover e Kiel.\n\nEm 1987, Mestre Paulo Siqueira lançou o Capoeira Sommer-Meeting em Hamburgo—um evento revolucionário de sete dias combinando oficinas, palestras e rodas. O evento atraiu 300 participantes, com uma apresentação de encerramento na "Fabrik" de Hamburgo reunindo até 600 pessoas. Foi o maior evento de capoeira fora do Brasil na época e um dos primeiros grandes encontros de capoeira na Europa. O Sommer-Meeting continuou anualmente até 2004, estabelecendo padrões para eventos de capoeira fora do Brasil e elevando significativamente a qualidade e visibilidade da capoeira na Europa.\n\nMestre Paulo Siqueira foi um dos primeiros a trazer a capoeira para a Europa e torná-la conhecida no continente. Ele continua ensinando Capoeira Angola em Hamburgo, Hannover e Kiel, e está trabalhando em seu primeiro livro sobre a história da capoeira na Europa.',
  E'Pioneer of capoeira in Germany and Europe\nFounded Escola de Capoeira Nzinga (Hamburg, 1985)\nOrganized Capoeira Sommer-Meeting (1987-2004) - largest capoeira event outside Brazil at its time\nOne of the first to bring capoeira to Europe\nSchools in Hamburg, Hannover, and Kiel\nReceived mestre title from Mestre Adilson "Camisa Preta"\nClassical dance training under Mercedes Baptista\nWriting book on history of capoeira in Europe',
  E'Pioneiro da capoeira na Alemanha e Europa\nFundou a Escola de Capoeira Nzinga (Hamburgo, 1985)\nOrganizou o Capoeira Sommer-Meeting (1987-2004) - maior evento de capoeira fora do Brasil em sua época\nUm dos primeiros a trazer a capoeira para a Europa\nEscolas em Hamburgo, Hannover e Kiel\nRecebeu título de mestre de Mestre Adilson "Camisa Preta"\nTreinamento de dança clássica com Mercedes Baptista\nEscrevendo livro sobre história da capoeira na Europa',
  E'BIRTH DATE: May 6, 1955 (exact) - confirmed by multiple sources including CapoeiraWiki\n\nTRAINING TIMELINE:\n- ~1972: Began training at Mestre Roque''s academy on Morro do Pavão\n- Primary teacher: Mestre Adilson "Camisa Preta" (not Roque directly)\n- Mestre title received from Adilson (before Adilson''s death in 1990s)\n\nGERMANY TIMELINE:\n- Early 1980s: Arrived in Germany (Hannover)\n- 1985: Settled in Hamburg, founded Nzinga\n- 1987: First Capoeira Sommer-Meeting\n- 2004: Final Sommer-Meeting\n\nTEACHER CLARIFICATION:\nWhile Paulo trained at "Mestre Roque''s academy," his actual primary teacher was Adilson "Camisa Preta," Roque''s senior student who took over the academy. Paulo was one of the students who trained under Adilson with Roque''s guidance.\n\nCURRENT STATUS:\nStill alive and teaching (as of 2025 research). Writing book on capoeira in Europe.',
  E'DATA DE NASCIMENTO: 6 de maio de 1955 (exato) - confirmado por múltiplas fontes incluindo CapoeiraWiki\n\nCRONOLOGIA DE TREINAMENTO:\n- ~1972: Começou a treinar na academia de Mestre Roque no Morro do Pavão\n- Professor principal: Mestre Adilson "Camisa Preta" (não Roque diretamente)\n- Título de mestre recebido de Adilson (antes da morte de Adilson nos anos 1990)\n\nCRONOLOGIA NA ALEMANHA:\n- Início dos anos 1980: Chegou na Alemanha (Hannover)\n- 1985: Estabeleceu-se em Hamburgo, fundou Nzinga\n- 1987: Primeiro Capoeira Sommer-Meeting\n- 2004: Último Sommer-Meeting\n\nESCLARECIMENTO SOBRE PROFESSOR:\nEmbora Paulo tenha treinado na "academia de Mestre Roque," seu professor principal real foi Adilson "Camisa Preta," o aluno sênior de Roque que assumiu a academia. Paulo foi um dos alunos que treinou sob Adilson com a orientação de Roque.\n\nSTATUS ATUAL:\nAinda vivo e ensinando (conforme pesquisa de 2025). Escrevendo livro sobre capoeira na Europa.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/roque.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Roque
-- Generated: 2025-12-15
-- Primary Source: https://capoeirahistory.com/mestre/master-roque-1938/
-- ============================================================
-- DEPENDENCIES: cobrinha-verde.sql, traira.sql, onca-preta.sql (teachers/associates)
-- ============================================================
--
-- BIRTH PLACE DISCREPANCY:
-- - capoeirahistory.com states "born in Salvador da Bahia"
-- - capoeuropa.org states "born in Cachoeira but raised in Nazaré neighborhood of Salvador"
-- Using Cachoeira as birthplace (more specific) with Salvador as where he was raised.
--
-- FAMILY LINEAGE:
-- Father: Liberato Francisco Xavier (apelido Chico Preto) - capoeirista, fishmonger at Modelo Market
-- Uncle: Zé Bedeu - capoeirista, father of Marco Buscapé
--
-- ARRIVAL IN RIO DISCREPANCY:
-- - capoeirahistory.com: 1956 (enlisted in Navy)
-- - capoeuropa.org: 1958 at age 18
-- Using 1956 as primary (more detailed source with Navy context)
--
-- FILHOS DE ANGOLA FOUNDING DATE DISCREPANCY:
-- - velhosmestres.com (English): June 27, 1960
-- - velhosmestres.com (Portuguese)/onca-preta.sql: July 21, 1960
-- Using July 21, 1960 to match existing onca-preta.sql entry
--
-- PRIMARY TEACHER:
-- An unnamed tailor who lived on Peru hill near Largo do Tanque -
-- friend of his father Chico Preto. Unable to identify this teacher further.
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Roque Mendes dos Santos',
  'Roque',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-roque-1938/', 'https://capoeirahistory.com/students-of-mestre-roque/']::text[],
  'angola'::genealogy.style,
  E'From an angoleiro tradition, Roque insists his capoeira and that of his masters is from the "line of São Bento," which he describes as faster than other Angola styles. Despite his Angola roots, he had contact with students of Mestre Bimba such as Vermelho 27 and was among the first teachers to introduce graduation belts in his academy.',
  E'De tradição angoleira, Roque insiste que sua capoeira e a de seus mestres é da "linha de São Bento," que ele descreve como mais rápida que outros estilos de Angola. Apesar de suas raízes na Angola, teve contato com alunos de Mestre Bimba como Vermelho 27 e foi um dos primeiros professores a introduzir graduações em sua academia.',
  1938,
  'exact'::genealogy.date_precision,
  'Cachoeira, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Roque Mendes dos Santos was born in 1938 in Cachoeira, in the Recôncavo Baiano, and raised in the Nazaré neighborhood of Salvador. His father was Liberato Francisco Xavier, known as Chico Preto, a capoeirista who operated a fish stand at the famous Modelo Market. His uncle was Zé Bedeu, another capoeirista who fathered and trained Marco Buscapé.\n\nRoque began learning capoeira as a child in 1948, at age ten. His first teacher was a tailor who lived on Peru hill near Largo do Tanque—a friend of his father. Through his father''s connections at the Modelo Market, young Roque socialized with many of the famous capoeiristas of the time: Gajé, Índio, Tatu Bola, Bom Cabrito, Boca de Fumaça, Traíra, and Canjiquinha. He claims to have learned a great deal from Cobrinha Verde and asserts that his lineage descends from Tio Alípio through Besouro, continuing with Cobrinha Verde.\n\nHe also learned to play berimbau from Mucungê, another Bahian migrant in Rio who was renowned for his skills on the instrument.\n\nRoque enlisted in the Navy and arrived in Rio de Janeiro in 1956. After leaving military service, he settled in the city, living in various poor neighborhoods, mainly in Pavão/Pavãozinho in the Zona Sul between Ipanema and Copacabana. He began teaching capoeira initially in Catumbi, then moved to the Neighbourhood Association of Pavão/Pavãozinho.\n\nOn July 21, 1960, together with fellow Bahian angoleiros Mucungê, Dois de Ouro, Baleado, Onça Preta, and Imagem do Cão, Roque co-founded Grupo Filhos de Angola—becoming a pioneer in the teaching of capoeira in the favelas of Rio''s Zona Sul. His academy at Morro do Pavãozinho served mainly poor residents of the Pavão and Cantagalo hills, though some surfers also trained there.\n\nHis group took part in tournaments and competitions that helped disseminate capoeira, including the Berimbau de Ouro (1967). Filhos de Angola performed in folkloric exhibitions such as "Uma Noite na Bahia" (A Night in Bahia), inspired by the festas for patron saints in Salvador. Roque also joined the folkloric group Capoeiras do Bonfim of Mário Buscapé and played berimbau in the Rio staging of "O Pagador de Promessas" by Dias Gomes.\n\nAfter teaching for twelve years in Pavão/Pavãozinho, Roque gave classes at Praia do Pinto, Praça Mauá, Jacarepaguá, the Petrobras Refinery in Caxias, and São João de Meriti. His final academy was located in Vilar do Teles.\n\nRoque formed numerous mestres who continue his lineage: Adilson (Camisa Preta), Sandrinha, Poeira, Paulo Siqueira, Derli, Lapinha, Cosme, and many others. Mestra Sandrinha, who began training with him as a ten-year-old girl in Pavãozinho in the 1970s, is recognized as possibly the first female capoeira mestra in Brazil. Mestre Paulo Siqueira went on to establish the Escola de Capoeira Nzinga in Germany in 1985, becoming a pioneer of capoeira in Europe.\n\nRoque is considered one of the four founding lineages of contemporary capoeira in Rio de Janeiro, alongside Artur Emídio, Paraná, and Mário Buscapé. As M. Levi stated, these four "started to work in closed spaces of academies, introduced uniforms, organisation, etc. From these four the majority of capoeira masters here in Rio de Janeiro derived."\n\nAs of 2018, Roque was still alive, giving interviews and testimonies for cultural preservation projects like the MIS RJ series "Memória da Capoeira."',
  E'Roque Mendes dos Santos nasceu em 1938 em Cachoeira, no Recôncavo Baiano, e foi criado no bairro de Nazaré em Salvador. Seu pai era Liberato Francisco Xavier, conhecido como Chico Preto, um capoeirista que tinha uma banca de peixe no famoso Mercado Modelo. Seu tio era Zé Bedeu, outro capoeirista que foi pai e mestre de Marco Buscapé.\n\nRoque começou a aprender capoeira ainda criança em 1948, aos dez anos. Seu primeiro professor foi um alfaiate que morava no Morro do Peru, perto do Largo do Tanque—amigo de seu pai. Através das conexões de seu pai no Mercado Modelo, o jovem Roque conviveu com muitos dos famosos capoeiristas da época: Gajé, Índio, Tatu Bola, Bom Cabrito, Boca de Fumaça, Traíra e Canjiquinha. Ele afirma ter aprendido muito com Cobrinha Verde e sustenta que sua linhagem descende de Tio Alípio, passando por Besouro e continuando com Cobrinha Verde.\n\nTambém aprendeu a tocar berimbau com Mucungê, outro baiano migrante no Rio que era renomado por suas habilidades no instrumento.\n\nRoque alistou-se na Marinha e chegou ao Rio de Janeiro em 1956. Após deixar o serviço militar, estabeleceu-se na cidade, morando em vários bairros pobres, principalmente no Pavão/Pavãozinho na Zona Sul, entre Ipanema e Copacabana. Começou a ensinar capoeira inicialmente no Catumbi, depois mudou-se para a Associação de Moradores do Pavão/Pavãozinho.\n\nEm 21 de julho de 1960, junto com outros angoleiros baianos Mucungê, Dois de Ouro, Baleado, Onça Preta e Imagem do Cão, Roque co-fundou o Grupo Filhos de Angola—tornando-se um pioneiro no ensino de capoeira nas favelas da Zona Sul do Rio. Sua academia no Morro do Pavãozinho atendia principalmente os moradores pobres dos morros do Pavão e Cantagalo, embora alguns surfistas também treinassem lá.\n\nSeu grupo participou de torneios e competições que ajudaram a disseminar a capoeira, incluindo o Berimbau de Ouro (1967). Filhos de Angola realizou apresentações folclóricas como "Uma Noite na Bahia," inspirada nas festas de santos padroeiros em Salvador. Roque também integrou o grupo folclórico Capoeiras do Bonfim de Mário Buscapé e tocou berimbau na montagem carioca de "O Pagador de Promessas" de Dias Gomes.\n\nApós ensinar por doze anos no Pavão/Pavãozinho, Roque deu aulas na Praia do Pinto, Praça Mauá, Jacarepaguá, na Refinaria da Petrobras em Caxias e em São João de Meriti. Sua última academia localizava-se em Vilar do Teles.\n\nRoque formou numerosos mestres que continuam sua linhagem: Adilson (Camisa Preta), Sandrinha, Poeira, Paulo Siqueira, Derli, Lapinha, Cosme, e muitos outros. Mestra Sandrinha, que começou a treinar com ele ainda menina de dez anos no Pavãozinho nos anos 1970, é reconhecida como possivelmente a primeira mestra de capoeira do Brasil. Mestre Paulo Siqueira foi fundar a Escola de Capoeira Nzinga na Alemanha em 1985, tornando-se um pioneiro da capoeira na Europa.\n\nRoque é considerado uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro, ao lado de Artur Emídio, Paraná e Mário Buscapé. Como M. Levi afirmou, esses quatro "começaram a trabalhar em espaços fechados de academias, introduziram uniformes, organização, etc. Desses quatro derivou a maioria dos mestres de capoeira aqui no Rio de Janeiro."\n\nAté 2018, Roque ainda estava vivo, dando entrevistas e depoimentos para projetos de preservação cultural como a série "Memória da Capoeira" do MIS RJ.',
  E'Co-founder of Grupo Filhos de Angola (Rio de Janeiro, July 21, 1960)\nPioneer of capoeira teaching in Rio''s Zona Sul favelas\nOne of four founding lineages of contemporary capoeira in Rio de Janeiro\nPlayed berimbau in stage production of "O Pagador de Promessas" (Rio)\nParticipated in Berimbau de Ouro competition (1967)\nAmong the first teachers to introduce graduation belts\nTrained Mestra Sandrinha - possibly Brazil''s first female capoeira mestra\nTrained Mestre Paulo Siqueira - pioneer of capoeira in Germany/Europe',
  E'Co-fundador do Grupo Filhos de Angola (Rio de Janeiro, 21 de julho de 1960)\nPioneiro do ensino de capoeira nas favelas da Zona Sul do Rio\nUma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro\nTocou berimbau na montagem carioca de "O Pagador de Promessas"\nParticipou do concurso Berimbau de Ouro (1967)\nUm dos primeiros professores a introduzir graduações\nFormou Mestra Sandrinha - possivelmente a primeira mestra de capoeira do Brasil\nFormou Mestre Paulo Siqueira - pioneiro da capoeira na Alemanha/Europa',
  E'BIRTH YEAR: 1938, exact - confirmed by capoeirahistory.com\n\nBIRTH PLACE DISCREPANCY:\n- capoeirahistory.com: "born in Salvador da Bahia"\n- capoeuropa.org: "born in Cachoeira but raised in Nazaré neighborhood of Salvador"\nUsing Cachoeira (more specific), noting he was raised in Salvador.\n\nARRIVAL IN RIO DISCREPANCY:\n- capoeirahistory.com: 1956 (after Navy enlistment)\n- capoeuropa.org: 1958 at age 18\nUsing 1956 (includes Navy context, more detailed).\n\nFILHOS DE ANGOLA FOUNDING DATE:\n- velhosmestres.com (EN): June 27, 1960\n- velhosmestres.com (PT)/other sources: July 21, 1960\nUsing July 21, 1960 to match onca-preta.sql\n\nFAMILY:\n- Father: Liberato Francisco Xavier (Chico Preto) - capoeirista, fishmonger at Modelo Market\n- Uncle: Zé Bedeu - capoeirista, father of Marco Buscapé\n\nPRIMARY TEACHER:\nAn unnamed tailor on Peru hill near Largo do Tanque - friend of his father. This person''s identity remains unknown.\n\nTEACHING LOCATIONS:\n- Catumbi (initial)\n- Pavão/Pavãozinho (12 years)\n- Praia do Pinto\n- Praça Mauá\n- Jacarepaguá\n- Petrobras Refinery, Caxias\n- São João de Meriti\n- Vilar do Teles (final)\n\nSTILL ALIVE (as of 2018):\n- Interviews in 2016 and 2018\n- Birthday celebration at IPCN in 2015\n- Testimony for MIS RJ "Memória da Capoeira" series\n\nCONTEMPORARIES HE SOCIALIZED WITH IN BAHIA:\nGajé, Índio, Tatu Bola, Bom Cabrito, Boca de Fumaça, Traíra, Canjiquinha\n\nQUOTE ON CAPOEIRA ORIGINS:\n"Capoeira não veio de Angola, veio sim da Bahia e de Jacarepaguá"\n(Capoeira did not come from Angola, but rather from Bahia and Jacarepaguá)',
  E'ANO DE NASCIMENTO: 1938, exato - confirmado por capoeirahistory.com\n\nDISCREPÂNCIA DO LOCAL DE NASCIMENTO:\n- capoeirahistory.com: "nascido em Salvador da Bahia"\n- capoeuropa.org: "nascido em Cachoeira mas criado no bairro de Nazaré em Salvador"\nUsando Cachoeira (mais específico), notando que foi criado em Salvador.\n\nDISCREPÂNCIA DA CHEGADA AO RIO:\n- capoeirahistory.com: 1956 (após alistamento na Marinha)\n- capoeuropa.org: 1958 aos 18 anos\nUsando 1956 (inclui contexto da Marinha, mais detalhado).\n\nDATA DE FUNDAÇÃO DO FILHOS DE ANGOLA:\n- velhosmestres.com (EN): 27 de junho de 1960\n- velhosmestres.com (PT)/outras fontes: 21 de julho de 1960\nUsando 21 de julho de 1960 para coincidir com onca-preta.sql\n\nFAMÍLIA:\n- Pai: Liberato Francisco Xavier (Chico Preto) - capoeirista, peixeiro no Mercado Modelo\n- Tio: Zé Bedeu - capoeirista, pai de Marco Buscapé\n\nPROFESSOR PRINCIPAL:\nUm alfaiate não identificado no Morro do Peru, perto do Largo do Tanque - amigo de seu pai. A identidade dessa pessoa permanece desconhecida.\n\nLOCAIS DE ENSINO:\n- Catumbi (inicial)\n- Pavão/Pavãozinho (12 anos)\n- Praia do Pinto\n- Praça Mauá\n- Jacarepaguá\n- Refinaria da Petrobras, Caxias\n- São João de Meriti\n- Vilar do Teles (final)\n\nAINDA VIVO (até 2018):\n- Entrevistas em 2016 e 2018\n- Celebração de aniversário no IPCN em 2015\n- Depoimento para a série "Memória da Capoeira" do MIS RJ\n\nCONTEMPORÂNEOS COM QUEM CONVIVEU NA BAHIA:\nGajé, Índio, Tatu Bola, Bom Cabrito, Boca de Fumaça, Traíra, Canjiquinha\n\nCITAÇÃO SOBRE ORIGENS DA CAPOEIRA:\n"Capoeira não veio de Angola, veio sim da Bahia e de Jacarepaguá"'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/traira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Traíra
-- Generated: 2025-12-15
-- Primary Source: https://velhosmestres.com/en/featured-37
-- ============================================================
-- DEPENDENCIES: waldemar.sql (teacher)
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1925 with 'year' precision):
-- Multiple sources give "around 1925" or "192?" for Traíra's birth.
-- Jorge Amado described him in 1945 as a fully developed master ("Um caboclo
-- seco e de pouco falar, feito de músculos"), suggesting he was at least 20
-- years old. He was first seen in Juvencio's rodas in São Felix "around 1938"
-- per Mestre Ananias, which would make him ~13 years old - plausible for
-- early capoeira exposure. Using 1925 as consensus estimate.
--
-- DEATH YEAR ESTIMATION (1975 with 'decade' precision):
-- Sources vary between 1970-1975. Velhosmestres.com gives "1970/71?".
-- Barba Branca began learning with him "around 1970" and says Traíra
-- died "shortly after." Other sources say 1975. Using 1975 with decade
-- precision to encompass the range.
--
-- NAME DISCREPANCY: Most sources give "João Ramos do Nascimento" but
-- cachoeirabahia.jethsys.com gives "Luiz Ramos do Nascimento" and
-- decapoeira.org gives "José Ramos Do Nascimento". Using "João" as
-- the majority spelling from primary sources (velhosmestres.com).
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'João Ramos do Nascimento',
  'Traíra',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-37', 'https://capoeirawiki.org/wiki/Mestre_Tra%C3%ADra', 'https://capoeira.online/history/mestres/mestre-traira/']::text[],
  'angola'::genealogy.style,
  E'Known for an exceptionally elegant game style. Jorge Amado wrote in 1945 that only Mestre Pastinha could match him "in the beauty of movements, in agility, in the precision of strikes." Renowned specialist in rasteiras (leg sweeps) and cabeçadas (headbutts). His rodas at Rua do Céu in Liberdade were described as intense and sometimes violent, with frequent head strikes and leg sweeps. According to Mestre Barba Branca: "The roda was violent, with many headbutts to the face, leg sweeps... Many people left injured."',
  E'Conhecido por um estilo de jogo excepcionalmente elegante. Jorge Amado escreveu em 1945 que somente Mestre Pastinha poderia competir com ele "na beleza dos movimentos, na agilidade, na rigidez dos golpes." Renomado especialista em rasteiras e cabeçadas. Suas rodas na Rua do Céu na Liberdade eram descritas como intensas e às vezes violentas, com golpes frequentes de cabeça e rasteiras. Segundo Mestre Barba Branca: "A roda era violenta, com muitas cabeçadas no rosto, rasteiras... Muita gente saía machucada."',
  1925,
  'year'::genealogy.date_precision,
  'Cachoeira, Bahia, Brazil',
  1975,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'João Ramos do Nascimento was born around 1925 in Cachoeira, in the Recôncavo Baiano. Before becoming one of the most elegant angoleiros of his generation, he carried a darker history: he had served eleven years and six months in prison for killing a man over a woman.\n\nHis first exposure to capoeira came in the rodas of Mestre Juvencio in nearby São Felix, where Mestre Ananias encountered him around 1938. The dock worker Juvencio held informal gatherings on the docks during festivals at Igreja de São Deus Menino and Senhor São Félix. There, alongside future luminaries like Ananias, young Traíra began his journey.\n\nBut it was after his release from prison, in 1947, that Traíra sought out Mestre Waldemar in Salvador during a roda held for Otávio Mangabeira''s gubernatorial campaign. According to Waldemar: "Who made Traíra ready was me. He spent eleven years and six months in jail, he was an assassin. He killed a man because of a woman. When he got out he came to see me... He befriended me and said I should make him ready, so I did."\n\nWaldemar transformed the ex-convict into a master. Traíra also learned from Severo do Pelourinho and became a regular presence at the legendary Barracão de Waldemar in Liberdade. He became so trusted that Waldemar delegated the management of the roda to him: "The deceased Traíra was who took care of the roda. I went there, gave my order and went to have a beer."\n\nBy 1945, even before completing his training with Waldemar, Jorge Amado had already noticed him. In "Bahia de Todos os Santos," Amado immortalized Traíra: "Um caboclo seco e de pouco falar, feito de músculos, um grande mestre de capoeira" (A dry caboclo of few words, made of muscles, a great capoeira master). Amado declared that "only Pastinha can compete with him in the beauty of movements, in agility, in the precision of strikes."\n\nTraíra also maintained his own roda in the backyard of his house on Rua do Céu in the Liberdade neighborhood. His rodas were notorious for their intensity - Mestre Barba Branca, who began learning from him around 1970-1971, recalled them as "violent," with constant headbutts to the face and rasteiras. The roda took place on packed dirt, and chickens would cross through the middle while people played. Traíra taught only by invitation - a select group of adults and children.\n\nIn Waldeloir Rego''s 1968 ethnographic study "Capoeira Angola: ensaio sócio-etnográfico," Traíra''s school in Liberdade was mentioned alongside the major capoeira institutions of Salvador.\n\nIn 1954, Traíra appeared in the pioneering film "Vadiação" by Alexandre Robatto Filho, alongside Mestres Bimba, Waldemar, Caiçara, Curió, Nagé, and Crispim. The film captured him playing pandeiro and demonstrating movements for the camera. In 1960, he was filmed again in "Bahia, Capoeira na Praia" at Itapoã. Photographers Alice Brill (1953), Marcel Gautherot (mid-1950s), and Pierre Verger (c. 1955) all documented him at Waldemar''s barracão.\n\nThe historic LP "Capoeira" (1962), released by Editora Xauã, featured Traíra alongside Mestres Cobrinha Verde and Gato Preto. The audio was recorded at Mestre Waldemar''s hut, while photographs were taken at the Ramp of the Model Market. This record is considered one of the earliest musical documents of capoeira and remains a masterpiece.\n\nTraíra died in Salvador around 1975, victim of liver cirrhosis. Though one of the least written about mestres—"we only hear about him in songs," as one researcher noted—his influence persisted through his student Mestre Barba Branca, who went on to found Grupo de Capoeira Angola Cabula (GCAC) in 1984. His lineage thus continues: Juvencio and Waldemar taught Traíra, who taught Barba Branca, who trained under João Pequeno for 15 years before becoming mestre in 1991.',
  E'João Ramos do Nascimento nasceu por volta de 1925 em Cachoeira, no Recôncavo Baiano. Antes de se tornar um dos angoleiros mais elegantes de sua geração, carregava uma história mais sombria: cumprira onze anos e seis meses de prisão por matar um homem por causa de uma mulher.\n\nSeu primeiro contato com a capoeira foi nas rodas de Mestre Juvencio em São Felix, onde Mestre Ananias o encontrou por volta de 1938. O estivador Juvencio realizava encontros informais nas docas durante as festas da Igreja de São Deus Menino e Senhor São Félix. Ali, ao lado de futuros luminares como Ananias, o jovem Traíra começou sua jornada.\n\nMas foi após sua saída da prisão, em 1947, que Traíra procurou Mestre Waldemar em Salvador durante uma roda realizada para a campanha de Otávio Mangabeira ao governo. Segundo Waldemar: "Quem fez Traíra foi eu. Ele passou onze anos e seis meses preso, era assassino. Matou um homem por causa de mulher. Quando saiu veio me ver... Fez amizade comigo e disse que eu o fizesse, então eu o fiz."\n\nWaldemar transformou o ex-presidiário em mestre. Traíra também aprendeu com Severo do Pelourinho e tornou-se presença constante no lendário Barracão de Waldemar na Liberdade. Tornou-se tão confiável que Waldemar delegava a ele a gestão da roda: "O finado Traíra é que tomava conta da roda. Eu chegava lá, dava minha ordem e ia tomar minha cerveja."\n\nPor volta de 1945, mesmo antes de completar seu treinamento com Waldemar, Jorge Amado já o havia notado. Em "Bahia de Todos os Santos," Amado imortalizou Traíra: "Um caboclo seco e de pouco falar, feito de músculos, um grande mestre de capoeira." Amado declarou que "só mesmo Pastinha pode competir com ele na beleza dos movimentos, na agilidade, na rigidez dos golpes."\n\nTraíra também mantinha sua própria roda no quintal de sua casa na Rua do Céu, no bairro da Liberdade. Suas rodas eram notórias pela intensidade - Mestre Barba Branca, que começou a aprender com ele por volta de 1970-1971, lembrava-as como "violentas," com constantes cabeçadas no rosto e rasteiras. A roda acontecia em terra batida, e galinhas cruzavam o meio enquanto as pessoas jogavam. Traíra ensinava apenas por convite - um grupo seleto de adultos e crianças.\n\nNo estudo etnográfico de Waldeloir Rego de 1968, "Capoeira Angola: ensaio sócio-etnográfico," a escola de Traíra na Liberdade foi mencionada ao lado das principais instituições de capoeira de Salvador.\n\nEm 1954, Traíra apareceu no pioneiro filme "Vadiação" de Alexandre Robatto Filho, ao lado de Mestres Bimba, Waldemar, Caiçara, Curió, Nagé e Crispim. O filme o capturou tocando pandeiro e demonstrando movimentos para a câmera. Em 1960, foi filmado novamente em "Bahia, Capoeira na Praia" em Itapoã. Os fotógrafos Alice Brill (1953), Marcel Gautherot (meados de 1950) e Pierre Verger (c. 1955) documentaram-no no barracão de Waldemar.\n\nO histórico LP "Capoeira" (1962), lançado pela Editora Xauã, apresentou Traíra ao lado de Mestres Cobrinha Verde e Gato Preto. O áudio foi gravado na cabana de Mestre Waldemar, enquanto as fotografias foram tiradas na Rampa do Mercado Modelo. Este disco é considerado um dos primeiros documentos musicais da capoeira e permanece uma obra-prima.\n\nTraíra morreu em Salvador por volta de 1975, provavelmente de cirrose hepática. Embora seja um dos mestres menos escritos—"só ouvimos falar dele em cantigas," como notou um pesquisador—sua influência persistiu através de seu aluno Mestre Barba Branca, que fundou o Grupo de Capoeira Angola Cabula (GCAC) em 1984. Sua linhagem assim continua: Juvencio e Waldemar ensinaram Traíra, que ensinou Barba Branca, que treinou com João Pequeno por 15 anos antes de se tornar mestre em 1991.',
  E'Participated in pioneering film "Vadiação" (1954)\nRecorded LP "Capoeira da Bahia" with Cobrinha Verde and Gato Preto (1962)\nImmortalized by Jorge Amado in "Bahia de Todos os Santos" (1945)\nPhotographed by Pierre Verger, Marcel Gautherot, and Alice Brill (1950s)\nMaintained influential roda at Rua do Céu, Liberdade, Salvador\nManaged Mestre Waldemar''s roda at the Barracão',
  E'Participou do pioneiro filme "Vadiação" (1954)\nGravou LP "Capoeira da Bahia" com Cobrinha Verde e Gato Preto (1962)\nImortalizado por Jorge Amado em "Bahia de Todos os Santos" (1945)\nFotografado por Pierre Verger, Marcel Gautherot e Alice Brill (anos 1950)\nManteve roda influente na Rua do Céu, Liberdade, Salvador\nAdministrava a roda de Mestre Waldemar no Barracão',
  E'BIRTH YEAR ESTIMATION (1925, year precision):\nMultiple sources give "around 1925" or "192?" for Traíra''s birth. Jorge Amado described him in 1945 as a fully developed master, suggesting he was at least 20 years old. First seen in Juvencio''s rodas in São Felix "around 1938" (Mestre Ananias), which would make him ~13. Using 1925 as consensus.\n\nDEATH YEAR ESTIMATION (1975, decade precision):\nSources vary: velhosmestres.com gives "1970/71?", other sources give 1975. Barba Branca began learning with him "around 1970" and says Traíra died "shortly after." Using 1975 with decade precision to encompass the range (1970-1975).\n\nNAME DISCREPANCY:\n- "João Ramos do Nascimento" - velhosmestres.com, capoeirawiki.org, angoleiro.wordpress.com (MAJORITY)\n- "Luiz Ramos do Nascimento" - cachoeirabahia.jethsys.com\n- "José Ramos Do Nascimento" - decapoeira.org\nUsing "João" as the majority spelling from primary sources.\n\nPRISON BACKGROUND (documented in Waldemar''s testimony):\nServed 11 years and 6 months for murdering a man "because of a woman" (crime of passion). Released before 1947 when he sought Waldemar during Otávio Mangabeira''s campaign.\n\nTEACHERS:\n- Mestre Juvencio (early exposure, ~1938, São Felix rodas during festivals at Igreja de São Deus Menino)\n- Mestre Waldemar (primary teacher from 1947, "made him ready")\n- Severo do Pelourinho (mentioned as additional teacher)\n\nSTUDENTS:\n- Mestre Barba Branca (Gilberto Reis Ferreira dos Santos Filho, began ~1970/71)\n\nMEDIA APPEARANCES:\n- 1945: Described by Jorge Amado in "Bahia de Todos os Santos"\n- 1953: Photographed by Alice Brill at Waldemar''s barracão\n- 1954: Film "Vadiação" by Alexandre Robatto Filho\n- 1955?: Pierre Verger photographs\n- 1956: O Estado de São Paulo (November 2) - two photographs\n- 1957: Interview by Aloysio de Alencar Pinto\n- 1960: Film "Bahia, Capoeira na Praia" at Itapoã\n- 1962: LP "Capoeira" with Cobrinha Verde, Gato Preto (recorded at Waldemar''s hut)\n- 1968: Mentioned in Waldeloir Rego''s ethnographic study\n\nRODA LOCATION: Rua do Céu, Liberdade neighborhood, Salvador',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1925, precisão de ano):\nMúltiplas fontes dão "por volta de 1925" ou "192?" para o nascimento de Traíra. Jorge Amado o descreveu em 1945 como um mestre plenamente desenvolvido, sugerindo que tinha pelo menos 20 anos. Visto pela primeira vez nas rodas de Juvencio em São Felix "por volta de 1938" (Mestre Ananias), o que o faria ter ~13 anos. Usando 1925 como consenso.\n\nESTIMATIVA DO ANO DE MORTE (1975, precisão de década):\nFontes variam: velhosmestres.com dá "1970/71?", outras fontes dão 1975. Barba Branca começou a aprender com ele "por volta de 1970" e diz que Traíra morreu "pouco depois." Usando 1975 com precisão de década para abranger o intervalo (1970-1975).\n\nDISCREPÂNCIA DE NOME:\n- "João Ramos do Nascimento" - velhosmestres.com, capoeirawiki.org, angoleiro.wordpress.com (MAIORIA)\n- "Luiz Ramos do Nascimento" - cachoeirabahia.jethsys.com\n- "José Ramos Do Nascimento" - decapoeira.org\nUsando "João" como grafia majoritária das fontes primárias.\n\nHISTÓRICO PRISIONAL (documentado em testemunho de Waldemar):\nCumpriu 11 anos e 6 meses por matar um homem "por causa de mulher" (crime passional). Liberado antes de 1947, quando procurou Waldemar durante a campanha de Otávio Mangabeira.\n\nMESTRES:\n- Mestre Juvencio (exposição inicial, ~1938, rodas de São Felix durante festas da Igreja de São Deus Menino)\n- Mestre Waldemar (mestre principal desde 1947, "o fez pronto")\n- Severo do Pelourinho (mencionado como professor adicional)\n\nALUNOS:\n- Mestre Barba Branca (Gilberto Reis Ferreira dos Santos Filho, começou ~1970/71)\n\nAPARIÇÕES NA MÍDIA:\n- 1945: Descrito por Jorge Amado em "Bahia de Todos os Santos"\n- 1953: Fotografado por Alice Brill no barracão de Waldemar\n- 1954: Filme "Vadiação" de Alexandre Robatto Filho\n- 1955?: Fotografias de Pierre Verger\n- 1956: O Estado de São Paulo (2 de novembro) - duas fotografias\n- 1957: Entrevista por Aloysio de Alencar Pinto\n- 1960: Filme "Bahia, Capoeira na Praia" em Itapoã\n- 1962: LP "Capoeira" com Cobrinha Verde, Gato Preto (gravado na cabana de Waldemar)\n- 1968: Mencionado no estudo etnográfico de Waldeloir Rego\n\nLOCAL DA RODA: Rua do Céu, bairro da Liberdade, Salvador'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/persons/ze-bedeu.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zé Bedeu
-- Generated: 2025-12-15
-- Primary Source: https://capoeuropa.org/historia-da-escola/
-- ============================================================
-- DEPENDENCIES: None (foundational figure alongside brother Chico Preto)
-- ============================================================
--
-- LIMITED DOCUMENTATION:
-- Zé Bedeu is only documented through the biography of his nephew
-- Mestre Roque at capoeuropa.org (Escola de Capoeira Angola Nzinga).
-- No independent biographical sources have been found.
--
-- IDENTITY:
-- - Apelido: Zé Bedeu
-- - Full name: Unknown
-- - Status: Capoeirista
-- - Location: Salvador, Bahia (Nazaré neighborhood)
--
-- FAMILY:
-- - Brother of Liberato Francisco Xavier (Chico Preto)
-- - Father and teacher of Marco Buscapé
-- - Uncle of Mestre Roque (Roque Mendes dos Santos, b. 1938)
--
-- BIRTH YEAR ESTIMATION:
-- - Nephew Roque born 1938 (exact)
-- - Zé Bedeu is the uncle of Roque (brother of Chico Preto)
-- - Chico Preto estimated birth ~1910 (decade precision)
-- - If Zé Bedeu was similar age to his brother (2-10 years difference),
--   he would be born ~1900-1920
-- - Using 1910 with decade precision (same as brother)
--
-- IMPORTANT DISTINCTION:
-- Marco Buscapé (son of Zé Bedeu) is a DIFFERENT person from
-- Mário Buscapé (son of José Bidel dos Santos), the famous mestre
-- from São Francisco do Conde who founded Capoeiras do Bonfim in Rio.
-- These are two separate lineages.
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Zé Bedeu',
  NULL,
  NULL,
  ARRAY[]::text[],
  NULL,
  NULL,
  NULL,
  1910,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Zé Bedeu was a capoeirista from Salvador, Bahia, active in the early-to-mid 20th century. He was the brother of Liberato Francisco Xavier (known as Chico Preto), a capoeirista who operated a fish stand at the famous Mercado Modelo in Salvador.\n\nZé Bedeu lived in or near the Nazaré neighborhood of Salvador, where his brother Chico Preto raised his family. Both brothers were capoeiristas during a pivotal era—the period surrounding the legalization of capoeira in 1937, when the art transitioned from illegal street practice to recognized cultural expression.\n\nZé Bedeu was the father and primary teacher of Marco Buscapé, passing on the art of capoeira to his son. Through this lineage, Zé Bedeu helped establish a family tradition of capoeira practice that connected to the broader network of Bahian practitioners.\n\nHis nephew was Mestre Roque (Roque Mendes dos Santos, born 1938 in Cachoeira), who would become one of four founding lineages of contemporary capoeira in Rio de Janeiro. Mestre Roque, raised in the Nazaré neighborhood of Salvador, learned capoeira through his father Chico Preto''s connections but also benefited from the broader family environment of capoeira practice that included his uncle Zé Bedeu.\n\nIt is important to note that Marco Buscapé (son of Zé Bedeu) is a distinct person from Mário Buscapé (1934-2021), the famous mestre from São Francisco do Conde who founded the Capoeiras do Bonfim group in Rio de Janeiro. Mário Buscapé''s father was José Bidel dos Santos (Mestre Bidel), not Zé Bedeu. These represent two separate family lineages in capoeira history.',
  E'Zé Bedeu foi um capoeirista de Salvador, Bahia, ativo no início e meados do século XX. Era irmão de Liberato Francisco Xavier (conhecido como Chico Preto), um capoeirista que tinha uma banca de peixe no famoso Mercado Modelo em Salvador.\n\nZé Bedeu morava no ou próximo ao bairro de Nazaré em Salvador, onde seu irmão Chico Preto criou sua família. Ambos os irmãos eram capoeiristas durante uma era crucial—o período em torno da legalização da capoeira em 1937, quando a arte passou de prática de rua ilegal para expressão cultural reconhecida.\n\nZé Bedeu foi pai e principal mestre de Marco Buscapé, transmitindo a arte da capoeira para seu filho. Através dessa linhagem, Zé Bedeu ajudou a estabelecer uma tradição familiar de prática da capoeira que se conectava à rede mais ampla de praticantes baianos.\n\nSeu sobrinho foi Mestre Roque (Roque Mendes dos Santos, nascido em 1938 em Cachoeira), que se tornaria uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro. Mestre Roque, criado no bairro de Nazaré em Salvador, aprendeu capoeira através das conexões de seu pai Chico Preto, mas também se beneficiou do ambiente familiar mais amplo de prática da capoeira que incluía seu tio Zé Bedeu.\n\nÉ importante notar que Marco Buscapé (filho de Zé Bedeu) é uma pessoa distinta de Mário Buscapé (1934-2021), o famoso mestre de São Francisco do Conde que fundou o grupo Capoeiras do Bonfim no Rio de Janeiro. O pai de Mário Buscapé era José Bidel dos Santos (Mestre Bidel), não Zé Bedeu. Estas representam duas linhagens familiares separadas na história da capoeira.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION:\n- Brother Chico Preto estimated birth ~1910 (decade precision)\n- Assuming similar age (brothers), using 1910 with decade precision\n- Nephew Roque born 1938, so Zé Bedeu was likely adult by then\n\nNO TITLE:\n- Described as "pai e mestre de Marco Buscapé" but the word "mestre" here\n  likely means "teacher" in the familial sense, not a formal capoeira title\n- No formal capoeira title documented\n- Title left NULL\n\nSTYLE:\n- No specific style documented\n- His nephew Roque practiced Angola (line of São Bento)\n- Style left NULL due to lack of direct evidence\n\nFAMILY:\n- Brother of Chico Preto (Liberato Francisco Xavier)\n- Father and teacher of Marco Buscapé\n- Uncle of Mestre Roque (b. 1938)\n\nIMPORTANT DISTINCTION:\n- Marco Buscapé (son of Zé Bedeu) ≠ Mário Buscapé (son of José Bidel dos Santos)\n- These are two separate lineages from different families\n- Mário Buscapé was from São Francisco do Conde; Zé Bedeu was from Salvador/Nazaré\n\nLIMITED SOURCES:\n- Only documented through capoeuropa.org biography of Mestre Roque\n- No independent biographical sources found\n- Confidence level: likely (single reliable source)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO:\n- Irmão Chico Preto com nascimento estimado ~1910 (precisão de década)\n- Assumindo idade similar (irmãos), usando 1910 com precisão de década\n- Sobrinho Roque nascido em 1938, então Zé Bedeu provavelmente era adulto\n\nSEM TÍTULO:\n- Descrito como "pai e mestre de Marco Buscapé" mas a palavra "mestre" aqui\n  provavelmente significa "professor" no sentido familiar, não um título formal de capoeira\n- Nenhum título formal de capoeira documentado\n- Título deixado NULL\n\nESTILO:\n- Nenhum estilo específico documentado\n- Seu sobrinho Roque praticava Angola (linha de São Bento)\n- Estilo deixado NULL por falta de evidência direta\n\nFAMÍLIA:\n- Irmão de Chico Preto (Liberato Francisco Xavier)\n- Pai e mestre de Marco Buscapé\n- Tio de Mestre Roque (n. 1938)\n\nDISTINÇÃO IMPORTANTE:\n- Marco Buscapé (filho de Zé Bedeu) ≠ Mário Buscapé (filho de José Bidel dos Santos)\n- Estas são duas linhagens separadas de famílias diferentes\n- Mário Buscapé era de São Francisco do Conde; Zé Bedeu era de Salvador/Nazaré\n\nFONTES LIMITADAS:\n- Documentado apenas através da biografia de Mestre Roque em capoeuropa.org\n- Nenhuma fonte biográfica independente encontrada\n- Nível de confiança: provável (fonte única confiável)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();

-- Source: entities/groups/gengibirra.sql (CHANGED)
-- ============================================================
-- GENEALOGY GROUP: Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Migrated: 2025-12-11
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  name_context,
  style,
  logo,
  public_links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content (bilingual)
  description_en,
  description_pt,
  style_notes_en,
  style_notes_pt,
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Gengibirra',
  NULL, -- name_context: unique name, no disambiguation needed
  'angola'::genealogy.style,
  NULL,  -- No logo available for historical group
  ARRAY['https://velhosmestres.com/en/featured-9', 'https://nossa-tribo.com/mestre-totonho-de-mare/', 'https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/', 'https://en.wikipedia.org/wiki/Capoeira_Angola']::text[],
  -- Identity enhancements
  ARRAY['Centro Nacional de Capoeira de Origem Angola', 'Centro de Capoeira Angola', 'Roda do Gengibirra', 'Roda de Gengibirra', 'Jinjibirra'],
  '[{"name": "Centro Nacional de Capoeira de Origem Angola", "startedAt": "1920-01-01", "endedAt": "1941-02-23", "context": "Original name used by founders"}, {"name": "CECA (handed to Pastinha)", "startedAt": "1941-02-23", "context": "Transitioned to Mestre Pastinha, registered as Centro Esportivo de Capoeira Angola"}]'::jsonb,
  -- Founding details
  1920,
  'decade'::genealogy.date_precision,
  'Ladeira de Pedra, Liberdade, Salvador, Bahia, Brazil',
  -- Extended content (bilingual)
  E'Gengibirra was the first organized center for Capoeira Angola in the state of Bahia, founded in the 1920s at Ladeira de Pedra in the Liberdade neighborhood, Salvador. The center was established during a dangerous period - the Penal Code of 1890 criminalized capoeira with imprisonment of 2-6 months, and police chief Pedro Gordilho ("Pedrito") terrorized practitioners with his mounted cavalry from 1920-1927.\n\nAccording to Mestre Noronha''s manuscripts, 22 mestres founded the center, with four recognized as "donos e proprietarios" (organizational leaders): Noronha, his brother Livino, Totonho de Mare, and Amorzinho. The center adopted green and yellow - the colors of the Brazilian flag - as its official colors.\n\nAmorzinho''s role as a civil guard (guarda civil) was critical. Portal Capoeira states: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." As a uniformed preventive police officer, he could warn of operations, vouch for gatherings, and intervene if other officers arrived - providing institutional protection from within the system that persecuted capoeira.\n\nIn 1941, Amorzinho recognized Mestre Pastinha''s capabilities and handed him leadership. After Amorzinho''s death in 1943, "CECA was abandoned by all the Masters" - without their protector, the mestres scattered. Pastinha registered the center as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, where it became internationally famous.',
  E'O Gengibirra foi o primeiro centro organizado de Capoeira Angola no estado da Bahia, fundado na decada de 1920 na Ladeira de Pedra, no bairro da Liberdade, Salvador. O centro foi estabelecido durante um periodo perigoso - o Codigo Penal de 1890 criminalizava a capoeira com prisao de 2-6 meses, e o chefe de policia Pedro Gordilho ("Pedrito") aterrorizava praticantes com sua cavalaria montada de 1920 a 1927.\n\nDe acordo com os manuscritos de Mestre Noronha, 22 mestres fundaram o centro, com quatro reconhecidos como "donos e proprietarios" (lideres organizacionais): Noronha, seu irmao Livino, Totonho de Mare e Amorzinho. O centro adotou o verde e amarelo - as cores da bandeira brasileira - como suas cores oficiais.\n\nO papel de Amorzinho como guarda civil foi critico. O Portal Capoeira afirma: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." Como oficial uniformizado da policia preventiva, ele podia avisar sobre operacoes, atestar reunioes e intervir se outros oficiais chegassem - fornecendo protecao institucional de dentro do sistema que perseguia a capoeira.\n\nEm 1941, Amorzinho reconheceu as capacidades de Mestre Pastinha e lhe passou a lideranca. Apos a morte de Amorzinho em 1943, "o CECA foi abandonado por todos os Mestres" - sem seu protetor, os mestres se dispersaram. Pastinha registrou o centro como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, onde se tornou internacionalmente famoso.',
  -- Style notes (bilingual)
  E'Pre-stylistic era capoeira angola. The center established formal combat rules documented by Noronha: "The capoeirista who is dragged by a rasteira in a demonstration or a rabo de arraia or a joelhada or a balão boca de calças or a escoramento de coxa is considered defeated." This represents one of the earliest documented codifications of capoeira competition rules.',
  E'Capoeira angola da era pré-estilística. O centro estabeleceu regras formais de combate documentadas por Noronha: "O capoeirista que for arrastado por uma rasteira em uma demonstração ou um rabo de arraia ou uma joelhada ou um balão boca de calças ou um escoramento de coxa é considerado derrotado." Isso representa uma das primeiras codificações documentadas de regras de competição de capoeira.',
  -- Philosophy (bilingual)
  E'Preservation of traditional capoeira angola during the era of criminalization. The center served as a sanctuary where mestres could practice, teach, and preserve the art despite legal persecution. The green and yellow colors represented Brazilian national pride and the legitimacy of capoeira as a cultural practice.',
  E'Preservação da capoeira angola tradicional durante a era de criminalização. O centro serviu como um santuário onde os mestres podiam praticar, ensinar e preservar a arte apesar da perseguição legal. As cores verde e amarelo representavam o orgulho nacional brasileiro e a legitimidade da capoeira como prática cultural.',
  -- History (bilingual)
  E'Gengibirra traces its origins to the 1920s when capoeira was still criminalized in Brazil. The Penal Code of 1890 (Article 402) made "exercises of agility and bodily skill known by the denomination Capoeiragem" punishable by two to six months imprisonment, with gang membership as an aggravating factor. This law remained in effect until 1940.\n\nThe founding years of Gengibirra (1920s) coincided with the most intense period of persecution under Pedro de Azevedo Gordilho ("Pedrito"), the brutal police chief whose mounted cavalry terrorized capoeiristas throughout Salvador from 1920-1927. His persecution was so notorious that capoeiristas created the "Cavalaria" toque - a berimbau rhythm mimicking approaching horses - to warn when police were near.\n\nAccording to Mestre Noronha, before Gengibirra there was an earlier attempt to organize the "Conjunto de Capoeira de Angola Conceicao da Praia." The founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra included: Noronha, Livino, Mare (Totonho de Mare), Amorzinho, Raimundo ABR (Aberre), Percilio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pe de Abelha, Zehi, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada, Onca Preta, Cimento, Argemiro Grande, Olho de Pombo, Antonio Galindeu, Antonio Boca de Porco, Candido Pequeno (Argolinha de Ouro), Lucio Pequeno, and Paquete do Cabula.\n\nAmorzinho''s role as a civil guard (guarda civil) was critical to the center''s survival. Portal Capoeira states: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." As a uniformed member of the preventive police force, he could warn of planned operations, vouch for gatherings, and intervene if other officers arrived - providing institutional protection from within the system that persecuted capoeira.\n\nOn February 23, 1941, Mestre Aberre introduced Mestre Pastinha to the assembly. Amorzinho recognized Pastinha''s capabilities and asked him to assume leadership. According to Noronha''s manuscripts, after Amorzinho''s death (1943), the mestres formally handed the center to Pastinha. Sources note: "with Amorzinho''s death, CECA was abandoned by all the Masters" - without their protector within the system, the mestres scattered. The center would not fully recover until 1955.\n\nPastinha registered the center as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, where it became internationally famous.',
  E'O Gengibirra tem suas origens na decada de 1920, quando a capoeira ainda era criminalizada no Brasil. O Codigo Penal de 1890 (Artigo 402) tornava "exercicio de agilidade e destreza corporal conhecida pela denominacao Capoeiragem" punivel com dois a seis meses de prisao, com participacao em malta como agravante. Esta lei permaneceu em vigor ate 1940.\n\nOs anos de fundacao do Gengibirra (decada de 1920) coincidiram com o periodo mais intenso de perseguicao sob Pedro de Azevedo Gordilho ("Pedrito"), o brutal chefe de policia cuja cavalaria montada aterrorizou capoeiristas por toda Salvador de 1920 a 1927. Sua perseguicao foi tao notoria que os capoeiristas criaram o toque "Cavalaria" - um ritmo de berimbau imitando cavalos se aproximando - para avisar quando a policia estava perto.\n\nDe acordo com Mestre Noronha, antes do Gengibirra houve uma tentativa anterior de organizar o "Conjunto de Capoeira de Angola Conceicao da Praia." Os mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra incluiam: Noronha, Livino, Mare (Totonho de Mare), Amorzinho, Raimundo ABR (Aberre), Percilio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pe de Abelha, Zehi, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada, Onca Preta, Cimento, Argemiro Grande, Olho de Pombo, Antonio Galindeu, Antonio Boca de Porco, Candido Pequeno (Argolinha de Ouro), Lucio Pequeno e Paquete do Cabula.\n\nO papel de Amorzinho como guarda civil foi critico para a sobrevivencia do centro. O Portal Capoeira afirma: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." Como membro uniformizado da forca policial preventiva, ele podia avisar sobre operacoes planejadas, atestar reunioes e intervir se outros oficiais chegassem - fornecendo protecao institucional de dentro do sistema que perseguia a capoeira.\n\nEm 23 de fevereiro de 1941, Mestre Aberre apresentou Mestre Pastinha a assembleia. Amorzinho reconheceu as capacidades de Pastinha e pediu-lhe que assumisse a lideranca. De acordo com os manuscritos de Noronha, apos a morte de Amorzinho (1943), os mestres formalmente entregaram o centro a Pastinha. As fontes observam: "com o falecimento de Amorzinho, o CECA foi abandonado por todos os Mestres" - sem seu protetor dentro do sistema, os mestres se dispersaram. O centro so se recuperaria totalmente em 1955.\n\nPastinha registrou o centro como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, onde se tornou internacionalmente famoso.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true,  -- is_headquarters (original location)
  -- Status
  false,  -- is_active (transitioned to CECA in 1941)
  '1941-02-23'::date  -- dissolved_at (handed to Pastinha)
)
ON CONFLICT (name, COALESCE(name_context, '')) WHERE name IS NOT NULL DO UPDATE SET
  style = EXCLUDED.style,
  logo = EXCLUDED.logo,
  public_links = EXCLUDED.public_links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();

-- Source: entities/groups/roda-de-trapiche-de-baixo.sql (CHANGED)
-- ============================================================
-- GENEALOGY GROUP: Roda de Trapiche de Baixo
-- Migrated: 2025-12-11
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  name_context,
  description_en,
  description_pt,
  style,
  style_notes_en,
  style_notes_pt,
  logo,
  public_links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Roda de Trapiche de Baixo',
  NULL, -- name_context: unique name, no disambiguation needed
  'An informal community of capoeiristas in Santo Amaro da Purificação, Bahia, centered around Besouro Mangangá and his companions. NOT a formal school—Trapiche de Baixo was a neighborhood where capoeiristas lived, trained together on Sundays and at folk festivals, and held memorable rodas. This proto-group represents the social structure through which capoeira was transmitted from African ex-slaves (Tio Alípio) to the legendary Besouro and his generation, and onward to Cobrinha Verde.',
  'Uma comunidade informal de capoeiristas em Santo Amaro da Purificação, Bahia, centrada em Besouro Mangangá e seus companheiros. NÃO era uma escola formal—Trapiche de Baixo era um bairro onde os capoeiristas viviam, treinavam juntos aos domingos e nas festas populares, e realizavam rodas memoráveis. Este proto-grupo representa a estrutura social através da qual a capoeira foi transmitida de ex-escravos africanos (Tio Alípio) ao lendário Besouro e sua geração, e daí para Cobrinha Verde.',
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. Included knife techniques, mandinga, and spiritual practices (corpo fechado).',
  'Era pré-codificação. Praticava capoeira baiana tradicional antes da divisão Angola/Regional. Incluía técnicas de faca, mandinga e práticas espirituais (corpo fechado).',
  NULL, -- No logo for informal historical group
  ARRAY['https://velhosmestres.com/en/besouro', 'https://papoeira.com/en/who-was-besouro-preto-de-manganga/']::text[],
  -- Identity enhancements
  ARRAY['Capoeira do Trapiche de Baixo'],
  '[]'::jsonb, -- No name changes
  -- Founding details
  1908, -- When Besouro began training; Tio Alípio arrived ~1888
  'approximate'::genealogy.date_precision,
  'Trapiche de Baixo, Santo Amaro da Purificação, Bahia, Brazil',
  -- Extended content (philosophy)
  NULL, -- No formal philosophy for informal group
  NULL, -- No formal philosophy for informal group
  -- history_en
  E'Trapiche de Baixo was a waterfront neighborhood in Santo Amaro da Purificação—described as "the poorest neighborhood of Santo Amaro." Around 1888, Tio Alípio, an African ex-slave and Babalaô from Dahomey who had been held at the Engenho Pantaleão sugar mill, moved to the area and began teaching capoeira.

Around 1908, the young Manoel Henrique Pereira (later Besouro Mangangá) moved to Trapiche de Baixo at age 13. One source describes the neighborhood as "a suburban zone of the city which becomes his school." He learned capoeira from Tio Alípio while working in the sugar cane fields.

A community formed around Besouro and his companions—Paulo Barroquinha, Boca de Siri (Siri de Mangue), Noca de Jacó, Doze Homens (Maria Doze Homens), and Canário Pardo—all residents of Trapiche de Baixo. They held "memorable capoeira rodas that hypnotized anybody that would go by" and trained together on Sundays and at folk festivals. Sources describe them as "a gang of capoeira resistance fighters who trained together on Sundays, and could always be relied upon to back one another up."

Because capoeira was illegal (criminalized in the 1890 Penal Code), training was done in secret. When police appeared, Besouro would send students away and face authorities alone.

Around 1912, Besouro began teaching his cousin Cobrinha Verde (age 4). When Besouro was killed in July 1924, "capoeira rodas across Bahia ceased for weeks as a sign of mourning." The informal community dispersed, though members continued practicing elsewhere. Siri de Mangue and Canário Pardo later taught Mestre Waldemar; Cobrinha Verde eventually worked with Mestre Pastinha and taught João Grande and João Pequeno.',
  -- history_pt
  E'Trapiche de Baixo era um bairro à beira-mar em Santo Amaro da Purificação—descrito como "o bairro mais pobre de Santo Amaro." Por volta de 1888, Tio Alípio, um ex-escravo africano e Babalaô do Daomé que havia sido mantido no Engenho Pantaleão, mudou-se para a área e começou a ensinar capoeira.

Por volta de 1908, o jovem Manoel Henrique Pereira (mais tarde Besouro Mangangá) mudou-se para Trapiche de Baixo aos 13 anos. Uma fonte descreve o bairro como "uma zona suburbana da cidade que se torna sua escola." Ele aprendeu capoeira com Tio Alípio enquanto trabalhava nos canaviais.

Uma comunidade se formou em torno de Besouro e seus companheiros—Paulo Barroquinha, Boca de Siri (Siri de Mangue), Noca de Jacó, Doze Homens (Maria Doze Homens) e Canário Pardo—todos moradores de Trapiche de Baixo. Eles realizavam "rodas de capoeira memoráveis que hipnotizavam qualquer um que passasse" e treinavam juntos aos domingos e nas festas populares. As fontes os descrevem como "uma turma de lutadores de resistência da capoeira que treinavam juntos aos domingos, e sempre podiam contar uns com os outros."

Como a capoeira era ilegal (criminalizada no Código Penal de 1890), o treinamento era feito em segredo. Quando a polícia aparecia, Besouro mandava os alunos embora e enfrentava as autoridades sozinho.

Por volta de 1912, Besouro começou a ensinar seu primo Cobrinha Verde (4 anos). Quando Besouro foi morto em julho de 1924, "rodas de capoeira em toda a Bahia cessaram por semanas em sinal de luto." A comunidade informal se dispersou, embora os membros continuassem praticando em outros lugares. Siri de Mangue e Canário Pardo mais tarde ensinaram Mestre Waldemar; Cobrinha Verde eventualmente trabalhou com Mestre Pastinha e ensinou João Grande e João Pequeno.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true, -- This was the only location
  -- Status
  false, -- Dissolved
  '1924-07-08'::date -- Besouro's death effectively ended the community
)
ON CONFLICT (name, COALESCE(name_context, '')) WHERE name IS NOT NULL DO UPDATE SET
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  logo = EXCLUDED.logo,
  public_links = EXCLUDED.public_links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();

-- Source: entities/groups/roda-do-matatu-preto.sql (CHANGED)
-- ============================================================
-- GENEALOGY GROUP: Roda do Matatu Preto
-- Migrated: 2025-12-11
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  name_context,
  description_en,
  description_pt,
  style,
  style_notes_en,
  style_notes_pt,
  logo,
  public_links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Roda do Matatu Preto',
  NULL, -- name_context: unique name, no disambiguation needed
  'An informal Sunday training circle in the Matatu neighborhood of Salvador, Bahia, during the 1930s. According to Mestre Canjiquinha''s 1989 testimony, capoeiristas including Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, and Barboza would gather there on Sundays. This proto-group represents the continuation of traditional capoeira practice in Salvador during the transition era before and during the emergence of formal academies.',
  'Um círculo informal de treino aos domingos no bairro do Matatu em Salvador, Bahia, durante os anos 1930. Segundo o testemunho de Mestre Canjiquinha de 1989, capoeiristas incluindo Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha e Barboza se reuniam lá aos domingos. Este proto-grupo representa a continuação da prática tradicional de capoeira em Salvador durante a era de transição antes e durante o surgimento das academias formais.',
  'angola'::genealogy.style,
  'Traditional capoeira Angola. The 1930s was the transition period when Bimba was developing Regional and Pastinha was consolidating Angola. Many at Matatu Preto were also connected to Gengibirra.',
  'Capoeira Angola tradicional. Os anos 1930 foram o período de transição quando Bimba estava desenvolvendo a Regional e Pastinha estava consolidando a Angola. Muitos no Matatu Preto também tinham conexão com a Gengibirra.',
  NULL, -- No logo for informal historical group
  ARRAY['https://velhosmestres.com/br/destaques-2']::text[],
  -- Identity enhancements
  ARRAY['Matatu Preto', 'Treino do Matatu'],
  '[]'::jsonb, -- No name changes
  -- Founding details
  1930, -- Approximate, based on Canjiquinha's testimony about the 1930s
  'decade'::genealogy.date_precision,
  'Matatu neighborhood, Salvador, Bahia, Brazil',
  -- Extended content (philosophy)
  NULL, -- No formal philosophy for informal group
  NULL, -- No formal philosophy for informal group
  -- history_en
  E'The Matatu Preto training circle was documented through Mestre Canjiquinha''s 1989 testimony about the capoeira scene in Salvador during the 1930s. According to Canjiquinha:\n\n"There, on Sundays, all these capoeiristas would come - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, the late Barboza, and this citizen called Antonio Raimundo, nicknamed by everyone Aberrê."\n\nThis was a period of transition in Bahian capoeira. Mestre Bimba had opened his academy in 1932, developing what would become Capoeira Regional. Meanwhile, traditional practitioners continued meeting informally. Many of those at Matatu Preto were also connected to Gengibirra, the first organized centro of Capoeira Angola at Ladeira de Pedra in the Liberdade neighborhood.\n\nThe training circle at Matatu Preto represents an important node in the social network that preserved and transmitted traditional capoeira during this transitional era.',
  -- history_pt
  E'O círculo de treino do Matatu Preto foi documentado através do testemunho de Mestre Canjiquinha de 1989 sobre a cena da capoeira em Salvador durante os anos 1930. Segundo Canjiquinha:\n\n"Lá, aos domingos, vinham todos esses capoeiristas - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, finado Barboza, e esse cidadão chamado Antônio Raimundo, apelidado por todos de Aberrê."\n\nEste foi um período de transição na capoeira baiana. Mestre Bimba havia aberto sua academia em 1932, desenvolvendo o que se tornaria a Capoeira Regional. Enquanto isso, praticantes tradicionais continuavam se encontrando informalmente. Muitos dos que estavam no Matatu Preto também tinham conexão com a Gengibirra, o primeiro centro organizado de Capoeira Angola na Ladeira de Pedra no bairro da Liberdade.\n\nO círculo de treino no Matatu Preto representa um nó importante na rede social que preservou e transmitiu a capoeira tradicional durante esta era de transição.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true, -- This was the only location
  -- Status
  false, -- Dissolved (informal group, no longer active)
  NULL -- Exact dissolution unknown
)
ON CONFLICT (name, COALESCE(name_context, '')) WHERE name IS NOT NULL DO UPDATE SET
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  logo = EXCLUDED.logo,
  public_links = EXCLUDED.public_links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();

-- ============================================================
-- PHASE 2: UPSERT STATEMENTS
-- ============================================================

-- Source: statements/persons/adilson-camisa-preta.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Adilson Camisa Preta
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Adilson Camisa Preta is the SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Adilson Camisa Preta student_of Roque
-- Primary teacher; Adilson became Roque's senior student
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Adilson trained under Mestre Roque at the Pavao/Pavaozinho academy, becoming his most advanced student. Training start date unknown, but by the early 1970s Adilson was ready to take over the school.',
  E'Adilson treinou sob Mestre Roque na academia do Pavao/Pavaozinho, tornando-se seu aluno mais avancado. Data de inicio do treinamento desconhecida, mas no inicio dos anos 1970 Adilson estava pronto para assumir a escola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson Camisa Preta' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- Adilson Camisa Preta received_title_from Roque
--   - Implied: as Roque's senior student who took over the school, he was
--     likely formally graduated by Roque, though this is not explicitly documented
--   - Confidence would be 'likely' if added
--
-- Adilson Camisa Preta teaches_at Grupo Bantus de Capoeira
--   - Taught at this group founded by Mestre Roque
--   - Needs group import first (in groups-backlog.md)
--
-- Adilson Camisa Preta associated_with Mercedes Batista
--   - Collaborated with Mercedes Batista (first Black dancer at Rio Municipal Theatre)
--   - Mercedes Batista is NOT a capoeirista - do not import to genealogy
--   - Association documented in bio text only
--
-- Adilson Camisa Preta associated_with Aroldo Costa
--   - Collaborated with Aroldo Costa (Afro-Brazilian cultural figure)
--   - Aroldo Costa is NOT a capoeirista - do not import to genealogy
--   - Association documented in bio text only
--
-- ============================================================

-- Source: statements/persons/chico-preto.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Chico Preto
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Chico Preto is the SUBJECT.
-- ============================================================

-- Chico Preto family_of Roque (father-son relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"relationship_type": "parent"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  'Chico Preto is the father of Mestre Roque (born 1938). Multiple sources confirm this.',
  'Chico Preto e o pai de Mestre Roque (nascido em 1938). Multiplas fontes confirmam isto.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Preto' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chico Preto family_of Zé Bedeu (brother relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  'Brothers - documented through biography of Chico Preto''s son Mestre Roque, who describes Zé Bedeu as his uncle (tio). Zé Bedeu was also a capoeirista and father of Marco Buscapé.',
  'Irmãos - documentado através da biografia do filho de Chico Preto, Mestre Roque, que descreve Zé Bedeu como seu tio. Zé Bedeu também era capoeirista e pai de Marco Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Preto' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Chico Preto associated_with [Unnamed Tailor] - tailor identity unknown
--   Note: Tailor lived on Peru hill near Largo do Tanque
--   This friend became Roque's first capoeira teacher in 1948
--   Source: capoeirahistory.com

-- Source: statements/persons/paulo-siqueira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Paulo Siqueira
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Paulo Siqueira is the SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Paulo Siqueira student_of Roque
-- Trained at Roque's academy on Morro do Pavão from ~1972
-- Note: Primary teacher was Adilson, but under Roque's guidance
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Paulo Siqueira began training at Mestre Roque''s academy on Morro do Pavão around 1972. While Adilson was his primary instructor, Roque provided overall guidance and the academy bore his name. Paulo is recognized as one of Roque''s students.',
  E'Paulo Siqueira começou a treinar na academia de Mestre Roque no Morro do Pavão por volta de 1972. Embora Adilson fosse seu instrutor principal, Roque fornecia orientação geral e a academia levava seu nome. Paulo é reconhecido como um dos alunos de Roque.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Siqueira' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- NOTE: cultural_pioneer_of Germany statement REMOVED
-- The entity_type enum only supports 'person' and 'group', not 'country'.
-- Paulo Siqueira's pioneering role in Germany is documented in his bio and
-- achievements fields in the entity SQL file.
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- Paulo Siqueira student_of Adilson Camisa Preta
-- Primary teacher who graduated him as mestre
-- "Mestre Adilson was his only Mestre until Adilson's death"
-- "great influence in the life of Paulo Siqueira, as capoeirista and person"
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '1995-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Paulo Siqueira began training under Mestre Adilson "Camisa Preta" around 1972 at Mestre Roque''s academy on Morro do Pavao. Adilson was his primary teacher and "had great influence in the life of Paulo Siqueira, as capoeirista and person." Adilson was Paulo''s only mestre until Adilson''s death in the 1990s.',
  E'Paulo Siqueira comecou a treinar sob Mestre Adilson "Camisa Preta" por volta de 1972 na academia de Mestre Roque no Morro do Pavao. Adilson foi seu professor principal e "teve grande influencia na vida de Paulo Siqueira, como capoeirista e pessoa." Adilson foi o unico mestre de Paulo ate a morte de Adilson nos anos 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Siqueira' AND o.apelido = 'Adilson Camisa Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Paulo Siqueira received_title_from Adilson Camisa Preta
-- Received mestre title from Adilson (before Adilson's death in 1990s)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/',
  E'Paulo Siqueira received the mestre title from Mestre Adilson "Camisa Preta." Exact date unknown, but occurred before Adilson''s death in the 1990s.',
  E'Paulo Siqueira recebeu o titulo de mestre de Mestre Adilson "Camisa Preta." Data exata desconhecida, mas ocorreu antes da morte de Adilson nos anos 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo Siqueira' AND o.apelido = 'Adilson Camisa Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- Paulo Siqueira founded Escola de Capoeira Nzinga (group)
--   - Founded 1985 in Hamburg
--   - Needs group import first (in groups-backlog.md)
--
-- ============================================================

-- Source: statements/persons/roque.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Roque
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Roque is the SUBJECT.
-- Note: Relationships where Roque is the OBJECT (e.g., students)
-- belong in the student's statement file.
-- ============================================================

-- ------------------------------------------------------------
-- Roque trained_under Cobrinha Verde
-- "He also claims to have learned a lot from Cobrinha Verde"
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Roque claims to have learned a great deal from Cobrinha Verde in Salvador. His lineage descends from Tio Alípio through Besouro, continuing with Cobrinha Verde.',
  E'Roque afirma ter aprendido muito com Cobrinha Verde em Salvador. Sua linhagem descende de Tio Alípio, passando por Besouro, continuando com Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque trained_under Traíra
-- "socialized with... Traíra" / "trained under Mestre Traira"
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Roque trained under Mestre Traíra in Salvador and socialized with him as a young man.',
  E'Roque treinou com Mestre Traíra em Salvador e conviveu com ele quando jovem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque associated_with Onça Preta
-- Co-founders of Filhos de Angola (Rio, 1960)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": {"en": "Co-founders of Grupo Filhos de Angola in Rio de Janeiro", "pt": "Co-fundadores do Grupo Filhos de Angola no Rio de Janeiro"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  E'Roque and Onça Preta co-founded Grupo Filhos de Angola together with Mucungê, Dois de Ouro, Baleado, and Imagem do Cão on July 21, 1960 in Rio de Janeiro.',
  E'Roque e Onça Preta co-fundaram o Grupo Filhos de Angola junto com Mucungê, Dois de Ouro, Baleado e Imagem do Cão em 21 de julho de 1960 no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque influenced_by Chico Preto (father - capoeirista)
-- No direct evidence of formal training, but family context
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1948-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'uncertain'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Chico Preto was a capoeirista who facilitated Roque''s introduction to capoeira. He connected Roque to his first formal teacher (unnamed tailor on Peru hill) and gave him access to the Mercado Modelo capoeira community. No direct evidence of formal training, but influence through family environment is culturally reasonable.',
  E'Chico Preto era um capoeirista que facilitou a introdução de Roque à capoeira. Ele conectou Roque ao seu primeiro professor formal (um alfaiate no Morro do Peru) e deu-lhe acesso à comunidade de capoeira do Mercado Modelo. Sem evidência direta de treinamento formal, mas influência através do ambiente familiar é culturalmente razoável.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque influenced_by Zé Bedeu (uncle - capoeirista)
-- No direct evidence of formal training, but family context
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'uncertain'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Zé Bedeu was Roque''s uncle and a capoeirista who taught his own son Marco Buscapé. Growing up in a family where both father and uncle practiced capoeira, Roque was exposed to the art from childhood. No direct evidence of formal training from Zé Bedeu, but family influence is culturally reasonable.',
  E'Zé Bedeu era tio de Roque e um capoeirista que ensinou seu próprio filho Marco Buscapé. Crescendo em uma família onde tanto o pai quanto o tio praticavam capoeira, Roque foi exposto à arte desde a infância. Sem evidência direta de treinamento formal de Zé Bedeu, mas influência familiar é culturalmente razoável.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque family_of Chico Preto (father)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "son"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  E'Roque is the son of Chico Preto (Liberato Francisco Xavier). He was born in 1938 in Cachoeira and raised in the Nazaré neighborhood of Salvador.',
  E'Roque é filho de Chico Preto (Liberato Francisco Xavier). Nasceu em 1938 em Cachoeira e foi criado no bairro de Nazaré em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Roque family_of Zé Bedeu (uncle)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "nephew"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Zé Bedeu is Roque''s uncle - brother of his father Chico Preto. Both brothers were capoeiristas in Salvador.',
  E'Zé Bedeu é tio de Roque - irmão de seu pai Chico Preto. Ambos os irmãos eram capoeiristas em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Roque' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
--
-- PRIMARY TEACHER (unnamed):
-- Roque's primary teacher was an unnamed tailor who lived on Peru hill
-- near Largo do Tanque - a friend of his father. Cannot create statement
-- until this person is identified.
--
-- TEACHERS/INFLUENCES (need import):
-- Roque trained_under Mucungê (learned berimbau from him)
--
-- CONTEMPORARIES (need import):
-- Roque associated_with Gajé (socialized with in Salvador)
-- Roque associated_with Índio (socialized with in Salvador)
-- Roque associated_with Tatu Bola (socialized with in Salvador)
-- Roque associated_with Bom Cabrito (socialized with in Salvador)
-- Roque associated_with Boca de Fumaça (socialized with in Salvador)
-- Roque associated_with Canjiquinha (socialized with in Salvador)
-- Roque associated_with Mário Buscapé (joined his Capoeiras do Bonfim group)
-- Roque associated_with Vermelho 27 (had contact in Rio)
--
-- FILHOS DE ANGOLA CO-FOUNDERS (need import):
-- Roque associated_with Mucungê (co-founder Filhos de Angola)
-- Roque associated_with Dois de Ouro (co-founder Filhos de Angola)
-- Roque associated_with Baleado (co-founder Filhos de Angola)
-- Roque associated_with Imagem do Cão (co-founder Filhos de Angola)
--
-- GROUP RELATIONSHIPS (need group imports):
-- Roque co_founded Filhos de Angola (group, 1960-07-21)
-- Roque member_of Capoeiras do Bonfim (Mário Buscapé's folkloric group)
--
-- ============================================================

-- Source: statements/persons/traira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Traíra
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Traíra is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- ------------------------------------------------------------
-- Traíra student_of Waldemar
-- Started ~1947 at Escola de Capoeira Angola, Liberdade, Salvador
-- Primary formal teacher - Traíra managed Waldemar's roda
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; CapoeiraWiki; multiple sources',
  'Traíra began formal training with Waldemar in 1947. He became so trusted that he managed Waldemar''s roda: "The late Traíra is who managed the roda. I''d arrive, give orders, then have beer" (Waldemar). Training continued until Traíra''s death ~1975.',
  'Traíra começou o treinamento formal com Waldemar em 1947. Tornou-se tão confiável que administrava a roda de Waldemar: "O finado Traíra é que tomava conta da roda. Eu chegava, dava as ordens e ia tomar cerveja" (Waldemar). Treinamento continuou até a morte de Traíra ~1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Cobrinha Verde
-- Recorded LP together (1962); contemporaries at Market Ramp rodas
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Recorded LP ''Capoeira da Bahia'' together (1962); photographed together at Market Ramp roda; contemporaries in Bahian capoeira Angola scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1962; multiple sources',
  'Recorded LP "Capoeira da Bahia" together with Cobrinha Verde and Gato Preto (1962). Both appear in LP booklet photos at Market Ramp roda. Both were prominent angoleiros in Salvador''s mid-century capoeira scene.',
  'Gravaram juntos o LP "Capoeira da Bahia" com Cobrinha Verde e Gato Preto (1962). Ambos aparecem nas fotos do encarte na roda da Rampa do Mercado. Ambos eram angoleiros proeminentes na cena da capoeira de Salvador em meados do século.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Bimba
-- Both appeared in film "Vadiação" (1954)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both appeared in pioneering film ''Vadiação'' (1954) by Alexandre Robatto Filho; contemporaries in Salvador capoeira scene"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; film documentation',
  'Both appeared in the pioneering capoeira film "Vadiação" (1954) by Alexandre Robatto Filho. Though Bimba taught Regional and Traíra practiced Angola under Waldemar, they were contemporaries in Salvador''s capoeira scene.',
  'Ambos apareceram no pioneiro filme de capoeira "Vadiação" (1954) de Alexandre Robatto Filho. Embora Bimba ensinasse Regional e Traíra praticasse Angola com Waldemar, eram contemporâneos na cena da capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Traíra associated_with Pastinha
-- Jorge Amado compared them as the two most elegant players
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Contemporaries; Jorge Amado wrote (1945) that only Pastinha could match Traíra in beauty of movements and agility"}'::jsonb,
  'likely'::genealogy.confidence,
  'Jorge Amado, Bahia de Todos os Santos (1945)',
  'Jorge Amado wrote in 1945: "only Pastinha can compete with him [Traíra] in the beauty of movements, in agility, in the quickness of strikes." Both were leading Angola practitioners in Salvador, though no direct training relationship is documented.',
  'Jorge Amado escreveu em 1945: "só mesmo Pastinha pode competir com ele [Traíra] na beleza dos movimentos, na agilidade, na rigidez dos golpes." Ambos eram importantes praticantes de Angola em Salvador, embora nenhuma relação direta de treinamento seja documentada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Traíra' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Traíra trained_under Juvencio - PENDING
-- First capoeira encounters ~1938 in São Felix rodas
-- Juvencio was a dock worker who held informal rodas during festivals
-- Object 'Juvencio' needs import first - see persons-backlog.md

-- Traíra trained_under Severo do Pelourinho - PENDING
-- Mentioned by Traíra as another teacher
-- Little is known about Severo do Pelourinho
-- Object 'Severo do Pelourinho' needs import first - see persons-backlog.md

-- Traíra associated_with Gato Preto - PENDING
-- Recorded LP together (1962)
-- Object 'Gato Preto' needs import first - see persons-backlog.md

-- Note: Barba Branca's student_of Traíra relationship should be in barba-branca.sql
-- when that person is imported (per ownership rule: statement goes in subject's file)

-- Source: statements/persons/ze-bedeu.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zé Bedeu
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Zé Bedeu is the SUBJECT.
--
-- NOTE: For relationships where Zé Bedeu is the OBJECT (e.g., Roque's
-- uncle, Chico Preto's brother), those statements belong in the
-- subject's file (roque.sql, chico-preto.sql).
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Zé Bedeu family_of Chico Preto (brothers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  'Brothers - documented through biography of Chico Preto''s son Mestre Roque, who describes Zé Bedeu as his uncle (tio)',
  'Irmãos - documentado através da biografia do filho de Chico Preto, Mestre Roque, que descreve Zé Bedeu como seu tio'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Bedeu' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zé Bedeu is father and teacher of Marco Buscapé
-- Marco Buscapé student_of Zé Bedeu - should go in marco-buscape.sql when created
-- Marco Buscapé family_of Zé Bedeu (son) - should go in marco-buscape.sql when created
--
-- NOTE: Marco Buscapé is NOT in the dataset yet (marked as "?" in backlog)
-- When Marco Buscapé is imported, the statements should be added to his file:
--   - Marco Buscapé student_of Zé Bedeu
--   - Marco Buscapé family_of Zé Bedeu (relationship_type: son)
-- ============================================================

COMMIT;
