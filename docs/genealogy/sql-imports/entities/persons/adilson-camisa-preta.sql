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
