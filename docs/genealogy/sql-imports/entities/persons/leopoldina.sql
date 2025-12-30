-- ============================================================
-- GENEALOGY PERSON: Leopoldina
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH DATE: February 12, 1933 - Confirmed by multiple sources.
-- Some sources state "December 2, 1933" (Capoeira Fandom) but the
-- majority, including capoeirahistory.com and Raridades da Capoeira,
-- confirm February 12. One source notes he was born "on a carnival
-- Saturday", which aligns with February 1933.
--
-- DEATH DATE: October 17, 2007 - Universally confirmed.
-- Location: São José dos Campos, SP.
--
-- STYLE: Mixed - Trained first in tiririca (Rio street capoeira
-- without berimbau) under Quinzinho, then in Bahian capoeira
-- with berimbau under Artur Emídio. Later influenced by Angola
-- from suburban Rio angoleiros (c. 1963). This unique synthesis
-- made him respected by both Angoleiros and Regionalistas.
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
  'Demerval Lopes de Lacerda',
  'Leopoldina',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found; photos exist in André Lacé collection
  ARRAY[
    'https://en.wikipedia.org/wiki/Mestre_Leopoldina',
    'https://capoeirahistory.com/general/master-leopoldina-part-1/',
    'https://www.lalaue.com/learn-capoeira/mestre-leopoldina/',
    'https://sites.google.com/view/raridadesdacapoeira/mestre-leopoldina'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Leopoldina''s game was frequently described as quick, unpredictable, and full of mandinga. He synthesized two distinct traditions: the tiririca of carioca street fighters (learned from Quinzinho) and the Bahian capoeira with berimbau (learned from Artur Emídio). Later, around 1963, he was influenced by angoleiros at suburban Rio backyard rodas, which Artur Emídio noted was making Leopoldina "very slow". This unique fusion made him respected by both Angoleiros and Regionalistas. He was renowned for his mastery of the berimbau and his musical compositions, including the ladainha "Pareço Ganga Zumbi". His teaching emphasized kindness - he would not allow older students to hit beginners.',
  E'O jogo de Leopoldina era frequentemente descrito como rápido, imprevisível e cheio de mandinga. Ele sintetizou duas tradições distintas: a tiririca dos lutadores de rua cariocas (aprendida com Quinzinho) e a capoeira baiana com berimbau (aprendida com Artur Emídio). Mais tarde, por volta de 1963, foi influenciado por angoleiros nas rodas de quintal do subúrbio do Rio, o que Artur Emídio notou estar deixando Leopoldina "muito lento". Essa fusão única o tornou respeitado tanto por Angoleiros quanto por Regionalistas. Era renomado por sua maestria no berimbau e suas composições musicais, incluindo a ladainha "Pareço Ganga Zumbi". Seu ensino enfatizava a gentileza - não permitia que alunos mais velhos batessem nos iniciantes.',
  -- Life dates
  1933,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  2007,
  'exact'::genealogy.date_precision,
  'São José dos Campos, SP, Brazil',
  -- Extended content (English)
  E'Demerval Lopes de Lacerda, known as Mestre Leopoldina, was born on a carnival Saturday in Rio de Janeiro in 1933. His mother could not care for him, and he was often beaten and neglected by the relatives who took him in. As a child, he ran away and slept in train wagons, selling sweets to railroad workers at Central do Brasil station. His apelido allegedly derived from a Rio train station or a locomotive he used to imitate.

By seventeen, he had entered SAM (Serviço de Assistência ao Menor), a child care service, where he developed strong swimming skills. At eighteen, in 1951, he left SAM and began selling newspapers, eventually organizing a team of newsboys. It was during this time that he encountered Joaquim Felix - known as Quinzinho - a feared malandro with criminal convictions for murder, who led a gang and had already served time in the Colônia Penal.

Quinzinho was a capoeirista of the old style: tiririca, the capoeira without berimbau of the carioca reprobates, descended from the violent gangs of 19th-century Rio. His teaching method was informal - "do it like this... do it like that" - followed by harsh sparring. Leopoldina came every day at seven to train in front of Quinzinho''s house. Within months, he became the only person who could truly play with his master.

A few years later, Quinzinho was arrested again and murdered inside the prison. Leopoldina disappeared from the streets, fearing reprisal from Quinzinho''s enemies. When he returned, he learned that Valdemar Santana, a famous fighter, had brought a Bahian named Artur Emídio to Rio. Around 1954, Leopoldina became Artur''s student, learning Bahian capoeira played to the berimbau - a completely different world from what Quinzinho had taught.

Leopoldina worked at Cais do Porto on the docks and joined Resistência, a dock capoeira group. He retired before age 45 due to a work accident, then devoted himself fully to capoeira. In 1961, he began teaching at Academia Guanabara in Rio de Janeiro. His classes were small - typically four to eight students - and he never taught for more than five years in the same location. He emphasized rodas and games rather than technique drills.

That same year, 1961, at age twenty-eight, he first paraded with Mangueira samba school at Carnival. Mangueira was the first samba school to include capoeira in its parades, giving the art great visibility. Leopoldina organized sixty capoeiristas to perform demonstrations in Mangueira''s V.C. Entende wing. He maintained this partnership until about 1974.

Nestor Capoeira met Leopoldina in 1965 and was initiated into capoeira by him. Nestor would later become a prominent author and maker of the 2005 documentary "Mestre Leopoldina - A Fina Flor da Malandragem" (The Finest Flower of Roguishness), directed by Rose La Creta, which won the DOCTV 2004 contest and premiered internationally at Forum des Images in Paris. Celso Pepe also learned from Leopoldina at Academia Guanabara, absorbing the Angola game and São Bento Pequeno style.

Leopoldina taught capoeira at Atlética, the sports department of UFRJ (Federal University of Rio de Janeiro). Through capoeira, he traveled internationally to Switzerland, Italy, Amsterdam, Germany, and Senegal. From about 1990 onward, international travel became a regular part of his life. He developed close friendships with Grupo Senzala in São Paulo.

Beyond capoeira, Leopoldina introduced his students to Brazilian popular culture: samba, candomblé, and umbanda. He became associated with the spiritual entity Zé Pelintra from Umbanda - a trickster spirit that embodied the malandro philosophy. His famous saying, "A capoeira é a maçonaria da malandragem" (Capoeira is the freemasonry of roguishness), captured his worldview.

In 2005, when he was over seventy years old, he remained in excellent physical condition, playing at a fast pace with four or more young capoeiristas. He was one of the best-known masters of his time, alongside Mestres João Pequeno and João Grande. He died on October 17, 2007, in São José dos Campos.

Mestre Leopoldina was more than a capoeirista - he was a symbol of Rio''s malandragem, cultural resistance, and the fusion between Capoeira Angola, Regional, and Carioca traditions. He is remembered by both Angoleiros and Regionalistas as a good-humored old master representing the authentic malícia and malandragem of traditional capoeira.',
  -- Extended content (Portuguese)
  E'Demerval Lopes de Lacerda, conhecido como Mestre Leopoldina, nasceu num sábado de carnaval no Rio de Janeiro em 1933. Sua mãe não pôde cuidar dele, e foi frequentemente espancado e negligenciado pelos parentes que o acolheram. Quando criança, fugiu e dormia em vagões de trem, vendendo doces para os ferroviários na estação Central do Brasil. Seu apelido teria derivado de uma estação de trem do Rio ou de uma locomotiva que ele costumava imitar.

Aos dezessete anos, havia entrado no SAM (Serviço de Assistência ao Menor), onde desenvolveu fortes habilidades de natação. Aos dezoito, em 1951, saiu do SAM e começou a vender jornais, eventualmente organizando uma equipe de jornaleiros. Foi durante esse período que encontrou Joaquim Felix - conhecido como Quinzinho - um temido malandro com condenações criminais por homicídio, que liderava uma gangue e já havia cumprido pena na Colônia Penal.

Quinzinho era um capoeirista do estilo antigo: tiririca, a capoeira sem berimbau dos malandros cariocas, descendente das gangues violentas do Rio do século XIX. Seu método de ensino era informal - "faz assim... faz assim" - seguido de luta dura. Leopoldina vinha todos os dias às sete para treinar na frente da casa de Quinzinho. Em poucos meses, tornou-se a única pessoa que conseguia realmente jogar com seu mestre.

Alguns anos depois, Quinzinho foi preso novamente e assassinado dentro da prisão. Leopoldina sumiu das ruas, temendo represálias dos inimigos de Quinzinho. Quando voltou, soube que Valdemar Santana, um lutador famoso, havia trazido um baiano chamado Artur Emídio para o Rio. Por volta de 1954, Leopoldina tornou-se aluno de Artur, aprendendo a capoeira baiana tocada ao berimbau - um mundo completamente diferente do que Quinzinho havia ensinado.

Leopoldina trabalhou no Cais do Porto nas docas e integrou o Resistência, um grupo de capoeira dos estivadores. Aposentou-se antes dos 45 anos devido a um acidente de trabalho, depois se dedicou inteiramente à capoeira. Em 1961, começou a ensinar na Academia Guanabara no Rio de Janeiro. Suas turmas eram pequenas - tipicamente quatro a oito alunos - e nunca ensinou por mais de cinco anos no mesmo local. Enfatizava rodas e jogos em vez de treinos de técnica.

Naquele mesmo ano, 1961, aos vinte e oito anos, desfilou pela primeira vez com a escola de samba Mangueira no Carnaval. Mangueira foi a primeira escola de samba a incluir capoeira em seus desfiles, dando grande visibilidade à arte. Leopoldina organizou sessenta capoeiristas para fazer demonstrações na ala V.C. Entende da Mangueira. Manteve essa parceria até cerca de 1974.

Nestor Capoeira conheceu Leopoldina em 1965 e foi iniciado na capoeira por ele. Nestor mais tarde se tornaria um proeminente autor e realizador do documentário de 2005 "Mestre Leopoldina - A Fina Flor da Malandragem", dirigido por Rose La Creta, que ganhou o concurso DOCTV 2004 e estreou internacionalmente no Forum des Images em Paris. Celso Pepe também aprendeu com Leopoldina na Academia Guanabara, absorvendo o jogo de Angola e o estilo São Bento Pequeno.

Leopoldina ensinou capoeira na Atlética, o departamento de esportes da UFRJ (Universidade Federal do Rio de Janeiro). Através da capoeira, viajou internacionalmente para Suíça, Itália, Amsterdã, Alemanha e Senegal. A partir de cerca de 1990, viagens internacionais tornaram-se parte regular de sua vida. Desenvolveu amizades próximas com o Grupo Senzala em São Paulo.

Além da capoeira, Leopoldina apresentou seus alunos à cultura popular brasileira: samba, candomblé e umbanda. Tornou-se associado à entidade espiritual Zé Pelintra da Umbanda - um espírito malandro que encarnava a filosofia da malandragem. Sua famosa frase, "A capoeira é a maçonaria da malandragem", capturava sua visão de mundo.

Em 2005, quando tinha mais de setenta anos, permanecia em excelente condição física, jogando em ritmo acelerado com quatro ou mais jovens capoeiristas. Era um dos mestres mais conhecidos de seu tempo, ao lado dos Mestres João Pequeno e João Grande. Faleceu em 17 de outubro de 2007, em São José dos Campos.

Mestre Leopoldina foi mais que um capoeirista - foi um símbolo da malandragem carioca, da resistência cultural e da fusão entre Capoeira Angola, Regional e as tradições cariocas. É lembrado tanto por Angoleiros quanto por Regionalistas como um velho mestre bem-humorado representando a autêntica malícia e malandragem da capoeira tradicional.',
  -- Achievements (English)
  E'- Featured in documentary "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), directed by Rose La Creta, winner of DOCTV 2004
- Organized 60 capoeiristas for Mangueira samba school parades (1961-1974)
- First samba school-capoeira integration, giving capoeira national visibility
- Author of the ladainha "Pareço Ganga Zumbi"
- Taught at UFRJ (Federal University of Rio de Janeiro)
- International ambassador traveling to Switzerland, Italy, Amsterdam, Germany, and Senegal
- Participated in the film "Cordão de Ouro" (1977)
- One of the "five main lineages" of contemporary Rio de Janeiro capoeira',
  -- Achievements (Portuguese)
  E'- Protagonista do documentário "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), dirigido por Rose La Creta, vencedor do DOCTV 2004
- Organizou 60 capoeiristas para os desfiles da escola de samba Mangueira (1961-1974)
- Primeira integração escola de samba-capoeira, dando visibilidade nacional à capoeira
- Autor da ladainha "Pareço Ganga Zumbi"
- Ensinou na UFRJ (Universidade Federal do Rio de Janeiro)
- Embaixador internacional viajando para Suíça, Itália, Amsterdã, Alemanha e Senegal
- Participou do filme "Cordão de Ouro" (1977)
- Uma das "cinco principais linhagens" da capoeira contemporânea do Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH DATE DISCREPANCY: Most sources cite February 12, 1933. Capoeira Fandom wiki lists December 2, 1933. The February date is corroborated by multiple sources including capoeirahistory.com, Raridades da Capoeira, and Jogo da Vida. One source notes he was born "on a carnival Saturday" which aligns with February. Using February 12, 1933 as the confirmed date.

APELIDO ORIGIN: Sources suggest the nickname derived from either a Rio train station (Estação Leopoldina) or a locomotive he used to imitate as a child selling sweets on trains.

LINEAGE CONTEXT: Leopoldina represents the rare "premodern" Rio lineage - descended from Quinzinho and the tiririca tradition rather than from Bahian mestres. The lineage extends back through: Quinzinho (b.~1927) → Campanhão (b. 1900) → Prata Preta (b. 1868).

TRAINING TIMELINE:
- 1951: Met Quinzinho, began training in tiririca
- ~1954: Quinzinho murdered; Leopoldina switched to Artur Emídio
- ~1956: Celso Pepe began learning from Leopoldina at Academia Guanabara
- 1961: Began teaching at Academia Guanabara; first Mangueira parade
- ~1963: Influenced by suburban angoleiros
- 1965: Nestor Capoeira began training under him
- 1974: Ended Mangueira partnership

DOCUMENTARY: "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), 52 minutes. Director: Rose La Creta. Co-production: Ministério da Cultura, Secretaria do Audiovisual, ABEPEC, TV Cultura. Won DOCTV 2004 contest. International premiere June 24, 2005 at Forum des Images, Paris.

CONTEMPORARY CONTEXT: Leopoldina was part of a generation of capoeiristas born in the 1930s who formed the core of contemporary Rio capoeira, including Artur Emídio, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes, and Celso do Engenho.

PENDING RELATIONSHIPS (requires imports):
- Nestor Capoeira student_of Leopoldina (1965-1968) - Nestor Capoeira not yet imported
- Celso Pepe student_of Leopoldina (~1956-1960s) - Celso Pepe not yet imported

COMPLETED RELATIONSHIPS:
- Leopoldina student_of Artur Emídio (~1954+) - Statement added when Artur Emídio was imported',
  -- Researcher notes (Portuguese)
  E'DISCREPÂNCIA NA DATA DE NASCIMENTO: A maioria das fontes cita 12 de fevereiro de 1933. A wiki Capoeira Fandom lista 2 de dezembro de 1933. A data de fevereiro é corroborada por múltiplas fontes incluindo capoeirahistory.com, Raridades da Capoeira e Jogo da Vida. Uma fonte nota que ele nasceu "num sábado de carnaval" o que se alinha com fevereiro. Usando 12 de fevereiro de 1933 como data confirmada.

ORIGEM DO APELIDO: Fontes sugerem que o apelido derivou de uma estação de trem do Rio (Estação Leopoldina) ou de uma locomotiva que ele costumava imitar quando criança vendendo doces nos trens.

CONTEXTO DA LINHAGEM: Leopoldina representa a rara linhagem "pré-moderna" do Rio - descendente de Quinzinho e da tradição da tiririca em vez dos mestres baianos. A linhagem se estende através de: Quinzinho (n.~1927) → Campanhão (n. 1900) → Prata Preta (n. 1868).

CRONOLOGIA DO TREINAMENTO:
- 1951: Conheceu Quinzinho, começou a treinar tiririca
- ~1954: Quinzinho assassinado; Leopoldina passou para Artur Emídio
- ~1956: Celso Pepe começou a aprender com Leopoldina na Academia Guanabara
- 1961: Começou a ensinar na Academia Guanabara; primeiro desfile na Mangueira
- ~1963: Influenciado por angoleiros do subúrbio
- 1965: Nestor Capoeira começou a treinar com ele
- 1974: Encerrou parceria com Mangueira

DOCUMENTÁRIO: "Mestre Leopoldina - A Fina Flor da Malandragem" (2005), 52 minutos. Diretora: Rose La Creta. Coprodução: Ministério da Cultura, Secretaria do Audiovisual, ABEPEC, TV Cultura. Ganhou concurso DOCTV 2004. Estreia internacional em 24 de junho de 2005 no Forum des Images, Paris.

CONTEXTO CONTEMPORÂNEO: Leopoldina fazia parte de uma geração de capoeiristas nascidos nos anos 1930 que formaram o núcleo da capoeira contemporânea do Rio, incluindo Artur Emídio, Mário Buscapé, Djalma Bandeira, Roque, Paulo Gomes e Celso do Engenho.

RELACIONAMENTOS PENDENTES (requer importações):
- Nestor Capoeira student_of Leopoldina (1965-1968) - Nestor Capoeira ainda não importado
- Celso Pepe student_of Leopoldina (~1956-1960s) - Celso Pepe ainda não importado

RELACIONAMENTOS COMPLETADOS:
- Leopoldina student_of Artur Emídio (~1954+) - Declaração adicionada quando Artur Emídio foi importado'
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
