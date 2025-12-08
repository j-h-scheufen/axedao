-- ============================================================
-- GENEALOGY PERSON IMPORT: Cyriaco
-- Generated: 2025-12-08
-- Primary Sources:
--   - Correio da Manhã newspaper, May 19, 1912
--   - O Malho magazine, May 15, 1909
--   - Academic paper: "A construção de um improvável herói esportivo"
--   - https://pt.wikipedia.org/wiki/Cyriaco
-- ============================================================
-- DEPENDENCIES: persons/sinhozinho.sql (Sinhozinho was inspired by Cyriaco's 1909 victory)
-- ============================================================
--
-- BIRTH YEAR (1871, year precision):
-- Academic sources state he was born in 1871 in Campos dos Goytacazes,
-- Rio de Janeiro state. Multiple sources confirm he was 38 years old
-- when he died in 1912, which is consistent with 1871 birth.
--
-- DEATH DATE (May 18, 1912):
-- Sources give conflicting dates: May 18, May 19, or May 21, 1912.
-- Correio da Manhã published obituary on May 19, 1912 titled
-- "Cyriaco, campeão da capoeiragem nacional, falleceu hontem"
-- (died yesterday), indicating May 18. Using that date with year precision.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (upsert pattern for idempotent sync)
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
  'Francisco da Silva Cyríaco',
  'Cyriaco',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[{"type": "website", "url": "https://pt.wikipedia.org/wiki/Cyriaco"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Practiced capoeira carioca (Rio de Janeiro style) in the early 1900s, before the codification of modern styles. Known for mastery of the rabo de arraia (stingray tail kick).',
  'Praticava capoeira carioca no início dos anos 1900, antes da codificação dos estilos modernos. Conhecido pelo domínio do rabo de arraia.',
  -- Life dates
  1871,
  'year'::genealogy.date_precision,
  'Campos dos Goytacazes, Rio de Janeiro, Brazil',
  1912,
  'year'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Francisco da Silva Cyríaco was born in 1871 among the sugar cane fields of Campos dos Goytacazes in northern Rio de Janeiro state—a time when slavery still existed in Brazil. By the early 1900s, he had made his way to the capital, where he worked as a stevedore carrying sacks of coffee from the docks to downtown Rio. In the violent streets of Rio de Janeiro''s belle époque, he earned a reputation as one of the most skilled capoeiristas in Brazil, known by the nickname "Macaco Velho" (Old Monkey).

On May 1, 1909, Cyriaco stepped into the ring at the Pavilhão Internacional of Paschoal Segreto for what many consider the first professional Vale Tudo match in Brazilian history. His opponent was Sada Miyako, a Japanese jiu-jitsu expert hired by the Brazilian Navy to teach hand-to-hand combat to its elite officer corps. Miyako had been challenging all comers to public matches and was considered invincible.

The public practice of capoeira was outlawed by the Republican Criminal Code of 1890, making Cyriaco''s very presence a legal risk. But the medical school students of the National Academy of Medicine in downtown Rio—emboldened by nationalist fervor—had informally "adopted" him, urging him to defend what they had started to regard as a Brazilian combat art. After insistent requests, the law was relaxed. Cyriaco declared: "I am quite confident in my skills. If I have a shot, I will not disappoint you."

He was forced to wear the traditional jiu-jitsu uniform (gi), a measure intended to make the Afro-Brazilian fighter appear "respectable" and "clean" in order to represent the national colors. But inside the ring, Cyriaco fought his way. Using capoeira''s characteristic ginga to keep Miyako off-balance, he evaded a morote gari (double-leg takedown) attempt. Then he struck: a devastating circular kick called rabo de arraia (stingray tail) connected with Miyako''s head and knocked him down. The Japanese fighter rose but was immediately hit with the same kick a second time and knocked unconscious.

The match had lasted mere seconds. The audience erupted. They carried Cyriaco on their shoulders through the streets of the city center, crying: "Asia kneels to Brazil!"

The magazine O Malho ran a headline on May 15, 1909: "Jiu-jitsu versus Capoeira: Cyríaco, the hero." The newspaper A Notícia compared him to Santos Dumont and called him a world champion. Despite capoeira being prohibited, Cyriaco was invited to give demonstrations of his techniques at the Medical School of Rio de Janeiro before groups of academics. He became one of the first Brazilian sports heroes from the popular classes—a symbol of the nascent republic, which needed idols identified with the emerging mestizo nation.

For Miyako, the loss was devastating. He continued performing for a few more weeks, but his reputation never recovered. By June 1909, he had stopped performing entirely.

Cyriaco continued working as a stevedore. Three years after his triumph, on May 18, 1912, he died at age 38 from a cardiac lesion. The Correio da Manhã announced: "Cyriaco, campeão da capoeiragem nacional, falleceu hontem" (Cyriaco, champion of national capoeira, died yesterday). He died with capoeira still outlawed—it would remain so until 1941.

His legacy endured. Watching Cyriaco''s victory at the Pavilhão Internacional inspired young Agenor Moreira Sampaio (later known as Mestre Sinhozinho) to seek out capoeira training on the hill of Santo Antônio. The tradition of capoeiristas proving their art against other fighting styles continued through Sinhozinho, Bimba, and into modern MMA. Today, a community library in his native Campos dos Goytacazes bears his name: Biblioteca Comunitária Francisco da Silva Cyríaco.',
  -- bio_pt
  E'Francisco da Silva Cyríaco nasceu em 1871 nos canaviais de Campos dos Goytacazes, no norte do estado do Rio de Janeiro—uma época em que a escravidão ainda existia no Brasil. No início dos anos 1900, havia chegado à capital, onde trabalhava como estivador carregando sacos de café das docas para o centro do Rio. Nas ruas violentas da belle époque carioca, conquistou reputação como um dos capoeiristas mais habilidosos do Brasil, conhecido pelo apelido de "Macaco Velho".

Em 1º de maio de 1909, Cyriaco entrou no ringue do Pavilhão Internacional de Paschoal Segreto para o que muitos consideram a primeira luta profissional de Vale Tudo na história brasileira. Seu oponente era Sada Miyako, especialista japonês em jiu-jitsu contratado pela Marinha Brasileira para ensinar combate corpo a corpo ao seu corpo de oficiais de elite. Miyako vinha desafiando todos os interessados em lutas públicas e era considerado invencível.

A prática pública da capoeira era proibida pelo Código Penal Republicano de 1890, tornando a própria presença de Cyriaco um risco legal. Mas os estudantes de medicina da Academia Nacional de Medicina no centro do Rio—encorajados pelo fervor nacionalista—o haviam "adotado" informalmente, instando-o a defender o que começavam a considerar uma arte de combate brasileira. Após insistentes pedidos, a lei foi relaxada. Cyriaco declarou: "Estou bastante confiante nas minhas habilidades. Se eu tiver uma chance, não vou decepcionar vocês."

Foi obrigado a vestir o uniforme tradicional de jiu-jitsu (gi), uma medida destinada a fazer o lutador afro-brasileiro parecer "respeitável" e "limpo" para representar as cores nacionais. Mas dentro do ringue, Cyriaco lutou à sua maneira. Usando a ginga característica da capoeira para desequilibrar Miyako, evitou uma tentativa de morote gari (queda de duas pernas). Então atacou: um chute circular devastador chamado rabo de arraia conectou com a cabeça de Miyako e o derrubou. O lutador japonês levantou-se mas foi imediatamente atingido com o mesmo chute uma segunda vez e nocauteado.

A luta durou meros segundos. A plateia explodiu. Carregaram Cyriaco nos ombros pelas ruas do centro da cidade, gritando: "A Ásia se ajoelha perante o Brasil!"

A revista O Malho publicou uma manchete em 15 de maio de 1909: "Jiu-jitsu versus Capoeira: Cyríaco, o herói". O jornal A Notícia o comparou a Santos Dumont e o chamou de campeão mundial. Apesar da capoeira ser proibida, Cyriaco foi convidado a fazer demonstrações de suas técnicas na Faculdade de Medicina do Rio de Janeiro perante grupos de acadêmicos. Tornou-se um dos primeiros heróis esportivos brasileiros das classes populares—um símbolo da nascente república, que precisava de ídolos identificados com a emergente nação mestiça.

Para Miyako, a derrota foi devastadora. Ele continuou se apresentando por mais algumas semanas, mas sua reputação nunca se recuperou. Em junho de 1909, havia parado completamente de se apresentar.

Cyriaco continuou trabalhando como estivador. Três anos após seu triunfo, em 18 de maio de 1912, morreu aos 38 anos de uma lesão cardíaca. O Correio da Manhã anunciou: "Cyriaco, campeão da capoeiragem nacional, falleceu hontem". Morreu com a capoeira ainda proibida—permaneceria assim até 1941.

Seu legado perdurou. Assistir à vitória de Cyriaco no Pavilhão Internacional inspirou o jovem Agenor Moreira Sampaio (mais tarde conhecido como Mestre Sinhozinho) a buscar treinamento de capoeira no morro de Santo Antônio. A tradição de capoeiristas provando sua arte contra outros estilos de luta continuou através de Sinhozinho, Bimba e até o MMA moderno. Hoje, uma biblioteca comunitária em sua terra natal, Campos dos Goytacazes, leva seu nome: Biblioteca Comunitária Francisco da Silva Cyríaco.',
  -- achievements_en
  'Defeated Japanese jiu-jitsu champion Sada Miyako on May 1, 1909 in what is considered the first professional Vale Tudo match in Brazilian history; Featured in O Malho magazine as "Cyriaco, the hero" (May 15, 1909); Compared to Santos Dumont by A Notícia newspaper; Gave demonstrations at the Medical School of Rio de Janeiro; First Brazilian sports hero from the popular classes; Community library in Campos dos Goytacazes named in his honor',
  -- achievements_pt
  'Derrotou o campeão japonês de jiu-jitsu Sada Miyako em 1º de maio de 1909 no que é considerado a primeira luta profissional de Vale Tudo na história brasileira; Destaque na revista O Malho como "Cyriaco, o herói" (15 de maio de 1909); Comparado a Santos Dumont pelo jornal A Notícia; Fez demonstrações na Faculdade de Medicina do Rio de Janeiro; Primeiro herói esportivo brasileiro das classes populares; Biblioteca comunitária em Campos dos Goytacazes nomeada em sua homenagem',
  -- Researcher notes (English)
  E'BIRTH YEAR (1871): Academic sources state he was born in 1871 in Campos dos Goytacazes, Rio de Janeiro state. Multiple sources confirm he was 38 years old when he died in 1912, which is consistent with 1871 birth.

DEATH DATE: Sources give conflicting dates: May 18, May 19, or May 21, 1912. Correio da Manhã published obituary on May 19, 1912 titled "Cyriaco, campeão da capoeiragem nacional, falleceu hontem" (died yesterday), indicating May 18. Using year precision due to uncertainty.

DEATH CAUSE: Cardiac lesion ("lesão cardíaca") per Correio da Manhã. One source mentions uremia but this is unverified.

NICKNAME: "Macaco Velho" (Old Monkey), also simply "Macaco" or "Cyriaco"

BIRTHPLACE CONFUSION: Some sources incorrectly say Campinas, São Paulo. Academic sources confirm Campos dos Goytacazes, Rio de Janeiro state. He was called "Campista" (person from Campos).

TEACHER: Unknown. No sources document who taught Cyriaco capoeira.

FIGHT VENUE: Sources mention both "Concerto Avenida" and "Pavilhão Internacional of Paschoal Segreto" - these may be the same venue or two different events. The main fight was at the Pavilhão.

O MALHO CARTOONS: The magazine published political cartoons using Cyriaco''s victory as metaphor - one shows "Zé Povo" headbutting President Afonso Pena at Catete Palace. This is satirical, not a second fight.

LEGACY: Watching Cyriaco''s victory inspired Sinhozinho to learn capoeira. Library "Biblioteca Comunitária Francisco da Silva Cyríaco" exists in Campos dos Goytacazes.',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1871): Fontes acadêmicas afirmam que nasceu em 1871 em Campos dos Goytacazes, estado do Rio de Janeiro. Múltiplas fontes confirmam que tinha 38 anos quando morreu em 1912, consistente com nascimento em 1871.

DATA DE MORTE: Fontes dão datas conflitantes: 18, 19 ou 21 de maio de 1912. Correio da Manhã publicou obituário em 19 de maio de 1912 intitulado "Cyriaco, campeão da capoeiragem nacional, falleceu hontem", indicando 18 de maio. Usando precisão de ano devido à incerteza.

CAUSA DA MORTE: Lesão cardíaca, segundo o Correio da Manhã. Uma fonte menciona uremia mas não está verificado.

APELIDO: "Macaco Velho", também simplesmente "Macaco" ou "Cyriaco"

CONFUSÃO SOBRE LOCAL DE NASCIMENTO: Algumas fontes incorretamente dizem Campinas, São Paulo. Fontes acadêmicas confirmam Campos dos Goytacazes, estado do Rio de Janeiro. Era chamado de "Campista" (pessoa de Campos).

PROFESSOR: Desconhecido. Nenhuma fonte documenta quem ensinou capoeira a Cyriaco.

LOCAL DA LUTA: Fontes mencionam tanto "Concerto Avenida" quanto "Pavilhão Internacional de Paschoal Segreto" - podem ser o mesmo local ou dois eventos diferentes. A luta principal foi no Pavilhão.

CARTUNS DO O MALHO: A revista publicou cartuns políticos usando a vitória de Cyriaco como metáfora - um mostra "Zé Povo" dando cabeçada no Presidente Afonso Pena no Palácio do Catete. Isto é satírico, não uma segunda luta.

LEGADO: Assistir à vitória de Cyriaco inspirou Sinhozinho a aprender capoeira. Biblioteca "Biblioteca Comunitária Francisco da Silva Cyríaco" existe em Campos dos Goytacazes.'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================
-- No statements can be generated yet:
-- - Cyriaco's teacher is unknown
-- - Sada Miyako is not a capoeirista (opponent only)
-- - Sinhozinho (influenced by Cyriaco) is not yet in the dataset
-- ============================================================

-- ============================================================
-- DISCOVERED ENTITIES (for backlog tracking)
-- ============================================================
--
-- PERSONS (for potential import):
-- - Sinhozinho (Agenor Moreira Sampaio) - inspired by watching Cyriaco's fight
--   to learn capoeira; later became important Rio capoeira figure
--   Status: Should be added to persons backlog
--
-- NON-CAPOEIRA PERSONS (do NOT import):
-- - Sada Miyako - Japanese jiu-jitsu fighter, not a capoeirista
-- - Santos Dumont - aviation pioneer, mentioned as comparison only
-- - President Afonso Pena - political figure in satirical cartoon
--
-- GROUPS: None discovered
-- ============================================================

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/cyriaco.sql',
  NULL,
  ARRAY['persons/sinhozinho.sql']::text[],  -- Sinhozinho was inspired by Cyriaco's 1909 victory
  'First Vale Tudo champion; defeated jiu-jitsu fighter Sada Miyako 1909; capoeira carioca master'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
