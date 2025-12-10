-- ============================================================
-- GENEALOGY PERSON IMPORT: Onça Preta
-- Generated: 2025-12-09
-- Primary Source: https://velhosmestres.com/br/destaques-34
-- ============================================================
-- DEPENDENCIES: persons/aberre.sql, groups/gengibirra.sql, groups/roda-do-matatu-preto.sql
-- ============================================================
--
-- DEATH YEAR NOTE (2006):
-- Multiple sources confirm death in 2006 at age 97. One source states
-- August 27, 2009, which is inconsistent with birth year 1909 (would be 100).
-- Using 2006 per velhosmestres.com which aligns with age 97.
--
-- DEATH PLACE: Some sources say São Paulo, others don't specify.
-- Using São Paulo with 'approximate' precision.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (all columns from genealogy.person_profiles)
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
  'Cícero Navarro',
  'Onça Preta',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/br/destaques-34"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Deeply traditional Angola practitioner. Strongly opposed to Capoeira Regional: "The real capoeira, for me, is only Angola." Known as a master of berimbau rhythms and capoeira music.',
  E'Praticante profundamente tradicional de Angola. Fortemente oposto à Capoeira Regional: "A capoeira de verdade, para mim, é só Angola." Conhecido como mestre nos segredos dos toques de berimbau e na música de capoeira.',
  -- Life dates
  1909,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  2006,
  'year'::genealogy.date_precision,
  'São Paulo, Brazil',
  -- Extended content (bilingual)
  E'Cícero Navarro, known as Onça Preta (Black Panther), was a short, skinny mulatto man whose name once "made brave men and bullies run." Born into poverty in Salvador on January 27, 1909, he became one of the bridge figures between the first and second generations of Bahian capoeira mestres.

As a boy, he witnessed the brutal persecution of capoeiristas by Police Chief Pedro de Azevedo Gordilho - the infamous "Pedrito." The cavalry chief conducted a systematic massacre of the old mestres, not in open combat but through capture and assassination. The bodies would appear days later, shot in the forest, their backs opened by knife cuts. Onça Preta remembered the fallen: Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, and many others.

Onça Preta himself did not escape Pedrito''s wrath. At a roda in Julião, in Cidade Baixa, the police arrived unexpectedly - the lookout had failed to sound the cavalry rhythm warning on the berimbau. The soldiers charged into the gathering. Onça Preta fell among the horses and had his legs "massacred, opened in deep wounds." He spent fifteen years treating them with herbs, prayers, and mandinga, refusing to see doctors for fear of amputation. The deep scars on his legs remained visible for the rest of his life.

He trained under multiple mestres of the old guard: Samuel Querido de Deus (considered by many the greatest capoeirista of 1930s Salvador), Vicente Pastinha, Besourinho, Vitor Agaú, Gasolina, and Aberrê. According to O Cruzeiro magazine (1948), he was a student of Aberrê. He trained at Matatu Preto alongside Aberrê, Geraldo Chapeleiro, and others who gathered there on Sundays.

In 1936, Aberrê challenged Onça Preta to a match on May 16 in Salvador - a sign of the competitive respect between them. Years later, when Aberrê died suddenly in 1972, Onça Preta mourned: "We had lost a great master, an excellent friend."

His name appears in Mestre Noronha''s manuscripts as one of the founders of the legendary Gengibirra roda, which in 1941 came under Mestre Pastinha''s command after the older masters died. On February 23, 1941, he was among the founding members of CECA (Centro Esportivo de Capoeira Angola) alongside Aberrê, Amorzinho, Antonio Maré, Daniel Noronha, Livino Diogo, and others.

He participated in landmark cultural events: the 1937 II Afro-Brazilian Congress in Salvador, where he performed his famous game with Samuel Querido de Deus before intellectuals like Edison Carneiro and Jorge Amado; and a 1938 roda at Itapagipe photographed by American anthropologist Ruth Landes, whose images now reside in the Smithsonian Institution.

In the late 1950s, Onça Preta moved to Rio de Janeiro. On July 21, 1960, together with fellow Bahian angoleiros Mucungê, Dois de Ouro, Baleado, Imagem do Cão, and Roque, he co-founded Grupo Filhos de Angola. He claimed to be the first Bahian capoeirista to perform capoeira and maculelê shows in Rio. In 1963, he played pandeiro on Mestre Paraná''s historic LP recording.

His fame extended beyond capoeira circles. Jorge Amado mentioned him in his works, and O Cruzeiro magazine featured him in 1948. In 1972, O Dia newspaper profiled him - by then working as a servant at a child care hospital, his fighting days long past but his knowledge of traditional Angola intact.

He performed at Rio''s Circo Voador in 1982, then moved to São Paulo in 1985, where he stopped teaching capoeira. He died in 2006 at 97 years of age, one of the last living links to the pre-persecution era of Bahian capoeira.

When asked about Mestre Bimba''s Capoeira Regional, he was unsparing: "Where have you seen capoeira where you grab the opponent and the men stay stuck together? Bimba can forgive me... But the real capoeira, for me, is only Angola."',
  E'Cícero Navarro, conhecido como Onça Preta (Pantera Negra), era um mulato baixo e franzino cujo nome no passado "botava a correr valentes e fanfarrões." Nascido numa família pobre em Salvador no dia 27 de janeiro de 1909, tornou-se uma das figuras de transição entre a primeira e a segunda geração de mestres de capoeira baianos.

Quando menino, testemunhou a perseguição brutal aos capoeiristas pelo chefe de polícia Pedro de Azevedo Gordilho - o infame "Pedrito." O comandante da cavalaria conduziu um massacre sistemático dos velhos mestres, não em combate aberto, mas através de captura e assassinato. Os corpos apareciam dias depois, baleados no mato, as costas abertas de facadas. Onça Preta recordava os que tombaram: Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, e muitos outros.

O próprio Onça Preta não escapou da fúria de Pedrito. Numa roda no Julião, na Cidade Baixa, a polícia chegou de surpresa - o vigia falhou em tocar o ritmo de cavalaria de alerta no berimbau. Os soldados carregaram no meio da roda. Onça Preta caiu entre os cavalos e teve as pernas "massacradas, abertas em chagas profundas." Levou quinze anos tratando com ervas, rezas e mandinga, recusando-se a ir a médicos por medo de amputação. As cicatrizes profundas em suas pernas permaneceram visíveis pelo resto da vida.

Treinou com múltiplos mestres da velha guarda: Samuel Querido de Deus (considerado por muitos o maior capoeirista de Salvador nos anos 1930), Vicente Pastinha, Besourinho, Vitor Agaú, Gasolina e Aberrê. Segundo a revista O Cruzeiro (1948), era aluno de Aberrê. Treinava no Matatu Preto ao lado de Aberrê, Geraldo Chapeleiro e outros que se reuniam lá aos domingos.

Em 1936, Aberrê desafiou Onça Preta para uma luta no dia 16 de maio em Salvador - sinal do respeito competitivo entre eles. Anos depois, quando Aberrê morreu subitamente em 1972, Onça Preta lamentou: "Perdemos um grande mestre, um excelente amigo."

Seu nome consta nos manuscritos de Mestre Noronha como um dos fundadores da lendária roda da Gengibirra, que em 1941 passou ao comando de Mestre Pastinha após a morte dos mestres mais velhos. Em 23 de fevereiro de 1941, estava entre os membros fundadores do CECA (Centro Esportivo de Capoeira Angola) ao lado de Aberrê, Amorzinho, Antonio Maré, Daniel Noronha, Livino Diogo e outros.

Participou de eventos culturais marcantes: o II Congresso Afro-Brasileiro em Salvador em 1937, onde realizou seu famoso jogo com Samuel Querido de Deus perante intelectuais como Edison Carneiro e Jorge Amado; e uma roda de 1938 em Itapagipe fotografada pela antropóloga americana Ruth Landes, cujas imagens agora residem na Smithsonian Institution.

No final dos anos 1950, Onça Preta mudou-se para o Rio de Janeiro. Em 21 de julho de 1960, junto com outros angoleiros baianos Mucungê, Dois de Ouro, Baleado, Imagem do Cão e Roque, co-fundou o Grupo Filhos de Angola. Afirmava ser o primeiro capoeirista baiano a fazer apresentações de capoeira e maculelê no Rio. Em 1963, tocou pandeiro na gravação histórica do LP de Mestre Paraná.

Sua fama estendeu-se além dos círculos de capoeira. Jorge Amado o mencionou em suas obras, e a revista O Cruzeiro o destacou em 1948. Em 1972, o jornal O Dia o perfilou - então trabalhando como servente num hospital de puericultura, seus dias de luta há muito passados, mas seu conhecimento da Angola tradicional intacto.

Apresentou-se no Circo Voador do Rio em 1982, depois mudou-se para São Paulo em 1985, onde parou de ensinar capoeira. Faleceu em 2006 aos 97 anos de idade, um dos últimos elos vivos com a era pré-perseguição da capoeira baiana.

Quando perguntado sobre a Capoeira Regional de Mestre Bimba, foi implacável: "Onde já se viu capoeira em que você agarra o adversário e os homens ficam grudados? Bimba pode me perdoar... Mas a capoeira de verdade, para mim, é só Angola."',
  E'Co-founder of CECA (Centro Esportivo de Capoeira Angola) in 1941. Co-founder of Grupo Filhos de Angola in Rio de Janeiro (1960). Participated in the historic II Afro-Brazilian Congress (1937). Photographed by Ruth Landes (1938), images now in Smithsonian Institution. Featured in Jorge Amado''s works. Played pandeiro on Mestre Paraná''s LP (1963).',
  E'Co-fundador do CECA (Centro Esportivo de Capoeira Angola) em 1941. Co-fundador do Grupo Filhos de Angola no Rio de Janeiro (1960). Participou do histórico II Congresso Afro-Brasileiro (1937). Fotografado por Ruth Landes (1938), imagens agora na Smithsonian Institution. Citado nas obras de Jorge Amado. Tocou pandeiro no LP de Mestre Paraná (1963).',
  -- Researcher notes (English)
  E'BIRTH DATE: January 27, 1909, per velhosmestres.com. Exact date documented.

DEATH: 2006 in São Paulo, age 97. Note: One source (capoeirahistory.com) gives August 27, 2009, but this conflicts with the birth year 1909 (would make him 100). The 2006 date aligns better with the "97 years of age" reported by velhosmestres.com and capoeirahistory.com/masters-in-rio.

TEACHER RELATIONSHIP: O Cruzeiro magazine (January 10, 1948) states he was "Aluno de Aberrê." However, in a 1972 O Dia interview, Onça Preta himself claimed to have had "other references" beyond Aberrê. Listed as trained_under Aberrê with ''likely'' confidence.

PHYSICAL DESCRIPTION: "Short, skinny mulatto man with afro hair turning white; legs marked with deep scars" from horse trampling incident during Pedrito persecution.

FAMILY: Daughter Iraci dos Santos Navarro (b. Jan 13, 1942), Son Jurandir Navarro (b. Mar 9, 1943), with partner Julia Batista dos Santos. Great-grandson Marcio Duarte, granddaughter Zélia Navarro.

EMPLOYMENT: Worked as servant (servente) at Hospital de Puericultura from 1972 onward.

PENDING RELATIONSHIPS (entities not yet in dataset):
- student_of Samuel Querido de Deus
- student_of Vicente Pastinha
- associated_with Daniel Noronha (co-founder CECA)
- associated_with Mucungê (co-founder Filhos de Angola)
- associated_with Roque (co-founder Filhos de Angola)
- co_founded Filhos de Angola (group) 1960
- member_of CECA (group) 1941',
  E'DATA DE NASCIMENTO: 27 de janeiro de 1909, conforme velhosmestres.com. Data exata documentada.

MORTE: 2006 em São Paulo, 97 anos. Nota: Uma fonte (capoeirahistory.com) indica 27 de agosto de 2009, mas isso conflita com o ano de nascimento 1909 (teria 100 anos). A data de 2006 alinha melhor com os "97 anos de idade" reportados por velhosmestres.com e capoeirahistory.com/masters-in-rio.

RELAÇÃO DE PROFESSOR: A revista O Cruzeiro (10 de janeiro de 1948) afirma que era "Aluno de Aberrê." Porém, em entrevista ao O Dia em 1972, o próprio Onça Preta afirmou ter tido "outras referências" além de Aberrê. Listado como trained_under Aberrê com confiança ''likely''.

DESCRIÇÃO FÍSICA: "Mulato baixo, franzino, carapinha coberta de branco, pernas marcadas por cicatrizes profundas" do pisoteamento pelos cavalos durante a perseguição de Pedrito.

FAMÍLIA: Filha Iraci dos Santos Navarro (n. 13 jan 1942), Filho Jurandir Navarro (n. 9 mar 1943), com companheira Julia Batista dos Santos. Bisneto Marcio Duarte, neta Zélia Navarro.

EMPREGO: Trabalhou como servente no Hospital de Puericultura a partir de 1972.

RELACIONAMENTOS PENDENTES (entidades ainda não no dataset):
- student_of Samuel Querido de Deus
- student_of Vicente Pastinha
- associated_with Daniel Noronha (co-fundador CECA)
- associated_with Mucungê (co-fundador Filhos de Angola)
- associated_with Roque (co-fundador Filhos de Angola)
- co_founded Filhos de Angola (grupo) 1960
- member_of CECA (grupo) 1941'
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

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- Use ON CONFLICT DO NOTHING for idempotent sync
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- Onça Preta trained_under Aberrê (per O Cruzeiro 1948)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'O Cruzeiro magazine, January 10, 1948: "Aluno de Aberrê foi Onça Preta"',
  E'O Cruzeiro (1948) identifies Onça Preta as a student of Aberrê. However, Onça Preta himself stated in a 1972 interview he had "other references" beyond Aberrê, suggesting multiple teachers.',
  E'O Cruzeiro (1948) identifica Onça Preta como aluno de Aberrê. Porém, o próprio Onça Preta afirmou em entrevista de 1972 que teve "outras referências" além de Aberrê, sugerindo múltiplos professores.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Peers/Associates ---

-- Onça Preta associated_with Aberrê (peers at Matatu Preto, challenged each other)
-- Note: This captures the peer relationship beyond the student relationship above
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-05-16'::date, 'exact'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Peers at Matatu Preto training circle. Aberrê challenged Onça Preta to a match on May 16, 1936 in Salvador. On Aberrê''s death in 1972, Onça Preta mourned: ''We had lost a great master, an excellent friend.''"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-2; velhosmestres.com/br/destaques-34',
  E'Both trained at Matatu Preto on Sundays with other capoeiristas. In 1936, Aberrê challenged Onça Preta to a formal match. Despite competitive rivalry, they maintained friendship - Onça Preta mourned Aberrê''s death in 1972.',
  E'Ambos treinavam no Matatu Preto aos domingos com outros capoeiristas. Em 1936, Aberrê desafiou Onça Preta para uma luta formal. Apesar da rivalidade competitiva, mantiveram amizade - Onça Preta lamentou a morte de Aberrê em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (entities not yet in dataset)
-- ============================================================

-- The following relationships require entities that are not yet imported:
--
-- TEACHERS (student_of or trained_under):
-- - Samuel Querido de Deus (major influence, famous 1937 game)
-- - Vicente Pastinha (listed as one of his teachers)
-- - Besourinho (listed as teacher, killed by Pedrito)
-- - Vitor Agaú (also spelled Vitor H.Ú or Vitor H.D.)
-- - Gasolina (listed as teacher, killed by Pedrito)
--
-- PEERS (associated_with):
-- - Daniel Noronha (co-founder of CECA 1941)
-- - Amorzinho (co-founder of CECA 1941)
-- - Antonio Maré (co-founder of CECA 1941)
-- - Livino Diogo (co-founder of CECA 1941)
-- - Mucungê (co-founder of Filhos de Angola 1960)
-- - Dois de Ouro (co-founder of Filhos de Angola 1960)
-- - Baleado (co-founder of Filhos de Angola 1960)
-- - Imagem do Cão (co-founder of Filhos de Angola 1960)
-- - Roque (co-founder of Filhos de Angola 1960)
-- - Geraldo Chapeleiro (training companion at Matatu Preto)
-- - Mestre Paraná (played pandeiro on his 1963 LP)
-- - Artur Emídio (announced encounter, 1955)
--
-- GROUPS (member_of or co_founded):
-- - CECA (member_of, 1941 founding) - pending group import
-- - Filhos de Angola (co_founded, 1960) - pending group import
-- - Joel Lourenço's Capoeira Angola group (member_of, 1962) - pending group import

-- --- Person-to-Group: Membership at Roda do Matatu Preto ---

-- Onça Preta member_of Roda do Matatu Preto
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"membership_context": "Regular participant in Sunday training sessions at Matatu Preto in the 1930s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); velhosmestres.com/br/destaques-2',
  'Part of the Matatu Preto Sunday training group in Salvador during the 1930s, alongside Aberrê, Geraldo Chapeleiro, Totonho de Maré, and others. Per O Cruzeiro (1948), was a student of Aberrê.',
  'Parte do grupo de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Geraldo Chapeleiro, Totonho de Maré e outros. Segundo O Cruzeiro (1948), era aluno de Aberrê.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Onça Preta' AND g.name = 'Roda do Matatu Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Group: Co-founded Gengibirra ---

-- Onça Preta co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres of the Centro de Capoeira Angola at Ladeira de Pedra (Gengibirra).',
  'Um dos 22 mestres fundadores do Centro de Capoeira Angola na Ladeira de Pedra (Gengibirra).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Onça Preta' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/onca-preta.sql',
  NULL,
  ARRAY['persons/aberre.sql', 'groups/gengibirra.sql', 'groups/roda-do-matatu-preto.sql'],
  'Cícero Navarro "Onça Preta" (1909-2006): Bahian Angola mestre, bridge between first and second generations. Survived Pedrito persecution. Co-founder of CECA (1941) and Filhos de Angola (1960). Featured in Jorge Amado works and Ruth Landes photographs.'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
