-- ============================================================
-- GENEALOGY PERSON: Atenilo
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
  'Altenisio dos Santos',
  'Atenilo',
  'mestre'::genealogy.title,
  NULL,
  '[
    {"type": "website", "url": "https://www.recantodasletras.com.br/artigos-de-esporte/7729009"},
    {"type": "website", "url": "https://www.recantodasletras.com.br/artigos-de-esporte/6737383"}
  ]'::jsonb,
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Originally trained in Angola before Bimba formalized Regional. Became one of the most traditional practitioners of Capoeira Regional. Known for a deliberate, slow playing style despite his ironic nickname "Relâmpago" (Lightning). His style was described as "tardo, lerdo, ingênuo" (slow, sluggish, naive) - a contrast that became his trademark. Specialist on the pandeiro (tambourine) in the charanga (Bimba''s minimal berimbau + two pandeiros ensemble).',
  E'Originalmente treinado em Angola antes de Bimba formalizar a Regional. Tornou-se um dos praticantes mais tradicionais da Capoeira Regional. Conhecido por um estilo de jogo deliberado e lento, apesar de seu apelido irônico "Relâmpago". Seu estilo era descrito como "tardo, lerdo, ingênuo" - um contraste que se tornou sua marca registrada. Especialista no pandeiro na charanga (conjunto mínimo de Bimba com um berimbau e dois pandeiros).',
  -- Life dates
  1918,
  'exact'::genealogy.date_precision,
  'Oliveira, Santo Amaro da Purificação, Bahia, Brazil',
  1986,
  'year'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Altenisio dos Santos, known in the rodas as "Relâmpago" (Lightning) and popularly called Atenilo, was one of Mestre Bimba''s oldest and most devoted students. Born on July 16, 1918, in Oliveira, a district of Santo Amaro da Purificação in Bahia''s Recôncavo region, he began his capoeira journey in 1929 at age eleven and remained with Bimba for forty-five years until the master''s death in 1974.

When Atenilo first started training with Bimba, it was not yet Capoeira Regional—it was Angola. He was present at the pivotal meeting at Bogum, at the end of the Engenho Velho da Federação bus line, where Bimba decided to transform Capoeira de Angola into Regional. He witnessed firsthand the transition that would reshape Brazilian martial arts history.

His nickname "Relâmpago" (Lightning) was given jokingly. Far from being the fastest player, Atenilo was known for his slow, deliberate, almost naive style of playing. One observer noted he "never modified his slow, sluggish, ingenuous way of practicing capoeira." This contrast between name and nature became his trademark.

Within Bimba''s academy, Atenilo found his specialty at the pandeiro, becoming an integral part of the charanga—Bimba''s signature musical ensemble consisting of one berimbau and two pandeiros. He is immortalized in capoeira song: "Atenilo no pandeiro, Gigante no berimbau, Grande Mestre Bimba, Homem genial" (Atenilo on pandeiro, Gigante on berimbau, Grand Mestre Bimba, Brilliant man).

Bimba considered Atenilo like a son. He became one of Bimba''s most trusted companions, alongside figures like Brás "Amansa Brabo" and Crispim, Bimba''s eldest son. According to Atenilo and Mestre Itapoan, Bimba sometimes instructed his students to hit and injure Pastinha''s students in shared rodas—a revelation that adds nuance to the narrative of mutual respect between the two schools.

Atenilo provided invaluable testimony about early capoeira history. He recounted that Pastinha wanted Bimba to give lessons at his academy every Sunday and that Bimba would go to Sangradouro to teach at Pastinha''s school on holidays. He also described how Waldemar, Pastinha, Aberrê, and Gigante used to play together at Bogum before Regional was formalized.

His oral histories became the foundation for Mestre Itapoan''s book "Atenilo, o Relâmpago da Capoeira Regional" (Atenilo, the Lightning of Capoeira Regional), published in 1988 by the Núcleo de Recursos Didáticos da UFBA. This work preserved crucial testimony about the transition from Angola to Regional, about Besouro Mangangá''s era, and about female capoeiristas like Maria Salomé.

Some sources claim Atenilo was the brother of Neco Canário Pardo and used the nickname "Cordão de Ouro." However, this claim is chronologically problematic: Neco Canário Pardo was born around 1880, placing nearly forty years between them. The name "Cordão de Ouro" is more commonly attributed to Besouro Mangangá himself. The truth of this family connection remains unverified.

Atenilo died in 1986, one of the last direct links to the founding generation of Capoeira Regional. His testimony ensures that the voices and experiences of those who witnessed capoeira''s transformation from street practice to recognized cultural art form are not lost to history.',
  -- bio_pt
  E'Altenisio dos Santos, conhecido nas rodas como "Relâmpago" e popularmente chamado de Atenilo, foi um dos alunos mais antigos e devotados de Mestre Bimba. Nascido em 16 de julho de 1918, em Oliveira, distrito de Santo Amaro da Purificação, na região do Recôncavo baiano, iniciou sua jornada na capoeira em 1929, aos onze anos, e permaneceu com Bimba por quarenta e cinco anos até a morte do mestre em 1974.

Quando Atenilo começou a treinar com Bimba, ainda não era Capoeira Regional—era Angola. Ele estava presente na reunião decisiva no Bogum, no final da linha de ônibus do Engenho Velho da Federação, onde Bimba decidiu transformar a Capoeira de Angola em Regional. Testemunhou em primeira mão a transição que reformularia a história das artes marciais brasileiras.

Seu apelido "Relâmpago" foi dado de brincadeira. Longe de ser o jogador mais rápido, Atenilo era conhecido por seu estilo de jogar lento, deliberado, quase ingênuo. Um observador notou que ele "jamais modificou seu estilo tardo, lerdo, ingênuo de praticar a capoeira." Esse contraste entre nome e natureza tornou-se sua marca registrada.

Na academia de Bimba, Atenilo encontrou sua especialidade no pandeiro, tornando-se parte integral da charanga—o conjunto musical característico de Bimba, consistindo em um berimbau e dois pandeiros. Ele é imortalizado em canção de capoeira: "Atenilo no pandeiro, Gigante no berimbau, Grande Mestre Bimba, Homem genial."

Bimba considerava Atenilo como um filho. Ele se tornou um dos companheiros mais confiáveis de Bimba, ao lado de figuras como Brás "Amansa Brabo" e Crispim, o filho mais velho de Bimba. Segundo Atenilo e Mestre Itapoan, Bimba às vezes instruía seus alunos a bater e machucar os alunos de Pastinha nas rodas compartilhadas—uma revelação que adiciona nuance à narrativa de respeito mútuo entre as duas escolas.

Atenilo forneceu testemunho inestimável sobre a história inicial da capoeira. Ele relatou que Pastinha queria que Bimba desse aulas em sua academia todo domingo e que Bimba ia ao Sangradouro para ensinar na escola de Pastinha nos feriados. Também descreveu como Waldemar, Pastinha, Aberrê e Gigante costumavam jogar juntos no Bogum antes da Regional ser formalizada.

Suas histórias orais se tornaram a base do livro de Mestre Itapoan "Atenilo, o Relâmpago da Capoeira Regional," publicado em 1988 pelo Núcleo de Recursos Didáticos da UFBA. Esta obra preservou testemunhos cruciais sobre a transição de Angola para Regional, sobre a era de Besouro Mangangá, e sobre capoeiristas mulheres como Maria Salomé.

Algumas fontes afirmam que Atenilo era irmão de Neco Canário Pardo e usava o apelido "Cordão de Ouro." Contudo, essa afirmação é cronologicamente problemática: Neco Canário Pardo nasceu por volta de 1880, colocando quase quarenta anos entre eles. O nome "Cordão de Ouro" é mais comumente atribuído ao próprio Besouro Mangangá. A veracidade dessa conexão familiar permanece não verificada.

Atenilo morreu em 1986, um dos últimos elos diretos com a geração fundadora da Capoeira Regional. Seu testemunho garante que as vozes e experiências daqueles que testemunharam a transformação da capoeira de prática de rua para arte cultural reconhecida não se percam na história.',
  -- achievements_en
  E'One of Mestre Bimba''s oldest students (45 years of training); Witness to the founding meeting of Capoeira Regional at Bogum; Primary source for Mestre Itapoan''s book "Atenilo, o Relâmpago da Capoeira Regional" (1988); Specialist pandeiro player in Bimba''s charanga; Preserved oral histories of early capoeira figures including Besouro Mangangá and female capoeiristas',
  -- achievements_pt
  E'Um dos alunos mais antigos de Mestre Bimba (45 anos de treinamento); Testemunha da reunião fundadora da Capoeira Regional no Bogum; Fonte primária para o livro de Mestre Itapoan "Atenilo, o Relâmpago da Capoeira Regional" (1988); Pandeirista especialista na charanga de Bimba; Preservou histórias orais de figuras iniciais da capoeira incluindo Besouro Mangangá e capoeiristas mulheres',
  -- Researcher notes (English)
  E'BIRTH DATE: July 16, 1918 - exact date from Atenilo''s testimony to Mestre Itapoan: "I was born on July 16, 1918 in Oliveira, District of Santo Amaro da Purificação, Bahia, and I started learning Capoeira in 1929."

DEATH DATE: 1986 - year confirmed by multiple sources; exact date unknown.

NICKNAME: "Relâmpago" (Lightning) was ironic/humorous - his style was actually slow ("tardo, lerdo, ingênuo"), not fast. One source notes he "never modified his slow, sluggish, ingenuous way of practicing capoeira."

BROTHER CLAIM (DISPUTED): Some sources claim Atenilo was brother to Neco Canário Pardo and used the nickname "Cordão de Ouro." This is chronologically problematic: Neco Canário Pardo (est. birth c. 1880) and Atenilo (born 1918) have a ~38-year age gap. If true, they were likely half-brothers. Mestre Waldemar attributed "Cordão de Ouro" to Besouro Mangangá himself, not to Atenilo.

TRAINING TIMELINE: Started with Bimba in 1929 at age 11. At that time, Bimba was still teaching Capoeira de Angola (Regional was formalized later). Accompanied Bimba for 45 years until Bimba''s death in 1974.

BOGUM MEETING: According to Atenilo, the meeting where Bimba decided to create Regional took place at Bogum, at the end of the Engenho Velho da Federação bus line. Waldemar, Pastinha, Aberrê, and Gigante used to play there.

SPECIALTY: Pandeiro player in Bimba''s charanga (one berimbau + two pandeiros ensemble).

BOOK: Mestre Itapoan wrote "Atenilo, o Relâmpago da Capoeira Regional" (1988, UFBA) based on Atenilo''s testimonies.

PENDING RELATIONSHIPS (require Mestre Bimba import):
- Atenilo student_of Mestre Bimba (1929-1974)

PENDING FAMILY RELATIONSHIP (disputed, not imported):
- Atenilo family_of Neco Canário Pardo (brother - chronologically problematic)',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 16 de julho de 1918 - data exata do testemunho de Atenilo para Mestre Itapoan: "Nasci em 16 de julho de 1918 em Oliveira, Distrito de Santo Amaro da Purificação, Bahia, e comecei a aprender Capoeira em 1929."

DATA DE MORTE: 1986 - ano confirmado por múltiplas fontes; data exata desconhecida.

APELIDO: "Relâmpago" era irônico/humorístico - seu estilo era na verdade lento ("tardo, lerdo, ingênuo"), não rápido. Uma fonte nota que ele "jamais modificou seu estilo tardo, lerdo, ingênuo de praticar a capoeira."

ALEGAÇÃO DE IRMÃO (DISPUTADA): Algumas fontes afirmam que Atenilo era irmão de Neco Canário Pardo e usava o apelido "Cordão de Ouro." Isso é cronologicamente problemático: Neco Canário Pardo (nascimento estimado c. 1880) e Atenilo (nascido 1918) têm uma diferença de ~38 anos. Se verdade, eram provavelmente meio-irmãos. Mestre Waldemar atribuiu "Cordão de Ouro" ao próprio Besouro Mangangá, não a Atenilo.

LINHA DO TEMPO DE TREINAMENTO: Começou com Bimba em 1929 aos 11 anos. Naquela época, Bimba ainda ensinava Capoeira de Angola (Regional foi formalizada depois). Acompanhou Bimba por 45 anos até a morte de Bimba em 1974.

REUNIÃO DO BOGUM: Segundo Atenilo, a reunião onde Bimba decidiu criar a Regional aconteceu no Bogum, no final da linha de ônibus do Engenho Velho da Federação. Waldemar, Pastinha, Aberrê e Gigante costumavam jogar lá.

ESPECIALIDADE: Pandeirista na charanga de Bimba (conjunto de um berimbau + dois pandeiros).

LIVRO: Mestre Itapoan escreveu "Atenilo, o Relâmpago da Capoeira Regional" (1988, UFBA) baseado nos testemunhos de Atenilo.

RELACIONAMENTOS PENDENTES (requerem importação de Mestre Bimba):
- Atenilo student_of Mestre Bimba (1929-1974)

RELACIONAMENTO FAMILIAR PENDENTE (disputado, não importado):
- Atenilo family_of Neco Canário Pardo (irmão - cronologicamente problemático)'
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
