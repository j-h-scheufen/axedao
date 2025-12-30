-- ============================================================
-- GENEALOGY PERSON: Neco
-- Generated: 2025-12-28
-- ============================================================
-- KEY FIGURE: One of the first mestres of Capoeira Angola formed
-- outside of Bahia (Dec 16, 1978). Originated the concept of
-- GCAP, the organization that revitalized Capoeira Angola in
-- the 1980s. Remained in Rio de Janeiro after Moraes returned
-- to Salvador in 1982, continuing the Angola tradition there.
--
-- SIGNIFICANCE: While Moraes is credited as GCAP founder, the
-- founding idea came from Neco. He envisioned uniting the Rio
-- mestres under one organization to strengthen their collective
-- force against the Brazilian military government's suppression
-- of African culture.
--
-- BIRTH DATE: April 24, 1955 (CapoeiraWiki, confirmed)
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
  'Nivaldo de Siqueira Silva',
  'Neco',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeirawiki.org/wiki/April',
    'https://www.lalaue.com/learn-capoeira/mestre-braga/',
    'https://africabantu.wordpress.com/notas/',
    'https://angolario.wordpress.com/grupos/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Neco is a Capoeira Angola purist in the Pastinha lineage, trained under Mestre Moraes who himself learned from João Grande and João Pequeno at Pastinha''s academy. As one of the architects of GCAP, he emphasizes the philosophical and cultural dimensions of capoeira angola, viewing it as a tool for preserving African heritage and resisting cultural suppression. He continues to organize rodas through ACIMBA and maintains the traditional Angola practice in Rio de Janeiro.',
  E'Neco é um purista da Capoeira Angola na linhagem de Pastinha, treinado sob Mestre Moraes que aprendeu com João Grande e João Pequeno na academia de Pastinha. Como um dos arquitetos do GCAP, ele enfatiza as dimensões filosóficas e culturais da capoeira angola, vendo-a como ferramenta para preservar a herança africana e resistir à supressão cultural. Continua organizando rodas através da ACIMBA e mantém a prática tradicional de Angola no Rio de Janeiro.',
  -- Life dates
  1955,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Nivaldo de Siqueira Silva, known throughout the capoeira world as Mestre Neco Pelourinho, was born on April 24, 1955, in Rio de Janeiro, Brazil. He would become one of the most important figures in the implantation of Capoeira Angola outside of Bahia.

Neco began training in Capoeira Angola with Mestre Moraes after Moraes arrived in Rio de Janeiro in 1970 for his military service. By July 1975, Neco was part of the group training at Clube Gurilandia in Botafogo, alongside fellow students Braga, Peçanha (later known as Cobra Mansa), Mano, Tete, and others. Moraes emphasized the Angola tradition, sharing knowledge he had learned from "o velho" (Mestre Pastinha) through his own teachers João Grande and João Pequeno.

In December 1975, Neco made a pivotal journey to Salvador with a group that included Moraes, Braga, Marco Aurélio, Zé Carlos, Tete, and Amalha. During this trip, they visited Mestre Pastinha himself. The group remained in Salvador for January, participating in Bonfim festival celebrations featuring Angola roda dancing. This direct connection to the source of Capoeira Angola would profoundly shape Neco''s understanding and commitment to the art.

On December 16, 1978, at Parque Lage in Jardim Botânico, Rio de Janeiro, Neco received the rank of Mestre in a ceremonial advancement alongside his colleagues Braga and José Carlos (Zé Carlos). Marco Aurélio was simultaneously promoted to Contra-Mestre. Mestres Camisa and Preguiça attended as honored guests. These were the first mestres of Capoeira Angola formed outside of Bahia—a historic milestone in the art''s evolution.

The founding idea of the Grupo de Capoeira Angola Pelourinho (GCAP) originated from Neco. His vision was to unite the Rio mestres—Moraes, Braga, Zé Carlos, and himself—under one organization rather than having them compete individually. According to Neco, this arrangement would strengthen their collective force while maintaining fidelity to Mestre Pastinha''s legacy. The group would oppose the Brazilian military government''s suppression of African culture and preserve the traditions of Capoeira Angola.

On October 5, 1980, at 3:00 PM at a craft fair in Cosme Velho in Rio''s south zone, GCAP was formally founded with a demonstration of capoeira and maculelê. The founding mestres present were Neco, Moraes, Braga, and Zé Carlos, with Contra-Mestres Marco Aurélio and Peçanha. Mestre Braga designed the group''s iconic logo—a berimbau and two zebras fighting, symbolizing capoeira''s African origins in the n''golo tradition.

In 1982, Mestre Moraes returned to Salvador, bringing Cobra Mansa with him. He left the three young Rio mestres—Neco, Braga, and Zé Carlos—with full autonomy and responsibility to continue his teachings. Before departing, Moraes promoted Marco Aurélio to mestre.

After Moraes'' departure, the Rio mestres continued to develop GCAP. By 1986, they were meeting at the Instituto de Pesquisas das Culturas Negras (Institute for Black Culture Research) at Praça Cruz Vermelha. Among their students during this period were future mestres Lumumba, Pedro Edinho, Isac, Armando, Alexandre, Alcir, Severino, Denil, Carlos Alberto, Manoel, and Urubu, as well as women practitioners Teresa, Sonia, and Lucia.

A 1991 video commemorating the Ten Years of Activities of Grupo de Capoeira Angola Pelourinho of Rio de Janeiro featured great angoleiros including Mestres Moraes, Neco Pelourinho, Zé Carlos, Braga, Marco Aurélio, Armandinho, Angolinha, Lumumba, Rogério, Valmir, Brinco, Manoel, and others. The video documented rare moments including "Jogo do Dinheiro" (Money Game), featuring games between mestres.

At some point, Neco served as president of GCAP''s board of directors, with Braga as secretary and Lumumba as treasurer. At the inauguration of this board, there was a workshop and capoeira angola roda with Mestres Zé Carlos and Marco Aurélio, as well as visiting Mestres Moraes and Cobra Mansa.

Neco''s influence extends through his many students. Mestre Brinco (Claudio Luiz Costa Fernandes Couto), born in 1962, started capoeira at the age of 15 when he entered Neco''s Capoeira Angola group operating in Copaleme (Leme neighborhood). Contra-Mestra Cristina trained under Neco before becoming a student of Mestre Manoel. Contra-Mestre Marcos (later founder of Ashé Odara group) learned Capoeira Angola from Neco. In Chile, Seba Madeira founded Grupo Só Angola after training under both Neco and Mestre Fred Mussa.

Neco is a founder of the Grupo de Capoeira Angola Só Angola, currently located at Rua Almirante Alexandrino, 501 in the Largo dos Guimarães, Santa Teresa neighborhood of Rio de Janeiro. Together with Mestre Brinco and Mestre Lumumba, he leads ACIMBA (Associação Cultural Ilê Mestre Benedito de Angola), an association that brings together five different capoeira angola groups: Grupo de Capoeira Só Angola, Grupo de Capoeira Angola Volta Ao Mundo, Grupo de Capoeira Angola Gungaê, Grupo de Capoeira Angola Kabula, and Grupo de Capoeira Angola São Bento Pequeno.

ACIMBA organizes the "Roda da ACIMBA" at Rua Leandro Martins, 10, Centro, Rio de Janeiro, continuing the tradition of capoeira angola rodas that Neco has maintained for over four decades in the city.

Neco has also contributed to capoeira''s documentation, giving testimony in the documentary "Pastinha uma vida pela capoeira" where he stated that capoeira was created by enslaved people to protect themselves from their captors. He has narrated reflections of Mestre Pastinha''s teachings alongside Mestre Brinco.

Today, Mestre Neco Pelourinho remains one of the most important living figures in the history of Capoeira Angola in Rio de Janeiro—a guardian of tradition who originated the concept for the organization that would revitalize the art form in the 1980s and ensure its survival outside of Bahia.',
  -- Extended content (bio_pt)
  E'Nivaldo de Siqueira Silva, conhecido em todo o mundo da capoeira como Mestre Neco Pelourinho, nasceu em 24 de abril de 1955, no Rio de Janeiro, Brasil. Ele se tornaria uma das figuras mais importantes na implantação da Capoeira Angola fora da Bahia.

Neco começou a treinar Capoeira Angola com Mestre Moraes após Moraes chegar ao Rio de Janeiro em 1970 para seu serviço militar. Em julho de 1975, Neco fazia parte do grupo que treinava no Clube Gurilandia em Botafogo, junto com colegas estudantes Braga, Peçanha (mais tarde conhecido como Cobra Mansa), Mano, Tete e outros. Moraes enfatizava a tradição de Angola, compartilhando conhecimentos que havia aprendido de "o velho" (Mestre Pastinha) através de seus próprios mestres João Grande e João Pequeno.

Em dezembro de 1975, Neco fez uma jornada fundamental a Salvador com um grupo que incluía Moraes, Braga, Marco Aurélio, Zé Carlos, Tete e Amalha. Durante essa viagem, visitaram o próprio Mestre Pastinha. O grupo permaneceu em Salvador em janeiro, participando das celebrações do festival do Bonfim com rodas de Angola. Essa conexão direta com a fonte da Capoeira Angola moldaria profundamente a compreensão e o compromisso de Neco com a arte.

Em 16 de dezembro de 1978, no Parque Lage no Jardim Botânico, Rio de Janeiro, Neco recebeu o grau de Mestre em uma cerimônia de promoção junto com seus colegas Braga e José Carlos (Zé Carlos). Marco Aurélio foi simultaneamente promovido a Contra-Mestre. Os Mestres Camisa e Preguiça compareceram como convidados de honra. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia—um marco histórico na evolução da arte.

A ideia de fundação do Grupo de Capoeira Angola Pelourinho (GCAP) originou-se de Neco. Sua visão era unir os mestres cariocas—Moraes, Braga, Zé Carlos e ele próprio—sob uma organização em vez de competirem individualmente. Segundo Neco, esse arranjo fortaleceria sua força coletiva enquanto mantinha fidelidade ao legado de Mestre Pastinha. O grupo se oporia à supressão da cultura africana pelo governo militar brasileiro e preservaria as tradições da Capoeira Angola.

Em 5 de outubro de 1980, às 15h em uma feira de artesanato em Cosme Velho na zona sul do Rio, o GCAP foi formalmente fundado com uma demonstração de capoeira e maculelê. Os mestres fundadores presentes foram Neco, Moraes, Braga e Zé Carlos, com os Contra-Mestres Marco Aurélio e Peçanha. Mestre Braga desenhou o icônico logotipo do grupo—um berimbau e duas zebras lutando, simbolizando as origens africanas da capoeira na tradição do n''golo.

Em 1982, Mestre Moraes retornou a Salvador, trazendo Cobra Mansa. Ele deixou os três jovens mestres cariocas—Neco, Braga e Zé Carlos—com total autonomia e responsabilidade para continuar seus ensinamentos. Antes de partir, Moraes promoveu Marco Aurélio a mestre.

Após a partida de Moraes, os mestres cariocas continuaram a desenvolver o GCAP. Em 1986, reuniam-se no Instituto de Pesquisas das Culturas Negras na Praça Cruz Vermelha. Entre seus alunos durante esse período estavam os futuros mestres Lumumba, Pedro Edinho, Isac, Armando, Alexandre, Alcir, Severino, Denil, Carlos Alberto, Manoel e Urubu, assim como as praticantes Teresa, Sonia e Lucia.

Um vídeo de 1991 comemorando os Dez Anos de Atividades do Grupo de Capoeira Angola Pelourinho do Rio de Janeiro apresentou grandes angoleiros incluindo os Mestres Moraes, Neco Pelourinho, Zé Carlos, Braga, Marco Aurélio, Armandinho, Angolinha, Lumumba, Rogério, Valmir, Brinco, Manoel e outros. O vídeo documentou momentos raros incluindo o "Jogo do Dinheiro", apresentando jogos entre mestres.

Em algum momento, Neco serviu como presidente da diretoria do GCAP, com Braga como secretário e Lumumba como tesoureiro. Na posse dessa diretoria, houve uma oficina e roda de capoeira angola com os Mestres Zé Carlos e Marco Aurélio, assim como os Mestres visitantes Moraes e Cobra Mansa.

A influência de Neco se estende através de seus muitos alunos. Mestre Brinco (Claudio Luiz Costa Fernandes Couto), nascido em 1962, começou capoeira aos 15 anos quando entrou no grupo de Capoeira Angola de Neco operando no Copaleme (bairro do Leme). Contra-Mestra Cristina treinou sob Neco antes de se tornar aluna de Mestre Manoel. Contra-Mestre Marcos (mais tarde fundador do grupo Ashé Odara) aprendeu Capoeira Angola com Neco. No Chile, Seba Madeira fundou o Grupo Só Angola após treinar sob Neco e Mestre Fred Mussa.

Neco é fundador do Grupo de Capoeira Angola Só Angola, atualmente localizado na Rua Almirante Alexandrino, 501 no Largo dos Guimarães, bairro de Santa Teresa no Rio de Janeiro. Junto com Mestre Brinco e Mestre Lumumba, lidera a ACIMBA (Associação Cultural Ilê Mestre Benedito de Angola), uma associação que reúne cinco diferentes grupos de capoeira angola: Grupo de Capoeira Só Angola, Grupo de Capoeira Angola Volta Ao Mundo, Grupo de Capoeira Angola Gungaê, Grupo de Capoeira Angola Kabula e Grupo de Capoeira Angola São Bento Pequeno.

A ACIMBA organiza a "Roda da ACIMBA" na Rua Leandro Martins, 10, Centro, Rio de Janeiro, continuando a tradição de rodas de capoeira angola que Neco tem mantido por mais de quatro décadas na cidade.

Neco também contribuiu para a documentação da capoeira, dando testemunho no documentário "Pastinha uma vida pela capoeira" onde afirmou que a capoeira foi criada por pessoas escravizadas para se protegerem de seus captores. Ele narrou reflexões sobre os ensinamentos de Mestre Pastinha ao lado de Mestre Brinco.

Hoje, Mestre Neco Pelourinho permanece uma das figuras vivas mais importantes na história da Capoeira Angola no Rio de Janeiro—um guardião da tradição que originou o conceito para a organização que revitalizaria a forma de arte nos anos 1980 e garantiria sua sobrevivência fora da Bahia.',
  -- Achievements (English)
  E'- Originated the concept for GCAP (Grupo de Capoeira Angola Pelourinho) - the organization that revitalized Capoeira Angola in the 1980s
- Co-founder of GCAP on October 5, 1980
- One of the first mestres of Capoeira Angola formed outside of Bahia (December 16, 1978)
- Met Mestre Pastinha in Salvador (December 1975)
- Founder of Grupo de Capoeira Angola Só Angola in Rio de Janeiro
- Co-founder and leader of ACIMBA (Associação Cultural Ilê Mestre Benedito de Angola)
- Served as President of GCAP''s board of directors
- Trained notable students including Mestre Brinco, Contra-Mestra Cristina, Contra-Mestre Marcos (Ashé Odara)
- Testified in documentary "Pastinha uma vida pela capoeira"
- Over 40 years maintaining Capoeira Angola tradition in Rio de Janeiro',
  -- Achievements (Portuguese)
  E'- Originou o conceito do GCAP (Grupo de Capoeira Angola Pelourinho) - a organização que revitalizou a Capoeira Angola nos anos 1980
- Co-fundador do GCAP em 5 de outubro de 1980
- Um dos primeiros mestres de Capoeira Angola formados fora da Bahia (16 de dezembro de 1978)
- Conheceu Mestre Pastinha em Salvador (dezembro de 1975)
- Fundador do Grupo de Capoeira Angola Só Angola no Rio de Janeiro
- Co-fundador e líder da ACIMBA (Associação Cultural Ilê Mestre Benedito de Angola)
- Serviu como Presidente da diretoria do GCAP
- Formou alunos notáveis incluindo Mestre Brinco, Contra-Mestra Cristina, Contra-Mestre Marcos (Ashé Odara)
- Testemunhou no documentário "Pastinha uma vida pela capoeira"
- Mais de 40 anos mantendo a tradição de Capoeira Angola no Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH DATE: April 24, 1955 - Confirmed by CapoeiraWiki (capoeirawiki.org/wiki/April) and academic sources (UNILAB paper references interview with Neco from October 1997 by Renata Giovana de Almeida Martielo at UFRJ).

BIRTH PLACE: Rio de Janeiro - Based on context of his training with Moraes in Rio; not explicitly stated in sources but implied by his status as a Rio-based practitioner from the beginning.

FULL NAME: "Nivaldo de Siqueira Silva" - From CapoeiraWiki and academic references.

APELIDO: "Neco Pelourinho" - "Pelourinho" suffix associates him with the GCAP tradition, distinguishing from the historical Neco Canário Pardo (completely different person from 19th century Bahia).

TEACHERS:
- Mestre Moraes (primary teacher, from ~1975 at Clube Gurilandia, Botafogo)

STUDENTS (documented):
- Mestre Brinco (Claudio Luiz Costa Fernandes Couto, b. 1962, began training ~1977 at Copaleme)
- Contra-Mestra Cristina (trained under Neco before Mestre Manoel)
- Contra-Mestre Marcos (founder of Ashé Odara group in 2015)
- Seba Madeira (founder of Só Angola Chile, trained under Neco and Fred Mussa)

MESTRE TITLE: December 16, 1978 at Parque Lage, Jardim Botânico, Rio de Janeiro. Received alongside Braga and Zé Carlos. Marco Aurélio became Contra-Mestre same day. First mestres of Capoeira Angola formed outside Bahia. Mestres Camisa and Preguiça attended as guests.

GCAP FOUNDING: October 5, 1980 at 3:00 PM at Cosme Velho artisan fair. GCAP concept originated from Neco. Logo designed by Braga. Founding mestres: Moraes, Braga, Neco, Zé Carlos. Founding contra-mestres: Marco Aurélio, Peçanha (Cobra Mansa).

POST-1982 LEADERSHIP: After Moraes returned to Salvador, Neco remained in Rio with Braga and Zé Carlos. Served as GCAP President with Braga as Secretary, Lumumba as Treasurer.

CURRENT ORGANIZATIONS:
- Grupo de Capoeira Angola Só Angola (Rua Almirante Alexandrino, 501, Santa Teresa, RJ)
- ACIMBA (Associação Cultural Ilê Mestre Benedito de Angola) - co-founded with Brinco and Lumumba
- ACIMBA unites 5 groups: Só Angola, Volta Ao Mundo, Gungaê, Kabula, São Bento Pequeno
- Roda da ACIMBA: Rua Leandro Martins, 10, Centro, RJ

DOCUMENTARY APPEARANCES:
- "Pastinha uma vida pela capoeira" - gave testimony
- GCAP 10-year anniversary video (1991)

INTERVIEW RECORDED: October 1997 by Renata Giovana de Almeida Martielo (UFRJ) - cited in academic paper

PENDING RESEARCH:
- Exact date when Neco started training with Moraes (sources say after 1975, may have been earlier)
- Details of Fred Mussa relationship
- When ACIMBA was founded
- When Só Angola group was founded

SOURCES:
- capoeirawiki.org/wiki/April (birth date, full name)
- lalaue.com/learn-capoeira/mestre-braga/ (GCAP founding, Dec 1978 ceremony)
- africabantu.wordpress.com/notas/ (detailed GCAP history, founding dates)
- angolario.wordpress.com/grupos/ (ACIMBA, Só Angola current info)
- periodicos.ufpi.br/index.php/entrerios/article/view/5173 (academic paper on Capoeira Angola in Rio 1970-1981)
- capoeirahistory.com/master-brinco/ (Brinco as Neco''s student)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 24 de abril de 1955 - Confirmado pela CapoeiraWiki (capoeirawiki.org/wiki/April) e fontes acadêmicas (artigo UNILAB referencia entrevista com Neco de outubro de 1997 por Renata Giovana de Almeida Martielo na UFRJ).

LOCAL DE NASCIMENTO: Rio de Janeiro - Baseado no contexto de seu treinamento com Moraes no Rio; não explicitamente declarado nas fontes mas implicado por seu status como praticante baseado no Rio desde o início.

NOME COMPLETO: "Nivaldo de Siqueira Silva" - Da CapoeiraWiki e referências acadêmicas.

APELIDO: "Neco Pelourinho" - O sufixo "Pelourinho" o associa à tradição do GCAP, distinguindo do histórico Neco Canário Pardo (pessoa completamente diferente da Bahia do século 19).

MESTRES:
- Mestre Moraes (mestre principal, a partir de ~1975 no Clube Gurilandia, Botafogo)

ALUNOS (documentados):
- Mestre Brinco (Claudio Luiz Costa Fernandes Couto, n. 1962, começou a treinar ~1977 no Copaleme)
- Contra-Mestra Cristina (treinou sob Neco antes de Mestre Manoel)
- Contra-Mestre Marcos (fundador do grupo Ashé Odara em 2015)
- Seba Madeira (fundador do Só Angola Chile, treinou sob Neco e Fred Mussa)

TÍTULO DE MESTRE: 16 de dezembro de 1978 no Parque Lage, Jardim Botânico, Rio de Janeiro. Recebido junto com Braga e Zé Carlos. Marco Aurélio tornou-se Contra-Mestre no mesmo dia. Primeiros mestres de Capoeira Angola formados fora da Bahia. Mestres Camisa e Preguiça compareceram como convidados.

FUNDAÇÃO DO GCAP: 5 de outubro de 1980 às 15h na feira de artesanato de Cosme Velho. Conceito do GCAP originou-se de Neco. Logotipo desenhado por Braga. Mestres fundadores: Moraes, Braga, Neco, Zé Carlos. Contra-mestres fundadores: Marco Aurélio, Peçanha (Cobra Mansa).

LIDERANÇA PÓS-1982: Após Moraes retornar a Salvador, Neco permaneceu no Rio com Braga e Zé Carlos. Serviu como Presidente do GCAP com Braga como Secretário, Lumumba como Tesoureiro.

ORGANIZAÇÕES ATUAIS:
- Grupo de Capoeira Angola Só Angola (Rua Almirante Alexandrino, 501, Santa Teresa, RJ)
- ACIMBA (Associação Cultural Ilê Mestre Benedito de Angola) - co-fundada com Brinco e Lumumba
- ACIMBA une 5 grupos: Só Angola, Volta Ao Mundo, Gungaê, Kabula, São Bento Pequeno
- Roda da ACIMBA: Rua Leandro Martins, 10, Centro, RJ

APARIÇÕES EM DOCUMENTÁRIOS:
- "Pastinha uma vida pela capoeira" - deu testemunho
- Vídeo do 10º aniversário do GCAP (1991)

ENTREVISTA GRAVADA: Outubro de 1997 por Renata Giovana de Almeida Martielo (UFRJ) - citada em artigo acadêmico

PESQUISA PENDENTE:
- Data exata quando Neco começou a treinar com Moraes (fontes dizem após 1975, pode ter sido antes)
- Detalhes da relação com Fred Mussa
- Quando ACIMBA foi fundada
- Quando grupo Só Angola foi fundado

FONTES:
- capoeirawiki.org/wiki/April (data de nascimento, nome completo)
- lalaue.com/learn-capoeira/mestre-braga/ (fundação do GCAP, cerimônia de Dez 1978)
- africabantu.wordpress.com/notas/ (história detalhada do GCAP, datas de fundação)
- angolario.wordpress.com/grupos/ (ACIMBA, Só Angola info atual)
- periodicos.ufpi.br/index.php/entrerios/article/view/5173 (artigo acadêmico sobre Capoeira Angola no Rio 1970-1981)
- capoeirahistory.com/master-brinco/ (Brinco como aluno de Neco)'
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
