-- ============================================================
-- GENEALOGY PERSON: Zé (Caiçara lineage)
-- Generated: 2026-01-11
-- ============================================================
-- MINIMAL RECORD: Very limited documentation available.
-- This Mestre Zé is known only from a single Omilad D'Angola quote
-- identifying him as a contra-mestre of Caiçara at Jardim Cruzeiro.
-- No full name, dates, or other biographical details documented.
-- ============================================================
-- DISAMBIGUATION:
-- Uses apelido_context = 'Caiçara' to distinguish from:
-- - Zé de Freitas (José de Freitas, b. 1926) - São Paulo pioneer
-- - Zé do Lenço (José Alves) - ABCA/Salvador
-- - Zé Baiano and other "Zé" figures in capoeira
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
  NULL, -- No full name documented
  'Zé',
  'Caiçara', -- Distinguishes from other "Zé" figures
  'mestre'::genealogy.title,
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/en/featured-39']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Mestre Zé trained in Capoeira Angola under Mestre Caiçara at the fish market in Jardim Cruzeiro, Salvador. He rose to the rank of contra-mestre, placing him among Caiçara''s inner circle of senior students. Beyond this, nothing is known of his specific technique or teaching style.',
  E'Mestre Zé treinou Capoeira Angola com Mestre Caiçara no mercado de peixe do Jardim Cruzeiro, Salvador. Alcançou o posto de contra-mestre, colocando-o entre o círculo íntimo de alunos seniores de Caiçara. Além disso, nada se sabe sobre sua técnica específica ou estilo de ensino.',
  -- Life dates
  1945,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Mestre Zé was a contra-mestre of Mestre Caiçara (Antônio Conceição Moraes, 1924-1997), training at the fish market in Jardim Cruzeiro in Salvador''s Cidade Baixa (Lower City) neighborhood.\n\nAccording to testimony preserved by Omilad D''Angola: "Mestre Caiçara sold fish on the small market of Jardim Cruzeiro, in the lower city neighborhood. Here he got many to become his contramestres. Such as Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) and others."\n\nThis quote places Mestre Zé among a cohort of senior students who achieved contra-mestre rank under Caiçara. His fellow contra-mestres included:\n- Fernandinho (Fernando Olímpio Paes Filho, 1948-2001), who later became famous in Rio de Janeiro and pioneered capoeira in Campo Grande, Mato Grosso do Sul\n- Paulo Santo Amaro, from Santo Amaro\n- Ferreirinha (Silvestre Vitório Ferreira, ~1935-), who later founded Grupo Vera Cruz in São Paulo\n\nBeyond this single testimony, no biographical details about Mestre Zé have been documented. His full name, birth and death dates, specific teaching activities, and students remain unknown. The velhosmestres.com source notes that "the guys who had taught them stayed anonymous," which may explain the limited historical record.\n\nThe use of the apelido "Zé" (a common Brazilian diminutive of José) without distinguishing details makes historical research challenging. He should not be confused with other capoeiristas named Zé, such as Mestre Zé de Freitas (José de Freitas, the São Paulo pioneer) or Mestre Zé do Lenço (José Alves of ABCA).',
  -- bio_pt
  E'Mestre Zé foi contra-mestre de Mestre Caiçara (Antônio Conceição Moraes, 1924-1997), treinando no mercado de peixe do Jardim Cruzeiro, no bairro da Cidade Baixa de Salvador.\n\nSegundo testemunho preservado por Omilad D''Angola: "Mestre Caiçara vendia peixe na feirinha do Jardim Cruzeiro, bairro da cidade baixa. Aqui ele pegava muitos para ser seus contramestres. Como Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) e outros."\n\nEsta citação coloca Mestre Zé entre um grupo de alunos seniores que alcançaram o posto de contra-mestre sob Caiçara. Seus companheiros contra-mestres incluíam:\n- Fernandinho (Fernando Olímpio Paes Filho, 1948-2001), que mais tarde ficou famoso no Rio de Janeiro e foi pioneiro da capoeira em Campo Grande, Mato Grosso do Sul\n- Paulo Santo Amaro, de Santo Amaro\n- Ferreirinha (Silvestre Vitório Ferreira, ~1935-), que mais tarde fundou o Grupo Vera Cruz em São Paulo\n\nAlém deste único testemunho, nenhum detalhe biográfico sobre Mestre Zé foi documentado. Seu nome completo, datas de nascimento e morte, atividades específicas de ensino e alunos permanecem desconhecidos. A fonte velhosmestres.com observa que "os caras que os ensinaram permaneceram anônimos", o que pode explicar o registro histórico limitado.\n\nO uso do apelido "Zé" (diminutivo brasileiro comum de José) sem detalhes distintivos torna a pesquisa histórica desafiadora. Ele não deve ser confundido com outros capoeiristas chamados Zé, como Mestre Zé de Freitas (José de Freitas, o pioneiro paulista) ou Mestre Zé do Lenço (José Alves da ABCA).',
  -- achievements_en
  E'Trained under Mestre Caiçara at Jardim Cruzeiro fish market in Salvador\nRose to rank of contra-mestre in Caiçara''s academy\nContemporary of Fernandinho, Paulo Santo Amaro, and Silvestre (Ferreirinha)',
  -- achievements_pt
  E'Treinou com Mestre Caiçara no mercado de peixe do Jardim Cruzeiro em Salvador\nAlcançou o posto de contra-mestre na academia de Caiçara\nContemporâneo de Fernandinho, Paulo Santo Amaro e Silvestre (Ferreirinha)',
  -- notes_en
  E'MINIMAL RECORD:
This is a minimal record based on a single documented source. No full name, dates, or extended biography could be found.

SOURCE:
Omilad D''Angola testimony preserved at velhosmestres.com (featured-39):
"Mestre Caiçara sold fish on the small market of Jardim Cruzeiro, in the lower city neighborhood. Here he got many to become his contramestres. Such as Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) and others."

TRAINING LOCATION:
- Jardim Cruzeiro fish market, Cidade Baixa, Salvador, Bahia

FELLOW CONTRA-MESTRES OF CAIÇARA:
- Fernandinho (Fernando Olímpio Paes Filho, 1948-2001) - later famous in Rio/Campo Grande
- Paulo Santo Amaro - from Santo Amaro region
- Silvestre (Ferreirinha) - later founded Grupo Vera Cruz in São Paulo

DISAMBIGUATION:
Apelido "Zé" is extremely common in Brazilian capoeira. This record uses apelido_context ''Caiçara'' to distinguish from:
- Zé de Freitas (José de Freitas, b. 1926) - different person, São Paulo pioneer
- Zé do Lenço (José Alves) - ABCA leader, Salvador
- Zé Baiano and other "Zé" figures

RESEARCH LIMITATIONS:
The source notes: "the guys who had taught them stayed anonymous" - this may explain why detailed records of Mestre Zé were not preserved.',
  -- notes_pt
  E'REGISTRO MÍNIMO:
Este é um registro mínimo baseado em uma única fonte documentada. Nenhum nome completo, datas ou biografia estendida puderam ser encontrados.

FONTE:
Testemunho de Omilad D''Angola preservado em velhosmestres.com (destaques-39):
"Mestre Caiçara vendia peixe na feirinha do Jardim Cruzeiro, bairro da cidade baixa. Aqui ele pegava muitos para ser seus contramestres. Como Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) e outros."

LOCAL DE TREINAMENTO:
- Mercado de peixe do Jardim Cruzeiro, Cidade Baixa, Salvador, Bahia

COMPANHEIROS CONTRA-MESTRES DE CAIÇARA:
- Fernandinho (Fernando Olímpio Paes Filho, 1948-2001) - depois famoso no Rio/Campo Grande
- Paulo Santo Amaro - da região de Santo Amaro
- Silvestre (Ferreirinha) - depois fundou o Grupo Vera Cruz em São Paulo

DESAMBIGUAÇÃO:
O apelido "Zé" é extremamente comum na capoeira brasileira. Este registro usa apelido_context ''Caiçara'' para distinguir de:
- Zé de Freitas (José de Freitas, n. 1926) - pessoa diferente, pioneiro paulista
- Zé do Lenço (José Alves) - líder da ABCA, Salvador
- Zé Baiano e outras figuras "Zé"

LIMITAÇÕES DA PESQUISA:
A fonte observa: "os caras que os ensinaram permaneceram anônimos" - isso pode explicar por que registros detalhados de Mestre Zé não foram preservados.'
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
