-- ============================================================
-- GENEALOGY PERSON IMPORT: Adão
-- Generated: 2025-12-08
-- Primary Source: https://capoeirawiki.org/wiki/Chronology_of_capoeira_in_Brazil
-- Archival Source: Arquivo Nacional Rio de Janeiro (ANRJ) - Tribunal da Relação - códice 24, livro 10
-- Research: Nireu Cavalcanti (2004)
-- ============================================================
-- DEPENDENCIES: none
-- ============================================================
--
-- HISTORICAL SIGNIFICANCE:
-- Adão is the earliest known individual arrested for capoeira - the very first
-- name in capoeira's documented history. In late 1788 or early 1789, he was arrested
-- in Rio de Janeiro following a fight between capoeiras in which one was murdered.
-- Though innocent of the murder, his status as a capoeira was confirmed.
-- After months of punishment, his owner's mercy petition was approved on April 25, 1789.
--
-- BIRTH YEAR ESTIMATION (1760 with 'decade' precision):
-- Described as purchased "while still young" and working as a "robust" construction
-- worker/carrier at time of arrest (1789). Estimated to be in his 20s-30s in 1789,
-- suggesting birth decade of 1760s. Using 1760 as representative year with 'decade'
-- precision to enable temporal positioning in genealogy visualizations.
--
-- ADDITIONAL CONTEXT FROM RESEARCH:
-- - Adão was a slave of Manoel Cardoso Fontes
-- - Purchased young, described as "robust, hardworking, very obedient"
-- - Owner rented him out as construction worker/carrier for income
-- - Over time became more independent and came home late
-- - Arrested "along with other troublemakers who practiced capoeira"
-- - After serving months of labor and receiving lashes at the pillory,
--   his owner petitioned the king for clemency in the name of the Passion of Christ
-- - Tribunal approved mercy petition on April 25, 1789
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
  NULL,
  'Adão',
  NULL,
  NULL,
  '[{"type": "website", "url": "https://capoeirawiki.org/wiki/Chronology_of_capoeira_in_Brazil"}, {"type": "website", "url": "https://joaopequeno.portalcapoeira.com/portal-capoeira/capoeira-nao-existe-o-capoeirista-sim/"}]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Pre-codification era (1789); practiced what colonial authorities called "capoeiragem" in 18th century Rio de Janeiro. Style distinctions (Angola/Regional) would not exist for another 150 years.',
  'Era pré-codificação (1789); praticava o que as autoridades coloniais chamavam de "capoeiragem" no Rio de Janeiro do século XVIII. As distinções de estilo (Angola/Regional) não existiriam por mais 150 anos.',
  -- Life dates
  1760,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (English)
  E'The very first name in capoeira''s documented history. Adão was a pardo (mixed-race) enslaved mulatto owned by Manoel Cardoso Fontes in Rio de Janeiro. Purchased young, he was initially described as "robust, hardworking, and very obedient," serving household tasks. His owner rented him out as a construction worker and carrier, making him a valuable source of income.

But over time, the once-timid slave who had always lived at home "became more outgoing, independent, and began to arrive home late." He had found the capoeiras - groups of practitioners gathering in the city''s margins.

On a fateful day, a fight broke out between capoeiras. One was killed. Adão was arrested "along with other troublemakers who practiced capoeira." Under colonial law, "the gravest of crimes was the practice of capoeiragem." Though the investigation cleared him of the murder, his identity as a capoeira was confirmed. The sentence: 500 lashes and two years of forced labor in public works.

After months at the pillory and in labor, his owner petitioned the king "in the name of the Passion of Christ" to pardon the remaining sentence, pleading poverty and dependence on his slave''s earnings. He promised Adão would never again associate with the capoeiras. On April 25, 1789, the Tribunal approved the mercy petition - creating the first documented record of the word "capoeira" to describe a practitioner.

What became of Adão after his release remains unknown. But his case proves that by 1789, capoeira was already a recognized practice in colonial Brazil - one considered so dangerous that even association with capoeiras warranted brutal punishment.',
  -- Extended content (Portuguese)
  E'O primeiro nome da história documentada da capoeira. Adão era um pardo, mulato escravizado, propriedade de Manoel Cardoso Fontes no Rio de Janeiro. Comprado ainda jovem, foi inicialmente descrito como "tipo robusto, trabalhador e muito obediente ao seu senhor", servindo em tarefas domésticas. Seu dono o alugava como trabalhador de construção e carregador, fazendo dele uma valiosa fonte de renda.

Mas com o tempo, o escravo antes tímido que sempre vivera em casa "foi se tornando mais solto, independente e passou a chegar em casa mais tarde". Ele havia encontrado os capoeiras - grupos de praticantes que se reuniam nas margens da cidade.

Em um dia fatídico, uma briga estourou entre capoeiras. Um foi morto. Adão foi preso "junto com outros desordeiros que praticavam capoeira". Sob a lei colonial, "o mais grave dos crimes era a prática da capoeiragem". Embora a investigação o tenha inocentado do assassinato, sua identidade como capoeira foi confirmada. A sentença: 500 açoites e dois anos de trabalhos forçados em obras públicas.

Após meses no pelourinho e em trabalhos forçados, seu dono peticionou ao rei "em nome da Paixão de Cristo" para perdoar o restante da sentença, alegando pobreza e dependência dos ganhos de seu escravo. Prometeu que Adão nunca mais se associaria aos capoeiras. Em 25 de abril de 1789, o Tribunal aprovou o pedido de clemência - criando o primeiro registro documentado da palavra "capoeira" para descrever um praticante.

O que aconteceu com Adão após sua libertação permanece desconhecido. Mas seu caso prova que em 1789, a capoeira já era uma prática reconhecida no Brasil colonial - uma considerada tão perigosa que até mesmo a associação com capoeiras justificava punição brutal.',
  -- Achievements (English)
  'First documented capoeirista in history (April 25, 1789); Subject of the earliest known police/judicial record specifically mentioning capoeira by name; Survived 500 lashes and forced labor; His case proves capoeira existed as an organized practice in 18th century Rio de Janeiro',
  -- Achievements (Portuguese)
  'Primeiro capoeirista documentado da história (25 de abril de 1789); Sujeito do mais antigo registro policial/judicial conhecido que menciona especificamente a capoeira pelo nome; Sobreviveu a 500 açoites e trabalhos forçados; Seu caso prova que a capoeira existia como prática organizada no Rio de Janeiro do século XVIII',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1760, decade precision): Described as purchased "while still young" and working as a "robust" construction worker/carrier at time of arrest (1789). Estimated to be in his 20s-30s in 1789, suggesting birth decade of 1760s. Using 1760 as representative year.

ARCHIVAL SOURCE: Arquivo Nacional Rio de Janeiro (ANRJ) - Tribunal da Relação - códice 24, livro 10. Research by Nireu Cavalcanti (2004).

DEATH: Unknown. After clemency was granted April 25, 1789, no further records exist.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1760, precisão de década): Descrito como comprado "ainda jovem" e trabalhando como trabalhador de construção "robusto" no momento da prisão (1789). Estimado ter entre 20-30 anos em 1789, sugerindo década de nascimento de 1760. Usando 1760 como ano representativo.

FONTE ARQUIVÍSTICA: Arquivo Nacional Rio de Janeiro (ANRJ) - Tribunal da Relação - códice 24, livro 10. Pesquisa de Nireu Cavalcanti (2004).

MORTE: Desconhecida. Após a clemência concedida em 25 de abril de 1789, não existem mais registros.'
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
-- No relationships can be established - Adão exists as an
-- isolated historical record with no documented connections
-- to other capoeiristas in our dataset.
-- ============================================================

-- The record mentions:
-- - "Other troublemakers who practiced capoeira" arrested with him (UNNAMED)
-- - A capoeira who was murdered in the fight (UNNAMED)
-- - Manoel Cardoso Fontes (his owner, NOT a capoeirista)
--
-- No statements can be generated as no other entities from this era
-- exist in the dataset. The next documented practitioner is Major Vidigal,
-- active nearly 20 years later (1808).

-- ============================================================
-- DISCOVERED ENTITIES (for backlog tracking)
-- ============================================================
--
-- PERSONS: None discovered with enough data to import
-- - Unnamed capoeiras arrested with Adão (no names in record)
-- - Unnamed murdered capoeira (no name in record)
-- - Manoel Cardoso Fontes (slave owner, not a capoeirista)
--
-- GROUPS: None discovered
--
-- NEXT CHRONOLOGICAL IMPORT: Major Miguel Nunes Vidigal (active 1808-1820s)
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/adao.sql',
  NULL,
  ARRAY[]::text[],
  'First documented capoeirista (1789); earliest known arrest record'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
