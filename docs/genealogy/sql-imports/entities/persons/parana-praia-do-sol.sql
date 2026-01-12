-- ============================================================
-- GENEALOGY PERSON: Paraná (Praia do Sol)
-- Generated: 2026-01-11
-- ============================================================
-- NOTE: This is a DIFFERENT person from Paraná (Oswaldo Lisboa
-- dos Santos, 1922-1972). The apelido_context 'Praia do Sol'
-- is used to distinguish them in the database.
--
-- LIMITED INFORMATION: Unlike the historical Mestre Paraná from
-- Rio, this contemporary mestre has limited publicly available
-- documentation. Full name is not publicly disclosed.
--
-- LINEAGE: Mestre Limão → Mestre Marcio → Mestre Paraná
-- ACTIVITY: Founded Caravelas Negras (1993, São Paulo);
--           now active in Netherlands
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
  title,
  portrait,
  public_links,
  -- Capoeira-specific
  style,
  style_notes_en,
  style_notes_pt,
  -- Life dates (estimated)
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
  NULL,  -- Full name not publicly documented
  'Paraná',
  'Praia do Sol',  -- Context to distinguish from Oswaldo Lisboa dos Santos
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://cncapoeira.nl/en/about-us/',
    'https://www.lalaue.com/amsterdam/capoeira-caravelas-negras/'
  ]::text[],
  -- Capoeira-specific
  'contemporanea'::genealogy.style,
  E'Mestre Paraná developed a contemporary capoeira style that focuses on technique and efficiency. His approach is applicable both as a martial art and for playing in different capoeira styles, incorporating elements from both Regional and Angola. The style emphasizes technical precision not just for movement efficiency but also for maintaining a healthy body and avoiding injury. At the same time, the group remains rooted in the foundations and traditions of capoeira, practicing various traditional rhythms and games.',
  E'Mestre Paraná desenvolveu um estilo contemporâneo de capoeira que foca em técnica e eficiência. Sua abordagem é aplicável tanto como arte marcial quanto para jogar em diferentes estilos de capoeira, incorporando elementos tanto da Regional quanto da Angola. O estilo enfatiza a precisão técnica não apenas para eficiência de movimento, mas também para manter um corpo saudável e evitar lesões. Ao mesmo tempo, o grupo permanece enraizado nos fundamentos e tradições da capoeira, praticando vários ritmos e jogos tradicionais.',
  -- Life dates (estimated)
  1960,  -- Birth year estimated from founding Caravelas Negras (1993) and lineage position
  'decade'::genealogy.date_precision,
  'São Paulo, Brazil',  -- Born/trained in São Paulo
  NULL,  -- Still living
  NULL,
  NULL,
  -- bio_en
  E'Mestre Paraná is a contemporary capoeira mestre from São Paulo who trained in the Praia do Sol lineage under Mestre Marcio. His lineage traces back to Mestre Limão, one of the pioneering capoeira mestres in São Paulo during the 1970s-80s. This was an era when several influential mestres had relocated from Bahia to São Paulo, bringing their traditions to the industrial capital.

In 1993, Mestre Paraná founded Caravelas Negras in São Paulo. The name "Caravelas Negras" (Black Caravels) refers to the slave ships that brought millions of Africans to Brazil, honoring the memory of those who created and preserved capoeira through centuries of oppression.

Mestre Paraná later brought Caravelas Negras to the Netherlands, where the group has become one of the most active capoeira organizations in the country. Under the leadership of Contra Mestre Miojo (Marcio Rogerio de Silva), his student who has lived in the Netherlands for over 20 years, CN Capoeira now offers classes in Amsterdam, Alkmaar, Haarlem, Aalsmeer, Amstelveen, Hoofddorp, and Zaandam.

The group''s style is not exclusively Regional or Angola but a contemporary approach that values technical precision and adaptability. Mestre Paraná''s philosophy emphasizes that technique is crucial not just for movement efficiency but also for maintaining physical health and preventing injuries. This practical approach has helped the group attract practitioners from diverse backgrounds across the Netherlands.

Note: This is a different person from the historical Mestre Paraná (Oswaldo Lisboa dos Santos, 1922-1972), the renowned Bahian berimbau master who was one of the four founding lineages of Contemporary Capoeira in Rio de Janeiro.',
  -- bio_pt
  E'Mestre Paraná é um mestre de capoeira contemporâneo de São Paulo que treinou na linhagem Praia do Sol sob Mestre Marcio. Sua linhagem remonta a Mestre Limão, um dos mestres pioneiros de capoeira em São Paulo durante os anos 1970-80. Esta era uma época em que vários mestres influentes haviam se mudado da Bahia para São Paulo, trazendo suas tradições para a capital industrial.

Em 1993, Mestre Paraná fundou o Caravelas Negras em São Paulo. O nome "Caravelas Negras" refere-se aos navios negreiros que trouxeram milhões de africanos ao Brasil, honrando a memória daqueles que criaram e preservaram a capoeira através de séculos de opressão.

Mestre Paraná posteriormente levou o Caravelas Negras para a Holanda, onde o grupo se tornou uma das organizações de capoeira mais ativas no país. Sob a liderança de Contra Mestre Miojo (Marcio Rogerio de Silva), seu aluno que vive na Holanda há mais de 20 anos, a CN Capoeira agora oferece aulas em Amsterdam, Alkmaar, Haarlem, Aalsmeer, Amstelveen, Hoofddorp e Zaandam.

O estilo do grupo não é exclusivamente Regional ou Angola, mas uma abordagem contemporânea que valoriza a precisão técnica e a adaptabilidade. A filosofia de Mestre Paraná enfatiza que a técnica é crucial não apenas para a eficiência do movimento, mas também para manter a saúde física e prevenir lesões. Esta abordagem prática ajudou o grupo a atrair praticantes de diversas origens em toda a Holanda.

Nota: Este é uma pessoa diferente do histórico Mestre Paraná (Oswaldo Lisboa dos Santos, 1922-1972), o renomado mestre de berimbau baiano que foi uma das quatro linhagens fundadoras da Capoeira Contemporânea no Rio de Janeiro.',
  -- achievements_en
  E'- 1993: Founded Caravelas Negras in São Paulo, Brazil
- Expanded Caravelas Negras to the Netherlands
- Established one of the largest capoeira networks in the Netherlands with 8+ training locations
- Trained Contra Mestre Miojo (Marcio Rogerio de Silva), who now leads CN Capoeira in Europe
- Developed a contemporary style balancing technique with tradition',
  -- achievements_pt
  E'- 1993: Fundou o Caravelas Negras em São Paulo, Brasil
- Expandiu o Caravelas Negras para a Holanda
- Estabeleceu uma das maiores redes de capoeira na Holanda com mais de 8 locais de treinamento
- Treinou Contra Mestre Miojo (Marcio Rogerio de Silva), que agora lidera a CN Capoeira na Europa
- Desenvolveu um estilo contemporâneo equilibrando técnica com tradição',
  -- notes_en
  E'DISAMBIGUATION:
This is a DIFFERENT person from the historical Mestre Paraná (Oswaldo Lisboa dos Santos, 1922-1972).
The apelido_context ''Praia do Sol'' distinguishes this contemporary mestre in the database.

FULL NAME: Unknown / Not publicly disclosed
The CN Capoeira website and other sources do not provide his full name.

BIRTH YEAR ESTIMATION (1960, decade):
- Founded Caravelas Negras in 1993
- Typically a mestre is 25-35+ when founding their own group
- Trained under Mestre Marcio (Associação Praia do Sol founded 1979)
- One generation after Limão (died 1985) - trained under Marcio, not directly Limão
- If started capoeira ~age 12 and trained 15-20 years before founding group: ~1960s
- Using 1960 as midpoint estimate with decade precision

LINEAGE:
- Trained under: Mestre Marcio (Praia do Sol)
- Grand-teacher: Mestre Limão (Paulo dos Santos, 1945-1985)
- Great-grand-teacher: Mestre Caiçara (Antônio Conceição Moraes)

GEOGRAPHIC HISTORY:
- Origin: São Paulo, Brazil
- Training: Praia do Sol group, São Paulo
- Founded: Caravelas Negras (1993), São Paulo
- Current activity: Netherlands (date of move unknown)

GROUP FOUNDED:
- Caravelas Negras (1993) - São Paulo
  - Name meaning: "Black Caravels" - refers to slave ships
  - Now led in Netherlands by Contra Mestre Miojo

KEY STUDENT:
- Contra Mestre Miojo (Marcio Rogerio de Silva)
  - From São Paulo, Brazil
  - Lived in Netherlands 20+ years (since ~2000s)
  - Practicing capoeira 35+ years
  - Leads CN Capoeira in Netherlands

NETHERLANDS LOCATIONS (as of 2025):
Amsterdam, Alkmaar, Haarlem, Aalsmeer, Amstelveen, Hoofddorp, Zaandam

STYLE:
- Contemporary style ("contemporanea")
- Not exclusively Regional or Angola
- Focus on technique and efficiency
- Maintains traditional rhythms and games

LIMITED DOCUMENTATION:
Unlike historical figures, contemporary active mestres often have limited
public biographical information for privacy reasons.

SOURCES:
- cncapoeira.nl/en/about-us/ (primary)
- lalaue.com/amsterdam/capoeira-caravelas-negras/',
  -- notes_pt
  E'DESAMBIGUAÇÃO:
Esta é uma pessoa DIFERENTE do histórico Mestre Paraná (Oswaldo Lisboa dos Santos, 1922-1972).
O apelido_context ''Praia do Sol'' distingue este mestre contemporâneo no banco de dados.

NOME COMPLETO: Desconhecido / Não divulgado publicamente
O site da CN Capoeira e outras fontes não fornecem seu nome completo.

ESTIMATIVA DO ANO DE NASCIMENTO (1960, década):
- Fundou Caravelas Negras em 1993
- Tipicamente um mestre tem 25-35+ anos ao fundar seu próprio grupo
- Treinou com Mestre Marcio (Associação Praia do Sol fundada em 1979)
- Uma geração após Limão (morto em 1985) - treinou com Marcio, não diretamente com Limão
- Se começou capoeira ~aos 12 anos e treinou 15-20 anos antes de fundar grupo: ~anos 1960
- Usando 1960 como estimativa do ponto médio com precisão de década

LINHAGEM:
- Treinou com: Mestre Marcio (Praia do Sol)
- Grão-mestre: Mestre Limão (Paulo dos Santos, 1945-1985)
- Bisavô-mestre: Mestre Caiçara (Antônio Conceição Moraes)

HISTÓRICO GEOGRÁFICO:
- Origem: São Paulo, Brasil
- Treinamento: Grupo Praia do Sol, São Paulo
- Fundou: Caravelas Negras (1993), São Paulo
- Atividade atual: Holanda (data de mudança desconhecida)

GRUPO FUNDADO:
- Caravelas Negras (1993) - São Paulo
  - Significado do nome: "Caravelas Negras" - refere-se aos navios negreiros
  - Agora liderado na Holanda por Contra Mestre Miojo

ALUNO PRINCIPAL:
- Contra Mestre Miojo (Marcio Rogerio de Silva)
  - De São Paulo, Brasil
  - Mora na Holanda há mais de 20 anos (desde ~anos 2000)
  - Praticando capoeira há mais de 35 anos
  - Lidera CN Capoeira na Holanda

LOCAIS NA HOLANDA (a partir de 2025):
Amsterdam, Alkmaar, Haarlem, Aalsmeer, Amstelveen, Hoofddorp, Zaandam

ESTILO:
- Estilo contemporâneo ("contemporanea")
- Não exclusivamente Regional ou Angola
- Foco em técnica e eficiência
- Mantém ritmos e jogos tradicionais

DOCUMENTAÇÃO LIMITADA:
Diferentemente de figuras históricas, mestres contemporâneos ativos frequentemente
têm informações biográficas públicas limitadas por razões de privacidade.

FONTES:
- cncapoeira.nl/en/about-us/ (principal)
- lalaue.com/amsterdam/capoeira-caravelas-negras/'
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
