-- ============================================================
-- GENEALOGY PERSON: Toni Vargas
-- Generated: 2026-01-10
-- ============================================================
-- BIRTH DATE: April 5, 1958 (exact)
-- Sources: CapoeiraWiki, Lalaue, Portal Capoeira, Agência UVA
-- (50 years of capoeira in 2018 interview confirms 1958)
--
-- BIRTHPLACE: Rio de Janeiro, Brazil (Engenho de Dentro neighborhood)
-- Sources: Last.fm, Agência UVA interview
--
-- STYLE: Contemporânea
-- Associated with Grupo Senzala's methodology blending Regional
-- technique with Angola elements. Known as poet and musician of
-- capoeira.
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
  'Antonio César de Vargas',
  'Toni Vargas',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://www.lalaue.com/learn-capoeira/mestre-toni-vargas/',
    'https://capoeirawiki.org/wiki/Toni_Vargas',
    'https://portalcapoeira.com/capoeira/mestres/mestre-toni-vargas/'
  ]::text[],
  -- Capoeira-specific
  'contemporanea'::genealogy.style,
  E'Mestre Toni Vargas represents the Grupo Senzala lineage, which developed a systematic teaching methodology blending Capoeira Regional technique with elements of Capoeira Angola. Known primarily as one of capoeira''s most prolific composers and poets, his musical contributions have shaped the art''s contemporary repertoire. He has described capoeira''s Regional/Angola divide as a "Salvador division," preferring an inclusive understanding that honors both traditions. As an educator, he prioritizes the human and cultural aspects of capoeira over athletic performance, opposing efforts to make capoeira an Olympic sport.',
  E'Mestre Toni Vargas representa a linhagem do Grupo Senzala, que desenvolveu uma metodologia de ensino sistemática mesclando técnica da Capoeira Regional com elementos da Capoeira Angola. Conhecido principalmente como um dos compositores e poetas mais prolíficos da capoeira, suas contribuições musicais moldaram o repertório contemporâneo da arte. Ele descreveu a divisão Regional/Angola da capoeira como uma "divisão de Salvador," preferindo uma compreensão inclusiva que honra ambas as tradições. Como educador, prioriza os aspectos humanos e culturais da capoeira sobre o desempenho atlético, opondo-se aos esforços de tornar a capoeira um esporte olímpico.',
  -- Life dates
  1958,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,  -- Still alive
  NULL,
  NULL,
  -- Extended content (English bio)
  E'Antonio César de Vargas, known as Mestre Toni Vargas, was born on April 5, 1958, in Engenho de Dentro, a neighborhood in Rio de Janeiro, Brazil. He would become one of capoeira''s most celebrated composers, poets, and educators—a master whose songs are sung in rodas worldwide.

Toni Vargas began his capoeira journey in 1968 at age ten, when a cousin introduced him to the art. His first teacher was Mestre Rony of Grupo Palmares de Capoeira in the north zone of Rio de Janeiro. He has described this encounter as "the chance of my life." Though his family could not afford tuition, Mestre Rony allowed him to train without paying fees—an act of generosity that would shape his lifelong commitment to making capoeira accessible.

In the mid-1970s, Toni Vargas transitioned to training with Mestre Touro at Grupo Corda Bamba in the Penha neighborhood of Rio de Janeiro. There he achieved the blue cord (cordel azul), an intermediate graduation in the Senzala belt system.

In 1977, seeking to deepen his practice, Toni Vargas joined Grupo Senzala to train under Mestre Peixinho. For eight years he trained at Peixinho''s famous academy on Travessa Angrense in Copacabana, the legendary headquarters where "many bambas passed through." In 1985, Peixinho awarded him the red cord (corda vermelha)—the highest graduation in the Senzala system, signifying mestre status. According to sources, he was "the first graduated Formado" under Mestre Peixinho.

Parallel to his capoeira training, Toni Vargas pursued formal education. He earned a degree in Physical Education from the Federal University of Rio de Janeiro (UFRJ) and a postgraduate degree in dance. He also specialized in early childhood education, applying his pedagogical knowledge to develop innovative teaching methods.

In 1987, Toni Vargas was part of a pivotal moment in capoeira''s global expansion. Along with Mestres Peixinho, Garrincha, and Sorriso, he spent six months in Europe, organizing workshops and the First European Capoeira Encounter in Paris—the first event of its kind on the continent. This tour helped establish capoeira''s presence in Europe and paved the way for future generations of European practitioners.

As a composer, Toni Vargas has authored some of capoeira''s most beloved songs, including "Quando Venho de Luanda," "Dona Isabel," "Saudade," and "Era Uma Noite Sem Lua." His deep voice and poetic sensibility have made his recordings essential listening for capoeiristas worldwide. He has released six albums, including Liberdade, Saudade, Os Fundamentos da Malícia (with Nestor Capoeira), and Quadras e Corridos. His songs appear on numerous compilations internationally, and several have been included in educational textbooks.

Beyond music, Toni Vargas has devoted over 35 years to working with children through capoeira and his educational method "Recreação Ativa" (Active Recreation), which combines music, movement, and storytelling. In 2018, he released a children''s CD of the same name to support educators. He serves as head of Physical Education, music, and capoeira at a school in Rio de Janeiro.

In 2000, the Superliga Brasileira de Capoeira honored Toni Vargas as "one of the greatest mestres of the century" at a ceremony in Curitiba. In 2017, he published his first book, Fragmentos da Mandinga, which was later adapted into a music and poetry performance.

Today, Toni Vargas continues teaching in Rio de Janeiro and travels internationally—particularly to Denmark, where he conducts workshops twice yearly. He is married to a capoeirista and has three sons—Ruan, Gabriel, and Tiago—all of whom practice capoeira. He is co-founder of Ilê de Seu Peixinho in Copacabana and founder of Centro Cultural Senzala de Capoeira Memória Viva Mestre Peixinho.

Mestre Toni Vargas describes himself as "a guardian of my culture." He has openly criticized the religious discrimination and marginalization that capoeira has historically faced, advocating for preserving its Afro-Brazilian roots. He opposes capoeira becoming an Olympic sport, believing that "the Olympic model places performance above humanity." For Toni Vargas, capoeira is not just a martial art—it is poetry, music, history, and identity.',
  -- Extended content (Portuguese bio)
  E'Antonio César de Vargas, conhecido como Mestre Toni Vargas, nasceu em 5 de abril de 1958, em Engenho de Dentro, um bairro do Rio de Janeiro, Brasil. Ele se tornaria um dos compositores, poetas e educadores mais celebrados da capoeira—um mestre cujas canções são cantadas em rodas do mundo todo.

Toni Vargas iniciou sua jornada na capoeira em 1968, aos dez anos, quando um primo o introduziu à arte. Seu primeiro mestre foi Mestre Rony do Grupo Palmares de Capoeira na zona norte do Rio de Janeiro. Ele descreveu esse encontro como "a chance da minha vida." Embora sua família não pudesse pagar as mensalidades, Mestre Rony permitiu que ele treinasse sem pagar—um ato de generosidade que moldaria seu compromisso vitalício de tornar a capoeira acessível.

Em meados dos anos 1970, Toni Vargas passou a treinar com Mestre Touro no Grupo Corda Bamba no bairro da Penha, Rio de Janeiro. Lá ele alcançou o cordel azul, uma graduação intermediária no sistema de cordas da Senzala.

Em 1977, buscando aprofundar sua prática, Toni Vargas ingressou no Grupo Senzala para treinar com Mestre Peixinho. Por oito anos treinou na famosa academia de Peixinho na Travessa Angrense em Copacabana, a lendária sede onde "muitos bambas passaram." Em 1985, Peixinho lhe concedeu a corda vermelha—a mais alta graduação no sistema Senzala, significando status de mestre. Segundo fontes, ele foi "o primeiro Formado graduado" por Mestre Peixinho.

Paralelamente ao seu treinamento de capoeira, Toni Vargas buscou educação formal. Graduou-se em Educação Física pela Universidade Federal do Rio de Janeiro (UFRJ) e obteve pós-graduação em dança. Também se especializou em educação infantil, aplicando seu conhecimento pedagógico para desenvolver métodos de ensino inovadores.

Em 1987, Toni Vargas participou de um momento crucial na expansão global da capoeira. Junto com os Mestres Peixinho, Garrincha e Sorriso, passou seis meses na Europa, organizando workshops e o Primeiro Encontro Europeu de Capoeira em Paris—o primeiro evento do tipo no continente. Esta turnê ajudou a estabelecer a presença da capoeira na Europa e abriu caminho para futuras gerações de praticantes europeus.

Como compositor, Toni Vargas é autor de algumas das canções mais amadas da capoeira, incluindo "Quando Venho de Luanda," "Dona Isabel," "Saudade" e "Era Uma Noite Sem Lua." Sua voz profunda e sensibilidade poética tornaram suas gravações essenciais para capoeiristas do mundo todo. Ele lançou seis álbuns, incluindo Liberdade, Saudade, Os Fundamentos da Malícia (com Nestor Capoeira) e Quadras e Corridos. Suas canções aparecem em numerosas coletâneas internacionalmente, e várias foram incluídas em livros didáticos.

Além da música, Toni Vargas dedicou mais de 35 anos ao trabalho com crianças através da capoeira e seu método educacional "Recreação Ativa," que combina música, movimento e contação de histórias. Em 2018, lançou um CD infantil de mesmo nome para apoiar educadores. Ele atua como coordenador de Educação Física, música e capoeira em uma escola no Rio de Janeiro.

Em 2000, a Superliga Brasileira de Capoeira homenageou Toni Vargas como "um dos maiores mestres do século" em cerimônia em Curitiba. Em 2017, publicou seu primeiro livro, Fragmentos da Mandinga, que posteriormente foi adaptado em uma apresentação de música e poesia.

Hoje, Toni Vargas continua ensinando no Rio de Janeiro e viaja internacionalmente—particularmente para a Dinamarca, onde conduz workshops duas vezes por ano. É casado com uma capoeirista e tem três filhos—Ruan, Gabriel e Tiago—todos praticantes de capoeira. É co-fundador do Ilê de Seu Peixinho em Copacabana e fundador do Centro Cultural Senzala de Capoeira Memória Viva Mestre Peixinho.

Mestre Toni Vargas se descreve como "um guardião da minha cultura." Ele criticou abertamente a discriminação religiosa e a marginalização que a capoeira historicamente enfrentou, defendendo a preservação de suas raízes afro-brasileiras. Opõe-se a que a capoeira se torne um esporte olímpico, acreditando que "o modelo olímpico coloca o desempenho acima da humanidade." Para Toni Vargas, a capoeira não é apenas uma arte marcial—é poesia, música, história e identidade.',
  -- Achievements (English)
  E'- First Formado graduated by Mestre Peixinho at Grupo Senzala (1985)
- Honored as "one of the greatest mestres of the century" by Superliga Brasileira de Capoeira (2000, Curitiba)
- Co-organizer of First European Capoeira Encounter, Paris (1987)
- Author of iconic capoeira songs: "Quando Venho de Luanda," "Dona Isabel," "Saudade," "Era Uma Noite Sem Lua"
- Released six albums including Liberdade, Saudade, Os Fundamentos da Malícia (with Nestor Capoeira), Quadras e Corridos
- Published book Fragmentos da Mandinga (2017), adapted into music/poetry performance
- Developer of "Recreação Ativa" educational method for children (35+ years)
- Degree in Physical Education (UFRJ) and postgraduate in dance
- Co-founder of Ilê de Seu Peixinho
- Founder of Centro Cultural Senzala de Capoeira Memória Viva Mestre Peixinho
- International teaching: extensive work in Denmark and across Europe',
  -- Achievements (Portuguese)
  E'- Primeiro Formado graduado por Mestre Peixinho no Grupo Senzala (1985)
- Homenageado como "um dos maiores mestres do século" pela Superliga Brasileira de Capoeira (2000, Curitiba)
- Co-organizador do Primeiro Encontro Europeu de Capoeira, Paris (1987)
- Autor de canções icônicas da capoeira: "Quando Venho de Luanda," "Dona Isabel," "Saudade," "Era Uma Noite Sem Lua"
- Lançou seis álbuns incluindo Liberdade, Saudade, Os Fundamentos da Malícia (com Nestor Capoeira), Quadras e Corridos
- Publicou livro Fragmentos da Mandinga (2017), adaptado em apresentação de música/poesia
- Desenvolvedor do método educacional "Recreação Ativa" para crianças (35+ anos)
- Graduação em Educação Física (UFRJ) e pós-graduação em dança
- Co-fundador do Ilê de Seu Peixinho
- Fundador do Centro Cultural Senzala de Capoeira Memória Viva Mestre Peixinho
- Ensino internacional: trabalho extensivo na Dinamarca e Europa',
  -- Researcher notes (English)
  E'BIRTH DATE (1958-04-05, exact):
Multiple sources confirm April 5, 1958:
- CapoeiraWiki: "born 5 April 1958"
- Lalaue.com: "Born in Rio de Janeiro on April 5, 1958"
- Portal Capoeira: "5 de abril de 1958"
- Agência UVA (2018): 60 years old and 50 years in capoeira confirms 1958 birth

BIRTH PLACE: Engenho de Dentro, Rio de Janeiro
- Last.fm: "born in Engenho de Dentro, Rio de Janeiro"
- Multiple sources confirm Rio de Janeiro

TEACHERS:
- Mestre Rony (1968-mid 1970s) - First teacher at Grupo Palmares de Capoeira, north zone Rio
- Mestre Touro (mid-1970s) - Grupo Corda Bamba, Penha neighborhood; received blue cord
- Mestre Peixinho (1977-1985) - Primary teacher at Grupo Senzala; received red cord 1985

TRAINING TIMELINE:
- 1968: Began capoeira at age 10 with Mestre Rony
- Mid-1970s: Transitioned to Grupo Corda Bamba under Mestre Touro; received blue cord
- 1977: Joined Grupo Senzala under Mestre Peixinho
- 1985: Received corda vermelha (red cord) from Mestre Peixinho - first Formado graduated by Peixinho

EDUCATION:
- Physical Education degree from UFRJ (Federal University of Rio de Janeiro)
- Postgraduate degree in dance
- Specialization in early childhood education

GROUPS/ORGANIZATIONS:
- Grupo Palmares de Capoeira (Mestre Rony, 1968-mid 1970s)
- Grupo Corda Bamba (Mestre Touro, mid-1970s)
- Grupo Senzala (Mestre Peixinho, 1977-present)
- Ilê de Seu Peixinho (co-founder) - Copacabana
- Centro Cultural Senzala de Capoeira Memória Viva Mestre Peixinho (founder)

INTERNATIONAL WORK:
- 1987: First European Capoeira Encounter, Paris (with Peixinho, Garrincha, Sorriso)
- Travels twice yearly to Denmark for workshops
- International teaching across Europe

FAMILY:
- Wife: capoeirista (name not documented)
- Three sons: Ruan (b. ~1986), Gabriel (b. ~2000), Tiago (b. ~2002) - all practice capoeira

DISCOGRAPHY (6 albums + collaborations):
- Liberdade (2019 per Spotify)
- Saudade
- Quadras e Corridos
- Recreação Ativa (Ao Vivo) - children''s album (2018/2022)
- [Additional album titles not confirmed]
Collaborations:
- Os Fundamentos da Malícia (with Nestor Capoeira)
- Cantigas de Capoeira (guest on Mestre Paulo Siqueira''s album)

NOTABLE SONGS:
- "Quando Venho de Luanda"
- "Dona Isabel"
- "Saudade"
- "Era Uma Noite Sem Lua"
- "Chora Capoeira"
- "Corta Cana"
- "Para Roda Capoeira"
- "No Tempo Do Cativeiro"
- "Luanda" (with Mestre Itapuã Beiramar)

PUBLICATIONS:
- Fragmentos da Mandinga (2017) - first book, later adapted into music/poetry show

HONORS:
- 2000: Honored by Superliga Brasileira de Capoeira as "one of the century''s greatest mestres" (Curitiba, September 9, 2000 by Mestre Burguês)

PHILOSOPHY/POSITIONS:
- Describes himself as "a guardian of my culture"
- Opposes capoeira becoming Olympic sport
- Criticizes religious discrimination against capoeira
- Views Regional/Angola divide as "Salvador division"; advocates inclusive understanding
- Skeptical of "complete capoeirista" concept - believes mastery requires continuous learning

SOURCES CONSULTED:
- lalaue.com/learn-capoeira/mestre-toni-vargas/
- capoeirawiki.org/wiki/Toni_Vargas
- portalcapoeira.com/capoeira/mestres/mestre-toni-vargas/
- last.fm/music/Mestre+Toni+Vargas/+wiki
- agenciauva.net/2018/05/16/mestre-toni-vargas-vive-um-amor-pela-capoeira-ha-50-anos/
- capoeira.cafe (song listings)
- en.wikipedia.org/wiki/History_of_capoeira (1987 European tour confirmation)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO (1958-04-05, exato):
Múltiplas fontes confirmam 5 de abril de 1958:
- CapoeiraWiki: "nascido em 5 de abril de 1958"
- Lalaue.com: "Nascido no Rio de Janeiro em 5 de abril de 1958"
- Portal Capoeira: "5 de abril de 1958"
- Agência UVA (2018): 60 anos e 50 anos de capoeira confirma nascimento em 1958

LOCAL DE NASCIMENTO: Engenho de Dentro, Rio de Janeiro
- Last.fm: "nascido em Engenho de Dentro, Rio de Janeiro"
- Múltiplas fontes confirmam Rio de Janeiro

MESTRES:
- Mestre Rony (1968-meados anos 1970) - Primeiro mestre no Grupo Palmares de Capoeira, zona norte Rio
- Mestre Touro (meados anos 1970) - Grupo Corda Bamba, bairro da Penha; recebeu cordel azul
- Mestre Peixinho (1977-1985) - Mestre principal no Grupo Senzala; recebeu corda vermelha 1985

CRONOLOGIA DE TREINAMENTO:
- 1968: Começou capoeira aos 10 anos com Mestre Rony
- Meados anos 1970: Transição para Grupo Corda Bamba sob Mestre Touro; recebeu cordel azul
- 1977: Ingressou no Grupo Senzala sob Mestre Peixinho
- 1985: Recebeu corda vermelha de Mestre Peixinho - primeiro Formado graduado por Peixinho

EDUCAÇÃO:
- Graduação em Educação Física pela UFRJ
- Pós-graduação em dança
- Especialização em educação infantil

GRUPOS/ORGANIZAÇÕES:
- Grupo Palmares de Capoeira (Mestre Rony, 1968-meados anos 1970)
- Grupo Corda Bamba (Mestre Touro, meados anos 1970)
- Grupo Senzala (Mestre Peixinho, 1977-presente)
- Ilê de Seu Peixinho (co-fundador) - Copacabana
- Centro Cultural Senzala de Capoeira Memória Viva Mestre Peixinho (fundador)

TRABALHO INTERNACIONAL:
- 1987: Primeiro Encontro Europeu de Capoeira, Paris (com Peixinho, Garrincha, Sorriso)
- Viaja duas vezes ao ano para Dinamarca para workshops
- Ensino internacional pela Europa

FAMÍLIA:
- Esposa: capoeirista (nome não documentado)
- Três filhos: Ruan (n. ~1986), Gabriel (n. ~2000), Tiago (n. ~2002) - todos praticam capoeira

DISCOGRAFIA (6 álbuns):
- Liberdade (2019 conforme Spotify)
- Saudade
- Os Fundamentos da Malícia (com Nestor Capoeira)
- Quadras e Corridos
- Recreação Ativa (Ao Vivo) - álbum infantil (2018/2022)
- [6º álbum título não confirmado]

CANÇÕES NOTÁVEIS:
- "Quando Venho de Luanda"
- "Dona Isabel"
- "Saudade"
- "Era Uma Noite Sem Lua"
- "Chora Capoeira"
- "Corta Cana"
- "Para Roda Capoeira"
- "No Tempo Do Cativeiro"
- "Luanda" (com Mestre Itapuã Beiramar)

PUBLICAÇÕES:
- Fragmentos da Mandinga (2017) - primeiro livro, posteriormente adaptado em show de música/poesia

HONRARIAS:
- 2000: Homenageado pela Superliga Brasileira de Capoeira como "um dos maiores mestres do século" (Curitiba, 9 de setembro de 2000 por Mestre Burguês)

FILOSOFIA/POSIÇÕES:
- Descreve-se como "um guardião da minha cultura"
- Opõe-se a capoeira se tornar esporte olímpico
- Critica discriminação religiosa contra capoeira
- Vê divisão Regional/Angola como "divisão de Salvador"; advoga compreensão inclusiva
- Cético sobre conceito de "capoeirista completo" - acredita que maestria requer aprendizado contínuo

FONTES CONSULTADAS:
- lalaue.com/learn-capoeira/mestre-toni-vargas/
- capoeirawiki.org/wiki/Toni_Vargas
- portalcapoeira.com/capoeira/mestres/mestre-toni-vargas/
- last.fm/music/Mestre+Toni+Vargas/+wiki
- agenciauva.net/2018/05/16/mestre-toni-vargas-vive-um-amor-pela-capoeira-ha-50-anos/
- capoeira.cafe (listagem de canções)
- en.wikipedia.org/wiki/History_of_capoeira (confirmação turnê europeia 1987)'
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
