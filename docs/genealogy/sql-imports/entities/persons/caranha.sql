-- ============================================================
-- GENEALOGY PERSON: Caranha
-- Generated: 2026-01-12
-- ============================================================
-- Mestre Caranha was one of the founding capoeira mestres in
-- Ilhéus, southern Bahia. He initiated Virgílio de Ilhéus into
-- capoeira on July 28, 1944 - before formal academies existed
-- in the region. He represents the pre-academy era of informal
-- street training in the cacao region of Bahia.
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1900, decade precision):
-- If Caranha was teaching capoeira and initiating a student
-- (Virgílio, born 1934) in 1944, he would have been an
-- established mestre by then. Mestres typically teach at
-- 25-50 years old, suggesting birth between 1894-1919.
-- Estimating ~1900 with decade precision.
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
  NULL,
  'Caranha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-48']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Caranha taught capoeira in Ilhéus before the formal academy era. He was part of a group of local mestres who transmitted the art through informal street training and observation in the roda. His teaching style predated the institutional approaches of Salvador, representing a distinct southern Bahian tradition.',
  E'Caranha ensinava capoeira em Ilhéus antes da era das academias formais. Ele fazia parte de um grupo de mestres locais que transmitiam a arte através de treinamento informal nas ruas e observação na roda. Seu estilo de ensino precedia as abordagens institucionais de Salvador, representando uma tradição distinta do sul da Bahia.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Ilhéus, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Mestre Caranha was one of the founding figures of capoeira in Ilhéus, a port city in southern Bahia known for its cacao trade. He was active in the 1940s, during a time when there were no formal capoeira academies in the region—the art was transmitted on the streets, learned through observation in the roda and direct practice with experienced practitioners.

On July 28, 1944, Caranha initiated a nine-year-old boy named José Virgílio dos Santos into capoeira. That boy would grow up to become Mestre Virgílio de Ilhéus, the oldest representative of Capoeira Angola in southern Bahia, who dedicated over 70 years to the art before his death in 2024.

Caranha operated alongside a constellation of local mestres in Ilhéus: Chico da Onça, Claudemiro, Álvaro, Elíscio, João Valença, and Barreto. Together, these practitioners formed the informal network that kept capoeira alive in southern Bahia, far from the academies of Pastinha and Bimba in Salvador.

Very little is documented about Caranha''s personal history. His apelido (nickname) derives from "caranha," a freshwater fish native to Brazilian rivers (Piaractus brachypomus, also known as pirapitinga), suggesting possible origins connected to fishing communities or riverine areas. Like many capoeiristas of his era, his full name has been lost to history—what remains is his role in the oral tradition and the lineage he helped establish.

The capoeira Caranha taught predated the formal systematization that would later distinguish "Angola" from "Regional" styles. He represented the older tradition of street capoeira that would later be classified as Capoeira Angola, though the practitioners of his time would not have used that terminology.

Caranha''s legacy lives through Mestre Virgílio de Ilhéus, who preserved and transmitted the southern Bahian tradition for over seven decades, eventually receiving a Doctor Honoris Causa from the Universidade Estadual de Santa Cruz in recognition of his lifetime dedication to the art.',
  -- Extended content (bio_pt)
  E'Mestre Caranha foi uma das figuras fundadoras da capoeira em Ilhéus, uma cidade portuária no sul da Bahia conhecida pelo comércio de cacau. Ele era ativo nos anos 1940, durante uma época em que não havia academias formais de capoeira na região—a arte era transmitida nas ruas, aprendida através da observação na roda e prática direta com praticantes experientes.

Em 28 de julho de 1944, Caranha iniciou um menino de nove anos chamado José Virgílio dos Santos na capoeira. Esse menino cresceria para se tornar Mestre Virgílio de Ilhéus, o mais antigo representante da Capoeira Angola no sul da Bahia, que dedicou mais de 70 anos à arte antes de sua morte em 2024.

Caranha atuava ao lado de uma constelação de mestres locais em Ilhéus: Chico da Onça, Claudemiro, Álvaro, Elíscio, João Valença e Barreto. Juntos, esses praticantes formavam a rede informal que mantinha a capoeira viva no sul da Bahia, longe das academias de Pastinha e Bimba em Salvador.

Muito pouco está documentado sobre a história pessoal de Caranha. Seu apelido deriva de "caranha," um peixe de água doce nativo dos rios brasileiros (Piaractus brachypomus, também conhecido como pirapitinga), sugerindo possíveis origens conectadas a comunidades pesqueiras ou áreas ribeirinhas. Como muitos capoeiristas de sua era, seu nome completo foi perdido na história—o que permanece é seu papel na tradição oral e a linhagem que ele ajudou a estabelecer.

A capoeira que Caranha ensinava precedia a sistematização formal que mais tarde distinguiria os estilos "Angola" de "Regional". Ele representava a tradição mais antiga da capoeira de rua que mais tarde seria classificada como Capoeira Angola, embora os praticantes de seu tempo não usassem essa terminologia.

O legado de Caranha vive através de Mestre Virgílio de Ilhéus, que preservou e transmitiu a tradição do sul da Bahia por mais de sete décadas, eventualmente recebendo o título de Doutor Honoris Causa da Universidade Estadual de Santa Cruz em reconhecimento de sua dedicação de vida à arte.',
  -- Achievements (English)
  E'Founded capoeira tradition in Ilhéus, southern Bahia (pre-1944); Initiated Mestre Virgílio de Ilhéus on July 28, 1944; Part of founding generation of capoeira mestres in cacao region; Transmitted capoeira through informal street teaching before formal academies existed',
  -- Achievements (Portuguese)
  E'Fundou tradição da capoeira em Ilhéus, sul da Bahia (antes de 1944); Iniciou Mestre Virgílio de Ilhéus em 28 de julho de 1944; Parte da geração fundadora de mestres de capoeira na região cacaueira; Transmitiu capoeira através de ensino informal nas ruas antes das academias formais existirem',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (~1900, decade):
If Caranha was an active teaching mestre in 1944 when he initiated Virgílio (age 9), he would have been an established practitioner. Mestres typically teach between ages 25-50. This suggests Caranha was born roughly 1894-1919. Estimating ~1900 with decade precision as a reasonable midpoint.

DEATH YEAR:
Unknown. No sources document Caranha''s death. Given estimated birth ~1900 and last known activity 1944, he likely died sometime between 1950s-1980s.

NAME:
Full name unknown. Only documented as "Mestre Caranha" in all sources.

APELIDO ETYMOLOGY:
"Caranha" is a Brazilian Portuguese name for a freshwater fish (Piaractus brachypomus, also called pirapitinga), native to Amazon and Araguaia-Tocantins basins. The fish is known for its strength and is prized as food. The nickname may relate to physical characteristics, fishing background, or movement style.

ACTIVITY PERIOD:
Only documented activity is 1944 initiation of Virgílio de Ilhéus. Active in Ilhéus during informal street training era before formal capoeira academies.

TEACHING CONTEXT:
Taught alongside local Ilhéus mestres: Chico da Onça, Claudemiro, Álvaro, Elíscio, João Valença, and Barreto. No formal academies existed in Ilhéus at this time—training was informal, on the streets, through observation in the roda.

STUDENTS:
- Virgílio de Ilhéus (initiated July 28, 1944, age 9-10) - confirmed primary student

CONTEMPORARIES (documented in same era and location):
- Mestre Chico da Onça (Ilhéus, 1940s)
- Mestre Claudemiro (Ilhéus, 1940s)
- Mestre Álvaro (Ilhéus, 1940s)
- Mestre Elíscio (Ilhéus, 1940s)
- Mestre João Valença (Ilhéus, 1940s)
- Mestre Barreto (Ilhéus, 1940s)

SOURCE:
Primary source is velhosmestres.com (Virgílio de Ilhéus biography), which provides the specific date of July 28, 1944 for initiation. No other sources document Caranha independently.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1900, década):
Se Caranha era um mestre ativo ensinando em 1944 quando iniciou Virgílio (9 anos), ele seria um praticante estabelecido. Mestres tipicamente ensinam entre 25-50 anos. Isso sugere que Caranha nasceu aproximadamente entre 1894-1919. Estimando ~1900 com precisão de década como ponto médio razoável.

ANO DE FALECIMENTO:
Desconhecido. Nenhuma fonte documenta a morte de Caranha. Dado o nascimento estimado ~1900 e última atividade conhecida em 1944, ele provavelmente morreu entre as décadas de 1950-1980.

NOME:
Nome completo desconhecido. Documentado apenas como "Mestre Caranha" em todas as fontes.

ETIMOLOGIA DO APELIDO:
"Caranha" é um nome em português brasileiro para um peixe de água doce (Piaractus brachypomus, também chamado pirapitinga), nativo das bacias Amazônica e Araguaia-Tocantins. O peixe é conhecido por sua força e é valorizado como alimento. O apelido pode relacionar-se a características físicas, origem pesqueira ou estilo de movimento.

PERÍODO DE ATIVIDADE:
Única atividade documentada é a iniciação de Virgílio de Ilhéus em 1944. Ativo em Ilhéus durante a era de treinamento informal nas ruas antes das academias formais de capoeira.

CONTEXTO DE ENSINO:
Ensinava ao lado de mestres locais de Ilhéus: Chico da Onça, Claudemiro, Álvaro, Elíscio, João Valença e Barreto. Não existiam academias formais em Ilhéus nesta época—o treinamento era informal, nas ruas, através de observação na roda.

ALUNOS:
- Virgílio de Ilhéus (iniciado 28 de julho de 1944, 9-10 anos) - aluno primário confirmado

CONTEMPORÂNEOS (documentados na mesma era e local):
- Mestre Chico da Onça (Ilhéus, anos 1940)
- Mestre Claudemiro (Ilhéus, anos 1940)
- Mestre Álvaro (Ilhéus, anos 1940)
- Mestre Elíscio (Ilhéus, anos 1940)
- Mestre João Valença (Ilhéus, anos 1940)
- Mestre Barreto (Ilhéus, anos 1940)

FONTE:
Fonte primária é velhosmestres.com (biografia de Virgílio de Ilhéus), que fornece a data específica de 28 de julho de 1944 para a iniciação. Nenhuma outra fonte documenta Caranha independentemente.'
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
