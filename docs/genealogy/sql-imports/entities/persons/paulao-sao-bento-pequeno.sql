-- ============================================================
-- GENEALOGY PERSON: Paulão (São Bento Pequeno)
-- Generated: 2026-01-11
-- ============================================================
-- CONTEXT: This is Paulão who co-founded Academia São Bento Pequeno
-- in 1969 with Mestres Pinatti and Limão - the famous "three Ps".
-- DISTINCT from Paulão (Muzenza) - Paulo Sérgio da Silva, b. 1955,
-- who founded Grupo Muzenza in 1972.
--
-- apelido_context = 'São Bento Pequeno' to distinguish from other
-- capoeiristas named Paulão.
--
-- LIMITED BIOGRAPHICAL DATA:
-- Sources consistently mention Paulão as one of the three founders
-- but provide no full name, birth/death dates, or detailed biography.
-- He appears primarily as a secondary figure in the founding narrative,
-- with most attention focused on Pinatti (native paulista, archive keeper)
-- and Limão (Bahian Angoleiro who brought Caiçara's lineage).
--
-- BIRTH YEAR ESTIMATION (1940, decade):
-- Paulão co-founded Academia São Bento Pequeno on Aug 1, 1969.
-- Co-founders: Pinatti (b. 1930, age 39) and Limão (b. 1945, age 24).
-- To be a mestre and equal partner in founding, Paulão was likely 25-40.
-- Estimate: ~1940 places him at ~29 in 1969, between his older and younger partners.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown
  'Paulão',
  'São Bento Pequeno', -- Context to distinguish from Paulão (Muzenza)
  'mestre'::genealogy.title,
  NULL,
  ARRAY[]::text[], -- No stable public links found specific to this Paulão
  -- Style
  'mixed'::genealogy.style,
  E'As a co-founder of Academia São Bento Pequeno, Paulão helped develop "Capoeira Angolinha," an eclectic approach bridging Capoeira Regional and Capoeira Angola. The academy''s unique graduation system used pants colors rather than cordas.',
  E'Como co-fundador da Academia São Bento Pequeno, Paulão ajudou a desenvolver a "Capoeira Angolinha," uma abordagem eclética entre Capoeira Regional e Capoeira Angola. O sistema único de graduação da academia usava cores de calças em vez de cordas.',
  -- Birth (estimated)
  1940, 'decade'::genealogy.date_precision, NULL,
  -- Death (unknown)
  NULL, NULL::genealogy.date_precision, NULL,
  -- bio_en
  E'Paulão is one of the "three Ps" (Pinatti, Paulão, Paulo Limão) who co-founded the Academia de Capoeira São Bento Pequeno on August 1, 1969, in São Paulo. The academy was located at Rua do Vergueiro 2684, near the Ana Rosa metro station in the Vila Mariana district.

The founding came about through friendship: Mestre Limão, who had arrived in São Paulo in 1969 with Mestre Caiçara to record an LP, met Mestre Pinatti and consolidated a friendship. Together with Paulão, they were invited to open an academy. This partnership united three distinct backgrounds: Pinatti, a native paulista who had studied capoeira from Lamartine Pereira da Costa''s book before training under Zé de Freitas; Limão, a Bahian Angoleiro trained by Mestre Caiçara in Santo Amaro da Purificação; and Paulão, whose background and training remain undocumented.

The Academia São Bento Pequeno became notable for its "Capoeira Angolinha" style—an eclectic approach that bridged Regional and Angola traditions. The academy developed an innovative graduation system using pants colors instead of cordas: black for novice, green for baptized, yellow for intermediate, blue for advanced, and white for the Master.

In 1970, Limão left the partnership to found his own academy, Academia Quilombo dos Palmares, on Avenida Morumbi. The subsequent history of Paulão''s involvement with São Bento Pequeno is not documented in available sources. Pinatti continued leading the academy for decades, training over 180 students across seven generations.

Unlike Limão (whose dramatic life and tragic death in 1985 are well documented) and Pinatti (who maintained an extensive archive and was still active in 2010), Paulão appears in historical records only as a co-founder, with no additional biographical details preserved.',
  -- bio_pt
  E'Paulão é um dos "três Pês" (Pinatti, Paulão, Paulo Limão) que co-fundaram a Academia de Capoeira São Bento Pequeno em 1° de agosto de 1969, em São Paulo. A academia estava localizada na Rua do Vergueiro 2684, próximo ao metrô Ana Rosa no bairro de Vila Mariana.

A fundação surgiu através da amizade: Mestre Limão, que havia chegado em São Paulo em 1969 com Mestre Caiçara para gravar um LP, conheceu Mestre Pinatti e consolidou uma amizade. Junto com Paulão, foram convidados a abrir uma academia. Esta parceria uniu três origens distintas: Pinatti, paulista nativo que havia estudado capoeira pelo livro de Lamartine Pereira da Costa antes de treinar com Zé de Freitas; Limão, Angoleiro baiano treinado por Mestre Caiçara em Santo Amaro da Purificação; e Paulão, cuja origem e formação permanecem não documentadas.

A Academia São Bento Pequeno tornou-se notável por seu estilo "Capoeira Angolinha"—uma abordagem eclética que unia tradições de Regional e Angola. A academia desenvolveu um sistema inovador de graduação usando cores de calças em vez de cordas: preta para novato, verde para batizado, amarela para intermediário, azul para avançado e branca para o Mestre.

Em 1970, Limão deixou a parceria para fundar sua própria academia, a Academia Quilombo dos Palmares, na Avenida Morumbi. A história subsequente do envolvimento de Paulão com a São Bento Pequeno não está documentada nas fontes disponíveis. Pinatti continuou liderando a academia por décadas, formando mais de 180 alunos em sete gerações.

Diferente de Limão (cuja vida dramática e morte trágica em 1985 são bem documentadas) e Pinatti (que manteve um extenso acervo e ainda estava ativo em 2010), Paulão aparece nos registros históricos apenas como co-fundador, sem detalhes biográficos adicionais preservados.',
  -- achievements_en
  E'- August 1, 1969: Co-founded Academia de Capoeira São Bento Pequeno with Mestres Pinatti and Limão
- One of the "three Ps" (Pinatti, Paulão, Paulo Limão) who established the academy
- Helped develop "Capoeira Angolinha" style bridging Regional and Angola
- Contributed to innovative pants-based graduation system',
  -- achievements_pt
  E'- 1° de agosto de 1969: Co-fundou Academia de Capoeira São Bento Pequeno com Mestres Pinatti e Limão
- Um dos "três Pês" (Pinatti, Paulão, Paulo Limão) que estabeleceram a academia
- Ajudou a desenvolver o estilo "Capoeira Angolinha" entre Regional e Angola
- Contribuiu para o inovador sistema de graduação por calças',
  -- notes_en
  E'IDENTITY DISAMBIGUATION:
This profile is for Paulão (São Bento Pequeno), DISTINCT from:
- Paulão (Muzenza) - Paulo Sérgio da Silva (b. 1955), founder of Grupo Muzenza (1972)
- Paulão Ceara - Paulo César Pereira (b. 1961), co-founder of Grupo Capoeira Brasil (1989)

FULL NAME: Unknown
- Sources only refer to him as "Paulão" or "Mestre Paulão"
- No full name found in any consulted sources

BIRTH YEAR ESTIMATION (1940, decade):
- Co-founded Academia São Bento Pequeno on Aug 1, 1969
- Co-founders: Pinatti (b. 1930, age 39 in 1969) and Limão (b. 1945, age 24 in 1969)
- To be a mestre and equal partner in founding, Paulão was likely 25-40 years old
- Estimate: ~1940 places him at ~29 in 1969, between his older and younger partners

BIOGRAPHICAL GAPS:
- Birthplace: Unknown (likely Bahia or São Paulo)
- Death date: Unknown
- Training background: Not documented
- Teachers: Not documented
- Post-1970 activities: Not documented

THE "THREE PS":
- Pinatti (Djamir Furtado Pinatti) - native paulista, karateka, federation organizer
- Paulão - co-founder, minimal biographical documentation
- Paulo Limão (Paulo dos Santos, 1945-1985) - Bahian Angoleiro trained by Caiçara

ACADEMIA SÃO BENTO PEQUENO:
- Founded: August 1, 1969
- Address: Rua do Vergueiro 2684, near Ana Rosa metro
- Style: "Capoeira Angolinha" (eclectic between Regional and Angola)
- Graduation: Pants colors (black→green→yellow→blue→white)

TIMELINE:
- 1969: Limão arrives in São Paulo with Caiçara to record LP
- Aug 1, 1969: Academia São Bento Pequeno founded by three Ps
- Jun 1, 1970: Limão leaves to found Academia Quilombo dos Palmares
- Post-1970: Paulão''s activities undocumented; Pinatti continues leading academy',
  -- notes_pt
  E'DESAMBIGUAÇÃO DE IDENTIDADE:
Este perfil é de Paulão (São Bento Pequeno), DISTINTO de:
- Paulão (Muzenza) - Paulo Sérgio da Silva (n. 1955), fundador do Grupo Muzenza (1972)
- Paulão Ceará - Paulo César Pereira (n. 1961), co-fundador do Grupo Capoeira Brasil (1989)

NOME COMPLETO: Desconhecido
- Fontes referem-se a ele apenas como "Paulão" ou "Mestre Paulão"
- Nenhum nome completo encontrado nas fontes consultadas

ESTIMATIVA DE ANO DE NASCIMENTO (1940, década):
- Co-fundou Academia São Bento Pequeno em 1° ago 1969
- Co-fundadores: Pinatti (n. 1930, 39 anos em 1969) e Limão (n. 1945, 24 anos em 1969)
- Para ser mestre e parceiro igual na fundação, Paulão provavelmente tinha 25-40 anos
- Estimativa: ~1940 o coloca com ~29 anos em 1969, entre seus parceiros mais velho e mais jovem

LACUNAS BIOGRÁFICAS:
- Local de nascimento: Desconhecido (provavelmente Bahia ou São Paulo)
- Data de falecimento: Desconhecida
- Formação: Não documentada
- Mestres: Não documentados
- Atividades pós-1970: Não documentadas

OS "TRÊS PÊS":
- Pinatti (Djamir Furtado Pinatti) - paulista nativo, karateca, organizador de federação
- Paulão - co-fundador, documentação biográfica mínima
- Paulo Limão (Paulo dos Santos, 1945-1985) - Angoleiro baiano treinado por Caiçara

ACADEMIA SÃO BENTO PEQUENO:
- Fundada: 1° de agosto de 1969
- Endereço: Rua do Vergueiro 2684, próximo ao metrô Ana Rosa
- Estilo: "Capoeira Angolinha" (eclético entre Regional e Angola)
- Graduação: Cores de calças (preta→verde→amarela→azul→branca)

CRONOLOGIA:
- 1969: Limão chega em São Paulo com Caiçara para gravar LP
- 1° ago 1969: Academia São Bento Pequeno fundada pelos três Pês
- 1° jun 1970: Limão sai para fundar Academia Quilombo dos Palmares
- Pós-1970: Atividades de Paulão não documentadas; Pinatti continua liderando academia'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
