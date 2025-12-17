-- ============================================================
-- GENEALOGY PERSON: Duquinha
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Known alongside Escalvino as "Os irmaos terror" (The terror brothers).
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
  'Duquinha',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s-1930s). Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s-1930s). As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1895,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Duquinha was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is featured in "Mestres e capoeiras famosos da Bahia" together with Escalvino (Luís Escalvino), sharing the ominous subtitle "Os irmãos terror" (The terror brothers). This pairing suggests they were either biological brothers or such close associates that they operated as a fearsome duo in Salvador''s streets.\n\nThe name "Duquinha" is a diminutive form, likely derived from "Duque" (Duke), which may have been an ironic or aspirational nickname common among the marginalized populations of early 20th century Salvador. Such nicknames often carried a mix of humor and menace.\n\nDuquinha was among the capoeiristas who worked as capangas (political henchmen) for Bahian politicians during the First Republic. These enforcers provided muscle during electoral disputes and served the interests of powerful political figures. Sources list him alongside other political capangas including Inocêncio Sete Mortes, Estevinho, Samuel da Calçada, Sebastião de Souza, and Pedro Mineiro.\n\nThe "terror brothers" designation indicates that Duquinha and Escalvino together were particularly feared in Salvador''s underworld. Whether this reputation came from political enforcement, street fighting, or a combination of both, their joint notoriety was significant enough to earn them a shared chapter in the historical record.\n\nDuquinha was defended in court by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, gamblers, and the poor.',
  E'Duquinha foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. Ele é apresentado em "Mestres e capoeiras famosos da Bahia" junto com Escalvino (Luís Escalvino), compartilhando o ominoso subtítulo "Os irmãos terror." Esse emparelhamento sugere que eram irmãos biológicos ou associados tão próximos que operavam como uma dupla temível nas ruas de Salvador.\n\nO nome "Duquinha" é uma forma diminutiva, provavelmente derivada de "Duque," que pode ter sido um apelido irônico ou aspiracional comum entre as populações marginalizadas do início do século XX em Salvador. Tais apelidos frequentemente carregavam uma mistura de humor e ameaça.\n\nDuquinha estava entre os capoeiristas que trabalhavam como capangas (jagunços políticos) para políticos baianos durante a Primeira República. Esses executores forneciam a força durante disputas eleitorais e serviam aos interesses de poderosas figuras políticas. As fontes o listam junto com outros capangas políticos incluindo Inocêncio Sete Mortes, Estevinho, Samuel da Calçada, Sebastião de Souza e Pedro Mineiro.\n\nA designação "irmãos terror" indica que Duquinha e Escalvino juntos eram particularmente temidos no submundo de Salvador. Se essa reputação veio da aplicação política, brigas de rua, ou uma combinação de ambos, sua notoriedade conjunta foi significativa o suficiente para lhes render um capítulo compartilhado no registro histórico.\n\nDuquinha foi defendido em tribunal pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas, jogadores e pobres.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with Escalvino under title "Os irmãos terror" (The terror brothers); documented role as political capanga during the First Republic',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com Escalvino sob o título "Os irmãos terror"; papel documentado como capanga político durante a Primeira República',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: Full name unknown. "Duquinha" is diminutive form, likely from "Duque" (Duke).\n\nPARTNERSHIP: Listed with Escalvino (Luís Escalvino) as "Os irmãos terror" (The terror brothers). May be biological brothers or close associates.\n\nPOLITICAL ROLE: Listed among capoeiristas who worked as capangas during First Republic.\n\nBOOK CHAPTER: Shares chapter with Escalvino "Os irmãos terror" in "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: Nome completo desconhecido. "Duquinha" é forma diminutiva, provavelmente de "Duque."\n\nPARCERIA: Listado com Escalvino (Luís Escalvino) como "Os irmãos terror." Podem ser irmãos biológicos ou associados próximos.\n\nPAPEL POLÍTICO: Listado entre os capoeiristas que trabalhavam como capangas durante a Primeira República.\n\nCAPÍTULO NO LIVRO: Compartilha capítulo com Escalvino "Os irmãos terror" em "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Revista Capoeirando, artigo Sankofa USP.'
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
