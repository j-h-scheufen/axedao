-- ============================================================
-- GENEALOGY PERSON: Severo do Pelourinho
-- Generated: 2025-12-27
-- ============================================================
-- LAYER ZERO FIGURE: Known only from Traíra's own testimony.
--
-- SOURCES:
-- - velhosmestres.com/en/featured-37 (Traíra profile): States in
--   1947 timeline "Later told that had also learned from Severo
--   do Pelourinho".
-- - nossa-tribo.com/mestre-traira: "His dedication to mastering
--   this art led him to expand his knowledge under the guidance
--   of Severo do Pelourinho".
-- - capoeirawiki.org/wiki/Mestre_Traíra: "would later cite Severo
--   do Pelourinho as another important influence"
--
-- IDENTITY:
-- - Apelido: Severo do Pelourinho
-- - The "do Pelourinho" indicates association with Pelourinho
--   district of Salvador - the historic center and significant
--   capoeira location
-- - No full name, title, or birth/death dates documented
--
-- TIMELINE ESTIMATION:
-- - Traíra (b. ~1925) mentioned learning from Severo
-- - Traíra was training with Waldemar from 1947 onward
-- - Severo was likely an established practitioner by the 1940s
-- - If Severo was 25-50 when teaching Traíra in late 1940s,
--   birth year would be ~1900-1925 (using 1910 as midpoint estimate)
-- - Death unknown - no documentation
--
-- This is an UNVERIFIED profile based on a single indirect source.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Severo do Pelourinho',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-37']::text[],
  'angola'::genealogy.style,
  NULL,
  NULL,
  1910,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Severo do Pelourinho is a little-documented capoeira figure from Salvador, Bahia, known only through a single reference: Mestre Traíra named him as one of his teachers alongside Mestre Waldemar and Mestre Juvêncio.\n\nThe "do Pelourinho" in his apelido indicates he was associated with the Pelourinho district of Salvador—the historic center that became a crucible of capoeira culture. This same neighborhood would later house Mestre Pastinha''s Centro Esportivo de Capoeira Angola (CECA) from 1955 onward.\n\nNo other details survive about Severo: not his full name, his title (if any), his birth or death dates, nor the nature of his teaching. The timing of his influence on Traíra is also unknown—whether before, during, or after Traíra''s primary training with Waldemar beginning in 1947.\n\nHis existence is attested only by Traíra''s own testimony. He represents the many unnamed and undocumented practitioners who transmitted capoeira through the generations before the art was formally studied and recorded.',
  E'Severo do Pelourinho é uma figura pouco documentada da capoeira de Salvador, Bahia, conhecida apenas por uma única referência: Mestre Traíra o nomeou como um de seus professores, ao lado de Mestre Waldemar e Mestre Juvêncio.\n\nO "do Pelourinho" em seu apelido indica que era associado ao bairro do Pelourinho em Salvador—o centro histórico que se tornou um caldeirão da cultura capoeirista. Este mesmo bairro abrigaria mais tarde o Centro Esportivo de Capoeira Angola (CECA) de Mestre Pastinha a partir de 1955.\n\nNenhum outro detalhe sobrevive sobre Severo: nem seu nome completo, seu título (se tinha), suas datas de nascimento ou morte, nem a natureza de seu ensino. O momento de sua influência sobre Traíra também é desconhecido—se antes, durante ou após o treinamento principal de Traíra com Waldemar a partir de 1947.\n\nSua existência é atestada apenas pelo testemunho do próprio Traíra. Ele representa os muitos praticantes não nomeados e não documentados que transmitiram a capoeira através das gerações antes que a arte fosse formalmente estudada e registrada.',
  NULL,
  NULL,
  E'LAYER ZERO FIGURE: Known only from Traíra''s testimony.\n\nBIRTH YEAR ESTIMATION (1910, decade precision):\nNo documentation. If Severo was an established practitioner (age 25-50) when teaching Traíra in late 1940s, birth year would be ~1900-1925. Using 1910 as midpoint estimate for database queries. This is highly uncertain.\n\nTEACHERS:\n- Unknown - no documentation.\n\nSTUDENTS:\n- Mestre Traíra (João Ramos do Nascimento, ~1925-~1975) - mentioned Severo as one of his teachers.\n\nSOURCE QUALITY:\n- Single source: Traíra''s own statement (reported second-hand through velhosmestres.com).\n- No corroborating documentation.\n- No interviews, photographs, or contemporary accounts.\n\nPELOURINHO CONTEXT:\n- Pelourinho was the historic center of Salvador.\n- Location of significant capoeira activity.\n- CECA (Pastinha''s academy) moved there in 1955.\n- Many old mestres were active in this area.',
  E'FIGURA DE CAMADA ZERO: Conhecido apenas pelo testemunho de Traíra.\n\nESTIMATIVA DO ANO DE NASCIMENTO (1910, precisão de década):\nSem documentação. Se Severo era um praticante estabelecido (idade 25-50) quando ensinava Traíra no final dos anos 1940, o ano de nascimento seria ~1900-1925. Usando 1910 como estimativa de ponto médio para consultas de banco de dados. Isso é altamente incerto.\n\nMESTRES:\n- Desconhecido - sem documentação.\n\nALUNOS:\n- Mestre Traíra (João Ramos do Nascimento, ~1925-~1975) - mencionou Severo como um de seus mestres.\n\nQUALIDADE DA FONTE:\n- Fonte única: declaração do próprio Traíra (relatada em segunda mão através do velhosmestres.com).\n- Sem documentação corroborante.\n- Sem entrevistas, fotografias ou relatos contemporâneos.\n\nCONTEXTO DO PELOURINHO:\n- Pelourinho era o centro histórico de Salvador.\n- Local de significativa atividade de capoeira.\n- CECA (academia de Pastinha) mudou-se para lá em 1955.\n- Muitos velhos mestres eram ativos nesta área.'
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
