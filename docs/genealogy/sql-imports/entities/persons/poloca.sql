-- ============================================================
-- GENEALOGY PERSON: Poloca
-- Generated: 2025-12-28
-- ============================================================
-- Mestre Poloca (Paulo Barreto): Geographer and art educator.
-- Contramestre at GCAP since its founding (1980). Co-founded
-- Grupo Nzinga de Capoeira Angola (1995). Leads Salvador nucleus
-- at Alto da Sereia quilombola community. Staff at UFBA.
-- ============================================================
-- BIRTH YEAR: No birth year documented in sources. He started
-- training with GCAP in 1983, suggesting he was in his late
-- teens or 20s at that time. Estimating birth year ~1960
-- (decade precision) based on typical capoeira training onset
-- age and career timeline (already contramestre by 1990s).
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
  'Paulo Barreto',
  'Poloca',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeirahub.net/mestres/686d98498e89523414438a9b-mestre-poloca', 'https://www.loc.gov/item/2020639467/', 'https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers', 'https://nzinga-marburg.com/2018/02/06/mestras-e-mestres/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Follows the Capoeira Angola lineage of Mestre Pastinha through GCAP. Emphasizes capoeira as a tool for education and social development, particularly for children. His approach integrates capoeira with African cultural traditions, including storytelling and folklore. Works extensively with children in public schools in Salvador, using capoeira as a vehicle for cultural awareness and discipline.',
  E'Segue a linhagem de Capoeira Angola de Mestre Pastinha através do GCAP. Enfatiza a capoeira como instrumento de educação e desenvolvimento social, particularmente para crianças. Sua abordagem integra a capoeira com tradições culturais africanas, incluindo contação de histórias e folclore. Trabalha extensivamente com crianças em escolas públicas de Salvador, usando a capoeira como veículo para conscientização cultural e disciplina.',
  -- Life dates
  1960,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Paulo Barreto, known as Mestre Poloca, is a geographer and art educator who has dedicated his life to Capoeira Angola and the education of young people in Salvador, Bahia.

In 1983, Poloca began training capoeira with the Grupo de Capoeira Angola Pelourinho (GCAP) in Salvador, under the guidance of Mestre Moraes. GCAP had been founded in Rio de Janeiro in 1980 and relocated to Salvador in 1982. Poloca was among those who joined the group shortly after its arrival in Bahia. Over the following years, he trained not only with Moraes but also with Mestre João Grande and Mestre Cobra Mansa, absorbing the teachings of the Pastinha lineage.

During his years at GCAP, Poloca rose to the rank of contramestre. He worked on social projects including "Ginga Moleque", a capoeira initiative for children sponsored by União e Consciência Negra, which he led alongside Mestre Valmir. The project introduced many young people to Capoeira Angola in Salvador''s lower city neighborhoods.

In 1995, Poloca co-founded the Instituto Nzinga de Estudos da Capoeira Angola e Tradições Educativas Banto no Brasil alongside Mestra Janja (Rosângela Costa Araújo) and Mestra Paulinha (Paula Cristina da Silva Barreto). All three were fellow disciples from GCAP who shared a vision of capoeira as an instrument of anti-racist and anti-sexist struggle. Grupo Nzinga was named after Queen Nzinga Mbandi Ngola (1581-1663), the Angolan warrior queen who led four decades of resistance against Portuguese colonization.

Between 2001 and 2002, Poloca returned to Salvador to establish the Nzinga nucleus in Bahia. When Mestra Janja also returned to Salvador in 2005, the group''s headquarters moved to Alto da Sereia, a small quilombola community of approximately 200 families nestled within the Rio Vermelho neighborhood. The Instituto Nzinga operates from Rua Alto da Sereia, nº 2 – 3º andar, Salvador.

In Alto da Sereia, Poloca developed extensive work with the community''s children. The Nzinga is the only Capoeira Angola group in this quilombola community, providing free classes and using capoeira as a tool for empowerment and cultural preservation. For five years, Poloca developed activities rescuing African legends and folktales with children from public schools in Salvador, demonstrating his commitment to education beyond capoeira itself.

Poloca currently works as staff at the Federal University of Bahia (UFBA), where he continues his educational mission. He is known for his talent for communicating with children. He has visited Japan three times (2014, 2016, 2018), holding workshops for both children and adults in Kyoto and Tokyo. In September 2004, he conducted an interview with Mestre João Grande at Ponta de Areia, Itaparica, published by Campo de Mandinga, demonstrating his role as a researcher and documenter of capoeira history.

Together with Mestra Janja and Mestra Paulinha, Poloca coordinates Grupo Nzinga de Capoeira Angola. The group''s mission encompasses the defense of children''s and adolescents'' rights, fighting racial and gender discrimination, preserving and promoting Afro-Brazilian culture, and empowering girls, children, and women. As of 2020, on its 25th anniversary, Nzinga operated in five Brazilian cities and twelve international cities including Maputo (Mozambique), Marburg (Germany), Tokyo and Kyoto (Japan), and Atlanta (USA).',
  -- Extended content (bio_pt)
  E'Paulo Barreto, conhecido como Mestre Poloca, é um geógrafo e arte-educador que dedicou sua vida à Capoeira Angola e à educação de jovens em Salvador, Bahia.

Em 1983, Poloca começou a treinar capoeira no Grupo de Capoeira Angola Pelourinho (GCAP) em Salvador, sob a orientação de Mestre Moraes. O GCAP havia sido fundado no Rio de Janeiro em 1980 e se mudou para Salvador em 1982. Poloca estava entre aqueles que se juntaram ao grupo logo após sua chegada à Bahia. Ao longo dos anos seguintes, treinou não apenas com Moraes, mas também com Mestre João Grande e Mestre Cobra Mansa, absorvendo os ensinamentos da linhagem de Pastinha.

Durante seus anos no GCAP, Poloca ascendeu ao grau de contramestre. Trabalhou em projetos sociais incluindo "Ginga Moleque", uma iniciativa de capoeira para crianças patrocinada pela União e Consciência Negra, que liderou junto com Mestre Valmir. O projeto introduziu muitos jovens à Capoeira Angola nos bairros da cidade baixa de Salvador.

Em 1995, Poloca co-fundou o Instituto Nzinga de Estudos da Capoeira Angola e Tradições Educativas Banto no Brasil ao lado de Mestra Janja (Rosângela Costa Araújo) e Mestra Paulinha (Paula Cristina da Silva Barreto). Os três eram companheiros discípulos do GCAP que compartilhavam uma visão da capoeira como instrumento de luta antirracista e antissexista. O Grupo Nzinga foi nomeado em homenagem à Rainha Nzinga Mbandi Ngola (1581-1663), a rainha guerreira angolana que liderou quatro décadas de resistência contra a colonização portuguesa.

Entre 2001 e 2002, Poloca retornou a Salvador para estabelecer o núcleo do Nzinga na Bahia. Quando Mestra Janja também retornou a Salvador em 2005, a sede do grupo mudou-se para o Alto da Sereia, uma pequena comunidade quilombola de aproximadamente 200 famílias localizada dentro do bairro do Rio Vermelho. O Instituto Nzinga opera da Rua Alto da Sereia, nº 2 – 3º andar, Salvador.

No Alto da Sereia, Poloca desenvolveu extenso trabalho com as crianças da comunidade. O Nzinga é o único grupo de Capoeira Angola nesta comunidade quilombola, oferecendo aulas gratuitas e usando a capoeira como instrumento de empoderamento e preservação cultural. Por cinco anos, Poloca desenvolveu atividades de resgate de lendas e contos africanos com crianças de escolas públicas de Salvador, demonstrando seu compromisso com a educação além da própria capoeira.

Poloca atualmente trabalha como funcionário da Universidade Federal da Bahia (UFBA), onde continua sua missão educacional. É conhecido por seu talento para se comunicar com crianças. Visitou o Japão três vezes (2014, 2016, 2018), realizando oficinas para crianças e adultos em Kyoto e Tóquio. Em setembro de 2004, conduziu uma entrevista com Mestre João Grande em Ponta de Areia, Itaparica, publicada pelo Campo de Mandinga, demonstrando seu papel como pesquisador e documentador da história da capoeira.

Junto com Mestra Janja e Mestra Paulinha, Poloca coordena o Grupo Nzinga de Capoeira Angola. A missão do grupo abrange a defesa dos direitos de crianças e adolescentes, combate à discriminação racial e de gênero, preservação e promoção da cultura afro-brasileira, e empoderamento de meninas, crianças e mulheres. Em 2020, em seu 25º aniversário, o Nzinga operava em cinco cidades brasileiras e doze cidades internacionais incluindo Maputo (Moçambique), Marburg (Alemanha), Tóquio e Kyoto (Japão), e Atlanta (EUA).',
  -- Achievements
  E'- Co-founded Grupo Nzinga de Capoeira Angola (1995) with Mestra Janja and Mestra Paulinha
- Leads Salvador nucleus of Grupo Nzinga at Alto da Sereia quilombola community (2001-present)
- Member at GCAP since founding (1980) - contramestre rank achieved
- Staff member at Federal University of Bahia (UFBA)
- Co-led "Ginga Moleque" project for children with Mestre Valmir (sponsored by União e Consciência Negra)
- Five years of African folklore and storytelling activities with children in Salvador public schools
- Interviewed Mestre João Grande (September 1, 2004) for Campo de Mandinga
- International workshops in Japan (Kyoto, Tokyo - 2014, 2016, 2018)
- Photographed by André Cypriano for Library of Congress collection (2008)',
  E'- Co-fundou o Grupo Nzinga de Capoeira Angola (1995) com Mestra Janja e Mestra Paulinha
- Lidera o núcleo de Salvador do Grupo Nzinga na comunidade quilombola do Alto da Sereia (2001-presente)
- Membro do GCAP desde a fundação (1980) - alcançou grau de contramestre
- Funcionário da Universidade Federal da Bahia (UFBA)
- Co-liderou o projeto "Ginga Moleque" para crianças com Mestre Valmir (patrocinado pela União e Consciência Negra)
- Cinco anos de atividades de resgate de lendas e contos africanos com crianças em escolas públicas de Salvador
- Entrevistou Mestre João Grande (1 de setembro de 2004) para Campo de Mandinga
- Oficinas internacionais no Japão (Kyoto, Tóquio - 2014, 2016, 2018)
- Fotografado por André Cypriano para a coleção da Biblioteca do Congresso (2008)',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (~1960, decade precision):
No birth date documented. Poloca started training with GCAP in 1983. Assuming typical capoeira training onset in late teens/early 20s, and that he achieved contramestre rank during the 1990s, a birth year around 1960 is reasonable.

TEACHERS:
- Mestre Moraes (primary teacher at GCAP, 1983+)
- Mestre João Grande (taught at GCAP mid-1980s-1990)
- Mestre Cobra Mansa (taught at GCAP 1982+)

GCAP FOUNDING DISCREPANCY:
Sources say Poloca was "part of GCAP since its founding" but GCAP was founded Oct 5, 1980 in Rio and moved to Salvador in 1982. Other sources specify he started training in 1983. Most likely he joined GCAP Salvador shortly after its establishment in Bahia, not the original Rio founding.

CONTRAMESTRE TO MESTRE:
Poloca held the rank of contramestre when he joined Nzinga in 1995. Current sources (2018+) refer to him as "Mestre Poloca." The exact date of his mestre title is not documented.

SURNAME COINCIDENCE:
Paulo Barreto (Poloca) and Paula Barreto (Paulinha) share the surname "Barreto." No source explicitly states they are siblings or otherwise related. They may simply share a common surname.

EMPLOYMENT:
CapoeiraHub states he is "staff at Federal University of Bahia" but does not specify his role. Given his background as geographer and art educator, he may work in an academic or administrative capacity.

MEDIA APPEARANCES:
- 2008: Photographed by André Cypriano at Instituto Nzinga, Alto da Sereia (Library of Congress collection, purchased 2017)
- 2004: Interviewed Mestre João Grande for Campo de Mandinga publication',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1960, precisão de década):
Nenhuma data de nascimento documentada. Poloca começou a treinar no GCAP em 1983. Assumindo início típico de treinamento de capoeira no final da adolescência/início dos 20 anos, e que alcançou o grau de contramestre durante os anos 1990, um ano de nascimento por volta de 1960 é razoável.

MESTRES:
- Mestre Moraes (mestre principal no GCAP, 1983+)
- Mestre João Grande (ensinou no GCAP meados dos anos 1980-1990)
- Mestre Cobra Mansa (ensinou no GCAP 1982+)

DISCREPÂNCIA SOBRE FUNDAÇÃO DO GCAP:
Fontes dizem que Poloca fazia "parte do GCAP desde sua fundação" mas o GCAP foi fundado em 5 de outubro de 1980 no Rio e mudou para Salvador em 1982. Outras fontes especificam que começou a treinar em 1983. Provavelmente ele se juntou ao GCAP Salvador logo após seu estabelecimento na Bahia, não na fundação original no Rio.

CONTRAMESTRE PARA MESTRE:
Poloca tinha o grau de contramestre quando se juntou ao Nzinga em 1995. Fontes atuais (2018+) referem-se a ele como "Mestre Poloca." A data exata de seu título de mestre não está documentada.

COINCIDÊNCIA DE SOBRENOME:
Paulo Barreto (Poloca) e Paula Barreto (Paulinha) compartilham o sobrenome "Barreto." Nenhuma fonte afirma explicitamente que são irmãos ou de outra forma relacionados. Podem simplesmente compartilhar um sobrenome comum.

EMPREGO:
CapoeiraHub afirma que é "funcionário da Universidade Federal da Bahia" mas não especifica seu cargo. Dado seu histórico como geógrafo e arte-educador, pode trabalhar em capacidade acadêmica ou administrativa.

APARIÇÕES NA MÍDIA:
- 2008: Fotografado por André Cypriano no Instituto Nzinga, Alto da Sereia (coleção da Biblioteca do Congresso, adquirida em 2017)
- 2004: Entrevistou Mestre João Grande para publicação Campo de Mandinga'
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
