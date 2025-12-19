-- ============================================================
-- GENEALOGY PERSON: Maria dos Anjos
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1905, decade precision):
-- Active as capoeirista and batuque practitioner in 1920s-1930s Salvador
-- per Mestre Atenilo testimony. If in prime (20s-30s) during this period,
-- birth = ~1895-1910. Using 1905 as midpoint (same as Salomé).
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
  'Maria dos Anjos',
  NULL,
  NULL,
  ARRAY['https://www.gratidaocapoeira.com/la-femme-et-la-capoeira/', 'https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for batuque and samba alongside capoeira.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida pelo batuque e samba junto com a capoeira.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Maria dos Anjos was a valentona - a tough, fearless woman - who practiced capoeira, batuque, and samba in Salvador, Bahia during the 1920s and 1930s. She was one of the earliest documented female capoeiristas in Brazilian history, training alongside her companion Salomé under the male capoeirista Doze Homens.\n\nAccording to testimony from Mestre Atenilo (Altenísio dos Santos, 1916-1986), one of Mestre Bimba''s oldest students, he personally knew both Maria dos Anjos and Salomé. When researcher Bira Almeida questioned Atenilo about the women''s identities, suggesting they might not have been "real women," Atenilo indignantly responded: "c''était des femmes, des vraies!" - they were women, real women! He described both as individuals of strong character - "mulheres de valor."\n\nMaria dos Anjos and Salomé were known in early 20th-century Salvador for their love of batuque (a form of combat/dance that preceded and influenced capoeira) and samba. Both learned from Doze Homens, a capoeirista who was himself a companion of the legendary Besouro Mangangá at Trapiche de Baixo in Santo Amaro. Tragically, Doze Homens was killed during the brutal Pedrito persecution around 1925, leaving his students to carry on his legacy.\n\nThis was a time when capoeira was still criminalized and the presence of women in the rodas was exceptional. Yet Maria dos Anjos carved out her space through skill and courage, becoming one of the legendary valentonas of Bahia alongside figures like Salomé, Maria Doze Homens, Chicão, Angélica Endiabrada, and Rosa Palmeirão.\n\nThrough Maria dos Anjos, some historians have speculated, the nickname "Maria Doze Homens" may have entered capoeira legend - as "Maria [student of] Doze Homens." However, Maria Doze Homens (Maria Felipe de Oliveira) appears to be a separate individual whose nickname has different origins. The confusion persists in oral tradition, but the testimony of Mestre Atenilo clearly distinguishes Maria dos Anjos as a student of the male teacher Doze Homens, not as "Maria Doze Homens" herself.',
  E'Maria dos Anjos era uma valentona - uma mulher durona e destemida - que praticava capoeira, batuque e samba em Salvador, Bahia, durante os anos 1920 e 1930. Ela foi uma das primeiras mulheres capoeiristas documentadas na história brasileira, treinando ao lado de sua companheira Salomé sob o capoeirista homem Doze Homens.\n\nSegundo testemunho de Mestre Atenilo (Altenísio dos Santos, 1916-1986), um dos alunos mais antigos de Mestre Bimba, ele conheceu pessoalmente Maria dos Anjos e Salomé. Quando o pesquisador Bira Almeida questionou Atenilo sobre as identidades das mulheres, sugerindo que talvez não fossem "mulheres de verdade," Atenilo respondeu indignado: "eram mulheres, de verdade!" Ele descreveu ambas como indivíduos de caráter forte - "mulheres de valor."\n\nMaria dos Anjos e Salomé eram conhecidas no início do século XX em Salvador por seu amor pelo batuque (uma forma de combate/dança que precedeu e influenciou a capoeira) e samba. Ambas aprenderam com Doze Homens, um capoeirista que era ele próprio companheiro do lendário Besouro Mangangá no Trapiche de Baixo em Santo Amaro. Tragicamente, Doze Homens foi morto durante a brutal perseguição de Pedrito por volta de 1925, deixando suas alunas para continuar seu legado.\n\nEsta era uma época em que a capoeira ainda era criminalizada e a presença de mulheres nas rodas era excepcional. Ainda assim, Maria dos Anjos conquistou seu espaço através de habilidade e coragem, tornando-se uma das lendárias valentonas da Bahia ao lado de figuras como Salomé, Maria Doze Homens, Chicão, Angélica Endiabrada e Rosa Palmeirão.\n\nAtravés de Maria dos Anjos, alguns historiadores especularam, o apelido "Maria Doze Homens" pode ter entrado na lenda da capoeira - como "Maria [aluna de] Doze Homens." No entanto, Maria Doze Homens (Maria Felipe de Oliveira) parece ser um indivíduo separado cujo apelido tem origens diferentes. A confusão persiste na tradição oral, mas o testemunho de Mestre Atenilo distingue claramente Maria dos Anjos como aluna do professor homem Doze Homens, não como "Maria Doze Homens" ela mesma.',
  E'One of the earliest documented female capoeiristas in Brazilian history; student of Doze Homens alongside Salomé',
  E'Uma das primeiras mulheres capoeiristas documentadas na história brasileira; aluna de Doze Homens junto com Salomé',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1905, decade precision): Active as capoeirista in 1920s-1930s per Mestre Atenilo. If in prime (20s-30s) during this period, birth = ~1895-1910. Using 1905 as midpoint (same as Salomé).\n\nDEATH: Unknown. No records found.\n\nTEACHERS:\n- Doze Homens (~1890-~1925, killed during Pedrito persecution) - Per Mestre Atenilo testimony to Bira Almeida\n\nCOMPANIONS:\n- Salomé - Fellow student of Doze Homens; contemporary valentona\n\nCONTEMPORARY VALENTONAS: Maria Doze Homens, Salomé, Chicão, Angélica Endiabrada, Rosa Palmeirão, Massú, Catu\n\nIDENTITY CLARIFICATION: Maria dos Anjos is DISTINCT from:\n1. Maria Doze Homens (Maria Felipe de Oliveira) - separate female capoeirista; possible confusion because Maria dos Anjos trained under male teacher named Doze Homens\n2. Maria dos Anjos (wife of Mestre Bimba) - different person; mother of Crispim and Edvaldo Rosa; active later era\n\nPRIMARY SOURCE: "Atenilo, o relâmpago da Capoeira Regional" by Raimundo César Alves de Almeida (Mestre Itapoan), 1988, Núcleo de Recursos Didáticos da UFBA.\n\nATENILO QUOTE: When questioned about whether Salomé and Maria dos Anjos were "real women," Atenilo indignantly responded: "c''était des femmes, des vraies!" - they were women, real women!\n\nBASTIANTE CONTEXT: Maria dos Anjos and Salomé were known for their love of batuque (combat/dance) and samba. Both learned from Doze Homens, who was a companion of Besouro Mangangá at Trapiche de Baixo.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década): Ativa como capoeirista nos anos 1920-1930 segundo Mestre Atenilo. Se estava no auge (20-30 anos) durante este período, nascimento = ~1895-1910. Usando 1905 como ponto médio (igual a Salomé).\n\nMORTE: Desconhecida. Nenhum registro encontrado.\n\nPROFESSORES:\n- Doze Homens (~1890-~1925, morto durante perseguição de Pedrito) - Segundo testemunho de Mestre Atenilo para Bira Almeida\n\nCOMPANHEIRAS:\n- Salomé - Colega aluna de Doze Homens; valentona contemporânea\n\nVALENTONAS CONTEMPORÂNEAS: Maria Doze Homens, Salomé, Chicão, Angélica Endiabrada, Rosa Palmeirão, Massú, Catu\n\nESCLARECIMENTO DE IDENTIDADE: Maria dos Anjos é DISTINTA de:\n1. Maria Doze Homens (Maria Felipe de Oliveira) - capoeirista mulher separada; possível confusão porque Maria dos Anjos treinou com professor homem chamado Doze Homens\n2. Maria dos Anjos (esposa de Mestre Bimba) - pessoa diferente; mãe de Crispim e Edvaldo Rosa; ativa em era posterior\n\nFONTE PRIMÁRIA: "Atenilo, o relâmpago da Capoeira Regional" de Raimundo César Alves de Almeida (Mestre Itapoan), 1988, Núcleo de Recursos Didáticos da UFBA.\n\nCITAÇÃO DE ATENILO: Quando questionado sobre se Salomé e Maria dos Anjos eram "mulheres de verdade," Atenilo respondeu indignado: "eram mulheres, de verdade!"\n\nCONTEXTO BATUQUE: Maria dos Anjos e Salomé eram conhecidas por seu amor pelo batuque (combate/dança) e samba. Ambas aprenderam com Doze Homens, que era companheiro de Besouro Mangangá no Trapiche de Baixo.'
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
