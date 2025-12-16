-- ============================================================
-- GENEALOGY PERSON: Moraes
-- Generated: 2025-12-15
-- ============================================================
-- Central figure in the 1980s Capoeira Angola revival. Founded
-- GCAP (Grupo de Capoeira Angola Pelourinho) in 1980. Persuaded
-- João Grande to return from retirement. Grammy-nominated musician.
-- PhD in Culture and Society from UFBA. Codified the musical
-- structure of Capoeira Angola bateria.
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
  'Pedro Moraes Trindade',
  'Moraes',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Pedro_Moraes_Trindade', 'https://www.lalaue.com/learn-capoeira/mestre-moraes/', 'https://capoeira.online/history/mestres/mestre-moraes/', 'https://www.capoeirahub.net/mestres/649edb5948085400142322ee-mestre-moraes']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Advocate for the philosophical and African roots of Capoeira Angola, distancing from commercial and martial-arts aspects. Codified the Angolan musical style and defined its basic instrumental ensemble (bateria). Requires GCAP members to be versed in all aspects of capoeira angola music. Believes the source of capoeira is the n''golo (zebra dance), a ritual combat performed by young warriors in southwestern Angola. Philosophy emphasizes the roda as a symbolic representation of the world, with movements representing life''s adversities.',
  E'Defensor das raízes filosóficas e africanas da Capoeira Angola, distanciando-se dos aspectos comerciais e marciais. Codificou o estilo musical angolano e definiu seu conjunto instrumental básico (bateria). Exige que os membros do GCAP dominem todos os aspectos da música de capoeira angola. Acredita que a origem da capoeira é o n''golo (dança da zebra), um combate ritual realizado por jovens guerreiros no sudoeste de Angola. Sua filosofia enfatiza a roda como uma representação simbólica do mundo, com os movimentos representando as adversidades da vida.',
  -- Life dates
  1950,
  'exact'::genealogy.date_precision,
  'Ilha de Maré, Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Pedro Moraes Trindade was born on February 9, 1950, on Ilha de Maré, an island in the Bay of All Saints near Salvador, Bahia. His father was a capoeirista who introduced him to the art at the age of seven.

Around 1958, at approximately eight years old, Moraes began training at Mestre Pastinha''s academy, the Centro Esportivo de Capoeira Angola (CECA) in the Pelourinho neighborhood of Salvador. By this time, Pastinha was already going blind and no longer taught classes directly. The academy was run by his students Mestre João Grande and Mestre João Pequeno. Moraes considers João Grande his true teacher, deeply impressed by the way João Grande played capoeira.

In 1970, Moraes joined the Brazilian Marines and was transferred to Rio de Janeiro. There, he established the first school to teach Capoeira Angola outside of Bahia. By 1974, he was already instructing in the northern suburb of Belfort Roxo. His Rio students included those who would become renowned mestres themselves: Mestre Braga, Mestre Neco, and Mestre José Carlos (Zé Carlos).

On December 16, 1978, at Parque Lage in Rio de Janeiro, Moraes promoted Braga, Neco, and Zé Carlos to the rank of Mestre, and Marco Aurélio to Contra-Mestre. These were the first mestres of Capoeira Angola formed outside of Bahia.

On October 5, 1980, at an artisan fair in Cosme Velho in the south zone of Rio de Janeiro, the Grupo de Capoeira Angola Pelourinho (GCAP) was formally founded with a demonstration of capoeira and maculelê. The founding idea came from Mestre Neco, with the goal of opposing the Brazilian military government''s suppression of African culture. The group''s logo—a berimbau and two zebras fighting, referencing capoeira''s African origins—was designed by Mestre Braga. The founding mestres were Moraes, Braga, Neco, and Zé Carlos, with Contra-Mestres Marco Aurélio and Peçanha (later known as Cobra Mansa).

In 1982, Moraes returned to Salvador, bringing his top student Cobra Mansa with him. Their return revitalized the Salvador capoeira community at a time when Capoeira Angola was in severe decline—overshadowed by the more popular Capoeira Regional. Moraes left the three young Rio mestres with full autonomy to continue his teaching, promoting Marco Aurélio to mestre before departing.

In the mid-1980s, Moraes and Cobra Mansa accomplished something remarkable: they convinced Mestre João Grande to return to teaching Capoeira Angola. João Grande had withdrawn from capoeira after Pastinha''s death in 1981, working at a gas station. Their persuasion brought one of the most important living links to Pastinha back into active teaching—ultimately leading to João Grande''s move to New York City in 1990.

GCAP became one of the most recognized Capoeira Angola organizations in the world. The group established strong connections with Black consciousness movements in Salvador, particularly Ilê Aiyê and Olodum. GCAP advocated for the inclusion of African and Afro-Brazilian traditions in the practice of capoeira angola, fighting against the commercialization and martial-arts-ification of the art.

Moraes codified the musical structure of Capoeira Angola, defining its basic instrumental ensemble (bateria) and requiring GCAP members to master all aspects of the music. He authored six compositions, including ladainhas and corridos.

Parallel to his capoeira work, Moraes pursued extensive formal education. He obtained a degree in Vernacular Letters with English from Universidade Católica do Salvador in 1991. He earned a Master''s degree in Social History from the Federal University of Bahia (UFBA), and completed a Doctorate in the Multidisciplinary Program in Culture and Society, also at UFBA. For many years, he worked as a teacher of English and Portuguese at public schools in Bahia.

In 2004, his album "Brincando na Roda" (Playing in the Roda), recorded with GCAP and released by Smithsonian Folkways Recordings, received a Grammy Award nomination in the Best Traditional World Music Album category. This was the first and only capoeira recording to be nominated for a Grammy.

Moraes is a strong advocate for "capoeira without prejudice," speaking against discriminatory practices within capoeira, including the use of pejorative nicknames that he argues perpetuate slavery''s legacy. He has presented at TEDx Pelourinho on bullying and prejudice in capoeira.

Today, GCAP maintains its headquarters in Salvador with schools in Ceará, Rio Grande do Sul, São Paulo, and Japan. Mestre Moraes continues to direct GCAP as a cultural outreach project, having trained over twenty students who became mestres themselves, including Cobra Mansa, Janja, Paulinha, Poloca, Valmir, and Jurandir—many of whom went on to found their own organizations spreading Capoeira Angola worldwide.',
  -- Extended content (bio_pt)
  E'Pedro Moraes Trindade nasceu em 9 de fevereiro de 1950, na Ilha de Maré, uma ilha na Baía de Todos os Santos próxima a Salvador, Bahia. Seu pai era capoeirista e o introduziu à arte aos sete anos de idade.

Por volta de 1958, com aproximadamente oito anos, Moraes começou a treinar na academia de Mestre Pastinha, o Centro Esportivo de Capoeira Angola (CECA), no bairro do Pelourinho em Salvador. Nessa época, Pastinha já estava ficando cego e não dava mais aulas diretamente. A academia era dirigida por seus alunos Mestre João Grande e Mestre João Pequeno. Moraes considera João Grande seu verdadeiro mestre, profundamente impressionado pela forma como João Grande jogava capoeira.

Em 1970, Moraes ingressou na Marinha do Brasil e foi transferido para o Rio de Janeiro. Lá, estabeleceu a primeira escola a ensinar Capoeira Angola fora da Bahia. Em 1974, já estava dando aulas no subúrbio norte de Belfort Roxo. Entre seus alunos cariocas estavam aqueles que se tornariam mestres renomados: Mestre Braga, Mestre Neco e Mestre José Carlos (Zé Carlos).

Em 16 de dezembro de 1978, no Parque Lage no Rio de Janeiro, Moraes promoveu Braga, Neco e Zé Carlos ao grau de Mestre, e Marco Aurélio a Contra-Mestre. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia.

Em 5 de outubro de 1980, em uma feira de artesanato em Cosme Velho, na zona sul do Rio de Janeiro, o Grupo de Capoeira Angola Pelourinho (GCAP) foi formalmente fundado com uma demonstração de capoeira e maculelê. A ideia de fundação veio de Mestre Neco, com o objetivo de se opor à perseguição da cultura africana pelo governo militar brasileiro. O logotipo do grupo—um berimbau e duas zebras lutando, referenciando as origens africanas da capoeira—foi desenhado por Mestre Braga. Os mestres fundadores foram Moraes, Braga, Neco e Zé Carlos, com os Contra-Mestres Marco Aurélio e Peçanha (mais tarde conhecido como Cobra Mansa).

Em 1982, Moraes retornou a Salvador, trazendo seu melhor aluno Cobra Mansa. O retorno deles revitalizou a comunidade de capoeira de Salvador em um momento em que a Capoeira Angola estava em severo declínio—ofuscada pela mais popular Capoeira Regional. Moraes deixou os três jovens mestres cariocas com total autonomia para continuar seus ensinamentos, promovendo Marco Aurélio a mestre antes de partir.

Em meados da década de 1980, Moraes e Cobra Mansa realizaram algo notável: convenceram Mestre João Grande a voltar a ensinar Capoeira Angola. João Grande havia se afastado da capoeira após a morte de Pastinha em 1981, trabalhando em um posto de gasolina. A persuasão deles trouxe de volta ao ensino ativo um dos mais importantes elos vivos com Pastinha—levando finalmente à mudança de João Grande para Nova York em 1990.

O GCAP tornou-se uma das organizações de Capoeira Angola mais reconhecidas do mundo. O grupo estabeleceu fortes conexões com movimentos de consciência negra em Salvador, particularmente Ilê Aiyê e Olodum. O GCAP advogou pela inclusão de tradições africanas e afro-brasileiras na prática da capoeira angola, lutando contra a comercialização e a marcialização da arte.

Moraes codificou a estrutura musical da Capoeira Angola, definindo seu conjunto instrumental básico (bateria) e exigindo que os membros do GCAP dominassem todos os aspectos da música. Ele compôs seis músicas, incluindo ladainhas e corridos.

Paralelamente ao seu trabalho com capoeira, Moraes buscou extensa educação formal. Obteve graduação em Letras Vernáculas com Inglês pela Universidade Católica do Salvador em 1991. Conquistou o título de Mestre em História Social pela Universidade Federal da Bahia (UFBA), e completou o Doutorado no Programa Multidisciplinar em Cultura e Sociedade, também na UFBA. Por muitos anos, trabalhou como professor de Inglês e Português em escolas públicas da Bahia.

Em 2004, seu álbum "Brincando na Roda", gravado com o GCAP e lançado pela Smithsonian Folkways Recordings, recebeu uma indicação ao Grammy Award na categoria Melhor Álbum de Música Tradicional do Mundo. Esta foi a primeira e única gravação de capoeira a ser indicada ao Grammy.

Moraes é um forte defensor da "capoeira sem preconceito," falando contra práticas discriminatórias dentro da capoeira, incluindo o uso de apelidos pejorativos que ele argumenta perpetuam o legado da escravidão. Apresentou-se no TEDx Pelourinho sobre bullying e preconceito na capoeira.

Hoje, o GCAP mantém sua sede em Salvador com escolas no Ceará, Rio Grande do Sul, São Paulo e Japão. Mestre Moraes continua dirigindo o GCAP como um projeto de extensão cultural, tendo formado mais de vinte alunos que se tornaram mestres, incluindo Cobra Mansa, Janja, Paulinha, Poloca, Valmir e Jurandir—muitos dos quais fundaram suas próprias organizações espalhando a Capoeira Angola pelo mundo.',
  -- Achievements
  E'- Founded Grupo de Capoeira Angola Pelourinho (GCAP) on October 5, 1980 - one of the world''s most recognized Capoeira Angola organizations
- Grammy Award nomination (2004) for "Brincando na Roda" - first and only capoeira recording nominated for a Grammy
- PhD in Culture and Society from Federal University of Bahia (UFBA)
- Master''s degree in Social History from UFBA
- Degree in Vernacular Letters with English from Universidade Católica do Salvador (1991)
- Codified the musical structure of Capoeira Angola bateria
- Formed the first mestres of Capoeira Angola outside of Bahia (1978)
- Persuaded Mestre João Grande to return from retirement (mid-1980s)
- Central figure in the 1980s Capoeira Angola revival
- Trained 20+ students who became mestres (Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir, etc.)
- GCAP schools in Salvador, Ceará, Rio Grande do Sul, São Paulo, and Japan
- TEDx Pelourinho speaker on prejudice in capoeira',
  E'- Fundou o Grupo de Capoeira Angola Pelourinho (GCAP) em 5 de outubro de 1980 - uma das organizações de Capoeira Angola mais reconhecidas do mundo
- Indicação ao Grammy Award (2004) por "Brincando na Roda" - primeira e única gravação de capoeira indicada ao Grammy
- Doutorado em Cultura e Sociedade pela Universidade Federal da Bahia (UFBA)
- Mestrado em História Social pela UFBA
- Graduação em Letras Vernáculas com Inglês pela Universidade Católica do Salvador (1991)
- Codificou a estrutura musical da bateria de Capoeira Angola
- Formou os primeiros mestres de Capoeira Angola fora da Bahia (1978)
- Convenceu Mestre João Grande a sair da aposentadoria (meados dos anos 1980)
- Figura central no renascimento da Capoeira Angola nos anos 1980
- Formou mais de 20 alunos que se tornaram mestres (Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir, etc.)
- Escolas do GCAP em Salvador, Ceará, Rio Grande do Sul, São Paulo e Japão
- Palestrante no TEDx Pelourinho sobre preconceito na capoeira',
  -- Researcher notes (notes_en)
  E'BIRTH DATE: February 9, 1950 is consistently reported across sources (Wikipedia, Lalaue, CapoeiraHub, Nossa-Tribo). One source (Raridades da Capoeira) mentions 1959 as an alternative, but this appears to be an error - using 1950 as primary date.

BIRTH PLACE: Ilha de Maré, an island in the Bay of All Saints near Salvador, confirmed across all sources.

NAME VARIATIONS: Also reported as "Pedro Martinez Trindade" in some sources - using "Pedro Moraes Trindade" as most common.

TRAINING TIMELINE: Sources consistently state he began training around age 7-8, which would be ~1957-1958. Trained at Pastinha''s academy where João Grande and João Pequeno were the primary instructors (Pastinha was blind by this time).

GCAP FOUNDING: October 5, 1980 at Cosme Velho artisan fair is the documented founding date. The idea came from Mestre Neco. Logo designed by Mestre Braga.

MESTRE TITLE: Unclear when Moraes himself received the mestre title. He was already teaching by 1974 in Rio and formed other mestres in 1978, suggesting he was recognized as mestre by then.

RIO PERIOD: 1970-1982 (12 years). Joined Marines 1970, returned to Salvador 1982.

GRAMMY: "Brincando na Roda" was nominated in 2004 for Best Traditional World Music Album. Some sources incorrectly cite 1984.

STUDENTS: Over 22 documented students who became mestres per CapoeiraHub, including Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir, and others.

PENDING RELATIONSHIPS (objects not yet in dataset):
- Moraes founded GCAP (group not yet imported)
- Moraes trained Cobra Mansa, Braga, Neco, Zé Carlos, Marco Aurélio, Janja, Paulinha, Poloca, Valmir, Jurandir (persons not yet imported)',
  E'DATA DE NASCIMENTO: 9 de fevereiro de 1950 é relatado consistentemente em todas as fontes (Wikipedia, Lalaue, CapoeiraHub, Nossa-Tribo). Uma fonte (Raridades da Capoeira) menciona 1959 como alternativa, mas isso parece ser um erro - usando 1950 como data principal.

LOCAL DE NASCIMENTO: Ilha de Maré, uma ilha na Baía de Todos os Santos perto de Salvador, confirmado em todas as fontes.

VARIAÇÕES DE NOME: Também relatado como "Pedro Martinez Trindade" em algumas fontes - usando "Pedro Moraes Trindade" como mais comum.

CRONOLOGIA DE TREINO: Fontes consistentemente afirmam que começou a treinar por volta dos 7-8 anos, o que seria ~1957-1958. Treinou na academia de Pastinha onde João Grande e João Pequeno eram os instrutores principais (Pastinha já estava cego nessa época).

FUNDAÇÃO DO GCAP: 5 de outubro de 1980 na feira de artesanato de Cosme Velho é a data de fundação documentada. A ideia veio de Mestre Neco. Logotipo desenhado por Mestre Braga.

TÍTULO DE MESTRE: Não está claro quando o próprio Moraes recebeu o título de mestre. Já estava ensinando em 1974 no Rio e formou outros mestres em 1978, sugerindo que já era reconhecido como mestre nessa época.

PERÍODO NO RIO: 1970-1982 (12 anos). Entrou na Marinha em 1970, retornou a Salvador em 1982.

GRAMMY: "Brincando na Roda" foi indicado em 2004 para Melhor Álbum de Música Tradicional do Mundo. Algumas fontes incorretamente citam 1984.

ALUNOS: Mais de 22 alunos documentados que se tornaram mestres por CapoeiraHub, incluindo Cobra Mansa, Janja, Paulinha, Poloca, Valmir, Jurandir e outros.

RELACIONAMENTOS PENDENTES (objetos ainda não no dataset):
- Moraes fundou GCAP (grupo ainda não importado)
- Moraes treinou Cobra Mansa, Braga, Neco, Zé Carlos, Marco Aurélio, Janja, Paulinha, Poloca, Valmir, Jurandir (pessoas ainda não importadas)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
