-- ============================================================
-- GENEALOGY PERSON: Eulâmpio
-- Generated: 2026-01-02
-- ============================================================
-- Historical capoeira mestre from Salvador, Bahia. Close associate
-- of Mestre Cobrinha Verde (called "brother"). One of the founding
-- mestres of Centro Esportivo de Capoeira Angola (CECA) in 1941.
-- Active at the Liberdade/Gengibirra roda pre-1941. Listed as
-- student of Cobrinha Verde alongside João Grande, João Pequeno,
-- Moreno, and Gigante.
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1905 (decade precision)
-- Active as mestre at Gengibirra roda pre-1941, suggesting he was
-- an established capoeirista by late 1930s (age 30-45). Close
-- associate of Cobrinha Verde (b.1912), suggesting similar or
-- slightly older generation. If active alongside mestres at
-- Gengibirra founding, likely born 1900-1915. Using 1905 as
-- midpoint estimate with decade precision.
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
  'Eulâmpio',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://capoeira.online/history/mestres/cobrinha-verde/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola practitioner. Active at the Liberdade/Gengibirra roda before formal academy structures existed. Part of the generation that established organized capoeira angola in Salvador.',
  E'Praticante de Capoeira de Angola tradicional. Ativo na roda da Liberdade/Gengibirra antes das estruturas formais de academia existirem. Parte da geração que estabeleceu a capoeira angola organizada em Salvador.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil (presumed)',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Eulâmpio (also spelled Olampio in some sources) was a capoeirista active in Salvador, Bahia, during the formative years of organized capoeira angola. He was part of the generation that gathered at the famous Liberdade/Gengibirra roda on Sundays, where the best capoeiristas of Bahia convened to practice and preserve traditional capoeira de angola.

His closest documented relationship was with Mestre Cobrinha Verde. In his autobiography "Capoeira e Mandingas," Cobrinha Verde recalls a visit to the São Tomé de Paripe naval base with Mestre Pastinha, stating: "Eu e Eulâmpio - aquele que eu chamava de irmão" (Eulampio - who I called my brother). This designation as "brother" indicates an extraordinarily close bond, suggesting they may have trained together, performed together regularly, or shared a deep personal friendship forged through capoeira.

Eulâmpio is listed among the mestres who gathered at the informal "academy" in the Gengibirra neighborhood of Liberdade, alongside Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, and Butique. The civil guard Amorzinho presided over this gathering. In February 1941, when Mestre Pastinha was invited to lead this group, Eulâmpio was among those present—making him one of the founding mestres of what would become the Centro Esportivo de Capoeira Angola (CECA).

Notably, while Eulâmpio participated in the Liberdade roda and the CECA founding, he is not listed among the 22 founding mestres of the earlier Centro Nacional de Capoeira de Origem Angola (Gengibirra) according to Mestre Noronha''s manuscripts. This suggests he was a regular participant and respected mestre, but not among the original organizational founders of the 1920s center.

Portuguese Wikipedia and Capoeira Online sources list Eulâmpio as a student of Mestre Cobrinha Verde, alongside João Grande, João Pequeno, Moreno, and Gigante. This placement among such distinguished company underscores his significance in the Angola lineage, though his individual biography remains largely undocumented.',
  -- bio_pt
  E'Eulâmpio (também grafado Olampio em algumas fontes) foi um capoeirista ativo em Salvador, Bahia, durante os anos formativos da capoeira angola organizada. Ele fazia parte da geração que se reunia na famosa roda da Liberdade/Gengibirra aos domingos, onde os melhores capoeiristas da Bahia se reuniam para praticar e preservar a capoeira de angola tradicional.

Sua relação documentada mais próxima foi com Mestre Cobrinha Verde. Em sua autobiografia "Capoeira e Mandingas," Cobrinha Verde recorda uma visita à base naval de São Tomé de Paripe com Mestre Pastinha, afirmando: "Eu e Eulâmpio - aquele que eu chamava de irmão." Esta designação como "irmão" indica um vínculo extraordinariamente próximo, sugerindo que podem ter treinado juntos, se apresentado regularmente juntos, ou compartilhado uma amizade pessoal profunda forjada através da capoeira.

Eulâmpio é listado entre os mestres que se reuniam na "academia" informal no bairro do Gengibirra, Liberdade, junto com Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães e Butique. O guarda civil Amorzinho presidia esta reunião. Em fevereiro de 1941, quando Mestre Pastinha foi convidado a liderar este grupo, Eulâmpio estava entre os presentes—tornando-o um dos mestres fundadores do que se tornaria o Centro Esportivo de Capoeira Angola (CECA).

Notavelmente, embora Eulâmpio participasse da roda da Liberdade e da fundação do CECA, ele não está listado entre os 22 mestres fundadores do anterior Centro Nacional de Capoeira de Origem Angola (Gengibirra) segundo os manuscritos de Mestre Noronha. Isso sugere que era um participante regular e mestre respeitado, mas não entre os fundadores organizacionais originais do centro dos anos 1920.

A Wikipédia em português e fontes do Capoeira Online listam Eulâmpio como aluno de Mestre Cobrinha Verde, junto com João Grande, João Pequeno, Moreno e Gigante. Esta colocação em tão distinta companhia sublinha sua importância na linhagem Angola, embora sua biografia individual permaneça em grande parte não documentada.',
  -- achievements_en
  E'- One of the founding mestres of Centro Esportivo de Capoeira Angola (CECA) on February 23, 1941
- Active participant at the historic Liberdade/Gengibirra roda
- Close associate of Mestre Cobrinha Verde (called "brother")
- Student of Mestre Cobrinha Verde alongside João Grande, João Pequeno, Moreno, and Gigante',
  -- achievements_pt
  E'- Um dos mestres fundadores do Centro Esportivo de Capoeira Angola (CECA) em 23 de fevereiro de 1941
- Participante ativo na histórica roda da Liberdade/Gengibirra
- Associado próximo de Mestre Cobrinha Verde (chamado de "irmão")
- Aluno de Mestre Cobrinha Verde junto com João Grande, João Pequeno, Moreno e Gigante',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1905, decade precision):
Active as mestre at Gengibirra roda pre-1941, suggesting established capoeirista by late 1930s (age 30-45). Close associate of Cobrinha Verde (b.1912), suggesting similar or slightly older generation. Using 1905 as midpoint estimate.

NAME VARIATION:
- "Eulâmpio" - Used in A Tarde 1969 article, velhosmestres.com, Cobrinha Verde''s autobiography
- "Eulampio" - Used in capoeira.online, Portuguese Wikipedia (without accent)
- "Olampio" - Used in some CECA founding lists (likely transcription variant)
All refer to same person.

TEACHERS:
- Mestre Cobrinha Verde (Rafael Alves França) - Listed as student in Portuguese Wikipedia and capoeira.online

FELLOW STUDENTS UNDER COBRINHA VERDE:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Moreno
- Gigante (Bigodinho)

GENGIBIRRA/LIBERDADE RODA CONTEMPORARIES (pre-1941):
Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, Butique, Amorzinho (president)

CECA FOUNDING (February 23, 1941):
Present at founding alongside Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Zeir, Vitor H.D., Alemão filho de Maré, Domingo de Mlhães, Beraldo Izaque dos Santos, Pinião José Chibata, Ricardo B. dos Santos.

MEDIA APPEARANCES:
- Mentioned in Cobrinha Verde''s autobiography "Capoeira e Mandingas" by Marcelino dos Santos
- Listed in A Tarde newspaper article (February 24, 1969) among Liberdade mestres

NOT AMONG 22 GENGIBIRRA FOUNDERS:
According to Mestre Noronha''s manuscripts, Eulâmpio is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola (1920s). This suggests he was a regular participant but not an organizational founder of the original center.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década):
Ativo como mestre na roda do Gengibirra pré-1941, sugerindo capoeirista estabelecido no final dos anos 1930 (idade 30-45). Associado próximo de Cobrinha Verde (n.1912), sugerindo geração similar ou um pouco mais velha. Usando 1905 como estimativa de ponto médio.

VARIAÇÃO DE NOME:
- "Eulâmpio" - Usado no artigo A Tarde 1969, velhosmestres.com, autobiografia de Cobrinha Verde
- "Eulampio" - Usado no capoeira.online, Wikipédia em português (sem acento)
- "Olampio" - Usado em algumas listas de fundação do CECA (provável variante de transcrição)
Todos referem-se à mesma pessoa.

MESTRES:
- Mestre Cobrinha Verde (Rafael Alves França) - Listado como aluno na Wikipédia em português e capoeira.online

COLEGAS DE TREINO SOB COBRINHA VERDE:
- João Grande (João Oliveira dos Santos)
- João Pequeno (João Pereira dos Santos)
- Moreno
- Gigante (Bigodinho)

CONTEMPORÂNEOS DA RODA GENGIBIRRA/LIBERDADE (pré-1941):
Antônio, Maré, Daniel (Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Domingos Magalhães, Butique, Amorzinho (presidente)

FUNDAÇÃO DO CECA (23 de fevereiro de 1941):
Presente na fundação junto com Amorzinho, Aberrê, Antonio Maré, Daniel Noronha, Onça Preta, Livino Diogo, Zeir, Vitor H.D., Alemão filho de Maré, Domingo de Mlhães, Beraldo Izaque dos Santos, Pinião José Chibata, Ricardo B. dos Santos.

APARIÇÕES NA MÍDIA:
- Mencionado na autobiografia de Cobrinha Verde "Capoeira e Mandingas" por Marcelino dos Santos
- Listado no artigo do jornal A Tarde (24 de fevereiro de 1969) entre os mestres da Liberdade

NÃO ENTRE OS 22 FUNDADORES DO GENGIBIRRA:
Segundo os manuscritos de Mestre Noronha, Eulâmpio NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola (anos 1920). Isso sugere que era um participante regular mas não um fundador organizacional do centro original.'
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
