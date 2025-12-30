-- ============================================================
-- GENEALOGY PERSON: Zoião
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- If Zoião was classmate (companheiro de turma) of Maneca Brandão at
-- Mestre Bimba's academy, and was experienced enough to help with
-- training at Major Dória's academy in Itabuna in 1958, he was likely
-- in his late 20s to early 40s at that time. Maneca Brandão estimated
-- birth ~1925. Zoião likely of similar age. Published book in 1999,
-- suggesting still active then.
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
  'Adyjolvã Anunciação Couto',
  'Zoião',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-17', 'https://cdosergipe.wixsite.com/cdosergipe/zoiao']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba at the Centro de Cultura Física Regional in Salvador. Became experienced enough to assist his classmate Maneca Brandão in teaching at Major Dória''s academy in Itabuna (1958).',
  E'Treinou diretamente com Mestre Bimba no Centro de Cultura Física Regional em Salvador. Tornou-se experiente o suficiente para auxiliar seu colega de turma Maneca Brandão no ensino na academia do Major Dória em Itabuna (1958).',
  -- Life dates
  1925,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Adyjolvã Anunciação Couto, known as Mestre Zoião, was a student of Mestre Bimba and an important figure in the transmission of Capoeira Regional to southern Bahia.

Zoião trained at Mestre Bimba''s Centro de Cultura Física Regional in Salvador, where he became classmates with Maneca Brandão—another formado who would play a crucial role in spreading Capoeira Regional beyond the capital. Like all of Bimba''s students, Zoião was subject to the mestre''s legendary discipline. In his book "Arte da Capoeira (História e Filosofia)", he recalled: "Ai de quem comparecesse na aula de uniforme sujo" (Woe to whoever showed up to class with a dirty uniform).

When Major Carlos Dória founded the Academia Cultura Física e Capoeira Major Dória in Itabuna in 1958—the first formal capoeira school in the city—Maneca Brandão was recruited as the primary instructor. Zoião, his classmate from Bimba''s academy, sometimes helped with training sessions. This partnership brought Bimba''s methodology to southern Bahia, and it was at this academy that young Reinaldo Ramos Suassuna (later Mestre Suassuna, co-founder of Cordão de Ouro) received his foundational training.

A historical photograph documented at velhosmestres.com shows Zoião alongside three legendary figures: Mestre Vermelho 27, Mestre Bimba himself, and Mestre Pastinha. The presence of both Bimba (founder of Capoeira Regional) and Pastinha (icon of Capoeira Angola) in the same frame with Zoião speaks to his recognized standing within the capoeira community.

In 1999, Zoião published "Arte da Capoeira (História e Filosofia)" through Gráfica Santa Helena in Salvador. The book addresses the history and philosophy of capoeira, offering firsthand testimony of training under Mestre Bimba and contributing to the documentation of Regional''s early development.

Through his role as Bimba''s student, his assistance in establishing capoeira in Itabuna, his participation in the historical record alongside the greatest mestres, and his authorship of a book on capoeira history, Zoião represents an important link in the transmission of Capoeira Regional.',
  -- bio_pt
  E'Adyjolvã Anunciação Couto, conhecido como Mestre Zoião, foi aluno de Mestre Bimba e uma figura importante na transmissão da Capoeira Regional para o sul da Bahia.

Zoião treinou no Centro de Cultura Física Regional de Mestre Bimba em Salvador, onde se tornou colega de turma de Maneca Brandão—outro formado que desempenharia um papel crucial na difusão da Capoeira Regional além da capital. Como todos os alunos de Bimba, Zoião estava sujeito à lendária disciplina do mestre. Em seu livro "Arte da Capoeira (História e Filosofia)", ele relembrou: "Ai de quem comparecesse na aula de uniforme sujo".

Quando Major Carlos Dória fundou a Academia Cultura Física e Capoeira Major Dória em Itabuna em 1958—a primeira escola formal de capoeira da cidade—Maneca Brandão foi recrutado como instrutor principal. Zoião, seu colega de turma da academia de Bimba, às vezes ajudava nos treinamentos. Esta parceria trouxe a metodologia de Bimba para o sul da Bahia, e foi nesta academia que o jovem Reinaldo Ramos Suassuna (posteriormente Mestre Suassuna, co-fundador do Cordão de Ouro) recebeu sua formação inicial.

Uma fotografia histórica documentada no velhosmestres.com mostra Zoião ao lado de três figuras lendárias: Mestre Vermelho 27, o próprio Mestre Bimba e Mestre Pastinha. A presença tanto de Bimba (fundador da Capoeira Regional) quanto de Pastinha (ícone da Capoeira Angola) no mesmo quadro com Zoião fala de sua posição reconhecida na comunidade da capoeira.

Em 1999, Zoião publicou "Arte da Capoeira (História e Filosofia)" pela Gráfica Santa Helena em Salvador. O livro aborda a história e filosofia da capoeira, oferecendo testemunho em primeira mão do treinamento com Mestre Bimba e contribuindo para a documentação do desenvolvimento inicial da Regional.

Através de seu papel como aluno de Bimba, sua assistência no estabelecimento da capoeira em Itabuna, sua participação no registro histórico ao lado dos maiores mestres, e sua autoria de um livro sobre história da capoeira, Zoião representa um elo importante na transmissão da Capoeira Regional.',
  -- achievements_en
  E'Trained directly under Mestre Bimba at Centro de Cultura Física Regional; Assisted Maneca Brandão with teaching at Major Dória''s academy in Itabuna (1958); Author of "Arte da Capoeira (História e Filosofia)" (1999); Photographed alongside Bimba, Pastinha, and Vermelho 27 (historical photo)',
  -- achievements_pt
  E'Treinou diretamente com Mestre Bimba no Centro de Cultura Física Regional; Auxiliou Maneca Brandão no ensino na academia do Major Dória em Itabuna (1958); Autor de "Arte da Capoeira (História e Filosofia)" (1999); Fotografado ao lado de Bimba, Pastinha e Vermelho 27 (foto histórica)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1925, decade):
Zoião was classmate (companheiro de turma) of Maneca Brandão at Bimba''s academy. If experienced enough to help teach at Major Dória''s academy in 1958, likely late 20s to early 40s then. Maneca Brandão estimated birth ~1925. Zoião published book in 1999, suggesting still active. Conservative estimate: ~1925 with decade precision.

NAME: Full name confirmed as Adyjolvã Anunciação Couto via CECAB bibliography entry #69.

TEACHERS:
- Mestre Bimba (Salvador, CCFR, likely 1940s-1950s)

CLASSMATES:
- Maneca Brandão (companheiro de turma at Bimba''s academy)

ASSOCIATED PERSONS:
- Mestre Suassuna (student at Major Dória''s academy while Zoião helped teach)
- Mestre Vermelho 27 (appears with him in historical photo)
- Mestre Pastinha (appears with him in historical photo)

BOOK PUBLICATION:
- Title: Arte da Capoeira (História e Filosofia)
- Publisher: Gráfica Santa Helena
- Location: Salvador, Bahia
- Year: 1999

QUOTE FROM BOOK:
"Ai de quem comparecesse na aula de uniforme sujo" - describing Bimba''s strict discipline regarding hygiene.

MEDIA APPEARANCES:
- Undated: Historical photograph with M Vermelho 27, M Bimba, M Pastinha, M Zoião (velhosmestres.com)

TEACHING:
- Major Dória''s academy, Itabuna, 1958 - helped Maneca Brandão with training',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1925, década):
Zoião era colega de turma (companheiro de turma) de Maneca Brandão na academia de Bimba. Se experiente o suficiente para ajudar a ensinar na academia do Major Dória em 1958, provavelmente tinha de 28 a 40 anos na época. Nascimento estimado de Maneca Brandão ~1925. Zoião publicou livro em 1999, sugerindo ainda ativo. Estimativa conservadora: ~1925 com precisão de década.

NOME: Nome completo confirmado como Adyjolvã Anunciação Couto via entrada bibliográfica CECAB #69.

PROFESSORES:
- Mestre Bimba (Salvador, CCFR, provavelmente anos 1940-1950)

COLEGAS DE TURMA:
- Maneca Brandão (companheiro de turma na academia de Bimba)

PESSOAS ASSOCIADAS:
- Mestre Suassuna (aluno na academia do Major Dória enquanto Zoião ajudava a ensinar)
- Mestre Vermelho 27 (aparece com ele em foto histórica)
- Mestre Pastinha (aparece com ele em foto histórica)

PUBLICAÇÃO DE LIVRO:
- Título: Arte da Capoeira (História e Filosofia)
- Editora: Gráfica Santa Helena
- Local: Salvador, Bahia
- Ano: 1999

CITAÇÃO DO LIVRO:
"Ai de quem comparecesse na aula de uniforme sujo" - descrevendo a disciplina rigorosa de Bimba quanto à higiene.

APARIÇÕES NA MÍDIA:
- Sem data: Fotografia histórica com M Vermelho 27, M Bimba, M Pastinha, M Zoião (velhosmestres.com)

ENSINO:
- Academia do Major Dória, Itabuna, 1958 - ajudou Maneca Brandão com treinamentos'
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
