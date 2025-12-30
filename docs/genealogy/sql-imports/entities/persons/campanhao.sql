-- ============================================================
-- GENEALOGY PERSON: Campanhão
-- Generated: 2025-12-20
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- The Os Malandros de Mestre Touro lineage states birth year as 1900.
-- This is plausible given:
-- - Prata Preta (b. 1874) was deported in 1904 when Campanhão would be ~4
-- - Quinzinho (b. ~1925) could have trained under Campanhão in the 1940s
--   when Campanhão would be in his 40s
-- - However, this timeline raises questions about when/how Campanhão
--   learned from Prata Preta, who was exiled in 1904
-- Only one source documents this figure; confidence is uncertain.
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
  NULL, -- Full name unknown
  'Campanhão',
  NULL, -- No formal title in pre-codification era
  NULL, -- No portrait known
  ARRAY[]::text[], -- No stable online sources about Campanhão specifically
  -- Capoeira-specific
  NULL, -- Pre-codification era; style distinctions did not exist
  E'Pre-codification carioca capoeira. Practiced tiririca, the violent street capoeira of Rio de Janeiro that existed before formalization. Bridge figure between Prata Preta''s generation (late 19th century maltas) and Quinzinho''s generation (mid-20th century malandros).',
  E'Capoeira carioca pré-codificação. Praticava tiririca, a violenta capoeira de rua do Rio de Janeiro que existia antes da formalização. Figura de transição entre a geração de Prata Preta (maltas do final do século XIX) e a geração de Quinzinho (malandros de meados do século XX).',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL, -- Death place unknown
  -- bio_en
  E'Campanhão is an obscure figure in the history of carioca capoeira, known only through the lineage preserved by Os Malandros de Mestre Touro. According to their family tree, Campanhão was born around 1900 in Rio de Janeiro and served as the critical link between Prata Preta—the legendary capoeirista deported to Acre after the 1904 Vaccine Revolt—and Quinzinho, who would later become Mestre Leopoldina''s first teacher.

Almost nothing is documented about Campanhão''s life. The source states he was born "around 1900", but for a meaningful training relationship with Prata Preta (who was deported in December 1904), Campanhão was likely born somewhat earlier—perhaps in the early-to-mid 1890s—which would make him a teenager when Prata Preta was still active in Rio''s port district.

What we can infer is that Campanhão was part of the generation that kept carioca capoeira alive during its most dangerous period. The practice had been criminalized in 1890 under Article 402 of the Penal Code, and practitioners faced imprisonment and deportation. Yet in the favelas and docks of Rio, in the shadows of Central do Brasil station and the port district, men like Campanhão continued to practice and transmit tiririca—the violent, musicless capoeira of the streets.

By the time Quinzinho emerged in the late 1940s as a feared malandro and gang leader around Central do Brasil, the old knowledge had survived. Quinzinho would teach the young Demerval Lopes de Lacerda—future Mestre Leopoldina—in front of his house, using the same informal methods: "Do it like this... do it like that". Through this chain of transmission, the premodern Rio lineage survived into the modern era.

Campanhão''s name appears only in the lineage documentation of Os Malandros de Mestre Touro, making him a "ghost" figure in capoeira history—essential to the chain but almost invisible to the historical record. His story represents the countless unnamed capoeiristas who preserved the art through oral tradition and physical practice during decades of persecution.',
  -- bio_pt
  E'Campanhão é uma figura obscura na história da capoeira carioca, conhecida apenas através da linhagem preservada pelos Os Malandros de Mestre Touro. Segundo sua árvore genealógica, Campanhão nasceu por volta de 1900 no Rio de Janeiro e serviu como elo crítico entre Prata Preta—o lendário capoeirista deportado para o Acre após a Revolta da Vacina de 1904—e Quinzinho, que mais tarde se tornaria o primeiro professor de Mestre Leopoldina.

Quase nada está documentado sobre a vida de Campanhão. A fonte indica que ele nasceu "por volta de 1900", mas para uma relação de treinamento significativa com Prata Preta (que foi deportado em dezembro de 1904), Campanhão provavelmente nasceu um pouco antes—talvez no início ou meados dos anos 1890—o que o tornaria adolescente quando Prata Preta ainda estava ativo na região portuária do Rio.

O que podemos inferir é que Campanhão fazia parte da geração que manteve a capoeira carioca viva durante seu período mais perigoso. A prática havia sido criminalizada em 1890 sob o Artigo 402 do Código Penal, e os praticantes enfrentavam prisão e deportação. Ainda assim, nas favelas e docas do Rio, nas sombras da estação Central do Brasil e do distrito portuário, homens como Campanhão continuaram a praticar e transmitir a tiririca—a violenta capoeira sem música das ruas.

Quando Quinzinho emergiu no final dos anos 1940 como um temido malandro e líder de gangue ao redor da Central do Brasil, o antigo conhecimento havia sobrevivido. Quinzinho ensinaria o jovem Demerval Lopes de Lacerda—futuro Mestre Leopoldina—na frente de sua casa, usando os mesmos métodos informais: "Faz assim... faz assim". Através dessa cadeia de transmissão, a linhagem pré-moderna do Rio sobreviveu até a era moderna.

O nome de Campanhão aparece apenas na documentação de linhagem dos Os Malandros de Mestre Touro, tornando-o uma figura "fantasma" na história da capoeira—essencial para a cadeia, mas quase invisível no registro histórico. Sua história representa os incontáveis capoeiristas sem nome que preservaram a arte através da tradição oral e prática física durante décadas de perseguição.',
  -- achievements_en
  NULL, -- No documented achievements
  -- achievements_pt
  NULL, -- No documented achievements
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade precision):
Only source for this figure is the Os Malandros de Mestre Touro lineage (malandros-touro.com). Their family tree states birth year as "around 1900" in Rio de Janeiro. However, for a meaningful training relationship with Prata Preta (who was deported in December 1904), Campanhão was likely born somewhat earlier—perhaps in the early-to-mid 1890s—which would make him a teenager when Prata Preta was still active. The "decade" precision accommodates this uncertainty while preserving the source''s approximate timeframe.

DEATH: Unknown. No documentation.

NAME: Only apelido "Campanhão" is known. No full name documented.

SINGLE SOURCE WARNING: This entire profile is based on the Os Malandros de Mestre Touro lineage documentation. No corroborating sources have been found in academic literature, newspaper archives, or other capoeira historical sources (capoeirahistory.com, velhosmestres.com, etc.).

LINEAGE:
Prata Preta (b. 1874) → Campanhão (b. ~1900) → Quinzinho (b. ~1925) → Leopoldina (b. 1933) → Celso Pepe (b. 1949) → Mestre Touro (b. 1950)

TEACHERS:
- Prata Preta (Horácio José da Silva) - per Os Malandros lineage; timing uncertain due to 1904 deportation

STUDENTS:
- Quinzinho (Joaquim Felix de Souza, b. ~1925) - per Os Malandros lineage',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1900, precisão de década):
Única fonte para esta figura é a linhagem dos Os Malandros de Mestre Touro (malandros-touro.com). Sua árvore genealógica indica ano de nascimento como "por volta de 1900" no Rio de Janeiro. No entanto, para uma relação de treinamento significativa com Prata Preta (que foi deportado em dezembro de 1904), Campanhão provavelmente nasceu um pouco antes—talvez no início ou meados dos anos 1890—o que o tornaria adolescente quando Prata Preta ainda estava ativo. A precisão de "década" acomoda essa incerteza enquanto preserva o período aproximado da fonte.

MORTE: Desconhecida. Sem documentação.

NOME: Apenas o apelido "Campanhão" é conhecido. Nenhum nome completo documentado.

AVISO DE FONTE ÚNICA: Todo este perfil é baseado na documentação de linhagem dos Os Malandros de Mestre Touro. Nenhuma fonte corroboradora foi encontrada em literatura acadêmica, arquivos de jornais ou outras fontes históricas de capoeira (capoeirahistory.com, velhosmestres.com, etc.).

LINHAGEM:
Prata Preta (n. 1874) → Campanhão (n. ~1900) → Quinzinho (n. ~1925) → Leopoldina (n. 1933) → Celso Pepe (n. 1949) → Mestre Touro (n. 1950)

MESTRES:
- Prata Preta (Horácio José da Silva) - conforme linhagem Os Malandros; cronologia incerta devido à deportação de 1904

ALUNOS:
- Quinzinho (Joaquim Felix de Souza, n. ~1925) - conforme linhagem Os Malandros'
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
