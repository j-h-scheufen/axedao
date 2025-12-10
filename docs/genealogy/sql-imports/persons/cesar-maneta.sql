-- ============================================================
-- GENEALOGY PERSON IMPORT: César-Maneta
-- Generated: 2025-12-10
-- Primary Sources:
--   - Plácido de Abreu, "Os Capoeiras" (1886) - first book on capoeira
--   - https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/
-- ============================================================
-- DEPENDENCIES: persons/alemaozinho.sql, persons/jaco.sql, persons/pinta-preta-da-lapa.sql, persons/placido-de-abreu.sql
-- ============================================================
--
-- DEATH DATE: ~1870 (exact date unknown, shortly after killing Alemãozinho)
-- Killed on Praia do Peixe (Fish Beach) by João-Lagalhé.
--
-- BIRTH YEAR ESTIMATION (1840 with 'decade' precision):
-- César-Maneta was an active and "famous" capoeirista who killed Alemãozinho
-- and was subsequently killed in 1870. To be famous enough to be named specifically
-- by Plácido de Abreu, he was likely 25-40 years old at death, placing his birth
-- in the 1830s-1840s range. Using 1840 as midpoint.
--
-- NICKNAME: "Maneta" means one-armed or one-handed in Portuguese. However,
-- there is NO direct evidence César actually had this disability - nicknames
-- in the maltas often had origins unrelated to their literal meaning.
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
  NULL,  -- Full name unknown; only apelido recorded
  'César-Maneta',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[{"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro. Famous enough to be specifically named by Plácido de Abreu in 1886.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro. Famoso o suficiente para ser nomeado especificamente por Plácido de Abreu em 1886.',
  -- Life dates
  1840,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed based on activity location
  1870,
  'year'::genealogy.date_precision,
  'Praia do Peixe, Rio de Janeiro, Brazil',
  -- bio_en
  E'César-Maneta was a "famous" capoeirista in Rio de Janeiro whose notoriety was such that Plácido de Abreu singled him out by name in "Os Capoeiras" (1886)—unusual in a list that otherwise focuses on victims rather than killers.

His nickname "Maneta" typically means "one-armed" or "one-handed" in Portuguese. However, there is no direct evidence in Plácido de Abreu''s account or other sources confirming César actually had a physical disability—nicknames in the capoeira maltas often had origins unrelated to their literal meaning. What is certain is that he earned a reputation that made him famous in the violent world of the capoeira maltas.

César-Maneta''s documented act was the killing of Alemãozinho ("Little German") near the old Teatro Lírico do Campo in 1870. This murder was part of the vendetta cycle that began with the death of Pinta Preta da Lapa on January 7, 1870, followed by the killing of Caboclo Jacó at Paula Matos. By killing Alemãozinho, César-Maneta continued the chain of reprisals that had convulsed the capoeira gangs of Rio de Janeiro.

Plácido de Abreu recorded his fate: "after this came the death of the Alemãozinho [Small German], next to the old Lyrical Theatre do Campo, by the famous César-Maneta that, shortly after was also murdered on the Peixe Beach, by João-Lagalhé."

The Praia do Peixe (Fish Beach) where César-Maneta met his end was located near the Candelária Market, in the area of modern Praça XV—a bustling commercial zone where fish was sold and small boats docked. It was a public, well-trafficked location, suggesting his death was either a brazen public killing or the result of a confrontation in plain sight.

César-Maneta''s story encapsulates the brutal logic of the capoeira maltas: kill, and be killed. His fame did not protect him; it made him a target. The vendetta cycle continued after his death, with João-Lagalhé presumably becoming the next mark.',
  -- bio_pt
  E'César-Maneta foi um capoeirista "famoso" no Rio de Janeiro cuja notoriedade era tal que Plácido de Abreu o destacou pelo nome em "Os Capoeiras" (1886)—incomum em uma lista que de outra forma foca nas vítimas em vez dos assassinos.

Seu apelido "Maneta" tipicamente significa "sem um braço" ou "sem uma mão" em português. No entanto, não há evidência direta no relato de Plácido de Abreu ou outras fontes confirmando que César realmente tinha uma deficiência física—apelidos nas maltas de capoeira frequentemente tinham origens não relacionadas ao seu significado literal. O que é certo é que ele ganhou uma reputação que o tornou famoso no mundo violento das maltas de capoeira.

O ato documentado de César-Maneta foi o assassinato do Alemãozinho ("Pequeno Alemão") perto do velho Teatro Lírico do Campo em 1870. Este assassinato fazia parte do ciclo de vingança que começou com a morte de Pinta Preta da Lapa em 7 de janeiro de 1870, seguida pelo assassinato do Caboclo Jacó em Paula Matos. Ao matar o Alemãozinho, César-Maneta continuou a cadeia de represálias que havia convulsionado as gangues de capoeira do Rio de Janeiro.

Plácido de Abreu registrou seu destino: "depois disso veio a morte do Alemãozinho, perto do velho Teatro Lírico do Campo, pelo famoso César-Maneta que, pouco depois também foi assassinado na Praia do Peixe, por João-Lagalhé."

A Praia do Peixe onde César-Maneta encontrou seu fim ficava perto do Mercado da Candelária, na área da moderna Praça XV—uma zona comercial movimentada onde peixe era vendido e pequenos barcos atracavam. Era um local público e muito frequentado, sugerindo que sua morte foi ou um assassinato público descarado ou o resultado de um confronto à vista de todos.

A história de César-Maneta encapsula a lógica brutal das maltas de capoeira: mate, e seja morto. Sua fama não o protegeu; tornou-o um alvo. O ciclo de vingança continuou após sua morte, com João-Lagalhé presumivelmente se tornando a próxima marca.',
  -- achievements_en
  'Famous capoeirista known for killing Alemãozinho at Teatro Lírico do Campo in 1870',
  -- achievements_pt
  'Capoeirista famoso conhecido por matar Alemãozinho no Teatro Lírico do Campo em 1870',
  -- Researcher notes (English)
  E'NAME: Known only as "César-Maneta" - full name unknown.

DEATH DATE: 1870 (year precision). Killed "shortly after" killing Alemãozinho. Exact date unknown.

DEATH LOCATION: Praia do Peixe (Fish Beach), Rio de Janeiro. This was the area near the old Candelária Market (Mercado da Candelária), near modern Praça XV. The fish market area was a busy commercial zone.

BIRTH YEAR ESTIMATION (1840, decade precision): Famous capoeirista killed in 1870 vendetta cycle. To be notable enough to be specifically named by Plácido de Abreu, he was likely 25-40 years old at death, placing birth in 1830s-1840s. Using 1840 as midpoint.

AFFILIATION: Malta affiliation (Nagoa or Guaiamum) unknown. His role as killer of Alemãozinho suggests possible rivalry with that faction.

NICKNAME: "Maneta" typically means one-armed or one-handed in Portuguese. However, there is NO direct evidence César actually had this disability. Nicknames in the maltas often had origins unrelated to their literal meaning.

VICTIM: Alemãozinho (Little German), killed near Teatro Lírico do Campo, 1870.

KILLER: João-Lagalhé, on Praia do Peixe, 1870.

SIGNIFICANCE: One of the few killers (not just victims) specifically named by Plácido de Abreu, indicating significant notoriety.

SOURCES: Plácido de Abreu "Os Capoeiras" (1886) - only known source for this individual.

PENDING RELATIONSHIPS:
- associated_with Alemãozinho (victim - César-Maneta killed him)
- associated_with Jacó (vendetta sequence - previous victim)
- associated_with Pinta Preta da Lapa (vendetta sequence - first in chain)
- associated_with João-Lagalhé (killer - João-Lagalhé killed César-Maneta)',
  -- Researcher notes (Portuguese)
  E'NOME: Conhecido apenas como "César-Maneta" - nome completo desconhecido.

DATA DA MORTE: 1870 (precisão de ano). Morto "pouco depois" de matar Alemãozinho. Data exata desconhecida.

LOCAL DA MORTE: Praia do Peixe, Rio de Janeiro. Esta era a área perto do velho Mercado da Candelária, perto da moderna Praça XV. A área do mercado de peixe era uma zona comercial movimentada.

ESTIMATIVA DO ANO DE NASCIMENTO (1840, precisão de década): Capoeirista famoso morto no ciclo de vingança de 1870. Para ser notável o suficiente para ser nomeado especificamente por Plácido de Abreu, provavelmente tinha 25-40 anos na morte, colocando o nascimento nos anos 1830-1840. Usando 1840 como ponto médio.

AFILIAÇÃO: Afiliação à malta (Nagoa ou Guaiamum) desconhecida. Seu papel como assassino de Alemãozinho sugere possível rivalidade com aquela facção.

APELIDO: "Maneta" tipicamente significa sem um braço ou sem uma mão em português. No entanto, NÃO há evidência direta de que César realmente tinha essa deficiência. Apelidos nas maltas frequentemente tinham origens não relacionadas ao seu significado literal.

VÍTIMA: Alemãozinho (Pequeno Alemão), morto perto do Teatro Lírico do Campo, 1870.

ASSASSINO: João-Lagalhé, na Praia do Peixe, 1870.

SIGNIFICÂNCIA: Um dos poucos assassinos (não apenas vítimas) especificamente nomeados por Plácido de Abreu, indicando notoriedade significativa.

FONTES: Plácido de Abreu "Os Capoeiras" (1886) - única fonte conhecida para este indivíduo.

RELACIONAMENTOS PENDENTES:
- associated_with Alemãozinho (vítima - César-Maneta o matou)
- associated_with Jacó (sequência de vingança - vítima anterior)
- associated_with Pinta Preta da Lapa (sequência de vingança - primeiro da cadeia)
- associated_with João-Lagalhé (assassino - João-Lagalhé matou César-Maneta)'
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

-- --- Person-to-Person: Association with Alemãozinho ---
-- César-Maneta killed Alemãozinho at Teatro Lírico do Campo

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
  '{"association_context": "César-Maneta killed Alemãozinho near the old Teatro Lírico do Campo in 1870, as part of the vendetta cycle documented by Plácido de Abreu. César-Maneta was specifically described as ''famous'' by Abreu."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'César-Maneta was the killer of Alemãozinho. Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho (killed by César-Maneta) → César-Maneta (killed by João-Lagalhé).',
  'César-Maneta foi o assassino de Alemãozinho. Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho (morto por César-Maneta) → César-Maneta (morto por João-Lagalhé).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'César-Maneta' AND o.apelido = 'Alemãozinho'
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
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Jacó was killed before Alemãozinho; César-Maneta killed Alemãozinho and was later killed himself."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta.',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'César-Maneta' AND o.apelido = 'Jacó'
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
  '{"association_context": "Both were part of the 1870 vendetta cycle documented by Plácido de Abreu. Pinta Preta''s death (Jan 7, 1870) triggered the cycle that eventually involved César-Maneta as both killer (of Alemãozinho) and victim (of João-Lagalhé)."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta. Pinta Preta''s death initiated the cycle.',
  'Parte da sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta. A morte de Pinta Preta iniciou o ciclo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'César-Maneta' AND o.apelido = 'Pinta Preta da Lapa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- When João-Lagalhé is imported, this relationship should be created:
--
-- - associated_with João-Lagalhé (killer - João-Lagalhé killed César-Maneta on Praia do Peixe)
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/cesar-maneta.sql',
  NULL,
  ARRAY['persons/alemaozinho.sql', 'persons/jaco.sql', 'persons/pinta-preta-da-lapa.sql', 'persons/placido-de-abreu.sql']::text[],
  'César-Maneta - famous one-armed capoeirista who killed Alemãozinho at Teatro Lírico do Campo in 1870; killed on Praia do Peixe by João-Lagalhé; documented by Plácido de Abreu'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
