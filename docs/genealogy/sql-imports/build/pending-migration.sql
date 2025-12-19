-- ============================================================
-- GENEALOGY DATA MIGRATION
-- Generated: 2025-12-19T15:07:44.258Z
-- ============================================================
--
-- New entity files: 17
-- Changed entity files: 0
-- New statement files: 17
-- Changed statement files: 1
-- Deleted files: 0
-- Unchanged files: 313
-- ============================================================

BEGIN;

-- ============================================================
-- PHASE 1: UPSERT ENTITIES
-- ============================================================

-- Source: entities/persons/albertino-da-hora.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Albertino da Hora
-- Generated: 2025-12-19
-- ============================================================
-- Student of Mestre Pastinha at CECA (Centro Esportivo de
-- Capoeira Angola). Also known by the nickname "Moreno."
--
-- DOCUMENTED APPEARANCES:
-- - 1963 (May 4): O Cruzeiro magazine article - photographed
--   playing capoeira with Mestre Pastinha, João Grande, and
--   others in Pelourinho, Salvador
-- - 1964 (Sept 19-21): Trip to Belo Horizonte with Pastinha's
--   group for International Folklore Congress at Minas Tênis
--   Clube; fundraiser for Universidade Católica de Minas Gerais
--
-- BATERIA PARTICIPATION:
-- Per Mestre Gato Preto's 1999 interview: "Na roda, João
-- Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."
-- Note: This quote lists "Moreno" and "Albertino" separately,
-- but velhosmestres.com 1964 photos caption him as "Moreno
-- (Albertino da Hora)" - they are the same person.
--
-- DID NOT GO TO DAKAR 1966: The 1966 Dakar delegation included
-- Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto
-- Satanás, and Camafeu de Oxossi. Albertino was not among them.
--
-- NICKNAME NOTE: "Moreno" (brown-skinned) was a common nickname.
-- Albertino da Hora is DISTINCT from:
-- - The "Moreno" who was a student of Mestre Cobrinha Verde
--   (already in database with apelido_context='Cobrinha Verde student')
-- - "Gaguinho Moreno" listed separately among Pastinha's students
--
-- BIRTH YEAR ESTIMATION (1930, decade precision):
-- - Photographed as adult performer in 1963 O Cruzeiro article
-- - Traveled with Pastinha's group to Belo Horizonte 1964
-- - Part of bateria at CECA during 1950s-1960s
-- - Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)
-- - If ~30 in 1963, born ~1933; estimate ~1930 with decade precision
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown; "da Hora" may be surname
  'Albertino da Hora',
  NULL, -- Unique enough not to need context
  'mestre'::genealogy.title, -- Consistently called "Mestre Albertino" in sources
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/pastinha-1963-1', 'https://velhosmestres.com/br/pastinha-1964-2']::text[],
  'angola'::genealogy.style,
  E'Trained in the traditional Capoeira Angola style under Mestre Pastinha at CECA. Documented as a bateria player alongside João Pequeno, Valdomiro, and Gato Preto, indicating proficiency with berimbau and other percussion instruments.',
  E'Treinado no estilo tradicional de Capoeira Angola sob Mestre Pastinha no CECA. Documentado como tocador de bateria junto com João Pequeno, Valdomiro e Gato Preto, indicando proficiência com berimbau e outros instrumentos de percussão.',
  1930, -- Estimated: photographed as adult in 1963, bateria player at CECA 1950s-60s
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown, likely Salvador
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Albertino da Hora, also known by the nickname "Moreno," was a student of Mestre Pastinha at the Centro Esportivo de Capoeira Angola (CECA) in the Pelourinho district of Salvador, Bahia. He was part of the generation of capoeiristas who trained at CECA during its golden era in the 1950s-1960s, alongside mestres such as João Grande, João Pequeno, Gildo Alfinete, Valdomiro, and Curió.\n\nIn May 1963, Albertino was featured in a major photo essay on Capoeira Angola published in O Cruzeiro magazine. The article, written by Accoly Netto with photographs by Jean Solari, captured Mestre Pastinha "reliving on the stone streets of Salvador the incredible feats of African capoeiristas," assisted by his musicians and companions including João Oliveira dos Santos (João Grande), Raimundo da Virgem Natividade, Manuel de Carvalho, and Albertino da Hora. Multiple photographs show Albertino playing capoeira with Mestre Pastinha in the streets and at the Igreja de São Bárbara.\n\nIn September 1964, Albertino traveled with Mestre Pastinha''s group to Belo Horizonte for the International Folklore Congress. According to Mestre Gildo Alfinete''s account, the delegation included "Mestre Pastinha, eu (Gildo Alfinete), Roberto Satanás, João Grande, Albertino da Hora e Toinho." The group performed at the Ginásio da Minas Tênis Clube on September 19-21, raising funds for the construction of the Universidade Católica de Minas Gerais. Photographs from this trip show Albertino (captioned as "Moreno") playing capoeira with João Grande while Pastinha, Toinho, Roberto Satanás, and Gildo Alfinete provided the bateria.\n\nMestre Gato Preto, in his 1999 interview, recalled the composition of the bateria at Pastinha''s rodas: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria." This places Albertino among the core musicians who accompanied the rodas at CECA during this era.\n\nNotably, Albertino was not among the capoeiristas who traveled to Dakar, Senegal for the First International Festival of Black Arts in April 1966. That delegation consisted of Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi.\n\nBeyond these documented appearances, little is known about Albertino da Hora''s life. His full name, birth and death dates, and subsequent career remain undocumented in available sources.',
  -- bio_pt
  E'Albertino da Hora, também conhecido pelo apelido "Moreno," foi aluno de Mestre Pastinha no Centro Esportivo de Capoeira Angola (CECA) no bairro do Pelourinho em Salvador, Bahia. Ele fez parte da geração de capoeiristas que treinaram no CECA durante sua era dourada nas décadas de 1950-1960, junto com mestres como João Grande, João Pequeno, Gildo Alfinete, Valdomiro e Curió.\n\nEm maio de 1963, Albertino foi destaque em uma grande reportagem fotográfica sobre Capoeira Angola publicada na revista O Cruzeiro. O artigo, escrito por Accoly Netto com fotografias de Jean Solari, capturou Mestre Pastinha "revivendo nas ruas empedradas de Salvador as proezas incríveis dos capoeiristas africanos," assistido por seus músicos e comparsas incluindo João Oliveira dos Santos (João Grande), Raimundo da Virgem Natividade, Manuel de Carvalho e Albertino da Hora. Múltiplas fotografias mostram Albertino jogando capoeira com Mestre Pastinha nas ruas e na Igreja de São Bárbara.\n\nEm setembro de 1964, Albertino viajou com o grupo de Mestre Pastinha para Belo Horizonte para o Congresso Internacional de Folclore. Segundo o relato de Mestre Gildo Alfinete, a delegação incluía "Mestre Pastinha, eu (Gildo Alfinete), Roberto Satanás, João Grande, Albertino da Hora e Toinho." O grupo se apresentou no Ginásio da Minas Tênis Clube de 19 a 21 de setembro, arrecadando fundos para a construção da Universidade Católica de Minas Gerais. Fotografias desta viagem mostram Albertino (legendado como "Moreno") jogando capoeira com João Grande enquanto Pastinha, Toinho, Roberto Satanás e Gildo Alfinete faziam a bateria.\n\nMestre Gato Preto, em sua entrevista de 1999, recordou a composição da bateria nas rodas de Pastinha: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria." Isto coloca Albertino entre os músicos principais que acompanhavam as rodas no CECA durante essa época.\n\nNotavelmente, Albertino não estava entre os capoeiristas que viajaram para Dakar, Senegal para o Primeiro Festival Internacional de Artes Negras em abril de 1966. Aquela delegação consistia de Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi.\n\nAlém destas aparições documentadas, pouco se sabe sobre a vida de Albertino da Hora. Seu nome completo, datas de nascimento e morte, e carreira subsequente permanecem não documentados nas fontes disponíveis.',
  -- achievements_en
  E'Trained under Mestre Pastinha at CECA during its golden era (1950s-1960s)\nFeatured in O Cruzeiro magazine''s 1963 photo essay on Capoeira Angola\nParticipated in the 1964 Belo Horizonte trip representing Pastinha''s group\nCore bateria player at Pastinha''s rodas alongside João Pequeno, Valdomiro, and Gato Preto',
  -- achievements_pt
  E'Treinou sob Mestre Pastinha no CECA durante sua era dourada (décadas de 1950-1960)\nDestaque na reportagem fotográfica da revista O Cruzeiro de 1963 sobre Capoeira Angola\nParticipou da viagem a Belo Horizonte em 1964 representando o grupo de Pastinha\nTocador principal de bateria nas rodas de Pastinha junto com João Pequeno, Valdomiro e Gato Preto',
  -- notes_en
  E'NICKNAME: Also known as "Moreno." The velhosmestres.com 1964 photo captions him as "Moreno (Albertino da Hora)." This is DISTINCT from the "Moreno" who was a student of Cobrinha Verde (separate entry in database).\n\nTEACHER: Mestre Pastinha - trained at CECA in Pelourinho\n\nCONTEMPORARIES AT CECA:\n- João Grande (João Oliveira dos Santos)\n- João Pequeno (João Pereira dos Santos)\n- Gildo Alfinete\n- Roberto Satanás (Roberto Pereira)\n- Valdomiro (Valdomiro Malvadeza)\n- Gato Preto (José Gabriel Góes)\n- Curió (Jaime Martins dos Santos)\n- Raimundo Natividade\n- Manuel de Carvalho\n- Toinho\n\nBATERIA COMPANIONS:\n- João Pequeno, Valdomiro, Gato Preto (per Gato Preto 1999 interview)\n\nMEDIA APPEARANCES:\n- 1963 (May 4): O Cruzeiro magazine - photos by Jean Solari, article by Accoly Netto\n- 1964 (Sept): Photos at Belo Horizonte by Juares Fioravante Patines\n\nNOT IN DAKAR 1966: Did not travel to Senegal with Pastinha''s delegation.\n\nBIRTH YEAR ESTIMATION (1930, decade):\n- Photographed as adult performer in 1963 O Cruzeiro article\n- Traveled with Pastinha''s group to Belo Horizonte 1964\n- Part of bateria at CECA during 1950s-1960s\n- Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)\n- Estimate: ~1930 ± 5 years\n\nDEATH YEAR: Unknown. Full name unknown; "Da Hora" appears to be his surname.',
  -- notes_pt
  E'APELIDO: Também conhecido como "Moreno." As legendas das fotos de velhosmestres.com de 1964 o identificam como "Moreno (Albertino da Hora)." Este é DISTINTO do "Moreno" que foi aluno de Cobrinha Verde (entrada separada no banco de dados).\n\nMESTRE: Mestre Pastinha - treinou no CECA no Pelourinho\n\nCONTEMPORÂNEOS NO CECA:\n- João Grande (João Oliveira dos Santos)\n- João Pequeno (João Pereira dos Santos)\n- Gildo Alfinete\n- Roberto Satanás (Roberto Pereira)\n- Valdomiro (Valdomiro Malvadeza)\n- Gato Preto (José Gabriel Góes)\n- Curió (Jaime Martins dos Santos)\n- Raimundo Natividade\n- Manuel de Carvalho\n- Toinho\n\nCOMPANHEIROS DE BATERIA:\n- João Pequeno, Valdomiro, Gato Preto (conforme entrevista de Gato Preto 1999)\n\nAPARIÇÕES NA MÍDIA:\n- 1963 (4 de maio): revista O Cruzeiro - fotos de Jean Solari, artigo de Accoly Netto\n- 1964 (setembro): Fotos em Belo Horizonte por Juares Fioravante Patines\n\nNÃO FOI A DAKAR 1966: Não viajou para o Senegal com a delegação de Pastinha.\n\nESTIMATIVA ANO DE NASCIMENTO (1930, década):\n- Fotografado como performer adulto no artigo O Cruzeiro de 1963\n- Viajou com o grupo de Pastinha para Belo Horizonte em 1964\n- Parte da bateria no CECA durante décadas de 1950-1960\n- Contemporâneo de Gato Preto (n. 1930), João Grande (n. 1933), Curió (n. 1937)\n- Estimativa: ~1930 ± 5 anos\n\nANO DE MORTE: Desconhecido. Nome completo desconhecido; "Da Hora" parece ser seu sobrenome.'
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

-- Source: entities/persons/angelica-endiabrada.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Angélica Endiabrada
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1885, decade precision):
-- Active as valentona from 1910-1920 per newspaper records.
-- If in prime fighting age (25-35) during this period, birth = ~1875-1895.
-- Using 1885 as midpoint with decade precision.
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
  'Anna Angélica',
  'Angélica Endiabrada',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://portalcapoeira.com/capoeira/cronicas-da-capoeiragem/a-mulher-na-capoeira/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for physical combat skills and resistance against authority.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida por suas habilidades de combate físico e resistência à autoridade.',
  -- Life dates
  1885,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Anna Angélica, known as "Angélica Endiabrada," was a valentona - a tough woman skilled in physical combat - who became notorious in Salvador, Bahia between 1910 and 1920. She was a constant presence in newspaper headlines and police records as one of the feared "valentonas da Bahia."\n\n"Endiabrada" - meaning "possessed by the devil" or "wild" - was not a mere nickname but an adjective given to women who demonstrated exceptional skill in hand-to-hand combat. Angélica earned this epithet after a confrontation with a civil guard in which she resisted arrest and struck the officer, breaking his mouth. This single act of defiance against authority crystallized her reputation in the popular imagination.\n\nAccording to Antônio Vianna in "Casos e coisas da Bahia," Angélica was also known as a troublemaker who, when drinking, would break up bars in the capital city around 1910. The scenes were the streets, the brothels, the points of prostitution - the same urban geography that shaped male capoeiristas of the era. The reasons for conflict were jealousy, alcohol, personal feuds - the common currency of street life in old Bahia.\n\nAngélica belonged to a generation of legendary female capoeiristas and valentonas whose stories were passed down in oral tradition. She was contemporary with Salomé, Maria Doze Homens, Chicão, Rosa Palmeirão, Massú, Catu, Almerinda, and Menininha - women whose histories involved confrontations with police, knife fights with razors, and even the deaths of famous male valentões.\n\nThe book "Mestres e capoeiras famosos da Bahia" by Pedro Abib (2009) contains a chapter titled "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" (Fight over moqueca), documenting an encounter between these two legendary women. The fact that their conflict warranted its own chapter demonstrates how significant these female figures were in the capoeiragem of early 20th century Bahia.\n\nWhile no direct evidence proves Angélica was a capoeirista in the formal sense, the newspapers and police of the era labeled women like her as such. The mastery of navalha (razor), canivete (penknife), faca (knife), and punhal (dagger) suggests she was indeed part of the capoeiragem culture, as these weapons were the companions of post-slavery capoeira practitioners.\n\nAngélica''s story was remembered in literatura de cordel - the popular printed booklets that celebrated legendary figures. Along with Besouro Mangangá, Inocêncio Sete Mortes, and Maria Doze Homem, she became part of the folklore that kept the memory of old capoeiragem alive.\n\nThe doctoral thesis "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" by Paula Juliana Foltran (2019, University of Brasília) represents the most comprehensive academic study of women like Angélica. Foltran''s research in the Arquivo Público do Estado da Bahia identified hundreds of women engaged in street fighting during this period, definitively dismantling the myth that capoeira was exclusively a male domain.',
  E'Anna Angélica, conhecida como "Angélica Endiabrada," foi uma valentona - uma mulher durona e habilidosa no combate físico - que se tornou notória em Salvador, Bahia, entre 1910 e 1920. Ela era presença constante nas manchetes dos jornais e nos registros policiais como uma das temidas "valentonas da Bahia."\n\n"Endiabrada" - significando "possuída pelo diabo" ou "selvagem" - não era um mero apelido, mas um adjetivo dado às mulheres que demonstravam habilidade excepcional no combate corpo a corpo. Angélica ganhou esse epíteto após um confronto com um guarda civil, no qual resistiu à prisão e bateu no oficial, quebrando sua boca. Este único ato de desafio à autoridade cristalizou sua reputação no imaginário popular.\n\nSegundo Antônio Vianna em "Casos e coisas da Bahia," Angélica também era conhecida como uma desordeira que, quando bebia, quebrava os bares da capital por volta de 1910. Os cenários eram as ruas, os bordéis, os pontos de prostituição - a mesma geografia urbana que moldou os capoeiristas masculinos da época. Os motivos dos conflitos eram ciúmes, bebida, rixas pessoais - a moeda corrente da vida de rua na velha Bahia.\n\nAngélica pertencia a uma geração de lendárias capoeiristas e valentonas femininas cujas histórias foram transmitidas pela tradição oral. Ela era contemporânea de Salomé, Maria Doze Homens, Chicão, Rosa Palmeirão, Massú, Catu, Almerinda e Menininha - mulheres cujas histórias envolviam confrontos com a polícia, brigas com navalha, e até mortes de famosos valentões.\n\nO livro "Mestres e capoeiras famosos da Bahia" de Pedro Abib (2009) contém um capítulo intitulado "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca," documentando um encontro entre essas duas mulheres lendárias. O fato de seu conflito ter merecido um capítulo próprio demonstra o quão significativas essas figuras femininas eram na capoeiragem do início do século XX na Bahia.\n\nEmbora não haja evidência direta de que Angélica fosse capoeirista no sentido formal, os jornais e a polícia da época rotulavam mulheres como ela dessa forma. O domínio da navalha, canivete, faca e punhal sugere que ela fazia parte da cultura da capoeiragem, pois essas armas eram as companheiras dos praticantes de capoeira pós-escravidão.\n\nA história de Angélica foi lembrada na literatura de cordel - os livretos populares impressos que celebravam figuras lendárias. Junto com Besouro Mangangá, Inocêncio Sete Mortes e Maria Doze Homem, ela se tornou parte do folclore que manteve viva a memória da velha capoeiragem.\n\nA tese de doutorado "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" de Paula Juliana Foltran (2019, Universidade de Brasília) representa o estudo acadêmico mais abrangente sobre mulheres como Angélica. A pesquisa de Foltran no Arquivo Público do Estado da Bahia identificou centenas de mulheres envolvidas em lutas de rua durante este período, desmontando definitivamente o mito de que a capoeira era um domínio exclusivamente masculino.',
  E'One of the legendary valentonas of early 20th century Bahia; immortalized in literatura de cordel alongside Besouro Mangangá; subject of a chapter in "Mestres e capoeiras famosos da Bahia" (2009)',
  E'Uma das lendárias valentonas do início do século XX na Bahia; imortalizada na literatura de cordel ao lado de Besouro Mangangá; tema de um capítulo em "Mestres e capoeiras famosos da Bahia" (2009)',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1885, decade precision):\nActive as valentona from 1910-1920 per newspaper records. If in prime fighting age (25-35) during this period, birth = ~1875-1895. Using 1885 as midpoint.\n\nFULL NAME: Anna Angélica (per Espeto Capoeira article). Surname unknown.\n\nDEATH: Unknown. No death records found.\n\nAPELIDO MEANING: "Endiabrada" = "possessed by the devil" or "wild/devilish." Given as adjective to women skilled in physical combat.\n\nKEY INCIDENT: Confronted civil guard, resisted arrest, struck officer breaking his mouth. This incident earned her the "Endiabrada" epithet.\n\nNEWSPAPER RECORDS: Frequently appeared in Salvador newspaper headlines and police records between 1910-1920.\n\nBOOK CHAPTER: "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" in "Mestres e capoeiras famosos da Bahia" (JSTOR, Pedro Abib 2009).\n\nCORDEL LITERATURE: Remembered in literatura de cordel alongside Besouro Mangangá, Inocêncio Sete Mortes, Maria Doze Homem.\n\nCAVEAT: No direct proof she practiced capoeira formally. Newspapers/police labeled valentonas as capoeiristas. Weapon mastery (navalha, canivete, faca, punhal) suggests connection to capoeiragem culture.\n\nCONTEMPORARY VALENTONAS (1910s-1920s):\n- Salomé (active 1920s-1930s)\n- Maria Doze Homens\n- Chicão (Francisca Albino dos Santos, killed Pedro Porreta 1929)\n- Rosa Palmeirão (Cândida Rosa de Jesus)\n- Massú\n- Catu\n- Almerinda\n- Menininha\n- Adelaide Presepeira (1920s-1930s)\n- Idalina (arrested multiple times 1910s-1920s)\n\nPRIMARY SOURCES:\n- Antônio Vianna, "Casos e coisas da Bahia" (1950, 1984)\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (2009)\n- Paula Juliana Foltran, "Mulheres incorrigíveis" PhD thesis (UnB, 2019)\n- Newspaper archives: Jornal de Notícias, Gazeta do Povo (1910s-1920s)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1885, precisão de década):\nAtiva como valentona de 1910-1920 segundo registros de jornais. Se estava em idade de luta (25-35) durante este período, nascimento = ~1875-1895. Usando 1885 como ponto médio.\n\nNOME COMPLETO: Anna Angélica (segundo artigo Espeto Capoeira). Sobrenome desconhecido.\n\nMORTE: Desconhecida. Nenhum registro de óbito encontrado.\n\nSIGNIFICADO DO APELIDO: "Endiabrada" = "possuída pelo diabo" ou "selvagem/diabólica." Dado como adjetivo a mulheres hábeis no combate físico.\n\nINCIDENTE PRINCIPAL: Enfrentou guarda civil, resistiu à prisão, bateu no oficial quebrando sua boca. Este incidente lhe rendeu o epíteto "Endiabrada."\n\nREGISTROS DE JORNAIS: Aparecia frequentemente nas manchetes dos jornais de Salvador e registros policiais entre 1910-1920.\n\nCAPÍTULO DE LIVRO: "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" em "Mestres e capoeiras famosos da Bahia" (JSTOR, Pedro Abib 2009).\n\nLITERATURA DE CORDEL: Lembrada na literatura de cordel ao lado de Besouro Mangangá, Inocêncio Sete Mortes, Maria Doze Homem.\n\nRESALVA: Nenhuma prova direta de que praticava capoeira formalmente. Jornais/polícia rotulavam valentonas como capoeiristas. Domínio de armas (navalha, canivete, faca, punhal) sugere conexão com a cultura da capoeiragem.\n\nVALENTONAS CONTEMPORÂNEAS (1910s-1920s):\n- Salomé (ativa 1920s-1930s)\n- Maria Doze Homens\n- Chicão (Francisca Albino dos Santos, matou Pedro Porreta 1929)\n- Rosa Palmeirão (Cândida Rosa de Jesus)\n- Massú\n- Catu\n- Almerinda\n- Menininha\n- Adelaide Presepeira (1920s-1930s)\n- Idalina (presa várias vezes 1910s-1920s)\n\nFONTES PRIMÁRIAS:\n- Antônio Vianna, "Casos e coisas da Bahia" (1950, 1984)\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (2009)\n- Paula Juliana Foltran, "Mulheres incorrigíveis" tese PhD (UnB, 2019)\n- Arquivos de jornais: Jornal de Notícias, Gazeta do Povo (1910s-1920s)'
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

-- Source: entities/persons/boca-rica.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Boca Rica
-- Generated: 2025-12-19
-- ============================================================
-- Mestre Boca Rica (Manoel Silva) is a living mestre, born
-- November 26, 1936 in Maragogipe, Bahia. Direct student of
-- Mestre Pastinha at CECA. Founder of Escola de Capoeira Angola
-- da Bahia (1970). International ambassador of Capoeira Angola.
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
  'Manoel Silva',
  'Boca Rica',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-18', 'https://bocarica.wordpress.com/mestre-boca-rica/', 'https://portalcapoeira.com/diretorio/ecaba-escola-de-capoeira-angola-da-bahia-mestre-boca-rica/', 'https://www.capoeirahub.net/mestres']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'One of the few mestres who maintains the traditional deep tuning of the berimbaus "like the old ones." Expert berimbau player knowing multiple toques including several from Capoeira Regional. Renowned vocalist with distinctive interpretations of traditional songs including "Mandei caiar meu sobrado," "Maranhão," and "Sambalelê bateu na porta." Emphasizes musicality and oral tradition in his teaching.',
  E'Um dos poucos mestres que mantém a afinação grave tradicional dos berimbaus "como os antigos." Tocador expert de berimbau conhecendo múltiplos toques incluindo vários da Capoeira Regional. Cantor renomado com interpretações distintivas de cantigas tradicionais incluindo "Mandei caiar meu sobrado," "Maranhão," e "Sambalelê bateu na porta." Enfatiza a musicalidade e a tradição oral em seu ensino.',
  -- Life dates
  1936,
  'exact'::genealogy.date_precision,
  'Maragogipe, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Manoel Silva was born on November 26, 1936, in Maragogipe, in the Recôncavo Baiano region of Bahia. His parents were Palmira and Cândido Silva. At twelve years old, he discovered capoeira. At fifteen, in the early 1950s, he moved to Salvador, where his life would be transformed by the art.

In 1952, the young Manoel began training at the Centro Esportivo de Capoeira Angola (CECA), Mestre Pastinha''s legendary academy at Praça do Pelourinho n° 19. It was Pastinha himself who gave him the apelido "Boca Rica"—because of the gold teeth that lined the entire upper row of his mouth, a mark of status in that era. The name stuck, and it would become known across five continents.

Beyond CECA, Boca Rica frequented the famous barracão of Mestre Waldemar at the Passeio de Aguinelo in the Liberdade neighborhood, and other rodas throughout Salvador. He absorbed knowledge wherever he found it, seeking out accomplished mestres and different traditions. In interviews, he described Pastinha as "a philosopher" and "my second father," explaining that Pastinha taught systematically—instructing students on rhythms, their names, and applications. His musical references became threefold: Mestre Pastinha for tradition, Mestre Waldemar da Paixão for singing, and Mestre Bimba for the sounds of Regional.

Boca Rica accompanied Pastinha until the master''s final days. After Pastinha went blind, Boca Rica would bring his students to perform at the academy in Pelourinho. Pastinha reportedly still played "by touch" despite his blindness. Boca Rica committed himself to spreading Pastinha''s legacy, telling his mestre: "wherever I go, your name is being spread."

The 1960s saw Boca Rica appearing in photographs on the streets of Liberdade alongside the great mestres of the era—João Pequeno, Waldemar, Curió, Bigodinho, and Olavo. He participated in the recording of the film "O Pagador de Promessas" (1962), the Palme d''Or winner that brought capoeira to international screens. In 1988, he participated in the Velha Guarda da Bahia event in Fortaleza at the Colégio Militar, joining mestres Waldemar and Curió.

In 1970, Boca Rica founded the Escola de Capoeira Angola da Bahia (ECAB) at the Forte de Santo Antônio Além do Carmo in Salvador—the historic fort that today serves as the Forte da Capoeira cultural center. The school continues to operate daily, a temple of learning, music, and tradition. His organization reports 10 mestres, 5 contra-mestres, 5 professors, and approximately 50 students trained. The school maintains operations in Bahia, Goiás, and internationally in England.

Capoeira carried Boca Rica across the world. He has traveled to more than 50 countries and visited all Brazilian states except Piauí and southern Maranhão. Among his most remarkable experiences: performing for Queen Elizabeth II and the Princess of Denmark, receiving the "Notório Saber" title (Notable Knowledge, an academic recognition) from D. Pedro II College of Salvador, and being awarded the Thomé de Souza Medal by Salvador''s City Council in 2018.

As a recording artist, Boca Rica has released over 14 albums dedicated to capoeira. In 2000, he recorded a collaborative CD "Capoeira Angola" with Mestre Bigodinho—37 songs capturing the samba-de-roda tradition both mestres loved. Other releases include "A Poesia de Boca Rica" (2000) and "Vencedor de Demanda" (2019). His voice has become unmistakable in songs like "Mandei caiar meu sobrado," "Maranhão," and "Sambalelê bateu na porta."

Boca Rica served on the board of ABCA (Associação Brasileira de Capoeira Angola), the principal Angola organization in Brazil, helping to preserve and promote the traditional art. Capoeiristas and researchers from around the world continue to travel to Salvador to learn from and meet him at the Forte da Capoeira.

In 2020, a biography was published: "Manoel Silva Mestre Boca Rica - Histórias e Lições de Vida, Preciosidade da Capoeira," authored by Thercio Sabino (CM Coelho) and Luiz Normanha. The book gathers his reports, speeches, and documents, preserving for future generations the enormous legacy of this faithful student of Mestre Pastinha.

At 88 years old, Boca Rica remains active in capoeira rodas, still singing and enchanting audiences with the deep philosophy and musicality he inherited from Pastinha. His message to younger generations: "não deixem essa capoeira morrer"—don''t let this capoeira die.',
  -- bio_pt
  E'Manoel Silva nasceu em 26 de novembro de 1936, em Maragogipe, na região do Recôncavo Baiano. Seus pais foram Palmira e Cândido Silva. Aos doze anos, descobriu a capoeira. Aos quinze, no início dos anos 1950, mudou-se para Salvador, onde sua vida seria transformada pela arte.

Em 1952, o jovem Manoel começou a treinar no Centro Esportivo de Capoeira Angola (CECA), a lendária academia de Mestre Pastinha na Praça do Pelourinho n° 19. Foi o próprio Pastinha quem lhe deu o apelido "Boca Rica"—por causa dos dentes de ouro que ocupavam toda a parte superior de sua boca, uma marca de status naquela época. O nome ficou, e se tornaria conhecido em cinco continentes.

Além do CECA, Boca Rica frequentava o famoso barracão de Mestre Waldemar no Passeio de Aguinelo no bairro da Liberdade, e outras rodas por toda Salvador. Absorvia conhecimento onde quer que encontrasse, buscando mestres realizados e diferentes tradições. Em entrevistas, descreveu Pastinha como "um filósofo" e "meu segundo pai," explicando que Pastinha ensinava sistematicamente—instruindo os alunos sobre ritmos, seus nomes e aplicações. Suas referências musicais tornaram-se tríplices: Mestre Pastinha para tradição, Mestre Waldemar da Paixão para canto, e Mestre Bimba para os sons do Regional.

Boca Rica acompanhou Pastinha até os últimos dias do mestre. Depois que Pastinha ficou cego, Boca Rica levava seus alunos para se apresentar na academia no Pelourinho. Pastinha supostamente ainda tocava "pelo tato" apesar de sua cegueira. Boca Rica comprometeu-se a espalhar o legado de Pastinha, dizendo ao seu mestre: "por onde eu for, seu nome está sendo espalhado."

Os anos 1960 viram Boca Rica aparecer em fotografias nas ruas da Liberdade ao lado dos grandes mestres da época—João Pequeno, Waldemar, Curió, Bigodinho e Olavo. Participou da gravação do filme "O Pagador de Promessas" (1962), o vencedor da Palma de Ouro que levou a capoeira às telas internacionais. Em 1988, participou do evento Velha Guarda da Bahia em Fortaleza no Colégio Militar, juntando-se aos mestres Waldemar e Curió.

Em 1970, Boca Rica fundou a Escola de Capoeira Angola da Bahia (ECAB) no Forte de Santo Antônio Além do Carmo em Salvador—o forte histórico que hoje serve como centro cultural Forte da Capoeira. A escola continua a funcionar diariamente, um templo de aprendizado, música e tradição. Sua organização reporta 10 mestres, 5 contra-mestres, 5 professores e aproximadamente 50 alunos formados. A escola mantém operações na Bahia, Goiás e internacionalmente na Inglaterra.

A capoeira levou Boca Rica pelo mundo. Viajou para mais de 50 países e visitou todos os estados brasileiros exceto Piauí e sul do Maranhão. Entre suas experiências mais notáveis: apresentar-se para a Rainha Elizabeth II e a Princesa da Dinamarca, receber o título de "Notório Saber" (um reconhecimento acadêmico) do Colégio D. Pedro II de Salvador, e ser agraciado com a Medalha Thomé de Souza pela Câmara Municipal de Salvador em 2018.

Como artista de gravação, Boca Rica lançou mais de 14 álbuns dedicados à capoeira. Em 2000, gravou um CD colaborativo "Capoeira Angola" com Mestre Bigodinho—37 canções capturando a tradição do samba-de-roda que ambos os mestres amavam. Outros lançamentos incluem "A Poesia de Boca Rica" (2000) e "Vencedor de Demanda" (2019). Sua voz tornou-se inconfundível em cantigas como "Mandei caiar meu sobrado," "Maranhão," e "Sambalelê bateu na porta."

Boca Rica serviu no conselho da ABCA (Associação Brasileira de Capoeira Angola), a principal organização de Angola no Brasil, ajudando a preservar e promover a arte tradicional. Capoeiristas e pesquisadores de todo o mundo continuam a viajar para Salvador para aprender e encontrá-lo no Forte da Capoeira.

Em 2020, uma biografia foi publicada: "Manoel Silva Mestre Boca Rica - Histórias e Lições de Vida, Preciosidade da Capoeira," de autoria de Thercio Sabino (CM Coelho) e Luiz Normanha. O livro reúne seus relatos, falas e documentos, preservando para gerações futuras o enorme legado deste fiel discípulo de Mestre Pastinha.

Aos 88 anos, Boca Rica permanece ativo nas rodas de capoeira, ainda cantando e encantando audiências com a profunda filosofia e musicalidade que herdou de Pastinha. Sua mensagem para as gerações mais jovens: "não deixem essa capoeira morrer."',
  -- achievements_en
  E'Founded Escola de Capoeira Angola da Bahia (ECAB) in 1970 at Forte de Santo Antônio Além do Carmo, Salvador
Recorded over 14 albums including "Capoeira Angola" with Mestre Bigodinho (2000), "A Poesia de Boca Rica" (2000), "Vencedor de Demanda" (2019)
Traveled to 50+ countries and all Brazilian states (except Piauí and southern Maranhão) spreading Capoeira Angola
Performed for Queen Elizabeth II and the Princess of Denmark
Participated in filming of "O Pagador de Promessas" (1962), Palme d''Or winner at Cannes
Received "Notório Saber" (Notable Knowledge) title from D. Pedro II College of Salvador
Awarded Thomé de Souza Medal by Salvador City Council (2018)
Board member of ABCA (Associação Brasileira de Capoeira Angola)
Direct student and close companion of Mestre Pastinha until his death (1981)
Participated in Velha Guarda da Bahia event in Fortaleza (1988)',
  -- achievements_pt
  E'Fundou a Escola de Capoeira Angola da Bahia (ECAB) em 1970 no Forte de Santo Antônio Além do Carmo, Salvador
Gravou mais de 14 álbuns incluindo "Capoeira Angola" com Mestre Bigodinho (2000), "A Poesia de Boca Rica" (2000), "Vencedor de Demanda" (2019)
Viajou para mais de 50 países e todos os estados brasileiros (exceto Piauí e sul do Maranhão) difundindo a Capoeira Angola
Apresentou-se para a Rainha Elizabeth II e a Princesa da Dinamarca
Participou da filmagem de "O Pagador de Promessas" (1962), vencedor da Palma de Ouro em Cannes
Recebeu título de "Notório Saber" do Colégio D. Pedro II de Salvador
Agraciado com a Medalha Thomé de Souza pela Câmara Municipal de Salvador (2018)
Membro do conselho da ABCA (Associação Brasileira de Capoeira Angola)
Aluno direto e companheiro próximo de Mestre Pastinha até sua morte (1981)
Participou do evento Velha Guarda da Bahia em Fortaleza (1988)',
  -- notes_en
  E'BIRTH DATE: November 26, 1936 - confirmed across multiple sources (velhosmestres.com, Portal Capoeira, IPHAN registry, Last.fm biography).

BIRTHPLACE: Maragogipe, Recôncavo Baiano, Bahia - confirmed across multiple sources.

PARENTS: Palmira (mother) and Cândido Silva (father) - documented at velhosmestres.com.

APELIDO ORIGIN: Given by Mestre Pastinha because of gold teeth on entire upper row of his mouth - confirmed across multiple sources.

TEACHERS:
- Mestre Pastinha (primary, 1952 onwards, CECA Pelourinho n° 19)
- Mestre Waldemar da Paixão (additional training at barracão, Passeio de Aguinelo, Liberdade)
- Also visited Mestre Bimba''s academy to learn Regional techniques

DISCOGRAPHY (confirmed recordings):
- 2000: "Capoeira Angola" with Mestre Bigodinho (37 songs, collaborative)
- 2000: "A Poesia de Boca Rica"
- 2019: "Vencedor de Demanda"
- 14+ total albums claimed

MEDIA APPEARANCES:
- 1960s: Photographed with João Pequeno, Waldemar, Curió, Bigodinho, Olavo on streets of Liberdade
- 1962: Film "O Pagador de Promessas" (Palme d''Or winner)
- Documentary "Fly Away Beetle" (testimony alongside Olavo dos Santos and Cobra Mansa)

TRAVEL DISCREPANCY:
- Some sources say 30+ countries, others 40+, others 50+ countries
- IPHAN registry says 50+ and all Brazilian states except Piauí and southern Maranhão
- Using 50+ as most authoritative (government registry)

FOUNDING DATE ECAB:
- IPHAN registry lists 1970 as founding year
- Co-founders listed as "Manoel Silva and Mestre Boca Rica" (same person, likely data entry issue)

NOTABLE STUDENTS:
- Mestre Valu (Grupo Balança Capoeira, Salvador)
- Contramestra Carol Canguçu (current support in Salvador)
- Students teaching in France, Argentina, USA, and other countries

RODA LOCATION: Forte da Capoeira, Largo de Santo Antônio Além do Carmo, Salvador, Bahia (ZIP: 40301-280)

PENDING RELATIONSHIPS:
- Boca Rica associated_with Viva Bahia (folkloric group; listed alongside many mestres who passed through)',
  -- notes_pt
  E'DATA DE NASCIMENTO: 26 de novembro de 1936 - confirmado em múltiplas fontes (velhosmestres.com, Portal Capoeira, registro IPHAN, biografia Last.fm).

LOCAL DE NASCIMENTO: Maragogipe, Recôncavo Baiano, Bahia - confirmado em múltiplas fontes.

PAIS: Palmira (mãe) e Cândido Silva (pai) - documentado em velhosmestres.com.

ORIGEM DO APELIDO: Dado por Mestre Pastinha por causa dos dentes de ouro em toda a parte superior de sua boca - confirmado em múltiplas fontes.

PROFESSORES:
- Mestre Pastinha (principal, 1952 em diante, CECA Pelourinho n° 19)
- Mestre Waldemar da Paixão (treino adicional no barracão, Passeio de Aguinelo, Liberdade)
- Também visitou a academia de Mestre Bimba para aprender técnicas do Regional

DISCOGRAFIA (gravações confirmadas):
- 2000: "Capoeira Angola" com Mestre Bigodinho (37 cantigas, colaborativo)
- 2000: "A Poesia de Boca Rica"
- 2019: "Vencedor de Demanda"
- 14+ álbuns no total alegados

APARIÇÕES NA MÍDIA:
- Anos 1960: Fotografado com João Pequeno, Waldemar, Curió, Bigodinho, Olavo nas ruas da Liberdade
- 1962: Filme "O Pagador de Promessas" (vencedor da Palma de Ouro)
- Documentário "Fly Away Beetle" (depoimento junto com Olavo dos Santos e Cobra Mansa)

DISCREPÂNCIA DE VIAGENS:
- Algumas fontes dizem 30+ países, outras 40+, outras 50+ países
- Registro IPHAN diz 50+ e todos os estados brasileiros exceto Piauí e sul do Maranhão
- Usando 50+ como mais autoritativo (registro governamental)

DATA DE FUNDAÇÃO ECAB:
- Registro IPHAN lista 1970 como ano de fundação
- Co-fundadores listados como "Manoel Silva e Mestre Boca Rica" (mesma pessoa, provavelmente erro de entrada de dados)

ALUNOS NOTÁVEIS:
- Mestre Valu (Grupo Balança Capoeira, Salvador)
- Contramestra Carol Canguçu (suporte atual em Salvador)
- Alunos ensinando na França, Argentina, EUA e outros países

LOCAL DA RODA: Forte da Capoeira, Largo de Santo Antônio Além do Carmo, Salvador, Bahia (CEP: 40301-280)

RELACIONAMENTOS PENDENTES:
- Boca Rica associated_with Viva Bahia (grupo folclórico; listado junto com muitos mestres que passaram)'
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

-- Source: entities/persons/chicao.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Chicão
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1900 (decade precision)
-- Active as valentona in late 1920s-1930s. If 25-35 during the 1929
-- confrontation with Pedro Porreta, birth = ~1894-1904.
-- Using 1900 as midpoint estimate.
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
  'Francisca Albino dos Santos',
  'Chicão',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://books.scielo.org/id/pvm8g']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era practitioner. No formal style designation existed during her active period (1920s-1930s). Known for hand-to-hand combat skills and possibly weapon handling (razors, knives) common among capoeiristas of the period. Her precise fighting techniques are undocumented, but her ability to defeat the notorious Pedro Porreta suggests significant combat prowess.',
  E'Praticante da era pré-moderna. Nenhuma designação formal de estilo existia durante seu período de atividade (1920s-1930s). Conhecida por habilidades de combate corpo a corpo e possivelmente manuseio de armas (navalhas, facas) comuns entre os capoeiristas do período. Suas técnicas de luta precisas não são documentadas, mas sua capacidade de derrotar o notório Pedro Porreta sugere considerável destreza em combate.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Francisca Albino dos Santos, known as Chicão, was a formidable valentona (tough woman) who operated in the streets and brothels of early 20th century Salvador, Bahia. In a world where capoeira was criminalized and female practitioners were exceptionally rare, Chicão carved out a fearsome reputation that made her name synonymous with female defiance.\n\nChicão worked as a prostitute and was well-known to the police forces of Salvador. The book "Mestres e capoeiras famosos da Bahia" dedicates a chapter to her titled "Chicão: Tá pensando o quê?" (What are you thinking?), situating her among the legendary figures of Bahian capoeiragem.\n\nThe most documented episode of her life occurred on September 28, 1929. Pedro Porreta, one of Salvador''s most notorious capoeiristas and the man known as one of "Os donos do quarteirão" (The owners of the block) in the Baixa dos Sapateiros neighborhood, invaded Chicão''s room. He was searching for intimate clothing belonging to one of his female companions who resided with Chicão. Feeling violated, Chicão unleashed a barrage of precise blows that left Porreta badly beaten. The newspapers of the era reported the "valente Porreta" - this feared fish seller and pimp who had killed men and dominated entire neighborhoods - arriving at the police station covered in injuries.\n\nChicão was detained for the assault, but her story did not end there. Some time after this confrontation, Pedro Porreta was assassinated, and Chicão emerged as the main suspect. Whether she was ever convicted remains unclear in the historical record, but the episode cemented her reputation as a woman who could not only stand up to Salvador''s most dangerous men but eliminate them entirely.\n\nThe academic Paula Juliana Foltran in her doctoral thesis "Mulheres Incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" includes a chapter titled "Chicão, a última dos tempos dos valentes" (Chicão, the last of the brave times), examining how Chicão''s story has been treated in capoeira historiography and challenging the "masculinization of bravery and disorder" that has often erased women from capoeira''s violent past.\n\nChicão stands alongside other legendary valentonas of Bahia - Salomé, Maria Doze Homens, Angélica Endiabrada, Rosa Palmeirão, Massú, and Catu - women whose handling of razors, knives, and their own fists led researchers to believe they were indeed capoeiristas, even when formal proof is elusive. The scenarios were the streets, the brothels, the prostitution zones. The motives were jealousy, alcohol, personal rivalries. These were the defining characteristics of the old capoeiristas of Bahia, and Chicão exemplified them as powerfully as any man.',
  E'Francisca Albino dos Santos, conhecida como Chicão, foi uma formidável valentona que operava nas ruas e bordéis de Salvador, Bahia, no início do século XX. Em um mundo onde a capoeira era criminalizada e praticantes femininas eram excepcionalmente raras, Chicão construiu uma reputação temível que tornou seu nome sinônimo de desafio feminino.\n\nChicão trabalhava como prostituta e era bem conhecida pelas forças policiais de Salvador. O livro "Mestres e capoeiras famosos da Bahia" dedica um capítulo a ela intitulado "Chicão: Tá pensando o quê?", situando-a entre as figuras lendárias da capoeiragem baiana.\n\nO episódio mais documentado de sua vida ocorreu em 28 de setembro de 1929. Pedro Porreta, um dos capoeiristas mais notórios de Salvador e o homem conhecido como um dos "Os donos do quarteirão" no bairro da Baixa dos Sapateiros, invadiu o quarto de Chicão. Ele procurava roupas íntimas pertencentes a uma de suas companheiras que residia com Chicão. Sentindo-se ultrajada, Chicão desferiu uma série de golpes certeiros que deixaram Porreta muito machucado. Os jornais da época noticiaram o "valente Porreta" - este temido vendedor de peixe e cafetão que havia matado homens e dominado bairros inteiros - chegando à delegacia coberto de ferimentos.\n\nChicão foi detida pela agressão, mas sua história não terminou ali. Algum tempo depois desse confronto, Pedro Porreta foi assassinado, e Chicão surgiu como a principal suspeita. Se ela foi condenada permanece obscuro no registro histórico, mas o episódio cimentou sua reputação como uma mulher que não só podia enfrentar os homens mais perigosos de Salvador, mas eliminá-los completamente.\n\nA acadêmica Paula Juliana Foltran em sua tese de doutorado "Mulheres Incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" inclui um capítulo intitulado "Chicão, a última dos tempos dos valentes", examinando como a história de Chicão foi tratada na historiografia da capoeira e desafiando a "masculinização da valentia e da desordem" que frequentemente apagou as mulheres do passado violento da capoeira.\n\nChicão está ao lado de outras lendárias valentonas da Bahia - Salomé, Maria Doze Homens, Angélica Endiabrada, Rosa Palmeirão, Massú e Catu - mulheres cujo manuseio de navalhas, facas e seus próprios punhos levou pesquisadores a acreditar que eram de fato capoeiristas, mesmo quando a prova formal é elusiva. Os cenários eram as ruas, os bordéis, as zonas de prostituição. Os motivos eram ciúmes, bebidas, rivalidades pessoais. Estas eram as características definidoras dos antigos capoeiristas da Bahia, e Chicão as exemplificou tão poderosamente quanto qualquer homem.',
  -- Achievements
  'Defeated Pedro Porreta, one of Salvador''s most notorious valentões, on September 28, 1929; featured in "Mestres e capoeiras famosos da Bahia" with chapter titled "Chicão: Tá pensando o quê?"; subject of academic study in Paula Juliana Foltran''s "Mulheres Incorrigíveis" (2019/2021); recognized as one of the legendary valentonas of early 20th century Bahia',
  'Derrotou Pedro Porreta, um dos valentões mais notórios de Salvador, em 28 de setembro de 1929; apresentada em "Mestres e capoeiras famosos da Bahia" com capítulo intitulado "Chicão: Tá pensando o quê?"; tema de estudo acadêmico na tese de Paula Juliana Foltran "Mulheres Incorrigíveis" (2019/2021); reconhecida como uma das lendárias valentonas da Bahia do início do século XX',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1900, decade precision): Active as valentona in late 1920s-1930s. If 25-35 during the 1929 confrontation with Pedro Porreta, birth = ~1894-1904. Using 1900 as midpoint.\n\nDEATH: Unknown. No records found of her death.\n\nNAME: Full name Francisca Albino dos Santos documented in sources. "Chicão" is a masculine-form nickname (augmentative of "Chico/Francisco"), possibly indicating her tough reputation.\n\nOCCUPATION: Prostitute ("valente prostituta conhecida das esquadras policiais").\n\nLEGAL RECORDS:\n- Sept 28, 1929: Assaulted Pedro Porreta after he invaded her room; detained\n- Post-1929: Main suspect in Pedro Porreta''s murder\n\nCONTEMPORARIES (Female Valentonas 1920s-1930s):\n- Salomé (student of Doze Homens)\n- Maria Doze Homens\n- Angélica Endiabrada (1910-1920s)\n- Rosa Palmeirão\n- Massú\n- Catu\n- Almerinda\n- Menininha\n\nACADEMIC SOURCES:\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (EDUFBA, 2009) - chapter "Chicão: Tá pensando o quê?"\n- Paula Juliana Foltran, "Mulheres Incorrigíveis" (thesis 2019, book 2021) - chapter "Chicão, a última dos tempos dos valentes"\n- Arruda, "Salvador, Ruas de Sangue" - source for valentona context\n\nSOURCES: Espeto Capoeira blog, SciELO Books ("Mestres e capoeiras famosos da Bahia"), Portal Capoeira, Dandara Editora (Mulheres Incorrigíveis), UnB Repository (Foltran thesis).',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Ativa como valentona no final dos anos 1920-1930. Se tinha 25-35 anos durante o confronto de 1929 com Pedro Porreta, nascimento = ~1894-1904. Usando 1900 como ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado de sua morte.\n\nNOME: Nome completo Francisca Albino dos Santos documentado nas fontes. "Chicão" é um apelido de forma masculina (aumentativo de "Chico/Francisco"), possivelmente indicando sua reputação de durona.\n\nOCUPAÇÃO: Prostituta ("valente prostituta conhecida das esquadras policiais").\n\nREGISTROS LEGAIS:\n- 28 set 1929: Agrediu Pedro Porreta após ele invadir seu quarto; detida\n- Pós-1929: Principal suspeita do assassinato de Pedro Porreta\n\nCONTEMPORÂNEAS (Valentonas 1920s-1930s):\n- Salomé (aluna de Doze Homens)\n- Maria Doze Homens\n- Angélica Endiabrada (1910-1920s)\n- Rosa Palmeirão\n- Massú\n- Catu\n- Almerinda\n- Menininha\n\nFONTES ACADÊMICAS:\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (EDUFBA, 2009) - capítulo "Chicão: Tá pensando o quê?"\n- Paula Juliana Foltran, "Mulheres Incorrigíveis" (tese 2019, livro 2021) - capítulo "Chicão, a última dos tempos dos valentes"\n- Arruda, "Salvador, Ruas de Sangue" - fonte para contexto de valentonas\n\nFONTES: Blog Espeto Capoeira, SciELO Books ("Mestres e capoeiras famosos da Bahia"), Portal Capoeira, Dandara Editora (Mulheres Incorrigíveis), Repositório UnB (tese Foltran).'
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

-- Source: entities/persons/curio-velho.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Curió Velho (Pedro Virício)
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1870s, decade):
-- José Martins dos Santos (his son) was photographed at ~100 years old
-- in 2000, suggesting José was born ~1900. Pedro Virício as his father
-- would have been born one generation earlier (~1870-1880). Pedro was
-- still alive and actively teaching capoeira to young Curió in 1943,
-- when he would have been ~65-73 years old if born in the 1870s.
-- Using 1875 as midpoint estimate with decade precision.
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
  'Pedro Virício',
  'Curió Velho',
  'grandfather of Mestre Curió',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1875,
  'decade'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Pedro Virício, known as Curió or "Curió Grande" (Big Curió), was one of the great angoleiros of Santo Amaro and Salvador in the late 19th and early 20th centuries. He is the patriarch of a four-generation capoeira lineage that produced one of Capoeira Angola''s most celebrated guardians: his grandson Mestre Curió.

Pedro Virício earned the apelido "Curió" (a Brazilian songbird known for its melodious voice and fighting spirit) through his prowess in capoeira. The nickname would later pass to his grandson Jaime Martins dos Santos, who inherited not only the name but the distinctive style—locals would say "It''s the same game as grandfather!" when watching young Jaime play.

Santo Amaro da Purificação, in the Recôncavo Baiano, was fertile ground for capoeira in Pedro Virício''s time. The region produced legendary practitioners including Besouro Mangangá, and the art flourished in the dock areas, church festivals, and rural communities. According to family accounts, Pedro Virício was connected to this tradition, with some sources suggesting he may have been related to an earlier "Besouro de Santo Amaro"—distinct from the famous Besouro Mangangá.

Pedro Virício married and had a son, José Martins dos Santos (later known as Malvadeza), whom he trained in capoeira. Together, Pedro and José would transmit the family tradition to the next generation. Beginning in 1943, when his grandson Jaime was only six years old, Pedro Virício took an active role in teaching the boy capoeira alongside José. Despite his advanced age—likely in his late 60s or early 70s—Pedro remained capable of transmitting the physical and philosophical foundations of Capoeira Angola.

Mestre Curió speaks of his grandfather with reverence, describing him as "um dos grandes angoleiros da cidade de Salvador" (one of the great angoleiros of the city of Salvador). The family''s deep roots in capoeira—extending at least to Pedro Virício and possibly to his own father—allowed Curió to declare himself "filho de angoleiro, neto de angoleiro, bisneto de angoleiro" (son, grandson, and great-grandson of capoeira practitioners).

Pedro Virício represents the generation of capoeiristas who practiced during the period of prohibition (1890-1937), when the art was criminalized in Brazil. That he maintained and transmitted the tradition despite legal persecution speaks to his dedication to preserving this cultural heritage.',
  -- bio_pt
  E'Pedro Virício, conhecido como Curió ou "Curió Grande", foi um dos grandes angoleiros de Santo Amaro e Salvador no final do século XIX e início do século XX. Ele é o patriarca de uma linhagem de capoeira de quatro gerações que produziu um dos mais celebrados guardiões da Capoeira Angola: seu neto Mestre Curió.

Pedro Virício ganhou o apelido "Curió" (um pássaro brasileiro conhecido por sua voz melodiosa e espírito combativo) através de sua habilidade na capoeira. O apelido passaria depois para seu neto Jaime Martins dos Santos, que herdou não apenas o nome mas o estilo distintivo—os locais diziam "É o mesmo jogo do avô!" ao ver o jovem Jaime jogar.

Santo Amaro da Purificação, no Recôncavo Baiano, era terreno fértil para a capoeira no tempo de Pedro Virício. A região produziu praticantes lendários incluindo Besouro Mangangá, e a arte floresceu nas áreas portuárias, festas de igreja e comunidades rurais. Segundo relatos familiares, Pedro Virício estava conectado a esta tradição, com algumas fontes sugerindo que ele pode ter sido parente de um "Besouro de Santo Amaro" anterior—distinto do famoso Besouro Mangangá.

Pedro Virício casou-se e teve um filho, José Martins dos Santos (mais tarde conhecido como Malvadeza), a quem treinou na capoeira. Juntos, Pedro e José transmitiriam a tradição familiar para a próxima geração. A partir de 1943, quando seu neto Jaime tinha apenas seis anos, Pedro Virício assumiu papel ativo no ensino de capoeira ao menino junto com José. Apesar de sua idade avançada—provavelmente na casa dos 60 ou 70 anos—Pedro permanecia capaz de transmitir os fundamentos físicos e filosóficos da Capoeira Angola.

Mestre Curió fala de seu avô com reverência, descrevendo-o como "um dos grandes angoleiros da cidade de Salvador". As raízes profundas da família na capoeira—estendendo-se pelo menos até Pedro Virício e possivelmente até seu próprio pai—permitiram a Curió declarar-se "filho de angoleiro, neto de angoleiro, bisneto de angoleiro".

Pedro Virício representa a geração de capoeiristas que praticaram durante o período de proibição (1890-1937), quando a arte era criminalizada no Brasil. Que ele tenha mantido e transmitido a tradição apesar da perseguição legal fala de sua dedicação em preservar este patrimônio cultural.',
  -- achievements_en
  E'Patriarch of multi-generational capoeira family; Transmitted apelido "Curió" and Angola tradition to grandson Mestre Curió; One of the great angoleiros of Santo Amaro/Salvador; Maintained capoeira practice through prohibition era (1890-1937)',
  -- achievements_pt
  E'Patriarca de família de capoeira multi-geracional; Transmitiu apelido "Curió" e tradição Angola para neto Mestre Curió; Um dos grandes angoleiros de Santo Amaro/Salvador; Manteve prática de capoeira durante era de proibição (1890-1937)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1875, decade):
José Martins dos Santos photographed at ~100 years old in 2000 → born ~1900. Pedro Virício as his father would have been born one generation earlier (~1870-1880). Still actively teaching capoeira in 1943, which is plausible for late 60s/early 70s age. Using 1875 as midpoint estimate.

NAME VARIATIONS:
- "Pedro Virício" - most common spelling
- "Pedro Vinícius Curió" - variant in tribunademinas.com article
- "Curió" - primary apelido
- "Curió Grande" - to distinguish from grandson
- "Curió Velho" - to distinguish from grandson
- "Curió de Santo Amaro" - regional designation

Using apelido "Curió Velho" with context "grandfather of Mestre Curió" to distinguish from his famous grandson.

FAMILY:
- Son: José Martins dos Santos (Malvadeza)
- Grandson: Jaime Martins dos Santos (Mestre Curió, b. 1937)
- Daughter-in-law: Maria Bispo (Pequena)

BESOURO CONNECTION DISCREPANCY:
Multiple versions exist regarding the family''s connection to Besouro:
1. Besouro Mangangá was "primo segundo" (second cousin) of José Martins dos Santos
2. An earlier "Besouro de Santo Amaro" (not Mangangá) was Pedro Virício''s father
3. Some sources conflate these, calling Besouro Mangangá "bisavô" of Curió

The most reliable version appears to be that Besouro Mangangá was a second cousin of José Martins, while there may have been an earlier Besouro in direct ancestry. This needs further investigation.

TEACHERS:
- Unknown; possibly learned from his father (potentially connected to earlier Besouro de Santo Amaro)

STUDENTS:
- José Martins dos Santos (son, Malvadeza)
- Jaime Martins dos Santos (grandson, Mestre Curió, from 1943)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1875, década):
José Martins dos Santos fotografado com ~100 anos em 2000 → nascido ~1900. Pedro Virício como seu pai teria nascido uma geração antes (~1870-1880). Ainda ensinando capoeira ativamente em 1943, o que é plausível para idade de final dos 60/início dos 70. Usando 1875 como estimativa média.

VARIAÇÕES DE NOME:
- "Pedro Virício" - grafia mais comum
- "Pedro Vinícius Curió" - variante em artigo tribunademinas.com
- "Curió" - apelido principal
- "Curió Grande" - para distinguir do neto
- "Curió Velho" - para distinguir do neto
- "Curió de Santo Amaro" - designação regional

Usando apelido "Curió Velho" com contexto "avô de Mestre Curió" para distinguir de seu famoso neto.

FAMÍLIA:
- Filho: José Martins dos Santos (Malvadeza)
- Neto: Jaime Martins dos Santos (Mestre Curió, n. 1937)
- Nora: Maria Bispo (Pequena)

DISCREPÂNCIA CONEXÃO COM BESOURO:
Existem múltiplas versões sobre a conexão da família com Besouro:
1. Besouro Mangangá era "primo segundo" de José Martins dos Santos
2. Um "Besouro de Santo Amaro" anterior (não Mangangá) era pai de Pedro Virício
3. Algumas fontes confundem estes, chamando Besouro Mangangá de "bisavô" de Curió

A versão mais confiável parece ser que Besouro Mangangá era primo segundo de José Martins, enquanto pode ter havido um Besouro anterior na ancestralidade direta. Isso precisa de investigação adicional.

MESTRES:
- Desconhecido; possivelmente aprendeu com seu pai (potencialmente conectado ao Besouro de Santo Amaro anterior)

ALUNOS:
- José Martins dos Santos (filho, Malvadeza)
- Jaime Martins dos Santos (neto, Mestre Curió, a partir de 1943)'
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

-- Source: entities/persons/curio.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Curió
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR: January 23, 1937 - verified from multiple sources
-- (velhosmestres.com, capoeirahub, cms.ba.gov.br)
-- Note: Portal Capoeira incorrectly lists 1939, but the majority
-- of sources including velhosmestres.com confirm 1937.
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
  'Jaime Martins dos Santos',
  'Curió',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25', 'https://www.capoeirahub.net/mestres/686db6ba1a348b787f2a068f-mestre-curio', 'https://portalcapoeira.com/capoeira/mestres/mestre-curio/', 'https://www.cms.ba.gov.br/noticias/medalha-zumbi-do-palmares-a-mestre-curio']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Curió is renowned for his unpredictable and theatrical style of Capoeira Angola. His game emphasizes mandinga (cunning/sagacity) over physical violence—"A capoeirista doesn''t need to strike to demonstrate skill." He embodies the philosophy that capoeira is "art, dance, cunning, philosophy, roguishness, theater, music, choreography and non-violence." His movements are deceptive and deliberate, prioritizing calm calculation over aggression.',
  E'Curió é conhecido por seu estilo imprevisível e teatral de Capoeira Angola. Seu jogo enfatiza a mandinga (astúcia/sagacidade) sobre a violência física—"Um capoeirista não precisa golpear para demonstrar habilidade." Ele incorpora a filosofia de que a capoeira é "arte, dança, malícia, filosofia, malandragem, teatro, música, coreografia e não violência." Seus movimentos são enganosos e deliberados, priorizando o cálculo calmo sobre a agressão.',
  -- Life dates
  1937,
  'exact'::genealogy.date_precision,
  'Candeias, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Jaime Martins dos Santos, known as Mestre Curió, was born on January 23, 1937, in Candeias, Bahia, into a family steeped in capoeira tradition. His father José Martins dos Santos—called Malvadeza or Martim da Pemba—was a capoeirista, as was his mother Maria Bispo (known as Pequena). His grandfather Pedro Virício, also a capoeirista, bore the same apelido "Curió" that his grandson would inherit. Raised in Santo Amaro, young Jaime was immersed in capoeira from age six, learning from his father and grandfather beginning in 1943.

At age seven, in 1944, Curió ran away from home—a brief chapter of his rebellious youth. By 1951, at only fourteen years old, he had already begun teaching capoeira himself, demonstrating remarkable early mastery of the art his family had transmitted to him.

In 1954, a young Curió appears in photographs at Mestre Waldemar''s legendary barracão in Liberdade, captured by French photographer Marcel Gautherot. These images place him among the vibrant roda scene of 1950s Salvador, alongside established figures of that golden era.

The decisive turning point came on April 10, 1968, when Curió formally joined Mestre Pastinha''s CECA (Centro Esportivo de Capoeira Angola) in Pelourinho. Under Pastinha—the father of Capoeira Angola—Curió absorbed not only technique but the philosophical foundations that would shape his entire approach to the art. He became one of Pastinha''s faithful disciples, alongside João Grande, João Pequeno, Boca Rica, Bola Sete, Gildo Alfinete, and Albertino.

When the Salvador city government forced Pastinha from the CECA building in 1971 during Pelourinho''s gentrification, Curió witnessed firsthand the displacement of his mestre. According to Curió, "with much resistance they were given a space for the academy on Ladeira do Ferrão, known as Ladeira do Mijo"—a painful chapter in the history of Capoeira Angola''s institutional struggle.

In June 1980, Curió participated in researcher Frede Abreu''s landmark "First Regional Capoeira Seminar and Festival of Capoeira Rhythms," held June 4-8 in Barris, Salvador. This event, attended by some 1,500 people, reunited the old guard of Capoeira Angola—Mestre Cobrinha Verde (who was "rediscovered" at this event), Mestre João Grande, Mestre Gigante, and others. It was a pivotal moment for the revival of traditional capoeira.

On January 7, 1982, Curió founded the Escola de Capoeira Angola Irmãos Gêmeos (ECAIG)—the "Twin Brothers School of Capoeira Angola." The school had earlier roots in 1960 in Alagoinhas (interior Bahia), but the 1982 founding marked its legal registration and its selection by Salvador''s Secretariat of Education and Culture to occupy a space in Pelourinho, returning capoeira angola to its historic heart.

ECAIG operates today from two locations in Salvador: the Pelourinho headquarters at Rua Gregório de Mattos, 9 (second floor), and the Centro da Cultura Forte de Santo Antônio in Santo Antônio Além do Carmo. The school is designated a "Ponto de Cultura" (Point of Culture) by Brazil''s Ministry of Culture—an afro-Brazilian cultural nucleus combining education and heritage preservation.

In 1988, Curió participated in "Velha Guarda" events that brought the old masters together: in Fortaleza with Mestres Waldemar and Boca Rica, and in Florianópolis with Mestres Bobó, João Pequeno, Nó, and Boa Gente. These gatherings preserved and transmitted the living memory of Capoeira Angola during a critical period.

In 1997, Curió traveled to Mexico to record his CD "A Voz Viva da Capoeira Angola" (The Living Voice of Capoeira Angola)—a musical testament to the oral and rhythmic traditions he carries.

From 2000 to 2002, Curió served as a director of ABCA (Associação Brasileira de Capoeira Angola), the organization founded in 1987 that unites the old mestres of Capoeira Angola. This placed him at the center of institutional efforts to preserve and promote the tradition.

Mestre Curió made history by becoming the first mestre to confer the title of Mestra upon a woman in Capoeira Angola. In January 2001, he elevated Valdelice Santos de Jesus—Mestra Jararaca—to the rank of mestra in a grand roda, as demanded by Angola tradition. According to Curió, one simply needs to see her playing to understand why she is called Jararaca (a venomous snake): "While training, the young lady who moved like a cobra showed true distinction." This act opened doors for generations of women in Capoeira Angola.

On December 13, 2016, at age 79, Curió received the Medalha Zumbi dos Palmares from Salvador''s Câmara Municipal—an honor recognizing individuals active in the fight against racism, discrimination, and intolerance. At the ceremony, Curió reflected on his teaching philosophy: he has formed only three mestres in his career, including one woman, explaining that he is "not in a hurry to form masters but rather to form citizens with knowledge and development."

In 2023, ECAIG hosted its 32nd Encontro Internacional de Capoeira Angola—an annual gathering that has drawn practitioners from Mexico, France, Switzerland, and across Brazil. The 2023 theme, "Do atabaque ao berimbau. Viva a tradição ancestral," honored the ancestral tradition Curió has dedicated his life to preserving.

At 88 years old, Mestre Curió continues to teach at his schools in Salvador, traveling internationally to spread capoeira angola to Mexico, Ecuador, Japan, Switzerland, Belgium, Argentina, Iraq, Germany, and the United States. He has been recognized as an ambassador of Brazilian culture.

As Curió himself has said: "Capoeira is art, dance, cunning, philosophy, roguishness, theater, music, choreography and non-violence. It only becomes dangerous in times of pain."',
  -- bio_pt
  E'Jaime Martins dos Santos, conhecido como Mestre Curió, nasceu em 23 de janeiro de 1937, em Candeias, Bahia, numa família profundamente enraizada na tradição da capoeira. Seu pai José Martins dos Santos—chamado Malvadeza ou Martim da Pemba—era capoeirista, assim como sua mãe Maria Bispo (conhecida como Pequena). Seu avô Pedro Virício, também capoeirista, carregava o mesmo apelido "Curió" que seu neto herdaria. Criado em Santo Amaro, o jovem Jaime foi imerso na capoeira desde os seis anos, aprendendo com seu pai e avô a partir de 1943.

Aos sete anos, em 1944, Curió fugiu de casa—um breve capítulo de sua juventude rebelde. Em 1951, com apenas catorze anos, já havia começado a ensinar capoeira, demonstrando domínio precoce notável da arte que sua família lhe transmitira.

Em 1954, um jovem Curió aparece em fotografias no lendário barracão de Mestre Waldemar na Liberdade, capturadas pelo fotógrafo francês Marcel Gautherot. Essas imagens o colocam entre a vibrante cena de rodas da Salvador dos anos 1950, ao lado de figuras estabelecidas daquela era dourada.

O ponto de virada decisivo veio em 10 de abril de 1968, quando Curió ingressou formalmente no CECA (Centro Esportivo de Capoeira Angola) de Mestre Pastinha no Pelourinho. Sob Pastinha—o pai da Capoeira Angola—Curió absorveu não apenas técnica, mas os fundamentos filosóficos que moldariam toda sua abordagem da arte. Tornou-se um dos discípulos fiéis de Pastinha, ao lado de João Grande, João Pequeno, Boca Rica, Bola Sete, Gildo Alfinete e Albertino.

Quando o governo municipal de Salvador forçou Pastinha a deixar o prédio do CECA em 1971 durante a gentrificação do Pelourinho, Curió testemunhou em primeira mão o deslocamento de seu mestre. Segundo Curió, "com muita resistência foi-lhes dado um espaço para a academia na Ladeira do Ferrão, conhecida como Ladeira do Mijo"—um capítulo doloroso na história da luta institucional da Capoeira Angola.

Em junho de 1980, Curió participou do histórico "Primeiro Seminário Regional de Capoeira e Festival de Ritmos da Capoeira" do pesquisador Frede Abreu, realizado de 4 a 8 de junho em Barris, Salvador. Este evento, com cerca de 1.500 pessoas, reuniu a velha guarda da Capoeira Angola—Mestre Cobrinha Verde (que foi "redescoberto" neste evento), Mestre João Grande, Mestre Gigante e outros. Foi um momento crucial para o renascimento da capoeira tradicional.

Em 7 de janeiro de 1982, Curió fundou a Escola de Capoeira Angola Irmãos Gêmeos (ECAIG). A escola teve raízes anteriores em 1960 em Alagoinhas (interior da Bahia), mas a fundação de 1982 marcou seu registro legal e sua seleção pela Secretaria de Educação e Cultura de Salvador para ocupar um espaço no Pelourinho, devolvendo a capoeira angola ao seu coração histórico.

A ECAIG opera hoje em duas localidades em Salvador: a sede no Pelourinho na Rua Gregório de Mattos, 9 (segundo andar), e o Centro da Cultura Forte de Santo Antônio em Santo Antônio Além do Carmo. A escola é designada como "Ponto de Cultura" pelo Ministério da Cultura do Brasil—um núcleo cultural afro-brasileiro que combina educação e preservação do patrimônio.

Em 1988, Curió participou de eventos da "Velha Guarda" que reuniram os antigos mestres: em Fortaleza com os Mestres Waldemar e Boca Rica, e em Florianópolis com os Mestres Bobó, João Pequeno, Nó e Boa Gente. Esses encontros preservaram e transmitiram a memória viva da Capoeira Angola durante um período crítico.

Em 1997, Curió viajou ao México para gravar seu CD "A Voz Viva da Capoeira Angola"—um testemunho musical das tradições orais e rítmicas que ele carrega.

De 2000 a 2002, Curió atuou como diretor da ABCA (Associação Brasileira de Capoeira Angola), a organização fundada em 1987 que une os antigos mestres da Capoeira Angola. Isso o colocou no centro dos esforços institucionais para preservar e promover a tradição.

Mestre Curió fez história ao se tornar o primeiro mestre a conferir o título de Mestra a uma mulher na Capoeira Angola. Em janeiro de 2001, ele elevou Valdelice Santos de Jesus—Mestra Jararaca—ao posto de mestra em uma grande roda, como exigido pela tradição Angola. Segundo Curió, basta vê-la jogando para entender por que ela é chamada Jararaca (uma cobra venenosa): "Durante o treino, a jovem que se movia como uma cobra mostrou verdadeira distinção." Este ato abriu portas para gerações de mulheres na Capoeira Angola.

Em 13 de dezembro de 2016, aos 79 anos, Curió recebeu a Medalha Zumbi dos Palmares da Câmara Municipal de Salvador—uma honra que reconhece indivíduos ativos na luta contra o racismo, discriminação e intolerância. Na cerimônia, Curió refletiu sobre sua filosofia de ensino: formou apenas três mestres em sua carreira, incluindo uma mulher, explicando que "não tem pressa em formar mestres, mas sim em formar cidadãos com conhecimento e desenvolvimento."

Em 2023, a ECAIG sediou seu 32º Encontro Internacional de Capoeira Angola—um encontro anual que atraiu praticantes do México, França, Suíça e de todo o Brasil. O tema de 2023, "Do atabaque ao berimbau. Viva a tradição ancestral," honrou a tradição ancestral que Curió dedicou sua vida a preservar.

Aos 88 anos, Mestre Curió continua ensinando em suas escolas em Salvador, viajando internacionalmente para difundir a capoeira angola no México, Equador, Japão, Suíça, Bélgica, Argentina, Iraque, Alemanha e Estados Unidos. Ele foi reconhecido como embaixador da cultura brasileira.

Como o próprio Curió disse: "Capoeira é arte, dança, malícia, filosofia, malandragem, teatro, música, coreografia e não violência. Ela só se torna perigosa em tempos de dor."',
  -- achievements_en
  E'Founded Escola de Capoeira Angola Irmãos Gêmeos (ECAIG, 1982); First mestre to grant Mestra title to a woman in Capoeira Angola (Mestra Jararaca, January 2001); Medalha Zumbi dos Palmares (Câmara Municipal de Salvador, December 13, 2016); Director of ABCA (Associação Brasileira de Capoeira Angola, 2000-2002); Recorded CD "A Voz Viva da Capoeira Angola" (Mexico, 1997); Recognized as ambassador of Brazilian culture; 32+ years hosting Encontro Internacional de Capoeira Angola; Designated as "Ponto de Cultura" by Brazilian Ministry of Culture; Taught capoeira in 9+ countries internationally; Participant in 1980 First Regional Capoeira Seminar with old guard mestres',
  -- achievements_pt
  E'Fundou a Escola de Capoeira Angola Irmãos Gêmeos (ECAIG, 1982); Primeiro mestre a conceder título de Mestra a uma mulher na Capoeira Angola (Mestra Jararaca, janeiro de 2001); Medalha Zumbi dos Palmares (Câmara Municipal de Salvador, 13 de dezembro de 2016); Diretor da ABCA (Associação Brasileira de Capoeira Angola, 2000-2002); Gravou CD "A Voz Viva da Capoeira Angola" (México, 1997); Reconhecido como embaixador da cultura brasileira; Mais de 32 anos sediando o Encontro Internacional de Capoeira Angola; Designado como "Ponto de Cultura" pelo Ministério da Cultura do Brasil; Ensinou capoeira em mais de 9 países internacionalmente; Participante do Primeiro Seminário Regional de Capoeira de 1980 com mestres da velha guarda',
  -- Researcher notes (English)
  E'BIRTH YEAR (1937, exact):
Born January 23, 1937 - verified from velhosmestres.com, capoeirahub.net, and cms.ba.gov.br. Portal Capoeira incorrectly lists 1939, but majority sources confirm 1937. At 88 years old as of 2025.

NAME: Jaime Martins dos Santos. The apelido "Curió" inherited from his grandfather Pedro Virício (Curió or "Curió Velho/Grande"), a capoeirista from Santo Amaro.

FAMILY LINEAGE:
- Grandfather: Pedro Virício (Curió) - capoeirista
- Father: José Martins dos Santos (Malvadeza/Martim da Pemba) - capoeirista
- Mother: Maria Bispo (Pequena) - capoeirista

BIRTHPLACE DISCREPANCY:
- Candeias, Bahia (majority: velhosmestres, capoeirahub)
- Patos Pinhares, Paraíba (portalcapoeira - likely error)
Using Candeias, Bahia as it appears in more authoritative sources and matches his family''s Santo Amaro connection.

TEACHERS:
- Family: Grandfather Pedro Virício and father José Martins (from 1943)
- Mestre Pastinha (joined CECA April 10, 1968)

STUDENTS (confirmed):
- Mestra Jararaca (Valdelice Santos de Jesus) - first woman mestra in Capoeira Angola, titled January 2001
- Mestre Augusto Januário (born 1956; disciple for many years; founded LINISI 1987)
- Mestre Marcelo Angola (Luiz Marcelo Santos Moraes; began August 1985; founded Angoleiros do Mar 1999)
- Mestre Pintor (Paulo César Leite dos Santos; trained in Bahia period alongside other mestres)

RODA LOCATIONS:
- ECAIG Pelourinho: Rua Gregório de Mattos, 9, 2º andar, Salvador
- ECAIG Forte da Capoeira: Centro da Cultura Forte de Santo Antônio, Santo Antônio Além do Carmo

MEDIA APPEARANCES:
- 1954: Photographed at Mestre Waldemar''s barracão by Marcel Gautherot (IMS collection)
- 1997: CD "A Voz Viva da Capoeira Angola" recorded in Mexico
- 2008: Photographed by André Cypriano (Library of Congress collection, LC-DIG-ppbd-01137)

EVENTS:
- 1980: First Regional Capoeira Seminar (Frede Abreu), June 4-8, Barris, Salvador - with Cobrinha Verde, João Grande, Gigante
- 1988: Velha Guarda event in Fortaleza with Waldemar, Boca Rica (Colégio Militar de Fortaleza)
- 1988: Velha Guarda event in Florianópolis with Bobó, João Pequeno, Nó, Boa Gente
- 2023: 32nd Encontro Internacional de Capoeira Angola ECAIG

ECAIG HISTORY:
- 1960: Origins in Alagoinhas, interior Bahia (informal)
- 1982: Legal founding January 7 in Salvador, selected by Secretariat of Education and Culture
- Designated "Ponto de Cultura" by Ministry of Culture',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1937, exato):
Nascido em 23 de janeiro de 1937 - verificado em velhosmestres.com, capoeirahub.net e cms.ba.gov.br. Portal Capoeira lista incorretamente 1939, mas a maioria das fontes confirma 1937. Com 88 anos em 2025.

NOME: Jaime Martins dos Santos. O apelido "Curió" herdado de seu avô Pedro Virício (Curió ou "Curió Velho/Grande"), um capoeirista de Santo Amaro.

LINHAGEM FAMILIAR:
- Avô: Pedro Virício (Curió) - capoeirista
- Pai: José Martins dos Santos (Malvadeza/Martim da Pemba) - capoeirista
- Mãe: Maria Bispo (Pequena) - capoeirista

DISCREPÂNCIA DO LOCAL DE NASCIMENTO:
- Candeias, Bahia (maioria: velhosmestres, capoeirahub)
- Patos Pinhares, Paraíba (portalcapoeira - provavelmente erro)
Usando Candeias, Bahia pois aparece em fontes mais confiáveis e corresponde à conexão de sua família com Santo Amaro.

MESTRES:
- Família: Avô Pedro Virício e pai José Martins (a partir de 1943)
- Mestre Pastinha (ingressou no CECA em 10 de abril de 1968)

ALUNOS (confirmados):
- Mestra Jararaca (Valdelice Santos de Jesus) - primeira mulher mestra na Capoeira Angola, titulada em janeiro de 2001
- Mestre Augusto Januário (nascido 1956; discípulo por muitos anos; fundou LINISI 1987)
- Mestre Marcelo Angola (Luiz Marcelo Santos Moraes; iniciou agosto 1985; fundou Angoleiros do Mar 1999)
- Mestre Pintor (Paulo César Leite dos Santos; treinou no período da Bahia junto com outros mestres)

LOCAIS DE RODA:
- ECAIG Pelourinho: Rua Gregório de Mattos, 9, 2º andar, Salvador
- ECAIG Forte da Capoeira: Centro da Cultura Forte de Santo Antônio, Santo Antônio Além do Carmo

APARIÇÕES NA MÍDIA:
- 1954: Fotografado no barracão de Mestre Waldemar por Marcel Gautherot (coleção IMS)
- 1997: CD "A Voz Viva da Capoeira Angola" gravado no México
- 2008: Fotografado por André Cypriano (coleção Library of Congress, LC-DIG-ppbd-01137)

EVENTOS:
- 1980: Primeiro Seminário Regional de Capoeira (Frede Abreu), 4-8 de junho, Barris, Salvador - com Cobrinha Verde, João Grande, Gigante
- 1988: Evento Velha Guarda em Fortaleza com Waldemar, Boca Rica (Colégio Militar de Fortaleza)
- 1988: Evento Velha Guarda em Florianópolis com Bobó, João Pequeno, Nó, Boa Gente
- 2023: 32º Encontro Internacional de Capoeira Angola ECAIG

HISTÓRIA DA ECAIG:
- 1960: Origens em Alagoinhas, interior da Bahia (informal)
- 1982: Fundação legal em 7 de janeiro em Salvador, selecionada pela Secretaria de Educação e Cultura
- Designada "Ponto de Cultura" pelo Ministério da Cultura'
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

-- Source: entities/persons/fernando-rodrigues-perez.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Fernando Rodrigues Perez
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: No birth date documented. As an established
-- fighter representing Bimba's academy in 1949, if 20-35 years old,
-- birth would be approximately 1914-1929. Using 1920 as midpoint
-- estimate with decade precision.
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
  'Fernando Rodrigues Perez',
  'Perez',  -- Referred to as "Perez" in most sources
  NULL,  -- No formal title found
  NULL,  -- No historical portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/', 'https://nossa-tribo.com/mestre-sinhozinho/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Fernando Rodrigues Perez trained under Mestre Bimba in Capoeira Regional. He was one of the fighters selected to represent Bimba''s academy in the historic 1949 inter-style challenge against Sinhozinho''s capoeira carioca school in Rio de Janeiro.',
  E'Fernando Rodrigues Perez treinou com Mestre Bimba em Capoeira Regional. Ele foi um dos lutadores selecionados para representar a academia de Bimba no histórico desafio inter-estilos de 1949 contra a escola de capoeira carioca de Sinhozinho no Rio de Janeiro.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Fernando Rodrigues Perez was a student of Mestre Bimba who trained in Capoeira Regional in Bahia. He represented Bimba''s academy in the historic 1949 capoeira challenge at Estádio Carioca in Rio de Janeiro.

In February 1949, Mestre Sinhozinho, the leading figure of capoeira carioca in Rio de Janeiro, challenged Mestre Bimba''s Capoeira Regional school. Bimba''s group, which was touring São Paulo at the time, had been claiming superiority and was eager for real fighting ("pra valer") rather than just exhibition matches. As the newspaper A Noite announced on April 1, 1949: "Capoeira Challenge - Sinhozinho of the Federal District against Master Bimba from Bahia."

The event was organized by the Federação Metropolitana de Pugilismo (Metropolitan Federation of Pugilism) and held over two days at the Estádio Carioca on Avenida Passos in downtown Rio. It included not only the inter-capoeira matches but also a team of catch wrestlers who had similarly challenged Bimba''s academy.

On April 7, 1949, Perez faced Rudolf Hermanny, a 17-year-old student of Sinhozinho who would later become a Brazilian and Pan-American judo champion. The Globo Esportivo newspaper that day announced: "Hoje no Estádio Carioca - o capoeira carioca Hermanny (capoeira de Sinhozinho) em confronto como Perez (capoeira de Mestre Bimba)" ("Today at Carioca Stadium - the Cariocan capoeirista Hermanny [of Sinhozinho] in confrontation with Perez [of Mestre Bimba]").

The fight was brief and decisive. Hermanny dominated the bout, defeating Perez in just two minutes. A kick from Hermanny injured Perez''s arm, ending the match. This came after fellow Bimba student Jurandir had lost to Cirandinha on April 2, meaning both of Bimba''s representatives were defeated.

The impact of these losses was significant. According to sources, Bimba was so impressed by the techniques he observed that he studied movements from Sinhozinho''s fighters afterward to incorporate into his own Capoeira Regional style.

Little else is known about Perez''s life before or after this challenge. His participation marks him as one of Bimba''s capable fighters during a crucial period of inter-style rivalry in Brazilian capoeira history.',
  -- bio_pt
  E'Fernando Rodrigues Perez foi um aluno de Mestre Bimba que treinou Capoeira Regional na Bahia. Ele representou a academia de Bimba no histórico desafio de capoeira de 1949 no Estádio Carioca no Rio de Janeiro.

Em fevereiro de 1949, Mestre Sinhozinho, a principal figura da capoeira carioca no Rio de Janeiro, desafiou a escola de Capoeira Regional de Mestre Bimba. O grupo de Bimba, que estava em turnê por São Paulo na época, vinha reivindicando superioridade e estava ansioso por lutas reais ("pra valer") em vez de apenas exibições. Como anunciou o jornal A Noite em 1 de abril de 1949: "Desafio de Capoeira - Sinhozinho do Distrito Federal contra Mestre Bimba da Bahia."

O evento foi organizado pela Federação Metropolitana de Pugilismo e realizado em dois dias no Estádio Carioca na Avenida Passos, no centro do Rio. Incluiu não apenas as lutas inter-capoeira, mas também uma equipe de lutadores de catch que havia similarmente desafiado a academia de Bimba.

Em 7 de abril de 1949, Perez enfrentou Rudolf Hermanny, um aluno de 17 anos de Sinhozinho que mais tarde se tornaria campeão brasileiro e pan-americano de judô. O jornal Globo Esportivo naquele dia anunciou: "Hoje no Estádio Carioca - o capoeira carioca Hermanny (capoeira de Sinhozinho) em confronto como Perez (capoeira de Mestre Bimba)."

A luta foi breve e decisiva. Hermanny dominou o combate, derrotando Perez em apenas dois minutos. Um chute de Hermanny lesionou o braço de Perez, encerrando a luta. Isso veio depois que o colega aluno de Bimba, Jurandir, havia perdido para Cirandinha em 2 de abril, significando que ambos os representantes de Bimba foram derrotados.

O impacto dessas derrotas foi significativo. De acordo com as fontes, Bimba ficou tão impressionado com as técnicas que observou que estudou movimentos dos lutadores de Sinhozinho depois para incorporar em seu próprio estilo de Capoeira Regional.

Pouco mais se sabe sobre a vida de Perez antes ou depois deste desafio. Sua participação o marca como um dos lutadores capazes de Bimba durante um período crucial de rivalidade inter-estilos na história da capoeira brasileira.',
  -- achievements_en
  NULL,  -- No documented achievements beyond the 1949 fight
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1920, decade precision): No birth or death dates found for Fernando Rodrigues Perez. Based on his participation as an established fighter representing Bimba''s academy in 1949, if he was 20-35 years old, birth would be approximately 1914-1929. Using 1920 as midpoint estimate with decade precision.

DEATH: Unknown. No records found.

NAME: Full name "Fernando Rodrigues Perez" appears in nossa-tribo.com. Most sources refer to him simply as "Perez."

1949 CHALLENGE:
- Date: April 7, 1949 (second day of the two-day event)
- Opponent: Rudolf Hermanny (Sinhozinho''s student, 17 years old)
- Result: Lost in 2 minutes
- Injury: Arm injured by kick
- Venue: Estádio Carioca, Avenida Passos, downtown Rio de Janeiro
- Organizer: Federação Metropolitana de Pugilismo

TEACHERS:
- Mestre Bimba (confirmed - "capoeira de Mestre Bimba" per Globo Esportivo)

FELLOW FIGHTERS:
- Jurandir - Fellow Bimba student who fought on April 2, 1949; lost to Cirandinha by KO in Round 1

MEDIA APPEARANCES:
- April 7, 1949: Featured in Globo Esportivo announcement of fight vs Hermanny
- April 1949: Covered in A Noite newspaper

HISTORICAL SIGNIFICANCE:
- Part of the historic inter-style rivalry between Bahian Regional (Bimba) and Carioca (Sinhozinho) capoeira
- Both Regional representatives (Perez and Jurandir) were defeated
- Bimba reportedly incorporated techniques observed from Sinhozinho''s fighters into Regional afterward',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, precisão de década): Nenhuma data de nascimento ou morte encontrada para Fernando Rodrigues Perez. Com base em sua participação como lutador estabelecido representando a academia de Bimba em 1949, se ele tinha 20-35 anos, o nascimento seria aproximadamente 1914-1929. Usando 1920 como estimativa do ponto médio com precisão de década.

MORTE: Desconhecida. Nenhum registro encontrado.

NOME: Nome completo "Fernando Rodrigues Perez" aparece em nossa-tribo.com. A maioria das fontes o refere simplesmente como "Perez."

DESAFIO DE 1949:
- Data: 7 de abril de 1949 (segundo dia do evento de dois dias)
- Oponente: Rudolf Hermanny (aluno de Sinhozinho, 17 anos)
- Resultado: Perdeu em 2 minutos
- Lesão: Braço lesionado por chute
- Local: Estádio Carioca, Avenida Passos, centro do Rio de Janeiro
- Organizador: Federação Metropolitana de Pugilismo

PROFESSORES:
- Mestre Bimba (confirmado - "capoeira de Mestre Bimba" por Globo Esportivo)

COLEGAS LUTADORES:
- Jurandir - Colega aluno de Bimba que lutou em 2 de abril de 1949; perdeu para Cirandinha por nocaute no 1o round

APARIÇÕES NA MÍDIA:
- 7 de abril de 1949: Destaque no anúncio do Globo Esportivo da luta vs Hermanny
- Abril de 1949: Coberto no jornal A Noite

SIGNIFICADO HISTÓRICO:
- Parte da histórica rivalidade inter-estilos entre a Regional baiana (Bimba) e a carioca (Sinhozinho)
- Ambos os representantes da Regional (Perez e Jurandir) foram derrotados
- Bimba supostamente incorporou técnicas observadas dos lutadores de Sinhozinho na Regional depois'
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

-- Source: entities/persons/gildo-alfinete.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Gildo Alfinete
-- Generated: 2025-12-19
-- ============================================================
-- Born in Tororó, Salvador on January 16, 1940. Died October 12, 2015.
-- Student of Mestre Pastinha at CECA (Centro Esportivo de Capoeira
-- Angola). Received diploma 1963. Member of the historic 1966
-- delegation to Dakar, Senegal for the First World Festival of
-- Black Arts alongside Pastinha, João Grande, Gato Preto, Roberto
-- Satanás, and Camafeu de Oxóssi.
--
-- Known for his meticulous documentation of Pastinha's teachings
-- and the Dakar trip. After his death, family discovered 3,000+
-- photographs and handwritten notebooks. His brother Genésio
-- "Meio-Quilo" compiled this into the 2020 book "Capoeira Angola
-- Mundo Afora - Uma Jornada com o Mestre Pastinha."
--
-- Co-founded the refounding of ABCA (Associação Brasileira de
-- Capoeira Angola) on July 18, 1993. Taught Capoeira Angola in
-- Salvador for 40+ years without running his own academy.
--
-- NICKNAME ORIGIN: "Alfinete" (pin/needle) earned due to his
-- thin build as a youth.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Gildo Lemos Couto',
  'Gildo Alfinete',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1966', 'https://www.capoeirahub.net/mestres/68ab329ac7f660e1a7e643a2-mestre-gildo-alfinete', 'https://capoeira-connection.com/capoeira/2011/10/lecture-on-mestre-pastinha-and-capoeira-angola/']::text[],
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of Mestre Pastinha. Gildo was renowned for his deep knowledge of the philosophy and teachings of his mestre, which he meticulously documented throughout his life. He played berimbau and pandeiro in the bateria, and was a valued member of Pastinha''s inner circle. His teaching emphasized the preservation of traditional Angola methods passed directly from Pastinha.',
  E'Capoeira Angola pura na tradição de Mestre Pastinha. Gildo era renomado por seu profundo conhecimento da filosofia e ensinamentos de seu mestre, que documentou meticulosamente ao longo de sua vida. Tocava berimbau e pandeiro na bateria, e era um membro valorizado do círculo interno de Pastinha. Seu ensino enfatizava a preservação dos métodos tradicionais de Angola passados diretamente de Pastinha.',
  1940,
  'exact'::genealogy.date_precision,
  'Salvador (Tororó), Bahia, Brazil',
  2015,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Gildo Lemos Couto was born on January 16, 1940, in the Tororó neighborhood of Salvador, Bahia. As a thin youth, he earned the apelido "Alfinete" (pin or needle). Learning capoeira became his way to confront those who picked on him for his slight frame.

In 1959, at age 19, Gildo began training at Mestre Pastinha''s Centro Esportivo de Capoeira Angola (CECA) at Pelourinho 19. He trained diligently for four years, and in 1963 he received his capoeirista diploma directly from Mestre Pastinha, placing him among the mestre''s closest disciples.

From the beginning, Gildo distinguished himself not only as a player but as a documentarian. He played, watched, and wrote—recording Pastinha''s teachings on whatever paper was at hand, sometimes even on napkins. These notes would later become invaluable primary sources for the history of Capoeira Angola.

In April 1966, Gildo experienced the crowning achievement of his early career: he traveled with Mestre Pastinha to Dakar, Senegal, for the First World Festival of Black Arts (Festival Mondial des Arts Nègres). The Brazilian delegation included six capoeiristas: Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. The group departed on April 16 and performed at the Friendship Stadium (later renamed Stadium Demba Diop) before approximately 10,000 spectators.

By this time, Pastinha was suffering from thrombosis that had damaged his vision—João Grande recalled that "the day Mestre Pastinha went to get the passport... he couldn''t climb the stairs anymore." At the Dakar performances, Pastinha sat in the shade and played atabaque while his students demonstrated Capoeira Angola to the world. Gildo played capoeira alongside João Grande while Camafeu de Oxossi played berimbau. Throughout the journey, Gildo documented their experiences, creating a precious archive of the trip.

At the festival, young Senegalese boys showed movements similar to capoeira. When asked if it was capoeira, they replied: "Capoeira is in Brasil... Our people took it there and now you are showing it here." This encounter moved the Brazilian delegation deeply.

After Pastinha''s death in 1981, Gildo transformed into an ambassador of Capoeira Angola. Though he never directed his own academy, he dedicated more than 40 years to teaching in Salvador. He gave lectures on capoeira history, often displaying photographs from his personal archive. On October 25, 2006, at the Associação Brasileira de Capoeira Angola (ABCA) in Salvador, he gave a notable lecture alongside Mestre Bola Sete.

During that 2006 lecture, Gildo addressed misconceptions about Pastinha. He explained that Pastinha carried an umbrella "wherever he went, rain or shine, to be used as a weapon in the case of an emergency." He refuted claims that Pastinha did not play berimbau or sing—confirming that the mestre did both. He clarified the relationship between Pastinha and Canjiquinha: rather than Pastinha learning from Canjiquinha, Pastinha had recruited Canjiquinha and made him a contra-mestre. He described how Pastinha taught his students "one by one, with the others watching."

Gildo helped refound the ABCA on July 18, 1993, giving institutional structure to a tradition that had been passed hand to hand. He also financially supported projects aimed at providing young people access to Pastinha''s teachings.

Throughout his life, Gildo remained connected to the community of CECA alumni. He maintained close relationships with João Grande, João Pequeno, Bola Sete, and other disciples. Photographs document him visiting João Grande''s home and academy, participating in events celebrating the Pastinha lineage.

Mestre Gildo Alfinete died on October 12, 2015, in Salvador at age 75.

After his passing, his family discovered a treasure: more than 3,000 photographs and a handwritten notebook containing Pastinha''s teachings. These materials had been accumulated over 52 years, since he received his diploma in 1963. His brother, Mestre Genésio "Meio-Quilo," compiled this archive into the book "Capoeira Angola Mundo Afora - Uma Jornada com o Mestre Pastinha," published in 2020.

The book launch took place at the ABCA headquarters on Rua Gregório de Mattos 86 in Pelourinho, with rodas through the historic center of Salvador in homage. All proceeds from the book support ABCA, Associação Nigolo (Caruaru, Pernambuco), Associação Origem Angola (Natal, Rio Grande do Norte), and ACGL in Brasília.',
  -- bio_pt
  E'Gildo Lemos Couto nasceu em 16 de janeiro de 1940, no bairro do Tororó em Salvador, Bahia. Magro na juventude, ganhou o apelido "Alfinete." Aprender capoeira tornou-se sua forma de enfrentar aqueles que o provocavam por sua constituição franzina.

Em 1959, aos 19 anos, Gildo começou a treinar no Centro Esportivo de Capoeira Angola (CECA) de Mestre Pastinha no Pelourinho 19. Treinou diligentemente por quatro anos e, em 1963, recebeu seu diploma de capoeirista diretamente de Mestre Pastinha, colocando-o entre os discípulos mais próximos do mestre.

Desde o início, Gildo se distinguiu não apenas como jogador, mas como documentarista. Ele jogava, observava e escrevia—registrando os ensinamentos de Pastinha em qualquer papel disponível, às vezes até em guardanapos. Essas anotações mais tarde se tornariam fontes primárias inestimáveis para a história da Capoeira Angola.

Em abril de 1966, Gildo viveu a conquista máxima de sua carreira inicial: viajou com Mestre Pastinha para Dakar, Senegal, para o Primeiro Festival Mundial de Artes Negras (Festival Mondial des Arts Nègres). A delegação brasileira incluía seis capoeiristas: Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. O grupo partiu em 16 de abril e se apresentou no Estádio da Amizade (posteriormente renomeado Estádio Demba Diop) diante de aproximadamente 10.000 espectadores.

Nessa época, Pastinha sofria de trombose que havia danificado sua visão—João Grande recordou que "no dia em que Mestre Pastinha foi pegar o passaporte... ele não conseguia mais subir as escadas." Nas apresentações em Dakar, Pastinha sentou na sombra e tocou atabaque enquanto seus alunos demonstravam Capoeira Angola ao mundo. Gildo jogou capoeira ao lado de João Grande enquanto Camafeu de Oxossi tocava berimbau. Durante toda a viagem, Gildo documentou suas experiências, criando um arquivo precioso da viagem.

No festival, jovens senegaleses mostraram movimentos similares à capoeira. Quando perguntados se era capoeira, responderam: "Capoeira é no Brasil... Nosso povo levou para lá e agora vocês estão mostrando aqui." Esse encontro comoveu profundamente a delegação brasileira.

Após a morte de Pastinha em 1981, Gildo se transformou em um embaixador da Capoeira Angola. Embora nunca tenha dirigido sua própria academia, dedicou mais de 40 anos ao ensino em Salvador. Deu palestras sobre história da capoeira, frequentemente exibindo fotografias de seu arquivo pessoal. Em 25 de outubro de 2006, na Associação Brasileira de Capoeira Angola (ABCA) em Salvador, ministrou uma palestra notável ao lado de Mestre Bola Sete.

Durante aquela palestra de 2006, Gildo abordou equívocos sobre Pastinha. Explicou que Pastinha carregava um guarda-chuva "onde quer que fosse, chovesse ou fizesse sol, para ser usado como arma em caso de emergência." Refutou afirmações de que Pastinha não tocava berimbau ou cantava—confirmando que o mestre fazia ambos. Esclareceu a relação entre Pastinha e Canjiquinha: ao invés de Pastinha aprender com Canjiquinha, Pastinha havia recrutado Canjiquinha e o tornado contra-mestre. Descreveu como Pastinha ensinava seus alunos "um por um, com os outros assistindo."

Gildo ajudou a refundar a ABCA em 18 de julho de 1993, dando estrutura institucional a uma tradição que havia sido passada de mão em mão. Também apoiou financeiramente projetos destinados a proporcionar aos jovens acesso aos ensinamentos de Pastinha.

Ao longo de sua vida, Gildo permaneceu conectado à comunidade de ex-alunos do CECA. Manteve relacionamentos próximos com João Grande, João Pequeno, Bola Sete e outros discípulos. Fotografias documentam suas visitas à casa e academia de João Grande, participando de eventos celebrando a linhagem de Pastinha.

Mestre Gildo Alfinete faleceu em 12 de outubro de 2015, em Salvador, aos 75 anos.

Após seu falecimento, sua família descobriu um tesouro: mais de 3.000 fotografias e um caderno manuscrito contendo os ensinamentos de Pastinha. Esses materiais haviam sido acumulados ao longo de 52 anos, desde que recebeu seu diploma em 1963. Seu irmão, Mestre Genésio "Meio-Quilo," compilou este arquivo no livro "Capoeira Angola Mundo Afora - Uma Jornada com o Mestre Pastinha," publicado em 2020.

O lançamento do livro ocorreu na sede da ABCA na Rua Gregório de Mattos 86 no Pelourinho, com rodas pelo centro histórico de Salvador em homenagem. Toda a renda do livro apoia a ABCA, Associação Nigolo (Caruaru, Pernambuco), Associação Origem Angola (Natal, Rio Grande do Norte) e ACGL em Brasília.',
  -- achievements_en
  E'Diploma from Mestre Pastinha (1963)\nMember of historic Dakar delegation representing Brazil at First World Festival of Black Arts (April 1966)\nCo-founder of ABCA refounding (July 18, 1993)\nTaught Capoeira Angola in Salvador for 40+ years\nArchive of 3,000+ photographs documenting Capoeira Angola history\nHandwritten notebooks of Pastinha''s teachings preserved and published posthumously (2020)',
  -- achievements_pt
  E'Diploma de Mestre Pastinha (1963)\nMembro da histórica delegação de Dakar representando o Brasil no Primeiro Festival Mundial de Artes Negras (abril de 1966)\nCo-fundador da refundação da ABCA (18 de julho de 1993)\nEnsinou Capoeira Angola em Salvador por mais de 40 anos\nArquivo de mais de 3.000 fotografias documentando a história da Capoeira Angola\nCadernos manuscritos dos ensinamentos de Pastinha preservados e publicados postumamente (2020)',
  -- notes_en
  E'BIRTH DATE: January 16, 1940 confirmed across multiple sources (CapoeiraHub, Capoeira Toulouse, Correio).

DEATH DATE: October 12, 2015 confirmed across multiple sources.

BIRTH PLACE: Tororó neighborhood, Salvador, Bahia.

NICKNAME ORIGIN: "Alfinete" (pin/needle) earned due to thin build as youth.

TEACHER: Mestre Pastinha - trained at CECA from 1959, diploma 1963.

CONTEMPORARIES AT CECA:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Gato Preto (José Gabriel Góes)
- Roberto Satanás (Roberto Pereira)
- Albertino da Hora (also known as "Moreno")
- Valdomiro Malvadeza
- Bola Sete
- Boca Rica
- Curió (Jaime Martins dos Santos)

DAKAR 1966 DELEGATION (April 16-24):
- Mestre Pastinha (leader, played atabaque due to vision problems)
- Mestre João Grande
- Mestre Gato Preto
- Mestre Gildo Alfinete
- Mestre Roberto Satanás
- Mestre Camafeu de Oxossi (played berimbau)
Also traveled: Ataulfo Alves, Clementina de Jesus, Olga de Alaketu

1964 BELO HORIZONTE TRIP: Documented trip to Belo Horizonte with Pastinha, Albertino da Hora, Roberto Satanás, João Grande, Toinho.

DOCUMENTATION WORK:
- 3,000+ photographs accumulated over 52 years
- Handwritten notebooks of Pastinha''s teachings
- Often recorded on improvised materials (napkins, scraps of paper)
- Archive compiled by brother Genésio "Meio-Quilo" into 2020 book

MEDIA APPEARANCES:
- October 25, 2006: Lecture at ABCA with Mestre Bola Sete
- 1999: Participated in Projeto Zumbi 2000 Regional Symposium
- Multiple appearances at João Pequeno anniversary celebrations
- Photographs in Velhos Mestres collection
- Photos with João Grande at his academy and residence

ABCA (Associação Brasileira de Capoeira Angola):
- Helped refound July 18, 1993
- Gave lectures at headquarters (Rua Gregório de Mattos 86, Pelourinho)
- Book launch held there in 2020/2023

BROTHER: Mestre Genésio "Meio-Quilo" - compiled archive into 2020 book.

BOOK: "Capoeira Angola Mundo Afora - Uma Jornada com o Mestre Pastinha" (2020). Proceeds support ABCA, Associação Nigolo (Caruaru, PE), Associação Origem Angola (Natal, RN), ACGL (Brasília).

NO ACADEMY: Unlike some contemporaries, never ran his own academy but taught throughout Salvador for 40+ years.',
  -- notes_pt
  E'DATA DE NASCIMENTO: 16 de janeiro de 1940 confirmada em múltiplas fontes (CapoeiraHub, Capoeira Toulouse, Correio).

DATA DE FALECIMENTO: 12 de outubro de 2015 confirmada em múltiplas fontes.

LOCAL DE NASCIMENTO: Bairro do Tororó, Salvador, Bahia.

ORIGEM DO APELIDO: "Alfinete" ganho devido à constituição magra na juventude.

MESTRE: Mestre Pastinha - treinou no CECA de 1959, diploma 1963.

CONTEMPORÂNEOS NO CECA:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Gato Preto (José Gabriel Góes)
- Roberto Satanás (Roberto Pereira)
- Albertino da Hora (também conhecido como "Moreno")
- Valdomiro Malvadeza
- Bola Sete
- Boca Rica
- Curió (Jaime Martins dos Santos)

DELEGAÇÃO DAKAR 1966 (16-24 de abril):
- Mestre Pastinha (líder, tocou atabaque devido a problemas de visão)
- Mestre João Grande
- Mestre Gato Preto
- Mestre Gildo Alfinete
- Mestre Roberto Satanás
- Mestre Camafeu de Oxossi (tocou berimbau)
Também viajaram: Ataulfo Alves, Clementina de Jesus, Olga de Alaketu

VIAGEM BELO HORIZONTE 1964: Viagem documentada a Belo Horizonte com Pastinha, Albertino da Hora, Roberto Satanás, João Grande, Toinho.

TRABALHO DE DOCUMENTAÇÃO:
- Mais de 3.000 fotografias acumuladas em 52 anos
- Cadernos manuscritos dos ensinamentos de Pastinha
- Frequentemente registrava em materiais improvisados (guardanapos, pedaços de papel)
- Arquivo compilado pelo irmão Genésio "Meio-Quilo" no livro de 2020

APARIÇÕES NA MÍDIA:
- 25 de outubro de 2006: Palestra na ABCA com Mestre Bola Sete
- 1999: Participou do Simpósio Regional Projeto Zumbi 2000
- Múltiplas aparições em celebrações de aniversário de João Pequeno
- Fotografias na coleção Velhos Mestres
- Fotos com João Grande em sua academia e residência

ABCA (Associação Brasileira de Capoeira Angola):
- Ajudou a refundar em 18 de julho de 1993
- Deu palestras na sede (Rua Gregório de Mattos 86, Pelourinho)
- Lançamento do livro realizado lá em 2020/2023

IRMÃO: Mestre Genésio "Meio-Quilo" - compilou arquivo no livro de 2020.

LIVRO: "Capoeira Angola Mundo Afora - Uma Jornada com o Mestre Pastinha" (2020). Renda apoia ABCA, Associação Nigolo (Caruaru, PE), Associação Origem Angola (Natal, RN), ACGL (Brasília).

SEM ACADEMIA: Diferente de alguns contemporâneos, nunca dirigiu sua própria academia mas ensinou por Salvador por mais de 40 anos.'
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

-- Source: entities/persons/idalina.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Idalina
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Active as valentona/capoeirista from 1910-1920 per newspaper records.
-- If in prime fighting age (20-35) during 1917 incident, birth = ~1882-1897.
-- Using 1890 as midpoint with decade precision.
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
  'Idalina Maria do Sacramento',
  'Idalina',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://capoeiraconnection.com/idalina/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for exceptional physical combat skills, taking on multiple civil guards and police officers simultaneously. Part of the street culture that characterized urban capoeiragem in early 20th century Salvador.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida por habilidades excepcionais de combate físico, enfrentando vários guardas civis e policiais simultaneamente. Parte da cultura de rua que caracterizava a capoeiragem urbana no início do século XX em Salvador.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Idalina Maria do Sacramento was a legendary female capoeirista and valentona from Salvador, Bahia, whose exploits in the 1910s and 1920s became the stuff of legend. She was a "desordeira conhecida do conhecido Distrito da Sé" - a known troublemaker from the famous Sé District in Baixa dos Sapateiros, an area that held the stories of capadócios, valentes, and incorrigíveis.\n\nThe most documented incident of Idalina''s life occurred on August 1, 1917, around 5 PM, in front of Armazém do Saldanha. When her companion Firmina was being insulted by Maria Joanna, Idalina did not hesitate: "não perdendo a oportunidade de defender a honra da camarada: entrou em luta com a desafeta e a feriu com sua faca" (not losing the chance to defend her comrade''s honor: she entered into fight with her enemy and wounded her with her knife).\n\nWhen civil guard #233 arrived to break up the fight, Idalina did not surrender. Instead, she turned to fight him too. Guards #191, #165, and #210 arrived as reinforcements, along with several police officers. What happened next became legendary: "Todos se engalfinharam com a valente, que lutou com todos de uma vez" (All tangled with the brave woman, who fought them all at once). She was eventually taken to the Casa de Correções and charged with bodily injuries.\n\nThis was not an isolated incident. According to the Jornal de Notícias, Idalina had multiple documented conflicts with the authorities and other women. In records from 1917 and April 24, 1920, she appears alongside Zeferina, another capoeirista, with whom she feuded over prostitution territory. The newspaper reported: "encontraram-se as desafetas e foram ao duelo a murro e pontapé" (the rivals met and went to a duel with punches and kicks). There exists "uma vasta lista de registros policiais em que ela foi enquadrada sob acusação de capoeiragem" (an extensive list of police records in which she was charged with capoeiragem).\n\nIdalina''s legacy extends beyond historical records. Mestre Bimba, the creator of Capoeira Regional, honored her by naming one of his seven fundamental toques (berimbau rhythms) "Idalina." This toque - a slow to moderate rhythm with a strong beat - is traditionally used for a freer, more expressive game. Some sources indicate it was also associated with the jogo de navalha (razor game). The existence of this toque suggests that Idalina''s reputation was widely known in the capoeira community of her time.\n\nMultiple capoeira songs also reference Idalina, including "É de manhã, Idalina tá me chamando" (It''s morning, Idalina is calling me), suggesting she became part of the oral tradition that preserves capoeira history. The songs portray her as someone who "chama a gente e sai andando" (calls people and keeps moving) - a woman who lived life on her own terms.\n\nIdalina was one of many "mulheres incorrigíveis" (incorrigible women) documented in Paula Juliana Foltran''s groundbreaking doctoral thesis at the University of Brasília (2019). This research, conducted in the Arquivo Público do Estado da Bahia, identified hundreds of women engaged in street fighting and capoeiragem during the 1900-1920 period, definitively dismantling the myth that capoeira was exclusively a male domain.\n\nAs Foltran writes: "Idalina é capoeira, não fica parada à espera de nada" (Idalina is capoeira, she doesn''t stay still waiting for anything). This phrase captures the essence of a woman who, in an era when capoeira was criminalized and women faced even greater persecution for practicing it, fought back against anyone who challenged her - whether rivals, civil guards, or the social order itself.',
  E'Idalina Maria do Sacramento foi uma lendária capoeirista e valentona de Salvador, Bahia, cujas façanhas nas décadas de 1910 e 1920 tornaram-se lenda. Ela era uma "desordeira conhecida do conhecido Distrito da Sé" - na Baixa dos Sapateiros, uma área que guardava as histórias de capadócios, valentes e incorrigíveis.\n\nO incidente mais documentado da vida de Idalina ocorreu em 1º de agosto de 1917, por volta das 17 horas, em frente ao Armazém do Saldanha. Quando sua companheira Firmina estava sendo insultada por Maria Joanna, Idalina não hesitou: "não perdendo a oportunidade de defender a honra da camarada: entrou em luta com a desafeta e a feriu com sua faca."\n\nQuando o guarda civil nº 233 chegou para apartar a briga, Idalina não se entregou. Em vez disso, passou a lutar também com ele. Os guardas nº 191, 165 e 210 chegaram como reforço, junto com vários praças de polícia. O que aconteceu a seguir tornou-se lendário: "Todos se engalfinharam com a valente, que lutou com todos de uma vez." Ela foi finalmente levada à Casa de Correções e respondeu por lesões corporais.\n\nEste não foi um incidente isolado. Segundo o Jornal de Notícias, Idalina teve múltiplos conflitos documentados com as autoridades e outras mulheres. Em registros de 1917 e 24 de abril de 1920, ela aparece junto com Zeferina, outra capoeirista, com quem tinha rixa por ponto de prostituição. O jornal relatou: "encontraram-se as desafetas e foram ao duelo a murro e pontapé." Existe "uma vasta lista de registros policiais em que ela foi enquadrada sob acusação de capoeiragem."\n\nO legado de Idalina vai além dos registros históricos. Mestre Bimba, o criador da Capoeira Regional, a homenageou dando seu nome a um dos seus sete toques fundamentais de berimbau: "Idalina." Este toque - um ritmo lento a moderado com batida forte - é tradicionalmente usado para um jogo mais livre e expressivo. Algumas fontes indicam que também era associado ao jogo de navalha. A existência deste toque sugere que a reputação de Idalina era amplamente conhecida na comunidade capoeirística de sua época.\n\nVárias músicas de capoeira também fazem referência a Idalina, incluindo "É de manhã, Idalina tá me chamando," sugerindo que ela se tornou parte da tradição oral que preserva a história da capoeira. As músicas a retratam como alguém que "chama a gente e sai andando" - uma mulher que vivia a vida em seus próprios termos.\n\nIdalina foi uma das muitas "mulheres incorrigíveis" documentadas na tese de doutorado pioneira de Paula Juliana Foltran na Universidade de Brasília (2019). Esta pesquisa, realizada no Arquivo Público do Estado da Bahia, identificou centenas de mulheres envolvidas em lutas de rua e capoeiragem durante o período 1900-1920, desmontando definitivamente o mito de que a capoeira era um domínio exclusivamente masculino.\n\nComo escreve Foltran: "Idalina é capoeira, não fica parada à espera de nada." Esta frase captura a essência de uma mulher que, em uma era em que a capoeira era criminalizada e as mulheres enfrentavam perseguição ainda maior por praticá-la, lutou contra qualquer um que a desafiasse - fossem rivais, guardas civis ou a própria ordem social.',
  E'Legendary female capoeirista of early 20th century Salvador; namesake of Mestre Bimba''s toque "Idalina"; fought multiple civil guards and police simultaneously (1917); documented in extensive police records for capoeiragem; subject of capoeira songs; researched in Paula Foltran''s "Mulheres incorrigíveis" thesis (UnB, 2019)',
  E'Lendária capoeirista do início do século XX em Salvador; deu nome ao toque "Idalina" de Mestre Bimba; lutou contra vários guardas civis e policiais simultaneamente (1917); documentada em extensos registros policiais por capoeiragem; tema de músicas de capoeira; pesquisada na tese "Mulheres incorrigíveis" de Paula Foltran (UnB, 2019)',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1890, decade precision):\nActive as valentona/capoeirista from 1910-1920 per newspaper records. If in prime fighting age (20-35) during 1917 incident, birth = ~1882-1897. Using 1890 as midpoint.\n\nFULL NAME DISCREPANCY:\n- "Idalina Maria do Sacramento" - Jornal de Notícias 1917 conflict with Zeferina (MAJORITY)\n- "Idalina Maria de Jesus" - Some sources cite this variant\nUsing "Idalina Maria do Sacramento" as primary based on newspaper record.\n\nDEATH: Unknown. No death records found.\n\nKEY INCIDENT (August 1, 1917, ~5 PM):\n- Location: In front of Armazém do Saldanha, Distrito da Sé\n- Defended companion Firmina against Maria Joanna\n- Wounded Maria Joanna with knife\n- Guards involved: #233 (first responder), #191, #165, #210 plus additional police\n- Fought ALL of them simultaneously\n- Arrested, taken to Casa de Correções\n- Charge: Lesões corporais (bodily injuries)\n- Source: Paula Foltran thesis citing Jornal de Notícias\n\nOTHER DOCUMENTED CONFLICTS:\n- Multiple arrests for desordem/capoeiragem 1910s-1920s\n- Conflict with Zeferina (April 24, 1920): "encontraram-se as desafetas e foram ao duelo a murro e pontapé"\n- Both charged with capoeiragem multiple times\n- Disputes over prostitution territory\n\nTOQUE "IDALINA":\n- Created by Mestre Bimba as one of 7 toques of Capoeira Regional\n- Slow to moderate rhythm, strong beat\n- Used for freer, expressive game\n- Some sources associate with jogo de navalha (razor game)\n- Mestre Nenel uses it to calm animated rodas\n- Variations: "Idalina" (faster), "Idalina Compassada" (slower)\n\nCAPoEIRA SONGS REFERENCING IDALINA:\n- "É de manhã, Idalina tá me chamando" (corrido)\n- "Ê Idalina" (regional)\n- "Sai sai Catarina / Idalina"\n- "Tira dali, bota aqui Idalina"\n\nCONTEMPORARY VALENTONAS (1910s-1920s Salvador):\n- Angélica Endiabrada\n- Maria Doze Homens\n- Rosa Palmeirão\n- Salomé\n- Zeferina (rival)\n- Chicão (Francisca Albino dos Santos)\n- Massú, Catu, Almerinda, Menininha\n\nPRIMARY SOURCES:\n- Paula Juliana Foltran, "Mulheres incorrigíveis" PhD thesis (UnB, 2019)\n- Jornal de Notícias (Salvador, 1917, April 24, 1920)\n- Adriana Albert Dias, "A Malandragem da Mandinga" (UFBA dissertation)\n\nCAVEAT ON CONFLATION:\n- Some sources conflate this Idalina (Salvador capoeirista) with another Idalina (Recife, 1860s, Castro Alves''s first love)\n- These are DIFFERENT people; the Recife Idalina predates capoeira documentation',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década):\nAtiva como valentona/capoeirista de 1910-1920 segundo registros de jornais. Se estava em idade de luta (20-35) durante o incidente de 1917, nascimento = ~1882-1897. Usando 1890 como ponto médio.\n\nDISCREPÂNCIA DE NOME COMPLETO:\n- "Idalina Maria do Sacramento" - Jornal de Notícias 1917 conflito com Zeferina (MAIORIA)\n- "Idalina Maria de Jesus" - Algumas fontes citam esta variante\nUsando "Idalina Maria do Sacramento" como primário baseado no registro de jornal.\n\nMORTE: Desconhecida. Nenhum registro de óbito encontrado.\n\nINCIDENTE PRINCIPAL (1º de agosto de 1917, ~17h):\n- Local: Em frente ao Armazém do Saldanha, Distrito da Sé\n- Defendeu companheira Firmina contra Maria Joanna\n- Feriu Maria Joanna com faca\n- Guardas envolvidos: #233 (primeiro a chegar), #191, #165, #210 mais policiais adicionais\n- Lutou contra TODOS simultaneamente\n- Presa, levada à Casa de Correções\n- Acusação: Lesões corporais\n- Fonte: Tese de Paula Foltran citando Jornal de Notícias\n\nOUTROS CONFLITOS DOCUMENTADOS:\n- Múltiplas prisões por desordem/capoeiragem 1910s-1920s\n- Conflito com Zeferina (24 de abril de 1920): "encontraram-se as desafetas e foram ao duelo a murro e pontapé"\n- Ambas acusadas de capoeiragem múltiplas vezes\n- Disputas por ponto de prostituição\n\nTOQUE "IDALINA":\n- Criado por Mestre Bimba como um dos 7 toques da Capoeira Regional\n- Ritmo lento a moderado, batida forte\n- Usado para jogo mais livre e expressivo\n- Algumas fontes associam ao jogo de navalha\n- Mestre Nenel usa para acalmar rodas animadas\n- Variações: "Idalina" (mais rápida), "Idalina Compassada" (mais lenta)\n\nMÚSICAS DE CAPOEIRA REFERENCIANDO IDALINA:\n- "É de manhã, Idalina tá me chamando" (corrido)\n- "Ê Idalina" (regional)\n- "Sai sai Catarina / Idalina"\n- "Tira dali, bota aqui Idalina"\n\nVALENTONAS CONTEMPORÂNEAS (1910s-1920s Salvador):\n- Angélica Endiabrada\n- Maria Doze Homens\n- Rosa Palmeirão\n- Salomé\n- Zeferina (rival)\n- Chicão (Francisca Albino dos Santos)\n- Massú, Catu, Almerinda, Menininha\n\nFONTES PRIMÁRIAS:\n- Paula Juliana Foltran, "Mulheres incorrigíveis" tese PhD (UnB, 2019)\n- Jornal de Notícias (Salvador, 1917, 24 de abril de 1920)\n- Adriana Albert Dias, "A Malandragem da Mandinga" (dissertação UFBA)\n\nRESALVA SOBRE CONFUSÃO:\n- Algumas fontes confundem esta Idalina (capoeirista de Salvador) com outra Idalina (Recife, 1860s, primeiro amor de Castro Alves)\n- São pessoas DIFERENTES; a Idalina de Recife antecede a documentação da capoeira'
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

-- Source: entities/persons/juvenil.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Juvenil
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- Juvenil encountered Leopoldina (b. 1933) around 1951-1952 when
-- Leopoldina was 18-19. Juvenil wore formal attire (hat, vest, tie)
-- suggesting an adult. Given he was an established capoeirista capable
-- of throwing a meia-lua, he was likely in his 20s-30s, placing
-- birth in the mid-1920s.
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
  'Juvenil',
  NULL,  -- No formal title
  NULL,  -- No portrait found
  ARRAY['https://capoeirahistory.com/general/master-leopoldina-part-2/']::text[],
  -- Capoeira-specific
  NULL,  -- Pre-style era; tiririca context
  NULL,
  NULL,
  -- Life dates
  1925,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (English)
  E'Juvenil is known from a single but vivid anecdote in Mestre Leopoldina''s testimony to Nestor Capoeira, recorded for the 2005 documentary "Mestre Leopoldina, a Fina Flor da Malandragem."

Around 1951 or 1952, after Leopoldina had been training with Quinzinho for three or four months on Morro da Favela, the two encountered someone who could also play capoeira. This man was called Juvenil. He greeted them and invited the young Leopoldina to spar.

According to Leopoldina: "He took off his hat, vest, tie, and stood naked from the waist up, and we started to play. But as soon as we started playing, he gave me a kick that grazed me on the head."

Quinzinho, who was armed with a pistol hidden under a handkerchief, immediately stood up and pointed the gun at Juvenil''s face. "Don''t do that! Don''t do that, or he''ll become a coward!" he warned.

The incident reveals the informal rules governing street capoeira in 1950s Rio. Quinzinho''s intervention was not because Juvenil had done something illegal - throwing kicks was part of the game - but because attacking a beginner too aggressively could destroy his courage and ruin his development as a capoeirista. It also demonstrates how Quinzinho protected his student and maintained control through intimidation.

Nothing else is known about Juvenil - not his full name, his background, who taught him, or what became of him afterward. He remains an anonymous figure who stepped briefly into the historical record through this single encounter.',
  -- Extended content (Portuguese)
  E'Juvenil é conhecido por uma única, porém vívida, anedota no depoimento de Mestre Leopoldina a Nestor Capoeira, gravado para o documentário de 2005 "Mestre Leopoldina, a Fina Flor da Malandragem."

Por volta de 1951 ou 1952, depois que Leopoldina vinha treinando com Quinzinho por três ou quatro meses no Morro da Favela, os dois encontraram alguém que também sabia jogar capoeira. Esse homem se chamava Juvenil. Ele os cumprimentou e convidou o jovem Leopoldina para jogar.

Segundo Leopoldina: "Ele tirou o chapéu, colete, gravata, e ficou nu da cintura para cima, e a gente começou a jogar. Mas assim que começamos a jogar, ele me deu um chute que raspou na minha cabeça."

Quinzinho, que estava armado com uma pistola escondida sob um lenço, levantou-se imediatamente e apontou a arma na cara de Juvenil. "Não faz isso! Não faz isso, senão ele vai ficar covarde!" alertou.

O incidente revela as regras informais que governavam a capoeira de rua no Rio dos anos 1950. A intervenção de Quinzinho não foi porque Juvenil tinha feito algo ilegal - dar chutes fazia parte do jogo - mas porque atacar um iniciante com muita agressividade poderia destruir sua coragem e arruinar seu desenvolvimento como capoeirista. Também demonstra como Quinzinho protegia seu aluno e mantinha controle através da intimidação.

Nada mais se sabe sobre Juvenil - nem seu nome completo, sua origem, quem o ensinou, ou o que aconteceu com ele depois. Ele permanece uma figura anônima que entrou brevemente no registro histórico através deste único encontro.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1925, decade precision):
Juvenil encountered Leopoldina (b. 1933) around 1951-1952 when Leopoldina was 18-19. Juvenil wore formal attire (hat, vest, tie) suggesting an adult. Given he was an established capoeirista capable of throwing a meia-lua, he was likely in his 20s-30s, placing birth in the mid-1920s.

SINGLE SOURCE:
The only documentation for Juvenil is Mestre Leopoldina''s testimony to Nestor Capoeira, included in the 2005 documentary "Mestre Leopoldina, a Fina Flor da Malandragem." No other sources mention him.

FULL NAME: Unknown.

TEACHERS: Unknown.

STUDENTS: Unknown.

CONTEXT:
Juvenil was NOT a student of Quinzinho. He was described as "someone who could also play" - an independent capoeirista they encountered on the street who already knew capoeira techniques (demonstrated meia-lua kick).',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1925, precisão de década):
Juvenil encontrou Leopoldina (n. 1933) por volta de 1951-1952 quando Leopoldina tinha 18-19 anos. Juvenil usava traje formal (chapéu, colete, gravata) sugerindo ser adulto. Dado que era um capoeirista estabelecido capaz de aplicar uma meia-lua, provavelmente tinha entre 20 e 30 anos, situando o nascimento em meados da década de 1920.

FONTE ÚNICA:
A única documentação sobre Juvenil é o depoimento de Mestre Leopoldina a Nestor Capoeira, incluído no documentário de 2005 "Mestre Leopoldina, a Fina Flor da Malandragem." Nenhuma outra fonte o menciona.

NOME COMPLETO: Desconhecido.

MESTRES: Desconhecido.

ALUNOS: Desconhecido.

CONTEXTO:
Juvenil NÃO era aluno de Quinzinho. Ele foi descrito como "alguém que também sabia jogar" - um capoeirista independente que encontraram na rua que já conhecia técnicas de capoeira (demonstrou chute de meia-lua).'
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

-- Source: entities/persons/malvadeza.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Malvadeza (José Martins dos Santos)
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1900, year):
-- Photographed at approximately 100 years old in 2000 at Feira de
-- São Joaquim with his son Mestre Curió. Using 1900 with "year"
-- precision since the photo documentation provides reasonable
-- confidence in the approximate birth year.
--
-- DEATH YEAR ESTIMATION (~2000s, decade):
-- A mass in his memory is held at ECAIG annual events, indicating
-- he is deceased. If he lived to 100+ (photographed in 2000), death
-- likely occurred in early 2000s. Using decade precision.
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
  'José Martins dos Santos',
  'Malvadeza',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1900,
  'year'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  2000,
  'decade'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'José Martins dos Santos, known as Malvadeza or Martim da Pemba, was a capoeirista and violeiro (seven-string guitar player) from Santo Amaro, Bahia. He was the father of Mestre Curió, one of Capoeira Angola''s most celebrated guardians, and the link between the old capoeira tradition of his father Pedro Virício and the modern era of the art.

José Martins was born around 1900 in Santo Amaro da Purificação, in the Recôncavo Baiano—a region renowned for producing legendary capoeiristas including Besouro Mangangá, who was his segundo primo (second cousin). He learned capoeira from his father Pedro Virício, known as "Curió Grande," continuing a family tradition that may have stretched back even further.

In addition to his skill in capoeira, José Martins was a talented musician. He was a close friend of Mestre Pastinha—the father of Capoeira Angola—and served as his violeiro, accompanying Pastinha musically. This connection to Pastinha would later influence his son''s path, as Mestre Curió would eventually become one of Pastinha''s most faithful disciples.

José Martins married Maria Bispo, known as "Pequena," who was also a capoeirista from a family of angoleiros in Santo Amaro. Together they had a son, Jaime Martins dos Santos, born January 23, 1937, in Candeias. Maria gave birth to Jaime during a roda de capoeira—a detail that speaks to how deeply capoeira was woven into this family''s life.

Beginning in 1943, when young Jaime was six years old, José Martins and his father Pedro Virício began teaching the boy capoeira. This dual-generational transmission—from grandfather and father simultaneously—immersed Jaime in the traditional methods and philosophy of Capoeira Angola. By 1951, at only fourteen, Jaime had already begun teaching capoeira himself.

José Martins lived to be approximately one hundred years old. In 2000, he was photographed with his son Mestre Curió at Feira de São Joaquim in Salvador—a remarkable image of father and son, both capoeiristas, representing nearly a century of continuous tradition.

After his death in the early 2000s, José Martins dos Santos is remembered annually at ECAIG (Escola de Capoeira Angola Irmãos Gêmeos), where a mass is held in his memory alongside Mestre Pastinha during the school''s annual Encontro Internacional de Capoeira Angola.',
  -- bio_pt
  E'José Martins dos Santos, conhecido como Malvadeza ou Martim da Pemba, foi um capoeirista e violeiro de Santo Amaro, Bahia. Ele foi o pai de Mestre Curió, um dos mais celebrados guardiões da Capoeira Angola, e o elo entre a antiga tradição de capoeira de seu pai Pedro Virício e a era moderna da arte.

José Martins nasceu por volta de 1900 em Santo Amaro da Purificação, no Recôncavo Baiano—uma região conhecida por produzir capoeiristas lendários incluindo Besouro Mangangá, que era seu primo segundo. Ele aprendeu capoeira com seu pai Pedro Virício, conhecido como "Curió Grande," continuando uma tradição familiar que pode ter se estendido ainda mais para trás.

Além de sua habilidade na capoeira, José Martins era um músico talentoso. Ele era amigo próximo de Mestre Pastinha—o pai da Capoeira Angola—e servia como seu violeiro, acompanhando Pastinha musicalmente. Esta conexão com Pastinha influenciaria mais tarde o caminho de seu filho, pois Mestre Curió eventualmente se tornaria um dos discípulos mais fiéis de Pastinha.

José Martins casou-se com Maria Bispo, conhecida como "Pequena," que também era capoeirista de uma família de angoleiros em Santo Amaro. Juntos tiveram um filho, Jaime Martins dos Santos, nascido em 23 de janeiro de 1937, em Candeias. Maria deu à luz Jaime durante uma roda de capoeira—um detalhe que fala de quão profundamente a capoeira estava entrelaçada na vida desta família.

A partir de 1943, quando o jovem Jaime tinha seis anos, José Martins e seu pai Pedro Virício começaram a ensinar capoeira ao menino. Esta transmissão de duas gerações—de avô e pai simultaneamente—imergiu Jaime nos métodos tradicionais e filosofia da Capoeira Angola. Em 1951, com apenas catorze anos, Jaime já havia começado a ensinar capoeira.

José Martins viveu até aproximadamente cem anos. Em 2000, ele foi fotografado com seu filho Mestre Curió na Feira de São Joaquim em Salvador—uma imagem notável de pai e filho, ambos capoeiristas, representando quase um século de tradição contínua.

Após sua morte no início dos anos 2000, José Martins dos Santos é lembrado anualmente na ECAIG (Escola de Capoeira Angola Irmãos Gêmeos), onde uma missa é celebrada em sua memória junto com Mestre Pastinha durante o Encontro Internacional de Capoeira Angola anual da escola.',
  -- achievements_en
  E'Transmitted capoeira tradition from father Pedro Virício to son Mestre Curió; Close friend and violeiro of Mestre Pastinha; Lived to approximately 100 years old; Maintained family capoeira tradition through prohibition era',
  -- achievements_pt
  E'Transmitiu tradição de capoeira do pai Pedro Virício para filho Mestre Curió; Amigo próximo e violeiro de Mestre Pastinha; Viveu até aproximadamente 100 anos; Manteve tradição familiar de capoeira durante era de proibição',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1900, year):
Photographed at ~100 years old in 2000 at Feira de São Joaquim with Mestre Curió. Using 1900 with year precision based on photo documentation.

DEATH YEAR ESTIMATION (2000, decade):
A mass in his memory is held at ECAIG annual events, confirming he is deceased. If photographed at 100 in 2000, death likely occurred in early 2000s. Using decade precision.

NAME VARIATIONS:
- "José Martins dos Santos" - full legal name
- "Malvadeza" - primary apelido
- "Martim da Pemba" - alternate apelido
- "Pena Dourada" - mentioned in one source (capoeducarte)
- "Zé Martins" - familiar form
- "Mestre Zé Martins" - used in photo caption on velhosmestres.com

OCCUPATION: lavrador (farmer)

BESOURO CONNECTION:
Mestre Curió states: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro (capoeirista que inspirou o filme ''Besouro''), que era primo segundo do meu pai."
This confirms Besouro Mangangá was José Martins'' second cousin.

MUSICAL ABILITY:
Violeiro (seven-string guitar player); close friend of Mestre Pastinha and accompanied him musically.

FAMILY:
- Father: Pedro Virício (Curió Velho) - capoeirista
- Wife: Maria Bispo (Pequena) - capoeirista
- Son: Jaime Martins dos Santos (Mestre Curió, b. 1937)
- Second cousin: Besouro Mangangá

MEDIA APPEARANCES:
- 2000: Photographed at ~100 years old with Mestre Curió at Feira de São Joaquim (velhosmestres.com photo)

TEACHERS:
- Pedro Virício (father)

STUDENTS:
- Jaime Martins dos Santos (son, Mestre Curió, from 1943)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1900, ano):
Fotografado com ~100 anos em 2000 na Feira de São Joaquim com Mestre Curió. Usando 1900 com precisão de ano baseado na documentação fotográfica.

ESTIMATIVA ANO DE FALECIMENTO (2000, década):
Uma missa em sua memória é celebrada nos eventos anuais da ECAIG, confirmando que faleceu. Se fotografado aos 100 em 2000, falecimento provavelmente ocorreu no início dos anos 2000. Usando precisão de década.

VARIAÇÕES DE NOME:
- "José Martins dos Santos" - nome legal completo
- "Malvadeza" - apelido principal
- "Martim da Pemba" - apelido alternativo
- "Pena Dourada" - mencionado em uma fonte (capoeducarte)
- "Zé Martins" - forma familiar
- "Mestre Zé Martins" - usado em legenda de foto no velhosmestres.com

PROFISSÃO: lavrador

CONEXÃO COM BESOURO:
Mestre Curió afirma: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro (capoeirista que inspirou o filme ''Besouro''), que era primo segundo do meu pai."
Isso confirma que Besouro Mangangá era primo segundo de José Martins.

HABILIDADE MUSICAL:
Violeiro; amigo próximo de Mestre Pastinha e o acompanhava musicalmente.

FAMÍLIA:
- Pai: Pedro Virício (Curió Velho) - capoeirista
- Esposa: Maria Bispo (Pequena) - capoeirista
- Filho: Jaime Martins dos Santos (Mestre Curió, n. 1937)
- Primo segundo: Besouro Mangangá

APARIÇÕES NA MÍDIA:
- 2000: Fotografado com ~100 anos com Mestre Curió na Feira de São Joaquim (foto velhosmestres.com)

MESTRES:
- Pedro Virício (pai)

ALUNOS:
- Jaime Martins dos Santos (filho, Mestre Curió, a partir de 1943)'
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

-- Source: entities/persons/maria-dos-anjos.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Maria dos Anjos
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1905, decade precision):
-- Active as capoeirista and batuque practitioner in 1920s-1930s Salvador
-- per Mestre Atenilo testimony. If in prime (20s-30s) during this period,
-- birth = ~1895-1910. Using 1905 as midpoint (same as Salomé).
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
  'Maria dos Anjos',
  NULL,
  NULL,
  ARRAY['https://www.gratidaocapoeira.com/la-femme-et-la-capoeira/', 'https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for batuque and samba alongside capoeira.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida pelo batuque e samba junto com a capoeira.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Maria dos Anjos was a valentona - a tough, fearless woman - who practiced capoeira, batuque, and samba in Salvador, Bahia during the 1920s and 1930s. She was one of the earliest documented female capoeiristas in Brazilian history, training alongside her companion Salomé under the male capoeirista Doze Homens.\n\nAccording to testimony from Mestre Atenilo (Altenísio dos Santos, 1916-1986), one of Mestre Bimba''s oldest students, he personally knew both Maria dos Anjos and Salomé. When researcher Bira Almeida questioned Atenilo about the women''s identities, suggesting they might not have been "real women," Atenilo indignantly responded: "c''était des femmes, des vraies!" - they were women, real women! He described both as individuals of strong character - "mulheres de valor."\n\nMaria dos Anjos and Salomé were known in early 20th-century Salvador for their love of batuque (a form of combat/dance that preceded and influenced capoeira) and samba. Both learned from Doze Homens, a capoeirista who was himself a companion of the legendary Besouro Mangangá at Trapiche de Baixo in Santo Amaro. Tragically, Doze Homens was killed during the brutal Pedrito persecution around 1925, leaving his students to carry on his legacy.\n\nThis was a time when capoeira was still criminalized and the presence of women in the rodas was exceptional. Yet Maria dos Anjos carved out her space through skill and courage, becoming one of the legendary valentonas of Bahia alongside figures like Salomé, Maria Doze Homens, Chicão, Angélica Endiabrada, and Rosa Palmeirão.\n\nThrough Maria dos Anjos, some historians have speculated, the nickname "Maria Doze Homens" may have entered capoeira legend - as "Maria [student of] Doze Homens." However, Maria Doze Homens (Maria Felipe de Oliveira) appears to be a separate individual whose nickname has different origins. The confusion persists in oral tradition, but the testimony of Mestre Atenilo clearly distinguishes Maria dos Anjos as a student of the male teacher Doze Homens, not as "Maria Doze Homens" herself.',
  E'Maria dos Anjos era uma valentona - uma mulher durona e destemida - que praticava capoeira, batuque e samba em Salvador, Bahia, durante os anos 1920 e 1930. Ela foi uma das primeiras mulheres capoeiristas documentadas na história brasileira, treinando ao lado de sua companheira Salomé sob o capoeirista homem Doze Homens.\n\nSegundo testemunho de Mestre Atenilo (Altenísio dos Santos, 1916-1986), um dos alunos mais antigos de Mestre Bimba, ele conheceu pessoalmente Maria dos Anjos e Salomé. Quando o pesquisador Bira Almeida questionou Atenilo sobre as identidades das mulheres, sugerindo que talvez não fossem "mulheres de verdade," Atenilo respondeu indignado: "eram mulheres, de verdade!" Ele descreveu ambas como indivíduos de caráter forte - "mulheres de valor."\n\nMaria dos Anjos e Salomé eram conhecidas no início do século XX em Salvador por seu amor pelo batuque (uma forma de combate/dança que precedeu e influenciou a capoeira) e samba. Ambas aprenderam com Doze Homens, um capoeirista que era ele próprio companheiro do lendário Besouro Mangangá no Trapiche de Baixo em Santo Amaro. Tragicamente, Doze Homens foi morto durante a brutal perseguição de Pedrito por volta de 1925, deixando suas alunas para continuar seu legado.\n\nEsta era uma época em que a capoeira ainda era criminalizada e a presença de mulheres nas rodas era excepcional. Ainda assim, Maria dos Anjos conquistou seu espaço através de habilidade e coragem, tornando-se uma das lendárias valentonas da Bahia ao lado de figuras como Salomé, Maria Doze Homens, Chicão, Angélica Endiabrada e Rosa Palmeirão.\n\nAtravés de Maria dos Anjos, alguns historiadores especularam, o apelido "Maria Doze Homens" pode ter entrado na lenda da capoeira - como "Maria [aluna de] Doze Homens." No entanto, Maria Doze Homens (Maria Felipe de Oliveira) parece ser um indivíduo separado cujo apelido tem origens diferentes. A confusão persiste na tradição oral, mas o testemunho de Mestre Atenilo distingue claramente Maria dos Anjos como aluna do professor homem Doze Homens, não como "Maria Doze Homens" ela mesma.',
  E'One of the earliest documented female capoeiristas in Brazilian history; student of Doze Homens alongside Salomé',
  E'Uma das primeiras mulheres capoeiristas documentadas na história brasileira; aluna de Doze Homens junto com Salomé',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1905, decade precision): Active as capoeirista in 1920s-1930s per Mestre Atenilo. If in prime (20s-30s) during this period, birth = ~1895-1910. Using 1905 as midpoint (same as Salomé).\n\nDEATH: Unknown. No records found.\n\nTEACHERS:\n- Doze Homens (~1890-~1925, killed during Pedrito persecution) - Per Mestre Atenilo testimony to Bira Almeida\n\nCOMPANIONS:\n- Salomé - Fellow student of Doze Homens; contemporary valentona\n\nCONTEMPORARY VALENTONAS: Maria Doze Homens, Salomé, Chicão, Angélica Endiabrada, Rosa Palmeirão, Massú, Catu\n\nIDENTITY CLARIFICATION: Maria dos Anjos is DISTINCT from:\n1. Maria Doze Homens (Maria Felipe de Oliveira) - separate female capoeirista; possible confusion because Maria dos Anjos trained under male teacher named Doze Homens\n2. Maria dos Anjos (wife of Mestre Bimba) - different person; mother of Crispim and Edvaldo Rosa; active later era\n\nPRIMARY SOURCE: "Atenilo, o relâmpago da Capoeira Regional" by Raimundo César Alves de Almeida (Mestre Itapoan), 1988, Núcleo de Recursos Didáticos da UFBA.\n\nATENILO QUOTE: When questioned about whether Salomé and Maria dos Anjos were "real women," Atenilo indignantly responded: "c''était des femmes, des vraies!" - they were women, real women!\n\nBASTIANTE CONTEXT: Maria dos Anjos and Salomé were known for their love of batuque (combat/dance) and samba. Both learned from Doze Homens, who was a companion of Besouro Mangangá at Trapiche de Baixo.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década): Ativa como capoeirista nos anos 1920-1930 segundo Mestre Atenilo. Se estava no auge (20-30 anos) durante este período, nascimento = ~1895-1910. Usando 1905 como ponto médio (igual a Salomé).\n\nMORTE: Desconhecida. Nenhum registro encontrado.\n\nPROFESSORES:\n- Doze Homens (~1890-~1925, morto durante perseguição de Pedrito) - Segundo testemunho de Mestre Atenilo para Bira Almeida\n\nCOMPANHEIRAS:\n- Salomé - Colega aluna de Doze Homens; valentona contemporânea\n\nVALENTONAS CONTEMPORÂNEAS: Maria Doze Homens, Salomé, Chicão, Angélica Endiabrada, Rosa Palmeirão, Massú, Catu\n\nESCLARECIMENTO DE IDENTIDADE: Maria dos Anjos é DISTINTA de:\n1. Maria Doze Homens (Maria Felipe de Oliveira) - capoeirista mulher separada; possível confusão porque Maria dos Anjos treinou com professor homem chamado Doze Homens\n2. Maria dos Anjos (esposa de Mestre Bimba) - pessoa diferente; mãe de Crispim e Edvaldo Rosa; ativa em era posterior\n\nFONTE PRIMÁRIA: "Atenilo, o relâmpago da Capoeira Regional" de Raimundo César Alves de Almeida (Mestre Itapoan), 1988, Núcleo de Recursos Didáticos da UFBA.\n\nCITAÇÃO DE ATENILO: Quando questionado sobre se Salomé e Maria dos Anjos eram "mulheres de verdade," Atenilo respondeu indignado: "eram mulheres, de verdade!"\n\nCONTEXTO BATUQUE: Maria dos Anjos e Salomé eram conhecidas por seu amor pelo batuque (combate/dança) e samba. Ambas aprenderam com Doze Homens, que era companheiro de Besouro Mangangá no Trapiche de Baixo.'
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

-- Source: entities/persons/maria-izabel.sql (NEW)
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
  E'REPRESENTATIVE FIGURE: Maria Izabel''s profile serves as a memorial to the hundreds of anonymous women documented in police records and newspapers of 1900-1920 Salvador. Her single archival trace represents all those whose names were lost.\n\nARREST RECORD: Gazeta do Povo, December 2, 1914 - arrested for street disorder ("desordem") while carrying a knife.\n\nBIRTH YEAR ESTIMATION (1890, decade precision): If arrested as an adult (20-30 years old) in 1914, birth would be approximately 1884-1894. Using 1890 as midpoint.\n\nNO APELIDO: Unlike legendary figures who earned nicknames (Angélica "Endiabrada," Maria "Doze Homens"), Maria Izabel''s record preserves only her given name - typical of the anonymous majority.\n\nACademic source: Paula Juliana Foltran, "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" PhD thesis, Universidade de Brasília, 2019. Research conducted at Arquivo Público do Estado da Bahia.\n\nCONTEXT: The thesis identified hundreds of similar cases - women arrested for street fighting, carrying weapons, causing "disorder." Most remain anonymous; Maria Izabel''s name survived by chance in a single newspaper record.\n\nSIGNIFICANCE: Her inclusion acknowledges that capoeira history includes not just legendary figures but the countless ordinary practitioners whose stories were systematically erased.',
  E'FIGURA REPRESENTATIVA: O perfil de Maria Izabel serve como memorial às centenas de mulheres anônimas documentadas em registros policiais e jornais de Salvador de 1900-1920. Seu único rastro arquivístico representa todas aquelas cujos nomes foram perdidos.\n\nREGISTRO DE PRISÃO: Gazeta do Povo, 2 de dezembro de 1914 - presa por desordem na rua enquanto portava uma faca.\n\nESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Se foi presa como adulta (20-30 anos) em 1914, o nascimento seria aproximadamente 1884-1894. Usando 1890 como ponto médio.\n\nSEM APELIDO: Diferente das figuras lendárias que ganharam apelidos (Angélica "Endiabrada," Maria "Doze Homens"), o registro de Maria Izabel preserva apenas seu nome - típico da maioria anônima.\n\nFONTE ACADÊMICA: Paula Juliana Foltran, "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" tese de doutorado, Universidade de Brasília, 2019. Pesquisa realizada no Arquivo Público do Estado da Bahia.\n\nCONTEXTO: A tese identificou centenas de casos similares - mulheres presas por brigar nas ruas, portar armas, causar "desordem." A maioria permanece anônima; o nome de Maria Izabel sobreviveu por acaso em um único registro de jornal.\n\nSIGNIFICÂNCIA: Sua inclusão reconhece que a história da capoeira inclui não apenas figuras lendárias, mas os inúmeros praticantes comuns cujas histórias foram sistematicamente apagadas.'
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

-- Source: entities/persons/pequena.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Pequena (Maria Bispo)
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1910, decade):
-- Wife of José Martins dos Santos (~1900) and mother of Mestre Curió
-- (born 1937). Assuming typical childbearing age of 25-35 years,
-- Maria was likely born between 1902-1912. Using 1910 as midpoint
-- estimate with decade precision.
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
  'Maria Bispo',
  'Pequena',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Maria Bispo, known as Pequena, was a capoeirista and normalista (teacher) from Santo Amaro, Bahia. She is the mother of Mestre Curió, one of Capoeira Angola''s most revered guardians, and represents the often-overlooked maternal line of capoeira transmission in the early 20th century.

Maria came from a family of angoleiros in Santo Amaro da Purificação, in the Recôncavo Baiano—a region central to capoeira''s development. Her sister also practiced capoeira, indicating that the art was not limited to men in her family. This tradition of female practitioners in Santo Amaro, while rarely documented, was part of the broader fabric of capoeira culture that included figures like Maria Homem, Julia Fogareira, and other legendary capoeiristas listed by Mestre Pastinha.

Maria married José Martins dos Santos (known as Malvadeza or Martim da Pemba), himself a capoeirista and the son of Pedro Virício (Curió Velho). Together they formed a household where capoeira was not merely practiced but lived. The depth of their commitment to the art is demonstrated by a remarkable fact: Maria gave birth to their son Jaime within a roda de capoeira.

Jaime Martins dos Santos was born on January 23, 1937, in Candeias, Bahia. From age six, he would be trained in capoeira by both his father and grandfather, eventually becoming the celebrated Mestre Curió. Mestre Curió speaks of his family with pride: "I have my whole family of capoeiristas"—including not only his father and grandfather but also his mother and aunt.

Maria Bispo''s profession as a normalista (a graduate of a normal school, qualified to teach primary education) suggests she was an educated woman, relatively uncommon for Afro-Brazilian women of her era. This combination of formal education and traditional knowledge of capoeira made her a bridge between two worlds.

While little additional documentation survives about Maria Bispo''s individual capoeira practice, her presence in this remarkable family—as wife, mother, and practitioner—helped create the conditions for one of the most complete transmissions of Capoeira Angola tradition from the pre-prohibition era to the present day.',
  -- bio_pt
  E'Maria Bispo, conhecida como Pequena, foi uma capoeirista e normalista de Santo Amaro, Bahia. Ela é a mãe de Mestre Curió, um dos mais reverenciados guardiões da Capoeira Angola, e representa a linha materna frequentemente negligenciada da transmissão de capoeira no início do século XX.

Maria veio de uma família de angoleiros em Santo Amaro da Purificação, no Recôncavo Baiano—uma região central para o desenvolvimento da capoeira. Sua irmã também praticava capoeira, indicando que a arte não era limitada aos homens em sua família. Esta tradição de praticantes femininas em Santo Amaro, embora raramente documentada, fazia parte do tecido mais amplo da cultura da capoeira que incluía figuras como Maria Homem, Júlia Fogareira e outras capoeiristas lendárias listadas por Mestre Pastinha.

Maria casou-se com José Martins dos Santos (conhecido como Malvadeza ou Martim da Pemba), ele próprio capoeirista e filho de Pedro Virício (Curió Velho). Juntos formaram um lar onde a capoeira não era apenas praticada mas vivida. A profundidade de seu compromisso com a arte é demonstrada por um fato notável: Maria deu à luz seu filho Jaime dentro de uma roda de capoeira.

Jaime Martins dos Santos nasceu em 23 de janeiro de 1937, em Candeias, Bahia. A partir dos seis anos, ele seria treinado em capoeira por seu pai e avô, eventualmente se tornando o celebrado Mestre Curió. Mestre Curió fala de sua família com orgulho: "Eu tenho toda minha família de capoeiras"—incluindo não apenas seu pai e avô mas também sua mãe e tia.

A profissão de Maria Bispo como normalista (graduada de uma escola normal, qualificada para ensinar educação primária) sugere que ela era uma mulher educada, relativamente incomum para mulheres afro-brasileiras de sua época. Esta combinação de educação formal e conhecimento tradicional de capoeira a tornou uma ponte entre dois mundos.

Embora pouca documentação adicional sobreviva sobre a prática individual de capoeira de Maria Bispo, sua presença nesta família notável—como esposa, mãe e praticante—ajudou a criar as condições para uma das transmissões mais completas da tradição da Capoeira Angola da era pré-proibição até os dias atuais.',
  -- achievements_en
  E'Part of multi-generational capoeira family; Gave birth to Mestre Curió within a roda de capoeira; Normalista (qualified teacher); Helped transmit Angola tradition to next generation',
  -- achievements_pt
  E'Parte de família de capoeira multi-geracional; Deu à luz Mestre Curió dentro de uma roda de capoeira; Normalista (professora qualificada); Ajudou a transmitir tradição Angola para próxima geração',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1910, decade):
Wife of José Martins dos Santos (~1900) and mother of Mestre Curió (born 1937). Assuming typical childbearing age of 25-35 years, Maria was likely born between 1902-1912. Using 1910 as midpoint estimate with decade precision.

NAME:
- Full name: Maria Bispo
- Apelido: "Pequena" (meaning "Small" or "Little one")

OCCUPATION: Normalista (teacher qualified through normal school)

FAMILY:
- Husband: José Martins dos Santos (Malvadeza)
- Son: Jaime Martins dos Santos (Mestre Curió, b. 1937)
- Father-in-law: Pedro Virício (Curió Velho)
- Sister: unnamed, also practiced capoeira
- Came from a family of angoleiros from Santo Amaro

NOTABLE DETAIL:
Gave birth to Mestre Curió within a roda de capoeira, according to tribunademinas.com interview.

HISTORICAL CONTEXT:
One of the female capoeiristas practicing in the early 20th century. While rare, female practitioners did exist, as documented by Mestre Pastinha''s 1967 list including Maria Homem, Júlia Fogareira, Palmeirona, and Maria Pernambucana.

LIMITED DOCUMENTATION:
Very little individual documentation exists about Maria Bispo''s capoeira practice. Most information comes from accounts about her son Mestre Curió and his family background. No death date found in sources.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1910, década):
Esposa de José Martins dos Santos (~1900) e mãe de Mestre Curió (nascido 1937). Assumindo idade típica de maternidade de 25-35 anos, Maria provavelmente nasceu entre 1902-1912. Usando 1910 como estimativa média com precisão de década.

NOME:
- Nome completo: Maria Bispo
- Apelido: "Pequena"

PROFISSÃO: Normalista (professora qualificada através de escola normal)

FAMÍLIA:
- Marido: José Martins dos Santos (Malvadeza)
- Filho: Jaime Martins dos Santos (Mestre Curió, n. 1937)
- Sogro: Pedro Virício (Curió Velho)
- Irmã: sem nome, também praticava capoeira
- Veio de uma família de angoleiros de Santo Amaro

DETALHE NOTÁVEL:
Deu à luz Mestre Curió dentro de uma roda de capoeira, segundo entrevista do tribunademinas.com.

CONTEXTO HISTÓRICO:
Uma das capoeiristas femininas praticando no início do século XX. Embora raras, praticantes femininas existiam, conforme documentado pela lista de 1967 de Mestre Pastinha incluindo Maria Homem, Júlia Fogareira, Palmeirona e Maria Pernambucana.

DOCUMENTAÇÃO LIMITADA:
Existe muito pouca documentação individual sobre a prática de capoeira de Maria Bispo. A maioria das informações vem de relatos sobre seu filho Mestre Curió e sua origem familiar. Nenhuma data de falecimento encontrada nas fontes.'
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

-- Source: entities/persons/piroca.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Piroca
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890 based on active period in 1920s alongside
-- brother Pedro Porreta (also estimated ~1890). If 25-35 years old during
-- the December 1920 incident, birth = ~1885-1895. Using 1890 as midpoint.
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
  'Pedro de Alcântara da Conceição',
  'Piroca',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-9', 'https://velhosmestres.com/br/destaques-9', 'https://books.scielo.org/id/pvm8g']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s). Known for using razors in street fights alongside his brother Pedro Porreta. Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s). Conhecido por usar navalhas em brigas de rua ao lado de seu irmão Pedro Porreta. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bilingual)
  E'Pedro de Alcântara da Conceição, known as Piroca, was a capoeirista and valentão of early 20th century Salvador, Bahia. He was the brother of Pedro Celestino dos Santos (Pedro Porreta), and together they dominated the Baixa dos Sapateiros neighborhood.\n\nThe book "Mestres e capoeiras famosos da Bahia" features the two brothers together with the subtitle "Os donos do quarteirão" (The owners of the block), indicating their territorial control over their neighborhood in Salvador. The Baixa dos Sapateiros, nicknamed "Baixinha," was known as a gathering place for valentões, where police cavalry squads had frequent work combating crimes committed with headbutts (churuméla) and razors.\n\nPiroca''s only documented incident appears in a December 14, 1920 report in the A Tarde newspaper. In the Taboão area, José Batista da Cruz, nicknamed "Guruxinha," was attacked with razor cuts by Pedro Porreta, with Piroca assisting his brother. The victim later died from his injuries. This incident represents the violent street culture of capoeiristas during the First Republic era, when razors were common weapons and territorial disputes could turn deadly.\n\nUnlike his brother Pedro Porreta, whose later life is documented through court cases and confrontations with the valentona Chicão, Piroca appears to have had a less documented career. The existing records suggest he functioned as a loyal companion to his brother in their territorial activities.',
  E'Pedro de Alcântara da Conceição, conhecido como Piroca, foi um capoeirista e valentão do início do século XX em Salvador, Bahia. Era irmão de Pedro Celestino dos Santos (Pedro Porreta), e juntos dominavam o bairro da Baixa dos Sapateiros.\n\nO livro "Mestres e capoeiras famosos da Bahia" apresenta os dois irmãos juntos com o subtítulo "Os donos do quarteirão," indicando seu controle territorial sobre sua vizinhança em Salvador. A Baixa dos Sapateiros, apelidada de "Baixinha," era conhecida como local de reunião de valentões, onde os esquadrões de cavalaria da polícia tinham trabalho frequente combatendo crimes cometidos com cabeçadas (churuméla) e navalhas.\n\nO único incidente documentado de Piroca aparece em uma reportagem de 14 de dezembro de 1920 no jornal A Tarde. Na área do Taboão, José Batista da Cruz, apelidado "Guruxinha," foi atacado com cortes de navalha por Pedro Porreta, com Piroca auxiliando seu irmão. A vítima faleceu posteriormente devido aos ferimentos. Este incidente representa a cultura violenta das ruas dos capoeiristas durante a era da Primeira República, quando navalhas eram armas comuns e disputas territoriais podiam se tornar mortais.\n\nAo contrário de seu irmão Pedro Porreta, cuja vida posterior é documentada através de processos judiciais e confrontos com a valentona Chicão, Piroca parece ter tido uma carreira menos documentada. Os registros existentes sugerem que ele funcionava como companheiro leal de seu irmão em suas atividades territoriais.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with subtitle "Os donos do quarteirão" (The owners of the block) alongside his brother Pedro Porreta',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com subtítulo "Os donos do quarteirão" junto com seu irmão Pedro Porreta',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Active alongside brother Pedro Porreta in 1920. If 25-35 years old during the December 1920 incident, birth = ~1885-1895. Using 1890 as midpoint, matching brother''s estimate.\n\nFULL NAME DISCREPANCY:\n- "Pedro de Alcântara" - primary sources (A Tarde 1920, velhosmestres.com)\n- "Pedro de Alcântara da Conceição" - CDO Sergipe registry (MAJORITY among registries)\n\nBROTHER: Pedro Porreta (Pedro Celestino dos Santos) - frequent companion; different surnames suggest possibly half-brothers or naming based on different parents/patrons.\n\nTERRITORY: Baixa dos Sapateiros ("Baixinha"), Salvador - controlled jointly with brother.\n\nLEGAL RECORDS:\n- Dec 14, 1920: Participated in attack on Guruxinha (José Batista da Cruz) with razors in Taboão alongside brother Pedro Porreta; victim died from injuries (A Tarde newspaper)\n\nNOTE: Unlike Pedro Porreta, no later legal records or incidents documented for Piroca. His fate after 1920 is unknown.\n\nSOURCES: velhosmestres.com, "Mestres e capoeiras famosos da Bahia" (SciELO), A Tarde newspaper (Dec 14, 1920), CDO Sergipe registry.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Ativo ao lado do irmão Pedro Porreta em 1920. Se tinha 25-35 anos durante o incidente de dezembro de 1920, nascimento = ~1885-1895. Usando 1890 como ponto médio, combinando com a estimativa do irmão.\n\nDISCREPÂNCIA DO NOME COMPLETO:\n- "Pedro de Alcântara" - fontes primárias (A Tarde 1920, velhosmestres.com)\n- "Pedro de Alcântara da Conceição" - registro CDO Sergipe (MAIORIA entre registros)\n\nIRMÃO: Pedro Porreta (Pedro Celestino dos Santos) - companheiro frequente; sobrenomes diferentes sugerem possivelmente meio-irmãos ou nomes baseados em diferentes pais/padrinhos.\n\nTERRITÓRIO: Baixa dos Sapateiros ("Baixinha"), Salvador - controlado junto com o irmão.\n\nREGISTROS LEGAIS:\n- 14 dez 1920: Participou do ataque a Guruxinha (José Batista da Cruz) com navalhas no Taboão ao lado do irmão Pedro Porreta; vítima morreu dos ferimentos (jornal A Tarde)\n\nNOTA: Ao contrário de Pedro Porreta, nenhum registro legal ou incidente posterior documentado para Piroca. Seu destino após 1920 é desconhecido.\n\nFONTES: velhosmestres.com, "Mestres e capoeiras famosos da Bahia" (SciELO), jornal A Tarde (14 dez 1920), registro CDO Sergipe.'
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

-- Source: entities/persons/rosa-palmeirao.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Rosa Palmeirão
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1885 (decade precision)
-- Active as valentona in meados de 1910 (around 1910-1915).
-- If in prime (25-35) during this period, birth = ~1875-1890.
-- Defeated Pedro Mineiro before his death on Jan 18, 1915.
-- Using 1885 as midpoint estimate.
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
  'Cândida Rosa de Jesus',
  'Rosa Palmeirão',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://atarde.com.br/muito/a-luta-pelo-reconhecimento-e-igualdade-dentro-e-fora-nas-rodas-de-capoeira-1120700']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for her golpes in the roda and weapon handling (navalha in her skirt, punhal on her chest). Demonstrated combat skills that allowed her to defeat Pedro Mineiro, one of Salvador''s most notorious valentões.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida por seus golpes na roda e manuseio de armas (navalha na saia, punhal no peito). Demonstrou habilidades de combate que lhe permitiram derrotar Pedro Mineiro, um dos valentões mais notórios de Salvador.',
  -- Life dates
  1885,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Cândida Rosa de Jesus, known as Rosa Palmeirão, was one of the legendary valentonas of early 20th century Salvador, Bahia. In an era when capoeira was criminalized and female practitioners were exceptionally rare, Rosa carved out a fearsome reputation through her skills in the roda and her readiness to confront anyone who challenged her.\n\nRosa Palmeirão was famous for participating in capoeira rodas and maintained romantic relationships with many capoeiristas of her time. Contemporary sources describe her as "a mulata valente" - a brave mixed-race woman - whose fame spread far and wide. She was known for her golpes (moves) in the roda, her enchanting voice, and her frequent appearances in police records for "desacatos e brigas" (disturbances and fights).\n\nThe sources describe her as a valentona who "quando bebia quebrava os bares da capital baiana em meados de 1910" - when she drank, she would break up bars in the Bahian capital around 1910. Like other capoeiristas of the era, she carried a navalha (straight razor) hidden in her skirt and a punhal (dagger) on her chest.\n\nThe most famous episode of her life involved Pedro Mineiro, one of Salvador''s most notorious capoeiristas. Pedro Mineiro (born 1887 in Ouro Preto, died January 18, 1915 in Salvador) was a maritime loader and police informant whose body was covered with scars from razors and knives. Yet Rosa Palmeirão "bateu impiedosamente em Pedro Mineiro, acabando com sua fama de valente" - she beat Pedro Mineiro mercilessly, ending his reputation as a tough guy. This victory over such a feared opponent cemented her legendary status.\n\nRosa Palmeirão inspired the creation of a literary character bearing her name in Jorge Amado''s 1936 novel "Mar Morto" (Dead Sea). In the novel, the character is described with the famous verse: "navalha na saia, punhal no peito, deu em seis soldados, comeu vinte prisões, bateu em muito homem" - razor in her skirt, dagger on her chest, she beat six soldiers, was imprisoned twenty times, beat many men. She wandered through the Recôncavo, the south of the state, and Rio de Janeiro. The novel explains that a flower - a "rosa palmeirão" (a type of Brazilian rose) - that she always wore on her dress gave her the nickname.\n\nThe character in "Mar Morto" became the subject of academic analysis, with researchers drawing comparisons between Rosa Palmeirão and archetypal feminine figures like the goddess Lilith and the Afro-Brazilian spirit entity Pombagira. In Amado''s narrative, Rosa Palmeirão is a "filha de Iemanjá há vinte anos" - a daughter of Iemanjá for twenty years.\n\nThe historical Rosa Palmeirão represents the significant but often overlooked role of women in early capoeira. Researcher Paula Juliana Foltran, author of the doctoral thesis "Mulheres Incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)," includes a section on "Rosa Palmeirão e os Capoeiras" examining gender, race, and class in capoeira history. Her research, based on records from the Arquivo Público do Estado da Bahia, has helped bring visibility to the protagonism of Black women in Salvador''s capoeira scene.\n\nRosa Palmeirão stands alongside other legendary valentonas of Bahia - Salomé, Maria Doze Homens, Chicão, Angélica Endiabrada, Massú, Catu, Almerinda, and Menininha. These women''s handling of razors, knives, and fists, combined with their presence in police records, led researchers to believe they were indeed capoeiristas, challenging the long-held myth that capoeira was exclusively a male domain.',
  E'Cândida Rosa de Jesus, conhecida como Rosa Palmeirão, foi uma das lendárias valentonas de Salvador, Bahia, no início do século XX. Em uma época em que a capoeira era criminalizada e praticantes femininas eram excepcionalmente raras, Rosa construiu uma reputação temível através de suas habilidades na roda e sua disposição para enfrentar qualquer um que a desafiasse.\n\nRosa Palmeirão era famosa por participar das rodas de capoeira e mantinha relações amorosas com muitos capoeiristas de sua época. Fontes contemporâneas a descrevem como "a mulata valente" - cuja fama se espalhava por toda parte. Ela era conhecida por seus golpes na roda, sua voz encantadora e suas frequentes aparições nos registros policiais por "desacatos e brigas."\n\nAs fontes a descrevem como uma valentona que "quando bebia quebrava os bares da capital baiana em meados de 1910." Como outros capoeiristas da época, ela carregava uma navalha escondida na saia e um punhal no peito.\n\nO episódio mais famoso de sua vida envolveu Pedro Mineiro, um dos capoeiristas mais notórios de Salvador. Pedro Mineiro (nascido em 1887 em Ouro Preto, falecido em 18 de janeiro de 1915 em Salvador) era um trabalhador marítimo e informante da polícia cujo corpo era coberto de cicatrizes de navalhas e facas. Ainda assim, Rosa Palmeirão "bateu impiedosamente em Pedro Mineiro, acabando com sua fama de valente." Esta vitória sobre um oponente tão temido cimentou seu status lendário.\n\nRosa Palmeirão inspirou a criação de uma personagem literária com seu nome no romance "Mar Morto" (1936) de Jorge Amado. No romance, a personagem é descrita com o famoso verso: "navalha na saia, punhal no peito, deu em seis soldados, comeu vinte prisões, bateu em muito homem." Ela andava pelo Recôncavo, sul do Estado e Rio de Janeiro. O romance explica que uma flor - uma "rosa palmeirão" (um tipo de rosa brasileira) - que ela sempre usava no vestido lhe deu o apelido.\n\nA personagem em "Mar Morto" tornou-se objeto de análise acadêmica, com pesquisadores traçando comparações entre Rosa Palmeirão e figuras femininas arquetípicas como a deusa Lilith e a entidade espiritual afro-brasileira Pombagira. Na narrativa de Amado, Rosa Palmeirão é "filha de Iemanjá há vinte anos."\n\nA Rosa Palmeirão histórica representa o papel significativo, mas frequentemente negligenciado, das mulheres na capoeira primitiva. A pesquisadora Paula Juliana Foltran, autora da tese de doutorado "Mulheres Incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)," inclui uma seção sobre "Rosa Palmeirão e os Capoeiras" examinando gênero, raça e classe na história da capoeira. Sua pesquisa, baseada em registros do Arquivo Público do Estado da Bahia, ajudou a dar visibilidade ao protagonismo das mulheres negras na cena da capoeira de Salvador.\n\nRosa Palmeirão está ao lado de outras lendárias valentonas da Bahia - Salomé, Maria Doze Homens, Chicão, Angélica Endiabrada, Massú, Catu, Almerinda e Menininha. O manuseio de navalhas, facas e punhos dessas mulheres, combinado com sua presença nos registros policiais, levou pesquisadores a acreditar que eram de fato capoeiristas, desafiando o mito de longa data de que a capoeira era exclusivamente um domínio masculino.',
  -- Achievements
  'Defeated Pedro Mineiro, one of Salvador''s most notorious valentões (~1910-1914); inspired the character Rosa Palmeirão in Jorge Amado''s novel "Mar Morto" (1936); featured in Paula Juliana Foltran''s academic research on women in capoeira; recognized as one of the legendary valentonas of early 20th century Bahia; immortalized in the popular verse "navalha na saia, punhal no peito"',
  'Derrotou Pedro Mineiro, um dos valentões mais notórios de Salvador (~1910-1914); inspirou a personagem Rosa Palmeirão no romance "Mar Morto" (1936) de Jorge Amado; apresentada na pesquisa acadêmica de Paula Juliana Foltran sobre mulheres na capoeira; reconhecida como uma das lendárias valentonas da Bahia do início do século XX; imortalizada no verso popular "navalha na saia, punhal no peito"',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1885, decade precision): Active as valentona "em meados de 1910" (around 1910-1915). Defeated Pedro Mineiro before his death on Jan 18, 1915. If in prime (25-35) during this period, birth = ~1875-1890. Using 1885 as midpoint.\n\nDEATH: Unknown. No records found of her death.\n\nNAME:\n- Full name: Cândida Rosa de Jesus\n- Apelido: Rosa Palmeirão (from the rosa palmeirão flower she wore on her dress)\n- The rosa palmeirão is a red Brazilian rose resistant to sun, with short stems\n\nHISTORICAL VS. LITERARY:\n- Rosa Palmeirão was a REAL historical figure who inspired Jorge Amado''s character\n- Confirmed as participant in capoeira rodas with documented police records\n- The 1936 novel "Mar Morto" fictionalized her life with embellishments\n\nPEDRO MINEIRO CONFRONTATION:\n- Pedro Mineiro: Pedro José Vieira (1887-1915), maritime loader, police informant\n- His body was "coberto de cicatrizes de navalhas e facas" (covered with scars from razors and knives)\n- Rosa Palmeirão "bateu impiedosamente em Pedro Mineiro, acabando com sua fama de valente"\n- This occurred before his death on Jan 18, 1915\n\nCONTEMPORARIES (Female Valentonas 1900s-1920s):\n- Salomé (student of Doze Homens)\n- Maria Doze Homens\n- Chicão (Francisca Albino dos Santos)\n- Angélica Endiabrada (1910-1920s)\n- Massú\n- Catu\n- Almerinda\n- Menininha\n- Adelaide Presepeira\n- Maria Izabel\n\nLITERARY LEGACY:\n- Novel: "Mar Morto" by Jorge Amado (1936)\n- Chapter: "Acalanto de Rosa Palmeirão"\n- TV adaptation: "Porto dos Milagres" (Globo, 2001) - actress Luiza Tomé\n- Music: "Rosa Palmeirão" on album "Jorge Amado Letra e Música" (2000)\n- Academic study: Tese UFT "Uma leitura arquetípica do feminino em Mar Morto"\n\nACADEMIC SOURCES:\n- Paula Juliana Foltran, "Mulheres Incorrigíveis" (thesis 2019, book 2021, Editora Dandara)\n- Section: "Rosa Palmeirão e os Capoeiras: gênero, raça e classe na constituição histórica de significados"\n- Adriana Albert Dias, "A Malandragem da Mandinga: o cotidiano dos capoeiristas em Salvador na República Velha (1910-1925)" (EDUFBA, 2004)\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (EDUFBA, 2009) - mentioned alongside Massú\n\nNOTE ON MARIA FELIPA DE OLIVEIRA: Some sources erroneously conflate Rosa Palmeirão with Maria Felipa de Oliveira (died July 4, 1873), the independence heroine from Itaparica. These are DISTINCT historical figures from different eras.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1885, precisão de década): Ativa como valentona "em meados de 1910" (por volta de 1910-1915). Derrotou Pedro Mineiro antes de sua morte em 18 de janeiro de 1915. Se estava no auge (25-35 anos) durante este período, nascimento = ~1875-1890. Usando 1885 como ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado de sua morte.\n\nNOME:\n- Nome completo: Cândida Rosa de Jesus\n- Apelido: Rosa Palmeirão (da flor rosa palmeirão que ela usava no vestido)\n- A rosa palmeirão é uma rosa brasileira vermelha resistente ao sol, com hastes curtas\n\nHISTÓRICA VS. LITERÁRIA:\n- Rosa Palmeirão foi uma figura histórica REAL que inspirou a personagem de Jorge Amado\n- Confirmada como participante das rodas de capoeira com registros policiais documentados\n- O romance "Mar Morto" de 1936 ficcionalizou sua vida com embelezamentos\n\nCONFRONTO COM PEDRO MINEIRO:\n- Pedro Mineiro: Pedro José Vieira (1887-1915), trabalhador marítimo, informante da polícia\n- Seu corpo era "coberto de cicatrizes de navalhas e facas"\n- Rosa Palmeirão "bateu impiedosamente em Pedro Mineiro, acabando com sua fama de valente"\n- Isto ocorreu antes de sua morte em 18 de janeiro de 1915\n\nCONTEMPORÂNEAS (Valentonas 1900s-1920s):\n- Salomé (aluna de Doze Homens)\n- Maria Doze Homens\n- Chicão (Francisca Albino dos Santos)\n- Angélica Endiabrada (1910-1920s)\n- Massú\n- Catu\n- Almerinda\n- Menininha\n- Adelaide Presepeira\n- Maria Izabel\n\nLEGADO LITERÁRIO:\n- Romance: "Mar Morto" de Jorge Amado (1936)\n- Capítulo: "Acalanto de Rosa Palmeirão"\n- Adaptação TV: "Porto dos Milagres" (Globo, 2001) - atriz Luiza Tomé\n- Música: "Rosa Palmeirão" no álbum "Jorge Amado Letra e Música" (2000)\n- Estudo acadêmico: Tese UFT "Uma leitura arquetípica do feminino em Mar Morto"\n\nFONTES ACADÊMICAS:\n- Paula Juliana Foltran, "Mulheres Incorrigíveis" (tese 2019, livro 2021, Editora Dandara)\n- Seção: "Rosa Palmeirão e os Capoeiras: gênero, raça e classe na constituição histórica de significados"\n- Adriana Albert Dias, "A Malandragem da Mandinga: o cotidiano dos capoeiristas em Salvador na República Velha (1910-1925)" (EDUFBA, 2004)\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (EDUFBA, 2009) - mencionada junto com Massú\n\nNOTA SOBRE MARIA FELIPA DE OLIVEIRA: Algumas fontes erroneamente confundem Rosa Palmeirão com Maria Felipa de Oliveira (falecida em 4 de julho de 1873), a heroína da independência de Itaparica. São figuras históricas DISTINTAS de eras diferentes.'
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

-- Source: entities/persons/valdomiro-malvadeza.sql (NEW)
-- ============================================================
-- GENEALOGY PERSON: Valdomiro Malvadeza (CECA student)
-- Generated: 2025-12-19
-- ============================================================
-- Student of Mestre Pastinha at CECA (Centro Esportivo de
-- Capoeira Angola). Singer on the historic 1969 LP "Capoeira
-- Angola - Mestre Pastinha e sua academia."
--
-- DISTINCT FROM: José Martins dos Santos "Malvadeza" (Curió's
-- father), who is a separate person already imported with
-- apelido = 'Malvadeza' and no apelido_context.
--
-- This person requires apelido_context = 'CECA student' to
-- distinguish from the other Malvadeza.
--
-- BATERIA PARTICIPATION:
-- Per Mestre Gato Preto's 1999 interview: "Na roda, João
-- Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."
--
-- 1969 LP RECORDING:
-- "Capoeira Angola - Mestre Pastinha e sua academia" (Philips
-- R 765.097 L) - recorded live at Teatro Castro Alves, Salvador.
-- Singers: Mestre Pastinha, Waldomiro Malvadeza, Roberto Satanás.
-- Produced by João Mello. Liner notes by Jorge Amado.
--
-- STILL ACTIVE 1999: Documented in Portal Capoeira chronicle -
-- author played with "Mestre Valdomiro Malvadeza (discípulo de
-- Mestre Pastinha) no Cruzeiro, Pelourinho/Bahia" in 1999.
--
-- BIRTH YEAR ESTIMATION (1930, decade precision):
-- - Active at CECA in 1950s-1960s as adult performer
-- - Recorded on 1969 LP as singer (required adult proficiency)
-- - Still playing in 1999 at ~69 years old (plausible)
-- - Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)
-- - Estimate: ~1930 ± 5 years, using decade precision
--
-- NAME VARIATIONS: Also spelled "Waldomiro Malvadeza" on LP
-- credits and some sources.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown; only "Valdomiro" documented
  'Valdomiro Malvadeza',
  'CECA student', -- Distinguishes from José Martins "Malvadeza" (Curió's father)
  'mestre'::genealogy.title, -- Referred to as "Mestre Valdomiro Malvadeza" in sources
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/pastinha-1969-1', 'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/cronica-a-capoeira-vai-a-luta/']::text[],
  'angola'::genealogy.style,
  E'Trained in the traditional Capoeira Angola style under Mestre Pastinha at CECA. Recognized as a singer (cantador) and bateria player. His voice is preserved on the historic 1969 LP recording alongside Mestre Pastinha.',
  E'Treinado no estilo tradicional de Capoeira Angola sob Mestre Pastinha no CECA. Reconhecido como cantador e tocador de bateria. Sua voz está preservada na histórica gravação do LP de 1969 ao lado de Mestre Pastinha.',
  1930, -- Estimated: active at CECA 1950s-60s, recorded 1969 LP, still playing 1999
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown, likely Salvador or Recôncavo Baiano
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Valdomiro Malvadeza (also spelled Waldomiro) was a student of Mestre Pastinha at the Centro Esportivo de Capoeira Angola (CECA) in the Pelourinho district of Salvador, Bahia. He was part of the generation of angoleiros who trained at CECA during its golden era in the 1950s-1960s, alongside mestres such as João Grande, João Pequeno, Gildo Alfinete, Albertino da Hora, Curió, and Gato Preto.

Valdomiro was recognized for his skills as both a bateria player and a singer (cantador). Mestre Gato Preto, in a 1999 interview, recalled the composition of the bateria at Pastinha''s rodas: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria" ("In the roda, João Pequeno, Moreno, Albertino, Valdomiro, and I made up the bateria"). This places Valdomiro among the core musicians who accompanied the rodas at CECA.

His voice is preserved on one of the most important recordings in capoeira history: the 1969 LP "Capoeira Angola - Mestre Pastinha e sua academia" (Philips R 765.097 L). Recorded live at the Teatro Castro Alves in Salvador, the album featured singing by Mestre Pastinha, Waldomiro Malvadeza, and Roberto Satanás. The liner notes were written by the renowned novelist Jorge Amado, J.B. Colmenero, and Mestre Pastinha himself. The album included traditional ladainhas and capoeira songs, with the bateria consisting of two berimbaus, two pandeiros, agogô, and reco-reco.

Unlike some of his contemporaries, Valdomiro was not among the delegation that traveled to Dakar, Senegal for the First International Festival of Black Arts in April 1966.

Valdomiro remained active in Salvador''s capoeira community for decades. In 1999, according to a chronicle published in Portal Capoeira, the author had "the honor of playing capoeira in 1999 with Mestre Valdomiro Malvadeza (disciple of Mestre Pastinha) at Cruzeiro, Pelourinho/Bahia." The Cruzeiro do São Francisco is the historic location where CECA was originally located (Largo do Cruzeiro de São Francisco), suggesting Valdomiro continued to practice at or near the birthplace of formal Capoeira Angola instruction.

',
  -- bio_pt
  E'Valdomiro Malvadeza (também grafado Waldomiro) foi aluno de Mestre Pastinha no Centro Esportivo de Capoeira Angola (CECA) no bairro do Pelourinho em Salvador, Bahia. Ele fez parte da geração de angoleiros que treinaram no CECA durante sua era dourada nas décadas de 1950-1960, junto com mestres como João Grande, João Pequeno, Gildo Alfinete, Albertino da Hora, Curió e Gato Preto.

Valdomiro era reconhecido por suas habilidades tanto como tocador de bateria quanto como cantador. Mestre Gato Preto, em uma entrevista de 1999, recordou a composição da bateria nas rodas de Pastinha: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria." Isto coloca Valdomiro entre os músicos principais que acompanhavam as rodas no CECA.

Sua voz está preservada em uma das gravações mais importantes da história da capoeira: o LP de 1969 "Capoeira Angola - Mestre Pastinha e sua academia" (Philips R 765.097 L). Gravado ao vivo no Teatro Castro Alves em Salvador, o álbum apresentou canto de Mestre Pastinha, Waldomiro Malvadeza e Roberto Satanás. As notas de capa foram escritas pelo renomado romancista Jorge Amado, J.B. Colmenero e pelo próprio Mestre Pastinha. O álbum incluiu ladainhas tradicionais e cantos de capoeira, com a bateria composta por dois berimbaus, dois pandeiros, agogô e reco-reco.

Diferente de alguns de seus contemporâneos, Valdomiro não estava entre a delegação que viajou para Dakar, Senegal para o Primeiro Festival Internacional de Artes Negras em abril de 1966.

Valdomiro permaneceu ativo na comunidade de capoeira de Salvador por décadas. Em 1999, segundo uma crônica publicada no Portal Capoeira, o autor teve "a honra de jogar capoeira em 1999 com o Mestre Valdomiro Malvadeza (discípulo de Mestre Pastinha) no Cruzeiro, Pelourinho/Bahia." O Cruzeiro do São Francisco é a localização histórica onde o CECA estava originalmente localizado (Largo do Cruzeiro de São Francisco), sugerindo que Valdomiro continuou a praticar no ou próximo ao local de nascimento do ensino formal de Capoeira Angola.

',
  -- achievements_en
  E'Trained under Mestre Pastinha at CECA during its golden era (1950s-1960s)\nSinger on the historic 1969 LP "Capoeira Angola - Mestre Pastinha e sua academia"\nCore bateria player at Pastinha''s rodas alongside João Pequeno, Albertino, and Gato Preto\nStill active as mestre in Salvador''s Pelourinho in 1999',
  -- achievements_pt
  E'Treinou sob Mestre Pastinha no CECA durante sua era dourada (décadas de 1950-1960)\nCantador no histórico LP de 1969 "Capoeira Angola - Mestre Pastinha e sua academia"\nTocador principal de bateria nas rodas de Pastinha junto com João Pequeno, Albertino e Gato Preto\nAinda ativo como mestre no Pelourinho de Salvador em 1999',
  -- notes_en
  E'NAME VARIATIONS:
- "Valdomiro Malvadeza" - common spelling
- "Waldomiro Malvadeza" - LP credits and some sources

DISAMBIGUATION: This is DISTINCT from José Martins dos Santos "Malvadeza" (Curió''s father), a violeiro from Santo Amaro. That person is imported with apelido = ''Malvadeza'' and no context. This entry uses apelido_context = ''CECA student''.

TEACHER: Mestre Pastinha - trained at CECA in Pelourinho

CONTEMPORARIES AT CECA:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Gildo Alfinete
- Roberto Satanás (Roberto Pereira)
- Albertino da Hora (also known as "Moreno")
- Gato Preto (José Gabriel Góes)
- Curió (Jaime Martins dos Santos)
- Bola Sete
- Boca Rica

BATERIA COMPANIONS (per Gato Preto 1999):
- João Pequeno, Moreno (Albertino), Gato Preto

1969 LP RECORDING:
- Title: "Capoeira Angola - Mestre Pastinha e sua academia"
- Label: Philips (R 765.097 L)
- Location: Teatro Castro Alves, Salvador
- Singers: Mestre Pastinha, Waldomiro Malvadeza, Roberto Satanás
- Producer: João Mello
- Liner notes: Jorge Amado, J.B. Colmenero, Mestre Pastinha
- Bateria: Two berimbaus, two pandeiros, agogô, reco-reco

STILL ACTIVE 1999: Played capoeira at Cruzeiro, Pelourinho per Portal Capoeira chronicle.

NOT IN DAKAR 1966: Did not travel to Senegal with Pastinha''s delegation.

BIRTH YEAR ESTIMATION (1930, decade):
- Active at CECA in 1950s-1960s as adult performer
- Recorded on 1969 LP as singer (required adult proficiency)
- Still playing in 1999 at ~69 years old (plausible)
- Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)
- Estimate: ~1930 ± 5 years

DEATH YEAR: Unknown.',
  -- notes_pt
  E'VARIAÇÕES DE NOME:
- "Valdomiro Malvadeza" - grafia comum
- "Waldomiro Malvadeza" - créditos do LP e algumas fontes

DESAMBIGUAÇÃO: Este é DISTINTO de José Martins dos Santos "Malvadeza" (pai de Curió), um violeiro de Santo Amaro. Essa pessoa está importada com apelido = ''Malvadeza'' e sem contexto. Esta entrada usa apelido_context = ''CECA student''.

MESTRE: Mestre Pastinha - treinou no CECA no Pelourinho

CONTEMPORÂNEOS NO CECA:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Gildo Alfinete
- Roberto Satanás (Roberto Pereira)
- Albertino da Hora (também conhecido como "Moreno")
- Gato Preto (José Gabriel Góes)
- Curió (Jaime Martins dos Santos)
- Bola Sete
- Boca Rica

COMPANHEIROS DE BATERIA (conforme Gato Preto 1999):
- João Pequeno, Moreno (Albertino), Gato Preto

GRAVAÇÃO LP 1969:
- Título: "Capoeira Angola - Mestre Pastinha e sua academia"
- Gravadora: Philips (R 765.097 L)
- Local: Teatro Castro Alves, Salvador
- Cantores: Mestre Pastinha, Waldomiro Malvadeza, Roberto Satanás
- Produtor: João Mello
- Notas de capa: Jorge Amado, J.B. Colmenero, Mestre Pastinha
- Bateria: Dois berimbaus, dois pandeiros, agogô, reco-reco

AINDA ATIVO 1999: Jogou capoeira no Cruzeiro, Pelourinho conforme crônica do Portal Capoeira.

NÃO FOI A DAKAR 1966: Não viajou para o Senegal com a delegação de Pastinha.

ESTIMATIVA ANO DE NASCIMENTO (1930, década):
- Ativo no CECA nas décadas de 1950-1960 como performer adulto
- Gravou no LP de 1969 como cantor (requeria proficiência adulta)
- Ainda jogando em 1999 aos ~69 anos (plausível)
- Contemporâneo de Gato Preto (n. 1930), João Grande (n. 1933), Curió (n. 1937)
- Estimativa: ~1930 ± 5 anos

ANO DE MORTE: Desconhecido.'
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

-- Source: statements/persons/albertino-da-hora.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Albertino da Hora
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Albertino da Hora is the SUBJECT.
-- ============================================================

-- Albertino da Hora student_of Pastinha
-- Primary training relationship at CECA (1950s-1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown
  NULL, NULL, -- End date unknown
  '{}'::jsonb,
  'verified'::genealogy.confidence, -- Multiple sources confirm: O Cruzeiro 1963, velhosmestres.com, numerous biographical sources
  'velhosmestres.com/br/pastinha-1963-1; O Cruzeiro May 4, 1963',
  E'Albertino da Hora trained at CECA (Centro Esportivo de Capoeira Angola) in Pelourinho under Mestre Pastinha during the academy''s golden era (1950s-1960s). He appears in the 1963 O Cruzeiro magazine article as one of Pastinha''s musicians and companions, and traveled with Pastinha''s group to Belo Horizonte in 1964.',
  E'Albertino da Hora treinou no CECA (Centro Esportivo de Capoeira Angola) no Pelourinho sob Mestre Pastinha durante a era dourada da academia (décadas de 1950-1960). Ele aparece no artigo da revista O Cruzeiro de 1963 como um dos músicos e comparsas de Pastinha, e viajou com o grupo de Pastinha para Belo Horizonte em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Albertino da Hora' AND s.apelido_context IS NULL
  AND o.apelido = 'Pastinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or
-- relationship direction is inverse - belongs in other file)
-- ============================================================
-- NOTE: These are CONTEMPORARIES, not teacher-student or other
-- directional relationships. The association should be documented
-- in the more prominent person's file:
--
-- João Grande associated_with Albertino da Hora (contemporaries at CECA)
--   → Belongs in joao-grande.sql when created
--
-- João Pequeno associated_with Albertino da Hora (bateria companions)
--   → Belongs in joao-pequeno.sql when created
--
-- Gildo Alfinete associated_with Albertino da Hora (traveled together to BH 1964)
--   → Belongs in gildo-alfinete.sql when created
--
-- Valdomiro associated_with Albertino da Hora (bateria companions)
--   → Belongs in valdomiro.sql when created
--
-- Gato Preto associated_with Albertino da Hora (bateria companions)
--   → Gato Preto already in dataset; relationship could be added there
--
-- Roberto Satanás associated_with Albertino da Hora (traveled together to BH 1964)
--   → Belongs in roberto-satanas.sql when created
-- ============================================================

-- Source: statements/persons/angelica-endiabrada.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Angélica Endiabrada
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Angélica Endiabrada is the SUBJECT.
-- ============================================================

-- Angélica Endiabrada associated_with Maria Doze Homens
-- Connection documented in book chapter "Briga por moqueca"
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
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "rivalry - briga por moqueca documented in Mestres e capoeiras famosos da Bahia (2009)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Pedro Abib, Mestres e capoeiras famosos da Bahia (2009)',
  E'Rival/contemporary of Maria Doze Homens. Their conflict documented in book chapter "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" (Fight over moqueca).',
  E'Rival/contemporânea de Maria Doze Homens. Seu conflito documentado no capítulo do livro "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Angélica Endiabrada' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Angélica Endiabrada associated_with Salomé
-- Contemporaries, both valentonas of 1910s-1920s era
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
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "contemporaries - both valentonas in Salvador"}'::jsonb,
  'likely'::genealogy.confidence,
  'Multiple sources including Espeto Capoeira, Portal Capoeira',
  E'Contemporary valentona alongside Salomé. Both listed among legendary female capoeiristas of early 20th century Bahia.',
  E'Valentona contemporânea de Salomé. Ambas listadas entre as lendárias capoeiristas femininas do início do século XX na Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Angélica Endiabrada' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Angélica Endiabrada associated_with Rosa Palmeirão - needs import first (pending: ?)
-- Angélica Endiabrada associated_with Chicão - needs import first (pending: yes)
-- Angélica Endiabrada associated_with Massú - needs import first (pending: ?)
-- Angélica Endiabrada associated_with Catu - needs import first (pending: ?)
-- Angélica Endiabrada associated_with Almerinda - needs import first
-- Angélica Endiabrada associated_with Menininha - needs import first
-- Angélica Endiabrada associated_with Adelaide Presepeira - needs import first
-- Angélica Endiabrada associated_with Idalina - needs import first

-- Source: statements/persons/boca-rica.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Boca Rica
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Boca Rica is the SUBJECT.
-- ============================================================

-- Boca Rica student_of Pastinha (primary teacher at CECA, 1952 onwards)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, bocarica.wordpress.com, capoeira-connection.com interview',
  'Direct student of Mestre Pastinha at CECA from 1952 until Pastinha''s death in 1981. Boca Rica described Pastinha as "a philosopher" and "my second father." Accompanied Pastinha until his final days and continued to spread his legacy.',
  'Aluno direto de Mestre Pastinha no CECA de 1952 até a morte de Pastinha em 1981. Boca Rica descreveu Pastinha como "um filósofo" e "meu segundo pai." Acompanhou Pastinha até seus últimos dias e continuou a espalhar seu legado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boca Rica' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boca Rica trained_under Waldemar (additional training at barracão)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'bocarica.wordpress.com, velhosmestres.com',
  'Frequented Mestre Waldemar''s famous barracão at Passeio de Aguinelo in Liberdade neighborhood. Learned berimbau rhythms from Waldemar alongside his primary training with Pastinha.',
  'Frequentava o famoso barracão de Mestre Waldemar no Passeio de Aguinelo no bairro da Liberdade. Aprendeu toques de berimbau com Waldemar junto com seu treino principal com Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boca Rica' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boca Rica associated_with Bigodinho (collaborator on recordings and events)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1988-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "musical collaborators"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, discogs.com, capoeirashop.fr',
  'Close musical collaborators. Recorded collaborative CD "Capoeira Angola" together in 2000 (37 songs). Both shared passion for samba-de-roda. Photographed together with other mestres in 1960s. Participated together in 1988 Velha Guarda event.',
  'Colaboradores musicais próximos. Gravaram CD colaborativo "Capoeira Angola" juntos em 2000 (37 cantigas). Ambos compartilhavam paixão pelo samba-de-roda. Fotografados juntos com outros mestres nos anos 1960. Participaram juntos do evento Velha Guarda de 1988.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boca Rica' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Boca Rica founded ECAB (Escola de Capoeira Angola da Bahia) - ECAB not in groups dataset
-- Boca Rica member_of CECA - CECA not in groups dataset
-- Boca Rica member_of ABCA (board member) - ABCA not in groups dataset
-- Boca Rica associated_with Viva Bahia (folkloric group) - Viva Bahia not in groups dataset
-- Boca Rica associated_with João Pequeno (photographed together 1960s) - João Pequeno pending import
-- Boca Rica associated_with Curió (photographed together, Velha Guarda events) - Curió done, can add later
-- Boca Rica associated_with Olavo (photographed together 1960s) - Olavo pending import

-- Source: statements/persons/chicao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Chicão
-- Generated: 2025-12-19
-- ============================================================
-- This file contains all relationships where Chicão is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Chicão associated_with Pedro Porreta (defeated him in 1929, suspected of his murder)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1929-09-28'::date, 'exact'::genealogy.date_precision,
  '1930-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Adversary; Chicão defeated Pedro Porreta on Sept 28, 1929 when he invaded her room; later suspected of his murder"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestres e capoeiras famosos da Bahia (SciELO); Espeto Capoeira; Portal Capoeira; A Tarde newspaper',
  'On September 28, 1929, Pedro Porreta invaded Chicão''s room searching for clothing. Chicão beat him severely, resulting in her detention and him arriving at police station badly injured. Some time later, Porreta was assassinated and Chicão was the main suspect.',
  'Em 28 de setembro de 1929, Pedro Porreta invadiu o quarto de Chicão procurando roupas. Chicão o espancou severamente, resultando na detenção dela e ele chegando muito machucado à delegacia. Algum tempo depois, Porreta foi assassinado e Chicão foi a principal suspeita.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chicão associated_with Salomé (fellow valentona, contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow valentonas of 1920s-1930s Salvador; both documented as legendary female capoeiristas/fighters of the era"}'::jsonb,
  'likely'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  'Both Chicão and Salomé were valentonas active in Salvador during the 1920s-1930s, listed together in historical accounts of famous female capoeiristas/fighters of the era.',
  'Tanto Chicão quanto Salomé eram valentonas ativas em Salvador durante os anos 1920-1930, listadas juntas em relatos históricos de famosas mulheres capoeiristas/lutadoras da época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chicão associated_with Angélica Endiabrada (fellow valentona, contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow valentonas of 1910s-1930s Salvador; both documented as legendary female capoeiristas/fighters of the era"}'::jsonb,
  'likely'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  'Both Chicão and Angélica Endiabrada were valentonas active in Salvador, listed together in historical accounts of famous female capoeiristas/fighters of the era. Angélica was active 1910-1920s, Chicão 1920s-1930s.',
  'Tanto Chicão quanto Angélica Endiabrada eram valentonas ativas em Salvador, listadas juntas em relatos históricos de famosas mulheres capoeiristas/lutadoras da época. Angélica era ativa 1910-1920s, Chicão 1920s-1930s.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Angélica Endiabrada'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chicão associated_with Maria Doze Homens (fellow valentona, contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow valentonas of 1920s-1930s Salvador; both documented as legendary female capoeiristas/fighters of the era"}'::jsonb,
  'likely'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  'Both Chicão and Maria Doze Homens were valentonas active in Salvador during the 1920s-1930s, listed together in historical accounts of famous female capoeiristas/fighters of the era.',
  'Tanto Chicão quanto Maria Doze Homens eram valentonas ativas em Salvador durante os anos 1920-1930, listadas juntas em relatos históricos de famosas mulheres capoeiristas/lutadoras da época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Chicão associated_with Rosa Palmeirão - fellow valentona, needs import first
-- Chicão associated_with Massú - fellow valentona, needs import first
-- Chicão associated_with Catu - fellow valentona, needs import first
-- Chicão associated_with Almerinda - fellow valentona, needs import first
-- Chicão associated_with Menininha - fellow valentona, needs import first

-- Source: statements/persons/curio-velho.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Curió Velho (Pedro Virício)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Curió Velho is the SUBJECT.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Curió Velho family_of Malvadeza (father-son relationship)
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
  '{"relationship_type": "parent"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Pedro Virício (Curió Velho) was the father of José Martins dos Santos (Malvadeza). He taught his son capoeira, continuing the family tradition.',
  E'Pedro Virício (Curió Velho) era o pai de José Martins dos Santos (Malvadeza). Ele ensinou capoeira a seu filho, continuando a tradição familiar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió Velho' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Curió Velho is OBJECT:
-- ============================================================
-- Malvadeza student_of Curió Velho - to add to malvadeza.sql
-- Curió student_of Curió Velho - to add to curio.sql (family training from 1943)

-- Source: statements/persons/curio.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Curió
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Curió is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- Primary teacher: Mestre Pastinha (joined CECA 1968)
-- Family training: Father and grandfather (from 1943)
-- ============================================================

-- Curió student_of Pastinha (joined CECA April 10, 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-04-10'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'On April 10, 1968, Curió formally joined Mestre Pastinha''s CECA (Centro Esportivo de Capoeira Angola) in Pelourinho. He absorbed not only technique but the philosophical foundations of Capoeira Angola. He describes himself as "a faithful custodian of capoeira angola''s immaterial knowledge."',
  E'Em 10 de abril de 1968, Curió ingressou formalmente no CECA (Centro Esportivo de Capoeira Angola) de Mestre Pastinha no Pelourinho. Ele absorveu não apenas técnica, mas os fundamentos filosóficos da Capoeira Angola. Ele se descreve como "um fiel guardião do conhecimento imaterial da capoeira angola."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with Waldemar (1950s roda participation)
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
  '{"association_context": "roda_participation"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió appears in 1954 photographs at Mestre Waldemar''s legendary barracão in Liberdade, captured by French photographer Marcel Gautherot (IMS collection). This places him among the vibrant roda scene of 1950s Salvador.',
  E'Curió aparece em fotografias de 1954 no lendário barracão de Mestre Waldemar na Liberdade, capturadas pelo fotógrafo francês Marcel Gautherot (coleção IMS). Isso o coloca entre a vibrante cena de rodas da Salvador dos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with Cobrinha Verde (1980 seminar, contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-06-04'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "seminar_participants"}'::jsonb, 'verified'::genealogy.confidence,
  'http://velhosmestres.com/en/cobrinha-1980',
  E'Curió participated alongside Cobrinha Verde in Frede Abreu''s First Regional Capoeira Seminar (June 4-8, 1980) in Barris, Salvador. This event helped "rediscover" Cobrinha Verde and reunited the old guard of Capoeira Angola.',
  E'Curió participou ao lado de Cobrinha Verde no Primeiro Seminário Regional de Capoeira de Frede Abreu (4-8 de junho de 1980) em Barris, Salvador. Este evento ajudou a "redescobrir" Cobrinha Verde e reuniu a velha guarda da Capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with João Grande (fellow Pastinha students, 1980 seminar)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow_students_of_Pastinha"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió and João Grande were fellow disciples of Mestre Pastinha at CECA. They participated together in the 1980 First Regional Capoeira Seminar and worked alongside each other in Frede Abreu''s project to bring capoeira into Salvador''s municipal schools.',
  E'Curió e João Grande foram companheiros discípulos de Mestre Pastinha no CECA. Participaram juntos no Primeiro Seminário Regional de Capoeira de 1980 e trabalharam lado a lado no projeto de Frede Abreu para levar a capoeira às escolas municipais de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió associated_with João Pequeno (fellow Pastinha students, 1988 Velha Guarda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow_students_of_Pastinha"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-25',
  E'Curió and João Pequeno were fellow disciples of Mestre Pastinha at CECA. In 1988, they participated together in the Velha Guarda event in Florianópolis with Mestres Bobó, Nó, and Boa Gente. Mestre Pintor was also graduated by João Pequeno while training under Curió during his Bahia period.',
  E'Curió e João Pequeno foram companheiros discípulos de Mestre Pastinha no CECA. Em 1988, participaram juntos no evento Velha Guarda em Florianópolis com os Mestres Bobó, Nó e Boa Gente. Mestre Pintor também foi graduado por João Pequeno enquanto treinava com Curió durante seu período na Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- NOTE: ECAIG (Escola de Capoeira Angola Irmãos Gêmeos) not yet imported
-- Curió founded ECAIG - group not yet imported
-- Curió leads ECAIG - group not yet imported
-- Curió member_of CECA - group not yet imported
-- Curió member_of ABCA (director 2000-2002) - group not yet imported

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Curió family_of Curió Velho (grandchild relationship)
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
  '{"relationship_type": "grandchild"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Mestre Curió is the grandson of Pedro Virício (Curió Velho). He inherited both his apelido "Curió" and his distinctive style of capoeira from his grandfather.',
  E'Mestre Curió é neto de Pedro Virício (Curió Velho). Ele herdou tanto seu apelido "Curió" quanto seu estilo distintivo de capoeira de seu avô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió family_of Malvadeza (child relationship)
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
  '{"relationship_type": "child"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Mestre Curió is the son of José Martins dos Santos (Malvadeza). His father taught him capoeira beginning in 1943, when Curió was six years old.',
  E'Mestre Curió é filho de José Martins dos Santos (Malvadeza). Seu pai lhe ensinou capoeira a partir de 1943, quando Curió tinha seis anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió family_of Pequena (child relationship)
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
  '{"relationship_type": "child"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Mestre Curió is the son of Maria Bispo (Pequena). His mother was also a capoeirista from a family of angoleiros in Santo Amaro. She gave birth to him within a roda de capoeira.',
  E'Mestre Curió é filho de Maria Bispo (Pequena). Sua mãe também era capoeirista de uma família de angoleiros em Santo Amaro. Ela deu à luz a ele dentro de uma roda de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Pequena'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió student_of Curió Velho (grandfather, family training from 1943)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió began learning capoeira from his grandfather Pedro Virício (Curió Velho) and father in 1943, when he was six years old. Locals said "It''s the same game as grandfather!" when watching young Curió play.',
  E'Curió começou a aprender capoeira com seu avô Pedro Virício (Curió Velho) e pai em 1943, quando tinha seis anos. Os locais diziam "É o mesmo jogo do avô!" ao ver o jovem Curió jogar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Curió student_of Malvadeza (father, family training from 1943)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Curió began learning capoeira from his father José Martins dos Santos (Malvadeza) and grandfather in 1943, when he was six years old. His father was also a violeiro who accompanied Mestre Pastinha musically.',
  E'Curió começou a aprender capoeira com seu pai José Martins dos Santos (Malvadeza) e avô em 1943, quando tinha seis anos. Seu pai também era violeiro que acompanhava Mestre Pastinha musicalmente.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Curió associated_with Bobó - 1988 Florianópolis Velha Guarda, needs import
-- Curió associated_with Boca Rica - 1988 Fortaleza Velha Guarda, needs import
-- Curió associated_with Gigante - 1980 seminar participant, needs import
-- Curió founded ECAIG - group not yet imported
-- Curió leads ECAIG - group not yet imported
-- Curió member_of CECA - group not yet imported
-- Curió member_of ABCA - group not yet imported

-- ============================================================
-- NOTE: Relationships where Curió is OBJECT (to be added to other person files):
-- ============================================================
-- Pintor trained_under Curió (Bahia training period) - to add to pintor.sql
-- Mestra Jararaca student_of Curió - Jararaca not yet imported
-- Mestre Augusto Januário student_of Curió - not yet imported
-- Mestre Marcelo Angola student_of Curió (began August 1985) - not yet imported

-- Source: statements/persons/fernando-rodrigues-perez.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Fernando Rodrigues Perez
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Fernando Rodrigues Perez (Perez) is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Perez student_of Bimba
-- Confirmed: Perez trained under Mestre Bimba and represented his academy in 1949
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://nossa-tribo.com/mestre-sinhozinho/; Globo Esportivo April 7, 1949',
  'Fernando Rodrigues Perez trained at Mestre Bimba''s academy and represented it in the 1949 challenge against Sinhozinho''s school. The Globo Esportivo newspaper identified him as "capoeira de Mestre Bimba."',
  'Fernando Rodrigues Perez treinou na academia de Mestre Bimba e a representou no desafio de 1949 contra a escola de Sinhozinho. O jornal Globo Esportivo o identificou como "capoeira de Mestre Bimba."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perez' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perez associated_with Jurandir (Bimba 1949) - fellow Bimba students at 1949 challenge
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-04-07'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow Bimba students selected to represent Capoeira Regional at the 1949 challenge against Sinhozinho''s school"}'::jsonb,
  'verified'::genealogy.confidence,
  'Globo Esportivo April 7, 1949; nossa-tribo.com',
  'Both Perez and Jurandir were selected by Mestre Bimba to represent Capoeira Regional at the April 7, 1949 challenge against Sinhozinho''s school at Estádio Carioca.',
  'Tanto Perez quanto Jurandir foram selecionados por Mestre Bimba para representar a Capoeira Regional no desafio de 7 de abril de 1949 contra a escola de Sinhozinho no Estádio Carioca.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perez' AND s.apelido_context IS NULL
  AND o.apelido = 'Jurandir' AND o.apelido_context = 'Bimba 1949'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perez associated_with Rudolf Hermanny - opponents at 1949 challenge
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-04-07'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Opponents at 1949 Capoeira Challenge; Hermanny (Sinhozinho school) defeated Perez (Bimba school) in 2 minutes"}'::jsonb,
  'verified'::genealogy.confidence,
  'Globo Esportivo April 7, 1949; nossa-tribo.com',
  'Rudolf Hermanny defeated Fernando Rodrigues Perez in approximately 2 minutes at the April 7, 1949 challenge at Estádio Carioca. Perez suffered an arm injury from a kick.',
  'Rudolf Hermanny derrotou Fernando Rodrigues Perez em aproximadamente 2 minutos no desafio de 7 de abril de 1949 no Estádio Carioca. Perez sofreu uma lesão no braço por um chute.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perez' AND s.apelido_context IS NULL
  AND o.apelido = 'Rudolf Hermanny'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/gildo-alfinete.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Gildo Alfinete
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Gildo Alfinete is the SUBJECT.
-- ============================================================

-- Gildo Alfinete student_of Pastinha (1959-1981)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966, https://www.capoeirahub.net/mestres/68ab329ac7f660e1a7e643a2-mestre-gildo-alfinete',
  E'Began training at CECA (Centro Esportivo de Capoeira Angola) at Pelourinho 19 in 1959. Received diploma directly from Pastinha in 1963. Remained close disciple until Pastinha''s death on November 13, 1981. One of Pastinha''s most documented students due to his extensive archive of photographs and notebooks.',
  E'Começou a treinar no CECA (Centro Esportivo de Capoeira Angola) no Pelourinho 19 em 1959. Recebeu diploma diretamente de Pastinha em 1963. Permaneceu discípulo próximo até a morte de Pastinha em 13 de novembro de 1981. Um dos alunos mais documentados de Pastinha devido ao seu extenso arquivo de fotografias e cadernos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete received_title_from Pastinha (diploma 1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "capoeirista diploma"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.capoeirahub.net/mestres/68ab329ac7f660e1a7e643a2-mestre-gildo-alfinete',
  E'Received capoeirista diploma from Mestre Pastinha in 1963 after four years of training at CECA. This diploma placed him among Pastinha''s closest students. Exact date within 1963 not documented.',
  E'Recebeu diploma de capoeirista de Mestre Pastinha em 1963 após quatro anos de treinamento no CECA. Este diploma o colocou entre os alunos mais próximos de Pastinha. Data exata dentro de 1963 não documentada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete associated_with João Grande
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  '2015-10-12'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow CECA students and Dakar 1966 delegation members"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-22',
  E'Fellow students at CECA under Mestre Pastinha. Both were members of the historic 1966 Dakar delegation. Performed capoeira together at the First World Festival of Black Arts. Close personal and professional relationship documented through photographs spanning decades, including visits to João Grande''s academy and home. Relationship ended with Gildo''s death in 2015.',
  E'Colegas de treino no CECA sob Mestre Pastinha. Ambos foram membros da histórica delegação de Dakar 1966. Jogaram capoeira juntos no Primeiro Festival Mundial de Artes Negras. Relacionamento pessoal e profissional próximo documentado através de fotografias abrangendo décadas, incluindo visitas à academia e casa de João Grande. Relacionamento encerrado com a morte de Gildo em 2015.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete associated_with João Pequeno
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1959-01-01'::date, 'year'::genealogy.date_precision,
  '2011-12-09'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow CECA students under Mestre Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://cecab.org.br/palavras-chave/mestre-gildo-alfinete/',
  E'Fellow students at CECA under Mestre Pastinha. Attended João Pequeno''s 90th birthday celebration at Forte da Capoeira in Salvador. Close members of Pastinha''s inner circle. Relationship ended with João Pequeno''s death in December 2011.',
  E'Colegas de treino no CECA sob Mestre Pastinha. Participou da celebração do 90º aniversário de João Pequeno no Forte da Capoeira em Salvador. Membros próximos do círculo interno de Pastinha. Relacionamento encerrado com a morte de João Pequeno em dezembro de 2011.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gildo Alfinete associated_with Gato Preto
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow members of Dakar 1966 delegation"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966',
  E'Fellow members of the 1966 Dakar delegation for the First World Festival of Black Arts. Both played in the bateria during performances. Multiple photographs document them performing together at Morro do Gato, Mercado Modelo, and other locations with different instrumental configurations.',
  E'Membros da delegação de Dakar 1966 para o Primeiro Festival Mundial de Artes Negras. Ambos tocaram na bateria durante as apresentações. Múltiplas fotografias documentam eles se apresentando juntos no Morro do Gato, Mercado Modelo e outros locais com diferentes configurações instrumentais.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gildo Alfinete' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gildo Alfinete associated_with Roberto Satanás - needs import first (Dakar 1966 delegation, 1964 BH trip)
-- Gildo Alfinete associated_with Camafeu de Oxossi - needs import first (Dakar 1966 delegation)
-- Gildo Alfinete associated_with Bola Sete - needs import first (2006 ABCA lecture together)
-- Gildo Alfinete associated_with Genésio Meio-Quilo - needs import (brother, compiled 2020 book)

-- Source: statements/persons/idalina.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Idalina
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Idalina is the SUBJECT.
-- ============================================================

-- Idalina associated_with Angélica Endiabrada (contemporaries)
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
  '1920-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of 1910s-1920s Salvador; both documented in newspaper and police records for capoeiragem", "pt": "Valentonas contemporâneas de Salvador dos anos 1910-1920; ambas documentadas em jornais e registros policiais por capoeiragem"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019); Jornal de Notícias archives',
  E'Both were legendary valentonas of the Distrito da Sé in Salvador during the 1910s-1920s; documented in newspaper headlines and police records for capoeiragem',
  E'Ambas eram lendárias valentonas do Distrito da Sé em Salvador durante os anos 1910-1920; documentadas nas manchetes de jornais e registros policiais por capoeiragem'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Angélica Endiabrada'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Salomé (contemporaries)
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
  '1930-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; part of the same generation of incorrigible women", "pt": "Valentonas contemporâneas de Salvador do início do século XX; parte da mesma geração de mulheres incorrigíveis"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019); Pedro Abib research',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Maria Doze Homens (contemporaries)
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
  '1930-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both part of legendary generation of female capoeiristas", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas parte da geração lendária de capoeiristas femininas"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019); Pedro Abib research',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia; Maria Doze Homens was mentor to Salomé',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia; Maria Doze Homens foi mentora de Salomé'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Rosa Palmeirão (contemporaries)
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
  '1930-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both documented in police and newspaper records", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas documentadas em registros policiais e de jornais"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019); Pedro Abib research',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Rosa Palmeirão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Chicão (contemporaries)
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
  '1929-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both documented in police and newspaper records", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas documentadas em registros policiais e de jornais"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019)',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia; Chicão killed Pedro Porreta in 1929',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia; Chicão matou Pedro Porreta em 1929'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Chicão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Idalina associated_with Zeferina - Documented rival; multiple conflicts 1917-1920
--   Source: Jornal de Notícias (1917, April 24, 1920)
--   "encontraram-se as desafetas e foram ao duelo a murro e pontapé"
--   Fought over prostitution territory; both charged with capoeiragem
--   NEEDS IMPORT: Zeferina
--
-- Idalina associated_with Firmina - Companion Idalina defended in 1917 incident
--   NEEDS IMPORT: Firmina (unclear if capoeirista - may be associate only)
--
-- Idalina associated_with Massú - Contemporary legendary female capoeirista
--   NEEDS IMPORT: Massú
--
-- Idalina associated_with Catu - Contemporary legendary female capoeirista
--   NEEDS IMPORT: Catu
--
-- Idalina associated_with Almerinda - Contemporary documented in Pedro Abib's research
--   NEEDS IMPORT: Almerinda
--
-- Idalina associated_with Menininha - Contemporary documented in Pedro Abib's research
--   NEEDS IMPORT: Menininha
--
-- Idalina associated_with Adelaide Presepeira - Contemporary 1920s-1930s
--   NEEDS IMPORT: Adelaide Presepeira
--
-- NOTE ON MESTRE BIMBA CONNECTION:
-- Mestre Bimba named a toque "Idalina" after her, indicating her legendary status
-- was known in the capoeira community. However, no direct training relationship
-- is documented - this is a cultural/commemorative connection, not a lineage relationship.

-- Source: statements/persons/juvenil.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Juvenil
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Juvenil is the SUBJECT.
-- ============================================================

-- Juvenil associated_with Leopoldina
-- Context: Street encounter ~1951-1952 on Morro da Favela; Leopoldina
-- recounted this incident in his testimony to Nestor Capoeira (2005 documentary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1951-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Street encounter on Morro da Favela where Juvenil sparred with young Leopoldina; Quinzinho intervened when Juvenil''s meia-lua grazed Leopoldina''s head"}'::jsonb,
  'verified'::genealogy.confidence,
  'Leopoldina testimony in documentary "Mestre Leopoldina, a Fina Flor da Malandragem" (2005)',
  'Single documented encounter; Leopoldina recounted this incident to Nestor Capoeira for the 2005 documentary',
  'Único encontro documentado; Leopoldina relatou este incidente a Nestor Capoeira para o documentário de 2005'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Juvenil' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Source: statements/persons/malvadeza.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Malvadeza (José Martins dos Santos)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Malvadeza is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Malvadeza student_of Curió Velho (learned from father)
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
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'José Martins dos Santos (Malvadeza) learned capoeira from his father Pedro Virício (Curió Velho), continuing the family tradition of Capoeira Angola in Santo Amaro.',
  E'José Martins dos Santos (Malvadeza) aprendeu capoeira com seu pai Pedro Virício (Curió Velho), continuando a tradição familiar de Capoeira Angola em Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Malvadeza family_of Curió Velho (child-parent relationship)
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
  '{"relationship_type": "child"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'José Martins dos Santos (Malvadeza) was the son of Pedro Virício (Curió Velho).',
  E'José Martins dos Santos (Malvadeza) era filho de Pedro Virício (Curió Velho).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Curió Velho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Malvadeza family_of Pequena (spouse relationship)
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
  '{"relationship_type": "spouse"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'José Martins dos Santos (Malvadeza) was married to Maria Bispo (Pequena). Both were capoeiristas from Santo Amaro.',
  E'José Martins dos Santos (Malvadeza) era casado com Maria Bispo (Pequena). Ambos eram capoeiristas de Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Pequena'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS
-- ============================================================

-- Malvadeza associated_with Pastinha (friend and violeiro)
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
  '{"association_context": "friend_and_musician"}'::jsonb, 'verified'::genealogy.confidence,
  'https://tribunademinas.com.br/noticias/cultura/14-07-2019/abracem-nossa-historia-e-nos-respeitem-pede-mestre-curio.html',
  E'José Martins dos Santos (Malvadeza) was a close friend of Mestre Pastinha and served as his violeiro (seven-string guitar player), accompanying him musically.',
  E'José Martins dos Santos (Malvadeza) era amigo próximo de Mestre Pastinha e servia como seu violeiro, acompanhando-o musicalmente.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Malvadeza associated_with Besouro Mangangá (second cousin)
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
  '{"relationship_type": "segundo primo"}'::jsonb, 'verified'::genealogy.confidence,
  'https://tribunademinas.com.br/noticias/cultura/14-07-2019/abracem-nossa-historia-e-nos-respeitem-pede-mestre-curio.html',
  E'Besouro Mangangá was the "primo segundo" (second cousin) of José Martins dos Santos (Malvadeza), as stated by Mestre Curió: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro... que era primo segundo do meu pai."',
  E'Besouro Mangangá era "primo segundo" de José Martins dos Santos (Malvadeza), conforme declarado por Mestre Curió: "Tenho uma ''parenteza'' também com o finado Besouro de Santo Amaro... que era primo segundo do meu pai."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Malvadeza' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Malvadeza is OBJECT:
-- ============================================================
-- Curió student_of Malvadeza - to add to curio.sql (family training from 1943)
-- Curió family_of Malvadeza - to add to curio.sql (parent relationship)
-- Curió Velho family_of Malvadeza - in curio-velho.sql (parent relationship)

-- Source: statements/persons/maria-dos-anjos.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Maria dos Anjos
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Maria dos Anjos is the SUBJECT.
-- ============================================================

-- Maria dos Anjos student_of Doze Homens
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Atenilo testimony in "Atenilo, o relâmpago da Capoeira Regional" (1988) by Mestre Itapoan; Gratidão Capoeira article',
  'Maria dos Anjos and Salomé were both students of Doze Homens according to Mestre Atenilo. Both women were known for their love of batuque and samba.',
  'Maria dos Anjos e Salomé foram ambas alunas de Doze Homens segundo Mestre Atenilo. Ambas as mulheres eram conhecidas por seu amor pelo batuque e samba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maria dos Anjos' AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Maria dos Anjos associated_with Salomé (fellow students)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow students of Doze Homens; contemporary valentonas of 1920s-1930s Salvador; shared love of batuque and samba"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Atenilo testimony in "Atenilo, o relâmpago da Capoeira Regional" (1988) by Mestre Itapoan',
  'Companions who trained together under Doze Homens. Mestre Atenilo knew them both personally and described them as "mulheres de valor" (women of character).',
  'Companheiras que treinaram juntas com Doze Homens. Mestre Atenilo as conheceu pessoalmente e as descreveu como "mulheres de valor."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maria dos Anjos' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or unclear)
-- ============================================================
-- Maria dos Anjos associated_with Maria Doze Homens - Both were contemporary valentonas in 1920s-1930s Salvador
--   (Maria Doze Homens exists in dataset but relationship is contextual/contemporary, not direct training/mentorship)

-- Source: statements/persons/maria-izabel.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Maria Izabel
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Maria Izabel is the SUBJECT.
-- ============================================================
-- NOTE: Maria Izabel has no documented relationships to specific
-- individuals. She is known only from a single newspaper record
-- (Gazeta do Povo, Dec 2, 1914). Her profile serves as a memorial
-- to the hundreds of anonymous women documented by Paula Juliana
-- Foltran's research.
-- ============================================================

-- No statements to generate - only one archival trace exists.
-- She was contemporary with other valentonas of the 1910s-1920s
-- but no specific connections are documented.

-- ============================================================
-- POTENTIAL RELATIONSHIPS (unverifiable)
-- ============================================================
-- Maria Izabel was arrested in 1914, the same era as:
-- - Angélica Endiabrada (active 1910-1920)
-- - Salomé (active 1920s-1930s)
-- - Maria Doze Homens
-- - Chicão, Rosa Palmeirão, Massú, Catu, etc.
--
-- However, without documented connection, no statements are created.
-- Her value is as a representative figure, not for specific lineage.

-- Source: statements/persons/pequena.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Pequena (Maria Bispo)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Pequena is the SUBJECT.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Pequena family_of Malvadeza (spouse relationship)
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
  '{"relationship_type": "spouse"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Maria Bispo (Pequena) was married to José Martins dos Santos (Malvadeza). Both were capoeiristas, and Maria came from a family of angoleiros in Santo Amaro.',
  E'Maria Bispo (Pequena) era casada com José Martins dos Santos (Malvadeza). Ambos eram capoeiristas, e Maria veio de uma família de angoleiros em Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pequena' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Pequena is OBJECT:
-- ============================================================
-- Curió family_of Pequena - to add to curio.sql (parent relationship)
-- Malvadeza family_of Pequena - in malvadeza.sql (spouse relationship)

-- Source: statements/persons/piroca.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Piroca
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Piroca is the SUBJECT.
-- ============================================================

-- Piroca family_of Pedro Porreta (brother relationship)
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
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde (Dec 14, 1920); Mestres e capoeiras famosos da Bahia (SciELO)',
  'Brothers who controlled Baixa dos Sapateiros together; known as "Os donos do quarteirão" (The owners of the block)',
  'Irmãos que controlavam a Baixa dos Sapateiros juntos; conhecidos como "Os donos do quarteirão"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Piroca' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Piroca associated_with Pedro Porreta (street confrontation companions)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-12-14'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Participated together in attack on Guruxinha in Taboão"}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde (Dec 14, 1920); velhosmestres.com',
  'Piroca assisted brother Pedro Porreta in razor attack on Guruxinha (José Batista da Cruz) on December 14, 1920; victim died from injuries',
  'Piroca auxiliou o irmão Pedro Porreta em ataque com navalha a Guruxinha (José Batista da Cruz) em 14 de dezembro de 1920; vítima morreu dos ferimentos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Piroca' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified - Guruxinha (victim) is not a capoeirista to import

-- Source: statements/persons/rosa-palmeirao.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Rosa Palmeirão
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Rosa Palmeirão is the SUBJECT.
-- ============================================================

-- Rosa Palmeirão associated_with Pedro Mineiro (defeated him)
-- NOTE: Pedro Mineiro is in the persons-backlog with status 'pending'
-- This statement will be activated once Pedro Mineiro is imported
/*
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, 'unknown'::genealogy.date_precision,
  '1915-01-18'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Rosa Palmeirão defeated Pedro Mineiro in combat, ending his reputation as a valente"}'::jsonb,
  'likely'::genealogy.confidence,
  'A TARDE newspaper; Paula Juliana Foltran thesis',
  E'Rosa Palmeirão defeated Pedro Mineiro before his death on January 18, 1915, in a fight that ended his reputation as Salvador''s most feared valentão.',
  E'Rosa Palmeirão derrotou Pedro Mineiro antes de sua morte em 18 de janeiro de 1915, em uma luta que acabou com sua fama de valentão mais temido de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rosa Palmeirão' AND o.apelido = 'Pedro Mineiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
*/

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rosa Palmeirão associated_with Pedro Mineiro - Pedro Mineiro in backlog (pending)
-- Note: Pedro Mineiro exists in persons-backlog.md from Antônio Corró import
-- Once imported, uncomment the statement above

-- Source: statements/persons/valdomiro-malvadeza.sql (NEW)
-- ============================================================
-- STATEMENTS FOR: Valdomiro Malvadeza (CECA student)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Valdomiro Malvadeza is the SUBJECT.
-- Uses apelido = 'Valdomiro Malvadeza' AND apelido_context = 'CECA student'
-- to distinguish from José Martins "Malvadeza" (Curió's father).
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Valdomiro Malvadeza student_of Pastinha (trained at CECA)
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/pastinha-1969-1',
  E'Valdomiro Malvadeza trained under Mestre Pastinha at CECA (Centro Esportivo de Capoeira Angola) in Salvador. He was part of the core group who formed the bateria at Pastinha''s rodas and recorded on the 1969 LP.',
  E'Valdomiro Malvadeza treinou sob Mestre Pastinha no CECA (Centro Esportivo de Capoeira Angola) em Salvador. Ele fazia parte do grupo principal que formava a bateria nas rodas de Pastinha e gravou no LP de 1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP MEMBERSHIPS
-- ============================================================

-- Valdomiro Malvadeza member_of CECA
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro was a member of CECA (Centro Esportivo de Capoeira Angola) in Salvador, serving as part of the bateria. Mestre Gato Preto confirmed: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."',
  E'Valdomiro era membro do CECA (Centro Esportivo de Capoeira Angola) em Salvador, servindo como parte da bateria. Mestre Gato Preto confirmou: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND g.name = 'CECA'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS
-- ============================================================

-- Valdomiro Malvadeza associated_with João Pequeno (bateria companions)
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
  '{"association_context": "bateria_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro and João Pequeno played together in the bateria at Mestre Pastinha''s rodas at CECA. Per Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."',
  E'Valdomiro e João Pequeno tocavam juntos na bateria nas rodas de Mestre Pastinha no CECA. Conforme Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdomiro Malvadeza associated_with Gato Preto (bateria companions)
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
  '{"association_context": "bateria_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro and Gato Preto played together in the bateria at Mestre Pastinha''s rodas at CECA. Per Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."',
  E'Valdomiro e Gato Preto tocavam juntos na bateria nas rodas de Mestre Pastinha no CECA. Conforme Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdomiro Malvadeza associated_with Albertino da Hora (bateria companions)
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
  '{"association_context": "bateria_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro and Albertino da Hora (also known as "Moreno") played together in the bateria at Mestre Pastinha''s rodas at CECA. Per Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."',
  E'Valdomiro e Albertino da Hora (também conhecido como "Moreno") tocavam juntos na bateria nas rodas de Mestre Pastinha no CECA. Conforme Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'Albertino da Hora'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Valdomiro associated_with Roberto Satanás - 1969 LP recording (Roberto Satanás pending import)
-- Valdomiro associated_with Raimundo Pequeno/Natividade - 1969 LP recording (pending import)

-- Source: statements/persons/pintor.sql (CHANGED)
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

-- Pintor trained_under Curió (Bahia training period)
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
  E'As a teenager, Pintor traveled to Bahia and trained under Curió among other mestres. Curió was a disciple of Mestre Pastinha, guardian of the Angola tradition.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Curió entre outros mestres. Curió era discípulo de Mestre Pastinha, guardião da tradição Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Curió'
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
-- Pintor trained_under Boa Gente - not yet imported
-- Pintor trained_under Bom Cabrito (Mário Bom Cabrito) - not yet imported
-- Pintor trained_under Medicina - not yet imported
-- Pintor trained_under Papo de Santo Amaro - not yet imported
-- Pintor founded Grupo Bantus Capoeira - group not yet imported

COMMIT;
