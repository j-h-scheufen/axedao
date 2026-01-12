-- ============================================================
-- GENEALOGY PERSON: Sandrinha
-- Generated: 2026-01-09
-- Primary Source: https://capoeirahistory.com/mestre/master-sandrinha-1959/
-- ============================================================
-- First female capoeira mestra in Brazil, trained under Mestre Roque
-- at Grupo Bantus de Capoeira in Pavãozinho, Rio de Janeiro.
-- Also graduated by Mestre Caiçara.
-- ============================================================
--
-- FIRST FEMALE MESTRA CONTEXT:
-- The 2023 UNICAMP study by Ábia Lima de França identified THREE pioneering
-- female mestras in capoeira history:
-- 1. Tonha Rolo do Mar (~1870s-~1950s) - historical razor master in Santo Amaro
-- 2. Sandrinha (b. 1959) - first to formally receive mestra title in 1970s
-- 3. Cigana/Fátima Colombiano (b. 1956) - consecrated mestra in 1980 by Canjiquinha
--
-- Sandrinha is recognized as the first woman to FORMALLY receive the rank of
-- mestra, as opposed to historical women who practiced before formal titles existed.
--
-- SOURCE AGREEMENT:
-- - capoeirahistory.com: "graduated the first capoeira mestra in Brazil" (per Roque)
-- - UNICAMP study: "foi reconhecida mestra na década de 1970" (recognized in 1970s)
-- - Roque's own testimony confirms he "graduated the first capoeira mestra in Brazil"
--
-- PROFESSIONAL CAREER:
-- Passed civil service exam in 1977; worked as prison guard at Frei Caneca prison
-- in Rio de Janeiro center; promoted to "C Class" in 1991; relocated to Brasília.
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Sandra Eugênia Feitosa',
  'Sandrinha',
  'mestra'::genealogy.title,
  NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-sandrinha-1959/', 'https://periodicos.sbu.unicamp.br/ojs/index.php/conexoes/article/view/8674321']::text[],
  'angola'::genealogy.style,
  E'Trained in the Bahian Angola tradition through Mestre Roque''s "line of São Bento"—a faster style of Angola that Roque brought from Salvador to Rio de Janeiro. Also received graduation from Mestre Caiçara, connecting her to the Salvador Angola scene.',
  E'Treinada na tradição Angola baiana através da "linha de São Bento" de Mestre Roque—um estilo de Angola mais rápido que Roque trouxe de Salvador para o Rio de Janeiro. Também recebeu graduação de Mestre Caiçara, conectando-a à cena de Angola de Salvador.',
  1959,
  'exact'::genealogy.date_precision,
  'Pavãozinho, Copacabana, Rio de Janeiro, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  E'Sandra Eugênia Feitosa was born in 1959 in the favela of Pavãozinho, nestled in Rio de Janeiro''s Zona Sul between the wealthy neighborhoods of Ipanema and Copacabana. She grew up in poverty, attending São Pedro do Pavãozinho primary school. As a young girl, she received shoes from CAMDE (Campanha da Mulher pela Democracia), a conservative Christian women''s movement—a detail that captures the economic hardship of her early years.\n\nAt the age of ten, Sandrinha began training capoeira under Mestre Roque at the Associação de Moradores do Pavão/Pavãozinho. Roque was one of the founding Bahian angoleiros who had brought capoeira to Rio''s favelas, co-founding Grupo Filhos de Angola in 1960. For young Sandrinha, the academy at Morro do Pavãozinho became a second home.\n\nIn the 1970s, she taught at Grupo Bantus de Capoeira, founded by Mestre Roque. She performed with Grupo Sabata on Rua Riachuelo and appeared in the show "A Night in Bahia" (Uma Noite na Bahia)—a folkloric production that Roque''s Filhos de Angola also participated in. She traveled to Salvador to perform with Filhos de Obá, experiencing the heart of Bahian capoeira culture firsthand.\n\nSandrinha was also graduated by Mestre Caiçara, the legendary and controversial angoleiro from Salvador known for his hard fighting style, powerful voice, and iconic bengala. This dual lineage—Roque in Rio and Caiçara in Salvador—connected her to both poles of the Capoeira Angola world.\n\nAccording to Mestre Roque''s own testimony, he "graduated the first capoeira mestra in Brazil." This recognition came in the 1970s, making Sandrinha the first woman to formally receive the rank of mestra in Brazilian capoeira history. The 2023 UNICAMP study by Ábia Lima de França confirmed her as one of three pioneering mestras, alongside Tonha Rolo do Mar (a historical figure who taught razor technique to Cobrinha Verde) and Cigana/Fátima Colombiano (consecrated mestra in 1980 by Canjiquinha).\n\nBeyond capoeira, Sandrinha built a professional career. In 1977, she passed the civil service exam and began working as a prison guard at Frei Caneca prison in central Rio de Janeiro. She was promoted to "C Class" in 1991. At some point, she relocated to Brasília, where she currently resides.\n\nHer story represents a breakthrough in a male-dominated tradition. She trained in the same favela where she was born, rose through a lineage that stretched from Bahia to Rio, and became a pioneer who opened the door for the 296 female mestras now documented across Brazil and abroad.',
  E'Sandra Eugênia Feitosa nasceu em 1959 na favela do Pavãozinho, encravada na Zona Sul do Rio de Janeiro entre os bairros ricos de Ipanema e Copacabana. Cresceu na pobreza, frequentando a escola primária de São Pedro do Pavãozinho. Quando menina, recebeu sapatos da CAMDE (Campanha da Mulher pela Democracia), um movimento feminino cristão conservador—um detalhe que captura as dificuldades econômicas de seus primeiros anos.\n\nAos dez anos de idade, Sandrinha começou a treinar capoeira com Mestre Roque na Associação de Moradores do Pavão/Pavãozinho. Roque era um dos angoleiros baianos fundadores que haviam trazido a capoeira para as favelas do Rio, co-fundando o Grupo Filhos de Angola em 1960. Para a jovem Sandrinha, a academia no Morro do Pavãozinho tornou-se um segundo lar.\n\nNos anos 1970, ela ensinou no Grupo Bantus de Capoeira, fundado por Mestre Roque. Ela se apresentou com o Grupo Sabata na Rua Riachuelo e apareceu no show "Uma Noite na Bahia"—uma produção folclórica da qual o Filhos de Angola de Roque também participava. Viajou a Salvador para se apresentar com o Filhos de Obá, experimentando o coração da cultura da capoeira baiana em primeira mão.\n\nSandrinha também foi graduada por Mestre Caiçara, o lendário e controverso angoleiro de Salvador conhecido por seu estilo de luta duro, voz poderosa e icônica bengala. Essa dupla linhagem—Roque no Rio e Caiçara em Salvador—conectou-a a ambos os polos do mundo da Capoeira Angola.\n\nDe acordo com o próprio depoimento de Mestre Roque, ele "formou a primeira mestra de capoeira no Brasil". Esse reconhecimento veio nos anos 1970, fazendo de Sandrinha a primeira mulher a receber formalmente o título de mestra na história da capoeira brasileira. O estudo da UNICAMP de 2023 por Ábia Lima de França confirmou-a como uma das três mestras pioneiras, ao lado de Tonha Rolo do Mar (uma figura histórica que ensinou técnica de navalha a Cobrinha Verde) e Cigana/Fátima Colombiano (consagrada mestra em 1980 por Canjiquinha).\n\nAlém da capoeira, Sandrinha construiu uma carreira profissional. Em 1977, passou no concurso público e começou a trabalhar como agente penitenciária na prisão de Frei Caneca no centro do Rio de Janeiro. Foi promovida à "Classe C" em 1991. Em algum momento, mudou-se para Brasília, onde atualmente reside.\n\nSua história representa uma ruptura em uma tradição dominada por homens. Ela treinou na mesma favela onde nasceu, ascendeu através de uma linhagem que se estendia da Bahia ao Rio, e tornou-se uma pioneira que abriu caminho para as 296 mestras femininas agora documentadas no Brasil e no exterior.',
  E'First female capoeira mestra in Brazil (recognized 1970s)\nTrained under Mestre Roque at Grupo Bantus de Capoeira, Pavãozinho\nAlso graduated by Mestre Caiçara\nPerformed with Grupo Sabata (Rio) and Filhos de Obá (Salvador)\nAppeared in "Uma Noite na Bahia" folkloric show\nWorked as prison guard at Frei Caneca prison (1977-?)\nPromoted to "C Class" civil service (1991)',
  E'Primeira mestra de capoeira no Brasil (reconhecida nos anos 1970)\nTreinou com Mestre Roque no Grupo Bantus de Capoeira, Pavãozinho\nTambém graduada por Mestre Caiçara\nApresentou-se com Grupo Sabata (Rio) e Filhos de Obá (Salvador)\nParticipou do show folclórico "Uma Noite na Bahia"\nTrabalhou como agente penitenciária em Frei Caneca (1977-?)\nPromovida à "Classe C" no serviço público (1991)',
  E'BIRTH YEAR: 1959, exact - confirmed by capoeirahistory.com and UNICAMP study\n\nBIRTH PLACE: Pavãozinho favela, Copacabana, Rio de Janeiro - confirmed by capoeirahistory.com\n\nTEACHERS:\n- Mestre Roque (primary teacher, Grupo Bantus de Capoeira, began ~1969 age 10)\n- Mestre Caiçara (also graduated by, date unknown)\n\nGROUP AFFILIATIONS:\n- Grupo Bantus de Capoeira - taught here in 1970s\n- Grupo Sabata - performed with (Rua Riachuelo, Rio)\n- Filhos de Obá - performed with in Salvador\n- Filhos de Angola - Roque''s group, context of training\n\nFIRST FEMALE MESTRA CONTEXT:\nThe 2023 UNICAMP study identified three pioneering female mestras:\n1. Tonha Rolo do Mar (~1870s-~1950s) - historical razor master, no formal title\n2. Sandrinha (b. 1959) - FIRST formal mestra title, recognized 1970s\n3. Cigana/Fátima Colombiano (b. 1956) - consecrated 1980 by Canjiquinha\n\nSandrinha is recognized as the first to formally receive mestra rank.\n\nMEDIA APPEARANCES:\n- "Uma Noite na Bahia" - folkloric show (1970s)\n- Performances with Grupo Sabata (1970s)\n- Performances with Filhos de Obá in Salvador (1970s)\n\nPROFESSIONAL CAREER:\n- 1977: Passed civil service exam\n- 1977-?: Prison guard at Frei Caneca prison, Rio de Janeiro center\n- 1991: Promoted to "C Class"\n- Unknown date: Relocated to Brasília (current residence)\n\nCURRENT STATUS: Believed to be alive, residing in Brasília\n\nSOURCE NOTES:\n- capoeirahistory.com provides most detailed biographical information\n- UNICAMP study (França, 2023) provides academic confirmation of pioneer status\n- Roque''s testimony confirms her as "the first capoeira mestra in Brazil"',
  E'ANO DE NASCIMENTO: 1959, exato - confirmado por capoeirahistory.com e estudo UNICAMP\n\nLOCAL DE NASCIMENTO: Favela do Pavãozinho, Copacabana, Rio de Janeiro - confirmado por capoeirahistory.com\n\nMESTRES:\n- Mestre Roque (professor principal, Grupo Bantus de Capoeira, começou ~1969 aos 10 anos)\n- Mestre Caiçara (também graduada por, data desconhecida)\n\nAFILIAÇÕES DE GRUPOS:\n- Grupo Bantus de Capoeira - ensinou aqui nos anos 1970\n- Grupo Sabata - apresentou-se com (Rua Riachuelo, Rio)\n- Filhos de Obá - apresentou-se em Salvador\n- Filhos de Angola - grupo de Roque, contexto de treinamento\n\nCONTEXTO PRIMEIRA MESTRA:\nO estudo UNICAMP de 2023 identificou três mestras pioneiras:\n1. Tonha Rolo do Mar (~1870s-~1950s) - mestra histórica de navalha, sem título formal\n2. Sandrinha (n. 1959) - PRIMEIRA com título formal de mestra, reconhecida anos 1970\n3. Cigana/Fátima Colombiano (n. 1956) - consagrada 1980 por Canjiquinha\n\nSandrinha é reconhecida como a primeira a receber formalmente o título de mestra.\n\nAPARIÇÕES NA MÍDIA:\n- "Uma Noite na Bahia" - show folclórico (anos 1970)\n- Apresentações com Grupo Sabata (anos 1970)\n- Apresentações com Filhos de Obá em Salvador (anos 1970)\n\nCARREIRA PROFISSIONAL:\n- 1977: Passou no concurso público\n- 1977-?: Agente penitenciária em Frei Caneca, centro do Rio de Janeiro\n- 1991: Promovida à "Classe C"\n- Data desconhecida: Mudou-se para Brasília (residência atual)\n\nSTATUS ATUAL: Acredita-se estar viva, residindo em Brasília\n\nNOTAS DE FONTES:\n- capoeirahistory.com fornece informações biográficas mais detalhadas\n- Estudo UNICAMP (França, 2023) fornece confirmação acadêmica do status de pioneira\n- Depoimento de Roque confirma ela como "a primeira mestra de capoeira no Brasil"'
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
