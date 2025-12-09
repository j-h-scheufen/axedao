-- ============================================================
-- GENEALOGY PERSON IMPORT: Cirandinha
-- Generated: 2025-12-09
-- Primary Sources:
--   - https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/
--   - https://www.elitesports.com/blogs/news/carlson-gracie-the-ultimate-bjj-grandmaster
--   - https://nossa-tribo.com/mestre-sinhozinho/
--   - A Noite newspaper, April 1, 1949
-- ============================================================
-- DEPENDENCIES: persons/sinhozinho.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION: Unknown
-- No birth or death dates found for Cirandinha. Based on his activity:
-- - Fought as heavyweight (100kg) in 1949 and 1953
-- - Was an established weightlifter and "Brazilian capoeira champion"
-- - If he was 25-35 years old in 1949, birth = ~1914-1924
-- Using 1920 as midpoint estimate with decade precision.
--
-- DEATH: Unknown. No records of his death have been found.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (upsert pattern for idempotent sync)
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
  'Luiz Pereira de Aguiar',
  'Cirandinha',
  NULL,  -- No formal title found
  NULL,  -- No historical portrait found
  '[{"type": "website", "url": "https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'Cirandinha practiced capoeira carioca under Mestre Sinhozinho, a combat-focused style distinct from both Angola and Regional. His training emphasized fighting effectiveness, incorporating Greco-Roman wrestling, judo, and boxing elements. He was also trained by judoka Augusto Cordeiro, Sinhozinho''s combat consultant. His fighting style combined capoeira kicks with wrestling takedowns and ground control.',
  E'Cirandinha praticou capoeira carioca sob Mestre Sinhozinho, um estilo focado em combate distinto tanto do Angola quanto da Regional. Seu treinamento enfatizava a eficácia na luta, incorporando elementos de luta greco-romana, judô e boxe. Ele também foi treinado pelo judoca Augusto Cordeiro, consultor de combate de Sinhozinho. Seu estilo de luta combinava chutes de capoeira com projeções de luta e controle no solo.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Luiz Pereira de Aguiar, known by the apelidos "Luiz Ciranda" or "Cirandinha," was a heavyweight capoeirista and weightlifter who trained under Mestre Sinhozinho in Rio de Janeiro during the 1940s and 1950s. Described as a "Brazilian capoeira champion," he represented the combat-focused capoeira carioca style in some of the most significant inter-style challenges of the mid-twentieth century.

Cirandinha trained at Sinhozinho''s academies in Ipanema and the city center, where practitioners trained in weightlifting, gymnastics, boxing, capoeira, and other disciplines. His training was supplemented by judoka Augusto Cordeiro, who served as Sinhozinho''s combat consultant. This cross-training produced a formidable fighter who combined capoeira kicks with wrestling techniques.

His first documented competition came in April 1949, when Sinhozinho challenged Mestre Bimba''s Capoeira Regional school to a formal fighting event. The newspaper A Noite announced the "Capoeira Challenge - Sinhozinho of the Federal District against Master Bimba from Bahia." The event was organized by the Metropolitan Federation of Pugilism (Federacao Metropolitana de Pugilismo) and held over two days at the Estadio Carioca on Avenida Passos in downtown Rio. In the first match on April 2, 1949, Cirandinha faced Bimba''s student Jurandir, who also practiced judo. Cirandinha knocked him out in the first round with a devastating body kick. Jurandir claimed it was a low blow, but witnesses and the ring doctor ruled otherwise, and the result stood. The victory demonstrated the effectiveness of Sinhozinho''s combat approach against the Bahian style.

Four years later, Cirandinha represented Sinhozinho again in a challenge against the Gracie family. On March 17, 1953, a vale tudo charity event was held at the Vasco da Gama stadium, with proceeds going to drought relief victims in Brazil''s northeastern region. Carlson Gracie, weighing approximately 67 kilograms, had issued an open challenge to fighters across the country. Cirandinha, at 100 kilograms, accepted - a 33-kilogram weight advantage.

The fight against Carlson Gracie revealed both Cirandinha''s strengths and limitations. In the early moments, he dominated with strikes and kicks, including a hip throw and heavy hooks that nearly finished Gracie. However, as the fight progressed, Cirandinha''s conditioning failed him. Carlson survived the initial onslaught, pulled him into guard, and worked to a dominant position on the ground. From the mount, Carlson threw punches and elbows until Cirandinha''s corner threw in the towel to protect their fighter. The newspaper O Popular called both winners (Carlson and Hermanny, who fought Guanair Gomes) "impressive," while O Cruzeiro magazine proclaimed: "brave men''s blood soaked a concrete square in the Vasco stadium."

In the same event, Cirandinha''s training partner Rudolf Hermanny fought to a draw with Guanair Gomes after one hour and ten minutes, looking fresher than his opponent at the end. This was considered a moral victory for Sinhozinho''s school.

Cirandinha''s name comes from "ciranda," a traditional Brazilian circle dance. The diminutive "-inha" suggests either youth or affection, though the origin of his nickname remains undocumented. His career represents a significant chapter in the history of capoeira carioca and the inter-style rivalries that shaped Brazilian martial arts in the twentieth century.',
  -- bio_pt
  E'Luiz Pereira de Aguiar, conhecido pelos apelidos "Luiz Ciranda" ou "Cirandinha", foi um capoeirista peso-pesado e halterofilista que treinou com Mestre Sinhozinho no Rio de Janeiro durante as decadas de 1940 e 1950. Descrito como "campeao brasileiro de capoeira", ele representou o estilo de capoeira carioca focado em combate em alguns dos desafios inter-estilos mais significativos de meados do seculo XX.

Cirandinha treinou nas academias de Sinhozinho em Ipanema e no centro da cidade, onde os praticantes treinavam halterofilismo, ginastica, boxe, capoeira e outras disciplinas. Seu treinamento foi complementado pelo judoca Augusto Cordeiro, que servia como consultor de combate de Sinhozinho. Esse treinamento cruzado produziu um lutador formidavel que combinava chutes de capoeira com tecnicas de luta.

Sua primeira competicao documentada foi em abril de 1949, quando Sinhozinho desafiou a escola de Capoeira Regional de Mestre Bimba para um evento formal de lutas. O jornal A Noite anunciou o "Desafio de Capoeira - Sinhozinho do Distrito Federal contra Mestre Bimba da Bahia". O evento foi organizado pela Federacao Metropolitana de Pugilismo e realizado em dois dias no Estadio Carioca na Avenida Passos, no centro do Rio. Na primeira luta em 2 de abril de 1949, Cirandinha enfrentou o aluno de Bimba, Jurandir, que tambem praticava judo. Cirandinha nocauteou-o no primeiro round com um devastador chute no corpo. Jurandir alegou que foi um golpe baixo, mas testemunhas e o medico do ringue decidiram de forma contraria, e o resultado foi mantido. A vitoria demonstrou a eficacia da abordagem de combate de Sinhozinho contra o estilo baiano.

Quatro anos depois, Cirandinha representou Sinhozinho novamente em um desafio contra a familia Gracie. Em 17 de marco de 1953, um evento beneficente de vale tudo foi realizado no estadio do Vasco da Gama, com a renda destinada as vitimas da seca no Nordeste do Brasil. Carlson Gracie, pesando aproximadamente 67 quilos, havia lancado um desafio aberto a lutadores de todo o pais. Cirandinha, com 100 quilos, aceitou - uma vantagem de 33 quilos de peso.

A luta contra Carlson Gracie revelou tanto os pontos fortes quanto as limitacoes de Cirandinha. Nos primeiros momentos, ele dominou com golpes e chutes, incluindo uma projecao de quadril e ganchos pesados que quase finalizaram Gracie. Porem, conforme a luta progredia, o condicionamento de Cirandinha falhou. Carlson sobreviveu ao ataque inicial, puxou-o para a guarda e trabalhou para uma posicao dominante no chao. Da montada, Carlson desferiu socos e cotoveladas ate que o corner de Cirandinha jogou a toalha para proteger seu lutador. O jornal O Popular chamou ambos os vencedores (Carlson e Hermanny, que lutou contra Guanair Gomes) de "impressionantes", enquanto a revista O Cruzeiro proclamou: "o sangue de homens bravos molhou uma praca de concreto no estadio do Vasco".

No mesmo evento, o parceiro de treino de Cirandinha, Rudolf Hermanny, lutou ate um empate com Guanair Gomes apos uma hora e dez minutos, parecendo mais fresco que seu oponente ao final. Isso foi considerado uma vitoria moral para a escola de Sinhozinho.

O nome de Cirandinha vem de "ciranda", uma danca de roda tradicional brasileira. O diminutivo "-inha" sugere juventude ou afeicao, embora a origem de seu apelido permaneca nao documentada. Sua carreira representa um capitulo significativo na historia da capoeira carioca e das rivalidades inter-estilos que moldaram as artes marciais brasileiras no seculo XX.',
  -- achievements_en
  'Brazilian capoeira champion (title claimed during his active period); Knocked out Jurandir (Mestre Bimba''s student) in the first round at the 1949 Capoeira Challenge at Estadio Carioca; Represented Sinhozinho''s capoeira carioca in the 1953 vale tudo challenge against the Gracie family at Vasco da Gama stadium; Heavyweight weightlifter',
  -- achievements_pt
  'Campeao brasileiro de capoeira (titulo reivindicado durante seu periodo ativo); Nocauteou Jurandir (aluno de Mestre Bimba) no primeiro round no Desafio de Capoeira de 1949 no Estadio Carioca; Representou a capoeira carioca de Sinhozinho no desafio de vale tudo de 1953 contra a familia Gracie no estadio do Vasco da Gama; Halterofilista peso-pesado',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1920, decade precision): No birth or death dates found for Cirandinha. Based on his activity as an established heavyweight fighter (100kg) and weightlifter in 1949 and 1953, if he was 25-35 years old in 1949, birth would be approximately 1914-1924. Using 1920 as midpoint estimate.

DEATH: Unknown. No records of his death have been found.

NAME VARIANTS: Also known as "Luiz Ciranda" and "Luiz Cirandinha Aguiar" in sources. The name "Ciranda/Cirandinha" refers to a traditional Brazilian circle dance.

WEIGHT: Documented as approximately 100 kg (heavyweight) in the 1953 fight against Carlson Gracie (67 kg), representing a 33 kg weight advantage.

TITLE: Described as "Brazilian capoeira champion" in sources, but the specific competition or criteria for this title is not documented.

TRAINING: Trained under Mestre Sinhozinho in Ipanema. Also trained with judoka Augusto Cordeiro, who served as Sinhozinho''s combat consultant.

FIGHT RECORD:
- April 2, 1949: Defeated Jurandir (Bimba''s student) by KO in Round 1 at Estadio Carioca
- March 17, 1953: Lost to Carlson Gracie by corner stoppage (towel) at Vasco da Gama stadium

PENDING RELATIONSHIPS:
- Carlson Gracie is not in genealogy dataset (BJJ, not capoeira)
- Jurandir (Bimba''s student) not yet imported
- Augusto Cordeiro (judo consultant) - unclear if should be imported (primarily judoka)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, precisao de decada): Nenhuma data de nascimento ou morte encontrada para Cirandinha. Com base em sua atividade como lutador peso-pesado estabelecido (100kg) e halterofilista em 1949 e 1953, se ele tinha 25-35 anos em 1949, o nascimento seria aproximadamente 1914-1924. Usando 1920 como estimativa do ponto medio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

VARIANTES DE NOME: Tambem conhecido como "Luiz Ciranda" e "Luiz Cirandinha Aguiar" nas fontes. O nome "Ciranda/Cirandinha" refere-se a uma danca de roda tradicional brasileira.

PESO: Documentado como aproximadamente 100 kg (peso pesado) na luta de 1953 contra Carlson Gracie (67 kg), representando uma vantagem de 33 kg de peso.

TITULO: Descrito como "campeao brasileiro de capoeira" nas fontes, mas a competicao especifica ou criterios para este titulo nao estao documentados.

TREINAMENTO: Treinou sob Mestre Sinhozinho em Ipanema. Tambem treinou com o judoca Augusto Cordeiro, que servia como consultor de combate de Sinhozinho.

HISTORICO DE LUTAS:
- 2 de abril de 1949: Derrotou Jurandir (aluno de Bimba) por nocaute no 1o round no Estadio Carioca
- 17 de marco de 1953: Perdeu para Carlson Gracie por interrupcao do corner (toalha) no estadio do Vasco da Gama

RELACIONAMENTOS PENDENTES:
- Carlson Gracie nao esta no dataset de genealogia (BJJ, nao capoeira)
- Jurandir (aluno de Bimba) ainda nao importado
- Augusto Cordeiro (consultor de judo) - nao claro se deve ser importado (principalmente judoca)'
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
-- ============================================================

-- Cirandinha student_of Sinhozinho
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
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/; A Noite newspaper April 1, 1949',
  'Cirandinha trained under Mestre Sinhozinho at his academies in Ipanema and downtown Rio de Janeiro. He was one of Sinhozinho''s top competitive fighters, representing the school in challenges against Mestre Bimba''s Regional (1949) and the Gracie family (1953).',
  'Cirandinha treinou sob Mestre Sinhozinho em suas academias em Ipanema e no centro do Rio de Janeiro. Ele foi um dos principais lutadores competitivos de Sinhozinho, representando a escola em desafios contra a Regional de Mestre Bimba (1949) e a familia Gracie (1953).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cirandinha' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING STATEMENTS (entities not yet in dataset)
-- ============================================================
-- The following relationships cannot be created yet because the objects
-- don't exist in the genealogy dataset:
--
-- Person-to-Person (training):
-- - Cirandinha trained_under Augusto Cordeiro (judo consultant)
--   Note: Augusto Cordeiro was primarily a judoka, not a capoeirista
--   Requires determination of whether to import non-capoeiristas
--
-- Person-to-Person (competition):
-- - Cirandinha defeated Jurandir (April 2, 1949)
--   Requires: persons/jurandir.sql (Bimba's student)
--
-- - Cirandinha lost to Carlson Gracie (March 17, 1953)
--   Note: Carlson Gracie was a BJJ practitioner, not a capoeirista
--   Unlikely to be imported to capoeira genealogy
--
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/cirandinha.sql',
  NULL,
  ARRAY['persons/sinhozinho.sql']::text[],
  'Heavyweight capoeirista and weightlifter (100kg); student of Sinhozinho; "Brazilian capoeira champion"; KO''d Jurandir 1949; lost to Carlson Gracie 1953'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
