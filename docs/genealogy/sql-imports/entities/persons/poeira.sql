-- ============================================================
-- GENEALOGY PERSON: Poeira
-- Generated: 2026-01-09
-- Primary Sources:
--   https://www.capoeirahub.net/mestres/693b4f40abbd160015a637aa-mestre-poeira
--   https://www.capoeira-acdp-australia.com/about/
--   https://capoeirahistory.com/students-of-mestre-roque/
--   https://capoeira.ph/ (Cebu Torpedo Capoeira)
--   https://capoeiraau.org/ (Torpedo Capoeira Australia)
-- ============================================================
-- DEPENDENCIES: roque.sql (teacher)
-- ============================================================
--
-- IDENTITY:
-- - Full Name: Jorge Francisco Ferreira (per CapoeiraHub)
-- - Apelido: Poeira
-- - Title: Mestre
-- - Location: Padre Miguel, Rio de Janeiro
--
-- TRAINING:
-- - Primary teacher: Mestre Roque
-- - Training began: 1978 (per CapoeiraHub)
-- - Part of Roque's Rio de Janeiro lineage (post-Pavãozinho era)
--
-- STYLE:
-- - Classified as "Contemporânea" by CapoeiraHub
-- - From Roque's "Linha de São Bento" Angola tradition
-- - The contemporânea classification likely reflects blend of styles
--
-- ORGANIZATIONS:
-- - Founded "Grupo Pantera" (also "Grupo de Capoeira Pantera")
-- - Named as tribute to Black Panther Party during Brazilian dictatorship
-- - Gave nickname "Pantera" to his student who later founded ACDP (1973)
-- - Operates Centro Cultural "Itineranti" in Padre Miguel, RJ
--
-- NOTABLE STUDENTS:
-- - Mestre Pantera - founded ACDP (1973), teaches in Madrid since 1991
-- - Mestre Cabeça - leads Grupo Capoeira Brasil (Boston/Albany/NY, Mozambique, France)
-- - Mestre Célio Gomes - began ~1980, founded Grupo Aluandê (2007)
-- - Mestre Camaleão - graduated mestre 2025 (first overseas student to become mestre)
--
-- LINEAGE SIGNIFICANCE:
-- Extended lineage: Tio Alípio → Besouro → Cobrinha Verde → Roque → Poeira
-- Students' reach: Poeira → Cabeça → Torpedo → Lobo (Philippines/Australia)
-- Through this lineage, Roque's tradition reached Asia and Europe
--
-- CURRENT STATUS (as of 2025):
-- - Still active; graduated Mestre Camaleão in 2025 alongside Mestre Pantera
-- - Centro Cultural "Itineranti" in Padre Miguel still operates
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
  'Jorge Francisco Ferreira',
  'Poeira',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeirahub.net/mestres/693b4f40abbd160015a637aa-mestre-poeira', 'https://www.capoeira-acdp-australia.com/about/', 'https://capoeirahistory.com/students-of-mestre-roque/']::text[],
  'contemporanea'::genealogy.style,
  E'Poeira''s style reflects his training under Mestre Roque, whose capoeira came from the "Linha de São Bento"—a faster variant of Angola. While classified as Contemporânea, his teaching preserves elements of Roque''s Angola tradition while adapting to the evolving capoeira landscape of Rio de Janeiro''s suburbs. His Grupo Pantera maintained the blend of traditional technique with contemporary organization that characterized post-1960s Rio capoeira.',
  E'O estilo de Poeira reflete seu treinamento com Mestre Roque, cuja capoeira vinha da "Linha de São Bento"—uma variante mais rápida da Angola. Embora classificado como Contemporânea, seu ensino preserva elementos da tradição Angola de Roque enquanto se adapta ao cenário evolutivo da capoeira nos subúrbios do Rio de Janeiro. Seu Grupo Pantera manteve a mistura de técnica tradicional com organização contemporânea que caracterizou a capoeira carioca pós-1960.',
  1958,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Jorge Francisco Ferreira, known as Mestre Poeira, is one of the mestres formed by Mestre Roque who helped extend the Filhos de Angola lineage into the suburbs of Rio de Janeiro and, through his students, across the globe.\n\nPoeira began training with Mestre Roque in 1978, during the later phase of Roque''s teaching career after he had moved from Pavão/Pavãozinho to various locations across Rio''s Zona Norte and Baixada Fluminense. Poeira established himself in Padre Miguel, a working-class suburb in the western zone of Rio de Janeiro, where he founded Grupo Pantera.\n\nThe name "Grupo Pantera" was a tribute to the Black Panther Party, which had a strong influence on resistance movements during Brazil''s military dictatorship (1964-1985). Poeira bestowed the nickname "Pantera" on one of his students who would go on to found the Associação de Capoeira Descendente do Pantera (ACDP) in 1973. This Mestre Pantera later moved to Madrid in 1991, becoming one of the first capoeira teachers in Spain.\n\nPoeira''s influence extended far beyond Rio de Janeiro. His student Mestre Cabeça established Grupo Capoeira Brasil with branches in Boston, Albany, New York, France, Mozambique, and French Guiana. Through Cabeça came Mestre Torpedo, who became a pioneer in Asia—the first capoeira mestre to live and teach long-term in Thailand and the Philippines. Torpedo''s student Mestre Lobo became the first Filipino to receive the mestre title in capoeira history (2023).\n\nAnother notable student was Mestre Célio Gomes, who began training with Poeira around 1980. Célio would later continue his development with Mestre Manoel (GCAP) and Mestres Jurandir and Cobra Mansa (FICA), eventually founding Grupo Aluandê in 2007 and organizing the famous Lavradio Roda in Rio''s Lapa district.\n\nPoeira maintains his Centro Cultural "Itineranti" in Padre Miguel, which served as an important reference point for the lineage—Mestre Camaleão received his "cordel azul" (Aluno Formado) there in 2012. In 2025, Camaleão became the first student from the lineage''s overseas work to receive the mestre title, awarded jointly by Mestre Pantera and Mestre Poeira.\n\nThrough his students and their students, Mestre Poeira''s lineage now spans four continents, carrying forward the tradition that traces back through Roque to Cobrinha Verde, Besouro, and ultimately Tio Alípio.',
  E'Jorge Francisco Ferreira, conhecido como Mestre Poeira, é um dos mestres formados por Mestre Roque que ajudou a estender a linhagem dos Filhos de Angola para os subúrbios do Rio de Janeiro e, através de seus alunos, pelo mundo.\n\nPoeira começou a treinar com Mestre Roque em 1978, durante a fase posterior da carreira de ensino de Roque, depois que ele havia se mudado do Pavão/Pavãozinho para vários locais na Zona Norte do Rio e Baixada Fluminense. Poeira se estabeleceu em Padre Miguel, um subúrbio de classe trabalhadora na zona oeste do Rio de Janeiro, onde fundou o Grupo Pantera.\n\nO nome "Grupo Pantera" foi uma homenagem ao Partido dos Panteras Negras, que teve forte influência nos movimentos de resistência durante a ditadura militar brasileira (1964-1985). Poeira conferiu o apelido "Pantera" a um de seus alunos que viria a fundar a Associação de Capoeira Descendente do Pantera (ACDP) em 1973. Este Mestre Pantera posteriormente se mudou para Madri em 1991, tornando-se um dos primeiros professores de capoeira na Espanha.\n\nA influência de Poeira se estendeu muito além do Rio de Janeiro. Seu aluno Mestre Cabeça estabeleceu o Grupo Capoeira Brasil com filiais em Boston, Albany, Nova York, França, Moçambique e Guiana Francesa. De Cabeça veio Mestre Torpedo, que se tornou um pioneiro na Ásia—o primeiro mestre de capoeira a viver e ensinar por longo período na Tailândia e nas Filipinas. O aluno de Torpedo, Mestre Lobo, tornou-se o primeiro filipino a receber o título de mestre na história da capoeira (2023).\n\nOutro aluno notável foi Mestre Célio Gomes, que começou a treinar com Poeira por volta de 1980. Célio posteriormente continuou seu desenvolvimento com Mestre Manoel (GCAP) e Mestres Jurandir e Cobra Mansa (FICA), eventualmente fundando o Grupo Aluandê em 2007 e organizando a famosa Roda do Lavradio no bairro da Lapa no Rio.\n\nPoeira mantém seu Centro Cultural "Itineranti" em Padre Miguel, que serviu como ponto de referência importante para a linhagem—Mestre Camaleão recebeu seu "cordel azul" (Aluno Formado) lá em 2012. Em 2025, Camaleão se tornou o primeiro aluno do trabalho da linhagem no exterior a receber o título de mestre, concedido conjuntamente por Mestre Pantera e Mestre Poeira.\n\nAtravés de seus alunos e os alunos deles, a linhagem de Mestre Poeira agora se estende por quatro continentes, levando adiante a tradição que remonta através de Roque a Cobrinha Verde, Besouro e, finalmente, Tio Alípio.',
  E'Founded Grupo Pantera (also Grupo de Capoeira Pantera) in Padre Miguel, Rio de Janeiro\nOperated Centro Cultural "Itineranti" in Padre Miguel\nFormed Mestre Pantera (founder of ACDP, 1973; pioneer of capoeira in Spain, 1991)\nFormed Mestre Cabeça (founder of Grupo Capoeira Brasil with international branches)\nFormed Mestre Célio Gomes (founder of Grupo Aluandê, organizer of Lavradio Roda)\nLineage extended to Asia through Cabeça → Torpedo → Lobo (first Filipino mestre, 2023)\nStill active as of 2025, jointly graduating Mestre Camaleão',
  E'Fundou o Grupo Pantera (também Grupo de Capoeira Pantera) em Padre Miguel, Rio de Janeiro\nOperou o Centro Cultural "Itineranti" em Padre Miguel\nFormou Mestre Pantera (fundador da ACDP, 1973; pioneiro da capoeira na Espanha, 1991)\nFormou Mestre Cabeça (fundador do Grupo Capoeira Brasil com filiais internacionais)\nFormou Mestre Célio Gomes (fundador do Grupo Aluandê, organizador da Roda do Lavradio)\nLinhagem estendida à Ásia através de Cabeça → Torpedo → Lobo (primeiro mestre filipino, 2023)\nAinda ativo em 2025, graduando conjuntamente Mestre Camaleão',
  E'BIRTH YEAR ESTIMATION (~1958, decade precision):\nNo sources provide exact birth date. Estimated based on:\n- Training started 1978 with Mestre Roque (per CapoeiraHub)\n- Typical beginner age 18-22 suggests birth ~1956-1960\n- Using ~1958 as midpoint estimate with decade precision\nCapoeiraHub confirms he is from Brazil, based in Padre Miguel suburb of Rio de Janeiro.\n\nTRAINING START: 1978 with Mestre Roque (per CapoeiraHub)\nThis places him in Roque''s later teaching phase, after Roque left Pavão/Pavãozinho.\n\nGRUPO PANTERA NAME ORIGIN:\n- Named as tribute to Black Panther Party (USA)\n- Reflected resistance movements during Brazilian military dictatorship\n- Poeira gave nickname "Pantera" to student who founded ACDP (1973)\n\nSTUDENTS (documented):\n- Mestre Pantera (founded ACDP 1973; moved to Madrid 1991)\n- Mestre Cabeça (Grupo Capoeira Brasil - Boston/Albany/NY/France/Mozambique/French Guiana)\n- Mestre Célio Gomes (began ~1980; godfather William Penninha; later GCAP/FICA; founded Aluandê 2007)\n- Mestre Camaleão (received cordel azul 2012 at Centro Cultural Itineranti; mestre 2025)\n\nLINEAGE CHAIN (documented by Torpedo Capoeira):\nTio Alípio → Besouro → [Cobrinha Verde] → Roque → Poeira → Cabeça → Torpedo → Lobo\nNote: Some sources list Roque directly under Besouro; others include Cobrinha Verde as intermediary.\nRoque himself claims descent through Cobrinha Verde.\n\nCENTRO CULTURAL ITINERANTI:\n- Location: Padre Miguel, RJ, Brazil\n- Camaleão received formado rank there in 2012\n- Still operational as of 2025\n\nSTYLE CLASSIFICATION:\n- CapoeiraHub classifies as "Contemporânea"\n- However, Roque''s tradition was Angola (Linha de São Bento)\n- Contemporânea likely reflects evolution/adaptation over time',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (~1958, precisão de década):\nNenhuma fonte fornece data exata de nascimento. Estimado baseado em:\n- Treinamento iniciou em 1978 com Mestre Roque (per CapoeiraHub)\n- Idade típica de iniciante 18-22 sugere nascimento ~1956-1960\n- Usando ~1958 como estimativa intermediária com precisão de década\nCapoeiraHub confirma que ele é do Brasil, baseado no subúrbio de Padre Miguel no Rio de Janeiro.\n\nINÍCIO DO TREINAMENTO: 1978 com Mestre Roque (per CapoeiraHub)\nIsso o coloca na fase posterior de ensino de Roque, após Roque deixar o Pavão/Pavãozinho.\n\nORIGEM DO NOME GRUPO PANTERA:\n- Nomeado como tributo ao Partido dos Panteras Negras (EUA)\n- Refletia movimentos de resistência durante a ditadura militar brasileira\n- Poeira deu o apelido "Pantera" ao aluno que fundou a ACDP (1973)\n\nALUNOS (documentados):\n- Mestre Pantera (fundou ACDP 1973; mudou para Madri 1991)\n- Mestre Cabeça (Grupo Capoeira Brasil - Boston/Albany/NY/França/Moçambique/Guiana Francesa)\n- Mestre Célio Gomes (começou ~1980; padrinho William Penninha; depois GCAP/FICA; fundou Aluandê 2007)\n- Mestre Camaleão (recebeu cordel azul 2012 no Centro Cultural Itineranti; mestre 2025)\n\nCADEIA DE LINHAGEM (documentada por Torpedo Capoeira):\nTio Alípio → Besouro → [Cobrinha Verde] → Roque → Poeira → Cabeça → Torpedo → Lobo\nNota: Algumas fontes listam Roque diretamente sob Besouro; outras incluem Cobrinha Verde como intermediário.\nO próprio Roque afirma descendência através de Cobrinha Verde.\n\nCENTRO CULTURAL ITINERANTI:\n- Localização: Padre Miguel, RJ, Brasil\n- Camaleão recebeu graduação de formado lá em 2012\n- Ainda em operação em 2025\n\nCLASSIFICAÇÃO DE ESTILO:\n- CapoeiraHub classifica como "Contemporânea"\n- No entanto, a tradição de Roque era Angola (Linha de São Bento)\n- Contemporânea provavelmente reflete evolução/adaptação ao longo do tempo'
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
