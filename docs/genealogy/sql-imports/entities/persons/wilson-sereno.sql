-- ============================================================
-- GENEALOGY PERSON: Wilson Sereno
-- Generated: 2026-01-11
-- ============================================================
-- Mestre Wilson Sereno was a Bahian capoeira Angola practitioner who
-- migrated from Salvador to Rio de Janeiro, where he taught at Casa
-- do Marinheiro during the 1970s alongside Mestre Moraes and other
-- Navy-associated capoeiristas. His lineage connects three major
-- mestres: Cobrinha Verde, Bimba, and especially Caiçara.
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
  NULL, -- Full name unknown
  'Wilson Sereno',
  'mestre'::genealogy.title,
  NULL, -- No portrait available
  ARRAY['https://www.capoeirahub.net/mestres/693dbe24de8a6d001517e9fe-mestre-wilson-sereno']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Wilson Sereno was trained in Capoeira Angola, particularly under Mestre Caiçara''s influence. His style reflected the traditional Bahian Angola approach, though he also received instruction from Mestre Bimba (founder of Regional) and Mestre Cobrinha Verde (legendary Angola mestre and cousin of Besouro). This cross-lineage training gave him exposure to both major capoeira traditions.',
  E'Wilson Sereno foi treinado em Capoeira Angola, particularmente sob a influência de Mestre Caiçara. Seu estilo refletia a abordagem tradicional Angola baiana, embora também tenha recebido instrução de Mestre Bimba (fundador da Regional) e Mestre Cobrinha Verde (lendário mestre de Angola e primo de Besouro). Este treinamento entre linhagens deu-lhe exposição às duas principais tradições da capoeira.',
  -- Life dates
  1935, -- Estimated: teaching in Rio 1970s, trained under Bimba (d.1974), Cobrinha Verde (d.1983), Caiçara (b.1924)
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL, -- Death year unknown
  NULL,
  NULL, -- Death place unknown
  -- bio_en
  E'Wilson Sereno was a Bahian capoeirista who originated from Salvador and eventually migrated to Rio de Janeiro, becoming part of an important wave of Bahian capoeira practitioners who brought Capoeira Angola traditions to the former capital city during the 1970s.

In Salvador, Wilson Sereno studied under three significant mestres of the mid-twentieth century capoeira world. His primary teacher was Mestre Caiçara (Antônio Conceição Moraes, 1924-1997), the legendary and controversial angoleiro known for his hard fighting style and iconic bengala (walking cane). Wilson Sereno also trained with Mestre Cobrinha Verde (Rafael Alves França, 1912-1983), the cousin and student of Besouro Mangangá who introduced the floor-touching mandinga gesture to Capoeira Angola. Additionally, he received instruction from Mestre Bimba (Manuel dos Reis Machado, 1899-1974), the founder of Capoeira Regional—demonstrating exposure to both major capoeira lineages.

After moving to Rio de Janeiro, Wilson Sereno taught at Casa do Marinheiro (Sailor''s House) on Avenida Brasil. This location was significant during the early 1970s as a meeting point for capoeiristas with Navy connections. Mestre Moraes, who arrived in Rio de Janeiro as a Navy marine around 1970, also frequented Casa do Marinheiro. The presence of both Wilson Sereno and Moraes at this location suggests it was an important early venue for the transmission of Bahian Capoeira Angola in Rio de Janeiro, prior to GCAP''s official founding in 1980.

Wilson Sereno''s role in Rio de Janeiro''s capoeira angola community connects the traditional Salvador Angola lineages to the emerging scene that would eventually produce GCAP and other groups dedicated to preserving Pastinha''s Angola tradition in Rio de Janeiro.

Among his known students is Mestre Nilson da Penha, based in Rio de Janeiro.',
  -- bio_pt
  E'Wilson Sereno foi um capoeirista baiano originário de Salvador que eventualmente migrou para o Rio de Janeiro, tornando-se parte de uma importante onda de praticantes baianos de capoeira que trouxeram as tradições da Capoeira Angola para a antiga capital durante os anos 1970.

Em Salvador, Wilson Sereno estudou com três mestres significativos do mundo da capoeira de meados do século XX. Seu professor principal foi Mestre Caiçara (Antônio Conceição Moraes, 1924-1997), o lendário e controverso angoleiro conhecido por seu estilo de luta duro e icônica bengala. Wilson Sereno também treinou com Mestre Cobrinha Verde (Rafael Alves França, 1912-1983), o primo e aluno de Besouro Mangangá que introduziu o gesto de mandinga de tocar o chão na Capoeira Angola. Adicionalmente, recebeu instrução de Mestre Bimba (Manuel dos Reis Machado, 1899-1974), o fundador da Capoeira Regional—demonstrando exposição a ambas as principais linhagens da capoeira.

Após mudar-se para o Rio de Janeiro, Wilson Sereno ensinou na Casa do Marinheiro na Avenida Brasil. Este local foi significativo durante o início dos anos 1970 como ponto de encontro para capoeiristas com conexões navais. Mestre Moraes, que chegou ao Rio de Janeiro como fuzileiro naval por volta de 1970, também frequentava a Casa do Marinheiro. A presença de Wilson Sereno e Moraes neste local sugere que foi um importante local inicial para a transmissão da Capoeira Angola baiana no Rio de Janeiro, antes da fundação oficial do GCAP em 1980.

O papel de Wilson Sereno na comunidade de capoeira angola do Rio de Janeiro conecta as tradições de linhagem Angola de Salvador à cena emergente que eventualmente produziria o GCAP e outros grupos dedicados a preservar a tradição Angola de Pastinha no Rio de Janeiro.

Entre seus alunos conhecidos está Mestre Nilson da Penha, baseado no Rio de Janeiro.',
  -- achievements_en
  E'Trained under three major mestres: Caiçara (primary), Cobrinha Verde, and Bimba
Part of the Bahian migration that brought Capoeira Angola to Rio de Janeiro in the 1970s
Taught at Casa do Marinheiro on Avenida Brasil, Rio de Janeiro
Contemporary of Mestre Moraes at Casa do Marinheiro
Trained Mestre Nilson da Penha in Rio de Janeiro',
  -- achievements_pt
  E'Treinou com três mestres importantes: Caiçara (principal), Cobrinha Verde e Bimba
Parte da migração baiana que trouxe a Capoeira Angola para o Rio de Janeiro nos anos 1970
Ensinou na Casa do Marinheiro na Avenida Brasil, Rio de Janeiro
Contemporâneo de Mestre Moraes na Casa do Marinheiro
Treinou Mestre Nilson da Penha no Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1935, decade):
Wilson Sereno was teaching at Casa do Marinheiro in Rio de Janeiro in the early 1970s, contemporary with Mestre Moraes who arrived ~1970. To be an established mestre teaching at this level, he would likely be 30-40 years old. He had already trained under three mestres in Salvador: Caiçara (1924-1997), Cobrinha Verde (1912-1983), and Bimba (1899-1974, left Salvador 1972). If he trained with Bimba before 1972 and was teaching in Rio by 1970, his training was likely in the 1950s-1960s. Estimated birth ~1935 places him at age 20-25 during training period and 35-40 when teaching in Rio.

DEATH DATE: Unknown. No information found.

BIRTHPLACE: Salvador, Bahia - confirmed by CapoeiraHub profile

CURRENT LOCATION: Rio de Janeiro (after migration from Salvador)

TEACHERS (per CapoeiraHub):
1. Mestre Caiçara - PRIMARY teacher ("especially Mestre Caiçara" per CapoeiraHub)
2. Mestre Cobrinha Verde - secondary/influence
3. Mestre Bimba - secondary/influence

STUDENTS (per CapoeiraHub):
- Mestre Nilson da Penha (Rio de Janeiro-based)

TEACHING LOCATION: Casa do Marinheiro (Sailor''s House), Avenida Brasil, Rio de Janeiro

CASA DO MARINHEIRO CONTEXT:
Casa do Marinheiro was a Navy-affiliated facility on Avenida Brasil in Rio de Janeiro. During the early 1970s, it served as a teaching location for capoeiristas with military/Navy connections. Mestre Moraes, who came to Rio as a fuzileiro naval (Navy marine), also frequented this location. This places Wilson Sereno at an important early node in the establishment of Bahian Capoeira Angola in Rio de Janeiro, prior to GCAP''s founding in 1980.

TIMELINE ESTIMATION:
- Likely active in Salvador: 1950s-1960s (based on teacher timelines)
- Migration to Rio: Probably early 1970s (contemporary with Moraes''s arrival ~1970)
- Teaching at Casa do Marinheiro: 1970s

SOURCE RELIABILITY:
Primary source is CapoeiraHub profile, which provides basic biographical data. The reference to Casa do Marinheiro is mentioned in academic literature about capoeira angola''s implantation in Rio de Janeiro 1970-1981.

DATA GAPS:
- Full name unknown
- Birth/death dates unknown
- No photographs or media appearances documented
- Limited information about his specific training period with each mestre
- Student roster incomplete beyond Nilson da Penha',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1935, década):
Wilson Sereno estava ensinando na Casa do Marinheiro no Rio de Janeiro no início dos anos 1970, contemporâneo de Mestre Moraes que chegou ~1970. Para ser um mestre estabelecido ensinando neste nível, ele provavelmente teria 30-40 anos. Ele já tinha treinado com três mestres em Salvador: Caiçara (1924-1997), Cobrinha Verde (1912-1983) e Bimba (1899-1974, deixou Salvador 1972). Se ele treinou com Bimba antes de 1972 e estava ensinando no Rio por volta de 1970, seu treinamento foi provavelmente nos anos 1950-1960. Nascimento estimado ~1935 o coloca com 20-25 anos durante o período de treinamento e 35-40 quando ensinava no Rio.

DATA DE MORTE: Desconhecida. Nenhuma informação encontrada.

LOCAL DE NASCIMENTO: Salvador, Bahia - confirmado pelo perfil do CapoeiraHub

LOCALIZAÇÃO ATUAL: Rio de Janeiro (após migração de Salvador)

MESTRES (per CapoeiraHub):
1. Mestre Caiçara - professor PRINCIPAL ("especialmente Mestre Caiçara" per CapoeiraHub)
2. Mestre Cobrinha Verde - secundário/influência
3. Mestre Bimba - secundário/influência

ALUNOS (per CapoeiraHub):
- Mestre Nilson da Penha (baseado no Rio de Janeiro)

LOCAL DE ENSINO: Casa do Marinheiro, Avenida Brasil, Rio de Janeiro

CONTEXTO DA CASA DO MARINHEIRO:
Casa do Marinheiro era uma instalação afiliada à Marinha na Avenida Brasil no Rio de Janeiro. Durante o início dos anos 1970, serviu como local de ensino para capoeiristas com conexões militares/navais. Mestre Moraes, que veio ao Rio como fuzileiro naval, também frequentava este local. Isso posiciona Wilson Sereno em um importante nó inicial no estabelecimento da Capoeira Angola baiana no Rio de Janeiro, antes da fundação do GCAP em 1980.

ESTIMATIVA DE LINHA DO TEMPO:
- Provavelmente ativo em Salvador: anos 1950-1960 (baseado nas linhas do tempo dos mestres)
- Migração para o Rio: Provavelmente início dos anos 1970 (contemporâneo da chegada de Moraes ~1970)
- Ensinando na Casa do Marinheiro: anos 1970

CONFIABILIDADE DAS FONTES:
Fonte principal é o perfil do CapoeiraHub, que fornece dados biográficos básicos. A referência à Casa do Marinheiro é mencionada em literatura acadêmica sobre a implantação da capoeira angola no Rio de Janeiro 1970-1981.

LACUNAS DE DADOS:
- Nome completo desconhecido
- Datas de nascimento/morte desconhecidas
- Nenhuma fotografia ou aparição em mídia documentada
- Informação limitada sobre seu período específico de treinamento com cada mestre
- Lista de alunos incompleta além de Nilson da Penha'
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
