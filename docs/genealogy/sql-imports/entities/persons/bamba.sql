-- ============================================================
-- GENEALOGY PERSON: Bamba
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH DATE ESTIMATION (1964, exact):
-- Portal Capoeira interview states "Costa Silva Rubens, Mestre Bamba,
-- nasceu no dia 04 de Setembro de 1964" (born September 4, 1964).
-- User input suggested born 1965, but began capoeira age 12 in 1977
-- (1977 - 12 = 1965). However Portal Capoeira is explicit: Sept 4, 1964.
-- Possible discrepancy: may have started at age 12 in late 1977
-- (after Sept birthday) making him technically 13. Using 1964 as
-- the Portal Capoeira source is explicit.
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
  'Rubens Costa Silva',
  'Bamba',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-bamba/', 'https://portalcapoeira.com/capoeira/fundamentos-da-capoeira/o-bamba-e-bamba/', 'https://www.lalaue.com/capoeira-schools/associacao-de-capoeira-mestre-bimba/', 'https://www.capoeira-muenchen.de/en/capoeira/the-masters']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Mestre Bamba is known for his flexibility and graceful movements, earning him the epithet "bailarino da capoeira" (the dancer of capoeira). He developed the famous "meia lua baiana" (Bahian half-moon), a signature technique. Despite his seemingly delicate style, he is described as a dangerous and fearless capoeirista. His game preserves the pure methodology of Mestre Bimba''s Capoeira Regional while maintaining the tradition passed down through Vermelho 27.',
  E'Mestre Bamba é conhecido por sua flexibilidade e movimentos graciosos, ganhando o epíteto de "bailarino da capoeira". Ele desenvolveu a famosa "meia lua baiana", uma técnica característica. Apesar de seu estilo aparentemente delicado, é descrito como um capoeirista perigoso e destemido. Seu jogo preserva a metodologia pura da Capoeira Regional de Mestre Bimba enquanto mantém a tradição transmitida através de Vermelho 27.',
  -- Life dates
  1964,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Rubens Costa Silva, known as Mestre Bamba or affectionately "Rubinho," was born on September 4, 1964, in Salvador, Bahia. At the age of 12, while helping his mother run a restaurant in the historic center, young Rubens witnessed capoeira classes being taught by Mestre Gato da Bahia in the Pelourinho. This encounter sparked his passion for the art.

His entry into capoeira came through the streets. Participating in various rodas at the Terreiro de Jesus, he met Mestre Vermelho Boxel (Cecílio de Jesus Calheiros), whom Bamba considers his first mestre. This encounter in 1977 proved fateful. Vermelho Boxel introduced the young aspirant to the Associação de Capoeira Mestre Bimba, where Vermelho 27—Vermelho Boxel''s own teacher—still held court as the custodian of Mestre Bimba''s legacy.

From that moment, Bamba immersed himself in the world of Capoeira Regional at the historic academy on Rua das Laranjeiras in the Terreiro de Jesus—the very space where Mestre Bimba had taught since 1942. Under the guidance of Mestre Vermelho 27, assisted by mestres Coringa, Durval (Ferro Velho), Boa Gente, and Bahia, Bamba progressed from a simple associate to become the inheritor of one of capoeira''s most sacred spaces.

Bamba''s journey from student to leader was gradual but steady. He trained for years at the academy, eventually receiving his mestre diploma from Vermelho 27. When Vermelho 27 passed away on May 18, 1996—after years battling skin cancer—Bamba invested tremendous effort to preserve the traditions and history of Capoeira Regional. He sought counsel from the older mestres in Bahia, and most supported his intention to conserve the culture and history of capoeira.

Today, Mestre Bamba serves as President of the Associação de Capoeira Mestre Bimba, continuing the succession that runs from Mestre Bimba through Vermelho 27 (with a brief period under Mestre Almiro in the mid-1980s). He teaches at Rua das Laranjeiras in the Pelourinho, where demonstrations occur almost every night featuring traditional Regional, various toques of the berimbaus, contemporary rodas, and sometimes maculelê.

His philosophy reflects profound humility: "I am not the owner of Regional Capoeira; I had several masters, and I will always respect my Mestre Vermelho 27. I preserve the history of Capoeira Regional and practice it until the day I die. The Capoeira Regional was passed on to me by Mestre Vermelho 27." He emphasizes that he respects all other styles of capoeira and refuses to criticize other expressions of the art.

Under his leadership, the ACMB has grown into an international organization with branches in Japan, Belgium, the United States, Great Britain, Australia, Russia, Canada, and Poland. Mestre Bamba dedicates considerable time to traveling throughout Europe and beyond to teach. The organization has produced numerous mestres including Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra, and others—some of whom later founded their own organizations, notably the União Internacional de Capoeira Regional (UNICAR) in 2003.

Mestre Bamba''s training grounds at the Terreiro de Jesus represent the oldest physical space in the world where capoeira is continuously taught. As custodian of this heritage, he embodies the living link between the founder of Capoeira Regional and future generations—a responsibility he carries with characteristic dedication and grace.',
  -- bio_pt
  E'Rubens Costa Silva, conhecido como Mestre Bamba ou carinhosamente "Rubinho," nasceu em 4 de setembro de 1964, em Salvador, Bahia. Aos 12 anos, enquanto ajudava sua mãe a administrar um restaurante no centro histórico, o jovem Rubens presenciou aulas de capoeira ministradas por Mestre Gato da Bahia no Pelourinho. Este encontro despertou sua paixão pela arte.

Sua entrada na capoeira veio pelas ruas. Participando de várias rodas no Terreiro de Jesus, ele conheceu Mestre Vermelho Boxel (Cecílio de Jesus Calheiros), a quem Bamba considera seu primeiro mestre. Este encontro em 1977 provou ser decisivo. Vermelho Boxel apresentou o jovem aspirante à Associação de Capoeira Mestre Bimba, onde Vermelho 27—o próprio professor de Vermelho Boxel—ainda reinava como guardião do legado de Mestre Bimba.

A partir daquele momento, Bamba mergulhou no mundo da Capoeira Regional na histórica academia da Rua das Laranjeiras no Terreiro de Jesus—o mesmo espaço onde Mestre Bimba havia ensinado desde 1942. Sob a orientação de Mestre Vermelho 27, auxiliado pelos mestres Coringa, Durval (Ferro Velho), Boa Gente e Bahia, Bamba progrediu de um simples associado a herdeiro de um dos espaços mais sagrados da capoeira.

A jornada de Bamba de aluno a líder foi gradual mas constante. Ele treinou por anos na academia, eventualmente recebendo seu diploma de mestre de Vermelho 27. Quando Vermelho 27 faleceu em 18 de maio de 1996—após anos lutando contra câncer de pele—Bamba investiu tremendo esforço para preservar as tradições e a história da Capoeira Regional. Ele buscou conselho dos mestres mais velhos da Bahia, e a maioria apoiou sua intenção de conservar a cultura e a história da capoeira.

Hoje, Mestre Bamba serve como Presidente da Associação de Capoeira Mestre Bimba, continuando a sucessão que vai de Mestre Bimba através de Vermelho 27 (com um breve período sob Mestre Almiro em meados dos anos 1980). Ele ensina na Rua das Laranjeiras no Pelourinho, onde demonstrações ocorrem quase todas as noites apresentando Regional tradicional, vários toques de berimbaus, rodas contemporâneas e às vezes maculelê.

Sua filosofia reflete profunda humildade: "Eu não sou o dono da Capoeira Regional; eu tive vários mestres, e sempre respeitarei meu Mestre Vermelho 27. Eu preservo a história da Capoeira Regional e a pratico até o dia em que morrer. A Capoeira Regional foi passada para mim pelo Mestre Vermelho 27." Ele enfatiza que respeita todos os outros estilos de capoeira e se recusa a criticar outras expressões da arte.

Sob sua liderança, a ACMB cresceu para uma organização internacional com filiais no Japão, Bélgica, Estados Unidos, Grã-Bretanha, Austrália, Rússia, Canadá e Polônia. Mestre Bamba dedica tempo considerável viajando pela Europa e além para ensinar. A organização produziu numerosos mestres incluindo Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra e outros—alguns dos quais mais tarde fundaram suas próprias organizações, notadamente a União Internacional de Capoeira Regional (UNICAR) em 2003.

Os campos de treinamento de Mestre Bamba no Terreiro de Jesus representam o espaço físico mais antigo do mundo onde a capoeira é continuamente ensinada. Como guardião deste patrimônio, ele encarna o elo vivo entre o fundador da Capoeira Regional e as gerações futuras—uma responsabilidade que ele carrega com dedicação e graça características.',
  -- achievements_en
  E'President of Associação de Capoeira Mestre Bimba (ACMB); Custodian of the oldest continuously operating capoeira academy in the world (since 1942); Developed the "meia lua baiana" (Bahian half-moon) technique; Expanded ACMB internationally to Japan, Belgium, USA, Great Britain, Australia, Russia, Canada, and Poland; Trained numerous mestres including Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra, Saguin, and others',
  -- achievements_pt
  E'Presidente da Associação de Capoeira Mestre Bimba (ACMB); Guardião da academia de capoeira em operação contínua mais antiga do mundo (desde 1942); Desenvolveu a técnica "meia lua baiana"; Expandiu a ACMB internacionalmente para Japão, Bélgica, EUA, Grã-Bretanha, Austrália, Rússia, Canadá e Polônia; Formou numerosos mestres incluindo Orelha, Nelsinho, Marinheiro, Zambi, Cabeludo, Traíra, Saguin e outros',
  -- notes_en
  E'BIRTH DATE: September 4, 1964 per Portal Capoeira interview
User input stated born 1965, but Portal Capoeira is explicit about Sept 4, 1964.
Began capoeira at age 12 in 1977.

NAME VARIANTS:
- Rubens Costa Silva (full name)
- Rubens Costa e Silva (variant spelling)
- "Rubinho" (affectionate nickname)

TEACHERS:
- Mestre Vermelho Boxel (Cecílio de Jesus Calheiros) - first mestre, street training, 1977
- Mestre Vermelho 27 (José Carlos Andrade Bittencourt) - primary mestre at ACMB, 1977-1996
- Mestre Coringa - assisted at ACMB
- Mestre Durval (Ferro Velho) - assisted at ACMB; great influence on Bamba
- Mestre Boa Gente (Vivaldo Conceição Rodrigues) - assisted at ACMB
- Mestre Bahia - assisted at ACMB

STUDENTS (confirmed as mestres):
- Mestre Orelha
- Mestre Nelsinho - co-founded UNICAR 2003
- Mestre Marinheiro - co-founded UNICAR 2003
- Mestre Zambi - co-founded UNICAR 2003
- Mestre Cabeludo (Antonio Sergio Pinho Freire de Carvalho) - also trained under Vermelho 27; founded Porto da Barra 1993
- Mestre Traíra - co-founded UNICAR 2003
- Mestre Saguin (Judival Santos de Filho Brito) - trained ~8 years at ACMB; co-founded UNICAR 2003; first ACMB academy in Europe (Munich, 1991)
- Mola Sete
- Jorge Rasta

STYLE NOTES:
- Known as "bailarino da capoeira" (dancer of capoeira) for graceful movements
- Developed signature "meia lua baiana" technique
- Described as flexible, graceful yet dangerous and fearless

ACADEMY SUCCESSION:
1. Mestre Bimba (1942-1973)
2. Mestre Vermelho 27 (1973-early 1980s)
3. Mestre Almiro (1983-1986)
4. Mestre Bamba (1986-present)

ACADEMY ADDRESS:
Rua Francisco Muniz Barreto #1 (formerly Rua das Laranjeiras)
Terreiro de Jesus, Pelourinho, Salvador, Bahia
Phone: 71 99248-3842
Email: kbcaocapoeira@hotmail.com
Website: capoeiramestrebimba.com.br

INTERNATIONAL BRANCHES (as of 2025):
- Japan
- Belgium
- USA (including Bay Area)
- Great Britain (London)
- Australia (Soul Capoeira, Sydney)
- Russia (Krasnodar)
- Canada (Edmonton)
- Poland (Bydgoszcz, Poznań, Rzeszów, Toruń)

UNICAR SPLIT (2003):
In 2003, several of Bamba''s students (Mestre Nelsinho, Mestre Marinheiro, Mestre Traíra, Mestre Zambi, and Mestre Saguin) departed to found UNICAR - União Internacional de Capoeira Regional. This became one of the largest Capoeira organizations in Europe.

PHILOSOPHY QUOTES:
- "I am not the owner of Regional Capoeira; I had several masters, and I will always respect my Mestre Vermelho 27."
- "I preserve the history of Capoeira Regional and practice it until the day I die. The Capoeira Regional was passed on to me by Mestre Vermelho 27."
- "I respect any other kind of Capoeira, and I do not criticize other species, because this kind of criticism can destroy CAPOEIRA."',
  -- notes_pt
  E'DATA DE NASCIMENTO: 4 de setembro de 1964 conforme entrevista Portal Capoeira
Input do usuário indicou nascido 1965, mas Portal Capoeira é explícito sobre 4 de setembro de 1964.
Começou capoeira aos 12 anos em 1977.

VARIANTES DO NOME:
- Rubens Costa Silva (nome completo)
- Rubens Costa e Silva (variante de escrita)
- "Rubinho" (apelido carinhoso)

PROFESSORES:
- Mestre Vermelho Boxel (Cecílio de Jesus Calheiros) - primeiro mestre, treino de rua, 1977
- Mestre Vermelho 27 (José Carlos Andrade Bittencourt) - mestre principal na ACMB, 1977-1996
- Mestre Coringa - auxiliou na ACMB
- Mestre Durval (Ferro Velho) - auxiliou na ACMB; grande influência em Bamba
- Mestre Boa Gente (Vivaldo Conceição Rodrigues) - auxiliou na ACMB
- Mestre Bahia - auxiliou na ACMB

ALUNOS (confirmados como mestres):
- Mestre Orelha
- Mestre Nelsinho - co-fundou UNICAR 2003
- Mestre Marinheiro - co-fundou UNICAR 2003
- Mestre Zambi - co-fundou UNICAR 2003
- Mestre Cabeludo (Antonio Sergio Pinho Freire de Carvalho) - também treinou sob Vermelho 27; fundou Porto da Barra 1993
- Mestre Traíra - co-fundou UNICAR 2003
- Mestre Saguin (Judival Santos de Filho Brito) - treinou ~8 anos na ACMB; co-fundou UNICAR 2003; primeira academia ACMB na Europa (Munique, 1991)
- Mola Sete
- Jorge Rasta

NOTAS DE ESTILO:
- Conhecido como "bailarino da capoeira" por movimentos graciosos
- Desenvolveu técnica característica "meia lua baiana"
- Descrito como flexível, gracioso mas perigoso e destemido

SUCESSÃO DA ACADEMIA:
1. Mestre Bimba (1942-1973)
2. Mestre Vermelho 27 (1973-início anos 1980)
3. Mestre Almiro (1983-1986)
4. Mestre Bamba (1986-presente)

ENDEREÇO DA ACADEMIA:
Rua Francisco Muniz Barreto #1 (anteriormente Rua das Laranjeiras)
Terreiro de Jesus, Pelourinho, Salvador, Bahia
Telefone: 71 99248-3842
Email: kbcaocapoeira@hotmail.com
Website: capoeiramestrebimba.com.br

FILIAIS INTERNACIONAIS (em 2025):
- Japão
- Bélgica
- EUA (incluindo Bay Area)
- Grã-Bretanha (Londres)
- Austrália (Soul Capoeira, Sydney)
- Rússia (Krasnodar)
- Canadá (Edmonton)
- Polônia (Bydgoszcz, Poznań, Rzeszów, Toruń)

SEPARAÇÃO UNICAR (2003):
Em 2003, vários alunos de Bamba (Mestre Nelsinho, Mestre Marinheiro, Mestre Traíra, Mestre Zambi e Mestre Saguin) saíram para fundar a UNICAR - União Internacional de Capoeira Regional. Esta se tornou uma das maiores organizações de Capoeira na Europa.

CITAÇÕES DE FILOSOFIA:
- "Eu não sou o dono da Capoeira Regional; eu tive vários mestres, e sempre respeitarei meu Mestre Vermelho 27."
- "Eu preservo a história da Capoeira Regional e a pratico até o dia em que morrer. A Capoeira Regional foi passada para mim pelo Mestre Vermelho 27."
- "Eu respeito qualquer outro tipo de Capoeira, e não critico outras espécies, porque esse tipo de crítica pode destruir a CAPOEIRA."'
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
