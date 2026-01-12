-- ============================================================
-- GENEALOGY PERSON: Marcio (Praia do Sol)
-- Generated: 2026-01-11
-- ============================================================
-- NOTE: This is Mestre Marcio Martins, president of Associação
-- de Capoeira Praia do Sol (founded Oct 31, 1979). He trained
-- under Mestre Limão and in turn trained Mestre Paraná.
--
-- The apelido_context 'Praia do Sol' distinguishes him from
-- other mestres named Marcio in the database.
--
-- LIMITED INFORMATION: Contemporary mestre with limited public
-- biographical documentation. Full name confirmed via official
-- association records.
--
-- BIRTH YEAR ESTIMATION (1955, decade):
-- - Associação de Capoeira Praia do Sol founded Oct 31, 1979
-- - Mestre Limão died in 1985; Marcio would have trained before then
-- - If started training in late 1960s/early 1970s (~age 12-15)
--   and Limão founded Praia do Sol group 1970s-80s
-- - If Marcio was mature enough to take over leadership by 1979,
--   likely born ~1950-1960
-- - Paraná (born ~1960) was Marcio's student
-- - Using 1955 midpoint with decade precision
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
  title,
  portrait,
  public_links,
  -- Capoeira-specific
  style,
  style_notes_en,
  style_notes_pt,
  -- Life dates (estimated)
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Marcio Martins',
  'Marcio',
  'Praia do Sol',  -- Context to distinguish from other Marcios
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://cncapoeira.nl/en/about-us/'
  ]::text[],
  -- Capoeira-specific
  'contemporanea'::genealogy.style,
  E'Mestre Marcio continues the Praia do Sol lineage established by Mestre Limão. The style incorporates both the Angola roots of Mestre Caiçara and the Regional influences that were common in São Paulo''s capoeira scene during the 1970s-80s. As president of Associação de Capoeira Praia do Sol since 1979, he has maintained a contemporary approach that respects traditional foundations while adapting to modern teaching contexts.',
  E'Mestre Marcio continua a linhagem Praia do Sol estabelecida por Mestre Limão. O estilo incorpora tanto as raízes de Angola de Mestre Caiçara quanto as influências Regionais que eram comuns na cena de capoeira de São Paulo durante os anos 1970-80. Como presidente da Associação de Capoeira Praia do Sol desde 1979, ele mantém uma abordagem contemporânea que respeita as bases tradicionais enquanto se adapta aos contextos modernos de ensino.',
  -- Life dates (estimated)
  1955,  -- Birth year estimated from lineage position and association founding
  'decade'::genealogy.date_precision,
  'São Paulo, Brazil',  -- Likely born in São Paulo area
  NULL,  -- Still living
  NULL,
  NULL,
  -- bio_en
  E'Mestre Marcio Martins is a contemporary capoeira mestre from São Paulo who trained under Mestre Limão (Paulo dos Santos, 1945-1985). He is part of a significant lineage that traces back to the legendary Mestre Caiçara of Santo Amaro da Purificação, Bahia. Mestre Limão, who learned from Caiçara, came to São Paulo in the late 1960s and established himself as one of the most important mestres in the city''s South Zone, founding the Academia Quilombo dos Palmares (1970) and the Praia do Sol group during the 1970s-80s.

Marcio trained under Limão during this formative period of São Paulo capoeira, when several influential mestres from Bahia had migrated to the industrial capital. On October 31, 1979, the Associação de Capoeira Praia do Sol was officially founded, with Marcio Martins serving as president—a position he continues to hold. The association is headquartered at Rua Sinfonia Heroica, 24, in the Vila Calu neighborhood of São Paulo''s South Zone.

After Mestre Limão''s tragic death in 1985, Mestre Marcio continued the Praia do Sol lineage. He trained the next generation, most notably Mestre Paraná, who would go on to found Caravelas Negras in 1993. Through this lineage, Praia do Sol''s influence has extended internationally, with Caravelas Negras now operating one of the largest capoeira networks in the Netherlands under Contra Mestre Miojo.

The Praia do Sol lineage is particularly notable as part of the broader movement of Bahian mestres establishing capoeira in São Paulo during the 1960s-80s. This era saw the creation of numerous academies that would shape the character of São Paulo''s capoeira scene, blending the traditions of Bahia with the realities of Brazil''s industrial heartland.',
  -- bio_pt
  E'Mestre Marcio Martins é um mestre de capoeira contemporâneo de São Paulo que treinou sob Mestre Limão (Paulo dos Santos, 1945-1985). Ele faz parte de uma linhagem significativa que remonta ao lendário Mestre Caiçara de Santo Amaro da Purificação, Bahia. Mestre Limão, que aprendeu com Caiçara, veio para São Paulo no final dos anos 1960 e se estabeleceu como um dos mestres mais importantes da Zona Sul da cidade, fundando a Academia Quilombo dos Palmares (1970) e o grupo Praia do Sol durante os anos 1970-80.

Marcio treinou com Limão durante este período formativo da capoeira paulistana, quando vários mestres influentes da Bahia haviam migrado para a capital industrial. Em 31 de outubro de 1979, a Associação de Capoeira Praia do Sol foi oficialmente fundada, com Marcio Martins como presidente—cargo que ele continua a ocupar. A associação está sediada na Rua Sinfonia Heroica, 24, no bairro Vila Calu, na Zona Sul de São Paulo.

Após a trágica morte de Mestre Limão em 1985, Mestre Marcio continuou a linhagem Praia do Sol. Ele treinou a próxima geração, mais notavelmente Mestre Paraná, que fundaria o Caravelas Negras em 1993. Através desta linhagem, a influência do Praia do Sol se estendeu internacionalmente, com o Caravelas Negras agora operando uma das maiores redes de capoeira na Holanda sob Contra Mestre Miojo.

A linhagem Praia do Sol é particularmente notável como parte do movimento mais amplo de mestres baianos estabelecendo a capoeira em São Paulo durante os anos 1960-80. Esta era viu a criação de numerosas academias que moldariam o caráter da cena de capoeira paulistana, misturando as tradições da Bahia com as realidades do coração industrial do Brasil.',
  -- achievements_en
  E'- October 31, 1979: Founded Associação de Capoeira Praia do Sol in São Paulo
- Serves as president of Associação de Capoeira Praia do Sol (since 1979)
- Trained under Mestre Limão (Paulo dos Santos), one of the São Paulo capoeira pioneers
- Trained Mestre Paraná, who founded Caravelas Negras (1993)
- Maintained the Praia do Sol lineage after Mestre Limão''s death in 1985
- Part of the historic Bahian mestres migration to São Paulo era',
  -- achievements_pt
  E'- 31 de outubro de 1979: Fundou a Associação de Capoeira Praia do Sol em São Paulo
- Serve como presidente da Associação de Capoeira Praia do Sol (desde 1979)
- Treinou sob Mestre Limão (Paulo dos Santos), um dos pioneiros da capoeira paulistana
- Treinou Mestre Paraná, que fundou o Caravelas Negras (1993)
- Manteve a linhagem Praia do Sol após a morte de Mestre Limão em 1985
- Parte da era histórica de migração de mestres baianos para São Paulo',
  -- notes_en
  E'FULL NAME: Marcio Martins
Confirmed via official association records (CNPJ: 51.743.854/0001-07)

BIRTH YEAR ESTIMATION (1955, decade):
- Associação de Capoeira Praia do Sol founded October 31, 1979
- Mestre Limão died in 1985; Marcio trained under him
- If started training in late 1960s/early 1970s at typical age (~12-15)
- Must have been mature enough to assume leadership by 1979
- Student Paraná estimated born ~1960
- Using 1955 as midpoint estimate with decade precision

TEACHERS:
- Mestre Limão (Paulo dos Santos, 1945-1985) - primary teacher
- Trained in Praia do Sol lineage, São Paulo

STUDENTS:
- Mestre Paraná (Praia do Sol) - founder of Caravelas Negras (1993)

LINEAGE:
Mestre Caiçara → Mestre Limão → Mestre Marcio → Mestre Paraná → Contra Mestre Miojo

GROUP LED:
- Associação de Capoeira Praia do Sol
  - CNPJ: 51.743.854/0001-07
  - Founded: October 31, 1979
  - Address: Rua Sinfonia Heroica, 24 - Vila Calu, São Paulo - SP, 04.961-010
  - President: Marcio Martins
  - Status: Operating (46 years of history)

GEOGRAPHIC LOCATION:
- Vila Calu, South Zone of São Paulo

LIMITED DOCUMENTATION:
Contemporary mestres often have limited publicly available biographical
information. Most details derived from official association records
and the CN Capoeira website documenting lineage.

SOURCES:
- cncapoeira.nl/en/about-us/ (lineage information)
- Association records (CNPJ, founding date, address)
- Mestre Limão person-report (lineage context)',
  -- notes_pt
  E'NOME COMPLETO: Marcio Martins
Confirmado via registros oficiais da associação (CNPJ: 51.743.854/0001-07)

ESTIMATIVA DO ANO DE NASCIMENTO (1955, década):
- Associação de Capoeira Praia do Sol fundada em 31 de outubro de 1979
- Mestre Limão morreu em 1985; Marcio treinou com ele
- Se começou a treinar no final dos anos 1960/início dos 1970 na idade típica (~12-15)
- Deve ter sido maduro o suficiente para assumir liderança em 1979
- Aluno Paraná estimado nascido ~1960
- Usando 1955 como estimativa do ponto médio com precisão de década

MESTRES:
- Mestre Limão (Paulo dos Santos, 1945-1985) - mestre principal
- Treinou na linhagem Praia do Sol, São Paulo

ALUNOS:
- Mestre Paraná (Praia do Sol) - fundador do Caravelas Negras (1993)

LINHAGEM:
Mestre Caiçara → Mestre Limão → Mestre Marcio → Mestre Paraná → Contra Mestre Miojo

GRUPO LIDERADO:
- Associação de Capoeira Praia do Sol
  - CNPJ: 51.743.854/0001-07
  - Fundada: 31 de outubro de 1979
  - Endereço: Rua Sinfonia Heroica, 24 - Vila Calu, São Paulo - SP, 04.961-010
  - Presidente: Marcio Martins
  - Situação: Em operação (46 anos de história)

LOCALIZAÇÃO GEOGRÁFICA:
- Vila Calu, Zona Sul de São Paulo

DOCUMENTAÇÃO LIMITADA:
Mestres contemporâneos frequentemente têm informações biográficas públicas
limitadas. A maioria dos detalhes derivados de registros oficiais da
associação e do site da CN Capoeira documentando a linhagem.

FONTES:
- cncapoeira.nl/en/about-us/ (informações de linhagem)
- Registros da associação (CNPJ, data de fundação, endereço)
- Relatório de pessoa do Mestre Limão (contexto de linhagem)'
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
