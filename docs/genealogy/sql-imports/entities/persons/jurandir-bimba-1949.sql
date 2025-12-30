-- ============================================================
-- GENEALOGY PERSON: Jurandir (Bimba student, 1949)
-- Generated: 2025-12-17
-- ============================================================
-- Uses apelido_context='Bimba 1949' to distinguish from:
-- - Mestre Jurandir Nascimento (GCAP pioneer, FICA co-founder)
-- - Mestre Jurandir Santos (son of Mestre João Grande)
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
  'Jurandir',
  'Bimba 1949',  -- Context to distinguish from other Jurandirs
  NULL,  -- No formal title found
  NULL,  -- No historical portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Jurandir trained under Mestre Bimba in Capoeira Regional. He also practiced judo, demonstrating the cross-training that was becoming more common among Bimba''s students in response to challenges from other martial arts. His participation in the 1949 challenge shows he was considered one of Bimba''s capable fighters.',
  E'Jurandir treinou com Mestre Bimba em Capoeira Regional. Ele também praticava judô, demonstrando o treinamento cruzado que estava se tornando mais comum entre os alunos de Bimba em resposta a desafios de outras artes marciais. Sua participação no desafio de 1949 mostra que ele era considerado um dos lutadores capazes de Bimba.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Jurandir was a student of Mestre Bimba who trained in Capoeira Regional and also practiced judo. He represented Bimba''s academy in the historic 1949 capoeira challenge at Estádio Carioca in Rio de Janeiro.

In February 1949, Mestre Sinhozinho, the leading figure of capoeira carioca in Rio de Janeiro, challenged Mestre Bimba''s Capoeira Regional school. Bimba''s group, which was touring São Paulo at the time, had been claiming superiority and was eager for real fighting ("pra valer") rather than just exhibition matches. They traveled to Rio to answer the challenge.

The event was organized by the Federação Metropolitana de Pugilismo (Metropolitan Federation of Pugilism) and held over two days at the Estádio Carioca on Avenida Passos in downtown Rio. It included not only the inter-capoeira matches but also a team of catch wrestlers who had similarly challenged Bimba''s academy.

On April 2, 1949, Jurandir faced Luiz "Cirandinha" Pereira Aguiar, Sinhozinho''s student and a heavyweight weightlifter described as "Brazilian capoeira champion". The fight ended quickly: Cirandinha knocked Jurandir out in the first round with a devastating body kick. Jurandir claimed the blow was a foul, but witnesses and the ring doctor ruled otherwise, and the result stood.

The same event saw another of Bimba''s students, Fernando Rodrigues Perez, lose to Rudolf Hermanny (only 17 years old) in just two minutes, with Perez''s arm injured by a kick. The defeats were significant enough that Bimba reportedly studied movements from Sinhozinho''s fighters afterward to incorporate into his own style.

Little else is known about Jurandir''s life before or after this challenge. His participation marks him as one of Bimba''s capable fighters during a crucial period of inter-style rivalry in Brazilian capoeira history.',
  -- bio_pt
  E'Jurandir foi um aluno de Mestre Bimba que treinou Capoeira Regional e também praticava judô. Ele representou a academia de Bimba no histórico desafio de capoeira de 1949 no Estádio Carioca no Rio de Janeiro.

Em fevereiro de 1949, Mestre Sinhozinho, a principal figura da capoeira carioca no Rio de Janeiro, desafiou a escola de Capoeira Regional de Mestre Bimba. O grupo de Bimba, que estava em turnê por São Paulo na época, vinha reivindicando superioridade e estava ansioso por lutas reais ("pra valer") em vez de apenas exibições. Eles viajaram para o Rio para responder ao desafio.

O evento foi organizado pela Federação Metropolitana de Pugilismo e realizado em dois dias no Estádio Carioca na Avenida Passos, no centro do Rio. Incluiu não apenas as lutas inter-capoeira, mas também uma equipe de lutadores de catch que havia similarmente desafiado a academia de Bimba.

Em 2 de abril de 1949, Jurandir enfrentou Luiz "Cirandinha" Pereira Aguiar, aluno de Sinhozinho e halterofilista peso-pesado descrito como "campeão brasileiro de capoeira". A luta terminou rapidamente: Cirandinha nocauteou Jurandir no primeiro round com um devastador chute no corpo. Jurandir alegou que o golpe foi falta, mas testemunhas e o médico do ringue decidiram de forma contrária, e o resultado foi mantido.

O mesmo evento viu outro aluno de Bimba, Fernando Rodrigues Perez, perder para Rudolf Hermanny (apenas 17 anos) em apenas dois minutos, com o braço de Perez lesionado por um chute. As derrotas foram significativas o suficiente para que Bimba supostamente estudasse movimentos dos lutadores de Sinhozinho depois para incorporar em seu próprio estilo.

Pouco mais se sabe sobre a vida de Jurandir antes ou depois deste desafio. Sua participação o marca como um dos lutadores capazes de Bimba durante um período crucial de rivalidade inter-estilos na história da capoeira brasileira.',
  -- achievements_en
  NULL,  -- No documented achievements beyond the 1949 fight
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1920, decade precision): No birth or death dates found for Jurandir. Based on his participation as an established fighter representing Bimba''s academy in 1949, if he was 25-35 years old, birth would be approximately 1914-1934. Using 1920 as midpoint estimate with decade precision.

DEATH: Unknown. No records found.

NAME: Only "Jurandir" appears in sources. No full name documented.

DISTINCT FROM OTHER JURANDIRS:
- NOT Mestre Jurandir Nascimento (GCAP pioneer, FICA co-founder, born in Rio de Janeiro, started capoeira 1970)
- NOT Mestre Jurandir Santos (Jurandir Souza dos Santos, son of Mestre João Grande)

CROSS-TRAINING: Sources note he "also practiced judo", indicating the cross-training response to challenges from other martial arts that was becoming common among Bimba''s fighters.

1949 CHALLENGE:
- Opponent: Luiz "Cirandinha" Pereira Aguiar (Sinhozinho''s student)
- Result: Lost by KO in Round 1
- Method: Body kick
- Controversy: Jurandir claimed foul, overruled by witnesses and ring doctor

TEACHERS:
- Mestre Bimba (confirmed)

MEDIA APPEARANCES:
- April 2, 1949: Featured in newspaper A Noite coverage of the Capoeira Challenge at Estádio Carioca',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, precisão de década): Nenhuma data de nascimento ou morte encontrada para Jurandir. Com base em sua participação como lutador estabelecido representando a academia de Bimba em 1949, se ele tinha 25-35 anos, o nascimento seria aproximadamente 1914-1934. Usando 1920 como estimativa do ponto médio com precisão de década.

MORTE: Desconhecida. Nenhum registro encontrado.

NOME: Apenas "Jurandir" aparece nas fontes. Nenhum nome completo documentado.

DISTINTO DE OUTROS JURANDIRS:
- NÃO É Mestre Jurandir Nascimento (pioneiro do GCAP, co-fundador da FICA, nascido no Rio de Janeiro, começou capoeira 1970)
- NÃO É Mestre Jurandir Santos (Jurandir Souza dos Santos, filho de Mestre João Grande)

TREINAMENTO CRUZADO: Fontes notam que ele "também praticava judô", indicando a resposta de treinamento cruzado a desafios de outras artes marciais que estava se tornando comum entre os lutadores de Bimba.

DESAFIO DE 1949:
- Oponente: Luiz "Cirandinha" Pereira Aguiar (aluno de Sinhozinho)
- Resultado: Perdeu por nocaute no 1o round
- Método: Chute no corpo
- Controvérsia: Jurandir alegou falta, rejeitado por testemunhas e médico do ringue

PROFESSORES:
- Mestre Bimba (confirmado)

APARIÇÕES NA MÍDIA:
- 2 de abril de 1949: Destaque na cobertura do jornal A Noite sobre o Desafio de Capoeira no Estádio Carioca'
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
