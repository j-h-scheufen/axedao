-- ============================================================
-- GENEALOGY PERSON: Faísca
-- Generated: 2026-01-10
-- ============================================================
-- Designated successor of Mestre João Pequeno. Current leader
-- of CEDANZE Internacional and Academia João Pequeno de Pastinha
-- (CECA). Founded CEDANZE in 1989 (São Paulo) and formalized in
-- 2003 (Salvador). Represents Generation 2 from Pastinha in
-- direct lineage: Benedito → Pastinha → João Pequeno → Faísca.
-- ============================================================
-- BIRTH YEAR ESTIMATION (1965, decade precision):
-- Evidence: Started capoeira "as a teenager" in São José do Rio
-- Pardo, founded first group in Mococa, sought mentorship from
-- Izael Teixeira—all BEFORE meeting João Pequeno in 1991 at USP.
-- This timeline suggests he was at least in his mid-20s by 1991.
-- If ~25-30 years old in 1991: birth year ~1961-1966.
-- Estimate: 1965 with decade precision (1960s).
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
  'Luís Roberto Ricardo',
  'Faísca',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://ceca-riovermelho.org.br/mestres/mestre-faisca/?lang=en', 'https://ceca-riovermelho.org.br/cedanze/?lang=en']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of Mestre João Pequeno de Pastinha. Faísca has refined the pedagogy already present in the tradition to facilitate learning and greater social inclusion, based on respect for everyone''s individuality and different progression paces. His teaching emphasizes preserving Afro-Brazilian culture through Capoeira Angola as a vehicle for socio-educational transformation, maintaining fidelity to João Pequeno''s technique and the legacy of CECA while modernizing pedagogical methods.',
  E'Capoeira Angola pura na tradição de Mestre João Pequeno de Pastinha. Faísca refinou a pedagogia já presente na tradição para facilitar a aprendizagem e maior inclusão social, baseada no respeito à individualidade de cada um e aos diferentes ritmos de progressão. Seu ensino enfatiza a preservação da cultura afro-brasileira através da Capoeira Angola como veículo de transformação socioeducacional, mantendo fidelidade à técnica de João Pequeno e ao legado do CECA enquanto moderniza os métodos pedagógicos.',
  -- Life dates
  1965,
  'decade'::genealogy.date_precision,
  'São José do Rio Pardo, São Paulo, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Luís Roberto Ricardo was born in São José do Rio Pardo, in the interior of São Paulo state. His father was José Ricardo Filho; his mother, Maria Aparecida da Silva Ricardo, raised him and his seven siblings alone in humble circumstances. To support her children, Maria did laundry and cooked in families'' homes, sometimes working during the day in a hotel kitchen and at night in a restaurant.

It was as a teenager that Faísca first began practicing the movements of capoeira. This happened in São José do Rio Pardo with a local capoeirista named Luiz Carlos Viana, who later abandoned capoeira. But Faísca persevered. He started teaching capoeira in the town of Mococa, São Paulo, where he founded his first group. He later sought mentorship from Mestre Izael Teixeira in São Carlos, São Paulo, who accepted him—though Izael focused on Capoeira Regional de Mestre Bimba rather than Angola.

In 1991, at the University of São Paulo (USP), Faísca had his first lesson with Mestre João Pequeno de Pastinha. As he later said, João Pequeno was "the most important person in the world in capoeira" at that moment. This encounter changed everything.

In 1996, Faísca moved to Salvador to be close to his mestre. He soon integrated the Academia de João Pequeno de Pastinha – Centro Esportivo de Capoeira Angola, located in the 17th-century fortress Forte Santo Antônio Além do Carmo. That same year, he began teaching in the Vale das Pedrinhas community in Rio Vermelho—a peripheral neighborhood characterized by poverty, high crime rates, and the absence of state services.

On October 14, 2001, in an event at the Academia do Forte Santo Antônio Além do Carmo, Luís Roberto Ricardo received from Mestre João Pequeno the title of "mestre," which formally introduced him as Mestre Faísca to the capoeira community.

The Zebra Dance Cultural Center (CEDANZE) had been born in Brazil in 1989, in the cities of Mococa and São José do Rio Pardo, São Paulo. When it was officially registered in 2003 in Salvador, Bahia, Faísca constituted a Council of Honor with a lifetime position chaired by Dr. João Pereira dos Santos (Mestre João Pequeno de Pastinha), along with Dr. Ângelo Augusto Decânio Filho (Mestre Decânio) and the filmmaker and writer Mestre Jair Moura.

João Pequeno guided Faísca to "keep CECA alive and the name of his academy." When João Pequeno died on December 9, 2011, Faísca assumed leadership of the lineage as his designated successor, continuing the direct tradition from Mestre Africano Benedito through Pastinha and João Pequeno.

Today, CEDANZE Internacional – Academia João Pequeno de Pastinha – CECA operates from its headquarters at Rua Raimundo Viana, nº 61-E, in Rio Vermelho, Vale das Pedrinhas, Salvador. The organization has centers across Brazil (Poços de Caldas, Florianópolis, Maragogipe, São Francisco do Conde), Europe (Paris, Milan, Brussels, Coimbra, Madrid, Lausanne, Cuenca), and Latin America (Montevideo, Santiago). In 2012, Le Centre Culturel Danse du Zèbre was officially established in Paris under French law.

For over 30 years, Faísca''s work in Vale das Pedrinhas has focused on providing education and culture to young people from peripheral communities—using traditional Capoeira Angola as a vehicle for socio-educational transformation while preserving the Afro-Brazilian civilizing values contained in the tradition.',
  -- Extended content (bio_pt)
  E'Luís Roberto Ricardo nasceu em São José do Rio Pardo, no interior do estado de São Paulo. Seu pai era José Ricardo Filho; sua mãe, Maria Aparecida da Silva Ricardo, o criou junto com seus sete irmãos sozinha em circunstâncias humildes. Para sustentar seus filhos, Maria lavava roupa e cozinhava em casas de família, às vezes trabalhando durante o dia na cozinha de um hotel e à noite em um restaurante.

Foi ainda adolescente que Faísca começou a praticar os movimentos da capoeira. Isso aconteceu em São José do Rio Pardo com um capoeirista local chamado Luiz Carlos Viana, que depois abandonou a capoeira. Mas Faísca perseverou. Começou a ensinar capoeira na cidade de Mococa, São Paulo, onde fundou seu primeiro grupo. Depois buscou a orientação de Mestre Izael Teixeira em São Carlos, São Paulo, que o aceitou—embora Izael focasse na Capoeira Regional de Mestre Bimba e não na Angola.

Em 1991, na Universidade de São Paulo (USP), Faísca teve sua primeira aula com Mestre João Pequeno de Pastinha. Como ele disse depois, João Pequeno era "a pessoa mais importante do mundo na capoeira" naquele momento. Este encontro mudou tudo.

Em 1996, Faísca mudou-se para Salvador para ficar perto de seu mestre. Logo integrou a Academia de João Pequeno de Pastinha – Centro Esportivo de Capoeira Angola, localizada na fortaleza do século XVII Forte Santo Antônio Além do Carmo. No mesmo ano, começou a ensinar na comunidade de Vale das Pedrinhas no Rio Vermelho—um bairro periférico caracterizado por pobreza, altas taxas de criminalidade e ausência de serviços do Estado.

Em 14 de outubro de 2001, em um evento na Academia do Forte Santo Antônio Além do Carmo, Luís Roberto Ricardo recebeu de Mestre João Pequeno o título de "mestre", que o apresentou formalmente como Mestre Faísca à comunidade da capoeira.

O Centro Cultural Dança do Zebra (CEDANZE) havia nascido no Brasil em 1989, nas cidades de Mococa e São José do Rio Pardo, São Paulo. Quando foi oficialmente registrado em 2003 em Salvador, Bahia, Faísca constituiu um Conselho de Honra com cargo vitalício presidido pelo Dr. João Pereira dos Santos (Mestre João Pequeno de Pastinha), junto com o Dr. Ângelo Augusto Decânio Filho (Mestre Decânio) e o cineasta e escritor Mestre Jair Moura.

João Pequeno orientou Faísca a "manter o CECA vivo e o nome de sua academia". Quando João Pequeno morreu em 9 de dezembro de 2011, Faísca assumiu a liderança da linhagem como seu sucessor designado, continuando a tradição direta de Mestre Africano Benedito através de Pastinha e João Pequeno.

Hoje, CEDANZE Internacional – Academia João Pequeno de Pastinha – CECA opera a partir de sua sede na Rua Raimundo Viana, nº 61-E, no Rio Vermelho, Vale das Pedrinhas, Salvador. A organização tem centros no Brasil (Poços de Caldas, Florianópolis, Maragogipe, São Francisco do Conde), Europa (Paris, Milão, Bruxelas, Coimbra, Madri, Lausanne, Cuenca) e América Latina (Montevidéu, Santiago). Em 2012, Le Centre Culturel Danse du Zèbre foi oficialmente estabelecido em Paris sob a lei francesa.

Por mais de 30 anos, o trabalho de Faísca no Vale das Pedrinhas tem focado em fornecer educação e cultura para jovens de comunidades periféricas—usando a Capoeira Angola tradicional como veículo de transformação socioeducacional enquanto preserva os valores civilizatórios afro-brasileiros contidos na tradição.',
  -- Achievements
  E'- Designated successor of Mestre João Pequeno de Pastinha (from 2011)
- Current General Coordinator of CEDANZE Internacional – Academia João Pequeno de Pastinha – CECA
- Received mestre title from João Pequeno (October 14, 2001)
- Founded CEDANZE in 1989 (Mococa/São José do Rio Pardo, São Paulo)
- Officially registered CEDANZE in Salvador, Bahia (2003)
- Established CEDANZE Council of Honor with João Pequeno as Chair (2003)
- Expanded CEDANZE internationally to 15+ locations across Brazil, Europe, and Latin America
- Established Le Centre Culturel Danse du Zèbre in Paris (2012)
- 30+ years of community social work in Vale das Pedrinhas, Salvador
- Refined pedagogical methods for inclusive capoeira education',
  E'- Sucessor designado de Mestre João Pequeno de Pastinha (desde 2011)
- Atual Coordenador Geral do CEDANZE Internacional – Academia João Pequeno de Pastinha – CECA
- Recebeu título de mestre de João Pequeno (14 de outubro de 2001)
- Fundou o CEDANZE em 1989 (Mococa/São José do Rio Pardo, São Paulo)
- Registrou oficialmente o CEDANZE em Salvador, Bahia (2003)
- Estabeleceu o Conselho de Honra do CEDANZE com João Pequeno como Presidente (2003)
- Expandiu o CEDANZE internacionalmente para mais de 15 locais no Brasil, Europa e América Latina
- Estabeleceu Le Centre Culturel Danse du Zèbre em Paris (2012)
- Mais de 30 anos de trabalho social comunitário no Vale das Pedrinhas, Salvador
- Refinou métodos pedagógicos para educação inclusiva da capoeira',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1965, decade precision):
Sources describe him as starting capoeira "as a teenager" in São José do Rio Pardo, then founding his first group in Mococa AND seeking mentorship from Mestre Izael Teixeira—all before meeting João Pequeno in 1991 at USP. This timeline suggests he was at least in his mid-20s by 1991 (had already completed teenage training, founded a group, sought advanced mentorship). If approximately 25-30 years old in 1991, birth year would be approximately 1961-1966. Estimate: 1965 with decade precision (1960s).

LINEAGE:
Direct lineage: Mestre Africano Benedito → Mestre Pastinha → Mestre João Pequeno → Mestre Faísca
This represents Generation 2 from Pastinha and Generation 3 from the African-born Mestre Benedito.

TIMELINE:
- Teenage years: First capoeira training with Luiz Carlos Viana in São José do Rio Pardo
- Pre-1991: Founded first group in Mococa, São Paulo
- Pre-1991: Sought mentorship from Mestre Izael Teixeira in São Carlos (Regional style)
- 1989: CEDANZE born in Mococa and São José do Rio Pardo
- 1991: First lesson with Mestre João Pequeno at USP
- 1996: Moved to Salvador; integrated into Academia João Pequeno de Pastinha at Forte Santo Antônio
- 1996: Began teaching in Vale das Pedrinhas community
- October 14, 2001: Received mestre title from João Pequeno at Forte Santo Antônio
- 2003: CEDANZE officially registered in Salvador (CNPJ 06.109.443/0001-00)
- 2003: Council of Honor constituted with João Pequeno (Chair), Decânio, Jair Moura
- 2011 (December 9): João Pequeno died; Faísca assumed leadership
- 2012: CEDANZE Paris (Le Centre Culturel Danse du Zèbre) officially established

EDUCATORS AT CEDANZE/CECA:
- Professor Egbó (José Carlos) - Salvador HQ operations
- Professor Sônia (Sônia Sueli) - Salvador HQ, history graduate
- Professor Junta de Cotovelo (Bruno Amaral) - São Francisco do Conde
- Professor Kayode (Kayode Akintúnde) - Salvador HQ
- Professor Kehinde (Kehinde Ayodeji) - Salvador HQ
- Professor Xexéu (Evandro Félis) - São José do Rio Pardo (inactive)
- Instructor Javier de La Hoz - Cuenca, Spain
- Instructor Beatriz Franco Mielgo - Paris, France
- Instructor Michael François - Lausanne (inactive)

APELIDO MEANING:
"Faísca" means "spark" in Portuguese. The origin of his apelido is not documented in sources.

EARLY TEACHER LUIZ CARLOS VIANA:
The capoeirista who first taught Faísca in São José do Rio Pardo "later abandoned capoeira" - no further information available about this person; not considered significant for genealogy import.',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1965, precisão de década):
Fontes descrevem que começou capoeira "ainda adolescente" em São José do Rio Pardo, depois fundou seu primeiro grupo em Mococa E buscou orientação de Mestre Izael Teixeira—tudo antes de conhecer João Pequeno em 1991 na USP. Esta cronologia sugere que tinha pelo menos 25 anos em 1991 (já havia completado treinamento adolescente, fundado um grupo, buscado orientação avançada). Se tinha aproximadamente 25-30 anos em 1991, o ano de nascimento seria aproximadamente 1961-1966. Estimativa: 1965 com precisão de década (anos 1960).

LINHAGEM:
Linhagem direta: Mestre Africano Benedito → Mestre Pastinha → Mestre João Pequeno → Mestre Faísca
Isso representa Geração 2 a partir de Pastinha e Geração 3 a partir do Mestre Benedito nascido na África.

CRONOLOGIA:
- Adolescência: Primeiro treinamento de capoeira com Luiz Carlos Viana em São José do Rio Pardo
- Antes de 1991: Fundou primeiro grupo em Mococa, São Paulo
- Antes de 1991: Buscou orientação de Mestre Izael Teixeira em São Carlos (estilo Regional)
- 1989: CEDANZE nasce em Mococa e São José do Rio Pardo
- 1991: Primeira aula com Mestre João Pequeno na USP
- 1996: Mudou-se para Salvador; integrou Academia João Pequeno de Pastinha no Forte Santo Antônio
- 1996: Começou a ensinar na comunidade de Vale das Pedrinhas
- 14 de outubro de 2001: Recebeu título de mestre de João Pequeno no Forte Santo Antônio
- 2003: CEDANZE oficialmente registrado em Salvador (CNPJ 06.109.443/0001-00)
- 2003: Conselho de Honra constituído com João Pequeno (Presidente), Decânio, Jair Moura
- 2011 (9 de dezembro): João Pequeno faleceu; Faísca assumiu liderança
- 2012: CEDANZE Paris (Le Centre Culturel Danse du Zèbre) oficialmente estabelecido

EDUCADORES NO CEDANZE/CECA:
- Professor Egbó (José Carlos) - operações sede Salvador
- Professora Sônia (Sônia Sueli) - sede Salvador, formada em história
- Professor Junta de Cotovelo (Bruno Amaral) - São Francisco do Conde
- Professor Kayode (Kayode Akintúnde) - sede Salvador
- Professor Kehinde (Kehinde Ayodeji) - sede Salvador
- Professor Xexéu (Evandro Félis) - São José do Rio Pardo (inativo)
- Instrutor Javier de La Hoz - Cuenca, Espanha
- Instrutora Beatriz Franco Mielgo - Paris, França
- Instrutor Michael François - Lausanne (inativo)

SIGNIFICADO DO APELIDO:
"Faísca" significa "centelha" ou "fagulha" em português. A origem de seu apelido não é documentada nas fontes.

PRIMEIRO PROFESSOR LUIZ CARLOS VIANA:
O capoeirista que primeiro ensinou Faísca em São José do Rio Pardo "depois abandonou a capoeira" - nenhuma informação adicional disponível sobre esta pessoa; não considerado significativo para importação genealógica.'
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
