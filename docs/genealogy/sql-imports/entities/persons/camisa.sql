-- ============================================================
-- GENEALOGY PERSON: Camisa
-- Generated: 2025-12-25
-- ============================================================
-- José Tadeu Carneiro Cardoso (Mestre Camisa / Grão-Mestre Camisa)
-- Born October 28, 1955 in Jacobina/Itapeipu, Bahia
-- Founder of Abadá-Capoeira (1988)
-- Brother of Grão-Mestre Camisa Roxa
-- Fourth in family to graduate from Mestre Bimba's course (1969)
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
  'José Tadeu Carneiro Cardoso',
  'Camisa',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Jos%C3%A9_Tadeu_Carneiro_Cardoso', 'https://capoeirawiki.org/wiki/Jos%C3%A9_Tadeu_Carneiro_Cardoso', 'https://www.lalaue.com/learn-capoeira/mestre-camisa', 'https://capoeirahistory.com/mestre/master-camisa-1955/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Camisa developed a distinctive contemporary style building on Mestre Bimba''s Capoeira Regional foundation. His methodology emphasizes slips, takedowns, speed, and efficiency—techniques that allow smaller practitioners to neutralize larger opponents. He integrated elements from street capoeira, Regional, and Angola traditions into what became the Capoeira Abadá style. During the pandemic, he created new berimbau rhythms including São Bento da Abadá, Gingalopante, Jogo Cruzado, and others, expanding the musical vocabulary of capoeira practice.',
  E'Mestre Camisa desenvolveu um estilo contemporâneo distintivo construindo sobre a base da Capoeira Regional de Mestre Bimba. Sua metodologia enfatiza esquivas, quedas, velocidade e eficiência—técnicas que permitem praticantes menores neutralizar oponentes maiores. Ele integrou elementos da capoeira de rua, Regional e Angola naquilo que se tornou o estilo Capoeira Abadá. Durante a pandemia, criou novos toques de berimbau incluindo São Bento da Abadá, Gingalopante, Jogo Cruzado e outros, expandindo o vocabulário musical da prática da capoeira.',
  -- Life dates
  1955,
  'exact'::genealogy.date_precision,
  'Itapeipu, Jacobina, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'José Tadeu Carneiro Cardoso, known as Grão-Mestre Camisa, was born on October 28, 1955, at Fazenda Estiva near Itapeipu, in the municipality of Jacobina, Bahia. He was the youngest of four brothers who would all become capoeiristas, growing up with nine siblings on the family farm. His eldest brother, Edvaldo Carneiro e Silva, would become the legendary Grão-Mestre Camisa Roxa, considered the best student of Mestre Bimba.

At around seven years old, Camisa began learning capoeira from his brother Camisa Roxa, who had trained under Mestre Bimba. "In the beginning they called me Camisinha," Camisa later recalled, "because I was the youngest and I had a brother—Camisa Roxa—graduated by Mestre Bimba." Around 1963, Camisa Roxa began teaching his younger siblings the lessons he learned at Bimba''s academy in Salvador. The training attracted neighborhood youth—brothers, cousins, even vaqueiros (cowboys)—and they would practice on the farm''s terreiro, on the grass, in the corral, on riverbanks, and even in the water.

At age 12, Camisa moved to Salvador to continue his education and joined Mestre Bimba''s academy directly. His evolution was rapid: he graduated as an aluno formado at just 14 years old in 1969. His graduation companions were Macarrão, Onça Negra, and Torpedo; his sister Noemilde served as his madrinha (godmother). The formatura was a grand celebration in Amaralina featuring traditional stories told by Mestre Bimba, rituals, the prova de fogo (trial by fire), demonstrations of cintura desprezada, benguela games, matches with renowned capoeiristas and old graduates, and samba de roda until dawn.

In the early 1970s, Camisa toured Brazil with the folkloric dance company Olodum Maré alongside his brother Camisa Roxa. In late 1972, at age 16, he arrived in Rio de Janeiro during a tour. When his mother died shortly after, he decided to remain in Rio rather than return to his studies in Salvador. He began teaching capoeira at local academies and participating in the city''s weekend rodas.

In Rio, Camisa joined Grupo Senzala and quickly became a leading figure among its masters. He taught classes at the Civil Servants Association near Canecão playhouse and continued developing his methodology. In 1977, he appeared in the landmark capoeira film "Cordão de Ouro", directed by Antonio Carlos da Fontoura, alongside Mestres Nestor Capoeira, Leopoldina, Peixinho, and others.

In 1984, Camisa organized a major event at Circo Voador featuring Bahian masters and Brazilian capoeiristas from across the country—a watershed moment in Rio''s capoeira scene. However, by 1988, he felt the need for a new structure. "I began to consider the need to design a formal structure for classes, to draw up a basic lesson plan, to create a place to study and teach," he explained. Beyond pedagogy, he wanted to provide family-like support for practitioners who had left behind their homes to dedicate themselves to capoeira.

In 1988, Camisa founded Abadá-Capoeira (Associação Brasileira de Apoio e Desenvolvimento da Arte-Capoeira). His daughter Tatiana suggested the name, which cleverly abbreviates the organization''s mission. Drawing from Mestre Bimba''s innovative concepts, Camisa developed a distinctive teaching methodology emphasizing technical efficiency, proper body mechanics, and structured progression.

Abadá-Capoeira grew to become one of the largest capoeira organizations in the world, with over 40,000 members across more than 50 countries on five continents. Camisa established the Centro Educacional Mestre Bimba (CEMB) in Itaboraí, Rio de Janeiro—a training facility with sleeping quarters for 60 people and camping for 100 tents, honoring his mentor''s legacy.

Throughout his career, Camisa has composed numerous capoeira songs including "Cuidado Moço", "Laia Loio", and "Lavadeira". During the COVID-19 pandemic, he developed new berimbau rhythms for capoeira training—São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama, and Capopasso—expanding the musical vocabulary beyond the characteristic banguela already used within Abadá.

"Capoeira gave me the flexibility to overcome everyday difficulties," Camisa has said. He continues to lead Abadá-Capoeira from Rio de Janeiro, having lived for over a decade in the Mangueira samba school community. He has elevated two women to the rank of Mestranda, and his organization maintains social projects in disadvantaged communities throughout Brazil.',
  -- bio_pt
  E'José Tadeu Carneiro Cardoso, conhecido como Grão-Mestre Camisa, nasceu em 28 de outubro de 1955 na Fazenda Estiva, perto de Itapeipu, no município de Jacobina, Bahia. Era o mais novo de quatro irmãos que se tornariam capoeiristas, crescendo com nove irmãos na fazenda da família. Seu irmão mais velho, Edvaldo Carneiro e Silva, se tornaria o lendário Grão-Mestre Camisa Roxa, considerado o melhor aluno de Mestre Bimba.

Por volta dos sete anos, Camisa começou a aprender capoeira com seu irmão Camisa Roxa, que havia treinado com Mestre Bimba. "No começo me chamavam de Camisinha," Camisa recordou mais tarde, "porque eu era o caçula e tinha um irmão—Camisa Roxa—formado por Mestre Bimba." Por volta de 1963, Camisa Roxa começou a ensinar aos irmãos mais novos as lições que aprendia na academia de Bimba em Salvador. O treinamento atraía a juventude da vizinhança—irmãos, primos, até vaqueiros—e eles praticavam no terreiro da fazenda, no gramado, no curral, nas margens dos rios e até dentro d''água.

Aos 12 anos, Camisa mudou-se para Salvador para continuar seus estudos e ingressou diretamente na academia de Mestre Bimba. Sua evolução foi rápida: formou-se como aluno formado com apenas 14 anos em 1969. Seus companheiros de formatura foram Macarrão, Onça Negra e Torpedo; sua irmã Noemilde serviu como madrinha. A formatura foi uma grande celebração em Amaralina com histórias tradicionais contadas por Mestre Bimba, rituais, prova de fogo, demonstrações de cintura desprezada, jogos de benguela, partidas com capoeiristas renomados e antigos formados, e samba de roda até o amanhecer.

No início dos anos 1970, Camisa excursionou pelo Brasil com a companhia de dança folclórica Olodum Maré ao lado de seu irmão Camisa Roxa. No final de 1972, aos 16 anos, chegou ao Rio de Janeiro durante uma turnê. Quando sua mãe faleceu pouco depois, decidiu permanecer no Rio ao invés de retornar aos estudos em Salvador. Começou a ensinar capoeira em academias locais e a participar das rodas de fim de semana da cidade.

No Rio, Camisa juntou-se ao Grupo Senzala e rapidamente tornou-se figura de destaque entre seus mestres. Dava aulas na Associação dos Servidores Civis perto do Canecão e continuou desenvolvendo sua metodologia. Em 1977, apareceu no filme marco da capoeira "Cordão de Ouro", dirigido por Antonio Carlos da Fontoura, ao lado dos Mestres Nestor Capoeira, Leopoldina, Peixinho e outros.

Em 1984, Camisa organizou um grande evento no Circo Voador reunindo mestres baianos e capoeiristas brasileiros de todo o país—um momento decisivo na cena da capoeira carioca. Porém, em 1988, sentiu necessidade de uma nova estrutura. "Comecei a considerar a necessidade de desenhar uma estrutura formal para as aulas, elaborar um plano de ensino básico, criar um lugar para estudar e ensinar," explicou. Além da pedagogia, queria proporcionar apoio familiar aos praticantes que haviam deixado seus lares para se dedicar à capoeira.

Em 1988, Camisa fundou a Abadá-Capoeira (Associação Brasileira de Apoio e Desenvolvimento da Arte-Capoeira). Sua filha Tatiana sugeriu o nome, que habilmente abrevia a missão da organização. Baseando-se nos conceitos inovadores de Mestre Bimba, Camisa desenvolveu uma metodologia de ensino distintiva enfatizando eficiência técnica, mecânica corporal adequada e progressão estruturada.

A Abadá-Capoeira cresceu para se tornar uma das maiores organizações de capoeira do mundo, com mais de 40.000 membros em mais de 50 países nos cinco continentes. Camisa estabeleceu o Centro Educacional Mestre Bimba (CEMB) em Itaboraí, Rio de Janeiro—uma instalação de treinamento com dormitórios para 60 pessoas e área de camping para 100 barracas, honrando o legado de seu mentor.

Ao longo de sua carreira, Camisa compôs numerosas músicas de capoeira incluindo "Cuidado Moço", "Laia Loio" e "Lavadeira". Durante a pandemia de COVID-19, desenvolveu novos toques de berimbau para treinamento de capoeira—São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama e Capopasso—expandindo o vocabulário musical além da característica banguela já usada dentro da Abadá.

"A capoeira me deu flexibilidade para superar as dificuldades do dia a dia," disse Camisa. Ele continua liderando a Abadá-Capoeira do Rio de Janeiro, tendo vivido por mais de uma década na comunidade da escola de samba Mangueira. Elevou duas mulheres ao posto de Mestranda, e sua organização mantém projetos sociais em comunidades carentes por todo o Brasil.',
  -- achievements_en
  E'Founded Abadá-Capoeira (1988), one of the largest capoeira organizations in the world with 40,000+ members in 50+ countries; Graduated as aluno formado from Mestre Bimba''s academy at age 14 (1969); Fourth in family to graduate from Mestre Bimba''s capoeira course; Former leading figure in Grupo Senzala; Appeared in film "Cordão de Ouro" (1977); Established Centro Educacional Mestre Bimba (CEMB) in Itaboraí, Rio de Janeiro; Created new berimbau rhythms including São Bento da Abadá, Gingalopante, Jogo Cruzado; Composed capoeira songs including "Cuidado Moço", "Laia Loio", "Lavadeira"; Elevated two women to Mestranda rank; Organized landmark 1984 Circo Voador event; Developed structured teaching methodology based on Mestre Bimba''s concepts',
  -- achievements_pt
  E'Fundou a Abadá-Capoeira (1988), uma das maiores organizações de capoeira do mundo com 40.000+ membros em 50+ países; Formou-se como aluno formado da academia de Mestre Bimba aos 14 anos (1969); Quarto da família a se formar no curso de capoeira de Mestre Bimba; Ex-figura de destaque no Grupo Senzala; Apareceu no filme "Cordão de Ouro" (1977); Estabeleceu o Centro Educacional Mestre Bimba (CEMB) em Itaboraí, Rio de Janeiro; Criou novos toques de berimbau incluindo São Bento da Abadá, Gingalopante, Jogo Cruzado; Compôs músicas de capoeira incluindo "Cuidado Moço", "Laia Loio", "Lavadeira"; Elevou duas mulheres ao posto de Mestranda; Organizou evento marco no Circo Voador em 1984; Desenvolveu metodologia de ensino estruturada baseada nos conceitos de Mestre Bimba',
  -- notes_en
  E'BIRTH DATE (October 28, 1955, exact):
Most sources cite October 28, 1955. CapoeiraHistory says "1955" without day. Capoeira.online says "1956." Wikipedia and CapoeiraWiki say October 28, 1955. Using 1955 as majority.

NAME:
- "José Tadeu Carneiro Cardoso" - Wikipedia, CapoeiraWiki, most sources
- Some sources abbreviate to "José Tadeu Cardoso"
- Initially called "Camisinha" (diminutive), later "Camisa"

BIRTHPLACE:
- "Itapeipu, near Jacobina" - CapoeiraHistory
- "Jacobina, Bahia" - most sources
- "Fazenda Estiva" - family farm location (same as Camisa Roxa)

FAMILY (Carneiro capoeiristas from Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - eldest, b. 1944, Grão-Mestre
- Ermival - brother, aluno formado
- Pedrinho - brother, aluno formado
- José Tadeu (Camisa) - youngest brother, b. 1955, fourth to learn capoeira
- Noemilde - sister, madrinha at graduation (not documented as capoeirista)
- From "a family of five capoeiristas" - fifth person unidentified

TEACHERS:
- Camisa Roxa (brother, initial training, ~1962-1967, Fazenda Estiva)
- Mestre Bimba (primary, 1967-1969, Salvador)

TRAINING COMPANIONS AT BIMBA:
- Onça Negra, Macarrão, Torpedo (graduated together 1969)
- Pimentão, Nenel, Formiga, Demerval (contemporaries)
- Already graduated: Canhão, Alegria, Luís, Quebra Ferro, Malvadeza, Valdemar, Sarigue

GRADUATION (1969):
- Age 14, companions: Macarrão, Onça Negra, Torpedo
- Madrinha: sister Noemilde
- Location: Amaralina (Bimba''s academy neighborhood)
- Fourth family member to graduate from Bimba

CAREER TIMELINE:
- ~1962: Began learning from Camisa Roxa at Fazenda Estiva
- 1967: Moved to Salvador, joined Bimba''s academy (age 12)
- 1969: Graduated as aluno formado at age 14
- early 1970s: Toured Brazil with Olodum Maré
- late 1972: Arrived in Rio de Janeiro, age 16
- 1972-1988: Member of Grupo Senzala
- 1977: Appeared in film "Cordão de Ouro"
- 1984: Organized Circo Voador event
- 1988: Founded Abadá-Capoeira
- Lived 10+ years in Mangueira samba school community

MEDIA APPEARANCES:
- 1977: Film "Cordão de Ouro" (Antonio Carlos da Fontoura) - alongside Nestor Capoeira, Leopoldina, Peixinho
- 2018: CapoeiraHistory interviews and documentary work

GROUPS/ORGANIZATIONS:
- Olodum Maré (toured early 1970s with Camisa Roxa)
- Grupo Senzala (1972-1988)
- Abadá-Capoeira (founded 1988)

NEW RHYTHMS CREATED (pandemic period):
São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama, Capopasso

SONGS COMPOSED:
"Cuidado Moço", "Laia Loio", "Lavadeira"

SOCIAL PROJECTS:
- Centro Educacional Mestre Bimba (CEMB) in Itaboraí, RJ
- Social projects in disadvantaged communities',
  -- notes_pt
  E'DATA DE NASCIMENTO (28 de outubro de 1955, exata):
A maioria das fontes cita 28 de outubro de 1955. CapoeiraHistory diz "1955" sem dia. Capoeira.online diz "1956." Wikipedia e CapoeiraWiki dizem 28 de outubro de 1955. Usando 1955 como maioria.

NOME:
- "José Tadeu Carneiro Cardoso" - Wikipedia, CapoeiraWiki, maioria das fontes
- Algumas fontes abreviam para "José Tadeu Cardoso"
- Inicialmente chamado "Camisinha" (diminutivo), depois "Camisa"

LOCAL DE NASCIMENTO:
- "Itapeipu, perto de Jacobina" - CapoeiraHistory
- "Jacobina, Bahia" - maioria das fontes
- "Fazenda Estiva" - localização da fazenda familiar (mesmo que Camisa Roxa)

FAMÍLIA (capoeiristas Carneiro da Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - mais velho, n. 1944, Grão-Mestre
- Ermival - irmão, aluno formado
- Pedrinho - irmão, aluno formado
- José Tadeu (Camisa) - caçula dos irmãos, n. 1955, quarto a aprender capoeira
- Noemilde - irmã, madrinha na formatura (não documentada como capoeirista)
- De "uma família de cinco capoeiristas" - quinta pessoa não identificada

PROFESSORES:
- Camisa Roxa (irmão, treinamento inicial, ~1962-1967, Fazenda Estiva)
- Mestre Bimba (principal, 1967-1969, Salvador)

COMPANHEIROS DE TREINO COM BIMBA:
- Onça Negra, Macarrão, Torpedo (formaram juntos 1969)
- Pimentão, Nenel, Formiga, Demerval (contemporâneos)
- Já formados: Canhão, Alegria, Luís, Quebra Ferro, Malvadeza, Valdemar, Sarigue

FORMATURA (1969):
- Aos 14 anos, companheiros: Macarrão, Onça Negra, Torpedo
- Madrinha: irmã Noemilde
- Local: Amaralina (bairro da academia de Bimba)
- Quarto membro da família a formar com Bimba

CRONOLOGIA DA CARREIRA:
- ~1962: Começou a aprender com Camisa Roxa na Fazenda Estiva
- 1967: Mudou-se para Salvador, entrou na academia de Bimba (12 anos)
- 1969: Formou-se como aluno formado aos 14 anos
- início 1970s: Excursionou pelo Brasil com Olodum Maré
- final 1972: Chegou ao Rio de Janeiro, 16 anos
- 1972-1988: Membro do Grupo Senzala
- 1977: Apareceu no filme "Cordão de Ouro"
- 1984: Organizou evento no Circo Voador
- 1988: Fundou Abadá-Capoeira
- Viveu 10+ anos na comunidade da escola de samba Mangueira

APARIÇÕES NA MÍDIA:
- 1977: Filme "Cordão de Ouro" (Antonio Carlos da Fontoura) - ao lado de Nestor Capoeira, Leopoldina, Peixinho
- 2018: Entrevistas e trabalho documental CapoeiraHistory

GRUPOS/ORGANIZAÇÕES:
- Olodum Maré (excursionou início 1970s com Camisa Roxa)
- Grupo Senzala (1972-1988)
- Abadá-Capoeira (fundou 1988)

NOVOS TOQUES CRIADOS (período da pandemia):
São Bento da Abadá, Gingalopante, Jogo Cruzado, Siriúna, Silvestre, Capoxadama, Capopasso

MÚSICAS COMPOSTAS:
"Cuidado Moço", "Laia Loio", "Lavadeira"

PROJETOS SOCIAIS:
- Centro Educacional Mestre Bimba (CEMB) em Itaboraí, RJ
- Projetos sociais em comunidades carentes'
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
