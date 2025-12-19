-- ============================================================
-- GENEALOGY PERSON: Pequena (Maria Bispo)
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1910, decade):
-- Wife of José Martins dos Santos (~1900) and mother of Mestre Curió
-- (born 1937). Assuming typical childbearing age of 25-35 years,
-- Maria was likely born between 1902-1912. Using 1910 as midpoint
-- estimate with decade precision.
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
  'Maria Bispo',
  'Pequena',
  NULL,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Maria Bispo, known as Pequena, was a capoeirista and normalista (teacher) from Santo Amaro, Bahia. She is the mother of Mestre Curió, one of Capoeira Angola''s most revered guardians, and represents the often-overlooked maternal line of capoeira transmission in the early 20th century.

Maria came from a family of angoleiros in Santo Amaro da Purificação, in the Recôncavo Baiano—a region central to capoeira''s development. Her sister also practiced capoeira, indicating that the art was not limited to men in her family. This tradition of female practitioners in Santo Amaro, while rarely documented, was part of the broader fabric of capoeira culture that included figures like Maria Homem, Julia Fogareira, and other legendary capoeiristas listed by Mestre Pastinha.

Maria married José Martins dos Santos (known as Malvadeza or Martim da Pemba), himself a capoeirista and the son of Pedro Virício (Curió Velho). Together they formed a household where capoeira was not merely practiced but lived. The depth of their commitment to the art is demonstrated by a remarkable fact: Maria gave birth to their son Jaime within a roda de capoeira.

Jaime Martins dos Santos was born on January 23, 1937, in Candeias, Bahia. From age six, he would be trained in capoeira by both his father and grandfather, eventually becoming the celebrated Mestre Curió. Mestre Curió speaks of his family with pride: "I have my whole family of capoeiristas"—including not only his father and grandfather but also his mother and aunt.

Maria Bispo''s profession as a normalista (a graduate of a normal school, qualified to teach primary education) suggests she was an educated woman, relatively uncommon for Afro-Brazilian women of her era. This combination of formal education and traditional knowledge of capoeira made her a bridge between two worlds.

While little additional documentation survives about Maria Bispo''s individual capoeira practice, her presence in this remarkable family—as wife, mother, and practitioner—helped create the conditions for one of the most complete transmissions of Capoeira Angola tradition from the pre-prohibition era to the present day.',
  -- bio_pt
  E'Maria Bispo, conhecida como Pequena, foi uma capoeirista e normalista de Santo Amaro, Bahia. Ela é a mãe de Mestre Curió, um dos mais reverenciados guardiões da Capoeira Angola, e representa a linha materna frequentemente negligenciada da transmissão de capoeira no início do século XX.

Maria veio de uma família de angoleiros em Santo Amaro da Purificação, no Recôncavo Baiano—uma região central para o desenvolvimento da capoeira. Sua irmã também praticava capoeira, indicando que a arte não era limitada aos homens em sua família. Esta tradição de praticantes femininas em Santo Amaro, embora raramente documentada, fazia parte do tecido mais amplo da cultura da capoeira que incluía figuras como Maria Homem, Júlia Fogareira e outras capoeiristas lendárias listadas por Mestre Pastinha.

Maria casou-se com José Martins dos Santos (conhecido como Malvadeza ou Martim da Pemba), ele próprio capoeirista e filho de Pedro Virício (Curió Velho). Juntos formaram um lar onde a capoeira não era apenas praticada mas vivida. A profundidade de seu compromisso com a arte é demonstrada por um fato notável: Maria deu à luz seu filho Jaime dentro de uma roda de capoeira.

Jaime Martins dos Santos nasceu em 23 de janeiro de 1937, em Candeias, Bahia. A partir dos seis anos, ele seria treinado em capoeira por seu pai e avô, eventualmente se tornando o celebrado Mestre Curió. Mestre Curió fala de sua família com orgulho: "Eu tenho toda minha família de capoeiras"—incluindo não apenas seu pai e avô mas também sua mãe e tia.

A profissão de Maria Bispo como normalista (graduada de uma escola normal, qualificada para ensinar educação primária) sugere que ela era uma mulher educada, relativamente incomum para mulheres afro-brasileiras de sua época. Esta combinação de educação formal e conhecimento tradicional de capoeira a tornou uma ponte entre dois mundos.

Embora pouca documentação adicional sobreviva sobre a prática individual de capoeira de Maria Bispo, sua presença nesta família notável—como esposa, mãe e praticante—ajudou a criar as condições para uma das transmissões mais completas da tradição da Capoeira Angola da era pré-proibição até os dias atuais.',
  -- achievements_en
  E'Part of multi-generational capoeira family; Gave birth to Mestre Curió within a roda de capoeira; Normalista (qualified teacher); Helped transmit Angola tradition to next generation',
  -- achievements_pt
  E'Parte de família de capoeira multi-geracional; Deu à luz Mestre Curió dentro de uma roda de capoeira; Normalista (professora qualificada); Ajudou a transmitir tradição Angola para próxima geração',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1910, decade):
Wife of José Martins dos Santos (~1900) and mother of Mestre Curió (born 1937). Assuming typical childbearing age of 25-35 years, Maria was likely born between 1902-1912. Using 1910 as midpoint estimate with decade precision.

NAME:
- Full name: Maria Bispo
- Apelido: "Pequena" (meaning "Small" or "Little one")

OCCUPATION: Normalista (teacher qualified through normal school)

FAMILY:
- Husband: José Martins dos Santos (Malvadeza)
- Son: Jaime Martins dos Santos (Mestre Curió, b. 1937)
- Father-in-law: Pedro Virício (Curió Velho)
- Sister: unnamed, also practiced capoeira
- Came from a family of angoleiros from Santo Amaro

NOTABLE DETAIL:
Gave birth to Mestre Curió within a roda de capoeira, according to tribunademinas.com interview.

HISTORICAL CONTEXT:
One of the female capoeiristas practicing in the early 20th century. While rare, female practitioners did exist, as documented by Mestre Pastinha''s 1967 list including Maria Homem, Júlia Fogareira, Palmeirona, and Maria Pernambucana.

LIMITED DOCUMENTATION:
Very little individual documentation exists about Maria Bispo''s capoeira practice. Most information comes from accounts about her son Mestre Curió and his family background. No death date found in sources.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1910, década):
Esposa de José Martins dos Santos (~1900) e mãe de Mestre Curió (nascido 1937). Assumindo idade típica de maternidade de 25-35 anos, Maria provavelmente nasceu entre 1902-1912. Usando 1910 como estimativa média com precisão de década.

NOME:
- Nome completo: Maria Bispo
- Apelido: "Pequena"

PROFISSÃO: Normalista (professora qualificada através de escola normal)

FAMÍLIA:
- Marido: José Martins dos Santos (Malvadeza)
- Filho: Jaime Martins dos Santos (Mestre Curió, n. 1937)
- Sogro: Pedro Virício (Curió Velho)
- Irmã: sem nome, também praticava capoeira
- Veio de uma família de angoleiros de Santo Amaro

DETALHE NOTÁVEL:
Deu à luz Mestre Curió dentro de uma roda de capoeira, segundo entrevista do tribunademinas.com.

CONTEXTO HISTÓRICO:
Uma das capoeiristas femininas praticando no início do século XX. Embora raras, praticantes femininas existiam, conforme documentado pela lista de 1967 de Mestre Pastinha incluindo Maria Homem, Júlia Fogareira, Palmeirona e Maria Pernambucana.

DOCUMENTAÇÃO LIMITADA:
Existe muito pouca documentação individual sobre a prática de capoeira de Maria Bispo. A maioria das informações vem de relatos sobre seu filho Mestre Curió e sua origem familiar. Nenhuma data de falecimento encontrada nas fontes.'
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
