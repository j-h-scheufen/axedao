-- ============================================================
-- GENEALOGY PERSON: Antônio Corró
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR: 1870 - Confirmed by velhosmestres.com
-- This places his birth during slavery in Brazil (Lei Áurea 1888).
-- As an ex-slave born in 1870, he would have been 18 at abolition.
--
-- DEATH YEAR: Unknown. When he began teaching Paraná in 1932,
-- he was 62 years old. Given his age and the fact that Paraná
-- left for Rio in 1945, Corró likely died in the late 1930s or
-- early 1940s, but no documentation confirms this.
--
-- SIGNIFICANCE: Layer Zero proto-mestre. One of the last
-- generation of capoeiristas born into slavery who transmitted
-- the art to the 20th century masters. His only documented
-- student, Mestre Paraná, became one of four founding lineages
-- of Contemporary Capoeira in Rio de Janeiro.
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
  NULL,  -- Full name unknown
  'Antônio Corró',
  NULL::genealogy.title,  -- Formal titles did not exist in this era
  NULL,  -- No known photographs
  ARRAY[
    'https://velhosmestres.com/br/destaques-14'
  ]::text[],
  -- Capoeira-specific
  NULL::genealogy.style,  -- Angola/Regional distinction came later
  NULL,
  NULL,
  -- Life dates
  1870,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',  -- Inferred from work location and slavery context
  NULL,  -- Death year unknown
  NULL::genealogy.date_precision,
  NULL,
  -- Extended content (English)
  E'Antônio Corró was born in 1870, during the final decades of slavery in Brazil. He was an enslaved person who gained freedom either through manumission or the Lei Áurea (Golden Law) of 1888, when he would have been eighteen years old. He was illiterate, as was common for the enslaved population denied access to education.

Corró worked as a cart driver (carroceiro) at the Cais Dourado in Salvador—a location that in the late 19th and early 20th centuries was legendary as a gathering point for capoeiristas. The Cais Dourado and the surrounding Pilar district were zones of commerce, maritime labor, and notoriously, capoeira. Stevedores, dock workers, and saveiristas congregated there, and the area witnessed frequent clashes between capoeiristas and police under the persecution of figures like José Alvaro Cova.

In 1932, when Corró was sixty-two years old, he began teaching capoeira to young Oswaldo Lisboa dos Santos—later known as Mestre Paraná—in the Alto das Pombas neighborhood, in the Federação district of Salvador. This places Corró among the last generation of capoeiristas who had been born into slavery and who transmitted the art to what would become the modern era.

Corró''s fate after the early 1930s is undocumented. When Mestre Paraná left Salvador for Rio de Janeiro in February 1945, Corró would have been seventy-five years old, if still alive. No record of his death has been found.

Though Corró left almost no historical trace beyond the testimony of his student, his legacy endures through Mestre Paraná, who became one of the four founding lineages of Contemporary Capoeira in Rio de Janeiro. Through Paraná, Corró''s lineage extends to Grupo Muzenza and countless practitioners worldwide. He represents the anonymous layer of African and Afro-Brazilian ancestors who preserved and transmitted capoeira through the era of criminalization and persecution.',
  -- Extended content (Portuguese)
  E'Antônio Corró nasceu em 1870, durante as últimas décadas da escravidão no Brasil. Foi uma pessoa escravizada que obteve liberdade seja por alforria ou pela Lei Áurea de 1888, quando teria dezoito anos de idade. Era analfabeto, como era comum para a população escravizada privada de acesso à educação.

Corró trabalhava como carroceiro no Cais Dourado em Salvador—um local que no final do século XIX e início do século XX era lendário como ponto de encontro de capoeiristas. O Cais Dourado e o entorno do bairro do Pilar eram zonas de comércio, trabalho marítimo e, notoriamente, capoeira. Estivadores, trabalhadores portuários e saveiristas se congregavam ali, e a área testemunhou frequentes confrontos entre capoeiristas e a polícia sob a perseguição de figuras como José Alvaro Cova.

Em 1932, quando Corró tinha sessenta e dois anos, começou a ensinar capoeira ao jovem Oswaldo Lisboa dos Santos—mais tarde conhecido como Mestre Paraná—no bairro do Alto das Pombas, na região da Federação em Salvador. Isso posiciona Corró entre a última geração de capoeiristas que havia nascido na escravidão e que transmitiu a arte para o que se tornaria a era moderna.

O destino de Corró após o início dos anos 1930 não está documentado. Quando Mestre Paraná deixou Salvador rumo ao Rio de Janeiro em fevereiro de 1945, Corró teria setenta e cinco anos, se ainda estivesse vivo. Nenhum registro de sua morte foi encontrado.

Embora Corró tenha deixado quase nenhum vestígio histórico além do testemunho de seu aluno, seu legado perdura através de Mestre Paraná, que se tornou uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro. Através de Paraná, a linhagem de Corró se estende ao Grupo Muzenza e incontáveis praticantes pelo mundo. Ele representa a camada anônima de ancestrais africanos e afro-brasileiros que preservaram e transmitiram a capoeira através da era de criminalização e perseguição.',
  -- Achievements (English)
  E'- Teacher of Mestre Paraná, one of four founding lineages of Contemporary Capoeira in Rio de Janeiro
- One of the last generation of capoeiristas born into slavery
- Transmitted capoeira across the transition from criminalization (1890) to legalization (1930s)',
  -- Achievements (Portuguese)
  E'- Mestre de Mestre Paraná, uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro
- Uma das últimas gerações de capoeiristas nascidos na escravidão
- Transmitiu a capoeira através da transição da criminalização (1890) à legalização (anos 1930)',
  -- Researcher notes (English)
  E'BIRTH YEAR: 1870 - Per velhosmestres.com and capoeiranews.com.br, confirmed as exact.
Born during slavery (Lei Áurea 1888 = abolition).

DEATH YEAR: Unknown. He was 62 in 1932 when he began teaching Paraná.
If alive when Paraná left in 1945, he would have been 75.
No death records found.

WORK LOCATION: Cais Dourado, Salvador
- This was a legendary gathering point for capoeiristas in late 19th/early 20th century
- Zone of commerce, dock workers, stevedores, saveiristas
- Witnessed frequent conflicts between capoeiristas and police
- Connected to figures like Besouro, Tico, Caboclinho, Pedro Porreta

TEACHING LOCATION: Alto das Pombas, Federação neighborhood, Salvador
- Also the birth neighborhood of Mestre Paraná

KNOWN STUDENTS:
- Mestre Paraná (Oswaldo Lisboa dos Santos) - began 1932

TEACHERS: Unknown
- Corró was born in 1870, so he likely learned capoeira in the 1880s-1890s
- During this period, capoeira was criminalized (1890 Penal Code)
- His teachers would have been born around 1830-1850, during slavery

TITLE: NULL - Formal titles like "mestre" did not exist in the modern sense
during Corró''s active years. He is described as teaching Paraná, but
without the organizational structure of later academies.

STYLE: NULL - The Angola/Regional distinction emerged in the 1930s with
Mestre Bimba''s Capoeira Regional. Corró''s capoeira predated this divide.

NAME NOTE: Sometimes spelled "Corró" with accent, sometimes "Corro" without.
Using "Antônio Corró" as the standardized form.

SOURCES:
- velhosmestres.com/br/destaques-14 (primary)
- capoeiranews.com.br/2021/04/mestre-parana-1922-1972.html
- capoeirahistory.com/mestre/master-parana-1922-1972/',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: 1870 - Conforme velhosmestres.com e capoeiranews.com.br, confirmado como exato.
Nascido durante a escravidão (Lei Áurea 1888 = abolição).

ANO DE FALECIMENTO: Desconhecido. Tinha 62 anos em 1932 quando começou a ensinar Paraná.
Se estivesse vivo quando Paraná partiu em 1945, teria 75 anos.
Nenhum registro de óbito encontrado.

LOCAL DE TRABALHO: Cais Dourado, Salvador
- Era um lendário ponto de encontro de capoeiristas no final do século XIX/início do XX
- Zona de comércio, trabalhadores portuários, estivadores, saveiristas
- Testemunhou frequentes conflitos entre capoeiristas e polícia
- Conectado a figuras como Besouro, Tico, Caboclinho, Pedro Porreta

LOCAL DE ENSINO: Alto das Pombas, bairro da Federação, Salvador
- Também o bairro de nascimento de Mestre Paraná

ALUNOS CONHECIDOS:
- Mestre Paraná (Oswaldo Lisboa dos Santos) - começou em 1932

MESTRES: Desconhecidos
- Corró nasceu em 1870, então provavelmente aprendeu capoeira nos anos 1880-1890
- Durante este período, capoeira era criminalizada (Código Penal de 1890)
- Seus mestres teriam nascido por volta de 1830-1850, durante a escravidão

TÍTULO: NULL - Títulos formais como "mestre" não existiam no sentido moderno
durante os anos ativos de Corró. Ele é descrito como ensinando Paraná, mas
sem a estrutura organizacional das academias posteriores.

ESTILO: NULL - A distinção Angola/Regional surgiu nos anos 1930 com a
Capoeira Regional de Mestre Bimba. A capoeira de Corró precedeu esta divisão.

NOTA SOBRE O NOME: Às vezes escrito "Corró" com acento, às vezes "Corro" sem.
Usando "Antônio Corró" como forma padronizada.

FONTES:
- velhosmestres.com/br/destaques-14 (primária)
- capoeiranews.com.br/2021/04/mestre-parana-1922-1972.html
- capoeirahistory.com/mestre/master-parana-1922-1972/'
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
