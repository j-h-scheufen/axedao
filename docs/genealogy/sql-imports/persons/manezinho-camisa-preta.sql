-- ============================================================
-- GENEALOGY PERSON IMPORT: Manezinho Camisa Preta
-- Generated: 2025-12-10
-- Primary Sources:
--   - http://casadoengenho.no.comunidades.net/nascimento-grande
--   - https://educando-com-ginga.webnode.page/products/jose-nascimento-da-silva-mestre-nascimento-grande-pernambuco-1842-1936/
--   - https://capoeiraracanegra.webnode.page/lendas-da-capoeira/nascimento-grande/
-- ============================================================
-- DEPENDENCIES: persons/nascimento-grande.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1860 with 'decade' precision):
-- Manezinho challenged Nascimento Grande (born 1842) as an established fighter.
-- The fight likely occurred during Nascimento Grande's prime or middle years
-- (1870s-1890s). For Manezinho to be a credible challenger with reputation,
-- he would need to be in his physical prime (20s-40s). Using 1860 as estimate.
--
-- DEATH: Killed by Nascimento Grande at Largo da Carioca, Rio de Janeiro.
-- Exact year unknown.
--
-- DISTINCTION FROM MIGUELZINHO CAMISA PRETA: This is NOT the same person as
-- Miguelzinho Camisa Preta (Alfredo Francisco Soares), who was assassinated
-- by police on July 12, 1912. Different person, similar nickname.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  NULL, -- Unknown birth name
  'Manezinho Camisa Preta',
  NULL,
  NULL,
  NULL,
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL, -- Unknown exact death year
  NULL,
  'Largo da Carioca, Rio de Janeiro, Brazil',
  -- bio_en
  E'Manezinho Camisa Preta was a legendary valentão (fighter/tough guy) from Rio de Janeiro whose reputation led him to challenge Nascimento Grande, the most feared capoeirista of Pernambuco.\n\nAccording to multiple sources, during a trip to Rio de Janeiro, Nascimento Grande killed Manezinho Camisa Preta in an epic battle at Largo da Carioca—a famous public square in central Rio that served as a gathering place and site of historical capoeira confrontations. The fight was so intense it was described as transforming the plaza into "the Peloponnese," a reference to the ancient Greek peninsula famous for warfare, particularly the battles of Sparta.\n\nManezinho was one of several famous fighters whose reputations attracted them to challenge Nascimento Grande. Along with Pirajé from Pará and Pajeú from the Pernambuco sertão, Manezinho''s name appears in the roster of legendary Brazilian fighters who sought to test themselves against "O Capoeira."\n\nHis nickname "Manezinho" is a diminutive form of Mané (Manuel), and "Camisa Preta" (Black Shirt) was likely a distinctive element of his appearance or fighting style. He should not be confused with Miguelzinho Camisa Preta (real name Alfredo Francisco Soares), a different Rio de Janeiro malandro and capoeirista who was assassinated by police in 1912.',
  -- bio_pt
  E'Manezinho Camisa Preta foi um lendário valentão do Rio de Janeiro cuja reputação o levou a desafiar Nascimento Grande, o capoeirista mais temido de Pernambuco.\n\nSegundo múltiplas fontes, durante uma viagem ao Rio de Janeiro, Nascimento Grande matou Manezinho Camisa Preta em uma batalha épica no Largo da Carioca—uma famosa praça pública no centro do Rio que servia como ponto de encontro e local de confrontos históricos de capoeira. A luta foi tão intensa que foi descrita como transformando a praça na "península do Peloponeso", uma referência à antiga península grega famosa pela guerra, particularmente as batalhas de Esparta.\n\nManezinho foi um dos vários lutadores famosos cujas reputações os atraíram para desafiar Nascimento Grande. Junto com Pirajé do Pará e Pajeú do sertão pernambucano, o nome de Manezinho aparece na lista de lendários lutadores brasileiros que buscaram se testar contra "O Capoeira."\n\nSeu apelido "Manezinho" é uma forma diminutiva de Mané (Manuel), e "Camisa Preta" era provavelmente um elemento distintivo de sua aparência ou estilo de luta. Ele não deve ser confundido com Miguelzinho Camisa Preta (nome verdadeiro Alfredo Francisco Soares), um diferente malandro e capoeirista do Rio de Janeiro que foi assassinado pela polícia em 1912.',
  -- achievements_en
  'Legendary Rio de Janeiro valentão; challenged Nascimento Grande at Largo da Carioca; immortalized in capoeira lore',
  -- achievements_pt
  'Lendário valentão do Rio de Janeiro; desafiou Nascimento Grande no Largo da Carioca; imortalizado no folclore da capoeira',
  -- Researcher notes (English)
  E'BIRTH DATE: Unknown. Estimated 1860s (decade precision) based on likely timeline of challenging Nascimento Grande (b. 1842) during late 19th century.\n\nDEATH DATE: Unknown exact year. Died at Largo da Carioca, Rio de Janeiro, killed by Nascimento Grande. The fight likely occurred in the late 19th or early 20th century during one of Nascimento Grande''s trips to Rio.\n\nDISTINCTION FROM MIGUELZINHO CAMISA PRETA: This is NOT the same person as Miguelzinho Camisa Preta (Alfredo Francisco Soares), who was assassinated by police officer Elpídio Ribeiro da Rocha on July 12, 1912. That Miguelzinho was born around 1880-1890 and died in 1912. Our Manezinho Camisa Preta died earlier in a fight with Nascimento Grande.\n\nLARGO DA CARIOCA: A historic public square in Rio de Janeiro, site of a major water fountain (built 1723, demolished 1925) and known location for capoeira activity and confrontations in the 19th century.\n\nPELOPONNESE REFERENCE: The description of the fight transforming the plaza into "the Peloponnese" is a literary flourish comparing the battle to ancient Greek warfare, emphasizing its legendary scale and intensity.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: Desconhecida. Estimada década de 1860 (precisão de década) baseada na provável linha do tempo de desafiar Nascimento Grande (n. 1842) durante o final do século XIX.\n\nDATA DE MORTE: Ano exato desconhecido. Morreu no Largo da Carioca, Rio de Janeiro, morto por Nascimento Grande. A luta provavelmente ocorreu no final do século XIX ou início do século XX durante uma das viagens de Nascimento Grande ao Rio.\n\nDISTINÇÃO DE MIGUELZINHO CAMISA PRETA: Este NÃO é a mesma pessoa que Miguelzinho Camisa Preta (Alfredo Francisco Soares), que foi assassinado pelo policial Elpídio Ribeiro da Rocha em 12 de julho de 1912. Aquele Miguelzinho nasceu por volta de 1880-1890 e morreu em 1912. Nosso Manezinho Camisa Preta morreu antes em uma luta com Nascimento Grande.\n\nLARGO DA CARIOCA: Uma praça pública histórica no Rio de Janeiro, local de uma grande fonte de água (construída em 1723, demolida em 1925) e local conhecido para atividade de capoeira e confrontos no século XIX.\n\nREFERÊNCIA AO PELOPONESO: A descrição da luta transformando a praça no "Peloponeso" é um floreio literário comparando a batalha à guerra grega antiga, enfatizando sua escala e intensidade lendárias.'
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

-- Association with Nascimento Grande (fatal challenge)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', mc.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Legendary Rio de Janeiro valentão who challenged Nascimento Grande to a fight to the death at Largo da Carioca. The battle was so intense it was described as transforming the plaza into the Peloponnese. Nascimento Grande killed him in this epic confrontation.", "pt": "Lendário valentão do Rio de Janeiro que desafiou Nascimento Grande para um combate de morte no Largo da Carioca. A batalha foi tão intensa que foi descrita como transformando a praça no Peloponeso. Nascimento Grande o matou neste confronto épico."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Multiple sources about Nascimento Grande including Casa do Engenho, Educando com Ginga, Grupo Capoeira Raça Negra'
FROM genealogy.person_profiles mc, genealogy.person_profiles ng
WHERE mc.apelido = 'Manezinho Camisa Preta' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/manezinho-camisa-preta.sql',
  NULL,
  ARRAY['persons/nascimento-grande.sql'],
  'Rio de Janeiro valentão killed by Nascimento Grande at Largo da Carioca'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
