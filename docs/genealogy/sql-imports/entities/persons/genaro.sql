-- ============================================================
-- GENEALOGY PERSON: Genaro
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH DATE: June 21, 1934 - Confirmed by capoeirahistory.com
-- DEATH DATE: February 28, 2022 - Confirmed by multiple sources
-- (Note: Input said 1934-2022, death date confirmed as Feb 28, 2022)
--
-- SIGNIFICANCE: Guardian of Rio de Janeiro capoeira history;
-- student of Mestre Artur Emídio; excellent pandeiro and berimbau
-- player; gave testimony for "From the Ring to the Stage" documentary;
-- performed with major MPB artists; composed new version of "Paranaê"
-- honoring Mestre Paraná.
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
  'Genaro Raimundo Coelho',
  'Genaro',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-genaro-1934/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Genaro was renowned as an excellent pandeiro (tambourine) player and also played berimbau in rodas and presentations. He learned berimbau from Mestre Paraná, who often directed the bateria at Artur Emídio''s rodas. Genaro accompanied Paraná and developed deep knowledge of the musical traditions of Rio de Janeiro capoeira. His training under Artur Emídio placed him within the Regional lineage, though the eclectic environment of Artur''s Sunday rodas exposed him to diverse styles.',
  E'Genaro era reconhecido como excelente tocador de pandeiro e também tocava berimbau nas rodas e apresentações. Aprendeu berimbau com Mestre Paraná, que frequentemente dirigia a bateria nas rodas de Artur Emídio. Genaro acompanhava Paraná e desenvolveu profundo conhecimento das tradições musicais da capoeira carioca. Seu treinamento sob Artur Emídio o colocou na linhagem Regional, embora o ambiente eclético das rodas de domingo de Artur o tenha exposto a estilos diversos.',
  -- Life dates
  1934,
  'exact'::genealogy.date_precision,
  'Nazaré, Salvador, Bahia, Brazil',
  2022,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Genaro Raimundo Coelho was born on June 21, 1934, in the Nazaré neighborhood of Salvador, Bahia, at the Maternidade Doutor Climério de Oliveira. At age three, he came to Rio de Janeiro brought by his godmother, Senhora Almerinda dos Santos, and the family settled in Bonsucesso. However, at age ten, he had to return to his birthplace to work.

His first contact with capoeira came through the rodas at the Feira de Água de Meninos in Salvador - a vibrant market environment where capoeira was part of the cultural fabric.

After struggling to find work in Salvador, Genaro returned to Rio de Janeiro at age nineteen, going to live with his godmother in the Higienópolis neighborhood, hoping for better professional opportunities. As soon as he arrived, he joined the army, and it was around this time that he met Mestre Artur Emídio, who was living on the nearby Avenida dos Democráticos. Meeting with Artur Emídio, Valdemar Santana, and others, these young men shared an interest in capoeira and other martial arts.

Frustrated with his defeat in the fight against Robson Gracie, Artur Emídio was motivated by his friends to focus on teaching capoeira. Genaro became his student and participated in capoeira presentations from 1955 onwards. His first presentation was at the Christian Association of Young Men (ACM) in the Lapa neighborhood.

With Artur Emídio, Djalma Bandeira, and Vilela, Genaro participated in the television show "A Noite dos Escravos" (The Night of the Slaves) on TV Rio in 1957, invited by the producer Haroldo Costa. This was a significant moment for capoeira''s visibility in Brazilian media.

It didn''t take long for Genaro to meet Mestre Paraná (Osvaldo Lisboa dos Santos), with whom he learned to play berimbau. Paraná often assumed the direction of the orchestra (bateria) at Artur Emídio''s roda, and Genaro accompanied him. In addition to being an excellent pandeiro player, Genaro also played berimbau in presentations and rodas - a legacy of his apprenticeship with Mestre Paraná.

Genaro toured internationally with a capoeira group, traveling to Portugal, Mexico, Germany, and France. In one memorable presentation in Rio with Tom Jobim, Caetano Veloso, Maria Bethânia, and other MPB musicians and composers, Genaro composed a new version of "Paranaê", a traditional song in the public domain, honoring his berimbau teacher Mestre Paraná. There is a famous photograph in which Genaro appears with his tambourine and wide smile in the recording studio alongside names like Nelson Motta, Caetano Veloso, Maria Bethânia, Paraná, and Jards Macalé.

Genaro was considered one of the great guardians of the history of capoeira in Rio de Janeiro, alongside Mestre Polaco (1949-2021). Both gave testimonies for the documentary "From the Ring to the Stage" about Mestre Artur Emídio before their deaths. The filmmakers expressed regret that they didn''t have the resources to finalize the documentary before the departure of these old masters.

Genaro died on February 28, 2022, on a Carnival day and one day before the anniversary of the city of Rio de Janeiro - dates described as significant to the memory and culture of Rio, and certainly to the capoeira that he loved. Professor Marcelo Cardoso da Costa, a doctoral candidate in Social Memory at UNIRIO, noted: "The Master departed on a Carnival day and one day before the anniversary of the city of Rio de Janeiro. Landmark dates of Cariocan memory and culture". Citing Amadou Hampâté Bâ: "In Africa, each elder who dies is a library that burns". The death of Masters of Capoeira has caused the loss of many "libraries" in Rio de Janeiro and Brazil.',
  -- Extended content (Portuguese)
  E'Genaro Raimundo Coelho nasceu em 21 de junho de 1934, no bairro de Nazaré, em Salvador, Bahia, na Maternidade Doutor Climério de Oliveira. Aos três anos, veio para o Rio de Janeiro trazido por sua madrinha, Senhora Almerinda dos Santos, e a família se estabeleceu em Bonsucesso. Porém, aos dez anos, teve que retornar à sua terra natal para trabalhar.

Seu primeiro contato com a capoeira foi através das rodas na Feira de Água de Meninos em Salvador - um ambiente de mercado vibrante onde a capoeira fazia parte do tecido cultural.

Após dificuldades para encontrar trabalho em Salvador, Genaro retornou ao Rio de Janeiro aos dezenove anos, indo morar com sua madrinha no bairro de Higienópolis, esperando melhores oportunidades profissionais. Assim que chegou, alistou-se no exército, e foi por essa época que conheceu Mestre Artur Emídio, que morava na vizinha Avenida dos Democráticos. Encontrando-se com Artur Emídio, Valdemar Santana e outros, esses jovens compartilhavam interesse pela capoeira e outras artes marciais.

Frustrado com sua derrota na luta contra Robson Gracie, Artur Emídio foi motivado por seus amigos a se dedicar ao ensino de capoeira. Genaro se tornou seu aluno e participou de apresentações de capoeira a partir de 1955. Sua primeira apresentação foi na Associação Cristã de Moços (ACM) no bairro da Lapa.

Com Artur Emídio, Djalma Bandeira e Vilela, Genaro participou do programa de televisão "A Noite dos Escravos" na TV Rio em 1957, convidado pelo produtor Haroldo Costa. Este foi um momento significativo para a visibilidade da capoeira na mídia brasileira.

Não demorou muito para Genaro conhecer Mestre Paraná (Osvaldo Lisboa dos Santos), com quem aprendeu a tocar berimbau. Paraná frequentemente assumia a direção da orquestra (bateria) na roda de Artur Emídio, e Genaro o acompanhava. Além de ser excelente tocador de pandeiro, Genaro também tocava berimbau nas apresentações e rodas - legado de seu aprendizado com Mestre Paraná.

Genaro excursionou internacionalmente com um grupo de capoeira, viajando para Portugal, México, Alemanha e França. Em uma apresentação memorável no Rio com Tom Jobim, Caetano Veloso, Maria Bethânia e outros músicos e compositores da MPB, Genaro compôs uma nova versão de "Paranaê", uma canção tradicional de domínio público, homenageando seu professor de berimbau Mestre Paraná. Existe uma foto famosa em que Genaro aparece com seu pandeiro e largo sorriso no estúdio de gravação ao lado de nomes como Nelson Motta, Caetano Veloso, Maria Bethânia, Paraná e Jards Macalé.

Genaro era considerado um dos grandes guardiões da história da capoeira no Rio de Janeiro, ao lado de Mestre Polaco (1949-2021). Ambos deram depoimentos para o documentário "Do Ringue ao Palco" sobre Mestre Artur Emídio antes de suas mortes. Os cineastas expressaram pesar por não terem tido recursos para finalizar o documentário antes da partida desses velhos mestres.

Genaro faleceu em 28 de fevereiro de 2022, em um dia de Carnaval e um dia antes do aniversário da cidade do Rio de Janeiro - datas descritas como significativas para a memória e cultura do Rio, e certamente para a capoeira que ele amava. O Professor Marcelo Cardoso da Costa, doutorando em Memória Social pela UNIRIO, observou: "O Mestre se foi num dia de carnaval e em um dia antes do aniversário da cidade do Rio de Janeiro. Datas marcantes da memória e da cultura carioca". Citando Amadou Hampâté Bâ: "Na África, cada ancião que morre é uma biblioteca que se queima". A morte de Mestres de Capoeira tem feito perder muitas "bibliotecas" no estado do Rio de Janeiro e no Brasil.',
  -- Achievements (English)
  E'- Guardian of Rio de Janeiro capoeira history alongside Mestre Polaco
- Student of Mestre Artur Emídio from 1955
- Excellent pandeiro (tambourine) player
- Learned berimbau from Mestre Paraná
- TV appearance on "A Noite dos Escravos" (TV Rio, 1957) with Artur Emídio, Djalma Bandeira, and Vilela
- International tours to Portugal, Mexico, Germany, and France
- Performed with major MPB artists: Tom Jobim, Caetano Veloso, Maria Bethânia, Nelson Motta, Jards Macalé
- Composed new version of traditional song "Paranaê" honoring Mestre Paraná
- Gave testimony for documentary "From the Ring to the Stage" (2023)',
  -- Achievements (Portuguese)
  E'- Guardião da história da capoeira do Rio de Janeiro ao lado de Mestre Polaco
- Aluno de Mestre Artur Emídio a partir de 1955
- Excelente tocador de pandeiro
- Aprendeu berimbau com Mestre Paraná
- Aparição na TV em "A Noite dos Escravos" (TV Rio, 1957) com Artur Emídio, Djalma Bandeira e Vilela
- Turnês internacionais por Portugal, México, Alemanha e França
- Apresentou-se com grandes artistas da MPB: Tom Jobim, Caetano Veloso, Maria Bethânia, Nelson Motta, Jards Macalé
- Compôs nova versão da canção tradicional "Paranaê" homenageando Mestre Paraná
- Deu depoimento para o documentário "Do Ringue ao Palco" (2023)',
  -- Researcher notes (English)
  E'BIRTH DATE: June 21, 1934 - Confirmed by capoeirahistory.com. Born at Maternidade Doutor Climério de Oliveira in Nazaré, Salvador.

DEATH DATE: February 28, 2022 - Confirmed by multiple sources. Died on Carnival day, one day before Rio de Janeiro''s city anniversary.

FIRST CONTACT WITH CAPOEIRA: At the Feira de Água de Meninos in Salvador, before returning to Rio at age 19.

TEACHERS:
- Mestre Artur Emídio (primary teacher, capoeira, 1955+, Rio de Janeiro)
- Mestre Paraná (berimbau instruction, after 1955, at Artur Emídio''s rodas)

MEDIA APPEARANCES:
- 1957: TV Rio "A Noite dos Escravos" with Artur Emídio, Djalma Bandeira, Vilela (producer: Haroldo Costa)
- Unknown date: Recording session photo with Nelson Motta, Caetano Veloso, Maria Bethânia, Paraná, Jards Macalé
- Unknown date: MPB performance with Tom Jobim, Caetano Veloso, Maria Bethânia - composed new "Paranaê" version
- 2018-2022: Documentary testimony for "From the Ring to the Stage"

INTERNATIONAL TOURS: Portugal, Mexico, Germany, France (dates unknown)

ASSOCIATES:
- Djalma Bandeira - fellow student of Artur Emídio, performed together
- Vilela - fellow student of Artur Emídio, performed together
- Valdemar Santana - contemporary, shared interest in capoeira
- Mestre Polaco (1949-2021) - fellow guardian of Rio capoeira history

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-genaro-1934/
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- Multiple death notices (radiocapoeira.org.br, capoeiragemcarioca.com.br)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 21 de junho de 1934 - Confirmado por capoeirahistory.com. Nascido na Maternidade Doutor Climério de Oliveira em Nazaré, Salvador.

DATA DE FALECIMENTO: 28 de fevereiro de 2022 - Confirmado por múltiplas fontes. Morreu no dia de Carnaval, um dia antes do aniversário da cidade do Rio de Janeiro.

PRIMEIRO CONTATO COM CAPOEIRA: Na Feira de Água de Meninos em Salvador, antes de retornar ao Rio aos 19 anos.

MESTRES:
- Mestre Artur Emídio (mestre principal, capoeira, 1955+, Rio de Janeiro)
- Mestre Paraná (instrução de berimbau, após 1955, nas rodas de Artur Emídio)

APARIÇÕES NA MÍDIA:
- 1957: TV Rio "A Noite dos Escravos" com Artur Emídio, Djalma Bandeira, Vilela (produtor: Haroldo Costa)
- Data desconhecida: Foto de sessão de gravação com Nelson Motta, Caetano Veloso, Maria Bethânia, Paraná, Jards Macalé
- Data desconhecida: Apresentação MPB com Tom Jobim, Caetano Veloso, Maria Bethânia - compôs nova versão de "Paranaê"
- 2018-2022: Depoimento para documentário "Do Ringue ao Palco"

TURNÊS INTERNACIONAIS: Portugal, México, Alemanha, França (datas desconhecidas)

ASSOCIADOS:
- Djalma Bandeira - colega aluno de Artur Emídio, apresentaram-se juntos
- Vilela - colega aluno de Artur Emídio, apresentaram-se juntos
- Valdemar Santana - contemporâneo, interesse compartilhado em capoeira
- Mestre Polaco (1949-2021) - colega guardião da história da capoeira carioca

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-genaro-1934/
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- Múltiplas notas de falecimento (radiocapoeira.org.br, capoeiragemcarioca.com.br)'
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
