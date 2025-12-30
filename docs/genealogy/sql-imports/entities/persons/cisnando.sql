-- ============================================================
-- GENEALOGY PERSON: Cisnando
-- Generated: 2025-12-25
-- ============================================================
-- José Cisnando Lima was "A Pedra Fundamental" (The Foundation
-- Stone) of Capoeira Regional according to Mestre Decânio.
-- Medical student who connected Bimba to political power.
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
  'José Cisnando Lima',
  'Cisnando',
  NULL,
  NULL,
  ARRAY['https://capoeiradabahia.portalcapoeira.com/dr-jos-qcisnandoq-lima-a-pedra-fundamental-da-regional/', 'https://portalcapoeira.com/capoeira-da-bahia/dr-jose-qcisnandoq-lima-a-pedra-fundamental-da-regional/', 'https://www.capoeiranews.com.br/2015/06/sisnando-e-mestre-bimba.html']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Key architect of Capoeira Regional''s methodology alongside Mestre Bimba. As a university-educated medical student with prior martial arts training, Cisnando contributed academic pedagogy, nomenclature, and systematic structure to Bimba''s creation. Introduced elements from his jiu-jitsu training. Known for exceptional physical prowess—reportedly defeating three judo/karate students simultaneously in a challenge match.',
  E'Arquiteto principal da metodologia da Capoeira Regional ao lado de Mestre Bimba. Como estudante de medicina universitário com treinamento prévio em artes marciais, Cisnando contribuiu com pedagogia acadêmica, nomenclatura e estrutura sistemática para a criação de Bimba. Introduziu elementos de seu treinamento em jiu-jitsu. Conhecido por proeza física excepcional—supostamente derrotou três alunos de judô/karatê simultaneamente em uma luta de desafio.',
  -- Life dates
  1914,
  'exact'::genealogy.date_precision,
  'Crato, Ceará, Brazil',
  1984,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'José Cisnando Lima was born on October 9, 1914, at Sítio Santa Rosa in Crato, Ceará—the sole survivor among five brothers, a testament to the harsh conditions of the sertão. By age fourteen, he was considered the strongest man in his city. He developed a passion for martial arts early, practicing jiu-jitsu before leaving Ceará, and dreamed of learning the legendary capoeira he had heard sung about in verse and prose.

In 1932, Cisnando traveled to Salvador to study medicine at the Faculdade de Medicina da Bahia. Upon arriving, he sought out the capoeira he had heard about—specifically the style where "the capoeirista faced another armed with a knife and still gained advantage." A cook at his pension directed him to a tall, strong Black man who worked as a charcoal worker in the Curuzú neighborhood of Liberdade.

That man was Manoel dos Reis Machado—Mestre Bimba.

When Cisnando approached Bimba requesting to learn, Bimba initially refused, declaring that capoeira was "for Black people, not white people." Undeterred, Cisnando insisted and eventually convinced Bimba to administer his famous entrance test: surviving three minutes in a powerful neck lock (gravata). Cisnando endured, and Bimba accepted him.

What followed was a transformative partnership. Bimba taught Cisnando the capoeira game; Cisnando taught Bimba academic nomenclature and systematic pedagogy. Together they formalized what Bimba had been developing since 1928—the sequências de ensino, cintura desprezada, the batizado ceremony, and the graduation system. Crucially, it was Cisnando who advised Bimba to call his style "Luta Regional Baiana" rather than capoeira, since capoeira remained illegal.

Cisnando also brought his martial arts background to bear. According to sources, he had trained in jiu-jitsu under Takeo Yano (and possibly Mitsuyo Maeda), as well as karate under Takamatsu (5th dan Shotokan, 2nd dan Kodokan), kendô, and bojitsu with Japanese colonists. His prowess was legendary—when he visited a judo/karate academy and challenged the master to fight three of his best students simultaneously, reportedly "the first had not risen when the third was knocked down."

But Cisnando''s most important contribution was political. During his time in Salvador, he had taken up residence in the neighborhood of Lieutenant Juracy Magalhães, Bahia''s state interventor (governor) under Getúlio Vargas. Cisnando became part of Juracy''s personal guard and developed a close friendship with him. As Mestre Decânio wrote, Juracy Magalhães was responsible for "the great social revolution that recognized African culture as legitimate in all its manifestations, especially capoeira and candomblé."

Cisnando arranged a private demonstration of Bimba''s capoeira for Juracy Magalhães. The demonstration "provoked the admiration, respect, and consideration of the highest state authority for Mestre Bimba and for Capoeira, opening the path for later demonstrations for President Getúlio Vargas." In 1937, Juracy authorized the operation of the "Clube de União em Apuros" in Roça do Lobo—effectively the first legally registered capoeira academy in the world. Through Cisnando, Bimba reached Juracy, who conducted them to Vargas, who legalized capoeira and recognized it as Brazil''s national martial art.

Cisnando graduated from medical school in 1937, the same year Bimba''s academy received official certification. He began practicing medicine in Santa Bárbara, Bahia, then returned to his native region in 1943, working in various southern Ceará cities before settling back in Bahia around 1950.

Beyond medicine, Cisnando served as a city councilman and interim mayor (presidente da câmara) in Feira de Santana, president of the rural workers'' syndicate, state agriculture physician, public security medical examiner, and school meal program supervisor. He founded two private psychiatric clinics and taught biology at multiple institutions.

Mestre Decânio called Cisnando "A Pedra Fundamental" (The Foundation Stone) of Capoeira Regional—a title that captures his essential role. Without Cisnando''s intellectual contributions, political connections, and martial arts knowledge, Bimba''s capoeira might never have transcended its marginalized origins to become the globally practiced art it is today.

José Cisnando Lima died on December 10, 1984, in Salvador, Bahia.',
  -- bio_pt
  E'José Cisnando Lima nasceu em 9 de outubro de 1914, no Sítio Santa Rosa em Crato, Ceará—o único sobrevivente entre cinco irmãos, testemunho das duras condições do sertão. Aos catorze anos, era considerado o homem mais forte de sua cidade. Desenvolveu paixão por artes marciais cedo, praticando jiu-jitsu antes de deixar o Ceará, e sonhava em aprender a lendária capoeira de que ouvira falar em verso e prosa.

Em 1932, Cisnando viajou para Salvador para estudar medicina na Faculdade de Medicina da Bahia. Ao chegar, buscou a capoeira de que ouvira falar—especificamente o estilo onde "o capoeirista enfrentava outro armado com faca e ainda levava vantagem." Uma cozinheira de sua pensão indicou-lhe um homem negro alto e forte que trabalhava como carvoeiro no bairro do Curuzú, na Liberdade.

Esse homem era Manoel dos Reis Machado—Mestre Bimba.

Quando Cisnando se aproximou de Bimba pedindo para aprender, Bimba inicialmente recusou, declarando que capoeira era "para gente preta, não para branco." Determinado, Cisnando insistiu e eventualmente convenceu Bimba a aplicar seu famoso teste de entrada: sobreviver três minutos em uma poderosa gravata no pescoço. Cisnando resistiu, e Bimba o aceitou.

O que se seguiu foi uma parceria transformadora. Bimba ensinou a Cisnando o jogo da capoeira; Cisnando ensinou a Bimba nomenclatura acadêmica e pedagogia sistemática. Juntos formalizaram o que Bimba vinha desenvolvendo desde 1928—as sequências de ensino, cintura desprezada, a cerimônia do batizado e o sistema de graduação. Crucialmente, foi Cisnando quem aconselhou Bimba a chamar seu estilo de "Luta Regional Baiana" em vez de capoeira, já que a capoeira ainda era ilegal.

Cisnando também trouxe sua bagagem em artes marciais. Segundo as fontes, ele havia treinado jiu-jitsu com Takeo Yano (e possivelmente Mitsuyo Maeda), além de karatê com Takamatsu (5º dan Shotokan, 2º dan Kodokan), kendô e bojitsu com colonos japoneses. Sua proeza era lendária—quando visitou uma academia de judô/karatê e desafiou o mestre a lutar contra três de seus melhores alunos simultaneamente, supostamente "o primeiro ainda não havia se levantado quando o terceiro foi derrubado."

Mas a contribuição mais importante de Cisnando foi política. Durante seu tempo em Salvador, ele havia se estabelecido no bairro do Tenente Juracy Magalhães, interventor do estado da Bahia sob Getúlio Vargas. Cisnando tornou-se parte da guarda pessoal de Juracy e desenvolveu estreita amizade com ele. Como Mestre Decânio escreveu, Juracy Magalhães foi responsável pela "grande revolução social que reconheceu a cultura africana como legítima em todas as suas manifestações, especialmente a capoeira e o candomblé."

Cisnando organizou uma demonstração privada da capoeira de Bimba para Juracy Magalhães. A demonstração "provocou a admiração, o respeito e a consideração da mais alta autoridade estadual para Mestre Bimba e para a Capoeira, abrindo o caminho para demonstrações posteriores para o Presidente Getúlio Vargas." Em 1937, Juracy autorizou o funcionamento do "Clube de União em Apuros" na Roça do Lobo—efetivamente a primeira academia de capoeira legalmente registrada no mundo. Através de Cisnando, Bimba chegou a Juracy, que os conduziu a Vargas, que legalizou a capoeira e a reconheceu como arte marcial nacional do Brasil.

Cisnando formou-se em medicina em 1937, no mesmo ano em que a academia de Bimba recebeu certificação oficial. Começou a praticar medicina em Santa Bárbara, Bahia, depois retornou à sua região natal em 1943, trabalhando em várias cidades do sul do Ceará antes de se estabelecer novamente na Bahia por volta de 1950.

Além da medicina, Cisnando serviu como vereador e prefeito interino (presidente da câmara) em Feira de Santana, presidente do sindicato dos trabalhadores rurais, médico da agricultura estadual, médico legista da segurança pública e supervisor do programa de merenda escolar. Fundou duas clínicas psiquiátricas particulares e ensinou biologia em múltiplas instituições.

Mestre Decânio chamou Cisnando de "A Pedra Fundamental" da Capoeira Regional—um título que captura seu papel essencial. Sem as contribuições intelectuais de Cisnando, suas conexões políticas e seu conhecimento em artes marciais, a capoeira de Bimba talvez nunca tivesse transcendido suas origens marginalizadas para se tornar a arte praticada globalmente que é hoje.

José Cisnando Lima morreu em 10 de dezembro de 1984, em Salvador, Bahia.',
  -- achievements_en
  E'Co-architect of Capoeira Regional methodology alongside Mestre Bimba; Key political connector who arranged demonstration for Governor Juracy Magalhães, leading to capoeira''s legalization; First white student of the elite class accepted by Mestre Bimba; Medical doctor (graduated 1937, Faculdade de Medicina da Bahia); City councilman and interim mayor (presidente da câmara) of Feira de Santana; Founder of two psychiatric clinics; Biology professor; Called "A Pedra Fundamental" (Foundation Stone) of Capoeira Regional by Mestre Decânio',
  -- achievements_pt
  E'Co-arquiteto da metodologia da Capoeira Regional ao lado de Mestre Bimba; Conector político chave que organizou demonstração para o Interventor Juracy Magalhães, levando à legalização da capoeira; Primeiro aluno branco da classe de elite aceito por Mestre Bimba; Médico (formado em 1937, Faculdade de Medicina da Bahia); Vereador e prefeito interino (presidente da câmara) de Feira de Santana; Fundador de duas clínicas psiquiátricas; Professor de biologia; Chamado de "A Pedra Fundamental" da Capoeira Regional por Mestre Decânio',
  -- notes_en
  E'BIRTH DATE (1914-10-09, exact):
October 9, 1914 - confirmed by capoeiradabahia.portalcapoeira.com article.

DEATH DATE (1984-12-10, exact):
December 10, 1984 - confirmed by capoeiranews.com.br article.

NAME VARIATION:
- "Cisnando" - most common
- "Sisnando" - alternative spelling found in some sources (capoeiranews.com.br)
- Full name: José Cisnando Lima

TEACHERS:
- Mestre Bimba (capoeira, ~1932-1937+) - primary capoeira teacher; met in Curuzú, Liberdade
- Takeo Yano (jiu-jitsu) - Japanese master active in Bahia/Pernambuco
- Takamatsu (karate, 5th dan Shotokan, 2nd dan Kodokan)
- Various Japanese colonists (kendô, bojitsu)

Note on Mitsuyo Maeda: Some sources (Wikipedia, CapoeiraWiki) mention training under Mitsuyo Maeda, but primary Portal Capoeira sources only mention Takeo Yano. Maeda was active in northern Brazil (Belém) and died in 1941, so direct training is possible but not confirmed.

TRAINING COMPANIONS AT BIMBA''S ACADEMY:
- Mestre Decânio (fellow academic, fellow "pillar" of Regional)
- Other early students of Bimba from 1930s

POLITICAL CONNECTIONS:
- Juracy Magalhães (Lt./Interventor of Bahia) - close friend, member of personal guard
- Getúlio Vargas (President of Brazil) - introduced through Juracy

CAREER TIMELINE:
- 1932: Enrolled in Faculdade de Medicina da Bahia
- 1932-1937: Met Bimba, began training, co-developed Regional methodology
- 1937: Graduated medical school; Bimba''s academy officially certified
- 1937-1943: Practiced medicine in Santa Bárbara, Bahia
- 1943-1950: Practiced medicine in southern Ceará cities
- 1950+: Returned to Bahia (Santa Bárbara area)
- Various positions: Feira de Santana councilman, chamber president, syndicate president, state physician, medical examiner, school meals supervisor
- Founded two psychiatric clinics
- Taught biology at multiple institutions

CHALLENGE MATCH ANECDOTE:
Visited a judo/karate academy, challenged the master to fight three of his best students simultaneously, and reportedly won—"the first had not risen when the third was knocked down."

HISTORICAL SIGNIFICANCE:
Called "A Pedra Fundamental" (Foundation Stone) by Mestre Decânio. Along with Decânio himself, Cisnando formed one of the two intellectual "pillars" upon which Bimba built Capoeira Regional during the Initial Phase (1930-1937) and Consolidation Phase (1938-1966).

MEDIA APPEARANCES:
- None documented

GRAVATA TEST:
Survived Bimba''s famous entrance test - enduring three minutes in a powerful neck lock (gravata). After Cisnando''s admission, Bimba changed the test to flexibility demonstration and written examination.',
  -- notes_pt
  E'DATA DE NASCIMENTO (1914-10-09, exata):
9 de outubro de 1914 - confirmado pelo artigo capoeiradabahia.portalcapoeira.com.

DATA DE FALECIMENTO (1984-12-10, exata):
10 de dezembro de 1984 - confirmado pelo artigo capoeiranews.com.br.

VARIAÇÃO DE NOME:
- "Cisnando" - mais comum
- "Sisnando" - grafia alternativa encontrada em algumas fontes (capoeiranews.com.br)
- Nome completo: José Cisnando Lima

PROFESSORES:
- Mestre Bimba (capoeira, ~1932-1937+) - professor principal de capoeira; encontraram-se no Curuzú, Liberdade
- Takeo Yano (jiu-jitsu) - mestre japonês ativo na Bahia/Pernambuco
- Takamatsu (karatê, 5º dan Shotokan, 2º dan Kodokan)
- Vários colonos japoneses (kendô, bojitsu)

Nota sobre Mitsuyo Maeda: Algumas fontes (Wikipedia, CapoeiraWiki) mencionam treinamento com Mitsuyo Maeda, mas as fontes primárias do Portal Capoeira mencionam apenas Takeo Yano. Maeda era ativo no norte do Brasil (Belém) e morreu em 1941, então treinamento direto é possível mas não confirmado.

COMPANHEIROS DE TREINO NA ACADEMIA DE BIMBA:
- Mestre Decânio (colega acadêmico, colega "pilar" da Regional)
- Outros alunos iniciais de Bimba dos anos 1930

CONEXÕES POLÍTICAS:
- Juracy Magalhães (Ten./Interventor da Bahia) - amigo próximo, membro da guarda pessoal
- Getúlio Vargas (Presidente do Brasil) - apresentado através de Juracy

CRONOLOGIA DA CARREIRA:
- 1932: Matriculou-se na Faculdade de Medicina da Bahia
- 1932-1937: Conheceu Bimba, começou a treinar, co-desenvolveu a metodologia Regional
- 1937: Formou-se em medicina; academia de Bimba oficialmente certificada
- 1937-1943: Praticou medicina em Santa Bárbara, Bahia
- 1943-1950: Praticou medicina em cidades do sul do Ceará
- 1950+: Retornou à Bahia (região de Santa Bárbara)
- Várias posições: vereador de Feira de Santana, presidente da câmara, presidente de sindicato, médico estadual, médico legista, supervisor de merenda escolar
- Fundou duas clínicas psiquiátricas
- Ensinou biologia em múltiplas instituições

ANEDOTA DA LUTA DESAFIO:
Visitou uma academia de judô/karatê, desafiou o mestre a lutar contra três de seus melhores alunos simultaneamente, e supostamente venceu—"o primeiro ainda não havia se levantado quando o terceiro foi derrubado."

SIGNIFICADO HISTÓRICO:
Chamado de "A Pedra Fundamental" por Mestre Decânio. Junto com o próprio Decânio, Cisnando formou um dos dois "pilares" intelectuais sobre os quais Bimba construiu a Capoeira Regional durante a Fase Inicial (1930-1937) e Fase de Consolidação (1938-1966).

APARIÇÕES NA MÍDIA:
- Nenhuma documentada

TESTE DA GRAVATA:
Sobreviveu ao famoso teste de entrada de Bimba - suportando três minutos em uma poderosa gravata no pescoço. Após a admissão de Cisnando, Bimba mudou o teste para demonstração de flexibilidade e exame escrito.'
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
