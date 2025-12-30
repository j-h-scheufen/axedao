-- ============================================================
-- GENEALOGY PERSON: Braga
-- Generated: 2025-12-28
-- ============================================================
-- BIRTH DATE: June 13, 1957 - Confirmed by multiple sources
-- (Wikipedia, Lalaue, CapoeiraHub, Africa Bantu website).
--
-- BIRTH PLACE: Lins neighborhood, Rio de Janeiro (during
-- Guanabara state period). Raised in culturally rich
-- environment with street games, samba, and informal fighting.
--
-- STYLE: Angola - Student of Mestre Moraes, inherited Pastinha
-- lineage through Moraes' training with João Grande/João Pequeno.
--
-- SIGNIFICANCE: Co-founder of GCAP (1980); designed GCAP logo
-- (berimbau + two zebras); one of first mestres of Capoeira
-- Angola formed outside of Bahia (Dec 16, 1978); founder of
-- Africa Bantu (1993/94); met Mestre Pastinha in 1975/1979.
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
  'Antonio Neves Braga',
  'Braga',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.lalaue.com/learn-capoeira/mestre-braga/',
    'https://africabantu.wordpress.com/mestre-braga/',
    'https://www.capoeirahub.net/mestres/649edb8548085400142322fa-mestre-braga'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Braga is an Angola purist who inherited his pedagogical approach from Mestre Moraes, himself a student of João Grande and João Pequeno at Pastinha''s academy. Rather than imitative learning, Braga emphasizes understanding-based pedagogy aligned with students'' own movement comprehension. He is proficient in all Angola berimbau rhythms including São Bento Grande de Angola, São Bento Pequeno, Cavalaria, Jogo de Dentro, Iúna, Santa Maria, and Jogo do Lenço (Panha Laranja). He also learned Regional toques under Moraes to understand the full spectrum of capoeira music.',
  E'Braga é um purista da Angola que herdou sua abordagem pedagógica de Mestre Moraes, ele próprio aluno de João Grande e João Pequeno na academia de Pastinha. Em vez de aprendizado por imitação, Braga enfatiza uma pedagogia baseada na compreensão, alinhada à compreensão do movimento próprio dos alunos. É proficiente em todos os ritmos de berimbau de Angola incluindo São Bento Grande de Angola, São Bento Pequeno, Cavalaria, Jogo de Dentro, Iúna, Santa Maria e Jogo do Lenço (Panha Laranja). Também aprendeu toques de Regional sob Moraes para entender o espectro completo da música de capoeira.',
  -- Life dates
  1957,
  'exact'::genealogy.date_precision,
  'Lins, Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (English)
  E'Antonio Neves Braga was born on June 13, 1957, in the Lins neighborhood of Rio de Janeiro, during the time when it was part of Guanabara State. He grew up in a culturally rich environment filled with street games, samba, and informal fighting traditions, learning combative techniques from around ages 13-14 through street fights and peer instruction.

His formal capoeira journey began at approximately age 14-15 when he joined Grupo Palmares (Paula de Fronten, SEG) in Rio de Janeiro. There he trained under Mestres Roni, Zé Macaco, and Cabelo Russo (also referred to as Cabelo Vermelho in some sources). After that group disbanded, the academy relocated to Academia Almir Ribeiro in Tijuca, then to Morro do Catumbi.

Following the dissolution of Grupo Palmares, Braga continued his training at Grupo Corda Bamba in Penha, where he studied under Mestre Touro for approximately six months. He also trained with Mestre Dentinho in Vila Isabel. By this point, he had achieved the corda amarela (yellow cord) ranking in the Rio de Janeiro capoeira federation.

Everything changed in 1975 during Rio''s Carnival. At a roda near Central do Brasil, Braga witnessed a capoeirista playing in a way he had never seen before - with distinctive physical technique and extraordinary body control, particularly in inverted positions like the Bananeira. The crowd called him "o africano" (the African). This was Mestre Moraes, a student of Mestre Pastinha from Salvador.

On July 5, 1975, at age 17-18, Braga began training with Moraes at Clube Gurilandia in Botafogo. He was among the initial cohort of students including Peçanha (later known as Cobra Mansa), Mano, Agostinho, and others. Moraes emphasized the Angola tradition, sharing knowledge he had learned from "o velho" (Mestre Pastinha) through his own teachers João Grande and João Pequeno.

In December 1975, Braga traveled to Salvador with a group that included Moraes, Neco, Marco Aurélio, Zé Carlos, Tete, and Amalha. During this pivotal journey, they visited Mestre Pastinha, who remembered Moraes by his childhood nickname "Pedrinho". The group remained in Salvador for January, participating in Bonfim festival celebrations featuring Angola roda dancing. Braga presented a berimbau to Pastinha as a gift during this visit.

On December 16, 1978, at Parque Lage in Jardim Botânico, Rio de Janeiro, Braga received the rank of Mestre in a ceremonial advancement alongside his colleagues Neco and José Carlos (Zé Carlos). Marco Aurélio was simultaneously promoted to Contra-Mestre. Mestres Camisa and Preguiça attended as honored guests. These were the first mestres of Capoeira Angola formed outside of Bahia - a historic milestone in the art''s evolution.

In December 1979, Braga made another trip to Salvador with Mestre Moraes to visit Mestre Pastinha once more.

On October 5, 1980, at a craft fair in Cosme Velho in Rio''s south zone, Braga co-founded the Grupo de Capoeira Angola Pelourinho (GCAP) along with Mestres Moraes, Neco, and Zé Carlos, with Contra-Mestres Marco Aurélio and Peçanha. The founding idea originated from Mestre Neco, who envisioned an organization to oppose the Brazilian military government''s suppression of African culture. Braga designed the group''s iconic logo - a berimbau and two zebras fighting, symbolizing capoeira''s African origins in the n''golo tradition.

Braga served as pedagogical advisor to Cinésio (Cobra Mansa), teaching foundational Angola principles. When Moraes returned to Salvador in 1982, he left the three young Rio mestres (Braga, Neco, and Zé Carlos) with full autonomy and responsibility to continue his teachings. Braga participated in GCAP workshops in 1985 and 1986, traveling with other Rio mestres and helping to train students at the Forte Santo Antonio Além do Carmo in Salvador.

In 1993-1994, Braga departed from GCAP and founded his own organization, Grupo/Escola de Capoeira Angola África Bantu (G/ECAAB), in Rio de Janeiro. One mestre emerged from this foundational group: Mestre Edson, who currently teaches capoeira in Rio and participates in inter-group encounters.

In 1997, Braga relocated to Denmark, where he established Africa Bantu groups in Aarhus and Copenhagen. The Danish branch, directed by Contramestre Andreas, grew to approximately 40 students. A 2004 gathering in Aarhus attracted 80 participants, including Mestres Edson, Neco, Zé Carlos, and Carlão.

In 2002, Braga moved to Geneva, Switzerland, where he established the Africa Bantu Geneva group. This branch operates as an officially registered association (Association de Capoeira Angola Àfrica Bantu) and maintains membership with the Ateliers d''Ethnomusicologie (ADEM). The Geneva group has approximately 20 students with Braga himself as the direct instructor.

Today, Braga remains based in Geneva, continuing to teach and organize workshops and demonstrations not only in Switzerland but across Europe and Brazil. His groups regularly attend capoeira encounters in cities including Montpellier, Lyon, Berlin, Barcelona, Bristol, and Paris. He has also taught in the United States, Denmark, the Netherlands, and Germany.',
  -- Extended content (Portuguese)
  E'Antonio Neves Braga nasceu em 13 de junho de 1957, no bairro de Lins no Rio de Janeiro, durante a época em que fazia parte do Estado da Guanabara. Cresceu em um ambiente culturalmente rico, repleto de jogos de rua, samba e tradições informais de luta, aprendendo técnicas de combate por volta dos 13-14 anos através de brigas de rua e instrução de colegas.

Sua jornada formal na capoeira começou aproximadamente aos 14-15 anos quando ingressou no Grupo Palmares (Paula de Fronten, SEG) no Rio de Janeiro. Lá treinou sob os Mestres Roni, Zé Macaco e Cabelo Russo (também referido como Cabelo Vermelho em algumas fontes). Após a dissolução do grupo, a academia mudou-se para a Academia Almir Ribeiro na Tijuca, depois para o Morro do Catumbi.

Após a dissolução do Grupo Palmares, Braga continuou seu treinamento no Grupo Corda Bamba na Penha, onde estudou com Mestre Touro por aproximadamente seis meses. Também treinou com Mestre Dentinho em Vila Isabel. Nesse ponto, já havia alcançado o grau de corda amarela na federação de capoeira do Rio de Janeiro.

Tudo mudou em 1975 durante o Carnaval do Rio. Em uma roda perto da Central do Brasil, Braga testemunhou um capoeirista jogando de uma forma que nunca tinha visto antes - com técnica física distintiva e controle corporal extraordinário, particularmente em posições invertidas como a Bananeira. A multidão o chamava de "o africano". Era Mestre Moraes, aluno de Mestre Pastinha de Salvador.

Em 5 de julho de 1975, aos 17-18 anos, Braga começou a treinar com Moraes no Clube Gurilandia em Botafogo. Estava entre o grupo inicial de alunos que incluía Peçanha (mais tarde conhecido como Cobra Mansa), Mano, Agostinho e outros. Moraes enfatizava a tradição de Angola, compartilhando conhecimentos que aprendeu de "o velho" (Mestre Pastinha) através de seus próprios mestres João Grande e João Pequeno.

Em dezembro de 1975, Braga viajou a Salvador com um grupo que incluía Moraes, Neco, Marco Aurélio, Zé Carlos, Tete e Amalha. Durante essa jornada fundamental, visitaram Mestre Pastinha, que lembrou de Moraes pelo apelido de infância "Pedrinho". O grupo permaneceu em Salvador em janeiro, participando das celebrações do festival do Bonfim com rodas de Angola. Braga presenteou Pastinha com um berimbau durante essa visita.

Em 16 de dezembro de 1978, no Parque Lage no Jardim Botânico, Rio de Janeiro, Braga recebeu o grau de Mestre em uma cerimônia de promoção junto com seus colegas Neco e José Carlos (Zé Carlos). Marco Aurélio foi simultaneamente promovido a Contra-Mestre. Os Mestres Camisa e Preguiça compareceram como convidados de honra. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia - um marco histórico na evolução da arte.

Em dezembro de 1979, Braga fez outra viagem a Salvador com Mestre Moraes para visitar Mestre Pastinha novamente.

Em 5 de outubro de 1980, em uma feira de artesanato em Cosme Velho na zona sul do Rio, Braga co-fundou o Grupo de Capoeira Angola Pelourinho (GCAP) junto com os Mestres Moraes, Neco e Zé Carlos, com os Contra-Mestres Marco Aurélio e Peçanha. A ideia de fundação originou-se de Mestre Neco, que vislumbrou uma organização para se opor à supressão da cultura africana pelo governo militar brasileiro. Braga desenhou o icônico logotipo do grupo - um berimbau e duas zebras lutando, simbolizando as origens africanas da capoeira na tradição do n''golo.

Braga serviu como orientador pedagógico de Cinésio (Cobra Mansa), ensinando princípios fundamentais de Angola. Quando Moraes retornou a Salvador em 1982, deixou os três jovens mestres cariocas (Braga, Neco e Zé Carlos) com total autonomia e responsabilidade para continuar seus ensinamentos. Braga participou de oficinas do GCAP em 1985 e 1986, viajando com outros mestres cariocas e ajudando a treinar alunos no Forte Santo Antonio Além do Carmo em Salvador.

Em 1993-1994, Braga deixou o GCAP e fundou sua própria organização, Grupo/Escola de Capoeira Angola África Bantu (G/ECAAB), no Rio de Janeiro. Um mestre surgiu deste grupo fundacional: Mestre Edson, que atualmente ensina capoeira no Rio e participa de encontros entre grupos.

Em 1997, Braga mudou-se para a Dinamarca, onde estabeleceu grupos Africa Bantu em Aarhus e Copenhagen. A filial dinamarquesa, dirigida pelo Contramestre Andreas, cresceu para aproximadamente 40 alunos. Um encontro em Aarhus em 2004 atraiu 80 participantes, incluindo os Mestres Edson, Neco, Zé Carlos e Carlão.

Em 2002, Braga mudou-se para Genebra, Suíça, onde estabeleceu o grupo Africa Bantu Genebra. Este grupo opera como uma associação oficialmente registrada (Association de Capoeira Angola Àfrica Bantu) e mantém filiação aos Ateliers d''Ethnomusicologie (ADEM). O grupo de Genebra tem aproximadamente 20 alunos com o próprio Braga como instrutor direto.

Hoje, Braga permanece baseado em Genebra, continuando a ensinar e organizar workshops e demonstrações não apenas na Suíça, mas em toda a Europa e Brasil. Seus grupos regularmente participam de encontros de capoeira em cidades como Montpellier, Lyon, Berlim, Barcelona, Bristol e Paris. Também ensinou nos Estados Unidos, Dinamarca, Holanda e Alemanha.',
  -- Achievements (English)
  E'- Co-founder of Grupo de Capoeira Angola Pelourinho (GCAP) on October 5, 1980
- Designer of the iconic GCAP logo (berimbau + two zebras fighting, referencing n''golo origins)
- One of the first mestres of Capoeira Angola formed outside of Bahia (December 16, 1978)
- Founder of Grupo/Escola de Capoeira Angola África Bantu (G/ECAAB) in 1993/1994
- Met Mestre Pastinha in Salvador (December 1975 and December 1979)
- Established Africa Bantu groups in Denmark (Aarhus and Copenhagen, 1997) and Switzerland (Geneva, 2002)
- Pedagogical advisor to Mestre Cobra Mansa during GCAP formation
- Participated in GCAP workshops at Forte Santo Antonio Além do Carmo (1985, 1986)
- Trained Mestre Edson, who continues teaching in Rio de Janeiro
- International workshops and demonstrations in USA, Denmark, Netherlands, Germany, France, and Switzerland',
  -- Achievements (Portuguese)
  E'- Co-fundador do Grupo de Capoeira Angola Pelourinho (GCAP) em 5 de outubro de 1980
- Designer do icônico logotipo do GCAP (berimbau + duas zebras lutando, referenciando origens do n''golo)
- Um dos primeiros mestres de Capoeira Angola formados fora da Bahia (16 de dezembro de 1978)
- Fundador do Grupo/Escola de Capoeira Angola África Bantu (G/ECAAB) em 1993/1994
- Conheceu Mestre Pastinha em Salvador (dezembro de 1975 e dezembro de 1979)
- Estabeleceu grupos Africa Bantu na Dinamarca (Aarhus e Copenhagen, 1997) e Suíça (Genebra, 2002)
- Orientador pedagógico de Mestre Cobra Mansa durante a formação do GCAP
- Participou de oficinas do GCAP no Forte Santo Antonio Além do Carmo (1985, 1986)
- Formou Mestre Edson, que continua ensinando no Rio de Janeiro
- Workshops e demonstrações internacionais nos EUA, Dinamarca, Holanda, Alemanha, França e Suíça',
  -- Researcher notes (English)
  E'BIRTH DATE: June 13, 1957 - Confirmed by Wikipedia, Lalaue, CapoeiraHub, Africa Bantu website.

BIRTH PLACE: Lins neighborhood, Rio de Janeiro (during Guanabara state period) - from Africa Bantu website (africabantu.wordpress.com).

TEACHERS:
- Mestres Roni, Zé Macaco, Cabelo Russo (Cabelo Vermelho) at Grupo Palmares (~1971-1975)
- Mestre Touro at Grupo Corda Bamba, Penha (~6 months after Palmares disbanded)
- Mestre Dentinho in Vila Isabel (brief training)
- Mestre Moraes from July 5, 1975 (primary teacher for Capoeira Angola)

STUDENTS:
- Mestre Edson (currently teaching in Rio de Janeiro)
- Contramestre Andreas (leads Denmark branch, ~40 students)
- Approximately 20 students in Geneva group

MESTRE TITLE: December 16, 1978 at Parque Lage, Jardim Botânico, Rio de Janeiro. Received alongside Neco and Zé Carlos; Marco Aurélio became Contra-Mestre same day. First mestres of Capoeira Angola formed outside Bahia.

GCAP FOUNDING: October 5, 1980 at Cosme Velho artisan fair. Founding idea from Neco. Logo designed by Braga. Founding mestres: Moraes, Braga, Neco, Zé Carlos. Founding contra-mestres: Marco Aurélio, Peçanha (Cobra Mansa).

PASTINHA VISITS:
- December 1975: First visit with Moraes, Neco, Marco Aurélio, Zé Carlos, Tete, Amalha. Pastinha remembered Moraes as "Pedrinho". Braga presented berimbau to Pastinha.
- December 1979: Second visit with Moraes.

AFRICA BANTU FOUNDING:
- Sources cite both 1993 and 1994 for founding year. Using 1993/1994 range.
- Full name: Grupo/Escola de Capoeira Angola África Bantu (G/ECAAB)
- Founded in Rio de Janeiro after departing GCAP

INTERNATIONAL TIMELINE:
- 1997: Moved to Denmark, established groups in Aarhus and Copenhagen
- 2002: Moved to Geneva, Switzerland; established Geneva group
- Present: Based in Geneva, continues teaching and international workshops

CORDA RANKING: Achieved corda amarela (yellow cord) in Rio de Janeiro capoeira federation before meeting Moraes (1975).

NOTE: Africa Bantu website states biography text is "ainda de possíveis ajustes" (still subject to possible adjustments).

SOURCES:
- africabantu.wordpress.com/mestre-braga/ (primary biographical source)
- africabantu.wordpress.com/notas/ (historical notes)
- lalaue.com/learn-capoeira/mestre-braga/
- capoeirahub.net/mestres/649edb8548085400142322fa-mestre-braga
- Wikipedia (EN) via web search
- Moraes profile in our database (moraes.sql, moraes.md)
- Touro profile in our database (touro.sql) confirms Braga trained at Grupo Corda Bamba',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 13 de junho de 1957 - Confirmado por Wikipedia, Lalaue, CapoeiraHub, site Africa Bantu.

LOCAL DE NASCIMENTO: Bairro de Lins, Rio de Janeiro (durante período do estado da Guanabara) - do site Africa Bantu (africabantu.wordpress.com).

MESTRES:
- Mestres Roni, Zé Macaco, Cabelo Russo (Cabelo Vermelho) no Grupo Palmares (~1971-1975)
- Mestre Touro no Grupo Corda Bamba, Penha (~6 meses após dissolução do Palmares)
- Mestre Dentinho em Vila Isabel (treinamento breve)
- Mestre Moraes a partir de 5 de julho de 1975 (mestre principal para Capoeira Angola)

ALUNOS:
- Mestre Edson (atualmente ensinando no Rio de Janeiro)
- Contramestre Andreas (lidera filial da Dinamarca, ~40 alunos)
- Aproximadamente 20 alunos no grupo de Genebra

TÍTULO DE MESTRE: 16 de dezembro de 1978 no Parque Lage, Jardim Botânico, Rio de Janeiro. Recebido junto com Neco e Zé Carlos; Marco Aurélio tornou-se Contra-Mestre no mesmo dia. Primeiros mestres de Capoeira Angola formados fora da Bahia.

FUNDAÇÃO DO GCAP: 5 de outubro de 1980 na feira de artesanato de Cosme Velho. Ideia de fundação de Neco. Logotipo desenhado por Braga. Mestres fundadores: Moraes, Braga, Neco, Zé Carlos. Contra-mestres fundadores: Marco Aurélio, Peçanha (Cobra Mansa).

VISITAS A PASTINHA:
- Dezembro de 1975: Primeira visita com Moraes, Neco, Marco Aurélio, Zé Carlos, Tete, Amalha. Pastinha lembrou de Moraes como "Pedrinho". Braga presenteou berimbau a Pastinha.
- Dezembro de 1979: Segunda visita com Moraes.

FUNDAÇÃO DO AFRICA BANTU:
- Fontes citam tanto 1993 quanto 1994 para ano de fundação. Usando faixa 1993/1994.
- Nome completo: Grupo/Escola de Capoeira Angola África Bantu (G/ECAAB)
- Fundado no Rio de Janeiro após deixar o GCAP

CRONOLOGIA INTERNACIONAL:
- 1997: Mudou-se para Dinamarca, estabeleceu grupos em Aarhus e Copenhagen
- 2002: Mudou-se para Genebra, Suíça; estabeleceu grupo de Genebra
- Presente: Baseado em Genebra, continua ensinando e workshops internacionais

GRADUAÇÃO DE CORDA: Alcançou corda amarela na federação de capoeira do Rio de Janeiro antes de conhecer Moraes (1975).

NOTA: Site Africa Bantu afirma que texto biográfico está "ainda de possíveis ajustes".

FONTES:
- africabantu.wordpress.com/mestre-braga/ (fonte biográfica principal)
- africabantu.wordpress.com/notas/ (notas históricas)
- lalaue.com/learn-capoeira/mestre-braga/
- capoeirahub.net/mestres/649edb8548085400142322fa-mestre-braga
- Wikipedia (EN) via busca web
- Perfil de Moraes em nosso banco de dados (moraes.sql, moraes.md)
- Perfil de Touro em nosso banco de dados (touro.sql) confirma que Braga treinou no Grupo Corda Bamba'
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
