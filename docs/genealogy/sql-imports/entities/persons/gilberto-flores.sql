-- ============================================================
-- GENEALOGY PERSON: Gilberto Flores
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1948, decade precision):
-- Brother Rafael Flores died November 5, 2016 at age 68 (born ~1948).
-- All three brothers are described as being of similar age, training
-- together during school vacations in early 1963. Sources list them
-- together as "the three brothers" without indicating significant age
-- differences. Using 1948 as estimate (same as Rafael) with decade precision.
-- ============================================================
-- CURRENT STATUS: Unknown. Not among the 17 active cordas vermelhas
-- listed on official Senzala website (gruposenzala.org), but also not
-- marked as deceased (†) like Rafael Flores and Peixinho.
-- ============================================================
-- DISCREPANCY: Some sources (capoeirailhagrande.wordpress.com) claim
-- Gilberto Flores "received the capoeira name 'Gil Velho'". This is
-- INCORRECT. Gil Velho is confirmed as Gato's brother (Fernando
-- Albuquerque's brother), not Gilberto Flores. Multiple sources
-- (capoeira.fandom.com, senzalamidlands.co.uk, gruposenzala.org)
-- list both "Mestre Gilberto Flores" and "Mestre Gil Velho" as
-- separate founding mestres.
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Gilberto Flores',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeira.fandom.com/wiki/Mestre_Gilberto_Flores',
    'https://www.gruposenzala.org/mestres-do-grupo.html',
    'https://www.senzala.co.uk/history.html',
    'https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala',
    'https://www.lalaue.com/capoeira-schools/grupo-senzala-capoeira/'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'One of the three founding Flores brothers of Grupo Senzala. Gilberto trained with Mestre Bimba and Mestre Pastinha during school vacations in Salvador alongside his brothers Paulo and Rafael before co-founding Grupo Senzala in Rio de Janeiro. The Senzala methodology blended Capoeira Regional technique with elements of Capoeira Angola and Rio''s street capoeira traditions, pioneering systematic training sequences and open rodas that influenced capoeira groups worldwide.',
  E'Um dos três irmãos Flores fundadores do Grupo Senzala. Gilberto treinou com Mestre Bimba e Mestre Pastinha durante as férias escolares em Salvador junto com seus irmãos Paulo e Rafael antes de co-fundar o Grupo Senzala no Rio de Janeiro. A metodologia Senzala mesclava técnica da Capoeira Regional com elementos da Capoeira Angola e tradições de capoeira de rua do Rio, pioneira em sequências de treinamento sistemáticas e rodas abertas que influenciaram grupos de capoeira em todo o mundo.',
  -- Life dates
  1948,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Gilberto Flores is one of three brothers from Bahia who co-founded Grupo Senzala, one of the most influential capoeira organizations in history. Along with his brothers Paulo and Rafael Flores, Gilberto helped establish the foundations of what would become a global capoeira movement.

The Flores family moved from Salvador, Bahia to Rio de Janeiro, but the brothers maintained deep ties to their homeland. During school vacations, they would return to Salvador for capoeira training. Multiple sources confirm that all three brothers trained with Mestre Bimba, the founder of Capoeira Regional, and Mestre Pastinha, the guardian of Capoeira Angola—exposure to both major traditions that would shape the Senzala methodology.

In 1963, the brothers began organizing weekly training sessions on the terrace of their apartment building in the Laranjeiras neighborhood of Rio de Janeiro. These informal gatherings quickly attracted local youth, including Fernando Albuquerque (later Mestre Gato), who witnessed Paulo''s fighting abilities at a party and sought to learn from him. The terrace sessions grew to include Claudio Danadinho, Peixinho, Itamar, Garrincha, Sorriso, Preguiça, Gil Velho (Gato''s brother), and others who would become the founding nucleus of Grupo Senzala.

In 1966, during a demonstration at the German Club (Clube Germânico), brother Paulo Flores suggested the name "Grupo Senzala"—referencing the slave quarters where enslaved Africans were held on Brazilian plantations, a powerful political and cultural statement connecting capoeira to Brazil''s history of resistance and liberation.

The group achieved national recognition by winning the Berimbau de Ouro tournament three consecutive years (1967-1969), permanently securing the trophy. The founding members, including Gilberto, developed an innovative teaching methodology that balanced systematic training sequences with student creativity and spontaneity. They pioneered open rodas where all capoeiristas were welcome, fostering continuous knowledge exchange.

Unlike his brother Rafael, who served as leader and spokesperson for approximately 20 years before founding Grupo Senzala "Patrimônio dos Pretos" in Espírito Santo, and unlike Paulo who remains among the active cordas vermelhas, Gilberto''s post-founding trajectory is less documented. He is listed as a founding mestre but not among the 17 currently active red cords, and his current status remains unclear.

The Senzala methodology pioneered by the Flores brothers and their companions has influenced most major capoeira organizations worldwide. The group has graduated over 96 mestres and maintains a presence across all continents, making it one of the most successful and far-reaching capoeira organizations in history.',
  -- Extended content (bio_pt)
  E'Gilberto Flores é um dos três irmãos da Bahia que co-fundaram o Grupo Senzala, uma das organizações de capoeira mais influentes da história. Junto com seus irmãos Paulo e Rafael Flores, Gilberto ajudou a estabelecer as bases do que se tornaria um movimento global de capoeira.

A família Flores mudou-se de Salvador, Bahia para o Rio de Janeiro, mas os irmãos mantiveram laços profundos com sua terra natal. Durante as férias escolares, retornavam a Salvador para treinar capoeira. Múltiplas fontes confirmam que os três irmãos treinaram com Mestre Bimba, o fundador da Capoeira Regional, e Mestre Pastinha, o guardião da Capoeira Angola—exposição a ambas as grandes tradições que moldaria a metodologia Senzala.

Em 1963, os irmãos começaram a organizar sessões de treinamento semanais no terraço do prédio de apartamentos onde moravam no bairro de Laranjeiras, Rio de Janeiro. Esses encontros informais rapidamente atraíram a juventude local, incluindo Fernando Albuquerque (mais tarde Mestre Gato), que testemunhou as habilidades de luta de Paulo em uma festa e procurou aprender com ele. As sessões no terraço cresceram para incluir Claudio Danadinho, Peixinho, Itamar, Garrincha, Sorriso, Preguiça, Gil Velho (irmão de Gato) e outros que se tornariam o núcleo fundador do Grupo Senzala.

Em 1966, durante uma apresentação no Clube Germânico, o irmão Paulo Flores sugeriu o nome "Grupo Senzala"—referenciando as senzalas onde africanos escravizados eram mantidos nas plantações brasileiras, uma poderosa declaração política e cultural conectando a capoeira à história de resistência e libertação do Brasil.

O grupo alcançou reconhecimento nacional ao vencer o torneio Berimbau de Ouro por três anos consecutivos (1967-1969), assegurando permanentemente o troféu. Os membros fundadores, incluindo Gilberto, desenvolveram uma metodologia de ensino inovadora que equilibrava sequências de treinamento sistemáticas com criatividade e espontaneidade do aluno. Foram pioneiros em rodas abertas onde todos os capoeiristas eram bem-vindos, promovendo troca contínua de conhecimento.

Diferentemente de seu irmão Rafael, que serviu como líder e porta-voz por aproximadamente 20 anos antes de fundar o Grupo Senzala "Patrimônio dos Pretos" no Espírito Santo, e diferentemente de Paulo que permanece entre os cordas vermelhas ativos, a trajetória de Gilberto após a fundação é menos documentada. Ele é listado como mestre fundador mas não entre os 17 cordas vermelhas atualmente ativos, e sua situação atual permanece incerta.

A metodologia Senzala pioneira dos irmãos Flores e seus companheiros influenciou a maioria das principais organizações de capoeira em todo o mundo. O grupo formou mais de 96 mestres e mantém presença em todos os continentes, tornando-se uma das organizações de capoeira mais bem-sucedidas e de maior alcance da história.',
  -- Achievements
  E'- Co-founder of Grupo Senzala (1963, formally named 1966)
- Trained with Mestre Bimba in Salvador during school vacations
- Trained with Mestre Pastinha during school vacations (exposure to Angola tradition)
- Part of founding nucleus that won Berimbau de Ouro three consecutive years (1967-1969)
- Founding corda vermelha (red cord) of Grupo Senzala
- Contributed to development of Senzala teaching methodology blending Regional and Angola traditions',
  E'- Co-fundador do Grupo Senzala (1963, formalmente nomeado 1966)
- Treinou com Mestre Bimba em Salvador durante férias escolares
- Treinou com Mestre Pastinha durante férias escolares (exposição à tradição Angola)
- Parte do núcleo fundador que venceu o Berimbau de Ouro por três anos consecutivos (1967-1969)
- Corda vermelha fundador do Grupo Senzala
- Contribuiu para o desenvolvimento da metodologia de ensino Senzala mesclando tradições Regional e Angola',
  -- Researcher notes (notes_en)
  E'BIRTH YEAR ESTIMATION (1948, decade precision):
Brother Rafael Flores died November 5, 2016 at age 68 (born ~1948).
All three brothers described as training together during school vacations in early 1963, suggesting similar ages.
Using 1948 as estimate with decade precision.

BIRTHPLACE:
- Bahia - confirmed by multiple sources
- Sources say all three brothers were "originally from Bahia"
- Family relocated from Salvador to Rio de Janeiro

FULL NAME:
- Full name not documented in available sources
- Brothers Paulo and Rafael have surname "Flores Viana"
- Gilberto''s full name likely "Gilberto Flores Viana" but unconfirmed
- Using "Gilberto Flores" as apelido (how he is known in capoeira community)

TEACHERS:
- Mestre Bimba (Regional) - training during school vacations in Salvador
- Mestre Pastinha (Angola) - training during school vacations in Salvador
- Note: Unlike Paulo and Rafael, specific duration (2 months early 1963) not explicitly confirmed for Gilberto, but all sources describe all three brothers training together

CURRENT STATUS:
- NOT among the 17 active cordas vermelhas on gruposenzala.org
- NOT marked as deceased (†) like Rafael Flores and Peixinho
- Status unknown - may be retired, inactive, or passed without public documentation
- Active cordas vermelhas (2024): Paulo Flores, Claudio Danadinho, Gato, Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, Azeite

DISCREPANCY - GILBERTO FLORES vs GIL VELHO:
Some sources (capoeirailhagrande.wordpress.com) erroneously state Gilberto Flores "received the capoeira name Gil Velho".
This is INCORRECT. Multiple authoritative sources confirm:
- Gil Velho is Gato''s brother (Fernando Albuquerque''s brother)
- Both "Mestre Gilberto Flores" and "Mestre Gil Velho" are listed separately as founding mestres
- Sources: capoeira.fandom.com/wiki/Centro_Cultural_Senzala, senzalamidlands.co.uk, gruposenzala.org

TRAINING COMPANIONS (founding nucleus):
- Paulo Flores (brother)
- Rafael Flores (brother, †Nov 5, 2016)
- Gato (Fernando Campelo Cavalcanti de Albuquerque, b.1947)
- Gil Velho (Gato''s brother)
- Garrincha
- Itamar
- Peixinho (Marcelo Azevedo Guimarães, 1947-2011)
- Claudio Danadinho (Cláudio José Queiroz)
- Preguiça
- Sorriso

FAMILY:
- Brother: Paulo Flores Viana (living, active corda vermelha)
- Brother: Rafael Flores Viana (†Nov 5, 2016, age 68)',
  E'ESTIMATIVA ANO DE NASCIMENTO (1948, precisão década):
Irmão Rafael Flores morreu em 5 de novembro de 2016 aos 68 anos (nascido ~1948).
Os três irmãos são descritos como treinando juntos durante férias escolares no início de 1963, sugerindo idades semelhantes.
Usando 1948 como estimativa com precisão de década.

LOCAL DE NASCIMENTO:
- Bahia - confirmado por múltiplas fontes
- Fontes dizem que os três irmãos eram "originalmente da Bahia"
- Família mudou de Salvador para o Rio de Janeiro

NOME COMPLETO:
- Nome completo não documentado nas fontes disponíveis
- Irmãos Paulo e Rafael têm sobrenome "Flores Viana"
- Nome completo de Gilberto provavelmente "Gilberto Flores Viana" mas não confirmado
- Usando "Gilberto Flores" como apelido (como é conhecido na comunidade de capoeira)

MESTRES:
- Mestre Bimba (Regional) - treinamento durante férias escolares em Salvador
- Mestre Pastinha (Angola) - treinamento durante férias escolares em Salvador
- Nota: Diferente de Paulo e Rafael, duração específica (2 meses início de 1963) não explicitamente confirmada para Gilberto, mas todas as fontes descrevem os três irmãos treinando juntos

SITUAÇÃO ATUAL:
- NÃO entre os 17 cordas vermelhas ativos no gruposenzala.org
- NÃO marcado como falecido (†) como Rafael Flores e Peixinho
- Situação desconhecida - pode estar aposentado, inativo, ou falecido sem documentação pública
- Cordas vermelhas ativos (2024): Paulo Flores, Claudio Danadinho, Gato, Gil Velho, Garrincha, Sorriso, Itamar, Toni Vargas, Ramos, Elias, Amendoim, Beto, Feijão, Samara, Arruda, Azeite

DISCREPÂNCIA - GILBERTO FLORES vs GIL VELHO:
Algumas fontes (capoeirailhagrande.wordpress.com) erroneamente afirmam que Gilberto Flores "recebeu o apelido de capoeira Gil Velho".
Isso está INCORRETO. Múltiplas fontes autoritativas confirmam:
- Gil Velho é irmão de Gato (irmão de Fernando Albuquerque)
- Ambos "Mestre Gilberto Flores" e "Mestre Gil Velho" são listados separadamente como mestres fundadores
- Fontes: capoeira.fandom.com/wiki/Centro_Cultural_Senzala, senzalamidlands.co.uk, gruposenzala.org

COMPANHEIROS DE TREINO (núcleo fundador):
- Paulo Flores (irmão)
- Rafael Flores (irmão, †5 nov 2016)
- Gato (Fernando Campelo Cavalcanti de Albuquerque, n.1947)
- Gil Velho (irmão de Gato)
- Garrincha
- Itamar
- Peixinho (Marcelo Azevedo Guimarães, 1947-2011)
- Claudio Danadinho (Cláudio José Queiroz)
- Preguiça
- Sorriso

FAMÍLIA:
- Irmão: Paulo Flores Viana (vivo, corda vermelha ativo)
- Irmão: Rafael Flores Viana (†5 nov 2016, 68 anos)'
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
