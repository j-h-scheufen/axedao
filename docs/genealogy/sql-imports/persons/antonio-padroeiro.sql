-- ============================================================
-- GENEALOGY PERSON IMPORT: Antonio Padroeiro
-- Generated: 2025-12-10
-- Primary Sources:
--   - https://educando-com-ginga.webnode.page/products/jose-nascimento-da-silva-mestre-nascimento-grande-pernambuco-1842-1936/
-- ============================================================
-- DEPENDENCIES: persons/nascimento-grande.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1850 with 'decade' precision):
-- No direct evidence exists. Based on typical fighting career timeline and
-- assumption he was in his prime (20s-40s) when confronting Nascimento Grande
-- in late 19th century.
--
-- DEATH YEAR ESTIMATION (1890 with 'decade' precision):
-- Died during confrontation with Nascimento Grande. No specific date recorded.
-- Given Nascimento Grande's long career (1860s-1930s), death likely occurred
-- during the peak rivalry period of 1870s-1900s.
--
-- DEATH CIRCUMSTANCES: According to primary source (Educando com Ginga),
-- "Antonio Padroeiro, after being disarmed, died of so much beating"
-- (morreu de tanto apanhar após ser desarmado).
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
  'Antonio Padroeiro',
  'Antonio Padroeiro',
  NULL,
  NULL,
  '[]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s late 19th century capoeira tradition.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado à tradição de capoeira do Recife do final do século XIX.',
  -- Life dates
  1850,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  1890,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  -- bio_en
  E'Antonio Padroeiro was one of the most dangerous adversaries of the legendary Nascimento Grande (José Nascimento da Silva) in late 19th century Recife, Pernambuco.\n\nAccording to historical accounts, Padroeiro was among those who attempted to kill Nascimento Grande, driven by the fierce rivalries that characterized Recife''s capoeira underworld during the era when the art was illegal and brutally suppressed by authorities.\n\nTheir confrontation ended fatally for Padroeiro. After being disarmed during the fight, he was beaten to death by Nascimento Grande. This outcome cemented Nascimento Grande''s reputation as an invincible fighter and demonstrated the deadly serious nature of capoeira rivalries in 19th century Brazil.\n\nBeyond this fatal encounter, no biographical details about Padroeiro''s life, training, background, or other exploits have been preserved in available historical sources. He remains a shadowy figure known primarily through his role as one of the few men bold—or reckless—enough to challenge the most feared capoeirista in Pernambuco''s history.',
  -- bio_pt
  E'Antonio Padroeiro foi um dos adversários mais perigosos do lendário Nascimento Grande (José Nascimento da Silva) no Recife do final do século XIX, Pernambuco.\n\nDe acordo com relatos históricos, Padroeiro estava entre aqueles que tentaram matar Nascimento Grande, impulsionado pelas ferozes rivalidades que caracterizavam o submundo da capoeira do Recife durante a era em que a arte era ilegal e brutalmente reprimida pelas autoridades.\n\nSeu confronto terminou fatalmente para Padroeiro. Depois de ser desarmado durante a luta, foi espancado até a morte por Nascimento Grande. Este desfecho cimentou a reputação de Nascimento Grande como um lutador invencível e demonstrou a natureza mortalmente séria das rivalidades da capoeira no Brasil do século XIX.\n\nAlém deste encontro fatal, nenhum detalhe biográfico sobre a vida, treinamento, antecedentes ou outras façanhas de Padroeiro foi preservado nas fontes históricas disponíveis. Ele permanece uma figura sombria conhecida principalmente por seu papel como um dos poucos homens corajosos—ou imprudentes—o suficiente para desafiar o capoeirista mais temido da história de Pernambuco.',
  -- Researcher notes (English)
  E'BIRTH YEAR: ~1850 - decade precision estimate. No direct evidence exists. Based on typical fighting career timeline and assumption he was in his prime (20s-40s) when confronting Nascimento Grande in late 19th century.\n\nDEATH YEAR: ~1890 - decade precision estimate. Died during confrontation with Nascimento Grande. No specific date recorded. Given Nascimento Grande''s long career (1860s-1930s), death likely occurred during the peak rivalry period of 1870s-1900s.\n\nDEATH CIRCUMSTANCES: According to primary source (Educando com Ginga), "Antonio Padroeiro, after being disarmed, died of so much beating" (morreu de tanto apanhar após ser desarmado).\n\nLIMITED SOURCES: Only mentioned in relation to Nascimento Grande. No independent biographical information found despite multiple searches across Portuguese and English sources.',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: ~1850 - estimativa de precisão de década. Nenhuma evidência direta existe. Baseado na linha do tempo típica de carreira de lutador e suposição de que estava em seu auge (20-40 anos) ao confrontar Nascimento Grande no final do século XIX.\n\nANO DE MORTE: ~1890 - estimativa de precisão de década. Morreu durante confronto com Nascimento Grande. Nenhuma data específica registrada. Dado a longa carreira de Nascimento Grande (1860s-1930s), a morte provavelmente ocorreu durante o período de pico de rivalidade de 1870s-1900s.\n\nCIRCUNSTÂNCIAS DA MORTE: De acordo com fonte primária (Educando com Ginga), "Antonio Padroeiro, após ser desarmado, morreu de tanto apanhar".\n\nFONTES LIMITADAS: Mencionado apenas em relação a Nascimento Grande. Nenhuma informação biográfica independente encontrada apesar de múltiplas buscas em fontes portuguesas e inglesas.'
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
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Association with Nascimento Grande (enemy/adversary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', ap.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Dangerous adversary who attempted to kill Nascimento Grande. After being disarmed in their confrontation, Padroeiro was beaten to death. One of only two enemies explicitly named as Nascimento Grande''s most dangerous challengers (alongside Corre Hoje).", "pt": "Adversário perigoso que tentou matar Nascimento Grande. Depois de ser desarmado em seu confronto, Padroeiro foi espancado até a morte. Um dos únicos dois inimigos explicitamente nomeados como os desafiantes mais perigosos de Nascimento Grande (junto com Corre Hoje)."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Educando com Ginga: Nascimento Grande biography'
FROM genealogy.person_profiles ap, genealogy.person_profiles ng
WHERE ap.apelido = 'Antonio Padroeiro' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/antonio-padroeiro.sql',
  NULL,
  ARRAY['persons/nascimento-grande.sql'],
  'Dangerous enemy of Nascimento Grande; beaten to death after being disarmed (~1890s)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
