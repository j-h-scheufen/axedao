-- ============================================================
-- GENEALOGY PERSON: Angélica Endiabrada
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION (1885, decade precision):
-- Active as valentona from 1910-1920 per newspaper records.
-- If in prime fighting age (25-35) during this period, birth = ~1875-1895.
-- Using 1885 as midpoint with decade precision.
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
  'Anna Angélica',
  'Angélica Endiabrada',
  NULL,
  NULL,
  ARRAY['https://capoeiraespeto.wordpress.com/2017/11/25/a-mulher-na-capoeira/', 'https://portalcapoeira.com/capoeira/cronicas-da-capoeiragem/a-mulher-na-capoeira/']::text[],
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Known for physical combat skills and resistance against authority.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Conhecida por suas habilidades de combate físico e resistência à autoridade.',
  -- Life dates
  1885,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Anna Angélica, known as "Angélica Endiabrada", was a valentona - a tough woman skilled in physical combat - who became notorious in Salvador, Bahia between 1910 and 1920. She was a constant presence in newspaper headlines and police records as one of the feared "valentonas da Bahia".\n\n"Endiabrada" - meaning "possessed by the devil" or "wild" - was not a mere nickname but an adjective given to women who demonstrated exceptional skill in hand-to-hand combat. Angélica earned this epithet after a confrontation with a civil guard in which she resisted arrest and struck the officer, breaking his mouth. This single act of defiance against authority crystallized her reputation in the popular imagination.\n\nAccording to Antônio Vianna in "Casos e coisas da Bahia", Angélica was also known as a troublemaker who, when drinking, would break up bars in the capital city around 1910. The scenes were the streets, the brothels, the points of prostitution - the same urban geography that shaped male capoeiristas of the era. The reasons for conflict were jealousy, alcohol, personal feuds - the common currency of street life in old Bahia.\n\nAngélica belonged to a generation of legendary female capoeiristas and valentonas whose stories were passed down in oral tradition. She was contemporary with Salomé, Maria Doze Homens, Chicão, Rosa Palmeirão, Massú, Catu, Almerinda, and Menininha - women whose histories involved confrontations with police, knife fights with razors, and even the deaths of famous male valentões.\n\nThe book "Mestres e capoeiras famosos da Bahia" by Pedro Abib (2009) contains a chapter titled "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" (Fight over moqueca), documenting an encounter between these two legendary women. The fact that their conflict warranted its own chapter demonstrates how significant these female figures were in the capoeiragem of early 20th century Bahia.\n\nWhile no direct evidence proves Angélica was a capoeirista in the formal sense, the newspapers and police of the era labeled women like her as such. The mastery of navalha (razor), canivete (penknife), faca (knife), and punhal (dagger) suggests she was indeed part of the capoeiragem culture, as these weapons were the companions of post-slavery capoeira practitioners.\n\nAngélica''s story was remembered in literatura de cordel - the popular printed booklets that celebrated legendary figures. Along with Besouro Mangangá, Inocêncio Sete Mortes, and Maria Doze Homem, she became part of the folklore that kept the memory of old capoeiragem alive.\n\nThe doctoral thesis "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" by Paula Juliana Foltran (2019, University of Brasília) represents the most comprehensive academic study of women like Angélica. Foltran''s research in the Arquivo Público do Estado da Bahia identified hundreds of women engaged in street fighting during this period, definitively dismantling the myth that capoeira was exclusively a male domain.',
  E'Anna Angélica, conhecida como "Angélica Endiabrada", foi uma valentona - uma mulher durona e habilidosa no combate físico - que se tornou notória em Salvador, Bahia, entre 1910 e 1920. Ela era presença constante nas manchetes dos jornais e nos registros policiais como uma das temidas "valentonas da Bahia".\n\n"Endiabrada" - significando "possuída pelo diabo" ou "selvagem" - não era um mero apelido, mas um adjetivo dado às mulheres que demonstravam habilidade excepcional no combate corpo a corpo. Angélica ganhou esse epíteto após um confronto com um guarda civil, no qual resistiu à prisão e bateu no oficial, quebrando sua boca. Este único ato de desafio à autoridade cristalizou sua reputação no imaginário popular.\n\nSegundo Antônio Vianna em "Casos e coisas da Bahia", Angélica também era conhecida como uma desordeira que, quando bebia, quebrava os bares da capital por volta de 1910. Os cenários eram as ruas, os bordéis, os pontos de prostituição - a mesma geografia urbana que moldou os capoeiristas masculinos da época. Os motivos dos conflitos eram ciúmes, bebida, rixas pessoais - a moeda corrente da vida de rua na velha Bahia.\n\nAngélica pertencia a uma geração de lendárias capoeiristas e valentonas femininas cujas histórias foram transmitidas pela tradição oral. Ela era contemporânea de Salomé, Maria Doze Homens, Chicão, Rosa Palmeirão, Massú, Catu, Almerinda e Menininha - mulheres cujas histórias envolviam confrontos com a polícia, brigas com navalha, e até mortes de famosos valentões.\n\nO livro "Mestres e capoeiras famosos da Bahia" de Pedro Abib (2009) contém um capítulo intitulado "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca", documentando um encontro entre essas duas mulheres lendárias. O fato de seu conflito ter merecido um capítulo próprio demonstra o quão significativas essas figuras femininas eram na capoeiragem do início do século XX na Bahia.\n\nEmbora não haja evidência direta de que Angélica fosse capoeirista no sentido formal, os jornais e a polícia da época rotulavam mulheres como ela dessa forma. O domínio da navalha, canivete, faca e punhal sugere que ela fazia parte da cultura da capoeiragem, pois essas armas eram as companheiras dos praticantes de capoeira pós-escravidão.\n\nA história de Angélica foi lembrada na literatura de cordel - os livretos populares impressos que celebravam figuras lendárias. Junto com Besouro Mangangá, Inocêncio Sete Mortes e Maria Doze Homem, ela se tornou parte do folclore que manteve viva a memória da velha capoeiragem.\n\nA tese de doutorado "Mulheres incorrigíveis: capoeiragem, desordem e valentia nas ladeiras da Bahia (1900-1920)" de Paula Juliana Foltran (2019, Universidade de Brasília) representa o estudo acadêmico mais abrangente sobre mulheres como Angélica. A pesquisa de Foltran no Arquivo Público do Estado da Bahia identificou centenas de mulheres envolvidas em lutas de rua durante este período, desmontando definitivamente o mito de que a capoeira era um domínio exclusivamente masculino.',
  E'One of the legendary valentonas of early 20th century Bahia; immortalized in literatura de cordel alongside Besouro Mangangá; subject of a chapter in "Mestres e capoeiras famosos da Bahia" (2009)',
  E'Uma das lendárias valentonas do início do século XX na Bahia; imortalizada na literatura de cordel ao lado de Besouro Mangangá; tema de um capítulo em "Mestres e capoeiras famosos da Bahia" (2009)',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1885, decade precision):\nActive as valentona from 1910-1920 per newspaper records. If in prime fighting age (25-35) during this period, birth = ~1875-1895. Using 1885 as midpoint.\n\nFULL NAME: Anna Angélica (per Espeto Capoeira article). Surname unknown.\n\nDEATH: Unknown. No death records found.\n\nAPELIDO MEANING: "Endiabrada" = "possessed by the devil" or "wild/devilish". Given as adjective to women skilled in physical combat.\n\nKEY INCIDENT: Confronted civil guard, resisted arrest, struck officer breaking his mouth. This incident earned her the "Endiabrada" epithet.\n\nNEWSPAPER RECORDS: Frequently appeared in Salvador newspaper headlines and police records between 1910-1920.\n\nBOOK CHAPTER: "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" in "Mestres e capoeiras famosos da Bahia" (JSTOR, Pedro Abib 2009).\n\nCORDEL LITERATURE: Remembered in literatura de cordel alongside Besouro Mangangá, Inocêncio Sete Mortes, Maria Doze Homem.\n\nCAVEAT: No direct proof she practiced capoeira formally. Newspapers/police labeled valentonas as capoeiristas. Weapon mastery (navalha, canivete, faca, punhal) suggests connection to capoeiragem culture.\n\nCONTEMPORARY VALENTONAS (1910s-1920s):\n- Salomé (active 1920s-1930s)\n- Maria Doze Homens\n- Chicão (Francisca Albino dos Santos, killed Pedro Porreta 1929)\n- Rosa Palmeirão (Cândida Rosa de Jesus)\n- Massú\n- Catu\n- Almerinda\n- Menininha\n- Adelaide Presepeira (1920s-1930s)\n- Idalina (arrested multiple times 1910s-1920s)\n\nPRIMARY SOURCES:\n- Antônio Vianna, "Casos e coisas da Bahia" (1950, 1984)\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (2009)\n- Paula Juliana Foltran, "Mulheres incorrigíveis" PhD thesis (UnB, 2019)\n- Newspaper archives: Jornal de Notícias, Gazeta do Povo (1910s-1920s)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1885, precisão de década):\nAtiva como valentona de 1910-1920 segundo registros de jornais. Se estava em idade de luta (25-35) durante este período, nascimento = ~1875-1895. Usando 1885 como ponto médio.\n\nNOME COMPLETO: Anna Angélica (segundo artigo Espeto Capoeira). Sobrenome desconhecido.\n\nMORTE: Desconhecida. Nenhum registro de óbito encontrado.\n\nSIGNIFICADO DO APELIDO: "Endiabrada" = "possuída pelo diabo" ou "selvagem/diabólica". Dado como adjetivo a mulheres hábeis no combate físico.\n\nINCIDENTE PRINCIPAL: Enfrentou guarda civil, resistiu à prisão, bateu no oficial quebrando sua boca. Este incidente lhe rendeu o epíteto "Endiabrada".\n\nREGISTROS DE JORNAIS: Aparecia frequentemente nas manchetes dos jornais de Salvador e registros policiais entre 1910-1920.\n\nCAPÍTULO DE LIVRO: "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" em "Mestres e capoeiras famosos da Bahia" (JSTOR, Pedro Abib 2009).\n\nLITERATURA DE CORDEL: Lembrada na literatura de cordel ao lado de Besouro Mangangá, Inocêncio Sete Mortes, Maria Doze Homem.\n\nRESALVA: Nenhuma prova direta de que praticava capoeira formalmente. Jornais/polícia rotulavam valentonas como capoeiristas. Domínio de armas (navalha, canivete, faca, punhal) sugere conexão com a cultura da capoeiragem.\n\nVALENTONAS CONTEMPORÂNEAS (1910s-1920s):\n- Salomé (ativa 1920s-1930s)\n- Maria Doze Homens\n- Chicão (Francisca Albino dos Santos, matou Pedro Porreta 1929)\n- Rosa Palmeirão (Cândida Rosa de Jesus)\n- Massú\n- Catu\n- Almerinda\n- Menininha\n- Adelaide Presepeira (1920s-1930s)\n- Idalina (presa várias vezes 1910s-1920s)\n\nFONTES PRIMÁRIAS:\n- Antônio Vianna, "Casos e coisas da Bahia" (1950, 1984)\n- Pedro Abib, "Mestres e capoeiras famosos da Bahia" (2009)\n- Paula Juliana Foltran, "Mulheres incorrigíveis" tese PhD (UnB, 2019)\n- Arquivos de jornais: Jornal de Notícias, Gazeta do Povo (1910s-1920s)'
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
