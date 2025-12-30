-- ============================================================
-- GENEALOGY PERSON: Nagé (José Anastácio de Santana)
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH YEAR ESTIMATION (1923, year):
-- Velhos Mestres states "1923?" with question mark indicating
-- uncertainty. He died in 1958, so if born 1923 he would have
-- been ~35 at death. Given his established reputation by the
-- 1940s-50s as a feared and respected capoeirista, this is
-- plausible. Using 1923 with 'year' precision.
--
-- DEATH YEAR: 1958 (year) - documented assassination in Góes
-- Calmon, Bahia, defending himself against five men in a
-- dispute over a pandeiro and berimbau.
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
  'José Anastácio de Santana',
  'Nagé',
  NULL, -- No formal title documented
  NULL, -- No public domain portrait available
  ARRAY['https://velhosmestres.com/en/featured-53', 'https://velhosmestres.com/br/destaques-53']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Nagé was known as a street capoeirista of the old tradition, active in Salvador''s roda scene in the 1940s-50s. He was part of the circle around Mestre Waldemar''s Barracão in Liberdade. His style was the raw, combative capoeira of the streets—the kind that was still illegal memory.',
  E'Nagé era conhecido como capoeirista de rua da velha tradição, ativo na cena das rodas de Salvador nos anos 1940-50. Fazia parte do círculo em torno do Barracão de Mestre Waldemar na Liberdade. Seu estilo era a capoeira crua e combativa das ruas—do tipo que ainda era memória ilegal.',
  -- Life dates
  1923,
  'year'::genealogy.date_precision,
  'Coqueiros de Paraguaçu, Maragogipe, Bahia, Brazil',
  1958,
  'year'::genealogy.date_precision,
  'Góes Calmon, Bahia, Brazil',
  -- bio_en
  E'José Anastácio de Santana, known as Nagé, was born around 1923 in Coqueiros de Paraguaçu and lived in Nagé—both localities in the district of Maragogipe, in the Recôncavo Baiano. The village he lived in gave him his apelido, following a tradition where capoeiristas were often named for their place of origin.

Nagé was one of the valiant Black men of Bahia, famous throughout the lands of the Recôncavo and in all the plazas and streets of Salvador. For many years he was feared and respected by the best capoeiristas. No champion or leader had as many admirers. Writer Jorge Amado immortalized him in the 1964 novel "Os Pastores da Noite" (Shepherds of the Night), calling him "um assombro de valentia" (an astonishment of bravery). Art critic Wilson da Rocha described him as "um herói popular" (a popular hero).

By the 1940s, Nagé was part of the scene at Mestre Waldemar''s legendary Barracão in Corta Braço (later Liberdade), Salvador. According to Waldemar''s 1989 interview: "Outros foram José Cabelo Bom, um preto por nome Nagé—que juntaram cinco homens pra matar ele" (Others were José Cabelo Bom, a Black man named Nagé—they gathered five men to kill him). This casual mention of the conspiracy that would eventually claim Nagé''s life speaks to how intertwined violence and survival were in the capoeira world of that era.

Nagé was documented by multiple photographers and filmmakers. He possibly appears in Pierre Verger''s 1948 photographs at Corta Braço. On July 24, 1954, he was featured in photographs published in Manchete magazine by photographer Salomão Scliar. That same year, Marcel Gautherot likely photographed him as well.

In November 1954, Nagé appeared in the pioneering documentary "Vadiação" directed by Alexandre Robatto Filho—a landmark of Brazilian cinema''s engagement with capoeira. The 8-minute film featured a roda in Salvador with Mestres Bimba and Waldemar, alongside Traíra, Zacarias, Curió (the elder), Crispim, Caiçara, and Rosendo. Nagé played in multiple game sequences: first with an unidentified partner, then with the older Curió, and in a third brief game. In the film he appears shirtless, wearing a hat.

In 1958, Nagé died after being stabbed in Góes Calmon, Bahia. He was defending himself in a capoeira fight against five men—the very fate Waldemar had foretold. The conflict originated from a dispute over a pandeiro and berimbau. He fought capoeira until the very end, dying as he had lived.

Thousands of people attended his funeral. Despite his renown, Nagé''s story was rarely told for decades. As Frede Abreu wrote: "Nagé, de propósito ou sem querer, entrou no rol dos malditos da capoeira" (Nagé, purposely or unwittingly, entered the list of the "damned" of capoeira). His association with street disorder and fatal violence led to his marginalization from official capoeira history, even as he represented what Abreu called "a history of resistance of the oppressed".

In 2017, four years after his own death, Frede Abreu''s book "Nagé, o Homem Que Lutou Capoeira Até Morrer" (Nagé, the Man Who Fought Capoeira Until Death) was published posthumously by Editora Barabô, edited by his daughter Elza Abreu. The 132-page book, featuring unpublished photographs and historical research, finally gave Nagé the scholarly attention his life deserved.

Nagé left behind a daughter named Marileide.',
  -- bio_pt
  E'José Anastácio de Santana, conhecido como Nagé, nasceu por volta de 1923 em Coqueiros de Paraguaçu e viveu em Nagé—ambas localidades no distrito de Maragogipe, no Recôncavo Baiano. A vila onde morava deu-lhe seu apelido, seguindo uma tradição onde capoeiristas eram frequentemente nomeados pelo local de origem.

Nagé era um dos valentes negros da Bahia, famoso por todas as terras do Recôncavo e em todas as praças e ruas de Salvador. Por muitos anos foi temido e respeitado pelos melhores capoeiristas. Nenhum campeão ou líder teve tantos admiradores. O escritor Jorge Amado imortalizou-o no romance de 1964 "Os Pastores da Noite", chamando-o de "um assombro de valentia". O crítico de arte Wilson da Rocha descreveu-o como "um herói popular".

Nos anos 1940, Nagé fazia parte da cena no lendário Barracão de Mestre Waldemar em Corta Braço (depois Liberdade), Salvador. Segundo a entrevista de Waldemar de 1989: "Outros foram José Cabelo Bom, um preto por nome Nagé—que juntaram cinco homens pra matar ele". Esta menção casual da conspiração que eventualmente tiraria a vida de Nagé fala de quão entrelaçadas violência e sobrevivência estavam no mundo da capoeira daquela era.

Nagé foi documentado por múltiplos fotógrafos e cineastas. Ele possivelmente aparece nas fotografias de Pierre Verger de 1948 em Corta Braço. Em 24 de julho de 1954, foi retratado em fotografias publicadas na revista Manchete pelo fotógrafo Salomão Scliar. No mesmo ano, Marcel Gautherot provavelmente também o fotografou.

Em novembro de 1954, Nagé apareceu no documentário pioneiro "Vadiação" dirigido por Alexandre Robatto Filho—um marco do cinema brasileiro no registro da capoeira. O filme de 8 minutos apresentou uma roda em Salvador com os Mestres Bimba e Waldemar, ao lado de Traíra, Zacarias, Curió (o mais velho), Crispim, Caiçara e Rosendo. Nagé jogou em múltiplas sequências: primeiro com um parceiro não identificado, depois com o Curió mais velho, e em um terceiro breve jogo. No filme ele aparece sem camisa, usando um chapéu.

Em 1958, Nagé morreu após ser esfaqueado em Góes Calmon, Bahia. Ele estava se defendendo numa luta de capoeira contra cinco homens—o destino que Waldemar havia profetizado. O conflito originou-se de uma disputa por um pandeiro e um berimbau. Lutou capoeira até o fim, morrendo como havia vivido.

Milhares de pessoas compareceram ao seu funeral. Apesar de sua fama, a história de Nagé foi raramente contada por décadas. Como escreveu Frede Abreu: "Nagé, de propósito ou sem querer, entrou no rol dos malditos da capoeira". Sua associação com desordem de rua e violência fatal levou à sua marginalização da história oficial da capoeira, mesmo representando o que Abreu chamou de "uma história de resistência dos oprimidos".

Em 2017, quatro anos após sua própria morte, o livro de Frede Abreu "Nagé, o Homem Que Lutou Capoeira Até Morrer" foi publicado postumamente pela Editora Barabô, editado por sua filha Elza Abreu. O livro de 132 páginas, com fotografias inéditas e pesquisa histórica, finalmente deu a Nagé a atenção acadêmica que sua vida merecia.

Nagé deixou uma filha chamada Marileide.',
  -- achievements_en
  E'Immortalized in Jorge Amado''s novel "Os Pastores da Noite" (1964); appeared in pioneering film "Vadiação" (November 1954) by Alexandre Robatto Filho; photographed by Pierre Verger (possibly 1948), Salomão Scliar (1954), and Marcel Gautherot (1954); subject of Frede Abreu''s posthumous biography "Nagé, o Homem Que Lutou Capoeira Até Morrer" (2017); recognized as one of the most feared and respected capoeiristas in 1940s-50s Salvador',
  -- achievements_pt
  E'Imortalizado no romance de Jorge Amado "Os Pastores da Noite" (1964); apareceu no filme pioneiro "Vadiação" (novembro de 1954) de Alexandre Robatto Filho; fotografado por Pierre Verger (possivelmente 1948), Salomão Scliar (1954) e Marcel Gautherot (1954); tema da biografia póstuma de Frede Abreu "Nagé, o Homem Que Lutou Capoeira Até Morrer" (2017); reconhecido como um dos capoeiristas mais temidos e respeitados nos anos 1940-50 em Salvador',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1923, year):
Velhos Mestres states "1923?" with question mark. Died 1958, so would have been ~35 at death. His established reputation by the 1940s-50s makes this plausible.

DEATH: 1958 - assassinated by knife wounds in Góes Calmon, Bahia, defending himself in a capoeira fight against five men. Conflict originated from dispute over a pandeiro and berimbau. Thousands attended his funeral.

NAME/APELIDO:
- Full name: José Anastácio de Santana
- Apelido: Nagé (also spelled "Najé")
- Origin of apelido: Named after the village of Nagé in Maragogipe district where he lived

BIRTHPLACE: Coqueiros de Paraguaçu; lived in Nagé (both in Maragogipe district, Recôncavo Baiano)

FAMILY:
- Daughter: Marileide

ASSOCIATES:
- Mestre Waldemar (associated with Barracão in 1940s)
- Traíra (contemporary; both in Vadiação 1954)
- Zacarias Boa Morte (contemporary; both in Vadiação 1954)
- Curió Velho (older capoeirista; played together in Vadiação 1954)

TEACHERS: No direct teacher documented. Waldemar mentions him as one of his students/associates but the exact nature of the relationship is unclear.

MEDIA APPEARANCES:
- 1948 (possibly): Pierre Verger photographs at Corta Braço
- July 24, 1954: Manchete magazine photographs by Salomão Scliar
- 1954: Marcel Gautherot photographs (likely)
- November 1954: Film "Vadiação" by Alexandre Robatto Filho - appears shirtless, wearing hat; plays in three game sequences (with unidentified player, with old Curió, brief third game)

LITERARY REFERENCES:
- 1964: Jorge Amado, "Os Pastores da Noite" - called "um assombro de valentia"
- Wilson da Rocha called him "um herói popular"

SCHOLARLY WORKS:
- 2017: Frede Abreu, "Nagé, o Homem Que Lutou Capoeira Até Morrer" (Editora Barabô, 132 pages) - posthumous publication edited by Elza Abreu

WHY FORGOTTEN:
Frede Abreu wrote: "Nagé, de propósito ou sem querer, entrou no rol dos malditos da capoeira" (Nagé entered the list of the "damned" of capoeira). His association with street violence and fatal confrontation led to marginalization from official capoeira history, despite representing "a history of resistance of the oppressed".',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1923, ano):
Velhos Mestres afirma "1923?" com ponto de interrogação. Morreu em 1958, então teria ~35 anos ao morrer. Sua reputação estabelecida nos anos 1940-50 torna isso plausível.

MORTE: 1958 - assassinado por facadas em Góes Calmon, Bahia, defendendo-se numa luta de capoeira contra cinco homens. Conflito originou-se de disputa por um pandeiro e berimbau. Milhares compareceram ao funeral.

NOME/APELIDO:
- Nome completo: José Anastácio de Santana
- Apelido: Nagé (também escrito "Najé")
- Origem do apelido: Nomeado pela vila de Nagé no distrito de Maragogipe onde vivia

LOCAL DE NASCIMENTO: Coqueiros de Paraguaçu; viveu em Nagé (ambos no distrito de Maragogipe, Recôncavo Baiano)

FAMÍLIA:
- Filha: Marileide

ASSOCIADOS:
- Mestre Waldemar (associado ao Barracão nos anos 1940)
- Traíra (contemporâneo; ambos no Vadiação 1954)
- Zacarias Boa Morte (contemporâneo; ambos no Vadiação 1954)
- Curió Velho (capoeirista mais velho; jogaram juntos no Vadiação 1954)

MESTRES: Nenhum mestre direto documentado. Waldemar menciona-o como um de seus alunos/associados mas a natureza exata da relação não é clara.

APARIÇÕES EM MÍDIA:
- 1948 (possivelmente): Fotografias de Pierre Verger em Corta Braço
- 24 de julho de 1954: Fotografias na revista Manchete por Salomão Scliar
- 1954: Fotografias de Marcel Gautherot (provavelmente)
- Novembro de 1954: Filme "Vadiação" de Alexandre Robatto Filho - aparece sem camisa, usando chapéu; joga em três sequências (com jogador não identificado, com Curió velho, terceiro breve jogo)

REFERÊNCIAS LITERÁRIAS:
- 1964: Jorge Amado, "Os Pastores da Noite" - chamado "um assombro de valentia"
- Wilson da Rocha chamou-o de "um herói popular"

OBRAS ACADÊMICAS:
- 2017: Frede Abreu, "Nagé, o Homem Que Lutou Capoeira Até Morrer" (Editora Barabô, 132 páginas) - publicação póstuma editada por Elza Abreu

POR QUE ESQUECIDO:
Frede Abreu escreveu: "Nagé, de propósito ou sem querer, entrou no rol dos malditos da capoeira". Sua associação com violência de rua e confronto fatal levou à marginalização da história oficial da capoeira, apesar de representar "uma história de resistência dos oprimidos".'
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
