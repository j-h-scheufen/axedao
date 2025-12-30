-- ============================================================
-- GENEALOGY PERSON: Tibiriçá da Folha Grossa
-- Generated: 2025-12-18
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- As a contemporary of Pastinha (born 1889) who practiced "pure Capoeira
-- de Angola", Tibiriçá was likely of the same generation. The legendary
-- capoeiristas Pastinha listed in 1967 were from the pre-Bimba/Pastinha
-- era - active practitioners from the late 19th to early 20th century.
-- Using 1890 as a reasonable estimate with decade precision.
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
  'Tibiriçá da Folha Grossa', -- apelido: compound nickname
  NULL, -- title: no formal title documented
  NULL, -- portrait: no image found
  ARRAY['https://velhosmestres.com/en/pastinha-1967', 'https://velhosmestres.com/br/pastinha-1967']::text[],
  'angola'::genealogy.style,
  E'Traditional capoeira de Angola. Mestre Pastinha explicitly identified Tibiriçá da Folha Grossa as a practitioner of "pure Capoeira de Angola" alongside other legendary angoleiros of the pre-Bimba/Pastinha era. Pastinha remarked that the nicknames alone revealed "who they were, how they fought".',
  E'Capoeira de Angola tradicional. Mestre Pastinha identificou explicitamente Tibiriçá da Folha Grossa como praticante de "capoeira de Angola pura" ao lado de outros angoleiros lendários da era pré-Bimba/Pastinha. Pastinha observou que os apelidos por si só revelavam "quem eles eram, como lutavam".',
  1890, -- birth_year: estimated from generation (see header)
  'decade'::genealogy.date_precision, -- birth_year_precision
  NULL, -- birth_place: likely Salvador area, but unconfirmed
  1960, -- death_year: estimated (dead before 1967 interview)
  'decade'::genealogy.date_precision, -- death_year_precision
  NULL, -- death_place: no data
  -- bio_en
  E'Tibiriçá da Folha Grossa was a legendary capoeirista of Salvador, Bahia, active during the late 19th or early 20th century. He is known exclusively from Mestre Pastinha''s 1967 interview with Roberto Freire for Revista Realidade, where Pastinha recalled the great capoeiristas of the past.

In that interview, conducted when Pastinha was 78 years old and nearly blind, the father of Capoeira Angola listed fifteen deceased practitioners who had practiced "the pure Capoeira de Angola as I and these boys there do until today". Tibiriçá da Folha Grossa was among them, alongside other colorfully-named figures such as Bigode de Seda (Silk Mustache), Américo Ciência, Bugalho, Amorzinho (Little Love), Zé Bom Pé (Joe Good Foot), Chico Três Pedaços (Chico Three Pieces), Doze Homens (Twelve Men), Inimigo Sem Tripa (Enemy Without Guts), Vitorino Braço Torto (Vitorino Crooked Arm), Zé do U, Zé do Saco (Joe of the Sack), Bené do Correio (Bené of the Post Office), Sete Mortes (Seven Deaths), and Chico Me Dá (Give-Me Chico). Pastinha also mentioned two women among these legendary practitioners: Júlia Fogareira and Maria Homem.

Pastinha remarked of these figures: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história" (We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story). He emphasized that their nicknames revealed their character and fighting style: "From the nicknames alone you can know who they were, how they fought".

The name "Tibiriçá" is of Tupi indigenous origin, historically associated with Chief Tibiriçá (died 1562), a Tupiniquim leader. Writer Eduardo Bueno, citing Teodoro Sampaio, interprets it as "vigilante da terra" (guardian of the land) or "sentinela da serra" (sentinel of the mountain range) in Tupi. This indigenous name on a capoeirista reflects the Afro-Indigenous cultural mixing characteristic of Bahian popular culture.

"Folha Grossa" (Thick Leaf) is a descriptive qualifier whose specific meaning for this capoeirista has been lost to history. In capoeira tradition, such nicknames often referred to physical characteristics, personality traits, or fighting style. Whether it described his toughness, his body type, his movement quality, or something else entirely remains unknown.

No further biographical details have survived - no teachers, students, specific incidents, or documented appearances. Tibiriçá da Folha Grossa exists as a name on Pastinha''s list of the fallen, a reminder that behind each apelido stood a life now largely forgotten.',
  -- bio_pt
  E'Tibiriçá da Folha Grossa foi um lendário capoeirista de Salvador, Bahia, ativo durante o final do século XIX ou início do século XX. Ele é conhecido exclusivamente pela entrevista de Mestre Pastinha de 1967 com Roberto Freire para a Revista Realidade, na qual Pastinha recordou os grandes capoeiristas do passado.

Nessa entrevista, conduzida quando Pastinha tinha 78 anos e estava quase cego, o pai da Capoeira Angola listou quinze praticantes falecidos que haviam praticado "a pura capoeira de Angola como eu e esses rapazes aí fazem até hoje". Tibiriçá da Folha Grossa estava entre eles, ao lado de outras figuras de nomes coloridos como Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Doze Homens, Inimigo Sem Tripa, Vitorino Braço Torto, Zé do U, Zé do Saco, Bené do Correio, Sete Mortes e Chico Me Dá. Pastinha também mencionou duas mulheres entre esses praticantes lendários: Júlia Fogareira e Maria Homem.

Pastinha comentou sobre essas figuras: "Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história". Ele enfatizou que seus apelidos revelavam seu caráter e estilo de luta: "Só pelo apelido você conhece quem eles eram, como lutavam".

O nome "Tibiriçá" é de origem indígena Tupi, historicamente associado ao Cacique Tibiriçá (falecido em 1562), um líder Tupiniquim. O escritor Eduardo Bueno, citando Teodoro Sampaio, interpreta-o como "vigilante da terra" ou "sentinela da serra" em Tupi. Este nome indígena em um capoeirista reflete a mestiçagem cultural afro-indígena característica da cultura popular baiana.

"Folha Grossa" é um qualificador descritivo cujo significado específico para este capoeirista se perdeu na história. Na tradição da capoeira, tais apelidos frequentemente se referiam a características físicas, traços de personalidade ou estilo de luta. Se descrevia sua dureza, seu tipo físico, sua qualidade de movimento ou algo completamente diferente permanece desconhecido.

Nenhum detalhe biográfico adicional sobreviveu - nenhum mestre, aluno, incidente específico ou aparição documentada. Tibiriçá da Folha Grossa existe como um nome na lista de Pastinha dos caídos, um lembrete de que por trás de cada apelido havia uma vida agora em grande parte esquecida.',
  NULL, -- achievements_en: no specific achievements documented
  NULL, -- achievements_pt
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1890, decade):
Contemporary of Pastinha (born 1889). As a practitioner of "pure Capoeira de Angola" listed among the legendary deceased angoleiros, likely active in the late 19th to early 20th century. Estimate based on generational placement.

DEATH YEAR ESTIMATION (1960, decade):
Pastinha listed him among the deceased in 1967 interview. All figures in this list were confirmed dead by 1967.

APELIDO ETYMOLOGY:
- "Tibiriçá" - Tupi indigenous name. Eduardo Bueno (citing Teodoro Sampaio) interprets as "vigilante da terra" (guardian of the land) or "sentinela da serra" (sentinel of the mountain range). Alternative etymology by tupinólogo Eduardo de Almeida Navarro: from Tupi "tebiresá" meaning "eye of the buttocks" (tebira, "buttock" + esá, "eye").
- "da Folha Grossa" - literally "of the Thick Leaf"; meaning unknown but likely descriptive of physical characteristic, personality, or fighting style.

SOURCE: Mestre Pastinha interview with Roberto Freire, Revista Realidade, 1967.

PASTINHA''S 1967 LIST OF DECEASED ANGOLEIROS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

KEY QUOTE (Portuguese):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história".

KEY QUOTE (English translation):
"We speak, remembering the great capoeiristas of the past. They are already dead. Each of these names is a story".

KEY QUOTE on nicknames:
"From the nicknames alone you can know who they were, how they fought".

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
- "Tibiriçá" - Nome indígena Tupi. Eduardo Bueno (citando Teodoro Sampaio) interpreta como "vigilante da terra" ou "sentinela da serra". Etimologia alternativa do tupinólogo Eduardo de Almeida Navarro: do Tupi "tebiresá" significando "olho da bunda" (tebira, "bunda" + esá, "olho").
- "da Folha Grossa" - literalmente "da Folha Grossa"; significado desconhecido mas provavelmente descritivo de característica física, personalidade ou estilo de luta.

FONTE: Entrevista de Mestre Pastinha com Roberto Freire, Revista Realidade, 1967.

LISTA DE PASTINHA DE 1967 DE ANGOLEIROS FALECIDOS:
Bigode de Seda, Américo Ciência, Bugalho, Amorzinho, Zé Bom Pé, Chico Três Pedaços, Tibiriçá da Folha Grossa, Doze Homens, Inimigo Sem Tripa, Zé do U, Vitorino Braço Torto, Zé do Saco, Bené do Correio, Sete Mortes, Chico Me Dá, Júlia Fogareira, Maria Homem

CITAÇÃO CHAVE (Português):
"Digo a gente, lembrando os grandes capoeiristas do passado. Já estão mortos. Cada nome destes é uma história".

CITAÇÃO CHAVE sobre apelidos:
"Só pelo apelido você conhece quem eles eram, como lutavam".

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
