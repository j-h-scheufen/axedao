-- ============================================================
-- GENEALOGY PERSON: Boca de Siri
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
  'Boca de Siri',
  NULL,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Part of the oral tradition era in Santo Amaro da Purificação.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Parte da era de tradição oral em Santo Amaro da Purificação.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Boca de Siri was a capoeirista from Santo Amaro da Purificação who trained alongside the legendary Besouro Mangangá in the early 20th century. His name, meaning "Crab''s Mouth", was also later adopted as the name of a capoeira technique - a takedown where the practitioner grabs the cuffs of both legs of the opponent''s pants.\n\nAccording to Professor Leiteiro, Boca de Siri was among the companions of Besouro alongside Paulo Barroquinha, Noca de Jacó, Doze Homens, and Canário Pardo. All were residents of Trapiche de Baixo - described as "the poorest neighborhood of Santo Amaro" - and "were his companions in the memorable capoeira rodas that hypnotized anybody who would go by".\n\nThese Sunday gatherings in Trapiche de Baixo and at folk parties were where the young Besouro first made a name for himself. The group formed what some sources call a "gang of capoeira resistance fighters" who trained together during an era when capoeira was still criminalized under the 1890 penal code.\n\nNothing else is recorded about Boca de Siri - not his full name, his fate, or his individual deeds. Like many of his contemporaries, he exists in history only as a name in the oral tradition, one of the circle of practitioners who helped shape the legendary era of Bahian capoeira in Santo Amaro.',
  E'Boca de Siri foi um capoeirista de Santo Amaro da Purificação que treinou ao lado do lendário Besouro Mangangá no início do século XX. Seu nome, que significa "Boca de Siri", também foi posteriormente adotado como nome de uma técnica de capoeira - uma queda onde o praticante agarra as barras das duas pernas da calça do oponente.\n\nSegundo o Professor Leiteiro, Boca de Siri estava entre os companheiros de Besouro junto com Paulo Barroquinha, Noca de Jacó, Doze Homens e Canário Pardo. Todos eram moradores do Trapiche de Baixo - descrito como "o bairro mais pobre de Santo Amaro" - e "eram seus companheiros nas memoráveis rodas de capoeira que hipnotizavam qualquer um que passasse".\n\nEsses encontros de domingo no Trapiche de Baixo e nas festas populares eram onde o jovem Besouro começou a fazer seu nome. O grupo formava o que algumas fontes chamam de "gangue de lutadores de resistência da capoeira" que treinavam juntos durante uma era em que a capoeira ainda era criminalizada pelo código penal de 1890.\n\nNada mais está registrado sobre Boca de Siri - nem seu nome completo, seu destino, ou seus feitos individuais. Como muitos de seus contemporâneos, ele existe na história apenas como um nome na tradição oral, um do círculo de praticantes que ajudou a moldar a era lendária da capoeira baiana em Santo Amaro.',
  NULL,
  NULL,
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Companion of Besouro Mangangá (b. 1895, d. 1924) in Trapiche de Baixo rodas. As a contemporary adult companion, likely within 5-10 years of Besouro''s age. Using 1890 as midpoint estimate.\n\nDEATH: Unknown. No records found.\n\nNAME: "Boca de Siri" means "Crab''s Mouth". Also the name of a capoeira takedown technique.\n\nPENDING RELATIONSHIPS:\n- Boca de Siri associated_with Besouro Mangangá (companions at Trapiche de Baixo)\n- Boca de Siri associated_with Paulo Barroquinha (companions at Trapiche de Baixo)\n- Boca de Siri associated_with Noca de Jacó (companions at Trapiche de Baixo)\n- Boca de Siri associated_with Doze Homens (companions at Trapiche de Baixo)\n- Boca de Siri associated_with Neco Canário Pardo (companions at Trapiche de Baixo)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Companheiro de Besouro Mangangá (n. 1895, m. 1924) nas rodas do Trapiche de Baixo. Como companheiro adulto contemporâneo, provavelmente dentro de 5-10 anos da idade de Besouro. Usando 1890 como estimativa do ponto médio.\n\nMORTE: Desconhecida. Nenhum registro encontrado.\n\nNOME: "Boca de Siri" significa "Boca de Siri". Também o nome de uma técnica de queda na capoeira.\n\nRELACIONAMENTOS PENDENTES:\n- Boca de Siri associated_with Besouro Mangangá (companheiros no Trapiche de Baixo)\n- Boca de Siri associated_with Paulo Barroquinha (companheiros no Trapiche de Baixo)\n- Boca de Siri associated_with Noca de Jacó (companheiros no Trapiche de Baixo)\n- Boca de Siri associated_with Doze Homens (companheiros no Trapiche de Baixo)\n- Boca de Siri associated_with Neco Canário Pardo (companheiros no Trapiche de Baixo)'
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
