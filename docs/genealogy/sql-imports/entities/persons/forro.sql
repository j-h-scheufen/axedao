-- ============================================================
-- GENEALOGY PERSON: Forró
-- Generated: 2025-12-15
-- Primary Sources: https://forum-brasil.de/capoeira/
--                  https://www.lalaue.com/hannover/capoeira-angola-hannover-aldeia-de-angola/
--                  https://www.capoeira-angola-hannover.de/
-- ============================================================
-- DEPENDENCIES: Marrom (Rio de Janeiro) must exist
-- ============================================================
--
-- FULL APELIDO: Forró Àlágbè (also written Forró Alabé)
-- Using simplified "Forró" as apelido for database compatibility.
--
-- BIRTH YEAR:
-- Born 1976 (confirmed via oral history: will turn 50 in 2026).
-- Using 1976 with 'exact' precision.
--
-- TRAINING HISTORY:
-- - Origin: Belém do Pará, Northern Brazil
-- - Lived and worked in Rio de Janeiro for nearly 20 years as actor, percussionist, capoeira teacher
-- - Trained under Mestre Marrom (Ngoma Capoeira Angola) in Rio de Janeiro
-- - 2004: Made Contra-Mestre by Mestre Marrom in Rio de Janeiro (per user oral history)
-- - Later received Mestre title (exact date unknown)
-- - Moved to Germany (currently Hannover, also teaches in Berlin)
--
-- GROUP AFFILIATIONS:
-- - Ngoma Capoeira Angola (student/affiliate of Mestre Marrom)
-- - Centro Cultural Aldeia de Angola (founded in Hannover, Germany)
-- - Forum Brasil Berlin (teaches children's capoeira)
--
-- PROFESSIONAL BACKGROUND:
-- - Actor (15+ years in Rio de Janeiro)
-- - Percussionist specializing in Afro-Brazilian rhythms
-- - Co-leads "Batucajé" music project with Sigga Glitz (wife)
-- - Extensive work with children and youth education in Germany
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Joelson Menezes da Silva',
  'Forró',
  NULL,
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeira-angola-hannover.de/', 'https://www.lalaue.com/hannover/capoeira-angola-hannover-aldeia-de-angola/', 'https://forum-brasil.de/capoeira/']::text[],
  'angola'::genealogy.style,
  E'Mestre Forró teaches traditional Capoeira Angola, emphasizing the art''s African and Afro-Brazilian roots. His approach integrates movement with music, percussion, and dance from Afro-Brazilian popular culture. Beyond pure capoeira technique, he brings elements of Candomblé rhythms and northeastern Brazilian traditions into his practice, reflecting both his Amazonian origins and his years studying in Rio de Janeiro under Mestre Marrom.',
  E'Mestre Forró ensina Capoeira Angola tradicional, enfatizando as raízes africanas e afro-brasileiras da arte. Sua abordagem integra movimento com música, percussão e dança da cultura popular afro-brasileira. Além da técnica pura de capoeira, ele traz elementos dos ritmos do Candomblé e das tradições nordestinas brasileiras para sua prática, refletindo tanto suas origens amazônicas quanto seus anos de estudo no Rio de Janeiro sob Mestre Marrom.',
  1976,
  'exact'::genealogy.date_precision,
  'Belém, Pará, Brazil',
  NULL,
  NULL,
  NULL,
  E'Joelson Menezes da Silva was born in Belém do Pará in northern Brazil in 1976. From a young age, he dedicated himself to researching and teaching Afro-Brazilian culture, eventually working across various regions of Brazil for nearly two decades as an actor, percussionist, and capoeira teacher.\n\nIn Rio de Janeiro, Forró spent approximately fifteen years immersed in the city''s cultural scene. There he trained in Capoeira Angola under Mestre Marrom (Henrique Anastácio de Jesus), becoming part of the growing community around Marrom Capoeira & Alunos (later renamed Ngoma Capoeira Angola). In 2004, Mestre Marrom formally recognized his development by conferring the title of Contra-Mestre upon him in Rio.\n\nAfter nearly two decades in Brazil''s southeast, Forró relocated to Germany around 2012, settling in Hannover where he established his own center: Centro Cultural Aldeia de Angola. The group, also known as Capoeira Angola Hannover-Aldeia de Angola, offers regular training in Hannover and Hildesheim, along with children''s classes and cultural workshops.\n\nIn Germany, Mestre Forró has become an active figure in cultural education. He has worked with numerous schools and youth programs throughout Lower Saxony, including the Astrid-Lindgren-School (2008), "Youth and Justice" project (2010), Käthe-Kollwitz-School, IGS Kronsberg, and various summer programs. Since 2020, he has partnered with KinderKulturAbo for primary school programs, and participated in the "Culture Makes Strong" project with Hildesheim Music School.\n\nBeyond Hannover, Forró teaches children''s capoeira classes at Forum Brasil in Berlin, where he works with students ages 3-11. He also travels throughout Europe conducting workshops, sharing his knowledge of capoeira Angola, Afro-Brazilian percussion, and popular dances like forró and samba de roda.\n\nTogether with his wife Sigga Glitz, a trained musician from northern Germany who has devoted herself to Brazilian culture, Forró co-leads "Batucajé"—a musical project that takes audiences on a journey through Brazilian rhythms. His full apelido, "Forró Àlágbè," reflects both the northeastern Brazilian dance/music tradition and the Yoruba term "àlágbè" (drummer/master of sacred drums), acknowledging his dual expertise in capoeira and percussion.\n\nToday, Mestre Forró continues to bridge Afro-Brazilian traditions and German cultural education, using capoeira as a tool for anti-racist education and cultural preservation.',
  E'Joelson Menezes da Silva nasceu em Belém do Pará, no norte do Brasil, em 1976. Desde jovem, dedicou-se a pesquisar e ensinar a cultura afro-brasileira, eventualmente trabalhando em várias regiões do Brasil por quase duas décadas como ator, percussionista e professor de capoeira.\n\nNo Rio de Janeiro, Forró passou aproximadamente quinze anos imerso na cena cultural da cidade. Lá ele treinou Capoeira Angola sob Mestre Marrom (Henrique Anastácio de Jesus), tornando-se parte da crescente comunidade em torno do Marrom Capoeira & Alunos (posteriormente renomeado Ngoma Capoeira Angola). Em 2004, Mestre Marrom reconheceu formalmente seu desenvolvimento conferindo-lhe o título de Contra-Mestre no Rio.\n\nApós quase duas décadas no sudeste do Brasil, Forró mudou-se para a Alemanha por volta de 2012, estabelecendo-se em Hannover onde fundou seu próprio centro: Centro Cultural Aldeia de Angola. O grupo, também conhecido como Capoeira Angola Hannover-Aldeia de Angola, oferece treinamento regular em Hannover e Hildesheim, junto com aulas para crianças e oficinas culturais.\n\nNa Alemanha, Mestre Forró tornou-se uma figura ativa na educação cultural. Ele trabalhou com numerosas escolas e programas de juventude em toda a Baixa Saxônia, incluindo a Escola Astrid-Lindgren (2008), projeto "Juventude e Justiça" (2010), Escola Käthe-Kollwitz, IGS Kronsberg e vários programas de verão. Desde 2020, ele tem parceria com KinderKulturAbo para programas de escolas primárias, e participou do projeto "Cultura Fortalece" com a Escola de Música de Hildesheim.\n\nAlém de Hannover, Forró ensina aulas de capoeira para crianças no Forum Brasil em Berlim, onde trabalha com alunos de 3 a 11 anos. Ele também viaja por toda a Europa conduzindo oficinas, compartilhando seu conhecimento de capoeira Angola, percussão afro-brasileira e danças populares como forró e samba de roda.\n\nJunto com sua esposa Sigga Glitz, uma musicista treinada do norte da Alemanha que se dedicou à cultura brasileira, Forró co-lidera "Batucajé"—um projeto musical que leva o público a uma jornada pelos ritmos brasileiros. Seu apelido completo, "Forró Àlágbè," reflete tanto a tradição de dança/música do nordeste brasileiro quanto o termo iorubá "àlágbè" (tocador de tambor/mestre de tambores sagrados), reconhecendo sua dupla expertise em capoeira e percussão.\n\nHoje, Mestre Forró continua a construir pontes entre as tradições afro-brasileiras e a educação cultural alemã, usando a capoeira como ferramenta para educação antirracista e preservação cultural.',
  E'Founded Centro Cultural Aldeia de Angola (Hannover, Germany)\nEstablished Capoeira Angola presence in Hannover and Hildesheim\nPioneer of capoeira-based cultural education in Lower Saxony schools\nExtensive children''s education work (2008-present)\nPartner of KinderKulturAbo primary school programs (2020+)\nParticipant in "Culture Makes Strong" (Kultur macht stark) federal education program\nCo-founder of Batucajé Afro-Brazilian music project\nInternational workshop leader throughout Europe\nRegular instructor at Forum Brasil Berlin',
  E'Fundou o Centro Cultural Aldeia de Angola (Hannover, Alemanha)\nEstabeleceu presença de Capoeira Angola em Hannover e Hildesheim\nPioneiro da educação cultural baseada em capoeira nas escolas da Baixa Saxônia\nExtenso trabalho de educação infantil (2008-presente)\nParceiro dos programas de escolas primárias KinderKulturAbo (2020+)\nParticipante do programa federal de educação "Cultura Fortalece" (Kultur macht stark)\nCo-fundador do projeto de música afro-brasileira Batucajé\nLíder de oficinas internacionais por toda a Europa\nInstrutor regular no Forum Brasil Berlin',
  E'FULL APELIDO: Forró Àlágbè (also written Forró Alabé)\nThe name combines:\n- "Forró" - northeastern Brazilian dance/music genre (also his birthplace region''s culture)\n- "Àlágbè" - Yoruba term for drummer/master of sacred drums in Candomblé\n\nBIRTH YEAR: 1976 (confirmed via oral history: will turn 50 in 2026).\n\nTIMELINE:\n- 1976: Born in Belém, Pará, northern Brazil\n- ~1990s-2000s: Worked as actor, percussionist, capoeira teacher in Rio de Janeiro (~15-20 years)\n- 2004: Made Contra-Mestre by Mestre Marrom in Rio de Janeiro (oral history confirmation)\n- ~2012: Moved to Germany (sources state "12 years" as of 2024/2025)\n- 2008+: Began cultural education work in German schools\n- Unknown: Received Mestre title\n\nTEACHING LOCATIONS:\n- Hannover: Centro Cultural Aldeia de Angola (Allerweg 7, 30449 Hannover)\n- Hildesheim: Regular training\n- Berlin: Forum Brasil (children''s classes)\n- Europe: International workshops\n\nFAMILY:\n- Wife: Sigga Glitz (musician, co-leads Batucajé)\n\nLINEAGE:\n- Mestre Marrom (Ngoma Capoeira Angola) → direct teacher\n- Through Marrom: connection to João Pequeno → Pastinha lineage',
  E'APELIDO COMPLETO: Forró Àlágbè (também escrito Forró Alabé)\nO nome combina:\n- "Forró" - gênero de dança/música do nordeste brasileiro (também a cultura de sua região de nascimento)\n- "Àlágbè" - termo iorubá para tocador de tambor/mestre de tambores sagrados no Candomblé\n\nANO DE NASCIMENTO: 1976 (confirmado via história oral: completará 50 anos em 2026).\n\nCRONOLOGIA:\n- 1976: Nasceu em Belém, Pará, norte do Brasil\n- ~Anos 1990-2000: Trabalhou como ator, percussionista, professor de capoeira no Rio de Janeiro (~15-20 anos)\n- 2004: Feito Contra-Mestre por Mestre Marrom no Rio de Janeiro (confirmação por história oral)\n- ~2012: Mudou-se para a Alemanha (fontes indicam "12 anos" em 2024/2025)\n- 2008+: Começou trabalho de educação cultural em escolas alemãs\n- Desconhecido: Recebeu título de Mestre\n\nLOCAIS DE ENSINO:\n- Hannover: Centro Cultural Aldeia de Angola (Allerweg 7, 30449 Hannover)\n- Hildesheim: Treinamento regular\n- Berlim: Forum Brasil (aulas para crianças)\n- Europa: Oficinas internacionais\n\nFAMÍLIA:\n- Esposa: Sigga Glitz (musicista, co-lidera Batucajé)\n\nLINHAGEM:\n- Mestre Marrom (Ngoma Capoeira Angola) → professor direto\n- Através de Marrom: conexão com João Pequeno → linhagem de Pastinha'
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
