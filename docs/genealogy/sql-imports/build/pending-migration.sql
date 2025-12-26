-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2025-12-25T23:55:15.868Z
-- ============================================================
--
-- New entity files: 16
-- Changed entity files: 1
-- New statement files: 16
-- Changed statement files: 4
-- Deleted files: 0
-- Unchanged files: 403
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/almiro.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Almiro
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1950 (decade precision)
-- Received mestre title in 1983. Typical age for mestre: 30-45.
-- If mestre at age 33-38, birth year ~1945-1950. Using 1950 as estimate.
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
  'Almiro Aquilino',
  'Almiro',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeira.online/history/mestres/mestre-bimba/', 'https://www.lalaue.com/learn-capoeira/mestre-bimba/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Practices and teaches the pure Capoeira Regional tradition of Mestre Bimba. Trained at the historic Academia do Bimba at Terreiro de Jesus in Salvador. His teaching emphasizes not only the martial art, but also the musical instruments, dance, and song that comprise the complete art form.',
  E'Pratica e ensina a tradição pura da Capoeira Regional de Mestre Bimba. Treinou na histórica Academia do Bimba no Terreiro de Jesus em Salvador. Seu ensino enfatiza não apenas a arte marcial, mas também os instrumentos musicais, a dança e o canto que compõem a forma de arte completa.',
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Almiro Aquilino, known as Mestre Almiro, is a master of Capoeira Regional from Salvador, Bahia, Brazil. His journey in capoeira led him to the historic Academia do Bimba—the first recognized capoeira school in Brazil and the spiritual heart of Capoeira Regional—located at the Terreiro de Jesus in Salvador''s Pelourinho district.

In 1983, Almiro received his Mestre certification at the Academia do Bimba, marking his ascent to the highest traditional rank in Capoeira Regional. This occurred during a transitional period for the historic institution: Mestre Bimba had died in 1974, and his faithful student Vermelho 27 had been maintaining the academy since the early 1970s. When Vermelho 27''s health declined in the early 1980s, the school came under the brief supervision of Mestre Almiro.

Almiro headed the academy until 1986, when he was invited to come to the United States to teach capoeira and related music courses at Portland State University in Portland, Oregon. This opportunity marked a significant moment in capoeira''s global spread—one of Mestre Bimba''s direct lineage practitioners bringing the art to the Pacific Northwest.

Shortly after his arrival in the summer of 1986, Almiro presented three master classes at local high schools and performed on fifteen separate occasions at local community events. Portland welcomed him warmly, and he fell in love with the city, deciding to emigrate permanently. He became a naturalized U.S. citizen in 1994.

After his departure from Salvador, the Associação de Capoeira Mestre Bimba at Terreiro de Jesus was transferred to Mestre Bamba (Rubens Costa Silva), who continues to lead it today. This succession—Vermelho 27 → Almiro → Bamba—preserved the unbroken lineage of Mestre Bimba''s historic academy.

Over the following decades, Mestre Almiro has given or participated in many capoeira workshops across the West Coast—in Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego, and Vancouver BC. He has also organized cultural exchange trips to Brazil for his students and others interested in taking capoeira classes in his native city of Salvador.

In 2004, Mestre Almiro founded the Bahia Brazil Art Center (formerly the Cultural Awareness Foundation), a non-profit organization dedicated to sharing Brazilian culture with the citizens of Portland through movement, music, and art. The vision extended beyond capoeira alone—Almiro sought to make an impact on the welfare and education of youth in both Portland and Salvador, inspired by educational projects he experienced in his own youth.

As founder and executive director of the Bahia Brazil Art Center, Almiro continues to provide leadership and hands-on management of cultural exchange programs. He currently teaches Brazilian arts classes related to Capoeira Regional, including training in martial arts, musical instruments, dance, and song. His sister Valdizia heads BBAC operations in Bahia, Brazil, maintaining the connection to his homeland.

Mestre Almiro has worked for many years to accommodate U.S. students while preserving the integrity of the traditional art of Capoeira Regional do Mestre Bimba—a mission that honors his brief but significant role in the succession of Bimba''s historic school.',
  -- bio_pt
  E'Almiro Aquilino, conhecido como Mestre Almiro, é um mestre de Capoeira Regional de Salvador, Bahia, Brasil. Sua jornada na capoeira o levou à histórica Academia do Bimba—a primeira escola de capoeira reconhecida no Brasil e o coração espiritual da Capoeira Regional—localizada no Terreiro de Jesus no Pelourinho de Salvador.

Em 1983, Almiro recebeu sua certificação de Mestre na Academia do Bimba, marcando sua ascensão ao mais alto posto tradicional na Capoeira Regional. Isso ocorreu durante um período de transição para a histórica instituição: Mestre Bimba havia morrido em 1974, e seu fiel aluno Vermelho 27 mantinha a academia desde o início dos anos 1970. Quando a saúde de Vermelho 27 declinou no início dos anos 1980, a escola ficou sob a breve supervisão de Mestre Almiro.

Almiro liderou a academia até 1986, quando foi convidado a vir aos Estados Unidos para ensinar capoeira e cursos de música relacionados na Portland State University em Portland, Oregon. Esta oportunidade marcou um momento significativo na expansão global da capoeira—um praticante da linhagem direta de Mestre Bimba levando a arte ao noroeste do Pacífico.

Logo após sua chegada no verão de 1986, Almiro apresentou três master classes em escolas locais e se apresentou em quinze ocasiões separadas em eventos comunitários locais. Portland o recebeu calorosamente, e ele se apaixonou pela cidade, decidindo emigrar permanentemente. Ele se tornou cidadão americano naturalizado em 1994.

Após sua partida de Salvador, a Associação de Capoeira Mestre Bimba no Terreiro de Jesus foi transferida para Mestre Bamba (Rubens Costa Silva), que continua a liderá-la hoje. Esta sucessão—Vermelho 27 → Almiro → Bamba—preservou a linhagem ininterrupta da histórica academia de Mestre Bimba.

Ao longo das décadas seguintes, Mestre Almiro participou de muitos workshops de capoeira pela Costa Oeste—em Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego e Vancouver BC. Ele também organizou viagens de intercâmbio cultural ao Brasil para seus alunos e outros interessados em fazer aulas de capoeira em sua cidade natal de Salvador.

Em 2004, Mestre Almiro fundou o Bahia Brazil Art Center (anteriormente Cultural Awareness Foundation), uma organização sem fins lucrativos dedicada a compartilhar a cultura brasileira com os cidadãos de Portland através de movimento, música e arte. A visão se estendia além da capoeira sozinha—Almiro buscou impactar o bem-estar e a educação de jovens em Portland e Salvador, inspirado por projetos educacionais que ele experimentou em sua própria juventude.

Como fundador e diretor executivo do Bahia Brazil Art Center, Almiro continua a fornecer liderança e gestão prática de programas de intercâmbio cultural. Ele atualmente ensina aulas de artes brasileiras relacionadas à Capoeira Regional, incluindo treinamento em artes marciais, instrumentos musicais, dança e canto. Sua irmã Valdizia lidera as operações do BBAC na Bahia, Brasil, mantendo a conexão com sua terra natal.

Mestre Almiro trabalhou por muitos anos para acomodar alunos americanos enquanto preserva a integridade da arte tradicional da Capoeira Regional do Mestre Bimba—uma missão que honra seu breve, mas significativo papel na sucessão da histórica escola de Bimba.',
  -- achievements_en
  E'Received Mestre certification at Academia do Bimba (1983); Briefly supervised historic Associação de Capoeira Mestre Bimba at Terreiro de Jesus (1983-1986); Pioneer of Capoeira Regional in the Pacific Northwest; Taught at Portland State University (1986+); Founded Bahia Brazil Art Center/Cultural Awareness Foundation (2004); Naturalized U.S. citizen (1994); Conducted workshops across the West Coast for decades; Organized cultural exchange trips between Portland and Salvador',
  -- achievements_pt
  E'Recebeu certificação de Mestre na Academia do Bimba (1983); Supervisionou brevemente a histórica Associação de Capoeira Mestre Bimba no Terreiro de Jesus (1983-1986); Pioneiro da Capoeira Regional no noroeste do Pacífico; Ensinou na Portland State University (1986+); Fundou o Bahia Brazil Art Center/Cultural Awareness Foundation (2004); Cidadão americano naturalizado (1994); Conduziu workshops pela Costa Oeste por décadas; Organizou viagens de intercâmbio cultural entre Portland e Salvador',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1950, decade):
Received mestre title in 1983. Typical age for mestre certification is 30-45. If mestre at age 33-38, birth year would be ~1945-1950. Using 1950 as estimate with decade precision.

BIRTH PLACE: Salvador, Bahia, Brazil (confirmed)

FULL NAME: Almiro Aquilino (per BBAC website)

TEACHERS:
- Vermelho 27 (primary teacher, based on available sources)
- Received mestre certification in 1983 at Academia do Bimba during Vermelho 27''s leadership
- No sources found confirming direct training under Mestre Bimba, though his estimated birth year (~1950) would have made this possible

ACADEMY SUPERVISION:
- Vermelho 27 supervised Terreiro de Jesus until early 1980s
- Almiro briefly supervised after Vermelho 27 (1983-1986)
- Transferred to Mestre Bamba in 1986

USA TIMELINE:
- 1986: Arrived Portland, Oregon (summer); invited by Portland State University
- 1986: 3 master classes at local high schools; 15 community performances
- 1994: Became naturalized U.S. citizen
- 2004: Founded Bahia Brazil Art Center (formerly Cultural Awareness Foundation)

CURRENT ACTIVITY:
- Executive Director of Bahia Brazil Art Center in Portland
- His sister Valdizia heads BBAC operations in Bahia, Brazil
- Continues teaching Capoeira Regional, musical instruments, dance, and song

WORKSHOP LOCATIONS:
Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego, Vancouver BC

SOURCES CONSULTED:
- Bahia Brazil Art Center website (bahiabrazilartcenter.com)
- Capoeira Online - Mestre Bimba page
- Lalaue - Mestre Bimba page
- Multiple searches for biographical details',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1950, década):
Recebeu título de mestre em 1983. Idade típica para certificação de mestre é 30-45. Se mestre aos 33-38 anos, ano de nascimento seria ~1945-1950. Usando 1950 como estimativa com precisão de década.

LOCAL DE NASCIMENTO: Salvador, Bahia, Brasil (confirmado)

NOME COMPLETO: Almiro Aquilino (conforme site do BBAC)

PROFESSORES:
- Vermelho 27 (professor principal, com base nas fontes disponíveis)
- Recebeu certificação de mestre em 1983 na Academia do Bimba durante a liderança de Vermelho 27
- Nenhuma fonte encontrada confirmando treinamento direto sob Mestre Bimba, embora seu ano de nascimento estimado (~1950) teria tornado isso possível

SUPERVISÃO DA ACADEMIA:
- Vermelho 27 supervisionou o Terreiro de Jesus até o início dos anos 1980
- Almiro supervisionou brevemente após Vermelho 27 (1983-1986)
- Transferido para Mestre Bamba em 1986

CRONOLOGIA NOS EUA:
- 1986: Chegou em Portland, Oregon (verão); convidado pela Portland State University
- 1986: 3 master classes em escolas locais; 15 apresentações comunitárias
- 1994: Tornou-se cidadão americano naturalizado
- 2004: Fundou o Bahia Brazil Art Center (anteriormente Cultural Awareness Foundation)

ATIVIDADE ATUAL:
- Diretor Executivo do Bahia Brazil Art Center em Portland
- Sua irmã Valdizia lidera as operações do BBAC na Bahia, Brasil
- Continua ensinando Capoeira Regional, instrumentos musicais, dança e canto

LOCAIS DE WORKSHOPS:
Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego, Vancouver BC

FONTES CONSULTADAS:
- Site do Bahia Brazil Art Center (bahiabrazilartcenter.com)
- Capoeira Online - página do Mestre Bimba
- Lalaue - página do Mestre Bimba
- Múltiplas buscas por detalhes biográficos'
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

-- Source: entities/persons/bamba.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bamba
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH DATE ESTIMATION (1964, exact):
-- Portal Capoeira interview states "Costa Silva Rubens, Mestre Bamba,
-- nasceu no dia 04 de Setembro de 1964" (born September 4, 1964).
-- User input suggested born 1965, but began capoeira age 12 in 1977
-- (1977 - 12 = 1965). However Portal Capoeira is explicit: Sept 4, 1964.
-- Possible discrepancy: may have started at age 12 in late 1977
-- (after Sept birthday) making him technically 13. Using 1964 as
-- the Portal Capoeira source is explicit.
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
  'Rubens Costa Silva',
  'Bamba',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-bamba/', 'https://portalcapoeira.com/capoeira/fundamentos-da-capoeira/o-bamba-e-bamba/', 'https://www.lalaue.com/capoeira-schools/associacao-de-capoeira-mestre-bimba/', 'https://www.capoeira-muenchen.de/en/capoeira/the-masters']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Bamba is known for his flexibility and graceful movements, earning him the epithet "bailarino da capoeira" (the dancer of capoeira). He developed the famous "meia lua baiana" (Bahian half-moon), a signature technique. Despite his seemingly delicate style, he is described as a dangerous and fearless capoeirista. His game preserves the pure methodology of Mestre Bimba''s Capoeira Regional while maintaining the tradition passed down through Vermelho 27.',
  E'Mestre Bamba é conhecido por sua flexibilidade e movimentos graciosos, ganhando o epíteto de "bailarino da capoeira". Ele desenvolveu a famosa "meia lua baiana", uma técnica característica. Apesar de seu estilo aparentemente delicado, é descrito como um capoeirista perigoso e destemido. Seu jogo preserva a metodologia pura da Capoeira Regional de Mestre Bimba enquanto mantém a tradição transmitida através de Vermelho 27.',
  -- Life dates
  1964,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Rubens Costa Silva, known as Mestre Bamba or affectionately "Rubinho," was born on September 4, 1964, in Salvador, Bahia. At the age of 12, while helping his mother run a restaurant in the historic center, young Rubens witnessed capoeira classes being taught by Mestre Gato da Bahia in the Pelourinho. This encounter sparked his passion for the art.

His entry into capoeira came through the streets. Participating in various rodas at the Terreiro de Jesus, he met Mestre Vermelho Boxel (Cecílio de Jesus Calheiros), whom Bamba considers his first mestre. This encounter in 1977 proved fateful. Vermelho Boxel introduced the young aspirant to the Associação de Capoeira Mestre Bimba, where Vermelho 27—Vermelho Boxel''s own teacher—still held court as the custodian of Mestre Bimba''s legacy.

From that moment, Bamba immersed himself in the world of Capoeira Regional at the historic academy on Rua das Laranjeiras in the Terreiro de Jesus—the very space where Mestre Bimba had taught since 1942. Under the guidance of Mestre Vermelho 27, assisted by mestres Coringa, Durval (Ferro Velho), Boa Gente, and Bahia, Bamba progressed from a simple associate to become the inheritor of one of capoeira''s most sacred spaces.

Bamba''s journey from student to leader was gradual but steady. He trained for years at the academy, eventually receiving his mestre diploma from Vermelho 27. When Vermelho 27 passed away on May 18, 1996—after years battling skin cancer—Bamba invested tremendous effort to preserve the traditions and history of Capoeira Regional. He sought counsel from the older mestres in Bahia, and most supported his intention to conserve the culture and history of capoeira.

Today, Mestre Bamba serves as President of the Associação de Capoeira Mestre Bimba, continuing the succession that runs from Mestre Bimba through Vermelho 27 (with a brief period under Mestre Almiro in the mid-1980s). He teaches at Rua das Laranjeiras in the Pelourinho, where demonstrations occur almost every night featuring traditional Regional, various toques of the berimbaus, contemporary rodas, and sometimes maculelê.

His philosophy reflects profound humility: "I am not the owner of Regional Capoeira; I had several masters, and I will always respect my Mestre Vermelho 27. I preserve the history of Capoeira Regional and practice it until the day I die. The Capoeira Regional was passed on to me by Mestre Vermelho 27." He emphasizes that he respects all other styles of capoeira and refuses to criticize other expressions of the art.

Under his leadership, the ACMB has grown into an international organization with branches in Japan, Belgium, the United States, Great Britain, Australia, Russia, Canada, and Poland. Mestre Bamba dedicates considerable time to traveling throughout Europe and beyond to teach. The organization has produced numerous mestres including Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra, and others—some of whom later founded their own organizations, notably the União Internacional de Capoeira Regional (UNICAR) in 2003.

Mestre Bamba''s training grounds at the Terreiro de Jesus represent the oldest physical space in the world where capoeira is continuously taught. As custodian of this heritage, he embodies the living link between the founder of Capoeira Regional and future generations—a responsibility he carries with characteristic dedication and grace.',
  -- bio_pt
  E'Rubens Costa Silva, conhecido como Mestre Bamba ou carinhosamente "Rubinho," nasceu em 4 de setembro de 1964, em Salvador, Bahia. Aos 12 anos, enquanto ajudava sua mãe a administrar um restaurante no centro histórico, o jovem Rubens presenciou aulas de capoeira ministradas por Mestre Gato da Bahia no Pelourinho. Este encontro despertou sua paixão pela arte.

Sua entrada na capoeira veio pelas ruas. Participando de várias rodas no Terreiro de Jesus, ele conheceu Mestre Vermelho Boxel (Cecílio de Jesus Calheiros), a quem Bamba considera seu primeiro mestre. Este encontro em 1977 provou ser decisivo. Vermelho Boxel apresentou o jovem aspirante à Associação de Capoeira Mestre Bimba, onde Vermelho 27—o próprio professor de Vermelho Boxel—ainda reinava como guardião do legado de Mestre Bimba.

A partir daquele momento, Bamba mergulhou no mundo da Capoeira Regional na histórica academia da Rua das Laranjeiras no Terreiro de Jesus—o mesmo espaço onde Mestre Bimba havia ensinado desde 1942. Sob a orientação de Mestre Vermelho 27, auxiliado pelos mestres Coringa, Durval (Ferro Velho), Boa Gente e Bahia, Bamba progrediu de um simples associado a herdeiro de um dos espaços mais sagrados da capoeira.

A jornada de Bamba de aluno a líder foi gradual mas constante. Ele treinou por anos na academia, eventualmente recebendo seu diploma de mestre de Vermelho 27. Quando Vermelho 27 faleceu em 18 de maio de 1996—após anos lutando contra câncer de pele—Bamba investiu tremendo esforço para preservar as tradições e a história da Capoeira Regional. Ele buscou conselho dos mestres mais velhos da Bahia, e a maioria apoiou sua intenção de conservar a cultura e a história da capoeira.

Hoje, Mestre Bamba serve como Presidente da Associação de Capoeira Mestre Bimba, continuando a sucessão que vai de Mestre Bimba através de Vermelho 27 (com um breve período sob Mestre Almiro em meados dos anos 1980). Ele ensina na Rua das Laranjeiras no Pelourinho, onde demonstrações ocorrem quase todas as noites apresentando Regional tradicional, vários toques de berimbaus, rodas contemporâneas e às vezes maculelê.

Sua filosofia reflete profunda humildade: "Eu não sou o dono da Capoeira Regional; eu tive vários mestres, e sempre respeitarei meu Mestre Vermelho 27. Eu preservo a história da Capoeira Regional e a pratico até o dia em que morrer. A Capoeira Regional foi passada para mim pelo Mestre Vermelho 27." Ele enfatiza que respeita todos os outros estilos de capoeira e se recusa a criticar outras expressões da arte.

Sob sua liderança, a ACMB cresceu para uma organização internacional com filiais no Japão, Bélgica, Estados Unidos, Grã-Bretanha, Austrália, Rússia, Canadá e Polônia. Mestre Bamba dedica tempo considerável viajando pela Europa e além para ensinar. A organização produziu numerosos mestres incluindo Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra e outros—alguns dos quais mais tarde fundaram suas próprias organizações, notadamente a União Internacional de Capoeira Regional (UNICAR) em 2003.

Os campos de treinamento de Mestre Bamba no Terreiro de Jesus representam o espaço físico mais antigo do mundo onde a capoeira é continuamente ensinada. Como guardião deste patrimônio, ele encarna o elo vivo entre o fundador da Capoeira Regional e as gerações futuras—uma responsabilidade que ele carrega com dedicação e graça características.',
  -- achievements_en
  E'President of Associação de Capoeira Mestre Bimba (ACMB); Custodian of the oldest continuously operating capoeira academy in the world (since 1942); Developed the "meia lua baiana" (Bahian half-moon) technique; Expanded ACMB internationally to Japan, Belgium, USA, Great Britain, Australia, Russia, Canada, and Poland; Trained numerous mestres including Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra, Saguin, and others',
  -- achievements_pt
  E'Presidente da Associação de Capoeira Mestre Bimba (ACMB); Guardião da academia de capoeira em operação contínua mais antiga do mundo (desde 1942); Desenvolveu a técnica "meia lua baiana"; Expandiu a ACMB internacionalmente para Japão, Bélgica, EUA, Grã-Bretanha, Austrália, Rússia, Canadá e Polônia; Formou numerosos mestres incluindo Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra, Saguin e outros',
  -- notes_en
  E'BIRTH DATE: September 4, 1964 per Portal Capoeira interview
User input stated born 1965, but Portal Capoeira is explicit about Sept 4, 1964.
Began capoeira at age 12 in 1977.

NAME VARIANTS:
- Rubens Costa Silva (full name)
- Rubens Costa e Silva (variant spelling)
- "Rubinho" (affectionate nickname)

TEACHERS:
- Mestre Vermelho Boxel (Cecílio de Jesus Calheiros) - first mestre, street training, 1977
- Mestre Vermelho 27 (José Carlos Andrade Bittencourt) - primary mestre at ACMB, 1977-1996
- Mestre Coringa - assisted at ACMB
- Mestre Durval (Ferro Velho) - assisted at ACMB; great influence on Bamba
- Mestre Boa Gente (Vivaldo Conceição Rodrigues) - assisted at ACMB
- Mestre Bahia - assisted at ACMB

STUDENTS (confirmed as mestres):
- Mestre Orelha
- Mestre Nelsinho - co-founded UNICAR 2003
- Mestre Marinheiro - co-founded UNICAR 2003
- Mestre Zambi - co-founded UNICAR 2003
- Mestre Cabeludo (Antonio Sergio Pinho Freire de Carvalho) - also trained under Vermelho 27; founded Porto da Barra 1993
- Mestre Traíra - co-founded UNICAR 2003
- Mestre Saguin (Judival Santos de Filho Brito) - trained ~8 years at ACMB; co-founded UNICAR 2003; first ACMB academy in Europe (Munich, 1991)
- Mola Sete
- Jorge Rasta

STYLE NOTES:
- Known as "bailarino da capoeira" (dancer of capoeira) for graceful movements
- Developed signature "meia lua baiana" technique
- Described as flexible, graceful yet dangerous and fearless

ACADEMY SUCCESSION:
1. Mestre Bimba (1942-1973)
2. Mestre Vermelho 27 (1973-early 1980s)
3. Mestre Almiro (1983-1986)
4. Mestre Bamba (1986-present)

ACADEMY ADDRESS:
Rua Francisco Muniz Barreto #1 (formerly Rua das Laranjeiras)
Terreiro de Jesus, Pelourinho, Salvador, Bahia
Phone: 71 99248-3842
Email: kbcaocapoeira@hotmail.com
Website: capoeiramestrebimba.com.br

INTERNATIONAL BRANCHES (as of 2025):
- Japan
- Belgium
- USA (including Bay Area)
- Great Britain (London)
- Australia (Soul Capoeira, Sydney)
- Russia (Krasnodar)
- Canada (Edmonton)
- Poland (Bydgoszcz, Poznań, Rzeszów, Toruń)

UNICAR SPLIT (2003):
In 2003, several of Bamba''s students (Mestre Nelsinho, Mestre Marinheiro, Mestre Traíra, Mestre Zambi, and Mestre Saguin) departed to found UNICAR - União Internacional de Capoeira Regional. This became one of the largest Capoeira organizations in Europe.

PHILOSOPHY QUOTES:
- "I am not the owner of Regional Capoeira; I had several masters, and I will always respect my Mestre Vermelho 27."
- "I preserve the history of Capoeira Regional and practice it until the day I die. The Capoeira Regional was passed on to me by Mestre Vermelho 27."
- "I respect any other kind of Capoeira, and I do not criticize other species, because this kind of criticism can destroy CAPOEIRA."',
  -- notes_pt
  E'DATA DE NASCIMENTO: 4 de setembro de 1964 conforme entrevista Portal Capoeira
Input do usuário indicou nascido 1965, mas Portal Capoeira é explícito sobre 4 de setembro de 1964.
Começou capoeira aos 12 anos em 1977.

VARIANTES DO NOME:
- Rubens Costa Silva (nome completo)
- Rubens Costa e Silva (variante de escrita)
- "Rubinho" (apelido carinhoso)

PROFESSORES:
- Mestre Vermelho Boxel (Cecílio de Jesus Calheiros) - primeiro mestre, treino de rua, 1977
- Mestre Vermelho 27 (José Carlos Andrade Bittencourt) - mestre principal na ACMB, 1977-1996
- Mestre Coringa - auxiliou na ACMB
- Mestre Durval (Ferro Velho) - auxiliou na ACMB; grande influência em Bamba
- Mestre Boa Gente (Vivaldo Conceição Rodrigues) - auxiliou na ACMB
- Mestre Bahia - auxiliou na ACMB

ALUNOS (confirmados como mestres):
- Mestre Orelha
- Mestre Nelsinho - co-fundou UNICAR 2003
- Mestre Marinheiro - co-fundou UNICAR 2003
- Mestre Zambi - co-fundou UNICAR 2003
- Mestre Cabeludo (Antonio Sergio Pinho Freire de Carvalho) - também treinou sob Vermelho 27; fundou Porto da Barra 1993
- Mestre Traíra - co-fundou UNICAR 2003
- Mestre Saguin (Judival Santos de Filho Brito) - treinou ~8 anos na ACMB; co-fundou UNICAR 2003; primeira academia ACMB na Europa (Munique, 1991)
- Mola Sete
- Jorge Rasta

NOTAS DE ESTILO:
- Conhecido como "bailarino da capoeira" por movimentos graciosos
- Desenvolveu técnica característica "meia lua baiana"
- Descrito como flexível, gracioso mas perigoso e destemido

SUCESSÃO DA ACADEMIA:
1. Mestre Bimba (1942-1973)
2. Mestre Vermelho 27 (1973-início anos 1980)
3. Mestre Almiro (1983-1986)
4. Mestre Bamba (1986-presente)

ENDEREÇO DA ACADEMIA:
Rua Francisco Muniz Barreto #1 (anteriormente Rua das Laranjeiras)
Terreiro de Jesus, Pelourinho, Salvador, Bahia
Telefone: 71 99248-3842
Email: kbcaocapoeira@hotmail.com
Website: capoeiramestrebimba.com.br

FILIAIS INTERNACIONAIS (em 2025):
- Japão
- Bélgica
- EUA (incluindo Bay Area)
- Grã-Bretanha (Londres)
- Austrália (Soul Capoeira, Sydney)
- Rússia (Krasnodar)
- Canadá (Edmonton)
- Polônia (Bydgoszcz, Poznań, Rzeszów, Toruń)

SEPARAÇÃO UNICAR (2003):
Em 2003, vários alunos de Bamba (Mestre Nelsinho, Mestre Marinheiro, Mestre Traíra, Mestre Zambi e Mestre Saguin) saíram para fundar a UNICAR - União Internacional de Capoeira Regional. Esta se tornou uma das maiores organizações de Capoeira na Europa.

CITAÇÕES DE FILOSOFIA:
- "Eu não sou o dono da Capoeira Regional; eu tive vários mestres, e sempre respeitarei meu Mestre Vermelho 27."
- "Eu preservo a história da Capoeira Regional e a pratico até o dia em que morrer. A Capoeira Regional foi passada para mim pelo Mestre Vermelho 27."
- "Eu respeito qualquer outro tipo de Capoeira, e não critico outras espécies, porque esse tipo de crítica pode destruir a CAPOEIRA."'
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

-- Source: entities/persons/cafune.sql (NEW)
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
  E'Mestre Cafuné é um dos mais antigos discípulos vivos de Mestre Bimba. Ele preserva e transmite a metodologia tradicional da Capoeira Regional, enfatizando a filosofia de Bimba de que a capoeira ensina não apenas a luta, mas "a arte de bem viver." Ele colabora com Mestre Nenel na Fundação Mestre Bimba e Filhos de Bimba Escola de Capoeira, e faz parte do Conselho Curador da fundação.',
  -- Life dates
  1938,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Sérgio Fachinetti Dória, known as Mestre Cafuné, was born in 1938 in Salvador, Bahia. He works as a carpenter (marceneiro) and has dedicated over five decades to capoeira.

In 1966, Cafuné read an interview with Mestre Bimba in a newspaper and was inspired to seek out the legendary creator of Capoeira Regional. He traveled a considerable distance from the Polo Petroquímico de Camaçari, where he worked, to the historic Pelourinho district in Salvador. He recalls being a timid, fearful person at the time: "I passed through Baixa dos Sapateiros with fear and climbed the hill with my legs trembling."

When he first knocked on the door of Bimba''s Centro de Cultura Física Regional, he was turned away. He soon discovered a small sign on the door that read: "Visit, 2 thousand cruzeiros. Monthly fee, 2 thousand cruzeiros." Rather than pay for a mere visit, Cafuné decided to pay the monthly fee and returned to enroll as a student. Bimba gave him his first lesson that day.

From his very first class, Bimba imparted wisdom that extended beyond physical technique: "When you arrive somewhere, don''t enter immediately. First you observe, see when you can enter, when you can exit, be careful." This teaching became a guiding philosophy for Cafuné: "He taught us to have respect for spaces, be more observant, more balanced—it''s something with a very broad meaning."

Cafuné remained a student at Bimba''s academy until the master departed for Goiânia in 1971, heartbroken by the lack of government support in Bahia. During this time, the batizado ceremonies took place on Sundays at the academy in Nordeste de Amaralina. It was at his batizado that Bimba personally bestowed his nickname: after Cafuné''s first game in a complete roda, the master declared, "his name is Cafuné—he doesn''t play capoeira, he does cafuné" (referring to a gentle caress). And so his identity in capoeira was born.

Cafuné graduated (formatura) in August 1967, earning the right to teach.

In the 1980s, Cafuné sought a tranquil place to live and moved to Lauro de Freitas, a municipality just north of Salvador. He bought a small property (sítio) on the banks of the Ipitanga River, which at the time was clean and full of fish. After a partnership that did not work out, he eventually moved to the Araqui community in Lauro de Freitas, where he established his woodworking shop and continues to reside today.

Cafuné has three children and three grandchildren. He practices Candomblé, maintaining the connection between capoeira and Afro-Brazilian spiritual traditions that was so important to Mestre Bimba himself.

In December 2011, Cafuné published "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" (He doesn''t play capoeira, he does cafuné: stories from Mestre Bimba''s academy) through EDUFBA (Editora da Universidade Federal da Bahia). The 107-page book collects articles originally written for a specialized capoeira magazine, bringing together memories, recollections, and emotions from his time as Bimba''s student. It includes a photo booklet of the master and presents a critical examination of capoeira''s history as "a form of struggle for Black people" during slavery.

Cafuné is a member of the Curator Council (Conselho Curador) of the Fundação Mestre Bimba. He has served three times as vice president of the foundation, once as secretary, and once as public relations director. He also works with Mestre Nenel at Filhos de Bimba Escola de Capoeira, traveling throughout Brazil and internationally to conduct workshops and lectures for groups exceeding 200 young people.

Speaking about Mestre Bimba''s legacy, Cafuné has clarified a common misconception: "Many people say Bimba died in misery, but this isn''t exactly true. At the time of his death, Bimba was sustaining at least three families in three separate houses that he owned." He notes that Bimba had "more than 200 disciples and 600 students," but laments that some students lost their reference and stopped practicing capoeira after the master''s death: "He was who encouraged us to continue."

For Cafuné, keeping Capoeira Regional alive is a form of resistance. He notes the ongoing difficulty in obtaining effective support for capoeira, stating that "the political class does not value the practice." Despite these challenges, he continues to affirm that the capoeira represents "a divisor of waters" (a watershed moment) in his life.

In January 2024, at 85 years old, Mestre Cafuné was among 14 octogenarian capoeira masters honored at the 5º Rede Capoeira event in Salvador. He received a symbolic Sankofa bird sculpture alongside legendary figures including Mestre João Grande (91), Mestre Acordeon (80), Mestre Boca Rica (87), Mestre Brandão (94), and Mestre Felipe de Santo Amaro (96).

In the municipality of Lauro de Freitas where he resides, Cafuné collaborates with existing capoeira groups regardless of whether they practice Angola, Regional, or any other style—helping organize groups through lectures and participating in workshops and courses.',
  -- bio_pt
  E'Sérgio Fachinetti Dória, conhecido como Mestre Cafuné, nasceu em 1938 em Salvador, Bahia. Trabalha como marceneiro e dedicou mais de cinco décadas à capoeira.

Em 1966, Cafuné leu uma entrevista com Mestre Bimba em um jornal e foi inspirado a procurar o lendário criador da Capoeira Regional. Viajou uma distância considerável do Polo Petroquímico de Camaçari, onde trabalhava, até o histórico bairro do Pelourinho em Salvador. Ele recorda ter sido uma pessoa tímida e medrosa na época: "Passava pela Baixa dos Sapateiros com medo e subia a ladeira com as pernas tremendo."

Quando bateu pela primeira vez na porta do Centro de Cultura Física Regional de Bimba, foi dispensado. Logo descobriu uma pequena placa na porta que dizia: "Visita, 2 mil cruzeiros. Mensalidade, 2 mil cruzeiros." Ao invés de pagar por uma mera visita, Cafuné decidiu pagar a mensalidade e voltou para se matricular como aluno. Bimba deu-lhe sua primeira aula naquele dia.

Desde sua primeira aula, Bimba transmitiu sabedoria que ia além da técnica física: "Quando você chegar em algum lugar, não entre imediatamente. Primeiro você observa, vê quando pode entrar, quando pode sair, tenha cuidado." Este ensinamento tornou-se uma filosofia orientadora para Cafuné: "Ele nos ensinou a ter respeito pelos espaços, ser mais observador, mais equilibrado—é algo com um significado muito amplo."

Cafuné permaneceu como aluno na academia de Bimba até a partida do mestre para Goiânia em 1971, desolado pela falta de apoio governamental na Bahia. Durante esse tempo, as cerimônias de batizado aconteciam aos domingos na academia do Nordeste de Amaralina. Foi em seu batizado que Bimba pessoalmente lhe deu o apelido: após o primeiro jogo de Cafuné em uma roda completa, o mestre declarou: "o nome dele é Cafuné—ele não joga capoeira, ele faz cafuné" (referindo-se a um carinho suave). E assim nasceu sua identidade na capoeira.

Cafuné formou-se em agosto de 1967, conquistando o direito de ensinar.

Na década de 1980, Cafuné buscou um lugar tranquilo para viver e mudou-se para Lauro de Freitas, um município ao norte de Salvador. Comprou um pequeno sítio às margens do Rio Ipitanga, que na época era limpo e cheio de peixes. Após uma parceria que não deu certo, eventualmente mudou-se para a comunidade de Araqui em Lauro de Freitas, onde estabeleceu sua marcenaria e continua residindo até hoje.

Cafuné tem três filhos e três netos. Pratica Candomblé, mantendo a conexão entre a capoeira e as tradições espirituais afro-brasileiras que era tão importante para o próprio Mestre Bimba.

Em dezembro de 2011, Cafuné publicou "Ele não joga capoeira, ele faz cafuné: histórias da academia do Mestre Bimba" pela EDUFBA (Editora da Universidade Federal da Bahia). O livro de 107 páginas reúne artigos originalmente escritos para uma revista especializada em capoeira, trazendo memórias, recordações e emoções de seu tempo como aluno de Bimba. Inclui um encarte fotográfico do mestre e apresenta um exame crítico da história da capoeira como "uma forma de luta do povo negro" durante a escravidão.

Cafuné é membro do Conselho Curador da Fundação Mestre Bimba. Ocupou três vezes o cargo de vice-presidente da fundação, uma vez como secretário e uma vez como diretor de relações públicas. Também trabalha com Mestre Nenel na Filhos de Bimba Escola de Capoeira, viajando por todo o Brasil e internacionalmente para conduzir oficinas e palestras para grupos de mais de 200 jovens.

Falando sobre o legado de Mestre Bimba, Cafuné esclareceu um equívoco comum: "Muitas pessoas dizem que Bimba morreu na miséria, mas isso não é exatamente verdade. Na época de sua morte, Bimba sustentava pelo menos três famílias em três casas separadas que ele possuía." Ele observa que Bimba tinha "mais de 200 discípulos e 600 alunos," mas lamenta que alguns alunos perderam a referência e pararam de praticar capoeira após a morte do mestre: "Ele era quem nos animava a continuar."

Para Cafuné, manter a Capoeira Regional viva é uma forma de resistência. Ele nota a dificuldade contínua em obter apoio efetivo para a capoeira, afirmando que "a classe política não valoriza a prática." Apesar desses desafios, ele continua a afirmar que a capoeira representa "um divisor de águas" em sua vida.

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

BATIZADO: Received apelido "Cafuné" directly from Mestre Bimba at batizado ceremony in Nordeste de Amaralina. Bimba declared: "his name is Cafuné—he doesn''t play capoeira, he does cafuné."

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

BATIZADO: Recebeu o apelido "Cafuné" diretamente de Mestre Bimba na cerimônia de batizado no Nordeste de Amaralina. Bimba declarou: "o nome dele é Cafuné—ele não joga capoeira, ele faz cafuné."

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

-- Source: entities/persons/camisa.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Camisa
-- Generated: 2025-12-25
-- ============================================================
-- José Tadeu Carneiro Cardoso (Mestre Camisa / Grão-Mestre Camisa)
-- Born October 28, 1955 in Jacobina/Itapeipu, Bahia
-- Founder of Abadá-Capoeira (1988)
-- Brother of Grão-Mestre Camisa Roxa
-- Fourth in family to graduate from Mestre Bimba's course (1969)
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
  'José Tadeu Carneiro Cardoso',
  'Camisa',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Jos%C3%A9_Tadeu_Carneiro_Cardoso', 'https://capoeirawiki.org/wiki/Jos%C3%A9_Tadeu_Carneiro_Cardoso', 'https://www.lalaue.com/learn-capoeira/mestre-camisa', 'https://capoeirahistory.com/mestre/master-camisa-1955/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Camisa developed a distinctive contemporary style building on Mestre Bimba''s Capoeira Regional foundation. His methodology emphasizes slips, takedowns, speed, and efficiency—techniques that allow smaller practitioners to neutralize larger opponents. He integrated elements from street capoeira, Regional, and Angola traditions into what became the Capoeira Abadá style. During the pandemic, he created new berimbau rhythms including São Bento da Abadá, Gingalopante, Jogo Cruzado, and others, expanding the musical vocabulary of capoeira practice.',
  E'Mestre Camisa desenvolveu um estilo contemporâneo distintivo construindo sobre a base da Capoeira Regional de Mestre Bimba. Sua metodologia enfatiza esquivas, quedas, velocidade e eficiência—técnicas que permitem praticantes menores neutralizar oponentes maiores. Ele integrou elementos da capoeira de rua, Regional e Angola naquilo que se tornou o estilo Capoeira Abadá. Durante a pandemia, criou novos toques de berimbau incluindo São Bento da Abadá, Gingalopante, Jogo Cruzado e outros, expandindo o vocabulário musical da prática da capoeira.',
  -- Life dates
  1955,
  'exact'::genealogy.date_precision,
  'Itapeipu, Jacobina, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'José Tadeu Carneiro Cardoso, known as Grão-Mestre Camisa, was born on October 28, 1955, at Fazenda Estiva near Itapeipu, in the municipality of Jacobina, Bahia. He was the youngest of four brothers who would all become capoeiristas, growing up with nine siblings on the family farm. His eldest brother, Edvaldo Carneiro e Silva, would become the legendary Grão-Mestre Camisa Roxa, considered the best student of Mestre Bimba.

At around seven years old, Camisa began learning capoeira from his brother Camisa Roxa, who had trained under Mestre Bimba. "In the beginning they called me Camisinha," Camisa later recalled, "because I was the youngest and I had a brother—Camisa Roxa—graduated by Mestre Bimba." Around 1963, Camisa Roxa began teaching his younger siblings the lessons he learned at Bimba''s academy in Salvador. The training attracted neighborhood youth—brothers, cousins, even vaqueiros (cowboys)—and they would practice on the farm''s terreiro, on the grass, in the corral, on riverbanks, and even in the water.

At age 12, Camisa moved to Salvador to continue his education and joined Mestre Bimba''s academy directly. His evolution was rapid: he graduated as an aluno formado at just 14 years old in 1969. His graduation companions were Macarrão, Onça Negra, and Torpedo; his sister Noemilde served as his madrinha (godmother). The formatura was a grand celebration in Amaralina featuring traditional stories told by Mestre Bimba, rituals, the prova de fogo (trial by fire), demonstrations of cintura desprezada, benguela games, matches with renowned capoeiristas and old graduates, and samba de roda until dawn.

In the early 1970s, Camisa toured Brazil with the folkloric dance company Olodum Maré alongside his brother Camisa Roxa. In late 1972, at age 16, he arrived in Rio de Janeiro during a tour. When his mother died shortly after, he decided to remain in Rio rather than return to his studies in Salvador. He began teaching capoeira at local academies and participating in the city''s weekend rodas.

In Rio, Camisa joined Grupo Senzala and quickly became a leading figure among its masters. He taught classes at the Civil Servants Association near Canecão playhouse and continued developing his methodology. In 1977, he appeared in the landmark capoeira film "Cordão de Ouro", directed by Antonio Carlos da Fontoura, alongside Mestres Nestor Capoeira, Leopoldina, Peixinho, and others.

In 1984, Camisa organized a major event at Circo Voador featuring Bahian masters and Brazilian capoeiristas from across the country—a watershed moment in Rio''s capoeira scene. However, by 1988, he felt the need for a new structure. "I began to consider the need to design a formal structure for classes, to draw up a basic lesson plan, to create a place to study and teach," he explained. Beyond pedagogy, he wanted to provide family-like support for practitioners who had left behind their homes to dedicate themselves to capoeira.

In 1988, Camisa founded Abadá-Capoeira (Associação Brasileira de Apoio e Desenvolvimento da Arte-Capoeira). His daughter Tatiana suggested the name, which cleverly abbreviates the organization''s mission. Drawing from Mestre Bimba''s innovative concepts, Camisa developed a distinctive teaching methodology emphasizing technical efficiency, proper body mechanics, and structured progression.

Abadá-Capoeira grew to become one of the largest capoeira organizations in the world, with over 40,000 members across more than 50 countries on five continents. Camisa established the Centro Educacional Mestre Bimba (CEMB) in Itaboraí, Rio de Janeiro—a training facility with sleeping quarters for 60 people and camping for 100 tents, honoring his mentor''s legacy.

Throughout his career, Camisa has composed numerous capoeira songs including "Cuidado Moço", "Laia Loio", and "Lavadeira". During the COVID-19 pandemic, he developed new berimbau rhythms for capoeira training—São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama, and Capopasso—expanding the musical vocabulary beyond the characteristic banguela already used within Abadá.

"Capoeira gave me the flexibility to overcome everyday difficulties," Camisa has said. He continues to lead Abadá-Capoeira from Rio de Janeiro, having lived for over a decade in the Mangueira samba school community. He has elevated two women to the rank of Mestranda, and his organization maintains social projects in disadvantaged communities throughout Brazil.',
  -- bio_pt
  E'José Tadeu Carneiro Cardoso, conhecido como Grão-Mestre Camisa, nasceu em 28 de outubro de 1955 na Fazenda Estiva, perto de Itapeipu, no município de Jacobina, Bahia. Era o mais novo de quatro irmãos que se tornariam capoeiristas, crescendo com nove irmãos na fazenda da família. Seu irmão mais velho, Edvaldo Carneiro e Silva, se tornaria o lendário Grão-Mestre Camisa Roxa, considerado o melhor aluno de Mestre Bimba.

Por volta dos sete anos, Camisa começou a aprender capoeira com seu irmão Camisa Roxa, que havia treinado com Mestre Bimba. "No começo me chamavam de Camisinha," Camisa recordou mais tarde, "porque eu era o caçula e tinha um irmão—Camisa Roxa—formado por Mestre Bimba." Por volta de 1963, Camisa Roxa começou a ensinar aos irmãos mais novos as lições que aprendia na academia de Bimba em Salvador. O treinamento atraía a juventude da vizinhança—irmãos, primos, até vaqueiros—e eles praticavam no terreiro da fazenda, no gramado, no curral, nas margens dos rios e até dentro d''água.

Aos 12 anos, Camisa mudou-se para Salvador para continuar seus estudos e ingressou diretamente na academia de Mestre Bimba. Sua evolução foi rápida: formou-se como aluno formado com apenas 14 anos em 1969. Seus companheiros de formatura foram Macarrão, Onça Negra e Torpedo; sua irmã Noemilde serviu como madrinha. A formatura foi uma grande celebração em Amaralina com histórias tradicionais contadas por Mestre Bimba, rituais, prova de fogo, demonstrações de cintura desprezada, jogos de benguela, partidas com capoeiristas renomados e antigos formados, e samba de roda até o amanhecer.

No início dos anos 1970, Camisa excursionou pelo Brasil com a companhia de dança folclórica Olodum Maré ao lado de seu irmão Camisa Roxa. No final de 1972, aos 16 anos, chegou ao Rio de Janeiro durante uma turnê. Quando sua mãe faleceu pouco depois, decidiu permanecer no Rio ao invés de retornar aos estudos em Salvador. Começou a ensinar capoeira em academias locais e a participar das rodas de fim de semana da cidade.

No Rio, Camisa juntou-se ao Grupo Senzala e rapidamente tornou-se figura de destaque entre seus mestres. Dava aulas na Associação dos Servidores Civis perto do Canecão e continuou desenvolvendo sua metodologia. Em 1977, apareceu no filme marco da capoeira "Cordão de Ouro", dirigido por Antonio Carlos da Fontoura, ao lado dos Mestres Nestor Capoeira, Leopoldina, Peixinho e outros.

Em 1984, Camisa organizou um grande evento no Circo Voador reunindo mestres baianos e capoeiristas brasileiros de todo o país—um momento decisivo na cena da capoeira carioca. Porém, em 1988, sentiu necessidade de uma nova estrutura. "Comecei a considerar a necessidade de desenhar uma estrutura formal para as aulas, elaborar um plano de ensino básico, criar um lugar para estudar e ensinar," explicou. Além da pedagogia, queria proporcionar apoio familiar aos praticantes que haviam deixado seus lares para se dedicar à capoeira.

Em 1988, Camisa fundou a Abadá-Capoeira (Associação Brasileira de Apoio e Desenvolvimento da Arte-Capoeira). Sua filha Tatiana sugeriu o nome, que habilmente abrevia a missão da organização. Baseando-se nos conceitos inovadores de Mestre Bimba, Camisa desenvolveu uma metodologia de ensino distintiva enfatizando eficiência técnica, mecânica corporal adequada e progressão estruturada.

A Abadá-Capoeira cresceu para se tornar uma das maiores organizações de capoeira do mundo, com mais de 40.000 membros em mais de 50 países nos cinco continentes. Camisa estabeleceu o Centro Educacional Mestre Bimba (CEMB) em Itaboraí, Rio de Janeiro—uma instalação de treinamento com dormitórios para 60 pessoas e área de camping para 100 barracas, honrando o legado de seu mentor.

Ao longo de sua carreira, Camisa compôs numerosas músicas de capoeira incluindo "Cuidado Moço", "Laia Loio" e "Lavadeira". Durante a pandemia de COVID-19, desenvolveu novos toques de berimbau para treinamento de capoeira—São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama e Capopasso—expandindo o vocabulário musical além da característica banguela já usada dentro da Abadá.

"A capoeira me deu flexibilidade para superar as dificuldades do dia a dia," disse Camisa. Ele continua liderando a Abadá-Capoeira do Rio de Janeiro, tendo vivido por mais de uma década na comunidade da escola de samba Mangueira. Elevou duas mulheres ao posto de Mestranda, e sua organização mantém projetos sociais em comunidades carentes por todo o Brasil.',
  -- achievements_en
  E'Founded Abadá-Capoeira (1988), one of the largest capoeira organizations in the world with 40,000+ members in 50+ countries; Graduated as aluno formado from Mestre Bimba''s academy at age 14 (1969); Fourth in family to graduate from Mestre Bimba''s capoeira course; Former leading figure in Grupo Senzala; Appeared in film "Cordão de Ouro" (1977); Established Centro Educacional Mestre Bimba (CEMB) in Itaboraí, Rio de Janeiro; Created new berimbau rhythms including São Bento da Abadá, Gingalopante, Jogo Cruzado; Composed capoeira songs including "Cuidado Moço", "Laia Loio", "Lavadeira"; Elevated two women to Mestranda rank; Organized landmark 1984 Circo Voador event; Developed structured teaching methodology based on Mestre Bimba''s concepts',
  -- achievements_pt
  E'Fundou a Abadá-Capoeira (1988), uma das maiores organizações de capoeira do mundo com 40.000+ membros em 50+ países; Formou-se como aluno formado da academia de Mestre Bimba aos 14 anos (1969); Quarto da família a se formar no curso de capoeira de Mestre Bimba; Ex-figura de destaque no Grupo Senzala; Apareceu no filme "Cordão de Ouro" (1977); Estabeleceu o Centro Educacional Mestre Bimba (CEMB) em Itaboraí, Rio de Janeiro; Criou novos toques de berimbau incluindo São Bento da Abadá, Gingalopante, Jogo Cruzado; Compôs músicas de capoeira incluindo "Cuidado Moço", "Laia Loio", "Lavadeira"; Elevou duas mulheres ao posto de Mestranda; Organizou evento marco no Circo Voador em 1984; Desenvolveu metodologia de ensino estruturada baseada nos conceitos de Mestre Bimba',
  -- notes_en
  E'BIRTH DATE (October 28, 1955, exact):
Most sources cite October 28, 1955. CapoeiraHistory says "1955" without day. Capoeira.online says "1956." Wikipedia and CapoeiraWiki say October 28, 1955. Using 1955 as majority.

NAME:
- "José Tadeu Carneiro Cardoso" - Wikipedia, CapoeiraWiki, most sources
- Some sources abbreviate to "José Tadeu Cardoso"
- Initially called "Camisinha" (diminutive), later "Camisa"

BIRTHPLACE:
- "Itapeipu, near Jacobina" - CapoeiraHistory
- "Jacobina, Bahia" - most sources
- "Fazenda Estiva" - family farm location (same as Camisa Roxa)

FAMILY (Carneiro capoeiristas from Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - eldest, b. 1944, Grão-Mestre
- Ermival - brother, aluno formado
- Pedrinho - brother, aluno formado
- José Tadeu (Camisa) - youngest brother, b. 1955, fourth to learn capoeira
- Noemilde - sister, madrinha at graduation (not documented as capoeirista)
- From "a family of five capoeiristas" - fifth person unidentified

TEACHERS:
- Camisa Roxa (brother, initial training, ~1962-1967, Fazenda Estiva)
- Mestre Bimba (primary, 1967-1969, Salvador)

TRAINING COMPANIONS AT BIMBA:
- Onça Negra, Macarrão, Torpedo (graduated together 1969)
- Pimentão, Nenel, Formiga, Demerval (contemporaries)
- Already graduated: Canhão, Alegria, Luís, Quebra Ferro, Malvadeza, Valdemar, Sarigue

GRADUATION (1969):
- Age 14, companions: Macarrão, Onça Negra, Torpedo
- Madrinha: sister Noemilde
- Location: Amaralina (Bimba''s academy neighborhood)
- Fourth family member to graduate from Bimba

CAREER TIMELINE:
- ~1962: Began learning from Camisa Roxa at Fazenda Estiva
- 1967: Moved to Salvador, joined Bimba''s academy (age 12)
- 1969: Graduated as aluno formado at age 14
- early 1970s: Toured Brazil with Olodum Maré
- late 1972: Arrived in Rio de Janeiro, age 16
- 1972-1988: Member of Grupo Senzala
- 1977: Appeared in film "Cordão de Ouro"
- 1984: Organized Circo Voador event
- 1988: Founded Abadá-Capoeira
- Lived 10+ years in Mangueira samba school community

MEDIA APPEARANCES:
- 1977: Film "Cordão de Ouro" (Antonio Carlos da Fontoura) - alongside Nestor Capoeira, Leopoldina, Peixinho
- 2018: CapoeiraHistory interviews and documentary work

GROUPS/ORGANIZATIONS:
- Olodum Maré (toured early 1970s with Camisa Roxa)
- Grupo Senzala (1972-1988)
- Abadá-Capoeira (founded 1988)

NEW RHYTHMS CREATED (pandemic period):
São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama, Capopasso

SONGS COMPOSED:
"Cuidado Moço", "Laia Loio", "Lavadeira"

SOCIAL PROJECTS:
- Centro Educacional Mestre Bimba (CEMB) in Itaboraí, RJ
- Social projects in disadvantaged communities',
  -- notes_pt
  E'DATA DE NASCIMENTO (28 de outubro de 1955, exata):
A maioria das fontes cita 28 de outubro de 1955. CapoeiraHistory diz "1955" sem dia. Capoeira.online diz "1956." Wikipedia e CapoeiraWiki dizem 28 de outubro de 1955. Usando 1955 como maioria.

NOME:
- "José Tadeu Carneiro Cardoso" - Wikipedia, CapoeiraWiki, maioria das fontes
- Algumas fontes abreviam para "José Tadeu Cardoso"
- Inicialmente chamado "Camisinha" (diminutivo), depois "Camisa"

LOCAL DE NASCIMENTO:
- "Itapeipu, perto de Jacobina" - CapoeiraHistory
- "Jacobina, Bahia" - maioria das fontes
- "Fazenda Estiva" - localização da fazenda familiar (mesmo que Camisa Roxa)

FAMÍLIA (capoeiristas Carneiro da Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - mais velho, n. 1944, Grão-Mestre
- Ermival - irmão, aluno formado
- Pedrinho - irmão, aluno formado
- José Tadeu (Camisa) - caçula dos irmãos, n. 1955, quarto a aprender capoeira
- Noemilde - irmã, madrinha na formatura (não documentada como capoeirista)
- De "uma família de cinco capoeiristas" - quinta pessoa não identificada

PROFESSORES:
- Camisa Roxa (irmão, treinamento inicial, ~1962-1967, Fazenda Estiva)
- Mestre Bimba (principal, 1967-1969, Salvador)

COMPANHEIROS DE TREINO COM BIMBA:
- Onça Negra, Macarrão, Torpedo (formaram juntos 1969)
- Pimentão, Nenel, Formiga, Demerval (contemporâneos)
- Já formados: Canhão, Alegria, Luís, Quebra Ferro, Malvadeza, Valdemar, Sarigue

FORMATURA (1969):
- Aos 14 anos, companheiros: Macarrão, Onça Negra, Torpedo
- Madrinha: irmã Noemilde
- Local: Amaralina (bairro da academia de Bimba)
- Quarto membro da família a formar com Bimba

CRONOLOGIA DA CARREIRA:
- ~1962: Começou a aprender com Camisa Roxa na Fazenda Estiva
- 1967: Mudou-se para Salvador, entrou na academia de Bimba (12 anos)
- 1969: Formou-se como aluno formado aos 14 anos
- início 1970s: Excursionou pelo Brasil com Olodum Maré
- final 1972: Chegou ao Rio de Janeiro, 16 anos
- 1972-1988: Membro do Grupo Senzala
- 1977: Apareceu no filme "Cordão de Ouro"
- 1984: Organizou evento no Circo Voador
- 1988: Fundou Abadá-Capoeira
- Viveu 10+ anos na comunidade da escola de samba Mangueira

APARIÇÕES NA MÍDIA:
- 1977: Filme "Cordão de Ouro" (Antonio Carlos da Fontoura) - ao lado de Nestor Capoeira, Leopoldina, Peixinho
- 2018: Entrevistas e trabalho documental CapoeiraHistory

GRUPOS/ORGANIZAÇÕES:
- Olodum Maré (excursionou início 1970s com Camisa Roxa)
- Grupo Senzala (1972-1988)
- Abadá-Capoeira (fundou 1988)

NOVOS TOQUES CRIADOS (período da pandemia):
São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama, Capopasso

MÚSICAS COMPOSTAS:
"Cuidado Moço", "Laia Loio", "Lavadeira"

PROJETOS SOCIAIS:
- Centro Educacional Mestre Bimba (CEMB) em Itaboraí, RJ
- Projetos sociais em comunidades carentes'
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

-- Source: entities/persons/carlos-senna.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Carlos Senna
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH DATE: October 28, 1931 - exact date confirmed by multiple
-- sources including ABCA, Velhos Mestres, and Capoeira News.
-- DEATH DATE: November 4, 2002 - age 71, confirmed by ABCA.
-- Also known as "Senna Preto" (Black Senna).
-- Founded the third capoeira school in history (Senavox, 1955).
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Carlos Senna',
  'Carlos Senna',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://velhosmestres.com/en/pastinha-1980',
    'https://www.abcapoeira.com/about/mestre-carlos-senna/',
    'https://www.capoeiranews.com.br/2015/07/mestre-senna-aluno-do-mestre-bimba.html'
  ]::text[],
  'regional'::genealogy.style,
  E'Mestre Carlos Senna trained directly under Mestre Bimba, completing his formatura in Capoeira Regional in 1950. He later developed what he called "Capoeira Estilizada" (Stylized Capoeira), maintaining the foundation of Regional while introducing innovations such as standardized white uniforms (abadá), the salve greeting ritual, and structured belt graduation systems. His approach emphasized capoeira as both martial art and sport, leading to his proposals that resulted in capoeira being recognized as Brazil''s national sport in 1972.',
  E'Mestre Carlos Senna treinou diretamente com Mestre Bimba, completando sua formatura na Capoeira Regional em 1950. Posteriormente desenvolveu o que chamou de "Capoeira Estilizada", mantendo a base da Regional enquanto introduzia inovações como uniformes brancos padronizados (abadá), o ritual de saudação salve e sistemas estruturados de graduação por cinturão. Sua abordagem enfatizava a capoeira como arte marcial e esporte, levando às suas propostas que resultaram no reconhecimento da capoeira como esporte nacional do Brasil em 1972.',
  1931,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  2002,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Carlos Senna was born on October 28, 1931, in Salvador, Bahia, Brazil. He was a reservist of the 1st category of the Salvador Air Base and earned a degree in accounting from Fundação Visconde de Cayrú. Beyond these credentials, he pursued knowledge in school psychology, sports medicine, physical education, business management, massage therapy, personnel psychology, and scientific programming.

In 1949, at eighteen years old, Senna began his capoeira journey under the direct instruction of Mestre Bimba at the Centro de Cultura Física Regional. He proved to be a dedicated student, completing his formatura (graduation) in Capoeira Regional in 1950. During this period he earned the nickname "Senna Preto" (Black Senna) among his fellow students.

On July 23, 1953, Senna had the privilege of being selected to perform in Mestre Bimba''s historic demonstration before President Getúlio Vargas at the Palácio da Aclamação in Salvador. This demonstration, during which Vargas declared capoeira "the only truly Brazilian sport," became a landmark moment in capoeira''s legitimization. The performing group included fellow students Clarindo, João Veloso, Lessa, Sena Branco, Rosalvo, Eduardo, Pedro, Mario, Demerval, Gusmão, and Indiano.

Having earned Mestre Bimba''s trust, Senna was appointed Technical Director of the Centro de Cultura Física Regional in 1954. However, he departed the following year to establish his own path.

On October 25, 1955, Senna founded the Centro de Pesquisa, Estudo e Instrução de Capoeira Senavox in central Salvador—the third capoeira school in history after Bimba''s and Pastinha''s academies. The name "Senavox" represented "the Voice of Senna," signaling his intention to develop an independent approach. This decision created tension between him and Mestre Bimba, with repercussions in the Capoeira Regional community.

At Senavox, Senna introduced several innovations that would influence capoeira practice worldwide. He researched and standardized the abadá—white clothing traditionally worn by carriage drivers, cargo loaders, and clothes collectors—as the official uniform for capoeiristas. He created the salve, a distinctive greeting where practitioners place their right palm over their heart while pronouncing the word "Salve." He also developed a structured system of classification and competition, including a belt graduation system using different colored cordões (cords).

Senna pioneered capoeira''s entry into elite social spaces. Through his initiative, capoeira classes were introduced at exclusive Bahian sports and social clubs including the Bahiano de Tênis and the Associação Atlética da Bahia. He brought capoeira instruction to schools and to the Colégio Militar de Salvador, helping transform the art form''s social perception from street fighting to respectable cultural practice.

He was the author of two proposals that led the Conselho Nacional de Desportos (National Sports Council) to proclaim capoeira as Brazil''s national sport in 1972—a significant milestone in the art''s official recognition.

In 1978, four years after Mestre Bimba''s death in Goiânia, Senna joined Mestre Itapoan and Dona Alice (Bimba''s widow) on a mission to retrieve Bimba''s remains. With support from the Municipality of Salvador, they successfully transferred the body of capoeira''s great innovator back to his home city.

In 1980, Senna published his first book, "Capoeira: arte marcial brasileira" (Capoeira: Brazilian Martial Art), as number 3 in the Caderno de Cultura collection, published by the Folklore Division of the Municipal Secretariat of Education and Culture of Salvador. He followed this with "Capoeira Percurso" (Capoeira Journey) in 1990, discussing the history and philosophy of capoeira with personal accounts of his own life in the art. He also established two capoeira journals for Senavox.

The same year, Senna founded the Associação Brasileira dos Professores de Capoeira (ABPC—Brazilian Association of Capoeira Teachers). In 1984, he was a principal mentor behind the founding of the Federação Baiana de Capoeira (FBC—Bahian Capoeira Federation), assuming the vice-presidency in its first administration.

He was a co-founder of the Instituto Brasileiro de Estudos de Capoeira (IBEC—Brazilian Institute for the Study of Capoeira), alongside fellow capoeiristas Arára, Itapoan, Acordeon, and Sacy.

In the competitive arena, Mestre Senna served as coach of the Bahia state team, winning two Brazilian championships. He organized two Bahian championships, three try-out tournaments to assemble the state team, and one Senavox Cup of Capoeira.

In a 1980 interview documented by Velhos Mestres, Senna—then 48 years old—expressed both dedication and frustration. His Senavox academy in central Salvador had approximately 30 students paying 400 cruzeiros for four weekly hours of instruction. He had spent over a decade writing to Brazilian presidents and ministers requesting government support for capoeira. "I''m already tired of saying that capoeira is a fight, it is to knock down the opponent," he stated, criticizing proposals from São Paulo and Rio de Janeiro that he felt diluted capoeira''s martial essence.

Mestre Carlos Senna passed away on November 4, 2002, at the age of 71. His legacy continues through his son, Mestre Yoji Senna (Yoji Macieira Valverde Senna), born April 6, 1963, who began capoeira in 1975 at the Colégio Militar de Salvador under his father''s guidance. Yoji became youth champion of Bahia in 1977, introduced capoeira to Argentina in the 1980s, and in 1992 founded the Afro-Brazilian Capoeira Association in Minneapolis, Minnesota—the first capoeira school in the Twin Cities.',
  -- bio_pt
  E'Carlos Senna nasceu em 28 de outubro de 1931, em Salvador, Bahia, Brasil. Era reservista de 1ª categoria da Base Aérea de Salvador e formado em contabilidade pela Fundação Visconde de Cayrú. Além dessas credenciais, buscou conhecimento em psicologia escolar, medicina esportiva, educação física, administração de empresas, massoterapia, psicologia de pessoal e programação científica.

Em 1949, aos dezoito anos, Senna iniciou sua jornada na capoeira sob instrução direta de Mestre Bimba no Centro de Cultura Física Regional. Mostrou-se aluno dedicado, completando sua formatura na Capoeira Regional em 1950. Nesse período ganhou o apelido "Senna Preto" entre seus colegas.

Em 23 de julho de 1953, Senna teve o privilégio de ser selecionado para participar da histórica demonstração de Mestre Bimba ao Presidente Getúlio Vargas no Palácio da Aclamação em Salvador. Esta demonstração, durante a qual Vargas declarou a capoeira "o único esporte verdadeiramente brasileiro," tornou-se um marco na legitimização da capoeira. O grupo incluía os colegas Clarindo, João Veloso, Lessa, Sena Branco, Rosalvo, Eduardo, Pedro, Mario, Demerval, Gusmão e Indiano.

Tendo conquistado a confiança de Mestre Bimba, Senna foi nomeado Diretor Técnico do Centro de Cultura Física Regional em 1954. Porém, partiu no ano seguinte para estabelecer seu próprio caminho.

Em 25 de outubro de 1955, Senna fundou o Centro de Pesquisa, Estudo e Instrução de Capoeira Senavox no centro de Salvador—a terceira escola de capoeira da história após as academias de Bimba e Pastinha. O nome "Senavox" representava "a Voz de Senna," sinalizando sua intenção de desenvolver uma abordagem independente. Esta decisão criou tensão entre ele e Mestre Bimba, com repercussões na comunidade da Capoeira Regional.

Na Senavox, Senna introduziu várias inovações que influenciariam a prática da capoeira mundialmente. Pesquisou e padronizou o abadá—roupa branca tradicionalmente usada por cocheiros, carregadores e catadores de roupas—como uniforme oficial para capoeiristas. Criou o salve, uma saudação distintiva onde os praticantes colocam a palma direita sobre o coração enquanto pronunciam a palavra "Salve." Também desenvolveu um sistema estruturado de classificação e competição, incluindo um sistema de graduação por cinturão usando cordões de diferentes cores.

Senna foi pioneiro na entrada da capoeira em espaços sociais de elite. Por sua iniciativa, aulas de capoeira foram introduzidas em clubes esportivos e sociais exclusivos da Bahia incluindo o Bahiano de Tênis e a Associação Atlética da Bahia. Levou o ensino de capoeira às escolas e ao Colégio Militar de Salvador, ajudando a transformar a percepção social da arte de briga de rua para prática cultural respeitável.

Foi autor de duas propostas que levaram o Conselho Nacional de Desportos a proclamar a capoeira como esporte nacional do Brasil em 1972—um marco significativo no reconhecimento oficial da arte.

Em 1978, quatro anos após a morte de Mestre Bimba em Goiânia, Senna juntou-se a Mestre Itapoan e Dona Alice (viúva de Bimba) em uma missão para resgatar os restos mortais de Bimba. Com apoio da Prefeitura Municipal de Salvador, conseguiram transferir o corpo do grande inovador da capoeira de volta à sua cidade natal.

Em 1980, Senna publicou seu primeiro livro, "Capoeira: arte marcial brasileira," como número 3 na coleção Caderno de Cultura, publicado pela Divisão de Folclore da Secretaria Municipal de Educação e Cultura de Salvador. Seguiu com "Capoeira Percurso" em 1990, discutindo a história e filosofia da capoeira com relatos pessoais de sua própria vida na arte. Também estabeleceu duas revistas de capoeira para a Senavox.

No mesmo ano, Senna fundou a Associação Brasileira dos Professores de Capoeira (ABPC). Em 1984, foi mentor principal da fundação da Federação Baiana de Capoeira (FBC), assumindo a vice-presidência na primeira gestão.

Foi cofundador do Instituto Brasileiro de Estudos de Capoeira (IBEC), junto com os capoeiristas Arára, Itapoan, Acordeon e Sacy.

Na arena competitiva, Mestre Senna atuou como técnico da seleção baiana, conquistando dois campeonatos brasileiros. Organizou dois campeonatos baianos, três torneios seletivos para montar a seleção estadual e uma Taça Senavox de Capoeira.

Em entrevista de 1980 documentada pelo Velhos Mestres, Senna—então com 48 anos—expressou dedicação e frustração. Sua academia Senavox no centro de Salvador tinha aproximadamente 30 alunos pagando 400 cruzeiros por quatro horas semanais de instrução. Havia passado mais de uma década escrevendo para presidentes e ministros brasileiros solicitando apoio governamental para a capoeira. "Já estou cansado de dizer que a capoeira é luta, é derrubar o adversário," declarou, criticando propostas de São Paulo e Rio de Janeiro que ele sentia diluírem a essência marcial da capoeira.

Mestre Carlos Senna faleceu em 4 de novembro de 2002, aos 71 anos. Seu legado continua através de seu filho, Mestre Yoji Senna (Yoji Macieira Valverde Senna), nascido em 6 de abril de 1963, que iniciou a capoeira em 1975 no Colégio Militar de Salvador sob orientação do pai. Yoji tornou-se campeão juvenil da Bahia em 1977, introduziu a capoeira na Argentina nos anos 1980, e em 1992 fundou a Afro-Brazilian Capoeira Association em Minneapolis, Minnesota—a primeira escola de capoeira nas Twin Cities.',
  -- achievements_en
  E'Participated in historic 1953 demonstration before President Getúlio Vargas; Technical Director of Mestre Bimba''s academy (1954); Founded Senavox—third capoeira school in history (1955); Introduced the abadá uniform to capoeira; Created the salve greeting ritual; Developed structured belt graduation system; Author of proposals leading to capoeira''s recognition as Brazil''s national sport (1972); Co-founder of IBEC (Instituto Brasileiro de Estudos de Capoeira); Founder of ABPC (Associação Brasileira dos Professores de Capoeira, 1980); Vice-president of Federação Baiana de Capoeira (1984); Two-time Brazilian champion as state team coach; Published "Capoeira: arte marcial brasileira" (1980) and "Capoeira Percurso" (1990); Helped transfer Mestre Bimba''s remains to Salvador (1978)',
  -- achievements_pt
  E'Participou da histórica demonstração de 1953 para o Presidente Getúlio Vargas; Diretor Técnico da academia de Mestre Bimba (1954); Fundou a Senavox—terceira escola de capoeira da história (1955); Introduziu o uniforme abadá na capoeira; Criou o ritual de saudação salve; Desenvolveu sistema estruturado de graduação por cinturão; Autor de propostas que levaram ao reconhecimento da capoeira como esporte nacional do Brasil (1972); Cofundador do IBEC (Instituto Brasileiro de Estudos de Capoeira); Fundador da ABPC (Associação Brasileira dos Professores de Capoeira, 1980); Vice-presidente da Federação Baiana de Capoeira (1984); Bicampeão brasileiro como técnico da seleção estadual; Publicou "Capoeira: arte marcial brasileira" (1980) e "Capoeira Percurso" (1990); Ajudou a transferir os restos mortais de Mestre Bimba para Salvador (1978)',
  -- notes_en
  E'BIRTH DATE: October 28, 1931 - exact date confirmed by ABCA website and Capoeira News.

DEATH DATE: November 4, 2002 - exact date confirmed by ABCA website. Age 71.

ALSO KNOWN AS: "Senna Preto" (Black Senna)

PROFESSIONAL BACKGROUND:
- Reservist 1st category, Salvador Air Base
- Degree in Accounting from Fundação Visconde de Cayrú
- Additional studies in: school psychology, sports medicine, physical education, business management, massage therapy, personnel psychology, scientific programming

TRAINING TIMELINE:
- 1949: Began training under Mestre Bimba (age 18)
- 1950: Formatura (graduation) in Capoeira Regional
- 1953: Selected for Getúlio Vargas demonstration (July 23)
- 1954: Appointed Technical Director of CCFR
- 1955: Founded Senavox (October 25)

1953 VARGAS DEMONSTRATION PARTICIPANTS:
- Clarindo, Carlos Senna, João Veloso, Lessa, Sena Branco, Rosalvo, Eduardo, Pedro, Mario, Demerval, Gusmão, Indiano

SENAVOX ACADEMY:
- Full name: Centro de Pesquisa, Estudo e Instrução de Capoeira Senavox
- Founded: October 25, 1955
- Location: Central Salvador (downtown)
- 25th anniversary: 1980 (per Velhos Mestres interview)
- Significance: Third capoeira school in history (after Bimba and Pastinha)

PUBLICATIONS:
1. "Capoeira: arte marcial brasileira" (1980) - Caderno de Cultura #3, Divisão de Folclore, Salvador
2. "Capoeira Percurso" (1990) - Senavox edition
3. Two capoeira journals for Senavox

ORGANIZATIONS:
- ABPC (Associação Brasileira dos Professores de Capoeira) - founder, 1980
- FBC (Federação Baiana de Capoeira) - vice-president, 1984
- IBEC (Instituto Brasileiro de Estudos de Capoeira) - co-founder with Arára, Itapoan, Acordeon, Sacy

INNOVATIONS ATTRIBUTED TO SENNA:
- Abadá uniform (white clothing for capoeiristas)
- Salve greeting (right palm on heart)
- Belt/cord graduation system
- Introduction of capoeira to elite clubs and military school

SON:
- Yoji Macieira Valverde Senna (Mestre Yoji Senna)
- Born: April 6, 1963, Salvador
- Began training 1975 at Colégio Militar de Salvador
- Youth champion of Bahia 1977
- Founded Afro-Brazilian Capoeira Association, Minneapolis (1992)
- Member of World Capoeira Federation Council of Masters

TRANSFER OF BIMBA''S REMAINS (1978):
- Joined Itapoan and Dona Alice
- Mission to retrieve Bimba''s remains from Goiânia
- Support from Municipality of Salvador
- Body transferred in July 1978

1980 INTERVIEW (Velhos Mestres):
- Age 48
- 30 students at Senavox
- 400 cruzeiros for 4 weekly hours
- Located above an aikido academy
- Spent over a decade writing to presidents/ministers for capoeira support
- Expressed pessimism about capoeira''s future without government intervention

COMPETITIVE ACHIEVEMENTS:
- Two-time Brazilian champion as Bahia state team coach
- Organized 2 Bahian championships
- Organized 3 try-out tournaments for state team
- Organized 1 Senavox Cup of Capoeira',
  -- notes_pt
  E'DATA DE NASCIMENTO: 28 de outubro de 1931 - data exata confirmada pelo site da ABCA e Capoeira News.

DATA DE FALECIMENTO: 4 de novembro de 2002 - data exata confirmada pelo site da ABCA. 71 anos.

TAMBÉM CONHECIDO COMO: "Senna Preto"

FORMAÇÃO PROFISSIONAL:
- Reservista 1ª categoria, Base Aérea de Salvador
- Formado em Contabilidade pela Fundação Visconde de Cayrú
- Estudos adicionais em: psicologia escolar, medicina esportiva, educação física, administração de empresas, massoterapia, psicologia de pessoal, programação científica

LINHA DO TEMPO DE TREINAMENTO:
- 1949: Início do treinamento com Mestre Bimba (18 anos)
- 1950: Formatura na Capoeira Regional
- 1953: Selecionado para demonstração a Getúlio Vargas (23 de julho)
- 1954: Nomeado Diretor Técnico do CCFR
- 1955: Fundou Senavox (25 de outubro)

PARTICIPANTES DA DEMONSTRAÇÃO A VARGAS (1953):
- Clarindo, Carlos Senna, João Veloso, Lessa, Sena Branco, Rosalvo, Eduardo, Pedro, Mario, Demerval, Gusmão, Indiano

ACADEMIA SENAVOX:
- Nome completo: Centro de Pesquisa, Estudo e Instrução de Capoeira Senavox
- Fundada: 25 de outubro de 1955
- Local: Centro de Salvador
- 25º aniversário: 1980 (conforme entrevista Velhos Mestres)
- Significado: Terceira escola de capoeira da história (após Bimba e Pastinha)

PUBLICAÇÕES:
1. "Capoeira: arte marcial brasileira" (1980) - Caderno de Cultura #3, Divisão de Folclore, Salvador
2. "Capoeira Percurso" (1990) - edição Senavox
3. Duas revistas de capoeira para Senavox

ORGANIZAÇÕES:
- ABPC (Associação Brasileira dos Professores de Capoeira) - fundador, 1980
- FBC (Federação Baiana de Capoeira) - vice-presidente, 1984
- IBEC (Instituto Brasileiro de Estudos de Capoeira) - cofundador com Arára, Itapoan, Acordeon, Sacy

INOVAÇÕES ATRIBUÍDAS A SENNA:
- Uniforme abadá (roupa branca para capoeiristas)
- Saudação salve (palma direita no coração)
- Sistema de graduação por cinturão/cordão
- Introdução da capoeira em clubes de elite e escola militar

FILHO:
- Yoji Macieira Valverde Senna (Mestre Yoji Senna)
- Nascimento: 6 de abril de 1963, Salvador
- Iniciou treinamento em 1975 no Colégio Militar de Salvador
- Campeão juvenil da Bahia 1977
- Fundou Afro-Brazilian Capoeira Association, Minneapolis (1992)
- Membro do Conselho de Mestres da World Capoeira Federation

TRANSLADO DOS RESTOS MORTAIS DE BIMBA (1978):
- Juntou-se a Itapoan e Dona Alice
- Missão para resgatar restos mortais de Bimba de Goiânia
- Apoio da Prefeitura Municipal de Salvador
- Corpo transferido em julho de 1978

ENTREVISTA DE 1980 (Velhos Mestres):
- 48 anos
- 30 alunos na Senavox
- 400 cruzeiros por 4 horas semanais
- Localizada acima de uma academia de aikido
- Passou mais de uma década escrevendo para presidentes/ministros por apoio à capoeira
- Expressou pessimismo sobre o futuro da capoeira sem intervenção governamental

CONQUISTAS COMPETITIVAS:
- Bicampeão brasileiro como técnico da seleção baiana
- Organizou 2 campeonatos baianos
- Organizou 3 torneios seletivos para seleção estadual
- Organizou 1 Taça Senavox de Capoeira'
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

-- Source: entities/persons/cisnando.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Cisnando
-- Generated: 2025-12-25
-- ============================================================
-- José Cisnando Lima was "A Pedra Fundamental" (The Foundation
-- Stone) of Capoeira Regional according to Mestre Decânio.
-- Medical student who connected Bimba to political power.
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
  'José Cisnando Lima',
  'Cisnando',
  NULL,
  NULL,
  ARRAY['https://capoeiradabahia.portalcapoeira.com/dr-jos-qcisnandoq-lima-a-pedra-fundamental-da-regional/', 'https://portalcapoeira.com/capoeira-da-bahia/dr-jose-qcisnandoq-lima-a-pedra-fundamental-da-regional/', 'https://www.capoeiranews.com.br/2015/06/sisnando-e-mestre-bimba.html']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Key architect of Capoeira Regional''s methodology alongside Mestre Bimba. As a university-educated medical student with prior martial arts training, Cisnando contributed academic pedagogy, nomenclature, and systematic structure to Bimba''s creation. Introduced elements from his jiu-jitsu training. Known for exceptional physical prowess—reportedly defeating three judo/karate students simultaneously in a challenge match.',
  E'Arquiteto principal da metodologia da Capoeira Regional ao lado de Mestre Bimba. Como estudante de medicina universitário com treinamento prévio em artes marciais, Cisnando contribuiu com pedagogia acadêmica, nomenclatura e estrutura sistemática para a criação de Bimba. Introduziu elementos de seu treinamento em jiu-jitsu. Conhecido por proeza física excepcional—supostamente derrotou três alunos de judô/karatê simultaneamente em uma luta de desafio.',
  -- Life dates
  1914,
  'exact'::genealogy.date_precision,
  'Crato, Ceará, Brazil',
  1984,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'José Cisnando Lima was born on October 9, 1914, at Sítio Santa Rosa in Crato, Ceará—the sole survivor among five brothers, a testament to the harsh conditions of the sertão. By age fourteen, he was considered the strongest man in his city. He developed a passion for martial arts early, practicing jiu-jitsu before leaving Ceará, and dreamed of learning the legendary capoeira he had heard sung about in verse and prose.

In 1932, Cisnando traveled to Salvador to study medicine at the Faculdade de Medicina da Bahia. Upon arriving, he sought out the capoeira he had heard about—specifically the style where "the capoeirista faced another armed with a knife and still gained advantage." A cook at his pension directed him to a tall, strong Black man who worked as a charcoal worker in the Curuzú neighborhood of Liberdade.

That man was Manoel dos Reis Machado—Mestre Bimba.

When Cisnando approached Bimba requesting to learn, Bimba initially refused, declaring that capoeira was "for Black people, not white people." Undeterred, Cisnando insisted and eventually convinced Bimba to administer his famous entrance test: surviving three minutes in a powerful neck lock (gravata). Cisnando endured, and Bimba accepted him.

What followed was a transformative partnership. Bimba taught Cisnando the capoeira game; Cisnando taught Bimba academic nomenclature and systematic pedagogy. Together they formalized what Bimba had been developing since 1928—the sequências de ensino, cintura desprezada, the batizado ceremony, and the graduation system. Crucially, it was Cisnando who advised Bimba to call his style "Luta Regional Baiana" rather than capoeira, since capoeira remained illegal.

Cisnando also brought his martial arts background to bear. According to sources, he had trained in jiu-jitsu under Takeo Yano (and possibly Mitsuyo Maeda), as well as karate under Takamatsu (5th dan Shotokan, 2nd dan Kodokan), kendô, and bojitsu with Japanese colonists. His prowess was legendary—when he visited a judo/karate academy and challenged the master to fight three of his best students simultaneously, reportedly "the first had not risen when the third was knocked down."

But Cisnando''s most important contribution was political. During his time in Salvador, he had taken up residence in the neighborhood of Lieutenant Juracy Magalhães, Bahia''s state interventor (governor) under Getúlio Vargas. Cisnando became part of Juracy''s personal guard and developed a close friendship with him. As Mestre Decânio wrote, Juracy Magalhães was responsible for "the great social revolution that recognized African culture as legitimate in all its manifestations, especially capoeira and candomblé."

Cisnando arranged a private demonstration of Bimba''s capoeira for Juracy Magalhães. The demonstration "provoked the admiration, respect, and consideration of the highest state authority for Mestre Bimba and for Capoeira, opening the path for later demonstrations for President Getúlio Vargas." In 1937, Juracy authorized the operation of the "Clube de União em Apuros" in Roça do Lobo—effectively the first legally registered capoeira academy in the world. Through Cisnando, Bimba reached Juracy, who conducted them to Vargas, who legalized capoeira and recognized it as Brazil''s national martial art.

Cisnando graduated from medical school in 1937, the same year Bimba''s academy received official certification. He began practicing medicine in Santa Bárbara, Bahia, then returned to his native region in 1943, working in various southern Ceará cities before settling back in Bahia around 1950.

Beyond medicine, Cisnando served as a city councilman and interim mayor (presidente da câmara) in Feira de Santana, president of the rural workers'' syndicate, state agriculture physician, public security medical examiner, and school meal program supervisor. He founded two private psychiatric clinics and taught biology at multiple institutions.

Mestre Decânio called Cisnando "A Pedra Fundamental" (The Foundation Stone) of Capoeira Regional—a title that captures his essential role. Without Cisnando''s intellectual contributions, political connections, and martial arts knowledge, Bimba''s capoeira might never have transcended its marginalized origins to become the globally practiced art it is today.

José Cisnando Lima died on December 10, 1984, in Salvador, Bahia.',
  -- bio_pt
  E'José Cisnando Lima nasceu em 9 de outubro de 1914, no Sítio Santa Rosa em Crato, Ceará—o único sobrevivente entre cinco irmãos, testemunho das duras condições do sertão. Aos catorze anos, era considerado o homem mais forte de sua cidade. Desenvolveu paixão por artes marciais cedo, praticando jiu-jitsu antes de deixar o Ceará, e sonhava em aprender a lendária capoeira de que ouvira falar em verso e prosa.

Em 1932, Cisnando viajou para Salvador para estudar medicina na Faculdade de Medicina da Bahia. Ao chegar, buscou a capoeira de que ouvira falar—especificamente o estilo onde "o capoeirista enfrentava outro armado com faca e ainda levava vantagem." Uma cozinheira de sua pensão indicou-lhe um homem negro alto e forte que trabalhava como carvoeiro no bairro do Curuzú, na Liberdade.

Esse homem era Manoel dos Reis Machado—Mestre Bimba.

Quando Cisnando se aproximou de Bimba pedindo para aprender, Bimba inicialmente recusou, declarando que capoeira era "para gente preta, não para branco." Determinado, Cisnando insistiu e eventualmente convenceu Bimba a aplicar seu famoso teste de entrada: sobreviver três minutos em uma poderosa gravata no pescoço. Cisnando resistiu, e Bimba o aceitou.

O que se seguiu foi uma parceria transformadora. Bimba ensinou a Cisnando o jogo da capoeira; Cisnando ensinou a Bimba nomenclatura acadêmica e pedagogia sistemática. Juntos formalizaram o que Bimba vinha desenvolvendo desde 1928—as sequências de ensino, cintura desprezada, a cerimônia do batizado e o sistema de graduação. Crucialmente, foi Cisnando quem aconselhou Bimba a chamar seu estilo de "Luta Regional Baiana" em vez de capoeira, já que a capoeira ainda era ilegal.

Cisnando também trouxe sua bagagem em artes marciais. Segundo as fontes, ele havia treinado jiu-jitsu com Takeo Yano (e possivelmente Mitsuyo Maeda), além de karatê com Takamatsu (5º dan Shotokan, 2º dan Kodokan), kendô e bojitsu com colonos japoneses. Sua proeza era lendária—quando visitou uma academia de judô/karatê e desafiou o mestre a lutar contra três de seus melhores alunos simultaneamente, supostamente "o primeiro ainda não havia se levantado quando o terceiro foi derrubado."

Mas a contribuição mais importante de Cisnando foi política. Durante seu tempo em Salvador, ele havia se estabelecido no bairro do Tenente Juracy Magalhães, interventor do estado da Bahia sob Getúlio Vargas. Cisnando tornou-se parte da guarda pessoal de Juracy e desenvolveu estreita amizade com ele. Como Mestre Decânio escreveu, Juracy Magalhães foi responsável pela "grande revolução social que reconheceu a cultura africana como legítima em todas as suas manifestações, especialmente a capoeira e o candomblé."

Cisnando organizou uma demonstração privada da capoeira de Bimba para Juracy Magalhães. A demonstração "provocou a admiração, o respeito e a consideração da mais alta autoridade estadual para Mestre Bimba e para a Capoeira, abrindo o caminho para demonstrações posteriores para o Presidente Getúlio Vargas." Em 1937, Juracy autorizou o funcionamento do "Clube de União em Apuros" na Roça do Lobo—efetivamente a primeira academia de capoeira legalmente registrada no mundo. Através de Cisnando, Bimba chegou a Juracy, que os conduziu a Vargas, que legalizou a capoeira e a reconheceu como arte marcial nacional do Brasil.

Cisnando formou-se em medicina em 1937, no mesmo ano em que a academia de Bimba recebeu certificação oficial. Começou a praticar medicina em Santa Bárbara, Bahia, depois retornou à sua região natal em 1943, trabalhando em várias cidades do sul do Ceará antes de se estabelecer novamente na Bahia por volta de 1950.

Além da medicina, Cisnando serviu como vereador e prefeito interino (presidente da câmara) em Feira de Santana, presidente do sindicato dos trabalhadores rurais, médico da agricultura estadual, médico legista da segurança pública e supervisor do programa de merenda escolar. Fundou duas clínicas psiquiátricas particulares e ensinou biologia em múltiplas instituições.

Mestre Decânio chamou Cisnando de "A Pedra Fundamental" da Capoeira Regional—um título que captura seu papel essencial. Sem as contribuições intelectuais de Cisnando, suas conexões políticas e seu conhecimento em artes marciais, a capoeira de Bimba talvez nunca tivesse transcendido suas origens marginalizadas para se tornar a arte praticada globalmente que é hoje.

José Cisnando Lima morreu em 10 de dezembro de 1984, em Salvador, Bahia.',
  -- achievements_en
  E'Co-architect of Capoeira Regional methodology alongside Mestre Bimba; Key political connector who arranged demonstration for Governor Juracy Magalhães, leading to capoeira''s legalization; First white student of the elite class accepted by Mestre Bimba; Medical doctor (graduated 1937, Faculdade de Medicina da Bahia); City councilman and interim mayor (presidente da câmara) of Feira de Santana; Founder of two psychiatric clinics; Biology professor; Called "A Pedra Fundamental" (Foundation Stone) of Capoeira Regional by Mestre Decânio',
  -- achievements_pt
  E'Co-arquiteto da metodologia da Capoeira Regional ao lado de Mestre Bimba; Conector político chave que organizou demonstração para o Interventor Juracy Magalhães, levando à legalização da capoeira; Primeiro aluno branco da classe de elite aceito por Mestre Bimba; Médico (formado em 1937, Faculdade de Medicina da Bahia); Vereador e prefeito interino (presidente da câmara) de Feira de Santana; Fundador de duas clínicas psiquiátricas; Professor de biologia; Chamado de "A Pedra Fundamental" da Capoeira Regional por Mestre Decânio',
  -- notes_en
  E'BIRTH DATE (1914-10-09, exact):
October 9, 1914 - confirmed by capoeiradabahia.portalcapoeira.com article.

DEATH DATE (1984-12-10, exact):
December 10, 1984 - confirmed by capoeiranews.com.br article.

NAME VARIATION:
- "Cisnando" - most common
- "Sisnando" - alternative spelling found in some sources (capoeiranews.com.br)
- Full name: José Cisnando Lima

TEACHERS:
- Mestre Bimba (capoeira, ~1932-1937+) - primary capoeira teacher; met in Curuzú, Liberdade
- Takeo Yano (jiu-jitsu) - Japanese master active in Bahia/Pernambuco
- Takamatsu (karate, 5th dan Shotokan, 2nd dan Kodokan)
- Various Japanese colonists (kendô, bojitsu)

Note on Mitsuyo Maeda: Some sources (Wikipedia, CapoeiraWiki) mention training under Mitsuyo Maeda, but primary Portal Capoeira sources only mention Takeo Yano. Maeda was active in northern Brazil (Belém) and died in 1941, so direct training is possible but not confirmed.

TRAINING COMPANIONS AT BIMBA''S ACADEMY:
- Mestre Decânio (fellow academic, fellow "pillar" of Regional)
- Other early students of Bimba from 1930s

POLITICAL CONNECTIONS:
- Juracy Magalhães (Lt./Interventor of Bahia) - close friend, member of personal guard
- Getúlio Vargas (President of Brazil) - introduced through Juracy

CAREER TIMELINE:
- 1932: Enrolled in Faculdade de Medicina da Bahia
- 1932-1937: Met Bimba, began training, co-developed Regional methodology
- 1937: Graduated medical school; Bimba''s academy officially certified
- 1937-1943: Practiced medicine in Santa Bárbara, Bahia
- 1943-1950: Practiced medicine in southern Ceará cities
- 1950+: Returned to Bahia (Santa Bárbara area)
- Various positions: Feira de Santana councilman, chamber president, syndicate president, state physician, medical examiner, school meals supervisor
- Founded two psychiatric clinics
- Taught biology at multiple institutions

CHALLENGE MATCH ANECDOTE:
Visited a judo/karate academy, challenged the master to fight three of his best students simultaneously, and reportedly won—"the first had not risen when the third was knocked down."

HISTORICAL SIGNIFICANCE:
Called "A Pedra Fundamental" (Foundation Stone) by Mestre Decânio. Along with Decânio himself, Cisnando formed one of the two intellectual "pillars" upon which Bimba built Capoeira Regional during the Initial Phase (1930-1937) and Consolidation Phase (1938-1966).

MEDIA APPEARANCES:
- None documented

GRAVATA TEST:
Survived Bimba''s famous entrance test - enduring three minutes in a powerful neck lock (gravata). After Cisnando''s admission, Bimba changed the test to flexibility demonstration and written examination.',
  -- notes_pt
  E'DATA DE NASCIMENTO (1914-10-09, exata):
9 de outubro de 1914 - confirmado pelo artigo capoeiradabahia.portalcapoeira.com.

DATA DE FALECIMENTO (1984-12-10, exata):
10 de dezembro de 1984 - confirmado pelo artigo capoeiranews.com.br.

VARIAÇÃO DE NOME:
- "Cisnando" - mais comum
- "Sisnando" - grafia alternativa encontrada em algumas fontes (capoeiranews.com.br)
- Nome completo: José Cisnando Lima

PROFESSORES:
- Mestre Bimba (capoeira, ~1932-1937+) - professor principal de capoeira; encontraram-se no Curuzú, Liberdade
- Takeo Yano (jiu-jitsu) - mestre japonês ativo na Bahia/Pernambuco
- Takamatsu (karatê, 5º dan Shotokan, 2º dan Kodokan)
- Vários colonos japoneses (kendô, bojitsu)

Nota sobre Mitsuyo Maeda: Algumas fontes (Wikipedia, CapoeiraWiki) mencionam treinamento com Mitsuyo Maeda, mas as fontes primárias do Portal Capoeira mencionam apenas Takeo Yano. Maeda era ativo no norte do Brasil (Belém) e morreu em 1941, então treinamento direto é possível mas não confirmado.

COMPANHEIROS DE TREINO NA ACADEMIA DE BIMBA:
- Mestre Decânio (colega acadêmico, colega "pilar" da Regional)
- Outros alunos iniciais de Bimba dos anos 1930

CONEXÕES POLÍTICAS:
- Juracy Magalhães (Ten./Interventor da Bahia) - amigo próximo, membro da guarda pessoal
- Getúlio Vargas (Presidente do Brasil) - apresentado através de Juracy

CRONOLOGIA DA CARREIRA:
- 1932: Matriculou-se na Faculdade de Medicina da Bahia
- 1932-1937: Conheceu Bimba, começou a treinar, co-desenvolveu a metodologia Regional
- 1937: Formou-se em medicina; academia de Bimba oficialmente certificada
- 1937-1943: Praticou medicina em Santa Bárbara, Bahia
- 1943-1950: Praticou medicina em cidades do sul do Ceará
- 1950+: Retornou à Bahia (região de Santa Bárbara)
- Várias posições: vereador de Feira de Santana, presidente da câmara, presidente de sindicato, médico estadual, médico legista, supervisor de merenda escolar
- Fundou duas clínicas psiquiátricas
- Ensinou biologia em múltiplas instituições

ANEDOTA DA LUTA DESAFIO:
Visitou uma academia de judô/karatê, desafiou o mestre a lutar contra três de seus melhores alunos simultaneamente, e supostamente venceu—"o primeiro ainda não havia se levantado quando o terceiro foi derrubado."

SIGNIFICADO HISTÓRICO:
Chamado de "A Pedra Fundamental" por Mestre Decânio. Junto com o próprio Decânio, Cisnando formou um dos dois "pilares" intelectuais sobre os quais Bimba construiu a Capoeira Regional durante a Fase Inicial (1930-1937) e Fase de Consolidação (1938-1966).

APARIÇÕES NA MÍDIA:
- Nenhuma documentada

TESTE DA GRAVATA:
Sobreviveu ao famoso teste de entrada de Bimba - suportando três minutos em uma poderosa gravata no pescoço. Após a admissão de Cisnando, Bimba mudou o teste para demonstração de flexibilidade e exame escrito.'
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

-- Source: entities/persons/damiao.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Damião
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1928, decade):
-- If Damião was 16-17 when he started at Bimba's academy in late 1945,
-- he was born around 1928-1929. Using 1928 as estimate with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Esdras Magalhães dos Santos',
  'Damião',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://celacc.eca.usp.br/sites/default/files/tcc/artigo_-_as_representacoes_sociais_sobre_a_capoeira_na_cidade_de_sao_jose_dos_campos_a_partir_da_fundacao_da_associacao_desportiva_e_cultural_besouro_manganga.pdf', 'https://www.lalaue.com/learn-capoeira/mestre-lobao/', 'https://capoeira-connection.com/capoeira/2011/10/life-lessons-from-mestre-bimba/']::text[],
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba in Capoeira Regional from late 1945, graduating as formado in 1947. Pioneer in spreading Capoeira Regional to São Paulo. His teachings preserved Bimba''s philosophy of constant alertness (maldade no corpo) and the ginga as a way of life (jogo do mar).',
  E'Treinou diretamente com Mestre Bimba na Capoeira Regional a partir do final de 1945, formando-se em 1947. Pioneiro na disseminação da Capoeira Regional em São Paulo. Seus ensinamentos preservaram a filosofia de Bimba de constante vigilância (maldade no corpo) e a ginga como estilo de vida (jogo do mar).',
  1928,
  'decade'::genealogy.date_precision,
  'Laranjeiras, Sergipe, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Esdras Magalhães dos Santos, known as Mestre Damião or "Tenente Esdras," was a pioneering figure who helped bring Capoeira Regional from Bahia to southeastern Brazil. Born in Laranjeiras, Sergipe, he was the son of a teacher mother and a Protestant pastor father. At age six, his family moved to Itabuna, Bahia, where he was raised.

Around 1945, at the age of 16-17, young Esdras traveled to Salvador to pursue his education. There he discovered Mestre Bimba''s academy and began training in Capoeira Regional Baiana near the end of 1945. He graduated as "formado" in 1947, receiving both a medal and diploma directly from Mestre Bimba.

Damião''s professional life was multifaceted. He became a Lieutenant (Tenente) in the Brazilian Air Force (Força Aérea Brasileira), a licensed lawyer, and a dedicated writer on capoeira history. He married Maria Fernandes from the Italian colony of Guaratinguetá.

In 1949, Damião organized the historic first trip of Mestre Bimba and eight of his best students to São Paulo for capoeira demonstrations at the Pacaembu gymnasium. These exhibitions, which later extended to Rio de Janeiro, planted the seeds for Capoeira Regional''s success in southeastern Brazil. The event was covered by newspapers including Folha de Sorocaba, which noted that Bimba''s system contained "forty-five techniques, of which twenty-two are deadly."

In 1950, Damião returned to São Paulo to take a specialist sergeant course at Campo de Marte with the Aeronáutica. During this period (September 1950 to May 1951), he taught capoeira to approximately fifty students at Kid Jofre''s academy—becoming very probably the first person to formally teach Capoeira Regional in a São Paulo academy.

Damião arrived in São José dos Campos in 1968. On May 16, 1971, he co-founded the Associação Desportiva e Cultural Capoeira Besouro Mangangá, the first capoeira academy in Vale do Paraíba, together with his son Esdras Filho (Mestre Esdras) and Everaldo Bispo de Souza (Mestre Lobão). The name "Besouro Mangangá" was chosen by Mestre Esdras after consulting both his father and Mestre Suassuna, chosen because Besouro Mangangá was also known as "Besouro Cordão de Ouro."

Damião documented nine essential life lessons learned from Mestre Bimba during their time together in São Paulo. These included:
1. Always maintain "maldade no corpo" (vigilance in one''s body)—even in unexpected places
2. Practice the looseness of "molejo" and walk continuously in the ginga swing, which Bimba called the "jogo do mar" (game of the sea)
3. Train defensive reflexes through constant jumping and rolling drills
4. Exercise caution in unfamiliar places; avoid sitting with back to the street; never pass under trees at night
5. During confrontation, maintain positioning allowing both attack and defense
6. Respond calmly and politely, appearing docile while remaining mentally prepared
7. The capoeirista remains "patient, polite, even docile" and fights only in legitimate self-defense
8. Proper attire: loose pants, leather shoes, shirt, sport jacket, tie, and silk handkerchief
9. The straight razor (navalha) could be carried in special circumstances

Damião recounted Bimba''s famous beach story illustrating how a capoeirista used cleverness against a larger aggressor, concluding with Bimba''s declaration: "Capoeira isn''t a martial art for the ring. It''s a street fight."

As a historian and writer, Damião made crucial contributions to preserving capoeira''s history. In 1996, he published "Conversando sobre a Capoeira..." (Talking About Capoeira), printed by Jac Gráfica e Editora Ltda. in São José dos Campos. In this work, he divided the history of Capoeira Regional into three phases: the Initial or Creation phase (1930-1937), the Consolidation phase (1938-1966), and the Propagation phase (1967-1973). He also wrote "A Verdadeira história da criação da luta regional Bahiana do Mestre Bimba" (The True History of the Creation of Mestre Bimba''s Bahian Regional Fight), published in 2002.

According to Damião, it was around 1930 that Bimba met a medical student from Ceará named Cisnando, who was knowledgeable in jiu-jitsu, boxing, and Greco-Roman wrestling. From this relationship, Damião wrote, the first agreements for the creation of Luta Regional Bahiana began to emerge.

Mestre Damião is now deceased. His legacy lives on through the Associação Besouro Mangangá, which after over 50 years continues to develop capoeira in São José dos Campos, São Luiz do Paraitinga, Caçapava, and internationally in Portugal, Sweden, and Japan.',
  -- bio_pt
  E'Esdras Magalhães dos Santos, conhecido como Mestre Damião ou "Tenente Esdras," foi uma figura pioneira que ajudou a trazer a Capoeira Regional da Bahia para o sudeste do Brasil. Nascido em Laranjeiras, Sergipe, era filho de uma mãe professora e um pai pastor protestante. Aos seis anos, sua família mudou-se para Itabuna, Bahia, onde foi criado.

Por volta de 1945, aos 16-17 anos, o jovem Esdras viajou para Salvador para continuar sua educação. Lá descobriu a academia do Mestre Bimba e começou a treinar Capoeira Regional Baiana no final de 1945. Formou-se em 1947, recebendo medalha e diploma diretamente do Mestre Bimba.

A vida profissional de Damião foi multifacetada. Tornou-se Tenente da Força Aérea Brasileira, advogado licenciado e dedicado escritor sobre a história da capoeira. Casou-se com Maria Fernandes, da colônia italiana de Guaratinguetá.

Em 1949, Damião organizou a histórica primeira viagem do Mestre Bimba e oito de seus melhores alunos a São Paulo para demonstrações de capoeira no ginásio do Pacaembu. Essas exibições, que depois se estenderam ao Rio de Janeiro, plantaram as sementes para o sucesso da Capoeira Regional no sudeste do Brasil. O evento foi coberto por jornais incluindo a Folha de Sorocaba, que notou que o sistema de Bimba continha "quarenta e cinco golpes, dos quais vinte e dois são mortais."

Em 1950, Damião retornou a São Paulo para fazer um curso de sargentos especialistas no Campo de Marte com a Aeronáutica. Durante este período (setembro de 1950 a maio de 1951), ele ensinou capoeira para aproximadamente cinquenta alunos na academia de Kid Jofre—tornando-se muito provavelmente a primeira pessoa a ensinar formalmente Capoeira Regional em uma academia de São Paulo.

Damião chegou a São José dos Campos em 1968. Em 16 de maio de 1971, co-fundou a Associação Desportiva e Cultural Capoeira Besouro Mangangá, a primeira academia de capoeira do Vale do Paraíba, junto com seu filho Esdras Filho (Mestre Esdras) e Everaldo Bispo de Souza (Mestre Lobão). O nome "Besouro Mangangá" foi escolhido por Mestre Esdras após consultar tanto seu pai quanto Mestre Suassuna, escolhido porque Besouro Mangangá também era conhecido como "Besouro Cordão de Ouro."

Damião documentou nove lições de vida essenciais aprendidas com Mestre Bimba durante seu tempo juntos em São Paulo. Estas incluíam:
1. Sempre manter "maldade no corpo" (vigilância no corpo)—mesmo em lugares inesperados
2. Praticar a malemolência do "molejo" e caminhar continuamente no balanço da ginga, que Bimba chamava de "jogo do mar"
3. Treinar reflexos defensivos através de exercícios constantes de saltos e rolamentos
4. Exercer cautela em lugares desconhecidos; evitar sentar de costas para a rua; nunca passar debaixo de árvores à noite
5. Durante confronto, manter posicionamento permitindo tanto ataque quanto defesa
6. Responder calma e educadamente, parecendo dócil enquanto permanece mentalmente preparado
7. O capoeirista permanece "paciente, educado, até mesmo dócil" e luta apenas em legítima defesa
8. Vestimenta adequada: calças largas, sapatos de couro, camisa, paletó esportivo, gravata e lenço de seda
9. A navalha poderia ser carregada em circunstâncias especiais

Damião relatou a famosa história de praia de Bimba ilustrando como um capoeirista usou astúcia contra um agressor maior, concluindo com a declaração de Bimba: "Capoeira não é arte marcial de ringue. É luta de rua."

Como historiador e escritor, Damião fez contribuições cruciais para preservar a história da capoeira. Em 1996, publicou "Conversando sobre a Capoeira...", impresso pela Jac Gráfica e Editora Ltda. em São José dos Campos. Nesta obra, dividiu a história da Capoeira Regional em três fases: a fase Inicial ou de Criação (1930-1937), a fase de Consolidação (1938-1966) e a fase de Propagação (1967-1973). Também escreveu "A Verdadeira história da criação da luta regional Bahiana do Mestre Bimba", publicado em 2002.

Segundo Damião, foi por volta de 1930 que Bimba conheceu um estudante de medicina do Ceará chamado Cisnando, que era versado em jiu-jitsu, boxe e luta greco-romana. Dessa relação, escreveu Damião, começaram a surgir os primeiros acordos para a criação da Luta Regional Bahiana.

Mestre Damião é falecido. Seu legado continua através da Associação Besouro Mangangá, que após mais de 50 anos continua desenvolvendo capoeira em São José dos Campos, São Luiz do Paraitinga, Caçapava e internacionalmente em Portugal, Suécia e Japão.',
  -- achievements_en
  E'Graduated formado under Mestre Bimba (1947); Organized Mestre Bimba''s first trip to São Paulo (1949); First to formally teach Capoeira Regional in São Paulo academy (1950-1951); Co-founded Associação Besouro Mangangá, first capoeira academy in Vale do Paraíba (1971); Author of "Conversando sobre a Capoeira..." (1996); Author of "A Verdadeira história da criação da luta regional Bahiana do Mestre Bimba" (2002); Pioneer of Capoeira Regional in southeastern Brazil; Lieutenant in Brazilian Air Force; Licensed lawyer',
  -- achievements_pt
  E'Formado pelo Mestre Bimba (1947); Organizou a primeira viagem do Mestre Bimba a São Paulo (1949); Primeiro a ensinar formalmente Capoeira Regional em academia de São Paulo (1950-1951); Co-fundou a Associação Besouro Mangangá, primeira academia de capoeira do Vale do Paraíba (1971); Autor de "Conversando sobre a Capoeira..." (1996); Autor de "A Verdadeira história da criação da luta regional Bahiana do Mestre Bimba" (2002); Pioneiro da Capoeira Regional no sudeste do Brasil; Tenente da Força Aérea Brasileira; Advogado licenciado',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (~1928, decade):
Sources indicate he was 16-17 years old when he started training at Bimba''s academy in late 1945. This places his birth around 1928-1929. Using 1928 with decade precision.

NAME VARIATIONS:
- "Tenente Esdras" (Lieutenant Esdras) - military title reference
- "Mestre Damião" - capoeira title
- "Esdras Magalhães dos Santos" - full legal name
- "Dr. Esdras M. Santos" - used in his book "Conversando sobre a Capoeira..."

TEACHERS:
- Mestre Bimba (Manoel dos Reis Machado) - primary teacher, late 1945-1947, Salvador

STUDENTS / GRADUATES:
- Mestre Esdras (Esdras Filho) - his son, began learning at age 7 in 1960 in Brasília
- Mestre Lobão (Everaldo Bispo de Souza) - co-founded Besouro Mangangá together
- ~50 students at Kid Jofre''s academy, São Paulo (1950-1951)

CO-FOUNDERS OF BESOURO MANGANGÁ:
- Mestre Damião (Esdras Magalhães dos Santos)
- Mestre Esdras (Esdras Filho) - his son
- Mestre Lobão (Everaldo Bispo de Souza)

FAMILY:
- Wife: Maria Fernandes (from Italian colony of Guaratinguetá)
- Son: Esdras Filho (Mestre Esdras), born ~1953, began capoeira 1960 in Brasília
- Father: Protestant pastor
- Mother: Teacher

MILITARY CAREER:
- Rank: Lieutenant (Tenente)
- Branch: Força Aérea Brasileira (Brazilian Air Force)
- 1950: Specialist sergeant course at Campo de Marte, São Paulo

PUBLICATIONS:
- 1996: "Conversando sobre a Capoeira..." (Jac Gráfica e Editora Ltda., São José dos Campos)
- 2002: "A Verdadeira história da criação da luta regional Bahiana do Mestre Bimba" (São José dos Campos)

TIMELINE:
- ~1928: Born in Laranjeiras, Sergipe
- ~1934: Moved to Itabuna, Bahia (age 6)
- late 1945: Started at Mestre Bimba''s academy (age 16-17)
- 1947: Graduated formado
- 1949: Organized Bimba''s first São Paulo trip
- Sep 1950 - May 1951: Taught at Kid Jofre''s academy, São Paulo
- 1960: Son Esdras Filho began learning capoeira in Brasília
- 1968: Arrived in São José dos Campos
- May 16, 1971: Co-founded Besouro Mangangá
- 1996: Published "Conversando sobre a Capoeira..."
- 2002: Published "A Verdadeira história da criação..."
- Deceased (date unknown)

DEATH:
Confirmed deceased per multiple sources including interview with Mestre Lobão. Exact date unknown.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (~1928, década):
Fontes indicam que ele tinha 16-17 anos quando começou a treinar na academia de Bimba no final de 1945. Isso coloca seu nascimento por volta de 1928-1929. Usando 1928 com precisão de década.

VARIAÇÕES DE NOME:
- "Tenente Esdras" - referência ao título militar
- "Mestre Damião" - título de capoeira
- "Esdras Magalhães dos Santos" - nome legal completo
- "Dr. Esdras M. Santos" - usado em seu livro "Conversando sobre a Capoeira..."

PROFESSORES:
- Mestre Bimba (Manoel dos Reis Machado) - professor principal, final de 1945-1947, Salvador

ALUNOS / FORMADOS:
- Mestre Esdras (Esdras Filho) - seu filho, começou a aprender aos 7 anos em 1960 em Brasília
- Mestre Lobão (Everaldo Bispo de Souza) - co-fundaram Besouro Mangangá juntos
- ~50 alunos na academia de Kid Jofre, São Paulo (1950-1951)

CO-FUNDADORES DO BESOURO MANGANGÁ:
- Mestre Damião (Esdras Magalhães dos Santos)
- Mestre Esdras (Esdras Filho) - seu filho
- Mestre Lobão (Everaldo Bispo de Souza)

FAMÍLIA:
- Esposa: Maria Fernandes (da colônia italiana de Guaratinguetá)
- Filho: Esdras Filho (Mestre Esdras), nascido ~1953, começou capoeira em 1960 em Brasília
- Pai: Pastor protestante
- Mãe: Professora

CARREIRA MILITAR:
- Patente: Tenente
- Ramo: Força Aérea Brasileira
- 1950: Curso de sargentos especialistas no Campo de Marte, São Paulo

PUBLICAÇÕES:
- 1996: "Conversando sobre a Capoeira..." (Jac Gráfica e Editora Ltda., São José dos Campos)
- 2002: "A Verdadeira história da criação da luta regional Bahiana do Mestre Bimba" (São José dos Campos)

LINHA DO TEMPO:
- ~1928: Nasceu em Laranjeiras, Sergipe
- ~1934: Mudou-se para Itabuna, Bahia (6 anos)
- final de 1945: Começou na academia do Mestre Bimba (16-17 anos)
- 1947: Formado
- 1949: Organizou primeira viagem de Bimba a São Paulo
- Set 1950 - Mai 1951: Ensinou na academia de Kid Jofre, São Paulo
- 1960: Filho Esdras Filho começou a aprender capoeira em Brasília
- 1968: Chegou a São José dos Campos
- 16 de maio de 1971: Co-fundou Besouro Mangangá
- 1996: Publicou "Conversando sobre a Capoeira..."
- 2002: Publicou "A Verdadeira história da criação..."
- Falecido (data desconhecida)

MORTE:
Confirmado falecido por múltiplas fontes incluindo entrevista com Mestre Lobão. Data exata desconhecida.'
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

-- Source: entities/persons/edinho.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Edinho
-- Generated: 2025-12-25
-- ============================================================
-- LIMITED INFORMATION: Mestre Edinho is one of only four students
-- formally graduated to mestre level (white handkerchief) by Mestre
-- Bimba during his lifetime. The others were Decânio, Jair Moura,
-- and Miranda. Both Edinho and Miranda are confirmed deceased
-- (before Bimba's death in 1974).
--
-- Mestre Edinho himself is the source for the quote identifying
-- the four white handkerchief recipients: "os únicos a receberem
-- o título de Mestre da Regional Baiana pelas próprias mãos de
-- Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho."
--
-- BIRTH YEAR ESTIMATION (1920, decade precision):
-- Edinho was a contemporary of Decânio (born 1923) and Miranda
-- (estimated 1920s). To achieve mestre status required 15-20+ years
-- of training. He died before Bimba (1974). If he started training
-- in his teens/20s like Decânio and trained long enough to receive
-- the highest honor, he was likely born in the 1920s. Using 1920
-- as a conservative estimate with decade precision.
--
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
  NULL,
  'Edinho',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['http://www.cativeiro.de/?page_id=39&lang=en', 'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/contramestre-e-nao-mestrandomestrando-em-capoeira/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba and received the highest honor in Capoeira Regional: the white handkerchief (lenço branco) signifying mestre status. One of only four students to receive this distinction from Bimba during his lifetime. Edinho himself is the source for the authoritative statement identifying all four recipients.',
  E'Treinou diretamente com Mestre Bimba e recebeu a maior honra da Capoeira Regional: o lenço branco significando o status de mestre. Um dos apenas quatro alunos a receber esta distinção de Bimba durante sua vida. O próprio Edinho é a fonte da declaração que identifica todos os quatro destinatários.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Edinho holds a unique place in Capoeira Regional history as both one of its most honored practitioners and its primary witness to that honor. He was one of only four students to receive the white handkerchief (lenço branco) directly from Mestre Bimba during the founder''s lifetime—the highest distinction in Bimba''s graduation system.

According to Mestre Edinho himself: "Os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (The only ones to receive the title of Master of Regional Baiana directly from Mestre Bimba''s own hands were Jair Moura, Miranda, Decânio, and Edinho himself). This statement, preserved in Portal Capoeira, serves as the authoritative source for identifying all four white handkerchief recipients.

The white handkerchief represented the pinnacle of achievement in Capoeira Regional. The graduation system—using colored silk handkerchiefs—was an innovation by Mestre Bimba that honored the capoeiristas of the past, who supposedly wore such handkerchiefs around their necks since straight razors cannot cut silk. After the basic course (blue handkerchief), the specialization course (red), and advanced training including defense against armed opponents (yellow), only those who had dedicated many years to the art and demonstrated complete mastery received the white handkerchief.

As Mestre Itapoan noted in a lecture: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died." Those two deceased recipients were Edinho and Miranda, confirming that both died before Mestre Bimba''s own death in 1974.

Edinho trained at Bimba''s Centro de Cultura Física e Luta Regional in Salvador, Bahia. The academy, founded in 1932 and officially certified by the state education board in 1937, was the first formal capoeira institution in Brazil. To receive the white handkerchief required completing all eight teaching sequences (sequências), mastering the cintura desprezada (grappling techniques), passing the specialization courses including weapons defense, and demonstrating not just technical mastery but also ethical integrity—Bimba considered that capoeira practice should always be associated with educational objectives.

The limited documentation about Edinho stands in stark contrast to the substantial records about his fellow white handkerchief recipients Decânio and Jair Moura. While Decânio became a physician who wrote extensively about capoeira philosophy and Jair Moura became a prolific historian and filmmaker, Edinho''s legacy survives primarily through his authoritative testimony about the four mestres and his status as one of Bimba''s most accomplished students.

His legacy, though poorly documented compared to Decânio and Jair Moura, remains significant as the primary witness to one of the most important facts in Capoeira Regional history: the identity of Mestre Bimba''s four formally graduated mestres.',
  -- bio_pt
  E'Mestre Edinho ocupa um lugar único na história da Capoeira Regional como um de seus praticantes mais honrados e como testemunha primária dessa honra. Ele foi um dos apenas quatro alunos a receber o lenço branco diretamente de Mestre Bimba durante a vida do fundador—a maior distinção no sistema de graduação de Bimba.

Segundo o próprio Mestre Edinho: "Os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho." Esta declaração, preservada no Portal Capoeira, serve como fonte autoritativa para identificar todos os quatro destinatários do lenço branco.

O lenço branco representava o ápice da conquista na Capoeira Regional. O sistema de graduação—usando lenços de seda coloridos—foi uma inovação de Mestre Bimba que homenageava os capoeiristas do passado, que supostamente usavam tais lenços no pescoço já que navalhas não cortam seda. Após o curso básico (lenço azul), o curso de especialização (vermelho), e treinamento avançado incluindo defesa contra oponentes armados (amarelo), apenas aqueles que haviam dedicado muitos anos à arte e demonstrado maestria completa recebiam o lenço branco.

Como observou Mestre Itapoan em uma palestra: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram." Esses dois destinatários falecidos eram Edinho e Miranda, confirmando que ambos morreram antes da própria morte de Mestre Bimba em 1974.

Edinho treinou no Centro de Cultura Física e Luta Regional de Bimba em Salvador, Bahia. A academia, fundada em 1932 e oficialmente certificada pelo conselho estadual de educação em 1937, foi a primeira instituição formal de capoeira no Brasil. Para receber o lenço branco era necessário completar todas as oito sequências de ensino, dominar a cintura desprezada (técnicas de agarramento), passar nos cursos de especialização incluindo defesa contra armas, e demonstrar não apenas maestria técnica mas também integridade ética—Bimba considerava que a prática da capoeira deveria estar sempre associada a objetivos educacionais.

A documentação limitada sobre Edinho contrasta fortemente com os registros substanciais sobre seus colegas que receberam o lenço branco, Decânio e Jair Moura. Enquanto Decânio tornou-se médico e escreveu extensivamente sobre filosofia da capoeira e Jair Moura tornou-se historiador e cineasta prolífico, o legado de Edinho sobrevive principalmente através de seu testemunho autoritativo sobre os quatro mestres e seu status como um dos alunos mais realizados de Bimba.

Seu legado, embora pouco documentado em comparação com Decânio e Jair Moura, permanece significativo como testemunha primária de um dos fatos mais importantes da história da Capoeira Regional: a identidade dos quatro mestres formalmente graduados por Mestre Bimba.',
  -- achievements_en
  E'One of only four students to receive the white handkerchief (mestre graduation) directly from Mestre Bimba; Completed full Capoeira Regional training under Bimba including sequências, cintura desprezada, and specialization courses; Primary source for identifying all four white handkerchief recipients',
  -- achievements_pt
  E'Um dos apenas quatro alunos a receber o lenço branco (graduação de mestre) diretamente de Mestre Bimba; Completou treinamento completo de Capoeira Regional sob Bimba incluindo sequências, cintura desprezada e cursos de especialização; Fonte primária para identificar todos os quatro destinatários do lenço branco',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Edinho was a contemporary of Decânio (born 1923) and Miranda (estimated 1920s) as all three received the white handkerchief from Bimba. To achieve mestre status required many years of dedicated training (typically 15-20+ years). He died before Bimba (1974), so he achieved mestre status by early 1970s at latest. If he started training in his teens/20s like Decânio and trained long enough to receive the highest honor, he was likely born in the 1920s. Using 1920 as conservative estimate with decade precision.

LIMITED DOCUMENTATION: Mestre Edinho is among the least documented of Bimba''s white handkerchief recipients, despite being the PRIMARY SOURCE for identifying all four recipients.

FULL NAME: Unknown. No civil name found in any source. The apelido "Edinho" is a common Brazilian diminutive (usually of Eduardo, Edson, Edinaldo, or similar).

DEATH: Confirmed deceased before Bimba (1974). According to Mestre Itapoan: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died." The two deceased are Edinho and Miranda.

TRAINING PERIOD: Unknown exact dates. Must have trained with Bimba at Centro de Cultura Física e Luta Regional in Salvador between 1932 (academy founding) and early 1970s.

THE FOUR WHITE HANDKERCHIEF RECIPIENTS:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - 1936-2020
3. Miranda (Ney Miranda) - deceased before 1974
4. Edinho - deceased before 1974

AUTHORITATIVE SOURCE STATEMENT:
Mestre Edinho confirmed: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira). This is the primary source for the four mestres list.

TRAINING COMPANIONS (known from the same era):
- Mestre Decânio (began 1938)
- Jair Moura (began late 1950s)
- Mestre Miranda
- Likely trained alongside many of Bimba''s famous students from the Consolidation Phase (1938-1966)

RESEARCH GAPS:
- No full civil name found
- No birth date or year found (estimate only)
- No specific death date found (only "before 1974")
- No photographs located
- No information about any students he may have trained
- No information about activities outside of Bimba''s academy
- No information about profession or background',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, década):
Edinho era contemporâneo de Decânio (nascido em 1923) e Miranda (estimado anos 1920), pois todos os três receberam o lenço branco de Bimba. Alcançar o status de mestre exigia muitos anos de treinamento dedicado (tipicamente 15-20+ anos). Ele morreu antes de Bimba (1974), então alcançou o status de mestre no máximo no início dos anos 1970. Se ele começou a treinar na adolescência/20 anos como Decânio e treinou tempo suficiente para receber a maior honra, provavelmente nasceu nos anos 1920. Usando 1920 como estimativa conservadora com precisão de década.

DOCUMENTAÇÃO LIMITADA: Mestre Edinho está entre os menos documentados dos destinatários do lenço branco de Bimba, apesar de ser a FONTE PRIMÁRIA para identificar todos os quatro destinatários.

NOME COMPLETO: Desconhecido. Nenhum nome civil encontrado em qualquer fonte. O apelido "Edinho" é um diminutivo brasileiro comum (geralmente de Eduardo, Edson, Edinaldo, ou similar).

MORTE: Confirmado falecido antes de Bimba (1974). Segundo Mestre Itapoan: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram." Os dois falecidos são Edinho e Miranda.

PERÍODO DE TREINAMENTO: Datas exatas desconhecidas. Deve ter treinado com Bimba no Centro de Cultura Física e Luta Regional em Salvador entre 1932 (fundação da academia) e início dos anos 1970.

OS QUATRO DESTINATÁRIOS DO LENÇO BRANCO:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - 1936-2020
3. Miranda (Ney Miranda) - falecido antes de 1974
4. Edinho - falecido antes de 1974

DECLARAÇÃO DA FONTE AUTORITATIVA:
Mestre Edinho confirmou: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira). Esta é a fonte primária para a lista dos quatro mestres.

COMPANHEIROS DE TREINAMENTO (conhecidos da mesma época):
- Mestre Decânio (iniciou 1938)
- Jair Moura (iniciou final dos anos 1950)
- Mestre Miranda
- Provavelmente treinou ao lado de muitos dos famosos alunos de Bimba da Fase de Consolidação (1938-1966)

LACUNAS NA PESQUISA:
- Nenhum nome civil completo encontrado
- Nenhuma data de nascimento encontrada (apenas estimativa)
- Nenhuma data específica de morte encontrada (apenas "antes de 1974")
- Nenhuma fotografia localizada
- Nenhuma informação sobre alunos que ele possa ter treinado
- Nenhuma informação sobre atividades fora da academia de Bimba
- Nenhuma informação sobre profissão ou antecedentes'
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

-- Source: entities/persons/ermival.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Ermival
-- Generated: 2025-12-25
-- ============================================================
-- Ermival Carneiro (full surname uncertain)
-- Brother of Camisa Roxa, Pedrinho, and José Tadeu (Mestre Camisa)
-- Born at Fazenda Estiva, Jacobina, Bahia
-- Aluno formado of Mestre Bimba's academy
-- ============================================================
-- BIRTH YEAR ESTIMATION (1946-1949, decade precision):
-- Camisa Roxa (eldest) born 1944. Mestre Camisa (youngest brother)
-- born 1955. Ermival is a younger brother of Camisa Roxa but
-- older than José Tadeu. Reasonable estimate: mid-to-late 1940s.
-- Using 1948 as midpoint with decade precision.
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
  NULL,
  'Ermival',
  'formado'::genealogy.title,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in Capoeira Regional under Mestre Bimba at his academy in Salvador. Graduated as aluno formado alongside his brothers Pedrinho and José Tadeu (Mestre Camisa).',
  E'Treinou Capoeira Regional com Mestre Bimba em sua academia em Salvador. Formou-se como aluno formado junto com seus irmãos Pedrinho e José Tadeu (Mestre Camisa).',
  -- Life dates
  1948,
  'decade'::genealogy.date_precision,
  'Fazenda Estiva, Jacobina, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Ermival was one of ten children born to the Carneiro family at Fazenda Estiva, a farm in the interior of Jacobina, Bahia. His eldest brother, Edvaldo Carneiro e Silva, would become the legendary Grão-Mestre Camisa Roxa, considered the best student of Mestre Bimba.

When Camisa Roxa''s father died around 1965, the twenty-one-year-old eldest brother became the family patriarch. He took on the responsibility of educating his younger siblings and providing for their welfare. Under his guidance and example, three of his brothers—Ermival, Pedrinho, and José Tadeu—followed him to Salvador to train capoeira with Mestre Bimba.

Like his older brother, Ermival joined Mestre Bimba''s academy in Salvador, likely in the mid-to-late 1960s. Along with Pedrinho and José Tadeu, he completed the rigorous training regimen and graduated as an aluno formado—a formally graduated student of the Academia de Mestre Bimba.

The Carneiro family of Jacobina represents one of the most significant capoeira dynasties of the 20th century. While Camisa Roxa became one of the pioneers who brought capoeira to Europe, and José Tadeu (Mestre Camisa) went on to found Abadá-Capoeira in 1988, Ermival''s role in this family tradition—though less publicly documented—was part of the foundation that made this family legacy possible.',
  -- bio_pt
  E'Ermival foi um dos dez filhos nascidos da família Carneiro na Fazenda Estiva, uma fazenda no interior de Jacobina, Bahia. Seu irmão mais velho, Edvaldo Carneiro e Silva, se tornaria o lendário Grão-Mestre Camisa Roxa, considerado o melhor aluno de Mestre Bimba.

Quando o pai de Camisa Roxa faleceu por volta de 1965, o irmão mais velho de vinte e um anos tornou-se o patriarca da família. Ele assumiu a responsabilidade de educar seus irmãos mais novos e prover seu bem-estar. Sob sua orientação e exemplo, três de seus irmãos—Ermival, Pedrinho e José Tadeu—o seguiram até Salvador para treinar capoeira com Mestre Bimba.

Como seu irmão mais velho, Ermival ingressou na academia de Mestre Bimba em Salvador, provavelmente em meados ou final dos anos 1960. Junto com Pedrinho e José Tadeu, ele completou o rigoroso regime de treinamento e formou-se como aluno formado—um aluno formalmente graduado da Academia de Mestre Bimba.

A família Carneiro de Jacobina representa uma das dinastias de capoeira mais significativas do século XX. Enquanto Camisa Roxa se tornou um dos pioneiros que levaram a capoeira para a Europa, e José Tadeu (Mestre Camisa) fundou a Abadá-Capoeira em 1988, o papel de Ermival nesta tradição familiar—embora menos documentado publicamente—foi parte da fundação que tornou este legado familiar possível.',
  -- achievements_en
  E'Graduated as aluno formado from Mestre Bimba''s academy in Salvador; Member of the Carneiro capoeira dynasty from Jacobina, Bahia',
  -- achievements_pt
  E'Formou-se como aluno formado da academia de Mestre Bimba em Salvador; Membro da dinastia de capoeira Carneiro de Jacobina, Bahia',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1948, decade):
Camisa Roxa (eldest brother) born January 7, 1944. Mestre Camisa (José Tadeu, youngest of the three brothers who trained with Bimba) born October 28, 1955. Ermival is described as a younger brother of Camisa Roxa who followed him to Bimba''s academy. Reasonable estimate places his birth in the mid-to-late 1940s. Using 1948 as midpoint with decade precision.

NAME:
Only "Ermival" documented in sources. Full name likely "Ermival Carneiro" following family pattern but not confirmed. Birth records from Jacobina could potentially confirm.

FAMILY (Carneiro capoeiristas from Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - eldest, b. 1944, became Grão-Mestre
- Ermival - younger brother, aluno formado
- Pedrinho - younger brother, aluno formado
- José Tadeu (Mestre Camisa) - youngest, b. 1955, founder of Abadá-Capoeira

TRAINING TIMELINE:
- Camisa Roxa entered Bimba''s academy 1962/1963
- Ermival followed after, likely mid-to-late 1960s
- All three younger brothers became alunos formados
- Mestre Camisa was "the fourth in the family to learn capoeira"

DEATH: Unknown. No documentation found.

TITLE: Listed as aluno formado (not mestre). No evidence found that he received mestre title.',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1948, década):
Camisa Roxa (irmão mais velho) nasceu 7 de janeiro de 1944. Mestre Camisa (José Tadeu, mais novo dos três irmãos que treinaram com Bimba) nasceu 28 de outubro de 1955. Ermival é descrito como irmão mais novo de Camisa Roxa que o seguiu até a academia de Bimba. Estimativa razoável coloca seu nascimento em meados ou final dos anos 1940. Usando 1948 como ponto médio com precisão de década.

NOME:
Apenas "Ermival" documentado nas fontes. Nome completo provavelmente "Ermival Carneiro" seguindo padrão familiar, mas não confirmado. Registros de nascimento de Jacobina poderiam potencialmente confirmar.

FAMÍLIA (capoeiristas Carneiro da Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - mais velho, n. 1944, tornou-se Grão-Mestre
- Ermival - irmão mais novo, aluno formado
- Pedrinho - irmão mais novo, aluno formado
- José Tadeu (Mestre Camisa) - caçula, n. 1955, fundador da Abadá-Capoeira

CRONOLOGIA DE TREINAMENTO:
- Camisa Roxa entrou na academia de Bimba 1962/1963
- Ermival seguiu depois, provavelmente meados ou final dos anos 1960
- Todos os três irmãos mais novos tornaram-se alunos formados
- Mestre Camisa foi "o quarto na família a aprender capoeira"

MORTE: Desconhecida. Nenhuma documentação encontrada.

TÍTULO: Listado como aluno formado (não mestre). Nenhuma evidência encontrada de que recebeu título de mestre.'
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

-- Source: entities/persons/formiga.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Formiga
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1960, decade precision):
-- - Graduated alongside brother Nenel in June 1967
-- - Nenel was born September 26, 1960, making him 6-7 at graduation
-- - Both described as "adolescentes" (teenagers) in 1974 at Bimba's funeral
-- - If Formiga was similar age to graduate together, born ~1960
-- - Different mothers (Nenel: Berenice; Formiga: Dona Nair), so not twins
-- Using 1960 with decade precision as reasonable estimate
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
  'Demerval dos Santos Machado',
  'Formiga',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/cidadania/os-herdeiros-de-mestre-bimba/', 'https://fundacaomestrebimba.org.br/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Authentic Capoeira Regional as taught by his father Mestre Bimba. One of only three of Bimba''s thirteen children to reach the highest level of mestre in Capoeira Regional.',
  E'Capoeira Regional autêntica conforme ensinada por seu pai Mestre Bimba. Um dos únicos três dos treze filhos de Bimba a alcançar o nível máximo de mestre na Capoeira Regional.',
  -- Life dates
  1960,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  2003,
  'year'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Demerval dos Santos Machado, known as Mestre Formiga ("The Ant"), was a son of Mestre Bimba, the legendary creator of Capoeira Regional, and Dona Nair. He was one of only three of Bimba''s thirteen children (seven sons and six daughters) to reach the highest level of mestre in Capoeira Regional—the others being his half-brother Mestre Nenel and their brother Mestre Luís.

As a child, Formiga trained at his father''s Centro de Cultura Física Regional in Salvador. In June 1967, he formally graduated alongside his half-brother Nenel, both receiving their formation from their father''s hands. Mestre Bimba famously required that all students prove they were either working or show their school report cards before training—a discipline that Formiga later recalled: "Para treinar com meu pai era preciso provar que estava trabalhando ou mostrar o boletim do colégio" ("To train with my father, you had to prove you were working or show your school report card").

In 1973, the Machado family relocated to Goiânia, Goiás, following false promises of opportunity from a former student. When Bimba''s health began to decline, the teenage Formiga and Nenel stepped up to continue their father''s classes in his place. On February 5, 1974, Mestre Bimba died from a stroke at the Hospital das Clínicas de Goiânia. At the funeral, the adolescent brothers Formiga and Nenel played capoeira as a final tribute to their father—a powerful moment that marked their transition from students to guardians of his legacy.

Beyond his skill as a capoeirista, Formiga worked as an electrician (eletricitário) and was active as a union organizer (sindicalista). He was a notable figure in discussions about capoeira, politically engaged, and brought a working-class perspective to the preservation of his father''s art.

Formiga was instrumental in establishing the Fundação Mestre Bimba (FUMEB), serving as one of its founding mentors alongside his brother Nenel. He represented the family at official ceremonies honoring his father, including when Bimba received the Tomé de Souza Medal from the Salvador City Council. On June 12, 1996, when the Federal University of Bahia posthumously awarded Bimba the title of Doutor Honoris Causa, Formiga co-wrote the speech with capoeira researcher Frede Abreu and represented the family at the ceremony.

Reflecting on his father''s final years in Goiânia, Formiga famously stated: "Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada"—"My father died of banzo (sadness), for not seeing capoeira respected." Banzo is a term of African origin describing a profound homesickness and despair, particularly associated with enslaved Africans. His use of this word captured both the depth of Bimba''s suffering and the historical memory that runs through capoeira.

Mestre Formiga passed away in 2003, leaving behind a legacy as one of the direct links to Mestre Bimba''s authentic Capoeira Regional methodology.',
  -- bio_pt
  E'Demerval dos Santos Machado, conhecido como Mestre Formiga, foi filho de Mestre Bimba, o lendário criador da Capoeira Regional, e Dona Nair. Ele foi um dos únicos três dos treze filhos de Bimba (sete homens e seis mulheres) a alcançar o nível máximo de mestre na Capoeira Regional—os outros sendo seu meio-irmão Mestre Nenel e seu irmão Mestre Luís.

Quando criança, Formiga treinava no Centro de Cultura Física Regional de seu pai em Salvador. Em junho de 1967, formou-se formalmente junto com seu meio-irmão Nenel, ambos recebendo sua formação das mãos de seu pai. Mestre Bimba exigia famosamente que todos os alunos provassem que estavam trabalhando ou mostrassem seus boletins escolares antes de treinar—uma disciplina que Formiga mais tarde recordou: "Para treinar com meu pai era preciso provar que estava trabalhando ou mostrar o boletim do colégio."

Em 1973, a família Machado mudou-se para Goiânia, Goiás, seguindo falsas promessas de oportunidade de um ex-aluno. Quando a saúde de Bimba começou a declinar, os adolescentes Formiga e Nenel assumiram para continuar as aulas de seu pai em seu lugar. Em 5 de fevereiro de 1974, Mestre Bimba morreu de um AVC no Hospital das Clínicas de Goiânia. No funeral, os irmãos adolescentes Formiga e Nenel jogaram capoeira como uma homenagem final ao pai—um momento marcante que marcou sua transição de alunos para guardiões de seu legado.

Além de sua habilidade como capoeirista, Formiga trabalhava como eletricitário e era ativo como sindicalista. Era uma personagem marcante nas discussões sobre a capoeira, politizado, e trazia uma perspectiva de classe trabalhadora para a preservação da arte de seu pai.

Formiga foi fundamental na criação da Fundação Mestre Bimba (FUMEB), servindo como um de seus mentores fundadores ao lado de seu irmão Nenel. Representou a família em cerimônias oficiais de homenagem a seu pai, incluindo quando Bimba recebeu a Medalha Tomé de Souza da Câmara Municipal de Salvador. Em 12 de junho de 1996, quando a Universidade Federal da Bahia postumamente concedeu a Bimba o título de Doutor Honoris Causa, Formiga escreveu o discurso em conjunto com o pesquisador de capoeira Frede Abreu e representou a família na cerimônia.

Refletindo sobre os últimos anos de seu pai em Goiânia, Formiga declarou famosamente: "Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada." Banzo é um termo de origem africana que descreve uma profunda saudade e desespero, particularmente associado aos africanos escravizados. Seu uso desta palavra capturou tanto a profundidade do sofrimento de Bimba quanto a memória histórica que percorre a capoeira.

Mestre Formiga faleceu em 2003, deixando um legado como um dos elos diretos com a metodologia autêntica da Capoeira Regional de Mestre Bimba.',
  -- achievements_en
  E'One of only three of Mestre Bimba''s thirteen children to reach mestre level in Capoeira Regional; Co-founder/mentor of Fundação Mestre Bimba (FUMEB) with brother Nenel; Co-wrote UFBA Honoris Causa ceremony speech with Frede Abreu (1996); Represented family at ceremonies for Tomé de Souza Medal and UFBA Honoris Causa; Continued Bimba''s teaching in Goiânia alongside Nenel after their father''s health declined (1973-1974); Played capoeira at Bimba''s funeral as tribute (1974)',
  -- achievements_pt
  E'Um dos únicos três dos treze filhos de Mestre Bimba a alcançar o nível de mestre na Capoeira Regional; Cofundador/mentor da Fundação Mestre Bimba (FUMEB) com o irmão Nenel; Coescreveu o discurso da cerimônia de Honoris Causa da UFBA com Frede Abreu (1996); Representou a família nas cerimônias da Medalha Tomé de Souza e Honoris Causa da UFBA; Continuou os ensinamentos de Bimba em Goiânia junto com Nenel após declínio da saúde do pai (1973-1974); Jogou capoeira no funeral de Bimba como homenagem (1974)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1960, decade precision):
- Graduated alongside half-brother Nenel in June 1967
- Nenel was born September 26, 1960, making him 6-7 years old at graduation
- Both described as "adolescentes" (teenagers) at Bimba''s funeral in February 1974
- At age 13, both attempted to continue their father''s work in Goiânia
- Different mothers (Nenel: Berenice da Conceição Nascimento; Formiga: Dona Nair)
- Using 1960 as estimate with decade precision

DEATH YEAR (2003, year precision):
- Multiple sources confirm death in 2003; no exact date found

FAMILY:
- Father: Mestre Bimba (Manoel dos Reis Machado)
- Mother: Dona Nair
- Half-brother: Mestre Nenel (Manoel Nascimento Machado) - different mother (Berenice)
- Brother: Mestre Luís (Luiz Lopes Machado, also called "Melodia") - same mother (Dona Nair); moved to Goiânia

THREE MESTRE CHILDREN OF BIMBA (of 13 total):
1. Mestre Nenel (Manoel Nascimento Machado)
2. Mestre Formiga (Demerval dos Santos Machado) - in memoriam
3. Mestre Luís (Luiz Lopes Machado / Melodia)

OCCUPATION:
- Eletricitário (electrician)
- Sindicalista (union activist/organizer)
- Capoeirista/Mestre de capoeira

GRADUATION: June 1967 at Centro de Cultura Física Regional, Salvador

TEACHING IN GOIÂNIA: 1973-1974, alongside Nenel, when Bimba''s health declined

BIMBA''S FUNERAL (February 5, 1974):
- Formiga and Nenel, both adolescents, played capoeira at the burial
- Cemitério Parque de Goiânia

FUMEB (Fundação Mestre Bimba):
- Co-founder/mentor alongside Nenel
- Frede Abreu created Projeto Capoerê under FUMEB (1994)

UFBA HONORIS CAUSA (June 12, 1996):
- Co-wrote speech with researcher Frede Abreu
- Represented family at ceremony

FAMOUS QUOTE:
"Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada"
("My father died of banzo (sadness), for not seeing capoeira respected")',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1960, precisão de década):
- Formou-se junto com o meio-irmão Nenel em junho de 1967
- Nenel nasceu em 26 de setembro de 1960, tendo 6-7 anos na formatura
- Ambos descritos como "adolescentes" no funeral de Bimba em fevereiro de 1974
- Aos 13 anos, ambos tentaram continuar o trabalho do pai em Goiânia
- Mães diferentes (Nenel: Berenice da Conceição Nascimento; Formiga: Dona Nair)
- Usando 1960 como estimativa com precisão de década

ANO DE MORTE (2003, precisão de ano):
- Múltiplas fontes confirmam morte em 2003; data exata não encontrada

FAMÍLIA:
- Pai: Mestre Bimba (Manoel dos Reis Machado)
- Mãe: Dona Nair
- Meio-irmão: Mestre Nenel (Manoel Nascimento Machado) - mãe diferente (Berenice)
- Irmão: Mestre Luís (Luiz Lopes Machado, também chamado "Melodia") - mesma mãe (Dona Nair); mudou-se para Goiânia

TRÊS FILHOS MESTRES DE BIMBA (de 13 no total):
1. Mestre Nenel (Manoel Nascimento Machado)
2. Mestre Formiga (Demerval dos Santos Machado) - in memoriam
3. Mestre Luís (Luiz Lopes Machado / Melodia)

OCUPAÇÃO:
- Eletricitário
- Sindicalista
- Capoeirista/Mestre de capoeira

FORMATURA: Junho de 1967 no Centro de Cultura Física Regional, Salvador

ENSINO EM GOIÂNIA: 1973-1974, junto com Nenel, quando a saúde de Bimba declinou

FUNERAL DE BIMBA (5 de fevereiro de 1974):
- Formiga e Nenel, ambos adolescentes, jogaram capoeira no enterro
- Cemitério Parque de Goiânia

FUMEB (Fundação Mestre Bimba):
- Cofundador/mentor junto com Nenel
- Frede Abreu criou o Projeto Capoerê sob a FUMEB (1994)

HONORIS CAUSA DA UFBA (12 de junho de 1996):
- Coescreveu o discurso com o pesquisador Frede Abreu
- Representou a família na cerimônia

CITAÇÃO FAMOSA:
"Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada"'
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

-- Source: entities/persons/franklin.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Franklin
-- Generated: 2025-12-25
-- ============================================================
-- LIMITED BIOGRAPHICAL DATA: Despite extensive research, very
-- little personal information is available about Mestre Franklin
-- beyond his role as co-founder of Grupo Luanda with Mestre
-- Ezequiel. His full name (Franklin Aleluia) comes from the
-- IPHAN capoeira registry.
--
-- BIRTH YEAR ESTIMATION (1940, decade):
-- Franklin was a student of Ezequiel (b. 1941) who co-founded
-- Grupo Luanda in 1964. If Franklin was an adult (18+) capable
-- of co-founding an organization in 1964, he was born before 1946.
-- As a student of Ezequiel (who was ~23 in 1964), Franklin was
-- likely a peer or slightly younger. Estimate: ~1940 (decade).
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
  'Franklin Aleluia',
  'Franklin',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeira.iphan.gov.br/grupo/infor/356']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Student of Mestre Ezequiel who helped establish the Regional tradition in Salvador through Grupo Luanda. Carried forward the lineage of Mestre Bimba through Ezequiel.',
  E'Aluno de Mestre Ezequiel que ajudou a estabelecer a tradição Regional em Salvador através do Grupo Luanda. Levou adiante a linhagem de Mestre Bimba através de Ezequiel.',
  -- Life dates
  1940,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Franklin, known fully as Franklin Aleluia, was an early student of Mestre Ezequiel who played a foundational role in establishing Grupo Luanda, one of the important Capoeira Regional groups of Salvador.

In 1964, Mestre Ezequiel, who was training at Mestre Bimba''s Centro de Cultura Física e Luta Regional, began teaching capoeira to friends who noticed his new physical agility. As the number of students grew, he founded Grupo Luanda together with his student Franklin. The group was formally registered as Grupo Folclórico Luanda in 1974.

Franklin''s role as co-founder alongside his teacher Ezequiel speaks to the collaborative nature of early Grupo Luanda. While Ezequiel provided the direct link to Mestre Bimba''s methodology and philosophy, Franklin helped establish the organizational structure that would allow the group to grow and persist.

Grupo Luanda''s headquarters were established in the Resgate neighborhood (Cabula region) of Salvador, near Ezequiel''s home. The name "Luanda"—the capital of Angola—was chosen to honor the ports from which enslaved Africans departed their homeland, while also carrying the meaning of "the junction of the moon and the earth" in Yoruba.

The group pursued Ezequiel''s foundational concept of "educação com base na capoeira" (education based on capoeira), using the art as a form of education for children and youth. After Ezequiel''s death in 1997, his students—including those formed in the lineage Franklin helped establish—continued Grupo Luanda and spread it internationally to Switzerland, France, Germany, Hawaii, and across the Americas.',
  -- bio_pt
  E'Mestre Franklin, conhecido plenamente como Franklin Aleluia, foi um dos primeiros alunos de Mestre Ezequiel que desempenhou um papel fundamental na fundação do Grupo Luanda, um dos importantes grupos de Capoeira Regional de Salvador.

Em 1964, Mestre Ezequiel, que treinava no Centro de Cultura Física e Luta Regional de Mestre Bimba, começou a ensinar capoeira para amigos que notaram sua nova agilidade física. À medida que o número de alunos crescia, fundou o Grupo Luanda junto com seu aluno Franklin. O grupo foi formalmente registrado como Grupo Folclórico Luanda em 1974.

O papel de Franklin como co-fundador ao lado de seu mestre Ezequiel evidencia a natureza colaborativa do início do Grupo Luanda. Enquanto Ezequiel fornecia a conexão direta com a metodologia e filosofia de Mestre Bimba, Franklin ajudou a estabelecer a estrutura organizacional que permitiria ao grupo crescer e persistir.

A sede do Grupo Luanda foi estabelecida no bairro do Resgate (região do Cabula) em Salvador, perto da casa de Ezequiel. O nome "Luanda"—capital de Angola—foi escolhido para homenagear os portos de onde os africanos escravizados partiram de sua terra natal, carregando também o significado de "a junção da lua e da terra" em iorubá.

O grupo perseguiu o conceito fundamental de Ezequiel de "educação com base na capoeira", usando a arte como forma de educação para crianças e jovens. Após a morte de Ezequiel em 1997, seus alunos—incluindo aqueles formados na linhagem que Franklin ajudou a estabelecer—continuaram o Grupo Luanda e o espalharam internacionalmente pela Suíça, França, Alemanha, Havaí e pelas Américas.',
  -- achievements_en
  E'Co-founded Grupo Luanda (1964) with Mestre Ezequiel in Salvador; Co-registered Grupo Folclórico Luanda as formal entity (1974)',
  -- achievements_pt
  E'Co-fundou o Grupo Luanda (1964) com Mestre Ezequiel em Salvador; Co-registrou o Grupo Folclórico Luanda como entidade formal (1974)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1940, decade):
Franklin was a student of Ezequiel (b. 1941) who co-founded Grupo Luanda in 1964. If Franklin was an adult (18+) capable of co-founding an organization in 1964, he was born before 1946. As a student of Ezequiel (who was ~23 in 1964), Franklin was likely a peer or slightly younger. Estimate: ~1940.

FULL NAME:
- "Franklin Aleluia" per IPHAN Capoeira Portal registry (capoeira.iphan.gov.br/grupo/infor/356)

LIMITED BIOGRAPHICAL DATA:
Despite extensive research across Tier 1 sources (Velhos Mestres, Wikipedia, Lalaue, Capoeira History), very limited personal information is available about Mestre Franklin beyond his role as co-founder of Grupo Luanda. No birth date, death date, birth place, or detailed personal history was found.

TEACHER:
- Mestre Ezequiel (Eziquiel Martins Marinho) - primary teacher; Franklin was among his first students

RELATIONSHIP TO GROUP:
- Co-founded Grupo Luanda (1964) with Mestre Ezequiel
- Co-registered formal entity as Grupo Folclórico Luanda (1974)

LINEAGE:
- Mestre Bimba → Mestre Ezequiel → Mestre Franklin

SOURCES CONSULTED:
- IPHAN Capoeira Portal (capoeira.iphan.gov.br) - confirmed full name
- Velhos Mestres (velhosmestres.com/br/destaques-16) - mentions Franklin as co-founder
- Grupo Luanda Zürich website - mentions Franklin as Ezequiel''s student and co-founder
- Capoeira Paris, Lalaue, CapoeiraNews - mention Grupo Luanda but limited Franklin details',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1940, década):
Franklin foi aluno de Ezequiel (n. 1941) que co-fundou o Grupo Luanda em 1964. Se Franklin era adulto (18+) capaz de co-fundar uma organização em 1964, nasceu antes de 1946. Como aluno de Ezequiel (que tinha ~23 anos em 1964), Franklin provavelmente era contemporâneo ou um pouco mais jovem. Estimativa: ~1940.

NOME COMPLETO:
- "Franklin Aleluia" conforme registro do Portal da Capoeira do IPHAN (capoeira.iphan.gov.br/grupo/infor/356)

DADOS BIOGRÁFICOS LIMITADOS:
Apesar de pesquisa extensiva nas fontes Tier 1 (Velhos Mestres, Wikipedia, Lalaue, Capoeira History), informações pessoais muito limitadas estão disponíveis sobre Mestre Franklin além de seu papel como co-fundador do Grupo Luanda. Nenhuma data de nascimento, data de morte, local de nascimento ou história pessoal detalhada foi encontrada.

PROFESSOR:
- Mestre Ezequiel (Eziquiel Martins Marinho) - professor principal; Franklin estava entre seus primeiros alunos

RELAÇÃO COM O GRUPO:
- Co-fundou o Grupo Luanda (1964) com Mestre Ezequiel
- Co-registrou a entidade formal como Grupo Folclórico Luanda (1974)

LINHAGEM:
- Mestre Bimba → Mestre Ezequiel → Mestre Franklin

FONTES CONSULTADAS:
- Portal da Capoeira IPHAN (capoeira.iphan.gov.br) - confirmou nome completo
- Velhos Mestres (velhosmestres.com/br/destaques-16) - menciona Franklin como co-fundador
- Site do Grupo Luanda Zürich - menciona Franklin como aluno de Ezequiel e co-fundador
- Capoeira Paris, Lalaue, CapoeiraNews - mencionam Grupo Luanda mas detalhes limitados sobre Franklin'
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

-- Source: entities/persons/galo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Galo
-- Generated: 2025-12-25
-- ============================================================
-- Full Name: Luciano José Costa Figueiredo
-- Also known as: Galo
-- Style: Capoeira Regional
-- Training period with Mestre Bimba: 1960s (propagation phase 1967-1973)
-- Graduated lenço azul alongside Ezequiel at Mestre Bimba's academy
--
-- BIRTH YEAR ESTIMATION (1945, decade):
-- Galo graduated lenço azul alongside Ezequiel (b. 1941), suggesting similar age.
-- Academic records show Luciano José Costa Figueiredo with UFBA veterinary
-- degree (1971). If vet school typically starts at ~18 (5-6 year program),
-- graduation in 1971 suggests birth ~1947. As a contemporary of Ezequiel
-- (b. 1941), estimate: ~1945 (decade precision).
--
-- POSSIBLE PARALLEL CAREER:
-- An academic record shows Luciano José Costa Figueiredo with veterinary
-- medicine degree from UFBA (1971), Master's from UFMG (1974), and
-- Doctorate from Hannover, Germany (1983), later professor at UFBA.
-- The timeline (UFBA 1971) and location (Bahia) align with the capoeirista
-- Galo, suggesting this may be the same person pursuing an academic
-- career alongside capoeira. Requires further verification.
--
-- NOTE: DISTINCT from "Contramestre Galo" who founded Centro Cultural
-- Ie Galo Cantou Capoeira in the 1990s (different person, different era).
-- Also DISTINCT from "Mestre Galo" of Jundiaí who founded the first
-- capoeira academy in that city and trained Mestre Rã.
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
  'Luciano José Costa Figueiredo',
  'Galo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://books.scielo.org/id/p65hq/pdf/campos-9788523217273-22.pdf', 'https://repositorio.ufba.br/bitstream/ri/11005/2/Helio Campos Parte 2.pdf']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Formado student of Mestre Bimba who completed the course and earned the lenço azul (blue handkerchief). Described as "a great defender of Bahian Regional Capoeira." Trained during the propagation phase (1967-1973) of Capoeira Regional, a period when Bimba''s methodology was being consolidated and spread. Participated in cultural exchanges with Candomblé alongside fellow students Itapoan, Russo, Bolão, and Xaréu, visiting Mãe Alice''s terreiro at Alto da Santa Cruz.',
  E'Aluno formado de Mestre Bimba que completou o curso e conquistou o lenço azul. Descrito como "um grande defensor da Capoeira Regional baiana." Treinou durante a fase de propagação (1967-1973) da Capoeira Regional, período em que a metodologia de Bimba estava sendo consolidada e difundida. Participou de intercâmbios culturais com o Candomblé junto com colegas Itapoan, Russo, Bolão e Xaréu, visitando o terreiro de Mãe Alice no Alto da Santa Cruz.',
  -- Life dates
  1945,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Luciano José Costa Figueiredo, known as Mestre Galo, was one of Mestre Bimba''s distinguished students at the Centro de Cultura Física e Luta Regional in Salvador, Bahia. He trained during what historian Esdras M. Santos identified as the "propagation phase" (1967-1973) of Capoeira Regional—a period when Bimba''s methodology had been consolidated and was being disseminated through a growing network of formados.

Galo graduated with the lenço azul (blue handkerchief), the mark of a formado in Mestre Bimba''s graduation system, alongside Eziquiel Martins Marinho (Mestre Ezequiel). The two trained together at Bimba''s academy and earned their formado status in the same graduation ceremony. This parallel graduation created a lasting bond between them as training companions of the same era.

Galo was part of an inner circle of dedicated students who went beyond mere physical training to engage with the cultural and spiritual dimensions that Mestre Bimba considered essential to complete capoeira education. On one memorable occasion, Galo joined fellow students César (Itapoan), Eglon (Russo), José Valmório (Bolão), and Hélio (Xaréu) when Mestre Bimba invited them to visit the Candomblé terreiro of Mãe Alice—his later wife and a respected Ialorixá—at Alto da Santa Cruz in the Nordeste de Amaralina neighborhood.

The terreiro, called Oiá Padê da Riméia, was a small blue-indigo house in the style common to the Recôncavo region. Upon arrival, Mãe Alice received the young capoeiristas and gave them a "passe" (spiritual cleansing) and a "reza" (prayer). The experience left a profound impression on the students. As recorded by Hélio Campos (Mestre Xaréu), the visit was Mestre Bimba''s strategy to bring his students closer to the rituals of Afro-Bahian culture from which many of them had been separated by their formal education.

Sources describe Galo as "a great defender of Bahian Regional Capoeira," indicating his commitment to preserving the authentic methodology and philosophy that Mestre Bimba had developed. He was counted among the notable students who stood out during the propagation phase, listed alongside Boinha (Batista Sampaio), Xaréu (Hélio José B. Carneiro de Campos), Prego (Roberto Fernando Diez), Arara (Fernando Vasconcelos), Volta Grande (Jorge Valente), Macaco (Gilson Sacramento), and Canhão (Augusto Salvador Brito).

Intriguingly, academic records show a Luciano José Costa Figueiredo who earned a veterinary medicine degree from the Universidade Federal da Bahia in 1971, followed by a Master''s from UFMG in 1974 and a Doctorate from the Veterinary School in Hannover, Germany in 1983, later becoming a professor at UFBA. The timeline and geographic alignment (Bahia, 1960s-1970s) suggest this may be the same person, indicating that Mestre Galo pursued a distinguished academic career in veterinary medicine parallel to his capoeira activities—a pattern consistent with many of Bimba''s students who came from educated backgrounds.',
  -- bio_pt
  E'Luciano José Costa Figueiredo, conhecido como Mestre Galo, foi um dos alunos destacados de Mestre Bimba no Centro de Cultura Física e Luta Regional em Salvador, Bahia. Treinou durante o que o historiador Esdras M. Santos identificou como a "fase de propagação" (1967-1973) da Capoeira Regional—período em que a metodologia de Bimba havia sido consolidada e estava sendo disseminada através de uma rede crescente de formados.

Galo formou-se com o lenço azul, a marca de um formado no sistema de graduação de Mestre Bimba, ao lado de Eziquiel Martins Marinho (Mestre Ezequiel). Os dois treinaram juntos na academia de Bimba e conquistaram seu status de formado na mesma cerimônia de formatura. Esta graduação paralela criou um laço duradouro entre eles como companheiros de treino da mesma época.

Galo fazia parte de um círculo interno de alunos dedicados que foram além do mero treinamento físico para se envolver com as dimensões culturais e espirituais que Mestre Bimba considerava essenciais para uma educação completa em capoeira. Em uma ocasião memorável, Galo juntou-se aos colegas César (Itapoan), Eglon (Russo), José Valmório (Bolão) e Hélio (Xaréu) quando Mestre Bimba os convidou para visitar o terreiro de Candomblé de Mãe Alice—sua esposa posterior e uma respeitada Ialorixá—no Alto da Santa Cruz, no bairro do Nordeste de Amaralina.

O terreiro, chamado Oiá Padê da Riméia, era uma pequena casa azul-índigo no estilo comum à região do Recôncavo. Ao chegarem, Mãe Alice recebeu os jovens capoeiristas e lhes deu um "passe" (limpeza espiritual) e uma "reza". A experiência deixou uma impressão profunda nos alunos. Como registrado por Hélio Campos (Mestre Xaréu), a visita foi a estratégia de Mestre Bimba para aproximar seus alunos dos rituais da cultura afro-baiana dos quais muitos deles haviam sido afastados por sua educação formal.

Fontes descrevem Galo como "um grande defensor da Capoeira Regional baiana," indicando seu compromisso em preservar a metodologia e filosofia autênticas que Mestre Bimba havia desenvolvido. Ele foi contado entre os alunos notáveis que se destacaram durante a fase de propagação, listado ao lado de Boinha (Batista Sampaio), Xaréu (Hélio José B. Carneiro de Campos), Prego (Roberto Fernando Diez), Arara (Fernando Vasconcelos), Volta Grande (Jorge Valente), Macaco (Gilson Sacramento) e Canhão (Augusto Salvador Brito).

Curiosamente, registros acadêmicos mostram um Luciano José Costa Figueiredo que obteve diploma em medicina veterinária pela Universidade Federal da Bahia em 1971, seguido de Mestrado pela UFMG em 1974 e Doutorado pela Escola de Veterinária de Hannover, Alemanha em 1983, tornando-se depois professor da UFBA. A linha do tempo e o alinhamento geográfico (Bahia, 1960s-1970s) sugerem que pode ser a mesma pessoa, indicando que Mestre Galo seguiu uma carreira acadêmica distinta em medicina veterinária paralela às suas atividades na capoeira—um padrão consistente com muitos dos alunos de Bimba que vinham de formações educacionais privilegiadas.',
  -- achievements_en
  E'Graduated lenço azul (blue handkerchief) as formado at Mestre Bimba''s Centro de Cultura Física e Luta Regional; Trained during propagation phase of Capoeira Regional (1967-1973); Participated in Candomblé cultural exchange visit with Mestre Bimba and fellow students',
  -- achievements_pt
  E'Formou-se com lenço azul como formado no Centro de Cultura Física e Luta Regional de Mestre Bimba; Treinou durante a fase de propagação da Capoeira Regional (1967-1973); Participou de visita de intercâmbio cultural ao Candomblé com Mestre Bimba e colegas',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1945, decade):
Galo graduated lenço azul alongside Ezequiel (b. 1941), suggesting similar age. Academic records show Luciano José Costa Figueiredo with UFBA veterinary degree (1971). If vet school typically starts at ~18 (5-6 year program), graduation in 1971 suggests birth ~1947. As a contemporary of Ezequiel (b. 1941), estimate: ~1945 (decade precision).

CAPOEIRA REGIONAL PHASES (per Esdras M. Santos "Conversando sobre capoeira"):
- Initial/Creation Phase: 1930-1937
- Consolidation Phase: 1938-1966
- Propagation Phase: 1967-1973
Galo is listed among students in the Propagation Phase.

GRADUATION:
- Received lenço azul (blue handkerchief) = formado status
- Graduated alongside Eziquiel Martins Marinho (Mestre Ezequiel)
- Trained at Centro de Cultura Física e Luta Regional, Terreiro de Jesus, Salvador

TRAINING COMPANIONS (Candomblé visit):
- César (Itapoan) - Raimundo César Alves de Almeida
- Eglon (Russo)
- José Valmório (Bolão) - José Valmório de Lacerda
- Hélio (Xaréu) - Hélio José B. Carneiro de Campos

CANDOMBLÉ VISIT:
- Terreiro: Oiá Padê da Riméia
- Location: Alto da Santa Cruz, Nordeste de Amaralina, Salvador
- Leader: Mãe Alice (D. Alice, later wife of Mestre Bimba)
- Experience: Received "passe" (spiritual cleansing) and "reza" (prayer)

PROPAGATION PHASE NOTABLE STUDENTS (alongside Galo):
- Batista Sampaio (Boinha)
- Hélio José B. Carneiro de Campos (Xaréu)
- Roberto Fernando Diez (Prego)
- Fernando Vasconcelos (Arara)
- Jorge Valente (Volta Grande)
- Gilson Sacramento (Macaco)
- Augusto Salvador Brito (Canhão)

POSSIBLE ACADEMIC CAREER (requires verification):
If Luciano José Costa Figueiredo the capoeirista is the same as the veterinarian:
- UFBA Veterinary Medicine degree: 1971
- UFMG Master''s: 1974
- Hannover (Germany) Doctorate: 1983
- Later professor at UFBA
Source: Escavador.com profile (could not verify definitively)

DISAMBIGUATION:
- DISTINCT from "Contramestre Galo" (Centro Cultural Ie Galo Cantou Capoeira, 1990s, contemporânea style)
- DISTINCT from "Mestre Galo" of Jundiaí (trained Mestre Rã, first academy in Jundiaí)
Both are different individuals from different eras.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1945, década):
Galo formou-se com lenço azul ao lado de Ezequiel (n. 1941), sugerindo idade similar. Registros acadêmicos mostram Luciano José Costa Figueiredo com diploma de veterinária da UFBA (1971). Se a faculdade de veterinária tipicamente começa aos ~18 anos (programa de 5-6 anos), formatura em 1971 sugere nascimento ~1947. Como contemporâneo de Ezequiel (n. 1941), estimativa: ~1945 (precisão de década).

FASES DA CAPOEIRA REGIONAL (conforme Esdras M. Santos "Conversando sobre capoeira"):
- Fase Inicial/Criação: 1930-1937
- Fase de Consolidação: 1938-1966
- Fase de Propagação: 1967-1973
Galo está listado entre os alunos na Fase de Propagação.

FORMATURA:
- Recebeu lenço azul = status de formado
- Formou-se ao lado de Eziquiel Martins Marinho (Mestre Ezequiel)
- Treinou no Centro de Cultura Física e Luta Regional, Terreiro de Jesus, Salvador

COMPANHEIROS DE TREINO (visita ao Candomblé):
- César (Itapoan) - Raimundo César Alves de Almeida
- Eglon (Russo)
- José Valmório (Bolão) - José Valmório de Lacerda
- Hélio (Xaréu) - Hélio José B. Carneiro de Campos

VISITA AO CANDOMBLÉ:
- Terreiro: Oiá Padê da Riméia
- Local: Alto da Santa Cruz, Nordeste de Amaralina, Salvador
- Líder: Mãe Alice (D. Alice, esposa posterior de Mestre Bimba)
- Experiência: Recebeu "passe" (limpeza espiritual) e "reza"

ALUNOS NOTÁVEIS DA FASE DE PROPAGAÇÃO (ao lado de Galo):
- Batista Sampaio (Boinha)
- Hélio José B. Carneiro de Campos (Xaréu)
- Roberto Fernando Diez (Prego)
- Fernando Vasconcelos (Arara)
- Jorge Valente (Volta Grande)
- Gilson Sacramento (Macaco)
- Augusto Salvador Brito (Canhão)

POSSÍVEL CARREIRA ACADÊMICA (requer verificação):
Se Luciano José Costa Figueiredo o capoeirista é o mesmo que o veterinário:
- Diploma de Medicina Veterinária UFBA: 1971
- Mestrado UFMG: 1974
- Doutorado Hannover (Alemanha): 1983
- Depois professor da UFBA
Fonte: Perfil Escavador.com (não foi possível verificar definitivamente)

DESAMBIGUAÇÃO:
- DISTINTO de "Contramestre Galo" (Centro Cultural Ie Galo Cantou Capoeira, anos 1990, estilo contemporânea)
- DISTINTO de "Mestre Galo" de Jundiaí (treinou Mestre Rã, primeira academia em Jundiaí)
Ambos são indivíduos diferentes de épocas diferentes.'
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

-- Source: entities/persons/miranda.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Miranda
-- Generated: 2025-12-25
-- ============================================================
-- LIMITED INFORMATION: Mestre Miranda is one of only four students
-- formally graduated to mestre level (white handkerchief) by Mestre
-- Bimba during his lifetime. The others were Decânio, Jair Moura,
-- and Edinho. Both Miranda and Edinho are confirmed deceased.
--
-- The only documented name beyond the apelido is "Ney Miranda"
-- from CapoeiraHub's database.
--
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- Miranda was a contemporary of Decânio (born 1923). To achieve
-- mestre status required 15-20+ years of training. He died before
-- Bimba (1974). If he started training in his teens/20s like
-- Decânio, he was likely born in the 1920s.
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
  'Ney Miranda',
  'Miranda',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeirahub.net/mestres']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba and received the highest honor in Capoeira Regional: the white handkerchief (lenço branco) signifying mestre status. One of only four students to receive this distinction from Bimba during his lifetime.',
  E'Treinou diretamente com Mestre Bimba e recebeu a maior honra da Capoeira Regional: o lenço branco significando o status de mestre. Um dos apenas quatro alunos a receber esta distinção de Bimba durante sua vida.',
  -- Life dates
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Miranda is one of the most historically significant yet least documented figures in Capoeira Regional history. He was one of only four students to receive the white handkerchief (lenço branco) directly from Mestre Bimba during the founder''s lifetime—the highest honor in Bimba''s graduation system.

The four mestres formally graduated by Bimba were: Angelo Augusto Decânio Filho (Mestre Decânio), Jair Moura, Miranda, and Edinho. According to Mestre Edinho himself, these were "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba" (the only ones to receive the title of Master of Regional Baiana directly from Mestre Bimba''s own hands).

The white handkerchief represented the pinnacle of achievement in Capoeira Regional. As noted by Mestre Itapoan in a lecture about Bimba: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died." Those two deceased recipients were Miranda and Edinho.

Miranda trained at Bimba''s Centro de Cultura Física e Luta Regional in Salvador, Bahia, though the exact dates of his training period are not documented in available sources. The limited records about Miranda stand in contrast to the substantial documentation about his fellow white handkerchief recipients Decânio and Jair Moura, both of whom went on to become prolific authors and historians of capoeira.

The full name "Ney Miranda" appears in CapoeiraHub''s database of Capoeira Regional mestres, providing one of the few details beyond his apelido.

Miranda''s death occurred before Mestre Bimba''s own death in 1974, though the exact date is not recorded in accessible sources.',
  -- bio_pt
  E'Mestre Miranda é uma das figuras mais historicamente significativas, porém menos documentadas, da história da Capoeira Regional. Ele foi um dos apenas quatro alunos a receber o lenço branco diretamente de Mestre Bimba durante a vida do fundador—a maior honra no sistema de graduação de Bimba.

Os quatro mestres formalmente graduados por Bimba foram: Angelo Augusto Decânio Filho (Mestre Decânio), Jair Moura, Miranda e Edinho. Segundo o próprio Mestre Edinho, estes foram "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba."

O lenço branco representava o ápice da conquista na Capoeira Regional. Como observou Mestre Itapoan em uma palestra sobre Bimba: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram." Esses dois destinatários falecidos eram Miranda e Edinho.

Miranda treinou no Centro de Cultura Física e Luta Regional de Bimba em Salvador, Bahia, embora as datas exatas de seu período de treinamento não estejam documentadas nas fontes disponíveis. Os registros limitados sobre Miranda contrastam com a documentação substancial sobre seus colegas que receberam o lenço branco, Decânio e Jair Moura, ambos que se tornaram autores prolíficos e historiadores da capoeira.

O nome completo "Ney Miranda" aparece no banco de dados de mestres de Capoeira Regional do CapoeiraHub, fornecendo um dos poucos detalhes além de seu apelido.

A morte de Miranda ocorreu antes da própria morte de Mestre Bimba em 1974, embora a data exata não esteja registrada nas fontes acessíveis.',
  -- achievements_en
  E'One of only four students to receive the white handkerchief (mestre graduation) directly from Mestre Bimba; Completed full Capoeira Regional training under Bimba including sequências, cintura desprezada, and specialization courses',
  -- achievements_pt
  E'Um dos apenas quatro alunos a receber o lenço branco (graduação de mestre) diretamente de Mestre Bimba; Completou treinamento completo de Capoeira Regional sob Bimba incluindo sequências, cintura desprezada e cursos de especialização',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1925, decade):
Miranda was a contemporary of Decânio (born 1923) as both received the white handkerchief from Bimba. To achieve mestre status required many years of dedicated training (typically 15-20+ years). He died before Bimba (1974), so he achieved mestre status by early 1970s at latest. If he started training in his teens/20s like Decânio and trained long enough to receive the highest honor, he was likely born in the 1920s. Using 1925 as midpoint with decade precision.

LIMITED DOCUMENTATION: Mestre Miranda is one of the least documented of Bimba''s white handkerchief recipients, despite being one of only four students to achieve this highest honor.

FULL NAME: "Ney Miranda" appears in CapoeiraHub database. No other sources provide his civil name or birth name.

DEATH: Confirmed deceased. According to Mestre Itapoan: "Bimba only awarded four of these white handkerchiefs during his lifetime: one to Angelo Augusto Decânio Filho, one to Jair Moura, and the other two to people who have since died." The two deceased are Miranda and Edinho. Both died before Bimba (1974).

TRAINING PERIOD: Unknown exact dates. Must have trained with Bimba at Centro de Cultura Física e Luta Regional in Salvador between 1932 (academy founding) and early 1970s.

THE FOUR WHITE HANDKERCHIEF RECIPIENTS:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - historian, still living as of last research
3. Miranda (Ney Miranda) - deceased before 1974
4. Edinho - deceased before 1974

SOURCE STATEMENT: Mestre Edinho confirmed: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira).

TRAINING COMPANIONS (known):
- Mestre Decânio (began 1938)
- Jair Moura
- Mestre Edinho
- Likely trained alongside many of Bimba''s famous students from the Consolidation Phase (1938-1966) and Propagation Phase (1967-1973)

RESEARCH GAPS:
- No birth date or year found
- No specific death date found (only "before 1974")
- No photographs located
- No information about any students he may have trained
- No information about activities outside of Bimba''s academy',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1925, década):
Miranda era contemporâneo de Decânio (nascido em 1923), pois ambos receberam o lenço branco de Bimba. Alcançar o status de mestre exigia muitos anos de treinamento dedicado (tipicamente 15-20+ anos). Ele morreu antes de Bimba (1974), então alcançou o status de mestre no máximo no início dos anos 1970. Se ele começou a treinar na adolescência/20 anos como Decânio e treinou tempo suficiente para receber a maior honra, provavelmente nasceu nos anos 1920. Usando 1925 como ponto médio com precisão de década.

DOCUMENTAÇÃO LIMITADA: Mestre Miranda é um dos menos documentados dos destinatários do lenço branco de Bimba, apesar de ser um dos apenas quatro alunos a alcançar esta maior honra.

NOME COMPLETO: "Ney Miranda" aparece no banco de dados do CapoeiraHub. Nenhuma outra fonte fornece seu nome civil ou nome de nascimento.

MORTE: Confirmado falecido. Segundo Mestre Itapoan: "Bimba concedeu apenas quatro desses lenços brancos durante sua vida: um para Angelo Augusto Decânio Filho, um para Jair Moura, e os outros dois para pessoas que já faleceram." Os dois falecidos são Miranda e Edinho. Ambos morreram antes de Bimba (1974).

PERÍODO DE TREINAMENTO: Datas exatas desconhecidas. Deve ter treinado com Bimba no Centro de Cultura Física e Luta Regional em Salvador entre 1932 (fundação da academia) e início dos anos 1970.

OS QUATRO DESTINATÁRIOS DO LENÇO BRANCO:
1. Angelo Augusto Decânio Filho (Mestre Decânio) - 1923-2011
2. Jair Moura - historiador, ainda vivo conforme última pesquisa
3. Miranda (Ney Miranda) - falecido antes de 1974
4. Edinho - falecido antes de 1974

DECLARAÇÃO DA FONTE: Mestre Edinho confirmou: "os únicos a receberem o título de Mestre da Regional Baiana pelas próprias mãos de Mestre Bimba foram Jair Moura, Miranda, Decânio e o próprio Edinho" (Portal Capoeira).

COMPANHEIROS DE TREINAMENTO (conhecidos):
- Mestre Decânio (iniciou 1938)
- Jair Moura
- Mestre Edinho
- Provavelmente treinou ao lado de muitos dos famosos alunos de Bimba da Fase de Consolidação (1938-1966) e Fase de Propagação (1967-1973)

LACUNAS NA PESQUISA:
- Nenhuma data de nascimento encontrada
- Nenhuma data específica de morte encontrada (apenas "antes de 1974")
- Nenhuma fotografia localizada
- Nenhuma informação sobre alunos que ele possa ter treinado
- Nenhuma informação sobre atividades fora da academia de Bimba'
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

-- Source: entities/persons/omar.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Omar
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH YEAR: 1957 per multiple sources (capoeira-uniao.ch)
-- Pioneer of capoeira in German-speaking Switzerland
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
  'Omar Tisereve da Conceição',
  'Omar',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeira-uniao.ch/mestre-omar/', 'https://www.lalaue.com/baden/capoeira-uniao/', 'https://capoeira.iphan.gov.br/grupo/infor/638']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in the tradition of Mestre Bimba through Mestre Ezequiel. His approach emphasizes capoeira as "arte de fazer amigos" (the art of making friends), combining technical excellence with community building. Pioneer who established the infrastructure for Capoeira Regional in German-speaking Switzerland.',
  E'Treinado na tradição de Mestre Bimba através de Mestre Ezequiel. Sua abordagem enfatiza a capoeira como "arte de fazer amigos", combinando excelência técnica com construção de comunidade. Pioneiro que estabeleceu a infraestrutura da Capoeira Regional na Suíça de língua alemã.',
  -- Life dates
  1957,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Omar Tisereve da Conceição, known as Mestre Omar, was born in 1957 in Salvador da Bahia, Brazil. He first encountered capoeira as a child through street rodas before formal training. At age 12, he began studying under Mestre Ezequiel at the Escola de Capoeira Mestre Bimba, establishing a direct lineage to the founder of Capoeira Regional.

From age 17, Omar regularly performed with folkloric and show groups, developing his skills as both performer and practitioner. He also received further education and teaching experience at the Escola de Arte e Dança in Bahia, broadening his understanding of Brazilian cultural arts.

In 1985, Omar moved to Switzerland, becoming one of the pioneers to bring capoeira to the country. In Basel, he founded the first capoeira group and began giving courses and workshops throughout Switzerland and Germany.

In 1994, Mestre Omar founded Grupo de Capoeira União, an international association for the cultivation of Capoeira Regional. The organization''s motto, "arte de fazer amigos" (the art of making friends), reflects his philosophy of capoeira as a tool for community building.

In 1996, he achieved two major milestones. He successfully organized the first Swiss "Ostertreffen" (Easter meeting), establishing an annual gathering tradition that continues to this day. Later that same year, in the autumn, his teacher Mestre Ezequiel traveled from Brazil to Baden, Switzerland, for a momentous occasion: the inauguration of the Academia de Capoeira União in the Merkerareal—the first capoeira school in German-speaking Switzerland. During this ceremony, on August 30, 1996, Mestre Ezequiel personally presented Omar with the white corda, elevating him to the rank of Mestre.

This would be one of Ezequiel''s final acts as a teacher. He died in March 1997, leaving Omar as one of the custodians of his lineage.

Today, Grupo de Capoeira União operates across multiple countries including Switzerland, Germany, Italy, and Brazil. The organization is registered with IPHAN as both a Ponto de Cultura and Ponto de Memória, with headquarters on Itaparica Island in Bahia. In Switzerland alone, academies operate in Baden (headquarters), Aarau, Chur, Lucerne, Schaffhausen, St. Gallen, Winterthur, Wetzikon, and Zofingen.

Mestre Omar continues to lead the organization and teach at the Baden academy. He has expanded his work beyond the roda, giving courses and workshops at public schools and participating in community projects including "Gewalt macht Schule" (Violence Goes to School) conferences in Muttenz, "Welt in Basel," and the charitable initiative "Ajuda Brasil Crianças."

After more than 40 years in capoeira, Mestre Omar maintains that he continues learning. He supports his students, professors, and mestrandos, nurturing the next generation of the Bimba-Ezequiel lineage in Europe.',
  -- bio_pt
  E'Omar Tisereve da Conceição, conhecido como Mestre Omar, nasceu em 1957 em Salvador da Bahia, Brasil. Ele teve seu primeiro contato com a capoeira ainda criança nas rodas de rua antes do treinamento formal. Aos 12 anos, começou a estudar com Mestre Ezequiel na Escola de Capoeira Mestre Bimba, estabelecendo uma linhagem direta com o fundador da Capoeira Regional.

A partir dos 17 anos, Omar se apresentou regularmente com grupos folclóricos e de shows, desenvolvendo suas habilidades como artista e praticante. Também recebeu educação adicional e experiência de ensino na Escola de Arte e Dança na Bahia, ampliando sua compreensão das artes culturais brasileiras.

Em 1985, Omar mudou-se para a Suíça, tornando-se um dos pioneiros a levar a capoeira para o país. Em Basel, fundou o primeiro grupo de capoeira e começou a dar cursos e oficinas em toda a Suíça e Alemanha.

Em 1994, Mestre Omar fundou o Grupo de Capoeira União, uma associação internacional para o cultivo da Capoeira Regional. O lema da organização, "arte de fazer amigos", reflete sua filosofia da capoeira como ferramenta de construção de comunidade.

Em 1996, ele alcançou dois marcos importantes. Organizou com sucesso o primeiro "Ostertreffen" (Encontro de Páscoa) suíço, estabelecendo uma tradição de encontro anual que continua até hoje. Mais tarde naquele mesmo ano, no outono, seu professor Mestre Ezequiel viajou do Brasil para Baden, Suíça, para uma ocasião marcante: a inauguração da Academia de Capoeira União no Merkerareal—a primeira escola de capoeira na Suíça de língua alemã. Durante esta cerimônia, em 30 de agosto de 1996, Mestre Ezequiel pessoalmente apresentou a Omar a corda branca, elevando-o ao posto de Mestre.

Este seria um dos últimos atos de Ezequiel como professor. Ele faleceu em março de 1997, deixando Omar como um dos guardiões de sua linhagem.

Hoje, o Grupo de Capoeira União opera em vários países, incluindo Suíça, Alemanha, Itália e Brasil. A organização está registrada no IPHAN como Ponto de Cultura e Ponto de Memória, com sede na Ilha de Itaparica na Bahia. Somente na Suíça, academias funcionam em Baden (sede), Aarau, Chur, Lucerna, Schaffhausen, St. Gallen, Winterthur, Wetzikon e Zofingen.

Mestre Omar continua liderando a organização e ensinando na academia de Baden. Ele expandiu seu trabalho além da roda, dando cursos e oficinas em escolas públicas e participando de projetos comunitários, incluindo conferências "Gewalt macht Schule" (Violência nas Escolas) em Muttenz, "Welt in Basel" e a iniciativa beneficente "Ajuda Brasil Crianças."

Após mais de 40 anos na capoeira, Mestre Omar afirma que continua aprendendo. Ele apoia seus alunos, professores e mestrandos, nutrindo a próxima geração da linhagem Bimba-Ezequiel na Europa.',
  -- achievements_en
  E'Founded first capoeira group in Basel, Switzerland (1985); Founded Grupo de Capoeira União (1994); Organized first Swiss "Ostertreffen" (Easter gathering, 1996); Inaugurated first capoeira school in German-speaking Switzerland - Academia de Capoeira União in Baden (1996); Received Mestre title from Mestre Ezequiel (August 30, 1996); Pioneer of Capoeira Regional in German-speaking Switzerland; Grupo de Capoeira União recognized as Ponto de Cultura and Ponto de Memória by IPHAN; Expanded organization to 4 countries (Switzerland, Germany, Italy, Brazil); Built network of 12 contra-mestres and 16 professors',
  -- achievements_pt
  E'Fundou o primeiro grupo de capoeira em Basel, Suíça (1985); Fundou o Grupo de Capoeira União (1994); Organizou o primeiro "Ostertreffen" (Encontro de Páscoa) suíço (1996); Inaugurou a primeira escola de capoeira na Suíça de língua alemã - Academia de Capoeira União em Baden (1996); Recebeu título de Mestre de Mestre Ezequiel (30 de agosto de 1996); Pioneiro da Capoeira Regional na Suíça de língua alemã; Grupo de Capoeira União reconhecido como Ponto de Cultura e Ponto de Memória pelo IPHAN; Expandiu a organização para 4 países (Suíça, Alemanha, Itália, Brasil); Construiu rede de 12 contra-mestres e 16 professores',
  -- notes_en
  E'BIRTH YEAR (1957, year):
Multiple sources confirm born 1957 in Salvador, Bahia.

FULL NAME DISCREPANCY:
- "Omar da Conceição" - most sources
- "Omar Tisereve da Conceição" - IPHAN registration
Using full name from IPHAN as most official source.

TRAINING:
- Age 12 (~1969): Began training with Mestre Ezequiel at Escola de Capoeira Mestre Bimba
- Age 17+ (~1974+): Performed with folklore and show groups
- Continued education at Escola de Arte e Dança, Bahia

MESTRE TITLE DATE:
- August 30, 1996: Received white corda from Mestre Ezequiel in Baden, Switzerland
- Ceremony coincided with Academia de Capoeira União inauguration

PIONEER STATUS:
- 1985: First capoeira group in Basel
- 1996: First capoeira school in German-speaking Switzerland (Baden)

GRUPO DE CAPOEIRA UNIÃO:
- Founded: 1994
- IPHAN Registration: Yes (Ponto de Cultura, Ponto de Memória)
- HQ: Itaparica, Bahia (CEP 44460-000)
- Countries: Brazil, Switzerland, Germany, Italy
- Swiss locations: Baden (HQ), Aarau, Chur, Lucerne, Schaffhausen, St. Gallen, Winterthur, Wetzikon, Zofingen
- International: Monza/Trieste (Italy), Ravensburg (Germany), Rio de Janeiro (Brazil)
- Structure: 1 mestre, 12 contra-mestres, 16 professors

COMMUNITY PROJECTS:
- "Gewalt macht Schule" (Violence Goes to School) - Muttenz
- "Welt in Basel"
- "Ajuda Brasil Crianças"

ANNUAL EVENTS:
- Ostertreffen (Easter meeting) - organized since 1996
- Batizado & Troca de Corda ceremonies',
  -- notes_pt
  E'ANO DE NASCIMENTO (1957, ano):
Múltiplas fontes confirmam nascimento em 1957 em Salvador, Bahia.

DISCREPÂNCIA DO NOME COMPLETO:
- "Omar da Conceição" - maioria das fontes
- "Omar Tisereve da Conceição" - registro IPHAN
Usando nome completo do IPHAN como fonte mais oficial.

TREINAMENTO:
- 12 anos (~1969): Começou a treinar com Mestre Ezequiel na Escola de Capoeira Mestre Bimba
- 17+ anos (~1974+): Apresentou-se com grupos folclóricos e de shows
- Continuou educação na Escola de Arte e Dança, Bahia

DATA DO TÍTULO DE MESTRE:
- 30 de agosto de 1996: Recebeu corda branca de Mestre Ezequiel em Baden, Suíça
- Cerimônia coincidiu com inauguração da Academia de Capoeira União

STATUS DE PIONEIRO:
- 1985: Primeiro grupo de capoeira em Basel
- 1996: Primeira escola de capoeira na Suíça de língua alemã (Baden)

GRUPO DE CAPOEIRA UNIÃO:
- Fundado: 1994
- Registro IPHAN: Sim (Ponto de Cultura, Ponto de Memória)
- Sede: Itaparica, Bahia (CEP 44460-000)
- Países: Brasil, Suíça, Alemanha, Itália
- Locais na Suíça: Baden (sede), Aarau, Chur, Lucerna, Schaffhausen, St. Gallen, Winterthur, Wetzikon, Zofingen
- Internacional: Monza/Trieste (Itália), Ravensburg (Alemanha), Rio de Janeiro (Brasil)
- Estrutura: 1 mestre, 12 contra-mestres, 16 professores

PROJETOS COMUNITÁRIOS:
- "Gewalt macht Schule" (Violência nas Escolas) - Muttenz
- "Welt in Basel"
- "Ajuda Brasil Crianças"

EVENTOS ANUAIS:
- Ostertreffen (encontro de Páscoa) - organizado desde 1996
- Cerimônias de Batizado & Troca de Corda'
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

-- Source: entities/persons/pedrinho-carneiro.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Pedrinho (Carneiro)
-- Generated: 2025-12-25
-- ============================================================
-- Pedrinho Carneiro (full surname uncertain)
-- Brother of Camisa Roxa, Ermival, and José Tadeu (Mestre Camisa)
-- Born at Fazenda Estiva, Jacobina, Bahia
-- Aluno formado of Mestre Bimba's academy
-- ============================================================
-- BIRTH YEAR ESTIMATION (1946-1953, decade precision):
-- Camisa Roxa (eldest) born 1944. Mestre Camisa (José Tadeu,
-- youngest of the four male capoeirista brothers) born 1955.
-- José Tadeu was "the fourth to learn capoeira" in the family.
-- Since family learned in order (Camisa Roxa first, then
-- Ermival and Pedrinho, then José Tadeu), Pedrinho must be
-- between Ermival (~1948) and Camisa (~1955).
-- Using 1950 as midpoint with decade precision.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Pedrinho',
  'Carneiro',
  'formado'::genealogy.title,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in Capoeira Regional under Mestre Bimba at his academy in Salvador. Graduated as aluno formado alongside his brothers Ermival and José Tadeu (Mestre Camisa). Part of the Carneiro capoeira dynasty from Jacobina, Bahia.',
  E'Treinou Capoeira Regional com Mestre Bimba em sua academia em Salvador. Formou-se como aluno formado junto com seus irmãos Ermival e José Tadeu (Mestre Camisa). Parte da dinastia de capoeira Carneiro de Jacobina, Bahia.',
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  'Fazenda Estiva, Jacobina, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Pedrinho was one of ten children born to the Carneiro family at Fazenda Estiva, a farm in the interior of Jacobina, Bahia. His eldest brother, Edvaldo Carneiro e Silva, would become the legendary Grão-Mestre Camisa Roxa, considered the best student of Mestre Bimba.

When Camisa Roxa''s father died around 1965, the twenty-one-year-old eldest brother became the family patriarch. As Mestre Camisa later recalled, "He was a second father to us." Under his guidance and example, three of his younger brothers—Ermival, Pedrinho, and José Tadeu—followed him to Salvador to train capoeira with Mestre Bimba.

Pedrinho joined Mestre Bimba''s academy in Salvador, likely in the mid-to-late 1960s. Along with Ermival and José Tadeu, he completed the rigorous training regimen and graduated as an aluno formado—a formally graduated student of the Academia de Mestre Bimba. According to Mestre Camisa, he was "the fourth in my family to graduate from Mestre Bimba''s capoeira course," which places Pedrinho and Ermival as the second and third graduates before him.

The Carneiro family of Jacobina represents one of the most significant capoeira dynasties of the 20th century. From this single family at Fazenda Estiva came four brothers who trained at Mestre Bimba''s academy (the family''s fifth capoeirista remains unidentified). While Camisa Roxa became one of the pioneers who brought capoeira to Europe, and José Tadeu (Mestre Camisa) went on to found Abadá-Capoeira in 1988, Pedrinho''s role in this family tradition—though less publicly documented—was part of the foundation that made this family legacy possible.',
  -- bio_pt
  E'Pedrinho foi um dos dez filhos nascidos da família Carneiro na Fazenda Estiva, uma fazenda no interior de Jacobina, Bahia. Seu irmão mais velho, Edvaldo Carneiro e Silva, se tornaria o lendário Grão-Mestre Camisa Roxa, considerado o melhor aluno de Mestre Bimba.

Quando o pai de Camisa Roxa faleceu por volta de 1965, o irmão mais velho de vinte e um anos tornou-se o patriarca da família. Como Mestre Camisa recordou mais tarde, "Ele foi um segundo pai para nós." Sob sua orientação e exemplo, três de seus irmãos mais novos—Ermival, Pedrinho e José Tadeu—o seguiram até Salvador para treinar capoeira com Mestre Bimba.

Pedrinho ingressou na academia de Mestre Bimba em Salvador, provavelmente em meados ou final dos anos 1960. Junto com Ermival e José Tadeu, ele completou o rigoroso regime de treinamento e formou-se como aluno formado—um aluno formalmente graduado da Academia de Mestre Bimba. Segundo Mestre Camisa, ele foi "o quarto da minha família a se formar no curso de capoeira de Mestre Bimba," o que coloca Pedrinho e Ermival como segundo e terceiro formados antes dele.

A família Carneiro de Jacobina representa uma das dinastias de capoeira mais significativas do século XX. Desta única família da Fazenda Estiva saíram quatro irmãos que treinaram na academia de Mestre Bimba (o quinto capoeirista da família permanece não identificado). Enquanto Camisa Roxa se tornou um dos pioneiros que levaram a capoeira para a Europa, e José Tadeu (Mestre Camisa) fundou a Abadá-Capoeira em 1988, o papel de Pedrinho nesta tradição familiar—embora menos documentado publicamente—foi parte da fundação que tornou este legado familiar possível.',
  -- achievements_en
  E'Graduated as aluno formado from Mestre Bimba''s academy in Salvador; Member of the Carneiro capoeira dynasty from Jacobina, Bahia',
  -- achievements_pt
  E'Formou-se como aluno formado da academia de Mestre Bimba em Salvador; Membro da dinastia de capoeira Carneiro de Jacobina, Bahia',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1950, decade):
Camisa Roxa (eldest brother) born January 7, 1944. Mestre Camisa (José Tadeu, youngest of the four brothers who trained with Bimba) born October 28, 1955. Mestre Camisa stated he was "the fourth in my family to graduate from Mestre Bimba''s capoeira course," suggesting Ermival, Pedrinho, and Camisa Roxa graduated before him. Pedrinho is described as a younger brother of Camisa Roxa. Reasonable estimate places his birth in the late 1940s to early 1950s. Using 1950 as midpoint with decade precision.

NAME:
Only "Pedrinho" documented in sources. Full name likely "Pedro Carneiro" following family pattern but not confirmed. Birth records from Jacobina could potentially confirm. "Pedrinho" is diminutive form of "Pedro."

APELIDO_CONTEXT:
Using "Carneiro" to distinguish from other capoeiristas named "Pedrinho" (e.g., Pedrinho Fio do Ouro mentioned in sources as teacher of Mestre Cigano in 1972 Bahia).

FAMILY (Carneiro capoeiristas from Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - eldest, b. 1944, first to learn capoeira, became Grão-Mestre
- Ermival - younger brother, aluno formado, estimated ~1948
- Pedrinho - younger brother, aluno formado, estimated ~1950
- José Tadeu (Mestre Camisa) - youngest of brothers, b. 1955, fourth to learn, founder of Abadá-Capoeira
- Fifth capoeirista - unknown (possibly a sibling, as Mestre Camisa came from "a family of five capoeiristas")

TRAINING TIMELINE:
- Camisa Roxa entered Bimba''s academy 1962/1963
- Ermival and Pedrinho followed after, likely mid-to-late 1960s
- José Tadeu (Camisa) graduated with Macarrão, Onça Negra, and Torpedo in 1969 at age 14
- All four brothers became alunos formados

FAMILY STRUCTURE:
- Father died when Camisa Roxa was 21 (~1965)
- Camisa Roxa became family patriarch
- Ten children total (4 boys, 5 girls according to some sources; 9 siblings according to others)

DEATH: Unknown. No documentation found.

TITLE: Listed as aluno formado (not mestre). No evidence found that he received mestre title.',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1950, década):
Camisa Roxa (irmão mais velho) nasceu 7 de janeiro de 1944. Mestre Camisa (José Tadeu, mais novo dos quatro irmãos que treinaram com Bimba) nasceu 28 de outubro de 1955. Mestre Camisa afirmou que foi "o quarto da minha família a se formar no curso de capoeira de Mestre Bimba," sugerindo que Ermival, Pedrinho e Camisa Roxa se formaram antes dele. Pedrinho é descrito como irmão mais novo de Camisa Roxa. Estimativa razoável coloca seu nascimento no final dos anos 1940 ou início dos anos 1950. Usando 1950 como ponto médio com precisão de década.

NOME:
Apenas "Pedrinho" documentado nas fontes. Nome completo provavelmente "Pedro Carneiro" seguindo padrão familiar, mas não confirmado. Registros de nascimento de Jacobina poderiam potencialmente confirmar. "Pedrinho" é forma diminutiva de "Pedro."

APELIDO_CONTEXT:
Usando "Carneiro" para distinguir de outros capoeiristas chamados "Pedrinho" (ex: Pedrinho Fio do Ouro mencionado nas fontes como professor de Mestre Cigano em 1972 na Bahia).

FAMÍLIA (capoeiristas Carneiro da Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - mais velho, n. 1944, primeiro a aprender capoeira, tornou-se Grão-Mestre
- Ermival - irmão mais novo, aluno formado, estimado ~1948
- Pedrinho - irmão mais novo, aluno formado, estimado ~1950
- José Tadeu (Mestre Camisa) - caçula dos irmãos, n. 1955, quarto a aprender, fundador da Abadá-Capoeira
- Quinto capoeirista - desconhecido (possivelmente um irmão, já que Mestre Camisa veio de "uma família de cinco capoeiristas")

CRONOLOGIA DE TREINAMENTO:
- Camisa Roxa entrou na academia de Bimba 1962/1963
- Ermival e Pedrinho seguiram depois, provavelmente meados ou final dos anos 1960
- José Tadeu (Camisa) formou-se com Macarrão, Onça Negra e Torpedo em 1969 aos 14 anos
- Todos os quatro irmãos tornaram-se alunos formados

ESTRUTURA FAMILIAR:
- Pai faleceu quando Camisa Roxa tinha 21 anos (~1965)
- Camisa Roxa tornou-se patriarca da família
- Dez filhos no total (4 meninos, 5 meninas segundo algumas fontes; 9 irmãos segundo outras)

MORTE: Desconhecida. Nenhuma documentação encontrada.

TÍTULO: Listado como aluno formado (não mestre). Nenhuma evidência encontrada de que recebeu título de mestre.'
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

-- Source: entities/persons/saci.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Saci
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH DATE: March 16, 1945 per UNICAR München and multiple sources
-- TITLE: Received mestre cord in 2007
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
  'Josevaldo Lima de Jesus',
  'Saci',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeira-muenchen.de/en/capoeira/the-masters', 'https://capoeira-regional.eu/grupo-unicar/biografie/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Direct student of Mestre Bimba who trained for many years at the Centro de Cultura Física e Luta Regional. Witnessed significant historical events in the development of Capoeira Regional in Bahia. Known for teaching at military police facilities and for introducing new students to Bimba''s academy.',
  E'Aluno direto de Mestre Bimba que treinou por muitos anos no Centro de Cultura Física e Luta Regional. Testemunhou eventos históricos significativos no desenvolvimento da Capoeira Regional na Bahia. Conhecido por ensinar em instalações da polícia militar e por introduzir novos alunos à academia de Bimba.',
  -- Life dates
  1945,
  'exact'::genealogy.date_precision,
  'Santa Barbara, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Josevaldo Lima de Jesus, known as Mestre Saci, was born on March 16, 1945, in Santa Barbara in the state of Bahia. In July 1964, at age 19, he began his formal training in Capoeira Regional at the legendary academy of Mestre Bimba in Salvador—the Centro de Cultura Física e Luta Regional.

Saci trained for many years directly under Mestre Bimba, becoming one of his dedicated disciples during the final active decade of the master''s teaching in Salvador. This extended training period made him a firsthand witness to significant historical developments in Capoeira Regional and at Bimba''s academy. He experienced the evolution of the art during a transformative era, providing him with deep knowledge of Bimba''s methods, philosophy, and the capoeira community of that time.

Beyond his own training, Saci played an important role in introducing new practitioners to Capoeira Regional. In the mid-1960s, while serving in the Military Police, he met Eziquiel Martins Marinho (later known as Mestre Ezequiel). Saci introduced Ezequiel to Capoeira Regional, first training him at the Quartel dos Dendezeiros—the Military Police barracks in the Itapagipe neighborhood of Salvador. After this initial instruction, Saci brought Ezequiel to Mestre Bimba''s academy, where Ezequiel would go on to become one of Bimba''s most faithful disciples and a two-time Brazilian Capoeira Champion.

In the 1980s, Saci continued his teaching work at the Polo Estudantil da Capoeira, located in the Ginásio do Esporte at Vila Militar in the Bonfim neighborhood of Salvador. There, beginning in 1980, he trained students including Isnaldo da Silva Sacramento, who would later become known as Mestre Binal and dedicate over 36 years to teaching capoeira throughout Bahia.

In 2007, Saci received recognition of his mastery with the formal conferral of the Mestre cord. His role in the broader Capoeira Regional community extended to conferring titles on the next generation: he awarded the Mestre cord to Nelsinho (Nelson Batista) in 2006 and to Saguin in 2007. These mestres would go on to co-found UNICAR (União Internacional de Capoeira Regional) in 2003 and spread Capoeira Regional throughout Europe.

Saci was honored at the Capoeira Regional Centenary celebration that paid tribute to Mestre Bimba, alongside other distinguished mestres including Pombo de Ouro (José Bispo Correia), Itapoan (Raimundo César Alves de Almeida), and Deputado. He has continued to be active in the capoeira community, visiting mestres associated with UNICAR in Munich and other locations, helping to preserve the direct lineage and teachings of Mestre Bimba.

His title "DR." (as noted by his student Mestre Binal) suggests an academic or professional degree alongside his capoeira mastery, though details of this credential remain undocumented.',
  -- bio_pt
  E'Josevaldo Lima de Jesus, conhecido como Mestre Saci, nasceu em 16 de março de 1945, em Santa Barbara, no estado da Bahia. Em julho de 1964, aos 19 anos, começou seu treinamento formal em Capoeira Regional na lendária academia de Mestre Bimba em Salvador—o Centro de Cultura Física e Luta Regional.

Saci treinou por muitos anos diretamente com Mestre Bimba, tornando-se um de seus discípulos dedicados durante a última década ativa do mestre ensinando em Salvador. Este período prolongado de treinamento o tornou testemunha em primeira mão de desenvolvimentos históricos significativos na Capoeira Regional e na academia de Bimba. Ele vivenciou a evolução da arte durante uma era transformadora, proporcionando-lhe profundo conhecimento dos métodos de Bimba, sua filosofia e a comunidade de capoeira daquela época.

Além de seu próprio treinamento, Saci desempenhou um papel importante na introdução de novos praticantes à Capoeira Regional. Em meados dos anos 1960, enquanto servia na Polícia Militar, conheceu Eziquiel Martins Marinho (mais tarde conhecido como Mestre Ezequiel). Saci apresentou Ezequiel à Capoeira Regional, primeiro treinando-o no Quartel dos Dendezeiros—o quartel da Polícia Militar no bairro de Itapagipe em Salvador. Após esta instrução inicial, Saci levou Ezequiel à academia de Mestre Bimba, onde Ezequiel se tornaria um dos discípulos mais fiéis de Bimba e bicampeão Brasileiro de Capoeira.

Nos anos 1980, Saci continuou seu trabalho de ensino no Polo Estudantil da Capoeira, localizado no Ginásio do Esporte na Vila Militar no bairro do Bonfim em Salvador. Lá, a partir de 1980, treinou alunos incluindo Isnaldo da Silva Sacramento, que mais tarde se tornaria conhecido como Mestre Binal e dedicaria mais de 36 anos ao ensino da capoeira em toda a Bahia.

Em 2007, Saci recebeu o reconhecimento de sua maestria com a conferência formal do cordão de Mestre. Seu papel na comunidade mais ampla da Capoeira Regional se estendeu à concessão de títulos para a próxima geração: ele concedeu o cordão de Mestre a Nelsinho (Nelson Batista) em 2006 e a Saguin em 2007. Estes mestres iriam co-fundar a UNICAR (União Internacional de Capoeira Regional) em 2003 e espalhar a Capoeira Regional por toda a Europa.

Saci foi homenageado na celebração do Centenário da Capoeira Regional que prestou tributo a Mestre Bimba, junto com outros mestres ilustres incluindo Pombo de Ouro (José Bispo Correia), Itapoan (Raimundo César Alves de Almeida) e Deputado. Ele continua ativo na comunidade de capoeira, visitando mestres associados à UNICAR em Munique e outros locais, ajudando a preservar a linhagem direta e os ensinamentos de Mestre Bimba.

Seu título "DR." (como notado por seu aluno Mestre Binal) sugere um grau acadêmico ou profissional além de sua maestria na capoeira, embora detalhes desta credencial permaneçam não documentados.',
  -- achievements_en
  E'Direct student of Mestre Bimba (July 1964 - 1974); First teacher of Mestre Ezequiel (introduced him to Capoeira Regional); Received Mestre cord (2007); Conferred Mestre title to Nelsinho (2006); Conferred Mestre title to Saguin (2007); Taught at Quartel dos Dendezeiros Military Police barracks; Taught at Vila Militar sports gymnasium (1980s); Honored at Capoeira Regional Centenary celebration; Witness to historical developments at Mestre Bimba''s academy',
  -- achievements_pt
  E'Aluno direto de Mestre Bimba (julho 1964 - 1974); Primeiro professor de Mestre Ezequiel (apresentou-o à Capoeira Regional); Recebeu cordão de Mestre (2007); Conferiu título de Mestre a Nelsinho (2006); Conferiu título de Mestre a Saguin (2007); Ensinou no Quartel dos Dendezeiros da Polícia Militar; Ensinou no Ginásio do Esporte na Vila Militar (anos 1980); Homenageado na celebração do Centenário da Capoeira Regional; Testemunha de desenvolvimentos históricos na academia de Mestre Bimba',
  -- notes_en
  E'BIRTH DATE (1945, exact):
March 16, 1945 per UNICAR München, UNICAR Berlin, and multiple consistent sources.

NAME DISCREPANCY:
- "Josevaldo Lima de Jesus" - used in academic/formal contexts (Mestre Binal source)
- "Valdo Jose Lima de Jesus" - used in UNICAR München German source
Using "Josevaldo" as it appears in the more formal Portuguese-language sources and the Ezequiel report.

TITLE "DR.":
Mestre Binal refers to him as "DR. Josevaldo Lima de Jesus" suggesting an academic or professional title beyond capoeira. Nature of this credential unknown.

MESTRE TITLE (2007):
Received Mestre cord and certificate in 2007. Source unclear on who conferred the title.

TEACHERS:
- Mestre Bimba (July 1964 - 1974, primary teacher at CCFR)

STUDENTS:
- Mestre Ezequiel (Eziquiel Martins Marinho) - first trained at Quartel dos Dendezeiros, mid-1960s; brought to Bimba''s academy
- Mestre Binal (Isnaldo da Silva Sacramento) - trained at Vila Militar from 1980

TITLE CONFERRALS:
- Mestre Nelsinho (Nelson Batista) - Mestre cord 2006
- Mestre Saguin - Mestre cord and certificate 2007

TEACHING LOCATIONS:
- Quartel dos Dendezeiros - Military Police barracks, Itapagipe neighborhood, Salvador (mid-1960s)
- Polo Estudantil da Capoeira, Ginásio do Esporte, Vila Militar, Bonfim neighborhood, Salvador (1980+)

HONORS:
- Honored at Capoeira Regional Centenary alongside Pombo de Ouro, Itapoan, Deputado

UNICAR CONNECTION:
Listed among visiting mestres to UNICAR in Munich over 25 years. Nelsinho and Saguin (who received titles from Saci) co-founded UNICAR in 2003.

TIMELINE:
- 1945: Born March 16 in Santa Barbara, Bahia
- 1964 (July): Began training at Mestre Bimba''s academy
- Mid-1960s: Trained Ezequiel at Quartel dos Dendezeiros; brought him to Bimba
- 1974: Bimba died February 5
- 1980+: Teaching at Vila Militar, Bonfim (trained Binal)
- 2006: Conferred Mestre title to Nelsinho
- 2007: Received Mestre cord; conferred Mestre title to Saguin
- Present: Active in capoeira community, visits UNICAR Europe',
  -- notes_pt
  E'DATA DE NASCIMENTO (1945, exata):
16 de março de 1945 conforme UNICAR München, UNICAR Berlin e múltiplas fontes consistentes.

DISCREPÂNCIA DE NOME:
- "Josevaldo Lima de Jesus" - usado em contextos acadêmicos/formais (fonte Mestre Binal)
- "Valdo Jose Lima de Jesus" - usado na fonte alemã UNICAR München
Usando "Josevaldo" pois aparece nas fontes mais formais em português e no relatório de Ezequiel.

TÍTULO "DR.":
Mestre Binal refere-se a ele como "DR. Josevaldo Lima de Jesus" sugerindo um título acadêmico ou profissional além da capoeira. Natureza desta credencial desconhecida.

TÍTULO DE MESTRE (2007):
Recebeu cordão e certificado de Mestre em 2007. Fonte não esclarece quem conferiu o título.

PROFESSORES:
- Mestre Bimba (julho 1964 - 1974, professor principal no CCFR)

ALUNOS:
- Mestre Ezequiel (Eziquiel Martins Marinho) - primeiro treinou no Quartel dos Dendezeiros, meados dos anos 1960; levado à academia de Bimba
- Mestre Binal (Isnaldo da Silva Sacramento) - treinou na Vila Militar a partir de 1980

CONFERÊNCIAS DE TÍTULO:
- Mestre Nelsinho (Nelson Batista) - cordão de Mestre 2006
- Mestre Saguin - cordão e certificado de Mestre 2007

LOCAIS DE ENSINO:
- Quartel dos Dendezeiros - Quartel da Polícia Militar, bairro de Itapagipe, Salvador (meados dos anos 1960)
- Polo Estudantil da Capoeira, Ginásio do Esporte, Vila Militar, bairro do Bonfim, Salvador (1980+)

HONRARIAS:
- Homenageado no Centenário da Capoeira Regional junto com Pombo de Ouro, Itapoan, Deputado

CONEXÃO UNICAR:
Listado entre os mestres visitantes da UNICAR em Munique por mais de 25 anos. Nelsinho e Saguin (que receberam títulos de Saci) co-fundaram a UNICAR em 2003.

CRONOLOGIA:
- 1945: Nasceu 16 de março em Santa Barbara, Bahia
- 1964 (julho): Começou a treinar na academia de Mestre Bimba
- Meados dos anos 1960: Treinou Ezequiel no Quartel dos Dendezeiros; levou-o a Bimba
- 1974: Bimba morreu em 5 de fevereiro
- 1980+: Ensinando na Vila Militar, Bonfim (treinou Binal)
- 2006: Conferiu título de Mestre a Nelsinho
- 2007: Recebeu cordão de Mestre; conferiu título de Mestre a Saguin
- Presente: Ativo na comunidade de capoeira, visita UNICAR Europa'
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

-- Source: entities/persons/bimba.sql (CHANGED)
-- ============================================================
-- GENEALOGY PERSON: Bimba
-- Migrated: 2025-12-11
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
  'Manoel dos Reis Machado',
  'Bimba',
  'mestre'::genealogy.title,
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Mestre_Bimba.jpg/220px-Mestre_Bimba.jpg',
  ARRAY['https://en.wikipedia.org/wiki/Manuel_dos_Reis_Machado', 'https://www.lalaue.com/learn-capoeira/mestre-bimba/', 'https://capoeira.online/history/mestres/mestre-bimba/', 'https://fundacaomestrebimba.org.br/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Creator and founder of Capoeira Regional (Luta Regional Baiana). Synthesized traditional capoeira from his teacher Bentinho with batuque techniques from his father, adding elements of his own invention. Created the first systematic teaching method for capoeira including the "sequências de ensino" (teaching sequences), "cintura desprezada" (grappling sequences), and the charanga bateria (one berimbau, two pandeiros).',
  E'Criador e fundador da Capoeira Regional (Luta Regional Baiana). Sintetizou a capoeira tradicional de seu mestre Bentinho com técnicas de batuque de seu pai, adicionando elementos de sua própria invenção. Criou o primeiro método de ensino sistemático para capoeira incluindo as "sequências de ensino," "cintura desprezada" (sequências de agarramento) e a bateria charanga (um berimbau, dois pandeiros).',
  -- Life dates
  1899,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1974,
  'exact'::genealogy.date_precision,
  'Goiânia, Goiás, Brazil',
  -- bio_en
  E'Manoel dos Reis Machado was born on November 23, 1899, in the Bairro do Engenho Velho neighborhood of Salvador, Bahia—the youngest of 25 siblings. His parents were Luiz Cândido Machado, a champion of batuque, and Maria Martinha do Bonfim. The nickname "Bimba" came from a bet between his mother and the midwife about his sex; when he was born male, the midwife remarked on his "bimba" (Bahian slang for male genitalia), and the name stuck for life.

At twelve years old, in 1911, Bimba began learning capoeira from Bentinho, an African-born captain of the Companhia Baiana de Navegação. Training took place at the Clube União em Apuros on the Estrada das Boiadas in Salvador''s Liberdade neighborhood—a predominantly Black area. The apprenticeship lasted four years. Bimba later described Bentinho''s style as "capoeira de Angola" or "capoeira antiga."

Parallel to his capoeira training, young Bimba learned batuque from his father, who was a local champion of this combat sport involving defensive positioning and powerful leg sweeps. These techniques would later become foundational to Capoeira Regional.

Bimba''s connection to Candomblé was also deep. At fourteen, he joined the Candomblé do Senhor Vidal (Ketu nation) and became an ogã. Though he later dedicated himself exclusively to capoeira, he never stopped fulfilling his obligations to Xangô. His later wife Mãe Alice (Alice Maria da Cruz) led the Terreiro Oiá Padê da Riméia at Alto da Santa Cruz, Nordeste de Amaralina—described by Muniz Sodré as "uma casinha azul-anil" (a blue-indigo little house) in the Recôncavo style. Bimba brought students to the terreiro to receive spiritual "passes" and prayers, reconnecting them with Afro-Bahian rituals from which formal education had separated many of them. This represents an important but often overlooked spiritual dimension of Capoeira Regional''s transmission.

By eighteen, Bimba had concluded that capoeira had lost its martial efficacy, reduced to "nine movements" and becoming merely folkloric. He began restoring movements from old capoeira, adding batuque techniques, and inventing new movements. He removed two moves (encruzilhada, deslocamento) and added approximately fifteen new kicks.

To support himself, Bimba worked as a coal miner, carpenter, warehouse worker, longshoreman, and horse coach conductor—all physically demanding occupations that kept him strong. He reportedly could carry 120 kg as a dock worker.

In 1928, Bimba achieved a breakthrough: a demonstration at the palace of Bahia''s Governor Juracy Magalhães. This performance helped convince authorities of capoeira''s cultural value, contributing to the end of its official ban (which had been in effect since 1890) in 1930.

In 1932, Bimba founded Brazil''s first official capoeira academy: the Centro de Cultura Física e Luta Regional, at Engenho de Brotas in Salvador. Advisors recommended omitting "Capoeira" from the name due to lingering social stigma. The academy received state board of education certification on June 9, 1937—the first formal government recognition of any capoeira institution.

Bimba created revolutionary teaching innovations: eight predefined "sequências" (sequences) for beginners; "cintura desprezada" for advanced grappling training (developed partly in response to jiu-jitsu''s popularity); a formal graduation system using colored silk handkerchiefs (blue for batizado, red for formado, yellow for formado especializado, white for mestre); and the charanga bateria with one berimbau and two pandeiros.

His academy had strict rules: white uniforms, proof of school grade proficiency, no smoking during training, no alcohol. This discipline attracted doctors, lawyers, politicians, and—for the first time—women to capoeira practice.

In 1935, Cobrinha Verde began giving instruction to Bimba at Fazenda Garcia and helping him teach students at Bogum—an interesting detail showing collaboration even between what would become competing styles.

In 1936, Bimba issued a famous challenge to fighters of any martial art style. Under boxing-like rules developed by Anibal Burlamaqui, he faced four opponents: Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, and fellow capoeirista José Custódio "Zé I" dos Santos. Bimba won all matches, earning the nickname "Três Pancadas" (Three Hits)—meaning he only needed three strikes to finish opponents.

In 1939, Bimba began teaching military recruits at CPOR (Centro de Preparação de Oficiais da Reserva). In 1942, he opened a second academy at Terreiro de Jesus on Rua das Laranjeiras, which remains operational today.

On July 23, 1953, President Getúlio Vargas witnessed Bimba''s demonstration at the Aclamação Palace in Salvador. Vargas declared: "Capoeira is the only sport which is truly Brazilian!"

Bimba formally graduated only four students to mestre level (white handkerchief) during his lifetime: Angelo Augusto Decânio Filho, Jair Moura, Miranda, and Edinho. However, dozens of his students became influential mestres who spread Regional worldwide, including: Acordeon, Itapoan, Atenilo, Ezequiel, Camisa Roxa, Nenel, Cafuné, Carlos Senna, Damião, and many others.

His student Cisnando Lima, who was trained in judo under Mitsuyo Maeda and Takeo Yano, helped connect Bimba to Governor Juracy Magalhães and played a key role in the political efforts to legalize capoeira.

In 1973, disappointed by lack of government support in Bahia, Bimba moved to Goiânia at a former student''s invitation. The promises of opportunity proved false, and he lived in poverty.

On February 5, 1974, Mestre Bimba died from a stroke at the Hospital das Clínicas de Goiânia. He was initially buried in Goiânia, but on July 20, 1978, his remains were transferred to Salvador, where they now rest in the church of Santo Antônio Além do Carmo.

On June 12, 1996, Bimba was posthumously awarded an Honorary Doctorate by the Federal University of Bahia. The Fundação Mestre Bimba, established in 1994 under his son Mestre Nenel''s leadership, continues to preserve his legacy.

His famous declaration: "I didn''t do capoeira for myself... I did it for the world."',
  -- bio_pt
  E'Manoel dos Reis Machado nasceu em 23 de novembro de 1899, no Bairro do Engenho Velho em Salvador, Bahia—o caçula de 25 irmãos. Seus pais eram Luiz Cândido Machado, um campeão de batuque, e Maria Martinha do Bonfim. O apelido "Bimba" veio de uma aposta entre sua mãe e a parteira sobre seu sexo; quando ele nasceu homem, a parteira comentou sobre sua "bimba" (gíria baiana para genitália masculina), e o nome ficou para a vida toda.

Aos doze anos, em 1911, Bimba começou a aprender capoeira com Bentinho, um capitão de navegação nascido na África da Companhia Baiana de Navegação. O treinamento acontecia no Clube União em Apuros na Estrada das Boiadas, no bairro da Liberdade em Salvador—uma área predominantemente negra. O aprendizado durou quatro anos. Bimba mais tarde descreveu o estilo de Bentinho como "capoeira de Angola" ou "capoeira antiga."

Paralelamente ao treinamento de capoeira, o jovem Bimba aprendeu batuque com seu pai, que era campeão local deste esporte de combate envolvendo posicionamento defensivo e poderosas rasteiras. Essas técnicas mais tarde se tornariam fundamentais para a Capoeira Regional.

A conexão de Bimba com o Candomblé também era profunda. Aos catorze anos, ele ingressou no Candomblé do Senhor Vidal (nação Ketu) e tornou-se ogã. Embora mais tarde tenha se dedicado exclusivamente à capoeira, nunca deixou de cumprir suas obrigações com Xangô. Sua esposa posterior Mãe Alice (Alice Maria da Cruz) liderava o Terreiro Oiá Padê da Riméia no Alto da Santa Cruz, Nordeste de Amaralina—descrito por Muniz Sodré como "uma casinha azul-anil" no estilo do Recôncavo. Bimba levava alunos ao terreiro para receber "passes" espirituais e rezas, reconectando-os com rituais afro-baianos dos quais a educação formal havia separado muitos deles. Isto representa uma dimensão espiritual importante, mas frequentemente negligenciada, da transmissão da Capoeira Regional.

Aos dezoito anos, Bimba havia concluído que a capoeira tinha perdido sua eficácia marcial, reduzida a "nove movimentos" e tornando-se meramente folclórica. Ele começou a restaurar movimentos da capoeira antiga, adicionar técnicas de batuque e inventar novos movimentos. Removeu dois golpes (encruzilhada, deslocamento) e adicionou aproximadamente quinze novos chutes.

Para se sustentar, Bimba trabalhou como carvoeiro, carpinteiro, armazeneiro, estivador e condutor de carruagem—todas ocupações fisicamente exigentes que o mantinham forte. Supostamente conseguia carregar 120 kg como estivador.

Em 1928, Bimba alcançou um avanço: uma demonstração no palácio do Governador da Bahia Juracy Magalhães. Esta apresentação ajudou a convencer as autoridades do valor cultural da capoeira, contribuindo para o fim de sua proibição oficial (que estava em vigor desde 1890) em 1930.

Em 1932, Bimba fundou a primeira academia oficial de capoeira do Brasil: o Centro de Cultura Física e Luta Regional, no Engenho de Brotas em Salvador. Conselheiros recomendaram omitir "Capoeira" do nome devido ao estigma social persistente. A academia recebeu certificação do conselho estadual de educação em 9 de junho de 1937—o primeiro reconhecimento governamental formal de qualquer instituição de capoeira.

Bimba criou inovações revolucionárias de ensino: oito "sequências" predefinidas para iniciantes; "cintura desprezada" para treinamento avançado de agarramento (desenvolvida em parte em resposta à popularidade do jiu-jitsu); um sistema formal de graduação usando lenços de seda coloridos (azul para batizado, vermelho para formado, amarelo para formado especializado, branco para mestre); e a bateria charanga com um berimbau e dois pandeiros.

Sua academia tinha regras estritas: uniformes brancos, prova de desempenho escolar, proibição de fumar durante o treino, sem álcool. Esta disciplina atraiu médicos, advogados, políticos e—pela primeira vez—mulheres para a prática da capoeira.

Em 1935, Cobrinha Verde começou a dar instrução a Bimba na Fazenda Garcia e a ajudá-lo a ensinar alunos no Bogum—um detalhe interessante mostrando colaboração mesmo entre o que se tornaria estilos concorrentes.

Em 1936, Bimba lançou um famoso desafio a lutadores de qualquer estilo de arte marcial. Sob regras semelhantes ao boxe desenvolvidas por Anibal Burlamaqui, ele enfrentou quatro oponentes: Henrique Bahia, Vítor Benedito Lopes, Américo Ciência e o colega capoeirista José Custódio "Zé I" dos Santos. Bimba venceu todas as lutas, ganhando o apelido "Três Pancadas"—significando que ele só precisava de três golpes para finalizar oponentes.

Em 1939, Bimba começou a ensinar recrutas militares no CPOR (Centro de Preparação de Oficiais da Reserva). Em 1942, abriu uma segunda academia no Terreiro de Jesus na Rua das Laranjeiras, que permanece operacional hoje.

Em 23 de julho de 1953, o Presidente Getúlio Vargas testemunhou a demonstração de Bimba no Palácio da Aclamação em Salvador. Vargas declarou: "A capoeira é o único esporte verdadeiramente brasileiro!"

Bimba formalmente graduou apenas quatro alunos ao nível de mestre (lenço branco) durante sua vida: Angelo Augusto Decânio Filho, Jair Moura, Miranda e Edinho. No entanto, dezenas de seus alunos tornaram-se mestres influentes que espalharam a Regional pelo mundo, incluindo: Acordeon, Itapoan, Atenilo, Ezequiel, Camisa Roxa, Nenel, Cafuné, Carlos Senna, Damião, e muitos outros.

Seu aluno Cisnando Lima, que foi treinado em judô com Mitsuyo Maeda e Takeo Yano, ajudou a conectar Bimba ao Governador Juracy Magalhães e desempenhou um papel fundamental nos esforços políticos para legalizar a capoeira.

Em 1973, desapontado com a falta de apoio governamental na Bahia, Bimba mudou-se para Goiânia a convite de um ex-aluno. As promessas de oportunidade mostraram-se falsas, e ele viveu na pobreza.

Em 5 de fevereiro de 1974, Mestre Bimba morreu de um AVC no Hospital das Clínicas de Goiânia. Foi inicialmente enterrado em Goiânia, mas em 20 de julho de 1978, seus restos mortais foram transferidos para Salvador, onde agora repousam na igreja de Santo Antônio Além do Carmo.

Em 12 de junho de 1996, Bimba foi postumamente agraciado com um Doutorado Honoris Causa pela Universidade Federal da Bahia. A Fundação Mestre Bimba, estabelecida em 1994 sob a liderança de seu filho Mestre Nenel, continua a preservar seu legado.

Sua famosa declaração: "Eu não fiz capoeira para mim... Fiz para o mundo."',
  -- achievements_en
  E'Founded first official capoeira academy in Brazil (1932); Obtained first state certification for capoeira teaching (1937); Created Capoeira Regional style; Instrumental in ending capoeira prohibition (1930); Demonstrated capoeira to President Getúlio Vargas (1953); Won all four 1936 challenge matches against fighters of various styles; Created systematic teaching methodology (sequências, cintura desprezada); Posthumous Honorary Doctorate from Federal University of Bahia (1996); Recognized as "Father of Modern Capoeira"',
  -- achievements_pt
  E'Fundou a primeira academia oficial de capoeira no Brasil (1932); Obteve a primeira certificação estadual para ensino de capoeira (1937); Criou o estilo Capoeira Regional; Fundamental para o fim da proibição da capoeira (1930); Demonstrou capoeira ao Presidente Getúlio Vargas (1953); Venceu todas as quatro lutas de desafio em 1936 contra lutadores de vários estilos; Criou metodologia sistemática de ensino (sequências, cintura desprezada); Doutorado Honoris Causa póstumo pela Universidade Federal da Bahia (1996); Reconhecido como "Pai da Capoeira Moderna"',
  -- notes_en
  E'BIRTH DATE: Some sources give November 23, 1899; others say 1900 (official registration). Using 1899 with year precision as most sources cite this.

BIRTH CERTIFICATE: Bimba was not officially registered until 1900, causing confusion in some sources.

DEATH: February 5, 1974, stroke at Hospital das Clínicas de Goiânia. Remains transferred to Salvador July 20, 1978.

FOUR FORMAL MESTRE GRADUATES (white handkerchief):
1. Angelo Augusto Decânio Filho
2. Jair Moura
3. Miranda (deceased)
4. Edinho (deceased)
Note: Many famous students like Acordeon, Itapoan were never formally graduated to mestre by Bimba—he died before he could do so.

TEACHERS:
1. Bentinho (capoeira, 1911-1915) - primary capoeira teacher
2. Luiz Cândido Machado (batuque) - his father, taught him batuque techniques
3. Cobrinha Verde (1935) - gave instruction at Fazenda Garcia; helped teach Bimba''s students

NOTABLE STUDENTS (incomplete list):
- Mestre Atenilo (Altenísio dos Santos) - oldest student, 1929-1986
- Mestre Acordeon (Bira Almeida)
- Mestre Itapoan (Raimundo César Alves de Almeida)
- Mestre Decânio (Angelo Augusto Decânio Filho)
- Mestre Nenel (Manoel Nascimento Machado) - son
- Mestre Vermelho 27
- Mestre Camisa Roxa
- Mestre Ezequiel
- Mestre Cafuné
- Mestre Carlos Senna
- Cisnando Lima (José Cisnando Lima)
- Jair Moura
- Dr. Joaquim de Araújo Lima (former governor)

1936 CHALLENGE OPPONENTS:
- Henrique Bahia (won)
- Vítor Benedito Lopes (won)
- Américo Ciência (won)
- José Custódio "Zé I" dos Santos (won 15-2)

FAMILY:
- Father: Luiz Cândido Machado (batuque champion)
- Mother: Maria Martinha do Bonfim
- Son: Nenel (Manoel Nascimento Machado) - born 1960, with Berenice
- Son: Formiga (Demerval dos Santos Machado) - with Dona Nair
- Daughter: Marinalva Nascimento Machado (Rosa Rubra) - still practices capoeira

PARTNERS:
- Dona Anita - First wife (church marriage at Igreja de Santana, Rio Vermelho)
- Berenice da Conceição Nascimento - Mother of Nenel (biological)
- Dona Nair - Mother of Formiga
- Mãe Alice (Alice Maria da Cruz) - Later wife; Ialorixá of Terreiro Oiá Padê da Riméia at Alto da Santa Cruz; raised Nenel; worked at CCFR

CANDOMBLÉ/TERREIRO CONNECTION:
- Age 14: Joined Candomblé do Senhor Vidal (Ketu nation), became ogã
- Terreiro Oiá Padê da Riméia (Mãe Alice''s): Alto da Santa Cruz, Nordeste de Amaralina
- Bimba brought students (Galo, Itapoan, Russo, Bolão, Xaréu) to receive spiritual "passes" and prayers
- Source: Hélio Campos (Mestre Xaréu), Muniz Sodré (2002), Enciclopédia Itaú Cultural

RIVALRIES:
- Relationship with Mestre Pastinha was complex; they respected each other publicly but Atenilo and Itapoan report Bimba sometimes instructed students to hit Pastinha''s students in shared rodas.',
  -- notes_pt
  E'DATA DE NASCIMENTO: Algumas fontes dão 23 de novembro de 1899; outras dizem 1900 (registro oficial). Usando 1899 com precisão de ano como a maioria das fontes cita.

CERTIDÃO DE NASCIMENTO: Bimba não foi oficialmente registrado até 1900, causando confusão em algumas fontes.

MORTE: 5 de fevereiro de 1974, AVC no Hospital das Clínicas de Goiânia. Restos mortais transferidos para Salvador em 20 de julho de 1978.

QUATRO GRADUADOS FORMAIS A MESTRE (lenço branco):
1. Angelo Augusto Decânio Filho
2. Jair Moura
3. Miranda (falecido)
4. Edinho (falecido)
Nota: Muitos alunos famosos como Acordeon, Itapoan nunca foram formalmente graduados a mestre por Bimba—ele morreu antes de poder fazê-lo.

PROFESSORES:
1. Bentinho (capoeira, 1911-1915) - professor principal de capoeira
2. Luiz Cândido Machado (batuque) - seu pai, ensinou-lhe técnicas de batuque
3. Cobrinha Verde (1935) - deu instrução na Fazenda Garcia; ajudou a ensinar alunos de Bimba

ALUNOS NOTÁVEIS (lista incompleta):
- Mestre Atenilo (Altenísio dos Santos) - aluno mais velho, 1929-1986
- Mestre Acordeon (Bira Almeida)
- Mestre Itapoan (Raimundo César Alves de Almeida)
- Mestre Decânio (Angelo Augusto Decânio Filho)
- Mestre Nenel (Manoel Nascimento Machado) - filho
- Mestre Vermelho 27
- Mestre Camisa Roxa
- Mestre Ezequiel
- Mestre Cafuné
- Mestre Carlos Senna
- Cisnando Lima (José Cisnando Lima)
- Jair Moura
- Dr. Joaquim de Araújo Lima (ex-governador)

OPONENTES DO DESAFIO DE 1936:
- Henrique Bahia (venceu)
- Vítor Benedito Lopes (venceu)
- Américo Ciência (venceu)
- José Custódio "Zé I" dos Santos (venceu 15-2)

FAMÍLIA:
- Pai: Luiz Cândido Machado (campeão de batuque)
- Mãe: Maria Martinha do Bonfim
- Filho: Nenel (Manoel Nascimento Machado) - nascido 1960, com Berenice
- Filho: Formiga (Demerval dos Santos Machado) - com Dona Nair
- Filha: Marinalva Nascimento Machado (Rosa Rubra) - ainda pratica capoeira

COMPANHEIRAS:
- Dona Anita - Primeira esposa (casamento na Igreja de Santana, Rio Vermelho)
- Berenice da Conceição Nascimento - Mãe de Nenel (biológica)
- Dona Nair - Mãe de Formiga
- Mãe Alice (Alice Maria da Cruz) - Esposa posterior; Ialorixá do Terreiro Oiá Padê da Riméia no Alto da Santa Cruz; criou Nenel; trabalhou no CCFR

CONEXÃO CANDOMBLÉ/TERREIRO:
- Aos 14 anos: Ingressou no Candomblé do Senhor Vidal (nação Ketu), tornou-se ogã
- Terreiro Oiá Padê da Riméia (de Mãe Alice): Alto da Santa Cruz, Nordeste de Amaralina
- Bimba levava alunos (Galo, Itapoan, Russo, Bolão, Xaréu) para receber "passes" espirituais e rezas
- Fonte: Hélio Campos (Mestre Xaréu), Muniz Sodré (2002), Enciclopédia Itaú Cultural

RIVALIDADES:
- Relacionamento com Mestre Pastinha era complexo; eles se respeitavam publicamente mas Atenilo e Itapoan relatam que Bimba às vezes instruía alunos a bater nos alunos de Pastinha em rodas compartilhadas.'
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
-- PHASE 2: UPSERT STATEMENTS
-- ============================================================

-- Source: statements/persons/almiro.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Almiro
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Almiro is the SUBJECT.
-- ============================================================

-- Almiro student_of Vermelho 27
-- Based on available sources: Almiro received his mestre certification in 1983 at
-- Academia do Bimba during Vermelho 27's leadership. No sources found confirming
-- direct training under Mestre Bimba, though his estimated birth year (~1950) would
-- have made this possible.
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
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Received mestre 1983 at Academia do Bimba during Vermelho 27 leadership; no sources found confirming direct Bimba training',
  E'Based on available sources, Vermelho 27 appears to have been his primary teacher. Almiro received his mestre certification in 1983 at Academia do Bimba, during the period when Vermelho 27 led the school. No sources found confirming direct training under Mestre Bimba, though his estimated birth year (~1950) would have made this possible.',
  E'Com base nas fontes disponíveis, Vermelho 27 parece ter sido seu professor principal. Almiro recebeu sua certificação de mestre em 1983 na Academia do Bimba, durante o período em que Vermelho 27 liderava a escola. Nenhuma fonte encontrada confirmando treinamento direto sob Mestre Bimba, embora seu ano de nascimento estimado (~1950) teria tornado isso possível.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Almiro' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Almiro received_title_from Vermelho 27 (inferred)
-- Received mestre title in 1983 at Academia do Bimba while Vermelho 27 led it
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'BBAC website: received Mestre certification at Academia do Bimba in 1983',
  E'Received Mestre certification at the Academia do Bimba in 1983. Vermelho 27 was leading the academy at this time, making him the likely conferrer of the title.',
  E'Recebeu certificação de Mestre na Academia do Bimba em 1983. Vermelho 27 estava liderando a academia nesta época, tornando-o o provável conferidor do título.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Almiro' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Almiro leads Associação de Capoeira Mestre Bimba (1983-1986) - group not yet imported
-- Almiro departed_from Associação de Capoeira Mestre Bimba (1986, neutral - invited to USA)
-- Almiro founded Bahia Brazil Art Center (2004) - group added to backlog
-- Almiro cultural_pioneer_of USA Pacific Northwest (1986) - person-to-region, not standard predicate

-- Source: statements/persons/bamba.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bamba
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Bamba is the SUBJECT.
-- ============================================================

-- Bamba student_of Vermelho 27
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  '1996-05-18'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira interview; Lalaue; UNICAR München',
  E'Primary mestre at ACMB. Bamba began training at the Associação de Capoeira Mestre Bimba in 1977, introduced by Vermelho Boxel. Trained under Vermelho 27 until his death on May 18, 1996. Received mestre diploma from Vermelho 27.',
  E'Mestre principal na ACMB. Bamba começou a treinar na Associação de Capoeira Mestre Bimba em 1977, apresentado por Vermelho Boxel. Treinou sob Vermelho 27 até sua morte em 18 de maio de 1996. Recebeu diploma de mestre de Vermelho 27.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bamba' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bamba received_title_from Vermelho 27
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'Portal Capoeira interview',
  E'Received mestre diploma from Vermelho 27. Exact date unknown.',
  E'Recebeu diploma de mestre de Vermelho 27. Data exata desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bamba' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Bamba trained_under Vermelho Boxel (Cecílio de Jesus Calheiros) - first mestre, street training 1977; needs import
-- Bamba trained_under Coringa - assisted at ACMB; needs import
-- Bamba trained_under Ferro Velho (Durval) - assisted at ACMB, great influence; pending in backlog
-- Bamba trained_under Boa Gente - assisted at ACMB; pending in backlog
-- Bamba trained_under Bahia - assisted at ACMB; pending in backlog
-- Bamba leads Associação de Capoeira Mestre Bimba (ACMB) - 1986-present; group pending in backlog

-- Source: statements/persons/cafune.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Cafuné
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Cafuné is the SUBJECT.
-- ============================================================

-- Cafuné student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'A TARDE 2018, Blog do Márcio Wesley 2021, Clínica de Capoeira 2014',
  E'Began training in 1966 after reading newspaper interview with Bimba. Traveled from Polo Petroquímico de Camaçari to Pelourinho. Graduated August 1967. Remained until Bimba left for Goiânia in 1971.',
  E'Começou a treinar em 1966 após ler entrevista de Bimba em jornal. Viajou do Polo Petroquímico de Camaçari ao Pelourinho. Formou-se em agosto de 1967. Permaneceu até Bimba partir para Goiânia em 1971.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cafuné' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cafuné baptized_by Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"baptism": {"apelido_given": "Cafuné", "location": "Nordeste de Amaralina, Salvador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'A TARDE 2018, Blog do Márcio Wesley 2021, Portal Capoeira',
  E'Received apelido at batizado ceremony in Nordeste de Amaralina. Bimba declared: "his name is Cafuné—he doesn''t play capoeira, he does cafuné" (a gentle caress).',
  E'Recebeu apelido na cerimônia de batizado no Nordeste de Amaralina. Bimba declarou: "o nome dele é Cafuné—ele não joga capoeira, ele faz cafuné" (um carinho suave).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cafuné' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cafuné associated_with Nenel
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1994-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Works together at Fundação Mestre Bimba and Filhos de Bimba Escola de Capoeira, travels internationally for workshops"}'::jsonb,
  'verified'::genealogy.confidence,
  'Fundação Mestre Bimba website, A TARDE 2018',
  E'Cafuné works with Nenel at Fundação Mestre Bimba (member of Curator Council) and Filhos de Bimba Escola de Capoeira. They travel together conducting workshops.',
  E'Cafuné trabalha com Nenel na Fundação Mestre Bimba (membro do Conselho Curador) e Filhos de Bimba Escola de Capoeira. Viajam juntos conduzindo oficinas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cafuné' AND o.apelido = 'Nenel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (groups not yet in dataset)
-- ============================================================
-- Cafuné member_of Fundação Mestre Bimba - needs group import first
-- Cafuné member_of Filhos de Bimba Escola de Capoeira - needs group import first

-- Source: statements/persons/camisa.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Camisa
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Camisa is the SUBJECT.
-- ============================================================

-- Camisa trained_under Camisa Roxa (initial training, brother)
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
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-connection.com, lalaue.com, abadarodos.wordpress.com',
  E'Camisa began learning capoeira at age 7 from his older brother Camisa Roxa at Fazenda Estiva. From 1963, Camisa Roxa taught the lessons he learned at Bimba''s academy to his younger siblings.',
  E'Camisa começou a aprender capoeira aos 7 anos com seu irmão mais velho Camisa Roxa na Fazenda Estiva. A partir de 1963, Camisa Roxa ensinava aos irmãos mais novos as lições que aprendia na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa student_of Bimba (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-connection.com, lalaue.com, capoeirahistory.com, Wikipedia',
  E'Joined Mestre Bimba''s academy in Salvador at age 12 (1967). Graduated as aluno formado at age 14 in 1969. Fourth family member to graduate from Bimba''s course. Graduation companions: Macarrão, Onça Negra, Torpedo.',
  E'Ingressou na academia de Mestre Bimba em Salvador aos 12 anos (1967). Formou-se como aluno formado aos 14 anos em 1969. Quarto membro da família a formar no curso de Bimba. Companheiros de formatura: Macarrão, Onça Negra, Torpedo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa family_of Camisa Roxa (brothers)
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
  '{"relationship_type": "brothers"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, Wikipedia, all sources',
  E'Youngest of four brothers who trained with Mestre Bimba. Camisa Roxa was eldest brother and first teacher.',
  E'Caçula de quatro irmãos que treinaram com Mestre Bimba. Camisa Roxa era irmão mais velho e primeiro professor.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Note: Camisa's family connections to Ermival and Pedrinho are implicit
-- through their shared family_of relationship to Camisa Roxa.
-- See ermival.sql and pedrinho-carneiro.sql for their family_of statements.

-- Camisa associated_with Nenel (training companions at Bimba)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training companions at Mestre Bimba''s academy"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-connection.com interview',
  E'Trained together at Mestre Bimba''s academy in Salvador. Camisa mentioned Nenel among his training companions.',
  E'Treinaram juntos na academia de Mestre Bimba em Salvador. Camisa mencionou Nenel entre seus companheiros de treino.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Nenel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa associated_with Nestor Capoeira (film, Senzala)
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
  '{"association_context": "film Cordão de Ouro (1977), Grupo Senzala colleagues"}'::jsonb, 'verified'::genealogy.confidence,
  'IMDB, Portal Capoeira, multiple sources',
  E'Appeared together in film "Cordão de Ouro" (1977). Both were members of Grupo Senzala in Rio de Janeiro.',
  E'Apareceram juntos no filme "Cordão de Ouro" (1977). Ambos eram membros do Grupo Senzala no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Nestor Capoeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa associated_with Leopoldina (film)
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
  '{"association_context": "film Cordão de Ouro (1977)"}'::jsonb, 'verified'::genealogy.confidence,
  'IMDB, Portal Capoeira',
  E'Appeared together in film "Cordão de Ouro" (1977). Leopoldina played berimbau and sang while Camisa performed capoeira.',
  E'Apareceram juntos no filme "Cordão de Ouro" (1977). Leopoldina tocava berimbau e cantava enquanto Camisa jogava capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa associated_with Moraes (Spring Encounter 1992)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1992-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1992 Spring Encounter in Salzburg, Austria"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com',
  E'Participated together in the first Spring Encounter in Salzburg, Austria (1992), organized by Camisa Roxa. Event included Camisa, Moraes, and Mestre Santana.',
  E'Participaram juntos do primeiro Encontro de Primavera em Salzburg, Áustria (1992), organizado por Camisa Roxa. Evento incluiu Camisa, Moraes e Mestre Santana.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa' AND s.apelido_context IS NULL AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Camisa founded Abadá-Capoeira - group needs import first
-- Camisa member_of Grupo Senzala - group needs import first
-- Camisa member_of Olodum Maré - group needs import first
-- Camisa associated_with Macarrão - graduation companion 1969, needs import
-- Camisa associated_with Onça Negra - graduation companion 1969, needs import
-- Camisa associated_with Torpedo - graduation companion 1969, needs import
-- Camisa associated_with Peixinho (Senzala) - film "Cordão de Ouro", Senzala colleague, in backlog
-- Camisa associated_with Santana (Abadá) - 1992 Spring Encounter, in backlog

-- Source: statements/persons/carlos-senna.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Carlos Senna
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Carlos Senna is the SUBJECT.
-- ============================================================

-- Carlos Senna student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-01-01'::date, 'year'::genealogy.date_precision,
  '1955-10-25'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'ABCA, Capoeira News, Velhos Mestres',
  E'Carlos Senna began training at Mestre Bimba''s Centro de Cultura Física Regional in 1949 at age 18. He completed his formatura (graduation) in 1950, earned the nickname "Senna Preto," was appointed Technical Director in 1954, and departed on October 25, 1955 to found Senavox.',
  E'Carlos Senna começou a treinar no Centro de Cultura Física Regional de Mestre Bimba em 1949 aos 18 anos. Completou sua formatura em 1950, ganhou o apelido "Senna Preto," foi nomeado Diretor Técnico em 1954, e partiu em 25 de outubro de 1955 para fundar a Senavox.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Carlos Senna associated_with Itapoan (co-founded IBEC; transferred Bimba's remains)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "IBEC co-founders; transferred Mestre Bimba''s remains together"}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira News, ABCA, books.scielo.org',
  E'Carlos Senna and Itapoan were fellow students of Mestre Bimba who maintained a professional relationship. In July 1978, they traveled to Goiânia with Dona Alice to retrieve Mestre Bimba''s remains and transfer them to Salvador. They were also co-founders of IBEC (Instituto Brasileiro de Estudos de Capoeira).',
  E'Carlos Senna e Itapoan foram colegas alunos de Mestre Bimba que mantiveram relação profissional. Em julho de 1978, viajaram a Goiânia com Dona Alice para resgatar os restos mortais de Mestre Bimba e transferi-los para Salvador. Também foram cofundadores do IBEC (Instituto Brasileiro de Estudos de Capoeira).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Carlos Senna associated_with Acordeon (co-founded IBEC)
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
  '{"association_context": "IBEC co-founders"}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira News, ABCA, books.scielo.org',
  E'Carlos Senna and Acordeon were co-founders of IBEC (Instituto Brasileiro de Estudos de Capoeira), along with Arára, Itapoan, and Sacy.',
  E'Carlos Senna e Acordeon foram cofundadores do IBEC (Instituto Brasileiro de Estudos de Capoeira), junto com Arára, Itapoan e Sacy.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Carlos Senna associated_with Saci (co-founded IBEC)
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
  '{"association_context": "IBEC co-founders"}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira News, ABCA, books.scielo.org',
  E'Carlos Senna and Sacy were co-founders of IBEC (Instituto Brasileiro de Estudos de Capoeira), along with Arára, Itapoan, and Acordeon.',
  E'Carlos Senna e Sacy foram cofundadores do IBEC (Instituto Brasileiro de Estudos de Capoeira), junto com Arára, Itapoan e Acordeon.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Saci'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Carlos Senna associated_with Arára - IBEC co-founder; needs import first
-- Carlos Senna family_of Yoji Senna - son (Mestre Yoji Senna); needs import first

-- Source: statements/persons/cisnando.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Cisnando
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Cisnando is the SUBJECT.
-- ============================================================

-- Cisnando student_of Bimba (~1932-1974)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1932-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeiradabahia.portalcapoeira.com/dr-jos-qcisnandoq-lima-a-pedra-fundamental-da-regional/',
  E'Cisnando found Bimba in the Curuzú neighborhood of Liberdade while studying medicine. Though initially refused because capoeira was "for Black people," Cisnando endured Bimba''s gravata test (three minutes in a neck lock) and was accepted. More than a student, Cisnando became a collaborator who contributed academic methodology to Bimba''s system.',
  E'Cisnando encontrou Bimba no bairro do Curuzú, na Liberdade, enquanto estudava medicina. Embora inicialmente recusado porque capoeira era "para gente preta," Cisnando suportou o teste da gravata de Bimba (três minutos em uma chave de pescoço) e foi aceito. Mais que um aluno, Cisnando tornou-se um colaborador que contribuiu com metodologia acadêmica para o sistema de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cisnando' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cisnando trained_under Takeo Yano (jiu-jitsu, before 1932)
-- NOTE: Takeo Yano is not in genealogy database - not a capoeirista
-- This relationship is documented in notes_en/notes_pt only

-- Cisnando associated_with Decânio (fellow pillars of Regional)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both were university-educated students of Bimba who formed the two intellectual pillars of Capoeira Regional. Both contributed academic methodology and institutional legitimacy to the art.", "pt": "Ambos eram alunos universitários de Bimba que formaram os dois pilares intelectuais da Capoeira Regional. Ambos contribuíram com metodologia acadêmica e legitimidade institucional para a arte."}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira-da-bahia/dr-jose-qcisnandoq-lima-a-pedra-fundamental-da-regional/',
  E'Cisnando (Initial Phase, 1930-1937) and Decânio (Consolidation Phase, from 1938) formed the two intellectual "pillars" upon which Bimba built Capoeira Regional. Both were university-educated professionals (medicine) who gave the art academic structure and social legitimacy.',
  E'Cisnando (Fase Inicial, 1930-1937) e Decânio (Fase de Consolidação, a partir de 1938) formaram os dois "pilares" intelectuais sobre os quais Bimba construiu a Capoeira Regional. Ambos eram profissionais com educação universitária (medicina) que deram à arte estrutura acadêmica e legitimidade social.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cisnando' AND o.apelido = 'Decânio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Cisnando trained_under Takeo Yano (jiu-jitsu) - NOT APPLICABLE: Yano not a capoeirista, will not be imported
-- Cisnando trained_under Takamatsu (karate) - NOT APPLICABLE: Takamatsu not a capoeirista, will not be imported
-- Cisnando trained_under Mitsuyo Maeda (jiu-jitsu) - DISPUTED: Some sources mention, primary sources do not confirm; Maeda not a capoeirista
--
-- NOTE: The Centro de Cultura Física e Luta Regional (Bimba's academy) is in groups-backlog.md.
-- Once imported, a member_of relationship could be added, but Cisnando's relationship was more
-- collaborative than formal membership - he helped BUILD the academy/system.

-- Source: statements/persons/damiao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Damião
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Damião is the SUBJECT.
-- ============================================================

-- Damião student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources confirm Damião trained under Bimba from late 1945, graduating formado in 1947',
  'Started at age 16-17 in Salvador; received formado medal and diploma from Bimba in 1947',
  'Começou aos 16-17 anos em Salvador; recebeu medalha e diploma de formado do Bimba em 1947'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Damião' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Damião received_title_from Bimba (formado)
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
  '{"title_grant": {"title": "formado"}}'::jsonb, 'verified'::genealogy.confidence,
  'Damião received formado (medal and diploma) from Mestre Bimba in 1947',
  'Received formado graduation with medal and diploma from Mestre Bimba',
  'Recebeu graduação de formado com medalha e diploma do Mestre Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Damião' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Damião co_founded Besouro Mangangá - group needs import first
-- Founded May 16, 1971 with Mestre Esdras (son) and Mestre Lobão

-- Damião associated_with Mestre Lobão - person needs import first
-- Co-founded Besouro Mangangá together in 1971; Lobão still active

-- Damião associated_with Mestre Esdras (Esdras Filho) - person needs import first
-- His son; co-founder of Besouro Mangangá; began learning age 7 in 1960

-- Damião cultural_pioneer_of São Paulo - indirect relationship
-- First to formally teach Capoeira Regional in São Paulo academy (1950-1951)

-- Damião associated_with Mestre Suassuna - person needs import check
-- Consulted on naming of Besouro Mangangá academy

-- Source: statements/persons/edinho.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Edinho
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Edinho is the SUBJECT.
-- ============================================================

-- Edinho student_of Bimba
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
  'Portal Capoeira; Cativeiro.de; Capoeira Connection lectures',
  E'Edinho was a student at Bimba''s Centro de Cultura Física e Luta Regional in Salvador. Start and end dates unknown. Edinho died before Bimba (1974).',
  E'Edinho foi aluno do Centro de Cultura Física e Luta Regional de Bimba em Salvador. Datas de início e fim desconhecidas. Edinho morreu antes de Bimba (1974).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edinho' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Edinho received_title_from Bimba (lenço branco / mestre)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "symbol": "lenço branco (white handkerchief)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Itapoan lecture (Capoeira Connection); Mestre Edinho quote (Portal Capoeira); Cativeiro.de',
  E'One of only four students to receive the lenço branco (white handkerchief) directly from Mestre Bimba''s hands—the highest honor in Capoeira Regional. The four recipients were: Decânio, Jair Moura, Miranda, and Edinho. Exact date unknown but before Bimba''s death (1974).',
  E'Um dos apenas quatro alunos a receber o lenço branco diretamente das mãos de Mestre Bimba—a maior honra na Capoeira Regional. Os quatro destinatários foram: Decânio, Jair Moura, Miranda e Edinho. Data exata desconhecida mas antes da morte de Bimba (1974).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edinho' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/ermival.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Ermival
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Ermival is the SUBJECT.
-- ============================================================

-- Ermival student_of Bimba (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com, camisaroxa.com',
  E'Followed his older brother Camisa Roxa to Mestre Bimba''s academy in Salvador. Graduated as aluno formado alongside brothers Pedrinho and José Tadeu (Mestre Camisa).',
  E'Seguiu seu irmão mais velho Camisa Roxa até a academia de Mestre Bimba em Salvador. Formou-se como aluno formado junto com os irmãos Pedrinho e José Tadeu (Mestre Camisa).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ermival' AND s.apelido_context IS NULL AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ermival family_of Camisa Roxa (brothers)
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
  '{"relationship_type": "brothers"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com',
  E'Ermival was a younger brother of Camisa Roxa. Both were born at Fazenda Estiva, Jacobina, Bahia. Camisa Roxa brought Ermival to train with Mestre Bimba after becoming family patriarch.',
  E'Ermival era irmão mais novo de Camisa Roxa. Ambos nasceram na Fazenda Estiva, Jacobina, Bahia. Camisa Roxa levou Ermival para treinar com Mestre Bimba após tornar-se patriarca da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ermival' AND s.apelido_context IS NULL AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Note: Ermival's family connections to Pedrinho and Camisa are implicit
-- through their shared family_of relationship to Camisa Roxa.
-- All four brothers point to Camisa Roxa as eldest brother and family patriarch.

-- Source: statements/persons/formiga.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Formiga
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Formiga is the SUBJECT.
-- ============================================================

-- Formiga student_of Bimba (his father, primary teacher)
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
  '1967-06-01'::date, 'month'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Capoeira Connection, Fundação Mestre Bimba',
  'Trained under his father at Centro de Cultura Física Regional in Salvador; graduated June 1967 alongside half-brother Nenel',
  'Treinou com seu pai no Centro de Cultura Física Regional em Salvador; formou-se em junho de 1967 junto com o meio-irmão Nenel'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga family_of Bimba (son)
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
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Fundação Mestre Bimba, Wikipedia',
  'Son of Mestre Bimba with Dona Nair; one of 13 children',
  'Filho de Mestre Bimba com Dona Nair; um de 13 filhos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga family_of Nenel (half-brother)
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
  '{"relationship_type": "half-brother"}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Fundação Mestre Bimba',
  'Half-brothers; different mothers (Formiga: Dona Nair; Nenel: Berenice da Conceição Nascimento); same father (Bimba); graduated together June 1967; taught together in Goiânia 1973-1974',
  'Meios-irmãos; mães diferentes (Formiga: Dona Nair; Nenel: Berenice da Conceição Nascimento); mesmo pai (Bimba); formaram-se juntos em junho de 1967; ensinaram juntos em Goiânia 1973-1974'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND o.apelido = 'Nenel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga associated_with Frede Abreu (collaboration on UFBA Honoris Causa speech)
-- NOTE: Frede Abreu is not in dataset yet - adding to pending relationships

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Formiga associated_with Frede Abreu - Co-wrote UFBA Honoris Causa speech (1996); needs import first
-- Formiga family_of Mestre Luís (Luiz Lopes Machado / Melodia) - Full brother (same mother Dona Nair); needs import first
-- Formiga co_founded FUMEB (Fundação Mestre Bimba) - Mentor/co-founder alongside Nenel (1994); group needs import first

-- Source: statements/persons/franklin.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Franklin
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Franklin is the SUBJECT.
-- ============================================================

-- Franklin student_of Ezequiel
-- Ezequiel exists in dataset (docs/genealogy/sql-imports/entities/persons/ezequiel.sql)
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
  'velhosmestres.com, IPHAN Capoeira Portal, Grupo Luanda Zürich website',
  'Franklin was among Ezequiel''s first students. He helped found Grupo Luanda with Ezequiel in 1964.',
  'Franklin estava entre os primeiros alunos de Ezequiel. Ajudou a fundar o Grupo Luanda com Ezequiel em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Franklin' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Franklin co_founded Grupo Luanda - Grupo Luanda is in groups-backlog, not yet imported
-- When Grupo Luanda is imported, add:
-- INSERT INTO genealogy.statements (...) SELECT 'person', s.id, 'co_founded', 'group', g.id,
--   '1964-01-01', 'year', NULL, NULL, '{}'::jsonb, 'verified',
--   'velhosmestres.com, IPHAN', 'Co-founded with Mestre Ezequiel', '...'
-- FROM genealogy.person_profiles s, genealogy.group_profiles g
-- WHERE s.apelido = 'Franklin' AND g.name = 'Grupo Luanda';

-- Source: statements/persons/galo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Galo (Luciano José Costa Figueiredo)
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Galo is the SUBJECT.
-- Per ownership rule: statements go in the file named after the SUBJECT.
-- ============================================================

-- ============================================================
-- TEACHER RELATIONSHIP: Galo student_of Bimba
-- ============================================================
-- Galo trained at Mestre Bimba's Centro de Cultura Física e Luta Regional
-- Graduated with lenço azul (formado status) during propagation phase (1967-1973)

INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  '1973-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Hélio Campos (Mestre Xaréu), "Capoeira Regional: a escola de Mestre Bimba" (UFBA); Esdras M. Santos, "Conversando sobre capoeira"',
  E'Trained at Centro de Cultura Física e Luta Regional in Terreiro de Jesus, Salvador. Graduated with lenço azul (blue handkerchief) indicating formado status. Listed among notable students of the propagation phase (1967-1973). Graduated alongside Eziquiel Martins Marinho (Mestre Ezequiel).',
  E'Treinou no Centro de Cultura Física e Luta Regional no Terreiro de Jesus, Salvador. Formou-se com lenço azul indicando status de formado. Listado entre os alunos notáveis da fase de propagação (1967-1973). Formou-se ao lado de Eziquiel Martins Marinho (Mestre Ezequiel).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TRAINING COMPANION: Galo associated_with Ezequiel
-- ============================================================
-- Graduated lenço azul together at Mestre Bimba's academy

INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraNews (Texto: Boa Alma); Hélio Campos (Mestre Xaréu), UFBA repository',
  E'Training companions at Mestre Bimba''s academy. Graduated lenço azul (blue handkerchief, formado status) together in the same graduation ceremony.',
  E'Companheiros de treino na academia de Mestre Bimba. Formaram-se com lenço azul (status de formado) juntos na mesma cerimônia de formatura.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TRAINING COMPANION: Galo associated_with Itapoan
-- ============================================================
-- Participated together in Candomblé visit with Mestre Bimba

INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'Hélio Campos (Mestre Xaréu), "Capoeira Regional: a escola de Mestre Bimba" (UFBA)',
  E'Training companions at Mestre Bimba''s academy. Participated together in visit to Mãe Alice''s Candomblé terreiro (Oiá Padê da Riméia) at Alto da Santa Cruz, alongside Russo, Bolão, and Xaréu.',
  E'Companheiros de treino na academia de Mestre Bimba. Participaram juntos da visita ao terreiro de Candomblé de Mãe Alice (Oiá Padê da Riméia) no Alto da Santa Cruz, junto com Russo, Bolão e Xaréu.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Galo associated_with Russo (Eglon) - participated in Candomblé visit together
--   Russo not yet imported; add to backlog
-- Galo associated_with Bolão (José Valmório de Lacerda) - participated in Candomblé visit together
--   Bolão not yet imported; add to backlog
-- Galo associated_with Xaréu (Hélio Campos) - participated in Candomblé visit together
--   Xaréu in backlog but not yet imported
-- Galo associated_with Boinha (Batista Sampaio) - fellow propagation phase student
--   Boinha not yet imported; add to backlog
-- Galo associated_with Prego (Roberto Fernando Diez) - fellow propagation phase student
--   Prego not yet imported; add to backlog
-- Galo associated_with Arara (Fernando Vasconcelos) - fellow propagation phase student
--   Arara not yet imported; add to backlog
-- Galo associated_with Volta Grande (Jorge Valente) - fellow propagation phase student
--   Volta Grande not yet imported; add to backlog
-- Galo associated_with Macaco (Gilson Sacramento) - fellow propagation phase student
--   Macaco not yet imported; add to backlog
-- Galo associated_with Canhão (Augusto Salvador Brito) - fellow propagation phase student
--   Canhão not yet imported; add to backlog

-- Source: statements/persons/miranda.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Miranda
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Miranda is the SUBJECT.
-- ============================================================

-- Miranda student_of Bimba (primary teacher relationship)
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
  'Mestre Edinho depoimento (Portal Capoeira); Mestre Itapoan lecture (Capoeira Connection)',
  E'One of only four students to receive the white handkerchief (mestre graduation) directly from Mestre Bimba. Trained at Centro de Cultura Física e Luta Regional in Salvador. Exact training dates unknown.',
  E'Um dos apenas quatro alunos a receber o lenço branco (graduação de mestre) diretamente de Mestre Bimba. Treinou no Centro de Cultura Física e Luta Regional em Salvador. Datas exatas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Miranda' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Miranda received_title_from Bimba (white handkerchief / mestre)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "lenço branco ceremony"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Edinho depoimento (Portal Capoeira); Mestre Itapoan lecture (Capoeira Connection)',
  E'One of only four students to receive the white handkerchief (lenço branco) directly from Mestre Bimba during his lifetime. The others were Decânio, Jair Moura, and Edinho.',
  E'Um dos apenas quatro alunos a receber o lenço branco diretamente de Mestre Bimba durante sua vida. Os outros foram Decânio, Jair Moura e Edinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Miranda' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/omar.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Omar
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Omar is the SUBJECT.
-- ============================================================

-- Omar student_of Ezequiel
-- Primary teacher from age 12 at Escola de Capoeira Mestre Bimba
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
  '1985-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-uniao.ch/mestre-omar; lalaue.com/baden/capoeira-uniao',
  E'Omar began training with Mestre Ezequiel at age 12 (~1969) at the Escola de Capoeira Mestre Bimba in Salvador. Training continued until Omar moved to Switzerland in 1985. Ezequiel later traveled to Baden to personally elevate Omar to mestre (1996).',
  E'Omar começou a treinar com Mestre Ezequiel aos 12 anos (~1969) na Escola de Capoeira Mestre Bimba em Salvador. O treinamento continuou até Omar se mudar para a Suíça em 1985. Ezequiel mais tarde viajou para Baden para pessoalmente elevar Omar a mestre (1996).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Omar' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Omar received_title_from Ezequiel
-- Received Mestre title on August 30, 1996 in Baden, Switzerland
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1996-08-30'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "Academia de Capoeira União inauguration", "location": "Baden, Switzerland"}}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira-uniao.ch/mestre-omar; capoeira-muenchen.de/en/capoeira/the-masters',
  E'Mestre Ezequiel traveled from Brazil to Baden, Switzerland to inaugurate the Academia de Capoeira União and personally presented Omar with the white corda (mestre title). This was one of Ezequiel''s final acts as a teacher before his death in March 1997.',
  E'Mestre Ezequiel viajou do Brasil para Baden, Suíça, para inaugurar a Academia de Capoeira União e pessoalmente apresentou a Omar a corda branca (título de mestre). Este foi um dos últimos atos de Ezequiel como professor antes de sua morte em março de 1997.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Omar' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: cultural_pioneer_of Switzerland info is stored in Omar's
-- achievements and bio rather than as a statement, since statements
-- require an object entity (person or group).
-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Omar founded Grupo de Capoeira União (1994)
-- NEEDS: Grupo de Capoeira União group import first
-- Founded 1994; HQ Itaparica, Bahia; IPHAN registered (Ponto de Cultura, Ponto de Memória)

-- ============================================================
-- NOTE ON STUDENTS
-- ============================================================
-- Student relationships flow FROM student TO teacher, so if Omar
-- has documented students with profiles, their student_of statements
-- would go in their respective SQL files.
-- Current IPHAN data shows: 12 contra-mestres, 16 professors

-- Source: statements/persons/pedrinho-carneiro.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Pedrinho (Carneiro)
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Pedrinho (Carneiro) is the SUBJECT.
-- ============================================================

-- Pedrinho (Carneiro) student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, jogosfemininosabada.wordpress.com, ABADÁ sources',
  E'Trained at Mestre Bimba''s academy in Salvador alongside brothers Ermival and José Tadeu (Camisa). Graduated as aluno formado. Start date estimated mid-1960s based on family timeline.',
  E'Treinou na academia de Mestre Bimba em Salvador junto com os irmãos Ermival e José Tadeu (Camisa). Formou-se como aluno formado. Data de início estimada em meados dos anos 1960 com base na cronologia familiar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedrinho' AND s.apelido_context = 'Carneiro' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pedrinho (Carneiro) family_of Camisa Roxa
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
  'portalcapoeira.com, jogosfemininosabada.wordpress.com, velhosmestres.com',
  E'Younger brother of Camisa Roxa. Both were born at Fazenda Estiva, Jacobina, Bahia.',
  E'Irmão mais novo de Camisa Roxa. Ambos nasceram na Fazenda Estiva, Jacobina, Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedrinho' AND s.apelido_context = 'Carneiro' AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Note: Pedrinho's family connections to Ermival and Camisa are implicit
-- through their shared family_of relationship to Camisa Roxa.
-- All four brothers point to Camisa Roxa as eldest brother and family patriarch.

-- Source: statements/persons/saci.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Saci
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Saci is the SUBJECT.
-- ============================================================

-- Saci student_of Bimba (July 1964 - 1974)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-07-01'::date, 'month'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'UNICAR München (capoeira-muenchen.de)',
  E'Trained at Mestre Bimba''s Centro de Cultura Física e Luta Regional from July 1964 until Bimba''s death in February 1974. Witnessed historical developments at the academy.',
  E'Treinou no Centro de Cultura Física e Luta Regional de Mestre Bimba a partir de julho de 1964 até a morte de Bimba em fevereiro de 1974. Testemunhou desenvolvimentos históricos na academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Saci' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Note: The following relationships involve entities not yet imported.
-- These should be added once the corresponding person profiles exist.
--
-- STUDENTS OF SACI (where Saci taught, so THEY are student_of Saci):
-- - Ezequiel student_of Saci - Already exists in ezequiel.sql statements
-- - Binal student_of Saci - Needs Binal profile first
-- - Nelsinho received_title_from Saci - Needs Nelsinho profile first
-- - Saguin received_title_from Saci - Needs Saguin profile first
--
-- These statements should go in the STUDENT's file (not Saci's) per ownership rule.
-- ============================================================

-- Source: statements/persons/camisa-roxa.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Camisa Roxa
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Camisa Roxa is the SUBJECT.
-- ============================================================

-- Camisa Roxa student_of Bimba (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com, capoeira-connection.com',
  E'Entered Mestre Bimba''s academy in Salvador in 1962 or 1963. Considered the best student by his Mestre. Graduated as aluno formado.',
  E'Entrou na academia de Mestre Bimba em Salvador em 1962 ou 1963. Considerado o melhor aluno por seu Mestre. Formou-se como aluno formado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa trained_under Pastinha (roda participation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'abadarodos.wordpress.com, velhosmestres.com',
  E'Enjoyed playing in the traditional rodas at Mestre Pastinha''s academy. Part of his effort to bridge Regional and Angola styles.',
  E'Gostava de jogar nas rodas tradicionais da academia de Mestre Pastinha. Parte de seu esforço para unir os estilos Regional e Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa trained_under Waldemar (roda participation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'abadarodos.wordpress.com, velhosmestres.com, capoeiradobrasil.com.br',
  E'Played in the rodas of Mestres Waldemar and Traíra on Rua Pero Vaz in Liberdade, Salvador. Highly respected for his posture and knowledge of capoeira fundamentals.',
  E'Jogava nas rodas dos Mestres Waldemar e Traíra na Rua Pero Vaz, na Liberdade, Salvador. Muito respeitado por sua postura e conhecimento dos fundamentos da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa trained_under Traíra (roda participation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'abadarodos.wordpress.com, velhosmestres.com, capoeiradobrasil.com.br',
  E'Played in the rodas of Mestres Waldemar and Traíra on Rua Pero Vaz in Liberdade, Salvador. Highly respected for his posture and knowledge of capoeira fundamentals.',
  E'Jogava nas rodas dos Mestres Waldemar e Traíra na Rua Pero Vaz, na Liberdade, Salvador. Muito respeitado por sua postura e conhecimento dos fundamentos da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND s.apelido_context IS NULL AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa associated_with João Grande (photographed together)
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
  '{"association_context": "photographed together, fellow mestres"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com',
  E'Photographed together at capoeira events. Both are major figures in capoeira history.',
  E'Fotografados juntos em eventos de capoeira. Ambos são figuras importantes na história da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================
-- Note: family_of relationships for the Carneiro brothers are defined
-- in their respective files (ermival.sql, pedrinho-carneiro.sql, camisa.sql)
-- pointing TO Camisa Roxa as the eldest brother and family patriarch.
-- This avoids redundant bi-directional relationships.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Camisa Roxa associated_with Mestre Moraes - 1992 Spring Encounter, Moraes is in dataset
-- Camisa Roxa associated_with Mestre Santana - 1992 Spring Encounter, needs import
-- Camisa Roxa associated_with Domingos Campos - co-led Brasil Tropical, needs import
-- Camisa Roxa received_title_from Abadá-Capoeira - Grão-Mestre 1989, group needs import
-- Camisa Roxa leads Abadá-Capoeira (Europe) - group needs import
-- Camisa Roxa founded Brasil Tropical - group needs import
-- Camisa Roxa co_founded Olodum Maré - group needs import

-- Source: statements/persons/decanio.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Decânio
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Decânio is the SUBJECT.
-- ============================================================

-- Decânio student_of Bimba (1938-1974)
-- Primary teacher-student relationship spanning 36 years
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Capoeira Connection, velhosmestres.com',
  'Decânio began training with Bimba in 1938 at age 16 while studying medicine. He kept this secret from his family initially. Bimba adopted him "like a son" from the first day. The relationship lasted 36 years until Bimba''s death on February 5, 1974.',
  'Decânio começou a treinar com Bimba em 1938 aos 16 anos enquanto estudava medicina. Ele manteve isso em segredo de sua família inicialmente. Bimba o adotou "como filho" desde o primeiro dia. O relacionamento durou 36 anos até a morte de Bimba em 5 de fevereiro de 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Decânio received_title_from Bimba (white handkerchief / mestre)
-- One of only four students to receive the highest graduation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "symbol": "lenço branco (white handkerchief)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira Connection, Bimba entity SQL, multiple sources',
  'One of only four students formally graduated to mestre level (white handkerchief) by Mestre Bimba during his lifetime. The others were Jair Moura, Miranda, and Edinho (the latter two now deceased).',
  'Um dos apenas quatro alunos formalmente graduados ao nível de mestre (lenço branco) por Mestre Bimba durante sua vida. Os outros foram Jair Moura, Miranda e Edinho (os dois últimos já falecidos).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Decânio associated_with João Pequeno (neighbor and friend)
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
  '2011-02-01'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Neighbors and close friends in Paripe, Salvador. Decânio served on CEDANZE Council of Honor (2003)."}'::jsonb,
  'verified'::genealogy.confidence,
  'Portal Capoeira, CEDANZE website',
  'Decânio lived near João Pequeno in the Paripe neighborhood of Salvador (Subúrbio Ferroviário). They were close friends. When CEDANZE was formalized in 2003, Decânio served on its Council of Honor.',
  'Decânio morava perto de João Pequeno no bairro de Paripe em Salvador (Subúrbio Ferroviário). Eram amigos próximos. Quando o CEDANZE foi formalizado em 2003, Decânio serviu em seu Conselho de Honra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Decânio' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Decânio associated_with Sisnando (Cisnando Lima) - co-pillars of Capoeira Regional
--   -> Cisnando now imported (done)
-- Decânio associated_with Tiburcinho - brought Tiburcinho to Bimba
--   -> Tiburcinho pending import in persons-backlog.md
-- Decânio associated_with Mestre Jean Pangolin - mentee relationship
--   -> Mestre Jean Pangolin NOT in backlog (contemporary figure, may not need import)

-- Source: statements/persons/ezequiel.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Ezequiel
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Ezequiel is the SUBJECT.
-- ============================================================

-- Ezequiel student_of Bimba
-- Primary teacher at Centro de Cultura Física e Luta Regional
-- Graduated with lenço azul (blue handkerchief)
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
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-16; lalaue.com; capoeiranews.com.br',
  'Introduced to Bimba by Mestre Saci in the mid-1960s. Graduated with lenço azul alongside Mestre Galo. Training ended when Bimba left for Goiânia in 1972.',
  'Apresentado a Bimba por Mestre Saci em meados dos anos 1960. Formou-se com lenço azul junto com Mestre Galo. Treinamento terminou quando Bimba partiu para Goiânia em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ezequiel' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ezequiel associated_with Vermelho 27
-- Collaborated to maintain Bimba's academy after 1972
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
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Co-maintained Mestre Bimba''s academy at Terreiro de Jesus after Bimba left for Goiânia"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-16; lalaue.com',
  'Vermelho 27 purchased Bimba''s academy in 1972, and Ezequiel was chosen to help run the work there. Collaborated until at least the mid-1970s.',
  'Vermelho 27 comprou a academia de Bimba em 1972, e Ezequiel foi escolhido para ajudar a gerenciar o trabalho lá. Colaboraram pelo menos até meados dos anos 1970.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ezequiel' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ezequiel trained_under Saci
-- Mestre Saci (Josevaldo Lima de Jesus) introduced Ezequiel to Capoeira Regional
-- at Quartel dos Dendezeiros, then brought him to Bimba's academy
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
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-16; capoeira-muenchen.de',
  E'Saci was Ezequiel''s first formal capoeira teacher. They met through the Military Police; Saci trained him at Quartel dos Dendezeiros (Itapagipe) before bringing him to Mestre Bimba''s academy.',
  E'Saci foi o primeiro professor formal de capoeira de Ezequiel. Eles se conheceram através da Polícia Militar; Saci o treinou no Quartel dos Dendezeiros (Itapagipe) antes de levá-lo à academia de Mestre Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ezequiel' AND o.apelido = 'Saci'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Ezequiel associated_with Galo
-- Luciano Figueiredo (Mestre Galo) - graduated lenço azul together
-- Training companions at Bimba's academy
-- NEEDS: Mestre Galo import

-- ============================================================
-- PERSON-TO-GROUP RELATIONSHIPS
-- ============================================================

-- Ezequiel co_founded Grupo Luanda
-- Founded 1964 with Mestre Franklin
-- NEEDS: Grupo Luanda import

-- Ezequiel member_of Olodum/Olodumaré
-- Folkloric groups he participated in
-- NEEDS: Olodum/Olodumaré import (evaluate if capoeira-relevant)

-- ============================================================
-- NOTE ON STUDENTS
-- ============================================================
-- Student relationships flow FROM student TO teacher, so:
-- - Jelon Vieira student_of Ezequiel → goes in jelon-vieira.sql
-- - Omar student_of Ezequiel → goes in omar.sql
-- - Franklin student_of Ezequiel → goes in franklin.sql

-- Source: statements/persons/jair-moura.sql (CHANGED)
-- ============================================================
-- STATEMENTS FOR: Jair Moura
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Jair Moura is the SUBJECT.
-- ============================================================

-- Jair Moura student_of Bimba (late 1950s-1974)
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
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraWiki, Correio 24 Horas obituary, Mestre Nenel testimony',
  'Jair Moura began training with Mestre Bimba in the late 1950s. According to Mestre Nenel: "He was a student of my father since the 1950s." The relationship lasted until Bimba''s death on February 5, 1974. Nenel described him as "one of the guys most well-regarded by my father."',
  'Jair Moura começou a treinar com Mestre Bimba no final dos anos 1950. Segundo Mestre Nenel: "Ele era aluno de meu pai desde a década de 1950." A relação durou até a morte de Bimba em 5 de fevereiro de 1974. Nenel o descreveu como "um dos caras mais bem considerados pelo meu pai."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura received_title_from Bimba (white handkerchief / mestre)
-- The LAST of only four students to receive the highest graduation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "symbol": "lenço branco (white handkerchief)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Nenel testimony (Correio 24 Horas), CapoeiraWiki, multiple obituary sources',
  'One of only four students formally graduated to mestre level (white handkerchief) by Mestre Bimba during his lifetime. According to Mestre Nenel (Bimba''s son): "He was the last capoeirista to receive the Lenço Branco from my father." The others were Decânio, Miranda, and Edinho (the latter two deceased before Bimba).',
  'Um dos apenas quatro alunos formalmente graduados ao nível de mestre (lenço branco) por Mestre Bimba durante sua vida. Segundo Mestre Nenel (filho de Bimba): "Ele foi o último capoeirista a receber o Lenço Branco de meu pai." Os outros foram Decânio, Miranda e Edinho (os dois últimos falecidos antes de Bimba).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with Totonho de Maré (documented in "Dança de Guerra" 1968)
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
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring Totonho de Maré; also photographed together."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-12, CapoeiraWiki',
  'Jair Moura directed "Dança de Guerra" (1968) featuring Mestre Totonho de Maré. A photograph from 1968 shows Jair Moura and Mestre Maré together. Jair Moura also conducted an interview with Totonho de Maré (audio preserved at velhosmestres.com). In 1970, he wrote about Tiburcinho for A Tarde newspaper.',
  'Jair Moura dirigiu "Dança de Guerra" (1968) com Mestre Totonho de Maré. Uma fotografia de 1968 mostra Jair Moura e Mestre Maré juntos. Jair Moura também conduziu uma entrevista com Totonho de Maré (áudio preservado em velhosmestres.com). Em 1970, escreveu sobre Tiburcinho para o jornal A Tarde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with Noronha (documented in "Dança de Guerra" 1968)
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
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring Noronha in a vadiação with Totonho de Maré."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-12, CapoeiraWiki',
  'Jair Moura directed "Dança de Guerra" (1968) which included a brief vadiação between Mestres Noronha and Maré. The Instituto Jair Moura (founded by Frede Abreu) later proposed the "Centenário do Mestre Noronha" based on Noronha''s birth date from his death certificate.',
  'Jair Moura dirigiu "Dança de Guerra" (1968) que incluiu uma breve vadiação entre Mestres Noronha e Maré. O Instituto Jair Moura (fundado por Frede Abreu) posteriormente propôs o "Centenário do Mestre Noronha" baseado na data de nascimento de Noronha em sua certidão de óbito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with João Grande (documented in "Dança de Guerra" 1968)
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
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring João Grande."}'::jsonb,
  'likely'::genealogy.confidence,
  'SecultBA note, CapoeiraWiki (some sources list João Grande in the documentary)',
  'Jair Moura directed "Dança de Guerra" (1968). Some sources (including SecultBA official note) list João Grande among the masters featured, alongside Bimba and João Pequeno.',
  'Jair Moura dirigiu "Dança de Guerra" (1968). Algumas fontes (incluindo nota oficial da SecultBA) listam João Grande entre os mestres apresentados, junto com Bimba e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with João Pequeno (documented in "Dança de Guerra" 1968)
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
  NULL, NULL,
  '{"association_context": "Filmmaker documenting master; Jair Moura directed ''Dança de Guerra'' (1968) featuring João Pequeno."}'::jsonb,
  'likely'::genealogy.confidence,
  'SecultBA note, CapoeiraWiki (some sources list João Pequeno in the documentary)',
  'Jair Moura directed "Dança de Guerra" (1968). Some sources (including SecultBA official note) list João Pequeno among the masters featured, alongside Bimba and João Grande.',
  'Jair Moura dirigiu "Dança de Guerra" (1968). Algumas fontes (incluindo nota oficial da SecultBA) listam João Pequeno entre os mestres apresentados, junto com Bimba e João Grande.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jair Moura associated_with Itapoan (co-presenter at 1980 First Regional Capoeira Seminar)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-presenters at the 1980 First Regional Capoeira Seminar in Salvador, organized alongside Carlos Senna, Albano Marinho, and Ordep Serra."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/cobrinha-1980',
  'Jair Moura and Itapoan were both presenters at the 1980 First Regional Capoeira Seminar in Salvador, which brought together main Bahian masters of different lineages and styles.',
  'Jair Moura e Itapoan foram ambos apresentadores no Primeiro Seminário Regional de Capoeira de 1980 em Salvador, que reuniu os principais mestres baianos de diferentes linhagens e estilos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jair Moura' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Jair Moura associated_with Tiburcinho - filmed in "Dança de Guerra" (1968); wrote A Tarde article 1970
--   -> Tiburcinho pending import in persons-backlog.md
-- Jair Moura associated_with Nenel - Nenel provided testimony about Jair Moura
--   -> Nenel pending import in persons-backlog.md
-- Jair Moura associated_with Carlos Senna - co-presenter at 1980 First Regional Capoeira Seminar
--   -> Carlos Senna now imported (done)
-- Jair Moura associated_with Frede Abreu (Frederico José de Abreu) - close friend and fellow researcher
--   -> Frede Abreu added to backlog (historian, may need import as researcher type)
-- Jair Moura associated_with Glauber Rocha - friendship
--   -> Glauber Rocha NOT capoeira figure - do not import

COMMIT;
