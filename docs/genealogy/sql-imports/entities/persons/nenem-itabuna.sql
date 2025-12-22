-- ============================================================
-- GENEALOGY PERSON: Neném (Itabuna)
-- Generated: 2025-12-20
-- ============================================================
-- BIRTH YEAR ESTIMATION (1860, decade precision):
-- Neném is described as "of African origin" / "de origem africana"
-- indicating he was born in Africa. Brazil's transatlantic slave trade
-- effectively ended in 1850 (though illegal trafficking continued until
-- the 1880s). If he was teaching Paizinho (Teodoro Ramos) who in turn
-- trained Artur Emídio starting 1937, and Paizinho was an established
-- mestre by the late 1800s/early 1900s, Neném would have been 30-50
-- when teaching. Working backwards from Paizinho's likely birth
-- (~1890-1910), Neném was likely born 1850-1880. Using 1860 as midpoint
-- with decade precision.
--
-- IDENTITY CLARIFICATION:
-- This person "Neném (Itabuna)" from the southern Bahia region is
-- DISTINCT from:
-- 1. Neném (1937 Congress) - participant in II Congresso Afro-Brasileiro
--    demonstration in Salvador (Jan 14, 1937). Whether this is the same
--    person is UNCERTAIN - geographically separated (Itabuna vs Salvador)
--    but chronologically possible if elderly.
-- 2. Mestre Noronha's father - was named José Coutinho, NOT Neném.
--
-- Using apelido_context='Itabuna' to distinguish from other Nenéms.
--
-- SIGNIFICANCE: Layer Zero figure; anchor of the Itabuna capoeira
-- lineage that produced Artur Emídio and the entire Rio de Janeiro
-- contemporary capoeira school. One of the few documented African-born
-- capoeiristas in the genealogical record.
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,  -- Full name unknown
  'Neném',
  'Itabuna',  -- Context to distinguish from other Nenéms
  NULL,  -- No formal title in this era
  NULL,  -- No portrait available
  ARRAY[
    'https://velhosmestres.com/en/featured-69',
    'https://capoeirahistory.com/mestre/master-paulo-gomes/'
  ]::text[],
  -- Capoeira-specific
  NULL,  -- Style classification not applicable for pre-codification era
  E'Neném taught in Itabuna during the era when capoeira was criminalized in Brazil (1890-1937). His students, notably Paizinho (Teodoro Ramos), trained "on top of hills, in alleyways, at night and always hidden" according to Artur Emídio''s testimony. The training methods were necessarily clandestine, with practitioners facing arrest and imprisonment. This underground tradition in southern Bahia predated and operated independently from the Salvador-based formalization that would later produce Capoeira Regional and Angola as distinct styles.',
  E'Neném ensinava em Itabuna durante a era em que a capoeira era criminalizada no Brasil (1890-1937). Seus alunos, notadamente Paizinho (Teodoro Ramos), treinavam "no alto dos morros, nos becos, à noite e sempre escondidos" segundo o testemunho de Artur Emídio. Os métodos de treinamento eram necessariamente clandestinos, com praticantes enfrentando prisão e encarceramento. Esta tradição subterrânea no sul da Bahia antecedeu e operava independentemente da formalização sediada em Salvador que mais tarde produziria a Capoeira Regional e Angola como estilos distintos.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Africa (unspecified region)',
  NULL,  -- Death year unknown
  NULL,
  NULL,  -- Death place unknown
  -- Extended content (English)
  E'Mestre Neném was an African-born capoeirista who taught in Itabuna, in the southern Bahia region of Brazil. He represents one of the most significant yet obscure figures in capoeira genealogy—a Layer Zero practitioner who anchors an entire lineage that would eventually transform capoeira in Rio de Janeiro and beyond.

Almost nothing is known about Neném except through the testimony of his descendants in the art. He is described simply as "an African" or "of African origin," indicating he was born on the African continent and brought to Brazil, likely during the final decades of the transatlantic slave trade or as a child of enslaved parents.

What we know comes primarily from Mestre Artur Emídio (1930-2011), who learned capoeira from Mestre Paizinho (Teodoro Ramos), who was in turn a direct disciple of Neném. In Artur Emídio''s recounting: "The practice of Capoeira was prohibited. They trained on top of hills, in alleyways, at night and always hidden. Many were the times that my Master was arrested. But the next day the bail was paid, and he would leave. And at night, he would return to teach Capoeira, practiced for love!"

This description of clandestine training, arrests, and perseverance applies to the entire lineage from Neném through Paizinho. The southern Bahia region, particularly around Itabuna and Ilhéus in the cocoa-growing belt, developed its own capoeira tradition separate from the more documented Salvador schools. This tradition was characterized by:

1. Strict secrecy due to criminalization
2. Training in remote locations (hilltops, back alleys)
3. Night-time practice to avoid police
4. Strong master-student bonds formed under persecution
5. The willingness to accept repeated arrest rather than abandon the art

The lineage Neném established would prove remarkably influential. Through Paizinho, his teachings reached Artur Emídio, who became a pioneer of capoeira in Rio de Janeiro. Artur Emídio is considered one of the "four main lineages" of contemporary Rio capoeira (alongside Paraná, Mário Buscapé, and Roque), and was likely the first capoeirista to perform internationally.

Neném''s legacy thus extends from the African continent through the persecution era of Brazilian capoeira to the global art form it became in the late 20th century. As Mestre Paulo Gomes''s genealogy records: he was "''Great-grandson'' of Mestre Neném" through the chain Neném → Paizinho → Artur Emídio → Paulo Gomes.',
  -- Extended content (Portuguese)
  E'Mestre Neném foi um capoeirista nascido na África que ensinava em Itabuna, na região sul da Bahia. Ele representa uma das figuras mais significativas, porém obscuras, na genealogia da capoeira—um praticante da Camada Zero que ancora toda uma linhagem que eventualmente transformaria a capoeira no Rio de Janeiro e além.

Quase nada se sabe sobre Neném exceto através do testemunho de seus descendentes na arte. Ele é descrito simplesmente como "um africano" ou "de origem africana," indicando que nasceu no continente africano e foi trazido ao Brasil, provavelmente durante as décadas finais do tráfico transatlântico de escravos ou como filho de pais escravizados.

O que sabemos vem principalmente de Mestre Artur Emídio (1930-2011), que aprendeu capoeira com Mestre Paizinho (Teodoro Ramos), que por sua vez era discípulo direto de Neném. No relato de Artur Emídio: "A prática da Capoeira era proibida. Treinavam no alto dos morros, nos becos, à noite e sempre escondidos. Muitas foram as vezes que meu Mestre foi preso. Mas no dia seguinte a fiança era paga, e ele saía. E à noite, voltava a ensinar Capoeira, praticada por amor!"

Esta descrição de treinamento clandestino, prisões e perseverança se aplica a toda a linhagem de Neném passando por Paizinho. A região sul da Bahia, particularmente em torno de Itabuna e Ilhéus na zona cacaueira, desenvolveu sua própria tradição de capoeira separada das escolas mais documentadas de Salvador. Esta tradição era caracterizada por:

1. Sigilo estrito devido à criminalização
2. Treinamento em locais remotos (topos de morros, becos)
3. Prática noturna para evitar a polícia
4. Fortes laços mestre-aluno formados sob perseguição
5. A disposição de aceitar prisão repetida em vez de abandonar a arte

A linhagem que Neném estabeleceu se provaria notavelmente influente. Através de Paizinho, seus ensinamentos chegaram a Artur Emídio, que se tornou pioneiro da capoeira no Rio de Janeiro. Artur Emídio é considerado uma das "quatro principais linhagens" da capoeira contemporânea do Rio (ao lado de Paraná, Mário Buscapé e Roque), e foi provavelmente o primeiro capoeirista a se apresentar internacionalmente.

O legado de Neném assim se estende do continente africano através da era de perseguição da capoeira brasileira até a forma de arte global que se tornou no final do século XX. Como registra a genealogia de Mestre Paulo Gomes: ele era "''Bisneto'' de Mestre Neném" através da cadeia Neném → Paizinho → Artur Emídio → Paulo Gomes.',
  -- Achievements (English)
  E'- African-born anchor of the Itabuna capoeira lineage
- Teacher of Mestre Paizinho (Teodoro Ramos), who continued the tradition
- Preserved and transmitted capoeira during the criminalization period (1890-1937)
- His lineage produced Mestre Artur Emídio, one of four founding lineages of contemporary Rio de Janeiro capoeira
- Represents direct African-to-Brazil transmission of martial arts/cultural practices',
  -- Achievements (Portuguese)
  E'- Âncora nascida na África da linhagem de capoeira de Itabuna
- Professor de Mestre Paizinho (Teodoro Ramos), que continuou a tradição
- Preservou e transmitiu a capoeira durante o período de criminalização (1890-1937)
- Sua linhagem produziu Mestre Artur Emídio, uma das quatro linhagens fundadoras da capoeira contemporânea do Rio de Janeiro
- Representa transmissão direta da África para o Brasil de práticas culturais/artes marciais',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1860, decade precision):
Working backwards from known dates:
- Artur Emídio began training with Paizinho in 1937 (age 7)
- Paizinho was an established mestre by 1937, likely 30-50 years old
- This places Paizinho''s birth approximately 1887-1907
- If Neném taught Paizinho from childhood (age 10-20), and was 30-50 at the time
- Neném was likely born between 1850-1880
- Using 1860 as midpoint estimate
- "African origin" designation indicates Africa-born, consistent with someone born before or during final decades of slave trade (Brazil abolished slavery 1888)

BIRTH PLACE:
Described as "of African origin" / "an African" but specific region not documented. Could be from any region involved in late-period slave trade to Bahia (primarily West African coast, Angola/Congo region).

DEATH YEAR:
Unknown. No documentation found.

NAME DISCREPANCY:
"Neném" is a diminutive form in Brazilian Portuguese, similar to "Baby" or "Little One" - commonly used as an affectionate nickname. Full name unknown.

IDENTITY CLARIFICATION - THREE POSSIBLE "NENÉM" FIGURES:
1. Neném (Itabuna) - THIS PROFILE - African-born teacher of Paizinho in southern Bahia
2. Neném (1937 Congress) - Participant in II Congresso Afro-Brasileiro capoeira demonstration, Salvador, January 14, 1937. Listed alongside Querido de Deus, Barbosa, Zeppelin, Bugaia, Fernandes, Eutychio, Zei, Ambrósio, Barroso, Arthur Mattos, Raphael, Edgard, Damião.
3. Confusion with Noronha''s father - RESOLVED: Mestre Noronha (Daniel Coutinho, 1909-1977) had father named José Coutinho, NOT Neném.

Whether Neném (Itabuna) and Neném (1937 Congress) are the same person is UNCERTAIN:
- Geographically separated: Itabuna (~300km south of Salvador) vs Salvador
- Chronologically possible: If born ~1860, would be ~77 in 1937 - elderly but possible
- Insufficient evidence to confirm or deny

STUDENTS:
- Paizinho (Teodoro Ramos, ?-1945/1946) - Primary student; continued lineage in Itabuna

LINEAGE CHAIN:
Neném (African, ~1860-?) → Paizinho (Teodoro Ramos, ?-1945) → Artur Emídio (1930-2011) → [Leopoldina, Djalma Bandeira, Paulo Gomes, Celso do Engenho, etc.]

SOURCES CONSULTED:
- velhosmestres.com/en/featured-69 (Artur Emídio profile)
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- capoeirahistory.com/mestre/master-paulo-gomes/
- portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-artur-emidio/
- nossa-tribo.com/mestre-artur-emidio/
- velhosmestres.com/br/destaques-38 (1937 Congress participants)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1860, precisão de década):
Trabalhando de trás para frente a partir de datas conhecidas:
- Artur Emídio começou a treinar com Paizinho em 1937 (aos 7 anos)
- Paizinho era um mestre estabelecido em 1937, provavelmente com 30-50 anos
- Isso coloca o nascimento de Paizinho aproximadamente em 1887-1907
- Se Neném ensinou Paizinho desde a infância (idade 10-20), e tinha 30-50 na época
- Neném provavelmente nasceu entre 1850-1880
- Usando 1860 como estimativa do ponto médio
- Designação de "origem africana" indica nascido na África, consistente com alguém nascido antes ou durante as décadas finais do tráfico de escravos (Brasil aboliu escravidão em 1888)

LOCAL DE NASCIMENTO:
Descrito como "de origem africana" / "um africano" mas região específica não documentada. Poderia ser de qualquer região envolvida no tráfico de escravos tardio para a Bahia (principalmente costa da África Ocidental, região de Angola/Congo).

ANO DE MORTE:
Desconhecido. Nenhuma documentação encontrada.

DISCREPÂNCIA DE NOME:
"Neném" é uma forma diminutiva em português brasileiro, similar a "Bebê" ou "Pequenino" - comumente usado como apelido afetuoso. Nome completo desconhecido.

ESCLARECIMENTO DE IDENTIDADE - TRÊS POSSÍVEIS FIGURAS "NENÉM":
1. Neném (Itabuna) - ESTE PERFIL - Professor nascido na África de Paizinho no sul da Bahia
2. Neném (1937 Congress) - Participante da demonstração de capoeira do II Congresso Afro-Brasileiro, Salvador, 14 de janeiro de 1937. Listado ao lado de Querido de Deus, Barbosa, Zeppelin, Bugaia, Fernandes, Eutychio, Zei, Ambrósio, Barroso, Arthur Mattos, Raphael, Edgard, Damião.
3. Confusão com pai de Noronha - RESOLVIDO: Mestre Noronha (Daniel Coutinho, 1909-1977) tinha pai chamado José Coutinho, NÃO Neném.

Se Neném (Itabuna) e Neném (1937 Congress) são a mesma pessoa é INCERTO:
- Geograficamente separados: Itabuna (~300km ao sul de Salvador) vs Salvador
- Cronologicamente possível: Se nascido ~1860, teria ~77 em 1937 - idoso mas possível
- Evidência insuficiente para confirmar ou negar

ALUNOS:
- Paizinho (Teodoro Ramos, ?-1945/1946) - Aluno principal; continuou a linhagem em Itabuna

CADEIA DE LINHAGEM:
Neném (Africano, ~1860-?) → Paizinho (Teodoro Ramos, ?-1945) → Artur Emídio (1930-2011) → [Leopoldina, Djalma Bandeira, Paulo Gomes, Celso do Engenho, etc.]

FONTES CONSULTADAS:
- velhosmestres.com/en/featured-69 (perfil de Artur Emídio)
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- capoeirahistory.com/mestre/master-paulo-gomes/
- portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-artur-emidio/
- nossa-tribo.com/mestre-artur-emidio/
- velhosmestres.com/br/destaques-38 (participantes do Congresso de 1937)'
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
