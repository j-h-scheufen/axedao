-- ============================================================
-- GENEALOGY PERSON: Bigodinho
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH PLACE NOTE:
-- Sources disagree: Some say "Santo Amaro" (Portal Capoeira), others say
-- "Conceição de Feira" (nossa-tribo.com, lalaue.com, Portal Capoeira alternate).
-- All sources agree he was RAISED in Acupe, a district of Santo Amaro.
-- Using "Conceição de Feira" as birth place per majority of detailed sources,
-- noting he grew up in Acupe.
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
  'Reinaldo Santana',
  'Bigodinho',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://www.lalaue.com/learn-capoeira/mestre-bigodinho/', 'https://velhosmestres.com/en/featured-11']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Bigodinho practiced Capoeira Angola in the traditional style learned from Mestre Waldemar da Paixão. He was particularly renowned for his berimbau playing and his singing of ladainhas and corridos, which had a distinctive, personal style. Also proficient in samba-de-roda, reflecting the integrated nature of Recôncavo musical traditions.',
  E'Bigodinho praticava Capoeira Angola no estilo tradicional aprendido com Mestre Waldemar da Paixão. Era particularmente renomado por seu toque de berimbau e por sua forma de cantar ladainhas e corridos, que tinha um estilo muito particular e pessoal. Também era exímio no samba-de-roda, refletindo a natureza integrada das tradições musicais do Recôncavo.',
  -- Life dates
  1933,
  'exact'::genealogy.date_precision,
  'Conceição de Feira, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Santa Casa de Misericórdia de Santo Amaro, Bahia, Brazil',
  -- bio_en
  E'Reinaldo Santana, known as Mestre Bigodinho, was born on September 13, 1933, in Conceição de Feira, Bahia. He grew up in Acupe, a district of Santo Amaro in the Recôncavo Baiano region, immersed in the rich cultural traditions of the area—an environment where capoeira, samba-de-roda, and candomblé wove together in daily life.

In 1950, at age seventeen, Bigodinho moved to Cabula in Salvador. There he encountered the legendary berimbau master Auvelino, who taught him the secrets of the instrument that would make him famous. That same year, he began learning capoeira with Mestre Waldemar Rodrigues da Paixão at the famous Barracão on Estrada da Liberdade.

For more than 25 years, Bigodinho frequented Mestre Waldemar''s Barracão—a time when, according to him, "boys and women did not play." At the Barracão he mingled with famous capoeiristas including Traíra, Zacarias Boa Morte, and many others. He became one of the most respected practitioners there, absorbing the traditional Angola style that Waldemar taught informally under his straw-roofed shed.

By 1960, Bigodinho had become a professor of Capoeira Angola and established Grupo Resistência in the Lapinha neighborhood of Salvador. This was a crucial period marked by intense police repression of capoeira rodas. Despite the hostile environment, he persevered in teaching and preserving the tradition.

In 1968, Bigodinho was recognized as a mestre. He also participated in the Grupo Folclórico "Viva Bahia," coordinated by ethnomusicologist Emília Biancardi, which played an important role in spreading capoeira throughout Brazil and the world during a time when the art still faced social stigma.

The repression and discrimination of the era eventually took their toll. In the early 1970s, Bigodinho stepped away from capoeira, remaining absent from the community for nearly three decades. Then, in 1997, encouraged by his friend Mestre Lua Rasta, he returned to active participation in the capoeira world.

His comeback led to renewed recognition. In 2000, he recorded the CD "Capoeira Angola" with Mestre Boca Rica (another student of Pastinha), showcasing his talent as a singer and composer of both capoeira songs and samba-de-roda. In 2002, he appeared in a documentary by Paulo "Gabiru" Siqueira alongside Mestre Boca Rica.

In 2007, Mestre Lua Rasta organized the "Tributo a Mestre Bigodinho" in Acupe. The event transformed the streets of his childhood home into a festive celebration, with capoeiristas of all lineages honoring him. The tribute was recorded in a documentary directed by Gabriela Barreto, capturing Bigodinho''s joy as he paraded through the streets being acclaimed by all present.

Researcher Frede Abreu noted that Mestre Bigodinho had great importance in the revitalization process of Capoeira Angola in the 1970s and 1980s, due to the depth of traditional knowledge he possessed from his decades at Waldemar''s Barracão.

On April 5, 2011, Mestre Bigodinho died at the Santa Casa de Misericórdia de Santo Amaro—the same hospital where the legendary Besouro Mangangá had died in 1924. He was 77 years old. He is remembered as one of the greatest representatives of popular culture in Bahia, a guardian of the old traditions who bridged the era of repression to the modern capoeira revival.

As he once said about capoeira: "It is like a pharmacy: you have pain in your leg, in your muscle... so you do some capoeira jumping with the guys, when you come back you''ll be fine." And on its nature: "Capoeira is personal defense and each person defends themselves as they can in the moment of necessity. Capoeira is not about bravery."',
  -- bio_pt
  E'Reinaldo Santana, conhecido como Mestre Bigodinho, nasceu em 13 de setembro de 1933 em Conceição de Feira, Bahia. Cresceu em Acupe, distrito de Santo Amaro no Recôncavo Baiano, imerso nas ricas tradições culturais da região—um ambiente onde capoeira, samba-de-roda e candomblé se entrelaçavam na vida cotidiana.

Em 1950, aos dezessete anos, Bigodinho se mudou para o Cabula em Salvador. Lá conheceu o lendário mestre de berimbau Auvelino, que lhe ensinou os segredos do instrumento que o tornaria famoso. No mesmo ano, começou a aprender capoeira com Mestre Waldemar Rodrigues da Paixão no famoso Barracão na Estrada da Liberdade.

Por mais de 25 anos, Bigodinho frequentou o Barracão de Mestre Waldemar—uma época em que, segundo ele, "meninos e mulheres não jogavam." No Barracão conviveu com famosos capoeiristas como Traíra, Zacarias Boa Morte e muitos outros. Tornou-se um dos praticantes mais respeitados ali, absorvendo o estilo tradicional de Angola que Waldemar ensinava informalmente sob seu telhado de palha.

Por volta de 1960, Bigodinho já era professor de Capoeira Angola e estabeleceu o Grupo Resistência no bairro da Lapinha em Salvador. Foi um período crucial marcado pela intensa repressão policial às rodas de capoeira. Apesar do ambiente hostil, ele perseverou no ensino e na preservação da tradição.

Em 1968, Bigodinho foi reconhecido como mestre. Também participou do Grupo Folclórico "Viva Bahia", coordenado pela etnomusicóloga Emília Biancardi, que desempenhou papel importante na disseminação da capoeira pelo Brasil e pelo mundo, numa época em que a arte ainda enfrentava estigma social.

A repressão e discriminação da época eventualmente cobraram seu preço. No início dos anos 1970, Bigodinho se afastou da capoeira, permanecendo ausente da comunidade por quase três décadas. Então, em 1997, incentivado por seu amigo Mestre Lua Rasta, voltou à participação ativa no mundo da capoeira.

Seu retorno levou a um renovado reconhecimento. Em 2000, gravou o CD "Capoeira Angola" com Mestre Boca Rica (outro aluno de Pastinha), mostrando seu talento como cantor e compositor tanto de músicas de capoeira quanto de samba-de-roda. Em 2002, apareceu em um documentário de Paulo "Gabiru" Siqueira ao lado de Mestre Boca Rica.

Em 2007, Mestre Lua Rasta organizou o "Tributo a Mestre Bigodinho" em Acupe. O evento transformou as ruas de seu lar de infância em uma celebração festiva, com capoeiristas de todas as linhagens homenageando-o. O tributo foi gravado em um documentário dirigido por Gabriela Barreto, capturando a alegria de Bigodinho ao desfilar pelas ruas sendo aclamado por todos os presentes.

O pesquisador Frede Abreu observou que Mestre Bigodinho teve grande importância no processo de revitalização da Capoeira Angola nos anos 1970 e 1980, devido à profundidade do conhecimento tradicional que possuía de suas décadas no Barracão de Waldemar.

Em 5 de abril de 2011, Mestre Bigodinho morreu na Santa Casa de Misericórdia de Santo Amaro—o mesmo hospital onde o lendário Besouro Mangangá havia morrido em 1924. Tinha 77 anos. É lembrado como um dos maiores representantes da cultura popular da Bahia, um guardião das antigas tradições que fez a ponte entre a era de repressão e o renascimento moderno da capoeira.

Como ele uma vez disse sobre capoeira: "É como uma farmácia: você tem dor na perna, no músculo... então você faz uns pulos de capoeira com os caras, quando voltar vai estar bem." E sobre sua natureza: "Capoeira é defesa pessoal e cada pessoa se defende como pode no momento de necessidade. Capoeira não é sobre valentia."',
  -- achievements_en
  E'Frequented Mestre Waldemar''s legendary Barracão for over 25 years (1950-1970s)
Founded and coordinated Grupo Resistência in Lapinha, Salvador (1960s)
Became mestre in 1968
Participated in Grupo Folclórico "Viva Bahia" coordinated by Emília Biancardi
Recorded CD "Capoeira Angola" with Mestre Boca Rica (2000)
Subject of documentary "Tributo a Mestre Bigodinho" directed by Gabriela Barreto (2007)
Recognized by researcher Frede Abreu for his importance in the revitalization of Capoeira Angola in the 1970s-80s
Renowned berimbau player and singer/composer of ladainhas, corridos, and samba-de-roda',
  -- achievements_pt
  E'Frequentou o lendário Barracão de Mestre Waldemar por mais de 25 anos (1950-década de 1970)
Fundou e coordenou o Grupo Resistência na Lapinha, Salvador (década de 1960)
Tornou-se mestre em 1968
Participou do Grupo Folclórico "Viva Bahia" coordenado por Emília Biancardi
Gravou CD "Capoeira Angola" com Mestre Boca Rica (2000)
Tema do documentário "Tributo a Mestre Bigodinho" dirigido por Gabriela Barreto (2007)
Reconhecido pelo pesquisador Frede Abreu por sua importância na revitalização da Capoeira Angola nos anos 1970-80
Renomado tocador de berimbau e cantor/compositor de ladainhas, corridos e samba-de-roda',
  -- Researcher notes (English)
  E'LIFE DATES:
Birth: September 13, 1933 - exact date confirmed by multiple sources (Portal Capoeira, velhosmestres.com)
Death: April 5, 2011 - confirmed by multiple sources (Portal Capoeira, lalaue.com)

BIRTH PLACE DISCREPANCY:
- Portal Capoeira (mestres page): Santo Amaro, Bahia
- Nossa-tribo.com, lalaue.com, Portal Capoeira (crônicas): Conceição de Feira, Bahia
- All sources agree he was RAISED in Acupe (district of Santo Amaro)
Using Conceição de Feira as most detailed sources specify this, noting Acupe as where he grew up.

DEATH LOCATION: Santa Casa de Misericórdia de Santo Amaro - same hospital where Besouro Mangangá died (1924).

ALIASES: Also known as "Gigante" per persons-backlog.md (need verification)

PRIMARY TEACHER: Mestre Waldemar Rodrigues da Paixão
- Training period: 1950-1970 (20 years documented attendance)
- Frequented Barracão for 25+ years total

BERIMBAU TEACHER: Auvelino (1950 in Salvador)
- Described as "legendary berimbau master"
- Taught Bigodinho the berimbau when he first arrived in Salvador

CONTEMPORARIES AT BARRACÃO:
- Traíra (João Ramos do Nascimento)
- Zacarias Boa Morte
- Many others unnamed in sources

GRUPO RESISTÊNCIA:
- Founded/coordinated by Bigodinho in 1960
- Located in Lapinha neighborhood, Salvador
- Teaching during period of police repression

VIVA BAHIA:
- Folkloric group coordinated by Emília Biancardi
- Founded 1962, pioneering folk group
- Bigodinho was a participant (not founder)

CD WITH BOCA RICA:
- Title: "Capoeira Angola"
- Release: Discogs lists 2002, velhosmestres.com says 2000
- 37 songs, 58 minutes
- Shows capoeira AND samba-de-roda compositions

DOCUMENTARIES:
1. Paulo "Gabiru" Siqueira documentary (2002) - with Boca Rica
2. "Tributo a Mestre Bigodinho" (2007) - directed by Gabriela Barreto

FREDE ABREU RECOGNITION:
Researcher noted Bigodinho''s importance in Capoeira Angola revitalization (1970s-80s) due to traditional knowledge from Waldemar''s era.

HIATUS: 1970-1997 (27 years) - left due to repression and discrimination
RETURN: 1997, encouraged by Mestre Lua Rasta

QUOTES:
1. "[Capoeira] is like a pharmacy: you have pain in your leg, in your muscle...so you do some capoeira jumping with the guys, when you come back you''ll be fine."
2. "Capoeira is personal defense and each person defends themselves as they can in the moment of necessity. Capoeira is not about bravery."
3. "Capoeira não se faz, se joga" (Capoeira is not made, it is played) - title of Portal Capoeira article

ASSOCIATIONS TO IMPORT:
- Mestre Boca Rica (Manoel Silva) - pending in backlog (Pastinha student)
- Mestre Lua Rasta - NOT in database, needs to be added to backlog
- Auvelino (berimbau master) - NOT in database, needs investigation
- Grupo Resistência - pending in groups backlog',
  -- Researcher notes (Portuguese)
  E'DATAS DE VIDA:
Nascimento: 13 de setembro de 1933 - data exata confirmada por múltiplas fontes (Portal Capoeira, velhosmestres.com)
Morte: 5 de abril de 2011 - confirmado por múltiplas fontes (Portal Capoeira, lalaue.com)

DISCREPÂNCIA DO LOCAL DE NASCIMENTO:
- Portal Capoeira (página de mestres): Santo Amaro, Bahia
- Nossa-tribo.com, lalaue.com, Portal Capoeira (crônicas): Conceição de Feira, Bahia
- Todas as fontes concordam que ele FOI CRIADO em Acupe (distrito de Santo Amaro)
Usando Conceição de Feira pois as fontes mais detalhadas especificam isto, notando Acupe como onde cresceu.

LOCAL DA MORTE: Santa Casa de Misericórdia de Santo Amaro - mesmo hospital onde Besouro Mangangá morreu (1924).

APELIDOS: Também conhecido como "Gigante" conforme persons-backlog.md (precisa verificação)

MESTRE PRINCIPAL: Mestre Waldemar Rodrigues da Paixão
- Período de treinamento: 1950-1970 (20 anos de frequência documentada)
- Frequentou o Barracão por mais de 25 anos no total

MESTRE DE BERIMBAU: Auvelino (1950 em Salvador)
- Descrito como "lendário mestre de berimbau"
- Ensinou berimbau a Bigodinho quando ele chegou em Salvador

CONTEMPORÂNEOS NO BARRACÃO:
- Traíra (João Ramos do Nascimento)
- Zacarias Boa Morte
- Muitos outros não nomeados nas fontes

GRUPO RESISTÊNCIA:
- Fundado/coordenado por Bigodinho em 1960
- Localizado no bairro da Lapinha, Salvador
- Ensino durante período de repressão policial

VIVA BAHIA:
- Grupo folclórico coordenado por Emília Biancardi
- Fundado em 1962, grupo folclórico pioneiro
- Bigodinho era participante (não fundador)

CD COM BOCA RICA:
- Título: "Capoeira Angola"
- Lançamento: Discogs lista 2002, velhosmestres.com diz 2000
- 37 músicas, 58 minutos
- Mostra composições de capoeira E samba-de-roda

DOCUMENTÁRIOS:
1. Documentário de Paulo "Gabiru" Siqueira (2002) - com Boca Rica
2. "Tributo a Mestre Bigodinho" (2007) - dirigido por Gabriela Barreto

RECONHECIMENTO DE FREDE ABREU:
Pesquisador notou a importância de Bigodinho na revitalização da Capoeira Angola (1970-80) devido ao conhecimento tradicional da era de Waldemar.

HIATO: 1970-1997 (27 anos) - saiu devido à repressão e discriminação
RETORNO: 1997, incentivado por Mestre Lua Rasta

CITAÇÕES:
1. "[Capoeira] é como uma farmácia: você tem dor na perna, no músculo... então você faz uns pulos de capoeira com os caras, quando voltar vai estar bem."
2. "Capoeira é defesa pessoal e cada pessoa se defende como pode no momento de necessidade. Capoeira não é sobre valentia."
3. "Capoeira não se faz, se joga" - título do artigo do Portal Capoeira

ASSOCIAÇÕES PARA IMPORTAR:
- Mestre Boca Rica (Manoel Silva) - pendente no backlog (aluno de Pastinha)
- Mestre Lua Rasta - NÃO está no banco de dados, precisa ser adicionado ao backlog
- Auvelino (mestre de berimbau) - NÃO está no banco de dados, precisa investigação
- Grupo Resistência - pendente no backlog de grupos'
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
