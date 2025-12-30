-- ============================================================
-- GENEALOGY PERSON: Nagé (Pedrito victim)
-- Generated: 2025-12-17
-- ============================================================
-- LAYER ZERO HISTORICAL FIGURE
-- Very limited documentation - known only through Onça Preta's
-- 1972 testimony (O Dia newspaper / velhosmestres.com)
-- ============================================================
-- CRITICAL IDENTITY NOTE:
-- This is a DISTINCT person from Mestre Nagé (José Anastácio de
-- Santana, ~1923-1958), who was born AFTER the Pedrito persecution
-- ended. Mestre Nagé was photographed by Pierre Verger (1948),
-- appeared in 1954 film "Vadiação", and was subject of Frede
-- Abreu's 2017 book. Using apelido_context to distinguish.
-- ============================================================
-- DEATH YEAR ESTIMATION:
-- Killed during Pedrito persecution. Pedrito (Pedro de Azevedo
-- Gordilho) was chief of police from 1920 until his power was
-- curtailed by Governor Juracy Magalhães in the early 1930s.
-- Most persecution deaths occurred 1920-1925. Using 1925 as
-- approximate death year with 'decade' precision.
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- If killed as an active capoeirista in 1920s, likely born
-- 1870-1900. Using 1890 with 'decade' precision as midpoint
-- estimate for an adult capoeirista killed circa 1920-1925.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Nagé',
  'Pedrito victim',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-34', 'https://velhosmestres.com/br/destaques-34']::text[],
  NULL,
  NULL,
  NULL,
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1925,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  E'Nagé was a capoeirista in early 20th century Salvador who was killed during the brutal persecution led by Police Chief Pedro de Azevedo Gordilho, known as "Pedrito". This persecution, which began in 1920 when Pedrito assumed command of the Bahian police cavalry, represented one of the darkest periods in capoeira history.\n\nNote: This individual is DISTINCT from Mestre Nagé (José Anastácio de Santana, ~1923-1958), who was born after the Pedrito persecution ended and became a notable figure photographed by Pierre Verger and documented in Frede Abreu''s 2017 book "Nagé, o homem que lutou capoeira até morrer". The sharing of apelidos was common in capoeira.\n\nMestre Onça Preta, who witnessed this era as a boy, recalled this Nagé among the fallen in a 1972 O Dia newspaper interview: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino and many others". According to Onça Preta, Pedrito''s cavalry squad "conducted a real massacre among the old capoeira masters, not in open combat. Generally he assassinated them after capture, with the body appearing days later thrown in the woods, the back opened by knife cuts".\n\nNo further biographical details about this Nagé survive beyond this single reference in Onça Preta''s testimony, making him one of the many anonymous victims of state violence against Afro-Brazilian culture and resistance.',
  E'Nagé foi um capoeirista do início do século XX em Salvador que foi morto durante a perseguição brutal liderada pelo Chefe de Polícia Pedro de Azevedo Gordilho, conhecido como "Pedrito". Esta perseguição, que começou em 1920 quando Pedrito assumiu o comando da cavalaria da polícia baiana, representou um dos períodos mais sombrios da história da capoeira.\n\nNota: Este indivíduo é DISTINTO de Mestre Nagé (José Anastácio de Santana, ~1923-1958), que nasceu após o fim da perseguição de Pedrito e tornou-se uma figura notável fotografada por Pierre Verger e documentada no livro de Frede Abreu de 2017 "Nagé, o homem que lutou capoeira até morrer". O compartilhamento de apelidos era comum na capoeira.\n\nMestre Onça Preta, que testemunhou essa era quando menino, recordou este Nagé entre os que tombaram em uma entrevista ao jornal O Dia em 1972: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros". Segundo Onça Preta, o esquadrão de cavalaria de Pedrito "empreendeu verdadeiro massacre entre os velhos mestres do jogo, não em combate aberto. Em geral os assassinava após a captura, aparecendo o corpo dias depois atirado ao mato, as costas abertas de facadas".\n\nNenhum outro detalhe biográfico sobre este Nagé sobrevive além desta única referência no testemunho de Onça Preta, tornando-o uma das muitas vítimas anônimas da violência estatal contra a cultura e resistência afro-brasileira.',
  NULL,
  NULL,
  E'LAYER ZERO FIGURE - MINIMAL DOCUMENTATION

CRITICAL IDENTITY DISTINCTION:
This is a DISTINCT person from Mestre Nagé (José Anastácio de Santana, ~1923-1958). That Nagé:
- Born ~1923 in Coqueiros de Paraguaçu (AFTER Pedrito persecution)
- Died 1958 (stabbed in fight over berimbau)
- Photographed by Pierre Verger (1948) and Marcel Gautherot (1954)
- Appeared in 1954 film "Vadiação"
- Subject of Frede Abreu''s 2017 book "Nagé, o homem que lutou capoeira até morrer"
Using apelido_context "Pedrito victim" to distinguish.

DEATH YEAR ESTIMATION (1925, decade):
Killed during Pedrito persecution. Pedro de Azevedo Gordilho was police chief from 1920 until curtailed by Governor Juracy Magalhães in early 1930s. Most persecution deaths 1920-1925.

BIRTH YEAR ESTIMATION (1890, decade):
If killed as active adult capoeirista in 1920s (age 25-45), birth range 1875-1900. Using 1890 as midpoint.

SOLE SOURCE:
Onça Preta testimony (1972 O Dia newspaper, reproduced at velhosmestres.com). Named among "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" who were killed.

NO RELATIONSHIPS DOCUMENTED:
No teachers, students, or group affiliations documented. Only known through Onça Preta''s recollection of victims of Pedrito persecution.

PENDING RELATIONSHIPS:
- associated_with Mãozinha (contemporary, fellow victim)
- associated_with Besourinho (contemporary, fellow victim)
- associated_with Finado Manteiga (contemporary, fellow victim)
- associated_with Gasolinha (contemporary, fellow victim)',
  E'FIGURA LAYER ZERO - DOCUMENTAÇÃO MÍNIMA

DISTINÇÃO CRÍTICA DE IDENTIDADE:
Esta é uma pessoa DISTINTA de Mestre Nagé (José Anastácio de Santana, ~1923-1958). Aquele Nagé:
- Nascido ~1923 em Coqueiros de Paraguaçu (APÓS a perseguição de Pedrito)
- Morreu em 1958 (esfaqueado em briga por berimbau)
- Fotografado por Pierre Verger (1948) e Marcel Gautherot (1954)
- Apareceu no filme "Vadiação" de 1954
- Tema do livro de Frede Abreu de 2017 "Nagé, o homem que lutou capoeira até morrer"
Usando apelido_context "Pedrito victim" para distinguir.

ESTIMATIVA ANO DE MORTE (1925, década):
Morto durante perseguição de Pedrito. Pedro de Azevedo Gordilho foi chefe de polícia de 1920 até ser contido pelo Governador Juracy Magalhães no início dos anos 1930. Maioria das mortes por perseguição 1920-1925.

ESTIMATIVA ANO DE NASCIMENTO (1890, década):
Se morto como capoeirista adulto ativo nos anos 1920 (idade 25-45), faixa de nascimento 1875-1900. Usando 1890 como ponto médio.

FONTE ÚNICA:
Testemunho de Onça Preta (jornal O Dia 1972, reproduzido em velhosmestres.com). Citado entre "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino e muitos outros" que foram mortos.

SEM RELACIONAMENTOS DOCUMENTADOS:
Nenhum mestre, aluno ou afiliação a grupo documentado. Conhecido apenas através da recordação de Onça Preta das vítimas da perseguição de Pedrito.

RELACIONAMENTOS PENDENTES:
- associated_with Mãozinha (contemporâneo, companheiro de vítima)
- associated_with Besourinho (contemporâneo, companheiro de vítima)
- associated_with Finado Manteiga (contemporâneo, companheiro de vítima)
- associated_with Gasolinha (contemporâneo, companheiro de vítima)'
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
