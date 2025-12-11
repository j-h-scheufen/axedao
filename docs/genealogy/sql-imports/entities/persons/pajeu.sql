-- ============================================================
-- GENEALOGY PERSON: Pajéu
-- Migrated: 2025-12-11
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
  -- Extended content
  bio_en,
  bio_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL, -- Full name unknown; common for sertanejo malfeitores of this era
  'Pajéu',
  NULL, -- Not a legitimate capoeirista; no formal title
  NULL, -- No historical portrait exists
  '[]'::jsonb,
  -- Capoeira-specific
  NULL, -- Not a true capoeirista; pretended to be one
  'Not a legitimate capoeirista despite pretensions. Known for knife fighting (peixeira) rather than capoeira technique. Represented the type of valentão (tough guy) who falsely claimed capoeira skill.',
  'Não era um capoeirista legítimo apesar das pretensões. Conhecido por luta de faca (peixeira) ao invés de técnica de capoeira. Representava o tipo de valentão que falsamente reivindicava habilidade em capoeira.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Sertão pernambucano, Pernambuco, Brazil',
  -- bio_en
  E'Pajéu was a valentão (tough guy) who came from the Pernambuco sertão (hinterlands) to Recife in the late 19th century. He became known as a malfeitor (wrongdoer) in the São José neighborhood, with a reputation for pretending to be a capoeirista and for beating women—behavior that particularly disgusted the legendary Nascimento Grande.\n\nPajéu''s name appears in the historical record primarily through his ill-fated challenge to Nascimento Grande. Like other famous fighters from across Brazil—Pirajé from Pará, Manezinho Camisa Preta from Rio de Janeiro, and João Sabe Tudo—Pajéu was drawn to test himself against the most feared capoeirista in Pernambuco.\n\nThe encounter became legendary for its swiftness and humiliation. Pajéu attacked Nascimento Grande with a peixeira (a type of knife used by sertanejos). According to multiple accounts, Nascimento Grande disarmed him in approximately two seconds—"tomou-lhe a peixeira em dois segundos." What followed was not merely a beating but a theatrical demonstration of dominance: Nascimento Grande forced Pajéu to wear women''s clothing and parade through the streets of Old Recife.\n\nThe public humiliation was particularly severe because the prostitutes of Recife—who loved Nascimento Grande and despised Pajéu for his treatment of women—applauded and laughed at his disgrace. The incident became part of Nascimento Grande''s legend: a man who not only defeated his challengers but did so in ways that reinforced social codes, punishing those who abused women or falsely claimed martial skill.\n\nPajéu represents a particular type in Brazilian fighting culture: the sertanejo tough guy who relied on weapons and intimidation rather than genuine martial skill, and whose pretensions were exposed when confronted by a true master.',
  -- bio_pt
  E'Pajéu foi um valentão que veio do sertão pernambucano para Recife no final do século XIX. Tornou-se conhecido como malfeitor do bairro São José, com reputação de se passar por capoeirista e de bater em mulheres—comportamento que particularmente enojava o lendário Nascimento Grande.\n\nO nome de Pajéu aparece no registro histórico principalmente através de seu desafio malogrado a Nascimento Grande. Como outros lutadores famosos de todo o Brasil—Pirajé do Pará, Manezinho Camisa Preta do Rio de Janeiro e João Sabe Tudo—Pajéu foi atraído a se testar contra o mais temido capoeirista de Pernambuco.\n\nO encontro tornou-se lendário por sua rapidez e humilhação. Pajéu atacou Nascimento Grande com uma peixeira (um tipo de faca usada pelos sertanejos). Segundo múltiplos relatos, Nascimento Grande o desarmou em aproximadamente dois segundos—"tomou-lhe a peixeira em dois segundos." O que se seguiu não foi meramente uma surra, mas uma demonstração teatral de dominância: Nascimento Grande obrigou Pajéu a vestir roupas de mulher e desfilar pelas ruas do Recife Velho.\n\nA humilhação pública foi particularmente severa porque as prostitutas do Recife—que amavam Nascimento Grande e desprezavam Pajéu por seu tratamento das mulheres—aplaudiram e riram de sua desgraça. O incidente tornou-se parte da lenda de Nascimento Grande: um homem que não apenas derrotava seus desafiantes, mas o fazia de maneiras que reforçavam códigos sociais, punindo aqueles que abusavam de mulheres ou falsamente reivindicavam habilidade marcial.\n\nPajéu representa um tipo particular na cultura de luta brasileira: o valentão sertanejo que dependia de armas e intimidação ao invés de verdadeira habilidade marcial, e cujas pretensões foram expostas quando confrontado por um verdadeiro mestre.',
  -- Researcher notes (English)
  E'BIRTH YEAR: Estimated 1860 with decade precision. No documentation exists for Pajéu''s birth. Estimation based on:\n- Active as challenger to Nascimento Grande (born 1842)\n- Contemporary with other challengers from 1880s-1900s period\n- Would need to be adult fighter during this timeframe\n- Decade precision (1860s) reflects uncertainty\n\nFULL NAME: Unknown. Common for malfeitores and valentões of this era, especially those from the sertão, to be known only by apelido.\n\nDEATH: Unknown. No record of Pajéu''s fate after the humiliation by Nascimento Grande.\n\nLOCATION: São José neighborhood, Recife, Pernambuco. One of the oldest and most historic neighborhoods of Recife.\n\nCLASSIFICATION: Not a legitimate capoeirista despite pretensions. Known for knife fighting with peixeira rather than capoeira technique. Represents the type of fake capoeirista that true practitioners despised.\n\nPEIXEIRA: A type of knife traditional to the Brazilian sertão, with a long, thin blade. Common weapon among sertanejos and valentões.',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: Estimado 1860 com precisão de década. Não existe documentação sobre o nascimento de Pajéu. Estimativa baseada em:\n- Ativo como desafiante de Nascimento Grande (nascido em 1842)\n- Contemporâneo com outros desafiantes do período 1880s-1900s\n- Precisaria ser lutador adulto durante este período\n- Precisão de década (1860s) reflete a incerteza\n\nNOME COMPLETO: Desconhecido. Comum para malfeitores e valentões desta era, especialmente aqueles do sertão, serem conhecidos apenas pelo apelido.\n\nMORTE: Desconhecida. Nenhum registro do destino de Pajéu após a humilhação por Nascimento Grande.\n\nLOCAL: Bairro São José, Recife, Pernambuco. Um dos bairros mais antigos e históricos do Recife.\n\nCLASSIFICAÇÃO: Não era um capoeirista legítimo apesar das pretensões. Conhecido por luta de faca com peixeira ao invés de técnica de capoeira. Representa o tipo de falso capoeirista que os verdadeiros praticantes desprezavam.\n\nPEIXEIRA: Um tipo de faca tradicional do sertão brasileiro, com lâmina longa e fina. Arma comum entre sertanejos e valentões.'
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
  bio_en = EXCLUDED.bio_en,
  bio_pt = EXCLUDED.bio_pt,
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();
