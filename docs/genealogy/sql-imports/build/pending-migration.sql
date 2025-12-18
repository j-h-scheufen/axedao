-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2025-12-18T02:51:42.358Z
-- ============================================================
--
-- New entity files: 13
-- Changed entity files: 0
-- New statement files: 13
-- Changed statement files: 0
-- Deleted files: 0
-- Unchanged files: 288
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/bene-do-correio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Bené do Correio
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Listed by Pastinha in 1967 as already deceased among practitioners
-- of "pure Capoeira de Angola." The other figures on this list were
-- active in the early-to-mid 20th century (Américo Ciência fought
-- Bimba in 1936; Amorzinho led Gengibirra until 1943), suggesting
-- Bené do Correio was likely born around 1880-1910. Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Confirmed dead by Pastinha's 1967 interview. As a contemporary of
-- the other angoleiros on the list (most active 1900s-1940s),
-- likely died in the 1950s-1960s. Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown (Bené is short for Benedito)
  'Bené do Correio', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Bené do Correio among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview, distinguishing these figures from the modernized Regional style.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Bené do Correio entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967, distinguindo essas figuras do estilo Regional modernizado.',
  1900, -- birth_year: estimated from context (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given association with Pastinha's circles
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Bené do Correio was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. His name appears in one of the most important primary sources in capoeira history: Mestre Pastinha''s 1967 interview with Revista Realidade magazine.\n\nIn February 1967, the 78-year-old Pastinha—nearly blind but still teaching at his academy in Pelourinho—spoke with journalist Roberto Freire about the great capoeiristas of the past. Pastinha listed Bené do Correio among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Sete Mortes, Chico Me Dá, and two women: Júlia Fogareira and Maria Homem.\n\nPastinha remarked of these figures: "Cada nome destes é uma história"—each of these names is a story. He observed that their apelidos revealed "who they were, how they fought," suggesting these nicknames encoded information about their fighting styles, personalities, or occupations.\n\nThe apelido "Bené do Correio" follows a common Brazilian naming pattern where "Bené" (short for Benedito) is followed by an occupational identifier. "Correio" means "post office" or "mail service" in Portuguese, indicating that this capoeirista was likely associated with postal work—perhaps as a letter carrier, messenger, or post office employee. In early 20th century Salvador, work at or near the correio was common for men of the working class, the same demographic that produced many capoeiristas.\n\nNotably, Mestre Pastinha himself worked at the correio after leaving the Navy around 1910. According to sources, "foi trabalhar no Diário da Bahia como ganhador, levando gazeta para o correio e assinaturas, ganhando 1.600 réis. Depois foi trabalhar no correio, no comércio, como carregador." This shared occupational background may explain how Pastinha knew Bené do Correio—they may have been colleagues or crossed paths in the postal trade.\n\nBeyond Pastinha''s mention, no other documentation of Bené do Correio has been found. He represents one of the many capoeiristas whose contributions to the art have been largely lost to history, remembered only through the oral testimony of those who knew them.',
  -- bio_pt
  E'Bené do Correio foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Seu nome aparece em uma das mais importantes fontes primárias da história da capoeira: a entrevista de Mestre Pastinha à Revista Realidade em 1967.\n\nEm fevereiro de 1967, Pastinha, então com 78 anos—quase cego mas ainda ensinando em sua academia no Pelourinho—conversou com o jornalista Roberto Freire sobre os grandes capoeiristas do passado. Pastinha listou Bené do Correio entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Sete Mortes, Chico Me Dá, e duas mulheres: Júlia Fogareira e Maria Homem.\n\nPastinha comentou sobre essas figuras: "Cada nome destes é uma história." Ele observou que seus apelidos revelavam "quem eles eram, como lutavam"—sugerindo que esses apelidos codificavam informações sobre seus estilos de luta, personalidades ou ocupações.\n\nO apelido "Bené do Correio" segue um padrão comum de nomeação brasileira onde "Bené" (diminutivo de Benedito) é seguido por um identificador ocupacional. "Correio" significa o serviço de correios ou agência postal em português, indicando que este capoeirista era provavelmente associado ao trabalho postal—talvez como carteiro, mensageiro ou funcionário dos correios. No início do século XX em Salvador, trabalhar no ou perto do correio era comum para homens da classe trabalhadora, o mesmo grupo demográfico que produziu muitos capoeiristas.\n\nNotavelmente, o próprio Mestre Pastinha trabalhou no correio após deixar a Marinha por volta de 1910. Segundo fontes, "foi trabalhar no Diário da Bahia como ganhador, levando gazeta para o correio e assinaturas, ganhando 1.600 réis. Depois foi trabalhar no correio, no comércio, como carregador." Esse histórico ocupacional compartilhado pode explicar como Pastinha conhecia Bené do Correio—eles podem ter sido colegas ou se cruzado no ramo postal.\n\nAlém da menção de Pastinha, nenhuma outra documentação sobre Bené do Correio foi encontrada. Ele representa um dos muitos capoeiristas cujas contribuições para a arte foram amplamente perdidas na história, lembrados apenas através do testemunho oral daqueles que os conheceram.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nListed by Pastinha in 1967 as already deceased among practitioners of "pure Capoeira de Angola." The other figures on this list were active in the early-to-mid 20th century, suggesting Bené do Correio was likely born around 1880-1910.\n\nDEATH YEAR ESTIMATION (1960, decade):\nConfirmed dead by Pastinha''s 1967 interview. As a contemporary of the other angoleiros on the list (most active 1900s-1940s), likely died in the 1950s-1960s.\n\nAPELIDO:\n"Bené do Correio" follows Brazilian naming convention: "Bené" (short for Benedito) + "do Correio" (of the post office/mail). "Correio" indicates association with postal work—likely a letter carrier, messenger, or post office employee in Salvador.\n\nPASTINHA CORREIO CONNECTION:\nPastinha himself worked at the correio after leaving the Navy (~1910): "foi trabalhar no Diário da Bahia como ganhador, levando gazeta para o correio e assinaturas... Depois foi trabalhar no correio, no comércio, como carregador." This may explain how Pastinha knew Bené do Correio—possible colleagues in postal trade.\n\nSOURCE:\nRevista Realidade, February 1967, "É Luta, É Dança, É Capoeira" by Roberto Freire (photos by David Drew Zingg). This is a single-source profile; no additional documentation found.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nListado por Pastinha em 1967 como já falecido entre praticantes de "capoeira de Angola pura." As outras figuras dessa lista estavam ativas no início e meados do século XX, sugerindo que Bené do Correio provavelmente nasceu por volta de 1880-1910.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Como contemporâneo dos outros angoleiros da lista (maioria ativos nos anos 1900-1940), provavelmente morreu nos anos 1950-1960.\n\nAPELIDO:\n"Bené do Correio" segue a convenção de nomeação brasileira: "Bené" (diminutivo de Benedito) + "do Correio" (dos correios). "Correio" indica associação com trabalho postal—provavelmente carteiro, mensageiro ou funcionário dos correios em Salvador.\n\nCONEXÃO PASTINHA-CORREIO:\nO próprio Pastinha trabalhou no correio após deixar a Marinha (~1910): "foi trabalhar no Diário da Bahia como ganhador, levando gazeta para o correio e assinaturas... Depois foi trabalhar no correio, no comércio, como carregador." Isso pode explicar como Pastinha conhecia Bené do Correio—possíveis colegas no ramo postal.\n\nFONTE:\nRevista Realidade, fevereiro de 1967, "É Luta, É Dança, É Capoeira" por Roberto Freire (fotos de David Drew Zingg). Este é um perfil de fonte única; nenhuma documentação adicional encontrada.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem'
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

-- Source: entities/persons/bras-amansa-brabo.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Brás Amansa Brabo
-- Generated: 2025-12-18
-- Updated: 2025-12-18 (added birth year estimate)
-- ============================================================
-- BIRTH YEAR ESTIMATION (1920, decade):
-- Contemporary of Atenilo (born 1918) in Bimba's inner circle.
-- Active as recognized mestre in Salvador in 1982 (O Globo).
-- If similar generation to Atenilo and started training with
-- Bimba in 1930s-1940s as teenager/young adult, birth ~1915-1930.
-- Using 1920 with decade precision as central estimate.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Brás Amansa Brabo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/cobrinha-1982-3', 'http://velhosmestres.com/en/cobrinha-1982-3']::text[],
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba in the Capoeira Regional tradition. Part of Bimba''s inner circle of trusted companions.',
  E'Treinado diretamente com Mestre Bimba na tradição da Capoeira Regional. Parte do círculo íntimo de companheiros de confiança de Bimba.',
  1920,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Brás Amansa Brabo was a direct student and trusted companion of Mestre Bimba, the founder of Capoeira Regional. His apelido—which translates roughly to "Brás who tames the wild one" or "Brás the wild-tamer"—suggests his reputation for handling aggressive or unruly opponents with skill and composure, a quality valued in the rodas of Salvador.

He appears in the historical record as part of Bimba''s inner circle. According to Mestre Atenilo''s testimony (preserved in Mestre Itapoan''s writings), Brás Amansa Brabo was among Bimba''s most trusted companions, mentioned in the same breath as Atenilo himself and Crispim, Bimba''s eldest son. This places him among a small group of students who had particularly close relationships with the master.

In February 1982, O Globo newspaper published an article titled "Capoeira - A great controversy in the Bahia rodas" documenting the state of capoeira in Salvador. The article categorized the active mestres by lineage, listing those in the "regional" branch—"almost all direct disciples of the legendary Bimba"—and specifically naming Brás Amansa Brabo among the most prominent. He appears alongside Itapuã, Vinte e Nove, Vermelho 27, Medicina, Banduê, Capazans, Ezequiel, and Hélio Xaréu. This 1982 documentation confirms he was active as a mestre in Salvador at that time and was recognized as a significant figure in the Regional lineage.

Beyond these two references, little else has been preserved about his life. His full name, birth and death dates, and the details of his training under Bimba remain undocumented in available sources. He represents one of many mestres from Bimba''s academy whose individual stories have been overshadowed by the more extensively documented figures like Itapoan, Ezequiel, and Vermelho 27. His presence in both Atenilo''s testimony and the 1982 press coverage confirms his historical significance, even as the specifics of his life await further research.',
  -- bio_pt
  E'Brás Amansa Brabo foi aluno direto e companheiro de confiança de Mestre Bimba, o fundador da Capoeira Regional. Seu apelido—que se traduz aproximadamente como "Brás que amansa o bravo" ou "Brás o domador de valentes"—sugere sua reputação de lidar com oponentes agressivos ou indisciplinados com habilidade e compostura, uma qualidade valorizada nas rodas de Salvador.

Ele aparece no registro histórico como parte do círculo íntimo de Bimba. Segundo o testemunho de Mestre Atenilo (preservado nos escritos de Mestre Itapoan), Brás Amansa Brabo estava entre os companheiros mais confiáveis de Bimba, mencionado junto com o próprio Atenilo e Crispim, o filho mais velho de Bimba. Isso o coloca entre um pequeno grupo de alunos que tinha relações particularmente próximas com o mestre.

Em fevereiro de 1982, o jornal O Globo publicou um artigo intitulado "Capoeira - Uma grande controvérsia nas rodas da Bahia" documentando o estado da capoeira em Salvador. O artigo categorizou os mestres ativos por linhagem, listando aqueles no ramo "regional"—"quase todos discípulos diretos do lendário Bimba"—e nomeando especificamente Brás Amansa Brabo entre os mais proeminentes. Ele aparece ao lado de Itapuã, Vinte e Nove, Vermelho 27, Medicina, Banduê, Capazans, Ezequiel e Hélio Xaréu. Esta documentação de 1982 confirma que ele estava ativo como mestre em Salvador naquela época e era reconhecido como uma figura significativa na linhagem Regional.

Além dessas duas referências, pouco mais foi preservado sobre sua vida. Seu nome completo, datas de nascimento e morte, e os detalhes de seu treinamento com Bimba permanecem não documentados nas fontes disponíveis. Ele representa um dos muitos mestres da academia de Bimba cujas histórias individuais foram ofuscadas por figuras mais extensivamente documentadas como Itapoan, Ezequiel e Vermelho 27. Sua presença tanto no testemunho de Atenilo quanto na cobertura da imprensa de 1982 confirma sua significância histórica, mesmo enquanto os detalhes de sua vida aguardam pesquisa adicional.',
  -- achievements_en
  E'Direct disciple of Mestre Bimba; Member of Bimba''s inner circle of trusted companions; Active and recognized mestre of Capoeira Regional in Salvador as of 1982',
  -- achievements_pt
  E'Discípulo direto de Mestre Bimba; Membro do círculo íntimo de companheiros de confiança de Bimba; Mestre ativo e reconhecido de Capoeira Regional em Salvador em 1982',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Contemporary of Atenilo (born 1918) in Bimba''s inner circle. Active as recognized mestre in Salvador in 1982 (O Globo article). If similar generation to Atenilo and started training with Bimba in 1930s-1940s as teenager/young adult, birth approximately 1915-1930. Using 1920 with decade precision as central estimate. This would make him approximately 62 years old in 1982.

LIMITED DOCUMENTATION:
This profile is based on only two primary source references:
1. O Globo newspaper article (Feb 16, 1982) via velhosmestres.com
2. Mestre Atenilo''s testimony (preserved in Mestre Itapoan''s writings, in our dataset)

APELIDO MEANING:
"Amansa Brabo" literally means "tames the wild/fierce one" - a capoeira war name suggesting skill at subduing aggressive opponents. "Brás" is his first name (Portuguese version of Blaise).

CONTEMPORARIES (from 1982 O Globo article):
Listed alongside these Bimba students as prominent Regional mestres in Salvador:
- Itapuã (Itapoan)
- Vinte e Nove
- Vermelho 27
- Medicina
- Banduê
- Capazans
- Ezequiel
- Hélio Xaréu

INNER CIRCLE:
According to Atenilo, Brás Amansa Brabo was one of Bimba''s most trusted companions, alongside:
- Atenilo himself
- Crispim (Bimba''s eldest son)

UNKNOWN:
- Full civil name
- Birth year (now estimated as 1920, decade precision)
- Death year
- Birth place
- When he began training with Bimba
- Whether he achieved formal graduation (lenço) status
- Whether he founded or led any group

RESEARCH NEEDED:
- Mestre Itapoan''s archive (30,000+ documents) may contain additional information
- Interviews with surviving Bimba students from the 1960s-70s era
- Bahian newspaper archives from 1950s-1980s',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1920, década):
Contemporâneo de Atenilo (nascido em 1918) no círculo íntimo de Bimba. Ativo como mestre reconhecido em Salvador em 1982 (artigo O Globo). Se da mesma geração de Atenilo e começou a treinar com Bimba nos anos 1930-1940 como adolescente/jovem adulto, nascimento aproximadamente 1915-1930. Usando 1920 com precisão de década como estimativa central. Isso o colocaria com aproximadamente 62 anos em 1982.

DOCUMENTAÇÃO LIMITADA:
Este perfil é baseado em apenas duas referências de fontes primárias:
1. Artigo do jornal O Globo (16 fev 1982) via velhosmestres.com
2. Testemunho de Mestre Atenilo (preservado nos escritos de Mestre Itapoan, em nosso banco de dados)

SIGNIFICADO DO APELIDO:
"Amansa Brabo" significa literalmente "amansa o bravo/feroz" - um nome de guerra da capoeira sugerindo habilidade em subjugar oponentes agressivos. "Brás" é seu primeiro nome.

CONTEMPORÂNEOS (do artigo O Globo de 1982):
Listado junto com estes alunos de Bimba como mestres proeminentes da Regional em Salvador:
- Itapuã (Itapoan)
- Vinte e Nove
- Vermelho 27
- Medicina
- Banduê
- Capazans
- Ezequiel
- Hélio Xaréu

CÍRCULO ÍNTIMO:
Segundo Atenilo, Brás Amansa Brabo era um dos companheiros mais confiáveis de Bimba, junto com:
- O próprio Atenilo
- Crispim (filho mais velho de Bimba)

DESCONHECIDO:
- Nome civil completo
- Ano de nascimento (agora estimado como 1920, precisão de década)
- Ano de morte
- Local de nascimento
- Quando começou a treinar com Bimba
- Se alcançou status de graduação formal (lenço)
- Se fundou ou liderou algum grupo

PESQUISA NECESSÁRIA:
- Arquivo de Mestre Itapoan (30.000+ documentos) pode conter informações adicionais
- Entrevistas com alunos sobreviventes de Bimba da era 1960s-70s
- Arquivos de jornais baianos de 1950s-1980s'
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

-- Source: entities/persons/chico-me-da.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Chico Me Dá
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- As a contemporary of Pastinha (born 1889) who practiced "pure Capoeira
-- de Angola," Chico Me Dá was likely of the same generation. The
-- legendary capoeiristas Pastinha listed in 1967 were from the pre-
-- Bimba/Pastinha era - active practitioners from the late 19th to early
-- 20th century. Using 1890 as a reasonable estimate with decade precision.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Pastinha listed him among the deceased in his 1967 interview. Given
-- the generation of fighters he was grouped with, and that all were
-- confirmed dead by 1967, death likely occurred in the 1950s-1960s.
-- Using 1960 with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown (Chico likely short for Francisco)
  'Chico Me Dá', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1976']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Mestre Pastinha explicitly identified Chico Me Dá as a practitioner of "pure Capoeira de Angola" alongside other legendary angoleiros of the pre-Bimba/Pastinha era. Pastinha remarked that the nicknames alone revealed "who they were, how they fought."',
  E'Capoeira de Angola tradicional. Mestre Pastinha identificou explicitamente Chico Me Dá como praticante de "capoeira de Angola pura" ao lado de outros angoleiros lendários da era pré-Bimba/Pastinha. Pastinha observou que os apelidos por si só revelavam "quem eles eram, como lutavam."',
  1890, -- birth_year: estimated from generation (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area, but unconfirmed
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Chico Me Dá was a legendary capoeirista of Salvador, Bahia, active during the late 19th or early 20th century. He is known from Mestre Pastinha''s 1967 interview with Roberto Freire for Revista Realidade, where Pastinha recalled the great capoeiristas of the past.

In that interview, conducted when Pastinha was 78 years old and nearly blind, the father of Capoeira Angola listed seventeen deceased practitioners who had practiced "the pure Capoeira de Angola as I and these boys there do until today." Chico Me Dá was among them, alongside other colorfully-named figures such as Bigode de Seda (Silk Mustache), Américo Ciência, Bugalho, Amorzinho (Little Love), Zé Bom Pé (Joe Good Foot), Chico Três Pedaços (Chico Three Pieces), Tibiriçá da Folha Grossa (Tibiriçá of the Thick Leaf), Doze Homens (Twelve Men), Inimigo Sem Tripa (Gutless Enemy), Vitorino Braço Torto (Vitorino Crooked Arm), Zé do U, Zé do Saco (Joe of the Sack), Bené do Correio (Bené of the Post Office), and Sete Mortes (Seven Deaths). Pastinha also mentioned two women among these legendary practitioners: Júlia Fogareira and Maria Homem.

Pastinha remarked of these figures: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história" (We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story). He emphasized that their nicknames revealed their character and fighting style: "From the nicknames alone you can know who they were, how they fought."

The apelido "Chico Me Dá" is distinctive and intriguing. "Chico" is a common Brazilian diminutive for Francisco, used widely among capoeiristas—the same naming pattern as Chico Três Pedaços and other famous figures. "Me Dá" means "Give me" in Portuguese. The full nickname "Give-Me Chico" or "Chico Give-Me" may have originated from a catchphrase the fighter used during rodas—perhaps challenging opponents to "give me" a fight, or demanding something from life. It could also reference a fighting style where he aggressively demanded the advantage, or even a personality trait of someone who was known for asking or taking. Pastinha noted that these old angoleiros'' apelidos encoded information about their identities and fighting methods, though without additional documentation, the exact origin remains a mystery.

In the 1976 O Globo article about Pastinha''s declining years, his students recalled the generation of "angoleiros de briga" (fighting angoleiros) that included Chico Me Dá: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga" (After Bimba died, only he [Pastinha] remained from that generation of fighting angoleiros). This confirms that Chico Me Dá belonged to an era when capoeira was primarily a street fighting art, before the formalization into academies.

No further biographical details have survived—no teachers, students, specific incidents, or documented appearances. Chico Me Dá exists as a name on Pastinha''s list of the fallen, a reminder that behind each apelido stood a life now largely forgotten. His inclusion among these legendary figures confirms his standing as one of the notable capoeiristas of Bahia during the golden age of capoeira de Angola.',
  -- bio_pt
  E'Chico Me Dá foi um lendário capoeirista de Salvador, Bahia, ativo durante o final do século XIX ou início do século XX. Ele é conhecido pela entrevista de Mestre Pastinha de 1967 com Roberto Freire para a Revista Realidade, na qual Pastinha recordou os grandes capoeiristas do passado.

Nessa entrevista, conduzida quando Pastinha tinha 78 anos e estava quase cego, o pai da Capoeira Angola listou dezessete praticantes falecidos que haviam praticado "a pura capoeira de Angola como eu e esses rapazes aí fazem até hoje." Chico Me Dá estava entre eles, ao lado de outras figuras de nomes coloridos como Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do U, Zé do Saco, Bené do Correio e Sete Mortes. Pastinha também mencionou duas mulheres entre esses praticantes lendários: Júlia Fogareira e Maria Homem.

Pastinha comentou sobre essas figuras: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história." Ele enfatizou que seus apelidos revelavam seu caráter e estilo de luta: "Só pelo apelido você conhece quem eles eram, como lutavam."

O apelido "Chico Me Dá" é distintivo e intrigante. "Chico" é um diminutivo brasileiro comum para Francisco, amplamente usado entre capoeiristas—o mesmo padrão de nomenclatura de Chico Três Pedaços e outras figuras famosas. "Me Dá" significa "Give me" em inglês. O apelido completo "Chico Me Dá" pode ter se originado de um bordão que o lutador usava durante as rodas—talvez desafiando oponentes a "me darem" uma luta, ou exigindo algo da vida. Também poderia referir-se a um estilo de luta onde ele agressivamente exigia a vantagem, ou até mesmo um traço de personalidade de alguém conhecido por pedir ou tomar. Pastinha observou que os apelidos desses velhos angoleiros codificavam informações sobre suas identidades e métodos de luta, embora sem documentação adicional, a origem exata permaneça um mistério.

No artigo do O Globo de 1976 sobre os anos de declínio de Pastinha, seus alunos recordaram a geração de "angoleiros de briga" que incluía Chico Me Dá: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga." Isso confirma que Chico Me Dá pertencia a uma era em que a capoeira era primariamente uma arte de luta de rua, antes da formalização em academias.

Nenhum detalhe biográfico adicional sobreviveu—nenhum mestre, aluno, incidente específico ou aparição documentada. Chico Me Dá existe como um nome na lista de Pastinha dos caídos, um lembrete de que por trás de cada apelido havia uma vida agora em grande parte esquecida. Sua inclusão entre essas figuras lendárias confirma sua posição como um dos notáveis capoeiristas da Bahia durante a era dourada da capoeira de Angola.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade):
Contemporary of Pastinha (born 1889). As a practitioner of "pure Capoeira de Angola" listed among the legendary deceased angoleiros, likely active in the late 19th to early 20th century. Estimate based on generational placement.

DEATH YEAR ESTIMATION (1960, decade):
Pastinha listed him among the deceased in 1967 interview. All figures in this list were confirmed dead by 1967.

APELIDO ETYMOLOGY:
- "Chico" - common Brazilian diminutive for Francisco
- "Me Dá" - Portuguese for "Give me"
- Full meaning: "Give-Me Chico" or "Chico Give-Me"
- Possible interpretations:
  1. A catchphrase used during rodas challenging opponents
  2. An aggressive fighting style demanding the advantage
  3. A personality trait of someone known for asking or taking
  4. Possibly related to a specific incident or reputation

NAMING PATTERN:
The "Chico + descriptor" pattern was common in Bahian capoeira:
- Chico Três Pedaços (Chico Three Pieces)
- Chico Preto (Black Chico)
- Chico Cazumbá
- Chico da Barra
- Chico Capurminho

SOURCE: Mestre Pastinha interview with Roberto Freire, Revista Realidade, February 1967.
SECONDARY SOURCE: O Globo article, April 11, 1976 (quoted in velhosmestres.com/br/pastinha-1976)

PASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

KEY QUOTE (Portuguese):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

KEY QUOTE (English translation):
"We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story."

KEY QUOTE on nicknames:
"From the nicknames alone you can know who they were, how they fought."

1976 STUDENT QUOTE:
"Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga."
(After Bimba died, only he [Pastinha] remained from that generation of fighting angoleiros.)

NO ADDITIONAL DOCUMENTATION FOUND:
- No dedicated velhosmestres.com page exists
- No Wikipedia article
- No academic papers specifically mentioning this person
- No group affiliations documented
- No teacher-student relationships documented
- No specific incidents or timeline events
- Listed in CDO Sergipe''s "Mestres da Capoeiragem" catalog alongside other legendary Bahian capoeiristas',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
Contemporâneo de Pastinha (nascido em 1889). Como praticante de "capoeira de Angola pura" listado entre os lendários angoleiros falecidos, provavelmente ativo no final do século XIX até início do século XX. Estimativa baseada em posicionamento geracional.

ESTIMATIVA DE ANO DE MORTE (1960, década):
Pastinha o listou entre os falecidos em entrevista de 1967. Todas as figuras nesta lista estavam confirmadamente mortas em 1967.

ETIMOLOGIA DO APELIDO:
- "Chico" - diminutivo brasileiro comum para Francisco
- "Me Dá" - português para "Give me"
- Significado completo: "Chico Me Dá"
- Interpretações possíveis:
  1. Um bordão usado durante as rodas desafiando oponentes
  2. Um estilo de luta agressivo exigindo a vantagem
  3. Um traço de personalidade de alguém conhecido por pedir ou tomar
  4. Possivelmente relacionado a um incidente específico ou reputação

PADRÃO DE NOMENCLATURA:
O padrão "Chico + descritor" era comum na capoeira baiana:
- Chico Três Pedaços
- Chico Preto
- Chico Cazumbá
- Chico da Barra
- Chico Capurminho

FONTE: Entrevista de Mestre Pastinha com Roberto Freire, Revista Realidade, fevereiro de 1967.
FONTE SECUNDÁRIA: Artigo do O Globo, 11 de abril de 1976 (citado em velhosmestres.com/br/pastinha-1976)

LISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

CITAÇÃO CHAVE (Português):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

CITAÇÃO CHAVE sobre apelidos:
"Só pelo apelido você conhece quem eles eram, como lutavam."

CITAÇÃO DOS ALUNOS 1976:
"Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga."

NENHUMA DOCUMENTAÇÃO ADICIONAL ENCONTRADA:
- Não existe página dedicada no velhosmestres.com
- Nenhum artigo na Wikipedia
- Nenhum trabalho acadêmico mencionando especificamente esta pessoa
- Nenhuma afiliação a grupo documentada
- Nenhuma relação mestre-aluno documentada
- Nenhum incidente específico ou evento cronológico
- Listado no catálogo "Mestres da Capoeiragem" do CDO Sergipe ao lado de outros lendários capoeiristas baianos'
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

-- Source: entities/persons/crispim.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Crispim
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1920, decade):
-- Mestre Bimba was born in 1899/1900. Crispim was his first son
-- with his first partner Maria dos Anjos. Assuming Bimba fathered
-- his first child in his late teens to early twenties, Crispim
-- was likely born around 1918-1925. By 1954, when he appeared in
-- the film "Vadiação," he would have been a mature capoeirista in
-- his late 20s to mid-30s. Using 1920 with decade precision.
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
  'Manoel dos Reis Machado Filho',
  'Crispim',
  'contra-mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeiraceaca.wordpress.com/tag/crispim-filho-de-bimba/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained from childhood in Capoeira Regional under his father Mestre Bimba. Served as contramestre at the Centro de Cultura Física Regional (CCFR), preparing students before they advanced to train directly with Bimba. His role was foundational in the academy''s teaching structure.',
  E'Treinado desde a infância em Capoeira Regional sob seu pai Mestre Bimba. Serviu como contramestre no Centro de Cultura Física Regional (CCFR), preparando alunos antes de avançarem para treinar diretamente com Bimba. Seu papel foi fundamental na estrutura de ensino da academia.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Manoel dos Reis Machado Filho, known as Crispim, was the eldest son and disciple of Mestre Bimba, the creator of Capoeira Regional. Born to Bimba''s first partner, Maria dos Anjos, Crispim grew up immersed in the development of what would become Brazil''s first systematically taught capoeira style.

Crispim held the rank of contramestre and played a crucial role at the Centro de Cultura Física Regional (CCFR), his father''s legendary academy. According to Mestre Osvaldo Rocha de Souza, who trained in Bahia from age 13: "A minha militância na Capoeira vem desde os 13 anos, sempre estive no núcleo de bons capoeiristas na Bahia, treinei com Crispim o filho de Mestre Bimba e depois fui para a mão de Mestre Bimba que me recebeu com toda a atenção e procurou me ensinar/transmitir tudo." This testimony reveals Crispim''s role as a preparatory instructor—students would train under him before advancing to receive direct instruction from Bimba himself.

Crispim was part of his father''s inner circle of trusted companions, mentioned alongside Atenilo and Brás "Amansa Brabo" as Bimba''s most devoted followers. This places him among a small group who had particularly close relationships with the master.

In 1954, Crispim participated in the pioneering film "Vadiação," directed by Alexandre Robatto Filho, considered the pioneer of Bahian cinema. The approximately 8-minute documentary captured a historic capoeira gathering in Salvador, featuring some of the greatest capoeiristas and mestres of Bahia at the time: Mestres Bimba and Waldemar, Traíra, Caiçara, Curió, Crispim (filho de Bimba), and Nagé, among others. The film had the collaboration of artist Carybé, who portrayed important traditional Bahian manifestations in his work. It remains a valuable document for capoeira''s memory.

In 1956, Crispim was part of Bimba''s grupo folclórico that traveled to Rio de Janeiro, representing Bahian capoeira culture. This participation in folkloric presentations demonstrates his role not just as an instructor but as a performer representing his father''s academy.

Unlike his half-brother Nenel (Manoel Nascimento Machado, born 1960), who took over Bimba''s legacy after the master''s death in 1974 and founded Filhos de Bimba in 1986, Crispim''s later life is less documented. His significance lies in being part of the first generation that helped establish Capoeira Regional''s teaching methods and carried forward Bimba''s innovations during the formative decades of the style.',
  -- bio_pt
  E'Manoel dos Reis Machado Filho, conhecido como Crispim, foi o filho mais velho e discípulo de Mestre Bimba, o criador da Capoeira Regional. Nascido da primeira companheira de Bimba, Maria dos Anjos, Crispim cresceu imerso no desenvolvimento do que se tornaria o primeiro estilo de capoeira sistematicamente ensinado no Brasil.

Crispim detinha o título de contramestre e desempenhou um papel crucial no Centro de Cultura Física Regional (CCFR), a lendária academia de seu pai. Segundo Mestre Osvaldo Rocha de Souza, que treinou na Bahia desde os 13 anos: "A minha militância na Capoeira vem desde os 13 anos, sempre estive no núcleo de bons capoeiristas na Bahia, treinei com Crispim o filho de Mestre Bimba e depois fui para a mão de Mestre Bimba que me recebeu com toda a atenção e procurou me ensinar/transmitir tudo." Este testemunho revela o papel de Crispim como instrutor preparatório—os alunos treinavam com ele antes de avançar para receber instrução direta do próprio Bimba.

Crispim fazia parte do círculo íntimo de companheiros de confiança de seu pai, mencionado ao lado de Atenilo e Brás "Amansa Brabo" como os seguidores mais devotados de Bimba. Isso o coloca entre um pequeno grupo que tinha relações particularmente próximas com o mestre.

Em 1954, Crispim participou do pioneiro filme "Vadiação," dirigido por Alexandre Robatto Filho, considerado o pioneiro do cinema baiano. O documentário de aproximadamente 8 minutos capturou um encontro histórico de capoeira em Salvador, apresentando alguns dos maiores capoeiristas e mestres da Bahia da época: Mestres Bimba e Waldemar, Traíra, Caiçara, Curió, Crispim (filho de Bimba) e Nagé, entre outros. O filme teve a colaboração do artista Carybé, que retratou importantes manifestações tradicionais baianas em sua obra. Permanece um documento valioso para a memória da capoeira.

Em 1956, Crispim fez parte do grupo folclórico de Bimba que viajou ao Rio de Janeiro, representando a cultura da capoeira baiana. Esta participação em apresentações folclóricas demonstra seu papel não apenas como instrutor, mas como artista representando a academia de seu pai.

Diferentemente de seu meio-irmão Nenel (Manoel Nascimento Machado, nascido em 1960), que assumiu o legado de Bimba após a morte do mestre em 1974 e fundou a Filhos de Bimba em 1986, a vida posterior de Crispim é menos documentada. Sua importância reside em ser parte da primeira geração que ajudou a estabelecer os métodos de ensino da Capoeira Regional e levou adiante as inovações de Bimba durante as décadas formativas do estilo.',
  -- achievements_en
  E'Contramestre at Centro de Cultura Física Regional (Bimba''s academy); Appeared in "Vadiação" (1954), pioneering Bahian cinema documentary on capoeira; Member of Bimba''s grupo folclórico that traveled to Rio de Janeiro (1956); Part of Bimba''s inner circle of trusted companions; Prepared students for advanced training with Mestre Bimba',
  -- achievements_pt
  E'Contramestre no Centro de Cultura Física Regional (academia de Bimba); Participou de "Vadiação" (1954), documentário pioneiro do cinema baiano sobre capoeira; Membro do grupo folclórico de Bimba que viajou ao Rio de Janeiro (1956); Parte do círculo íntimo de companheiros de confiança de Bimba; Preparou alunos para treinamento avançado com Mestre Bimba',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Mestre Bimba was born 1899/1900. Crispim was his first son with first partner Maria dos Anjos. Assuming Bimba fathered his first child in his late teens/early twenties, Crispim was likely born around 1918-1925. By 1954 ("Vadiação" film) he would have been a mature capoeirista in his late 20s to mid-30s.

MOTHER:
- Maria dos Anjos - Mestre Bimba''s first partner

SIBLINGS (same mother):
- Edvaldo Rosa - brother, also child of Maria dos Anjos

HALF-SIBLINGS (different mothers):
- Nenel (Manoel Nascimento Machado) - born 1960, mother Berenice da Conceição Nascimento
- Formiga (Demerval dos Santos Machado) - mother Nair Lopes dos Santos
- And many others (Bimba had 10-13 registered children with nine different women)

TITLE:
- Contramestre - served as preparatory instructor at CCFR

STUDENTS:
- Mestre Osvaldo Rocha de Souza (born 1937) - trained with Crispim before advancing to Bimba

COMPANIONS:
- Atenilo (Altenísio dos Santos) - fellow inner circle member
- Brás Amansa Brabo - fellow inner circle member

MEDIA APPEARANCES:
- 1954: "Vadiação" film by Alexandre Robatto Filho (documentary, ~8 minutes)
- 1956: Rio de Janeiro trip with Bimba''s grupo folclórico

LOCATION:
- Centro de Cultura Física Regional, Salvador, Bahia

DEATH:
- Death year unknown; not well documented after 1950s',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, década):
Mestre Bimba nasceu em 1899/1900. Crispim foi seu primeiro filho com a primeira companheira Maria dos Anjos. Assumindo que Bimba teve seu primeiro filho no final da adolescência/início dos vinte anos, Crispim provavelmente nasceu por volta de 1918-1925. Em 1954 (filme "Vadiação") ele teria sido um capoeirista maduro no final dos 20 aos 30 e poucos anos.

MÃE:
- Maria dos Anjos - primeira companheira de Mestre Bimba

IRMÃOS (mesma mãe):
- Edvaldo Rosa - irmão, também filho de Maria dos Anjos

MEIO-IRMÃOS (mães diferentes):
- Nenel (Manoel Nascimento Machado) - nascido 1960, mãe Berenice da Conceição Nascimento
- Formiga (Demerval dos Santos Machado) - mãe Nair Lopes dos Santos
- E muitos outros (Bimba teve 10-13 filhos registrados com nove mulheres diferentes)

TÍTULO:
- Contramestre - serviu como instrutor preparatório no CCFR

ALUNOS:
- Mestre Osvaldo Rocha de Souza (nascido 1937) - treinou com Crispim antes de avançar para Bimba

COMPANHEIROS:
- Atenilo (Altenísio dos Santos) - membro do círculo íntimo
- Brás Amansa Brabo - membro do círculo íntimo

APARIÇÕES NA MÍDIA:
- 1954: Filme "Vadiação" de Alexandre Robatto Filho (documentário, ~8 minutos)
- 1956: Viagem ao Rio de Janeiro com o grupo folclórico de Bimba

LOCALIZAÇÃO:
- Centro de Cultura Física Regional, Salvador, Bahia

MORTE:
- Ano de morte desconhecido; não bem documentado após os anos 1950'
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

-- Source: entities/persons/inimigo-sem-tripa.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Inimigo Sem Tripa
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- As a contemporary of Pastinha (born 1889) who practiced "pure Capoeira
-- de Angola," Inimigo Sem Tripa was likely of the same generation. The
-- legendary capoeiristas Pastinha listed in 1967 were from the pre-
-- Bimba/Pastinha era - active practitioners from the late 19th to early
-- 20th century. Using 1890 as a reasonable estimate with decade precision.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Pastinha listed him among the deceased in his 1967 interview. Given
-- the generation of fighters he was grouped with, and that all were
-- confirmed dead by 1967, death likely occurred in the 1950s-1960s.
-- Using 1960 with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Inimigo Sem Tripa', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1976']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Mestre Pastinha explicitly identified Inimigo Sem Tripa as a practitioner of "pure Capoeira de Angola" alongside other legendary angoleiros of the pre-Bimba/Pastinha era. Pastinha remarked that the nicknames alone revealed "who they were, how they fought."',
  E'Capoeira de Angola tradicional. Mestre Pastinha identificou explicitamente Inimigo Sem Tripa como praticante de "capoeira de Angola pura" ao lado de outros angoleiros lendários da era pré-Bimba/Pastinha. Pastinha observou que os apelidos por si só revelavam "quem eles eram, como lutavam."',
  1890, -- birth_year: estimated from generation (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area, but unconfirmed
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Inimigo Sem Tripa was a legendary capoeirista of Salvador, Bahia, active during the late 19th or early 20th century. He is known from Mestre Pastinha''s 1967 interview with Roberto Freire for Revista Realidade, where Pastinha recalled the great capoeiristas of the past.

In that interview, conducted when Pastinha was 78 years old and nearly blind, the father of Capoeira Angola listed fifteen deceased practitioners who had practiced "the pure Capoeira de Angola as I and these boys there do until today." Inimigo Sem Tripa was among them, alongside other colorfully-named figures such as Bigode de Seda (Silk Mustache), Américo Ciência, Bugalho, Amorzinho (Little Love), Zé Bom Pé (Joe Good Foot), Chico Três Pedaços (Chico Three Pieces), Tibiriçá da Folha Grossa (Tibiriçá of the Thick Leaf), Doze Homens (Twelve Men), Vitorino Braço Torto (Vitorino Crooked Arm), Zé do U, Zé do Saco (Joe of the Sack), Bené do Correio (Bené of the Post Office), Sete Mortes (Seven Deaths), and Chico Me Dá (Give-Me Chico). Pastinha also mentioned two women among these legendary practitioners: Júlia Fogareira and Maria Homem.

Pastinha remarked of these figures: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história" (We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story). He emphasized that their nicknames revealed their character and fighting style: "From the nicknames alone you can know who they were, how they fought."

The apelido "Inimigo Sem Tripa" translates literally as "Enemy Without Guts" or "Gutless Enemy." In Portuguese, "tripa" (guts/intestines) carries connotations of courage or nerve, similar to the English expression "having guts." The nickname may have been ironic—perhaps given to a fighter so fierce he left his enemies gutless, or conversely, someone whose name belied his actual ferocity. The 1976 O Globo article quoting Pastinha''s students used the plural form "Inimigos Sem Tripa" (Gutless Enemies), suggesting either a name variation or perhaps that multiple fighters shared this designation.

In that 1976 article, Pastinha''s students stated: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga" (After Bimba died, only he remained from that generation of fighting angoleiros). This confirms that Inimigo Sem Tripa belonged to the generation of "angoleiros de briga"—fighters renowned for their combative prowess in the pre-academy era.

No further biographical details have survived—no teachers, students, specific incidents, or documented appearances. Inimigo Sem Tripa exists as a name on Pastinha''s list of the fallen, a reminder that behind each apelido stood a life now largely forgotten.',
  -- bio_pt
  E'Inimigo Sem Tripa foi um lendário capoeirista de Salvador, Bahia, ativo durante o final do século XIX ou início do século XX. Ele é conhecido pela entrevista de Mestre Pastinha de 1967 com Roberto Freire para a Revista Realidade, na qual Pastinha recordou os grandes capoeiristas do passado.

Nessa entrevista, conduzida quando Pastinha tinha 78 anos e estava quase cego, o pai da Capoeira Angola listou quinze praticantes falecidos que haviam praticado "a pura capoeira de Angola como eu e esses rapazes aí fazem até hoje." Inimigo Sem Tripa estava entre eles, ao lado de outras figuras de nomes coloridos como Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Vitorino Braço Torto, Zé do U, Zé do Saco, Bené do Correio, Sete Mortes e Chico Me Dá. Pastinha também mencionou duas mulheres entre esses praticantes lendários: Júlia Fogareira e Maria Homem.

Pastinha comentou sobre essas figuras: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história." Ele enfatizou que seus apelidos revelavam seu caráter e estilo de luta: "Só pelo apelido você conhece quem eles eram, como lutavam."

O apelido "Inimigo Sem Tripa" traduz-se literalmente como "Inimigo Sem Tripas" ou "Inimigo Covarde." Em português, "tripa" (tripas/intestinos) carrega conotações de coragem ou ousadia, semelhante à expressão inglesa "ter tripa." O apelido pode ter sido irônico—talvez dado a um lutador tão feroz que deixava seus inimigos sem tripas, ou inversamente, alguém cujo nome desmentia sua verdadeira ferocidade. O artigo do O Globo de 1976, citando os alunos de Pastinha, usou a forma plural "Inimigos Sem Tripa," sugerindo uma variação de nome ou talvez que múltiplos lutadores compartilhavam essa designação.

Naquele artigo de 1976, os alunos de Pastinha declararam: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga." Isso confirma que Inimigo Sem Tripa pertencia à geração de "angoleiros de briga"—lutadores renomados por sua destreza combativa na era pré-academia.

Nenhum detalhe biográfico adicional sobreviveu—nenhum mestre, aluno, incidente específico ou aparição documentada. Inimigo Sem Tripa existe como um nome na lista de Pastinha dos caídos, um lembrete de que por trás de cada apelido havia uma vida agora em grande parte esquecida.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade):
Contemporary of Pastinha (born 1889). As a practitioner of "pure Capoeira de Angola" listed among the legendary deceased angoleiros, likely active in the late 19th to early 20th century. Estimate based on generational placement.

DEATH YEAR ESTIMATION (1960, decade):
Pastinha listed him among the deceased in 1967 interview. All figures in this list were confirmed dead by 1967.

APELIDO ETYMOLOGY:
- "Inimigo" - literally "enemy" in Portuguese
- "Sem Tripa" - literally "without guts/intestines"
- Full meaning: "Gutless Enemy" or "Enemy Without Guts"
- Note: In Portuguese, "tripa" carries connotations of courage (similar to English "guts")
- Possible interpretations:
  1. Ironic: A fighter so fierce he left enemies gutless
  2. Literal: A fighter who showed no mercy to enemies
  3. Descriptive: Physical characteristic or fighting style

NAME VARIATION:
- "Inimigo Sem Tripa" (singular) - Pastinha 1967 interview
- "Inimigos Sem Tripa" (plural) - O Globo 1976 article
- Same person likely; variation may be transcription error or oral tradition

SOURCE: Mestre Pastinha interview with Roberto Freire, Revista Realidade, 1967.
SECONDARY SOURCE: O Globo article, April 11, 1976 (quoted in velhosmestres.com/br/pastinha-1976)

PASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

KEY QUOTE (Portuguese):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

KEY QUOTE (English translation):
"We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story."

KEY QUOTE on nicknames:
"From the nicknames alone you can know who they were, how they fought."

1976 STUDENT QUOTE:
"Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga."
(After Bimba died, only he [Pastinha] remained from that generation of fighting angoleiros.)

NO ADDITIONAL DOCUMENTATION FOUND:
- No dedicated velhosmestres.com page exists
- No Wikipedia article
- No academic papers specifically mentioning this person
- No group affiliations documented
- No teacher-student relationships documented
- No specific incidents or timeline events',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
Contemporâneo de Pastinha (nascido em 1889). Como praticante de "capoeira de Angola pura" listado entre os lendários angoleiros falecidos, provavelmente ativo no final do século XIX até início do século XX. Estimativa baseada em posicionamento geracional.

ESTIMATIVA DE ANO DE MORTE (1960, década):
Pastinha o listou entre os falecidos em entrevista de 1967. Todas as figuras nesta lista estavam confirmadamente mortas em 1967.

ETIMOLOGIA DO APELIDO:
- "Inimigo" - literalmente "inimigo" em português
- "Sem Tripa" - literalmente "sem tripas/intestinos"
- Significado completo: "Inimigo Sem Tripas" ou "Inimigo Covarde"
- Nota: Em português, "tripa" carrega conotações de coragem (similar ao inglês "guts")
- Interpretações possíveis:
  1. Irônico: Um lutador tão feroz que deixava inimigos sem tripas
  2. Literal: Um lutador que não mostrava misericórdia aos inimigos
  3. Descritivo: Característica física ou estilo de luta

VARIAÇÃO DE NOME:
- "Inimigo Sem Tripa" (singular) - Entrevista de Pastinha 1967
- "Inimigos Sem Tripa" (plural) - Artigo do O Globo 1976
- Mesma pessoa provavelmente; variação pode ser erro de transcrição ou tradição oral

FONTE: Entrevista de Mestre Pastinha com Roberto Freire, Revista Realidade, 1967.
FONTE SECUNDÁRIA: Artigo do O Globo, 11 de abril de 1976 (citado em velhosmestres.com/br/pastinha-1976)

LISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

CITAÇÃO CHAVE (Português):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

CITAÇÃO CHAVE sobre apelidos:
"Só pelo apelido você conhece quem eles eram, como lutavam."

CITAÇÃO DOS ALUNOS 1976:
"Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga."

NENHUMA DOCUMENTAÇÃO ADICIONAL ENCONTRADA:
- Não existe página dedicada no velhosmestres.com
- Nenhum artigo na Wikipedia
- Nenhum trabalho acadêmico mencionando especificamente esta pessoa
- Nenhuma afiliação a grupo documentada
- Nenhuma relação mestre-aluno documentada
- Nenhum incidente específico ou evento cronológico'
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

-- Source: entities/persons/itapoan.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Itapoan
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH DATE: August 13, 1947 - exact date confirmed by multiple
-- sources including Lalaue, Portal Capoeira, and official bios.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Raimundo César Alves de Almeida',
  'Itapoan',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.lalaue.com/learn-capoeira/mestre-itapoan/', 'https://portalcapoeira.com/capoeira/mestres/mestre-itapoan/', 'https://capoeira.fandom.com/wiki/Mestre_Itapoan', 'https://www.capoeira.ws/profile/335/']::text[],
  'regional'::genealogy.style,
  E'Pure Capoeira Regional in the tradition of Mestre Bimba. Completed all courses at the Centro de Cultura Física Regional: blue scarf (1965), red scarf (1966), and yellow scarf (1967). Champion in the absolute category at Bimba''s tournament for graduates (1970). Known for strict adherence to Bimba''s methodology and philosophy. Together with Mestre Decânio, considered one of the foremost authorities on Mestre Bimba and his Luta Regional.',
  E'Capoeira Regional pura na tradição de Mestre Bimba. Completou todos os cursos no Centro de Cultura Física Regional: lenço azul (1965), lenço vermelho (1966) e lenço amarelo (1967). Campeão na categoria absoluto no torneio de Bimba para formados (1970). Conhecido pela adesão estrita à metodologia e filosofia de Bimba. Junto com Mestre Decânio, considerado uma das maiores autoridades sobre Mestre Bimba e sua Luta Regional.',
  1947,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Raimundo César Alves de Almeida was born on August 13, 1947, in the Quintas neighborhood of Salvador, Bahia, on Rua Gonçalo Muniz. His parents were Erasmo de Almeida and Terezinha Alves de Almeida; he has brothers Fernando Alves de Almeida and Erasmo de Almeida Júnior. He gained the apelido "Itapoan" from living in Itapoã, a coastal neighborhood of Salvador where he still resides today.

On September 22, 1964, at age seventeen, Itapoan began his capoeira training at Mestre Bimba''s Centro de Cultura Física Regional at Terreiro de Jesus in Salvador. He quickly became one of Bimba''s most dedicated students. In 1965, he received the blue scarf upon completing the basic course. The following year, he earned the red scarf from the first specialization course. In 1967, he achieved the yellow scarf after finishing a second specialization course—making him fully "formado especializado" in Bimba''s system.

In 1970, Mestre Bimba organized a tournament for his graduate students. Itapoan emerged as champion in the absolute category. The following year, he was both absolute champion and doubles champion at the Bahian University Games of 1971.

Itapoan trained continuously with Mestre Bimba from 1964 until 1972, when the aging master decided to leave Salvador for Goiânia—a move that would end in tragedy. When Bimba left, Itapoan and his colleague Hélio Campos (Mestre Xaréu), both orphaned of their teacher, resolved to continue the work. They found a location, students began appearing, and on November 13, 1972, they founded the Ginga Associação de Capoeira in Salvador.

The goal of Ginga was explicit: to preserve the Capoeira Regional of Mestre Bimba in its pure form. They succeeded. Over the following decades, Ginga became a reference point in the capoeira world, distinguished by its emphasis on research, lectures, courses, and strong training.

Beyond capoeira, Itapoan pursued a parallel career in dentistry. He earned his degree in 1975 and became a dental surgeon and adjunct professor at the Universidade Federal da Bahia, teaching endodontics. He served as vice-president of the Restorative Dentistry department. He retired as professor but continued practicing.

Itapoan''s contributions to capoeira extend far beyond teaching. In 1980, he founded the Associação Brasileira dos Professores de Capoeira (ABPC), serving as its president. In 1983, he helped establish the Federação Bahiana de Capoeira and became part of its Council of Masters.

As an author, Itapoan has produced the most significant body of work documenting Mestre Bimba and Capoeira Regional. His first book, "Bimba, O Perfil do Mestre" (1982), was the first comprehensive biography of the founder. He followed this with "Atenilo, o Relâmpago da Capoeira Regional" (1988), preserving the testimony of Bimba''s oldest student. "A Bibliografia Crítica da Capoeira" (1993) became an essential scholarly reference. "A Saga do Mestre Bimba" (1994, English edition 2006) expanded on Bimba''s story. "Capoeira: Retalhos da Roda" (2005) collected additional historical fragments. Most recently, "Capoeira Regional na Imprensa" (2024), co-authored with Mestre Cego, documented Regional''s media coverage.

He also founded and edited the Revista Negaça, an informative bulletin of Ginga that reached at least four volumes. The first edition was launched on November 13, 1992, celebrating 20 years of Ginga.

In 1966, Itapoan composed "A Palma de Bimba," a corrido celebrating his master''s teaching methods—particularly his insistence on correct clapping rhythm: "A palma estava errada / Bimba parou outra vez / Bate essas palmas direito / A palma de Bimba é um dois três."

Itapoan possesses an archive of more than 30,000 documents related to capoeira—likely the largest private collection in existence.

In 1990 (some sources say 1992), he was awarded the Medalha do Mérito Desportivo Nacional (National Sports Merit Medal) by the Brazilian Ministry of Education, nominated by CND President Manoel Tubino, approved by MEC and Minister Carlos Santana, and authorized by President José Sarney.

In 1996, together with Mestre Xaréu, he brought Ginga to the United States through his student Mestre Kiki da Bahia, who founded Ginga Associação de Capoeira USA and became the chief representative of Capoeira Regional in the United States.

In October 2024, the Aracaju City Council awarded Itapoan the Título de Cidadania Aracajuana (Title of Citizenship of Aracaju) for his contributions to capoeira in Sergipe since his arrival there in 1980.

Alongside Mestre Decânio, Itapoan is recognized as one of the foremost living authorities on Mestre Bimba and his Luta Regional. Under his direction, Ginga Associação de Capoeira has remained for over fifty years one of the most authentic schools of Capoeira Regional in the world.',
  -- bio_pt
  E'Raimundo César Alves de Almeida nasceu em 13 de agosto de 1947, no bairro das Quintas em Salvador, Bahia, na Rua Gonçalo Muniz. Seus pais eram Erasmo de Almeida e Terezinha Alves de Almeida; tem os irmãos Fernando Alves de Almeida e Erasmo de Almeida Júnior. Ganhou o apelido "Itapoan" por morar em Itapoã, um bairro litorâneo de Salvador onde ainda reside hoje.

Em 22 de setembro de 1964, aos dezessete anos, Itapoan começou seu treinamento de capoeira no Centro de Cultura Física Regional de Mestre Bimba, no Terreiro de Jesus em Salvador. Rapidamente se tornou um dos alunos mais dedicados de Bimba. Em 1965, recebeu o lenço azul ao completar o curso básico. No ano seguinte, conquistou o lenço vermelho do primeiro curso de especialização. Em 1967, obteve o lenço amarelo após concluir o segundo curso de especialização—tornando-se plenamente "formado especializado" no sistema de Bimba.

Em 1970, Mestre Bimba organizou um torneio para seus alunos formados. Itapoan saiu campeão na categoria absoluto. No ano seguinte, foi campeão absoluto e campeão de duplas nos Jogos Universitários Baianos de 1971.

Itapoan treinou continuamente com Mestre Bimba de 1964 até 1972, quando o mestre idoso decidiu deixar Salvador por Goiânia—uma mudança que terminaria em tragédia. Quando Bimba partiu, Itapoan e seu colega Hélio Campos (Mestre Xaréu), ambos órfãos de seu professor, resolveram continuar o trabalho. Encontraram um local, alunos começaram a aparecer, e em 13 de novembro de 1972, fundaram a Ginga Associação de Capoeira em Salvador.

O objetivo da Ginga era explícito: preservar a Capoeira Regional de Mestre Bimba em sua forma pura. Eles conseguiram. Ao longo das décadas seguintes, a Ginga se tornou uma referência no mundo da capoeira, distinguindo-se pela ênfase em pesquisa, palestras, cursos e treinamento forte.

Além da capoeira, Itapoan seguiu uma carreira paralela na odontologia. Formou-se em 1975 e tornou-se cirurgião-dentista e professor adjunto da Universidade Federal da Bahia, ensinando endodontia. Atuou como vice-presidente do departamento de Odontologia Restauradora. Aposentou-se como professor, mas continuou praticando.

As contribuições de Itapoan para a capoeira vão muito além do ensino. Em 1980, fundou a Associação Brasileira dos Professores de Capoeira (ABPC), atuando como seu presidente. Em 1983, ajudou a estabelecer a Federação Bahiana de Capoeira e tornou-se membro de seu Conselho de Mestres.

Como autor, Itapoan produziu o mais significativo corpo de trabalho documentando Mestre Bimba e a Capoeira Regional. Seu primeiro livro, "Bimba, O Perfil do Mestre" (1982), foi a primeira biografia abrangente do fundador. Seguiu com "Atenilo, o Relâmpago da Capoeira Regional" (1988), preservando o testemunho do aluno mais antigo de Bimba. "A Bibliografia Crítica da Capoeira" (1993) tornou-se uma referência acadêmica essencial. "A Saga do Mestre Bimba" (1994, edição inglesa 2006) expandiu a história de Bimba. "Capoeira: Retalhos da Roda" (2005) reuniu fragmentos históricos adicionais. Mais recentemente, "Capoeira Regional na Imprensa" (2024), em coautoria com Mestre Cego, documentou a cobertura midiática da Regional.

Também fundou e editou a Revista Negaça, um boletim informativo da Ginga que alcançou pelo menos quatro volumes. A primeira edição foi lançada em 13 de novembro de 1992, celebrando 20 anos da Ginga.

Em 1966, Itapoan compôs "A Palma de Bimba," um corrido celebrando os métodos de ensino de seu mestre—particularmente sua insistência no ritmo correto das palmas: "A palma estava errada / Bimba parou outra vez / Bate essas palmas direito / A palma de Bimba é um dois três."

Itapoan possui um arquivo de mais de 30.000 documentos relacionados à capoeira—provavelmente a maior coleção privada existente.

Em 1990 (algumas fontes dizem 1992), recebeu a Medalha do Mérito Desportivo Nacional do Ministério da Educação do Brasil, indicado pelo presidente do CND Manoel Tubino, aprovado pelo MEC e pelo ministro Carlos Santana, e autorizado pelo presidente José Sarney.

Em 1996, junto com Mestre Xaréu, levou a Ginga para os Estados Unidos através de seu aluno Mestre Kiki da Bahia, que fundou a Ginga Associação de Capoeira USA e se tornou o principal representante da Capoeira Regional nos Estados Unidos.

Em outubro de 2024, a Câmara Municipal de Aracaju concedeu a Itapoan o Título de Cidadania Aracajuana por suas contribuições à capoeira em Sergipe desde sua chegada lá em 1980.

Ao lado de Mestre Decânio, Itapoan é reconhecido como uma das maiores autoridades vivas sobre Mestre Bimba e sua Luta Regional. Sob sua direção, a Ginga Associação de Capoeira permaneceu por mais de cinquenta anos como uma das escolas mais autênticas de Capoeira Regional do mundo.',
  -- achievements_en
  E'Champion in absolute category at Mestre Bimba''s graduate tournament (1970); Absolute champion and doubles champion of Bahian University Games (1971); Co-founder of Ginga Associação de Capoeira (1972); Founder of Associação Brasileira dos Professores de Capoeira (ABPC, 1980); Co-founder of Federação Bahiana de Capoeira (1983); Medalha do Mérito Desportivo Nacional (1990); Author of six books on capoeira including first comprehensive biography of Mestre Bimba; Composed "A Palma de Bimba" corrido (1966); Retired professor of endodontics at UFBA; Archive of 30,000+ capoeira documents; Three-time Bahian capoeira champion as coach (1976, 1977, 1978); Title of Citizenship of Aracaju (2024)',
  -- achievements_pt
  E'Campeão na categoria absoluto no torneio de formados de Mestre Bimba (1970); Campeão absoluto e campeão de duplas dos Jogos Universitários Baianos (1971); Cofundador da Ginga Associação de Capoeira (1972); Fundador da Associação Brasileira dos Professores de Capoeira (ABPC, 1980); Cofundador da Federação Bahiana de Capoeira (1983); Medalha do Mérito Desportivo Nacional (1990); Autor de seis livros sobre capoeira incluindo primeira biografia abrangente de Mestre Bimba; Compôs corrido "A Palma de Bimba" (1966); Professor aposentado de endodontia da UFBA; Arquivo de mais de 30.000 documentos de capoeira; Tricampeão baiano de capoeira como técnico (1976, 1977, 1978); Título de Cidadania Aracajuana (2024)',
  -- notes_en
  E'BIRTH DATE: August 13, 1947 - exact date confirmed by multiple sources.
BIRTH PLACE: Quintas neighborhood, Salvador, on Rua Gonçalo Muniz.

PARENTS:
- Father: Erasmo de Almeida
- Mother: Terezinha Alves de Almeida
- Brothers: Fernando Alves de Almeida, Erasmo de Almeida Júnior

TRAINING TIMELINE AT CCFR (Centro de Cultura Física Regional):
- September 22, 1964: Began training (age 17)
- 1965: Blue scarf (batizado/basic course completion)
- 1966: Red scarf (first specialization)
- 1967: Yellow scarf (second specialization)
- 1970: Champion at Bimba''s graduate tournament (absolute category)
- 1971: Absolute + doubles champion at Bahian University Games
- 1964-1972: Continuous training with Bimba (8 years)

GINGA ASSOCIAÇÃO DE CAPOEIRA:
- Founded: November 13, 1972
- Co-founders: Itapoan and Hélio Campos (Mestre Xaréu)
- Brought to USA 1996 by Mestre Kiki da Bahia

BOOKS PUBLISHED:
1. "Bimba, O Perfil do Mestre" (1982) - first book
2. "Atenilo, o Relâmpago da Capoeira Regional" (1988)
3. "A Bibliografia Crítica da Capoeira" (1993)
4. "A Saga do Mestre Bimba" (1994, English 2006)
5. "Capoeira: Retalhos da Roda" (2005, some sources say 2019)
6. "Capoeira Regional na Imprensa" (2024, with Mestre Cego)
7. Revista Negaça (4+ volumes, first: Nov 13, 1992)

MEDAL DATE DISCREPANCY:
- Most sources say 1990 for Medalha do Mérito Desportivo Nacional
- One source says 1992
- Using 1990 as primary

ORGANIZATIONS:
- ABPC (Associação Brasileira dos Professores de Capoeira) - founded 1980, president
- Federação Bahiana de Capoeira - co-founded 1983, Council of Masters member

STUDENTS (notable):
- Mestre Kiki da Bahia (brought Ginga to USA 1996)

PROFESSION:
- Dental surgeon
- Adjunct Professor at UFBA (endodontics)
- Vice-president of Restorative Dentistry department
- Degree earned: 1975
- Currently retired from academia but still practicing

ARCHIVE: 30,000+ documents on capoeira (private collection)

ALONGSIDE MESTRE DECÂNIO: Both considered foremost authorities on Mestre Bimba and Luta Regional.',
  -- notes_pt
  E'DATA DE NASCIMENTO: 13 de agosto de 1947 - data exata confirmada por múltiplas fontes.
LOCAL DE NASCIMENTO: Bairro das Quintas, Salvador, na Rua Gonçalo Muniz.

PAIS:
- Pai: Erasmo de Almeida
- Mãe: Terezinha Alves de Almeida
- Irmãos: Fernando Alves de Almeida, Erasmo de Almeida Júnior

LINHA DO TEMPO DE TREINAMENTO NO CCFR (Centro de Cultura Física Regional):
- 22 de setembro de 1964: Início do treinamento (17 anos)
- 1965: Lenço azul (batizado/conclusão do curso básico)
- 1966: Lenço vermelho (primeira especialização)
- 1967: Lenço amarelo (segunda especialização)
- 1970: Campeão no torneio de formados de Bimba (categoria absoluto)
- 1971: Campeão absoluto + duplas nos Jogos Universitários Baianos
- 1964-1972: Treinamento contínuo com Bimba (8 anos)

GINGA ASSOCIAÇÃO DE CAPOEIRA:
- Fundada: 13 de novembro de 1972
- Cofundadores: Itapoan e Hélio Campos (Mestre Xaréu)
- Levada para EUA em 1996 por Mestre Kiki da Bahia

LIVROS PUBLICADOS:
1. "Bimba, O Perfil do Mestre" (1982) - primeiro livro
2. "Atenilo, o Relâmpago da Capoeira Regional" (1988)
3. "A Bibliografia Crítica da Capoeira" (1993)
4. "A Saga do Mestre Bimba" (1994, inglês 2006)
5. "Capoeira: Retalhos da Roda" (2005, algumas fontes dizem 2019)
6. "Capoeira Regional na Imprensa" (2024, com Mestre Cego)
7. Revista Negaça (4+ volumes, primeiro: 13 nov 1992)

DISCREPÂNCIA DA DATA DA MEDALHA:
- A maioria das fontes diz 1990 para Medalha do Mérito Desportivo Nacional
- Uma fonte diz 1992
- Usando 1990 como principal

ORGANIZAÇÕES:
- ABPC (Associação Brasileira dos Professores de Capoeira) - fundada 1980, presidente
- Federação Bahiana de Capoeira - cofundou 1983, membro do Conselho de Mestres

ALUNOS (notáveis):
- Mestre Kiki da Bahia (levou Ginga para EUA em 1996)

PROFISSÃO:
- Cirurgião-dentista
- Professor Adjunto na UFBA (endodontia)
- Vice-presidente do departamento de Odontologia Restauradora
- Diploma obtido: 1975
- Atualmente aposentado da academia mas ainda praticando

ARQUIVO: Mais de 30.000 documentos sobre capoeira (coleção privada)

AO LADO DE MESTRE DECÂNIO: Ambos considerados maiores autoridades sobre Mestre Bimba e Luta Regional.'
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

-- Source: entities/persons/julia-fogareira.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Júlia Fogareira
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1875-1890, decade precision):
-- Pastinha testified in 1969 that between 1902-1911, famous women
-- capoeiristas including Júlia Fogareira were practicing. If she
-- was an adult practitioner (20-35) during that period, she would
-- have been born approximately 1867-1891. Using midpoint ~1880
-- with decade precision. Listed alongside fighters like Besouro
-- (1895-1924) and Bigode de Seda, suggesting same generation.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Júlia Fogareira', NULL, NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://velhosmestres.com/br/pastinha-1976']::text[],
  'angola'::genealogy.style, NULL, NULL,
  1880, 'decade'::genealogy.date_precision, 'Salvador, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Júlia Fogareira was one of the rare documented female capoeiristas of early twentieth-century Bahia. Between 1902 and 1911, Salvador witnessed what Mestre Pastinha described as "a never-seen spectacle" of female capoeira mestras who were "as agile and able as the men." Pastinha listed Júlia among the famous women practitioners of this era, alongside Maria Homem, Palmeirona, and Maria Pernambucana.\n\nThese women learned capoeira not from a single source but from multiple masters available during that period, including a young Pastinha himself. The era was reportedly "a tough time for the Don Juans and for the police," suggesting these women were formidable fighters who commanded respect in Salvador''s streets.\n\nWhen asked about how women of that era practiced in their restrictive clothing, Pastinha explained their practical solution: "At that time dresses reached the ground. The women tore their skirts on the sides. They connected the rear part with the front one, putting them on their waist with a string, making a sort of pants." This adaptation was, as Pastinha noted, "enough to play capoeira with any guy."\n\nIn 1976, when O Globo newspaper interviewed Pastinha about the generation of "angoleiros de briga" (fighting angoleiros) who came before him, he listed Júlia Fogareira among legendary practitioners including Bigode de Seda, Bugalho, Américo Ciência, Besouro, Tibiriçá, Amorzinho, Três Pedaços, Doze Homens, Inimigos Sem Tripa, Zé do U, Sete Mortes, Chico Me Dá, and Maria Homem. That Júlia and Maria Homem were the only two women included in this roster of renowned fighters speaks to their exceptional skill and reputation.\n\nThe apelido "Fogareira" derives from "fogo" (fire), suggesting either a fiery temperament or an intense, passionate style of play in the roda. Some sources also list her as "Júlia Fogareiro," a variant spelling. Her inclusion among the legendary pre-modern capoeiristas places her in the same category as figures who became folklore—street fighters whose names endured through oral tradition even as written records remained scarce.\n\nLike most women capoeiristas of her era, little concrete biographical information survives beyond Pastinha''s testimonies. Academic research notes that "it is still impossible to be certain of their existence and there are confusions regarding names, due to lack of written documentation." What is certain is that Pastinha consistently remembered these women among the greatest capoeiristas he had ever known, and that their presence challenges the common assumption that early capoeira was an exclusively male practice.',
  E'Júlia Fogareira foi uma das raras capoeiristas documentadas do início do século XX na Bahia. Entre 1902 e 1911, Salvador testemunhou o que Mestre Pastinha descreveu como "um espetáculo ímpar" de verdadeiras mestras de capoeira Angola, "tão ágeis e hábeis quanto os homens." Pastinha listou Júlia entre as famosas praticantes desta era, ao lado de Maria Homem, Palmeirona e Maria Pernambucana.\n\nEssas mulheres aprenderam capoeira não de uma única fonte, mas de vários mestres disponíveis durante aquele período, incluindo o próprio Pastinha ainda jovem. A época foi supostamente "dura para os Don Juans e para a polícia," sugerindo que essas mulheres eram lutadoras formidáveis que comandavam respeito nas ruas de Salvador.\n\nQuando perguntado sobre como as mulheres daquela época praticavam com suas roupas restritivas, Pastinha explicou sua solução prática: "Naquela época os vestidos arrastavam no chão. As mulheres rasgavam suas saias nos lados. Uniam a parte de trás com a frente, prendendo-as com uma prezilha na cintura, formando uma espécie de calção." Essa adaptação era, como Pastinha observou, "suficiente para jogar capoeira com qualquer homem."\n\nEm 1976, quando o jornal O Globo entrevistou Pastinha sobre a geração de "angoleiros de briga" que vieram antes dele, ele listou Júlia Fogareira entre praticantes lendários incluindo Bigode de Seda, Bugalho, Américo Ciência, Besouro, Tibiriçá, Amorzinho, Três Pedaços, Doze Homens, Inimigos Sem Tripa, Zé do U, Sete Mortes, Chico Me Dá e Maria Homem. Que Júlia e Maria Homem foram as únicas duas mulheres incluídas nesta lista de lutadores renomados fala de sua habilidade excepcional e reputação.\n\nO apelido "Fogareira" deriva de "fogo," sugerindo seja um temperamento ardente ou um estilo de jogo intenso e apaixonado na roda. Algumas fontes também a listam como "Júlia Fogareiro," uma variação de grafia. Sua inclusão entre os lendários capoeiristas pré-modernos a coloca na mesma categoria que figuras que se tornaram folclore—lutadores de rua cujos nomes perduraram através da tradição oral mesmo quando registros escritos permaneceram escassos.\n\nComo a maioria das mulheres capoeiristas de sua era, pouca informação biográfica concreta sobrevive além dos testemunhos de Pastinha. Pesquisas acadêmicas observam que "ainda é impossível ter certeza de sua existência e há confusões em relação aos nomes, devido à falta de documentação escrita." O que é certo é que Pastinha consistentemente lembrava dessas mulheres entre os maiores capoeiristas que já conheceu, e que sua presença desafia a suposição comum de que a capoeira antiga era uma prática exclusivamente masculina.',
  NULL, NULL,
  E'BIRTH YEAR ESTIMATION (1880, decade):\nPastinha testified in 1969 that between 1902-1911, famous women capoeiristas including Júlia Fogareira were practicing. If she was an adult practitioner (20-35) during peak activity, born approximately 1867-1891. Using 1880 as midpoint.\n\nNAME VARIATION:\n- "Júlia Fogareira" - velhosmestres.com, O Globo 1976 (majority)\n- "Júlia Fogareiro" - some French academic sources\n- "Fogareira" sometimes appears as standalone apelido\n\nMEDIA APPEARANCES:\n- 1967: Testimony by Mestre Pastinha (Museu da Imagem e do Som) - mentioned among legendary practitioners\n- 1969: A Tarde newspaper article (Feb 24, 1969) - listed among famous women capoeiristas 1902-1911\n- 1976: O Globo interview with Pastinha - included in list of angoleiros de briga\n\nTEACHERS:\n- Mestre Pastinha (among others) - "learned the art not only with Mestre Pastinha but also with other masters of the time"\n- Multiple unspecified masters of the 1900-1911 era\n\nCONTEMPORARIES:\n- Maria Homem (fellow female capoeirista)\n- Palmeirona (fellow female capoeirista)\n- Maria Pernambucana (fellow female capoeirista)\n- Bigode de Seda, Bugalho, Américo Ciência, Besouro, Tibiriçá, Amorzinho, Três Pedaços, Doze Homens, Inimigos Sem Tripa, Zé do U, Sete Mortes, Chico Me Dá (male contemporaries)\n\nHISTORICAL CONTEXT:\nWomen in early 20th century capoeira had to break gender boundaries to enter spaces denied to them. Some had to disguise themselves as men. The fact that Pastinha remembered these women by name, decades later, speaks to their exceptional impact.\n\nSOURCE QUALITY:\n- Primary: Mestre Pastinha interviews (1967, 1969, 1976) - high reliability\n- Secondary: Academic papers note uncertainty about exact biographical details due to oral tradition transmission\n- Documentation gap: No known photographs, arrest records, or independent contemporary mentions',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1880, década):\nPastinha testemunhou em 1969 que entre 1902-1911, famosas mulheres capoeiristas incluindo Júlia Fogareira estavam praticando. Se ela era uma praticante adulta (20-35) durante o pico de atividade, nascida aproximadamente 1867-1891. Usando 1880 como ponto médio.\n\nVARIAÇÃO DE NOME:\n- "Júlia Fogareira" - velhosmestres.com, O Globo 1976 (maioria)\n- "Júlia Fogareiro" - algumas fontes acadêmicas francesas\n- "Fogareira" às vezes aparece como apelido independente\n\nAPARIÇÕES NA MÍDIA:\n- 1967: Testemunho de Mestre Pastinha (Museu da Imagem e do Som) - mencionada entre praticantes lendários\n- 1969: Artigo do jornal A Tarde (24 fev 1969) - listada entre famosas mulheres capoeiristas 1902-1911\n- 1976: Entrevista do O Globo com Pastinha - incluída na lista de angoleiros de briga\n\nMESTRES:\n- Mestre Pastinha (entre outros) - "aprenderam a arte não só com Mestre Pastinha mas também com outros mestres da época"\n- Múltiplos mestres não especificados da era 1900-1911\n\nCONTEMPORÂNEOS:\n- Maria Homem (companheira capoeirista)\n- Palmeirona (companheira capoeirista)\n- Maria Pernambucana (companheira capoeirista)\n- Bigode de Seda, Bugalho, Américo Ciência, Besouro, Tibiriçá, Amorzinho, Três Pedaços, Doze Homens, Inimigos Sem Tripa, Zé do U, Sete Mortes, Chico Me Dá (contemporâneos masculinos)\n\nCONTEXTO HISTÓRICO:\nMulheres na capoeira do início do século XX tiveram que quebrar fronteiras de gênero para entrar em espaços que lhes eram negados. Algumas tiveram que se disfarçar de homens. O fato de Pastinha lembrar dessas mulheres pelo nome, décadas depois, fala de seu impacto excepcional.\n\nQUALIDADE DAS FONTES:\n- Primária: Entrevistas de Mestre Pastinha (1967, 1969, 1976) - alta confiabilidade\n- Secundária: Artigos acadêmicos notam incerteza sobre detalhes biográficos exatos devido à transmissão por tradição oral\n- Lacuna documental: Sem fotografias conhecidas, registros de prisão, ou menções contemporâneas independentes'
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

-- Source: entities/persons/pintor.sql (NEW)
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

On February 2, 1991, Mestre Pintor founded Grupo Bantus Capoeira (GBC) in Belo Horizonte with the objective of strengthening and transmitting Brazilian cultural manifestations. The name "Bantus" honors the Bantu peoples of Africa—the "-ntu" suffix meaning "human" and the "Ba-" prefix indicating plurality, together signifying "the people." This name acknowledges the African roots of capoeira and Brazilian culture.

Under his leadership, Grupo Bantus has expanded far beyond Minas Gerais. Today the organization has schools throughout Belo Horizonte and the state, as well as international branches in Japan, Australia, Malaysia, Singapore, Thailand, Indonesia, and Israel. Mestre Pintor travels worldwide to share his knowledge, having taught across Brazil, South America, Australia, Asia, Europe, and the Middle East over his 40+ years of practice.

Beyond capoeira, Mestre Pintor is recognized as an expert in Maculelê (the stick-fighting dance), Samba de Roda (the traditional circle samba of Bahia), and Forró (northeastern Brazilian partner dance). Grupo Bantus also incorporates Puxada de Rede (the fisherman''s net-pulling ritual) and percussion ensembles into its cultural programming.

The group maintains active social projects in Brazil, including participation in "Fica Vivo" and "Escola Integrada" programs. The headquarters remains in Belo Horizonte at Rua Rio Grande do Norte, 1501 - Funcionários.',
  -- bio_pt
  E'Paulo César Leite dos Santos, conhecido como Mestre Pintor nos círculos de capoeira, é o fundador e diretor internacional do Grupo Bantus Capoeira. Nascido em Belo Horizonte, iniciou sua jornada na capoeira nos bairros de Santa Tereza e Floresta, jogando com amigos nas ruas da capital mineira.

Na adolescência, Pintor fez uma viagem decisiva à Bahia para aprofundar sua compreensão da capoeira sob a orientação dos lendários mestres daquela geração. Treinou com uma impressionante lista de mestres: Atenilo (aluno devoto de Bimba por 45 anos), Waldemar (o icônico mestre de Angola da Liberdade), Canjiquinha ("A Alegria da Capoeira"), Curió (discípulo de Pastinha), Caiçara (mestre da bengala), Gigante/Bigodinho (aluno de Waldemar), João Grande (lenda viva de Pastinha), Boa Gente (campeão de MMA da Bahia), Bom Cabrito (aluno de Cobrinha Verde e Gato Preto), Medicina, e Papo de Santo Amaro. Essa amplitude de treinamento o expôs tanto às tradições Regional quanto Angola durante seu período mais vibrante.

Após anos aprendendo com esses mestres, Pintor estabeleceu-se no ensino e prática de Mestre João Pequeno de Pastinha em Salvador. João Pequeno, junto com João Grande, era um dos "dois alunos mais preparados" do próprio Mestre Pastinha, tornando Pintor um herdeiro direto da linhagem Angola de Pastinha.

Em 1989, Mestre João Pequeno graduou Pintor como Mestre durante uma cerimônia com o Grupo Macaco na Escola de Educação Física em Belo Horizonte. Alguns anos depois, recebeu reconhecimento adicional como Mestre de Capoeira Angola especificamente.

Em 2 de fevereiro de 1991, Mestre Pintor fundou o Grupo Bantus Capoeira (GBC) em Belo Horizonte com o objetivo de fortalecer e transmitir as manifestações culturais brasileiras. O nome "Bantus" homenageia os povos Bantu da África—o sufixo "-ntu" significando "humano" e o prefixo "Ba-" indicando pluralidade, juntos significando "o povo." Este nome reconhece as raízes africanas da capoeira e da cultura brasileira.

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

-- Source: entities/persons/sete-mortes.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Sete Mortes
-- Generated: 2025-12-18
-- ============================================================
-- Full name: Inocêncio Sete Mortes
-- Born 1883 in Juazeiro, sertão da Bahia - DOCUMENTED
-- Active as guarda civil 1ª classe during Gov. Antônio Moniz
-- administration (1916-1920) and as political capanga.
-- Active as capoeirista in Salvador during second decade of Republic.
-- Died before Pastinha's 1967 interview.
--
-- DEATH YEAR ESTIMATION (1950, decade precision):
-- No death date documented. Pastinha listed him among deceased
-- angoleiros in 1967. Born 1883, if active until 1920s-1930s,
-- likely died mid-century. Using decade precision: 1950.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Inocêncio Sete Mortes', -- name
  'Sete Mortes', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967', 'https://books.scielo.org/id/pvm8g']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Sete Mortes among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview. Known as a skilled handler of the navalha (straight razor), alongside Caboclinho and Noca de Jacó.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Sete Mortes entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967. Conhecido como hábil manejador da navalha, ao lado de Caboclinho e Noca de Jacó.',
  1883, -- birth_year: documented
  'year'::genealogy.date_precision, -- birth_year_precision
  'Juazeiro, Bahia', -- birth_place: documented from sertão
  1950, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Inocêncio Sete Mortes was a capoeirista and political enforcer in Salvador, Bahia, whose life bridged the worlds of street fighting, politics, and capoeira during the First Republic. Born in 1883 in Juazeiro, in the sertão (backlands) of Bahia, he would become known as "o temível facínora" (the fearsome ruffian)—a reputation that placed him among the most notorious figures of Salvador''s early 20th century underworld.\n\nSete Mortes was very active in the world of capoeiragem in Salvador during the second decade of the Republic (1910s). His activities, however, were not restricted to capoeira. During the administration of Governor Antônio Moniz Sodré de Aragão (1916-1920), he served as a guarda civil de 1ª classe (first-class civil guard) and was accused of being a capanga—a political enforcer—for the governor.\n\nHistorical analysis clarifies an error in popular fiction: while Jorge Amado''s novels suggested Sete Mortes worked with the notorious police chief Pedro de Azevedo Gordilho ("Pedrito"), documentation shows his actual patron was Police Chief Álvaro José de Cova. A request made by Cova to Dr. Magalhães to allow Sete Mortes and his family to continue living in an old building at Mont Serrat explicitly revealed this relationship with Governor Moniz and his police chief.\n\nSete Mortes was among the capoeiristas known for their skill with the navalha (straight razor), alongside Caboclinho and Noca de Jacó. In an era when many capoeiristas supplemented their fighting techniques with blades, this skill added to his fearsome reputation. He is featured in "Mestres e Capoeiras famosos da Bahia" (2009) with the subtitle "O temível facínora!"—indicating his story was considered important enough to preserve in the historical record.\n\nIn 1967, at 78 years old and nearly blind, Mestre Pastinha spoke with journalist Roberto Freire for Revista Realidade about the great capoeiristas of the past. He listed Sete Mortes among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, and others. Pastinha noted: "Cada nome destes é uma história"—each of these names is a story.',
  -- bio_pt
  E'Inocêncio Sete Mortes foi um capoeirista e capanga político em Salvador, Bahia, cuja vida atravessou os mundos da briga de rua, política e capoeira durante a Primeira República. Nascido em 1883 em Juazeiro, no sertão da Bahia, ele se tornaria conhecido como "o temível facínora"—uma reputação que o colocou entre as figuras mais notórias do submundo soteropolitano do início do século XX.\n\nSete Mortes foi bastante ativo no mundo da capoeiragem em Salvador durante a segunda década da República (anos 1910). Suas atividades, no entanto, não se restringiam à capoeira. Durante a administração do Governador Antônio Moniz Sodré de Aragão (1916-1920), ele serviu como guarda civil de 1ª classe e era acusado de ser capanga do governador.\n\nA análise histórica esclarece um erro na ficção popular: enquanto os romances de Jorge Amado sugeriam que Sete Mortes trabalhava com o notório chefe de polícia Pedro de Azevedo Gordilho ("Pedrito"), a documentação mostra que seu verdadeiro patrono era o Chefe de Polícia Álvaro José de Cova. Um requerimento feito por Cova ao Dr. Magalhães para permitir que Sete Mortes e sua família continuassem morando em um velho prédio em Mont Serrat explicitou essa relação com o Governador Moniz e seu chefe de polícia.\n\nSete Mortes estava entre os capoeiristas conhecidos por sua habilidade com a navalha, ao lado de Caboclinho e Noca de Jacó. Em uma era em que muitos capoeiristas suplementavam suas técnicas de luta com lâminas, essa habilidade aumentava sua reputação temível. Ele é apresentado em "Mestres e Capoeiras famosos da Bahia" (2009) com o subtítulo "O temível facínora!"—indicando que sua história foi considerada importante o suficiente para ser preservada no registro histórico.\n\nEm 1967, aos 78 anos e quase cego, Mestre Pastinha conversou com o jornalista Roberto Freire para a Revista Realidade sobre os grandes capoeiristas do passado. Ele listou Sete Mortes entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, e outros. Pastinha observou: "Cada nome destes é uma história."',
  -- achievements_en
  E'Featured in "Mestres e Capoeiras famosos da Bahia" with dedicated chapter "O temível facínora!" (The fearsome ruffian)\nKnown as skilled handler of the navalha (straight razor)\nListed by Mestre Pastinha among practitioners of "pure Capoeira de Angola"',
  -- achievements_pt
  E'Apresentado em "Mestres e Capoeiras famosos da Bahia" com capítulo dedicado "O temível facínora!"\nConhecido como hábil manejador da navalha\nListado por Mestre Pastinha entre praticantes de "capoeira de Angola pura"',
  -- notes_en
  E'BIRTH YEAR (1883, year precision):\nDocumented as born in 1883 in Juazeiro, sertão da Bahia. Source: "Capoeira, identidade e gênero: ensaios sobre a história social da capoeira no Brasil" (EDUFBA, 2009), chapter "Pedrito, Sete Mortes e a ficção amadiana" by Oliveira & Leal.\n\nDEATH YEAR ESTIMATION (1950, decade):\nConfirmed dead by Pastinha''s 1967 interview. Born 1883, active through 1910s-1920s. Likely died mid-century.\n\nPOLITICAL CONNECTIONS:\n- Governor Antônio Moniz Sodré de Aragão (1916-1920): served as guarda civil 1ª classe and capanga\n- Police Chief Álvaro José de Cova: patron who defended his housing at Mont Serrat\n- NOT Pedrito as Jorge Amado''s fiction suggested\n\nOCCUPATIONAL CONTEXT:\n"Guarda civil de 1ª classe" - first-class civil guard, a position that provided cover for political enforcement work during electoral disputes.\n\nNAVALHA SKILL:\nListed among capoeiristas skilled with the navalha (straight razor) alongside Caboclinho and Noca de Jacó.\n\nAPELIDO:\n"Sete Mortes" means "Seven Deaths" in Portuguese. This fearsome nickname likely relates to his reputation as a dangerous fighter, though no specific explanation of its origin has been documented.\n\nJORGE AMADO FICTION:\nAmado''s novels (Tenda dos Milagres, Jubiabá) portrayed capoeiristas in political contexts, but erroneously linked Sete Mortes to Pedrito. Historical research clarifies the actual connection was to Álvaro Cova.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nOTHER POLITICAL CAPANGAS (contemporaries):\nSamuel da Calçada, Duquinha, Escalvino (Luís Escalvino), Estevinho, Sebastião de Souza, Pedro Mineiro',
  -- notes_pt
  E'ANO DE NASCIMENTO (1883, precisão de ano):\nDocumentado como nascido em 1883 em Juazeiro, sertão da Bahia. Fonte: "Capoeira, identidade e gênero: ensaios sobre a história social da capoeira no Brasil" (EDUFBA, 2009), capítulo "Pedrito, Sete Mortes e a ficção amadiana" de Oliveira & Leal.\n\nESTIMATIVA DE ANO DE MORTE (1950, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Nascido em 1883, ativo nos anos 1910-1920. Provavelmente morreu em meados do século.\n\nCONEXÕES POLÍTICAS:\n- Governador Antônio Moniz Sodré de Aragão (1916-1920): serviu como guarda civil 1ª classe e capanga\n- Chefe de Polícia Álvaro José de Cova: patrono que defendeu sua moradia em Mont Serrat\n- NÃO Pedrito como a ficção de Jorge Amado sugeria\n\nCONTEXTO OCUPACIONAL:\n"Guarda civil de 1ª classe" - posição que fornecia cobertura para trabalho de execução política durante disputas eleitorais.\n\nHABILIDADE COM NAVALHA:\nListado entre capoeiristas hábeis com a navalha ao lado de Caboclinho e Noca de Jacó.\n\nAPELIDO:\n"Sete Mortes" significa "Seven Deaths" em inglês. Esse apelido temível provavelmente se relaciona à sua reputação como lutador perigoso, embora nenhuma explicação específica de sua origem tenha sido documentada.\n\nFICÇÃO DE JORGE AMADO:\nOs romances de Amado (Tenda dos Milagres, Jubiabá) retrataram capoeiristas em contextos políticos, mas erroneamente ligaram Sete Mortes a Pedrito. A pesquisa histórica esclarece que a conexão real era com Álvaro Cova.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nOUTROS CAPANGAS POLÍTICOS (contemporâneos):\nSamuel da Calçada, Duquinha, Escalvino (Luís Escalvino), Estevinho, Sebastião de Souza, Pedro Mineiro'
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

-- Source: entities/persons/tibirici-da-folha-grossa.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Tibiriçá da Folha Grossa
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- As a contemporary of Pastinha (born 1889) who practiced "pure Capoeira
-- de Angola," Tibiriçá was likely of the same generation. The legendary
-- capoeiristas Pastinha listed in 1967 were from the pre-Bimba/Pastinha
-- era - active practitioners from the late 19th to early 20th century.
-- Using 1890 as a reasonable estimate with decade precision.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Pastinha listed him among the deceased in his 1967 interview. Given
-- the generation of fighters he was grouped with, and that all were
-- confirmed dead by 1967, death likely occurred in the 1950s-1960s.
-- Using 1960 with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Tibiriçá da Folha Grossa', -- apelido: compound nickname
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Mestre Pastinha explicitly identified Tibiriçá da Folha Grossa as a practitioner of "pure Capoeira de Angola" alongside other legendary angoleiros of the pre-Bimba/Pastinha era. Pastinha remarked that the nicknames alone revealed "who they were, how they fought."',
  E'Capoeira de Angola tradicional. Mestre Pastinha identificou explicitamente Tibiriçá da Folha Grossa como praticante de "capoeira de Angola pura" ao lado de outros angoleiros lendários da era pré-Bimba/Pastinha. Pastinha observou que os apelidos por si só revelavam "quem eles eram, como lutavam."',
  1890, -- birth_year: estimated from generation (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area, but unconfirmed
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Tibiriçá da Folha Grossa was a legendary capoeirista of Salvador, Bahia, active during the late 19th or early 20th century. He is known exclusively from Mestre Pastinha''s 1967 interview with Roberto Freire for Revista Realidade, where Pastinha recalled the great capoeiristas of the past.

In that interview, conducted when Pastinha was 78 years old and nearly blind, the father of Capoeira Angola listed fifteen deceased practitioners who had practiced "the pure Capoeira de Angola as I and these boys there do until today." Tibiriçá da Folha Grossa was among them, alongside other colorfully-named figures such as Bigode de Seda (Silk Mustache), Américo Ciência, Bugalho, Amorzinho (Little Love), Zé Bom Pé (Joe Good Foot), Chico Três Pedaços (Chico Three Pieces), Doze Homens (Twelve Men), Inimigo Sem Tripa (Enemy Without Guts), Vitorino Braço Torto (Vitorino Crooked Arm), Zé do U, Zé do Saco (Joe of the Sack), Bené do Correio (Bené of the Post Office), Sete Mortes (Seven Deaths), and Chico Me Dá (Give-Me Chico). Pastinha also mentioned two women among these legendary practitioners: Júlia Fogareira and Maria Homem.

Pastinha remarked of these figures: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história" (We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story). He emphasized that their nicknames revealed their character and fighting style: "From the nicknames alone you can know who they were, how they fought."

The name "Tibiriçá" is of Tupi indigenous origin, historically associated with Chief Tibiriçá (died 1562), a Tupiniquim leader. Writer Eduardo Bueno, citing Teodoro Sampaio, interprets it as "vigilante da terra" (guardian of the land) or "sentinela da serra" (sentinel of the mountain range) in Tupi. This indigenous name on a capoeirista reflects the Afro-Indigenous cultural mixing characteristic of Bahian popular culture.

"Folha Grossa" (Thick Leaf) is a descriptive qualifier whose specific meaning for this capoeirista has been lost to history. In capoeira tradition, such nicknames often referred to physical characteristics, personality traits, or fighting style. Whether it described his toughness, his body type, his movement quality, or something else entirely remains unknown.

No further biographical details have survived - no teachers, students, specific incidents, or documented appearances. Tibiriçá da Folha Grossa exists as a name on Pastinha''s list of the fallen, a reminder that behind each apelido stood a life now largely forgotten.',
  -- bio_pt
  E'Tibiriçá da Folha Grossa foi um lendário capoeirista de Salvador, Bahia, ativo durante o final do século XIX ou início do século XX. Ele é conhecido exclusivamente pela entrevista de Mestre Pastinha de 1967 com Roberto Freire para a Revista Realidade, na qual Pastinha recordou os grandes capoeiristas do passado.

Nessa entrevista, conduzida quando Pastinha tinha 78 anos e estava quase cego, o pai da Capoeira Angola listou quinze praticantes falecidos que haviam praticado "a pura capoeira de Angola como eu e esses rapazes aí fazem até hoje." Tibiriçá da Folha Grossa estava entre eles, ao lado de outras figuras de nomes coloridos como Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do U, Zé do Saco, Bené do Correio, Sete Mortes e Chico Me Dá. Pastinha também mencionou duas mulheres entre esses praticantes lendários: Júlia Fogareira e Maria Homem.

Pastinha comentou sobre essas figuras: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história." Ele enfatizou que seus apelidos revelavam seu caráter e estilo de luta: "Só pelo apelido você conhece quem eles eram, como lutavam."

O nome "Tibiriçá" é de origem indígena Tupi, historicamente associado ao Cacique Tibiriçá (falecido em 1562), um líder Tupiniquim. O escritor Eduardo Bueno, citando Teodoro Sampaio, interpreta-o como "vigilante da terra" ou "sentinela da serra" em Tupi. Este nome indígena em um capoeirista reflete a mestiçagem cultural afro-indígena característica da cultura popular baiana.

"Folha Grossa" é um qualificador descritivo cujo significado específico para este capoeirista se perdeu na história. Na tradição da capoeira, tais apelidos frequentemente se referiam a características físicas, traços de personalidade ou estilo de luta. Se descrevia sua dureza, seu tipo físico, sua qualidade de movimento ou algo completamente diferente permanece desconhecido.

Nenhum detalhe biográfico adicional sobreviveu - nenhum mestre, aluno, incidente específico ou aparição documentada. Tibiriçá da Folha Grossa existe como um nome na lista de Pastinha dos caídos, um lembrete de que por trás de cada apelido havia uma vida agora em grande parte esquecida.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade):
Contemporary of Pastinha (born 1889). As a practitioner of "pure Capoeira de Angola" listed among the legendary deceased angoleiros, likely active in the late 19th to early 20th century. Estimate based on generational placement.

DEATH YEAR ESTIMATION (1960, decade):
Pastinha listed him among the deceased in 1967 interview. All figures in this list were confirmed dead by 1967.

APELIDO ETYMOLOGY:
- "Tibiriçá" - Tupi indigenous name. Eduardo Bueno (citing Teodoro Sampaio) interprets as "vigilante da terra" (guardian of the land) or "sentinela da serra" (sentinel of the mountain range). Alternative etymology by tupinólogo Eduardo de Almeida Navarro: from Tupi "tebiresá" meaning "eye of the buttocks" (tebira, "buttock" + esá, "eye").
- "da Folha Grossa" - literally "of the Thick Leaf"; meaning unknown but likely descriptive of physical characteristic, personality, or fighting style.

SOURCE: Mestre Pastinha interview with Roberto Freire, Revista Realidade, 1967.

PASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

KEY QUOTE (Portuguese):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

KEY QUOTE (English translation):
"We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story."

KEY QUOTE on nicknames:
"From the nicknames alone you can know who they were, how they fought."

NO ADDITIONAL DOCUMENTATION FOUND:
- No dedicated velhosmestres.com page exists
- No Wikipedia article
- No academic papers specifically mentioning this person
- No group affiliations documented
- No teacher-student relationships documented
- No specific incidents or timeline events',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
Contemporâneo de Pastinha (nascido em 1889). Como praticante de "capoeira de Angola pura" listado entre os lendários angoleiros falecidos, provavelmente ativo no final do século XIX até início do século XX. Estimativa baseada em posicionamento geracional.

ESTIMATIVA DE ANO DE MORTE (1960, década):
Pastinha o listou entre os falecidos em entrevista de 1967. Todas as figuras nesta lista estavam confirmadamente mortas em 1967.

ETIMOLOGIA DO APELIDO:
- "Tibiriçá" - Nome indígena Tupi. Eduardo Bueno (citando Teodoro Sampaio) interpreta como "vigilante da terra" ou "sentinela da serra". Etimologia alternativa do tupinólogo Eduardo de Almeida Navarro: do Tupi "tebiresá" significando "olho da bunda" (tebira, "bunda" + esá, "olho").
- "da Folha Grossa" - literalmente "da Folha Grossa"; significado desconhecido mas provavelmente descritivo de característica física, personalidade ou estilo de luta.

FONTE: Entrevista de Mestre Pastinha com Roberto Freire, Revista Realidade, 1967.

LISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

CITAÇÃO CHAVE (Português):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

CITAÇÃO CHAVE sobre apelidos:
"Só pelo apelido você conhece quem eles eram, como lutavam."

NENHUMA DOCUMENTAÇÃO ADICIONAL ENCONTRADA:
- Não existe página dedicada no velhosmestres.com
- Nenhum artigo na Wikipedia
- Nenhum trabalho acadêmico mencionando especificamente esta pessoa
- Nenhuma afiliação a grupo documentada
- Nenhuma relação mestre-aluno documentada
- Nenhum incidente específico ou evento cronológico'
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

-- Source: entities/persons/vitorino-braco-torto.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Vitorino Braço Torto
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Listed by Pastinha in 1967 as already deceased among practitioners
-- of "pure Capoeira de Angola." The other figures on this list were
-- active in the early-to-mid 20th century (Américo Ciência fought
-- Bimba in 1936; Amorzinho led Gengibirra until 1943), suggesting
-- Vitorino Braço Torto was likely born around 1880-1910.
-- Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Confirmed dead by Pastinha's 1967 interview. As a contemporary of
-- the other angoleiros on the list (most active 1900s-1940s),
-- likely died in the 1950s-1960s. Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Vitorino', -- name: first name appears to be Vitorino, surname unknown
  'Braço Torto', -- apelido: means "Crooked Arm" or "Twisted Arm"
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Vitorino Braço Torto among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview, distinguishing these figures from the modernized Regional style.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Vitorino Braço Torto entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967, distinguindo essas figuras do estilo Regional modernizado.',
  1900, -- birth_year: estimated from context (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given association with Pastinha's circles
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Vitorino Braço Torto was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. His name appears in one of the most important primary sources in capoeira history: Mestre Pastinha''s 1967 interview with Revista Realidade magazine.\n\nIn February 1967, the 78-year-old Pastinha—nearly blind but still teaching at his academy in Pelourinho—spoke with journalist Roberto Freire about the great capoeiristas of the past. Pastinha listed Vitorino Braço Torto among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, and two women: Júlia Fogareira and Maria Homem.\n\nPastinha remarked of these figures: "Cada nome destes é uma história"—each of these names is a story. He observed that their apelidos revealed "who they were, how they fought," suggesting these nicknames encoded information about their fighting styles, personalities, or physical characteristics.\n\nThe apelido "Braço Torto" translates to "Crooked Arm" or "Twisted Arm" in English. Following Pastinha''s observation about meaningful nicknames, this could indicate a physical characteristic—perhaps an arm bent from an old injury or an unusual fighting stance—or possibly a distinctive way of using the arms during the game. Without additional documentation, the exact origin of the nickname remains unknown.\n\nBeyond Pastinha''s mention, no other documentation of Vitorino Braço Torto has been found. He represents one of the many capoeiristas whose contributions to the art have been largely lost to history, remembered only through the oral testimony of those who knew them.',
  -- bio_pt
  E'Vitorino Braço Torto foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Seu nome aparece em uma das mais importantes fontes primárias da história da capoeira: a entrevista de Mestre Pastinha à Revista Realidade em 1967.\n\nEm fevereiro de 1967, Pastinha, então com 78 anos—quase cego mas ainda ensinando em sua academia no Pelourinho—conversou com o jornalista Roberto Freire sobre os grandes capoeiristas do passado. Pastinha listou Vitorino Braço Torto entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, e duas mulheres: Júlia Fogareira e Maria Homem.\n\nPastinha comentou sobre essas figuras: "Cada nome destes é uma história." Ele observou que seus apelidos revelavam "quem eles eram, como lutavam"—sugerindo que esses apelidos codificavam informações sobre seus estilos de luta, personalidades ou características físicas.\n\nO apelido "Braço Torto" significa "Braço Torcido" ou "Braço Curvado." Seguindo a observação de Pastinha sobre apelidos significativos, isso poderia indicar uma característica física—talvez um braço dobrado por uma lesão antiga ou uma postura de luta incomum—ou possivelmente uma maneira distinta de usar os braços durante o jogo. Sem documentação adicional, a origem exata do apelido permanece desconhecida.\n\nAlém da menção de Pastinha, nenhuma outra documentação sobre Vitorino Braço Torto foi encontrada. Ele representa um dos muitos capoeiristas cujas contribuições para a arte foram amplamente perdidas na história, lembrados apenas através do testemunho oral daqueles que os conheceram.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nListed by Pastinha in 1967 as already deceased among practitioners of "pure Capoeira de Angola." The other figures on this list were active in the early-to-mid 20th century, suggesting Vitorino Braço Torto was likely born around 1880-1910.\n\nDEATH YEAR ESTIMATION (1960, decade):\nConfirmed dead by Pastinha''s 1967 interview. As a contemporary of the other angoleiros on the list (most active 1900s-1940s), likely died in the 1950s-1960s.\n\nNAME:\n"Vitorino" appears to be his given name, with "Braço Torto" as his apelido (nickname).\n\nAPELIDO:\n"Braço Torto" translates to "Crooked Arm" or "Twisted Arm" in Portuguese. Pastinha noted that these old angoleiros'' apelidos revealed "who they were, how they fought," suggesting the nickname may reference a physical characteristic, fighting style, or distinctive arm movement.\n\nSOURCE:\nRevista Realidade, February 1967, "É Luta, É Dança, É Capoeira" by Roberto Freire (photos by David Drew Zingg). This is a single-source profile; no additional documentation found.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nNOT LISTED IN 1976 SOURCE:\nNotably, a 1976 O Globo article (velhosmestres.com/br/pastinha-1976) reproduces a similar list of "angoleiros de briga" but does not include Vitorino Braço Torto. This variation does not diminish the 1967 source''s reliability.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nListado por Pastinha em 1967 como já falecido entre praticantes de "capoeira de Angola pura." As outras figuras dessa lista estavam ativas no início e meados do século XX, sugerindo que Vitorino Braço Torto provavelmente nasceu por volta de 1880-1910.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Como contemporâneo dos outros angoleiros da lista (maioria ativos nos anos 1900-1940), provavelmente morreu nos anos 1950-1960.\n\nNOME:\n"Vitorino" parece ser seu nome de batismo, com "Braço Torto" como seu apelido.\n\nAPELIDO:\n"Braço Torto" significa literalmente "Braço Curvado" ou "Braço Torcido" em português. Pastinha observou que os apelidos desses velhos angoleiros revelavam "quem eles eram, como lutavam," sugerindo que o apelido pode fazer referência a uma característica física, estilo de luta ou movimento de braço distintivo.\n\nFONTE:\nRevista Realidade, fevereiro de 1967, "É Luta, É Dança, É Capoeira" por Roberto Freire (fotos de David Drew Zingg). Este é um perfil de fonte única; nenhuma documentação adicional encontrada.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nNÃO LISTADO NA FONTE DE 1976:\nNotavelmente, um artigo de O Globo de 1976 (velhosmestres.com/br/pastinha-1976) reproduz uma lista similar de "angoleiros de briga" mas não inclui Vitorino Braço Torto. Esta variação não diminui a confiabilidade da fonte de 1967.'
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

-- Source: entities/persons/ze-do-saco.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zé do Saco
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Listed by Pastinha in 1967 as already deceased among practitioners
-- of "pure Capoeira de Angola." The other figures on this list were
-- active in the early-to-mid 20th century (Américo Ciência fought
-- Bimba in 1936; Amorzinho led Gengibirra until 1943), suggesting
-- Zé do Saco was likely born around 1880-1910.
-- Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Confirmed dead by Pastinha's 1967 interview. As a contemporary of
-- the other angoleiros on the list (most active 1900s-1940s),
-- likely died in the 1950s-1960s. Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Zé do Saco', -- apelido: "Zé" (José) + "do Saco" (of the Sack)
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Zé do Saco among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview, distinguishing these figures from the modernized Regional style.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Zé do Saco entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967, distinguindo essas figuras do estilo Regional modernizado.',
  1900, -- birth_year: estimated from context (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given association with Pastinha's circles
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Zé do Saco was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. His name appears in one of the most important primary sources in capoeira history: Mestre Pastinha''s 1967 interview with Revista Realidade magazine.\n\nIn February 1967, the 78-year-old Pastinha—nearly blind but still teaching at his academy in Pelourinho—spoke with journalist Roberto Freire about the great capoeiristas of the past. Pastinha listed Zé do Saco among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Bené do Correio, Sete Mortes, Chico Me Dá, and two women: Júlia Fogareira and Maria Homem.\n\nPastinha remarked of these figures: "Cada nome destes é uma história"—each of these names is a story. He observed that their apelidos revealed "who they were, how they fought," suggesting these nicknames encoded information about their fighting styles, personalities, or physical characteristics.\n\nThe apelido "Zé do Saco" follows a common Brazilian naming pattern where "Zé" (short for José) is followed by an identifier. "Saco" means "bag" or "sack" in Portuguese. According to ethnographer Waldeloir Rego, capoeiristas at the Cais do Porto (port docks) in Salvador wore shirts called abadá made from "saco de açúcar ou farinha do reino" (sugar or flour sacks). This suggests the nickname may have indicated someone who worked at the docks or wore such clothing—though without additional documentation, the exact origin remains unknown.\n\nBeyond Pastinha''s mention, no other documentation of Zé do Saco has been found. He represents one of the many capoeiristas whose contributions to the art have been largely lost to history, remembered only through the oral testimony of those who knew them.',
  -- bio_pt
  E'Zé do Saco foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Seu nome aparece em uma das mais importantes fontes primárias da história da capoeira: a entrevista de Mestre Pastinha à Revista Realidade em 1967.\n\nEm fevereiro de 1967, Pastinha, então com 78 anos—quase cego mas ainda ensinando em sua academia no Pelourinho—conversou com o jornalista Roberto Freire sobre os grandes capoeiristas do passado. Pastinha listou Zé do Saco entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Bené do Correio, Sete Mortes, Chico Me Dá, e duas mulheres: Júlia Fogareira e Maria Homem.\n\nPastinha comentou sobre essas figuras: "Cada nome destes é uma história." Ele observou que seus apelidos revelavam "quem eles eram, como lutavam"—sugerindo que esses apelidos codificavam informações sobre seus estilos de luta, personalidades ou características físicas.\n\nO apelido "Zé do Saco" segue um padrão comum de nomeação brasileira onde "Zé" (diminutivo de José) é seguido por um identificador. "Saco" significa "bolsa" ou "sacola" em português. Segundo o etnógrafo Waldeloir Rego, capoeiristas no Cais do Porto em Salvador usavam camisas chamadas abadá feitas de "saco de açúcar ou farinha do reino." Isso sugere que o apelido pode ter indicado alguém que trabalhava nas docas ou usava tal vestimenta—embora, sem documentação adicional, a origem exata permaneça desconhecida.\n\nAlém da menção de Pastinha, nenhuma outra documentação sobre Zé do Saco foi encontrada. Ele representa um dos muitos capoeiristas cujas contribuições para a arte foram amplamente perdidas na história, lembrados apenas através do testemunho oral daqueles que os conheceram.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nListed by Pastinha in 1967 as already deceased among practitioners of "pure Capoeira de Angola." The other figures on this list were active in the early-to-mid 20th century, suggesting Zé do Saco was likely born around 1880-1910.\n\nDEATH YEAR ESTIMATION (1960, decade):\nConfirmed dead by Pastinha''s 1967 interview. As a contemporary of the other angoleiros on the list (most active 1900s-1940s), likely died in the 1950s-1960s.\n\nAPELIDO:\n"Zé do Saco" follows Brazilian naming convention: "Zé" (short for José) + "do Saco" (of the sack/bag). According to Waldeloir Rego (1968), capoeiristas at the port docks wore shirts made from flour or sugar sacks ("saco de açúcar ou farinha do reino"). The nickname may indicate dock work or this style of dress. Without additional sources, the exact meaning is unknown. Pastinha noted that these old angoleiros'' apelidos revealed "who they were, how they fought."\n\nSOURCE:\nRevista Realidade, February 1967, "É Luta, É Dança, É Capoeira" by Roberto Freire (photos by David Drew Zingg). This is a single-source profile; no additional documentation found.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nNOT LISTED IN 1976 SOURCE:\nNotably, a 1976 O Globo article (velhosmestres.com/br/pastinha-1976) reproduces a similar list of "angoleiros de briga" but does not include Zé do Saco. This variation does not diminish the 1967 source''s reliability.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nListado por Pastinha em 1967 como já falecido entre praticantes de "capoeira de Angola pura." As outras figuras dessa lista estavam ativas no início e meados do século XX, sugerindo que Zé do Saco provavelmente nasceu por volta de 1880-1910.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Como contemporâneo dos outros angoleiros da lista (maioria ativos nos anos 1900-1940), provavelmente morreu nos anos 1950-1960.\n\nAPELIDO:\n"Zé do Saco" segue a convenção de nomeação brasileira: "Zé" (diminutivo de José) + "do Saco" (do saco/sacola). Segundo Waldeloir Rego (1968), capoeiristas no Cais do Porto usavam camisas feitas de sacos de farinha ou açúcar ("saco de açúcar ou farinha do reino"). O apelido pode indicar trabalho nas docas ou esse estilo de vestimenta. Sem fontes adicionais, o significado exato é desconhecido. Pastinha observou que os apelidos desses velhos angoleiros revelavam "quem eles eram, como lutavam."\n\nFONTE:\nRevista Realidade, fevereiro de 1967, "É Luta, É Dança, É Capoeira" por Roberto Freire (fotos de David Drew Zingg). Este é um perfil de fonte única; nenhuma documentação adicional encontrada.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nNÃO LISTADO NA FONTE DE 1976:\nNotavelmente, um artigo de O Globo de 1976 (velhosmestres.com/br/pastinha-1976) reproduz uma lista similar de "angoleiros de briga" mas não inclui Zé do Saco. Esta variação não diminui a confiabilidade da fonte de 1967.'
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

-- Source: entities/persons/ze-do-u.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Zé do U
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- Listed by Pastinha in 1967 as already deceased among practitioners
-- of "pure Capoeira de Angola." The other figures on this list were
-- active in the early-to-mid 20th century (Américo Ciência fought
-- Bimba in 1936; Amorzinho led Gengibirra until 1943), suggesting
-- Zé do U was likely born around 1880-1910. Using decade precision: 1900.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Confirmed dead by Pastinha's 1967 interview. As a contemporary of
-- the other angoleiros on the list (most active 1900s-1940s),
-- likely died in the 1950s-1960s. Using decade precision: 1960.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown
  'Zé do U', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Pastinha explicitly listed Zé do U among the deceased practitioners of "pure Capoeira de Angola" in his 1967 Revista Realidade interview, distinguishing these figures from the modernized Regional style.',
  E'Capoeira de Angola tradicional. Pastinha listou explicitamente Zé do U entre os praticantes falecidos de "capoeira de Angola pura" em sua entrevista à Revista Realidade de 1967, distinguindo essas figuras do estilo Regional modernizado.',
  1900, -- birth_year: estimated from context (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area given association with Pastinha's circles
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Zé do U was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. His name appears in one of the most important primary sources in capoeira history: Mestre Pastinha''s 1967 interview with Revista Realidade magazine.\n\nIn February 1967, the 78-year-old Pastinha—nearly blind but still teaching at his academy in Pelourinho—spoke with journalist Roberto Freire about the great capoeiristas of the past. Pastinha listed Zé do U among 17 deceased practitioners of "pure Capoeira de Angola," alongside Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, and two women: Júlia Fogareira and Maria Homem.\n\nPastinha remarked of these figures: "Cada nome destes é uma história"—each of these names is a story. He observed that their apelidos revealed "who they were, how they fought," suggesting these nicknames encoded information about their fighting styles, personalities, or physical characteristics.\n\nThe apelido "Zé do U" follows a common Brazilian naming pattern where "Zé" (short for José) is followed by a geographic or occupational identifier. The "U" likely refers to a place, occupation, or characteristic—perhaps a neighborhood, street, or business where this capoeirista was known. Without additional documentation, the exact meaning remains unknown.\n\nBeyond Pastinha''s mention, no other documentation of Zé do U has been found. He represents one of the many capoeiristas whose contributions to the art have been largely lost to history, remembered only through the oral testimony of those who knew them.',
  -- bio_pt
  E'Zé do U foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Seu nome aparece em uma das mais importantes fontes primárias da história da capoeira: a entrevista de Mestre Pastinha à Revista Realidade em 1967.\n\nEm fevereiro de 1967, Pastinha, então com 78 anos—quase cego mas ainda ensinando em sua academia no Pelourinho—conversou com o jornalista Roberto Freire sobre os grandes capoeiristas do passado. Pastinha listou Zé do U entre 17 praticantes falecidos de "capoeira de Angola pura," ao lado de Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, e duas mulheres: Júlia Fogareira e Maria Homem.\n\nPastinha comentou sobre essas figuras: "Cada nome destes é uma história." Ele observou que seus apelidos revelavam "quem eles eram, como lutavam"—sugerindo que esses apelidos codificavam informações sobre seus estilos de luta, personalidades ou características físicas.\n\nO apelido "Zé do U" segue um padrão comum de nomeação brasileira onde "Zé" (diminutivo de José) é seguido por um identificador geográfico ou ocupacional. O "U" provavelmente se refere a um lugar, ocupação ou característica—talvez um bairro, rua ou estabelecimento onde este capoeirista era conhecido. Sem documentação adicional, o significado exato permanece desconhecido.\n\nAlém da menção de Pastinha, nenhuma outra documentação sobre Zé do U foi encontrada. Ele representa um dos muitos capoeiristas cujas contribuições para a arte foram amplamente perdidas na história, lembrados apenas através do testemunho oral daqueles que os conheceram.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade):\nListed by Pastinha in 1967 as already deceased among practitioners of "pure Capoeira de Angola." The other figures on this list were active in the early-to-mid 20th century, suggesting Zé do U was likely born around 1880-1910.\n\nDEATH YEAR ESTIMATION (1960, decade):\nConfirmed dead by Pastinha''s 1967 interview. As a contemporary of the other angoleiros on the list (most active 1900s-1940s), likely died in the 1950s-1960s.\n\nAPELIDO:\n"Zé do U" follows Brazilian naming convention: "Zé" (short for José) + "do U" (likely a place, occupation, or characteristic). The "U" could refer to a neighborhood, street corner, business, or distinguishing feature. Without additional sources, the exact meaning is unknown. Pastinha noted that these old angoleiros'' apelidos revealed "who they were, how they fought."\n\nSOURCE:\nRevista Realidade, February 1967, "É Luta, É Dança, É Capoeira" by Roberto Freire (photos by David Drew Zingg). This is a single-source profile; no additional documentation found.\n\nPASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\n1976 SOURCE VARIATION:\nA 1976 O Globo article (velhosmestres.com/br/pastinha-1976) reproduces a similar list of "angoleiros de briga" but includes Besouro and omits Zé Bom Pé. Zé do U appears in both versions, confirming his status among the legendary angoleiros.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, década):\nListado por Pastinha em 1967 como já falecido entre praticantes de "capoeira de Angola pura." As outras figuras dessa lista estavam ativas no início e meados do século XX, sugerindo que Zé do U provavelmente nasceu por volta de 1880-1910.\n\nESTIMATIVA DE ANO DE MORTE (1960, década):\nConfirmado como falecido pela entrevista de Pastinha em 1967. Como contemporâneo dos outros angoleiros da lista (maioria ativos nos anos 1900-1940), provavelmente morreu nos anos 1950-1960.\n\nAPELIDO:\n"Zé do U" segue a convenção de nomeação brasileira: "Zé" (diminutivo de José) + "do U" (provavelmente um lugar, ocupação ou característica). O "U" poderia se referir a um bairro, esquina, estabelecimento ou característica distintiva. Sem fontes adicionais, o significado exato é desconhecido. Pastinha observou que os apelidos desses velhos angoleiros revelavam "quem eles eram, como lutavam."\n\nFONTE:\nRevista Realidade, fevereiro de 1967, "É Luta, É Dança, É Capoeira" por Roberto Freire (fotos de David Drew Zingg). Este é um perfil de fonte única; nenhuma documentação adicional encontrada.\n\nLISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:\nBigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibirici da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem\n\nVARIAÇÃO DA FONTE DE 1976:\nUm artigo de O Globo de 1976 (velhosmestres.com/br/pastinha-1976) reproduz uma lista similar de "angoleiros de briga" mas inclui Besouro e omite Zé Bom Pé. Zé do U aparece em ambas versões, confirmando seu status entre os angoleiros lendários.'
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

-- ============================================================
-- PHASE 2: UPSERT STATEMENTS
-- ============================================================

-- Source: statements/persons/bene-do-correio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Bené do Correio
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Bené do Correio is the SUBJECT.
-- ============================================================

-- No documented relationships where Bené do Correio is the subject.
-- As a single-source historical figure, no teachers, students,
-- or group affiliations have been documented.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or no evidence)
-- ============================================================
-- No relationships documented for this figure.
-- Pastinha's 1967 list provides only names, not lineages.

-- Source: statements/persons/bras-amansa-brabo.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Brás Amansa Brabo
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Brás Amansa Brabo is the SUBJECT.
-- ============================================================

-- Brás Amansa Brabo student_of Bimba
-- Source: O Globo Feb 16, 1982 (via velhosmestres.com): "almost all direct disciples of the legendary Bimba"
-- Also: Atenilo's testimony names him among Bimba's most trusted companions
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'O Globo Feb 16, 1982 (velhosmestres.com/br/cobrinha-1982-3); Atenilo testimony (Itapoan writings)',
  E'Training start date unknown. Relationship ended with Bimba''s death on Feb 5, 1974. Named as direct disciple in 1982 O Globo article and as one of Bimba''s most trusted companions in Atenilo''s testimony.',
  E'Data de início do treinamento desconhecida. Relacionamento terminou com a morte de Bimba em 5 de fevereiro de 1974. Nomeado como discípulo direto no artigo do O Globo de 1982 e como um dos companheiros mais confiáveis de Bimba no testemunho de Atenilo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Brás Amansa Brabo associated_with Atenilo
-- Source: Atenilo testimony - named together as Bimba's trusted companions
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Both named as Bimba''s most trusted companions alongside Crispim (Bimba''s eldest son). Training contemporaries at Centro de Cultura Física Regional."}'::jsonb,
  'verified'::genealogy.confidence,
  'Atenilo testimony preserved in Mestre Itapoan writings',
  E'Both were part of Bimba''s inner circle of trusted companions alongside Crispim. Contemporaries at Bimba''s academy.',
  E'Ambos faziam parte do círculo íntimo de companheiros de confiança de Bimba junto com Crispim. Contemporâneos na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following contemporaries from the 1982 O Globo article are
-- not yet in the dataset. Add statements after import:
--
-- Brás Amansa Brabo associated_with Vinte e Nove - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Vermelho 27 - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Medicina - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Banduê - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Capazans - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Ezequiel - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Xaréu - fellow Bimba student, 1982 O Globo list
-- Brás Amansa Brabo associated_with Crispim - Bimba's son, inner circle companion
--
-- Itapoan is already in dataset but the association is less direct
-- (both listed in 1982 article, but Itapoan/Xaréu had founded Ginga by then)

-- Source: statements/persons/chico-me-da.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Chico Me Dá
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Chico Me Dá is the SUBJECT.
--
-- NOTE: No documented relationships found. Chico Me Dá is known only
-- from Mestre Pastinha's 1967 interview where he was listed among
-- deceased practitioners of "pure Capoeira de Angola." No teachers,
-- students, group affiliations, or specific incidents are documented.
-- ============================================================

-- ============================================================
-- CONTEMPORARY ASSOCIATION (as associated_with)
-- ============================================================
-- Chico Me Dá was listed by Pastinha alongside other legendary
-- angoleiros as practitioners of the same generation and style.
-- This implies a contemporaneous association within the capoeira
-- community of early 20th century Salvador, though no direct
-- interactions are documented.

-- Chico Me Dá associated_with Pastinha (same generation of angoleiros)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Listed by Pastinha among practitioners of pure Capoeira de Angola"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Realidade, February 1967 (Pastinha interview)',
  E'Pastinha listed Chico Me Dá among 17 deceased practitioners of "pure Capoeira de Angola" in his 1967 interview. This indicates Chico Me Dá was a known figure in the capoeira community of Salvador and recognized by Pastinha as belonging to the same tradition.',
  E'Pastinha listou Chico Me Dá entre 17 praticantes falecidos de "capoeira de Angola pura" em sua entrevista de 1967. Isso indica que Chico Me Dá era uma figura conhecida na comunidade da capoeira de Salvador e reconhecido por Pastinha como pertencente à mesma tradição.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Me Dá' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional documentation found)
-- ============================================================
-- No teacher relationships (student_of, trained_under) documented
-- No student relationships documented
-- No group affiliations documented
-- No title conferred documented
-- No baptism documented
--
-- If future research uncovers any of the following, they should be
-- added as statements:
-- - Who taught Chico Me Dá capoeira
-- - Any students he may have trained
-- - Any groups or rodas he frequented
-- - Any specific incidents or fights involving him
-- - Origin of his distinctive apelido
-- ============================================================

-- Source: statements/persons/crispim.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Crispim
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Crispim is the SUBJECT.
-- ============================================================

-- Crispim student_of Bimba (his father and teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'cdosergipe.wixsite.com; capoeiraceaca.wordpress.com; portalcapoeira.com',
  E'Primary teacher. Crispim was Bimba''s eldest son and trained under him from childhood. Ended with Bimba''s death in 1974.',
  E'Professor principal. Crispim era o filho mais velho de Bimba e treinou com ele desde a infância. Terminou com a morte de Bimba em 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim family_of Bimba (son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'cdosergipe.wixsite.com; portalcapoeira.com; madrugacapoeira.webnode.page',
  E'Eldest son of Mestre Bimba with Maria dos Anjos (first partner).',
  E'Filho mais velho de Mestre Bimba com Maria dos Anjos (primeira companheira).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Atenilo (inner circle companions)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Both named as part of Bimba''s inner circle of trusted companions. Training contemporaries at Centro de Cultura Física Regional."}'::jsonb,
  'verified'::genealogy.confidence,
  'recantodasletras.com.br; Itapoan''s writings',
  E'Both were part of Bimba''s inner circle of trusted companions alongside Brás Amansa Brabo. Contemporaries at Bimba''s academy.',
  E'Ambos faziam parte do círculo íntimo de companheiros de confiança de Bimba junto com Brás Amansa Brabo. Contemporâneos na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Atenilo' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Brás Amansa Brabo (inner circle companions)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Both named as part of Bimba''s inner circle of trusted companions. Training contemporaries at Centro de Cultura Física Regional."}'::jsonb,
  'verified'::genealogy.confidence,
  'recantodasletras.com.br; Itapoan''s writings',
  E'Both were part of Bimba''s inner circle of trusted companions alongside Atenilo. Contemporaries at Bimba''s academy.',
  E'Ambos faziam parte do círculo íntimo de companheiros de confiança de Bimba junto com Atenilo. Contemporâneos na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bras Amansa Brabo' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Waldemar (Vadiação film participants)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters."}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Traíra (Vadiação film participants)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters."}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Traíra' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Caiçara (Vadiação film participants)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters."}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Crispim associated_with Curió - Both in Vadiação (1954); Curió not yet imported
-- Crispim associated_with Nagé - Both in Vadiação (1954); Nagé not yet imported (distinct from Nagé Pedrito victim)
-- Crispim associated_with Zacarias Boa Morte - Both in Vadiação (1954); needs import
-- Crispim associated_with Rosendo - Both in Vadiação (1954); needs import
-- Crispim associated_with Bugalho - Both in Vadiação (1954); needs import (Bugalho may already exist - verify apelido)

-- Source: statements/persons/inimigo-sem-tripa.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Inimigo Sem Tripa
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Inimigo Sem Tripa is the SUBJECT.
-- ============================================================

-- NO DOCUMENTED RELATIONSHIPS
--
-- Inimigo Sem Tripa is known only from Mestre Pastinha's 1967
-- interview where he was listed among fifteen deceased practitioners
-- of "pure Capoeira de Angola." No teachers, students, group affiliations,
-- or specific relationships have been documented.
--
-- The 1976 O Globo article quoting Pastinha's students also mentions
-- this figure (as "Inimigos Sem Tripa") but provides no additional
-- relationship information.
--
-- The following figures were listed alongside Inimigo Sem Tripa in
-- Pastinha's 1967 list of deceased angoleiros (for reference, not
-- as documented relationships):
-- - Bigode de Seda
-- - Américo Ciência
-- - Bugalho
-- - Amorzinho
-- - Zé Bom Pé
-- - Chico Três Pedaços
-- - Tibiriçá da Folha Grossa
-- - Doze Homens
-- - Zé do U
-- - Vitorino Braço Torto
-- - Zé do Saco
-- - Bené do Correio
-- - Sete Mortes
-- - Chico Me Dá
-- - Júlia Fogareira
-- - Maria Homem
--
-- Without documented evidence of specific interactions, we do not create
-- "associated_with" or "contemporary_of" statements purely from co-listing.
--
-- If future research uncovers relationships, add statements here following
-- the standard pattern:
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   '[predicate]'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   NULL, NULL, NULL, NULL,
--   '{}'::jsonb, '[confidence]'::genealogy.confidence,
--   '[source]', '[notes EN]', '[notes PT]'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Inimigo Sem Tripa' AND o.apelido = '[Object]'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified - no documented relationships exist for this person.

-- Source: statements/persons/itapoan.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Itapoan
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Itapoan is the SUBJECT.
-- ============================================================

-- Itapoan student_of Bimba (1964-1972)
-- Primary teacher relationship - trained continuously for 8 years at CCFR
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-09-22'::date, 'exact'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources: Lalaue, Portal Capoeira, Ginga website',
  E'Began training September 22, 1964 at Centro de Cultura Física Regional, Terreiro de Jesus, Salvador. Completed all courses: blue scarf (1965), red scarf (1966), yellow scarf (1967). Champion at Bimba''s graduate tournament (1970). Training ended when Bimba moved to Goiânia in 1972.',
  E'Começou treinamento em 22 de setembro de 1964 no Centro de Cultura Física Regional, Terreiro de Jesus, Salvador. Completou todos os cursos: lenço azul (1965), lenço vermelho (1966), lenço amarelo (1967). Campeão no torneio de formados de Bimba (1970). Treinamento terminou quando Bimba mudou para Goiânia em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Itapoan' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Itapoan associated_with Atenilo (trained together at Bimba's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Training companions at Mestre Bimba academy"}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources: Mestre Itapoan''s books, Lalaue',
  E'Trained together at Mestre Bimba''s Centro de Cultura Física Regional. Itapoan later wrote "Atenilo, o Relâmpago da Capoeira Regional" (1988) documenting Atenilo''s testimony about early capoeira history and the founding of Regional.',
  E'Treinaram juntos no Centro de Cultura Física Regional de Mestre Bimba. Itapoan posteriormente escreveu "Atenilo, o Relâmpago da Capoeira Regional" (1988) documentando o testemunho de Atenilo sobre a história inicial da capoeira e a fundação da Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Itapoan' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Itapoan co_founded Ginga Associação de Capoeira (Nov 13, 1972) - needs group import
-- Itapoan leads Ginga Associação de Capoeira (1972-present) - needs group import
-- Itapoan founded ABPC (Associação Brasileira dos Professores de Capoeira, 1980) - needs group import
-- Itapoan co_founded Federação Bahiana de Capoeira (1983) - needs group import
-- Itapoan associated_with Hélio Campos/Xaréu (co-founder of Ginga) - Xaréu not in dataset
-- Itapoan associated_with Mestre Decânio (co-authorities on Bimba) - Decânio not in dataset
-- Itapoan teacher_of Mestre Kiki da Bahia - Kiki not in dataset

-- Source: statements/persons/julia-fogareira.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Júlia Fogareira
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Júlia Fogareira is the SUBJECT.
-- ============================================================

-- Júlia Fogareira trained_under Pastinha
-- Context: Pastinha testified that she "learned the art not only with
-- Mestre Pastinha but also with other masters of the time" (1902-1911)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1902-01-01'::date, 'decade'::genealogy.date_precision,
  '1911-12-31'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1969-3',
  'Pastinha testified in 1969 (A Tarde) that between 1902-1911, women including Júlia Fogareira "learned the art not only with Mestre Pastinha but also with other masters of the time." Pastinha was born 1889, so he was 13-22 during this period - already teaching while young.',
  'Pastinha testemunhou em 1969 (A Tarde) que entre 1902-1911, mulheres incluindo Júlia Fogareira "aprenderam a arte não só com Mestre Pastinha mas também com outros mestres da época." Pastinha nasceu em 1889, então tinha 13-22 anos durante esse período - já ensinando enquanto jovem.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlia Fogareira' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Júlia Fogareira associated_with Maria Homem
-- Context: Both were among the famous female capoeiristas of 1902-1911 era
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1902-01-01'::date, 'decade'::genealogy.date_precision,
  '1911-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Fellow female capoeiristas in early 20th century Salvador; both listed by Pastinha among legendary practitioners", "pt": "Companheiras capoeiristas no início do século XX em Salvador; ambas listadas por Pastinha entre praticantes lendárias"}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/pastinha-1976',
  'Both women listed together by Pastinha in 1976 O Globo interview among the generation of "angoleiros de briga" - the only two women among legendary male fighters like Besouro, Américo Ciência, etc.',
  'Ambas as mulheres listadas juntas por Pastinha em entrevista ao O Globo de 1976 entre a geração de "angoleiros de briga" - as únicas duas mulheres entre lutadores lendários como Besouro, Américo Ciência, etc.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlia Fogareira' AND o.apelido = 'Maria Homem'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Júlia Fogareira associated_with Palmeirona - needs import first
-- Júlia Fogareira associated_with Maria Pernambucana - needs import first
-- ============================================================

-- Source: statements/persons/pintor.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Pintor
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Pintor is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- Primary teacher: João Pequeno de Pastinha
-- Additional training in Bahia with multiple mestres
-- ============================================================

-- Pintor student_of João Pequeno (primary teacher, ~1970s-1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'Primary teacher. After training with various mestres in Bahia, Pintor settled on the teaching and practice of Mestre João Pequeno de Pastinha in Salvador. João Pequeno graduated him as Mestre in 1989.',
  E'Mestre principal. Após treinar com vários mestres na Bahia, Pintor estabeleceu-se no ensino e prática de Mestre João Pequeno de Pastinha em Salvador. João Pequeno o graduou como Mestre em 1989.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor received_title_from João Pequeno (Mestre, 1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "location": "Escola de Educação Física, Belo Horizonte"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'Graduated as Mestre by João Pequeno in 1989 with Grupo Macaco at Escola de Educação Física in Belo Horizonte. Later also received Mestre of Capoeira Angola title.',
  E'Graduado como Mestre por João Pequeno em 1989 com o Grupo Macaco na Escola de Educação Física em Belo Horizonte. Depois também recebeu título de Mestre de Capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Atenilo (Bahia training period)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Atenilo among other mestres. Atenilo was one of Bimba''s oldest students (45 years).',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Atenilo entre outros mestres. Atenilo era um dos alunos mais antigos de Bimba (45 anos).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Waldemar (Bahia training period)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Waldemar among other mestres. Waldemar was the iconic Angola mestre of Liberdade neighborhood.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Waldemar entre outros mestres. Waldemar era o icônico mestre de Angola do bairro da Liberdade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Canjiquinha (Bahia training period)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Canjiquinha among other mestres. Canjiquinha was known as "The Joy of Capoeira."',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Canjiquinha entre outros mestres. Canjiquinha era conhecido como "A Alegria da Capoeira."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Caiçara (Bahia training period)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Caiçara among other mestres. Caiçara was known for his bengala (cane) fighting style.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Caiçara entre outros mestres. Caiçara era conhecido por seu estilo de luta com bengala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Bigodinho/Gigante (Bahia training period)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Gigante (Bigodinho) among other mestres. Bigodinho was a student of Waldemar.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Gigante (Bigodinho) entre outros mestres. Bigodinho era aluno de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under João Grande (Bahia training period)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under João Grande among other mestres. João Grande was one of Pastinha''s two most prepared students.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com João Grande entre outros mestres. João Grande era um dos dois alunos mais preparados de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- Pintor founded Grupo Bantus Capoeira (1991)
-- NOTE: This statement will be active once the group is imported
-- INSERT INTO genealogy.statements ...
-- WHERE s.apelido = 'Pintor' AND o.name = 'Grupo Bantus Capoeira'

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Pintor trained_under Curió - Curió (Jaime Martins dos Santos) not yet imported
-- Pintor trained_under Boa Gente - not yet imported
-- Pintor trained_under Bom Cabrito (Mário Bom Cabrito) - not yet imported
-- Pintor trained_under Medicina - not yet imported
-- Pintor trained_under Papo de Santo Amaro - not yet imported
-- Pintor founded Grupo Bantus Capoeira - group not yet imported

-- Source: statements/persons/sete-mortes.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Sete Mortes
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Sete Mortes is the SUBJECT.
-- ============================================================

-- No documented teacher-student relationships where Sete Mortes is the subject.
-- His teachers and students are unknown.

-- ============================================================
-- ASSOCIATED_WITH RELATIONSHIPS
-- ============================================================
-- Note: Associated political capangas are documented in the notes
-- but without specific details about their interactions, formal
-- statements are not generated. These connections are:
-- - Samuel da Calçada (contemporary capanga) - EXISTS in dataset
-- - Duquinha (contemporary capanga) - EXISTS in dataset
-- - Escalvino (contemporary capanga) - EXISTS in dataset
-- - Pedro Mineiro (contemporary capanga) - EXISTS in dataset

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or no evidence)
-- ============================================================
-- No relationships with documented dates or details to generate statements.
-- Pastinha's 1967 list provides only names, not lineages.

-- Source: statements/persons/tibirici-da-folha-grossa.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Tibiriçá da Folha Grossa
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Tibiriçá da Folha Grossa is the SUBJECT.
-- ============================================================

-- NO DOCUMENTED RELATIONSHIPS
--
-- Tibiriçá da Folha Grossa is known only from Mestre Pastinha's 1967
-- interview where he was listed among fifteen deceased practitioners
-- of "pure Capoeira de Angola." No teachers, students, group affiliations,
-- or specific relationships have been documented.
--
-- The following figures were listed alongside Tibiriçá in Pastinha's 1967
-- list of deceased angoleiros (for reference, not as documented relationships):
-- - Bigode de Seda
-- - Américo Ciência
-- - Bugalho
-- - Amorzinho
-- - Zé Bom Pé
-- - Chico Três Pedaços
-- - Doze Homens
-- - Inimigo Sem Tripa
-- - Zé do U
-- - Vitorino Braço Torto
-- - Zé do Saco
-- - Bené do Correio
-- - Sete Mortes
-- - Chico Me Dá
-- - Júlia Fogareira
-- - Maria Homem
--
-- Without documented evidence of specific interactions, we do not create
-- "associated_with" or "contemporary_of" statements purely from co-listing.
--
-- If future research uncovers relationships, add statements here following
-- the standard pattern:
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   '[predicate]'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   NULL, NULL, NULL, NULL,
--   '{}'::jsonb, '[confidence]'::genealogy.confidence,
--   '[source]', '[notes EN]', '[notes PT]'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Tibiriçá da Folha Grossa' AND o.apelido = '[Object]'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified - no documented relationships exist for this person.

-- Source: statements/persons/vitorino-braco-torto.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Vitorino Braço Torto
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Vitorino Braço Torto is the SUBJECT.
--
-- NOTE: Vitorino Braço Torto is a single-source profile based entirely on
-- Mestre Pastinha's 1967 Revista Realidade interview. No teachers,
-- students, or specific relationships have been documented.
-- ============================================================

-- No statements to generate at this time.
-- Vitorino Braço Torto was listed by Pastinha among deceased "angoleiros de briga"
-- but without specific relationship information.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet documented)
-- ============================================================
-- None identified. Vitorino Braço Torto appears only in Pastinha's list of
-- deceased angoleiros without specific teacher/student or
-- associative relationships documented.
--
-- If future research reveals:
-- - Who taught Vitorino Braço Torto
-- - Who learned from Vitorino Braço Torto
-- - His association with specific rodas or groups
-- These statements should be added here.
-- ============================================================

-- Source: statements/persons/ze-do-saco.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zé do Saco
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Zé do Saco is the SUBJECT.
--
-- NOTE: Zé do Saco is a single-source profile based entirely on
-- Mestre Pastinha's 1967 Revista Realidade interview. No teachers,
-- students, or specific relationships have been documented.
-- ============================================================

-- No statements to generate at this time.
-- Zé do Saco was listed by Pastinha among deceased "angoleiros de briga"
-- but without specific relationship information.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet documented)
-- ============================================================
-- None identified. Zé do Saco appears only in Pastinha's list of
-- deceased angoleiros without specific teacher/student or
-- associative relationships documented.
--
-- If future research reveals:
-- - Who taught Zé do Saco
-- - Who learned from Zé do Saco
-- - His association with specific rodas or groups (e.g., Cais do Porto)
-- These statements should be added here.
-- ============================================================

-- Source: statements/persons/ze-do-u.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Zé do U
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Zé do U is the SUBJECT.
--
-- NOTE: Zé do U is a single-source profile based entirely on
-- Mestre Pastinha's 1967 Revista Realidade interview. No teachers,
-- students, or specific relationships have been documented.
-- ============================================================

-- No statements to generate at this time.
-- Zé do U was listed by Pastinha among deceased "angoleiros de briga"
-- but without specific relationship information.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet documented)
-- ============================================================
-- None identified. Zé do U appears only in Pastinha's list of
-- deceased angoleiros without specific teacher/student or
-- associative relationships documented.
--
-- If future research reveals:
-- - Who taught Zé do U
-- - Who learned from Zé do U
-- - His association with specific rodas or groups
-- These statements should be added here.
-- ============================================================

COMMIT;
