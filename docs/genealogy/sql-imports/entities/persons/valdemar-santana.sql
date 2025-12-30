-- ============================================================
-- GENEALOGY PERSON: Valdemar Santana (Leopardo Negro)
-- Generated: 2025-12-28
-- ============================================================
-- NOTE: This is primarily a vale-tudo fighter who trained capoeira under
-- Mestre Bimba. His significance is his role bridging Bahian capoeira with
-- Rio de Janeiro and the competitive fighting world. He brought Artur Emídio
-- to Rio and trained several capoeira mestres in vale-tudo.
-- ============================================================
-- DEATH DATE DISCREPANCY:
-- - EcuRed: August 26, 1984
-- - Tapology: August 1, 1984
-- - CapoeiraWiki: August 29, 1984
-- - simonbjj.com: September 27, 1984
-- Using August 1984 with month precision due to conflicting dates.
-- Location confirmed: Hospital Espanhol, Salvador, Bahia. Cause: stroke.
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
  'Waldemar Santana',
  'Leopardo Negro',
  NULL,
  NULL,
  ARRAY['https://capoeirawiki.org/wiki/Valdemar_Santana', 'https://en.wikipedia.org/wiki/Valdemar_Santana', 'https://simonbjj.com/waldemar', 'https://www.tapology.com/fightcenter/fighters/267101-waldemar-santana-leopardo-negro']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained Capoeira Regional under Mestre Bimba in Salvador before transitioning to vale-tudo fighting. His capoeira foundation—agility, flexibility, and strategic understanding—combined with BJJ, boxing, and luta livre made him one of Brazil''s most formidable no-holds-barred fighters. He continued teaching capoeira alongside other martial arts at his academies in Rio and Brasília.',
  E'Treinou Capoeira Regional com Mestre Bimba em Salvador antes de transicionar para lutas de vale-tudo. Sua base de capoeira—agilidade, flexibilidade e compreensão estratégica—combinada com BJJ, boxe e luta livre o tornou um dos mais formidáveis lutadores de vale-tudo do Brasil. Continuou ensinando capoeira junto com outras artes marciais em suas academias no Rio e Brasília.',
  -- Life dates
  1929,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1984,
  'month'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Waldemar Santana was born on October 28, 1929, in Salvador, Bahia. As an Afro-Brazilian in that era, opportunities were limited, but young Waldemar demonstrated exceptional athletic talent. In his youth, he began training Capoeira Regional under Mestre Bimba—the founder of the style who was transforming traditional capoeira into a structured martial art.

Under Bimba''s rigorous regimen at the Academia-escola de Cultura Regional in Engenho de Brotas, Santana developed proficiency in the ginga, meia lua de compasso, ground escapes, and the strategic thinking that would later serve him in professional fighting. The agility, flexibility, and combat awareness instilled by Bimba became the foundation of his fighting career.

Seeking greater opportunities, Santana moved to Rio de Janeiro, where around 1951 he joined the Gracie Academy. Initially performing custodial work to offset training costs, he quickly proved himself as a fighter, becoming an instructor. His first professional fight was on February 26, 1953. He excelled particularly in vale tudo format, blending his capoeira strikes with grappling techniques.

In January 1955, Santana was expelled from the Gracie Academy after fighting Rene Bastos under promoter Karol Nowina—working for a rival. The falling out with Hélio Gracie led to one of the most significant matches in Brazilian martial arts history.

On May 24, 1955, Santana faced his former master Hélio Gracie in a vale tudo match that would last over three hours and forty minutes. Hélio was 42 years old weighing 150 pounds; Santana was 26, weighing 170 pounds. The match was fought in gis with no time limit. Santana dominated with ground and pound, ultimately winning by knockout with a soccer kick to the head. The violence of that fight led to vale tudo being prohibited in Rio de Janeiro and generated headlines in every newspaper in the city. Santana became known as "Leopardo Negro" (Black Leopard)—characterized as the "primeiro herói negro do esporte brasileiro" (first Black hero of Brazilian sports).

After the Gracie expulsion, Santana trained with Haroldo Brito''s academy in Ipanema and with George Gracie. He faced Carlson Gracie six times between 1955-1970, with Carlson winning two and four ending in draws. In 1959, he twice faced the legendary Japanese judoka Masahiko Kimura in Salvador—losing the first match by armlock but earning a 40-minute draw in the vale tudo rematch, an accomplishment considered remarkable given Kimura''s reputation.

Santana opened his own academy in Rio with his younger brother Valdo, cousin Aurino, and nephew Maneca. The Academia Santana taught judo, jiu-jitsu, capoeira, and luta livre. It was here that the young founders of Grupo Senzala—Paulo Flores, Mestre Gato, and others—trained in the early 1960s.

A famous photograph from this era shows Santana holding Regional capoeira Mestre Artur Emídio above his head with one hand—demonstrating both his strength and his connection to the capoeira world. Santana was instrumental in bringing Artur Emídio from Bahia to Rio, where Emídio would influence an entire generation of Rio capoeiristas including Mestre Leopoldina.

Later, Santana became an instructor at Brazil''s national police academy in Brasília, a position he held for 13 years. His fighting career was halted not by losses or age, but by a serious car accident in Brasília around 1975 that injured his femur.

Despite his injuries, Santana continued teaching from his Brasília academy. In 1980, he identified a young talent from Manaus named Casemiro Nascimento Martins (who would become known as Rei Zulu). Santana was so impressed that he arranged a match with Rickson Gracie, continuing the rivalry that had started 25 years earlier into the next generation.

In Bahia, Santana trained Mestre Boa Gente at his vale-tudo academy. Boa Gente, already skilled in Capoeira Angola under Mestre Gato Preto, became MMA champion of Bahia in 1974 after training with "Leopardo Negro". Santana also trained Mestre Bom Cabrito in karate, hapkido, and vale-tudo in 1968.

Santana returned to Bahia in his final years and died in August 1984 from a stroke at the Hospital Espanhol in Salvador. He was 54 years old.

His legacy extends beyond his famous defeat of Hélio Gracie. Through the Santana brothers'' academy, he helped shape early Grupo Senzala. Through bringing Artur Emídio to Rio, he connected Bahian capoeira with the carioca scene. Through training Boa Gente and others, he bridged traditional capoeira with competitive martial arts. And through discovering Rei Zulu, he ensured the vale-tudo tradition continued into the next generation.',
  -- bio_pt
  E'Waldemar Santana nasceu em 28 de outubro de 1929, em Salvador, Bahia. Como afro-brasileiro naquela época, as oportunidades eram limitadas, mas o jovem Waldemar demonstrou talento atlético excepcional. Na juventude, começou a treinar Capoeira Regional com Mestre Bimba—o fundador do estilo que estava transformando a capoeira tradicional em uma arte marcial estruturada.

Sob o rigoroso regime de Bimba na Academia-escola de Cultura Regional no Engenho de Brotas, Santana desenvolveu proficiência na ginga, meia lua de compasso, saídas de chão e o pensamento estratégico que mais tarde o serviria nas lutas profissionais. A agilidade, flexibilidade e consciência de combate instiladas por Bimba tornaram-se a base de sua carreira de lutador.

Buscando maiores oportunidades, Santana mudou-se para o Rio de Janeiro, onde por volta de 1951 ingressou na Academia Gracie. Inicialmente fazendo trabalho de manutenção para compensar os custos do treinamento, rapidamente provou seu valor como lutador, tornando-se instrutor. Sua primeira luta profissional foi em 26 de fevereiro de 1953. Destacou-se particularmente no formato vale-tudo, combinando seus golpes de capoeira com técnicas de agarramento.

Em janeiro de 1955, Santana foi expulso da Academia Gracie após lutar contra Rene Bastos sob o promotor Karol Nowina—trabalhando para um rival. O rompimento com Hélio Gracie levou a uma das lutas mais significativas na história das artes marciais brasileiras.

Em 24 de maio de 1955, Santana enfrentou seu ex-mestre Hélio Gracie em uma luta de vale-tudo que duraria mais de três horas e quarenta minutos. Hélio tinha 42 anos e pesava 68 kg; Santana tinha 26 anos e pesava 77 kg. A luta foi travada de quimono sem limite de tempo. Santana dominou com ground and pound, vencendo por nocaute com um chute de futebol na cabeça. A violência daquela luta levou à proibição do vale-tudo no Rio de Janeiro e gerou manchetes em todos os jornais da cidade. Santana ficou conhecido como "Leopardo Negro"—caracterizado como o "primeiro herói negro do esporte brasileiro".

Após a expulsão da Gracie, Santana treinou na academia de Haroldo Brito em Ipanema e com George Gracie. Enfrentou Carlson Gracie seis vezes entre 1955-1970, com Carlson vencendo duas e quatro terminando em empate. Em 1959, enfrentou duas vezes o lendário judoca japonês Masahiko Kimura em Salvador—perdendo a primeira luta por chave de braço, mas conseguindo um empate de 40 minutos na revanche de vale-tudo, uma conquista considerada notável dada a reputação de Kimura.

Santana abriu sua própria academia no Rio com seu irmão mais novo Valdo, primo Aurino e sobrinho Maneca. A Academia Santana ensinava judô, jiu-jitsu, capoeira e luta livre. Foi aqui que os jovens fundadores do Grupo Senzala—Paulo Flores, Mestre Gato e outros—treinaram no início dos anos 1960.

Uma famosa fotografia desta época mostra Santana segurando o Mestre de Capoeira Regional Artur Emídio acima da cabeça com uma mão—demonstrando tanto sua força quanto sua conexão com o mundo da capoeira. Santana foi fundamental para trazer Artur Emídio da Bahia para o Rio, onde Emídio influenciaria toda uma geração de capoeiristas cariocas incluindo Mestre Leopoldina.

Posteriormente, Santana tornou-se instrutor na academia da polícia nacional do Brasil em Brasília, posição que ocupou por 13 anos. Sua carreira de lutador foi interrompida não por derrotas ou idade, mas por um sério acidente de carro em Brasília por volta de 1975 que lesionou seu fêmur.

Apesar de suas lesões, Santana continuou ensinando em sua academia de Brasília. Em 1980, identificou um jovem talento de Manaus chamado Casemiro Nascimento Martins (que se tornaria conhecido como Rei Zulu). Santana ficou tão impressionado que arranjou uma luta com Rickson Gracie, continuando a rivalidade que havia começado 25 anos antes para a próxima geração.

Na Bahia, Santana treinou Mestre Boa Gente em sua academia de vale-tudo. Boa Gente, já habilidoso em Capoeira Angola sob Mestre Gato Preto, tornou-se campeão de MMA da Bahia em 1974 após treinar com o "Leopardo Negro". Santana também treinou Mestre Bom Cabrito em karatê, hapkido e vale-tudo em 1968.

Santana retornou à Bahia em seus últimos anos e morreu em agosto de 1984 de um AVC no Hospital Espanhol em Salvador. Tinha 54 anos.

Seu legado se estende além de sua famosa derrota de Hélio Gracie. Através da academia dos irmãos Santana, ajudou a moldar o início do Grupo Senzala. Ao trazer Artur Emídio para o Rio, conectou a capoeira baiana com a cena carioca. Ao treinar Boa Gente e outros, fez a ponte entre a capoeira tradicional e as artes marciais competitivas. E ao descobrir Rei Zulu, garantiu que a tradição do vale-tudo continuasse na próxima geração.',
  -- achievements_en
  E'Only person to defeat Hélio Gracie in vale tudo (May 24, 1955 - 3h 40min match); Drew with Masahiko Kimura in vale tudo rematch (July 1959); Characterized as "primeiro herói negro do esporte brasileiro" (first Black hero of Brazilian sports); Instructor at Brazilian national police academy (13 years); Discovered and mentored Rei Zulu (Casemiro Nascimento Martins); Founded Academia Santana in Rio de Janeiro (with brother Valdo); Bridge figure connecting Bahian capoeira with Rio de Janeiro; Trained multiple capoeira mestres in vale-tudo (Boa Gente, Bom Cabrito, Pombo de Ouro)',
  -- achievements_pt
  E'Única pessoa a derrotar Hélio Gracie em vale-tudo (24 de maio de 1955 - luta de 3h 40min); Empatou com Masahiko Kimura na revanche de vale-tudo (julho de 1959); Caracterizado como "primeiro herói negro do esporte brasileiro"; Instrutor na academia da polícia nacional brasileira (13 anos); Descobriu e orientou Rei Zulu (Casemiro Nascimento Martins); Fundou a Academia Santana no Rio de Janeiro (com irmão Valdo); Figura de ligação conectando a capoeira baiana com o Rio de Janeiro; Treinou vários mestres de capoeira em vale-tudo (Boa Gente, Bom Cabrito, Pombo de Ouro)',
  -- notes_en
  E'BIRTH DATE: October 28, 1929 (consistent across sources)

DEATH DATE DISCREPANCY:
- EcuRed: August 26, 1984
- Tapology: August 1, 1984
- CapoeiraWiki: August 29, 1984
- simonbjj.com: September 27, 1984
- One source says he died in 1982 (likely error)
Using month precision (August 1984) due to conflicting dates.
Location: Hospital Espanhol, Salvador, Bahia. Cause: stroke (AVC).

NAME SPELLING:
- "Waldemar" - Used in most Portuguese sources, simonbjj, academic article
- "Valdemar" - Used in English Wikipedia, CapoeiraWiki
Both spellings appear in primary sources. Using "Waldemar" as it appears more frequently in detailed Portuguese sources.

TEACHERS:
- Mestre Bimba (capoeira, youth in Salvador)
- Hélio Gracie (BJJ, ~1951-1955, Rio de Janeiro)
- Carlos Gracie (BJJ, mentioned alongside Hélio)
- George Gracie (post-expulsion)
- Haroldo Brito (post-expulsion, Ipanema)

STUDENTS (documented):
- Mestre Boa Gente - MMA training (~1970s), became MMA champion Bahia 1974
- Mestre Pombo de Ouro - Met 1969 in Manaus, considered Santana "his other Mestre"
- Mestre Bom Cabrito - Karate, hapkido, vale-tudo (1968)
- Paulo Flores (Senzala) - Trained at Academia Santana 1962
- Mestre Gato (Senzala) - Trained at Academia Santana early 1960s
- Rei Zulu (Casemiro Nascimento Martins) - Discovered 1980, arranged Rickson fights

FAMILY:
- Brother: Valdo Santana (capoeira mestre, co-founded Academia Santana, defeated Robson Gracie)
- Cousin: Aurino (helped run Rio academy)
- Nephew: Maneca (helped run Rio academy)
- Nephew: Neivaldo Santana (Valdo''s son, continues family legacy)

ACADEMIES:
- Academia Santana, Rio de Janeiro (above Bar Amarelinho, Cinelândia) - with Valdo, ~1955-1970s
- Academia in Brasília - National police academy instructor, 13 years
- Academy in Salvador - later years

KEY DATES:
- ~1951: Joined Gracie Academy, Rio
- Feb 26, 1953: First professional fight
- Jan 15, 1955: Expelled from Gracie Academy
- May 24, 1955: Defeated Hélio Gracie (famous match)
- 1955-1970: Six matches with Carlson Gracie (2 losses, 4 draws)
- July 1959: Two matches with Masahiko Kimura (1 loss, 1 draw)
- ~1960s: Academy Santana operated in Rio
- ~1975: Car accident in Brasília ended fighting career
- 1980: Discovered Rei Zulu
- August 1984: Died of stroke in Salvador

PHOTO DOCUMENTATION:
- Famous photo showing Santana holding Artur Emídio above his head with one hand (early 1960s)

ACADEMIC SOURCE:
"Construção da Prática da Capoeira no Rio de Janeiro Através dos Mestres Waldemar Santana e Valdo Santana" - Revista Carioca de Educação Física, v. 15, n. 2 (2020)',
  -- notes_pt
  E'DATA DE NASCIMENTO: 28 de outubro de 1929 (consistente entre fontes)

DISCREPÂNCIA DATA DE MORTE:
- EcuRed: 26 de agosto de 1984
- Tapology: 1 de agosto de 1984
- CapoeiraWiki: 29 de agosto de 1984
- simonbjj.com: 27 de setembro de 1984
- Uma fonte diz que morreu em 1982 (provável erro)
Usando precisão de mês (agosto de 1984) devido a datas conflitantes.
Local: Hospital Espanhol, Salvador, Bahia. Causa: AVC.

GRAFIA DO NOME:
- "Waldemar" - Usado na maioria das fontes em português, simonbjj, artigo acadêmico
- "Valdemar" - Usado na Wikipedia inglesa, CapoeiraWiki
Ambas as grafias aparecem em fontes primárias. Usando "Waldemar" pois aparece mais frequentemente em fontes detalhadas em português.

MESTRES:
- Mestre Bimba (capoeira, juventude em Salvador)
- Hélio Gracie (BJJ, ~1951-1955, Rio de Janeiro)
- Carlos Gracie (BJJ, mencionado junto com Hélio)
- George Gracie (pós-expulsão)
- Haroldo Brito (pós-expulsão, Ipanema)

ALUNOS (documentados):
- Mestre Boa Gente - Treinamento MMA (~anos 1970), tornou-se campeão de MMA da Bahia 1974
- Mestre Pombo de Ouro - Conheceu em 1969 em Manaus, considerava Santana "seu outro Mestre"
- Mestre Bom Cabrito - Karatê, hapkido, vale-tudo (1968)
- Paulo Flores (Senzala) - Treinou na Academia Santana 1962
- Mestre Gato (Senzala) - Treinou na Academia Santana início anos 1960
- Rei Zulu (Casemiro Nascimento Martins) - Descoberto 1980, arranjou lutas com Rickson

FAMÍLIA:
- Irmão: Valdo Santana (mestre de capoeira, co-fundou Academia Santana, derrotou Robson Gracie)
- Primo: Aurino (ajudou a administrar academia no Rio)
- Sobrinho: Maneca (ajudou a administrar academia no Rio)
- Sobrinho: Neivaldo Santana (filho de Valdo, continua legado familiar)

ACADEMIAS:
- Academia Santana, Rio de Janeiro (acima do Bar Amarelinho, Cinelândia) - com Valdo, ~1955-1970s
- Academia em Brasília - Instrutor na academia da polícia nacional, 13 anos
- Academia em Salvador - últimos anos

DATAS IMPORTANTES:
- ~1951: Ingressou na Academia Gracie, Rio
- 26 fev 1953: Primeira luta profissional
- 15 jan 1955: Expulso da Academia Gracie
- 24 mai 1955: Derrotou Hélio Gracie (luta famosa)
- 1955-1970: Seis lutas com Carlson Gracie (2 derrotas, 4 empates)
- Julho 1959: Duas lutas com Masahiko Kimura (1 derrota, 1 empate)
- ~anos 1960: Academia Santana operou no Rio
- ~1975: Acidente de carro em Brasília encerrou carreira de lutador
- 1980: Descobriu Rei Zulu
- Agosto 1984: Morreu de AVC em Salvador

DOCUMENTAÇÃO FOTOGRÁFICA:
- Famosa foto mostrando Santana segurando Artur Emídio acima da cabeça com uma mão (início anos 1960)

FONTE ACADÊMICA:
"Construção da Prática da Capoeira no Rio de Janeiro Através dos Mestres Waldemar Santana e Valdo Santana" - Revista Carioca de Educação Física, v. 15, n. 2 (2020)'
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
