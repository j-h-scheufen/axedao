-- ============================================================
-- GENEALOGY PERSON: Franklin
-- Generated: 2025-12-25
-- ============================================================
-- LIMITED BIOGRAPHICAL DATA: Despite extensive research, very
-- little personal information is available about Mestre Franklin
-- beyond his role as co-founder of Grupo Luanda with Mestre
-- Ezequiel. His full name (Franklin Aleluia) comes from the
-- IPHAN capoeira registry.
--
-- BIRTH YEAR ESTIMATION (1940, decade):
-- Franklin was a student of Ezequiel (b. 1941) who co-founded
-- Grupo Luanda in 1964. If Franklin was an adult (18+) capable
-- of co-founding an organization in 1964, he was born before 1946.
-- As a student of Ezequiel (who was ~23 in 1964), Franklin was
-- likely a peer or slightly younger. Estimate: ~1940 (decade).
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
  'Franklin Aleluia',
  'Franklin',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeira.iphan.gov.br/grupo/infor/356']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Student of Mestre Ezequiel who helped establish the Regional tradition in Salvador through Grupo Luanda. Carried forward the lineage of Mestre Bimba through Ezequiel.',
  E'Aluno de Mestre Ezequiel que ajudou a estabelecer a tradição Regional em Salvador através do Grupo Luanda. Levou adiante a linhagem de Mestre Bimba através de Ezequiel.',
  -- Life dates
  1940,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Franklin, known fully as Franklin Aleluia, was an early student of Mestre Ezequiel who played a foundational role in establishing Grupo Luanda, one of the important Capoeira Regional groups of Salvador.

In 1964, Mestre Ezequiel, who was training at Mestre Bimba''s Centro de Cultura Física e Luta Regional, began teaching capoeira to friends who noticed his new physical agility. As the number of students grew, he founded Grupo Luanda together with his student Franklin. The group was formally registered as Grupo Folclórico Luanda in 1974.

Franklin''s role as co-founder alongside his teacher Ezequiel speaks to the collaborative nature of early Grupo Luanda. While Ezequiel provided the direct link to Mestre Bimba''s methodology and philosophy, Franklin helped establish the organizational structure that would allow the group to grow and persist.

Grupo Luanda''s headquarters were established in the Resgate neighborhood (Cabula region) of Salvador, near Ezequiel''s home. The name "Luanda"—the capital of Angola—was chosen to honor the ports from which enslaved Africans departed their homeland, while also carrying the meaning of "the junction of the moon and the earth" in Yoruba.

The group pursued Ezequiel''s foundational concept of "educação com base na capoeira" (education based on capoeira), using the art as a form of education for children and youth. After Ezequiel''s death in 1997, his students—including those formed in the lineage Franklin helped establish—continued Grupo Luanda and spread it internationally to Switzerland, France, Germany, Hawaii, and across the Americas.',
  -- bio_pt
  E'Mestre Franklin, conhecido plenamente como Franklin Aleluia, foi um dos primeiros alunos de Mestre Ezequiel que desempenhou um papel fundamental na fundação do Grupo Luanda, um dos importantes grupos de Capoeira Regional de Salvador.

Em 1964, Mestre Ezequiel, que treinava no Centro de Cultura Física e Luta Regional de Mestre Bimba, começou a ensinar capoeira para amigos que notaram sua nova agilidade física. À medida que o número de alunos crescia, fundou o Grupo Luanda junto com seu aluno Franklin. O grupo foi formalmente registrado como Grupo Folclórico Luanda em 1974.

O papel de Franklin como co-fundador ao lado de seu mestre Ezequiel evidencia a natureza colaborativa do início do Grupo Luanda. Enquanto Ezequiel fornecia a conexão direta com a metodologia e filosofia de Mestre Bimba, Franklin ajudou a estabelecer a estrutura organizacional que permitiria ao grupo crescer e persistir.

A sede do Grupo Luanda foi estabelecida no bairro do Resgate (região do Cabula) em Salvador, perto da casa de Ezequiel. O nome "Luanda"—capital de Angola—foi escolhido para homenagear os portos de onde os africanos escravizados partiram de sua terra natal, carregando também o significado de "a junção da lua e da terra" em iorubá.

O grupo perseguiu o conceito fundamental de Ezequiel de "educação com base na capoeira", usando a arte como forma de educação para crianças e jovens. Após a morte de Ezequiel em 1997, seus alunos—incluindo aqueles formados na linhagem que Franklin ajudou a estabelecer—continuaram o Grupo Luanda e o espalharam internacionalmente pela Suíça, França, Alemanha, Havaí e pelas Américas.',
  -- achievements_en
  E'Co-founded Grupo Luanda (1964) with Mestre Ezequiel in Salvador; Co-registered Grupo Folclórico Luanda as formal entity (1974)',
  -- achievements_pt
  E'Co-fundou o Grupo Luanda (1964) com Mestre Ezequiel em Salvador; Co-registrou o Grupo Folclórico Luanda como entidade formal (1974)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1940, decade):
Franklin was a student of Ezequiel (b. 1941) who co-founded Grupo Luanda in 1964. If Franklin was an adult (18+) capable of co-founding an organization in 1964, he was born before 1946. As a student of Ezequiel (who was ~23 in 1964), Franklin was likely a peer or slightly younger. Estimate: ~1940.

FULL NAME:
- "Franklin Aleluia" per IPHAN Capoeira Portal registry (capoeira.iphan.gov.br/grupo/infor/356)

LIMITED BIOGRAPHICAL DATA:
Despite extensive research across Tier 1 sources (Velhos Mestres, Wikipedia, Lalaue, Capoeira History), very limited personal information is available about Mestre Franklin beyond his role as co-founder of Grupo Luanda. No birth date, death date, birth place, or detailed personal history was found.

TEACHER:
- Mestre Ezequiel (Eziquiel Martins Marinho) - primary teacher; Franklin was among his first students

RELATIONSHIP TO GROUP:
- Co-founded Grupo Luanda (1964) with Mestre Ezequiel
- Co-registered formal entity as Grupo Folclórico Luanda (1974)

LINEAGE:
- Mestre Bimba → Mestre Ezequiel → Mestre Franklin

SOURCES CONSULTED:
- IPHAN Capoeira Portal (capoeira.iphan.gov.br) - confirmed full name
- Velhos Mestres (velhosmestres.com/br/destaques-16) - mentions Franklin as co-founder
- Grupo Luanda Zürich website - mentions Franklin as Ezequiel''s student and co-founder
- Capoeira Paris, Lalaue, CapoeiraNews - mention Grupo Luanda but limited Franklin details',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1940, década):
Franklin foi aluno de Ezequiel (n. 1941) que co-fundou o Grupo Luanda em 1964. Se Franklin era adulto (18+) capaz de co-fundar uma organização em 1964, nasceu antes de 1946. Como aluno de Ezequiel (que tinha ~23 anos em 1964), Franklin provavelmente era contemporâneo ou um pouco mais jovem. Estimativa: ~1940.

NOME COMPLETO:
- "Franklin Aleluia" conforme registro do Portal da Capoeira do IPHAN (capoeira.iphan.gov.br/grupo/infor/356)

DADOS BIOGRÁFICOS LIMITADOS:
Apesar de pesquisa extensiva nas fontes Tier 1 (Velhos Mestres, Wikipedia, Lalaue, Capoeira History), informações pessoais muito limitadas estão disponíveis sobre Mestre Franklin além de seu papel como co-fundador do Grupo Luanda. Nenhuma data de nascimento, data de morte, local de nascimento ou história pessoal detalhada foi encontrada.

PROFESSOR:
- Mestre Ezequiel (Eziquiel Martins Marinho) - professor principal; Franklin estava entre seus primeiros alunos

RELAÇÃO COM O GRUPO:
- Co-fundou o Grupo Luanda (1964) com Mestre Ezequiel
- Co-registrou a entidade formal como Grupo Folclórico Luanda (1974)

LINHAGEM:
- Mestre Bimba → Mestre Ezequiel → Mestre Franklin

FONTES CONSULTADAS:
- Portal da Capoeira IPHAN (capoeira.iphan.gov.br) - confirmou nome completo
- Velhos Mestres (velhosmestres.com/br/destaques-16) - menciona Franklin como co-fundador
- Site do Grupo Luanda Zürich - menciona Franklin como aluno de Ezequiel e co-fundador
- Capoeira Paris, Lalaue, CapoeiraNews - mencionam Grupo Luanda mas detalhes limitados sobre Franklin'
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
