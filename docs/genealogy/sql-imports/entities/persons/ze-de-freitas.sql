-- ============================================================
-- GENEALOGY PERSON: Zé de Freitas
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH DATE: April 29, 1926 (exact)
-- Multiple sources confirm: Museu da Pessoa, Wiki Urucungo, Portal Capoeira
-- Birthplace: Macaquinhos, Bahia (small locality)
-- Residence after 1999: Alagoinhas, Bahia
--
-- DEATH YEAR: Unknown
-- As of 2009 (tribute event), he was 83 years old
-- As of ~2014-2016, sources reported him "nearly 90" with health problems
-- No confirmed death date found in available sources
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
  'José de Freitas',
  'Zé de Freitas',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
    'https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-z%C3%A9-de-freitas',
    'https://portalcapoeira.com/capoeira/eventos-agenda/sao-paulo-homenagem-a-mestre-ze-de-freitas/'
  ]::text[],
  -- Style
  'angola'::genealogy.style,
  E'Zé de Freitas trained in Capoeira Angola under Mestre Caiçara and later became a disciple of Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, known as "o Poeta"). He brought both styles to São Paulo, where he also taught freestyle wrestling (luta livre) alongside capoeira at the CMTC Club. His academy, Associação de Lutas Unidas Capoeira Freitas, reflected this mixed martial arts approach.',
  E'Zé de Freitas treinou Capoeira Angola com Mestre Caiçara e depois se tornou discípulo de Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, conhecido como "o Poeta"). Ele levou ambos os estilos para São Paulo, onde também ensinava luta livre junto com capoeira no Clube CMTC. Sua academia, Associação de Lutas Unidas Capoeira Freitas, refletia essa abordagem de artes marciais mistas.',
  -- Birth
  1926, 'exact'::genealogy.date_precision, 'Macaquinhos, Bahia, Brazil',
  -- Death (unknown)
  NULL, NULL::genealogy.date_precision, NULL,
  -- bio_en
  E'José de Freitas was born on April 29, 1926, in Macaquinhos, a small locality in Bahia. In 1946, at the age of 20, he began learning capoeira under Mestre Caiçara, the hard-fighting Angoleiro known for his iconic bengala (walking cane). After some time, Caiçara introduced him to the legendary Mestre Waldemar Rodrigues da Paixão, known as "o Poeta" (the Poet), at the famous Barracão in Liberdade, Salvador. Under Waldemar''s tutelage, Zé de Freitas refined his technique and musical skills, becoming his disciple.

In 1959, Zé de Freitas arrived in São Paulo—still during the era when capoeira was prohibited. His beginnings were humble: he started teaching capoeira in a small corridor of a boarding house (pensão) in the Mooca neighborhood, measuring only about 3 meters by 2 meters. Despite these modest circumstances, he persisted.

He later established himself at the CMTC Club (Companhia Municipal de Transportes Coletivos), where in addition to capoeira he taught freestyle wrestling (luta livre). The CMTC Club became a pivotal meeting point for Bahian capoeiristas arriving in São Paulo. It was at his classes there that capoeiristas like Mestre Brasília, Mestre Suassuna, and Mestre Joel first met—an encounter that would shape the future of São Paulo capoeira.

Mestre Pinatti, one of the few native paulistas dedicated to capoeira in the 1960s, consolidated his capoeira learning with Zé de Freitas and through him connected with the Bahian community. Zé de Freitas served as a unifier of capoeiristas in São Paulo, bridging different backgrounds and traditions.

In São Paulo, he founded his own academy: the Associação de Lutas Unidas Capoeira Freitas, located in the Sapopemba neighborhood. This academy trained a generation of important capoeiristas including Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho, and Mestre Dulcídio, who later assumed leadership of the group.

In 1971, when Mestre Bimba visited São Paulo at the invitation of Mestre Onça, he recognized a group of mestres as the "Percursores da Capoeira em São Paulo" (Pioneers of Capoeira in São Paulo)—the famous "Grupo dos Nove" (Group of Nine). Zé de Freitas was among these nine pioneers: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Onça, and himself.

In 1974, the Federação Paulista de Capoeira was founded—the first capoeira federation in the world. Zé de Freitas''s academy was one of the eight founding associations, alongside K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, and Ilha de Itapuã.

Beyond teaching, Mestre Freitas had a colorful career outside capoeira. He participated in telenovelas (Brazilian soap operas) and worked as a security guard for Manoel da Nóbrega, the main comedian of the popular TV show "Praça da Alegria". Most notably, he was one of the trainers of soccer legend Pelé for the 1972 film "A Marcha de Chico Bondade".

After 40 years in São Paulo (1959-1999), Zé de Freitas returned to his homeland, settling in Alagoinhas, Bahia. His last visit to São Paulo was in June 2007, when he participated in the documentary "Reunião dos 9" (Reunion of the Nine), which sought to preserve the history of São Paulo capoeira. He was accompanied by his eternal student and friend Mestre Dulcídio throughout the trip.

In August 2009, a tribute event was held in his honor at Escola Vera Cruz in Vila Leopoldina, São Paulo. Organized by his students and the capoeira community, the event featured a roundtable discussion, classes by Mestre Brasília, a capoeira roda, and a presentation on the "Ação Griô" memory preservation project. The event was filmed for a DVD, with proceeds benefiting Mestre Freitas.

At age 88, Zé de Freitas was reported to be living in Alagoinhas with vision problems that prevented him from actively teaching. He is considered one of the most important pioneers who brought capoeira to São Paulo and established the foundation for the art''s development in Brazil''s largest city.',
  -- bio_pt
  E'José de Freitas nasceu em 29 de abril de 1926, em Macaquinhos, pequena localidade na Bahia. Em 1946, aos 20 anos, começou a aprender capoeira com Mestre Caiçara, o Angoleiro de luta dura conhecido por sua icônica bengala. Depois de algum tempo, Caiçara o apresentou ao lendário Mestre Waldemar Rodrigues da Paixão, conhecido como "o Poeta", no famoso Barracão na Liberdade, Salvador. Sob a tutela de Waldemar, Zé de Freitas aperfeiçoou sua técnica e habilidades musicais, tornando-se seu discípulo.

Em 1959, Zé de Freitas chegou a São Paulo—ainda durante a época em que a capoeira era proibida. Seus começos foram humildes: começou a ensinar capoeira em um pequeno corredor de uma pensão no bairro da Mooca, medindo apenas cerca de 3 metros por 2 metros. Apesar dessas circunstâncias modestas, ele persistiu.

Mais tarde, estabeleceu-se no Clube CMTC (Companhia Municipal de Transportes Coletivos), onde além de capoeira ensinava luta livre. O Clube CMTC tornou-se um ponto de encontro fundamental para capoeiristas baianos chegando a São Paulo. Foi em suas aulas lá que capoeiristas como Mestre Brasília, Mestre Suassuna e Mestre Joel se conheceram pela primeira vez—um encontro que moldaria o futuro da capoeira paulista.

Mestre Pinatti, um dos poucos paulistas nativos dedicados à capoeira nos anos 1960, consolidou seu aprendizado de capoeira com Zé de Freitas e através dele se conectou com a comunidade baiana. Zé de Freitas serviu como um unificador de capoeiristas em São Paulo, fazendo a ponte entre diferentes origens e tradições.

Em São Paulo, fundou sua própria academia: a Associação de Lutas Unidas Capoeira Freitas, localizada no bairro de Sapopemba. Esta academia treinou uma geração de capoeiristas importantes incluindo Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho e Mestre Dulcídio, que mais tarde assumiu a liderança do grupo.

Em 1971, quando Mestre Bimba visitou São Paulo a convite de Mestre Onça, ele reconheceu um grupo de mestres como os "Percursores da Capoeira em São Paulo"—o famoso "Grupo dos Nove". Zé de Freitas estava entre esses nove pioneiros: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Onça e ele próprio.

Em 1974, foi fundada a Federação Paulista de Capoeira—a primeira federação de capoeira do mundo. A academia de Zé de Freitas foi uma das oito associações fundadoras, ao lado de K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz e Ilha de Itapuã.

Além de ensinar, Mestre Freitas teve uma carreira colorida fora da capoeira. Participou de telenovelas brasileiras e trabalhou como segurança de Manoel da Nóbrega, o principal comediante do popular programa de TV "Praça da Alegria". Mais notavelmente, foi um dos treinadores da lenda do futebol Pelé para o filme de 1972 "A Marcha de Chico Bondade".

Após 40 anos em São Paulo (1959-1999), Zé de Freitas retornou à sua terra natal, estabelecendo-se em Alagoinhas, Bahia. Sua última visita a São Paulo foi em junho de 2007, quando participou do documentário "Reunião dos 9", que buscava preservar a história da capoeira paulista. Ele foi acompanhado por seu eterno aluno e amigo Mestre Dulcídio durante toda a viagem.

Em agosto de 2009, um evento de homenagem foi realizado em sua honra na Escola Vera Cruz em Vila Leopoldina, São Paulo. Organizado por seus alunos e pela comunidade de capoeira, o evento contou com mesa redonda, aulas de Mestre Brasília, roda de capoeira e apresentação sobre o projeto de preservação da memória "Ação Griô". O evento foi filmado para um DVD, com a renda revertida para Mestre Freitas.

Aos 88 anos, Zé de Freitas foi relatado como vivendo em Alagoinhas com problemas de visão que o impediam de ensinar ativamente. Ele é considerado um dos pioneiros mais importantes que trouxeram a capoeira para São Paulo e estabeleceram a base para o desenvolvimento da arte na maior cidade do Brasil.',
  -- achievements_en
  E'- 1946: Began capoeira training under Mestre Caiçara in Bahia
- 1946+: Became disciple of Mestre Waldemar da Liberdade (o Poeta)
- 1959: Arrived in São Paulo; began teaching in boarding house corridor in Mooca
- 1960s: Established at CMTC Club; taught capoeira and freestyle wrestling; served as meeting point for Bahian capoeiristas
- 1960s: Founded Associação de Lutas Unidas Capoeira Freitas in Sapopemba, São Paulo
- 1971: Recognized by Mestre Bimba as one of "Grupo dos Nove" pioneers of capoeira in São Paulo
- 1972: Trained Pelé for the film "A Marcha de Chico Bondade"
- 1974: Academy was one of 8 founding associations of Federação Paulista de Capoeira
- 1999: Returned to Alagoinhas, Bahia after 40 years in São Paulo
- 2007: Participated in documentary "Reunião dos 9" (Reunion of the Nine)
- 2009: Honored at tribute event at Escola Vera Cruz, São Paulo
- Trained notable students: Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho, Mestre Dulcídio
- Worked as security for comedian Manoel da Nóbrega (Praça da Alegria)
- Appeared in Brazilian telenovelas',
  -- achievements_pt
  E'- 1946: Iniciou treinamento de capoeira com Mestre Caiçara na Bahia
- 1946+: Tornou-se discípulo de Mestre Waldemar da Liberdade (o Poeta)
- 1959: Chegou a São Paulo; começou a ensinar em corredor de pensão na Mooca
- Anos 1960: Estabeleceu-se no Clube CMTC; ensinou capoeira e luta livre; serviu como ponto de encontro para capoeiristas baianos
- Anos 1960: Fundou Associação de Lutas Unidas Capoeira Freitas em Sapopemba, São Paulo
- 1971: Reconhecido por Mestre Bimba como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo
- 1972: Treinou Pelé para o filme "A Marcha de Chico Bondade"
- 1974: Academia foi uma das 8 associações fundadoras da Federação Paulista de Capoeira
- 1999: Retornou a Alagoinhas, Bahia após 40 anos em São Paulo
- 2007: Participou do documentário "Reunião dos 9"
- 2009: Homenageado em evento tributo na Escola Vera Cruz, São Paulo
- Treinou alunos notáveis: Mestre Pinatti, Mestre Joel, Mestre Mello, Mestre Serginho, Mestre Dulcídio
- Trabalhou como segurança do comediante Manoel da Nóbrega (Praça da Alegria)
- Apareceu em telenovelas brasileiras',
  -- notes_en
  E'BIRTH DATE: April 29, 1926 (exact)
- Multiple sources confirm: Museu da Pessoa, Wiki Urucungo, Portal Capoeira
- Birthplace: Macaquinhos, Bahia (small locality)

DEATH DATE: Unknown
- As of 2009 tribute event, he was 83 years old
- As of ~2014-2016, sources reported him "nearly 90" with health problems (vision issues)
- No confirmed death date found in available sources
- Would be 99-100 years old if still alive in 2026

NAME VARIATIONS:
- "José de Freitas" (full name)
- "Zé de Freitas" (common apelido)
- "Mestre Freitas" (used in some sources)
- "Mestre Zé de Freitas" (full title)

RESIDENCE:
- 1926-1959: Bahia (Macaquinhos, later Alagoinhas area)
- 1959-1999: São Paulo (40 years)
- 1999-: Alagoinhas, Bahia

TEACHERS:
- Mestre Caiçara (Antônio Conceição Moraes) - initial teacher (1946)
- Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, "o Poeta") - primary teacher/mentor

STUDENTS:
- Mestre Pinatti (Djamir Furtado Pinatti) - native paulista who connected with Bahian community through Zé de Freitas
- Mestre Joel - one of first to meet Suassuna and Brasília at CMTC Club
- Mestre Mello (Antônio Gonçalves de Mello)
- Mestre Serginho
- Mestre Dulcídio - "eternal student and friend"; now leads Associação de Lutas Unidas Capoeira

ROLE AS UNIFIER:
- His CMTC Club classes served as meeting point for Bahian capoeiristas arriving in São Paulo
- Suassuna, Brasília, and Joel first met at his classes
- Bridged different traditions and backgrounds in São Paulo capoeira scene

GRUPO DOS NOVE (1971):
- Recognized by Mestre Bimba during his São Paulo visit organized by Mestre Onça
- The nine pioneers: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, Onça
- Received symbolic recognition as "Percursores da Capoeira em São Paulo"

FEDERAÇÃO PAULISTA DE CAPOEIRA (July 14, 1974):
- His academy was one of 8 founding associations
- Other founding associations: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã

MEDIA APPEARANCES:
- 1972: Trained Pelé for film "A Marcha de Chico Bondade"
- Various: Appeared in Brazilian telenovelas
- 2007: Documentary "Reunião dos 9" (Reunion of the Nine)
- 2009: Tribute event filmed for DVD

OTHER WORK:
- Security guard for Manoel da Nóbrega (comedian, "Praça da Alegria")
- Taught freestyle wrestling (luta livre) at CMTC Club alongside capoeira

ACADEMY:
- Name: Associação de Lutas Unidas Capoeira Freitas
- Location: Sapopemba neighborhood, São Paulo
- Current leadership: Mestre Dulcídio
- Note: The "Lutas Unidas" (United Fights) name reflects his teaching of both capoeira and wrestling',
  -- notes_pt
  E'DATA DE NASCIMENTO: 29 de abril de 1926 (exata)
- Múltiplas fontes confirmam: Museu da Pessoa, Wiki Urucungo, Portal Capoeira
- Local de nascimento: Macaquinhos, Bahia (pequena localidade)

DATA DE FALECIMENTO: Desconhecida
- Em 2009 no evento de homenagem, ele tinha 83 anos
- Por volta de 2014-2016, fontes relatavam ele "quase 90" com problemas de saúde (visão)
- Nenhuma data de falecimento confirmada encontrada nas fontes disponíveis
- Teria 99-100 anos se ainda vivo em 2026

VARIAÇÕES DO NOME:
- "José de Freitas" (nome completo)
- "Zé de Freitas" (apelido comum)
- "Mestre Freitas" (usado em algumas fontes)
- "Mestre Zé de Freitas" (título completo)

RESIDÊNCIA:
- 1926-1959: Bahia (Macaquinhos, depois área de Alagoinhas)
- 1959-1999: São Paulo (40 anos)
- 1999-: Alagoinhas, Bahia

MESTRES:
- Mestre Caiçara (Antônio Conceição Moraes) - professor inicial (1946)
- Mestre Waldemar da Liberdade (Waldemar Rodrigues da Paixão, "o Poeta") - professor principal/mentor

ALUNOS:
- Mestre Pinatti (Djamir Furtado Pinatti) - paulista nativo que se conectou com comunidade baiana através de Zé de Freitas
- Mestre Joel - um dos primeiros a conhecer Suassuna e Brasília no Clube CMTC
- Mestre Mello (Antônio Gonçalves de Mello)
- Mestre Serginho
- Mestre Dulcídio - "eterno aluno e amigo"; agora lidera Associação de Lutas Unidas Capoeira

PAPEL COMO UNIFICADOR:
- Suas aulas no Clube CMTC serviram como ponto de encontro para capoeiristas baianos chegando em São Paulo
- Suassuna, Brasília e Joel se conheceram em suas aulas
- Fez a ponte entre diferentes tradições e origens na cena de capoeira paulista

GRUPO DOS NOVE (1971):
- Reconhecido por Mestre Bimba durante sua visita a São Paulo organizada por Mestre Onça
- Os nove pioneiros: Suassuna, Brasília, Joel, Gilvan, Limão, Silvestre, Pinatti, Zé de Freitas, Onça
- Recebeu reconhecimento simbólico como "Percursores da Capoeira em São Paulo"

FEDERAÇÃO PAULISTA DE CAPOEIRA (14 de julho de 1974):
- Sua academia foi uma das 8 associações fundadoras
- Outras associações fundadoras: K''Poeira, São Bento Pequeno, São Bento Grande, Cordão de Ouro, Quilombo dos Palmares, Vera Cruz, Ilha de Itapuã

APARIÇÕES NA MÍDIA:
- 1972: Treinou Pelé para o filme "A Marcha de Chico Bondade"
- Diversos: Apareceu em telenovelas brasileiras
- 2007: Documentário "Reunião dos 9"
- 2009: Evento tributo filmado para DVD

OUTROS TRABALHOS:
- Segurança de Manoel da Nóbrega (comediante, "Praça da Alegria")
- Ensinou luta livre no Clube CMTC junto com capoeira

ACADEMIA:
- Nome: Associação de Lutas Unidas Capoeira Freitas
- Local: Bairro de Sapopemba, São Paulo
- Liderança atual: Mestre Dulcídio
- Nota: O nome "Lutas Unidas" reflete seu ensino de capoeira e luta livre'
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
