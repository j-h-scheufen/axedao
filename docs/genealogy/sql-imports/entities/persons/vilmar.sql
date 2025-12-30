-- ============================================================
-- GENEALOGY PERSON: Vilmar
-- Generated: 2025-12-27
-- ============================================================
-- BIRTH YEAR ESTIMATION (1943, year precision):
-- Vilmar stated in testimony about the 1961 Mangueira parade that
-- he was 18 years old at that time: "Until the age of eighteen I
-- had never seen capoeira in a samba school." This places his
-- birth around 1942-1943. In 2010, he qualified for Prêmio Viva
-- Meu Mestre which required age 55+, confirming birth before 1955.
-- Using 1943 as the most likely year.
--
-- NAME VARIATION: Listed as "Vilmar da Cruz Brito" in IPHAN Prêmio
-- documents but consistently referred to as "Vilmar Brito Cruz"
-- in capoeira contexts. Both variations of the same name.
--
-- LINEAGE: Djalma Bandeira → Vilmar (NOT directly Artur Emídio)
-- While some sources list Vilmar among Artur Emídio's students,
-- primary evidence shows he trained with Djalma Bandeira at the
-- IAPC Olaria. Djalma was Artur Emídio's first student, making
-- Vilmar Artur Emídio's "grand-student."
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
  'Vilmar Brito Cruz',
  'Vilmar',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
    'https://capoeirahistory.com/capoeira-parading-for-the-samba-schools/'
  ]::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Vilmar is described as "simply a great capoeirista, without this advertising and impoverishing dichotomy of angola or regional." This characterization, from capoeira historian André Lacé Lopes, suggests Vilmar embodies a unified approach to capoeira that transcends the style divisions that emerged in the 20th century. His teaching emphasizes the wholeness of the art form.',
  E'Vilmar é descrito como "simplesmente um grande capoeirista, sem esta dicotomia publicitária e empobrecedora de angola ou regional." Esta caracterização, do historiador de capoeira André Lacé Lopes, sugere que Vilmar incorpora uma abordagem unificada da capoeira que transcende as divisões de estilo que emergiram no século XX. Seu ensino enfatiza a inteireza da forma artística.',
  -- Life dates
  1943,
  'year'::genealogy.date_precision,
  NULL,  -- Unknown birth place
  NULL,  -- Still alive as of 2010s
  NULL,
  NULL,
  -- Extended content (English)
  E'Vilmar Brito Cruz grew up in Olaria, a suburb in the northern zone of Rio de Janeiro. As a young man, he witnessed capoeira at the IAPC (Instituto de Aposentadoria e Pensões dos Comerciários) Residential Complex Community Centre, where Mestre Djalma Bandeira had established his academy. Vilmar became one of Djalma Bandeira''s students - a master he would later describe as "one of the best capoeira masters that a suburb of Rio de Janeiro has ever produced."

A pivotal moment in Vilmar''s early capoeira career came in 1961 when he was eighteen years old. As he recalled: "Until the age of eighteen I had never seen capoeira in a samba school, and when Xangô da Mangueira arrived there at the IAPC, I did not know him. He spoke to Leopoldina to get three or four people to parade in an ala of Mangueira, at a time when samba schools did not allow people from outside to parade."

Mestre Leopoldina, who was well-known for his charisma, selected Vilmar along with others from Djalma''s group to participate in this historic carnival parade. Mangueira''s theme that year was "Reminiscências do Velho Rio" (Reminiscences of the Old Rio), and they won the competition. This was the first time a samba school included capoeira in its parade, giving the art unprecedented visibility in Rio de Janeiro.

For Vilmar, a young man from the suburbs, the experience was transformative: "A little black boy from the Olaria neighbourhood, to wear a costume of Mangueira! My mother was very proud!" The parade took place on President Vargas avenue, from Central Brazil Station to the Candelária church, and the capoeiristas received costumes and payment.

Beyond capoeira, Vilmar pursued a career as a journalist, earning him the combined title "mestre-jornalista" (master-journalist). He is described as a family man and "essentially honest person" by those who know him.

After some years away from active teaching, Vilmar returned to conducting capoeira classes, focusing particularly on special populations. His workshops at the INSS building in the IAPC Residential Complex serve students with Down syndrome, paraplegia, and other conditions. Capoeira historian André Lacé Lopes wrote that Vilmar''s classes bring "parents of students with Down syndrome, paraplegia, or effects of meningitis to tears of pure emotion" through the remarkable results achieved in both body and spirit.

His students include people being prepared to become instructors - Professor Luciano, Instrutor Fábio, Estrada, and Abelha - as well as older women with capoeira names that reflect their personalities: Arlegre (a woman named Arlete who smiled so much at her own efforts and good results that she was baptized with this playful name combining her name with "alegre"/happy), Japonesa, Imperatriz, Madameponpadour, Maçachocolate, and Basti, who was 83 years old.

Vilmar concerns himself with "training trainers, forming masters to expand and continue his excellent work." His teaching philosophy embodies a unified approach to capoeira, eschewing the divisive labels of "angola or regional" that have often fragmented the community.

He was featured in a "literatura de cordel" (traditional Brazilian folk literature) booklet that was launched at Circo Voador in Lapa, Rio de Janeiro, and also included in a French version released in Paris. As André Lacé Lopes wrote: "Vilmar does not travel to Paris, Europe, or the United States - Paris comes to Vilmar." Though he missed opportunities to see the world, the author noted that "the world loses much more by not knowing Vilmar''s capoeira."

In 2010, Vilmar da Cruz Brito qualified for the "Prêmio Viva Meu Mestre" (Long Live My Master Award), an IPHAN (National Historical and Artistic Heritage Institute) award recognizing capoeira masters aged 55 or older "whose life trajectory has fundamentally contributed to the transmission and continuity of Capoeira in Brazil."',
  -- Extended content (Portuguese)
  E'Vilmar Brito Cruz cresceu em Olaria, um subúrbio na zona norte do Rio de Janeiro. Quando jovem, presenciou a capoeira no Centro Comunitário do Conjunto Residencial do IAPC (Instituto de Aposentadoria e Pensões dos Comerciários), onde Mestre Djalma Bandeira havia estabelecido sua academia. Vilmar tornou-se um dos alunos de Djalma Bandeira - um mestre que mais tarde ele descreveria como "um dos melhores mestres de capoeira que um subúrbio do Rio de Janeiro já produziu."

Um momento crucial na carreira inicial de capoeira de Vilmar veio em 1961, quando ele tinha dezoito anos. Como ele relembrou: "Até os dezoito anos eu nunca tinha visto capoeira em escola de samba, e quando Xangô da Mangueira chegou ali no IAPC, eu não o conhecia. Ele falou com Leopoldina para conseguir três ou quatro pessoas para desfilar numa ala da Mangueira, numa época em que as escolas de samba não permitiam que pessoas de fora desfilassem."

Mestre Leopoldina, que era bem conhecido por seu carisma, selecionou Vilmar junto com outros do grupo de Djalma para participar deste histórico desfile de carnaval. O tema da Mangueira naquele ano era "Reminiscências do Velho Rio", e eles venceram a competição. Esta foi a primeira vez que uma escola de samba incluiu capoeira em seu desfile, dando à arte uma visibilidade sem precedentes no Rio de Janeiro.

Para Vilmar, um jovem dos subúrbios, a experiência foi transformadora: "Um neguinho do bairro de Olaria, vestir uma fantasia da Mangueira! Minha mãe ficou muito orgulhosa!" O desfile aconteceu na avenida Presidente Vargas, da Estação Central do Brasil até a igreja da Candelária, e os capoeiristas receberam fantasias e pagamento.

Além da capoeira, Vilmar seguiu carreira como jornalista, o que lhe rendeu o título combinado de "mestre-jornalista." Ele é descrito como um homem de família e "pessoa essencialmente honesta" por aqueles que o conhecem.

Após alguns anos afastado do ensino ativo, Vilmar voltou a conduzir aulas de capoeira, focando particularmente em populações especiais. Suas oficinas no prédio do INSS no Conjunto Residencial do IAPC atendem alunos com síndrome de Down, paraplegia e outras condições. O historiador de capoeira André Lacé Lopes escreveu que as aulas de Vilmar levam "pais de alunos com síndrome de Down, paraplegia ou efeitos de meningite às lágrimas de pura emoção" através dos resultados notáveis alcançados tanto no corpo quanto no espírito.

Seus alunos incluem pessoas sendo preparadas para se tornarem instrutores - Professor Luciano, Instrutor Fábio, Estrada e Abelha - assim como mulheres mais velhas com nomes de capoeira que refletem suas personalidades: Arlegre (uma mulher chamada Arlete que sorria tanto com seu próprio esforço e bons resultados que foi batizada com este nome lúdico combinando seu nome com "alegre"), Japonesa, Imperatriz, Madameponpadour, Maçachocolate e Basti, que tinha 83 anos.

Vilmar se preocupa em "treinar treinadores, formar mestres para ampliar e prosseguir seu excelente trabalho." Sua filosofia de ensino incorpora uma abordagem unificada da capoeira, evitando os rótulos divisivos de "angola ou regional" que frequentemente fragmentaram a comunidade.

Ele foi destaque em um livreto de "literatura de cordel" que foi lançado no Circo Voador na Lapa, Rio de Janeiro, e também foi incluído em uma versão francesa lançada em Paris. Como André Lacé Lopes escreveu: "Vilmar não viaja para Paris, Europa ou Estados Unidos - Paris vem até Vilmar." Embora tenha perdido oportunidades de ver o mundo, o autor notou que "o mundo perde muito mais por não conhecer a capoeira de Vilmar."

Em 2010, Vilmar da Cruz Brito se qualificou para o "Prêmio Viva Meu Mestre", um prêmio do IPHAN (Instituto do Patrimônio Histórico e Artístico Nacional) que reconhece mestres de capoeira com 55 anos ou mais "cuja trajetória de vida tenha contribuído fundamentalmente para a transmissão e continuidade da Capoeira no Brasil."',
  -- Achievements (English)
  E'- Student of Mestre Djalma Bandeira
- Participated in historic 1961 Mangueira Carnival parade - the first samba school to feature capoeira
- Qualified candidate for IPHAN''s Prêmio Viva Meu Mestre (2010)
- Pioneer of capoeira for special needs populations (Down syndrome, paraplegia, meningitis effects)
- Featured in literatura de cordel booklet (launched at Circo Voador, Lapa; French version in Paris)
- Trains trainers and forms new mestres to continue his work
- Described by André Lacé Lopes as "one of the best capoeiras I have seen play"
- Active teacher at IAPC Residential Complex, Olaria',
  -- Achievements (Portuguese)
  E'- Aluno de Mestre Djalma Bandeira
- Participou do histórico desfile de Carnaval da Mangueira de 1961 - a primeira escola de samba a apresentar capoeira
- Candidato habilitado para o Prêmio Viva Meu Mestre do IPHAN (2010)
- Pioneiro da capoeira para populações com necessidades especiais (síndrome de Down, paraplegia, efeitos de meningite)
- Destaque em livreto de literatura de cordel (lançado no Circo Voador, Lapa; versão francesa em Paris)
- Treina treinadores e forma novos mestres para continuar seu trabalho
- Descrito por André Lacé Lopes como "um dos melhores capoeiras que vi jogar"
- Professor ativo no Conjunto Residencial do IAPC, Olaria',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1943, year):
Vilmar stated in testimony about the 1961 Mangueira parade: "Until the age of eighteen I had never seen capoeira in a samba school." This places his birth around 1942-1943. In 2010, he qualified for Prêmio Viva Meu Mestre which required age 55+, confirming birth before 1955. Using 1943 as most likely year.

NAME DISCREPANCY:
- "Vilmar da Cruz Brito" - IPHAN Prêmio Viva Meu Mestre 2010 list (official government document)
- "Vilmar Brito Cruz" - André Lacé Lopes articles, capoeirahistory.com (capoeira community usage)
Both refer to the same person; using "Vilmar Brito Cruz" as it appears in primary capoeira sources.

TEACHER:
- Mestre Djalma Bandeira (confirmed by multiple sources including André Lacé Lopes and capoeirahistory.com)
- Note: Some sources (artur-emidio.sql notes) list "Vilmar" among Artur Emídio''s students. However, Vilmar''s primary teacher was Djalma Bandeira, who was himself Artur Emídio''s first student. Vilmar is thus Artur Emídio''s "grand-student" rather than direct student.

STUDENTS:
- Professor Luciano (being prepared as instructor)
- Instrutor Fábio (instructor level)
- Estrada (student)
- Abelha (student)
- Arlegre/Arlete (student)
- Japonesa (student)
- Imperatriz (student)
- Madameponpadour (student)
- Maçachocolate (student)
- Basti (student, age 83)

MEDIA APPEARANCES:
- 1961: Mangueira Carnival parade - first samba school to feature capoeira
- Literatura de cordel booklet (second edition), launched at Circo Voador, Lapa
- French version of cordel booklet launched in Paris

RODA LOCATION: INSS building, IAPC Residential Complex, Olaria, Rio de Janeiro (suburb, northern zone)

PROFESSION: Journalist (mestre-jornalista)

ALIVE STATUS: Still alive as of the André Lacé Lopes article (~2000s-2010s). Qualified for Prêmio Viva Meu Mestre 2010, which requires living masters.

PRIMARY SOURCE: André Luiz Lacé Lopes article "Olaria - Rio - Mestre Vilmar na Volta do Mundo" on capoeira.jex.com.br. André Lacé Lopes is a respected capoeira historian who served as Director of the Special Department of Capoeira of the Brazilian Confederation of Pugilism and has written extensively on capoeira history.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1943, ano):
Vilmar declarou em depoimento sobre o desfile da Mangueira de 1961: "Até os dezoito anos eu nunca tinha visto capoeira em escola de samba." Isso coloca seu nascimento por volta de 1942-1943. Em 2010, ele se qualificou para o Prêmio Viva Meu Mestre que exigia 55+ anos, confirmando nascimento antes de 1955. Usando 1943 como ano mais provável.

DISCREPÂNCIA DE NOME:
- "Vilmar da Cruz Brito" - lista do Prêmio Viva Meu Mestre do IPHAN 2010 (documento oficial do governo)
- "Vilmar Brito Cruz" - artigos de André Lacé Lopes, capoeirahistory.com (uso na comunidade de capoeira)
Ambos referem-se à mesma pessoa; usando "Vilmar Brito Cruz" pois aparece nas fontes primárias de capoeira.

MESTRE:
- Mestre Djalma Bandeira (confirmado por múltiplas fontes incluindo André Lacé Lopes e capoeirahistory.com)
- Nota: Algumas fontes (notas de artur-emidio.sql) listam "Vilmar" entre os alunos de Artur Emídio. No entanto, o mestre principal de Vilmar foi Djalma Bandeira, que era ele mesmo o primeiro aluno de Artur Emídio. Vilmar é assim "neto-aluno" de Artur Emídio, não aluno direto.

ALUNOS:
- Professor Luciano (sendo preparado como instrutor)
- Instrutor Fábio (nível instrutor)
- Estrada (aluno)
- Abelha (aluno)
- Arlegre/Arlete (aluna)
- Japonesa (aluna)
- Imperatriz (aluna)
- Madameponpadour (aluna)
- Maçachocolate (aluna)
- Basti (aluna, 83 anos)

APARIÇÕES NA MÍDIA:
- 1961: Desfile de Carnaval da Mangueira - primeira escola de samba a apresentar capoeira
- Livreto de literatura de cordel (segunda edição), lançado no Circo Voador, Lapa
- Versão francesa do livreto de cordel lançada em Paris

LOCAL DA RODA: Prédio do INSS, Conjunto Residencial do IAPC, Olaria, Rio de Janeiro (subúrbio, zona norte)

PROFISSÃO: Jornalista (mestre-jornalista)

SITUAÇÃO DE VIDA: Ainda vivo conforme o artigo de André Lacé Lopes (~2000s-2010s). Qualificou-se para o Prêmio Viva Meu Mestre 2010, que exige mestres vivos.

FONTE PRIMÁRIA: Artigo de André Luiz Lacé Lopes "Olaria - Rio - Mestre Vilmar na Volta do Mundo" em capoeira.jex.com.br. André Lacé Lopes é um respeitado historiador de capoeira que serviu como Diretor do Departamento Especial de Capoeira da Confederação Brasileira de Pugilismo e escreveu extensivamente sobre a história da capoeira.'
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
