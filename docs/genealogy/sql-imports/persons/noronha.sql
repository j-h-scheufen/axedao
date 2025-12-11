-- ============================================================
-- GENEALOGY PERSON IMPORT: Mestre Noronha (Daniel Coutinho)
-- Generated: 2025-12-11
-- Primary Source: https://velhosmestres.com/en/featured-9
-- ============================================================
-- DEPENDENCIES: persons/candido-pequeno.sql, groups/gengibirra.sql, persons/pastinha.sql
-- ============================================================
--
-- HISTORICAL CONTEXT:
-- Mestre Noronha (1909-1977) was a historian of capoeira Angola and author of
-- "O ABC da Capoeira Angola - Os Manuscritos do Mestre Noronha," the primary
-- source for documenting the founding of Gengibirra and the transition to CECA.
-- His manuscripts, compiled by Frede Abreu and published posthumously in 1993,
-- provide irreplaceable documentation of early 20th century capoeira in Salvador.
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
  'Daniel Coutinho',
  'Noronha',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-9"}, {"type": "website", "url": "https://www.lalaue.com/learn-capoeira/mestre-noronha/"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-noronha/"}, {"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira angola as taught by Mestre Cândido Pequeno. Noronha learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia" from his teacher. He practiced during the era of criminalization and helped preserve the art through formal organization at Gengibirra.',
  E'Capoeira angola tradicional como ensinada por Mestre Cândido Pequeno. Noronha aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia" com seu mestre. Praticou durante a era de criminalização e ajudou a preservar a arte através da organização formal no Gengibirra.',
  -- Life dates
  1909,
  'exact'::genealogy.date_precision,
  'Beco do Girassol, Baixa dos Sapateiros, Salvador, Bahia, Brazil',
  1977,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'Daniel Coutinho was born on August 3, 1909, in Beco do Girassol, in the Baixa dos Sapateiros neighborhood of Salvador, Bahia. His parents were José Coutinho and Maria Conceição, both of indigenous descent. Unlike most capoeiristas of his era, Noronha possessed reading and writing abilities, which he considered himself educated for that time.

At eight years old, in 1917, young Daniel began learning capoeira from Mestre Cândido Pequeno in Beco de Xaréu. Cândido Pequeno, known as "Argolinha de Ouro" (Golden Little Ring) for the small gold earring he wore, was recognized as "the champion of capoeira in the State of Bahia." From him, Noronha learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia," with complete dedication.

In the 1920s, Noronha was among the 22 founding mestres who established the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood. This was the first organized center for Capoeira Angola in Bahia. The center adopted green and yellow—the colors of the Brazilian flag—as its official colors. Four mestres were recognized as "donos e proprietários" (owners and proprietors): Noronha himself, his brother Livino (Livino Boca da Barra/Livino Malvadeza), Totonho de Maré, and Amorzinho.

With his brother Livino, Noronha also managed the Centro de Capoeira Angola da Conceição da Praia and taught in Maciel de Baixo, n° 31, in Salvador.

Noronha worked many jobs throughout his life: shoeshine boy, stevedore, dock worker (trapicheiro), ragpicker, shipboard worker, truck driver assistant, street porter, and in the petroleum industry. From 1939 onwards, he was employed at the Sindicato dos Conferentes e Consertadores de Carga e Descarga do Pôrto da Cidade do Salvador (the port workers'' union).

His personal life included two marriages. His first wife died during childbirth, leaving him with three children. His second marriage, lasting approximately 30 years, was to Maria Joana Batista Coutinho, known as "Dofana," a woman of the Kêtu nation devoted to Iansã. Together they had six children.

In 1941, after the death of Amorzinho (the civil guard who had protected the Gengibirra rodas from police harassment), Noronha and the other surviving mestres handed the Centro Nacional de Capoeira de Origem Angola to Mestre Pastinha. In Noronha''s own words: "Because of the death of Amorzinho, the guard, we handed over the Centre to Mestre Pastinha to take care and this Centre was registered by the efforts of Mestre Pastinha, who knew how to raise this Center to prominence."

In 1968, Noronha participated in Jair Moura''s film "Dança de Guerra." In 1971, he provided historical information for Jair Moura''s article published in A Tarde newspaper.

Throughout his life, Noronha documented his knowledge in handwritten notebooks using all capital letters, old Portuguese spelling conventions, and minimal punctuation—essentially transcribing speech directly. On April 29, 1976, at age 66, he completed his manuscripts. He died on November 17, 1977.

Frede Abreu first published his manuscripts in 1993 under the title "O ABC da Capoeira Angola: Os manuscritos do Mestre Noronha" with support from the Federal District Government and the National Programme of Capoeira. These manuscripts remain one of the most important primary sources for understanding early 20th century capoeira in Salvador, documenting not only techniques but the names, relationships, and organization of the founding generation of Capoeira Angola.',
  -- bio_pt
  E'Daniel Coutinho nasceu em 3 de agosto de 1909, no Beco do Girassol, na Baixa dos Sapateiros, Salvador, Bahia. Seus pais eram José Coutinho e Maria Conceição, ambos de descendência indígena. Diferentemente da maioria dos capoeiristas de sua época, Noronha possuía habilidades de leitura e escrita, o que ele considerava ser educado para aquele tempo.

Aos oito anos, em 1917, o jovem Daniel começou a aprender capoeira com Mestre Cândido Pequeno no Beco de Xaréu. Cândido Pequeno, conhecido como "Argolinha de Ouro" pelo pequeno brinco de ouro que usava, era reconhecido como "o campeão da capoeira do Estado da Bahia." Com ele, Noronha aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia," com completa dedicação.

Na década de 1920, Noronha estava entre os 22 mestres fundadores que estabeleceram o Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade. Este foi o primeiro centro organizado de Capoeira Angola na Bahia. O centro adotou o verde e amarelo—as cores da bandeira brasileira—como suas cores oficiais. Quatro mestres foram reconhecidos como "donos e proprietários": o próprio Noronha, seu irmão Livino (Livino Boca da Barra/Livino Malvadeza), Totonho de Maré e Amorzinho.

Com seu irmão Livino, Noronha também gerenciou o Centro de Capoeira Angola da Conceição da Praia e ensinou no Maciel de Baixo, n° 31, em Salvador.

Noronha trabalhou em muitos empregos ao longo da vida: engraxate, estivador, trapicheiro, catador, trabalhador de navio, ajudante de caminhoneiro, carregador de rua e na indústria petrolífera. A partir de 1939, foi empregado no Sindicato dos Conferentes e Consertadores de Carga e Descarga do Pôrto da Cidade do Salvador.

Sua vida pessoal incluiu dois casamentos. Sua primeira esposa morreu durante o parto, deixando-o com três filhos. Seu segundo casamento, durando aproximadamente 30 anos, foi com Maria Joana Batista Coutinho, conhecida como "Dofana," uma mulher da nação Kêtu devota de Iansã. Juntos tiveram seis filhos.

Em 1941, após a morte de Amorzinho (o guarda civil que havia protegido as rodas do Gengibirra do assédio policial), Noronha e os outros mestres sobreviventes entregaram o Centro Nacional de Capoeira de Origem Angola a Mestre Pastinha. Nas próprias palavras de Noronha: "Por causa da morte de Amorzinho, o guarda, nós entregamos o Centro a Mestre Pastinha para cuidar e este Centro foi registrado pelos esforços de Mestre Pastinha, que soube elevar este Centro à proeminência."

Em 1968, Noronha participou do filme "Dança de Guerra" de Jair Moura. Em 1971, forneceu informações históricas para o artigo de Jair Moura publicado no jornal A Tarde.

Ao longo de sua vida, Noronha documentou seu conhecimento em cadernos manuscritos usando todas as letras maiúsculas, convenções ortográficas do português antigo e pontuação mínima—essencialmente transcrevendo a fala diretamente. Em 29 de abril de 1976, aos 66 anos, completou seus manuscritos. Morreu em 17 de novembro de 1977.

Frede Abreu publicou seus manuscritos pela primeira vez em 1993 sob o título "O ABC da Capoeira Angola: Os manuscritos do Mestre Noronha" com apoio do Governo do Distrito Federal e do Programa Nacional de Capoeira. Esses manuscritos permanecem como uma das mais importantes fontes primárias para entender a capoeira do início do século XX em Salvador, documentando não apenas técnicas, mas os nomes, relacionamentos e organização da geração fundadora da Capoeira Angola.',
  -- achievements_en
  E'Co-founded the Centro Nacional de Capoeira de Origem Angola at Gengibirra (1920s) - the first organized Capoeira Angola center in Bahia
One of four recognized "donos e proprietários" (owners and proprietors) of Gengibirra alongside Livino, Totonho de Maré, and Amorzinho
Co-managed the Centro de Capoeira Angola da Conceição da Praia with his brother Mestre Livino
Participated in Jair Moura''s film "Dança de Guerra" (1968)
Authored "O ABC da Capoeira Angola - Os Manuscritos do Mestre Noronha" (completed 1976, published 1993)
Provided primary historical documentation of early 20th century capoeira including the founding mestres and organization of Gengibirra
His manuscripts serve as an irreplaceable source for capoeira historians',
  -- achievements_pt
  E'Co-fundou o Centro Nacional de Capoeira de Origem Angola no Gengibirra (década de 1920) - o primeiro centro organizado de Capoeira Angola na Bahia
Um dos quatro reconhecidos "donos e proprietários" do Gengibirra ao lado de Livino, Totonho de Maré e Amorzinho
Co-gerenciou o Centro de Capoeira Angola da Conceição da Praia com seu irmão Mestre Livino
Participou do filme "Dança de Guerra" de Jair Moura (1968)
Autor de "O ABC da Capoeira Angola - Os Manuscritos do Mestre Noronha" (concluído em 1976, publicado em 1993)
Forneceu documentação histórica primária da capoeira do início do século XX incluindo os mestres fundadores e organização do Gengibirra
Seus manuscritos servem como fonte insubstituível para historiadores da capoeira',
  -- notes_en
  E'BIRTH DATE: August 3, 1909 is documented across multiple sources including velhosmestres.com. Birth place: Beco do Girassol, Baixa dos Sapateiros.

DEATH DATE: November 17, 1977 is documented across multiple sources.

PARENTS: José Coutinho and Maria Conceição, both described as having indigenous descent.

TEACHER: Mestre Cândido Pequeno (Cândido da Costa), known as "Argolinha de Ouro" - began training 1917 in Beco de Xaréu.

BROTHER: Mestre Livino (Livino Boca da Barra / Livino Malvadeza) - co-founder of Gengibirra and co-manager of Centro de Capoeira Angola Conceição da Praia.

MANUSCRIPTS: Completed April 29, 1976. Published posthumously in 1993 by Frede Abreu with support from GDF, National Programme of Capoeira/Project Capoeira Art and Craft, DEFER, and CIDOCA/DF.

DISTINCTION FROM ANTÔNIO DE NORONHA: This is Daniel Coutinho "Mestre Noronha" (1909-1977), the historian. NOT to be confused with "Mestre Antônio de Noronha" (~1875-unknown), the historical teacher of Aberrê. They are two different people.

PENDING RELATIONSHIPS (require future imports):
- Noronha associated_with Livino (brother, co-founder of Gengibirra)
- Noronha associated_with Amorzinho (co-founder of Gengibirra)
- Various student relationships may exist but are not documented',
  -- notes_pt
  E'DATA DE NASCIMENTO: 3 de agosto de 1909 está documentado em múltiplas fontes incluindo velhosmestres.com. Local de nascimento: Beco do Girassol, Baixa dos Sapateiros.

DATA DE MORTE: 17 de novembro de 1977 está documentado em múltiplas fontes.

PAIS: José Coutinho e Maria Conceição, ambos descritos como tendo descendência indígena.

MESTRE: Mestre Cândido Pequeno (Cândido da Costa), conhecido como "Argolinha de Ouro" - começou a treinar em 1917 no Beco de Xaréu.

IRMÃO: Mestre Livino (Livino Boca da Barra / Livino Malvadeza) - co-fundador do Gengibirra e co-gestor do Centro de Capoeira Angola Conceição da Praia.

MANUSCRITOS: Concluídos em 29 de abril de 1976. Publicados postumamente em 1993 por Frede Abreu com apoio do GDF, Programa Nacional de Capoeira/Projeto Capoeira Arte e Ofício, DEFER e CIDOCA/DF.

DISTINÇÃO DE ANTÔNIO DE NORONHA: Este é Daniel Coutinho "Mestre Noronha" (1909-1977), o historiador. NÃO confundir com "Mestre Antônio de Noronha" (~1875-desconhecido), o mestre histórico de Aberrê. São duas pessoas diferentes.

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- Noronha associated_with Livino (irmão, co-fundador do Gengibirra)
- Noronha associated_with Amorzinho (co-fundador do Gengibirra)
- Vários relacionamentos de aluno podem existir mas não estão documentados'
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
-- ============================================================

-- --- Person-to-Person: Training & Lineage ---

-- Noronha student_of Cândido Pequeno (started 1917)
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
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1917-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"training_location": "Beco de Xaréu, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com/en/featured-9',
  'Noronha began training at age 8 (1917) with Mestre Cândido Pequeno in Beco de Xaréu. Learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia" with complete dedication.',
  'Noronha começou a treinar aos 8 anos (1917) com Mestre Cândido Pequeno no Beco de Xaréu. Aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia" com completa dedicação.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Noronha' AND o.apelido = 'Cândido Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Contemporary Associations ---

-- Noronha associated_with Pastinha (handed Gengibirra to Pastinha in 1941)
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '1977-11-17'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "One of the mestres who handed the Centro Nacional de Capoeira de Origem Angola (Gengibirra) to Pastinha in 1941. Noronha documented this transition in his manuscripts: ''Because of the death of Amorzinho, the guard, we handed over the Centre to Mestre Pastinha.''"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha was one of the Gengibirra founders who handed leadership to Pastinha in 1941 after Amorzinho''s death. Both trained at CECA and were contemporaries in the Bahian capoeira angola community.',
  'Noronha foi um dos fundadores do Gengibirra que passou a liderança para Pastinha em 1941 após a morte de Amorzinho. Ambos treinaram no CECA e foram contemporâneos na comunidade de capoeira angola baiana.'
FROM genealogy.person_profiles n, genealogy.person_profiles p
WHERE n.apelido = 'Noronha' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Noronha associated_with Totonho de Maré (co-founder of Gengibirra)
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, t.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Livino and Amorzinho."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Noronha and Totonho de Maré were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia.',
  'Noronha e Totonho de Maré foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia.'
FROM genealogy.person_profiles n, genealogy.person_profiles t
WHERE n.apelido = 'Noronha' AND t.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Noronha associated_with Aberrê (co-founder of Gengibirra)
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s. Aberrê (listed as ''Raimundo ABR'') later introduced Pastinha to the roda in 1941."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha and Aberrê were both founding mestres of Gengibirra in the 1920s. Aberrê later brought Pastinha to witness the roda in February 1941.',
  'Noronha e Aberrê foram ambos mestres fundadores do Gengibirra na década de 1920. Aberrê depois trouxe Pastinha para assistir à roda em fevereiro de 1941.'
FROM genealogy.person_profiles n, genealogy.person_profiles a
WHERE n.apelido = 'Noronha' AND a.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Noronha associated_with Geraldo Chapeleiro (co-founder of Gengibirra)
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha and Geraldo Chapeleiro were both founding mestres of Gengibirra in the 1920s.',
  'Noronha e Geraldo Chapeleiro foram ambos mestres fundadores do Gengibirra na década de 1920.'
FROM genealogy.person_profiles n, genealogy.person_profiles g
WHERE n.apelido = 'Noronha' AND g.apelido = 'Geraldo Chapeleiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Noronha associated_with Onça Preta (co-founder of Gengibirra)
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha and Onça Preta were both founding mestres of Gengibirra in the 1920s.',
  'Noronha e Onça Preta foram ambos mestres fundadores do Gengibirra na década de 1920.'
FROM genealogy.person_profiles n, genealogy.person_profiles o
WHERE n.apelido = 'Noronha' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Group: Founding & Leadership ---

-- Noronha co_founded Gengibirra (1920s) - as dono e proprietário
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
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"founding_role": "dono_proprietario"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Livino, Totonho de Maré, and Amorzinho. Also one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola.',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Livino, Totonho de Maré e Amorzinho. Também um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Noronha' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Noronha leads Gengibirra (1920s-1941) - organizational leadership
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
  'leads'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{"leadership_role": "dono_proprietario", "context": "One of four organizational leaders recognized in his own manuscripts; leadership ended when center was handed to Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" providing organizational leadership. Term indicates custodianship/leadership, not property ownership (Ladeira de Pedra was a public street).',
  'Um dos quatro "donos e proprietários" fornecendo liderança organizacional. O termo indica custódia/liderança, não propriedade (Ladeira de Pedra era uma rua pública).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Noronha' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Amorzinho (co-founder of Gengibirra) ---

-- Noronha associated_with Amorzinho (co-founder of Gengibirra)
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Livino and Totonho de Maré. Amorzinho provided protection as civil guard and led rodas."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Noronha and Amorzinho were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia. Amorzinho died in 1943.',
  'Noronha e Amorzinho foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia. Amorzinho morreu em 1943.'
FROM genealogy.person_profiles n, genealogy.person_profiles a
WHERE n.apelido = 'Noronha' AND a.apelido = 'Amorzinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
--
-- 1. Noronha associated_with Livino (brother, co-founder of Gengibirra)
--    Requires persons/livino.sql import
--    Type: family_of with relationship_type: sibling
--    AND associated_with for Gengibirra co-founding
--
-- 2. Noronha member_of Centro de Capoeira Angola Conceição da Praia
--    Group not yet in dataset
--
-- 3. Various founding mestre associations:
--    Percílio, Juvenal Engraxate, Geraldo Pé de Abelha, Zehí,
--    Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada,
--    Cimento, Argemiro Grande, Olho de Pombo, Antônio Galindeu,
--    Antônio Boca de Porco, Lúcio Pequeno, Paquete do Cabula
--    (all pending person imports)
--
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/noronha.sql',
  NULL,
  ARRAY['persons/candido-pequeno.sql', 'groups/gengibirra.sql', 'persons/pastinha.sql', 'persons/totonho-de-mare.sql', 'persons/aberre.sql', 'persons/geraldo-chapeleiro.sql', 'persons/onca-preta.sql', 'persons/amorzinho.sql']::text[],
  'Daniel Coutinho (1909-1977); historian of Capoeira Angola; one of four founders of Gengibirra; author of "O ABC da Capoeira Angola" manuscripts'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
