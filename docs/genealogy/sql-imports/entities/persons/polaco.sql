-- ============================================================
-- GENEALOGY PERSON: Polaco
-- Generated: 2025-12-28
-- ============================================================
-- BIRTH DATE: 1949 - Confirmed by capoeirahistory.com
-- (Born in Rio de Janeiro; introduced to Mestre Paraná in 1956 at age 7)
--
-- DEATH DATE: April 10, 2021 - Confirmed by capoeirahistory.com
-- (Date format 10/04/2021 in DD/MM/YYYY format)
--
-- SIGNIFICANCE: Guardian of Rio de Janeiro capoeira history;
-- student of Mestre Paraná; assumed leadership of Grupo São Bento
-- Pequeno (1972); pioneer of capoeira for hearing-impaired;
-- gave testimony for "From the Ring to the Stage" documentary;
-- maintained valuable historical photo archive.
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
  'José Roberto Rocha',
  'Polaco',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/master-polaco/'
  ]::text[],
  -- Capoeira-specific
  NULL::genealogy.style,  -- Style not formally documented; inherited São Bento Pequeno tradition from Paraná
  E'Polaco inherited his master''s tradition through the Grupo São Bento Pequeno, which emphasized cultural performance and folklore alongside capoeira practice. Under Paraná, the group focused on presenting Afro-Brazilian culture at social events, carnival parades, and theatrical productions rather than a specific fighting style. After assuming leadership in 1972, Polaco maintained this tradition while pioneering inclusive practices for hearing-impaired students, demonstrating capoeira''s adaptability through visual and kinesthetic learning.',
  E'Polaco herdou a tradição de seu mestre através do Grupo São Bento Pequeno, que enfatizava performance cultural e folclore junto com a prática da capoeira. Sob Paraná, o grupo focava em apresentar a cultura afro-brasileira em eventos sociais, desfiles de carnaval e produções teatrais, em vez de um estilo de luta específico. Após assumir a liderança em 1972, Polaco manteve essa tradição enquanto pioneiramente introduziu práticas inclusivas para alunos com deficiência auditiva, demonstrando a adaptabilidade da capoeira através do aprendizado visual e cinestésico.',
  -- Life dates
  1949,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  2021,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (English)
  E'José Roberto Rocha, known as Mestre Polaco, was born in Rio de Janeiro in 1949. In 1956, at approximately seven years of age, he was introduced to Mestre Paraná (Oswaldo Lisboa dos Santos) and became his disciple. From Paraná, he received the apelido "Polaco" (Polish)—likely a reference to his physical appearance.

Polaco trained under Mestre Paraná''s tutelage in the famous backyard academy in Bonsucesso, where Paraná''s wife Tia Maura helped care for the many young students. He was one of several students who later became mestres under Paraná''s guidance, alongside Mestre Mintirinha, Mestre Bira, Mestre Wilson Malhado, Mestre Indio Aranha, Mestre Pé de Valsa, Mestre Denis, and Mestre Marreta.

In March 1972, Mestre Paraná died of a cardiac arrest at his IPASE workplace. That same year, Polaco opened his own academy in the Ramos neighborhood of Rio de Janeiro. He surprised the capoeira community by pioneering instruction for hearing-impaired students—a remarkably inclusive initiative for that era, leveraging capoeira''s inherently visual and kinesthetic nature to enable deaf students to participate fully.

Also in 1972, Polaco was asked to assume responsibility for the Grupo Capoeira São Bento Pequeno, the folkloric group that Paraná had founded in 1950 (later 1956 according to Polaco''s own account). Under his leadership, the group continued Paraná''s legacy of presenting Afro-Brazilian culture at various events and maintaining the São Bento Pequeno tradition that would later influence the formation of Grupo Muzenza.

Throughout his life, Polaco assembled an important collection of historical photographs documenting Rio de Janeiro capoeira history. This archive, known as the "Acervo Mestre Polaco", preserves images of Mestre Paraná at rodas, meetings of Paraná''s students including Mintirinha and others at the Terra academy, and iconic photos of Paraná with musicians and artists including Maria Bethânia.

In his final years, Polaco was recognized alongside Mestre Genaro (1934-2022) as one of the two great "guardians of the history of capoeira in Rio de Janeiro". Both gave testimonies for the documentary "From the Ring to the Stage" (Do Ringue aos Palcos), a film about Mestre Artur Emídio de Oliveira. Polaco clarified historical details in his testimony, including the fact that Artur Emídio never worked at a pharmacy but rather lived in a room at the back of one.

Tragically, the filmmakers were unable to secure resources to finalize the documentary before the passing of these old masters. Mestre Polaco died on April 10, 2021, preceded by his testimonial contribution but not by the completion of the film. Mestre Genaro followed him on February 28, 2022. Their deaths marked the loss of irreplaceable "libraries" of Rio de Janeiro capoeira history.',
  -- Extended content (Portuguese)
  E'José Roberto Rocha, conhecido como Mestre Polaco, nasceu no Rio de Janeiro em 1949. Em 1956, com aproximadamente sete anos de idade, foi apresentado a Mestre Paraná (Oswaldo Lisboa dos Santos) e tornou-se seu discípulo. De Paraná, recebeu o apelido "Polaco" — provavelmente uma referência à sua aparência física.

Polaco treinou sob a tutela de Mestre Paraná na famosa academia de quintal em Bonsucesso, onde a esposa de Paraná, Tia Maura, ajudava a cuidar dos muitos jovens alunos. Ele foi um dos vários alunos que depois se tornaram mestres sob a orientação de Paraná, ao lado de Mestre Mintirinha, Mestre Bira, Mestre Wilson Malhado, Mestre Indio Aranha, Mestre Pé de Valsa, Mestre Denis e Mestre Marreta.

Em março de 1972, Mestre Paraná faleceu de colapso cardíaco em seu local de trabalho no IPASE. Nesse mesmo ano, Polaco abriu sua própria academia no bairro de Ramos, no Rio de Janeiro. Ele surpreendeu a comunidade da capoeira ao pioneiramente oferecer instrução para alunos com deficiência auditiva — uma iniciativa notavelmente inclusiva para aquela época, aproveitando a natureza inerentemente visual e cinestésica da capoeira para permitir que alunos surdos participassem plenamente.

Também em 1972, Polaco foi convidado a assumir a responsabilidade pelo Grupo Capoeira São Bento Pequeno, o grupo folclórico que Paraná havia fundado em 1950 (posteriormente 1956 segundo o próprio relato de Polaco). Sob sua liderança, o grupo continuou o legado de Paraná de apresentar a cultura afro-brasileira em vários eventos e manter a tradição São Bento Pequeno que mais tarde influenciaria a formação do Grupo Muzenza.

Ao longo de sua vida, Polaco reuniu uma importante coleção de fotografias históricas documentando a história da capoeira carioca. Este arquivo, conhecido como "Acervo Mestre Polaco", preserva imagens de Mestre Paraná nas rodas, encontros dos alunos de Paraná incluindo Mintirinha e outros na academia Terra, e fotos icônicas de Paraná com músicos e artistas incluindo Maria Bethânia.

Em seus últimos anos, Polaco foi reconhecido ao lado de Mestre Genaro (1934-2022) como um dos dois grandes "guardiões da história da capoeira no Rio de Janeiro". Ambos deram depoimentos para o documentário "Do Ringue aos Palcos", um filme sobre Mestre Artur Emídio de Oliveira. Polaco esclareceu detalhes históricos em seu depoimento, incluindo o fato de que Artur Emídio nunca trabalhou em uma farmácia, mas sim morava em um quarto nos fundos de uma.

Tragicamente, os cineastas não conseguiram obter recursos para finalizar o documentário antes da partida desses velhos mestres. Mestre Polaco faleceu em 10 de abril de 2021, tendo precedido a conclusão do filme mas deixando sua contribuição testimonial. Mestre Genaro o seguiu em 28 de fevereiro de 2022. Suas mortes marcaram a perda de "bibliotecas" insubstituíveis da história da capoeira carioca.',
  -- Achievements (English)
  E'- Guardian of Rio de Janeiro capoeira history alongside Mestre Genaro
- Student of Mestre Paraná (1956-1972)
- Assumed leadership of Grupo Capoeira São Bento Pequeno (1972)
- Pioneer of capoeira instruction for hearing-impaired students (1972)
- Maintained historical photo archive (Acervo Mestre Polaco)
- Gave testimony for documentary "From the Ring to the Stage" about Mestre Artur Emídio
- Opened academy in Ramos, Rio de Janeiro (1972)',
  -- Achievements (Portuguese)
  E'- Guardião da história da capoeira do Rio de Janeiro ao lado de Mestre Genaro
- Aluno de Mestre Paraná (1956-1972)
- Assumiu liderança do Grupo Capoeira São Bento Pequeno (1972)
- Pioneiro do ensino de capoeira para alunos com deficiência auditiva (1972)
- Manteve acervo fotográfico histórico (Acervo Mestre Polaco)
- Deu depoimento para documentário "Do Ringue aos Palcos" sobre Mestre Artur Emídio
- Abriu academia em Ramos, Rio de Janeiro (1972)',
  -- Researcher notes (English)
  E'BIRTH YEAR: 1949 - Confirmed by capoeirahistory.com. Born in Rio de Janeiro.

DEATH DATE: April 10, 2021 - Confirmed by capoeirahistory.com (date format 10/04/2021 is DD/MM/YYYY).

APELIDO ORIGIN: "Polaco" (Polish) - nickname given by Mestre Paraná; likely refers to physical appearance (light skin, fair features). Common Brazilian slang referring to Polish/Eastern European appearance.

TEACHER: Mestre Paraná (Oswaldo Lisboa dos Santos)
- Began training 1956 at age 7 in Bonsucesso backyard academy
- Trained until Paraná''s death March 7, 1972

FELLOW STUDENTS OF PARANÁ:
- Mestre Mintirinha (Luiz Américo da Silva) - "the most famous" according to sources; began 1956
- Mestre Bira
- Mestre Wilson Malhado
- Mestre Indio Aranha
- Mestre Pé de Valsa
- Mestre Denis
- Mestre Marreta

GROUP LEADERSHIP:
- Assumed responsibility for Grupo Capoeira São Bento Pequeno in 1972
- Opened personal academy in Ramos neighborhood same year
- Founding date dispute: Polaco says 1956, earlier sources say 1950

INCLUSIVE PRACTICE:
- Pioneer of capoeira for hearing-impaired students (1972)
- Leveraged visual/kinesthetic nature of capoeira for deaf students

HISTORICAL PHOTO ARCHIVE:
- "Acervo Mestre Polaco" contains important historical photos
- Documents: Paraná at rodas, students at Terra academy, Paraná with Maria Bethânia
- Photo of Mestres Denis, Malhado, Bira, Polaco, Mintirinha, and Pé de Valsa at Terra academy

DOCUMENTARY TESTIMONY:
- Gave testimony for "From the Ring to the Stage" (Do Ringue aos Palcos) about Artur Emídio
- Clarified that Artur Emídio lived at (not worked at) a pharmacy
- Documentary incomplete before his death

ASSOCIATES:
- Mestre Genaro (1934-2022) - fellow "guardian" of Rio capoeira history
- Both gave documentary testimonies before deaths

SOURCES CONSULTED:
- capoeirahistory.com/master-polaco/
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- capoeirahistory.com/mestre/master-parana-1922-1972/
- aldeiacapoeira.com/Homenagens/MestreParana.html
- bdtd.ibict.br dissertation metadata on São Bento Pequeno',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: 1949 - Confirmado por capoeirahistory.com. Nascido no Rio de Janeiro.

DATA DE FALECIMENTO: 10 de abril de 2021 - Confirmado por capoeirahistory.com (formato de data 10/04/2021 é DD/MM/AAAA).

ORIGEM DO APELIDO: "Polaco" (Polonês) - apelido dado por Mestre Paraná; provavelmente refere-se à aparência física (pele clara, traços claros). Gíria brasileira comum referindo-se à aparência polonesa/do leste europeu.

MESTRE: Mestre Paraná (Oswaldo Lisboa dos Santos)
- Começou a treinar em 1956 aos 7 anos na academia de quintal em Bonsucesso
- Treinou até a morte de Paraná em 7 de março de 1972

COLEGAS ALUNOS DE PARANÁ:
- Mestre Mintirinha (Luiz Américo da Silva) - "o mais famoso" segundo as fontes; começou em 1956
- Mestre Bira
- Mestre Wilson Malhado
- Mestre Indio Aranha
- Mestre Pé de Valsa
- Mestre Denis
- Mestre Marreta

LIDERANÇA DE GRUPO:
- Assumiu responsabilidade pelo Grupo Capoeira São Bento Pequeno em 1972
- Abriu academia pessoal no bairro de Ramos no mesmo ano
- Disputa de data de fundação: Polaco diz 1956, fontes anteriores dizem 1950

PRÁTICA INCLUSIVA:
- Pioneiro da capoeira para alunos com deficiência auditiva (1972)
- Aproveitou a natureza visual/cinestésica da capoeira para alunos surdos

ACERVO FOTOGRÁFICO HISTÓRICO:
- "Acervo Mestre Polaco" contém fotos históricas importantes
- Documenta: Paraná nas rodas, alunos na academia Terra, Paraná com Maria Bethânia
- Foto dos Mestres Denis, Malhado, Bira, Polaco, Mintirinha e Pé de Valsa na academia Terra

DEPOIMENTO PARA DOCUMENTÁRIO:
- Deu depoimento para "Do Ringue aos Palcos" sobre Artur Emídio
- Esclareceu que Artur Emídio morava em (não trabalhava em) uma farmácia
- Documentário incompleto antes de sua morte

ASSOCIADOS:
- Mestre Genaro (1934-2022) - colega "guardião" da história da capoeira carioca
- Ambos deram depoimentos para documentário antes de suas mortes

FONTES CONSULTADAS:
- capoeirahistory.com/master-polaco/
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/
- capoeirahistory.com/mestre/master-parana-1922-1972/
- aldeiacapoeira.com/Homenagens/MestreParana.html
- bdtd.ibict.br metadados de dissertação sobre São Bento Pequeno'
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
