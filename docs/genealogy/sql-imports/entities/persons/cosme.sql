-- ============================================================
-- GENEALOGY PERSON: Cosme
-- Generated: 2026-01-10
-- Primary Source: https://capoeirahistory.com/students-of-mestre-roque/
-- ============================================================
-- DEPENDENCIES: roque.sql (primary teacher)
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (~1960s, decade precision):
-- - Trained at Roque's final academy in Vilar do Teles (São João de Meriti)
-- - Roque taught at Vilar do Teles as his final teaching location (after
--   Petrobras Refinery in Caxias and São João de Meriti)
-- - Timeline suggests Vilar do Teles was active from ~1980s-1990s onwards
-- - Cosme lives near the Vilar do Teles academy and was interviewed in
--   documentary for capoeirahistory.com (likely 2010s-2020s)
-- - Holds title of Mestre (typically requires 20-30+ years of practice)
-- - Estimate: Born ~1960s to have trained at Vilar do Teles and achieved
--   mestre status by 2010s
--
-- RESEARCH LIMITATIONS:
-- - Full name unknown; all sources refer only to "M Cosme" or "Cosme"
-- - Specific training timeline not documented
-- - No known group affiliation documented beyond Roque's lineage
-- - No photographs or additional biographical details found in web research
--
-- DOCUMENTARY APPEARANCE:
-- - Featured in "Alunos de M. Roque" (Students of M. Roque) documentary
--   produced by CapoeiraHistory alongside M. Paulo Siqueira and M. Lapinha
-- - Documentary described as "most recent" produced by CapoeiraHistory
--
-- DISTINGUISHING FROM OTHER "COSME" FIGURES:
-- - DISTINCT from Bernardo José de Cosme (batuque mestre, Jaguaripe region)
-- - DISTINCT from Cosme de Farias (Captain/Major, protector of capoeiristas)
-- - DISTINCT from Mestre Cosmo (Cladival da Costa) from Piracicaba, SP
-- - This Cosme is specifically identified as student of Roque in Rio de Janeiro
--
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
  'Cosme',
  'Rio de Janeiro, Roque lineage',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/students-of-mestre-roque/', 'https://capoeirahistory.com/mestre/master-roque-1938/']::text[],
  'angola'::genealogy.style,
  E'Trained in the Bahian Angola tradition through Mestre Roque''s "line of São Bento"—a faster style of Angola that Roque brought from Salvador to Rio de Janeiro. This style was different from the capoeira of the Senzala group that dominated Rio''s Zona Sul and also different from the other Bahian masters who established schools in Bonsucesso.',
  E'Treinado na tradição Angola baiana através da "linha de São Bento" de Mestre Roque—um estilo de Angola mais rápido que Roque trouxe de Salvador para o Rio de Janeiro. Este estilo era diferente da capoeira do grupo Senzala que dominava a Zona Sul do Rio e também diferente dos outros mestres baianos que estabeleceram escolas em Bonsucesso.',
  1965,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Mestre Cosme is a capoeira mestre from the lineage of Mestre Roque in Rio de Janeiro. He trained with Roque at the master''s final academy in Vilar do Teles, a neighborhood in São João de Meriti in the Baixada Fluminense region of Rio de Janeiro. Cosme continues to live near this location, maintaining a connection to the place where he learned capoeira.\n\nAs a student of Mestre Roque, Cosme inherited the Angola tradition of the "line of São Bento" that Roque brought from Bahia to Rio de Janeiro. This style was characterized as faster than other Angola styles, distinguishing it from both the Senzala group''s capoeira that dominated Rio''s Zona Sul and from the schools established by other Bahian masters like Artur Emídio, Paraná, and Mário Buscapé in Bonsucesso.\n\nCosme belongs to a generation of Roque''s students that includes several notable figures: Adilson (Camisa Preta), who took over the Pavão/Pavãozinho academy in the 1970s; Mestra Sandrinha, recognized as possibly the first female mestra in Brazil; Mestre Paulo Siqueira, who became a pioneer of capoeira in Germany; Mestre Poeira; Mestre Derli; and Mestre Lapinha. Through this lineage, Cosme represents the continuation of one of the four founding lineages of contemporary capoeira in Rio de Janeiro.\n\nCosme was featured in the documentary "Alunos de M. Roque" (Students of M. Roque), produced by CapoeiraHistory to document Mestre Roque''s legacy. In this film, he appears alongside Mestre Paulo Siqueira and Mestre Lapinha—three students who trained with Roque at different periods of his teaching career. While Paulo Siqueira trained at the Morro do Pavão academy in the 1970s and Lapinha accompanied Roque at a later stage, Cosme represents the final period of Roque''s teaching at the Vilar do Teles location.\n\nRoque''s teaching career spanned multiple decades and locations across Rio de Janeiro: from Catumbi initially, to twelve years at the Neighbourhood Association of Pavão/Pavãozinho, then Praia do Pinto, Praça Mauá, Jacarepaguá, the Petrobras Refinery in Caxias, São João de Meriti, and finally Vilar do Teles. Cosme''s connection to this final academy places him as one of the later students in Roque''s long teaching lineage.',
  E'Mestre Cosme é um mestre de capoeira da linhagem de Mestre Roque no Rio de Janeiro. Ele treinou com Roque na última academia do mestre em Vilar do Teles, um bairro em São João de Meriti na região da Baixada Fluminense do Rio de Janeiro. Cosme continua morando perto deste local, mantendo uma conexão com o lugar onde aprendeu capoeira.\n\nComo aluno de Mestre Roque, Cosme herdou a tradição Angola da "linha de São Bento" que Roque trouxe da Bahia para o Rio de Janeiro. Este estilo era caracterizado como mais rápido que outros estilos de Angola, distinguindo-se tanto da capoeira do grupo Senzala que dominava a Zona Sul do Rio quanto das escolas estabelecidas por outros mestres baianos como Artur Emídio, Paraná e Mário Buscapé em Bonsucesso.\n\nCosme pertence a uma geração de alunos de Roque que inclui várias figuras notáveis: Adilson (Camisa Preta), que assumiu a academia do Pavão/Pavãozinho nos anos 1970; Mestra Sandrinha, reconhecida como possivelmente a primeira mestra de capoeira no Brasil; Mestre Paulo Siqueira, que se tornou um pioneiro da capoeira na Alemanha; Mestre Poeira; Mestre Derli; e Mestre Lapinha. Através desta linhagem, Cosme representa a continuação de uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro.\n\nCosme foi apresentado no documentário "Alunos de M. Roque" (Alunos de M. Roque), produzido pelo CapoeiraHistory para documentar o legado de Mestre Roque. Neste filme, ele aparece ao lado de Mestre Paulo Siqueira e Mestre Lapinha—três alunos que treinaram com Roque em diferentes períodos de sua carreira de ensino. Enquanto Paulo Siqueira treinou na academia do Morro do Pavão nos anos 1970 e Lapinha acompanhou Roque em uma fase mais avançada, Cosme representa o período final do ensino de Roque na localização de Vilar do Teles.\n\nA carreira de ensino de Roque abrangeu múltiplas décadas e locais pelo Rio de Janeiro: do Catumbi inicialmente, a doze anos na Associação de Moradores do Pavão/Pavãozinho, depois Praia do Pinto, Praça Mauá, Jacarepaguá, a Refinaria da Petrobras em Caxias, São João de Meriti, e finalmente Vilar do Teles. A conexão de Cosme com esta última academia o coloca como um dos alunos mais recentes na longa linhagem de ensino de Roque.',
  E'Student of Mestre Roque (Rio de Janeiro)\nTrained at Roque''s final academy in Vilar do Teles, São João de Meriti\nFeatured in "Alunos de M. Roque" documentary by CapoeiraHistory\nPreserves the "line of São Bento" Angola tradition from Roque''s lineage\nRepresentative of the Baixada Fluminense capoeira community',
  E'Aluno de Mestre Roque (Rio de Janeiro)\nTreinou na última academia de Roque em Vilar do Teles, São João de Meriti\nApresentado no documentário "Alunos de M. Roque" do CapoeiraHistory\nPreserva a tradição Angola da "linha de São Bento" da linhagem de Roque\nRepresentante da comunidade de capoeira da Baixada Fluminense',
  E'BIRTH YEAR ESTIMATION (1965, decade precision):\n- Trained at Roque''s final academy in Vilar do Teles (São João de Meriti)\n- Vilar do Teles was Roque''s final teaching location, likely active from ~1980s-1990s onwards\n- Still active as mestre and was interviewed for capoeirahistory.com documentary\n- Holds title of Mestre (typically requires 20-30+ years of practice)\n- Estimate: Born ~1960s to have trained at Vilar do Teles and achieved mestre status\n\nFULL NAME:\n- Unknown; all sources refer only to "M Cosme" or "Cosme"\n- Cannot determine if additional name elements exist\n\nAPELIDO CONTEXT:\n- Used "Rio de Janeiro, Roque lineage" to distinguish from:\n  - Bernardo José de Cosme (batuque mestre, Jaguaripe/Recôncavo region)\n  - Cosme de Farias (Captain/Major, protector of capoeiristas in Bahia)\n  - Mestre Cosmo (Cladival da Costa, Piracicaba, São Paulo)\n\nTEACHERS:\n- Mestre Roque (primary teacher, Vilar do Teles academy)\n\nFELLOW STUDENTS UNDER ROQUE:\n- Adilson/Camisa Preta (Mestre) - Senior student who took over Pavão academy\n- Sandrinha (Mestra) - Possibly first female mestra in Brazil\n- Paulo Siqueira (Mestre) - Pioneer in Germany\n- Poeira (Mestre)\n- Derli (Mestre)\n- Lapinha (Mestre)\n\nDOCUMENTARY APPEARANCE:\n- "Alunos de M. Roque" (Students of M. Roque)\n- Produced by CapoeiraHistory\n- Featured alongside M. Paulo Siqueira and M. Lapinha\n\nLOCATION:\n- Lives near Vilar do Teles, São João de Meriti, Baixada Fluminense, RJ\n- Vilar do Teles was Roque''s final teaching location\n\nRESEARCH LIMITATIONS:\n- Limited online presence\n- No photographs found\n- Specific training timeline not documented\n- Students not documented',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1965, precisão de década):\n- Treinou na última academia de Roque em Vilar do Teles (São João de Meriti)\n- Vilar do Teles foi o último local de ensino de Roque, provavelmente ativo a partir dos anos 1980-1990\n- Ainda ativo como mestre e foi entrevistado para documentário do capoeirahistory.com\n- Possui título de Mestre (tipicamente requer 20-30+ anos de prática)\n- Estimativa: Nascido nos anos 1960 para ter treinado em Vilar do Teles e alcançado título de mestre\n\nNOME COMPLETO:\n- Desconhecido; todas as fontes referem-se apenas a "M Cosme" ou "Cosme"\n- Não é possível determinar se existem elementos adicionais de nome\n\nCONTEXTO DO APELIDO:\n- Usado "Rio de Janeiro, linhagem Roque" para distinguir de:\n  - Bernardo José de Cosme (mestre de batuque, região de Jaguaripe/Recôncavo)\n  - Cosme de Farias (Capitão/Major, protetor de capoeiristas na Bahia)\n  - Mestre Cosmo (Cladival da Costa, Piracicaba, São Paulo)\n\nMESTRES:\n- Mestre Roque (professor principal, academia de Vilar do Teles)\n\nCOLEGAS DE TREINO SOB ROQUE:\n- Adilson/Camisa Preta (Mestre) - Aluno sênior que assumiu academia do Pavão\n- Sandrinha (Mestra) - Possivelmente primeira mestra de capoeira no Brasil\n- Paulo Siqueira (Mestre) - Pioneiro na Alemanha\n- Poeira (Mestre)\n- Derli (Mestre)\n- Lapinha (Mestre)\n\nAPARIÇÃO EM DOCUMENTÁRIO:\n- "Alunos de M. Roque" (Alunos de M. Roque)\n- Produzido pelo CapoeiraHistory\n- Apresentado ao lado de M. Paulo Siqueira e M. Lapinha\n\nLOCALIZAÇÃO:\n- Mora perto de Vilar do Teles, São João de Meriti, Baixada Fluminense, RJ\n- Vilar do Teles foi o último local de ensino de Roque\n\nLIMITAÇÕES DA PESQUISA:\n- Presença online limitada\n- Nenhuma fotografia encontrada\n- Linha do tempo de treinamento específica não documentada\n- Alunos não documentados'
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
