-- ============================================================
-- GENEALOGY PERSON: Angolinha
-- Generated: 2026-01-10
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1950s, decade):
-- Angolinha joined the Roda de Caxias "at the end of the 1970s" per multiple
-- sources. If he was already an experienced capoeirista by then, he was likely
-- born in the 1950s. He trained as a child with his father Severino and then
-- with Mestre Índio before meeting Moraes in the 1970s. Estimating ~1955
-- with decade precision as exact year is undocumented.
-- ============================================================
-- DEPENDENCIES: Mestre Moraes (exists), Cobra Mansa (exists), Marrom (exists)
-- ============================================================
-- NAME DISCREPANCY:
-- - "Isak Ignácio" - Escola Cajueiro de Capoeira Angola, Aprender com Capoeira
-- - "Isaac da Silva" - Clinica de Capoeira CEPEUSP, Oficina Mestre Russo
-- - "Isaac Inácio da Silva" - Angola Rio
-- Using "Isak Ignácio da Silva" as composite of most reliable sources.
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
  'Isak Ignácio da Silva',
  'Angolinha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://aprendercomcapoeira.wordpress.com/fotos/oficina-de-capoeira-com-mestre-angolinha-rj/',
    'https://capoeiragem.ee/english',
    'https://lurdinha.org/site/roda-livre-de-caxias-40-anos-de-capoeira-cultura-e-historia/',
    'https://angolario.wordpress.com/grupos/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Mestre Angolinha transmits the art of life through the practice and experience of Capoeira Angola. His teaching goes beyond physical movement—he embodies a transformative and provocative approach in search of the essence of life, viewing the world through a liberating perspective and placing his art in service of this vision. Through constant metaphors and popular sayings, he passes on his teachings and wisdom. His philosophy emphasizes capoeira as a tool for liberation and self-discovery.',
  E'Mestre Angolinha transmite a arte da vida através da prática e experiência da Capoeira Angola. Seu ensino vai além do movimento físico—ele encarna uma abordagem transformadora e provocativa em busca da essência da vida, olhando o mundo através de sua perspectiva libertadora e colocando sua arte a serviço dessa visão. Através de metáforas constantes e ditos populares, ele transmite seus ensinamentos e sabedoria. Sua filosofia enfatiza a capoeira como ferramenta de libertação e autodescoberta.',
  -- Life dates
  1955,
  'decade'::genealogy.date_precision,
  'Duque de Caxias, Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Isak Ignácio da Silva, known as Mestre Angolinha, was born in Duque de Caxias, a municipality in the Baixada Fluminense region of Greater Rio de Janeiro. His initiation into capoeira began in childhood, learning from his father Severino—establishing a direct family transmission of the art. After this foundational training, he continued studying under the late Mestre Índio.

In the 1970s, Angolinha''s trajectory took a decisive turn when he met Mestre Moraes. This encounter led him to participate in the founding era of the Grupo de Capoeira Angola Pelourinho (GCAP), the organization that would become central to the revitalization of Capoeira Angola in Brazil. Moraes had moved to Rio de Janeiro in 1970 with the Brazilian military and was teaching Capoeira Angola outside of Bahia for the first time—establishing the first school of the style in Rio and forming mestres including Braga, Neco, and Zé Carlos. Angolinha became part of this seminal movement that helped rescue Capoeira Angola from the decline it faced after Mestre Pastinha''s death in 1981.

At the end of the 1970s, Angolinha joined the Roda de Caxias, the legendary street roda founded on June 13, 1973 during the feast of Santo Antônio. The roda had been established by Mestres Russo and Peixe (then young practitioners trained by Mestres Barbosa and Josias) during the height of Brazil''s military dictatorship—a bold act of cultural resistance when practicing capoeira in the street without academy affiliation was considered dangerous. Together with Mestres Russo and Peixe, Angolinha became one of the principal guardians of this institution, which continues to this day as the oldest street roda in Rio de Janeiro state. In 2016, municipal decree 6736 declared the Roda Livre de Caxias as Intangible Cultural Heritage of Duque de Caxias—one of the first entries in the city''s heritage registry.

In the 1990s, Angolinha taught from a sobrado (two-story building) on Rua Henrique Ferreira Gomes in Caxias, affiliated with GCAP. His teaching during this period produced notable mestres including Manoel (founder of Ypiranga de Pastinha in the Maré favela) and Bába. Mestre Manoel would go on to establish one of Rio''s most important community capoeira programs, training over 400 students across 35 years with a pedagogical approach emphasizing "critical, political consciousness" and Afro-Brazilian identity.

Beyond his direct students, Angolinha serves as the padrinho (godfather) of Mestre Marrom''s group in Rio de Janeiro (now known as Ngoma Capoeira Angola) and Mestre Siri''s group in Finland. Mestre Marrom, who transitioned from Capoeira Regional to Angola in the 1990s, has cited Angolinha as his key reference point in this journey toward the traditional roots of the art.

Since 1998, Angolinha has conducted workshops abroad annually, visiting cities across the United States (Boston, New York, San Francisco, Chicago, Los Angeles, Washington DC, Atlanta, Miami), Canada (Toronto, Montreal), Texas, and Europe (Germany, France, Holland, Finland, England). His international teaching has made him one of the principal ambassadors of Rio de Janeiro''s Capoeira Angola tradition.

For over eleven years, he has maintained headquarters at UFRJ (Federal University of Rio de Janeiro), operated a núcleo (training center) in Rio''s South Zone at Glória (alongside Contra-Mestre Japa), and taught in quilombola communities of Paraty and Angra dos Reis. The Grupo de Capoeira Angolinha organizes a monthly roda—the "Roda da Casa da Glória"—on the third Saturday of each month at Ladeira da Glória 98.

Mestre Angolinha''s teaching philosophy transcends physical technique. Through constant use of metaphors and popular sayings, he transmits wisdom that views capoeira as a path to liberation and self-discovery. As one of the living guardians of Rio''s Capoeira Angola tradition, he represents a direct link to the revival movement of the 1980s and continues to inspire practitioners worldwide.',
  -- Extended content (bio_pt)
  E'Isak Ignácio da Silva, conhecido como Mestre Angolinha, nasceu em Duque de Caxias, município da região da Baixada Fluminense na Grande Rio de Janeiro. Sua iniciação na capoeira começou na infância, aprendendo com seu pai Severino—estabelecendo uma transmissão familiar direta da arte. Após essa formação inicial, continuou estudando com o falecido Mestre Índio.

Nos anos 1970, a trajetória de Angolinha tomou um rumo decisivo quando ele conheceu Mestre Moraes. Este encontro o levou a participar da era fundacional do Grupo de Capoeira Angola Pelourinho (GCAP), a organização que se tornaria central para a revitalização da Capoeira Angola no Brasil. Moraes havia se mudado para o Rio de Janeiro em 1970 com a Marinha do Brasil e estava ensinando Capoeira Angola fora da Bahia pela primeira vez—estabelecendo a primeira escola do estilo no Rio e formando mestres incluindo Braga, Neco e Zé Carlos. Angolinha tornou-se parte deste movimento seminal que ajudou a resgatar a Capoeira Angola do declínio que enfrentava após a morte de Mestre Pastinha em 1981.

No final dos anos 1970, Angolinha juntou-se à Roda de Caxias, a lendária roda de rua fundada em 13 de junho de 1973 durante a festa de Santo Antônio. A roda havia sido estabelecida pelos Mestres Russo e Peixe (então jovens praticantes treinados pelos Mestres Barbosa e Josias) durante o auge da ditadura militar brasileira—um ato ousado de resistência cultural quando praticar capoeira na rua sem afiliação a academia era considerado perigoso. Junto com os Mestres Russo e Peixe, Angolinha tornou-se um dos principais guardiões desta instituição, que continua até hoje como a roda de rua mais antiga do estado do Rio de Janeiro. Em 2016, o decreto municipal 6736 declarou a Roda Livre de Caxias como Patrimônio Cultural Imaterial de Duque de Caxias—uma das primeiras inscrições no registro patrimonial da cidade.

Nos anos 1990, Angolinha ensinava em um sobrado na Rua Henrique Ferreira Gomes em Caxias, afiliado ao GCAP. Seu ensino durante este período produziu mestres notáveis incluindo Manoel (fundador do Ypiranga de Pastinha na favela da Maré) e Bába. Mestre Manoel fundaria um dos mais importantes programas comunitários de capoeira do Rio, treinando mais de 400 alunos ao longo de 35 anos com uma abordagem pedagógica enfatizando "consciência crítica, política" e identidade afro-brasileira.

Além de seus alunos diretos, Angolinha serve como padrinho do grupo de Mestre Marrom no Rio de Janeiro (hoje conhecido como Ngoma Capoeira Angola) e do grupo de Mestre Siri na Finlândia. Mestre Marrom, que fez a transição da Capoeira Regional para Angola nos anos 1990, citou Angolinha como sua referência-chave nesta jornada rumo às raízes tradicionais da arte.

Desde 1998, Angolinha ministra oficinas no exterior anualmente, visitando cidades nos Estados Unidos (Boston, Nova York, San Francisco, Chicago, Los Angeles, Washington DC, Atlanta, Miami), Canadá (Toronto, Montreal), Texas, e Europa (Alemanha, França, Holanda, Finlândia, Inglaterra). Seu ensino internacional o tornou um dos principais embaixadores da tradição de Capoeira Angola do Rio de Janeiro.

Por mais de onze anos, ele mantém sede na UFRJ (Universidade Federal do Rio de Janeiro), opera um núcleo na Zona Sul do Rio na Glória (junto com Contra-Mestre Japa), e ensina em comunidades quilombolas de Paraty e Angra dos Reis. O Grupo de Capoeira Angolinha organiza uma roda mensal—a "Roda da Casa da Glória"—no terceiro sábado de cada mês na Ladeira da Glória 98.

A filosofia de ensino de Mestre Angolinha transcende a técnica física. Através do uso constante de metáforas e ditos populares, ele transmite sabedoria que vê a capoeira como um caminho para libertação e autodescoberta. Como um dos guardiões vivos da tradição de Capoeira Angola do Rio, ele representa uma ligação direta com o movimento de renascimento dos anos 1980 e continua inspirando praticantes em todo o mundo.',
  -- Achievements
  E'- Principal guardian of Roda Livre de Caxias alongside Mestres Russo and Peixe (since late 1970s)
- Participant in founding era of GCAP (Grupo de Capoeira Angola Pelourinho)
- Trained Mestre Manoel (founder of Ypiranga de Pastinha, Maré favela)
- Trained Mestre Bába (Rio de Janeiro)
- Godfather (padrinho) of Mestre Marrom''s group Ngoma Capoeira Angola
- Godfather (padrinho) of Mestre Siri''s group in Finland
- Teaching at UFRJ for over 11 years
- International workshops since 1998 across USA, Canada, and Europe
- Work with quilombola communities in Paraty and Angra dos Reis
- Key reference for Mestre Marrom''s transition to Capoeira Angola (1990s)',
  E'- Principal guardião da Roda Livre de Caxias junto com Mestres Russo e Peixe (desde final dos anos 1970)
- Participante da era fundacional do GCAP (Grupo de Capoeira Angola Pelourinho)
- Formou Mestre Manoel (fundador do Ypiranga de Pastinha, favela da Maré)
- Formou Mestre Bába (Rio de Janeiro)
- Padrinho do grupo de Mestre Marrom Ngoma Capoeira Angola
- Padrinho do grupo de Mestre Siri na Finlândia
- Ensinando na UFRJ há mais de 11 anos
- Oficinas internacionais desde 1998 nos EUA, Canadá e Europa
- Trabalho com comunidades quilombolas em Paraty e Angra dos Reis
- Referência-chave para a transição de Mestre Marrom para Capoeira Angola (anos 1990)',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (~1955, decade):
Joined Roda de Caxias "at the end of the 1970s" per multiple sources. Trained as child with father Severino, then with Mestre Índio, then met Moraes in 1970s. If he was already an adult capoeirista by late 1970s, birth ~1950s is reasonable. Using 1955 as midpoint estimate with decade precision.

NAME DISCREPANCY:
- "Isak Ignácio" - Escola Cajueiro (Estonia), Aprender com Capoeira (MAJORITY)
- "Isaac da Silva" - Clinica de Capoeira CEPEUSP
- "Isaac Inácio da Silva" - Angola Rio WordPress
Using composite "Isak Ignácio da Silva" preserving Portuguese accent from majority sources.

TEACHERS:
- Father Severino - childhood introduction (family transmission)
- Mestre Índio (deceased) - continued training, Rio area
- Mestre Moraes - met in 1970s, participated in GCAP founding era

STUDENTS (direct):
- Mestre Manoel (Ypiranga de Pastinha, Maré) - began 1990s in Caxias
- Mestre Bába (Rio de Janeiro) - began 1990s in Caxias
- CM Dirceu trained under Manoel (second generation)

STUDENTS (godfather/padrinho relationship):
- Mestre Marrom''s group (Ngoma Capoeira Angola, Rio)
- Mestre Siri''s group (Finland)

TEACHING LOCATIONS:
- 1990s: Sobrado on Rua Henrique Ferreira Gomes, Caxias (GCAP affiliated)
- Current: UFRJ headquarters (11+ years)
- Current: Núcleo Zona Sul, Glória (with CM Japa)
- Current: Quilombola communities, Paraty and Angra dos Reis

CONTACT: Tel 9565-5586 (per Angola Rio)

RODA LOCATIONS:
- Roda Livre de Caxias: Praça do Pacificador, Centro de Caxias, Sundays 5pm
- Roda da Casa da Glória: Ladeira da Glória 98, third Saturday monthly, 7pm

NOTE ON "ANGOLINHA" TOQUE: There is a berimbau rhythm called "Toque de Angolinha" associated with Mestre Waldemar da Paixão (1940s Salvador), unrelated to this person. The toque predates Mestre Angolinha of Caxias.

INTERNATIONAL WORKSHOPS (since 1998):
USA: Boston, New York, San Francisco, Chicago, Los Angeles, Washington DC, Atlanta, Miami
Canada: Toronto, Montreal
Europe: Germany, France, Holland/Netherlands, Finland, England
Also mentioned: Texas (separate from other US cities in source)',
  -- Researcher notes (notes_pt)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1955, década):
Juntou-se à Roda de Caxias "no final dos anos 1970" conforme múltiplas fontes. Treinou quando criança com pai Severino, depois com Mestre Índio, depois conheceu Moraes nos anos 1970. Se já era capoeirista adulto no final dos anos 1970, nascimento ~anos 1950 é razoável. Usando 1955 como estimativa de ponto médio com precisão de década.

DISCREPÂNCIA DE NOME:
- "Isak Ignácio" - Escola Cajueiro (Estônia), Aprender com Capoeira (MAIORIA)
- "Isaac da Silva" - Clínica de Capoeira CEPEUSP
- "Isaac Inácio da Silva" - Angola Rio WordPress
Usando composto "Isak Ignácio da Silva" preservando acento português das fontes majoritárias.

MESTRES:
- Pai Severino - introdução na infância (transmissão familiar)
- Mestre Índio (falecido) - continuou treino, área do Rio
- Mestre Moraes - conheceu nos anos 1970, participou da era fundacional do GCAP

ALUNOS (diretos):
- Mestre Manoel (Ypiranga de Pastinha, Maré) - começou anos 1990 em Caxias
- Mestre Bába (Rio de Janeiro) - começou anos 1990 em Caxias
- CM Dirceu treinou sob Manoel (segunda geração)

ALUNOS (relação padrinho):
- Grupo de Mestre Marrom (Ngoma Capoeira Angola, Rio)
- Grupo de Mestre Siri (Finlândia)

LOCAIS DE ENSINO:
- Anos 1990: Sobrado na Rua Henrique Ferreira Gomes, Caxias (afiliado ao GCAP)
- Atual: Sede na UFRJ (11+ anos)
- Atual: Núcleo Zona Sul, Glória (com CM Japa)
- Atual: Comunidades quilombolas, Paraty e Angra dos Reis

CONTATO: Tel 9565-5586 (per Angola Rio)

LOCAIS DE RODA:
- Roda Livre de Caxias: Praça do Pacificador, Centro de Caxias, Domingos às 17h
- Roda da Casa da Glória: Ladeira da Glória 98, terceiro sábado do mês, às 19h

NOTA SOBRE TOQUE "ANGOLINHA": Existe um ritmo de berimbau chamado "Toque de Angolinha" associado a Mestre Waldemar da Paixão (anos 1940 em Salvador), não relacionado a esta pessoa. O toque é anterior a Mestre Angolinha de Caxias.

OFICINAS INTERNACIONAIS (desde 1998):
EUA: Boston, Nova York, San Francisco, Chicago, Los Angeles, Washington DC, Atlanta, Miami
Canadá: Toronto, Montreal
Europa: Alemanha, França, Holanda, Finlândia, Inglaterra
Também mencionado: Texas (separado das outras cidades dos EUA na fonte)'
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
