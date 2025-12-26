-- ============================================================
-- GENEALOGY PERSON: Almiro
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1950 (decade precision)
-- Received mestre title in 1983. Typical age for mestre: 30-45.
-- If mestre at age 33-38, birth year ~1945-1950. Using 1950 as estimate.
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
  'Almiro Aquilino',
  'Almiro',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeira.online/history/mestres/mestre-bimba/', 'https://www.lalaue.com/learn-capoeira/mestre-bimba/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Practices and teaches the pure Capoeira Regional tradition of Mestre Bimba. Trained at the historic Academia do Bimba at Terreiro de Jesus in Salvador. His teaching emphasizes not only the martial art, but also the musical instruments, dance, and song that comprise the complete art form.',
  E'Pratica e ensina a tradição pura da Capoeira Regional de Mestre Bimba. Treinou na histórica Academia do Bimba no Terreiro de Jesus em Salvador. Seu ensino enfatiza não apenas a arte marcial, mas também os instrumentos musicais, a dança e o canto que compõem a forma de arte completa.',
  -- Life dates
  1950,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Almiro Aquilino, known as Mestre Almiro, is a master of Capoeira Regional from Salvador, Bahia, Brazil. His journey in capoeira led him to the historic Academia do Bimba—the first recognized capoeira school in Brazil and the spiritual heart of Capoeira Regional—located at the Terreiro de Jesus in Salvador''s Pelourinho district.

In 1983, Almiro received his Mestre certification at the Academia do Bimba, marking his ascent to the highest traditional rank in Capoeira Regional. This occurred during a transitional period for the historic institution: Mestre Bimba had died in 1974, and his faithful student Vermelho 27 had been maintaining the academy since the early 1970s. When Vermelho 27''s health declined in the early 1980s, the school came under the brief supervision of Mestre Almiro.

Almiro headed the academy until 1986, when he was invited to come to the United States to teach capoeira and related music courses at Portland State University in Portland, Oregon. This opportunity marked a significant moment in capoeira''s global spread—one of Mestre Bimba''s direct lineage practitioners bringing the art to the Pacific Northwest.

Shortly after his arrival in the summer of 1986, Almiro presented three master classes at local high schools and performed on fifteen separate occasions at local community events. Portland welcomed him warmly, and he fell in love with the city, deciding to emigrate permanently. He became a naturalized U.S. citizen in 1994.

After his departure from Salvador, the Associação de Capoeira Mestre Bimba at Terreiro de Jesus was transferred to Mestre Bamba (Rubens Costa Silva), who continues to lead it today. This succession—Vermelho 27 → Almiro → Bamba—preserved the unbroken lineage of Mestre Bimba''s historic academy.

Over the following decades, Mestre Almiro has given or participated in many capoeira workshops across the West Coast—in Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego, and Vancouver BC. He has also organized cultural exchange trips to Brazil for his students and others interested in taking capoeira classes in his native city of Salvador.

In 2004, Mestre Almiro founded the Bahia Brazil Art Center (formerly the Cultural Awareness Foundation), a non-profit organization dedicated to sharing Brazilian culture with the citizens of Portland through movement, music, and art. The vision extended beyond capoeira alone—Almiro sought to make an impact on the welfare and education of youth in both Portland and Salvador, inspired by educational projects he experienced in his own youth.

As founder and executive director of the Bahia Brazil Art Center, Almiro continues to provide leadership and hands-on management of cultural exchange programs. He currently teaches Brazilian arts classes related to Capoeira Regional, including training in martial arts, musical instruments, dance, and song. His sister Valdizia heads BBAC operations in Bahia, Brazil, maintaining the connection to his homeland.

Mestre Almiro has worked for many years to accommodate U.S. students while preserving the integrity of the traditional art of Capoeira Regional do Mestre Bimba—a mission that honors his brief but significant role in the succession of Bimba''s historic school.',
  -- bio_pt
  E'Almiro Aquilino, conhecido como Mestre Almiro, é um mestre de Capoeira Regional de Salvador, Bahia, Brasil. Sua jornada na capoeira o levou à histórica Academia do Bimba—a primeira escola de capoeira reconhecida no Brasil e o coração espiritual da Capoeira Regional—localizada no Terreiro de Jesus no Pelourinho de Salvador.

Em 1983, Almiro recebeu sua certificação de Mestre na Academia do Bimba, marcando sua ascensão ao mais alto posto tradicional na Capoeira Regional. Isso ocorreu durante um período de transição para a histórica instituição: Mestre Bimba havia morrido em 1974, e seu fiel aluno Vermelho 27 mantinha a academia desde o início dos anos 1970. Quando a saúde de Vermelho 27 declinou no início dos anos 1980, a escola ficou sob a breve supervisão de Mestre Almiro.

Almiro liderou a academia até 1986, quando foi convidado a vir aos Estados Unidos para ensinar capoeira e cursos de música relacionados na Portland State University em Portland, Oregon. Esta oportunidade marcou um momento significativo na expansão global da capoeira—um praticante da linhagem direta de Mestre Bimba levando a arte ao noroeste do Pacífico.

Logo após sua chegada no verão de 1986, Almiro apresentou três master classes em escolas locais e se apresentou em quinze ocasiões separadas em eventos comunitários locais. Portland o recebeu calorosamente, e ele se apaixonou pela cidade, decidindo emigrar permanentemente. Ele se tornou cidadão americano naturalizado em 1994.

Após sua partida de Salvador, a Associação de Capoeira Mestre Bimba no Terreiro de Jesus foi transferida para Mestre Bamba (Rubens Costa Silva), que continua a liderá-la hoje. Esta sucessão—Vermelho 27 → Almiro → Bamba—preservou a linhagem ininterrupta da histórica academia de Mestre Bimba.

Ao longo das décadas seguintes, Mestre Almiro participou de muitos workshops de capoeira pela Costa Oeste—em Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego e Vancouver BC. Ele também organizou viagens de intercâmbio cultural ao Brasil para seus alunos e outros interessados em fazer aulas de capoeira em sua cidade natal de Salvador.

Em 2004, Mestre Almiro fundou o Bahia Brazil Art Center (anteriormente Cultural Awareness Foundation), uma organização sem fins lucrativos dedicada a compartilhar a cultura brasileira com os cidadãos de Portland através de movimento, música e arte. A visão se estendia além da capoeira sozinha—Almiro buscou impactar o bem-estar e a educação de jovens em Portland e Salvador, inspirado por projetos educacionais que ele experimentou em sua própria juventude.

Como fundador e diretor executivo do Bahia Brazil Art Center, Almiro continua a fornecer liderança e gestão prática de programas de intercâmbio cultural. Ele atualmente ensina aulas de artes brasileiras relacionadas à Capoeira Regional, incluindo treinamento em artes marciais, instrumentos musicais, dança e canto. Sua irmã Valdizia lidera as operações do BBAC na Bahia, Brasil, mantendo a conexão com sua terra natal.

Mestre Almiro trabalhou por muitos anos para acomodar alunos americanos enquanto preserva a integridade da arte tradicional da Capoeira Regional do Mestre Bimba—uma missão que honra seu breve, mas significativo papel na sucessão da histórica escola de Bimba.',
  -- achievements_en
  E'Received Mestre certification at Academia do Bimba (1983); Briefly supervised historic Associação de Capoeira Mestre Bimba at Terreiro de Jesus (1983-1986); Pioneer of Capoeira Regional in the Pacific Northwest; Taught at Portland State University (1986+); Founded Bahia Brazil Art Center/Cultural Awareness Foundation (2004); Naturalized U.S. citizen (1994); Conducted workshops across the West Coast for decades; Organized cultural exchange trips between Portland and Salvador',
  -- achievements_pt
  E'Recebeu certificação de Mestre na Academia do Bimba (1983); Supervisionou brevemente a histórica Associação de Capoeira Mestre Bimba no Terreiro de Jesus (1983-1986); Pioneiro da Capoeira Regional no noroeste do Pacífico; Ensinou na Portland State University (1986+); Fundou o Bahia Brazil Art Center/Cultural Awareness Foundation (2004); Cidadão americano naturalizado (1994); Conduziu workshops pela Costa Oeste por décadas; Organizou viagens de intercâmbio cultural entre Portland e Salvador',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1950, decade):
Received mestre title in 1983. Typical age for mestre certification is 30-45. If mestre at age 33-38, birth year would be ~1945-1950. Using 1950 as estimate with decade precision.

BIRTH PLACE: Salvador, Bahia, Brazil (confirmed)

FULL NAME: Almiro Aquilino (per BBAC website)

TEACHERS:
- Vermelho 27 (primary teacher, based on available sources)
- Received mestre certification in 1983 at Academia do Bimba during Vermelho 27''s leadership
- No sources found confirming direct training under Mestre Bimba, though his estimated birth year (~1950) would have made this possible

ACADEMY SUPERVISION:
- Vermelho 27 supervised Terreiro de Jesus until early 1980s
- Almiro briefly supervised after Vermelho 27 (1983-1986)
- Transferred to Mestre Bamba in 1986

USA TIMELINE:
- 1986: Arrived Portland, Oregon (summer); invited by Portland State University
- 1986: 3 master classes at local high schools; 15 community performances
- 1994: Became naturalized U.S. citizen
- 2004: Founded Bahia Brazil Art Center (formerly Cultural Awareness Foundation)

CURRENT ACTIVITY:
- Executive Director of Bahia Brazil Art Center in Portland
- His sister Valdizia heads BBAC operations in Bahia, Brazil
- Continues teaching Capoeira Regional, musical instruments, dance, and song

WORKSHOP LOCATIONS:
Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego, Vancouver BC

SOURCES CONSULTED:
- Bahia Brazil Art Center website (bahiabrazilartcenter.com)
- Capoeira Online - Mestre Bimba page
- Lalaue - Mestre Bimba page
- Multiple searches for biographical details',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1950, década):
Recebeu título de mestre em 1983. Idade típica para certificação de mestre é 30-45. Se mestre aos 33-38 anos, ano de nascimento seria ~1945-1950. Usando 1950 como estimativa com precisão de década.

LOCAL DE NASCIMENTO: Salvador, Bahia, Brasil (confirmado)

NOME COMPLETO: Almiro Aquilino (conforme site do BBAC)

PROFESSORES:
- Vermelho 27 (professor principal, com base nas fontes disponíveis)
- Recebeu certificação de mestre em 1983 na Academia do Bimba durante a liderança de Vermelho 27
- Nenhuma fonte encontrada confirmando treinamento direto sob Mestre Bimba, embora seu ano de nascimento estimado (~1950) teria tornado isso possível

SUPERVISÃO DA ACADEMIA:
- Vermelho 27 supervisionou o Terreiro de Jesus até o início dos anos 1980
- Almiro supervisionou brevemente após Vermelho 27 (1983-1986)
- Transferido para Mestre Bamba em 1986

CRONOLOGIA NOS EUA:
- 1986: Chegou em Portland, Oregon (verão); convidado pela Portland State University
- 1986: 3 master classes em escolas locais; 15 apresentações comunitárias
- 1994: Tornou-se cidadão americano naturalizado
- 2004: Fundou o Bahia Brazil Art Center (anteriormente Cultural Awareness Foundation)

ATIVIDADE ATUAL:
- Diretor Executivo do Bahia Brazil Art Center em Portland
- Sua irmã Valdizia lidera as operações do BBAC na Bahia, Brasil
- Continua ensinando Capoeira Regional, instrumentos musicais, dança e canto

LOCAIS DE WORKSHOPS:
Portland, Seattle, Tacoma, Eugene, San Francisco, Los Angeles, San Diego, Vancouver BC

FONTES CONSULTADAS:
- Site do Bahia Brazil Art Center (bahiabrazilartcenter.com)
- Capoeira Online - página do Mestre Bimba
- Lalaue - página do Mestre Bimba
- Múltiplas buscas por detalhes biográficos'
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
