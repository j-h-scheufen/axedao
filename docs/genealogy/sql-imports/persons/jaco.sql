-- ============================================================
-- GENEALOGY PERSON IMPORT: Jacó (Caboclo Jacó)
-- Generated: 2025-12-10
-- Primary Sources:
--   - Plácido de Abreu, "Os Capoeiras" (1886) - first book on capoeira
--   - https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/
-- ============================================================
-- DEPENDENCIES: persons/pinta-preta-da-lapa.sql, persons/placido-de-abreu.sql
-- ============================================================
--
-- DEATH DATE: ~1870 (exact date unknown, after Pinta Preta's death in Jan 1870)
-- Killed during a celebration at Paula Matos, murdered on Rua do Riachuelo.
--
-- BIRTH YEAR ESTIMATION (1840 with 'decade' precision):
-- Jacó was killed in the vendetta cycle following Pinta Preta's death (Jan 1870).
-- As an active capoeirista at the time of death, he was likely 25-40 years old,
-- placing his birth in the 1830s-1840s range. Using 1840 as midpoint.
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
  NULL,  -- Full name unknown
  'Jacó',
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
  1870,
  'year'::genealogy.date_precision,
  'Rua do Riachuelo, Rio de Janeiro, Brazil',
  -- bio_en
  E'The "Caboclo Jacó" was a capoeirista in Rio de Janeiro who became a victim in the cycle of vendetta killings that convulsed the capoeira maltas in 1870.

Plácido de Abreu documented his death in "Os Capoeiras" (1886), listing it as part of a chain of reprisals that began with the murder of Pinta Preta da Lapa: "The death of the Frenchman was followed by the death of Pinta Preta da Lapa on Alfândega Street, in front of the side street of S. Domingos, on the night of the King''s. After this, followed the death of the caboclo Jacó, in the celebration at Paula Matos, (being murdered in the street of Riachuelo)."

His nickname "Caboclo" indicates he was of mixed Indigenous and African or European ancestry—a common demographic in the capoeira maltas of Rio de Janeiro. Paula Matos was a neighborhood in the Santa Teresa area of Rio, and the "celebration" where he was killed was likely a festival or gathering similar to the Festa dos Reis where Pinta Preta had attacked his enemies.

The fact that his death was considered significant enough to record in the vendetta sequence suggests Jacó was not merely a foot soldier but a notable figure—perhaps a gang leader or skilled fighter whose death demanded further retaliation. After his death came the killing of Alemãozinho, then César-Maneta, and so the cycle continued.

Jacó exists now as a single line in a list of the dead—but that list itself preserves a moment in the violent history of capoeira carioca. His death at Paula Matos was part of a larger conflict that historians believe was exacerbated by the return of soldiers from the Paraguayan War (1864-1870), as capoeiras who had been recruited to fight returned to find their territories and positions contested.',
  -- bio_pt
  E'O "Caboclo Jacó" foi um capoeirista no Rio de Janeiro que se tornou vítima no ciclo de mortes por vingança que convulsionou as maltas de capoeira em 1870.

Plácido de Abreu documentou sua morte em "Os Capoeiras" (1886), listando-a como parte de uma cadeia de represálias que começou com o assassinato de Pinta Preta da Lapa: "A morte do francês foi seguida pela morte de Pinta Preta da Lapa na Rua da Alfândega, em frente à travessa de S. Domingos, na noite dos Reis. Após isso, seguiu-se a morte do caboclo Jacó, na festa de Paula Matos, (sendo assassinado na rua do Riachuelo)."

Seu apelido "Caboclo" indica que ele era de ascendência mista indígena e africana ou europeia—uma demografia comum nas maltas de capoeira do Rio de Janeiro. Paula Matos era um bairro na área de Santa Teresa do Rio, e a "festa" onde ele foi morto era provavelmente um festival ou reunião semelhante à Festa dos Reis onde Pinta Preta havia atacado seus inimigos.

O fato de sua morte ter sido considerada significativa o suficiente para registrar na sequência de vinganças sugere que Jacó não era meramente um soldado raso, mas uma figura notável—talvez um líder de gangue ou lutador habilidoso cuja morte exigia mais retaliação. Após sua morte veio o assassinato do Alemãozinho, depois César-Maneta, e assim o ciclo continuou.

Jacó existe agora como uma única linha em uma lista dos mortos—mas essa lista em si preserva um momento na história violenta da capoeira carioca. Sua morte em Paula Matos fazia parte de um conflito maior que historiadores acreditam ter sido exacerbado pelo retorno de soldados da Guerra do Paraguai (1864-1870), quando capoeiras que haviam sido recrutados para lutar retornaram para encontrar seus territórios e posições contestados.',
  -- achievements_en
  NULL,  -- No specific achievements documented
  -- achievements_pt
  NULL,  -- No specific achievements documented
  -- Researcher notes (English)
  E'NAME: Known only as "Caboclo Jacó" - full name unknown. "Caboclo" indicates mixed Indigenous ancestry.

DEATH DATE: 1870 (year precision). Killed after Pinta Preta da Lapa (Jan 7, 1870) and before Alemãozinho. Exact date unknown.

DEATH LOCATION: Rua do Riachuelo, at a celebration in Paula Matos (Santa Teresa area, Rio de Janeiro).

BIRTH YEAR ESTIMATION (1840, decade precision): Active capoeirista killed in 1870 vendetta cycle. If 25-40 years old at death, birth was 1830s-1840s. Using 1840 as midpoint.

AFFILIATION: Malta affiliation (Nagoa or Guaiamum) unknown. His position in the vendetta sequence (after Pinta Preta, a Nagoa chief) suggests he may have been associated with the opposing faction, killed in retaliation.

KILLER: Unknown.

SOURCES: Plácido de Abreu "Os Capoeiras" (1886) - only known source for this individual.

PENDING RELATIONSHIPS:
- associated_with Pinta Preta da Lapa (vendetta sequence)
- associated_with Alemãozinho (vendetta sequence)',
  -- Researcher notes (Portuguese)
  E'NOME: Conhecido apenas como "Caboclo Jacó" - nome completo desconhecido. "Caboclo" indica ascendência indígena mista.

DATA DA MORTE: 1870 (precisão de ano). Morto após Pinta Preta da Lapa (7 de janeiro de 1870) e antes do Alemãozinho. Data exata desconhecida.

LOCAL DA MORTE: Rua do Riachuelo, em uma festa em Paula Matos (área de Santa Teresa, Rio de Janeiro).

ESTIMATIVA DO ANO DE NASCIMENTO (1840, precisão de década): Capoeirista ativo morto no ciclo de vingança de 1870. Se tinha 25-40 anos na morte, nasceu nos anos 1830-1840. Usando 1840 como ponto médio.

AFILIAÇÃO: Afiliação à malta (Nagoa ou Guaiamum) desconhecida. Sua posição na sequência de vingança (após Pinta Preta, um chefe Nagoa) sugere que ele pode ter sido associado à facção oposta, morto em retaliação.

ASSASSINO: Desconhecido.

FONTES: Plácido de Abreu "Os Capoeiras" (1886) - única fonte conhecida para este indivíduo.

RELACIONAMENTOS PENDENTES:
- associated_with Pinta Preta da Lapa (sequência de vingança)
- associated_with Alemãozinho (sequência de vingança)'
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

-- --- Person-to-Person: Association with Pinta Preta da Lapa ---
-- Part of the same vendetta cycle documented by Plácido de Abreu

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
  '{"association_context": "Both were victims in the 1870 vendetta cycle documented by Plácido de Abreu. Jacó was killed at Paula Matos/Riachuelo shortly after Pinta Preta''s death on Jan 7, 1870, as part of ongoing reprisals between capoeira maltas."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta. The nature of their relationship (allies, rivals, or otherwise) is unknown.',
  'Parte de sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta. A natureza de sua relação (aliados, rivais, ou outra) é desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jacó' AND o.apelido = 'Pinta Preta da Lapa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- When the following persons are imported, these relationships should be created:
--
-- - associated_with Alemãozinho (next victim in vendetta cycle)
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/jaco.sql',
  NULL,
  ARRAY['persons/pinta-preta-da-lapa.sql', 'persons/placido-de-abreu.sql']::text[],
  'Caboclo Jacó - capoeirista killed at Paula Matos/Riachuelo in 1870 vendetta cycle; documented by Plácido de Abreu'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
