-- ============================================================
-- GENEALOGY PERSON: Preguiça (Senzala)
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH DATE: June 1947 (month precision)
-- BIRTHPLACE: Salvador, Bahia, Brazil (Periperí neighborhood)
-- FULL NAME: Waldenkolk Oliveira (some sources: Wandenkolk)
--
-- TITLE: Received mestre recognition after third Berimbau de Ouro
-- victory (1969) when barred from competition for being masters
--
-- STYLE: Regional/Contemporânea - trained initially with Gilson
-- Capoeira in Periperí, later at Mestre Bimba's academy in Salvador,
-- developed Senzala methodology in Rio de Janeiro
--
-- NOTE: Uses apelido_context 'Senzala' to distinguish from:
-- - Mestre Preguiça (Filhos de Bimba) - Salvador lineage
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  'Waldenkolk Oliveira',
  'Preguiça',
  'Senzala',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeira-connection.com/capoeira/index.php/mestres/interview-mestre-preguica/',
    'https://simplycapoeira.co.nz/index.php/about-capoeira/senzala/',
    'https://capoeirahistory.com/group-senzala-capoeira/',
    'https://www.loc.gov/item/ihas.200185809/'
  ]::text[],
  'contemporanea'::genealogy.style,
  E'Mestre Preguiça developed his capoeira within Grupo Senzala, contributing to the "Senzala style" that blended Capoeira Regional technique, Angola ground game, and Rio carioca elements. Initially trained by Gilson Capoeira in Periperí (Salvador), he later studied at Mestre Bimba''s academy before moving to Rio de Janeiro where he became a founding member of Grupo Senzala. His approach combined systematic training methodology with traditional Bahian roots.',
  E'Mestre Preguiça desenvolveu sua capoeira dentro do Grupo Senzala, contribuindo para o "estilo Senzala" que mesclava técnica da Capoeira Regional, jogo de chão da Angola e elementos cariocas do Rio. Inicialmente treinado por Gilson Capoeira em Periperí (Salvador), estudou posteriormente na academia de Mestre Bimba antes de mudar para o Rio de Janeiro onde se tornou membro fundador do Grupo Senzala. Sua abordagem combinou metodologia de treinamento sistemático com raízes baianas tradicionais.',
  1947,
  'month'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Waldenkolk Oliveira, known as Mestre Preguiça, was born in June 1947 in Salvador, Bahia, Brazil, in the Periperí neighborhood. He began training capoeira as a child in his neighborhood under Gilson Capoeira, later continuing his studies at Mestre Bimba''s academy in Salvador.

In 1963, Preguiça moved to Rio de Janeiro, where he would become one of the founding members of what would become Grupo Senzala. In 1965, he joined the folkloric group "Vem Camará", where many future Senzala members congregated.

In 1967, Preguiça and Gato represented Grupo Senzala at the first Berimbau de Ouro tournament held at Feira da Providência around Lagoa Rodrigo de Freitas. They won. They won again in 1968. When they attempted to enter the third competition in 1969, the Capoeira Association barred them, declaring that their record had earned them recognition as masters—not students. Preguiça and Gato protested they were students, not masters. The association replied that two consecutive victories had established their master status. Unable to compete, they trained Mosquito and Borracha, who won the third Berimbau de Ouro, permanently securing the trophy for Senzala.

Preguiça trained Nestor Capoeira (born 1946), who became his primary student from 1968 to 1990. Nestor later became one of capoeira''s most influential writers and teachers.

In 1976, Preguiça earned a physical education degree from an Austrian university, demonstrating his commitment to formal education alongside his capoeira mastery.

Preguiça later founded Omulu Guanabara Capoeira, continuing the Senzala tradition while establishing his own lineage. He eventually relocated to California, USA, where he continues teaching capoeira in the San Francisco Bay Area and Los Angeles region. His group Omulu Capoeira maintains the Senzala methodology while adapting to American contexts.

Mestre Preguiça remains one of the surviving founding red cords of Grupo Senzala, contributing to the collaborative leadership model that defines this influential capoeira organization.',
  E'Waldenkolk Oliveira, conhecido como Mestre Preguiça, nasceu em junho de 1947 em Salvador, Bahia, Brasil, no bairro de Periperí. Começou a treinar capoeira ainda criança em seu bairro com Gilson Capoeira, continuando posteriormente seus estudos na academia de Mestre Bimba em Salvador.

Em 1963, Preguiça mudou-se para o Rio de Janeiro, onde se tornaria um dos membros fundadores do que viria a ser o Grupo Senzala. Em 1965, ingressou no grupo folclórico "Vem Camará", onde muitos futuros membros do Senzala se congregavam.

Em 1967, Preguiça e Gato representaram o Grupo Senzala no primeiro torneio Berimbau de Ouro realizado na Feira da Providência, ao redor da Lagoa Rodrigo de Freitas. Eles venceram. Venceram novamente em 1968. Quando tentaram participar da terceira competição em 1969, a Associação de Capoeira os barrou, declarando que seu histórico lhes havia rendido reconhecimento como mestres—não alunos. Preguiça e Gato protestaram que eram alunos, não mestres. A associação respondeu que duas vitórias consecutivas haviam estabelecido seu status de mestre. Impossibilitados de competir, treinaram Mosquito e Borracha, que venceram o terceiro Berimbau de Ouro, assegurando permanentemente o troféu para o Senzala.

Preguiça treinou Nestor Capoeira (nascido em 1946), que se tornou seu principal aluno de 1968 a 1990. Nestor mais tarde se tornou um dos escritores e professores mais influentes da capoeira.

Em 1976, Preguiça obteve um diploma de educação física de uma universidade austríaca, demonstrando seu compromisso com a educação formal junto com sua maestria na capoeira.

Preguiça posteriormente fundou a Omulu Guanabara Capoeira, continuando a tradição Senzala enquanto estabelecia sua própria linhagem. Eventualmente mudou-se para a Califórnia, EUA, onde continua ensinando capoeira na região da Baía de São Francisco e Los Angeles. Seu grupo Omulu Capoeira mantém a metodologia Senzala enquanto se adapta aos contextos americanos.

Mestre Preguiça permanece como um dos cordões vermelhos fundadores sobreviventes do Grupo Senzala, contribuindo para o modelo de liderança colaborativa que define esta influente organização de capoeira.',
  E'- Won Berimbau de Ouro tournament with Gato (1967, 1968), trained winning team (1969)
- Co-founder of Grupo Senzala (formally named 1966)
- Founded Omulu Guanabara Capoeira (Rio de Janeiro)
- Founded Omulu Capoeira (California, USA)
- Physical education degree from Austrian university (1976)
- Primary teacher of Mestre Nestor Capoeira (1968-1990)
- Member of Vem Camará folkloric group (1965)',
  E'- Venceu o torneio Berimbau de Ouro com Gato (1967, 1968), treinou equipe vencedora (1969)
- Co-fundador do Grupo Senzala (formalmente nomeado 1966)
- Fundou Omulu Guanabara Capoeira (Rio de Janeiro)
- Fundou Omulu Capoeira (Califórnia, EUA)
- Diploma de educação física de universidade austríaca (1976)
- Professor principal de Mestre Nestor Capoeira (1968-1990)
- Membro do grupo folclórico Vem Camará (1965)',
  E'PRIMARY TEACHERS:
- Gilson Capoeira (Periperí, Salvador) - childhood instruction in neighborhood
- Mestre Bimba (Salvador) - formal academy training before Rio move

STUDENT:
- Nestor Capoeira (1968-1990) - his primary student and most prominent capoeirista

BERIMBAU DE OURO COMPETITIONS:
- 1967: Berimbau de Ouro with Gato - 1st place (Grupo Senzala)
- 1968: Berimbau de Ouro with Gato - 1st place (Grupo Senzala)
- 1969: Barred as recognized masters; trained Mosquito and Borracha who won

ORGANIZATIONS FOUNDED:
- Omulu Guanabara Capoeira (Rio de Janeiro)
- Omulu Capoeira (California, USA)

CURRENT LOCATION:
- California, USA (San Francisco Bay Area / Los Angeles region)

NAME DISCREPANCY:
- "Waldenkolk Oliveira" - Library of Congress, multiple sources (MAJORITY)
- "Wandenkolk Oliveira" - Some Portuguese sources (spelling variant)
- "Walmir Oliveira" - Referenced in Nestor Capoeira report (needs verification)
- Using "Waldenkolk" as confirmed by Library of Congress archival records

BIRTH MONTH:
- June 1947 - confirmed by interview sources
- Exact day not documented in available sources

NOTE: This Preguiça is distinct from Mestre Preguiça (Filhos de Bimba) in Salvador',
  E'PROFESSORES PRINCIPAIS:
- Gilson Capoeira (Periperí, Salvador) - instrução na infância no bairro
- Mestre Bimba (Salvador) - treinamento formal na academia antes da mudança para o Rio

ALUNO:
- Nestor Capoeira (1968-1990) - seu principal aluno e capoeirista mais proeminente

COMPETIÇÕES BERIMBAU DE OURO:
- 1967: Berimbau de Ouro com Gato - 1º lugar (Grupo Senzala)
- 1968: Berimbau de Ouro com Gato - 1º lugar (Grupo Senzala)
- 1969: Barrados como mestres reconhecidos; treinaram Mosquito e Borracha que venceram

ORGANIZAÇÕES FUNDADAS:
- Omulu Guanabara Capoeira (Rio de Janeiro)
- Omulu Capoeira (Califórnia, EUA)

LOCALIZAÇÃO ATUAL:
- Califórnia, EUA (região da Baía de São Francisco / Los Angeles)

DISCREPÂNCIA DE NOME:
- "Waldenkolk Oliveira" - Library of Congress, múltiplas fontes (MAIORIA)
- "Wandenkolk Oliveira" - Algumas fontes portuguesas (variante ortográfica)
- "Walmir Oliveira" - Referenciado no relatório de Nestor Capoeira (precisa verificação)
- Usando "Waldenkolk" conforme confirmado por registros arquivísticos da Library of Congress

MÊS DE NASCIMENTO:
- Junho de 1947 - confirmado por fontes de entrevista
- Dia exato não documentado nas fontes disponíveis

NOTA: Este Preguiça é distinto de Mestre Preguiça (Filhos de Bimba) em Salvador'
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
