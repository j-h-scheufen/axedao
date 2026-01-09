-- ============================================================
-- GENEALOGY PERSON: Major Dória
-- Generated: 2026-01-02
-- ============================================================
-- Major Dória (Carlos Dória) was NOT a capoeirista himself, but a
-- patron/founder who established the first formal capoeira academy
-- in Itabuna in 1958. He is included in the genealogy database
-- because of his critical role in enabling capoeira transmission
-- in southern Bahia. The academy he founded trained Suassuna,
-- Medicina, and other important figures.
--
-- "Major" likely indicates military rank (Brazilian Army Major).
-- He established a multi-sport center that included judô, karatê,
-- and capoeira, with classes taught by Mestre Maneca Brandão
-- (student of Bimba) and assisted by Mestre Zoião.
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
  'Carlos Dória',
  'Major Dória',
  NULL, -- NOT a capoeirista - no title
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/publicacoes-e-artigos/itabuna-lancamento-do-livro-capoeira-de-luta-de-negro-a-exercicio-de-branco-no-cenario-grapiuna/', 'https://viaeditora.com.br/acervo-literario/capoeira-de-luta-de-negro-a-exercicio-de-branco/']::text[],
  -- Capoeira-specific
  NULL, -- NOT a capoeirista - no style
  NULL,
  NULL,
  -- Life dates
  NULL, -- Birth year unknown
  NULL,
  NULL, -- Birth place unknown
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Major Carlos Dória was a patron and founder whose vision brought formal capoeira instruction to Itabuna, in the southern cacao-producing region of Bahia. Though not a capoeirista himself, his establishment of the Academia Cultura Física e Capoeira Major Dória in 1958 created the institutional foundation that would train several figures who became important in capoeira history.

The title "Major" likely indicates his rank in the Brazilian military. In 1958, Major Dória established a sports center in Itabuna that offered various martial arts and physical culture activities, including judô, karatê, and capoeira. According to Mestre Suassuna, the building for this academy was provided by Amélia Prado—a woman connected to the family of renowned Bahian writer Jorge Amado.

To teach capoeira at his academy, Major Dória recruited Mestre Maneca Brandão, a formado of Mestre Bimba who had trained at the Centro de Cultura Física Regional in Salvador. Maneca Brandão was the son of Ubaldino Brandão, a former mayor of Itabuna, which may explain the connection that brought him to teach at Major Dória''s establishment. Mestre Zoião, Maneca Brandão''s classmate from Bimba''s academy, sometimes assisted with training sessions.

The academy became the training ground for young Reinaldo Ramos Suassuna—who would later become Mestre Suassuna, co-founder of Cordão de Ouro and creator of Miudinho. Luís Oliveira Rocha (later Mestre Medicina, founder of Grupo Raça) also trained there. Through these students and others, Major Dória''s academy played a role in transmitting Mestre Bimba''s methodology to the cocoa region of southern Bahia.

Major Dória represents a category of non-practitioners who nonetheless proved important to capoeira''s development: patrons who provided infrastructure, legitimacy, and resources that enabled mestres to teach and students to learn in formal settings during an era when capoeira was still finding its way from street practice to recognized cultural activity.',
  -- bio_pt
  E'Major Carlos Dória foi um patrono e fundador cuja visão trouxe o ensino formal de capoeira para Itabuna, na região cacaueira do sul da Bahia. Embora não fosse capoeirista, a fundação da Academia Cultura Física e Capoeira Major Dória em 1958 criou a base institucional que formaria várias figuras importantes na história da capoeira.

O título "Major" provavelmente indica sua patente no Exército Brasileiro. Em 1958, Major Dória estabeleceu um centro esportivo em Itabuna que oferecia várias artes marciais e atividades de cultura física, incluindo judô, karatê e capoeira. Segundo Mestre Suassuna, o prédio para esta academia foi cedido por Amélia Prado—uma mulher ligada à família do renomado escritor baiano Jorge Amado.

Para ensinar capoeira em sua academia, Major Dória recrutou Mestre Maneca Brandão, um formado de Mestre Bimba que havia treinado no Centro de Cultura Física Regional em Salvador. Maneca Brandão era filho de Ubaldino Brandão, um ex-prefeito de Itabuna, o que pode explicar a conexão que o trouxe para ensinar no estabelecimento do Major Dória. Mestre Zoião, colega de turma de Maneca Brandão na academia de Bimba, às vezes auxiliava nos treinamentos.

A academia se tornou o local de treinamento do jovem Reinaldo Ramos Suassuna—que mais tarde se tornaria Mestre Suassuna, cofundador do Cordão de Ouro e criador do Miudinho. Luís Oliveira Rocha (posteriormente Mestre Medicina, fundador do Grupo Raça) também treinou lá. Através desses alunos e outros, a academia do Major Dória desempenhou um papel na transmissão da metodologia de Mestre Bimba para a região cacaueira do sul da Bahia.

Major Dória representa uma categoria de não-praticantes que, no entanto, se mostraram importantes para o desenvolvimento da capoeira: patronos que forneceram infraestrutura, legitimidade e recursos que permitiram aos mestres ensinar e aos alunos aprender em ambientes formais durante uma era em que a capoeira ainda estava encontrando seu caminho da prática de rua para atividade cultural reconhecida.',
  -- achievements_en
  E'Founded Academia Cultura Física e Capoeira Major Dória in Itabuna (1958)—first formal capoeira academy in the city
Recruited Mestre Maneca Brandão (student of Bimba) to teach capoeira in southern Bahia
Provided institutional setting that trained Mestre Suassuna and Mestre Medicina
Helped bring Capoeira Regional methodology from Salvador to the grapiúna (cocoa) region',
  -- achievements_pt
  E'Fundou a Academia Cultura Física e Capoeira Major Dória em Itabuna (1958)—primeira academia formal de capoeira da cidade
Recrutou Mestre Maneca Brandão (aluno de Bimba) para ensinar capoeira no sul da Bahia
Forneceu ambiente institucional que formou Mestre Suassuna e Mestre Medicina
Ajudou a trazer a metodologia da Capoeira Regional de Salvador para a região grapiúna (cacau)',
  -- notes_en
  E'NOT A CAPOEIRISTA:
Major Dória was a patron/founder, not a practitioner. He established the infrastructure and recruited instructors but did not practice or teach capoeira himself. Imported to genealogy database for his role in capoeira transmission infrastructure.

MILITARY RANK:
"Major" likely indicates Brazilian Army rank. No documentation found on his military career or unit.

ACADEMY DETAILS:
- Name: Academia Cultura Física e Capoeira Major Dória
- Founded: 1958
- Location: Itabuna, Bahia
- Activities: Judô, Karatê, Capoeira, and other physical culture
- Primary capoeira instructor: Mestre Maneca Brandão
- Assistant instructor: Mestre Zoião (sometimes)
- Building provided by: Amélia Prado (connected to Jorge Amado''s family per Suassuna)

STUDENTS TRAINED:
- Suassuna (Reinaldo Ramos Suassuna) - later co-founder of Cordão de Ouro
- Medicina (Luís Oliveira Rocha) - later founder of Grupo Raça

HISTORICAL CONTEXT:
Before Major Dória''s academy, capoeira in Itabuna was practiced in the streets by marginalized angoleiros. According to researcher Cláudia Viana''s book "Capoeira: De luta de negro a exercício de branco no cenário grapiúna", the 1950s-60s saw a transformation from street capoeira to institutionalized practice, and Major Dória''s academy was part of this transition.

SOURCES:
- Portal Capoeira article on Cláudia Viana''s book launch
- Via Editora book listing for Viana''s "Capoeira: De luta de negro a exercício de branco"
- Suassuna biography (4capoeirathoughts.wordpress.com)
- CDO Sergipe Mestre Suassuna page
- Grupo Raça Mestre Medicina page
- Cordão de Ouro official history',
  -- notes_pt
  E'NÃO É CAPOEIRISTA:
Major Dória foi um patrono/fundador, não um praticante. Ele estabeleceu a infraestrutura e recrutou instrutores mas não praticava nem ensinava capoeira. Importado para o banco de dados de genealogia por seu papel na infraestrutura de transmissão da capoeira.

PATENTE MILITAR:
"Major" provavelmente indica patente do Exército Brasileiro. Nenhuma documentação encontrada sobre sua carreira militar ou unidade.

DETALHES DA ACADEMIA:
- Nome: Academia Cultura Física e Capoeira Major Dória
- Fundação: 1958
- Local: Itabuna, Bahia
- Atividades: Judô, Karatê, Capoeira e outras atividades de cultura física
- Instrutor principal de capoeira: Mestre Maneca Brandão
- Instrutor assistente: Mestre Zoião (às vezes)
- Prédio cedido por: Amélia Prado (ligada à família de Jorge Amado segundo Suassuna)

ALUNOS FORMADOS:
- Suassuna (Reinaldo Ramos Suassuna) - posteriormente cofundador do Cordão de Ouro
- Medicina (Luís Oliveira Rocha) - posteriormente fundador do Grupo Raça

CONTEXTO HISTÓRICO:
Antes da academia do Major Dória, a capoeira em Itabuna era praticada nas ruas por angoleiros marginalizados. Segundo o livro "Capoeira: De luta de negro a exercício de branco no cenário grapiúna" da pesquisadora Cláudia Viana, os anos 1950-60 viram uma transformação da capoeira de rua para prática institucionalizada, e a academia do Major Dória fez parte desta transição.

FONTES:
- Artigo do Portal Capoeira sobre lançamento do livro de Cláudia Viana
- Listagem do livro na Via Editora para "Capoeira: De luta de negro a exercício de branco" de Viana
- Biografia de Suassuna (4capoeirathoughts.wordpress.com)
- Página de Mestre Suassuna no CDO Sergipe
- Página de Mestre Medicina no Grupo Raça
- História oficial do Cordão de Ouro'
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
