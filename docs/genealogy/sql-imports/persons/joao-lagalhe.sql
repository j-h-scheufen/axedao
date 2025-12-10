-- ============================================================
-- GENEALOGY PERSON IMPORT: João-Lagalhé
-- Generated: 2025-12-10
-- Primary Sources:
--   - Plácido de Abreu, "Os Capoeiras" (1886) - first book on capoeira
--   - https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/
-- ============================================================
-- DEPENDENCIES: persons/cesar-maneta.sql, persons/alemaozinho.sql, persons/jaco.sql, persons/pinta-preta-da-lapa.sql, persons/placido-de-abreu.sql
-- ============================================================
--
-- ACTIVITY DATE: ~1870 (active during the vendetta cycle)
-- Killed César-Maneta on Praia do Peixe (Fish Beach) in 1870.
--
-- BIRTH YEAR ESTIMATION (1840 with 'decade' precision):
-- João-Lagalhé was an active capoeirista who killed the "famous" César-Maneta
-- in 1870. To be capable of killing a famous fighter, he was likely a mature,
-- experienced capoeirista, probably 25-40 years old, placing his birth
-- in the 1830s-1840s range. Using 1840 as midpoint.
--
-- FATE UNKNOWN: Plácido de Abreu's account ends with João-Lagalhé killing
-- César-Maneta. Whether he became the next victim in the vendetta cycle
-- or survived is unknown from available sources.
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
  NULL,  -- Full name unknown; "João" may be first name, "Lagalhé" may be surname or nickname component
  'João-Lagalhé',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[{"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro.',
  -- Life dates
  1840,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed based on activity location
  NULL,  -- Death year unknown - he may have survived or been killed later
  NULL,
  NULL,  -- Death place unknown
  -- bio_en
  E'João-Lagalhé was a capoeirista in Rio de Janeiro who killed the "famous" César-Maneta on the Praia do Peixe (Fish Beach) in 1870, continuing the vendetta cycle that had convulsed the capoeira maltas that year.

Plácido de Abreu documented his act in "Os Capoeiras" (1886): "after this came the death of the Alemãozinho [Small German], next to the old Lyrical Theatre do Campo, by the famous César-Maneta that, shortly after was also murdered on the Peixe Beach, by João-Lagalhé."

The Praia do Peixe where João-Lagalhé struck was located near the Candelária Market, in the area of modern Praça XV—a bustling commercial zone where fish was sold and small boats docked. To kill a "famous" capoeirista in such a public location required either exceptional skill, the element of surprise, or both.

What happened to João-Lagalhé after he killed César-Maneta is unknown. Abreu wrote that "these reprisals have continued until today," implying the vendetta cycle did not end with César-Maneta''s death. Whether João-Lagalhé became the next victim, fled, or somehow escaped the cycle is lost to history.

His name suggests "João" as a first name (one of the most common in Portuguese) and "Lagalhé" as either a surname or nickname. The origin of "Lagalhé" is unclear—it may be of French origin (many French-derived surnames exist in Brazil) or a local variant of another name.

João-Lagalhé''s documented act—killing the famous César-Maneta in a public fish market—represents a single violent moment preserved in Plácido de Abreu''s chronicle. Beyond this act, his life remains a blank.',
  -- bio_pt
  E'João-Lagalhé foi um capoeirista no Rio de Janeiro que matou o "famoso" César-Maneta na Praia do Peixe em 1870, continuando o ciclo de vingança que havia convulsionado as maltas de capoeira naquele ano.

Plácido de Abreu documentou seu ato em "Os Capoeiras" (1886): "depois disso veio a morte do Alemãozinho, perto do velho Teatro Lírico do Campo, pelo famoso César-Maneta que, pouco depois também foi assassinado na Praia do Peixe, por João-Lagalhé."

A Praia do Peixe onde João-Lagalhé atacou ficava perto do Mercado da Candelária, na área da moderna Praça XV—uma zona comercial movimentada onde peixe era vendido e pequenos barcos atracavam. Matar um capoeirista "famoso" em local tão público exigia habilidade excepcional, o elemento surpresa, ou ambos.

O que aconteceu com João-Lagalhé depois que ele matou César-Maneta é desconhecido. Abreu escreveu que "essas represálias continuaram até hoje," implicando que o ciclo de vingança não terminou com a morte de César-Maneta. Se João-Lagalhé se tornou a próxima vítima, fugiu, ou de alguma forma escapou do ciclo está perdido na história.

Seu nome sugere "João" como primeiro nome (um dos mais comuns em português) e "Lagalhé" como sobrenome ou apelido. A origem de "Lagalhé" é incerta—pode ser de origem francesa (muitos sobrenomes derivados do francês existem no Brasil) ou uma variante local de outro nome.

O ato documentado de João-Lagalhé—matar o famoso César-Maneta em um mercado de peixe público—representa um único momento violento preservado na crônica de Plácido de Abreu. Além desse ato, sua vida permanece em branco.',
  -- achievements_en
  'Killed the "famous" César-Maneta on Praia do Peixe in 1870, continuing the vendetta cycle',
  -- achievements_pt
  'Matou o "famoso" César-Maneta na Praia do Peixe em 1870, continuando o ciclo de vingança',
  -- Researcher notes (English)
  E'NAME: Known as "João-Lagalhé" - whether "João" is first name and "Lagalhé" is surname/nickname is unclear. "Lagalhé" origin unknown, possibly French-derived.

BIRTH YEAR ESTIMATION (1840, decade precision): Active capoeirista who killed the "famous" César-Maneta in 1870. To defeat a famous fighter, likely 25-40 years old, placing birth in 1830s-1840s. Using 1840 as midpoint.

DEATH: Unknown. Plácido de Abreu''s account ends with João-Lagalhé killing César-Maneta. Whether he became the next victim in the vendetta cycle or survived is not recorded.

KILL LOCATION: Praia do Peixe (Fish Beach), Rio de Janeiro. Near the Candelária Market area.

AFFILIATION: Malta affiliation (Nagoa or Guaiamum) unknown. His role as killer of César-Maneta (who had killed Alemãozinho) suggests possible rivalry or vendetta motivation.

VICTIM KILLED: César-Maneta (the "famous" capoeirista) on Praia do Peixe, 1870.

SIGNIFICANCE: Last named individual in the vendetta sequence documented by Plácido de Abreu: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (killer) → ?

SOURCES: Plácido de Abreu "Os Capoeiras" (1886) - only known source for this individual.

PENDING RELATIONSHIPS:
- associated_with César-Maneta (victim - João-Lagalhé killed him)
- associated_with Alemãozinho (vendetta sequence - victim before César-Maneta)
- associated_with Jacó (vendetta sequence)
- associated_with Pinta Preta da Lapa (vendetta sequence - first victim)',
  -- Researcher notes (Portuguese)
  E'NOME: Conhecido como "João-Lagalhé" - se "João" é primeiro nome e "Lagalhé" é sobrenome/apelido não é claro. Origem de "Lagalhé" desconhecida, possivelmente derivado do francês.

ESTIMATIVA DO ANO DE NASCIMENTO (1840, precisão de década): Capoeirista ativo que matou o "famoso" César-Maneta em 1870. Para derrotar um lutador famoso, provavelmente tinha 25-40 anos, colocando o nascimento nos anos 1830-1840. Usando 1840 como ponto médio.

MORTE: Desconhecida. O relato de Plácido de Abreu termina com João-Lagalhé matando César-Maneta. Se ele se tornou a próxima vítima no ciclo de vingança ou sobreviveu não está registrado.

LOCAL DO ASSASSINATO: Praia do Peixe, Rio de Janeiro. Perto da área do Mercado da Candelária.

AFILIAÇÃO: Afiliação à malta (Nagoa ou Guaiamum) desconhecida. Seu papel como assassino de César-Maneta (que havia matado Alemãozinho) sugere possível rivalidade ou motivação de vingança.

VÍTIMA MORTA: César-Maneta (o "famoso" capoeirista) na Praia do Peixe, 1870.

SIGNIFICÂNCIA: Último indivíduo nomeado na sequência de vingança documentada por Plácido de Abreu: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (assassino) → ?

FONTES: Plácido de Abreu "Os Capoeiras" (1886) - única fonte conhecida para este indivíduo.

RELACIONAMENTOS PENDENTES:
- associated_with César-Maneta (vítima - João-Lagalhé o matou)
- associated_with Alemãozinho (sequência de vingança - vítima antes de César-Maneta)
- associated_with Jacó (sequência de vingança)
- associated_with Pinta Preta da Lapa (sequência de vingança - primeira vítima)'
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
-- ============================================================

-- --- Person-to-Person: Association with César-Maneta ---
-- João-Lagalhé killed César-Maneta on Praia do Peixe

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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "João-Lagalhé killed César-Maneta on Praia do Peixe (Fish Beach) in 1870, continuing the vendetta cycle documented by Plácido de Abreu. This was shortly after César-Maneta had killed Alemãozinho."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'João-Lagalhé was the killer of César-Maneta. Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta (killed by João-Lagalhé).',
  'João-Lagalhé foi o assassino de César-Maneta. Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta (morto por João-Lagalhé).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'César-Maneta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Association with Alemãozinho ---
-- Both part of the same vendetta cycle

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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Alemãozinho was killed by César-Maneta; João-Lagalhé then killed César-Maneta in retaliation."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence. João-Lagalhé killed César-Maneta, who had killed Alemãozinho.',
  'Parte da sequência de vingança documentada. João-Lagalhé matou César-Maneta, que havia matado Alemãozinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'Alemãozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Association with Jacó ---
-- Both part of the same vendetta cycle

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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Jacó was an earlier victim in the sequence; João-Lagalhé later killed César-Maneta."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (killer).',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (assassino).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'Jacó'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Association with Pinta Preta da Lapa ---
-- Both part of the same vendetta cycle

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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Pinta Preta''s death (Jan 7, 1870) triggered the cycle that eventually led to João-Lagalhé killing César-Maneta."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (killer). Pinta Preta''s death initiated the cycle.',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta → João-Lagalhé (assassino). A morte de Pinta Preta iniciou o ciclo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João-Lagalhé' AND o.apelido = 'Pinta Preta da Lapa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/joao-lagalhe.sql',
  NULL,
  ARRAY['persons/cesar-maneta.sql', 'persons/alemaozinho.sql', 'persons/jaco.sql', 'persons/pinta-preta-da-lapa.sql', 'persons/placido-de-abreu.sql']::text[],
  'João-Lagalhé - capoeirista who killed the famous César-Maneta on Praia do Peixe in 1870; last named figure in vendetta cycle documented by Plácido de Abreu'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
