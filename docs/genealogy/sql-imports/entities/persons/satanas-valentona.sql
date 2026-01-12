-- ============================================================
-- GENEALOGY PERSON: Satanás (Valentona)
-- Generated: 2026-01-11
-- ============================================================
-- DISTINCT from Roberto Satanás (male, Pastinha student, born 1943)
-- This is the female capoeirista of the 1930s-1940s Salvador era
-- who disguised as a man to participate in rodas.
--
-- NOTE: Uses apelido_context to distinguish from Roberto Satanás
-- ============================================================
-- BIRTH YEAR ESTIMATION: No birth date available. Active in 1930s-1940s.
-- If adult (18-35) during this period, born approximately 1895-1925.
-- Using 1910 with decade precision as midpoint estimate.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  'Satanás',
  'valentona',
  NULL,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/capoeira-mulheres/a-mulher-na-capoeira-2/', 'https://capoeira-connection.com/capoeira/2011/10/women-in-capoeira/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained under Mestre Bimba in the formative years of Capoeira Regional during the 1940s-1950s. Part of the pioneering generation of women who entered Bimba''s academy.',
  E'Treinou com Mestre Bimba nos anos formativos da Capoeira Regional durante os anos 1940-1950. Parte da geração pioneira de mulheres que entraram na academia de Bimba.',
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Satanás was one of the few women who practiced capoeira in Salvador during the 1930s and 1940s - an era when the art was deeply hostile to female participation. She was part of a small but determined group of women who reportedly "se fizeram passar por homens" (disguised themselves as men) to gain acceptance in the male-dominated rodas of capoeira.\n\nAccording to the capoeira oral tradition, she received her cruel apelido "Satanás" (Satan) because "por ser muito feia ninguém a queria" (being very ugly, no one wanted her). While such nicknames seem harsh by modern standards, they reflect the rough street culture of early 20th century Bahian capoeiragem, where apelidos often referenced physical characteristics, circumstances of life, or notorious deeds.\n\nSatanás is listed alongside Maria 12 Homens, Calça Rala, Nega Didi, and Maria Pára o Bonde as one of the "grandes referências femininas" (great female references) of strength, courage, and determination from this era. These women became known as valentonas - brave, tough women who defied social norms to practice an art form that was both criminalized and explicitly coded as masculine.\n\nSome sources indicate that Satanás was among the students of Mestre Bimba, who opened Salvador''s first formal capoeira academy. Bimba was notable for accepting women into his academy during a time when this was controversial. However, he faced ongoing challenges: his female classes reportedly never completed full courses due to social pressures including interference from jealous boyfriends, pregnancies, and romantic entanglements with male students.\n\nNo civil name, specific dates, or detailed biographical information survive for Satanás. Like many women of her era, her story exists primarily in the realm of oral tradition and collective memory, preserved in the mentions by later researchers documenting the forgotten history of women in early capoeira.\n\nIt is important to distinguish this Satanás from Roberto Satanás (Roberto Barreto Pereira, born 1943), a male student of Mestre Pastinha who traveled to Dakar in 1966 and sang on the historic 1969 LP. These are two completely different individuals.',
  E'Satanás foi uma das poucas mulheres que praticaram capoeira em Salvador durante os anos 1930 e 1940 - uma era em que a arte era profundamente hostil à participação feminina. Ela fazia parte de um pequeno mas determinado grupo de mulheres que supostamente "se fizeram passar por homens" para ganhar aceitação nas rodas de capoeira dominadas por homens.\n\nDe acordo com a tradição oral da capoeira, ela recebeu seu cruel apelido "Satanás" porque "por ser muito feia ninguém a queria". Embora tais apelidos pareçam duros pelos padrões modernos, eles refletem a cultura de rua áspera da capoeiragem baiana do início do século XX, onde apelidos frequentemente referenciavam características físicas, circunstâncias de vida ou feitos notórios.\n\nSatanás é listada ao lado de Maria 12 Homens, Calça Rala, Nega Didi e Maria Pára o Bonde como uma das "grandes referências femininas" de força, coragem e determinação desta era. Essas mulheres ficaram conhecidas como valentonas - mulheres corajosas e duras que desafiaram as normas sociais para praticar uma forma de arte que era tanto criminalizada quanto explicitamente codificada como masculina.\n\nAlgumas fontes indicam que Satanás estava entre as alunas de Mestre Bimba, que abriu a primeira academia formal de capoeira de Salvador. Bimba era notável por aceitar mulheres em sua academia durante um tempo em que isso era controverso. No entanto, ele enfrentou desafios contínuos: suas turmas femininas supostamente nunca completaram cursos completos devido a pressões sociais incluindo interferência de namorados ciumentos, gravidez e envolvimentos românticos com alunos masculinos.\n\nNenhum nome civil, datas específicas ou informações biográficas detalhadas sobrevivem para Satanás. Como muitas mulheres de sua era, sua história existe principalmente no reino da tradição oral e da memória coletiva, preservada nas menções de pesquisadores posteriores que documentaram a história esquecida das mulheres na capoeira antiga.\n\nÉ importante distinguir esta Satanás de Roberto Satanás (Roberto Barreto Pereira, nascido em 1943), um aluno masculino de Mestre Pastinha que viajou a Dacar em 1966 e cantou no histórico LP de 1969. São dois indivíduos completamente diferentes.',
  E'One of the pioneering female capoeiristas of 1930s-1940s Salvador who disguised as a man to participate in rodas',
  E'Uma das pioneiras capoeiristas mulheres de Salvador dos anos 1930-1940 que se disfarçou de homem para participar das rodas',
  -- Researcher notes
  E'IDENTITY DISTINCTION:\nThis Satanás is a FEMALE capoeirista (valentona) of the 1930s-1940s, DISTINCT from:\n- Roberto Satanás (Roberto Barreto Pereira, male, born Dec 23 1943, Pastinha student, Dakar 1966)\n\nNAME ORIGIN:\n"Satanás" (Satan) - Per Espeto Capoeira source: "por ser muito feia ninguém a queria, por isso recebeu esse maldoso apelido" (being very ugly no one wanted her, so she received this cruel nickname).\n\nBIRTH YEAR ESTIMATION (1910, decade precision):\nActive "entre os anos 30 e 40" (between the years 30 and 40). If adult practitioner (18-35) during this period, born approximately 1895-1925. Using 1910 as midpoint.\n\nTEACHER:\n- Mestre Bimba (per Capoeira Connection: "all students of Mestre Bimba")\n\nCONTEMPORARIES (1930s-1940s female capoeiristas who disguised as men):\n- Maria 12 Homens (Maria Doze Homens) - in dataset\n- Calça Rala\n- Nega Didi\n- Maria Pára o Bonde\n\nDOCUMENTATION GAP:\n- No civil name recorded\n- No specific dates beyond "1930s-1940s"\n- "Viveu sem registros" (lived without records)\n- Story preserved only in oral tradition',
  E'DISTINÇÃO DE IDENTIDADE:\nEsta Satanás é uma capoeirista FEMININA (valentona) dos anos 1930-1940, DISTINTA de:\n- Roberto Satanás (Roberto Barreto Pereira, masculino, nascido 23 dez 1943, aluno de Pastinha, Dacar 1966)\n\nORIGEM DO NOME:\n"Satanás" - Segundo fonte Espeto Capoeira: "por ser muito feia ninguém a queria, por isso recebeu esse maldoso apelido".\n\nESTIMATIVA DO ANO DE NASCIMENTO (1910, precisão de década):\nAtiva "entre os anos 30 e 40". Se praticante adulta (18-35) durante este período, nascida aproximadamente 1895-1925. Usando 1910 como ponto médio.\n\nMESTRE:\n- Mestre Bimba (per Capoeira Connection: "todas alunas de Mestre Bimba")\n\nCONTEMPORÂNEAS (capoeiristas femininas dos anos 1930-1940 que se disfarçaram de homens):\n- Maria 12 Homens (Maria Doze Homens) - no dataset\n- Calça Rala\n- Nega Didi\n- Maria Pára o Bonde\n\nLACUNA DE DOCUMENTAÇÃO:\n- Nenhum nome civil registrado\n- Nenhuma data específica além de "anos 1930-1940"\n- "Viveu sem registros"\n- História preservada apenas na tradição oral'
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
