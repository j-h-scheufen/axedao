-- ============================================================
-- GENEALOGY PERSON: Onça Negra
-- Generated: 2026-01-12
-- ============================================================
-- Student of Mestre Bimba who graduated in 1969 alongside Camisa,
-- Macarrão, and Torpedo. Currently associated with Grupo Bimba meu
-- Mestre in Goiânia, Goiás. Recorded CD "Bimba Meu Mestre" with
-- Mestre Deputado (2014).
--
-- DISAMBIGUATION: This is DISTINCT from Onça Preta (Cícero Navarro,
-- 1909-2006), who was an Angola mestre from Salvador.
--
-- BIRTH YEAR ESTIMATION: Graduated 1969 alongside Camisa (b. 1955,
-- graduated at 14). Assuming similar age range, estimating mid-1950s.
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
  'Laurindo Dario dos Santos',
  'Onça Negra',
  'mestre'::genealogy.title,
  NULL, -- No portrait available
  ARRAY['https://music.apple.com/br/artist/mestre-on%C3%A7a-negra/904020000']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1955, -- Estimated based on graduation year 1969 with Camisa (b. 1955)
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown
  NULL, -- Living as of 2018
  NULL,
  NULL,
  -- bio_en
  E'Laurindo Dario dos Santos, known as Mestre Onça Negra, was a student of Mestre Bimba who graduated as aluno formado from the Centro de Cultura Física Regional in Salvador in 1969. He was one of four graduation companions that year, alongside Camisa (José Tadeu Carneiro Cardoso), Macarrão, and Torpedo. The formatura ceremony took place at Mestre Bimba''s site in Nordeste de Amaralina and featured the traditional rituals of Capoeira Regional: stories told by Mestre Bimba, the prova de fogo (trial by fire), demonstrations of cintura desprezada, benguela games, matches with renowned capoeiristas and senior graduates, and samba de roda until dawn.

Onça Negra was also part of the broader training group at Bimba''s academy that included Pimentão, Nenel (Bimba''s son), Formiga, and Demerval. These were the younger generation training alongside already-graduated students such as Canhão, Alegria, Luís, Quebra Ferro, Malvadeza, Valdemar, and Sarigue.

Following Mestre Bimba''s move to Goiânia in 1973 and death in 1974, several of his students established themselves in the state of Goiás, maintaining and teaching Capoeira Regional. Mestre Onça Negra became associated with Grupo Bimba meu Mestre, based in Goiânia—one of the groups that preserve traditional Regional teachings closest to Bimba''s original methodology.

In 2014, Onça Negra collaborated with Mestre Deputado to record the CD "Bimba Meu Mestre", featuring traditional capoeira music including toques such as São Bento Grande da Regional, Barravento, and Cabula. The album pays tribute to the Regional tradition and preserves important musical elements of Bimba''s legacy.

Mestre Onça Negra participated in the Second Encontro de Amigos CDO Goiás event in Goiânia, where he was listed among veteran and renowned mestres representing the traditional segment of Capoeira Regional, alongside figures such as Suassuna, Brasília, Deputado, and Cobra Mansa.

He should not be confused with Mestre Onça Preta (Cícero Navarro, 1909-2006), who was an Angola mestre from Salvador.',
  -- bio_pt
  E'Laurindo Dario dos Santos, conhecido como Mestre Onça Negra, foi aluno de Mestre Bimba que se formou como aluno formado do Centro de Cultura Física Regional em Salvador em 1969. Ele foi um dos quatro companheiros de formatura naquele ano, junto com Camisa (José Tadeu Carneiro Cardoso), Macarrão e Torpedo. A cerimônia de formatura aconteceu no sítio de Mestre Bimba no Nordeste de Amaralina e contou com os rituais tradicionais da Capoeira Regional: histórias contadas por Mestre Bimba, prova de fogo, demonstrações de cintura desprezada, jogos de benguela, partidas com capoeiristas renomados e formados antigos, e samba de roda até o amanhecer.

Onça Negra também fazia parte do grupo mais amplo de treino na academia de Bimba que incluía Pimentão, Nenel (filho de Bimba), Formiga e Demerval. Estes eram a geração mais jovem treinando ao lado de alunos já formados como Canhão, Alegria, Luís, Quebra Ferro, Malvadeza, Valdemar e Sarigue.

Após a mudança de Mestre Bimba para Goiânia em 1973 e sua morte em 1974, vários de seus alunos se estabeleceram no estado de Goiás, mantendo e ensinando a Capoeira Regional. Mestre Onça Negra tornou-se associado ao Grupo Bimba meu Mestre, baseado em Goiânia—um dos grupos que preservam os ensinamentos tradicionais da Regional mais próximos da metodologia original de Bimba.

Em 2014, Onça Negra colaborou com Mestre Deputado para gravar o CD "Bimba Meu Mestre", com músicas tradicionais de capoeira incluindo toques como São Bento Grande da Regional, Barravento e Cabula. O álbum homenageia a tradição Regional e preserva importantes elementos musicais do legado de Bimba.

Mestre Onça Negra participou do Segundo Encontro de Amigos CDO Goiás em Goiânia, onde foi listado entre mestres veteranos e renomados representando o segmento tradicional da Capoeira Regional, ao lado de figuras como Suassuna, Brasília, Deputado e Cobra Mansa.

Ele não deve ser confundido com Mestre Onça Preta (Cícero Navarro, 1909-2006), que foi um mestre de Angola de Salvador.',
  -- achievements_en
  E'Graduated as aluno formado from Mestre Bimba''s Centro de Cultura Física Regional (1969); Recorded CD "Bimba Meu Mestre" with Mestre Deputado (2014); Associated with Grupo Bimba meu Mestre in Goiânia; Recognized as veteran mestre of traditional Capoeira Regional',
  -- achievements_pt
  E'Formou-se como aluno formado do Centro de Cultura Física Regional de Mestre Bimba (1969); Gravou CD "Bimba Meu Mestre" com Mestre Deputado (2014); Associado ao Grupo Bimba meu Mestre em Goiânia; Reconhecido como mestre veterano da Capoeira Regional tradicional',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1955, decade):
Graduated alongside Camisa in 1969. Camisa was born October 28, 1955 and graduated at age 14.
Assuming similar age range for graduation companions, estimating mid-1950s birth.
Using decade precision due to lack of corroborating evidence.

NAME:
- Full name "Laurindo Dario dos Santos" discovered from Instagram post (CDSeTNvHg3C)
- Apelido "Onça Negra" means "Black Jaguar/Panther"

DISAMBIGUATION:
This Onça Negra is DISTINCT from Mestre Onça Preta (Cícero Navarro, 1909-2006):
- Onça Negra (this person): Laurindo Dario dos Santos, student of Mestre Bimba, graduated 1969, Regional
- Onça Preta: Cícero Navarro, Angola mestre, co-founder of CECA and Filhos de Angola

TEACHER:
- Mestre Bimba (primary, ~1967-1969, Salvador)

TRAINING COMPANIONS AT BIMBA''S ACADEMY:
According to Mestre Camisa: "Com eu era Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval"
(With me were Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga, and Demerval)

GRADUATION COMPANIONS (1969):
- Camisa (José Tadeu Carneiro Cardoso) - later founded ABADÁ-Capoeira
- Macarrão - minimal information available
- Torpedo - minimal information available

GRADUATION CEREMONY DETAILS:
- Location: Sítio Caruano, Nordeste de Amaralina, Salvador
- Featured: Traditional stories by Mestre Bimba, rituals, prova de fogo, cintura desprezada demonstrations, benguela games, games with renowned capoeiristas and senior graduates, samba de roda until dawn
- Camisa''s madrinha (godmother): his sister Noemilde

CURRENT ACTIVITY:
- Associated with Grupo Bimba meu Mestre (Goiânia)
- Participated in Second Encontro de Amigos CDO Goiás event (2018)
- Recorded CD "Bimba Meu Mestre" with Mestre Deputado (2014)

MEDIA APPEARANCES:
- 2014: CD "Bimba Meu Mestre" (with Mestre Deputado & Grupo Bimba meu Mestre) - tracks include São Bento Grande da Regional, Meu Berimbau, La Na Bahia, Cajueiro Pequenino, Sambar, Samba de Roda
- 2018: Participated in Encontro de Amigos CDO Goiás (Diário da Manhã coverage)

MESTRE DEPUTADO CONNECTION:
- Mestre Deputado is a disciple of Mestre Oswaldo (Goiânia), who was a student of Mestre Bimba
- Deputado authored various capoeira books including "Capoeira, Arte e Folclore"
- Deputado and Onça Negra collaborate through Grupo Bimba meu Mestre

STUDENTS:
- Professor Onça Negra is listed among teachers of Mestre Tampinha from Grupo de Capoeira Raça Negra
- May have taught other students through Grupo Bimba meu Mestre

RESEARCH GAPS:
- Exact birth date unknown
- Birth place not documented
- Details of career between 1969 graduation and current Goiânia activity unknown
- Family information unavailable',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1955, década):
Formou-se junto com Camisa em 1969. Camisa nasceu em 28 de outubro de 1955 e formou-se aos 14 anos.
Assumindo faixa etária similar para companheiros de formatura, estimando nascimento em meados dos anos 1950.
Usando precisão de década devido à falta de evidência corroborante.

NOME:
- Nome completo "Laurindo Dario dos Santos" descoberto em post do Instagram (CDSeTNvHg3C)
- Apelido "Onça Negra" significa "Pantera/Onça Preta"

DESAMBIGUAÇÃO:
Este Onça Negra é DISTINTO de Mestre Onça Preta (Cícero Navarro, 1909-2006):
- Onça Negra (esta pessoa): Laurindo Dario dos Santos, aluno de Mestre Bimba, formado 1969, Regional
- Onça Preta: Cícero Navarro, mestre de Angola, co-fundador do CECA e Filhos de Angola

PROFESSOR:
- Mestre Bimba (principal, ~1967-1969, Salvador)

COMPANHEIROS DE TREINO NA ACADEMIA DE BIMBA:
Segundo Mestre Camisa: "Com eu era Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval"

COMPANHEIROS DE FORMATURA (1969):
- Camisa (José Tadeu Carneiro Cardoso) - posteriormente fundou a ABADÁ-Capoeira
- Macarrão - informações mínimas disponíveis
- Torpedo - informações mínimas disponíveis

DETALHES DA CERIMÔNIA DE FORMATURA:
- Local: Sítio Caruano, Nordeste de Amaralina, Salvador
- Incluiu: Histórias tradicionais de Mestre Bimba, rituais, prova de fogo, demonstrações de cintura desprezada, jogos de benguela, jogos com capoeiristas renomados e formados antigos, samba de roda até o amanhecer
- Madrinha de Camisa: sua irmã Noemilde

ATIVIDADE ATUAL:
- Associado ao Grupo Bimba meu Mestre (Goiânia)
- Participou do Segundo Encontro de Amigos CDO Goiás (2018)
- Gravou CD "Bimba Meu Mestre" com Mestre Deputado (2014)

APARIÇÕES NA MÍDIA:
- 2014: CD "Bimba Meu Mestre" (com Mestre Deputado e Grupo Bimba meu Mestre) - faixas incluem São Bento Grande da Regional, Meu Berimbau, La Na Bahia, Cajueiro Pequenino, Sambar, Samba de Roda
- 2018: Participou do Encontro de Amigos CDO Goiás (cobertura do Diário da Manhã)

CONEXÃO MESTRE DEPUTADO:
- Mestre Deputado é discípulo de Mestre Oswaldo (Goiânia), que foi aluno de Mestre Bimba
- Deputado é autor de vários livros de capoeira incluindo "Capoeira, Arte e Folclore"
- Deputado e Onça Negra colaboram através do Grupo Bimba meu Mestre

ALUNOS:
- Professor Onça Negra é listado entre os professores de Mestre Tampinha do Grupo de Capoeira Raça Negra
- Pode ter ensinado outros alunos através do Grupo Bimba meu Mestre

LACUNAS DE PESQUISA:
- Data exata de nascimento desconhecida
- Local de nascimento não documentado
- Detalhes da carreira entre a formatura de 1969 e atividade atual em Goiânia desconhecidos
- Informações familiares indisponíveis'
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
