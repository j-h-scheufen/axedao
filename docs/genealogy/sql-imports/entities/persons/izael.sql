-- ============================================================
-- GENEALOGY PERSON: Izael (Mestre Izael Teixeira)
-- Generated: 2026-01-10
-- ============================================================
-- Founder of Associação Cultural e Desportiva Pena de Ouro, the
-- oldest active capoeira association in São Carlos, São Paulo.
-- Dedicated to preserving and teaching Traditional Capoeira
-- Regional in the tradition of Mestre Bimba. Recognized as one
-- of the few mestres who practice Regional closest to Bimba's
-- original methodology (alongside Mestre Nenel and Mestre Deputado).
-- ============================================================
-- BIRTH YEAR ESTIMATION (1950, decade precision):
-- Faísca (born ~1965) sought mentorship from Izael pre-1991.
-- Izael was already an established mestre at that time. Mestres
-- who mentor typically are 35-50+ years old. If ~35-45 in 1991,
-- birth year ~1946-1956. Still living/active December 2024.
-- Estimate: 1950 with decade precision.
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
  'Izael Teixeira',
  'Izael',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://curtadoc.tv/curta/biografia/mestre-izael/', 'https://www.motricidades.org/journal/index.php/journal/article/view/2594-6463-2018-v2-n3-p177-189']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Traditional Capoeira Regional in the style of Mestre Bimba. Mestre Izael is recognized as one of the few mestres worldwide who practice Capoeira Regional closest to Bimba''s original methodology—alongside Mestre Nenel (Bimba''s son) and Mestre Deputado. He maintains the eight sequences, traditional throws, and roda format as Bimba taught them. His pedagogical approach emphasizes resistance, ancestrality, belonging, and the strengthening of African-descended identities.',
  E'Capoeira Regional Tradicional no estilo de Mestre Bimba. Mestre Izael é reconhecido como um dos poucos mestres no mundo que praticam a Capoeira Regional mais próxima da metodologia original de Bimba—ao lado de Mestre Nenel (filho de Bimba) e Mestre Deputado. Ele mantém as oito sequências, os golpes tradicionais e o formato de roda como Bimba os ensinava. Sua abordagem pedagógica enfatiza resistência, ancestralidade, pertencimento e o fortalecimento de identidades afrodescendentes.',
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Mestre Izael Teixeira is the founder of the Associação Cultural e Desportiva Pena de Ouro, the oldest active capoeira association in São Carlos, São Paulo. He has dedicated his life to teaching and preserving Traditional Capoeira Regional in the style created by Mestre Bimba.

With the Pena de Ouro group in São Carlos, Mestre Izael keeps alive the culture of Traditional Capoeira Regional, sharing his experience and knowledge as one of the guardians of the fundamentals of this capoeira tradition. His teaching is characterized by devotion, knowledge, and resistance—qualities that mark the stories and practices of this mestre who "gingas with life to the sound of the berimbau."

In 2011, a documentary film titled "Mestre Izael" was released, directed by Marta Kawamura. The 25-minute biographical film presents aspects of his life and history, showing him as an important figure for São Carlos culture (cultura sancarlense) and for capoeira in the state of São Paulo. The documentary establishes central themes and proposes scenes that structure the audiovisual narrative, leaving space for Mestre Izael himself to guide part of the film, resulting in an intimate and sincere portrait.

Mestre Izael has been an influential figure in the development of other capoeira practitioners. Mestre Faísca, now the designated successor of Mestre João Pequeno de Pastinha, sought out Mestre Izael''s mentorship in São Carlos before eventually turning to Capoeira Angola. Similarly, Mestre Camarão (of Centro de Capoeira São Salomão) counts his encounters with Mestre Izael among those fundamental to his broader understanding of capoeira and its responsibilities.

While Mestre Faísca eventually departed to pursue Capoeira Angola, Mestre Izael remained committed to recovering and preserving the Traditional Capoeira Regional of Mestre Bimba. This distinction places him among a very small number of mestres worldwide—including Mestre Nenel (Bimba''s son) and Mestre Deputado—who practice the "eight sequences, the throws, and the roda" as Bimba originally taught them.

On December 12, 2024, the São Carlos City Council held a ceremonial session to bestow upon Mestre Izael the title of "Cidadão Benemérito" (Distinguished Citizen) of São Carlos, in recognition of his numerous contributions to the population of the city.',
  -- Extended content (bio_pt)
  E'Mestre Izael Teixeira é o fundador da Associação Cultural e Desportiva Pena de Ouro, a mais antiga associação de capoeira em funcionamento em São Carlos, São Paulo. Ele dedicou sua vida ao ensino e à preservação da Capoeira Regional Tradicional no estilo criado por Mestre Bimba.

Com o grupo Pena de Ouro, em São Carlos, Mestre Izael mantém viva a cultura da Capoeira Regional Tradicional, compartilhando sua experiência e conhecimento como um dos guardiões dos fundamentos desta tradição da capoeira. Seu ensino é caracterizado por devoção, saber e resistência—qualidades que marcam as histórias e práticas deste mestre que "ginga com a vida ao som do berimbau."

Em 2011, foi lançado um documentário intitulado "Mestre Izael", dirigido por Marta Kawamura. O filme biográfico de 25 minutos apresenta aspectos de sua vida e história, mostrando-o como uma figura importante para a cultura sancarlense e para a capoeira no estado de São Paulo. O documentário estabelece temas centrais e propõe cenas que estruturam a narrativa audiovisual, deixando espaço para que o próprio Mestre Izael conduza parte do filme, resultando em um retrato íntimo e sincero.

Mestre Izael tem sido uma figura influente no desenvolvimento de outros capoeiristas. Mestre Faísca, agora o sucessor designado de Mestre João Pequeno de Pastinha, buscou a orientação de Mestre Izael em São Carlos antes de eventualmente se voltar para a Capoeira Angola. Da mesma forma, Mestre Camarão (do Centro de Capoeira São Salomão) conta seus encontros com Mestre Izael entre aqueles fundamentais para sua compreensão mais ampla da capoeira e suas responsabilidades.

Enquanto Mestre Faísca eventualmente se desligou para seguir a Capoeira Angola, Mestre Izael permaneceu comprometido em resgatar e preservar a Capoeira Regional Tradicional de Mestre Bimba. Esta distinção o coloca entre um número muito pequeno de mestres no mundo—incluindo Mestre Nenel (filho de Bimba) e Mestre Deputado—que praticam as "oito sequências, os golpes e a roda" como Bimba originalmente os ensinava.

Em 12 de dezembro de 2024, a Câmara Municipal de São Carlos realizou uma sessão solene para conceder a Mestre Izael o título de "Cidadão Benemérito" de São Carlos, em reconhecimento às suas inúmeras contribuições à população da cidade.',
  -- Achievements
  E'- Founder of Associação Cultural e Desportiva Pena de Ouro (oldest active capoeira association in São Carlos, SP)
- Recognized as one of the few mestres practicing Traditional Capoeira Regional closest to Bimba''s original methodology (alongside Nenel and Deputado)
- Subject of documentary film "Mestre Izael" (2011, dir. Marta Kawamura)
- Honored as "Cidadão Benemérito" (Distinguished Citizen) of São Carlos (December 12, 2024)
- Subject of academic dissertation on educational processes in capoeira (UFSCar, 2016)
- Mentored Mestre Faísca (future successor of João Pequeno)
- Guardian of Traditional Capoeira Regional fundamentals in São Paulo state
- Participated in Paulo Freire 90th birthday commemoration at UFSCar',
  E'- Fundador da Associação Cultural e Desportiva Pena de Ouro (associação de capoeira ativa mais antiga em São Carlos, SP)
- Reconhecido como um dos poucos mestres praticando Capoeira Regional Tradicional mais próxima da metodologia original de Bimba (ao lado de Nenel e Deputado)
- Tema do documentário "Mestre Izael" (2011, dir. Marta Kawamura)
- Homenageado como "Cidadão Benemérito" de São Carlos (12 de dezembro de 2024)
- Tema de dissertação acadêmica sobre processos educativos na capoeira (UFSCar, 2016)
- Orientou Mestre Faísca (futuro sucessor de João Pequeno)
- Guardião dos fundamentos da Capoeira Regional Tradicional no estado de São Paulo
- Participou da comemoração do 90º aniversário de Paulo Freire na UFSCar',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1950, decade precision):
Faísca (born ~1965) sought mentorship from Izael in São Carlos pre-1991. Izael was already an established mestre at that time, experienced enough to mentor others. Mestres who mentor typically are 35-50+ years old with significant experience. If ~35-45 years old in 1991, birth year would be ~1946-1956. Still living and active as of December 2024. Estimate: 1950 with decade precision (1950s).

DEATH YEAR: Living as of December 2024 (received Cidadão Benemérito honor).

LINEAGE/TEACHERS: Unknown. No sources mention who taught Mestre Izael or his lineage to Bimba. He is described as practicing Traditional Capoeira Regional in Bimba''s style, but direct lineage is undocumented.

PENA DE OURO FOUNDING DATE: Unknown. Sources consistently describe it as "the oldest active capoeira association in São Carlos" but do not specify when it was founded.

TRADITIONAL REGIONAL PRACTITIONERS:
Per adventurous-soul.com, extremely few groups practice "capoeira regional tradicional" as Bimba taught. The ones who stay closest to Bimba''s model are:
- Mestre Nenel (Bimba''s son, Filhos de Bimba)
- Mestre Deputado
- Mestre Izael (Pena de Ouro)

STUDENTS:
- Mestre Faísca (Luís Roberto Ricardo) - trained with Izael in São Carlos pre-1991; later departed to pursue Capoeira Angola under João Pequeno
- Mestre Camarão (Jeferson Straatmann) - influenced by encounters with Izael, Tião Preto, and Miguel Machado; teaches in São Carlos

DOCUMENTARY (2011):
- Title: "Mestre Izael"
- Director: Marta Kawamura
- Producers: Pietro Picolomini, Marta Kawamura
- Duration: 25 minutes
- Format: HD
- Sound: Cássio Marcello Mastropietro
- Photography: João Moura Leite Ribeiro
- Soundtrack: Izael Teixeira (himself)
- Classification: Biography/Non-fiction

CIVIC RECOGNITION:
December 12, 2024 - São Carlos City Council session to bestow "Cidadão Benemérito" title via Decree Nº 1091, initiative of Councilwoman Sara Bononi.

ACADEMIC RESEARCH:
2016 dissertation at UFSCar studied educational processes in the Master-Apprentice relationship at Pena de Ouro. Data collection: October 2014 - May 2015, 15 sessions, 11 participants. Identified themes: A) Pedagogical approach of Mestre Izael; B) Valorization by community; C) "While resting, I carry stone" - resistance and ancestrality.

PEDAGOGY:
His teaching emphasizes resistance, ancestrality, belonging, and strengthening of African-descended identities. Academic study found his knowledge "extends beyond Capoeira, enabling education for life."

OTHER CAPOEIRA IN SÃO CARLOS:
- Mestre Pé de Chumbo (Angola, CECA lineage via João Pequeno) - moved to São Carlos c. 1991
- Escola Jangadeiro de Ouro (33+ years, first to bring Capoterapia to SP state)',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1950, precisão de década):
Faísca (nascido ~1965) buscou orientação de Izael em São Carlos antes de 1991. Izael já era um mestre estabelecido naquela época, experiente o suficiente para orientar outros. Mestres que orientam tipicamente têm 35-50+ anos com experiência significativa. Se ~35-45 anos em 1991, ano de nascimento seria ~1946-1956. Ainda vivo e ativo em dezembro de 2024. Estimativa: 1950 com precisão de década (anos 1950).

ANO DE FALECIMENTO: Vivo em dezembro de 2024 (recebeu honra de Cidadão Benemérito).

LINHAGEM/PROFESSORES: Desconhecida. Nenhuma fonte menciona quem ensinou Mestre Izael ou sua linhagem até Bimba. Ele é descrito como praticando Capoeira Regional Tradicional no estilo de Bimba, mas a linhagem direta não é documentada.

DATA DE FUNDAÇÃO DA PENA DE OURO: Desconhecida. Fontes consistentemente a descrevem como "a associação de capoeira ativa mais antiga em São Carlos" mas não especificam quando foi fundada.

PRATICANTES DA REGIONAL TRADICIONAL:
Segundo adventurous-soul.com, pouquíssimos grupos praticam "capoeira regional tradicional" como Bimba ensinava. Os que ficam mais próximos do modelo de Bimba são:
- Mestre Nenel (filho de Bimba, Filhos de Bimba)
- Mestre Deputado
- Mestre Izael (Pena de Ouro)

ALUNOS:
- Mestre Faísca (Luís Roberto Ricardo) - treinou com Izael em São Carlos antes de 1991; depois se desligou para seguir Capoeira Angola com João Pequeno
- Mestre Camarão (Jeferson Straatmann) - influenciado por encontros com Izael, Tião Preto e Miguel Machado; ensina em São Carlos

DOCUMENTÁRIO (2011):
- Título: "Mestre Izael"
- Diretora: Marta Kawamura
- Produtores: Pietro Picolomini, Marta Kawamura
- Duração: 25 minutos
- Formato: HD
- Som: Cássio Marcello Mastropietro
- Fotografia: João Moura Leite Ribeiro
- Trilha sonora: Izael Teixeira (ele mesmo)
- Classificação: Biografia/Não-ficção

RECONHECIMENTO CÍVICO:
12 de dezembro de 2024 - Sessão da Câmara Municipal de São Carlos para conceder título de "Cidadão Benemérito" via Decreto Nº 1091, iniciativa da Vereadora Sara Bononi.

PESQUISA ACADÊMICA:
Dissertação de 2016 na UFSCar estudou processos educativos na relação Mestre-Aprendiz na Pena de Ouro. Coleta de dados: outubro 2014 - maio 2015, 15 encontros, 11 participantes. Temas identificados: A) Pedagogia do Mestre Izael; B) Valorização pela comunidade; C) "Enquanto descanso, carrego pedra" - resistência e ancestralidade.

PEDAGOGIA:
Seu ensino enfatiza resistência, ancestralidade, pertencimento e fortalecimento de identidades afrodescendentes. Estudo acadêmico concluiu que seu conhecimento "se estende além da Capoeira, possibilitando educação para a vida."

OUTRAS CAPOEIRAS EM SÃO CARLOS:
- Mestre Pé de Chumbo (Angola, linhagem CECA via João Pequeno) - mudou-se para São Carlos c. 1991
- Escola Jangadeiro de Ouro (33+ anos, primeiro a trazer Capoterapia para o estado de SP)'
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
