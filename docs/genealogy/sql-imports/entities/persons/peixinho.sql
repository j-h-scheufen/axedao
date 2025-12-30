-- ============================================================
-- GENEALOGY PERSON: Peixinho
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH DATE: December 20, 1947 (exact)
-- Sources: raridadesdacapoeira, capoeira.online, lalaue.com confirm
-- "20 de dezembro de 1947"
--
-- DEATH DATE: May 16, 2011 (exact)
-- Sources: Portal Capoeira obituary, raridadesdacapoeira confirm
-- death from cancer on May 16, 2011
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
  'Marcelo Azevedo Guimarães',
  'Peixinho',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeira.online/history/mestres/mestre-peixinho/',
    'https://sites.google.com/view/raridadesdacapoeira/mestre-peixinho',
    'https://www.lalaue.com/learn-capoeira/mestre-peixinho/',
    'https://portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-peixinho-senzala/',
    'https://www.gruposenzala.org/mestres-do-grupo.html',
    'https://www.senzala.org.br/historia-pb.html'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'One of the founding cordas vermelhas (red cords) of Grupo Senzala, which developed a systematic teaching methodology blending Capoeira Regional technique from Mestre Bimba''s lineage with elements of Capoeira Angola and carioca street traditions. Peixinho was instrumental in professionalizing capoeira and spreading it internationally. He was also an exceptional instrument maker—his berimbaus and atabaques were considered among the finest in the capoeira world, with a sound quality that has never been replicated.',
  E'Um dos cordas vermelhas fundadores do Grupo Senzala, que desenvolveu uma metodologia de ensino sistemática mesclando técnica da Capoeira Regional da linhagem de Mestre Bimba com elementos da Capoeira Angola e tradições cariocas de rua. Peixinho foi fundamental na profissionalização da capoeira e sua disseminação internacional. Também era um excepcional construtor de instrumentos—seus berimbaus e atabaques eram considerados entre os melhores do mundo da capoeira, com uma qualidade sonora que nunca foi replicada.',
  -- Life dates
  1947,
  'exact'::genealogy.date_precision,
  'Vitória, Espírito Santo, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- Extended content (bio_en)
  E'Marcelo Azevedo Guimarães, known as Mestre Peixinho, was born on December 20, 1947, in Vitória, capital of Espírito Santo, Brazil. He would become one of the most influential figures in modern capoeira—a master whose work spanned four continents and helped transform capoeira from a local Brazilian practice into a global phenomenon.

In 1964, Peixinho moved to Rio de Janeiro where he began practicing capoeira under Cláudio Danadinho, a young paraibano from Brasília who had trained with Mestre Arraia. The following year, 1965, he connected with brothers Paulo and Rafael Flores, Bahians who had studied with both Mestre Bimba and Mestre Pastinha in Salvador. Together with other young capoeiristas—Gato, Gil Velho, Garrincha, Itamar, Sorriso, and Preguiça—they formed the nucleus of what would become Grupo Senzala, training together on the terrace of the Flores brothers'' apartment in the Laranjeiras neighborhood.

In 1966, during a demonstration at a German Club, the group officially adopted the name "Grupo Senzala"—a reference to the slave quarters where enslaved Africans were held, connecting their art to Brazil''s history of resistance. The following year, Peixinho began teaching and the group entered the prestigious Berimbau de Ouro tournament. To everyone''s surprise, they won—and repeated the victory in 1968 and 1969, permanently claiming the trophy and establishing Senzala''s reputation nationwide.

Peixinho and Itamar recognized an opportunity. Seeing the success of their collective work, they decided to rent a space in Travessa Angrense in Copacabana. In 1974, Peixinho opened his famous academy there—a space that would become legendary in capoeira history. For 22 years, the Travessa Angrense served as the headquarters of Centro Cultural Senzala, where "many bambas passed through and were trained". It was there that Mestre Elias first discovered Senzala in 1976, immediately beginning training under Mestres Peixinho and Itamar. Elias would go on to receive his corda vermelha in 1990 and spearhead capoeira''s expansion in France.

That same year, 1974, Peixinho was formally recognized as Mestre—the highest title in capoeira.

Beyond teaching, Peixinho pursued formal education. He graduated in Physical Education from the Federal University of Rio de Janeiro (UFRJ) in the late 1970s, having previously studied Administration. He taught capoeira at UFRJ from 1973 to 1980 and at UERJ (State University of Rio de Janeiro) from 1979 to 1983, bringing academic legitimacy to the art.

Peixinho also brought capoeira to the stage. In 1969, he performed at the prestigious Sala Cecília Meireles, and in 1971 at the Teatro Municipal—Rio de Janeiro''s most important cultural venues. In 1977, he participated in an international festival on the Île de Réunion, a French territory in the Indian Ocean.

In 1987, Peixinho became a pioneer of capoeira''s international expansion. Along with Mestres Garrincha, Sorriso, and Toni Vargas, he spent six months in Europe, organizing workshops and the First European Capoeira Encounter in Paris—the first of its kind. From 1990 onward, he organized the Scandinavian Capoeira Encounters, establishing a framework for the art''s systematic growth across Northern Europe.

By the end of his career, Peixinho coordinated an extensive network of professors who taught in various Brazilian cities (including Belo Horizonte, São Paulo, Porto Alegre, and Curitiba) and across European, North American, and Australasian locations. He trained numerous mestres who carry his lineage today, including Mestre Marrom (who received his red cord from Peixinho and founded Ngoma Capoeira Angola), Mestre Elias (who leads Senzala in Strasbourg), Mestre Arruda, and Mestre Chão.

Peixinho was also renowned as an exceptional instrument maker. He crafted berimbaus and atabaques with a sound and quality that musicians and masters worldwide sought. According to those who knew him, no one has since succeeded in replicating the quality of his instruments.

As a composer, Peixinho authored the song "Princesa Isabel", adding to capoeira''s musical corpus.

Mestre Acordeon described Peixinho as possessing "exemplary simplicity", noting that he "refined his art to speak little, an energy quiet but always present". Despite his exceptional technique and speed—he was known for his ability to anticipate his opponent''s moves—Peixinho avoided violence and made no enemies.

In his final years, Peixinho fought a long battle against cancer. He passed away in the early morning of May 16, 2011, in Rio de Janeiro. The news of his death sent shockwaves through the capoeira world, separating master from student, friend from friend, brother from brother.

Today, Grupo Senzala commemorates his legacy through the "Iê Viva Meu Mestre" event, held every two years in his honor. Peixinho is remembered as one of the founders of Grupo Senzala, a reference for capoeiristas worldwide, and the mestre who did "the most significant work" within the organization that revolutionized capoeira teaching.',
  -- Extended content (bio_pt)
  E'Marcelo Azevedo Guimarães, conhecido como Mestre Peixinho, nasceu em 20 de dezembro de 1947, em Vitória, capital do Espírito Santo, Brasil. Ele se tornaria uma das figuras mais influentes da capoeira moderna—um mestre cujo trabalho abrangeu quatro continentes e ajudou a transformar a capoeira de uma prática local brasileira em um fenômeno global.

Em 1964, Peixinho mudou-se para o Rio de Janeiro onde começou a praticar capoeira com Cláudio Danadinho, um jovem paraibano de Brasília que havia treinado com Mestre Arraia. No ano seguinte, 1965, conectou-se com os irmãos Paulo e Rafael Flores, baianos que haviam estudado tanto com Mestre Bimba quanto com Mestre Pastinha em Salvador. Junto com outros jovens capoeiristas—Gato, Gil Velho, Garrincha, Itamar, Sorriso e Preguiça—formaram o núcleo do que se tornaria o Grupo Senzala, treinando juntos no terraço do apartamento dos irmãos Flores no bairro de Laranjeiras.

Em 1966, durante uma apresentação em um Clube Alemão, o grupo oficialmente adotou o nome "Grupo Senzala"—uma referência às senzalas onde africanos escravizados eram mantidos, conectando sua arte à história de resistência do Brasil. No ano seguinte, Peixinho começou a ensinar e o grupo entrou no prestigioso torneio Berimbau de Ouro. Para surpresa de todos, eles venceram—e repetiram a vitória em 1968 e 1969, conquistando permanentemente o troféu e estabelecendo a reputação da Senzala nacionalmente.

Peixinho e Itamar reconheceram uma oportunidade. Vendo o sucesso de seu trabalho coletivo, decidiram alugar um espaço na Travessa Angrense em Copacabana. Em 1974, Peixinho abriu sua famosa academia lá—um espaço que se tornaria lendário na história da capoeira. Por 22 anos, a Travessa Angrense serviu como sede do Centro Cultural Senzala, onde "muitos bambas passaram e foram treinados". Foi lá que Mestre Elias descobriu a Senzala pela primeira vez em 1976, começando imediatamente a treinar com os Mestres Peixinho e Itamar. Elias receberia sua corda vermelha em 1990 e lideraria a expansão da capoeira na França.

Nesse mesmo ano, 1974, Peixinho foi formalmente reconhecido como Mestre—o mais alto título na capoeira.

Além de ensinar, Peixinho buscou educação formal. Graduou-se em Educação Física pela Universidade Federal do Rio de Janeiro (UFRJ) no final dos anos 1970, tendo anteriormente estudado Administração. Ensinou capoeira na UFRJ de 1973 a 1980 e na UERJ (Universidade do Estado do Rio de Janeiro) de 1979 a 1983, trazendo legitimidade acadêmica à arte.

Peixinho também levou a capoeira aos palcos. Em 1969, apresentou-se na prestigiosa Sala Cecília Meireles, e em 1971 no Teatro Municipal—os mais importantes espaços culturais do Rio de Janeiro. Em 1977, participou de um festival internacional na Ilha de Reunião, território francês no Oceano Índico.

Em 1987, Peixinho tornou-se pioneiro da expansão internacional da capoeira. Junto com os Mestres Garrincha, Sorriso e Toni Vargas, passou seis meses na Europa, organizando workshops e o Primeiro Encontro Europeu de Capoeira em Paris—o primeiro do tipo. A partir de 1990, organizou os Encontros Escandinavos de Capoeira, estabelecendo uma estrutura para o crescimento sistemático da arte no Norte da Europa.

Ao final de sua carreira, Peixinho coordenava uma extensa rede de professores que ensinavam em várias cidades brasileiras (incluindo Belo Horizonte, São Paulo, Porto Alegre e Curitiba) e em locais da Europa, América do Norte e Australásia. Treinou numerosos mestres que carregam sua linhagem hoje, incluindo Mestre Marrom (que recebeu sua corda vermelha de Peixinho e fundou a Ngoma Capoeira Angola), Mestre Elias (que lidera a Senzala em Estrasburgo), Mestre Arruda e Mestre Chão.

Peixinho também era renomado como excepcional construtor de instrumentos. Fabricava berimbaus e atabaques com um som e qualidade que músicos e mestres do mundo todo procuravam. Segundo aqueles que o conheceram, ninguém conseguiu replicar a qualidade de seus instrumentos.

Como compositor, Peixinho foi autor da canção "Princesa Isabel", adicionando ao corpus musical da capoeira.

Mestre Acordeon descreveu Peixinho como possuidor de "simplicidade exemplar", notando que ele "refinou sua arte para falar pouco, uma energia quieta mas sempre presente". Apesar de sua técnica excepcional e velocidade—era conhecido por sua capacidade de antecipar os movimentos do oponente—Peixinho evitava violência e não fez inimigos.

Em seus últimos anos, Peixinho lutou uma longa batalha contra o câncer. Faleceu na madrugada de 16 de maio de 2011, no Rio de Janeiro. A notícia de sua morte causou ondas de choque pelo mundo da capoeira, separando mestre de aluno, amigo de amigo, irmão de irmão.

Hoje, o Grupo Senzala comemora seu legado através do evento "Iê Viva Meu Mestre", realizado a cada dois anos em sua homenagem. Peixinho é lembrado como um dos fundadores do Grupo Senzala, uma referência para capoeiristas do mundo todo, e o mestre que fez "o trabalho mais significativo" dentro da organização que revolucionou o ensino da capoeira.',
  -- Achievements
  E'- Co-founder of Grupo Senzala (1965, formally named 1966)
- Won Berimbau de Ouro tournament three consecutive years (1967, 1968, 1969) - trophy permanently claimed
- Opened famous academy at Travessa Angrense, Copacabana (1974) - headquarters for 22 years
- Recognized as Mestre (1974)
- Graduate in Physical Education from UFRJ (late 1970s)
- Taught capoeira at UFRJ (1973-1980) and UERJ (1979-1983)
- Performed at Sala Cecília Meireles (1969) and Teatro Municipal (1971)
- International Festival at Île de Réunion (1977)
- Organized First European Capoeira Encounter in Paris (1987)
- Organized Scandinavian Capoeira Encounters (from 1990)
- Coordinated capoeira teachers across Brazil, Europe, North America, and Australasia
- Renowned instrument maker (berimbaus, atabaques) - considered among finest in capoeira world
- Composer of "Princesa Isabel"
- Trained multiple mestres including Marrom, Elias, Arruda, Chão',
  E'- Co-fundador do Grupo Senzala (1965, formalmente nomeado 1966)
- Venceu o torneio Berimbau de Ouro três anos consecutivos (1967, 1968, 1969) - troféu conquistado permanentemente
- Abriu famosa academia na Travessa Angrense, Copacabana (1974) - sede por 22 anos
- Reconhecido como Mestre (1974)
- Graduado em Educação Física pela UFRJ (final dos anos 1970)
- Ensinou capoeira na UFRJ (1973-1980) e UERJ (1979-1983)
- Apresentou-se na Sala Cecília Meireles (1969) e Teatro Municipal (1971)
- Festival Internacional na Ilha de Reunião (1977)
- Organizou o Primeiro Encontro Europeu de Capoeira em Paris (1987)
- Organizou Encontros Escandinavos de Capoeira (a partir de 1990)
- Coordenou professores de capoeira em Brasil, Europa, América do Norte e Australásia
- Renomado construtor de instrumentos (berimbaus, atabaques) - considerado entre os melhores do mundo da capoeira
- Compositor de "Princesa Isabel"
- Treinou múltiplos mestres incluindo Marrom, Elias, Arruda, Chão',
  -- Researcher notes (notes_en)
  E'BIRTH DATE (1947-12-20, exact):
Multiple sources confirm December 20, 1947 in Vitória, Espírito Santo:
- raridadesdacapoeira: "20 de dezembro de 1947"
- capoeira.online: "December 20, 1947"
- lalaue.com: corroborates 1947, Vitória

DEATH DATE (2011-05-16, exact):
Multiple sources confirm May 16, 2011 from cancer:
- Portal Capoeira obituary: "faleceu no dia 16 de maio de 2011"
- raridadesdacapoeira: "16 de maio de 2011"
- senzala.dk: death confirmed

TEACHERS:
- Cláudio Danadinho (1964) - first instructor in Rio de Janeiro
- Paulo Flores (1965 onward) - primary teacher, co-founder of Senzala
- Rafael Flores (1965 onward) - with brother Paulo, trained at Bimba''s and Pastinha''s

STUDENTS (confirmed):
- Mestre Marrom (Rio de Janeiro) - received corda vermelha from Peixinho; founded Ngoma Capoeira Angola
- Mestre Elias - began training 1976 at Travessa Angrense; corda vermelha 1990; leads Senzala Strasbourg
- Mestre Arruda - trained by Peixinho; in turn trained Mestre Chão
- Mestre Chão - trained via Arruda lineage; received corda vermelha Aug 5, 2012
- Mestre China - early European student

FOUNDING SENZALA RED CORDS:
Paulo Flores, Rafael Flores (†2016), Gilberto Flores, Gato, Gil Velho, Garrincha, Itamar, Peixinho (†2011), Claudio Danadinho, Preguiça, Sorriso
Later additions: Mosquito, Borracha, Nestor Capoeira, Bermuda, others
Historical total: 34 red cords (17 currently active)

TRAVESSA ANGRENSE ACADEMY:
- Opened 1974 by Peixinho and Itamar
- Located in Copacabana, Rio de Janeiro
- Operated for 22 years (until ~1996)
- Centro Cultural Senzala headquarters
- Where Mestre Elias first discovered Senzala (1976)

BERIMBAU DE OURO:
- 1967: Won (represented Senzala)
- 1968: Won again
- 1969: Won third consecutive year - trophy permanently claimed for Senzala

INTERNATIONAL EXPANSION TIMELINE:
- 1977: Île de Réunion festival
- 1987: First European Capoeira Encounter (Paris) - organized by Peixinho, Garrincha, Sorriso, Toni Vargas
- 1990+: Scandinavian Capoeira Encounters (organized by Peixinho)

MEDIA APPEARANCES:
- 1969: Performance at Sala Cecília Meireles, Rio de Janeiro
- 1971: Performance at Teatro Municipal, Rio de Janeiro

INSTRUMENT MAKING:
Peixinho was renowned for crafting berimbaus and atabaques of exceptional quality.
Per senzala-london.co.uk: "one of the absolute best instrument makers in the capoeira world"
Sources note "no one has since succeeded in imitating" his sound quality.

COMPOSITIONS:
- "Princesa Isabel" (song)

ACADEMIC CAREER:
- Studied Administration before switching to Physical Education
- Graduated in Physical Education from UFRJ (late 1970s)
- Taught at UFRJ (1973-1980)
- Taught at UERJ (1979-1983)

CHARACTER DESCRIPTION (per Mestre Acordeon):
"Exemplary simplicity and refined his art to speak little, an energy quiet but always present".
Known for exceptional technique, speed, and ability to anticipate moves.
Avoided violence; made no enemies.

MEMORIAL EVENT:
"Iê Viva Meu Mestre" - held every two years by Grupo Senzala in Peixinho''s honor',
  E'DATA DE NASCIMENTO (1947-12-20, exato):
Múltiplas fontes confirmam 20 de dezembro de 1947 em Vitória, Espírito Santo:
- raridadesdacapoeira: "20 de dezembro de 1947"
- capoeira.online: "December 20, 1947"
- lalaue.com: corrobora 1947, Vitória

DATA DE FALECIMENTO (2011-05-16, exato):
Múltiplas fontes confirmam 16 de maio de 2011 por câncer:
- Obituário Portal Capoeira: "faleceu no dia 16 de maio de 2011"
- raridadesdacapoeira: "16 de maio de 2011"
- senzala.dk: morte confirmada

MESTRES:
- Cláudio Danadinho (1964) - primeiro instrutor no Rio de Janeiro
- Paulo Flores (1965 em diante) - professor principal, co-fundador da Senzala
- Rafael Flores (1965 em diante) - com irmão Paulo, treinaram com Bimba e Pastinha

ALUNOS (confirmados):
- Mestre Marrom (Rio de Janeiro) - recebeu corda vermelha de Peixinho; fundou Ngoma Capoeira Angola
- Mestre Elias - começou a treinar 1976 na Travessa Angrense; corda vermelha 1990; lidera Senzala Estrasburgo
- Mestre Arruda - treinado por Peixinho; por sua vez treinou Mestre Chão
- Mestre Chão - treinado via linhagem Arruda; recebeu corda vermelha 5 de agosto de 2012
- Mestre China - aluno europeu inicial

CORDAS VERMELHAS FUNDADORES DA SENZALA:
Paulo Flores, Rafael Flores (†2016), Gilberto Flores, Gato, Gil Velho, Garrincha, Itamar, Peixinho (†2011), Claudio Danadinho, Preguiça, Sorriso
Adições posteriores: Mosquito, Borracha, Nestor Capoeira, Bermuda, outros
Total histórico: 34 cordas vermelhas (17 atualmente ativos)

ACADEMIA TRAVESSA ANGRENSE:
- Aberta 1974 por Peixinho e Itamar
- Localizada em Copacabana, Rio de Janeiro
- Operou por 22 anos (até ~1996)
- Sede do Centro Cultural Senzala
- Onde Mestre Elias descobriu a Senzala pela primeira vez (1976)

BERIMBAU DE OURO:
- 1967: Venceu (representou Senzala)
- 1968: Venceu novamente
- 1969: Venceu terceiro ano consecutivo - troféu permanentemente conquistado para Senzala

CRONOLOGIA EXPANSÃO INTERNACIONAL:
- 1977: Festival Ilha de Reunião
- 1987: Primeiro Encontro Europeu de Capoeira (Paris) - organizado por Peixinho, Garrincha, Sorriso, Toni Vargas
- 1990+: Encontros Escandinavos de Capoeira (organizados por Peixinho)

APARIÇÕES NA MÍDIA:
- 1969: Apresentação na Sala Cecília Meireles, Rio de Janeiro
- 1971: Apresentação no Teatro Municipal, Rio de Janeiro

CONSTRUÇÃO DE INSTRUMENTOS:
Peixinho era renomado por fabricar berimbaus e atabaques de qualidade excepcional.
Conforme senzala-london.co.uk: "um dos melhores construtores de instrumentos do mundo da capoeira"
Fontes notam que "ninguém conseguiu imitar" sua qualidade sonora.

COMPOSIÇÕES:
- "Princesa Isabel" (canção)

CARREIRA ACADÊMICA:
- Estudou Administração antes de mudar para Educação Física
- Graduou-se em Educação Física pela UFRJ (final dos anos 1970)
- Ensinou na UFRJ (1973-1980)
- Ensinou na UERJ (1979-1983)

DESCRIÇÃO DE CARÁTER (conforme Mestre Acordeon):
"Simplicidade exemplar e refinou sua arte para falar pouco, uma energia quieta mas sempre presente".
Conhecido por técnica excepcional, velocidade e capacidade de antecipar movimentos.
Evitava violência; não fez inimigos.

EVENTO MEMORIAL:
"Iê Viva Meu Mestre" - realizado a cada dois anos pelo Grupo Senzala em homenagem a Peixinho'
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
