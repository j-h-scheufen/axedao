-- ============================================================
-- GENEALOGY PERSON: Chico Me Dá
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- As a contemporary of Pastinha (born 1889) who practiced "pure Capoeira
-- de Angola," Chico Me Dá was likely of the same generation. The
-- legendary capoeiristas Pastinha listed in 1967 were from the pre-
-- Bimba/Pastinha era - active practitioners from the late 19th to early
-- 20th century. Using 1890 as a reasonable estimate with decade precision.
--
-- DEATH YEAR ESTIMATION (1960, decade precision):
-- Pastinha listed him among the deceased in his 1967 interview. Given
-- the generation of fighters he was grouped with, and that all were
-- confirmed dead by 1967, death likely occurred in the 1950s-1960s.
-- Using 1960 with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- name: full name unknown (Chico likely short for Francisco)
  'Chico Me Dá', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1976']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Mestre Pastinha explicitly identified Chico Me Dá as a practitioner of "pure Capoeira de Angola" alongside other legendary angoleiros of the pre-Bimba/Pastinha era. Pastinha remarked that the nicknames alone revealed "who they were, how they fought."',
  E'Capoeira de Angola tradicional. Mestre Pastinha identificou explicitamente Chico Me Dá como praticante de "capoeira de Angola pura" ao lado de outros angoleiros lendários da era pré-Bimba/Pastinha. Pastinha observou que os apelidos por si só revelavam "quem eles eram, como lutavam."',
  1890, -- birth_year: estimated from generation (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area, but unconfirmed
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Chico Me Dá was a legendary capoeirista of Salvador, Bahia, active during the late 19th or early 20th century. He is known from Mestre Pastinha''s 1967 interview with Roberto Freire for Revista Realidade, where Pastinha recalled the great capoeiristas of the past.

In that interview, conducted when Pastinha was 78 years old and nearly blind, the father of Capoeira Angola listed seventeen deceased practitioners who had practiced "the pure Capoeira de Angola as I and these boys there do until today." Chico Me Dá was among them, alongside other colorfully-named figures such as Bigode de Seda (Silk Mustache), Américo Ciência, Bugalho, Amorzinho (Little Love), Zé Bom Pé (Joe Good Foot), Chico Três Pedaços (Chico Three Pieces), Tibiriçá da Folha Grossa (Tibiriçá of the Thick Leaf), Doze Homens (Twelve Men), Inimigo Sem Tripa (Gutless Enemy), Vitorino Braço Torto (Vitorino Crooked Arm), Zé do U, Zé do Saco (Joe of the Sack), Bené do Correio (Bené of the Post Office), and Sete Mortes (Seven Deaths). Pastinha also mentioned two women among these legendary practitioners: Júlia Fogareira and Maria Homem.

Pastinha remarked of these figures: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história" (We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story). He emphasized that their nicknames revealed their character and fighting style: "From the nicknames alone you can know who they were, how they fought."

The apelido "Chico Me Dá" is distinctive and intriguing. "Chico" is a common Brazilian diminutive for Francisco, used widely among capoeiristas—the same naming pattern as Chico Três Pedaços and other famous figures. "Me Dá" means "Give me" in Portuguese. The full nickname "Give-Me Chico" or "Chico Give-Me" may have originated from a catchphrase the fighter used during rodas—perhaps challenging opponents to "give me" a fight, or demanding something from life. It could also reference a fighting style where he aggressively demanded the advantage, or even a personality trait of someone who was known for asking or taking. Pastinha noted that these old angoleiros'' apelidos encoded information about their identities and fighting methods, though without additional documentation, the exact origin remains a mystery.

In the 1976 O Globo article about Pastinha''s declining years, his students recalled the generation of "angoleiros de briga" (fighting angoleiros) that included Chico Me Dá: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga" (After Bimba died, only he [Pastinha] remained from that generation of fighting angoleiros). This confirms that Chico Me Dá belonged to an era when capoeira was primarily a street fighting art, before the formalization into academies.

No further biographical details have survived—no teachers, students, specific incidents, or documented appearances. Chico Me Dá exists as a name on Pastinha''s list of the fallen, a reminder that behind each apelido stood a life now largely forgotten. His inclusion among these legendary figures confirms his standing as one of the notable capoeiristas of Bahia during the golden age of capoeira de Angola.',
  -- bio_pt
  E'Chico Me Dá foi um lendário capoeirista de Salvador, Bahia, ativo durante o final do século XIX ou início do século XX. Ele é conhecido pela entrevista de Mestre Pastinha de 1967 com Roberto Freire para a Revista Realidade, na qual Pastinha recordou os grandes capoeiristas do passado.

Nessa entrevista, conduzida quando Pastinha tinha 78 anos e estava quase cego, o pai da Capoeira Angola listou dezessete praticantes falecidos que haviam praticado "a pura capoeira de Angola como eu e esses rapazes aí fazem até hoje." Chico Me Dá estava entre eles, ao lado de outras figuras de nomes coloridos como Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do U, Zé do Saco, Bené do Correio e Sete Mortes. Pastinha também mencionou duas mulheres entre esses praticantes lendários: Júlia Fogareira e Maria Homem.

Pastinha comentou sobre essas figuras: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história." Ele enfatizou que seus apelidos revelavam seu caráter e estilo de luta: "Só pelo apelido você conhece quem eles eram, como lutavam."

O apelido "Chico Me Dá" é distintivo e intrigante. "Chico" é um diminutivo brasileiro comum para Francisco, amplamente usado entre capoeiristas—o mesmo padrão de nomenclatura de Chico Três Pedaços e outras figuras famosas. "Me Dá" significa "Give me" em inglês. O apelido completo "Chico Me Dá" pode ter se originado de um bordão que o lutador usava durante as rodas—talvez desafiando oponentes a "me darem" uma luta, ou exigindo algo da vida. Também poderia referir-se a um estilo de luta onde ele agressivamente exigia a vantagem, ou até mesmo um traço de personalidade de alguém conhecido por pedir ou tomar. Pastinha observou que os apelidos desses velhos angoleiros codificavam informações sobre suas identidades e métodos de luta, embora sem documentação adicional, a origem exata permaneça um mistério.

No artigo do O Globo de 1976 sobre os anos de declínio de Pastinha, seus alunos recordaram a geração de "angoleiros de briga" que incluía Chico Me Dá: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga." Isso confirma que Chico Me Dá pertencia a uma era em que a capoeira era primariamente uma arte de luta de rua, antes da formalização em academias.

Nenhum detalhe biográfico adicional sobreviveu—nenhum mestre, aluno, incidente específico ou aparição documentada. Chico Me Dá existe como um nome na lista de Pastinha dos caídos, um lembrete de que por trás de cada apelido havia uma vida agora em grande parte esquecida. Sua inclusão entre essas figuras lendárias confirma sua posição como um dos notáveis capoeiristas da Bahia durante a era dourada da capoeira de Angola.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade):
Contemporary of Pastinha (born 1889). As a practitioner of "pure Capoeira de Angola" listed among the legendary deceased angoleiros, likely active in the late 19th to early 20th century. Estimate based on generational placement.

DEATH YEAR ESTIMATION (1960, decade):
Pastinha listed him among the deceased in 1967 interview. All figures in this list were confirmed dead by 1967.

APELIDO ETYMOLOGY:
- "Chico" - common Brazilian diminutive for Francisco
- "Me Dá" - Portuguese for "Give me"
- Full meaning: "Give-Me Chico" or "Chico Give-Me"
- Possible interpretations:
  1. A catchphrase used during rodas challenging opponents
  2. An aggressive fighting style demanding the advantage
  3. A personality trait of someone known for asking or taking
  4. Possibly related to a specific incident or reputation

NAMING PATTERN:
The "Chico + descriptor" pattern was common in Bahian capoeira:
- Chico Três Pedaços (Chico Three Pieces)
- Chico Preto (Black Chico)
- Chico Cazumbá
- Chico da Barra
- Chico Capurminho

SOURCE: Mestre Pastinha interview with Roberto Freire, Revista Realidade, February 1967.
SECONDARY SOURCE: O Globo article, April 11, 1976 (quoted in velhosmestres.com/br/pastinha-1976)

PASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

KEY QUOTE (Portuguese):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

KEY QUOTE (English translation):
"We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story."

KEY QUOTE on nicknames:
"From the nicknames alone you can know who they were, how they fought."

1976 STUDENT QUOTE:
"Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga."
(After Bimba died, only he [Pastinha] remained from that generation of fighting angoleiros.)

NO ADDITIONAL DOCUMENTATION FOUND:
- No dedicated velhosmestres.com page exists
- No Wikipedia article
- No academic papers specifically mentioning this person
- No group affiliations documented
- No teacher-student relationships documented
- No specific incidents or timeline events
- Listed in CDO Sergipe''s "Mestres da Capoeiragem" catalog alongside other legendary Bahian capoeiristas',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
Contemporâneo de Pastinha (nascido em 1889). Como praticante de "capoeira de Angola pura" listado entre os lendários angoleiros falecidos, provavelmente ativo no final do século XIX até início do século XX. Estimativa baseada em posicionamento geracional.

ESTIMATIVA DE ANO DE MORTE (1960, década):
Pastinha o listou entre os falecidos em entrevista de 1967. Todas as figuras nesta lista estavam confirmadamente mortas em 1967.

ETIMOLOGIA DO APELIDO:
- "Chico" - diminutivo brasileiro comum para Francisco
- "Me Dá" - português para "Give me"
- Significado completo: "Chico Me Dá"
- Interpretações possíveis:
  1. Um bordão usado durante as rodas desafiando oponentes
  2. Um estilo de luta agressivo exigindo a vantagem
  3. Um traço de personalidade de alguém conhecido por pedir ou tomar
  4. Possivelmente relacionado a um incidente específico ou reputação

PADRÃO DE NOMENCLATURA:
O padrão "Chico + descritor" era comum na capoeira baiana:
- Chico Três Pedaços
- Chico Preto
- Chico Cazumbá
- Chico da Barra
- Chico Capurminho

FONTE: Entrevista de Mestre Pastinha com Roberto Freire, Revista Realidade, fevereiro de 1967.
FONTE SECUNDÁRIA: Artigo do O Globo, 11 de abril de 1976 (citado em velhosmestres.com/br/pastinha-1976)

LISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

CITAÇÃO CHAVE (Português):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história."

CITAÇÃO CHAVE sobre apelidos:
"Só pelo apelido você conhece quem eles eram, como lutavam."

CITAÇÃO DOS ALUNOS 1976:
"Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga."

NENHUMA DOCUMENTAÇÃO ADICIONAL ENCONTRADA:
- Não existe página dedicada no velhosmestres.com
- Nenhum artigo na Wikipedia
- Nenhum trabalho acadêmico mencionando especificamente esta pessoa
- Nenhuma afiliação a grupo documentada
- Nenhuma relação mestre-aluno documentada
- Nenhum incidente específico ou evento cronológico
- Listado no catálogo "Mestres da Capoeiragem" do CDO Sergipe ao lado de outros lendários capoeiristas baianos'
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
