-- ============================================================
-- GENEALOGY PERSON: Moreno (Cobrinha Verde student)
-- Generated: 2025-12-15
-- ============================================================
-- CRITICAL CONTEXT ON NICKNAME:
-- "Moreno" (brown-skinned, dark-haired) is an EXTREMELY common
-- nickname in Brazil, especially in capoeira where apelidos were
-- often based on physical appearance. There were likely MULTIPLE
-- people called "Moreno" in Salvador's capoeira scene.
--
-- This profile represents the specific "Moreno" documented as a
-- student of Mestre Cobrinha Verde in Portuguese Wikipedia and
-- capoeira.online sources.
--
-- IMPORTANT: The "Moreno" mentioned in Gato Preto's 1999 interview
-- as part of the Itapuã bateria may or may NOT be the same person.
-- We cannot confirm this connection - it could be:
-- - The same person (plausible given overlapping circles)
-- - A different Moreno entirely
-- - A transcription error from verbal interview
--
-- Other documented "Morenos" in Salvador capoeira:
-- - Albertino da Hora (nicknamed "Moreno") - Pastinha student, 1963-1964 photos
-- - Gaguinho Moreno - listed separately among Pastinha's students
--
-- Full name unknown. No birth/death dates documented.
-- Using apelido_context 'Cobrinha Verde student' to disambiguate.
--
-- BIRTH YEAR ESTIMATION (1925, decade precision):
-- Moreno was listed as a training companion of João Pequeno (born 1917)
-- and João Grande (born 1933) under Mestre Cobrinha Verde. A "Moreno"
-- also played bateria at Itapuã rodas in the 1950s-1960s alongside
-- João Pequeno. If the same person, he would have been an established
-- musician (25-40 years old) during this period, placing birth around
-- 1915-1935. Using 1925 as midpoint estimate between João Pequeno's
-- and João Grande's birth years.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, apelido_context, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, -- Full name unknown
  'Moreno',
  'Cobrinha Verde student', -- Disambiguates from other Morenos
  NULL, -- No title documented
  NULL, -- No portrait available
  NULL, -- No stable public links
  'angola'::genealogy.style,
  E'Trained under Mestre Cobrinha Verde in the traditional Angola style of Santo Amaro and Salvador. A "Moreno" is also documented playing in the bateria at Itapuã rodas (1950s-1960s) - possibly the same person, but uncertain given how common the nickname was.',
  E'Treinou com Mestre Cobrinha Verde no estilo Angola tradicional de Santo Amaro e Salvador. Um "Moreno" também está documentado tocando na bateria nas rodas de Itapuã (décadas de 1950-1960) - possivelmente a mesma pessoa, mas incerto dado quão comum era o apelido.',
  1925, -- Estimated: midpoint between training companions João Pequeno (1917) and João Grande (1933)
  'decade'::genealogy.date_precision,
  NULL, -- Birth place unknown, likely Salvador area
  NULL, -- Death year unknown
  NULL,
  NULL,
  E'Moreno was a student of Mestre Cobrinha Verde, the legendary cousin of Besouro Mangangá. He is listed alongside João Grande, João Pequeno, Gigante, and Eulampio as one of Cobrinha Verde''s students in Portuguese Wikipedia and capoeira.online sources.\n\nBeyond this basic identification as a Cobrinha Verde student, virtually nothing is documented about Moreno''s life. His full name, birth and death dates, and whether he achieved any formal title all remain unknown.\n\nNote: "Moreno" (brown-skinned, dark-haired) was an extremely common nickname in Brazilian capoeira, often given based on physical appearance. There were almost certainly multiple people called "Moreno" in Salvador''s capoeira scene during this era.',
  E'Moreno foi aluno de Mestre Cobrinha Verde, o lendário primo de Besouro Mangangá. Ele é listado junto com João Grande, João Pequeno, Gigante e Eulampio como um dos alunos de Cobrinha Verde na Wikipédia em português e nas fontes do capoeira.online.\n\nAlém desta identificação básica como aluno de Cobrinha Verde, praticamente nada está documentado sobre a vida de Moreno. Seu nome completo, datas de nascimento e morte, e se ele alcançou algum título formal, tudo permanece desconhecido.\n\nNota: "Moreno" (de pele morena, cabelo escuro) era um apelido extremamente comum na capoeira brasileira, frequentemente dado com base na aparência física. Quase certamente havia múltiplas pessoas chamadas "Moreno" na cena da capoeira de Salvador durante essa época.',
  NULL, -- No specific achievements documented
  NULL,
  E'SOURCES: Listed as student of Cobrinha Verde alongside João Grande, João Pequeno, Gigante, and Eulampio in Portuguese Wikipedia (Mestre Cobrinha Verde) and capoeira.online.\n\nIMPORTANT - NICKNAME AMBIGUITY: "Moreno" was an extremely common nickname in Brazilian capoeira, given to anyone with darker skin or hair. There were almost certainly multiple "Morenos" in Salvador''s capoeira scene. A "Moreno" also appears in Gato Preto''s 1999 interview as part of the Itapuã bateria, but we CANNOT confirm this is the same person - could be coincidence, different person, or transcription error from verbal interview.\n\nOther documented "Morenos" in Salvador capoeira:\n- Albertino da Hora (nicknamed "Moreno") - Pastinha''s CECA, documented in 1963-1964 photos\n- Gaguinho Moreno - listed separately among Pastinha''s students\n\nNo full name, birth/death dates, or title documented for this Cobrinha Verde student.',
  E'FONTES: Listado como aluno de Cobrinha Verde junto com João Grande, João Pequeno, Gigante e Eulampio na Wikipédia em português (Mestre Cobrinha Verde) e capoeira.online.\n\nIMPORTANTE - AMBIGUIDADE DO APELIDO: "Moreno" era um apelido extremamente comum na capoeira brasileira, dado a qualquer pessoa com pele ou cabelo mais escuro. Quase certamente havia múltiplos "Morenos" na cena da capoeira de Salvador. Um "Moreno" também aparece na entrevista de Gato Preto de 1999 como parte da bateria de Itapuã, mas NÃO PODEMOS confirmar que seja a mesma pessoa - pode ser coincidência, pessoa diferente, ou erro de transcrição de entrevista verbal.\n\nOutros "Morenos" documentados na capoeira de Salvador:\n- Albertino da Hora (apelidado "Moreno") - CECA de Pastinha, documentado em fotos de 1963-1964\n- Gaguinho Moreno - listado separadamente entre os alunos de Pastinha\n\nSem nome completo, datas de nascimento/morte ou título documentados para este aluno de Cobrinha Verde.'
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
