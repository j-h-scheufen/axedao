-- ============================================================
-- GENEALOGY PERSON: Torpedo (Bimba lineage)
-- Generated: 2026-01-12
-- ============================================================
-- CONTEXT: Uses apelido_context 'Bimba' to distinguish from Torpedo
-- in the Roque/Poeira lineage (Philippines/Australia).
--
-- MINIMAL INFORMATION AVAILABLE: This person is only documented as
-- one of Mestre Camisa's graduation companions from Mestre Bimba's
-- academy in 1969. No additional biographical information exists
-- in available sources - no full name, no title, no career details.
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
  NULL, -- Full name unknown
  'Torpedo',
  'Bimba', -- Context to distinguish from other Torpedos
  NULL, -- No title documented
  NULL, -- No portrait available
  NULL, -- No stable public links available
  -- Capoeira-specific
  'regional'::genealogy.style,
  NULL, -- No style notes
  NULL,
  -- Life dates
  1955, -- Estimated: graduated 1969, likely similar age to Camisa (born 1955)
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown
  NULL, -- Death year unknown
  NULL,
  NULL, -- Death place unknown
  -- bio_en
  E'Torpedo was a student of Mestre Bimba who graduated as aluno formado from the Centro de Cultura Física Regional in Salvador in 1969. He was one of four graduation companions that year, alongside Camisa (José Tadeu Carneiro Cardoso), Macarrão, and Onça Negra. The formatura ceremony took place at Mestre Bimba''s site in Nordeste de Amaralina and featured the traditional rituals of Capoeira Regional: prova de fogo (trial by fire), demonstrations of cintura desprezada, benguela games, and samba de roda until dawn.

No further information about Torpedo''s capoeira career after graduation has been documented. His full name, title (if any), and subsequent activities remain unknown. He should not be confused with Mestre Torpedo of the Roque/Poeira lineage, who is active in the Philippines and Australia.',
  -- bio_pt
  E'Torpedo foi um aluno de Mestre Bimba que se formou como aluno formado do Centro de Cultura Física Regional em Salvador em 1969. Ele foi um dos quatro companheiros de formatura naquele ano, junto com Camisa (José Tadeu Carneiro Cardoso), Macarrão e Onça Negra. A cerimônia de formatura aconteceu no sítio de Mestre Bimba no Nordeste de Amaralina e contou com os rituais tradicionais da Capoeira Regional: prova de fogo, demonstrações de cintura desprezada, jogos de benguela e samba de roda até o amanhecer.

Nenhuma informação adicional sobre a carreira de capoeira de Torpedo após a formatura foi documentada. Seu nome completo, título (se houver) e atividades subsequentes permanecem desconhecidos. Ele não deve ser confundido com Mestre Torpedo da linhagem Roque/Poeira, que é ativo nas Filipinas e Austrália.',
  -- achievements_en
  E'Graduated as aluno formado from Mestre Bimba''s Centro de Cultura Física Regional (1969)',
  -- achievements_pt
  E'Formou-se como aluno formado do Centro de Cultura Física Regional de Mestre Bimba (1969)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1955, decade):
Graduated alongside Camisa in 1969. Camisa was born October 28, 1955 and graduated at age 14.
Assuming similar age range for graduation companions, estimating mid-1950s birth.
Using decade precision due to lack of any corroborating evidence.

DISAMBIGUATION:
This Torpedo (apelido_context = ''Bimba'') is DISTINCT from Mestre Torpedo in the Roque/Poeira lineage:
- Torpedo (Bimba): Student of Mestre Bimba, graduated 1969 in Salvador
- Torpedo (Poeira lineage): Student of Mestre Cabeça, active in Philippines/Australia, teacher of Mestre Lobo

TRAINING COMPANIONS AT BIMBA''S ACADEMY:
According to Mestre Camisa: "Com eu era Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval"
(With me were Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga, and Demerval)

GRADUATION COMPANIONS (1969):
- Camisa (José Tadeu Carneiro Cardoso) - later founded ABADÁ-Capoeira
- Macarrão - no further information
- Onça Negra - no further information (distinct from Onça Preta)

GRADUATION CEREMONY DETAILS:
- Location: Sítio Coroano, Nordeste de Amaralina, Salvador
- Featured: Traditional stories by Mestre Bimba, rituals, prova de fogo, cintura desprezada demonstrations, benguela games, games with renowned capoeiristas and senior graduates, samba de roda until dawn
- Camisa''s madrinha (godmother): his sister Noemilde

RESEARCH GAPS:
- Full name unknown
- Title (if any) unknown
- Post-graduation career unknown
- Current status (living/deceased) unknown
- No portrait or photographs identified',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1955, década):
Formou-se junto com Camisa em 1969. Camisa nasceu em 28 de outubro de 1955 e formou-se aos 14 anos.
Assumindo faixa etária similar para companheiros de formatura, estimando nascimento em meados dos anos 1950.
Usando precisão de década devido à falta de qualquer evidência corroborante.

DESAMBIGUAÇÃO:
Este Torpedo (apelido_context = ''Bimba'') é DISTINTO de Mestre Torpedo na linhagem Roque/Poeira:
- Torpedo (Bimba): Aluno de Mestre Bimba, formado em 1969 em Salvador
- Torpedo (linhagem Poeira): Aluno de Mestre Cabeça, ativo nas Filipinas/Austrália, mestre de Mestre Lobo

COMPANHEIROS DE TREINO NA ACADEMIA DE BIMBA:
Segundo Mestre Camisa: "Com eu era Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval"

COMPANHEIROS DE FORMATURA (1969):
- Camisa (José Tadeu Carneiro Cardoso) - posteriormente fundou a ABADÁ-Capoeira
- Macarrão - sem mais informações
- Onça Negra - sem mais informações (distinto de Onça Preta)

DETALHES DA CERIMÔNIA DE FORMATURA:
- Local: Sítio Coroano, Nordeste de Amaralina, Salvador
- Incluiu: Histórias tradicionais de Mestre Bimba, rituais, prova de fogo, demonstrações de cintura desprezada, jogos de benguela, jogos com capoeiristas renomados e formados antigos, samba de roda até o amanhecer
- Madrinha de Camisa: sua irmã Noemilde

LACUNAS DE PESQUISA:
- Nome completo desconhecido
- Título (se houver) desconhecido
- Carreira pós-formatura desconhecida
- Status atual (vivo/falecido) desconhecido
- Nenhum retrato ou fotografia identificada'
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
