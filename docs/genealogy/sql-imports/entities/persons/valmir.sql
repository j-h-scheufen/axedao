-- ============================================================
-- GENEALOGY PERSON: Valmir
-- Generated: 2025-12-28
-- ============================================================
-- Founder of Instituto de Capoeira Angola Alagbedé (ICAA) in 2023.
-- Co-founder of FICA (1995/1996) with Cobra Mansa and Jurandir.
-- Student of Moraes and Cobra Mansa at GCAP from 1982.
-- Living mestre still active in Salvador.
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
  'Valmir Santos Damasceno',
  'Valmir',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.lalaue.com/learn-capoeira/mestre-valmir/',
    'https://www.arcomusical.com/mestre-valmir/',
    'https://danceprogram.duke.edu/visiting-artist/mestre-valmir',
    'https://clinicadecapoeira.wordpress.com/mestres-2/mestres/',
    'https://www.capoeira-angola-bogota.info/about/',
    'https://www.capoeira-angola.fi/index_en.html'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira Angola practitioner emphasizing movements close to the ground and dance-like qualities. Describes capoeira as "a fighting dance" and teaches it as "a dialogue, not a competition". Focuses on helping students realize their potential and understand their ancestry. Specializes in crafting berimbaus and caxixis, teaching rhythm, singing (ladainha, chula, corrido), and transmitting the history and philosophy of Capoeira Angola.',
  E'Praticante tradicional de Capoeira Angola enfatizando movimentos rentes ao chão e qualidades dançantes. Descreve a capoeira como "uma dança de luta" e a ensina como "um diálogo, não uma competição". Foca em ajudar os alunos a realizar seu potencial e compreender sua ancestralidade. Especializa-se em confecção de berimbaus e caxixis, ensino de ritmo, canto (ladainha, chula, corrido) e transmissão da história e filosofia da Capoeira Angola.',
  -- Life dates
  1965,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Valmir Santos Damasceno was born on August 27, 1965, in Salvador, Bahia, Brazil. He entered the world of Capoeira Angola in 1982, joining the renowned Grupo de Capoeira Angola Pelourinho (GCAP) under the guidance of Mestres Moraes and Cobra Mansa. This was a pivotal moment in capoeira history—GCAP had just returned to Salvador from Rio de Janeiro and was at the forefront of reviving Capoeira Angola, which had declined following Mestre Pastinha''s death in 1981.

For twelve years Valmir trained with GCAP, absorbing the philosophy and techniques of traditional Capoeira Angola from two of its most influential modern practitioners. In mid-1992, he received the title of Contra-Mestre, marking his transition from student to teacher. Already by this time, he was developing social projects using capoeira as the primary vehicle for community transformation.

His social work during the early 1990s included projects with the Associação Livre de Moradores da Mangueira (ALMM), the Fundação do Menor Trabalhador (FAMEB), and Projeto Axé—organizations focused on supporting at-risk youth and underserved communities in Salvador. This commitment to using capoeira for social uplift would become a defining characteristic of his career.

In 1994, Valmir departed from GCAP and established his own group. In 1995 or 1996 (sources vary), together with Mestre Cobra Mansa and Mestre Jurandir Nascimento, he co-founded the Fundação Internacional de Capoeira Angola (FICA), also known as ICAF (International Capoeira Angola Foundation). The organization was established with headquarters in Washington, D.C., dedicated to preserving, promoting, and researching Capoeira Angola.

While Cobra Mansa focused on the United States and Jurandir on Minas Gerais, Valmir became responsible for FICA-Bahia in Salvador. In 1996, he formally started the FICA group in Salvador, which he led for nearly three decades. He organized international encounters in Bahia in 1997 and 1999, attracting approximately 300 capoeiristas from around the world. In 2005, he hosted the XI International Capoeira Angola Encounter, themed "Capoeira Angola and Social Ascension: from Appropriation to Exclusion".

In August 2003, Valmir received the title of Mestre de Capoeira Angola at the 9th International Capoeira Angola Meeting organized by FICA in Belo Horizonte. This ceremony formally recognized his mastery after over two decades of dedicated practice and teaching.

His international teaching took him across multiple continents. In the United States alone, he conducted workshops in Texas, Philadelphia, Chicago, Indiana, Connecticut, Washington D.C., and California (1998 and 2000). In 2002, he taught in Germany. His presence at the 10th Capoeira Angola Meeting at UC Berkeley in 2004 demonstrated his standing in the international Angola community. Additional workshops followed in Finland, Sweden, France, Italy, England, Japan, Spain, and Costa Rica.

In 2001 and 2002, Valmir coordinated the "Capacitação Solidária" project focused on the production and commercialization of musical instruments, teaching classes in movement, singing, rhythm, and instrument-making to youth from various underserved communities. Since 2006, he has served as General Coordinator of the Audiovisual Archive Project for Capoeira Angola—a Ponto de Cultura (Culture Point) under the Ministry of Culture''s Cultura Viva program. Through this role, he became responsible for FICA operations not only in Bahia but also in Rio de Janeiro, Belo Horizonte, and Goiás.

As described by National Geographic Traveller in 2025, Valmir operates from the Instituto de Capoeira Angola Alagbedé in Pelourinho, Salvador''s UNESCO-listed historic core. When interviewed about the nature of capoeira, he said: "It''s a fighting dance... It''s a dialogue, not a competition. I''m not teaching people to be violent. I''m teaching them to realise their potential, to understand their ancestry".

In June 2023, Valmir founded the Instituto de Capoeira Angola Alagbedé (I.C.A.A.), separating from FICA to establish his own independent organizational structure. The name "Alagbedé" comes from the Yoruba word for blacksmith—the craftsmen who forge iron and are associated with the orisha Ogun. Many of his students followed him into the new organization. As of 2025, Alagbedé groups operate not only in Brazil but also in Colombia, Venezuela, Puerto Rico, Japan, France, England, and Spain. Key figures in the organization include Contramestre Aloan, Contramestre Ajaye (Dija), Contramestre Fabricio, and Contramestre Yuta.

Valmir released the CD "Das Voltas Que O Mundo Deu, As Voltas Que O Mundo Da" (The Turns the World Has Taken, The Turns the World Takes), available on streaming platforms since 2011. The recording captures the traditional music of Capoeira Angola.

Now approaching sixty years of practice, Mestre Valmir continues to lead classes in Salvador, craft berimbaus and caxixis, coordinate rodas, and travel internationally sharing the art form he has dedicated his life to preserving.',
  -- Extended content (bio_pt)
  E'Valmir Santos Damasceno nasceu em 27 de agosto de 1965, em Salvador, Bahia, Brasil. Entrou no mundo da Capoeira Angola em 1982, juntando-se ao renomado Grupo de Capoeira Angola Pelourinho (GCAP) sob a orientação dos Mestres Moraes e Cobra Mansa. Este foi um momento crucial na história da capoeira—o GCAP tinha acabado de retornar a Salvador vindo do Rio de Janeiro e estava na vanguarda do renascimento da Capoeira Angola, que havia declinado após a morte de Mestre Pastinha em 1981.

Durante doze anos Valmir treinou com o GCAP, absorvendo a filosofia e técnicas da Capoeira Angola tradicional de dois de seus praticantes modernos mais influentes. Em meados de 1992, recebeu o título de Contra-Mestre, marcando sua transição de aluno para professor. Já nessa época, estava desenvolvendo projetos sociais usando a capoeira como veículo principal para transformação comunitária.

Seu trabalho social durante o início dos anos 1990 incluiu projetos com a Associação Livre de Moradores da Mangueira (ALMM), a Fundação do Menor Trabalhador (FAMEB) e o Projeto Axé—organizações focadas em apoiar jovens em situação de risco e comunidades carentes em Salvador. Esse compromisso de usar a capoeira para elevação social se tornaria uma característica definidora de sua carreira.

Em 1994, Valmir deixou o GCAP e estabeleceu seu próprio grupo. Em 1995 ou 1996 (fontes variam), junto com Mestre Cobra Mansa e Mestre Jurandir Nascimento, co-fundou a Fundação Internacional de Capoeira Angola (FICA), também conhecida como ICAF (International Capoeira Angola Foundation). A organização foi estabelecida com sede em Washington, D.C., dedicada a preservar, promover e pesquisar a Capoeira Angola.

Enquanto Cobra Mansa focava nos Estados Unidos e Jurandir em Minas Gerais, Valmir tornou-se responsável pela FICA-Bahia em Salvador. Em 1996, iniciou formalmente o grupo FICA em Salvador, que liderou por quase três décadas. Organizou encontros internacionais na Bahia em 1997 e 1999, atraindo aproximadamente 300 capoeiristas de todo o mundo. Em 2005, sediou o XI Encontro Internacional de Capoeira Angola, com o tema "Capoeira Angola e Ascensão Social: da Apropriação à Exclusão".

Em agosto de 2003, Valmir recebeu o título de Mestre de Capoeira Angola no 9º Encontro Internacional de Capoeira Angola organizado pela FICA em Belo Horizonte. Esta cerimônia reconheceu formalmente sua maestria após mais de duas décadas de prática e ensino dedicados.

Seu ensino internacional o levou a múltiplos continentes. Somente nos Estados Unidos, conduziu workshops no Texas, Filadélfia, Chicago, Indiana, Connecticut, Washington D.C. e Califórnia (1998 e 2000). Em 2002, ensinou na Alemanha. Sua presença no 10º Encontro de Capoeira Angola na UC Berkeley em 2004 demonstrou sua posição na comunidade internacional de Angola. Workshops adicionais seguiram na Finlândia, Suécia, França, Itália, Inglaterra, Japão, Espanha e Costa Rica.

Em 2001 e 2002, Valmir coordenou o projeto "Capacitação Solidária" focado na produção e comercialização de instrumentos musicais, ensinando aulas de movimento, canto, ritmo e confecção de instrumentos para jovens de várias comunidades carentes. Desde 2006, atua como Coordenador Geral do Projeto de Arquivo Audiovisual de Capoeira Angola—um Ponto de Cultura do programa Cultura Viva do Ministério da Cultura. Através deste papel, tornou-se responsável pelas operações da FICA não apenas na Bahia, mas também no Rio de Janeiro, Belo Horizonte e Goiás.

Conforme descrito pela National Geographic Traveller em 2025, Valmir opera a partir do Instituto de Capoeira Angola Alagbedé no Pelourinho, centro histórico de Salvador listado como Patrimônio da UNESCO. Quando entrevistado sobre a natureza da capoeira, disse: "É uma dança de luta... É um diálogo, não uma competição. Não estou ensinando pessoas a serem violentas. Estou ensinando-as a realizar seu potencial, a compreender sua ancestralidade".

Em junho de 2023, Valmir fundou o Instituto de Capoeira Angola Alagbedé (I.C.A.A.), separando-se da FICA para estabelecer sua própria estrutura organizacional independente. O nome "Alagbedé" vem da palavra iorubá para ferreiro—os artesãos que forjam ferro e são associados ao orixá Ogum. Muitos de seus alunos o seguiram para a nova organização. Em 2025, grupos Alagbedé operam não apenas no Brasil, mas também na Colômbia, Venezuela, Porto Rico, Japão, França, Inglaterra e Espanha. Figuras-chave na organização incluem Contramestre Aloan, Contramestre Ajaye (Dija), Contramestre Fabricio e Contramestre Yuta.

Valmir lançou o CD "Das Voltas Que O Mundo Deu, As Voltas Que O Mundo Da", disponível em plataformas de streaming desde 2011. A gravação captura a música tradicional da Capoeira Angola.

Agora aproximando-se de sessenta anos de prática, Mestre Valmir continua a dar aulas em Salvador, confeccionar berimbaus e caxixis, coordenar rodas e viajar internacionalmente compartilhando a arte à qual dedicou sua vida a preservar.',
  -- Achievements
  E'- Founded Instituto de Capoeira Angola Alagbedé (I.C.A.A.) - June 2023
- Co-founded FICA/ICAF (1995/1996) with Cobra Mansa and Jurandir - largest Capoeira Angola organization in the world
- Led FICA-Bahia/FICA-Salvador for nearly three decades (1996-2023)
- General Coordinator, Audiovisual Archive Project for Capoeira Angola - Ponto de Cultura (since 2006)
- Received title of Mestre de Capoeira Angola at 9th International Capoeira Angola Meeting, Belo Horizonte (August 2003)
- Organized International Capoeira Angola Encounters in Bahia (1997, 1999, 2005)
- Coordinated "Capacitação Solidária" project for musical instrument production (2001-2002)
- International teaching: USA, Germany, France, Italy, Finland, Sweden, England, Japan, Spain, Costa Rica
- Social work with Projeto Axé, ALMM, FAMEB supporting at-risk youth in Salvador
- Released CD "Das Voltas Que O Mundo Deu, As Voltas Que O Mundo Da" (2011)
- Featured in National Geographic Traveller (October 2025)
- Teaches at major Brazilian universities: UEFS, UFRRJ',
  E'- Fundou o Instituto de Capoeira Angola Alagbedé (I.C.A.A.) - Junho de 2023
- Co-fundou FICA/ICAF (1995/1996) com Cobra Mansa e Jurandir - maior organização de Capoeira Angola do mundo
- Liderou FICA-Bahia/FICA-Salvador por quase três décadas (1996-2023)
- Coordenador Geral, Projeto de Arquivo Audiovisual de Capoeira Angola - Ponto de Cultura (desde 2006)
- Recebeu título de Mestre de Capoeira Angola no 9º Encontro Internacional de Capoeira Angola, Belo Horizonte (Agosto de 2003)
- Organizou Encontros Internacionais de Capoeira Angola na Bahia (1997, 1999, 2005)
- Coordenou projeto "Capacitação Solidária" para produção de instrumentos musicais (2001-2002)
- Ensino internacional: EUA, Alemanha, França, Itália, Finlândia, Suécia, Inglaterra, Japão, Espanha, Costa Rica
- Trabalho social com Projeto Axé, ALMM, FAMEB apoiando jovens em situação de risco em Salvador
- Lançou CD "Das Voltas Que O Mundo Deu, As Voltas Que O Mundo Da" (2011)
- Apresentado na National Geographic Traveller (Outubro de 2025)
- Ensina em universidades brasileiras importantes: UEFS, UFRRJ',
  -- Researcher notes (notes_en)
  E'BIRTH DATE: August 27, 1965 - consistently reported across multiple sources (Lalaue, clinicadecapoeira.wordpress.com, arcomusical.com, Duke University).

BIRTH PLACE: Salvador, Bahia, Brazil - consistently reported.

TRAINING TIMELINE:
- 1982: Joined GCAP under Mestres Moraes and Cobra Mansa
- 1992: Received Contra-Mestre title
- 1994: Left GCAP
- 2003: Received Mestre title at 9th FICA meeting in Belo Horizonte

TEACHERS:
- Mestre Moraes (primary, GCAP 1982-1994)
- Mestre Cobra Mansa (GCAP 1982-1994)

STUDENTS/CONTRAMESTRES:
- Contramestre Aloan (Alagbedé)
- Contramestre Ajaye/Dija (Alagbedé)
- Contramestre Fabricio (Alagbedé Colombia, trained 1999-2007 at FICA-BA)
- Contramestre Yuta (Alagbedé)
- Contramestre Rogerio (titled 2003 by Jurandir, Cobra Mansa, and Valmir)

FICA FOUNDING DATE DISCREPANCY: Some sources cite 1995, others 1996. Likely informal establishment in 1995 after First International Capoeira Angola Encounter, formal incorporation in 1996.

NAME "ALAGBEDÉ": Yoruba word meaning "blacksmith" - artisan who forges iron, associated with orisha Ogun/Ogum.

MEDIA APPEARANCES:
- 2011: CD "Das Voltas Que O Mundo Deu, As Voltas Que O Mundo Da" released on streaming platforms
- 2025: Featured in National Geographic Traveller (UK) October issue

SOCIAL PROJECTS:
- ALMM (Associação Livre de Moradores da Mangueira)
- FAMEB (Fundação do Menor Trabalhador)
- Projeto Axé

ORGANIZATIONAL HISTORY:
- 1982-1994: GCAP member
- 1994-1996: Own group, then merged with FICA
- 1996-2023: Led FICA-Bahia
- 2023-present: Instituto de Capoeira Angola Alagbedé (I.C.A.A.)',
  E'DATA DE NASCIMENTO: 27 de agosto de 1965 - relatado consistentemente em múltiplas fontes (Lalaue, clinicadecapoeira.wordpress.com, arcomusical.com, Duke University).

LOCAL DE NASCIMENTO: Salvador, Bahia, Brasil - relatado consistentemente.

CRONOLOGIA DE TREINO:
- 1982: Entrou no GCAP sob os Mestres Moraes e Cobra Mansa
- 1992: Recebeu título de Contra-Mestre
- 1994: Deixou o GCAP
- 2003: Recebeu título de Mestre no 9º encontro da FICA em Belo Horizonte

MESTRES:
- Mestre Moraes (principal, GCAP 1982-1994)
- Mestre Cobra Mansa (GCAP 1982-1994)

ALUNOS/CONTRAMESTRES:
- Contramestre Aloan (Alagbedé)
- Contramestre Ajaye/Dija (Alagbedé)
- Contramestre Fabricio (Alagbedé Colômbia, treinou 1999-2007 na FICA-BA)
- Contramestre Yuta (Alagbedé)
- Contramestre Rogerio (titulado 2003 por Jurandir, Cobra Mansa e Valmir)

DISCREPÂNCIA NA DATA DE FUNDAÇÃO DA FICA: Algumas fontes citam 1995, outras 1996. Provavelmente estabelecimento informal em 1995 após o Primeiro Encontro Internacional de Capoeira Angola, incorporação formal em 1996.

NOME "ALAGBEDÉ": Palavra iorubá significando "ferreiro" - artesão que forja ferro, associado ao orixá Ogum.

APARIÇÕES NA MÍDIA:
- 2011: CD "Das Voltas Que O Mundo Deu, As Voltas Que O Mundo Da" lançado em plataformas de streaming
- 2025: Apresentado na National Geographic Traveller (UK) edição de outubro

PROJETOS SOCIAIS:
- ALMM (Associação Livre de Moradores da Mangueira)
- FAMEB (Fundação do Menor Trabalhador)
- Projeto Axé

HISTÓRICO ORGANIZACIONAL:
- 1982-1994: Membro do GCAP
- 1994-1996: Grupo próprio, depois fundiu com FICA
- 1996-2023: Liderou FICA-Bahia
- 2023-presente: Instituto de Capoeira Angola Alagbedé (I.C.A.A.)'
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
