-- ============================================================
-- GENEALOGY PERSON: Zacarias Boa Morte
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH DATE: November 5, 1923 (exact) - confirmed by velhosmestres.com
-- DEATH DATE: November 3, 2000 (exact) - confirmed by velhosmestres.com
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
  'Zacarias Boa Morte',
  'Zacarias Boa Morte',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://velhosmestres.com/en/featured-44', 'https://velhosmestres.com/br/destaques-44']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Zacarias practiced traditional Capoeira Angola in the style of Mestre Waldemar. Mestre Barba Branca described his game as "on the toes of his feet, the old style" (na ponta dos pés, o estilo antigo), emphasizing the low, graceful footwork characteristic of street capoeira before formalization. He was known for playing berimbau and maintaining the bateria alongside other mestres.',
  E'Zacarias praticava Capoeira Angola tradicional no estilo de Mestre Waldemar. Mestre Barba Branca descreveu seu jogo como "na ponta dos pés, o estilo antigo", enfatizando o trabalho de pés baixo e gracioso característico da capoeira de rua antes da formalização. Era conhecido por tocar berimbau e manter a bateria ao lado de outros mestres.',
  -- Life dates
  1923,
  'exact'::genealogy.date_precision,
  NULL, -- Birth place not documented
  2000,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Zacarias Boa Morte was Mestre Waldemar''s first documented student, beginning his training in 1942 at the legendary Barracão in Corta Braço (later Liberdade), Salvador. "Zacarias foi meu aluno de 1942", Waldemar confirmed in a 1987 interview. Waldemar pointed to Zacarias and José Cabelo Bom as "capoeiristas of the future who will continue his tradition".

Beyond the roda, Zacarias worked as a civil guard (guarda civil). According to Mestre Pelé, Zacarias "looked after" (tomava conta) the rodas in Liberdade on Sunday afternoons—a role that combined his professional authority with his standing in the capoeira community.

On April 11, 1948, photographer Pierre Verger documented a roda at Agnelo''s bar in Corta Braço. Researchers have tentatively identified the 24-year-old Zacarias in several of these now-iconic photographs, playing alongside other members of Waldemar''s circle.

In November 1954, Zacarias appeared in "Vadiação", the pioneering documentary by Alexandre Robatto Filho, considered a landmark of Brazilian cinema''s engagement with capoeira. The 8-minute film featured a roda in Salvador with mestres Bimba and Waldemar, Traíra, Nagé, Curió, Crispim, and Rosendo. Zacarias served as a berimbau player in the bateria, alongside Traíra on pandeiro.

The following year, French anthropologist Simone Dreyfus-Roche came to Salvador on the recommendation of Pierre Verger. On October 31, 1955, she recorded capoeira at Waldemar''s Barracão for what would become the LP "Brésil Vol. 2 - Bahia". Zacarias was among the mestres featured on the cover photograph and in the recordings, which won the 1956 Liotard Prize and are now housed in the Musée de l''Homme.

In the Pero Vaz neighborhood, Zacarias ran a gafieira (dance hall) that, alongside Waldemar''s Barracão, served as one of two special spaces where capoeira matches and weekend entertainment occurred. Joaquim Fiuza, who was a young man in that era, remembered going to both places—to dance and drink at Zacarias''s Gafieira, and to watch the "incredible capoeira presentations" at Waldemar''s Barracão.

Zacarias remained active in the capoeira community for decades. In 1984, he participated in Mestre Camisa''s landmark event at Circo Voador in Rio de Janeiro—the I Encontro Nacional de Arte-Capoeira—performing alongside mestres João Pequeno and Mucungê. He continued participating in GCAP workshops in the mid-1980s and in March 1998, at age 74, attended the III Encontro dos Guardiões da Capoeira Angola da Bahia.

On May 19, 1999, Zacarias founded Escola Zacarias Boa Morte at Avenida Peixe, Nº 153 in Pero Vaz, Salvador—finally institutionalizing his teaching after nearly six decades of practice. He died just 18 months later, on November 3, 2000, two days before his 77th birthday.

"Zacarias is the most beautiful thing there is, humble, good to talk to", Mestre Barba Branca said. "He deserves to be seen playing, on the toes of his feet, the old style". Mestre Pelé sang at his burial, continuing the tradition of honoring departed mestres.',
  -- bio_pt
  E'Zacarias Boa Morte foi o primeiro aluno documentado de Mestre Waldemar, iniciando seu treinamento em 1942 no lendário Barracão em Corta Braço (depois Liberdade), Salvador. "Zacarias foi meu aluno de 1942", Waldemar confirmou em entrevista de 1987. Waldemar apontou Zacarias e José Cabelo Bom como "capoeiristas do futuro que continuarão sua tradição".

Além da roda, Zacarias trabalhava como guarda civil. Segundo Mestre Pelé, Zacarias "tomava conta" das rodas da Liberdade nas tardes de domingo—um papel que combinava sua autoridade profissional com sua posição na comunidade da capoeira.

Em 11 de abril de 1948, o fotógrafo Pierre Verger documentou uma roda no bar de Agnelo em Corta Braço. Pesquisadores identificaram provisoriamente Zacarias, então com 24 anos, em várias dessas fotografias hoje icônicas, jogando ao lado de outros membros do círculo de Waldemar.

Em novembro de 1954, Zacarias apareceu em "Vadiação", o documentário pioneiro de Alexandre Robatto Filho, considerado um marco do cinema brasileiro no registro da capoeira. O filme de 8 minutos apresentou uma roda em Salvador com os mestres Bimba e Waldemar, Traíra, Nagé, Curió, Crispim e Rosendo. Zacarias serviu como tocador de berimbau na bateria, ao lado de Traíra no pandeiro.

No ano seguinte, a antropóloga francesa Simone Dreyfus-Roche veio a Salvador por recomendação de Pierre Verger. Em 31 de outubro de 1955, ela gravou capoeira no Barracão de Waldemar para o que se tornaria o LP "Brésil Vol. 2 - Bahia". Zacarias estava entre os mestres na foto da capa e nas gravações, que ganharam o Prêmio Liotard de 1956 e estão hoje no Musée de l''Homme.

No bairro de Pero Vaz, Zacarias mantinha uma gafieira (salão de dança) que, junto com o Barracão de Waldemar, servia como um dos dois espaços especiais onde aconteciam jogos de capoeira e entretenimento de fim de semana. Joaquim Fiuza, que era jovem naquela época, lembrava de ir aos dois lugares—para dançar e beber na Gafieira de Zacarias, e para assistir às "incríveis apresentações de capoeira" no Barracão de Waldemar.

Zacarias permaneceu ativo na comunidade da capoeira por décadas. Em 1984, participou do evento marcante de Mestre Camisa no Circo Voador no Rio de Janeiro—o I Encontro Nacional de Arte-Capoeira—apresentando-se ao lado dos mestres João Pequeno e Mucungê. Continuou participando dos workshops do GCAP em meados dos anos 1980 e em março de 1998, aos 74 anos, participou do III Encontro dos Guardiões da Capoeira Angola da Bahia.

Em 19 de maio de 1999, Zacarias fundou a Escola Zacarias Boa Morte na Avenida Peixe, Nº 153 em Pero Vaz, Salvador—finalmente institucionalizando seu ensino após quase seis décadas de prática. Faleceu apenas 18 meses depois, em 3 de novembro de 2000, dois dias antes de completar 77 anos.

"Zacarias é a coisa mais bonita que existe, humilde, bom de conversa", disse Mestre Barba Branca. "Ele merece ser visto jogando, na ponta dos pés, o estilo antigo". Mestre Pelé cantou em seu enterro, continuando a tradição de honrar mestres falecidos.',
  -- achievements_en
  E'First documented student of Mestre Waldemar (1942), designated to continue his tradition
Photographed by Pierre Verger at Corta Braço roda (April 11, 1948)
Featured in "Vadiação" documentary (1954) by Alexandre Robatto Filho
Appeared on Simone Dreyfus-Roche LP "Brésil Vol. 2 - Bahia" (1955/1956)
Operated Gafieira de Zacarias in Pero Vaz neighborhood
Performed at I Encontro Nacional de Arte-Capoeira at Circo Voador (1984)
Founded Escola Zacarias Boa Morte (May 19, 1999)
Participated in III Encontro dos Guardiões da Capoeira Angola da Bahia (1998)',
  -- achievements_pt
  E'Primeiro aluno documentado de Mestre Waldemar (1942), designado para continuar sua tradição
Fotografado por Pierre Verger na roda de Corta Braço (11 de abril de 1948)
Participou do documentário "Vadiação" (1954) de Alexandre Robatto Filho
Apareceu no LP "Brésil Vol. 2 - Bahia" de Simone Dreyfus-Roche (1955/1956)
Operou a Gafieira de Zacarias no bairro de Pero Vaz
Apresentou-se no I Encontro Nacional de Arte-Capoeira no Circo Voador (1984)
Fundou a Escola Zacarias Boa Morte (19 de maio de 1999)
Participou do III Encontro dos Guardiões da Capoeira Angola da Bahia (1998)',
  -- notes_en
  E'BIRTH/DEATH DATES:
- Birth: November 5, 1923 (exact) - confirmed by velhosmestres.com
- Death: November 3, 2000 (exact) - confirmed by velhosmestres.com; died 2 days before 77th birthday

OCCUPATION: Guarda civil (civil guard); according to Mestre Pelé, "tomava conta" (looked after) the rodas in Liberdade on Sundays

TEACHER: Mestre Waldemar - began training 1942 at Corta Braço (Barracão de Waldemar)

SON: Arival - born April 26, 1947

TRAINING COMPANIONS at Waldemar''s roda (per João Grande 1989 testimony):
- Evanir, Tatá, Bom Cabelo (José Cabelo Bom), Chita, Macário, Sete Molas (Waldemar)

MEDIA APPEARANCES:
- 1948: Pierre Verger photographs at Agnelo roda, Corta Braço (April 11)
- 1953: Met João Grande at Waldemar''s hut
- 1954: "Vadiação" documentary by Alexandre Robatto Filho - berimbau player
- 1955: Simone Dreyfus-Roche LP cover and recordings (October 31)
- 1955: João Martins photographs at Mário Cravo''s house
- 1984: Circo Voador event with João Pequeno and Mucungê
- 1986-87: GCAP workshops (II and III)
- 1997: GCAP XI Workshop
- 1998: III Encontro dos Guardiões da Capoeira Angola - ladainha recording

GAFIEIRA DE ZACARIAS: Dance hall/entertainment venue in Pero Vaz neighborhood; described alongside Barracão de Waldemar as one of two special spaces for weekend capoeira and entertainment

SCHOOL: Escola Zacarias Boa Morte - founded May 19, 1999 at Avenida Peixe, Nº 153, Pero Vaz, Salvador; later became municipal school; director Jafé Martins

BURIAL: Mestre Pelé sang at his burial (alongside Caiçara and Bom Cabrito funerals)',
  -- notes_pt
  E'DATAS DE NASCIMENTO/MORTE:
- Nascimento: 5 de novembro de 1923 (exata) - confirmado por velhosmestres.com
- Morte: 3 de novembro de 2000 (exata) - confirmado por velhosmestres.com; faleceu 2 dias antes de completar 77 anos

PROFISSÃO: Guarda civil; segundo Mestre Pelé, "tomava conta" das rodas da Liberdade aos domingos

MESTRE: Mestre Waldemar - começou treinamento em 1942 em Corta Braço (Barracão de Waldemar)

FILHO: Arival - nascido em 26 de abril de 1947

COMPANHEIROS DE TREINO na roda de Waldemar (per testemunho de João Grande 1989):
- Evanir, Tatá, Bom Cabelo (José Cabelo Bom), Chita, Macário, Sete Molas (Waldemar)

APARIÇÕES EM MÍDIA:
- 1948: Fotografias de Pierre Verger na roda de Agnelo, Corta Braço (11 de abril)
- 1953: Encontrou João Grande no barracão de Waldemar
- 1954: Documentário "Vadiação" de Alexandre Robatto Filho - tocador de berimbau
- 1955: Capa e gravações do LP de Simone Dreyfus-Roche (31 de outubro)
- 1955: Fotografias de João Martins na casa de Mário Cravo
- 1984: Evento no Circo Voador com João Pequeno e Mucungê
- 1986-87: Workshops do GCAP (II e III)
- 1997: XI Workshop do GCAP
- 1998: III Encontro dos Guardiões da Capoeira Angola - gravação de ladainha

GAFIEIRA DE ZACARIAS: Salão de dança/entretenimento no bairro de Pero Vaz; descrita junto com o Barracão de Waldemar como um dos dois espaços especiais para capoeira e entretenimento de fim de semana

ESCOLA: Escola Zacarias Boa Morte - fundada em 19 de maio de 1999 na Avenida Peixe, Nº 153, Pero Vaz, Salvador; depois virou escola municipal; diretor Jafé Martins

ENTERRO: Mestre Pelé cantou em seu enterro (junto com enterros de Caiçara e Bom Cabrito)'
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
