-- ============================================================
-- GENEALOGY PERSON: Mário Aleixo
-- Generated: 2025-12-22
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1885, decade):
-- If teaching jiu-jitsu professionally in 1913, he was likely 25-35 years old,
-- suggesting birth between 1878-1888. If already "consolidated in capoeira"
-- before 1913, he was likely mature. Middle estimate: ~1885.
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
  'Mário Aleixo',
  'Mário Aleixo',
  NULL,  -- Never formally titled as mestre; referred to as "professor"
  NULL,  -- No portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/',
    'https://simonbjj.com/mario-aleixo'
  ]::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca variant, not Angola/Regional
  E'Mário Aleixo developed a hybrid fighting system he called "capo-jitsu"—combining capoeira with jiu-jitsu, boxing, and fencing techniques. His approach was sport-oriented, stripping away music and ritual in favor of combat effectiveness. He taught capoeiragem as "ginástica nacional" (national gymnastics), emphasizing standing and ground techniques. His method was influenced by Raphael Lóthus''s systematized capoeiragem. After losses to jiu-jitsu practitioners in ring matches where fighters wore kimonos, his capo-jitsu project declined.',
  E'Mário Aleixo desenvolveu um sistema híbrido de luta que chamava de "capo-jitsu"—combinando capoeira com jiu-jitsu, boxe e técnicas de esgrima. Sua abordagem era orientada ao esporte, eliminando música e ritual em favor da eficácia no combate. Ensinava capoeiragem como "ginástica nacional", enfatizando técnicas de pé e de solo. Seu método foi influenciado pela capoeiragem sistematizada de Raphael Lóthus. Após derrotas para praticantes de jiu-jitsu em lutas de ringue onde os lutadores usavam quimono, seu projeto de capo-jitsu entrou em declínio.',
  -- Life dates
  1885,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,  -- Death date unknown
  NULL,
  NULL,
  -- bio_en
  E'Mário Aleixo was a pioneering Brazilian martial artist who became one of the first fighters to integrate multiple combat disciplines decades before mixed martial arts was formalized. A triathlete, gymnastics instructor, and accomplished fencer, Aleixo possessed exceptional athleticism for his era.

Aleixo first established himself in capoeira, learning the methods systematized by Raphael Lóthus—the largely forgotten figure who opened Brazil''s first capoeira course, the Escola de Ginástica Nacional (National Gymnastics School), in 1916 together with Aleixo himself. Unlike most capoeiristas of his generation, Aleixo was a physical educator who approached capoeira as sport rather than street survival.

In an era when Japanese martial arts were gaining attention in Brazil, Aleixo seized an opportunity to learn jiu-jitsu from Sada Miyako, a Japanese instructor who had arrived in Rio de Janeiro in 1908 aboard a Brazilian Navy vessel. Though the exact date of their meeting is unknown, Aleixo himself confirmed learning "the gentle art" from Miyako.

In 1913, Aleixo began teaching jiu-jitsu at the Centro Sportivo do Engenho Velho in northern Rio de Janeiro, becoming the first Brazilian to teach jiu-jitsu professionally in the country—a distinction predating the Gracie family''s involvement by over a decade. It should be noted that Miyako''s jiu-jitsu lineage bore no relation to what would later become Gracie Jiu-Jitsu.

On September 8, 1914, Aleixo relocated to the prestigious Club de Regatas Boqueirão do Passeio to teach fencing and jiu-jitsu. In 1915, his achievements earned him an invitation to teach martial arts to the Guarda Civil (Civil Guard) of Rio de Janeiro, where he instructed 15 police officers. That same year, Aleixo had already taught jiu-jitsu and capoeiragem to Rio''s civil police.

In 1916, Aleixo invited Agenor Sampaio—the future Mestre Sinhozinho—to teach Greco-Roman wrestling at the União dos Empregados do Comércio (Trade Union of Retail Employees) in central Rio. This collaboration placed two of Rio de Janeiro''s most important early capoeira figures in the same institutional space.

By 1920, Aleixo and the journalist Raul Pederneiras opened a capoeiragem school in one of the classrooms of the Club Gymnástico Português (Portuguese Gymnastics Club). The Sorocabano newspaper Cruzeiro do Sul reported on their intention: "Dr. Raul Pederneiras and professor Mario Aleixo intend to found in Rio a school for teaching a genuinely Brazilian sport: capoeiragem". Pederneiras, who had previously taught jiu-jitsu and capoeiragem to the Rio civil police, was a fervent intellectual advocate for capoeira as a national identity element.

On March 13, 1920, the newspaper O Jornal documented a sports festival where Aleixo and Sinhozinho performed. The program included: "Personal defence and attack—teacher Mário Aleixo versus Ernesto Goétte" and "Brazilian gymnastics (Capoeiragem)—teacher Agenor Sampaio versus Lincoln Coimbra". Presentations were directed by "teachers Mário Aleixo, Gustavo Senna and Agenor Sampaio".

Aleixo''s approach of blending capoeira with jiu-jitsu—which he called "capo-jitsu"—made him a uniquely innovative athlete, demonstrating capacity for adaptation according to each opponent. He combined standing capoeira techniques with jiu-jitsu ground work, creating perhaps the first truly hybrid Brazilian fighting system.

However, Aleixo''s capo-jitsu project faced a decisive setback. In the early 1930s, he confronted George Gracie in a Vale Tudo match at the Theatro Republica in Rio de Janeiro. The fight was predominantly contested on the ground, where Gracie dominated. Aleixo lost, reportedly by armlock in the second round. The defeat came in a context where capoeiristas were forced to wear kimonos—unfamiliar garments that nullified much of their standing advantage.

The loss to the Gracies had broader implications. Aleixo''s defeat, combined with losses by his students and other capoeiristas to jiu-jitsu practitioners, helped solidify Gracie Jiu-Jitsu''s reputation as an effective self-defense system. The capo-jitsu experiment was effectively abandoned.

Mestre Bimba is documented to have studied the methods of several Rio de Janeiro capoeira teachers, including Mário Aleixo, Sinhozinho, and Zuma, who mixed capoeira with martial arts like judo, boxing, Greco-Roman wrestling, and Portuguese stick-fighting. Though the exact nature and timing of this influence remains unclear, Aleixo''s hybrid approach may have contributed to the evolution of Capoeira Regional.

Despite his notable achievements—first Brazilian jiu-jitsu teacher, pioneering hybrid martial artist, collaborator on one of Brazil''s earliest formal capoeira schools—Mário Aleixo faded into historical obscurity after his defeat to the Gracies. His exact date of death remains unknown.',
  -- bio_pt
  E'Mário Aleixo foi um pioneiro das artes marciais brasileiras que se tornou um dos primeiros lutadores a integrar múltiplas disciplinas de combate décadas antes da formalização do MMA. Triatleta, professor de ginástica e esgrimista consumado, Aleixo possuía um atleticismo excepcional para sua época.

Aleixo primeiro se consolidou na capoeira, aprendendo os métodos sistematizados por Raphael Lóthus—a figura amplamente esquecida que abriu o primeiro curso de capoeira do Brasil, a Escola de Ginástica Nacional, em 1916 juntamente com o próprio Aleixo. Diferente da maioria dos capoeiristas de sua geração, Aleixo era um educador físico que abordava a capoeira como esporte ao invés de sobrevivência de rua.

Em uma era quando as artes marciais japonesas estavam ganhando atenção no Brasil, Aleixo aproveitou a oportunidade de aprender jiu-jitsu com Sada Miyako, um instrutor japonês que havia chegado ao Rio de Janeiro em 1908 a bordo de um navio da Marinha Brasileira. Embora a data exata do encontro seja desconhecida, o próprio Aleixo confirmou ter aprendido "a arte suave" com Miyako.

Em 1913, Aleixo começou a ensinar jiu-jitsu no Centro Sportivo do Engenho Velho no norte do Rio de Janeiro, tornando-se o primeiro brasileiro a ensinar jiu-jitsu profissionalmente no país—uma distinção que precedeu o envolvimento da família Gracie em mais de uma década. Deve-se notar que a linhagem de jiu-jitsu de Miyako não tinha relação com o que mais tarde se tornaria o Jiu-Jitsu Gracie.

Em 8 de setembro de 1914, Aleixo se transferiu para o prestigioso Club de Regatas Boqueirão do Passeio para ensinar esgrima e jiu-jitsu. Em 1915, suas realizações lhe renderam um convite para ensinar artes marciais à Guarda Civil do Rio de Janeiro, onde instruiu 15 policiais. Nesse mesmo ano, Aleixo já havia ensinado jiu-jitsu e capoeiragem à polícia civil do Rio.

Em 1916, Aleixo convidou Agenor Sampaio—o futuro Mestre Sinhozinho—para ensinar luta greco-romana na União dos Empregados do Comércio no centro do Rio. Essa colaboração colocou duas das mais importantes figuras pioneiras da capoeira carioca no mesmo espaço institucional.

Em 1920, Aleixo e o jornalista Raul Pederneiras abriram uma escola de capoeiragem em uma das salas do Club Gymnástico Português. O jornal sorocabano Cruzeiro do Sul noticiou sua intenção: "O dr. Raul Pederneiras e o professor Mario Aleixo pretendem fundar no Rio uma escola para o ensino de um desporto genuinamente brasileiro: a capoeiragem". Pederneiras, que já havia ensinado jiu-jitsu e capoeiragem à polícia civil do Rio, era um fervoroso defensor intelectual da capoeira como elemento de identidade nacional.

Em 13 de março de 1920, o jornal O Jornal documentou um festival esportivo onde Aleixo e Sinhozinho se apresentaram. O programa incluía: "Defesa e ataque pessoal—professor Mário Aleixo versus Ernesto Goétte" e "Ginástica brasileira (Capoeiragem)—professor Agenor Sampaio versus Lincoln Coimbra". As apresentações foram dirigidas pelos "professores Mário Aleixo, Gustavo Senna e Agenor Sampaio".

A abordagem de Aleixo de mesclar capoeira com jiu-jitsu—que ele chamava de "capo-jitsu"—fez dele um atleta singularmente inovador, demonstrando capacidade de adaptação de acordo com cada oponente. Ele combinou técnicas de capoeira em pé com trabalho de solo do jiu-jitsu, criando talvez o primeiro sistema de luta brasileiro verdadeiramente híbrido.

No entanto, o projeto de capo-jitsu de Aleixo enfrentou um revés decisivo. No início dos anos 1930, ele enfrentou George Gracie em uma luta de Vale Tudo no Theatro Republica no Rio de Janeiro. A luta foi predominantemente disputada no chão, onde Gracie dominou. Aleixo perdeu, supostamente por chave de braço no segundo round. A derrota veio em um contexto onde capoeiristas eram forçados a usar quimonos—vestimentas desconhecidas que anulavam muito de sua vantagem em pé.

A derrota para os Gracies teve implicações mais amplas. A derrota de Aleixo, combinada com as derrotas de seus alunos e outros capoeiristas para praticantes de jiu-jitsu, ajudou a solidificar a reputação do Jiu-Jitsu Gracie como um sistema eficaz de defesa pessoal. O experimento do capo-jitsu foi efetivamente abandonado.

Mestre Bimba está documentado como tendo estudado os métodos de vários professores de capoeira do Rio de Janeiro, incluindo Mário Aleixo, Sinhozinho e Zuma, que misturavam capoeira com artes marciais como judô, boxe, luta greco-romana e jogo do pau português. Embora a natureza exata e o momento dessa influência permaneçam incertos, a abordagem híbrida de Aleixo pode ter contribuído para a evolução da Capoeira Regional.

Apesar de suas notáveis realizações—primeiro professor brasileiro de jiu-jitsu, artista marcial híbrido pioneiro, colaborador em uma das primeiras escolas formais de capoeira do Brasil—Mário Aleixo caiu na obscuridade histórica após sua derrota para os Gracies. Sua data exata de morte permanece desconhecida.',
  -- achievements_en
  E'First Brazilian to teach jiu-jitsu professionally (1913, Centro Sportivo do Engenho Velho); Co-founded first capoeira course (Escola de Ginástica Nacional, 1916) with Raphael Lóthus; Opened capoeiragem school at Club Gymnástico Português with Raul Pederneiras (1920); Taught martial arts to Guarda Civil of Rio de Janeiro (1915, 15 students); Taught jiu-jitsu and capoeiragem to Rio civil police; Pioneered "capo-jitsu" hybrid fighting system combining capoeira with jiu-jitsu; Collaborated with Sinhozinho on capoeiragem exhibitions (1920); Invited Sinhozinho to teach at União dos Empregados do Comércio (1916); Influenced Mestre Bimba''s development of Capoeira Regional',
  -- achievements_pt
  E'Primeiro brasileiro a ensinar jiu-jitsu profissionalmente (1913, Centro Sportivo do Engenho Velho); Co-fundou primeiro curso de capoeira (Escola de Ginástica Nacional, 1916) com Raphael Lóthus; Abriu escola de capoeiragem no Club Gymnástico Português com Raul Pederneiras (1920); Ensinou artes marciais à Guarda Civil do Rio de Janeiro (1915, 15 alunos); Ensinou jiu-jitsu e capoeiragem à polícia civil do Rio; Pioneiro do sistema híbrido de luta "capo-jitsu" combinando capoeira com jiu-jitsu; Colaborou com Sinhozinho em exibições de capoeiragem (1920); Convidou Sinhozinho para ensinar na União dos Empregados do Comércio (1916); Influenciou o desenvolvimento da Capoeira Regional de Mestre Bimba',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1885, decade):
If teaching jiu-jitsu professionally in 1913, likely 25-35 years old at the time.
If "consolidated in capoeira" before learning jiu-jitsu from Miyako, adds more years.
Estimate: ~1885 (range: 1878-1890).

DEATH YEAR:
Unknown. After his defeat to George Gracie in the early 1930s, Aleixo faded from historical record. No obituary or death notice found.

NAME:
Full name appears to be simply "Mário Aleixo". No middle name or surname found in sources.

TITLE:
Referred to as "professor" in newspaper accounts. Never held formal capoeira mestre title.

TEACHERS:
- Raphael Lóthus (capoeiragem methodology)
- Sada Miyako (jiu-jitsu)
- Fencing instructor(s) unknown

STUDENTS/COLLABORATORS:
- Sinhozinho worked with him on 1920 exhibitions
- 15 Guarda Civil officers (1915)
- Rio civil police officers

TEACHING LOCATIONS:
- Centro Sportivo do Engenho Velho (1913): jiu-jitsu
- Club de Regatas Boqueirão do Passeio (Sept 8, 1914): fencing, jiu-jitsu
- União dos Empregados do Comércio (1916): collaborated with Sinhozinho
- Club Gymnástico Português (1920): capoeiragem school with Raul Pederneiras
- Academy in northern Rio (1920): taught capoeira and jiu-jitsu

MEDIA APPEARANCES:
- March 13, 1920: O Jornal sports festival, "Personal defence and attack" vs Ernesto Goétte

GEORGE GRACIE FIGHT (early 1930s):
Lost Vale Tudo match at Theatro Republica, Rio de Janeiro.
Result: Armlock, second round (per simonbjj.com).
Note: Some chronological inconsistencies exist in sources.

INFLUENCE ON BIMBA:
Multiple sources document that Bimba studied methods of Sinhozinho, Mário Aleixo, and Zuma.

CAPO-JITSU PROJECT:
His hybrid system combining capoeira with jiu-jitsu. Defeated in ring matches where fighters wore kimonos. Project abandoned after losses to Gracie family practitioners.

RAPHAEL LÓTHUS CONNECTION:
Co-founded Escola de Ginástica Nacional (1916). Lóthus was later forgotten due to humble origins and violent death (homicide followed by suicide).

NOTE ON SADA MIYAKO:
Miyako (birth name Saku Miura) arrived Rio de Janeiro December 16, 1908 on Brazilian Navy ship Benjamin Constant. Taught at Navy until 1912. Famous for losing to capoeirista Cyriaco on May 1, 1909.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1885, década):
Se ensinava jiu-jitsu profissionalmente em 1913, provavelmente tinha 25-35 anos na época.
Se "consolidado na capoeira" antes de aprender jiu-jitsu com Miyako, adiciona mais anos.
Estimativa: ~1885 (faixa: 1878-1890).

ANO DE MORTE:
Desconhecido. Após sua derrota para George Gracie no início dos anos 1930, Aleixo desapareceu do registro histórico. Nenhum obituário ou nota de falecimento encontrada.

NOME:
Nome completo parece ser simplesmente "Mário Aleixo". Nenhum nome do meio ou sobrenome encontrado nas fontes.

TÍTULO:
Referido como "professor" em relatos de jornais. Nunca deteve título formal de mestre de capoeira.

PROFESSORES:
- Raphael Lóthus (metodologia de capoeiragem)
- Sada Miyako (jiu-jitsu)
- Instrutor(es) de esgrima desconhecido(s)

ALUNOS/COLABORADORES:
- Sinhozinho trabalhou com ele nas exibições de 1920
- 15 oficiais da Guarda Civil (1915)
- Oficiais da polícia civil do Rio

LOCAIS DE ENSINO:
- Centro Sportivo do Engenho Velho (1913): jiu-jitsu
- Club de Regatas Boqueirão do Passeio (8 set 1914): esgrima, jiu-jitsu
- União dos Empregados do Comércio (1916): colaborou com Sinhozinho
- Club Gymnástico Português (1920): escola de capoeiragem com Raul Pederneiras
- Academia no norte do Rio (1920): ensinou capoeira e jiu-jitsu

APARIÇÕES NA MÍDIA:
- 13 de março de 1920: festival esportivo O Jornal, "Defesa e ataque pessoal" vs Ernesto Goétte

LUTA GEORGE GRACIE (início dos anos 1930):
Perdeu luta de Vale Tudo no Theatro Republica, Rio de Janeiro.
Resultado: Chave de braço, segundo round (segundo simonbjj.com).
Nota: Existem algumas inconsistências cronológicas nas fontes.

INFLUÊNCIA EM BIMBA:
Múltiplas fontes documentam que Bimba estudou métodos de Sinhozinho, Mário Aleixo e Zuma.

PROJETO CAPO-JITSU:
Seu sistema híbrido combinando capoeira com jiu-jitsu. Derrotado em lutas de ringue onde lutadores usavam quimono. Projeto abandonado após derrotas para praticantes da família Gracie.

CONEXÃO COM RAPHAEL LÓTHUS:
Co-fundou Escola de Ginástica Nacional (1916). Lóthus foi posteriormente esquecido devido a origens humildes e morte violenta (homicídio seguido de suicídio).

NOTA SOBRE SADA MIYAKO:
Miyako (nome de nascimento Saku Miura) chegou ao Rio de Janeiro em 16 de dezembro de 1908 no navio da Marinha Brasileira Benjamin Constant. Ensinou na Marinha até 1912. Famoso por perder para o capoeirista Cyriaco em 1º de maio de 1909.'
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
