-- ============================================================
-- GENEALOGY PERSON: Tio Pascoal
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
  'Pascoal',
  'Tio Pascoal',
  NULL, -- Not a capoeira mestre; mandingueiro/spiritual teacher
  NULL, -- No images exist of this historical figure
  ARRAY['https://capoeira.online/history/mestres/cobrinha-verde/', 'https://nossa-tribo.com/mestre-cobrinha-verde-o-primo-de-besouro-manganga/']::text[],
  -- Capoeira-specific
  NULL, -- Not a capoeirista; mandingueiro (spiritual practitioner)
  'Not a capoeirista. Mandingueiro who taught spiritual practices (prayers, patuá, corpo fechado) but not capoeira fighting techniques. Parallel to Tio Alípio teaching Besouro, Pascoal transmitted African-Brazilian mystical traditions to Cobrinha Verde.',
  'Não era capoeirista. Mandingueiro que ensinava práticas espirituais (orações, patuá, corpo fechado), mas não técnicas de luta de capoeira. Paralelo a Tio Alípio ensinando Besouro, Pascoal transmitiu tradições místicas afro-brasileiras para Cobrinha Verde.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Africa (specific origin unknown)',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil', -- Presumed; he lived there
  -- bio_en
  E'Tio Pascoal was an African mandingueiro who lived in Santo Amaro da Purificação, Bahia. He resided across the river from the grandmother of Mestre Cobrinha Verde, in the Recôncavo Baiano region that produced some of capoeira''s most legendary figures.

A bachelor by all accounts, Pascoal was not a capoeirista but a keeper of African-Brazilian spiritual traditions. He specialized in mandinga—the mystical practices that capoeiristas believed could protect them from harm. In the culture of the time, a truly prepared capoeirista needed both fighting skill and spiritual protection; Pascoal provided the latter.

When the young Rafael Alves França (later Cobrinha Verde) would visit his grandmother, he came into contact with the old African across the river. Recognizing something in the boy, Pascoal told him: "You''re a brave boy, and I''m going to give you something. Only God could deceive you".

What Pascoal transmitted was profound. He placed sixty-five prayers in Cobrinha Verde''s head—including the Pai Nosso Positivo, the Pai Nosso da Palma, the Pai Nosso Pequeninho, and the Pai Nosso de Antonio Conselheiro (prayers associated with the messianic leader of the Canudos rebellion). He taught him how to prepare prayers dedicated to Santa Inês, Santo André, Sete Capelas, and Sete Folhas.

Most significantly, Pascoal created a patuá for Cobrinha Verde—a protective amulet that would become central to his legend. According to Cobrinha: "The person who gave me this amulet was an African who, to this day, when I speak of him, my eyes fill with tears. He was called Uncle Pascoal".

The old African told the boy about obtaining the materials for the patuá from Isídio, an old disciple at Bonfim Church. When Cobrinha returned with the materials, Pascoal prepared the amulet and instructed him: "Look, you have to use it like this, like this, like this". The patuá was said to be alive—it would jump when placed on a clean plate.

Cobrinha carried this amulet when he joined Colonel Horácio de Matos'' band at age seventeen. "It freed me from many things", he said. The patuá protected him through three years of violence in the Bahian sertão, from which he was the sole survivor of his 85-man battalion.

Just as Tio Alípio transmitted spiritual and martial knowledge to Besouro Mangangá, Tio Pascoal passed African-Brazilian mystical traditions to Cobrinha Verde. Both men represent the African spiritual practitioners who existed alongside the capoeira masters, providing the religious foundation that capoeiristas believed made them invincible.

Cobrinha Verde''s emotional testimony about Pascoal—that speaking of him still brought tears decades later—speaks to the profound impact this spiritual mentor had on his life. In an era when capoeiristas faced constant violence from police and rivals, the protection Pascoal offered was not merely symbolic but a genuine source of strength and courage.',
  -- bio_pt
  E'Tio Pascoal foi um mandingueiro africano que vivia em Santo Amaro da Purificação, Bahia. Ele residia do outro lado do rio da avó de Mestre Cobrinha Verde, na região do Recôncavo Baiano que produziu algumas das figuras mais lendárias da capoeira.

Solteiro por todas as descrições, Pascoal não era capoeirista, mas um guardião das tradições espirituais afro-brasileiras. Ele era especialista em mandinga—as práticas místicas que os capoeiristas acreditavam poder protegê-los de danos. Na cultura da época, um capoeirista verdadeiramente preparado precisava tanto de habilidade de luta quanto de proteção espiritual; Pascoal fornecia esta última.

Quando o jovem Rafael Alves França (mais tarde Cobrinha Verde) visitava sua avó, ele entrava em contato com o velho africano do outro lado do rio. Reconhecendo algo no menino, Pascoal disse-lhe: "Você é um menino valente, e eu vou lhe dar uma coisa. Só Deus poderia enganá-lo".

O que Pascoal transmitiu foi profundo. Ele colocou sessenta e cinco orações na cabeça de Cobrinha Verde—incluindo o Pai Nosso Positivo, o Pai Nosso da Palma, o Pai Nosso Pequeninho e o Pai Nosso de Antonio Conselheiro (orações associadas ao líder messiânico da rebelião de Canudos). Ele ensinou-lhe como preparar orações dedicadas a Santa Inês, Santo André, Sete Capelas e Sete Folhas.

Mais significativamente, Pascoal criou um patuá para Cobrinha Verde—um amuleto protetor que se tornaria central em sua lenda. Segundo Cobrinha: "A pessoa que me deu este amuleto foi um africano que, até hoje, quando falo dele, meus olhos se enchem de lágrimas. Ele se chamava Tio Pascoal".

O velho africano disse ao menino sobre obter os materiais para o patuá de Isídio, um velho discípulo na Igreja do Bonfim. Quando Cobrinha voltou com os materiais, Pascoal preparou o amuleto e instruiu-o: "Olha, você tem que usar assim, assim, assim". Dizia-se que o patuá era vivo—ele pulava quando colocado em um prato limpo.

Cobrinha carregou este amuleto quando se juntou ao bando do Coronel Horácio de Matos aos dezessete anos. "Me livrou de muitas coisas", ele disse. O patuá o protegeu através de três anos de violência no sertão baiano, dos quais ele foi o único sobrevivente de seu batalhão de 85 homens.

Assim como Tio Alípio transmitiu conhecimento espiritual e marcial a Besouro Mangangá, Tio Pascoal passou tradições místicas afro-brasileiras para Cobrinha Verde. Ambos os homens representam os praticantes espirituais africanos que existiam ao lado dos mestres de capoeira, fornecendo a base religiosa que os capoeiristas acreditavam torná-los invencíveis.

O testemunho emocional de Cobrinha Verde sobre Pascoal—que falar dele ainda trazia lágrimas décadas depois—fala do profundo impacto que este mentor espiritual teve em sua vida. Em uma era quando capoeiristas enfrentavam violência constante da polícia e rivais, a proteção que Pascoal oferecia não era meramente simbólica, mas uma fonte genuína de força e coragem.',
  -- achievements_en
  'Spiritual teacher of Mestre Cobrinha Verde; transmitted African-Brazilian mystical traditions (mandinga, patuá, corpo fechado, 65 prayers); created the legendary patuá that protected Cobrinha Verde through years of violence; represents the African spiritual practitioners who provided the religious foundation of capoeira culture',
  -- achievements_pt
  'Mentor espiritual de Mestre Cobrinha Verde; transmitiu tradições místicas afro-brasileiras (mandinga, patuá, corpo fechado, 65 orações); criou o lendário patuá que protegeu Cobrinha Verde através de anos de violência; representa os praticantes espirituais africanos que forneceram a base religiosa da cultura da capoeira',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1860, decade precision): African-born mandingueiro who taught the young Cobrinha Verde (b. 1912) probably in the 1920s when Cobrinha was a child/youth. If Pascoal was 50-70 years old when teaching, birth range would be 1850-1870. Using 1860 as midpoint estimate.

IDENTITY: Called "africano" in sources, which could mean African-born OR first-generation Brazilian of African parents (common usage in the era). The slave trade to Brazil was officially abolished in 1850, so an African-born person alive in the 1920s would have arrived as a child before 1850 or been born shortly after to recently-arrived African parents.

NOT A CAPOEIRISTA: Critically, Tio Pascoal was NOT a capoeirista. He was a mandingueiro—a spiritual practitioner who taught prayers, patuá creation, and corpo fechado. Cobrinha Verde learned capoeira fighting from Besouro and the Santo Amaro mestres; he learned mandinga from Pascoal. This parallels Tio Alípio teaching Besouro both capoeira AND spiritual practices.

LOCATION: Lived "do outro lado do rio atrás da casa da avó" (on the other side of the river behind his grandmother''s house) in Santo Amaro.

PRIMARY SOURCE: All information comes from Cobrinha Verde''s own testimony, preserved in "Capoeira e Mandingas: Cobrinha Verde" by Marcelino dos Santos (Mestre Mau), 1991.

SECONDARY SOURCES: Velhos Mestres, Capoeira Online, Nossa Tribo, De Capoeira, Educando com Ginga all cite the same primary source.

RELATIONSHIP TO COBRINHA VERDE: The influenced_by predicate is appropriate since Pascoal taught spiritual practices, not capoeira technique. He was not Cobrinha''s capoeira teacher.

MENTIONS OF ISÍDIO: The account mentions "um discípulo velho de nome Isídio" (an old disciple named Isídio) at Bonfim Church who provided materials for the patuá. This person may have been Pascoal''s own student or fellow practitioner.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1860, precisão de década): Mandingueiro nascido na África que ensinou o jovem Cobrinha Verde (n. 1912) provavelmente nos anos 1920 quando Cobrinha era criança/jovem. Se Pascoal tinha 50-70 anos quando ensinava, o intervalo de nascimento seria 1850-1870. Usando 1860 como estimativa do ponto médio.

IDENTIDADE: Chamado de "africano" nas fontes, o que poderia significar nascido na África OU brasileiro de primeira geração de pais africanos (uso comum na época). O tráfico de escravos para o Brasil foi oficialmente abolido em 1850, então uma pessoa nascida na África viva nos anos 1920 teria chegado como criança antes de 1850 ou nascido pouco depois de pais africanos recém-chegados.

NÃO ERA CAPOEIRISTA: Criticamente, Tio Pascoal NÃO era capoeirista. Ele era um mandingueiro—um praticante espiritual que ensinava orações, criação de patuá e corpo fechado. Cobrinha Verde aprendeu a luta de capoeira com Besouro e os mestres de Santo Amaro; ele aprendeu mandinga de Pascoal. Isso é paralelo a Tio Alípio ensinando Besouro tanto capoeira QUANTO práticas espirituais.

LOCALIZAÇÃO: Vivia "do outro lado do rio atrás da casa da avó" em Santo Amaro.

FONTE PRIMÁRIA: Toda informação vem do próprio testemunho de Cobrinha Verde, preservado em "Capoeira e Mandingas: Cobrinha Verde" por Marcelino dos Santos (Mestre Mau), 1991.

FONTES SECUNDÁRIAS: Velhos Mestres, Capoeira Online, Nossa Tribo, De Capoeira, Educando com Ginga todos citam a mesma fonte primária.

RELACIONAMENTO COM COBRINHA VERDE: O predicado influenced_by é apropriado já que Pascoal ensinava práticas espirituais, não técnica de capoeira. Ele não foi professor de capoeira de Cobrinha.

MENÇÕES A ISÍDIO: O relato menciona "um discípulo velho de nome Isídio" na Igreja do Bonfim que forneceu materiais para o patuá. Esta pessoa pode ter sido aluno do próprio Pascoal ou colega praticante.'
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
