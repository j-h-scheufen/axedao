-- ============================================================
-- GENEALOGY GROUP: Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Migrated: 2025-12-11
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  style,
  logo,
  links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content (bilingual)
  description_en,
  description_pt,
  style_notes_en,
  style_notes_pt,
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Gengibirra',
  'angola'::genealogy.style,
  NULL,  -- No logo available for historical group
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-9"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-totonho-de-mare/"}, {"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/"}, {"type": "website", "url": "https://en.wikipedia.org/wiki/Capoeira_Angola"}]'::jsonb,
  -- Identity enhancements
  ARRAY['Centro Nacional de Capoeira de Origem Angola', 'Centro de Capoeira Angola', 'Roda do Gengibirra', 'Roda de Gengibirra', 'Jinjibirra'],
  '[{"name": "Centro Nacional de Capoeira de Origem Angola", "startedAt": "1920-01-01", "endedAt": "1941-02-23", "context": "Original name used by founders"}, {"name": "CECA (handed to Pastinha)", "startedAt": "1941-02-23", "context": "Transitioned to Mestre Pastinha, registered as Centro Esportivo de Capoeira Angola"}]'::jsonb,
  -- Founding details
  1920,
  'decade'::genealogy.date_precision,
  'Ladeira de Pedra, Liberdade, Salvador, Bahia, Brazil',
  -- Extended content (bilingual)
  E'Gengibirra was the first organized center for Capoeira Angola in the state of Bahia, founded in the 1920s at Ladeira de Pedra in the Liberdade neighborhood, Salvador. The center was established during a dangerous period - the Penal Code of 1890 criminalized capoeira with imprisonment of 2-6 months, and police chief Pedro Gordilho ("Pedrito") terrorized practitioners with his mounted cavalry from 1920-1927.\n\nAccording to Mestre Noronha''s manuscripts, 22 mestres founded the center, with four recognized as "donos e proprietarios" (organizational leaders): Noronha, his brother Livino, Totonho de Mare, and Amorzinho. The center adopted green and yellow - the colors of the Brazilian flag - as its official colors.\n\nAmorzinho''s role as a civil guard (guarda civil) was critical. Portal Capoeira states: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." As a uniformed preventive police officer, he could warn of operations, vouch for gatherings, and intervene if other officers arrived - providing institutional protection from within the system that persecuted capoeira.\n\nIn 1941, Amorzinho recognized Mestre Pastinha''s capabilities and handed him leadership. After Amorzinho''s death in 1943, "CECA was abandoned by all the Masters" - without their protector, the mestres scattered. Pastinha registered the center as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, where it became internationally famous.',
  E'O Gengibirra foi o primeiro centro organizado de Capoeira Angola no estado da Bahia, fundado na decada de 1920 na Ladeira de Pedra, no bairro da Liberdade, Salvador. O centro foi estabelecido durante um periodo perigoso - o Codigo Penal de 1890 criminalizava a capoeira com prisao de 2-6 meses, e o chefe de policia Pedro Gordilho ("Pedrito") aterrorizava praticantes com sua cavalaria montada de 1920 a 1927.\n\nDe acordo com os manuscritos de Mestre Noronha, 22 mestres fundaram o centro, com quatro reconhecidos como "donos e proprietarios" (lideres organizacionais): Noronha, seu irmao Livino, Totonho de Mare e Amorzinho. O centro adotou o verde e amarelo - as cores da bandeira brasileira - como suas cores oficiais.\n\nO papel de Amorzinho como guarda civil foi critico. O Portal Capoeira afirma: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." Como oficial uniformizado da policia preventiva, ele podia avisar sobre operacoes, atestar reunioes e intervir se outros oficiais chegassem - fornecendo protecao institucional de dentro do sistema que perseguia a capoeira.\n\nEm 1941, Amorzinho reconheceu as capacidades de Mestre Pastinha e lhe passou a lideranca. Apos a morte de Amorzinho em 1943, "o CECA foi abandonado por todos os Mestres" - sem seu protetor, os mestres se dispersaram. Pastinha registrou o centro como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, onde se tornou internacionalmente famoso.',
  -- Style notes (bilingual)
  E'Pre-stylistic era capoeira angola. The center established formal combat rules documented by Noronha: "The capoeirista who is dragged by a rasteira in a demonstration or a rabo de arraia or a joelhada or a balão boca de calças or a escoramento de coxa is considered defeated." This represents one of the earliest documented codifications of capoeira competition rules.',
  E'Capoeira angola da era pré-estilística. O centro estabeleceu regras formais de combate documentadas por Noronha: "O capoeirista que for arrastado por uma rasteira em uma demonstração ou um rabo de arraia ou uma joelhada ou um balão boca de calças ou um escoramento de coxa é considerado derrotado." Isso representa uma das primeiras codificações documentadas de regras de competição de capoeira.',
  -- Philosophy (bilingual)
  E'Preservation of traditional capoeira angola during the era of criminalization. The center served as a sanctuary where mestres could practice, teach, and preserve the art despite legal persecution. The green and yellow colors represented Brazilian national pride and the legitimacy of capoeira as a cultural practice.',
  E'Preservação da capoeira angola tradicional durante a era de criminalização. O centro serviu como um santuário onde os mestres podiam praticar, ensinar e preservar a arte apesar da perseguição legal. As cores verde e amarelo representavam o orgulho nacional brasileiro e a legitimidade da capoeira como prática cultural.',
  -- History (bilingual)
  E'Gengibirra traces its origins to the 1920s when capoeira was still criminalized in Brazil. The Penal Code of 1890 (Article 402) made "exercises of agility and bodily skill known by the denomination Capoeiragem" punishable by two to six months imprisonment, with gang membership as an aggravating factor. This law remained in effect until 1940.\n\nThe founding years of Gengibirra (1920s) coincided with the most intense period of persecution under Pedro de Azevedo Gordilho ("Pedrito"), the brutal police chief whose mounted cavalry terrorized capoeiristas throughout Salvador from 1920-1927. His persecution was so notorious that capoeiristas created the "Cavalaria" toque - a berimbau rhythm mimicking approaching horses - to warn when police were near.\n\nAccording to Mestre Noronha, before Gengibirra there was an earlier attempt to organize the "Conjunto de Capoeira de Angola Conceicao da Praia." The founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra included: Noronha, Livino, Mare (Totonho de Mare), Amorzinho, Raimundo ABR (Aberre), Percilio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pe de Abelha, Zehi, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada, Onca Preta, Cimento, Argemiro Grande, Olho de Pombo, Antonio Galindeu, Antonio Boca de Porco, Candido Pequeno (Argolinha de Ouro), Lucio Pequeno, and Paquete do Cabula.\n\nAmorzinho''s role as a civil guard (guarda civil) was critical to the center''s survival. Portal Capoeira states: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." As a uniformed member of the preventive police force, he could warn of planned operations, vouch for gatherings, and intervene if other officers arrived - providing institutional protection from within the system that persecuted capoeira.\n\nOn February 23, 1941, Mestre Aberre introduced Mestre Pastinha to the assembly. Amorzinho recognized Pastinha''s capabilities and asked him to assume leadership. According to Noronha''s manuscripts, after Amorzinho''s death (1943), the mestres formally handed the center to Pastinha. Sources note: "with Amorzinho''s death, CECA was abandoned by all the Masters" - without their protector within the system, the mestres scattered. The center would not fully recover until 1955.\n\nPastinha registered the center as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, where it became internationally famous.',
  E'O Gengibirra tem suas origens na decada de 1920, quando a capoeira ainda era criminalizada no Brasil. O Codigo Penal de 1890 (Artigo 402) tornava "exercicio de agilidade e destreza corporal conhecida pela denominacao Capoeiragem" punivel com dois a seis meses de prisao, com participacao em malta como agravante. Esta lei permaneceu em vigor ate 1940.\n\nOs anos de fundacao do Gengibirra (decada de 1920) coincidiram com o periodo mais intenso de perseguicao sob Pedro de Azevedo Gordilho ("Pedrito"), o brutal chefe de policia cuja cavalaria montada aterrorizou capoeiristas por toda Salvador de 1920 a 1927. Sua perseguicao foi tao notoria que os capoeiristas criaram o toque "Cavalaria" - um ritmo de berimbau imitando cavalos se aproximando - para avisar quando a policia estava perto.\n\nDe acordo com Mestre Noronha, antes do Gengibirra houve uma tentativa anterior de organizar o "Conjunto de Capoeira de Angola Conceicao da Praia." Os mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra incluiam: Noronha, Livino, Mare (Totonho de Mare), Amorzinho, Raimundo ABR (Aberre), Percilio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pe de Abelha, Zehi, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada, Onca Preta, Cimento, Argemiro Grande, Olho de Pombo, Antonio Galindeu, Antonio Boca de Porco, Candido Pequeno (Argolinha de Ouro), Lucio Pequeno e Paquete do Cabula.\n\nO papel de Amorzinho como guarda civil foi critico para a sobrevivencia do centro. O Portal Capoeira afirma: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." Como membro uniformizado da forca policial preventiva, ele podia avisar sobre operacoes planejadas, atestar reunioes e intervir se outros oficiais chegassem - fornecendo protecao institucional de dentro do sistema que perseguia a capoeira.\n\nEm 23 de fevereiro de 1941, Mestre Aberre apresentou Mestre Pastinha a assembleia. Amorzinho reconheceu as capacidades de Pastinha e pediu-lhe que assumisse a lideranca. De acordo com os manuscritos de Noronha, apos a morte de Amorzinho (1943), os mestres formalmente entregaram o centro a Pastinha. As fontes observam: "com o falecimento de Amorzinho, o CECA foi abandonado por todos os Mestres" - sem seu protetor dentro do sistema, os mestres se dispersaram. O centro so se recuperaria totalmente em 1955.\n\nPastinha registrou o centro como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, onde se tornou internacionalmente famoso.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true,  -- is_headquarters (original location)
  -- Status
  false,  -- is_active (transitioned to CECA in 1941)
  '1941-02-23'::date  -- dissolved_at (handed to Pastinha)
)
ON CONFLICT (name) DO UPDATE SET
  style = EXCLUDED.style,
  logo = EXCLUDED.logo,
  links = EXCLUDED.links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();
