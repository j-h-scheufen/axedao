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
