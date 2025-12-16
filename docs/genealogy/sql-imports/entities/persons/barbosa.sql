-- ============================================================
-- GENEALOGY PERSON: Barbosa (do Cabeça)
-- Generated: 2025-12-15
-- ============================================================
-- Porter (carregador) from Cachoeira who worked at Largo Dois de Julho
-- market in Salvador. Key figure in capoeira history: participated in
-- 1937 II Congresso Afro-Brasileiro, featured in Edison Carneiro's
-- "Negros Bantus" as informant on Angola capoeira, taught João Pequeno,
-- and was present when João Grande discovered capoeira in 1953.
-- ============================================================
--
-- IDENTITY:
-- - Full Name: Unknown (only "Barbosa" recorded)
-- - Apelido: Barbosa (also "Barbosa do Cabeça" - referring to Cabeça market)
-- - Title: NULL (recognized as mestre by peers but no formal title recorded)
--
-- DISAMBIGUATION:
-- - DISTINCT from "Barboza" (Matatu Preto group) - different person mentioned
--   only in Canjiquinha's 1989 testimony about Sunday training at Matatu Preto
-- - This Barbosa has documented origin (Cachoeira), occupation (porter at
--   Largo Dois de Julho), participation in 1937 Congress, and teaching of
--   João Pequeno - none of which applies to the other Barboza
--
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- - Active adult participating in II Congresso Afro-Brasileiro in 1937
-- - Teaching João Pequeno in 1943 (teachers typically 30-50 years old)
-- - Still active at 1953 roda (if born 1900, would be 53)
-- - From Cachoeira, moved to Salvador to work as porter
-- - Estimated birth 1890-1910, using 1900 as midpoint
--
-- DEATH:
-- - Unknown; still active in 1953
-- - No death date recorded in sources
--
-- KEY HISTORICAL ROLE:
-- - 1937: Participated in capoeira demonstration at II Congresso Afro-Brasileiro
-- - 1937: Featured in Edison Carneiro's "Negros Bantus" as informant
-- - 1943-1945: Taught João Pequeno before he joined Pastinha
-- - 1953: Present at Roça do Lobo roda when João Grande discovered capoeira
--
-- WALDEMAR'S ASSESSMENT:
-- - "Barbosa do Cabeça, carregador da pesada, o capoeira de melhor técnica
--    que já vi" (Diário de Notícias, 1970)
-- - "The heavy-load porter, the capoeirista with the best technique I've ever seen"
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  NULL,
  'Barbosa',
  'Cachoeira/Largo Dois de Julho',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-38']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-modern era capoeira Angola practitioner from Cachoeira, Bahia. Mestre Waldemar described him as "the capoeirista with the best technique I have ever seen." Known for exceptional technique and singing ability. Participated in the formal documentation of capoeira Angola traditions through Edison Carneiro''s research.',
  E'Praticante de capoeira Angola da era pre-moderna de Cachoeira, Bahia. Mestre Waldemar o descreveu como "o capoeira de melhor tecnica que ja vi." Conhecido pela tecnica excepcional e habilidade no canto. Participou da documentacao formal das tradicoes da capoeira Angola atraves da pesquisa de Edison Carneiro.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Cachoeira, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Barbosa, known as Barbosa do Cabeca, was a capoeirista from Cachoeira in the Bahian Reconcavo who became an important figure in Salvador''s capoeira scene during the 1930s-1950s. He worked as a carregador (porter) at the Largo Dois de Julho market—a location also known as "Cabeca"—carrying heavy loads in the commercial heart of Salvador.\n\nIn January 1937, Barbosa participated in the historic capoeira demonstration at the II Congresso Afro-Brasileiro, held at the Club de Regatas Itapagipe in Ribeira, Salvador. The congress, organized by Edison Carneiro and Aydano de Couto Ferraz, was a landmark event in the formal documentation of Afro-Brazilian culture. Barbosa appeared alongside Juvenal, Onca Preta, Zeppelin, and other prominent capoeiristas of the era. That same year, Carneiro featured Barbosa in his book "Negros Bantus" as one of the key informants on capoeira de Angola. His name appeared prominently in Carneiro''s acknowledgments, listed immediately after Querido de Deus—an indication of his standing in the capoeira community.\n\nMestre Waldemar, himself one of the greatest figures in capoeira history, held Barbosa in the highest regard. In a 1970 interview with Diario de Noticias, Waldemar declared: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi" ("Barbosa do Cabeca, the heavy-load porter, the capoeirista with the best technique I have ever seen"). Waldemar also noted that Barbosa possessed exceptional singing ability, describing his voice as comparable to his own renowned vocal skills.\n\nBarbosa played a pivotal role in connecting João Pequeno to the Salvador capoeira world. When João Pequeno arrived in Salvador in January 1943, working as a bricklayer, a colleague named Candido recognized his interest in capoeira and directed him to meet Barbosa at Largo Dois de Julho. As João Pequeno later recounted, his capoeira learning "did not begin in an academy but with the carrier Barbosa from Largo Dois de Julho, who would take me to train and there was always a capoeira roda." Barbosa initiated João into capoeira and then took him to the roda of Mestre Cobrinha Verde in the Chame-Chame neighborhood—setting João Pequeno on the path that would eventually lead him to Mestre Pastinha.\n\nA decade later, in 1953, Barbosa was present at a roda in Roca do Lobo when a young man named João Grande first encountered capoeira. At this gathering, which included Menino Gordo, João Pequeno, and Cobrinha Verde, João Grande asked what he was witnessing. When told it was capoeira, he asked to learn. Barbosa and the others directed him to João Pequeno, who in turn took him to Mestre Pastinha—beginning another legendary capoeira journey.\n\nThrough his role in introducing both João Pequeno and João Grande to capoeira, Barbosa served as a crucial bridge figure connecting rural Bahian capoeira practitioners to Salvador''s organized capoeira scene. His participation in Edison Carneiro''s research helped preserve knowledge of capoeira de Angola at a critical moment in its history.',
  -- Extended content (bio_pt)
  E'Barbosa, conhecido como Barbosa do Cabeca, era um capoeirista de Cachoeira no Reconcavo Baiano que se tornou uma figura importante na cena da capoeira de Salvador durante os anos 1930-1950. Ele trabalhava como carregador no mercado do Largo Dois de Julho—local tambem conhecido como "Cabeca"—carregando cargas pesadas no coracao comercial de Salvador.\n\nEm janeiro de 1937, Barbosa participou da historica demonstracao de capoeira no II Congresso Afro-Brasileiro, realizado no Club de Regatas Itapagipe em Ribeira, Salvador. O congresso, organizado por Edison Carneiro e Aydano de Couto Ferraz, foi um evento marcante na documentacao formal da cultura afro-brasileira. Barbosa apareceu ao lado de Juvenal, Onca Preta, Zeppelin e outros capoeiristas proeminentes da epoca. No mesmo ano, Carneiro apresentou Barbosa em seu livro "Negros Bantus" como um dos principais informantes sobre capoeira de Angola. Seu nome apareceu de forma proeminente nos agradecimentos de Carneiro, listado imediatamente apos Querido de Deus—uma indicacao de sua posicao na comunidade capoeirista.\n\nMestre Waldemar, ele proprio uma das maiores figuras da historia da capoeira, tinha Barbosa na mais alta estima. Em uma entrevista de 1970 ao Diario de Noticias, Waldemar declarou: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi." Waldemar tambem observou que Barbosa possuia habilidade excepcional no canto, descrevendo sua voz como comparavel as suas proprias habilidades vocais renomadas.\n\nBarbosa desempenhou um papel fundamental na conexao de João Pequeno com o mundo da capoeira em Salvador. Quando João Pequeno chegou a Salvador em janeiro de 1943, trabalhando como pedreiro, um colega chamado Candido reconheceu seu interesse em capoeira e o direcionou para conhecer Barbosa no Largo Dois de Julho. Como João Pequeno relatou mais tarde, seu aprendizado de capoeira "nao iniciou em academia e sim com o carregador Barbosa, do Largo Dois de Julho, que me levava pra treinar e sempre tinha roda de capoeira." Barbosa iniciou João na capoeira e depois o levou para a roda de Mestre Cobrinha Verde no bairro do Chame-Chame—colocando João Pequeno no caminho que eventualmente o levaria a Mestre Pastinha.\n\nUma decada depois, em 1953, Barbosa estava presente em uma roda na Roca do Lobo quando um jovem chamado João Grande encontrou a capoeira pela primeira vez. Neste encontro, que incluia Menino Gordo, João Pequeno e Cobrinha Verde, João Grande perguntou o que estava testemunhando. Quando lhe disseram que era capoeira, ele pediu para aprender. Barbosa e os outros o direcionaram para João Pequeno, que por sua vez o levou a Mestre Pastinha—iniciando outra lendaria jornada na capoeira.\n\nAtraves de seu papel na introducao tanto de João Pequeno quanto de João Grande a capoeira, Barbosa serviu como uma figura-ponte crucial conectando praticantes de capoeira do interior da Bahia a cena organizada de capoeira de Salvador. Sua participacao na pesquisa de Edison Carneiro ajudou a preservar o conhecimento da capoeira de Angola em um momento critico de sua historia.',
  -- Achievements
  E'Participated in capoeira demonstration at II Congresso Afro-Brasileiro (January 1937)\nFeatured as informant in Edison Carneiro''s "Negros Bantus" (1937)\nIntroduced João Pequeno to Salvador capoeira scene (1943)\nPresent at 1953 roda where João Grande discovered capoeira\nRecognized by Mestre Waldemar as having "the best technique I have ever seen"',
  E'Participou da demonstracao de capoeira no II Congresso Afro-Brasileiro (janeiro de 1937)\nApresentado como informante em "Negros Bantus" de Edison Carneiro (1937)\nIntroduziu João Pequeno na cena da capoeira de Salvador (1943)\nPresente na roda de 1953 onde João Grande descobriu a capoeira\nReconhecido por Mestre Waldemar como tendo "a melhor tecnica que ja vi"',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1900, decade precision):\n- Active adult at 1937 Congress (if teaching/demonstrating, likely 25-50 years old)\n- Teaching João Pequeno in 1943 (teachers typically 30-50)\n- Still active at 1953 roda\n- If born ~1900, would be 37 in 1937, 43 in 1943, 53 in 1953 - plausible\n- From Cachoeira originally; moved to Salvador for work\n\nDEATH: Unknown. Last documented appearance is 1953 roda at Roca do Lobo.\n\nFULL NAME: Unknown. All sources refer only to "Barbosa" or "Barbosa do Cabeca" (referring to Cabeca market area at Largo Dois de Julho).\n\nTITLE: Not formally titled in sources, but functionally acted as teacher/mestre. Waldemar''s praise and his role in introducing students to capoeira suggests he held informal mestre status in the community.\n\nDISAMBIGUATION:\nThis "Barbosa" is DISTINCT from "Barboza" in the Matatu Preto training group:\n- Barbosa (this person): From Cachoeira, porter at Largo Dois de Julho, participated in 1937 Congress, taught João Pequeno, active 1937-1953\n- Barboza (other person): Only known from Canjiquinha''s 1989 testimony about Matatu Preto Sunday trainings in 1930s, no occupation/origin recorded\nUsing apelido_context "Cachoeira/Largo Dois de Julho" to differentiate.\n\nSOURCES:\n- Velhos Mestres (velhosmestres.com/br/destaques-38) - primary biographical source\n- CECA official (ceca-riovermelho.org.br) - João Pequeno biography\n- Capoeira Connection - João Grande interview\n\nWALDEMAR QUOTE: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi" (Diario de Noticias, 1970)',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, precisao de decada):\n- Adulto ativo no Congresso de 1937 (se ensinando/demonstrando, provavelmente 25-50 anos)\n- Ensinando João Pequeno em 1943 (professores tipicamente 30-50)\n- Ainda ativo na roda de 1953\n- Se nascido ~1900, teria 37 em 1937, 43 em 1943, 53 em 1953 - plausivel\n- Originalmente de Cachoeira; mudou-se para Salvador para trabalhar\n\nMORTE: Desconhecida. Ultima aparicao documentada e na roda de 1953 na Roca do Lobo.\n\nNOME COMPLETO: Desconhecido. Todas as fontes referem-se apenas a "Barbosa" ou "Barbosa do Cabeca" (referindo-se a area do mercado Cabeca no Largo Dois de Julho).\n\nTITULO: Nao titulado formalmente nas fontes, mas funcionalmente atuava como professor/mestre. O elogio de Waldemar e seu papel na introducao de alunos a capoeira sugere que ele tinha status informal de mestre na comunidade.\n\nDESAMBIGUACAO:\nEste "Barbosa" e DISTINTO de "Barboza" no grupo de treino do Matatu Preto:\n- Barbosa (esta pessoa): De Cachoeira, carregador no Largo Dois de Julho, participou do Congresso de 1937, ensinou João Pequeno, ativo 1937-1953\n- Barboza (outra pessoa): Conhecido apenas pelo testemunho de Canjiquinha de 1989 sobre treinos de domingo no Matatu Preto nos anos 1930, sem ocupacao/origem registrada\nUsando apelido_context "Cachoeira/Largo Dois de Julho" para diferenciar.\n\nFONTES:\n- Velhos Mestres (velhosmestres.com/br/destaques-38) - fonte biografica principal\n- CECA oficial (ceca-riovermelho.org.br) - biografia de João Pequeno\n- Capoeira Connection - entrevista de João Grande\n\nCITACAO DE WALDEMAR: "Barbosa do Cabeca, carregador da pesada, o capoeira de melhor tecnica que ja vi" (Diario de Noticias, 1970)'
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
