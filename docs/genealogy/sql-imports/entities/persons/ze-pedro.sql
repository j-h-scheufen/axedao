-- ============================================================
-- GENEALOGY PERSON: Zé Pedro
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1940, decade precision):
-- Born in Santa Rita, Paraíba. Arrived in Rio at age 6 after
-- losing his father. Enlisted in Navy lying about his age to
-- survive (suggests mid-teens). Competed on TV Continental luta
-- livre (existed until 1972). PMERJ soldier from 1975. Obtained
-- Law degree after age 30. Promoted to Commander (Major), which
-- typically requires 20+ years service. Co-founded BOPE. If he
-- was ~35 in 1975, birth would be ~1940.
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
  'José Pedro da Silva',
  'Zé Pedro',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-ze-pedro/', 'https://capoeirahistory.com/the-roda-at-ze-pedros/']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Zé Pedro was renowned as a main exponent of the "hard style" capoeira in Rio de Janeiro. His fighting approach combined ginga, kicks, and hard game—incorporating techniques from his Vale Tudo and Brazilian Jiu-Jitsu backgrounds. Mestre Paulão Muzenza recalled: "Mestre Zé Pedro played a highly bellicose capoeira." His roda was known for full-contact games where "kicks and headbutts were carried out with full contact," to the point that inexperienced capoeiristas would only observe or enter at the very beginning or end. Despite the intensity, there was a philosophy of no lasting enmities—"capoeira is capoeira"—with confraternization after rodas.',
  E'Zé Pedro era reconhecido como um dos principais expoentes da capoeira "estilo duro" no Rio de Janeiro. Sua abordagem de luta combinava ginga, chutes e jogo duro—incorporando técnicas de seus conhecimentos de Vale Tudo e Jiu-Jitsu Brasileiro. Mestre Paulão Muzenza lembrou: "Mestre Zé Pedro jogava uma capoeira muito belicosa." Sua roda era conhecida por jogos de contato pleno onde "chutes e cabeçadas eram desferidos com contato total," ao ponto de capoeiristas inexperientes apenas observarem ou entrarem no início ou no final. Apesar da intensidade, havia uma filosofia de não haver inimizades duradouras—"capoeira é capoeira"—com confraternização após as rodas.',
  -- Life dates
  1940,
  'decade'::genealogy.date_precision,
  'Santa Rita, Paraíba, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'José Pedro da Silva, known as Mestre Zé Pedro, was born in the city of Santa Rita, in the northeastern state of Paraíba. After losing his father at a young age, he arrived in Rio de Janeiro at just six years old. Destitute, he nonetheless managed to become literate by age eight and persevered with his education throughout his life. To survive, he enlisted in the Brazilian Navy as a sailor, lying about his age to be accepted.

Zé Pedro''s capoeira education began at the academy of Mário Buscapé, leader of the legendary Capoeiras do Bonfim group. There he developed his skills with the berimbau—an instrument he took great pride in playing—and became a singer with profound knowledge of chulas and other capoeira songs. At Mário Buscapé''s academy, he also met Mestre Paulão Muzenza and Mestre Mintirinha, who would become lifelong companions in capoeira.

Beyond capoeira, Zé Pedro distinguished himself as a fighter. He competed in freestyle fighting contests (luta livre) broadcast on TV Continental (Canal 9, which existed until 1972), claiming he "never lost a fight in Vale Tudo." He also achieved a black belt in Brazilian Jiu-Jitsu, awarded by the legendary Hélio Gracie, who reportedly called him a "golden boy."

His teaching career began when he opened his first academy on Rua Cândido Benício in the Jacarepaguá neighborhood, sharing the space for a time with Mestre Mintirinha. There he founded his first group, Pequenos Libertadores ("Little Freedom Fighters")—a name that caused complications during the military dictatorship, leading to questioning by the DOI-CODI.

In the early 1970s, Zé Pedro established what would become his most famous venue: an academy on the first floor (sobreloja) of Rua Uranos, 497, in Bonsucesso. Teaching initially under the group name Filhos de Amaralina, he later renamed it Guaiamus e Nagoas in homage to two rival capoeira gangs that had existed in 19th-century Rio de Janeiro. He shared this space with his good friend Mestre Artur Emídio, another Bahian pioneer.

The Sunday roda at Zé Pedro''s academy, which ran from 1973 to 1979, became one of the most famous capoeira events in Rio de Janeiro during the 1970s. Led by a single berimbau—typically with Zé Pedro playing, accompanied by Baiano da Bonfim on tambourine and Baianinho da Bonfim on a second berimbau—the roda attracted the most skilled capoeiristas of the era. According to Mestre Valdir Sales: "His roda only had bambas, tough guys." Regular participants included mestres Artur Emídio, Leopoldina, Mintirinha, Paulão Muzenza, Paulo Gomes, Camisa, Gato, Peixinho, Moraes, Dentinho, Touro, Celso, Silas, and many others. Capoeiristas traveled from Brasília, São Paulo, and Bahia to play there.

The Senzala Group specifically visited rodas of masters including Zé Pedro, Artur Emídio, Roque, and Celso de Pilares as part of developing their training methodology. Members recall these visits as "real training labs" that strengthened their approach.

The academy gained international exposure through a contract with RioTour, the official Tourism Board of Rio de Janeiro, which listed it on the tourism events calendar for the whole world. This helped establish Zé Pedro''s roda as a core reference point in the development of contemporary capoeira.

Paulão Muzenza, Zé Pedro''s great friend and constant companion in rodas and life, encouraged his advancement with the phrase: "we are not born to be soldiers, we have to move upwards." Zé Pedro took this advice to heart, eventually passing the examination to enter the Military Police of Rio de Janeiro (PMERJ). He obtained a Law degree after age thirty and completed specialized combat training at the Jungle War Instruction Centre (CIG) in Manaus, Amazonas. His military career culminated in promotion to Commander (Major), and he was one of the founders of BOPE (Batalhão de Operações Especiais), the elite special operations unit that became legendary.

In 1979, Zé Pedro made the decision to stop teaching capoeira, dedicating himself entirely to his career in the PMERJ. As he put it, he followed the "call from life" to study and advance. His advanced students at that time included Paulinho Guaiamum, Alfredo, Célio, Élcio, Valmir, Murilo, and Luiz Peito Queimado.

Zé Pedro''s legacy endures through the countless capoeiristas who passed through his legendary roda, through his contribution to the formation of Contemporary Capoeira in Rio de Janeiro, and through his example of personal advancement through merit—he claimed to have never relied on patronage or clientelism throughout his entire military career.',
  -- bio_pt
  E'José Pedro da Silva, conhecido como Mestre Zé Pedro, nasceu na cidade de Santa Rita, no estado da Paraíba. Após perder o pai ainda jovem, chegou ao Rio de Janeiro com apenas seis anos de idade. Desamparado, conseguiu ainda assim alfabetizar-se aos oito anos e perseverou com sua educação ao longo da vida. Para sobreviver, alistou-se na Marinha do Brasil como marinheiro, mentindo sobre a idade para ser aceito.

A educação capoeirística de Zé Pedro começou na academia de Mário Buscapé, líder do lendário grupo Capoeiras do Bonfim. Lá desenvolveu suas habilidades com o berimbau—instrumento que tinha muito orgulho de tocar—e tornou-se cantor com profundo conhecimento de chulas e outras canções de capoeira. Na academia de Mário Buscapé, também conheceu Mestre Paulão Muzenza e Mestre Mintirinha, que se tornariam companheiros de toda uma vida na capoeira.

Além da capoeira, Zé Pedro destacou-se como lutador. Competiu em concursos de luta livre transmitidos pela TV Continental (Canal 9, que existiu até 1972), alegando que "nunca perdeu uma luta no Vale Tudo". Também conquistou faixa preta em Jiu-Jitsu Brasileiro, concedida pelo lendário Hélio Gracie, que supostamente o chamava de "menino de ouro".

Sua carreira de ensino começou quando abriu sua primeira academia na Rua Cândido Benício, no bairro de Jacarepaguá, dividindo o espaço por um tempo com Mestre Mintirinha. Ali fundou seu primeiro grupo, Pequenos Libertadores—nome que causou complicações durante a ditadura militar, levando a interrogatórios pelo DOI-CODI.

No início dos anos 1970, Zé Pedro estabeleceu o que se tornaria seu local mais famoso: uma academia na sobreloja da Rua Uranos, 497, em Bonsucesso. Ensinando inicialmente sob o nome Filhos de Amaralina, depois renomeou para Guaiamus e Nagoas em homenagem a duas gangues rivais de capoeira que existiram no Rio de Janeiro do século XIX. Ele compartilhava este espaço com seu grande amigo Mestre Artur Emídio, outro pioneiro baiano.

A roda de domingo na academia de Zé Pedro, que funcionou de 1973 a 1979, tornou-se um dos eventos de capoeira mais famosos do Rio de Janeiro durante os anos 1970. Conduzida por um único berimbau—tipicamente com Zé Pedro tocando, acompanhado por Baiano da Bonfim no pandeiro e Baianinho da Bonfim em um segundo berimbau—a roda atraía os capoeiristas mais habilidosos da época. Segundo Mestre Valdir Sales: "A roda dele só tinha bamba, cara duro." Participantes regulares incluíam mestres Artur Emídio, Leopoldina, Mintirinha, Paulão Muzenza, Paulo Gomes, Camisa, Gato, Peixinho, Moraes, Dentinho, Touro, Celso, Silas e muitos outros. Capoeiristas viajavam de Brasília, São Paulo e Bahia para jogar lá.

O Grupo Senzala especificamente visitava rodas de mestres incluindo Zé Pedro, Artur Emídio, Roque e Celso de Pilares como parte do desenvolvimento de sua metodologia de treinamento. Os membros lembram dessas visitas como "verdadeiros laboratórios de treinamento" que fortaleceram sua abordagem.

A academia ganhou exposição internacional através de um contrato com a RioTur, o órgão oficial de Turismo do Rio de Janeiro, que a listava no calendário de eventos turísticos para o mundo todo. Isso ajudou a estabelecer a roda de Zé Pedro como um ponto de referência central no desenvolvimento da capoeira contemporânea.

Paulão Muzenza, grande amigo de Zé Pedro e companheiro constante nas rodas e na vida, encorajou seu avanço com a frase: "não nascemos para ser soldados, temos que subir". Zé Pedro levou este conselho a sério, eventualmente passando no exame para entrar na Polícia Militar do Rio de Janeiro (PMERJ). Obteve diploma de Direito após os trinta anos e completou treinamento especializado de combate no Centro de Instrução de Guerra na Selva (CIG) em Manaus, Amazonas. Sua carreira militar culminou na promoção a Comandante (Major), e foi um dos fundadores do BOPE (Batalhão de Operações Especiais), a unidade de elite de operações especiais que se tornou lendária.

Em 1979, Zé Pedro tomou a decisão de parar de ensinar capoeira, dedicando-se inteiramente à sua carreira na PMERJ. Como ele disse, seguiu o "chamado da vida" para estudar e avançar. Seus alunos avançados naquela época incluíam Paulinho Guaiamum, Alfredo, Célio, Élcio, Valmir, Murilo e Luiz Peito Queimado.

O legado de Zé Pedro perdura através dos incontáveis capoeiristas que passaram por sua lendária roda, através de sua contribuição para a formação da Capoeira Contemporânea no Rio de Janeiro, e através de seu exemplo de avanço pessoal por mérito—ele afirmou nunca ter dependido de patronagem ou clientelismo ao longo de toda sua carreira militar.',
  -- achievements_en
  E'Founded Grupo Guaiamus e Nagoas (early 1970s); Led legendary Sunday roda in Bonsucesso (1973-1979)—key reference point in Rio capoeira; RioTour contract listed academy on worldwide tourism calendar; Vale Tudo fighter (undefeated); Brazilian Jiu-Jitsu black belt from Hélio Gracie; Co-founder of BOPE (Batalhão de Operações Especiais) of PMERJ; Rose to rank of Commander (Major) in PMERJ; Law degree obtained after age 30; Combat specialist trained at Jungle War Instruction Centre (CIG) in Manaus; Proficient berimbau player and singer of chulas',
  -- achievements_pt
  E'Fundou Grupo Guaiamus e Nagoas (início dos anos 1970); Liderou lendária roda de domingo em Bonsucesso (1973-1979)—ponto de referência chave na capoeira do Rio; Contrato com RioTur listava academia no calendário turístico mundial; Lutador de Vale Tudo (invicto); Faixa preta de Jiu-Jitsu Brasileiro por Hélio Gracie; Cofundador do BOPE (Batalhão de Operações Especiais) da PMERJ; Alcançou posto de Comandante (Major) na PMERJ; Diploma de Direito obtido após os 30 anos; Especialista em combate treinado no Centro de Instrução de Guerra na Selva (CIG) em Manaus; Tocador proficiente de berimbau e cantor de chulas',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1940, decade):
Born in Santa Rita, Paraíba. Arrived Rio at age 6 after father''s death. Enlisted in Navy lying about age (suggests mid-teens). Competed on TV Continental luta livre (existed until 1972). PMERJ soldier from 1975. Obtained Law degree after age 30. Promoted to Commander (Major) requiring 20+ years service. Co-founded BOPE. If ~35 in 1975, birth ~1940. No exact date found in sources.

TEACHERS:
- Mário Buscapé (Mário dos Santos, 1934-2021) - Primary teacher at Capoeiras do Bonfim; learned berimbau and chulas there; met Paulão Muzenza and Mintirinha

OTHER MARTIAL ARTS:
- Vale Tudo: Competed on TV Continental (until 1972); claimed undefeated record
- Brazilian Jiu-Jitsu: Black belt from Hélio Gracie (called him "golden boy")

ACADEMY LOCATIONS:
1. Rua Cândido Benício, Jacarepaguá - First academy; shared with Mintirinha; group "Pequenos Libertadores" (caused problems with DOI-CODI during dictatorship)
2. Rua Uranos 497 (sobreloja), Bonsucesso - Main academy; shared with Artur Emídio; groups "Filhos de Amaralina" then "Guaiamus e Nagoas"

RODA (1973-1979):
- Every Sunday, 10 AM
- Led by single berimbau
- Orchestra: Zé Pedro (berimbau), Baiano da Bonfim (tambourine), Baianinho da Bonfim (berimbau)
- RioTour contract = international tourism exposure

ADVANCED STUDENTS:
Paulinho Guaiamum, Alfredo, Célio, Élcio, Valmir, Murilo, Luiz Peito Queimado

RODA PARTICIPANTS (documented):
Artur Emídio, Leopoldina, Mintirinha, Paulão Muzenza, Paulo Gomes, Camisa (Senzala), Gato (Senzala), Peixinho, Moraes, Dentinho, Touro, Celso, Silas, Nilson Arerê, Khorvo, Luiz Malhado, Macaco Preto, Paulinho Godoi, Itamar, Anzol, Corvinho, Amarelinho, Garrinchinha

MILITARY CAREER:
- Navy sailor (youth, lied about age)
- Military Police Federal District soldier
- PMERJ soldier from 1975
- Combat training at CIG (Jungle War Instruction Centre), Manaus
- Law degree after age 30
- Promoted to Commander (Major)
- Co-founded BOPE (Batalhão de Operações Especiais)

GROUP NAME "GUAIAMUS E NAGOAS":
Homage to two rival capoeira gangs in 19th century Rio de Janeiro. The Guaiamus and Nagoas (also Guayamús/Nag{aos) were competing maltas whose rivalry is documented in historical records.',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1940, década):
Nasceu em Santa Rita, Paraíba. Chegou ao Rio aos 6 anos após morte do pai. Alistou-se na Marinha mentindo sobre idade (sugere adolescência). Competiu na TV Continental luta livre (existiu até 1972). Soldado PMERJ desde 1975. Obteve diploma de Direito após 30 anos. Promovido a Comandante (Major) requerendo 20+ anos de serviço. Cofundou BOPE. Se ~35 em 1975, nascimento ~1940. Nenhuma data exata encontrada nas fontes.

MESTRES:
- Mário Buscapé (Mário dos Santos, 1934-2021) - Mestre principal nos Capoeiras do Bonfim; aprendeu berimbau e chulas lá; conheceu Paulão Muzenza e Mintirinha

OUTRAS ARTES MARCIAIS:
- Vale Tudo: Competiu na TV Continental (até 1972); alegou recorde invicto
- Jiu-Jitsu Brasileiro: Faixa preta de Hélio Gracie (chamava-o de "menino de ouro")

LOCAIS DAS ACADEMIAS:
1. Rua Cândido Benício, Jacarepaguá - Primeira academia; compartilhada com Mintirinha; grupo "Pequenos Libertadores" (causou problemas com DOI-CODI durante ditadura)
2. Rua Uranos 497 (sobreloja), Bonsucesso - Academia principal; compartilhada com Artur Emídio; grupos "Filhos de Amaralina" depois "Guaiamus e Nagoas"

RODA (1973-1979):
- Todo domingo, 10h
- Conduzida por um único berimbau
- Orquestra: Zé Pedro (berimbau), Baiano da Bonfim (pandeiro), Baianinho da Bonfim (berimbau)
- Contrato RioTur = exposição turística internacional

ALUNOS AVANÇADOS:
Paulinho Guaiamum, Alfredo, Célio, Élcio, Valmir, Murilo, Luiz Peito Queimado

PARTICIPANTES DA RODA (documentados):
Artur Emídio, Leopoldina, Mintirinha, Paulão Muzenza, Paulo Gomes, Camisa (Senzala), Gato (Senzala), Peixinho, Moraes, Dentinho, Touro, Celso, Silas, Nilson Arerê, Khorvo, Luiz Malhado, Macaco Preto, Paulinho Godoi, Itamar, Anzol, Corvinho, Amarelinho, Garrinchinha

CARREIRA MILITAR:
- Marinheiro na Marinha (juventude, mentiu sobre idade)
- Soldado Polícia Militar Distrito Federal
- Soldado PMERJ desde 1975
- Treinamento de combate no CIG (Centro de Instrução de Guerra na Selva), Manaus
- Diploma de Direito após 30 anos
- Promovido a Comandante (Major)
- Cofundou BOPE (Batalhão de Operações Especiais)

NOME DO GRUPO "GUAIAMUS E NAGOAS":
Homenagem a duas gangues rivais de capoeira no Rio de Janeiro do século XIX. Os Guaiamus e Nagoas (também Guayamús/Nagoas) eram maltas concorrentes cuja rivalidade é documentada em registros históricos.'
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
