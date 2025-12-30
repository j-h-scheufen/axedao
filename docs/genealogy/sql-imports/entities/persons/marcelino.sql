-- ============================================================
-- GENEALOGY PERSON: Marcelino (Praça Mauá)
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1910s-1920s, decade precision):
-- If Marcelino was teaching capoeira at Praça Mauá before 1963 and was
-- an established mestre leading a group, he was likely 40-60 years old.
-- This suggests birth in the 1910s-1920s. Using 1920 as midpoint estimate.
-- ============================================================
-- CONTEXT: Uses apelido_context 'Praça Mauá' to distinguish from other
-- Marcelinos in the database. This mestre led a Pernambucan capoeira
-- group at Praça Mauá in Rio de Janeiro's port area.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Marcelino',
  'Praça Mauá',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['http://velhosmestres.com/br/gato-1984']::text[],
  NULL,
  E'Marcelino led a Pernambucan capoeira group at Praça Mauá in Rio de Janeiro. The specific style practiced is not documented, but Pernambucan capoeira traditions had their own distinct characteristics that differed from Bahian styles.',
  E'Marcelino liderava um grupo de capoeira pernambucana na Praça Mauá no Rio de Janeiro. O estilo específico praticado não está documentado, mas as tradições de capoeira pernambucana tinham suas próprias características distintas que diferiam dos estilos baianos.',
  1920,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  E'Mestre Marcelino led a Pernambucan capoeira group at Praça Mauá in Rio de Janeiro''s port district during the late 1950s and early 1960s. The port area of Rio, particularly around Praça Mauá, was historically a meeting point for diverse capoeira traditions, including practitioners from Pernambuco who brought their distinct regional style to the city.\n\nMarcelino''s group was one of several informal training spaces in Rio before the establishment of formal academies. The young Rafael Flores, who would later co-found Grupo Senzala, trained with Marcelino''s group at Praça Mauá before traveling to Salvador in 1963 to study with Mestre Bimba. This early exposure to Pernambucan capoeira contributed to the diverse influences that would shape the Senzala methodology.\n\nVery little is documented about Marcelino''s life beyond this single mention in the oral history of Grupo Senzala''s founders. Like many capoeira mestres of his generation, his legacy is preserved primarily through the practitioners he influenced rather than written records.',
  E'Mestre Marcelino liderava um grupo de capoeira pernambucana na Praça Mauá, no distrito portuário do Rio de Janeiro, durante o final dos anos 1950 e início dos anos 1960. A área portuária do Rio, particularmente ao redor da Praça Mauá, era historicamente um ponto de encontro para diversas tradições de capoeira, incluindo praticantes de Pernambuco que trouxeram seu estilo regional distinto para a cidade.\n\nO grupo de Marcelino era um dos vários espaços de treinamento informais no Rio antes do estabelecimento de academias formais. O jovem Rafael Flores, que mais tarde co-fundaria o Grupo Senzala, treinou com o grupo de Marcelino na Praça Mauá antes de viajar para Salvador em 1963 para estudar com Mestre Bimba. Essa exposição inicial à capoeira pernambucana contribuiu para as diversas influências que moldariam a metodologia do Senzala.\n\nMuito pouco está documentado sobre a vida de Marcelino além dessa única menção na história oral dos fundadores do Grupo Senzala. Como muitos mestres de capoeira de sua geração, seu legado é preservado principalmente através dos praticantes que ele influenciou, e não através de registros escritos.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1920, decade):\nIf active and leading a capoeira group at Praça Mauá before 1963, Marcelino was likely an established mestre aged 40-60. This suggests birth in the 1910s-1920s range. Using 1920 as midpoint estimate with decade precision.\n\nNAME/IDENTITY:\nOnly known as "Marcelino" - full name not documented. Led a "Pernambucan capoeira group" at Praça Mauá, suggesting he either came from Pernambuco or taught a Pernambucan style. Uses apelido_context ''Praça Mauá'' to distinguish from other Marcelinos.\n\nTEACHERS:\nUnknown - his Pernambucan background suggests training in Pernambuco before coming to Rio.\n\nSTUDENTS:\n- Rafael Flores (future Grupo Senzala co-founder, trained before 1963)\n\nLOCATION:\nPraça Mauá, Rio de Janeiro - the port area was historically a hub for capoeira activity.\n\nSOURCE LIMITATIONS:\nThe only documented reference comes from the 1984 velhosmestres.com interview with Mestre Gato (Grupo Senzala). No other sources found despite extensive research. This represents a significant gap in Rio de Janeiro capoeira history.',
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1920, década):\nSe ativo e liderando um grupo de capoeira na Praça Mauá antes de 1963, Marcelino era provavelmente um mestre estabelecido com idade entre 40-60 anos. Isso sugere nascimento na faixa dos anos 1910-1920. Usando 1920 como estimativa média com precisão de década.\n\nNOME/IDENTIDADE:\nConhecido apenas como "Marcelino" - nome completo não documentado. Liderava um "grupo de capoeira pernambucana" na Praça Mauá, sugerindo que ele veio de Pernambuco ou ensinava um estilo pernambucano. Usa apelido_context ''Praça Mauá'' para distinguir de outros Marcelinos.\n\nMESTRES:\nDesconhecido - sua origem pernambucana sugere treinamento em Pernambuco antes de vir para o Rio.\n\nALUNOS:\n- Rafael Flores (futuro co-fundador do Grupo Senzala, treinou antes de 1963)\n\nLOCALIZAÇÃO:\nPraça Mauá, Rio de Janeiro - a área portuária era historicamente um centro de atividade de capoeira.\n\nLIMITAÇÕES DE FONTES:\nA única referência documentada vem da entrevista de 1984 do velhosmestres.com com Mestre Gato (Grupo Senzala). Nenhuma outra fonte encontrada apesar de pesquisa extensiva. Isso representa uma lacuna significativa na história da capoeira do Rio de Janeiro.'
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
