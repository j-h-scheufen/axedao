-- ============================================================
-- GENEALOGY PERSON: Albertino da Hora
-- Generated: 2025-12-19
-- ============================================================
-- Student of Mestre Pastinha at CECA (Centro Esportivo de
-- Capoeira Angola). Also known by the nickname "Moreno".
--
-- DOCUMENTED APPEARANCES:
-- - 1963 (May 4): O Cruzeiro magazine article - photographed
--   playing capoeira with Mestre Pastinha, João Grande, and
--   others in Pelourinho, Salvador
-- - 1964 (Sept 19-21): Trip to Belo Horizonte with Pastinha's
--   group for International Folklore Congress at Minas Tênis
--   Clube; fundraiser for Universidade Católica de Minas Gerais
--
-- BATERIA PARTICIPATION:
-- Per Mestre Gato Preto's 1999 interview: "Na roda, João
-- Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".
-- Note: This quote lists "Moreno" and "Albertino" separately,
-- but velhosmestres.com 1964 photos caption him as "Moreno
-- (Albertino da Hora)" - they are the same person.
--
-- DID NOT GO TO DAKAR 1966: The 1966 Dakar delegation included
-- Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto
-- Satanás, and Camafeu de Oxossi. Albertino was not among them.
--
-- NICKNAME NOTE: "Moreno" (brown-skinned) was a common nickname.
-- Albertino da Hora is DISTINCT from:
-- - The "Moreno" who was a student of Mestre Cobrinha Verde
--   (already in database with apelido_context='Cobrinha Verde student')
-- - "Gaguinho Moreno" listed separately among Pastinha's students
--
-- BIRTH YEAR ESTIMATION (1930, decade precision):
-- - Photographed as adult performer in 1963 O Cruzeiro article
-- - Traveled with Pastinha's group to Belo Horizonte 1964
-- - Part of bateria at CECA during 1950s-1960s
-- - Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)
-- - If ~30 in 1963, born ~1933; estimate ~1930 with decade precision
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown; "da Hora" may be surname
  'Albertino da Hora',
  NULL, -- Unique enough not to need context
  'mestre'::genealogy.title, -- Consistently called "Mestre Albertino" in sources
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/pastinha-1963-1', 'https://velhosmestres.com/br/pastinha-1964-2']::text[],
  'angola'::genealogy.style,
  E'Trained in the traditional Capoeira Angola style under Mestre Pastinha at CECA. Documented as a bateria player alongside João Pequeno, Valdomiro, and Gato Preto, indicating proficiency with berimbau and other percussion instruments.',
  E'Treinado no estilo tradicional de Capoeira Angola sob Mestre Pastinha no CECA. Documentado como tocador de bateria junto com João Pequeno, Valdomiro e Gato Preto, indicando proficiência com berimbau e outros instrumentos de percussão.',
  1930, -- Estimated: photographed as adult in 1963, bateria player at CECA 1950s-60s
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown, likely Salvador
  NULL, -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Albertino da Hora, also known by the nickname "Moreno", was a student of Mestre Pastinha at the Centro Esportivo de Capoeira Angola (CECA) in the Pelourinho district of Salvador, Bahia. He was part of the generation of capoeiristas who trained at CECA during its golden era in the 1950s-1960s, alongside mestres such as João Grande, João Pequeno, Gildo Alfinete, Valdomiro, and Curió.\n\nIn May 1963, Albertino was featured in a major photo essay on Capoeira Angola published in O Cruzeiro magazine. The article, written by Accoly Netto with photographs by Jean Solari, captured Mestre Pastinha "reliving on the stone streets of Salvador the incredible feats of African capoeiristas", assisted by his musicians and companions including João Oliveira dos Santos (João Grande), Raimundo da Virgem Natividade, Manuel de Carvalho, and Albertino da Hora. Multiple photographs show Albertino playing capoeira with Mestre Pastinha in the streets and at the Igreja de São Bárbara.\n\nIn September 1964, Albertino traveled with Mestre Pastinha''s group to Belo Horizonte for the International Folklore Congress. According to Mestre Gildo Alfinete''s account, the delegation included "Mestre Pastinha, eu (Gildo Alfinete), Roberto Satanás, João Grande, Albertino da Hora e Toinho". The group performed at the Ginásio da Minas Tênis Clube on September 19-21, raising funds for the construction of the Universidade Católica de Minas Gerais. Photographs from this trip show Albertino (captioned as "Moreno") playing capoeira with João Grande while Pastinha, Toinho, Roberto Satanás, and Gildo Alfinete provided the bateria.\n\nMestre Gato Preto, in his 1999 interview, recalled the composition of the bateria at Pastinha''s rodas: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria". This places Albertino among the core musicians who accompanied the rodas at CECA during this era.\n\nNotably, Albertino was not among the capoeiristas who traveled to Dakar, Senegal for the First International Festival of Black Arts in April 1966. That delegation consisted of Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi.\n\nBeyond these documented appearances, little is known about Albertino da Hora''s life. His full name, birth and death dates, and subsequent career remain undocumented in available sources.',
  -- bio_pt
  E'Albertino da Hora, também conhecido pelo apelido "Moreno", foi aluno de Mestre Pastinha no Centro Esportivo de Capoeira Angola (CECA) no bairro do Pelourinho em Salvador, Bahia. Ele fez parte da geração de capoeiristas que treinaram no CECA durante sua era dourada nas décadas de 1950-1960, junto com mestres como João Grande, João Pequeno, Gildo Alfinete, Valdomiro e Curió.\n\nEm maio de 1963, Albertino foi destaque em uma grande reportagem fotográfica sobre Capoeira Angola publicada na revista O Cruzeiro. O artigo, escrito por Accoly Netto com fotografias de Jean Solari, capturou Mestre Pastinha "revivendo nas ruas empedradas de Salvador as proezas incríveis dos capoeiristas africanos", assistido por seus músicos e comparsas incluindo João Oliveira dos Santos (João Grande), Raimundo da Virgem Natividade, Manuel de Carvalho e Albertino da Hora. Múltiplas fotografias mostram Albertino jogando capoeira com Mestre Pastinha nas ruas e na Igreja de São Bárbara.\n\nEm setembro de 1964, Albertino viajou com o grupo de Mestre Pastinha para Belo Horizonte para o Congresso Internacional de Folclore. Segundo o relato de Mestre Gildo Alfinete, a delegação incluía "Mestre Pastinha, eu (Gildo Alfinete), Roberto Satanás, João Grande, Albertino da Hora e Toinho". O grupo se apresentou no Ginásio da Minas Tênis Clube de 19 a 21 de setembro, arrecadando fundos para a construção da Universidade Católica de Minas Gerais. Fotografias desta viagem mostram Albertino (legendado como "Moreno") jogando capoeira com João Grande enquanto Pastinha, Toinho, Roberto Satanás e Gildo Alfinete faziam a bateria.\n\nMestre Gato Preto, em sua entrevista de 1999, recordou a composição da bateria nas rodas de Pastinha: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria". Isto coloca Albertino entre os músicos principais que acompanhavam as rodas no CECA durante essa época.\n\nNotavelmente, Albertino não estava entre os capoeiristas que viajaram para Dakar, Senegal para o Primeiro Festival Internacional de Artes Negras em abril de 1966. Aquela delegação consistia de Pastinha, João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi.\n\nAlém destas aparições documentadas, pouco se sabe sobre a vida de Albertino da Hora. Seu nome completo, datas de nascimento e morte, e carreira subsequente permanecem não documentados nas fontes disponíveis.',
  -- achievements_en
  E'Trained under Mestre Pastinha at CECA during its golden era (1950s-1960s)\nFeatured in O Cruzeiro magazine''s 1963 photo essay on Capoeira Angola\nParticipated in the 1964 Belo Horizonte trip representing Pastinha''s group\nCore bateria player at Pastinha''s rodas alongside João Pequeno, Valdomiro, and Gato Preto',
  -- achievements_pt
  E'Treinou sob Mestre Pastinha no CECA durante sua era dourada (décadas de 1950-1960)\nDestaque na reportagem fotográfica da revista O Cruzeiro de 1963 sobre Capoeira Angola\nParticipou da viagem a Belo Horizonte em 1964 representando o grupo de Pastinha\nTocador principal de bateria nas rodas de Pastinha junto com João Pequeno, Valdomiro e Gato Preto',
  -- notes_en
  E'NICKNAME: Also known as "Moreno". The velhosmestres.com 1964 photo captions him as "Moreno (Albertino da Hora)". This is DISTINCT from the "Moreno" who was a student of Cobrinha Verde (separate entry in database).\n\nTEACHER: Mestre Pastinha - trained at CECA in Pelourinho\n\nCONTEMPORARIES AT CECA:\n- João Grande (João Oliveira dos Santos)\n- João Pequeno (João Pereira dos Santos)\n- Gildo Alfinete\n- Roberto Satanás (Roberto Pereira)\n- Valdomiro (Valdomiro Malvadeza)\n- Gato Preto (José Gabriel Góes)\n- Curió (Jaime Martins dos Santos)\n- Raimundo Natividade\n- Manuel de Carvalho\n- Toinho\n\nBATERIA COMPANIONS:\n- João Pequeno, Valdomiro, Gato Preto (per Gato Preto 1999 interview)\n\nMEDIA APPEARANCES:\n- 1963 (May 4): O Cruzeiro magazine - photos by Jean Solari, article by Accoly Netto\n- 1964 (Sept): Photos at Belo Horizonte by Juares Fioravante Patines\n\nNOT IN DAKAR 1966: Did not travel to Senegal with Pastinha''s delegation.\n\nBIRTH YEAR ESTIMATION (1930, decade):\n- Photographed as adult performer in 1963 O Cruzeiro article\n- Traveled with Pastinha''s group to Belo Horizonte 1964\n- Part of bateria at CECA during 1950s-1960s\n- Contemporary of Gato Preto (b. 1930), João Grande (b. 1933), Curió (b. 1937)\n- Estimate: ~1930 ± 5 years\n\nDEATH YEAR: Unknown. Full name unknown; "Da Hora" appears to be his surname.',
  -- notes_pt
  E'APELIDO: Também conhecido como "Moreno". As legendas das fotos de velhosmestres.com de 1964 o identificam como "Moreno (Albertino da Hora)". Este é DISTINTO do "Moreno" que foi aluno de Cobrinha Verde (entrada separada no banco de dados).\n\nMESTRE: Mestre Pastinha - treinou no CECA no Pelourinho\n\nCONTEMPORÂNEOS NO CECA:\n- João Grande (João Oliveira dos Santos)\n- João Pequeno (João Pereira dos Santos)\n- Gildo Alfinete\n- Roberto Satanás (Roberto Pereira)\n- Valdomiro (Valdomiro Malvadeza)\n- Gato Preto (José Gabriel Góes)\n- Curió (Jaime Martins dos Santos)\n- Raimundo Natividade\n- Manuel de Carvalho\n- Toinho\n\nCOMPANHEIROS DE BATERIA:\n- João Pequeno, Valdomiro, Gato Preto (conforme entrevista de Gato Preto 1999)\n\nAPARIÇÕES NA MÍDIA:\n- 1963 (4 de maio): revista O Cruzeiro - fotos de Jean Solari, artigo de Accoly Netto\n- 1964 (setembro): Fotos em Belo Horizonte por Juares Fioravante Patines\n\nNÃO FOI A DAKAR 1966: Não viajou para o Senegal com a delegação de Pastinha.\n\nESTIMATIVA ANO DE NASCIMENTO (1930, década):\n- Fotografado como performer adulto no artigo O Cruzeiro de 1963\n- Viajou com o grupo de Pastinha para Belo Horizonte em 1964\n- Parte da bateria no CECA durante décadas de 1950-1960\n- Contemporâneo de Gato Preto (n. 1930), João Grande (n. 1933), Curió (n. 1937)\n- Estimativa: ~1930 ± 5 anos\n\nANO DE MORTE: Desconhecido. Nome completo desconhecido; "Da Hora" parece ser seu sobrenome.'
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
