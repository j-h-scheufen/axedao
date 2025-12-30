-- ============================================================
-- GENEALOGY PERSON: Decânio
-- Generated: 2025-12-20
-- ============================================================
-- One of only four students formally graduated to mestre level
-- (white handkerchief / lenço branco) by Mestre Bimba.
-- Medical doctor, author, researcher, and philosopher of capoeira.
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
  'Angelo Augusto Decânio Filho',
  'Decânio',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com', 'https://portalcapoeira.com/capoeira/cronicas-da-capoeiragem/mestre-decanio-o-doutor-da-capoeira/', 'https://capoeira.fandom.com/wiki/Mestre_Decanio']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'One of the founding pillars of Capoeira Regional alongside Sisnando. As a medical doctor and academic, he helped give capoeira a new institutional legitimacy. Contributed to systematizing Bimba''s teaching methodology and academy organization, including uniforms, training schedules, baptisms, and specialization courses. Known for developing the theory of "Transe Capoeirano" (Capoeira Trance), applying scientific principles to explain the altered states of consciousness achieved during capoeira practice.',
  E'Um dos pilares fundadores da Capoeira Regional ao lado de Sisnando. Como médico e acadêmico, ajudou a dar à capoeira uma nova legitimidade institucional. Contribuiu para sistematizar a metodologia de ensino e organização da academia de Bimba, incluindo uniformes, horários de treino, batizados e cursos de especialização. Conhecido por desenvolver a teoria do "Transe Capoeirano", aplicando princípios científicos para explicar os estados alterados de consciência alcançados durante a prática da capoeira.',
  -- Life dates
  1923,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Angelo Augusto Decânio Filho was born on February 12, 1923, in Salvador, Bahia, the son of Dr. Ângelo Augusto Decânio and Georgina de Barros Decânio. He would become one of the most significant figures in the preservation and documentation of Capoeira Regional.

In 1938, while studying medicine at university, the sixteen-year-old Decânio met Mestre Bimba and joined his academy—a fact he initially kept secret from his family. From that first day, Bimba adopted him "like a son", beginning a relationship that would span 36 years until the master''s death in 1974.

During those decades, Decânio became far more than a student. He provided Bimba with "filial attention, medical care, advisory on academy administration, study of new techniques and counter-techniques, and establishment of norms and rules for improved teaching of the art". As a result of this intimate collaboration, Decânio had the privilege of being "the sole keeper of the Master''s secrets and tricks".

Together with Sisnando Lima—another university-educated student who had trained in judo under Mitsuyo Maeda—Decânio formed one of the two pillars upon which Bimba built Capoeira Regional during its crucial Initial Phase (1930-1937) and Consolidation Phase (1938-1966). These academics helped transform capoeira from a street practice into a respectable institution, implementing structured academy operations with uniforms, training schedules, events, baptisms, exhibition rodas, and specialization courses.

Bimba formally graduated only four students to the level of mestre (white handkerchief) during his lifetime: Decânio, Jair Moura, Miranda, and Edinho. This was the highest honor in the Capoeira Regional graduation system, reserved for those who had dedicated many years to both training and teaching the art.

In 1969, when Bimba was invited to participate in the I Simpósio Brasileiro de Capoeira at Galeão Air Base in Rio de Janeiro—an event aimed at formulating sporting rules for capoeira—he sent Decânio as his official representative rather than attending himself.

As a physician and intellectual, Decânio formulated the theory of "Transe Capoeirano" (Capoeira Trance), described as "a physical-psychological state that the capoeirista reaches during the game, due to stimuli from the musicality, the rhythm of the atabaques and agogôs, and the atmosphere provided by the ritual of the capoeira roda". He published this theory in "Transe Capoeirano, um estudo sobre a estrutura do ser humano e modificações de estados de consciência durante a prática da capoeira" (Salvador, 2002). His work drew comparisons between the trance state in capoeira and that experienced in Candomblé ceremonies.

Decânio authored several books on capoeira, compiled in the self-published Coleção São Salomão: "A Herança de Mestre Bimba" (1996, 2nd edition revised with dialectal glossary 1997), "Manuscritos e Desenhos de Pastinha", "A Herança de Pastinha", and "Falando em Capoeira". His work was cited by Mestre Damião as "the true Bible of Capoeira".

Notably, despite being Bimba''s closest disciple, Decânio showed profound respect for Mestre Pastinha and Capoeira Angola. In "A Herança de Mestre Bimba", he exalted Pastinha, the master of Capoeira Angola. He was also responsible for publishing Pastinha''s manuscripts, preserving essential documents for the Angola tradition.

In his later years, Decânio lived at Sítio Vivendas Yemanjá in the Praia de Tubarão neighborhood of Paripe, in Salvador''s Subúrbio Ferroviário, where he remained a welcoming figure for capoeiristas who sought his knowledge. He was close neighbors and friends with Mestre João Pequeno. When CEDANZE (the academy continuing João Pequeno''s work) was formalized in 2003, Decânio served on its Council of Honor as one of the "advisors of highest expression of Capoeira in Bahia".

He held various titles in medicine, academic career, judo, and Candomblé. He also created the website "Capoeira da Bahia", which was later migrated to Portal Capoeira after his death.

On Wednesday, February 1, 2011—the eve of the Festa de Yemanjá—Mestre Decânio passed away, just days before his 88th birthday. Described as "the greatest authority in the world on Mestre Bimba''s Capoeira Regional", he left behind an immense legacy of documentation, research, and philosophical contribution to capoeira.

As he wrote: "A capoeira na sua origem é uma só... Cada mestre cria um estilo próprio". (Capoeira at its origin is one... Each master creates his own style.)',
  -- bio_pt
  E'Angelo Augusto Decânio Filho nasceu em 12 de fevereiro de 1923, em Salvador, Bahia, filho do Dr. Ângelo Augusto Decânio e Georgina de Barros Decânio. Ele se tornaria uma das figuras mais significativas na preservação e documentação da Capoeira Regional.

Em 1938, enquanto estudava medicina na universidade, o jovem Decânio de dezesseis anos conheceu Mestre Bimba e se juntou à sua academia—um fato que inicialmente manteve em segredo de sua família. Desde o primeiro dia, Bimba o adotou "como filho", iniciando um relacionamento que duraria 36 anos até a morte do mestre em 1974.

Durante essas décadas, Decânio tornou-se muito mais que um aluno. Ele oferecia a Bimba "atenção filial, cuidados médicos, assessoria na administração da academia, estudo de novos golpes e contragolpes, e estabelecimento de normas e regras para o aperfeiçoamento do ensino da luta". Como resultado dessa colaboração íntima, Decânio teve o privilégio de ser "o único guardião dos segredos e truques do Mestre".

Juntamente com Sisnando Lima—outro aluno universitário que havia treinado judô com Mitsuyo Maeda—Decânio formou um dos dois pilares sobre os quais Bimba construiu a Capoeira Regional durante suas fases cruciais: Fase Inicial (1930-1937) e Fase de Consolidação (1938-1966). Esses acadêmicos ajudaram a transformar a capoeira de uma prática de rua em uma instituição respeitável, implementando operações estruturadas de academia com uniformes, horários de treino, eventos, batizados, rodas de exibição e cursos de especialização.

Bimba graduou formalmente apenas quatro alunos ao nível de mestre (lenço branco) durante sua vida: Decânio, Jair Moura, Miranda e Edinho. Esta era a maior honra no sistema de graduação da Capoeira Regional, reservada para aqueles que haviam dedicado muitos anos tanto ao treinamento quanto ao ensino da arte.

Em 1969, quando Bimba foi convidado para participar do I Simpósio Brasileiro de Capoeira na Base Aérea do Galeão, no Rio de Janeiro—um evento que visava formular regras esportivas para a capoeira—ele enviou Decânio como seu representante oficial ao invés de comparecer pessoalmente.

Como médico e intelectual, Decânio formulou a teoria do "Transe Capoeirano", descrita como "um estado físico-psíquico que o capoeirista atinge durante o jogo, devido aos estímulos da musicalidade, do ritmo dos atabaques e agogôs, e da atmosfera proporcionada pelo ritual da roda de capoeira". Publicou essa teoria em "Transe Capoeirano, um estudo sobre a estrutura do ser humano e modificações de estados de consciência durante a prática da capoeira" (Salvador, 2002). Seu trabalho traçou comparações entre o estado de transe na capoeira e aquele vivenciado nas cerimônias de Candomblé.

Decânio escreveu vários livros sobre capoeira, compilados na Coleção São Salomão, publicada por ele mesmo: "A Herança de Mestre Bimba" (1996, 2ª edição revisada com glossário dialetal 1997), "Manuscritos e Desenhos de Pastinha", "A Herança de Pastinha", e "Falando em Capoeira". Sua obra foi citada por Mestre Damião como "a verdadeira Bíblia da Capoeira".

Notavelmente, apesar de ser o discípulo mais próximo de Bimba, Decânio demonstrou profundo respeito por Mestre Pastinha e pela Capoeira Angola. Em "A Herança de Mestre Bimba", ele exalta Pastinha, o mestre da Capoeira Angola. Ele também foi responsável pela publicação dos manuscritos de Pastinha, preservando documentos essenciais para a tradição Angola.

Em seus últimos anos, Decânio viveu no Sítio Vivendas Yemanjá no bairro da Praia de Tubarão em Paripe, no Subúrbio Ferroviário de Salvador, onde permaneceu uma figura acolhedora para capoeiristas que buscavam seu conhecimento. Era vizinho próximo e amigo de Mestre João Pequeno. Quando o CEDANZE (a academia que continua o trabalho de João Pequeno) foi formalizado em 2003, Decânio serviu em seu Conselho de Honra como um dos "conselheiros de maior expressão da Capoeira na Bahia".

Ele possuía vários títulos em medicina, carreira acadêmica, judô e Candomblé. Também criou o site "Capoeira da Bahia", que foi posteriormente migrado para o Portal Capoeira após sua morte.

Na quarta-feira, 1º de fevereiro de 2011—véspera da Festa de Yemanjá—Mestre Decânio faleceu, apenas dias antes de seu 88º aniversário. Descrito como "a maior autoridade no mundo sobre a Capoeira Regional de Mestre Bimba", ele deixou um imenso legado de documentação, pesquisa e contribuição filosófica para a capoeira.

Como ele escreveu: "A capoeira na sua origem é uma só... Cada mestre cria um estilo próprio".',
  -- achievements_en
  E'One of only four students formally graduated to mestre (white handkerchief) by Mestre Bimba; Medical doctor who provided healthcare and institutional guidance to Bimba''s academy; Co-pillar (with Sisnando) in founding Capoeira Regional; Official representative of Mestre Bimba at 1969 I Simpósio Brasileiro de Capoeira; Formulated the theory of "Transe Capoeirano" (Capoeira Trance); Author of Coleção São Salomão book series; Published Mestre Pastinha''s manuscripts; Considered "the greatest authority in the world on Mestre Bimba''s Capoeira Regional"; Council of Honor member at CEDANZE (João Pequeno academy); Created "Capoeira da Bahia" website (now preserved at Portal Capoeira)',
  -- achievements_pt
  E'Um dos apenas quatro alunos formalmente graduados a mestre (lenço branco) por Mestre Bimba; Médico que ofereceu cuidados de saúde e orientação institucional para a academia de Bimba; Co-pilar (com Sisnando) na fundação da Capoeira Regional; Representante oficial de Mestre Bimba no I Simpósio Brasileiro de Capoeira de 1969; Formulou a teoria do "Transe Capoeirano"; Autor da série de livros Coleção São Salomão; Publicou os manuscritos de Mestre Pastinha; Considerado "a maior autoridade no mundo sobre a Capoeira Regional de Mestre Bimba"; Membro do Conselho de Honra do CEDANZE (academia de João Pequeno); Criou o site "Capoeira da Bahia" (agora preservado no Portal Capoeira)',
  -- notes_en
  E'BIRTH DATE (1923-02-12, exact):
February 12, 1923 - confirmed by velhosmestres.com birthday registry and Portal Capoeira article by Mestre Jean Pangolin.

DEATH DATE (2011-02-01, exact):
February 1, 2011 - confirmed by memorial article (mastermarciomendes.wordpress.com, Feb 8, 2012) which states "Last Wednesday, February 1 2011, Master Decânio passed away". Some sources incorrectly state 2012 due to confusion with memorial publication date.

PARENTS:
- Father: Dr. Ângelo Augusto Decânio (medical doctor)
- Mother: Georgina de Barros Decânio

SPOUSE:
- Maria Isabel Pereira Decânio (known as "Bel")

RESIDENCE:
Sítio Vivendas Yemanjá, Praia de Tubarão, Paripe, Salvador, Bahia (Subúrbio Ferroviário)

TEACHERS:
- Mestre Bimba (1938-1974) - primary and only capoeira teacher; 36 years of training

FOUR WHITE HANDKERCHIEF GRADUATES OF BIMBA:
1. Angelo Augusto Decânio Filho (Decânio)
2. Jair Moura
3. Miranda (deceased before Bimba)
4. Edinho (deceased before Bimba)

PUBLICATIONS (Coleção São Salomão):
- 1996: "A Herança de Mestre Bimba" (1st edition)
- 1997: "A Herança de Mestre Bimba" (2nd edition, revised with dialectal glossary)
- "Manuscritos e Desenhos de Pastinha"
- "A Herança de Pastinha"
- "Falando em Capoeira"
- 2002: "Transe Capoeirano, um estudo sobre a estrutura do ser humano e modificações de estados de consciência durante a prática da capoeira"

TRAINING COMPANIONS AT BIMBA''S ACADEMY:
- Sisnando Lima (José Cisnando Lima) - fellow academic, co-pillar of Regional
- Jair Moura - fellow white handkerchief recipient
- Mestre Saci - contemporary at Bimba''s academy
- Mestre Gigante - musician at Bimba''s academy

MENTORSHIP/INFLUENCE:
- Mestre Jean Pangolin (mentored by Decânio)
- Mestra Brisa (visited Decânio at Tubarão residence)

CONTEMPORARIES/ASSOCIATES:
- Mestre João Pequeno - neighbor and close friend in Paripe
- Tiburcinho - brought to Bimba by Decânio; helped remember songs and maculelê

ADDITIONAL TITLES/CREDENTIALS:
- Medical doctor
- University professor
- Judo practitioner
- Candomblé initiate

HISTORICAL REPRESENTATION:
- 1969: Represented Mestre Bimba at I Simpósio Brasileiro de Capoeira, Galeão Air Base, Rio de Janeiro (Bimba did not attend personally)

DIGITAL LEGACY:
- Created website "Capoeira da Bahia" - archived at Portal Capoeira after his death by Luciano Milani

COUNCIL POSITIONS:
- 2003: Council of Honor, CEDANZE (João Pequeno academy)',
  -- notes_pt
  E'DATA DE NASCIMENTO (1923-02-12, exata):
12 de fevereiro de 1923 - confirmado pelo registro de aniversários do velhosmestres.com e artigo do Portal Capoeira por Mestre Jean Pangolin.

DATA DE FALECIMENTO (2011-02-01, exata):
1º de fevereiro de 2011 - confirmado por artigo memorial (mastermarciomendes.wordpress.com, 8 de fev de 2012) que afirma "Na última quarta-feira, 1º de fevereiro de 2011, Mestre Decânio faleceu". Algumas fontes incorretamente indicam 2012 devido à confusão com a data de publicação do memorial.

PAIS:
- Pai: Dr. Ângelo Augusto Decânio (médico)
- Mãe: Georgina de Barros Decânio

ESPOSA:
- Maria Isabel Pereira Decânio (conhecida como "Bel")

RESIDÊNCIA:
Sítio Vivendas Yemanjá, Praia de Tubarão, Paripe, Salvador, Bahia (Subúrbio Ferroviário)

MESTRES:
- Mestre Bimba (1938-1974) - professor único de capoeira; 36 anos de treinamento

QUATRO GRADUADOS DE LENÇO BRANCO DE BIMBA:
1. Angelo Augusto Decânio Filho (Decânio)
2. Jair Moura
3. Miranda (falecido antes de Bimba)
4. Edinho (falecido antes de Bimba)

PUBLICAÇÕES (Coleção São Salomão):
- 1996: "A Herança de Mestre Bimba" (1ª edição)
- 1997: "A Herança de Mestre Bimba" (2ª edição, revisada com glossário dialetal)
- "Manuscritos e Desenhos de Pastinha"
- "A Herança de Pastinha"
- "Falando em Capoeira"
- 2002: "Transe Capoeirano, um estudo sobre a estrutura do ser humano e modificações de estados de consciência durante a prática da capoeira"

COMPANHEIROS DE TREINO NA ACADEMIA DE BIMBA:
- Sisnando Lima (José Cisnando Lima) - colega acadêmico, co-pilar da Regional
- Jair Moura - colega recipiente do lenço branco
- Mestre Saci - contemporâneo na academia de Bimba
- Mestre Gigante - músico na academia de Bimba

MENTORIA/INFLUÊNCIA:
- Mestre Jean Pangolin (orientado por Decânio)
- Mestra Brisa (visitou Decânio em sua residência em Tubarão)

CONTEMPORÂNEOS/ASSOCIADOS:
- Mestre João Pequeno - vizinho e amigo próximo em Paripe
- Tiburcinho - apresentado a Bimba por Decânio; ajudou a lembrar músicas e maculelê

TÍTULOS/CREDENCIAIS ADICIONAIS:
- Médico
- Professor universitário
- Praticante de judô
- Iniciado no Candomblé

REPRESENTAÇÃO HISTÓRICA:
- 1969: Representou Mestre Bimba no I Simpósio Brasileiro de Capoeira, Base Aérea do Galeão, Rio de Janeiro (Bimba não compareceu pessoalmente)

LEGADO DIGITAL:
- Criou o site "Capoeira da Bahia" - arquivado no Portal Capoeira após sua morte por Luciano Milani

CARGOS EM CONSELHOS:
- 2003: Conselho de Honra, CEDANZE (academia de João Pequeno)'
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
