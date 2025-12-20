-- ============================================================
-- GENEALOGY PERSON: Ezequiel
-- Generated: 2025-12-20
-- ============================================================
-- BIRTH DATE: October 18, 1941 per Velhos Mestres (primary source)
-- Alternative: April 18, 1941 per CapoeiraNews - using October as
-- Velhos Mestres is Tier 1 source
-- DEATH DATE: March 26, 1997 per Velhos Mestres, March 27 per Omar source
-- DEATH CAUSE: Heart attack (most sources); one source mentions car
-- accident from epileptic seizure - using heart attack as majority
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
  'Eziquiel Martins Marinho',
  'Ezequiel',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-16', 'https://www.lalaue.com/learn-capoeira/mestre-eziquiel/', 'http://www.capoeira-paris.org/ezequiel.php', 'https://www.capoeiranews.com.br/2017/06/mestre-ezequiel-1941-1997-texto-boa-alma.html']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Faithful disciple of Mestre Bimba who dedicated his life to preserving and spreading the Regional style. Known for his exceptional singing voice, mandinga-filled game, and mastery of the berimbau. Recorded albums that became relics of capoeira music. His approach combined technical excellence with the philosophy that "respect in the rodas ensures the student disciplines themselves toward others."',
  E'Discípulo fiel de Mestre Bimba que dedicou sua vida a preservar e difundir o estilo Regional. Conhecido por sua voz excepcional, jogo cheio de mandinga e maestria no berimbau. Gravou álbuns que se tornaram relíquias da música de capoeira. Sua abordagem combinava excelência técnica com a filosofia de que "o respeito nas rodas faz o aluno disciplinar-se em relação aos outros."',
  -- Life dates
  1941,
  'exact'::genealogy.date_precision,
  'São Gonçalo dos Campos, Bahia, Brazil',
  1997,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Eziquiel Martins Marinho, known as Mestre Ezequiel or affectionately as "Zica" by friends and "Jiqué" by Mestre Bimba, was born on October 18, 1941, in São Gonçalo dos Campos in the Recôncavo Baiano region of Bahia. He came from a modest family and grew up observing capoeira at street rodas—learning "de oitiva" (by ear and observation) before formal training.

Before dedicating himself fully to capoeira, Ezequiel served as a military police officer in Salvador. It was through this profession, in the mid-1960s, that he met Mestre Saci (Josevaldo Lima de Jesus), one of the great disciples of Mestre Bimba. Saci introduced Ezequiel to Capoeira Regional, training him at the Quartel dos Dendezeiros, the Military Police barracks in the Itapagipe neighborhood. Saci then brought him to Mestre Bimba''s Centro de Cultura Física e Luta Regional.

At Bimba''s academy, Ezequiel found his calling. He graduated with the lenço azul (blue handkerchief), the mark of a formado in Capoeira Regional, alongside Luciano Figueiredo (Mestre Galo). His encounter with Mestre Bimba transformed what had been merely "a dream of being a famous capoeirista" into "an unconditional passion for this genuinely Brazilian art."

In 1964, while still training at Bimba''s academy, Ezequiel began teaching his friends who noticed his new physical agility. As their numbers grew, he founded Grupo Luanda with his student Mestre Franklin. The group was formally registered as Grupo Folclórico Luanda in 1974. The name "Luanda"—the capital of Angola—honored the ports from which enslaved Africans said their last goodbyes to their homeland, while also meaning "the junction of the moon and the earth" in Yoruba.

When Mestre Bimba left Salvador for Goiânia in 1972, disillusioned by lack of governmental support, Ezequiel was chosen alongside Mestre Vermelho 27 to maintain the historic academy at Terreiro de Jesus. For several years after Bimba''s death in 1974, Ezequiel continued teaching at the school in Pelourinho and at Forte de Santo Antônio (now Forte da Capoeira).

Ezequiel became one of capoeira''s most renowned singers, musicians, and composers. Those who knew him said he "cantava com emoção" (sang with emotion). His distinctive voice and unique singing style made him, alongside Mestre Itapoan, one of the most responsible for spreading Mestre Bimba''s philosophy throughout the capoeira world. In 1989, he recorded the album "Capoeira, Arte e Ofício" with 16 tracks, now considered a relic. He also recorded "Programa Nacional de Capoeira Volume 2" the same year.

His competitive achievements were equally impressive. Ezequiel was two-time Brazilian Capoeira Champion in 1976 and 1977, and received a trophy for "best ginga" in 1976. He participated in folkloric groups Olodum and Olodumaré, representing Bahia and Brazil at international festivals in Salta (Argentina) and Quito (Ecuador), winning gold medals and the prestigious "Humanaua de Oro" awards.

Ezequiel''s approach to capoeira emphasized discipline and respect. He was deeply concerned about violence in the rodas, believing that internal conflicts between groups were destructive to the art. He warned that inexperienced capoeiristas could damage capoeira''s foundational principles.

Among his students, the most famous is Mestre Jelon Vieira, who trained under him in Salvador before moving to New York in 1975, becoming one of the first to introduce capoeira to the United States. Mestre Omar da Conceição, born in 1957, began training with Ezequiel at age 12 at the Escola de Capoeira Mestre Bimba. On August 30, 1996, Ezequiel traveled to Baden, Switzerland, to inaugurate Mestre Omar''s Academia de Capoeira União and personally elevated Omar to mestre status.

Mestre Ezequiel died on March 26, 1997, at age 55, suffering a heart attack despite being in excellent physical condition and at the height of his capoeira mastery. As the obituary in Capoeira Paris noted, his heart was "fatigued by the many emotions lived through countless rodas." His death left "um vazio nas rodas da terra" (a void in the circles of the earth). Many mestres have since dedicated songs in his memory.

His legacy continues through Grupo Luanda, which today operates in Brazil, Switzerland, France, Germany, Hawaii, and across the Americas, pursuing his foundational concept of "educação com base na capoeira" (education based on capoeira).',
  -- bio_pt
  E'Eziquiel Martins Marinho, conhecido como Mestre Ezequiel ou carinhosamente como "Zica" pelos amigos e "Jiqué" por Mestre Bimba, nasceu em 18 de outubro de 1941, em São Gonçalo dos Campos, no Recôncavo Baiano. Vindo de uma família humilde, cresceu observando a capoeira nas rodas de rua—aprendendo "de oitiva" antes do treinamento formal.

Antes de se dedicar inteiramente à capoeira, Ezequiel serviu como policial militar em Salvador. Foi através desta profissão, em meados dos anos 1960, que conheceu Mestre Saci (Josevaldo Lima de Jesus), um dos grandes discípulos de Mestre Bimba. Saci apresentou Ezequiel à Capoeira Regional, treinando-o no Quartel dos Dendezeiros, o quartel da Polícia Militar no bairro de Itapagipe. Saci então o levou ao Centro de Cultura Física e Luta Regional de Mestre Bimba.

Na academia de Bimba, Ezequiel encontrou sua vocação. Formou-se com o lenço azul, a marca de um formado na Capoeira Regional, ao lado de Luciano Figueiredo (Mestre Galo). Seu encontro com Mestre Bimba transformou o que tinha sido apenas "um sonho de ser um capoeirista famoso" em "uma paixão incondicional por esta arte genuinamente brasileira."

Em 1964, ainda treinando na academia de Bimba, Ezequiel começou a ensinar seus amigos que notaram sua nova agilidade física. Conforme o número crescia, fundou o Grupo Luanda com seu aluno Mestre Franklin. O grupo foi formalmente registrado como Grupo Folclórico Luanda em 1974. O nome "Luanda"—a capital de Angola—homenageava os portos de onde os africanos escravizados deram seus últimos adeuses à sua terra natal, significando também "a junção da lua e da terra" em iorubá.

Quando Mestre Bimba deixou Salvador para Goiânia em 1972, desiludido com a falta de apoio governamental, Ezequiel foi escolhido junto com Mestre Vermelho 27 para manter a histórica academia no Terreiro de Jesus. Por vários anos após a morte de Bimba em 1974, Ezequiel continuou ensinando na escola no Pelourinho e no Forte de Santo Antônio (hoje Forte da Capoeira).

Ezequiel tornou-se um dos mais renomados cantores, músicos e compositores da capoeira. Aqueles que o conheceram diziam que ele "cantava com emoção." Sua voz distintiva e estilo único de cantar fizeram dele, junto com Mestre Itapoan, um dos mais responsáveis por espalhar a filosofia de Mestre Bimba pelo mundo da capoeira. Em 1989, gravou o álbum "Capoeira, Arte e Ofício" com 16 faixas, hoje considerado uma relíquia. Também gravou "Programa Nacional de Capoeira Volume 2" no mesmo ano.

Suas conquistas competitivas foram igualmente impressionantes. Ezequiel foi bicampeão Brasileiro de Capoeira em 1976 e 1977, e recebeu um troféu de "melhor ginga" em 1976. Participou dos grupos folclóricos Olodum e Olodumaré, representando a Bahia e o Brasil em festivais internacionais em Salta (Argentina) e Quito (Equador), ganhando medalhas de ouro e os prestigiosos prêmios "Humanaua de Oro."

A abordagem de Ezequiel à capoeira enfatizava disciplina e respeito. Ele estava profundamente preocupado com a violência nas rodas, acreditando que conflitos internos entre grupos eram destrutivos para a arte. Alertava que capoeiristas inexperientes poderiam danificar os princípios fundamentais da capoeira.

Entre seus alunos, o mais famoso é Mestre Jelon Vieira, que treinou sob sua orientação em Salvador antes de se mudar para Nova York em 1975, tornando-se um dos primeiros a introduzir a capoeira nos Estados Unidos. Mestre Omar da Conceição, nascido em 1957, começou a treinar com Ezequiel aos 12 anos na Escola de Capoeira Mestre Bimba. Em 30 de agosto de 1996, Ezequiel viajou para Baden, Suíça, para inaugurar a Academia de Capoeira União de Mestre Omar e pessoalmente elevou Omar ao status de mestre.

Mestre Ezequiel morreu em 26 de março de 1997, aos 55 anos, sofrendo um ataque cardíaco apesar de estar em excelente condição física e no auge de sua maestria na capoeira. Como observou o obituário na Capoeira Paris, seu coração estava "fatigado pelas muitas emoções vividas em incontáveis rodas." Sua morte deixou "um vazio nas rodas da terra." Muitos mestres desde então dedicaram canções em sua memória.

Seu legado continua através do Grupo Luanda, que hoje opera no Brasil, Suíça, França, Alemanha, Havaí e nas Américas, perseguindo seu conceito fundamental de "educação com base na capoeira."',
  -- achievements_en
  E'Two-time Brazilian Capoeira Champion (1976, 1977); Best Ginga trophy (1976); Co-maintained Mestre Bimba''s academy at Terreiro de Jesus after 1972; Founded Grupo Luanda (1964) with Mestre Franklin; Recorded album "Capoeira, Arte e Ofício" (1989); Represented Brazil at International Folklore Festivals in Salta (Argentina) and Quito (Ecuador); Won gold medals and "Humanaua de Oro" awards; Participated in XVI Brazilian School Games (JEBs) in Brasília (1987); Participated in I Cultural Journey of Capoeira in Ouro Preto (1987); Personally graduated Mestre Omar to mestre status (1996)',
  -- achievements_pt
  E'Bicampeão Brasileiro de Capoeira (1976, 1977); Troféu de melhor ginga (1976); Co-manteve a academia de Mestre Bimba no Terreiro de Jesus após 1972; Fundou o Grupo Luanda (1964) com Mestre Franklin; Gravou o álbum "Capoeira, Arte e Ofício" (1989); Representou o Brasil nos Festivais Internacionais de Folclore em Salta (Argentina) e Quito (Equador); Ganhou medalhas de ouro e prêmios "Humanaua de Oro"; Participou do XVI Jogos Escolares Brasileiros (JEBs) em Brasília (1987); Participou da I Jornada Cultural da Capoeira em Ouro Preto (1987); Pessoalmente graduou Mestre Omar ao status de mestre (1996)',
  -- notes_en
  E'BIRTH DATE (1941, exact):
- October 18, 1941 per Velhos Mestres (Tier 1 source)
- April 18, 1941 per CapoeiraNews (authored by Boa Alma)
Using October 18 as Velhos Mestres is highest reliability.

DEATH DATE (1997, exact):
- March 26, 1997 per Velhos Mestres and most sources
- March 27, 1997 per Mestre Omar source

DEATH CAUSE DISCREPANCY:
- Heart attack (infarctus) per Capoeira Paris, CapoeiraNews (MAJORITY)
- Car accident due to epileptic seizure per Mestre Omar source (MINORITY)
Using heart attack as majority of sources confirm this.

APELIDO VARIATIONS:
- "Ezequiel" (most common spelling)
- "Eziquiel" (alternative spelling, used by Velhos Mestres)
- "Zica" / "Velho Zica" (nickname by friends)
- "Jiqué" (nickname given by Mestre Bimba)
- "Carneiro" (mentioned in Velhos Mestres)

TEACHERS:
- Mestre Saci (Josevaldo Lima de Jesus) - first formal training at Quartel dos Dendezeiros, mid-1960s
- Mestre Bimba - primary teacher at CCFR

STUDENTS:
- Mestre Jelon Vieira (most famous; introduced capoeira to NYC 1975)
- Mestre Omar da Conceição (born 1957; began age 12; elevated to mestre Aug 30, 1996)
- Mestre Franklin (co-founded Grupo Luanda)

TRAINING COMPANION:
- Luciano Figueiredo (Mestre Galo) - graduated lenço azul together

COLLABORATORS:
- Mestre Vermelho 27 (1972-1974, maintaining Bimba''s academy)

MEDIA APPEARANCES:
- 1976: Trophy for "best ginga" at Brazilian championship
- 1987 (July 16-19): XVI JEBs in Brasília, coordinated by Mestre Tabosa
- 1987 (Dec 18-20): I Cultural Journey of Capoeira in Ouro Preto
- 1989: Album "Capoeira, Arte e Ofício" (16 tracks)
- 1989: Album "Programa Nacional de Capoeira Volume 2" (vinyl LP)
- 1996 (Aug 30): Elevated Mestre Omar to mestre in Baden, Switzerland

INTERNATIONAL FESTIVALS:
- Festival in Salta, Argentina (with Olodum/Olodumaré)
- Festival in Quito, Ecuador (with Olodum/Olodumaré)

GRUPO LUANDA:
- Founded 1964 with Mestre Franklin in Salvador
- Formally registered as Grupo Folclórico Luanda 1974
- Headquarters in Resgate neighborhood, Cabula region
- Today operates in Brazil, Switzerland, France, Germany, Hawaii',
  -- notes_pt
  E'DATA DE NASCIMENTO (1941, exata):
- 18 de outubro de 1941 conforme Velhos Mestres (fonte Tier 1)
- 18 de abril de 1941 conforme CapoeiraNews (autoria de Boa Alma)
Usando 18 de outubro pois Velhos Mestres tem maior confiabilidade.

DATA DE MORTE (1997, exata):
- 26 de março de 1997 conforme Velhos Mestres e maioria das fontes
- 27 de março de 1997 conforme fonte Mestre Omar

DISCREPÂNCIA NA CAUSA DA MORTE:
- Ataque cardíaco (infarto) conforme Capoeira Paris, CapoeiraNews (MAIORIA)
- Acidente de carro devido a convulsão epiléptica conforme fonte Mestre Omar (MINORIA)
Usando ataque cardíaco pois maioria das fontes confirma isto.

VARIAÇÕES DO APELIDO:
- "Ezequiel" (grafia mais comum)
- "Eziquiel" (grafia alternativa, usada por Velhos Mestres)
- "Zica" / "Velho Zica" (apelido pelos amigos)
- "Jiqué" (apelido dado por Mestre Bimba)
- "Carneiro" (mencionado no Velhos Mestres)

PROFESSORES:
- Mestre Saci (Josevaldo Lima de Jesus) - primeiro treinamento formal no Quartel dos Dendezeiros, meados dos anos 1960
- Mestre Bimba - professor principal no CCFR

ALUNOS:
- Mestre Jelon Vieira (mais famoso; introduziu capoeira em NYC 1975)
- Mestre Omar da Conceição (nascido 1957; começou aos 12 anos; elevado a mestre 30 ago 1996)
- Mestre Franklin (co-fundou Grupo Luanda)

COMPANHEIRO DE TREINO:
- Luciano Figueiredo (Mestre Galo) - formou-se com lenço azul juntos

COLABORADORES:
- Mestre Vermelho 27 (1972-1974, mantendo a academia de Bimba)

APARIÇÕES NA MÍDIA:
- 1976: Troféu de "melhor ginga" no campeonato brasileiro
- 1987 (16-19 julho): XVI JEBs em Brasília, coordenado por Mestre Tabosa
- 1987 (18-20 dez): I Jornada Cultural da Capoeira em Ouro Preto
- 1989: Álbum "Capoeira, Arte e Ofício" (16 faixas)
- 1989: Álbum "Programa Nacional de Capoeira Volume 2" (LP vinil)
- 1996 (30 ago): Elevou Mestre Omar a mestre em Baden, Suíça

FESTIVAIS INTERNACIONAIS:
- Festival em Salta, Argentina (com Olodum/Olodumaré)
- Festival em Quito, Equador (com Olodum/Olodumaré)

GRUPO LUANDA:
- Fundado 1964 com Mestre Franklin em Salvador
- Formalmente registrado como Grupo Folclórico Luanda 1974
- Sede no bairro do Resgate, região do Cabula
- Hoje opera no Brasil, Suíça, França, Alemanha, Havaí'
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
