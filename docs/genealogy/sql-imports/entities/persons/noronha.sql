-- ============================================================
-- GENEALOGY PERSON: Noronha (Daniel Coutinho)
-- Migrated: 2025-12-11
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
  'Daniel Coutinho',
  'Noronha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-9', 'https://www.lalaue.com/learn-capoeira/mestre-noronha/', 'https://nossa-tribo.com/mestre-noronha/', 'https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira angola as taught by Mestre Cândido Pequeno. Noronha learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia" from his teacher. He practiced during the era of criminalization and helped preserve the art through formal organization at Gengibirra.',
  E'Capoeira angola tradicional como ensinada por Mestre Cândido Pequeno. Noronha aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia" com seu mestre. Praticou durante a era de criminalização e ajudou a preservar a arte através da organização formal no Gengibirra.',
  -- Life dates
  1909,
  'exact'::genealogy.date_precision,
  'Beco do Girassol, Baixa dos Sapateiros, Salvador, Bahia, Brazil',
  1977,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'Daniel Coutinho was born on August 3, 1909, in Beco do Girassol, in the Baixa dos Sapateiros neighborhood of Salvador, Bahia. His parents were José Coutinho and Maria Conceição, both of indigenous descent. Unlike most capoeiristas of his era, Noronha possessed reading and writing abilities, which he considered himself educated for that time.

At eight years old, in 1917, young Daniel began learning capoeira from Mestre Cândido Pequeno in Beco de Xaréu. Cândido Pequeno, known as "Argolinha de Ouro" (Golden Little Ring) for the small gold earring he wore, was recognized as "the champion of capoeira in the State of Bahia". From him, Noronha learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia", with complete dedication.

In the 1920s, Noronha was among the 22 founding mestres who established the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood. This was the first organized center for Capoeira Angola in Bahia. The center adopted green and yellow—the colors of the Brazilian flag—as its official colors. Four mestres were recognized as "donos e proprietários" (owners and proprietors): Noronha himself, his brother Livino (Livino Boca da Barra/Livino Malvadeza), Totonho de Maré, and Amorzinho.

With his brother Livino, Noronha also managed the Centro de Capoeira Angola da Conceição da Praia and taught in Maciel de Baixo, n° 31, in Salvador.

Noronha worked many jobs throughout his life: shoeshine boy, stevedore, dock worker (trapicheiro), ragpicker, shipboard worker, truck driver assistant, street porter, and in the petroleum industry. From 1939 onwards, he was employed at the Sindicato dos Conferentes e Consertadores de Carga e Descarga do Pôrto da Cidade do Salvador (the port workers'' union).

His personal life included two marriages. His first wife died during childbirth, leaving him with three children. His second marriage, lasting approximately 30 years, was to Maria Joana Batista Coutinho, known as "Dofana", a woman of the Kêtu nation devoted to Iansã. Together they had six children.

In 1941, after the death of Amorzinho (the civil guard who had protected the Gengibirra rodas from police harassment), Noronha and the other surviving mestres handed the Centro Nacional de Capoeira de Origem Angola to Mestre Pastinha. In Noronha''s own words: "Because of the death of Amorzinho, the guard, we handed over the Centre to Mestre Pastinha to take care and this Centre was registered by the efforts of Mestre Pastinha, who knew how to raise this Center to prominence".

In 1968, Noronha participated in Jair Moura''s film "Dança de Guerra". In 1971, he provided historical information for Jair Moura''s article published in A Tarde newspaper.

Throughout his life, Noronha documented his knowledge in handwritten notebooks using all capital letters, old Portuguese spelling conventions, and minimal punctuation—essentially transcribing speech directly. On April 29, 1976, at age 66, he completed his manuscripts. He died on November 17, 1977.

Frede Abreu first published his manuscripts in 1993 under the title "O ABC da Capoeira Angola: Os manuscritos do Mestre Noronha" with support from the Federal District Government and the National Programme of Capoeira. These manuscripts remain one of the most important primary sources for understanding early 20th century capoeira in Salvador, documenting not only techniques but the names, relationships, and organization of the founding generation of Capoeira Angola.',
  -- bio_pt
  E'Daniel Coutinho nasceu em 3 de agosto de 1909, no Beco do Girassol, na Baixa dos Sapateiros, Salvador, Bahia. Seus pais eram José Coutinho e Maria Conceição, ambos de descendência indígena. Diferentemente da maioria dos capoeiristas de sua época, Noronha possuía habilidades de leitura e escrita, o que ele considerava ser educado para aquele tempo.

Aos oito anos, em 1917, o jovem Daniel começou a aprender capoeira com Mestre Cândido Pequeno no Beco de Xaréu. Cândido Pequeno, conhecido como "Argolinha de Ouro" pelo pequeno brinco de ouro que usava, era reconhecido como "o campeão da capoeira do Estado da Bahia". Com ele, Noronha aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia", com completa dedicação.

Na década de 1920, Noronha estava entre os 22 mestres fundadores que estabeleceram o Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade. Este foi o primeiro centro organizado de Capoeira Angola na Bahia. O centro adotou o verde e amarelo—as cores da bandeira brasileira—como suas cores oficiais. Quatro mestres foram reconhecidos como "donos e proprietários": o próprio Noronha, seu irmão Livino (Livino Boca da Barra/Livino Malvadeza), Totonho de Maré e Amorzinho.

Com seu irmão Livino, Noronha também gerenciou o Centro de Capoeira Angola da Conceição da Praia e ensinou no Maciel de Baixo, n° 31, em Salvador.

Noronha trabalhou em muitos empregos ao longo da vida: engraxate, estivador, trapicheiro, catador, trabalhador de navio, ajudante de caminhoneiro, carregador de rua e na indústria petrolífera. A partir de 1939, foi empregado no Sindicato dos Conferentes e Consertadores de Carga e Descarga do Pôrto da Cidade do Salvador.

Sua vida pessoal incluiu dois casamentos. Sua primeira esposa morreu durante o parto, deixando-o com três filhos. Seu segundo casamento, durando aproximadamente 30 anos, foi com Maria Joana Batista Coutinho, conhecida como "Dofana", uma mulher da nação Kêtu devota de Iansã. Juntos tiveram seis filhos.

Em 1941, após a morte de Amorzinho (o guarda civil que havia protegido as rodas do Gengibirra do assédio policial), Noronha e os outros mestres sobreviventes entregaram o Centro Nacional de Capoeira de Origem Angola a Mestre Pastinha. Nas próprias palavras de Noronha: "Por causa da morte de Amorzinho, o guarda, nós entregamos o Centro a Mestre Pastinha para cuidar e este Centro foi registrado pelos esforços de Mestre Pastinha, que soube elevar este Centro à proeminência".

Em 1968, Noronha participou do filme "Dança de Guerra" de Jair Moura. Em 1971, forneceu informações históricas para o artigo de Jair Moura publicado no jornal A Tarde.

Ao longo de sua vida, Noronha documentou seu conhecimento em cadernos manuscritos usando todas as letras maiúsculas, convenções ortográficas do português antigo e pontuação mínima—essencialmente transcrevendo a fala diretamente. Em 29 de abril de 1976, aos 66 anos, completou seus manuscritos. Morreu em 17 de novembro de 1977.

Frede Abreu publicou seus manuscritos pela primeira vez em 1993 sob o título "O ABC da Capoeira Angola: Os manuscritos do Mestre Noronha" com apoio do Governo do Distrito Federal e do Programa Nacional de Capoeira. Esses manuscritos permanecem como uma das mais importantes fontes primárias para entender a capoeira do início do século XX em Salvador, documentando não apenas técnicas, mas os nomes, relacionamentos e organização da geração fundadora da Capoeira Angola.',
  -- achievements_en
  E'Co-founded the Centro Nacional de Capoeira de Origem Angola at Gengibirra (1920s) - the first organized Capoeira Angola center in Bahia
One of four recognized "donos e proprietários" (owners and proprietors) of Gengibirra alongside Livino, Totonho de Maré, and Amorzinho
Co-managed the Centro de Capoeira Angola da Conceição da Praia with his brother Mestre Livino
Participated in Jair Moura''s film "Dança de Guerra" (1968)
Authored "O ABC da Capoeira Angola - Os Manuscritos do Mestre Noronha" (completed 1976, published 1993)
Provided primary historical documentation of early 20th century capoeira including the founding mestres and organization of Gengibirra
His manuscripts serve as an irreplaceable source for capoeira historians',
  -- achievements_pt
  E'Co-fundou o Centro Nacional de Capoeira de Origem Angola no Gengibirra (década de 1920) - o primeiro centro organizado de Capoeira Angola na Bahia
Um dos quatro reconhecidos "donos e proprietários" do Gengibirra ao lado de Livino, Totonho de Maré e Amorzinho
Co-gerenciou o Centro de Capoeira Angola da Conceição da Praia com seu irmão Mestre Livino
Participou do filme "Dança de Guerra" de Jair Moura (1968)
Autor de "O ABC da Capoeira Angola - Os Manuscritos do Mestre Noronha" (concluído em 1976, publicado em 1993)
Forneceu documentação histórica primária da capoeira do início do século XX incluindo os mestres fundadores e organização do Gengibirra
Seus manuscritos servem como fonte insubstituível para historiadores da capoeira',
  -- notes_en
  E'BIRTH DATE: August 3, 1909 is documented across multiple sources including velhosmestres.com. Birth place: Beco do Girassol, Baixa dos Sapateiros.

DEATH DATE: November 17, 1977 is documented across multiple sources.

PARENTS: José Coutinho and Maria Conceição, both described as having indigenous descent.

TEACHER: Mestre Cândido Pequeno (Cândido da Costa), known as "Argolinha de Ouro" - began training 1917 in Beco de Xaréu.

BROTHER: Mestre Livino (Livino Boca da Barra / Livino Malvadeza) - co-founder of Gengibirra and co-manager of Centro de Capoeira Angola Conceição da Praia.

MANUSCRIPTS: Completed April 29, 1976. Published posthumously in 1993 by Frede Abreu with support from GDF, National Programme of Capoeira/Project Capoeira Art and Craft, DEFER, and CIDOCA/DF.

DISTINCTION FROM ANTÔNIO DE NORONHA: This is Daniel Coutinho "Mestre Noronha" (1909-1977), the historian. NOT to be confused with "Mestre Antônio de Noronha" (~1875-unknown), the historical teacher of Aberrê. They are two different people.

PENDING RELATIONSHIPS (require future imports):
- Noronha associated_with Livino (brother, co-founder of Gengibirra)
- Noronha associated_with Amorzinho (co-founder of Gengibirra)
- Various student relationships may exist but are not documented',
  -- notes_pt
  E'DATA DE NASCIMENTO: 3 de agosto de 1909 está documentado em múltiplas fontes incluindo velhosmestres.com. Local de nascimento: Beco do Girassol, Baixa dos Sapateiros.

DATA DE MORTE: 17 de novembro de 1977 está documentado em múltiplas fontes.

PAIS: José Coutinho e Maria Conceição, ambos descritos como tendo descendência indígena.

MESTRE: Mestre Cândido Pequeno (Cândido da Costa), conhecido como "Argolinha de Ouro" - começou a treinar em 1917 no Beco de Xaréu.

IRMÃO: Mestre Livino (Livino Boca da Barra / Livino Malvadeza) - co-fundador do Gengibirra e co-gestor do Centro de Capoeira Angola Conceição da Praia.

MANUSCRITOS: Concluídos em 29 de abril de 1976. Publicados postumamente em 1993 por Frede Abreu com apoio do GDF, Programa Nacional de Capoeira/Projeto Capoeira Arte e Ofício, DEFER e CIDOCA/DF.

DISTINÇÃO DE ANTÔNIO DE NORONHA: Este é Daniel Coutinho "Mestre Noronha" (1909-1977), o historiador. NÃO confundir com "Mestre Antônio de Noronha" (~1875-desconhecido), o mestre histórico de Aberrê. São duas pessoas diferentes.

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- Noronha associated_with Livino (irmão, co-fundador do Gengibirra)
- Noronha associated_with Amorzinho (co-fundador do Gengibirra)
- Vários relacionamentos de aluno podem existir mas não estão documentados'
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
