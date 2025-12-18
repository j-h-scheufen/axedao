-- ============================================================
-- GENEALOGY PERSON: Inimigo Sem Tripa
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- As a contemporary of Pastinha (born 1889) who practiced "pure Capoeira
-- de Angola," Inimigo Sem Tripa was likely of the same generation. The
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
  NULL, -- name: full name unknown
  'Inimigo Sem Tripa', -- apelido
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1976']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Mestre Pastinha explicitly identified Inimigo Sem Tripa as a practitioner of "pure Capoeira de Angola" alongside other legendary angoleiros of the pre-Bimba/Pastinha era. Pastinha remarked that the nicknames alone revealed "who they were, how they fought."',
  E'Capoeira de Angola tradicional. Mestre Pastinha identificou explicitamente Inimigo Sem Tripa como praticante de "capoeira de Angola pura" ao lado de outros angoleiros lendários da era pré-Bimba/Pastinha. Pastinha observou que os apelidos por si só revelavam "quem eles eram, como lutavam."',
  1890, -- birth_year: estimated from generation (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area, but unconfirmed
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Inimigo Sem Tripa was a legendary capoeirista of Salvador, Bahia, active during the late 19th or early 20th century. He is known from Mestre Pastinha''s 1967 interview with Roberto Freire for Revista Realidade, where Pastinha recalled the great capoeiristas of the past.

In that interview, conducted when Pastinha was 78 years old and nearly blind, the father of Capoeira Angola listed fifteen deceased practitioners who had practiced "the pure Capoeira de Angola as I and these boys there do until today." Inimigo Sem Tripa was among them, alongside other colorfully-named figures such as Bigode de Seda (Silk Mustache), Américo Ciência, Bugalho, Amorzinho (Little Love), Zé Bom Pé (Joe Good Foot), Chico Três Pedaços (Chico Three Pieces), Tibiriçá da Folha Grossa (Tibiriçá of the Thick Leaf), Doze Homens (Twelve Men), Vitorino Braço Torto (Vitorino Crooked Arm), Zé do U, Zé do Saco (Joe of the Sack), Bené do Correio (Bené of the Post Office), Sete Mortes (Seven Deaths), and Chico Me Dá (Give-Me Chico). Pastinha also mentioned two women among these legendary practitioners: Júlia Fogareira and Maria Homem.

Pastinha remarked of these figures: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história" (We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story). He emphasized that their nicknames revealed their character and fighting style: "From the nicknames alone you can know who they were, how they fought."

The apelido "Inimigo Sem Tripa" translates literally as "Enemy Without Guts" or "Gutless Enemy." In Portuguese, "tripa" (guts/intestines) carries connotations of courage or nerve, similar to the English expression "having guts." The nickname may have been ironic—perhaps given to a fighter so fierce he left his enemies gutless, or conversely, someone whose name belied his actual ferocity. The 1976 O Globo article quoting Pastinha''s students used the plural form "Inimigos Sem Tripa" (Gutless Enemies), suggesting either a name variation or perhaps that multiple fighters shared this designation.

In that 1976 article, Pastinha''s students stated: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga" (After Bimba died, only he remained from that generation of fighting angoleiros). This confirms that Inimigo Sem Tripa belonged to the generation of "angoleiros de briga"—fighters renowned for their combative prowess in the pre-academy era.

No further biographical details have survived—no teachers, students, specific incidents, or documented appearances. Inimigo Sem Tripa exists as a name on Pastinha''s list of the fallen, a reminder that behind each apelido stood a life now largely forgotten.',
  -- bio_pt
  E'Inimigo Sem Tripa foi um lendário capoeirista de Salvador, Bahia, ativo durante o final do século XIX ou início do século XX. Ele é conhecido pela entrevista de Mestre Pastinha de 1967 com Roberto Freire para a Revista Realidade, na qual Pastinha recordou os grandes capoeiristas do passado.

Nessa entrevista, conduzida quando Pastinha tinha 78 anos e estava quase cego, o pai da Capoeira Angola listou quinze praticantes falecidos que haviam praticado "a pura capoeira de Angola como eu e esses rapazes aí fazem até hoje." Inimigo Sem Tripa estava entre eles, ao lado de outras figuras de nomes coloridos como Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Vitorino Braço Torto, Zé do U, Zé do Saco, Bené do Correio, Sete Mortes e Chico Me Dá. Pastinha também mencionou duas mulheres entre esses praticantes lendários: Júlia Fogareira e Maria Homem.

Pastinha comentou sobre essas figuras: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história." Ele enfatizou que seus apelidos revelavam seu caráter e estilo de luta: "Só pelo apelido você conhece quem eles eram, como lutavam."

O apelido "Inimigo Sem Tripa" traduz-se literalmente como "Inimigo Sem Tripas" ou "Inimigo Covarde." Em português, "tripa" (tripas/intestinos) carrega conotações de coragem ou ousadia, semelhante à expressão inglesa "ter tripa." O apelido pode ter sido irônico—talvez dado a um lutador tão feroz que deixava seus inimigos sem tripas, ou inversamente, alguém cujo nome desmentia sua verdadeira ferocidade. O artigo do O Globo de 1976, citando os alunos de Pastinha, usou a forma plural "Inimigos Sem Tripa," sugerindo uma variação de nome ou talvez que múltiplos lutadores compartilhavam essa designação.

Naquele artigo de 1976, os alunos de Pastinha declararam: "Depois que Bimba morreu, só restou ele daquela geração de ''angoleiros'' de briga." Isso confirma que Inimigo Sem Tripa pertencia à geração de "angoleiros de briga"—lutadores renomados por sua destreza combativa na era pré-academia.

Nenhum detalhe biográfico adicional sobreviveu—nenhum mestre, aluno, incidente específico ou aparição documentada. Inimigo Sem Tripa existe como um nome na lista de Pastinha dos caídos, um lembrete de que por trás de cada apelido havia uma vida agora em grande parte esquecida.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade):
Contemporary of Pastinha (born 1889). As a practitioner of "pure Capoeira de Angola" listed among the legendary deceased angoleiros, likely active in the late 19th to early 20th century. Estimate based on generational placement.

DEATH YEAR ESTIMATION (1960, decade):
Pastinha listed him among the deceased in 1967 interview. All figures in this list were confirmed dead by 1967.

APELIDO ETYMOLOGY:
- "Inimigo" - literally "enemy" in Portuguese
- "Sem Tripa" - literally "without guts/intestines"
- Full meaning: "Gutless Enemy" or "Enemy Without Guts"
- Note: In Portuguese, "tripa" carries connotations of courage (similar to English "guts")
- Possible interpretations:
  1. Ironic: A fighter so fierce he left enemies gutless
  2. Literal: A fighter who showed no mercy to enemies
  3. Descriptive: Physical characteristic or fighting style

NAME VARIATION:
- "Inimigo Sem Tripa" (singular) - Pastinha 1967 interview
- "Inimigos Sem Tripa" (plural) - O Globo 1976 article
- Same person likely; variation may be transcription error or oral tradition

SOURCE: Mestre Pastinha interview with Roberto Freire, Revista Realidade, 1967.
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
- No specific incidents or timeline events',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, década):
Contemporâneo de Pastinha (nascido em 1889). Como praticante de "capoeira de Angola pura" listado entre os lendários angoleiros falecidos, provavelmente ativo no final do século XIX até início do século XX. Estimativa baseada em posicionamento geracional.

ESTIMATIVA DE ANO DE MORTE (1960, década):
Pastinha o listou entre os falecidos em entrevista de 1967. Todas as figuras nesta lista estavam confirmadamente mortas em 1967.

ETIMOLOGIA DO APELIDO:
- "Inimigo" - literalmente "inimigo" em português
- "Sem Tripa" - literalmente "sem tripas/intestinos"
- Significado completo: "Inimigo Sem Tripas" ou "Inimigo Covarde"
- Nota: Em português, "tripa" carrega conotações de coragem (similar ao inglês "guts")
- Interpretações possíveis:
  1. Irônico: Um lutador tão feroz que deixava inimigos sem tripas
  2. Literal: Um lutador que não mostrava misericórdia aos inimigos
  3. Descritivo: Característica física ou estilo de luta

VARIAÇÃO DE NOME:
- "Inimigo Sem Tripa" (singular) - Entrevista de Pastinha 1967
- "Inimigos Sem Tripa" (plural) - Artigo do O Globo 1976
- Mesma pessoa provavelmente; variação pode ser erro de transcrição ou tradição oral

FONTE: Entrevista de Mestre Pastinha com Roberto Freire, Revista Realidade, 1967.
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
- Nenhum incidente específico ou evento cronológico'
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
