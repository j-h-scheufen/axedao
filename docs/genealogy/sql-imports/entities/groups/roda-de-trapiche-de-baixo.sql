-- ============================================================
-- GENEALOGY GROUP: Roda de Trapiche de Baixo
-- Migrated: 2025-12-11
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  description_en,
  description_pt,
  style,
  style_notes_en,
  style_notes_pt,
  logo,
  public_links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content
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
  'Roda de Trapiche de Baixo',
  'An informal community of capoeiristas in Santo Amaro da Purificação, Bahia, centered around Besouro Mangangá and his companions. NOT a formal school—Trapiche de Baixo was a neighborhood where capoeiristas lived, trained together on Sundays and at folk festivals, and held memorable rodas. This proto-group represents the social structure through which capoeira was transmitted from African ex-slaves (Tio Alípio) to the legendary Besouro and his generation, and onward to Cobrinha Verde.',
  'Uma comunidade informal de capoeiristas em Santo Amaro da Purificação, Bahia, centrada em Besouro Mangangá e seus companheiros. NÃO era uma escola formal—Trapiche de Baixo era um bairro onde os capoeiristas viviam, treinavam juntos aos domingos e nas festas populares, e realizavam rodas memoráveis. Este proto-grupo representa a estrutura social através da qual a capoeira foi transmitida de ex-escravos africanos (Tio Alípio) ao lendário Besouro e sua geração, e daí para Cobrinha Verde.',
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. Included knife techniques, mandinga, and spiritual practices (corpo fechado).',
  'Era pré-codificação. Praticava capoeira baiana tradicional antes da divisão Angola/Regional. Incluía técnicas de faca, mandinga e práticas espirituais (corpo fechado).',
  NULL, -- No logo for informal historical group
  ARRAY['https://velhosmestres.com/en/besouro', 'https://papoeira.com/en/who-was-besouro-preto-de-manganga/']::text[],
  -- Identity enhancements
  ARRAY['Capoeira do Trapiche de Baixo'],
  '[]'::jsonb, -- No name changes
  -- Founding details
  1908, -- When Besouro began training; Tio Alípio arrived ~1888
  'approximate'::genealogy.date_precision,
  'Trapiche de Baixo, Santo Amaro da Purificação, Bahia, Brazil',
  -- Extended content (philosophy)
  NULL, -- No formal philosophy for informal group
  NULL, -- No formal philosophy for informal group
  -- history_en
  E'Trapiche de Baixo was a waterfront neighborhood in Santo Amaro da Purificação—described as "the poorest neighborhood of Santo Amaro." Around 1888, Tio Alípio, an African ex-slave and Babalaô from Dahomey who had been held at the Engenho Pantaleão sugar mill, moved to the area and began teaching capoeira.

Around 1908, the young Manoel Henrique Pereira (later Besouro Mangangá) moved to Trapiche de Baixo at age 13. One source describes the neighborhood as "a suburban zone of the city which becomes his school." He learned capoeira from Tio Alípio while working in the sugar cane fields.

A community formed around Besouro and his companions—Paulo Barroquinha, Boca de Siri (Siri de Mangue), Noca de Jacó, Doze Homens (Maria Doze Homens), and Canário Pardo—all residents of Trapiche de Baixo. They held "memorable capoeira rodas that hypnotized anybody that would go by" and trained together on Sundays and at folk festivals. Sources describe them as "a gang of capoeira resistance fighters who trained together on Sundays, and could always be relied upon to back one another up."

Because capoeira was illegal (criminalized in the 1890 Penal Code), training was done in secret. When police appeared, Besouro would send students away and face authorities alone.

Around 1912, Besouro began teaching his cousin Cobrinha Verde (age 4). When Besouro was killed in July 1924, "capoeira rodas across Bahia ceased for weeks as a sign of mourning." The informal community dispersed, though members continued practicing elsewhere. Siri de Mangue and Canário Pardo later taught Mestre Waldemar; Cobrinha Verde eventually worked with Mestre Pastinha and taught João Grande and João Pequeno.',
  -- history_pt
  E'Trapiche de Baixo era um bairro à beira-mar em Santo Amaro da Purificação—descrito como "o bairro mais pobre de Santo Amaro." Por volta de 1888, Tio Alípio, um ex-escravo africano e Babalaô do Daomé que havia sido mantido no Engenho Pantaleão, mudou-se para a área e começou a ensinar capoeira.

Por volta de 1908, o jovem Manoel Henrique Pereira (mais tarde Besouro Mangangá) mudou-se para Trapiche de Baixo aos 13 anos. Uma fonte descreve o bairro como "uma zona suburbana da cidade que se torna sua escola." Ele aprendeu capoeira com Tio Alípio enquanto trabalhava nos canaviais.

Uma comunidade se formou em torno de Besouro e seus companheiros—Paulo Barroquinha, Boca de Siri (Siri de Mangue), Noca de Jacó, Doze Homens (Maria Doze Homens) e Canário Pardo—todos moradores de Trapiche de Baixo. Eles realizavam "rodas de capoeira memoráveis que hipnotizavam qualquer um que passasse" e treinavam juntos aos domingos e nas festas populares. As fontes os descrevem como "uma turma de lutadores de resistência da capoeira que treinavam juntos aos domingos, e sempre podiam contar uns com os outros."

Como a capoeira era ilegal (criminalizada no Código Penal de 1890), o treinamento era feito em segredo. Quando a polícia aparecia, Besouro mandava os alunos embora e enfrentava as autoridades sozinho.

Por volta de 1912, Besouro começou a ensinar seu primo Cobrinha Verde (4 anos). Quando Besouro foi morto em julho de 1924, "rodas de capoeira em toda a Bahia cessaram por semanas em sinal de luto." A comunidade informal se dispersou, embora os membros continuassem praticando em outros lugares. Siri de Mangue e Canário Pardo mais tarde ensinaram Mestre Waldemar; Cobrinha Verde eventualmente trabalhou com Mestre Pastinha e ensinou João Grande e João Pequeno.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true, -- This was the only location
  -- Status
  false, -- Dissolved
  '1924-07-08'::date -- Besouro's death effectively ended the community
);
