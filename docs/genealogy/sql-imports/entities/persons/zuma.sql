-- ============================================================
-- GENEALOGY PERSON: Zuma
-- Generated: 2025-12-20
-- ============================================================
-- BIRTH: November 25, 1898 (verified via André Luis Lacé Lopes)
-- DEATH: August 18, 1965 (Jornal do Brasil obituary notice)
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Anníbal Zumalacaraguhy de Menck Burlamaqui',
  'Zuma',
  NULL,  -- No formal capoeira title; intellectual advocate
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-zuma-1898-1965/',
    'https://en.wikipedia.org/wiki/Anibal_Burlamaqui',
    'https://archive.org/details/anibal-burlamaqui-a-ginastica-nacional-capoeiragem-metodizada-e-regrada'
  ]::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'Zuma developed a sport-oriented "ginástica nacional" (national gymnastics)—a combat-focused capoeira variant stripped of music and ritual. His 1928 manual prescribed boxing-like rules for ring competition: three-minute rounds with two-minute rest periods, circular playing field, referee-based point system, boxing shorts and ankle boots. He advocated an upright "noble" guard posture rather than the crouched ginga. He claimed to have invented three kicks: queixada (kick to the chin), passo de cegonha (stork step—defender grabs attacker''s raised leg while sweeping standing leg), and espada (sword kick). His techniques emphasized pentear/peneirar (combing/sifting—confusing opponents through constant movement), continuous weight shifting between feet and hands, and hand-ground contact for support during leg sweeps.',
  E'Zuma desenvolveu uma "ginástica nacional" orientada ao esporte—uma variante de capoeira focada em combate, despojada de música e ritual. Seu manual de 1928 prescrevia regras similares ao boxe para competição de ringue: rounds de três minutos com períodos de descanso de dois minutos, campo de jogo circular, sistema de pontuação por árbitro, shorts de boxe e botas até o tornozelo. Ele defendia uma postura de guarda "nobre" ereta ao invés da ginga agachada. Alegou ter inventado três chutes: queixada (chute no queixo), passo de cegonha (defensor agarra a perna levantada do atacante enquanto varre a perna de apoio), e espada (chute espada). Suas técnicas enfatizavam pentear/peneirar (confundir oponentes através de movimento constante), transferência contínua de peso entre pés e mãos, e contato mão-chão para apoio durante rasteiras.',
  -- Life dates
  1898,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  1965,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Anníbal Zumalacaraguhy de Menck Burlamaqui was born on November 25, 1898. His unusual middle name "Zumalacaraguhy"—from which his apelido "Zuma" derived—is of Basque origin, a surname meaning "willow valley." Since the age of ten, Anníbal had practiced Swedish gymnastics, weightlifting, and horizontal bar training. At eighteen he learned Greco-Roman wrestling, and later trained boxing "with fair constancy." Newspaper references from April 1920 describe him as "capoeira and boxeur."

Burlamaqui worked as a customs enforcement officer (guarda da polícia aduaneira), eventually rising to tax auditor at the Receita Federal (Brazilian revenue service). He lived in the Copacabana neighborhood of Rio de Janeiro.

In 1928, Zuma published "Gymnástica Nacional (capoeiragem) methodisada e regrada" (National Gymnastics [Capoeiragem] Methodized and Regulated)—the first written methodology for capoeira. The booklet was inspired by the capoeira of Lapa neighborhood and by the earlier booklet "Gymnastica Brazileira" (1904). His goal was clear: to remove the stigma from capoeiragem and legitimize it as Brazil''s national sport, capable of producing strong, brave citizens.

Dr. Mário Santos, a lawyer who wrote the manual''s preface, posed as Zuma''s opponent in twenty photographs illustrating the techniques. In the preface, Santos argued: "Why would capoeiragem, in Brazil, escape the evolutionary march of its sister forms? Why should we not create rules and regenerate capoeiragem?" He proclaimed capoeiragem superior to boxing, Roman wrestling, and Japanese fighting because it united the requirements of all these disciplines "plus intelligence and vivacity."

The manual catalogued 31 movements including: guarda, rasteira, rabo de arraia, corta capim, cabeçada, facão, banda de frente, banda amarrada, banda jogada, banda forçada, rapa, bahu, tesoura, baiana, dourado, queixada, passo de cegonha, encruzilhada, escorrão, pentear ou peneirar, tombo de ladeira ou calco, arrastão, tranco, chincha, xulipa, me esquece, vôo do morcego, espada, and suicídio. Zuma asserted that three kicks were his own inventions: queixada, passo de cegonha, and espada.

Drawing from boxing and football, Zuma prescribed the diameter of the circular playing field, starting positions, round duration (three minutes, with two-minute rest), and victory criteria: incapacitating the opponent, or a referee-counted point system based on falls caused.

Beyond capoeira, Burlamaqui pursued literary interests. On March 8, 1930, he joined the Cenáculo Fluminense de História e Letras (Rio de Janeiro''s State Society of History and Letters), a Niterói-based literary society, occupying chair number 33. In the 1950s he served on the directorial board''s committee on writing and peer review, and was elected president of the society twice. The Cenáculo hosted poetry readings and music recitals, and sponsored publications by its members.

In 1939, the Cenáculo published Burlamaqui''s book of erotic poetry, "O meu delírio: poêma do instinto" (My delirium: a poem of instinct). The book received a mixed review in the Jornal do Brasil (April 14, 1939) and a scathing review from critic Álvaro Lins in Correio da Manhã (November 16, 1940). He also published a second poetry collection titled "Babel de Emoções."

In 1933, through Zuma''s intervention, the Departamento de Luta Brasileira (Capoeiragem) of the Federação Carioca de Boxe was founded on November 5—an early step in the institutionalization of capoeira as a regulated sport. Three years later, on November 4, 1936, the Departamento de Luta Brasileira of the Federação Paulista de Pugilismo followed in São Paulo.

That same year, 1936, Mestre Bimba issued his famous challenge to fighters of any martial art style. The matches were fought under Zuma''s boxing-like rules. Bimba faced four opponents—Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, and fellow capoeirista José Custódio "Zé I" dos Santos—and won all matches, earning the nickname "Três Pancadas" (Three Hits).

Mestre Bimba is documented to have studied the methods of several Rio de Janeiro capoeira teachers including Sinhozinho, Mário Aleixo, and Zuma, who mixed capoeira with martial arts like judo, boxing, Greco-Roman wrestling, and Portuguese stick-fighting. Zuma''s codification influenced others who sought to transform capoeira into a socially acceptable sport.

The 1930s saw Bahian capoeiristas reaching out to Zuma. According to Dr. Lamartine Pereira da Costa (Admiral and physical education professor who met Zuma in his final years), Baianos sought Zuma out in the 1930s, recognizing his contribution to their cause.

Zuma''s work had direct influence on Federal Decree 3,199/41, enacted by President Getúlio Vargas on April 14, 1941, which established the bases of sport organization throughout Brazil and created the National Sports Council. Under this framework, the National Department of Brazilian Wrestling (Capoeiragem) was placed under the Brazilian Boxing Federation.

Anníbal Burlamaqui died on August 18, 1965, at age 67. The Jornal do Brasil published a notice where Mrs. Burlamaqui and family expressed gratitude for condolences received. His legacy as the "Patron of Sporting Capoeira" (Patrono da Capoeira Desportiva) endures—he was among the educated Brazilians who fought to destigmatize capoeira and promote it as a national sport.',
  -- bio_pt
  E'Anníbal Zumalacaraguhy de Menck Burlamaqui nasceu em 25 de novembro de 1898. Seu incomum nome do meio "Zumalacaraguhy"—do qual derivou seu apelido "Zuma"—é de origem basca, um sobrenome que significa "vale de salgueiros." Desde os dez anos, Anníbal praticava ginástica sueca, musculação e treinamento em barras horizontais. Aos dezoito anos aprendeu luta greco-romana, e depois treinou boxe "com justa constância." Referências em jornais de abril de 1920 o descrevem como "capoeira e boxeur."

Burlamaqui trabalhou como guarda da polícia aduaneira, eventualmente ascendendo a auditor fiscal na Receita Federal. Morava no bairro de Copacabana no Rio de Janeiro.

Em 1928, Zuma publicou "Gymnástica Nacional (capoeiragem) methodisada e regrada"—a primeira metodologia escrita para capoeira. O livreto foi inspirado pela capoeira do bairro da Lapa e pelo livreto anterior "Gymnastica Brazileira" (1904). Seu objetivo era claro: remover o estigma da capoeiragem e legitimá-la como esporte nacional do Brasil, capaz de produzir cidadãos fortes e corajosos.

Dr. Mário Santos, um advogado que escreveu o prefácio do manual, posou como oponente de Zuma em vinte fotografias ilustrando as técnicas. No prefácio, Santos argumentou: "Por que a capoeiragem, no Brasil, escaparia à marcha evolutiva de suas formas irmãs? Por que não deveríamos criar regras e regenerar a capoeiragem?" Ele proclamou a capoeiragem superior ao boxe, luta romana e luta japonesa porque unia os requisitos de todas essas disciplinas "além de inteligência e vivacidade."

O manual catalogou 31 movimentos incluindo: guarda, rasteira, rabo de arraia, corta capim, cabeçada, facão, banda de frente, banda amarrada, banda jogada, banda forçada, rapa, bahu, tesoura, baiana, dourado, queixada, passo de cegonha, encruzilhada, escorrão, pentear ou peneirar, tombo de ladeira ou calco, arrastão, tranco, chincha, xulipa, me esquece, vôo do morcego, espada e suicídio. Zuma afirmou que três chutes eram suas próprias invenções: queixada, passo de cegonha e espada.

Inspirando-se no boxe e futebol, Zuma prescreveu o diâmetro do campo de jogo circular, posições iniciais, duração dos rounds (três minutos, com dois minutos de descanso), e critérios de vitória: incapacitar o oponente, ou sistema de pontuação por árbitro baseado em quedas causadas.

Além da capoeira, Burlamaqui cultivou interesses literários. Em 8 de março de 1930, ingressou no Cenáculo Fluminense de História e Letras, uma sociedade literária baseada em Niterói, ocupando a cadeira número 33. Nos anos 1950 serviu no conselho diretor no comitê de redação e parecer, e foi eleito presidente da sociedade duas vezes. O Cenáculo promovia leituras de poesia e recitais musicais, e patrocinava publicações de seus membros.

Em 1939, o Cenáculo publicou o livro de poesia erótica de Burlamaqui, "O meu delírio: poêma do instinto." O livro recebeu uma crítica mista no Jornal do Brasil (14 de abril de 1939) e uma crítica severa do crítico Álvaro Lins no Correio da Manhã (16 de novembro de 1940). Ele também publicou uma segunda coleção de poesia intitulada "Babel de Emoções."

Em 1933, através da intervenção de Zuma, o Departamento de Luta Brasileira (Capoeiragem) da Federação Carioca de Boxe foi fundado em 5 de novembro—um passo inicial na institucionalização da capoeira como esporte regulamentado. Três anos depois, em 4 de novembro de 1936, o Departamento de Luta Brasileira da Federação Paulista de Pugilismo foi criado em São Paulo.

Nesse mesmo ano, 1936, Mestre Bimba lançou seu famoso desafio a lutadores de qualquer estilo de arte marcial. As lutas foram disputadas sob as regras similares ao boxe de Zuma. Bimba enfrentou quatro oponentes—Henrique Bahia, Vítor Benedito Lopes, Américo Ciência e o capoeirista José Custódio "Zé I" dos Santos—e venceu todas as lutas, ganhando o apelido "Três Pancadas."

Mestre Bimba está documentado como tendo estudado os métodos de vários professores de capoeira do Rio de Janeiro incluindo Sinhozinho, Mário Aleixo e Zuma, que misturavam capoeira com artes marciais como judô, boxe, luta greco-romana e jogo do pau português. A codificação de Zuma influenciou outros que buscavam transformar a capoeira em um esporte socialmente aceitável.

Os anos 1930 viram capoeiristas baianos procurando Zuma. Segundo Dr. Lamartine Pereira da Costa (Almirante e professor de educação física que conheceu Zuma em seus últimos anos), baianos procuraram Zuma nos anos 1930, reconhecendo sua contribuição à causa deles.

O trabalho de Zuma teve influência direta no Decreto Federal 3.199/41, promulgado pelo Presidente Getúlio Vargas em 14 de abril de 1941, que estabeleceu as bases da organização esportiva em todo o Brasil e criou o Conselho Nacional de Desportos. Sob esta estrutura, o Departamento Nacional de Luta Brasileira (Capoeiragem) foi colocado sob a Confederação Brasileira de Pugilismo.

Anníbal Burlamaqui morreu em 18 de agosto de 1965, aos 67 anos. O Jornal do Brasil publicou uma nota onde a Sra. Burlamaqui e família expressaram gratidão pelas condolências recebidas. Seu legado como "Patrono da Capoeira Desportiva" perdura—ele estava entre os brasileiros educados que lutaram para destigmatizar a capoeira e promovê-la como esporte nacional.',
  -- achievements_en
  E'Published first capoeira manual "Gymnástica Nacional (capoeiragem) methodisada e regrada" (1928); Created boxing-like competition rules used in Mestre Bimba''s 1936 challenge matches; Founded Departamento de Luta Brasileira (Capoeiragem) of Federação Carioca de Boxe (November 5, 1933); Influenced Federal Decree 3,199/41 creating National Department of Brazilian Wrestling; Twice-elected president of Cenáculo Fluminense de História e Letras; Published poetry collections including "O meu delírio: poêma do instinto" (1939) and "Babel de Emoções"; Known as "Patrono da Capoeira Desportiva" (Patron of Sporting Capoeira)',
  -- achievements_pt
  E'Publicou primeiro manual de capoeira "Gymnástica Nacional (capoeiragem) methodisada e regrada" (1928); Criou regras de competição similares ao boxe usadas nas lutas de desafio de Mestre Bimba em 1936; Fundou Departamento de Luta Brasileira (Capoeiragem) da Federação Carioca de Boxe (5 de novembro de 1933); Influenciou o Decreto Federal 3.199/41 criando Departamento Nacional de Luta Brasileira; Duas vezes eleito presidente do Cenáculo Fluminense de História e Letras; Publicou coleções de poesia incluindo "O meu delírio: poêma do instinto" (1939) e "Babel de Emoções"; Conhecido como "Patrono da Capoeira Desportiva"',
  -- notes_en
  E'BIRTH DATE (November 25, 1898):
Verified via André Luis Lacé Lopes personal communication (June 19, 2020) cited in capoeirahistory.com.

DEATH DATE (August 18, 1965):
Jornal do Brasil published obituary notice with family gratitude for condolences received.

FULL NAME:
Anníbal Zumalacaraguhy de Menck Burlamaqui. "Zumalacaraguhy" is Basque (meaning "willow valley")—origin of nickname "Zuma."

OCCUPATION:
- Guarda da polícia aduaneira (customs enforcement officer)
- Rose to tax auditor at Receita Federal
- Resided in Copacabana, Rio de Janeiro

LITERARY CAREER:
- Cenáculo Fluminense de História e Letras (joined March 8, 1930, Chair 33)
- President of society twice (1950s)
- "O meu delírio: poêma do instinto" (1939) - erotic poetry
- "Babel de Emoções" - second poetry collection
- Reviews: Jornal do Brasil (mixed, April 14, 1939); Correio da Manhã (scathing, Álvaro Lins, November 16, 1940)

CAPOEIRA MANUAL (1928):
Title: "Gymnástica Nacional (capoeiragem) methodisada e regrada"
Preface by: Dr. Mário Santos (lawyer, posed in 20 photographs)
Inspiration: Capoeira of Lapa; "Gymnastica Brazileira" (1904)
31 movements catalogued (see style_notes)
3 claimed inventions: queixada, passo de cegonha, espada

TRAINING BACKGROUND:
- Swedish gymnastics, weightlifting, horizontal bars (age 10+)
- Greco-Roman wrestling (age 18)
- Boxing "with fair constancy"
- Newspaper (April 1920) describes him as "capoeira and boxeur"
- May have trained at Gymnástico Português where Mario Aleixo taught (1920)

INSTITUTIONAL LEGACY:
- Departamento de Luta Brasileira, Federação Carioca de Boxe (Nov 5, 1933)
- Departamento de Luta Brasileira, Federação Paulista de Pugilismo (Nov 4, 1936)
- Influenced Federal Decree 3,199/41 (April 14, 1941)

CONNECTION TO BIMBA''S 1936 CHALLENGES:
Bimba''s challenge matches were fought under Zuma''s boxing-like rules.
Opponents: Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, José Custódio "Zé I" dos Santos
Bimba won all four, earning nickname "Três Pancadas" (Three Hits).

BIMBA''S STUDY OF ZUMA''S METHODS:
Documented that Bimba studied methods of Sinhozinho, Mario Aleixo, and Zuma.

CONTEMPORARIES:
- Raul Pederneiras (journalist/cartoonist, capoeira advocate)
- Mário Santos (lawyer, manual collaborator)
- Mario Aleixo (capoeira teacher, 1920s exhibitions)
- Mestre Sinhozinho (fellow Rio capoeira intellectual)

FAMILY:
- Wife: Mrs. Burlamaqui (published gratitude notice in Jornal do Brasil, Aug 18, 1965)
- Family historian: Ulysses Petronio Burlamaqui (personal communication June 19, 2020)

NO FORMAL CAPOEIRA TITLE:
Zuma was an intellectual advocate and practitioner, not a mestre in the traditional lineage sense. He is sometimes called "Mestre Zuma" honorifically but held no formal capoeira title.

STYLE CLASSIFICATION:
NULL - his "ginástica nacional" was distinct from Angola/Regional, a sport-focused variant without music/ritual.',
  -- notes_pt
  E'DATA DE NASCIMENTO (25 de novembro de 1898):
Verificado via comunicação pessoal de André Luis Lacé Lopes (19 de junho de 2020) citada em capoeirahistory.com.

DATA DE MORTE (18 de agosto de 1965):
Jornal do Brasil publicou nota de obituário com agradecimento da família pelas condolências recebidas.

NOME COMPLETO:
Anníbal Zumalacaraguhy de Menck Burlamaqui. "Zumalacaraguhy" é basco (significando "vale de salgueiros")—origem do apelido "Zuma."

OCUPAÇÃO:
- Guarda da polícia aduaneira
- Ascendeu a auditor fiscal na Receita Federal
- Residia em Copacabana, Rio de Janeiro

CARREIRA LITERÁRIA:
- Cenáculo Fluminense de História e Letras (ingressou em 8 de março de 1930, Cadeira 33)
- Presidente da sociedade duas vezes (anos 1950)
- "O meu delírio: poêma do instinto" (1939) - poesia erótica
- "Babel de Emoções" - segunda coleção de poesia
- Críticas: Jornal do Brasil (mista, 14 de abril de 1939); Correio da Manhã (severa, Álvaro Lins, 16 de novembro de 1940)

MANUAL DE CAPOEIRA (1928):
Título: "Gymnástica Nacional (capoeiragem) methodisada e regrada"
Prefácio por: Dr. Mário Santos (advogado, posou em 20 fotografias)
Inspiração: Capoeira da Lapa; "Gymnastica Brazileira" (1904)
31 movimentos catalogados (ver style_notes)
3 invenções alegadas: queixada, passo de cegonha, espada

FORMAÇÃO EM TREINAMENTO:
- Ginástica sueca, musculação, barras horizontais (idade 10+)
- Luta greco-romana (idade 18)
- Boxe "com justa constância"
- Jornal (abril 1920) o descreve como "capoeira e boxeur"
- Pode ter treinado no Gymnástico Português onde Mario Aleixo ensinava (1920)

LEGADO INSTITUCIONAL:
- Departamento de Luta Brasileira, Federação Carioca de Boxe (5 nov 1933)
- Departamento de Luta Brasileira, Federação Paulista de Pugilismo (4 nov 1936)
- Influenciou Decreto Federal 3.199/41 (14 de abril de 1941)

CONEXÃO COM DESAFIOS DE BIMBA EM 1936:
As lutas de desafio de Bimba foram disputadas sob as regras similares ao boxe de Zuma.
Oponentes: Henrique Bahia, Vítor Benedito Lopes, Américo Ciência, José Custódio "Zé I" dos Santos
Bimba venceu todas as quatro, ganhando o apelido "Três Pancadas."

ESTUDO DE BIMBA DOS MÉTODOS DE ZUMA:
Documentado que Bimba estudou métodos de Sinhozinho, Mario Aleixo e Zuma.

CONTEMPORÂNEOS:
- Raul Pederneiras (jornalista/cartunista, defensor da capoeira)
- Mário Santos (advogado, colaborador do manual)
- Mario Aleixo (professor de capoeira, exibições dos anos 1920)
- Mestre Sinhozinho (colega intelectual da capoeira carioca)

FAMÍLIA:
- Esposa: Sra. Burlamaqui (publicou nota de agradecimento no Jornal do Brasil, 18 ago 1965)
- Historiador da família: Ulysses Petronio Burlamaqui (comunicação pessoal 19 de junho de 2020)

SEM TÍTULO FORMAL DE CAPOEIRA:
Zuma era um defensor intelectual e praticante, não um mestre no sentido de linhagem tradicional. Às vezes é chamado de "Mestre Zuma" honorificamente mas não detinha título formal de capoeira.

CLASSIFICAÇÃO DE ESTILO:
NULL - sua "ginástica nacional" era distinta de Angola/Regional, uma variante focada em esporte sem música/ritual.'
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
