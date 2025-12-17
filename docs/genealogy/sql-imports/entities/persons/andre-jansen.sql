-- ============================================================
-- GENEALOGY PERSON: André Jansen
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION: Unknown. Active as championship-level
-- capoeirista and professional goalkeeper in 1935-1940s. If he
-- was 25-35 during peak activity (1935-1945), birth would be
-- approximately 1900-1920. Using decade precision for 1910.
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
  NULL,  -- Full name unknown
  'André Jansen',
  NULL,  -- No formal capoeira title in carioca tradition
  NULL,  -- No portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/']::text[],
  -- Capoeira-specific
  NULL,  -- Capoeira carioca was distinct from Angola/Regional
  E'André Jansen practiced capoeira carioca under Mestre Sinhozinho, a combat-focused style distinct from both Angola and Regional. His training emphasized fighting effectiveness, incorporating elements of boxing, Greco-Roman wrestling, and other martial arts. The style stripped away music and ritual in favor of pure combat technique.',
  E'André Jansen praticou capoeira carioca sob Mestre Sinhozinho, um estilo focado em combate distinto tanto do Angola quanto da Regional. Seu treinamento enfatizava eficácia no combate, incorporando elementos de boxe, luta greco-romana e outras artes marciais. O estilo eliminava música e rituais em favor da técnica de combate pura.',
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  NULL,  -- Birth place unknown, likely Rio de Janeiro
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'André Jansen was the foremost fighter of Mestre Sinhozinho''s first generation of students. A goalkeeper for Botafogo Football Club, he simultaneously held the title of champion of capoeiragem in Rio de Janeiro (campeão carioca de capoeiragem). The Rio press considered him "the absolute master of Brazilian fighting" (mestre absoluto da luta brasileira) and "the best capoeira of his time in Brazil."

Jansen traveled throughout Brazil during the 1940s demonstrating the effectiveness of his martial art. His reputation was such that he became one of the most recognized names in Brazilian combat sports of that era.

On October 30, 1935, Jansen participated in a landmark event at Parque Boa Vista in Salvador, Bahia. Promoters of a major boxing event invited him to inaugurate the presentations in a confrontation with Ricardo Nibbon, a student of George Gracie who held titles in jiu-jitsu and catch-as-catch-can wrestling. As a preliminary to Jansen''s bout, Mestre Bimba and his students demonstrated their Bahian Regional fighting style (Luta Regional Baiana) to the public—one of the earliest documented public exhibitions of what would become Capoeira Regional.

This Salvador event represented a significant moment in capoeira history: the encounter between the established Rio de Janeiro tradition of capoeiragem carioca and the emerging Bahian Regional style. Jansen embodied Sinhozinho''s combat-focused approach to capoeira—stripped of music and ritual, mixed with techniques from wrestling and boxing, and trained for effectiveness in actual fighting.

Jansen was among the prominent students who trained at Sinhozinho''s academies in Ipanema, alongside names like Rudolf Hermanny (judo champion and World Cup football coach), Luiz "Cirandinha" Pereira Aguiar (weightlifter and capoeira champion), Antonio Carlos "Tom" Jobim (legendary Bossa Nova musician), and Olympic Committee president Sylvio de Magalhães Padilha.',
  -- bio_pt
  E'André Jansen foi o principal lutador da primeira geração de alunos de Mestre Sinhozinho. Goleiro do Botafogo Football Club, ele simultaneamente detinha o título de campeão carioca de capoeiragem. A imprensa carioca o considerava "o mestre absoluto da luta brasileira" e "o melhor capoeira de sua época no Brasil."

Jansen viajou pelo Brasil durante a década de 1940 demonstrando a eficácia de sua arte marcial. Sua reputação era tal que ele se tornou um dos nomes mais reconhecidos nos esportes de combate brasileiros daquela época.

Em 30 de outubro de 1935, Jansen participou de um evento marcante no Parque Boa Vista em Salvador, Bahia. Promotores de um grande evento de boxe o convidaram para inaugurar as apresentações em um confronto com Ricardo Nibbon, um aluno de George Gracie que detinha títulos em jiu-jitsu e luta livre. Como preliminar à luta de Jansen, Mestre Bimba e seus alunos demonstraram seu estilo de Luta Regional Baiana ao público—uma das primeiras exibições públicas documentadas do que se tornaria a Capoeira Regional.

Este evento em Salvador representou um momento significativo na história da capoeira: o encontro entre a tradição estabelecida da capoeiragem carioca do Rio de Janeiro e o estilo Regional baiano emergente. Jansen personificava a abordagem focada em combate de Sinhozinho para a capoeira—despojada de música e ritual, misturada com técnicas de luta livre e boxe, e treinada para eficácia em combate real.

Jansen estava entre os alunos proeminentes que treinaram nas academias de Sinhozinho em Ipanema, ao lado de nomes como Rudolf Hermanny (campeão de judô e técnico da Copa do Mundo), Luiz "Cirandinha" Pereira Aguiar (halterofilista e campeão de capoeira), Antonio Carlos "Tom" Jobim (lendário músico da Bossa Nova), e o presidente do Comitê Olímpico Sylvio de Magalhães Padilha.',
  -- achievements_en
  'Champion of capoeiragem in Rio de Janeiro (campeão carioca de capoeiragem); Considered by the Rio press "the absolute master of Brazilian fighting" and "the best capoeira of his time in Brazil"; Goalkeeper of Botafogo Football Club; Toured multiple Brazilian states demonstrating capoeira''s fighting effectiveness; Participated in landmark 1935 Salvador event alongside Mestre Bimba''s first public Regional exhibition',
  -- achievements_pt
  'Campeão carioca de capoeiragem; Considerado pela imprensa carioca "o mestre absoluto da luta brasileira" e "o melhor capoeira de sua época no Brasil"; Goleiro do Botafogo Football Club; Percorreu vários estados brasileiros demonstrando a eficácia da capoeira como luta; Participou do evento histórico de 1935 em Salvador ao lado da primeira exibição pública da Regional de Mestre Bimba',
  -- Researcher notes (English)
  E'BIRTH YEAR: Unknown. Estimated ~1910 (decade precision) based on peak activity in 1935-1940s. If he was 25-35 during his championship period, he would have been born between approximately 1900-1920.

DEATH YEAR: Unknown. No death date found in any source.

BOTAFOGO CONNECTION: Multiple sources confirm he was a goalkeeper for Botafogo Football Club. However, he does not appear in the documented roster of famous Botafogo goalkeepers from 1930-1940 (Roberto Gomes Pedrosa, Germano, Aymoré Moreira). This could indicate he was a reserve goalkeeper, played briefly, or that the "Botafogo" reference is to a different period or role.

FIRST GENERATION: Sources explicitly state André Jansen was "the highlight of this first generation" trained by Sinhozinho. This distinguishes him from Rudolf Hermanny, who was "the highlight of the last generation."

1935 SALVADOR EVENT: The October 30, 1935 event at Parque Boa Vista is significant as it brought together Rio''s capoeira carioca tradition (via Jansen) with Salvador''s emerging Regional style (via Bimba''s exhibition). Jansen''s opponent Ricardo Nibbon was a jiu-jitsu practitioner, not a capoeirista.

TITLE: No formal capoeira title. Capoeira carioca did not use the title system that developed in Bahia.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-sinhozinho-1891-1962/ (primary)
- rohermanny.tripod.com
- recantodasletras.com.br/artigos-de-esporte/7260229
- Existing sinhozinho.sql in genealogy database',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: Desconhecido. Estimado ~1910 (precisão de década) baseado na atividade de pico em 1935-1940. Se tinha 25-35 anos durante seu período de campeonato, teria nascido entre aproximadamente 1900-1920.

ANO DE MORTE: Desconhecido. Nenhuma data de morte encontrada em qualquer fonte.

CONEXÃO COM BOTAFOGO: Múltiplas fontes confirmam que ele era goleiro do Botafogo Football Club. No entanto, ele não aparece na lista documentada de goleiros famosos do Botafogo de 1930-1940 (Roberto Gomes Pedrosa, Germano, Aymoré Moreira). Isso pode indicar que era goleiro reserva, jogou brevemente, ou que a referência "Botafogo" é de um período ou função diferente.

PRIMEIRA GERAÇÃO: Fontes afirmam explicitamente que André Jansen era "o destaque desta primeira geração" treinada por Sinhozinho. Isso o distingue de Rudolf Hermanny, que era "o destaque da última geração."

EVENTO DE SALVADOR 1935: O evento de 30 de outubro de 1935 no Parque Boa Vista é significativo pois reuniu a tradição da capoeira carioca do Rio (via Jansen) com o estilo Regional emergente de Salvador (via exibição de Bimba). O oponente de Jansen, Ricardo Nibbon, era praticante de jiu-jitsu, não capoeirista.

TÍTULO: Sem título formal de capoeira. A capoeira carioca não usava o sistema de títulos que se desenvolveu na Bahia.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-sinhozinho-1891-1962/ (primária)
- rohermanny.tripod.com
- recantodasletras.com.br/artigos-de-esporte/7260229
- sinhozinho.sql existente no banco de dados de genealogia'
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
