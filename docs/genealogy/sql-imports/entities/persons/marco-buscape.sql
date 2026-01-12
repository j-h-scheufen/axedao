-- ============================================================
-- GENEALOGY PERSON: Marco Buscapé
-- Generated: 2026-01-09
-- ============================================================
-- LIMITED DOCUMENTATION: Marco Buscapé is only documented in a single
-- source (capoeuropa.org) as "filho e aluno de Zé Bedeu" (son and student
-- of Zé Bedeu). No independent biographical sources have been found.
--
-- BIRTH YEAR ESTIMATION:
-- No direct information available. Based on:
-- - Cousin Mestre Roque was born in 1938
-- - Father Zé Bedeu estimated birth ~1910 (decade precision)
-- - If Marco was born when Zé Bedeu was 25-40 years old, birth range
--   would be approximately 1935-1950
-- - Using midpoint estimate of ~1940 with decade precision
--
-- IMPORTANT DISTINCTION:
-- Marco Buscapé (son of Zé Bedeu, cousin of Mestre Roque, from Salvador)
-- is a DIFFERENT person from:
-- Mário Buscapé (1934-2021, son of José Bidel, from São Francisco do Conde,
--   founder of Grupo Bonfim in Rio de Janeiro)
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
  'Marco Buscapé',
  NULL,
  NULL,
  ARRAY['https://capoeuropa.org/historia-da-escola/']::text[],
  NULL,
  NULL,
  NULL,
  1940,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Marco Buscapé was a capoeirista from Salvador, Bahia, active in the mid-20th century. He was the son and student of Zé Bedeu, who passed on the art of capoeira to him.\n\nMarco Buscapé was the cousin of Mestre Roque (Roque Mendes dos Santos, born 1938 in Cachoeira), who would become one of the four founding lineages of contemporary capoeira in Rio de Janeiro. Through his father Zé Bedeu—who was the brother of Chico Preto (Liberato Francisco Xavier)—Marco was part of a family of capoeiristas that included his uncle and cousin.\n\nThe family was rooted in the Nazaré neighborhood of Salvador, where Chico Preto raised his family. Both Zé Bedeu and Chico Preto were capoeiristas during a pivotal era—the period surrounding the legalization of capoeira in 1937, when the art transitioned from illegal street practice to recognized cultural expression.\n\n**Important distinction:** Marco Buscapé (son of Zé Bedeu) is a distinct person from Mário Buscapé (1934-2021), the famous mestre from São Francisco do Conde who founded the Capoeiras do Bonfim group in Rio de Janeiro. Mário Buscapé''s father was José Bidel dos Santos (Mestre Bidel), not Zé Bedeu. These represent two separate family lineages in capoeira history.',
  E'Marco Buscapé foi um capoeirista de Salvador, Bahia, ativo em meados do século XX. Era filho e aluno de Zé Bedeu, que lhe transmitiu a arte da capoeira.\n\nMarco Buscapé era primo de Mestre Roque (Roque Mendes dos Santos, nascido em 1938 em Cachoeira), que se tornaria uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro. Através de seu pai Zé Bedeu—que era irmão de Chico Preto (Liberato Francisco Xavier)—Marco fazia parte de uma família de capoeiristas que incluía seu tio e primo.\n\nA família tinha raízes no bairro de Nazaré em Salvador, onde Chico Preto criou sua família. Tanto Zé Bedeu quanto Chico Preto eram capoeiristas durante uma era crucial—o período em torno da legalização da capoeira em 1937, quando a arte passou de prática de rua ilegal para expressão cultural reconhecida.\n\n**Distinção importante:** Marco Buscapé (filho de Zé Bedeu) é uma pessoa distinta de Mário Buscapé (1934-2021), o famoso mestre de São Francisco do Conde que fundou o grupo Capoeiras do Bonfim no Rio de Janeiro. O pai de Mário Buscapé era José Bidel dos Santos (Mestre Bidel), não Zé Bedeu. Estas representam duas linhagens familiares separadas na história da capoeira.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1940, decade precision):\nNo direct date information. Estimate based on:\n- Cousin Mestre Roque born 1938\n- Father Zé Bedeu estimated born ~1910\n- If Marco born when father was 25-40, range would be ~1935-1950\n- Midpoint estimate: ~1940\n\nLIMITED DOCUMENTATION:\nOnly documented in single source: capoeuropa.org (Escola de Capoeira Angola Nzinga), in biography of cousin Mestre Roque. Source states "Zé Bedeu (pai e mestre de Marco Buscapé)" - Zé Bedeu was his father and teacher.\n\nNAME DISTINCTION:\n- Marco Buscapé (son of Zé Bedeu) - Salvador, Nazaré\n- Mário Buscapé (1934-2021, son of José Bidel) - São Francisco do Conde, founder of Grupo Bonfim\nThese are DIFFERENT people from different families.\n\nFAMILY RELATIONSHIPS:\n- Father/Teacher: Zé Bedeu\n- Uncle: Chico Preto (Liberato Francisco Xavier)\n- Cousin: Mestre Roque (Roque Mendes dos Santos)',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1940, precisão de década):\nSem informação direta de data. Estimativa baseada em:\n- Primo Mestre Roque nascido em 1938\n- Pai Zé Bedeu estimado nascido ~1910\n- Se Marco nasceu quando o pai tinha 25-40 anos, intervalo seria ~1935-1950\n- Estimativa do ponto médio: ~1940\n\nDOCUMENTAÇÃO LIMITADA:\nDocumentado apenas em fonte única: capoeuropa.org (Escola de Capoeira Angola Nzinga), na biografia do primo Mestre Roque. A fonte afirma "Zé Bedeu (pai e mestre de Marco Buscapé)" - Zé Bedeu era seu pai e professor.\n\nDISTINÇÃO DE NOMES:\n- Marco Buscapé (filho de Zé Bedeu) - Salvador, Nazaré\n- Mário Buscapé (1934-2021, filho de José Bidel) - São Francisco do Conde, fundador do Grupo Bonfim\nSão pessoas DIFERENTES de famílias diferentes.\n\nRELAÇÕES FAMILIARES:\n- Pai/Professor: Zé Bedeu\n- Tio: Chico Preto (Liberato Francisco Xavier)\n- Primo: Mestre Roque (Roque Mendes dos Santos)'
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
