-- ============================================================
-- GENEALOGY PERSON: João Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- One of the two principal heirs of Mestre Pastinha. Re-founded
-- Centro Esportivo de Capoeira Angola (CECA) in 1982 after
-- Pastinha's death, preserving the Angola tradition. Taught
-- until his 90s at Forte Santo Antônio, Salvador.
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
  'João Pereira dos Santos',
  'João Pequeno',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Jo%C3%A3o_Pereira_dos_Santos', 'https://ceca-riovermelho.org.br/mestres/mestre-joao-pequeno/?lang=en', 'https://joaopequeno.portalcapoeira.com/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure Capoeira Angola in the tradition of Mestre Pastinha. Emphasized the spiritual and cultural dimensions alongside technique. Known for preserving Pastinha''s authentic teaching methodology and the philosophical foundations of Angola capoeira. Taught that capoeira is a path of self-knowledge, not just physical technique.',
  E'Capoeira Angola pura na tradição de Mestre Pastinha. Enfatizava as dimensões espirituais e culturais junto com a técnica. Conhecido por preservar a metodologia autêntica de ensino de Pastinha e os fundamentos filosóficos da capoeira Angola. Ensinava que a capoeira é um caminho de autoconhecimento, não apenas técnica física.',
  -- Life dates
  1917,
  'exact'::genealogy.date_precision,
  'Araci, Bahia, Brazil',
  2011,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'João Pereira dos Santos was born on December 27, 1917, in Araci, a small town in the interior of Bahia, north of Feira de Santana. His father, Maximiliano Pereira dos Santos, was a cowboy at Fazenda Vargem do Canto; his mother, Maria Clemença de Jesus, was a ceramicist of indigenous descent. Through his father, he was related to the legendary Besouro Mangangá—Besouro was his father''s cousin.

He spent his early years in rural Bahia. In 1933, when he was fifteen, severe drought drove him to flee on foot to Alagoinhas, then to Mata de São João, where he worked for ten years on a sugar cane plantation as a cattle herder. It was there, at Fazenda São Pedro, that a blacksmith named Juvêncio first introduced him to capoeira.

At age 25, with his parents'' permission, João moved to Salvador in January 1943. Working as a bricklayer and streetcar conductor, he found his way back to capoeira through a man named Barbosa, a dock worker who took him to the roda of Mestre Cobrinha Verde in the Chame-Chame neighborhood. One day, a man named Vicente Ferreira Pastinha came announcing he wanted to organize Salvador''s capoeira, inviting everyone to the Bigode, an old soap factory. João went—and his life changed forever.

Shortly after joining Pastinha''s academy, João was promoted to treinel (trainer) around 1945. Pastinha nicknamed him "Cobra Mansa" (Gentle Snake), though he became known as João Pequeno to distinguish him from the taller João Grande. Together with João Grande, he became one of Pastinha''s "two most learned students"—the principal heirs to the Angola tradition.

In 1966, João Pequeno represented Brazil at the Premier Festival des Arts Nègres in Dakar, Senegal, alongside Pastinha, João Grande, Gato Preto, Roberto Satanás, Gildo Alfinete, and Camafeu de Oxossi—a landmark moment in capoeira''s international recognition.

When Pastinha grew blind in his later years, João Pequeno and João Grande ran the academy. Pastinha entrusted his legacy to them, saying in 1970: "They will be the great capoeiras of the future and for this I worked and fought with them and for them. They will be true masters, not improvised teachers."

After Pastinha''s death on November 13, 1981, and the closing of the original CECA at Pelourinho, João Pequeno persevered through these difficult years. On May 2, 1982, he re-founded the Centro Esportivo de Capoeira Angola at Forte Santo Antônio Além do Carmo—a 17th-century military fortress he transformed into a cultural center. Pastinha had told him: "Only the body dies, the spirit lives forever. João, you take care of this."

For nearly three decades, the Forte became a pilgrimage site for capoeiristas worldwide seeking to learn from the source. Into his 90s, João Pequeno continued teaching, embodying Pastinha''s vision of capoeira as a path of self-knowledge and cultural preservation.

Out of 94 years of life, Mestre João Pequeno dedicated 79 of them to capoeira. He died on December 9, 2011, eighteen days before his 94th birthday, leaving behind a lineage that includes many of today''s most prominent Angola mestres.',
  -- Extended content (bio_pt)
  E'João Pereira dos Santos nasceu em 27 de dezembro de 1917, em Araci, uma pequena cidade no interior da Bahia, ao norte de Feira de Santana. Seu pai, Maximiliano Pereira dos Santos, era vaqueiro na Fazenda Vargem do Canto; sua mãe, Maria Clemença de Jesus, era ceramista de descendência indígena. Pelo lado paterno, era parente do lendário Besouro Mangangá—Besouro era primo de seu pai.

Passou seus primeiros anos na Bahia rural. Em 1933, quando tinha quinze anos, uma seca severa o fez fugir a pé para Alagoinhas, depois para Mata de São João, onde trabalhou por dez anos em uma plantação de cana-de-açúcar como vaqueiro. Foi lá, na Fazenda São Pedro, que um ferreiro chamado Juvêncio o apresentou pela primeira vez à capoeira.

Aos 25 anos, com permissão dos pais, João mudou-se para Salvador em janeiro de 1943. Trabalhando como pedreiro e condutor de bonde, reencontrou a capoeira através de um homem chamado Barbosa, um estivador que o levou à roda de Mestre Cobrinha Verde no bairro do Chame-Chame. Um dia, um homem chamado Vicente Ferreira Pastinha veio anunciando que queria organizar a capoeira de Salvador, convidando todos para o Bigode, uma antiga fábrica de sabão. João foi—e sua vida mudou para sempre.

Pouco depois de ingressar na academia de Pastinha, João foi promovido a treinel (instrutor) por volta de 1945. Pastinha o apelidou de "Cobra Mansa," embora ficasse conhecido como João Pequeno para distingui-lo do mais alto João Grande. Junto com João Grande, tornou-se um dos "dois alunos mais preparados" de Pastinha—os principais herdeiros da tradição Angola.

Em 1966, João Pequeno representou o Brasil no Premier Festival des Arts Nègres em Dakar, Senegal, ao lado de Pastinha, João Grande, Gato Preto, Roberto Satanás, Gildo Alfinete e Camafeu de Oxossi—um momento marcante no reconhecimento internacional da capoeira.

Quando Pastinha ficou cego em seus últimos anos, João Pequeno e João Grande dirigiam a academia. Pastinha confiou-lhes seu legado, dizendo em 1970: "Eles serão os grandes capoeiras do futuro e para isso trabalhei e lutei com eles e por eles. Serão mestres mesmo, não professores de improviso."

Após a morte de Pastinha em 13 de novembro de 1981, e o fechamento do CECA original no Pelourinho, João Pequeno perseverou nesses anos difíceis. Em 2 de maio de 1982, refundou o Centro Esportivo de Capoeira Angola no Forte Santo Antônio Além do Carmo—uma fortaleza militar do século XVII que transformou em centro cultural. Pastinha havia lhe dito: "Só o corpo morre, o espírito vive para sempre. João, você cuida disso."

Por quase três décadas, o Forte tornou-se local de peregrinação para capoeiristas do mundo todo que buscavam aprender da fonte. Aos 90 anos, João Pequeno continuava ensinando, incorporando a visão de Pastinha da capoeira como caminho de autoconhecimento e preservação cultural.

De 94 anos de vida, Mestre João Pequeno dedicou 79 deles à capoeira. Faleceu em 9 de dezembro de 2011, dezoito dias antes de completar 94 anos, deixando uma linhagem que inclui muitos dos mestres de Angola mais proeminentes da atualidade.',
  -- Achievements
  E'- Re-founded Centro Esportivo de Capoeira Angola (CECA) at Forte Santo Antônio (1982)
- Represented Brazil at Premier Festival des Arts Nègres, Dakar, Senegal (1966)
- Doctor Honoris Causa from Federal University of Bahia
- Doctor Honoris Causa from Federal University of Uberlândia
- Citizen of Salvador (Municipal Chamber)
- Commander of the Order of Cultural Merit (Brazilian Government, President Lula)
- Grand Master of the Order of Merit of Palmares (Alagoas State)
- Taught capoeira for 79 years, continuing into his 90s
- Trained numerous mestres who spread Angola capoeira worldwide',
  E'- Refundou o Centro Esportivo de Capoeira Angola (CECA) no Forte Santo Antônio (1982)
- Representou o Brasil no Premier Festival des Arts Nègres, Dakar, Senegal (1966)
- Doutor Honoris Causa pela Universidade Federal da Bahia
- Doutor Honoris Causa pela Universidade Federal de Uberlândia
- Cidadão de Salvador (Câmara Municipal)
- Comendador da Ordem do Mérito Cultural (Governo Brasileiro, Presidente Lula)
- Grão-Mestre da Ordem do Mérito dos Palmares (Estado de Alagoas)
- Ensinou capoeira por 79 anos, continuando aos 90 anos
- Formou numerosos mestres que espalharam a capoeira Angola pelo mundo',
  -- Researcher notes (notes_en)
  E'Birth date confirmed as December 27, 1917 across multiple sources (Wikipedia, CECA official site, Portal Capoeira). Death date December 9, 2011 confirmed. Family connection to Besouro Mangangá through father''s side (Besouro was father''s cousin). First capoeira teacher was Juvêncio in Mata de São João, but primary formal training under Pastinha from ~1945. The nickname "Cobra Mansa" was given by Pastinha but "João Pequeno" became the common name to distinguish from João Grande. Sources vary on exact date of treinel promotion (around 1945). Re-founding of CECA dated to May 2, 1982 in multiple sources.',
  E'Data de nascimento confirmada como 27 de dezembro de 1917 em múltiplas fontes (Wikipedia, site oficial do CECA, Portal Capoeira). Data de falecimento 9 de dezembro de 2011 confirmada. Conexão familiar com Besouro Mangangá pelo lado paterno (Besouro era primo do pai). Primeiro professor de capoeira foi Juvêncio em Mata de São João, mas treinamento formal principal com Pastinha a partir de ~1945. O apelido "Cobra Mansa" foi dado por Pastinha mas "João Pequeno" tornou-se o nome comum para distingui-lo de João Grande. Fontes variam sobre data exata da promoção a treinel (por volta de 1945). Refundação do CECA datada de 2 de maio de 1982 em múltiplas fontes.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
