-- ============================================================
-- GENEALOGY PERSON: Saci
-- Generated: 2025-12-25
-- ============================================================
-- BIRTH DATE: March 16, 1945 per UNICAR München and multiple sources
-- TITLE: Received mestre cord in 2007
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
  'Josevaldo Lima de Jesus',
  'Saci',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.capoeira-muenchen.de/en/capoeira/the-masters', 'https://capoeira-regional.eu/grupo-unicar/biografie/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Direct student of Mestre Bimba who trained for many years at the Centro de Cultura Física e Luta Regional. Witnessed significant historical events in the development of Capoeira Regional in Bahia. Known for teaching at military police facilities and for introducing new students to Bimba''s academy.',
  E'Aluno direto de Mestre Bimba que treinou por muitos anos no Centro de Cultura Física e Luta Regional. Testemunhou eventos históricos significativos no desenvolvimento da Capoeira Regional na Bahia. Conhecido por ensinar em instalações da polícia militar e por introduzir novos alunos à academia de Bimba.',
  -- Life dates
  1945,
  'exact'::genealogy.date_precision,
  'Santa Barbara, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Josevaldo Lima de Jesus, known as Mestre Saci, was born on March 16, 1945, in Santa Barbara in the state of Bahia. In July 1964, at age 19, he began his formal training in Capoeira Regional at the legendary academy of Mestre Bimba in Salvador—the Centro de Cultura Física e Luta Regional.

Saci trained for many years directly under Mestre Bimba, becoming one of his dedicated disciples during the final active decade of the master''s teaching in Salvador. This extended training period made him a firsthand witness to significant historical developments in Capoeira Regional and at Bimba''s academy. He experienced the evolution of the art during a transformative era, providing him with deep knowledge of Bimba''s methods, philosophy, and the capoeira community of that time.

Beyond his own training, Saci played an important role in introducing new practitioners to Capoeira Regional. In the mid-1960s, while serving in the Military Police, he met Eziquiel Martins Marinho (later known as Mestre Ezequiel). Saci introduced Ezequiel to Capoeira Regional, first training him at the Quartel dos Dendezeiros—the Military Police barracks in the Itapagipe neighborhood of Salvador. After this initial instruction, Saci brought Ezequiel to Mestre Bimba''s academy, where Ezequiel would go on to become one of Bimba''s most faithful disciples and a two-time Brazilian Capoeira Champion.

In the 1980s, Saci continued his teaching work at the Polo Estudantil da Capoeira, located in the Ginásio do Esporte at Vila Militar in the Bonfim neighborhood of Salvador. There, beginning in 1980, he trained students including Isnaldo da Silva Sacramento, who would later become known as Mestre Binal and dedicate over 36 years to teaching capoeira throughout Bahia.

In 2007, Saci received recognition of his mastery with the formal conferral of the Mestre cord. His role in the broader Capoeira Regional community extended to conferring titles on the next generation: he awarded the Mestre cord to Nelsinho (Nelson Batista) in 2006 and to Saguin in 2007. These mestres would go on to co-found UNICAR (União Internacional de Capoeira Regional) in 2003 and spread Capoeira Regional throughout Europe.

Saci was honored at the Capoeira Regional Centenary celebration that paid tribute to Mestre Bimba, alongside other distinguished mestres including Pombo de Ouro (José Bispo Correia), Itapoan (Raimundo César Alves de Almeida), and Deputado. He has continued to be active in the capoeira community, visiting mestres associated with UNICAR in Munich and other locations, helping to preserve the direct lineage and teachings of Mestre Bimba.

His title "DR." (as noted by his student Mestre Binal) suggests an academic or professional degree alongside his capoeira mastery, though details of this credential remain undocumented.',
  -- bio_pt
  E'Josevaldo Lima de Jesus, conhecido como Mestre Saci, nasceu em 16 de março de 1945, em Santa Barbara, no estado da Bahia. Em julho de 1964, aos 19 anos, começou seu treinamento formal em Capoeira Regional na lendária academia de Mestre Bimba em Salvador—o Centro de Cultura Física e Luta Regional.

Saci treinou por muitos anos diretamente com Mestre Bimba, tornando-se um de seus discípulos dedicados durante a última década ativa do mestre ensinando em Salvador. Este período prolongado de treinamento o tornou testemunha em primeira mão de desenvolvimentos históricos significativos na Capoeira Regional e na academia de Bimba. Ele vivenciou a evolução da arte durante uma era transformadora, proporcionando-lhe profundo conhecimento dos métodos de Bimba, sua filosofia e a comunidade de capoeira daquela época.

Além de seu próprio treinamento, Saci desempenhou um papel importante na introdução de novos praticantes à Capoeira Regional. Em meados dos anos 1960, enquanto servia na Polícia Militar, conheceu Eziquiel Martins Marinho (mais tarde conhecido como Mestre Ezequiel). Saci apresentou Ezequiel à Capoeira Regional, primeiro treinando-o no Quartel dos Dendezeiros—o quartel da Polícia Militar no bairro de Itapagipe em Salvador. Após esta instrução inicial, Saci levou Ezequiel à academia de Mestre Bimba, onde Ezequiel se tornaria um dos discípulos mais fiéis de Bimba e bicampeão Brasileiro de Capoeira.

Nos anos 1980, Saci continuou seu trabalho de ensino no Polo Estudantil da Capoeira, localizado no Ginásio do Esporte na Vila Militar no bairro do Bonfim em Salvador. Lá, a partir de 1980, treinou alunos incluindo Isnaldo da Silva Sacramento, que mais tarde se tornaria conhecido como Mestre Binal e dedicaria mais de 36 anos ao ensino da capoeira em toda a Bahia.

Em 2007, Saci recebeu o reconhecimento de sua maestria com a conferência formal do cordão de Mestre. Seu papel na comunidade mais ampla da Capoeira Regional se estendeu à concessão de títulos para a próxima geração: ele concedeu o cordão de Mestre a Nelsinho (Nelson Batista) em 2006 e a Saguin em 2007. Estes mestres iriam co-fundar a UNICAR (União Internacional de Capoeira Regional) em 2003 e espalhar a Capoeira Regional por toda a Europa.

Saci foi homenageado na celebração do Centenário da Capoeira Regional que prestou tributo a Mestre Bimba, junto com outros mestres ilustres incluindo Pombo de Ouro (José Bispo Correia), Itapoan (Raimundo César Alves de Almeida) e Deputado. Ele continua ativo na comunidade de capoeira, visitando mestres associados à UNICAR em Munique e outros locais, ajudando a preservar a linhagem direta e os ensinamentos de Mestre Bimba.

Seu título "DR." (como notado por seu aluno Mestre Binal) sugere um grau acadêmico ou profissional além de sua maestria na capoeira, embora detalhes desta credencial permaneçam não documentados.',
  -- achievements_en
  E'Direct student of Mestre Bimba (July 1964 - 1974); First teacher of Mestre Ezequiel (introduced him to Capoeira Regional); Received Mestre cord (2007); Conferred Mestre title to Nelsinho (2006); Conferred Mestre title to Saguin (2007); Taught at Quartel dos Dendezeiros Military Police barracks; Taught at Vila Militar sports gymnasium (1980s); Honored at Capoeira Regional Centenary celebration; Witness to historical developments at Mestre Bimba''s academy',
  -- achievements_pt
  E'Aluno direto de Mestre Bimba (julho 1964 - 1974); Primeiro professor de Mestre Ezequiel (apresentou-o à Capoeira Regional); Recebeu cordão de Mestre (2007); Conferiu título de Mestre a Nelsinho (2006); Conferiu título de Mestre a Saguin (2007); Ensinou no Quartel dos Dendezeiros da Polícia Militar; Ensinou no Ginásio do Esporte na Vila Militar (anos 1980); Homenageado na celebração do Centenário da Capoeira Regional; Testemunha de desenvolvimentos históricos na academia de Mestre Bimba',
  -- notes_en
  E'BIRTH DATE (1945, exact):
March 16, 1945 per UNICAR München, UNICAR Berlin, and multiple consistent sources.

NAME DISCREPANCY:
- "Josevaldo Lima de Jesus" - used in academic/formal contexts (Mestre Binal source)
- "Valdo Jose Lima de Jesus" - used in UNICAR München German source
Using "Josevaldo" as it appears in the more formal Portuguese-language sources and the Ezequiel report.

TITLE "DR.":
Mestre Binal refers to him as "DR. Josevaldo Lima de Jesus" suggesting an academic or professional title beyond capoeira. Nature of this credential unknown.

MESTRE TITLE (2007):
Received Mestre cord and certificate in 2007. Source unclear on who conferred the title.

TEACHERS:
- Mestre Bimba (July 1964 - 1974, primary teacher at CCFR)

STUDENTS:
- Mestre Ezequiel (Eziquiel Martins Marinho) - first trained at Quartel dos Dendezeiros, mid-1960s; brought to Bimba''s academy
- Mestre Binal (Isnaldo da Silva Sacramento) - trained at Vila Militar from 1980

TITLE CONFERRALS:
- Mestre Nelsinho (Nelson Batista) - Mestre cord 2006
- Mestre Saguin - Mestre cord and certificate 2007

TEACHING LOCATIONS:
- Quartel dos Dendezeiros - Military Police barracks, Itapagipe neighborhood, Salvador (mid-1960s)
- Polo Estudantil da Capoeira, Ginásio do Esporte, Vila Militar, Bonfim neighborhood, Salvador (1980+)

HONORS:
- Honored at Capoeira Regional Centenary alongside Pombo de Ouro, Itapoan, Deputado

UNICAR CONNECTION:
Listed among visiting mestres to UNICAR in Munich over 25 years. Nelsinho and Saguin (who received titles from Saci) co-founded UNICAR in 2003.

TIMELINE:
- 1945: Born March 16 in Santa Barbara, Bahia
- 1964 (July): Began training at Mestre Bimba''s academy
- Mid-1960s: Trained Ezequiel at Quartel dos Dendezeiros; brought him to Bimba
- 1974: Bimba died February 5
- 1980+: Teaching at Vila Militar, Bonfim (trained Binal)
- 2006: Conferred Mestre title to Nelsinho
- 2007: Received Mestre cord; conferred Mestre title to Saguin
- Present: Active in capoeira community, visits UNICAR Europe',
  -- notes_pt
  E'DATA DE NASCIMENTO (1945, exata):
16 de março de 1945 conforme UNICAR München, UNICAR Berlin e múltiplas fontes consistentes.

DISCREPÂNCIA DE NOME:
- "Josevaldo Lima de Jesus" - usado em contextos acadêmicos/formais (fonte Mestre Binal)
- "Valdo Jose Lima de Jesus" - usado na fonte alemã UNICAR München
Usando "Josevaldo" pois aparece nas fontes mais formais em português e no relatório de Ezequiel.

TÍTULO "DR.":
Mestre Binal refere-se a ele como "DR. Josevaldo Lima de Jesus" sugerindo um título acadêmico ou profissional além da capoeira. Natureza desta credencial desconhecida.

TÍTULO DE MESTRE (2007):
Recebeu cordão e certificado de Mestre em 2007. Fonte não esclarece quem conferiu o título.

PROFESSORES:
- Mestre Bimba (julho 1964 - 1974, professor principal no CCFR)

ALUNOS:
- Mestre Ezequiel (Eziquiel Martins Marinho) - primeiro treinou no Quartel dos Dendezeiros, meados dos anos 1960; levado à academia de Bimba
- Mestre Binal (Isnaldo da Silva Sacramento) - treinou na Vila Militar a partir de 1980

CONFERÊNCIAS DE TÍTULO:
- Mestre Nelsinho (Nelson Batista) - cordão de Mestre 2006
- Mestre Saguin - cordão e certificado de Mestre 2007

LOCAIS DE ENSINO:
- Quartel dos Dendezeiros - Quartel da Polícia Militar, bairro de Itapagipe, Salvador (meados dos anos 1960)
- Polo Estudantil da Capoeira, Ginásio do Esporte, Vila Militar, bairro do Bonfim, Salvador (1980+)

HONRARIAS:
- Homenageado no Centenário da Capoeira Regional junto com Pombo de Ouro, Itapoan, Deputado

CONEXÃO UNICAR:
Listado entre os mestres visitantes da UNICAR em Munique por mais de 25 anos. Nelsinho e Saguin (que receberam títulos de Saci) co-fundaram a UNICAR em 2003.

CRONOLOGIA:
- 1945: Nasceu 16 de março em Santa Barbara, Bahia
- 1964 (julho): Começou a treinar na academia de Mestre Bimba
- Meados dos anos 1960: Treinou Ezequiel no Quartel dos Dendezeiros; levou-o a Bimba
- 1974: Bimba morreu em 5 de fevereiro
- 1980+: Ensinando na Vila Militar, Bonfim (treinou Binal)
- 2006: Conferiu título de Mestre a Nelsinho
- 2007: Recebeu cordão de Mestre; conferiu título de Mestre a Saguin
- Presente: Ativo na comunidade de capoeira, visita UNICAR Europa'
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
