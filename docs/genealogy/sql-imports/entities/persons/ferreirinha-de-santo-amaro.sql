-- ============================================================
-- GENEALOGY PERSON: Ferreirinha de Santo Amaro
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR: 1925 (exact, per velhosmestres.com; confirmed through
-- death age: "died at seventy-two years old" in 1998)
--
-- DEATH YEAR: 1998 (exact, per velhosmestres.com)
--
-- FULL NAME: José Ferreira dos Santos
--
-- APELIDO_CONTEXT: 'Santo Amaro' - REQUIRED to distinguish from:
-- - Silvestre Vitório Ferreira (also known as Ferreirinha in Salvador 1960s)
--   who later founded Grupo Vera Cruz in São Paulo
--
-- LINEAGE: Antônio Asa Branca → Ferreirinha de Santo Amaro → Ivan de Santo Amaro
--                                                          → Macaco (Santo Amaro)
--
-- ABCA FOUNDER: Co-founded the Associação Brasileira de Capoeira Angola
-- (ABCA) in 1987 alongside João Pequeno de Pastinha, Paulo dos Anjos,
-- Valdemar da Paixão, Boca Rica, Nô, René, Curió, Papo Amarelo, Calazans
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
  'José Ferreira dos Santos',
  'Ferreirinha de Santo Amaro',
  'Santo Amaro',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-42']::text[],
  'angola'::genealogy.style,
  E'Ferreirinha represented the traditional Capoeira Angola of Santo Amaro da Purificação, transmitted from the proto-mestre Antônio Asa Branca. He was renowned as an exceptional berimbau player—his student Mestre Ivan testified that "nobody could play berimbau like him." His teaching style was tough and demanding, unchanged throughout his years of instruction.',
  E'Ferreirinha representava a Capoeira Angola tradicional de Santo Amaro da Purificação, transmitida pelo proto-mestre Antônio Asa Branca. Era renomado como excepcional tocador de berimbau—seu aluno Mestre Ivan testemunhou que "ninguém tocava berimbau como ele." Seu estilo de ensino era duro e exigente, inalterado ao longo de seus anos de instrução.',
  1925, 'exact'::genealogy.date_precision, NULL,
  1998, 'exact'::genealogy.date_precision, 'Santo Amaro da Purificação, Bahia, Brazil',
  E'José Ferreira dos Santos, known as Mestre Ferreirinha de Santo Amaro, was a capoeira mestre from the Recôncavo Baiano who preserved and transmitted the Angola tradition of his teacher, Antônio Asa Branca.

Born in 1925, Ferreirinha arrived in Santo Amaro at age ten in 1935, fleeing an abusive stepfather. He came seeking work and never returned home. There, he found capoeira and his future mestre. He began learning with Antônio Asa Branca, a legendary proto-mestre of Santo Amaro.

Ferreirinha''s stories about Asa Branca became part of capoeira oral history. "They say that Mestre Antônio Asa Branca played capoeira best when he was drunk," according to testimonies preserved in velhosmestres.com interviews. Ferreirinha would recount how, when sober, "you could do what you wanted with him," but when drunk "a merda pegava" (the shit would hit the fan). One famous story tells of Asa Branca in a street roda when a policeman ordered them to stop playing. Drunk, he said "Yes, we can." When the policeman pulled his weapon, Asa Branca delivered a hammer kick that sent the officer flying onto a wall seven palms high.

Ferreirinha himself became a towering figure in Santo Amaro''s capoeira history. He knew Mestres João Pequeno and Pastinha personally, spending considerable time with the latter. "They were from the same period," noted his student M Ivan.

His teaching conditions were modest but prolific. Ferreirinha taught from his house—a space of only about three by three meters—yet he had many students. Both classes and rodas took place in that small space. At some point, the historian Dona Gilda helped him find a larger space at a local school, but she lost her job as director because the Mayor or Secretary of Education objected to "a negro coming into our school to do capoeira." After this incident, Ferreirinha continued teaching at home. A couple of years later, he spent one year teaching capoeira with the infantry in Santo Amaro.

Ferreirinha was a devout Catholic with an altar dedicated to Santo Antônio. Classes would begin with prayer—he would make offerings, light candles, and then start instruction. Despite his modest circumstances, he helped students who couldn''t afford to pay, offering flexible payment arrangements.

He came from a family of carpenters and knew how to make atabaque drums, though he never sold them—"they weren''t for sale."

His berimbau skills were legendary. Mestre Ivan, who trained under him for a decade beginning in 1976, testified: "Nobody could play berimbau like him."

In 1987, Ferreirinha was among the founding members of the Associação Brasileira de Capoeira Angola (ABCA), alongside Mestres João Pequeno de Pastinha, Paulo dos Anjos, Valdemar da Paixão, Boca Rica, Nô, René, Curió, Papo Amarelo, and Calazans. The ABCA became "o templo sagrado da capoeira angola" (the sacred temple of capoeira angola).

Ferreirinha was interviewed extensively by researchers documenting the velhos mestres of Bahia: by Mestres Itapoan, Luiz Renato, and Eziquiel on September 5, 1989; and by historian Matthias Assunção on September 5, 1994, and January 28, 1995 (these interviews remain unpublished). Audio recordings from a 1987 event also exist.

His students carried forward his legacy. Mestre Ivan de Santo Amaro trained under him for approximately a decade (1976-~1986) and later founded ACANA (Associação de Capoeira Aprender Netos de Angola—"Grandchildren of Angola") to preserve Ferreirinha''s teachings. Mestre Macaco began training in the 1970s and became mestre by 1985; he would later lead ACARBO (Associação Cultural Acarbo), an organization with over 24 years of cultural work in the Recôncavo.

Mestre Ferreirinha de Santo Amaro died in 1998 at seventy-two years of age, leaving behind a lineage that continues to preserve the Angola tradition of Santo Amaro da Purificação.',

  E'José Ferreira dos Santos, conhecido como Mestre Ferreirinha de Santo Amaro, foi um mestre de capoeira do Recôncavo Baiano que preservou e transmitiu a tradição Angola de seu professor, Antônio Asa Branca.

Nascido em 1925, Ferreirinha chegou a Santo Amaro aos dez anos de idade em 1935, fugindo de um padrasto abusivo. Veio em busca de trabalho e nunca voltou para casa. Lá, encontrou a capoeira e seu futuro mestre. Começou a aprender com Antônio Asa Branca, um lendário proto-mestre de Santo Amaro.

As histórias de Ferreirinha sobre Asa Branca tornaram-se parte da história oral da capoeira. "Dizem que Mestre Antônio Asa Branca jogava capoeira melhor quando estava bêbado," de acordo com testemunhos preservados em entrevistas do velhosmestres.com. Ferreirinha contava como, quando sóbrio, "você podia fazer o que quisesse com ele," mas quando bêbado "a merda pegava." Uma história famosa conta de Asa Branca em uma roda de rua quando um policial ordenou que parassem de jogar. Bêbado, ele disse "Sim, podemos." Quando o policial sacou sua arma, Asa Branca deu um martelo que mandou o oficial voando para cima de um muro de sete palmos de altura.

O próprio Ferreirinha tornou-se uma figura imponente na história da capoeira de Santo Amaro. Conheceu pessoalmente Mestres João Pequeno e Pastinha, passando tempo considerável com este último. "Eram da mesma época," observou seu aluno M Ivan.

Suas condições de ensino eram modestas, mas prolíficas. Ferreirinha ensinava em sua casa—um espaço de apenas cerca de três por três metros—porém tinha muitos alunos. Tanto as aulas quanto as rodas aconteciam naquele pequeno espaço. Em algum momento, a historiadora Dona Gilda o ajudou a encontrar um espaço maior em uma escola local, mas ela perdeu seu emprego como diretora porque o Prefeito ou Secretário de Educação se opôs a "um negro entrando em nossa escola para fazer capoeira." Após este incidente, Ferreirinha continuou ensinando em casa. Alguns anos depois, passou um ano ensinando capoeira com a infantaria em Santo Amaro.

Ferreirinha era um católico devoto com um altar dedicado a Santo Antônio. As aulas começavam com oração—ele fazia oferendas, acendia velas e então começava a instrução. Apesar de suas circunstâncias modestas, ajudava alunos que não podiam pagar, oferecendo arranjos flexíveis de pagamento.

Vinha de uma família de carpinteiros e sabia fazer atabaques, embora nunca os vendesse—"não eram para vender."

Suas habilidades no berimbau eram lendárias. Mestre Ivan, que treinou com ele por uma década a partir de 1976, testemunhou: "Ninguém tocava berimbau como ele."

Em 1987, Ferreirinha foi um dos membros fundadores da Associação Brasileira de Capoeira Angola (ABCA), junto com Mestres João Pequeno de Pastinha, Paulo dos Anjos, Valdemar da Paixão, Boca Rica, Nô, René, Curió, Papo Amarelo e Calazans. A ABCA tornou-se "o templo sagrado da capoeira angola."

Ferreirinha foi entrevistado extensivamente por pesquisadores documentando os velhos mestres da Bahia: por Mestres Itapoan, Luiz Renato e Eziquiel em 5 de setembro de 1989; e pelo historiador Matthias Assunção em 5 de setembro de 1994 e 28 de janeiro de 1995 (essas entrevistas permanecem não publicadas). Gravações de áudio de um evento de 1987 também existem.

Seus alunos levaram adiante seu legado. Mestre Ivan de Santo Amaro treinou com ele por aproximadamente uma década (1976-~1986) e mais tarde fundou a ACANA (Associação de Capoeira Aprender Netos de Angola) para preservar os ensinamentos de Ferreirinha. Mestre Macaco começou a treinar nos anos 1970 e tornou-se mestre em 1985; mais tarde lideraria a ACARBO (Associação Cultural Acarbo), uma organização com mais de 24 anos de trabalho cultural no Recôncavo.

Mestre Ferreirinha de Santo Amaro faleceu em 1998 aos setenta e dois anos de idade, deixando para trás uma linhagem que continua a preservar a tradição Angola de Santo Amaro da Purificação.',

  E'- Co-founded the Associação Brasileira de Capoeira Angola (ABCA) in 1987
- Known as an exceptional berimbau player—"nobody could play berimbau like him" (M Ivan)
- Trained Mestre Ivan de Santo Amaro (1976-~1986), founder of ACANA
- Trained Mestre Macaco (1970s), became mestre by 1985, later led ACARBO
- Knew Mestres João Pequeno and Pastinha personally, "from the same period"
- Taught in modest 3x3 meter space in his home with many students
- Briefly taught at local school (with Dona Gilda''s help) before being expelled for racism
- Taught capoeira for one year with the infantry in Santo Amaro
- Documented through interviews by Mestres Itapoan, Luiz Renato, Eziquiel (1989) and Matthias Assunção (1994-95)
- Preserved oral history of his teacher Antônio Asa Branca',

  E'- Co-fundou a Associação Brasileira de Capoeira Angola (ABCA) em 1987
- Conhecido como excepcional tocador de berimbau—"ninguém tocava berimbau como ele" (M Ivan)
- Treinou Mestre Ivan de Santo Amaro (1976-~1986), fundador da ACANA
- Treinou Mestre Macaco (anos 1970), tornou-se mestre em 1985, mais tarde liderou a ACARBO
- Conheceu pessoalmente Mestres João Pequeno e Pastinha, "da mesma época"
- Ensinou em modesto espaço de 3x3 metros em sua casa com muitos alunos
- Brevemente ensinou em escola local (com ajuda de Dona Gilda) antes de ser expulso por racismo
- Ensinou capoeira por um ano com a infantaria em Santo Amaro
- Documentado através de entrevistas por Mestres Itapoan, Luiz Renato, Eziquiel (1989) e Matthias Assunção (1994-95)
- Preservou história oral de seu professor Antônio Asa Branca',

  E'BIRTH YEAR (1925, exact):
Velhosmestres.com gives explicit birth year 1925 and confirms "died at seventy-two years old" in 1998, consistent with 1925 birth.

DEATH YEAR (1998, exact):
Confirmed by velhosmestres.com and Mestre Ivan testimony.

ARRIVAL IN SANTO AMARO:
Came to Santo Amaro at age 10 (i.e., 1935), fleeing abusive stepfather. Never returned home.

TEACHER:
- Antônio Asa Branca (proto-mestre of Santo Amaro; legendary for capoeira prowess when drunk)

STUDENTS:
- Mestre Ivan de Santo Amaro (Ivan Raimundo Sales, b.~1966) - began 1976 at age 10, trained ~10 years
- Mestre Macaco (Santo Amaro) - began 1970s, became mestre by 1985; later led ACARBO

CONTEMPORARIES:
- Mestre João Pequeno - knew personally
- Mestre Pastinha - knew personally, "spent a lot of time" with him, "same period"

ABCA CO-FOUNDERS (1987):
João Pequeno de Pastinha, Paulo dos Anjos, Valdemar da Paixão, Boca Rica, Ferreirinha de Santo Amaro, Nô, René, Curió, Papo Amarelo, Calazans

TEACHING LOCATIONS:
- His home (approx. 3x3 meters) - primary location
- Local school (brief, with Dona Gilda''s help) - ended due to racism
- Infantry in Santo Amaro (one year)

MEDIA APPEARANCES:
- 1987: Audio recording at capoeira event
- 1989: Photo with M Itapoan, M Luiz Renato, M Eziquiel in Santo Amaro
- 1989: Interview by Mestres Itapoan, Luiz Renato, Eziquiel (September 5)
- 1994: Interview by Matthias Assunção (September 5) - unpublished
- 1995: Interview by Matthias Assunção (January 28) - unpublished

FAMILY BACKGROUND:
- Came from family of carpenters
- Knew how to make atabaque drums (not for sale)
- Catholic, altar dedicated to Santo Antônio

TEACHING PRACTICE:
- Classes began with prayer/offerings/candles
- Tough, demanding instruction
- Helped poor students with flexible payment

APELIDO CONTEXT:
Uses ''Santo Amaro'' to distinguish from Silvestre Vitório Ferreira, also known as Ferreirinha in Salvador during the 1960s, who later founded Grupo Vera Cruz in São Paulo.

PRIMARY SOURCES:
- Velhosmestres.com interviews with Mestre Ivan about Ferreirinha
- Mapa da Capoeira ABCA founding documentation
- IPHAN/Portal Capoeira sources on ABCA

LINEAGE:
Antônio Asa Branca → Ferreirinha de Santo Amaro → Ivan de Santo Amaro / Macaco (Santo Amaro)',

  E'ANO DE NASCIMENTO (1925, exato):
Velhosmestres.com dá o ano de nascimento explícito de 1925 e confirma "morreu aos setenta e dois anos" em 1998, consistente com nascimento em 1925.

ANO DE MORTE (1998, exato):
Confirmado por velhosmestres.com e testemunho de Mestre Ivan.

CHEGADA EM SANTO AMARO:
Chegou a Santo Amaro aos 10 anos (ou seja, 1935), fugindo de padrasto abusivo. Nunca voltou para casa.

PROFESSOR:
- Antônio Asa Branca (proto-mestre de Santo Amaro; lendário por sua perícia na capoeira quando bêbado)

ALUNOS:
- Mestre Ivan de Santo Amaro (Ivan Raimundo Sales, n.~1966) - começou 1976 aos 10 anos, treinou ~10 anos
- Mestre Macaco (Santo Amaro) - começou anos 1970, tornou-se mestre em 1985; mais tarde liderou ACARBO

CONTEMPORÂNEOS:
- Mestre João Pequeno - conheceu pessoalmente
- Mestre Pastinha - conheceu pessoalmente, "passou muito tempo" com ele, "mesma época"

CO-FUNDADORES DA ABCA (1987):
João Pequeno de Pastinha, Paulo dos Anjos, Valdemar da Paixão, Boca Rica, Ferreirinha de Santo Amaro, Nô, René, Curió, Papo Amarelo, Calazans

LOCAIS DE ENSINO:
- Sua casa (aprox. 3x3 metros) - local principal
- Escola local (breve, com ajuda de Dona Gilda) - terminou devido a racismo
- Infantaria em Santo Amaro (um ano)

APARIÇÕES NA MÍDIA:
- 1987: Gravação de áudio em evento de capoeira
- 1989: Foto com M Itapoan, M Luiz Renato, M Eziquiel em Santo Amaro
- 1989: Entrevista por Mestres Itapoan, Luiz Renato, Eziquiel (5 de setembro)
- 1994: Entrevista por Matthias Assunção (5 de setembro) - não publicada
- 1995: Entrevista por Matthias Assunção (28 de janeiro) - não publicada

HISTÓRICO FAMILIAR:
- Vinha de família de carpinteiros
- Sabia fazer atabaques (não para vender)
- Católico, altar dedicado a Santo Antônio

PRÁTICA DE ENSINO:
- Aulas começavam com oração/oferendas/velas
- Instrução dura e exigente
- Ajudava alunos pobres com pagamento flexível

CONTEXTO DO APELIDO:
Usa ''Santo Amaro'' para distinguir de Silvestre Vitório Ferreira, também conhecido como Ferreirinha em Salvador durante os anos 1960, que mais tarde fundou o Grupo Vera Cruz em São Paulo.

FONTES PRIMÁRIAS:
- Entrevistas do velhosmestres.com com Mestre Ivan sobre Ferreirinha
- Documentação da fundação da ABCA no Mapa da Capoeira
- Fontes IPHAN/Portal Capoeira sobre ABCA

LINHAGEM:
Antônio Asa Branca → Ferreirinha de Santo Amaro → Ivan de Santo Amaro / Macaco (Santo Amaro)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
