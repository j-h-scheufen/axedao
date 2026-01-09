-- ============================================================
-- GENEALOGY PERSON: Domingos Magalhães
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- No birth date documented. Active at Gengibirra/Liberdade roda
-- pre-1941 as an established mestre alongside contemporaries like
-- Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894).
-- In 1969, Mestre Pastinha still named him as one of the capable
-- mestres who could organize a Federation - suggesting he was
-- alive and active, but by then would be ~69 years old. If active
-- as a mestre in the 1930s, likely born ~1890-1910.
-- Using 1900 as midpoint estimate with decade precision.
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,  -- Full name unknown (Domingos Magalhães or Domingos de Magalhães is likely full name)
  'Domingos Magalhães',
  NULL,  -- No formal title documented
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3', 'https://velhosmestres.com/en/pastinha-1969']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola. Domingos Magalhães was part of the Sunday gatherings at Gengibirra/Liberdade where practitioners played "not worrying about the styles of the fight or about the exhibition" - suggesting an informal, traditional approach focused on the pure practice of capoeira angola.',
  E'Capoeira de Angola tradicional. Domingos Magalhães fazia parte das reuniões dominicais no Gengibirra/Liberdade onde os praticantes jogavam "sem se preocupar com os estilos de luta ou com a exibição" - sugerindo uma abordagem informal e tradicional focada na prática pura da capoeira angola.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- bio_en
  E'Domingos Magalhães (also referred to as Domingos de Magalhães) was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of traditional capoeira angola practitioners who gathered at the Liberdade/Gengibirra neighborhood in Salvador before the formalization of capoeira academies.

The primary documentation of Domingos Magalhães comes from two 1969 newspaper articles in A Tarde, reproduced at velhosmestres.com. One article commemorating the anniversary of Mestre Pastinha''s academy described the informal Sunday gatherings at Gengibirra where "many capoeiristas got together on Sundays to play capoeira de Angola, not worrying about the styles of the fight or about the exhibition." They formed an "academia" (in the informal sense of a regular gathering), presided over by the civil guard Amorzinho.

Domingos Magalhães is listed among the mestres who participated in this gathering, alongside Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Eulâmpio, Butique, and others. This places him among a notable generation of capoeira angola practitioners.

In a separate 1969 interview, when asked about capoeira leadership and federation organization, Mestre Pastinha specifically named Domingos de Magalhães among the capable mestres who could "make a good work": "There''s Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, not me, I don''t see any more, but these mestres could make a good work." This endorsement from Pastinha places Domingos Magalhães among the most respected capoeira angola mestres of his generation - those Pastinha considered capable of organizational leadership.

Notably, while Domingos Magalhães participated in the Liberdade roda, he was not among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola listed in Mestre Noronha''s manuscripts. Those founders included Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno, and Paquete do Cabula. This suggests Domingos Magalhães was a regular participant in the rodas and a respected mestre, but not an organizational founder of the formal centro in the 1920s.

In 1941, Mestre Pastinha was invited to witness the Sunday roda at Gengibirra by his former student Aberrê. The civil guard Amorzinho then handed leadership of the group to Pastinha, who founded the Centro Esportivo de Capoeira Angola (CECA). What became of Domingos Magalhães after this transition is undocumented, though Pastinha''s 1969 interview suggests he was still active or at least remembered as a capable leader at that time.',
  -- bio_pt
  E'Domingos Magalhães (também referido como Domingos de Magalhães) foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de praticantes tradicionais de capoeira angola que se reuniam no bairro da Liberdade/Gengibirra em Salvador antes da formalização das academias de capoeira.

A documentação principal de Domingos Magalhães vem de dois artigos de jornal de 1969 no A Tarde, reproduzidos em velhosmestres.com. Um artigo comemorando o aniversário da academia de Mestre Pastinha descrevia as reuniões informais de domingo no Gengibirra onde "muitos capoeiristas se reuniam aos domingos para jogar capoeira de Angola, sem se preocupar com os estilos de luta ou com a exibição." Eles formavam uma "academia" (no sentido informal de uma reunião regular), presidida pelo guarda civil Amorzinho.

Domingos Magalhães é listado entre os mestres que participavam dessa reunião, junto com Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Bulgário, Barbosa, Américo Ciência, Eulâmpio, Butique e outros. Isso o coloca entre uma geração notável de praticantes de capoeira angola.

Em uma entrevista separada de 1969, quando questionado sobre liderança da capoeira e organização de federação, Mestre Pastinha especificamente nomeou Domingos de Magalhães entre os mestres capazes que poderiam "fazer um bom trabalho": "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, eu não, não vejo mais, mas esses mestres poderiam fazer um bom trabalho." Este endosso de Pastinha coloca Domingos Magalhães entre os mestres de capoeira angola mais respeitados de sua geração - aqueles que Pastinha considerava capazes de liderança organizacional.

Notavelmente, embora Domingos Magalhães participasse da roda da Liberdade, ele não estava entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola listados nos manuscritos de Mestre Noronha. Esses fundadores incluíam Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno e Paquete do Cabula. Isso sugere que Domingos Magalhães era um participante regular das rodas e um mestre respeitado, mas não um fundador organizacional do centro formal nos anos 1920.

Em 1941, Mestre Pastinha foi convidado a assistir à roda de domingo no Gengibirra por seu antigo aluno Aberrê. O guarda civil Amorzinho então passou a liderança do grupo para Pastinha, que fundou o Centro Esportivo de Capoeira Angola (CECA). O que aconteceu com Domingos Magalhães após essa transição não está documentado, embora a entrevista de Pastinha em 1969 sugira que ele ainda estava ativo ou pelo menos era lembrado como um líder capaz naquela época.',
  -- achievements_en
  E'- Active participant at the historic Liberdade/Gengibirra roda (pre-1941)
- Named by Mestre Pastinha (1969) among the mestres capable of organizing a capoeira federation',
  -- achievements_pt
  E'- Participante ativo na histórica roda da Liberdade/Gengibirra (pré-1941)
- Nomeado por Mestre Pastinha (1969) entre os mestres capazes de organizar uma federação de capoeira',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade precision):
No birth date documented. Active at Gengibirra/Liberdade roda pre-1941 as an established participant alongside contemporaries like Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). In 1969, Pastinha still named him as a capable organizational leader, suggesting he was active or remembered at that time (~69 years old if born 1900). Using 1900 as midpoint estimate.

DEATH YEAR: Unknown. Alive or remembered as capable leader in 1969. Not listed among Pastinha''s 1967 list of deceased angoleiros de briga.

NAME VARIATION:
- "Domingos Magalhães" - Used in A Tarde Feb 24, 1969 article (velhosmestres.com/en/pastinha-1969-3)
- "Domingos de Magalhães" - Used by Pastinha in 1969 interview (velhosmestres.com/en/pastinha-1969)
The "de" is a common Portuguese surname connector; both refer to same person.

DOCUMENTATION:
Two primary sources from 1969, both reproduced at velhosmestres.com:
1. A Tarde, February 24, 1969 - Lists him among Liberdade roda mestres
2. Mestre Pastinha 1969 interview - Names him as capable Federation organizer

NOT A GENGIBIRRA FOUNDER: While Domingos Magalhães participated in the Liberdade roda, he is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola in Mestre Noronha''s manuscripts. This suggests different levels of involvement: the 22 founders were organizational leaders, while others like Domingos Magalhães were regular participants in the rodas.

PASTINHA''S ENDORSEMENT (1969):
Pastinha explicitly named him as one of the capable mestres who could organize a Federation: "There''s Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, not me, I don''t see any more, but these mestres could make a good work." This places him in the top tier of respected Angola mestres.

GENGIBIRRA RODA CONTEMPORARIES (pre-1941):
- Amorzinho (civil guard, roda president) - imported
- Totonho de Maré (Antônio Laurindo das Neves) - imported
- Mestre Noronha (Daniel Coutinho) - imported
- Livino (brother of Noronha) - imported
- Américo Ciência - imported
- Barbosa - imported
- Eulâmpio - imported
- Bulgário - imported
- Alemão - in backlog (as Alemão (Gengibirra))
- Butique - imported
- Antônio - in backlog (as Antônio (Gengibirra))',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década):
Nenhuma data de nascimento documentada. Ativo na roda do Gengibirra/Liberdade antes de 1941 como participante estabelecido junto com contemporâneos como Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). Em 1969, Pastinha ainda o nomeou como líder organizacional capaz, sugerindo que estava ativo ou lembrado naquela época (~69 anos se nascido em 1900). Usando 1900 como estimativa do ponto médio.

ANO DE MORTE: Desconhecido. Vivo ou lembrado como líder capaz em 1969. Não listado entre a lista de 1967 de Pastinha de angoleiros de briga falecidos.

VARIAÇÃO DE NOME:
- "Domingos Magalhães" - Usado no artigo A Tarde 24 de fevereiro de 1969 (velhosmestres.com/en/pastinha-1969-3)
- "Domingos de Magalhães" - Usado por Pastinha em entrevista de 1969 (velhosmestres.com/en/pastinha-1969)
O "de" é um conector de sobrenome comum em português; ambos referem-se à mesma pessoa.

DOCUMENTAÇÃO:
Duas fontes primárias de 1969, ambas reproduzidas em velhosmestres.com:
1. A Tarde, 24 de fevereiro de 1969 - Lista-o entre os mestres da roda da Liberdade
2. Entrevista de Mestre Pastinha 1969 - Nomeia-o como organizador capaz de Federação

NÃO É FUNDADOR DO GENGIBIRRA: Embora Domingos Magalhães participasse da roda da Liberdade, ele NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola nos manuscritos de Mestre Noronha. Isso sugere diferentes níveis de envolvimento: os 22 fundadores eram líderes organizacionais, enquanto outros como Domingos Magalhães eram participantes regulares das rodas.

ENDOSSO DE PASTINHA (1969):
Pastinha explicitamente o nomeou como um dos mestres capazes que poderiam organizar uma Federação: "Tem Antonio de Maré, Levino Diogo, Noronha Daniel, Eulâmpio, Domingos de Magalhães, eu não, não vejo mais, mas esses mestres poderiam fazer um bom trabalho." Isso o coloca no nível mais alto de mestres de Angola respeitados.

CONTEMPORÂNEOS DA RODA DO GENGIBIRRA (pré-1941):
- Amorzinho (guarda civil, presidente da roda) - importado
- Totonho de Maré (Antônio Laurindo das Neves) - importado
- Mestre Noronha (Daniel Coutinho) - importado
- Livino (irmão de Noronha) - importado
- Américo Ciência - importado
- Barbosa - importado
- Eulâmpio - importado
- Bulgário - importado
- Alemão - no backlog (como Alemão (Gengibirra))
- Butique - importado
- Antônio - no backlog (como Antônio (Gengibirra))'
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
