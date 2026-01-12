-- ============================================================
-- GENEALOGY PERSON: Paulo Santo Amaro
-- Generated: 2026-01-11
-- ============================================================
-- LIMITED DOCUMENTATION: Only two sources mention this capoeirista:
-- 1. velhosmestres.com - Listed as one of Caiçara's contra-mestres
--    trained at Jardim Cruzeiro fish market in Salvador
-- 2. matumbecapoeira.com - Listed as one of Gato Preto's teachers
--
-- BIRTH YEAR ESTIMATION (1920, decade precision):
-- - If he taught Gato Preto (b. 1930) in the 1940s, he was likely
--   born circa 1910-1920 (would be 20-30+ when teaching)
-- - However, velhosmestres.com lists him as a contra-mestre of
--   Caiçara alongside Fernandinho (b. 1948), suggesting he was
--   still active in the capoeira scene through the 1960s-70s
-- - Using 1920 as reasonable estimate with decade precision
--   This would make him an older figure in the Jardim Cruzeiro
--   training circle but still plausible as a "contemporary"
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
  NULL, -- Full name unknown
  'Paulo Santo Amaro',
  NULL, -- Context not needed; apelido is distinctive
  'mestre'::genealogy.title, -- Listed as "Mestre" in matumbecapoeira source
  NULL, -- No portrait available
  ARRAY[
    'https://velhosmestres.com/en/featured-39',
    'https://velhosmestres.com/br/destaques-39',
    'https://matumbecapoeira.com/mestres/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style, -- Trained under Caiçara (Angola mestre)
  E'Paulo Santo Amaro trained in Capoeira Angola under Mestre Caiçara, the legendary hard-fighting Angoleiro known for his iconic bengala. He is also documented as one of the teachers of Mestre Gato Preto, suggesting he was an established practitioner in the Santo Amaro/Salvador region during the mid-20th century.',
  E'Paulo Santo Amaro treinou Capoeira Angola com Mestre Caiçara, o lendário Angoleiro de luta dura conhecido por sua icônica bengala. Também está documentado como um dos professores de Mestre Gato Preto, sugerindo que era um praticante estabelecido na região de Santo Amaro/Salvador em meados do século XX.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil', -- Inferred from apelido
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Paulo Santo Amaro was a capoeira mestre who trained under Mestre Caiçara in Salvador''s Cidade Baixa (Lower City) neighborhood. According to Omilad D''Angola''s testimony preserved on velhosmestres.com, Mestre Caiçara "sold fish on the small market of Jardim Cruzeiro, in the lower city neighborhood. Here he got many to become his contramestres. Such as Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) and others."\n\nThe Jardim Cruzeiro market was situated near the famous Largo de Argolo, between the Massaranduba and Jardim Cruzeiro neighborhoods—a traditional center of capoeira activity in Salvador where Caiçara established his informal training ground while working as a fish vendor.\n\nPaulo Santo Amaro is also documented as one of the teachers of Mestre Gato Preto (José Gabriel Góes, 1930-2002), according to the Matumbé Capoeira school''s lineage documentation. This source lists Gato Preto''s teachers as including "Lúcio and Catarino Góes, Cobrinha Verde, Waldemar da Liberdade, Leó, and Paulo de Santo Amaro." If Paulo Santo Amaro taught Gato Preto during the 1940s, this would place him as an older generation figure who was already established in the capoeira scene.\n\nHis apelido "Santo Amaro" indicates he originated from Santo Amaro da Purificação, a city in the Recôncavo Baiano renowned for producing legendary capoeiristas including Besouro Mangangá, Cobrinha Verde, Gato Preto, and Mestre Traíra. The naming convention "de Santo Amaro" or "Santo Amaro" was common for capoeiristas from this town who moved to Salvador or other cities, distinguishing them from local practitioners.\n\nBeyond these two references—as a contra-mestre of Caiçara and as a teacher of Gato Preto—little documentation exists about Paulo Santo Amaro''s life, full name, or specific contributions to capoeira. His place in the lineage, however, connects him to two of the most significant figures in Bahian capoeira history.',
  -- bio_pt
  E'Paulo Santo Amaro foi um mestre de capoeira que treinou com Mestre Caiçara no bairro da Cidade Baixa de Salvador. Segundo o testemunho de Omilad D''Angola preservado no velhosmestres.com, Mestre Caiçara "vendia peixe na feirinha do Jardim Cruzeiro, bairro da cidade baixa. Aqui ele pegava muitos para ser seus contramestres. Como Mestre Zé, Fernandinho, Paulo Santo Amaro, Ferreirinha (Silvestre) e outros."\n\nO mercado do Jardim Cruzeiro ficava próximo ao famoso Largo de Argolo, entre os bairros Massaranduba e Jardim Cruzeiro—um centro tradicional de atividade de capoeira em Salvador onde Caiçara estabeleceu seu espaço informal de treino enquanto trabalhava como vendedor de peixe.\n\nPaulo Santo Amaro também está documentado como um dos professores de Mestre Gato Preto (José Gabriel Góes, 1930-2002), de acordo com a documentação de linhagem da escola Matumbé Capoeira. Esta fonte lista os professores de Gato Preto incluindo "Lúcio e Catarino Góes, Cobrinha Verde, Waldemar da Liberdade, Leó e Paulo de Santo Amaro." Se Paulo Santo Amaro ensinou Gato Preto durante os anos 1940, isso o colocaria como uma figura de geração mais antiga que já estava estabelecida na cena da capoeira.\n\nSeu apelido "Santo Amaro" indica que era originário de Santo Amaro da Purificação, uma cidade no Recôncavo Baiano famosa por produzir capoeiristas lendários incluindo Besouro Mangangá, Cobrinha Verde, Gato Preto e Mestre Traíra. A convenção de nome "de Santo Amaro" ou "Santo Amaro" era comum para capoeiristas dessa cidade que se mudaram para Salvador ou outras cidades, distinguindo-os dos praticantes locais.\n\nAlém dessas duas referências—como contra-mestre de Caiçara e como professor de Gato Preto—existe pouca documentação sobre a vida de Paulo Santo Amaro, seu nome completo ou contribuições específicas para a capoeira. Seu lugar na linhagem, porém, o conecta a duas das figuras mais significativas da história da capoeira baiana.',
  -- achievements_en
  E'Became contra-mestre under Mestre Caiçara at the Jardim Cruzeiro fish market, Salvador
Listed among Mestre Gato Preto''s teachers (alongside Waldemar da Liberdade, Cobrinha Verde, Leó)
Trained alongside Fernandinho, Mestre Zé, and Silvestre (Ferreirinha) under Caiçara',
  -- achievements_pt
  E'Tornou-se contra-mestre sob Mestre Caiçara no mercado de peixe do Jardim Cruzeiro, Salvador
Listado entre os professores de Mestre Gato Preto (junto com Waldemar da Liberdade, Cobrinha Verde, Leó)
Treinou junto com Fernandinho, Mestre Zé e Silvestre (Ferreirinha) sob Caiçara',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade precision):
- Taught Gato Preto (b. 1930), likely in 1940s = born ~1910-1925
- Also listed as contemporary of Fernandinho (b. 1948) at Jardim Cruzeiro
- The 1920 estimate allows for both relationships: would be ~20s when teaching Gato Preto in 1940s, and ~40s-50s when training alongside Fernandinho in 1960s-70s

NAME VARIANTS:
- "Paulo Santo Amaro" (velhosmestres.com)
- "Paulo de Santo Amaro" (matumbecapoeira.com)
- Full name unknown

TEACHERS:
- Mestre Caiçara (Antônio Conceição Moraes, 1924-1997) - became his contra-mestre

STUDENTS:
- Mestre Gato Preto (José Gabriel Góes, 1930-2002) - per matumbecapoeira.com

FELLOW CONTRA-MESTRES OF CAIÇARA:
- Mestre Zé (apelido_context: Caiçara)
- Fernandinho (Fernando Olímpio Paes Filho, 1948-2001)
- Silvestre (Silvestre Vitório Ferreira, known as Ferreirinha in Salvador)

TRAINING LOCATION:
- Jardim Cruzeiro fish market, Cidade Baixa, Salvador
- Near Largo de Argolo, between Massaranduba and Jardim Cruzeiro neighborhoods

POSSIBLE IDENTITY CONFUSION WITH MESTRE LIMÃO:
There is reasonable suspicion that "Paulo Santo Amaro" in the velhosmestres.com oral testimony may actually refer to Mestre Limão (Paulo dos Santos, 1945-1985):

EVIDENCE FOR SAME PERSON:
- Both named "Paulo" from Santo Amaro da Purificação
- Both received contra-mestre title from Mestre Caiçara
- velhosmestres.com source is ORAL TESTIMONY (Omilad D''Angola) - could use "Paulo Santo Amaro" as colloquial reference to "that Paulo from Santo Amaro" (i.e., Limão)
- Listed alongside Fernandinho (b. 1948) - similar age to Limão (b. 1945)

EVIDENCE FOR DISTINCT PERSONS:
- matumbecapoeira.com lists "Paulo de Santo Amaro" as TEACHER of Gato Preto (b. 1930)
- Limão (b. 1945) was 15 years YOUNGER than Gato Preto - impossible for Limão to have taught him
- Limão received contra-mestre in São Paulo (1969); velhosmestres places Paulo Santo Amaro at Jardim Cruzeiro, Salvador
- IF matumbecapoeira.com is accurate, these MUST be different people

CRITICAL CAVEAT:
- matumbecapoeira.com is a group website (Tier 2) - lineage data may contain errors
- If matumbecapoeira.com is wrong about Gato Preto''s teachers, the distinction collapses
- velhosmestres.com is oral testimony with no date - subject to memory conflation

RESOLUTION NEEDED:
This question can only be resolved by:
1. Finding additional primary sources about "Paulo Santo Amaro" or "Paulo de Santo Amaro"
2. Verifying matumbecapoeira.com''s Gato Preto lineage from independent sources
3. Determining the date and context of Omilad D''Angola''s testimony

SOURCE QUALITY:
- velhosmestres.com (Tier 1) - single mention in Omilad D''Angola ORAL testimony (no date)
- matumbecapoeira.com (Tier 2) - group website lineage; may contain errors
- No photographs, interviews, or detailed biographical sources found
- THIN DOCUMENTATION overall; possible duplicate of Limão',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, precisão de década):
- Ensinou Gato Preto (n. 1930), provavelmente nos anos 1940 = nascido ~1910-1925
- Também listado como contemporâneo de Fernandinho (n. 1948) no Jardim Cruzeiro
- A estimativa de 1920 permite ambas as relações: teria ~20 anos ao ensinar Gato Preto nos anos 1940, e ~40-50 anos ao treinar junto com Fernandinho nos anos 1960-70

VARIANTES DO NOME:
- "Paulo Santo Amaro" (velhosmestres.com)
- "Paulo de Santo Amaro" (matumbecapoeira.com)
- Nome completo desconhecido

MESTRES:
- Mestre Caiçara (Antônio Conceição Moraes, 1924-1997) - tornou-se seu contra-mestre

ALUNOS:
- Mestre Gato Preto (José Gabriel Góes, 1930-2002) - conforme matumbecapoeira.com

CONTRA-MESTRES COMPANHEIROS DE CAIÇARA:
- Mestre Zé (apelido_context: Caiçara)
- Fernandinho (Fernando Olímpio Paes Filho, 1948-2001)
- Silvestre (Silvestre Vitório Ferreira, conhecido como Ferreirinha em Salvador)

LOCAL DE TREINAMENTO:
- Mercado de peixe do Jardim Cruzeiro, Cidade Baixa, Salvador
- Próximo ao Largo de Argolo, entre os bairros Massaranduba e Jardim Cruzeiro

POSSÍVEL CONFUSÃO DE IDENTIDADE COM MESTRE LIMÃO:
Há suspeita razoável de que "Paulo Santo Amaro" no testemunho oral do velhosmestres.com possa na verdade se referir a Mestre Limão (Paulo dos Santos, 1945-1985):

EVIDÊNCIAS A FAVOR DE SER A MESMA PESSOA:
- Ambos chamados "Paulo" de Santo Amaro da Purificação
- Ambos receberam título de contra-mestre de Mestre Caiçara
- Fonte velhosmestres.com é TESTEMUNHO ORAL (Omilad D''Angola) - pode usar "Paulo Santo Amaro" como referência coloquial a "aquele Paulo de Santo Amaro" (ou seja, Limão)
- Listado junto com Fernandinho (n. 1948) - idade similar a Limão (n. 1945)

EVIDÊNCIAS A FAVOR DE SEREM PESSOAS DISTINTAS:
- matumbecapoeira.com lista "Paulo de Santo Amaro" como PROFESSOR de Gato Preto (n. 1930)
- Limão (n. 1945) era 15 anos MAIS NOVO que Gato Preto - impossível Limão tê-lo ensinado
- Limão recebeu contra-mestre em São Paulo (1969); velhosmestres coloca Paulo Santo Amaro no Jardim Cruzeiro, Salvador
- SE matumbecapoeira.com estiver correto, DEVEM ser pessoas diferentes

RESSALVA CRÍTICA:
- matumbecapoeira.com é site de grupo (Nível 2) - dados de linhagem podem conter erros
- Se matumbecapoeira.com estiver errado sobre os professores de Gato Preto, a distinção colapsa
- velhosmestres.com é testemunho oral sem data - sujeito a confusão de memória

RESOLUÇÃO NECESSÁRIA:
Esta questão só pode ser resolvida por:
1. Encontrar fontes primárias adicionais sobre "Paulo Santo Amaro" ou "Paulo de Santo Amaro"
2. Verificar a linhagem de Gato Preto do matumbecapoeira.com em fontes independentes
3. Determinar a data e contexto do testemunho de Omilad D''Angola

QUALIDADE DAS FONTES:
- velhosmestres.com (Nível 1) - única menção em TESTEMUNHO ORAL de Omilad D''Angola (sem data)
- matumbecapoeira.com (Nível 2) - linhagem de site de grupo; pode conter erros
- Nenhuma fotografia, entrevista ou fonte biográfica detalhada encontrada
- DOCUMENTAÇÃO ESCASSA no geral; possível duplicata de Limão'
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
