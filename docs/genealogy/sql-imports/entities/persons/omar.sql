-- ============================================================
-- GENEALOGY PERSON: Omar
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH YEAR: 1957 per multiple sources (capoeira-uniao.ch)
-- Pioneer of capoeira in German-speaking Switzerland
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
  'Omar Tisereve da Conceição',
  'Omar',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeira-uniao.ch/mestre-omar/', 'https://www.lalaue.com/baden/capoeira-uniao/', 'https://capoeira.iphan.gov.br/grupo/infor/638']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in the tradition of Mestre Bimba through Mestre Ezequiel. His approach emphasizes capoeira as "arte de fazer amigos" (the art of making friends), combining technical excellence with community building. Pioneer who established the infrastructure for Capoeira Regional in German-speaking Switzerland.',
  E'Treinado na tradição de Mestre Bimba através de Mestre Ezequiel. Sua abordagem enfatiza a capoeira como "arte de fazer amigos", combinando excelência técnica com construção de comunidade. Pioneiro que estabeleceu a infraestrutura da Capoeira Regional na Suíça de língua alemã.',
  -- Life dates
  1957,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Omar Tisereve da Conceição, known as Mestre Omar, was born in 1957 in Salvador da Bahia, Brazil. He first encountered capoeira as a child through street rodas before formal training. At age 12, he began studying under Mestre Ezequiel at the Escola de Capoeira Mestre Bimba, establishing a direct lineage to the founder of Capoeira Regional.

From age 17, Omar regularly performed with folkloric and show groups, developing his skills as both performer and practitioner. He also received further education and teaching experience at the Escola de Arte e Dança in Bahia, broadening his understanding of Brazilian cultural arts.

In 1985, Omar moved to Switzerland, becoming one of the pioneers to bring capoeira to the country. In Basel, he founded the first capoeira group and began giving courses and workshops throughout Switzerland and Germany.

In 1994, Mestre Omar founded Grupo de Capoeira União, an international association for the cultivation of Capoeira Regional. The organization''s motto, "arte de fazer amigos" (the art of making friends), reflects his philosophy of capoeira as a tool for community building.

In 1996, he achieved two major milestones. He successfully organized the first Swiss "Ostertreffen" (Easter meeting), establishing an annual gathering tradition that continues to this day. Later that same year, in the autumn, his teacher Mestre Ezequiel traveled from Brazil to Baden, Switzerland, for a momentous occasion: the inauguration of the Academia de Capoeira União in the Merkerareal—the first capoeira school in German-speaking Switzerland. During this ceremony, on August 30, 1996, Mestre Ezequiel personally presented Omar with the white corda, elevating him to the rank of Mestre.

This would be one of Ezequiel''s final acts as a teacher. He died in March 1997, leaving Omar as one of the custodians of his lineage.

Today, Grupo de Capoeira União operates across multiple countries including Switzerland, Germany, Italy, and Brazil. The organization is registered with IPHAN as both a Ponto de Cultura and Ponto de Memória, with headquarters on Itaparica Island in Bahia. In Switzerland alone, academies operate in Baden (headquarters), Aarau, Chur, Lucerne, Schaffhausen, St. Gallen, Winterthur, Wetzikon, and Zofingen.

Mestre Omar continues to lead the organization and teach at the Baden academy. He has expanded his work beyond the roda, giving courses and workshops at public schools and participating in community projects including "Gewalt macht Schule" (Violence Goes to School) conferences in Muttenz, "Welt in Basel," and the charitable initiative "Ajuda Brasil Crianças."

After more than 40 years in capoeira, Mestre Omar maintains that he continues learning. He supports his students, professors, and mestrandos, nurturing the next generation of the Bimba-Ezequiel lineage in Europe.',
  -- bio_pt
  E'Omar Tisereve da Conceição, conhecido como Mestre Omar, nasceu em 1957 em Salvador da Bahia, Brasil. Ele teve seu primeiro contato com a capoeira ainda criança nas rodas de rua antes do treinamento formal. Aos 12 anos, começou a estudar com Mestre Ezequiel na Escola de Capoeira Mestre Bimba, estabelecendo uma linhagem direta com o fundador da Capoeira Regional.

A partir dos 17 anos, Omar se apresentou regularmente com grupos folclóricos e de shows, desenvolvendo suas habilidades como artista e praticante. Também recebeu educação adicional e experiência de ensino na Escola de Arte e Dança na Bahia, ampliando sua compreensão das artes culturais brasileiras.

Em 1985, Omar mudou-se para a Suíça, tornando-se um dos pioneiros a levar a capoeira para o país. Em Basel, fundou o primeiro grupo de capoeira e começou a dar cursos e oficinas em toda a Suíça e Alemanha.

Em 1994, Mestre Omar fundou o Grupo de Capoeira União, uma associação internacional para o cultivo da Capoeira Regional. O lema da organização, "arte de fazer amigos", reflete sua filosofia da capoeira como ferramenta de construção de comunidade.

Em 1996, ele alcançou dois marcos importantes. Organizou com sucesso o primeiro "Ostertreffen" (Encontro de Páscoa) suíço, estabelecendo uma tradição de encontro anual que continua até hoje. Mais tarde naquele mesmo ano, no outono, seu professor Mestre Ezequiel viajou do Brasil para Baden, Suíça, para uma ocasião marcante: a inauguração da Academia de Capoeira União no Merkerareal—a primeira escola de capoeira na Suíça de língua alemã. Durante esta cerimônia, em 30 de agosto de 1996, Mestre Ezequiel pessoalmente apresentou a Omar a corda branca, elevando-o ao posto de Mestre.

Este seria um dos últimos atos de Ezequiel como professor. Ele faleceu em março de 1997, deixando Omar como um dos guardiões de sua linhagem.

Hoje, o Grupo de Capoeira União opera em vários países, incluindo Suíça, Alemanha, Itália e Brasil. A organização está registrada no IPHAN como Ponto de Cultura e Ponto de Memória, com sede na Ilha de Itaparica na Bahia. Somente na Suíça, academias funcionam em Baden (sede), Aarau, Chur, Lucerna, Schaffhausen, St. Gallen, Winterthur, Wetzikon e Zofingen.

Mestre Omar continua liderando a organização e ensinando na academia de Baden. Ele expandiu seu trabalho além da roda, dando cursos e oficinas em escolas públicas e participando de projetos comunitários, incluindo conferências "Gewalt macht Schule" (Violência nas Escolas) em Muttenz, "Welt in Basel" e a iniciativa beneficente "Ajuda Brasil Crianças."

Após mais de 40 anos na capoeira, Mestre Omar afirma que continua aprendendo. Ele apoia seus alunos, professores e mestrandos, nutrindo a próxima geração da linhagem Bimba-Ezequiel na Europa.',
  -- achievements_en
  E'Founded first capoeira group in Basel, Switzerland (1985); Founded Grupo de Capoeira União (1994); Organized first Swiss "Ostertreffen" (Easter gathering, 1996); Inaugurated first capoeira school in German-speaking Switzerland - Academia de Capoeira União in Baden (1996); Received Mestre title from Mestre Ezequiel (August 30, 1996); Pioneer of Capoeira Regional in German-speaking Switzerland; Grupo de Capoeira União recognized as Ponto de Cultura and Ponto de Memória by IPHAN; Expanded organization to 4 countries (Switzerland, Germany, Italy, Brazil); Built network of 12 contra-mestres and 16 professors',
  -- achievements_pt
  E'Fundou o primeiro grupo de capoeira em Basel, Suíça (1985); Fundou o Grupo de Capoeira União (1994); Organizou o primeiro "Ostertreffen" (Encontro de Páscoa) suíço (1996); Inaugurou a primeira escola de capoeira na Suíça de língua alemã - Academia de Capoeira União em Baden (1996); Recebeu título de Mestre de Mestre Ezequiel (30 de agosto de 1996); Pioneiro da Capoeira Regional na Suíça de língua alemã; Grupo de Capoeira União reconhecido como Ponto de Cultura e Ponto de Memória pelo IPHAN; Expandiu a organização para 4 países (Suíça, Alemanha, Itália, Brasil); Construiu rede de 12 contra-mestres e 16 professores',
  -- notes_en
  E'BIRTH YEAR (1957, year):
Multiple sources confirm born 1957 in Salvador, Bahia.

FULL NAME DISCREPANCY:
- "Omar da Conceição" - most sources
- "Omar Tisereve da Conceição" - IPHAN registration
Using full name from IPHAN as most official source.

TRAINING:
- Age 12 (~1969): Began training with Mestre Ezequiel at Escola de Capoeira Mestre Bimba
- Age 17+ (~1974+): Performed with folklore and show groups
- Continued education at Escola de Arte e Dança, Bahia

MESTRE TITLE DATE:
- August 30, 1996: Received white corda from Mestre Ezequiel in Baden, Switzerland
- Ceremony coincided with Academia de Capoeira União inauguration

PIONEER STATUS:
- 1985: First capoeira group in Basel
- 1996: First capoeira school in German-speaking Switzerland (Baden)

GRUPO DE CAPOEIRA UNIÃO:
- Founded: 1994
- IPHAN Registration: Yes (Ponto de Cultura, Ponto de Memória)
- HQ: Itaparica, Bahia (CEP 44460-000)
- Countries: Brazil, Switzerland, Germany, Italy
- Swiss locations: Baden (HQ), Aarau, Chur, Lucerne, Schaffhausen, St. Gallen, Winterthur, Wetzikon, Zofingen
- International: Monza/Trieste (Italy), Ravensburg (Germany), Rio de Janeiro (Brazil)
- Structure: 1 mestre, 12 contra-mestres, 16 professors

COMMUNITY PROJECTS:
- "Gewalt macht Schule" (Violence Goes to School) - Muttenz
- "Welt in Basel"
- "Ajuda Brasil Crianças"

ANNUAL EVENTS:
- Ostertreffen (Easter meeting) - organized since 1996
- Batizado & Troca de Corda ceremonies',
  -- notes_pt
  E'ANO DE NASCIMENTO (1957, ano):
Múltiplas fontes confirmam nascimento em 1957 em Salvador, Bahia.

DISCREPÂNCIA DO NOME COMPLETO:
- "Omar da Conceição" - maioria das fontes
- "Omar Tisereve da Conceição" - registro IPHAN
Usando nome completo do IPHAN como fonte mais oficial.

TREINAMENTO:
- 12 anos (~1969): Começou a treinar com Mestre Ezequiel na Escola de Capoeira Mestre Bimba
- 17+ anos (~1974+): Apresentou-se com grupos folclóricos e de shows
- Continuou educação na Escola de Arte e Dança, Bahia

DATA DO TÍTULO DE MESTRE:
- 30 de agosto de 1996: Recebeu corda branca de Mestre Ezequiel em Baden, Suíça
- Cerimônia coincidiu com inauguração da Academia de Capoeira União

STATUS DE PIONEIRO:
- 1985: Primeiro grupo de capoeira em Basel
- 1996: Primeira escola de capoeira na Suíça de língua alemã (Baden)

GRUPO DE CAPOEIRA UNIÃO:
- Fundado: 1994
- Registro IPHAN: Sim (Ponto de Cultura, Ponto de Memória)
- Sede: Itaparica, Bahia (CEP 44460-000)
- Países: Brasil, Suíça, Alemanha, Itália
- Locais na Suíça: Baden (sede), Aarau, Chur, Lucerna, Schaffhausen, St. Gallen, Winterthur, Wetzikon, Zofingen
- Internacional: Monza/Trieste (Itália), Ravensburg (Alemanha), Rio de Janeiro (Brasil)
- Estrutura: 1 mestre, 12 contra-mestres, 16 professores

PROJETOS COMUNITÁRIOS:
- "Gewalt macht Schule" (Violência nas Escolas) - Muttenz
- "Welt in Basel"
- "Ajuda Brasil Crianças"

EVENTOS ANUAIS:
- Ostertreffen (encontro de Páscoa) - organizado desde 1996
- Cerimônias de Batizado & Troca de Corda'
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
