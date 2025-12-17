-- ============================================================
-- GENEALOGY PERSON: Escalvino
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890s based on active period 1920s-1930s.
-- Known alongside Duquinha as "Os irmaos terror" (The terror brothers).
-- Also spelled "Scalvino" in some sources.
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
  'Luís Escalvino',
  'Escalvino',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://velhosmestres.com/br/destaques-9', 'https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691']::text[],
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
  E'Luís Escalvino, also known simply as Escalvino (sometimes spelled Scalvino), was a capoeirista active in Salvador, Bahia, during the 1920s and 1930s. He is featured in "Mestres e capoeiras famosos da Bahia" together with Duquinha, sharing the ominous subtitle "Os irmãos terror" (The terror brothers). This pairing suggests they were either biological brothers or such close associates that they operated as a fearsome duo in Salvador''s streets.\n\nEscalvino was noted among the protected capoeiristas of his era - practitioners who had influential patrons in Salvador''s society. This protection network was common during the First Republic, when capoeiristas often served as capangas (political henchmen) for powerful politicians and in return received a degree of protection from prosecution. The relationship was mutually beneficial: politicians gained enforcers for electoral disputes, while capoeiristas gained allies who could intervene when they faced legal trouble.\n\nThe "terror brothers" designation indicates that Escalvino and Duquinha together were particularly feared in Salvador''s underworld. Whether this reputation came from political enforcement, street fighting, or a combination of both, their joint notoriety was significant enough to earn them a shared chapter in the historical record.\n\nEscalvino was defended in court by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, gamblers, and the poor. Farias was known for his emotional appeals rather than strict legal arguments, portraying his clients as "defenseless people trusting in justice''s righteousness."\n\nUnlike some other capoeiristas from this era whose names survive only as mentions in lists, Escalvino''s inclusion with a dedicated (shared) chapter in "Mestres e capoeiras famosos da Bahia" indicates that his story was considered significant enough to preserve for future generations.',
  E'Luís Escalvino, também conhecido simplesmente como Escalvino (às vezes escrito Scalvino), foi um capoeirista ativo em Salvador, Bahia, durante as décadas de 1920 e 1930. Ele é apresentado em "Mestres e capoeiras famosos da Bahia" junto com Duquinha, compartilhando o ominoso subtítulo "Os irmãos terror." Esse emparelhamento sugere que eram irmãos biológicos ou associados tão próximos que operavam como uma dupla temível nas ruas de Salvador.\n\nEscalvino foi notado entre os capoeiristas protegidos de sua era - praticantes que tinham padrinhos influentes na sociedade de Salvador. Esta rede de proteção era comum durante a Primeira República, quando os capoeiristas frequentemente serviam como capangas (jagunços políticos) para políticos poderosos e em troca recebiam um grau de proteção contra processos. A relação era mutuamente benéfica: os políticos ganhavam executores para disputas eleitorais, enquanto os capoeiristas ganhavam aliados que podiam intervir quando enfrentavam problemas legais.\n\nA designação "irmãos terror" indica que Escalvino e Duquinha juntos eram particularmente temidos no submundo de Salvador. Se essa reputação veio da aplicação política, brigas de rua, ou uma combinação de ambos, sua notoriedade conjunta foi significativa o suficiente para lhes render um capítulo compartilhado no registro histórico.\n\nEscalvino foi defendido em tribunal pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas, jogadores e pobres. Farias era conhecido por seus apelos emocionais ao invés de argumentos legais estritos, retratando seus clientes como "pessoas indefesas confiando na retidão da justiça."\n\nDiferente de alguns outros capoeiristas desta era cujos nomes sobrevivem apenas como menções em listas, a inclusão de Escalvino com um capítulo dedicado (compartilhado) em "Mestres e capoeiras famosos da Bahia" indica que sua história foi considerada significativa o suficiente para ser preservada para as gerações futuras.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with Duquinha under title "Os irmãos terror" (The terror brothers); noted among protected capoeiristas with influential patrons',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com Duquinha sob o título "Os irmãos terror"; notado entre os capoeiristas protegidos com padrinhos influentes',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No specific documentation. Estimated based on active period 1920s-1930s.\n\nNAME: Full name "Luís Escalvino" per Velhos Mestres. Also spelled "Scalvino" in some sources.\n\nPARTNERSHIP: Listed with Duquinha as "Os irmãos terror" (The terror brothers). May be biological brothers or close associates.\n\nPROTECTION: Noted among protected capoeiristas with influential patrons in Salvador society.\n\nBOOK CHAPTER: Shares chapter with Duquinha "Os irmãos terror" in "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Velhos Mestres (destaques-9), Revista Capoeirando, Sankofa USP article.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Sem documentação específica. Estimado baseado no período de atividade 1920s-1930s.\n\nNOME: Nome completo "Luís Escalvino" conforme Velhos Mestres. Também escrito "Scalvino" em algumas fontes.\n\nPARCERIA: Listado com Duquinha como "Os irmãos terror." Podem ser irmãos biológicos ou associados próximos.\n\nPROTEÇÃO: Notado entre os capoeiristas protegidos com padrinhos influentes na sociedade de Salvador.\n\nCAPÍTULO NO LIVRO: Compartilha capítulo com Duquinha "Os irmãos terror" em "Mestres e capoeiras famosos da Bahia" (SciELO).\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Velhos Mestres (destaques-9), Revista Capoeirando, artigo Sankofa USP.'
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
