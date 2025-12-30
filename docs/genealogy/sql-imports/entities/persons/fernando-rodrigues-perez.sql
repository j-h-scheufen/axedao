-- ============================================================
-- GENEALOGY PERSON: Fernando Rodrigues Perez
-- Generated: 2025-12-19
-- ============================================================
-- BIRTH YEAR ESTIMATION: No birth date documented. As an established
-- fighter representing Bimba's academy in 1949, if 20-35 years old,
-- birth would be approximately 1914-1929. Using 1920 as midpoint
-- estimate with decade precision.
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Fernando Rodrigues Perez',
  'Perez',  -- Referred to as "Perez" in most sources
  NULL,  -- No formal title found
  NULL,  -- No historical portrait found
  ARRAY['https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/', 'https://nossa-tribo.com/mestre-sinhozinho/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Fernando Rodrigues Perez trained under Mestre Bimba in Capoeira Regional. He was one of the fighters selected to represent Bimba''s academy in the historic 1949 inter-style challenge against Sinhozinho''s capoeira carioca school in Rio de Janeiro.',
  E'Fernando Rodrigues Perez treinou com Mestre Bimba em Capoeira Regional. Ele foi um dos lutadores selecionados para representar a academia de Bimba no histórico desafio inter-estilos de 1949 contra a escola de capoeira carioca de Sinhozinho no Rio de Janeiro.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  'Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Fernando Rodrigues Perez was a student of Mestre Bimba who trained in Capoeira Regional in Bahia. He represented Bimba''s academy in the historic 1949 capoeira challenge at Estádio Carioca in Rio de Janeiro.

In February 1949, Mestre Sinhozinho, the leading figure of capoeira carioca in Rio de Janeiro, challenged Mestre Bimba''s Capoeira Regional school. Bimba''s group, which was touring São Paulo at the time, had been claiming superiority and was eager for real fighting ("pra valer") rather than just exhibition matches. As the newspaper A Noite announced on April 1, 1949: "Capoeira Challenge - Sinhozinho of the Federal District against Master Bimba from Bahia".

The event was organized by the Federação Metropolitana de Pugilismo (Metropolitan Federation of Pugilism) and held over two days at the Estádio Carioca on Avenida Passos in downtown Rio. It included not only the inter-capoeira matches but also a team of catch wrestlers who had similarly challenged Bimba''s academy.

On April 7, 1949, Perez faced Rudolf Hermanny, a 17-year-old student of Sinhozinho who would later become a Brazilian and Pan-American judo champion. The Globo Esportivo newspaper that day announced: "Hoje no Estádio Carioca - o capoeira carioca Hermanny (capoeira de Sinhozinho) em confronto como Perez (capoeira de Mestre Bimba)" ("Today at Carioca Stadium - the Cariocan capoeirista Hermanny [of Sinhozinho] in confrontation with Perez [of Mestre Bimba]").

The fight was brief and decisive. Hermanny dominated the bout, defeating Perez in just two minutes. A kick from Hermanny injured Perez''s arm, ending the match. This came after fellow Bimba student Jurandir had lost to Cirandinha on April 2, meaning both of Bimba''s representatives were defeated.

The impact of these losses was significant. According to sources, Bimba was so impressed by the techniques he observed that he studied movements from Sinhozinho''s fighters afterward to incorporate into his own Capoeira Regional style.

Little else is known about Perez''s life before or after this challenge. His participation marks him as one of Bimba''s capable fighters during a crucial period of inter-style rivalry in Brazilian capoeira history.',
  -- bio_pt
  E'Fernando Rodrigues Perez foi um aluno de Mestre Bimba que treinou Capoeira Regional na Bahia. Ele representou a academia de Bimba no histórico desafio de capoeira de 1949 no Estádio Carioca no Rio de Janeiro.

Em fevereiro de 1949, Mestre Sinhozinho, a principal figura da capoeira carioca no Rio de Janeiro, desafiou a escola de Capoeira Regional de Mestre Bimba. O grupo de Bimba, que estava em turnê por São Paulo na época, vinha reivindicando superioridade e estava ansioso por lutas reais ("pra valer") em vez de apenas exibições. Como anunciou o jornal A Noite em 1 de abril de 1949: "Desafio de Capoeira - Sinhozinho do Distrito Federal contra Mestre Bimba da Bahia".

O evento foi organizado pela Federação Metropolitana de Pugilismo e realizado em dois dias no Estádio Carioca na Avenida Passos, no centro do Rio. Incluiu não apenas as lutas inter-capoeira, mas também uma equipe de lutadores de catch que havia similarmente desafiado a academia de Bimba.

Em 7 de abril de 1949, Perez enfrentou Rudolf Hermanny, um aluno de 17 anos de Sinhozinho que mais tarde se tornaria campeão brasileiro e pan-americano de judô. O jornal Globo Esportivo naquele dia anunciou: "Hoje no Estádio Carioca - o capoeira carioca Hermanny (capoeira de Sinhozinho) em confronto como Perez (capoeira de Mestre Bimba)".

A luta foi breve e decisiva. Hermanny dominou o combate, derrotando Perez em apenas dois minutos. Um chute de Hermanny lesionou o braço de Perez, encerrando a luta. Isso veio depois que o colega aluno de Bimba, Jurandir, havia perdido para Cirandinha em 2 de abril, significando que ambos os representantes de Bimba foram derrotados.

O impacto dessas derrotas foi significativo. De acordo com as fontes, Bimba ficou tão impressionado com as técnicas que observou que estudou movimentos dos lutadores de Sinhozinho depois para incorporar em seu próprio estilo de Capoeira Regional.

Pouco mais se sabe sobre a vida de Perez antes ou depois deste desafio. Sua participação o marca como um dos lutadores capazes de Bimba durante um período crucial de rivalidade inter-estilos na história da capoeira brasileira.',
  -- achievements_en
  NULL,  -- No documented achievements beyond the 1949 fight
  -- achievements_pt
  NULL,
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1920, decade precision): No birth or death dates found for Fernando Rodrigues Perez. Based on his participation as an established fighter representing Bimba''s academy in 1949, if he was 20-35 years old, birth would be approximately 1914-1929. Using 1920 as midpoint estimate with decade precision.

DEATH: Unknown. No records found.

NAME: Full name "Fernando Rodrigues Perez" appears in nossa-tribo.com. Most sources refer to him simply as "Perez".

1949 CHALLENGE:
- Date: April 7, 1949 (second day of the two-day event)
- Opponent: Rudolf Hermanny (Sinhozinho''s student, 17 years old)
- Result: Lost in 2 minutes
- Injury: Arm injured by kick
- Venue: Estádio Carioca, Avenida Passos, downtown Rio de Janeiro
- Organizer: Federação Metropolitana de Pugilismo

TEACHERS:
- Mestre Bimba (confirmed - "capoeira de Mestre Bimba" per Globo Esportivo)

FELLOW FIGHTERS:
- Jurandir - Fellow Bimba student who fought on April 2, 1949; lost to Cirandinha by KO in Round 1

MEDIA APPEARANCES:
- April 7, 1949: Featured in Globo Esportivo announcement of fight vs Hermanny
- April 1949: Covered in A Noite newspaper

HISTORICAL SIGNIFICANCE:
- Part of the historic inter-style rivalry between Bahian Regional (Bimba) and Carioca (Sinhozinho) capoeira
- Both Regional representatives (Perez and Jurandir) were defeated
- Bimba reportedly incorporated techniques observed from Sinhozinho''s fighters into Regional afterward',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1920, precisão de década): Nenhuma data de nascimento ou morte encontrada para Fernando Rodrigues Perez. Com base em sua participação como lutador estabelecido representando a academia de Bimba em 1949, se ele tinha 20-35 anos, o nascimento seria aproximadamente 1914-1929. Usando 1920 como estimativa do ponto médio com precisão de década.

MORTE: Desconhecida. Nenhum registro encontrado.

NOME: Nome completo "Fernando Rodrigues Perez" aparece em nossa-tribo.com. A maioria das fontes o refere simplesmente como "Perez".

DESAFIO DE 1949:
- Data: 7 de abril de 1949 (segundo dia do evento de dois dias)
- Oponente: Rudolf Hermanny (aluno de Sinhozinho, 17 anos)
- Resultado: Perdeu em 2 minutos
- Lesão: Braço lesionado por chute
- Local: Estádio Carioca, Avenida Passos, centro do Rio de Janeiro
- Organizador: Federação Metropolitana de Pugilismo

PROFESSORES:
- Mestre Bimba (confirmado - "capoeira de Mestre Bimba" por Globo Esportivo)

COLEGAS LUTADORES:
- Jurandir - Colega aluno de Bimba que lutou em 2 de abril de 1949; perdeu para Cirandinha por nocaute no 1o round

APARIÇÕES NA MÍDIA:
- 7 de abril de 1949: Destaque no anúncio do Globo Esportivo da luta vs Hermanny
- Abril de 1949: Coberto no jornal A Noite

SIGNIFICADO HISTÓRICO:
- Parte da histórica rivalidade inter-estilos entre a Regional baiana (Bimba) e a carioca (Sinhozinho)
- Ambos os representantes da Regional (Perez e Jurandir) foram derrotados
- Bimba supostamente incorporou técnicas observadas dos lutadores de Sinhozinho na Regional depois'
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
