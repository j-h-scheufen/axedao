-- ============================================================
-- GENEALOGY PERSON: Bulgário
-- Generated: 2026-01-02
-- ============================================================
-- BIRTH YEAR ESTIMATION (1900, decade precision):
-- No birth date documented. Active at Gengibirra/Liberdade roda
-- pre-1941 as an established mestre alongside contemporaries like
-- Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894).
-- If active as a mestre in the 1930s, likely born ~1890-1910.
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
  NULL,  -- Full name unknown
  'Bulgário',
  NULL,  -- No formal title documented
  NULL,
  ARRAY['https://velhosmestres.com/en/pastinha-1969-3']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira de Angola. Bulgário was part of the Sunday gatherings at Gengibirra/Liberdade where practitioners played "not worrying about the styles of the fight or about the exhibition" - suggesting an informal, traditional approach focused on the pure practice of capoeira angola.',
  E'Capoeira de Angola tradicional. Bulgário fazia parte das reuniões dominicais no Gengibirra/Liberdade onde os praticantes jogavam "sem se preocupar com os estilos de luta ou com a exibição" - sugerindo uma abordagem informal e tradicional focada na prática pura da capoeira angola.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,
  -- Extended content (bio_en)
  E'Bulgário was a capoeirista of Salvador, Bahia, active during the early-to-mid 20th century. He belonged to the generation of traditional capoeira angola practitioners who gathered at the Liberdade/Gengibirra neighborhood in Salvador before the formalization of capoeira academies.

The primary documentation of Bulgário comes from a 1969 newspaper article in A Tarde commemorating the anniversary of Mestre Pastinha''s academy. The article described the informal Sunday gatherings at Gengibirra where "many capoeiristas got together on Sundays to play capoeira de Angola, not worrying about the styles of the fight or about the exhibition." They formed an "academia" (in the informal sense of a regular gathering), presided over by the civil guard Amorzinho.

Bulgário is listed among the mestres who participated in this gathering, alongside Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Barbosa, Américo Ciência, Domingos Magalhães, Eulâmpio, Butique, and others. This places him among a notable generation of capoeira angola practitioners.

Notably, while Bulgário participated in the Liberdade roda, he was not among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola listed in Mestre Noronha''s manuscripts. Those founders included Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno, and Paquete do Cabula. This suggests Bulgário was a regular participant in the rodas but not an organizational founder of the formal centro.

In 1941, Mestre Pastinha was invited to witness the Sunday roda at Gengibirra by his former student Aberrê. The civil guard Amorzinho then handed leadership of the group to Pastinha, who founded the Centro Esportivo de Capoeira Angola (CECA). What became of Bulgário after this transition is undocumented.

Bulgário''s apelido is unusual in Portuguese - it is the adjective form of "Bulgária" (Bulgaria). How he acquired this nickname and its significance remain unknown.',
  -- bio_pt
  E'Bulgário foi um capoeirista de Salvador, Bahia, ativo durante o início e meados do século XX. Ele pertenceu à geração de praticantes tradicionais de capoeira angola que se reuniam no bairro da Liberdade/Gengibirra em Salvador antes da formalização das academias de capoeira.

A documentação principal de Bulgário vem de um artigo de jornal de 1969 no A Tarde comemorando o aniversário da academia de Mestre Pastinha. O artigo descrevia as reuniões informais de domingo no Gengibirra onde "muitos capoeiristas se reuniam aos domingos para jogar capoeira de Angola, sem se preocupar com os estilos de luta ou com a exibição." Eles formavam uma "academia" (no sentido informal de uma reunião regular), presidida pelo guarda civil Amorzinho.

Bulgário é listado entre os mestres que participavam dessa reunião, junto com Antônio, Maré (Totonho de Maré), Daniel (Mestre Noronha), Livino Diogo, Alemão, Barbosa, Américo Ciência, Domingos Magalhães, Eulâmpio, Butique e outros. Isso o coloca entre uma geração notável de praticantes de capoeira angola.

Notavelmente, embora Bulgário participasse da roda da Liberdade, ele não estava entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola listados nos manuscritos de Mestre Noronha. Esses fundadores incluíam Noronha, Livino, Maré, Amorzinho, Raimundo ABR, Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehi, Feliciano Bigode de Seda, Bonome, Henrique Cara Queimada, Onça Preta, Cimento, Algemiro Grande Olho de Pombo, Antonio Galindo, Antonio Boca de Porco, Candido Pequeno, Lúcio Pequeno e Paquete do Cabula. Isso sugere que Bulgário era um participante regular das rodas mas não um fundador organizacional do centro formal.

Em 1941, Mestre Pastinha foi convidado a assistir à roda de domingo no Gengibirra por seu antigo aluno Aberrê. O guarda civil Amorzinho então passou a liderança do grupo para Pastinha, que fundou o Centro Esportivo de Capoeira Angola (CECA). O que aconteceu com Bulgário após essa transição não está documentado.

O apelido de Bulgário é incomum em português - é a forma adjetiva de "Bulgária". Como ele adquiriu esse apelido e seu significado permanecem desconhecidos.',
  -- achievements_en
  NULL,  -- No documented achievements
  -- achievements_pt
  NULL,
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1900, decade precision):
No birth date documented. Active at Gengibirra/Liberdade roda pre-1941 as an established participant alongside contemporaries like Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). If active as a practitioner in the 1930s, likely born ~1890-1910. Using 1900 as midpoint estimate.

DEATH YEAR: Unknown. Not listed among Pastinha''s 1967 list of deceased angoleiros de briga, but this does not confirm he was alive at that time.

DOCUMENTATION: Single primary source only - A Tarde newspaper article, February 24, 1969, reproduced at velhosmestres.com. No additional biographical information found in any other source.

NOT A GENGIBIRRA FOUNDER: While Bulgário participated in the Liberdade roda, he is NOT listed among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola in Mestre Noronha''s manuscripts. This suggests different levels of involvement: the 22 founders were organizational leaders, while others like Bulgário were regular participants in the rodas.

APELIDO: "Bulgário" is the Portuguese adjective meaning "Bulgarian". The origin of this nickname is unknown. It could reference physical characteristics, an association with Bulgaria, or have another origin lost to history.

CONTEMPORARIES AT GENGIBIRRA:
- Amorzinho (civil guard, roda president) - imported
- Totonho de Maré (Antônio Laurindo das Neves) - imported
- Mestre Noronha (Daniel Coutinho) - imported
- Livino (brother of Noronha) - imported
- Américo Ciência - imported
- Barbosa - imported
- Eulâmpio - imported
- Alemão - NOT imported (needs backlog)
- Domingos Magalhães - imported
- Butique - imported
- Antônio - unclear which Antônio, needs investigation',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década):
Nenhuma data de nascimento documentada. Ativo na roda do Gengibirra/Liberdade antes de 1941 como participante estabelecido junto com contemporâneos como Américo Ciência (~1900), Amorzinho (~1895), Totonho de Maré (1894). Se ativo como praticante na década de 1930, provavelmente nascido ~1890-1910. Usando 1900 como estimativa do ponto médio.

ANO DE MORTE: Desconhecido. Não listado entre a lista de 1967 de Pastinha de angoleiros de briga falecidos, mas isso não confirma que estava vivo naquela época.

DOCUMENTAÇÃO: Apenas uma fonte primária - artigo do jornal A Tarde, 24 de fevereiro de 1969, reproduzido em velhosmestres.com. Nenhuma informação biográfica adicional encontrada em qualquer outra fonte.

NÃO É FUNDADOR DO GENGIBIRRA: Embora Bulgário participasse da roda da Liberdade, ele NÃO está listado entre os 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola nos manuscritos de Mestre Noronha. Isso sugere diferentes níveis de envolvimento: os 22 fundadores eram líderes organizacionais, enquanto outros como Bulgário eram participantes regulares das rodas.

APELIDO: "Bulgário" é o adjetivo português significando "búlgaro". A origem deste apelido é desconhecida. Poderia referenciar características físicas, uma associação com a Bulgária, ou ter outra origem perdida na história.

CONTEMPORÂNEOS NO GENGIBIRRA:
- Amorzinho (guarda civil, presidente da roda) - importado
- Totonho de Maré (Antônio Laurindo das Neves) - importado
- Mestre Noronha (Daniel Coutinho) - importado
- Livino (irmão de Noronha) - importado
- Américo Ciência - importado
- Barbosa - importado
- Eulâmpio - importado
- Alemão - NÃO importado (precisa backlog)
- Domingos Magalhães - importado
- Butique - importado
- Antônio - não está claro qual Antônio, precisa investigação'
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
