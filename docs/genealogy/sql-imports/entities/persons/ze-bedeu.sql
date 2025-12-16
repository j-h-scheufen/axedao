-- ============================================================
-- GENEALOGY PERSON: Zé Bedeu
-- Generated: 2025-12-15
-- Primary Source: https://capoeuropa.org/historia-da-escola/
-- ============================================================
-- DEPENDENCIES: None (foundational figure alongside brother Chico Preto)
-- ============================================================
--
-- LIMITED DOCUMENTATION:
-- Zé Bedeu is only documented through the biography of his nephew
-- Mestre Roque at capoeuropa.org (Escola de Capoeira Angola Nzinga).
-- No independent biographical sources have been found.
--
-- IDENTITY:
-- - Apelido: Zé Bedeu
-- - Full name: Unknown
-- - Status: Capoeirista
-- - Location: Salvador, Bahia (Nazaré neighborhood)
--
-- FAMILY:
-- - Brother of Liberato Francisco Xavier (Chico Preto)
-- - Father and teacher of Marco Buscapé
-- - Uncle of Mestre Roque (Roque Mendes dos Santos, b. 1938)
--
-- BIRTH YEAR ESTIMATION:
-- - Nephew Roque born 1938 (exact)
-- - Zé Bedeu is the uncle of Roque (brother of Chico Preto)
-- - Chico Preto estimated birth ~1910 (decade precision)
-- - If Zé Bedeu was similar age to his brother (2-10 years difference),
--   he would be born ~1900-1920
-- - Using 1910 with decade precision (same as brother)
--
-- IMPORTANT DISTINCTION:
-- Marco Buscapé (son of Zé Bedeu) is a DIFFERENT person from
-- Mário Buscapé (son of José Bidel dos Santos), the famous mestre
-- from São Francisco do Conde who founded Capoeiras do Bonfim in Rio.
-- These are two separate lineages.
--
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
  'Zé Bedeu',
  NULL,
  NULL,
  ARRAY[]::text[],
  NULL,
  NULL,
  NULL,
  1910,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Zé Bedeu was a capoeirista from Salvador, Bahia, active in the early-to-mid 20th century. He was the brother of Liberato Francisco Xavier (known as Chico Preto), a capoeirista who operated a fish stand at the famous Mercado Modelo in Salvador.\n\nZé Bedeu lived in or near the Nazaré neighborhood of Salvador, where his brother Chico Preto raised his family. Both brothers were capoeiristas during a pivotal era—the period surrounding the legalization of capoeira in 1937, when the art transitioned from illegal street practice to recognized cultural expression.\n\nZé Bedeu was the father and primary teacher of Marco Buscapé, passing on the art of capoeira to his son. Through this lineage, Zé Bedeu helped establish a family tradition of capoeira practice that connected to the broader network of Bahian practitioners.\n\nHis nephew was Mestre Roque (Roque Mendes dos Santos, born 1938 in Cachoeira), who would become one of four founding lineages of contemporary capoeira in Rio de Janeiro. Mestre Roque, raised in the Nazaré neighborhood of Salvador, learned capoeira through his father Chico Preto''s connections but also benefited from the broader family environment of capoeira practice that included his uncle Zé Bedeu.\n\nIt is important to note that Marco Buscapé (son of Zé Bedeu) is a distinct person from Mário Buscapé (1934-2021), the famous mestre from São Francisco do Conde who founded the Capoeiras do Bonfim group in Rio de Janeiro. Mário Buscapé''s father was José Bidel dos Santos (Mestre Bidel), not Zé Bedeu. These represent two separate family lineages in capoeira history.',
  E'Zé Bedeu foi um capoeirista de Salvador, Bahia, ativo no início e meados do século XX. Era irmão de Liberato Francisco Xavier (conhecido como Chico Preto), um capoeirista que tinha uma banca de peixe no famoso Mercado Modelo em Salvador.\n\nZé Bedeu morava no ou próximo ao bairro de Nazaré em Salvador, onde seu irmão Chico Preto criou sua família. Ambos os irmãos eram capoeiristas durante uma era crucial—o período em torno da legalização da capoeira em 1937, quando a arte passou de prática de rua ilegal para expressão cultural reconhecida.\n\nZé Bedeu foi pai e principal mestre de Marco Buscapé, transmitindo a arte da capoeira para seu filho. Através dessa linhagem, Zé Bedeu ajudou a estabelecer uma tradição familiar de prática da capoeira que se conectava à rede mais ampla de praticantes baianos.\n\nSeu sobrinho foi Mestre Roque (Roque Mendes dos Santos, nascido em 1938 em Cachoeira), que se tornaria uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro. Mestre Roque, criado no bairro de Nazaré em Salvador, aprendeu capoeira através das conexões de seu pai Chico Preto, mas também se beneficiou do ambiente familiar mais amplo de prática da capoeira que incluía seu tio Zé Bedeu.\n\nÉ importante notar que Marco Buscapé (filho de Zé Bedeu) é uma pessoa distinta de Mário Buscapé (1934-2021), o famoso mestre de São Francisco do Conde que fundou o grupo Capoeiras do Bonfim no Rio de Janeiro. O pai de Mário Buscapé era José Bidel dos Santos (Mestre Bidel), não Zé Bedeu. Estas representam duas linhagens familiares separadas na história da capoeira.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION:\n- Brother Chico Preto estimated birth ~1910 (decade precision)\n- Assuming similar age (brothers), using 1910 with decade precision\n- Nephew Roque born 1938, so Zé Bedeu was likely adult by then\n\nNO TITLE:\n- Described as "pai e mestre de Marco Buscapé" but the word "mestre" here\n  likely means "teacher" in the familial sense, not a formal capoeira title\n- No formal capoeira title documented\n- Title left NULL\n\nSTYLE:\n- No specific style documented\n- His nephew Roque practiced Angola (line of São Bento)\n- Style left NULL due to lack of direct evidence\n\nFAMILY:\n- Brother of Chico Preto (Liberato Francisco Xavier)\n- Father and teacher of Marco Buscapé\n- Uncle of Mestre Roque (b. 1938)\n\nIMPORTANT DISTINCTION:\n- Marco Buscapé (son of Zé Bedeu) ≠ Mário Buscapé (son of José Bidel dos Santos)\n- These are two separate lineages from different families\n- Mário Buscapé was from São Francisco do Conde; Zé Bedeu was from Salvador/Nazaré\n\nLIMITED SOURCES:\n- Only documented through capoeuropa.org biography of Mestre Roque\n- No independent biographical sources found\n- Confidence level: likely (single reliable source)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO:\n- Irmão Chico Preto com nascimento estimado ~1910 (precisão de década)\n- Assumindo idade similar (irmãos), usando 1910 com precisão de década\n- Sobrinho Roque nascido em 1938, então Zé Bedeu provavelmente era adulto\n\nSEM TÍTULO:\n- Descrito como "pai e mestre de Marco Buscapé" mas a palavra "mestre" aqui\n  provavelmente significa "professor" no sentido familiar, não um título formal de capoeira\n- Nenhum título formal de capoeira documentado\n- Título deixado NULL\n\nESTILO:\n- Nenhum estilo específico documentado\n- Seu sobrinho Roque praticava Angola (linha de São Bento)\n- Estilo deixado NULL por falta de evidência direta\n\nFAMÍLIA:\n- Irmão de Chico Preto (Liberato Francisco Xavier)\n- Pai e mestre de Marco Buscapé\n- Tio de Mestre Roque (n. 1938)\n\nDISTINÇÃO IMPORTANTE:\n- Marco Buscapé (filho de Zé Bedeu) ≠ Mário Buscapé (filho de José Bidel dos Santos)\n- Estas são duas linhagens separadas de famílias diferentes\n- Mário Buscapé era de São Francisco do Conde; Zé Bedeu era de Salvador/Nazaré\n\nFONTES LIMITADAS:\n- Documentado apenas através da biografia de Mestre Roque em capoeuropa.org\n- Nenhuma fonte biográfica independente encontrada\n- Nível de confiança: provável (fonte única confiável)'
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
