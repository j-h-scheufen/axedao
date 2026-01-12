-- ============================================================
-- GENEALOGY PERSON: Macarrão (Bimba lineage)
-- Generated: 2026-01-12
-- ============================================================
-- MINIMAL INFORMATION AVAILABLE: This person is only documented as
-- one of Mestre Camisa's graduation companions from Mestre Bimba's
-- academy in 1969. No additional biographical information exists
-- in available sources - no full name, no title, no career details.
--
-- DISAMBIGUATION: This Macarrão is DISTINCT from:
-- - Mestre Macarrão (Marcelo Santana Mota, born 1983) - IPHAN #2920, Grupo Raça, Contemporânea
-- - Professor Macarrão (Danilo Portugal) - Capoeira Luanda, Bay Area
-- - Macarrão (Medicina) - Student of Mestre Medicina, different lineage
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
  'Macarrão',
  'Bimba', -- Context to distinguish from other Macarrãos
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
  E'Macarrão was a student of Mestre Bimba who graduated as aluno formado from the Centro de Cultura Física Regional in Salvador in 1969. He was one of four graduation companions that year, alongside Camisa (José Tadeu Carneiro Cardoso), Onça Negra, and Torpedo. The formatura ceremony took place at Mestre Bimba''s site at Sítio Caruano in Nordeste de Amaralina and featured the traditional rituals of Capoeira Regional: prova de fogo (trial by fire), demonstrations of cintura desprezada, benguela games, matches with renowned capoeiristas and senior graduates, and samba de roda until dawn.

According to Mestre Camisa''s recollection, his training companions at Bimba''s academy included "Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga, and Demerval." This places Macarrão within the propagation phase of Capoeira Regional (1967-1973), training alongside future mestres and the mestre''s own sons.

No further information about Macarrão''s capoeira career after graduation has been documented. His full name, title (if any), and subsequent activities remain unknown. He should not be confused with other capoeiristas who share the same apelido.',
  -- bio_pt
  E'Macarrão foi um aluno de Mestre Bimba que se formou como aluno formado do Centro de Cultura Física Regional em Salvador em 1969. Ele foi um dos quatro companheiros de formatura naquele ano, junto com Camisa (José Tadeu Carneiro Cardoso), Onça Negra e Torpedo. A cerimônia de formatura aconteceu no sítio de Mestre Bimba no Sítio Caruano, Nordeste de Amaralina, e contou com os rituais tradicionais da Capoeira Regional: prova de fogo, demonstrações de cintura desprezada, jogos de benguela, jogos com capoeiristas renomados e formados antigos, e samba de roda até o amanhecer.

Segundo a lembrança de Mestre Camisa, seus companheiros de treino na academia de Bimba incluíam "Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval". Isso situa Macarrão dentro da fase de propagação da Capoeira Regional (1967-1973), treinando ao lado de futuros mestres e dos próprios filhos do mestre.

Nenhuma informação adicional sobre a carreira de capoeira de Macarrão após a formatura foi documentada. Seu nome completo, título (se houver) e atividades subsequentes permanecem desconhecidos. Ele não deve ser confundido com outros capoeiristas que compartilham o mesmo apelido.',
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
This Macarrão (apelido_context = ''Bimba'') is DISTINCT from:
- Mestre Macarrão (Marcelo Santana Mota) - Born Jan 18, 1983 in Remanso, BA; IPHAN #2920; Capoeira Contemporânea; graduated 2011 under Mestre Carlinhos (Carlos Matos); student of Mestre Gentil; Associação de Capoeira Mestre Deca
- Professor Macarrão (Danilo Portugal) - Salvador-born; Capoeira Luanda group; student of Mestre Jelon Vieira; DanceBrazil performer; Bay Area based
- Macarrão (Medicina lineage) - Student of Mestre Medicina; different lineage

TRAINING COMPANIONS AT BIMBA''S ACADEMY:
According to Mestre Camisa: "Com eu era Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval"
(With me were Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga, and Demerval)

GRADUATION COMPANIONS (1969):
- Camisa (José Tadeu Carneiro Cardoso) - later founded ABADÁ-Capoeira
- Torpedo - no further information (distinct from Torpedo Poeira lineage)
- Onça Negra - no further information (distinct from Onça Preta)

GRADUATION CEREMONY DETAILS:
- Location: Sítio Caruano, Nordeste de Amaralina, Salvador
- Featured: Traditional stories by Mestre Bimba, rituals, prova de fogo, cintura desprezada demonstrations, benguela games, games with renowned capoeiristas and senior graduates, samba de roda until dawn
- Camisa''s madrinha (godmother): his sister Noemilde

CHRONOLOGICAL CONTEXT:
- 1969: Bimba celebrated 50 years of teaching (September 7, 1969 event at Nordeste de Amaralina)
- 1969: This graduation occurred in the final years of Bimba''s time in Salvador
- 1972: Bimba moved to Goiânia
- 1974: Bimba died in Goiânia

RESEARCH GAPS:
- Full name unknown
- Title (if any) unknown
- Post-graduation career unknown
- Current status (living/deceased) unknown
- No portrait or photographs identified
- No independent mentions in sources outside of Camisa interviews',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1955, década):
Formou-se junto com Camisa em 1969. Camisa nasceu em 28 de outubro de 1955 e formou-se aos 14 anos.
Assumindo faixa etária similar para companheiros de formatura, estimando nascimento em meados dos anos 1950.
Usando precisão de década devido à falta de qualquer evidência corroborante.

DESAMBIGUAÇÃO:
Este Macarrão (apelido_context = ''Bimba'') é DISTINTO de:
- Mestre Macarrão (Marcelo Santana Mota) - Nascido 18 jan 1983 em Remanso, BA; IPHAN #2920; Capoeira Contemporânea; formado 2011 com Mestre Carlinhos (Carlos Matos); aluno de Mestre Gentil; Associação de Capoeira Mestre Deca
- Professor Macarrão (Danilo Portugal) - Nascido em Salvador; grupo Capoeira Luanda; aluno de Mestre Jelon Vieira; performer DanceBrazil; baseado na Bay Area
- Macarrão (linhagem Medicina) - Aluno de Mestre Medicina; linhagem diferente

COMPANHEIROS DE TREINO NA ACADEMIA DE BIMBA:
Segundo Mestre Camisa: "Com eu era Onça Negra, Macarrão, Torpedo, Pimentão, Nenel, Formiga e Demerval"

COMPANHEIROS DE FORMATURA (1969):
- Camisa (José Tadeu Carneiro Cardoso) - posteriormente fundou a ABADÁ-Capoeira
- Torpedo - sem mais informações (distinto de Torpedo linhagem Poeira)
- Onça Negra - sem mais informações (distinto de Onça Preta)

DETALHES DA CERIMÔNIA DE FORMATURA:
- Local: Sítio Caruano, Nordeste de Amaralina, Salvador
- Incluiu: Histórias tradicionais de Mestre Bimba, rituais, prova de fogo, demonstrações de cintura desprezada, jogos de benguela, jogos com capoeiristas renomados e formados antigos, samba de roda até o amanhecer
- Madrinha de Camisa: sua irmã Noemilde

CONTEXTO CRONOLÓGICO:
- 1969: Bimba celebrou 50 anos de ensino (evento de 7 de setembro de 1969 no Nordeste de Amaralina)
- 1969: Esta formatura ocorreu nos últimos anos de Bimba em Salvador
- 1972: Bimba mudou-se para Goiânia
- 1974: Bimba morreu em Goiânia

LACUNAS DE PESQUISA:
- Nome completo desconhecido
- Título (se houver) desconhecido
- Carreira pós-formatura desconhecida
- Status atual (vivo/falecido) desconhecido
- Nenhum retrato ou fotografia identificada
- Sem menções independentes nas fontes fora das entrevistas de Camisa'
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
