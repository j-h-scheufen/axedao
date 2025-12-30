-- ============================================================
-- GENEALOGY PERSON: Maneca Brandão
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1925, decade precision):
-- No sources provide exact birth date. Estimated from career timeline:
-- - Primary instructor at Major Dória's academy in 1958
-- - Already trained under Bimba in Salvador and experienced enough to lead
-- - Likely 28-38 years old in 1958 → born ~1920-1930
-- - Conservative estimate: ~1925 with decade precision
-- ============================================================
-- CLARIFICATION: "Mestre Maneca" and "Maneca Brandão" are THE SAME PERSON.
-- The Suassuna report originally listed them as two separate teachers, but
-- research confirms they are identical:
-- - Velhos Mestres: Suassuna "started to learn capoeira in Itabuna with M Maneca"
-- - CDO Sergipe: "Na academia Major Dória que ministrava as aulas era o Maneca
--   Brandão, aluno do Mestre Bimba"
-- - Multiple sources list "Maneca Brandão" alongside Sururú and Bigode de Arame
--   as street roda participants where Suassuna trained
-- ============================================================
-- ZOIÃO CLARIFICATION:
-- The original backlog stated Maneca was "student of Bimba and Zoião" - INCORRECT.
-- Zoião was Maneca Brandão's CLASSMATE (companheiro de turma) at Bimba's academy,
-- not his teacher. Zoião sometimes helped Maneca with training at the academy.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Maneca Brandão', 'mestre'::genealogy.title, NULL,
  ARRAY[
    'https://portalcapoeira.com/capoeira/publicacoes-e-artigos/itabuna-lancamento-do-livro-capoeira-de-luta-de-negro-a-exercicio-de-branco-no-cenario-grapiuna/',
    'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna'
  ]::text[],
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba in Salvador. Brought the Capoeira Regional tradition to Itabuna, teaching at the Academia Cultura Física e Capoeira Major Dória from 1958. His teaching helped transmit Bimba''s methodology to the next generation, most notably to Mestre Suassuna.',
  E'Treinou diretamente com Mestre Bimba em Salvador. Trouxe a tradição da Capoeira Regional para Itabuna, ensinando na Academia Cultura Física e Capoeira Major Dória a partir de 1958. Seu ensino ajudou a transmitir a metodologia de Bimba para a próxima geração, principalmente para Mestre Suassuna.',
  1925, 'decade'::genealogy.date_precision, 'Itabuna, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Mestre Maneca Brandão was a pioneering figure in bringing Capoeira Regional to southern Bahia. A white man and son of Ubaldino, a former mayor of Itabuna, Brandão broke from the racial and class expectations of his privileged background to immerse himself in the Afro-Brazilian martial art.

Brandão traveled to Salvador where he trained directly under Mestre Bimba, the founder of Capoeira Regional, at Bimba''s Centro de Cultura Física Regional. There he was classmates with Zoião, another important Bimba disciple who would later help him in Itabuna.

In 1958, Major Carlos Dória founded the "Academia Cultura Física e Capoeira Major Dória" in Itabuna—the city''s first formal capoeira school. Dória recruited Maneca Brandão to serve as the primary instructor. According to the Cordão de Ouro historical records: "Na academia Major Dória que ministrava as aulas era o Maneca Brandão, aluno do Mestre Bimba, e seu companheiro de turma Zoião o ajudava nos treinamentos às vezes" (At the Major Dória academy, Maneca Brandão taught the classes—a student of Mestre Bimba—and his classmate Zoião sometimes helped him with training).

This academy represented a turning point for capoeira in southern Bahia. Before its founding, capoeira in Itabuna existed only in informal street rodas, practiced by marginalized communities. The establishment of a formal academy allowed practitioners from different social classes to participate, including young Reinaldo Ramos Suassuna (later known as Mestre Suassuna).

Brandão also participated in the street rodas alongside other prominent Itabuna capoeiristas including Mestres Sururú and Bigode de Arame. These informal gatherings were where young Suassuna first encountered capoeira around 1957-1958, before eventually training formally at the Major Dória academy.

Beyond his teaching, Brandão documented his experiences in the book "O Canto da Iúna – A Saga de um Capoeira" (The Song of the Iúna – A Capoeirista''s Saga), published in Itabuna. The book includes his explanation of the Iúna—the mythical bird that inspired Mestre Bimba''s famous berimbau rhythm—describing it as the "símbolo da sagacidade e da matreirice" (symbol of sagacity and cunning).

Historian Cláudia Viana, in her 2006 book "Capoeira: de luta de negro a exercício de branco no cenário grapiúna", explicitly honors Brandão''s role: "Bimba, Maneca Brandão, Suassuna, são vários nomes que não podem ser esquecidos" (Bimba, Maneca Brandão, Suassuna—these are names that cannot be forgotten). Her research demonstrates how southern Bahia, not just Salvador and the Recôncavo, was crucial for capoeira''s development in the state.

Maneca Brandão''s legacy lives through his most famous student, Mestre Suassuna, who would go on to co-found Cordão de Ouro and become one of the most influential capoeiristas in history—spreading Bimba''s Regional tradition to five continents.',
  E'Mestre Maneca Brandão foi uma figura pioneira em trazer a Capoeira Regional para o sul da Bahia. Homem branco e filho de Ubaldino, ex-prefeito de Itabuna, Brandão rompeu com as expectativas raciais e de classe de sua origem privilegiada para mergulhar na arte marcial afro-brasileira.

Brandão viajou para Salvador onde treinou diretamente com Mestre Bimba, o fundador da Capoeira Regional, no Centro de Cultura Física Regional de Bimba. Lá foi colega de turma de Zoião, outro importante discípulo de Bimba que mais tarde o ajudaria em Itabuna.

Em 1958, Major Carlos Dória fundou a "Academia Cultura Física e Capoeira Major Dória" em Itabuna—a primeira escola formal de capoeira da cidade. Dória recrutou Maneca Brandão para servir como instrutor principal. Segundo os registros históricos do Cordão de Ouro: "Na academia Major Dória que ministrava as aulas era o Maneca Brandão, aluno do Mestre Bimba, e seu companheiro de turma Zoião o ajudava nos treinamentos às vezes".

Esta academia representou um ponto de virada para a capoeira no sul da Bahia. Antes de sua fundação, a capoeira em Itabuna existia apenas em rodas de rua informais, praticada por comunidades marginalizadas. O estabelecimento de uma academia formal permitiu que praticantes de diferentes classes sociais participassem, incluindo o jovem Reinaldo Ramos Suassuna (mais tarde conhecido como Mestre Suassuna).

Brandão também participava das rodas de rua ao lado de outros capoeiristas proeminentes de Itabuna, incluindo Mestres Sururú e Bigode de Arame. Essas reuniões informais foram onde o jovem Suassuna conheceu a capoeira pela primeira vez por volta de 1957-1958, antes de eventualmente treinar formalmente na academia do Major Dória.

Além de seu ensino, Brandão documentou suas experiências no livro "O Canto da Iúna – A Saga de um Capoeira", publicado em Itabuna. O livro inclui sua explicação sobre a Iúna—a ave mítica que inspirou o famoso ritmo de berimbau de Mestre Bimba—descrevendo-a como o "símbolo da sagacidade e da matreirice".

A historiadora Cláudia Viana, em seu livro de 2006 "Capoeira: de luta de negro a exercício de branco no cenário grapiúna", explicitamente honra o papel de Brandão: "Bimba, Maneca Brandão, Suassuna, são vários nomes que não podem ser esquecidos". Sua pesquisa demonstra como o sul da Bahia, não apenas Salvador e o Recôncavo, foi crucial para o desenvolvimento da capoeira no estado.

O legado de Maneca Brandão vive através de seu aluno mais famoso, Mestre Suassuna, que co-fundaria o Cordão de Ouro e se tornaria um dos capoeiristas mais influentes da história—espalhando a tradição Regional de Bimba para cinco continentes.',
  E'- Trained under Mestre Bimba in Salvador
- Primary instructor at Academia Cultura Física e Capoeira Major Dória (1958)
- Street roda participant alongside Mestres Sururú and Bigode de Arame
- Primary teacher of Mestre Suassuna (~1957-1958)
- Author of "O Canto da Iúna – A Saga de um Capoeira"
- Honored in Cláudia Viana''s academic research on Grapiúna capoeira (2006)
- Pioneer of Capoeira Regional in southern Bahia',
  E'- Treinou com Mestre Bimba em Salvador
- Instrutor principal na Academia Cultura Física e Capoeira Major Dória (1958)
- Participante das rodas de rua ao lado dos Mestres Sururú e Bigode de Arame
- Professor principal de Mestre Suassuna (~1957-1958)
- Autor de "O Canto da Iúna – A Saga de um Capoeira"
- Homenageado na pesquisa acadêmica de Cláudia Viana sobre a capoeira grapiúna (2006)
- Pioneiro da Capoeira Regional no sul da Bahia',
  E'BIRTH YEAR ESTIMATION (1925, decade):
No sources provide exact birth date. Estimated from career timeline:
- Primary instructor at Major Dória''s academy in 1958
- Already trained under Bimba in Salvador and experienced enough to lead academy
- Likely 28-38 years old in 1958 → born ~1920-1930
- Conservative estimate: ~1925 with decade precision

FULL NAME: Unknown - "Maneca" appears to be a nickname
Sources only identify him as "Maneca Brandão" with surname Brandão.

FAMILY BACKGROUND:
- Father: Ubaldino (former mayor of Itabuna)
- Race: White

TEACHER:
- Mestre Bimba (Manuel dos Reis Machado) - trained at Centro de Cultura Física Regional, Salvador

CLASSMATE/ASSISTANT:
- Zoião - classmate at Bimba''s academy; sometimes helped with training at Major Dória academy
  NOTE: Original backlog entry incorrectly stated Maneca was "student of Bimba and Zoião"
  CORRECTED: Zoião was his classmate (companheiro de turma), not teacher

STUDENTS:
- Mestre Suassuna (Reinaldo Ramos Suassuna) - primary teacher, ~1957-1958, Itabuna

DUPLICATE ENTRY RESOLUTION:
The persons-backlog originally had two entries:
1. "Maneca | - | Mestre | Suassuna import | pending | yes | Primary teacher of Suassuna in Itabuna (~1957-1958); student of Mestre Bimba and Zoião"
2. "Maneca Brandão | - | Mestre | Suassuna import | pending | yes | Taught Suassuna in Itabuna street rodas (1950s); DISTINCT from Mestre Maneca (student of Bimba)"
THESE ARE THE SAME PERSON - consolidated into single "Maneca Brandão" entry.

BOOK AUTHORED:
"O Canto da Iúna – A Saga de um Capoeira" (1ª edição, Itabuna/BA)

ACADEMIC DOCUMENTATION:
Cláudia Viana (2006), "Capoeira: de luta de negro a exercício de branco no cenário grapiúna" - history professor and practitioner since 1993; based on 1999 monograph.',
  E'ESTIMATIVA ANO DE NASCIMENTO (1925, década):
Nenhuma fonte fornece data exata de nascimento. Estimado a partir da linha do tempo de carreira:
- Instrutor principal na academia do Major Dória em 1958
- Já havia treinado com Bimba em Salvador e tinha experiência suficiente para liderar academia
- Provavelmente 28-38 anos em 1958 → nascido ~1920-1930
- Estimativa conservadora: ~1925 com precisão de década

NOME COMPLETO: Desconhecido - "Maneca" parece ser um apelido
Fontes apenas o identificam como "Maneca Brandão" com sobrenome Brandão.

ORIGEM FAMILIAR:
- Pai: Ubaldino (ex-prefeito de Itabuna)
- Raça: Branco

MESTRE:
- Mestre Bimba (Manuel dos Reis Machado) - treinou no Centro de Cultura Física Regional, Salvador

COLEGA/ASSISTENTE:
- Zoião - colega de turma na academia de Bimba; às vezes ajudava nos treinamentos na academia do Major Dória
  NOTA: Entrada original do backlog incorretamente afirmava que Maneca era "aluno de Bimba e Zoião"
  CORRIGIDO: Zoião era seu colega de turma (companheiro de turma), não professor

ALUNOS:
- Mestre Suassuna (Reinaldo Ramos Suassuna) - professor principal, ~1957-1958, Itabuna

RESOLUÇÃO DE ENTRADA DUPLICADA:
O persons-backlog originalmente tinha duas entradas:
1. "Maneca | - | Mestre | Suassuna import | pending | yes | Primary teacher of Suassuna in Itabuna (~1957-1958); student of Mestre Bimba and Zoião"
2. "Maneca Brandão | - | Mestre | Suassuna import | pending | yes | Taught Suassuna in Itabuna street rodas (1950s); DISTINCT from Mestre Maneca (student of Bimba)"
SÃO A MESMA PESSOA - consolidados em uma única entrada "Maneca Brandão".

LIVRO AUTORAL:
"O Canto da Iúna – A Saga de um Capoeira" (1ª edição, Itabuna/BA)

DOCUMENTAÇÃO ACADÊMICA:
Cláudia Viana (2006), "Capoeira: de luta de negro a exercício de branco no cenário grapiúna" - professora de história e praticante desde 1993; baseado em monografia de 1999.'
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
