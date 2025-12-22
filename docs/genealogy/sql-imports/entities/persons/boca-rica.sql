-- ============================================================
-- GENEALOGY PERSON: Boca Rica
-- Generated: 2025-12-19
-- ============================================================
-- Mestre Boca Rica (Manoel Silva) is a living mestre, born
-- November 26, 1936 in Maragogipe, Bahia. Direct student of
-- Mestre Pastinha at CECA. Founder of Escola de Capoeira Angola
-- da Bahia (1970). International ambassador of Capoeira Angola.
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
  'Manoel Silva',
  'Boca Rica',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-18', 'https://bocarica.wordpress.com/mestre-boca-rica/', 'https://portalcapoeira.com/diretorio/ecaba-escola-de-capoeira-angola-da-bahia-mestre-boca-rica/', 'https://www.capoeirahub.net/mestres']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'One of the few mestres who maintains the traditional deep tuning of the berimbaus "like the old ones." Expert berimbau player knowing multiple toques including several from Capoeira Regional. Renowned vocalist with distinctive interpretations of traditional songs including "Mandei caiar meu sobrado," "Maranhão," and "Sambalelê bateu na porta." Emphasizes musicality and oral tradition in his teaching.',
  E'Um dos poucos mestres que mantém a afinação grave tradicional dos berimbaus "como os antigos." Tocador expert de berimbau conhecendo múltiplos toques incluindo vários da Capoeira Regional. Cantor renomado com interpretações distintivas de cantigas tradicionais incluindo "Mandei caiar meu sobrado," "Maranhão," e "Sambalelê bateu na porta." Enfatiza a musicalidade e a tradição oral em seu ensino.',
  -- Life dates
  1936,
  'exact'::genealogy.date_precision,
  'Maragogipe, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Manoel Silva was born on November 26, 1936, in Maragogipe, in the Recôncavo Baiano region of Bahia. His parents were Palmira and Cândido Silva. At twelve years old, he discovered capoeira. At fifteen, in the early 1950s, he moved to Salvador, where his life would be transformed by the art.

In 1952, the young Manoel began training at the Centro Esportivo de Capoeira Angola (CECA), Mestre Pastinha''s legendary academy at Praça do Pelourinho n° 19. It was Pastinha himself who gave him the apelido "Boca Rica"—because of the gold teeth that lined the entire upper row of his mouth, a mark of status in that era. The name stuck, and it would become known across five continents.

Beyond CECA, Boca Rica frequented the famous barracão of Mestre Waldemar at the Passeio de Aguinelo in the Liberdade neighborhood, and other rodas throughout Salvador. He absorbed knowledge wherever he found it, seeking out accomplished mestres and different traditions. In interviews, he described Pastinha as "a philosopher" and "my second father," explaining that Pastinha taught systematically—instructing students on rhythms, their names, and applications. His musical references became threefold: Mestre Pastinha for tradition, Mestre Waldemar da Paixão for singing, and Mestre Bimba for the sounds of Regional.

Boca Rica accompanied Pastinha until the master''s final days. After Pastinha went blind, Boca Rica would bring his students to perform at the academy in Pelourinho. Pastinha reportedly still played "by touch" despite his blindness. Boca Rica committed himself to spreading Pastinha''s legacy, telling his mestre: "wherever I go, your name is being spread."

The 1960s saw Boca Rica appearing in photographs on the streets of Liberdade alongside the great mestres of the era—João Pequeno, Waldemar, Curió, Bigodinho, and Olavo. He participated in the recording of the film "O Pagador de Promessas" (1962), the Palme d''Or winner that brought capoeira to international screens. In 1988, he participated in the Velha Guarda da Bahia event in Fortaleza at the Colégio Militar, joining mestres Waldemar and Curió.

In 1970, Boca Rica founded the Escola de Capoeira Angola da Bahia (ECAB) at the Forte de Santo Antônio Além do Carmo in Salvador—the historic fort that today serves as the Forte da Capoeira cultural center. The school continues to operate daily, a temple of learning, music, and tradition. His organization reports 10 mestres, 5 contra-mestres, 5 professors, and approximately 50 students trained. The school maintains operations in Bahia, Goiás, and internationally in England.

Capoeira carried Boca Rica across the world. He has traveled to more than 50 countries and visited all Brazilian states except Piauí and southern Maranhão. Among his most remarkable experiences: performing for Queen Elizabeth II and the Princess of Denmark, receiving the "Notório Saber" title (Notable Knowledge, an academic recognition) from D. Pedro II College of Salvador, and being awarded the Thomé de Souza Medal by Salvador''s City Council in 2018.

As a recording artist, Boca Rica has released over 14 albums dedicated to capoeira. In 2000, he recorded a collaborative CD "Capoeira Angola" with Mestre Bigodinho—37 songs capturing the samba-de-roda tradition both mestres loved. Other releases include "A Poesia de Boca Rica" (2000) and "Vencedor de Demanda" (2019). His voice has become unmistakable in songs like "Mandei caiar meu sobrado," "Maranhão," and "Sambalelê bateu na porta."

Boca Rica served on the board of ABCA (Associação Brasileira de Capoeira Angola), the principal Angola organization in Brazil, helping to preserve and promote the traditional art. Capoeiristas and researchers from around the world continue to travel to Salvador to learn from and meet him at the Forte da Capoeira.

In 2020, a biography was published: "Manoel Silva Mestre Boca Rica - Histórias e Lições de Vida, Preciosidade da Capoeira," authored by Thercio Sabino (CM Coelho) and Luiz Normanha. The book gathers his reports, speeches, and documents, preserving for future generations the enormous legacy of this faithful student of Mestre Pastinha.

At 88 years old, Boca Rica remains active in capoeira rodas, still singing and enchanting audiences with the deep philosophy and musicality he inherited from Pastinha. His message to younger generations: "não deixem essa capoeira morrer"—don''t let this capoeira die.',
  -- bio_pt
  E'Manoel Silva nasceu em 26 de novembro de 1936, em Maragogipe, na região do Recôncavo Baiano. Seus pais foram Palmira e Cândido Silva. Aos doze anos, descobriu a capoeira. Aos quinze, no início dos anos 1950, mudou-se para Salvador, onde sua vida seria transformada pela arte.

Em 1952, o jovem Manoel começou a treinar no Centro Esportivo de Capoeira Angola (CECA), a lendária academia de Mestre Pastinha na Praça do Pelourinho n° 19. Foi o próprio Pastinha quem lhe deu o apelido "Boca Rica"—por causa dos dentes de ouro que ocupavam toda a parte superior de sua boca, uma marca de status naquela época. O nome ficou, e se tornaria conhecido em cinco continentes.

Além do CECA, Boca Rica frequentava o famoso barracão de Mestre Waldemar no Passeio de Aguinelo no bairro da Liberdade, e outras rodas por toda Salvador. Absorvia conhecimento onde quer que encontrasse, buscando mestres realizados e diferentes tradições. Em entrevistas, descreveu Pastinha como "um filósofo" e "meu segundo pai," explicando que Pastinha ensinava sistematicamente—instruindo os alunos sobre ritmos, seus nomes e aplicações. Suas referências musicais tornaram-se tríplices: Mestre Pastinha para tradição, Mestre Waldemar da Paixão para canto, e Mestre Bimba para os sons do Regional.

Boca Rica acompanhou Pastinha até os últimos dias do mestre. Depois que Pastinha ficou cego, Boca Rica levava seus alunos para se apresentar na academia no Pelourinho. Pastinha supostamente ainda tocava "pelo tato" apesar de sua cegueira. Boca Rica comprometeu-se a espalhar o legado de Pastinha, dizendo ao seu mestre: "por onde eu for, seu nome está sendo espalhado."

Os anos 1960 viram Boca Rica aparecer em fotografias nas ruas da Liberdade ao lado dos grandes mestres da época—João Pequeno, Waldemar, Curió, Bigodinho e Olavo. Participou da gravação do filme "O Pagador de Promessas" (1962), o vencedor da Palma de Ouro que levou a capoeira às telas internacionais. Em 1988, participou do evento Velha Guarda da Bahia em Fortaleza no Colégio Militar, juntando-se aos mestres Waldemar e Curió.

Em 1970, Boca Rica fundou a Escola de Capoeira Angola da Bahia (ECAB) no Forte de Santo Antônio Além do Carmo em Salvador—o forte histórico que hoje serve como centro cultural Forte da Capoeira. A escola continua a funcionar diariamente, um templo de aprendizado, música e tradição. Sua organização reporta 10 mestres, 5 contra-mestres, 5 professores e aproximadamente 50 alunos formados. A escola mantém operações na Bahia, Goiás e internacionalmente na Inglaterra.

A capoeira levou Boca Rica pelo mundo. Viajou para mais de 50 países e visitou todos os estados brasileiros exceto Piauí e sul do Maranhão. Entre suas experiências mais notáveis: apresentar-se para a Rainha Elizabeth II e a Princesa da Dinamarca, receber o título de "Notório Saber" (um reconhecimento acadêmico) do Colégio D. Pedro II de Salvador, e ser agraciado com a Medalha Thomé de Souza pela Câmara Municipal de Salvador em 2018.

Como artista de gravação, Boca Rica lançou mais de 14 álbuns dedicados à capoeira. Em 2000, gravou um CD colaborativo "Capoeira Angola" com Mestre Bigodinho—37 canções capturando a tradição do samba-de-roda que ambos os mestres amavam. Outros lançamentos incluem "A Poesia de Boca Rica" (2000) e "Vencedor de Demanda" (2019). Sua voz tornou-se inconfundível em cantigas como "Mandei caiar meu sobrado," "Maranhão," e "Sambalelê bateu na porta."

Boca Rica serviu no conselho da ABCA (Associação Brasileira de Capoeira Angola), a principal organização de Angola no Brasil, ajudando a preservar e promover a arte tradicional. Capoeiristas e pesquisadores de todo o mundo continuam a viajar para Salvador para aprender e encontrá-lo no Forte da Capoeira.

Em 2020, uma biografia foi publicada: "Manoel Silva Mestre Boca Rica - Histórias e Lições de Vida, Preciosidade da Capoeira," de autoria de Thercio Sabino (CM Coelho) e Luiz Normanha. O livro reúne seus relatos, falas e documentos, preservando para gerações futuras o enorme legado deste fiel discípulo de Mestre Pastinha.

Aos 88 anos, Boca Rica permanece ativo nas rodas de capoeira, ainda cantando e encantando audiências com a profunda filosofia e musicalidade que herdou de Pastinha. Sua mensagem para as gerações mais jovens: "não deixem essa capoeira morrer."',
  -- achievements_en
  E'Founded Escola de Capoeira Angola da Bahia (ECAB) in 1970 at Forte de Santo Antônio Além do Carmo, Salvador
Recorded over 14 albums including "Capoeira Angola" with Mestre Bigodinho (2000), "A Poesia de Boca Rica" (2000), "Vencedor de Demanda" (2019)
Traveled to 50+ countries and all Brazilian states (except Piauí and southern Maranhão) spreading Capoeira Angola
Performed for Queen Elizabeth II and the Princess of Denmark
Participated in filming of "O Pagador de Promessas" (1962), Palme d''Or winner at Cannes
Received "Notório Saber" (Notable Knowledge) title from D. Pedro II College of Salvador
Awarded Thomé de Souza Medal by Salvador City Council (2018)
Board member of ABCA (Associação Brasileira de Capoeira Angola)
Direct student and close companion of Mestre Pastinha until his death (1981)
Participated in Velha Guarda da Bahia event in Fortaleza (1988)',
  -- achievements_pt
  E'Fundou a Escola de Capoeira Angola da Bahia (ECAB) em 1970 no Forte de Santo Antônio Além do Carmo, Salvador
Gravou mais de 14 álbuns incluindo "Capoeira Angola" com Mestre Bigodinho (2000), "A Poesia de Boca Rica" (2000), "Vencedor de Demanda" (2019)
Viajou para mais de 50 países e todos os estados brasileiros (exceto Piauí e sul do Maranhão) difundindo a Capoeira Angola
Apresentou-se para a Rainha Elizabeth II e a Princesa da Dinamarca
Participou da filmagem de "O Pagador de Promessas" (1962), vencedor da Palma de Ouro em Cannes
Recebeu título de "Notório Saber" do Colégio D. Pedro II de Salvador
Agraciado com a Medalha Thomé de Souza pela Câmara Municipal de Salvador (2018)
Membro do conselho da ABCA (Associação Brasileira de Capoeira Angola)
Aluno direto e companheiro próximo de Mestre Pastinha até sua morte (1981)
Participou do evento Velha Guarda da Bahia em Fortaleza (1988)',
  -- notes_en
  E'BIRTH DATE: November 26, 1936 - confirmed across multiple sources (velhosmestres.com, Portal Capoeira, IPHAN registry, Last.fm biography).

BIRTHPLACE: Maragogipe, Recôncavo Baiano, Bahia - confirmed across multiple sources.

PARENTS: Palmira (mother) and Cândido Silva (father) - documented at velhosmestres.com.

APELIDO ORIGIN: Given by Mestre Pastinha because of gold teeth on entire upper row of his mouth - confirmed across multiple sources.

TEACHERS:
- Mestre Pastinha (primary, 1952 onwards, CECA Pelourinho n° 19)
- Mestre Waldemar da Paixão (additional training at barracão, Passeio de Aguinelo, Liberdade)
- Also visited Mestre Bimba''s academy to learn Regional techniques

DISCOGRAPHY (confirmed recordings):
- 2000: "Capoeira Angola" with Mestre Bigodinho (37 songs, collaborative)
- 2000: "A Poesia de Boca Rica"
- 2019: "Vencedor de Demanda"
- 14+ total albums claimed

MEDIA APPEARANCES:
- 1960s: Photographed with João Pequeno, Waldemar, Curió, Bigodinho, Olavo on streets of Liberdade
- 1962: Film "O Pagador de Promessas" (Palme d''Or winner)
- Documentary "Fly Away Beetle" (testimony alongside Olavo dos Santos and Cobra Mansa)

TRAVEL DISCREPANCY:
- Some sources say 30+ countries, others 40+, others 50+ countries
- IPHAN registry says 50+ and all Brazilian states except Piauí and southern Maranhão
- Using 50+ as most authoritative (government registry)

FOUNDING DATE ECAB:
- IPHAN registry lists 1970 as founding year
- Co-founders listed as "Manoel Silva and Mestre Boca Rica" (same person, likely data entry issue)

NOTABLE STUDENTS:
- Mestre Valu (Grupo Balança Capoeira, Salvador)
- Contramestra Carol Canguçu (current support in Salvador)
- Students teaching in France, Argentina, USA, and other countries

RODA LOCATION: Forte da Capoeira, Largo de Santo Antônio Além do Carmo, Salvador, Bahia (ZIP: 40301-280)

PENDING RELATIONSHIPS:
- Boca Rica associated_with Viva Bahia (folkloric group; listed alongside many mestres who passed through)',
  -- notes_pt
  E'DATA DE NASCIMENTO: 26 de novembro de 1936 - confirmado em múltiplas fontes (velhosmestres.com, Portal Capoeira, registro IPHAN, biografia Last.fm).

LOCAL DE NASCIMENTO: Maragogipe, Recôncavo Baiano, Bahia - confirmado em múltiplas fontes.

PAIS: Palmira (mãe) e Cândido Silva (pai) - documentado em velhosmestres.com.

ORIGEM DO APELIDO: Dado por Mestre Pastinha por causa dos dentes de ouro em toda a parte superior de sua boca - confirmado em múltiplas fontes.

PROFESSORES:
- Mestre Pastinha (principal, 1952 em diante, CECA Pelourinho n° 19)
- Mestre Waldemar da Paixão (treino adicional no barracão, Passeio de Aguinelo, Liberdade)
- Também visitou a academia de Mestre Bimba para aprender técnicas do Regional

DISCOGRAFIA (gravações confirmadas):
- 2000: "Capoeira Angola" com Mestre Bigodinho (37 cantigas, colaborativo)
- 2000: "A Poesia de Boca Rica"
- 2019: "Vencedor de Demanda"
- 14+ álbuns no total alegados

APARIÇÕES NA MÍDIA:
- Anos 1960: Fotografado com João Pequeno, Waldemar, Curió, Bigodinho, Olavo nas ruas da Liberdade
- 1962: Filme "O Pagador de Promessas" (vencedor da Palma de Ouro)
- Documentário "Fly Away Beetle" (depoimento junto com Olavo dos Santos e Cobra Mansa)

DISCREPÂNCIA DE VIAGENS:
- Algumas fontes dizem 30+ países, outras 40+, outras 50+ países
- Registro IPHAN diz 50+ e todos os estados brasileiros exceto Piauí e sul do Maranhão
- Usando 50+ como mais autoritativo (registro governamental)

DATA DE FUNDAÇÃO ECAB:
- Registro IPHAN lista 1970 como ano de fundação
- Co-fundadores listados como "Manoel Silva e Mestre Boca Rica" (mesma pessoa, provavelmente erro de entrada de dados)

ALUNOS NOTÁVEIS:
- Mestre Valu (Grupo Balança Capoeira, Salvador)
- Contramestra Carol Canguçu (suporte atual em Salvador)
- Alunos ensinando na França, Argentina, EUA e outros países

LOCAL DA RODA: Forte da Capoeira, Largo de Santo Antônio Além do Carmo, Salvador, Bahia (CEP: 40301-280)

RELACIONAMENTOS PENDENTES:
- Boca Rica associated_with Viva Bahia (grupo folclórico; listado junto com muitos mestres que passaram)'
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
