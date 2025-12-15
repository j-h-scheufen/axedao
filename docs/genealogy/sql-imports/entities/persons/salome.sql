-- ============================================================
-- GENEALOGY PERSON: Salomé
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
  -- Extended content (bilingual)
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
  'Salomé',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://www.gratidaocapoeira.com/la-femme-et-la-capoeira/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for rasteira (leg sweep) technique and batuque skills.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida pela técnica de rasteira e habilidades no batuque.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Salomé was a valentona - a tough, fearless woman - who practiced capoeira and samba in Salvador, Bahia during the 1920s and 1930s. Her skills earned her a place in capoeira history as one of the earliest documented female practitioners.\n\nAccording to Mestre Atenilo (Altenísio dos Santos, 1916-1986), one of Mestre Bimba''s oldest students, Salomé "cantava no samba e jogava capoeira" - she sang in samba and played capoeira. When asked about her, Atenilo became animated: "você encostava ela passava a rasteira e te botava de pernas pro ar" - if you touched her, she would sweep your legs and put you on your back. She would enter the Batuque and knock opponents down "duas três vezes" - two or three times. "Era valente!" he declared - she was brave!\n\nSalomé, along with her companion Maria dos Anjos, was a student of the capoeirista known as Doze Homens. Both women were known for their passion for batuque (a form of combat/dance) and samba. When Bira Almeida questioned Atenilo about the women''s identities, suggesting they might not have been "real women," Atenilo indignantly responded: "c''était des femmes, des vraies!" - they were women, real women!\n\nThis was a time when capoeira was still criminalized and the presence of women in the rodas was exceptional. Yet Salomé carved out her space through undeniable skill, becoming one of the legendary valentonas of Bahia alongside figures like Chicão, Angélica Endiabrada, and Rosa Palmeirão.\n\nSalomé''s legacy endures through the corrido "Adão, Adão" - a traditional call-and-response song still sung in rodas worldwide. The song asks "Ôi cadê Salomé, Adão?" (Where is Salomé, Adam?) with the response "Salomé foi passear" (Salomé went for a walk) or "foi para Ilha de Maré" (went to Maré Island). This song appeared on Mestre Pastinha''s 1969 LP "Capoeira Angola, Mestre Pastinha e sua Academia," ensuring that her name continues to echo through capoeira circles more than a century after her prime.',
  E'Salomé era uma valentona - uma mulher durona e destemida - que praticava capoeira e samba em Salvador, Bahia, durante os anos 1920 e 1930. Suas habilidades lhe garantiram um lugar na história da capoeira como uma das primeiras praticantes femininas documentadas.\n\nSegundo Mestre Atenilo (Altenísio dos Santos, 1916-1986), um dos alunos mais antigos de Mestre Bimba, Salomé "cantava no samba e jogava capoeira." Quando perguntado sobre ela, Atenilo se animou: "você encostava ela passava a rasteira e te botava de pernas pro ar." Ela entrava no Batuque e derrubava os oponentes "duas três vezes." "Era valente!" declarou ele.\n\nSalomé, junto com sua companheira Maria dos Anjos, foi aluna do capoeirista conhecido como Doze Homens. Ambas as mulheres eram conhecidas por sua paixão pelo batuque (uma forma de combate/dança) e samba. Quando Bira Almeida questionou Atenilo sobre as identidades das mulheres, sugerindo que talvez não fossem "mulheres de verdade," Atenilo respondeu indignado: "eram mulheres, de verdade!"\n\nEsta era uma época em que a capoeira ainda era criminalizada e a presença de mulheres nas rodas era excepcional. Ainda assim, Salomé conquistou seu espaço através de habilidade inegável, tornando-se uma das lendárias valentonas da Bahia ao lado de figuras como Chicão, Angélica Endiabrada e Rosa Palmeirão.\n\nO legado de Salomé perdura através do corrido "Adão, Adão" - uma cantiga tradicional de chamada e resposta ainda cantada em rodas pelo mundo. A canção pergunta "Ôi cadê Salomé, Adão?" com a resposta "Salomé foi passear" ou "foi para Ilha de Maré." Esta canção apareceu no LP de 1969 de Mestre Pastinha "Capoeira Angola, Mestre Pastinha e sua Academia," garantindo que seu nome continue ecoando nos círculos de capoeira mais de um século após seu auge.',
  E'One of the earliest documented female capoeiristas in Brazilian history; immortalized in the traditional corrido "Adão, Adão, oi cadê Salomé"',
  E'Uma das primeiras mulheres capoeiristas documentadas na história brasileira; imortalizada no corrido tradicional "Adão, Adão, oi cadê Salomé"',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1905, decade precision): Active as capoeirista in 1920s-1930s per Mestre Atenilo. If in prime (20s-30s) during this period, birth = ~1895-1910. Using 1905 as midpoint.\n\nDEATH: Unknown. No records found.\n\nNAME VARIANTS: Also referred to as "Maria Salomé" in some sources. Primary sources (Atenilo testimony) use just "Salomé."\n\nCORRECTION: Original person-reports file stated Salomé was student of "Maria Doze Homens" - this is INCORRECT. Per Atenilo testimony (primary source), Salomé and Maria dos Anjos were students of the MALE capoeirista "Doze Homens" (died ~1925 during Pedrito persecution), NOT the female "Maria Doze Homens."\n\nRELATIONSHIP: Student of Doze Homens (along with Maria dos Anjos) per Mestre Atenilo testimony to Bira Almeida.\n\nSONGS: Immortalized in corrido "Adão, Adão, oi cadê Salomé, Adão" - appeared on Mestre Pastinha''s 1969 LP.\n\nPRIMARY SOURCE: "Atenilo, o relâmpago da Capoeira Regional" by Raimundo César Alves de Almeida (Mestre Itapoan), 1988, Núcleo de Recursos Didáticos da UFBA.\n\nCONTEMPORARY VALENTONAS: Maria Doze Homens, Maria dos Anjos, Chicão, Angélica Endiabrada, Rosa Palmeirão, Massú, Catu.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década): Ativa como capoeirista nos anos 1920-1930 segundo Mestre Atenilo. Se estava no auge (20-30 anos) durante este período, nascimento = ~1895-1910. Usando 1905 como ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado.\n\nVARIANTES DE NOME: Também referida como "Maria Salomé" em algumas fontes. Fontes primárias (testemunho de Atenilo) usam apenas "Salomé."\n\nCORREÇÃO: O arquivo original person-reports afirmava que Salomé era aluna de "Maria Doze Homens" - isto está INCORRETO. Segundo testemunho de Atenilo (fonte primária), Salomé e Maria dos Anjos eram alunas do capoeirista HOMEM "Doze Homens" (morto ~1925 durante perseguição de Pedrito), NÃO da mulher "Maria Doze Homens."\n\nRELACIONAMENTO: Aluna de Doze Homens (junto com Maria dos Anjos) segundo testemunho de Mestre Atenilo para Bira Almeida.\n\nCANÇÕES: Imortalizada no corrido "Adão, Adão, oi cadê Salomé, Adão" - apareceu no LP de 1969 de Mestre Pastinha.\n\nFONTE PRIMÁRIA: "Atenilo, o relâmpago da Capoeira Regional" de Raimundo César Alves de Almeida (Mestre Itapoan), 1988, Núcleo de Recursos Didáticos da UFBA.\n\nVALENTONAS CONTEMPORÂNEAS: Maria Doze Homens, Maria dos Anjos, Chicão, Angélica Endiabrada, Rosa Palmeirão, Massú, Catu.'
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
