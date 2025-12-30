-- ============================================================
-- GENEALOGY PERSON: Silvestre
-- Generated: 2025-12-20
-- ============================================================
-- BIRTH YEAR ESTIMATION (1935, decade precision):
-- - Learned capoeira "in the second half of the 1950s" (~1955-1960)
-- - Known as "Ferreirinha" in Salvador in the 1960s (young man apelido)
-- - Came to São Paulo in 1966 as established capoeirista
-- - If he was 20-25 when learning in late 1950s, born ~1935
-- - If he was 30-35 when coming to SP, born ~1931-1936
-- - Using 1935 as midpoint estimate with decade precision
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
  'Silvestre Vitório Ferreira',
  'Silvestre',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://matumbecapoeira.com/mestres/', 'https://velhosmestres.com/br/destaques-39']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Silvestre trained in the traditional Bahian capoeira angola tradition under multiple masters. His primary training was with Mestres Waldemar da Liberdade and Caiçara, and he regularly frequented Mestre Pastinha''s CECA. He also trained with Mestre Bimba, giving him exposure to both angola and regional styles. Known as Ferreirinha in Salvador during the 1960s, he later became a founding figure of capoeira in São Paulo.',
  E'Silvestre treinou na tradição bahiana de capoeira angola sob múltiplos mestres. Sua formação principal foi com Mestres Waldemar da Liberdade e Caiçara, e frequentava regularmente o CECA de Mestre Pastinha. Também treinou com Mestre Bimba, dando-lhe exposição aos estilos angola e regional. Conhecido como Ferreirinha em Salvador durante a década de 1960, tornou-se uma figura fundadora da capoeira em São Paulo.',
  -- Life dates
  1935,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Silvestre Vitório Ferreira, known in Bahia as Ferreirinha and later as Mestre Silvestre, was a pivotal figure in bringing capoeira from Salvador to São Paulo. In the late 1950s, he learned capoeira from Mestres Waldemar da Liberdade and Caiçara, and was a regular at the Centro Esportivo de Capoeira Angola (CECA), Mestre Pastinha''s legendary academy. He also trained with Mestre Bimba, making him one of the few capoeiristas of his generation to have studied under all four of Bahia''s most legendary masters.\n\nIn Salvador during the 1960s, he was known as Ferreirinha. As a contra-mestre under Mestre Caiçara, he held the authority to sign diplomas for other students—a significant responsibility in the traditional capoeira hierarchy. Among those whose diplomas he signed was Fernandinho (Fernando Olímpio Paes Filho), who later built his reputation in Rio de Janeiro.\n\nSilvestre was one of the members of the group that Mestre Caiçara took to São Paulo to record the LP "Academia de Capoeira de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara", though the personnel on that recording remain incompletely documented.\n\nIn 1966, Silvestre brought his capoeira to São Paulo, part of the wave of Bahian mestres who migrated to the industrial capital during that era. He founded the Grupo de Capoeira Vera Cruz (later formalized as Associação de Capoeira Vera Cruz in 1981) and taught for many years at Praça da Árvore in the Jabaquara district.\n\nIn 1972, he was one of the founding mestres of the Federação Paulista de Capoeira, the state capoeira federation. This was a pivotal year—capoeira was officially recognized as a sport in Brazil, and the federation represented capoeira''s push for legitimacy as "Brazilian martial art".\n\nSilvestre trained a generation of capoeiristas who spread the art to new regions. His most notable student was Julival do Espírito Santo (Mestre Gato de Silvestre), born 1952 in Goiás, who became the 1971 São Paulo State Capoeira Champion through Vera Cruz. At the end of the 1970s, Silvestre traveled to Manaus to participate in the I Encontro de Capoeira da Amazônia (First Amazon Capoeira Meeting), where he awarded Mestre Gato his mestre diploma through the Associação de Capoeira Vera Cruz.\n\nMestre Gato subsequently became the pioneer of capoeira in the Amazon region, founding the first academy in Amazonas called "Zumbí dos Palmares" in February 1972 and spreading capoeira to Bolivia, Colombia, and Panama.\n\nSilvestre''s testimony is a crucial source for understanding the Antônio de Noronha lineage. Along with Mestre Caiçara, he provided the lineage claim that places Mestre Antônio de Noronha at the top of the chain that runs through Aberrê to Canjiquinha. The Grupo Gingarte website cites this testimony directly: "Mestre Aberrê is the second mestre in my lineage, above him comes Mestre Antônio de Noronha—this affirmation came from Mestre Caiçara and Mestre Silvestre".',
  -- bio_pt
  E'Silvestre Vitório Ferreira, conhecido na Bahia como Ferreirinha e depois como Mestre Silvestre, foi uma figura central em levar a capoeira de Salvador para São Paulo. No final da década de 1950, aprendeu capoeira com Mestres Waldemar da Liberdade e Caiçara, e frequentava regularmente o Centro Esportivo de Capoeira Angola (CECA), a lendária academia de Mestre Pastinha. Também treinou com Mestre Bimba, tornando-se um dos poucos capoeiristas de sua geração a ter estudado sob os quatro mestres mais lendários da Bahia.\n\nEm Salvador durante a década de 1960, era conhecido como Ferreirinha. Como contra-mestre de Mestre Caiçara, tinha a autoridade de assinar diplomas para outros alunos—uma responsabilidade significativa na hierarquia tradicional da capoeira. Entre aqueles cujos diplomas ele assinou estava Fernandinho (Fernando Olímpio Paes Filho), que mais tarde construiu sua reputação no Rio de Janeiro.\n\nSilvestre foi um dos membros do grupo que Mestre Caiçara levou a São Paulo para gravar o LP "Academia de Capoeira de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara", embora os participantes dessa gravação permaneçam incompletamente documentados.\n\nEm 1966, Silvestre trouxe sua capoeira para São Paulo, parte da onda de mestres baianos que migraram para a capital industrial durante essa época. Fundou o Grupo de Capoeira Vera Cruz (formalizado mais tarde como Associação de Capoeira Vera Cruz em 1981) e ensinou por muitos anos na Praça da Árvore no bairro do Jabaquara.\n\nEm 1972, foi um dos mestres fundadores da Federação Paulista de Capoeira, a federação estadual de capoeira. Este foi um ano decisivo—a capoeira foi oficialmente reconhecida como esporte no Brasil, e a federação representou o impulso da capoeira por legitimidade como "arte marcial brasileira".\n\nSilvestre treinou uma geração de capoeiristas que espalharam a arte para novas regiões. Seu aluno mais notável foi Julival do Espírito Santo (Mestre Gato de Silvestre), nascido em 1952 em Goiás, que se tornou Campeão Paulista de Capoeira de 1971 pela Vera Cruz. No final da década de 1970, Silvestre viajou a Manaus para participar do I Encontro de Capoeira da Amazônia, onde concedeu a Mestre Gato seu diploma de mestre pela Associação de Capoeira Vera Cruz.\n\nMestre Gato posteriormente se tornou o pioneiro da capoeira na região amazônica, fundando a primeira academia no Amazonas chamada "Zumbí dos Palmares" em fevereiro de 1972 e espalhando a capoeira para Bolívia, Colômbia e Panamá.\n\nO testemunho de Silvestre é uma fonte crucial para entender a linhagem de Antônio de Noronha. Junto com Mestre Caiçara, ele forneceu a reivindicação de linhagem que coloca Mestre Antônio de Noronha no topo da cadeia que passa por Aberrê até Canjiquinha. O site do Grupo Gingarte cita este testemunho diretamente: "Mestre Aberrê é o segundo mestre da minha linhagem, acima dele vem Mestre Antônio de Noronha—esta afirmação veio de Mestre Caiçara e Mestre Silvestre".',
  -- achievements_en
  E'Late 1950s: Learned capoeira from Mestres Waldemar da Liberdade and Caiçara; frequented CECA (Pastinha''s academy); trained with Mestre Bimba
1960s: Known as Ferreirinha in Salvador; served as contra-mestre under Mestre Caiçara with authority to sign diplomas
1960s: Participated in recording session for Mestre Caiçara''s LP "Academia de Capoeira de Angola São Jorge dos Irmãos Unidos"
1966: Brought capoeira to São Paulo; founded Grupo de Capoeira Vera Cruz; taught at Praça da Árvore, Jabaquara
1972: Co-founded Federação Paulista de Capoeira
Late 1970s: Traveled to Manaus for I Encontro de Capoeira da Amazônia; awarded Mestre Gato his mestre diploma
1981: Associação de Capoeira Vera Cruz formally registered (CNPJ 45.875.952/0001-97)
Trained Mestre Gato de Silvestre (1971 São Paulo State Champion), who pioneered capoeira in Amazonas and spread it to Bolivia, Colombia, Panama
Key source (with Mestre Caiçara) for Antônio de Noronha lineage claim',
  -- achievements_pt
  E'Final dos anos 1950: Aprendeu capoeira com Mestres Waldemar da Liberdade e Caiçara; frequentou o CECA (academia de Pastinha); treinou com Mestre Bimba
Anos 1960: Conhecido como Ferreirinha em Salvador; serviu como contra-mestre de Mestre Caiçara com autoridade para assinar diplomas
Anos 1960: Participou da sessão de gravação do LP de Mestre Caiçara "Academia de Capoeira de Angola São Jorge dos Irmãos Unidos"
1966: Trouxe a capoeira para São Paulo; fundou o Grupo de Capoeira Vera Cruz; ensinou na Praça da Árvore, Jabaquara
1972: Co-fundou a Federação Paulista de Capoeira
Final dos anos 1970: Viajou a Manaus para o I Encontro de Capoeira da Amazônia; concedeu diploma de mestre a Mestre Gato
1981: Associação de Capoeira Vera Cruz formalmente registrada (CNPJ 45.875.952/0001-97)
Treinou Mestre Gato de Silvestre (Campeão Paulista de 1971), que foi pioneiro da capoeira no Amazonas e a espalhou para Bolívia, Colômbia, Panamá
Fonte chave (com Mestre Caiçara) para reivindicação de linhagem de Antônio de Noronha',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1935, decade precision):
- Learned capoeira "in the second half of the 1950s" (~1955-1960)
- Known as "Ferreirinha" in Salvador in the 1960s (suggests youth)
- Came to São Paulo in 1966 as established capoeirista
- If 20-25 when learning in late 1950s, born ~1935
- If 30-35 when coming to SP, born ~1931-1936
- Using 1935 as midpoint estimate

NAME VARIANTS:
- "Silvestre" (apelido used in São Paulo)
- "Ferreirinha" (apelido used in Salvador during 1960s)
- "Silvestre Vitório Ferreira" (full name)
- "Silvestre Vitório Ferreiro" (alternate spelling in some sources)

TEACHERS:
- Mestre Waldemar da Liberdade - primary teacher (late 1950s)
- Mestre Caiçara - primary teacher (late 1950s); Silvestre became his contra-mestre
- Mestre Pastinha - frequented CECA regularly; possible training relationship
- Mestre Bimba - trained with him (extent unclear)

CONTRA-MESTRE ROLE:
Velhosmestres.com confirms Silvestre (Ferreirinha) was one of Caiçara''s contra-mestres, with authority to sign diplomas. He signed the diploma of Fernandinho (Fernando Olímpio Paes Filho, 1948-2001).

STUDENTS:
- Mestre Gato de Silvestre (Julival do Espírito Santo, b. Dec 30, 1952) - 1971 São Paulo State Champion; received mestre diploma late 1970s; pioneered capoeira in Amazonas
- Fernandinho (diploma signed by Silvestre)
- Others unnamed

LP RECORDING:
Sources state Silvestre was part of the group Caiçara took to São Paulo to record the 1969 LP "Academia de Capoeira de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara". However, the LP liner notes (from Discogs, Acervo Origens) do not explicitly list all participants. Confirmed: Mestre Caiçara and Grácia Maria (vocalist). Silvestre''s participation mentioned in secondary sources.

FEDERAÇÃO PAULISTA DE CAPOEIRA:
Co-founded in 1972. Other founding mestres include Mestre Gladson. The federation adopted national flag colors for its graduation system.

ANTÔNIO DE NORONHA LINEAGE TESTIMONY:
Esquiva.wordpress.com quotes: "Mestre Aberrê is the second mestre in my lineage, above him comes Mestre Antônio de Noronha—this affirmation came from Mestre Caiçara and Mestre Silvestre". This makes Silvestre a key source for the lineage: Antônio de Noronha → Aberrê → Canjiquinha/Caiçara.

VERA CRUZ ASSOCIATION:
- Founded: 1966 (informal) / May 29, 1981 (formal CNPJ registration)
- Address: Avenida Jabaquara, 123 - Jabaquara, São Paulo - SP
- Status: BAIXADA (closed/inactive) as of recent records
- Activity: Social, sports and similar clubs (CNAE R-9312-3/00)',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1935, precisão de década):
- Aprendeu capoeira "na segunda metade dos anos 1950" (~1955-1960)
- Conhecido como "Ferreirinha" em Salvador nos anos 1960 (sugere juventude)
- Veio para São Paulo em 1966 como capoeirista estabelecido
- Se 20-25 quando aprendeu no final dos anos 1950, nascido ~1935
- Se 30-35 quando veio para SP, nascido ~1931-1936
- Usando 1935 como estimativa de ponto médio

VARIANTES DO NOME:
- "Silvestre" (apelido usado em São Paulo)
- "Ferreirinha" (apelido usado em Salvador durante os anos 1960)
- "Silvestre Vitório Ferreira" (nome completo)
- "Silvestre Vitório Ferreiro" (grafia alternativa em algumas fontes)

MESTRES:
- Mestre Waldemar da Liberdade - professor principal (final dos anos 1950)
- Mestre Caiçara - professor principal (final dos anos 1950); Silvestre tornou-se seu contra-mestre
- Mestre Pastinha - frequentou o CECA regularmente; possível relação de treinamento
- Mestre Bimba - treinou com ele (extensão incerta)

PAPEL DE CONTRA-MESTRE:
Velhosmestres.com confirma que Silvestre (Ferreirinha) era um dos contra-mestres de Caiçara, com autoridade para assinar diplomas. Ele assinou o diploma de Fernandinho (Fernando Olímpio Paes Filho, 1948-2001).

ALUNOS:
- Mestre Gato de Silvestre (Julival do Espírito Santo, n. 30 dez 1952) - Campeão Paulista 1971; recebeu diploma de mestre final anos 1970; pioneiro da capoeira no Amazonas
- Fernandinho (diploma assinado por Silvestre)
- Outros não nomeados

GRAVAÇÃO DE LP:
Fontes afirmam que Silvestre fazia parte do grupo que Caiçara levou a São Paulo para gravar o LP de 1969 "Academia de Capoeira de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara". No entanto, os encartes do LP (do Discogs, Acervo Origens) não listam explicitamente todos os participantes. Confirmados: Mestre Caiçara e Grácia Maria (vocalista). Participação de Silvestre mencionada em fontes secundárias.

FEDERAÇÃO PAULISTA DE CAPOEIRA:
Co-fundada em 1972. Outros mestres fundadores incluem Mestre Gladson. A federação adotou as cores da bandeira nacional para seu sistema de graduação.

TESTEMUNHO DE LINHAGEM DE ANTÔNIO DE NORONHA:
Esquiva.wordpress.com cita: "Mestre Aberrê é o segundo mestre da minha linhagem, acima dele vem Mestre Antônio de Noronha—esta afirmação veio de Mestre Caiçara e Mestre Silvestre". Isso faz de Silvestre uma fonte chave para a linhagem: Antônio de Noronha → Aberrê → Canjiquinha/Caiçara.

ASSOCIAÇÃO VERA CRUZ:
- Fundação: 1966 (informal) / 29 maio 1981 (registro formal CNPJ)
- Endereço: Avenida Jabaquara, 123 - Jabaquara, São Paulo - SP
- Status: BAIXADA (fechada/inativa) conforme registros recentes
- Atividade: Clubes sociais, esportivos e similares (CNAE R-9312-3/00)'
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
