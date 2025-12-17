-- ============================================================
-- GENEALOGY PERSON: Isídio
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade precision):
-- Isídio was described as "velho" (old) and a "discípulo velho" (old disciple)
-- at Bonfim Church when Cobrinha Verde (b. 1912) was a youth in the 1920s.
-- If he was 50-70 years old in the 1920s, birth range would be 1850-1880.
-- Using 1870 as midpoint estimate with decade precision.
--
-- Cobrinha Verde's testimony (from 1991) states Isídio was "already dead today"
-- (está morto hoje), indicating he died sometime before 1991, likely much earlier
-- given his advanced age in the 1920s.
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
  NULL, -- Full name unknown
  'Isídio',
  NULL, -- Not a capoeira mestre; mandingueiro/spiritual practitioner
  NULL, -- No images exist of this historical figure
  ARRAY['https://capoeira.online/history/mestres/cobrinha-verde/', 'https://angoleiro.wordpress.com/tag/patua/']::text[],
  -- Capoeira-specific
  NULL, -- Not documented as a capoeirista; mandingueiro (spiritual practitioner)
  'Not documented as a capoeirista. Described as a "discípulo velho" (old disciple) at Bonfim Church in Salvador. Provided materials for Cobrinha Verde''s protective patuá at Tio Pascoal''s direction. Likely a mandingueiro or spiritual practitioner associated with the Afro-Brazilian religious traditions centered at Bonfim Church.',
  'Não documentado como capoeirista. Descrito como "discípulo velho" na Igreja do Bonfim em Salvador. Forneceu materiais para o patuá protetor de Cobrinha Verde sob orientação de Tio Pascoal. Provavelmente um mandingueiro ou praticante espiritual associado às tradições religiosas afro-brasileiras centradas na Igreja do Bonfim.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown; likely Salvador, Bahia
  NULL, -- Death year unknown; confirmed deceased before 1991
  'unknown'::genealogy.date_precision,
  'Salvador, Bahia, Brazil', -- Presumed; he was based at Bonfim Church in Salvador
  -- bio_en
  E'Isídio was an "old disciple" (discípulo velho) based at the Church of Nosso Senhor do Bonfim in Salvador, Bahia. He is known solely through the testimony of Mestre Cobrinha Verde, who identified him as the source of materials used to create his legendary protective patuá.

According to Cobrinha Verde''s account, the African mandingueiro Tio Pascoal instructed the young Rafael Alves França (later Cobrinha Verde) to seek out Isídio at Bonfim Church. Cobrinha recounted: "So old Pascoal told me that there was an old disciple named Isídio (he is dead today) in Bonfim Church, who could get me the material to make an amulet."

The young Cobrinha traveled to Salvador and obtained the necessary materials from Isídio. He then brought these items back to Tio Pascoal in Santo Amaro da Purificação, who assembled them into the completed patuá with specific instructions for its use. This amulet became central to Cobrinha Verde''s legend—it was said to be alive, jumping when placed on a clean plate, and protected him through three years of violence in the Bahian sertão as a member of Colonel Horácio de Matos'' band.

The description of Isídio as a "discípulo" (disciple) suggests he was himself a practitioner within a lineage of spiritual tradition—perhaps a student of an earlier mandingueiro, or a member of a religious brotherhood associated with Bonfim Church. The Church of Nosso Senhor do Bonfim occupies a unique position in Bahian religious life, serving as a site of syncretism between Catholic and Candomblé traditions, where Nosso Senhor do Bonfim is identified with the Orixá Oxalá.

That Tio Pascoal knew of Isídio and could direct Cobrinha Verde to him suggests a network of spiritual practitioners spanning Santo Amaro and Salvador—a hidden community that maintained African-Brazilian mystical traditions despite persecution.

Nothing more is known of Isídio''s life, training, or other activities. He represents the countless unnamed practitioners who preserved and transmitted African-Brazilian spiritual traditions during the late 19th and early 20th centuries.',
  -- bio_pt
  E'Isídio foi um "discípulo velho" baseado na Igreja de Nosso Senhor do Bonfim em Salvador, Bahia. Ele é conhecido exclusivamente através do testemunho de Mestre Cobrinha Verde, que o identificou como a fonte dos materiais usados para criar seu lendário patuá protetor.

Segundo o relato de Cobrinha Verde, o mandingueiro africano Tio Pascoal instruiu o jovem Rafael Alves França (mais tarde Cobrinha Verde) a procurar Isídio na Igreja do Bonfim. Cobrinha contou: "Então o velho Pascoal me disse que havia um discípulo velho de nome Isídio (está morto hoje) na Igreja do Bonfim, que poderia me conseguir o material para fazer um amuleto."

O jovem Cobrinha viajou a Salvador e obteve os materiais necessários de Isídio. Ele então trouxe esses itens de volta para Tio Pascoal em Santo Amaro da Purificação, que os montou no patuá completo com instruções específicas para seu uso. Este amuleto tornou-se central na lenda de Cobrinha Verde—dizia-se que era vivo, pulando quando colocado em um prato limpo, e o protegeu através de três anos de violência no sertão baiano como membro do bando do Coronel Horácio de Matos.

A descrição de Isídio como "discípulo" sugere que ele próprio era um praticante dentro de uma linhagem de tradição espiritual—talvez aluno de um mandingueiro anterior, ou membro de uma irmandade religiosa associada à Igreja do Bonfim. A Igreja de Nosso Senhor do Bonfim ocupa uma posição única na vida religiosa baiana, servindo como local de sincretismo entre tradições católicas e do Candomblé, onde Nosso Senhor do Bonfim é identificado com o Orixá Oxalá.

Que Tio Pascoal conhecesse Isídio e pudesse direcionar Cobrinha Verde até ele sugere uma rede de praticantes espirituais abrangendo Santo Amaro e Salvador—uma comunidade oculta que mantinha tradições místicas afro-brasileiras apesar da perseguição.

Nada mais se sabe sobre a vida, formação ou outras atividades de Isídio. Ele representa os incontáveis praticantes anônimos que preservaram e transmitiram tradições espirituais afro-brasileiras durante o final do século XIX e início do século XX.',
  -- achievements_en
  'Provided materials for Mestre Cobrinha Verde''s legendary patuá at Tio Pascoal''s direction; represents the network of spiritual practitioners who preserved African-Brazilian mystical traditions at Bonfim Church in Salvador',
  -- achievements_pt
  'Forneceu materiais para o lendário patuá de Mestre Cobrinha Verde sob orientação de Tio Pascoal; representa a rede de praticantes espirituais que preservaram tradições místicas afro-brasileiras na Igreja do Bonfim em Salvador',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): Described as "velho" (old) and a "discípulo velho" (old disciple) when Cobrinha Verde (b. 1912) was a youth in the 1920s. If he was 50-70 years old when providing the patuá materials, birth range would be 1850-1880. Using 1870 as midpoint estimate.

DEATH: Cobrinha Verde''s testimony (given around 1991 for Mestre Mau''s book) explicitly states "está morto hoje" (he is dead today). Given his advanced age in the 1920s, death likely occurred decades before 1991, but no specific date is available.

IDENTITY: The title "discípulo" (disciple) suggests he was a spiritual student/practitioner within a tradition, not a founder or leader. His association with Bonfim Church places him within the syncretic Catholic-Candomblé tradition of Salvador.

ROLE: Provider of materials for patuá creation. Did not create the patuá himself—that was done by Tio Pascoal. The specific materials are not documented.

RELATIONSHIP TO TIO PASCOAL: Unclear whether Isídio was Pascoal''s student, fellow practitioner, or simply a contact known to supply spiritual materials. The fact that Pascoal knew how to direct Cobrinha Verde to him suggests a pre-existing connection.

LOCATION: Based at Igreja do Bonfim in Salvador. This church is a major pilgrimage site and center of Afro-Brazilian religious syncretism, where Catholic Nosso Senhor do Bonfim is identified with Candomblé Orixá Oxalá.

NOT A DOCUMENTED CAPOEIRISTA: There is no evidence Isídio practiced capoeira. He appears to be purely a spiritual/religious practitioner.

PRIMARY SOURCE: All information derives from Cobrinha Verde''s testimony preserved in "Capoeira e Mandingas: Cobrinha Verde" by Marcelino dos Santos (Mestre Mau), 1991.

SECONDARY SOURCES: Capoeira.online quotes the relevant passage directly.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Descrito como "velho" e "discípulo velho" quando Cobrinha Verde (n. 1912) era jovem nos anos 1920. Se tinha 50-70 anos quando forneceu os materiais do patuá, o intervalo de nascimento seria 1850-1880. Usando 1870 como estimativa do ponto médio.

MORTE: O testemunho de Cobrinha Verde (dado por volta de 1991 para o livro de Mestre Mau) afirma explicitamente "está morto hoje". Dada sua idade avançada nos anos 1920, a morte provavelmente ocorreu décadas antes de 1991, mas nenhuma data específica está disponível.

IDENTIDADE: O título "discípulo" sugere que era um estudante/praticante espiritual dentro de uma tradição, não um fundador ou líder. Sua associação com a Igreja do Bonfim o coloca dentro da tradição sincrética Católica-Candomblé de Salvador.

PAPEL: Fornecedor de materiais para criação de patuá. Não criou o patuá ele mesmo—isso foi feito por Tio Pascoal. Os materiais específicos não são documentados.

RELACIONAMENTO COM TIO PASCOAL: Incerto se Isídio era aluno de Pascoal, colega praticante, ou simplesmente um contato conhecido por fornecer materiais espirituais. O fato de Pascoal saber como direcionar Cobrinha Verde até ele sugere uma conexão pré-existente.

LOCALIZAÇÃO: Baseado na Igreja do Bonfim em Salvador. Esta igreja é um importante local de peregrinação e centro de sincretismo religioso afro-brasileiro, onde o Nosso Senhor do Bonfim católico é identificado com o Orixá Oxalá do Candomblé.

NÃO É CAPOEIRISTA DOCUMENTADO: Não há evidência de que Isídio praticasse capoeira. Ele parece ser puramente um praticante espiritual/religioso.

FONTE PRIMÁRIA: Toda informação deriva do testemunho de Cobrinha Verde preservado em "Capoeira e Mandingas: Cobrinha Verde" por Marcelino dos Santos (Mestre Mau), 1991.

FONTES SECUNDÁRIAS: Capoeira.online cita a passagem relevante diretamente.'
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
