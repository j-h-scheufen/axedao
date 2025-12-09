-- ============================================================
-- GENEALOGY PERSON IMPORT: Mestre Aberrê
-- Generated: 2025-12-08
-- Primary Source: https://velhosmestres.com/en/featured-2
-- ============================================================
-- IMPORTANT CONTROVERSY: There may have been TWO different persons
-- named "Aberrê" in Bahian capoeira:
-- 1. Antônio Raimundo Argolo (b. 1895, Salvador) - inviter of Pastinha
-- 2. Antônio Rufino dos Santos (Santo Amaro) - teacher of Mestre Caiçara
-- This import focuses on the documented figure from Salvador.
-- ============================================================
-- DEPENDENCIES: persons/pastinha.sql, persons/noronha.sql, persons/canjiquinha.sql, persons/caiçara.sql, groups/gengibirra.sql, persons/onca-preta.sql, persons/geraldo-chapeleiro.sql, persons/totonho-de-mare.sql, persons/creoni.sql, persons/chico-tres-pedacos.sql, persons/paulo-barroquinha.sql, persons/barboza.sql
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Antônio Raimundo Argolo',
  'Aberrê',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-2"}, {"type": "website", "url": "https://esquiva.wordpress.com/mestres/mestre-aberre/"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-aberre/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  'Practiced the pre-codified capoeira of early 20th century Salvador. His teaching emphasized practical self-defense: negativa, queda de rim, and falling techniques. He explained students needed to know how to fall if pushed in the street.',
  'Praticava a capoeira pré-codificada do início do século XX em Salvador. Seu ensino enfatizava autodefesa prática: negativa, queda de rim e técnicas de queda. Explicava que alunos precisavam saber cair caso fossem empurrados na rua.',
  -- Life dates
  1895,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1942,
  'month'::genealogy.date_precision,
  'Fuisco de Baixo, Jacaré, Salvador, Brazil',
  -- Extended content (bio)
  'Antônio Raimundo Argolo was born on August 6, 1895, in Salvador—the same year as the legendary Besouro Mangangá. Son of Ângelo Argolo and Maria R. de Argolo, he grew up to become one of the pivotal figures in the survival of Capoeira Angola.

By 1910, the teenage Aberrê was already practicing capoeira in the Baixada do Matatu Preto in the Matatu neighborhood. He trained among a formidable generation: Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, and Barbosa. Sources disagree on his primary teacher—some attribute his training to Mestre Pastinha, others to Mestre Antônio de Noronha, and some suggest both.

In 1935, Aberrê began teaching a 10-year-old named Washington Bruno da Silva—who would become Mestre Canjiquinha, "the joy of capoeira." He also trained Mestre Caiçara (though some accounts attribute Caiçara to a different "Aberrê de Santo Amaro"). Aberrê emphasized practical street defense: negativa, queda de rim, and how to fall safely. When asked why, he explained simply: if someone pushes you in the street, you need to know how to land.

In 1936, Aberrê proved himself in Salvador''s fighting circuit. On March 25, he challenged Mestre Bimba at Parque Odeon. On May 16, he faced Onça Preta (Cícero Navarro). These challenges demonstrated his standing among the great mestres of his era.

By 1939, he was working as a mason at Santa Casa de Misericórdia da Bahia, living at Rua das Pitangueiras, n°50. Ruth Landes may have photographed him in October 1938 during her anthropological research in Salvador.

Then came 1941—the year Aberrê changed capoeira history. With several mestres dead and the tradition in danger of fragmenting, Aberrê convinced his former teacher (or student—accounts conflict) Pastinha to return to capoeira after a 30-year absence. According to Mestre Noronha''s manuscripts, Aberrê exercised leadership among the capoeiristas and, along with Amorzinho and Totonho de Maré, had helped create the Angolan capoeira center at Conceição da Praia—the embryo of the legendary Gengibirra roda.

On February 23, 1941, Aberrê invited Pastinha to a Sunday roda at Ladeira de Gengibirra in the Liberdade neighborhood. Aberrê was already famous at these gatherings. When Pastinha arrived, Amorzinho—a civil guard who led the roda—offered him the berimbau: "I have been waiting a long time to give you this capoeira for you to master." With Aberrê, Amorzinho, and Antonio Maré passing him the instrument, Pastinha became the leader of Capoeira Angola. Without Aberrê''s intervention, the "pastiniana" lineage might never have existed.

In September 1942, at a lively roda in Lower City where the Estrela de Salomão (Star of Solomon) was drawn, Aberrê was dominating his adversary when suddenly, without anyone expecting it, he collapsed. According to Mestre Canjiquinha, Aberrê had eaten beans with fat that morning, sang capoeira songs, then fell ill during a student''s game, collapsing during cartwheels. Mestre Onça Preta confirmed: it was a heart attack.

For weeks, no one played capoeira in Bahia. Everyone understood they had lost a great master.

The bengala (walking cane) that Aberrê always carried—both for elegance and as a potential weapon—he gave to his student Caiçara before his death. It remained a symbol of their lineage.

**Note on the "Two Aberrês" controversy:** Some sources identify Caiçara''s teacher as "Antônio Rufino dos Santos, Aberrê de Santo Amaro"—suggesting two different capoeiristas named Aberrê. Both Canjiquinha and Caiçara denied connection to Pastinha''s lineage, which fuels this theory. If true, Bahian capoeira history would need revision. The documented Aberrê of this import—Antônio Raimundo Argolo of Salvador—is the one who invited Pastinha to Gengibirra and died in 1942.',
  -- bio_pt
  'Antônio Raimundo Argolo nasceu em 6 de agosto de 1895 em Salvador—o mesmo ano do lendário Besouro Mangangá. Filho de Ângelo Argolo e Maria R. de Argolo, ele cresceu para se tornar uma das figuras centrais na sobrevivência da Capoeira Angola.

Por volta de 1910, o adolescente Aberrê já praticava capoeira na Baixada do Matatu Preto, no bairro do Matatu. Ele treinou entre uma geração formidável: Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha e Barbosa. As fontes divergem sobre seu professor principal—algumas atribuem seu treinamento a Mestre Pastinha, outras a Mestre Antônio de Noronha, e algumas sugerem ambos.

Em 1935, Aberrê começou a ensinar um garoto de 10 anos chamado Washington Bruno da Silva—que se tornaria Mestre Canjiquinha, "a alegria da capoeira". Ele também treinou Mestre Caiçara (embora alguns relatos atribuam Caiçara a um diferente "Aberrê de Santo Amaro"). Aberrê enfatizava a defesa prática de rua: negativa, queda de rim e como cair com segurança. Quando perguntado por quê, explicava simplesmente: se alguém te empurrar na rua, você precisa saber como aterrissar.

Em 1936, Aberrê provou seu valor no circuito de lutas de Salvador. Em 25 de março, desafiou Mestre Bimba no Parque Odeon. Em 16 de maio, enfrentou Onça Preta (Cícero Navarro). Esses desafios demonstraram sua posição entre os grandes mestres de sua era.

Em 1939, trabalhava como pedreiro na Santa Casa de Misericórdia da Bahia, morando na Rua das Pitangueiras, n°50. Ruth Landes pode tê-lo fotografado em outubro de 1938 durante sua pesquisa antropológica em Salvador.

Então veio 1941—o ano em que Aberrê mudou a história da capoeira. Com vários mestres mortos e a tradição em perigo de fragmentar-se, Aberrê convenceu seu antigo professor (ou aluno—os relatos conflitam) Pastinha a retornar à capoeira após uma ausência de 30 anos. Segundo os manuscritos de Mestre Noronha, Aberrê exercia liderança entre os capoeiristas e, junto com Amorzinho e Totonho de Maré, havia ajudado a criar o centro de capoeira angolana na Conceição da Praia—o embrião da lendária roda de Gengibirra.

Em 23 de fevereiro de 1941, Aberrê convidou Pastinha para uma roda de domingo na Ladeira de Gengibirra no bairro da Liberdade. Aberrê já era famoso nessas reuniões. Quando Pastinha chegou, Amorzinho—um guarda civil que liderava a roda—ofereceu-lhe o berimbau: "Há muito tempo espero para lhe dar esta capoeira para você comandar." Com Aberrê, Amorzinho e Antonio Maré passando-lhe o instrumento, Pastinha tornou-se o líder da Capoeira Angola. Sem a intervenção de Aberrê, a linhagem "pastiniana" talvez nunca tivesse existido.

Em setembro de 1942, em uma animada roda na Cidade Baixa onde estava desenhada a Estrela de Salomão, Aberrê dominava seu adversário quando subitamente, sem ninguém esperar, ele desabou. Segundo Mestre Canjiquinha, Aberrê havia comido feijão com gordura naquela manhã, cantou músicas de capoeira, depois passou mal durante o jogo de um aluno, desabando durante as rodas (aú). Mestre Onça Preta confirmou: foi um ataque cardíaco.

Por semanas, ninguém jogou capoeira na Bahia. Todos entenderam que haviam perdido um grande mestre.

A bengala que Aberrê sempre carregava—tanto por elegância quanto como potencial arma—ele deu ao seu aluno Caiçara antes de sua morte. Permaneceu como símbolo de sua linhagem.

**Nota sobre a controvérsia dos "Dois Aberrês":** Algumas fontes identificam o professor de Caiçara como "Antônio Rufino dos Santos, Aberrê de Santo Amaro"—sugerindo dois capoeiristas diferentes chamados Aberrê. Tanto Canjiquinha quanto Caiçara negaram conexão com a linhagem de Pastinha, o que alimenta essa teoria. Se verdade, a história da capoeira baiana precisaria de revisão. O Aberrê documentado neste import—Antônio Raimundo Argolo de Salvador—é aquele que convidou Pastinha para Gengibirra e morreu em 1942.',
  -- achievements
  'March 25, 1936: Challenged Mestre Bimba at Parque Odeon, Salvador
May 16, 1936: Challenged Onça Preta (Cícero Navarro) in fighting circuit
February 23, 1941: Invited Pastinha to Gengibirra and facilitated the handover of Capoeira Angola leadership
1935-1942: Trained Mestre Canjiquinha and (possibly) Mestre Caiçara—both became major lineage founders
Co-founded Centro de Capoeira Angola at Conceição da Praia (precursor to Gengibirra)',
  -- achievements_pt
  '25 de março de 1936: Desafiou Mestre Bimba no Parque Odeon, Salvador
16 de maio de 1936: Desafiou Onça Preta (Cícero Navarro) no circuito de lutas
23 de fevereiro de 1941: Convidou Pastinha para Gengibirra e facilitou a passagem da liderança da Capoeira Angola
1935-1942: Treinou Mestre Canjiquinha e (possivelmente) Mestre Caiçara—ambos tornaram-se fundadores de grandes linhagens
Co-fundador do Centro de Capoeira Angola na Conceição da Praia (precursor de Gengibirra)',
  -- notes (researcher metadata)
  'CONTROVERSY: Two different individuals may have been named "Aberrê" - (1) Antônio Raimundo Argolo of Salvador who invited Pastinha to Gengibirra, and (2) Antônio Rufino dos Santos of Santo Amaro who may have taught Caiçara. Both Canjiquinha and Caiçara denied connection to Pastinha''s lineage. Sources: ipcb-rj.com.br, velhosmestres.com. Full name from birth records per velhosmestres.com. Death circumstances recorded by both Mestre Canjiquinha and Mestre Onça Preta. Possible appearance in Ruth Landes photographs (October 23, 1938) but unconfirmed.',
  -- notes_pt
  'CONTROVÉRSIA: Dois indivíduos diferentes podem ter sido chamados "Aberrê" - (1) Antônio Raimundo Argolo de Salvador que convidou Pastinha para Gengibirra, e (2) Antônio Rufino dos Santos de Santo Amaro que pode ter ensinado Caiçara. Tanto Canjiquinha quanto Caiçara negaram conexão com a linhagem de Pastinha. Fontes: ipcb-rj.com.br, velhosmestres.com. Nome completo de registros de nascimento conforme velhosmestres.com. Circunstâncias da morte registradas por Mestre Canjiquinha e Mestre Onça Preta. Possível aparição em fotografias de Ruth Landes (23 de outubro de 1938) mas não confirmado.'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- NOTE: Aberrê's teacher(s) - Pastinha and/or Noronha
-- Pastinha: Not yet in dataset (pending import)
-- Noronha: Not yet in dataset (no SQL generated)
-- PENDING: Generate statements when Pastinha is imported

-- NOTE: Aberrê's students - Canjiquinha and Caiçara
-- Neither is yet in dataset (pending import)
-- PENDING: Generate statements when students are imported

-- --- Person-to-Group: Founding & Leadership ---

-- NOTE: Centro de Capoeira Angola at Conceição da Praia / Gengibirra
-- Not yet in dataset (pending groups import)
-- PENDING: Generate statement when group is imported

-- --- Matatu Preto Training Group (1930s) ---

-- Aberrê associated_with Onça Preta (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Led the Sunday training sessions at Matatu Preto; challenged Onça Preta in 1936',
  'Liderou as sessões de treino de domingo no Matatu Preto; desafiou Onça Preta em 1936'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê associated_with Geraldo Chapeleiro (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Geraldo Chapeleiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê associated_with Totonho de Maré (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; both also co-founded Gengibirra; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto; both involved in founding Gengibirra',
  'Contemporâneos no Matatu Preto; ambos envolvidos na fundação da Gengibirra'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê associated_with Creoni (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Creoni'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê associated_with Chico Três Pedaços (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê associated_with Paulo Barroquinha (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Paulo Barroquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê associated_with Barboza (Matatu Preto training group)
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
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Barboza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/aberre.sql',
  NULL,
  ARRAY['persons/pastinha.sql', 'persons/noronha.sql', 'persons/canjiquinha.sql', 'persons/caiçara.sql', 'groups/gengibirra.sql', 'persons/onca-preta.sql', 'persons/geraldo-chapeleiro.sql', 'persons/totonho-de-mare.sql', 'persons/creoni.sql', 'persons/chico-tres-pedacos.sql', 'persons/paulo-barroquinha.sql', 'persons/barboza.sql']::text[],
  'Pivotal figure who invited Pastinha to Gengibirra 1941; trained Canjiquinha; led Matatu Preto training group; controversial identity with possible second Aberrê de Santo Amaro'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- When these entities are imported, add the following statements:
--
-- 1. Aberrê trained_under Pastinha (c. 1910-1912)
--    - confidence: disputed (some say Pastinha was his student, not teacher)
--    - source: "learned capoeira around 1910-12 with Mestre Pastinha and/or Mestre Noronha"
--
-- 2. Aberrê trained_under Noronha (Antonio de Noronha) (c. 1910-1912)
--    - confidence: likely
--    - source: Esquiva, velhosmestres
--
-- 3. Canjiquinha student_of Aberrê (1935-1942)
--    - confidence: verified
--    - source: Multiple sources confirm, Canjiquinha's own testimony
--    - properties: { training_location: "Baixa do Tubo, Matatu Pequeno" }
--
-- 4. Caiçara student_of Aberrê (1938-1942)
--    - confidence: likely (disputed whether same Aberrê)
--    - source: Multiple sources, but controversy over "two Aberrês"
--
-- 5. Aberrê co_founded Centro de Capoeira Angola (Conceição da Praia)
--    - confidence: likely
--    - source: Mestre Noronha's manuscripts
--
-- 6. Aberrê associated_with Gengibirra founders (Amorzinho, Totonho de Maré, Noronha, Livino)
--    - confidence: verified
--    - source: Noronha manuscripts
-- ============================================================
