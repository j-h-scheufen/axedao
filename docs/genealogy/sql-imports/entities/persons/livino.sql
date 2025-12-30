-- ============================================================
-- GENEALOGY PERSON: Livino
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
  NULL,  -- Full name unknown; "Diogo" may be surname
  'Livino',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-9', 'https://nossa-tribo.com/mestre-totonho-de-mare/', 'https://capoeirahistory.com/general/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira angola; active during the era of criminalization. Was among the founding generation who established the first organized Capoeira Angola center in Bahia.',
  E'Capoeira angola tradicional; ativo durante a era de criminalização. Estava entre a geração fundadora que estabeleceu o primeiro centro organizado de Capoeira Angola na Bahia.',
  -- Life dates
  1905,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bio_en)
  E'Mestre Livino was the brother of Mestre Noronha (Daniel Coutinho) and one of the foundational figures of organized capoeira angola in Salvador, Bahia. During the 1920s, when capoeira was still criminalized, Livino was among the 22 founding mestres who established the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood—the first organized center for Capoeira Angola in the state of Bahia.

More than just a founding mestre, Livino was one of four "donos e proprietários" (owners and proprietors) of Gengibirra, alongside his brother Noronha, Totonho de Maré, and Amorzinho. This term indicated organizational leadership of the center, not literal property ownership, as the roda at Ladeira de Pedra was held in a public street.

Together with Noronha, Livino also co-founded and managed the Centro de Capoeira Angola da Conceição da Praia, an earlier organizational attempt before Gengibirra. The brothers taught capoeira at Maciel de Baixo, n° 31, in Salvador—demonstrating their commitment to preserving and transmitting the art during a time of persecution.

When Mestre Pastinha was invited to assume leadership of the Gengibirra roda in 1941 (following Amorzinho''s death), Livino was among the mestres who formally handed over the center. Pastinha himself listed "Livino Diogo" among the founders who helped establish what would become the Centro Esportivo de Capoeira Angola (CECA).

Livino is commemorated in traditional capoeira angola corridos (songs), with verses honoring him alongside other legendary mestres: "Na Bahia que eu vi o mestre Livino..." (In Bahia I saw Mestre Livino...). He was older than some of his contemporaries—Mestre Barba Branca noted that "there were mestres older than Pastinha, such as Totonho de Maré and Livino Diogo".

Livino was known by several aliases: Livinho (the diminutive), Livino Boca da Barra, Livino Malvadeza, and Livino Diogo. The meaning or origin of these names is not recorded, though "Boca da Barra" may reference a location (mouth of the bar/sandbank) and "Malvadeza" suggests a tough or fierce reputation.',
  -- bio_pt
  E'Mestre Livino era irmão de Mestre Noronha (Daniel Coutinho) e uma das figuras fundamentais da capoeira angola organizada em Salvador, Bahia. Durante a década de 1920, quando a capoeira ainda era criminalizada, Livino estava entre os 22 mestres fundadores que estabeleceram o Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade—o primeiro centro organizado de Capoeira Angola no estado da Bahia.

Mais do que um mestre fundador, Livino era um dos quatro "donos e proprietários" do Gengibirra, ao lado de seu irmão Noronha, Totonho de Maré e Amorzinho. Este termo indicava liderança organizacional do centro, não propriedade literal, já que a roda na Ladeira de Pedra era realizada em uma rua pública.

Junto com Noronha, Livino também co-fundou e gerenciou o Centro de Capoeira Angola da Conceição da Praia, uma tentativa organizacional anterior ao Gengibirra. Os irmãos ensinavam capoeira no Maciel de Baixo, n° 31, em Salvador—demonstrando seu compromisso em preservar e transmitir a arte durante um período de perseguição.

Quando Mestre Pastinha foi convidado a assumir a liderança da roda do Gengibirra em 1941 (após a morte de Amorzinho), Livino estava entre os mestres que formalmente entregaram o centro. O próprio Pastinha listou "Livino Diogo" entre os fundadores que ajudaram a estabelecer o que se tornaria o Centro Esportivo de Capoeira Angola (CECA).

Livino é comemorado nos corridos tradicionais de capoeira angola, com versos que o homenageiam ao lado de outros mestres lendários: "Na Bahia que eu vi o mestre Livino..." Ele era mais velho que alguns de seus contemporâneos—Mestre Barba Branca observou que "havia mestres mais velhos que Pastinha, como Totonho de Maré e Livino Diogo".

Livino era conhecido por vários apelidos: Livinho (o diminutivo), Livino Boca da Barra, Livino Malvadeza e Livino Diogo. O significado ou origem desses nomes não está registrado, embora "Boca da Barra" possa referenciar um local (boca da barra/banco de areia) e "Malvadeza" sugira uma reputação dura ou feroz.',
  -- achievements_en
  E'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Totonho de Maré, and Amorzinho
One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola (1920s)
Co-founder of Centro de Capoeira Angola da Conceição da Praia with brother Noronha
Taught capoeira at Maciel de Baixo, n° 31, Salvador
Participated in founding CECA (1941) by handing Gengibirra to Pastinha
Commemorated in traditional capoeira angola corridos',
  -- achievements_pt
  E'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Totonho de Maré e Amorzinho
Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola (década de 1920)
Co-fundador do Centro de Capoeira Angola da Conceição da Praia com o irmão Noronha
Ensinou capoeira no Maciel de Baixo, n° 31, Salvador
Participou da fundação do CECA (1941) entregando o Gengibirra a Pastinha
Comemorado nos corridos tradicionais de capoeira angola',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1905, decade precision): No birth date documented. As brother of Noronha (born 1909), Livino was likely born within a few years of him. He was an organizational leader of Gengibirra founded in the 1920s, suggesting he was an established adult by then. Mestre Barba Branca stated he was "older than Pastinha" (b. 1889), which contradicts being Noronha''s younger brother—this may indicate confusion between sources or that "older" referred to experience, not age. Using 1905 as midpoint estimate.

DEATH: Unknown. No records found.

NAME VARIANTS:
- Livino (primary)
- Livinho (diminutive)
- Livino Boca da Barra
- Livino Malvadeza
- Livino Diogo (used by Pastinha when listing CECA founders)

IDENTITY CLARIFICATION: Some sources list "Livino Diogo" separately among historical "bambas da capoeiragem", but the velhosmestres.com source clarifies that Livino Boca da Barra (Noronha''s brother) and the founding mestre named in Gengibirra/CECA contexts are the same person. "Diogo" is likely a surname.

RELATIONSHIP TO NORONHA: Brother. Both co-founded Gengibirra and Centro da Conceição da Praia; taught together at Maciel de Baixo.

RELATIONSHIPS ACTIVE (see statements/persons/livino.sql):
- Livino family_of Noronha (brother)
- Livino associated_with Amorzinho (co-founder of Gengibirra)
- Livino associated_with Totonho de Maré (co-founder of Gengibirra)
- Livino associated_with Pastinha (handed Gengibirra to him in 1941)
- Livino associated_with Aberrê (founding mestre of Gengibirra)
- Livino associated_with Onça Preta (founding mestre of Gengibirra)
- Livino associated_with Geraldo Chapeleiro (founding mestre of Gengibirra)
- Livino co_founded Gengibirra
- Livino leads Gengibirra (1920s-1941)',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1905, precisão de década): Nenhuma data de nascimento documentada. Como irmão de Noronha (nascido em 1909), Livino provavelmente nasceu alguns anos próximos a ele. Era líder organizacional do Gengibirra fundado na década de 1920, sugerindo que era um adulto estabelecido na época. Mestre Barba Branca afirmou que ele era "mais velho que Pastinha" (n. 1889), o que contradiz ser irmão mais novo de Noronha—isso pode indicar confusão entre fontes ou que "mais velho" se referia à experiência, não à idade. Usando 1905 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro encontrado.

VARIANTES DE NOME:
- Livino (principal)
- Livinho (diminutivo)
- Livino Boca da Barra
- Livino Malvadeza
- Livino Diogo (usado por Pastinha ao listar fundadores do CECA)

ESCLARECIMENTO DE IDENTIDADE: Algumas fontes listam "Livino Diogo" separadamente entre os "bambas da capoeiragem" históricos, mas a fonte velhosmestres.com esclarece que Livino Boca da Barra (irmão de Noronha) e o mestre fundador citado nos contextos do Gengibirra/CECA são a mesma pessoa. "Diogo" é provavelmente um sobrenome.

RELAÇÃO COM NORONHA: Irmão. Ambos co-fundaram o Gengibirra e o Centro da Conceição da Praia; ensinaram juntos no Maciel de Baixo.

RELACIONAMENTOS ATIVOS (ver statements/persons/livino.sql):
- Livino family_of Noronha (irmão)
- Livino associated_with Amorzinho (co-fundador do Gengibirra)
- Livino associated_with Totonho de Maré (co-fundador do Gengibirra)
- Livino associated_with Pastinha (entregou Gengibirra a ele em 1941)
- Livino associated_with Aberrê (mestre fundador do Gengibirra)
- Livino associated_with Onça Preta (mestre fundador do Gengibirra)
- Livino associated_with Geraldo Chapeleiro (mestre fundador do Gengibirra)
- Livino co_founded Gengibirra
- Livino leads Gengibirra (1920s-1941)'
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
