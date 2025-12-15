-- ============================================================
-- GENEALOGY PERSON: Miguel Camisa Preta
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
  'Alfredo Francisco Soares',
  'Miguel Camisa Preta',
  NULL, -- Proto-mestre; no formal title in that era
  NULL, -- No historical portrait known
  ARRAY['https://capoeirahistory.com/black-shirt/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; style distinctions did not exist
  'Pre-codification carioca capoeira. One of the most famous capoeiristas/malandros of early 20th century Rio de Janeiro. Combined capoeira techniques with navalha (razor) fighting, the characteristic combat style of Rio''s street warriors. Also served as cabo eleitoral (electoral agent) in the 1909 elections, continuing the tradition of capoeiristas in political violence.',
  'Capoeira carioca pré-codificação. Um dos mais famosos capoeiristas/malandros do Rio de Janeiro do início do século XX. Combinava técnicas de capoeira com luta de navalha, o estilo de combate característico dos guerreiros de rua do Rio. Também atuou como cabo eleitoral nas eleições de 1909, continuando a tradição de capoeiristas na violência política.',
  -- Life dates
  1878,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  1912,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Alfredo Francisco Soares, known as Miguel Camisa Preta ("Michael Black Shirt") or simply Miguelzinho, was one of the most famous capoeiristas and malandros in Rio de Janeiro during the early twentieth century. Nicknamed the "príncipe dos bambas" (prince of bambas), he left his mark on the history of capoeiras, malandros, and tough guys who populated the bohemian streets of the "Cidade Maravilhosa."

His criminal career is documented from 1902 until his death in 1912. During this period, he embodied the transition from the old capoeira gangs of the Empire—the Nagoas and Guaiamús who had been suppressed after 1889—to the new generation of malandros who continued capoeira traditions in the early Republic despite criminalization. Researchers have studied his trajectory to understand the continuities and ruptures that marked the role of capoeiras as central figures in electoral fraud during republican Rio de Janeiro.

In the 1909 elections for the Municipal Intendence Council, Miguel worked as a cabo eleitoral (electoral agent), a role that capoeiristas had filled since the days of the Empire when gang federations allied with Conservative and Liberal parties to manipulate elections. This political function—using violence and intimidation to influence voting—was a key survival strategy for capoeiristas after the 1890 criminalization.

Miguel''s great friend was the capoeirista Leão do Norte ("Lion of the North"), described as a "tough capoeira from the streets." Around 1911, police officer Elpídio Ribeiro da Rocha killed Leão do Norte. Miguel swore vengeance. The two men confronted each other at least twice before the final encounter. In one previous confrontation, Miguel was shot in the leg and both men ended up at the police station. After recovering, Miguel disappeared from public view for about a year.

On the dawn of Friday, July 12, 1912, Miguel was at Rua Núncio in downtown Rio de Janeiro (today the intersection of Avenida Tomé de Souza and Visconde do Rio Branco), talking with a merchant named Antônio Júlio Xavier. Cabo Elpídio Ribeiro da Rocha appeared, accompanied by Manoel Tibúrcio Garcia. According to the newspapers A Gazeta de Notícias and A Noite, both officers promised the malandro they would not shoot if he raised his hands. As soon as Miguel raised his arms, Elpídio shot him in the head. With his body on the ground, the cabo fired four more shots—into his head again, his left hand, shoulder, and abdomen.

That was the end of the most famous tough guy, bohemian, capoeirista, and malandro who inhabited the streets of Rio de Janeiro at the beginning of the twentieth century. But his story did not end with his death.

Miguel Camisa Preta became a spiritual entity in Umbanda, worshipped in various corners of Brazil. In his "falange" (family of entities), he introduces himself with various names depending on the location: Miguelim do Morro, Mané Soares, and others. Some practitioners distinguish between Malandro Miguel, Malandro Camisa Preta, and Malandro Miguel Camisa Preta as separate entities; others connect him to Zé Pelintra as a spiritual descendant. His mission in the spiritual realm is said to involve helping those struggling with addiction and those caught up in trafficking—using his street wisdom for redemption rather than perdition.',
  -- bio_pt
  E'Alfredo Francisco Soares, conhecido como Miguel Camisa Preta ou simplesmente Miguelzinho, foi um dos mais famosos capoeiristas e malandros do Rio de Janeiro durante o início do século XX. Apelidado de "príncipe dos bambas," deixou sua marca na história dos capoeiras, malandros e valentões que povoavam as ruas boêmias da Cidade Maravilhosa.

Sua carreira criminosa é documentada de 1902 até sua morte em 1912. Durante esse período, ele personificou a transição das antigas gangues de capoeira do Império—os Nagoas e Guaiamús que haviam sido suprimidos após 1889—para a nova geração de malandros que continuavam as tradições da capoeira na República nascente, apesar da criminalização. Pesquisadores estudaram sua trajetória para compreender as continuidades e rupturas que marcaram o papel dos capoeiras como figuras centrais em fraudes eleitorais no Rio de Janeiro republicano.

Nas eleições de 1909 para o Conselho de Intendência Municipal, Miguel trabalhou como cabo eleitoral, função que os capoeiristas exerciam desde os tempos do Império, quando as federações de maltas se aliavam aos partidos Conservador e Liberal para manipular eleições. Essa função política—usar violência e intimidação para influenciar a votação—era uma estratégia fundamental de sobrevivência para os capoeiristas após a criminalização de 1890.

O grande amigo de Miguel era o capoeirista Leão do Norte, descrito como um "capoeira valente das ruas." Por volta de 1911, o policial Elpídio Ribeiro da Rocha matou Leão do Norte. Miguel jurou vingança. Os dois homens se confrontaram pelo menos duas vezes antes do encontro final. Em um confronto anterior, Miguel foi baleado na perna e ambos foram parar na delegacia. Após se recuperar, Miguel desapareceu da vista do público por cerca de um ano.

Na madrugada da sexta-feira, 12 de julho de 1912, Miguel estava na Rua Núncio no centro do Rio de Janeiro (hoje cruzamento da Avenida Tomé de Souza com Visconde do Rio Branco), conversando com um comerciante chamado Antônio Júlio Xavier. O Cabo Elpídio Ribeiro da Rocha apareceu, acompanhado de Manoel Tibúrcio Garcia. Segundo os jornais A Gazeta de Notícias e A Noite, ambos prometeram ao malandro que não atirariam se ele levantasse as mãos. Assim que Miguel levantou os braços, Elpídio atirou em sua cabeça. Com seu corpo no chão, o cabo disparou mais quatro tiros—na cabeça novamente, na mão esquerda, no ombro e no abdômen.

Esse foi o fim do mais famoso valentão, boêmio, capoeirista e malandro que habitou as ruas do Rio de Janeiro no início do século XX. Mas sua história não terminou com sua morte.

Miguel Camisa Preta tornou-se uma entidade espiritual na Umbanda, cultuado em vários cantos do Brasil. Em sua "falange" (família de entidades), ele se apresenta com vários nomes dependendo do local: Miguelim do Morro, Mané Soares, entre outros. Alguns praticantes distinguem entre Malandro Miguel, Malandro Camisa Preta e Malandro Miguel Camisa Preta como entidades separadas; outros o conectam a Zé Pelintra como descendente espiritual. Sua missão no reino espiritual é ajudar aqueles que lutam contra vícios e aqueles envolvidos com tráfico—usando sua sabedoria de rua para redenção em vez de perdição.',
  -- achievements_en
  'Known as "príncipe dos bambas" (prince of bambas) - the most famous malandro in early 20th century Rio de Janeiro; worked as cabo eleitoral (electoral agent) in 1909 elections; elevated to spiritual entity status in Umbanda; subject of academic research on capoeira and electoral fraud',
  -- achievements_pt
  'Conhecido como "príncipe dos bambas" - o mais famoso malandro do Rio de Janeiro no início do século XX; atuou como cabo eleitoral nas eleições de 1909; elevado à categoria de entidade espiritual na Umbanda; objeto de pesquisa acadêmica sobre capoeira e fraude eleitoral',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1878, decade precision): Criminal career documented from 1902 until death in 1912. Known as "príncipe dos bambas," suggesting peak of career by late 1900s. Worked as cabo eleitoral in 1909 elections. If approximately 25-35 during documented criminal period (1902-1912), birth = ~1870-1887. Great friend of Leão do Norte (~1875) suggests similar age. Using 1878 as compromise estimate.

DEATH: July 12, 1912 (exact date). Confirmed by A Noite and A Gazeta de Notícias newspapers. Shot at dawn at Rua Núncio (now Av. Tomé de Souza / Visconde do Rio Branco intersection) in downtown Rio de Janeiro. Shot in head by Cabo Elpídio Ribeiro da Rocha as he raised his arms. Four additional shots fired after he fell (head, left hand, shoulder, abdomen).

NAME VARIATIONS: Alfredo Francisco Soares (baptismal name); Miguel Camisa Preta; Miguelzinho Camisa Preta; "príncipe dos bambas"

KILLER: Cabo Elpídio Ribeiro da Rocha (police officer, Brigada Militar), accompanied by Manoel Tibúrcio Garcia. Elpídio later died in a fire after saving a child.

WITNESS: Antônio Júlio Xavier (merchant Miguel was talking to at time of death)

HISTORICAL CONTEXT: Part of generation of capoeiristas who transitioned from Empire-era gang federations (Nagoas/Guaiamús) to Republican-era malandros after 1889 suppression and 1890 criminalization.

UMBANDA STATUS: Became spiritual entity. Names used: Miguelim do Morro, Mané Soares. Some consider him connected to Zé Pelintra.

RELATIONSHIPS (documented):
- Leão do Norte: "grande amigo" (great friend); killed by Elpídio ~1911; Miguel swore vengeance
- Prata Preta: Contemporary in Rio capoeira/malandro world (1904 era)
- Sete Coroas: Contemporary (~1885-1923), both active in Rio underworld

PREVIOUS CONFRONTATION WITH ELPÍDIO: Shot in leg; both went to police station; Miguel disappeared for ~1 year before final confrontation',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1878, precisão de década): Carreira criminosa documentada de 1902 até a morte em 1912. Conhecido como "príncipe dos bambas," sugerindo auge da carreira no final dos anos 1900. Atuou como cabo eleitoral nas eleições de 1909. Se tinha aproximadamente 25-35 anos durante o período criminoso documentado (1902-1912), nascimento = ~1870-1887. Grande amigo de Leão do Norte (~1875) sugere idade semelhante. Usando 1878 como estimativa de compromisso.

MORTE: 12 de julho de 1912 (data exata). Confirmado pelos jornais A Noite e A Gazeta de Notícias. Baleado na madrugada na Rua Núncio (hoje cruzamento da Av. Tomé de Souza com Visconde do Rio Branco) no centro do Rio de Janeiro. Baleado na cabeça pelo Cabo Elpídio Ribeiro da Rocha ao levantar os braços. Quatro tiros adicionais disparados após cair (cabeça, mão esquerda, ombro, abdômen).

VARIAÇÕES DO NOME: Alfredo Francisco Soares (nome de batismo); Miguel Camisa Preta; Miguelzinho Camisa Preta; "príncipe dos bambas"

ASSASSINO: Cabo Elpídio Ribeiro da Rocha (policial da Brigada Militar), acompanhado de Manoel Tibúrcio Garcia. Elpídio morreu posteriormente em um incêndio após salvar uma criança.

TESTEMUNHA: Antônio Júlio Xavier (comerciante com quem Miguel conversava no momento da morte)

CONTEXTO HISTÓRICO: Parte da geração de capoeiristas que fez a transição das federações de maltas do Império (Nagoas/Guaiamús) para os malandros da era Republicana após a supressão de 1889 e criminalização de 1890.

STATUS NA UMBANDA: Tornou-se entidade espiritual. Nomes usados: Miguelim do Morro, Mané Soares. Alguns o consideram conectado a Zé Pelintra.

RELACIONAMENTOS (documentados):
- Leão do Norte: "grande amigo"; morto por Elpídio ~1911; Miguel jurou vingança
- Prata Preta: Contemporâneo no mundo da capoeira/malandragem do Rio (era de 1904)
- Sete Coroas: Contemporâneo (~1885-1923), ambos ativos no submundo do Rio

CONFRONTO ANTERIOR COM ELPÍDIO: Baleado na perna; ambos foram à delegacia; Miguel desapareceu por ~1 ano antes do confronto final'
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
