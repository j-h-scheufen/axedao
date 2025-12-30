-- ============================================================
-- GENEALOGY PERSON: Medicina
-- Generated: 2025-12-26
-- ============================================================
-- BIRTH DATE: December 16, 1950 (exact per multiple sources)
-- Sources: Grupo Raça website, Portal Capoeira (40 years celebration 2007)
-- ============================================================
-- LINEAGE CLARIFICATION:
-- The 1982 O Globo article states the Regional mestres listed were
-- "almost all direct disciples of the legendary Bimba" - but this is a
-- generalization about the group, not a claim about each individual.
-- Medicina's actual lineage is:
-- Mestre Bimba → Mestre Maneca → Mestre Suassuna → Mestre Medicina
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Luís Oliveira Rocha', 'Medicina', 'mestre'::genealogy.title, NULL,
  ARRAY[
    'https://portalcapoeira.com/capoeira/eventos-agenda/grupo-capoeira-raca-quarenta-anos-de-ensino-do-mestre-medicina/',
    'https://grupo-capoeira-raca.webnode.fr/sobre-nos/',
    'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna'
  ]::text[],
  'regional'::genealogy.style,
  E'Trained in Capoeira Regional under Mestre Suassuna in Itabuna. Suassuna was a direct student of Mestre Maneca (who trained with Bimba) and was later formally recognized by Mestre Bimba himself (1972). Medicina therefore represents a second-generation Regional lineage from Bimba through Suassuna. His teaching emphasizes the Cordão de Ouro tradition while maintaining distinct group identity through Grupo Raça.',
  E'Treinou Capoeira Regional com Mestre Suassuna em Itabuna. Suassuna foi aluno direto de Mestre Maneca (que treinou com Bimba) e foi posteriormente reconhecido formalmente por Mestre Bimba (1972). Medicina representa, portanto, uma linhagem Regional de segunda geração a partir de Bimba através de Suassuna. Seu ensino enfatiza a tradição do Cordão de Ouro enquanto mantém uma identidade de grupo distinta através do Grupo Raça.',
  1950, 'exact'::genealogy.date_precision, 'Itabuna, Bahia, Brazil',
  NULL, NULL, NULL,
  E'Luís Oliveira Rocha, known as Mestre Medicina, was born on December 16, 1950, in Itabuna, Bahia, to Antônio Viana Rocha and Dinah Oliveira Fernandes. His nickname "Medicina" derives from his profession as a gynecologist and obstetrician—a rarity among capoeira mestres of his generation.

Medicina came from humble origins and began playing capoeira as a child. Around age ten, he practiced gymnastics and athletics at a local judo academy in Itabuna. A friend introduced him to capoeirista Antônio Rodrigues, who brought him into the street capoeira circles of Itabuna around age fifteen. There he encountered the young Reinaldo Ramos Suassuna, known simply as "Nado" at the time.

The early 1960s were formative years for capoeira in Itabuna. Major Carlos Dória had founded the "Academia Cultura Física e Capoeira Major Dória" in 1958, with classes taught by Maneca Brandão—a white man whose father was a former mayor and who had trained under Mestre Bimba. Street capoeiristas like Suassuna and Medicina trained in this environment, absorbing the Regional tradition that connected back to Salvador.

When Suassuna departed for São Paulo in 1965 to seek his fortune with capoeira, he left the ACRI (Academia de Capoeira Regional de Itabuna) under the command of his best student: Luís Medicina. The young mestre—only about fifteen years old—changed the academy''s name to ACRESI (Academia de Capoeira Regional Suassuna de Itabuna) in homage to his teacher.

In 1972, Medicina moved to Salvador to study medicine at the Faculdade de Medicina da Bahia—one of Brazil''s oldest and most prestigious medical schools. There, at the Hospital das Clínicas in the Canela neighborhood, he and a fellow student named Pacheco (nicknamed "Malandragem") started teaching capoeira to other students. What began informally at the Academic Directory soon attracted more practitioners: Sandoval, Anselmo, Manequim, Wilson, Bajola, China, Dedé, Goezinho, Careca, Cafuringa, Alberto Faísca, and others. From this nucleus emerged the idea for a formal organization, and in 1973 they founded the Associação de Capoeira Kilombolas.

The Kilombolas group would prove influential in Salvador''s capoeira history, though Medicina would not remain its leader. When he neared graduation and needed to return to Itabuna for his final year of medical studies, Mestre Dedé assumed command of the association. Medicina later returned to Salvador for his medical residency, but could not successfully reclaim leadership of Kilombolas—Dedé had made it his own.

After completing his residency, Medicina lived for five years on Ilha Mar Grande, where he founded another capoeira initiative: the Grupo Meninos da Ilha (Island Boys Group), which he describes as embodying a joyful capoeira spirit among young practitioners.

Eventually Medicina settled in the Recôncavo Baiano—first in Cachoeira, then in nearby Muritiba, where he established his most enduring legacy: Grupo de Capoeira Raça. The name "Raça" (Race, or Grit) reflects his philosophy: "people who are in the struggle of life with courage".

By 2007, Medicina was celebrating forty years of teaching capoeira. An event at the Grapiúna Tênis Clube in Itabuna baptized approximately 300 children from peripheral neighborhoods including São Pedro, Califórnia, Ferradas, and Urbis 4. The event also included children with Down syndrome and saw the formation of new contra-mestres. Mestre Suassuna himself attended, reconnecting with his most accomplished student.

Today, Mestre Medicina holds the title "Mestrissimo" and leads Grupo Capoeira Raça from its headquarters in Muritiba, Bahia. The group has expanded internationally with branches in Chile, Argentina, France, Spain, and Portugal. His teaching continues the Cordão de Ouro/Regional tradition he learned from Suassuna while carrying forward the distinctive identity he developed through decades of independent work in the Bahian Recôncavo.',
  E'Luís Oliveira Rocha, conhecido como Mestre Medicina, nasceu em 16 de dezembro de 1950, em Itabuna, Bahia, filho de Antônio Viana Rocha e Dinah Oliveira Fernandes. Seu apelido "Medicina" deriva de sua profissão como ginecologista e obstetra—uma raridade entre os mestres de capoeira de sua geração.

Medicina veio de origens humildes e começou a jogar capoeira ainda criança. Por volta dos dez anos, praticava ginástica e atletismo em uma academia de judô local em Itabuna. Um amigo o apresentou ao capoeirista Antônio Rodrigues, que o trouxe para as rodas de capoeira de rua de Itabuna por volta dos quinze anos. Lá ele conheceu o jovem Reinaldo Ramos Suassuna, conhecido simplesmente como "Nado" na época.

O início dos anos 1960 foram anos formativos para a capoeira em Itabuna. Major Carlos Dória havia fundado a "Academia Cultura Física e Capoeira Major Dória" em 1958, com aulas ministradas por Maneca Brandão—um homem branco cujo pai era ex-prefeito e que havia treinado com Mestre Bimba. Capoeiristas de rua como Suassuna e Medicina treinaram neste ambiente, absorvendo a tradição Regional que se conectava a Salvador.

Quando Suassuna partiu para São Paulo em 1965 para tentar a sorte com a capoeira, deixou a ACRI (Academia de Capoeira Regional de Itabuna) sob o comando de seu melhor aluno: Luís Medicina. O jovem mestre—com apenas cerca de quinze anos—mudou o nome da academia para ACRESI (Academia de Capoeira Regional Suassuna de Itabuna) em homenagem ao seu professor.

Em 1972, Medicina mudou-se para Salvador para estudar medicina na Faculdade de Medicina da Bahia—uma das mais antigas e prestigiosas escolas médicas do Brasil. Lá, no Hospital das Clínicas no bairro da Canela, ele e um colega de faculdade chamado Pacheco (apelidado "Malandragem") começaram a ensinar capoeira para outros estudantes. O que começou informalmente no Diretório Acadêmico logo atraiu mais praticantes: Sandoval, Anselmo, Manequim, Wilson, Bajola, China, Dedé, Goezinho, Careca, Cafuringa, Alberto Faísca e outros. Deste núcleo surgiu a ideia de uma organização formal, e em 1973 fundaram a Associação de Capoeira Kilombolas.

O grupo Kilombolas provaria ser influente na história da capoeira de Salvador, embora Medicina não permanecesse como seu líder. Quando ele estava prestes a se formar e precisou retornar a Itabuna para seu último ano de estudos médicos, Mestre Dedé assumiu o comando da associação. Medicina mais tarde retornou a Salvador para sua residência médica, mas não conseguiu reassumir a liderança do Kilombolas—Dedé havia tornado o grupo seu próprio.

Após completar sua residência, Medicina viveu por cinco anos na Ilha Mar Grande, onde fundou outra iniciativa de capoeira: o Grupo Meninos da Ilha, que ele descreve como incorporando um espírito alegre de capoeira entre jovens praticantes.

Eventualmente Medicina se estabeleceu no Recôncavo Baiano—primeiro em Cachoeira, depois na vizinha Muritiba, onde estabeleceu seu legado mais duradouro: Grupo de Capoeira Raça. O nome "Raça" reflete sua filosofia: "pessoas que estão na luta da vida com coragem".

Em 2007, Medicina estava celebrando quarenta anos de ensino de capoeira. Um evento no Grapiúna Tênis Clube em Itabuna batizou aproximadamente 300 crianças de bairros periféricos incluindo São Pedro, Califórnia, Ferradas e Urbis 4. O evento também incluiu crianças com síndrome de Down e viu a formação de novos contra-mestres. O próprio Mestre Suassuna compareceu, reconectando-se com seu aluno mais bem-sucedido.

Hoje, Mestre Medicina detém o título de "Mestrissimo" e lidera o Grupo Capoeira Raça a partir de sua sede em Muritiba, Bahia. O grupo expandiu internacionalmente com filiais no Chile, Argentina, França, Espanha e Portugal. Seu ensino continua a tradição Cordão de Ouro/Regional que aprendeu de Suassuna enquanto leva adiante a identidade distintiva que desenvolveu através de décadas de trabalho independente no Recôncavo Baiano.',
  E'- ~1965: Assumed leadership of ACRI in Itabuna after Suassuna departed for São Paulo
- 1965: Renamed academy to ACRESI (Academia de Capoeira Regional Suassuna de Itabuna)
- 1972: Moved to Salvador for medical studies at Faculdade de Medicina da Bahia
- 1973: Co-founded Associação de Capoeira Kilombolas in Salvador with Pacheco
- Late 1970s: Founded Grupo Meninos da Ilha on Ilha Mar Grande
- ~1980s: Founded Grupo de Capoeira Raça in Cachoeira/Muritiba
- 2007: Celebrated 40 years of teaching at Grapiúna Tênis Clube, Itabuna
- Holds title of "Mestrissimo"
- Expanded Grupo Raça internationally to Chile, Argentina, France, Spain, Portugal
- Trained Mestre Dedé and numerous other practitioners',
  E'- ~1965: Assumiu a liderança da ACRI em Itabuna após a partida de Suassuna para São Paulo
- 1965: Renomeou a academia para ACRESI (Academia de Capoeira Regional Suassuna de Itabuna)
- 1972: Mudou-se para Salvador para estudos médicos na Faculdade de Medicina da Bahia
- 1973: Co-fundou a Associação de Capoeira Kilombolas em Salvador com Pacheco
- Final dos anos 1970: Fundou o Grupo Meninos da Ilha na Ilha Mar Grande
- ~Anos 1980: Fundou o Grupo de Capoeira Raça em Cachoeira/Muritiba
- 2007: Celebrou 40 anos de ensino no Grapiúna Tênis Clube, Itabuna
- Detém o título de "Mestrissimo"
- Expandiu o Grupo Raça internacionalmente para Chile, Argentina, França, Espanha, Portugal
- Formou Mestre Dedé e numerosos outros praticantes',
  E'BIRTH DATE: December 16, 1950 (exact)
Sources: Grupo Capoeira Raça website, CDO Sergipe

PARENTS:
- Father: Antônio Viana Rocha
- Mother: Dinah Oliveira Fernandes

FULL NAME VARIATIONS:
- "Luís Oliveira Rocha" - Grupo Raça website
- "Luis Oliveira Rocha" - without accent
- "Luiz Medicina" - informal
- "Luís Antônio Oliveira Rocha" - one source mentions middle name Antônio

PROFESSION:
Gynecologist and obstetrician (source of nickname "Medicina")

LINEAGE CLARIFICATION:
The 1982 O Globo article (archived at velhosmestres.com/br/cobrinha-1982-3) lists Medicina among Regional mestres, stating they were "almost all direct disciples of the legendary Bimba". This is a generalization about the group, not a specific claim about each individual. Medicina''s actual lineage is:
- Mestre Bimba → Mestre Maneca → Mestre Suassuna → Mestre Medicina
Suassuna was formally recognized by Bimba in 1972, making the Regional lineage legitimate.

TEACHERS:
- Valdebrando (first exposure to capoeira, Itabuna)
- Major Dória''s academy (formal training environment)
- Mestre Suassuna (Reinaldo Ramos Suassuna) - primary teacher, ~1965, Itabuna

STUDENTS:
- Mestre Dedé (founder of Kilombolas, took over from Medicina)
- Mestre Macarrão
- Mestre Dilaho
- Contra-Mestre Ninja
- Contra-Mestre Risadinha
- Contra-Mestre Arrepiado
- Contra-Mestre Vovô
- Contra-Mestre Soninha
- Contra-Mestre Macaco
- Contra-Mestre Folha
- Contra-Mestre Robô
- Contra-Mestre Luisinho

GROUPS FOUNDED:
1. ACRESI (Academia de Capoeira Regional Suassuna de Itabuna) - renamed from ACRI, ~1965
2. Associação de Capoeira Kilombolas - co-founded 1973, Salvador
3. Grupo Meninos da Ilha - Ilha Mar Grande, late 1970s
4. Grupo de Capoeira Raça - Cachoeira/Muritiba, ~1980s (current)

CURRENT RESIDENCE: Muritiba, Bahia, Brazil

1982 O GLOBO ARTICLE CONTEXT:
Listed alongside: Itapuã, Vinte e Nove, Brás Amansa Brabo, Vermelho 27, Banduê, Capazans, Ezequiel, Hélio Xaréu. The article documents the state of capoeira in Salvador in February 1982.',
  E'DATA DE NASCIMENTO: 16 de dezembro de 1950 (exata)
Fontes: Site do Grupo Capoeira Raça, CDO Sergipe

PAIS:
- Pai: Antônio Viana Rocha
- Mãe: Dinah Oliveira Fernandes

VARIAÇÕES DO NOME COMPLETO:
- "Luís Oliveira Rocha" - site do Grupo Raça
- "Luis Oliveira Rocha" - sem acento
- "Luiz Medicina" - informal
- "Luís Antônio Oliveira Rocha" - uma fonte menciona nome do meio Antônio

PROFISSÃO:
Ginecologista e obstetra (origem do apelido "Medicina")

ESCLARECIMENTO DE LINHAGEM:
O artigo do O Globo de 1982 (arquivado em velhosmestres.com/br/cobrinha-1982-3) lista Medicina entre os mestres de Regional, afirmando que eram "quase todos discípulos diretos do lendário Bimba". Esta é uma generalização sobre o grupo, não uma afirmação específica sobre cada indivíduo. A linhagem real de Medicina é:
- Mestre Bimba → Mestre Maneca → Mestre Suassuna → Mestre Medicina
Suassuna foi formalmente reconhecido por Bimba em 1972, tornando a linhagem Regional legítima.

MESTRES:
- Valdebrando (primeira exposição à capoeira, Itabuna)
- Academia do Major Dória (ambiente de treinamento formal)
- Mestre Suassuna (Reinaldo Ramos Suassuna) - professor principal, ~1965, Itabuna

ALUNOS:
- Mestre Dedé (fundador do Kilombolas, assumiu de Medicina)
- Mestre Macarrão
- Mestre Dilaho
- Contra-Mestre Ninja
- Contra-Mestre Risadinha
- Contra-Mestre Arrepiado
- Contra-Mestre Vovô
- Contra-Mestre Soninha
- Contra-Mestre Macaco
- Contra-Mestre Folha
- Contra-Mestre Robô
- Contra-Mestre Luisinho

GRUPOS FUNDADOS:
1. ACRESI (Academia de Capoeira Regional Suassuna de Itabuna) - renomeada de ACRI, ~1965
2. Associação de Capoeira Kilombolas - co-fundada 1973, Salvador
3. Grupo Meninos da Ilha - Ilha Mar Grande, final dos anos 1970
4. Grupo de Capoeira Raça - Cachoeira/Muritiba, ~anos 1980 (atual)

RESIDÊNCIA ATUAL: Muritiba, Bahia, Brasil

CONTEXTO DO ARTIGO O GLOBO 1982:
Listado junto com: Itapuã, Vinte e Nove, Brás Amansa Brabo, Vermelho 27, Banduê, Capazans, Ezequiel, Hélio Xaréu. O artigo documenta o estado da capoeira em Salvador em fevereiro de 1982.'
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
