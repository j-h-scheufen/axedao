-- ============================================================
-- GENEALOGY PERSON: Palmeirona
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1875, decade precision):
-- Active between 1902-1911 as documented by Mestre Pastinha.
-- If adult practitioner (ages 25-40) during this period,
-- born approximately 1862-1886. Using 1875 as midpoint.
--
-- SIGNIFICANCE: One of four famous female capoeiristas of
-- 1902-1911 era Bahia, listed by Mestre Pastinha alongside
-- Maria Homem, Júlia Fogareira, and Maria Pernambucana.
--
-- NOTE ON IDENTITY: This is DISTINCT from "Rosa Palmeirão"
-- (Cândida Rosa de Jesus), who is already imported separately.
-- Both names reference palm trees but with different
-- grammatical constructions. Pastinha's primary source
-- consistently uses "Palmeirona" without a first name.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Palmeirona',
  NULL,
  NULL,
  ARRAY[
    'https://velhosmestres.com/en/pastinha-1969-3',
    'https://velhosmestres.com/br/pastinha-1969-3'
  ]::text[],
  NULL::genealogy.style,
  NULL,
  NULL,
  1875,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  E'Palmeirona was one of four famous female capoeiristas of early 20th century Bahia, named by Mestre Pastinha in a 1969 interview with the newspaper A Tarde. Between 1902 and 1911, Salvador witnessed what Pastinha described as "a never-seen spectacle" of female capoeira mestras "as agile and able as the men." Pastinha listed Palmeirona among the famous women practitioners of this era, alongside Maria Homem, Júlia Fogareira, and Maria Pernambucana.

These women learned capoeira from multiple masters available during that period, including a young Pastinha himself, who was 13-22 years old during these years. The era was reportedly "a tough time for the Don Juans and for the police," suggesting these women were formidable fighters who commanded respect in Salvador''s streets.

When asked about how women practiced in their restrictive clothing, Pastinha explained their practical solution: "At that time dresses reached the ground. The women tore their skirts on the sides. They connected the rear part with the front one, putting them on their waist with a string, making a sort of pants." This adaptation was, as Pastinha noted, "enough to play capoeira with any guy."

Like most women capoeiristas of her era, almost no concrete biographical information survives beyond Pastinha''s testimony. The apelido "Palmeirona" is an augmentative form of "palmeira" (palm tree), suggesting either a tall stature or a connection to palm trees—common in Bahia where palm oil (dendê) played a central role in Afro-Brazilian culture.

Academic researchers note that "it is still impossible to be certain of their existence and there are confusions regarding names, due to lack of written documentation." What is certain is that Pastinha consistently remembered these women among the greatest capoeiristas of his youth, and that their presence challenges the common assumption that early capoeira was an exclusively male practice.',
  E'Palmeirona foi uma das quatro famosas capoeiristas mulheres do início do século XX na Bahia, citada por Mestre Pastinha em uma entrevista de 1969 ao jornal A Tarde. Entre 1902 e 1911, Salvador testemunhou o que Pastinha descreveu como "um espetáculo ímpar" de verdadeiras mestras de capoeira "tão ágeis e hábeis quanto os homens." Pastinha listou Palmeirona entre as famosas praticantes desta era, ao lado de Maria Homem, Júlia Fogareira e Maria Pernambucana.

Essas mulheres aprenderam capoeira de vários mestres disponíveis durante aquele período, incluindo o próprio Pastinha ainda jovem, que tinha 13-22 anos durante esses anos. A época foi supostamente "dura para os Don Juans e para a polícia," sugerindo que essas mulheres eram lutadoras formidáveis que comandavam respeito nas ruas de Salvador.

Quando perguntado sobre como as mulheres praticavam com suas roupas restritivas, Pastinha explicou sua solução prática: "Meu filho, naquela época os vestidos arrastavam no chão. As mulheres rasgavam suas saias nos lados. Uniam a parte de trás com a frente, prendendo-as com uma prezilha na cintura, formando uma espécie de calção." Essa adaptação era, como Pastinha observou, "o bastante para jogar a capoeira com qualquer elemento do sexo masculino."

Como a maioria das mulheres capoeiristas de sua era, quase nenhuma informação biográfica concreta sobrevive além do testemunho de Pastinha. O apelido "Palmeirona" é uma forma aumentativa de "palmeira," sugerindo seja uma estatura alta ou uma conexão com palmeiras—comuns na Bahia onde o óleo de palma (dendê) desempenhava papel central na cultura afro-brasileira.

Pesquisadores acadêmicos observam que "ainda é impossível ter certeza de sua existência e há confusões em relação aos nomes, devido à falta de documentação escrita." O que é certo é que Pastinha consistentemente lembrava dessas mulheres entre os maiores capoeiristas de sua juventude, e que sua presença desafia a suposição comum de que a capoeira antiga era uma prática exclusivamente masculina.',
  E'- Listed among four famous female capoeiristas of 1902-1911 era by Mestre Pastinha
- Contemporaneous with Maria Homem, Júlia Fogareira, and Maria Pernambucana
- Learned from multiple masters including young Pastinha
- Part of documented female presence in capoeira before formal academies existed',
  E'- Listada entre as quatro famosas capoeiristas mulheres da era 1902-1911 por Mestre Pastinha
- Contemporânea de Maria Homem, Júlia Fogareira e Maria Pernambucana
- Aprendeu com vários mestres incluindo o jovem Pastinha
- Parte da presença feminina documentada na capoeira antes da existência de academias formais',
  E'BIRTH YEAR ESTIMATION (~1875, decade precision):
Active between 1902-1911 as documented by Mestre Pastinha in 1969 A Tarde interview.
If adult practitioner (ages 25-40) during this period, born approximately 1862-1886.
Using 1875 as midpoint with decade precision.

IDENTITY DISTINCTION:
"Palmeirona" is treated as DISTINCT from "Rosa Palmeirão" (Cândida Rosa de Jesus).
Reasons for separation:
1. Different naming patterns: "Palmeirona" (simple augmentative) vs "Rosa Palmeirão" (first name + surname)
2. Pastinha''s 1969 list does NOT include "Rosa Palmeirão"—only "Palmeirona"
3. Rosa Palmeirão is documented separately in other sources (Pedro Mineiro defeat ~1910-1914, Jorge Amado''s "Mar Morto")
4. Academic sources sometimes list both names in different contexts

POSSIBLE CONFUSION:
Some secondary sources may conflate these figures due to similar palm-tree etymology.
Both "Palmeirona" and "Palmeirão" derive from "palmeira" (palm tree):
- Palmeirona = feminine augmentative
- Palmeirão = masculine augmentative (used as surname for Rosa)

APELIDO MEANING:
"Palmeirona" = augmentative feminine form of "palmeira" (palm tree)
May indicate: tall stature, or connection to palm/dendê culture in Bahia

TEACHERS:
- Mestre Pastinha: Listed as one of her teachers during 1902-1911 period
  (Pastinha was 13-22 years old during this period)
- Multiple unnamed masters: "aprenderam a arte não só com Mestre Pastinha mas também com outros mestres da época"

CONTEMPORARIES (1902-1911 female capoeiristas):
- Maria Homem - Listed together by Pastinha
- Júlia Fogareira - Listed together by Pastinha
- Maria Pernambucana - Listed together by Pastinha

CLOTHING ADAPTATION (per Pastinha):
Women tore their long skirts on the sides and tied front to back with a string,
creating "uma espécie de calção" (a sort of shorts) to allow full range of movement.

PRIMARY SOURCE:
- Mestre Pastinha interview with A Tarde newspaper, February 24, 1969
  Available at velhosmestres.com/br/pastinha-1969-3
  This is the ONLY primary source for Palmeirona

ACADEMIC CAUTION:
Researchers note "it is still impossible to be certain of their existence and
there are confusions regarding names, due to lack of written documentation."
Palmeirona is known ONLY through Pastinha''s oral testimony.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (~1875, precisão década):
Ativa entre 1902-1911 conforme documentado por Mestre Pastinha em entrevista ao A Tarde de 1969.
Se praticante adulta (idades 25-40) durante este período, nascida aproximadamente 1862-1886.
Usando 1875 como ponto médio com precisão de década.

DISTINÇÃO DE IDENTIDADE:
"Palmeirona" é tratada como DISTINTA de "Rosa Palmeirão" (Cândida Rosa de Jesus).
Razões para separação:
1. Diferentes padrões de nomenclatura: "Palmeirona" (simples aumentativo) vs "Rosa Palmeirão" (nome + sobrenome)
2. A lista de Pastinha de 1969 NÃO inclui "Rosa Palmeirão"—apenas "Palmeirona"
3. Rosa Palmeirão é documentada separadamente em outras fontes (derrota de Pedro Mineiro ~1910-1914, "Mar Morto" de Jorge Amado)
4. Fontes acadêmicas às vezes listam ambos os nomes em contextos diferentes

POSSÍVEL CONFUSÃO:
Algumas fontes secundárias podem confundir essas figuras devido à etimologia similar de palmeira.
Tanto "Palmeirona" quanto "Palmeirão" derivam de "palmeira":
- Palmeirona = aumentativo feminino
- Palmeirão = aumentativo masculino (usado como sobrenome para Rosa)

SIGNIFICADO DO APELIDO:
"Palmeirona" = forma aumentativa feminina de "palmeira"
Pode indicar: estatura alta, ou conexão com a cultura de palma/dendê na Bahia

MESTRES:
- Mestre Pastinha: Listado como um de seus mestres durante o período 1902-1911
  (Pastinha tinha 13-22 anos durante este período)
- Múltiplos mestres não nomeados: "aprenderam a arte não só com Mestre Pastinha mas também com outros mestres da época"

CONTEMPORÂNEAS (capoeiristas mulheres 1902-1911):
- Maria Homem - Listada junto por Pastinha
- Júlia Fogareira - Listada junto por Pastinha
- Maria Pernambucana - Listada junto por Pastinha

ADAPTAÇÃO DE VESTIMENTA (per Pastinha):
As mulheres rasgavam suas saias longas nos lados e amarravam frente com trás com uma prezilha,
criando "uma espécie de calção" para permitir amplitude completa de movimento.

FONTE PRIMÁRIA:
- Entrevista de Mestre Pastinha ao jornal A Tarde, 24 de fevereiro de 1969
  Disponível em velhosmestres.com/br/pastinha-1969-3
  Esta é a ÚNICA fonte primária para Palmeirona

CAUTELA ACADÊMICA:
Pesquisadores observam que "ainda é impossível ter certeza de sua existência e
há confusões em relação aos nomes, devido à falta de documentação escrita."
Palmeirona é conhecida APENAS através do testemunho oral de Pastinha.'
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
