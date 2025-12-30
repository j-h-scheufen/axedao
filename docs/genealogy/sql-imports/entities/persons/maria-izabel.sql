-- ============================================================
-- GENEALOGY PERSON: Maria Izabel
-- Generated: 2025-12-19
-- ============================================================
-- REPRESENTATIVE FIGURE: Maria Izabel represents the hundreds
-- of anonymous women uncovered by Paula Juliana Foltran's
-- doctoral research (2019) in the Arquivo Público do Estado
-- da Bahia. Her single newspaper record stands as a memorial
-- to all the "mulheres incorrigíveis" whose names were lost
-- to history.
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
  'Maria Izabel',
  'Maria Izabel',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://repositorio.unb.br/handle/10482/35969']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era; practiced before style distinctions existed. Part of the street culture where women carried knives and razors for protection and combat.',
  E'Era pré-moderna; praticava antes das distinções de estilo. Parte da cultura de rua onde mulheres carregavam facas e navalhas para proteção e combate.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Maria Izabel''s name survives in a single newspaper record: on December 2, 1914, the Gazeta do Povo of Salvador reported her arrest for street disorder while carrying a knife.\n\nShe is one of hundreds of women whose stories were uncovered by historian Paula Juliana Foltran during her doctoral research at the Arquivo Público do Estado da Bahia. Foltran''s thesis, "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" (2019), identified countless women like Maria Izabel - arrested for fighting in the streets, carrying weapons, and refusing to submit to the social order that sought to control them.\n\nThese women navigated the same urban geography as male capoeiristas: the streets, the markets, the docks, the ladeiras (hillside streets) of Salvador. They carried the same weapons - navalha (razor), faca (knife), canivete (penknife) - and engaged in the same culture of valentia (bravery/toughness) that defined the capoeiragem of their era.\n\nMaria Izabel''s profile in this genealogy serves as a memorial to these hundreds of anonymous women. While figures like Angélica Endiabrada, Salomé, and Maria Doze Homens achieved legendary status through oral tradition and literatura de cordel, most women who fought in the streets of old Bahia left only traces in police records and newspaper crime reports.\n\nFoltran''s research demonstrates that the erasure of these women from capoeira history was not due to their absence, but to the systematic way their participation was dismissed. When men fought in the streets, it was valentia; when women did the same, it was merely desordem (disorder). The same acts that built the reputations of male valentões were used to criminalize and forget the women who stood beside them.\n\nMaria Izabel''s 1914 arrest record proves she was there. Her inclusion here honors not just her, but all the unnamed women of her generation who helped forge the culture of capoeiragem in the ladeiras da Bahia.',
  E'O nome de Maria Izabel sobrevive em um único registro de jornal: em 2 de dezembro de 1914, a Gazeta do Povo de Salvador reportou sua prisão por desordem na rua enquanto portava uma faca.\n\nEla é uma das centenas de mulheres cujas histórias foram descobertas pela historiadora Paula Juliana Foltran durante sua pesquisa de doutorado no Arquivo Público do Estado da Bahia. A tese de Foltran, "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" (2019), identificou inúmeras mulheres como Maria Izabel - presas por brigar nas ruas, portar armas e recusar-se a se submeter à ordem social que buscava controlá-las.\n\nEssas mulheres navegavam a mesma geografia urbana dos capoeiristas masculinos: as ruas, os mercados, as docas, as ladeiras de Salvador. Elas carregavam as mesmas armas - navalha, faca, canivete - e participavam da mesma cultura de valentia que definia a capoeiragem de sua época.\n\nO perfil de Maria Izabel nesta genealogia serve como memorial a essas centenas de mulheres anônimas. Enquanto figuras como Angélica Endiabrada, Salomé e Maria Doze Homens alcançaram status lendário através da tradição oral e literatura de cordel, a maioria das mulheres que lutaram nas ruas da velha Bahia deixou apenas rastros em registros policiais e notícias de crime.\n\nA pesquisa de Foltran demonstra que o apagamento dessas mulheres da história da capoeira não se deveu à sua ausência, mas à maneira sistemática como sua participação foi descartada. Quando homens brigavam nas ruas, era valentia; quando mulheres faziam o mesmo, era meramente desordem. Os mesmos atos que construíram a reputação dos valentões masculinos foram usados para criminalizar e esquecer as mulheres que estavam ao lado deles.\n\nO registro de prisão de Maria Izabel em 1914 prova que ela estava lá. Sua inclusão aqui honra não apenas ela, mas todas as mulheres sem nome de sua geração que ajudaram a forjar a cultura da capoeiragem nas ladeiras da Bahia.',
  E'Representative figure for the hundreds of anonymous women uncovered by Paula Juliana Foltran''s doctoral research in the Arquivo Público do Estado da Bahia',
  E'Figura representativa das centenas de mulheres anônimas descobertas pela pesquisa de doutorado de Paula Juliana Foltran no Arquivo Público do Estado da Bahia',
  -- Researcher notes
  E'REPRESENTATIVE FIGURE: Maria Izabel''s profile serves as a memorial to the hundreds of anonymous women documented in police records and newspapers of 1900-1920 Salvador. Her single archival trace represents all those whose names were lost.\n\nARREST RECORD: Gazeta do Povo, December 2, 1914 - arrested for street disorder ("desordem") while carrying a knife.\n\nBIRTH YEAR ESTIMATION (1890, decade precision): If arrested as an adult (20-30 years old) in 1914, birth would be approximately 1884-1894. Using 1890 as midpoint.\n\nNO APELIDO: Unlike legendary figures who earned nicknames (Angélica "Endiabrada", Maria "Doze Homens"), Maria Izabel''s record preserves only her given name - typical of the anonymous majority.\n\nACademic source: Paula Juliana Foltran, "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" PhD thesis, Universidade de Brasília, 2019. Research conducted at Arquivo Público do Estado da Bahia.\n\nCONTEXT: The thesis identified hundreds of similar cases - women arrested for street fighting, carrying weapons, causing "disorder". Most remain anonymous; Maria Izabel''s name survived by chance in a single newspaper record.\n\nSIGNIFICANCE: Her inclusion acknowledges that capoeira history includes not just legendary figures but the countless ordinary practitioners whose stories were systematically erased.',
  E'FIGURA REPRESENTATIVA: O perfil de Maria Izabel serve como memorial às centenas de mulheres anônimas documentadas em registros policiais e jornais de Salvador de 1900-1920. Seu único rastro arquivístico representa todas aquelas cujos nomes foram perdidos.\n\nREGISTRO DE PRISÃO: Gazeta do Povo, 2 de dezembro de 1914 - presa por desordem na rua enquanto portava uma faca.\n\nESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Se foi presa como adulta (20-30 anos) em 1914, o nascimento seria aproximadamente 1884-1894. Usando 1890 como ponto médio.\n\nSEM APELIDO: Diferente das figuras lendárias que ganharam apelidos (Angélica "Endiabrada", Maria "Doze Homens"), o registro de Maria Izabel preserva apenas seu nome - típico da maioria anônima.\n\nFONTE ACADÊMICA: Paula Juliana Foltran, "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" tese de doutorado, Universidade de Brasília, 2019. Pesquisa realizada no Arquivo Público do Estado da Bahia.\n\nCONTEXTO: A tese identificou centenas de casos similares - mulheres presas por brigar nas ruas, portar armas, causar "desordem". A maioria permanece anônima; o nome de Maria Izabel sobreviveu por acaso em um único registro de jornal.\n\nSIGNIFICÂNCIA: Sua inclusão reconhece que a história da capoeira inclui não apenas figuras lendárias, mas os inúmeros praticantes comuns cujas histórias foram sistematicamente apagadas.'
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
