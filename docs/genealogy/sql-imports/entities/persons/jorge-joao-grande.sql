-- ============================================================
-- GENEALOGY PERSON: Jorge (João Grande)
-- Generated: 2026-01-10
-- ============================================================
-- Son of Mestre João Grande (João Oliveira dos Santos), brother
-- of Jurandir Santos (Mestre Jurandir). Trained alongside his
-- brother from early childhood in backyard sessions with their
-- father. Limited documentation available - only referenced in
-- the context of Jurandir Santos's biography.
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1965, decade):
-- - Father João Grande was born January 15, 1933
-- - Brother Jurandir is estimated ~1965 based on father's age
-- - Jorge likely born in same period (mid-1960s to early 1970s)
-- - Using ~1965 with decade precision, same as brother
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Jorge',
  'João Grande',
  NULL,
  NULL,
  NULL,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Capoeira Angola in the tradition of his father Mestre João Grande, transmitted from early childhood through organic, immersive family training. Represents direct continuation of Pastinha''s lineage through one of the "Dois Joãos" (Two Johns).',
  E'Capoeira Angola na tradição de seu pai Mestre João Grande, transmitida desde a primeira infância através de treinamento familiar orgânico e imersivo. Representa continuação direta da linhagem de Pastinha através de um dos "Dois Joãos".',
  -- Life dates
  1965,
  'decade'::genealogy.date_precision,
  'Brazil',
  NULL,
  NULL,
  NULL,
  -- Bio (English)
  E'Jorge is one of six sons of the legendary Mestre João Grande (João Oliveira dos Santos), one of Mestre Pastinha''s two principal heirs. He grew up with capoeira as an integral part of family life.

From childhood, Jorge and his brother Jurandir (now Mestre Jurandir Santos) trained together under their father''s guidance. João Grande would wake his sons early in the morning to practice capoeira in their backyard—a form of organic, immersive transmission that predated the formalization of academy systems. This daily discipline instilled in them a deep connection to Capoeira Angola as a way of life rooted in respect and tradition.

Little is documented about Jorge''s subsequent capoeira journey. While his brother Jurandir continued in the art—becoming a coordinator at Mestre João Pequeno''s academy and later achieving the title of Mestre—Jorge does not appear in the major capoeira directories or databases as an independent practitioner or teacher.

A 1988 newspaper article quoted their father saying that "out of his six sons, none likes capoeira—only boxing and cock-fighting, capoeira they say doesn''t give anything back." This statement, while possibly reflecting a specific period or family dynamics that later changed (given Jurandir''s documented career), suggests that Jorge may not have pursued capoeira professionally despite his early training.

Jorge represents the reality that even in capoeira families with the most prestigious lineage, not all children continue in the art. Yet his early training under one of the greatest masters ensures he carries the knowledge of Pastinha''s tradition in some form.',
  -- Bio (Portuguese)
  E'Jorge é um dos seis filhos do lendário Mestre João Grande (João Oliveira dos Santos), um dos dois principais herdeiros de Mestre Pastinha. Ele cresceu com a capoeira como parte integral da vida familiar.

Desde a infância, Jorge e seu irmão Jurandir (hoje Mestre Jurandir Santos) treinavam juntos sob a orientação do pai. João Grande acordava seus filhos cedo pela manhã para praticar capoeira no quintal—uma forma de transmissão orgânica e imersiva que antecedeu a formalização do sistema de academias. Essa disciplina diária incutiu neles uma conexão profunda com a Capoeira Angola como modo de vida enraizado em respeito e tradição.

Pouco está documentado sobre a trajetória posterior de Jorge na capoeira. Enquanto seu irmão Jurandir continuou na arte—tornando-se coordenador na academia de Mestre João Pequeno e posteriormente alcançando o título de Mestre—Jorge não aparece nos principais diretórios ou bancos de dados de capoeira como praticante ou professor independente.

Um artigo de jornal de 1988 citou o pai dizendo que "dos seus seis filhos, nenhum gosta de capoeira. Só boxe e briga de galo, capoeira – eles dizem – não dá retorno." Essa declaração, embora possivelmente refletindo um período específico ou dinâmicas familiares que depois mudaram (dado a carreira documentada de Jurandir), sugere que Jorge pode não ter seguido a capoeira profissionalmente apesar de seu treinamento inicial.

Jorge representa a realidade de que mesmo em famílias de capoeira com a linhagem mais prestigiosa, nem todos os filhos continuam na arte. Ainda assim, seu treinamento inicial com um dos maiores mestres garante que ele carrega o conhecimento da tradição de Pastinha de alguma forma.',
  -- Achievements (none documented)
  NULL,
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1965, decade):
João Grande was born January 15, 1933. Brother Jurandir is estimated ~1965. Jorge likely born in the same period (mid-1960s to early 1970s). Using 1965 with decade precision.

FAMILY STATUS DISCREPANCY:
Velhos Mestres (1988 article) quotes João Grande: "out of his six sons no-one likes capoeira. Only boxing and cock-fighting, capoeira - they say - doesn''t give anything back." This may be outdated or reflect family dynamics that later changed, as Jurandir became a mestre.

DOCUMENTATION GAP:
Jorge is only mentioned in the context of Jurandir Santos''s biography on CapoeiraHub. He does not have his own profile on any major capoeira database (CapoeiraHub, Lalaue, velhosmestres.com, Wikipedia).

DISTINGUISHING FROM OTHER JORGES:
Uses apelido_context="João Grande" to distinguish from other persons named Jorge in the dataset:
- Jorge Egídio dos Santos (Mestre Jogo de Dentro) - different person, student of João Pequeno
- Jorge Marinha - historical figure from Manduca da Praia era

TEACHERS:
- Mestre João Grande (João Oliveira dos Santos) - Father and teacher (~childhood, Salvador backyard training)

FAMILY:
- Father: Mestre João Grande (João Oliveira dos Santos)
- Brother: Jurandir Santos / Jurandir Souza dos Santos (Mestre Jurandir Santos)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1965, década):
João Grande nasceu em 15 de janeiro de 1933. Irmão Jurandir estimado ~1965. Jorge provavelmente nasceu no mesmo período (meados de 1960 a início de 1970). Usando 1965 com precisão de década.

DISCREPÂNCIA DE STATUS FAMILIAR:
Velhos Mestres (artigo de 1988) cita João Grande: "dos seus seis filhos nenhum gosta de capoeira. Só boxe e briga de galo, capoeira – eles dizem – não dá retorno." Isso pode estar desatualizado ou refletir dinâmicas familiares que depois mudaram, já que Jurandir se tornou mestre.

LACUNA DE DOCUMENTAÇÃO:
Jorge é mencionado apenas no contexto da biografia de Jurandir Santos no CapoeiraHub. Ele não tem seu próprio perfil em nenhum banco de dados importante de capoeira (CapoeiraHub, Lalaue, velhosmestres.com, Wikipedia).

DISTINGUINDO DE OUTROS JORGES:
Usa apelido_context="João Grande" para distinguir de outras pessoas chamadas Jorge no conjunto de dados:
- Jorge Egídio dos Santos (Mestre Jogo de Dentro) - pessoa diferente, aluno de João Pequeno
- Jorge Marinha - figura histórica da era de Manduca da Praia

MESTRES:
- Mestre João Grande (João Oliveira dos Santos) - Pai e professor (~infância, treino no quintal em Salvador)

FAMÍLIA:
- Pai: Mestre João Grande (João Oliveira dos Santos)
- Irmão: Jurandir Santos / Jurandir Souza dos Santos (Mestre Jurandir Santos)'
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
