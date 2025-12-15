-- ============================================================
-- GENEALOGY PERSON: Adama
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
  'Adama',
  NULL,
  NULL,
  ARRAY['https://www.academia.edu/7186292/Capoeira_e_capoeiras_entre_a_Guarda_Negra_e_a_Educação_Física_no_Recife']::text[],
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira; practiced when capoeira was illegal in Brazil. Style distinctions (Angola/Regional) did not yet exist. Associated with Recife''s carnival capoeira tradition and Pernambuco''s valentão culture.',
  'Capoeira da era pré-moderna; praticava quando a capoeira era ilegal no Brasil. Distinções de estilo (Angola/Regional) ainda não existiam. Associado à tradição carnavalesca de capoeira do Recife e à cultura dos valentões de Pernambuco.',
  -- Life dates
  1870,
  'decade'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Adama was one of the feared valentões (tough guys) of Recife during the First Republic era, and a skilled capoeirista. According to Oscar Mello, the crime reporter and author of "Recife Sangrento" (1937), Adama handled the knife with surprising agility and was a specialist in the rasteira, one of capoeira''s signature leg sweep techniques.

Beyond his fighting reputation, Adama was deeply connected to Recife''s Afro-Brazilian cultural traditions. He loved carnival and served as the founder and director of Maracatu "Oriente Pequeno," a carnival group that commanded respect from other organizations due to his fame as a valentão.

Adama was part of a broader network of capoeiristas who dominated Recife''s streets in the late 19th and early 20th centuries. These valentões simultaneously provoked horror, respect, and fascination among the population. Many served as bodyguards for politicians during elections and walked openly armed through the streets of Santo Antônio, São José, and Afogados.

In 1907, Adama was involved in disturbances on a train returning from a religious festival, alongside Eleutério de Souza and Formigão—fellow valentões of the era. The following year, 1908, proved to be the last for his Maracatu "Oriente Pequeno," as the group entered into conflict first with Maracatu "Centro Grande" and then with Club "Lenhadores."

His illiteracy is documented in the "Livro de Entrada e Saída de Presos" (Book of Entry and Exit of Prisoners), an indication that he spent time in detention—a common fate for capoeiristas during the period of criminalization.

Among Recife''s legendary valentões—Jovino dos Coelhos, Nicolau do Poço, João de Totó, and the mighty Nascimento Grande—Adama held his own as one of the "two greatest valentões" of the city, standing alongside the legendary stevedore.',
  -- bio_pt
  E'Adama foi um dos temidos valentões do Recife durante a era da Primeira República, e um habilidoso capoeirista. Segundo Oscar Mello, o repórter policial e autor de "Recife Sangrento" (1937), Adama manejava a faca com surpreendente agilidade e era especialista na rasteira, uma das técnicas mais características da capoeira.

Além de sua reputação como lutador, Adama estava profundamente conectado às tradições culturais afro-brasileiras do Recife. Amava o carnaval e serviu como fundador e diretor do Maracatu "Oriente Pequeno," um grupo carnavalesco que impunha respeito a outras organizações devido à sua fama como valentão.

Adama fazia parte de uma rede mais ampla de capoeiristas que dominavam as ruas do Recife no final do século XIX e início do século XX. Esses valentões provocavam simultaneamente horror, respeito e fascinação entre a população. Muitos serviam como guarda-costas de políticos durante eleições e andavam abertamente armados pelas ruas de Santo Antônio, São José e Afogados.

Em 1907, Adama se envolveu em distúrbios em um trem que retornava de uma festividade religiosa, ao lado de Eleutério de Souza e Formigão—valentões contemporâneos. O ano seguinte, 1908, provou ser o último para seu Maracatu "Oriente Pequeno," quando o grupo entrou em conflito primeiro com o Maracatu "Centro Grande" e depois com o Club "Lenhadores."

Seu analfabetismo está documentado no "Livro de Entrada e Saída de Presos," indicação de que passou tempo em detenção—destino comum para capoeiristas durante o período de criminalização.

Entre os lendários valentões do Recife—Jovino dos Coelhos, Nicolau do Poço, João de Totó, e o poderoso Nascimento Grande—Adama mantinha seu lugar como um dos "dois maiores valentões" da cidade, ao lado do lendário estivador.',
  -- achievements_en
  'Founder and director of Maracatu "Oriente Pequeno"; One of the two greatest valentões of Recife; Specialist in rasteira and knife fighting; Commanded respect throughout Recife''s carnival culture',
  -- achievements_pt
  'Fundador e diretor do Maracatu "Oriente Pequeno"; Um dos dois maiores valentões do Recife; Especialista em rasteira e luta com faca; Impunha respeito em toda a cultura carnavalesca do Recife',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION: c. 1870 (decade precision). Adama was documented as active 1890s-1908. In 1907 he was involved in a train disturbance - at this time he would have been a mature, established valentão, likely 30-40 years old. In 1908 his Maracatu had its final conflicts, suggesting peak career. If approximately 35-40 years old in 1907, birth would be around 1867-1877. Using midpoint: c. 1870.

DEATH DATE: Unknown.

ILLITERACY: Documented in "Livro de Entrada e Saída de Presos" (Book of Entry and Exit of Prisoners).

SPECIALTY: Rasteira (leg sweep) and knife fighting. Oscar Mello notes he handled the knife with "surprising agility."

MARACATU CONNECTION: Founded and directed Maracatu "Oriente Pequeno." The group''s last year was 1908 when conflicts arose with Maracatu "Centro Grande" and Club "Lenhadores."

1907 TRAIN INCIDENT: Involved in disturbances on a train returning from a religious festival, along with Eleutério de Souza and Formigão.

SOURCES: Primary source is Oscar Mello''s "Recife Sangrento" (1937, 1953 editions). Academic study by Israel Ozanam "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife" provides additional context.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO: c. 1870 (precisão de década). Adama foi documentado como ativo no período de 1890s-1908. Em 1907 ele se envolveu em um distúrbio em um trem - neste momento ele seria um valentão maduro e estabelecido, provavelmente com 30-40 anos. Em 1908 seu Maracatu teve seus últimos conflitos, sugerindo auge da carreira. Se tinha aproximadamente 35-40 anos em 1907, nascimento seria por volta de 1867-1877. Usando ponto médio: c. 1870.

DATA DE MORTE: Desconhecida.

ANALFABETISMO: Documentado no "Livro de Entrada e Saída de Presos."

ESPECIALIDADE: Rasteira e luta com faca. Oscar Mello nota que ele manejava a faca com "surpreendente agilidade."

CONEXÃO COM MARACATU: Fundou e dirigiu o Maracatu "Oriente Pequeno." O último ano do grupo foi 1908 quando surgiram conflitos com o Maracatu "Centro Grande" e o Club "Lenhadores."

INCIDENTE DO TREM DE 1907: Envolvido em distúrbios em um trem que retornava de uma festividade religiosa, junto com Eleutério de Souza e Formigão.

FONTES: Fonte primária é "Recife Sangrento" de Oscar Mello (edições de 1937 e 1953). Estudo acadêmico de Israel Ozanam "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife" fornece contexto adicional.'
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
