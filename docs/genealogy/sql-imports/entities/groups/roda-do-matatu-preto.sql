-- ============================================================
-- GENEALOGY GROUP: Roda do Matatu Preto
-- Migrated: 2025-12-11
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  description_en,
  description_pt,
  style,
  style_notes_en,
  style_notes_pt,
  logo,
  public_links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Roda do Matatu Preto',
  'An informal Sunday training circle in the Matatu neighborhood of Salvador, Bahia, during the 1930s. According to Mestre Canjiquinha''s 1989 testimony, capoeiristas including Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, and Barboza would gather there on Sundays. This proto-group represents the continuation of traditional capoeira practice in Salvador during the transition era before and during the emergence of formal academies.',
  'Um círculo informal de treino aos domingos no bairro do Matatu em Salvador, Bahia, durante os anos 1930. Segundo o testemunho de Mestre Canjiquinha de 1989, capoeiristas incluindo Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha e Barboza se reuniam lá aos domingos. Este proto-grupo representa a continuação da prática tradicional de capoeira em Salvador durante a era de transição antes e durante o surgimento das academias formais.',
  'angola'::genealogy.style,
  'Traditional capoeira Angola. The 1930s was the transition period when Bimba was developing Regional and Pastinha was consolidating Angola. Many at Matatu Preto were also connected to Gengibirra.',
  'Capoeira Angola tradicional. Os anos 1930 foram o período de transição quando Bimba estava desenvolvendo a Regional e Pastinha estava consolidando a Angola. Muitos no Matatu Preto também tinham conexão com a Gengibirra.',
  NULL, -- No logo for informal historical group
  ARRAY['https://velhosmestres.com/br/destaques-2']::text[],
  -- Identity enhancements
  ARRAY['Matatu Preto', 'Treino do Matatu'],
  '[]'::jsonb, -- No name changes
  -- Founding details
  1930, -- Approximate, based on Canjiquinha's testimony about the 1930s
  'decade'::genealogy.date_precision,
  'Matatu neighborhood, Salvador, Bahia, Brazil',
  -- Extended content (philosophy)
  NULL, -- No formal philosophy for informal group
  NULL, -- No formal philosophy for informal group
  -- history_en
  E'The Matatu Preto training circle was documented through Mestre Canjiquinha''s 1989 testimony about the capoeira scene in Salvador during the 1930s. According to Canjiquinha:\n\n"There, on Sundays, all these capoeiristas would come - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, the late Barboza, and this citizen called Antonio Raimundo, nicknamed by everyone Aberrê."\n\nThis was a period of transition in Bahian capoeira. Mestre Bimba had opened his academy in 1932, developing what would become Capoeira Regional. Meanwhile, traditional practitioners continued meeting informally. Many of those at Matatu Preto were also connected to Gengibirra, the first organized centro of Capoeira Angola at Ladeira de Pedra in the Liberdade neighborhood.\n\nThe training circle at Matatu Preto represents an important node in the social network that preserved and transmitted traditional capoeira during this transitional era.',
  -- history_pt
  E'O círculo de treino do Matatu Preto foi documentado através do testemunho de Mestre Canjiquinha de 1989 sobre a cena da capoeira em Salvador durante os anos 1930. Segundo Canjiquinha:\n\n"Lá, aos domingos, vinham todos esses capoeiristas - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, finado Barboza, e esse cidadão chamado Antônio Raimundo, apelidado por todos de Aberrê."\n\nEste foi um período de transição na capoeira baiana. Mestre Bimba havia aberto sua academia em 1932, desenvolvendo o que se tornaria a Capoeira Regional. Enquanto isso, praticantes tradicionais continuavam se encontrando informalmente. Muitos dos que estavam no Matatu Preto também tinham conexão com a Gengibirra, o primeiro centro organizado de Capoeira Angola na Ladeira de Pedra no bairro da Liberdade.\n\nO círculo de treino no Matatu Preto representa um nó importante na rede social que preservou e transmitiu a capoeira tradicional durante esta era de transição.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true, -- This was the only location
  -- Status
  false, -- Dissolved (informal group, no longer active)
  NULL -- Exact dissolution unknown
)
ON CONFLICT (name) DO UPDATE SET
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  logo = EXCLUDED.logo,
  public_links = EXCLUDED.public_links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();
