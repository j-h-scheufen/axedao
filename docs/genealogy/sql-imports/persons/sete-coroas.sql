-- ============================================================
-- GENEALOGY PERSON IMPORT: Sete Coroas
-- Generated: 2025-12-09
-- Primary Sources:
--   - https://capoeirahistory.com/general/seven-crowns/
--   - https://capoeirahistory.com/the-imprisonment-of-capoeiras-on-ilha-grande/
--   - https://capoeirahistory.com/old-malandros/
--   - https://museubajuba.org/madame-sata-uma-parte-da-historia-pouco-contada/
--   - https://vermelho.org.br/2016/02/05/o-samba-transgressor-e-a-vitoria-do-sete-coroas/
--   - Madame Satã interview, O Pasquim, 1971
-- ============================================================
-- DEPENDENCIES: persons/madame-sata.sql (for student_of relationship)
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1885, decade precision):
-- Madame Satã (b. 1900) said in 1971 that Sete Coroas "met me when I was
-- 9 years old" (i.e., ~1909) and was "the greatest malandro I knew from 1907."
-- Sete Coroas was already an established malandro by 1907, teaching and mentoring.
-- He gained his famous nickname after the 1920 funeral robbery, and by 1920-1923
-- he was well-known and "respected" - suggesting he was in his 30s-40s.
-- If he was 35-40 when he died in 1923, birth = ~1883-1888. Using 1885 as midpoint.
--
-- DEATH: 1923 (confirmed by Madame Satã's interview, multiple sources)
--
-- BAHIAN ORIGIN: Confirmed in Madame Satã's prison memoirs - he was "from Bahia"
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  NULL, -- Full name unknown; known only by apelido
  'Sete Coroas',
  NULL, -- Proto-mestre; informal malandro teacher
  NULL, -- No portrait available
  '[{"type": "website", "url": "https://capoeirahistory.com/general/seven-crowns/"}, {"type": "website", "url": "https://vermelho.org.br/2016/02/05/o-samba-transgressor-e-a-vitoria-do-sete-coroas/"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification; carioca capoeira
  'Carioca capoeira of the First Republic era. Known for combining capoeira techniques with navalha (razor) fighting - the characteristic combat style of Rio''s malandros. Part of the older generation that preserved street capoeira after its criminalization in 1890.',
  'Capoeira carioca da era da Primeira República. Conhecido por combinar técnicas de capoeira com luta de navalha - o estilo de combate característico dos malandros do Rio. Parte da geração mais velha que preservou a capoeira de rua após sua criminalização em 1890.',
  -- Life dates
  1885,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1923,
  'year'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'Sete Coroas was born in Bahia but made his name in the favelas and bohemian underworld of Rio de Janeiro during the First Republic. He settled in Barroso, a locality in Morro da Favela (today''s Morro da Providência)—one of the oldest favelas in Brazil—and became one of the most notorious malandros of his era.

His apelido came from an audacious act in 1920. During a gala funeral for a wealthy citizen, the anonymous favela dweller robbed the procession, stealing everything he could carry—including the seven elaborate flower crowns (coroas) that adorned the coffin. The quantity and quality of the objects stolen earned him a nickname that would soon be known throughout the entire city.

What followed were years of "audacious robberies" that elevated him from police records to newspaper headlines, theatrical performances, and popular songs. The composer Sinhô (José Barbosa da Silva) wrote a samba in his honor in 1921—reportedly the first Brazilian song to explicitly celebrate a "bandido." The press, which had done much to build his fame, began to worry about the precedent.

But Sete Coroas was more than a thief. According to Madame Satã, speaking in 1971, he was "the greatest malandro of Rio de Janeiro that I knew from 1907 until today." Satã continued: "The one who taught me to be a malandro and met me when I was 9 years old was the late Sete Coroas." This places their meeting around 1909, when Satã was a child newly arrived in Rio.

Sete Coroas was a cafetão (pimp) in the Lapa district and a master in what Satã called "the fine art of malandragem": the game, the navalha (razor), the papo (smooth talk), the rasteira (leg sweep), and the valentia (courage/bravado). He transmitted the combat techniques that combined capoeira movements with razor fighting—the characteristic style of Rio''s street warriors. According to sources that document his time at the Dois Rios Correctional Colony on Ilha Grande, Sete Coroas was recognized as a capoeira practitioner among the prisoners.

His companions included Camisa and Benedito—described by one morro leader as "terrible" and actually worse than Sete Coroas himself. All three died during this era. In 1923, when Sete Coroas died, he left Madame Satã as his successor in Lapa and Saúde. The young João Francisco dos Santos would go on to become the most famous malandro in Brazilian history, but he never forgot who taught him.

Sete Coroas achieved something rare: immortalization in popular memory. Beyond the sambas, he was elevated to the realm of Afro-Brazilian religion, becoming an Exu (spirit entity) whose ritual songs are still sung. The black, favela-dwelling outlaw who defied the rich, the police, and the state became a figure of worship.',
  -- bio_pt
  E'Sete Coroas nasceu na Bahia, mas fez seu nome nas favelas e no submundo boêmio do Rio de Janeiro durante a Primeira República. Estabeleceu-se no Barroso, uma localidade do Morro da Favela (atual Morro da Providência)—uma das favelas mais antigas do Brasil—e tornou-se um dos malandros mais notórios de sua época.

Seu apelido veio de um ato audacioso em 1920. Durante um funeral de gala de um cidadão rico, o anônimo morador da favela assaltou a procissão, roubando tudo que podia carregar—incluindo as sete elaboradas coroas de flores que adornavam o caixão. A quantidade e qualidade dos objetos roubados lhe renderam um apelido que logo seria conhecido por toda a cidade.

O que se seguiu foram anos de "assaltos audaciosos" que o elevaram dos registros policiais às manchetes de jornais, espetáculos teatrais e canções populares. O compositor Sinhô (José Barbosa da Silva) fez um samba em sua homenagem em 1921—supostamente a primeira música brasileira a celebrar explicitamente um "bandido". A imprensa, que muito contribuíra para sua fama, começou a se preocupar com o precedente.

Mas Sete Coroas era mais do que um ladrão. Segundo Madame Satã, falando em 1971, ele era "o maior malandro do Rio de Janeiro que eu conheci de 1907 até os dias de hoje." Satã continuou: "O que me ensinou a ser malandro e me conheceu com 9 anos de idade foi o falecido Sete Coroas." Isso situa o encontro deles por volta de 1909, quando Satã era uma criança recém-chegada ao Rio.

Sete Coroas era cafetão no bairro da Lapa e mestre no que Satã chamava de "a fina arte da malandragem": o jogo, a navalha, o papo, a rasteira e a valentia. Ele transmitiu as técnicas de combate que combinavam movimentos de capoeira com luta de navalha—o estilo característico dos guerreiros de rua do Rio. De acordo com fontes que documentam seu tempo na Colônia Correcional de Dois Rios na Ilha Grande, Sete Coroas era reconhecido como praticante de capoeira entre os prisioneiros.

Seus companheiros incluíam Camisa e Benedito—descritos por um líder do morro como "terríveis" e na verdade piores que o próprio Sete Coroas. Todos os três morreram nessa época. Em 1923, quando Sete Coroas morreu, deixou Madame Satã como seu sucessor na Lapa e na Saúde. O jovem João Francisco dos Santos se tornaria o malandro mais famoso da história do Brasil, mas nunca esqueceu quem o ensinou.

Sete Coroas alcançou algo raro: a imortalização na memória popular. Além dos sambas, foi elevado ao reino da religião afro-brasileira, tornando-se um Exu (entidade espiritual) cujas canções rituais ainda são cantadas. O negro, favelado e marginal que enfrentou os ricos, a polícia e o Estado tornou-se figura de culto.',
  -- achievements_en
  'Subject of Sinhô''s 1921 samba (reportedly first Brazilian song about a "bandido"); teacher of Madame Satã; elevated to Exu status in Afro-Brazilian religion; researched by historian Rômulo Costa Mattos as "the most famous criminal of the First Republic"',
  -- achievements_pt
  'Tema do samba de Sinhô de 1921 (supostamente a primeira música brasileira sobre um "bandido"); professor de Madame Satã; elevado à categoria de Exu na religião afro-brasileira; pesquisado pelo historiador Rômulo Costa Mattos como "o criminoso mais famoso da Primeira República"',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1885, decade precision): Madame Satã (b. 1900) said in 1971 interview that Sete Coroas "met me when I was 9 years old" (~1909) and was "the greatest malandro I knew from 1907." Already established malandro by 1907, suggesting he was at least in his 20s. Famous 1920 funeral robbery shows him at peak of his criminal career. Died 1923. If 35-40 at death, birth = ~1883-1888. Using 1885 as midpoint.

DEATH: 1923 (confirmed by Madame Satã interview to O Pasquim 1971; multiple sources agree)

ORIGIN: From Bahia (confirmed in Madame Satã''s prison memoirs at Ilha Grande)

NAME: Real name unknown. "Sete Coroas" (Seven Crowns) derives from 1920 funeral robbery where he stole flower wreaths.

COMPANIONS: Sources mention Camisa and Benedito as his "terrible" companions who died before him. Also associated with Quinzinho (teacher of Leopoldina) as contemporary.

PENDING RELATIONSHIPS (require SQL imports):
- Madame Satã: student_of Sete Coroas (~1909-1923)
- Quinzinho: associated_with as contemporaries in Rio capoeira/malandro world

IMPRISONMENT: Served time at Dois Rios Correctional Colony, Ilha Grande, where he was recognized as capoeira practitioner.

RELIGIOUS STATUS: Elevated to Exu entity in Afro-Brazilian religion (umbanda).',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1885, precisão de década): Madame Satã (n. 1900) disse em entrevista de 1971 que Sete Coroas "me conheceu com 9 anos de idade" (~1909) e era "o maior malandro que conheci desde 1907." Já era malandro estabelecido em 1907, sugerindo que tinha pelo menos 20 e poucos anos. O famoso roubo do funeral de 1920 mostra-o no auge de sua carreira criminosa. Morreu em 1923. Se tinha 35-40 anos na morte, nascimento = ~1883-1888. Usando 1885 como ponto médio.

MORTE: 1923 (confirmado pela entrevista de Madame Satã ao Pasquim em 1971; múltiplas fontes concordam)

ORIGEM: Da Bahia (confirmado nas memórias de prisão de Madame Satã na Ilha Grande)

NOME: Nome real desconhecido. "Sete Coroas" deriva do roubo do funeral de 1920 onde ele roubou coroas de flores.

COMPANHEIROS: Fontes mencionam Camisa e Benedito como seus "terríveis" companheiros que morreram antes dele. Também associado a Quinzinho (professor de Leopoldina) como contemporâneo.

RELACIONAMENTOS PENDENTES (requerem importações SQL):
- Madame Satã: student_of Sete Coroas (~1909-1923)
- Quinzinho: associated_with como contemporâneos no mundo da capoeira/malandragem do Rio

PRISÃO: Cumpriu pena na Colônia Correcional de Dois Rios, Ilha Grande, onde era reconhecido como praticante de capoeira.

STATUS RELIGIOSO: Elevado a entidade Exu na religião afro-brasileira (umbanda).'
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

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- NOTE: Madame Satã relationship pending - requires Madame Satã SQL import
-- Madame Satã (b. 1900) learned from Sete Coroas starting ~1909 until death in 1923

-- NOTE: Quinzinho relationship pending - requires Quinzinho SQL import
-- Both were contemporaries in the Rio capoeira/malandro world

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/sete-coroas.sql',
  NULL,
  ARRAY['persons/madame-sata.sql']::text[],
  'Sete Coroas (~1885-1923) - Baiano malandro in Rio; teacher of Madame Satã; subject of Sinhô''s 1921 samba; elevated to Exu status'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
