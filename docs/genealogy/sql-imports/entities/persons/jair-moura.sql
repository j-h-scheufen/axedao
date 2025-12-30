-- ============================================================
-- GENEALOGY PERSON: Jair Moura
-- Generated: 2025-12-20
-- ============================================================
-- One of only four students formally graduated to mestre level
-- (white handkerchief / lenço branco) by Mestre Bimba.
-- The LAST capoeirista to receive this honor from Bimba.
-- Historian, filmmaker, writer, and pioneer of capoeira research.
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
  'Jair Fernandes Moura',
  'Jair Moura',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirawiki.org/wiki/Jair_Moura', 'https://velhosmestres.com/en/featured-12', 'https://portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-jair-moura/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba from the late 1950s. Became one of only four students to receive the lenço branco (white handkerchief), the highest distinction in Capoeira Regional, directly from Bimba''s hands. According to Mestre Nenel (Bimba''s son), Jair Moura was the LAST capoeirista to receive this honor from his father. Beyond his role as practitioner, he became the foremost historian and documentarian of capoeira, pioneering research that inspired generations.',
  E'Treinou diretamente com Mestre Bimba desde o final dos anos 1950. Tornou-se um dos apenas quatro alunos a receber o lenço branco, a maior distinção na Capoeira Regional, diretamente das mãos de Bimba. Segundo Mestre Nenel (filho de Bimba), Jair Moura foi o ÚLTIMO capoeirista a receber essa honra de seu pai. Além de seu papel como praticante, tornou-se o principal historiador e documentarista da capoeira, sendo pioneiro em pesquisas que inspiraram gerações.',
  -- Life dates
  1936,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  2020,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Jair Fernandes Moura was born on August 27, 1936, in Salvador, Bahia. He would become one of the most important figures in the preservation and documentation of capoeira history—a pioneer whose meticulous research and documentation set the standard for all who followed.

In the late 1950s, young Jair Moura joined Mestre Bimba''s academy, beginning a relationship that would define both his practice and his life''s work. According to Mestre Nenel, Bimba''s son: "He was a student of my father since the 1950s and was the last capoeirista to receive the Lenço Branco from my father".

Nenel further emphasized Jair Moura''s significance: "Mestre Jair was perhaps the guy who started this preservation of the history of Capoeira. He was always an observant guy and very honest. He was one of the guys most well-regarded by my father. I considered him like an older brother".

Mestre Bimba formally graduated only four students to the level of mestre (white handkerchief) during his lifetime: Decânio, Jair Moura, Miranda, and Edinho. Of these, Jair Moura was reportedly the last to receive this distinction. This was the highest honor in Capoeira Regional—the lenço branco (white handkerchief) symbolized the silk handkerchiefs that primitive capoeiristas wore around their necks to protect themselves from razor cuts.

In 1968, Jair Moura directed the documentary "Dança de Guerra" (Dance of War), a groundbreaking historical and cultural film featuring Mestre Bimba, Mestre Tiburcinho, Mestre Totonho de Maré, Mestre Noronha, and other prominent capoeiristas. This documentary captured unique footage of legendary masters at the height of their powers and remains an invaluable historical record. A soundtrack album was also released.

Jair Moura lived in Rio de Janeiro during the 1980s, where he conducted extensive research on the history of capoeira in that city. He returned to Salvador in the 1990s. In both cities, he published numerous articles in newspapers and magazines, becoming a recognized voice on capoeira''s historical development.

In 1970, he published an article titled "Tiburcio e o Batuque" in the newspaper A Tarde, documenting Mestre Tiburcinho''s life and knowledge of batuque, a precursor fighting form to capoeira. This exemplified his commitment to capturing the testimonies of old masters before their knowledge was lost.

Among his most celebrated works are "Mestre Bimba: Uma Vida Consagrada à Capoeiragem" (later editions titled "Uma Vida Dedicada à Capoeiragem"), a definitive book bringing together archives, stories, and anecdotes about the creator of Capoeira Regional. He also authored "A Capoeiragem no Rio de Janeiro Através dos Séculos", which documents the history and development of capoeira in Rio de Janeiro from colonial times through various evolutionary phases.

In 1980, Jair Moura participated as a presenter at the First Regional Capoeira Seminar, organized in Salvador alongside other prominent figures including Carlos Sena, Albano Marinho, Itapoan, and Ordep Serra. This seminar brought together the main Bahian masters of different lineages and styles.

Jair Moura also worked at the Instituto Geográfico e Histórico da Bahia (IGHB), where he served as editor, director, writer, and essayist. In 2007, he participated alongside Frede Abreu in the evaluation panel for Capoeira Viva projects.

He owned an extensive personal library with substantial material on Capoeira Regional, and was also a skilled photographer who documented Mestre Bimba and other capoeiristas from Bahia and Rio de Janeiro. His close relationship with fellow researcher Frederico José de Abreu (Frede, 1947-2013) solidified his role in preserving capoeira''s history.

In Jair Moura''s honor, Frede Abreu founded the Instituto Jair Moura, which housed a collection of over 40,000 titles on capoeira and Afro-Brazilian culture—books, newspaper clippings, magazines, CDs, photos, and videos.

Jair Moura was also friends with the famous Brazilian filmmaker Glauber Rocha. They would meet regularly in front of the Colégio Central da Bahia in the Nazaré district where Rocha studied.

On August 19, 2020, Mestre Jair Moura died at 84 years old in Salvador, a victim of COVID-19. He was hospitalized at Hospital Santa Izabel. He is survived by two sons, Jacir Moura and Moacir Moura.

The Bahia State Culture Department (SecultBA) issued an official note recognizing "the immense contribution of Jair Moura to the preservation of the history of capoeira and the achievements of significant masters", noting that "his legacy remains and stimulates other generations of researchers, masters and intellectuals".',
  -- bio_pt
  E'Jair Fernandes Moura nasceu em 27 de agosto de 1936, em Salvador, Bahia. Ele se tornaria uma das figuras mais importantes na preservação e documentação da história da capoeira—um pioneiro cuja pesquisa meticulosa e documentação estabeleceram o padrão para todos que o seguiram.

No final dos anos 1950, o jovem Jair Moura ingressou na academia de Mestre Bimba, iniciando uma relação que definiria tanto sua prática quanto o trabalho de sua vida. Segundo Mestre Nenel, filho de Bimba: "Ele era aluno de meu pai desde a década de 1950 e foi o último capoeirista a receber o Lenço Branco de meu pai".

Nenel enfatizou ainda a importância de Jair Moura: "Mestre Jair foi, talvez, o cara que iniciou essa preservação do histórico da Capoeira. Ele sempre foi um cara observador e muito íntegro. Foi um dos caras mais bem considerados pelo meu pai. Eu considerava ele como um irmão mais velho".

Mestre Bimba formalmente graduou apenas quatro alunos ao nível de mestre (lenço branco) durante sua vida: Decânio, Jair Moura, Miranda e Edinho. Destes, Jair Moura foi supostamente o último a receber essa distinção. Esta era a maior honra na Capoeira Regional—o lenço branco simbolizava os lenços de seda que os capoeiristas primitivos usavam no pescoço para se proteger de cortes de navalha.

Em 1968, Jair Moura dirigiu o documentário "Dança de Guerra", um filme histórico e cultural inovador com Mestre Bimba, Mestre Tiburcinho, Mestre Totonho de Maré, Mestre Noronha e outros capoeiristas proeminentes. Este documentário capturou filmagens únicas de mestres lendários no auge de seus poderes e permanece como um registro histórico inestimável. Um álbum com a trilha sonora também foi lançado.

Jair Moura viveu no Rio de Janeiro durante a década de 1980, onde conduziu extensa pesquisa sobre a história da capoeira naquela cidade. Retornou a Salvador nos anos 1990. Em ambas as cidades, publicou numerosos artigos em jornais e revistas, tornando-se uma voz reconhecida sobre o desenvolvimento histórico da capoeira.

Em 1970, publicou um artigo intitulado "Tiburcio e o Batuque" no jornal A Tarde, documentando a vida de Mestre Tiburcinho e seu conhecimento do batuque, uma forma de luta precursora da capoeira. Isso exemplificou seu compromisso em capturar os testemunhos de velhos mestres antes que seu conhecimento se perdesse.

Entre suas obras mais celebradas estão "Mestre Bimba: Uma Vida Consagrada à Capoeiragem" (edições posteriores intituladas "Uma Vida Dedicada à Capoeiragem"), um livro definitivo reunindo arquivos, histórias e anedotas sobre o criador da Capoeira Regional. Também escreveu "A Capoeiragem no Rio de Janeiro Através dos Séculos", que documenta a história e desenvolvimento da capoeira no Rio de Janeiro desde os tempos coloniais através de várias fases evolutivas.

Em 1980, Jair Moura participou como apresentador no Primeiro Seminário Regional de Capoeira, organizado em Salvador junto com outras figuras proeminentes incluindo Carlos Sena, Albano Marinho, Itapoan e Ordep Serra. Este seminário reuniu os principais mestres baianos de diferentes linhagens e estilos.

Jair Moura também trabalhou no Instituto Geográfico e Histórico da Bahia (IGHB), onde atuou como editor, diretor, escritor e ensaísta. Em 2007, participou junto com Frede Abreu da banca de avaliação de projetos do Capoeira Viva.

Ele possuía uma extensa biblioteca pessoal com farto material sobre Capoeira Regional, e também era um fotógrafo habilidoso que documentou Mestre Bimba e outros capoeiristas da Bahia e do Rio de Janeiro. Sua estreita relação com o pesquisador Frederico José de Abreu (Frede, 1947-2013) consolidou seu papel na preservação da história da capoeira.

Em homenagem a Jair Moura, Frede Abreu fundou o Instituto Jair Moura, que abrigou uma coleção de mais de 40.000 títulos sobre capoeira e cultura afro-brasileira—livros, recortes de jornal, revistas, CDs, fotos e vídeos.

Jair Moura também era amigo do famoso cineasta brasileiro Glauber Rocha. Eles se encontravam regularmente em frente ao Colégio Central da Bahia no bairro de Nazaré, onde Rocha estudava.

Em 19 de agosto de 2020, Mestre Jair Moura faleceu aos 84 anos em Salvador, vítima de COVID-19. Estava hospitalizado no Hospital Santa Izabel. Deixou dois filhos, Jacir Moura e Moacir Moura.

A Secretaria de Cultura do Estado da Bahia (SecultBA) emitiu nota oficial reconhecendo "a imensa contribuição de Jair Moura para a preservação da história da capoeira e das conquistas de mestres significativos", observando que "seu legado permanece e estimula outras gerações de pesquisadores, mestres e intelectuais".',
  -- achievements_en
  E'One of only four students formally graduated to mestre (white handkerchief / lenço branco) by Mestre Bimba—and the LAST to receive this honor; Directed the documentary "Dança de Guerra" (1968), featuring Mestres Bimba, Tiburcinho, Totonho de Maré, and Noronha; Author of "Mestre Bimba: Uma Vida Consagrada à Capoeiragem"; Author of "A Capoeiragem no Rio de Janeiro Através dos Séculos"; Pioneer in capoeira history research and documentation; Member and contributor at Instituto Geográfico e Histórico da Bahia (IGHB); Presenter at the 1980 First Regional Capoeira Seminar; Instituto Jair Moura established in his honor by Frede Abreu (40,000+ item archive); Photographer documenting masters from Bahia and Rio de Janeiro; Recognized by SecultBA for immense contribution to capoeira history preservation',
  -- achievements_pt
  E'Um dos apenas quatro alunos formalmente graduados a mestre (lenço branco) por Mestre Bimba—e o ÚLTIMO a receber essa honra; Dirigiu o documentário "Dança de Guerra" (1968), com Mestres Bimba, Tiburcinho, Totonho de Maré e Noronha; Autor de "Mestre Bimba: Uma Vida Consagrada à Capoeiragem"; Autor de "A Capoeiragem no Rio de Janeiro Através dos Séculos"; Pioneiro na pesquisa e documentação da história da capoeira; Membro e colaborador do Instituto Geográfico e Histórico da Bahia (IGHB); Apresentador no Primeiro Seminário Regional de Capoeira de 1980; Instituto Jair Moura estabelecido em sua homenagem por Frede Abreu (acervo de 40.000+ itens); Fotógrafo documentando mestres da Bahia e Rio de Janeiro; Reconhecido pela SecultBA pela imensa contribuição à preservação da história da capoeira',
  -- notes_en
  E'BIRTH DATE (1936-08-27, exact):
August 27, 1936 - confirmed by CapoeiraWiki, obituary sources (Correio 24 Horas, OffNews), and SecultBA official note.

DEATH DATE (2020-08-19, exact):
August 19, 2020 - confirmed by multiple obituary sources. Died at Hospital Santa Izabel, Salvador. Cause: COVID-19.

FOUR WHITE HANDKERCHIEF GRADUATES OF BIMBA:
1. Angelo Augusto Decânio Filho (Decânio) - living at time of Bimba''s death
2. Jair Moura - THE LAST to receive this honor from Bimba
3. Miranda (deceased before Bimba)
4. Edinho (deceased before Bimba)

TEACHERS:
- Mestre Bimba (late 1950s until Bimba''s death 1974) - primary and only capoeira teacher

DOCUMENTARY:
- 1968: "Dança de Guerra" (Dance of War) - directed by Jair Moura
  - Featured: Mestre Bimba, Mestre Tiburcinho, Mestre Totonho de Maré, Mestre Noronha
  - Also includes João Pequeno and João Grande according to some sources
  - Soundtrack album released

PUBLICATIONS:
- "Mestre Bimba: Uma Vida Consagrada à Capoeiragem" (also "Uma Vida Dedicada à Capoeiragem")
  - 2nd edition (2017): 110 pages, limited collector''s edition
- "A Capoeiragem no Rio de Janeiro Através dos Séculos"
- 1970: "Tiburcio e o Batuque" - article in A Tarde newspaper (Feb 28, 1970)
- 1981: Interview in Jornal da Capoeira, Year I, Issue VI
- Various articles in newspapers and magazines in Rio and Salvador

LOCATIONS:
- Salvador (1936-1980s): Birth and early career
- Rio de Janeiro (1980s): Research on Rio capoeira history
- Salvador (1990s-2020): Returned to Bahia; death

INSTITUTIONAL AFFILIATIONS:
- Instituto Geográfico e Histórico da Bahia (IGHB) - editor, director, writer, essayist
- 2007: Capoeira Viva evaluation panel (with Frede Abreu)

ARCHIVE COLLECTIONS:
- Personal library with substantial Capoeira Regional material
- Photo collection documenting mestres from Bahia and Rio de Janeiro
- Acervo de Jair Moura - cited as source for historical photographs

FRIENDSHIP WITH GLAUBER ROCHA:
Met regularly in front of Colégio Central da Bahia in Nazaré district.

FAMILY:
- Sons: Jacir Moura, Moacir Moura

INSTITUTO JAIR MOURA:
Founded by Frede Abreu (Frederico José de Abreu, 1947-2013) in honor of his friend.
Collection: 40,000+ titles including books, newspaper clippings, magazines, CDs, photos, videos.
At Mandinga NGO space in Salvador, the collection was available for consultation.

QUOTE FROM MESTRE NENEL:
"Ele era aluno de meu pai desde a década de 1950 e foi o último capoeirista a receber o Lenço Branco de meu pai".
"Mestre Jair foi, talvez, o cara que iniciou essa preservação do histórico da Capoeira. Ele sempre foi um cara observador e muito íntegro. Foi um dos caras mais bem considerados pelo meu pai. Eu considerava ele como um irmão mais velho".',
  -- notes_pt
  E'DATA DE NASCIMENTO (1936-08-27, exata):
27 de agosto de 1936 - confirmado pela CapoeiraWiki, fontes obituárias (Correio 24 Horas, OffNews) e nota oficial da SecultBA.

DATA DE FALECIMENTO (2020-08-19, exata):
19 de agosto de 2020 - confirmado por múltiplas fontes obituárias. Faleceu no Hospital Santa Izabel, Salvador. Causa: COVID-19.

QUATRO GRADUADOS DE LENÇO BRANCO DE BIMBA:
1. Angelo Augusto Decânio Filho (Decânio) - vivo na época da morte de Bimba
2. Jair Moura - O ÚLTIMO a receber essa honra de Bimba
3. Miranda (falecido antes de Bimba)
4. Edinho (falecido antes de Bimba)

MESTRES:
- Mestre Bimba (final dos anos 1950 até a morte de Bimba em 1974) - único professor de capoeira

DOCUMENTÁRIO:
- 1968: "Dança de Guerra" - dirigido por Jair Moura
  - Participações: Mestre Bimba, Mestre Tiburcinho, Mestre Totonho de Maré, Mestre Noronha
  - Também inclui João Pequeno e João Grande segundo algumas fontes
  - Álbum da trilha sonora lançado

PUBLICAÇÕES:
- "Mestre Bimba: Uma Vida Consagrada à Capoeiragem" (também "Uma Vida Dedicada à Capoeiragem")
  - 2ª edição (2017): 110 páginas, edição de colecionador limitada
- "A Capoeiragem no Rio de Janeiro Através dos Séculos"
- 1970: "Tiburcio e o Batuque" - artigo no jornal A Tarde (28 de fev de 1970)
- 1981: Entrevista no Jornal da Capoeira, Ano I, Edição VI
- Diversos artigos em jornais e revistas no Rio e Salvador

LOCAIS:
- Salvador (1936-anos 1980): Nascimento e início de carreira
- Rio de Janeiro (anos 1980): Pesquisa sobre história da capoeira carioca
- Salvador (anos 1990-2020): Retornou à Bahia; falecimento

AFILIAÇÕES INSTITUCIONAIS:
- Instituto Geográfico e Histórico da Bahia (IGHB) - editor, diretor, escritor, ensaísta
- 2007: Banca de avaliação do Capoeira Viva (com Frede Abreu)

COLEÇÕES DE ARQUIVO:
- Biblioteca pessoal com farto material sobre Capoeira Regional
- Coleção de fotos documentando mestres da Bahia e Rio de Janeiro
- Acervo de Jair Moura - citado como fonte para fotografias históricas

AMIZADE COM GLAUBER ROCHA:
Encontravam-se regularmente em frente ao Colégio Central da Bahia no bairro de Nazaré.

FAMÍLIA:
- Filhos: Jacir Moura, Moacir Moura

INSTITUTO JAIR MOURA:
Fundado por Frede Abreu (Frederico José de Abreu, 1947-2013) em homenagem a seu amigo.
Acervo: 40.000+ títulos incluindo livros, recortes de jornal, revistas, CDs, fotos, vídeos.
No espaço da ONG Mandinga em Salvador, a coleção estava disponível para consulta.

CITAÇÃO DE MESTRE NENEL:
"Ele era aluno de meu pai desde a década de 1950 e foi o último capoeirista a receber o Lenço Branco de meu pai".
"Mestre Jair foi, talvez, o cara que iniciou essa preservação do histórico da Capoeira. Ele sempre foi um cara observador e muito íntegro. Foi um dos caras mais bem considerados pelo meu pai. Eu considerava ele como um irmão mais velho".'
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
