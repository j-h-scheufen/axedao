-- ============================================================
-- GENEALOGY PERSON: Santana (Abadá)
-- Generated: 2025-12-27
-- ============================================================
-- Mestre Santana - co-organizer of Abadá-Capoeira founding
-- Full name UNKNOWN; biography details UNKNOWN
-- Participated in foundational meetings for Abadá-Capoeira
-- in Austria and Brazil alongside Mestres Camisa Roxa and Camisa.
-- Participated in 1992 first Spring Encounter in Salzburg.
-- Still active teaching at Copa Camisa Roxa events (2025).
-- Uses apelido_context to distinguish from other "Santana" figures.
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1950, decade precision):
-- In 1992, he participated as a peer alongside:
--   - Camisa Roxa (born 1944, age 48 in 1992)
--   - Camisa (born 1955, age 37 in 1992)
--   - Moraes (born 1950, age 42 in 1992)
-- To be a respected mestre at founding meetings and 1992 event,
-- he was likely 35-50 years old at that time.
-- Still actively teaching in 2025 suggests not older than mid-80s.
-- Estimate: ~1950 → age 42 in 1992, age 75 in 2025.
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
  'Santana',
  'Abadá',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-73', 'https://abada-capoeira-ba.wixsite.com/salvador/camisa-roxa']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  NULL,
  NULL,
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Santana is an early figure in the history of Abadá-Capoeira. He participated alongside Mestres Camisa Roxa and Mestre Camisa in the first meetings—held in Austria and Brazil—that led to the foundation of Abadá-Capoeira as an organization.

In 1992, Mestre Santana participated in the historic first "Encontro da Primavera" (Spring Encounter) in Salzburg, Austria, alongside Mestre Camisa, Mestre Moraes (founder of GCAP), and organized by Grão-Mestre Camisa Roxa. This event became a cornerstone of the European capoeira calendar and preceded the Abadá-Capoeira European Games.

The 1992 Salzburg gathering was significant as it brought together leaders from different capoeira lineages—Mestre Moraes representing Capoeira Angola (GCAP), while Camisa, Camisa Roxa, and Santana represented the Regional tradition from Mestre Bimba''s lineage. This cross-stylistic cooperation helped establish capoeira''s presence in Europe.

Mestre Santana remains active in the capoeira community. As of 2025, he continues to teach workshops at the annual Copa Camisa Roxa festival in Austria, an event that honors the legacy of Grão-Mestre Camisa Roxa and celebrates Brazilian culture in Europe.

His full civil name, biography, and lineage details remain undocumented in available sources. His role in the foundational meetings of Abadá-Capoeira suggests he was a trusted figure within the inner circle of the Carneiro family (Camisa Roxa and Camisa) and their associates.',
  -- bio_pt
  E'Mestre Santana é uma figura dos primeiros tempos da história da Abadá-Capoeira. Ele participou ao lado dos Mestres Camisa Roxa e Mestre Camisa nas primeiras reuniões—realizadas na Áustria e no Brasil—que levaram à fundação da Abadá-Capoeira como organização.

Em 1992, Mestre Santana participou do histórico primeiro "Encontro da Primavera" em Salzburg, Áustria, ao lado de Mestre Camisa, Mestre Moraes (fundador do GCAP), organizado pelo Grão-Mestre Camisa Roxa. Este evento tornou-se uma pedra angular do calendário capoeirístico europeu e precedeu os Jogos Europeus da Abadá-Capoeira.

O encontro de Salzburg de 1992 foi significativo por reunir líderes de diferentes linhagens de capoeira—Mestre Moraes representando a Capoeira Angola (GCAP), enquanto Camisa, Camisa Roxa e Santana representavam a tradição Regional da linhagem de Mestre Bimba. Esta cooperação entre estilos ajudou a estabelecer a presença da capoeira na Europa.

Mestre Santana permanece ativo na comunidade capoeirista. Em 2025, ele continua ministrando workshops no festival anual Copa Camisa Roxa na Áustria, um evento que homenageia o legado do Grão-Mestre Camisa Roxa e celebra a cultura brasileira na Europa.

Seu nome civil completo, biografia e detalhes de linhagem permanecem não documentados nas fontes disponíveis. Seu papel nas reuniões fundacionais da Abadá-Capoeira sugere que era uma figura de confiança dentro do círculo íntimo da família Carneiro (Camisa Roxa e Camisa) e seus associados.',
  -- achievements_en
  E'Participated in foundational meetings of Abadá-Capoeira in Austria and Brazil; Participated in first Spring Encounter in Salzburg (1992) with Mestre Camisa, Mestre Moraes, and Grão-Mestre Camisa Roxa; Active instructor at Copa Camisa Roxa events (Austria)',
  -- achievements_pt
  E'Participou das reuniões fundacionais da Abadá-Capoeira na Áustria e no Brasil; Participou do primeiro Encontro da Primavera em Salzburg (1992) com Mestre Camisa, Mestre Moraes e Grão-Mestre Camisa Roxa; Instrutor ativo nos eventos Copa Camisa Roxa (Áustria)',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1950, decade precision):
In 1992, he participated as a peer alongside:
- Camisa Roxa (born 1944, age 48 in 1992)
- Camisa (born 1955, age 37 in 1992)
- Moraes (born 1950, age 42 in 1992)
To be a respected mestre at founding meetings and the 1992 event, he was likely 35-50 years old.
Still actively teaching in 2025 suggests not older than mid-80s.
Estimate: ~1950 → age 42 in 1992, age 75 in 2025.

IDENTITY STATUS: MINIMAL DOCUMENTATION
- Full civil name: UNKNOWN
- Birth place: UNKNOWN
- Lineage/teachers: UNKNOWN
- Current title: Mestre (confirmed by Copa Camisa Roxa event listings)

SOURCES:
- velhosmestres.com/en/featured-73: "participated alongside Mestres Santana and Mestre Camisa in the first meetings in Austria and Brazil for the foundation of Abadá-Capoeira"
- abada-capoeira-ba.wixsite.com: "1992 - Realização do primeiro encontro da primavera com Mestre Camisa, Mestre Moraes e Mestre Santana em Salzburg, Áustria"
- novocapoeira.at: 2025 Copa Camisa Roxa lists Mestre Santana teaching workshops

DISAMBIGUATION:
- DISTINCT from Mestre Santana (Cícero Victor Santana) of Grupo Capoeira Axé (student of Canjiquinha, trained at Mercado Modelo 1969-70)
- DISTINCT from Mestre Santana (Jairo Santana de Cerqueira) of Grupo Baraúna (born 1977, São Paulo)
- DISTINCT from Valdemar Santana (fighter, not primarily capoeirista)
- Uses apelido_context ''Abadá'' to distinguish

RELATIONSHIP TO ABADÁ HIERARCHY:
- NOT listed among official Abadá-Capoeira mestres/mestrandos in 2025 organizational lists
- His participation in founding meetings suggests early involvement but unclear current status within formal hierarchy
- May have branched off or maintained informal association

KEY HISTORICAL ROLE:
- One of the architects of Abadá-Capoeira''s founding alongside Camisa Roxa and Camisa
- 1992 Salzburg event was landmark for European capoeira development
- Event uniquely brought together Regional (Abadá) and Angola (Moraes/GCAP) leaders',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1950, precisão de década):
Em 1992, ele participou como par ao lado de:
- Camisa Roxa (nascido 1944, 48 anos em 1992)
- Camisa (nascido 1955, 37 anos em 1992)
- Moraes (nascido 1950, 42 anos em 1992)
Para ser um mestre respeitado nas reuniões fundacionais e no evento de 1992, provavelmente tinha 35-50 anos.
Ainda ensinando ativamente em 2025 sugere não ter mais que 85 anos.
Estimativa: ~1950 → 42 anos em 1992, 75 anos em 2025.

STATUS DE IDENTIDADE: DOCUMENTAÇÃO MÍNIMA
- Nome civil completo: DESCONHECIDO
- Local de nascimento: DESCONHECIDO
- Linhagem/professores: DESCONHECIDO
- Título atual: Mestre (confirmado por listagens do evento Copa Camisa Roxa)

FONTES:
- velhosmestres.com/en/featured-73: "participou ao lado dos Mestres Santana e Mestre Camisa nas primeiras reuniões na Áustria e no Brasil para a fundação da Abadá-Capoeira"
- abada-capoeira-ba.wixsite.com: "1992 - Realização do primeiro encontro da primavera com Mestre Camisa, Mestre Moraes e Mestre Santana em Salzburg, Áustria"
- novocapoeira.at: Copa Camisa Roxa 2025 lista Mestre Santana ministrando workshops

DESAMBIGUAÇÃO:
- DISTINTO de Mestre Santana (Cícero Victor Santana) do Grupo Capoeira Axé (aluno de Canjiquinha, treinou no Mercado Modelo 1969-70)
- DISTINTO de Mestre Santana (Jairo Santana de Cerqueira) do Grupo Baraúna (nascido 1977, São Paulo)
- DISTINTO de Valdemar Santana (lutador, não primariamente capoeirista)
- Usa apelido_context ''Abadá'' para distinguir

RELAÇÃO COM A HIERARQUIA DA ABADÁ:
- NÃO listado entre os mestres/mestrandos oficiais da Abadá-Capoeira nas listas organizacionais de 2025
- Sua participação nas reuniões fundacionais sugere envolvimento inicial, mas status atual na hierarquia formal é incerto
- Pode ter seguido caminho próprio ou mantido associação informal

PAPEL HISTÓRICO CHAVE:
- Um dos arquitetos da fundação da Abadá-Capoeira ao lado de Camisa Roxa e Camisa
- Evento de Salzburg 1992 foi marco para o desenvolvimento da capoeira europeia
- Evento reuniu de forma única líderes de Regional (Abadá) e Angola (Moraes/GCAP)'
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
