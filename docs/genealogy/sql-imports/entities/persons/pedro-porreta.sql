-- ============================================================
-- GENEALOGY PERSON: Pedro Porreta
-- Generated: 2025-12-17
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1890 based on active period 1920s-1930s.
-- If 30-40 years old during documented incidents (1920-1931), birth ~1880-1901.
-- Using 1890 as midpoint estimate with decade precision.
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
  'Pedro Celestino dos Santos',
  'Pedro Porreta',
  NULL,
  NULL,
  ARRAY['https://books.scielo.org/id/pvm8g', 'https://www.mapadacapoeira.com.br/descricaoPontos.aspx?fk_ponto=8']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s-1930s). Known for using razors in street fights, a common weapon among capoeiristas of this period. Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s-1930s). Conhecido por usar navalhas em brigas de rua, uma arma comum entre os capoeiristas deste período. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  1930,
  'approximate'::genealogy.date_precision,
  'Salvador, Brazil',
  -- Extended content (bilingual)
  E'Pedro Celestino dos Santos, known as Pedro Porreta, was one of the most notorious capoeiristas of early 20th century Salvador, Bahia. He was a fish seller at the Mercado de Santa Bárbara in the Pilar District, a famous meeting place for capoeira practitioners.\n\nPorreta dominated the Baixa dos Sapateiros area (nicknamed "Baixinha"), functioning as a local authority figure who "maintained order and disorder" in the region. He lived on Rua do Tijolo and had support from allied politicians and police. His brother, Pedro de Alcântara, known as "Piroca", often accompanied him in street confrontations. The book "Mestres e capoeiras famosos da Bahia" features them together with the subtitle "Os donos do quarteirão" (The owners of the block).\n\nHis first documented conflict appears in a December 14, 1920 A Tarde newspaper report. In the Taboão area, José Batista da Cruz, nicknamed "Guruxinha", was attacked with razor cuts by Pedro Porreta, assisted by his brother Piroca. The victim later died from his injuries.\n\nPorreta''s reputation extended to Salvador''s prostitution zones, where documents identify him as a cafetão (pimp). His companion Josepha Alves de Araújo stated that "the offender is known as a troublemaker and has been arrested several times by police".\n\nIn 1931, he was accused of assaulting Josepha Alves de Araújo. He was defended by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including capoeiristas, thieves, prostitutes, and the poor. Farias argued that Porreta "was in a state of complete mental disturbance", and he was acquitted.\n\nOne of the most emblematic cases of his life occurred on September 28, 1929. Pedro Porreta invaded the room of Francisca Albino dos Santos, known as Chicão, a formidable valentona (tough woman) and prostitute known to police. Porreta was searching for intimate clothing belonging to one of his companions. Feeling violated, Chicão struck him with precise blows that resulted in several injuries. The newspapers reported the "valente Porreta" arriving at the police station badly beaten.\n\nSome time after this confrontation, Pedro Porreta was assassinated, and Chicão was the main suspect.',
  E'Pedro Celestino dos Santos, conhecido como Pedro Porreta, foi um dos capoeiristas mais notórios do início do século XX em Salvador, Bahia. Era vendedor de peixe no Mercado de Santa Bárbara, no Distrito do Pilar, famoso local de encontro dos praticantes de capoeira.\n\nPorreta dominava a área da Baixa dos Sapateiros (apelidada de "Baixinha"), funcionando como uma figura de autoridade local que "mantinha a ordem e a desordem" na região. Morava na Rua do Tijolo e tinha apoio de políticos aliados e policiais. Seu irmão, Pedro de Alcântara, conhecido como "Piroca", frequentemente o acompanhava em confrontos de rua. O livro "Mestres e capoeiras famosos da Bahia" os apresenta juntos com o subtítulo "Os donos do quarteirão".\n\nSeu primeiro conflito documentado aparece em uma reportagem do jornal A Tarde de 14 de dezembro de 1920. Na área do Taboão, José Batista da Cruz, apelidado "Guruxinha", foi atacado com cortes de navalha por Pedro Porreta, auxiliado por seu irmão Piroca. A vítima faleceu posteriormente devido aos ferimentos.\n\nA reputação de Porreta estendia-se às zonas de prostituição de Salvador, onde documentos o identificam como cafetão. Sua companheira Josepha Alves de Araújo afirmou que "o ofensor é conhecido como desordeiro e tem sido preso diversas vezes pela polícia".\n\nEm 1931, ele foi acusado de agredir Josepha Alves de Araújo. Foi defendido pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo capoeiristas, ladrões, prostitutas e pobres. Farias argumentou que Porreta "estava em estado de completa perturbação mental", e ele foi absolvido.\n\nUm dos casos mais emblemáticos de sua vida ocorreu em 28 de setembro de 1929. Pedro Porreta invadiu o quarto de Francisca Albino dos Santos, conhecida como Chicão, uma formidável valentona e prostituta conhecida da polícia. Porreta procurava roupas íntimas pertencentes a uma de suas companheiras. Sentindo-se violada, Chicão desferiu-lhe golpes certeiros que resultaram em várias lesões. Os jornais noticiaram o "valente Porreta" chegando muito machucado na delegacia.\n\nAlgum tempo depois desse confronto, Pedro Porreta foi assassinado, e Chicão foi a principal suspeita.',
  -- Achievements
  'Featured in "Mestres e capoeiras famosos da Bahia" with subtitle "Os donos do quarteirão" (The owners of the block); documented in multiple court cases and newspaper reports from the 1920s-1930s',
  'Apresentado em "Mestres e capoeiras famosos da Bahia" com subtítulo "Os donos do quarteirão"; documentado em múltiplos processos judiciais e reportagens de jornais dos anos 1920-1930',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Active period documented 1920-1931. If 30-40 years old during incidents, birth = ~1880-1901. Using 1890 as midpoint.\n\nDEATH: Assassinated "some time after" September 1929 confrontation with Chicão (Francisca Albino dos Santos). Chicão was main suspect. Exact date unknown.\n\nNAME: Full name Pedro Celestino dos Santos documented in sources.\n\nBROTHER: Piroca (Pedro de Alcântara) - frequent companion in street confrontations.\n\nOCCUPATION: Fish seller at Mercado de Santa Bárbara, Pilar District. Also identified as cafetão (pimp) in prostitution zones.\n\nRESIDENCE: Rua do Tijolo, Salvador.\n\nTERRITORY: Dominated Baixa dos Sapateiros ("Baixinha") area.\n\nLEGAL RECORDS:\n- Dec 14, 1920: Attacked Guruxinha with razors (victim died)\n- Sept 28, 1929: Defeated by Chicão\n- 1931: Assault on Josepha Alves de Araújo; defended by Cosme de Farias; acquitted\n\nSOURCES: "Mestres e capoeiras famosos da Bahia" (SciELO), Mapa da Capoeira, Revista Capoeirando, Sankofa USP article, A Tarde newspaper.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Período de atividade documentado 1920-1931. Se tinha 30-40 anos durante os incidentes, nascimento = ~1880-1901. Usando 1890 como ponto médio.\n\nMORTE: Assassinado "algum tempo depois" do confronto de setembro de 1929 com Chicão (Francisca Albino dos Santos). Chicão foi a principal suspeita. Data exata desconhecida.\n\nNOME: Nome completo Pedro Celestino dos Santos documentado nas fontes.\n\nIRMÃO: Piroca (Pedro de Alcântara) - companheiro frequente em confrontos de rua.\n\nOCUPAÇÃO: Vendedor de peixe no Mercado de Santa Bárbara, Distrito do Pilar. Também identificado como cafetão nas zonas de prostituição.\n\nRESIDÊNCIA: Rua do Tijolo, Salvador.\n\nTERRITÓRIO: Dominava a área da Baixa dos Sapateiros ("Baixinha").\n\nREGISTROS LEGAIS:\n- 14 dez 1920: Atacou Guruxinha com navalhas (vítima morreu)\n- 28 set 1929: Derrotado por Chicão\n- 1931: Agressão a Josepha Alves de Araújo; defendido por Cosme de Farias; absolvido\n\nFONTES: "Mestres e capoeiras famosos da Bahia" (SciELO), Mapa da Capoeira, Revista Capoeirando, artigo Sankofa USP, jornal A Tarde.'
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
