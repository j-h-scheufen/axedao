-- ============================================================
-- GENEALOGY PERSON: Idalina
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Active as valentona/capoeirista from 1910-1920 per newspaper records.
-- If in prime fighting age (20-35) during 1917 incident, birth = ~1882-1897.
-- Using 1890 as midpoint with decade precision.
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
  'Idalina Maria do Sacramento',
  'Idalina',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://capoeiraconnection.com/idalina/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for exceptional physical combat skills, taking on multiple civil guards and police officers simultaneously. Part of the street culture that characterized urban capoeiragem in early 20th century Salvador.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida por habilidades excepcionais de combate físico, enfrentando vários guardas civis e policiais simultaneamente. Parte da cultura de rua que caracterizava a capoeiragem urbana no início do século XX em Salvador.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Idalina Maria do Sacramento was a legendary female capoeirista and valentona from Salvador, Bahia, whose exploits in the 1910s and 1920s became the stuff of legend. She was a "desordeira conhecida do conhecido Distrito da Sé" - a known troublemaker from the famous Sé District in Baixa dos Sapateiros, an area that held the stories of capadócios, valentes, and incorrigíveis.\n\nThe most documented incident of Idalina''s life occurred on August 1, 1917, around 5 PM, in front of Armazém do Saldanha. When her companion Firmina was being insulted by Maria Joanna, Idalina did not hesitate: "não perdendo a oportunidade de defender a honra da camarada: entrou em luta com a desafeta e a feriu com sua faca" (not losing the chance to defend her comrade''s honor: she entered into fight with her enemy and wounded her with her knife).\n\nWhen civil guard #233 arrived to break up the fight, Idalina did not surrender. Instead, she turned to fight him too. Guards #191, #165, and #210 arrived as reinforcements, along with several police officers. What happened next became legendary: "Todos se engalfinharam com a valente, que lutou com todos de uma vez" (All tangled with the brave woman, who fought them all at once). She was eventually taken to the Casa de Correções and charged with bodily injuries.\n\nThis was not an isolated incident. According to the Jornal de Notícias, Idalina had multiple documented conflicts with the authorities and other women. In records from 1917 and April 24, 1920, she appears alongside Zeferina, another capoeirista, with whom she feuded over prostitution territory. The newspaper reported: "encontraram-se as desafetas e foram ao duelo a murro e pontapé" (the rivals met and went to a duel with punches and kicks). There exists "uma vasta lista de registros policiais em que ela foi enquadrada sob acusação de capoeiragem" (an extensive list of police records in which she was charged with capoeiragem).\n\nIdalina''s legacy extends beyond historical records. Mestre Bimba, the creator of Capoeira Regional, honored her by naming one of his seven fundamental toques (berimbau rhythms) "Idalina." This toque - a slow to moderate rhythm with a strong beat - is traditionally used for a freer, more expressive game. Some sources indicate it was also associated with the jogo de navalha (razor game). The existence of this toque suggests that Idalina''s reputation was widely known in the capoeira community of her time.\n\nMultiple capoeira songs also reference Idalina, including "É de manhã, Idalina tá me chamando" (It''s morning, Idalina is calling me), suggesting she became part of the oral tradition that preserves capoeira history. The songs portray her as someone who "chama a gente e sai andando" (calls people and keeps moving) - a woman who lived life on her own terms.\n\nIdalina was one of many "mulheres incorrigíveis" (incorrigible women) documented in Paula Juliana Foltran''s groundbreaking doctoral thesis at the University of Brasília (2019). This research, conducted in the Arquivo Público do Estado da Bahia, identified hundreds of women engaged in street fighting and capoeiragem during the 1900-1920 period, definitively dismantling the myth that capoeira was exclusively a male domain.\n\nAs Foltran writes: "Idalina é capoeira, não fica parada à espera de nada" (Idalina is capoeira, she doesn''t stay still waiting for anything). This phrase captures the essence of a woman who, in an era when capoeira was criminalized and women faced even greater persecution for practicing it, fought back against anyone who challenged her - whether rivals, civil guards, or the social order itself.',
  E'Idalina Maria do Sacramento foi uma lendária capoeirista e valentona de Salvador, Bahia, cujas façanhas nas décadas de 1910 e 1920 tornaram-se lenda. Ela era uma "desordeira conhecida do conhecido Distrito da Sé" - na Baixa dos Sapateiros, uma área que guardava as histórias de capadócios, valentes e incorrigíveis.\n\nO incidente mais documentado da vida de Idalina ocorreu em 1º de agosto de 1917, por volta das 17 horas, em frente ao Armazém do Saldanha. Quando sua companheira Firmina estava sendo insultada por Maria Joanna, Idalina não hesitou: "não perdendo a oportunidade de defender a honra da camarada: entrou em luta com a desafeta e a feriu com sua faca."\n\nQuando o guarda civil nº 233 chegou para apartar a briga, Idalina não se entregou. Em vez disso, passou a lutar também com ele. Os guardas nº 191, 165 e 210 chegaram como reforço, junto com vários praças de polícia. O que aconteceu a seguir tornou-se lendário: "Todos se engalfinharam com a valente, que lutou com todos de uma vez." Ela foi finalmente levada à Casa de Correções e respondeu por lesões corporais.\n\nEste não foi um incidente isolado. Segundo o Jornal de Notícias, Idalina teve múltiplos conflitos documentados com as autoridades e outras mulheres. Em registros de 1917 e 24 de abril de 1920, ela aparece junto com Zeferina, outra capoeirista, com quem tinha rixa por ponto de prostituição. O jornal relatou: "encontraram-se as desafetas e foram ao duelo a murro e pontapé." Existe "uma vasta lista de registros policiais em que ela foi enquadrada sob acusação de capoeiragem."\n\nO legado de Idalina vai além dos registros históricos. Mestre Bimba, o criador da Capoeira Regional, a homenageou dando seu nome a um dos seus sete toques fundamentais de berimbau: "Idalina." Este toque - um ritmo lento a moderado com batida forte - é tradicionalmente usado para um jogo mais livre e expressivo. Algumas fontes indicam que também era associado ao jogo de navalha. A existência deste toque sugere que a reputação de Idalina era amplamente conhecida na comunidade capoeirística de sua época.\n\nVárias músicas de capoeira também fazem referência a Idalina, incluindo "É de manhã, Idalina tá me chamando," sugerindo que ela se tornou parte da tradição oral que preserva a história da capoeira. As músicas a retratam como alguém que "chama a gente e sai andando" - uma mulher que vivia a vida em seus próprios termos.\n\nIdalina foi uma das muitas "mulheres incorrigíveis" documentadas na tese de doutorado pioneira de Paula Juliana Foltran na Universidade de Brasília (2019). Esta pesquisa, realizada no Arquivo Público do Estado da Bahia, identificou centenas de mulheres envolvidas em lutas de rua e capoeiragem durante o período 1900-1920, desmontando definitivamente o mito de que a capoeira era um domínio exclusivamente masculino.\n\nComo escreve Foltran: "Idalina é capoeira, não fica parada à espera de nada." Esta frase captura a essência de uma mulher que, em uma era em que a capoeira era criminalizada e as mulheres enfrentavam perseguição ainda maior por praticá-la, lutou contra qualquer um que a desafiasse - fossem rivais, guardas civis ou a própria ordem social.',
  E'Legendary female capoeirista of early 20th century Salvador; namesake of Mestre Bimba''s toque "Idalina"; fought multiple civil guards and police simultaneously (1917); documented in extensive police records for capoeiragem; subject of capoeira songs; researched in Paula Foltran''s "Mulheres incorrigíveis" thesis (UnB, 2019)',
  E'Lendária capoeirista do início do século XX em Salvador; deu nome ao toque "Idalina" de Mestre Bimba; lutou contra vários guardas civis e policiais simultaneamente (1917); documentada em extensos registros policiais por capoeiragem; tema de músicas de capoeira; pesquisada na tese "Mulheres incorrigíveis" de Paula Foltran (UnB, 2019)',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1890, decade precision):\nActive as valentona/capoeirista from 1910-1920 per newspaper records. If in prime fighting age (20-35) during 1917 incident, birth = ~1882-1897. Using 1890 as midpoint.\n\nFULL NAME DISCREPANCY:\n- "Idalina Maria do Sacramento" - Jornal de Notícias 1917 conflict with Zeferina (MAJORITY)\n- "Idalina Maria de Jesus" - Some sources cite this variant\nUsing "Idalina Maria do Sacramento" as primary based on newspaper record.\n\nDEATH: Unknown. No death records found.\n\nKEY INCIDENT (August 1, 1917, ~5 PM):\n- Location: In front of Armazém do Saldanha, Distrito da Sé\n- Defended companion Firmina against Maria Joanna\n- Wounded Maria Joanna with knife\n- Guards involved: #233 (first responder), #191, #165, #210 plus additional police\n- Fought ALL of them simultaneously\n- Arrested, taken to Casa de Correções\n- Charge: Lesões corporais (bodily injuries)\n- Source: Paula Foltran thesis citing Jornal de Notícias\n\nOTHER DOCUMENTED CONFLICTS:\n- Multiple arrests for desordem/capoeiragem 1910s-1920s\n- Conflict with Zeferina (April 24, 1920): "encontraram-se as desafetas e foram ao duelo a murro e pontapé"\n- Both charged with capoeiragem multiple times\n- Disputes over prostitution territory\n\nTOQUE "IDALINA":\n- Created by Mestre Bimba as one of 7 toques of Capoeira Regional\n- Slow to moderate rhythm, strong beat\n- Used for freer, expressive game\n- Some sources associate with jogo de navalha (razor game)\n- Mestre Nenel uses it to calm animated rodas\n- Variations: "Idalina" (faster), "Idalina Compassada" (slower)\n\nCAPoEIRA SONGS REFERENCING IDALINA:\n- "É de manhã, Idalina tá me chamando" (corrido)\n- "Ê Idalina" (regional)\n- "Sai sai Catarina / Idalina"\n- "Tira dali, bota aqui Idalina"\n\nCONTEMPORARY VALENTONAS (1910s-1920s Salvador):\n- Angélica Endiabrada\n- Maria Doze Homens\n- Rosa Palmeirão\n- Salomé\n- Zeferina (rival)\n- Chicão (Francisca Albino dos Santos)\n- Massú, Catu, Almerinda, Menininha\n\nPRIMARY SOURCES:\n- Paula Juliana Foltran, "Mulheres incorrigíveis" PhD thesis (UnB, 2019)\n- Jornal de Notícias (Salvador, 1917, April 24, 1920)\n- Adriana Albert Dias, "A Malandragem da Mandinga" (UFBA dissertation)\n\nCAVEAT ON CONFLATION:\n- Some sources conflate this Idalina (Salvador capoeirista) with another Idalina (Recife, 1860s, Castro Alves''s first love)\n- These are DIFFERENT people; the Recife Idalina predates capoeira documentation',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década):\nAtiva como valentona/capoeirista de 1910-1920 segundo registros de jornais. Se estava em idade de luta (20-35) durante o incidente de 1917, nascimento = ~1882-1897. Usando 1890 como ponto médio.\n\nDISCREPÂNCIA DE NOME COMPLETO:\n- "Idalina Maria do Sacramento" - Jornal de Notícias 1917 conflito com Zeferina (MAIORIA)\n- "Idalina Maria de Jesus" - Algumas fontes citam esta variante\nUsando "Idalina Maria do Sacramento" como primário baseado no registro de jornal.\n\nMORTE: Desconhecida. Nenhum registro de óbito encontrado.\n\nINCIDENTE PRINCIPAL (1º de agosto de 1917, ~17h):\n- Local: Em frente ao Armazém do Saldanha, Distrito da Sé\n- Defendeu companheira Firmina contra Maria Joanna\n- Feriu Maria Joanna com faca\n- Guardas envolvidos: #233 (primeiro a chegar), #191, #165, #210 mais policiais adicionais\n- Lutou contra TODOS simultaneamente\n- Presa, levada à Casa de Correções\n- Acusação: Lesões corporais\n- Fonte: Tese de Paula Foltran citando Jornal de Notícias\n\nOUTROS CONFLITOS DOCUMENTADOS:\n- Múltiplas prisões por desordem/capoeiragem 1910s-1920s\n- Conflito com Zeferina (24 de abril de 1920): "encontraram-se as desafetas e foram ao duelo a murro e pontapé"\n- Ambas acusadas de capoeiragem múltiplas vezes\n- Disputas por ponto de prostituição\n\nTOQUE "IDALINA":\n- Criado por Mestre Bimba como um dos 7 toques da Capoeira Regional\n- Ritmo lento a moderado, batida forte\n- Usado para jogo mais livre e expressivo\n- Algumas fontes associam ao jogo de navalha\n- Mestre Nenel usa para acalmar rodas animadas\n- Variações: "Idalina" (mais rápida), "Idalina Compassada" (mais lenta)\n\nMÚSICAS DE CAPOEIRA REFERENCIANDO IDALINA:\n- "É de manhã, Idalina tá me chamando" (corrido)\n- "Ê Idalina" (regional)\n- "Sai sai Catarina / Idalina"\n- "Tira dali, bota aqui Idalina"\n\nVALENTONAS CONTEMPORÂNEAS (1910s-1920s Salvador):\n- Angélica Endiabrada\n- Maria Doze Homens\n- Rosa Palmeirão\n- Salomé\n- Zeferina (rival)\n- Chicão (Francisca Albino dos Santos)\n- Massú, Catu, Almerinda, Menininha\n\nFONTES PRIMÁRIAS:\n- Paula Juliana Foltran, "Mulheres incorrigíveis" tese PhD (UnB, 2019)\n- Jornal de Notícias (Salvador, 1917, 24 de abril de 1920)\n- Adriana Albert Dias, "A Malandragem da Mandinga" (dissertação UFBA)\n\nRESALVA SOBRE CONFUSÃO:\n- Algumas fontes confundem esta Idalina (capoeirista de Salvador) com outra Idalina (Recife, 1860s, primeiro amor de Castro Alves)\n- São pessoas DIFERENTES; a Idalina de Recife antecede a documentação da capoeira'
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
