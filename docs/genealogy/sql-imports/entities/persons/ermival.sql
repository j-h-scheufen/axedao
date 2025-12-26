-- ============================================================
-- GENEALOGY PERSON: Ermival
-- Generated: 2025-12-25
-- ============================================================
-- Ermival Carneiro (full surname uncertain)
-- Brother of Camisa Roxa, Pedrinho, and José Tadeu (Mestre Camisa)
-- Born at Fazenda Estiva, Jacobina, Bahia
-- Aluno formado of Mestre Bimba's academy
-- ============================================================
-- BIRTH YEAR ESTIMATION (1946-1949, decade precision):
-- Camisa Roxa (eldest) born 1944. Mestre Camisa (youngest brother)
-- born 1955. Ermival is a younger brother of Camisa Roxa but
-- older than José Tadeu. Reasonable estimate: mid-to-late 1940s.
-- Using 1948 as midpoint with decade precision.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Ermival',
  'formado'::genealogy.title,
  NULL,
  ARRAY[]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in Capoeira Regional under Mestre Bimba at his academy in Salvador. Graduated as aluno formado alongside his brothers Pedrinho and José Tadeu (Mestre Camisa).',
  E'Treinou Capoeira Regional com Mestre Bimba em sua academia em Salvador. Formou-se como aluno formado junto com seus irmãos Pedrinho e José Tadeu (Mestre Camisa).',
  -- Life dates
  1948,
  'decade'::genealogy.date_precision,
  'Fazenda Estiva, Jacobina, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Ermival was one of ten children born to the Carneiro family at Fazenda Estiva, a farm in the interior of Jacobina, Bahia. His eldest brother, Edvaldo Carneiro e Silva, would become the legendary Grão-Mestre Camisa Roxa, considered the best student of Mestre Bimba.

When Camisa Roxa''s father died around 1965, the twenty-one-year-old eldest brother became the family patriarch. He took on the responsibility of educating his younger siblings and providing for their welfare. Under his guidance and example, three of his brothers—Ermival, Pedrinho, and José Tadeu—followed him to Salvador to train capoeira with Mestre Bimba.

Like his older brother, Ermival joined Mestre Bimba''s academy in Salvador, likely in the mid-to-late 1960s. Along with Pedrinho and José Tadeu, he completed the rigorous training regimen and graduated as an aluno formado—a formally graduated student of the Academia de Mestre Bimba.

The Carneiro family of Jacobina represents one of the most significant capoeira dynasties of the 20th century. While Camisa Roxa became one of the pioneers who brought capoeira to Europe, and José Tadeu (Mestre Camisa) went on to found Abadá-Capoeira in 1988, Ermival''s role in this family tradition—though less publicly documented—was part of the foundation that made this family legacy possible.',
  -- bio_pt
  E'Ermival foi um dos dez filhos nascidos da família Carneiro na Fazenda Estiva, uma fazenda no interior de Jacobina, Bahia. Seu irmão mais velho, Edvaldo Carneiro e Silva, se tornaria o lendário Grão-Mestre Camisa Roxa, considerado o melhor aluno de Mestre Bimba.

Quando o pai de Camisa Roxa faleceu por volta de 1965, o irmão mais velho de vinte e um anos tornou-se o patriarca da família. Ele assumiu a responsabilidade de educar seus irmãos mais novos e prover seu bem-estar. Sob sua orientação e exemplo, três de seus irmãos—Ermival, Pedrinho e José Tadeu—o seguiram até Salvador para treinar capoeira com Mestre Bimba.

Como seu irmão mais velho, Ermival ingressou na academia de Mestre Bimba em Salvador, provavelmente em meados ou final dos anos 1960. Junto com Pedrinho e José Tadeu, ele completou o rigoroso regime de treinamento e formou-se como aluno formado—um aluno formalmente graduado da Academia de Mestre Bimba.

A família Carneiro de Jacobina representa uma das dinastias de capoeira mais significativas do século XX. Enquanto Camisa Roxa se tornou um dos pioneiros que levaram a capoeira para a Europa, e José Tadeu (Mestre Camisa) fundou a Abadá-Capoeira em 1988, o papel de Ermival nesta tradição familiar—embora menos documentado publicamente—foi parte da fundação que tornou este legado familiar possível.',
  -- achievements_en
  E'Graduated as aluno formado from Mestre Bimba''s academy in Salvador; Member of the Carneiro capoeira dynasty from Jacobina, Bahia',
  -- achievements_pt
  E'Formou-se como aluno formado da academia de Mestre Bimba em Salvador; Membro da dinastia de capoeira Carneiro de Jacobina, Bahia',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1948, decade):
Camisa Roxa (eldest brother) born January 7, 1944. Mestre Camisa (José Tadeu, youngest of the three brothers who trained with Bimba) born October 28, 1955. Ermival is described as a younger brother of Camisa Roxa who followed him to Bimba''s academy. Reasonable estimate places his birth in the mid-to-late 1940s. Using 1948 as midpoint with decade precision.

NAME:
Only "Ermival" documented in sources. Full name likely "Ermival Carneiro" following family pattern but not confirmed. Birth records from Jacobina could potentially confirm.

FAMILY (Carneiro capoeiristas from Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - eldest, b. 1944, became Grão-Mestre
- Ermival - younger brother, aluno formado
- Pedrinho - younger brother, aluno formado
- José Tadeu (Mestre Camisa) - youngest, b. 1955, founder of Abadá-Capoeira

TRAINING TIMELINE:
- Camisa Roxa entered Bimba''s academy 1962/1963
- Ermival followed after, likely mid-to-late 1960s
- All three younger brothers became alunos formados
- Mestre Camisa was "the fourth in the family to learn capoeira"

DEATH: Unknown. No documentation found.

TITLE: Listed as aluno formado (not mestre). No evidence found that he received mestre title.',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1948, década):
Camisa Roxa (irmão mais velho) nasceu 7 de janeiro de 1944. Mestre Camisa (José Tadeu, mais novo dos três irmãos que treinaram com Bimba) nasceu 28 de outubro de 1955. Ermival é descrito como irmão mais novo de Camisa Roxa que o seguiu até a academia de Bimba. Estimativa razoável coloca seu nascimento em meados ou final dos anos 1940. Usando 1948 como ponto médio com precisão de década.

NOME:
Apenas "Ermival" documentado nas fontes. Nome completo provavelmente "Ermival Carneiro" seguindo padrão familiar, mas não confirmado. Registros de nascimento de Jacobina poderiam potencialmente confirmar.

FAMÍLIA (capoeiristas Carneiro da Fazenda Estiva, Jacobina):
- Camisa Roxa (Edvaldo Carneiro e Silva) - mais velho, n. 1944, tornou-se Grão-Mestre
- Ermival - irmão mais novo, aluno formado
- Pedrinho - irmão mais novo, aluno formado
- José Tadeu (Mestre Camisa) - caçula, n. 1955, fundador da Abadá-Capoeira

CRONOLOGIA DE TREINAMENTO:
- Camisa Roxa entrou na academia de Bimba 1962/1963
- Ermival seguiu depois, provavelmente meados ou final dos anos 1960
- Todos os três irmãos mais novos tornaram-se alunos formados
- Mestre Camisa foi "o quarto na família a aprender capoeira"

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
