-- ============================================================
-- GENEALOGY PERSON IMPORT: Plácido de Abreu
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://capoeirawiki.org/wiki/Pl%C3%A1cido_de_Abreu
--   - https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/
--   - https://www.capoeiranews.com.br/2017/04/placido-de-abreu-um-capoeirista.html
--   - https://cev.org.br/comunidade/capoeira/debate/placido-abreu-morreu-com-heroicidade-amouco/
--   - Carlos Eugênio Líbano Soares, "A Negregada Instituição" (1999), p. 193
-- ============================================================
-- DEPENDENCIES: persons/manduca-da-praia.sql
-- ============================================================
-- NOTES:
-- - Birth date: One source (CEV) gives March 12, 1857; most sources say simply "1857".
--   Using 1857 with 'year' precision as most conservative.
-- - Death date: February 1894 (exact day unknown). Using 'month' precision.
-- - Profile type: Historian/amateur capoeirista - he practiced capoeira in youth but
--   his primary significance is as author of the first book on capoeira.
-- - Pseudonym "Pompeo Steel" - used for literary works.
-- - His second book "Nagôas e Guayamús" is now considered lost.
-- - He was arrested in January 1872 during police crackdowns on capoeira gangs.
-- - He was implicated in the June 1889 assassination attempt on Emperor Pedro II.
-- - He was assassinated by firing squad near Copacabana tunnel, February 1894.
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
  'Plácido de Abreu Morais',
  'Plácido de Abreu',
  NULL,
  NULL,
  '[
    {"type": "website", "url": "https://capoeirawiki.org/wiki/Pl%C3%A1cido_de_Abreu"},
    {"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/"}
  ]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Amateur capoeirista in his youth; participated in Rio de Janeiro capoeira rodas during the 1870s. His primary significance is as historian and chronicler rather than practitioner. Style distinctions (Angola/Regional) did not yet exist in his era.',
  'Capoeirista amador em sua juventude; participou de rodas de capoeira no Rio de Janeiro durante a década de 1870. Sua importância principal é como historiador e cronista, não como praticante. Distinções de estilo (Angola/Regional) ainda não existiam em sua era.',
  -- Life dates
  1857,
  'year'::genealogy.date_precision,
  'Portugal',
  1894,
  'month'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Plácido de Abreu Morais was born in Portugal in 1857 and immigrated to Brazil as a teenager during the 1870s, like many Portuguese seeking economic opportunity in the New World. After arriving in Rio de Janeiro, he found work as a clerk (caixeiro) and later as a typographer in a printing house that published newspapers and small literary works.

Like many young immigrants of his time, Abreu was drawn into the street culture of the city and participated in capoeira rodas, becoming what sources describe as an "amateur capoeirista." In January 1872, during intense police repression led by Ludgero Gonçalves da Silva, he was arrested for investigation regarding a homicide—though the outcome of this case is not recorded.

His contemporary Coelho Neto described him as "a poet, playwright and journalist" and a colleague of noted republican figures Lopes Trovão and Pardal Mallet at the combative newspaper O Combate. Another contemporary described him as "a mix of capoeira fighter, republican activist and writer."

Abreu transitioned from street fighting to literary pursuits, learning typography and writing novels, theatrical pieces, and poetry. His most significant work, Os Capoeiras, was published in 1886 by Tipografia José Alves Editor in Rio de Janeiro. It is considered the first book dedicated entirely to capoeira. The work is divided into two parts: the first is a semi-ethnographic study that functions as a sociological essay on the capoeira scene, and the second is a fictional novella set in the capoeira underworld.

In his introduction, titled "Two Words," Abreu wrote: "When I started this book, my aim was to describe the atrocities committed by capoeiras since ancient times. It is a difficult task to study capoeiragem, from its primitive times, because its origin is not well known."

The book documented the two great rival maltas (gangs) of Rio de Janeiro: the Guaiamús (whose color was red) and the Nagôas (whose color was white). He recorded that the Guaiamú were centered at São Francisco church under the famous chief Leandro Bonaparte, with secondary locations at Santa Rita, Ouro Preto, Marinha, and São Domingos de Gusmão. They trained on Livramento hill at a site called Mango Tree. The Nagôas were centered at Santa Lucia church under the leadership of Manduca da Praia, with secondary locations at São José, Lapa, Santa Ana, Moura, and Bolinha de Prata. They trained at Russell beach and Pinto hill.

Abreu documented how both groups operated hierarchically with chiefs, assistants, "policemen," and rank-and-file soldiers. Training progressed from bare-hand exercises to wooden weapons to live blades, with sessions often becoming bloody. He recorded several murders, including Jorge-Marinha''s killing of a Nagoa member at Rua dos Ourives and subsequent retaliatory deaths of Pinta Preta da Lapa, Jacó, and Alemãozinho.

He also provided an extensive glossary of capoeira slang: distorcer (to disguise), tungar (to wound), lamparina (a slap), chifrada (headbutt), jangada (police jail), and palácio de cristal (detention house).

Notably, Abreu rejected the oral tradition of African origins: "In Africa we do not know capoeiragem, but only some headbutts." He similarly dismissed Indigenous attribution, noting that native peoples lacked the specific attack and defense techniques capoeiras employed. This position is now understood to be incorrect.

Although Abreu had practiced capoeira in his youth, he later denounced it in his writings as a practice associated with criminality and urban violence. His complex relationship with capoeira reflects broader tensions within Brazilian society during the transition from Empire to Republic.

A fervent republican, Abreu collaborated with Sampaio Ferraz on the newspaper Correio do Povo and with Lopes Trovão on O Combate—the same Sampaio Ferraz who, as Chief of Police after 1889, would become the most ruthless persecutor of capoeiras in Brazilian history. Abreu was implicated in the June 1889 assassination attempt against Emperor Pedro II, though the actual attacker was Adriano Augusto do Valle.

His second book, Nagôas e Guayamús, is now considered lost.

After the proclamation of the Republic in November 1889, Abreu grew disillusioned with the authoritarianism of President Floriano Peixoto, who unconstitutionally refused to call elections after assuming power. When the Revolta da Armada broke out in September 1893—a naval revolt led by Admirals Custódio José de Melo and Saldanha da Gama against the regime—Abreu supported the insurgents.

In February 1894, Plácido de Abreu was executed by firing squad near the Copacabana tunnel. According to Coelho Neto''s account, he "died with the heroism of an amouco, shot in the Copacabana tunnel" while walking in darkness. He was betrayed by an officer and shot in the back. Despite weakening from prolonged imprisonment, he attempted to stand after falling against the wall, grinding his teeth as he faced his executioners. Some historians believe his murder was politically motivated due to his activism and opposition to the Floriano regime.

Though he died in obscurity at approximately 37 years of age, Abreu''s work has gained renewed recognition among historians and capoeira scholars. Os Capoeiras remains one of the earliest and most detailed contemporary accounts of capoeira, its practitioners, and its place in Brazilian society at the end of the 19th century—a rare window into the world of the maltas before the republican purge that would scatter them to Fernando de Noronha and drive capoeira underground.',
  -- bio_pt
  E'Plácido de Abreu Morais nasceu em Portugal em 1857 e imigrou para o Brasil ainda adolescente durante a década de 1870, como muitos portugueses em busca de oportunidades econômicas no Novo Mundo. Após chegar ao Rio de Janeiro, encontrou trabalho como caixeiro e depois como tipógrafo em uma casa impressora que publicava jornais e pequenas obras literárias.

Como muitos jovens imigrantes de seu tempo, Abreu foi atraído pela cultura de rua da cidade e participou de rodas de capoeira, tornando-se o que as fontes descrevem como um "capoeirista amador." Em janeiro de 1872, durante intensa repressão policial liderada por Ludgero Gonçalves da Silva, foi preso para investigação sobre um homicídio—embora o resultado deste caso não esteja registrado.

Seu contemporâneo Coelho Neto o descreveu como "poeta, dramaturgo e jornalista" e colega de figuras republicanas notáveis como Lopes Trovão e Pardal Mallet no combativo jornal O Combate. Outro contemporâneo o descreveu como "uma mistura de capoeira, ativista republicano e escritor."

Abreu fez a transição das lutas de rua para atividades literárias, aprendendo tipografia e escrevendo romances, peças teatrais e poesia. Sua obra mais significativa, Os Capoeiras, foi publicada em 1886 pela Tipografia José Alves Editor no Rio de Janeiro. É considerado o primeiro livro dedicado inteiramente à capoeira. A obra é dividida em duas partes: a primeira é um estudo semi-etnográfico que funciona como ensaio sociológico sobre a cena da capoeira, e a segunda é uma novela ficcional ambientada no submundo da capoeira.

Em sua introdução, intitulada "Duas Palavras," Abreu escreveu: "Quando comecei este livro, meu objetivo era descrever as atrocidades cometidas pelos capoeiras desde os tempos antigos. É uma tarefa difícil estudar a capoeiragem, desde seus tempos primitivos, porque sua origem não é bem conhecida."

O livro documentou as duas grandes maltas (gangues) rivais do Rio de Janeiro: os Guaiamús (cuja cor era vermelha) e os Nagôas (cuja cor era branca). Ele registrou que os Guaiamú estavam centrados na igreja de São Francisco sob o famoso chefe Leandro Bonaparte, com locais secundários em Santa Rita, Ouro Preto, Marinha e São Domingos de Gusmão. Treinavam no morro do Livramento em um local chamado Mangueira. Os Nagôas estavam centrados na igreja de Santa Lucia sob a liderança de Manduca da Praia, com locais secundários em São José, Lapa, Santa Ana, Moura e Bolinha de Prata. Treinavam na praia do Russell e no morro do Pinto.

Abreu documentou como ambos os grupos operavam hierarquicamente com chefes, assistentes, "policiais" e soldados rasos. O treinamento progredia de exercícios com as mãos nuas para armas de madeira e lâminas afiadas, com sessões frequentemente se tornando sangrentas. Ele registrou vários assassinatos, incluindo a morte de um membro Nagoa por Jorge-Marinha na Rua dos Ourives e as mortes retaliatórias subsequentes de Pinta Preta da Lapa, Jacó e Alemãozinho.

Ele também forneceu um extenso glossário de gírias da capoeira: distorcer (disfarçar), tungar (ferir), lamparina (um tapa), chifrada (cabeçada), jangada (cadeia da polícia) e palácio de cristal (casa de detenção).

Notavelmente, Abreu rejeitou a tradição oral das origens africanas: "Na África não conhecemos a capoeiragem, mas apenas algumas cabeçadas." Ele similarmente descartou a atribuição indígena, notando que os povos nativos não possuíam as técnicas específicas de ataque e defesa que os capoeiras empregavam. Esta posição é agora entendida como incorreta.

Embora Abreu tenha praticado capoeira em sua juventude, mais tarde a denunciou em seus escritos como uma prática associada à criminalidade e violência urbana. Sua relação complexa com a capoeira reflete tensões mais amplas na sociedade brasileira durante a transição do Império para a República.

Um republicano fervoroso, Abreu colaborou com Sampaio Ferraz no jornal Correio do Povo e com Lopes Trovão no O Combate—o mesmo Sampaio Ferraz que, como Chefe de Polícia após 1889, se tornaria o mais implacável perseguidor de capoeiras da história brasileira. Abreu foi implicado na tentativa de assassinato de junho de 1889 contra o Imperador Pedro II, embora o atacante real fosse Adriano Augusto do Valle.

Seu segundo livro, Nagôas e Guayamús, é agora considerado perdido.

Após a proclamação da República em novembro de 1889, Abreu ficou desiludido com o autoritarismo do Presidente Floriano Peixoto, que inconstitucionalmente se recusou a convocar eleições após assumir o poder. Quando a Revolta da Armada eclodiu em setembro de 1893—uma revolta naval liderada pelos Almirantes Custódio José de Melo e Saldanha da Gama contra o regime—Abreu apoiou os insurgentes.

Em fevereiro de 1894, Plácido de Abreu foi executado por fuzilamento perto do túnel de Copacabana. Segundo o relato de Coelho Neto, ele "morreu com o heroísmo de um amouco, fuzilado no túnel de Copacabana" enquanto caminhava na escuridão. Foi traído por um oficial e baleado pelas costas. Apesar de enfraquecido pelo longo aprisionamento, tentou se levantar após cair contra a parede, rangendo os dentes enquanto enfrentava seus executores. Alguns historiadores acreditam que seu assassinato foi politicamente motivado devido ao seu ativismo e oposição ao regime florianista.

Embora tenha morrido na obscuridade com aproximadamente 37 anos de idade, a obra de Abreu ganhou reconhecimento renovado entre historiadores e estudiosos da capoeira. Os Capoeiras permanece como um dos relatos contemporâneos mais antigos e detalhados da capoeira, seus praticantes e seu lugar na sociedade brasileira no final do século XIX—uma rara janela para o mundo das maltas antes do expurgo republicano que os dispersaria para Fernando de Noronha e levaria a capoeira à clandestinidade.',
  -- achievements_en
  'Author of Os Capoeiras (1886) - the first book dedicated entirely to capoeira; Documented the Nagôas and Guaiamús maltas, their territories, leaders, and organizational structure; Created an extensive glossary of 19th-century capoeira slang; Provided eyewitness accounts of malta violence and training methods; His work is cited by historians including Carlos Eugênio Líbano Soares in A Negregada Instituição; Facilitated modern translations by Mestre Itapoan (Portuguese) and Matthias Röhrig Assunção (English)',
  -- achievements_pt
  'Autor de Os Capoeiras (1886) - o primeiro livro dedicado inteiramente à capoeira; Documentou as maltas Nagôas e Guaiamús, seus territórios, líderes e estrutura organizacional; Criou um extenso glossário de gírias da capoeira do século XIX; Forneceu relatos de testemunha ocular sobre a violência e métodos de treinamento das maltas; Sua obra é citada por historiadores incluindo Carlos Eugênio Líbano Soares em A Negregada Instituição; Facilitou traduções modernas por Mestre Itapoan (português) e Matthias Röhrig Assunção (inglês)',
  -- Researcher notes (English)
  E'BIRTH DATE: 1857 - one source (CEV) gives March 12, 1857; most sources say simply "1857". Using year precision as most conservative.

DEATH DATE: February 1894 (exact day unknown). Executed by firing squad near Copacabana tunnel. Using month precision.

PROFILE TYPE: Historian/amateur capoeirista - he practiced capoeira in youth but his primary significance is as author of the first book on capoeira.

PSEUDONYM: "Pompeo Steel" - used for literary works.

LOST WORK: His second book "Nagôas e Guayamús" is now considered lost.

1872 ARREST: Arrested in January 1872 during police crackdowns on capoeira gangs.

1889 ASSASSINATION ATTEMPT: Implicated in June 1889 assassination attempt on Emperor Pedro II.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 1857 - uma fonte (CEV) dá 12 de março de 1857; maioria das fontes diz simplesmente "1857". Usando precisão de ano como mais conservador.

DATA DE MORTE: Fevereiro de 1894 (dia exato desconhecido). Executado por fuzilamento perto do túnel de Copacabana. Usando precisão de mês.

TIPO DE PERFIL: Historiador/capoeirista amador - praticou capoeira na juventude mas sua importância principal é como autor do primeiro livro sobre capoeira.

PSEUDÔNIMO: "Pompeo Steel" - usado para obras literárias.

OBRA PERDIDA: Seu segundo livro "Nagôas e Guayamús" é agora considerado perdido.

PRISÃO DE 1872: Preso em janeiro de 1872 durante repressões policiais às maltas de capoeira.

TENTATIVA DE ASSASSINATO DE 1889: Implicado na tentativa de assassinato de junho de 1889 contra o Imperador Pedro II.'
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
-- Using ON CONFLICT DO NOTHING for idempotent sync
-- ============================================================

-- --- Person-to-Person: Contemporaries ---

-- Association with Manduca da Praia (exists in dataset)
-- Plácido documented Manduca extensively in Os Capoeiras
INSERT INTO genealogy.statements (
  subject_type,
  subject_id,
  predicate,
  object_type,
  object_id,
  properties,
  confidence,
  source
)
SELECT
  'person',
  pa.id,
  'associated_with',
  'person',
  mp.id,
  '{
    "association_context": {
      "en": "Plácido de Abreu documented Manduca da Praia extensively in Os Capoeiras (1886) as the chief of the Santa Lucia party (Nagôas). As an amateur capoeirista in Rio during the 1870s-1880s, Abreu had insider knowledge of the malta world and documented Manduca''s exploits and leadership.",
      "pt": "Plácido de Abreu documentou Manduca da Praia extensivamente em Os Capoeiras (1886) como o chefe do partido de Santa Lucia (Nagôas). Como capoeirista amador no Rio durante as décadas de 1870-1880, Abreu tinha conhecimento interno do mundo das maltas e documentou as façanhas e liderança de Manduca."
    }
  }'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, Os Capoeiras (1886); CapoeiraWiki; Capoeira History'
FROM genealogy.person_profiles pa, genealogy.person_profiles mp
WHERE pa.apelido = 'Plácido de Abreu'
  AND mp.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (for future imports)
-- ============================================================
-- The following relationships cannot be created yet because
-- the related persons are not in the dataset:
--
-- Leandro Bonaparte:
--   predicate: associated_with
--   properties: { "association_context": "Plácido documented Leandro Bonaparte
--                 as the famous chief of the Saint Francis party (Guaiamú).
--                 Insider knowledge from his time as amateur capoeirista." }
--
-- Jorge Marinha:
--   predicate: associated_with
--   properties: { "association_context": "Plácido documented Jorge Marinha as
--                 chief of the Marinha gang and killer of a Nagoa member at
--                 Rua dos Ourives." }
--
-- Note: Sampaio Ferraz and Lopes Trovão are NOT capoeiristas and should
-- NOT be imported to the genealogy. They are historical figures who
-- interacted with capoeira culture but were not practitioners.
--
-- Note: The maltas Nagôas and Guaiamús are NOT capoeira groups in the modern
-- sense - they were street gangs that used capoeira. They should NOT be
-- imported as groups.

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/placido-de-abreu.sql',
  NULL,
  ARRAY['persons/manduca-da-praia.sql'],
  'First capoeira historian; author of Os Capoeiras (1886)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
