-- ============================================================
-- GENEALOGY PERSON: Pedrinho (Carneiro)
-- Generated: 2025-12-25
-- ============================================================
-- Pedrinho Carneiro (full surname uncertain)
-- Brother of Camisa Roxa, Ermival, and José Tadeu (Mestre Camisa)
-- Born at Fazenda Estiva, Jacobina, Bahia
-- Aluno formado of Mestre Bimba's academy
-- ============================================================
-- BIRTH YEAR ESTIMATION (1946-1953, decade precision):
-- Camisa Roxa (eldest) born 1944. Mestre Camisa (José Tadeu,
-- youngest of the four male capoeirista brothers) born 1955.
-- José Tadeu was "the fourth to learn capoeira" in the family.
-- Since family learned in order (Camisa Roxa first, then
-- Ermival and Pedrinho, then José Tadeu), Pedrinho must be
-- between Ermival (~1948) and Camisa (~1955).
-- Using 1950 as midpoint with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Pedrinho',
  'Carneiro',
  'formado'::genealogy.title,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in Capoeira Regional under Mestre Bimba at his academy in Salvador. Graduated as aluno formado alongside his brothers Ermival and José Tadeu (Mestre Camisa). Part of the Carneiro capoeira dynasty from Jacobina, Bahia.',
  E'Treinou Capoeira Regional com Mestre Bimba em sua academia em Salvador. Formou-se como aluno formado junto com seus irmãos Ermival e José Tadeu (Mestre Camisa). Parte da dinastia de capoeira Carneiro de Jacobina, Bahia.',
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  'Fazenda Estiva, Jacobina, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Pedrinho was one of ten children born to the Carneiro family at Fazenda Estiva, a farm in the interior of Jacobina, Bahia. His eldest brother, Edvaldo Carneiro e Silva, would become the legendary Grão-Mestre Camisa Roxa, considered the best student of Mestre Bimba.

When Camisa Roxa''s father died around 1965, the twenty-one-year-old eldest brother became the family patriarch. As Mestre Camisa later recalled, "He was a second father to us". Under his guidance and example, three of his younger brothers—Ermival, Pedrinho, and José Tadeu—followed him to Salvador to train capoeira with Mestre Bimba.

Pedrinho joined Mestre Bimba''s academy in Salvador, likely in the mid-to-late 1960s. Along with Ermival and José Tadeu, he completed the rigorous training regimen and graduated as an aluno formado—a formally graduated student of the Academia de Mestre Bimba. According to Mestre Camisa, he was "the fourth in my family to graduate from Mestre Bimba''s capoeira course", which places Pedrinho and Ermival as the second and third graduates before him.

The Carneiro family of Jacobina represents one of the most significant capoeira dynasties of the 20th century. From this single family at Fazenda Estiva came four brothers who trained at Mestre Bimba''s academy (the family''s fifth capoeirista remains unidentified). While Camisa Roxa became one of the pioneers who brought capoeira to Europe, and José Tadeu (Mestre Camisa) went on to found Abadá-Capoeira in 1988, Pedrinho''s role in this family tradition—though less publicly documented—was part of the foundation that made this family legacy possible.',
  -- bio_pt
  E'Pedrinho foi um dos dez filhos nascidos da família Carneiro na Fazenda Estiva, uma fazenda no interior de Jacobina, Bahia. Seu irmão mais velho, Edvaldo Carneiro e Silva, se tornaria o lendário Grão-Mestre Camisa Roxa, considerado o melhor aluno de Mestre Bimba.

Quando o pai de Camisa Roxa faleceu por volta de 1965, o irmão mais velho de vinte e um anos tornou-se o patriarca da família. Como Mestre Camisa recordou mais tarde, "Ele foi um segundo pai para nós". Sob sua orientação e exemplo, três de seus irmãos mais novos—Ermival, Pedrinho e José Tadeu—o seguiram até Salvador para treinar capoeira com Mestre Bimba.

Pedrinho ingressou na academia de Mestre Bimba em Salvador, provavelmente em meados ou final dos anos 1960. Junto com Ermival e José Tadeu, ele completou o rigoroso regime de treinamento e formou-se como aluno formado—um aluno formalmente graduado da Academia de Mestre Bimba. Segundo Mestre Camisa, ele foi "o quarto da minha família a se formar no curso de capoeira de Mestre Bimba", o que coloca Pedrinho e Ermival como segundo e terceiro formados antes dele.

A família Carneiro de Jacobina representa uma das dinastias de capoeira mais significativas do século XX. Desta única família da Fazenda Estiva saíram quatro irmãos que treinaram na academia de Mestre Bimba (o quinto capoeirista da família permanece não identificado). Enquanto Camisa Roxa se tornou um dos pioneiros que levaram a capoeira para a Europa, e José Tadeu (Mestre Camisa) fundou a Abadá-Capoeira em 1988, o papel de Pedrinho nesta tradição familiar—embora menos documentado publicamente—foi parte da fundação que tornou este legado familiar possível.',
  -- achievements_en
  E'Graduated as aluno formado from Mestre Bimba''s academy in Salvador; Member of the Carneiro capoeira dynasty from Jacobina, Bahia',
  -- achievements_pt
  E'Formou-se como aluno formado da academia de Mestre Bimba em Salvador; Membro da dinastia de capoeira Carneiro de Jacobina, Bahia',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1950, decade):
Camisa Roxa (eldest brother) born January 7, 1944. Mestre Camisa (José Tadeu, youngest of the four brothers who trained with Bimba) born October 28, 1955. Mestre Camisa stated he was "the fourth in my family to graduate from Mestre Bimba''s capoeira course", suggesting Ermival, Pedrinho, and Camisa Roxa graduated before him. Pedrinho is described as a younger brother of Camisa Roxa. Reasonable estimate places his birth in the late 1940s to early 1950s. Using 1950 as midpoint with decade precision.

NAME:
Only "Pedrinho" documented in sources. Full name likely "Pedro Carneiro" following family pattern but not confirmed. Birth records from Jacobina could potentially confirm. "Pedrinho" is diminutive form of "Pedro".

APELIDO_CONTEXT:
Using "Carneiro" to distinguish from other capoeiristas named "Pedrinho" (e.g., Pedrinho Fio do Ouro mentioned in sources as teacher of Mestre Cigano in 1972 Bahia).

FAMILY (Carneiro capoeiristas from Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - eldest, b. 1944, first to learn capoeira, became Grão-Mestre
- Ermival - younger brother, aluno formado, estimated ~1948
- Pedrinho - younger brother, aluno formado, estimated ~1950
- José Tadeu (Mestre Camisa) - youngest of brothers, b. 1955, fourth to learn, founder of Abadá-Capoeira
- Fifth capoeirista - unknown (possibly a sibling, as Mestre Camisa came from "a family of five capoeiristas")

TRAINING TIMELINE:
- Camisa Roxa entered Bimba''s academy 1962/1963
- Ermival and Pedrinho followed after, likely mid-to-late 1960s
- José Tadeu (Camisa) graduated with Macarrão, Onça Negra, and Torpedo in 1969 at age 14
- All four brothers became alunos formados

FAMILY STRUCTURE:
- Father died when Camisa Roxa was 21 (~1965)
- Camisa Roxa became family patriarch
- Ten children total (4 boys, 5 girls according to some sources; 9 siblings according to others)

DEATH: Unknown. No documentation found.

TITLE: Listed as aluno formado (not mestre). No evidence found that he received mestre title.',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1950, década):
Camisa Roxa (irmão mais velho) nasceu 7 de janeiro de 1944. Mestre Camisa (José Tadeu, mais novo dos quatro irmãos que treinaram com Bimba) nasceu 28 de outubro de 1955. Mestre Camisa afirmou que foi "o quarto da minha família a se formar no curso de capoeira de Mestre Bimba", sugerindo que Ermival, Pedrinho e Camisa Roxa se formaram antes dele. Pedrinho é descrito como irmão mais novo de Camisa Roxa. Estimativa razoável coloca seu nascimento no final dos anos 1940 ou início dos anos 1950. Usando 1950 como ponto médio com precisão de década.

NOME:
Apenas "Pedrinho" documentado nas fontes. Nome completo provavelmente "Pedro Carneiro" seguindo padrão familiar, mas não confirmado. Registros de nascimento de Jacobina poderiam potencialmente confirmar. "Pedrinho" é forma diminutiva de "Pedro".

APELIDO_CONTEXT:
Usando "Carneiro" para distinguir de outros capoeiristas chamados "Pedrinho" (ex: Pedrinho Fio do Ouro mencionado nas fontes como professor de Mestre Cigano em 1972 na Bahia).

FAMÍLIA (capoeiristas Carneiro da Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - mais velho, n. 1944, primeiro a aprender capoeira, tornou-se Grão-Mestre
- Ermival - irmão mais novo, aluno formado, estimado ~1948
- Pedrinho - irmão mais novo, aluno formado, estimado ~1950
- José Tadeu (Mestre Camisa) - caçula dos irmãos, n. 1955, quarto a aprender, fundador da Abadá-Capoeira
- Quinto capoeirista - desconhecido (possivelmente um irmão, já que Mestre Camisa veio de "uma família de cinco capoeiristas")

CRONOLOGIA DE TREINAMENTO:
- Camisa Roxa entrou na academia de Bimba 1962/1963
- Ermival e Pedrinho seguiram depois, provavelmente meados ou final dos anos 1960
- José Tadeu (Camisa) formou-se com Macarrão, Onça Negra e Torpedo em 1969 aos 14 anos
- Todos os quatro irmãos tornaram-se alunos formados

ESTRUTURA FAMILIAR:
- Pai faleceu quando Camisa Roxa tinha 21 anos (~1965)
- Camisa Roxa tornou-se patriarca da família
- Dez filhos no total (4 meninos, 5 meninas segundo algumas fontes; 9 irmãos segundo outras)

MORTE: Desconhecida. Nenhuma documentação encontrada.

TÍTULO: Listado como aluno formado (não mestre). Nenhuma evidência encontrada de que recebeu título de mestre.'
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
