-- ============================================================
-- GENEALOGY PERSON: Sinhozinho
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
  'Agenor Moreira Sampaio',
  'Sinhozinho',
  'mestre'::genealogy.title,
  NULL,  -- No historical portrait found in public domain
  ARRAY['https://en.wikipedia.org/wiki/Agenor_Moreira_Sampaio', 'https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/', 'https://www.lalaue.com/learn-capoeira/mestre-sinhozinho/']::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'Sinhozinho developed and taught "capoeira carioca" (Carioca style), a combat-focused variant distinct from both Angola and Bimba''s Regional. He stripped away music and rituals, emphasizing combat effectiveness. His ginga was adapted from boxing footwork, and he incorporated Greco-Roman wrestling, savate, and judo techniques. Training included weapons (razor and cane) and the traditional Cariocan pernada. His style died with him because he never systematized his teaching methods.',
  E'Sinhozinho desenvolveu e ensinou "capoeira carioca", uma variante focada em combate distinta tanto do Angola quanto da Regional de Bimba. Ele eliminou música e rituais, enfatizando a eficácia no combate. Sua ginga foi adaptada do trabalho de pés do boxe, e incorporou luta greco-romana, savate e técnicas de judô. O treinamento incluía armas (navalha e bengala) e a tradicional pernada carioca. Seu estilo morreu com ele porque nunca sistematizou seus métodos de ensino.',
  -- Life dates
  1891,
  'year'::genealogy.date_precision,
  'Santos, São Paulo, Brazil',
  1962,
  'year'::genealogy.date_precision,
  'Ipanema, Rio de Janeiro, Brazil',
  -- bio_en
  E'Agenor Moreira Sampaio was born in 1891 in Santos, the son of Lieutenant Colonel José Moreira de Sampaio, a political chief who briefly served as mayor of Santos in 1899. One of eight children, Agenor grew up in an athletic environment, training formally in boxing, savate, Greco-Roman wrestling, and arm wrestling from childhood. At the docks of Santos—Brazil''s largest port—he encountered capoeira for the first time, learning from the stevedores and sailors who practiced in the margins of the port.

In 1904, at age 13, he joined the Club Esperia in São Paulo as a student member, where Edú Chaves introduced him to more refined European combat techniques. In 1907, he trained at Club Força e Coragem under Professor Pedro Pucceti. The following year, 1908, his family moved to Rio de Janeiro, and young Agenor found himself neighbors with José Floriano "Zeca" Peixoto—son of the former Brazilian president Floriano Peixoto and an accomplished martial artist and capoeirista. Zeca further trained him in the local fighting style known as pernada or capoeira carioca.

The decisive moment came on May 1, 1909, when Sinhozinho witnessed the legendary fight at the Pavilhão Internacional where capoeirista Cyriaco defeated the Japanese jiu-jitsu champion Sada Miyako with a devastating rabo de arraia kick. The victory electrified nationalist sentiment and made capoeira briefly heroic. Inspired, Sinhozinho sought out capoeira training on the Morro de Santo Antônio and in the company of bohemians and malandros from Lapa—the rough neighborhoods where the art survived despite legal prohibition.

By the 1920s, he had developed his own approach to what he called "Ginástica Brasileira (Capoeiragem)," demonstrating it publicly in 1920 in exhibitions directed by Mário Aleixo and Raul Pederneiras. Unlike Mestre Bimba in Bahia—who was developing a systematized curriculum with belts and sequences—Sinhozinho approached teaching individualistically. Each student received personalized training, and he built his own equipment and training tools.

In 1930, he opened Rio de Janeiro''s first formal capoeira academies: one in the bustling city center at Rua do Rosário nº 133, and another in affluent Ipanema "for good young men who aspire to courage." His gyms moved through several locations around Ipanema over the decades—Redentor Street, Almirante Saddock de Sá Street (the "Clube do Sinhozinho"), Vieira Souto Avenue, and others. Unlike most mestres who taught in working-class neighborhoods, Sinhozinho catered to the middle and upper classes.

His teaching philosophy prioritized combat over tradition. He eliminated berimbau music and ritual rodas entirely, focusing purely on fighting effectiveness. He modified the traditional ginga to resemble boxing footwork. He incorporated throws and ground techniques from Greco-Roman wrestling and judo. He trained students with the navalha (razor, called "sardine" or "Santo Cristo") and the decorated cane ("Petrópolis"). He also preserved the traditional roda de pernada—an ancient Cariocan game using only kicks and unbalancing blows, played without music.

During the Vargas dictatorship, Sinhozinho served as hand-to-hand combat instructor for the feared Polícia Especial (Special Police), training the regime''s secret police in close combat. He rose to the position of Vigilance Officer, retiring between 1937 and 1945. His political connections gave him protection and legitimacy at a time when capoeira still carried the stigma of criminality.

His students won spectacular victories that made national headlines. In February 1949, he launched a formal challenge to Mestre Bimba''s Capoeira Regional school, which was touring São Paulo. Bimba''s students traveled to Rio de Janeiro for a two-day fighting event at the Estádio Carioca on April 2 and 7, organized by the Federação Metropolitana de Pugilismo. In the first match, Sinhozinho''s student Luiz "Cirandinha" Pereira Aguiar knocked out Bimba''s student Jurandir in the first round with a body kick. In the second match, seventeen-year-old Rudolf Hermanny defeated Regional student Fernando Rodrigues Perez in two minutes, injuring his arm with a kick. Reports say Bimba himself was impressed enough to incorporate some movements he witnessed into his own style.

In 1953, Sinhozinho challenged the Gracie family to a vale tudo charity event at the Vasco da Gama stadium on March 17. His fighters were again Hermanny and Cirandinha. Against Guanair Gomes, Hermanny fought for one hour and ten minutes before the match was declared a draw—with Hermanny looking fresher at the end. In the second fight, Carlson Gracie defeated an exhausted Cirandinha by corner stoppage.

His most famous students became champions in multiple disciplines: André Jansen, goalkeeper of Botafogo FC and considered the best capoeirista of his era; Rudolf de Otero Hermanny, who became a judo champion, physical educator, and coach of Brazil''s 1966 World Cup football team; Luiz "Cirandinha" Pereira Aguiar, weightlifter and "Brazilian capoeira champion"; Antonio Carlos "Tom" Jobim, the legendary Bossa Nova musician; Olympic Committee president Sylvio de Magalhães Padilha; and Augusto Cordeiro, judo master who served as his combat consultant.

Sinhozinho died in 1962 in Ipanema. Because he never systematized his teaching methods—refusing to create standardized sequences, graduation systems, or formalized pedagogy—his particular style of capoeira carioca died with him. His students could fight but could not transmit his method to the next generation.

His legacy lives on in monuments: a statue in Ipanema honors him, and a street in Ilha do Governador bears his name. In the history of capoeira, he represents the road not taken—a combat-focused, individualized approach that nearly legitimized capoeira as sport before Bimba''s more successful systematization carried the day.',
  -- bio_pt
  E'Agenor Moreira Sampaio nasceu em 1891 em Santos, filho do Tenente-Coronel José Moreira de Sampaio, chefe político que serviu brevemente como prefeito de Santos em 1899. Um de oito filhos, Agenor cresceu em ambiente atlético, treinando formalmente boxe, savate, luta greco-romana e queda de braço desde a infância. Nas docas de Santos—o maior porto do Brasil—encontrou a capoeira pela primeira vez, aprendendo com os estivadores e marinheiros que praticavam às margens do porto.

Em 1904, aos 13 anos, ingressou no Club Esperia em São Paulo como membro-estudante, onde Edú Chaves o introduziu a técnicas de combate europeias mais refinadas. Em 1907, treinou no Club Força e Coragem sob o Professor Pedro Pucceti. No ano seguinte, 1908, sua família mudou-se para o Rio de Janeiro, e o jovem Agenor tornou-se vizinho de José Floriano "Zeca" Peixoto—filho do ex-presidente brasileiro Floriano Peixoto e um consumado artista marcial e capoeirista. Zeca continuou treinando-o no estilo de luta local conhecido como pernada ou capoeira carioca.

O momento decisivo veio em 1º de maio de 1909, quando Sinhozinho testemunhou a lendária luta no Pavilhão Internacional onde o capoeirista Cyriaco derrotou o campeão japonês de jiu-jitsu Sada Miyako com um devastador rabo de arraia. A vitória eletrificou o sentimento nacionalista e tornou a capoeira brevemente heroica. Inspirado, Sinhozinho buscou treinamento de capoeira no Morro de Santo Antônio e na companhia de boêmios e malandros da Lapa—os bairros duros onde a arte sobrevivia apesar da proibição legal.

Na década de 1920, havia desenvolvido sua própria abordagem do que chamava de "Ginástica Brasileira (Capoeiragem)", demonstrando-a publicamente em 1920 em exibições dirigidas por Mário Aleixo e Raul Pederneiras. Diferente de Mestre Bimba na Bahia—que estava desenvolvendo um currículo sistematizado com cordas e sequências—Sinhozinho abordava o ensino de forma individualizada. Cada aluno recebia treinamento personalizado, e ele construía seus próprios equipamentos e ferramentas de treino.

Em 1930, abriu as primeiras academias formais de capoeira do Rio de Janeiro: uma no movimentado centro da cidade na Rua do Rosário nº 133, e outra na afluente Ipanema "para bons moços que aspiram à coragem". Suas academias mudaram-se por vários locais em Ipanema ao longo das décadas—Rua Redentor, Rua Almirante Saddock de Sá (o "Clube do Sinhozinho"), Avenida Vieira Souto, e outras. Diferente da maioria dos mestres que ensinavam em bairros de classe trabalhadora, Sinhozinho atendia as classes média e alta.

Sua filosofia de ensino priorizava o combate sobre a tradição. Eliminou completamente a música de berimbau e as rodas rituais, focando puramente na eficácia de luta. Modificou a ginga tradicional para assemelhar-se ao trabalho de pés do boxe. Incorporou projeções e técnicas de solo da luta greco-romana e judô. Treinou alunos com a navalha (chamada "sardinha" ou "Santo Cristo") e a bengala decorada ("Petrópolis"). Também preservou a tradicional roda de pernada—um antigo jogo carioca usando apenas chutes e golpes de desequilíbrio, jogado sem música.

Durante a ditadura Vargas, Sinhozinho serviu como instrutor de combate corpo a corpo para a temida Polícia Especial, treinando a polícia secreta do regime em combate aproximado. Ascendeu ao cargo de Oficial de Vigilância, aposentando-se entre 1937 e 1945. Suas conexões políticas lhe deram proteção e legitimidade numa época em que a capoeira ainda carregava o estigma da criminalidade.

Seus alunos conquistaram vitórias espetaculares que ganharam manchetes nacionais. Em fevereiro de 1949, lançou um desafio formal à escola de Capoeira Regional de Mestre Bimba, que estava em turnê por São Paulo. Os alunos de Bimba viajaram ao Rio de Janeiro para um evento de lutas de dois dias no Estádio Carioca em 2 e 7 de abril, organizado pela Federação Metropolitana de Pugilismo. Na primeira luta, o aluno de Sinhozinho, Luiz "Cirandinha" Pereira Aguiar, nocauteou o aluno de Bimba, Jurandir, no primeiro round com um chute no corpo. Na segunda luta, Rudolf Hermanny, de dezessete anos, derrotou o aluno Regional Fernando Rodrigues Perez em dois minutos, lesionando seu braço com um chute. Relatos dizem que o próprio Bimba ficou impressionado o suficiente para incorporar alguns movimentos que presenciou em seu próprio estilo.

Em 1953, Sinhozinho desafiou a família Gracie para um evento beneficente de vale tudo no estádio do Vasco da Gama em 17 de março. Seus lutadores foram novamente Hermanny e Cirandinha. Contra Guanair Gomes, Hermanny lutou por uma hora e dez minutos antes da luta ser declarada empate—com Hermanny parecendo mais fresco ao final. Na segunda luta, Carlson Gracie derrotou um exausto Cirandinha por interrupção do córner.

Seus alunos mais famosos tornaram-se campeões em múltiplas disciplinas: André Jansen, goleiro do Botafogo FC e considerado o melhor capoeirista de sua época; Rudolf de Otero Hermanny, que se tornou campeão de judô, educador físico e técnico da seleção brasileira de futebol da Copa do Mundo de 1966; Luiz "Cirandinha" Pereira Aguiar, halterofilista e "campeão brasileiro de capoeira"; Antonio Carlos "Tom" Jobim, o lendário músico da Bossa Nova; o presidente do Comitê Olímpico Sylvio de Magalhães Padilha; e Augusto Cordeiro, mestre de judô que serviu como seu consultor de combate.

Sinhozinho morreu em 1962 em Ipanema. Como nunca sistematizou seus métodos de ensino—recusando criar sequências padronizadas, sistemas de graduação ou pedagogia formalizada—seu estilo particular de capoeira carioca morreu com ele. Seus alunos sabiam lutar mas não conseguiam transmitir seu método para a próxima geração.

Seu legado vive em monumentos: uma estátua em Ipanema o homenageia, e uma rua na Ilha do Governador leva seu nome. Na história da capoeira, ele representa o caminho não tomado—uma abordagem focada em combate e individualizada que quase legitimou a capoeira como esporte antes da sistematização mais bem-sucedida de Bimba prevalecer.',
  -- achievements_en
  'Founded Rio de Janeiro''s first formal capoeira academies (1930); Hand-to-hand combat instructor for Getúlio Vargas''s Polícia Especial; His students defeated Mestre Bimba''s Regional students in the 1949 challenge at Estádio Carioca; Organized 1953 vale tudo challenge against the Gracie family; Trained numerous champions including judo champion Rudolf Hermanny, musician Tom Jobim, and Olympic Committee president Sylvio de Magalhães Padilha; Honored with statue in Ipanema; Street named after him in Ilha do Governador; Considered the main exponent of capoeira carioca and the mainstay of capoeira in Rio de Janeiro',
  -- achievements_pt
  'Fundou as primeiras academias formais de capoeira do Rio de Janeiro (1930); Instrutor de combate corpo a corpo da Polícia Especial de Getúlio Vargas; Seus alunos derrotaram os alunos da Regional de Mestre Bimba no desafio de 1949 no Estádio Carioca; Organizou desafio de vale tudo de 1953 contra a família Gracie; Treinou inúmeros campeões incluindo o campeão de judô Rudolf Hermanny, o músico Tom Jobim e o presidente do Comitê Olímpico Sylvio de Magalhães Padilha; Homenageado com estátua em Ipanema; Rua nomeada em sua homenagem na Ilha do Governador; Considerado o principal expoente da capoeira carioca e o baluarte da capoeira no Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH YEAR (1891): Confirmed by multiple sources including capoeirahistory.com, Wikipedia, and Brazilian newspaper archives. Born in Santos, São Paulo, to Lt. Col. José Moreira de Sampaio.

DEATH YEAR (1962): Year confirmed by multiple sources. Exact date unknown. Died in Ipanema, Rio de Janeiro.

NAME: Full name Agenor Moreira Sampaio. "Sinhozinho" means "Little Mister" - a nickname that may reference his well-to-do family background or his teaching role among the upper classes.

STYLE: Capoeira carioca was a distinct Rio de Janeiro variant, not formally Angola or Regional. It was more combat-focused, stripped of music and ritual. The style died with Sinhozinho because he never systematized his teaching.

TEACHERS:
- Learned capoeira informally at Santos docks (unknown teachers)
- Club Esperia, São Paulo (1904): Edú Chaves taught Greco-Roman wrestling, savate
- Club Força e Coragem, São Paulo (1907): Professor Pedro Pucceti
- Rio de Janeiro (1908+): José Floriano "Zeca" Peixoto (pernada/capoeira carioca)
- Morro de Santo Antônio: Informal training with malandros of Lapa
- 1920: Worked with Mário Aleixo on capoeiragem exhibitions

CYRIACO INFLUENCE: Sinhozinho attended the May 1, 1909 fight where Cyriaco defeated Sada Miyako. This directly inspired him to pursue capoeira training.

STUDENTS (documented):
- André Jansen (Botafogo goalkeeper, "best capoeirista of his era")
- Rudolf de Otero Hermanny (judo champion, 1966 World Cup football coach)
- Luiz "Cirandinha" Pereira Aguiar (weightlifter, "Brazilian capoeira champion")
- Antonio Carlos "Tom" Jobim (Bossa Nova musician)
- Augusto Cordeiro (judo master, combat consultant)
- Sylvio de Magalhães Padilha (Olympic Committee president)
- Eloy Dutra (governor of Guanabara)
- Reinaldo Lima, Paulo Paiva (wrestlers)
- Paulo Amaral, Paulo Azeredo (athletes)

CHALLENGE EVENTS:
- April 2-7, 1949: Capoeira Carioca vs Regional at Estádio Carioca (Carioca won both matches)
- October 30, 1935: André Jansen vs Ricardo Nibbon (Gracie student) in Salvador
- March 17, 1953: Vale tudo vs Gracie family at Vasco da Gama (1 draw, 1 loss)
- June 29, 1953: Hermanny vs Artur Emídio (Hermanny won by KO)

RELATIONSHIPS ACTIVE (see statements/persons/sinhozinho.sql):
- Sinhozinho influenced_by Cyriaco (witnessed 1909 fight)
- Sinhozinho trained_under Zeca Floriano (pernada/capoeira carioca)',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1891): Confirmado por múltiplas fontes incluindo capoeirahistory.com, Wikipedia e arquivos de jornais brasileiros. Nasceu em Santos, São Paulo, filho do Ten. Cel. José Moreira de Sampaio.

ANO DE MORTE (1962): Ano confirmado por múltiplas fontes. Data exata desconhecida. Morreu em Ipanema, Rio de Janeiro.

NOME: Nome completo Agenor Moreira Sampaio. "Sinhozinho" significa "Pequeno Senhor" - um apelido que pode referir-se à sua origem familiar abastada ou ao seu papel de ensino entre as classes altas.

ESTILO: Capoeira carioca era uma variante distinta do Rio de Janeiro, não formalmente Angola ou Regional. Era mais focada em combate, despojada de música e ritual. O estilo morreu com Sinhozinho porque ele nunca sistematizou seu ensino.

PROFESSORES:
- Aprendeu capoeira informalmente nas docas de Santos (professores desconhecidos)
- Club Esperia, São Paulo (1904): Edú Chaves ensinou luta greco-romana, savate
- Club Força e Coragem, São Paulo (1907): Professor Pedro Pucceti
- Rio de Janeiro (1908+): José Floriano "Zeca" Peixoto (pernada/capoeira carioca)
- Morro de Santo Antônio: Treinamento informal com malandros da Lapa
- 1920: Trabalhou com Mário Aleixo em exibições de capoeiragem

INFLUÊNCIA DE CYRIACO: Sinhozinho assistiu à luta de 1º de maio de 1909 onde Cyriaco derrotou Sada Miyako. Isso o inspirou diretamente a buscar treinamento de capoeira.

ALUNOS (documentados):
- André Jansen (goleiro do Botafogo, "melhor capoeirista de sua época")
- Rudolf de Otero Hermanny (campeão de judô, técnico da Copa do Mundo de 1966)
- Luiz "Cirandinha" Pereira Aguiar (halterofilista, "campeão brasileiro de capoeira")
- Antonio Carlos "Tom" Jobim (músico da Bossa Nova)
- Augusto Cordeiro (mestre de judô, consultor de combate)
- Sylvio de Magalhães Padilha (presidente do Comitê Olímpico)
- Eloy Dutra (governador da Guanabara)
- Reinaldo Lima, Paulo Paiva (lutadores)
- Paulo Amaral, Paulo Azeredo (atletas)

EVENTOS DE DESAFIO:
- 2-7 de abril de 1949: Capoeira Carioca vs Regional no Estádio Carioca (Carioca venceu ambas)
- 30 de outubro de 1935: André Jansen vs Ricardo Nibbon (aluno Gracie) em Salvador
- 17 de março de 1953: Vale tudo vs família Gracie no Vasco da Gama (1 empate, 1 derrota)
- 29 de junho de 1953: Hermanny vs Artur Emídio (Hermanny venceu por nocaute)

RELACIONAMENTOS PENDENTES:
- Sinhozinho influenced_by Cyriaco (presenciou luta de 1909)
- Nenhum professor principal claro de capoeira pode ser identificado; seu treinamento foi eclético
- Zeca Floriano ensinou-lhe pernada/capoeira carioca (declaração adicionada)'
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
