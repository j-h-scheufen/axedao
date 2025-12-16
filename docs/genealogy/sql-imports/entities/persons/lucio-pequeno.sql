-- ============================================================
-- GENEALOGY PERSON: Lúcio Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1880, decade precision):
-- Active as founding mestre of Gengibirra in 1920s. Assuming
-- he was 30-45 years old when founding an organized capoeira
-- center (typical mestre age for leadership), birth = 1875-1895.
-- Using 1880 as midpoint estimate.
--
-- RELATIONSHIP TO CÂNDIDO PEQUENO:
-- Shares surname with Cândido Pequeno, but NO SOURCE confirms any
-- family relationship. The shared surname may be coincidental.
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
  'Lúcio Pequeno',
  NULL,  -- No disambiguation context needed
  NULL,  -- No formal title documented
  NULL,  -- No known portrait
  ARRAY['https://en.wikipedia.org/wiki/Capoeira_Angola']::text[],  -- Wikipedia article listing the 22 founding mestres
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pre-stylistic era; practiced what would later be called Capoeira Angola. The Gengibirra center had codified combat rules and formal organization predating the Angola/Regional split of the 1930s.',
  E'Era pré-estilística; praticava o que mais tarde seria chamado de Capoeira Angola. O centro Gengibirra tinha regras de combate codificadas e organização formal antes da divisão Angola/Regional da década de 1930.',
  -- Life dates
  1880,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',  -- Assumed based on Gengibirra location
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Lúcio Pequeno appears in history as one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the first organized capoeira center in Bahia. The center was established in the 1920s at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood in Salvador.\n\nThis information comes from the manuscripts of Mestre Noronha (Daniel Coutinho, 1909-1977), one of the most important primary sources documenting early 20th century capoeira in Salvador. In his handwritten notebooks, completed in 1976 and published posthumously in 1993, Noronha listed all 22 founding mestres of Gengibirra. Lúcio Pequeno''s name appears immediately after Cândido Pequeno "Argolinha de Ouro" (Golden Little Ring), the "champion of capoeira in the State of Bahia" who was Noronha''s own teacher from 1917.\n\nLúcio and Cândido share the surname "Pequeno," but no source confirms any family relationship between them. In Salvador''s capoeira world of the early 1900s, surnames were not always hereditary - they could reflect nicknames, physical characteristics, or adopted names. The shared surname may be coincidental.\n\nLúcio Pequeno was part of the founding generation that sought to organize and legitimize capoeira angola at a time when the practice was still criminalized in Brazil. The Gengibirra center adopted green and yellow - the colors of the Brazilian flag - as its official colors, wore them on their clothes, and established clear combat rules.\n\nIn 1941, following the death of Amorzinho, the surviving mestres handed the center to Mestre Pastinha. There is no mention of Lúcio Pequeno in connection with this 1941 transfer, suggesting he may have died or departed the group before then. Beyond his name in Noronha''s list, nothing else is known about Lúcio Pequeno.',
  E'Lúcio Pequeno aparece na história como um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, o primeiro centro de capoeira organizado na Bahia. O centro foi estabelecido na década de 1920 na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade, em Salvador.\n\nEsta informação vem dos manuscritos de Mestre Noronha (Daniel Coutinho, 1909-1977), uma das mais importantes fontes primárias documentando a capoeira do início do século XX em Salvador. Em seus cadernos manuscritos, completados em 1976 e publicados postumamente em 1993, Noronha listou todos os 22 mestres fundadores do Gengibirra. O nome de Lúcio Pequeno aparece imediatamente após Cândido Pequeno "Argolinha de Ouro", o "campeão da capoeira do Estado da Bahia" que foi o próprio mestre de Noronha a partir de 1917.\n\nLúcio e Cândido compartilham o sobrenome "Pequeno," mas nenhuma fonte confirma qualquer relação familiar entre eles. No mundo da capoeira de Salvador do início de 1900, os sobrenomes nem sempre eram hereditários - podiam refletir apelidos, características físicas ou nomes adotados. O sobrenome compartilhado pode ser coincidência.\n\nLúcio Pequeno fez parte da geração fundadora que buscou organizar e legitimar a capoeira angola numa época em que a prática ainda era criminalizada no Brasil. O centro do Gengibirra adotou o verde e amarelo - as cores da bandeira brasileira - como suas cores oficiais, vestiam-nas em suas roupas e estabeleceram regras de combate claras.\n\nEm 1941, após a morte de Amorzinho, os mestres sobreviventes entregaram o centro a Mestre Pastinha. Não há menção de Lúcio Pequeno em conexão com essa transferência de 1941, sugerindo que ele pode ter morrido ou deixado o grupo antes disso. Além de seu nome na lista de Noronha, nada mais se sabe sobre Lúcio Pequeno.',
  -- Achievements (bilingual)
  'Co-founded the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra (Gengibirra) in the 1920s - the first organized Capoeira Angola center in Bahia. One of the 22 founding mestres documented in Mestre Noronha''s manuscripts.',
  'Co-fundou o Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra (Gengibirra) na década de 1920 - o primeiro centro de Capoeira Angola organizado na Bahia. Um dos 22 mestres fundadores documentados nos manuscritos de Mestre Noronha.',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1880, decade precision): Active as founding mestre of Gengibirra in 1920s. Assuming he was 30-45 years old when co-founding an organized capoeira center, birth = 1875-1895. Using 1880 as midpoint.\n\nDEATH: Unknown. No records found. Not mentioned in 1941 transfer to Pastinha, suggesting possible death before then.\n\nFULL NAME: Unknown. Only apelido recorded.\n\nSHARED SURNAME: Shares surname "Pequeno" with Cândido Pequeno (Argolinha de Ouro), also a Gengibirra founder. However, NO SOURCE confirms any family relationship. The shared surname may be coincidental.\n\nSOLE SOURCE: The only documentation of Lúcio Pequeno''s existence is Mestre Noronha''s manuscripts (O ABC da Capoeira Angola, completed 1976, published 1993).\n\nPENDING RELATIONSHIPS:\n- Lúcio Pequeno co_founded Gengibirra (1920s)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1880, precisão de década): Ativo como mestre fundador do Gengibirra na década de 1920. Assumindo que tinha 30-45 anos quando co-fundou um centro de capoeira organizado, nascimento = 1875-1895. Usando 1880 como ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado. Não mencionado na transferência de 1941 para Pastinha, sugerindo possível morte antes disso.\n\nNOME COMPLETO: Desconhecido. Apenas apelido registrado.\n\nSOBRENOME COMPARTILHADO: Compartilha sobrenome "Pequeno" com Cândido Pequeno (Argolinha de Ouro), também fundador do Gengibirra. No entanto, NENHUMA FONTE confirma qualquer relação familiar. O sobrenome compartilhado pode ser coincidência.\n\nFONTE ÚNICA: A única documentação da existência de Lúcio Pequeno são os manuscritos de Mestre Noronha (O ABC da Capoeira Angola, concluído em 1976, publicado em 1993).\n\nRELACIONAMENTOS PENDENTES:\n- Lúcio Pequeno co_founded Gengibirra (década de 1920)'
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
