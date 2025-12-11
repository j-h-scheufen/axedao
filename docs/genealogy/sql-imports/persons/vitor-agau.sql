-- ============================================================
-- GENEALOGY PERSON IMPORT: Vitor Agaú
-- Generated: 2025-12-11
-- Primary Source: https://velhosmestres.com/br/destaques-34
-- ============================================================
-- DEPENDENCIES: persons/onca-preta.sql, persons/pastinha.sql
-- ============================================================
--
-- Vitor Agaú (also Vitor H.D., Victor H.U.)
-- Early 20th century Salvador mestre; teacher of Onça Preta and Gaguinho Preto;
-- one of the mestres present at CECA founding (February 23, 1941).
--
-- BIRTH YEAR ESTIMATION (1880 with 'decade' precision):
-- He was teaching Onça Preta (born 1909) as a boy (c. 1915-1925).
-- If he was 30-50 years old when teaching, birth = ~1865-1895.
-- He also taught Gaguinho Preto (born 1934, started at age 4 in 1938).
-- To be an established teacher across both eras, born ~1870-1890.
-- Using 1880 as midpoint estimate.
--
-- DEATH: Unknown exact date. Onça Preta in 1972 stated his teachers
-- including Vitor Agaú were "hoje mortos" (now deceased). He survived
-- the Pedrito persecution (1920s) as he was present at CECA founding 1941.
-- Using 1960 as estimate (decade precision) - likely died between 1941-1972.
--
-- NAME VARIATIONS:
-- - Vitor Agaú (Onça Preta's testimony)
-- - Vitor H.D. (Mestre Pastinha's listing of CECA founders)
-- - Victor H.U. (velhosmestres.com listing for Gaguinho Preto's teacher)
-- Full name unknown; H.D./H.U. may be surname initials.
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
  NULL,
  'Vitor Agaú',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/br/destaques-34"}]'::jsonb,
  -- Capoeira-specific
  NULL,
  E'Pre-dates the Angola/Regional stylistic distinction. Associated with the Capoeira Angola tradition through his presence at CECA founding.',
  E'Anterior à distinção estilística Angola/Regional. Associado à tradição da Capoeira Angola por sua presença na fundação do CECA.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1960,
  'decade'::genealogy.date_precision,
  NULL,
  -- Extended content (bio_en)
  E'Vitor Agaú was one of the early mestres of capoeira in Salvador, Bahia, active during the early twentieth century. His name appears in the oral testimonies of several capoeiristas who learned from him or played alongside him in the great rodas of that era.

Mestre Onça Preta (Cícero Navarro, 1909-2006), recounting his youth in a 1972 interview, listed Vitor Agaú among the masters under whom he trained as a boy in Salvador. "I had not one, but many mestres," Onça Preta recalled. "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... and many others, who today are deceased." This testimony places Vitor Agaú alongside the greatest names of Bahian capoeira in the 1920s and 1930s - Samuel Querido de Deus (considered by many the greatest capoeirista of 1930s Salvador), Vicente Pastinha, and Raimundo Aberrê.

Unlike Besourinho and Gasolina, who were killed during the brutal persecution of capoeiristas by Police Chief Pedro de Azevedo Gordilho ("Pedrito") in the 1920s, Vitor Agaú survived to see capoeira emerge from the shadows. On February 23, 1941, he was among the mestres present at the historic gathering at Ladeira de Pedra in the Gengibirra neighborhood of Liberdade, where civil guard Amorzinho passed leadership of the traditional roda to Mestre Pastinha. This moment marked the founding of the Centro Esportivo de Capoeira Angola (CECA), the first academy dedicated to preserving the traditional Angolan style.

Mestre Pastinha''s own account lists "Vitor H.D." among those present alongside Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Olampio, Zeir, Alemão filho de Maré, Domingo de Milhães, Beraldo Izaque dos Santos, Pinião José Chibata, and Ricardo B. dos Santos.

Vitor Agaú also taught the next generation. Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002), who grew up in the Curva Grande neighborhood, learned capoeira starting at age four from three teachers: Menino Gordo da Curva Grande, Roque, and Victor H.U. (as his name appears in this source). Gaguinho Preto later passed through Pastinha''s CECA and trained with Zeca do Uruguai, but his foundational years were shaped by these early mestres including Vitor Agaú.

Mestre Roque also recalled playing capoeira with Vitor Agaú: "I jumped with Pastinha, Caiçara, Vitor Agaú, Onça Preta and many other masters of my time." This places Vitor Agaú in the active roda circuit of Salvador through at least the 1940s.

Little else is known about Vitor Agaú. His full name remains unrecorded - the initials "H.D." or "H.U." that appear in some sources may represent his surname, but its meaning has been lost. He left no written records, founded no academy, and his death went undocumented. Yet through the testimony of those he taught and played with, his name endures as one of the links in the chain that connects modern Capoeira Angola to its roots in early twentieth-century Salvador.',
  -- bio_pt
  E'Vitor Agaú foi um dos primeiros mestres de capoeira em Salvador, Bahia, ativo no início do século XX. Seu nome aparece nos testemunhos orais de vários capoeiristas que aprenderam com ele ou jogaram ao seu lado nas grandes rodas daquela época.

Mestre Onça Preta (Cícero Navarro, 1909-2006), relembrando sua juventude em entrevista de 1972, listou Vitor Agaú entre os mestres com quem treinou quando menino em Salvador. "Não tive um, mas muitos mestres," recordou Onça Preta. "Garoto ainda, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... e muitos outros, hoje mortos." Este testemunho coloca Vitor Agaú ao lado dos maiores nomes da capoeira baiana nas décadas de 1920 e 1930 - Samuel Querido de Deus (considerado por muitos o maior capoeirista de Salvador nos anos 1930), Vicente Pastinha e Raimundo Aberrê.

Diferentemente de Besourinho e Gasolina, que foram mortos durante a perseguição brutal aos capoeiristas pelo chefe de polícia Pedro de Azevedo Gordilho ("Pedrito") nos anos 1920, Vitor Agaú sobreviveu para ver a capoeira emergir das sombras. Em 23 de fevereiro de 1941, estava entre os mestres presentes no encontro histórico na Ladeira de Pedra, no bairro Gengibirra da Liberdade, onde o guarda civil Amorzinho passou a liderança da roda tradicional para Mestre Pastinha. Este momento marcou a fundação do Centro Esportivo de Capoeira Angola (CECA), a primeira academia dedicada a preservar o estilo tradicional angolano.

O próprio relato de Mestre Pastinha lista "Vitor H.D." entre os presentes ao lado de Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Olampio, Zeir, Alemão filho de Maré, Domingo de Milhães, Beraldo Izaque dos Santos, Pinião José Chibata e Ricardo B. dos Santos.

Vitor Agaú também ensinou a próxima geração. Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002), que cresceu no bairro da Curva Grande, aprendeu capoeira a partir dos quatro anos de idade com três professores: Menino Gordo da Curva Grande, Roque e Victor H.U. (como seu nome aparece nesta fonte). Gaguinho Preto depois passou pelo CECA de Pastinha e treinou com Zeca do Uruguai, mas seus anos de formação foram moldados por esses primeiros mestres, incluindo Vitor Agaú.

Mestre Roque também recordou jogar capoeira com Vitor Agaú: "Pulei com Pastinha, Caiçara, Vitor Agaú, Onça Preta e muitos outros mestres da minha época." Isto coloca Vitor Agaú no circuito ativo de rodas de Salvador pelo menos até os anos 1940.

Pouco mais se sabe sobre Vitor Agaú. Seu nome completo permanece não registrado - as iniciais "H.D." ou "H.U." que aparecem em algumas fontes podem representar seu sobrenome, mas seu significado se perdeu. Ele não deixou registros escritos, não fundou academia, e sua morte passou sem documentação. Ainda assim, através do testemunho daqueles que ele ensinou e com quem jogou, seu nome perdura como um dos elos na corrente que conecta a Capoeira Angola moderna às suas raízes no início do século XX em Salvador.',
  -- achievements_en
  E'One of the mestres present at the founding of CECA on February 23, 1941
Teacher of Mestre Onça Preta (Cícero Navarro, 1909-2006)
Teacher of Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002)
Survived the Pedrito persecution of the 1920s
Contemporary of Samuel Querido de Deus, Vicente Pastinha, and Raimundo Aberrê',
  -- achievements_pt
  E'Um dos mestres presentes na fundação do CECA em 23 de fevereiro de 1941
Professor de Mestre Onça Preta (Cícero Navarro, 1909-2006)
Professor de Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002)
Sobreviveu à perseguição de Pedrito nos anos 1920
Contemporâneo de Samuel Querido de Deus, Vicente Pastinha e Raimundo Aberrê',
  -- notes_en
  E'NAME VARIATIONS:
- Vitor Agaú (most common apelido, used by Onça Preta)
- Vitor H.D. (Mestre Pastinha''s listing of CECA founders)
- Victor H.U. (velhosmestres.com listing for Gaguinho Preto''s teacher)
Full name unknown. The initials may represent his surname but their meaning is lost.

BIRTH YEAR ESTIMATION (1880, decade precision):
He was teaching Onça Preta (b. 1909) as a boy (c. 1915-1925). If he was 30-50 when teaching, birth = ~1865-1895. He also taught Gaguinho Preto (b. 1934, started age 4 in 1938). To be an established teacher across both eras, using 1880 as midpoint estimate.

DEATH: Unknown exact date. Onça Preta stated in 1972 that his teachers including Vitor Agaú were "hoje mortos" (now deceased). He survived Pedrito persecution (1920s) as he was present at CECA founding 1941. Estimate death ~1950s-1960s, using 1960 with decade precision.

TITLE: No formal title recorded. Called "mestre" implicitly through his role as teacher and presence at CECA founding.

STYLE: Pre-dates Angola/Regional distinction (1930s). Associated with traditional Capoeira Angola through CECA.

SOURCES: Primary source is Onça Preta''s testimony recorded in velhosmestres.com and 1972 O Dia newspaper interview. Secondary sources include Mestre Pastinha''s account of CECA founders and Gaguinho Preto''s biographical information.

PENDING RELATIONSHIPS (require future imports):
- taught Gaguinho Preto (Everaldo Arcanjo de Assis)
- associated_with Samuel Querido de Deus
- associated_with Aberrê
- associated_with Noronha (Daniel Coutinho)
- associated_with Amorzinho
- associated_with Livino
- associated_with Mestre Roque
- member_of CECA (founding member 1941)',
  -- notes_pt
  E'VARIAÇÕES DE NOME:
- Vitor Agaú (apelido mais comum, usado por Onça Preta)
- Vitor H.D. (listagem de Mestre Pastinha dos fundadores do CECA)
- Victor H.U. (listagem do velhosmestres.com para professor de Gaguinho Preto)
Nome completo desconhecido. As iniciais podem representar seu sobrenome, mas seu significado se perdeu.

ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década):
Estava ensinando Onça Preta (n. 1909) quando menino (c. 1915-1925). Se tinha 30-50 anos quando ensinava, nascimento = ~1865-1895. Também ensinou Gaguinho Preto (n. 1934, começou aos 4 anos em 1938). Para ser professor estabelecido em ambas as eras, usando 1880 como estimativa do ponto médio.

MORTE: Data exata desconhecida. Onça Preta afirmou em 1972 que seus professores incluindo Vitor Agaú estavam "hoje mortos." Sobreviveu à perseguição de Pedrito (anos 1920) pois estava presente na fundação do CECA em 1941. Estimativa de morte ~1950s-1960s, usando 1960 com precisão de década.

TÍTULO: Nenhum título formal registrado. Chamado de "mestre" implicitamente através de seu papel como professor e presença na fundação do CECA.

ESTILO: Anterior à distinção Angola/Regional (anos 1930). Associado à Capoeira Angola tradicional através do CECA.

FONTES: Fonte primária é o testemunho de Onça Preta registrado em velhosmestres.com e entrevista ao jornal O Dia de 1972. Fontes secundárias incluem o relato de Mestre Pastinha sobre os fundadores do CECA e informações biográficas de Gaguinho Preto.

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- taught Gaguinho Preto (Everaldo Arcanjo de Assis)
- associated_with Samuel Querido de Deus
- associated_with Aberrê
- associated_with Noronha (Daniel Coutinho)
- associated_with Amorzinho
- associated_with Livino
- associated_with Mestre Roque
- member_of CECA (membro fundador 1941)'
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

-- Onça Preta student_of Vitor Agaú (per Onça Preta's testimony)
-- Note: Using student_of because Onça Preta explicitly called these his "mestres":
-- "Não tive um mestre, mas vários" (I didn't have one mestre, but many)
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
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta testimony, velhosmestres.com/br/destaques-34; O Dia newspaper 1972',
  E'Onça Preta (b. 1909) stated: "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... I had not one, but many mestres." Training was through public rodas rather than formal apprenticeship.',
  E'Onça Preta (n. 1909) afirmou: "Garoto ainda, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... Não tive um, mas muitos mestres." O treino era através de rodas públicas em vez de aprendizado formal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Vitor Agaú'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Contemporary Association ---

-- Vitor Agaú associated_with Pastinha (fellow CECA founder)
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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941 at Ladeira de Pedra in Gengibirra. Vitor H.D. is listed in Mestre Pastinha''s account of the mestres present when Amorzinho passed leadership to Pastinha."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account via jogodavidaweb.wordpress.com; capoeira.fandom.com/wiki/Mestre_Pastinha',
  E'Both were among the mestres present when civil guard Amorzinho passed leadership of the traditional roda at Gengibirra to Pastinha, founding CECA on February 23, 1941.',
  E'Ambos estavam entre os mestres presentes quando o guarda civil Amorzinho passou a liderança da roda tradicional no Gengibirra para Pastinha, fundando o CECA em 23 de fevereiro de 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles p
WHERE v.apelido = 'Vitor Agaú' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (entities not yet in dataset)
-- ============================================================

-- The following relationships require entities that are not yet imported:
--
-- STUDENTS (taught):
-- - Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002) - learned from Vitor Agaú starting age 4
--
-- PEERS (associated_with at CECA founding 1941):
-- - Amorzinho (civil guard, roda leader)
-- - Aberrê (Raimundo Aberrê) - IN DATASET but relationship not yet added
-- - Daniel Noronha (Mestre Noronha) - pending import
-- - Livino Diogo - pending import
-- - Antonio Maré (Totonho de Maré) - IN DATASET but relationship not yet added
-- - Samuel Querido de Deus - IN DATASET but relationship not yet added
-- - Mestre Roque - pending import
--
-- GROUPS:
-- - CECA (member_of, founding member 1941) - pending group import

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/vitor-agau.sql',
  NULL,
  ARRAY['persons/onca-preta.sql', 'persons/pastinha.sql']::text[],
  'Vitor Agaú (also Vitor H.D., Victor H.U.): Early Salvador mestre (~1880-~1960); teacher of Onça Preta and Gaguinho Preto; present at CECA founding Feb 23, 1941.'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
