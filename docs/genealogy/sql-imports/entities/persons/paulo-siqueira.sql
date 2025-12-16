-- ============================================================
-- GENEALOGY PERSON: Paulo Siqueira
-- Generated: 2025-12-15
-- Primary Sources:
--   https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/
--   https://capoeuropa.org/historia-da-escola/
--   https://capoeirawiki.org/wiki/Paulo_Siqueira
-- ============================================================
-- DEPENDENCIES: Roque (exists), Adilson/Camisa Preta (pending)
-- ============================================================
--
-- IDENTITY:
-- - Full name: Paulo Siqueira
-- - Apelido: Paulo Siqueira (also known simply as "Siqueira" in theater circles)
-- - Born: May 6, 1955, Rio de Janeiro (Bonsucesso neighborhood)
-- - Title: Mestre (received from Mestre Adilson)
-- - Style: Angola
--
-- TRAINING LINEAGE:
-- - Began training ~1972 at Mestre Roque's academy on Morro do Pavão
-- - Primary teacher: Mestre Adilson "Camisa Preta" (Roque's senior student)
-- - Also trained under general guidance of Mestre Roque
-- - Received mestre title from Adilson (date unknown, before Adilson's death in 1990s)
--
-- CAREER IN GERMANY:
-- - Early 1980s: Invited to Germany by theater producer "Herr Ulm"
-- - Initially based in Hannover, teaching small group of 15 people
-- - 1985: Hired by Zeppelin theater owner in Hamburg, settled there
-- - 1985: Founded Escola de Capoeira Nzinga (Hamburg, expanded to Hannover and Kiel)
-- - 1987-2004: Organized Capoeira Sommer-Meeting in Hamburg
--   (7-day event, 300 participants, largest capoeira event outside Brazil at the time)
--
-- ADDITIONAL TRAINING:
-- - Classical dance scholarship from choreographer Mercedes Baptista
-- - Performance career: "Bahia Saravá" show, Intercontinental Hotel, etc.
--
-- CURRENT STATUS (as of research):
-- - Still alive, teaching in Hamburg, Hannover, and Kiel
-- - Writing first book about history of capoeira in Europe
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Paulo Siqueira',
  'Paulo Siqueira',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-paulo-siqueira-1955/', 'https://capoeirawiki.org/wiki/Paulo_Siqueira', 'https://capoeuropa.org/historia-da-escola/']::text[],
  'angola'::genealogy.style,
  E'Paulo Siqueira practices and teaches Capoeira Angola in the lineage of Mestre Roque, through his primary teacher Mestre Adilson "Camisa Preta." His style comes from the "line of São Bento" tradition brought from Bahia to Rio de Janeiro.',
  E'Paulo Siqueira pratica e ensina Capoeira Angola na linhagem de Mestre Roque, através de seu professor principal Mestre Adilson "Camisa Preta." Seu estilo vem da tradição da "linha de São Bento" trazida da Bahia para o Rio de Janeiro.',
  1955,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil (Bonsucesso)',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Paulo Siqueira was born on May 6, 1955, in Rio de Janeiro, growing up between the North Zone neighborhoods of Bonsucesso, Ramos, Olaria, and Penha, and the South Zone areas of Flamengo and Botafogo. His first encounter with capoeira came during carnival festivities when he observed practitioners warming up for a parade at a Portela samba school gathering in Candelária.\n\nAround 1972, encouraged by his friend Rubens—a fireman and capoeirista from the Cantagalo favela—Paulo began training at Mestre Roque''s academy on Morro do Pavão in Copacabana. At that time, Mestre Roque was already planning to hand over the academy to his most advanced student, Adilson "Camisa Preta." Paulo trained primarily under Adilson, with Roque providing overall guidance. Adilson became his sole mestre and would have "great influence in the life of Paulo Siqueira, as capoeirista and person."\n\nAlongside his capoeira training, Paulo pursued a performance career. He received a classical dance scholarship from the renowned choreographer Mercedes Baptista, who emphasized versatility for capoeiristas seeking professional performance work. He performed in theater productions and concert halls, including the "Bahia Saravá" show and events at the Intercontinental Hotel. In Rio''s performance circles, he became known simply as "Siqueira."\n\nAfter years of dedicated training, Adilson graduated Paulo Siqueira as a mestre—a recognition Paulo received from his teacher before Adilson''s death in the 1990s.\n\nIn the early 1980s, a German theater producer called "Herr Ulm" saw Paulo play capoeira and hired him for a tour in Germany. He was based in Hannover on a one-year contract, where he began teaching his first classes to a small group of fifteen people. In 1985, a woman who owned the Zeppelin theater in Hamburg hired him to teach and offered him a place to live. He settled in Hamburg and founded Escola de Capoeira Nzinga, later expanding to Hannover and Kiel.\n\nIn 1987, Mestre Paulo Siqueira launched the Capoeira Sommer-Meeting in Hamburg—a groundbreaking seven-day event combining workshops, lectures, and rodas. The event attracted 300 participants, with a closing performance at Hamburg''s "Fabrik" venue drawing up to 600 attendees. It was the largest capoeira event outside Brazil at the time and one of the first major capoeira gatherings in Europe. The Sommer-Meeting continued annually until 2004, setting standards for capoeira events outside Brazil and significantly elevating the quality and visibility of capoeira in Europe.\n\nMestre Paulo Siqueira was one of the first to bring capoeira to Europe and make it known on the continent. He continues to teach Capoeira Angola in Hamburg, Hannover, and Kiel, and is working on his first book about the history of capoeira in Europe.',
  E'Paulo Siqueira nasceu em 6 de maio de 1955 no Rio de Janeiro, crescendo entre os bairros da Zona Norte de Bonsucesso, Ramos, Olaria e Penha, e as áreas da Zona Sul de Flamengo e Botafogo. Seu primeiro encontro com a capoeira aconteceu durante as festividades de carnaval, quando observou praticantes se aquecendo para um desfile em uma reunião da escola de samba Portela na Candelária.\n\nPor volta de 1972, incentivado por seu amigo Rubens—um bombeiro e capoeirista da favela do Cantagalo—Paulo começou a treinar na academia de Mestre Roque no Morro do Pavão em Copacabana. Naquela época, Mestre Roque já planejava passar a academia para seu aluno mais avançado, Adilson "Camisa Preta." Paulo treinou principalmente sob Adilson, com Roque fornecendo orientação geral. Adilson se tornou seu único mestre e teria "grande influência na vida de Paulo Siqueira, como capoeirista e pessoa."\n\nParalelamente ao seu treinamento de capoeira, Paulo seguiu uma carreira de performance. Ele recebeu uma bolsa de dança clássica da renomada coreógrafa Mercedes Baptista, que enfatizava versatilidade para capoeiristas que buscavam trabalho profissional de performance. Ele se apresentou em produções teatrais e casas de shows, incluindo o espetáculo "Bahia Saravá" e eventos no Hotel Intercontinental. Nos círculos de performance do Rio, ele ficou conhecido simplesmente como "Siqueira."\n\nApós anos de treinamento dedicado, Adilson graduou Paulo Siqueira como mestre—um reconhecimento que Paulo recebeu de seu professor antes da morte de Adilson nos anos 1990.\n\nNo início dos anos 1980, um produtor de teatro alemão chamado "Herr Ulm" viu Paulo jogar capoeira e o contratou para uma turnê na Alemanha. Ele ficou baseado em Hannover com um contrato de um ano, onde começou a dar suas primeiras aulas para um pequeno grupo de quinze pessoas. Em 1985, uma mulher que era dona do teatro Zeppelin em Hamburgo o contratou para ensinar e ofereceu-lhe um lugar para morar. Ele se estabeleceu em Hamburgo e fundou a Escola de Capoeira Nzinga, depois expandindo para Hannover e Kiel.\n\nEm 1987, Mestre Paulo Siqueira lançou o Capoeira Sommer-Meeting em Hamburgo—um evento revolucionário de sete dias combinando oficinas, palestras e rodas. O evento atraiu 300 participantes, com uma apresentação de encerramento na "Fabrik" de Hamburgo reunindo até 600 pessoas. Foi o maior evento de capoeira fora do Brasil na época e um dos primeiros grandes encontros de capoeira na Europa. O Sommer-Meeting continuou anualmente até 2004, estabelecendo padrões para eventos de capoeira fora do Brasil e elevando significativamente a qualidade e visibilidade da capoeira na Europa.\n\nMestre Paulo Siqueira foi um dos primeiros a trazer a capoeira para a Europa e torná-la conhecida no continente. Ele continua ensinando Capoeira Angola em Hamburgo, Hannover e Kiel, e está trabalhando em seu primeiro livro sobre a história da capoeira na Europa.',
  E'Pioneer of capoeira in Germany and Europe\nFounded Escola de Capoeira Nzinga (Hamburg, 1985)\nOrganized Capoeira Sommer-Meeting (1987-2004) - largest capoeira event outside Brazil at its time\nOne of the first to bring capoeira to Europe\nSchools in Hamburg, Hannover, and Kiel\nReceived mestre title from Mestre Adilson "Camisa Preta"\nClassical dance training under Mercedes Baptista\nWriting book on history of capoeira in Europe',
  E'Pioneiro da capoeira na Alemanha e Europa\nFundou a Escola de Capoeira Nzinga (Hamburgo, 1985)\nOrganizou o Capoeira Sommer-Meeting (1987-2004) - maior evento de capoeira fora do Brasil em sua época\nUm dos primeiros a trazer a capoeira para a Europa\nEscolas em Hamburgo, Hannover e Kiel\nRecebeu título de mestre de Mestre Adilson "Camisa Preta"\nTreinamento de dança clássica com Mercedes Baptista\nEscrevendo livro sobre história da capoeira na Europa',
  E'BIRTH DATE: May 6, 1955 (exact) - confirmed by multiple sources including CapoeiraWiki\n\nTRAINING TIMELINE:\n- ~1972: Began training at Mestre Roque''s academy on Morro do Pavão\n- Primary teacher: Mestre Adilson "Camisa Preta" (not Roque directly)\n- Mestre title received from Adilson (before Adilson''s death in 1990s)\n\nGERMANY TIMELINE:\n- Early 1980s: Arrived in Germany (Hannover)\n- 1985: Settled in Hamburg, founded Nzinga\n- 1987: First Capoeira Sommer-Meeting\n- 2004: Final Sommer-Meeting\n\nTEACHER CLARIFICATION:\nWhile Paulo trained at "Mestre Roque''s academy," his actual primary teacher was Adilson "Camisa Preta," Roque''s senior student who took over the academy. Paulo was one of the students who trained under Adilson with Roque''s guidance.\n\nCURRENT STATUS:\nStill alive and teaching (as of 2025 research). Writing book on capoeira in Europe.',
  E'DATA DE NASCIMENTO: 6 de maio de 1955 (exato) - confirmado por múltiplas fontes incluindo CapoeiraWiki\n\nCRONOLOGIA DE TREINAMENTO:\n- ~1972: Começou a treinar na academia de Mestre Roque no Morro do Pavão\n- Professor principal: Mestre Adilson "Camisa Preta" (não Roque diretamente)\n- Título de mestre recebido de Adilson (antes da morte de Adilson nos anos 1990)\n\nCRONOLOGIA NA ALEMANHA:\n- Início dos anos 1980: Chegou na Alemanha (Hannover)\n- 1985: Estabeleceu-se em Hamburgo, fundou Nzinga\n- 1987: Primeiro Capoeira Sommer-Meeting\n- 2004: Último Sommer-Meeting\n\nESCLARECIMENTO SOBRE PROFESSOR:\nEmbora Paulo tenha treinado na "academia de Mestre Roque," seu professor principal real foi Adilson "Camisa Preta," o aluno sênior de Roque que assumiu a academia. Paulo foi um dos alunos que treinou sob Adilson com a orientação de Roque.\n\nSTATUS ATUAL:\nAinda vivo e ensinando (conforme pesquisa de 2025). Escrevendo livro sobre capoeira na Europa.'
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
