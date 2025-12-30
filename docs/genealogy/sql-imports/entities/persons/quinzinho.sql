-- ============================================================
-- GENEALOGY PERSON: Quinzinho
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Joaquim Felix de Souza',
  'Quinzinho',
  NULL,  -- No formal title in the modern sense
  NULL,  -- No portrait found
  ARRAY['https://capoeirahistory.com/general/master-leopoldina-part-2/']::text[],
  -- Capoeira-specific
  NULL,  -- Pre-style era; tiririca predates Angola/Regional distinction
  E'Taught "tiririca", the capoeira without berimbau practiced by carioca malandros. This was the street capoeira descended from the 19th-century maltas - focused on combat effectiveness rather than musical accompaniment. The training method was informal: demonstration during sparring with verbal cues ("Do it like this... do it like that"), followed by harsh beatings to "get smart". Despite lacking formal structure, Quinzinho maintained "an impeccable work ethic" as an instructor.',
  E'Ensinava "tiririca", a capoeira sem berimbau praticada pelos malandros cariocas. Era a capoeira de rua descendente das maltas do século XIX - focada na eficácia de combate em vez de acompanhamento musical. O método de treinamento era informal: demonstração durante a luta com comandos verbais ("Faz assim... faz assim"), seguido de surras para "se esperar". Apesar de não ter estrutura formal, Quinzinho mantinha "uma ética de trabalho impecável" como instrutor.',
  -- Life dates
  1927,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  1954,
  'approximate'::genealogy.date_precision,
  'Colônia Penal, Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'Joaquim Felix de Souza, known as Quinzinho, was a feared malandro of the favelas around Central do Brasil station in Rio de Janeiro. He already had a criminal record for murder and had served time in the Colônia Penal before he ever met his most famous student. Heir to the violent capoeira gangs that had terrorized Rio in the 19th century, he represented the last generation of practitioners who still fought in the old style - tiririca, capoeira without berimbau, without music, without the codified traditions that Bahian masters like Bimba and Pastinha were developing in Salvador.

Around 1950 or 1951, the young Demerval Lopes de Lacerda - later known as Mestre Leopoldina - encountered Quinzinho. Leopoldina was eighteen years old, recently released from the SAM (child care service), making a living selling newspapers around Central Station. One day he saw a man "leaping from left to right, standing on his feet and next on his hands". From the next day on, he came every day at seven to train in front of Quinzinho''s house.

The training was brutal. Quinzinho would show a movement and tell his student to imitate it. He used no names for the movements - those formal codifications hadn''t reached Rio''s street fighters. When they sparred, it was with full contact. As Leopoldina later recalled, students in 1950s Rio "learned capoeira taking beatings to ''get smart.''" Yet despite the harsh methods, or perhaps because of them, Quinzinho had "an impeccable work ethic" as a teacher.

Within three or four months, Leopoldina could hold his own, and he became the only person who could truly play with Quinzinho. He joined in his master''s fame among the malandros of Rio.

A few years later, Quinzinho was arrested again. This time, he was murdered inside the prison - the Colônia Penal where he had served before. The killing was likely related to his criminal past, part of the endless vendettas that connected Rio''s underworld. After his death, Leopoldina disappeared from the streets, fearing retaliation from Quinzinho''s enemies.

When Leopoldina resurfaced, he learned that Valdemar Santana, a famous fighter, had brought a Bahian capoeirista named Artur Emídio to Rio. Around 1954, Leopoldina became Artur Emídio''s student, learning the Bahian capoeira played to the berimbau - a completely different world from what Quinzinho had taught him.

Quinzinho was part of a generation that managed to transmit something to modern capoeira despite the repression and marginalization. He appears alongside figures like Madame Satã in accounts of this "premodern" Rio lineage. The writer and physician Drauzio Varella mentions him in his book "Estação Carandiru" (1999, p. 270), among the legendary bandits of old Rio.',
  -- Extended content (Portuguese)
  E'Joaquim Felix de Souza, conhecido como Quinzinho, era um temido malandro das favelas ao redor da estação Central do Brasil no Rio de Janeiro. Já tinha ficha criminal por morte e havia cumprido pena na Colônia Penal antes mesmo de conhecer seu aluno mais famoso. Herdeiro das violentas maltas de capoeira que haviam aterrorizado o Rio no século XIX, ele representava a última geração de praticantes que ainda lutava no estilo antigo - tiririca, capoeira sem berimbau, sem música, sem as tradições codificadas que mestres baianos como Bimba e Pastinha estavam desenvolvendo em Salvador.

Por volta de 1950 ou 1951, o jovem Demerval Lopes de Lacerda - mais tarde conhecido como Mestre Leopoldina - encontrou Quinzinho. Leopoldina tinha dezoito anos, recém-saído do SAM (Serviço de Assistência a Menores), ganhando a vida vendendo jornais ao redor da Estação Central. Um dia viu um homem "saltando de um lado para o outro, ora em pé, ora nas mãos". A partir do dia seguinte, veio todos os dias às sete da manhã para treinar na frente da casa de Quinzinho.

O treinamento era brutal. Quinzinho mostrava um movimento e mandava o aluno imitar. Não usava nomes para os movimentos - essas codificações formais não haviam chegado aos lutadores de rua do Rio. Quando lutavam, era com contato total. Como Leopoldina lembrou mais tarde, os alunos no Rio dos anos 1950 "aprendiam capoeira levando porrada para ''se esperar''". No entanto, apesar dos métodos duros, ou talvez por causa deles, Quinzinho tinha "uma ética de trabalho impecável" como professor.

Em três ou quatro meses, Leopoldina já se segurava, e tornou-se a única pessoa que realmente conseguia jogar com Quinzinho. Passou a compartilhar da fama de seu mestre entre os malandros do Rio.

Alguns anos depois, Quinzinho foi preso novamente. Desta vez, foi assassinado dentro da prisão - a Colônia Penal onde já havia cumprido pena antes. A morte provavelmente estava ligada ao seu passado criminoso, parte das intermináveis vendettas que conectavam o submundo carioca. Após sua morte, Leopoldina sumiu das ruas, temendo represálias dos inimigos de Quinzinho.

Quando Leopoldina reapareceu, soube que Valdemar Santana, um lutador famoso, havia trazido um capoeirista baiano chamado Artur Emídio para o Rio. Por volta de 1954, Leopoldina tornou-se aluno de Artur Emídio, aprendendo a capoeira baiana tocada ao berimbau - um mundo completamente diferente do que Quinzinho lhe havia ensinado.

Quinzinho fazia parte de uma geração que conseguiu transmitir algo para a capoeira moderna apesar da repressão e marginalização. Ele aparece ao lado de figuras como Madame Satã nos relatos dessa linhagem "pré-moderna" do Rio. O escritor e médico Drauzio Varella o menciona em seu livro "Estação Carandiru" (1999, p. 270), entre os bandidos lendários do velho Rio.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1927, decade precision): When Leopoldina (b. 1933) met Quinzinho around 1950 at age 18, Quinzinho was described as "maybe 23 years old". This places his birth around 1927. Some sources cite "approx. 1925-1950" as his active period/lifespan. Using 1927 as it aligns with the age estimate given in the documentary testimony.

DEATH YEAR ESTIMATION (1954, approximate precision): Sources say "a few years later" after their 1950/1951 meeting, Quinzinho was "arrested and this time murdered in prison" at the Colônia Penal. Leopoldina then became Artur Emídio''s student "around 1954" after the death. Using 1954 as approximate death year.

FULL NAME: Recorded as both "Joaquim Felix" and "Joaquim Felix de Souza" in sources. Using the fuller version.

LITERARY MENTION: Drauzio Varella mentions Quinzinho in "Estação Carandiru" (Cia. Das Letras, 1999, p. 270) among legendary bandits including Meneguetti, Sete Dedos, Luz Vermelha, and Promessinha.

DOCUMENTARY SOURCE: Leopoldina''s testimony to Nestor Capoeira appears in the 2005 documentary "Mestre Leopoldina, a Fina Flor da Malandragem".

PENDING RELATIONSHIPS (requires imports):
- Leopoldina student_of Quinzinho (~1950-1954)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1927, precisão de década): Quando Leopoldina (n. 1933) conheceu Quinzinho por volta de 1950 aos 18 anos, Quinzinho foi descrito como "talvez com 23 anos". Isso situa seu nascimento por volta de 1927. Algumas fontes citam "aprox. 1925-1950" como seu período de atividade/vida. Usando 1927 pois alinha com a estimativa de idade dada no depoimento do documentário.

ESTIMATIVA DO ANO DE MORTE (1954, precisão aproximada): Fontes dizem que "alguns anos depois" do encontro em 1950/1951, Quinzinho foi "preso novamente e desta vez assassinado na prisão" na Colônia Penal. Leopoldina então tornou-se aluno de Artur Emídio "por volta de 1954" após a morte. Usando 1954 como ano aproximado da morte.

NOME COMPLETO: Registrado como "Joaquim Felix" e "Joaquim Felix de Souza" nas fontes. Usando a versão mais completa.

MENÇÃO LITERÁRIA: Drauzio Varella menciona Quinzinho em "Estação Carandiru" (Cia. Das Letras, 1999, p. 270) entre bandidos lendários incluindo Meneguetti, Sete Dedos, Luz Vermelha e Promessinha.

FONTE DOCUMENTAL: O depoimento de Leopoldina a Nestor Capoeira aparece no documentário de 2005 "Mestre Leopoldina, a Fina Flor da Malandragem".

RELACIONAMENTOS PENDENTES (requer importações):
- Leopoldina student_of Quinzinho (~1950-1954)'
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
