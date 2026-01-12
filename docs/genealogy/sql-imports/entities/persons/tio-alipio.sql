-- ============================================================
-- GENEALOGY PERSON: Tio Alípio
-- Migrated: 2025-12-11
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
  'Alípio',
  'Tio Alípio',
  NULL, -- Pre-formal title era; no titles existed in this period
  NULL, -- No images exist of this historical figure
  ARRAY['https://velhosmestres.com/br/besouro-1908', 'https://velhosmestres.com/en/besouro']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist yet
  'Pre-codification era. Taught traditional capoeira that included knife techniques (facas) and spiritual practices (boas orações) as an integrated system.',
  'Era pré-codificação. Ensinava capoeira tradicional que incluía técnicas de faca (facas) e práticas espirituais (boas orações) como um sistema integrado.',
  -- Life dates
  1850,
  'decade'::genealogy.date_precision,
  'Dahomey (present-day Benin), Africa',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil', -- Presumed; he was living there after abolition
  -- bio_en
  E'Tio Alípio was an African man who was brought to Brazil in chains to work at the Engenho Pantaleão sugar mill in Santo Amaro da Purificação, Bahia. According to historical accounts preserved by Mestre Cobrinha Verde, he was "the most famous master in Santo Amaro".

His mother came from Africa on a slave ship that departed from the Port of São Jorge da Mina in Dahomey (present-day Benin). Alípio was enslaved while still young by a wealthy family. At the plantation, he endured the sufferings of slavery until abolition in 1888.

Beyond his skill as a capoeirista, Alípio was a Babalaô—a spiritual priest in the Candomblé tradition. This dual role as martial arts teacher and spiritual leader was common among African capoeira masters, who transmitted both fighting techniques and religious practices as an integrated cultural system.

After the Lei Áurea (Golden Law) abolished slavery in May 1888, Alípio moved to Trapiche de Baixo, the poorest neighborhood of Santo Amaro. There he continued to practice and teach capoeira, though the art remained criminalized under the 1890 Penal Code.

His most famous student was the young Manoel Henrique Pereira, later known as Besouro Mangangá. Besouro came to study under Alípio around 1908, when he was about thirteen years old. The old African taught him "os mistérios da capoeira, do jogo, das facas e das boas orações" (the mysteries of capoeira, of the game, of knives and of good prayers) in the sugarcane fields around the plantation. The teaching took place in secrecy, as being caught meant severe punishment.

The significance of Tio Alípio extends beyond his own life. He represents the direct transmission of African martial and spiritual traditions to Brazilian soil. Through his student Besouro, and Besouro''s student Cobrinha Verde, his teachings eventually reached Mestre João Grande and Mestre João Pequeno—creating a lineage that connects living masters to the era of slavery.

Note: Some sources claim Alípio was "sentenced to death" for teaching capoeira. This has not been verified in any primary sources and may be a later embellishment. What is documented is that during this period, capoeira practitioners faced severe legal penalties including imprisonment and internal exile.',
  -- bio_pt
  E'Tio Alípio foi um africano que foi trazido para o Brasil acorrentado para trabalhar no Engenho Pantaleão em Santo Amaro da Purificação, Bahia. Segundo relatos históricos preservados por Mestre Cobrinha Verde, ele era "o mestre mais famoso dentro de Santo Amaro".

Sua mãe veio da África em um navio negreiro que partiu do Porto de São Jorge da Mina no Daomé (atual Benin). Alípio foi escravizado ainda jovem por uma família rica. Na fazenda, ele suportou os sofrimentos da escravidão até a abolição em 1888.

Além de sua habilidade como capoeirista, Alípio era um Babalaô—um sacerdote espiritual na tradição do Candomblé. Esse duplo papel de professor de artes marciais e líder espiritual era comum entre os mestres de capoeira africanos, que transmitiam tanto técnicas de luta quanto práticas religiosas como um sistema cultural integrado.

Após a Lei Áurea abolir a escravidão em maio de 1888, Alípio se mudou para Trapiche de Baixo, o bairro mais pobre de Santo Amaro. Lá ele continuou a praticar e ensinar capoeira, embora a arte permanecesse criminalizada pelo Código Penal de 1890.

Seu aluno mais famoso foi o jovem Manoel Henrique Pereira, mais tarde conhecido como Besouro Mangangá. Besouro veio estudar com Alípio por volta de 1908, quando tinha cerca de treze anos. O velho africano lhe ensinou "os mistérios da capoeira, do jogo, das facas e das boas orações" nos canaviais ao redor da fazenda. O ensino acontecia em segredo, pois ser pego significava punição severa.

A importância de Tio Alípio se estende além de sua própria vida. Ele representa a transmissão direta das tradições marciais e espirituais africanas para o solo brasileiro. Através de seu aluno Besouro, e do aluno de Besouro, Cobrinha Verde, seus ensinamentos eventualmente chegaram a Mestre João Grande e Mestre João Pequeno—criando uma linhagem que conecta mestres vivos à era da escravidão.

Nota: Algumas fontes afirmam que Alípio foi "condenado à morte" por ensinar capoeira. Isso não foi verificado em nenhuma fonte primária e pode ser um embelezamento posterior. O que está documentado é que durante esse período, praticantes de capoeira enfrentavam penalidades legais severas incluindo prisão e exílio interno.',
  -- achievements_en
  'Teacher of Besouro Mangangá; considered "the most famous master in Santo Amaro" by Mestre Cobrinha Verde; key link in the chain connecting African capoeira traditions to the documented lineage',
  -- achievements_pt
  'Professor de Besouro Mangangá; considerado "o mestre mais famoso dentro de Santo Amaro" por Mestre Cobrinha Verde; elo fundamental na cadeia que conecta as tradições africanas de capoeira à linhagem documentada',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1850, decade precision): Described as enslaved "while still young" and actively teaching Besouro Mangangá around 1908. If enslaved as a young man in the 1860s-1870s and still teaching in his 50s-60s in 1908, birth decade estimated as 1850s.

DEATH: Unknown. Was living in Trapiche de Baixo, Santo Amaro after 1888 abolition.

BIRTHPLACE: Listed as Dahomey (Benin), though technically his mother came from there. Source says "filho de uma negra que veio num tumbeiro trazida do Porto de São Jorge da Mina, do Daomé" which describes his mother''s origin. São Jorge da Mina (Elmina) is in present-day Ghana, while Dahomey is present-day Benin—different slave-trading regions. Listed as Dahomey for simplicity.

"SENTENCED TO DEATH" CLAIM: Some secondary sources mention this but no primary sources have been found. Noted as unverified in the bio.

PENDING RELATIONSHIPS:
- student_of: Besouro Mangangá → Tio Alípio (defined in besouro-manganga.sql)

CONTEMPORARIES IN SANTO AMARO (DIFFERENT LINEAGES):
- Antônio Asa Branca → Ferreirinha de Santo Amaro → Ivan de Santo Amaro → ACANA
- Benedito de Santo Amaro → Mestre Bobó
Note: These were parallel teaching traditions in Santo Amaro; different lineages, not connected.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1850, precisão de década): Descrito como escravizado "ainda jovem" e ativamente ensinando Besouro Mangangá por volta de 1908. Se escravizado como jovem nos anos 1860-1870 e ainda ensinando nos seus 50-60 anos em 1908, década de nascimento estimada como 1850.

MORTE: Desconhecida. Vivia em Trapiche de Baixo, Santo Amaro após a abolição de 1888.

LOCAL DE NASCIMENTO: Listado como Daomé (Benin), embora tecnicamente sua mãe tenha vindo de lá. A fonte diz "filho de uma negra que veio num tumbeiro trazida do Porto de São Jorge da Mina, do Daomé" que descreve a origem de sua mãe. São Jorge da Mina (Elmina) fica no atual Gana, enquanto Daomé é o atual Benin—regiões diferentes do tráfico de escravos. Listado como Daomé por simplicidade.

ALEGAÇÃO DE "CONDENADO À MORTE": Algumas fontes secundárias mencionam isso mas nenhuma fonte primária foi encontrada. Notado como não verificado na bio.

RELACIONAMENTOS PENDENTES:
- student_of: Besouro Mangangá → Tio Alípio (definido em besouro-manganga.sql)

CONTEMPORÂNEOS EM SANTO AMARO (LINHAGENS DIFERENTES):
- Antônio Asa Branca → Ferreirinha de Santo Amaro → Ivan de Santo Amaro → ACANA
- Benedito de Santo Amaro → Mestre Bobó
Nota: Estas eram tradições de ensino paralelas em Santo Amaro; linhagens diferentes, não conectadas.'
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
