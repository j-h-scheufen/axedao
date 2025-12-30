-- ============================================================
-- GENEALOGY PERSON: Jurandir Santos
-- Generated: 2025-12-29
-- ============================================================
-- Son of Mestre João Grande; trained from early childhood
-- alongside brother Jorge; coordinator at João Pequeno's academy
--
-- DISTINCT FROM:
-- - Jurandir (Bimba 1949) - Bimba student who fought Cirandinha (uses apelido_context='Bimba 1949')
-- - Jurandir Nascimento - GCAP pioneer, FICA co-founder (uses apelido='Jurandir Nascimento')
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Jurandir Souza dos Santos',
  'Jurandir Santos',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeirahub.net/mestres']::text[],
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of his father Mestre João Grande, transmitted from early childhood. As a coordinator at João Pequeno''s academy, he represents the direct continuation of Pastinha''s lineage through both the Dois Joãos (Two Johns).',
  E'Capoeira Angola pura na tradição de seu pai Mestre João Grande, transmitida desde a primeira infância. Como coordenador na academia de João Pequeno, representa a continuação direta da linhagem de Pastinha através dos Dois Joãos.',
  1965, 'decade'::genealogy.date_precision, 'Brazil',
  NULL, NULL, NULL,
  -- Bio EN
  E'Jurandir Souza dos Santos was born into the heart of Capoeira Angola. As the son of the legendary Mestre João Grande—one of Mestre Pastinha''s two principal heirs alongside João Pequeno—capoeira was woven into his life from the earliest age.

From childhood, capoeira was not a separate activity but an integral part of family life. His father would wake Jurandir and his brother Jorge early in the morning to train together in their backyard, instilling in them a deep connection to the art—not just as a practice, but as a way of life rooted in discipline, respect, and tradition.

This immersive upbringing gave Jurandir a unique understanding of Capoeira Angola''s essence, learning directly from one of its greatest living masters in an environment where the art was passed on organically, as it had been for generations before the academy system formalized transmission.

In Salvador, Jurandir became one of the coordinators at the Academia de Mestre João Pequeno de Pastinha, located at Forte Santo Antônio Além do Carmo. The academy''s administrative structure placed João Pequeno as Grão Mestre at the top, with coordinators responsible for different training periods. Jurandir, alongside Contramestre Aranha (Isaac Damasceno) who handled morning classes and Treinel Zoinho (Everaldo Santos), was responsible for training sessions in the evening period.

His role at João Pequeno''s academy was particularly significant given that João Pequeno had been his father''s partner at Pastinha''s original school. Thus Jurandir represents a rare case of second-generation continuation through both primary lines of Pastinha''s lineage—trained by his father João Grande while teaching at João Pequeno''s academy.

Jurandir was featured in the documentary "Mestre Pastinha, Rei da Capoeira" (2019), which highlighted how Pastinha''s legacy continues through subsequent generations of practitioners.

Today, Mestre Jurandir Santos lives in New York and continues to be active in the international Capoeira Angola community, participating in workshops and events organized by CECA affiliates and maintaining the connection between Salvador and the global diaspora that his father helped establish.',
  -- Bio PT
  E'Jurandir Souza dos Santos nasceu no coração da Capoeira Angola. Como filho do lendário Mestre João Grande—um dos dois principais herdeiros de Mestre Pastinha ao lado de João Pequeno—a capoeira foi entrelaçada em sua vida desde a mais tenra idade.

Desde a infância, a capoeira não era uma atividade separada, mas uma parte integral da vida familiar. Seu pai acordava Jurandir e seu irmão Jorge cedo pela manhã para treinar juntos no quintal, incutindo neles uma conexão profunda com a arte—não apenas como prática, mas como modo de vida enraizado em disciplina, respeito e tradição.

Essa criação imersiva deu a Jurandir uma compreensão única da essência da Capoeira Angola, aprendendo diretamente de um de seus maiores mestres vivos em um ambiente onde a arte era transmitida organicamente, como havia sido por gerações antes do sistema de academias formalizar a transmissão.

Em Salvador, Jurandir tornou-se um dos coordenadores na Academia de Mestre João Pequeno de Pastinha, localizada no Forte Santo Antônio Além do Carmo. A estrutura administrativa da academia colocava João Pequeno como Grão Mestre no topo, com coordenadores responsáveis por diferentes períodos de treino. Jurandir, ao lado de Contramestre Aranha (Isaac Damasceno), que cuidava das aulas da manhã, e Treinel Zoinho (Everaldo Santos), era responsável pelas sessões de treino no período da noite.

Seu papel na academia de João Pequeno foi particularmente significativo dado que João Pequeno havia sido parceiro de seu pai na escola original de Pastinha. Assim, Jurandir representa um caso raro de continuação de segunda geração através de ambas as linhas primárias da linhagem de Pastinha—treinado por seu pai João Grande enquanto ensinava na academia de João Pequeno.

Jurandir foi destaque no documentário "Mestre Pastinha, Rei da Capoeira" (2019), que destacou como o legado de Pastinha continua através das gerações subsequentes de praticantes.

Hoje, Mestre Jurandir Santos vive em Nova York e continua ativo na comunidade internacional de Capoeira Angola, participando de workshops e eventos organizados por afiliados do CECA e mantendo a conexão entre Salvador e a diáspora global que seu pai ajudou a estabelecer.',
  -- Achievements EN
  E'- Coordinator at Academia de Mestre João Pequeno de Pastinha, Forte Santo Antônio (evening training sessions)
- Featured in documentary "Mestre Pastinha, Rei da Capoeira" (2019)
- Workshop leader at CECA-Londrina and other CECA affiliates
- Mestre of Capoeira Angola (title progression from Contramestre)
- Second-generation continuation of Pastinha lineage through both primary lines (trained by João Grande, taught at João Pequeno''s academy)',
  -- Achievements PT
  E'- Coordenador na Academia de Mestre João Pequeno de Pastinha, Forte Santo Antônio (treinos do período noturno)
- Destaque no documentário "Mestre Pastinha, Rei da Capoeira" (2019)
- Oficineiro no CECA-Londrina e outros afiliados do CECA
- Mestre de Capoeira Angola (progressão de título a partir de Contramestre)
- Continuação de segunda geração da linhagem de Pastinha através de ambas as linhas primárias (treinado por João Grande, ensinou na academia de João Pequeno)',
  -- Notes EN
  E'TITLE PROGRESSION:
- Was "Contramestre Jurandir" at João Pequeno''s academy (1library.org academic source)
- Currently listed as "Mestre" on CapoeiraHub profile
- Title elevation date unknown

BIRTH YEAR ESTIMATION (~1965, decade):
No birth year found in sources. João Grande was born 1933. If Jurandir is his son and started training in childhood, he was likely born 1960s-1970s. Estimated ~1965 based on father''s birth year and contextual evidence.

FAMILY:
- Father: Mestre João Grande (João Oliveira dos Santos)
- Brother: Jorge (also trained by João Grande from early morning sessions)
- Note: Velhos Mestres (2007) article quotes João Grande saying "out of his six sons no-one likes capoeira"—this may be outdated or inaccurate given Jurandir''s documented career

LOCATION:
- CapoeiraHub lists: "Ilha de Itaparica, Bahia, Brasil"
- Documentary article (2019): "currently lives in New York"
- Likely has connections to both locations

ROLE AT JOÃO PEQUENO''S ACADEMY:
- Coordinator for evening training sessions
- Worked alongside Contramestre Aranha (Isaac Damasceno, morning) and Treinel Zoinho (Everaldo Santos)

DISTINCT FROM OTHER JURANDIRS:
- NOT Jurandir (Bimba 1949): Bimba student who fought Cirandinha at 1949 challenge
- NOT Jurandir Nascimento: GCAP pioneer, FICA co-founder, born Rio de Janeiro ~1955

SOURCES CONSULTED:
- CapoeiraHub mestre profiles (confirms son of João Grande, brother Jorge, childhood training)
- 1library.org academic article on CECA hierarchical structures (confirms coordinator role)
- leiamaisba.com.br documentary article (2019) confirms son of João Grande, lives in New York
- id-cultura.londrina.pr.gov.br CECA-Londrina project (workshop participant)',
  -- Notes PT
  E'PROGRESSÃO DE TÍTULO:
- Era "Contramestre Jurandir" na academia de João Pequeno (fonte acadêmica 1library.org)
- Atualmente listado como "Mestre" no perfil do CapoeiraHub
- Data da elevação de título desconhecida

ESTIMATIVA DE ANO DE NASCIMENTO (~1965, década):
Nenhum ano de nascimento encontrado nas fontes. João Grande nasceu em 1933. Se Jurandir é seu filho e começou a treinar na infância, provavelmente nasceu nos anos 1960-1970. Estimado ~1965 baseado no ano de nascimento do pai e evidências contextuais.

FAMÍLIA:
- Pai: Mestre João Grande (João Oliveira dos Santos)
- Irmão: Jorge (também treinado por João Grande nas sessões matinais)
- Nota: Artigo do Velhos Mestres (2007) cita João Grande dizendo "de seus seis filhos nenhum gosta de capoeira"—pode estar desatualizado ou impreciso dado a carreira documentada de Jurandir

LOCALIZAÇÃO:
- CapoeiraHub lista: "Ilha de Itaparica, Bahia, Brasil"
- Artigo sobre documentário (2019): "atualmente mora em Nova York"
- Provavelmente tem conexões com ambos os locais

FUNÇÃO NA ACADEMIA DE JOÃO PEQUENO:
- Coordenador para sessões de treino noturnas
- Trabalhou ao lado de Contramestre Aranha (Isaac Damasceno, manhã) e Treinel Zoinho (Everaldo Santos)

DISTINTO DE OUTROS JURANDIRS:
- NÃO É Jurandir (Bimba 1949): Aluno de Bimba que lutou contra Cirandinha no desafio de 1949
- NÃO É Jurandir Nascimento: Pioneiro do GCAP, co-fundador da FICA, nascido no Rio de Janeiro ~1955

FONTES CONSULTADAS:
- Perfis de mestres do CapoeiraHub (confirma filho de João Grande, irmão Jorge, treino na infância)
- Artigo acadêmico do 1library.org sobre estruturas hierárquicas do CECA (confirma função de coordenador)
- leiamaisba.com.br artigo sobre documentário (2019) confirma filho de João Grande, mora em Nova York
- id-cultura.londrina.pr.gov.br projeto CECA-Londrina (participante de oficinas)'
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
