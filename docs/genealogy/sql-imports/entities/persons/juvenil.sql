-- ============================================================
-- GENEALOGY PERSON: Juvenil
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- Juvenil encountered Leopoldina (b. 1933) around 1951-1952 when
-- Leopoldina was 18-19. Juvenil wore formal attire (hat, vest, tie)
-- suggesting an adult. Given he was an established capoeirista capable
-- of throwing a meia-lua, he was likely in his 20s-30s, placing
-- birth in the mid-1920s.
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
  NULL,
  'Juvenil',
  NULL,  -- No formal title
  NULL,  -- No portrait found
  ARRAY['https://capoeirahistory.com/general/master-leopoldina-part-2/']::text[],
  -- Capoeira-specific
  NULL,  -- Pre-style era; tiririca context
  NULL,
  NULL,
  -- Life dates
  1925,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- Extended content (English)
  E'Juvenil is known from a single but vivid anecdote in Mestre Leopoldina''s testimony to Nestor Capoeira, recorded for the 2005 documentary "Mestre Leopoldina, a Fina Flor da Malandragem".

Around 1951 or 1952, after Leopoldina had been training with Quinzinho for three or four months on Morro da Favela, the two encountered someone who could also play capoeira. This man was called Juvenil. He greeted them and invited the young Leopoldina to spar.

According to Leopoldina: "He took off his hat, vest, tie, and stood naked from the waist up, and we started to play. But as soon as we started playing, he gave me a kick that grazed me on the head".

Quinzinho, who was armed with a pistol hidden under a handkerchief, immediately stood up and pointed the gun at Juvenil''s face. "Don''t do that! Don''t do that, or he''ll become a coward!" he warned.

The incident reveals the informal rules governing street capoeira in 1950s Rio. Quinzinho''s intervention was not because Juvenil had done something illegal - throwing kicks was part of the game - but because attacking a beginner too aggressively could destroy his courage and ruin his development as a capoeirista. It also demonstrates how Quinzinho protected his student and maintained control through intimidation.

Nothing else is known about Juvenil - not his full name, his background, who taught him, or what became of him afterward. He remains an anonymous figure who stepped briefly into the historical record through this single encounter.',
  -- Extended content (Portuguese)
  E'Juvenil é conhecido por uma única, porém vívida, anedota no depoimento de Mestre Leopoldina a Nestor Capoeira, gravado para o documentário de 2005 "Mestre Leopoldina, a Fina Flor da Malandragem".

Por volta de 1951 ou 1952, depois que Leopoldina vinha treinando com Quinzinho por três ou quatro meses no Morro da Favela, os dois encontraram alguém que também sabia jogar capoeira. Esse homem se chamava Juvenil. Ele os cumprimentou e convidou o jovem Leopoldina para jogar.

Segundo Leopoldina: "Ele tirou o chapéu, colete, gravata, e ficou nu da cintura para cima, e a gente começou a jogar. Mas assim que começamos a jogar, ele me deu um chute que raspou na minha cabeça".

Quinzinho, que estava armado com uma pistola escondida sob um lenço, levantou-se imediatamente e apontou a arma na cara de Juvenil. "Não faz isso! Não faz isso, senão ele vai ficar covarde!" alertou.

O incidente revela as regras informais que governavam a capoeira de rua no Rio dos anos 1950. A intervenção de Quinzinho não foi porque Juvenil tinha feito algo ilegal - dar chutes fazia parte do jogo - mas porque atacar um iniciante com muita agressividade poderia destruir sua coragem e arruinar seu desenvolvimento como capoeirista. Também demonstra como Quinzinho protegia seu aluno e mantinha controle através da intimidação.

Nada mais se sabe sobre Juvenil - nem seu nome completo, sua origem, quem o ensinou, ou o que aconteceu com ele depois. Ele permanece uma figura anônima que entrou brevemente no registro histórico através deste único encontro.',
  -- Achievements
  NULL,
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1925, decade precision):
Juvenil encountered Leopoldina (b. 1933) around 1951-1952 when Leopoldina was 18-19. Juvenil wore formal attire (hat, vest, tie) suggesting an adult. Given he was an established capoeirista capable of throwing a meia-lua, he was likely in his 20s-30s, placing birth in the mid-1920s.

SINGLE SOURCE:
The only documentation for Juvenil is Mestre Leopoldina''s testimony to Nestor Capoeira, included in the 2005 documentary "Mestre Leopoldina, a Fina Flor da Malandragem". No other sources mention him.

FULL NAME: Unknown.

TEACHERS: Unknown.

STUDENTS: Unknown.

CONTEXT:
Juvenil was NOT a student of Quinzinho. He was described as "someone who could also play" - an independent capoeirista they encountered on the street who already knew capoeira techniques (demonstrated meia-lua kick).',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1925, precisão de década):
Juvenil encontrou Leopoldina (n. 1933) por volta de 1951-1952 quando Leopoldina tinha 18-19 anos. Juvenil usava traje formal (chapéu, colete, gravata) sugerindo ser adulto. Dado que era um capoeirista estabelecido capaz de aplicar uma meia-lua, provavelmente tinha entre 20 e 30 anos, situando o nascimento em meados da década de 1920.

FONTE ÚNICA:
A única documentação sobre Juvenil é o depoimento de Mestre Leopoldina a Nestor Capoeira, incluído no documentário de 2005 "Mestre Leopoldina, a Fina Flor da Malandragem". Nenhuma outra fonte o menciona.

NOME COMPLETO: Desconhecido.

MESTRES: Desconhecido.

ALUNOS: Desconhecido.

CONTEXTO:
Juvenil NÃO era aluno de Quinzinho. Ele foi descrito como "alguém que também sabia jogar" - um capoeirista independente que encontraram na rua que já conhecia técnicas de capoeira (demonstrou chute de meia-lua).'
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
