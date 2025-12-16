-- ============================================================
-- GENEALOGY PERSON: Mário Buscapé
-- Generated: 2025-12-16
-- ============================================================
-- One of four founding lineages of contemporary capoeira in
-- Rio de Janeiro. Pioneer who brought Bahian capoeira to Rio.
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
  'Mário dos Santos',
  'Mário Buscapé',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/']::text[],
  -- Capoeira-specific
  NULL, -- Mixed Bahian tradition; learned before formal style distinctions in Rio
  'Learned capoeira in the Bahian Recôncavo from his uncle Dendê and father José Bidel, who trained with Besouro, Siri de Mangue, and Canário Pardo. His style combined the traditional Bahian capoeira brought to Rio with practical academy teaching methods. His Bonfim group became known for training high-level competitors.',
  'Aprendeu capoeira no Recôncavo Baiano com seu tio Dendê e pai José Bidel, que treinaram com Besouro, Siri de Mangue e Canário Pardo. Seu estilo combinava a capoeira tradicional baiana trazida ao Rio com métodos práticos de ensino em academia. Seu grupo Bonfim tornou-se conhecido por formar competidores de alto nível.',
  -- Life dates
  1934,
  'exact'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  2021,
  'exact'::genealogy.date_precision,
  'São Francisco do Conde, Bahia, Brazil',
  -- bio_en
  E'Mário dos Santos, known as Mário Buscapé, was born on July 17, 1934, in a village near São Francisco do Conde in the Bahian Recôncavo. His mother, Maria dos Anjos dos Santos, was a shellfish gatherer, and his father, José Bidel dos Santos, was a crabber. Both his father and his uncle Dendê practiced capoeira and associated with famous capoeiristas of the Recôncavo—Siri de Mangue, Canário Pardo, and Besouro from Santo Amaro. According to Mário, Besouro even visited his house, though this would have been before Mário was born, as Besouro was killed in 1924.

At age eight, Mário began learning capoeira in improvised rodas in his family''s backyard, with his uncle Dendê as his first teacher. His father José Bidel also trained him, establishing the lineage that ran from Besouro through Bidel and Dendê to Mário himself.

In the early 1950s, seeking better opportunities, Mário traveled to Rio de Janeiro with an aunt. He settled in the poor neighborhood of Jacarezinho and found work laying panels and covers on the railroad. Later, he worked for many years at the Cavan company, which manufactured lamp posts.

At Cavan, Mário met Irineu dos Santos and began teaching him the fundamentals of capoeira. Through Irineu, he quickly won other followers, including Irineu''s brothers Zé Grande and Deraldo—all from the dos Santos family, also from Bahia but not related to Mário. On January 6, 1953, they founded the capoeira group Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in São Cristóvão but soon outgrew it due to the large number of students. They moved the academy to Olaria, where they trained many accomplished capoeiristas. Zé Grande stood out as their best disciple. The Bonfim group, led by Mário Buscapé, became famous in Rio de Janeiro for training high-level competitors who often won the competitions that began being organized in the city from the mid-1960s.

During this period, Mário frequented the roda of Mestre Artur Emídio, one of the few regular rodas in 1950s Rio. Witnesses from that era say Mário was very impressed with the speed of Artur Emídio''s game and subsequently elevated his own performance.

In 1969, Mário returned to Bahia, and his students Zé Grande and Deraldo took over leadership of the Bonfim group in Rio. The group continued to flourish under their direction. It was only many years later, in 1994, that students of Bonfim brought the master back to Rio de Janeiro.

There is consensus among capoeira historians that four lineages were the main influences in the formation of Contemporary Capoeira in Rio de Janeiro: those of Artur Emídio, Paraná, Mário Buscapé, and Roque. As M. Levi stated, these four "started to work in closed spaces of academies, introduced uniforms, organisation, etc. From these four the majority of capoeira masters here in Rio de Janeiro derived."

Mário Buscapé also participated in the folkloric group Capoeiras do Bonfim, which performed shows and exhibitions in Rio. Mestre Roque, another of the four founding lineages, joined this folkloric group.

In 2016, Mário published his memoir, "A saga de uma lenda viva" (The Saga of a Living Legend), edited by Paulinho Salmon and published by Azougue in Rio de Janeiro.

At the time of a 2017 ceremony honoring his 83rd birthday in São Francisco do Conde, he was recognized as "the father of Capoeira in São Francisco do Conde" and the 13th "cordão de ouro" (gold cord) in Brazil—one of the highest honors in the capoeira community.

Mário Buscapé passed away on August 19, 2021, in his native São Francisco do Conde, Bahia. As one practitioner declared at his 2017 celebration: "Mestre Mário is the root of everything."',
  -- bio_pt
  E'Mário dos Santos, conhecido como Mário Buscapé, nasceu em 17 de julho de 1934, em um vilarejo próximo a São Francisco do Conde, no Recôncavo Baiano. Sua mãe, Maria dos Anjos dos Santos, era marisqueira, e seu pai, José Bidel dos Santos, era catador de caranguejos. Tanto seu pai quanto seu tio Dendê praticavam capoeira e se associavam com famosos capoeiristas do Recôncavo—Siri de Mangue, Canário Pardo e Besouro de Santo Amaro. Segundo Mário, Besouro até visitou sua casa, embora isso tenha sido antes de Mário nascer, pois Besouro foi morto em 1924.

Aos oito anos, Mário começou a aprender capoeira em rodas improvisadas no quintal de sua família, tendo seu tio Dendê como primeiro professor. Seu pai José Bidel também o treinou, estabelecendo a linhagem que ia de Besouro, passando por Bidel e Dendê, até o próprio Mário.

No início dos anos 1950, buscando melhores oportunidades, Mário viajou para o Rio de Janeiro com uma tia. Estabeleceu-se no bairro pobre de Jacarezinho e encontrou trabalho colocando placas e coberturas na ferrovia. Depois, trabalhou por muitos anos na empresa Cavan, que fabricava postes de luz.

Na Cavan, Mário conheceu Irineu dos Santos e começou a ensinar-lhe os fundamentos da capoeira. Através de Irineu, rapidamente conquistou outros seguidores, incluindo os irmãos de Irineu, Zé Grande e Deraldo—todos da família dos Santos, também da Bahia, mas sem parentesco com Mário. Em 6 de janeiro de 1953, fundaram o grupo de capoeira Bonfim, também conhecido como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço em São Cristóvão, mas logo ficou pequeno devido ao grande número de alunos. Mudaram a academia para Olaria, onde treinaram muitos capoeiristas talentosos. Zé Grande destacou-se como o melhor discípulo. O grupo Bonfim, liderado por Mário Buscapé, tornou-se famoso no Rio de Janeiro por formar competidores de alto nível que frequentemente venciam as competições que começaram a ser organizadas na cidade a partir de meados dos anos 1960.

Durante este período, Mário frequentava a roda de Mestre Artur Emídio, uma das poucas rodas regulares no Rio dos anos 1950. Testemunhas daquela época dizem que Mário ficou muito impressionado com a velocidade do jogo de Artur Emídio e posteriormente elevou seu próprio desempenho.

Em 1969, Mário retornou à Bahia, e seus alunos Zé Grande e Deraldo assumiram a liderança do grupo Bonfim no Rio. O grupo continuou a prosperar sob sua direção. Foi apenas muitos anos depois, em 1994, que alunos do Bonfim trouxeram o mestre de volta ao Rio de Janeiro.

Há consenso entre os historiadores da capoeira de que quatro linhagens foram as principais influências na formação da Capoeira Contemporânea no Rio de Janeiro: as de Artur Emídio, Paraná, Mário Buscapé e Roque. Como M. Levi afirmou, esses quatro "começaram a trabalhar em espaços fechados de academias, introduziram uniformes, organização, etc. Desses quatro derivou a maioria dos mestres de capoeira aqui no Rio de Janeiro."

Mário Buscapé também participou do grupo folclórico Capoeiras do Bonfim, que realizava shows e apresentações no Rio. Mestre Roque, outra das quatro linhagens fundadoras, integrou este grupo folclórico.

Em 2016, Mário publicou suas memórias, "A saga de uma lenda viva," editado por Paulinho Salmon e publicado pela Azougue no Rio de Janeiro.

Na época de uma cerimônia em 2017 homenageando seus 83 anos em São Francisco do Conde, ele foi reconhecido como "o pai da Capoeira em São Francisco do Conde" e o 13º "cordão de ouro" no Brasil—uma das mais altas honrarias na comunidade da capoeira.

Mário Buscapé faleceu em 19 de agosto de 2021, em sua cidade natal, São Francisco do Conde, Bahia. Como um praticante declarou em sua celebração de 2017: "Mestre Mário é a raiz de tudo."',
  -- achievements_en
  'Founder of Grupo Bonfim (January 6, 1953); One of four founding lineages of contemporary capoeira in Rio de Janeiro; 13th "cordão de ouro" in Brazil; Pioneer who brought Bahian capoeira to Rio de Janeiro; Author of "A saga de uma lenda viva" (2016); Recognized as "the father of Capoeira in São Francisco do Conde"',
  -- achievements_pt
  'Fundador do Grupo Bonfim (6 de janeiro de 1953); Uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro; 13º "cordão de ouro" no Brasil; Pioneiro que trouxe a capoeira baiana para o Rio de Janeiro; Autor de "A saga de uma lenda viva" (2016); Reconhecido como "o pai da Capoeira em São Francisco do Conde"',
  -- Researcher notes (English)
  E'BIRTH DATE: July 17, 1934 (exact), per São Francisco do Conde municipal records and capoeirahistory.com.

DEATH DATE: August 19, 2021 (exact), per capoeirahistory.com.

MOVE TO RIO: Sources give conflicting dates. Capoeirahistory.com says "early 1950s"; capoeiraliberdade.net.br says 1951 (age 17) but also mentions 1957. The Bonfim group was founded January 6, 1953, so Mário must have arrived before that date.

LINEAGE: The lineage tree from capoeiraliberdade.net.br shows: Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo. This places Mário''s father José Bidel and uncle Dendê as direct links to the Besouro era.

FAMILY CONNECTIONS: Note distinction between Mário Buscapé (son of José Bidel, from São Francisco do Conde) and Marco Buscapé (son of Zé Bedeu, cousin to Mestre Roque). These are DIFFERENT people from different families.

STYLE: Left as NULL because he learned traditional Bahian capoeira before the strict Angola/Regional division was formalized in Rio. His training came from the Recôncavo tradition associated with Besouro''s companions.

MILITARY SERVICE: The São Francisco do Conde municipal website mentions he enlisted in the Brazilian Army at age 21 (1955), which would have been AFTER founding Bonfim (1953). This timeline discrepancy may indicate return trips between Rio and Bahia, or the military service occurred during a different period.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 17 de julho de 1934 (exata), segundo registros municipais de São Francisco do Conde e capoeirahistory.com.

DATA DE MORTE: 19 de agosto de 2021 (exata), segundo capoeirahistory.com.

MUDANÇA PARA O RIO: Fontes dão datas conflitantes. Capoeirahistory.com diz "início dos anos 1950"; capoeiraliberdade.net.br diz 1951 (aos 17 anos) mas também menciona 1957. O grupo Bonfim foi fundado em 6 de janeiro de 1953, então Mário deve ter chegado antes dessa data.

LINHAGEM: A árvore genealógica de capoeiraliberdade.net.br mostra: Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo. Isso coloca o pai de Mário, José Bidel, e o tio Dendê como elos diretos com a era de Besouro.

CONEXÕES FAMILIARES: Note a distinção entre Mário Buscapé (filho de José Bidel, de São Francisco do Conde) e Marco Buscapé (filho de Zé Bedeu, primo de Mestre Roque). São pessoas DIFERENTES de famílias diferentes.

ESTILO: Deixado como NULL porque ele aprendeu capoeira tradicional baiana antes da divisão estrita Angola/Regional ser formalizada no Rio. Seu treinamento veio da tradição do Recôncavo associada aos companheiros de Besouro.

SERVIÇO MILITAR: O site da prefeitura de São Francisco do Conde menciona que ele se alistou no Exército Brasileiro aos 21 anos (1955), o que seria DEPOIS de fundar o Bonfim (1953). Esta discrepância na linha do tempo pode indicar viagens de ida e volta entre Rio e Bahia, ou o serviço militar ocorreu em um período diferente.'
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
