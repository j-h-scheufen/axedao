-- ============================================================
-- GENEALOGY PERSON: Nascimento Grande
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
  'José Nascimento da Silva',
  'Nascimento Grande',
  NULL,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Nascimento_Grande', 'https://www.historyoffighting.com/mestre-jose-antonio-do-nascimento.php']::text[],
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s carnival capoeira tradition.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado à tradição carnavalesca de capoeira do Recife.',
  -- Life dates
  1842,
  'year'::genealogy.date_precision,
  'Pernambuco, Brazil',
  1936,
  'year'::genealogy.date_precision,
  'Jacarepaguá, Rio de Janeiro, Brazil',
  -- bio_en
  E'José Nascimento da Silva was the most feared capoeirista in Pernambuco''s history, known simply as "O Capoeira" in his time. His name "Nascimento Grande" (Big Birth) came from his imposing size: 2 meters tall and 120-130 kilograms.

He worked as a stevedore at the Port of Recife, where his immense strength was legendary—he could carry two 60-kilo sacks simultaneously. He always wore a large sloped hat, carried a rubber cape, and wielded a famous 15-kilogram cane he called "a volta" (the return).

Despite his fearsome reputation, contemporaries described him as gentle, courteous, and well-educated with "a Bruce Lee-like gaze"—calm but alert. He was "extremely honest—even his enemies recognized this"—and would "cry like melted butter at the most ordinary things in life".

He was believed to possess "corpo fechado" (closed body), protected by an amulet containing a "Santo Lenço" (Holy Cloth). He attended church regularly and consulted with a Pai de Santo. The press granted him the title "Herói Popular" because he only ever fought in self-defense. He never lost a fight and never refused one.

His fame attracted challengers from across Brazil. During a trip to Rio de Janeiro, he killed the legendary Manezinho Camisa Preta in an epic battle at Largo da Carioca. His most famous rivalry was with João Sabe Tudo, paradoxically also his friend. Their fight at Largo da Paz was stopped by a vicar inside Igreja do Carmo; they shook hands and never fought again, but continued hosting parties together.

Nascimento Grande was part of Recife''s carnival capoeira tradition. The capoeiristas who performed in front of military bands using ginga and kicks eventually transformed these into the "passo"—the dance of frevo. His legacy extends beyond capoeira to Pernambuco''s most famous cultural expression.

He was celebrated by Brazil''s intellectual elite: Gilberto Freyre, José Lins do Rego, Câmara Cascudo, and Gilberto Amado all knew him personally. When he died at 94 in 1936, Gilberto Freyre petitioned the government for an official tribute. The cordel poet João Martins de Ataíde immortalized him: "Nascimento aged / His hair turned white / But his wrinkled face / Never took a blow".

As one source concluded: "Hercules is a myth; Nascimento Grande truly existed".',
  -- bio_pt
  E'José Nascimento da Silva foi o capoeirista mais temido da história de Pernambuco, conhecido simplesmente como "O Capoeira" em seu tempo. Seu nome "Nascimento Grande" veio de seu tamanho imponente: 2 metros de altura e 120-130 quilogramas.

Trabalhava como estivador no Porto do Recife, onde sua imensa força era lendária—podia carregar dois sacos de 60 quilos simultaneamente. Sempre usava um grande chapéu inclinado, carregava uma capa de borracha, e empunhava uma famosa bengala de 15 quilos que chamava de "a volta".

Apesar de sua temível reputação, contemporâneos o descreviam como gentil, cortês e bem-educado com "um olhar à la Bruce Lee"—calmo mas alerta. Era "extremamente honesto—até seus inimigos reconheciam isso"—e "chorava como manteiga derretida pelas coisas mais ordinárias da vida".

Acreditava-se que possuía "corpo fechado", protegido por um amuleto contendo um "Santo Lenço". Frequentava a igreja regularmente e consultava um Pai de Santo. A imprensa concedeu-lhe o título de "Herói Popular" porque só lutava em legítima defesa. Nunca perdeu uma luta e nunca recusou uma.

Sua fama atraía desafiantes de todo o Brasil. Durante uma viagem ao Rio de Janeiro, matou o lendário Manezinho Camisa Preta em uma batalha épica no Largo da Carioca. Sua rivalidade mais famosa foi com João Sabe Tudo, paradoxalmente também seu amigo. Sua luta no Largo da Paz foi interrompida por um vigário dentro da Igreja do Carmo; apertaram as mãos e nunca mais lutaram, mas continuaram dando festas juntos.

Nascimento Grande fazia parte da tradição carnavalesca de capoeira do Recife. Os capoeiristas que se apresentavam na frente das bandas militares usando ginga e chutes eventualmente transformaram estes no "passo"—a dança do frevo. Seu legado se estende além da capoeira para a expressão cultural mais famosa de Pernambuco.

Foi celebrado pela elite intelectual brasileira: Gilberto Freyre, José Lins do Rego, Câmara Cascudo e Gilberto Amado o conheciam pessoalmente. Quando morreu aos 94 anos em 1936, Gilberto Freyre peticionou ao governo por uma homenagem oficial. O poeta de cordel João Martins de Ataíde o imortalizou: "Nascimento envelheceu / Seus cabelos branquearam / Mas seu rosto enrugado / Nunca levou um golpe".

Como concluiu uma fonte: "Hércules é um mito; Nascimento Grande realmente existiu".',
  -- achievements_en
  'Granted title "Herói Popular" by Recife press; Never lost a fight; Killed Manezinho Camisa Preta at Largo da Carioca; Celebrated by Gilberto Freyre, Câmara Cascudo, José Lins do Rego; Immortalized in cordel poetry; His fighting style influenced frevo dance',
  -- achievements_pt
  'Recebeu título de "Herói Popular" pela imprensa do Recife; Nunca perdeu uma luta; Matou Manezinho Camisa Preta no Largo da Carioca; Celebrado por Gilberto Freyre, Câmara Cascudo, José Lins do Rego; Imortalizado em poesia de cordel; Seu estilo de luta influenciou a dança do frevo',
  -- Researcher notes (English)
  E'BIRTH DATE: 1842 - year precision only. Sources confirm he was 94 when he died in 1936.

DEATH DATE: 1936 - year precision only. José Mariano reported his death in Jornal do Commercio, Recife, 20/02/1936.

PHYSICAL DESCRIPTION: 2 meters tall, 120-130 kg. The name "Nascimento Grande" (Big Birth) came from his imposing size.

WEAPON: Famous 15-kilogram cane he called "a volta" (the return).

CORPO FECHADO: Believed to possess magical protection via an amulet containing a "Santo Lenço" (Holy Cloth).

FREVO CONNECTION: Part of Recife''s carnival capoeira tradition. The capoeiristas who performed in front of military bands using ginga and kicks eventually transformed these into the "passo"—the dance of frevo.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 1842 - precisão de ano apenas. Fontes confirmam que tinha 94 anos quando morreu em 1936.

DATA DE MORTE: 1936 - precisão de ano apenas. José Mariano reportou sua morte no Jornal do Commercio, Recife, 20/02/1936.

DESCRIÇÃO FÍSICA: 2 metros de altura, 120-130 kg. O nome "Nascimento Grande" veio de seu tamanho imponente.

ARMA: Famosa bengala de 15 quilos que chamava de "a volta".

CORPO FECHADO: Acreditava-se que possuía proteção mágica via amuleto contendo um "Santo Lenço".

CONEXÃO COM O FREVO: Parte da tradição carnavalesca de capoeira do Recife. Os capoeiristas que se apresentavam na frente das bandas militares usando ginga e chutes eventualmente transformaram estes no "passo"—a dança do frevo.'
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
