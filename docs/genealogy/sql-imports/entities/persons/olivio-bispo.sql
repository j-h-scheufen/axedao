-- ============================================================
-- GENEALOGY PERSON: Olívio Bispo dos Santos (Mestre Bispo)
-- Generated: 2026-01-12
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1903, decade precision):
-- In 1963, Mestre Olívio was described as "about 60 years old"
-- (velhosmestres.com, londonschoolofcapoeira.com). This suggests
-- birth around 1903. Using decade precision due to approximation.
-- ============================================================
-- NAME DISCREPANCY:
-- - "Olívio Bispo dos Santos" - majority of sources
-- - "Olivio Bispo dos Santos" - some sources without accent
-- - "Olímpio Bispo dos Santos" - London School of Capoeira
-- - "Mestre Bispo" - used as apelido in Guarujá sources
-- Using "Olívio Bispo dos Santos" per majority position.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Olívio Bispo dos Santos',
  'Bispo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-56', 'https://www.londonschoolofcapoeira.com/about-the-school/origins']::text[],
  -- Capoeira-specific
  NULL, -- Style unknown; pre-dates Angola/Regional distinction in this region
  NULL,
  NULL,
  -- Life dates
  1903,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1972,
  'year'::genealogy.date_precision,
  'Vicente de Carvalho, Guarujá, São Paulo, Brazil',
  -- bio_en
  E'Mestre Olívio Bispo dos Santos, known as Mestre Bispo, was a Bahian capoeirista who became one of the pioneering figures of capoeira in the Santos/Guarujá region of São Paulo state. He led the legendary "Bahia do Berimbau" group in Vicente de Carvalho (then called Itapema) from around 1940-1945 until his death in 1972.

Olívio came to the São Paulo coast as part of the wave of Bahian and northeastern migration that brought both labor and capoeira culture to the industrial southeast of Brazil. Like many northeasterners of his generation, he found work in the port economy, retiring as an ensacador (coffee bagger) from the sindicato dos ensacadores—the coffee baggers'' union that organized dock workers handling coffee exports through the Port of Santos.

The Bahia do Berimbau group was notable for its exclusivity. Under Olívio''s direction, the group consisted of approximately twelve older Bahian men who practiced capoeira among themselves in the backyard of a house in Vicente de Carvalho. They met every Sunday, but did not intend to take students or teach publicly. The group included notable practitioners such as Benedito dos Santos (Mestre Dito), Maurício de Oliveira Santos (Mestre Bahia do Charuto), Samuel, Ling, Mata Onça, Aluízio, Anastácio, and Jacaré—names that represent the founding generation of capoeira in the region.

In 1963, Mestre Olívio admitted Roberto Teles de Oliveira, a young migrant from Sergipe, into the group. This was Sombra''s initiation into formal capoeira training. According to Mestre Sombra''s recollection, upon seeing the young man play capoeira, Olívio declared: "You know capoeira, you just need to acquire behavior" (Você sabe a capoeira, precisa somente adquirir comportamento)—a phrase that encapsulates the traditional capoeira philosophy that technical skill must be matched by proper conduct and character.

Sombra was the youngest and last member admitted to the group. The older mestres recognized his potential and invested him with the mission of perpetuating and spreading their knowledge, tradition, and culture after they were gone.

When Mestre Olívio died in 1972, the Bahia do Berimbau era came to an end. Mestre Sombra, believing in the mission entrusted to him, returned to Vicente de Carvalho and founded the Associação de Capoeira Zumbi (later renamed Senzala de Santos), ensuring that the tradition brought from Bahia would continue to flourish in the port cities of São Paulo.

Through Mestre Sombra''s work, Mestre Olívio''s lineage has spread to over 15 countries across Europe, Africa, and the Americas, with thousands of practitioners tracing their capoeira heritage back to the Sunday gatherings in Vicente de Carvalho.',
  -- bio_pt
  E'Mestre Olívio Bispo dos Santos, conhecido como Mestre Bispo, foi um capoeirista baiano que se tornou uma das figuras pioneiras da capoeira na região de Santos/Guarujá do estado de São Paulo. Ele liderou o lendário grupo "Bahia do Berimbau" em Vicente de Carvalho (então chamado Itapema) de aproximadamente 1940-1945 até sua morte em 1972.

Olívio chegou ao litoral paulista como parte da onda de migração baiana e nordestina que trouxe tanto força de trabalho quanto cultura da capoeira para o sudeste industrial do Brasil. Como muitos nordestinos de sua geração, ele encontrou trabalho na economia portuária, aposentando-se como ensacador do sindicato dos ensacadores—a união dos ensacadores de café que organizava os trabalhadores portuários que manipulavam exportações de café pelo Porto de Santos.

O grupo Bahia do Berimbau era notável por sua exclusividade. Sob a direção de Olívio, o grupo consistia de aproximadamente doze homens baianos mais velhos que praticavam capoeira entre si nos fundos de uma casa em Vicente de Carvalho. Eles se reuniam todo domingo, mas não pretendiam aceitar alunos ou ensinar publicamente. O grupo incluía praticantes notáveis como Benedito dos Santos (Mestre Dito), Maurício de Oliveira Santos (Mestre Bahia do Charuto), Samuel, Ling, Mata Onça, Aluízio, Anastácio e Jacaré—nomes que representam a geração fundadora da capoeira na região.

Em 1963, Mestre Olívio admitiu Roberto Teles de Oliveira, um jovem migrante de Sergipe, no grupo. Esta foi a iniciação de Sombra no treinamento formal de capoeira. De acordo com a lembrança de Mestre Sombra, ao ver o jovem jogar capoeira, Olívio declarou: "Você sabe a capoeira, precisa somente adquirir comportamento"—uma frase que encapsula a filosofia tradicional da capoeira de que a habilidade técnica deve ser acompanhada por conduta e caráter adequados.

Sombra foi o membro mais jovem e último a ser admitido no grupo. Os mestres mais velhos reconheceram seu potencial e o investiram com a missão de perpetuar e espalhar seu conhecimento, tradição e cultura depois que eles se fossem.

Quando Mestre Olívio morreu em 1972, a era do Bahia do Berimbau chegou ao fim. Mestre Sombra, acreditando na missão que lhe foi confiada, retornou a Vicente de Carvalho e fundou a Associação de Capoeira Zumbi (mais tarde renomeada Senzala de Santos), garantindo que a tradição trazida da Bahia continuaria a florescer nas cidades portuárias de São Paulo.

Através do trabalho de Mestre Sombra, a linhagem de Mestre Olívio se espalhou para mais de 15 países na Europa, África e Américas, com milhares de praticantes traçando sua herança de capoeira de volta às reuniões de domingo em Vicente de Carvalho.',
  -- achievements_en
  E'Founder and leader of the Bahia do Berimbau group (~1940s-1972); Pioneer of capoeira in the Santos/Guarujá region of São Paulo state; Transmitted Bahian capoeira tradition to São Paulo; Teacher of Mestre Sombra (founder of Senzala de Santos lineage)',
  -- achievements_pt
  E'Fundador e líder do grupo Bahia do Berimbau (~1940s-1972); Pioneiro da capoeira na região de Santos/Guarujá do estado de São Paulo; Transmitiu a tradição baiana de capoeira para São Paulo; Professor de Mestre Sombra (fundador da linhagem Senzala de Santos)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1903, decade precision):
In 1963, Mestre Olívio was described as "about 60 years old" by multiple sources (velhosmestres.com, londonschoolofcapoeira.com). This suggests birth around 1903. Using decade precision due to the approximate nature of the description.

DEATH YEAR (1972, year precision):
Consistently reported across all sources. Mestre Sombra assumed leadership of the group after Olívio''s death.

NAME DISCREPANCY:
- "Olívio Bispo dos Santos" - velhosmestres.com, majority of Portuguese sources
- "Olivio Bispo dos Santos" - some sources without accent
- "Olímpio Bispo dos Santos" - London School of Capoeira (possible transcription error)
- "Mestre Bispo" - used as apelido in Guarujá municipal sources
Using "Olívio" as it appears in the most authoritative source (velhosmestres.com).

PROFESSION:
Retired ensacador (coffee bagger) from the sindicato dos ensacadores - the coffee baggers'' union of the Port of Santos. This occupation was common among Bahian migrants to the port economy of São Paulo.

BAHIA DO BERIMBAU GROUP:
- Founded: ~1940-1945 (exact date uncertain)
- Location: Backyard of a house in Itapema/Vicente de Carvalho, Guarujá
- Meeting: Sundays
- Members: ~12 older Bahian men
- Nature: Closed practice group, did not take students
- Known members: Benedito dos Santos (Mestre Dito), Maurício de Oliveira Santos (Mestre Bahia do Charuto), Samuel, Ling, Mata Onça, Aluízio, Anastácio, Jacaré, Olívio Bispo dos Santos (leader)

STUDENTS:
- Mestre Sombra (Roberto Teles de Oliveira) - joined 1963, trained until Olívio''s death in 1972; youngest and last member admitted; entrusted with mission to spread the tradition

QUOTE ATTRIBUTED:
"Você sabe a capoeira, precisa somente adquirir comportamento" (You know capoeira, you just need to acquire behavior) - said to young Sombra upon admission to the group in 1963.

MIGRATION CONTEXT:
Part of the Bahian/Northeastern migration wave to São Paulo state in the mid-20th century, which brought both laborers and capoeira culture to the industrial southeast.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1903, precisão década):
Em 1963, Mestre Olívio foi descrito como tendo "cerca de 60 anos" por múltiplas fontes (velhosmestres.com, londonschoolofcapoeira.com). Isso sugere nascimento por volta de 1903. Usando precisão de década devido à natureza aproximada da descrição.

ANO DE MORTE (1972, precisão ano):
Relatado consistentemente em todas as fontes. Mestre Sombra assumiu a liderança do grupo após a morte de Olívio.

DISCREPÂNCIA DE NOME:
- "Olívio Bispo dos Santos" - velhosmestres.com, maioria das fontes em português
- "Olivio Bispo dos Santos" - algumas fontes sem acento
- "Olímpio Bispo dos Santos" - London School of Capoeira (possível erro de transcrição)
- "Mestre Bispo" - usado como apelido em fontes municipais de Guarujá
Usando "Olívio" como aparece na fonte mais autoritativa (velhosmestres.com).

PROFISSÃO:
Ensacador aposentado do sindicato dos ensacadores - o sindicato dos ensacadores de café do Porto de Santos. Esta ocupação era comum entre migrantes baianos para a economia portuária de São Paulo.

GRUPO BAHIA DO BERIMBAU:
- Fundado: ~1940-1945 (data exata incerta)
- Local: Fundo de uma casa em Itapema/Vicente de Carvalho, Guarujá
- Reunião: Domingos
- Membros: ~12 homens baianos mais velhos
- Natureza: Grupo fechado de prática, não aceitava alunos
- Membros conhecidos: Benedito dos Santos (Mestre Dito), Maurício de Oliveira Santos (Mestre Bahia do Charuto), Samuel, Ling, Mata Onça, Aluízio, Anastácio, Jacaré, Olívio Bispo dos Santos (líder)

ALUNOS:
- Mestre Sombra (Roberto Teles de Oliveira) - entrou em 1963, treinou até a morte de Olívio em 1972; membro mais jovem e último admitido; encarregado da missão de espalhar a tradição

CITAÇÃO ATRIBUÍDA:
"Você sabe a capoeira, precisa somente adquirir comportamento" - dito ao jovem Sombra na admissão ao grupo em 1963.

CONTEXTO DE MIGRAÇÃO:
Parte da onda de migração baiana/nordestina para o estado de São Paulo em meados do século XX, que trouxe tanto trabalhadores quanto cultura da capoeira para o sudeste industrial.'
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
