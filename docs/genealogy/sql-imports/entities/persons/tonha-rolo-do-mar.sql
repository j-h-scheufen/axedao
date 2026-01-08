-- ============================================================
-- GENEALOGY PERSON: Tonha Rolo do Mar
-- Generated: 2026-01-03
-- ============================================================
-- BIRTH YEAR ESTIMATION (1870, decade):
-- Cobrinha Verde (born 1912) learned from Tonha during his youth in Santo Amaro
-- in the 1910s-1920s. Assuming she was a mature, skilled teacher (~30-50 years
-- old) when teaching him, her birth would be approximately 1870-1890.
-- Using 1870 as estimate with decade precision (conservative, she was likely
-- old enough to be established as a weapons specialist).
--
-- DEATH YEAR ESTIMATION (1950, decade):
-- Santos (1991) notes that at the time of his interview with Cobrinha Verde,
-- Tonha was "still alive" and had moved to Tomba, Feira de Santana. Cobrinha
-- Verde's interviews were conducted before his death in 1983. However, the
-- 2023 academic study lists her as "in memoriam." Using 1950 as estimated
-- death with decade precision (she would have been ~60-80 years old).
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
  NULL,
  'Tonha Rolo do Mar',
  NULL,
  NULL,
  ARRAY['https://periodicos.sbu.unicamp.br/ojs/index.php/conexoes/article/view/8674321', 'https://capoeira.online/history/mestres/cobrinha-verde/']::text[],
  -- Capoeira-specific
  NULL,
  'Specialist in razor (navalha) technique. Mastered the military technique of playing with knife and razor tied to a cord—a skill from the pre-codification era of capoeiragem where weapons were integral to the practice.',
  'Especialista na técnica de navalha. Dominava a técnica militar de jogar com faca e navalha amarradas no cordão—uma habilidade da era pré-codificação da capoeiragem onde armas eram parte integral da prática.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1950,
  'decade'::genealogy.date_precision,
  'Feira de Santana, Bahia, Brazil',
  -- bio_en
  E'Tonha Rolo do Mar stands as one of the earliest documented female capoeira teachers in Brazilian history. A 2023 academic study by Ábia Lima de França at the Federal University of Bahia, analyzing 296 female capoeira mestras across Brazil and abroad, identified her alongside Mestra Sandrinha and Mestra Cigana as one of three possible pioneers of female mastery in capoeira.

Her specialty was the military technique of playing with knife and razor tied to a cord—the deadly art of the navalha. In Santo Amaro da Purificação, the heartland of Bahian capoeira, she taught the young Rafael Alves França, who would become the legendary Mestre Cobrinha Verde. In his own words, recorded in Marcelino dos Santos'' 1991 book "Capoeira e Mandingas": "O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar" ("My master of playing razor on the cord, in the hands and on the feet was Tonha, nicknamed Tonha Rolo do Mar").

This was the era when the navalha, the switchblade, and the faca were as much a part of capoeiragem as the ginga itself. Before the sportification of capoeira in the twentieth century, the razor was the capoeira''s favorite weapon—a symbol of the art long before the berimbau achieved its current prominence. Tonha was a woman who had mastered this deadly craft and passed it on.

At the time of Cobrinha Verde''s account, she was reportedly still alive and walking around with a machete in hand—a woman of fearsome capability. She had moved from Santo Amaro to the neighborhood of Tomba in Feira de Santana, Bahia, and after that, no further news of her exists. She vanished from the historical record, leaving behind only the legacy she transmitted through her students.

Tonha Rolo do Mar represents an important but often overlooked female figure in the traditionally male-dominated history of capoeira—a woman who taught men the art of the razor at a time when such skills meant the difference between life and death on the streets of Bahia.',
  -- bio_pt
  E'Tonha Rolo do Mar se destaca como uma das primeiras mestras de capoeira documentadas na história brasileira. Um estudo acadêmico de 2023 da pesquisadora Ábia Lima de França na Universidade Federal da Bahia, analisando 296 mestras de capoeira espalhadas pelo Brasil e exterior, identificou-a junto com Mestra Sandrinha e Mestra Cigana como uma das três possíveis pioneiras da maestria feminina na capoeira.

Sua especialidade era a técnica militar de jogar com faca e navalha amarradas no cordão—a arte mortal da navalha. Em Santo Amaro da Purificação, o coração da capoeira baiana, ela ensinou o jovem Rafael Alves França, que se tornaria o lendário Mestre Cobrinha Verde. Em suas próprias palavras, registradas no livro de 1991 de Marcelino dos Santos "Capoeira e Mandingas": "O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar".

Esta foi a era em que a navalha, o canivete e a faca eram tão parte da capoeiragem quanto a própria ginga. Antes da esportivização da capoeira no século XX, a navalha era a arma favorita do capoeira—um símbolo da arte muito antes do berimbau alcançar sua proeminência atual. Tonha era uma mulher que havia dominado esta arte mortal e a transmitia.

Na época do relato de Cobrinha Verde, ela supostamente ainda estava viva e andava por aí com um facão na mão—uma mulher de capacidade temível. Ela tinha se mudado de Santo Amaro para o bairro do Tomba em Feira de Santana, Bahia, e depois disso, não há mais notícias sobre ela. Ela desapareceu do registro histórico, deixando apenas o legado que transmitiu através de seus alunos.

Tonha Rolo do Mar representa uma figura feminina importante mas frequentemente negligenciada na história tradicionalmente dominada por homens da capoeira—uma mulher que ensinou homens a arte da navalha em uma época em que tais habilidades significavam a diferença entre a vida e a morte nas ruas da Bahia.',
  -- achievements_en
  'One of three earliest documented female capoeira pioneers; Master of razor (navalha) technique; Taught Mestre Cobrinha Verde the art of the razor tied to cord; Transmitted pre-codification weapons tradition of capoeiragem',
  -- achievements_pt
  'Uma das três primeiras pioneiras femininas documentadas da capoeira; Mestra da técnica de navalha; Ensinou Mestre Cobrinha Verde a arte da navalha no cordão; Transmitiu tradição de armas da capoeiragem pré-codificação',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade):
Cobrinha Verde (born 1912) learned from Tonha during his youth in Santo Amaro in the 1910s-1920s. Assuming she was a mature, skilled teacher (~30-50 years old) when teaching him, her birth would be approximately 1870-1890. Using 1870 as estimate with decade precision.

DEATH YEAR ESTIMATION (1950, decade):
Santos (1991) notes that at the time of the interview, Tonha was "still alive" and had moved to Tomba, Feira de Santana. The 2023 academic study lists her as "in memoriam." Using 1950 as estimated death with decade precision.

PRIMARY SOURCE: Santos, Marcelino dos. "Capoeira e Mandingas: Cobrinha Verde." Salvador: A Rasteira, 1991.

SECONDARY SOURCE: França, Ábia Lima de. "Resgate histórico das pioneiras mestras de capoeira no Brasil." Conexões, v. 21, e023033, 2023. DOI: 10.20396/conex.v21i00.8674321

COBRINHA VERDE QUOTE (Santos, 1991):
"O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar. Uma mulher."

CONTEMPORARY STATUS (at time of interview):
"She is still alive, and walks around with a machete in hand. She lives in Feira de Santana."

TITLE CONSIDERATION:
No formal title used in sources. The 2023 academic study categorizes her as one of three "mestras" but this appears to be an honorific recognition rather than a title she received during her lifetime. Title left as NULL to reflect historical accuracy—the formal title system did not exist in her era.

STUDENTS:
- Mestre Cobrinha Verde (razor technique in Santo Amaro, 1910s-1920s)

LOCATIONS:
- Santo Amaro da Purificação, Bahia (teaching period)
- Tomba, Feira de Santana, Bahia (later residence)

HISTORICAL CONTEXT:
Among the "mulheres da pá virada" (feisty women) who challenged gender norms and practiced capoeira alongside or against men in the late 19th/early 20th century. The razor was integral to capoeiragem before its sportification.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA ANO DE NASCIMENTO (1870, década):
Cobrinha Verde (nascido 1912) aprendeu com Tonha durante sua juventude em Santo Amaro nos anos 1910-1920. Assumindo que ela era uma professora madura e habilidosa (~30-50 anos) quando o ensinou, seu nascimento seria aproximadamente 1870-1890. Usando 1870 como estimativa com precisão de década.

ESTIMATIVA ANO DE MORTE (1950, década):
Santos (1991) nota que na época da entrevista, Tonha estava "ainda viva" e havia se mudado para Tomba, Feira de Santana. O estudo acadêmico de 2023 a lista como "in memoriam." Usando 1950 como morte estimada com precisão de década.

FONTE PRIMÁRIA: Santos, Marcelino dos. "Capoeira e Mandingas: Cobrinha Verde." Salvador: A Rasteira, 1991.

FONTE SECUNDÁRIA: França, Ábia Lima de. "Resgate histórico das pioneiras mestras de capoeira no Brasil." Conexões, v. 21, e023033, 2023. DOI: 10.20396/conex.v21i00.8674321

CITAÇÃO DE COBRINHA VERDE (Santos, 1991):
"O meu mestre de jogar navalha no cordão, nas mãos e nos pés foi Tonha, apelidada de Tonha Rolo do Mar. Uma mulher."

SITUAÇÃO CONTEMPORÂNEA (na época da entrevista):
"Ela ainda está viva, e anda por aí com um facão na mão. Ela mora em Feira de Santana."

CONSIDERAÇÃO SOBRE TÍTULO:
Nenhum título formal usado nas fontes. O estudo acadêmico de 2023 a categoriza como uma das três "mestras" mas isso parece ser um reconhecimento honorífico ao invés de um título que ela recebeu durante sua vida. Título deixado como NULL para refletir precisão histórica—o sistema formal de títulos não existia em sua era.

ALUNOS:
- Mestre Cobrinha Verde (técnica de navalha em Santo Amaro, anos 1910-1920)

LOCALIZAÇÕES:
- Santo Amaro da Purificação, Bahia (período de ensino)
- Tomba, Feira de Santana, Bahia (residência posterior)

CONTEXTO HISTÓRICO:
Entre as "mulheres da pá virada" que desafiavam normas de gênero e praticavam capoeira junto ou contra homens no final do século XIX/início do século XX. A navalha era integral à capoeiragem antes de sua esportivização.'
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
