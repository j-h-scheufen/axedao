-- ============================================================
-- GENEALOGY PERSON IMPORT: Mamede
-- Generated: 2025-12-09
-- Primary Sources:
--   - Plácido de Abreu, "Os Capoeiras" (1886) - first book on capoeira
--   - https://sites.google.com/view/raridadesdacapoeira/manduca-da-praia
--   - https://portalcapoeira.com/capoeira/capoeiristas-pulp-fiction-tropical/capitulo-8-manduca-da-praia/
--   - https://origemcapoeira.wordpress.com/a-origem/mestres/lendarios/manduca-da-praia/
-- ============================================================
-- DEPENDENCIES: none
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1820 with 'decade' precision):
-- Mamede is documented as a "perigoso capoeira" (dangerous capoeirista)
-- active around 1850 in Rio de Janeiro - the same era as Manduca da Praia.
-- If he was an established, feared capoeirista around 1850, he was likely
-- 25-40 years old at that time, placing his birth in the 1810s-1830s range.
-- Using 1820 as midpoint estimate with 'decade' precision.
--
-- No individual biographical details survive - only his reputation as one
-- of the most dangerous street fighters of his era alongside Aleixo Açougueiro,
-- Pedro Cobra, Bentevi, and Quebra Coco.
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
  'Mamede',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[]'::jsonb,  -- No dedicated web pages about this individual
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro.',
  -- Life dates
  1820,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed based on activity location
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- bio_en
  E'Mamede was one of the "perigosos capoeiras" (dangerous capoeiristas) of mid-19th century Rio de Janeiro. His name survives in the historical record as one of several notorious street fighters who defined the violent capoeira culture of the 1850s.

What little we know of Mamede comes from accounts of his contemporary, the legendary Manduca da Praia. According to multiple sources drawing on Plácido de Abreu''s 1886 work "Os Capoeiras," Manduca "attended the full-time school of roguery and bravery on the streets of Rio de Janeiro during the era of dangerous capoeiras such as Mamede, Aleixo Açougueiro, Pedro Cobra, Bentevi, and Quebra Coco."

The fact that Mamede is named among this select group tells us something: he was feared. In an era when capoeira was the domain of the maltas - the street gangs that divided Rio de Janeiro between the Nagoas and Guaiamums - to earn such a reputation required exceptional fighting ability. These were not merely skilled practitioners; they were "terríveis capoeiristas" (terrible capoeiristas), men whose very names carried weight on the streets.

This was an era before berimbau and music defined the practice. Capoeira carioca was a street fighting system that combined kicks, headbutts, sweeps, and razor work. The capoeiristas of Mamede''s generation were specialists in violence, and their training ground was the streets themselves.

No individual exploits of Mamede survive. We do not know if he belonged to the Nagoas or Guaiamums, whether he had a trade like Manduca''s fish stall, or how his life ended. He exists now only as a name on a list of dangerous men - but that list itself is a form of immortality. To be remembered among the most feared fighters of his generation, in a city where violence was common and capoeira was king, was no small achievement.',
  -- bio_pt
  E'Mamede foi um dos "perigosos capoeiras" do Rio de Janeiro em meados do século XIX. Seu nome sobrevive no registro histórico como um de vários notórios lutadores de rua que definiram a violenta cultura da capoeira na década de 1850.

O pouco que sabemos de Mamede vem de relatos sobre seu contemporâneo, o lendário Manduca da Praia. Segundo múltiplas fontes baseadas na obra de 1886 de Plácido de Abreu "Os Capoeiras", Manduca "cursou a escola de horário integral da malandragem e da valentia das ruas do Rio de Janeiro na época de perigosos capoeiras como Mamede, Aleixo Açougueiro, Pedro Cobra, Bentevi e Quebra Coco."

O fato de Mamede ser nomeado entre este seleto grupo nos diz algo: ele era temido. Em uma era quando a capoeira era domínio das maltas - as gangues de rua que dividiam o Rio de Janeiro entre os Nagoas e Guaiamuns - conquistar tal reputação exigia habilidade de luta excepcional. Estes não eram meramente praticantes habilidosos; eram "terríveis capoeiristas", homens cujos próprios nomes carregavam peso nas ruas.

Esta era uma era antes que o berimbau e a música definissem a prática. A capoeira carioca era um sistema de luta de rua que combinava chutes, cabeçadas, rasteiras e trabalho com navalha. Os capoeiristas da geração de Mamede eram especialistas em violência, e seu campo de treinamento eram as próprias ruas.

Nenhuma façanha individual de Mamede sobrevive. Não sabemos se ele pertencia aos Nagoas ou Guaiamuns, se tinha um ofício como a banca de peixe de Manduca, ou como sua vida terminou. Ele existe agora apenas como um nome em uma lista de homens perigosos - mas essa lista em si é uma forma de imortalidade. Ser lembrado entre os lutadores mais temidos de sua geração, em uma cidade onde a violência era comum e a capoeira era rei, não era pequena conquista.',
  -- achievements_en
  'Recognized as one of the most dangerous capoeiristas of his era in Rio de Janeiro',
  -- achievements_pt
  'Reconhecido como um dos mais perigosos capoeiristas de sua era no Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1820, decade precision): Documented as a "perigoso capoeira" active around 1850 in Rio de Janeiro. If he was an established, feared capoeirista at that time, he was likely 25-40 years old, placing birth in the 1810s-1830s range. Using 1820 as midpoint.

NAME: Only the apelido "Mamede" is recorded. Full name unknown.

DEATH: Unknown. No records of his death or later life have been found.

SOURCES: Mamede appears only in secondary sources discussing Manduca da Praia. All sources cite Plácido de Abreu''s "Os Capoeiras" (1886) as the original documentation. No dedicated biographical sources exist for this individual.

AFFILIATION: Malta affiliation (Nagoa or Guaiamum) is unknown.

PENDING RELATIONSHIPS (when other contemporaries are imported):
- associated_with Manduca da Praia (contemporaries in 1850s Rio)
- associated_with Aleixo Açougueiro (contemporaries in 1850s Rio)
- associated_with Pedro Cobra (contemporaries in 1850s Rio)
- associated_with Bentevi (contemporaries in 1850s Rio)
- associated_with Quebra Coco (contemporaries in 1850s Rio)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1820, precisão de década): Documentado como um "perigoso capoeira" ativo por volta de 1850 no Rio de Janeiro. Se ele era um capoeirista estabelecido e temido naquela época, provavelmente tinha 25-40 anos, colocando o nascimento no intervalo de 1810-1830. Usando 1820 como ponto médio.

NOME: Apenas o apelido "Mamede" é registrado. Nome completo desconhecido.

MORTE: Desconhecida. Nenhum registro de sua morte ou vida posterior foi encontrado.

FONTES: Mamede aparece apenas em fontes secundárias que discutem Manduca da Praia. Todas as fontes citam "Os Capoeiras" (1886) de Plácido de Abreu como documentação original. Não existem fontes biográficas dedicadas a este indivíduo.

AFILIAÇÃO: Afiliação à malta (Nagoa ou Guaiamum) é desconhecida.

RELACIONAMENTOS PENDENTES (quando outros contemporâneos forem importados):
- associated_with Manduca da Praia (contemporâneos no Rio dos anos 1850)
- associated_with Aleixo Açougueiro (contemporâneos no Rio dos anos 1850)
- associated_with Pedro Cobra (contemporâneos no Rio dos anos 1850)
- associated_with Bentevi (contemporâneos no Rio dos anos 1850)
- associated_with Quebra Coco (contemporâneos no Rio dos anos 1850)'
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

-- --- Person-to-Person: Association with Manduca da Praia ---
-- Manduca da Praia exists in the dataset, so we can create this relationship

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
  '1850-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were active capoeiristas in Rio de Janeiro around 1850. Mamede is documented as one of the dangerous capoeiras of Manduca''s era in Plácido de Abreu''s Os Capoeiras (1886)."}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Multiple secondary sources discussing Manduca da Praia',
  'Both operated in the violent street culture of the maltas in mid-19th century Rio. Exact nature of interaction unknown.',
  'Ambos operavam na violenta cultura de rua das maltas no Rio de meados do século XIX. Natureza exata da interação desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mamede' AND o.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- When the following persons are imported, these relationships should be created:
--
-- - associated_with Aleixo Açougueiro (contemporary in 1850s Rio)
-- - associated_with Pedro Cobra (contemporary in 1850s Rio)
-- - associated_with Bentevi (contemporary in 1850s Rio)
-- - associated_with Quebra Coco (contemporary in 1850s Rio)
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/mamede.sql',
  NULL,
  ARRAY['persons/manduca-da-praia.sql']::text[],
  'One of the dangerous capoeiristas of 1850s Rio de Janeiro; contemporary of Manduca da Praia'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
