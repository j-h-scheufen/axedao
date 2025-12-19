-- ============================================================
-- GENEALOGY PERSON: Curió
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR: January 23, 1937 - verified from multiple sources
-- (velhosmestres.com, capoeirahub, cms.ba.gov.br)
-- Note: Portal Capoeira incorrectly lists 1939, but the majority
-- of sources including velhosmestres.com confirm 1937.
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
  'Jaime Martins dos Santos',
  'Curió',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-25', 'https://www.capoeirahub.net/mestres/686db6ba1a348b787f2a068f-mestre-curio', 'https://portalcapoeira.com/capoeira/mestres/mestre-curio/', 'https://www.cms.ba.gov.br/noticias/medalha-zumbi-do-palmares-a-mestre-curio']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Curió is renowned for his unpredictable and theatrical style of Capoeira Angola. His game emphasizes mandinga (cunning/sagacity) over physical violence—"A capoeirista doesn''t need to strike to demonstrate skill." He embodies the philosophy that capoeira is "art, dance, cunning, philosophy, roguishness, theater, music, choreography and non-violence." His movements are deceptive and deliberate, prioritizing calm calculation over aggression.',
  E'Curió é conhecido por seu estilo imprevisível e teatral de Capoeira Angola. Seu jogo enfatiza a mandinga (astúcia/sagacidade) sobre a violência física—"Um capoeirista não precisa golpear para demonstrar habilidade." Ele incorpora a filosofia de que a capoeira é "arte, dança, malícia, filosofia, malandragem, teatro, música, coreografia e não violência." Seus movimentos são enganosos e deliberados, priorizando o cálculo calmo sobre a agressão.',
  -- Life dates
  1937,
  'exact'::genealogy.date_precision,
  'Candeias, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Jaime Martins dos Santos, known as Mestre Curió, was born on January 23, 1937, in Candeias, Bahia, into a family steeped in capoeira tradition. His father José Martins dos Santos—called Malvadeza or Martim da Pemba—was a capoeirista, as was his mother Maria Bispo (known as Pequena). His grandfather Pedro Virício, also a capoeirista, bore the same apelido "Curió" that his grandson would inherit. Raised in Santo Amaro, young Jaime was immersed in capoeira from age six, learning from his father and grandfather beginning in 1943.

At age seven, in 1944, Curió ran away from home—a brief chapter of his rebellious youth. By 1951, at only fourteen years old, he had already begun teaching capoeira himself, demonstrating remarkable early mastery of the art his family had transmitted to him.

In 1954, a young Curió appears in photographs at Mestre Waldemar''s legendary barracão in Liberdade, captured by French photographer Marcel Gautherot. These images place him among the vibrant roda scene of 1950s Salvador, alongside established figures of that golden era.

The decisive turning point came on April 10, 1968, when Curió formally joined Mestre Pastinha''s CECA (Centro Esportivo de Capoeira Angola) in Pelourinho. Under Pastinha—the father of Capoeira Angola—Curió absorbed not only technique but the philosophical foundations that would shape his entire approach to the art. He became one of Pastinha''s faithful disciples, alongside João Grande, João Pequeno, Boca Rica, Bola Sete, Gildo Alfinete, and Albertino.

When the Salvador city government forced Pastinha from the CECA building in 1971 during Pelourinho''s gentrification, Curió witnessed firsthand the displacement of his mestre. According to Curió, "with much resistance they were given a space for the academy on Ladeira do Ferrão, known as Ladeira do Mijo"—a painful chapter in the history of Capoeira Angola''s institutional struggle.

In June 1980, Curió participated in researcher Frede Abreu''s landmark "First Regional Capoeira Seminar and Festival of Capoeira Rhythms," held June 4-8 in Barris, Salvador. This event, attended by some 1,500 people, reunited the old guard of Capoeira Angola—Mestre Cobrinha Verde (who was "rediscovered" at this event), Mestre João Grande, Mestre Gigante, and others. It was a pivotal moment for the revival of traditional capoeira.

On January 7, 1982, Curió founded the Escola de Capoeira Angola Irmãos Gêmeos (ECAIG)—the "Twin Brothers School of Capoeira Angola." The school had earlier roots in 1960 in Alagoinhas (interior Bahia), but the 1982 founding marked its legal registration and its selection by Salvador''s Secretariat of Education and Culture to occupy a space in Pelourinho, returning capoeira angola to its historic heart.

ECAIG operates today from two locations in Salvador: the Pelourinho headquarters at Rua Gregório de Mattos, 9 (second floor), and the Centro da Cultura Forte de Santo Antônio in Santo Antônio Além do Carmo. The school is designated a "Ponto de Cultura" (Point of Culture) by Brazil''s Ministry of Culture—an afro-Brazilian cultural nucleus combining education and heritage preservation.

In 1988, Curió participated in "Velha Guarda" events that brought the old masters together: in Fortaleza with Mestres Waldemar and Boca Rica, and in Florianópolis with Mestres Bobó, João Pequeno, Nó, and Boa Gente. These gatherings preserved and transmitted the living memory of Capoeira Angola during a critical period.

In 1997, Curió traveled to Mexico to record his CD "A Voz Viva da Capoeira Angola" (The Living Voice of Capoeira Angola)—a musical testament to the oral and rhythmic traditions he carries.

From 2000 to 2002, Curió served as a director of ABCA (Associação Brasileira de Capoeira Angola), the organization founded in 1987 that unites the old mestres of Capoeira Angola. This placed him at the center of institutional efforts to preserve and promote the tradition.

Mestre Curió made history by becoming the first mestre to confer the title of Mestra upon a woman in Capoeira Angola. In January 2001, he elevated Valdelice Santos de Jesus—Mestra Jararaca—to the rank of mestra in a grand roda, as demanded by Angola tradition. According to Curió, one simply needs to see her playing to understand why she is called Jararaca (a venomous snake): "While training, the young lady who moved like a cobra showed true distinction." This act opened doors for generations of women in Capoeira Angola.

On December 13, 2016, at age 79, Curió received the Medalha Zumbi dos Palmares from Salvador''s Câmara Municipal—an honor recognizing individuals active in the fight against racism, discrimination, and intolerance. At the ceremony, Curió reflected on his teaching philosophy: he has formed only three mestres in his career, including one woman, explaining that he is "not in a hurry to form masters but rather to form citizens with knowledge and development."

In 2023, ECAIG hosted its 32nd Encontro Internacional de Capoeira Angola—an annual gathering that has drawn practitioners from Mexico, France, Switzerland, and across Brazil. The 2023 theme, "Do atabaque ao berimbau. Viva a tradição ancestral," honored the ancestral tradition Curió has dedicated his life to preserving.

At 88 years old, Mestre Curió continues to teach at his schools in Salvador, traveling internationally to spread capoeira angola to Mexico, Ecuador, Japan, Switzerland, Belgium, Argentina, Iraq, Germany, and the United States. He has been recognized as an ambassador of Brazilian culture.

As Curió himself has said: "Capoeira is art, dance, cunning, philosophy, roguishness, theater, music, choreography and non-violence. It only becomes dangerous in times of pain."',
  -- bio_pt
  E'Jaime Martins dos Santos, conhecido como Mestre Curió, nasceu em 23 de janeiro de 1937, em Candeias, Bahia, numa família profundamente enraizada na tradição da capoeira. Seu pai José Martins dos Santos—chamado Malvadeza ou Martim da Pemba—era capoeirista, assim como sua mãe Maria Bispo (conhecida como Pequena). Seu avô Pedro Virício, também capoeirista, carregava o mesmo apelido "Curió" que seu neto herdaria. Criado em Santo Amaro, o jovem Jaime foi imerso na capoeira desde os seis anos, aprendendo com seu pai e avô a partir de 1943.

Aos sete anos, em 1944, Curió fugiu de casa—um breve capítulo de sua juventude rebelde. Em 1951, com apenas catorze anos, já havia começado a ensinar capoeira, demonstrando domínio precoce notável da arte que sua família lhe transmitira.

Em 1954, um jovem Curió aparece em fotografias no lendário barracão de Mestre Waldemar na Liberdade, capturadas pelo fotógrafo francês Marcel Gautherot. Essas imagens o colocam entre a vibrante cena de rodas da Salvador dos anos 1950, ao lado de figuras estabelecidas daquela era dourada.

O ponto de virada decisivo veio em 10 de abril de 1968, quando Curió ingressou formalmente no CECA (Centro Esportivo de Capoeira Angola) de Mestre Pastinha no Pelourinho. Sob Pastinha—o pai da Capoeira Angola—Curió absorveu não apenas técnica, mas os fundamentos filosóficos que moldariam toda sua abordagem da arte. Tornou-se um dos discípulos fiéis de Pastinha, ao lado de João Grande, João Pequeno, Boca Rica, Bola Sete, Gildo Alfinete e Albertino.

Quando o governo municipal de Salvador forçou Pastinha a deixar o prédio do CECA em 1971 durante a gentrificação do Pelourinho, Curió testemunhou em primeira mão o deslocamento de seu mestre. Segundo Curió, "com muita resistência foi-lhes dado um espaço para a academia na Ladeira do Ferrão, conhecida como Ladeira do Mijo"—um capítulo doloroso na história da luta institucional da Capoeira Angola.

Em junho de 1980, Curió participou do histórico "Primeiro Seminário Regional de Capoeira e Festival de Ritmos da Capoeira" do pesquisador Frede Abreu, realizado de 4 a 8 de junho em Barris, Salvador. Este evento, com cerca de 1.500 pessoas, reuniu a velha guarda da Capoeira Angola—Mestre Cobrinha Verde (que foi "redescoberto" neste evento), Mestre João Grande, Mestre Gigante e outros. Foi um momento crucial para o renascimento da capoeira tradicional.

Em 7 de janeiro de 1982, Curió fundou a Escola de Capoeira Angola Irmãos Gêmeos (ECAIG). A escola teve raízes anteriores em 1960 em Alagoinhas (interior da Bahia), mas a fundação de 1982 marcou seu registro legal e sua seleção pela Secretaria de Educação e Cultura de Salvador para ocupar um espaço no Pelourinho, devolvendo a capoeira angola ao seu coração histórico.

A ECAIG opera hoje em duas localidades em Salvador: a sede no Pelourinho na Rua Gregório de Mattos, 9 (segundo andar), e o Centro da Cultura Forte de Santo Antônio em Santo Antônio Além do Carmo. A escola é designada como "Ponto de Cultura" pelo Ministério da Cultura do Brasil—um núcleo cultural afro-brasileiro que combina educação e preservação do patrimônio.

Em 1988, Curió participou de eventos da "Velha Guarda" que reuniram os antigos mestres: em Fortaleza com os Mestres Waldemar e Boca Rica, e em Florianópolis com os Mestres Bobó, João Pequeno, Nó e Boa Gente. Esses encontros preservaram e transmitiram a memória viva da Capoeira Angola durante um período crítico.

Em 1997, Curió viajou ao México para gravar seu CD "A Voz Viva da Capoeira Angola"—um testemunho musical das tradições orais e rítmicas que ele carrega.

De 2000 a 2002, Curió atuou como diretor da ABCA (Associação Brasileira de Capoeira Angola), a organização fundada em 1987 que une os antigos mestres da Capoeira Angola. Isso o colocou no centro dos esforços institucionais para preservar e promover a tradição.

Mestre Curió fez história ao se tornar o primeiro mestre a conferir o título de Mestra a uma mulher na Capoeira Angola. Em janeiro de 2001, ele elevou Valdelice Santos de Jesus—Mestra Jararaca—ao posto de mestra em uma grande roda, como exigido pela tradição Angola. Segundo Curió, basta vê-la jogando para entender por que ela é chamada Jararaca (uma cobra venenosa): "Durante o treino, a jovem que se movia como uma cobra mostrou verdadeira distinção." Este ato abriu portas para gerações de mulheres na Capoeira Angola.

Em 13 de dezembro de 2016, aos 79 anos, Curió recebeu a Medalha Zumbi dos Palmares da Câmara Municipal de Salvador—uma honra que reconhece indivíduos ativos na luta contra o racismo, discriminação e intolerância. Na cerimônia, Curió refletiu sobre sua filosofia de ensino: formou apenas três mestres em sua carreira, incluindo uma mulher, explicando que "não tem pressa em formar mestres, mas sim em formar cidadãos com conhecimento e desenvolvimento."

Em 2023, a ECAIG sediou seu 32º Encontro Internacional de Capoeira Angola—um encontro anual que atraiu praticantes do México, França, Suíça e de todo o Brasil. O tema de 2023, "Do atabaque ao berimbau. Viva a tradição ancestral," honrou a tradição ancestral que Curió dedicou sua vida a preservar.

Aos 88 anos, Mestre Curió continua ensinando em suas escolas em Salvador, viajando internacionalmente para difundir a capoeira angola no México, Equador, Japão, Suíça, Bélgica, Argentina, Iraque, Alemanha e Estados Unidos. Ele foi reconhecido como embaixador da cultura brasileira.

Como o próprio Curió disse: "Capoeira é arte, dança, malícia, filosofia, malandragem, teatro, música, coreografia e não violência. Ela só se torna perigosa em tempos de dor."',
  -- achievements_en
  E'Founded Escola de Capoeira Angola Irmãos Gêmeos (ECAIG, 1982); First mestre to grant Mestra title to a woman in Capoeira Angola (Mestra Jararaca, January 2001); Medalha Zumbi dos Palmares (Câmara Municipal de Salvador, December 13, 2016); Director of ABCA (Associação Brasileira de Capoeira Angola, 2000-2002); Recorded CD "A Voz Viva da Capoeira Angola" (Mexico, 1997); Recognized as ambassador of Brazilian culture; 32+ years hosting Encontro Internacional de Capoeira Angola; Designated as "Ponto de Cultura" by Brazilian Ministry of Culture; Taught capoeira in 9+ countries internationally; Participant in 1980 First Regional Capoeira Seminar with old guard mestres',
  -- achievements_pt
  E'Fundou a Escola de Capoeira Angola Irmãos Gêmeos (ECAIG, 1982); Primeiro mestre a conceder título de Mestra a uma mulher na Capoeira Angola (Mestra Jararaca, janeiro de 2001); Medalha Zumbi dos Palmares (Câmara Municipal de Salvador, 13 de dezembro de 2016); Diretor da ABCA (Associação Brasileira de Capoeira Angola, 2000-2002); Gravou CD "A Voz Viva da Capoeira Angola" (México, 1997); Reconhecido como embaixador da cultura brasileira; Mais de 32 anos sediando o Encontro Internacional de Capoeira Angola; Designado como "Ponto de Cultura" pelo Ministério da Cultura do Brasil; Ensinou capoeira em mais de 9 países internacionalmente; Participante do Primeiro Seminário Regional de Capoeira de 1980 com mestres da velha guarda',
  -- Researcher notes (English)
  E'BIRTH YEAR (1937, exact):
Born January 23, 1937 - verified from velhosmestres.com, capoeirahub.net, and cms.ba.gov.br. Portal Capoeira incorrectly lists 1939, but majority sources confirm 1937. At 88 years old as of 2025.

NAME: Jaime Martins dos Santos. The apelido "Curió" inherited from his grandfather Pedro Virício (Curió or "Curió Velho/Grande"), a capoeirista from Santo Amaro.

FAMILY LINEAGE:
- Grandfather: Pedro Virício (Curió) - capoeirista
- Father: José Martins dos Santos (Malvadeza/Martim da Pemba) - capoeirista
- Mother: Maria Bispo (Pequena) - capoeirista

BIRTHPLACE DISCREPANCY:
- Candeias, Bahia (majority: velhosmestres, capoeirahub)
- Patos Pinhares, Paraíba (portalcapoeira - likely error)
Using Candeias, Bahia as it appears in more authoritative sources and matches his family''s Santo Amaro connection.

TEACHERS:
- Family: Grandfather Pedro Virício and father José Martins (from 1943)
- Mestre Pastinha (joined CECA April 10, 1968)

STUDENTS (confirmed):
- Mestra Jararaca (Valdelice Santos de Jesus) - first woman mestra in Capoeira Angola, titled January 2001
- Mestre Augusto Januário (born 1956; disciple for many years; founded LINISI 1987)
- Mestre Marcelo Angola (Luiz Marcelo Santos Moraes; began August 1985; founded Angoleiros do Mar 1999)
- Mestre Pintor (Paulo César Leite dos Santos; trained in Bahia period alongside other mestres)

RODA LOCATIONS:
- ECAIG Pelourinho: Rua Gregório de Mattos, 9, 2º andar, Salvador
- ECAIG Forte da Capoeira: Centro da Cultura Forte de Santo Antônio, Santo Antônio Além do Carmo

MEDIA APPEARANCES:
- 1954: Photographed at Mestre Waldemar''s barracão by Marcel Gautherot (IMS collection)
- 1997: CD "A Voz Viva da Capoeira Angola" recorded in Mexico
- 2008: Photographed by André Cypriano (Library of Congress collection, LC-DIG-ppbd-01137)

EVENTS:
- 1980: First Regional Capoeira Seminar (Frede Abreu), June 4-8, Barris, Salvador - with Cobrinha Verde, João Grande, Gigante
- 1988: Velha Guarda event in Fortaleza with Waldemar, Boca Rica (Colégio Militar de Fortaleza)
- 1988: Velha Guarda event in Florianópolis with Bobó, João Pequeno, Nó, Boa Gente
- 2023: 32nd Encontro Internacional de Capoeira Angola ECAIG

ECAIG HISTORY:
- 1960: Origins in Alagoinhas, interior Bahia (informal)
- 1982: Legal founding January 7 in Salvador, selected by Secretariat of Education and Culture
- Designated "Ponto de Cultura" by Ministry of Culture',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1937, exato):
Nascido em 23 de janeiro de 1937 - verificado em velhosmestres.com, capoeirahub.net e cms.ba.gov.br. Portal Capoeira lista incorretamente 1939, mas a maioria das fontes confirma 1937. Com 88 anos em 2025.

NOME: Jaime Martins dos Santos. O apelido "Curió" herdado de seu avô Pedro Virício (Curió ou "Curió Velho/Grande"), um capoeirista de Santo Amaro.

LINHAGEM FAMILIAR:
- Avô: Pedro Virício (Curió) - capoeirista
- Pai: José Martins dos Santos (Malvadeza/Martim da Pemba) - capoeirista
- Mãe: Maria Bispo (Pequena) - capoeirista

DISCREPÂNCIA DO LOCAL DE NASCIMENTO:
- Candeias, Bahia (maioria: velhosmestres, capoeirahub)
- Patos Pinhares, Paraíba (portalcapoeira - provavelmente erro)
Usando Candeias, Bahia pois aparece em fontes mais confiáveis e corresponde à conexão de sua família com Santo Amaro.

MESTRES:
- Família: Avô Pedro Virício e pai José Martins (a partir de 1943)
- Mestre Pastinha (ingressou no CECA em 10 de abril de 1968)

ALUNOS (confirmados):
- Mestra Jararaca (Valdelice Santos de Jesus) - primeira mulher mestra na Capoeira Angola, titulada em janeiro de 2001
- Mestre Augusto Januário (nascido 1956; discípulo por muitos anos; fundou LINISI 1987)
- Mestre Marcelo Angola (Luiz Marcelo Santos Moraes; iniciou agosto 1985; fundou Angoleiros do Mar 1999)
- Mestre Pintor (Paulo César Leite dos Santos; treinou no período da Bahia junto com outros mestres)

LOCAIS DE RODA:
- ECAIG Pelourinho: Rua Gregório de Mattos, 9, 2º andar, Salvador
- ECAIG Forte da Capoeira: Centro da Cultura Forte de Santo Antônio, Santo Antônio Além do Carmo

APARIÇÕES NA MÍDIA:
- 1954: Fotografado no barracão de Mestre Waldemar por Marcel Gautherot (coleção IMS)
- 1997: CD "A Voz Viva da Capoeira Angola" gravado no México
- 2008: Fotografado por André Cypriano (coleção Library of Congress, LC-DIG-ppbd-01137)

EVENTOS:
- 1980: Primeiro Seminário Regional de Capoeira (Frede Abreu), 4-8 de junho, Barris, Salvador - com Cobrinha Verde, João Grande, Gigante
- 1988: Evento Velha Guarda em Fortaleza com Waldemar, Boca Rica (Colégio Militar de Fortaleza)
- 1988: Evento Velha Guarda em Florianópolis com Bobó, João Pequeno, Nó, Boa Gente
- 2023: 32º Encontro Internacional de Capoeira Angola ECAIG

HISTÓRIA DA ECAIG:
- 1960: Origens em Alagoinhas, interior da Bahia (informal)
- 1982: Fundação legal em 7 de janeiro em Salvador, selecionada pela Secretaria de Educação e Cultura
- Designada "Ponto de Cultura" pelo Ministério da Cultura'
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
