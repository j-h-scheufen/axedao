-- ============================================================
-- GENEALOGY PERSON: Roque (Curva Grande)
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1900, decade precision):
-- Teaching Gaguinho Preto (b. 1934) from age 4 (~1938) requires being
-- a mature adult (25-50 years old). Estimate ~1900 gives age ~38 in 1938.
-- This is consistent with the contemporaries Menino Gordo (~1900) and
-- Vitor Agaú (~1880) who taught alongside him.
-- ============================================================
-- IDENTITY CLARIFICATION:
-- This is DISTINCT from Mestre Roque Mendes dos Santos (b. 1938, Rio).
-- The Rio-based Roque was born in 1938 and could not have been teaching
-- anyone in that same year. Using apelido_context 'Curva Grande' to
-- distinguish this earlier, Bahian figure.
-- ============================================================
-- RESEARCH LIMITATIONS:
-- Only ONE source mentions this Roque: the velhosmestres.com biography
-- of Gaguinho Preto, which states he "aprendeu com Menino Gordo da Curva
-- Grande, com o Roque e o Victor H.U." No other biographical details,
-- full name, lineage, or death date are documented.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Roque',
  'Curva Grande',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-39', 'https://velhosmestres.com/en/featured-39']::text[],
  'angola'::genealogy.style,
  NULL,
  NULL,
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Roque was an early twentieth-century capoeirista from Salvador, Bahia, who taught in the Curva Grande neighborhood of the city''s Centro Histórico. He is documented as one of three teachers who instructed young Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002) starting when the child was just four years old, around 1938. According to velhosmestres.com, Gaguinho Preto "learned with Menino Gordo da Curva Grande, with Roque and Victor H.U., passing by Pastinha''s CECA and Zeca do Uruguai".\n\nThe Curva Grande neighborhood, part of Salvador''s historic center, had established capoeira activity since at least 1917, when Mestre Noronha documented a roda there. That year, capoeiristas were invited to a roda at Curva Grande that turned out to be a trap set by the Military Police—a violent confrontation ensued. This context illustrates the dangerous environment in which Roque and his contemporaries practiced and transmitted capoeira during the era of persecution.\n\nRoque taught alongside two other mestres in Curva Grande: Menino Gordo da Curva Grande and Vitor Agaú (Victor H.U.). Vitor Agaú was a more prominent figure who would later be present at the founding of CECA in 1941 and was remembered by Mestre Onça Preta as one of his teachers. Together, these three men formed young Gaguinho Preto''s foundational training before he moved on to formal instruction at Pastinha''s Centro Esportivo de Capoeira Angola.\n\nThis Roque is distinct from the better-known Mestre Roque Mendes dos Santos (born 1938), who became one of the four founding lineages of contemporary capoeira in Rio de Janeiro. The Rio-based Roque was born in 1938—the same year that this earlier Roque was teaching in Curva Grande—making them clearly separate individuals.\n\nNothing is known of this Roque''s full name, his teachers, or when he died. Like many early capoeiristas who operated outside the formal academy structure, his legacy survives only through brief mention in the oral testimony of those he taught.',
  E'Roque foi um capoeirista do início do século XX de Salvador, Bahia, que ensinava no bairro da Curva Grande, no Centro Histórico da cidade. Ele é documentado como um dos três professores que instruíram o jovem Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002) começando quando a criança tinha apenas quatro anos de idade, por volta de 1938. Segundo velhosmestres.com, Gaguinho Preto "aprendeu com Menino Gordo da Curva Grande, com o Roque e o Victor H.U., passando pelo CECA de Seu Pastinha e o Zeca do Uruguai".\n\nO bairro da Curva Grande, parte do centro histórico de Salvador, tinha atividade de capoeira estabelecida desde pelo menos 1917, quando Mestre Noronha documentou uma roda lá. Naquele ano, capoeiristas foram convidados para uma roda na Curva Grande que acabou sendo uma armadilha montada pela Polícia Militar—um confronto violento se seguiu. Este contexto ilustra o ambiente perigoso em que Roque e seus contemporâneos praticavam e transmitiam a capoeira durante a era de perseguição.\n\nRoque ensinava junto com outros dois mestres na Curva Grande: Menino Gordo da Curva Grande e Vitor Agaú (Victor H.U.). Vitor Agaú era uma figura mais proeminente que mais tarde estaria presente na fundação do CECA em 1941 e foi lembrado por Mestre Onça Preta como um de seus professores. Juntos, estes três homens formaram o treinamento fundamental do jovem Gaguinho Preto antes que ele passasse para a instrução formal no Centro Esportivo de Capoeira Angola de Pastinha.\n\nEste Roque é distinto do mais conhecido Mestre Roque Mendes dos Santos (nascido em 1938), que se tornou uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro. O Roque do Rio nasceu em 1938—o mesmo ano em que este Roque anterior estava ensinando na Curva Grande—tornando-os claramente indivíduos separados.\n\nNada se sabe sobre o nome completo deste Roque, seus mestres, ou quando morreu. Como muitos capoeiristas antigos que operavam fora da estrutura formal de academia, seu legado sobrevive apenas através de breve menção no testemunho oral daqueles que ele ensinou.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (~1900, decade):\nTeaching Gaguinho Preto (b. 1934) from age 4 (~1938) requires being a mature adult (25-50 years old). Estimate ~1900 gives age ~38 in 1938. This is consistent with contemporaries Menino Gordo (~1900) and Vitor Agaú (~1880).\n\nIDENTITY CLARIFICATION:\nThis is DISTINCT from Mestre Roque Mendes dos Santos (born 1938, migrated to Rio 1956). The Rio-based Roque was an infant in 1938 and could not have taught anyone. Using apelido_context "Curva Grande" to distinguish.\n\nSOURCE LIMITATION:\nOnly ONE source mentions this Roque: velhosmestres.com biography of Gaguinho Preto. No other biographical information exists—full name, lineage, teachers, death date all unknown.\n\nTEACHERS:\n- Unknown\n\nSTUDENTS:\n- Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002) - taught from age 4 (~1938) in Curva Grande neighborhood alongside Menino Gordo and Vitor Agaú\n\nCO-TEACHERS AT CURVA GRANDE:\n- Menino Gordo da Curva Grande (~1900) - co-taught Gaguinho Preto\n- Vitor Agaú (Victor H.U., ~1880-~1960) - co-taught Gaguinho Preto; present at CECA founding 1941\n\nLOCATION:\n- Curva Grande neighborhood, Centro Histórico, Salvador, Bahia\n- The neighborhood had documented capoeira activity since 1917 (Mestre Noronha manuscripts)',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1900, década):\nEnsinar Gaguinho Preto (n. 1934) a partir dos 4 anos (~1938) requer ser adulto maduro (25-50 anos). Estimativa ~1900 dá idade ~38 em 1938. Isto é consistente com os contemporâneos Menino Gordo (~1900) e Vitor Agaú (~1880).\n\nESCLARECIMENTO DE IDENTIDADE:\nEste é DISTINTO de Mestre Roque Mendes dos Santos (nascido em 1938, migrou para o Rio em 1956). O Roque do Rio era um bebê em 1938 e não poderia ter ensinado ninguém. Usando apelido_context "Curva Grande" para distinguir.\n\nLIMITAÇÃO DE FONTE:\nApenas UMA fonte menciona este Roque: biografia de Gaguinho Preto no velhosmestres.com. Nenhuma outra informação biográfica existe—nome completo, linhagem, mestres, data de morte todos desconhecidos.\n\nMESTRES:\n- Desconhecido\n\nALUNOS:\n- Gaguinho Preto (Everaldo Arcanjo de Assis, 1934-2002) - ensinou a partir dos 4 anos (~1938) no bairro Curva Grande junto com Menino Gordo e Vitor Agaú\n\nCO-PROFESSORES NA CURVA GRANDE:\n- Menino Gordo da Curva Grande (~1900) - co-ensinou Gaguinho Preto\n- Vitor Agaú (Victor H.U., ~1880-~1960) - co-ensinou Gaguinho Preto; presente na fundação do CECA 1941\n\nLOCAL:\n- Bairro Curva Grande, Centro Histórico, Salvador, Bahia\n- O bairro tinha atividade de capoeira documentada desde 1917 (manuscritos de Mestre Noronha)'
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
