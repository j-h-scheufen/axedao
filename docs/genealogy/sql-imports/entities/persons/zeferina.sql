-- ============================================================
-- GENEALOGY PERSON: Zeferina
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Active as valentona/capoeirista from 1917-1920 per newspaper records.
-- If in prime fighting age (20-35) during documented conflicts, birth = ~1882-1900.
-- Using 1890 as midpoint (same estimation as rival Idalina, suggesting contemporaries of similar age).
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
  NULL,
  'Zeferina',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for physical combat skills using punches and kicks ("murro e pontapé"). Part of the street culture that characterized urban capoeiragem in early 20th century Salvador, particularly in the Distrito da Sé.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida por habilidades de combate físico usando socos e chutes ("murro e pontapé"). Parte da cultura de rua que caracterizava a capoeiragem urbana no início do século XX em Salvador, particularmente no Distrito da Sé.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Zeferina de tal was a female capoeirista and valentona from Salvador, Bahia, documented in newspaper and police records from the 1910s and 1920s. Little is known about her beyond her fierce rivalry with Idalina Maria do Sacramento, another legendary valentona of the era.\n\nThe conflict between Zeferina and Idalina was rooted in their competition over prostitution territory ("ponto de prostituição") in the Distrito da Sé, a notorious area in Salvador''s Baixa dos Sapateiros that was home to capadócios, valentes, and the incorrigible women who challenged social order.\n\nOn April 24, 1920, the Jornal de Notícias reported on their confrontation: "Foi presa mais uma vez ZEFERINA DE TAL, por brigar com sua companheira Idalina Maria do Sacramento" (Zeferina so-and-so was arrested once again for fighting with her companion Idalina Maria do Sacramento). The newspaper described how "encontraram-se as desafetas e foram ao duelo a murro e pontapé" (the rivals met and went to a duel with punches and kicks).\n\nBoth women had extensive police records, charged multiple times with "capoeiragem" - the practice of capoeira, which was criminalized under the 1890 Penal Code. Their use of fighting techniques identified them as practitioners of the art, though the line between capoeiristas and general street fighters was often blurred in police records of the era.\n\nZeferina was one of hundreds of "mulheres incorrigíveis" (incorrigible women) documented by Paula Juliana Foltran in her groundbreaking doctoral research at the University of Brasília. This research, conducted in the Arquivo Público do Estado da Bahia, dismantled the myth that capoeira was exclusively a male domain, revealing that women actively participated in the street culture of early 20th century Salvador.\n\nThe term "de tal" (so-and-so) in her name suggests either that her full name was unknown to authorities, or that it was deliberately omitted - a common practice for marginalized individuals whose identities were considered unimportant by those recording their arrests. Despite this anonymity, her repeated appearances in police records and her documented rivalry with Idalina demonstrate that she was a recognized figure in the violent underworld of Salvador''s streets.',
  E'Zeferina de tal foi uma capoeirista e valentona de Salvador, Bahia, documentada em registros de jornais e policiais das décadas de 1910 e 1920. Pouco se sabe sobre ela além de sua feroz rivalidade com Idalina Maria do Sacramento, outra lendária valentona da época.\n\nO conflito entre Zeferina e Idalina tinha raiz na competição pelo ponto de prostituição no Distrito da Sé, uma área notória na Baixa dos Sapateiros de Salvador que era lar de capadócios, valentes e das mulheres incorrigíveis que desafiavam a ordem social.\n\nEm 24 de abril de 1920, o Jornal de Notícias relatou o confronto: "Foi presa mais uma vez ZEFERINA DE TAL, por brigar com sua companheira Idalina Maria do Sacramento". O jornal descreveu como "encontraram-se as desafetas e foram ao duelo a murro e pontapé".\n\nAmbas as mulheres tinham extensos registros policiais, acusadas múltiplas vezes de "capoeiragem" - a prática da capoeira, que era criminalizada pelo Código Penal de 1890. O uso de técnicas de luta as identificava como praticantes da arte, embora a linha entre capoeiristas e lutadoras de rua em geral fosse frequentemente nebulosa nos registros policiais da época.\n\nZeferina foi uma das centenas de "mulheres incorrigíveis" documentadas por Paula Juliana Foltran em sua pesquisa de doutorado pioneira na Universidade de Brasília. Esta pesquisa, realizada no Arquivo Público do Estado da Bahia, desmontou o mito de que a capoeira era um domínio exclusivamente masculino, revelando que as mulheres participavam ativamente da cultura de rua do início do século XX em Salvador.\n\nO termo "de tal" em seu nome sugere que seu nome completo era desconhecido pelas autoridades, ou que foi deliberadamente omitido - uma prática comum para indivíduos marginalizados cujas identidades eram consideradas sem importância por quem registrava suas prisões. Apesar deste anonimato, suas repetidas aparições em registros policiais e sua rivalidade documentada com Idalina demonstram que ela era uma figura reconhecida no violento submundo das ruas de Salvador.',
  E'Multiple arrests for capoeiragem in 1910s-1920s Salvador; documented rival of legendary valentona Idalina; part of the "mulheres incorrigíveis" researched by Paula Foltran',
  E'Múltiplas prisões por capoeiragem em Salvador nos anos 1910-1920; rival documentada da lendária valentona Idalina; parte das "mulheres incorrigíveis" pesquisadas por Paula Foltran',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1890, decade precision):\nActive as valentona/capoeirista from 1917-1920 per newspaper records. If in prime fighting age (20-35) during documented conflicts, birth = ~1882-1900. Using 1890 as midpoint (same as rival Idalina, suggesting contemporaries of similar age).\n\nNAME:\n- Known only as "Zeferina de tal" (Zeferina so-and-so)\n- "De tal" indicates full name unknown or omitted by authorities\n- No other name variants found\n- DISTINCT from Zeferina the quilombola leader of 1826 Quilombo do Urubu revolt\n\nDEATH: Unknown. No death records found.\n\nDOCUMENTED CONFLICTS WITH IDALINA:\n- Multiple conflicts over prostitution territory in Distrito da Sé\n- April 24, 1920: "encontraram-se as desafetas e foram ao duelo a murro e pontapé"\n- Both arrested multiple times for capoeiragem\n- Source: Jornal de Notícias (1917, April 24, 1920)\n\nDATE DISCREPANCY:\n- Some sources cite 1917 as conflict date\n- Others cite April 24, 1920\n- Most likely MULTIPLE conflicts over several years (1917-1920)\n- Both women had "vasta lista de registros policiais" per Paula Foltran\n\nCONTEXT:\n- Distrito da Sé / Baixa dos Sapateiros - notorious area for capadócios\n- Prostitution territory disputes were common source of violence\n- Capoeira was criminalized (1890 Penal Code)\n- Police often conflated general troublemakers with capoeiristas\n\nCONTEMPORARY VALENTONAS (1910s-1920s Salvador):\n- Idalina Maria do Sacramento (documented rival)\n- Angélica Endiabrada\n- Maria Doze Homens\n- Rosa Palmeirão\n- Salomé\n- Chicão\n\nPRIMARY SOURCES:\n- Jornal de Notícias (Salvador, 1917, April 24, 1920)\n- Paula Juliana Foltran, "Mulheres incorrigíveis" PhD thesis (UnB, 2019)\n- Antônio Vianna, "Casos e coisas da Bahia" (cited in secondary sources)\n\nIMPORTANT DISTINCTION:\nZeferina the capoeirista (this profile, 1890s-1920s) is DISTINCT from:\n- Zeferina the quilombola (1826 Quilombo do Urubu revolt leader)\n- Maria Zeferina Alvares Castro (1880-1914, genealogy records)\n- Zeferina Falcon Torres (1854-1914, genealogy records)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década):\nAtiva como valentona/capoeirista de 1917-1920 segundo registros de jornais. Se estava em idade de luta (20-35) durante conflitos documentados, nascimento = ~1882-1900. Usando 1890 como ponto médio (mesmo que a rival Idalina, sugerindo contemporâneas de idade similar).\n\nNOME:\n- Conhecida apenas como "Zeferina de tal"\n- "De tal" indica nome completo desconhecido ou omitido pelas autoridades\n- Nenhuma outra variante de nome encontrada\n- DISTINTA de Zeferina a líder quilombola da revolta de 1826 do Quilombo do Urubu\n\nMORTE: Desconhecida. Nenhum registro de óbito encontrado.\n\nCONFLITOS DOCUMENTADOS COM IDALINA:\n- Múltiplos conflitos por ponto de prostituição no Distrito da Sé\n- 24 de abril de 1920: "encontraram-se as desafetas e foram ao duelo a murro e pontapé"\n- Ambas presas múltiplas vezes por capoeiragem\n- Fonte: Jornal de Notícias (1917, 24 de abril de 1920)\n\nDISCREPÂNCIA DE DATAS:\n- Algumas fontes citam 1917 como data do conflito\n- Outras citam 24 de abril de 1920\n- Mais provável MÚLTIPLOS conflitos ao longo de vários anos (1917-1920)\n- Ambas tinham "vasta lista de registros policiais" segundo Paula Foltran\n\nCONTEXTO:\n- Distrito da Sé / Baixa dos Sapateiros - área notória por capadócios\n- Disputas por ponto de prostituição eram fonte comum de violência\n- Capoeira era criminalizada (Código Penal de 1890)\n- Polícia frequentemente confundia desordeiros gerais com capoeiristas\n\nVALENTONAS CONTEMPORÂNEAS (1910s-1920s Salvador):\n- Idalina Maria do Sacramento (rival documentada)\n- Angélica Endiabrada\n- Maria Doze Homens\n- Rosa Palmeirão\n- Salomé\n- Chicão\n\nFONTES PRIMÁRIAS:\n- Jornal de Notícias (Salvador, 1917, 24 de abril de 1920)\n- Paula Juliana Foltran, "Mulheres incorrigíveis" tese PhD (UnB, 2019)\n- Antônio Vianna, "Casos e coisas da Bahia" (citado em fontes secundárias)\n\nDISTINÇÃO IMPORTANTE:\nZeferina a capoeirista (este perfil, 1890s-1920s) é DISTINTA de:\n- Zeferina a quilombola (líder da revolta de 1826 do Quilombo do Urubu)\n- Maria Zeferina Alvares Castro (1880-1914, registros genealógicos)\n- Zeferina Falcon Torres (1854-1914, registros genealógicos)'
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
