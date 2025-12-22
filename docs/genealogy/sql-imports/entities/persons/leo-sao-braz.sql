-- ============================================================
-- GENEALOGY PERSON: Léo (São Braz)
-- Generated: 2025-12-22
-- ============================================================
-- BIRTH YEAR ESTIMATION (1910, decade):
-- Mestre Léo was a student of João Catarino (born ~1900, died before 1947)
-- and was teaching in São Braz by 1942 when both Gato Preto (age 12) and
-- Messias (age 15) began training under him. He formed Messias as mestre
-- in 1947, suggesting he was an established teacher by that time. As a
-- student of João Catarino's generation, and an active teacher by 1942,
-- he was likely born ~1910 ±10 years. Using decade precision.
--
-- APELIDO_CONTEXT: 'São Braz' - to distinguish from other "Léo" apelidos
-- in the database (there are multiple mestres named Léo in capoeira history)
--
-- LINEAGE SIGNIFICANCE:
-- Léo represents a key transmission point between Besouro's legacy and
-- multiple important lineages:
-- Besouro → João Catarino → Léo → Gato Preto (parallel to Catarino → Gato Preto)
-- Besouro → João Catarino → Léo → Mestre Messias
--
-- TEACHING CONTEXT:
-- Led an informal capoeira group in São Braz that met on Saturdays and
-- Sundays during the early 1940s. Group members included Messias, Zinho,
-- Genesio, Lao, Tomazinho, Jaime, Chumbinho, and later Gato Preto.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Léo',
  'São Braz',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-45', 'https://velhosmestres.com/br/gatopreto', 'https://velhosmestres.com/br/gato-1999-4']::text[],
  'angola'::genealogy.style,
  'Pre-codification era. Practiced traditional Bahian capoeira in the Recôncavo region before the Angola/Regional split was formalized. Trained under João Catarino, who learned directly from Besouro Mangangá.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana na região do Recôncavo antes da divisão Angola/Regional ser formalizada. Treinou com João Catarino, que aprendeu diretamente de Besouro Mangangá.',
  1910,
  'decade'::genealogy.date_precision,
  'São Braz, Santo Amaro da Purificação, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Mestre Léo was a capoeirista from São Braz, a district of Santo Amaro da Purificação in the Recôncavo Baiano. He was a student of João Catarino, who in turn was a direct student of the legendary Besouro Mangangá. This places Léo within one of the most significant lineages in capoeira history—just two generations removed from Besouro himself.\n\nBy the early 1940s, Léo had established himself as a teacher in São Braz, leading an informal capoeira group that met on Saturdays and Sundays. As Mestre Gato Preto later recalled: "E Léo era o mestre" (And Léo was the mestre). This group of young capoeiristas included approximately eight youths, aged 15-16, among them Messias, Zinho, Genesio, Lao, Tomazinho, Jaime, and Chumbinho.\n\nIn 1942, Léo''s influence expanded when José Gabriel Góes (the future Mestre Gato Preto) arrived in São Braz at age 12, having already received foundational training from his father Eutíquio and uncle João Catarino. Gato Preto joined the weekend training sessions, and by then people already said he had nothing left to learn. That same year, Manoel Messias Pereira, then 15 years old, began his formal training under Léo.\n\nMestre Léo proved to be an effective teacher who could develop mastery in his students. In 1947, he graduated Messias as a mestre at just 20 years of age—a remarkable accomplishment that demonstrated both Messias''s skill and Léo''s ability to transmit the art. Messias would go on to become a highly respected figure, living to 91 years old (1927-2019) and receiving the title of Grão Mestre in 2011.\n\nGato Preto''s testimony reveals that Léo was held in high regard: "um mestre que não podia deixar de ser homenageado" (a mestre who could not be left unhonored). Though detailed biographical information about Léo himself is sparse, his legacy is undeniable. Through his students—particularly Gato Preto and Messias—he ensured that Besouro''s lineage would continue through multiple branches, reaching practitioners around the world.\n\nLéo''s teaching in São Braz represents an important moment in capoeira history: the informal, weekend gatherings in small towns that preserved and transmitted the art during the 1930s and 1940s, before the era of formal academies that would come later. His work in this "arraial" (hamlet), as Gato Preto described it, helped maintain the traditions of the Recôncavo during a critical period.',
  E'Mestre Léo foi um capoeirista de São Braz, um distrito de Santo Amaro da Purificação no Recôncavo Baiano. Era aluno de João Catarino, que por sua vez foi aluno direto do lendário Besouro Mangangá. Isso coloca Léo em uma das linhagens mais significativas da história da capoeira—a apenas duas gerações de Besouro.\n\nNo início dos anos 1940, Léo havia se estabelecido como mestre em São Braz, liderando um grupo informal de capoeira que se reunia aos sábados e domingos. Como Mestre Gato Preto recordou mais tarde: "E Léo era o mestre". Este grupo de jovens capoeiristas incluía aproximadamente oito rapazes, de 15-16 anos, entre eles Messias, Zinho, Genesio, Lao, Tomazinho, Jaime e Chumbinho.\n\nEm 1942, a influência de Léo se expandiu quando José Gabriel Góes (o futuro Mestre Gato Preto) chegou a São Braz aos 12 anos, já tendo recebido treinamento fundamental de seu pai Eutíquio e tio João Catarino. Gato Preto se juntou às sessões de treino de fim de semana, e naquela altura as pessoas já diziam que ele não tinha mais nada a aprender. No mesmo ano, Manoel Messias Pereira, então com 15 anos, começou seu treinamento formal com Léo.\n\nMestre Léo provou ser um professor eficaz que podia desenvolver maestria em seus alunos. Em 1947, ele formou Messias como mestre com apenas 20 anos—uma conquista notável que demonstrou tanto a habilidade de Messias quanto a capacidade de Léo de transmitir a arte. Messias viria a se tornar uma figura altamente respeitada, vivendo até 91 anos (1927-2019) e recebendo o título de Grão Mestre em 2011.\n\nO testemunho de Gato Preto revela que Léo era muito estimado: "um mestre que não podia deixar de ser homenageado". Embora informações biográficas detalhadas sobre o próprio Léo sejam escassas, seu legado é inegável. Através de seus alunos—particularmente Gato Preto e Messias—ele garantiu que a linhagem de Besouro continuasse por múltiplos ramos, alcançando praticantes ao redor do mundo.\n\nO ensino de Léo em São Braz representa um momento importante na história da capoeira: as reuniões informais de fim de semana em pequenas cidades que preservavam e transmitiam a arte durante os anos 1930 e 1940, antes da era das academias formais que viria depois. Seu trabalho neste "arraial", como Gato Preto o descreveu, ajudou a manter as tradições do Recôncavo durante um período crítico.',
  NULL,
  NULL,
  E'BIRTH YEAR ESTIMATION (1910, decade):\nMestre Léo was a student of João Catarino (born ~1900, died before 1947) and was teaching in São Braz by 1942. He formed Messias as mestre in 1947, suggesting he was an established teacher by then. Estimated ~1910 ±10 years.\n\nTEACHERS:\n- João Catarino (student of Besouro Mangangá; taught Léo before 1942)\n\nSTUDENTS:\n- Mestre Gato Preto (José Gabriel Góes, from 1942; also nephew of João Catarino)\n- Mestre Messias (Manoel Messias Pereira, from 1942; formed mestre 1947)\n- Zinho, Genesio, Lao, Tomazinho, Jaime, Chumbinho (São Braz training group)\n\nTEACHING LOCATION:\nSão Braz, Santo Amaro da Purificação, Bahia - described by Gato Preto as "uma cidadezinha" (small town) that "na época era um arraial" (at the time was a hamlet).\n\nTRAINING GROUP:\nMet on Saturdays and Sundays. Members were approximately 15-16 years old. Quote from Gato Preto (1999): "Tinha aquele grupo: era eu, Messias, Zinho, Genesio, Lao, Tomazinho, Jaime, Chumbinho... Então tinha aquele grupo de rapazes que era tudo de 16, 15-16 anos. E a gente se reunia aos sábados e domingos pra fazer essa capoeira. E Léo era o mestre."\n\nLINEAGE SIGNIFICANCE:\nLéo represents a key link in the Besouro lineage:\n1. Besouro → João Catarino → Léo → Gato Preto\n2. Besouro → João Catarino → Léo → Mestre Messias (formed 1947)\n\nKEY QUOTE (Gato Preto):\n"um mestre que não podia deixar de ser homenageado, que é Mestre Leó"',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1910, década):\nMestre Léo foi aluno de João Catarino (nascido ~1900, morreu antes de 1947) e estava ensinando em São Braz em 1942. Formou Messias como mestre em 1947, sugerindo que era um mestre estabelecido naquela época. Estimado ~1910 ±10 anos.\n\nMESTRES:\n- João Catarino (aluno de Besouro Mangangá; ensinou Léo antes de 1942)\n\nALUNOS:\n- Mestre Gato Preto (José Gabriel Góes, a partir de 1942; também sobrinho de João Catarino)\n- Mestre Messias (Manoel Messias Pereira, a partir de 1942; formado mestre 1947)\n- Zinho, Genesio, Lao, Tomazinho, Jaime, Chumbinho (grupo de treino de São Braz)\n\nLOCAL DE ENSINO:\nSão Braz, Santo Amaro da Purificação, Bahia - descrito por Gato Preto como "uma cidadezinha" que "na época era um arraial".\n\nGRUPO DE TREINO:\nReuniam-se aos sábados e domingos. Os membros tinham aproximadamente 15-16 anos. Citação de Gato Preto (1999): "Tinha aquele grupo: era eu, Messias, Zinho, Genesio, Lao, Tomazinho, Jaime, Chumbinho... Então tinha aquele grupo de rapazes que era tudo de 16, 15-16 anos. E a gente se reunia aos sábados e domingos pra fazer essa capoeira. E Léo era o mestre."\n\nSIGNIFICÂNCIA DA LINHAGEM:\nLéo representa um elo-chave na linhagem de Besouro:\n1. Besouro → João Catarino → Léo → Gato Preto\n2. Besouro → João Catarino → Léo → Mestre Messias (formado 1947)\n\nCITAÇÃO-CHAVE (Gato Preto):\n"um mestre que não podia deixar de ser homenageado, que é Mestre Leó"'
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
