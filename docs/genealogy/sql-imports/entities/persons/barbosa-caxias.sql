-- ============================================================
-- GENEALOGY PERSON: Barbosa (Duque de Caxias)
-- Generated: 2025-12-30
-- ============================================================
-- This is DISTINCT from Barbosa do Cabeça (Salvador, ~1900) who
-- has apelido_context 'Cachoeira/Largo Dois de Julho'.
--
-- José Barbosa da Silva was a pioneer who "organized, uniformized
-- and produced" capoeira in Duque de Caxias, running the Academia
-- Líder and founding Grupo de Capoeira Zum Zum Zum in 1970.
-- ============================================================
--
-- BIRTH DATE: November 1, 1945
-- BIRTH PLACE: Recife, Pernambuco, Brazil (confirmed by Museu da Pessoa)
--
-- TEACHERS:
-- - Mestre Artur Emídio (1930-2011)
-- - Mestre Valdir Sales (1942-2019)
--
-- LINEAGE (via Artur Emídio):
-- Neném → Paizinho → Artur Emídio → Barbosa
--
-- GROUP FOUNDED:
-- - Associação de Capoeira Zum Zum Zum (1970)
-- - Note: Founded at end of AI-5 period when associations weren't
--   officially allowed
--
-- ACADEMY:
-- - Academia Líder, Centro, Duque de Caxias (still operating today)
--
-- KEY STUDENTS:
-- - Mestre Russo (Jonas Rabelo) - 1972-1975/76
-- - Mestre Peixe (Itamar da Silva Barbosa) - ~1972
-- - Mestre Velho (Ulisses Ribeiro de Sousa)
-- - Marcão PQD (Marcos Antônio dos Santos)
-- - Luizão (Luislan de Oliveira)
--
-- HISTORICAL SIGNIFICANCE:
-- As he stated in 2003: "Quem trouxe eu não posso te responder,
-- mas quem organizou, uniformizou e produziu até hoje fui eu"
-- ("I can't tell you who brought it, but who organized, uniformized
-- and produced it until today was me")
--
-- DISAMBIGUATION:
-- Uses apelido_context 'Duque de Caxias' to distinguish from
-- Barbosa do Cabeça (Salvador/Cachoeira historical figure).
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'José Barbosa da Silva',
  'Barbosa',
  'Duque de Caxias',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://museudapessoa.org/historia-de-vida/capoeira-carioca-1/',
    'https://portalcapoeira.com/capoeira/curiosidades/mestre-russo-de-caxias-o-zelador/'
  ]::text[],
  'regional'::genealogy.style,
  E'Trained under Mestres Artur Emídio and Valdir Sales, placing him in a lineage connected to Mestre Paizinho and the Bahian tradition of Itabuna. His approach emphasized structure, organization, and formal academy training—contrasting with the street capoeira that would emerge from the Roda Livre de Caxias founded by his students. Recognized for "organizing, uniformizing, and producing" capoeira in Duque de Caxias.',
  E'Formou-se com os Mestres Artur Emídio e Valdir Sales, colocando-o em uma linhagem conectada a Mestre Paizinho e à tradição baiana de Itabuna. Sua abordagem enfatizava estrutura, organização e treinamento formal em academia—contrastando com a capoeira de rua que surgiria da Roda Livre de Caxias fundada por seus alunos. Reconhecido por "organizar, uniformizar e produzir" capoeira em Duque de Caxias.',
  1945,
  'exact'::genealogy.date_precision,
  'Recife, Pernambuco, Brazil',
  NULL,
  NULL,
  NULL,
  E'José Barbosa da Silva, known as Mestre Barbosa, was born on November 1, 1945, in Recife, Pernambuco—his mother was from Paraíba and his father from São Lourenço da Mata. He learned capoeira from Mestres Artur Emídio and Valdir Sales, both important figures in the development of capoeira in Rio de Janeiro and the Baixada Fluminense. This placed Barbosa in a distinguished lineage descending from Mestre Paizinho of Itabuna through Artur Emídio.

In 1970, Barbosa founded the Associação de Capoeira Zum Zum Zum in Duque de Caxias. This was during the end of the AI-5 period of the military dictatorship, when founding associations was not officially permitted—yet Barbosa persisted in establishing formal capoeira instruction in the city. He taught at Academia Líder in the center of Duque de Caxias, an establishment that remains in operation to this day.

As he stated in a December 2003 interview: "Quem trouxe eu não posso te responder, mas quem organizou, uniformizou e produziu até hoje fui eu" ("I can''t tell you who brought it, but who organized, uniformized and produced it until today was me"). This claim positions Barbosa not as the person who introduced capoeira to Caxias, but as the one who formalized and institutionalized its practice there.

Alongside Mestre Josias da Silva (who operated the Associação de Capoeira Josias da Silva), Barbosa was one of the two pioneer mestres who ran the first formal capoeira academies in Duque de Caxias. These two academies—though separate and possibly competitive—together formed the foundation from which the Caxias capoeira tradition emerged.

At Academia Líder, Barbosa trained several capoeiristas who would gain prestige in the famous Roda de Caxias, including Marcos Antônio dos Santos (Marcão PQD), Ulisses Ribeiro de Sousa (later Mestre Velho), Itamar da Silva Barbosa (later Mestre Peixe), Luislan de Oliveira (Luizão), and Jonas Rabelo (later Mestre Russo). Mestre Russo, who would become the legendary "zelador" (caretaker) of the Roda Livre de Caxias, began training with Barbosa in 1972 and continued until 1975-76.

On June 13, 1973, the young capoeiristas who trained at the academies of Barbosa and Josias took a dramatic step: during the Festa da Igreja de Santo Antônio, they organized a street roda in the church courtyard. This was considered "sacrilege" by the pioneer mestres who valued the structured academy environment, and it was risky during the military dictatorship when street gatherings could attract police attention. But from this inaugural roda emerged the Roda Livre de Caxias—the oldest street roda still in continuous operation in Greater Rio de Janeiro.

Thus Barbosa''s legacy is dual: he was the organizer who brought formal structure to capoeira in Caxias, training the generation that would then break from the academy model to create one of Brazil''s most important street capoeira traditions. His students—Russo, Peixe, Velho—became the custodians of that tradition.

Barbosa supervised the Projeto Griô in Duque de Caxias, overseeing three professors. He also taught at FeoDuque and maintained associations with Liga de Ouro and other capoeira organizations. After approximately 40 years of teaching, he remains recognized as one of Brazil''s most respected capoeira masters, known for preserving the ritual, mystical, and historical dimensions of the art form.

In 2000-2007, Barbosa founded the Grupo de Capoeira Regional, continuing his work to formalize and structure capoeira practice.',
  E'José Barbosa da Silva, conhecido como Mestre Barbosa, nasceu em 1º de novembro de 1945 em Recife, Pernambuco—sua mãe era da Paraíba e seu pai de São Lourenço da Mata. Aprendeu capoeira com os Mestres Artur Emídio e Valdir Sales, ambos figuras importantes no desenvolvimento da capoeira no Rio de Janeiro e na Baixada Fluminense. Isso colocou Barbosa em uma linhagem distinta descendente de Mestre Paizinho de Itabuna através de Artur Emídio.

Em 1970, Barbosa fundou a Associação de Capoeira Zum Zum Zum em Duque de Caxias. Isso foi durante o final do período AI-5 da ditadura militar, quando fundar associações não era oficialmente permitido—mas Barbosa persistiu em estabelecer instrução formal de capoeira na cidade. Ele ensinava na Academia Líder no centro de Duque de Caxias, um estabelecimento que permanece em operação até hoje.

Como afirmou em entrevista de dezembro de 2003: "Quem trouxe eu não posso te responder, mas quem organizou, uniformizou e produziu até hoje fui eu". Essa afirmação posiciona Barbosa não como a pessoa que introduziu a capoeira em Caxias, mas como quem formalizou e institucionalizou sua prática lá.

Ao lado de Mestre Josias da Silva (que operava a Associação de Capoeira Josias da Silva), Barbosa foi um dos dois mestres pioneiros que administraram as primeiras academias formais de capoeira em Duque de Caxias. Essas duas academias—embora separadas e possivelmente concorrentes—juntas formaram a base de onde surgiu a tradição de capoeira de Caxias.

Na Academia Líder, Barbosa treinou vários capoeiristas que ganhariam prestígio na famosa Roda de Caxias, incluindo Marcos Antônio dos Santos (Marcão PQD), Ulisses Ribeiro de Sousa (depois Mestre Velho), Itamar da Silva Barbosa (depois Mestre Peixe), Luislan de Oliveira (Luizão) e Jonas Rabelo (depois Mestre Russo). Mestre Russo, que se tornaria o lendário "zelador" da Roda Livre de Caxias, começou a treinar com Barbosa em 1972 e continuou até 1975-76.

Em 13 de junho de 1973, os jovens capoeiristas que treinavam nas academias de Barbosa e Josias deram um passo dramático: durante a Festa da Igreja de Santo Antônio, organizaram uma roda de rua no pátio da igreja. Isso foi considerado "sacrilégio" pelos mestres pioneiros que valorizavam o ambiente estruturado da academia, e era arriscado durante a ditadura militar quando reuniões de rua podiam atrair atenção policial. Mas dessa roda inaugural surgiu a Roda Livre de Caxias—a roda de rua mais antiga ainda em operação contínua na Grande Rio de Janeiro.

Assim, o legado de Barbosa é duplo: ele foi o organizador que trouxe estrutura formal para a capoeira em Caxias, formando a geração que depois romperia com o modelo de academia para criar uma das mais importantes tradições de capoeira de rua do Brasil. Seus alunos—Russo, Peixe, Velho—tornaram-se os guardiões dessa tradição.

Barbosa supervisionou o Projeto Griô em Duque de Caxias, coordenando três professores. Também ensinou na FeoDuque e manteve associações com a Liga de Ouro e outras organizações de capoeira. Após aproximadamente 40 anos de ensino, permanece reconhecido como um dos mestres de capoeira mais respeitados do Brasil, conhecido por preservar as dimensões rituais, místicas e históricas da arte.

Em 2000-2007, Barbosa fundou o Grupo de Capoeira Regional, continuando seu trabalho de formalizar e estruturar a prática da capoeira.',
  E'- Founded Associação de Capoeira Zum Zum Zum (1970)
- Pioneer of formal capoeira academies in Duque de Caxias alongside Mestre Josias
- Taught at Academia Líder (Centro, Duque de Caxias) - still operating today
- Trained founders of Roda Livre de Caxias: Mestres Russo, Peixe, Velho
- Approximately 40 years as capoeira instructor
- Supervised Projeto Griô in Duque de Caxias (3 professors)
- Founded Grupo de Capoeira Regional (c. 2000-2007)
- Credited with "organizing, uniformizing, and producing" capoeira in Caxias',
  E'- Fundou Associação de Capoeira Zum Zum Zum (1970)
- Pioneiro das academias formais de capoeira em Duque de Caxias ao lado de Mestre Josias
- Ensinou na Academia Líder (Centro, Duque de Caxias) - ainda em operação hoje
- Formou fundadores da Roda Livre de Caxias: Mestres Russo, Peixe, Velho
- Aproximadamente 40 anos como instrutor de capoeira
- Supervisionou o Projeto Griô em Duque de Caxias (3 professores)
- Fundou o Grupo de Capoeira Regional (c. 2000-2007)
- Creditado por "organizar, uniformizar e produzir" capoeira em Caxias',
  E'BIRTH DATE (November 1, 1945, exact):
Confirmed by Museu da Pessoa interview. Born in Recife, Pernambuco. Mother from Paraíba, father from São Lourenço da Mata.

TEACHERS:
- Mestre Artur Emídio (1930-2011) - One of the four main lineages of Rio capoeira
- Mestre Valdir Sales (1942-2019) - Student of Paulo Gomes; association in São João de Meriti

STUDENTS:
- Mestre Russo (Jonas Rabelo) - 1972-1975/76
- Mestre Peixe (Itamar da Silva Barbosa, 1959-2025) - ~1972
- Mestre Velho (Ulisses Ribeiro de Sousa)
- Marcão PQD (Marcos Antônio dos Santos)
- Luizão (Luislan de Oliveira)

LINEAGE (via Artur Emídio):
Neném (African) → Paizinho (Teodoro Ramos) → Artur Emídio → Barbosa

GROUPS FOUNDED:
- Associação de Capoeira Zum Zum Zum (1970)
- Grupo de Capoeira Regional (c. 2000-2007)

ACADEMY LOCATION:
Academia Líder, Centro, Duque de Caxias, RJ
Address (current): Rua José Alvarenga, 290, Centro

KEY QUOTE (December 28, 2003 interview):
"Quem trouxe eu não posso te responder, mas quem organizou, uniformizou e produziu até hoje fui eu"

DISAMBIGUATION:
This is DISTINCT from Barbosa do Cabeça (Salvador/Cachoeira, ~1900):
- Barbosa (this person): Born 1945 Recife, Duque de Caxias pioneer, Academia Líder
- Barbosa do Cabeça: Born ~1900 Cachoeira, Salvador porter, taught João Pequeno
Using apelido_context "Duque de Caxias" to differentiate.

SOURCES:
- museudapessoa.org/historia-de-vida/capoeira-carioca-1/ (primary biographical)
- portalcapoeira.com/capoeira/curiosidades/mestre-russo-de-caxias-o-zelador/
- oficinamestrerusso2014.wordpress.com/mestre-russo/
- rpcd.fade.up.pt/_arquivo/artigos_soltos/vol.7_nr.1/1.13.pdf (ethnographic study)',
  E'DATA DE NASCIMENTO (1º de novembro de 1945, exata):
Confirmado pela entrevista do Museu da Pessoa. Nascido em Recife, Pernambuco. Mãe da Paraíba, pai de São Lourenço da Mata.

MESTRES:
- Mestre Artur Emídio (1930-2011) - Uma das quatro principais linhagens da capoeira carioca
- Mestre Valdir Sales (1942-2019) - Aluno de Paulo Gomes; associação em São João de Meriti

ALUNOS:
- Mestre Russo (Jonas Rabelo) - 1972-1975/76
- Mestre Peixe (Itamar da Silva Barbosa, 1959-2025) - ~1972
- Mestre Velho (Ulisses Ribeiro de Sousa)
- Marcão PQD (Marcos Antônio dos Santos)
- Luizão (Luislan de Oliveira)

LINHAGEM (via Artur Emídio):
Neném (Africano) → Paizinho (Teodoro Ramos) → Artur Emídio → Barbosa

GRUPOS FUNDADOS:
- Associação de Capoeira Zum Zum Zum (1970)
- Grupo de Capoeira Regional (c. 2000-2007)

LOCAL DA ACADEMIA:
Academia Líder, Centro, Duque de Caxias, RJ
Endereço (atual): Rua José Alvarenga, 290, Centro

CITAÇÃO-CHAVE (entrevista de 28 de dezembro de 2003):
"Quem trouxe eu não posso te responder, mas quem organizou, uniformizou e produziu até hoje fui eu"

DESAMBIGUAÇÃO:
Este é DISTINTO de Barbosa do Cabeça (Salvador/Cachoeira, ~1900):
- Barbosa (esta pessoa): Nascido 1945 Recife, pioneiro de Duque de Caxias, Academia Líder
- Barbosa do Cabeça: Nascido ~1900 Cachoeira, carregador de Salvador, ensinou João Pequeno
Usando apelido_context "Duque de Caxias" para diferenciar.

FONTES:
- museudapessoa.org/historia-de-vida/capoeira-carioca-1/ (biográfico principal)
- portalcapoeira.com/capoeira/curiosidades/mestre-russo-de-caxias-o-zelador/
- oficinamestrerusso2014.wordpress.com/mestre-russo/
- rpcd.fade.up.pt/_arquivo/artigos_soltos/vol.7_nr.1/1.13.pdf (estudo etnográfico)'
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
