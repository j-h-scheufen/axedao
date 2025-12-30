-- ============================================================
-- GENEALOGY PERSON: Crispim
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1920, decade):
-- Mestre Bimba was born in 1899/1900. Crispim was his first son
-- with his first partner Maria dos Anjos. Assuming Bimba fathered
-- his first child in his late teens to early twenties, Crispim
-- was likely born around 1918-1925. By 1954, when he appeared in
-- the film "Vadiação", he would have been a mature capoeirista in
-- his late 20s to mid-30s. Using 1920 with decade precision.
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
  'Manoel dos Reis Machado Filho',
  'Crispim',
  'contra-mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeiraceaca.wordpress.com/tag/crispim-filho-de-bimba/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained from childhood in Capoeira Regional under his father Mestre Bimba. Served as contramestre at the Centro de Cultura Física Regional (CCFR), preparing students before they advanced to train directly with Bimba. His role was foundational in the academy''s teaching structure.',
  E'Treinado desde a infância em Capoeira Regional sob seu pai Mestre Bimba. Serviu como contramestre no Centro de Cultura Física Regional (CCFR), preparando alunos antes de avançarem para treinar diretamente com Bimba. Seu papel foi fundamental na estrutura de ensino da academia.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Manoel dos Reis Machado Filho, known as Crispim, was the eldest son and disciple of Mestre Bimba, the creator of Capoeira Regional. Born to Bimba''s first partner, Maria dos Anjos, Crispim grew up immersed in the development of what would become Brazil''s first systematically taught capoeira style.

Crispim held the rank of contramestre and played a crucial role at the Centro de Cultura Física Regional (CCFR), his father''s legendary academy. According to Mestre Osvaldo Rocha de Souza, who trained in Bahia from age 13: "A minha militância na Capoeira vem desde os 13 anos, sempre estive no núcleo de bons capoeiristas na Bahia, treinei com Crispim o filho de Mestre Bimba e depois fui para a mão de Mestre Bimba que me recebeu com toda a atenção e procurou me ensinar/transmitir tudo". This testimony reveals Crispim''s role as a preparatory instructor—students would train under him before advancing to receive direct instruction from Bimba himself.

Crispim was part of his father''s inner circle of trusted companions, mentioned alongside Atenilo and Brás "Amansa Brabo" as Bimba''s most devoted followers. This places him among a small group who had particularly close relationships with the master.

In 1954, Crispim participated in the pioneering film "Vadiação", directed by Alexandre Robatto Filho, considered the pioneer of Bahian cinema. The approximately 8-minute documentary captured a historic capoeira gathering in Salvador, featuring some of the greatest capoeiristas and mestres of Bahia at the time: Mestres Bimba and Waldemar, Traíra, Caiçara, Curió, Crispim (filho de Bimba), and Nagé, among others. The film had the collaboration of artist Carybé, who portrayed important traditional Bahian manifestations in his work. It remains a valuable document for capoeira''s memory.

In 1956, Crispim was part of Bimba''s grupo folclórico that traveled to Rio de Janeiro, representing Bahian capoeira culture. This participation in folkloric presentations demonstrates his role not just as an instructor but as a performer representing his father''s academy.

Unlike his half-brother Nenel (Manoel Nascimento Machado, born 1960), who took over Bimba''s legacy after the master''s death in 1974 and founded Filhos de Bimba in 1986, Crispim''s later life is less documented. His significance lies in being part of the first generation that helped establish Capoeira Regional''s teaching methods and carried forward Bimba''s innovations during the formative decades of the style.',
  -- bio_pt
  E'Manoel dos Reis Machado Filho, conhecido como Crispim, foi o filho mais velho e discípulo de Mestre Bimba, o criador da Capoeira Regional. Nascido da primeira companheira de Bimba, Maria dos Anjos, Crispim cresceu imerso no desenvolvimento do que se tornaria o primeiro estilo de capoeira sistematicamente ensinado no Brasil.

Crispim detinha o título de contramestre e desempenhou um papel crucial no Centro de Cultura Física Regional (CCFR), a lendária academia de seu pai. Segundo Mestre Osvaldo Rocha de Souza, que treinou na Bahia desde os 13 anos: "A minha militância na Capoeira vem desde os 13 anos, sempre estive no núcleo de bons capoeiristas na Bahia, treinei com Crispim o filho de Mestre Bimba e depois fui para a mão de Mestre Bimba que me recebeu com toda a atenção e procurou me ensinar/transmitir tudo". Este testemunho revela o papel de Crispim como instrutor preparatório—os alunos treinavam com ele antes de avançar para receber instrução direta do próprio Bimba.

Crispim fazia parte do círculo íntimo de companheiros de confiança de seu pai, mencionado ao lado de Atenilo e Brás "Amansa Brabo" como os seguidores mais devotados de Bimba. Isso o coloca entre um pequeno grupo que tinha relações particularmente próximas com o mestre.

Em 1954, Crispim participou do pioneiro filme "Vadiação", dirigido por Alexandre Robatto Filho, considerado o pioneiro do cinema baiano. O documentário de aproximadamente 8 minutos capturou um encontro histórico de capoeira em Salvador, apresentando alguns dos maiores capoeiristas e mestres da Bahia da época: Mestres Bimba e Waldemar, Traíra, Caiçara, Curió, Crispim (filho de Bimba) e Nagé, entre outros. O filme teve a colaboração do artista Carybé, que retratou importantes manifestações tradicionais baianas em sua obra. Permanece um documento valioso para a memória da capoeira.

Em 1956, Crispim fez parte do grupo folclórico de Bimba que viajou ao Rio de Janeiro, representando a cultura da capoeira baiana. Esta participação em apresentações folclóricas demonstra seu papel não apenas como instrutor, mas como artista representando a academia de seu pai.

Diferentemente de seu meio-irmão Nenel (Manoel Nascimento Machado, nascido em 1960), que assumiu o legado de Bimba após a morte do mestre em 1974 e fundou a Filhos de Bimba em 1986, a vida posterior de Crispim é menos documentada. Sua importância reside em ser parte da primeira geração que ajudou a estabelecer os métodos de ensino da Capoeira Regional e levou adiante as inovações de Bimba durante as décadas formativas do estilo.',
  -- achievements_en
  E'Contramestre at Centro de Cultura Física Regional (Bimba''s academy); Appeared in "Vadiação" (1954), pioneering Bahian cinema documentary on capoeira; Member of Bimba''s grupo folclórico that traveled to Rio de Janeiro (1956); Part of Bimba''s inner circle of trusted companions; Prepared students for advanced training with Mestre Bimba',
  -- achievements_pt
  E'Contramestre no Centro de Cultura Física Regional (academia de Bimba); Participou de "Vadiação" (1954), documentário pioneiro do cinema baiano sobre capoeira; Membro do grupo folclórico de Bimba que viajou ao Rio de Janeiro (1956); Parte do círculo íntimo de companheiros de confiança de Bimba; Preparou alunos para treinamento avançado com Mestre Bimba',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Mestre Bimba was born 1899/1900. Crispim was his first son with first partner Maria dos Anjos. Assuming Bimba fathered his first child in his late teens/early twenties, Crispim was likely born around 1918-1925. By 1954 ("Vadiação" film) he would have been a mature capoeirista in his late 20s to mid-30s.

MOTHER:
- Maria dos Anjos - Mestre Bimba''s first partner

SIBLINGS (same mother):
- Edvaldo Rosa - brother, also child of Maria dos Anjos

HALF-SIBLINGS (different mothers):
- Nenel (Manoel Nascimento Machado) - born 1960, mother Berenice da Conceição Nascimento
- Formiga (Demerval dos Santos Machado) - mother Nair Lopes dos Santos
- And many others (Bimba had 10-13 registered children with nine different women)

TITLE:
- Contramestre - served as preparatory instructor at CCFR

STUDENTS:
- Mestre Osvaldo Rocha de Souza (born 1937) - trained with Crispim before advancing to Bimba

COMPANIONS:
- Atenilo (Altenísio dos Santos) - fellow inner circle member
- Brás Amansa Brabo - fellow inner circle member

MEDIA APPEARANCES:
- 1954: "Vadiação" film by Alexandre Robatto Filho (documentary, ~8 minutes)
- 1956: Rio de Janeiro trip with Bimba''s grupo folclórico

LOCATION:
- Centro de Cultura Física Regional, Salvador, Bahia

DEATH:
- Death year unknown; not well documented after 1950s',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, década):
Mestre Bimba nasceu em 1899/1900. Crispim foi seu primeiro filho com a primeira companheira Maria dos Anjos. Assumindo que Bimba teve seu primeiro filho no final da adolescência/início dos vinte anos, Crispim provavelmente nasceu por volta de 1918-1925. Em 1954 (filme "Vadiação") ele teria sido um capoeirista maduro no final dos 20 aos 30 e poucos anos.

MÃE:
- Maria dos Anjos - primeira companheira de Mestre Bimba

IRMÃOS (mesma mãe):
- Edvaldo Rosa - irmão, também filho de Maria dos Anjos

MEIO-IRMÃOS (mães diferentes):
- Nenel (Manoel Nascimento Machado) - nascido 1960, mãe Berenice da Conceição Nascimento
- Formiga (Demerval dos Santos Machado) - mãe Nair Lopes dos Santos
- E muitos outros (Bimba teve 10-13 filhos registrados com nove mulheres diferentes)

TÍTULO:
- Contramestre - serviu como instrutor preparatório no CCFR

ALUNOS:
- Mestre Osvaldo Rocha de Souza (nascido 1937) - treinou com Crispim antes de avançar para Bimba

COMPANHEIROS:
- Atenilo (Altenísio dos Santos) - membro do círculo íntimo
- Brás Amansa Brabo - membro do círculo íntimo

APARIÇÕES NA MÍDIA:
- 1954: Filme "Vadiação" de Alexandre Robatto Filho (documentário, ~8 minutos)
- 1956: Viagem ao Rio de Janeiro com o grupo folclórico de Bimba

LOCALIZAÇÃO:
- Centro de Cultura Física Regional, Salvador, Bahia

MORTE:
- Ano de morte desconhecido; não bem documentado após os anos 1950'
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
