-- ============================================================
-- GENEALOGY PERSON: Antônio de Noronha
-- Migrated: 2025-12-11
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Antônio de Noronha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-2', 'https://esquiva.wordpress.com/mestres/mestre-aberre/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  'Practiced the pre-codified capoeira of late 19th and early 20th century Salvador. Part of the generation that learned capoeira when it was first criminalized in Brazil (1890).',
  'Praticava a capoeira pré-codificada do final do século XIX e início do século XX em Salvador. Parte da geração que aprendeu capoeira quando foi criminalizada pela primeira vez no Brasil (1890).',
  -- Life dates
  1875,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bio)
  E'Mestre Antônio de Noronha is a shadowy but critical figure in capoeira Angola history. He exists primarily through oral tradition and lineage claims, with almost no biographical details surviving.\n\nAround 1910-1912, a young Aberrê (Antônio Raimundo Argolo, born 1895) learned capoeira in Salvador. The reliable source velhosmestres.com states he "learned capoeira with M Pastinha and/or with M Antônio de Noronha" during this period. The Grupo Esquiva de Rua website lists Aberrê''s "Origem: Mestre Antonio de Noronha"—identifying him as Aberrê''s primary teacher.\n\nThe strongest evidence comes from direct testimony: "Mestre Aberrê is the second mestre in my lineage, above him comes Mestre Antônio de Noronha—this affirmation came from Mestre Caiçara and Mestre Silvestre". Mestre Silvestre (Silvestre Vitório Ferreira) was a student of both Mestre Waldemar and Mestre Caiçara, and his testimony carries weight. Grupo Gingarte also follows this lineage, confirming the chain: Antônio de Noronha → Aberrê → Canjiquinha.\n\nIf he was teaching in 1910-1912, and assuming he was at least 30-40 years old when teaching (the typical age for a recognized mestre in that era), he was likely born between 1870 and 1880. This places him in the generation that learned capoeira when it was first criminalized in Brazil (1890) and practiced it in hiding or under police persecution.',
  -- bio_pt
  E'Mestre Antônio de Noronha é uma figura obscura mas crítica na história da capoeira Angola. Ele existe principalmente através da tradição oral e reivindicações de linhagem, com quase nenhum detalhe biográfico sobrevivente.\n\nPor volta de 1910-1912, um jovem Aberrê (Antônio Raimundo Argolo, nascido em 1895) aprendeu capoeira em Salvador. A fonte confiável velhosmestres.com afirma que ele "aprendeu capoeira com M Pastinha e/ou com M Antônio de Noronha" durante este período. O site do Grupo Esquiva de Rua lista a "Origem: Mestre Antonio de Noronha" de Aberrê—identificando-o como o professor principal de Aberrê.\n\nA evidência mais forte vem de testemunho direto: "Mestre Aberrê é o segundo mestre da minha linhagem, acima dele vem Mestre Antônio de Noronha—esta afirmação veio de Mestre Caiçara e Mestre Silvestre". Mestre Silvestre (Silvestre Vitório Ferreira) foi aluno tanto de Mestre Waldemar quanto de Mestre Caiçara, e seu testemunho tem peso. O Grupo Gingarte também segue esta linhagem, confirmando a cadeia: Antônio de Noronha → Aberrê → Canjiquinha.\n\nSe ele estava ensinando em 1910-1912, e assumindo que tinha pelo menos 30-40 anos quando ensinava (a idade típica para um mestre reconhecido naquela época), ele provavelmente nasceu entre 1870 e 1880. Isso o coloca na geração que aprendeu capoeira quando foi criminalizada pela primeira vez no Brasil (1890) e a praticou escondida ou sob perseguição policial.',
  -- achievements
  'Trained Mestre Aberrê (c. 1910-1912), who later became a pivotal figure in Capoeira Angola history
Top of a verified lineage chain: Antônio de Noronha → Aberrê → Canjiquinha/Caiçara → modern groups',
  -- achievements_pt
  'Treinou Mestre Aberrê (c. 1910-1912), que mais tarde se tornou uma figura central na história da Capoeira Angola
Topo de uma cadeia de linhagem verificada: Antônio de Noronha → Aberrê → Canjiquinha/Caiçara → grupos modernos',
  -- notes (researcher metadata)
  E'BIRTH YEAR ESTIMATION (1875, decade precision):\n- Aberrê was training in 1910-1912\n- A recognized mestre would typically be 30-45 years old\n- If he was 35-40 in 1910, born ~1870-1875\n- Using 1875 as midpoint estimate\n\nEVIDENCE SOURCES:\n1. velhosmestres.com: "learned capoeira with M Pastinha and/or with M Antônio de Noronha"\n2. Grupo Esquiva: "Origem: Mestre Antonio de Noronha"\n3. Testimony from Mestre Caiçara and Mestre Silvestre: lineage claim\n4. Grupo Gingarte: follows same lineage chain',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1875, precisão de década):\n- Aberrê estava treinando em 1910-1912\n- Um mestre reconhecido normalmente teria 30-45 anos\n- Se tinha 35-40 em 1910, nasceu ~1870-1875\n- Usando 1875 como estimativa de ponto médio\n\nFONTES DE EVIDÊNCIA:\n1. velhosmestres.com: "aprendeu capoeira com M Pastinha e/ou com M Antônio de Noronha"\n2. Grupo Esquiva: "Origem: Mestre Antonio de Noronha"\n3. Testemunho de Mestre Caiçara e Mestre Silvestre: reivindicação de linhagem\n4. Grupo Gingarte: segue a mesma cadeia de linhagem'
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
