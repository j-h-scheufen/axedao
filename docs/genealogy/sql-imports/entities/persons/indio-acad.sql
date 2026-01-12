-- ============================================================
-- GENEALOGY PERSON: Índio (ACAD)
-- Generated: 2026-01-11
-- ============================================================
-- Carlos Roberto Gallo, co-founder of ACAD (1992) with Mestre Rogério.
-- Born 1963 in Várzea da Palma, Minas Gerais. Titled mestre by Rogério
-- in 2004. Currently lives in Italy (Cesena). Distinguished from
-- Mestre Índio do Mercado Modelo (Manoel Olímpio de Souza, b. 1950).
--
-- IMPORTANT: Uses apelido_context = 'ACAD' to distinguish from
-- Índio (Mercado Modelo) who has apelido_context = 'Mercado Modelo'.
--
-- Humanitarian work: First Brazilian instructor at Azraq refugee
-- camp, Jordan (2015) with Bidna Capoeira NGO.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  'Carlos Roberto Gallo',
  'Índio',
  'ACAD',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://casadobrada.wordpress.com/associacao-de-capoeira-angola-dobrada-en/', 'https://www.lalaue.com/capoeira-schools/associacao-de-capoeira-angola-dobrada/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira Angola practitioner in the lineage of Moraes and Cobra Mansa through Mestre Rogério. Emphasizes preservation of Angola traditions and rituals. Has adapted teaching methods for humanitarian contexts, including transliterating songs into Arabic for refugee children.',
  E'Praticante tradicional de Capoeira Angola na linhagem de Moraes e Cobra Mansa através de Mestre Rogério. Enfatiza a preservação das tradições e rituais da Angola. Adaptou métodos de ensino para contextos humanitários, incluindo transliteração de canções para o árabe para crianças refugiadas.',
  -- Life dates
  1963,
  'exact'::genealogy.date_precision,
  'Várzea da Palma, Minas Gerais, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Carlos Roberto Gallo was born in 1963 in Várzea da Palma, a municipality in the northern region of Minas Gerais near Pirapora, Brazil. He began practicing capoeira at age twelve, around the same time he left his hometown and moved to Belo Horizonte.

At fourteen, Índio left home and began working as an artisan while traveling through various Brazilian cities. By sixteen, he had crossed his first international border into Bolivia. At twenty-one, around 1984, he moved to Europe and began his life as a traveling capoeirista. Over the following twenty-five years, he lived and worked across Germany, Switzerland, the Netherlands, Sweden, and Italy, and traveled as far as India and Nepal.

During his time in Belo Horizonte in the mid-1980s, Índio encountered the nascent Capoeira Angola community in Minas Gerais. He began training and eventually developed a relationship with Rogério Soares Peixoto, who had founded the first Capoeira Angola school in Belo Horizonte after receiving his mestre title from Moraes (GCAP) and Cobra Mansa (FICA) in 1989.

In May 1990, Índio invited Mestre Rogério to travel to Germany. This invitation proved transformative for both men and for Capoeira Angola in Europe. Rogério accepted and settled in Kassel, where the two would establish a formal organization two years later.

In 1992, Índio and Rogério co-founded the Associação de Capoeira Angola Dobrada (ACAD) in Kassel, Germany. The organization''s name references the "Angola Dobrada" berimbau toque, a doubled variation of the traditional Angola rhythm. ACAD became one of the first Capoeira Angola organizations established on European soil, and its mission is "to cultivate, spread and maintain the art and rituals of Capoeira Angola in accordance with the tradition"—without distorting its essence.

In 2004, twelve years after co-founding ACAD, Índio received his mestre title from Rogério. This titling confirmed the lineage continuation from Moraes and Cobra Mansa through Rogério to Índio.

Today, ACAD has expanded to include locations across three countries: Germany (Frankfurt, Freiburg, Hamburg, Karlsruhe, Kassel), Italy (Bologna, Cesena), and Brazil (Belo Horizonte, São Gonçalo do Rio das Pedras, Curitiba). Mestre Índio currently lives in Italy, where he leads the ACAD nuclei in Bologna and Cesena alongside Contramestra Alcione.

Beyond his capoeira teaching, Índio has applied his practice to humanitarian work. In 2015, at age 52, he became the first Brazilian capoeira instructor at the Azraq refugee camp in Jordan, volunteering with the British NGO Bidna Capoeira. The organization, founded in Syria in 2007, uses capoeira as a tool for psychosocial development with children and youth in conflict zones.

At Azraq, Índio taught three classes daily to Syrian refugee children, adapting his methods for the context. He transliterated capoeira songs from Portuguese into Arabic and incorporated phrases relevant to the refugees'' experience, such as "I''m going back to Syria, because that''s my place." He worked alongside Italian capoeirista Chiara Monzali.

Índio''s philosophy reflects capoeira''s universality. As he told Estado de Minas: "Capoeira não tem cor, não tem raça" (Capoeira has no color, has no race), noting that Mestre Pastinha himself exemplified this through his mixed heritage.

After returning from his humanitarian work, Índio settled in São Gonçalo do Rio das Pedras, a small colonial-era village in the Serro district of central Minas Gerais. There he works with alchemy and herbalism, teaches courses, and provides community services. He has a daughter, born around 2001.

The lineage from Pastinha through Moraes and Cobra Mansa to Rogério and now through Índio represents an important transmission of Capoeira Angola tradition from Bahia to Europe and back to Brazil.',
  -- Extended content (bio_pt)
  E'Carlos Roberto Gallo nasceu em 1963 em Várzea da Palma, município na região norte de Minas Gerais, próximo a Pirapora, Brasil. Começou a praticar capoeira aos doze anos, aproximadamente na mesma época em que deixou sua cidade natal e mudou-se para Belo Horizonte.

Aos catorze anos, Índio saiu de casa e começou a trabalhar como artesão enquanto viajava por várias cidades brasileiras. Aos dezesseis, cruzou sua primeira fronteira internacional rumo à Bolívia. Aos vinte e um anos, por volta de 1984, mudou-se para a Europa e iniciou sua vida como capoeirista viajante. Nos vinte e cinco anos seguintes, viveu e trabalhou na Alemanha, Suíça, Holanda, Suécia e Itália, e viajou até a Índia e o Nepal.

Durante seu tempo em Belo Horizonte em meados dos anos 1980, Índio encontrou a nascente comunidade de Capoeira Angola em Minas Gerais. Começou a treinar e eventualmente desenvolveu uma relação com Rogério Soares Peixoto, que havia fundado a primeira escola de Capoeira Angola em Belo Horizonte após receber seu título de mestre de Moraes (GCAP) e Cobra Mansa (FICA) em 1989.

Em maio de 1990, Índio convidou Mestre Rogério para viajar à Alemanha. Este convite provou ser transformador para ambos os homens e para a Capoeira Angola na Europa. Rogério aceitou e estabeleceu-se em Kassel, onde os dois fundariam uma organização formal dois anos depois.

Em 1992, Índio e Rogério co-fundaram a Associação de Capoeira Angola Dobrada (ACAD) em Kassel, Alemanha. O nome da organização faz referência ao toque de berimbau "Angola Dobrada", uma variação dobrada do ritmo tradicional da Angola. A ACAD tornou-se uma das primeiras organizações de Capoeira Angola estabelecidas em solo europeu, e sua missão é "cultivar, difundir e manter viva a arte e os rituais da Capoeira Angola de acordo com a tradição"—sem deformar sua essência.

Em 2004, doze anos após co-fundar a ACAD, Índio recebeu seu título de mestre de Rogério. Esta titulação confirmou a continuação da linhagem de Moraes e Cobra Mansa através de Rogério até Índio.

Hoje, a ACAD expandiu-se para incluir locais em três países: Alemanha (Frankfurt, Freiburg, Hamburgo, Karlsruhe, Kassel), Itália (Bolonha, Cesena) e Brasil (Belo Horizonte, São Gonçalo do Rio das Pedras, Curitiba). Mestre Índio atualmente vive na Itália, onde lidera os núcleos da ACAD em Bolonha e Cesena junto com a Contramestra Alcione.

Além de seu ensino de capoeira, Índio aplicou sua prática ao trabalho humanitário. Em 2015, aos 52 anos, tornou-se o primeiro instrutor brasileiro de capoeira no campo de refugiados de Azraq, na Jordânia, como voluntário da ONG britânica Bidna Capoeira. A organização, fundada na Síria em 2007, usa a capoeira como ferramenta para desenvolvimento psicossocial com crianças e jovens em zonas de conflito.

Em Azraq, Índio ministrava três aulas diárias para crianças refugiadas sírias, adaptando seus métodos ao contexto. Transliterava canções de capoeira do português para o árabe e incorporava frases relevantes à experiência dos refugiados, como "Estou voltando para a Síria, porque lá é meu lugar." Trabalhou ao lado da capoeirista italiana Chiara Monzali.

A filosofia de Índio reflete a universalidade da capoeira. Como disse ao Estado de Minas: "Capoeira não tem cor, não tem raça", observando que o próprio Mestre Pastinha exemplificou isso através de sua herança mista.

Após retornar de seu trabalho humanitário, Índio estabeleceu-se em São Gonçalo do Rio das Pedras, um pequeno vilarejo da era colonial no distrito de Serro, no centro de Minas Gerais. Lá trabalha com alquimia e herbalismo, ministra cursos e presta serviços comunitários. Tem uma filha, nascida por volta de 2001.

A linhagem de Pastinha através de Moraes e Cobra Mansa até Rogério e agora através de Índio representa uma importante transmissão da tradição da Capoeira Angola da Bahia para a Europa e de volta ao Brasil.',
  -- Achievements
  E'- Co-founded Associação de Capoeira Angola Dobrada (ACAD) in 1992 - one of the first Capoeira Angola organizations in Europe
- Instrumental in bringing Mestre Rogério to Germany (May 1990), helping establish Capoeira Angola in Europe
- Received mestre title from Mestre Rogério in 2004
- Leads ACAD nuclei in Bologna and Cesena, Italy
- First Brazilian capoeira instructor at Azraq refugee camp, Jordan (2015)
- Pioneered adapting capoeira teaching for Syrian refugee children, transliterating songs into Arabic
- Volunteered with Bidna Capoeira humanitarian organization
- 25+ years traveling and spreading capoeira across Europe, India, and Nepal
- Established community presence in São Gonçalo do Rio das Pedras, Brazil',
  E'- Co-fundou a Associação de Capoeira Angola Dobrada (ACAD) em 1992 - uma das primeiras organizações de Capoeira Angola na Europa
- Fundamental em trazer Mestre Rogério para a Alemanha (maio de 1990), ajudando a estabelecer a Capoeira Angola na Europa
- Recebeu título de mestre de Mestre Rogério em 2004
- Lidera os núcleos da ACAD em Bolonha e Cesena, Itália
- Primeiro instrutor brasileiro de capoeira no campo de refugiados de Azraq, Jordânia (2015)
- Pioneiro na adaptação do ensino de capoeira para crianças refugiadas sírias, transliterando canções para o árabe
- Voluntário na organização humanitária Bidna Capoeira
- Mais de 25 anos viajando e difundindo a capoeira pela Europa, Índia e Nepal
- Estabeleceu presença comunitária em São Gonçalo do Rio das Pedras, Brasil',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR (1963, exact):
Confirmed by Estado de Minas 2015 article stating he was 52 years old. Also confirmed by santaterezatem.com.br stating "Nasceu 1963 em Várzea da Palma (MG)."

BIRTHPLACE:
Várzea da Palma is a municipality in northern Minas Gerais near Pirapora. Estado de Minas describes it as "região próxima a Pirapora, no norte de Minas."

CAPOEIRA START:
Began at age 12 (c. 1975). Moved to Belo Horizonte around same time.

TIMELINE:
- Age 12 (~1975): Started capoeira, moved to Belo Horizonte
- Age 14 (~1977): Left home, began traveling as artisan
- Age 16 (~1979): Crossed to Bolivia
- Age 21 (~1984): Moved to Europe
- Mid-1980s: Training with Rogério in Belo Horizonte (inferred)
- May 1990: Invited Rogério to Germany
- 1992: Co-founded ACAD in Kassel
- 2004: Titled mestre by Rogério
- 2015: Azraq refugee camp volunteer (age 52)
- Present: Lives in Italy (Cesena) and São Gonçalo do Rio das Pedras (Brazil)

TEACHERS:
- Mestre Rogério: Primary teacher; titled Índio in 2004; trained together from mid-1980s in Belo Horizonte

TRAINING HISTORY UNCERTAINTY:
The exact start of Índio''s training with Rogério is unclear. He began capoeira at age 12 (~1975), but Rogério only became mestre in 1989 and founded his first school in BH "soon after." The relationship likely began in the mid-to-late 1980s.

NAME DISAMBIGUATION:
This is Mestre Índio (Carlos Roberto Gallo, b. 1963, ACAD), NOT Mestre Índio do Mercado Modelo (Manoel Olímpio de Souza, b. 1950, Grupo Oxóssi). Different people with same apelido. Uses apelido_context=''ACAD'' to distinguish.

CURRENT RESIDENCE:
Sources indicate he lives in Italy (Bologna/Cesena area) and maintains connection to São Gonçalo do Rio das Pedras, Brazil. Estado de Minas (2015) describes him returning to São Gonçalo after travels.

HUMANITARIAN WORK:
First Brazilian instructor at Azraq camp, Jordan (2015). Worked with Bidna Capoeira NGO. Taught 3 classes/day. Adapted songs to Arabic. Worked with Italian assistant Chiara Monzali.

FAMILY:
Has a daughter, born approximately 2001 (described as 14 years old in 2015 article).',
  E'ANO DE NASCIMENTO (1963, exato):
Confirmado pelo artigo do Estado de Minas de 2015 afirmando que ele tinha 52 anos. Também confirmado por santaterezatem.com.br afirmando "Nasceu 1963 em Várzea da Palma (MG)."

LOCAL DE NASCIMENTO:
Várzea da Palma é um município no norte de Minas Gerais, próximo a Pirapora. O Estado de Minas descreve como "região próxima a Pirapora, no norte de Minas."

INÍCIO NA CAPOEIRA:
Começou aos 12 anos (c. 1975). Mudou-se para Belo Horizonte aproximadamente na mesma época.

CRONOLOGIA:
- 12 anos (~1975): Começou capoeira, mudou-se para Belo Horizonte
- 14 anos (~1977): Saiu de casa, começou a viajar como artesão
- 16 anos (~1979): Cruzou para Bolívia
- 21 anos (~1984): Mudou-se para Europa
- Meados de 1980: Treinando com Rogério em Belo Horizonte (inferido)
- Maio de 1990: Convidou Rogério para Alemanha
- 1992: Co-fundou ACAD em Kassel
- 2004: Titulado mestre por Rogério
- 2015: Voluntário no campo de refugiados Azraq (52 anos)
- Presente: Vive na Itália (Cesena) e São Gonçalo do Rio das Pedras (Brasil)

PROFESSORES:
- Mestre Rogério: Professor principal; titulou Índio em 2004; treinaram juntos desde meados de 1980 em Belo Horizonte

INCERTEZA NO HISTÓRICO DE TREINAMENTO:
O início exato do treinamento de Índio com Rogério é incerto. Ele começou capoeira aos 12 anos (~1975), mas Rogério só se tornou mestre em 1989 e fundou sua primeira escola em BH "logo depois." A relação provavelmente começou em meados a final de 1980.

DESAMBIGUAÇÃO DE NOME:
Este é Mestre Índio (Carlos Roberto Gallo, n. 1963, ACAD), NÃO Mestre Índio do Mercado Modelo (Manoel Olímpio de Souza, n. 1950, Grupo Oxóssi). Pessoas diferentes com mesmo apelido. Usa apelido_context=''ACAD'' para distinguir.

RESIDÊNCIA ATUAL:
Fontes indicam que vive na Itália (região de Bolonha/Cesena) e mantém conexão com São Gonçalo do Rio das Pedras, Brasil. O Estado de Minas (2015) descreve seu retorno a São Gonçalo após viagens.

TRABALHO HUMANITÁRIO:
Primeiro instrutor brasileiro no campo Azraq, Jordânia (2015). Trabalhou com ONG Bidna Capoeira. Ministrava 3 aulas/dia. Adaptou canções para árabe. Trabalhou com assistente italiana Chiara Monzali.

FAMÍLIA:
Tem uma filha, nascida aproximadamente em 2001 (descrita como tendo 14 anos no artigo de 2015).'
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
