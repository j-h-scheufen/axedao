-- ============================================================
-- GENEALOGY PERSON: Limãozinho
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH DATE: September 15, 1957 (exact)
-- Multiple sources confirm: IPHAN Capoeira profile, Diário Causa Operária
-- Born in Salvador, Bahia (Rio Vermelho neighborhood, Hospital Anita Costa)
-- Baptized in Santo Amaro da Purificação (family connection)
--
-- Note on full name: IPHAN lists "José Carlos dos Santos", while
-- Diário Causa Operária lists "José Carlos do Santos" (missing 's')
-- Using "José Carlos dos Santos" as per IPHAN (official registry)
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  -- Identity
  'José Carlos dos Santos',
  'Limãozinho',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeira.iphan.gov.br/user/infor/1798',
    'https://causaoperaria.org.br/2021/capoeira-conheca-a-tradicao-cultura-e-arte-do-mestre-limaozinho/'
  ]::text[],
  -- Style
  'angola'::genealogy.style,
  E'Mestre Limãozinho is one of the few who received Capoeira Angola instruction from his uncle Mestre Limão, who primarily taught Regional to his other students. His uncle reserved Angola training for only three people: Limãozinho, Silvio Acarajé, and Jorginho. Limãozinho continued this tradition, becoming a dedicated preservationist of Capoeira Angola and Afro-Brazilian cultural traditions including Samba de Roda and Maculelê.',
  E'Mestre Limãozinho é um dos poucos que recebeu instrução de Capoeira Angola de seu tio Mestre Limão, que ensinava principalmente Regional para outros alunos. Seu tio reservava o treino de Angola para apenas três pessoas: Limãozinho, Silvio Acarajé e Jorginho. Limãozinho continuou essa tradição, tornando-se um dedicado preservacionista da Capoeira Angola e das tradições culturais afro-brasileiras incluindo Samba de Roda e Maculelê.',
  -- Birth
  1957, 'exact'::genealogy.date_precision, 'Salvador, Bahia, Brazil',
  -- Death (living)
  NULL, NULL::genealogy.date_precision, NULL,
  -- bio_en
  E'José Carlos dos Santos was born on September 15, 1957, in Salvador, Bahia, at Hospital Anita Costa in the Rio Vermelho neighborhood. Though born in Salvador, he was baptized in Santo Amaro da Purificação—the city of his uncle Mestre Paulo Limão—establishing his deep connection to the Recôncavo Baiano region that would define his capoeira identity.

At age eight, in 1965, Limãozinho began learning capoeira from his uncle and primary teacher, Mestre Paulo Limão (Paulo dos Santos, 1945-1985). As his disciple, he received the diminutive nickname "Limãozinho" (Little Lemon) from his master—a common practice in capoeira where students carry a variation of their teacher''s name. Limãozinho was privileged to be one of only three students whom Mestre Limão taught Capoeira Angola; despite being an Angoleiro trained under Mestre Caiçara, Limão primarily taught Regional style at his academies, reserving Angola instruction for Limãozinho, Silvio Acarajé, and Jorginho.

On December 3, 1972, at just fifteen years old, Limãozinho was formally recognized as a contra-mestre, marking his transition from student to instructor. That same year, he began teaching capoeira in São Paulo, establishing what would become a lifelong educational mission. His first academy was named "Quilombinho"—a diminutive of "Quilombo," echoing both his uncle''s Academia Quilombo dos Palmares and the historical communities of escaped slaves.

As his mastery developed, Limãozinho transformed Quilombinho into TOCA—Terreiro Original de Capoeira Angola Centro de Cultura e Arte (Original Terreiro of Capoeira Angola Center of Culture and Art). The name "Terreiro" carries profound significance, evoking the sacred spaces of Candomblé and Umbanda where Afro-Brazilian spiritual traditions are practiced—signaling that TOCA would be more than a martial arts academy.

Beyond capoeira, Limãozinho is a researcher and promoter of samba from the Recôncavo Baiano region. His instruction encompasses the broader spectrum of Afro-Brazilian cultural traditions: Capoeira Angola, Samba de Roda, Maculelê, and Afro-Brazilian craftsmanship. This comprehensive approach reflects his philosophy that capoeira is not merely a fighting art but a complete cultural and educational system.

His professional life has combined capoeira education with work as a professional driver. He also pursued formal education, studying Physical Education at Faculdade Paulistana. His current work centers at Fábrica de Cultura in the Capão Redondo neighborhood of São Paulo, where he is registered as a Capoeira Master. This government-supported cultural center allows him to continue his mission of bringing Afro-Brazilian culture to youth in São Paulo''s periphery.

Mestre Limãozinho''s dedication to capoeira education has produced several generations of students, including Fábio Lima, who teaches at Centro Cultural Zazá in Piracicaba. His international reach includes teaching capoeira and samba de roda in Barcelona at the "Diálogos do Grupo Banzo Senzala" event.

In 2006, he released the album "Capoeira de Angola Berimbau de Ouro" through Laser Records, featuring 17 songs. Notable tracks include "Mestre Limão" (a tribute to his uncle), "Filhos de Santo Amaro da Purificação" (celebrating his family''s hometown), "Angoleiros de Santo Amaro," and "Sylvio Acarajé no Reino do Senhor" (honoring his fellow Angola student Silvio Acarajé, who died in 1996).

In 2020, Mestre Limãozinho received the Berimbau de Ouro award—considered "the Oscar of Capoeira"—in recognition of his decades of work supporting youth in São Paulo''s periphery. That same year, he also received an honorary doctorate (Dr. Honoris Causa), marking the culmination of over 50 years dedicated to Capoeira Angola and Afro-Brazilian cultural preservation.',
  -- bio_pt
  E'José Carlos dos Santos nasceu em 15 de setembro de 1957, em Salvador, Bahia, no Hospital Anita Costa, no bairro do Rio Vermelho. Embora nascido em Salvador, foi batizado em Santo Amaro da Purificação—cidade de seu tio Mestre Paulo Limão—estabelecendo sua profunda conexão com a região do Recôncavo Baiano que definiria sua identidade na capoeira.

Aos oito anos de idade, em 1965, Limãozinho começou a aprender capoeira com seu tio e mestre principal, Mestre Paulo Limão (Paulo dos Santos, 1945-1985). Como seu discípulo, recebeu o apelido diminutivo "Limãozinho" de seu mestre—uma prática comum na capoeira onde alunos carregam uma variação do nome de seu professor. Limãozinho teve o privilégio de ser um dos apenas três alunos a quem Mestre Limão ensinou Capoeira Angola; apesar de ser Angoleiro treinado por Mestre Caiçara, Limão ensinava principalmente estilo Regional em suas academias, reservando a instrução de Angola para Limãozinho, Silvio Acarajé e Jorginho.

Em 3 de dezembro de 1972, com apenas quinze anos, Limãozinho foi formalmente reconhecido como contra-mestre, marcando sua transição de aluno para instrutor. Nesse mesmo ano, começou a ensinar capoeira em São Paulo, estabelecendo o que se tornaria uma missão educacional para toda a vida. Sua primeira academia foi batizada de "Quilombinho"—um diminutivo de "Quilombo", ecoando tanto a Academia Quilombo dos Palmares de seu tio quanto as comunidades históricas de escravos fugidos.

À medida que sua maestria se desenvolveu, Limãozinho transformou o Quilombinho em TOCA—Terreiro Original de Capoeira Angola Centro de Cultura e Arte. O nome "Terreiro" carrega significado profundo, evocando os espaços sagrados do Candomblé e da Umbanda onde as tradições espirituais afro-brasileiras são praticadas—sinalizando que o TOCA seria mais do que uma academia de artes marciais.

Além da capoeira, Limãozinho é pesquisador e divulgador do samba do Recôncavo Baiano. Sua instrução abrange o espectro mais amplo das tradições culturais afro-brasileiras: Capoeira Angola, Samba de Roda, Maculelê e artesanato afro-brasileiro. Esta abordagem abrangente reflete sua filosofia de que a capoeira não é meramente uma arte de luta, mas um sistema cultural e educacional completo.

Sua vida profissional combinou educação em capoeira com trabalho como motorista profissional. Ele também buscou educação formal, estudando Educação Física na Faculdade Paulistana. Seu trabalho atual está centrado na Fábrica de Cultura no bairro do Capão Redondo em São Paulo, onde é registrado como Mestre de Capoeira. Este centro cultural apoiado pelo governo permite que ele continue sua missão de levar a cultura afro-brasileira para jovens da periferia de São Paulo.

A dedicação de Mestre Limãozinho à educação em capoeira produziu várias gerações de alunos, incluindo Fábio Lima, que ensina no Centro Cultural Zazá em Piracicaba. Seu alcance internacional inclui aulas de capoeira e samba de roda em Barcelona no evento "Diálogos do Grupo Banzo Senzala".

Em 2006, lançou o álbum "Capoeira de Angola Berimbau de Ouro" pela Laser Records, com 17 músicas. Faixas notáveis incluem "Mestre Limão" (tributo ao seu tio), "Filhos de Santo Amaro da Purificação" (celebrando a cidade natal de sua família), "Angoleiros de Santo Amaro" e "Sylvio Acarajé no Reino do Senhor" (homenageando seu companheiro de Angola Silvio Acarajé, que faleceu em 1996).

Em 2020, Mestre Limãozinho recebeu o prêmio Berimbau de Ouro—considerado "o Oscar da Capoeira"—em reconhecimento por décadas de trabalho apoiando jovens na periferia de São Paulo. No mesmo ano, também recebeu um doutorado honorário (Dr. Honoris Causa), marcando a culminação de mais de 50 anos dedicados à Capoeira Angola e à preservação da cultura afro-brasileira.',
  -- achievements_en
  E'- 1972 (December 3): Received contra-mestre title at age 15; began teaching in São Paulo
- 1972+: Founded first academy "Quilombinho" in São Paulo
- Later: Transformed Quilombinho into TOCA (Terreiro Original de Capoeira Angola Centro de Cultura e Arte)
- 2006: Released album "Capoeira de Angola Berimbau de Ouro" (Laser Records, 17 tracks)
- 2020: Awarded Berimbau de Ouro prize ("Oscar of Capoeira")
- 2020: Received Dr. Honoris Causa honorary doctorate
- International: Taught capoeira and samba de roda in Barcelona at "Diálogos do Grupo Banzo Senzala"
- Current: Registered Capoeira Master at Fábrica de Cultura, Capão Redondo, São Paulo',
  -- achievements_pt
  E'- 1972 (3 de dezembro): Recebeu título de contra-mestre aos 15 anos; começou a ensinar em São Paulo
- 1972+: Fundou primeira academia "Quilombinho" em São Paulo
- Posteriormente: Transformou Quilombinho em TOCA (Terreiro Original de Capoeira Angola Centro de Cultura e Arte)
- 2006: Lançou álbum "Capoeira de Angola Berimbau de Ouro" (Laser Records, 17 faixas)
- 2020: Premiado com Berimbau de Ouro ("Oscar da Capoeira")
- 2020: Recebeu doutorado honorário Dr. Honoris Causa
- Internacional: Ensinou capoeira e samba de roda em Barcelona no evento "Diálogos do Grupo Banzo Senzala"
- Atual: Mestre de Capoeira registrado na Fábrica de Cultura, Capão Redondo, São Paulo',
  -- notes_en
  E'BIRTH DATE: September 15, 1957 (exact)
- IPHAN Capoeira profile confirms date
- Born at Hospital Anita Costa, Rio Vermelho neighborhood, Salvador, Bahia
- Baptized in Santo Amaro da Purificação (family connection)

NAME VARIATIONS:
- "José Carlos dos Santos" - IPHAN official profile
- "José Carlos do Santos" - Diário Causa Operária (missing ''s'')
- Using IPHAN version as authoritative

TEACHERS:
- Mestre Paulo Limão (Paulo dos Santos, 1945-1985) - uncle; primary teacher; Capoeira Angola
- Also influenced by: Mestre Silvestre, Mestre Pinatti, Mestre Suassuna (per IPHAN profile)

STUDENTS:
- Fábio Lima - teaches at Centro Cultural Zazá, Piracicaba

CONTEMPORARIES (Training partners under Limão):
- Silvio Acarajé (Silvio dos Santos, 1954-1996) - also nephew (and later brother-in-law); one of three taught Angola
- Jorginho - one of three taught Angola

GROUPS FOUNDED:
- Quilombinho (first academy, early 1970s)
- TOCA - Terreiro Original de Capoeira Angola Centro de Cultura e Arte (evolved from Quilombinho)

ADDITIONAL DISCIPLINES TAUGHT:
- Samba de Roda
- Maculelê
- Afro-Brazilian craftsmanship

PROFESSION:
- Professional driver
- Capoeira educator
- Studying Physical Education at Faculdade Paulistana (as of 2021)

MEDIA APPEARANCES:
- 2006: Album "Capoeira de Angola Berimbau de Ouro" (Laser Records, 17 tracks)
  - Notable tracks: "Mestre Limão", "Filhos de Santo Amaro da Purificação", "Angoleiros de Santo Amaro", "Sylvio Acarajé no Reino do Senhor"

RECOGNITIONS:
- 2020: Berimbau de Ouro prize (recognition for youth work in Capão Redondo)
- 2020: Dr. Honoris Causa honorary doctorate

TEACHING LOCATIONS:
- Fábrica de Cultura, Capão Redondo, São Paulo (current)
- Barcelona, Spain (international workshops at "Diálogos do Grupo Banzo Senzala")
- Centro Cultural Zazá, Piracicaba (visited Feb 2022)

LINEAGE:
Caiçara → Limão → Limãozinho
(Mestre Caiçara trained Mestre Limão, who trained Limãozinho)',
  -- notes_pt
  E'DATA DE NASCIMENTO: 15 de setembro de 1957 (exata)
- Perfil IPHAN Capoeira confirma data
- Nascido no Hospital Anita Costa, bairro Rio Vermelho, Salvador, Bahia
- Batizado em Santo Amaro da Purificação (conexão familiar)

VARIAÇÕES DE NOME:
- "José Carlos dos Santos" - perfil oficial IPHAN
- "José Carlos do Santos" - Diário Causa Operária (faltando ''s'')
- Usando versão IPHAN como autoritativa

MESTRES:
- Mestre Paulo Limão (Paulo dos Santos, 1945-1985) - tio; mestre principal; Capoeira Angola
- Também influenciado por: Mestre Silvestre, Mestre Pinatti, Mestre Suassuna (conforme perfil IPHAN)

ALUNOS:
- Fábio Lima - ensina no Centro Cultural Zazá, Piracicaba

CONTEMPORÂNEOS (Colegas de treino sob Limão):
- Silvio Acarajé (Silvio dos Santos, 1954-1996) - também sobrinho (e depois cunhado); um dos três que aprendeu Angola
- Jorginho - um dos três que aprendeu Angola

GRUPOS FUNDADOS:
- Quilombinho (primeira academia, início dos anos 1970)
- TOCA - Terreiro Original de Capoeira Angola Centro de Cultura e Arte (evoluiu do Quilombinho)

DISCIPLINAS ADICIONAIS ENSINADAS:
- Samba de Roda
- Maculelê
- Artesanato afro-brasileiro

PROFISSÃO:
- Motorista profissional
- Educador de capoeira
- Estudando Educação Física na Faculdade Paulistana (em 2021)

APARIÇÕES NA MÍDIA:
- 2006: Álbum "Capoeira de Angola Berimbau de Ouro" (Laser Records, 17 faixas)
  - Faixas notáveis: "Mestre Limão", "Filhos de Santo Amaro da Purificação", "Angoleiros de Santo Amaro", "Sylvio Acarajé no Reino do Senhor"

RECONHECIMENTOS:
- 2020: Prêmio Berimbau de Ouro (reconhecimento pelo trabalho com jovens no Capão Redondo)
- 2020: Doutorado honorário Dr. Honoris Causa

LOCAIS DE ENSINO:
- Fábrica de Cultura, Capão Redondo, São Paulo (atual)
- Barcelona, Espanha (workshops internacionais no "Diálogos do Grupo Banzo Senzala")
- Centro Cultural Zazá, Piracicaba (visitou fev 2022)

LINHAGEM:
Caiçara → Limão → Limãozinho
(Mestre Caiçara treinou Mestre Limão, que treinou Limãozinho)'
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
