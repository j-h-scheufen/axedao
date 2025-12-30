-- ============================================================
-- GENEALOGY PERSON: Pintor
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1955, decade):
-- Sources state 40+ years of capoeira experience (as of ~2015-2020),
-- meaning he started training around 1975-1980. If he started as a
-- teenager (13-18) as stated, birth year is approximately 1957-1967.
-- He was graduated mestre in 1989, suggesting he was at least in his
-- late 20s to early 30s by then. Estimating birth around 1955-1965.
-- Using 1955 with decade precision as central estimate.
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Paulo César Leite dos Santos',
  'Pintor',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/', 'https://www.lalaue.com/capoeira-schools/grupo-bantus/', 'https://bantus.asn.au/teachers/']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Although trained primarily in Capoeira Angola under Mestre João Pequeno de Pastinha, his school Grupo Bantus Capoeira teaches both Angola and Regional styles, embracing the contemporary approach that blends capoeira''s varying historical influences. He emphasizes the cultural arts that surround capoeira, including Maculelê, Samba de Roda, and Forró.',
  E'Embora tenha sido treinado principalmente em Capoeira Angola sob Mestre João Pequeno de Pastinha, sua escola Grupo Bantus Capoeira ensina tanto os estilos Angola quanto Regional, abraçando a abordagem contemporânea que mescla as diversas influências históricas da capoeira. Ele enfatiza as artes culturais que cercam a capoeira, incluindo Maculelê, Samba de Roda e Forró.',
  -- Life dates
  1955,
  'decade'::genealogy.date_precision,
  'Belo Horizonte, Minas Gerais, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Paulo César Leite dos Santos, known as Mestre Pintor in capoeira circles, is the founder and international director of Grupo Bantus Capoeira. Born in Belo Horizonte, he began his capoeira journey in the neighborhoods of Santa Tereza and Floresta, playing with friends in the streets of Minas Gerais''s capital city.

As a teenager, Pintor made a pivotal journey to Bahia to deepen his understanding of capoeira under the guidance of the legendary mestres of that generation. He trained with an impressive roster of masters: Atenilo (Bimba''s devoted student of 45 years), Waldemar (the iconic Angola mestre of Liberdade), Canjiquinha ("The Joy of Capoeira"), Curió (Pastinha''s disciple), Caiçara (master of the bengala), Gigante/Bigodinho (Waldemar''s student), João Grande (Pastinha''s living legend), Boa Gente (the MMA champion of Bahia), Bom Cabrito (Cobrinha Verde and Gato Preto''s student), Medicina, and Papo de Santo Amaro. This breadth of training exposed him to both Regional and Angola traditions during their most vibrant period.

After years of learning from these masters, Pintor settled on the teaching and practice of Mestre João Pequeno de Pastinha in Salvador. João Pequeno, along with João Grande, was one of the "two most prepared students" of Mestre Pastinha himself, making Pintor a direct inheritor of the Pastinha Angola lineage.

In 1989, Mestre João Pequeno graduated Pintor as Mestre during a ceremony with Grupo Macaco at the Escola de Educação Física in Belo Horizonte. A few years later, he received additional recognition as a Mestre of Capoeira Angola specifically.

On February 2, 1991, Mestre Pintor founded Grupo Bantus Capoeira (GBC) in Belo Horizonte with the objective of strengthening and transmitting Brazilian cultural manifestations. The name "Bantus" honors the Bantu peoples of Africa—the "-ntu" suffix meaning "human" and the "Ba-" prefix indicating plurality, together signifying "the people". This name acknowledges the African roots of capoeira and Brazilian culture.

Under his leadership, Grupo Bantus has expanded far beyond Minas Gerais. Today the organization has schools throughout Belo Horizonte and the state, as well as international branches in Japan, Australia, Malaysia, Singapore, Thailand, Indonesia, and Israel. Mestre Pintor travels worldwide to share his knowledge, having taught across Brazil, South America, Australia, Asia, Europe, and the Middle East over his 40+ years of practice.

Beyond capoeira, Mestre Pintor is recognized as an expert in Maculelê (the stick-fighting dance), Samba de Roda (the traditional circle samba of Bahia), and Forró (northeastern Brazilian partner dance). Grupo Bantus also incorporates Puxada de Rede (the fisherman''s net-pulling ritual) and percussion ensembles into its cultural programming.

The group maintains active social projects in Brazil, including participation in "Fica Vivo" and "Escola Integrada" programs. The headquarters remains in Belo Horizonte at Rua Rio Grande do Norte, 1501 - Funcionários.',
  -- bio_pt
  E'Paulo César Leite dos Santos, conhecido como Mestre Pintor nos círculos de capoeira, é o fundador e diretor internacional do Grupo Bantus Capoeira. Nascido em Belo Horizonte, iniciou sua jornada na capoeira nos bairros de Santa Tereza e Floresta, jogando com amigos nas ruas da capital mineira.

Na adolescência, Pintor fez uma viagem decisiva à Bahia para aprofundar sua compreensão da capoeira sob a orientação dos lendários mestres daquela geração. Treinou com uma impressionante lista de mestres: Atenilo (aluno devoto de Bimba por 45 anos), Waldemar (o icônico mestre de Angola da Liberdade), Canjiquinha ("A Alegria da Capoeira"), Curió (discípulo de Pastinha), Caiçara (mestre da bengala), Gigante/Bigodinho (aluno de Waldemar), João Grande (lenda viva de Pastinha), Boa Gente (campeão de MMA da Bahia), Bom Cabrito (aluno de Cobrinha Verde e Gato Preto), Medicina, e Papo de Santo Amaro. Essa amplitude de treinamento o expôs tanto às tradições Regional quanto Angola durante seu período mais vibrante.

Após anos aprendendo com esses mestres, Pintor estabeleceu-se no ensino e prática de Mestre João Pequeno de Pastinha em Salvador. João Pequeno, junto com João Grande, era um dos "dois alunos mais preparados" do próprio Mestre Pastinha, tornando Pintor um herdeiro direto da linhagem Angola de Pastinha.

Em 1989, Mestre João Pequeno graduou Pintor como Mestre durante uma cerimônia com o Grupo Macaco na Escola de Educação Física em Belo Horizonte. Alguns anos depois, recebeu reconhecimento adicional como Mestre de Capoeira Angola especificamente.

Em 2 de fevereiro de 1991, Mestre Pintor fundou o Grupo Bantus Capoeira (GBC) em Belo Horizonte com o objetivo de fortalecer e transmitir as manifestações culturais brasileiras. O nome "Bantus" homenageia os povos Bantu da África—o sufixo "-ntu" significando "humano" e o prefixo "Ba-" indicando pluralidade, juntos significando "o povo". Este nome reconhece as raízes africanas da capoeira e da cultura brasileira.

Sob sua liderança, o Grupo Bantus expandiu muito além de Minas Gerais. Hoje a organização tem escolas em toda Belo Horizonte e no estado, bem como filiais internacionais no Japão, Austrália, Malásia, Singapura, Tailândia, Indonésia e Israel. Mestre Pintor viaja pelo mundo para compartilhar seu conhecimento, tendo ensinado pelo Brasil, América do Sul, Austrália, Ásia, Europa e Oriente Médio ao longo de seus mais de 40 anos de prática.

Além da capoeira, Mestre Pintor é reconhecido como especialista em Maculelê (a dança de luta com bastões), Samba de Roda (o samba tradicional em roda da Bahia), e Forró (dança de casal do nordeste brasileiro). O Grupo Bantus também incorpora Puxada de Rede (o ritual de puxar a rede dos pescadores) e conjuntos de percussão em sua programação cultural.

O grupo mantém projetos sociais ativos no Brasil, incluindo participação nos programas "Fica Vivo" e "Escola Integrada". A sede permanece em Belo Horizonte na Rua Rio Grande do Norte, 1501 - Funcionários.',
  -- achievements_en
  E'Founded Grupo Bantus Capoeira (1991), one of the major capoeira organizations based in Minas Gerais; Received Mestre title from João Pequeno de Pastinha (1989); Expanded GBC internationally with branches in 7+ countries across Asia-Pacific, Middle East, and South America; Expert in multiple Brazilian cultural arts: Maculelê, Samba de Roda, Forró, Puxada de Rede; 40+ years of capoeira practice and teaching; Active in social projects including Fica Vivo and Escola Integrada programs',
  -- achievements_pt
  E'Fundou o Grupo Bantus Capoeira (1991), uma das principais organizações de capoeira sediadas em Minas Gerais; Recebeu título de Mestre de João Pequeno de Pastinha (1989); Expandiu o GBC internacionalmente com filiais em 7+ países na Ásia-Pacífico, Oriente Médio e América do Sul; Especialista em múltiplas artes culturais brasileiras: Maculelê, Samba de Roda, Forró, Puxada de Rede; Mais de 40 anos de prática e ensino de capoeira; Ativo em projetos sociais incluindo os programas Fica Vivo e Escola Integrada',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1955, decade):
Sources state 40+ years of capoeira experience (as of ~2015-2020). If he started as a teenager (13-18) in the early 1970s, birth year is approximately 1955-1965. Graduated mestre in 1989, suggesting he was at least late 20s to early 30s. Using 1955 with decade precision.

NAME: Paulo César Leite dos Santos. The apelido "Pintor" (Painter) suggests a connection to painting or the profession—exact origin not documented in available sources.

TEACHERS:
- Mestre João Pequeno de Pastinha (primary teacher, Salvador)
- Mestre Atenilo (Bimba lineage)
- Mestre Waldemar (Angola, Liberdade)
- Mestre Canjiquinha (Angola)
- Mestre Curió (Pastinha lineage)
- Mestre Caiçara (Angola)
- Mestre Gigante/Bigodinho (Waldemar lineage)
- Mestre João Grande (Pastinha lineage)
- Mestre Boa Gente (Gato Preto lineage)
- Mestre Bom Cabrito (Cobrinha Verde/Gato Preto)
- Mestre Medicina (Regional)
- Mestre Papo de Santo Amaro

GRADUATION: 1989 - Mestre title from João Pequeno with Grupo Macaco at Escola de Educação Física, Belo Horizonte. Note: One source says "Grupo Ginga" instead of "Grupo Macaco" - likely transcription variation.

GROUP FOUNDING DATE DISCREPANCY:
- February 2, 1991 (Flickr bio, multiple sources)
- May 20, 1991 (Taylor''s University page)
Using February 2, 1991 as it appears in more official group descriptions.

HQ ADDRESS: Rua Rio Grande do Norte, 1501 - Funcionários - Belo Horizonte - MG - Brazil

INTERNATIONAL BRANCHES: Japan, Australia, Malaysia, Singapore, Thailand, Indonesia, Israel

SOCIAL PROJECTS: Fica Vivo, Escola Integrada',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1955, década):
Fontes afirmam mais de 40 anos de experiência em capoeira (por volta de 2015-2020). Se começou como adolescente (13-18) no início dos anos 1970, o ano de nascimento é aproximadamente 1955-1965. Graduou-se mestre em 1989, sugerindo que tinha pelo menos entre 28 e 33 anos. Usando 1955 com precisão de década.

NOME: Paulo César Leite dos Santos. O apelido "Pintor" sugere conexão com pintura ou a profissão—origem exata não documentada nas fontes disponíveis.

MESTRES:
- Mestre João Pequeno de Pastinha (mestre principal, Salvador)
- Mestre Atenilo (linhagem de Bimba)
- Mestre Waldemar (Angola, Liberdade)
- Mestre Canjiquinha (Angola)
- Mestre Curió (linhagem de Pastinha)
- Mestre Caiçara (Angola)
- Mestre Gigante/Bigodinho (linhagem de Waldemar)
- Mestre João Grande (linhagem de Pastinha)
- Mestre Boa Gente (linhagem de Gato Preto)
- Mestre Bom Cabrito (Cobrinha Verde/Gato Preto)
- Mestre Medicina (Regional)
- Mestre Papo de Santo Amaro

GRADUAÇÃO: 1989 - Título de Mestre de João Pequeno com Grupo Macaco na Escola de Educação Física, Belo Horizonte. Nota: Uma fonte diz "Grupo Ginga" ao invés de "Grupo Macaco" - provavelmente variação de transcrição.

DISCREPÂNCIA NA DATA DE FUNDAÇÃO DO GRUPO:
- 2 de fevereiro de 1991 (bio do Flickr, múltiplas fontes)
- 20 de maio de 1991 (página da Taylor''s University)
Usando 2 de fevereiro de 1991 pois aparece em descrições mais oficiais do grupo.

ENDEREÇO DA SEDE: Rua Rio Grande do Norte, 1501 - Funcionários - Belo Horizonte - MG - Brasil

FILIAIS INTERNACIONAIS: Japão, Austrália, Malásia, Singapura, Tailândia, Indonésia, Israel

PROJETOS SOCIAIS: Fica Vivo, Escola Integrada'
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
