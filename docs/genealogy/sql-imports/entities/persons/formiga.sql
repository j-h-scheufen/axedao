-- ============================================================
-- GENEALOGY PERSON: Formiga
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1960, decade precision):
-- - Graduated alongside brother Nenel in June 1967
-- - Nenel was born September 26, 1960, making him 6-7 at graduation
-- - Both described as "adolescentes" (teenagers) in 1974 at Bimba's funeral
-- - If Formiga was similar age to graduate together, born ~1960
-- - Different mothers (Nenel: Berenice; Formiga: Dona Nair), so not twins
-- Using 1960 with decade precision as reasonable estimate
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
  'Demerval dos Santos Machado',
  'Formiga',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/cidadania/os-herdeiros-de-mestre-bimba/', 'https://fundacaomestrebimba.org.br/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Authentic Capoeira Regional as taught by his father Mestre Bimba. One of only three of Bimba''s thirteen children to reach the highest level of mestre in Capoeira Regional.',
  E'Capoeira Regional autêntica conforme ensinada por seu pai Mestre Bimba. Um dos únicos três dos treze filhos de Bimba a alcançar o nível máximo de mestre na Capoeira Regional.',
  -- Life dates
  1960,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  2003,
  'year'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Demerval dos Santos Machado, known as Mestre Formiga ("The Ant"), was a son of Mestre Bimba, the legendary creator of Capoeira Regional, and Dona Nair. He was one of only three of Bimba''s thirteen children (seven sons and six daughters) to reach the highest level of mestre in Capoeira Regional—the others being his half-brother Mestre Nenel and their brother Mestre Luís.

As a child, Formiga trained at his father''s Centro de Cultura Física Regional in Salvador. In June 1967, he formally graduated alongside his half-brother Nenel, both receiving their formation from their father''s hands. Mestre Bimba famously required that all students prove they were either working or show their school report cards before training—a discipline that Formiga later recalled: "Para treinar com meu pai era preciso provar que estava trabalhando ou mostrar o boletim do colégio" ("To train with my father, you had to prove you were working or show your school report card").

In 1973, the Machado family relocated to Goiânia, Goiás, following false promises of opportunity from a former student. When Bimba''s health began to decline, the teenage Formiga and Nenel stepped up to continue their father''s classes in his place. On February 5, 1974, Mestre Bimba died from a stroke at the Hospital das Clínicas de Goiânia. At the funeral, the adolescent brothers Formiga and Nenel played capoeira as a final tribute to their father—a powerful moment that marked their transition from students to guardians of his legacy.

Beyond his skill as a capoeirista, Formiga worked as an electrician (eletricitário) and was active as a union organizer (sindicalista). He was a notable figure in discussions about capoeira, politically engaged, and brought a working-class perspective to the preservation of his father''s art.

Formiga was instrumental in establishing the Fundação Mestre Bimba (FUMEB), serving as one of its founding mentors alongside his brother Nenel. He represented the family at official ceremonies honoring his father, including when Bimba received the Tomé de Souza Medal from the Salvador City Council. On June 12, 1996, when the Federal University of Bahia posthumously awarded Bimba the title of Doutor Honoris Causa, Formiga co-wrote the speech with capoeira researcher Frede Abreu and represented the family at the ceremony.

Reflecting on his father''s final years in Goiânia, Formiga famously stated: "Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada"—"My father died of banzo (sadness), for not seeing capoeira respected". Banzo is a term of African origin describing a profound homesickness and despair, particularly associated with enslaved Africans. His use of this word captured both the depth of Bimba''s suffering and the historical memory that runs through capoeira.

Mestre Formiga passed away in 2003, leaving behind a legacy as one of the direct links to Mestre Bimba''s authentic Capoeira Regional methodology.',
  -- bio_pt
  E'Demerval dos Santos Machado, conhecido como Mestre Formiga, foi filho de Mestre Bimba, o lendário criador da Capoeira Regional, e Dona Nair. Ele foi um dos únicos três dos treze filhos de Bimba (sete homens e seis mulheres) a alcançar o nível máximo de mestre na Capoeira Regional—os outros sendo seu meio-irmão Mestre Nenel e seu irmão Mestre Luís.

Quando criança, Formiga treinava no Centro de Cultura Física Regional de seu pai em Salvador. Em junho de 1967, formou-se formalmente junto com seu meio-irmão Nenel, ambos recebendo sua formação das mãos de seu pai. Mestre Bimba exigia famosamente que todos os alunos provassem que estavam trabalhando ou mostrassem seus boletins escolares antes de treinar—uma disciplina que Formiga mais tarde recordou: "Para treinar com meu pai era preciso provar que estava trabalhando ou mostrar o boletim do colégio".

Em 1973, a família Machado mudou-se para Goiânia, Goiás, seguindo falsas promessas de oportunidade de um ex-aluno. Quando a saúde de Bimba começou a declinar, os adolescentes Formiga e Nenel assumiram para continuar as aulas de seu pai em seu lugar. Em 5 de fevereiro de 1974, Mestre Bimba morreu de um AVC no Hospital das Clínicas de Goiânia. No funeral, os irmãos adolescentes Formiga e Nenel jogaram capoeira como uma homenagem final ao pai—um momento marcante que marcou sua transição de alunos para guardiões de seu legado.

Além de sua habilidade como capoeirista, Formiga trabalhava como eletricitário e era ativo como sindicalista. Era uma personagem marcante nas discussões sobre a capoeira, politizado, e trazia uma perspectiva de classe trabalhadora para a preservação da arte de seu pai.

Formiga foi fundamental na criação da Fundação Mestre Bimba (FUMEB), servindo como um de seus mentores fundadores ao lado de seu irmão Nenel. Representou a família em cerimônias oficiais de homenagem a seu pai, incluindo quando Bimba recebeu a Medalha Tomé de Souza da Câmara Municipal de Salvador. Em 12 de junho de 1996, quando a Universidade Federal da Bahia postumamente concedeu a Bimba o título de Doutor Honoris Causa, Formiga escreveu o discurso em conjunto com o pesquisador de capoeira Frede Abreu e representou a família na cerimônia.

Refletindo sobre os últimos anos de seu pai em Goiânia, Formiga declarou famosamente: "Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada". Banzo é um termo de origem africana que descreve uma profunda saudade e desespero, particularmente associado aos africanos escravizados. Seu uso desta palavra capturou tanto a profundidade do sofrimento de Bimba quanto a memória histórica que percorre a capoeira.

Mestre Formiga faleceu em 2003, deixando um legado como um dos elos diretos com a metodologia autêntica da Capoeira Regional de Mestre Bimba.',
  -- achievements_en
  E'One of only three of Mestre Bimba''s thirteen children to reach mestre level in Capoeira Regional; Co-founder/mentor of Fundação Mestre Bimba (FUMEB) with brother Nenel; Co-wrote UFBA Honoris Causa ceremony speech with Frede Abreu (1996); Represented family at ceremonies for Tomé de Souza Medal and UFBA Honoris Causa; Continued Bimba''s teaching in Goiânia alongside Nenel after their father''s health declined (1973-1974); Played capoeira at Bimba''s funeral as tribute (1974)',
  -- achievements_pt
  E'Um dos únicos três dos treze filhos de Mestre Bimba a alcançar o nível de mestre na Capoeira Regional; Cofundador/mentor da Fundação Mestre Bimba (FUMEB) com o irmão Nenel; Coescreveu o discurso da cerimônia de Honoris Causa da UFBA com Frede Abreu (1996); Representou a família nas cerimônias da Medalha Tomé de Souza e Honoris Causa da UFBA; Continuou os ensinamentos de Bimba em Goiânia junto com Nenel após declínio da saúde do pai (1973-1974); Jogou capoeira no funeral de Bimba como homenagem (1974)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1960, decade precision):
- Graduated alongside half-brother Nenel in June 1967
- Nenel was born September 26, 1960, making him 6-7 years old at graduation
- Both described as "adolescentes" (teenagers) at Bimba''s funeral in February 1974
- At age 13, both attempted to continue their father''s work in Goiânia
- Different mothers (Nenel: Berenice da Conceição Nascimento; Formiga: Dona Nair)
- Using 1960 as estimate with decade precision

DEATH YEAR (2003, year precision):
- Multiple sources confirm death in 2003; no exact date found

FAMILY:
- Father: Mestre Bimba (Manoel dos Reis Machado)
- Mother: Dona Nair
- Half-brother: Mestre Nenel (Manoel Nascimento Machado) - different mother (Berenice)
- Brother: Mestre Luís (Luiz Lopes Machado, also called "Melodia") - same mother (Dona Nair); moved to Goiânia

THREE MESTRE CHILDREN OF BIMBA (of 13 total):
1. Mestre Nenel (Manoel Nascimento Machado)
2. Mestre Formiga (Demerval dos Santos Machado) - in memoriam
3. Mestre Luís (Luiz Lopes Machado / Melodia)

OCCUPATION:
- Eletricitário (electrician)
- Sindicalista (union activist/organizer)
- Capoeirista/Mestre de capoeira

GRADUATION: June 1967 at Centro de Cultura Física Regional, Salvador

TEACHING IN GOIÂNIA: 1973-1974, alongside Nenel, when Bimba''s health declined

BIMBA''S FUNERAL (February 5, 1974):
- Formiga and Nenel, both adolescents, played capoeira at the burial
- Cemitério Parque de Goiânia

FUMEB (Fundação Mestre Bimba):
- Co-founder/mentor alongside Nenel
- Frede Abreu created Projeto Capoerê under FUMEB (1994)

UFBA HONORIS CAUSA (June 12, 1996):
- Co-wrote speech with researcher Frede Abreu
- Represented family at ceremony

FAMOUS QUOTE:
"Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada"
("My father died of banzo (sadness), for not seeing capoeira respected")',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1960, precisão de década):
- Formou-se junto com o meio-irmão Nenel em junho de 1967
- Nenel nasceu em 26 de setembro de 1960, tendo 6-7 anos na formatura
- Ambos descritos como "adolescentes" no funeral de Bimba em fevereiro de 1974
- Aos 13 anos, ambos tentaram continuar o trabalho do pai em Goiânia
- Mães diferentes (Nenel: Berenice da Conceição Nascimento; Formiga: Dona Nair)
- Usando 1960 como estimativa com precisão de década

ANO DE MORTE (2003, precisão de ano):
- Múltiplas fontes confirmam morte em 2003; data exata não encontrada

FAMÍLIA:
- Pai: Mestre Bimba (Manoel dos Reis Machado)
- Mãe: Dona Nair
- Meio-irmão: Mestre Nenel (Manoel Nascimento Machado) - mãe diferente (Berenice)
- Irmão: Mestre Luís (Luiz Lopes Machado, também chamado "Melodia") - mesma mãe (Dona Nair); mudou-se para Goiânia

TRÊS FILHOS MESTRES DE BIMBA (de 13 no total):
1. Mestre Nenel (Manoel Nascimento Machado)
2. Mestre Formiga (Demerval dos Santos Machado) - in memoriam
3. Mestre Luís (Luiz Lopes Machado / Melodia)

OCUPAÇÃO:
- Eletricitário
- Sindicalista
- Capoeirista/Mestre de capoeira

FORMATURA: Junho de 1967 no Centro de Cultura Física Regional, Salvador

ENSINO EM GOIÂNIA: 1973-1974, junto com Nenel, quando a saúde de Bimba declinou

FUNERAL DE BIMBA (5 de fevereiro de 1974):
- Formiga e Nenel, ambos adolescentes, jogaram capoeira no enterro
- Cemitério Parque de Goiânia

FUMEB (Fundação Mestre Bimba):
- Cofundador/mentor junto com Nenel
- Frede Abreu criou o Projeto Capoerê sob a FUMEB (1994)

HONORIS CAUSA DA UFBA (12 de junho de 1996):
- Coescreveu o discurso com o pesquisador Frede Abreu
- Representou a família na cerimônia

CITAÇÃO FAMOSA:
"Meu pai morreu de banzo (tristeza), por não ver a capoeira respeitada"'
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
