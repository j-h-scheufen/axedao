-- ============================================================
-- GENEALOGY PERSON: Maria Doze Homens
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
  'Maria Felipe de Oliveira',
  'Maria Doze Homens',
  NULL,
  NULL,
  '[{"type": "website", "url": "https://sites.google.com/view/raridadesdacapoeira/maria-12-homens"}]'::jsonb,
  -- Capoeira-specific
  NULL,
  E'Pre-modern/early modern era capoeira. Active during the period when capoeira was still persecuted and transitioning to legalization.',
  E'Capoeira da era pré-moderna/moderna inicial. Ativa durante o período em que a capoeira ainda era perseguida e transitando para legalização.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Maria Doze Homens ("Maria Twelve Men") was one of the earliest documented female capoeiristas, active in Bahia during the 1920s and 1930s - a time when capoeira was still criminalized and the presence of women in rodas was exceptional.\n\nThe origin of her powerful nickname is disputed in oral tradition:\n\n1. **The knockout story**: She earned the name after knocking down twelve men in a single roda, demonstrating combat prowess that rivaled or exceeded that of male practitioners.\n\n2. **The police confrontation**: Some say she defeated (or even killed) twelve police officers in a single confrontation - a feat that would have made her a legend in an era of brutal persecution.\n\n3. **Training lineage (disputed)**: According to testimony recorded by Bira Almeida from Mestre Atenilo, in early 20th century Salvador there were two women who loved batuque and samba - Salomé and Maria dos Anjos - who were students of a male capoeirista named "Doze Homens." Some have speculated that "Maria Doze Homens" was a title indicating "Maria [student of] Doze Homens" - however, Maria Salomé and Maria dos Anjos appear to be separate individuals from Maria Doze Homens (Maria Felipe de Oliveira).\n\n4. **Companion of Besouro**: Some sources list her among Besouro Mangangá''s Sunday training circle alongside Paulo Barroquinha, Canário Pardo, and Siri de Mangue, describing them as "capoeira resistance fighters who trained together."\n\nShe frequented the historic Cais Dourado (Mercado do Ouro) area of Salvador - a gathering place for capoeiristas and malandros. She shared "corpulence and bravery" with Maria Felipa de Oliveira, another legendary Bahian fighter, leading some to speculate (without confirmation) that they may have been the same person.\n\nAround 1940, Mestre Bimba reportedly taught a woman nicknamed "Maria Doze Homens" and a group of female students to participate in an international festival - though this event had no lasting continuity for women in his academy.\n\nWriter Jorge Amado allegedly drew inspiration from Maria Doze Homens when creating the character Rosa Palmeirão in his novel "Mar Morto" - a fierce woman who humiliated the famous valentão Pedro Mineiro.\n\nMaria Doze Homens represents an important but largely undocumented chapter in capoeira history: the presence of women in the rodas during the persecuted era, fighting alongside men in an art form that would only officially acknowledge female participation decades later.',
  E'Maria Doze Homens foi uma das primeiras capoeiristas mulheres documentadas, ativa na Bahia durante os anos 1920 e 1930 - uma época em que a capoeira ainda era criminalizada e a presença de mulheres nas rodas era excepcional.\n\nA origem de seu poderoso apelido é disputada na tradição oral:\n\n1. **A história da queda**: Ela ganhou o nome após derrubar doze homens em uma única roda, demonstrando proeza de combate que rivalizava ou excedia a dos praticantes masculinos.\n\n2. **O confronto policial**: Alguns dizem que ela derrotou (ou até matou) doze policiais em um único confronto - um feito que a teria tornado uma lenda em uma era de perseguição brutal.\n\n3. **Linhagem de treinamento (disputada)**: Segundo testemunho registrado por Bira Almeida de Mestre Atenilo, no início do século XX em Salvador havia duas mulheres que amavam batuque e samba - Salomé e Maria dos Anjos - que eram alunas de um capoeirista homem chamado "Doze Homens." Alguns especularam que "Maria Doze Homens" era um título indicando "Maria [aluna de] Doze Homens" - no entanto, Maria Salomé e Maria dos Anjos parecem ser indivíduos separados de Maria Doze Homens (Maria Felipe de Oliveira).\n\n4. **Companheira de Besouro**: Algumas fontes a listam entre o círculo de treino dominical de Besouro Mangangá junto com Paulo Barroquinha, Canário Pardo e Siri de Mangue, descrevendo-os como "lutadores de resistência da capoeira que treinavam juntos."\n\nEla frequentava a histórica área do Cais Dourado (Mercado do Ouro) de Salvador - um ponto de encontro para capoeiristas e malandros. Ela compartilhava "corpulência e valentia" com Maria Felipa de Oliveira, outra lendária lutadora baiana, levando alguns a especular (sem confirmação) que poderiam ser a mesma pessoa.\n\nPor volta de 1940, Mestre Bimba supostamente ensinou uma mulher apelidada "Maria Doze Homens" e um grupo de alunas para participar de um festival internacional - embora este evento não tenha tido continuidade duradoura para mulheres em sua academia.\n\nO escritor Jorge Amado supostamente se inspirou em Maria Doze Homens ao criar a personagem Rosa Palmeirão em seu romance "Mar Morto" - uma mulher feroz que humilhou o famoso valentão Pedro Mineiro.\n\nMaria Doze Homens representa um capítulo importante mas amplamente não documentado na história da capoeira: a presença de mulheres nas rodas durante a era perseguida, lutando ao lado de homens em uma forma de arte que só reconheceria oficialmente a participação feminina décadas depois.',
  E'One of the earliest documented female capoeiristas in Brazilian history',
  E'Uma das primeiras capoeiristas mulheres documentadas na história brasileira',
  -- Researcher notes
  E'FULL NAME: Maria Felipe de Oliveira (per Raridades da Capoeira source).\n\nBIRTH YEAR ESTIMATION (1900, decade precision): Active in 1920s-1930s; possibly companion of Besouro (d. 1924); trained by Bimba around 1940. If 20-30 in the 1920s, born ~1895-1910. Using 1900.\n\nDEATH: Unknown.\n\nMULTIPLE ORIGIN STORIES FOR NICKNAME:\n1. Knocked down 12 men in a roda (most common version)\n2. Defeated/killed 12 police officers\n3. Companion of Besouro\n\nIDENTITY CLARIFICATIONS:\n- Maria Doze Homens, Maria Salomé, and Maria dos Anjos are THREE SEPARATE INDIVIDUALS. Maria Salomé and Maria dos Anjos were students of the male capoeirista Mestre Doze Homens. Maria Doze Homens (Maria Felipe de Oliveira) is a distinct person.\n- Some conflate with Maria Felipa de Oliveira (independence fighter, 1822) - unlikely given different eras, though names are similar\n- "Maria Homem" (1940s homosexual fighter) is a different person\n\nLITERARY CONNECTION: Jorge Amado''s "Rosa Palmeirão" in Mar Morto allegedly inspired by Maria Doze Homens.\n\nPENDING RELATIONSHIPS:\n- Maria Doze Homens trained_under Mestre Bimba (~1940, for international festival)\n- Maria Doze Homens associated_with Besouro Mangangá (per some sources listing her in his Sunday circle)',
  E'NOME COMPLETO: Maria Felipe de Oliveira (per fonte Raridades da Capoeira).\n\nESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Ativa nos anos 1920-1930; possivelmente companheira de Besouro (m. 1924); treinada por Bimba por volta de 1940. Se tinha 20-30 anos nos anos 1920, nasceu ~1895-1910. Usando 1900.\n\nMORTE: Desconhecida.\n\nMÚLTIPLAS HISTÓRIAS DE ORIGEM DO APELIDO:\n1. Derrubou 12 homens em uma roda (versão mais comum)\n2. Derrotou/matou 12 policiais\n3. Companheira de Besouro\n\nESCLARECIMENTOS DE IDENTIDADE:\n- Maria Doze Homens, Maria Salomé e Maria dos Anjos são TRÊS INDIVÍDUOS SEPARADOS. Maria Salomé e Maria dos Anjos eram alunas do capoeirista homem Mestre Doze Homens. Maria Doze Homens (Maria Felipe de Oliveira) é uma pessoa distinta.\n- Alguns confundem com Maria Felipa de Oliveira (lutadora da independência, 1822) - improvável dadas as eras diferentes, embora os nomes sejam semelhantes\n- "Maria Homem" (lutadora homossexual dos anos 1940) é uma pessoa diferente\n\nCONEXÃO LITERÁRIA: "Rosa Palmeirão" de Jorge Amado em Mar Morto supostamente inspirada em Maria Doze Homens.\n\nRELACIONAMENTOS PENDENTES:\n- Maria Doze Homens trained_under Mestre Bimba (~1940, para festival internacional)\n- Maria Doze Homens associated_with Besouro Mangangá (per algumas fontes listando-a em seu círculo dominical)'
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
