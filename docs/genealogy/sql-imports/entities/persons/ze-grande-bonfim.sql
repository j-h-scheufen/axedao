-- ============================================================
-- GENEALOGY PERSON: Zé Grande (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930, decade precision):
-- Zé Grande was already established as a leader and teaching when Mestre
-- Gary began training in 1957 at age 12. Zé Grande came to Rio in the early
-- 1950s with his brothers from Bahia. He was described as "best disciple"
-- of Mário Buscapé by the time Bonfim was founded in 1953. Estimating birth
-- around 1930 places him in his early 20s when the group was founded.
-- ============================================================
-- DEATH: Confirmed deceased (sources refer to "the late Master Zé Grande").
-- No death date or year found in sources.
-- ============================================================
-- APELIDO CONTEXT: "Bonfim" distinguishes him from José Carlos Cruz
-- (Mestre Grande/Zé Grande), born 1950, died 2017, from a different lineage
-- (via Zé Maria and Paulinho Salmon). These are DIFFERENT people.
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; from the dos Santos family
  'Zé Grande',
  'Bonfim', -- Distinguishes from José Carlos Cruz (Mestre Grande)
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/', 'https://capoeiraliberdade.net.br/view/historia.php']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era
  E'Zé Grande learned capoeira from Mário Buscapé, who brought Bahian Recôncavo traditions to Rio de Janeiro. His style was practical and competitive, emphasizing training high-level fighters who excelled in Rio''s competitions from the mid-1960s. He maintained strict traditional protocols in the roda, such as calling the toque de iuna for mestres-only play. His capoeira was part of the "dangerous" era of the 1960s-70s, characterized by constant headbutts and rasteiras, without uniforms or cords.',
  E'Zé Grande aprendeu capoeira com Mário Buscapé, que trouxe as tradições do Recôncavo Baiano para o Rio de Janeiro. Seu estilo era prático e competitivo, enfatizando o treinamento de lutadores de alto nível que se destacavam nas competições do Rio a partir de meados dos anos 1960. Ele mantinha protocolos tradicionais rígidos na roda, como chamar o toque de iuna para jogar apenas mestres. Sua capoeira fazia parte da era "perigosa" dos anos 1960-70, caracterizada por cabeçadas e rasteiras constantes, sem uniformes ou cordas.',
  -- Life dates
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil', -- From Bahia like his brothers, exact location unknown
  NULL, -- Deceased but year unknown
  NULL,
  NULL,
  -- bio_en
  E'Zé Grande was one of the foundational figures in establishing the Bonfim capoeira lineage in Rio de Janeiro. A native of Bahia, he came to Rio de Janeiro in the early 1950s along with his brothers Irineu dos Santos and Deraldo—all from the dos Santos family, unrelated to their teacher Mário Buscapé despite sharing the same surname.

When Mário Buscapé began teaching capoeira at the Cavan company where he worked, Irineu was his first student. Through Irineu, Mário soon won other followers, including Zé Grande and Deraldo. On January 6, 1953, they founded the Associação Cultural Bonfim, also known as "Capoeiras do Bonfim."

The group initially occupied a small space in the neighborhood of São Cristóvão. As historian André Lacé wrote: "They didn''t stay there for long, because the space became small due to the large number of students. They moved the academy to the neighborhood of Olaria, a spacious and pleasant place, and there they never stopped, training great capoeiristas, like the late Master Zé Grande, who stood out as their best disciple."

The Bonfim group, led by Mário Buscapé, became famous in Rio de Janeiro for training high-level competitors who often won the competitions that began being organized in the city from the mid-1960s.

In 1969, when Mário Buscapé returned to Bahia, Zé Grande and Deraldo took over leadership of the Bonfim group. Zé Grande served as president of the group, with headquarters later established in the Bonsucesso neighborhood. The group continued to flourish under their direction.

According to Mestre Gary (Mestre 22), who began training at Bonfim in 1957 at age 12, Zé Grande maintained strict traditional protocols in the roda: "Mestre Zé Grande, my mestre, would call for the toque de iuna and only mestres would play—this was the tradition. It was very beautiful to see."

Among the prominent capoeiristas of that era, Gary listed: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—and myself, Mestre 22 da Bonfim." He described this period as a time when capoeira was "very dangerous," with no uniforms or cords—practitioners wore normal clothing and identified simply as "capoeira players."

Zé Grande, along with his brother Deraldo, Mestres Dentinho, and Mintirinha, is credited as one of the initiators of the capoeira roda at the Festa da Penha, which became one of the main street rodas in Rio de Janeiro by the 1970s.

At age 18, Mestre Soldado transitioned to training at the main Bonfim headquarters in Bonsucesso, where he studied under "Mestres Deraldo and Zé Grande (the president of the Bonfim group)." Soldado graduated from Mestre Deraldo in 1973.

Zé Grande trained and formed numerous capoeiristas including Mestre Gary (Mestre 22), who in turn trained Mestres Lébio, Rui Charuto, Mão de Onça, Toinho, Elias, and Mestra Marly Malvadeza—extending the Bonfim lineage to the present day.',
  -- bio_pt
  E'Zé Grande foi uma das figuras fundamentais no estabelecimento da linhagem de capoeira Bonfim no Rio de Janeiro. Natural da Bahia, ele veio para o Rio de Janeiro no início dos anos 1950 junto com seus irmãos Irineu dos Santos e Deraldo—todos da família dos Santos, sem parentesco com seu professor Mário Buscapé apesar de compartilharem o mesmo sobrenome.

Quando Mário Buscapé começou a ensinar capoeira na empresa Cavan onde trabalhava, Irineu foi seu primeiro aluno. Através de Irineu, Mário logo conquistou outros seguidores, incluindo Zé Grande e Deraldo. Em 6 de janeiro de 1953, fundaram a Associação Cultural Bonfim, também conhecida como "Capoeiras do Bonfim."

O grupo inicialmente ocupava um pequeno espaço no bairro de São Cristóvão. Como o historiador André Lacé escreveu: "Não ficaram lá por muito tempo, porque o espaço ficou pequeno devido ao grande número de alunos. Mudaram a academia para o bairro de Olaria, um lugar espaçoso e agradável, e lá nunca pararam, treinando grandes capoeiristas, como o saudoso Mestre Zé Grande, que se destacou como o melhor discípulo."

O grupo Bonfim, liderado por Mário Buscapé, tornou-se famoso no Rio de Janeiro por formar competidores de alto nível que frequentemente venciam as competições que começaram a ser organizadas na cidade a partir de meados dos anos 1960.

Em 1969, quando Mário Buscapé retornou à Bahia, Zé Grande e Deraldo assumiram a liderança do grupo Bonfim. Zé Grande atuou como presidente do grupo, com sede posteriormente estabelecida no bairro de Bonsucesso. O grupo continuou a prosperar sob sua direção.

Segundo Mestre Gary (Mestre 22), que começou a treinar no Bonfim em 1957 aos 12 anos, Zé Grande mantinha protocolos tradicionais rígidos na roda: "Mestre Zé Grande, meu mestre, mandava dar o toque de iuna e só jogavam os mestres—essa era a tradição. Era muito bonito de ver."

Entre os capoeiristas proeminentes daquela época, Gary listou: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—e eu mesmo, Mestre 22 da Bonfim." Ele descreveu este período como uma época em que a capoeira era "muito perigosa," sem uniformes ou cordas—os praticantes usavam roupas normais e se identificavam simplesmente como "jogadores de capoeira."

Zé Grande, junto com seu irmão Deraldo, os Mestres Dentinho e Mintirinha, é creditado como um dos iniciadores da roda de capoeira na Festa da Penha, que se tornou uma das principais rodas de rua do Rio de Janeiro nos anos 1970.

Aos 18 anos, Mestre Soldado passou a treinar na sede principal do Bonfim em Bonsucesso, onde estudou com "os Mestres Deraldo e Zé Grande (o presidente do grupo Bonfim)." Soldado se formou com Mestre Deraldo em 1973.

Zé Grande treinou e formou vários capoeiristas incluindo Mestre Gary (Mestre 22), que por sua vez treinou os Mestres Lébio, Rui Charuto, Mão de Onça, Toinho, Elias e Mestra Marly Malvadeza—estendendo a linhagem Bonfim até os dias atuais.',
  -- achievements_en
  'Co-founder of Associação Cultural Bonfim (January 6, 1953); Best disciple of Mestre Mário Buscapé; President of Grupo Bonfim; Co-leader of Grupo Bonfim (from 1969); Initiator of the Roda da Penha (1960s); Trained Mestre Gary (Mestre 22) and other notable capoeiristas',
  -- achievements_pt
  'Co-fundador da Associação Cultural Bonfim (6 de janeiro de 1953); Melhor discípulo de Mestre Mário Buscapé; Presidente do Grupo Bonfim; Co-líder do Grupo Bonfim (a partir de 1969); Iniciador da Roda da Penha (anos 1960); Formou Mestre Gary (Mestre 22) e outros capoeiristas notáveis',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1930, decade):
Mestre Gary began training at Bonfim in 1957 at age 12 under Zé Grande and Deraldo, who were already established instructors. Zé Grande was described as the "best disciple" of Mário Buscapé when the group was founded in 1953. Estimating birth around 1930 places him in his early 20s at founding—old enough to be a skilled capoeirista but still a generation below Mário (b. 1934). The imprecision of "decade" reflects limited documentation.

DEATH: Confirmed deceased. Sources refer to "the late Master Zé Grande" (André Lacé quote) but no death date or year was found. Mário Buscapé''s 2016 memoir may contain more information.

FULL NAME: Unknown. He was from the dos Santos family (same as brothers Irineu and Deraldo), from Bahia. NOT related to Mário dos Santos (Mário Buscapé) despite the same surname.

NAME DISAMBIGUATION:
- This "Zé Grande (Bonfim)" is DIFFERENT from José Carlos Cruz (Mestre Grande/Zé Grande), born November 18, 1950, died December 26, 2017. José Carlos Cruz was from the lineage of Zé Maria via Paulinho Salmon and Mário Buscapé—a separate branch.
- Used apelido_context "Bonfim" to distinguish.

TEACHERS:
- Mário Buscapé (primary, ~early 1950s, Rio de Janeiro)

STUDENTS:
- Mestre Gary / Mestre 22 (began 1957, age 12)
- Mestre Soldado (age 18, Bonsucesso headquarters)
- Guere 22 (also known as Mestre 22, possibly same as Gary)

GROUP LEADERSHIP:
- Co-founded Associação Cultural Bonfim: January 6, 1953 (with Mário Buscapé, Irineu, Deraldo)
- Took over leadership: 1969 (when Mário returned to Bahia)
- Served as President of the group
- Headquarters: Initially São Cristóvão, then Olaria, later Bonsucesso

RODA INVOLVEMENT:
- Roda da Penha: credited as initiator (1960s), with Deraldo, Dentinho, Mintirinha
- Maintained iuna protocol for mestres-only play

MEDIA: None found. Mário Buscapé''s 2016 memoir "A saga de uma lenda viva" (Azougue, Rio) may contain more details.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1930, década):
Mestre Gary começou a treinar no Bonfim em 1957 aos 12 anos com Zé Grande e Deraldo, que já eram instrutores estabelecidos. Zé Grande foi descrito como o "melhor discípulo" de Mário Buscapé quando o grupo foi fundado em 1953. Estimar nascimento por volta de 1930 o coloca no início dos 20 anos na fundação—idade suficiente para ser um capoeirista habilidoso mas ainda uma geração abaixo de Mário (n. 1934). A imprecisão de "década" reflete documentação limitada.

MORTE: Confirmado falecido. Fontes referem-se ao "saudoso Mestre Zé Grande" (citação de André Lacé) mas nenhuma data ou ano de morte foi encontrado. As memórias de Mário Buscapé de 2016 podem conter mais informações.

NOME COMPLETO: Desconhecido. Ele era da família dos Santos (mesma dos irmãos Irineu e Deraldo), da Bahia. NÃO é parente de Mário dos Santos (Mário Buscapé) apesar do mesmo sobrenome.

DESAMBIGUAÇÃO DE NOME:
- Este "Zé Grande (Bonfim)" é DIFERENTE de José Carlos Cruz (Mestre Grande/Zé Grande), nascido em 18 de novembro de 1950, falecido em 26 de dezembro de 2017. José Carlos Cruz era da linhagem de Zé Maria via Paulinho Salmon e Mário Buscapé—uma ramificação separada.
- Usado apelido_context "Bonfim" para distinguir.

MESTRES:
- Mário Buscapé (principal, ~início dos anos 1950, Rio de Janeiro)

ALUNOS:
- Mestre Gary / Mestre 22 (começou 1957, 12 anos)
- Mestre Soldado (18 anos, sede de Bonsucesso)
- Guere 22 (também conhecido como Mestre 22, possivelmente o mesmo que Gary)

LIDERANÇA DO GRUPO:
- Co-fundou Associação Cultural Bonfim: 6 de janeiro de 1953 (com Mário Buscapé, Irineu, Deraldo)
- Assumiu liderança: 1969 (quando Mário retornou à Bahia)
- Atuou como Presidente do grupo
- Sede: Inicialmente São Cristóvão, depois Olaria, posteriormente Bonsucesso

ENVOLVIMENTO EM RODAS:
- Roda da Penha: creditado como iniciador (anos 1960), com Deraldo, Dentinho, Mintirinha
- Mantinha protocolo de iuna para jogo somente de mestres

MÍDIA: Nenhuma encontrada. As memórias de Mário Buscapé de 2016 "A saga de uma lenda viva" (Azougue, Rio) podem conter mais detalhes.'
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
