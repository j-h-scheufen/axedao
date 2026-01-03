-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2026-01-03T02:02:20.862Z
-- ============================================================
--
-- New entity files: 41
-- Changed entity files: 1
-- New statement files: 41
-- Changed statement files: 5
-- Deleted files: 2
-- Unchanged files: 590
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 0: DELETE REMOVED ENTITIES AND STATEMENTS
-- ============================================================
-- These files were removed from the source directory.
-- Deleting corresponding records from the database FIRST
-- to properly handle renames (old apelido → new apelido).
-- ============================================================

-- Deleting statements for removed file: statements/persons/dende-sfc.sql
-- MANUALLY CORRECTED: Build script incorrectly derived "Dende Sfc" from filename.
-- Actual production record has apelido='Dendê' with apelido_context='São Francisco do Conde'
-- This is being merged into a single Dendê identity with NULL context.

-- Delete statements where old Dendê (SFC) is the SUBJECT
DELETE FROM genealogy.statements
WHERE subject_type = 'person'::genealogy.entity_type
  AND subject_id IN (
    SELECT id FROM genealogy.person_profiles
    WHERE apelido = 'Dendê' AND apelido_context = 'São Francisco do Conde'
  );

-- Delete statements where old Dendê (SFC) is the OBJECT
-- (e.g., "Mário Buscapé student_of Dendê" if any exist with the old context)
DELETE FROM genealogy.statements
WHERE object_type = 'person'::genealogy.entity_type
  AND object_id IN (
    SELECT id FROM genealogy.person_profiles
    WHERE apelido = 'Dendê' AND apelido_context = 'São Francisco do Conde'
  );

-- Deleting entity for removed file: entities/persons/dende-sfc.sql
-- MANUALLY CORRECTED: Actual apelido and context from production
DELETE FROM genealogy.person_profiles
WHERE apelido = 'Dendê' AND apelido_context = 'São Francisco do Conde';

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/adilson-brasilia.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Adilson (Brasília)
-- Generated: 2026-01-02
-- ============================================================
-- DISAMBIGUATION: apelido_context 'Brasília' used to distinguish from:
--   - Adilson Camisa Preta (Rio de Janeiro, Pavãozinho) - adilson-camisa-preta.sql
--   - Adilson Vitor (Rio de Janeiro) - if imported later
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Adilson Alves da Silva', 'Adilson', 'Brasília', 'mestre'::genealogy.title, NULL,
  ARRAY['https://pt.wikipedia.org/wiki/Mestre_Adilson', 'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/', 'https://www.loc.gov/resource/ppbd.01140/']::text[],
  'regional'::genealogy.style,
  E'Self-taught pioneer who developed a combat-effective Regional style emphasizing powerful, precise strikes. Trained judo before capoeira, which influenced his technical approach. Known for devastating meia-lua de compasso and martelo. His philosophy prioritized fighting effectiveness over folkloric ritual: "The capoeira I practiced sought more fighting objectivity than folkloric heritage." Taught students to keep "the weapon hidden" and strike only when necessary—efficiency over display. Compared to Bahian capoeira by Mestre Arraia, who observed: "In Bahia there was much cunning, but nothing compared to the power of your strikes."',
  E'Pioneiro autodidata que desenvolveu um estilo Regional focado em combate, enfatizando golpes poderosos e precisos. Treinou judô antes da capoeira, o que influenciou sua abordagem técnica. Conhecido pela devastadora meia-lua de compasso e martelo. Sua filosofia priorizava eficácia na luta sobre ritual folclórico: "A capoeira que pratiquei procurou mais a objetividade da luta do que a herança folclórica." Ensinava aos alunos a manter "a arma escondida" e golpear apenas quando necessário—eficiência sobre exibição. Comparado à capoeira baiana por Mestre Arraia, que observou: "Na Bahia existia muita malícia no jogo, porém não viu nada comparável à potência dos nossos golpes."',
  1952, 'exact'::genealogy.date_precision, 'Marechal Hermes, Rio de Janeiro',
  NULL, NULL, NULL,
  E'Adilson Alves da Silva, known as Mestre Adilson, is one of the pioneers of capoeira in Brasília. Born May 30, 1952, in Marechal Hermes, a neighborhood in Rio de Janeiro''s Zona Norte, he moved to the new federal capital with his family in 1961, when he was nine years old.\n\nHis path to capoeira was unconventional. In 1965, at age 12-13, he began teaching himself from books—specifically Lamartine Pereira da Costa''s Ediouro publication and the Barsa Encyclopedia. Before capoeira, he had trained judo with the late Mestre Lhofei Shiozawa at Colégio do Setor Leste. When he continued judo with Mestre Matsuchi at Colégio Elefante Branco, Matsuchi witnessed a meia-lua de compasso and praised his form, recognizing exceptional technique even at that early stage.\n\nA transformative moment came when he discovered capoeira being practiced beneath the pilotis of one of the only two apartment blocks at SQS 209 in Brasília. There he met the future Mestres Cláudio Danadinho, Fritz, and Tabosa—the latter already "one of the most agile capoeiristas in Brazil." This friendship with Tabosa proved formative, and the two would later compete together at the Berimbau de Ouro championship.\n\nBetween 1968 and 1978, Adilson taught at Colégio Elefante Branco, having been recommended by professors César and José Gomes. This decade-long tenure made him one of the foundational instructors at what became Brasília''s most important school for early capoeira development. He then continued at SESC 913 Sul from 1978 to 1988.\n\nIn 1972-1973, Adilson had the opportunity to meet Mestre Bimba in Goiânia—the legendary mestre having relocated there from Salvador. At the academy of the late Mestre Osvaldo, Adilson played in a roda directed by Bimba, with Mestre Gigante on pandeiro. In one memorable encounter, he defeated Mestre Onça (Bimba''s adopted son) using a specialized takedown technique. Bimba removed his glasses and observed in silence—then later inquired specifically about Adilson''s student Leonides, nicknamed "Diabo louro," demonstrating the elder mestre''s recognition of the Brasília school''s quality.\n\nThe 1977 Campeonato Brasileiro de Capoeira at Clube Botafogo no Mourisco became a defining moment. Adilson reached the final against Mestre Acordeon from Bahia. Though the judges controversially ruled against him for allegedly stepping outside the ring—a decision the audience contested—he finished second and won the trophy for technical highlight ("destaque técnico") for the fastest and most precise strike of the event. Years later, Acordeon would acknowledge Adilson''s skill directly. In the same year, Adilson completed his medical degree at the University of Brasília (UnB) and was featured on the cover of Artes Marciais magazine.\n\nParallel to his capoeira career, Adilson pursued medicine, completing a residency in Plastic Surgery from 1978 to 1980. He maintains his medical practice (CRM-DF 3207) as a plastic surgeon in Brasília to this day.\n\nIn November 1993, Mestre Adilson formally closed Grupo Adilson Capoeira. However, he never fully left—returning in 1995 to teach at Academia Almir Fitness for a select group. After the death of his student Mestre Marquinhos, the group was revived in February 2007.\n\nHis lineage extends through multiple mestres: Antônio Carlos (AC), Jomar, Roberto (Negão/Robertão), and Marcus Vinícius (Marquinhos). Through Mestre Roberto, his teaching methodology continues in Grupo Capoeira Ouro Negro, which explicitly identifies as "Capoeira Regional de Brasília" in his tradition. Beyond the four formal mestres, Adilson recognized additional students with symbolic red cords: Tavinho, Minhoca, Zé Reinaldo, Enio, Luiza, Clodomir, Marcos Borel, Carlito, Carioquinha, Péricles, Cid, Edu Quadra, João Batata, and Baiano.\n\nIn 2008, photographer André Cypriano captured Adilson at the base of the Brasília TV Tower as part of a capoeira portfolio later acquired by the Library of Congress in 2017.\n\nOn October 11, 2015, his 50 years in capoeira were celebrated at Colégio Elefante Branco, coordinated by Contramestre Rodrigo (Galego) of Grupo Adilson Capoeira and Mestre Eduardo (Foca) of Grupo UCDF.',
  E'Adilson Alves da Silva, conhecido como Mestre Adilson, é um dos pioneiros da capoeira em Brasília. Nascido em 30 de maio de 1952 em Marechal Hermes, bairro da Zona Norte do Rio de Janeiro, mudou-se para a nova capital federal com sua família em 1961, quando tinha nove anos.\n\nSeu caminho para a capoeira foi incomum. Em 1965, aos 12-13 anos, começou a aprender sozinho através de livros—especificamente a publicação de Lamartine Pereira da Costa pela Ediouro e a Enciclopédia Barsa. Antes da capoeira, havia treinado judô com o saudoso Mestre Lhofei Shiozawa no Colégio do Setor Leste. Quando continuou judô com Mestre Matsuchi no Colégio Elefante Branco, Matsuchi testemunhou uma meia-lua de compasso e elogiou sua forma, reconhecendo técnica excepcional mesmo naquele estágio inicial.\n\nUm momento transformador veio quando descobriu a capoeira sendo praticada sob os pilotis de um dos únicos dois blocos de apartamentos da SQS 209 em Brasília. Ali conheceu os futuros Mestres Cláudio Danadinho, Fritz e Tabosa—este último já "um dos mais ágeis capoeiristas do Brasil." Essa amizade com Tabosa foi formativa, e os dois viriam a competir juntos no campeonato Berimbau de Ouro.\n\nEntre 1968 e 1978, Adilson ensinou no Colégio Elefante Branco, tendo sido indicado pelos professores César e José Gomes. Esta década de trabalho o tornou um dos instrutores fundamentais no que se tornou a escola mais importante de Brasília para o desenvolvimento inicial da capoeira. Depois continuou no SESC 913 Sul de 1978 a 1988.\n\nEm 1972-1973, Adilson teve a oportunidade de conhecer Mestre Bimba em Goiânia—o lendário mestre tendo se mudado de Salvador para lá. Na academia do saudoso Mestre Osvaldo, Adilson jogou em uma roda dirigida por Bimba, com Mestre Gigante no pandeiro. Em um encontro memorável, derrotou Mestre Onça (filho adotivo de Bimba) usando uma técnica especializada de queda. Bimba tirou os óculos e observou em silêncio—depois perguntou especificamente sobre o aluno de Adilson, Leonides, apelidado de "Diabo louro," demonstrando o reconhecimento do mestre ancião pela qualidade da escola de Brasília.\n\nO Campeonato Brasileiro de Capoeira de 1977 no Clube Botafogo no Mourisco tornou-se um momento definidor. Adilson chegou à final contra Mestre Acordeon da Bahia. Embora os juízes controversamente tenham decidido contra ele por supostamente pisar fora do ringue—uma decisão que o público contestou—ele terminou em segundo lugar e ganhou o troféu de destaque técnico pelo golpe mais rápido e preciso do evento. Anos depois, Acordeon reconheceria diretamente a habilidade de Adilson. No mesmo ano, Adilson completou seu curso de medicina na Universidade de Brasília (UnB) e foi capa da revista Artes Marciais.\n\nParalelamente à carreira na capoeira, Adilson seguiu a medicina, completando residência em Cirurgia Plástica de 1978 a 1980. Mantém sua prática médica (CRM-DF 3207) como cirurgião plástico em Brasília até hoje.\n\nEm novembro de 1993, Mestre Adilson encerrou formalmente o Grupo Adilson Capoeira. Porém, nunca se afastou completamente—retornando em 1995 para ensinar na Academia Almir Fitness para um grupo seleto. Após o falecimento de seu aluno Mestre Marquinhos, o grupo ressurgiu em fevereiro de 2007.\n\nSua linhagem se estende através de múltiplos mestres: Antônio Carlos (AC), Jomar, Roberto (Negão/Robertão) e Marcus Vinícius (Marquinhos). Através de Mestre Roberto, sua metodologia de ensino continua no Grupo Capoeira Ouro Negro, que se identifica explicitamente como "Capoeira Regional de Brasília" em sua tradição. Além dos quatro mestres formais, Adilson reconheceu alunos adicionais com cordas vermelhas simbólicas: Tavinho, Minhoca, Zé Reinaldo, Enio, Luiza, Clodomir, Marcos Borel, Carlito, Carioquinha, Péricles, Cid, Edu Quadra, João Batata e Baiano.\n\nEm 2008, o fotógrafo André Cypriano fotografou Adilson na base da Torre de TV de Brasília como parte de um portfólio de capoeira posteriormente adquirido pela Biblioteca do Congresso em 2017.\n\nEm 11 de outubro de 2015, seus 50 anos de capoeira foram celebrados no Colégio Elefante Branco, coordenado pelo Contramestre Rodrigo (Galego) do Grupo Adilson Capoeira e Mestre Eduardo (Foca) do Grupo UCDF.',
  E'• Pioneer of capoeira in Brasília (1965-present)\n• 2nd place, Campeonato Brasileiro de Capoeira 1977 (Botafogo/Mourisco)\n• Technical Highlight Trophy ("Destaque Técnico") 1977 - fastest and most precise strike\n• Featured on cover of Artes Marciais magazine (1977)\n• Taught at Colégio Elefante Branco (1968-1978)\n• Taught at SESC 913 Sul (1978-1988)\n• Founded Grupo Adilson Capoeira\n• Formed 4 mestres: AC, Jomar, Roberto (Negão), Marquinhos\n• Recognized 14 additional students with symbolic red cord\n• 50 Years of Capoeira celebration (October 11, 2015)\n• Photograph by André Cypriano in Library of Congress collection (2017)\n• Medical degree UnB (1977), Plastic Surgery residency (1978-1980)',
  E'• Pioneiro da capoeira em Brasília (1965-presente)\n• 2º lugar, Campeonato Brasileiro de Capoeira 1977 (Botafogo/Mourisco)\n• Troféu de Destaque Técnico 1977 - golpe mais rápido e preciso\n• Capa da revista Artes Marciais (1977)\n• Ensinou no Colégio Elefante Branco (1968-1978)\n• Ensinou no SESC 913 Sul (1978-1988)\n• Fundou Grupo Adilson Capoeira\n• Formou 4 mestres: AC, Jomar, Roberto (Negão), Marquinhos\n• Reconheceu 14 alunos adicionais com corda vermelha simbólica\n• Celebração de 50 Anos de Capoeira (11 de outubro de 2015)\n• Fotografia de André Cypriano na coleção da Biblioteca do Congresso (2017)\n• Formado em Medicina pela UnB (1977), residência em Cirurgia Plástica (1978-1980)',
  E'SELF-TAUGHT CAPOEIRA:\nAdilson is notable as an autodidact - he began learning capoeira from books (Lamartine Pereira da Costa''s Ediouro publication and Barsa Encyclopedia) in 1965 at age 12-13, before meeting other capoeiristas.\n\nTRAINING COMPANIONS (not formal teachers):\n- Mestre Tabosa - met at SQS 209, Brasília (~1965); described as "one of the most agile capoeiristas in Brazil"; formative friendship\n- Mestre Fritz (Alfredo) - met at SQS 209, Brasília (~1965); later competed together at Berimbau de Ouro\n- Mestre Danadinho (Cláudio José Queiroz) - met at SQS 209, Brasília (~1965); later Grupo Senzala founder\n\nMESTRE ARRAIA CONNECTION:\nArraia visited Adilson''s roda with Mestre Tabosa after returning to Brasília from Bahia. Arraia observed: "In Bahia there was much cunning, but nothing compared to the power of your strikes." Note: Adilson was NOT a formal student of Arraia - they were contemporaries who interacted after Arraia returned from Salvador.\n\nMEETING MESTRE BIMBA (Goiânia, 1972-1973):\nMet Bimba at Mestre Osvaldo''s academy in Goiânia. Played in roda directed by Bimba with Mestre Gigante on pandeiro. Defeated Mestre Onça (Bimba''s adopted son). Bimba inquired about Adilson''s student "Diabo louro" (Leonides).\n\nSTUDENTS FORMED AS MESTRES:\n- Mestre Antônio Carlos (AC)\n- Mestre Jomar\n- Mestre Roberto (Negão/Robertão) - lineage continues through Grupo Capoeira Ouro Negro\n- Mestre Marcus Vinícius (Marquinhos) - deceased; his death prompted 2007 revival of Grupo Adilson Capoeira\n\nSYMBOLIC RED CORD RECIPIENTS:\nTavinho, Minhoca, Zé Reinaldo, Enio, Luiza, Clodomir, Marcos Borel, Carlito, Carioquinha, Péricles, Cid, Edu Quadra, João Batata, Baiano\n\nOTHER MENTIONED STUDENTS:\n- Leonides ("Diabo louro") - noted by Bimba himself\n- Sergio-Maluco (taught in Sobradinho)\n- Abadá (taught at Colégio Rosário, early 1970s)\n- Ferrugem\n\nMEDIA APPEARANCES:\n- 1977: Cover of Artes Marciais magazine\n- 2008: Photographed by André Cypriano at Brasília TV Tower\n- 2017: Photo acquired by Library of Congress\n\nMEDICAL CAREER:\n- Medical degree: UnB, 1977\n- Residency: Plastic Surgery, 1978-1980\n- CRM-DF 3207\n- Still practicing as plastic surgeon in Brasília\n\nBERIMBAU TECHNIQUE:\nSelf-taught on berimbau; later learned missing tonal technique from an unnamed Rio de Janeiro police officer/mestre.',
  E'CAPOEIRA AUTODIDATA:\nAdilson é notável como autodidata - começou a aprender capoeira por livros (publicação de Lamartine Pereira da Costa pela Ediouro e Enciclopédia Barsa) em 1965 aos 12-13 anos, antes de conhecer outros capoeiristas.\n\nCOMPANHEIROS DE TREINO (não professores formais):\n- Mestre Tabosa - conheceu na SQS 209, Brasília (~1965); descrito como "um dos mais ágeis capoeiristas do Brasil"; amizade formativa\n- Mestre Fritz (Alfredo) - conheceu na SQS 209, Brasília (~1965); depois competiram juntos no Berimbau de Ouro\n- Mestre Danadinho (Cláudio José Queiroz) - conheceu na SQS 209, Brasília (~1965); depois fundador do Grupo Senzala\n\nCONEXÃO COM MESTRE ARRAIA:\nArraia visitou a roda de Adilson com Mestre Tabosa após retornar a Brasília da Bahia. Arraia observou: "Na Bahia existia muita malícia no jogo, porém não viu nada comparável à potência dos nossos golpes." Nota: Adilson NÃO foi aluno formal de Arraia - eram contemporâneos que interagiram após Arraia retornar de Salvador.\n\nENCONTRO COM MESTRE BIMBA (Goiânia, 1972-1973):\nConheceu Bimba na academia de Mestre Osvaldo em Goiânia. Jogou em roda dirigida por Bimba com Mestre Gigante no pandeiro. Derrotou Mestre Onça (filho adotivo de Bimba). Bimba perguntou sobre o aluno de Adilson "Diabo louro" (Leonides).\n\nALUNOS FORMADOS COMO MESTRES:\n- Mestre Antônio Carlos (AC)\n- Mestre Jomar\n- Mestre Roberto (Negão/Robertão) - linhagem continua através do Grupo Capoeira Ouro Negro\n- Mestre Marcus Vinícius (Marquinhos) - falecido; sua morte motivou o ressurgimento do Grupo Adilson Capoeira em 2007\n\nRECEBEDORES DE CORDA VERMELHA SIMBÓLICA:\nTavinho, Minhoca, Zé Reinaldo, Enio, Luiza, Clodomir, Marcos Borel, Carlito, Carioquinha, Péricles, Cid, Edu Quadra, João Batata, Baiano\n\nOUTROS ALUNOS MENCIONADOS:\n- Leonides ("Diabo louro") - notado pelo próprio Bimba\n- Sergio-Maluco (ensinou em Sobradinho)\n- Abadá (ensinou no Colégio Rosário, início anos 1970)\n- Ferrugem\n\nAPARIÇÕES NA MÍDIA:\n- 1977: Capa da revista Artes Marciais\n- 2008: Fotografado por André Cypriano na Torre de TV de Brasília\n- 2017: Foto adquirida pela Biblioteca do Congresso\n\nCARREIRA MÉDICA:\n- Formatura em Medicina: UnB, 1977\n- Residência: Cirurgia Plástica, 1978-1980\n- CRM-DF 3207\n- Ainda exerce como cirurgião plástico em Brasília\n\nTÉCNICA DE BERIMBAU:\nAutodidata no berimbau; depois aprendeu técnica tonal faltante de um mestre/policial não identificado do Rio de Janeiro.'
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

-- Source: entities/persons/alfredo-muritiba.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Alfredo (Muritiba)
-- Generated: 2026-01-03
-- ============================================================
-- BIRTH YEAR ESTIMATION (1920, decade):
-- Olavo (b. 1942) learned from Alfredo as a child in Muritiba before 1960,
-- suggesting Alfredo was an established teacher by the 1950s. Roberval (b. 1964)
-- began training with Alfredo in 1978/79 and was graduated as mestre by Alfredo
-- in 1986. If Alfredo was teaching in the 1940s-1950s and still active in the
-- 1980s, he was likely born ~1910s-1920s. Estimate: 1920 (decade precision).
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
  'Alfredo',
  'Muritiba',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.capoeirahub.net/mestres/691f68fce44abad5a573a024-mestre-roberval?lang=en',
    'https://cuica.tripod.com/filhosdeangola.htm'
  ]::text[],
  'angola'::genealogy.style,
  E'Mestre Alfredo was an Angola master in the lineage of Canjiquinha → Aberrê → Pastinha. He was known for maintaining traditional Capoeira Angola in both the Recôncavo region (Muritiba) and Salvador (Campo Velho, Cosme de Farias). He was one of the important mestres of the Cosme de Farias neighborhood alongside Mestre Canjiquinha and Mestre Celeste.',
  E'Mestre Alfredo foi um mestre de Angola na linhagem de Canjiquinha → Aberrê → Pastinha. Era conhecido por manter a tradicional Capoeira Angola tanto na região do Recôncavo (Muritiba) quanto em Salvador (Campo Velho, Cosme de Farias). Foi um dos mestres importantes do bairro de Cosme de Farias ao lado de Mestre Canjiquinha e Mestre Celeste.',
  1920,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  E'Mestre Alfredo, also known as "Cuim Bahia" or "Cuminho Na Bahia," was a disciple of Mestre Canjiquinha and one of the important masters who carried the Capoeira Angola tradition in Bahia. His teaching career spanned multiple locations and decades, bridging the Recôncavo region and Salvador.

Alfredo first taught in Muritiba, a city in the Recôncavo Baiano region roughly 90 kilometers from Salvador, where the young Olavo Paixão dos Santos (later Mestre Olavo da Bahia) received his foundational capoeira training in the 1940s-1950s. Olavo would later move to Salvador in 1960 to continue his formation under Mestre Waldemar da Paixão.

Alfredo subsequently established an academy in Campo Velho, one of the eight communities within the Cosme de Farias neighborhood of Salvador. Campo Velho became known as a center for Capoeira Angola, and the neighborhood itself was home to several legendary mestres including Canjiquinha and Celeste. At the Campo Velho academy, Alfredo trained Roberval do Espírito Santo, who began learning at age 14 in 1978. According to Roberval, his older brother took him to watch a roda at Mestre Alfredo''s academy in Campo Velho, where he had the opportunity to play berimbau. Mestre Alfredo liked his playing and invited him to participate in the rodas.

Roberval trained under both Mestre Alfredo and Mestre Celeste (from Pastinha''s academy), regularly attending Mestre João Pequeno''s Sunday roda at Forte de Santo Antônio where he encountered João Grande, Moraes, Cobrinha (Cobra Mansa), Curió, and Lua de Bobó. In 1986, Roberval received his mestre graduation from Mestre Alfredo. Roberval would go on to co-found Grupo Filhos de Angola in 1981 and become Contra-Mestre at Mestre Moraes'' academy in 1985.

Alfredo is listed among the "great masters of capoeira" from the Cosme de Farias neighborhood, alongside Mestre Canjiquinha and Mestre Celeste, according to multiple sources documenting the history of capoeira in that historically significant area of Salvador.',
  E'Mestre Alfredo, também conhecido como "Cuim Bahia" ou "Cuminho Na Bahia", foi discípulo de Mestre Canjiquinha e um dos mestres importantes que carregaram a tradição da Capoeira Angola na Bahia. Sua carreira de ensino abrangeu múltiplas localidades e décadas, conectando a região do Recôncavo a Salvador.

Alfredo primeiro ensinou em Muritiba, uma cidade na região do Recôncavo Baiano a aproximadamente 90 quilômetros de Salvador, onde o jovem Olavo Paixão dos Santos (mais tarde Mestre Olavo da Bahia) recebeu sua formação inicial em capoeira nos anos 1940-1950. Olavo mais tarde se mudaria para Salvador em 1960 para continuar sua formação com Mestre Waldemar da Paixão.

Alfredo posteriormente estabeleceu uma academia em Campo Velho, uma das oito comunidades do bairro Cosme de Farias em Salvador. Campo Velho tornou-se conhecido como um centro de Capoeira Angola, e o próprio bairro foi lar de vários mestres lendários incluindo Canjiquinha e Celeste. Na academia de Campo Velho, Alfredo treinou Roberval do Espírito Santo, que começou a aprender aos 14 anos em 1978. Segundo Roberval, seu irmão mais velho o levou para assistir uma roda na academia de Mestre Alfredo em Campo Velho, onde ele teve a oportunidade de tocar berimbau. Mestre Alfredo gostou da sua forma de tocar e o convidou a participar das rodas.

Roberval treinou sob Mestre Alfredo e Mestre Celeste (da academia de Pastinha), frequentando regularmente a roda de domingo de Mestre João Pequeno no Forte de Santo Antônio, onde encontrou João Grande, Moraes, Cobrinha (Cobra Mansa), Curió e Lua de Bobó. Em 1986, Roberval recebeu sua graduação de mestre de Mestre Alfredo. Roberval viria a co-fundar o Grupo Filhos de Angola em 1981 e tornar-se Contra-Mestre na academia de Mestre Moraes em 1985.

Alfredo é listado entre os "grandes mestres da capoeira" do bairro Cosme de Farias, ao lado de Mestre Canjiquinha e Mestre Celeste, de acordo com múltiplas fontes documentando a história da capoeira nessa área historicamente significativa de Salvador.',
  E'- Began making berimbaus (1958)
- Student of Mestre Alfredo da Capoeira Angola (Muritiba, childhood)
- Graduated Mestre Roberval in 1986
- Taught at academy in Campo Velho, Salvador
- One of the great masters of Cosme de Farias neighborhood',
  E'- Discípulo de Mestre Canjiquinha
- Ensinou em Muritiba (Recôncavo Baiano) e Campo Velho (Salvador)
- Graduou Mestre Roberval em 1986
- Um dos grandes mestres do bairro Cosme de Farias',
  E'PROFILE CONSTRUCTION NOTE:
This profile combines information from TWO SEPARATE SOURCE CLUSTERS:
1. OLAVO SOURCES (velhosmestres, artesanatodabahia): Reference "Mestre Alfredo da Capoeira Angola" teaching in Muritiba (Recôncavo) in 1940s-1950s
2. ROBERVAL SOURCES (CapoeiraHub, IPHAN, cuica.tripod): Reference "Mestre Alfredo" / "Cuim Bahia" / "Cuminho Na Bahia" teaching at Campo Velho (Salvador) in 1970s-1980s

The connection between these two clusters is INFERRED based on:
- Same apelido "Alfredo" with "Mestre" title
- Both associated with Capoeira Angola tradition
- Timeline consistency (teaching career 1940s-1986 plausible for one person)
- Original backlog entry noted "also had academy in Campo Velho" suggesting prior research connected these
- Canjiquinha lineage (Roberval sources) consistent with Angola tradition (Olavo sources)

NO SINGLE SOURCE explicitly states that the Alfredo who taught Olavo in Muritiba is the same person who taught Roberval in Salvador. This connection should be treated as LIKELY but not VERIFIED.

BIRTH YEAR ESTIMATION (1920, decade):
Olavo (b. 1942) learned from Alfredo as a child in Muritiba before moving to Salvador in 1960. Roberval (b. 1964) began training in 1978/79 and was graduated by Alfredo in 1986. Career span from 1940s through 1986 suggests birth ~1910s-1920s.

NAME VARIATIONS:
- "Cuim Bahia" / "Cumin Bahia" (Pezão biography)
- "Cuminho Na Bahia" (IPHAN portal)
- "Mestre Alfredo da Capoeira Angola" (Olavo sources)

TEACHERS:
- Mestre Canjiquinha (confirmed via CapoeiraHub lineage and IPHAN portal)

STUDENTS:
- Mestre Olavo (Olavo Paixão dos Santos, b. 1942) - childhood training in Muritiba
- Mestre Roberval (Roberval do Espírito Santo, b. 1964) - began 1978/79, graduated 1986

TEACHING LOCATIONS:
1. Muritiba, Recôncavo Baiano - taught Olavo (1940s-1950s)
2. Campo Velho, Cosme de Farias, Salvador - taught Roberval (late 1970s-1980s)
3. Also associated with "Conjunto Aberrê" in Salvador (per IPHAN portal)

CONTEMPORARIES/ASSOCIATES:
- Mestre Celeste (from Pastinha''s academy; co-taught Roberval)
- Mestre Canjiquinha (teacher; neighbor in Cosme de Farias)
- Mestre Paulo dos Anjos, Mestre Brasília, Mestre Lua Rasta (fellow Canjiquinha disciples)

DISTINCTION FROM OTHER ALFREDOS:
- NOT the same as "Alfredo" (student of Paulo dos Anjos)
- NOT the same as "Mestre Alfredo (Itabuna)" who succeeded Mestre Gabriel
- NOT the same as "Fritz (Alfredo)" from Brasília',
  E'NOTA SOBRE CONSTRUÇÃO DO PERFIL:
Este perfil combina informações de DOIS GRUPOS DE FONTES SEPARADOS:
1. FONTES SOBRE OLAVO (velhosmestres, artesanatodabahia): Referenciam "Mestre Alfredo da Capoeira Angola" ensinando em Muritiba (Recôncavo) nos anos 1940-1950
2. FONTES SOBRE ROBERVAL (CapoeiraHub, IPHAN, cuica.tripod): Referenciam "Mestre Alfredo" / "Cuim Bahia" / "Cuminho Na Bahia" ensinando em Campo Velho (Salvador) nos anos 1970-1980

A conexão entre estes dois grupos é INFERIDA baseada em:
- Mesmo apelido "Alfredo" com título de "Mestre"
- Ambos associados à tradição de Capoeira Angola
- Consistência cronológica (carreira de ensino 1940s-1986 plausível para uma pessoa)
- Entrada original no backlog notou "também tinha academia em Campo Velho" sugerindo pesquisa anterior conectou estes
- Linhagem de Canjiquinha (fontes Roberval) consistente com tradição Angola (fontes Olavo)

NENHUMA FONTE ÚNICA afirma explicitamente que o Alfredo que ensinou Olavo em Muritiba é a mesma pessoa que ensinou Roberval em Salvador. Esta conexão deve ser tratada como PROVÁVEL mas não VERIFICADA.

ESTIMATIVA DE ANO DE NASCIMENTO (1920, década):
Olavo (n. 1942) aprendeu com Alfredo quando criança em Muritiba antes de se mudar para Salvador em 1960. Roberval (n. 1964) começou a treinar em 1978/79 e foi graduado por Alfredo em 1986. Carreira dos anos 1940 até 1986 sugere nascimento ~1910s-1920s.

VARIAÇÕES DO NOME:
- "Cuim Bahia" / "Cumin Bahia" (biografia de Pezão)
- "Cuminho Na Bahia" (portal IPHAN)
- "Mestre Alfredo da Capoeira Angola" (fontes sobre Olavo)

MESTRES:
- Mestre Canjiquinha (confirmado via linhagem CapoeiraHub e portal IPHAN)

ALUNOS:
- Mestre Olavo (Olavo Paixão dos Santos, n. 1942) - treinamento na infância em Muritiba
- Mestre Roberval (Roberval do Espírito Santo, n. 1964) - começou 1978/79, graduado 1986

LOCAIS DE ENSINO:
1. Muritiba, Recôncavo Baiano - ensinou Olavo (anos 1940-1950)
2. Campo Velho, Cosme de Farias, Salvador - ensinou Roberval (final dos anos 1970-1980)
3. Também associado ao "Conjunto Aberrê" em Salvador (por portal IPHAN)

CONTEMPORÂNEOS/ASSOCIADOS:
- Mestre Celeste (da academia de Pastinha; co-ensinou Roberval)
- Mestre Canjiquinha (mestre; vizinho em Cosme de Farias)
- Mestre Paulo dos Anjos, Mestre Brasília, Mestre Lua Rasta (companheiros discípulos de Canjiquinha)

DISTINÇÃO DE OUTROS ALFREDOS:
- NÃO é o mesmo que "Alfredo" (aluno de Paulo dos Anjos)
- NÃO é o mesmo que "Mestre Alfredo (Itabuna)" que sucedeu Mestre Gabriel
- NÃO é o mesmo que "Fritz (Alfredo)" de Brasília'
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

-- Source: entities/persons/antonio-rodrigues.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Antônio Rodrigues
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1935, decade precision):
-- Mestre Miguel Preto (b. 1948) trained under him starting 1964 at age 16.
-- Antônio Rodrigues was already an established capoeirista and academy founder
-- by 1964, suggesting he was at least in his late 20s/early 30s.
-- If founding the first indoor academy in Itabuna around early 1960s when
-- ~25-30 years old, birth would be ~1930-1940. Estimate 1935 with decade precision.
-- ============================================================
-- HISTORICAL CONTEXT:
-- Street capoeirista in Itabuna who founded Academia de Capoeira Nossa Senhora
-- de Fátima - the first capoeira academy in an enclosed space in the city.
-- This represented the "street capoeira" tradition parallel to (but distinct from)
-- Major Dória's elite academy (1958) where Maneca Brandão taught.
-- His academy lineage: Antônio Rodrigues → Mestre Gabriel → Mestre Alfredo
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Antônio Rodrigues', NULL, NULL,
  ARRAY[
    'https://www.lalaue.com/learn-capoeira/mestre-lobao/',
    'https://mestrelobaosjc.webnode.com.br/mestre%20lob%C3%A3o/',
    'https://matumbecapoeira.es/capoeira/mestres/mestre-miguel-preto'
  ]::text[],
  'regional'::genealogy.style,
  E'Practiced capoeira in the streets of Itabuna in the 1950s-60s before founding the first indoor academy in the city. His style emerged from the street roda tradition of southern Bahia, parallel to but distinct from the elite academy scene represented by Major Dória''s establishment where Maneca Brandão (a Bimba student) taught.',
  E'Praticava capoeira nas ruas de Itabuna nos anos 1950-60 antes de fundar a primeira academia fechada na cidade. Seu estilo surgiu da tradição das rodas de rua do sul da Bahia, paralelo mas distinto da cena das academias de elite representada pelo estabelecimento do Major Dória onde Maneca Brandão (aluno de Bimba) ensinava.',
  1935, 'decade'::genealogy.date_precision, 'Itabuna, Bahia, Brazil (presumed)',
  NULL, NULL, NULL,
  E'Antônio Rodrigues was a pioneer of capoeira in Itabuna, Bahia, who bridged the gap between street practice and formal instruction. He was the first master to open a capoeira academy in an enclosed space in the city, founding the Academia de Capoeira Nossa Senhora de Fátima.

Before the formalization of capoeira in Itabuna, practice occurred in street rodas with marginalized practitioners known as "angoleiros" who trained without fixed locations. Antônio Rodrigues came from this tradition but took the bold step of establishing a permanent teaching space, making capoeira more accessible to young people in the community.

His academy became a training ground for several notable capoeiristas who would later influence capoeira across Brazil and internationally. In 1964, a young Miguel Machado (later Mestre Miguel Preto) began his capoeira journey under Antônio Rodrigues at age sixteen, becoming one of his instructors by 1965. Around the same period, Everaldo Bispo de Souza (Mestre Lobão, born 1952) trained under both Antônio Rodrigues and Luiz Medicina in the 1960s. Mestre Régis, born in 1957, began training with Antônio Rodrigues at just eight years old, encouraged by his older brother Ireneildo Gonçalves de Souza.

Antônio Rodrigues also introduced the young Luís Oliveira Rocha (later Mestre Medicina) to the capoeira circles of Itabuna around 1965, when Medicina was approximately fifteen years old. This connection would prove significant, as Medicina became one of Mestre Suassuna''s most accomplished students and later founded multiple capoeira groups including Grupo Raça.

The notable capoeirista Amir das Areias, who would later inspire the founding of the CLARATE capoeira group, gave courses at the Academia de Capoeira Nossa Senhora de Fátima.

After Antônio Rodrigues, the academy passed to Mestre Gabriel, who renamed it "Academia de Capoeira e Cultura Física de Itabuna." The lineage continued when Mestre Alfredo took over, renaming it "Capoeira Zumbí dos Palmares." In 1979, at the inauguration of the Centro Social Urbano (CSU) in Itabuna, Mestre Gabriel established capoeira activities there, where Mestre China would train for 43 years.

Antônio Rodrigues''s significance lies in his role as a transitional figure—he emerged from the marginalized street capoeira tradition yet helped bring the art into more formal, socially accepted spaces. His academy operated parallel to, but distinctly from, Major Dória''s elite establishment (founded 1958) where the white instructor Maneca Brandão—son of a former mayor and student of Mestre Bimba—taught to a higher social class.',
  E'Antônio Rodrigues foi um pioneiro da capoeira em Itabuna, Bahia, que fez a ponte entre a prática de rua e a instrução formal. Ele foi o primeiro mestre a abrir uma academia de capoeira em ambiente fechado na cidade, fundando a Academia de Capoeira Nossa Senhora de Fátima.

Antes da formalização da capoeira em Itabuna, a prática ocorria em rodas de rua com praticantes marginalizados conhecidos como "angoleiros" que treinavam sem locais fixos. Antônio Rodrigues veio dessa tradição mas deu o passo ousado de estabelecer um espaço permanente de ensino, tornando a capoeira mais acessível aos jovens da comunidade.

Sua academia se tornou um local de formação para vários capoeiristas notáveis que mais tarde influenciariam a capoeira pelo Brasil e internacionalmente. Em 1964, o jovem Miguel Machado (depois Mestre Miguel Preto) começou sua jornada na capoeira com Antônio Rodrigues aos dezesseis anos, tornando-se um de seus instrutores em 1965. Por volta do mesmo período, Everaldo Bispo de Souza (Mestre Lobão, nascido em 1952) treinou tanto com Antônio Rodrigues quanto com Luiz Medicina nos anos 1960. Mestre Régis, nascido em 1957, começou a treinar com Antônio Rodrigues com apenas oito anos de idade, incentivado por seu irmão mais velho Ireneildo Gonçalves de Souza.

Antônio Rodrigues também introduziu o jovem Luís Oliveira Rocha (depois Mestre Medicina) aos círculos de capoeira de Itabuna por volta de 1965, quando Medicina tinha aproximadamente quinze anos. Esta conexão se provaria significativa, já que Medicina se tornou um dos alunos mais realizados de Mestre Suassuna e mais tarde fundou múltiplos grupos de capoeira incluindo o Grupo Raça.

O notável capoeirista Amir das Areias, que mais tarde inspiraria a fundação do grupo de capoeira CLARATE, deu cursos na Academia de Capoeira Nossa Senhora de Fátima.

Depois de Antônio Rodrigues, a academia passou para Mestre Gabriel, que a renomeou "Academia de Capoeira e Cultura Física de Itabuna". A linhagem continuou quando Mestre Alfredo assumiu, renomeando-a "Capoeira Zumbí dos Palmares". Em 1979, na inauguração do Centro Social Urbano (CSU) em Itabuna, Mestre Gabriel estabeleceu atividades de capoeira lá, onde Mestre China treinaria por 43 anos.

A significância de Antônio Rodrigues está em seu papel como figura de transição—ele emergiu da tradição marginalizada da capoeira de rua, mas ajudou a trazer a arte para espaços mais formais e socialmente aceitos. Sua academia operava paralela, mas distintamente, ao estabelecimento de elite do Major Dória (fundado em 1958) onde o instrutor branco Maneca Brandão—filho de um ex-prefeito e aluno de Mestre Bimba—ensinava para uma classe social mais alta.',
  E'- Founded Academia de Capoeira Nossa Senhora de Fátima (first enclosed capoeira academy in Itabuna)
- Trained Mestre Miguel Preto (who became instructor in 1965, trained 120+ capoeiristas)
- Trained Mestre Lobão (graduated CDO 1970, co-founded first Vale do Paraíba academy 1971)
- Trained Mestre Régis (began at age 8)
- Introduced Mestre Medicina to capoeira circles (~1965)
- Academy succession: Antônio Rodrigues → Mestre Gabriel → Mestre Alfredo (Zumbí dos Palmares)
- Amir das Areias gave courses at his academy',
  E'- Fundou a Academia de Capoeira Nossa Senhora de Fátima (primeira academia de capoeira em ambiente fechado em Itabuna)
- Formou Mestre Miguel Preto (que se tornou instrutor em 1965, formou 120+ capoeiristas)
- Formou Mestre Lobão (formado no CDO 1970, co-fundou a primeira academia do Vale do Paraíba 1971)
- Formou Mestre Régis (começou aos 8 anos)
- Introduziu Mestre Medicina aos círculos de capoeira (~1965)
- Sucessão da academia: Antônio Rodrigues → Mestre Gabriel → Mestre Alfredo (Zumbí dos Palmares)
- Amir das Areias deu cursos em sua academia',
  E'BIRTH YEAR ESTIMATION (1935, decade):
Mestre Miguel Preto (b. Sept 29, 1948) trained under him starting 1964 at age 16.
Antônio Rodrigues was already established enough to run an academy by then.
If founding academy in early 1960s when ~25-30 years old → birth ~1930-1940.
Estimate 1935 with decade precision.

NAME VARIATIONS:
- "Antônio Rodrigues" - most sources
- "Mestre Antônio" - informal reference in Diário Bahia article
- "Antonio Rodrigues" - without accent

APELIDO NOTE:
No distinct capoeira apelido found. Uses "Antônio Rodrigues" as identifier.
This is unusual—most mestres have apelidos. Possible reasons:
1. He was of the transitional generation before apelidos became standard
2. Sources simply don''t record his apelido
3. His full name functioned as his identifier

STUDENTS (confirmed):
- Mestre Miguel Preto (Miguel Machado, b. Sept 29, 1948 in Piaú, Bahia) - began 1964, instructor 1965
- Mestre Lobão (Everaldo Bispo de Souza, b. June 7, 1952) - trained 1960s
- Mestre Régis (b. June 27, 1957 in Itabuna) - began at age 8, encouraged by brother Ireneildo Gonçalves de Souza
- Mestre Medicina (Luís Oliveira Rocha, b. Dec 16, 1950) - introduced to capoeira circles ~1965

STUDENTS (indirect/uncertain):
- Mestre China (Josenildo de Sousa Santos) - article mentions him within the academy''s lineage
  but his direct teacher appears to be Mestre Gabriel, not Antônio Rodrigues

ACADEMY LINEAGE:
1. Academia de Capoeira Nossa Senhora de Fátima (Antônio Rodrigues)
2. Academia de Capoeira e Cultura Física de Itabuna (Mestre Gabriel)
3. Capoeira Zumbí dos Palmares (Mestre Alfredo)
4. Moved to Centro Social Urbano (CSU) 1979 with Mestre Gabriel

RELATIONSHIP TO MAJOR DÓRIA''S ACADEMY:
Two parallel capoeira scenes existed in Itabuna:
1. Street tradition → Antônio Rodrigues''s academy (more accessible, popular classes)
2. Elite tradition → Major Dória''s academy (1958) with Maneca Brandão teaching (Bimba student)

Both traditions contributed to the development of capoeira in the region.

AMIR DAS AREIAS CONNECTION:
Amir das Areias gave a course at Academia de Capoeira Nossa Senhora de Fátima.
He later inspired the name CLARATE (Cultura-Luta-Arte-Regional-Angola-Terapia-Esporte).',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1935, década):
Mestre Miguel Preto (n. 29 set 1948) treinou com ele a partir de 1964 aos 16 anos.
Antônio Rodrigues já era estabelecido o suficiente para administrar uma academia nessa época.
Se fundou a academia no início dos anos 1960 quando tinha ~25-30 anos → nascimento ~1930-1940.
Estimativa 1935 com precisão de década.

VARIAÇÕES DO NOME:
- "Antônio Rodrigues" - maioria das fontes
- "Mestre Antônio" - referência informal no artigo do Diário Bahia
- "Antonio Rodrigues" - sem acento

NOTA SOBRE APELIDO:
Nenhum apelido de capoeira distinto encontrado. Usa "Antônio Rodrigues" como identificador.
Isso é incomum—a maioria dos mestres tem apelidos. Possíveis razões:
1. Ele era da geração de transição antes dos apelidos se tornarem padrão
2. As fontes simplesmente não registram seu apelido
3. Seu nome completo funcionava como seu identificador

ALUNOS (confirmados):
- Mestre Miguel Preto (Miguel Machado, n. 29 set 1948 em Piaú, Bahia) - começou 1964, instrutor 1965
- Mestre Lobão (Everaldo Bispo de Souza, n. 7 jun 1952) - treinou anos 1960
- Mestre Régis (n. 27 jun 1957 em Itabuna) - começou aos 8 anos, incentivado pelo irmão Ireneildo Gonçalves de Souza
- Mestre Medicina (Luís Oliveira Rocha, n. 16 dez 1950) - introduzido aos círculos de capoeira ~1965

ALUNOS (indiretos/incertos):
- Mestre China (Josenildo de Sousa Santos) - artigo o menciona na linhagem da academia
  mas seu professor direto parece ser Mestre Gabriel, não Antônio Rodrigues

LINHAGEM DA ACADEMIA:
1. Academia de Capoeira Nossa Senhora de Fátima (Antônio Rodrigues)
2. Academia de Capoeira e Cultura Física de Itabuna (Mestre Gabriel)
3. Capoeira Zumbí dos Palmares (Mestre Alfredo)
4. Mudou para o Centro Social Urbano (CSU) 1979 com Mestre Gabriel

RELAÇÃO COM A ACADEMIA DO MAJOR DÓRIA:
Duas cenas paralelas de capoeira existiam em Itabuna:
1. Tradição de rua → academia de Antônio Rodrigues (mais acessível, aulas populares)
2. Tradição de elite → academia do Major Dória (1958) com Maneca Brandão ensinando (aluno de Bimba)

Ambas as tradições contribuíram para o desenvolvimento da capoeira na região.

CONEXÃO COM AMIR DAS AREIAS:
Amir das Areias deu um curso na Academia de Capoeira Nossa Senhora de Fátima.
Ele mais tarde inspirou o nome CLARATE (Cultura-Luta-Arte-Regional-Angola-Terapia-Esporte).'
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

-- Source: entities/persons/baiano-canjiquinha.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Baiano (Canjiquinha)
-- Generated: 2026-01-03
-- ============================================================
-- Uses apelido_context 'Canjiquinha' to distinguish from other
-- mestres named Baiano.
-- ============================================================
-- BIRTH DATE: August 30, 1945 (exact) per capoeiraengenho.wordpress.com
-- (discrepancy: user notes say ~1944, but official group site says 1945)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Edvaldo dos Santos Reis',
  'Baiano',
  'Canjiquinha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeiraengenho.wordpress.com/mestres-cmestres/m-baiano/', 'https://capoeira.iphan.gov.br/grupo/infor/69']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Trained in both Angola (under Canjiquinha) and Regional (completed Bimba''s course 1962). As a professor of folk dances and Afro Dance graduate from Rio Academy, integrated capoeira with broader Afro-Brazilian dance traditions. His group Capoeira Engenho teaches a synthesis approach drawing from both traditions.',
  E'Treinado tanto em Angola (sob Canjiquinha) quanto em Regional (completou o curso de Bimba em 1962). Como professor de danças folclóricas e graduado em Dança Afro pela Academia Rio, integrou a capoeira com tradições mais amplas de dança afro-brasileira. Seu grupo Capoeira Engenho ensina uma abordagem de síntese extraindo de ambas as tradições.',
  -- Life dates
  1945,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio)
  E'Edvaldo dos Santos Reis was born on August 30, 1945, in Salvador, Bahia, the son of Jacinto José dos Reis and Alice Apostola dos Santos. At just ten years old, he began learning capoeira from Washington Bruno da Silva—Mestre Canjiquinha, known as "a alegria da capoeira" (the joy of capoeira). This seven-year apprenticeship (1955-1962) under one of capoeira''s most innovative and beloved mestres would shape his entire life.

In 1962, Edvaldo also completed a Regional Capoeira course administered by Mestre Bimba in Salvador, expanding his technical repertoire beyond his Angola foundation. That same year, he entered military service as a fuzileiro naval (naval marine) in Bahia and later transferred to Rio de Janeiro—a move that would define the trajectory of his life''s work.

While in Rio de Janeiro, Edvaldo pursued formal dance education, graduating in Afro Dance from Academia Rio. This training enabled him to understand capoeira within the broader context of African diaspora movement traditions and positioned him as both a martial artist and a cultural educator.

On January 1, 1970, Edvaldo founded the Associação de Capoeira Engenho (ACE) in the then-state of Guanabara (now Rio de Janeiro). The organization became a pioneering institution in the post-capital federal era, actively participating in the structuring of capoeira''s legal and sporting framework. Edvaldo contributed directly to drafting the bylaws and regulations for capoeira through the Confederação Brasileira de Pugilismo in Rio de Janeiro.

His performance career took him across the globe. As a professor of folk dances, he participated in show groups including Rio Antigo, Palmares, Postais da Bahia, and Brasil Canta e Dança. As a cultural promoter, he brought capoeira performances to more than 30 countries. One of his most celebrated moments came during a New Year''s celebration at the palace of King Hassan II of Morocco, where he received a standing ovation from the monarch himself.

As a composer, Edvaldo created numerous songs that were adopted in capoeira rodas throughout Brazil and abroad, though specific titles remain undocumented in available sources.

In Rio de Janeiro, Edvaldo developed intensive work with samba schools, particularly the famous Salgueiro, for more than 15 years. His activities blended capoeira with Afro dance instruction. He also worked at SESC Tijuca for over 20 years, developing programs for seniors, children, teenagers, adolescents, and university students.

In 1995, ACE began work in the Costa Barros neighborhood, gaining community recognition by 1996. The organization has grown into a major cultural institution with 8 mestres, 20 contra-mestres, and 40 instructors. It has expanded to multiple Brazilian states (Bahia, São Paulo, Alagoas) and international locations (Italy, Spain, Germany, Greece, Holland, Argentina).

In 1996, Edvaldo received the title of Capoeira Master with the White Cord—representing 30 years as a Capoeira Master—from the Federação de Capoeira do Estado do Rio de Janeiro.

At the VI Rede Capoeira event in January 2025 (January 22-25, at Doca 1, Polo de Economia Criativa, Comércio, Salvador), Mestre Baiano—now over 80 years old—received the Sankofa trophy as a "herói popular" (popular hero). He was honored alongside fellow octogenarian mestres Virgílio da Fazenda Grande, Boa Gente, Fernando de Saubara, and Nô. The Sankofa symbol—an African bird with its head turned backwards—represents returning to the past to resignify the present and build the future.

His son, Antonio Marcos dos A. Reis (Mestre Grandão), continues his legacy, having trained under his father from childhood and now coordinating capoeira activities throughout Camaçari, Bahia.',
  -- bio_pt
  E'Edvaldo dos Santos Reis nasceu em 30 de agosto de 1945, em Salvador, Bahia, filho de Jacinto José dos Reis e Alice Apostola dos Santos. Com apenas dez anos de idade, começou a aprender capoeira com Washington Bruno da Silva—Mestre Canjiquinha, conhecido como "a alegria da capoeira". Este aprendizado de sete anos (1955-1962) sob um dos mestres mais inovadores e amados da capoeira moldaria toda a sua vida.

Em 1962, Edvaldo também completou um curso de Capoeira Regional administrado por Mestre Bimba em Salvador, expandindo seu repertório técnico além de sua base de Angola. No mesmo ano, entrou no serviço militar como fuzileiro naval na Bahia e depois foi transferido para o Rio de Janeiro—uma mudança que definiria a trajetória do trabalho de sua vida.

Enquanto estava no Rio de Janeiro, Edvaldo buscou educação formal em dança, graduando-se em Dança Afro pela Academia Rio. Este treinamento permitiu que ele entendesse a capoeira dentro do contexto mais amplo das tradições de movimento da diáspora africana e o posicionou tanto como artista marcial quanto como educador cultural.

Em 1º de janeiro de 1970, Edvaldo fundou a Associação de Capoeira Engenho (ACE) no então estado da Guanabara (atual Rio de Janeiro). A organização tornou-se uma instituição pioneira na era pós-capital federal, participando ativamente da estruturação do enquadramento legal e esportivo da capoeira. Edvaldo contribuiu diretamente para a redação dos estatutos e regulamentos da capoeira através da Confederação Brasileira de Pugilismo no Rio de Janeiro.

Sua carreira de apresentações o levou ao redor do mundo. Como professor de danças folclóricas, participou de grupos de show incluindo Rio Antigo, Palmares, Postais da Bahia e Brasil Canta e Dança. Como promotor cultural, levou espetáculos de capoeira para mais de 30 países. Um de seus momentos mais celebrados veio durante uma celebração de Ano Novo no palácio do Rei Hassan II do Marrocos, onde recebeu uma ovação de pé do próprio monarca.

Como compositor, Edvaldo criou numerosas músicas que foram adotadas em rodas de capoeira por todo o Brasil e no exterior, embora títulos específicos permaneçam sem documentação nas fontes disponíveis.

No Rio de Janeiro, Edvaldo desenvolveu trabalho intenso com escolas de samba, particularmente a famosa Salgueiro, por mais de 15 anos. Suas atividades mesclavam capoeira com instrução de dança afro. Ele também trabalhou no SESC Tijuca por mais de 20 anos, desenvolvendo programas para idosos, crianças, adolescentes e estudantes universitários.

Em 1995, a ACE começou um trabalho no bairro de Costa Barros, ganhando reconhecimento das comunidades em 1996. A organização cresceu para se tornar uma grande instituição cultural com 8 mestres, 20 contra-mestres e 40 instrutores. Expandiu-se para múltiplos estados brasileiros (Bahia, São Paulo, Alagoas) e localidades internacionais (Itália, Espanha, Alemanha, Grécia, Holanda, Argentina).

Em 1996, Edvaldo recebeu o título de Mestre de Capoeira com a Corda Branca—representando 30 anos como Mestre de Capoeira—da Federação de Capoeira do Estado do Rio de Janeiro.

No VI Rede Capoeira em janeiro de 2025 (22-25 de janeiro, na Doca 1, Polo de Economia Criativa, Comércio, Salvador), Mestre Baiano—agora com mais de 80 anos—recebeu o troféu Sankofa como "herói popular". Foi homenageado ao lado dos mestres octogenários Virgílio da Fazenda Grande, Boa Gente, Fernando de Saubara e Nô. O símbolo Sankofa—um pássaro africano com a cabeça voltada para trás—representa retornar ao passado para ressignificar o presente e construir o futuro.

Seu filho, Antonio Marcos dos A. Reis (Mestre Grandão), continua seu legado, tendo treinado sob seu pai desde a infância e agora coordenando atividades de capoeira por todo Camaçari, Bahia.',
  -- achievements
  E'1955: Began training under Mestre Canjiquinha in Salvador (age 10)
1962: Completed Mestre Bimba''s Regional Capoeira course in Salvador
1962: Entered military service as fuzileiro naval in Bahia, later Rio de Janeiro
~1960s: Graduated in Afro Dance from Academia Rio, Rio de Janeiro
1970: Founded Associação de Capoeira Engenho (January 1)
~1970s: Active participation in drafting capoeira bylaws with Confederação Brasileira de Pugilismo
~1970s-1990s: Performed capoeira shows in 30+ countries
~1980s: Received standing ovation from King Hassan II of Morocco at New Year''s palace celebration
1981-1996: Worked with Salgueiro samba school (15+ years)
~1990s-2010s: Taught at SESC Tijuca (20+ years)
1996: Received title of Capoeira Master with White Cord (30 years as mestre) from FCERJ
2025: Received Sankofa trophy as "popular hero" at VI Rede Capoeira (January)',
  -- achievements_pt
  E'1955: Iniciou treinamento com Mestre Canjiquinha em Salvador (10 anos)
1962: Completou o curso de Capoeira Regional de Mestre Bimba em Salvador
1962: Entrou no serviço militar como fuzileiro naval na Bahia, depois Rio de Janeiro
~1960s: Graduou-se em Dança Afro pela Academia Rio, Rio de Janeiro
1970: Fundou a Associação de Capoeira Engenho (1º de janeiro)
~1970s: Participação ativa na elaboração dos estatutos da capoeira com a Confederação Brasileira de Pugilismo
~1970s-1990s: Apresentou espetáculos de capoeira em 30+ países
~1980s: Recebeu ovação de pé do Rei Hassan II do Marrocos em celebração de Ano Novo no palácio
1981-1996: Trabalhou com a escola de samba Salgueiro (15+ anos)
~1990s-2010s: Ensinou no SESC Tijuca (20+ anos)
1996: Recebeu título de Mestre de Capoeira com Corda Branca (30 anos como mestre) da FCERJ
2025: Recebeu troféu Sankofa como "herói popular" no VI Rede Capoeira (janeiro)',
  -- notes (researcher metadata)
  E'BIRTH DATE: August 30, 1945 per capoeiraengenho.wordpress.com. User input suggested ~1944, but official group site confirms 1945.

PARENTS: Jacinto José dos Reis and Alice Apostola dos Santos

TEACHERS:
- Mestre Canjiquinha (Washington Bruno da Silva) - primary teacher, 1955-1962, Salvador
- Mestre Bimba (Manoel dos Reis Machado) - Regional course, 1962, Salvador

STUDENTS (notable):
- Mestre Grandão (Antonio Marcos dos A. Reis) - son, trained from childhood
- Mestre Chaminé (documented on Capoeira Engenho website)
- Multiple mestres, contra-mestres through ACE organization

APELIDO: "Baiano" - common in capoeira for practitioners from Bahia who settle elsewhere; uses apelido_context ''Canjiquinha'' to distinguish from other Baianos (there are multiple mestres named Baiano)

MILITARY SERVICE: Fuzileiro naval (Brazilian Marine) in Bahia and Rio de Janeiro

ORGANIZATION STATS (as of 2017 IPHAN registry):
- 8 mestres, 20 contra-mestres, 40 instructors, 5 formally trained students
- Registered as "Ponto de Cultura" (official cultural recognition)
- Headquarters: Rua Cândido Macedo Júnior, 8, Costa Barros, Rio de Janeiro (CEP 21532-190)
- CNPJ: 03.932.540/0001-00 (registered 30/06/2000)

VI REDE CAPOEIRA 2025 HONOREES:
- Mestre Virgílio da Fazenda Grande
- Mestre Boa Gente (Vivaldo Conceição Rodrigues)
- Mestre Fernando de Saubara (Antônio Fernando da Silva)
- Mestre Baiano (Edvaldo dos Santos Reis) - this profile
- Mestre Nô (Norival Moreira de Oliveira)
Event dates: January 22-25, 2025, Doca 1, Polo de Economia Criativa, Salvador',
  -- notes_pt
  E'DATA DE NASCIMENTO: 30 de agosto de 1945 conforme capoeiraengenho.wordpress.com. Entrada do usuário sugeriu ~1944, mas site oficial do grupo confirma 1945.

PAIS: Jacinto José dos Reis e Alice Apostola dos Santos

MESTRES:
- Mestre Canjiquinha (Washington Bruno da Silva) - mestre principal, 1955-1962, Salvador
- Mestre Bimba (Manoel dos Reis Machado) - curso Regional, 1962, Salvador

ALUNOS (notáveis):
- Mestre Grandão (Antonio Marcos dos A. Reis) - filho, treinou desde a infância
- Mestre Chaminé (documentado no site Capoeira Engenho)
- Múltiplos mestres, contra-mestres através da organização ACE

APELIDO: "Baiano" - comum na capoeira para praticantes da Bahia que se estabelecem em outros lugares; usa apelido_context ''Canjiquinha'' para distinguir de outros Baianos (existem múltiplos mestres chamados Baiano)

SERVIÇO MILITAR: Fuzileiro naval na Bahia e Rio de Janeiro

ESTATÍSTICAS DA ORGANIZAÇÃO (conforme registro IPHAN 2017):
- 8 mestres, 20 contra-mestres, 40 instrutores, 5 alunos formalmente treinados
- Registrado como "Ponto de Cultura" (reconhecimento cultural oficial)
- Sede: Rua Cândido Macedo Júnior, 8, Costa Barros, Rio de Janeiro (CEP 21532-190)
- CNPJ: 03.932.540/0001-00 (registrado 30/06/2000)

HOMENAGEADOS VI REDE CAPOEIRA 2025:
- Mestre Virgílio da Fazenda Grande
- Mestre Boa Gente (Vivaldo Conceição Rodrigues)
- Mestre Fernando de Saubara (Antônio Fernando da Silva)
- Mestre Baiano (Edvaldo dos Santos Reis) - este perfil
- Mestre Nô (Norival Moreira de Oliveira)
Datas do evento: 22-25 de janeiro de 2025, Doca 1, Polo de Economia Criativa, Salvador'
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

-- Source: entities/persons/bruno-hermanny.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bruno Hermanny
-- Generated: 2026-01-02
-- ============================================================
-- Bruno de Otero Hermanny was primarily known as a champion
-- underwater fisherman (2x world champion) and multi-sport
-- athlete. He trained under Mestre Sinhozinho at his Ipanema
-- academies in the mid-1940s alongside his brother Rudolf.
-- While Rudolf became famous as a capoeira fighter, Bruno's
-- athletic career took him toward aquatic sports.
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Bruno de Otero Hermanny',
  'Bruno Hermanny',
  NULL,  -- No formal capoeira title
  NULL,  -- No public domain portrait found
  ARRAY['https://pt.wikipedia.org/wiki/Bruno_Hermanny', 'https://rohermanny.tripod.com/']::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'Bruno Hermanny trained in capoeira carioca under Mestre Sinhozinho at his Ipanema academies during the mid-1940s. Like other students of Sinhozinho, his training would have encompassed the combat-focused approach characteristic of capoeira carioca, which incorporated elements of wrestling, boxing, and practical fighting techniques alongside traditional capoeira movements.',
  E'Bruno Hermanny treinou capoeira carioca sob Mestre Sinhozinho em suas academias em Ipanema durante meados da década de 1940. Como outros alunos de Sinhozinho, seu treinamento teria abrangido a abordagem focada em combate característica da capoeira carioca, que incorporava elementos de luta livre, boxe e técnicas práticas de combate junto com movimentos tradicionais de capoeira.',
  -- Life dates
  1932,
  'exact'::genealogy.date_precision,
  'São Paulo, Brazil',
  1992,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Bruno de Otero Hermanny was born on December 26, 1932, in São Paulo. At the age of six, he moved with his family to Rio de Janeiro, where he would develop into one of Brazil''s most versatile athletes and, to this day, remains the only Brazilian two-time individual world champion in underwater fishing (spearfishing).

Bruno was one of the children of Arthur Hermanny and Elisabeth de Otero. His siblings included Rudolf de Otero Hermanny, who would become famous as a capoeira fighter under Mestre Sinhozinho; Thereza de Otero Hermanny (1930-2015), who married the legendary composer Tom Jobim in 1949; and Corina Hermanny Freire.

During the mid-1940s, Bruno trained at Mestre Sinhozinho''s academies in Ipanema alongside his brother Rudolf. Sinhozinho''s club in Ipanema was a training ground for the wealthy youth of the neighborhood, offering weight lifting, apparatus gymnastics, boxing, capoeira, and other physical disciplines. While Rudolf would go on to represent Sinhozinho in famous challenge fights against Mestre Bimba''s students (1949) and the Gracie family (1953), Bruno channeled his athleticism into aquatic sports.

Bruno''s first contact with swimming came at the Clube Germânia (now Esporte Clube Pinheiros) in São Paulo. After moving to Rio, he was taken to Fluminense Futebol Clube for a swimming test and remained there for several years training and competing in speed events. He was part of teams that won State, National, and South American championships (1954), swimming alongside João Gonçalves, Aran Boghossian, and Tetsujo Okamoto.

When he turned 18, Bruno enlisted in military service. While serving in the army, he was called up for two World Championships in Modern Pentathlon, where he distinguished himself in the swimming and equestrian events.

However, it was in underwater fishing that Bruno achieved his greatest success. In 1952, he organized the first Brazilian spearfishing championship in Angra dos Reis. He won State and National championships, and in 1960 claimed his first World Championship title in Italy. In 1963, he won his second World Championship in Rio de Janeiro, making him the only Brazilian to win the individual world title twice in the sport.

Bruno''s 1960 world championship earned him a cover on the January 14, 1961 edition of O Cruzeiro magazine, alongside Pelé (football), Éder Jofre (boxing), and Maria Esther Bueno (tennis) - a feature projecting the careers of Brazil''s four greatest athletes of the moment. In 1953, he was instrumental in the founding of the Confederação Brasileira de Caça Submarina (Brazilian Underwater Fishing Confederation).

Bruno de Otero Hermanny died on February 20, 1992, in Rio de Janeiro. In his honor, the Iate Clube do Rio de Janeiro hosts an annual tournament bearing his name, the Torneio Bruno Hermanny, celebrating the greatest Brazilian ever to compete in the sport.',
  -- bio_pt
  E'Bruno de Otero Hermanny nasceu em 26 de dezembro de 1932 em São Paulo. Aos seis anos de idade, mudou com sua família para o Rio de Janeiro, onde se tornaria um dos atletas mais versáteis do Brasil e, até hoje, permanece como o único brasileiro bicampeão mundial individual de pesca subaquática.

Bruno era um dos filhos de Arthur Hermanny e Elisabeth de Otero. Seus irmãos incluíam Rudolf de Otero Hermanny, que se tornaria famoso como lutador de capoeira sob Mestre Sinhozinho; Thereza de Otero Hermanny (1930-2015), que se casou com o lendário compositor Tom Jobim em 1949; e Corina Hermanny Freire.

Durante meados da década de 1940, Bruno treinou nas academias de Mestre Sinhozinho em Ipanema ao lado de seu irmão Rudolf. O clube de Sinhozinho em Ipanema era um campo de treinamento para a juventude abastada do bairro, oferecendo levantamento de peso, ginástica em aparelhos, boxe, capoeira e outras disciplinas físicas. Enquanto Rudolf iria representar Sinhozinho em famosas lutas de desafio contra os alunos de Mestre Bimba (1949) e a família Gracie (1953), Bruno canalizou seu atletismo para os esportes aquáticos.

O primeiro contato de Bruno com a natação foi no Clube Germânia (atual Esporte Clube Pinheiros) em São Paulo. Após mudar para o Rio, foi levado ao Fluminense Futebol Clube para um teste de natação e lá permaneceu por vários anos treinando e competindo em provas de velocidade. Fez parte de equipes campeãs em nível Estadual, Nacional e Sul-Americano (1954), nadando ao lado de João Gonçalves, Aran Boghossian e Tetsujo Okamoto.

Quando completou 18 anos, Bruno alistou-se no serviço militar. Enquanto servia no exército, foi convocado para dois Campeonatos Mundiais de Pentatlo Moderno, onde se destacou nas provas de natação e equitação.

Porém, foi na pesca subaquática que Bruno alcançou seu maior sucesso. Em 1952, organizou o primeiro campeonato brasileiro de pesca subaquática em Angra dos Reis. Venceu campeonatos Estaduais e Nacionais, e em 1960 conquistou seu primeiro título de Campeão Mundial na Itália. Em 1963, venceu seu segundo Campeonato Mundial no Rio de Janeiro, tornando-se o único brasileiro a conquistar o título mundial individual duas vezes no esporte.

O campeonato mundial de 1960 rendeu a Bruno uma capa na edição de 14 de janeiro de 1961 da revista O Cruzeiro, ao lado de Pelé (futebol), Éder Jofre (boxe) e Maria Esther Bueno (tênis) - uma reportagem projetando as carreiras dos quatro maiores atletas brasileiros do momento. Em 1953, foi fundamental na fundação da Confederação Brasileira de Caça Submarina.

Bruno de Otero Hermanny faleceu em 20 de fevereiro de 1992 no Rio de Janeiro. Em sua homenagem, o Iate Clube do Rio de Janeiro realiza anualmente um torneio que leva seu nome, o Torneio Bruno Hermanny, celebrando o maior brasileiro a competir no esporte.',
  -- achievements_en
  'Trained in capoeira carioca under Mestre Sinhozinho at Ipanema academies (mid-1940s); South American Swimming Champion with Fluminense FC (1954); Brazilian Modern Pentathlon representative at 2 World Championships; Organized first Brazilian spearfishing championship in Angra dos Reis (1952); Two-time Individual World Champion in Underwater Fishing (1960 Italy, 1963 Rio de Janeiro) - only Brazilian to achieve this; Featured on O Cruzeiro magazine cover with Pelé, Éder Jofre, and Maria Esther Bueno (January 14, 1961); Founding member of Confederação Brasileira de Caça Submarina (1953); Torneio Bruno Hermanny held annually in his honor at Iate Clube do Rio de Janeiro',
  -- achievements_pt
  'Treinou capoeira carioca sob Mestre Sinhozinho em academias em Ipanema (meados da década de 1940); Campeão Sul-Americano de Natação com Fluminense FC (1954); Representante brasileiro de Pentatlo Moderno em 2 Campeonatos Mundiais; Organizou o primeiro campeonato brasileiro de pesca subaquática em Angra dos Reis (1952); Bicampeão Mundial Individual de Pesca Subaquática (1960 Itália, 1963 Rio de Janeiro) - único brasileiro a conquistar; Capa da revista O Cruzeiro ao lado de Pelé, Éder Jofre e Maria Esther Bueno (14 de janeiro de 1961); Membro fundador da Confederação Brasileira de Caça Submarina (1953); Torneio Bruno Hermanny realizado anualmente em sua homenagem no Iate Clube do Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH DATE (December 26, 1932): Confirmed by Portuguese Wikipedia article.

DEATH DATE (February 20, 1992): Confirmed by Portuguese Wikipedia article; died in Rio de Janeiro.

FAMILY: Bruno was one of the children of Arthur Hermanny and Elisabeth de Otero. Siblings included:
- Rudolf de Otero Hermanny (born August 16, 1931) - famous capoeira fighter under Sinhozinho
- Thereza de Otero Hermanny (1930-2015) - married Tom Jobim in 1949
- Corina Hermanny Freire
Family connection confirmed by legal documents from Diário de Justiça do Rio de Janeiro listing "Thereza de Otero Hermanny e outros" including Rudolf, Bruno, and Corina.

CAPOEIRA TRAINING: Listed among Sinhozinho''s students on rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..." Training period estimated mid-1940s based on his age and family move to Rio (1938/39).

ATHLETIC CAREER:
- Swimming: Fluminense FC, South American champion 1954
- Modern Pentathlon: 2 World Championships while in military
- Underwater Fishing: 2x World Champion (1960, 1963)

MEDIA:
- O Cruzeiro magazine cover, January 14, 1961 (with Pelé, Éder Jofre, Maria Esther Bueno)

LEGACY:
- Torneio Bruno Hermanny - annual spearfishing tournament at Iate Clube do Rio de Janeiro
- In 2024, Rio de Janeiro hosted CMAS World Cup of Clubs 61 years after Bruno''s 1963 victory

SOURCES:
- Portuguese Wikipedia: Bruno Hermanny
- rohermanny.tripod.com (Sinhozinho tribute site by Rudolf Hermanny)
- Jusbrasil legal records (family confirmation)
- ICRJ website (Torneio Bruno Hermanny)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO (26 de dezembro de 1932): Confirmado pelo artigo da Wikipedia em português.

DATA DE FALECIMENTO (20 de fevereiro de 1992): Confirmado pelo artigo da Wikipedia em português; faleceu no Rio de Janeiro.

FAMÍLIA: Bruno era um dos filhos de Arthur Hermanny e Elisabeth de Otero. Irmãos incluíam:
- Rudolf de Otero Hermanny (nascido 16 de agosto de 1931) - famoso lutador de capoeira sob Sinhozinho
- Thereza de Otero Hermanny (1930-2015) - casou com Tom Jobim em 1949
- Corina Hermanny Freire
Conexão familiar confirmada por documentos legais do Diário de Justiça do Rio de Janeiro listando "Thereza de Otero Hermanny e outros" incluindo Rudolf, Bruno e Corina.

TREINAMENTO DE CAPOEIRA: Listado entre os alunos de Sinhozinho em rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..." Período de treinamento estimado meados da década de 1940 baseado em sua idade e mudança da família para o Rio (1938/39).

CARREIRA ATLÉTICA:
- Natação: Fluminense FC, campeão sul-americano 1954
- Pentatlo Moderno: 2 Campeonatos Mundiais enquanto no exército
- Pesca Subaquática: 2x Campeão Mundial (1960, 1963)

MÍDIA:
- Capa da revista O Cruzeiro, 14 de janeiro de 1961 (com Pelé, Éder Jofre, Maria Esther Bueno)

LEGADO:
- Torneio Bruno Hermanny - torneio anual de pesca subaquática no Iate Clube do Rio de Janeiro
- Em 2024, Rio de Janeiro sediou Copa do Mundo de Clubes CMAS 61 anos após a vitória de Bruno em 1963

FONTES:
- Wikipedia em português: Bruno Hermanny
- rohermanny.tripod.com (site de tributo a Sinhozinho por Rudolf Hermanny)
- Jusbrasil registros legais (confirmação familiar)
- Site do ICRJ (Torneio Bruno Hermanny)'
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

-- Source: entities/persons/bulgario.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bulgário
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- No birth date documented. Active at Gengibirra/Liberdade roda
-- pre-1941 as an established mestre alongside contemporaries like
-- Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894).
-- If active as a mestre in the 1930s, likely born ~1890-1910.
-- Using 1900 as midpoint estimate with decade precision.
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
  'Bulgário',
  NULL,  -- No formal title documented
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola. Bulgário was part of the Sunday gatherings at Gengibirra/Liberdade where practitioners played "not worrying about the styles of the fight or about the exhibition" - suggesting an informal, traditional approach focused on the pure practice of capoeira angola.',
  E'Capoeira de Angola tradicional. Bulgário fazia parte das reuniões dominicais no Gengibirra/Liberdade onde os praticantes jogavam "sem se preocupar com os estilos de luta ou com a exibição" - sugerindo uma abordagem informal e tradicional focada na prática pura da capoeira angola.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Bulgário was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of traditional capoeira angola practitioners who gathered at the Liberdade/Gengibirra neighborhood in Salvador before the formalization of capoeira academies.

The primary documentation of Bulgário comes from a 1969 newspaper article in A Tarde commemorating the anniversary of Mestre Pastinha''s academy. The article described the informal Sunday gatherings at Gengibirra where "many capoeiristas got together on Sundays to play capoeira de Angola, not worrying about the styles of the fight or about the exhibition." They formed an "academia" (in the informal sense of a regular gathering), presided over by the civil guard Amorzinho.

Bulgário is listed among the mestres who participated in this gathering, alongside Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Barbosa, Américo Ciência, Domingos Magalhães, Eulâmpio, Butique, and others. This places him among a notable generation of capoeira angola practitioners.

Notably, while Bulgário participated in the Liberdade roda, he was not among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola listed in Mestre Noronha''s manuscripts. Those founders included Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno, and Paquete do Cabula. This suggests Bulgário was a regular participant in the rodas but not an organizational founder of the formal centro.

In 1941, Mestre Pastinha was invited to witness the Sunday roda at Gengibirra by his former student Aberrê. The civil guard Amorzinho then handed leadership of the group to Pastinha, who founded the Centro Esportivo de Capoeira Angola (CECA). What became of Bulgário after this transition is undocumented.

Bulgário''s apelido is unusual in Portuguese - it is the adjective form of "Bulgária" (Bulgaria). How he acquired this nickname and its significance remain unknown.',
  -- bio_pt
  E'Bulgário foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de praticantes tradicionais de capoeira angola que se reuniam no bairro da Liberdade/Gengibirra em Salvador antes da formalização das academias de capoeira.

A documentação principal de Bulgário vem de um artigo de jornal de 1969 no A Tarde comemorando o aniversário da academia de Mestre Pastinha. O artigo descrevia as reuniões informais de domingo no Gengibirra onde "muitos capoeiristas se reuniam aos domingos para jogar capoeira de Angola, sem se preocupar com os estilos de luta ou com a exibição." Eles formavam uma "academia" (no sentido informal de uma reunião regular), presidida pelo guarda civil Amorzinho.

Bulgário é listado entre os mestres que participavam dessa reunião, junto com Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Barbosa, Américo Ciência, Domingos Magalhães, Eulâmpio, Butique e outros. Isso o coloca entre uma geração notável de praticantes de capoeira angola.

Notavelmente, embora Bulgário participasse da roda da Liberdade, ele não estava entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola listados nos manuscritos de Mestre Noronha. Esses fundadores incluíam Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno e Paquete do Cabula. Isso sugere que Bulgário era um participante regular das rodas mas não um fundador organizacional do centro formal.

Em 1941, Mestre Pastinha foi convidado a assistir à roda de domingo no Gengibirra por seu antigo aluno Aberrê. O guarda civil Amorzinho então passou a liderança do grupo para Pastinha, que fundou o Centro Esportivo de Capoeira Angola (CECA). O que aconteceu com Bulgário após essa transição não está documentado.

O apelido de Bulgário é incomum em português - é a forma adjetiva de "Bulgária". Como ele adquiriu esse apelido e seu significado permanecem desconhecidos.',
  -- achievements_en
  NULL,  -- No documented achievements
  -- achievements_pt
  NULL,
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade precision):
No birth date documented. Active at Gengibirra/Liberdade roda pre-1941 as an established participant alongside contemporaries like Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). If active as a practitioner in the 1930s, likely born ~1890-1910. Using 1900 as midpoint estimate.

DEATH YEAR: Unknown. Not listed among Pastinha''s 1967 list of deceased angoleiros de briga, but this does not confirm he was alive at that time.

DOCUMENTATION: Single primary source only - A Tarde newspaper article, February 24, 1969, reproduced at velhosmestres.com. No additional biographical information found in any other source.

NOT A GENGIBIRRA FOUNDER: While Bulgário participated in the Liberdade roda, he is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola in Mestre Noronha''s manuscripts. This suggests different levels of involvement: the 22 founders were organizational leaders, while others like Bulgário were regular participants in the rodas.

APELIDO: "Bulgário" is the Portuguese adjective meaning "Bulgarian". The origin of this nickname is unknown. It could reference physical characteristics, an association with Bulgaria, or have another origin lost to history.

CONTEMPORARIES AT GENGIBIRRA:
- Amorzinho (civil guard, roda president) - imported
- Totonho de Maré (Antônio Laurindo das Neves) - imported
- Mestre Noronha (Daniel Coutinho) - imported
- Livino (brother of Noronha) - imported
- Américo Ciência - imported
- Barbosa - imported
- Eulâmpio - imported
- Alemão - NOT imported (needs backlog)
- Domingos Magalhães - imported
- Butique - imported
- Antônio - unclear which Antônio, needs investigation',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década):
Nenhuma data de nascimento documentada. Ativo na roda do Gengibirra/Liberdade antes de 1941 como participante estabelecido junto com contemporâneos como Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). Se ativo como praticante na década de 1930, provavelmente nascido ~1890-1910. Usando 1900 como estimativa do ponto médio.

ANO DE MORTE: Desconhecido. Não listado entre a lista de 1967 de Pastinha de angoleiros de briga falecidos, mas isso não confirma que estava vivo naquela época.

DOCUMENTAÇÃO: Apenas uma fonte primária - artigo do jornal A Tarde, 24 de fevereiro de 1969, reproduzido em velhosmestres.com. Nenhuma informação biográfica adicional encontrada em qualquer outra fonte.

NÃO É FUNDADOR DO GENGIBIRRA: Embora Bulgário participasse da roda da Liberdade, ele NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola nos manuscritos de Mestre Noronha. Isso sugere diferentes níveis de envolvimento: os 22 fundadores eram líderes organizacionais, enquanto outros como Bulgário eram participantes regulares das rodas.

APELIDO: "Bulgário" é o adjetivo português significando "búlgaro". A origem deste apelido é desconhecida. Poderia referenciar características físicas, uma associação com a Bulgária, ou ter outra origem perdida na história.

CONTEMPORÂNEOS NO GENGIBIRRA:
- Amorzinho (guarda civil, presidente da roda) - importado
- Totonho de Maré (Antônio Laurindo das Neves) - importado
- Mestre Noronha (Daniel Coutinho) - importado
- Livino (irmão de Noronha) - importado
- Américo Ciência - importado
- Barbosa - importado
- Eulâmpio - importado
- Alemão - NÃO importado (precisa backlog)
- Domingos Magalhães - importado
- Butique - importado
- Antônio - não está claro qual Antônio, precisa investigação'
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

-- Source: entities/persons/butique.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Butique
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- No birth date documented. Active at Gengibirra/Liberdade roda
-- pre-1941 as a participant alongside contemporaries like
-- Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894).
-- If active as a practitioner in the 1930s, likely born ~1890-1910.
-- Using 1900 as midpoint estimate with decade precision.
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
  'Butique',
  NULL,  -- No formal title documented
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola. Butique was part of the Sunday gatherings at Gengibirra/Liberdade where practitioners played "not worrying about the styles of the fight or about the exhibition" - suggesting an informal, traditional approach focused on the pure practice of capoeira angola.',
  E'Capoeira de Angola tradicional. Butique fazia parte das reuniões dominicais no Gengibirra/Liberdade onde os praticantes jogavam "sem se preocupar com os estilos de luta ou com a exibição" - sugerindo uma abordagem informal e tradicional focada na prática pura da capoeira angola.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Butique was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of traditional capoeira angola practitioners who gathered at the Liberdade/Gengibirra neighborhood in Salvador before the formalization of capoeira academies.

The primary documentation of Butique comes from a 1969 newspaper article in A Tarde commemorating the anniversary of Mestre Pastinha''s academy. The article described the informal Sunday gatherings at Gengibirra where "many capoeiristas got together on Sundays to play capoeira de Angola, not worrying about the styles of the fight or about the exhibition." They formed an "academia" (in the informal sense of a regular gathering), presided over by the civil guard Amorzinho.

Butique is listed among the mestres who participated in this gathering, alongside Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, Eulâmpio, and others. This places him among a notable generation of capoeira angola practitioners.

Notably, while Butique participated in the Liberdade roda, he was not among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola listed in Mestre Noronha''s manuscripts. Those founders included Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno, and Paquete do Cabula. This suggests Butique was a regular participant in the rodas but not an organizational founder of the formal centro.

In 1941, Mestre Pastinha was invited to witness the Sunday roda at Gengibirra by his former student Aberrê. The civil guard Amorzinho then handed leadership of the group to Pastinha, who founded the Centro Esportivo de Capoeira Angola (CECA). What became of Butique after this transition is undocumented.

Butique''s apelido means "boutique" or "small elegant shop" in Portuguese. The name may suggest he owned or worked at such an establishment, though the origin of his nickname remains speculative.',
  -- bio_pt
  E'Butique foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de praticantes tradicionais de capoeira angola que se reuniam no bairro da Liberdade/Gengibirra em Salvador antes da formalização das academias de capoeira.

A documentação principal de Butique vem de um artigo de jornal de 1969 no A Tarde comemorando o aniversário da academia de Mestre Pastinha. O artigo descrevia as reuniões informais de domingo no Gengibirra onde "muitos capoeiristas se reuniam aos domingos para jogar capoeira de Angola, sem se preocupar com os estilos de luta ou com a exibição." Eles formavam uma "academia" (no sentido informal de uma reunião regular), presidida pelo guarda civil Amorzinho.

Butique é listado entre os mestres que participavam dessa reunião, junto com Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, Eulâmpio e outros. Isso o coloca entre uma geração notável de praticantes de capoeira angola.

Notavelmente, embora Butique participasse da roda da Liberdade, ele não estava entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola listados nos manuscritos de Mestre Noronha. Esses fundadores incluíam Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno e Paquete do Cabula. Isso sugere que Butique era um participante regular das rodas mas não um fundador organizacional do centro formal.

Em 1941, Mestre Pastinha foi convidado a assistir à roda de domingo no Gengibirra por seu antigo aluno Aberrê. O guarda civil Amorzinho então passou a liderança do grupo para Pastinha, que fundou o Centro Esportivo de Capoeira Angola (CECA). O que aconteceu com Butique após essa transição não está documentado.

O apelido de Butique significa "loja pequena e elegante" em português. O nome pode sugerir que ele possuía ou trabalhava em tal estabelecimento, embora a origem de seu apelido permaneça especulativa.',
  -- achievements_en
  NULL,  -- No documented achievements
  -- achievements_pt
  NULL,
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade precision):
No birth date documented. Active at Gengibirra/Liberdade roda pre-1941 as a participant alongside contemporaries like Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). If active as a practitioner in the 1930s, likely born ~1890-1910. Using 1900 as midpoint estimate.

DEATH YEAR: Unknown. Not listed among Pastinha''s 1967 list of deceased angoleiros de briga, but this does not confirm he was alive at that time.

DOCUMENTATION: Single primary source only - A Tarde newspaper article, February 24, 1969, reproduced at velhosmestres.com. No additional biographical information found in any other source.

NOT A GENGIBIRRA FOUNDER: While Butique participated in the Liberdade roda, he is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola in Mestre Noronha''s manuscripts. This suggests different levels of involvement: the 22 founders were organizational leaders, while others like Butique were regular participants in the rodas.

APELIDO: "Butique" means "boutique" or "small elegant shop" in Portuguese. The origin of this nickname is unknown - it may reference his profession or physical characteristics.

CONTEMPORARIES AT GENGIBIRRA:
- Amorzinho (civil guard, roda president) - imported
- Totonho de Maré (Antônio Laurindo das Neves) - imported
- Mestre Noronha (Daniel Coutinho) - imported
- Livino (brother of Noronha) - imported
- Américo Ciência - imported
- Barbosa - imported
- Eulâmpio - imported
- Bulgário - imported
- Domingos Magalhães - imported
- Alemão - in backlog
- Antônio - unclear which Antônio, needs investigation',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década):
Nenhuma data de nascimento documentada. Ativo na roda do Gengibirra/Liberdade antes de 1941 como participante junto com contemporâneos como Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). Se ativo como praticante na década de 1930, provavelmente nascido ~1890-1910. Usando 1900 como estimativa do ponto médio.

ANO DE MORTE: Desconhecido. Não listado entre a lista de 1967 de Pastinha de angoleiros de briga falecidos, mas isso não confirma que estava vivo naquela época.

DOCUMENTAÇÃO: Apenas uma fonte primária - artigo do jornal A Tarde, 24 de fevereiro de 1969, reproduzido em velhosmestres.com. Nenhuma informação biográfica adicional encontrada em qualquer outra fonte.

NÃO É FUNDADOR DO GENGIBIRRA: Embora Butique participasse da roda da Liberdade, ele NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola nos manuscritos de Mestre Noronha. Isso sugere diferentes níveis de envolvimento: os 22 fundadores eram líderes organizacionais, enquanto outros como Butique eram participantes regulares das rodas.

APELIDO: "Butique" significa "loja pequena e elegante" em português. A origem deste apelido é desconhecida - pode referenciar sua profissão ou características físicas.

CONTEMPORÂNEOS NO GENGIBIRRA:
- Amorzinho (guarda civil, presidente da roda) - importado
- Totonho de Maré (Antônio Laurindo das Neves) - importado
- Mestre Noronha (Daniel Coutinho) - importado
- Livino (irmão de Noronha) - importado
- Américo Ciência - importado
- Barbosa - importado
- Eulâmpio - importado
- Bulgário - importado
- Domingos Magalhães - importado
- Alemão - no backlog
- Antônio - não está claro qual Antônio, precisa investigação'
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

-- Source: entities/persons/cassarangongo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Cassarangongo
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR (~1900, decade precision): Estimated based on:
-- - Worked with Espinho Remoso (~1910 birth) in sugarcane fields at Engenho
--   da Pindoba, likely as contemporaries of similar age
-- - Active in capoeira in early 1900s Santo Amaro
-- - If the "Elói" at Largo do Tanque (c. 1938) is this person, he was
--   practicing alongside Bimba, Pastinha, Besouro, suggesting similar era
-- No death date documented.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Antônio Elói dos Santos', 'Cassarangongo', 'mestre'::genealogy.title, NULL,
  ARRAY['https://pt.wikipedia.org/wiki/Mestre_Espinho_Remoso']::text[],
  'angola'::genealogy.style,
  E'Pre-codification era capoeirista from Santo Amaro sugarcane mill tradition. Learned and practiced capoeira at Engenho da Pindoba between Santo Amaro and Candeias.',
  E'Capoeirista da era pré-codificação da tradição dos engenhos de cana de Santo Amaro. Aprendeu e praticou capoeira no Engenho da Pindoba entre Santo Amaro e Candeias.',
  1900, 'decade'::genealogy.date_precision, 'Santo Amaro region, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Antônio Elói dos Santos, known as Mestre Cassarangongo, was a capoeirista from the sugarcane plantation communities of the Recôncavo Baiano, the region considered the cradle of Bahian capoeira.

Cassarangongo worked at Engenho da Pindoba, a sugarcane mill located between the cities of Santo Amaro and Candeias. It was there that he met Elízio Maximiano Ferreira, who would later become the legendary Mestre Espinho Remoso. The two men worked together in the sugarcane fields (canavial), and after the day''s labor was done, they would play capoeira together.

This pattern of capoeira practice among sugarcane workers was common in the pre-codification era. The mills and plantations of the Recôncavo served as informal training grounds where the art was transmitted outside of formal academy structures. Santo Amaro, in particular, produced many legendary capoeiristas including Besouro Mangangá and Cobrinha Verde.

Cassarangongo and Espinho Remoso later reunited in Salvador, where they became great friends. This connection places Cassarangongo within the network of Santo Amaro capoeiristas who helped preserve and transmit the art during a period when capoeira was still criminalized in Brazil.

A capoeirista named "Elói" is documented among the old practitioners who frequented Largo do Tanque in Salvador around 1938, alongside legendary figures such as Mestre Aberrê, Mestre Bimba, Mestre Pastinha, Besouro, Siri de Mangue, and others. If this is the same Antônio Elói dos Santos (Cassarangongo), it would place him among the most significant capoeiristas of his era.

His distinctive apelido "Cassarangongo" appears to derive from African linguistic roots, possibly from Banto languages such as Quimbundo, Quicongo, or Umbundo - languages that heavily influenced the vocabulary of Afro-Brazilian culture in Bahia. The exact meaning or origin of the name remains undocumented.',
  E'Antônio Elói dos Santos, conhecido como Mestre Cassarangongo, foi um capoeirista das comunidades das plantações de cana-de-açúcar do Recôncavo Baiano, região considerada o berço da capoeira baiana.

Cassarangongo trabalhava no Engenho da Pindoba, um engenho de cana-de-açúcar localizado entre as cidades de Santo Amaro e Candeias. Foi lá que conheceu Elízio Maximiano Ferreira, que mais tarde se tornaria o lendário Mestre Espinho Remoso. Os dois homens trabalhavam juntos nos canaviais, e após o término do trabalho do dia, jogavam capoeira juntos.

Esse padrão de prática da capoeira entre trabalhadores da cana-de-açúcar era comum na era pré-codificação. Os engenhos e fazendas do Recôncavo serviam como espaços informais de treinamento onde a arte era transmitida fora das estruturas formais de academia. Santo Amaro, em particular, produziu muitos capoeiristas lendários incluindo Besouro Mangangá e Cobrinha Verde.

Cassarangongo e Espinho Remoso se reencontraram posteriormente em Salvador, onde se tornaram grandes amigos. Essa conexão coloca Cassarangongo dentro da rede de capoeiristas de Santo Amaro que ajudaram a preservar e transmitir a arte durante um período em que a capoeira ainda era criminalizada no Brasil.

Um capoeirista chamado "Elói" está documentado entre os antigos praticantes que frequentavam o Largo do Tanque em Salvador por volta de 1938, ao lado de figuras lendárias como Mestre Aberrê, Mestre Bimba, Mestre Pastinha, Besouro, Siri de Mangue, e outros. Se este for o mesmo Antônio Elói dos Santos (Cassarangongo), isso o colocaria entre os capoeiristas mais significativos de sua era.

Seu distintivo apelido "Cassarangongo" parece derivar de raízes linguísticas africanas, possivelmente de línguas bantas como Quimbundo, Quicongo ou Umbundo - línguas que influenciaram fortemente o vocabulário da cultura afro-brasileira na Bahia. O significado ou origem exato do nome permanece sem documentação.',
  E'- Worked at Engenho da Pindoba (Santo Amaro/Candeias) in early 1900s
- Training companion of Mestre Espinho Remoso in sugarcane fields
- Part of Santo Amaro capoeira tradition that produced Besouro and Cobrinha Verde
- Reunited with Espinho Remoso in Salvador, maintaining lifelong friendship
- Possibly the "Elói" at Largo do Tanque (c. 1938) practicing with Bimba, Pastinha, Aberrê',
  E'- Trabalhou no Engenho da Pindoba (Santo Amaro/Candeias) no início dos anos 1900
- Companheiro de treino de Mestre Espinho Remoso nos canaviais
- Parte da tradição de capoeira de Santo Amaro que produziu Besouro e Cobrinha Verde
- Reencontrou Espinho Remoso em Salvador, mantendo amizade para toda a vida
- Possivelmente o "Elói" do Largo do Tanque (c. 1938) praticando com Bimba, Pastinha, Aberrê',
  E'BIRTH YEAR (~1900, decade precision):
Estimated based on being a working contemporary of Espinho Remoso (~1910 birth) at Engenho da Pindoba. They worked together in sugarcane fields, suggesting similar ages. If the "Elói" at Largo do Tanque (c. 1938) alongside Bimba, Pastinha, Besouro is this person, it confirms early 1900s birth.

NAME ORIGIN:
"Cassarangongo" appears to derive from African linguistic roots, possibly Banto languages (Quimbundo, Quicongo, or Umbundo). The exact meaning remains undocumented.

LARGO DO TANQUE CONNECTION (UNCERTAIN):
Wikipedia PT article on Mestre Caiçara lists "Elói" among capoeiristas at Largo do Tanque (~1938) alongside Aberrê, Bimba, Pastinha, Besouro, Siri de Mangue, and others. This could be Antônio Elói dos Santos (Cassarangongo) but is NOT confirmed. If true, it significantly elevates his documented historical importance.

RELATIONSHIP TO ESPINHO REMOSO:
- Met at Engenho da Pindoba (between Santo Amaro and Candeias)
- Worked together in sugarcane fields (canavial)
- Played capoeira together after work
- Became great friends
- Reunited later in Salvador
Source: Wikipedia PT "Mestre Espinho Remoso"

ENGENHO DA PINDOBA:
Sugar mill located between Santo Amaro and Candeias. Part of the network of Recôncavo Baiano plantations where capoeira was practiced among workers in the pre-codification era.',
  E'ANO DE NASCIMENTO (~1900, precisão de década):
Estimado com base em ser contemporâneo de trabalho de Espinho Remoso (~1910 nascimento) no Engenho da Pindoba. Trabalhavam juntos nos canaviais, sugerindo idades similares. Se o "Elói" do Largo do Tanque (c. 1938) junto com Bimba, Pastinha, Besouro for esta pessoa, confirma nascimento no início dos anos 1900.

ORIGEM DO NOME:
"Cassarangongo" parece derivar de raízes linguísticas africanas, possivelmente línguas bantas (Quimbundo, Quicongo ou Umbundo). O significado exato permanece sem documentação.

CONEXÃO COM LARGO DO TANQUE (INCERTA):
Artigo da Wikipedia PT sobre Mestre Caiçara lista "Elói" entre capoeiristas no Largo do Tanque (~1938) junto com Aberrê, Bimba, Pastinha, Besouro, Siri de Mangue e outros. Este poderia ser Antônio Elói dos Santos (Cassarangongo) mas NÃO está confirmado. Se verdade, eleva significativamente sua importância histórica documentada.

RELAÇÃO COM ESPINHO REMOSO:
- Conheceram-se no Engenho da Pindoba (entre Santo Amaro e Candeias)
- Trabalharam juntos nos canaviais
- Jogavam capoeira juntos após o trabalho
- Tornaram-se grandes amigos
- Reencontraram-se depois em Salvador
Fonte: Wikipedia PT "Mestre Espinho Remoso"

ENGENHO DA PINDOBA:
Engenho de açúcar localizado entre Santo Amaro e Candeias. Parte da rede de plantações do Recôncavo Baiano onde a capoeira era praticada entre trabalhadores na era pré-codificação.'
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

-- Source: entities/persons/dende.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Dendê (Recôncavo)
-- Generated: 2026-01-03 (merged from dende-sfc.sql and dende-santo-amaro.sql)
-- ============================================================
-- MERGED IDENTITY: Sources mention "Dendê from Santo Amaro" (Cobrinha Verde's
-- teacher) and "Dendê from São Francisco do Conde" (Mário Buscapé's uncle).
-- These towns share a border (~15-25km apart) in the Recôncavo Baiano.
-- Circumstantial evidence strongly suggests ONE person active across both areas:
-- - Same unusual apelido ("Dendê" = palm oil)
-- - Same decade of birth (1890s estimate)
-- - Same era of activity (1920s-1940s)
-- - Compatible timeline: teaching Cobrinha Verde in 1920s (age 30s),
--   teaching nephew Mário Buscapé in 1940s (age 50s)
-- - Same social circle (Besouro's companions)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown
  'Dendê',
  NULL, -- No context needed - merged identity
  NULL, -- Pre-codification era; proto_mestre but no formal title documented
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  NULL, -- Pre-codification era; Bahian Recôncavo tradition before Angola/Regional distinction
  E'Proto-mestre from the Bahian Recôncavo, active in Santo Amaro da Purificação and São Francisco do Conde. Trained with Besouro Mangangá''s companions including Siri de Mangue and Canário Pardo. One of Cobrinha Verde''s teachers in Santo Amaro after Besouro''s death (1924). Uncle and first capoeira teacher of Mário Buscapé, teaching him in family backyard rodas starting around 1942.',
  E'Proto-mestre do Recôncavo Baiano, ativo em Santo Amaro da Purificação e São Francisco do Conde. Treinou com os companheiros de Besouro Mangangá, incluindo Siri de Mangue e Canário Pardo. Um dos professores de Cobrinha Verde em Santo Amaro após a morte de Besouro (1924). Tio e primeiro professor de capoeira de Mário Buscapé, ensinando-o em rodas no quintal da família a partir de cerca de 1942.',
  1890, 'decade'::genealogy.date_precision, 'Recôncavo Baiano, Bahia, Brazil',
  NULL, 'unknown'::genealogy.date_precision, NULL,
  -- bio_en
  E'Dendê was a capoeirista from the Bahian Recôncavo region, active in Santo Amaro da Purificação and the neighboring municipality of São Francisco do Conde. He was part of the generation that trained with Besouro Mangangá''s companions and helped transmit traditional capoeira to the next generation.

According to Mestre Cobrinha Verde''s testimony in "Capoeira e Mandingas" (1991): "My true mestre was Besouro, but I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo." Cobrinha Verde (born 1912) learned from these mestres after Besouro''s assassination in 1924, suggesting Dendê was already an established teacher in his 30s at that time.

Dendê was also the uncle and first capoeira teacher of Mário Buscapé, who later became one of the four founding figures of contemporary capoeira in Rio de Janeiro. According to Mário''s testimony, both his father José Bidel dos Santos and his uncle Dendê practiced capoeira and associated with famous capoeiristas of the Recôncavo, including Siri de Mangue, Canário Pardo, and Besouro from Santo Amaro. The legendary Besouro Mangangá reportedly visited their family home before Mário was born.

Starting around 1942, when Mário was approximately eight years old, Dendê began teaching his nephew capoeira in improvised rodas held in the family''s backyard in São Francisco do Conde. Dendê served as Mário''s primary teacher during these formative years, alongside Mário''s father José Bidel.

Sources mention "Dendê from Santo Amaro" and "Dendê from São Francisco do Conde" as potentially distinct individuals. However, these neighboring municipalities share a border (only 15-25km apart), and the circumstantial evidence strongly suggests this was one person active across the interconnected Recôncavo region: same unusual apelido, same birth decade, same era of activity, same social circle of Besouro''s companions, and a timeline perfectly compatible with one life.

Dendê remains a Layer Zero figure—a proto-mestre from the pre-codification era whose legacy lives on through the students he trained: Cobrinha Verde, who became a legendary mestre and bridge to the documented lineage, and Mário Buscapé, who brought the Recôncavo tradition to Rio de Janeiro.',
  -- bio_pt
  E'Dendê foi um capoeirista da região do Recôncavo Baiano, ativo em Santo Amaro da Purificação e no município vizinho de São Francisco do Conde. Fazia parte da geração que treinou com os companheiros de Besouro Mangangá e ajudou a transmitir a capoeira tradicional para a próxima geração.

Segundo o testemunho de Mestre Cobrinha Verde em "Capoeira e Mandingas" (1991): "O meu mestre verdadeiro foi Besouro, mas eu aprendi com muitos mestres em Santo Amaro. Vou dar o nome de um por um: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo." Cobrinha Verde (nascido em 1912) aprendeu com esses mestres após o assassinato de Besouro em 1924, sugerindo que Dendê já era um professor estabelecido em seus 30 anos naquela época.

Dendê também era tio e primeiro professor de capoeira de Mário Buscapé, que mais tarde se tornou uma das quatro figuras fundadoras da capoeira contemporânea no Rio de Janeiro. Segundo o testemunho de Mário, tanto seu pai José Bidel dos Santos quanto seu tio Dendê praticavam capoeira e se associavam com famosos capoeiristas do Recôncavo, incluindo Siri de Mangue, Canário Pardo e Besouro de Santo Amaro. O lendário Besouro Mangangá teria visitado a casa da família antes de Mário nascer.

A partir de cerca de 1942, quando Mário tinha aproximadamente oito anos, Dendê começou a ensinar capoeira ao sobrinho em rodas improvisadas no quintal da família em São Francisco do Conde. Dendê serviu como professor principal de Mário durante esses anos formativos, ao lado do pai de Mário, José Bidel.

As fontes mencionam "Dendê de Santo Amaro" e "Dendê de São Francisco do Conde" como indivíduos potencialmente distintos. No entanto, esses municípios vizinhos compartilham fronteira (apenas 15-25km de distância), e as evidências circunstanciais sugerem fortemente que era uma pessoa ativa na região interconectada do Recôncavo: mesmo apelido incomum, mesma década de nascimento, mesma era de atividade, mesmo círculo social dos companheiros de Besouro, e uma linha do tempo perfeitamente compatível com uma vida.

Dendê permanece uma figura da Camada Zero—um proto-mestre da era pré-codificação cujo legado vive através dos alunos que treinou: Cobrinha Verde, que se tornou um mestre lendário e ponte para a linhagem documentada, e Mário Buscapé, que levou a tradição do Recôncavo para o Rio de Janeiro.',
  -- achievements_en
  E'Teacher of Cobrinha Verde in Santo Amaro da Purificação (1920s); First capoeira teacher of Mário Buscapé in São Francisco do Conde (1940s); Part of the generation that maintained capoeira during the prohibition era (1890-1937); Trained with Besouro Mangangá''s companions (Siri de Mangue, Canário Pardo); Critical link transmitting Recôncavo capoeira tradition to both Salvador and Rio de Janeiro lineages',
  -- achievements_pt
  E'Professor de Cobrinha Verde em Santo Amaro da Purificação (anos 1920); Primeiro professor de capoeira de Mário Buscapé em São Francisco do Conde (anos 1940); Parte da geração que manteve a capoeira durante a era de proibição (1890-1937); Treinou com os companheiros de Besouro Mangangá (Siri de Mangue, Canário Pardo); Elo crítico transmitindo a tradição da capoeira do Recôncavo para as linhagens de Salvador e Rio de Janeiro',
  -- notes_en
  E'MERGED IDENTITY ANALYSIS:
Sources mention two potentially distinct figures:
1. "Dendê from Santo Amaro" - Listed by Cobrinha Verde among his teachers (1920s)
2. "Dendê from São Francisco do Conde" - Uncle and teacher of Mário Buscapé (1940s)

EVIDENCE FOR ONE PERSON:
- Geographic proximity: Santo Amaro and São Francisco do Conde share a border (~15-25km apart)
- Same unusual apelido: "Dendê" (palm oil) is not common
- Same birth decade: Both estimates point to 1890s
- Same era of activity: 1920s-1940s
- Same social circle: Both connected to Besouro''s companions (Siri de Mangue, Canário Pardo)
- Compatible timeline for one life:
  * 1920s: Teaching Cobrinha Verde in Santo Amaro (age ~30s)
  * 1940s: Teaching nephew Mário Buscapé in São Francisco do Conde (age ~50s)

The circumstantial evidence strongly suggests ONE person active across the interconnected Recôncavo region. Different sources emphasized different localities based on their informants'' perspectives (Cobrinha Verde = Santo Amaro; Mário Buscapé = São Francisco do Conde), but the Recôncavo was a small, interconnected region where capoeiristas moved freely between neighboring towns.

BIRTH YEAR ESTIMATION (1890, decade):
- Needed to be adult (20+) by 1920s to train with Besouro''s companions and teach Cobrinha Verde
- Still actively teaching nephew Mário in 1942 when Mário was 8
- Age 30-35 when teaching Cobrinha Verde (1920s) is reasonable for an established teacher
- Age 50-55 when teaching Mário (1942) is consistent with being an uncle

TRAINING COMPANIONS (associated_with):
- Siri de Mangue (1920s) - training companion, NOT teacher-student
- Neco Canário Pardo (1920s) - training companion, NOT teacher-student
- Besouro Mangangá - part of his circle of companions
NOTE: Sources say Dendê "met up with" these capoeiristas, indicating peers who trained together, not a hierarchical relationship.

STUDENTS:
- Cobrinha Verde (Rafael Alves França, 1912-1983) - trained_under, ~1924-1929
- Mário Buscapé (Mário dos Santos, 1934-2021) - as uncle/first teacher, ~1942+

FAMILY:
- Uncle of Mário Buscapé
- Brother of José Bidel (Mário''s father) - both practiced capoeira together

CONTEMPORARIES (associated_with):
- Maitá, Licurí, Joité, Gasolina, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso (all Santo Amaro teachers of Cobrinha Verde)

PRIMARY SOURCES:
1. Cobrinha Verde autobiographical testimony in Marcelino dos Santos "Capoeira e Mandingas" (1991), p.11-23
2. Mário Buscapé testimony on capoeirahistory.com',
  -- notes_pt
  E'ANÁLISE DE IDENTIDADE MESCLADA:
As fontes mencionam duas figuras potencialmente distintas:
1. "Dendê de Santo Amaro" - Listado por Cobrinha Verde entre seus professores (anos 1920)
2. "Dendê de São Francisco do Conde" - Tio e professor de Mário Buscapé (anos 1940)

EVIDÊNCIAS PARA UMA PESSOA:
- Proximidade geográfica: Santo Amaro e São Francisco do Conde compartilham fronteira (~15-25km de distância)
- Mesmo apelido incomum: "Dendê" (óleo de palma) não é comum
- Mesma década de nascimento: Ambas as estimativas apontam para os anos 1890
- Mesma era de atividade: anos 1920-1940
- Mesmo círculo social: Ambos conectados aos companheiros de Besouro (Siri de Mangue, Canário Pardo)
- Linha do tempo compatível para uma vida:
  * Anos 1920: Ensinando Cobrinha Verde em Santo Amaro (idade ~30 anos)
  * Anos 1940: Ensinando sobrinho Mário Buscapé em São Francisco do Conde (idade ~50 anos)

As evidências circunstanciais sugerem fortemente UMA pessoa ativa na região interconectada do Recôncavo. Diferentes fontes enfatizaram diferentes localidades baseadas nas perspectivas de seus informantes (Cobrinha Verde = Santo Amaro; Mário Buscapé = São Francisco do Conde), mas o Recôncavo era uma região pequena e interconectada onde capoeiristas se moviam livremente entre cidades vizinhas.

ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
- Precisava ser adulto (20+) nos anos 1920 para treinar com os companheiros de Besouro e ensinar Cobrinha Verde
- Ainda ensinando ativamente o sobrinho Mário em 1942 quando Mário tinha 8 anos
- Idade 30-35 ao ensinar Cobrinha Verde (anos 1920) é razoável para um professor estabelecido
- Idade 50-55 ao ensinar Mário (1942) é consistente com ser tio

COMPANHEIROS DE TREINO (associated_with):
- Siri de Mangue (anos 1920) - companheiro de treino, NÃO professor-aluno
- Neco Canário Pardo (anos 1920) - companheiro de treino, NÃO professor-aluno
- Besouro Mangangá - parte de seu círculo de companheiros
NOTA: Fontes dizem que Dendê "se encontrava com" esses capoeiristas, indicando pares que treinavam juntos, não uma relação hierárquica.

ALUNOS:
- Cobrinha Verde (Rafael Alves França, 1912-1983) - trained_under, ~1924-1929
- Mário Buscapé (Mário dos Santos, 1934-2021) - como tio/primeiro professor, ~1942+

FAMÍLIA:
- Tio de Mário Buscapé
- Irmão de José Bidel (pai de Mário) - ambos praticavam capoeira juntos

CONTEMPORÂNEOS (associated_with):
- Maitá, Licurí, Joité, Gasolina, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso (todos professores de Cobrinha Verde em Santo Amaro)

FONTES PRIMÁRIAS:
1. Testemunho autobiográfico de Cobrinha Verde em Marcelino dos Santos "Capoeira e Mandingas" (1991), p.11-23
2. Testemunho de Mário Buscapé em capoeirahistory.com'
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

-- Source: entities/persons/deraldo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Deraldo
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930, decade precision):
-- Deraldo was a brother of Zé Grande and Irineu dos Santos, all from Bahia.
-- They came to Rio in the early 1950s. Deraldo was already established as
-- an instructor by 1957 when Gary (age 12) began training at Bonfim. He
-- became co-leader of the group in 1969 when Mário Buscapé returned to Bahia.
-- Estimating birth around 1930 places him in his early 20s when Bonfim was
-- founded in 1953—consistent with being skilled enough to co-found a group.
-- ============================================================
-- NOTE: This Deraldo (dos Santos family, Bonfim/Rio) is DIFFERENT from
-- Mestre Deraldo Ferreira (Santos, São Paulo), who teaches Capoeira Angola
-- in Cambridge, Massachusetts, and was certified by Mestre João Pequeno.
-- These are TWO SEPARATE PEOPLE with the same apelido.
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; from the dos Santos family
  'Deraldo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/', 'https://capoeirahistory.com/master-soldado/', 'https://capoeirahistory.com/the-penha-roda/', 'https://capoeiraliberdade.net.br/view/historia.php']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era
  E'Deraldo learned capoeira from Mário Buscapé, who brought Bahian Recôncavo traditions to Rio de Janeiro. Like his brother Zé Grande, his style was practical and competitive, emphasizing training high-level fighters who excelled in Rio''s competitions from the mid-1960s. He was part of the "dangerous" era of capoeira in the 1960s-70s, characterized by constant headbutts and rasteiras, without uniforms or cords. Mestre Gary recalled this period as one where practitioners wore normal clothing and identified simply as "capoeira players."',
  E'Deraldo aprendeu capoeira com Mário Buscapé, que trouxe as tradições do Recôncavo Baiano para o Rio de Janeiro. Como seu irmão Zé Grande, seu estilo era prático e competitivo, enfatizando o treinamento de lutadores de alto nível que se destacavam nas competições do Rio a partir de meados dos anos 1960. Ele fazia parte da era "perigosa" da capoeira nos anos 1960-70, caracterizada por cabeçadas e rasteiras constantes, sem uniformes ou cordas. Mestre Gary recordava este período como uma época em que os praticantes usavam roupas normais e se identificavam simplesmente como "jogadores de capoeira."',
  -- Life dates
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil', -- From Bahia like his brothers, exact location unknown
  NULL, -- Status unknown; no death confirmation found
  NULL,
  NULL,
  -- bio_en
  E'Deraldo was one of the foundational figures in establishing the Bonfim capoeira lineage in Rio de Janeiro. A native of Bahia, he came to Rio de Janeiro in the early 1950s along with his brothers Irineu dos Santos and Zé Grande—all from the dos Santos family, unrelated to their teacher Mário dos Santos (Mário Buscapé) despite sharing the same surname.

When Mário Buscapé began teaching capoeira at the Cavan company where he worked, Irineu was his first student. Through Irineu, Mário soon won other followers, including Zé Grande and Deraldo. On January 6, 1953, they founded the Associação Cultural Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in the neighborhood of São Cristóvão. As historian André Lacé wrote: "They didn''t stay there for long, because the space became small due to the large number of students. They moved the academy to the neighborhood of Olaria, a spacious and pleasant place, and there they never stopped, training great capoeiristas."

The Bonfim group, led by Mário Buscapé, became famous in Rio de Janeiro for training high-level competitors who often won the competitions that began being organized in the city from the mid-1960s.

In 1969, when Mário Buscapé returned to Bahia, Deraldo and his brother Zé Grande took over leadership of the Bonfim group. While Zé Grande served as president, Deraldo was instrumental in the daily teaching operations. The group''s headquarters was later established in the Bonsucesso neighborhood, and it continued to flourish under their direction.

Deraldo was directly responsible for graduating Mestre Soldado in 1973. According to Mestre Soldado''s testimony, at age 18 he "started training with Mestres Deraldo and Zé Grande (the president of the Bonfim group)" at the main headquarters in Bonsucesso. "In 1973, Soldado graduated from Mestre Deraldo and began teaching for the group," creating the Santa Barbara nucleus in the Bandeira 2 community in Del Castilho, where he taught until 1980.

Mestre Gary (Mestre 22), who began training at Bonfim in 1957 at age 12, learned from both Deraldo and Zé Grande. Recalling the capoeira scene of the 1960s and 70s, Gary listed the prominent capoeiristas: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—and myself, Mestre 22 da Bonfim."

Deraldo, along with his brother Zé Grande, Mestres Dentinho, and Mintirinha, is credited as one of the initiators of the capoeira roda at the Festa da Penha. By the 1970s, this roda established itself as one of the main street rodas in Rio de Janeiro, taking place during the festival month (October-November).',
  -- bio_pt
  E'Deraldo foi uma das figuras fundamentais no estabelecimento da linhagem de capoeira Bonfim no Rio de Janeiro. Natural da Bahia, ele veio para o Rio de Janeiro no início dos anos 1950 junto com seus irmãos Irineu dos Santos e Zé Grande—todos da família dos Santos, sem parentesco com seu professor Mário dos Santos (Mário Buscapé) apesar de compartilharem o mesmo sobrenome.

Quando Mário Buscapé começou a ensinar capoeira na empresa Cavan onde trabalhava, Irineu foi seu primeiro aluno. Através de Irineu, Mário logo conquistou outros seguidores, incluindo Zé Grande e Deraldo. Em 6 de janeiro de 1953, fundaram a Associação Cultural Bonfim, também conhecida como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço no bairro de São Cristóvão. Como o historiador André Lacé escreveu: "Não ficaram lá por muito tempo, porque o espaço ficou pequeno devido ao grande número de alunos. Mudaram a academia para o bairro de Olaria, um lugar espaçoso e agradável, e lá nunca pararam, treinando grandes capoeiristas."

O grupo Bonfim, liderado por Mário Buscapé, tornou-se famoso no Rio de Janeiro por formar competidores de alto nível que frequentemente venciam as competições que começaram a ser organizadas na cidade a partir de meados dos anos 1960.

Em 1969, quando Mário Buscapé retornou à Bahia, Deraldo e seu irmão Zé Grande assumiram a liderança do grupo Bonfim. Enquanto Zé Grande atuava como presidente, Deraldo era fundamental nas operações diárias de ensino. A sede do grupo foi posteriormente estabelecida no bairro de Bonsucesso, e continuou a prosperar sob sua direção.

Deraldo foi diretamente responsável por formar Mestre Soldado em 1973. Segundo o depoimento de Mestre Soldado, aos 18 anos ele "começou a treinar com os Mestres Deraldo e Zé Grande (o presidente do grupo Bonfim)" na sede principal em Bonsucesso. "Em 1973, Soldado se formou com Mestre Deraldo e começou a ensinar para o grupo," criando o núcleo Santa Barbara na comunidade Bandeira 2, em Del Castilho, onde ensinou até 1980.

Mestre Gary (Mestre 22), que começou a treinar no Bonfim em 1957 aos 12 anos, aprendeu com Deraldo e Zé Grande. Relembrando a cena da capoeira dos anos 1960 e 70, Gary listou os capoeiristas proeminentes: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—e eu mesmo, Mestre 22 da Bonfim."

Deraldo, junto com seu irmão Zé Grande, os Mestres Dentinho e Mintirinha, é creditado como um dos iniciadores da roda de capoeira na Festa da Penha. Nos anos 1970, esta roda se estabeleceu como uma das principais rodas de rua do Rio de Janeiro, ocorrendo durante o mês do festival (outubro-novembro).',
  -- achievements_en
  'Co-founder of Associação Cultural Bonfim (January 6, 1953); Co-leader of Grupo Bonfim (from 1969) with brother Zé Grande; Initiator of the Roda da Penha (1960s); Graduated Mestre Soldado (1973); Trained Mestre Gary (Mestre 22); Key figure in training high-level competitors who won Rio competitions in the 1960s-70s',
  -- achievements_pt
  'Co-fundador da Associação Cultural Bonfim (6 de janeiro de 1953); Co-líder do Grupo Bonfim (a partir de 1969) com o irmão Zé Grande; Iniciador da Roda da Penha (anos 1960); Formou Mestre Soldado (1973); Treinou Mestre Gary (Mestre 22); Figura fundamental no treinamento de competidores de alto nível que venciam competições no Rio nos anos 1960-70',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1930, decade):
Deraldo came to Rio with his brothers Irineu and Zé Grande in the early 1950s. He was already co-leading and teaching by 1957 when Gary (age 12) began training. Estimating birth around 1930 places him in his early 20s at the founding of Bonfim in 1953. The "decade" precision reflects limited documentation.

FULL NAME: Unknown. He was from the dos Santos family (same as brothers Irineu and Zé Grande), from Bahia. NOT related to Mário dos Santos (Mário Buscapé) despite the same surname.

NAME DISAMBIGUATION:
This "Deraldo" (Bonfim/Rio) is DIFFERENT from Mestre Deraldo Ferreira, who teaches Capoeira Angola in Cambridge, Massachusetts. Deraldo Ferreira was born in Santos, São Paulo, certified by Mestre João Pequeno in 1991/2004, and moved to Boston in 1986. They are TWO SEPARATE PEOPLE.

DEATH STATUS: Unknown. No death date or confirmation found in sources. His brother "Zé Grande" is confirmed deceased (sources refer to "the late Master Zé Grande"), but no similar reference for Deraldo.

TEACHERS:
- Mário Buscapé (primary, ~early 1950s, Rio de Janeiro)

STUDENTS:
- Mestre Gary / Mestre 22 (began 1957, age 12; co-taught with Zé Grande)
- Mestre Soldado (graduated 1973; trained at Bonsucesso HQ)

GROUP LEADERSHIP:
- Co-founded Associação Cultural Bonfim: January 6, 1953 (with Mário Buscapé, Irineu, Zé Grande)
- Took over leadership: 1969 (when Mário returned to Bahia)
- Co-leader with brother Zé Grande (who served as president)
- Headquarters: Initially São Cristóvão, then Olaria, later Bonsucesso

RODA INVOLVEMENT:
- Roda da Penha: credited as initiator (1960s), with Zé Grande, Dentinho, Mintirinha

MEDIA: None found. Mário Buscapé''s 2016 memoir "A saga de uma lenda viva" (Azougue, Rio) may contain more details about Deraldo.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Deraldo veio para o Rio com seus irmãos Irineu e Zé Grande no início dos anos 1950. Ele já estava co-liderando e ensinando em 1957 quando Gary (12 anos) começou a treinar. Estimar nascimento por volta de 1930 o coloca no início dos 20 anos na fundação do Bonfim em 1953. A precisão de "década" reflete documentação limitada.

NOME COMPLETO: Desconhecido. Ele era da família dos Santos (mesma dos irmãos Irineu e Zé Grande), da Bahia. NÃO é parente de Mário dos Santos (Mário Buscapé) apesar do mesmo sobrenome.

DESAMBIGUAÇÃO DE NOME:
Este "Deraldo" (Bonfim/Rio) é DIFERENTE de Mestre Deraldo Ferreira, que ensina Capoeira Angola em Cambridge, Massachusetts. Deraldo Ferreira nasceu em Santos, São Paulo, foi certificado por Mestre João Pequeno em 1991/2004, e mudou-se para Boston em 1986. São DUAS PESSOAS DIFERENTES.

STATUS DE MORTE: Desconhecido. Nenhuma data ou confirmação de morte encontrada nas fontes. Seu irmão "Zé Grande" está confirmado como falecido (fontes referem-se ao "saudoso Mestre Zé Grande"), mas nenhuma referência similar para Deraldo.

MESTRES:
- Mário Buscapé (principal, ~início dos anos 1950, Rio de Janeiro)

ALUNOS:
- Mestre Gary / Mestre 22 (começou 1957, 12 anos; co-ensinou com Zé Grande)
- Mestre Soldado (formado 1973; treinou na sede de Bonsucesso)

LIDERANÇA DO GRUPO:
- Co-fundou Associação Cultural Bonfim: 6 de janeiro de 1953 (com Mário Buscapé, Irineu, Zé Grande)
- Assumiu liderança: 1969 (quando Mário retornou à Bahia)
- Co-líder com irmão Zé Grande (que atuou como presidente)
- Sede: Inicialmente São Cristóvão, depois Olaria, posteriormente Bonsucesso

ENVOLVIMENTO EM RODAS:
- Roda da Penha: creditado como iniciador (anos 1960), com Zé Grande, Dentinho, Mintirinha

MÍDIA: Nenhuma encontrada. As memórias de Mário Buscapé de 2016 "A saga de uma lenda viva" (Azougue, Rio) podem conter mais detalhes sobre Deraldo.'
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

-- Source: entities/persons/domingos-magalhaes.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Domingos Magalhães
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- No birth date documented. Active at Gengibirra/Liberdade roda
-- pre-1941 as an established mestre alongside contemporaries like
-- Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894).
-- In 1969, Mestre Pastinha still named him as one of the capable
-- mestres who could organize a Federation - suggesting he was
-- alive and active, but by then would be ~69 years old. If active
-- as a mestre in the 1930s, likely born ~1890-1910.
-- Using 1900 as midpoint estimate with decade precision.
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
  NULL,  -- Full name unknown (Domingos Magalhães or Domingos de Magalhães is likely full name)
  'Domingos Magalhães',
  NULL,  -- No formal title documented
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://velhosmestres.com/en/pastinha-1969']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola. Domingos Magalhães was part of the Sunday gatherings at Gengibirra/Liberdade where practitioners played "not worrying about the styles of the fight or about the exhibition" - suggesting an informal, traditional approach focused on the pure practice of capoeira angola.',
  E'Capoeira de Angola tradicional. Domingos Magalhães fazia parte das reuniões dominicais no Gengibirra/Liberdade onde os praticantes jogavam "sem se preocupar com os estilos de luta ou com a exibição" - sugerindo uma abordagem informal e tradicional focada na prática pura da capoeira angola.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Domingos Magalhães (also referred to as Domingos de Magalhães) was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of traditional capoeira angola practitioners who gathered at the Liberdade/Gengibirra neighborhood in Salvador before the formalization of capoeira academies.

The primary documentation of Domingos Magalhães comes from two 1969 newspaper articles in A Tarde, reproduced at velhosmestres.com. One article commemorating the anniversary of Mestre Pastinha''s academy described the informal Sunday gatherings at Gengibirra where "many capoeiristas got together on Sundays to play capoeira de Angola, not worrying about the styles of the fight or about the exhibition." They formed an "academia" (in the informal sense of a regular gathering), presided over by the civil guard Amorzinho.

Domingos Magalhães is listed among the mestres who participated in this gathering, alongside Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Eulâmpio, Butique, and others. This places him among a notable generation of capoeira angola practitioners.

In a separate 1969 interview, when asked about capoeira leadership and federation organization, Mestre Pastinha specifically named Domingos de Magalhães among the capable mestres who could "make a good work": "There''s Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, not me, I don''t see any more, but these mestres could make a good work." This endorsement from Pastinha places Domingos Magalhães among the most respected capoeira angola mestres of his generation - those Pastinha considered capable of organizational leadership.

Notably, while Domingos Magalhães participated in the Liberdade roda, he was not among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola listed in Mestre Noronha''s manuscripts. Those founders included Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno, and Paquete do Cabula. This suggests Domingos Magalhães was a regular participant in the rodas and a respected mestre, but not an organizational founder of the formal centro in the 1920s.

In 1941, Mestre Pastinha was invited to witness the Sunday roda at Gengibirra by his former student Aberrê. The civil guard Amorzinho then handed leadership of the group to Pastinha, who founded the Centro Esportivo de Capoeira Angola (CECA). What became of Domingos Magalhães after this transition is undocumented, though Pastinha''s 1969 interview suggests he was still active or at least remembered as a capable leader at that time.',
  -- bio_pt
  E'Domingos Magalhães (também referido como Domingos de Magalhães) foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de praticantes tradicionais de capoeira angola que se reuniam no bairro da Liberdade/Gengibirra em Salvador antes da formalização das academias de capoeira.

A documentação principal de Domingos Magalhães vem de dois artigos de jornal de 1969 no A Tarde, reproduzidos em velhosmestres.com. Um artigo comemorando o aniversário da academia de Mestre Pastinha descrevia as reuniões informais de domingo no Gengibirra onde "muitos capoeiristas se reuniam aos domingos para jogar capoeira de Angola, sem se preocupar com os estilos de luta ou com a exibição." Eles formavam uma "academia" (no sentido informal de uma reunião regular), presidida pelo guarda civil Amorzinho.

Domingos Magalhães é listado entre os mestres que participavam dessa reunião, junto com Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Eulâmpio, Butique e outros. Isso o coloca entre uma geração notável de praticantes de capoeira angola.

Em uma entrevista separada de 1969, quando questionado sobre liderança da capoeira e organização de federação, Mestre Pastinha especificamente nomeou Domingos de Magalhães entre os mestres capazes que poderiam "fazer um bom trabalho": "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, eu não, não vejo mais, mas esses mestres poderiam fazer um bom trabalho." Este endosso de Pastinha coloca Domingos Magalhães entre os mestres de capoeira angola mais respeitados de sua geração - aqueles que Pastinha considerava capazes de liderança organizacional.

Notavelmente, embora Domingos Magalhães participasse da roda da Liberdade, ele não estava entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola listados nos manuscritos de Mestre Noronha. Esses fundadores incluíam Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno e Paquete do Cabula. Isso sugere que Domingos Magalhães era um participante regular das rodas e um mestre respeitado, mas não um fundador organizacional do centro formal nos anos 1920.

Em 1941, Mestre Pastinha foi convidado a assistir à roda de domingo no Gengibirra por seu antigo aluno Aberrê. O guarda civil Amorzinho então passou a liderança do grupo para Pastinha, que fundou o Centro Esportivo de Capoeira Angola (CECA). O que aconteceu com Domingos Magalhães após essa transição não está documentado, embora a entrevista de Pastinha em 1969 sugira que ele ainda estava ativo ou pelo menos era lembrado como um líder capaz naquela época.',
  -- achievements_en
  E'- Active participant at the historic Liberdade/Gengibirra roda (pre-1941)
- Named by Mestre Pastinha (1969) among the mestres capable of organizing a capoeira federation',
  -- achievements_pt
  E'- Participante ativo na histórica roda da Liberdade/Gengibirra (pré-1941)
- Nomeado por Mestre Pastinha (1969) entre os mestres capazes de organizar uma federação de capoeira',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade precision):
No birth date documented. Active at Gengibirra/Liberdade roda pre-1941 as an established participant alongside contemporaries like Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). In 1969, Pastinha still named him as a capable organizational leader, suggesting he was active or remembered at that time (~69 years old if born 1900). Using 1900 as midpoint estimate.

DEATH YEAR: Unknown. Alive or remembered as capable leader in 1969. Not listed among Pastinha''s 1967 list of deceased angoleiros de briga.

NAME VARIATION:
- "Domingos Magalhães" - Used in A Tarde Feb 24, 1969 article (velhosmestres.com/en/pastinha-1969-3)
- "Domingos de Magalhães" - Used by Pastinha in 1969 interview (velhosmestres.com/en/pastinha-1969)
The "de" is a common Portuguese surname connector; both refer to same person.

DOCUMENTATION:
Two primary sources from 1969, both reproduced at velhosmestres.com:
1. A Tarde, February 24, 1969 - Lists him among Liberdade roda mestres
2. Mestre Pastinha 1969 interview - Names him as capable Federation organizer

NOT A GENGIBIRRA FOUNDER: While Domingos Magalhães participated in the Liberdade roda, he is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola in Mestre Noronha''s manuscripts. This suggests different levels of involvement: the 22 founders were organizational leaders, while others like Domingos Magalhães were regular participants in the rodas.

PASTINHA''S ENDORSEMENT (1969):
Pastinha explicitly named him as one of the capable mestres who could organize a Federation: "There''s Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, not me, I don''t see any more, but these mestres could make a good work." This places him in the top tier of respected Angola mestres.

GENGIBIRRA RODA CONTEMPORARIES (pre-1941):
- Amorzinho (civil guard, roda president) - imported
- Totonho de Maré (Antônio Laurindo das Neves) - imported
- Mestre Noronha (Daniel Coutinho) - imported
- Livino (brother of Noronha) - imported
- Américo Ciência - imported
- Barbosa - imported
- Eulâmpio - imported
- Bulgário - imported
- Alemão - in backlog (as Alemão (Gengibirra))
- Butique - imported
- Antônio - in backlog (as Antônio (Gengibirra))',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década):
Nenhuma data de nascimento documentada. Ativo na roda do Gengibirra/Liberdade antes de 1941 como participante estabelecido junto com contemporâneos como Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). Em 1969, Pastinha ainda o nomeou como líder organizacional capaz, sugerindo que estava ativo ou lembrado naquela época (~69 anos se nascido em 1900). Usando 1900 como estimativa do ponto médio.

ANO DE MORTE: Desconhecido. Vivo ou lembrado como líder capaz em 1969. Não listado entre a lista de 1967 de Pastinha de angoleiros de briga falecidos.

VARIAÇÃO DE NOME:
- "Domingos Magalhães" - Usado no artigo A Tarde 24 de fevereiro de 1969 (velhosmestres.com/en/pastinha-1969-3)
- "Domingos de Magalhães" - Usado por Pastinha em entrevista de 1969 (velhosmestres.com/en/pastinha-1969)
O "de" é um conector de sobrenome comum em português; ambos referem-se à mesma pessoa.

DOCUMENTAÇÃO:
Duas fontes primárias de 1969, ambas reproduzidas em velhosmestres.com:
1. A Tarde, 24 de fevereiro de 1969 - Lista-o entre os mestres da roda da Liberdade
2. Entrevista de Mestre Pastinha 1969 - Nomeia-o como organizador capaz de Federação

NÃO É FUNDADOR DO GENGIBIRRA: Embora Domingos Magalhães participasse da roda da Liberdade, ele NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola nos manuscritos de Mestre Noronha. Isso sugere diferentes níveis de envolvimento: os 22 fundadores eram líderes organizacionais, enquanto outros como Domingos Magalhães eram participantes regulares das rodas.

ENDOSSO DE PASTINHA (1969):
Pastinha explicitamente o nomeou como um dos mestres capazes que poderiam organizar uma Federação: "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, eu não, não vejo mais, mas esses mestres poderiam fazer um bom trabalho." Isso o coloca no nível mais alto de mestres de Angola respeitados.

CONTEMPORÂNEOS DA RODA DO GENGIBIRRA (pré-1941):
- Amorzinho (guarda civil, presidente da roda) - importado
- Totonho de Maré (Antônio Laurindo das Neves) - importado
- Mestre Noronha (Daniel Coutinho) - importado
- Livino (irmão de Noronha) - importado
- Américo Ciência - importado
- Barbosa - importado
- Eulâmpio - importado
- Bulgário - importado
- Alemão - no backlog (como Alemão (Gengibirra))
- Butique - importado
- Antônio - no backlog (como Antônio (Gengibirra))'
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

-- Source: entities/persons/esperidiao.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Esperidião
-- Generated: 2026-01-03
-- ============================================================
-- Profile Type: proto_mestre
-- Era: Late 19th - early 20th century
--
-- BIRTH YEAR ESTIMATION (~1880, decade):
-- - Cobrinha Verde (b. 1912) learned from him after Besouro's death (1924)
-- - Esperidião was already an established capoeirista/teacher in Santo Amaro
-- - Capoeira teachers typically active in their 30s-40s
-- - If teaching in mid-1920s at age 40-45, born ~1880
--
-- SPELLING VARIATION: Also appears as "Espiridião" in some sources
--
-- NAME DISCREPANCY: The backlog listed "Esperidião Miguel de Santana"
-- as full name, but no primary source confirms this. The name may have
-- been confused with another figure. Using NULL for name until verified.
--
-- SOURCE: Mestre Cobrinha Verde's autobiographical testimony:
-- "I learned from many mestres in Santo Amaro. I will give their names
-- one by one: Maitá (who even had a samba song named after him), Licurí,
-- Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião,
-- Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."
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
  'Esperidião',
  NULL,
  NULL,
  ARRAY['https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/', 'https://capoeira.online/history/mestres/cobrinha-verde/', 'https://www.lalaue.com/learn-capoeira/mestre-cobrinha-verde']::text[],
  NULL,
  NULL,
  NULL,
  1880, 'decade'::genealogy.date_precision, 'Santo Amaro da Purificação, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Esperidião was one of the capoeiristas of Santo Amaro da Purificação in the Recôncavo Baiano who taught Mestre Cobrinha Verde during the early twentieth century. His name appears in Cobrinha Verde''s autobiographical testimony listing the mestres from whom he learned after the death of his primary teacher, Besouro Mangangá, in 1924.\n\nIn his autobiography, Cobrinha Verde stated: "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nSanto Amaro da Purificação, in Cobrinha Verde''s own words, was "the birthplace of Bahian capoeira." Esperidião was part of the generation that made it so. He belonged to an era when capoeira was practiced informally in streets, docks, and festivals—before the establishment of formal academies. These proto-mestres passed down the art through lived experience rather than structured curriculum, training the next generation amid police persecution and the daily struggle of working-class life in the Recôncavo.\n\nNothing more is currently known about Esperidião—his full name, his profession, his life story have not survived in documented sources. He remains one of the shadowy figures of capoeira''s oral history: known to have existed, known to have taught one of the great mestres of the twentieth century, but preserved only in the memory of those who came after.',
  E'Esperidião foi um dos capoeiristas de Santo Amaro da Purificação no Recôncavo Baiano que ensinou Mestre Cobrinha Verde durante o início do século XX. Seu nome aparece no testemunho autobiográfico de Cobrinha Verde listando os mestres com quem aprendeu após a morte de seu professor principal, Besouro Mangangá, em 1924.\n\nEm sua autobiografia, Cobrinha Verde declarou: "Aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um por um: Maitá (que até tinha um samba com nome dele), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nSanto Amaro da Purificação, nas próprias palavras de Cobrinha Verde, era "o berço da capoeira baiana." Esperidião fez parte da geração que a tornou assim. Ele pertenceu a uma era em que a capoeira era praticada informalmente nas ruas, docas e festas—antes do estabelecimento de academias formais. Esses proto-mestres passavam a arte através da experiência vivida em vez de currículo estruturado, treinando a próxima geração em meio à perseguição policial e à luta diária da vida da classe trabalhadora no Recôncavo.\n\nNada mais se sabe atualmente sobre Esperidião—seu nome completo, sua profissão, sua história de vida não sobreviveram em fontes documentadas. Ele permanece uma das figuras obscuras da história oral da capoeira: sabidamente existiu, sabidamente ensinou um dos grandes mestres do século XX, mas preservado apenas na memória daqueles que vieram depois.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1880, decade):\nCobrinha Verde (b. 1912) learned from Esperidião after Besouro''s death in 1924, when Cobrinha was about 12 years old. Esperidião was already an established teacher at this time. Capoeira teachers were typically active in their 30s-40s, so if teaching in the mid-1920s at age 40-45, he was likely born around 1880.\n\nNAME DISCREPANCY:\n- Backlog listed "Esperidião Miguel de Santana" as full name\n- No primary source found to verify this full name\n- Using NULL for name until verified\n\nSPELLING VARIATION:\n- Also appears as "Espiridião" in some sources (with "i" instead of first "e")\n- Using "Esperidião" as primary spelling based on majority of sources\n\nTEACHERS:\n- Unknown; predates documented lineage records\n\nSTUDENTS:\n- Cobrinha Verde (Rafael Alves França, trained after 1924, Santo Amaro)\n\nCONTEMPORARIES (Santo Amaro proto-mestres):\n- Maitá (had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo, Tonha Rolo do Mar\n\nNOTES:\n- Title is NULL because formal mestre titles did not exist in the modern sense during his era\n- Style is NULL because the Angola/Regional distinction came later',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1880, década):\nCobrinha Verde (n. 1912) aprendeu com Esperidião após a morte de Besouro em 1924, quando Cobrinha tinha cerca de 12 anos. Esperidião já era um professor estabelecido neste momento. Mestres de capoeira geralmente ensinavam entre 30-45 anos, então se ensinava em meados dos anos 1920 com 40-45 anos, provavelmente nasceu por volta de 1880.\n\nDISCREPÂNCIA DE NOME:\n- Backlog listou "Esperidião Miguel de Santana" como nome completo\n- Nenhuma fonte primária encontrada para verificar este nome completo\n- Usando NULL para nome até ser verificado\n\nVARIAÇÃO DE GRAFIA:\n- Também aparece como "Espiridião" em algumas fontes (com "i" em vez do primeiro "e")\n- Usando "Esperidião" como grafia principal com base na maioria das fontes\n\nPROFESSORES:\n- Desconhecido; antecede registros de linhagem documentados\n\nALUNOS:\n- Cobrinha Verde (Rafael Alves França, treinou após 1924, Santo Amaro)\n\nCONTEMPORÂNEOS (proto-mestres de Santo Amaro):\n- Maitá (tinha um samba com seu nome), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo, Tonha Rolo do Mar\n\nNOTAS:\n- Título é NULL porque títulos formais de mestre não existiam no sentido moderno durante sua era\n- Estilo é NULL porque a distinção Angola/Regional veio depois'
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

-- Source: entities/persons/espinho-remoso.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Espinho Remoso
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR (~1910, approximate): No exact birth date documented in sources.
-- DEATH YEAR (1960): Confirmed by Jornal Metropolitano (1960), Wikipedia PT.
-- NICKNAME ORIGIN: During capoeira game, thorn (espinho) entered his knee;
-- Tiodé da Quibaca removed it and suggested the name "Espinho Remoso".
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Elízio Maximiano Ferreira', 'Espinho Remoso', 'mestre'::genealogy.title, NULL,
  ARRAY['https://pt.wikipedia.org/wiki/Mestre_Espinho_Remoso', 'https://www.scribd.com/document/491988034/Da-Velha-Guarda-da-Capoeira-da-Bahia-trajetoria-e-legado-do-mestre-Espinho-Remoso']::text[],
  'angola'::genealogy.style,
  E'Pre-codification era capoeirista from Santo Amaro sugarcane mill tradition. Ran informal Sunday rodas at Jaqueira do Carneiro in Fazenda Grande do Retiro, Salvador.',
  E'Capoeirista da era pré-codificação da tradição dos engenhos de cana de Santo Amaro. Conduzia rodas informais aos domingos em Jaqueira do Carneiro em Fazenda Grande do Retiro, Salvador.',
  1910, 'approximate'::genealogy.date_precision, 'Teixeira de Freitas, Bahia, Brazil',
  1960, 'year'::genealogy.date_precision, 'Salvador, Bahia, Brazil',
  E'Elízio Maximiano Ferreira, known as Mestre Espinho Remoso, was born around 1910 in Teixeira de Freitas, Bahia. He learned the art of capoeira while working in the sugarcane mills of Santo Amaro, a city considered the cradle of Bahian capoeira.

In Santo Amaro, he met Mestre Cassarangongo (Antônio Elói dos Santos) at Engenho da Pindoba, located between Santo Amaro and Candeias. The two worked together in the sugarcane fields and would play capoeira after work, becoming great friends. They later reunited in Salvador.

His distinctive nickname originated from an incident during a capoeira game. A thorn (espinho) entered Elízio''s knee, leaving it swollen. A man named Tiodé da Quibaca, who was watching as a spectator, removed the thorn but the tip remained stuck. Tiodé hit the knee and the tip came out. From that day, Tiodé suggested Elízio take the name "Espinho Remoso" (roughly "inflamed thorn" - "remoso" possibly being a corruption of "reuma," meaning something that attacks the body).

According to Mestre Zé do Lenço (a disciple of one of Remoso''s students), Espinho Remoso was a short, Black, muscular man and a practitioner of Candomblé.

In Salvador, Espinho Remoso sold offal in the Retiro neighborhood and performed important capoeira work at Jaqueira do Carneiro (in the Fazenda Grande do Retiro neighborhood). Unlike formal academies, he operated a kiosk where, every Sunday, fellow capoeiristas would gather to play. These Sunday rodas attracted significant figures of Bahian capoeira in the 1950s, including Mestre Waldemar, Mestre Paulo dos Anjos, and Zacarias Boa Morte.

According to the Jornal Metropolitano (1960), he was considered one of the outstanding capoeiristas of the era in the Liberdade neighborhood, alongside Mestre Traíra, Mestre Waldemar, Cabeça de Bagre, Mestre Bimba, and others.

Espinho Remoso trained many students, including: Diogo, Fulô, Florzinho, Valdir, Loriano da Boca do Rio, Gerônimo, Raimundo, Antônio Catarino, Dario do Pandeiro, Buiu, Florisvaldo, Moisés, Valdomiro, Chico Zoião, and Firmino. His student Mestre Diogo carried out his funeral in 1960.

He is also listed among the teachers of Mestre Cobrinha Verde in Santo Amaro, placing him among the foundational capoeiristas of the pre-codification era.

His son Virgílio (Virgílio Maximiano Ferreira, later known as Mestre Virgílio da Fazenda Grande) was initiated in capoeira by him in 1954 at age ten. Virgílio was his only child with his wife Edite Isabel dos Santos. After Espinho Remoso''s death in 1960, Virgílio continued his father''s Sunday roda at Jaqueira do Carneiro and later received his mestre title from Mestre Paulo dos Anjos.

The memory of Espinho Remoso is preserved by the Associação de Capoeira Angola Relíquia Espinho Remoso, led by Mestre Zé do Lenço, with headquarters at Sete Portas and São Miguel market in Salvador.',
  E'Elízio Maximiano Ferreira, conhecido como Mestre Espinho Remoso, nasceu por volta de 1910 em Teixeira de Freitas, Bahia. Aprendeu a arte da capoeira enquanto trabalhava nos engenhos de cana de Santo Amaro, cidade considerada o berço da capoeira baiana.

Em Santo Amaro, conheceu Mestre Cassarangongo (Antônio Elói dos Santos) no Engenho da Pindoba, localizado entre Santo Amaro e Candeias. Os dois trabalhavam juntos nos canaviais e jogavam capoeira após o trabalho, tornando-se grandes amigos. Depois se reencontraram em Salvador.

Seu apelido distintivo originou-se de um incidente durante um jogo de capoeira. Um espinho entrou no joelho de Elízio, deixando-o inchado. Um homem chamado Tiodé da Quibaca, que assistia como espectador, removeu o espinho mas a ponta ficou presa. Tiodé bateu no joelho e a ponta saiu. A partir desse dia, Tiodé sugeriu que Elízio adotasse o nome "Espinho Remoso" ("remoso" possivelmente sendo uma corrupção de "reuma," significando algo que ataca o corpo).

Segundo Mestre Zé do Lenço (discípulo de um dos alunos de Remoso), Espinho Remoso era um homem baixo, negro, musculoso e praticante de Candomblé.

Em Salvador, Espinho Remoso vendia miúdos no bairro do Retiro e realizou importante trabalho de capoeira em Jaqueira do Carneiro (no bairro de Fazenda Grande do Retiro). Diferente das academias formais, ele operava um quiosque onde, todo domingo, capoeiristas se reuniam para jogar. Essas rodas de domingo atraíam figuras significativas da capoeira baiana nos anos 1950, incluindo Mestre Waldemar, Mestre Paulo dos Anjos e Zacarias Boa Morte.

Segundo o Jornal Metropolitano (1960), ele era considerado um dos capoeiristas destacados da época no bairro da Liberdade, ao lado de Mestre Traíra, Mestre Waldemar, Cabeça de Bagre, Mestre Bimba e outros.

Espinho Remoso treinou muitos alunos, incluindo: Diogo, Fulô, Florzinho, Valdir, Loriano da Boca do Rio, Gerônimo, Raimundo, Antônio Catarino, Dario do Pandeiro, Buiu, Florisvaldo, Moisés, Valdomiro, Chico Zoião e Firmino. Seu aluno Mestre Diogo realizou seu funeral em 1960.

Ele também é listado entre os professores de Mestre Cobrinha Verde em Santo Amaro, colocando-o entre os capoeiristas fundacionais da era pré-codificação.

Seu filho Virgílio (Virgílio Maximiano Ferreira, posteriormente conhecido como Mestre Virgílio da Fazenda Grande) foi iniciado na capoeira por ele em 1954 aos dez anos de idade. Virgílio era seu único filho com sua esposa Edite Isabel dos Santos. Após a morte de Espinho Remoso em 1960, Virgílio continuou a roda de domingo de seu pai em Jaqueira do Carneiro e depois recebeu seu título de mestre de Mestre Paulo dos Anjos.

A memória de Espinho Remoso é preservada pela Associação de Capoeira Angola Relíquia Espinho Remoso, liderada por Mestre Zé do Lenço, com sede em Sete Portas e no Mercado de São Miguel em Salvador.',
  E'- Learned capoeira in Santo Amaro sugarcane mills (~1910s-1920s)
- Listed among teachers of Mestre Cobrinha Verde
- Established influential Sunday roda at Jaqueira do Carneiro (1950s)
- Initiated son Virgílio into capoeira (1954)
- Named among Liberdade standouts (Jornal Metropolitano, 1960)
- Trained 15+ documented students including Mestre Diogo
- Legacy preserved by Associação de Capoeira Angola Relíquia Espinho Remoso',
  E'- Aprendeu capoeira nos engenhos de cana de Santo Amaro (~1910s-1920s)
- Listado entre os professores de Mestre Cobrinha Verde
- Estabeleceu influente roda de domingo em Jaqueira do Carneiro (anos 1950)
- Iniciou o filho Virgílio na capoeira (1954)
- Nomeado entre os destaques da Liberdade (Jornal Metropolitano, 1960)
- Treinou 15+ alunos documentados incluindo Mestre Diogo
- Legado preservado pela Associação de Capoeira Angola Relíquia Espinho Remoso',
  E'BIRTH YEAR (~1910, approximate):
No exact birth date documented in sources. Wikipedia PT gives "1910" but this appears to be an estimate.

DEATH YEAR (1960):
Confirmed by multiple sources including Jornal Metropolitano (1960) and Wikipedia PT.

PHYSICAL DESCRIPTION:
Short, Black, muscular. Source: Mestre Zé do Lenço via Scribd academic document.

RELIGION:
Candomblé practitioner.

WIFE NAME DISCREPANCY:
- Edite Isabel dos Santos - Wikipedia PT, Portal Capoeira (mother of Virgílio)
- Dona Epifania - Wikipedia PT mentions he died "na casa de sua esposa dona Epifania"
This may indicate a second wife or an error in sources.

STUDENTS (15 documented):
Diogo, Fulô, Florzinho, Valdir, Loriano da Boca do Rio, Gerônimo, Raimundo, Antônio Catarino, Dario do Pandeiro, Buiu, Florisvaldo, Moisés, Valdomiro, Chico Zoião, Firmino. Mestre Diogo conducted his funeral.

COBRINHA VERDE CONNECTION:
Listed among Cobrinha Verde''s teachers in Santo Amaro alongside Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, and Neco Canário Pardo.

DATA ERROR IN GATO PRETO:
The existing gato-preto.sql file incorrectly states "Espinho Remoso (taught at Gato Preto''s academies in the 1970s)". This is IMPOSSIBLE since Espinho Remoso died in 1960. The Gato Preto data should be corrected.

PENDING ENTITIES FOR BACKLOG:
- Mestre Diogo (student who conducted funeral) - added to persons-backlog.md
- Cabeça de Bagre (Jornal Metropolitano 1960) - added to persons-backlog.md
- Mestre Cassarangongo already in persons-backlog.md
- Associação de Capoeira Angola Relíquia de Espinho Remoso already in groups-backlog.md',
  E'ANO DE NASCIMENTO (~1910, aproximado):
Nenhuma data exata de nascimento documentada nas fontes. Wikipedia PT dá "1910" mas isso parece ser uma estimativa.

ANO DE MORTE (1960):
Confirmado por múltiplas fontes incluindo Jornal Metropolitano (1960) e Wikipedia PT.

DESCRIÇÃO FÍSICA:
Baixo, negro, musculoso. Fonte: Mestre Zé do Lenço via documento acadêmico no Scribd.

RELIGIÃO:
Praticante de Candomblé.

DISCREPÂNCIA NO NOME DA ESPOSA:
- Edite Isabel dos Santos - Wikipedia PT, Portal Capoeira (mãe de Virgílio)
- Dona Epifania - Wikipedia PT menciona que ele morreu "na casa de sua esposa dona Epifania"
Isso pode indicar uma segunda esposa ou um erro nas fontes.

ALUNOS (15 documentados):
Diogo, Fulô, Florzinho, Valdir, Loriano da Boca do Rio, Gerônimo, Raimundo, Antônio Catarino, Dario do Pandeiro, Buiu, Florisvaldo, Moisés, Valdomiro, Chico Zoião, Firmino. Mestre Diogo conduziu seu funeral.

CONEXÃO COM COBRINHA VERDE:
Listado entre os professores de Cobrinha Verde em Santo Amaro junto com Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso e Neco Canário Pardo.

ERRO DE DADOS EM GATO PRETO:
O arquivo gato-preto.sql existente afirma incorretamente "Espinho Remoso (ensinou nas academias de Gato Preto nos anos 1970)". Isso é IMPOSSÍVEL já que Espinho Remoso morreu em 1960. Os dados de Gato Preto devem ser corrigidos.

ENTIDADES PENDENTES PARA BACKLOG:
- Mestre Diogo (aluno que conduziu funeral) - adicionado a persons-backlog.md
- Cabeça de Bagre (Jornal Metropolitano 1960) - adicionado a persons-backlog.md
- Mestre Cassarangongo já está em persons-backlog.md
- Associação de Capoeira Angola Relíquia de Espinho Remoso já está em groups-backlog.md'
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

-- Source: entities/persons/eulampio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Eulâmpio
-- Generated: 2026-01-02
-- ============================================================
-- Historical capoeira mestre from Salvador, Bahia. Close associate
-- of Mestre Cobrinha Verde (called "brother"). One of the founding
-- mestres of Centro Esportivo de Capoeira Angola (CECA) in 1941.
-- Active at the Liberdade/Gengibirra roda pre-1941. Listed as
-- student of Cobrinha Verde alongside João Grande, João Pequeno,
-- Moreno, and Gigante.
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1905 (decade precision)
-- Active as mestre at Gengibirra roda pre-1941, suggesting he was
-- an established capoeirista by late 1930s (age 30-45). Close
-- associate of Cobrinha Verde (b.1912), suggesting similar or
-- slightly older generation. If active alongside mestres at
-- Gengibirra founding, likely born 1900-1915. Using 1905 as
-- midpoint estimate with decade precision.
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
  NULL,
  'Eulâmpio',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://capoeira.online/history/mestres/cobrinha-verde/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola practitioner. Active at the Liberdade/Gengibirra roda before formal academy structures existed. Part of the generation that established organized capoeira angola in Salvador.',
  E'Praticante de Capoeira de Angola tradicional. Ativo na roda da Liberdade/Gengibirra antes das estruturas formais de academia existirem. Parte da geração que estabeleceu a capoeira angola organizada em Salvador.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil (presumed)',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Eulâmpio (also spelled Olampio in some sources) was a capoeirista active in Salvador, Bahia, during the formative years of organized capoeira angola. He was part of the generation that gathered at the famous Liberdade/Gengibirra roda on Sundays, where the best capoeiristas of Bahia convened to practice and preserve traditional capoeira de angola.

His closest documented relationship was with Mestre Cobrinha Verde. In his autobiography "Capoeira e Mandingas," Cobrinha Verde recalls a visit to the São Tomé de Paripe naval base with Mestre Pastinha, stating: "Eu e Eulâmpio - aquele que eu chamava de irmão" (Eulampio - who I called my brother). This designation as "brother" indicates an extraordinarily close bond, suggesting they may have trained together, performed together regularly, or shared a deep personal friendship forged through capoeira.

Eulâmpio is listed among the mestres who gathered at the informal "academy" in the Gengibirra neighborhood of Liberdade, alongside Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, and Butique. The civil guard Amorzinho presided over this gathering. In February 1941, when Mestre Pastinha was invited to lead this group, Eulâmpio was among those present—making him one of the founding mestres of what would become the Centro Esportivo de Capoeira Angola (CECA).

Notably, while Eulâmpio participated in the Liberdade roda and the CECA founding, he is not listed among the 22 founding mestres of the earlier Centro Nacional de Capoeira de Origem Angola (Gengibirra) according to Mestre Noronha''s manuscripts. This suggests he was a regular participant and respected mestre, but not among the original organizational founders of the 1920s center.

Portuguese Wikipedia and Capoeira Online sources list Eulâmpio as a student of Mestre Cobrinha Verde, alongside João Grande, João Pequeno, Moreno, and Gigante. This placement among such distinguished company underscores his significance in the Angola lineage, though his individual biography remains largely undocumented.',
  -- bio_pt
  E'Eulâmpio (também grafado Olampio em algumas fontes) foi um capoeirista ativo em Salvador, Bahia, durante os anos formativos da capoeira angola organizada. Ele fazia parte da geração que se reunia na famosa roda da Liberdade/Gengibirra aos domingos, onde os melhores capoeiristas da Bahia se reuniam para praticar e preservar a capoeira de angola tradicional.

Sua relação documentada mais próxima foi com Mestre Cobrinha Verde. Em sua autobiografia "Capoeira e Mandingas," Cobrinha Verde recorda uma visita à base naval de São Tomé de Paripe com Mestre Pastinha, afirmando: "Eu e Eulâmpio - aquele que eu chamava de irmão." Esta designação como "irmão" indica um vínculo extraordinariamente próximo, sugerindo que podem ter treinado juntos, se apresentado regularmente juntos, ou compartilhado uma amizade pessoal profunda forjada através da capoeira.

Eulâmpio é listado entre os mestres que se reuniam na "academia" informal no bairro do Gengibirra, Liberdade, junto com Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães e Butique. O guarda civil Amorzinho presidia esta reunião. Em fevereiro de 1941, quando Mestre Pastinha foi convidado a liderar este grupo, Eulâmpio estava entre os presentes—tornando-o um dos mestres fundadores do que se tornaria o Centro Esportivo de Capoeira Angola (CECA).

Notavelmente, embora Eulâmpio participasse da roda da Liberdade e da fundação do CECA, ele não está listado entre os 22 mestres fundadores do anterior Centro Nacional de Capoeira de Origem Angola (Gengibirra) segundo os manuscritos de Mestre Noronha. Isso sugere que era um participante regular e mestre respeitado, mas não entre os fundadores organizacionais originais do centro dos anos 1920.

A Wikipédia em português e fontes do Capoeira Online listam Eulâmpio como aluno de Mestre Cobrinha Verde, junto com João Grande, João Pequeno, Moreno e Gigante. Esta colocação em tão distinta companhia sublinha sua importância na linhagem Angola, embora sua biografia individual permaneça em grande parte não documentada.',
  -- achievements_en
  E'- One of the founding mestres of Centro Esportivo de Capoeira Angola (CECA) on February 23, 1941
- Active participant at the historic Liberdade/Gengibirra roda
- Close associate of Mestre Cobrinha Verde (called "brother")
- Student of Mestre Cobrinha Verde alongside João Grande, João Pequeno, Moreno, and Gigante',
  -- achievements_pt
  E'- Um dos mestres fundadores do Centro Esportivo de Capoeira Angola (CECA) em 23 de fevereiro de 1941
- Participante ativo na histórica roda da Liberdade/Gengibirra
- Associado próximo de Mestre Cobrinha Verde (chamado de "irmão")
- Aluno de Mestre Cobrinha Verde junto com João Grande, João Pequeno, Moreno e Gigante',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1905, decade precision):
Active as mestre at Gengibirra roda pre-1941, suggesting established capoeirista by late 1930s (age 30-45). Close associate of Cobrinha Verde (b.1912), suggesting similar or slightly older generation. Using 1905 as midpoint estimate.

NAME VARIATION:
- "Eulâmpio" - Used in A Tarde 1969 article, velhosmestres.com, Cobrinha Verde''s autobiography
- "Eulampio" - Used in capoeira.online, Portuguese Wikipedia (without accent)
- "Olampio" - Used in some CECA founding lists (likely transcription variant)
All refer to same person.

TEACHERS:
- Mestre Cobrinha Verde (Rafael Alves França) - Listed as student in Portuguese Wikipedia and capoeira.online

FELLOW STUDENTS UNDER COBRINHA VERDE:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Moreno
- Gigante (Bigodinho)

GENGIBIRRA/LIBERDADE RODA CONTEMPORARIES (pre-1941):
Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, Butique, Amorzinho (president)

CECA FOUNDING (February 23, 1941):
Present at founding alongside Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Zeir, Vitor H.D., Alemão filho de Maré, Domingo de Mlhães, Beraldo Izaque dos Santos, Pinião José Chibata, Ricardo B. dos Santos.

MEDIA APPEARANCES:
- Mentioned in Cobrinha Verde''s autobiography "Capoeira e Mandingas" by Marcelino dos Santos
- Listed in A Tarde newspaper article (February 24, 1969) among Liberdade mestres

NOT AMONG 22 GENGIBIRRA FOUNDERS:
According to Mestre Noronha''s manuscripts, Eulâmpio is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola (1920s). This suggests he was a regular participant but not an organizational founder of the original center.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década):
Ativo como mestre na roda do Gengibirra pré-1941, sugerindo capoeirista estabelecido no final dos anos 1930 (idade 30-45). Associado próximo de Cobrinha Verde (n.1912), sugerindo geração similar ou um pouco mais velha. Usando 1905 como estimativa de ponto médio.

VARIAÇÃO DE NOME:
- "Eulâmpio" - Usado no artigo A Tarde 1969, velhosmestres.com, autobiografia de Cobrinha Verde
- "Eulampio" - Usado no capoeira.online, Wikipédia em português (sem acento)
- "Olampio" - Usado em algumas listas de fundação do CECA (provável variante de transcrição)
Todos referem-se à mesma pessoa.

MESTRES:
- Mestre Cobrinha Verde (Rafael Alves França) - Listado como aluno na Wikipédia em português e capoeira.online

COLEGAS DE TREINO SOB COBRINHA VERDE:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Moreno
- Gigante (Bigodinho)

CONTEMPORÂNEOS DA RODA GENGIBIRRA/LIBERDADE (pré-1941):
Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, Butique, Amorzinho (presidente)

FUNDAÇÃO DO CECA (23 de fevereiro de 1941):
Presente na fundação junto com Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Zeir, Vitor H.D., Alemão filho de Maré, Domingo de Mlhães, Beraldo Izaque dos Santos, Pinião José Chibata, Ricardo B. dos Santos.

APARIÇÕES NA MÍDIA:
- Mencionado na autobiografia de Cobrinha Verde "Capoeira e Mandingas" por Marcelino dos Santos
- Listado no artigo do jornal A Tarde (24 de fevereiro de 1969) entre os mestres da Liberdade

NÃO ENTRE OS 22 FUNDADORES DO GENGIBIRRA:
Segundo os manuscritos de Mestre Noronha, Eulâmpio NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola (anos 1920). Isso sugere que era um participante regular mas não um fundador organizacional do centro original.'
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

-- Source: entities/persons/fernandinho.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Fernandinho
-- Generated: 2026-01-02
-- ============================================================
-- Full Name: Fernando Olímpio Paes Filho
-- Apelido: Fernandinho (also known as Mano)
-- Title: Contra-Mestre
--
-- Fernandinho was the youngest of three capoeirista brothers from
-- the famous Moraes Paes family of Massaranduba, Salvador. He first
-- learned capoeira from his older brother Nilton, then moved to
-- Rio de Janeiro where he became contra-mestre under Mestre Caiçara.
-- His diploma was signed by Silvestre (Ferreirinha), also a contra-mestre
-- of Caiçara. He later moved to Campo Grande, MS, where he pioneered
-- capoeira instruction. He died on May 5, 2001, tragically killed in
-- an attack, leaving two children.
--
-- Source: velhosmestres.com (Zeca and the Old Masters of the Lower City)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Fernando Olímpio Paes Filho',
  'Fernandinho',
  'contra-mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-39', 'https://velhosmestres.com/br/destaques-39']::text[],
  'angola'::genealogy.style,
  E'Fernandinho was trained in the traditional capoeira angola style of Salvador''s Cidade Baixa (Lower City). He first learned from his brother Nilton, who had trained under Ninho, Pierrô, and Zeca do Uruguai. He later formalized his training under Mestre Caiçara in Rio de Janeiro, representing the continuation of the Bahian angola tradition in a new city.',
  E'Fernandinho foi treinado no estilo tradicional de capoeira angola da Cidade Baixa de Salvador. Primeiro aprendeu com seu irmão Nilton, que havia treinado com Ninho, Pierrô e Zeca do Uruguai. Depois formalizou seu treinamento com Mestre Caiçara no Rio de Janeiro, representando a continuação da tradição angola baiana em uma nova cidade.',
  1948,
  'exact'::genealogy.date_precision,
  'Massaranduba, Salvador, Bahia, Brazil',
  2001,
  'exact'::genealogy.date_precision,
  'Campo Grande, Mato Grosso do Sul, Brazil',
  E'Fernando Olímpio Paes Filho, known as Fernandinho or Mano, was born on March 26, 1948, in Massaranduba, a poor neighborhood in Salvador''s Cidade Baixa (Lower City), near the famous church of Bonfim. He was the youngest of three capoeirista brothers from the remarkable Moraes Paes family—nineteen children in all, fourteen boys and five girls.\n\nHis first capoeira lessons came from his older brother Nilton (born October 16, 1937), who had trained under Ninho from Ribeira, Pierrô, and Mestre Zeca do Uruguai. Through Nilton, Fernandinho inherited the Lower City lineage—the rhythm, mandinga, and neighborhood style that characterized mid-20th century Salvador. His other brother Cutica (Nelson Moraes Paes, 1941-1970), also known as Índio, was likewise a respected capoeirista who, together with Nilton, had trained and certified the young Mestre Nô in 1964.\n\nWhile his brothers remained rooted in Salvador''s street rodas, Fernandinho took a different path. He moved to Rio de Janeiro, where he connected with Mestre Caiçara (Antônio Conceição Moraes, 1924-1997), the legendary Angola master known for his hard fighting style, powerful voice, and iconic bengala. Caiçara had strong ties to Rio through his influence on the "Angola da Penha" movement. Under Caiçara, Fernandinho rose to the rank of contra-mestre.\n\nAccording to Omilad D''Angola: "Mestre Caiçara sold fish on the small market of Jardim Cruzeiro, in the lower city neighborhood. Here he got many to become his contramestres. Such as Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) and others."\n\nFernandinho''s diploma as contra-mestre was signed by Silvestre (Silvestre Vitório Ferreira, also known as Ferreirinha), who was likewise a contra-mestre under Caiçara. This connection to Silvestre—who trained under Waldemar da Liberdade, Pastinha, Bimba, and Caiçara, and later founded Grupo Vera Cruz in São Paulo—placed Fernandinho within a network of Caiçara disciples who spread capoeira across Brazil.\n\nIn Rio de Janeiro, Fernandinho connected with "the elite of capoeira" of that era. According to testimonies, he interacted with renowned masters including Camisa, Gado, Nestor, Macaco Preto, Macaco Branco, Artur Emídio, Touro, Nacional, and Medeiros—figures who were shaping the Rio capoeira scene in the 1970s and 1980s.\n\nFernandinho later relocated to Campo Grande, Mato Grosso do Sul, where he became a pioneering capoeira instructor, bringing the Bahian angola tradition to Brazil''s center-west region. He developed a student base there, including Mestre Dentinho (according to one testimony).\n\nOn May 5, 2001, Fernandinho was tragically killed in an attack, leaving behind two children. He was 53 years old. His death cut short a career that had bridged three Brazilian regions—from Massaranduba''s street rodas to Rio''s competitive scene to Mato Grosso do Sul''s emerging capoeira community.\n\nFernandinho represents the continuation of the Moraes Paes family''s capoeira legacy. While his brothers Nilton and Cutica built their reputations in Salvador and trained the great Mestre Nô, Fernandinho carried the family tradition to new territories, connecting Bahia''s traditional angola lineage with the expanding national capoeira movement.',
  E'Fernando Olímpio Paes Filho, conhecido como Fernandinho ou Mano, nasceu em 26 de março de 1948, em Massaranduba, um bairro pobre na Cidade Baixa de Salvador, perto da famosa igreja do Bonfim. Era o mais novo de três irmãos capoeiristas da notável família Moraes Paes—dezenove filhos ao todo, quatorze meninos e cinco meninas.\n\nSuas primeiras lições de capoeira vieram de seu irmão mais velho Nilton (nascido em 16 de outubro de 1937), que havia treinado com Ninho da Ribeira, Pierrô e Mestre Zeca do Uruguai. Através de Nilton, Fernandinho herdou a linhagem da Cidade Baixa—o ritmo, mandinga e estilo de bairro que caracterizava Salvador em meados do século XX. Seu outro irmão Cutica (Nelson Moraes Paes, 1941-1970), também conhecido como Índio, era igualmente um capoeirista respeitado que, junto com Nilton, treinou e certificou o jovem Mestre Nô em 1964.\n\nEnquanto seus irmãos permaneceram enraizados nas rodas de rua de Salvador, Fernandinho seguiu um caminho diferente. Mudou-se para o Rio de Janeiro, onde se conectou com Mestre Caiçara (Antônio Conceição Moraes, 1924-1997), o lendário mestre de Angola conhecido por seu estilo de luta duro, voz poderosa e icônica bengala. Caiçara tinha fortes laços com o Rio através de sua influência no movimento "Angola da Penha". Sob Caiçara, Fernandinho alcançou o posto de contra-mestre.\n\nSegundo Omilad D''Angola: "Mestre Caiçara vendia peixe no pequeno mercado do Jardim Cruzeiro, no bairro da cidade baixa. Lá conseguiu muitos para se tornarem seus contramestres. Como Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) e outros."\n\nO diploma de contra-mestre de Fernandinho foi assinado por Silvestre (Silvestre Vitório Ferreira, também conhecido como Ferreirinha), que era igualmente contra-mestre de Caiçara. Essa conexão com Silvestre—que treinou com Waldemar da Liberdade, Pastinha, Bimba e Caiçara, e depois fundou o Grupo Vera Cruz em São Paulo—colocou Fernandinho dentro de uma rede de discípulos de Caiçara que espalharam a capoeira pelo Brasil.\n\nNo Rio de Janeiro, Fernandinho conectou-se com "a elite da capoeira" daquela época. Segundo testemunhos, ele interagia com mestres renomados incluindo Camisa, Gado, Nestor, Macaco Preto, Macaco Branco, Artur Emídio, Touro, Nacional e Medeiros—figuras que estavam moldando a cena carioca de capoeira nos anos 1970 e 1980.\n\nFernandinho mais tarde se mudou para Campo Grande, Mato Grosso do Sul, onde se tornou um instrutor pioneiro de capoeira, levando a tradição angola baiana para a região centro-oeste do Brasil. Desenvolveu uma base de alunos lá, incluindo Mestre Dentinho (segundo um testemunho).\n\nEm 5 de maio de 2001, Fernandinho foi tragicamente morto em um ataque, deixando dois filhos. Tinha 53 anos. Sua morte interrompeu uma carreira que havia conectado três regiões brasileiras—das rodas de rua de Massaranduba à cena competitiva do Rio até a comunidade emergente de capoeira de Mato Grosso do Sul.\n\nFernandinho representa a continuação do legado capoeirístico da família Moraes Paes. Enquanto seus irmãos Nilton e Cutica construíram suas reputações em Salvador e treinaram o grande Mestre Nô, Fernandinho levou a tradição familiar para novos territórios, conectando a linhagem angola tradicional da Bahia com o movimento nacional de capoeira em expansão.',
  E'First capoeira training under his brother Nilton in Massaranduba, Salvador
Rose to rank of contra-mestre under Mestre Caiçara in Rio de Janeiro
Diploma signed by Silvestre (Ferreirinha), fellow contra-mestre of Caiçara
Connected with Rio de Janeiro''s elite capoeira scene in the 1970s-80s (Camisa, Gado, Nestor, Artur Emídio, Touro, others)
Pioneer capoeira instructor in Campo Grande, Mato Grosso do Sul
Continued the Moraes Paes family capoeira tradition in new regions',
  E'Primeiro treinamento de capoeira com seu irmão Nilton em Massaranduba, Salvador
Alcançou o posto de contra-mestre sob Mestre Caiçara no Rio de Janeiro
Diploma assinado por Silvestre (Ferreirinha), também contra-mestre de Caiçara
Conectou-se com a elite da capoeira carioca nos anos 1970-80 (Camisa, Gado, Nestor, Artur Emídio, Touro, outros)
Instrutor pioneiro de capoeira em Campo Grande, Mato Grosso do Sul
Continuou a tradição capoeirística da família Moraes Paes em novas regiões',
  E'BIRTH DATE: March 26, 1948 (exact)
Source: velhosmestres.com explicitly states this date.

DEATH DATE: May 5, 2001 (exact)
Source: velhosmestres.com explicitly states this date.
Circumstance: "Tragically killed in an attack" according to esquiva.wordpress.com commenter testimony.

NAME VARIANTS:
- "Fernandinho" (primary apelido)
- "Mano" (alternate apelido)
- "Mestre Mano" (as referred to in some contexts)
- "Mestre Fernandinho" (as referred to in some contexts)

TITLE: Contra-Mestre
Note: Some sources refer to him as "Mestre Fernandinho" or "Mestre Mano", but primary sources (velhosmestres.com) specifically identify him as contra-mestre under Caiçara.

TEACHERS:
- Nilton Moraes Paes (brother) - first capoeira teacher, Salvador
- Mestre Caiçara (Antônio Conceição Moraes) - primary teacher, Rio de Janeiro; awarded contra-mestre rank

DIPLOMA:
Signed by Silvestre Vitório Ferreira (Ferreirinha), contra-mestre of Caiçara.

STUDENTS:
- Mestre Dentinho (according to esquiva.wordpress.com commenter claiming to be "student and son of Mestre Dentinho, who was student of Fernandinho")

FAMILY:
- Nilton Moraes Paes (Oct 16, 1937 - before 1979) - Older brother; highly respected capoeirista; trained Mestre Nô
- Cutica / Nelson Moraes Paes (1941 - Dec 26, 1970) - Brother; co-teacher of Mestre Nô
- Norma Moraes Paes - Sister; provided information for velhosmestres.com research
- Two children (names unknown)

CONTEMPORARIES IN RIO (per esquiva.wordpress.com testimony):
- Camisa
- Gado
- Nestor (Capoeira)
- Macaco Preto
- Macaco Branco
- Artur Emídio
- Touro
- Nacional
- Medeiros

GEOGRAPHIC TRAJECTORY:
1. Massaranduba, Salvador, Bahia - birthplace; learned from brother Nilton
2. Rio de Janeiro - became contra-mestre under Caiçara; connected with elite capoeira scene
3. Campo Grande, Mato Grosso do Sul - pioneering instructor; final years

FELLOW CONTRA-MESTRES OF CAIÇARA (per Omilad D''Angola):
- Mestre Zé
- Paulo Santo Amaro
- Ferreirinha (Silvestre)
- Others unnamed',
  E'DATA DE NASCIMENTO: 26 de março de 1948 (exata)
Fonte: velhosmestres.com declara explicitamente esta data.

DATA DE FALECIMENTO: 5 de maio de 2001 (exata)
Fonte: velhosmestres.com declara explicitamente esta data.
Circunstância: "Tragicamente morto em um ataque" segundo testemunho de comentarista em esquiva.wordpress.com.

VARIANTES DO NOME:
- "Fernandinho" (apelido principal)
- "Mano" (apelido alternativo)
- "Mestre Mano" (como referido em alguns contextos)
- "Mestre Fernandinho" (como referido em alguns contextos)

TÍTULO: Contra-Mestre
Nota: Algumas fontes o referem como "Mestre Fernandinho" ou "Mestre Mano", mas fontes primárias (velhosmestres.com) o identificam especificamente como contra-mestre de Caiçara.

MESTRES:
- Nilton Moraes Paes (irmão) - primeiro professor de capoeira, Salvador
- Mestre Caiçara (Antônio Conceição Moraes) - professor principal, Rio de Janeiro; concedeu posto de contra-mestre

DIPLOMA:
Assinado por Silvestre Vitório Ferreira (Ferreirinha), contra-mestre de Caiçara.

ALUNOS:
- Mestre Dentinho (segundo comentarista do esquiva.wordpress.com que afirma ser "aluno e filho de Mestre Dentinho, que foi aluno de Fernandinho")

FAMÍLIA:
- Nilton Moraes Paes (16 out 1937 - antes de 1979) - Irmão mais velho; capoeirista altamente respeitado; treinou Mestre Nô
- Cutica / Nelson Moraes Paes (1941 - 26 dez 1970) - Irmão; co-professor de Mestre Nô
- Norma Moraes Paes - Irmã; forneceu informações para pesquisa do velhosmestres.com
- Dois filhos (nomes desconhecidos)

CONTEMPORÂNEOS NO RIO (segundo testemunho em esquiva.wordpress.com):
- Camisa
- Gado
- Nestor (Capoeira)
- Macaco Preto
- Macaco Branco
- Artur Emídio
- Touro
- Nacional
- Medeiros

TRAJETÓRIA GEOGRÁFICA:
1. Massaranduba, Salvador, Bahia - local de nascimento; aprendeu com irmão Nilton
2. Rio de Janeiro - tornou-se contra-mestre de Caiçara; conectou-se com elite capoeirística
3. Campo Grande, Mato Grosso do Sul - instrutor pioneiro; últimos anos

OUTROS CONTRA-MESTRES DE CAIÇARA (segundo Omilad D''Angola):
- Mestre Zé
- Paulo Santo Amaro
- Ferreirinha (Silvestre)
- Outros não nomeados'
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

-- Source: entities/persons/fernando-de-saubara.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Fernando de Saubara
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1944, decade precision):
-- The VI Rede Capoeira (Jan 2025) described Fernando as one of
-- the "octogenarian mestres" (over 80 years old). Given his
-- age of 80+ in 2025, birth year is estimated as ~1944 with
-- decade precision. This aligns with the input context.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Antônio Fernando da Silva',
  'Fernando de Saubara',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://tribunadoreconcavo.com/mestres-octogenarios-da-capoeira-recebem-titulo-de-herois-populares-no-vi-rede-capoeira/']::text[],
  'angola'::genealogy.style,
  NULL,
  NULL,
  1944,
  'decade'::genealogy.date_precision,
  'Saubara, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Antônio Fernando da Silva, known as Mestre Fernando de Saubara, is one of the last remaining capoeiristas trained by Mestre Pastinha, the legendary codifier of Capoeira Angola. His apelido ("of Saubara") identifies him with the municipality of Saubara in the Recôncavo Baiano, a region steeped in Afro-Brazilian cultural traditions including capoeira angola and samba de roda.\n\nThe Recôncavo Baiano—encompassing towns like Santo Amaro, Cachoeira, São Félix, and Saubara—is recognized as one of the cradles of capoeira. As Mestre Gato Preto once said: "Colônia Aliança, Usina Santa Elisa, São Bento de Inhatá, Muraê, Banga, Capanema, São Braz, Santo Amaro, Acupe, Vila de São Francisco, Saubara, Itapema... fall into that whole region there and you''ll really learn." Fernando de Saubara represents this deep tradition.\n\nWhile specific details of his training timeline with Pastinha are not extensively documented, his recognition as "one of the last remaining capoeiristas trained by Mestre Pastinha" places him among an increasingly rare generation. Pastinha taught at the Centro Esportivo de Capoeira Angola (CECA) in Pelourinho, Salvador, from 1941 until 1973 when he was forced to leave. If Fernando trained with Pastinha in the 1960s (as an adolescent or young man), this would align with the academy''s active period.\n\nBeyond his role as a capoeirista, Fernando de Saubara is recognized for his cultural and social contributions to the Saubara region. The municipality of Saubara, with its strong Afro-Brazilian heritage, has produced notable cultural figures including Rosildo do Rosário, a mobilizer of samba de roda traditions who received the Berimbau de Ouro award in 2016.\n\nIn January 2025, at over eighty years old, Fernando de Saubara received the Sankofa trophy at the VI Rede Capoeira event in Salvador, consecrating him as a "herói popular" (popular hero). The Sankofa symbol—an African bird with its head turned backwards—represents "returning to the past to resignify the present and build the future." He was honored alongside fellow octogenarian mestres Virgílio da Fazenda Grande, Boa Gente, Baiano (Edvaldo dos Santos Reis), and Mestre Nô.\n\nAs one of Pastinha''s last living students, Fernando de Saubara represents a living link to the foundations of Capoeira Angola.',
  E'Antônio Fernando da Silva, conhecido como Mestre Fernando de Saubara, é um dos últimos capoeiristas remanescentes formados por Mestre Pastinha, o lendário codificador da Capoeira Angola. Seu apelido ("de Saubara") o identifica com o município de Saubara no Recôncavo Baiano, uma região imersa em tradições culturais afro-brasileiras, incluindo capoeira angola e samba de roda.\n\nO Recôncavo Baiano—abrangendo cidades como Santo Amaro, Cachoeira, São Félix e Saubara—é reconhecido como um dos berços da capoeira. Como Mestre Gato Preto disse uma vez: "Colônia Aliança, Usina Santa Elisa, São Bento de Inhatá, Muraê, Banga, Capanema, São Braz, Santo Amaro, Acupe, Vila de São Francisco, Saubara, Itapema... cê cair dentro daquela região toda ali e cê aprende mesmo." Fernando de Saubara representa essa profunda tradição.\n\nEmbora detalhes específicos de sua linha do tempo de treinamento com Pastinha não sejam extensamente documentados, seu reconhecimento como "um dos últimos capoeiristas remanescentes formados por Mestre Pastinha" o coloca entre uma geração cada vez mais rara. Pastinha ensinou no Centro Esportivo de Capoeira Angola (CECA) no Pelourinho, Salvador, de 1941 até 1973 quando foi forçado a sair. Se Fernando treinou com Pastinha nos anos 1960 (como adolescente ou jovem), isso se alinharia com o período ativo da academia.\n\nAlém de seu papel como capoeirista, Fernando de Saubara é reconhecido por suas contribuições culturais e sociais à região de Saubara. O município de Saubara, com sua forte herança afro-brasileira, produziu figuras culturais notáveis incluindo Rosildo do Rosário, um mobilizador das tradições do samba de roda que recebeu o prêmio Berimbau de Ouro em 2016.\n\nEm janeiro de 2025, com mais de oitenta anos, Fernando de Saubara recebeu o troféu Sankofa no VI Rede Capoeira em Salvador, consagrando-o como "herói popular". O símbolo Sankofa—um pássaro africano com a cabeça voltada para trás—representa "retornar ao passado para ressignificar o presente e construir o futuro". Ele foi homenageado ao lado dos mestres octogenários Virgílio da Fazenda Grande, Boa Gente, Baiano (Edvaldo dos Santos Reis) e Mestre Nô.\n\nComo um dos últimos alunos vivos de Pastinha, Fernando de Saubara representa um elo vivo com os fundamentos da Capoeira Angola.',
  E'Received Sankofa trophy at VI Rede Capoeira (January 2025) as "popular hero"\nRecognized cultural and social contributions to Saubara region\nOne of last remaining capoeiristas trained by Mestre Pastinha',
  E'Recebeu troféu Sankofa no VI Rede Capoeira (janeiro 2025) como "herói popular"\nReconhecidas contribuições culturais e sociais à região de Saubara\nUm dos últimos capoeiristas remanescentes formados por Mestre Pastinha',
  E'BIRTH YEAR ESTIMATION (1944, decade):\nDescribed as "octogenarian" (over 80 years old) at VI Rede Capoeira in January 2025.\nIf 80+ in 2025, birth year ~1944-1945. Using 1944 with decade precision.\n\nTEACHERS:\n- Mestre Pastinha (Vicente Ferreira Pastinha) - primary teacher\n  Training likely occurred in 1960s at CECA in Pelourinho, Salvador.\n  Fernando identified as "one of the last remaining capoeiristas trained by Mestre Pastinha."\n\nLOCATION:\n- Associated with Saubara, municipality in Recôncavo Baiano, Bahia\n- Saubara is known for strong Afro-Brazilian cultural traditions including samba de roda\n\nVI REDE CAPOEIRA 2025 HONOREES (Sankofa Trophy):\n- Fernando de Saubara (Capoeira)\n- Mestre Virgílio da Fazenda Grande (Capoeira)\n- Mestre Boa Gente (Capoeira)\n- Mestre Baiano - Edvaldo dos Santos Reis (Capoeira)\n- Mestre Nô - Norival Moreira de Oliveira (Capoeira)\n- Dona Santinha (Samba Chula)\n- Mateus Aleluia (Musician)\n- Mestre Walmir Lima (Samba)\n- Bule Bule (Cordel/Repente)\n- Zenaide Bezerra (Frevo)\n\nSOURCE LIMITATIONS:\nPrimary source is the Tribuna do Recôncavo article on VI Rede Capoeira (Jan 2025).\nNo additional biographical details (specific training dates, students, groups founded)\nfound in Tier 1 sources (velhosmestres.com, CapoeiraHub, Lalaue, Wikipedia).\nFernando de Saubara does not appear on standard Pastinha student lists, suggesting\nhe may have trained informally or outside Salvador''s main academy network.',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1944, década):\nDescrito como "octogenário" (mais de 80 anos) no VI Rede Capoeira em janeiro de 2025.\nSe 80+ em 2025, ano de nascimento ~1944-1945. Usando 1944 com precisão de década.\n\nMESTRES:\n- Mestre Pastinha (Vicente Ferreira Pastinha) - mestre principal\n  Treinamento provavelmente ocorreu nos anos 1960 no CECA no Pelourinho, Salvador.\n  Fernando identificado como "um dos últimos capoeiristas remanescentes formados por Mestre Pastinha."\n\nLOCALIZAÇÃO:\n- Associado a Saubara, município no Recôncavo Baiano, Bahia\n- Saubara é conhecida por fortes tradições culturais afro-brasileiras incluindo samba de roda\n\nHOMENAGEADOS VI REDE CAPOEIRA 2025 (Troféu Sankofa):\n- Fernando de Saubara (Capoeira)\n- Mestre Virgílio da Fazenda Grande (Capoeira)\n- Mestre Boa Gente (Capoeira)\n- Mestre Baiano - Edvaldo dos Santos Reis (Capoeira)\n- Mestre Nô - Norival Moreira de Oliveira (Capoeira)\n- Dona Santinha (Samba Chula)\n- Mateus Aleluia (Músico)\n- Mestre Walmir Lima (Samba)\n- Bule Bule (Cordel/Repente)\n- Zenaide Bezerra (Frevo)\n\nLIMITAÇÕES DE FONTE:\nFonte primária é o artigo da Tribuna do Recôncavo sobre VI Rede Capoeira (jan 2025).\nNenhum detalhe biográfico adicional (datas específicas de treinamento, alunos, grupos fundados)\nencontrado em fontes Tier 1 (velhosmestres.com, CapoeiraHub, Lalaue, Wikipedia).\nFernando de Saubara não aparece nas listas padrão de alunos de Pastinha, sugerindo\nque ele pode ter treinado informalmente ou fora da rede principal de academias de Salvador.'
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

-- Source: entities/persons/gary-bonfim.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Gary (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Student of Zé Grande and Deraldo at Grupo Bonfim (began 1957);
-- Also known as Mestre 22, Mestre 22 da Bonfim, Guere 22;
-- Founder of Associação Cultural de Capoeira Liberdade;
-- Died July 19, 2021 from COVID-19.
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1945 (decade precision)
-- Interview states: "67 years old" with "55 years militating" in
-- capoeira. Started 1957 at age 12. 1957 - 12 = ~1945.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown
  'Gary',
  'Bonfim', -- Context to distinguish from other Garys
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeiraliberdade.net.br/view/historia.php']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era; learned in Rio before formal categories
  E'Gary learned capoeira in the Bonfim tradition, which combined Bahian roots (through Mário Buscapé from the Recôncavo) with the practical, competitive style that developed in Rio de Janeiro. His signature technique was the cabeçada (headbutt), which he learned from Mestre Veludo, one of the most respected cabeceiros in Rio. He characterized the 1960s-70s capoeira as "very dangerous," noting that practitioners were "simply capoeira players" without stylistic concerns. His game emphasized "constant movements using the headbutt and sweep."',
  E'Gary aprendeu capoeira na tradição Bonfim, que combinava raízes baianas (através de Mário Buscapé do Recôncavo) com o estilo prático e competitivo que se desenvolveu no Rio de Janeiro. Sua técnica característica era a cabeçada, que aprendeu com Mestre Veludo, um dos cabeceiros mais respeitados do Rio. Ele caracterizava a capoeira dos anos 1960-70 como "muito perigosa," notando que os praticantes eram "simplesmente jogadores de capoeira" sem preocupações estilísticas. Seu jogo enfatizava "movimentos constantes usando a cabeçada e a rasteira."',
  -- Life dates
  1945,
  'approximate'::genealogy.date_precision,
  NULL, -- Birth place unknown; possibly Rio de Janeiro or Alagoas based on conflicting sources
  2021,
  'exact'::genealogy.date_precision,
  NULL, -- Specific death location unknown
  -- bio_en
  E'Gary, known throughout the capoeira world as Mestre 22, Mestre 22 da Bonfim, and sometimes Guere 22, was a key figure in transmitting the Bonfim capoeira lineage to subsequent generations. His path into capoeira began with a moment of inspiration: witnessing a skilled capoeirista in a street altercation at the São Clemente block in Botafogo, Rio de Janeiro (today the famous São Clemente samba school). The martial prowess he observed that day convinced him to pursue the art.

In 1957, at age 12, Gary began training at the Associação Cultural Bonfim, learning from Mestres Zé Grande and Deraldo—the two men who had taken over leadership of the group after founder Mário Buscapé returned to Bahia. The Bonfim group had moved from its initial small space in São Cristóvão to a larger academy in Olaria, where it had become famous for training high-level competitors.

Within Bonfim, Gary encountered Mestre Veludo, a strong, quick Black man who was renowned as one of the most respected cabeceiros (headbutt specialists) in Rio de Janeiro. Veludo became Gary''s instructor in the dangerous cabeçada technique—a movement requiring precise timing and placement, demanding "all the cunning of capoeira." Gary would later pass this specialized knowledge to his own students.

Recalling the capoeira scene of the 1960s and 70s, Gary listed the notable practitioners of that dangerous era: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—and myself, Mestre 22 da Bonfim." He described this period as a time when there were no uniforms or cords; practitioners wore normal clothing and identified simply as "capoeira players" without stylistic labels.

The traditional roda protocol of that era made a lasting impression. Gary recalled how Mestre Zé Grande would call for the toque de iuna, at which point only mestres would play—"it was very beautiful to see."

Gary trained and graduated numerous mestres who carry on his lineage: Mestre Lébio, Mestre Rui Charuto, Mestre Mão de Onça, Mestre Toinho, Mestre Elias, and Mestra Marly "Malvadeza." Marly, who became both his disciple and wife, would continue his work after his death.

Gary founded the Associação Cultural de Capoeira Liberdade, which now operates in multiple Brazilian states: Ceará (Caucaia, São Gonçalo do Amarante, Trairi, Itapipoca, Amontada), Alagoas (Maceió, Tapera, Olivença, Jacaré dos Homens, Olho d''Água das Flores, Ipuera, Piau, Santana do Ipanema, Poço das Trincheiras), and Bahia.

When asked about his style, Gary rejected classifications. He stated: "I am simply an old student... just an old capoeira player." At the time of his interview (around 2012), he was 67 years old with 55 years in capoeira. His closing message urged respect for elderly masters as "sources of wisdom and living memory of capoeira."

Gary died on July 19, 2021, a victim of COVID-19. At the 2022 "Mulher Vem Pra Roda" event organized by his group, Mestra Marly Malvadeza ritualistically scattered his ashes at the feet of the participants—a final act of connection between the departed mestre and the continuing community.',
  -- bio_pt
  E'Gary, conhecido no mundo da capoeira como Mestre 22, Mestre 22 da Bonfim, e às vezes Guere 22, foi uma figura fundamental na transmissão da linhagem da capoeira Bonfim para as gerações seguintes. Seu caminho para a capoeira começou com um momento de inspiração: testemunhar um capoeirista habilidoso em uma briga de rua no bloco São Clemente, em Botafogo, Rio de Janeiro (hoje a famosa escola de samba São Clemente). A destreza marcial que ele observou naquele dia o convenceu a seguir a arte.

Em 1957, aos 12 anos, Gary começou a treinar na Associação Cultural Bonfim, aprendendo com os Mestres Zé Grande e Deraldo—os dois homens que assumiram a liderança do grupo depois que o fundador Mário Buscapé retornou à Bahia. O grupo Bonfim havia se mudado de seu pequeno espaço inicial em São Cristóvão para uma academia maior em Olaria, onde se tornou famoso por formar competidores de alto nível.

Dentro do Bonfim, Gary conheceu Mestre Veludo, um homem negro forte e rápido que era reconhecido como um dos cabeceiros (especialistas em cabeçada) mais respeitados do Rio de Janeiro. Veludo se tornou o instrutor de Gary na perigosa técnica da cabeçada—um movimento que exige timing preciso e posicionamento exato, demandando "toda a malícia da capoeira." Gary mais tarde passaria esse conhecimento especializado para seus próprios alunos.

Relembrando a cena da capoeira dos anos 1960 e 70, Gary listou os praticantes notáveis daquela era perigosa: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—e eu mesmo, Mestre 22 da Bonfim." Ele descreveu este período como uma época em que não havia uniformes ou cordas; os praticantes usavam roupas normais e se identificavam simplesmente como "jogadores de capoeira" sem rótulos estilísticos.

O protocolo tradicional da roda daquela época deixou uma impressão duradoura. Gary recordou como Mestre Zé Grande chamava o toque de iuna, momento em que apenas mestres jogavam—"era muito bonito de ver."

Gary treinou e formou vários mestres que continuam sua linhagem: Mestre Lébio, Mestre Rui Charuto, Mestre Mão de Onça, Mestre Toinho, Mestre Elias e Mestra Marly "Malvadeza." Marly, que se tornou tanto sua discípula quanto esposa, continuaria seu trabalho após sua morte.

Gary fundou a Associação Cultural de Capoeira Liberdade, que agora opera em múltiplos estados brasileiros: Ceará (Caucaia, São Gonçalo do Amarante, Trairi, Itapipoca, Amontada), Alagoas (Maceió, Tapera, Olivença, Jacaré dos Homens, Olho d''Água das Flores, Ipuera, Piau, Santana do Ipanema, Poço das Trincheiras) e Bahia.

Quando perguntado sobre seu estilo, Gary rejeitou classificações. Ele declarou: "Eu sou simplesmente um aluno velho... apenas um velho jogador de capoeira." Na época de sua entrevista (por volta de 2012), ele tinha 67 anos com 55 anos de capoeira. Sua mensagem final exortava respeito pelos mestres idosos como "fontes de sabedoria e memória viva da capoeira."

Gary morreu em 19 de julho de 2021, vítima da COVID-19. No evento "Mulher Vem Pra Roda" de 2022, organizado por seu grupo, Mestra Marly Malvadeza ritualmente espalhou suas cinzas aos pés dos participantes—um ato final de conexão entre o mestre falecido e a comunidade que continua.',
  -- achievements_en
  E'Founder of Associação Cultural de Capoeira Liberdade; Trained and formed numerous mestres: Lébio, Rui Charuto, Mão de Onça, Toinho, Elias, Marly Malvadeza; Master of the cabeçada (headbutt) technique, learned from Mestre Veludo; Expanded Capoeira Liberdade to multiple states (Ceará, Alagoas, Bahia); Key figure in transmitting the Bonfim lineage (Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo → Gary)',
  -- achievements_pt
  E'Fundador da Associação Cultural de Capoeira Liberdade; Treinou e formou vários mestres: Lébio, Rui Charuto, Mão de Onça, Toinho, Elias, Marly Malvadeza; Mestre da técnica de cabeçada, aprendida com Mestre Veludo; Expandiu a Capoeira Liberdade para múltiplos estados (Ceará, Alagoas, Bahia); Figura fundamental na transmissão da linhagem Bonfim (Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo → Gary)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (~1945, approximate):
Interview states he was 67 years old with 55 years in capoeira at time of interview (~2012). Started in 1957 at age 12. Calculation: 1957 - 12 = 1945. Interview date estimated ~2012 based on 55 years from 1957.

DEATH DATE: July 19, 2021 (exact)
Died from COVID-19. Source: maltanet.com.br 2022 article about "Mulher Vem Pra Roda" event.

NAME VARIATIONS:
- "Gary" - primary apelido
- "Mestre 22" - commonly used
- "Mestre 22 da Bonfim" - formal distinction
- "Guere 22" - variant spelling (capoeirahistory.com Rui Charuto page)
All refer to the same person.

ORIGIN DISCREPANCY:
- Mestre Rui Charuto''s biography calls him "a capoeirista from Alagoas"
- Other sources place him in Rio de Janeiro
- Possible that he was born in Alagoas and moved to Rio, or the Alagoas reference is an error
- His group now has strong presence in Alagoas, which may explain the association

TEACHERS:
- Mestre Zé Grande (primary teacher at Bonfim, from 1957)
- Mestre Deraldo (co-leader of Bonfim, taught alongside Zé Grande)
- Mestre Veludo (specialized instruction in cabeçada technique)

STUDENTS:
- Mestre Lébio
- Mestre Rui Charuto (Rui Montanheiro, born 1959)
- Mestre Mão de Onça
- Mestre Toinho
- Mestre Elias
- Mestra Marly "Malvadeza" (Marly Barbosa Vieira; wife; current president of group)

FAMILY:
- Wife: Mestra Marly Malvadeza (Marly Barbosa Vieira)

MEDIA APPEARANCES:
- Interview documented on capoeiraliberdade.net.br (primary biographical source)

GROUP FOUNDED:
- Associação Cultural de Capoeira Liberdade
- Currently operates in: Ceará, Alagoas, Bahia
- Now led by Mestra Marly Malvadeza after his death

INSPIRATION EVENT:
- Street altercation at São Clemente block, Botafogo, Rio (now São Clemente samba school)
- Witnessed skilled capoeirista fight; decided to learn capoeira',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (~1945, aproximado):
Entrevista afirma que ele tinha 67 anos com 55 anos na capoeira na época da entrevista (~2012). Começou em 1957 aos 12 anos. Cálculo: 1957 - 12 = 1945. Data da entrevista estimada ~2012 com base em 55 anos desde 1957.

DATA DE MORTE: 19 de julho de 2021 (exata)
Morreu de COVID-19. Fonte: artigo maltanet.com.br de 2022 sobre evento "Mulher Vem Pra Roda".

VARIAÇÕES DE NOME:
- "Gary" - apelido principal
- "Mestre 22" - comumente usado
- "Mestre 22 da Bonfim" - distinção formal
- "Guere 22" - variante ortográfica (página de Rui Charuto no capoeirahistory.com)
Todos se referem à mesma pessoa.

DISCREPÂNCIA DE ORIGEM:
- A biografia de Mestre Rui Charuto o chama de "um capoeirista de Alagoas"
- Outras fontes o situam no Rio de Janeiro
- Possível que ele tenha nascido em Alagoas e se mudado para o Rio, ou a referência a Alagoas é um erro
- Seu grupo agora tem forte presença em Alagoas, o que pode explicar a associação

MESTRES:
- Mestre Zé Grande (mestre principal no Bonfim, a partir de 1957)
- Mestre Deraldo (co-líder do Bonfim, ensinou junto com Zé Grande)
- Mestre Veludo (instrução especializada na técnica da cabeçada)

ALUNOS:
- Mestre Lébio
- Mestre Rui Charuto (Rui Montanheiro, nascido em 1959)
- Mestre Mão de Onça
- Mestre Toinho
- Mestre Elias
- Mestra Marly "Malvadeza" (Marly Barbosa Vieira; esposa; atual presidente do grupo)

FAMÍLIA:
- Esposa: Mestra Marly Malvadeza (Marly Barbosa Vieira)

APARIÇÕES NA MÍDIA:
- Entrevista documentada em capoeiraliberdade.net.br (fonte biográfica principal)

GRUPO FUNDADO:
- Associação Cultural de Capoeira Liberdade
- Atualmente opera em: Ceará, Alagoas, Bahia
- Agora liderado por Mestra Marly Malvadeza após sua morte

EVENTO DE INSPIRAÇÃO:
- Briga de rua no bloco São Clemente, Botafogo, Rio (hoje escola de samba São Clemente)
- Testemunhou luta de capoeirista habilidoso; decidiu aprender capoeira'
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

-- Source: entities/persons/gilvan.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Gilvan
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1940s, decade precision):
-- Joel (brother) was born 1944 in Santo Amaro, raised in Feira de Santana.
-- As brothers who were both pioneers in São Paulo from the mid-1960s,
-- Gilvan was likely born within a few years of Joel (early-to-mid 1940s).
-- Using ~1944 as estimate with decade precision.
--
-- DEATH YEAR ESTIMATION (before 1998):
-- At Paulo Gomes's funeral in September 1998, sources note that Mestre Joel
-- spoke passionately, having "already lost his brother Gilvan in the past."
-- This confirms Gilvan died before September 1998. No specific date found.
-- Using 1997 as estimate with decade precision (sometime in 1990s).
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
  'Gilvan',
  NULL,
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-54', 'https://velhosmestres.com/en/featured-54']::text[],
  'regional'::genealogy.style,
  E'Gilvan was part of the São Paulo Regional capoeira movement alongside his brother Joel. As one of the "Grupo dos Nove" pioneers recognized by Mestre Bimba in 1971, he represented the wave of Bahian capoeiristas who brought Regional to São Paulo. He frequented the Praça da República rodas where mestres of all styles gathered.',
  E'Gilvan fez parte do movimento de Capoeira Regional em São Paulo ao lado de seu irmão Joel. Como um dos pioneiros do "Grupo dos Nove" reconhecido por Mestre Bimba em 1971, ele representou a onda de capoeiristas baianos que trouxeram a Regional para São Paulo. Frequentava as rodas da Praça da República onde mestres de todos os estilos se reuniam.',
  1944,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1997,
  'decade'::genealogy.date_precision,
  NULL,
  E'Gilvan was one of the pioneering capoeiristas who helped establish capoeira in São Paulo during the 1960s and 1970s. He was the brother of Mestre Joel (Joel de Souza Menezes), who was born in Santo Amaro and raised in Feira de Santana, Bahia—the same region that produced legendary capoeiristas including Mestre Bimba''s father.

Like his brother Joel, Gilvan migrated from Bahia to São Paulo during the great wave of Bahian capoeiristas who brought the art to Brazil''s largest city. By the mid-1960s, he was among the group of mestres—including Zé de Freitas, Valdemar "Angoleiro", Paulo Gomes, Pinatti, Joel, Suassuna, Brasília, and Silvestre—who were implanting the practice of capoeira in São Paulo society.

Gilvan regularly frequented the famous rodas at Praça da República, the legendary Sunday gathering founded by Mestre Ananias in 1953 where the cream of São Paulo capoeira assembled. Sources describe the period from the mid-1960s to the early 1980s as the "peak" of the República rodas, when capoeiristas from all backgrounds and styles gathered on this "stage." Mestre Ananias himself, the pioneer among capoeiristas to establish residence in São Paulo, "lived with great Bahian capoeiristas who lived and passed through São Paulo, like Zé de Freitas, Limão, Valdemar (do Martinelli), Hermógenes, Gilvan, Silvestre, Paulo Gomes, Suassuna, Brasília, Joel and many others."

In 1971, when Mestre Bimba visited São Paulo at the invitation of Mestre Onça (Airton Neves Moura), Bimba symbolically recognized a group of mestres as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo)—the famous "Grupo dos Nove" (Group of Nine). Gilvan was among these nine pioneers, alongside Suassuna, Brasília, Joel (his brother), Limão, Silvestre, Pinatti, Zé de Freitas, and Onça. A historic photograph from around 1972 captures this moment: Standing are M Zé de Freitas, M Pinatti, M Suassuna, M Bimba, M Onça, M Joel, M Brasília; Squatting are M Gilvan (Joel''s brother), M Limão, M Silvestre.

Gilvan passed away sometime before September 1998. At the funeral of Mestre Paulo Gomes—who was assassinated at his academy on September 24, 1998—one of the most impassioned speeches was delivered by Mestre Joel, "who had already lost his brother Gilvan in the past." The exact date and circumstances of Gilvan''s death remain undocumented.

His legacy lives on through his recognition as one of São Paulo''s founding capoeira pioneers and his appearance in the historic photograph with Mestre Bimba and the Grupo dos Nove.',
  E'Gilvan foi um dos capoeiristas pioneiros que ajudaram a estabelecer a capoeira em São Paulo durante as décadas de 1960 e 1970. Era irmão de Mestre Joel (Joel de Souza Menezes), que nasceu em Santo Amaro e foi criado em Feira de Santana, Bahia—a mesma região que produziu capoeiristas lendários incluindo o pai de Mestre Bimba.

Assim como seu irmão Joel, Gilvan migrou da Bahia para São Paulo durante a grande onda de capoeiristas baianos que trouxeram a arte para a maior cidade do Brasil. Em meados dos anos 1960, ele estava entre o grupo de mestres—incluindo Zé de Freitas, Valdemar "Angoleiro", Paulo Gomes, Pinatti, Joel, Suassuna, Brasília e Silvestre—que estavam implantando a prática da capoeira na sociedade paulistana.

Gilvan frequentava regularmente as famosas rodas na Praça da República, o lendário encontro dominical fundado por Mestre Ananias em 1953 onde a nata da capoeira paulista se reunia. Fontes descrevem o período de meados dos anos 1960 até o início dos anos 1980 como o "auge" das rodas da República, quando capoeiristas de todas as origens e estilos se reuniam neste "palco". O próprio Mestre Ananias, o pioneiro entre os capoeiristas a estabelecer residência em São Paulo, "conviveu com grandes capoeiristas baianos que viveram e passaram por São Paulo, como Zé de Freitas, Limão, Valdemar (do Martinelli), Hermógenes, Gilvan, Silvestre, Paulo Gomes, Suassuna, Brasília, Joel e muitos outros."

Em 1971, quando Mestre Bimba visitou São Paulo a convite de Mestre Onça (Airton Neves Moura), Bimba reconheceu simbolicamente um grupo de mestres como os "Percursores da Capoeira em São Paulo"—o famoso "Grupo dos Nove". Gilvan estava entre esses nove pioneiros, junto com Suassuna, Brasília, Joel (seu irmão), Limão, Silvestre, Pinatti, Zé de Freitas e Onça. Uma foto histórica de cerca de 1972 captura este momento: Em pé estão M Zé de Freitas, M Pinatti, M Suassuna, M Bimba, M Onça, M Joel, M Brasília; Agachados estão M Gilvan (irmão de Joel), M Limão, M Silvestre.

Gilvan faleceu em algum momento antes de setembro de 1998. No funeral de Mestre Paulo Gomes—que foi assassinado em sua academia em 24 de setembro de 1998—um dos discursos mais inflamados foi proferido por Mestre Joel, "que já havia perdido seu irmão Gilvan no passado." A data exata e as circunstâncias da morte de Gilvan permanecem sem documentação.

Seu legado permanece através de seu reconhecimento como um dos pioneiros fundadores da capoeira em São Paulo e sua aparição na foto histórica com Mestre Bimba e o Grupo dos Nove.',
  E'- Mid-1960s: Migrated from Bahia to São Paulo; began frequenting Praça da República rodas
- 1960s-1980s: Regular participant in São Paulo capoeira scene alongside brother Joel and other pioneers
- 1971: Recognized by Mestre Bimba as one of "Grupo dos Nove" pioneers of capoeira in São Paulo
- ~1972: Photographed with Mestre Bimba and other pioneers (squatting position alongside Limão, Silvestre)
- Before 1998: Passed away (exact date unknown)',
  E'- Meados dos anos 1960: Migrou da Bahia para São Paulo; começou a frequentar as rodas da Praça da República
- Anos 1960-1980: Participante regular da cena de capoeira paulistana ao lado do irmão Joel e outros pioneiros
- 1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
- ~1972: Fotografado com Mestre Bimba e outros pioneiros (posição agachada ao lado de Limão, Silvestre)
- Antes de 1998: Faleceu (data exata desconhecida)',
  E'BIRTH YEAR ESTIMATION (~1944, decade):
Joel (brother) was born February 28, 1944 in Santo Amaro, raised in Feira de Santana.
As brothers active in the same era who both migrated to São Paulo in the 1960s,
Gilvan was likely born within a few years of Joel (early-to-mid 1940s).

DEATH YEAR ESTIMATION (~1997, decade):
At Paulo Gomes''s funeral on September 25, 1998, sources note that Mestre Joel
"já havia perdido seu irmão Gilvan, no passado" (had already lost his brother Gilvan in the past).
This confirms Gilvan died before September 1998. No specific date found.

NAME NOTE:
Full name unknown. Assumed to share family name "de Souza Menezes" with brother Joel,
but no source confirms this. Listed only as "Gilvan" or "M Gilvan" in all sources.

MEDIA APPEARANCES:
- ~1972: Appears in historic photograph with Mestre Bimba and Grupo dos Nove
  (Standing: Zé de Freitas, Pinatti, Suassuna, Bimba, Onça, Joel, Brasília;
   Squatting: Gilvan, Limão, Silvestre)
  Published at velhosmestres.com

TEACHERS:
- Unknown. Brother Joel learned from Mestre Arara (Fernando Vasconcelos, Bimba lineage)
  and trained under Zé de Freitas at CMTC Club. Gilvan may have followed similar path.

RODA LOCATION: Praça da República, Centro, São Paulo, SP, Brazil
- Frequented alongside brother Joel, Ananias, Suassuna, Brasília, and other pioneers
- Peak era: mid-1960s to early 1980s

GRUPO DOS NOVE (Group of Nine, 1971):
The nine pioneers recognized by Bimba in São Paulo:
1. Suassuna
2. Brasília
3. Joel (Gilvan''s brother)
4. Gilvan
5. Limão
6. Silvestre
7. Pinatti
8. Zé de Freitas
9. Onça (Airton Neves Moura) - organizer of Bimba''s visit',
  E'ESTIMATIVA ANO DE NASCIMENTO (~1944, década):
Joel (irmão) nasceu em 28 de fevereiro de 1944 em Santo Amaro, criado em Feira de Santana.
Como irmãos ativos na mesma época que migraram para São Paulo nos anos 1960,
Gilvan provavelmente nasceu alguns anos próximo de Joel (início a meados dos anos 1940).

ESTIMATIVA ANO DE FALECIMENTO (~1997, década):
No funeral de Paulo Gomes em 25 de setembro de 1998, fontes observam que Mestre Joel
"já havia perdido seu irmão Gilvan, no passado".
Isso confirma que Gilvan morreu antes de setembro de 1998. Nenhuma data específica encontrada.

NOTA SOBRE O NOME:
Nome completo desconhecido. Presume-se que compartilhe o sobrenome "de Souza Menezes" com o irmão Joel,
mas nenhuma fonte confirma isso. Listado apenas como "Gilvan" ou "M Gilvan" em todas as fontes.

APARIÇÕES NA MÍDIA:
- ~1972: Aparece em foto histórica com Mestre Bimba e Grupo dos Nove
  (Em pé: Zé de Freitas, Pinatti, Suassuna, Bimba, Onça, Joel, Brasília;
   Agachados: Gilvan, Limão, Silvestre)
  Publicado em velhosmestres.com

MESTRES:
- Desconhecido. Irmão Joel aprendeu com Mestre Arara (Fernando Vasconcelos, linhagem de Bimba)
  e treinou com Zé de Freitas no Clube CMTC. Gilvan pode ter seguido caminho semelhante.

LOCAL DA RODA: Praça da República, Centro, São Paulo, SP, Brasil
- Frequentava ao lado do irmão Joel, Ananias, Suassuna, Brasília e outros pioneiros
- Época áurea: meados dos anos 1960 ao início dos anos 1980

GRUPO DOS NOVE (1971):
Os nove pioneiros reconhecidos por Bimba em São Paulo:
1. Suassuna
2. Brasília
3. Joel (irmão de Gilvan)
4. Gilvan
5. Limão
6. Silvestre
7. Pinatti
8. Zé de Freitas
9. Onça (Airton Neves Moura) - organizador da visita de Bimba'
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

-- Source: entities/persons/irineu-bonfim.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Irineu (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930, decade precision):
-- Irineu was the first student of Mário Buscapé at the Cavan company in the
-- early 1950s in Rio de Janeiro. He and his brothers Zé Grande and Deraldo
-- came from Bahia. Irineu must have been old enough to work at Cavan when he
-- met Mário. By 1953 when Bonfim was founded, he was skilled enough to be
-- a co-founder. Estimating birth around 1930 places him in his early 20s at
-- founding—consistent with the timeline of his brothers (~1930 estimates).
-- ============================================================
-- NOTE: No title (mestre/professor) found in sources. His brothers Zé Grande
-- and Deraldo became mestres and co-leaders of Bonfim from 1969. Irineu is
-- only mentioned as first student and co-founder, not as instructor or leader.
-- ============================================================
-- APELIDO CONTEXT: "Bonfim" distinguishes him as the Irineu from the Bonfim
-- lineage in Rio de Janeiro, in case other persons named Irineu are imported.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Irineu dos Santos',
  'Irineu',
  'Bonfim', -- Distinguishes from other potential Irineu entries
  NULL, -- No title confirmed in sources
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era
  E'Irineu learned capoeira directly from Mário Buscapé in the early 1950s, making him the first recipient of the Bahian Recôncavo tradition that Mário brought to Rio de Janeiro. No details about his individual style have survived in the historical record.',
  E'Irineu aprendeu capoeira diretamente com Mário Buscapé no início dos anos 1950, tornando-se o primeiro receptor da tradição do Recôncavo Baiano que Mário trouxe para o Rio de Janeiro. Nenhum detalhe sobre seu estilo individual sobreviveu no registro histórico.',
  -- Life dates
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil', -- From Bahia like his brothers, exact location unknown
  NULL, -- Unknown
  NULL,
  NULL,
  -- bio_en
  E'Irineu dos Santos holds a unique place in the history of capoeira in Rio de Janeiro as the very first student of Mestre Mário Buscapé. A native of Bahia, Irineu came to Rio de Janeiro in the early 1950s along with his brothers Zé Grande and Deraldo—all from the dos Santos family, but unrelated to their future teacher Mário dos Santos (Mário Buscapé) despite sharing the same surname.

The encounter that would help establish one of the four founding lineages of contemporary capoeira in Rio occurred at the Cavan company, which manufactured lamp posts for use throughout the city. Mário Buscapé worked there for many years after arriving from Bahia. It was at Cavan that Mário met Irineu and began teaching him "the first steps of capoeira."

Through Irineu, Mário quickly won other followers to practice capoeira, including Irineu''s brothers Zé Grande and Deraldo. As historian André Lacé documented, these initial students formed the core group that would transform Rio''s capoeira landscape. On January 6, 1953, they founded the Associação Cultural Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in the neighborhood of São Cristóvão. As Lacé wrote: "They didn''t stay there for long, because the space became small due to the large number of students. They moved the academy to the neighborhood of Olaria, a spacious and pleasant place, and there they never stopped, training great capoeiristas."

While his brothers Zé Grande and Deraldo went on to become mestres and take over leadership of Grupo Bonfim when Mário returned to Bahia in 1969, the historical record is silent about Irineu''s subsequent career. His brothers are mentioned in the testimony of their students—Mestre Gary (Mestre 22) and Mestre Soldado, among others—but Irineu does not appear in these later accounts. Whether he continued practicing capoeira, relocated, or simply preferred a quieter role in the group''s development remains unknown.

What is certain is Irineu''s foundational role: he was the bridge that connected Mário Buscapé to the dos Santos brothers, enabling the transmission of Bahian capoeira traditions to a new generation in Rio de Janeiro. Without Irineu''s initial receptivity to Mário''s teaching at Cavan, the Bonfim lineage—one of the four that historians credit with shaping contemporary capoeira in Rio—might never have emerged.',
  -- bio_pt
  E'Irineu dos Santos ocupa um lugar único na história da capoeira no Rio de Janeiro como o primeiro aluno de Mestre Mário Buscapé. Natural da Bahia, Irineu veio para o Rio de Janeiro no início dos anos 1950 junto com seus irmãos Zé Grande e Deraldo—todos da família dos Santos, mas sem parentesco com seu futuro professor Mário dos Santos (Mário Buscapé), apesar de compartilharem o mesmo sobrenome.

O encontro que ajudaria a estabelecer uma das quatro linhagens fundadoras da capoeira contemporânea no Rio ocorreu na empresa Cavan, que fabricava postes de luz para uso em toda a cidade. Mário Buscapé trabalhou lá por muitos anos após chegar da Bahia. Foi na Cavan que Mário conheceu Irineu e começou a ensinar-lhe "os primeiros passos da capoeira."

Através de Irineu, Mário rapidamente conquistou outros seguidores para praticar capoeira, incluindo os irmãos de Irineu, Zé Grande e Deraldo. Como o historiador André Lacé documentou, esses alunos iniciais formaram o grupo central que transformaria o cenário da capoeira no Rio. Em 6 de janeiro de 1953, fundaram a Associação Cultural Bonfim, também conhecida como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço no bairro de São Cristóvão. Como Lacé escreveu: "Não ficaram lá por muito tempo, porque o espaço ficou pequeno devido ao grande número de alunos. Mudaram a academia para o bairro de Olaria, um lugar espaçoso e agradável, e lá nunca pararam, treinando grandes capoeiristas."

Enquanto seus irmãos Zé Grande e Deraldo se tornaram mestres e assumiram a liderança do Grupo Bonfim quando Mário retornou à Bahia em 1969, o registro histórico silencia sobre a carreira subsequente de Irineu. Seus irmãos são mencionados no depoimento de seus alunos—Mestre Gary (Mestre 22) e Mestre Soldado, entre outros—mas Irineu não aparece nesses relatos posteriores. Se ele continuou praticando capoeira, se mudou, ou simplesmente preferiu um papel mais discreto no desenvolvimento do grupo permanece desconhecido.

O que é certo é o papel fundamental de Irineu: ele foi a ponte que conectou Mário Buscapé aos irmãos dos Santos, possibilitando a transmissão das tradições da capoeira baiana para uma nova geração no Rio de Janeiro. Sem a receptividade inicial de Irineu ao ensino de Mário na Cavan, a linhagem Bonfim—uma das quatro que os historiadores creditam como formadoras da capoeira contemporânea no Rio—poderia nunca ter surgido.',
  -- achievements_en
  'First student of Mestre Mário Buscapé in Rio de Janeiro; Co-founder of Associação Cultural Bonfim (January 6, 1953); Bridge figure who connected Mário Buscapé to the dos Santos brothers',
  -- achievements_pt
  'Primeiro aluno de Mestre Mário Buscapé no Rio de Janeiro; Co-fundador da Associação Cultural Bonfim (6 de janeiro de 1953); Figura de ligação que conectou Mário Buscapé aos irmãos dos Santos',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1930, decade):
Irineu met Mário Buscapé at the Cavan company in the early 1950s. He must have been old enough to work at an industrial company (lamp post manufacturer) at that time—likely late teens or early 20s. By January 6, 1953, he was skilled enough to be a co-founder of Grupo Bonfim. Estimating birth around 1930 places him in his early 20s at founding, consistent with his brothers Zé Grande and Deraldo (also ~1930 estimates).

FULL NAME: Irineu dos Santos. He was from the dos Santos family (same as brothers Zé Grande and Deraldo), from Bahia. NOT related to Mário dos Santos (Mário Buscapé) despite the same surname.

TITLE STATUS: No title (mestre, professor, etc.) was found in any sources. His brothers Zé Grande and Deraldo are consistently referred to as "Mestre," but Irineu is only described as "first student" and co-founder. This may indicate:
1. He did not achieve mestre status
2. He left capoeira before becoming mestre
3. The historical record simply lost track of his development

HISTORICAL SILENCE: Irineu disappears from the historical record after the founding of Bonfim (1953). His brothers appear in testimonies from Mestre Gary (1957 onwards) and Mestre Soldado (1970s), but Irineu is never mentioned as a teacher or leader. When Mário Buscapé returned to Bahia in 1969, only Zé Grande and Deraldo are credited with taking over leadership.

TEACHERS:
- Mário Buscapé (primary, early 1950s, Cavan company, Rio de Janeiro)

STUDENTS:
- None documented

GROUP FOUNDING:
- Co-founded Associação Cultural Bonfim: January 6, 1953 (with Mário Buscapé, Zé Grande, Deraldo)

SOURCES:
All information comes from the capoeirahistory.com article on Mário Buscapé, which is the only source that mentions Irineu by name. The article draws on historian André Lacé''s research.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Irineu conheceu Mário Buscapé na empresa Cavan no início dos anos 1950. Ele deve ter idade suficiente para trabalhar em uma empresa industrial (fabricante de postes de luz) naquela época—provavelmente no final da adolescência ou início dos 20 anos. Em 6 de janeiro de 1953, ele era habilidoso o suficiente para ser co-fundador do Grupo Bonfim. Estimar nascimento por volta de 1930 o coloca no início dos 20 anos na fundação, consistente com seus irmãos Zé Grande e Deraldo (também estimativas de ~1930).

NOME COMPLETO: Irineu dos Santos. Ele era da família dos Santos (mesma dos irmãos Zé Grande e Deraldo), da Bahia. NÃO é parente de Mário dos Santos (Mário Buscapé) apesar do mesmo sobrenome.

STATUS DE TÍTULO: Nenhum título (mestre, professor, etc.) foi encontrado em qualquer fonte. Seus irmãos Zé Grande e Deraldo são consistentemente referidos como "Mestre," mas Irineu é descrito apenas como "primeiro aluno" e co-fundador. Isso pode indicar:
1. Ele não alcançou o status de mestre
2. Ele deixou a capoeira antes de se tornar mestre
3. O registro histórico simplesmente perdeu o rastro de seu desenvolvimento

SILÊNCIO HISTÓRICO: Irineu desaparece do registro histórico após a fundação do Bonfim (1953). Seus irmãos aparecem em depoimentos de Mestre Gary (1957 em diante) e Mestre Soldado (anos 1970), mas Irineu nunca é mencionado como professor ou líder. Quando Mário Buscapé retornou à Bahia em 1969, apenas Zé Grande e Deraldo são creditados com assumir a liderança.

MESTRES:
- Mário Buscapé (principal, início dos anos 1950, empresa Cavan, Rio de Janeiro)

ALUNOS:
- Nenhum documentado

FUNDAÇÃO DO GRUPO:
- Co-fundou Associação Cultural Bonfim: 6 de janeiro de 1953 (com Mário Buscapé, Zé Grande, Deraldo)

FONTES:
Todas as informações vêm do artigo de capoeirahistory.com sobre Mário Buscapé, que é a única fonte que menciona Irineu pelo nome. O artigo baseia-se na pesquisa do historiador André Lacé.'
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

-- Source: entities/persons/joel-sp.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Joel (São Paulo)
-- Generated: 2026-01-02
-- ============================================================
-- NOTE: This is Joel de Souza Menezes (1944-2020), the São Paulo pioneer.
-- DISTINCT FROM: Joel Lourenço do Espírito Santo (Rio de Janeiro Angola mestre).
-- Uses apelido_context = 'São Paulo' to distinguish.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  'Joel de Souza Menezes',
  'Joel',
  'São Paulo',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://velhosmestres.com/br/destaques-54', 'https://velhosmestres.com/en/featured-54', 'https://portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-joel/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Joel trained under Mestre Arara, who was a graduated student of Mestre Bimba. In 1972, he was officially recognized as a mestre by Bimba himself. Joel was a staunch defender of capoeira''s Bahian roots and traditions, as reflected in his recordings, which "always speak of Bahia". His three LPs (1979, 1993, 1994) document traditional capoeira music including quadras corridas, berimbau toques, and Angola ladainhas.',
  E'Mestre Joel treinou com Mestre Arara, que era aluno formado de Mestre Bimba. Em 1972, foi oficialmente reconhecido como mestre pelo próprio Bimba. Joel era defensor fervoroso das raízes e tradições baianas da capoeira, como refletido em suas gravações, que "sempre falam da Bahia". Seus três LPs (1979, 1993, 1994) documentam música tradicional de capoeira incluindo quadras corridas, toques de berimbau e ladainhas de Angola.',
  -- Life dates
  1944,
  'exact'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  2020,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Joel de Souza Menezes was born on February 28, 1944, in Santo Amaro, a city in the Recôncavo Baiano that produced legendary capoeiristas including Mestre Traíra, Mestre Caiçara, and Mestre Bimba''s own father. Raised in Feira de Santana, he learned capoeira from Mestre Arara (Fernando Vasconcelos), who was a graduated student of Mestre Bimba from the propagation phase (1967-1973).\n\nIn 1964, at age twenty, Joel moved to São Paulo state, where he would spend most of his life disseminating capoeira. He founded the Associação de Capoeira Ilha de Itapuã, which became one of the principal capoeira academies in São Paulo and was among the eight founding associations of the Federação Paulista de Capoeira in 1974—the first capoeira federation in the world.\n\nThe CMTC Club (Companhia Municipal de Transportes Coletivos), where Mestre Zé de Freitas taught both capoeira and freestyle wrestling, became a crucial meeting point for Bahian capoeiristas arriving in São Paulo. It was at Zé de Freitas''s classes there that Joel first met Mestre Brasília and Mestre Suassuna around 1965—an encounter that would shape the future of São Paulo capoeira. Joel became one of Zé de Freitas''s students, consolidating his training with the pioneer who had brought capoeira from Bahia in 1959.\n\nJoel regularly frequented the famous rodas at Praça da República, the legendary Sunday gathering founded by Mestre Ananias in 1953 where the cream of São Paulo capoeira gathered. Sources note that "Mestre Chita, junto ao Mestre Ananias e Mestre Joel, é o capoeirista que mais se fez presente desde o início da roda em 1953"—though this may be slightly exaggerated, as Joel arrived in 1964.\n\nIn 1971, when Mestre Bimba visited São Paulo at the invitation of Mestre Onça, Bimba symbolically recognized a group of mestres as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo)—the famous "Grupo dos Nove" (Group of Nine). Joel was among these nine pioneers, alongside Suassuna, Brasília, his brother Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, and Onça. A historic photograph from around 1972 captures this moment: Standing are M Zé de Freitas, M Pinatti, M Suassuna, M Bimba, M Onça, M Joel, M Brasília; Squatting are M Gilvan (Joel''s brother), M Limão, M Silvestre.\n\nIn 1972, Joel was formally recognized as a mestre of capoeira by Mestre Bimba himself—a rare honor that connected him directly to the creator of Capoeira Regional.\n\nJoel was a pioneer in recording capoeira music. In 1979, he released his LP "Capoeira" through the Associação de Capoeira Ilha de Itapuã, manufactured by Gravações Elétricas S.A. and recorded at Studio Brasileiro De Som. The album featured prominent capoeiristas as musicians: Mestre Ananias played atabaque and sang chorus on multiple tracks, Prof João Braz contributed pandeiro, agogô, and chorus, Prof Dado served as music director and arranger while playing percussion and berimbau, and Mestre João provided solo vocals and pandeiro. The LP included quadras corridas, berimbau techniques, and Angola ladainhas.\n\nJoel followed this with "Capoeira Raiz" in 1993 and "Capoeira Volume 1" in 1994. As his son Mestre Dadá recalled, Joel was "um dos pioneiros nessa gravação, com músicas que sempre falam da Bahia" (one of the pioneers in these recordings, with songs that always speak of Bahia).\n\nBeyond his academy work, Joel held significant leadership positions: he was president of the Organização Onças de São Paulo and served as national president of the Associação Brasil Capoeira (ABRACAP).\n\nThroughout his career, Joel traveled internationally to spread capoeira, visiting Germany, South Africa, England, Argentina, and Spain. His last trip was to Spain before Carnival 2020, where his family believes he contracted COVID-19. He was hospitalized at Hospital Ernesto Simões in Salvador on May 12, 2020, and passed away on June 3, 2020, at age 76.\n\nSambista Leci Brandão declared that "a capoeira está de luto" (capoeira is in mourning) and that "Mestre Joel é uma referência da Capoeira Paulista" (Mestre Joel is a reference of São Paulo Capoeira). His legacy lives on through the countless capoeiristas he trained and the institutions he built.',
  -- bio_pt
  E'Joel de Souza Menezes nasceu em 28 de fevereiro de 1944, em Santo Amaro, cidade do Recôncavo Baiano que produziu capoeiristas lendários incluindo Mestre Traíra, Mestre Caiçara e o próprio pai de Mestre Bimba. Criado em Feira de Santana, aprendeu capoeira com Mestre Arara (Fernando Vasconcelos), que era aluno formado de Mestre Bimba da fase de propagação (1967-1973).\n\nEm 1964, aos vinte anos, Joel mudou-se para o estado de São Paulo, onde passaria a maior parte de sua vida disseminando a capoeira. Fundou a Associação de Capoeira Ilha de Itapuã, que se tornou uma das principais academias de capoeira de São Paulo e estava entre as oito associações fundadoras da Federação Paulista de Capoeira em 1974—a primeira federação de capoeira do mundo.\n\nO Clube CMTC (Companhia Municipal de Transportes Coletivos), onde Mestre Zé de Freitas ensinava tanto capoeira quanto luta livre, tornou-se um ponto de encontro crucial para capoeiristas baianos chegando a São Paulo. Foi nas aulas de Zé de Freitas lá que Joel conheceu Mestre Brasília e Mestre Suassuna por volta de 1965—um encontro que moldaria o futuro da capoeira paulista. Joel tornou-se um dos alunos de Zé de Freitas, consolidando seu treinamento com o pioneiro que havia trazido a capoeira da Bahia em 1959.\n\nJoel frequentava regularmente as famosas rodas na Praça da República, o lendário encontro dominical fundado por Mestre Ananias em 1953 onde a nata da capoeira paulista se reunia. Fontes observam que "Mestre Chita, junto ao Mestre Ananias e Mestre Joel, é o capoeirista que mais se fez presente desde o início da roda em 1953"—embora isso possa ser ligeiramente exagerado, já que Joel chegou em 1964.\n\nEm 1971, quando Mestre Bimba visitou São Paulo a convite de Mestre Onça, Bimba reconheceu simbolicamente um grupo de mestres como os "Percursores da Capoeira em São Paulo"—o famoso "Grupo dos Nove". Joel estava entre esses nove pioneiros, junto com Suassuna, Brasília, seu irmão Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas e Onça. Uma foto histórica de cerca de 1972 captura este momento: Em pé estão M Zé de Freitas, M Pinatti, M Suassuna, M Bimba, M Onça, M Joel, M Brasília; Agachados estão M Gilvan (irmão de Joel), M Limão, M Silvestre.\n\nEm 1972, Joel foi formalmente reconhecido como mestre de capoeira pelo próprio Mestre Bimba—uma honra rara que o conectou diretamente ao criador da Capoeira Regional.\n\nJoel foi um pioneiro na gravação de música de capoeira. Em 1979, lançou seu LP "Capoeira" pela Associação de Capoeira Ilha de Itapuã, fabricado pela Gravações Elétricas S.A. e gravado no Studio Brasileiro De Som. O álbum contou com capoeiristas proeminentes como músicos: Mestre Ananias tocou atabaque e cantou coro em várias faixas, Prof João Braz contribuiu com pandeiro, agogô e coro, Prof Dado serviu como diretor musical e arranjador enquanto tocava percussão e berimbau, e Mestre João fez vocais solo e pandeiro. O LP incluiu quadras corridas, técnicas de berimbau e ladainhas de Angola.\n\nJoel seguiu com "Capoeira Raiz" em 1993 e "Capoeira Volume 1" em 1994. Como seu filho Mestre Dadá recordou, Joel foi "um dos pioneiros nessa gravação, com músicas que sempre falam da Bahia".\n\nAlém de seu trabalho nas academias, Joel ocupou posições de liderança significativas: foi presidente da Organização Onças de São Paulo e serviu como presidente nacional da Associação Brasil Capoeira (ABRACAP).\n\nAo longo de sua carreira, Joel viajou internacionalmente para disseminar a capoeira, visitando Alemanha, África do Sul, Inglaterra, Argentina e Espanha. Sua última viagem foi à Espanha antes do Carnaval de 2020, onde sua família acredita que ele contraiu COVID-19. Ele foi internado no Hospital Ernesto Simões em Salvador em 12 de maio de 2020 e faleceu em 3 de junho de 2020, aos 76 anos.\n\nA sambista Leci Brandão declarou que "a capoeira está de luto" e que "Mestre Joel é uma referência da Capoeira Paulista". Seu legado continua através dos inúmeros capoeiristas que treinou e das instituições que construiu.',
  -- achievements_en
  E'1944 (Feb 28): Born in Santo Amaro, Bahia; raised in Feira de Santana
1960s: Learned capoeira from Mestre Arara (student of Mestre Bimba)
1964: Moved to São Paulo; founded Associação de Capoeira Ilha de Itapuã
~1965: Met Mestres Suassuna and Brasília at Zé de Freitas''s CMTC Club classes; trained under Zé de Freitas
1960s-70s: Regularly frequented Praça da República rodas with Mestre Ananias
1971: Recognized by Mestre Bimba as one of "Grupo dos Nove" pioneers of capoeira in São Paulo
1972: Formally recognized as mestre by Mestre Bimba
1974: Associação de Capoeira Ilha de Itapuã was one of 8 founding associations of Federação Paulista de Capoeira
1979: Released LP "Capoeira" with Mestre Ananias, Prof Dado, Prof João Braz, Mestre João
1993: Released LP "Capoeira Raiz"
1994: Released LP "Capoeira Volume 1"
2010: Habilitado for IPHAN Prêmio Viva Meu Mestre (recognized master aged 55+)
International travel to Germany, South Africa, England, Argentina, Spain for capoeira dissemination
President of Organização Onças de São Paulo
National president of Associação Brasil Capoeira (ABRACAP)',
  -- achievements_pt
  E'1944 (28 fev): Nasceu em Santo Amaro, Bahia; criado em Feira de Santana
Anos 1960: Aprendeu capoeira com Mestre Arara (aluno de Mestre Bimba)
1964: Mudou-se para São Paulo; fundou Associação de Capoeira Ilha de Itapuã
~1965: Conheceu Mestres Suassuna e Brasília nas aulas de Zé de Freitas no Clube CMTC; treinou com Zé de Freitas
Anos 1960-70: Frequentou regularmente as rodas da Praça da República com Mestre Ananias
1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
1972: Formalmente reconhecido como mestre por Mestre Bimba
1974: Associação de Capoeira Ilha de Itapuã foi uma das 8 associações fundadoras da Federação Paulista de Capoeira
1979: Lançou LP "Capoeira" com Mestre Ananias, Prof Dado, Prof João Braz, Mestre João
1993: Lançou LP "Capoeira Raiz"
1994: Lançou LP "Capoeira Volume 1"
2010: Habilitado para o Prêmio Viva Meu Mestre do IPHAN (mestre reconhecido com 55+ anos)
Viagens internacionais para Alemanha, África do Sul, Inglaterra, Argentina, Espanha para disseminação da capoeira
Presidente da Organização Onças de São Paulo
Presidente nacional da Associação Brasil Capoeira (ABRACAP)',
  -- notes_en
  E'NAME DISAMBIGUATION:
There are two distinct "Mestre Joels" in capoeira history:
1. Joel de Souza Menezes (THIS PERSON, 1944-2020) - Born Santo Amaro, raised Feira de Santana; student of Mestre Arara (Bimba lineage); recorded LP "Capoeira" (1979) with Associação de Capoeira Ilha de Itapuã; based in São Paulo; member of "Grupo dos Nove"
2. Joel Lourenço do Espírito Santo (c. 1910-?) - Bahian who organized capoeira Angola in Rio de Janeiro in the 1950s; recorded "Samba de Caboclo" (1977); different lineage, different era, different style

Using apelido_context = ''São Paulo'' to distinguish in database.

TEACHERS:
- Mestre Arara (Fernando Vasconcelos) - Primary teacher in Bahia; Arara was student of Bimba from propagation phase (1967-1973)
- Mestre Zé de Freitas - Trained at CMTC Club in São Paulo (1960s); listed as one of Zé de Freitas''s formed students

FAMILY:
- Brother: Mestre Gilvan (also member of "Grupo dos Nove")
- Son: Mestre Dadá (interviewed for obituary sources)

STUDENTS:
- Specific student names not documented in available sources
- Trained many at Associação de Capoeira Ilha de Itapuã over decades

MEDIA APPEARANCES:
- 1979: LP "Capoeira" - Associação de Capoeira Ilha de Itapuã / Gravações Elétricas S.A.
- 1993: LP "Capoeira Raiz"
- 1994: LP "Capoeira Volume 1"
- ~1972: Historic photograph with Grupo dos Nove and Mestre Bimba

1979 LP PERSONNEL:
- Mestre Joel - Producer, Director, Composer
- Prof Dado - Music Director, Arranger, Percussion, Berimbau
- Mestre Ananias - Atabaque, Chorus (tracks A1, A2, B1, B2)
- Prof João Braz - Pandeiro, Agogô, Chorus
- Mestre João - Solo Vocal, Pandeiro

GRUPOS DOS NOVE MEMBERS (recognized by Bimba 1971):
1. Suassuna - already in dataset
2. Brasília - already in dataset
3. Joel (this person) - importing now
4. Gilvan (Joel''s brother) - in backlog
5. Limão - already in dataset
6. Silvestre - already in dataset
7. Pinatti - already in dataset
8. Zé de Freitas - already in dataset
9. Onça (SP) - already in dataset

DEATH:
Died June 3, 2020 in Salvador from COVID-19 complications. Hospitalized since May 12, 2020 at Hospital Ernesto Simões. Had returned from Spain before Carnival 2020.',
  -- notes_pt
  E'DESAMBIGUAÇÃO DE NOME:
Existem dois "Mestre Joels" distintos na história da capoeira:
1. Joel de Souza Menezes (ESTA PESSOA, 1944-2020) - Nascido em Santo Amaro, criado em Feira de Santana; aluno de Mestre Arara (linhagem de Bimba); gravou LP "Capoeira" (1979) com Associação de Capoeira Ilha de Itapuã; baseado em São Paulo; membro do "Grupo dos Nove"
2. Joel Lourenço do Espírito Santo (c. 1910-?) - Baiano que organizou capoeira Angola no Rio de Janeiro nos anos 1950; gravou "Samba de Caboclo" (1977); linhagem diferente, época diferente, estilo diferente

Usando apelido_context = ''São Paulo'' para distinguir no banco de dados.

MESTRES:
- Mestre Arara (Fernando Vasconcelos) - Professor principal na Bahia; Arara era aluno de Bimba da fase de propagação (1967-1973)
- Mestre Zé de Freitas - Treinou no Clube CMTC em São Paulo (anos 1960); listado como um dos alunos formados de Zé de Freitas

FAMÍLIA:
- Irmão: Mestre Gilvan (também membro do "Grupo dos Nove")
- Filho: Mestre Dadá (entrevistado para fontes de obituário)

ALUNOS:
- Nomes específicos de alunos não documentados em fontes disponíveis
- Treinou muitos na Associação de Capoeira Ilha de Itapuã ao longo de décadas

APARIÇÕES NA MÍDIA:
- 1979: LP "Capoeira" - Associação de Capoeira Ilha de Itapuã / Gravações Elétricas S.A.
- 1993: LP "Capoeira Raiz"
- 1994: LP "Capoeira Volume 1"
- ~1972: Foto histórica com Grupo dos Nove e Mestre Bimba

EQUIPE DO LP 1979:
- Mestre Joel - Produtor, Diretor, Compositor
- Prof Dado - Diretor Musical, Arranjador, Percussão, Berimbau
- Mestre Ananias - Atabaque, Coro (faixas A1, A2, B1, B2)
- Prof João Braz - Pandeiro, Agogô, Coro
- Mestre João - Vocal Solo, Pandeiro

MEMBROS DO GRUPO DOS NOVE (reconhecidos por Bimba 1971):
1. Suassuna - já no dataset
2. Brasília - já no dataset
3. Joel (esta pessoa) - importando agora
4. Gilvan (irmão de Joel) - no backlog
5. Limão - já no dataset
6. Silvestre - já no dataset
7. Pinatti - já no dataset
8. Zé de Freitas - já no dataset
9. Onça (SP) - já no dataset

FALECIMENTO:
Morreu em 3 de junho de 2020 em Salvador por complicações de COVID-19. Internado desde 12 de maio de 2020 no Hospital Ernesto Simões. Havia retornado da Espanha antes do Carnaval de 2020.'
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

-- Source: entities/persons/joite.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Joité
-- Generated: 2026-01-03
-- ============================================================
-- Profile Type: proto_mestre
-- Era: Late 19th - early 20th century
--
-- BIRTH YEAR ESTIMATION (~1880, decade):
-- - Cobrinha Verde (b. 1912) learned from him after Besouro's death (1924)
-- - Joité was already an established capoeirista/teacher in Santo Amaro
-- - Capoeira teachers typically active in their 30s-40s
-- - If teaching in mid-1920s at age 40-45, born ~1880
--
-- SOURCE: Mestre Cobrinha Verde's autobiographical testimony:
-- "I learned from many mestres in Santo Amaro. I will give their names
-- one by one: Maitá (who even had a samba song named after him), Licurí,
-- Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião,
-- Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."
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
  'Joité',
  NULL,
  NULL,
  ARRAY['https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/', 'https://capoeira.online/history/mestres/cobrinha-verde/', 'https://www.lalaue.com/learn-capoeira/mestre-cobrinha-verde']::text[],
  NULL,
  NULL,
  NULL,
  1880, 'decade'::genealogy.date_precision, 'Santo Amaro da Purificação, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Joité was one of the capoeiristas of Santo Amaro da Purificação in the Recôncavo Baiano who taught Mestre Cobrinha Verde during the early twentieth century. His name appears in Cobrinha Verde''s autobiographical testimony listing the mestres from whom he learned after the death of his primary teacher, Besouro Mangangá, in 1924.\n\nIn his autobiography, Cobrinha Verde stated: "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nSanto Amaro da Purificação, in Cobrinha Verde''s own words, was "the birthplace of Bahian capoeira." Joité was part of the generation that made it so. He belonged to an era when capoeira was practiced informally in streets, docks, and festivals—before the establishment of formal academies. These proto-mestres passed down the art through lived experience rather than structured curriculum, training the next generation amid police persecution and the daily struggle of working-class life in the Recôncavo.\n\nNothing more is currently known about Joité—his full name, his profession, his life story have not survived in documented sources. He remains one of the shadowy figures of capoeira''s oral history: known to have existed, known to have taught one of the great mestres of the twentieth century, but preserved only in the memory of those who came after.',
  E'Joité foi um dos capoeiristas de Santo Amaro da Purificação no Recôncavo Baiano que ensinou Mestre Cobrinha Verde durante o início do século XX. Seu nome aparece no testemunho autobiográfico de Cobrinha Verde listando os mestres com quem aprendeu após a morte de seu professor principal, Besouro Mangangá, em 1924.\n\nEm sua autobiografia, Cobrinha Verde declarou: "Aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um por um: Maitá (que até tinha um samba com nome dele), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nSanto Amaro da Purificação, nas próprias palavras de Cobrinha Verde, era "o berço da capoeira baiana." Joité fez parte da geração que a tornou assim. Ele pertenceu a uma era em que a capoeira era praticada informalmente nas ruas, docas e festas—antes do estabelecimento de academias formais. Esses proto-mestres passavam a arte através da experiência vivida em vez de currículo estruturado, treinando a próxima geração em meio à perseguição policial e à luta diária da vida da classe trabalhadora no Recôncavo.\n\nNada mais se sabe atualmente sobre Joité—seu nome completo, sua profissão, sua história de vida não sobreviveram em fontes documentadas. Ele permanece uma das figuras obscuras da história oral da capoeira: sabidamente existiu, sabidamente ensinou um dos grandes mestres do século XX, mas preservado apenas na memória daqueles que vieram depois.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1880, decade):\nCobrinha Verde (b. 1912) learned from Joité after Besouro''s death in 1924, when Cobrinha was about 12 years old. Joité was already an established teacher at this time. Capoeira teachers were typically active in their 30s-40s, so if teaching in the mid-1920s at age 40-45, he was likely born around 1880.\n\nTEACHERS:\n- Unknown; predates documented lineage records\n\nSTUDENTS:\n- Cobrinha Verde (Rafael Alves França, trained after 1924, Santo Amaro)\n\nCONTEMPORARIES (Santo Amaro proto-mestres):\n- Maitá (had a samba song named after him), Licurí, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo, Tonha Rolo do Mar\n\nNOTES:\n- Title is NULL because formal mestre titles did not exist in the modern sense during his era\n- Style is NULL because the Angola/Regional distinction came later',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1880, década):\nCobrinha Verde (n. 1912) aprendeu com Joité após a morte de Besouro em 1924, quando Cobrinha tinha cerca de 12 anos. Joité já era um professor estabelecido neste momento. Mestres de capoeira geralmente ensinavam entre 30-45 anos, então se ensinava em meados dos anos 1920 com 40-45 anos, provavelmente nasceu por volta de 1880.\n\nPROFESSORES:\n- Desconhecido; antecede registros de linhagem documentados\n\nALUNOS:\n- Cobrinha Verde (Rafael Alves França, treinou após 1924, Santo Amaro)\n\nCONTEMPORÂNEOS (proto-mestres de Santo Amaro):\n- Maitá (tinha um samba com seu nome), Licurí, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo, Tonha Rolo do Mar\n\nNOTAS:\n- Título é NULL porque títulos formais de mestre não existiam no sentido moderno durante sua era\n- Estilo é NULL porque a distinção Angola/Regional veio depois'
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

-- Source: entities/persons/juvencio-grosso.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Juvêncio Grosso
-- Generated: 2026-01-03
-- ============================================================
-- DISAMBIGUATION:
-- This is Juvêncio Grosso from Santo Amaro da Purificação, one of
-- Cobrinha Verde's teachers. He is DISTINCT from Mestre Juvêncio
-- (apelido_context: 'São Félix'), the dock worker/blacksmith who
-- taught João Pequeno, Ananias, and Traíra in São Félix.
-- ============================================================
-- BIRTH YEAR ESTIMATION (1880, decade precision):
-- Juvêncio Grosso was active as a teacher when Cobrinha Verde
-- learned from him (after Besouro's death in 1924). Cobrinha Verde
-- (b. 1912) was 12 in 1924. If Juvêncio was an established teacher
-- by then (aged ~40-50), birth estimate is ~1874-1884. Using 1880.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; known only by apelido
  'Juvêncio Grosso',
  NULL, -- No context needed; apelido is unique
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/cobrinha-1916', 'https://capoeira.online/history/mestres/cobrinha-verde/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the formal Angola/Regional split.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão formal Angola/Regional.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Juvêncio Grosso was a capoeirista from Santo Amaro da Purificação in the Recôncavo Baiano, active during the early 20th century. He is known from Mestre Cobrinha Verde''s autobiographical testimony, in which Cobrinha Verde listed the many mestres from whom he learned capoeira in his hometown.

Cobrinha Verde stated: "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."

Beyond this mention, no further biographical information has been found about Juvêncio Grosso. His presence in this list of Santo Amaro mestres places him among the generation contemporary with the legendary Besouro Mangangá (c. 1895-1924). The "Grosso" (thick/big) in his apelido likely referred to a physical characteristic.

Juvêncio Grosso represents the informal, pre-academy era of capoeira transmission in the Recôncavo Baiano, where young capoeiristas like Cobrinha Verde learned from multiple mestres in the community rather than a single formal teacher.',
  -- bio_pt
  E'Juvêncio Grosso era um capoeirista de Santo Amaro da Purificação no Recôncavo Baiano, ativo durante o início do século XX. Ele é conhecido pelo testemunho autobiográfico de Mestre Cobrinha Verde, no qual Cobrinha Verde listou os muitos mestres com quem aprendeu capoeira em sua cidade natal.

Cobrinha Verde declarou: "Aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um por um: Maitá (que até tinha um samba com nome dele), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."

Além desta menção, nenhuma outra informação biográfica foi encontrada sobre Juvêncio Grosso. Sua presença nesta lista de mestres de Santo Amaro o coloca entre a geração contemporânea do lendário Besouro Mangangá (c. 1895-1924). O "Grosso" em seu apelido provavelmente se referia a uma característica física.

Juvêncio Grosso representa a era informal e pré-academia da transmissão da capoeira no Recôncavo Baiano, onde jovens capoeiristas como Cobrinha Verde aprendiam de múltiplos mestres na comunidade ao invés de um único professor formal.',
  -- achievements_en
  'Teacher of Mestre Cobrinha Verde in Santo Amaro da Purificação; contemporary of Besouro Mangangá',
  -- achievements_pt
  'Professor de Mestre Cobrinha Verde em Santo Amaro da Purificação; contemporâneo de Besouro Mangangá',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1880, decade precision):
Active as a teacher when Cobrinha Verde (b. 1912) learned from him after Besouro''s death (1924). If he was an established teacher by then (aged ~40-50), birth estimate is ~1874-1884. Using 1880 as midpoint.

DEATH: Unknown. No records of his death have been found.

NAME: Full name unknown. Known only by his apelido "Juvêncio Grosso". The "Grosso" likely refers to a physical characteristic (thick, big).

DISAMBIGUATION:
This is Juvêncio Grosso from Santo Amaro da Purificação, one of Cobrinha Verde''s teachers. He is DISTINCT from Mestre Juvêncio (apelido_context: "São Félix"), the dock worker/blacksmith who taught João Pequeno, Ananias, and Traíra in São Félix.

The two Juvêncios were:
1. Juvêncio Grosso (this profile) - Santo Amaro, taught Cobrinha Verde, contemporary with Besouro (~1910s-1920s)
2. Mestre Juvêncio (São Félix) - São Félix/Mata de São João, dock worker/blacksmith, taught João Pequeno, Ananias, Traíra (~1930s-1940s)

STUDENTS:
- Cobrinha Verde (one of many teachers in Santo Amaro)

CONTEMPORARIES (other Santo Amaro teachers per Cobrinha Verde''s testimony):
- Maitá
- Licurí
- Joité
- Dendê
- Gasolina
- Siri de Mangue
- Doze Homens
- Esperidião
- Espinho Remoso
- Neco Canário Pardo

SOURCE LIMITATIONS:
Only known from Cobrinha Verde''s autobiographical testimony. No independent documentation has been found. Profile represents minimal documentation for genealogy tracking purposes.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década):
Ativo como professor quando Cobrinha Verde (n. 1912) aprendeu com ele após a morte de Besouro (1924). Se era um professor estabelecido na época (com ~40-50 anos), estimativa de nascimento é ~1874-1884. Usando 1880 como ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Nome completo desconhecido. Conhecido apenas por seu apelido "Juvêncio Grosso". O "Grosso" provavelmente se refere a uma característica física.

DESAMBIGUAÇÃO:
Este é Juvêncio Grosso de Santo Amaro da Purificação, um dos professores de Cobrinha Verde. Ele é DISTINTO de Mestre Juvêncio (apelido_context: "São Félix"), o estivador/ferreiro que ensinou João Pequeno, Ananias e Traíra em São Félix.

Os dois Juvêncios eram:
1. Juvêncio Grosso (este perfil) - Santo Amaro, ensinou Cobrinha Verde, contemporâneo de Besouro (~1910s-1920s)
2. Mestre Juvêncio (São Félix) - São Félix/Mata de São João, estivador/ferreiro, ensinou João Pequeno, Ananias, Traíra (~1930s-1940s)

ALUNOS:
- Cobrinha Verde (um de muitos professores em Santo Amaro)

CONTEMPORÂNEOS (outros professores de Santo Amaro por testemunho de Cobrinha Verde):
- Maitá
- Licurí
- Joité
- Dendê
- Gasolina
- Siri de Mangue
- Doze Homens
- Esperidião
- Espinho Remoso
- Neco Canário Pardo

LIMITAÇÕES DE FONTE:
Conhecido apenas pelo testemunho autobiográfico de Cobrinha Verde. Nenhuma documentação independente foi encontrada. Perfil representa documentação mínima para fins de rastreamento genealógico.'
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

-- Source: entities/persons/lamartine-pereira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Lamartine Pereira
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR: 1935 - Confirmed by capoeirahistory.com and cev.org.br
-- Birth place: Rio de Janeiro - Confirmed by capoeirahistory.com
-- Family: Azorean heritage spread over several countries
--
-- STYLE: Regional - Learned from Mestre Artur Emídio and Djalma Bandeira
--
-- LINEAGE: Neném (African) → Paizinho → Artur Emídio → Lamartine Pereira
--
-- SIGNIFICANCE: Author of first capoeira bestseller "Capoeira sem mestre"
-- (1962); taught capoeira methodology to 208 naval personnel (1961);
-- pioneer of capoeira pedagogy and systematization; later became renowned
-- sports science researcher contributing to Brazil's 1970 World Cup victory.
--
-- NOTE ON TITLE: Uses "Professor" rather than "Mestre" - was a practitioner
-- and teacher but primarily known for academic/pedagogical contributions
-- rather than as a capoeira master in the traditional lineage sense.
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
  'Lamartine Pereira da Costa',
  'Lamartine Pereira',
  'professor'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
    'https://cev.org.br/qq/lamartine/',
    'https://archive.org/details/capoeiragem-a-arte-da-defesa-pessoal-brasileira'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Lamartine Pereira learned capoeira from Mestre Artur Emídio and Djalma Bandeira, inheriting the systematized Bahian method transmitted through the Neném → Paizinho → Artur Emídio lineage. His approach was primarily pedagogical and analytical rather than purely practical. Fascinated by capoeira''s potential for physical education, he studied under the Rio de Janeiro mestres and also visited famous masters in Bahia to understand different approaches. His books prioritized learner autonomy and didactic methodology, de-emphasizing the ritualistic aspects and master-centered transmission in favor of systematic movement instruction with detailed illustrations.',
  E'Lamartine Pereira aprendeu capoeira com Mestre Artur Emídio e Djalma Bandeira, herdando o método sistematizado baiano transmitido através da linhagem Neném → Paizinho → Artur Emídio. Sua abordagem era principalmente pedagógica e analítica, ao invés de puramente prática. Fascinado pelo potencial da capoeira para a educação física, ele estudou com os mestres do Rio de Janeiro e também visitou mestres famosos na Bahia para entender diferentes abordagens. Seus livros priorizavam a autonomia do aprendiz e a metodologia didática, diminuindo a ênfase nos aspectos ritualísticos e na transmissão centrada no mestre em favor de instrução sistemática de movimentos com ilustrações detalhadas.',
  -- Life dates
  1935,
  'year'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,  -- Still alive as of 2025
  NULL,
  NULL,
  -- Extended content (English)
  E'Lamartine Pereira da Costa was born in 1935 in Rio de Janeiro into an Azorean family spread over several countries. At age 16, he entered the Naval College, then began studying Operational Engineering at the Navy''s High School (Escola Naval da Marinha). More motivated by sports than by engineering, he transferred to the Physical Education School of the Army (Escola de Educação Física do Exército), graduating in 1959.

His fascination with capoeira led him to train with Mestre Artur Emídio and his first student Djalma Bandeira. He also visited famous masters in Bahia to understand the art more deeply. Based on his apprenticeship with Artur Emídio and in close collaboration with the master, he began documenting capoeira movements systematically.

In March 1961, the then-Lieutenant Lamartine began administering a course on the "methodology of teaching capoeira" at the Navy Sports Centre (Centro de Esportes da Marinha), with the assistance of his master Artur Emídio and Djalma Bandeira. According to Jornal do Brasil (April 9, 1961), Lamartine taught 208 officers and enlisted men. The objective was "to train capoeira monitors, who would propagate the practice of capoeira in all Navy establishments, in particular the Navy''s air force." This marked one of the first institutional adoptions of capoeira by the Brazilian military.

That same year, he published "Capoeiragem: A Arte da Defesa Pessoal Brasileira" (Capoeiragem: The Brazilian Art of Self-Defense), a manual that catalogued and explained capoeira''s main movements in a didactic manner using illustrations that became iconic. The first edition was still of quite artisanal making, published by Editora Autor with 33 pages. The book represented the fourth major published work on capoeira and initiated "the first systematization of capoeiragem," prioritizing learning and seeking greater autonomy for the learner.

The publishing house Tecnoprint financed a new edition soon after and decided to change the title to "Capoeira sem Mestre" (Capoeira Without a Master) in 1962, following a common editorial line at the time for popular pocket books. This 116-page edition by Edições de Ouro proposed a kind of distance learning for capoeira. The new title did not fail to raise polemics in the capoeira community - many Bahian masters who defended the traditional method criticized a capoeira learned without any master having personally passed on the fundamentals of the art. Nevertheless, the book sold thousands of copies and was re-edited in 1964, 1968, and 1970, playing a very important role in the dissemination of capoeira throughout Brazil during the 1960s and 1970s.

Beyond capoeira, Lamartine became a protagonist in Sports Training Science. He was instrumental in Brazil''s conquest of the 1970 World Cup in Mexico, being responsible for the altitude training planning. The Brazilian delegation was the first to land in Mexico on May 2, a month before their first match. As coach Zagallo noted, "we won most of our matches in the second half" - of Brazil''s 19 goals, 12 came after the interval, demonstrating the effectiveness of their physical preparation.

His academic career was equally distinguished. He earned a doctorate in Philosophy from Universidade Gama Filho (1989), a livre docência (habilitation) in Sports Management from the State University of Rio de Janeiro (1988), and held numerous academic positions including full professor at Universidade Gama Filho, member of the International Olympic Committee Research Council in Lausanne (2001-2008), and visiting professor at universities in Portugal, Spain, and England.

In 2005, he organized the "Atlas do Esporte no Brasil" (Atlas of Sport in Brazil), a monumental work of nearly 900 pages involving 410 qualified collaborators and 17 editors working voluntarily for two years. In 2019, PUCRS (Pontifical Catholic University of Rio Grande do Sul) awarded him the title of Doctor Honoris Causa, recognizing him as one of the great names in Brazilian Physical Education.

As of 2025, Lamartine continues his work as curator of the eMuseu do Esporte (eSport Museum) at UERJ in Rio de Janeiro, a virtual museum he co-founded with Professor Bianca Gama Pena, inspired by the Rio 2016 Olympic Games.',
  -- Extended content (Portuguese)
  E'Lamartine Pereira da Costa nasceu em 1935 no Rio de Janeiro em uma família de origem açoriana espalhada por vários países. Aos 16 anos, ingressou na Escola Naval, e então começou a estudar Engenharia Operacional na Escola Naval da Marinha. Mais motivado pelo esporte do que pela engenharia, transferiu-se para a Escola de Educação Física do Exército, graduando-se em 1959.

Seu fascínio pela capoeira o levou a treinar com Mestre Artur Emídio e seu primeiro aluno Djalma Bandeira. Ele também visitou mestres famosos na Bahia para entender a arte mais profundamente. Baseado em seu aprendizado com Artur Emídio e em estreita colaboração com o mestre, começou a documentar os movimentos da capoeira sistematicamente.

Em março de 1961, o então Tenente Lamartine começou a administrar um curso sobre a "metodologia de ensino de capoeira" no Centro de Esportes da Marinha, com a assistência de seu mestre Artur Emídio e Djalma Bandeira. Segundo o Jornal do Brasil (9 de abril de 1961), Lamartine ensinou 208 oficiais e praças. O objetivo era "formar monitores de capoeira, que propagariam a prática da capoeira em todos os estabelecimentos da Marinha, em particular a força aérea da Marinha." Isso marcou uma das primeiras adoções institucionais da capoeira pelas forças armadas brasileiras.

Nesse mesmo ano, ele publicou "Capoeiragem: A Arte da Defesa Pessoal Brasileira", um manual que catalogava e explicava os principais movimentos da capoeira de maneira didática usando ilustrações que se tornaram icônicas. A primeira edição ainda era de produção bastante artesanal, publicada pela Editora Autor com 33 páginas. O livro representou a quarta grande obra publicada sobre capoeira e iniciou "a primeira sistematização da capoeiragem", priorizando a aprendizagem e buscando maior autonomia para o aprendiz.

A editora Tecnoprint financiou uma nova edição logo depois e decidiu mudar o título para "Capoeira sem Mestre" em 1962, seguindo uma linha editorial comum na época para livros populares de bolso. Esta edição de 116 páginas pelas Edições de Ouro propunha uma espécie de ensino à distância para a capoeira. O novo título não deixou de gerar polêmicas na comunidade da capoeira - muitos mestres baianos que defendiam o método tradicional criticaram uma capoeira aprendida sem que nenhum mestre tivesse passado pessoalmente os fundamentos da arte. No entanto, o livro vendeu milhares de exemplares e foi reeditado em 1964, 1968 e 1970, desempenhando um papel muito importante na disseminação da capoeira por todo o Brasil durante os anos 1960 e 1970.

Além da capoeira, Lamartine se tornou um protagonista na Ciência do Treinamento Esportivo. Ele foi fundamental na conquista do Brasil na Copa do Mundo de 1970 no México, sendo responsável pelo planejamento do treinamento em altitude. A delegação brasileira foi a primeira a chegar ao México em 2 de maio, um mês antes da primeira partida. Como o técnico Zagallo observou, "ganhamos a maioria das nossas partidas no segundo tempo" - dos 19 gols do Brasil, 12 foram marcados após o intervalo, demonstrando a eficácia da preparação física.

Sua carreira acadêmica foi igualmente distinta. Obteve doutorado em Filosofia pela Universidade Gama Filho (1989), livre docência em Gestão do Esporte pela Universidade do Estado do Rio de Janeiro (1988), e ocupou inúmeras posições acadêmicas incluindo professor titular da Universidade Gama Filho, membro do Conselho de Pesquisa do Comitê Olímpico Internacional em Lausanne (2001-2008) e professor visitante em universidades de Portugal, Espanha e Inglaterra.

Em 2005, ele organizou o "Atlas do Esporte no Brasil", uma obra monumental de quase 900 páginas envolvendo 410 colaboradores qualificados e 17 editores trabalhando voluntariamente por dois anos. Em 2019, a PUCRS (Pontifícia Universidade Católica do Rio Grande do Sul) concedeu-lhe o título de Doutor Honoris Causa, reconhecendo-o como um dos grandes nomes da Educação Física brasileira.

Em 2025, Lamartine continua seu trabalho como curador do eMuseu do Esporte na UERJ no Rio de Janeiro, um museu virtual que cofundou com a Professora Bianca Gama Pena, inspirado nos Jogos Olímpicos Rio 2016.',
  -- Achievements (English)
  E'- Author of "Capoeiragem: A Arte da Defesa Pessoal Brasileira" (1961) - initiated first systematization of capoeira pedagogy
- Author of "Capoeira sem Mestre" (1962) - first capoeira bestseller, sold thousands of copies, re-edited 1964, 1968, 1970
- Taught capoeira methodology to 208 Brazilian Navy officers and enlisted men (1961)
- Pioneer of institutional capoeira in Brazilian military
- Responsible for altitude training planning for Brazil''s 1970 World Cup victory in Mexico
- Organizer of "Atlas do Esporte no Brasil" (2005) - 900-page work with 410 collaborators
- Member of International Olympic Committee Research Council (2001-2008)
- Doctor Honoris Causa from PUCRS (2019)
- Full Professor at Universidade Gama Filho
- Doctorate in Philosophy (1989), Livre Docência in Sports Management (1988)
- Co-founder and Curator of eMuseu do Esporte at UERJ
- Member of World Anti-Doping Agency (2000-2008)
- President of Brazilian Olympic Academy (1991-1998)',
  -- Achievements (Portuguese)
  E'- Autor de "Capoeiragem: A Arte da Defesa Pessoal Brasileira" (1961) - iniciou primeira sistematização da pedagogia da capoeira
- Autor de "Capoeira sem Mestre" (1962) - primeiro bestseller de capoeira, vendeu milhares de exemplares, reeditado em 1964, 1968, 1970
- Ensinou metodologia de capoeira para 208 oficiais e praças da Marinha do Brasil (1961)
- Pioneiro da capoeira institucional nas forças armadas brasileiras
- Responsável pelo planejamento do treinamento em altitude para a vitória do Brasil na Copa do Mundo de 1970 no México
- Organizador do "Atlas do Esporte no Brasil" (2005) - obra de 900 páginas com 410 colaboradores
- Membro do Conselho de Pesquisa do Comitê Olímpico Internacional (2001-2008)
- Doutor Honoris Causa pela PUCRS (2019)
- Professor Titular da Universidade Gama Filho
- Doutorado em Filosofia (1989), Livre Docência em Gestão do Esporte (1988)
- Cofundador e Curador do eMuseu do Esporte na UERJ
- Membro da Agência Mundial Antidoping (2000-2008)
- Presidente da Academia Olímpica Brasileira (1991-1998)',
  -- Researcher notes (English)
  E'BIRTH YEAR: 1935 - Confirmed by capoeirahistory.com and cev.org.br. Born in Rio de Janeiro into an Azorean family.

STILL ALIVE: As of 2025, Lamartine Pereira da Costa is still active as curator of eMuseu do Esporte at UERJ. No death date found.

TITLE DESIGNATION: Uses "Professor" rather than "Mestre" because:
1. His primary contribution was pedagogical and academic, not as a traditional capoeira master
2. Sources consistently refer to him as "Professor Lamartine" not "Mestre Lamartine"
3. He was a practitioner who systematized capoeira for teaching, rather than a lineage-holder who trained students in the traditional sense

TEACHERS:
- Mestre Artur Emídio (primary teacher, ~1959-1961)
- Djalma Bandeira (trained with him alongside Artur Emídio)
- Also visited famous mestres in Bahia for additional study

NAVY COURSE (1961):
- Started March 1961
- Location: Centro de Esportes da Marinha (Navy Sports Centre), Rio de Janeiro
- Students: 208 officers and enlisted men
- Objective: Train monitors to propagate capoeira in Navy establishments
- Source: Jornal do Brasil, April 9, 1961
- This predates most institutional adoption of capoeira

PUBLICATIONS:
1. "Capoeiragem: A Arte da Defesa Pessoal Brasileira" (1961)
   - Publisher: Editora Autor
   - Pages: 33 (some sources say 63)
   - Fourth major published work on capoeira
   - First systematization of capoeira pedagogy

2. "Capoeira sem Mestre" (1962)
   - Publisher: Edições de Ouro / Tecnoprint
   - Pages: 116
   - Re-edited: 1964, 1968, 1970
   - Sold thousands of copies
   - Controversial title suggesting self-learning without a master
   - Used techniques of Artur Emídio with iconic illustrations

CONTROVERSY: "Capoeira sem Mestre" was criticized by traditional Bahian mestres who believed capoeira could not be properly learned without personal transmission from a master.

ACADEMIC CAREER:
- Naval Sciences: Escola Naval (1958)
- Physical Education: EsEFEx (1959)
- CISM Academy Brussels (1963-1972)
- Ergonomics: FGV-RJ (1971)
- Livre Docência: Sports Management, UERJ (1988)
- PhD: Philosophy, Universidade Gama Filho (1989)

1970 WORLD CUP:
- The "Planejamento México" (Mexico Planning)
- Responsible for altitude training planning
- Brazilian delegation first to arrive in Mexico (May 2, 1970)
- Published "Altitude Training" in Sport International (n. 36, 1967)
- Co-authored "A Moderna Ciência do Treinamento Desportivo" (1968)
- Result: 12 of Brazil''s 19 goals scored in second halves

SOURCES CONSULTED:
- capoeirahistory.com/mestre/professor-lamartine-eng-1935/ (primary)
- cev.org.br/qq/lamartine/
- cev.org.br/biblioteca/capoeiragem-a-arte-da-defesa-pessoal-brasileira/
- archive.org/details/capoeiragem-a-arte-da-defesa-pessoal-brasileira
- portal.pucrs.br (Honoris Causa award)
- capoeiranews.com.br/2015/05/capoeira-sem-mestre.html',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: 1935 - Confirmado por capoeirahistory.com e cev.org.br. Nascido no Rio de Janeiro em família de origem açoriana.

AINDA VIVO: Em 2025, Lamartine Pereira da Costa continua ativo como curador do eMuseu do Esporte na UERJ. Nenhuma data de falecimento encontrada.

DESIGNAÇÃO DE TÍTULO: Usa "Professor" ao invés de "Mestre" porque:
1. Sua contribuição principal foi pedagógica e acadêmica, não como mestre tradicional de capoeira
2. Fontes consistentemente o chamam de "Professor Lamartine" e não "Mestre Lamartine"
3. Ele era um praticante que sistematizou a capoeira para ensino, ao invés de um detentor de linhagem que treinou alunos no sentido tradicional

MESTRES:
- Mestre Artur Emídio (mestre principal, ~1959-1961)
- Djalma Bandeira (treinou com ele junto com Artur Emídio)
- Também visitou mestres famosos na Bahia para estudo adicional

CURSO DA MARINHA (1961):
- Iniciou em março de 1961
- Local: Centro de Esportes da Marinha, Rio de Janeiro
- Alunos: 208 oficiais e praças
- Objetivo: Formar monitores para propagar a capoeira nos estabelecimentos da Marinha
- Fonte: Jornal do Brasil, 9 de abril de 1961
- Isso antecede a maioria das adoções institucionais da capoeira

PUBLICAÇÕES:
1. "Capoeiragem: A Arte da Defesa Pessoal Brasileira" (1961)
   - Editora: Editora Autor
   - Páginas: 33 (algumas fontes dizem 63)
   - Quarta grande obra publicada sobre capoeira
   - Primeira sistematização da pedagogia da capoeira

2. "Capoeira sem Mestre" (1962)
   - Editora: Edições de Ouro / Tecnoprint
   - Páginas: 116
   - Reeditado: 1964, 1968, 1970
   - Vendeu milhares de exemplares
   - Título controverso sugerindo auto-aprendizado sem mestre
   - Usou técnicas de Artur Emídio com ilustrações icônicas

CONTROVÉRSIA: "Capoeira sem Mestre" foi criticado por mestres tradicionais baianos que acreditavam que a capoeira não poderia ser adequadamente aprendida sem transmissão pessoal de um mestre.

CARREIRA ACADÊMICA:
- Ciências Navais: Escola Naval (1958)
- Educação Física: EsEFEx (1959)
- Academia CISM Bruxelas (1963-1972)
- Ergonomia: FGV-RJ (1971)
- Livre Docência: Gestão do Esporte, UERJ (1988)
- PhD: Filosofia, Universidade Gama Filho (1989)

COPA DO MUNDO 1970:
- O "Planejamento México"
- Responsável pelo planejamento do treinamento em altitude
- Delegação brasileira primeira a chegar ao México (2 de maio de 1970)
- Publicou "Altitude Training" na Sport International (n. 36, 1967)
- Coautor de "A Moderna Ciência do Treinamento Desportivo" (1968)
- Resultado: 12 dos 19 gols do Brasil marcados nos segundos tempos

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/professor-lamartine-eng-1935/ (primária)
- cev.org.br/qq/lamartine/
- cev.org.br/biblioteca/capoeiragem-a-arte-da-defesa-pessoal-brasileira/
- archive.org/details/capoeiragem-a-arte-da-defesa-pessoal-brasileira
- portal.pucrs.br (título Honoris Causa)
- capoeiranews.com.br/2015/05/capoeira-sem-mestre.html'
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

-- Source: entities/persons/licuri.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Licurí
-- Generated: 2026-01-03
-- ============================================================
-- Profile Type: proto_mestre
-- Era: Late 19th - early 20th century
--
-- BIRTH YEAR ESTIMATION (~1880, decade):
-- - Cobrinha Verde (b. 1912) learned from him after Besouro's death (1924)
-- - Licurí was already an established capoeirista/teacher in Santo Amaro
-- - Capoeira teachers typically active in their 30s-40s
-- - If teaching in mid-1920s at age 40-45, born ~1880
--
-- SOURCE: Mestre Cobrinha Verde's autobiographical testimony:
-- "I learned from many mestres in Santo Amaro. I will give their names
-- one by one: Maitá (who even had a samba song named after him), Licurí,
-- Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião,
-- Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."
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
  'Licurí',
  NULL,
  NULL,
  ARRAY['https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/', 'https://capoeira.online/history/mestres/cobrinha-verde/', 'https://www.lalaue.com/learn-capoeira/mestre-cobrinha-verde']::text[],
  NULL,
  NULL,
  NULL,
  1880, 'decade'::genealogy.date_precision, 'Santo Amaro da Purificação, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Licurí was one of the capoeiristas of Santo Amaro da Purificação in the Recôncavo Baiano who taught Mestre Cobrinha Verde during the early twentieth century. His name appears in Cobrinha Verde''s autobiographical testimony listing the mestres from whom he learned after the death of his primary teacher, Besouro Mangangá, in 1924.\n\nIn his autobiography, Cobrinha Verde stated: "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nSanto Amaro da Purificação, in Cobrinha Verde''s own words, was "the birthplace of Bahian capoeira." Licurí was part of the generation that made it so. He belonged to an era when capoeira was practiced informally in streets, docks, and festivals—before the establishment of formal academies. These proto-mestres passed down the art through lived experience rather than structured curriculum, training the next generation amid police persecution and the daily struggle of working-class life in the Recôncavo.\n\nNothing more is currently known about Licurí—his full name, his profession, his life story have not survived in documented sources. He remains one of the shadowy figures of capoeira''s oral history: known to have existed, known to have taught one of the great mestres of the twentieth century, but preserved only in the memory of those who came after.',
  E'Licurí foi um dos capoeiristas de Santo Amaro da Purificação no Recôncavo Baiano que ensinou Mestre Cobrinha Verde durante o início do século XX. Seu nome aparece no testemunho autobiográfico de Cobrinha Verde listando os mestres com quem aprendeu após a morte de seu professor principal, Besouro Mangangá, em 1924.\n\nEm sua autobiografia, Cobrinha Verde declarou: "Aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um por um: Maitá (que até tinha um samba com nome dele), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nSanto Amaro da Purificação, nas próprias palavras de Cobrinha Verde, era "o berço da capoeira baiana." Licurí fez parte da geração que a tornou assim. Ele pertenceu a uma era em que a capoeira era praticada informalmente nas ruas, docas e festas—antes do estabelecimento de academias formais. Esses proto-mestres passavam a arte através da experiência vivida em vez de currículo estruturado, treinando a próxima geração em meio à perseguição policial e à luta diária da vida da classe trabalhadora no Recôncavo.\n\nNada mais se sabe atualmente sobre Licurí—seu nome completo, sua profissão, sua história de vida não sobreviveram em fontes documentadas. Ele permanece uma das figuras obscuras da história oral da capoeira: sabidamente existiu, sabidamente ensinou um dos grandes mestres do século XX, mas preservado apenas na memória daqueles que vieram depois.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1880, decade):\nCobrinha Verde (b. 1912) learned from Licurí after Besouro''s death in 1924, when Cobrinha was about 12 years old. Licurí was already an established teacher at this time. Capoeira teachers were typically active in their 30s-40s, so if teaching in the mid-1920s at age 40-45, he was likely born around 1880.\n\nTEACHERS:\n- Unknown; predates documented lineage records\n\nSTUDENTS:\n- Cobrinha Verde (Rafael Alves França, trained after 1924, Santo Amaro)\n\nCONTEMPORARIES (Santo Amaro proto-mestres):\n- Maitá (had a samba song named after him), Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo, Tonha Rolo do Mar\n\nNOTES:\n- Title is NULL because formal mestre titles did not exist in the modern sense during his era\n- Style is NULL because the Angola/Regional distinction came later\n- Name "Licurí" refers to a type of palm tree (Syagrus coronata) native to the Bahian sertão; apelidos often reflected occupation, physical traits, or local flora',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1880, década):\nCobrinha Verde (n. 1912) aprendeu com Licurí após a morte de Besouro em 1924, quando Cobrinha tinha cerca de 12 anos. Licurí já era um professor estabelecido neste momento. Mestres de capoeira geralmente ensinavam entre 30-45 anos, então se ensinava em meados dos anos 1920 com 40-45 anos, provavelmente nasceu por volta de 1880.\n\nPROFESSORES:\n- Desconhecido; antecede registros de linhagem documentados\n\nALUNOS:\n- Cobrinha Verde (Rafael Alves França, treinou após 1924, Santo Amaro)\n\nCONTEMPORÂNEOS (proto-mestres de Santo Amaro):\n- Maitá (tinha um samba com seu nome), Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo, Tonha Rolo do Mar\n\nNOTAS:\n- Título é NULL porque títulos formais de mestre não existiam no sentido moderno durante sua era\n- Estilo é NULL porque a distinção Angola/Regional veio depois\n- Nome "Licurí" refere-se a um tipo de palmeira (Syagrus coronata) nativa do sertão baiano; apelidos frequentemente refletiam ocupação, traços físicos ou flora local'
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

-- Source: entities/persons/limao.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Limão
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR: July 18, 1945 (exact) - Santo Amaro da Purificação, Bahia
-- Multiple sources confirm birth date: capoeiragita.webnode.com.br, IPHAN
--
-- DEATH YEAR: 1985 (year precision)
-- Killed at Usina Paranaguá in Santo Amaro da Purificação, Bahia
-- Sources describe death by ambush after confrontation with a man
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  -- Identity
  'Paulo dos Santos',
  'Limão',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeiragita.webnode.com.br/news/mestre-limao/'
  ]::text[],
  -- Style
  'angola'::genealogy.style,
  E'Mestre Limão was an Angoleiro (practitioner of Capoeira Angola) who learned from Mestre Caiçara, but paradoxically taught Capoeira Regional at his academies. The only people he taught Angola to were his nephew Limãozinho, Silvio Acarajé, and Jorginho. He was renowned as "um fino aplicador de rasteira" (a fine practitioner of the leg sweep), one of capoeira''s most fundamental and deceptive takedown techniques.',
  E'Mestre Limão era um Angoleiro (praticante de Capoeira Angola) que aprendeu com Mestre Caiçara, mas paradoxalmente ensinava Capoeira Regional em suas academias. As únicas pessoas que ele ensinou Angola foram seu sobrinho Limãozinho, Silvio Acarajé e Jorginho. Ele era conhecido como "um fino aplicador de rasteira", uma das técnicas de derrubada mais fundamentais e enganosas da capoeira.',
  -- Birth
  1945, 'exact'::genealogy.date_precision, 'Santo Amaro da Purificação, Bahia, Brazil',
  -- Death
  1985, 'year'::genealogy.date_precision, 'Usina Paranaguá, Santo Amaro da Purificação, Bahia, Brazil',
  -- bio_en
  E'Paulo dos Santos was born on July 18, 1945, in Santo Amaro da Purificação, a city in the Recôncavo Baiano renowned for producing legendary capoeiristas including Mestre Traíra and Mestre Caiçara. He learned capoeira as a child in the street rodas, the informal gatherings where capoeira was transmitted from generation to generation. He became a student of Mestre Caiçara, the hard-fighting Angoleiro known for his iconic bengala and famous confrontation with Mestre Bimba.

Limão received his apelido (nickname) from Mestre Canjiquinha because he sold lemons at the market in his youth—a common pattern of nicknames derived from occupations in traditional capoeira.

In 1969, Limão came to São Paulo together with Mestre Caiçara to record the LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos do Mestre Caiçara". On this recording, Limão played the berimbau gunga "divinamente" (divinely), according to sources. Following this recording and several excellent Capoeira Angola presentations in São Paulo, Limão received from Mestre Caiçara, along with Mestre Silvestre, the coveted title of contra-mestre.

In São Paulo, Limão began frequenting the famous rodas at Praça da República and formed friendships with the community of Bahian capoeiristas who had migrated to the industrial capital: Mestre Joel, Mestre Suassuna, Mestre Brasília, and others. He met Mestre Pinatti, with whom he formed a lasting friendship.

On August 1, 1969, Limão co-founded the Academia de Capoeira São Bento Pequeno with Mestres Pinatti and Paulão—the famous "three Ps" (Pinatti, Paulão, Paulo Limão). This academy was notable for its "Capoeira Angolinha" style, an eclectic approach between Regional and Angola. The academy developed a graduation system using pants colors instead of cordas: black for novice, green for baptized, yellow for intermediate, blue for advanced, and white for the Master.

In 1970, feeling the need to establish his own work, Limão founded the Academia Quilombo dos Palmares on June 1, 1970, on Avenida Morumbi in São Paulo''s South Zone. This academy became his primary base and established him as one of the greatest names in capoeira. The academy later moved to Avenida Adolfo Pinheiro in the Santo Amaro district of São Paulo, where it remained for many years.

In 1971, Limão was one of the "Grupo dos Nove" (Group of Nine) recognized by Mestre Bimba as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo). When Bimba visited São Paulo at the invitation of Mestre Onça, he symbolically honored these nine mestres: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, and Onça himself.

Limão also founded the Praia do Sol group during the 1970s-80s, which established a lineage that continues today through Mestre Marcio and Mestre Paraná.

In 1985, Limão decided to return to his homeland of Bahia and went to work at Usina Paranaguá in Santo Amaro da Purificação. There, he had a confrontation with a man and killed him using a capoeira strike. A trap was set, and Limão was killed in an ambush—"morto à traição" (killed by treachery). He was killed with great cruelty, but left his mark as one of the best capoeiristas Brazil has ever had.

One phrase Mestre Limão frequently said: "Tem aluno e tem discípulo, o discípulo quer pegar toda a essência do Mestre" (There are students and there are disciples; the disciple wants to capture the entire essence of the Master).',
  -- bio_pt
  E'Paulo dos Santos nasceu em 18 de julho de 1945, em Santo Amaro da Purificação, cidade do Recôncavo Baiano famosa por produzir capoeiristas lendários como Mestre Traíra e Mestre Caiçara. Aprendeu capoeira quando criança nas rodas de rua, os encontros informais onde a capoeira era transmitida de geração em geração. Tornou-se aluno de Mestre Caiçara, o Angoleiro de luta dura conhecido por sua icônica bengala e famoso confronto com Mestre Bimba.

Limão recebeu seu apelido de Mestre Canjiquinha porque vendia limões na feira em sua juventude—um padrão comum de apelidos derivados de ocupações na capoeira tradicional.

Em 1969, Limão veio para São Paulo junto com Mestre Caiçara para gravar o LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos do Mestre Caiçara". Nesta gravação, Limão tocou o berimbau gunga "divinamente", segundo fontes. Após esta gravação e várias excelentes apresentações de Capoeira Angola em São Paulo, Limão recebeu de Mestre Caiçara, junto com Mestre Silvestre, o cobiçado título de contra-mestre.

Em São Paulo, Limão começou a frequentar as famosas rodas na Praça da República e formou amizades com a comunidade de capoeiristas baianos que haviam migrado para a capital industrial: Mestre Joel, Mestre Suassuna, Mestre Brasília e outros. Conheceu Mestre Pinatti, com quem formou uma amizade duradoura.

Em 1° de agosto de 1969, Limão co-fundou a Academia de Capoeira São Bento Pequeno com os Mestres Pinatti e Paulão—os famosos "três Pês". Esta academia era notável por seu estilo "Capoeira Angolinha", uma abordagem eclética entre Regional e Angola. A academia desenvolveu um sistema de graduação usando cores de calças em vez de cordas: preta para novato, verde para batizado, amarela para intermediário, azul para avançado e branca para o Mestre.

Em 1970, sentindo necessidade de estabelecer seu próprio trabalho, Limão fundou a Academia Quilombo dos Palmares em 1° de junho de 1970, na Avenida Morumbi, na Zona Sul de São Paulo. Esta academia se tornou sua base principal e o estabeleceu como um dos maiores nomes da capoeira. A academia mais tarde se mudou para a Avenida Adolfo Pinheiro no bairro de Santo Amaro em São Paulo, onde permaneceu por muitos anos.

Em 1971, Limão foi um dos "Grupo dos Nove" reconhecido por Mestre Bimba como os "Percursores da Capoeira em São Paulo". Quando Bimba visitou São Paulo a convite de Mestre Onça, ele simbolicamente homenageou estes nove mestres: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas e o próprio Onça.

Limão também fundou o grupo Praia do Sol durante os anos 1970-80, que estabeleceu uma linhagem que continua hoje através de Mestre Marcio e Mestre Paraná.

Em 1985, Limão decidiu retornar à sua terra natal, Bahia, e foi trabalhar na Usina Paranaguá em Santo Amaro da Purificação. Lá, ele teve um confronto com um homem e o matou usando um golpe de capoeira. Uma cilada foi armada, e Limão foi morto em uma emboscada—"morto à traição". Ele foi morto com grande crueldade, mas deixou sua marca como um dos melhores capoeiristas que o Brasil já teve.

Uma frase que Mestre Limão dizia frequentemente: "Tem aluno e tem discípulo, o discípulo quer pegar toda a essência do Mestre".',
  -- achievements_en
  E'- 1969: Came to São Paulo with Mestre Caiçara to record LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos do Mestre Caiçara"; played berimbau gunga
- 1969: Received title of contra-mestre from Mestre Caiçara (with Mestre Silvestre)
- August 1, 1969: Co-founded Academia de Capoeira São Bento Pequeno with Mestres Pinatti and Paulão
- June 1, 1970: Founded Academia Quilombo dos Palmares on Avenida Morumbi, São Paulo
- 1971: Recognized by Mestre Bimba as one of the "Grupo dos Nove" pioneers of capoeira in São Paulo
- 1970s-80s: Founded Grupo Praia do Sol in São Paulo
- Trained nephew Mestre Limãozinho (José Carlos dos Santos), who received contra-mestre title in 1972
- Known as one of the greatest names in São Paulo capoeira history',
  -- achievements_pt
  E'- 1969: Veio para São Paulo com Mestre Caiçara para gravar LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos do Mestre Caiçara"; tocou berimbau gunga
- 1969: Recebeu título de contra-mestre de Mestre Caiçara (com Mestre Silvestre)
- 1° de agosto de 1969: Co-fundou Academia de Capoeira São Bento Pequeno com Mestres Pinatti e Paulão
- 1° de junho de 1970: Fundou Academia Quilombo dos Palmares na Avenida Morumbi, São Paulo
- 1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
- Anos 1970-80: Fundou Grupo Praia do Sol em São Paulo
- Treinou sobrinho Mestre Limãozinho (José Carlos dos Santos), que recebeu título de contra-mestre em 1972
- Conhecido como um dos maiores nomes da história da capoeira paulista',
  -- notes_en
  E'BIRTH DATE: July 18, 1945 (exact)
- Multiple sources confirm: capoeiragita.webnode.com.br, IPHAN profile of Limãozinho
- Birthplace: Santo Amaro da Purificação, Bahia

DEATH YEAR: 1985 (year precision)
- Killed at Usina Paranaguá in Santo Amaro da Purificação, Bahia
- Circumstances: confrontation → killed man with capoeira strike → ambush/trap set → "morto à traição"
- Sources describe death as particularly cruel

NAME:
- Full name: Paulo dos Santos
- Apelido: Limão
- Also called: Paulo Limão, Mestre Paulo Limão

APELIDO ORIGIN:
- Given by Mestre Canjiquinha because he sold lemons (limões) at the market

TEACHERS:
- Mestre Caiçara (Antônio Conceição Moraes) - primary teacher (Angola)
- Street roda training as child in Santo Amaro da Purificação

STUDENTS:
- Limãozinho (José Carlos dos Santos, nephew) - born Sept 15, 1957; contra-mestre 1972; Angola
- Silvio Acarajé - Angola
- Jorginho - Angola
- Mestre Marcio (Praia do Sol lineage)
- Note: Only taught Angola to Limãozinho, Silvio Acarajé, and Jorginho; taught Regional to other students

CONTEMPORARIES (São Paulo):
- Mestre Joel - frequented rodas together
- Mestre Suassuna - frequented rodas together
- Mestre Brasília - frequented rodas together
- Mestre Pinatti (Djamir Pinatti) - co-founded São Bento Pequeno together
- Mestre Paulão - co-founded São Bento Pequeno together
- Mestre Silvestre - both received contra-mestre from Caiçara in 1969
- Mestre Natanael - taught together in Santo Amaro (SP district)

GROUPS FOUNDED:
- Academia de Capoeira São Bento Pequeno (Aug 1, 1969) - co-founder with Pinatti, Paulão
- Academia Quilombo dos Palmares (Jun 1, 1970) - founder; Av. Morumbi then Av. Adolfo Pinheiro, Santo Amaro
- Grupo Praia do Sol (1970s-80s) - founder

MEDIA APPEARANCES:
- 1969: LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos do Mestre Caiçara" (berimbau gunga)

RECOGNITIONS:
- 1971: "Grupo dos Nove" pioneer recognition from Mestre Bimba

NOTABLE QUOTE:
- "Tem aluno e tem discípulo, o discípulo quer pegar toda a essência do Mestre"

STYLE PARADOX:
- Was an Angoleiro (trained in Angola by Caiçara)
- Taught Regional style at his academies
- Reserved Angola instruction for select few: nephew Limãozinho, Silvio Acarajé, Jorginho',
  -- notes_pt
  E'DATA DE NASCIMENTO: 18 de julho de 1945 (exata)
- Múltiplas fontes confirmam: capoeiragita.webnode.com.br, perfil IPHAN de Limãozinho
- Local de nascimento: Santo Amaro da Purificação, Bahia

ANO DE FALECIMENTO: 1985 (precisão de ano)
- Morto na Usina Paranaguá em Santo Amaro da Purificação, Bahia
- Circunstâncias: confronto → matou homem com golpe de capoeira → cilada armada → "morto à traição"
- Fontes descrevem morte como particularmente cruel

NOME:
- Nome completo: Paulo dos Santos
- Apelido: Limão
- Também chamado: Paulo Limão, Mestre Paulo Limão

ORIGEM DO APELIDO:
- Dado por Mestre Canjiquinha porque vendia limões na feira

MESTRES:
- Mestre Caiçara (Antônio Conceição Moraes) - mestre principal (Angola)
- Treinamento nas rodas de rua quando criança em Santo Amaro da Purificação

ALUNOS:
- Limãozinho (José Carlos dos Santos, sobrinho) - nascido 15 set 1957; contra-mestre 1972; Angola
- Silvio Acarajé - Angola
- Jorginho - Angola
- Mestre Marcio (linhagem Praia do Sol)
- Nota: Só ensinou Angola para Limãozinho, Silvio Acarajé e Jorginho; ensinou Regional para outros alunos

CONTEMPORÂNEOS (São Paulo):
- Mestre Joel - frequentavam rodas juntos
- Mestre Suassuna - frequentavam rodas juntos
- Mestre Brasília - frequentavam rodas juntos
- Mestre Pinatti (Djamir Pinatti) - co-fundou São Bento Pequeno juntos
- Mestre Paulão - co-fundou São Bento Pequeno juntos
- Mestre Silvestre - ambos receberam contra-mestre de Caiçara em 1969
- Mestre Natanael - ensinaram juntos em Santo Amaro (bairro de SP)

GRUPOS FUNDADOS:
- Academia de Capoeira São Bento Pequeno (1° ago 1969) - co-fundador com Pinatti, Paulão
- Academia Quilombo dos Palmares (1° jun 1970) - fundador; Av. Morumbi depois Av. Adolfo Pinheiro, Santo Amaro
- Grupo Praia do Sol (anos 1970-80) - fundador

APARIÇÕES NA MÍDIA:
- 1969: LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos do Mestre Caiçara" (berimbau gunga)

RECONHECIMENTOS:
- 1971: Reconhecimento de pioneiro "Grupo dos Nove" de Mestre Bimba

FRASE NOTÁVEL:
- "Tem aluno e tem discípulo, o discípulo quer pegar toda a essência do Mestre"

PARADOXO DE ESTILO:
- Era Angoleiro (treinado em Angola por Caiçara)
- Ensinava estilo Regional em suas academias
- Reservava instrução de Angola para poucos selecionados: sobrinho Limãozinho, Silvio Acarajé, Jorginho'
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

-- Source: entities/persons/lua-de-bobo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Lua de Bobó
-- Generated: 2025-01-02
-- ============================================================
-- BIRTH YEAR: 1950 confirmed by Grupo Menino de Arembepe official website
-- and multiple secondary sources. Born in Arembepe, Camaçari, Bahia.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Edvaldo Borges da Cruz', 'Lua de Bobó', 'mestre'::genealogy.title, NULL,
  ARRAY['http://meninodearembepe.org/site/mestre.php', 'http://meninodearembepe.org/site/historico.php', 'https://www.capoeirahub.net/mestres/68a1e0020223926ddbeea95c-mestre-lua-de-bobo?lang=en']::text[],
  'angola'::genealogy.style,
  E'Pure Capoeira Angola tradition inherited from Mestre Bobô. Known for elegance and technical skill ("habilidade e elegância dos movimentos"), Lua developed a distinctive style while preserving his master''s fundamentals. His approach emphasizes posture, flow, and the holistic transmission of Angola philosophy to students.',
  E'Pura tradição de Capoeira Angola herdada de Mestre Bobô. Conhecido pela elegância e habilidade técnica ("habilidade e elegância dos movimentos"), Lua desenvolveu um estilo próprio enquanto preserva os fundamentos de seu mestre. Sua abordagem enfatiza postura, fluidez e a transmissão holística da filosofia Angola aos alunos.',
  1950, 'exact'::genealogy.date_precision, 'Arembepe, Camaçari, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Edvaldo Borges da Cruz, known as Mestre Lua de Bobó, was born in 1950 in Arembepe, a fishing village on Bahia''s northern coast. As a child, he moved with his mother Dona Maria Borges da Cruz to Salvador, settling in the Engomadeira neighborhood. Around age fifteen, his friend Bel introduced him to Mestre Bobô (Milton Santos), and young Edvaldo began training at the Academia de Capoeira Angola Cinco Estrelas.

For more than twenty years, Lua apprenticed under Bobô, training on packed earth ("em terra batida") in the backyard at Dique Pequeno do Tororó. Initially called "Olhar para Lua" (Look at the Moon), he eventually became known throughout Salvador''s capoeira community as Lua de Bobó—his name forever linked to his master.

On April 5, 1987, at the Clube Regatas Vasco da Gama on Dique do Tororó, Mestre Bobô formally graduated his first generation of mestres: Lua de Bobó and Môa do Katendê. The evaluation panel included legendary mestres João Grande, João Pequeno, Vermelho (27), and Dona Romélia (Mestre Pastinha''s wife). That same year, Lua founded the Grupo de Capoeira Angola Menino de Arembepe (GCAMA) and organized his first "Encontro de Capoeira Angola" at the Associação dos Pescadores Unidos de Arembepe, attracting illustrious Bahian capoeiristas including Bobô, João Pequeno, Virgílio, João Grande, Curió, and Pelé da Bomba.

In 1990, Lua made his first international trip, demonstrating capoeira in Atlanta, USA—the first of many journeys abroad. That same year, GCAMA began classes in Salvador at Clube Regatas Vasco da Gama, sharing the space with Mestre Bobô until 2001.

After Mestre Bobô''s death in 1994, Lua became one of the principal keepers of his lineage. In 2002, he returned permanently to Arembepe, teaching classes and hosting his annual January gathering—always near his birthday and the group''s anniversary. After years of struggle and with help from admirers, in January 2005 GCAMA inaugurated its headquarters on beachfront family land inherited from his parents. Located in front of Arembepe beach, the space became what his community describes as "um verdadeiro reduto angoleiro, uma fortaleza mágica construída pelo próprio Mestre" (a true angoleiro stronghold, a magical fortress built by the master himself).

Lua has transmitted his knowledge to three mestres: Eliseu Valverde in Salvador (no longer active), José de Almeida "Mestre Zequinha" of Escola Raiz de Angola in Piracicaba, SP, and his eldest son Erivaldo Borges da Cruz "Malhado," graduated at the 2015 annual gathering in Arembepe. His sons Eri and Ari have trained under him since childhood, participating in Mestre Bobô''s classes while Bobô was alive, and continue his work today.

GCAMA has expanded with núcleos in Curitiba, PR (2013, led by Nelma and Bel at Terreiro do Pai Maneco) and Rio Claro, SP (2014, led by Fábio and Junior). In 2002, Lua also accepted to guide the work of Carlinhos Ferraz, who now leads Capoeira Angola Resistência e Arte in Switzerland.

In 2010, Lua was among the qualified candidates for IPHAN''s "Prêmio Viva Meu Mestre" award, recognizing mestres aged 55 or older who have fundamentally contributed to capoeira''s transmission and continuity in Brazil. Today, Mestre Lua de Bobó remains one of the few living capoeiristas from Mestre Bobô''s Academia de Capoeira Angola Cinco Estrelas who still preserves and actively teaches the lineage left by his master.',
  E'Edvaldo Borges da Cruz, conhecido como Mestre Lua de Bobó, nasceu em 1950 em Arembepe, uma vila de pescadores no litoral norte da Bahia. Ainda criança, mudou-se com sua mãe Dona Maria Borges da Cruz para Salvador, estabelecendo-se no bairro da Engomadeira. Por volta dos quinze anos, seu amigo Bel o apresentou a Mestre Bobô (Milton Santos), e o jovem Edvaldo começou a treinar na Academia de Capoeira Angola Cinco Estrelas.

Por mais de vinte anos, Lua foi aprendiz de Bobô, treinando em terra batida no quintal do Dique Pequeno do Tororó. Inicialmente chamado de "Olhar para Lua", ele eventualmente se tornou conhecido em toda a comunidade de capoeira de Salvador como Lua de Bobó—seu nome para sempre ligado ao seu mestre.

Em 5 de abril de 1987, no Clube Regatas Vasco da Gama no Dique do Tororó, Mestre Bobô formou oficialmente sua primeira geração de mestres: Lua de Bobó e Môa do Katendê. A banca avaliadora incluía os lendários mestres João Grande, João Pequeno, Vermelho (27) e Dona Romélia (esposa de Mestre Pastinha). Naquele mesmo ano, Lua fundou o Grupo de Capoeira Angola Menino de Arembepe (GCAMA) e organizou seu primeiro "Encontro de Capoeira Angola" na Associação dos Pescadores Unidos de Arembepe, atraindo ilustres capoeiristas baianos incluindo Bobô, João Pequeno, Virgílio, João Grande, Curió e Pelé da Bomba.

Em 1990, Lua fez sua primeira viagem internacional, demonstrando capoeira em Atlanta, EUA—a primeira de muitas jornadas ao exterior. Naquele mesmo ano, o GCAMA iniciou aulas em Salvador no Clube Regatas Vasco da Gama, dividindo o espaço com Mestre Bobô até 2001.

Após a morte de Mestre Bobô em 1994, Lua se tornou um dos principais guardiões de sua linhagem. Em 2002, retornou definitivamente para Arembepe, ministrando aulas e realizando seu encontro anual de janeiro—sempre próximo ao seu aniversário e ao aniversário do grupo. Após anos de luta e com ajuda de admiradores, em janeiro de 2005 o GCAMA inaugurou sua sede em terreno à beira-mar da família, herdado de seus pais. Localizado em frente à praia de Arembepe, o espaço se tornou o que sua comunidade descreve como "um verdadeiro reduto angoleiro, uma fortaleza mágica construída pelo próprio Mestre".

Lua transmitiu seu conhecimento a três mestres: Eliseu Valverde em Salvador (não mais ativo), José de Almeida "Mestre Zequinha" da Escola Raiz de Angola em Piracicaba, SP, e seu filho mais velho Erivaldo Borges da Cruz "Malhado", formado no encontro anual de 2015 em Arembepe. Seus filhos Eri e Ari treinam com ele desde a infância, participando das aulas de Mestre Bobô enquanto ele era vivo, e continuam seu trabalho hoje.

O GCAMA expandiu com núcleos em Curitiba, PR (2013, liderado por Nelma e Bel no Terreiro do Pai Maneco) e Rio Claro, SP (2014, liderado por Fábio e Junior). Em 2002, Lua também aceitou orientar o trabalho de Carlinhos Ferraz, que agora lidera a Capoeira Angola Resistência e Arte na Suíça.

Em 2010, Lua estava entre os candidatos habilitados para o "Prêmio Viva Meu Mestre" do IPHAN, reconhecendo mestres com 55 anos ou mais que contribuíram fundamentalmente para a transmissão e continuidade da capoeira no Brasil. Hoje, Mestre Lua de Bobó permanece como um dos poucos capoeiristas vivos da Academia de Capoeira Angola Cinco Estrelas de Mestre Bobô que ainda preserva e ensina ativamente a linhagem deixada por seu mestre.',
  E'- Graduated Mestre by Mestre Bobô (April 5, 1987)
- First graduated mestre alongside Môa do Katendê (Bobô''s first generation)
- Founded Grupo de Capoeira Angola Menino de Arembepe (GCAMA, 1987)
- Organized 1º Encontro de Capoeira Angola at Arembepe (1987)
- First international trip to Atlanta, USA (1990)
- Inaugurated GCAMA beachfront headquarters in Arembepe (January 2005)
- Qualified for IPHAN Prêmio Viva Meu Mestre (2010)
- Graduated 3 mestres: Eliseu Valverde, Zequinha, Malhado
- Established núcleos in Curitiba (2013) and Rio Claro (2014)
- International teaching in USA, Europe, and guidance of groups worldwide',
  E'- Formado Mestre por Mestre Bobô (5 de abril de 1987)
- Primeiro mestre formado junto com Môa do Katendê (primeira geração de Bobô)
- Fundou Grupo de Capoeira Angola Menino de Arembepe (GCAMA, 1987)
- Organizou 1º Encontro de Capoeira Angola em Arembepe (1987)
- Primeira viagem internacional para Atlanta, EUA (1990)
- Inaugurou sede do GCAMA à beira-mar em Arembepe (janeiro de 2005)
- Habilitado para o Prêmio Viva Meu Mestre do IPHAN (2010)
- Formou 3 mestres: Eliseu Valverde, Zequinha, Malhado
- Estabeleceu núcleos em Curitiba (2013) e Rio Claro (2014)
- Ensino internacional nos EUA, Europa e orientação de grupos pelo mundo',
  E'BIRTH YEAR (1950, exact):
Confirmed by Grupo Menino de Arembepe official website (meninodearembepe.org/site/mestre.php) and CapoeiraHub.

NICKNAME ORIGIN:
Initially called "Olhar para Lua" (Look at the Moon). Over time, the Bahian capoeira community came to call him "Lua de Bobó"—linking his identity to his master.

TEACHERS:
- Mestre Bobô (Milton Santos), primary teacher, ~1965-1987, Academia de Capoeira Angola Cinco Estrelas, Dique do Tororó, Salvador

GRADUATION CEREMONY (April 5, 1987):
Graduated alongside Môa do Katendê as Bobô''s first mestres. Evaluation panel: João Grande, João Pequeno, Vermelho (27), Dona Romélia (Pastinha''s wife). Location: Clube Regatas Vasco da Gama, Dique do Tororó, Salvador.

STUDENTS (MESTRES GRADUATED):
- Eliseu Valverde (Salvador, no longer active) - date unknown
- José de Almeida "Mestre Zequinha" (Piracicaba, SP) - graduated by Lua 2002, also by Mestre Boca Rica 2001
- Erivaldo Borges da Cruz "Malhado" (son) - graduated January 2015 at Arembepe

FAMILY:
- Mother: Dona Maria Borges da Cruz (group''s godmother)
- Sons: Eri (Erivaldo, "Malhado") and Ari (Ariosvaldo Borges da Cruz)
- Both sons trained since childhood, participated in Bobô''s classes

INTERNATIONAL ACTIVITIES:
- 1990: First trip to Atlanta, USA
- 2002+: Guides Carlinhos Ferraz (now in Switzerland with Capoeira Angola Resistência e Arte)
- Regular international workshops (USA, Europe)

1ST ENCONTRO DE CAPOEIRA ANGOLA (1987):
At Associação dos Pescadores Unidos de Arembepe (president "Lió"). Attendees: Bobô, João Pequeno, Virgílio, João Grande, Curió, Pelé da Bomba, Dona Maria Romélia.

GROUP EXPANSION:
- 1990-2001: GCAMA at Clube Regatas Vasco da Gama, Salvador (shared with Bobô)
- 2002: Lua returns permanently to Arembepe
- 2005: HQ inaugurated on beachfront family land
- 2013: Curitiba núcleo (Nelma & Bel at Terreiro do Pai Maneco)
- 2014: Rio Claro núcleo (Fábio & Junior)

IPHAN RECOGNITION:
Qualified candidate for Prêmio Viva Meu Mestre 2010 (list #39, "Edvaldo Borges da Cruz, Salvador/BA").',
  E'ANO DE NASCIMENTO (1950, exato):
Confirmado pelo site oficial do Grupo Menino de Arembepe (meninodearembepe.org/site/mestre.php) e CapoeiraHub.

ORIGEM DO APELIDO:
Inicialmente chamado de "Olhar para Lua". Com o tempo, a comunidade de capoeira baiana passou a chamá-lo de "Lua de Bobó"—ligando sua identidade ao seu mestre.

MESTRES:
- Mestre Bobô (Milton Santos), professor principal, ~1965-1987, Academia de Capoeira Angola Cinco Estrelas, Dique do Tororó, Salvador

CERIMÔNIA DE FORMATURA (5 de abril de 1987):
Formado junto com Môa do Katendê como os primeiros mestres de Bobô. Banca avaliadora: João Grande, João Pequeno, Vermelho (27), Dona Romélia (esposa de Pastinha). Local: Clube Regatas Vasco da Gama, Dique do Tororó, Salvador.

ALUNOS (MESTRES FORMADOS):
- Eliseu Valverde (Salvador, não mais ativo) - data desconhecida
- José de Almeida "Mestre Zequinha" (Piracicaba, SP) - formado por Lua 2002, também por Mestre Boca Rica 2001
- Erivaldo Borges da Cruz "Malhado" (filho) - formado janeiro 2015 em Arembepe

FAMÍLIA:
- Mãe: Dona Maria Borges da Cruz (madrinha do grupo)
- Filhos: Eri (Erivaldo, "Malhado") e Ari (Ariosvaldo Borges da Cruz)
- Ambos os filhos treinaram desde a infância, participaram das aulas de Bobô

ATIVIDADES INTERNACIONAIS:
- 1990: Primeira viagem para Atlanta, EUA
- 2002+: Orienta Carlinhos Ferraz (agora na Suíça com Capoeira Angola Resistência e Arte)
- Oficinas internacionais regulares (EUA, Europa)

1º ENCONTRO DE CAPOEIRA ANGOLA (1987):
Na Associação dos Pescadores Unidos de Arembepe (presidente "Lió"). Participantes: Bobô, João Pequeno, Virgílio, João Grande, Curió, Pelé da Bomba, Dona Maria Romélia.

EXPANSÃO DO GRUPO:
- 1990-2001: GCAMA no Clube Regatas Vasco da Gama, Salvador (dividido com Bobô)
- 2002: Lua retorna definitivamente para Arembepe
- 2005: Sede inaugurada em terreno da família à beira-mar
- 2013: Núcleo de Curitiba (Nelma & Bel no Terreiro do Pai Maneco)
- 2014: Núcleo de Rio Claro (Fábio & Junior)

RECONHECIMENTO IPHAN:
Candidato habilitado para o Prêmio Viva Meu Mestre 2010 (lista #39, "Edvaldo Borges da Cruz, Salvador/BA").'
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

-- Source: entities/persons/lua-rasta.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Lua Rasta
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH DATE: July 28, 1950 (multiple sources confirm)
-- NOTE: mapadacapoeira.com.br lists birth date as November 25, 1925
-- which is clearly erroneous - he began training with Bimba in 1968
-- at age 18, which confirms 1950 birth year.
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
  'Gilson Fernandes',
  'Lua Rasta',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://artesanatodabahia.com.br/artesaos/mestre-lua-rasta/', 'https://www.last.fm/music/Mestre+Lua+Rasta/+wiki']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Lua Rasta embodies the irreverence and theatrical spirit inherited from Mestre Canjiquinha. His capoeira is art - a space for renovations, surprises, and unexpected performances. While trained in Regional under Bimba and Angola under Canjiquinha, he identifies primarily with street Capoeira Angola. Known for traditional songs, improvised musical instruments, and harmonic touches in the roda. Leads the Bando Anunciador - a traditional street procession that announces capoeira rodas through Pelourinho.',
  E'Lua Rasta incorpora a irreverência e o espírito teatral herdados de Mestre Canjiquinha. Sua capoeira é arte - um espaço para renovações, surpresas e performances inesperadas. Embora treinado em Regional com Bimba e Angola com Canjiquinha, ele se identifica principalmente com a Capoeira Angola de rua. Conhecido por cantigas tradicionais, instrumentos musicais improvisados e toques harmônicos na roda. Lidera o Bando Anunciador - uma procissão tradicional de rua que anuncia rodas de capoeira pelo Pelourinho.',
  -- Life dates
  1950,
  'exact'::genealogy.date_precision,
  'Macaúbas, Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Gilson Fernandes, known as Mestre Lua Rasta, was born on July 28, 1950, in Macaúbas, a neighborhood of Salvador, Bahia. He is a capoeira master, musician, craftsman, and internationally recognized researcher of Afro-Brazilian percussion instruments.

In 1968, at age eighteen, Lua Rasta began his apprenticeship in capoeira with Mestre Bimba, the legendary founder of Capoeira Regional. After one year with Bimba, in 1969 he transferred to the academy of Mestre Canjiquinha, joining the folkloric group Aberrê. Under Canjiquinha''s guidance, he developed capoeira as a theatrical language, participating in many street rodas and joining capoeiristas from around the world.

In 1970, Lua Rasta joined Grupo Viva Bahia, the pioneering folkloric group coordinated by ethnomusicologist Emília Biancardi. Through this group, which toured internationally presenting Afro-Brazilian culture, he performed alongside mestres like João Grande, Jelon Vieira, Acordeon, Preguiça, and Suassuna. During the 1970s, he was responsible for maintaining atabaques for performances of Biancardi''s theater group. It was then that he learned to "encourar" - the art of placing and stretching leather with cords on atabaques - from the famous musician, carnival figure, and artisan Nelson Maleiro.

At around twenty years old, Lua Rasta lived in Geneva, Switzerland, where he began to earn a living from capoeira: building instruments, performing, and teaching. In 1975, he moved to Rio de Janeiro, developing alternative activities in street capoeira and popular theater. From 1981 to 1984, he lived in Europe, opening doors in many countries for the penetration of capoeira and Brazilian popular culture. He traveled to countries in Africa and Asia, conducting musical research that greatly influenced his crafts and the creation of his instruments.

Upon returning to Bahia, Lua Rasta created the Ateliê Percussivo, a center of reference for the manufacture, dissemination, and research of Afro-Brazilian instruments, located at Rua da Ordem Terceira, 3, in Pelourinho. The workshop produces pandeiros, berimbaus, atabaques, caxixis, xequerês, and other percussion instruments, using materials like wood, leather, seeds, cords, and metals. His pyrographed decorations have become the signature of his handcrafted instruments, sought by specialists worldwide.

From 1990, Lua Rasta began intensive work conducting special training workshops and lectures on capoeira and percussion throughout Brazil and the world. He also devotes special attention to the Bando Anunciador - a traditional street procession that goes through the streets of Pelourinho announcing that the roda is about to begin. The procession leads to his famous Friday night roda at the Terreiro de Jesus, in Salvador''s historic center - a gathering where capoeiristas of all lineages pass through, including Mouringue practitioners from Reunion Islands.

He played a pivotal role in reviving his friend Mestre Bigodinho. In the early 1970s, Bigodinho had left capoeira due to repression and discrimination. In 1997, Lua Rasta encouraged his return to active participation. In 2007, together with Mestre Ivan de Santo Amaro, he organized the "Tributo a Mestre Bigodinho" - a three-day celebration in Salvador and Santo Amaro that transformed the streets of Bigodinho''s childhood home in Acupe into a festive open-air celebration, with capoeiristas of all lineages honoring the veteran mestre.

In May 2021, Lua Rasta received the title of Mestre Artesão (Master Artisan) from the State Government of Bahia, becoming, alongside Mestre Olavo, one of the first master artisans of capoeira recognized in Brazil. This recognition came through an initiative of the Coordenação de Fomento ao Artesanato of the Secretaria do Trabalho, Emprego, Renda e Esporte (Setre).

He has recorded CDs including "Roda Do Terreiro" and "Andar com Lua", and music with the Bando Anunciador. Canjiquinha''s legacy lives through him: "Capoeira has no creed, no color, no flag - it belongs to the people, it will travel the world".',
  -- bio_pt
  E'Gilson Fernandes, conhecido como Mestre Lua Rasta, nasceu em 28 de julho de 1950, em Macaúbas, bairro de Salvador, Bahia. É mestre de capoeira, músico, artesão e pesquisador de instrumentos de percussão afro-brasileiros reconhecido internacionalmente.

Em 1968, aos dezoito anos, Lua Rasta iniciou seu aprendizado na capoeira com Mestre Bimba, o lendário fundador da Capoeira Regional. Após um ano com Bimba, em 1969 transferiu-se para a academia de Mestre Canjiquinha, integrando o grupo folclórico Aberrê. Sob a orientação de Canjiquinha, desenvolveu a capoeira como linguagem teatral, participando de muitas rodas de rua e se juntando a capoeiristas de todo o mundo.

Em 1970, Lua Rasta juntou-se ao Grupo Viva Bahia, o pioneiro grupo folclórico coordenado pela etnomusicóloga Emília Biancardi. Através deste grupo, que excursionava internacionalmente apresentando a cultura afro-brasileira, ele se apresentou ao lado de mestres como João Grande, Jelon Vieira, Acordeon, Preguiça e Suassuna. Durante os anos 1970, era responsável pela manutenção dos atabaques para apresentações do grupo de teatro de Biancardi. Foi então que aprendeu a "encourar" - a arte de colocar e esticar o couro com cordas nos atabaques - com o famoso músico, carnavalesco e artesão Nelson Maleiro.

Com cerca de vinte anos, Lua Rasta morou em Genebra, Suíça, onde passou a viver da capoeira: construindo instrumentos, fazendo apresentações e dando aulas. Em 1975, mudou-se para o Rio de Janeiro, desenvolvendo atividades alternativas na capoeira de rua e no teatro popular. De 1981 a 1984, morou na Europa, abrindo portas em muitos países para a penetração da capoeira e da cultura popular brasileira. Viajou para países da África e Ásia, conduzindo pesquisa musical que influenciou grandemente seus artesanatos e a criação de seus instrumentos.

Ao retornar à Bahia, Lua Rasta criou o Ateliê Percussivo, um centro de referência para a fabricação, divulgação e pesquisa de instrumentos afro-brasileiros, localizado na Rua da Ordem Terceira, 3, no Pelourinho. A oficina produz pandeiros, berimbaus, atabaques, caxixis, xequerês e outros instrumentos de percussão, utilizando materiais como madeiras, couro, sementes, cordas e metais. Suas decorações pirografadas tornaram-se a marca registrada de seus instrumentos artesanais, procurados por especialistas do mundo todo.

A partir de 1990, Lua Rasta começou um trabalho intensivo conduzindo oficinas especiais de treinamento e palestras sobre capoeira e percussão pelo Brasil e pelo mundo. Ele também dedica atenção especial ao Bando Anunciador - uma procissão tradicional de rua que percorre as ruas do Pelourinho anunciando que a roda está prestes a começar. A procissão leva à sua famosa roda de sexta-feira à noite no Terreiro de Jesus, no centro histórico de Salvador - um encontro por onde passam capoeiristas de todas as linhagens, incluindo praticantes de Mouringue das Ilhas Reunião.

Ele desempenhou papel fundamental no ressurgimento de seu amigo Mestre Bigodinho. No início dos anos 1970, Bigodinho havia deixado a capoeira devido à repressão e discriminação. Em 1997, Lua Rasta incentivou seu retorno à participação ativa. Em 2007, junto com Mestre Ivan de Santo Amaro, organizou o "Tributo a Mestre Bigodinho" - uma celebração de três dias em Salvador e Santo Amaro que transformou as ruas do lar de infância de Bigodinho em Acupe em uma celebração festiva a céu aberto, com capoeiristas de todas as linhagens homenageando o veterano mestre.

Em maio de 2021, Lua Rasta recebeu o título de Mestre Artesão do Governo do Estado da Bahia, tornando-se, ao lado de Mestre Olavo, um dos primeiros mestres artesãos da capoeira reconhecidos no Brasil. Esse reconhecimento veio através de uma iniciativa da Coordenação de Fomento ao Artesanato da Secretaria do Trabalho, Emprego, Renda e Esporte (Setre).

Ele gravou CDs incluindo "Roda Do Terreiro" e "Andar com Lua", e música com o Bando Anunciador. O legado de Canjiquinha vive através dele: "A capoeira não tem credo, não tem cor, não tem bandeira - ela pertence ao povo, ela vai correr o mundo".',
  -- achievements_en
  E'Trained under Mestre Bimba (1968) and Mestre Canjiquinha (1969-onwards)
Participated in Grupo Viva Bahia (1970) touring internationally with Emília Biancardi
Lived in Geneva, earning living from capoeira (~1970)
Moved to Rio de Janeiro for street capoeira and theater (1975)
Lived in Europe promoting capoeira (1981-1984)
Traveled Africa and Asia for musical research
Founded Ateliê Percussivo in Pelourinho - world reference for Afro-Brazilian instrument manufacture
Encouraged Mestre Bigodinho''s return to capoeira (1997)
Co-organized "Tributo a Mestre Bigodinho" (August 2008) with Mestre Ivan de Santo Amaro
Leads weekly Friday night roda at Terreiro de Jesus with Bando Anunciador procession
Received title of Mestre Artesão from Bahia State Government (May 2021) - first capoeira artisan so recognized
Recorded CDs: "Roda Do Terreiro", "Andar com Lua"',
  -- achievements_pt
  E'Treinou sob Mestre Bimba (1968) e Mestre Canjiquinha (1969 em diante)
Participou do Grupo Viva Bahia (1970) excursionando internacionalmente com Emília Biancardi
Morou em Genebra, vivendo da capoeira (~1970)
Mudou-se para o Rio de Janeiro para capoeira de rua e teatro (1975)
Morou na Europa promovendo a capoeira (1981-1984)
Viajou pela África e Ásia para pesquisa musical
Fundou o Ateliê Percussivo no Pelourinho - referência mundial na fabricação de instrumentos afro-brasileiros
Incentivou o retorno de Mestre Bigodinho à capoeira (1997)
Co-organizou o "Tributo a Mestre Bigodinho" (agosto de 2008) com Mestre Ivan de Santo Amaro
Lidera a roda semanal de sexta-feira à noite no Terreiro de Jesus com a procissão do Bando Anunciador
Recebeu título de Mestre Artesão do Governo do Estado da Bahia (maio de 2021) - primeiro artesão de capoeira assim reconhecido
Gravou CDs: "Roda Do Terreiro", "Andar com Lua"',
  -- Researcher notes (English)
  E'LIFE DATES:
Birth: July 28, 1950 (confirmed by artesanatodabahia.com.br, last.fm, multiple sources)
Death: Living (as of 2021 when received Mestre Artesão title)

BIRTH PLACE DISCREPANCY:
- Primary sources: Macaúbas, Salvador, Bahia (last.fm, artesanatodabahia)
- Alternative sources: "Salvador" only - Macaúbas is a neighborhood/district of Salvador

BIRTH DATE DISCREPANCY:
- mapadacapoeira.com.br lists "November 25, 1925" - clearly erroneous
- Training with Bimba in 1968 at age ~18 confirms 1950 birth year
- The 1925 date would make him 43 years old when starting capoeira (unlikely)
- Using 1950 as confirmed by majority of reliable sources

TEACHERS:
- Mestre Bimba (Manuel dos Reis Machado) - 1 year training (1968)
- Mestre Canjiquinha (Washington Bruno da Silva) - primary mentor (1969-onwards)

CONTEMPORARIES AT CANJIQUINHA''S ACADEMY:
- Mestre Paulo dos Anjos (José Paulo dos Anjos)
- Mestre Brasília (Antônio Cardoso Andrade)
- Mestre Geni (José Serafim Ferreira Junior)

GRUPO VIVA BAHIA (1970):
- Coordinated by Emília Biancardi
- Fellow members included: João Grande, Jelon Vieira, Acordeon, Preguiça, Suassuna
- First to bring capoeira to Europe and USA through dance company

NELSON MALEIRO:
- Famous musician, carnival figure, and artisan
- Taught Lua Rasta to "encourar" (leather stretching technique for atabaques)
- This skill became foundation of his instrument-making career

ATELIÊ PERCUSSIVO:
- Address: Rua da Ordem Terceira, 3, Pelourinho, Salvador, BA (CEP: 40026-260)
- Contact: (71) 99372-6205 / 99396-6697
- Email: atelierlua@hotmail.com
- Services: Handcrafted Afro-Brazilian percussion instruments
- Also offers accommodation (3 rooms with bunk beds)
- Operating hours: Mon-Fri 9:00 AM - 7:00 PM

BANDO ANUNCIADOR DA CAPOEIRA ANGOLA DE RUA:
- Traditional street procession led by Lua Rasta
- Goes through Pelourinho announcing roda is about to begin
- Leads to Friday night roda at Terreiro de Jesus
- Same address as Ateliê Percussivo

BIGODINHO REVIVAL:
- Bigodinho left capoeira ~1970 due to repression/discrimination
- 1997: Lua Rasta encouraged his return
- 2007: Organized "Tributo a Mestre Bigodinho" in Acupe with Mestre Ivan de Santo Amaro

MESTRE ARTESÃO TITLE (May 2021):
- First capoeira master artisans recognized in Brazil
- Awarded alongside Mestre Olavo (berimbau maker, student of Mestre Waldemar)
- Ceremony at Centro de Comercialização Artesanato da Bahia
- Initiative of Coordenação de Fomento ao Artesanato of Setre

RECORDINGS:
- CD "Roda Do Terreiro" (46 minutes)
- CD "Andar com Lua"
- Music with Bando Anunciador

ASSOCIATIONS TO IMPORT:
- Mestre Olavo (berimbau maker, student of Waldemar) - NOT in database
- Mestre Ivan de Santo Amaro (ACANA) - NOT in database
- Nelson Maleiro (musician/artisan) - NOT in database (not capoeirista)
- Bando Anunciador - NOT in database (group)
- Ateliê Percussivo - workshop/organization, consider for groups
- Viva Bahia - in groups backlog (pending)
- Grupo Aberrê - in groups backlog as "Conjunto Folclórico Aberrê"',
  -- Researcher notes (Portuguese)
  E'DATAS DE VIDA:
Nascimento: 28 de julho de 1950 (confirmado por artesanatodabahia.com.br, last.fm, múltiplas fontes)
Morte: Vivo (até 2021 quando recebeu título de Mestre Artesão)

DISCREPÂNCIA DO LOCAL DE NASCIMENTO:
- Fontes primárias: Macaúbas, Salvador, Bahia (last.fm, artesanatodabahia)
- Fontes alternativas: "Salvador" apenas - Macaúbas é um bairro/distrito de Salvador

DISCREPÂNCIA DA DATA DE NASCIMENTO:
- mapadacapoeira.com.br lista "25 de novembro de 1925" - claramente errôneo
- Treinamento com Bimba em 1968 aos ~18 anos confirma ano de nascimento 1950
- A data de 1925 o tornaria 43 anos ao começar capoeira (improvável)
- Usando 1950 conforme confirmado pela maioria das fontes confiáveis

MESTRES:
- Mestre Bimba (Manuel dos Reis Machado) - 1 ano de treinamento (1968)
- Mestre Canjiquinha (Washington Bruno da Silva) - mentor principal (1969 em diante)

CONTEMPORÂNEOS NA ACADEMIA DE CANJIQUINHA:
- Mestre Paulo dos Anjos (José Paulo dos Anjos)
- Mestre Brasília (Antônio Cardoso Andrade)
- Mestre Geni (José Serafim Ferreira Junior)

GRUPO VIVA BAHIA (1970):
- Coordenado por Emília Biancardi
- Colegas incluíam: João Grande, Jelon Vieira, Acordeon, Preguiça, Suassuna
- Primeiro a levar capoeira para Europa e EUA através de companhia de dança

NELSON MALEIRO:
- Famoso músico, carnavalesco e artesão
- Ensinou Lua Rasta a "encourar" (técnica de esticar couro para atabaques)
- Esta habilidade tornou-se a base de sua carreira de fabricação de instrumentos

ATELIÊ PERCUSSIVO:
- Endereço: Rua da Ordem Terceira, 3, Pelourinho, Salvador, BA (CEP: 40026-260)
- Contato: (71) 99372-6205 / 99396-6697
- Email: atelierlua@hotmail.com
- Serviços: Instrumentos de percussão afro-brasileiros artesanais
- Também oferece hospedagem (3 quartos com beliches)
- Horário: Seg-Sex 9:00 - 19:00

BANDO ANUNCIADOR DA CAPOEIRA ANGOLA DE RUA:
- Procissão tradicional de rua liderada por Lua Rasta
- Percorre o Pelourinho anunciando que a roda vai começar
- Leva à roda de sexta-feira à noite no Terreiro de Jesus
- Mesmo endereço do Ateliê Percussivo

RETORNO DE BIGODINHO:
- Bigodinho deixou a capoeira ~1970 devido à repressão/discriminação
- 1997: Lua Rasta incentivou seu retorno
- 2007: Organizou "Tributo a Mestre Bigodinho" em Acupe com Mestre Ivan de Santo Amaro

TÍTULO DE MESTRE ARTESÃO (maio de 2021):
- Primeiros mestres artesãos de capoeira reconhecidos no Brasil
- Premiado ao lado de Mestre Olavo (fabricante de berimbau, aluno de Mestre Waldemar)
- Cerimônia no Centro de Comercialização Artesanato da Bahia
- Iniciativa da Coordenação de Fomento ao Artesanato da Setre

GRAVAÇÕES:
- CD "Roda Do Terreiro" (46 minutos)
- CD "Andar com Lua"
- Música com Bando Anunciador

ASSOCIAÇÕES PARA IMPORTAR:
- Mestre Olavo (fabricante de berimbau, aluno de Waldemar) - NÃO está no banco de dados
- Mestre Ivan de Santo Amaro (ACANA) - NÃO está no banco de dados
- Nelson Maleiro (músico/artesão) - NÃO está no banco de dados (não é capoeirista)
- Bando Anunciador - NÃO está no banco de dados (grupo)
- Ateliê Percussivo - oficina/organização, considerar para grupos
- Viva Bahia - no backlog de grupos (pendente)
- Grupo Aberrê - no backlog de grupos como "Conjunto Folclórico Aberrê"'
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

-- Source: entities/persons/maita.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Maitá
-- Generated: 2026-01-03
-- ============================================================
-- Profile Type: proto_mestre
-- Era: Late 19th - early 20th century
--
-- BIRTH YEAR ESTIMATION (~1880, decade):
-- - Cobrinha Verde (b. 1912) learned from him after Besouro's death (1924)
-- - Maitá was already an established capoeirista/teacher in Santo Amaro
-- - Capoeira teachers typically active in their 30s-40s
-- - If teaching in mid-1920s at age 40-45, born ~1880
--
-- SOURCE: Mestre Cobrinha Verde's autobiographical testimony:
-- "I learned from many mestres in Santo Amaro. I will give their names
-- one by one: Maitá (who even had a samba song named after him), Licurí,
-- Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião,
-- Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."
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
  'Maitá',
  NULL,
  NULL,
  ARRAY['https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/', 'https://capoeira.online/history/mestres/cobrinha-verde/', 'https://www.lalaue.com/learn-capoeira/mestre-cobrinha-verde']::text[],
  NULL,
  NULL,
  NULL,
  1880, 'decade'::genealogy.date_precision, 'Santo Amaro da Purificação, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Maitá was one of the famous capoeiristas of Santo Amaro da Purificação in the Recôncavo Baiano during the late nineteenth and early twentieth centuries. He was notable enough to have a samba song composed in his honor—a rare distinction that speaks to his cultural significance beyond just the roda.\n\nHis fame comes to us primarily through the testimony of Mestre Cobrinha Verde, who listed Maitá first among the many mestres from whom he learned after Besouro Mangangá''s death in 1924. In his autobiography, Cobrinha Verde stated: "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nThat Cobrinha Verde placed Maitá first in this list and immediately noted the samba song suggests Maitá held a special status in the Santo Amaro capoeira community. The existence of a samba de roda honoring him indicates he was a figure of considerable local renown—samba de roda being the traditional music of the Recôncavo Baiano that shares deep roots with capoeira.\n\nSanto Amaro da Purificação is historically recognized as "the birthplace of Bahian capoeira," in Cobrinha Verde''s own words, and Maitá was part of the generation that made it so. He belonged to an era when capoeira was practiced informally in streets, docks, and festivals, before the establishment of formal academies. These proto-mestres passed down the art through lived experience rather than structured curriculum, training the next generation amid police persecution and the daily struggle of working-class life in the Recôncavo.\n\nNothing more is currently known about Maitá—his full name, his profession, his life story, or the lyrics of the samba that bore his name have not survived in documented sources. He remains one of the shadowy figures of capoeira''s oral history: known to have existed, known to have been important, but preserved only in the memory of those who came after.',
  E'Maitá foi um dos famosos capoeiristas de Santo Amaro da Purificação no Recôncavo Baiano durante o final do século XIX e início do século XX. Ele foi notável o suficiente para ter um samba composto em sua homenagem—uma distinção rara que fala de sua importância cultural além da roda.\n\nSua fama chega até nós principalmente através do testemunho de Mestre Cobrinha Verde, que listou Maitá primeiro entre os muitos mestres com quem aprendeu após a morte de Besouro Mangangá em 1924. Em sua autobiografia, Cobrinha Verde declarou: "Aprendi com muitos mestres em Santo Amaro. Vou dar seus nomes um por um: Maitá (que até tinha um samba com nome dele), Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."\n\nO fato de Cobrinha Verde ter colocado Maitá primeiro nesta lista e imediatamente mencionado o samba sugere que Maitá ocupava um status especial na comunidade de capoeira de Santo Amaro. A existência de um samba de roda homenageando-o indica que ele era uma figura de considerável renome local—o samba de roda sendo a música tradicional do Recôncavo Baiano que compartilha raízes profundas com a capoeira.\n\nSanto Amaro da Purificação é historicamente reconhecida como "o berço da capoeira baiana", nas próprias palavras de Cobrinha Verde, e Maitá fez parte da geração que a tornou assim. Ele pertenceu a uma era em que a capoeira era praticada informalmente nas ruas, docas e festas, antes do estabelecimento de academias formais. Esses proto-mestres passavam a arte através da experiência vivida em vez de currículo estruturado, treinando a próxima geração em meio à perseguição policial e à luta diária da vida da classe trabalhadora no Recôncavo.\n\nNada mais se sabe atualmente sobre Maitá—seu nome completo, sua profissão, sua história de vida, ou a letra do samba que levava seu nome não sobreviveram em fontes documentadas. Ele permanece uma das figuras obscuras da história oral da capoeira: sabidamente existiu, sabidamente foi importante, mas preservado apenas na memória daqueles que vieram depois.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1880, decade):\nCobrinha Verde (b. 1912) learned from Maitá after Besouro''s death in 1924, when Cobrinha was about 12 years old. Maitá was already an established teacher at this time. Capoeira teachers were typically active in their 30s-40s, so if teaching in the mid-1920s at age 40-45, he was likely born around 1880.\n\nTEACHERS:\n- Unknown; predates documented lineage records\n\nSTUDENTS:\n- Cobrinha Verde (Rafael Alves França, trained after 1924, Santo Amaro)\n\nMEDIA APPEARANCES:\n- Samba song named after him (title/composer unknown; mentioned by Cobrinha Verde)\n\nCONTEMPORARIES (Santo Amaro proto-mestres):\n- Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo\n\nNOTES:\n- Title is NULL because formal mestre titles did not exist in the modern sense during his era\n- Style is NULL because the Angola/Regional distinction came later\n- Listed first among Cobrinha Verde''s Santo Amaro teachers, suggesting special status\n- The samba song indicates cultural significance in the samba de roda tradition of the Recôncavo',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1880, década):\nCobrinha Verde (n. 1912) aprendeu com Maitá após a morte de Besouro em 1924, quando Cobrinha tinha cerca de 12 anos. Maitá já era um professor estabelecido neste momento. Mestres de capoeira geralmente ensinavam entre 30-45 anos, então se ensinava em meados dos anos 1920 com 40-45 anos, provavelmente nasceu por volta de 1880.\n\nPROFESSORES:\n- Desconhecido; antecede registros de linhagem documentados\n\nALUNOS:\n- Cobrinha Verde (Rafael Alves França, treinou após 1924, Santo Amaro)\n\nAPARIÇÕES NA MÍDIA:\n- Samba com seu nome (título/compositor desconhecido; mencionado por Cobrinha Verde)\n\nCONTEMPORÂNEOS (proto-mestres de Santo Amaro):\n- Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo\n\nNOTAS:\n- Título é NULL porque títulos formais de mestre não existiam no sentido moderno durante sua era\n- Estilo é NULL porque a distinção Angola/Regional veio depois\n- Listado primeiro entre os professores de Cobrinha Verde em Santo Amaro, sugerindo status especial\n- O samba indica significado cultural na tradição do samba de roda do Recôncavo'
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

-- Source: entities/persons/major-doria.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Major Dória
-- Generated: 2026-01-02
-- ============================================================
-- Major Dória (Carlos Dória) was NOT a capoeirista himself, but a
-- patron/founder who established the first formal capoeira academy
-- in Itabuna in 1958. He is included in the genealogy database
-- because of his critical role in enabling capoeira transmission
-- in southern Bahia. The academy he founded trained Suassuna,
-- Medicina, and other important figures.
--
-- "Major" likely indicates military rank (Brazilian Army Major).
-- He established a multi-sport center that included judô, karatê,
-- and capoeira, with classes taught by Mestre Maneca Brandão
-- (student of Bimba) and assisted by Mestre Zoião.
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
  'Carlos Dória',
  'Major Dória',
  NULL, -- NOT a capoeirista - no title
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/publicacoes-e-artigos/itabuna-lancamento-do-livro-capoeira-de-luta-de-negro-a-exercicio-de-branco-no-cenario-grapiuna/', 'https://viaeditora.com.br/acervo-literario/capoeira-de-luta-de-negro-a-exercicio-de-branco/']::text[],
  -- Capoeira-specific
  NULL, -- NOT a capoeirista - no style
  NULL,
  NULL,
  -- Life dates
  NULL, -- Birth year unknown
  NULL,
  NULL, -- Birth place unknown
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Major Carlos Dória was a patron and founder whose vision brought formal capoeira instruction to Itabuna, in the southern cacao-producing region of Bahia. Though not a capoeirista himself, his establishment of the Academia Cultura Física e Capoeira Major Dória in 1958 created the institutional foundation that would train several figures who became important in capoeira history.

The title "Major" likely indicates his rank in the Brazilian military. In 1958, Major Dória established a sports center in Itabuna that offered various martial arts and physical culture activities, including judô, karatê, and capoeira. According to Mestre Suassuna, the building for this academy was provided by Amélia Prado—a woman connected to the family of renowned Bahian writer Jorge Amado.

To teach capoeira at his academy, Major Dória recruited Mestre Maneca Brandão, a formado of Mestre Bimba who had trained at the Centro de Cultura Física Regional in Salvador. Maneca Brandão was the son of Ubaldino Brandão, a former mayor of Itabuna, which may explain the connection that brought him to teach at Major Dória''s establishment. Mestre Zoião, Maneca Brandão''s classmate from Bimba''s academy, sometimes assisted with training sessions.

The academy became the training ground for young Reinaldo Ramos Suassuna—who would later become Mestre Suassuna, co-founder of Cordão de Ouro and creator of Miudinho. Luís Oliveira Rocha (later Mestre Medicina, founder of Grupo Raça) also trained there. Through these students and others, Major Dória''s academy played a role in transmitting Mestre Bimba''s methodology to the cocoa region of southern Bahia.

Major Dória represents a category of non-practitioners who nonetheless proved important to capoeira''s development: patrons who provided infrastructure, legitimacy, and resources that enabled mestres to teach and students to learn in formal settings during an era when capoeira was still finding its way from street practice to recognized cultural activity.',
  -- bio_pt
  E'Major Carlos Dória foi um patrono e fundador cuja visão trouxe o ensino formal de capoeira para Itabuna, na região cacaueira do sul da Bahia. Embora não fosse capoeirista, a fundação da Academia Cultura Física e Capoeira Major Dória em 1958 criou a base institucional que formaria várias figuras importantes na história da capoeira.

O título "Major" provavelmente indica sua patente no Exército Brasileiro. Em 1958, Major Dória estabeleceu um centro esportivo em Itabuna que oferecia várias artes marciais e atividades de cultura física, incluindo judô, karatê e capoeira. Segundo Mestre Suassuna, o prédio para esta academia foi cedido por Amélia Prado—uma mulher ligada à família do renomado escritor baiano Jorge Amado.

Para ensinar capoeira em sua academia, Major Dória recrutou Mestre Maneca Brandão, um formado de Mestre Bimba que havia treinado no Centro de Cultura Física Regional em Salvador. Maneca Brandão era filho de Ubaldino Brandão, um ex-prefeito de Itabuna, o que pode explicar a conexão que o trouxe para ensinar no estabelecimento do Major Dória. Mestre Zoião, colega de turma de Maneca Brandão na academia de Bimba, às vezes auxiliava nos treinamentos.

A academia se tornou o local de treinamento do jovem Reinaldo Ramos Suassuna—que mais tarde se tornaria Mestre Suassuna, cofundador do Cordão de Ouro e criador do Miudinho. Luís Oliveira Rocha (posteriormente Mestre Medicina, fundador do Grupo Raça) também treinou lá. Através desses alunos e outros, a academia do Major Dória desempenhou um papel na transmissão da metodologia de Mestre Bimba para a região cacaueira do sul da Bahia.

Major Dória representa uma categoria de não-praticantes que, no entanto, se mostraram importantes para o desenvolvimento da capoeira: patronos que forneceram infraestrutura, legitimidade e recursos que permitiram aos mestres ensinar e aos alunos aprender em ambientes formais durante uma era em que a capoeira ainda estava encontrando seu caminho da prática de rua para atividade cultural reconhecida.',
  -- achievements_en
  E'Founded Academia Cultura Física e Capoeira Major Dória in Itabuna (1958)—first formal capoeira academy in the city
Recruited Mestre Maneca Brandão (student of Bimba) to teach capoeira in southern Bahia
Provided institutional setting that trained Mestre Suassuna and Mestre Medicina
Helped bring Capoeira Regional methodology from Salvador to the grapiúna (cocoa) region',
  -- achievements_pt
  E'Fundou a Academia Cultura Física e Capoeira Major Dória em Itabuna (1958)—primeira academia formal de capoeira da cidade
Recrutou Mestre Maneca Brandão (aluno de Bimba) para ensinar capoeira no sul da Bahia
Forneceu ambiente institucional que formou Mestre Suassuna e Mestre Medicina
Ajudou a trazer a metodologia da Capoeira Regional de Salvador para a região grapiúna (cacau)',
  -- notes_en
  E'NOT A CAPOEIRISTA:
Major Dória was a patron/founder, not a practitioner. He established the infrastructure and recruited instructors but did not practice or teach capoeira himself. Imported to genealogy database for his role in capoeira transmission infrastructure.

MILITARY RANK:
"Major" likely indicates Brazilian Army rank. No documentation found on his military career or unit.

ACADEMY DETAILS:
- Name: Academia Cultura Física e Capoeira Major Dória
- Founded: 1958
- Location: Itabuna, Bahia
- Activities: Judô, Karatê, Capoeira, and other physical culture
- Primary capoeira instructor: Mestre Maneca Brandão
- Assistant instructor: Mestre Zoião (sometimes)
- Building provided by: Amélia Prado (connected to Jorge Amado''s family per Suassuna)

STUDENTS TRAINED:
- Suassuna (Reinaldo Ramos Suassuna) - later co-founder of Cordão de Ouro
- Medicina (Luís Oliveira Rocha) - later founder of Grupo Raça

HISTORICAL CONTEXT:
Before Major Dória''s academy, capoeira in Itabuna was practiced in the streets by marginalized angoleiros. According to researcher Cláudia Viana''s book "Capoeira: De luta de negro a exercício de branco no cenário grapiúna", the 1950s-60s saw a transformation from street capoeira to institutionalized practice, and Major Dória''s academy was part of this transition.

SOURCES:
- Portal Capoeira article on Cláudia Viana''s book launch
- Via Editora book listing for Viana''s "Capoeira: De luta de negro a exercício de branco"
- Suassuna biography (4capoeirathoughts.wordpress.com)
- CDO Sergipe Mestre Suassuna page
- Grupo Raça Mestre Medicina page
- Cordão de Ouro official history',
  -- notes_pt
  E'NÃO É CAPOEIRISTA:
Major Dória foi um patrono/fundador, não um praticante. Ele estabeleceu a infraestrutura e recrutou instrutores mas não praticava nem ensinava capoeira. Importado para o banco de dados de genealogia por seu papel na infraestrutura de transmissão da capoeira.

PATENTE MILITAR:
"Major" provavelmente indica patente do Exército Brasileiro. Nenhuma documentação encontrada sobre sua carreira militar ou unidade.

DETALHES DA ACADEMIA:
- Nome: Academia Cultura Física e Capoeira Major Dória
- Fundação: 1958
- Local: Itabuna, Bahia
- Atividades: Judô, Karatê, Capoeira e outras atividades de cultura física
- Instrutor principal de capoeira: Mestre Maneca Brandão
- Instrutor assistente: Mestre Zoião (às vezes)
- Prédio cedido por: Amélia Prado (ligada à família de Jorge Amado segundo Suassuna)

ALUNOS FORMADOS:
- Suassuna (Reinaldo Ramos Suassuna) - posteriormente cofundador do Cordão de Ouro
- Medicina (Luís Oliveira Rocha) - posteriormente fundador do Grupo Raça

CONTEXTO HISTÓRICO:
Antes da academia do Major Dória, a capoeira em Itabuna era praticada nas ruas por angoleiros marginalizados. Segundo o livro "Capoeira: De luta de negro a exercício de branco no cenário grapiúna" da pesquisadora Cláudia Viana, os anos 1950-60 viram uma transformação da capoeira de rua para prática institucionalizada, e a academia do Major Dória fez parte desta transição.

FONTES:
- Artigo do Portal Capoeira sobre lançamento do livro de Cláudia Viana
- Listagem do livro na Via Editora para "Capoeira: De luta de negro a exercício de branco" de Viana
- Biografia de Suassuna (4capoeirathoughts.wordpress.com)
- Página de Mestre Suassuna no CDO Sergipe
- Página de Mestre Medicina no Grupo Raça
- História oficial do Cordão de Ouro'
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

-- Source: entities/persons/messias.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Messias
-- Generated: 2025-01-02
-- ============================================================
-- BIRTH YEAR: August 6, 1927 (exact)
-- Confirmed by multiple sources: velhosmestres.com, academic papers
--
-- DEATH YEAR: February 9, 2019 (exact)
-- Confirmed by velhosmestres.com
--
-- LINEAGE: Besouro → João Catarino → Mestre Léo → Mestre Messias
-- This places Messias three generations from the legendary Besouro.
--
-- TITLE PROGRESSION:
-- - Mestre: 1947 (age 20), granted by Mestre Léo
-- - Grão Mestre: 2011, granted in life
--
-- NOTE ON "STUDENT OF PASTINHA" CLAIM:
-- One academic source (Bessa 2020) states Messias "foi aluno de Pastinha"
-- but this conflicts with the primary velhosmestres.com account which
-- clearly documents Mestre Léo as his teacher. Pastinha's influence may
-- have come through attendance at rodas or workshops, not direct formal
-- training. Using Léo as primary teacher; noting the Pastinha connection
-- in notes as "possibly influenced by."
--
-- BIRTH YEAR DISCREPANCY:
-- velhosmestres.com uses 1927, some sources use 1928 (e.g., in the Gato
-- Preto interview). Using 1927 as the primary (direct source from his
-- profile page) with exact precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Manoel Messias Pereira',
  'Messias',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-45']::text[],
  'angola'::genealogy.style,
  'Traditional Bahian capoeira from the Recôncavo. Practiced in the pre-codification era before formal academies existed. Known for exceptional skill with knives and razors (navalhas), reflecting the older capoeira tradition where weapons were common. Also practiced the traditional art of picking up objects from the ground with the mouth while playing.',
  'Capoeira tradicional baiana do Recôncavo. Praticava na era pré-codificação antes das academias formais existirem. Conhecido pela habilidade excepcional com facas e navalhas, refletindo a tradição mais antiga da capoeira onde armas eram comuns. Também praticava a arte tradicional de pegar objetos do chão com a boca enquanto jogava.',
  1927,
  'exact'::genealogy.date_precision,
  'São Braz, Santo Amaro da Purificação, Bahia, Brazil',
  2019,
  'exact'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  E'Manoel Messias Pereira was born on August 6, 1927, in São Braz, a rural district of Santo Amaro da Purificação in the Recôncavo Baiano—the same region that produced Besouro Mangangá and countless other legendary capoeiristas. He was the son of Paulo Cândido de Almeida and Isidora Santana Pereira (also recorded as Isadora Pereira).\n\nIn 1942, at age 15, Messias began his capoeira training under Mestre Léo, who held weekend training sessions in São Braz. Léo himself was a student of João Catarino, who had learned directly from Besouro Mangangá—placing young Messias just three generations removed from the most legendary figure in capoeira history. The training group met on Saturdays and Sundays, consisting of local teenagers aged 15-16, including Messias, Zinho, Genesio, Lao, Tomazinho, Jaime, and Chumbinho. In that same year, José Gabriel Góes (the future Mestre Gato Preto), then 12 years old, moved to São Braz and joined the group.\n\nMessias proved an exceptional student. In 1947, at just 20 years old, he was "formado a mestre" (graduated as a master) by Mestre Léo—a remarkable achievement for one so young. This placed him among the youngest mestres of his era.\n\nMessias was known as a complete capoeirista of the old tradition. He had exceptional "destreza" (dexterity) and skill in the "jogo com facas e navalhas" (playing with knives and razors)—a reference to the older, more dangerous capoeira where weapons were common. As one account notes, he was "do tempo de pegar um lenço com dinheiro no chão com a boca" (from the time when capoeiristas would pick up a handkerchief with money from the ground using their mouth)—a traditional display of skill and flexibility. Still young, he learned from Mestre Léo (some sources say "Lió") to pick up a needle with his tongue after executing a meia lua de compasso.\n\nBeyond capoeira, Messias was a multifaceted cultural practitioner. He worked as a "curandeiro" (healer) and "pescador" (fisherman), and participated in traditional cultural manifestations including Bumba Meu Boi and Samba de Roda—all interconnected expressions of Recôncavo Afro-Brazilian culture.\n\nIn 1978, ethnomusicologist Ralph Waddey recorded Messias''s "reza" (prayer)—his traditional invocation or blessing that would open capoeira rituals. Waddey, an American researcher who had first come to Bahia as a Peace Corps volunteer in 1965, spent 1976-1978 documenting the music and traditions of the Recôncavo. His recordings of Messias preserve an important piece of oral tradition.\n\nMessias remained active in the capoeira community throughout his long life. On December 21, 2013, he participated in the graduation ceremony of Mestre Sidney Santos de Jesus, alongside Mestres Felipe, Gary, and Dimas, confirming Sidney''s graduation to Mestre de Capoeira. Mestre Sidney later invited Messias and other "velhos mestres" (old masters) to teach at UNILAB (Universidade da Integração Internacional da Lusofonia Afro-Brasileira) as part of a program to share knowledge about traditional capoeira instruments and practices.\n\nIn 2011, Messias received the title of Grão Mestre (Grand Master) while still alive—a rare honor recognizing his lifetime of dedication to the art. He passed away on February 9, 2019, at 91 years of age, having witnessed the transformation of capoeira from a persecuted street practice to a UNESCO-recognized Intangible Cultural Heritage of Humanity.\n\nMessias stands as a direct link in one of the most significant lineages in capoeira history: Besouro Mangangá → João Catarino → Mestre Léo → Mestre Messias. Through him, the teachings and traditions of Besouro were transmitted to new generations in the Recôncavo.',
  E'Manoel Messias Pereira nasceu em 6 de agosto de 1927 em São Braz, um distrito rural de Santo Amaro da Purificação no Recôncavo Baiano—a mesma região que produziu Besouro Mangangá e incontáveis outros lendários capoeiristas. Era filho de Paulo Cândido de Almeida e Isidora Santana Pereira (também registrada como Isadora Pereira).\n\nEm 1942, aos 15 anos, Messias começou seu treinamento de capoeira com Mestre Léo, que ministrava treinos de fim de semana em São Braz. Léo era aluno de João Catarino, que aprendeu diretamente de Besouro Mangangá—colocando o jovem Messias a apenas três gerações do mais lendário figura da história da capoeira. O grupo de treino se reunia aos sábados e domingos, consistindo de adolescentes locais de 15-16 anos, incluindo Messias, Zinho, Genesio, Lao, Tomazinho, Jaime e Chumbinho. Naquele mesmo ano, José Gabriel Góes (o futuro Mestre Gato Preto), então com 12 anos, mudou-se para São Braz e juntou-se ao grupo.\n\nMessias provou ser um aluno excepcional. Em 1947, com apenas 20 anos, foi "formado a mestre" por Mestre Léo—uma conquista notável para alguém tão jovem. Isso o colocou entre os mestres mais jovens de sua época.\n\nMessias era conhecido como um capoeirista completo da velha tradição. Tinha excepcional "destreza" e habilidade no "jogo com facas e navalhas"—uma referência à capoeira mais antiga e perigosa onde armas eram comuns. Como relata uma fonte, era "do tempo de pegar um lenço com dinheiro no chão com a boca"—uma demonstração tradicional de habilidade e flexibilidade. Ainda jovem, aprendeu com Mestre Léo (algumas fontes dizem "Lió") a pegar uma agulha com a língua depois de executar uma meia lua de compasso.\n\nAlém da capoeira, Messias era um praticante cultural multifacetado. Trabalhava como "curandeiro" e "pescador", e participava de manifestações culturais tradicionais incluindo Bumba Meu Boi e Samba de Roda—todas expressões interconectadas da cultura afro-brasileira do Recôncavo.\n\nEm 1978, o etnomusicólogo Ralph Waddey gravou a "reza" de Messias—sua invocação ou bênção tradicional que abria os rituais de capoeira. Waddey, um pesquisador americano que tinha chegado à Bahia pela primeira vez como voluntário do Corpo da Paz em 1965, passou 1976-1978 documentando a música e as tradições do Recôncavo. Suas gravações de Messias preservam uma importante peça da tradição oral.\n\nMessias permaneceu ativo na comunidade da capoeira ao longo de sua longa vida. Em 21 de dezembro de 2013, participou da cerimônia de graduação de Mestre Sidney Santos de Jesus, ao lado de Mestres Felipe, Gary e Dimas, confirmando a graduação de Sidney a Mestre de Capoeira. Mestre Sidney posteriormente convidou Messias e outros "velhos mestres" para ensinar na UNILAB (Universidade da Integração Internacional da Lusofonia Afro-Brasileira) como parte de um programa para compartilhar conhecimento sobre instrumentos e práticas tradicionais da capoeira.\n\nEm 2011, Messias recebeu o título de Grão Mestre ainda em vida—uma honra rara reconhecendo sua vida de dedicação à arte. Faleceu em 9 de fevereiro de 2019, aos 91 anos de idade, tendo testemunhado a transformação da capoeira de uma prática de rua perseguida para Patrimônio Cultural Imaterial da Humanidade reconhecido pela UNESCO.\n\nMessias representa um elo direto em uma das linhagens mais significativas da história da capoeira: Besouro Mangangá → João Catarino → Mestre Léo → Mestre Messias. Através dele, os ensinamentos e tradições de Besouro foram transmitidos a novas gerações no Recôncavo.',
  E'Formado a Mestre at age 20 by Mestre Léo (1947)\nReceived Grão Mestre title while alive (2011)\nRalph Waddey recorded his reza/prayer (1978)\nConfirmed Mestre Sidney Santos de Jesus graduation (December 21, 2013)\nTaught at UNILAB as "Old Mestre" sharing traditional knowledge\nDirect lineage from Besouro Mangangá (3 generations)',
  E'Formado a Mestre aos 20 anos por Mestre Léo (1947)\nRecebeu título de Grão Mestre ainda em vida (2011)\nRalph Waddey gravou sua reza (1978)\nConfirmou graduação de Mestre Sidney Santos de Jesus (21 de dezembro de 2013)\nEnsinou na UNILAB como "Velho Mestre" compartilhando conhecimento tradicional\nLinhagem direta de Besouro Mangangá (3 gerações)',
  E'BIRTH DATE: August 6, 1927 (exact, per velhosmestres.com)\nOne source (Gato Preto interview) mentions "Messias, 1928" but this appears to be an error.\n\nDEATH DATE: February 9, 2019 (exact, per velhosmestres.com)\n\nPARENTS:\n- Father: Paulo Cândido de Almeida\n- Mother: Isidora Santana Pereira (also spelled Isadora Pereira)\n\nTEACHERS:\n- Mestre Léo (São Braz) - primary teacher from 1942; formed him as mestre in 1947\n- Possibly influenced by Mestre Pastinha (one source claims "aluno de Pastinha" but this may refer to roda attendance rather than formal training)\n\nTRAINING COMPANIONS (São Braz group, ~1942):\n- Mestre Gato Preto (José Gabriel Góes)\n- Zinho, Genesio, Lao, Tomazinho, Jaime, Chumbinho\n\nCONTEMPORARY ASSOCIATES (Santo Amaro region):\n- Mestre Felipe (Santiago), Mestre Carcará, Mestre Ivan, Mestre Gato, Mestre Siri de Mangue, Mestre Altenilo, Mestre Ferreirinha\n- Confirmed Sidney graduation alongside Mestres Felipe, Gary, Dimas (2013)\n- Jean Sarará (photo together 2019, Escola de Capoeira Angola Raízes do Sul archive)\n- Mestre Adó (contemporary in Santo Amaro)\n\nOCCUPATIONS:\n- Curandeiro (healer)\n- Pescador (fisherman)\n\nCULTURAL ACTIVITIES:\n- Bumba Meu Boi participant\n- Samba de Roda participant\n\nMEDIA APPEARANCES:\n- 1978: Reza (prayer) recorded by Ralph Waddey\n- Multiple photographs at velhosmestres.com\n- Video documentation\n- Photo with Jean Sarará (2019), Escola de Capoeira Angola Raízes do Sul archive\n\nTRADITIONAL SKILLS:\n- Jogo com facas e navalhas (playing with knives and razors)\n- Picking up lenço with money from ground with mouth\n- Picking up agulha (needle) with tongue after meia lua de compasso (learned from Mestre Léo/Lió)\n\nLINEAGE:\nBesouro Mangangá → João Catarino → Mestre Léo (São Braz) → Mestre Messias\n\nTITLE HISTORY:\n- 1947: Formado a Mestre by Mestre Léo (age 20)\n- 2011: Received Grão Mestre title\n\n"STUDENT OF PASTINHA" CLARIFICATION:\nBessa (2020) claims Messias "foi aluno de Pastinha" but velhosmestres.com clearly documents Mestre Léo as his teacher. The Pastinha connection may be through roda attendance or informal influence, not formal training.',
  E'DATA DE NASCIMENTO: 6 de agosto de 1927 (exata, conforme velhosmestres.com)\nUma fonte (entrevista de Gato Preto) menciona "Messias, 1928" mas parece ser um erro.\n\nDATA DE MORTE: 9 de fevereiro de 2019 (exata, conforme velhosmestres.com)\n\nPAIS:\n- Pai: Paulo Cândido de Almeida\n- Mãe: Isidora Santana Pereira (também escrito Isadora Pereira)\n\nMESTRES:\n- Mestre Léo (São Braz) - mestre principal desde 1942; formou-o como mestre em 1947\n- Possivelmente influenciado por Mestre Pastinha (uma fonte afirma "aluno de Pastinha" mas pode se referir a participação em rodas e não treinamento formal)\n\nCOMPANHEIROS DE TREINO (grupo São Braz, ~1942):\n- Mestre Gato Preto (José Gabriel Góes)\n- Zinho, Genesio, Lao, Tomazinho, Jaime, Chumbinho\n\nASSOCIADOS CONTEMPORÂNEOS (região de Santo Amaro):\n- Mestre Felipe (Santiago), Mestre Carcará, Mestre Ivan, Mestre Gato, Mestre Siri de Mangue, Mestre Altenilo, Mestre Ferreirinha\n- Confirmou graduação de Sidney ao lado de Mestres Felipe, Gary, Dimas (2013)\n- Jean Sarará (foto juntos 2019, arquivo da Escola de Capoeira Angola Raízes do Sul)\n- Mestre Adó (contemporâneo em Santo Amaro)\n\nOCUPAÇÕES:\n- Curandeiro\n- Pescador\n\nATIVIDADES CULTURAIS:\n- Participante de Bumba Meu Boi\n- Participante de Samba de Roda\n\nAPARIÇÕES NA MÍDIA:\n- 1978: Reza gravada por Ralph Waddey\n- Múltiplas fotografias em velhosmestres.com\n- Documentação em vídeo\n- Foto com Jean Sarará (2019), arquivo da Escola de Capoeira Angola Raízes do Sul\n\nHABILIDADES TRADICIONAIS:\n- Jogo com facas e navalhas\n- Pegar lenço com dinheiro do chão com a boca\n- Pegar agulha com a língua depois de meia lua de compasso (aprendeu com Mestre Léo/Lió)\n\nLINHAGEM:\nBesouro Mangangá → João Catarino → Mestre Léo (São Braz) → Mestre Messias\n\nHISTÓRICO DE TÍTULOS:\n- 1947: Formado a Mestre por Mestre Léo (20 anos)\n- 2011: Recebeu título de Grão Mestre\n\nESCLARECIMENTO "ALUNO DE PASTINHA":\nBessa (2020) afirma que Messias "foi aluno de Pastinha" mas velhosmestres.com documenta claramente Mestre Léo como seu mestre. A conexão com Pastinha pode ser através de participação em rodas ou influência informal, não treinamento formal.'
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

-- Source: entities/persons/moa-do-katende.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Môa do Katendê
-- Generated: 2026-01-02
-- ============================================================
-- DEATH DATE DISCREPANCY: Sources differ on October 7 vs 8, 2018.
-- The stabbing occurred late on Oct 7 (election night) after midnight;
-- he died in the early hours of Oct 8. Most Brazilian sources cite Oct 8.
-- Using October 8, 2018 as the death date.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Romualdo Rosário da Costa', 'Môa do Katendê', 'mestre'::genealogy.title, NULL,
  ARRAY['https://velhosmestres.com/en/featured-43', 'https://en.wikipedia.org/wiki/Moa_do_Katend%C3%AA', 'https://dicionariompb.com.br/artista/moa-do-katende/']::text[],
  'angola'::genealogy.style,
  E'Pure Capoeira Angola tradition inherited from Mestre Bobô. Môa extended his capoeira practice beyond the physical into music, dance, and cultural activism, embodying Angola''s holistic approach. As a composer and percussionist, he integrated capoeira with afoxé rhythms and Candomblé traditions, creating a distinctive synthesis that influenced generations of practitioners and musicians.',
  E'Pura tradição de Capoeira Angola herdada de Mestre Bobô. Môa estendeu sua prática de capoeira além do físico para música, dança e ativismo cultural, incorporando a abordagem holística de Angola. Como compositor e percussionista, integrou a capoeira com ritmos de afoxé e tradições do Candomblé, criando uma síntese distintiva que influenciou gerações de praticantes e músicos.',
  1954, 'exact'::genealogy.date_precision, 'Dique Pequeno, Engenho Velho de Brotas, Salvador, Bahia, Brazil',
  2018, 'exact'::genealogy.date_precision, 'Salvador, Bahia, Brazil',
  E'Romualdo Rosário da Costa was born on October 29, 1954, in the Dique Pequeno community of Salvador''s Engenho Velho de Brotas neighborhood, near the iconic Dique do Tororó. He discovered his roots early at his aunt''s terreiro, Ilê Axé Omin Bain, where at age eight he began learning capoeira. That same year, 1962, he joined Mestre Bobô''s Academia de Capoeira Angola Cinco Estrelas, beginning a journey that would make him one of the most influential cultural figures in Bahian history.

For the next decade, young Môa immersed himself in the Angola tradition at Bobô''s academy. At sixteen, however, he shifted focus to folkloric groups, joining the renowned "Viva Bahia" ensemble led by researcher Emília Biancardi for European tours (1976-1977), and later the group "Katendê"—a name he would later adopt as part of his own identity.

In 1977, Môa won the prestigious Festival da Canção at Ilê Aiyê, Brazil''s first Afro bloco, with his composition "Bloco Beleza." This victory catalyzed his next project: in May 1978, he founded Afoxé Badauê together with residents of Engenho Velho de Brotas. Afoxé—"the Candomblé of the street"—brought sacred rhythms into carnival, and Badauê revolutionized the form. The group''s 1979 debut brought an unprecedented 8,000 people to the streets, and Badauê won the carnival championship in the afoxé category that same year.

What made Badauê transformational was Môa''s vision of re-Africanization. He introduced amplified sound systems, expanded participation to include women and white participants, and broadened the musical repertoire beyond strictly sacred songs. This sparked a cultural movement that influenced Brazil''s greatest artists. Caetano Veloso attended rehearsals and paid tribute with his song "Badauê" on the album "Cinema Transcendental" (1979). Gilberto Gil, Moraes Moreira, and the Novos Baianos all drew inspiration from what Môa had created.

On April 5, 1987, Mestre Bobô formally graduated his first generation of mestres: Môa do Katendê and Lua de Bobó. The evaluation panel included the legendary mestres João Grande, João Pequeno, Vermelho, and Dona Romélia (Mestre Pastinha''s wife). From then on, Môa taught at the Academia de Capoeira Angola 5 Estrelas, now located at the Clube de Regatas Vasco da Gama, and at his aunt''s terreiro Omin Bain.

In 1984, Môa had moved to Rio de Janeiro to teach capoeira angola, and later to Porto Alegre, establishing Afro-Brazilian dance traditions in Rio Grande do Sul. He collaborated with Jorge Ben Jor on the musical projects "Negra Música" (1988) and "Venha ao Vale" (1989) in São Paulo as part of the Black Artists Movement.

In 1994/1995, he created Afoxé Amigos do Katendê in São Paulo, which he would take around the world. In 1997, returning to Salvador, he began a project with 60 children at the Associação Brasileira de Capoeira Angola (ABCA). He served as ABCA''s cultural director from 1998 to 2002, and became president in 2003. That same year, he founded Agremiação Gunga with Mestre Marrom, Mestre Mola, and others—the first capoeira carnival block in Brazil.

Throughout his life, Môa worked at the intersection of capoeira, music, and social justice. He taught percussion and capoeira to children at FEBEM (the former juvenile detention system) and SOS Criança. He was building a community institute in his childhood neighborhood when tragedy struck.

On the night of October 7, 2018—hours after Brazil''s polarized first-round presidential election—Môa was in a bar in Dique Pequeno when a Bolsonaro supporter initiated a political argument. After learning Môa had voted for the Worker''s Party candidate Fernando Haddad, the aggressor left, returned with a knife, and stabbed Môa twelve times in the back. He died in the early hours of October 8, 2018, at age 63.

The murder provoked international outrage. Caetano Veloso wrote: "Moa was my friend and he was one of the central figures in the growth of Afro-Blocos in Salvador. As the founder of Badauê, as a song composer and a master of capoeira, Moa lived the real history of this city and of this country." Ten days later, Roger Waters performed at Salvador''s Arena Fonte Nova for 28,000 people and delivered a tearful tribute: "He was a great example to believers in spreading love and humanity and empathy and courage."

In 2021, Bahia passed Lei Môa do Katendê (Law 14.341), creating the "Capoeira nas Escolas" program in his honor. His legacy lives on through the documentary "Môa, Raiz Afro Mãe" (directed by Gustavo McNair), the tribute album of the same name featuring sixteen artists including BaianaSystem, Emicida, and Chico César, and the Instituto Mestre Môa do Katendê now being built by his family in Dique Pequeno.',
  E'Romualdo Rosário da Costa nasceu em 29 de outubro de 1954, na comunidade do Dique Pequeno, no bairro Engenho Velho de Brotas em Salvador, perto do icônico Dique do Tororó. Descobriu suas raízes cedo no terreiro de sua tia, Ilê Axé Omin Bain, onde aos oito anos começou a aprender capoeira. Naquele mesmo ano, 1962, ingressou na Academia de Capoeira Angola Cinco Estrelas de Mestre Bobô, iniciando uma jornada que o tornaria uma das figuras culturais mais influentes da história baiana.

Durante a década seguinte, o jovem Môa mergulhou na tradição Angola na academia de Bobô. Aos dezesseis anos, porém, mudou o foco para grupos folclóricos, juntando-se ao renomado conjunto "Viva Bahia" liderado pela pesquisadora Emília Biancardi para turnês europeias (1976-1977), e depois ao grupo "Katendê"—nome que mais tarde adotaria como parte de sua própria identidade.

Em 1977, Môa venceu o prestigioso Festival da Canção no Ilê Aiyê, o primeiro bloco afro do Brasil, com sua composição "Bloco Beleza". Essa vitória catalisou seu próximo projeto: em maio de 1978, fundou o Afoxé Badauê junto com moradores do Engenho Velho de Brotas. Afoxé—"o Candomblé da rua"—trazia ritmos sagrados para o carnaval, e o Badauê revolucionou a forma. A estreia do grupo em 1979 trouxe 8.000 pessoas inéditas às ruas, e o Badauê venceu o campeonato do carnaval na categoria afoxé naquele mesmo ano.

O que tornou o Badauê transformador foi a visão de Môa de re-africanização. Ele introduziu sistemas de som amplificados, expandiu a participação para incluir mulheres e participantes brancos, e ampliou o repertório musical além de canções estritamente sagradas. Isso desencadeou um movimento cultural que influenciou os maiores artistas do Brasil. Caetano Veloso frequentava os ensaios e prestou homenagem com sua canção "Badauê" no álbum "Cinema Transcendental" (1979). Gilberto Gil, Moraes Moreira e os Novos Baianos todos se inspiraram no que Môa havia criado.

Em 5 de abril de 1987, Mestre Bobô formou formalmente sua primeira geração de mestres: Môa do Katendê e Lua de Bobó. A banca avaliadora incluía os lendários mestres João Grande, João Pequeno, Vermelho e Dona Romélia (esposa de Mestre Pastinha). A partir de então, Môa ensinou na Academia de Capoeira Angola 5 Estrelas, agora localizada no Clube de Regatas Vasco da Gama, e no terreiro Omin Bain de sua tia.

Em 1984, Môa havia se mudado para o Rio de Janeiro para ensinar capoeira angola, e depois para Porto Alegre, estabelecendo tradições de dança afro-brasileira no Rio Grande do Sul. Colaborou com Jorge Ben Jor nos projetos musicais "Negra Música" (1988) e "Venha ao Vale" (1989) em São Paulo como parte do Movimento de Artistas Negros.

Em 1994/1995, criou o Afoxé Amigos do Katendê em São Paulo, com o qual viajaria pelo mundo. Em 1997, retornando a Salvador, iniciou um projeto com 60 crianças na Associação Brasileira de Capoeira Angola (ABCA). Serviu como diretor cultural da ABCA de 1998 a 2002, e tornou-se presidente em 2003. Naquele mesmo ano, fundou a Agremiação Gunga com Mestre Marrom, Mestre Mola e outros—o primeiro bloco de capoeira do carnaval no Brasil.

Ao longo de sua vida, Môa trabalhou na interseção de capoeira, música e justiça social. Ensinou percussão e capoeira para crianças na FEBEM (o antigo sistema de internação juvenil) e no SOS Criança. Estava construindo um instituto comunitário em seu bairro de infância quando a tragédia aconteceu.

Na noite de 7 de outubro de 2018—horas após a polarizada eleição de primeiro turno do Brasil—Môa estava em um bar no Dique Pequeno quando um apoiador de Bolsonaro iniciou uma discussão política. Após saber que Môa havia votado no candidato do Partido dos Trabalhadores Fernando Haddad, o agressor saiu, voltou com uma faca e esfaqueou Môa doze vezes nas costas. Ele morreu nas primeiras horas de 8 de outubro de 2018, aos 63 anos.

O assassinato provocou indignação internacional. Caetano Veloso escreveu: "Moa era meu amigo e foi uma das figuras centrais no crescimento dos Blocos Afro em Salvador. Como fundador do Badauê, como compositor de canções e mestre de capoeira, Moa viveu a história real desta cidade e deste país." Dez dias depois, Roger Waters se apresentou na Arena Fonte Nova de Salvador para 28.000 pessoas e prestou uma homenagem emocionada: "Ele foi um grande exemplo para aqueles que acreditam em espalhar amor, humanidade, empatia e coragem."

Em 2021, a Bahia aprovou a Lei Môa do Katendê (Lei 14.341), criando o programa "Capoeira nas Escolas" em sua homenagem. Seu legado vive através do documentário "Môa, Raiz Afro Mãe" (dirigido por Gustavo McNair), do álbum-tributo de mesmo nome com dezesseis artistas incluindo BaianaSystem, Emicida e Chico César, e do Instituto Mestre Môa do Katendê agora sendo construído por sua família no Dique Pequeno.',
  E'- Won Festival da Canção at Ilê Aiyê with "Bloco Beleza" (1977)
- Founded Afoxé Badauê (May 1978)
- Badauê won carnival championship in afoxé category (1979)
- Graduated Mestre by Mestre Bobô (April 5, 1987)
- Collaborated with Jorge Ben Jor on "Negra Música" (1988) and "Venha ao Vale" (1989)
- Founded Afoxé Amigos do Katendê in São Paulo (1994/1995)
- Cultural Director of ABCA (1998-2002)
- President of ABCA (2003)
- Co-founded Agremiação Gunga, first capoeira carnival block (1999/2003)
- Lei Môa do Katendê (Law 14.341/2021) passed in his honor
- Posthumous documentary "Môa, Raiz Afro Mãe" (directed by Gustavo McNair)
- Posthumous tribute album "Raiz Afro Mãe" with 16 artists (2022)',
  E'- Venceu o Festival da Canção no Ilê Aiyê com "Bloco Beleza" (1977)
- Fundou o Afoxé Badauê (maio de 1978)
- Badauê venceu o campeonato do carnaval na categoria afoxé (1979)
- Formado Mestre por Mestre Bobô (5 de abril de 1987)
- Colaborou com Jorge Ben Jor em "Negra Música" (1988) e "Venha ao Vale" (1989)
- Fundou o Afoxé Amigos do Katendê em São Paulo (1994/1995)
- Diretor Cultural da ABCA (1998-2002)
- Presidente da ABCA (2003)
- Co-fundou a Agremiação Gunga, primeiro bloco de capoeira do carnaval (1999/2003)
- Lei Môa do Katendê (Lei 14.341/2021) aprovada em sua homenagem
- Documentário póstumo "Môa, Raiz Afro Mãe" (dirigido por Gustavo McNair)
- Álbum-tributo póstumo "Raiz Afro Mãe" com 16 artistas (2022)',
  E'BIRTH YEAR (1954, exact):
Born October 29, 1954 in Dique Pequeno, Engenho Velho de Brotas, Salvador. Confirmed by multiple sources including velhosmestres.com and Dicionário Cravo Albin.

DEATH YEAR (2018, exact):
Stabbed 12 times in the back on the night of October 7, 2018 (election night) and died in the early hours of October 8, 2018. Most Brazilian sources cite October 8 as the death date.

APELIDO ORIGIN:
"Katendê" (sometimes spelled Catendê) refers to a Bantu practice of converting leaves into medicine. Môa adopted this as part of his name from his work with the folkloric group "Katendê" in the 1970s.

TEACHERS:
- Mestre Bobô (Milton Santos, 1925-1994) - began 1962 at age 8; graduated mestre April 5, 1987

MESTRE GRADUATION PANEL (April 5, 1987):
- Mestre João Grande
- Mestre João Pequeno
- Mestre Vermelho (27)
- Dona Romélia (Maria Romélia, Mestre Pastinha''s wife)

GROUPS FOUNDED:
- Afoxé Badauê (May 1978, Salvador)
- Afoxé Amigos do Katendê / Amigos de Katendê (1994/1995, São Paulo)
- Agremiação Gunga (1999/2003, Salvador - first capoeira carnival block)

ABCA ROLES:
- Coordinated project with 60 children at ABCA (1997)
- Cultural Director (1998-2002)
- President (2003)

ASSOCIATED ORGANIZATIONS:
- Viva Bahia (folkloric group, 1976-1977, European tours with Emília Biancardi)
- Grupo Katendê (folkloric group, 1970s)
- Black Artists Movement São Paulo (1988-1989)
- ABCA (Associação Brasileira de Capoeira Angola)
- Academia de Capoeira Angola Cinco Estrelas

MEDIA APPEARANCES:
- 1977: Won Ilê Aiyê Festival with "Bloco Beleza"
- 1979: Badauê wins carnival championship; Caetano Veloso''s "Badauê" song on "Cinema Transcendental"
- 1988: "Negra Música" project with Jorge Ben Jor
- 1989: "Venha ao Vale" project with Jorge Ben Jor
- 2013: CD "Angoleiro Sim Sinhô" (compilation)
- 2022 (posthumous): Documentary "Môa, Raiz Afro Mãe" directed by Gustavo McNair
- 2022 (posthumous): Album "Raiz Afro Mãe" with 16 artists

DISCOGRAPHY:
- CD "Raiz Afro-Mãe" (capoeira angola/afoxé blend)
- CD of afoxé (title unknown)
- Participation in "Angoleiro Sim Sinhô" (2013)
- Posthumous album "Raiz Afro Mãe" (2022)

CONTEMPORARIES PHOTOGRAPHED WITH (per velhosmestres.com):
- Mestre Mala
- Mestre Gildo Alfinete
- Mestre Pelé da Bomba
- Mestre Boa Gente
- Mestre Bigodinho
- Gilberto Gil

ASSASSINATION DETAILS:
- Date: Night of October 7 / early hours October 8, 2018
- Location: Bar in Dique Pequeno community, Engenho Velho de Brotas, Salvador
- Circumstances: Political argument after first round of 2018 presidential election
- Motive: Môa declared he voted for PT candidate Fernando Haddad
- Attacker: Paulo Sérgio Ferreira de Santana (Bolsonaro supporter)
- Method: 12 stab wounds to the back with kitchen knife/machete

TRIBUTES AFTER DEATH:
- Caetano Veloso (Brazilian musician)
- Gilberto Gil (Brazilian musician)
- Roger Waters (Pink Floyd co-founder) - tearful tribute at Arena Fonte Nova concert Oct 18, 2018
- Chico César
- Daniela Mercury
- Graffiti tributes throughout Salvador
- Mass at Igreja de Nossa Senhora do Rosário dos Pretos
- Lei Môa do Katendê (Law 14.341/2021)

FAMILY:
- Four children including daughter Samonair da Costa (Jasse Mahi, who performs on tribute album)
- Cousin: Jaime Barreto (composed tribute song)

DIRECT QUOTES:
- "Capoeira is everything that moves for me...a rich culture...I follow spreading it wherever possible"',
  E'ANO DE NASCIMENTO (1954, exato):
Nasceu em 29 de outubro de 1954 no Dique Pequeno, Engenho Velho de Brotas, Salvador. Confirmado por múltiplas fontes incluindo velhosmestres.com e Dicionário Cravo Albin.

ANO DE FALECIMENTO (2018, exato):
Esfaqueado 12 vezes nas costas na noite de 7 de outubro de 2018 (noite da eleição) e morreu nas primeiras horas de 8 de outubro de 2018. A maioria das fontes brasileiras cita 8 de outubro como data do falecimento.

ORIGEM DO APELIDO:
"Katendê" (às vezes escrito Catendê) refere-se a uma prática Bantu de converter folhas em medicina. Môa adotou isso como parte de seu nome a partir de seu trabalho com o grupo folclórico "Katendê" nos anos 1970.

MESTRES:
- Mestre Bobô (Milton Santos, 1925-1994) - começou em 1962 aos 8 anos; formado mestre em 5 de abril de 1987

BANCA AVALIADORA DA FORMATURA (5 de abril de 1987):
- Mestre João Grande
- Mestre João Pequeno
- Mestre Vermelho (27)
- Dona Romélia (Maria Romélia, esposa de Mestre Pastinha)

GRUPOS FUNDADOS:
- Afoxé Badauê (maio de 1978, Salvador)
- Afoxé Amigos do Katendê / Amigos de Katendê (1994/1995, São Paulo)
- Agremiação Gunga (1999/2003, Salvador - primeiro bloco de capoeira do carnaval)

CARGOS NA ABCA:
- Coordenou projeto com 60 crianças na ABCA (1997)
- Diretor Cultural (1998-2002)
- Presidente (2003)

ORGANIZAÇÕES ASSOCIADAS:
- Viva Bahia (grupo folclórico, 1976-1977, turnês europeias com Emília Biancardi)
- Grupo Katendê (grupo folclórico, anos 1970)
- Movimento de Artistas Negros de São Paulo (1988-1989)
- ABCA (Associação Brasileira de Capoeira Angola)
- Academia de Capoeira Angola Cinco Estrelas

APARIÇÕES NA MÍDIA:
- 1977: Venceu Festival do Ilê Aiyê com "Bloco Beleza"
- 1979: Badauê vence campeonato do carnaval; música "Badauê" de Caetano Veloso no "Cinema Transcendental"
- 1988: Projeto "Negra Música" com Jorge Ben Jor
- 1989: Projeto "Venha ao Vale" com Jorge Ben Jor
- 2013: CD "Angoleiro Sim Sinhô" (compilação)
- 2022 (póstumo): Documentário "Môa, Raiz Afro Mãe" dirigido por Gustavo McNair
- 2022 (póstumo): Álbum "Raiz Afro Mãe" com 16 artistas

DISCOGRAFIA:
- CD "Raiz Afro-Mãe" (mistura de capoeira angola/afoxé)
- CD de afoxé (título desconhecido)
- Participação em "Angoleiro Sim Sinhô" (2013)
- Álbum póstumo "Raiz Afro Mãe" (2022)

CONTEMPORÂNEOS FOTOGRAFADOS COM (conforme velhosmestres.com):
- Mestre Mala
- Mestre Gildo Alfinete
- Mestre Pelé da Bomba
- Mestre Boa Gente
- Mestre Bigodinho
- Gilberto Gil

DETALHES DO ASSASSINATO:
- Data: Noite de 7 de outubro / primeiras horas de 8 de outubro de 2018
- Local: Bar na comunidade do Dique Pequeno, Engenho Velho de Brotas, Salvador
- Circunstâncias: Discussão política após primeiro turno da eleição presidencial de 2018
- Motivo: Môa declarou ter votado no candidato do PT Fernando Haddad
- Agressor: Paulo Sérgio Ferreira de Santana (apoiador de Bolsonaro)
- Método: 12 facadas nas costas com faca de cozinha/facão

HOMENAGENS APÓS A MORTE:
- Caetano Veloso (músico brasileiro)
- Gilberto Gil (músico brasileiro)
- Roger Waters (co-fundador do Pink Floyd) - homenagem emocionada no show da Arena Fonte Nova em 18 de outubro de 2018
- Chico César
- Daniela Mercury
- Grafites de homenagem por toda Salvador
- Missa na Igreja de Nossa Senhora do Rosário dos Pretos
- Lei Môa do Katendê (Lei 14.341/2021)

FAMÍLIA:
- Quatro filhos incluindo filha Samonair da Costa (Jasse Mahi, que canta no álbum-tributo)
- Primo: Jaime Barreto (compôs canção de homenagem)

CITAÇÕES DIRETAS:
- "Capoeira é tudo que se movimenta para mim...uma cultura rica...sigo espalhando onde for possível"'
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

-- Source: entities/persons/olavo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Olavo
-- Generated: 2026-01-03
-- ============================================================
-- Full Name: Olavo Paixão dos Santos
-- Born: July 29, 1942, Cruz das Almas, Bahia
-- Known as: Mestre Olavo, Olavo da Bahia
--
-- Master berimbau craftsman and capoeira mestre. Student of
-- Mestre Alfredo (Angola, Muritiba), Mestre Waldemar (Salvador),
-- and Mestre Acordeon (Regional). One of the first Mestre Artesão
-- (Master Artisan) in Brazil (May 2021). Leader of Grupo BerimBahia.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Olavo Paixão dos Santos',
  'Olavo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://velhosmestres.com/br/destaques-65',
    'https://artesanatodabahia.com.br/artesaos/mestre-olavo-da-bahia/'
  ]::text[],
  'angola'::genealogy.style,
  E'Olavo trained in Capoeira Angola with Mestre Alfredo in Muritiba before moving to Salvador, where he continued his Angola formation under Mestre Waldemar. In 1967, he also studied Regional with Mestre Acordeon. His style reflects traditional Angola foundations with exposure to Regional through Acordeon. He is primarily known as a master berimbau player and craftsman, continuing the artisanal tradition pioneered by Waldemar.',
  E'Olavo treinou Capoeira Angola com Mestre Alfredo em Muritiba antes de se mudar para Salvador, onde continuou sua formação em Angola com Mestre Waldemar. Em 1967, também estudou Regional com Mestre Acordeon. Seu estilo reflete fundamentos tradicionais de Angola com exposição ao Regional através de Acordeon. É principalmente conhecido como mestre tocador e artesão de berimbau, continuando a tradição artesanal pioneira de Waldemar.',
  1942, 'exact'::genealogy.date_precision, 'Cruz das Almas, Bahia',
  NULL, NULL, NULL,
  E'Olavo Paixão dos Santos was born on July 29, 1942, in Cruz das Almas, in the Recôncavo region of Bahia. He grew up in nearby Muritiba, where he first learned capoeira under Mestre Alfredo da Capoeira Angola.

In 1958, at age sixteen, Olavo began making berimbaus—a craft he would pursue for over six decades. In 1960, at eighteen, he moved to Salvador and sought out Mestre Waldemar da Paixão, the legendary capoeirista of Liberdade who had pioneered the commercialization and artistic decoration of berimbaus. Under Waldemar''s guidance, Olavo learned to build quality instruments, incorporating Waldemar''s innovations: the use of steel wire (arame) and the painting of gourds (cabaças). Olavo added his own signature—pyrography (pirogravura), the art of decorating wood with burned designs.

From 1969 to 1970, Olavo directed the capoeira rodas at Agnelo''s bar in Pero Vaz, Liberdade, under Mestre Waldemar''s oversight. This was the famous "passeio de Agnelo" where Waldemar had held his legendary Sunday rodas since the 1940s. The rodas gradually deactivated after this period.

In 1967, Olavo also met Mestre Acordeon and began learning Regional capoeira with him, expanding his knowledge beyond the Angola tradition.

For more than forty years, Olavo maintained a workspace at the Hotel Deville Prime Salvador (formerly Hotel Quatro Rodas), selling handcrafted berimbaus and traditional Bahian cultural items. His instruments—berimbaus, pandeiros, cuícas, atabaques, agogôs, xequerês, and reco-recos—became sought after by specialists worldwide. In 2025, he faced arbitrary removal from this workspace, prompting a solidarity motion from the Bahia State Legislature recognizing him as "a living symbol of Bahian culture" and "guardian of ancestral knowledge."

On August 20, 1989, a historic photograph captured Olavo playing berimbau at Mestre Itapoan''s house in Salvador, alongside Mestres João Pequeno (pandeiro), João Grande (berimbau), Gigante (berimbau), and Waldemar (singing), with Mestres Paulo dos Anjos and Itapoan crouching in front. The gathering celebrated the birthdays of Itapoan and Paulo dos Anjos.

At 79 years of age, with 56 years dedicated to capoeira, Olavo received the title of Mestre Artesão (Master Artisan) on May 28, 2021, at the Centro de Comercialização Artesanato da Bahia in Salvador. Alongside Mestre Lua Rasta, he became one of the first master artisans of capoeira recognized in Brazil, through an initiative of the Secretaria do Trabalho, Emprego, Renda e Esporte (SETRE). "É um momento de felicidade por essa conquista," he said. "Como capoeirista e artesão fabricante de instrumentos, principalmente berimbau, só tenho a agradecer."

In January 2024, Olavo was among 14 octogenarian mestres honored at the 5º Rede Capoeira in Salvador, receiving a symbolic Sankofa statue alongside João Grande, Acordeon, Pelé da Bomba, Brasília, Virgílio, and other legendary figures.

Today, Olavo leads Grupo de Capoeira BerimBahia and holds traditional Sunday street rodas in front of his house, welcoming capoeiristas from various groups.',

  E'Olavo Paixão dos Santos nasceu em 29 de julho de 1942, em Cruz das Almas, na região do Recôncavo da Bahia. Cresceu na vizinha Muritiba, onde aprendeu capoeira pela primeira vez com Mestre Alfredo da Capoeira Angola.

Em 1958, aos dezesseis anos, Olavo começou a fazer berimbaus—um ofício que ele praticaria por mais de seis décadas. Em 1960, aos dezoito anos, mudou-se para Salvador e procurou Mestre Waldemar da Paixão, o lendário capoeirista da Liberdade que havia pioneirado a comercialização e decoração artística de berimbaus. Sob a orientação de Waldemar, Olavo aprendeu a construir instrumentos de qualidade, incorporando as inovações de Waldemar: o uso do arame de aço e a pintura das cabaças. Olavo acrescentou sua própria marca—a pirogravura, a arte de decorar madeira com desenhos queimados.

De 1969 a 1970, Olavo dirigiu as rodas de capoeira no bar do Agnelo em Pero Vaz, Liberdade, sob a supervisão de Mestre Waldemar. Este era o famoso "passeio de Agnelo" onde Waldemar realizava suas lendárias rodas de domingo desde os anos 1940. As rodas foram gradualmente desativadas após este período.

Em 1967, Olavo também conheceu Mestre Acordeon e começou a aprender Capoeira Regional com ele, expandindo seu conhecimento além da tradição Angola.

Por mais de quarenta anos, Olavo manteve um espaço de trabalho no Hotel Deville Prime Salvador (anteriormente Hotel Quatro Rodas), vendendo berimbaus artesanais e itens culturais tradicionais baianos. Seus instrumentos—berimbaus, pandeiros, cuícas, atabaques, agogôs, xequerês e reco-recos—tornaram-se procurados por especialistas do mundo todo. Em 2025, enfrentou remoção arbitrária deste espaço de trabalho, provocando uma moção de solidariedade da Assembleia Legislativa da Bahia reconhecendo-o como "símbolo vivo da cultura baiana" e "guardião do saber ancestral."

Em 20 de agosto de 1989, uma fotografia histórica capturou Olavo tocando berimbau na casa de Mestre Itapoan em Salvador, ao lado de Mestres João Pequeno (pandeiro), João Grande (berimbau), Gigante (berimbau) e Waldemar (cantando), com Mestres Paulo dos Anjos e Itapoan agachados à frente. O encontro celebrava os aniversários de Itapoan e Paulo dos Anjos.

Aos 79 anos de idade, com 56 anos dedicados à capoeira, Olavo recebeu o título de Mestre Artesão em 28 de maio de 2021, no Centro de Comercialização Artesanato da Bahia em Salvador. Ao lado de Mestre Lua Rasta, tornou-se um dos primeiros mestres artesãos da capoeira reconhecidos no Brasil, através de iniciativa da Secretaria do Trabalho, Emprego, Renda e Esporte (SETRE). "É um momento de felicidade por essa conquista," disse ele. "Como capoeirista e artesão fabricante de instrumentos, principalmente berimbau, só tenho a agradecer."

Em janeiro de 2024, Olavo estava entre 14 mestres octogenários homenageados no 5º Rede Capoeira em Salvador, recebendo uma estátua simbólica Sankofa ao lado de João Grande, Acordeon, Pelé da Bomba, Brasília, Virgílio e outras figuras lendárias.

Hoje, Olavo lidera o Grupo de Capoeira BerimBahia e realiza tradicionais rodas de rua aos domingos em frente à sua casa, recebendo capoeiristas de vários grupos.',

  E'- Began making berimbaus (1958)
- Student of Mestre Alfredo (Muritiba, Capoeira Angola)
- Student of Mestre Waldemar (Salvador, from 1960)
- Student of Mestre Acordeon (1967)
- Directed rodas at Agnelo''s bar under Waldemar''s oversight (1969-1970)
- Photographed with Mestres Waldemar, João Grande, João Pequeno, Gigante, Paulo dos Anjos, Itapoan (August 20, 1989)
- 40+ years selling berimbaus at Hotel Deville Prime Salvador (formerly Quatro Rodas)
- First Mestre Artesão (Master Artisan) of capoeira in Brazil (May 28, 2021, with Lua Rasta)
- Honored at 5º Rede Capoeira among 14 octogenarian mestres (January 2024)
- Leader of Grupo de Capoeira BerimBahia
- Hosts traditional Sunday street rodas at his home',

  E'- Começou a fazer berimbaus (1958)
- Aluno de Mestre Alfredo (Muritiba, Capoeira Angola)
- Aluno de Mestre Waldemar (Salvador, a partir de 1960)
- Aluno de Mestre Acordeon (1967)
- Dirigiu rodas no bar do Agnelo sob supervisão de Waldemar (1969-1970)
- Fotografado com Mestres Waldemar, João Grande, João Pequeno, Gigante, Paulo dos Anjos, Itapoan (20 de agosto de 1989)
- 40+ anos vendendo berimbaus no Hotel Deville Prime Salvador (antigo Quatro Rodas)
- Primeiro Mestre Artesão de capoeira no Brasil (28 de maio de 2021, com Lua Rasta)
- Homenageado no 5º Rede Capoeira entre 14 mestres octogenários (janeiro de 2024)
- Líder do Grupo de Capoeira BerimBahia
- Realiza tradicionais rodas de rua aos domingos em sua casa',

  E'TEACHERS:
- Mestre Alfredo da Capoeira Angola (childhood, Muritiba) - initial Angola training
- Mestre Waldemar da Paixão (1960+, Salvador) - Angola and berimbau craftsmanship
- Mestre Acordeon (1967+, Salvador) - Regional capoeira

BERIMBAU CRAFTSMANSHIP:
- Began making berimbaus 1958
- Learned from Waldemar: steel wire (arame), gourd painting (cabaças)
- Added own innovation: pyrography (pirogravura)
- Materials: biriba or taipoca wood, steel wire, gourd
- Instruments: berimbaus, pandeiros, cuícas, atabaques, agogôs, xequerês, reco-recos, djun-djuns

MEDIA APPEARANCES:
- 1989 (Aug 20): Historic photo at Itapoan''s house with Waldemar, João Grande, João Pequeno, Gigante, Paulo dos Anjos, Itapoan (archive of M Bola Sete)
- 2012: Workshop at International Capoeira Raiz Dresden
- 2021 (May 28): Mestre Artesão recognition ceremony at Centro de Comercialização Artesanato da Bahia
- 2024 (Jan): 5º Rede Capoeira honors ceremony (Sankofa statue)

RODA LOCATION: In front of his house (address unknown), Salvador - Sundays

WORKSPACE HISTORY:
- 40+ years at Hotel Deville Prime Salvador (formerly Hotel Quatro Rodas)
- 2025: Faced arbitrary removal, prompting legislative solidarity motion

DIRECTED RODAS:
- Rodas at Agnelo''s bar, Pero Vaz, Liberdade (1969-1970) under Waldemar''s oversight',

  E'MESTRES:
- Mestre Alfredo da Capoeira Angola (infância, Muritiba) - formação inicial em Angola
- Mestre Waldemar da Paixão (1960+, Salvador) - Angola e artesanato de berimbau
- Mestre Acordeon (1967+, Salvador) - Capoeira Regional

ARTESANATO DE BERIMBAU:
- Começou a fazer berimbaus em 1958
- Aprendeu com Waldemar: arame de aço, pintura de cabaças
- Adicionou inovação própria: pirogravura
- Materiais: madeira de biriba ou taipoca, arame de aço, cabaça
- Instrumentos: berimbaus, pandeiros, cuícas, atabaques, agogôs, xequerês, reco-recos, djun-djuns

APARIÇÕES NA MÍDIA:
- 1989 (20 ago): Foto histórica na casa de Itapoan com Waldemar, João Grande, João Pequeno, Gigante, Paulo dos Anjos, Itapoan (arquivo de M Bola Sete)
- 2012: Oficina no International Capoeira Raiz Dresden
- 2021 (28 mai): Cerimônia de reconhecimento como Mestre Artesão no Centro de Comercialização Artesanato da Bahia
- 2024 (jan): Cerimônia de homenagem do 5º Rede Capoeira (estátua Sankofa)

LOCAL DA RODA: Em frente à sua casa (endereço desconhecido), Salvador - domingos

HISTÓRICO DO ESPAÇO DE TRABALHO:
- 40+ anos no Hotel Deville Prime Salvador (antigo Hotel Quatro Rodas)
- 2025: Enfrentou remoção arbitrária, provocando moção de solidariedade legislativa

RODAS DIRIGIDAS:
- Rodas no bar do Agnelo, Pero Vaz, Liberdade (1969-1970) sob supervisão de Waldemar'
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

-- Source: entities/persons/paulo-dos-anjos.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Paulo dos Anjos
-- Generated: 2026-01-02
-- Primary Sources: velhosmestres.com, lalaue.com, capoeira-connection.com, esquiva.wordpress.com
-- ============================================================
-- DEPENDENCIES: canjiquinha.sql, gato-preto.sql (teachers), pastinha.sql (frequented academy)
-- ============================================================
--
-- BIRTH: August 15, 1936 - confirmed by multiple sources (Velhos Mestres, Lalaue, Esquiva)
-- DEATH: March 26, 1999 - confirmed by multiple sources; died from hospital-acquired infection
--
-- NAME: José Paulo dos Anjos (also called "Paulo dos Anjos" without "José")
-- NOTE: Do NOT confuse with Paulo dos Santos, who is Mestre Limão (different person)
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
  'José Paulo dos Anjos',
  'Paulo dos Anjos',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-10', 'https://www.lalaue.com/learn-capoeira/mestre-paulo-dos-anjos/', 'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-paulo-dos-anjos/', 'https://esquiva.wordpress.com/mestres/mestre-paulo-dos-anjos/', 'https://capoeira.online/history/mestres/mestre-paulo-dos-anjos/']::text[],
  'angola'::genealogy.style,
  E'Paulo dos Anjos was one of the most skilled and versatile Angoleiros of his century. Known for his strict adherence to traditional Capoeira Angola, he strongly resisted attempts to incorporate modern innovations. He stated: "For me, nothing changed. I continue making Capoeira Angola according to tradition." His singing was renowned - described as having "an orchestra in his throat" - blending his unique vocal style with traditional capoeira melodies. He rejected romanticized claims about razor combat, calling such narratives "fantasy to deceive silly children," emphasizing that respect was fundamental to authentic capoeira practice.',
  E'Paulo dos Anjos foi um dos mais hábeis e versáteis Angoleiros de seu século. Conhecido por sua adesão estrita à Capoeira Angola tradicional, resistiu fortemente às tentativas de incorporar inovações modernas. Ele declarou: "Para mim, nada mudou. Eu continuo fazendo Capoeira Angola conforme a tradição." Seu canto era renomado - descrito como tendo "uma orquestra na garganta" - mesclando seu estilo vocal único com melodias tradicionais da capoeira. Rejeitava afirmações romantizadas sobre combate com navalha, chamando tais narrativas de "fantasia para enganar crianças bobas," enfatizando que o respeito era fundamental para a prática autêntica da capoeira.',
  1936,
  'exact'::genealogy.date_precision,
  'Estância, Sergipe, Brazil',
  1999,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'José Paulo dos Anjos was born on August 15, 1936, in Estância, a small city in the state of Sergipe. At age five, in 1941, he moved to Salvador, Bahia, living on Rua Ubaranas. There he first encountered capoeira when he saw a member of Mestre Bimba''s group practicing.\n\nBy age fourteen, the young José Paulo had established a reputation as a promising boxer in Salvador. But a year earlier, in 1949, he had met Mestre Canjiquinha—and that encounter would redirect his life. He began frequenting the street rodas of Salvador, quickly becoming captivated by capoeira.\n\nIn 1950, Paulo dos Anjos began formal training with Canjiquinha, entering a seven-year apprenticeship that would shape his entire approach to the art. By 1957, he had graduated under Canjiquinha''s tutelage—consecrated as a mestre by the hands of his own teacher. At the festas de largo, his technique and skill drew everyone''s attention.\n\nHe also frequented the rodas at Mestre Pastinha''s academy and worked alongside Mestre Gato Preto. In 1963, he began teaching at Gato Preto''s academy, initially at Engenho Velho da Federação and later at Mirante do Calabar. The two mestres developed a close working relationship that would continue for years.\n\nBy the mid-1960s, Paulo dos Anjos brought capoeira to Vera Cruz island and Mar Grande. His first student on Itaparica Island was Mestre Jaime de Mar Grande, followed by Mestre Jorge Satélite. Starting in 1985, he organized the annual "Encontro de Mestre Paulo dos Anjos" (Mestre Paulo dos Anjos Encounters) on the island, gatherings that brought together significant portions of Bahia''s capoeira community.\n\nIn the 1970s, concerned about the direction of Capoeira Angola, Paulo dos Anjos decided to travel to São Paulo to transmit his master''s teachings. As he later explained: "The situation was bad for me, during a lean time without fish, and a student—who trained boxing with me and knew I played Capoeira—invited me to go to São Paulo, and I went."\n\nFor five years (1970-1975), he lived in São José dos Campos, where on August 15, 1975, he founded the Associação de Capoeira Anjos de Angola (Angels of Angola Association). In 1978, he achieved a major competitive victory: winning the capoeira championship at the legendary Ginásio do Pacaembu in São Paulo—a rare triumph for an Angola practitioner in the Regional-dominated competitive scene.\n\nIn 1980, Paulo dos Anjos returned to Salvador. He established an academy in Bairro da Paz (formerly called Malvinas after the Falklands War land occupation), teaching at the Salão Paroquial da Paz. He combined his capoeira work with a position as civil servant at the Salvador city hall. In the 1980s, he created the Associação Cultural de Capoeira Grupo Anjos de Angola Academia, focused on disseminating Afro-Brazilian culture with emphasis on socio-cultural education of children, youth, and adults.\n\nHe also influenced the movement of capoeiristas advocating for better working conditions—a cause that would remain important throughout his life.\n\nIn 1984, he participated in a major capoeira gathering in Rio de Janeiro and attended the church washing celebration in Pituba. By 1987, he had become vice-president of the newly founded Associação Brasileira de Capoeira Angola (ABCA), with Mestre João Pequeno as president. The election on July 3, 1987 put the "Evolução" ticket in power, with Paulo dos Anjos, Mário Bom Cabrito (Treasurer), Nô (Technical Director), and Renê (Social Director) forming the leadership.\n\nThat same year, he participated in the I Cultural Capoeira Symposium in the historic city of Ouro Preto.\n\nIn 1992, Paulo dos Anjos recorded his album "Capoeira Angola da Bahia," preserving his distinctive singing style. With his own way of singing the capoeira songs, he was venerated by all—his voice described as containing "an orchestra."\n\nIn a 1995 interview with "Capoeirando," he articulated his philosophy clearly: "I have always been an angoleiro. I don''t even discuss Regional because I don''t know it and don''t understand it." He maintained that respect was essential to traditional capoeira, distinguishing it from modern interpretations where younger practitioners sometimes challenged mestres based solely on physical ability.\n\nMestre Paulo dos Anjos passed away on March 26, 1999, in Salvador, the victim of an infection contracted following surgery at a local hospital. His death represented an irreparable loss for Capoeira Angola.\n\nHis legacy lives on through his students—many of whom became mestres with their own academies around the world—including Virgílio do Retiro, Jaime de Mar Grande, Jorge Satélite, Pássaro Preto, Amâncio, Neguinho, Renê, Alfredo, Djalma, Galego, Mala, Josias, Cabeção, Jequié, Feijão, Vital, and Al Capone.\n\nOn June 5, 2005, the Colégio Estadual Mestre Paulo dos Anjos was established in Bairro da Paz, Salvador—honoring the mestre as an educator for his work in valuing capoeira as Brazilian cultural expression. In 2024, the documentary "Dessa arte eu sei um pouco" (I know a little about this art), directed by capoeirista and filmmaker Cled Pereira, premiered, featuring testimonies from Mestres Jaime de Mar Grande, Jorge Satélite, and Renê Bittencourt paying tribute to their former master.',
  E'José Paulo dos Anjos nasceu em 15 de agosto de 1936, em Estância, uma pequena cidade no estado de Sergipe. Aos cinco anos, em 1941, mudou-se para Salvador, Bahia, morando na Rua Ubaranas. Lá ele encontrou a capoeira pela primeira vez quando viu um membro do grupo de Mestre Bimba praticando.\n\nAos quatorze anos, o jovem José Paulo havia estabelecido uma reputação como boxeador promissor em Salvador. Mas um ano antes, em 1949, ele conheceu Mestre Canjiquinha—e esse encontro redirecionaria sua vida. Começou a frequentar as rodas de rua de Salvador, rapidamente se apaixonando pela capoeira.\n\nEm 1950, Paulo dos Anjos começou a treinar formalmente com Canjiquinha, iniciando um aprendizado de sete anos que moldaria toda sua abordagem à arte. Em 1957, graduou-se sob a tutela de Canjiquinha—consagrado como mestre pelas mãos de seu próprio professor. Nas festas de largo, sua técnica e habilidade chamavam a atenção de todos.\n\nEle também frequentava as rodas na academia de Mestre Pastinha e trabalhava ao lado de Mestre Gato Preto. Em 1963, começou a ensinar na academia de Gato Preto, inicialmente no Engenho Velho da Federação e depois no Mirante do Calabar. Os dois mestres desenvolveram uma relação de trabalho próxima que continuaria por anos.\n\nEm meados dos anos 1960, Paulo dos Anjos levou a capoeira para a ilha de Vera Cruz e Mar Grande. Seu primeiro aluno na Ilha de Itaparica foi Mestre Jaime de Mar Grande, seguido por Mestre Jorge Satélite. A partir de 1985, organizou os "Encontros de Mestre Paulo dos Anjos" anuais na ilha, reuniões que juntavam porções significativas da comunidade capoeirística da Bahia.\n\nNos anos 1970, preocupado com os rumos da Capoeira Angola, Paulo dos Anjos decidiu viajar para São Paulo para transmitir os ensinamentos de seu mestre. Como ele explicou depois: "A situação estava ruim para mim, numa época de maré sem peixe, e um aluno—que treinava boxe comigo e sabia que eu jogava Capoeira—me convidou para ir para São Paulo, e eu fui."\n\nPor cinco anos (1970-1975), morou em São José dos Campos, onde em 15 de agosto de 1975, fundou a Associação de Capoeira Anjos de Angola. Em 1978, conquistou uma grande vitória competitiva: vencendo o campeonato de capoeira no lendário Ginásio do Pacaembu em São Paulo—um triunfo raro para um praticante de Angola no cenário competitivo dominado pela Regional.\n\nEm 1980, Paulo dos Anjos retornou a Salvador. Estabeleceu uma academia no Bairro da Paz (anteriormente chamado Malvinas após a ocupação de terras da Guerra das Malvinas), ensinando no Salão Paroquial da Paz. Combinava seu trabalho com a capoeira com um cargo de funcionário público na prefeitura de Salvador. Nos anos 1980, criou a Associação Cultural de Capoeira Grupo Anjos de Angola Academia, focada na disseminação da cultura afro-brasileira com ênfase na educação sociocultural de crianças, jovens e adultos.\n\nEle também influenciou o movimento de capoeiristas que lutavam por melhores condições de trabalho—uma causa que permaneceria importante ao longo de sua vida.\n\nEm 1984, participou de um grande encontro de capoeira no Rio de Janeiro e assistiu à lavagem da igreja em Pituba. Em 1987, tornou-se vice-presidente da recém-fundada Associação Brasileira de Capoeira Angola (ABCA), com Mestre João Pequeno como presidente. A eleição em 3 de julho de 1987 colocou a chapa "Evolução" no poder, com Paulo dos Anjos, Mário Bom Cabrito (Tesoureiro), Nô (Diretor Técnico) e Renê (Diretor Social) formando a liderança.\n\nNo mesmo ano, participou do I Simpósio Cultural de Capoeira na histórica cidade de Ouro Preto.\n\nEm 1992, Paulo dos Anjos gravou seu álbum "Capoeira Angola da Bahia," preservando seu estilo de canto distintivo. Com sua maneira própria de cantar as músicas de capoeira, era venerado por todos—sua voz descrita como contendo "uma orquestra."\n\nEm uma entrevista de 1995 para "Capoeirando," ele articulou sua filosofia claramente: "Eu sempre fui um angoleiro. Eu nem discuto Regional porque não conheço e não entendo." Mantinha que o respeito era essencial para a capoeira tradicional, distinguindo-a das interpretações modernas onde praticantes mais jovens às vezes desafiavam mestres baseados apenas na habilidade física.\n\nMestre Paulo dos Anjos faleceu em 26 de março de 1999, em Salvador, vítima de uma infecção contraída após cirurgia em um hospital local. Sua morte representou uma perda irreparável para a Capoeira Angola.\n\nSeu legado vive através de seus alunos—muitos dos quais se tornaram mestres com suas próprias academias ao redor do mundo—incluindo Virgílio do Retiro, Jaime de Mar Grande, Jorge Satélite, Pássaro Preto, Amâncio, Neguinho, Renê, Alfredo, Djalma, Galego, Mala, Josias, Cabeção, Jequié, Feijão, Vital e Al Capone.\n\nEm 5 de junho de 2005, o Colégio Estadual Mestre Paulo dos Anjos foi estabelecido no Bairro da Paz, Salvador—homenageando o mestre como educador por seu trabalho em valorizar a capoeira como expressão cultural brasileira. Em 2024, o documentário "Dessa arte eu sei um pouco," dirigido pelo capoeirista e cineasta Cled Pereira, estreou, apresentando depoimentos dos Mestres Jaime de Mar Grande, Jorge Satélite e Renê Bittencourt prestando homenagem ao seu antigo mestre.',
  E'1957: Graduated as mestre under Canjiquinha\n1963: Began teaching at Mestre Gato Preto''s academy (Engenho Velho da Federação, Mirante do Calabar)\n1965: Introduced capoeira to Itaparica Island (Vera Cruz, Mar Grande); first student Mestre Jaime de Mar Grande\n1975: Founded Associação de Capoeira Anjos de Angola in São José dos Campos (August 15)\n1978: Won capoeira championship at Ginásio do Pacaembu, São Paulo\n1980s: Created Associação Cultural de Capoeira Grupo Anjos de Angola Academia in Salvador\n1985+: Organized annual Encontro de Mestre Paulo dos Anjos on Itaparica Island\n1987: Elected Vice-President of ABCA with João Pequeno as President (July 3)\n1987: Participated in I Cultural Capoeira Symposium in Ouro Preto\n1992: Recorded album "Capoeira Angola da Bahia"\n2005: Colégio Estadual Mestre Paulo dos Anjos established in his honor (June 5)\n2024: Documentary "Dessa arte eu sei um pouco" premiered, directed by Cled Pereira',
  E'1957: Graduado como mestre por Canjiquinha\n1963: Começou a ensinar na academia de Mestre Gato Preto (Engenho Velho da Federação, Mirante do Calabar)\n1965: Introduziu a capoeira na Ilha de Itaparica (Vera Cruz, Mar Grande); primeiro aluno Mestre Jaime de Mar Grande\n1975: Fundou a Associação de Capoeira Anjos de Angola em São José dos Campos (15 de agosto)\n1978: Venceu o campeonato de capoeira no Ginásio do Pacaembu, São Paulo\n1980s: Criou a Associação Cultural de Capoeira Grupo Anjos de Angola Academia em Salvador\n1985+: Organizou o Encontro anual de Mestre Paulo dos Anjos na Ilha de Itaparica\n1987: Eleito Vice-Presidente da ABCA com João Pequeno como Presidente (3 de julho)\n1987: Participou do I Simpósio Cultural de Capoeira em Ouro Preto\n1992: Gravou o álbum "Capoeira Angola da Bahia"\n2005: Colégio Estadual Mestre Paulo dos Anjos estabelecido em sua homenagem (5 de junho)\n2024: Documentário "Dessa arte eu sei um pouco" estreou, dirigido por Cled Pereira',
  E'BIRTH: August 15, 1936 in Estância, Sergipe - confirmed by multiple sources (Velhos Mestres, Lalaue, Esquiva, Capoeira Online, Wikipedia PT)\n\nDEATH: March 26, 1999 in Salvador, Bahia - died from hospital-acquired infection following surgery\n\nNAME: José Paulo dos Anjos (also called "Paulo dos Anjos" without "José")\nNOTE: Do NOT confuse with Paulo dos Santos, who is Mestre Limão (different person, 1945-1985).\n\nTEACHERS:\n- Mestre Canjiquinha (primary, 1950-1957, graduated under him)\n- Mestre Gato Preto (collaborated, taught at his academy from 1963)\n- Frequented Mestre Pastinha''s academy rodas\n\nSTUDENTS:\n- Mestre Virgílio do Retiro (became ABCA president)\n- Mestre Jaime de Mar Grande (first student on Itaparica, ~1965)\n- Mestre Jorge Satélite\n- Mestre Pássaro Preto\n- Mestre Renê (Renê Bittencourt, later ABCA Social Director)\n- Mestre Amâncio\n- Mestre Neguinho\n- Mestre Alfredo\n- Mestre Djalma\n- Mestre Galego\n- Mestre Mala\n- Mestre Josias\n- Mestre Cabeção\n- Mestre Jequié\n- Mestre Feijão\n- Mestre Vital\n- Mestre Al Capone\n\nABCA 1987 ELECTION (July 3, A Tarde newspaper):\n- João Pequeno: President\n- Paulo dos Anjos: Vice-President\n- Mário Bom Cabrito: Treasurer\n- Nô: Technical Director\n- Renê: Social Director\nTicket name: "Evolução"\n\nRECORDINGS:\n- 1992: Album "Capoeira Angola da Bahia" (6 songs, 29 min; available on Apple Music, SoundCloud)\n\nMEDIA APPEARANCES:\n- 1995: Interview with "Capoeirando"\n- 2024: Documentary "Dessa arte eu sei um pouco" (dir. Cled Pereira, 80 min) - tribute featuring Mestres Jaime de Mar Grande, Jorge Satélite, Renê Bittencourt\n\nINSTITUTIONAL LEGACY:\n- Colégio Estadual Mestre Paulo dos Anjos: public school in Bairro da Paz, Salvador; established June 5, 2005; new building inaugurated 2012 by Governor Jaques Wagner (R$ 6.5 million investment); serves predominantly Black students from vulnerable community of ~85,000 people\n\nGROUPS FOUNDED:\n- Associação de Capoeira Anjos de Angola (Aug 15, 1975, São José dos Campos)\n- Associação Cultural de Capoeira Grupo Anjos de Angola Academia (1980s, Bairro da Paz/Malvinas, Salvador)\n\nEMPLOYMENT:\n- Civil servant at Salvador city hall (Prefeitura de Salvador)\n\nKEY QUOTES:\n- "For me, nothing changed. I continue making Capoeira Angola according to tradition."\n- "I have always been an angoleiro. I don''t even discuss Regional because I don''t know it and don''t understand it."\n- On razor combat stories: "fantasy to deceive silly children"\n\nSINGING STYLE:\n- Described as having "an orchestra in his throat"\n- Unique vocal style with traditional capoeira melodies\n\nBOXING BACKGROUND:\n- Established reputation as promising boxer by age 14 (1950)\n- Later had students who trained boxing with him',
  E'NASCIMENTO: 15 de agosto de 1936 em Estância, Sergipe - confirmado por múltiplas fontes (Velhos Mestres, Lalaue, Esquiva, Capoeira Online, Wikipedia PT)\n\nMORTE: 26 de março de 1999 em Salvador, Bahia - morreu de infecção hospitalar após cirurgia\n\nNOME: José Paulo dos Anjos (também chamado "Paulo dos Anjos" sem "José")\nNOTA: NÃO confundir com Paulo dos Santos, que é Mestre Limão (pessoa diferente, 1945-1985).\n\nMESTRES:\n- Mestre Canjiquinha (principal, 1950-1957, graduado por ele)\n- Mestre Gato Preto (colaboração, ensinou em sua academia a partir de 1963)\n- Frequentava as rodas da academia de Mestre Pastinha\n\nALUNOS:\n- Mestre Virgílio do Retiro (tornou-se presidente da ABCA)\n- Mestre Jaime de Mar Grande (primeiro aluno em Itaparica, ~1965)\n- Mestre Jorge Satélite\n- Mestre Pássaro Preto\n- Mestre Renê (Renê Bittencourt, depois Diretor Social da ABCA)\n- Mestre Amâncio\n- Mestre Neguinho\n- Mestre Alfredo\n- Mestre Djalma\n- Mestre Galego\n- Mestre Mala\n- Mestre Josias\n- Mestre Cabeção\n- Mestre Jequié\n- Mestre Feijão\n- Mestre Vital\n- Mestre Al Capone\n\nELEIÇÃO ABCA 1987 (3 de julho, jornal A Tarde):\n- João Pequeno: Presidente\n- Paulo dos Anjos: Vice-Presidente\n- Mário Bom Cabrito: Tesoureiro\n- Nô: Diretor Técnico\n- Renê: Diretor Social\nNome da chapa: "Evolução"\n\nGRAVAÇÕES:\n- 1992: Álbum "Capoeira Angola da Bahia" (6 músicas, 29 min; disponível no Apple Music, SoundCloud)\n\nAPARIÇÕES NA MÍDIA:\n- 1995: Entrevista para "Capoeirando"\n- 2024: Documentário "Dessa arte eu sei um pouco" (dir. Cled Pereira, 80 min) - homenagem com Mestres Jaime de Mar Grande, Jorge Satélite, Renê Bittencourt\n\nLEGADO INSTITUCIONAL:\n- Colégio Estadual Mestre Paulo dos Anjos: escola pública no Bairro da Paz, Salvador; estabelecido 5 de junho de 2005; novo prédio inaugurado 2012 pelo Governador Jaques Wagner (investimento de R$ 6,5 milhões); atende predominantemente estudantes negros de comunidade vulnerável de ~85.000 pessoas\n\nGRUPOS FUNDADOS:\n- Associação de Capoeira Anjos de Angola (15 ago 1975, São José dos Campos)\n- Associação Cultural de Capoeira Grupo Anjos de Angola Academia (anos 1980, Bairro da Paz/Malvinas, Salvador)\n\nEMPREGO:\n- Funcionário público na prefeitura de Salvador\n\nCITAÇÕES IMPORTANTES:\n- "Para mim, nada mudou. Eu continuo fazendo Capoeira Angola conforme a tradição."\n- "Eu sempre fui um angoleiro. Eu nem discuto Regional porque não conheço e não entendo."\n- Sobre histórias de combate com navalha: "fantasia para enganar crianças bobas"\n\nESTILO DE CANTO:\n- Descrito como tendo "uma orquestra na garganta"\n- Estilo vocal único com melodias tradicionais de capoeira\n\nHISTÓRICO DE BOXE:\n- Estabeleceu reputação como boxeador promissor aos 14 anos (1950)\n- Depois teve alunos que treinavam boxe com ele'
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

-- Source: entities/persons/pele-da-bomba.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Pelé da Bomba
-- Generated: 2026-01-02
-- ============================================================
-- The "Gogó de Ouro" (Golden Throat) of Bahia. Born Dec 25, 1934
-- in Cipoá district, Governador Mangabeira, Bahia. Died Oct 26, 2024.
-- Student of Bugalho from 1946 at the Mercado Modelo ramp.
-- Recognized as mestre at age 24 (1958). Taught at Army, Fire Dept,
-- Military Police. Member of ABCA Council of Masters. Published
-- book "O Pelé da Capoeira" (2010), recorded 3 CDs and 1 DVD.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Natalício Neves da Silva',
  'Pelé da Bomba',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'http://velhosmestres.com/br/destaques-20',
    'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/mestre-pele-o-gogo-de-ouro-da-bahia/',
    'https://esquiva.wordpress.com/mestres/mestre-pele-da-bomba/',
    'https://capoeiradabahia.webnode.com.br/mestre-pele-da-bomba/'
  ]::text[],
  'angola'::genealogy.style,
  E'Pelé da Bomba was renowned for his exceptional singing voice, unanimously earning the title "Gogó de Ouro" (Golden Throat) of Bahia. He followed the tradition of his teacher Bugalho, emphasizing that "everything flows from ginga" and that ginga, molejo (fluidity), and flexibility are essential for both defense and attack. He advocated for Capoeira Angola as popular culture rather than martial art.',
  E'Pelé da Bomba era renomado por sua excepcional voz de canto, ganhando unanimemente o título de "Gogó de Ouro" da Bahia. Seguiu a tradição de seu mestre Bugalho, enfatizando que "tudo sai da ginga" e que ginga, molejo e flexibilidade são essenciais tanto para defesa quanto para ataque. Defendia a Capoeira Angola como cultura popular em vez de arte marcial.',
  1934, 'exact'::genealogy.date_precision, 'Cipoá, Governador Mangabeira, Bahia, Brazil',
  2024, 'exact'::genealogy.date_precision, 'Salvador, Bahia, Brazil',
  E'Natalício Neves da Silva was born on Christmas Day, December 25, 1934, in the district of Cipoá in the municipality of Governador Mangabeira, deep in Bahia''s Recôncavo region. The son of Cosme Neves and Isaura, young Natalício learned early the hard work of survival—making charcoal, harvesting cassava, and working the land alongside his father.\n\nAt twelve years old, Natalício began selling merchandise in Salvador''s capital markets. This brought him to the ramp of the old Mercado Modelo, near the church of Nossa Senhora da Conceição da Praia, where he encountered the legendary capoeiristas of old Bahia. There he met Mestre Bugalho, a dock worker who would become his teacher. During rest hours and on moonlit nights, Bugalho taught the young boy to gingar on the sands of Praia da Preguiça. "Segui a tradição do meu mestre, Bugalho," Pelé would later say, "um grande tocador de berimbau. Ele era um dos melhores." (I followed my master''s tradition, Bugalho, a great berimbau player. He was one of the best.)\n\nNatalício frequented the legendary rodas of the era: Mestre Waldemar''s palm-thatched barracão in Pero Vaz (Corta Braço), the Sunday afternoon rodas directed by Zacarias Boa Morte, and the festivals of Nossa Senhora da Conceição and Santa Luzia. When he arrived at Waldemar''s barracão, the mestre would greet him: "Lá vem Satanás!" (Here comes Satan!). Among the bambas of that golden generation were Waldemar da Liberdade, Caiçara, Traíra, Onça Preta, Sete Mola, Cabelo Bom and Bom Cabelo (the twins), Angolinha, Avani, and Bel and Del.\n\nAt 24 years old, in 1958, Natalício was recognized as a mestre—at a time when the people themselves granted capoeiristas the title of mestre. His nickname "da Bomba" came from his membership in the Fire Department (Corpo de Bombeiros). Beginning in 1959, he taught classes in the Army (Região Companhia do QG), and from 1966 at the Fire Department and Military Police. "In those times, it was common for police to train capoeira," he recalled.\n\nFor 25 years, Pelé da Bomba taught capoeira while participating in important Bahian folklore groups. He joined Viva Bahia, founded by ethnomusicologist Emília Biancardi in 1962, and performed with Mestre Canjiquinha''s group at the Belvedere da Praça da Sé, showcasing capoeira, maculelê, puxada de rede (net pulling), and samba de roda to tourists. He performed at Bahia''s great festas de largo: Conceição da Praia, Boa Viagem, and the Lavagem do Bomfim.\n\nIn January 1964, photographer H. Rautavaara documented Pelé da Bomba at the Segunda-Feira Gorda celebration in Ribeira, capturing him in photographs and video—wearing a red berimbau, a gold cap, and a cigarette in his mouth.\n\nAround 1981, illness forced Pelé to step back from teaching. Nearly twenty years later, the Associação Brasileira de Capoeira Angola (ABCA) brought him back through their initiative to rescue the old masters. He served on ABCA''s Council of Masters and later became president of the organization. He operated the Academia de Capoeira Angola at the Forte de Santo Antônio Além do Carmo in Salvador''s historic center.\n\nIn 2003, Pelé participated in the recording of the CD "Lenço de Seda - Antologia de Ladainhas e Corridos." He would go on to record three CDs and one DVD, documenting his remarkable voice for posterity. In 2010, he published his autobiography "O Pelé da Capoeira," launched at the Forte de Santo Antônio Além do Carmo.\n\nThe Faculdade Dom Pedro II in Salvador honored him with the title "Notório Saber" (Notable Knowledge) as "Guardian of Afro-descendant Knowledge."\n\nPelé da Bomba carried the memories of capoeira''s golden age. He sang at the funerals and seventh-day masses of his contemporaries—Caiçara, Bom Cabrito, Zacarias Boa Morte—his golden voice marking their passage. He advocated tirelessly for retirement benefits for masters over 65 with 35+ years of practice.\n\nMestre Pelé da Bomba died on October 26, 2024, at age 89. The Bahia Culture Secretary declared: "Pelé da Bomba leaves a significant legacy for Bahian culture." His family described him as "a legend and iconic figure of Capoeira Angola, as well as an essential pillar of Afro-Brazilian culture."',
  E'Natalício Neves da Silva nasceu no dia de Natal, 25 de dezembro de 1934, no distrito de Cipoá, município de Governador Mangabeira, no interior do Recôncavo Baiano. Filho de Cosme Neves e Dona Isaura, o jovem Natalício aprendeu cedo o trabalho duro da sobrevivência—fazendo carvão, colhendo mandioca e trabalhando a terra ao lado do pai.\n\nAos doze anos, Natalício começou a vender mercadorias nos mercados da capital baiana. Isso o trouxe à rampa do antigo Mercado Modelo, perto da igreja de Nossa Senhora da Conceição da Praia, onde encontrou os lendários capoeiristas da velha Bahia. Lá conheceu Mestre Bugalho, um carregador de embarcações que se tornaria seu mestre. Durante as horas de descanso e nas noites de lua, Bugalho ensinava o menino a gingar nas areias da Praia da Preguiça. "Segui a tradição do meu mestre, Bugalho," diria Pelé mais tarde, "um grande tocador de berimbau. Ele era um dos melhores."\n\nNatalício frequentava as lendárias rodas da época: o barracão de palha de Mestre Waldemar em Pero Vaz (Corta Braço), as rodas das tardes de domingo dirigidas por Zacarias Boa Morte, e as festas de Nossa Senhora da Conceição e Santa Luzia. Quando chegava ao barracão de Waldemar, o mestre o cumprimentava: "Lá vem Satanás!". Entre os bambas daquela geração de ouro estavam Waldemar da Liberdade, Caiçara, Traíra, Onça Preta, Sete Mola, Cabelo Bom e Bom Cabelo (os gêmeos), Angolinha, Avani, e Bel e Del.\n\nAos 24 anos, em 1958, Natalício foi reconhecido como mestre—numa época em que era o povo que dava ao capoeirista o título de mestre. Seu apelido "da Bomba" veio de sua filiação ao Corpo de Bombeiros. A partir de 1959, deu aulas no Exército (Região Companhia do QG), e a partir de 1966 no Corpo de Bombeiros e na Polícia Militar. "Naqueles tempos, era comum policial treinar capoeira," recordava.\n\nDurante 25 anos, Pelé da Bomba ensinou capoeira enquanto participava de importantes grupos folclóricos baianos. Integrou o Viva Bahia, fundado pela etnomusicóloga Emília Biancardi em 1962, e se apresentou com o grupo de Mestre Canjiquinha no Belvedere da Praça da Sé, mostrando capoeira, maculelê, puxada de rede e samba de roda para turistas. Apresentou-se nas grandes festas de largo da Bahia: Conceição da Praia, Boa Viagem e Lavagem do Bomfim.\n\nEm janeiro de 1964, o fotógrafo H. Rautavaara documentou Pelé da Bomba na celebração da Segunda-Feira Gorda na Ribeira, capturando-o em fotografias e vídeo—usando um berimbau vermelho, um boné dourado e um cigarro na boca.\n\nPor volta de 1981, uma doença forçou Pelé a se afastar do ensino. Quase vinte anos depois, a Associação Brasileira de Capoeira Angola (ABCA) o trouxe de volta através de sua iniciativa de resgate dos velhos mestres. Ele serviu no Conselho de Mestres da ABCA e posteriormente tornou-se presidente da organização. Operou a Academia de Capoeira Angola no Forte de Santo Antônio Além do Carmo, no centro histórico de Salvador.\n\nEm 2003, Pelé participou da gravação do CD "Lenço de Seda - Antologia de Ladainhas e Corridos." Ele viria a gravar três CDs e um DVD, documentando sua notável voz para a posteridade. Em 2010, publicou sua autobiografia "O Pelé da Capoeira," lançada no Forte de Santo Antônio Além do Carmo.\n\nA Faculdade Dom Pedro II em Salvador o honrou com o título de "Notório Saber" como "Guardião do Conhecimento Afrodescendente."\n\nPelé da Bomba carregava as memórias da era de ouro da capoeira. Cantou nos funerais e missas de sétimo dia de seus contemporâneos—Caiçara, Bom Cabrito, Zacarias Boa Morte—sua voz de ouro marcando a passagem deles. Defendeu incansavelmente benefícios de aposentadoria para mestres acima de 65 anos com mais de 35 anos de prática.\n\nMestre Pelé da Bomba morreu em 26 de outubro de 2024, aos 89 anos. A Secretaria de Cultura da Bahia declarou: "Pelé da Bomba deixa um legado significativo para a cultura baiana." Sua família o descreveu como "uma lenda e figura icônica da Capoeira Angola, bem como um pilar essencial da cultura afro-brasileira."',
  E'- Unanimously recognized as "Gogó de Ouro" (Golden Throat) of Bahia for his exceptional singing voice\n- Recognized as mestre in 1958 at age 24\n- Taught capoeira for 25 years at Army, Fire Department, and Military Police\n- Member of folkloric group Viva Bahia (Emília Biancardi)\n- Performed with Mestre Canjiquinha''s group at Praça da Sé\n- President of ABCA (Associação Brasileira de Capoeira Angola)\n- Member of ABCA Council of Masters\n- Published autobiography "O Pelé da Capoeira" (2010)\n- Recorded 3 CDs and 1 DVD\n- Participated in CD "Lenço de Seda - Antologia de Ladainhas e Corridos" (2003)\n- Received "Notório Saber" (Notable Knowledge) title from Faculdade Dom Pedro II as "Guardian of Afro-descendant Knowledge"\n- Photographed and filmed by H. Rautavaara at Ribeira celebration (January 1964)\n- Operated Academia de Capoeira Angola at Forte de Santo Antônio Além do Carmo',
  E'- Unanimemente reconhecido como "Gogó de Ouro" da Bahia por sua excepcional voz de canto\n- Reconhecido como mestre em 1958 aos 24 anos\n- Ensinou capoeira por 25 anos no Exército, Corpo de Bombeiros e Polícia Militar\n- Membro do grupo folclórico Viva Bahia (Emília Biancardi)\n- Apresentou-se com o grupo de Mestre Canjiquinha na Praça da Sé\n- Presidente da ABCA (Associação Brasileira de Capoeira Angola)\n- Membro do Conselho de Mestres da ABCA\n- Publicou autobiografia "O Pelé da Capoeira" (2010)\n- Gravou 3 CDs e 1 DVD\n- Participou do CD "Lenço de Seda - Antologia de Ladainhas e Corridos" (2003)\n- Recebeu título de "Notório Saber" da Faculdade Dom Pedro II como "Guardião do Conhecimento Afrodescendente"\n- Fotografado e filmado por H. Rautavaara na celebração de Ribeira (janeiro de 1964)\n- Operou a Academia de Capoeira Angola no Forte de Santo Antônio Além do Carmo',
  E'NICKNAME ORIGIN:\n"da Bomba" comes from his membership in the Fire Department (Corpo de Bombeiros).\n\nTEACHERS:\n- Mestre Bugalho - Primary teacher from 1946 at Mercado Modelo ramp and Praia da Preguiça; dock worker who taught on moonlit nights\n\nSTUDENTS:\n- Mestre Índio (Manoel Olímpio de Souza, 1955-) - Student who Pelé told "You can go into the world, you are a Master of Capoeira"; founded Grupo de Capoeira Oxóssi; pioneer of capoeira in Rio Grande do Sul\n\nMEDIA APPEARANCES:\n- January 1964: Photographed and filmed by H. Rautavaara at Segunda-Feira Gorda celebration, Ribeira (red berimbau, gold cap, cigarette)\n- 2003: CD "Lenço de Seda - Antologia de Ladainhas e Corridos"\n- 2010: Book "O Pelé da Capoeira" autobiography\n- 3 CDs and 1 DVD (titles unknown)\n\nRODA LOCATIONS:\n- Mercado Modelo ramp, near Igreja Nossa Senhora da Conceição da Praia, Salvador\n- Praia da Preguiça, Salvador\n- Barracão de Waldemar, Pero Vaz/Corta Braço, Liberdade, Salvador\n- Sunday rodas directed by Zacarias Boa Morte\n- Festas de largo: Conceição da Praia, Boa Viagem, Lavagem do Bomfim\n\nTEACHING POSITIONS:\n- 1959: Army (Região Companhia do QG)\n- 1966: Fire Department (Corpo de Bombeiros)\n- 1966: Military Police\n- ~2001+: Academia de Capoeira Angola at Forte de Santo Antônio Além do Carmo\n\nCONTEMPORARIES PHOTOGRAPHED WITH (per velhosmestres.com):\nMestre Mala, Mestre Valdec, Mestre Bom Cabrito, Mestre Gildo Alfinete, Mestre Barba Branca, Mestre Boa Gente, Mestre Moa do Katendê, Mestre Pelé do Tonel, Mestre Nó, Mestre Zé do Lenço, Mestre Boca Rica, Mestre Curió, Mestre Bigodinho, Mestre Gato Preto, Mestre João Pequeno, Mestre Gigante, Mestre Waldomiro Malvadeza, Mestre Raimundo Natividade\n\nHIATUS:\n~1981-2001: Stopped teaching due to illness; brought back by ABCA''s master rescue initiative',
  E'ORIGEM DO APELIDO:\n"da Bomba" vem de sua filiação ao Corpo de Bombeiros.\n\nMESTRES:\n- Mestre Bugalho - Mestre principal desde 1946 na rampa do Mercado Modelo e Praia da Preguiça; carregador de embarcações que ensinava em noites de lua\n\nALUNOS:\n- Mestre Índio (Manoel Olímpio de Souza, 1955-) - Aluno a quem Pelé disse "Pode ir pelo mundo, você é um Mestre de Capoeira"; fundou o Grupo de Capoeira Oxóssi; pioneiro da capoeira no Rio Grande do Sul\n\nAPARIÇÕES NA MÍDIA:\n- Janeiro de 1964: Fotografado e filmado por H. Rautavaara na celebração da Segunda-Feira Gorda, Ribeira (berimbau vermelho, boné dourado, cigarro)\n- 2003: CD "Lenço de Seda - Antologia de Ladainhas e Corridos"\n- 2010: Livro "O Pelé da Capoeira" autobiografia\n- 3 CDs e 1 DVD (títulos desconhecidos)\n\nLOCAIS DE RODA:\n- Rampa do Mercado Modelo, perto da Igreja Nossa Senhora da Conceição da Praia, Salvador\n- Praia da Preguiça, Salvador\n- Barracão de Waldemar, Pero Vaz/Corta Braço, Liberdade, Salvador\n- Rodas de domingo dirigidas por Zacarias Boa Morte\n- Festas de largo: Conceição da Praia, Boa Viagem, Lavagem do Bomfim\n\nPOSIÇÕES DE ENSINO:\n- 1959: Exército (Região Companhia do QG)\n- 1966: Corpo de Bombeiros\n- 1966: Polícia Militar\n- ~2001+: Academia de Capoeira Angola no Forte de Santo Antônio Além do Carmo\n\nCONTEMPORÂNEOS FOTOGRAFADOS JUNTOS (conforme velhosmestres.com):\nMestre Mala, Mestre Valdec, Mestre Bom Cabrito, Mestre Gildo Alfinete, Mestre Barba Branca, Mestre Boa Gente, Mestre Moa do Katendê, Mestre Pelé do Tonel, Mestre Nó, Mestre Zé do Lenço, Mestre Boca Rica, Mestre Curió, Mestre Bigodinho, Mestre Gato Preto, Mestre João Pequeno, Mestre Gigante, Mestre Waldomiro Malvadeza, Mestre Raimundo Natividade\n\nHIATO:\n~1981-2001: Parou de ensinar devido a doença; trazido de volta pela iniciativa de resgate de mestres da ABCA'
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

-- Source: entities/persons/pinatti.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Pinatti
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH DATE: April 13, 1930 (exact)
-- Multiple sources confirm: Wiki Urucungo, Portal Capoeira, Tucumã Brasil
-- Birthplace: Orlândia, São Paulo (interior)
-- One of few native paulistas among early São Paulo capoeira pioneers
--
-- DEATH DATE: Unknown
-- As of April 13, 2010, he celebrated 80th birthday with 80 consecutive matches
-- Sources as of 2012-2015 still reference him as active
-- If alive in 2026, he would be 95-96 years old
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  -- Identity
  'Djamir Furtado Pinatti',
  'Pinatti',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-pinatti',
    'https://portalcapoeira.com/capoeira/eventos-agenda/mestre-pinatti-80-voltas-ao-mundo/',
    'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/'
  ]::text[],
  -- Style
  'mixed'::genealogy.style,
  E'Mestre Pinatti developed a unique path to capoeira—he first learned from Lamartine Pereira da Costa''s pioneering 1962 book "Capoeira sem Mestre" (Capoeira Without a Master), then consolidated his training under Mestre Zé de Freitas at the CMTC Club. Before capoeira, he had achieved black belt in Shotokan Karate (first class of masters in Latin America) and was a bodybuilder. In 1969, he co-founded Academia São Bento Pequeno with Mestres Limão and Paulão, promoting "Capoeira Angolinha"—an eclectic style bridging Regional and Angola. He advocates for "Capoeira Democrática" (Democratic Capoeira), emphasizing free learning and personal development.',
  E'Mestre Pinatti desenvolveu um caminho único para a capoeira—primeiro aprendeu com o livro pioneiro de Lamartine Pereira da Costa de 1962 "Capoeira sem Mestre", depois consolidou seu treinamento com Mestre Zé de Freitas no Clube CMTC. Antes da capoeira, havia alcançado faixa preta em Karatê Shotokan (primeira turma de mestres da América Latina) e era fisiculturista. Em 1969, co-fundou a Academia São Bento Pequeno com os Mestres Limão e Paulão, promovendo "Capoeira Angolinha"—um estilo eclético entre Regional e Angola. Ele defende a "Capoeira Democrática", enfatizando aprendizado livre e desenvolvimento pessoal.',
  -- Birth
  1930, 'exact'::genealogy.date_precision, 'Orlândia, São Paulo, Brazil',
  -- Death (unknown)
  NULL, NULL::genealogy.date_precision, NULL,
  -- bio_en
  E'Djamir Furtado Pinatti was born on April 13, 1930, in Orlândia, in the interior of São Paulo state—making him one of the rare native paulistas among the early pioneers of São Paulo capoeira, which was dominated by Bahian migrants. His Italian-Brazilian heritage earned him the description "mestre ítalo-brasileiro" in capoeira circles. In 1935, at age five, his family moved to São Paulo city, where he lived in Brás and then Bixiga before settling in Vila Mariana in 1942, where he would maintain his capoeira work for decades.

Pinatti''s athletic journey began far from capoeira. In 1948, at age 18, he was a semi-professional soccer player in the south zone of São Paulo. Through the 1950s and 60s, at the height of the bodybuilding era in Brazil, he became a competitive weightlifter. During this same period, he achieved a black belt in Shotokan Karate, becoming part of the first class of karate masters trained in Latin America.

In 1962, Pinatti discovered capoeira through an unusual path—Lamartine Pereira da Costa''s pioneering book "Capoeira sem Mestre" (Capoeira Without a Master). Self-teaching from this text, he began studying and teaching capoeira movements while simultaneously instructing karate. Around this time, he met Mestre Suassuna and the two began training together.

His capoeira training was consolidated under Mestre Zé de Freitas, who taught at the CMTC Club (Companhia Municipal de Transportes Coletivos). Zé de Freitas''s classes served as a crucial meeting point for São Paulo''s burgeoning capoeira community, and through him Pinatti—one of the few native paulistas—connected with the larger community of Bahian capoeiristas who had migrated to the industrial capital. He began frequenting the famous rodas at Praça da República, where the cream of São Paulo capoeira gathered from the 1950s through the early 1980s.

Pinatti was one of the creators of the Academia de Capoeira Regional de Elite de São Paulo—an early formal training center for the art. On August 1, 1969, he co-founded the Academia de Capoeira São Bento Pequeno with Mestres Limão and Paulão—the famous "three Ps" (Pinatti, Paulão, Paulo Limão). This academy became notable for its "Capoeira Angolinha" style, an eclectic approach bridging Regional and Angola. The academy developed an innovative graduation system using pants colors instead of cordas: black for novice, green for baptized, yellow for intermediate, blue for advanced, and white for the Master. The academy was located at Rua do Vergueiro 2684, near the Ana Rosa metro station.

In 1971, when Mestre Bimba visited São Paulo at the invitation of Mestre Onça, Bimba symbolically recognized a group of nine mestres as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo)—the famous "Grupo dos Nove" (Group of Nine). Pinatti was among these nine: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Zé de Freitas, Onça, and himself.

On July 14, 1974, Pinatti became one of six founding mestres of the Federação Paulista de Capoeira—the first capoeira federation in the world. The other founders were Comendador Airton Neves Moura (Mestre Onça), Mestre Mello, Prof. Mestre Gladson de Oliveira Silva, Mestre Edson Luiz Polim, and Mestre José Andrade. Eight associations formed the federation''s base: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã, and Mestre Zé de Freitas''s academy. Pinatti served as president of the federation during the 1970s, organizing various state and national championships. In 1975, he organized the first São Paulo State Championship, structured by weight categories.

Beyond competition organization, Pinatti became the author of the first capoeira magazine in Brazil, titled simply "Capoeira," which circulated during the 1980s. The magazine featured on its cover Mestres Borracha and Paulinho Baraúna, along with photos of many athletes of the era. In his personal archive, Pinatti maintains precious documents of São Paulo and broader Brazilian capoeira history—it is impossible to know the complete history of the Federação Paulista de Capoeira without consulting his collection.

Pinatti also participated in Brazilian cinema, appearing in the film "Se meu dólar falasse" (1970) with comedy legends Dercy Gonçalves and Grande Otelo—a testimony to capoeira''s growing visibility in Brazilian popular culture.

Through his academy, Mestre Pinatti trained more than 180 students across seven generations, who are now spread throughout Brazil and abroad. His teaching philosophy emphasizes "Capoeira Democrática"—a system of free learning that guides students to find their own limits and personal aspirations. This makes São Bento Pequeno a versatile academy where capoeiristas of both sexes, different ideals, and various age groups come together.

In a song by Mestre Limão, he sings that "Pinatti é da Bahia" (Pinatti is from Bahia)—but this is poetic license or perhaps a tribute to how fully Pinatti integrated himself into the Bahian capoeira community despite his paulista origins.

On April 13, 2010, the internationally known Mestre Pinatti celebrated his 80th birthday at the Terreiro de São Bento Pequeno in São Paulo. To mark the occasion, he performed 80 consecutive capoeira matches with invited guests—some playful (malandragem), some serious (jogo mesmo). This event, titled "Mestre Pinatti 80 Voltas ao Mundo" (80 Turns Around the World), celebrated roughly half a century of his dedication to capoeira.',
  -- bio_pt
  E'Djamir Furtado Pinatti nasceu em 13 de abril de 1930, em Orlândia, no interior do estado de São Paulo—tornando-o um dos raros paulistas nativos entre os primeiros pioneiros da capoeira paulista, que era dominada por migrantes baianos. Sua herança ítalo-brasileira lhe rendeu a descrição de "mestre ítalo-brasileiro" nos círculos da capoeira. Em 1935, aos cinco anos, sua família mudou-se para a cidade de São Paulo, onde ele morou no Brás e depois no Bixiga antes de se estabelecer na Vila Mariana em 1942, onde manteria seu trabalho de capoeira por décadas.

A jornada atlética de Pinatti começou longe da capoeira. Em 1948, aos 18 anos, foi jogador de futebol semi-profissional na zona sul de São Paulo. Durante os anos 1950 e 60, no auge da era do fisiculturismo no Brasil, tornou-se halterofilista competitivo. Durante este mesmo período, alcançou a faixa preta em Karatê Shotokan, integrando a primeira turma de mestres de karatê formados na América Latina.

Em 1962, Pinatti descobriu a capoeira por um caminho incomum—o livro pioneiro de Lamartine Pereira da Costa "Capoeira sem Mestre". Autodidata por este texto, começou a estudar e ensinar movimentos de capoeira enquanto simultaneamente ensinava karatê. Nessa época, conheceu Mestre Suassuna e os dois começaram a treinar juntos.

Seu treinamento de capoeira foi consolidado com Mestre Zé de Freitas, que ensinava no Clube CMTC (Companhia Municipal de Transportes Coletivos). As aulas de Zé de Freitas serviram como ponto de encontro crucial para a crescente comunidade de capoeira de São Paulo, e através dele Pinatti—um dos poucos paulistas nativos—conectou-se com a maior comunidade de capoeiristas baianos que haviam migrado para a capital industrial. Começou a frequentar as famosas rodas na Praça da República, onde a nata da capoeira paulista se reunia dos anos 1950 até o início dos anos 1980.

Pinatti foi um dos criadores da Academia de Capoeira Regional de Elite de São Paulo—um dos primeiros centros formais de treinamento da arte. Em 1° de agosto de 1969, co-fundou a Academia de Capoeira São Bento Pequeno com os Mestres Limão e Paulão—os famosos "três Pês" (Pinatti, Paulão, Paulo Limão). Esta academia tornou-se notável por seu estilo "Capoeira Angolinha", uma abordagem eclética entre Regional e Angola. A academia desenvolveu um sistema inovador de graduação usando cores de calças em vez de cordas: preta para novato, verde para batizado, amarela para intermediário, azul para avançado e branca para o Mestre. A academia ficava na Rua do Vergueiro 2684, próximo ao metrô Ana Rosa.

Em 1971, quando Mestre Bimba visitou São Paulo a convite de Mestre Onça, Bimba reconheceu simbolicamente um grupo de nove mestres como os "Percursores da Capoeira em São Paulo"—o famoso "Grupo dos Nove". Pinatti estava entre estes nove: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Zé de Freitas, Onça e ele próprio.

Em 14 de julho de 1974, Pinatti tornou-se um dos seis mestres fundadores da Federação Paulista de Capoeira—a primeira federação de capoeira do mundo. Os outros fundadores foram Comendador Airton Neves Moura (Mestre Onça), Mestre Mello, Prof. Mestre Gladson de Oliveira Silva, Mestre Edson Luiz Polim e Mestre José Andrade. Oito associações formaram a base da federação: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã e a academia de Mestre Zé de Freitas. Pinatti serviu como presidente da federação durante os anos 1970, organizando diversos campeonatos estaduais e nacionais. Em 1975, organizou o primeiro Campeonato Estadual de São Paulo, estruturado por categorias de peso.

Além de organizar competições, Pinatti tornou-se autor da primeira revista de capoeira do Brasil, intitulada simplesmente "Capoeira", que circulou durante os anos 1980. A revista teve em sua capa os Mestres Borracha e Paulinho Baraúna, além de fotos de muitos atletas da época. Em seu acervo pessoal, Pinatti mantém documentos preciosos da história da capoeira paulista e brasileira—é impossível conhecer a história completa da Federação Paulista de Capoeira sem consultar sua coleção.

Pinatti também participou do cinema brasileiro, aparecendo no filme "Se meu dólar falasse" (1970) com as lendas da comédia Dercy Gonçalves e Grande Otelo—um testemunho da crescente visibilidade da capoeira na cultura popular brasileira.

Através de sua academia, Mestre Pinatti formou mais de 180 alunos por sete gerações, que agora estão espalhados pelo Brasil e exterior. Sua filosofia de ensino enfatiza a "Capoeira Democrática"—um sistema de aprendizado livre que guia os alunos a encontrar seus próprios limites e aspirações pessoais. Isso torna a São Bento Pequeno uma academia versátil onde capoeiristas de ambos os sexos, diferentes ideais e várias faixas etárias se reúnem.

Em uma música de Mestre Limão, ele canta que "Pinatti é da Bahia"—mas isso é licença poética ou talvez uma homenagem a quão completamente Pinatti se integrou à comunidade baiana de capoeira apesar de suas origens paulistas.

Em 13 de abril de 2010, o internacionalmente conhecido Mestre Pinatti celebrou seu 80° aniversário no Terreiro de São Bento Pequeno em São Paulo. Para marcar a ocasião, realizou 80 jogos consecutivos de capoeira com convidados—alguns na malandragem, outros no jogo mesmo. Este evento, intitulado "Mestre Pinatti 80 Voltas ao Mundo", celebrou cerca de meio século de sua dedicação à capoeira.',
  -- achievements_en
  E'- 1948: Semi-professional soccer player in south zone of São Paulo
- 1950s: Black belt in Shotokan Karate; first class of masters trained in Latin America
- 1950s-60s: Competitive bodybuilder/weightlifter
- 1962: Began learning capoeira from Lamartine Pereira da Costa''s book "Capoeira sem Mestre"
- 1960s: Trained under Mestre Zé de Freitas at CMTC Club; frequented Praça da República rodas
- 1960s: Co-created Academia de Capoeira Regional de Elite de São Paulo
- August 1, 1969: Co-founded Academia de Capoeira São Bento Pequeno with Mestres Limão and Paulão
- 1970: Appeared in film "Se meu dólar falasse" with Dercy Gonçalves and Grande Otelo
- 1971: Recognized by Mestre Bimba as one of "Grupo dos Nove" pioneers of capoeira in São Paulo
- July 14, 1974: Co-founded Federação Paulista de Capoeira (first capoeira federation in the world)
- 1970s: President of Federação Paulista de Capoeira; organized state and national championships
- 1975: Organized first São Paulo State Championship (by weight categories)
- 1980s: Published first Brazilian capoeira magazine "Capoeira"
- 2010: Celebrated 80th birthday with 80 consecutive capoeira matches
- Trained 180+ students across seven generations in Brazil and abroad',
  -- achievements_pt
  E'- 1948: Jogador de futebol semi-profissional na zona sul de São Paulo
- Anos 1950: Faixa preta em Karatê Shotokan; primeira turma de mestres formados na América Latina
- Anos 1950-60: Fisiculturista/halterofilista competitivo
- 1962: Começou a aprender capoeira pelo livro "Capoeira sem Mestre" de Lamartine Pereira da Costa
- Anos 1960: Treinou com Mestre Zé de Freitas no Clube CMTC; frequentou rodas na Praça da República
- Anos 1960: Co-criou Academia de Capoeira Regional de Elite de São Paulo
- 1° de agosto de 1969: Co-fundou Academia de Capoeira São Bento Pequeno com Mestres Limão e Paulão
- 1970: Apareceu no filme "Se meu dólar falasse" com Dercy Gonçalves e Grande Otelo
- 1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
- 14 de julho de 1974: Co-fundou Federação Paulista de Capoeira (primeira federação de capoeira do mundo)
- Anos 1970: Presidente da Federação Paulista de Capoeira; organizou campeonatos estaduais e nacionais
- 1975: Organizou primeiro Campeonato Estadual de São Paulo (por categorias de peso)
- Anos 1980: Publicou primeira revista brasileira de capoeira "Capoeira"
- 2010: Celebrou 80° aniversário com 80 jogos consecutivos de capoeira
- Formou mais de 180 alunos por sete gerações no Brasil e exterior',
  -- notes_en
  E'BIRTH DATE: April 13, 1930 (exact)
- Multiple sources confirm: Wiki Urucungo, Portal Capoeira, Tucumã Brasil
- Birthplace: Orlândia, São Paulo (interior)
- Ítalo-brasileiro (Italian-Brazilian heritage)

DEATH DATE: Unknown
- As of April 13, 2010, celebrated 80th birthday with 80 consecutive matches
- Sources as of 2012-2015 still reference him as active
- If alive in 2026, would be 95-96 years old

NAME:
- Full name: Djamir Furtado Pinatti
- Apelido: Pinatti
- Also called: Mestre Pinatti, Grão Mestre Pinatti, Mestre Djamir Pinatti

UNIQUE ORIGIN NOTE:
- One of few native paulistas among early São Paulo capoeira pioneers
- Most others were Bahian migrants
- In Limão''s song: "Pinatti é da Bahia" (poetic tribute to his integration)

TEACHERS:
- Lamartine Pereira da Costa (via book "Capoeira sem Mestre", 1962) - initial learning
- Mestre Zé de Freitas - consolidated training at CMTC Club, 1960s
- Mestre Suassuna - training partner in early 1960s

STUDENTS:
- 180+ students across seven generations
- Specific names not documented in sources

PRIOR MARTIAL ARTS:
- Black belt in Shotokan Karate (first class in Latin America)
- Bodybuilding/weightlifting competitor

MEDIA APPEARANCES:
- 1970: Film "Se meu dólar falasse" with Dercy Gonçalves and Grande Otelo
- 1980s: Published first capoeira magazine "Capoeira" (featured Borracha, Paulinho Baraúna)

GROUPS FOUNDED/LED:
- Academia de Capoeira Regional de Elite de São Paulo (co-creator, 1960s)
- Academia de Capoeira São Bento Pequeno (co-founder Aug 1, 1969, with Limão and Paulão)
- Federação Paulista de Capoeira (co-founder Jul 14, 1974; president 1970s)

GRUPO DOS NOVE (1971):
- Recognized by Mestre Bimba during his São Paulo visit organized by Mestre Onça
- The nine pioneers: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Zé de Freitas, Onça, Pinatti

FEDERAÇÃO PAULISTA DE CAPOEIRA (July 14, 1974):
- First capoeira federation in the world
- Six founding mestres: Onça (president), Mello, Gladson, Polim, Pinatti, José Andrade
- Eight founding associations: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã, Zé de Freitas''s academy
- Pinatti served as president during 1970s

ARCHIVE:
- Maintains precious archive of São Paulo capoeira history
- Essential for complete history of Federação Paulista de Capoeira

TEACHING PHILOSOPHY:
- "Capoeira Democrática" - free learning, personal development
- "Capoeira Angolinha" - eclectic style between Regional and Angola

ACADEMY LOCATION:
- Rua do Vergueiro 2684, near Ana Rosa metro, Vila Mariana, São Paulo',
  -- notes_pt
  E'DATA DE NASCIMENTO: 13 de abril de 1930 (exata)
- Múltiplas fontes confirmam: Wiki Urucungo, Portal Capoeira, Tucumã Brasil
- Local de nascimento: Orlândia, São Paulo (interior)
- Ítalo-brasileiro (herança italiana-brasileira)

DATA DE FALECIMENTO: Desconhecida
- Em 13 de abril de 2010, celebrou 80° aniversário com 80 jogos consecutivos
- Fontes de 2012-2015 ainda o referenciam como ativo
- Se vivo em 2026, teria 95-96 anos

NOME:
- Nome completo: Djamir Furtado Pinatti
- Apelido: Pinatti
- Também chamado: Mestre Pinatti, Grão Mestre Pinatti, Mestre Djamir Pinatti

NOTA DE ORIGEM ÚNICA:
- Um dos poucos paulistas nativos entre os primeiros pioneiros da capoeira paulista
- A maioria dos outros eram migrantes baianos
- Na música de Limão: "Pinatti é da Bahia" (homenagem poética à sua integração)

MESTRES:
- Lamartine Pereira da Costa (via livro "Capoeira sem Mestre", 1962) - aprendizado inicial
- Mestre Zé de Freitas - consolidou treinamento no Clube CMTC, anos 1960
- Mestre Suassuna - parceiro de treino no início dos anos 1960

ALUNOS:
- Mais de 180 alunos por sete gerações
- Nomes específicos não documentados nas fontes

ARTES MARCIAIS ANTERIORES:
- Faixa preta em Karatê Shotokan (primeira turma na América Latina)
- Competidor de fisiculturismo/halterofilismo

APARIÇÕES NA MÍDIA:
- 1970: Filme "Se meu dólar falasse" com Dercy Gonçalves e Grande Otelo
- Anos 1980: Publicou primeira revista de capoeira "Capoeira" (apresentou Borracha, Paulinho Baraúna)

GRUPOS FUNDADOS/LIDERADOS:
- Academia de Capoeira Regional de Elite de São Paulo (co-criador, anos 1960)
- Academia de Capoeira São Bento Pequeno (co-fundador 1° ago 1969, com Limão e Paulão)
- Federação Paulista de Capoeira (co-fundador 14 jul 1974; presidente anos 1970)

GRUPO DOS NOVE (1971):
- Reconhecido por Mestre Bimba durante sua visita a São Paulo organizada por Mestre Onça
- Os nove pioneiros: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Zé de Freitas, Onça, Pinatti

FEDERAÇÃO PAULISTA DE CAPOEIRA (14 de julho de 1974):
- Primeira federação de capoeira do mundo
- Seis mestres fundadores: Onça (presidente), Mello, Gladson, Polim, Pinatti, José Andrade
- Oito associações fundadoras: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã, academia de Zé de Freitas
- Pinatti serviu como presidente durante anos 1970

ACERVO:
- Mantém acervo precioso da história da capoeira paulista
- Essencial para história completa da Federação Paulista de Capoeira

FILOSOFIA DE ENSINO:
- "Capoeira Democrática" - aprendizado livre, desenvolvimento pessoal
- "Capoeira Angolinha" - estilo eclético entre Regional e Angola

LOCALIZAÇÃO DA ACADEMIA:
- Rua do Vergueiro 2684, próximo ao metrô Ana Rosa, Vila Mariana, São Paulo'
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

-- Source: entities/persons/tabosa.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Tabosa (Hélio Tabosa de Moraes)
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH DATE: February 5, 1947 - verified (IPHAN Capoeira registry)
-- DEATH DATE: Unknown - still active as of 2021 (IPHAN profile)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Hélio Tabosa de Moraes',
  'Tabosa',
  'mestre'::genealogy.title,
  'https://tile.loc.gov/storage-services/master/pnp/ppbd/01100/01121u.tif',
  ARRAY[
    'https://capoeira.iphan.gov.br/user/infor/4725',
    'https://portalcapoeira.com/capoeira/noticias-atualidades/o-filho-de-xango-mestre-tabosa-lanca-seu-livro/',
    'https://www.loc.gov/item/2020638865/'
  ]::text[],
  'regional'::genealogy.style,
  E'Trained under Mestre Arraia and Mestre Onça Tigre in Brasília. Continued Arraia''s teaching philosophy: "ensinamento direto, olho no olho, ginga com ginga" (direct teaching, eye to eye, ginga with ginga)—a hands-on, personal methodology emphasizing physical demonstration over formalized structures. Critiqued violence in capoeira, advocating for dialogue and efficiency over brutality. Studied multiple martial arts (judo, sumo, fencing, karate) but dedicated himself to Capoeira Regional, becoming one of its premier practitioners in the Federal District.',
  E'Treinou com Mestre Arraia e Mestre Onça Tigre em Brasília. Continuou a filosofia de ensino de Arraia: "ensinamento direto, olho no olho, ginga com ginga"—uma metodologia prática e pessoal enfatizando demonstração física sobre estruturas formalizadas. Criticava violência na capoeira, defendendo diálogo e eficiência sobre brutalidade. Estudou várias artes marciais (judô, sumô, esgrima, caratê) mas dedicou-se à Capoeira Regional, tornando-se um de seus praticantes de referência no Distrito Federal.',
  1947,
  'exact'::genealogy.date_precision,
  'Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Hélio Tabosa de Moraes, known as Mestre Tabosa, is one of the foundational figures of capoeira in Brazil''s Federal District. Born on February 5, 1947, he began his professional life as a banker but abandoned that career to become an autonomous educator, following what he called his profession of talent and heart—education.

Before dedicating himself to capoeira, Tabosa studied multiple martial arts including judo (achieving 1st Dan black belt in 1981), sumo, fencing, and karate. In 1964, he began training capoeira in Brasília, a pivotal moment that would define his life''s work. His primary teacher was Mestre Arraia (Aldenor Benjamim), who had trained in Salvador with exposure to both Mestre Bimba and Mestre Pastinha. According to his IPHAN registry, he also trained under Mestre Onça Tigre (Milton Freire de Carvalho), the legendary student of Bimba who had established the first capoeira school in the Federal District that same year.

At the Colégio Elefante Branco, Tabosa trained alongside Cláudio Danadinho (later one of Grupo Senzala''s founding mestres) and Alfredo "Fritz"—friends who would become crucial to capoeira history. In 1965, he introduced capoeira to the University of Brasília (UnB), becoming the first to bring the art to that institution. Mestre Zulu recalls training capoeira with Mestre Tabosa at UnB during the first semester of 1970.

Tabosa embraced Arraia''s teaching method wholeheartedly: "ensinamento direto, olho no olho, ginga com ginga" (direct teaching, eye to eye, ginga with ginga). This hands-on methodology prioritized personal instruction and physical demonstration over commercialized or institutionalized approaches—a philosophy Tabosa would maintain throughout his career as a form of resistance against trends he saw threatening capoeira''s authenticity.

In 1967, 1968, and 1969, Tabosa competed alongside Grupo Senzala at the Berimbau de Ouro competition in Rio de Janeiro—the most prestigious capoeira tournament of the era. With friends Danadinho, Fritz, and Adilson from Brasília, he helped Senzala win three consecutive championships, permanently securing the trophy and establishing the group''s reputation. This achievement earned him the Berimbau de Ouro award, which he described as "the greatest honor for a capoeira master, which perhaps has not been surpassed to this day."

In 1974, Tabosa founded the Academia Tabosa de Capoeira e Ginástica Localizada Brasileira in quadra 505 Sul—the first official capoeira academy in Brasília. This milestone boosted the spread of capoeira practice throughout the Central-West region. Through the Academia Tabosa, he "promoveu a estação primeira da capoeira em Brasília" (promoted capoeira''s first station in Brasília), rapidly becoming the connection linking Brasília to the broader capoeira world.

His students became some of the finest mestres and fitness instructors in the Federal District. According to his IPHAN profile, he has trained 26 mestres, contra-mestres, and instructors. He was responsible for organizing traditional rodas at his academy in the Plano Piloto and at UnB—gatherings that drew capoeiristas from across the region.

In 1988, Mestre Tabosa received a profound honor: Mestre Waldemar da Liberdade, one of the great guardians of capoeira tradition, presented him with a berimbau inscribed "Ás de Ouro 88" (Golden Ace 88) on its verga. This gift, presented during an event in Salvador alongside Mestres Itapoan, Eziquiel, and Luiz Renato, symbolized Waldemar''s recognition of Tabosa''s stature in the capoeira world. Tabosa rediscovered this treasured instrument in 2021, the gourd long deteriorated but the biriba wood rod preserving the testament of their friendship after 33 years.

Recognition followed throughout his career. In 1997, the Federação de Capoeira do Distrito Federal awarded him a diploma of honor as a "Pioneer in the Dissemination of Capoeira in the Federal District." He received the title of Cidadão Honorário da capital da República (Honorary Citizen of the capital of the Republic) from the Câmara Legislativa do Distrito Federal—a recognition shared with his teacher Mestre Onça Tigre.

Tabosa participated in Brazilian cultural life beyond the roda. In 1996, he contributed to the recording of the CD "Tantas Canções" by Muriel Tabb and Paulo André Tavares. In 1997, he appeared in the film "O sonho não acabou" with Lucélia Santos and Miguel Falabella, and acted in "No Coração dos Deuses"—bringing capoeira to cinema audiences.

He was selected as one of 50 mestres to compose the collection of the Museum of the Republic, which hosted the "Capoeira Viva" project to value and promote capoeira as Brazilian cultural heritage. A photograph by André Cypriano of Tabosa playing berimbau outside the National Museum of the Republic in Brasília is now preserved in the Library of Congress in Washington, D.C.—documentation of his significance to both Brazilian and world cultural heritage.

In 2009, Tabosa published his book "Mestre Tabosa O Filho de Xangô" (Mestre Tabosa: The Son of Xangô) through Editora Gráfica Ipiranga—a work filled with historical photographs, diverse subjects, and information that fills a significant gap regarding capoeira history in the Federal District. The title references his spiritual connection to Xangô, the orixá of justice and thunder in Afro-Brazilian religious traditions.

In 2017, at the IV Congresso Brasileiro de Capoeira e Educação, Tabosa was honored alongside Mestre Pombo de Ouro and Mestre Itapoan at the Capoeira Regional Centenary celebration, recognizing his dedication and contribution to capoeira culture.

Now with more than six decades dedicated to Capoeira Regional, Mestre Tabosa remains a legendary figure whose abilities "já viraram lendas da cidade" (have become legends of the city). Despite advancing age, observers note his "undeniable agility"—proof that his "ensinamento direto, olho no olho, ginga com ginga" philosophy has served him well.',
  -- bio_pt
  E'Hélio Tabosa de Moraes, conhecido como Mestre Tabosa, é uma das figuras fundamentais da capoeira no Distrito Federal do Brasil. Nascido em 5 de fevereiro de 1947, iniciou sua vida profissional como bancário mas abandonou essa carreira para se tornar educador autônomo, seguindo o que chamava de sua profissão de talento e coração—a educação.

Antes de se dedicar à capoeira, Tabosa estudou múltiplas artes marciais incluindo judô (alcançando faixa preta 1º Dan em 1981), sumô, esgrima e caratê. Em 1964, começou a treinar capoeira em Brasília, um momento crucial que definiria o trabalho de sua vida. Seu professor principal foi Mestre Arraia (Aldenor Benjamim), que havia treinado em Salvador com exposição tanto a Mestre Bimba quanto a Mestre Pastinha. Segundo seu registro no IPHAN, também treinou com Mestre Onça Tigre (Milton Freire de Carvalho), o lendário aluno de Bimba que havia estabelecido a primeira escola de capoeira no Distrito Federal naquele mesmo ano.

No Colégio Elefante Branco, Tabosa treinou ao lado de Cláudio Danadinho (mais tarde um dos mestres fundadores do Grupo Senzala) e Alfredo "Fritz"—amigos que se tornariam cruciais para a história da capoeira. Em 1965, introduziu a capoeira na Universidade de Brasília (UnB), tornando-se o primeiro a levar a arte para aquela instituição. Mestre Zulu relembra ter treinado capoeira com Mestre Tabosa na UnB durante o primeiro semestre de 1970.

Tabosa abraçou o método de ensino de Arraia completamente: "ensinamento direto, olho no olho, ginga com ginga". Esta metodologia prática priorizava instrução pessoal e demonstração física sobre abordagens comercializadas ou institucionalizadas—uma filosofia que Tabosa manteria ao longo de sua carreira como forma de resistência contra tendências que via ameaçando a autenticidade da capoeira.

Em 1967, 1968 e 1969, Tabosa competiu ao lado do Grupo Senzala na competição Berimbau de Ouro no Rio de Janeiro—o torneio de capoeira mais prestigioso da época. Com os amigos Danadinho, Fritz e Adilson de Brasília, ajudou a Senzala a vencer três campeonatos consecutivos, assegurando permanentemente o troféu e estabelecendo a reputação do grupo. Esta conquista lhe rendeu o prêmio Berimbau de Ouro, que descreveu como "a maior honra para um mestre de capoeira, que talvez não tenha sido superada até hoje."

Em 1974, Tabosa fundou a Academia Tabosa de Capoeira e Ginástica Localizada Brasileira na quadra 505 Sul—a primeira academia oficial de capoeira em Brasília. Este marco impulsionou a disseminação da prática da capoeira por toda a região Centro-Oeste. Através da Academia Tabosa, ele "promoveu a estação primeira da capoeira em Brasília", rapidamente tornando-se o elo de ligação entre Brasília e o mundo capoeirístico mais amplo.

Seus alunos se tornaram alguns dos melhores mestres e instrutores de ginástica do Distrito Federal. Segundo seu perfil no IPHAN, formou 26 mestres, contra-mestres e instrutores. Era responsável por organizar rodas tradicionais em sua academia no Plano Piloto e na UnB—encontros que atraíam capoeiristas de toda a região.

Em 1988, Mestre Tabosa recebeu uma honra profunda: Mestre Waldemar da Liberdade, um dos grandes guardiões da tradição capoeirística, presenteou-o com um berimbau inscrito "Ás de Ouro 88" em sua verga. Este presente, dado durante um evento em Salvador ao lado dos Mestres Itapoan, Eziquiel e Luiz Renato, simbolizou o reconhecimento de Waldemar da estatura de Tabosa no mundo da capoeira. Tabosa redescobriu este instrumento precioso em 2021, a cabaça há muito deteriorada mas a verga de biriba preservando o testemunho de sua amizade após 33 anos.

O reconhecimento seguiu ao longo de sua carreira. Em 1997, a Federação de Capoeira do Distrito Federal concedeu-lhe diploma de honra como "Pioneiro na Disseminação da Capoeira no Distrito Federal". Recebeu o título de Cidadão Honorário da capital da República pela Câmara Legislativa do Distrito Federal—reconhecimento compartilhado com seu professor Mestre Onça Tigre.

Tabosa participou da vida cultural brasileira além da roda. Em 1996, contribuiu para a gravação do CD "Tantas Canções" de Muriel Tabb e Paulo André Tavares. Em 1997, apareceu no filme "O sonho não acabou" com Lucélia Santos e Miguel Falabella, e atuou em "No Coração dos Deuses"—levando a capoeira para plateias de cinema.

Foi selecionado como um dos 50 mestres para compor o acervo do Museu da República, que hospedou o projeto "Capoeira Viva" para valorizar e promover a capoeira como bem cultural brasileiro. Uma fotografia de André Cypriano de Tabosa tocando berimbau em frente ao Museu Nacional da República em Brasília está agora preservada na Biblioteca do Congresso em Washington, D.C.—documentação de sua importância para o patrimônio cultural brasileiro e mundial.

Em 2009, Tabosa publicou seu livro "Mestre Tabosa O Filho de Xangô" pela Editora Gráfica Ipiranga—uma obra repleta de fotografias históricas, assuntos diversos e informações que preenchem uma lacuna significativa sobre a história da capoeira no Distrito Federal. O título faz referência à sua conexão espiritual com Xangô, o orixá da justiça e do trovão nas tradições religiosas afro-brasileiras.

Em 2017, no IV Congresso Brasileiro de Capoeira e Educação, Tabosa foi homenageado ao lado de Mestre Pombo de Ouro e Mestre Itapoan na celebração do Centenário da Capoeira Regional, reconhecendo sua dedicação e contribuição à cultura capoeirística.

Agora com mais de seis décadas dedicadas à Capoeira Regional, Mestre Tabosa permanece uma figura lendária cujas habilidades "já viraram lendas da cidade". Apesar da idade avançada, observadores notam sua "agilidade indiscutível"—prova de que sua filosofia "ensinamento direto, olho no olho, ginga com ginga" o serviu bem.',
  -- achievements_en
  E'Three-time Berimbau de Ouro champion with Grupo Senzala (1967, 1968, 1969)\nIntroduced capoeira to the University of Brasília (UnB) in 1965\nFounded Academia Tabosa (1974)—first official capoeira academy in Brasília\nTrained 26 mestres, contra-mestres, and instructors\nHonorary Citizen of the Federal District capital\nPioneer in the Dissemination of Capoeira in the DF (1997 Federation diploma)\nOne of 50 mestres in Museu da República "Capoeira Viva" collection\nAuthor: "Mestre Tabosa O Filho de Xangô" (2009)\nReceived "Ás de Ouro 88" berimbau from Mestre Waldemar da Liberdade (1988)\n1st Dan black belt in judo (1981)\nPhotograph in Library of Congress collection (André Cypriano, 2009)',
  -- achievements_pt
  E'Tricampeão do Berimbau de Ouro com Grupo Senzala (1967, 1968, 1969)\nIntroduziu a capoeira na Universidade de Brasília (UnB) em 1965\nFundou a Academia Tabosa (1974)—primeira academia oficial de capoeira em Brasília\nFormou 26 mestres, contra-mestres e instrutores\nCidadão Honorário da capital do Distrito Federal\nPioneiro na Disseminação da Capoeira no DF (diploma da Federação 1997)\nUm dos 50 mestres na coleção "Capoeira Viva" do Museu da República\nAutor: "Mestre Tabosa O Filho de Xangô" (2009)\nRecebeu berimbau "Ás de Ouro 88" de Mestre Waldemar da Liberdade (1988)\nFaixa preta 1º Dan de judô (1981)\nFotografia na coleção da Biblioteca do Congresso (André Cypriano, 2009)',
  -- notes_en
  E'BIRTH DATE: February 5, 1947 (exact) - IPHAN Capoeira registry
BIRTH PLACE: Brazil (state unknown; IPHAN registry does not specify)
DEATH: Living as of IPHAN profile update (January 22, 2021)

PROFESSION: Lawyer (OAB-DF registered); educator

TEACHERS:
- Mestre Arraia (Aldenor Benjamim, 1946-2005) - primary teacher, Colégio Elefante Branco, Brasília 1960s
- Mestre Onça Tigre (Milton Freire de Carvalho, 1919-) - secondary influence, per IPHAN registry

MASTER TITLE:
- Obtained mestre title 1969 in Brasília per IPHAN registry
- Likely recognized through Berimbau de Ouro victories and community standing

TRAINING COMPANIONS (Brasília):
- Cláudio Danadinho - Grupo Senzala founder; trained together at Elefante Branco
- Fritz (Alfredo) - helped win Berimbau de Ouro 1967-1969
- Adilson - competed at Berimbau de Ouro festival

STUDENTS:
- 26 mestres, contra-mestres, and instructors (per IPHAN)
- Mestre Zulu trained with him at UnB (1970)

MEDIA APPEARANCES:
- 1996: CD "Tantas Canções" (Muriel Tabb & Paulo André Tavares)
- 1997: Film "O sonho não acabou" (Lucélia Santos, Miguel Falabella)
- 1997: Film "No Coração dos Deuses"
- 2009: André Cypriano photograph at Museu Nacional da República (Library of Congress)
- 2009: Book "Mestre Tabosa O Filho de Xangô" (Editora Gráfica Ipiranga)

ORGANIZATIONS:
- Academia Tabosa de Capoeira e Ginástica Localizada Brasileira (founder, 1974)
- Federação de Capoeira do Distrito Federal (honored pioneer 1997)

SPIRITUAL CONNECTION:
- Book title "O Filho de Xangô" indicates connection to orixá Xangô (justice, thunder)

RODA LOCATIONS:
- Academia Tabosa, Plano Piloto, Brasília
- Universidade de Brasília (UnB)

SOURCE VARIATIONS:
- Birth year: 1947 (IPHAN), ~1948 (Library of Congress estimate)
- Using IPHAN as authoritative source for birth year',
  -- notes_pt
  E'DATA DE NASCIMENTO: 5 de fevereiro de 1947 (exato) - registro IPHAN Capoeira
LOCAL DE NASCIMENTO: Brasil (estado desconhecido; registro IPHAN não especifica)
FALECIMENTO: Vivo conforme atualização do perfil IPHAN (22 de janeiro de 2021)

PROFISSÃO: Advogado (registrado OAB-DF); educador

MESTRES:
- Mestre Arraia (Aldenor Benjamim, 1946-2005) - professor principal, Colégio Elefante Branco, Brasília anos 1960
- Mestre Onça Tigre (Milton Freire de Carvalho, 1919-) - influência secundária, conforme registro IPHAN

TÍTULO DE MESTRE:
- Obteve título de mestre em 1969 em Brasília conforme registro IPHAN
- Provavelmente reconhecido através das vitórias no Berimbau de Ouro e posição na comunidade

COMPANHEIROS DE TREINO (Brasília):
- Cláudio Danadinho - fundador Grupo Senzala; treinaram juntos no Elefante Branco
- Fritz (Alfredo) - ajudou a vencer Berimbau de Ouro 1967-1969
- Adilson - competiu no festival Berimbau de Ouro

ALUNOS:
- 26 mestres, contra-mestres e instrutores (conforme IPHAN)
- Mestre Zulu treinou com ele na UnB (1970)

APARIÇÕES NA MÍDIA:
- 1996: CD "Tantas Canções" (Muriel Tabb & Paulo André Tavares)
- 1997: Filme "O sonho não acabou" (Lucélia Santos, Miguel Falabella)
- 1997: Filme "No Coração dos Deuses"
- 2009: Fotografia de André Cypriano no Museu Nacional da República (Biblioteca do Congresso)
- 2009: Livro "Mestre Tabosa O Filho de Xangô" (Editora Gráfica Ipiranga)

ORGANIZAÇÕES:
- Academia Tabosa de Capoeira e Ginástica Localizada Brasileira (fundador, 1974)
- Federação de Capoeira do Distrito Federal (pioneiro homenageado 1997)

CONEXÃO ESPIRITUAL:
- Título do livro "O Filho de Xangô" indica conexão com orixá Xangô (justiça, trovão)

LOCAIS DE RODA:
- Academia Tabosa, Plano Piloto, Brasília
- Universidade de Brasília (UnB)

VARIAÇÃO DE FONTES:
- Ano de nascimento: 1947 (IPHAN), ~1948 (estimativa Biblioteca do Congresso)
- Usando IPHAN como fonte autoritativa para ano de nascimento'
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

-- Source: entities/persons/tonha-rolo-do-mar.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Tonha Rolo do Mar
-- Generated: 2026-01-03
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade):
-- Cobrinha Verde (born 1912) learned from Tonha during his youth in Santo Amaro
-- in the 1910s-1920s. Assuming she was a mature, skilled teacher (~30-50 years
-- old) when teaching him, her birth would be approximately 1870-1890.
-- Using 1870 as estimate with decade precision (conservative, she was likely
-- old enough to be established as a weapons specialist).
--
-- DEATH YEAR ESTIMATION (1950, decade):
-- Santos (1991) notes that at the time of his interview with Cobrinha Verde,
-- Tonha was "still alive" and had moved to Tomba, Feira de Santana. Cobrinha
-- Verde's interviews were conducted before his death in 1983. However, the
-- 2023 academic study lists her as "in memoriam." Using 1950 as estimated
-- death with decade precision (she would have been ~60-80 years old).
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  title,
  gender,
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Tonha Rolo do Mar',
  NULL,
  'female'::genealogy.gender,
  NULL,
  ARRAY['https://periodicos.sbu.unicamp.br/ojs/index.php/conexoes/article/view/8674321', 'https://capoeira.online/history/mestres/cobrinha-verde/']::text[],
  -- Capoeira-specific
  NULL,
  'Specialist in razor (navalha) technique. Mastered the military technique of playing with knife and razor tied to a cord—a skill from the pre-codification era of capoeiragem where weapons were integral to the practice.',
  'Especialista na técnica de navalha. Dominava a técnica militar de jogar com faca e navalha amarradas no cordão—uma habilidade da era pré-codificação da capoeiragem onde armas eram parte integral da prática.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1950,
  'decade'::genealogy.date_precision,
  'Feira de Santana, Bahia, Brazil',
  -- bio_en
  E'Tonha Rolo do Mar stands as one of the earliest documented female capoeira teachers in Brazilian history. A 2023 academic study by Ábia Lima de França at the Federal University of Bahia, analyzing 296 female capoeira mestras across Brazil and abroad, identified her alongside Mestra Sandrinha and Mestra Cigana as one of three possible pioneers of female mastery in capoeira.

Her specialty was the military technique of playing with knife and razor tied to a cord—the deadly art of the navalha. In Santo Amaro da Purificação, the heartland of Bahian capoeira, she taught the young Rafael Alves França, who would become the legendary Mestre Cobrinha Verde. In his own words, recorded in Marcelino dos Santos'' 1991 book "Capoeira e Mandingas": "O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar" ("My master of playing razor on the cord, in the hands and on the feet was Tonha, nicknamed Tonha Rolo do Mar").

This was the era when the navalha, the switchblade, and the faca were as much a part of capoeiragem as the ginga itself. Before the sportification of capoeira in the twentieth century, the razor was the capoeira''s favorite weapon—a symbol of the art long before the berimbau achieved its current prominence. Tonha was a woman who had mastered this deadly craft and passed it on.

At the time of Cobrinha Verde''s account, she was reportedly still alive and walking around with a machete in hand—a woman of fearsome capability. She had moved from Santo Amaro to the neighborhood of Tomba in Feira de Santana, Bahia, and after that, no further news of her exists. She vanished from the historical record, leaving behind only the legacy she transmitted through her students.

Tonha Rolo do Mar represents an important but often overlooked female figure in the traditionally male-dominated history of capoeira—a woman who taught men the art of the razor at a time when such skills meant the difference between life and death on the streets of Bahia.',
  -- bio_pt
  E'Tonha Rolo do Mar se destaca como uma das primeiras mestras de capoeira documentadas na história brasileira. Um estudo acadêmico de 2023 da pesquisadora Ábia Lima de França na Universidade Federal da Bahia, analisando 296 mestras de capoeira espalhadas pelo Brasil e exterior, identificou-a junto com Mestra Sandrinha e Mestra Cigana como uma das três possíveis pioneiras da maestria feminina na capoeira.

Sua especialidade era a técnica militar de jogar com faca e navalha amarradas no cordão—a arte mortal da navalha. Em Santo Amaro da Purificação, o coração da capoeira baiana, ela ensinou o jovem Rafael Alves França, que se tornaria o lendário Mestre Cobrinha Verde. Em suas próprias palavras, registradas no livro de 1991 de Marcelino dos Santos "Capoeira e Mandingas": "O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar".

Esta foi a era em que a navalha, o canivete e a faca eram tão parte da capoeiragem quanto a própria ginga. Antes da esportivização da capoeira no século XX, a navalha era a arma favorita do capoeira—um símbolo da arte muito antes do berimbau alcançar sua proeminência atual. Tonha era uma mulher que havia dominado esta arte mortal e a transmitia.

Na época do relato de Cobrinha Verde, ela supostamente ainda estava viva e andava por aí com um facão na mão—uma mulher de capacidade temível. Ela tinha se mudado de Santo Amaro para o bairro do Tomba em Feira de Santana, Bahia, e depois disso, não há mais notícias sobre ela. Ela desapareceu do registro histórico, deixando apenas o legado que transmitiu através de seus alunos.

Tonha Rolo do Mar representa uma figura feminina importante mas frequentemente negligenciada na história tradicionalmente dominada por homens da capoeira—uma mulher que ensinou homens a arte da navalha em uma época em que tais habilidades significavam a diferença entre a vida e a morte nas ruas da Bahia.',
  -- achievements_en
  'One of three earliest documented female capoeira pioneers; Master of razor (navalha) technique; Taught Mestre Cobrinha Verde the art of the razor tied to cord; Transmitted pre-codification weapons tradition of capoeiragem',
  -- achievements_pt
  'Uma das três primeiras pioneiras femininas documentadas da capoeira; Mestra da técnica de navalha; Ensinou Mestre Cobrinha Verde a arte da navalha no cordão; Transmitiu tradição de armas da capoeiragem pré-codificação',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade):
Cobrinha Verde (born 1912) learned from Tonha during his youth in Santo Amaro in the 1910s-1920s. Assuming she was a mature, skilled teacher (~30-50 years old) when teaching him, her birth would be approximately 1870-1890. Using 1870 as estimate with decade precision.

DEATH YEAR ESTIMATION (1950, decade):
Santos (1991) notes that at the time of the interview, Tonha was "still alive" and had moved to Tomba, Feira de Santana. The 2023 academic study lists her as "in memoriam." Using 1950 as estimated death with decade precision.

PRIMARY SOURCE: Santos, Marcelino dos. "Capoeira e Mandingas: Cobrinha Verde." Salvador: A Rasteira, 1991.

SECONDARY SOURCE: França, Ábia Lima de. "Resgate histórico das pioneiras mestras de capoeira no Brasil." Conexões, v. 21, e023033, 2023. DOI: 10.20396/conex.v21i00.8674321

COBRINHA VERDE QUOTE (Santos, 1991):
"O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar. Uma mulher."

CONTEMPORARY STATUS (at time of interview):
"She is still alive, and walks around with a machete in hand. She lives in Feira de Santana."

TITLE CONSIDERATION:
No formal title used in sources. The 2023 academic study categorizes her as one of three "mestras" but this appears to be an honorific recognition rather than a title she received during her lifetime. Title left as NULL to reflect historical accuracy—the formal title system did not exist in her era.

STUDENTS:
- Mestre Cobrinha Verde (razor technique in Santo Amaro, 1910s-1920s)

LOCATIONS:
- Santo Amaro da Purificação, Bahia (teaching period)
- Tomba, Feira de Santana, Bahia (later residence)

HISTORICAL CONTEXT:
Among the "mulheres da pá virada" (feisty women) who challenged gender norms and practiced capoeira alongside or against men in the late 19th/early 20th century. The razor was integral to capoeiragem before its sportification.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1870, década):
Cobrinha Verde (nascido 1912) aprendeu com Tonha durante sua juventude em Santo Amaro nos anos 1910-1920. Assumindo que ela era uma professora madura e habilidosa (~30-50 anos) quando o ensinou, seu nascimento seria aproximadamente 1870-1890. Usando 1870 como estimativa com precisão de década.

ESTIMATIVA ANO DE MORTE (1950, década):
Santos (1991) nota que na época da entrevista, Tonha estava "ainda viva" e havia se mudado para Tomba, Feira de Santana. O estudo acadêmico de 2023 a lista como "in memoriam." Usando 1950 como morte estimada com precisão de década.

FONTE PRIMÁRIA: Santos, Marcelino dos. "Capoeira e Mandingas: Cobrinha Verde." Salvador: A Rasteira, 1991.

FONTE SECUNDÁRIA: França, Ábia Lima de. "Resgate histórico das pioneiras mestras de capoeira no Brasil." Conexões, v. 21, e023033, 2023. DOI: 10.20396/conex.v21i00.8674321

CITAÇÃO DE COBRINHA VERDE (Santos, 1991):
"O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar. Uma mulher."

SITUAÇÃO CONTEMPORÂNEA (na época da entrevista):
"Ela ainda está viva, e anda por aí com um facão na mão. Ela mora em Feira de Santana."

CONSIDERAÇÃO SOBRE TÍTULO:
Nenhum título formal usado nas fontes. O estudo acadêmico de 2023 a categoriza como uma das três "mestras" mas isso parece ser um reconhecimento honorífico ao invés de um título que ela recebeu durante sua vida. Título deixado como NULL para refletir precisão histórica—o sistema formal de títulos não existia em sua era.

ALUNOS:
- Mestre Cobrinha Verde (técnica de navalha em Santo Amaro, anos 1910-1920)

LOCALIZAÇÕES:
- Santo Amaro da Purificação, Bahia (período de ensino)
- Tomba, Feira de Santana, Bahia (residência posterior)

CONTEXTO HISTÓRICO:
Entre as "mulheres da pá virada" que desafiavam normas de gênero e praticavam capoeira junto ou contra homens no final do século XIX/início do século XX. A navalha era integral à capoeiragem antes de sua esportivização.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  gender = EXCLUDED.gender,
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

-- Source: entities/persons/valdebrando.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Valdebrando
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (1930, decade):
-- Valdebrando was teaching capoeira to young Medicina in
-- the early 1960s (~1963-1965). As a street capoeirista
-- capable of teaching, he would likely have been 25-40 years
-- old. If ~30-35 in 1963, born ~1928-1933. Estimate 1930.
-- DEATH YEAR: Unknown
-- ============================================================
-- MINIMAL DOCUMENTATION CASE:
-- Valdebrando is documented only as the first capoeira teacher
-- of young Mestre Medicina (Luís Oliveira Rocha) in Itabuna,
-- Bahia, in the early 1960s before Medicina entered Major
-- Dória's academy. No full name, dates, title, or other
-- biographical details are available in any source.
--
-- Context: Capoeira in Itabuna in the early 1950s-60s consisted
-- of street capoeiristas (angoleiros) who "practiced in the
-- middle of the street, without a defined location" and were
-- marginalized (Cláudia Viana, "CAPOEIRA: de luta de negro a
-- exercício de branco no cenário grapiúna", 2006).
--
-- Valdebrando was likely one of these informal street
-- practitioners who gave young Medicina his first exposure
-- to capoeira before more formal training.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Valdebrando', NULL, NULL,
  NULL,
  NULL, NULL, NULL,
  1930, 'decade'::genealogy.date_precision, 'Itabuna, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Valdebrando was a capoeirista active in Itabuna, Bahia, in the early 1960s. He is known as the first capoeira teacher of young Luís Oliveira Rocha, who would later become Mestre Medicina, founder of Grupo Raça.

According to Grupo Raça''s historical documentation, Medicina''s introduction to capoeira began with Valdebrando before he entered the Academia de Major Dória, where Maneca Brandão taught capoeira Regional in the tradition of Mestre Bimba.

The context of capoeira in Itabuna during this period was one of marginalization. According to historian Cláudia Viana, who researched capoeira history in the Grapiúna region, capoeira was practiced in Itabuna already at the beginning of the 1950s with street capoeiristas: "They were the angoleiros who practiced the sport in the middle of the street, without a defined location. Also for this reason they were marginalized."

Valdebrando was likely one of these informal street practitioners who passed on the first seeds of capoeira to the young Medicina, before the art''s formal institutionalization through academies brought it into respectable society.

No further biographical details—full name, dates, title, teachers, or other students—are documented in available sources.',
  E'Valdebrando foi um capoeirista ativo em Itabuna, Bahia, no início dos anos 1960. Ele é conhecido como o primeiro professor de capoeira do jovem Luís Oliveira Rocha, que mais tarde se tornaria Mestre Medicina, fundador do Grupo Raça.

De acordo com a documentação histórica do Grupo Raça, a introdução de Medicina à capoeira começou com Valdebrando antes de ele entrar na Academia de Major Dória, onde Maneca Brandão ensinava capoeira Regional na tradição de Mestre Bimba.

O contexto da capoeira em Itabuna durante este período era de marginalização. Segundo a historiadora Cláudia Viana, que pesquisou a história da capoeira na região grapiúna, a capoeira era praticada em Itabuna já no começo da década de 50 com os capoeiristas de rua: "Eram os angoleiros que praticavam o esporte no meio da rua, sem um local definido. Também por isso eram marginalizados."

Valdebrando era provavelmente um desses praticantes informais de rua que transmitiu as primeiras sementes da capoeira ao jovem Medicina, antes que a institucionalização formal da arte através das academias a trouxesse para a sociedade respeitável.

Nenhum outro detalhe biográfico—nome completo, datas, título, mestres ou outros alunos—está documentado nas fontes disponíveis.',
  NULL, NULL,
  E'BIRTH YEAR ESTIMATION (1930, decade):
Valdebrando was teaching capoeira to young Medicina in the early 1960s (~1963-1965). As a street capoeirista capable of teaching, he would likely have been 25-40 years old. If ~30-35 in 1963, born ~1928-1933. Estimate 1930 with decade precision.

MINIMAL DOCUMENTATION NOTE:
Valdebrando is documented only through a single reference in Grupo Raça historical materials. No full name, dates, title, or detailed biographical information exists in available sources.

CONTEXT:
Mentioned in Grupo Raça website (Spanish): "Su inicio en la capoeira fue con Valdebrando, después entró en la Academia de Major Dória."

TIMELINE DEDUCTION:
- Medicina born December 16, 1950
- Started gymnastics/athletics around age 10 (~1960)
- Introduced to capoeira around age 15 (~1965)
- Valdebrando taught him BEFORE Major Dória''s academy
- Training with Valdebrando likely occurred early 1960s

HISTORICAL CONTEXT:
According to Cláudia Viana (historian, author of "CAPOEIRA: de luta de negro a exercício de branco no cenário grapiúna"), capoeira in Itabuna in the 1950s consisted of street angoleiros who were marginalized. Major Dória''s academy (founded 1958) brought capoeira into mainstream society.

Valdebrando was likely one of these informal street practitioners.

STUDENTS:
- Mestre Medicina (Luís Oliveira Rocha) - first exposure to capoeira, early 1960s, Itabuna

UNKNOWN:
- Full name
- Death date
- Title (if any)
- Style
- His own teachers
- Other students',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Valdebrando estava ensinando capoeira ao jovem Medicina no início dos anos 1960 (~1963-1965). Como capoeirista de rua capaz de ensinar, ele provavelmente teria 25-40 anos. Se ~30-35 em 1963, nascido ~1928-1933. Estimativa 1930 com precisão de década.

NOTA DE DOCUMENTAÇÃO MÍNIMA:
Valdebrando está documentado apenas através de uma única referência nos materiais históricos do Grupo Raça. Nenhum nome completo, datas, título ou informações biográficas detalhadas existem nas fontes disponíveis.

CONTEXTO:
Mencionado no site do Grupo Raça (espanhol): "Su inicio en la capoeira fue con Valdebrando, después entró en la Academia de Major Dória."

DEDUÇÃO CRONOLÓGICA:
- Medicina nasceu em 16 de dezembro de 1950
- Começou ginástica/atletismo por volta dos 10 anos (~1960)
- Foi introduzido à capoeira por volta dos 15 anos (~1965)
- Valdebrando o ensinou ANTES da academia do Major Dória
- Treinamento com Valdebrando provavelmente ocorreu no início dos anos 1960

CONTEXTO HISTÓRICO:
De acordo com Cláudia Viana (historiadora, autora de "CAPOEIRA: de luta de negro a exercício de branco no cenário grapiúna"), a capoeira em Itabuna nos anos 1950 consistia em angoleiros de rua que eram marginalizados. A academia do Major Dória (fundada em 1958) trouxe a capoeira para a sociedade mainstream.

Valdebrando era provavelmente um desses praticantes informais de rua.

ALUNOS:
- Mestre Medicina (Luís Oliveira Rocha) - primeira exposição à capoeira, início dos anos 1960, Itabuna

DESCONHECIDO:
- Nome completo
- Data de morte
- Título (se houver)
- Estilo
- Seus próprios mestres
- Outros alunos'
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

-- Source: entities/persons/virgilio-da-fazenda-grande.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Virgílio da Fazenda Grande
-- Generated: 2026-01-02
-- Primary Sources: Portal Capoeira, Tribuna do Recôncavo, ABCA WordPress, velhosmestres.com
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- Multiple sources confirm December 3, 1944 (Tribuna do Recôncavo 2025, ABCA sources).
-- Started capoeira in 1954 at age 10, under father Espinho Remoso.
-- In 2025, described as "over 80 years old" - consistent with 1944 birth.
-- ============================================================
-- NAME DISCREPANCY:
-- - "Virgílio Maximiano Ferreira" - Tribuna do Recôncavo (2025)
-- - "Virgílio Maximiano Pereira" - Portal Capoeira (2008), Academia João Pequeno
-- Father was Elízio Maximiano Ferreira. The surname discrepancy (Ferreira vs Pereira)
-- may be a transcription error or maternal name. Using Ferreira based on paternal lineage.
-- ============================================================
-- IMPORTANT: This is the same person as "Virgílio do Retiro" in some sources.
-- Fazenda Grande do Retiro is a neighborhood in Salvador; "do Retiro" is shortened form.
-- Using apelido "Virgílio da Fazenda Grande" as primary identifier per most sources.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Virgílio Maximiano Ferreira',
  'Virgílio da Fazenda Grande',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://abcangola.wordpress.com/', 'https://portalcapoeira.com/capoeira/noticias-atualidades/mestre-virgilio-meio-seculo-de-capoeira/', 'https://velhosmestres.com/en/featured-22', 'https://tribunadoreconcavo.com/mestres-octogenarios-da-capoeira-recebem-titulo-de-herois-populares-no-vi-rede-capoeira/', 'https://ceca-riovermelho.org.br/black-leader/?lang=en']::text[],
  'angola'::genealogy.style,
  E'Virgílio embodies the traditional Capoeira Angola style passed down from his father, Mestre Espinho Remoso, and refined under Mestre Paulo dos Anjos. He maintains the ancestral traditions of berimbau rhythms and traditional songs at the ABCA headquarters in Pelourinho. As he describes: "Capoeira Angola is Brazilian gold... To be a good capoeirista, it is necessary to train, train and train. Capoeira Angola is my joy, it is the malice of the black man; it is part of my life."',
  E'Virgílio representa o estilo tradicional da Capoeira Angola transmitido por seu pai, Mestre Espinho Remoso, e aperfeiçoado com Mestre Paulo dos Anjos. Ele mantém as tradições ancestrais dos toques de berimbau e cantos tradicionais na sede da ABCA no Pelourinho. Como ele descreve: "A Capoeira Angola é ouro brasileiro... Para ser um bom capoeirista, é necessário treinar, treinar e treinar. A Capoeira Angola é minha alegria, é a malícia do negro; faz parte da minha vida."',
  1944,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Virgílio Maximiano Ferreira was born on December 3, 1944, in Salvador, Bahia. His father, Mestre Espinho Remoso (Elízio Maximiano Ferreira), was a renowned capoeirista from Teixeira de Freitas who had learned the art in Santo Amaro''s sugarcane mills and later settled in Salvador.\n\nIn 1954, at age ten, Virgílio began learning capoeira from his father at Jaqueira do Carneiro, behind the Retiro neighborhood. Espinho Remoso did not run a formal school—instead, he operated a kiosk where, every Sunday, fellow capoeiristas would gather to play. These Sunday rodas attracted significant figures of Bahian capoeira in the 1950s, including Mestre Waldemar, Mestre Paulo dos Anjos, and Zacarias Boa Morte.\n\nIn 1960, when Virgílio was sixteen, his father died. The young man took up his father''s mantle, continuing the Sunday roda at Jaqueira do Carneiro and carrying forward the capoeira tradition in the Fazenda Grande do Retiro community.\n\nAfter his father''s passing, Virgílio trained briefly under Mestre Caiçara and later received his mestre title from Mestre Paulo dos Anjos, a renowned disciple of Mestre Canjiquinha. This lineage connected him to the deepest roots of Bahian Capoeira Angola.\n\nFor over thirty years, Virgílio has developed social work at the Escola Profissional 1º de Maio in Fazenda Grande do Retiro, using capoeira as a tool for community education and youth development.\n\nIn July 1988, the Tribuna da Bahia published an article titled "A resistência da capoeira" (The Resistance of Capoeira), identifying only eight surviving "great master-angoleiros": Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobô, Bom Cabrito, João Grande, and João Pequeno. The article lamented that of these eight, only the two Joãos were actively teaching at the time. This recognition placed Virgílio among the most important living guardians of traditional Capoeira Angola.\n\nIn September 2008, the Salvador City Council honored Mestre Virgílio for his fifty years in capoeira (1958-2008). At this ceremony, he spoke about his experiences with the traditional masters—Waldemar, Caiçara, and his father Espinho Remoso.\n\nVirgílio became president of the Associação Brasileira de Capoeira Angola (ABCA), founded in 1987 to bring together elder capoeira angola mestres and preserve ancestral traditions. Under his leadership, he worked alongside other ABCA officers including Vice-President Mestre Augusto Januário, Treasurer Mestre Pelé do Tonel, and members of the Council of Masters led by Mestre Nô.\n\nAt the ABCA headquarters on Rua Gregório de Mattos, 38, in the heart of Pelourinho, Virgílio plays every Friday at 7:00 PM with old companions such as Mestres Bigodinho, Nô, Boca Rica, Ângelo Romano, Pelé da Bomba, and others. These rodas maintain the tradition of songs and berimbau rhythms passed down through generations.\n\nIn January 2025, at over eighty years old, Mestre Virgílio da Fazenda Grande was among ten mestres and mestras who received the Sankofa trophy at the VI Rede Capoeira event, consecrating him as a "popular hero" for his lifetime dedication to Capoeira Angola.\n\nWith more than seventy years dedicated to Capoeira Angola, Mestre Virgílio Maximiano Ferreira is a symbol of resistance in the ancestral struggle. His life''s work—from continuing his father''s roda at Jaqueira do Carneiro to leading the ABCA and training new generations at Escola 1º de Maio—represents an unbroken chain of cultural transmission.',
  E'Virgílio Maximiano Ferreira nasceu em 3 de dezembro de 1944, em Salvador, Bahia. Seu pai, Mestre Espinho Remoso (Elízio Maximiano Ferreira), era um renomado capoeirista de Teixeira de Freitas que aprendeu a arte nos engenhos de cana de Santo Amaro e depois se estabeleceu em Salvador.\n\nEm 1954, aos dez anos, Virgílio começou a aprender capoeira com seu pai em Jaqueira do Carneiro, atrás do bairro do Retiro. Espinho Remoso não dirigia uma escola formal—ao invés disso, ele operava um quiosque onde, todo domingo, capoeiristas se reuniam para jogar. Essas rodas de domingo atraíam figuras significativas da capoeira baiana nos anos 1950, incluindo Mestre Waldemar, Mestre Paulo dos Anjos e Zacarias Boa Morte.\n\nEm 1960, quando Virgílio tinha dezesseis anos, seu pai morreu. O jovem assumiu o manto de seu pai, continuando a roda de domingo em Jaqueira do Carneiro e levando adiante a tradição da capoeira na comunidade de Fazenda Grande do Retiro.\n\nApós a morte de seu pai, Virgílio treinou brevemente com Mestre Caiçara e depois recebeu seu título de mestre de Mestre Paulo dos Anjos, um renomado discípulo de Mestre Canjiquinha. Esta linhagem o conectou às raízes mais profundas da Capoeira Angola baiana.\n\nPor mais de trinta anos, Virgílio desenvolveu trabalho social na Escola Profissional 1º de Maio em Fazenda Grande do Retiro, usando a capoeira como ferramenta para educação comunitária e desenvolvimento de jovens.\n\nEm julho de 1988, a Tribuna da Bahia publicou um artigo intitulado "A resistência da capoeira", identificando apenas oito "grandes mestres-angoleiros" sobreviventes: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobô, Bom Cabrito, João Grande e João Pequeno. O artigo lamentava que, desses oito, apenas os dois Joãos estavam ensinando ativamente na época. Este reconhecimento colocou Virgílio entre os mais importantes guardiões vivos da Capoeira Angola tradicional.\n\nEm setembro de 2008, a Câmara Municipal de Salvador homenageou Mestre Virgílio por seus cinquenta anos de capoeira (1958-2008). Nesta cerimônia, ele falou sobre suas experiências com os mestres tradicionais—Waldemar, Caiçara e seu pai Espinho Remoso.\n\nVirgílio tornou-se presidente da Associação Brasileira de Capoeira Angola (ABCA), fundada em 1987 para reunir mestres anciões de capoeira angola e preservar tradições ancestrais. Sob sua liderança, trabalhou ao lado de outros dirigentes da ABCA incluindo Vice-Presidente Mestre Augusto Januário, Tesoureiro Mestre Pelé do Tonel, e membros do Conselho de Mestres liderado por Mestre Nô.\n\nNa sede da ABCA na Rua Gregório de Mattos, 38, no coração do Pelourinho, Virgílio joga toda sexta-feira às 19h com velhos companheiros como Mestres Bigodinho, Nô, Boca Rica, Ângelo Romano, Pelé da Bomba e outros. Essas rodas mantêm a tradição de cantos e toques de berimbau transmitidos através das gerações.\n\nEm janeiro de 2025, com mais de oitenta anos, Mestre Virgílio da Fazenda Grande estava entre dez mestres e mestras que receberam o troféu Sankofa no VI Rede Capoeira, consagrando-o como "herói popular" por sua dedicação de toda uma vida à Capoeira Angola.\n\nCom mais de setenta anos dedicados à Capoeira Angola, Mestre Virgílio Maximiano Ferreira é um símbolo de resistência na luta ancestral. O trabalho de sua vida—desde continuar a roda de seu pai em Jaqueira do Carneiro até liderar a ABCA e treinar novas gerações na Escola 1º de Maio—representa uma cadeia ininterrupta de transmissão cultural.',
  E'1954: Began capoeira training under father Mestre Espinho Remoso at Jaqueira do Carneiro
1960: After father''s death, continued the roda at Jaqueira do Carneiro
~1960s: Trained briefly under Mestre Caiçara
~1970s: Received mestre title from Mestre Paulo dos Anjos
~1975-2008+: Taught at Escola Profissional 1º de Maio in Fazenda Grande do Retiro (30+ years)
1988: Named as one of eight surviving "great master-angoleiros" in Tribuna da Bahia article (July 30)
~2000s: Became president of ABCA
2008: Honored by Salvador City Council for 50 years in capoeira (September)
2025: Received Sankofa trophy as "popular hero" at VI Rede Capoeira (January)',
  E'1954: Iniciou treinamento de capoeira com o pai Mestre Espinho Remoso em Jaqueira do Carneiro
1960: Após a morte do pai, continuou a roda em Jaqueira do Carneiro
~1960s: Treinou brevemente com Mestre Caiçara
~1970s: Recebeu título de mestre de Mestre Paulo dos Anjos
~1975-2008+: Ensinou na Escola Profissional 1º de Maio em Fazenda Grande do Retiro (30+ anos)
1988: Nomeado como um dos oito "grandes mestres-angoleiros" sobreviventes em artigo da Tribuna da Bahia (30 de julho)
~2000s: Tornou-se presidente da ABCA
2008: Homenageado pela Câmara Municipal de Salvador por 50 anos de capoeira (setembro)
2025: Recebeu troféu Sankofa como "herói popular" no VI Rede Capoeira (janeiro)',
  E'BIRTH DATE: December 3, 1944 (exact)
- Source: Tribuna do Recôncavo (2025): "over 80 years old"
- Started capoeira 1954 at age 10 → born ~1944
- 50 years of capoeira honored in 2008 → started 1958, consistent with 1944 birth

NAME DISCREPANCY:
- "Virgílio Maximiano Ferreira" - Tribuna do Recôncavo (2025)
- "Virgílio Maximiano Pereira" - Portal Capoeira (2008), Academia João Pequeno book
- Father was Elízio Maximiano FERREIRA - using paternal surname as primary

IDENTITY CLARIFICATION:
- "Virgílio da Fazenda Grande" and "Virgílio do Retiro" are the SAME PERSON
- Fazenda Grande do Retiro is a neighborhood in Salvador
- Some sources use shortened "do Retiro" form

TEACHERS:
- Mestre Espinho Remoso (Elízio Maximiano Ferreira) - father, primary teacher (1954-1960)
- Mestre Caiçara - brief training after father''s death (~1960)
- Mestre Paulo dos Anjos - conferred mestre title (~1970s)

FATHER''S RODA COMPANIONS (1950s Jaqueira do Carneiro):
- Mestre Waldemar
- Mestre Paulo dos Anjos
- Zacarias Boa Morte

ABCA COMPANIONS (Friday rodas, Pelourinho):
- Mestre Bigodinho
- Mestre Nô
- Mestre Boca Rica
- Mestre Ângelo Romano
- Mestre Pelé da Bomba
- Mestre Augusto Januário
- Mestre Pelé do Tonel
- Mestre Raimundo Dias

1988 "EIGHT SURVIVING ANGOLEIROS" (Tribuna da Bahia, July 30, 1988):
- Canjiquinha
- Paulo dos Anjos
- Curió
- Virgílio da Fazenda Grande
- Bobô
- Bom Cabrito
- João Grande
- João Pequeno

ABCA LEADERSHIP POSITIONS:
- President (current as of ~2008-present)
- Previous presidents: João Pequeno (founding), Moraes, Barba Branca, Curió

BOOK: "LIDER NEGRO" (Black Leader)
- Portrays life and leadership of Virgílio
- Documents Capoeira Baiana and Capoeira Angola since 1930s
- Available through Academia João Pequeno de Pastinha

SONGS: Composed "Historia da Capoeira Angola" - featured in capoeira angola songbooks

RODA LOCATION: ABCA headquarters, Rua Gregório de Mattos, 38, Pelourinho, Salvador
- Friday rodas at 7:00 PM (19h)',
  E'DATA DE NASCIMENTO: 3 de dezembro de 1944 (exato)
- Fonte: Tribuna do Recôncavo (2025): "mais de 80 anos"
- Começou capoeira 1954 aos 10 anos → nascido ~1944
- 50 anos de capoeira homenageado em 2008 → começou 1958, consistente com nascimento em 1944

DISCREPÂNCIA DE NOME:
- "Virgílio Maximiano Ferreira" - Tribuna do Recôncavo (2025)
- "Virgílio Maximiano Pereira" - Portal Capoeira (2008), livro Academia João Pequeno
- Pai era Elízio Maximiano FERREIRA - usando sobrenome paterno como principal

ESCLARECIMENTO DE IDENTIDADE:
- "Virgílio da Fazenda Grande" e "Virgílio do Retiro" são a MESMA PESSOA
- Fazenda Grande do Retiro é um bairro de Salvador
- Algumas fontes usam forma abreviada "do Retiro"

MESTRES:
- Mestre Espinho Remoso (Elízio Maximiano Ferreira) - pai, professor principal (1954-1960)
- Mestre Caiçara - treinamento breve após morte do pai (~1960)
- Mestre Paulo dos Anjos - conferiu título de mestre (~1970s)

COMPANHEIROS DA RODA DO PAI (1950s Jaqueira do Carneiro):
- Mestre Waldemar
- Mestre Paulo dos Anjos
- Zacarias Boa Morte

COMPANHEIROS DA ABCA (rodas de sexta-feira, Pelourinho):
- Mestre Bigodinho
- Mestre Nô
- Mestre Boca Rica
- Mestre Ângelo Romano
- Mestre Pelé da Bomba
- Mestre Augusto Januário
- Mestre Pelé do Tonel
- Mestre Raimundo Dias

1988 "OITO ANGOLEIROS SOBREVIVENTES" (Tribuna da Bahia, 30 de julho de 1988):
- Canjiquinha
- Paulo dos Anjos
- Curió
- Virgílio da Fazenda Grande
- Bobô
- Bom Cabrito
- João Grande
- João Pequeno

CARGOS DE LIDERANÇA ABCA:
- Presidente (atual desde ~2008-presente)
- Presidentes anteriores: João Pequeno (fundador), Moraes, Barba Branca, Curió

LIVRO: "LIDER NEGRO"
- Retrata vida e liderança de Virgílio
- Documenta Capoeira Baiana e Capoeira Angola desde anos 1930
- Disponível através da Academia João Pequeno de Pastinha

MÚSICAS: Compôs "Historia da Capoeira Angola" - presente em cancioneiros de capoeira angola

LOCAL DA RODA: Sede da ABCA, Rua Gregório de Mattos, 38, Pelourinho, Salvador
- Rodas às sextas-feiras às 19h'
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

-- Source: entities/persons/ze-de-freitas.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zé de Freitas
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH DATE: April 29, 1926 (exact)
-- Multiple sources confirm: Museu da Pessoa, Wiki Urucungo, Portal Capoeira
-- Birthplace: Macaquinhos, Bahia (small locality)
-- Residence after 1999: Alagoinhas, Bahia
--
-- DEATH YEAR: Unknown
-- As of 2009 (tribute event), he was 83 years old
-- As of ~2014-2016, sources reported him "nearly 90" with health problems
-- No confirmed death date found in available sources
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  -- Identity
  'José de Freitas',
  'Zé de Freitas',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
    'https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-z%C3%A9-de-freitas',
    'https://portalcapoeira.com/capoeira/eventos-agenda/sao-paulo-homenagem-a-mestre-ze-de-freitas/'
  ]::text[],
  -- Style
  'angola'::genealogy.style,
  E'Zé de Freitas trained in Capoeira Angola under Mestre Caiçara and later became a disciple of Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, known as "o Poeta"). He brought both styles to São Paulo, where he also taught freestyle wrestling (luta livre) alongside capoeira at the CMTC Club. His academy, Associação de Lutas Unidas Capoeira Freitas, reflected this mixed martial arts approach.',
  E'Zé de Freitas treinou Capoeira Angola com Mestre Caiçara e depois se tornou discípulo de Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, conhecido como "o Poeta"). Ele levou ambos os estilos para São Paulo, onde também ensinava luta livre junto com capoeira no Clube CMTC. Sua academia, Associação de Lutas Unidas Capoeira Freitas, refletia essa abordagem de artes marciais mistas.',
  -- Birth
  1926, 'exact'::genealogy.date_precision, 'Macaquinhos, Bahia, Brazil',
  -- Death (unknown)
  NULL, NULL::genealogy.date_precision, NULL,
  -- bio_en
  E'José de Freitas was born on April 29, 1926, in Macaquinhos, a small locality in Bahia. In 1946, at the age of 20, he began learning capoeira under Mestre Caiçara, the hard-fighting Angoleiro known for his iconic bengala (walking cane). After some time, Caiçara introduced him to the legendary Mestre Waldemar Rodrigues da Paixão, known as "o Poeta" (the Poet), at the famous Barracão in Liberdade, Salvador. Under Waldemar''s tutelage, Zé de Freitas refined his technique and musical skills, becoming his disciple.

In 1959, Zé de Freitas arrived in São Paulo—still during the era when capoeira was prohibited. His beginnings were humble: he started teaching capoeira in a small corridor of a boarding house (pensão) in the Mooca neighborhood, measuring only about 3 meters by 2 meters. Despite these modest circumstances, he persisted.

He later established himself at the CMTC Club (Companhia Municipal de Transportes Coletivos), where in addition to capoeira he taught freestyle wrestling (luta livre). The CMTC Club became a pivotal meeting point for Bahian capoeiristas arriving in São Paulo. It was at his classes there that capoeiristas like Mestre Brasília, Mestre Suassuna, and Mestre Joel first met—an encounter that would shape the future of São Paulo capoeira.

Mestre Pinatti, one of the few native paulistas dedicated to capoeira in the 1960s, consolidated his capoeira learning with Zé de Freitas and through him connected with the Bahian community. Zé de Freitas served as a unifier of capoeiristas in São Paulo, bridging different backgrounds and traditions.

In São Paulo, he founded his own academy: the Associação de Lutas Unidas Capoeira Freitas, located in the Sapopemba neighborhood. This academy trained a generation of important capoeiristas including Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho, and Mestre Dulcídio, who later assumed leadership of the group.

In 1971, when Mestre Bimba visited São Paulo at the invitation of Mestre Onça, he recognized a group of mestres as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo)—the famous "Grupo dos Nove" (Group of Nine). Zé de Freitas was among these nine pioneers: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Onça, and himself.

In 1974, the Federação Paulista de Capoeira was founded—the first capoeira federation in the world. Zé de Freitas''s academy was one of the eight founding associations, alongside K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, and Ilha de Itapuã.

Beyond teaching, Mestre Freitas had a colorful career outside capoeira. He participated in telenovelas (Brazilian soap operas) and worked as a security guard for Manoel da Nóbrega, the main comedian of the popular TV show "Praça da Alegria". Most notably, he was one of the trainers of soccer legend Pelé for the 1972 film "A Marcha de Chico Bondade".

After 40 years in São Paulo (1959-1999), Zé de Freitas returned to his homeland, settling in Alagoinhas, Bahia. His last visit to São Paulo was in June 2007, when he participated in the documentary "Reunião dos 9" (Reunion of the Nine), which sought to preserve the history of São Paulo capoeira. He was accompanied by his eternal student and friend Mestre Dulcídio throughout the trip.

In August 2009, a tribute event was held in his honor at Escola Vera Cruz in Vila Leopoldina, São Paulo. Organized by his students and the capoeira community, the event featured a roundtable discussion, classes by Mestre Brasília, a capoeira roda, and a presentation on the "Ação Griô" memory preservation project. The event was filmed for a DVD, with proceeds benefiting Mestre Freitas.

At age 88, Zé de Freitas was reported to be living in Alagoinhas with vision problems that prevented him from actively teaching. He is considered one of the most important pioneers who brought capoeira to São Paulo and established the foundation for the art''s development in Brazil''s largest city.',
  -- bio_pt
  E'José de Freitas nasceu em 29 de abril de 1926, em Macaquinhos, pequena localidade na Bahia. Em 1946, aos 20 anos, começou a aprender capoeira com Mestre Caiçara, o Angoleiro de luta dura conhecido por sua icônica bengala. Depois de algum tempo, Caiçara o apresentou ao lendário Mestre Waldemar Rodrigues da Paixão, conhecido como "o Poeta", no famoso Barracão na Liberdade, Salvador. Sob a tutela de Waldemar, Zé de Freitas aperfeiçoou sua técnica e habilidades musicais, tornando-se seu discípulo.

Em 1959, Zé de Freitas chegou a São Paulo—ainda durante a época em que a capoeira era proibida. Seus começos foram humildes: começou a ensinar capoeira em um pequeno corredor de uma pensão no bairro da Mooca, medindo apenas cerca de 3 metros por 2 metros. Apesar dessas circunstâncias modestas, ele persistiu.

Mais tarde, estabeleceu-se no Clube CMTC (Companhia Municipal de Transportes Coletivos), onde além de capoeira ensinava luta livre. O Clube CMTC tornou-se um ponto de encontro fundamental para capoeiristas baianos chegando a São Paulo. Foi em suas aulas lá que capoeiristas como Mestre Brasília, Mestre Suassuna e Mestre Joel se conheceram pela primeira vez—um encontro que moldaria o futuro da capoeira paulista.

Mestre Pinatti, um dos poucos paulistas nativos dedicados à capoeira nos anos 1960, consolidou seu aprendizado de capoeira com Zé de Freitas e através dele se conectou com a comunidade baiana. Zé de Freitas serviu como um unificador de capoeiristas em São Paulo, fazendo a ponte entre diferentes origens e tradições.

Em São Paulo, fundou sua própria academia: a Associação de Lutas Unidas Capoeira Freitas, localizada no bairro de Sapopemba. Esta academia treinou uma geração de capoeiristas importantes incluindo Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho e Mestre Dulcídio, que mais tarde assumiu a liderança do grupo.

Em 1971, quando Mestre Bimba visitou São Paulo a convite de Mestre Onça, ele reconheceu um grupo de mestres como os "Percursores da Capoeira em São Paulo"—o famoso "Grupo dos Nove". Zé de Freitas estava entre esses nove pioneiros: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Onça e ele próprio.

Em 1974, foi fundada a Federação Paulista de Capoeira—a primeira federação de capoeira do mundo. A academia de Zé de Freitas foi uma das oito associações fundadoras, ao lado de K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz e Ilha de Itapuã.

Além de ensinar, Mestre Freitas teve uma carreira colorida fora da capoeira. Participou de telenovelas brasileiras e trabalhou como segurança de Manoel da Nóbrega, o principal comediante do popular programa de TV "Praça da Alegria". Mais notavelmente, foi um dos treinadores da lenda do futebol Pelé para o filme de 1972 "A Marcha de Chico Bondade".

Após 40 anos em São Paulo (1959-1999), Zé de Freitas retornou à sua terra natal, estabelecendo-se em Alagoinhas, Bahia. Sua última visita a São Paulo foi em junho de 2007, quando participou do documentário "Reunião dos 9", que buscava preservar a história da capoeira paulista. Ele foi acompanhado por seu eterno aluno e amigo Mestre Dulcídio durante toda a viagem.

Em agosto de 2009, um evento de homenagem foi realizado em sua honra na Escola Vera Cruz em Vila Leopoldina, São Paulo. Organizado por seus alunos e pela comunidade de capoeira, o evento contou com mesa redonda, aulas de Mestre Brasília, roda de capoeira e apresentação sobre o projeto de preservação da memória "Ação Griô". O evento foi filmado para um DVD, com a renda revertida para Mestre Freitas.

Aos 88 anos, Zé de Freitas foi relatado como vivendo em Alagoinhas com problemas de visão que o impediam de ensinar ativamente. Ele é considerado um dos pioneiros mais importantes que trouxeram a capoeira para São Paulo e estabeleceram a base para o desenvolvimento da arte na maior cidade do Brasil.',
  -- achievements_en
  E'- 1946: Began capoeira training under Mestre Caiçara in Bahia
- 1946+: Became disciple of Mestre Waldemar da Liberdade (o Poeta)
- 1959: Arrived in São Paulo; began teaching in boarding house corridor in Mooca
- 1960s: Established at CMTC Club; taught capoeira and freestyle wrestling; served as meeting point for Bahian capoeiristas
- 1960s: Founded Associação de Lutas Unidas Capoeira Freitas in Sapopemba, São Paulo
- 1971: Recognized by Mestre Bimba as one of "Grupo dos Nove" pioneers of capoeira in São Paulo
- 1972: Trained Pelé for the film "A Marcha de Chico Bondade"
- 1974: Academy was one of 8 founding associations of Federação Paulista de Capoeira
- 1999: Returned to Alagoinhas, Bahia after 40 years in São Paulo
- 2007: Participated in documentary "Reunião dos 9" (Reunion of the Nine)
- 2009: Honored at tribute event at Escola Vera Cruz, São Paulo
- Trained notable students: Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho, Mestre Dulcídio
- Worked as security for comedian Manoel da Nóbrega (Praça da Alegria)
- Appeared in Brazilian telenovelas',
  -- achievements_pt
  E'- 1946: Iniciou treinamento de capoeira com Mestre Caiçara na Bahia
- 1946+: Tornou-se discípulo de Mestre Waldemar da Liberdade (o Poeta)
- 1959: Chegou a São Paulo; começou a ensinar em corredor de pensão na Mooca
- Anos 1960: Estabeleceu-se no Clube CMTC; ensinou capoeira e luta livre; serviu como ponto de encontro para capoeiristas baianos
- Anos 1960: Fundou Associação de Lutas Unidas Capoeira Freitas em Sapopemba, São Paulo
- 1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
- 1972: Treinou Pelé para o filme "A Marcha de Chico Bondade"
- 1974: Academia foi uma das 8 associações fundadoras da Federação Paulista de Capoeira
- 1999: Retornou a Alagoinhas, Bahia após 40 anos em São Paulo
- 2007: Participou do documentário "Reunião dos 9"
- 2009: Homenageado em evento tributo na Escola Vera Cruz, São Paulo
- Treinou alunos notáveis: Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho, Mestre Dulcídio
- Trabalhou como segurança do comediante Manoel da Nóbrega (Praça da Alegria)
- Apareceu em telenovelas brasileiras',
  -- notes_en
  E'BIRTH DATE: April 29, 1926 (exact)
- Multiple sources confirm: Museu da Pessoa, Wiki Urucungo, Portal Capoeira
- Birthplace: Macaquinhos, Bahia (small locality)

DEATH DATE: Unknown
- As of 2009 tribute event, he was 83 years old
- As of ~2014-2016, sources reported him "nearly 90" with health problems (vision issues)
- No confirmed death date found in available sources
- Would be 99-100 years old if still alive in 2026

NAME VARIATIONS:
- "José de Freitas" (full name)
- "Zé de Freitas" (common apelido)
- "Mestre Freitas" (used in some sources)
- "Mestre Zé de Freitas" (full title)

RESIDENCE:
- 1926-1959: Bahia (Macaquinhos, later Alagoinhas area)
- 1959-1999: São Paulo (40 years)
- 1999-: Alagoinhas, Bahia

TEACHERS:
- Mestre Caiçara (Antônio Conceição Moraes) - initial teacher (1946)
- Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, "o Poeta") - primary teacher/mentor

STUDENTS:
- Mestre Pinatti (Djamir Furtado Pinatti) - native paulista who connected with Bahian community through Zé de Freitas
- Mestre Joel - one of first to meet Suassuna and Brasília at CMTC Club
- Mestre Mello (Antônio Gonçalves de Mello)
- Mestre Serginho
- Mestre Dulcídio - "eternal student and friend"; now leads Associação de Lutas Unidas Capoeira

ROLE AS UNIFIER:
- His CMTC Club classes served as meeting point for Bahian capoeiristas arriving in São Paulo
- Suassuna, Brasília, and Joel first met at his classes
- Bridged different traditions and backgrounds in São Paulo capoeira scene

GRUPO DOS NOVE (1971):
- Recognized by Mestre Bimba during his São Paulo visit organized by Mestre Onça
- The nine pioneers: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, Onça
- Received symbolic recognition as "Percursores da Capoeira em São Paulo"

FEDERAÇÃO PAULISTA DE CAPOEIRA (July 14, 1974):
- His academy was one of 8 founding associations
- Other founding associations: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã

MEDIA APPEARANCES:
- 1972: Trained Pelé for film "A Marcha de Chico Bondade"
- Various: Appeared in Brazilian telenovelas
- 2007: Documentary "Reunião dos 9" (Reunion of the Nine)
- 2009: Tribute event filmed for DVD

OTHER WORK:
- Security guard for Manoel da Nóbrega (comedian, "Praça da Alegria")
- Taught freestyle wrestling (luta livre) at CMTC Club alongside capoeira

ACADEMY:
- Name: Associação de Lutas Unidas Capoeira Freitas
- Location: Sapopemba neighborhood, São Paulo
- Current leadership: Mestre Dulcídio
- Note: The "Lutas Unidas" (United Fights) name reflects his teaching of both capoeira and wrestling',
  -- notes_pt
  E'DATA DE NASCIMENTO: 29 de abril de 1926 (exata)
- Múltiplas fontes confirmam: Museu da Pessoa, Wiki Urucungo, Portal Capoeira
- Local de nascimento: Macaquinhos, Bahia (pequena localidade)

DATA DE FALECIMENTO: Desconhecida
- Em 2009 no evento de homenagem, ele tinha 83 anos
- Por volta de 2014-2016, fontes relatavam ele "quase 90" com problemas de saúde (visão)
- Nenhuma data de falecimento confirmada encontrada nas fontes disponíveis
- Teria 99-100 anos se ainda vivo em 2026

VARIAÇÕES DO NOME:
- "José de Freitas" (nome completo)
- "Zé de Freitas" (apelido comum)
- "Mestre Freitas" (usado em algumas fontes)
- "Mestre Zé de Freitas" (título completo)

RESIDÊNCIA:
- 1926-1959: Bahia (Macaquinhos, depois área de Alagoinhas)
- 1959-1999: São Paulo (40 anos)
- 1999-: Alagoinhas, Bahia

MESTRES:
- Mestre Caiçara (Antônio Conceição Moraes) - professor inicial (1946)
- Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, "o Poeta") - professor principal/mentor

ALUNOS:
- Mestre Pinatti (Djamir Furtado Pinatti) - paulista nativo que se conectou com comunidade baiana através de Zé de Freitas
- Mestre Joel - um dos primeiros a conhecer Suassuna e Brasília no Clube CMTC
- Mestre Mello (Antônio Gonçalves de Mello)
- Mestre Serginho
- Mestre Dulcídio - "eterno aluno e amigo"; agora lidera Associação de Lutas Unidas Capoeira

PAPEL COMO UNIFICADOR:
- Suas aulas no Clube CMTC serviram como ponto de encontro para capoeiristas baianos chegando em São Paulo
- Suassuna, Brasília e Joel se conheceram em suas aulas
- Fez a ponte entre diferentes tradições e origens na cena de capoeira paulista

GRUPO DOS NOVE (1971):
- Reconhecido por Mestre Bimba durante sua visita a São Paulo organizada por Mestre Onça
- Os nove pioneiros: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, Onça
- Recebeu reconhecimento simbólico como "Percursores da Capoeira em São Paulo"

FEDERAÇÃO PAULISTA DE CAPOEIRA (14 de julho de 1974):
- Sua academia foi uma das 8 associações fundadoras
- Outras associações fundadoras: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã

APARIÇÕES NA MÍDIA:
- 1972: Treinou Pelé para o filme "A Marcha de Chico Bondade"
- Diversos: Apareceu em telenovelas brasileiras
- 2007: Documentário "Reunião dos 9"
- 2009: Evento tributo filmado para DVD

OUTROS TRABALHOS:
- Segurança de Manoel da Nóbrega (comediante, "Praça da Alegria")
- Ensinou luta livre no Clube CMTC junto com capoeira

ACADEMIA:
- Nome: Associação de Lutas Unidas Capoeira Freitas
- Local: Bairro de Sapopemba, São Paulo
- Liderança atual: Mestre Dulcídio
- Nota: O nome "Lutas Unidas" reflete seu ensino de capoeira e luta livre'
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

-- Source: entities/persons/ze-grande-bonfim.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zé Grande (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930, decade precision):
-- Zé Grande was already established as a leader and teaching when Mestre
-- Gary began training in 1957 at age 12. Zé Grande came to Rio in the early
-- 1950s with his brothers from Bahia. He was described as "best disciple"
-- of Mário Buscapé by the time Bonfim was founded in 1953. Estimating birth
-- around 1930 places him in his early 20s when the group was founded.
-- ============================================================
-- DEATH: Confirmed deceased (sources refer to "the late Master Zé Grande").
-- No death date or year found in sources.
-- ============================================================
-- APELIDO CONTEXT: "Bonfim" distinguishes him from José Carlos Cruz
-- (Mestre Grande/Zé Grande), born 1950, died 2017, from a different lineage
-- (via Zé Maria and Paulinho Salmon). These are DIFFERENT people.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; from the dos Santos family
  'Zé Grande',
  'Bonfim', -- Distinguishes from José Carlos Cruz (Mestre Grande)
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/', 'https://capoeiraliberdade.net.br/view/historia.php']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era
  E'Zé Grande learned capoeira from Mário Buscapé, who brought Bahian Recôncavo traditions to Rio de Janeiro. His style was practical and competitive, emphasizing training high-level fighters who excelled in Rio''s competitions from the mid-1960s. He maintained strict traditional protocols in the roda, such as calling the toque de iuna for mestres-only play. His capoeira was part of the "dangerous" era of the 1960s-70s, characterized by constant headbutts and rasteiras, without uniforms or cords.',
  E'Zé Grande aprendeu capoeira com Mário Buscapé, que trouxe as tradições do Recôncavo Baiano para o Rio de Janeiro. Seu estilo era prático e competitivo, enfatizando o treinamento de lutadores de alto nível que se destacavam nas competições do Rio a partir de meados dos anos 1960. Ele mantinha protocolos tradicionais rígidos na roda, como chamar o toque de iuna para jogar apenas mestres. Sua capoeira fazia parte da era "perigosa" dos anos 1960-70, caracterizada por cabeçadas e rasteiras constantes, sem uniformes ou cordas.',
  -- Life dates
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil', -- From Bahia like his brothers, exact location unknown
  NULL, -- Deceased but year unknown
  NULL,
  NULL,
  -- bio_en
  E'Zé Grande was one of the foundational figures in establishing the Bonfim capoeira lineage in Rio de Janeiro. A native of Bahia, he came to Rio de Janeiro in the early 1950s along with his brothers Irineu dos Santos and Deraldo—all from the dos Santos family, unrelated to their teacher Mário Buscapé despite sharing the same surname.

When Mário Buscapé began teaching capoeira at the Cavan company where he worked, Irineu was his first student. Through Irineu, Mário soon won other followers, including Zé Grande and Deraldo. On January 6, 1953, they founded the Associação Cultural Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in the neighborhood of São Cristóvão. As historian André Lacé wrote: "They didn''t stay there for long, because the space became small due to the large number of students. They moved the academy to the neighborhood of Olaria, a spacious and pleasant place, and there they never stopped, training great capoeiristas, like the late Master Zé Grande, who stood out as their best disciple."

The Bonfim group, led by Mário Buscapé, became famous in Rio de Janeiro for training high-level competitors who often won the competitions that began being organized in the city from the mid-1960s.

In 1969, when Mário Buscapé returned to Bahia, Zé Grande and Deraldo took over leadership of the Bonfim group. Zé Grande served as president of the group, with headquarters later established in the Bonsucesso neighborhood. The group continued to flourish under their direction.

According to Mestre Gary (Mestre 22), who began training at Bonfim in 1957 at age 12, Zé Grande maintained strict traditional protocols in the roda: "Mestre Zé Grande, my mestre, would call for the toque de iuna and only mestres would play—this was the tradition. It was very beautiful to see."

Among the prominent capoeiristas of that era, Gary listed: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—and myself, Mestre 22 da Bonfim." He described this period as a time when capoeira was "very dangerous," with no uniforms or cords—practitioners wore normal clothing and identified simply as "capoeira players."

Zé Grande, along with his brother Deraldo, Mestres Dentinho, and Mintirinha, is credited as one of the initiators of the capoeira roda at the Festa da Penha, which became one of the main street rodas in Rio de Janeiro by the 1970s.

At age 18, Mestre Soldado transitioned to training at the main Bonfim headquarters in Bonsucesso, where he studied under "Mestres Deraldo and Zé Grande (the president of the Bonfim group)." Soldado graduated from Mestre Deraldo in 1973.

Zé Grande trained and formed numerous capoeiristas including Mestre Gary (Mestre 22), who in turn trained Mestres Lébio, Rui Charuto, Mão de Onça, Toinho, Elias, and Mestra Marly Malvadeza—extending the Bonfim lineage to the present day.',
  -- bio_pt
  E'Zé Grande foi uma das figuras fundamentais no estabelecimento da linhagem de capoeira Bonfim no Rio de Janeiro. Natural da Bahia, ele veio para o Rio de Janeiro no início dos anos 1950 junto com seus irmãos Irineu dos Santos e Deraldo—todos da família dos Santos, sem parentesco com seu professor Mário Buscapé apesar de compartilharem o mesmo sobrenome.

Quando Mário Buscapé começou a ensinar capoeira na empresa Cavan onde trabalhava, Irineu foi seu primeiro aluno. Através de Irineu, Mário logo conquistou outros seguidores, incluindo Zé Grande e Deraldo. Em 6 de janeiro de 1953, fundaram a Associação Cultural Bonfim, também conhecida como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço no bairro de São Cristóvão. Como o historiador André Lacé escreveu: "Não ficaram lá por muito tempo, porque o espaço ficou pequeno devido ao grande número de alunos. Mudaram a academia para o bairro de Olaria, um lugar espaçoso e agradável, e lá nunca pararam, treinando grandes capoeiristas, como o saudoso Mestre Zé Grande, que se destacou como o melhor discípulo."

O grupo Bonfim, liderado por Mário Buscapé, tornou-se famoso no Rio de Janeiro por formar competidores de alto nível que frequentemente venciam as competições que começaram a ser organizadas na cidade a partir de meados dos anos 1960.

Em 1969, quando Mário Buscapé retornou à Bahia, Zé Grande e Deraldo assumiram a liderança do grupo Bonfim. Zé Grande atuou como presidente do grupo, com sede posteriormente estabelecida no bairro de Bonsucesso. O grupo continuou a prosperar sob sua direção.

Segundo Mestre Gary (Mestre 22), que começou a treinar no Bonfim em 1957 aos 12 anos, Zé Grande mantinha protocolos tradicionais rígidos na roda: "Mestre Zé Grande, meu mestre, mandava dar o toque de iuna e só jogavam os mestres—essa era a tradição. Era muito bonito de ver."

Entre os capoeiristas proeminentes daquela época, Gary listou: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—e eu mesmo, Mestre 22 da Bonfim." Ele descreveu este período como uma época em que a capoeira era "muito perigosa," sem uniformes ou cordas—os praticantes usavam roupas normais e se identificavam simplesmente como "jogadores de capoeira."

Zé Grande, junto com seu irmão Deraldo, os Mestres Dentinho e Mintirinha, é creditado como um dos iniciadores da roda de capoeira na Festa da Penha, que se tornou uma das principais rodas de rua do Rio de Janeiro nos anos 1970.

Aos 18 anos, Mestre Soldado passou a treinar na sede principal do Bonfim em Bonsucesso, onde estudou com "os Mestres Deraldo e Zé Grande (o presidente do grupo Bonfim)." Soldado se formou com Mestre Deraldo em 1973.

Zé Grande treinou e formou vários capoeiristas incluindo Mestre Gary (Mestre 22), que por sua vez treinou os Mestres Lébio, Rui Charuto, Mão de Onça, Toinho, Elias e Mestra Marly Malvadeza—estendendo a linhagem Bonfim até os dias atuais.',
  -- achievements_en
  'Co-founder of Associação Cultural Bonfim (January 6, 1953); Best disciple of Mestre Mário Buscapé; President of Grupo Bonfim; Co-leader of Grupo Bonfim (from 1969); Initiator of the Roda da Penha (1960s); Trained Mestre Gary (Mestre 22) and other notable capoeiristas',
  -- achievements_pt
  'Co-fundador da Associação Cultural Bonfim (6 de janeiro de 1953); Melhor discípulo de Mestre Mário Buscapé; Presidente do Grupo Bonfim; Co-líder do Grupo Bonfim (a partir de 1969); Iniciador da Roda da Penha (anos 1960); Formou Mestre Gary (Mestre 22) e outros capoeiristas notáveis',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1930, decade):
Mestre Gary began training at Bonfim in 1957 at age 12 under Zé Grande and Deraldo, who were already established instructors. Zé Grande was described as the "best disciple" of Mário Buscapé when the group was founded in 1953. Estimating birth around 1930 places him in his early 20s at founding—old enough to be a skilled capoeirista but still a generation below Mário (b. 1934). The imprecision of "decade" reflects limited documentation.

DEATH: Confirmed deceased. Sources refer to "the late Master Zé Grande" (André Lacé quote) but no death date or year was found. Mário Buscapé''s 2016 memoir may contain more information.

FULL NAME: Unknown. He was from the dos Santos family (same as brothers Irineu and Deraldo), from Bahia. NOT related to Mário dos Santos (Mário Buscapé) despite the same surname.

NAME DISAMBIGUATION:
- This "Zé Grande (Bonfim)" is DIFFERENT from José Carlos Cruz (Mestre Grande/Zé Grande), born November 18, 1950, died December 26, 2017. José Carlos Cruz was from the lineage of Zé Maria via Paulinho Salmon and Mário Buscapé—a separate branch.
- Used apelido_context "Bonfim" to distinguish.

TEACHERS:
- Mário Buscapé (primary, ~early 1950s, Rio de Janeiro)

STUDENTS:
- Mestre Gary / Mestre 22 (began 1957, age 12)
- Mestre Soldado (age 18, Bonsucesso headquarters)
- Guere 22 (also known as Mestre 22, possibly same as Gary)

GROUP LEADERSHIP:
- Co-founded Associação Cultural Bonfim: January 6, 1953 (with Mário Buscapé, Irineu, Deraldo)
- Took over leadership: 1969 (when Mário returned to Bahia)
- Served as President of the group
- Headquarters: Initially São Cristóvão, then Olaria, later Bonsucesso

RODA INVOLVEMENT:
- Roda da Penha: credited as initiator (1960s), with Deraldo, Dentinho, Mintirinha
- Maintained iuna protocol for mestres-only play

MEDIA: None found. Mário Buscapé''s 2016 memoir "A saga de uma lenda viva" (Azougue, Rio) may contain more details.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Mestre Gary começou a treinar no Bonfim em 1957 aos 12 anos com Zé Grande e Deraldo, que já eram instrutores estabelecidos. Zé Grande foi descrito como o "melhor discípulo" de Mário Buscapé quando o grupo foi fundado em 1953. Estimar nascimento por volta de 1930 o coloca no início dos 20 anos na fundação—idade suficiente para ser um capoeirista habilidoso mas ainda uma geração abaixo de Mário (n. 1934). A imprecisão de "década" reflete documentação limitada.

MORTE: Confirmado falecido. Fontes referem-se ao "saudoso Mestre Zé Grande" (citação de André Lacé) mas nenhuma data ou ano de morte foi encontrado. As memórias de Mário Buscapé de 2016 podem conter mais informações.

NOME COMPLETO: Desconhecido. Ele era da família dos Santos (mesma dos irmãos Irineu e Deraldo), da Bahia. NÃO é parente de Mário dos Santos (Mário Buscapé) apesar do mesmo sobrenome.

DESAMBIGUAÇÃO DE NOME:
- Este "Zé Grande (Bonfim)" é DIFERENTE de José Carlos Cruz (Mestre Grande/Zé Grande), nascido em 18 de novembro de 1950, falecido em 26 de dezembro de 2017. José Carlos Cruz era da linhagem de Zé Maria via Paulinho Salmon e Mário Buscapé—uma ramificação separada.
- Usado apelido_context "Bonfim" para distinguir.

MESTRES:
- Mário Buscapé (principal, ~início dos anos 1950, Rio de Janeiro)

ALUNOS:
- Mestre Gary / Mestre 22 (começou 1957, 12 anos)
- Mestre Soldado (18 anos, sede de Bonsucesso)
- Guere 22 (também conhecido como Mestre 22, possivelmente o mesmo que Gary)

LIDERANÇA DO GRUPO:
- Co-fundou Associação Cultural Bonfim: 6 de janeiro de 1953 (com Mário Buscapé, Irineu, Deraldo)
- Assumiu liderança: 1969 (quando Mário retornou à Bahia)
- Atuou como Presidente do grupo
- Sede: Inicialmente São Cristóvão, depois Olaria, posteriormente Bonsucesso

ENVOLVIMENTO EM RODAS:
- Roda da Penha: creditado como iniciador (anos 1960), com Deraldo, Dentinho, Mintirinha
- Mantinha protocolo de iuna para jogo somente de mestres

MÍDIA: Nenhuma encontrada. As memórias de Mário Buscapé de 2016 "A saga de uma lenda viva" (Azougue, Rio) podem conter mais detalhes.'
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

-- Source: entities/persons/olegario-itaparica.sql (CHANGED)
-- ============================================================
-- GENEALOGY PERSON: Olegário (Itaparica)
-- Generated: 2025-12-29
-- ============================================================
-- Full Name: Olegário Veridiano Moreira
-- Title: NULL (not a formal mestre)
-- Occupation: Fisherman
-- Location: Vila de Coroa, Ilha de Itaparica, Bahia
--
-- Grandfather of Mestre Nô (Norival Moreira de Oliveira). First
-- introduced his grandson to capoeira in 1949, when Nô was four
-- years old. Not a formal mestre, but described by his grandson
-- as the man who "opened the door to the world of capoeira".
-- Olegário was a fisherman who would watch capoeira rodas in
-- Salvador when he came to sell his catch.
--
-- BIRTH YEAR ESTIMATION (~1890, decade):
-- If Olegário was a grandfather teaching a 4-year-old in 1949,
-- typical grandfather age would be 50-65 years old. This suggests
-- birth between 1884-1899. Midpoint estimate: ~1890.
--
-- Source: velhosmestres.com, edgardigital.ufba.br, capoeirapalmares.co.uk
--
-- NOTE: DISTINCT from Olegário (teacher of Gato Preto) - that is
-- a different person from Santo Amaro/Salvador. This Olegário is
-- specifically from Itaparica Island and is Mestre Nô's grandfather.
--
-- CAUTION: The "Olegário teacher of Gato Preto" claim comes from a
-- single source (gen.campodemandinga.com.br). The Gato Preto report
-- does NOT list Olegário among his teachers. This could be false info,
-- the same person, or a different undocumented Olegário. Requires
-- careful verification before importing as separate entity.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Olegário Veridiano Moreira',
  'Olegário',
  'Itaparica',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-72', 'https://velhosmestres.com/br/destaques-72', 'https://capoeirapalmares.co.uk/mestre-no/']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Ilha de Itaparica, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Olegário Veridiano Moreira was a fisherman who lived in the village of Coroa on Ilha de Itaparica, an island across the Bay of All Saints from Salvador. He was the maternal grandfather of Norival Moreira de Oliveira (Mestre Nô), one of the most influential capoeira angola mestres in history.\n\nOlegário was not a formal capoeira mestre. He was a pescador—a fisherman—as fishing was the way of life on the island. However, when he traveled to Salvador to sell his catch at the markets, he would watch the capoeira rodas taking place in the streets and waterfront areas of the city.\n\nIn 1949, when his grandson Norival was just four years old, Olegário began sharing what he knew of capoeira with the boy. Young Norival lived with his maternal grandparents—Olegário and his wife Joana Albertina Moreira—until he was approximately five or six years old. During this time, Olegário gave him his first exposure to the art, teaching him movements he had observed in the Salvador rodas.\n\nAs Mestre Nô himself later recalled: "My first instructions in Capoeira were given by my grandfather, Olegário. It was him who gave me the most incentive in this art of Capoeira". Though Olegário could not offer formal training in the manner of the city mestres, he "opened the door to the world of capoeira" for his grandson—a door that would lead Norival to become one of the most prolific teachers in capoeira history, graduating over 100 students to the rank of mestre.\n\nIn 1952, when Norival was seven, the family moved to Massaranduba in Salvador''s Cidade Baixa, where the boy''s formal training began with Mestres Nilton and Cutica. But the seed had been planted years earlier by his grandfather on the island, watching and learning in the informal way that characterized capoeira transmission before the era of formal academies.',
  E'Olegário Veridiano Moreira era um pescador que vivia na vila de Coroa na Ilha de Itaparica, uma ilha através da Baía de Todos os Santos, em frente a Salvador. Ele era o avô materno de Norival Moreira de Oliveira (Mestre Nô), um dos mestres de capoeira angola mais influentes da história.\n\nOlegário não era um mestre formal de capoeira. Ele era pescador—a pesca era o modo de vida na ilha. No entanto, quando viajava a Salvador para vender seu pescado nos mercados, ele assistia às rodas de capoeira que aconteciam nas ruas e áreas portuárias da cidade.\n\nEm 1949, quando seu neto Norival tinha apenas quatro anos, Olegário começou a compartilhar o que sabia de capoeira com o menino. O jovem Norival morava com seus avós maternos—Olegário e sua esposa Joana Albertina Moreira—até ter aproximadamente cinco ou seis anos. Durante esse tempo, Olegário lhe deu sua primeira exposição à arte, ensinando-lhe movimentos que havia observado nas rodas de Salvador.\n\nComo o próprio Mestre Nô recordou mais tarde: "Minhas primeiras instruções na Capoeira foram dadas pelo meu avô, Olegário. Foi ele quem me deu o maior incentivo nesta arte da Capoeira". Embora Olegário não pudesse oferecer treinamento formal à maneira dos mestres da cidade, ele "abriu a porta para o mundo da capoeira" para seu neto—uma porta que levaria Norival a se tornar um dos professores mais prolíficos da história da capoeira, graduando mais de 100 alunos ao nível de mestre.\n\nEm 1952, quando Norival tinha sete anos, a família se mudou para Massaranduba na Cidade Baixa de Salvador, onde o treinamento formal do menino começou com os Mestres Nilton e Cutica. Mas a semente havia sido plantada anos antes por seu avô na ilha, observando e aprendendo da maneira informal que caracterizava a transmissão da capoeira antes da era das academias formais.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (~1890, decade precision):\nIf Olegário was a grandfather teaching a 4-year-old in 1949, typical grandfather age would be 50-65 years old. This suggests birth between 1884-1899. Midpoint estimate: ~1890.\n\nFAMILY:\n- Wife: Joana Albertina Moreira\n- Grandson: Norival Moreira de Oliveira (Mestre Nô, b. 1945)\n- Relationship: Maternal grandfather (Nô lived with maternal grandparents until age 5-6)\n\nOCCUPATION:\n- Fisherman (pescador) on Ilha de Itaparica\n- Would travel to Salvador to sell fish, where he observed capoeira rodas\n\nLOCATION:\n- Vila de Coroa, Ilha de Itaparica, Bahia\n\nCAMPOEIRA ROLE:\n- Not a formal mestre or titled capoeirista\n- Observed rodas in Salvador during fish-selling trips\n- Shared his observations with grandson Norival (Mestre Nô) from 1949\n- Described by Mestre Nô as the one who "opened the door to the world of capoeira"\n- Gave Nô his "first instructions" and "most incentive" in the art\n\nDISTINCTION:\n- DISTINCT from Olegário (teacher of Gato Preto) mentioned in Campo de Mandinga genealogy\n- This Olegário is specifically from Itaparica Island and is Mestre Nô''s grandfather\n- Uses apelido_context ''Itaparica'' to distinguish',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1890, precisão de década):\nSe Olegário era avô ensinando um garoto de 4 anos em 1949, a idade típica de um avô seria 50-65 anos. Isso sugere nascimento entre 1884-1899. Estimativa central: ~1890.\n\nFAMÍLIA:\n- Esposa: Joana Albertina Moreira\n- Neto: Norival Moreira de Oliveira (Mestre Nô, n. 1945)\n- Relação: Avô materno (Nô morou com os avós maternos até os 5-6 anos)\n\nOCUPAÇÃO:\n- Pescador na Ilha de Itaparica\n- Viajava a Salvador para vender peixe, onde observava rodas de capoeira\n\nLOCAL:\n- Vila de Coroa, Ilha de Itaparica, Bahia\n\nPAPEL NA CAPOEIRA:\n- Não era um mestre formal ou capoeirista titulado\n- Observava rodas em Salvador durante viagens para vender peixe\n- Compartilhou suas observações com o neto Norival (Mestre Nô) a partir de 1949\n- Descrito por Mestre Nô como aquele que "abriu a porta para o mundo da capoeira"\n- Deu a Nô suas "primeiras instruções" e "maior incentivo" na arte\n\nDISTINÇÃO:\n- DISTINTO de Olegário (professor de Gato Preto) mencionado na genealogia Campo de Mandinga\n- Este Olegário é especificamente da Ilha de Itaparica e é o avô de Mestre Nô\n- Usa apelido_context ''Itaparica'' para distinguir'
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

-- ============================================================
-- PHASE 2: UPSERT STATEMENTS
-- ============================================================

-- Source: statements/persons/adilson-brasilia.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Adilson (Brasília)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Adilson (Brasília) is the SUBJECT.
-- Note: Uses apelido_context = 'Brasília' to distinguish from other Adilsons.
-- ============================================================

-- Adilson (Brasília) associated_with Tabosa (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Training companions in Brasília; met at SQS 209; competed together at Berimbau de Ouro 1967-1969", "pt": "Companheiros de treino em Brasília; conheceram-se na SQS 209; competiram juntos no Berimbau de Ouro 1967-1969"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'Met at SQS 209 pilotis (~1965). Tabosa described as "one of the most agile capoeiristas in Brazil." Competed together at Berimbau de Ouro. Arraia later visited Adilson''s roda with Tabosa.',
  E'Conheceram-se nos pilotis da SQS 209 (~1965). Tabosa descrito como "um dos mais ágeis capoeiristas do Brasil." Competiram juntos no Berimbau de Ouro. Arraia depois visitou a roda de Adilson com Tabosa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Tabosa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Danadinho (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Training companions in Brasília; met at SQS 209 pilotis", "pt": "Companheiros de treino em Brasília; conheceram-se nos pilotis da SQS 209"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://pt.wikipedia.org/wiki/Mestre_Adilson',
  E'Met at SQS 209 pilotis in Brasília (~1965). Danadinho later became Grupo Senzala co-founder.',
  E'Conheceram-se nos pilotis da SQS 209 em Brasília (~1965). Danadinho depois se tornou co-fundador do Grupo Senzala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Danadinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Arraia (contemporary; visited his roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Arraia visited Adilson''s roda with Mestre Tabosa after returning to Brasília from Bahia; NOT a teacher-student relationship", "pt": "Arraia visitou a roda de Adilson com Mestre Tabosa após retornar a Brasília da Bahia; NÃO foi relação professor-aluno"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'Arraia observed: "In Bahia there was much cunning, but nothing compared to the power of your strikes." Met after Arraia returned from Salvador to Brasília.',
  E'Arraia observou: "Na Bahia existia muita malícia no jogo, porém não viu nada comparável à potência dos nossos golpes." Conheceram-se após Arraia retornar de Salvador para Brasília.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Arraia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Bimba (met in Goiânia 1972-1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '1973-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Met in Goiânia at Mestre Osvaldo''s academy; played in roda directed by Bimba; Bimba observed silently after Adilson defeated Mestre Onça", "pt": "Conheceram-se em Goiânia na academia de Mestre Osvaldo; jogou em roda dirigida por Bimba; Bimba observou em silêncio após Adilson derrotar Mestre Onça"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'Adilson met Bimba in Goiânia 1972-1973 at Mestre Osvaldo''s academy. Played in roda with Bimba directing and Mestre Gigante on pandeiro. Defeated Mestre Onça (Bimba''s adopted son). Bimba later inquired about Adilson''s student Leonides ("Diabo louro").',
  E'Adilson conheceu Bimba em Goiânia 1972-1973 na academia de Mestre Osvaldo. Jogou em roda com Bimba dirigindo e Mestre Gigante no pandeiro. Derrotou Mestre Onça (filho adotivo de Bimba). Bimba depois perguntou sobre o aluno de Adilson, Leonides ("Diabo louro").'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Adilson (Brasília) associated_with Acordeon (competed at 1977 championship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Faced each other in final of Campeonato Brasileiro 1977 at Clube Botafogo; Acordeon won controversially; later reconciled", "pt": "Enfrentaram-se na final do Campeonato Brasileiro 1977 no Clube Botafogo; Acordeon venceu de forma controversa; depois se reconciliaram"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-adilson/',
  E'1977 Campeonato Brasileiro de Capoeira final at Clube Botafogo no Mourisco. Adilson finished 2nd, won technical highlight trophy. Judges'' decision was controversial (audience contested). Years later, Acordeon acknowledged Adilson''s skill.',
  E'Final do Campeonato Brasileiro de Capoeira 1977 no Clube Botafogo no Mourisco. Adilson terminou em 2º, ganhou troféu de destaque técnico. Decisão dos juízes foi controversa (público contestou). Anos depois, Acordeon reconheceu a habilidade de Adilson.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Adilson' AND COALESCE(s.apelido_context, '') = 'Brasília'
  AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Adilson (Brasília) associated_with Fritz (Alfredo) - training companion at SQS 209, Brasília (~1965); competed together at Berimbau de Ouro
--   → Fritz needs import first (in backlog as "Fritz | Alfredo | - | Danadinho import")
-- Adilson (Brasília) founded Grupo Adilson Capoeira - group needs import first
--   → Add Grupo Adilson Capoeira to groups-backlog.md
-- Adilson (Brasília) associated_with Mestre Osvaldo (Goiânia) - hosted encounter with Bimba 1972-1973
--   → Mestre Osvaldo de Souza needs import (Goiânia, brought Bimba to Goiânia)
-- Adilson (Brasília) associated_with Mestre Gigante - played pandeiro at Goiânia roda with Bimba
--   → Mestre Gigante needs verification/import
-- Adilson (Brasília) associated_with Mestre Onça (Bimba's adopted son) - defeated in Goiânia roda
--   → NOTE: This is NOT the same as Onça (SP) or Onça Tigre - this is Bimba's adopted son
--   → Needs import with apelido_context to distinguish

-- ============================================================
-- STUDENTS (to be added when imported)
-- ============================================================
-- Adilson (Brasília) [teacher] → Mestre AC (Antônio Carlos)
-- Adilson (Brasília) [teacher] → Mestre Jomar
-- Adilson (Brasília) [teacher] → Mestre Roberto (Negão/Robertão)
-- Adilson (Brasília) [teacher] → Mestre Marquinhos (Marcus Vinícius) - deceased
-- Adilson (Brasília) [teacher] → Leonides ("Diabo louro")
-- Adilson (Brasília) [teacher] → Sergio-Maluco (taught in Sobradinho)
-- Adilson (Brasília) [teacher] → Abadá (taught at Colégio Rosário)
-- Adilson (Brasília) [teacher] → Ferrugem

-- Source: statements/persons/alfredo-muritiba.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Alfredo (Muritiba)
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Alfredo (Muritiba) is the SUBJECT.
-- Note: Alfredo uses apelido_context = 'Muritiba' to distinguish from
-- other Alfredos in the dataset.
-- ============================================================

-- Alfredo student_of Canjiquinha
-- Confirmed via CapoeiraHub lineage tree and IPHAN portal
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.capoeirahub.net/mestres/691f68fce44abad5a573a024-mestre-roberval?lang=en; https://capoeira.iphan.gov.br/user/infor/5170',
  E'CapoeiraHub lineage shows: Roberval → Alfredo → Canjiquinha → Aberrê → Pastinha. IPHAN portal confirms Alfredo was disciple of Canjiquinha.',
  E'Linhagem CapoeiraHub mostra: Roberval → Alfredo → Canjiquinha → Aberrê → Pastinha. Portal IPHAN confirma que Alfredo foi discípulo de Canjiquinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Alfredo' AND s.apelido_context = 'Muritiba' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: The following relationships have Alfredo as OBJECT (not subject).
-- Per ownership rules, they belong in the SUBJECT's file.
-- These are documented here for reference but should be added to the
-- respective subject's statements file when those persons are imported:
--
-- Olavo student_of Alfredo (Muritiba)
--   → Goes in olavo.sql (Olavo IS in dataset - need to add to olavo statements)
--
-- Roberval student_of Alfredo (Muritiba) - began 1978/79; graduated mestre 1986
--   → Goes in roberval.sql when Roberval is imported
--
-- ============================================================

-- ============================================================
-- UPDATE NEEDED: olavo.sql statements
-- ============================================================
-- The following statement should be added to olavo.sql:
-- Olavo student_of Alfredo (Muritiba)
-- This was noted as pending in olavo.sql:173 before Alfredo was imported.
-- Now that Alfredo is in the dataset, this can be activated.
-- ============================================================

-- Source: statements/persons/antonio-rodrigues.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Antônio Rodrigues
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Antônio Rodrigues is the SUBJECT.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- These relationships are documented but the object entities need import first.

-- Antônio Rodrigues founded Academia de Capoeira Nossa Senhora de Fátima
-- First enclosed capoeira academy in Itabuna; needs group import

-- ============================================================
-- INVERSE RELATIONSHIPS (documented here for reference, SQL goes in subject's file)
-- ============================================================
-- These are relationships where Antônio Rodrigues is the OBJECT, not SUBJECT.
-- Per ownership rule, the SQL for these goes in the SUBJECT's file, not here.

-- Medicina trained_under Antônio Rodrigues → goes in medicina.sql
-- Introduced Medicina to capoeira circles ~1965

-- Lobão student_of Antônio Rodrigues → goes in lobao.sql (when imported)
-- Trained in Itabuna 1960s

-- Miguel Preto student_of Antônio Rodrigues → goes in miguel-preto.sql (when imported)
-- Started 1964, became instructor 1965

-- Régis student_of Antônio Rodrigues → goes in regis.sql (when imported)
-- Started at age 8 (~1965)

-- ============================================================
-- NOTE ON RELATIONSHIPS
-- ============================================================
-- Antônio Rodrigues was primarily a teacher, not a student (no documented teacher).
-- He emerged from the street capoeira tradition of Itabuna in the 1950s-60s.
-- His main documented relationships are as the OBJECT of student_of relationships,
-- which by ownership rules go in his students' files.
--
-- The only SUBJECT relationship would be founding the academy, which requires
-- the group entity to be imported first.

-- Source: statements/persons/baiano-canjiquinha.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Baiano (Canjiquinha)
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Baiano (Canjiquinha) is the SUBJECT.
-- Uses apelido_context to find the correct Baiano record.
-- ============================================================

-- Baiano (Canjiquinha) student_of Canjiquinha (primary teacher 1955-1962)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com, tribunadoreconcavo.com',
  E'Primary teacher relationship. Baiano began training under Canjiquinha at age 10 in Salvador. Seven-year apprenticeship shaped his entire approach to capoeira.',
  E'Relação de mestre principal. Baiano começou a treinar com Canjiquinha aos 10 anos em Salvador. Aprendizado de sete anos moldou toda sua abordagem à capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) trained_under Bimba (Regional course 1962)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '1962-12-31'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com (via web search results)',
  E'Completed Mestre Bimba''s Regional Capoeira course in Salvador in 1962, expanding his technical repertoire beyond his Angola foundation under Canjiquinha.',
  E'Completou o curso de Capoeira Regional de Mestre Bimba em Salvador em 1962, expandindo seu repertório técnico além de sua base de Angola sob Canjiquinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Virgílio da Fazenda Grande (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres from Canjiquinha/Angola lineage.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários da linhagem Canjiquinha/Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Fernando de Saubara (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Fernando de Saubara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Boa Gente (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Nô (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Baiano (Canjiquinha) founded Associação de Capoeira Engenho
--   Group needs import first - add to groups-backlog.md
--
-- Baiano (Canjiquinha) family_of Grandão (Antonio Marcos dos A. Reis)
--   Son needs import first - add to persons-backlog.md
--   relationship_type: 'parent-child'

-- Source: statements/persons/bruno-hermanny.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bruno Hermanny
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Bruno Hermanny is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Bruno Hermanny student_of Sinhozinho
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
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/',
  'Bruno Hermanny trained under Mestre Sinhozinho at his academies in Ipanema during the mid-1940s alongside his brother Rudolf. He is listed among the notable students on the rohermanny.tripod.com tribute site: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..." While Rudolf became famous as a capoeira fighter representing Sinhozinho, Bruno channeled his athleticism into aquatic sports.',
  'Bruno Hermanny treinou sob Mestre Sinhozinho em suas academias em Ipanema durante meados da década de 1940 ao lado de seu irmão Rudolf. Ele está listado entre os alunos notáveis no site de tributo rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..." Enquanto Rudolf se tornou famoso como lutador de capoeira representando Sinhozinho, Bruno canalizou seu atletismo para esportes aquáticos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bruno Hermanny family_of Rudolf Hermanny (brother)
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
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/; https://pt.wikipedia.org/wiki/Bruno_Hermanny; Diário de Justiça do Rio de Janeiro legal records',
  'Bruno de Otero Hermanny and Rudolf de Otero Hermanny were brothers, both sons of Arthur Hermanny and Elisabeth de Otero. They both trained at Mestre Sinhozinho''s academies in Ipanema during the mid-1940s. While Rudolf became famous as a capoeira fighter, Bruno became a champion in underwater fishing and other aquatic sports. Their sibling relationship is confirmed by legal documents from Diário de Justiça do Rio de Janeiro and their shared surname "de Otero Hermanny".',
  'Bruno de Otero Hermanny e Rudolf de Otero Hermanny eram irmãos, ambos filhos de Arthur Hermanny e Elisabeth de Otero. Ambos treinaram nas academias de Mestre Sinhozinho em Ipanema durante meados da década de 1940. Enquanto Rudolf se tornou famoso como lutador de capoeira, Bruno se tornou campeão em pesca subaquática e outros esportes aquáticos. A relação de irmãos é confirmada por documentos legais do Diário de Justiça do Rio de Janeiro e seu sobrenome compartilhado "de Otero Hermanny".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'Rudolf Hermanny'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bruno Hermanny associated_with Cirandinha (fellow training partner at Sinhozinho's)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "fellow student at Sinhozinho''s academy in Ipanema"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://rohermanny.tripod.com/; https://capoeirahistory.com/mestre/master-sinhozinho/',
  'Bruno Hermanny and Cirandinha (Luiz Pereira de Aguiar) were fellow students at Mestre Sinhozinho''s academies in Ipanema during the mid-1940s. While they trained during the same period, Cirandinha became one of Sinhozinho''s primary fighting representatives alongside Bruno''s brother Rudolf, competing in the 1949 and 1953 challenges.',
  'Bruno Hermanny e Cirandinha (Luiz Pereira de Aguiar) foram colegas alunos nas academias de Mestre Sinhozinho em Ipanema durante meados da década de 1940. Enquanto treinaram no mesmo período, Cirandinha se tornou um dos principais representantes de luta de Sinhozinho ao lado do irmão de Bruno, Rudolf, competindo nos desafios de 1949 e 1953.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'Cirandinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bruno Hermanny associated_with André Jansen (fellow training partner at Sinhozinho's)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "fellow student at Sinhozinho''s academy in Ipanema"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/',
  'Bruno Hermanny and André Jansen were both listed among Sinhozinho''s notable students on rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..."',
  'Bruno Hermanny e André Jansen foram listados entre os alunos notáveis de Sinhozinho em rohermanny.tripod.com: "Between those who exercised under Sinhôzinho''s guidance we can highlight: Paulo Azeredo, Paulo Amaral, Sílvio M. Padilha, André Jansen, Bruno and Rudolf Hermanny..."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bruno Hermanny' AND o.apelido = 'André Jansen'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: The following relationship is FAMILY, not capoeira:
-- Bruno Hermanny family_of Thereza Hermanny - sister (1930-2015), married Tom Jobim; NOT a capoeirista
-- Bruno Hermanny family_of Corina Hermanny Freire - sister; NOT a capoeirista
-- These non-capoeira family relationships are documented in notes but not imported as statements.

-- Source: statements/persons/bulgario.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bulgário
-- Generated: 2026-01-02
-- Updated: 2026-01-02 - Removed redundant associated_with statements
--   (Gengibirra membership already connects all roda participants)
-- ============================================================
-- Contains all relationships where Bulgário is the SUBJECT.
-- ============================================================

-- Bulgário member_of Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Participated in the Liberdade/Gengibirra roda pre-1941, documented in A Tarde 1969
-- NOTE: He was NOT among the 22 founding mestres - he was a regular participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A Tarde, February 24, 1969; velhosmestres.com/en/pastinha-1969-3',
  'Regular participant at the Liberdade/Gengibirra roda on Sundays. Listed among the mestres who gathered there, presided over by civil guard Amorzinho. NOT among the 22 founding mestres - was a participant rather than organizational founder.',
  'Participante regular na roda da Liberdade/Gengibirra aos domingos. Listado entre os mestres que se reuniam lá, presidida pelo guarda civil Amorzinho. NÃO estava entre os 22 mestres fundadores - era participante e não fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Bulgário'
  AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional associated_with statements needed.
-- All Gengibirra roda contemporaries (Amorzinho, Totonho de Maré,
-- Noronha, Livino, Américo Ciência, Barbosa, Eulâmpio, Butique,
-- Domingos Magalhães, etc.) can be inferred via shared member_of
-- relationship to the Gengibirra group.
-- ============================================================

-- Source: statements/persons/butique.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Butique
-- Generated: 2026-01-02
-- Updated: 2026-01-02 - Removed redundant associated_with statements
--   (Gengibirra membership already connects all roda participants)
-- ============================================================
-- Contains all relationships where Butique is the SUBJECT.
-- ============================================================

-- Butique member_of Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Participated in the Liberdade/Gengibirra roda pre-1941, documented in A Tarde 1969
-- NOTE: He was NOT among the 22 founding mestres - he was a regular participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A Tarde, February 24, 1969; velhosmestres.com/en/pastinha-1969-3',
  'Regular participant at the Liberdade/Gengibirra roda on Sundays. Listed among the mestres who gathered there, presided over by civil guard Amorzinho. NOT among the 22 founding mestres - was a participant rather than organizational founder.',
  'Participante regular na roda da Liberdade/Gengibirra aos domingos. Listado entre os mestres que se reuniam lá, presidida pelo guarda civil Amorzinho. NÃO estava entre os 22 mestres fundadores - era participante e não fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Butique'
  AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional associated_with statements needed.
-- All Gengibirra roda contemporaries (Amorzinho, Totonho de Maré,
-- Noronha, Livino, Américo Ciência, Barbosa, Eulâmpio, Bulgário,
-- Domingos Magalhães, etc.) can be inferred via shared member_of
-- relationship to the Gengibirra group.
-- ============================================================

-- Source: statements/persons/cassarangongo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Cassarangongo
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Cassarangongo is the SUBJECT.
-- ============================================================

-- Cassarangongo associated_with Espinho Remoso
-- (They met at Engenho da Pindoba, worked together, played capoeira together,
-- and became great friends - reuniting later in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Training companions and coworkers at Engenho da Pindoba; played capoeira together after work; reunited in Salvador as great friends"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT - Mestre Espinho Remoso',
  'Met at Engenho da Pindoba (between Santo Amaro and Candeias), worked together in sugarcane fields, played capoeira after work, became great friends, later reunited in Salvador.',
  'Conheceram-se no Engenho da Pindoba (entre Santo Amaro e Candeias), trabalharam juntos nos canaviais, jogavam capoeira após o trabalho, tornaram-se grandes amigos, depois se reencontraram em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cassarangongo' AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: If the "Elói" at Largo do Tanque is confirmed as Cassarangongo,
-- the following relationships would be added:
--
-- Cassarangongo associated_with Aberrê (Largo do Tanque ~1938)
-- Cassarangongo associated_with Bimba (Largo do Tanque ~1938)
-- Cassarangongo associated_with Pastinha (Largo do Tanque ~1938)
-- Cassarangongo associated_with Siri de Mangue (Largo do Tanque ~1938)
--
-- These are NOT added because the identification of "Elói" at Largo do
-- Tanque with Cassarangongo (Antônio Elói dos Santos) is UNCERTAIN.

-- Source: statements/persons/dende.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Dendê (merged identity)
-- Generated: 2026-01-03 (merged from dende-sfc.sql and dende-santo-amaro.sql)
-- ============================================================
-- Contains all relationships where Dendê is the SUBJECT.
-- This merged file combines relationships from both Santo Amaro
-- and São Francisco do Conde sources.
-- ============================================================

-- ============================================================
-- BESOURO'S COMPANIONS (associated_with - training peers)
-- NOTE: Source says Dendê "met up with" and "trained with" these
-- capoeiristas, indicating peers/contemporaries, NOT teacher-student.
-- ============================================================

-- Dendê associated_with Siri de Mangue (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Training companions in the Recôncavo capoeira circle; both part of Besouro''s network of practitioners"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com): "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro"',
  'Dendê and Siri de Mangue were training companions in Besouro Mangangá''s circle. Sources describe them as contemporaries who "met up with" each other, not as teacher-student.',
  'Dendê e Siri de Mangue eram companheiros de treino no círculo de Besouro Mangangá. Fontes os descrevem como contemporâneos que "se encontravam", não como professor-aluno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Neco Canário Pardo (training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Training companions in the Recôncavo capoeira circle; both part of Besouro''s network of practitioners"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com): "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro"',
  'Dendê and Canário Pardo (Neco Canário Pardo) were training companions in Besouro Mangangá''s circle. Sources describe them as contemporaries who "met up with" each other, not as teacher-student.',
  'Dendê e Canário Pardo (Neco Canário Pardo) eram companheiros de treino no círculo de Besouro Mangangá. Fontes os descrevem como contemporâneos que "se encontravam", não como professor-aluno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- BESOURO'S CIRCLE (associated_with)
-- ============================================================

-- Dendê associated_with Besouro Mangangá
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Part of Besouro''s circle of companions in the Recôncavo; Besouro reportedly visited Dendê''s family home"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com)',
  'Dendê was part of Besouro Mangangá''s circle of companions in the Recôncavo. According to Mário Buscapé, Besouro visited their family home. Ended with Besouro''s death in 1924.',
  'Dendê fazia parte do círculo de companheiros de Besouro Mangangá no Recôncavo. Segundo Mário Buscapé, Besouro visitou a casa da família. Terminou com a morte de Besouro em 1924.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Dendê family_of Mário Buscapé (uncle)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "uncle", "family_side": "unknown"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com)',
  'Dendê was the uncle of Mário Buscapé. Also served as his first capoeira teacher from ~1942.',
  'Dendê era tio de Mário Buscapé. Também serviu como seu primeiro professor de capoeira a partir de ~1942.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê family_of José Bidel (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brother", "details": "Brothers who both practiced capoeira and trained with Besouro''s companions; both taught Mário Buscapé"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé testimony (capoeirahistory.com)',
  'Dendê and José Bidel were brothers. Both practiced capoeira, trained with Besouro''s companions, and together taught Mário Buscapé.',
  'Dendê e José Bidel eram irmãos. Ambos praticavam capoeira, treinaram com os companheiros de Besouro e juntos ensinaram Mário Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- SANTO AMARO CONTEMPORARIES (associated_with)
-- All fellow teachers of Cobrinha Verde
-- ============================================================

-- Dendê associated_with Maitá
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde after Besouro''s death in 1924"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Dendê and Maitá were contemporaries in the Santo Amaro capoeira community. Both listed by Cobrinha Verde among the mestres from whom he learned.',
  'Dendê e Maitá eram contemporâneos na comunidade de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre os mestres com quem aprendeu.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Maitá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Licurí
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Licurí'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Joité
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Joité'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Gasolina
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde; Gasolina killed during Pedrito persecution"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Gasolina was killed during the Pedrito persecution of capoeiristas.',
  'Companheiro professor de capoeira de Santo Amaro. Gasolina foi morto durante a perseguição de Pedrito aos capoeiristas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Doze Homens
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde; Doze Homens was one of Besouro''s companions"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Doze Homens was one of Besouro Mangangá''s companions.',
  'Companheiro professor de capoeira de Santo Amaro. Doze Homens era um dos companheiros de Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Esperidião
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Esperidião'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Juvêncio Grosso
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Juvêncio Grosso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dendê associated_with Espinho Remoso
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow Santo Amaro capoeira teacher; both instructed Cobrinha Verde"}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde testimony in "Capoeira e Mandingas" (1991)',
  'Fellow Santo Amaro capoeira teacher. Both listed by Cobrinha Verde among his teachers.',
  'Companheiro professor de capoeira de Santo Amaro. Ambos listados por Cobrinha Verde entre seus mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dendê' AND s.apelido_context IS NULL
  AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: The "Cobrinha Verde trained_under Dendê" statement
-- belongs in cobrinha-verde.sql (subject = Cobrinha Verde).
-- ============================================================

-- Source: statements/persons/deraldo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Deraldo
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Deraldo is the SUBJECT.
-- ============================================================

-- ============================================================
-- STUDENT_OF RELATIONSHIP
-- ============================================================

-- Deraldo student_of Mário Buscapé
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  E'Learned capoeira from Mário Buscapé in the early 1950s through his brother Irineu, who was Mário''s first student. Training continued until 1969 when Mário returned to Bahia and Deraldo became co-leader of Bonfim.',
  E'Aprendeu capoeira com Mário Buscapé no início dos anos 1950 através de seu irmão Irineu, que foi o primeiro aluno de Mário. O treinamento continuou até 1969 quando Mário retornou à Bahia e Deraldo tornou-se co-líder do Bonfim.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Deraldo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Mário Buscapé' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CO_FOUNDED RELATIONSHIP
-- ============================================================

-- Deraldo co_founded Associação Cultural Bonfim
-- PENDING: Group not yet in dataset
-- Once Associação Cultural Bonfim is imported, add:
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'co_founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   '1953-01-06'::date, 'exact'::genealogy.date_precision,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
--   'Co-founded with Mário Buscapé, Irineu dos Santos, and brother Zé Grande on January 6, 1953.',
--   'Co-fundou com Mário Buscapé, Irineu dos Santos e o irmão Zé Grande em 6 de janeiro de 1953.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Deraldo' AND o.name = 'Associação Cultural Bonfim'
-- ON CONFLICT ... DO NOTHING;

-- ============================================================
-- LEADS RELATIONSHIP
-- ============================================================

-- Deraldo leads Associação Cultural Bonfim (from 1969)
-- PENDING: Group not yet in dataset
-- Once imported, add leads relationship starting 1969

-- ============================================================
-- FAMILY_OF RELATIONSHIPS
-- ============================================================

-- Deraldo family_of Zé Grande (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  E'Brothers from the dos Santos family of Bahia. They came to Rio together in the early 1950s and co-led Grupo Bonfim from 1969.',
  E'Irmãos da família dos Santos da Bahia. Vieram juntos para o Rio no início dos anos 1950 e co-lideraram o Grupo Bonfim a partir de 1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Deraldo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Zé Grande' AND o.apelido_context = 'Bonfim'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATED_WITH RELATIONSHIPS (co-initiators of Roda da Penha)
-- ============================================================

-- Deraldo associated_with Dentinho (co-initiator of Roda da Penha)
-- PENDING: Dentinho not yet in dataset
-- Once Dentinho is imported, add:
-- INSERT INTO genealogy.statements (...)
--   WHERE s.apelido = 'Deraldo' AND o.apelido = 'Dentinho'
--   properties: '{"association_context": "Co-initiators of the Roda da Penha (1960s)"}'

-- Deraldo associated_with Mintirinha (co-initiator of Roda da Penha)
-- PENDING: Mintirinha not yet in dataset
-- Once Mintirinha is imported, add:
-- INSERT INTO genealogy.statements (...)
--   WHERE s.apelido = 'Deraldo' AND o.apelido = 'Mintirinha'
--   properties: '{"association_context": "Co-initiators of the Roda da Penha (1960s)"}'

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Deraldo co_founded Associação Cultural Bonfim - group needs import
-- Deraldo leads Associação Cultural Bonfim (from 1969) - group needs import
-- Deraldo associated_with Dentinho - Dentinho needs import
-- Deraldo associated_with Mintirinha - Mintirinha needs import
-- Deraldo family_of Irineu - Irineu needs import (third brother)

-- Source: statements/persons/domingos-magalhaes.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Domingos Magalhães
-- Generated: 2026-01-02
-- Updated: 2026-01-02 - Removed redundant associated_with statements
--   (Gengibirra membership already connects all roda participants)
-- ============================================================
-- Contains all relationships where Domingos Magalhães is the SUBJECT.
-- ============================================================

-- Domingos Magalhães member_of Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Participated in the Liberdade/Gengibirra roda pre-1941, documented in A Tarde 1969
-- NOTE: He was NOT among the 22 founding mestres - he was a regular participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A Tarde, February 24, 1969; velhosmestres.com/en/pastinha-1969-3',
  'Regular participant at the Liberdade/Gengibirra roda on Sundays. Listed among the mestres who gathered there, presided over by civil guard Amorzinho. NOT among the 22 founding mestres - was a participant rather than organizational founder.',
  'Participante regular na roda da Liberdade/Gengibirra aos domingos. Listado entre os mestres que se reuniam lá, presidida pelo guarda civil Amorzinho. NÃO estava entre os 22 mestres fundadores - era participante e não fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Domingos Magalhães'
  AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Domingos Magalhães associated_with Eulâmpio
-- Context: SPECIFIC relationship beyond roda membership - Pastinha named BOTH
-- as capable Federation organizers in 1969 interview
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Named together by Pastinha as capable Federation organizers (1969)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1969',
  'Pastinha named both as capable mestres who could organize a Federation in 1969: "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães... esses mestres poderiam fazer um bom trabalho."',
  'Pastinha nomeou ambos como mestres capazes que poderiam organizar uma Federação em 1969: "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães... esses mestres poderiam fazer um bom trabalho."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Domingos Magalhães' AND o.apelido = 'Eulâmpio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional associated_with statements for other
-- Gengibirra contemporaries. Membership in Gengibirra group
-- already connects all roda participants.
-- ============================================================

-- Source: statements/persons/esperidiao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Esperidião
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Esperidião is the SUBJECT.
-- ============================================================

-- No statements to generate at this time.
-- Esperidião predates documented lineage records:
-- - His teachers are unknown
-- - His students include Cobrinha Verde (but that statement belongs in cobrinha-verde.sql as CV is the subject)
-- - His group affiliations are unknown (informal street capoeira era)

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- No pending relationships identified.
-- The trained_under relationship between Cobrinha Verde and Esperidião
-- should be added to cobrinha-verde.sql if not already present.

-- Source: statements/persons/espinho-remoso.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Espinho Remoso
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Espinho Remoso is the SUBJECT.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Espinho Remoso family_of Virgílio da Fazenda Grande (father-son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-12-03'::date, 'exact'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"relationship": "father"}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (2008)',
  'Espinho Remoso was the father of Virgílio. Virgílio was his only child with wife Edite Isabel dos Santos.',
  'Espinho Remoso era o pai de Virgílio. Virgílio era seu único filho com a esposa Edite Isabel dos Santos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TEACHING RELATIONSHIPS
-- ============================================================

-- Espinho Remoso teacher_of Cobrinha Verde
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'teacher_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Online (Cobrinha Verde), Portal Capoeira (Cobrinha Verde)',
  'Listed among Cobrinha Verde''s teachers in Santo Amaro alongside Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, and Neco Canário Pardo.',
  'Listado entre os professores de Cobrinha Verde em Santo Amaro junto com Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso e Neco Canário Pardo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES / ASSOCIATIONS (Jaqueira do Carneiro Roda)
-- ============================================================

-- Espinho Remoso associated_with Waldemar (roda at Jaqueira do Carneiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in Fazenda Grande do Retiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (Mestre Virgílio)',
  'Waldemar attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in the 1950s.',
  'Waldemar frequentava a roda de domingo de Espinho Remoso em Jaqueira do Carneiro nos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Espinho Remoso associated_with Paulo dos Anjos (roda at Jaqueira do Carneiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in Fazenda Grande do Retiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (Mestre Virgílio)',
  'Paulo dos Anjos attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in the 1950s. Paulo later gave Virgílio his mestre title.',
  'Paulo dos Anjos frequentava a roda de domingo de Espinho Remoso em Jaqueira do Carneiro nos anos 1950. Paulo posteriormente deu a Virgílio seu título de mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Paulo dos Anjos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Espinho Remoso associated_with Zacarias Boa Morte (roda at Jaqueira do Carneiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in Fazenda Grande do Retiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (Mestre Virgílio)',
  'Zacarias Boa Morte attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in the 1950s.',
  'Zacarias Boa Morte frequentava a roda de domingo de Espinho Remoso em Jaqueira do Carneiro nos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Zacarias Boa Morte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES (Jornal Metropolitano 1960)
-- ============================================================

-- Espinho Remoso associated_with Traíra (1960 article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both named as outstanding capoeiristas of Liberdade neighborhood in 1960 Jornal Metropolitano"}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal Metropolitano (1960), Wikipedia PT (Mestre Espinho Remoso)',
  'Both named as outstanding capoeiristas of the Liberdade neighborhood in 1960.',
  'Ambos nomeados como capoeiristas destacados do bairro da Liberdade em 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Espinho Remoso associated_with Bimba (1960 article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both named as outstanding capoeiristas of Liberdade neighborhood in 1960 Jornal Metropolitano"}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal Metropolitano (1960), Wikipedia PT (Mestre Espinho Remoso)',
  'Both named as outstanding capoeiristas of the Liberdade neighborhood in 1960.',
  'Ambos nomeados como capoeiristas destacados do bairro da Liberdade em 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Espinho Remoso trained_under Cassarangongo - needs Cassarangongo import first (in persons-backlog.md)
-- Espinho Remoso leads Roda de Jaqueira do Carneiro - needs group import first (in groups-backlog.md)
-- Espinho Remoso teacher_of Diogo - needs Mestre Diogo import first (add to persons-backlog.md)
-- Espinho Remoso teacher_of Fulô, Florzinho, Valdir, Loriano da Boca do Rio, Gerônimo, Raimundo,
--   Antônio Catarino, Dario do Pandeiro, Buiu, Florisvaldo, Moisés, Valdomiro, Chico Zoião, Firmino
--   (15 students documented - most unlikely to have sufficient data for import)

-- Source: statements/persons/eulampio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Eulâmpio
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Eulâmpio is the SUBJECT.
-- ============================================================

-- Eulâmpio student_of Cobrinha Verde
-- Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Moreno, Gigante
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeira.online/history/mestres/cobrinha-verde/, https://pt.wikipedia.org/wiki/Mestre_Cobrinha_Verde',
  E'Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Moreno, and Gigante in Portuguese Wikipedia and capoeira.online sources. Called "brother" by Cobrinha Verde in his autobiography, suggesting extremely close relationship. Training dates unknown.',
  E'Listado como aluno de Cobrinha Verde junto com João Grande, João Pequeno, Moreno e Gigante na Wikipédia em português e fontes do capoeira.online. Chamado de "irmão" por Cobrinha Verde em sua autobiografia, sugerindo relacionamento extremamente próximo. Datas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eulâmpio' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eulâmpio associated_with Cobrinha Verde
-- "Brother" designation indicates close personal/professional bond beyond student-teacher
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "Called brother by Cobrinha Verde; accompanied him to naval base presentation with Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.online/history/mestres/cobrinha-verde/',
  E'Cobrinha Verde stated "Eu e Eulâmpio - aquele que eu chamava de irmão" (Eulampio - who I called my brother) in his autobiography, describing their attendance at a naval base presentation in São Tomé de Paripe with Mestre Pastinha. The "brother" designation indicates an extraordinarily close bond.',
  E'Cobrinha Verde declarou "Eu e Eulâmpio - aquele que eu chamava de irmão" em sua autobiografia, descrevendo sua participação em uma apresentação na base naval de São Tomé de Paripe com Mestre Pastinha. A designação de "irmão" indica um vínculo extraordinariamente próximo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eulâmpio' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eulâmpio associated_with Pastinha
-- Traveled together to naval base presentation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "Accompanied Pastinha and Cobrinha Verde to naval base presentation at São Tomé de Paripe"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeira.online/history/mestres/cobrinha-verde/',
  E'Eulâmpio accompanied Mestre Pastinha and Cobrinha Verde to a capoeira presentation at the São Tomé de Paripe naval base, as recounted in Cobrinha Verde''s autobiography.',
  E'Eulâmpio acompanhou Mestre Pastinha e Cobrinha Verde a uma apresentação de capoeira na base naval de São Tomé de Paripe, conforme relatado na autobiografia de Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eulâmpio' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eulâmpio member_of Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Participated in the Liberdade/Gengibirra roda pre-1941, documented in A Tarde 1969
-- NOTE: He was NOT among the 22 founding mestres - he was a regular participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A Tarde, February 24, 1969; velhosmestres.com/en/pastinha-1969-3',
  'Regular participant at the Liberdade/Gengibirra roda on Sundays. Listed among the mestres who gathered there. NOT among the 22 founding mestres - was a participant rather than organizational founder.',
  'Participante regular na roda da Liberdade/Gengibirra aos domingos. Listado entre os mestres que se reuniam lá. NÃO estava entre os 22 mestres fundadores - era participante e não fundador organizacional.'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Eulâmpio'
  AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional associated_with statements for other
-- Gengibirra contemporaries. Membership in Gengibirra group
-- already connects all roda participants.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Eulâmpio co_founded CECA - CECA group profile needs import first

-- Source: statements/persons/fernandinho.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Fernandinho
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Fernandinho is the SUBJECT.
-- ============================================================

-- Fernandinho trained_under Nilton (brother, first capoeira teacher in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'First capoeira training from older brother Nilton in Massaranduba, Salvador. Nilton had trained under Ninho, Pierrô, and Zeca do Uruguai.',
  E'Primeiro treinamento de capoeira com irmão mais velho Nilton em Massaranduba, Salvador. Nilton havia treinado com Ninho, Pierrô e Zeca do Uruguai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Nilton' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho student_of Caiçara (primary teacher in Rio de Janeiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Fernandinho became contra-mestre under Mestre Caiçara in Rio de Janeiro. Caiçara was known for training contra-mestres from his fish market in Jardim Cruzeiro.',
  E'Fernandinho tornou-se contra-mestre de Mestre Caiçara no Rio de Janeiro. Caiçara era conhecido por treinar contra-mestres de seu mercado de peixe no Jardim Cruzeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho received_title_from Caiçara (contra-mestre title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Received contra-mestre title from Mestre Caiçara. Diploma signed by Silvestre (Ferreirinha), fellow contra-mestre of Caiçara.',
  E'Recebeu título de contra-mestre de Mestre Caiçara. Diploma assinado por Silvestre (Ferreirinha), também contra-mestre de Caiçara.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho associated_with Silvestre (diploma signed by Silvestre)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "diploma_signatory"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Silvestre (Ferreirinha), as fellow contra-mestre of Caiçara, signed Fernandinho''s contra-mestre diploma.',
  E'Silvestre (Ferreirinha), como colega contra-mestre de Caiçara, assinou o diploma de contra-mestre de Fernandinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho family_of Nilton (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Younger brother of Nilton Moraes Paes. Both sons of the Moraes Paes family of Massaranduba.',
  E'Irmão mais novo de Nilton Moraes Paes. Ambos filhos da família Moraes Paes de Massaranduba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Nilton' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernandinho family_of Cutica (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  E'Younger brother of Cutica (Nelson Moraes Paes). Both sons of the Moraes Paes family of Massaranduba.',
  E'Irmão mais novo de Cutica (Nelson Moraes Paes). Ambos filhos da família Moraes Paes de Massaranduba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernandinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Cutica' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Fernandinho associated_with Dentinho - needs import first (Dentinho was Fernandinho's student; mentioned in esquiva.wordpress.com testimony)
-- Fernandinho associated_with Mestre Zé - needs import first (fellow contra-mestre of Caiçara)
-- Fernandinho associated_with Paulo Santo Amaro - needs import first (fellow contra-mestre of Caiçara)
-- Fernandinho associated_with Camisa - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Gado - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Macaco Preto - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Macaco Branco - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Touro - already in dataset as "Touro" but needs verification if same person
-- Fernandinho associated_with Nacional - needs verification and import (contemporary in Rio)
-- Fernandinho associated_with Medeiros - needs verification and import (contemporary in Rio)

-- Source: statements/persons/fernando-de-saubara.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Fernando de Saubara
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Fernando de Saubara is the SUBJECT.
-- ============================================================

-- Fernando de Saubara student_of Pastinha
-- Fernando is documented as "one of the last remaining capoeiristas trained by Mestre Pastinha"
-- Training timeline uncertain; likely 1960s when Pastinha's CECA was active
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Fernando is described as "one of the last remaining capoeiristas trained by Mestre Pastinha" at the VI Rede Capoeira event (Jan 2025). Training dates not documented. Pastinha taught at CECA 1941-1973.',
  E'Fernando é descrito como "um dos últimos capoeiristas remanescentes formados por Mestre Pastinha" no evento VI Rede Capoeira (jan 2025). Datas de treinamento não documentadas. Pastinha ensinou no CECA 1941-1973.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS (contemporaries honored together)
-- ============================================================

-- Fernando de Saubara associated_with Virgílio da Fazenda Grande
-- Co-honorees at VI Rede Capoeira (January 2025) as octogenarian mestres
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22, 2025. Both octogenarian mestres trained by Pastinha (Virgílio indirectly through father Espinho Remoso and Paulo dos Anjos; Fernando directly).',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22 de janeiro de 2025. Ambos mestres octogenários formados por Pastinha (Virgílio indiretamente através do pai Espinho Remoso e Paulo dos Anjos; Fernando diretamente).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernando de Saubara associated_with Boa Gente
-- Co-honorees at VI Rede Capoeira (January 2025) as octogenarian mestres
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22, 2025. Both octogenarian mestres with connections to Pastinha lineage.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22 de janeiro de 2025. Ambos mestres octogenários com conexões à linhagem de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Fernando de Saubara associated_with Nô
-- Co-honorees at VI Rede Capoeira (January 2025) as octogenarian mestres
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna do Recôncavo (Jan 2025) - VI Rede Capoeira',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Fernando de Saubara' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Fernando de Saubara associated_with Baiano (Canjiquinha) - Edvaldo dos Santos Reis
--   VI Rede Capoeira 2025 co-honoree; Baiano is in backlog, not yet imported

-- Source: statements/persons/gary-bonfim.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Gary (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Gary (Bonfim) is the SUBJECT.
-- Gary is also known as Mestre 22, Mestre 22 da Bonfim, Guere 22.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- Gary student_of Zé Grande (Bonfim)
-- Primary teacher at Bonfim from 1957; Zé Grande needs import first

-- Gary student_of Deraldo
-- Co-leader of Bonfim; taught alongside Zé Grande from 1957; needs import first

-- Gary trained_under Veludo (Bonfim)
-- Specialized instruction in cabeçada technique; Veludo needs import first

-- Gary founded Associação Cultural de Capoeira Liberdade
-- Group needs import first

-- ============================================================
-- STUDENTS OF GARY (reverse relationships - documented here for reference)
-- These statements belong in the STUDENT's file, not Gary's file.
-- ============================================================

-- Lébio student_of Gary - Lébio needs import first
-- Rui Charuto student_of Gary - Rui Charuto (born 1959, started 1966-1967) needs import first
-- Mão de Onça student_of Gary - Mão de Onça needs import first
-- Toinho student_of Gary - Toinho needs import first
-- Elias student_of Gary - Elias (José Elias Da Silva) needs import first
-- Marly Malvadeza student_of Gary - Marly needs import first

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Gary family_of Marly Malvadeza
-- Wife relationship; Marly needs import first
-- properties: {"relationship_type": "spouse"}

-- ============================================================
-- ASSOCIATED CONTEMPORARIES
-- These statements go in the associate's file (they are the subject)
-- Documented here for lineage reference:
-- ============================================================
-- Context: Gary listed these as notable capoeiristas of his era (1960s-70s):
-- Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha,
-- Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado,
-- Martins, Marlon

-- Celso do Engenho associated_with Gary - EXISTS in dataset
-- Statement already documented in celso-do-engenho.sql as pending

-- Source: statements/persons/gilvan.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Gilvan
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Gilvan is the SUBJECT.
-- Gilvan has no apelido_context (unlike Joel who uses 'São Paulo').
--
-- NOTE: Contemporaries in Grupo dos Nove and Praça da República rodas
-- are NOT included as associated_with - being in the same group/scene
-- does not constitute a meaningful direct relationship.
-- ============================================================

-- Gilvan family_of Joel (SP) - brother
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-54, fontedogravata.org',
  'Brothers; both born in Bahia (Santo Amaro/Feira de Santana region); both migrated to São Paulo in 1960s; both members of Grupo dos Nove (1971); Joel gave impassioned speech at Paulo Gomes funeral noting he had "already lost his brother Gilvan"',
  'Irmãos; ambos nascidos na Bahia (região de Santo Amaro/Feira de Santana); ambos migraram para São Paulo nos anos 1960; ambos membros do Grupo dos Nove (1971); Joel fez discurso emocionado no funeral de Paulo Gomes observando que "já havia perdido seu irmão Gilvan"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilvan' AND s.apelido_context IS NULL
  AND o.apelido = 'Joel' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gilvan associated_with Bimba (Grupo dos Nove recognition, 1971)
-- Direct recognition by Bimba during his 1971 São Paulo visit
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Recognized as one of Grupo dos Nove pioneers by Bimba during 1971 São Paulo visit"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, journals.openedition.org',
  'Bimba visited São Paulo in 1971 at invitation of Mestre Onça; personally recognized Gilvan as one of the "Grupo dos Nove" (Group of Nine) pioneers of capoeira in São Paulo',
  'Bimba visitou São Paulo em 1971 a convite de Mestre Onça; reconheceu pessoalmente Gilvan como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilvan' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gilvan student_of Arara (Fernando Vasconcelos)? - UNCONFIRMED
-- Note: Brother Joel learned from Arara. Gilvan's teacher is unknown.
-- Arara is in backlog but not yet imported. If confirmed, add relationship after import.
--
-- Gilvan member_of Roda da Praça da República - GROUP in backlog
-- Add after group is imported
--
-- ============================================================
-- NOT INCLUDED (contemporaries, not direct relationships):
-- ============================================================
-- Suassuna, Brasília, Limão, Silvestre, Pinatti, Zé de Freitas, Onça (SP)
-- - Fellow members of Grupo dos Nove (1971)
-- - Being recognized together does not constitute direct relationship between them
--
-- Ananias
-- - Both frequented Praça da República rodas
-- - Being at the same roda does not constitute direct relationship

-- Source: statements/persons/irineu-bonfim.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Irineu (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Irineu is the SUBJECT.
-- ============================================================

-- Irineu (Bonfim) student_of Mário Buscapé
-- Irineu was the first student of Mário Buscapé, meeting him at the Cavan
-- company in Rio de Janeiro in the early 1950s. Through Irineu, Mário gained
-- access to the dos Santos brothers (Zé Grande, Deraldo) who became co-founders
-- of Grupo Bonfim.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'First student of Mário Buscapé in Rio de Janeiro. Met at Cavan company (lamp post manufacturer). Through Irineu, Mário gained his brothers Zé Grande and Deraldo as students.',
  'Primeiro aluno de Mário Buscapé no Rio de Janeiro. Conheceram-se na empresa Cavan (fabricante de postes de luz). Através de Irineu, Mário ganhou seus irmãos Zé Grande e Deraldo como alunos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Irineu' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Irineu (Bonfim) family_of Zé Grande (Bonfim)
-- The dos Santos brothers (Irineu, Zé Grande, Deraldo) came to Rio from Bahia
-- together in the early 1950s. They are NOT related to Mário dos Santos (Mário
-- Buscapé) despite sharing the same surname.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Brothers from the dos Santos family of Bahia. All three came to Rio de Janeiro together in the early 1950s.',
  'Irmãos da família dos Santos da Bahia. Os três vieram juntos para o Rio de Janeiro no início dos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Irineu' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Zé Grande' AND o.apelido_context = 'Bonfim'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Irineu (Bonfim) family_of Deraldo
-- The dos Santos brothers (Irineu, Zé Grande, Deraldo) came to Rio from Bahia
-- together in the early 1950s.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Brothers from the dos Santos family of Bahia. All three came to Rio de Janeiro together in the early 1950s.',
  'Irmãos da família dos Santos da Bahia. Os três vieram juntos para o Rio de Janeiro no início dos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Irineu' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Deraldo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Irineu (Bonfim) co_founded Associação Cultural Bonfim (Grupo Bonfim)
-- The group was founded January 6, 1953. Grupo Bonfim is in groups-backlog.md
-- and needs to be imported before this statement can be added.
-- ============================================================

-- Source: statements/persons/joel-sp.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Joel (São Paulo)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Joel (SP) is the SUBJECT.
-- Uses apelido_context = 'São Paulo' to match the entity.
-- ============================================================

-- Joel (SP) trained_under Zé de Freitas (CMTC Club, ~1965)
-- Note: Using trained_under rather than student_of because Joel's primary teacher was Arara
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'museudapessoa.org, wiki.urucungo.com.br',
  'Trained at CMTC Club where Zé de Freitas taught; listed as one of Zé de Freitas''s formed students; met Suassuna and Brasília at these classes (~1965)',
  'Treinou no Clube CMTC onde Zé de Freitas ensinava; listado como um dos alunos formados de Zé de Freitas; conheceu Suassuna e Brasília nestas aulas (~1965)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Zé de Freitas' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) received_title_from Bimba (mestre title, 1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-54, portalcapoeira.com',
  'Formally recognized as mestre by Mestre Bimba himself in 1972',
  'Formalmente reconhecido como mestre pelo próprio Mestre Bimba em 1972'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Suassuna (met at CMTC Club, 1965; Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Met at Zé de Freitas CMTC Club (1965); fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'museudapessoa.org, velhosmestres.com',
  'Met Suassuna at Zé de Freitas''s CMTC Club classes (~1965); both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Conheceu Suassuna nas aulas de Zé de Freitas no Clube CMTC (~1965); ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Suassuna' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Brasília (met at CMTC Club, 1965; Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Met at Zé de Freitas CMTC Club (1965); fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'museudapessoa.org, velhosmestres.com',
  'Met Brasília at Zé de Freitas''s CMTC Club classes (~1965); both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Conheceu Brasília nas aulas de Zé de Freitas no Clube CMTC (~1965); ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Brasília' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Ananias (Praça da República rodas; collaborated on 1979 LP)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Frequented Praça da República rodas together; Ananias played atabaque/chorus on Joel 1979 LP"}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, discogs.com/release/13640671',
  'Regularly frequented Praça da República rodas together; Ananias participated in Joel''s 1979 LP recording (atabaque, chorus)',
  'Frequentavam juntos regularmente as rodas da Praça da República; Ananias participou da gravação do LP de Joel em 1979 (atabaque, coro)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Ananias' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Limão (Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Praça da República rodas; fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'Frequented Praça da República rodas together; both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Frequentavam juntos as rodas da Praça da República; ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Limão' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Silvestre (Praça da República rodas; Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Praça da República rodas; fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'Frequented Praça da República rodas together; both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Frequentavam juntos as rodas da Praça da República; ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Pinatti (Praça da República rodas; Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Praça da República rodas; fellow Grupo dos Nove member (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'Frequented Praça da República rodas together; both recognized as Grupo dos Nove pioneers by Bimba (1971)',
  'Frequentavam juntos as rodas da Praça da República; ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Pinatti' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) associated_with Onça (SP) (Grupo dos Nove member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow Grupo dos Nove member (1971); Onça organized Bimba visit"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, journals.openedition.org',
  'Both recognized as Grupo dos Nove pioneers by Bimba (1971); Onça organized Bimba''s visit',
  'Ambos reconhecidos como pioneiros do Grupo dos Nove por Bimba (1971); Onça organizou a visita de Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Joel (SP) family_of Gilvan (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-54, fontedogravata.org',
  'Brothers; both born in Bahia (Santo Amaro/Feira de Santana region); both migrated to São Paulo in 1960s; both members of Grupo dos Nove (1971); Joel gave impassioned speech at Paulo Gomes funeral noting he had "already lost his brother Gilvan"',
  'Irmãos; ambos nascidos na Bahia (região de Santo Amaro/Feira de Santana); ambos migraram para São Paulo nos anos 1960; ambos membros do Grupo dos Nove (1971); Joel fez discurso emocionado no funeral de Paulo Gomes observando que "já havia perdido seu irmão Gilvan"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Joel' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Gilvan' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Joel (SP) student_of Arara (Fernando Vasconcelos) - PRIMARY TEACHER - needs import first
-- Joel (SP) founded Associação de Capoeira Ilha de Itapuã - GROUP in backlog
-- Joel (SP) leads Organização Onças de São Paulo - GROUP needs research
-- Joel (SP) leads ABRACAP - Associação Brasil Capoeira - GROUP needs research
-- Joel (SP) associated_with Prof Dado - 1979 LP music director - needs import?
-- Joel (SP) associated_with Prof João Braz - 1979 LP musician - needs import?
-- Joel (SP) associated_with Mestre João - 1979 LP vocalist - needs import?

-- Source: statements/persons/joite.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Joité
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Joité is the SUBJECT.
-- ============================================================

-- No statements to generate at this time.
-- Joité predates documented lineage records:
-- - His teachers are unknown
-- - His students include Cobrinha Verde (but that statement belongs in cobrinha-verde.sql as CV is the subject)
-- - His group affiliations are unknown (informal street capoeira era)

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- No pending relationships identified.
-- The trained_under relationship between Cobrinha Verde and Joité
-- should be added to cobrinha-verde.sql if not already present.

-- Source: statements/persons/juvencio-grosso.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Juvêncio Grosso
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Juvêncio Grosso is the SUBJECT.
-- ============================================================
-- NOTE: Juvêncio Grosso has no relationships where he is the SUBJECT.
--
-- The relationship "Cobrinha Verde trained_under Juvêncio Grosso"
-- is in cobrinha-verde.sql (Cobrinha Verde is the subject).
-- ============================================================
-- DISAMBIGUATION:
-- This is Juvêncio Grosso from Santo Amaro, distinct from Mestre
-- Juvêncio (São Félix context) who taught João Pequeno, Ananias,
-- and Traíra.
-- ============================================================

-- No statements to insert - Juvêncio Grosso has no documented
-- relationships where he is the subject (e.g., no teachers, no
-- founded groups, no titles received).
--
-- His only documented relationship is as OBJECT of:
-- - Cobrinha Verde trained_under Juvêncio Grosso
--   (See: cobrinha-verde.sql)

-- Source: statements/persons/lamartine-pereira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Lamartine Pereira
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Lamartine Pereira is the SUBJECT.
-- Relationships where Lamartine Pereira is the OBJECT should be in
-- the statement files of the respective subjects.
-- ============================================================

-- [Lamartine Pereira] student_of [Artur Emídio]
-- Primary teacher-student relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
  E'Lamartine Pereira trained with Mestre Artur Emídio, learning the systematized Bahian method. Based on his apprenticeship with Artur Emídio and in close collaboration with the master, Lamartine documented capoeira movements in his books. In 1961, he taught the Navy capoeira course "with the assistance of his master Artur Emídio and Djalma Bandeira." This training relationship likely began around 1959 when Lamartine graduated from EsEFEx.',
  E'Lamartine Pereira treinou com Mestre Artur Emídio, aprendendo o método sistematizado baiano. Baseado em seu aprendizado com Artur Emídio e em estreita colaboração com o mestre, Lamartine documentou os movimentos de capoeira em seus livros. Em 1961, ele ensinou o curso de capoeira da Marinha "com a assistência de seu mestre Artur Emídio e Djalma Bandeira." Essa relação de treinamento provavelmente começou por volta de 1959, quando Lamartine se formou na EsEFEx.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Lamartine Pereira] trained_under [Djalma Bandeira]
-- Secondary training relationship - trained alongside Djalma who was Artur's first student
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
  E'Lamartine "started practicing capoeira with Mestre Artur Emídio and his disciple Djalma Bandeira." Djalma was Artur Emídio''s first student and served as an assistant in teaching the 1961 Navy course alongside Lamartine.',
  E'Lamartine "começou a praticar capoeira com Mestre Artur Emídio e seu discípulo Djalma Bandeira." Djalma era o primeiro aluno de Artur Emídio e serviu como assistente no ensino do curso da Marinha de 1961 junto com Lamartine.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Djalma Bandeira' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Lamartine Pereira] associated_with [Artur Emídio]
-- Collaboration on Navy course and book documentation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-03-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Collaborated on Navy capoeira course (1961) and book documentation; Artur served as technical model for illustrations", "pt": "Colaboraram no curso de capoeira da Marinha (1961) e documentação do livro; Artur serviu como modelo técnico para ilustrações"}}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/professor-lamartine-eng-1935/',
  E'Lamartine administered the Navy capoeira course (March 1961) "with the assistance of his master Artur Emídio and Djalma Bandeira," teaching 208 officers and enlisted men. His book "Capoeiragem" was "based on his apprenticeship with Artur Emídio and in close collaboration with the master" and used illustrations of techniques similar to Artur''s, who was "known for exceptional movement execution."',
  E'Lamartine administrou o curso de capoeira da Marinha (março de 1961) "com a assistência de seu mestre Artur Emídio e Djalma Bandeira", ensinando 208 oficiais e praças. Seu livro "Capoeiragem" foi "baseado em seu aprendizado com Artur Emídio e em estreita colaboração com o mestre" e usou ilustrações de técnicas semelhantes às de Artur, que era "conhecido pela execução excepcional de movimentos."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Artur Emídio' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- [Lamartine Pereira] associated_with [Djalma Bandeira]
-- Navy course collaboration
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-03-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Co-instructors of Navy capoeira methodology course (1961)", "pt": "Co-instrutores do curso de metodologia de capoeira da Marinha (1961)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'In 1961, Djalma Bandeira and Artur Emídio participated in the official introduction of capoeira into the Brazilian Navy. Working with Lieutenant Lamartine Pereira da Costa, the duo assisted in teaching a course on the "methodology of teaching capoeira" to 208 officers and enlisted men at the Navy Sports Centre.',
  E'Em 1961, Djalma Bandeira e Artur Emídio participaram da introdução oficial da capoeira na Marinha do Brasil. Trabalhando com o Tenente Lamartine Pereira da Costa, a dupla auxiliou no ensino de um curso sobre a "metodologia de ensino de capoeira" para 208 oficiais e praças no Centro de Esportes da Marinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lamartine Pereira' AND s.apelido_context IS NULL
  AND o.apelido = 'Djalma Bandeira' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NO PENDING RELATIONSHIPS
-- ============================================================
-- All teachers (Artur Emídio, Djalma Bandeira) exist in database.
-- No students documented - Lamartine was primarily an author/researcher.
-- No group founded - his contribution was through publications and the
-- Navy course, not through establishing a capoeira group.
-- ============================================================

-- Source: statements/persons/licuri.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Licurí
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Licurí is the SUBJECT.
-- ============================================================

-- No statements to generate at this time.
-- Licurí predates documented lineage records:
-- - His teachers are unknown
-- - His students include Cobrinha Verde (but that statement belongs in cobrinha-verde.sql as CV is the subject)
-- - His group affiliations are unknown (informal street capoeira era)

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- No pending relationships identified.
-- The trained_under relationship between Cobrinha Verde and Licurí
-- should be added to cobrinha-verde.sql if not already present.

-- Source: statements/persons/limao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Limão
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Limão is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Limão student_of Caiçara (primary teacher, Capoeira Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, esquiva.wordpress.com',
  'Primary teacher in Capoeira Angola; learned in Santo Amaro da Purificação, Bahia as child, continued in Salvador',
  'Mestre principal em Capoeira Angola; aprendeu em Santo Amaro da Purificação, Bahia quando criança, continuou em Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão baptized_by Canjiquinha (received apelido "Limão" from Canjiquinha)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"apelido_given": "Limão"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br',
  'Received apelido "Limão" from Mestre Canjiquinha because he sold lemons (limões) at the market',
  'Recebeu apelido "Limão" de Mestre Canjiquinha porque vendia limões na feira'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Canjiquinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão received_title_from Caiçara (contra-mestre, 1969)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre", "location": "São Paulo"}}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, esquiva.wordpress.com',
  'Received contra-mestre title from Caiçara after LP recording and excellent Capoeira Angola presentations in São Paulo (1969); alongside Mestre Silvestre',
  'Recebeu título de contra-mestre de Caiçara após gravação do LP e excelentes apresentações de Capoeira Angola em São Paulo (1969); junto com Mestre Silvestre'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PEER ASSOCIATIONS ("Grupo dos Nove")
-- ============================================================

-- Limão associated_with Silvestre (both received contra-mestre from Caiçara 1969; Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both received contra-mestre from Caiçara in 1969; both members of Grupo dos Nove"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, onca-sp.md',
  'Fellow contra-mestre under Caiçara (1969); both recognized by Bimba as Grupo dos Nove pioneers (1971)',
  'Colega contra-mestre sob Caiçara (1969); ambos reconhecidos por Bimba como pioneiros do Grupo dos Nove (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão associated_with Onça (SP) (Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'onca-sp.md, cdosergipe.wixsite.com',
  'Both recognized by Mestre Bimba as "Percursores da Capoeira em São Paulo" in 1971',
  'Ambos reconhecidos por Mestre Bimba como "Percursores da Capoeira em São Paulo" em 1971'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão associated_with Suassuna (Grupo dos Nove; frequented rodas together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo dos Nove; frequented rodas together at Praça da República"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, onca-sp.md',
  'Frequented Praça da República rodas together from 1969; both Grupo dos Nove pioneers (1971)',
  'Frequentaram rodas na Praça da República juntos desde 1969; ambos pioneiros do Grupo dos Nove (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Suassuna' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão associated_with Brasília (Grupo dos Nove; frequented rodas together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo dos Nove; frequented rodas together at Praça da República"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, onca-sp.md',
  'Frequented Praça da República rodas together from 1969; both Grupo dos Nove pioneers (1971)',
  'Frequentaram rodas na Praça da República juntos desde 1969; ambos pioneiros do Grupo dos Nove (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Brasília' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Limão co_founded Academia de Capoeira São Bento Pequeno - GROUP NOT IN DATASET
--   Co-founded Aug 1, 1969 with Mestres Pinatti and Paulão
--   Add to groups-backlog (already there)

-- Limão founded Academia Quilombo dos Palmares (SP) - GROUP NOT IN DATASET
--   Founded Jun 1, 1970 on Av. Morumbi, São Paulo
--   Add to groups-backlog (already there as "Quilombo dos Palmares (SP)")

-- Limão founded Grupo Praia do Sol - GROUP NOT IN DATASET
--   Founded 1970s-80s; lineage through Mestre Marcio → Mestre Paraná → Caravelas Negras
--   Add to groups-backlog

-- Limão associated_with Pinatti (Grupo dos Nove; co-founded São Bento Pequeno) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Joel (SP) (Grupo dos Nove; frequented rodas together) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Gilvan (Grupo dos Nove) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Zé de Freitas (Grupo dos Nove) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Paulão (co-founded São Bento Pequeno) - PERSON NOT IN DATASET
--   Need to distinguish from Paulão (Muzenza)
--   Add to persons-backlog

-- Limão associated_with Natanael (taught together in Santo Amaro district, São Paulo) - PERSON NOT IN DATASET
--   Add to persons-backlog

-- ============================================================
-- STUDENT RELATIONSHIPS (STUDENTS NOT IN DATASET)
-- ============================================================
-- Note: These would be statements FROM the students TO Limão, so they go in
-- the students' statements files, not this file. Listed here for reference.

-- Limãozinho student_of Limão - PERSON NOT IN DATASET
--   José Carlos dos Santos, nephew, born Sept 15, 1957
--   Started 1965 (at age 8), received contra-mestre 1972
--   Add to persons-backlog

-- Silvio Acarajé student_of Limão - PERSON NOT IN DATASET
--   One of few taught Angola (not Regional)
--   Add to persons-backlog

-- Mestre Marcio student_of Limão (Praia do Sol lineage) - PERSON NOT IN DATASET
--   Add to persons-backlog

-- Source: statements/persons/lua-de-bobo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Lua de Bobó
-- Generated: 2025-01-02
-- ============================================================
-- Contains all relationships where Lua de Bobó is the SUBJECT.
-- ============================================================

-- Lua de Bobó student_of Bobô
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'approximate'::genealogy.date_precision,
  '1994-07-08'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'http://meninodearembepe.org/site/mestre.php',
  'Primary teacher for 20+ years. Met Bobô around age 15 (circa 1965). Trained at Academia de Capoeira Angola Cinco Estrelas, Dique Pequeno do Tororó, Salvador. Relationship ended with Bobô''s death.',
  'Professor principal por mais de 20 anos. Conheceu Bobô por volta dos 15 anos (circa 1965). Treinou na Academia de Capoeira Angola Cinco Estrelas, Dique Pequeno do Tororó, Salvador. Relação terminou com a morte de Bobô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua de Bobó' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua de Bobó received_title_from Bobô
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "Formatura", "location": "Clube Regatas Vasco da Gama, Dique do Tororó, Salvador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6',
  'Graduated as one of Bobô''s first two mestres alongside Môa do Katendê. Evaluation panel: João Grande, João Pequeno, Vermelho (27), Dona Romélia.',
  'Formado como um dos dois primeiros mestres de Bobô junto com Môa do Katendê. Banca avaliadora: João Grande, João Pequeno, Vermelho (27), Dona Romélia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua de Bobó' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua de Bobó associated_with Môa do Katendê
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
  '2018-10-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow_students_same_teacher"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6',
  'Both trained under Mestre Bobô at Academia de Capoeira Angola Cinco Estrelas. Graduated together as Bobô''s first mestres on April 5, 1987.',
  'Ambos treinaram com Mestre Bobô na Academia de Capoeira Angola Cinco Estrelas. Formados juntos como os primeiros mestres de Bobô em 5 de abril de 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua de Bobó' AND o.apelido = 'Môa do Katendê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Lua de Bobó founded GCAMA (Grupo de Capoeira Angola Menino de Arembepe) - group import pending
-- Lua de Bobó member_of Academia de Capoeira Angola Cinco Estrelas - group import pending
-- Lua de Bobó associated_with Dona Romélia - person import pending (evaluation panel)
-- Lua de Bobó associated_with Mestre Zequinha - person import pending (student)
-- Lua de Bobó associated_with Mestre Malhado (son) - person import pending (student/son)
-- Lua de Bobó associated_with Carlinhos Ferraz - person import pending (guides his group)
-- Lua de Bobó associated_with Eliseu Valverde - person import pending (student, no longer active)

-- Source: statements/persons/lua-rasta.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Lua Rasta
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Lua Rasta is the SUBJECT.
-- ============================================================

-- Lua Rasta trained_under Bimba (1 year training, 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'last.fm, artesanatodabahia.com.br',
  E'Trained with Bimba for one year (1968) before transferring to Canjiquinha.',
  E'Treinou com Bimba por um ano (1968) antes de se transferir para Canjiquinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua Rasta' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua Rasta student_of Canjiquinha (primary mentor, 1969-onwards)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'last.fm, lalaue.com, artesanatodabahia.com.br',
  E'Primary mentor. Joined Canjiquinha''s academy and folkloric group Aberrê in 1969. Developed capoeira as theatrical language under his guidance.',
  E'Mentor principal. Ingressou na academia de Canjiquinha e no grupo folclórico Aberrê em 1969. Desenvolveu a capoeira como linguagem teatral sob sua orientação.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua Rasta' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua Rasta associated_with Bigodinho (close friend, encouraged return 1997)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Close friend; encouraged Bigodinho''s return to capoeira in 1997; organized Tributo a Mestre Bigodinho (2007/2008)"}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, lalaue.com, velhosmestres.com',
  E'Close friend who encouraged Bigodinho''s return to capoeira in 1997 after nearly three decades absence. Co-organized the "Tributo a Mestre Bigodinho" celebration in Acupe (August 2008) with Mestre Ivan de Santo Amaro.',
  E'Amigo próximo que incentivou o retorno de Bigodinho à capoeira em 1997 após quase três décadas de ausência. Co-organizou a celebração "Tributo a Mestre Bigodinho" em Acupe (agosto de 2008) com Mestre Ivan de Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua Rasta' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Lua Rasta member_of Viva Bahia (1970) - Grupo Viva Bahia in groups backlog
-- Lua Rasta member_of Conjunto Folclórico Aberrê (1969) - Group in backlog
-- Lua Rasta founded Ateliê Percussivo - Workshop/organization not in dataset
-- Lua Rasta founded Bando Anunciador - Group not in dataset
-- Lua Rasta associated_with Mestre Olavo (fellow Mestre Artesão 2021) - Not in dataset
-- Lua Rasta associated_with Mestre Ivan de Santo Amaro (co-organizer Tributo 2007) - Not in dataset
-- Lua Rasta associated_with Nelson Maleiro (taught encourar technique) - Not capoeirista; do not import

-- Source: statements/persons/maita.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Maitá
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Maitá is the SUBJECT.
--
-- Note: The relationship "Cobrinha Verde trained_under Maitá" is recorded
-- in cobrinha-verde.sql (Cobrinha Verde is the subject in that statement).
--
-- No statements currently exist where Maitá is the subject.
-- His contemporaries (Licurí, Joité, Dendê, etc.) are documented in
-- notes_en/notes_pt but not as formal relationships since there is no
-- specific documented interaction beyond being listed together as
-- Cobrinha Verde's teachers.
-- ============================================================

-- Source: statements/persons/major-doria.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Major Dória
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Major Dória is the SUBJECT.
-- Note: Major Dória was NOT a capoeirista - he was a patron/founder.
-- His relationships are to the academy he founded (as `founded`)
-- and to the instructors he recruited (as `associated_with`).
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Major Dória founded Academia Cultura Física e Capoeira Major Dória (1958)
--   - GROUP NOT YET IMPORTED - add to groups-backlog.md
--
-- Major Dória associated_with Maneca Brandão - PERSON EXISTS
--   Context: Recruited Maneca Brandão to be primary capoeira instructor at his academy (1958)
--
-- Major Dória associated_with Zoião - PERSON EXISTS
--   Context: Zoião assisted with training at the academy alongside Maneca Brandão
--
-- Major Dória associated_with Amélia Prado - PERSON NOT IMPORTED
--   Context: She provided the building for the academy
--   Note: Not a capoeirista - do not import to persons backlog

-- ============================================================
-- ACTUAL RELATIONSHIPS (objects exist in dataset)
-- ============================================================

-- Major Dória associated_with Maneca Brandão (recruited as instructor)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "patron-instructor: Major Dória recruited Maneca Brandão to teach capoeira at Academia Major Dória in Itabuna"}'::jsonb,
  'verified'::genealogy.confidence,
  'portalcapoeira.com, velhosmestres.com, 4capoeirathoughts.wordpress.com',
  E'Major Dória recruited Mestre Maneca Brandão (a formado of Bimba) to be the primary capoeira instructor at his newly established Academia Cultura Física e Capoeira Major Dória in Itabuna in 1958. Maneca Brandão was the son of Ubaldino Brandão, a former mayor of Itabuna, which may have facilitated the connection.',
  E'Major Dória recrutou Mestre Maneca Brandão (um formado de Bimba) para ser o instrutor principal de capoeira na recém-fundada Academia Cultura Física e Capoeira Major Dória em Itabuna em 1958. Maneca Brandão era filho de Ubaldino Brandão, um ex-prefeito de Itabuna, o que pode ter facilitado a conexão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Major Dória' AND o.apelido = 'Maneca Brandão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Major Dória associated_with Zoião (assistant instructor)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "patron-instructor: Zoião sometimes assisted Maneca Brandão with training at Major Dória''s academy"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-17, cdosergipe.wixsite.com',
  E'Mestre Zoião, classmate of Maneca Brandão from Mestre Bimba''s academy, sometimes helped with training sessions at Major Dória''s academy in Itabuna. This brought a second formado of Bimba to assist in establishing Capoeira Regional in southern Bahia.',
  E'Mestre Zoião, colega de turma de Maneca Brandão na academia de Mestre Bimba, às vezes ajudava nos treinamentos na academia do Major Dória em Itabuna. Isso trouxe um segundo formado de Bimba para auxiliar no estabelecimento da Capoeira Regional no sul da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Major Dória' AND o.apelido = 'Zoião'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING GROUP RELATIONSHIP
-- ============================================================
-- When Academia Cultura Física e Capoeira Major Dória is imported as a group:
--
-- Major Dória founded Academia Cultura Física e Capoeira Major Dória
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   '1958-01-01'::date, 'year'::genealogy.date_precision,
--   NULL, NULL,
--   '{}'::jsonb,
--   'verified'::genealogy.confidence,
--   'portalcapoeira.com, 4capoeirathoughts.wordpress.com',
--   E'Major Dória founded the Academia Cultura Física e Capoeira Major Dória in 1958, the first formal capoeira academy in Itabuna.',
--   E'Major Dória fundou a Academia Cultura Física e Capoeira Major Dória em 1958, a primeira academia formal de capoeira em Itabuna.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Major Dória' AND o.name = 'Academia Cultura Física e Capoeira Major Dória'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/messias.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Messias
-- Generated: 2025-01-02
-- ============================================================
-- Contains all relationships where Messias is the SUBJECT.
-- ============================================================

-- Messias student_of Léo (São Braz)
-- Primary teacher from 1942; formed Messias as mestre in 1947
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-45',
  'Messias began training under Mestre Léo at age 15 in 1942 as part of the weekend training group in São Braz. Léo formed him as mestre in 1947 at age 20.',
  'Messias começou a treinar com Mestre Léo aos 15 anos em 1942 como parte do grupo de treino de fim de semana em São Braz. Léo o formou mestre em 1947 aos 20 anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Messias' AND s.apelido_context IS NULL
  AND o.apelido = 'Léo' AND o.apelido_context = 'São Braz'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Messias received_title_from Léo (São Braz)
-- Received mestre title in 1947 at age 20
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-45',
  'Formado a mestre at age 20 by Mestre Léo in 1947. One of the youngest mestres of his era.',
  'Formado a mestre aos 20 anos por Mestre Léo em 1947. Um dos mestres mais jovens de sua época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Messias' AND s.apelido_context IS NULL
  AND o.apelido = 'Léo' AND o.apelido_context = 'São Braz'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Messias associated_with Gato Preto
-- Training companions in Léo's São Braz group from 1942
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/gatopreto',
  'Messias and Gato Preto were training companions in Mestre Léo''s São Braz weekend training group from 1942. Messias was 15, Gato Preto was 12.',
  'Messias e Gato Preto foram companheiros de treino no grupo de fim de semana de Mestre Léo em São Braz a partir de 1942. Messias tinha 15 anos, Gato Preto tinha 12.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Messias' AND s.apelido_context IS NULL
  AND o.apelido = 'Gato Preto' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Messias associated_with Felipe de Santo Amaro - confirmed Sidney graduation together (Dec 21, 2013); needs import
-- Messias associated_with Mestre Gary (Santo Amaro) - confirmed Sidney graduation together (Dec 21, 2013); needs import
-- Messias associated_with Mestre Dimas - confirmed Sidney graduation together (Dec 21, 2013); needs import
-- Messias associated_with Mestre Sidney - confirmed his mestre graduation (Dec 21, 2013); needs import

-- Source: statements/persons/moa-do-katende.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Môa do Katendê
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Môa do Katendê is the SUBJECT.
-- ============================================================

-- Môa do Katendê student_of Bobô (primary teacher, 1962-1987)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Began training at age 8 (1962) at Academia de Capoeira Angola Cinco Estrelas. Graduated as Mestre Bobô''s first mestre on April 5, 1987, alongside Lua de Bobó.',
  E'Começou a treinar aos 8 anos (1962) na Academia de Capoeira Angola Cinco Estrelas. Formado como primeiro mestre de Mestre Bobô em 5 de abril de 1987, ao lado de Lua de Bobó.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê received_title_from Bobô (mestre title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "Graduation ceremony at Academia de Capoeira Angola Cinco Estrelas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Received mestre title from Mestre Bobô on April 5, 1987. Evaluation panel included Mestres João Grande, João Pequeno, Vermelho, and Dona Romélia (Mestre Pastinha''s wife).',
  E'Recebeu título de mestre de Mestre Bobô em 5 de abril de 1987. Banca avaliadora incluiu Mestres João Grande, João Pequeno, Vermelho e Dona Romélia (esposa de Mestre Pastinha).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Lua de Bobó (fellow first-generation mestres)
-- NOTE: Lua de Bobó is not yet in the dataset - will be added to backlog
-- INSERT statement prepared for when Lua de Bobó is imported:
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'associated_with'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   '1962-01-01'::date, 'year'::genealogy.date_precision,
--   '{"association_context": {"en": "Fellow students of Mestre Bobô; both graduated as first mestres together on April 5, 1987", "pt": "Colegas alunos de Mestre Bobô; ambos formados como primeiros mestres juntos em 5 de abril de 1987"}}'::jsonb,
--   'verified'::genealogy.confidence,
--   'https://velhosmestres.com/en/featured-43',
--   E'Training companions at Academia de Capoeira Angola Cinco Estrelas under Mestre Bobô. Both graduated as Bobô''s first two mestres on April 5, 1987.',
--   E'Companheiros de treino na Academia de Capoeira Angola Cinco Estrelas sob Mestre Bobô. Ambos formados como os dois primeiros mestres de Bobô em 5 de abril de 1987.'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Lua de Bobó';

-- Môa do Katendê associated_with João Grande (evaluation panel member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "João Grande was on the evaluation panel that graduated Môa as mestre on April 5, 1987", "pt": "João Grande estava na banca avaliadora que formou Môa como mestre em 5 de abril de 1987"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://dicionariompb.com.br/artista/moa-do-katende/',
  E'João Grande was part of the evaluation panel (alongside João Pequeno, Vermelho, and Dona Romélia) that graduated Môa do Katendê as mestre on April 5, 1987.',
  E'João Grande fez parte da banca avaliadora (junto com João Pequeno, Vermelho e Dona Romélia) que formou Môa do Katendê como mestre em 5 de abril de 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with João Pequeno (evaluation panel member)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "João Pequeno was on the evaluation panel that graduated Môa as mestre on April 5, 1987", "pt": "João Pequeno estava na banca avaliadora que formou Môa como mestre em 5 de abril de 1987"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://dicionariompb.com.br/artista/moa-do-katende/',
  E'João Pequeno was part of the evaluation panel (alongside João Grande, Vermelho, and Dona Romélia) that graduated Môa do Katendê as mestre on April 5, 1987.',
  E'João Pequeno fez parte da banca avaliadora (junto com João Grande, Vermelho e Dona Romélia) que formou Môa do Katendê como mestre em 5 de abril de 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Pelé da Bomba (ABCA contemporaries, photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "ABCA contemporaries; photographed together at rodas and ABCA events", "pt": "Contemporâneos na ABCA; fotografados juntos em rodas e eventos da ABCA"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both served in ABCA leadership (Môa as Cultural Director 1998-2002, President 2003; Pelé da Bomba as President). Photographed together at various events.',
  E'Ambos serviram na liderança da ABCA (Môa como Diretor Cultural 1998-2002, Presidente 2003; Pelé da Bomba como Presidente). Fotografados juntos em vários eventos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Pelé da Bomba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Boa Gente (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "Contemporary angoleiros photographed together at rodas", "pt": "Angoleiros contemporâneos fotografados juntos em rodas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both were active angoleiros in Salvador''s ABCA community. Photographed together at rodas documented on velhosmestres.com.',
  E'Ambos eram angoleiros ativos na comunidade da ABCA em Salvador. Fotografados juntos em rodas documentadas em velhosmestres.com.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Gildo Alfinete (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "Contemporary angoleiros photographed together at rodas", "pt": "Angoleiros contemporâneos fotografados juntos em rodas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both were active angoleiros in Salvador. Photographed together at rodas documented on velhosmestres.com.',
  E'Ambos eram angoleiros ativos em Salvador. Fotografados juntos em rodas documentadas em velhosmestres.com.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Môa do Katendê associated_with Bigodinho (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"association_context": {"en": "Contemporary angoleiros photographed together at rodas", "pt": "Angoleiros contemporâneos fotografados juntos em rodas"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-43',
  E'Both were active angoleiros in Salvador. Photographed together at rodas documented on velhosmestres.com.',
  E'Ambos eram angoleiros ativos em Salvador. Fotografados juntos em rodas documentadas em velhosmestres.com.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Môa do Katendê' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PERSON-TO-GROUP RELATIONSHIPS
-- ============================================================

-- NOTE: Academia de Capoeira Angola Cinco Estrelas is not yet imported as a group.
-- When imported, add:
-- Môa do Katendê member_of Academia de Capoeira Angola Cinco Estrelas (1962-present)
-- Môa do Katendê teaches_at Academia de Capoeira Angola Cinco Estrelas (1987-2018)

-- NOTE: ABCA is not yet imported as a group.
-- When imported, add:
-- Môa do Katendê leads ABCA (2003) with properties for president role
-- Môa do Katendê associated_with ABCA (1997-2003) with cultural director role

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Môa do Katendê associated_with Lua de Bobó - needs import first (fellow first-generation mestre)
-- Môa do Katendê associated_with Vermelho 27 - evaluation panel; already exists but need to verify apelido matches
-- Môa do Katendê associated_with Romélia - Pastinha's wife on evaluation panel; needs import first
-- Môa do Katendê associated_with Mala - photographed together; needs import first
-- Môa do Katendê member_of Academia de Capoeira Angola Cinco Estrelas - group needs import first
-- Môa do Katendê teaches_at Academia de Capoeira Angola Cinco Estrelas - group needs import first
-- Môa do Katendê founded Afoxé Badauê (1978) - group needs import first
-- Môa do Katendê founded Afoxé Amigos do Katendê (1994/1995) - group needs import first
-- Môa do Katendê co_founded Agremiação Gunga (1999/2003) - group needs import first
-- Môa do Katendê leads ABCA (2003) - group needs import first

-- Source: statements/persons/olavo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Olavo
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Olavo is the SUBJECT.
-- ============================================================

-- Olavo student_of Waldemar (primary teacher for berimbau and Angola in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"training_type": "capoeira_angola_and_berimbau_making"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-65; artesanatodabahia.com.br/artesaos/mestre-olavo-da-bahia/',
  'Olavo moved to Salvador in 1960 at age 18 and began studying capoeira and berimbau-making with Mestre Waldemar. Learned steel wire (arame) and gourd painting (cabaças) techniques from Waldemar. Directed rodas at Agnelo''s bar (1969-1970) under Waldemar''s oversight.',
  'Olavo mudou-se para Salvador em 1960 aos 18 anos e começou a estudar capoeira e fabricação de berimbau com Mestre Waldemar. Aprendeu técnicas de arame de aço e pintura de cabaças com Waldemar. Dirigiu rodas no bar do Agnelo (1969-1970) sob supervisão de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo trained_under Acordeon (Regional training from 1967)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"training_type": "capoeira_regional"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-65',
  'In 1967, Olavo met Mestre Acordeon and started learning Regional capoeira with him, expanding his knowledge beyond the Angola tradition.',
  'Em 1967, Olavo conheceu Mestre Acordeon e começou a aprender Capoeira Regional com ele, expandindo seu conhecimento além da tradição Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with João Grande (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989. Olavo (berimbau) and João Grande (berimbau) appeared in historic photo with Mestres João Pequeno, Gigante, Waldemar, Paulo dos Anjos, and Itapoan."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989, at Itapoan''s house celebrating the birthdays of Mestres Itapoan and Paulo dos Anjos. Both Olavo and João Grande played berimbau.',
  'Fotografia histórica em 20 de agosto de 1989, na casa de Itapoan celebrando os aniversários dos Mestres Itapoan e Paulo dos Anjos. Tanto Olavo quanto João Grande tocaram berimbau.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with João Pequeno (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989. Olavo (berimbau) and João Pequeno (pandeiro) appeared in historic photo."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989. Olavo played berimbau while João Pequeno played pandeiro.',
  'Fotografia histórica em 20 de agosto de 1989. Olavo tocou berimbau enquanto João Pequeno tocou pandeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Gigante (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989. Both Olavo and Gigante played berimbau in historic photo."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989. Both Olavo and Gigante played berimbau.',
  'Fotografia histórica em 20 de agosto de 1989. Tanto Olavo quanto Gigante tocaram berimbau.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Gigante'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Paulo dos Anjos (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989, celebrating Paulo dos Anjos'' birthday."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989, at the birthday celebration for Mestres Itapoan and Paulo dos Anjos.',
  'Fotografia histórica em 20 de agosto de 1989, na celebração de aniversário dos Mestres Itapoan e Paulo dos Anjos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Paulo dos Anjos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Itapoan (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989, celebrating Itapoan''s birthday. Olavo played berimbau while Itapoan was playing capoeira."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989, at Itapoan''s house during his birthday celebration.',
  'Fotografia histórica em 20 de agosto de 1989, na casa de Itapoan durante a celebração de seu aniversário.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Lua Rasta (co-recipients of Mestre Artesão title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2021-05-28'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both Olavo and Lua Rasta became the first Mestres Artesãos (Master Artisans) of capoeira recognized in Brazil on May 28, 2021, at the Centro de Comercialização Artesanato da Bahia in Salvador."}'::jsonb,
  'verified'::genealogy.confidence,
  'jornaldosudoeste.com/governo-da-bahia-condecora-capoeiristas-como-mestres-artesaos/',
  'Both became the first capoeira Mestres Artesãos in Brazil on May 28, 2021, through initiative of SETRE.',
  'Ambos tornaram-se os primeiros Mestres Artesãos de capoeira no Brasil em 28 de maio de 2021, através de iniciativa da SETRE.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Lua Rasta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo student_of Alfredo (Muritiba) - initial capoeira training in Muritiba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"training_type": "capoeira_angola", "location": "Muritiba, Recôncavo Baiano"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-65; artesanatodabahia.com.br/artesaos/mestre-olavo-da-bahia/',
  E'Olavo grew up in Muritiba where he learned capoeira from Mestre Alfredo da Capoeira Angola. This was his foundational training before moving to Salvador in 1960 at age 18.',
  E'Olavo cresceu em Muritiba onde aprendeu capoeira com Mestre Alfredo da Capoeira Angola. Esta foi sua formação inicial antes de se mudar para Salvador em 1960 aos 18 anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Alfredo' AND o.apelido_context = 'Muritiba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Olavo leads Grupo BerimBahia - group needs import

-- Source: statements/persons/paulo-dos-anjos.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Paulo dos Anjos
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Paulo dos Anjos is the SUBJECT.
-- Teachers and groups he founded/joined.
-- ============================================================

-- Paulo dos Anjos student_of Canjiquinha
-- Primary teacher relationship (1950-1957); graduated under Canjiquinha
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-10',
  'Primary teacher; began 1950, graduated 1957; consecrated as mestre by Canjiquinha',
  'Mestre principal; começou 1950, graduou 1957; consagrado como mestre por Canjiquinha'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo dos Anjos' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo dos Anjos trained_under Gato Preto
-- Worked alongside Gato Preto; taught at his academy from 1963
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-paulo-dos-anjos/',
  'Worked alongside Gato Preto; taught at his academy from 1963; continued collaboration on Itaparica Island',
  'Trabalhou ao lado de Gato Preto; ensinou em sua academia a partir de 1963; continuou colaboração na Ilha de Itaparica'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo dos Anjos' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo dos Anjos received_title_from Canjiquinha
-- Mestre title conferred at graduation 1957
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-10',
  'Consecrated as mestre by Canjiquinha upon graduation in 1957',
  'Consagrado como mestre por Canjiquinha ao se graduar em 1957'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo dos Anjos' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships require the objects to be imported first.
-- They should be added once the respective person/group profiles exist.
-- ============================================================
--
-- GROUPS (pending group imports):
-- Paulo dos Anjos founded "Associação de Capoeira Anjos de Angola" (Aug 15, 1975, São José dos Campos)
-- Paulo dos Anjos founded "Associação Cultural de Capoeira Grupo Anjos de Angola Academia" (1980s, Salvador)
-- Paulo dos Anjos member_of ABCA (from 1987, as vice-president)
-- Paulo dos Anjos teaches_at "Academia de Gato Preto" (from 1963)
--
-- STUDENTS (pending person imports):
-- All below should generate statements FROM the student TO Paulo dos Anjos (student student_of Paulo dos Anjos)
-- - Virgílio do Retiro
-- - Jaime de Mar Grande (first student on Itaparica, ~1965)
-- - Jorge Satélite
-- - Pássaro Preto
-- - Renê (Renê Bittencourt)
-- - Amâncio
-- - Neguinho
-- - Alfredo
-- - Djalma
-- - Galego
-- - Mala (already in backlog - Gato Preto import)
-- - Josias
-- - Cabeção
-- - Jequié
-- - Feijão
-- - Vital
-- - Al Capone
--
-- CONTEMPORARIES (pending person imports):
-- Paulo dos Anjos associated_with João Pequeno (ABCA co-leadership 1987)
-- Paulo dos Anjos associated_with Mário Bom Cabrito (ABCA co-leadership 1987)
-- Paulo dos Anjos associated_with Nô (ABCA co-leadership 1987)
-- Paulo dos Anjos associated_with Renê (ABCA co-leadership 1987, also student)
--
-- ============================================================

-- Source: statements/persons/pele-da-bomba.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Pelé da Bomba
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Pelé da Bomba is the SUBJECT.
-- ============================================================

-- Pelé da Bomba student_of Bugalho
-- Primary teacher-student relationship from 1946 at Mercado Modelo ramp
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1946-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-20, portalcapoeira.com, esquiva.wordpress.com',
  E'Pelé da Bomba began learning capoeira at age 12 (1946) with Mestre Bugalho at the ramp of the old Mercado Modelo in Salvador. Bugalho, a dock worker, taught him to gingar during rest hours and on moonlit nights at Praia da Preguiça. Pelé said: "Segui a tradição do meu mestre, Bugalho, um grande tocador de berimbau. Ele era um dos melhores." (I followed my master''s tradition, Bugalho, a great berimbau player. He was one of the best.)',
  E'Pelé da Bomba começou a aprender capoeira aos 12 anos (1946) com Mestre Bugalho na rampa do antigo Mercado Modelo em Salvador. Bugalho, um carregador de embarcações, ensinava-o a gingar durante as horas de descanso e nas noites de lua na Praia da Preguiça. Pelé disse: "Segui a tradição do meu mestre, Bugalho, um grande tocador de berimbau. Ele era um dos melhores."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Bugalho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba trained_under Waldemar
-- Frequented Waldemar's barracão for rodas; not primary student but regular attendee
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com, esquiva.wordpress.com',
  E'Pelé da Bomba frequented Mestre Waldemar''s legendary barracão in Pero Vaz (Corta Braço), Liberdade neighborhood. When Pelé arrived, Waldemar would greet him: "Lá vem Satanás!" (Here comes Satan!). He participated in the rodas but Bugalho was his primary teacher.',
  E'Pelé da Bomba frequentava o lendário barracão de Mestre Waldemar em Pero Vaz (Corta Braço), bairro da Liberdade. Quando Pelé chegava, Waldemar o cumprimentava: "Lá vem Satanás!". Participava das rodas, mas Bugalho era seu mestre principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Zacarias Boa Morte
-- Attended his Sunday afternoon rodas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "roda participant"}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com',
  E'Pelé da Bomba attended Sunday afternoon rodas directed by Zacarias Boa Morte in Salvador. He later sang at Zacarias''s funeral and seventh-day mass.',
  E'Pelé da Bomba frequentava as rodas das tardes de domingo dirigidas por Zacarias Boa Morte em Salvador. Posteriormente cantou no funeral e missa de sétimo dia de Zacarias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Zacarias Boa Morte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Canjiquinha
-- Performed together in tourist shows at Praça da Sé
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "performance group colleague"}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, esquiva.wordpress.com',
  E'Pelé da Bomba performed with Mestre Canjiquinha''s group at the Belvedere da Praça da Sé, doing tourist shows featuring capoeira, maculelê, puxada de rede (net pulling), and samba de roda.',
  E'Pelé da Bomba se apresentava com o grupo de Mestre Canjiquinha no Belvedere da Praça da Sé, fazendo shows para turistas com capoeira, maculelê, puxada de rede e samba de roda.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Caiçara
-- Contemporary; sang at Caiçara's funeral
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporary, sang at funeral"}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com',
  E'Pelé da Bomba was a contemporary of Mestre Caiçara. When Caiçara died, Pelé emotionally sang at his funeral and seventh-day mass.',
  E'Pelé da Bomba era contemporâneo de Mestre Caiçara. Quando Caiçara morreu, Pelé cantou emocionado em seu funeral e missa de sétimo dia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Bom Cabrito
-- Contemporary; sang at Bom Cabrito's funeral
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporary, sang at funeral"}'::jsonb, 'likely'::genealogy.confidence,
  'portalcapoeira.com',
  E'Pelé da Bomba was a contemporary of Mestre Bom Cabrito. When Bom Cabrito died, Pelé emotionally sang at his funeral.',
  E'Pelé da Bomba era contemporâneo de Mestre Bom Cabrito. Quando Bom Cabrito morreu, Pelé cantou emocionado em seu funeral.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Bom Cabrito'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with João Pequeno
-- Both served on ABCA Council of Masters; photographed together
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "ABCA colleagues"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, mapadacapoeira.com.br',
  E'Pelé da Bomba and João Pequeno both served on the ABCA (Associação Brasileira de Capoeira Angola) Council of Masters. They were photographed together at ABCA events. Both operated academies at the Forte de Santo Antônio Além do Carmo.',
  E'Pelé da Bomba e João Pequeno ambos serviram no Conselho de Mestres da ABCA (Associação Brasileira de Capoeira Angola). Foram fotografados juntos em eventos da ABCA. Ambos operavam academias no Forte de Santo Antônio Além do Carmo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Gato Preto
-- Photographed together at ABCA; contemporaries
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Gato Preto were contemporaries in Salvador''s capoeira community. They were photographed together at ABCA events.',
  E'Pelé da Bomba e Gato Preto eram contemporâneos na comunidade de capoeira de Salvador. Foram fotografados juntos em eventos da ABCA.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Barba Branca
-- Photographed together; both ABCA members
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Barba Branca were photographed together at ABCA events in Salvador.',
  E'Pelé da Bomba e Barba Branca foram fotografados juntos em eventos da ABCA em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Barba Branca'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Boa Gente
-- Photographed together; both ABCA members
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Boa Gente were photographed together at ABCA events in Salvador.',
  E'Pelé da Bomba e Boa Gente foram fotografados juntos em eventos da ABCA em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pelé da Bomba associated_with Gildo Alfinete
-- Photographed together at ABCA events
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "contemporary, photographed together"}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  E'Pelé da Bomba and Gildo Alfinete were photographed together at ABCA events in Salvador.',
  E'Pelé da Bomba e Gildo Alfinete foram fotografados juntos em eventos da ABCA em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pelé da Bomba' AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Índio (Mercado Modelo) student_of Pelé da Bomba
--   Manoel Olímpio de Souza (1955-); student whom Pelé told "You can go into the world, you are a Master of Capoeira"
--   Founded Grupo de Capoeira Oxóssi (1969); pioneer of capoeira in Rio Grande do Sul
--   Already in backlog - when imported, add statement: Índio student_of Pelé da Bomba
--
-- Pelé da Bomba member_of ABCA (Associação Brasileira de Capoeira Angola)
--   Council of Masters member; later president
--   Group in backlog - when imported, add statement
--
-- Pelé da Bomba member_of Viva Bahia
--   Folkloric group founded by Emília Biancardi (1962)
--   Group in backlog - when imported, add statement

-- Source: statements/persons/pinatti.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Pinatti
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Pinatti is the SUBJECT.
--
-- NOTE: Redundant associated_with statements removed.
-- Relationships implied by shared group membership (co_founded, member_of)
-- do not need separate associated_with statements.
-- ============================================================

-- Pinatti influenced_by Lamartine Pereira (via book "Capoeira sem Mestre")
-- Note: Not a direct teacher-student relationship, but philosophical/methodological influence
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"influence_type": "book/methodology"}'::jsonb, 'verified'::genealogy.confidence,
  'Wiki Urucungo, Portal Capoeira',
  'Pinatti learned capoeira from Lamartine''s book "Capoeira sem Mestre" (1962) before training with Zé de Freitas',
  'Pinatti aprendeu capoeira pelo livro de Lamartine "Capoeira sem Mestre" (1962) antes de treinar com Zé de Freitas'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinatti' AND o.apelido = 'Lamartine Pereira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pinatti student_of Zé de Freitas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Museu da Pessoa, Wiki Urucungo',
  'Consolidated his capoeira training with Zé de Freitas at CMTC Club; connected with Bahian community through him',
  'Consolidou seu treinamento de capoeira com Zé de Freitas no Clube CMTC; conectou-se com comunidade baiana através dele'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinatti' AND o.apelido = 'Zé de Freitas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pinatti associated_with Suassuna (training partners - personal relationship)
-- Note: This is a direct personal relationship not implied by any shared group membership
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "training partners"}'::jsonb, 'verified'::genealogy.confidence,
  'Wiki Urucungo',
  'Met and trained together in the early 1960s before formal academies',
  'Conheceram-se e treinaram juntos no início dos anos 1960 antes das academias formais'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinatti' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet in dataset)
-- ============================================================
-- Pinatti co_founded Academia São Bento Pequeno (SP) - Aug 1, 1969
-- Pinatti leads Academia São Bento Pequeno (SP) - ongoing
-- Pinatti co_founded Federação Paulista de Capoeira - Jul 14, 1974
-- Pinatti leads Federação Paulista de Capoeira - 1970s (as president)
-- Pinatti member_of Roda da Praça da República - 1960s-1980s
-- ============================================================
-- REDUNDANT (implied by group relationships once imported):
-- - Limão, Paulão: implied by co_founded São Bento Pequeno
-- - Brasília, Silvestre, Joel, Gilvan: implied by member_of Roda da Praça da República
-- - Onça, Gladson, Mello, Polim, José Andrade: implied by co_founded Federação Paulista de Capoeira
-- ============================================================

-- Source: statements/persons/tabosa.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Tabosa (Hélio Tabosa de Moraes)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Tabosa is the SUBJECT.
-- ============================================================

-- Tabosa student_of Arraia (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'IPHAN Capoeira registry; Portal Capoeira; Arraia person report',
  'Primary teacher at Colégio Elefante Branco, Brasília. Tabosa embraced Arraia''s teaching philosophy: "ensinamento direto, olho no olho, ginga com ginga"',
  'Professor principal no Colégio Elefante Branco, Brasília. Tabosa abraçou a filosofia de ensino de Arraia: "ensinamento direto, olho no olho, ginga com ginga"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Arraia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tabosa trained_under Onça Tigre (secondary influence)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'IPHAN Capoeira registry (lists both Arraia and Onça Tigre as instructors)',
  'Secondary teacher per IPHAN registry. Onça Tigre had founded the first capoeira school in the Federal District in 1964.',
  'Professor secundário conforme registro IPHAN. Onça Tigre havia fundado a primeira escola de capoeira no Distrito Federal em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Onça Tigre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tabosa influenced_by Waldemar da Liberdade
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Portal Capoeira - Ás de Ouro 88 article',
  'Waldemar presented Tabosa with "Ás de Ouro 88" berimbau at I Jornada de Capoeira Ouro Preto (1987) and Salvador (1988), recognizing his stature.',
  'Waldemar presenteou Tabosa com berimbau "Ás de Ouro 88" na I Jornada de Capoeira Ouro Preto (1987) e Salvador (1988), reconhecendo sua estatura.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tabosa associated_with Danadinho (training companion, Berimbau de Ouro collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Training companions at Colégio Elefante Branco; together won Berimbau de Ouro 1967-1969 with Grupo Senzala"}'::jsonb,
  'verified'::genealogy.confidence,
  'Danadinho person report; Portal Capoeira; Arraia person report',
  'Both trained under Arraia at Colégio Elefante Branco. Together with Fritz, helped Senzala win Berimbau de Ouro 1967-1969.',
  'Ambos treinaram com Arraia no Colégio Elefante Branco. Junto com Fritz, ajudaram Senzala a vencer Berimbau de Ouro 1967-1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tabosa' AND o.apelido = 'Danadinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Tabosa associated_with Fritz (Alfredo) - training companion at Elefante Branco; helped win Berimbau de Ouro 1967-1969 - needs Fritz import
-- Tabosa associated_with Adilson (Brasília) - competed together at Berimbau de Ouro; Arraia visited his roda with Tabosa - needs Adilson import
-- Tabosa teaches_at Academia Tabosa - founded 1974; needs Academia Tabosa group import
-- Tabosa teaches_at UnB (1965-) - introduced capoeira to university; needs UnB group import if tracked
-- Tabosa associated_with Mestre Zulu - Zulu trained with Tabosa at UnB 1970; needs Zulu import
-- Tabosa associated_with Mestre Itapoan - together at 1988 Salvador event when Waldemar presented berimbau; Itapoan already exists
-- Tabosa associated_with Mestre Pombo de Ouro - honored together at Capoeira Regional Centenary 2017; needs Pombo de Ouro import

-- ============================================================
-- ADDITIONAL PERSON-TO-GROUP RELATIONSHIPS TO ADD WHEN GROUPS EXIST
-- ============================================================
-- Tabosa teaches_at Academia Tabosa - founded 1974 quadra 505 Sul, first official capoeira academy in Brasília
-- Tabosa member_of Grupo Senzala - competed with them 1967-1969 Berimbau de Ouro (not founder, but affiliated)
-- Tabosa regional_coordinator_of FECADF (Federação de Capoeira do Distrito Federal) - honored pioneer 1997

-- Source: statements/persons/tonha-rolo-do-mar.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Tonha Rolo do Mar
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Tonha Rolo do Mar is the SUBJECT.
-- Note: The primary known relationship (teaching Cobrinha Verde) is recorded
-- in Cobrinha Verde's statements file as: Cobrinha Verde trained_under Tonha Rolo do Mar
-- ============================================================

-- No statements where Tonha Rolo do Mar is the SUBJECT are currently documented.
--
-- Her known relationship:
-- - Taught Mestre Cobrinha Verde razor technique (1910s-1920s, Santo Amaro)
--   → This is recorded in cobrinha-verde.sql as "trained_under" with Tonha as OBJECT
--
-- PENDING RELATIONSHIPS (require more research):
-- - Unknown teachers: Who taught Tonha the razor technique? No sources document this.
-- - Unknown group affiliations: No formal groups existed in her era.
-- - Unknown other students: Only Cobrinha Verde is documented as her student.

-- Source: statements/persons/valdebrando.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Valdebrando
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Valdebrando is the SUBJECT.
-- NOTE: Valdebrando has minimal documentation - only known as
-- first teacher of Mestre Medicina. No statements where
-- Valdebrando is subject are available at this time.
-- ============================================================

-- ============================================================
-- NO ACTIVE STATEMENTS
-- ============================================================
-- Valdebrando has no documented relationships where he is the
-- subject that can be represented as statements:
-- - No known teachers (we don't know who taught Valdebrando)
-- - No known groups (we don't know if he belonged to any group)
-- - No known title conferrals
--
-- The only documented relationship is:
--   Medicina trained_under Valdebrando
-- But this statement belongs in medicina.sql (where Medicina
-- is the subject), not here.
-- ============================================================

-- ============================================================
-- PENDING: Medicina trained_under Valdebrando
-- This relationship should be added to medicina.sql
-- (Medicina is already in the dataset)
-- ============================================================

-- Source: statements/persons/virgilio-da-fazenda-grande.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Virgílio da Fazenda Grande
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Virgílio da Fazenda Grande is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Virgílio da Fazenda Grande student_of Espinho Remoso (father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira (2008), Tribuna do Recôncavo (2025)',
  'Virgílio was initiated into capoeira by his father at age 10 at Jaqueira do Carneiro, behind Retiro',
  'Virgílio foi iniciado na capoeira por seu pai aos 10 anos em Jaqueira do Carneiro, atrás do Retiro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Virgílio da Fazenda Grande trained_under Caiçara
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Portal Capoeira (2008)',
  'Brief training with Caiçara after father Espinho Remoso''s death',
  'Treinamento breve com Caiçara após a morte do pai Espinho Remoso'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TITLE CONFERRAL
-- ============================================================

-- Virgílio da Fazenda Grande received_title_from Paulo dos Anjos
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira (2008), ABCA WordPress',
  'Received title of Mestre de Capoeira Angola from Paulo dos Anjos, disciple of Canjiquinha',
  'Recebeu título de Mestre de Capoeira Angola de Paulo dos Anjos, discípulo de Canjiquinha'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'Paulo dos Anjos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES / ASSOCIATIONS
-- ============================================================

-- Virgílio da Fazenda Grande associated_with João Grande (1988 article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-07-30'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Named together as two of eight surviving great master-angoleiros in 1988 Tribuna da Bahia article"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna da Bahia, Caderno de Cultura (July 30, 1988)',
  'Both named in article "A resistência da capoeira" as among eight surviving great master-angoleiros',
  'Ambos nomeados no artigo "A resistência da capoeira" como entre os oito grandes mestres-angoleiros sobreviventes'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Virgílio da Fazenda Grande associated_with João Pequeno (1988 article + ABCA)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-07-30'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow ABCA members; both named among eight surviving great master-angoleiros in 1988"}'::jsonb,
  'verified'::genealogy.confidence,
  'Tribuna da Bahia (July 30, 1988), ABCA records',
  'João Pequeno was first ABCA president (1987); both named in 1988 Tribuna article',
  'João Pequeno foi primeiro presidente da ABCA (1987); ambos nomeados no artigo da Tribuna de 1988'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio da Fazenda Grande' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Virgílio da Fazenda Grande leads ABCA - needs ABCA group import first
-- Virgílio da Fazenda Grande associated_with Bigodinho - Bigodinho exists but association is informal (ABCA roda companions)
-- Virgílio da Fazenda Grande associated_with Nô - Nô exists but association is informal (ABCA roda companions)
-- Virgílio da Fazenda Grande associated_with Boca Rica - Boca Rica exists but association is informal (ABCA roda companions)
-- Virgílio da Fazenda Grande associated_with Pelé da Bomba - Pelé da Bomba exists but association is informal (ABCA roda companions)

-- Source: statements/persons/ze-de-freitas.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zé de Freitas
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Zé de Freitas is the SUBJECT.
-- ============================================================

-- Zé de Freitas student_of Caiçara (initial teacher, 1946)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1946-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Zé de Freitas began training under Mestre Caiçara in 1946 in Bahia. Caiçara later introduced him to Mestre Waldemar.',
  'Zé de Freitas começou a treinar com Mestre Caiçara em 1946 na Bahia. Caiçara mais tarde o apresentou a Mestre Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas student_of Waldemar (primary teacher/mentor after Caiçara's introduction)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1946-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-z%C3%A9-de-freitas',
  'Mestre Caiçara introduced Zé de Freitas to Mestre Waldemar Rodrigues da Paixão (known as "o Poeta" - the Poet). Zé de Freitas became Waldemar''s disciple and refined his technique and musical skills at Waldemar''s famous Barracão in Liberdade, Salvador.',
  'Mestre Caiçara apresentou Zé de Freitas a Mestre Waldemar Rodrigues da Paixão (conhecido como "o Poeta"). Zé de Freitas tornou-se discípulo de Waldemar e aperfeiçoou sua técnica e habilidades musicais no famoso Barracão de Waldemar na Liberdade, Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Suassuna (met at Zé de Freitas's CMTC Club classes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Suassuna met Brasília at Zé de Freitas''s academy/CMTC Club in São Paulo (1965); Zé de Freitas was a unifier of Bahian capoeiristas in SP"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/eventos-agenda/sao-paulo-homenagem-a-mestre-ze-de-freitas/',
  'Suassuna and Brasília first met at Zé de Freitas''s academy/CMTC Club in São Paulo (1965). Zé de Freitas served as a unifier of Bahian capoeiristas arriving in São Paulo.',
  'Suassuna e Brasília se conheceram na academia/Clube CMTC de Zé de Freitas em São Paulo (1965). Zé de Freitas serviu como unificador de capoeiristas baianos chegando em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Brasília (met at Zé de Freitas's CMTC Club classes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Brasília met Suassuna at Zé de Freitas''s academy/CMTC Club in São Paulo (1965); Zé de Freitas was a unifier of Bahian capoeiristas in SP"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/eventos-agenda/sao-paulo-homenagem-a-mestre-ze-de-freitas/',
  'Brasília and Suassuna first met at Zé de Freitas''s academy/CMTC Club in São Paulo (1965). Zé de Freitas served as a unifier of Bahian capoeiristas arriving in São Paulo.',
  'Brasília e Suassuna se conheceram na academia/Clube CMTC de Zé de Freitas em São Paulo (1965). Zé de Freitas serviu como unificador de capoeiristas baianos chegando em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Brasília'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Limão (Grupo dos Nove; both São Paulo pioneers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Both Zé de Freitas and Limão were members of the Grupo dos Nove (Group of Nine) recognized by Mestre Bimba in 1971 as pioneers of capoeira in São Paulo.',
  'Tanto Zé de Freitas quanto Limão foram membros do Grupo dos Nove reconhecidos por Mestre Bimba em 1971 como pioneiros da capoeira em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Limão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Silvestre (Grupo dos Nove; both São Paulo pioneers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Both Zé de Freitas and Silvestre were members of the Grupo dos Nove (Group of Nine) recognized by Mestre Bimba in 1971 as pioneers of capoeira in São Paulo.',
  'Tanto Zé de Freitas quanto Silvestre foram membros do Grupo dos Nove reconhecidos por Mestre Bimba em 1971 como pioneiros da capoeira em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Silvestre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Onça (SP) (Grupo dos Nove; both São Paulo pioneers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971); Onça organized Bimba''s visit"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Both Zé de Freitas and Onça (SP) were members of the Grupo dos Nove (Group of Nine) recognized by Mestre Bimba in 1971. Onça organized Bimba''s visit to São Paulo.',
  'Tanto Zé de Freitas quanto Onça (SP) foram membros do Grupo dos Nove reconhecidos por Mestre Bimba em 1971. Onça organizou a visita de Bimba a São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zé de Freitas associated_with Joel (SP) - Grupo dos Nove member; met at Zé de Freitas's CMTC Club; needs import first
-- Zé de Freitas associated_with Gilvan - Grupo dos Nove member; needs import first
-- Zé de Freitas associated_with Pinatti - Grupo dos Nove member; student of Zé de Freitas; needs import first
-- Zé de Freitas associated_with Mello - student of Zé de Freitas; needs import first
-- Zé de Freitas associated_with Serginho - student of Zé de Freitas; needs import first
-- Zé de Freitas associated_with Dulcídio - "eternal student and friend"; now leads his academy; needs import first

-- ============================================================
-- GROUP RELATIONSHIPS (pending - groups not yet in dataset)
-- ============================================================
-- Zé de Freitas founded Associação de Lutas Unidas Capoeira Freitas (~1960s, Sapopemba, São Paulo)
-- Zé de Freitas member_of Federação Paulista de Capoeira (founding association, 1974)

-- Source: statements/persons/ze-grande-bonfim.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zé Grande (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Zé Grande (Bonfim) is the SUBJECT.
-- Note: This is Zé Grande from the dos Santos family, co-leader of
-- Grupo Bonfim. DISTINCT from José Carlos Cruz (Mestre Grande).
-- ============================================================

-- Zé Grande student_of Mário Buscapé (early 1950s onwards)
-- Primary teacher; Zé Grande was described as Mário's "best disciple"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  E'Mário Buscapé was Zé Grande''s primary teacher. André Lacé described Zé Grande as Mário''s "best disciple." Training began after Mário met the dos Santos brothers (Irineu, Zé Grande, Deraldo) in the early 1950s. The student-teacher relationship continued until 1969 when Mário returned to Bahia.',
  E'Mário Buscapé foi o mestre principal de Zé Grande. André Lacé descreveu Zé Grande como o "melhor discípulo" de Mário. O treinamento começou depois que Mário conheceu os irmãos dos Santos (Irineu, Zé Grande, Deraldo) no início dos anos 1950. A relação mestre-aluno continuou até 1969 quando Mário retornou à Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Grande' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Grande co_founded Grupo Bonfim (Associação Cultural Bonfim)
-- PENDING: Group not yet in dataset
-- When added, use: s.apelido = 'Zé Grande' AND s.apelido_context = 'Bonfim'
-- INSERT INTO genealogy.statements (...)
-- Started: 1953-01-06 (exact), group founding date

-- Zé Grande leads Grupo Bonfim (from 1969)
-- PENDING: Group not yet in dataset
-- When added, use: s.apelido = 'Zé Grande' AND s.apelido_context = 'Bonfim'
-- INSERT INTO genealogy.statements (...)
-- Started: 1969 (year), when Mário Buscapé returned to Bahia

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Zé Grande family_of Deraldo - brother; needs Deraldo import first
-- Zé Grande family_of Irineu dos Santos - brother; needs Irineu import first

-- Zé Grande co_founded Grupo Bonfim - group needs import first
-- Founded: January 6, 1953 with Mário Buscapé, Irineu, Deraldo

-- Zé Grande leads Grupo Bonfim - group needs import first
-- Started: 1969 when Mário Buscapé returned to Bahia
-- Role: President of the group

-- Zé Grande associated_with Dentinho - co-initiator of Roda da Penha; needs import
-- Context: Both credited as initiators of the Roda da Penha (1960s)

-- Zé Grande associated_with Mintirinha - co-initiator of Roda da Penha; needs import
-- Context: Both credited as initiators of the Roda da Penha (1960s)

-- ============================================================
-- NOTE: Statements where Zé Grande is the OBJECT go in the
-- subject's file, not here. Examples:
-- - Gary student_of Zé Grande → goes in gary-bonfim.sql
-- - Soldado trained_under Zé Grande → goes in soldado.sql
-- ============================================================

-- Source: statements/persons/bugalho.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Bugalho
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Bugalho is the SUBJECT.
-- ============================================================

-- Bugalho student_of Waldemar
-- Bugalho frequented Waldemar's barracão as one of his regular capoeiristas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'esquiva.wordpress.com/mestres/mestre-bugalho, velhosmestres.com/br/waldemar-1955-3',
  E'Bugalho frequented Waldemar''s barracão in Liberdade as a regular capoeirista and berimbau player. Sources describe him as one of Waldemar''s bambas. He was photographed by Pierre Verger at the barracão (~1955) and filmed in "Voyage sans passeport" (1960) with Waldemar.',
  E'Bugalho frequentava o barracão de Waldemar na Liberdade como capoeirista e tocador de berimbau regular. Fontes o descrevem como um dos bambas de Waldemar. Foi fotografado por Pierre Verger no barracão (~1955) e filmado em "Voyage sans passeport" (1960) com Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bugalho' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bugalho associated_with Pastinha (recognized by him in 1967)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "recognized as legendary pure Angola capoeirista"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1967, pastinha.md',
  E'In 1967, Mestre Pastinha listed Bugalho among deceased practitioners of "pure Capoeira de Angola". This establishes Bugalho was recognized by Pastinha as a legendary figure in traditional capoeira.',
  E'Em 1967, Mestre Pastinha listou Bugalho entre os praticantes falecidos da "pura Capoeira de Angola". Isso estabelece que Bugalho era reconhecido por Pastinha como figura lendária na capoeira tradicional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bugalho' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Related statements in other files
-- ============================================================
-- Pelé da Bomba student_of Bugalho - See pele-da-bomba.sql (statement is in subject's file)
--   Natalício Neves da Silva (1934-2024), the "Gogó de Ouro" of Bahia
--   Started learning from Bugalho in 1946 at Mercado Modelo ramp at age 12
--   Primary source: velhosmestres.com/br/destaques-20

-- Source: statements/persons/cobrinha-verde.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Cobrinha Verde
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Cobrinha Verde is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'year'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interviews; multiple sources confirm',
  'Began learning capoeira from Besouro at age 4 in 1916. Besouro was his cousin (aunt Maria Haifa was Besouro''s mother) and raised as his brother. On his deathbed, Besouro passed his "spirit to teach capoeira" to Cobrinha Verde.',
  'Começou a aprender capoeira com Besouro aos 4 anos em 1916. Besouro era seu primo (tia Maria Haifa era mãe de Besouro) e criado como seu irmão. Em seu leito de morte, Besouro passou seu "espírito de ensinar capoeira" para Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"relationship_type": "other", "other_type": "cousin"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo - multiple sources confirm family relationship',
  'Cobrinha Verde''s aunt Maria Haifa was Besouro''s mother. Besouro was raised by Cobrinha''s mother Maria Narcisa Bispo, making them effectively brothers as well as cousins.',
  'A tia de Cobrinha Verde, Maria Haifa, era mãe de Besouro. Besouro foi criado pela mãe de Cobrinha, Maria Narcisa Bispo, tornando-os efetivamente irmãos além de primos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  started_at, started_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"apelido_given": "Cobrinha Verde"}'::jsonb,
  '1916-01-01'::date, 'approximate'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interview',
  'Besouro named him "Cobrinha Verde" (little green snake) because of his exceptional speed and agility with his legs.',
  'Besouro o nomeou "Cobrinha Verde" por causa de sua excepcional velocidade e agilidade com as pernas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

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
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1916-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"membership_context": "Began training with cousin Besouro at age 4 (1912/1916). Part of the Trapiche de Baixo community until Besouro''s death in 1924."}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres; Nossa Tribo; Cobrinha Verde interviews',
  'Began training with his cousin Besouro Mangangá at Trapiche de Baixo around age 4 (1912-1916). Cobrinha Verde was the youngest member of the community, trained until Besouro''s death in 1924.',
  'Começou a treinar com seu primo Besouro Mangangá no Trapiche de Baixo por volta dos 4 anos de idade (1912-1916). Cobrinha Verde era o membro mais jovem da comunidade, treinou até a morte de Besouro em 1924.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Cobrinha Verde' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Gasolina
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
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde interview: "My true mestre was Besouro, but I learned from many mestres in Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina..." (Capoeira Online, La Laue, Capoeira Connection)',
  E'Cobrinha Verde learned from Gasolina as part of his training with multiple Santo Amaro mestres after Besouro''s death in 1924. Training ended with Gasolina''s death during Pedrito persecution.',
  E'Cobrinha Verde aprendeu com Gasolina como parte de seu treinamento com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Treinamento terminou com a morte de Gasolina durante perseguição de Pedrito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Siri de Mangue
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo, Lalaue - multiple sources confirm Siri de Mangue as one of Cobrinha Verde''s teachers',
  'Cobrinha Verde learned from multiple Santo Amaro mestres after Besouro''s death in 1924. Siri de Mangue was among them alongside Maitá, Licurí, Joité, Dendê, and others.',
  'Cobrinha Verde aprendeu com múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Siri de Mangue estava entre eles junto com Maitá, Licurí, Joité, Dendê e outros.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde influenced_by Tio Pascoal
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"discipline": "mandinga"}'::jsonb,
  'verified'::genealogy.confidence,
  'Marcelino dos Santos, "Capoeira e Mandingas: Cobrinha Verde" (1991); Cobrinha Verde interview',
  'Pascoal taught Cobrinha Verde spiritual practices (mandinga): 65 prayers, patuá creation, corpo fechado. He was not a capoeira teacher but a mandingueiro who transmitted African-Brazilian mystical traditions. Cobrinha said: "The person who gave me this amulet was an African who, to this day, when I speak of him, my eyes fill with tears. He was called Uncle Pascoal".',
  'Pascoal ensinou a Cobrinha Verde práticas espirituais (mandinga): 65 orações, criação de patuá, corpo fechado. Ele não era professor de capoeira, mas um mandingueiro que transmitiu tradições místicas afro-brasileiras. Cobrinha disse: "A pessoa que me deu este amuleto foi um africano que, até hoje, quando falo dele, meus olhos se enchem de lágrimas. Ele se chamava Tio Pascoal".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Tio Pascoal'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Espinho Remoso
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Capoeira Online (Cobrinha Verde), Portal Capoeira',
  'Cobrinha Verde learned from Espinho Remoso as part of his training with multiple Santo Amaro mestres. Espinho Remoso listed among: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Neco Canário Pardo.',
  'Cobrinha Verde aprendeu com Espinho Remoso como parte de seu treinamento com múltiplos mestres de Santo Amaro. Espinho Remoso listado entre: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Neco Canário Pardo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Maitá
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiographical testimony (Capoeira Connection, Capoeira Online, La Laue): "I learned from many mestres in Santo Amaro. I will give their names one by one: Maitá (who even had a samba song named after him)..."',
  'Cobrinha Verde learned from Maitá after Besouro''s death in 1924. Maitá was listed first among Cobrinha Verde''s Santo Amaro teachers and notably had a samba song named after him, indicating his prominence in the community.',
  'Cobrinha Verde aprendeu com Maitá após a morte de Besouro em 1924. Maitá foi listado primeiro entre os professores de Cobrinha Verde em Santo Amaro e notavelmente tinha um samba com seu nome, indicando sua proeminência na comunidade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Maitá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Juvêncio Grosso
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiographical testimony (Capoeira Connection, Capoeira Online, La Laue, Velhos Mestres)',
  'Cobrinha Verde learned from Juvêncio Grosso as one of multiple Santo Amaro mestres after Besouro''s death in 1924. Listed in Cobrinha Verde''s testimony: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."',
  'Cobrinha Verde aprendeu com Juvêncio Grosso como um de múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Listado no testemunho de Cobrinha Verde: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Juvêncio Grosso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Dendê
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1924-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  'verified'::genealogy.confidence,
  'Cobrinha Verde autobiographical testimony in "Capoeira e Mandingas" (1991) by Marcelino dos Santos',
  'Cobrinha Verde learned from Dendê as one of multiple Santo Amaro mestres after Besouro''s death in 1924. Listed fourth in Cobrinha Verde''s testimony: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."',
  'Cobrinha Verde aprendeu com Dendê como um de múltiplos mestres de Santo Amaro após a morte de Besouro em 1924. Listado em quarto lugar no testemunho de Cobrinha Verde: "Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde'
  AND o.apelido = 'Dendê' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde associated_with Pastinha (CECA membership)
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
  'person'::genealogy.entity_type, cv.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1955-08-12'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Member #28 at CECA; admitted August 12, 1955; shared teaching duties with Pastinha, instructing students in singing, berimbau, and movements"}'::jsonb,
  'verified'::genealogy.confidence,
  'Pastinha''s official membership book; velhosmestres.com/br/cobrinha-1912-1',
  'Cobrinha Verde was member #28 at CECA, sharing teaching responsibilities with Pastinha. Taught João Grande and João Pequeno specific techniques including floor-touching mandinga.',
  'Cobrinha Verde era membro #28 no CECA, compartilhando responsabilidades de ensino com Pastinha. Ensinou a João Grande e João Pequeno técnicas específicas incluindo a mandinga de tocar o chão.'
FROM genealogy.person_profiles cv, genealogy.person_profiles p
WHERE cv.apelido = 'Cobrinha Verde' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cobrinha Verde trained_under Tonha Rolo do Mar (razor technique)
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
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"skill": "navalha", "skill_details": "razor on cord, in hands, and on feet"}'::jsonb,
  'verified'::genealogy.confidence,
  'Santos, Marcelino dos. "Capoeira e Mandingas: Cobrinha Verde" (1991): "O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar. Uma mulher."',
  E'Tonha Rolo do Mar taught Cobrinha Verde the specialized razor (navalha) technique in Santo Amaro. She was distinct from his other teachers—a woman who mastered the military technique of playing with knife and razor tied to a cord. This represents one of the earliest documented instances of a woman teaching a male capoeira mestre.',
  E'Tonha Rolo do Mar ensinou a Cobrinha Verde a técnica especializada de navalha em Santo Amaro. Ela era distinta de seus outros professores—uma mulher que dominava a técnica militar de jogar com faca e navalha amarradas no cordão. Isso representa uma das primeiras instâncias documentadas de uma mulher ensinando um mestre de capoeira masculino.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Tonha Rolo do Mar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/mario-buscape.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Mário Buscapé
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Mário Buscapé is the SUBJECT.
-- ============================================================

-- Mário Buscapé trained_under Siri de Mangue
-- His father and uncle trained with Siri de Mangue; Mário was exposed to this tradition
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário''s father José Bidel and uncle Dendê trained with Siri de Mangue. While Mário did not train directly under Siri, his capoeira came from this lineage. Influence is indirect through family teachers.',
  'O pai de Mário, José Bidel, e o tio Dendê treinaram com Siri de Mangue. Embora Mário não tenha treinado diretamente com Siri, sua capoeira veio dessa linhagem. A influência é indireta através dos professores da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé influenced_by Neco Canário Pardo (through family)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário''s father José Bidel and uncle Dendê associated with Canário Pardo (Neco Canário Pardo). The capoeira taught to Mário came from this Recôncavo tradition. Influence is indirect through family teachers.',
  'O pai de Mário, José Bidel, e o tio Dendê se associavam com Canário Pardo (Neco Canário Pardo). A capoeira ensinada a Mário veio dessa tradição do Recôncavo. A influência é indireta através dos professores da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé influenced_by Besouro Mangangá (through family lineage)
-- His father and uncle trained with companions of Besouro; Besouro visited their house
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'According to Mário, Besouro visited his family home (before Mário was born, as Besouro died 1924). His father and uncle associated with Besouro''s companions. The lineage tree shows: Besouro → Bidel → Dendê → Mário. Mário carried forward this lineage tradition.',
  'Segundo Mário, Besouro visitou a casa de sua família (antes de Mário nascer, pois Besouro morreu em 1924). Seu pai e tio se associavam com os companheiros de Besouro. A árvore genealógica mostra: Besouro → Bidel → Dendê → Mário. Mário deu continuidade a essa tradição de linhagem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé associated_with Artur Emídio
-- Frequented Artur Emídio's rodas in the 1950s
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Mário frequented Artur Emídio''s roda in Rio de Janeiro during the 1950s. Witnesses say Mário was impressed by Artur''s speed and elevated his own game. Both are among the four founding lineages of contemporary capoeira in Rio."}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Fellow founding lineage of contemporary capoeira in Rio de Janeiro. Mário frequented Artur Emídio''s roda in the 1950s and was impressed by his speed.',
  'Linhagem fundadora da capoeira contemporânea no Rio de Janeiro. Mário frequentava a roda de Artur Emídio nos anos 1950 e ficou impressionado com sua velocidade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé student_of Dendê (uncle)
-- Primary teacher; taught him from age 8 (~1942) in family backyard rodas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was Mário''s uncle and his first capoeira teacher. Starting around age 8 (1942), Mário learned capoeira in improvised rodas in the family''s backyard, with Dendê as his primary teacher.',
  'Dendê era tio de Mário e seu primeiro professor de capoeira. A partir dos 8 anos (1942), Mário aprendeu capoeira em rodas improvisadas no quintal da família, tendo Dendê como seu professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé'
  AND o.apelido = 'Dendê' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé student_of José Bidel (father)
-- Father also trained him in capoeira alongside uncle Dendê
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'José Bidel was Mário''s father and also trained him in capoeira. Starting around age 8 (1942), Mário learned in improvised rodas in the family backyard from both his father and uncle Dendê.',
  'José Bidel era pai de Mário e também o treinou em capoeira. A partir dos 8 anos (1942), Mário aprendeu em rodas improvisadas no quintal da família com seu pai e tio Dendê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé family_of José Bidel (father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Mário was the son of José Bidel dos Santos. Born July 17, 1934 in São Francisco do Conde.',
  'Mário era filho de José Bidel dos Santos. Nasceu em 17 de julho de 1934 em São Francisco do Conde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé' AND o.apelido = 'José Bidel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mário Buscapé family_of Dendê (uncle)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "nephew"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Dendê was Mário''s uncle (brother of José Bidel). Mário was born July 17, 1934.',
  'Dendê era tio de Mário (irmão de José Bidel). Mário nasceu em 17 de julho de 1934.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mário Buscapé'
  AND o.apelido = 'Dendê' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mário Buscapé founded Grupo Bonfim (1953) - group needs import
-- Mário Buscapé associated_with Zé Grande - primary student, took over academy; needs import
-- Mário Buscapé associated_with Deraldo - student, co-leader of Bonfim; needs import
-- Mário Buscapé associated_with Irineu dos Santos - first student at Cavan; needs import
-- Mário Buscapé associated_with Mestre Gary (Mestre 22) - learned from Zé Grande/Deraldo; needs import
-- Mário Buscapé associated_with Mestre Veludo - member of Bonfim group; needs import

-- Source: statements/persons/medicina.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Medicina
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Medicina is the SUBJECT.
-- ============================================================

-- Medicina student_of Suassuna
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna, https://grupo-capoeira-raca.webnode.fr/sobre-nos/',
  'Primary teacher in Itabuna. Medicina was approximately 15 years old when he became Suassuna''s student. When Suassuna left for São Paulo (~1965-1967), he left the academy under Medicina''s command, calling him his "melhor aluno" (best student).',
  'Professor principal em Itabuna. Medicina tinha aproximadamente 15 anos quando se tornou aluno de Suassuna. Quando Suassuna partiu para São Paulo (~1965-1967), deixou a academia sob o comando de Medicina, chamando-o de seu "melhor aluno".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina associated_with Itapoan (contemporaries in 1982 O Globo article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/cobrinha-1982-3',
  'Both listed in 1982 O Globo article as prominent Regional mestres in Salvador.',
  'Ambos listados no artigo do O Globo de 1982 como mestres proeminentes de Regional em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina associated_with Vermelho 27 (contemporaries in 1982 O Globo article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/cobrinha-1982-3',
  'Both listed in 1982 O Globo article as prominent Regional mestres in Salvador.',
  'Ambos listados no artigo do O Globo de 1982 como mestres proeminentes de Regional em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina associated_with Brás Amansa Brabo (contemporaries in 1982 O Globo article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/cobrinha-1982-3',
  'Both listed in 1982 O Globo article as prominent Regional mestres in Salvador.',
  'Ambos listados no artigo do O Globo de 1982 como mestres proeminentes de Regional em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Medicina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina trained_under Maneca Brandão (at Major Dória's academy, early 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna',
  'Trained at Major Dória''s academy in Itabuna where Maneca Brandão was the primary instructor. Using trained_under since Suassuna was Medicina''s primary teacher, but Maneca Brandão taught at the same academy.',
  'Treinou na academia do Major Dória em Itabuna onde Maneca Brandão era o instrutor principal. Usando trained_under já que Suassuna era o professor principal de Medicina, mas Maneca Brandão ensinava na mesma academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Maneca Brandão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina trained_under Valdebrando (first exposure to capoeira)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://pclogic.wixsite.com/capoeiraraza/mestre-medicina',
  'First exposure to capoeira before entering Major Dória''s academy. Valdebrando was likely a street capoeirista in Itabuna. Used trained_under (not student_of) as this was initial exposure, not ongoing formal training.',
  'Primeira exposição à capoeira antes de entrar na academia do Major Dória. Valdebrando era provavelmente um capoeirista de rua em Itabuna. Usado trained_under (não student_of) pois foi exposição inicial, não treinamento formal contínuo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Valdebrando'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina trained_under Antônio Rodrigues (introduced to street capoeira circles ~1965)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://grupo-capoeira-raca.webnode.fr/sobre-nos/',
  'A friend introduced Medicina to Antônio Rodrigues, who brought him into the street capoeira circles of Itabuna around age fifteen (~1965). Antônio Rodrigues founded Academia de Capoeira Nossa Senhora de Fátima, the first indoor academy in Itabuna. Used trained_under (not student_of) as this was introduction to the capoeira scene; Suassuna became his primary teacher.',
  'Um amigo apresentou Medicina a Antônio Rodrigues, que o trouxe para as rodas de capoeira de rua de Itabuna por volta dos quinze anos (~1965). Antônio Rodrigues fundou a Academia de Capoeira Nossa Senhora de Fátima, a primeira academia fechada em Itabuna. Usado trained_under (não student_of) pois foi uma introdução à cena da capoeira; Suassuna se tornou seu professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Antônio Rodrigues'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Medicina trained_under Major Dória (Carlos Dória) - needs import first
-- Trained at Academia Cultura Física e Capoeira Major Dória in Itabuna

-- Dedé student_of Medicina - Dedé not yet in dataset
-- Mestre Dedé founded Kilombolas after Medicina departed

-- Macarrão (Idalina) student_of Medicina - needs import first
-- Student of Medicina

-- Dilaho student_of Medicina - needs import first
-- Student of Medicina in Itabuna

-- Pacheco (Malandragem) associated_with Medicina - needs import first
-- Co-founded Kilombolas in 1973 at Faculdade de Medicina

-- Lobão associated_with Medicina - Lobão in backlog
-- Fellow early student of Suassuna in Itabuna; graduated CDO 1970

-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet in dataset)
-- ============================================================

-- Medicina founded ACRESI - ACRESI not yet in dataset
-- ~1965, renamed from ACRI after Suassuna departed

-- Medicina co_founded Kilombolas - Kilombolas not yet in dataset
-- 1973, Salvador, with Pacheco

-- Medicina founded Meninos da Ilha - not yet in dataset
-- Late 1970s, Ilha Mar Grande

-- Medicina founded Grupo Raça - not yet in dataset
-- ~1980s, Cachoeira/Muritiba, current group

-- Source: statements/persons/rudolf-hermanny.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Rudolf Hermanny
-- Generated: 2025-12-16
-- ============================================================
-- This file contains all relationships where Rudolf Hermanny is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Rudolf Hermanny student_of Sinhozinho
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
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho/; A Noite newspaper April 1, 1949; rohermanny.tripod.com',
  'Rudolf Hermanny trained under Mestre Sinhozinho at his academies in Ipanema during the mid-1940s through 1962. He was Sinhozinho''s most famous fighting student, representing the school in challenges against Mestre Bimba''s Regional (1949), the Gracie family (1953), and Artur Emídio (1953). His 1949 victory over Bimba''s student Perez reportedly impressed Bimba enough to incorporate some movements into Regional.',
  'Rudolf Hermanny treinou sob Mestre Sinhozinho em suas academias em Ipanema desde meados da década de 1940 até 1962. Ele foi o aluno lutador mais famoso de Sinhozinho, representando a escola em desafios contra a Regional de Mestre Bimba (1949), a família Gracie (1953) e Artur Emídio (1953). Sua vitória em 1949 sobre o aluno de Bimba, Perez, supostamente impressionou Bimba o suficiente para incorporar alguns movimentos na Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rudolf Hermanny associated_with Cirandinha (training partner)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training partner at Sinhozinho''s academy"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho/; nossa-tribo.com',
  'Rudolf Hermanny and Cirandinha (Luiz Pereira de Aguiar) were the two primary fighting representatives of Sinhozinho''s school. Together they represented capoeira carioca in the 1949 challenge against Bimba''s Regional and the 1953 challenge against the Gracie family at Vasco da Gama stadium.',
  'Rudolf Hermanny e Cirandinha (Luiz Pereira de Aguiar) foram os dois principais representantes de luta da escola de Sinhozinho. Juntos representaram a capoeira carioca no desafio de 1949 contra a Regional de Bimba e no desafio de 1953 contra a família Gracie no estádio do Vasco da Gama.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Cirandinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rudolf Hermanny family_of Bruno Hermanny (brother)
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
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "sibling"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://rohermanny.tripod.com/; https://pt.wikipedia.org/wiki/Bruno_Hermanny; Diário de Justiça do Rio de Janeiro legal records',
  'Rudolf de Otero Hermanny and Bruno de Otero Hermanny were brothers, both sons of Arthur Hermanny and Elisabeth de Otero. They both trained at Mestre Sinhozinho''s academies in Ipanema during the mid-1940s. Rudolf became famous as a capoeira fighter while Bruno became a champion in underwater fishing and other aquatic sports.',
  'Rudolf de Otero Hermanny e Bruno de Otero Hermanny eram irmãos, ambos filhos de Arthur Hermanny e Elisabeth de Otero. Ambos treinaram nas academias de Mestre Sinhozinho em Ipanema durante meados da década de 1940. Rudolf se tornou famoso como lutador de capoeira enquanto Bruno se tornou campeão em pesca subaquática e outros esportes aquáticos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Bruno Hermanny'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rudolf Hermanny trained_under Augusto Cordeiro - needs import first (judoka/combat consultant to Sinhozinho)
-- Rudolf Hermanny associated_with André Lacé Lopes - needs import first (fellow Sinhozinho student, author of book about them)

COMMIT;
