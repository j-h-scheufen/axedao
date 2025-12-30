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
  E'Criador e fundador da Capoeira Regional (Luta Regional Baiana). Sintetizou a capoeira tradicional de seu mestre Bentinho com técnicas de batuque de seu pai, adicionando elementos de sua própria invenção. Criou o primeiro método de ensino sistemático para capoeira incluindo as "sequências de ensino", "cintura desprezada" (sequências de agarramento) e a bateria charanga (um berimbau, dois pandeiros).',
  -- Life dates
  1899,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1974,
  'exact'::genealogy.date_precision,
  'Goiânia, Goiás, Brazil',
  -- bio_en
  E'Manoel dos Reis Machado was born on November 23, 1899, in the Bairro do Engenho Velho neighborhood of Salvador, Bahia—the youngest of 25 siblings. His parents were Luiz Cândido Machado, a champion of batuque, and Maria Martinha do Bonfim. The nickname "Bimba" came from a bet between his mother and the midwife about his sex; when he was born male, the midwife remarked on his "bimba" (Bahian slang for male genitalia), and the name stuck for life.

At twelve years old, in 1911, Bimba began learning capoeira from Bentinho, an African-born captain of the Companhia Baiana de Navegação. Training took place at the Clube União em Apuros on the Estrada das Boiadas in Salvador''s Liberdade neighborhood—a predominantly Black area. The apprenticeship lasted four years. Bimba later described Bentinho''s style as "capoeira de Angola" or "capoeira antiga".

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

His famous declaration: "I didn''t do capoeira for myself... I did it for the world".',
  -- bio_pt
  E'Manoel dos Reis Machado nasceu em 23 de novembro de 1899, no Bairro do Engenho Velho em Salvador, Bahia—o caçula de 25 irmãos. Seus pais eram Luiz Cândido Machado, um campeão de batuque, e Maria Martinha do Bonfim. O apelido "Bimba" veio de uma aposta entre sua mãe e a parteira sobre seu sexo; quando ele nasceu homem, a parteira comentou sobre sua "bimba" (gíria baiana para genitália masculina), e o nome ficou para a vida toda.

Aos doze anos, em 1911, Bimba começou a aprender capoeira com Bentinho, um capitão de navegação nascido na África da Companhia Baiana de Navegação. O treinamento acontecia no Clube União em Apuros na Estrada das Boiadas, no bairro da Liberdade em Salvador—uma área predominantemente negra. O aprendizado durou quatro anos. Bimba mais tarde descreveu o estilo de Bentinho como "capoeira de Angola" ou "capoeira antiga".

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

Sua famosa declaração: "Eu não fiz capoeira para mim... Fiz para o mundo".',
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
