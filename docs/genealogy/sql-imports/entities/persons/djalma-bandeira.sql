-- ============================================================
-- GENEALOGY PERSON: Djalma Bandeira
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR: 1934 - Confirmed by capoeirahistory.com
-- DEATH YEAR: 1988 - Confirmed by capoeirahistory.com
--
-- STYLE: Regional/Contemporary - Inherited from his teacher Artur
-- Emídio. Described as "upright and objective capoeira" which he
-- developed through his prize-fighting background. Notably, despite
-- his training in jiu-jitsu, karate, and Portuguese stick fighting,
-- he never applied these in his capoeira game.
--
-- LINEAGE: Neném (African) → Paizinho → Artur Emídio → Djalma Bandeira
--
-- SIGNIFICANCE: First student of Mestre Artur Emídio; travel companion
-- on pioneering international capoeira tours (New York, Paris, Buenos
-- Aires, Acapulco); participated in official introduction of capoeira
-- to Brazilian Navy (1961); founder of Grupo de Capoeira Djalma
-- Bandeira at IAPC in Olaria; referee adviser to Capoeira Directorate
-- of Brazilian Federation of Pugilism (1975); trained students who
-- became important mestres including Vilmar.
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
  'Djalma Bandeira Lima',
  'Djalma Bandeira',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Djalma Bandeira''s style was described as "upright and objective capoeira" - characteristics he acquired through his prize-fighting career in the 1950s. Despite his extensive cross-training in jiu-jitsu (with the Gracies in Copacabana), karate (at Kobucana academy on Largo da Carioca), and Portuguese stick fighting, he was notable for never applying these techniques in his capoeira game. He was very technical and demanding, requiring his students to wear uniforms. His approach reflected the systematized Bahian method transmitted through his teacher Artur Emídio, though his personal style became more direct and combative through his ring experience.',
  E'O estilo de Djalma Bandeira era descrito como uma "capoeira ereta e objetiva" - características que adquiriu através de sua carreira de lutador profissional nos anos 1950. Apesar de seu extenso treinamento cruzado em jiu-jitsu (com os Gracies em Copacabana), karatê (na academia Kobucana no Largo da Carioca) e jogo do pau português, ele era notável por nunca aplicar essas técnicas em seu jogo de capoeira. Era muito técnico e exigente, demandando que seus alunos usassem uniformes. Sua abordagem refletia o método sistematizado baiano transmitido através de seu mestre Artur Emídio, embora seu estilo pessoal tenha se tornado mais direto e combativo através de sua experiência nos ringues.',
  -- Life dates
  1934,
  'exact'::genealogy.date_precision,
  'Sergipe, Brazil',
  1988,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Djalma Bandeira Lima was born in 1934 in Sergipe and spent the greater part of his life in the neighborhood of Olaria, in the northern suburbs of Rio de Janeiro. By profession, he was a tailor.

He learned capoeira from Mestre Artur Emídio de Oliveira, becoming his very first student and building what writer André Lacé Lopes described as a partnership akin to "Don Quixote and Sancho Panza." This close professional and personal relationship would define much of his capoeira career.

A lover of martial arts, Djalma studied jiu-jitsu with the Gracie family in Copacabana, karate at the Kobucana academy on Largo da Carioca, and became an expert practitioner of Portuguese stick fighting (jogo do pau). This passion for combat sports led him to work as a professional fighter during the 1950s and participate in competitions, though without much success. In one such fight against Angelito Cruz, Djalma lost after his opponent applied a footlock. According to his student Mestre Vilmar, he eventually quit fighting to devote himself entirely to capoeira.

His dedication resulted in a famous partnership with Artur Emídio. The two traveled together performing in shows on Brazilian popular culture, with both responsible for the capoeira aspect of these productions. Working with producers Abraão Medina and Carlos Machado, they performed throughout Brazil and internationally - in Buenos Aires, Acapulco, New York, Paris, cities in the Iberian Peninsula, and many other locations. Some of these shows became famous in Rio de Janeiro, including "Capital Samba," "Skindô," and the musical "Arco-Íris," which featured great artists such as Joãozinho da Goméia, Ary Barroso, and Mestre Paraná.

In 1961, Djalma Bandeira and Artur Emídio participated in the official introduction of capoeira into the Brazilian Navy. Working with Lieutenant Lamartine Pereira da Costa from the School of Physical Education, the duo assisted in teaching a course on the "methodology of teaching capoeira" to 208 officers and enlisted men at the Navy Sports Centre. The objective was to train capoeira monitors who would propagate the practice throughout all Navy establishments.

Despite his journey being marked by his partnership with Artur Emídio and their shows, Djalma Bandeira established himself as a significant capoeira teacher and martial arts researcher in his own right. He started to organize capoeira classes in Olaria, specifically at the IAPC Residential Complex Community Centre, where he founded Grupo de Capoeira Djalma Bandeira. He taught children for free and began staging exhibitions with students from his group.

One of his most notable students was Mestre Vilmar (Vilmar Brito Cruz), who described his teacher as "one of the best capoeira masters that a suburb of Rio de Janeiro has ever produced, in a time when the best capoeira in the world was played in the suburbs of Rio." Celso Pepe, who later became an important mestre himself, was a neighbor at the IAPC estate and first encountered capoeira in 1957 through Djalma''s Sunday classes. Though initially refused due to his young age of eight, Celso watched Djalma''s training and rodas, later crediting Djalma with teaching him the São Bento Grande game.

Djalma Bandeira also participated in the early stages of regulating capoeira practice in Rio de Janeiro. In 1975, he was appointed referee adviser to the Capoeira Directorate of the Brazilian Federation of Pugilism (where capoeira was administratively housed at the time).

He was part of a whole generation of capoeiristas born in the 1930s - including Artur Emídio, Leopoldina, Mário Buscapé, Roque, Paulo Gomes, and Celso do Engenho - who formed the core from which contemporary capoeira developed in Rio de Janeiro. During the sixties and seventies, the North Zone''s finest capoeira was concentrated in Bonsucesso and surrounding neighborhoods like Higienópolis and Olaria, where masters like Artur Emídio, Paraná, Djalma Bandeira, Mário Buscapé, and Mentirinha lived, worked, or taught.

Those who knew him described Djalma as "frank and sincere, almost rude, a good character, a good friend." He died in 1988, at approximately 54 years of age.',
  -- Extended content (Portuguese)
  E'Djalma Bandeira Lima nasceu em 1934 em Sergipe e passou a maior parte de sua vida no bairro de Olaria, nos subúrbios norte do Rio de Janeiro. De profissão, era alfaiate.

Aprendeu capoeira com Mestre Artur Emídio de Oliveira, tornando-se seu primeiro aluno e construindo o que o escritor André Lacé Lopes descreveu como uma parceria semelhante a "Dom Quixote e Sancho Pança." Essa relação profissional e pessoal próxima definiria grande parte de sua carreira na capoeira.

Amante das artes marciais, Djalma estudou jiu-jitsu com a família Gracie em Copacabana, karatê na academia Kobucana no Largo da Carioca e tornou-se praticante especialista do jogo do pau português. Essa paixão por esportes de combate o levou a trabalhar como lutador profissional durante os anos 1950 e participar de competições, embora sem muito sucesso. Em uma dessas lutas contra Angelito Cruz, Djalma perdeu após seu oponente aplicar uma chave de pé. Segundo seu aluno Mestre Vilmar, ele eventualmente abandonou as lutas para se dedicar inteiramente à capoeira.

Sua dedicação resultou em uma famosa parceria com Artur Emídio. Os dois viajavam juntos se apresentando em shows sobre cultura popular brasileira, ambos responsáveis pelo aspecto de capoeira dessas produções. Trabalhando com os produtores Abraão Medina e Carlos Machado, se apresentaram por todo o Brasil e internacionalmente - em Buenos Aires, Acapulco, Nova York, Paris, cidades da Península Ibérica e muitos outros locais. Alguns desses shows se tornaram famosos no Rio de Janeiro, incluindo "Capital Samba," "Skindô" e o musical "Arco-Íris," que contou com grandes artistas como Joãozinho da Goméia, Ary Barroso e Mestre Paraná.

Em 1961, Djalma Bandeira e Artur Emídio participaram da introdução oficial da capoeira na Marinha do Brasil. Trabalhando com o Tenente Lamartine Pereira da Costa da Escola de Educação Física, a dupla auxiliou no ensino de um curso sobre a "metodologia de ensino de capoeira" para 208 oficiais e praças no Centro de Esportes da Marinha. O objetivo era formar monitores de capoeira que propagariam a prática em todos os estabelecimentos da Marinha.

Apesar de sua trajetória ser marcada pela parceria com Artur Emídio e seus shows, Djalma Bandeira se estabeleceu como um significativo professor de capoeira e pesquisador de artes marciais por mérito próprio. Começou a organizar aulas de capoeira em Olaria, especificamente no Centro Comunitário do Conjunto Residencial do IAPC, onde fundou o Grupo de Capoeira Djalma Bandeira. Ensinava crianças gratuitamente e começou a fazer exibições com alunos de seu grupo.

Um de seus alunos mais notáveis foi Mestre Vilmar (Vilmar Brito Cruz), que descreveu seu professor como "um dos melhores mestres de capoeira que um subúrbio do Rio de Janeiro já produziu, em uma época em que a melhor capoeira do mundo era jogada nos subúrbios do Rio." Celso Pepe, que mais tarde se tornou um importante mestre, era vizinho no conjunto IAPC e conheceu a capoeira pela primeira vez em 1957 através das aulas de domingo de Djalma. Embora inicialmente recusado devido à sua pouca idade de oito anos, Celso assistia aos treinos e rodas de Djalma, creditando-o mais tarde por ensinar-lhe o jogo de São Bento Grande.

Djalma Bandeira também participou dos estágios iniciais da regulamentação da prática de capoeira no Rio de Janeiro. Em 1975, foi nomeado conselheiro de arbitragem da Diretoria de Capoeira da Confederação Brasileira de Pugilismo (onde a capoeira estava administrativamente alocada na época).

Ele fazia parte de toda uma geração de capoeiristas nascidos nos anos 1930 - incluindo Artur Emídio, Leopoldina, Mário Buscapé, Roque, Paulo Gomes e Celso do Engenho - que formou o núcleo a partir do qual a capoeira contemporânea se desenvolveu no Rio de Janeiro. Durante os anos sessenta e setenta, a melhor capoeiragem da Zona Norte estava concentrada em Bonsucesso e bairros vizinhos como Higienópolis e Olaria, onde mestres como Artur Emídio, Paraná, Djalma Bandeira, Mário Buscapé e Mentirinha moravam, trabalhavam ou ensinavam.

Aqueles que o conheciam descreviam Djalma como "franco e sincero, quase rude, de bom caráter, um bom amigo." Ele faleceu em 1988, com aproximadamente 54 anos de idade.',
  -- Achievements (English)
  E'- First student of Mestre Artur Emídio
- Pioneer of international capoeira performance touring (New York, Paris, Buenos Aires, Acapulco, Iberian Peninsula) in the 1950s-60s
- Participated in official introduction of capoeira to Brazilian Navy (1961)
- Founder of Grupo de Capoeira Djalma Bandeira at IAPC Residential Complex, Olaria
- Appointed referee adviser to Capoeira Directorate of Brazilian Federation of Pugilism (1975)
- Taught children free of charge in the northern suburbs of Rio de Janeiro
- Featured performer in folklore shows "Capital Samba," "Skindô," and musical "Arco-Íris"
- Part of founding generation of contemporary capoeira in Rio de Janeiro
- Expert in Portuguese stick fighting (jogo do pau)',
  -- Achievements (Portuguese)
  E'- Primeiro aluno de Mestre Artur Emídio
- Pioneiro em turnês internacionais de apresentação de capoeira (Nova York, Paris, Buenos Aires, Acapulco, Península Ibérica) nos anos 1950-60
- Participou da introdução oficial da capoeira na Marinha do Brasil (1961)
- Fundador do Grupo de Capoeira Djalma Bandeira no Conjunto Residencial do IAPC, Olaria
- Nomeado conselheiro de arbitragem da Diretoria de Capoeira da Confederação Brasileira de Pugilismo (1975)
- Ensinou crianças gratuitamente nos subúrbios norte do Rio de Janeiro
- Artista em destaque nos shows folclóricos "Capital Samba," "Skindô" e musical "Arco-Íris"
- Parte da geração fundadora da capoeira contemporânea no Rio de Janeiro
- Especialista em jogo do pau português',
  -- Researcher notes (English)
  E'BIRTH YEAR: 1934 - Confirmed by capoeirahistory.com. Sergipe is the stated birthplace, though no more specific location is given.

DEATH YEAR: 1988 - Confirmed by capoeirahistory.com. Death place assumed to be Rio de Janeiro where he lived.

RELATIONSHIP WITH ARTUR EMÍDIO: Described as "his first student" and characterized by André Lacé Lopes as a "Don Quixote and Sancho Panza" partnership. The two traveled extensively together and performed as a duo.

MARTIAL ARTS CROSS-TRAINING: Despite training in jiu-jitsu (Gracie family), karate (Kobucana academy), and Portuguese stick fighting, sources emphasize he "never applied jiu-jitsu or karate in his capoeira game." This suggests a purist approach to capoeira despite his eclectic martial arts background.

PROFESSIONAL FIGHTING: Worked as a professional fighter in the 1950s "without much success." Lost to Angelito Cruz by footlock.

STUDENTS:
- Mestre Vilmar (Vilmar Brito Cruz) - confirmed student, gave testimony about Djalma
- Celso Pepe - neighbor at IAPC; observed Djalma''s classes from 1957; credits Djalma with teaching São Bento Grande game; was also trained by Leopoldina

NAVY COURSE (1961): Assisted Lamartine Pereira da Costa in teaching 208 naval personnel. Lamartine was also a student of Artur Emídio. This represents one of the first institutional adoptions of capoeira by Brazilian military.

GRUPO DE CAPOEIRA DJALMA BANDEIRA: Founded at IAPC Residential Complex in Olaria. The IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) was a social security housing estate. The group established itself at the Community Centre there.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/ (primary)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-celso-pepe-1949/
- capoeirahistory.com/mestre/professor-lamartine-eng-1935/
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: 1934 - Confirmado por capoeirahistory.com. Sergipe é o local de nascimento indicado, embora não seja dado local mais específico.

ANO DE FALECIMENTO: 1988 - Confirmado por capoeirahistory.com. Local de falecimento presumido ser Rio de Janeiro, onde ele morava.

RELACIONAMENTO COM ARTUR EMÍDIO: Descrito como "seu primeiro aluno" e caracterizado por André Lacé Lopes como uma parceria "Dom Quixote e Sancho Pança". Os dois viajaram extensivamente juntos e se apresentavam como dupla.

TREINAMENTO CRUZADO EM ARTES MARCIAIS: Apesar de treinar jiu-jitsu (família Gracie), karatê (academia Kobucana) e jogo do pau português, as fontes enfatizam que ele "nunca aplicou jiu-jitsu ou karatê em seu jogo de capoeira." Isso sugere uma abordagem purista à capoeira apesar de seu histórico eclético em artes marciais.

LUTAS PROFISSIONAIS: Trabalhou como lutador profissional nos anos 1950 "sem muito sucesso." Perdeu para Angelito Cruz por chave de pé.

ALUNOS:
- Mestre Vilmar (Vilmar Brito Cruz) - aluno confirmado, deu depoimento sobre Djalma
- Celso Pepe - vizinho no IAPC; observou as aulas de Djalma desde 1957; credita a Djalma o ensino do jogo de São Bento Grande; também foi treinado por Leopoldina

CURSO DA MARINHA (1961): Auxiliou Lamartine Pereira da Costa no ensino de 208 militares navais. Lamartine também era aluno de Artur Emídio. Isso representa uma das primeiras adoções institucionais da capoeira pelas forças armadas brasileiras.

GRUPO DE CAPOEIRA DJALMA BANDEIRA: Fundado no Conjunto Residencial do IAPC em Olaria. O IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) era um conjunto habitacional da previdência social. O grupo se estabeleceu no Centro Comunitário de lá.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/ (primária)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-celso-pepe-1949/
- capoeirahistory.com/mestre/professor-lamartine-eng-1935/
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/'
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
