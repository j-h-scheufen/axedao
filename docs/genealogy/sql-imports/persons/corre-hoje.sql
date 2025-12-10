-- ============================================================
-- GENEALOGY PERSON IMPORT: Corre Hoje
-- Generated: 2025-12-10
-- Primary Sources:
--   - https://educando-com-ginga.webnode.page/products/jose-nascimento-da-silva-mestre-nascimento-grande-pernambuco-1842-1936/
--   - https://mestrebrizola.webnode.com.br/assuntos/grandes-personagens/
-- ============================================================
-- DEPENDENCIES: persons/nascimento-grande.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1850 with 'decade' precision):
-- No dates provided in any source. Nascimento Grande was born 1842, active from
-- 1860s-1930s. The ambush incident likely occurred during peak of Recife
-- capoeira era (1880s-1890s). Corre Hoje must have been established enough to
-- organize 7 followers. Estimated born ~1850s, died ~1890s.
--
-- DEATH: Sources conflict on how Corre Hoje died:
-- 1. Shot by Nascimento Grande with a pistol during the attack (Educando com Ginga)
-- 2. Struck by a stray bullet intended for Nascimento Grande (Mestre Brizola)
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,  -- Full name unknown
  'Corre Hoje',
  NULL,
  NULL,
  NULL,
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s criminal underworld.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado ao submundo criminal do Recife.',
  -- Life dates
  1850,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  1890,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  -- bio_en
  E'Corre Hoje was a dangerous adversary of Nascimento Grande in late 19th century Recife, Pernambuco. He is remembered solely for his failed assassination attempt on the legendary capoeirista José Nascimento da Silva (Nascimento Grande).\n\nAccording to surviving accounts, Corre Hoje organized an attack with seven men to kill Nascimento Grande. The attempt failed, and Corre Hoje was killed in the confrontation. Sources provide conflicting details about his death: one account states he was shot by Nascimento Grande with a pistol in self-defense, while another states he was struck by a stray bullet intended for Nascimento Grande.\n\nLike many capoeiristas of his era, Corre Hoje lived during a time when capoeira was criminalized in Brazil. Practitioners faced severe persecution, including imprisonment, mutilation (Achilles heel slashing), and execution. The capoeira underworld of Recife was marked by territorial conflicts, rivalries between fighters, and confrontations with police.\n\nNo biographical details about Corre Hoje—including his real name, birth date, family, or other activities—have survived in historical records. He exists in capoeira history exclusively through his relationship to Nascimento Grande, serving as an example of the many adversaries the legendary fighter faced during his long life.',
  -- bio_pt
  E'Corre Hoje foi um adversário perigoso de Nascimento Grande no final do século XIX em Recife, Pernambuco. Ele é lembrado unicamente por sua tentativa fracassada de assassinar o lendário capoeirista José Nascimento da Silva (Nascimento Grande).\n\nSegundo relatos que sobreviveram, Corre Hoje organizou um ataque com sete homens para matar Nascimento Grande. A tentativa falhou, e Corre Hoje foi morto no confronto. As fontes fornecem detalhes conflitantes sobre sua morte: um relato afirma que ele foi baleado por Nascimento Grande com uma pistola em legítima defesa, enquanto outro afirma que foi atingido por uma bala perdida destinada a Nascimento Grande.\n\nComo muitos capoeiristas de sua época, Corre Hoje viveu durante um período em que a capoeira era criminalizada no Brasil. Os praticantes enfrentavam perseguição severa, incluindo prisão, mutilação (corte do tendão de Aquiles) e execução. O submundo da capoeira no Recife era marcado por conflitos territoriais, rivalidades entre lutadores e confrontos com a polícia.\n\nNenhum detalhe biográfico sobre Corre Hoje—incluindo seu nome verdadeiro, data de nascimento, família ou outras atividades—sobreviveu nos registros históricos. Ele existe na história da capoeira exclusivamente através de sua relação com Nascimento Grande, servindo como exemplo dos muitos adversários que o lutador lendário enfrentou durante sua longa vida.',
  -- Researcher notes (English)
  E'CONFLICTING DEATH ACCOUNTS: Two different narratives exist about how Corre Hoje died:\n1. Shot by Nascimento Grande with a pistol during the attack (Educando com Ginga source)\n2. Struck by a stray bullet intended for Nascimento Grande (Mestre Brizola source)\n\nBIRTH/DEATH ESTIMATES: No dates provided in any source. Estimates based on:\n- Nascimento Grande was born 1842, active from 1860s-1930s\n- Incident likely occurred during peak of Recife capoeira era (1880s-1890s)\n- Corre Hoje must have been established enough to organize 7 followers\n- Conservative estimate: born ~1850s, died ~1890s (both decade precision)\n\nNO BIOGRAPHICAL DATA: Real name, family, occupation, other activities completely unknown. Only mentioned in context of attack on Nascimento Grande.\n\nHISTORICAL CONTEXT: During this era, capoeira was illegal (1890 penal code). Many capoeiristas were involved in territorial disputes, carnival band conflicts, and criminal underworld activities in Recife.',
  -- Researcher notes (Portuguese)
  E'RELATOS CONFLITANTES DA MORTE: Existem duas narrativas diferentes sobre como Corre Hoje morreu:\n1. Baleado por Nascimento Grande com uma pistola durante o ataque (fonte Educando com Ginga)\n2. Atingido por uma bala perdida destinada a Nascimento Grande (fonte Mestre Brizola)\n\nESTIMATIVAS DE NASCIMENTO/MORTE: Nenhuma data fornecida em qualquer fonte. Estimativas baseadas em:\n- Nascimento Grande nasceu em 1842, ativo de 1860s-1930s\n- Incidente provavelmente ocorreu durante o auge da era da capoeira no Recife (1880s-1890s)\n- Corre Hoje deve ter sido estabelecido o suficiente para organizar 7 seguidores\n- Estimativa conservadora: nascido ~1850s, morreu ~1890s (ambos precisão de década)\n\nNENHUM DADO BIOGRÁFICO: Nome verdadeiro, família, ocupação, outras atividades completamente desconhecidas. Apenas mencionado no contexto do ataque a Nascimento Grande.\n\nCONTEXTO HISTÓRICO: Durante esta era, a capoeira era ilegal (código penal de 1890). Muitos capoeiristas estavam envolvidos em disputas territoriais, conflitos de bandas de carnaval e atividades do submundo criminal no Recife.'
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
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Enemy relationship with Nascimento Grande
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', ch.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Enemy of Nascimento Grande. Organized an attack with seven men to kill him but was killed in the attempt. Sources conflict on whether he was shot by Nascimento Grande in self-defense or struck by a stray bullet intended for Nascimento.", "pt": "Inimigo de Nascimento Grande. Organizou um ataque com sete homens para matá-lo mas foi morto na tentativa. Fontes conflitam se foi baleado por Nascimento Grande em legítima defesa ou atingido por uma bala perdida destinada a Nascimento."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Educando com Ginga (https://educando-com-ginga.webnode.page/), Mestre Brizola (https://mestrebrizola.webnode.com.br/)'
FROM genealogy.person_profiles ch, genealogy.person_profiles ng
WHERE ch.apelido = 'Corre Hoje' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/corre-hoje.sql',
  NULL,
  ARRAY['persons/nascimento-grande.sql'],
  'Enemy of Nascimento Grande; killed during failed assassination attempt with 7 men (~1890s)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
