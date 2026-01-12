-- ============================================================
-- GENEALOGY PERSON: Boca de Fumaça
-- Generated: 2026-01-10
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1910, decade precision):
-- Known to have been a "famous capoeirista" when young Roque (b. 1938)
-- socialized with him at Mercado Modelo around 1948-1956.
-- If Boca de Fumaça was an established capoeirista in his 30s-40s
-- during this period, birth would be approximately 1905-1920.
-- Using 1910 with decade precision as midpoint estimate.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL, 'Boca de Fumaça', NULL, NULL,
  ARRAY['https://capoeirahistory.com/mestre/master-roque-1938/']::text[],
  NULL, NULL, NULL,
  1910, 'decade'::genealogy.date_precision, 'Salvador, Bahia, Brazil (assumed)',
  NULL, NULL, NULL,
  E'Boca de Fumaça was a famous capoeirista active in Salvador, Bahia, during the 1940s and 1950s. What we know of him comes primarily from the testimony of Mestre Roque (Roque Mendes dos Santos, born 1938).\n\nYoung Roque, through his father Chico Preto''s connections at the Mercado Modelo where he operated a fish stand, socialized with many of the renowned capoeiristas of that era. Among them was Boca de Fumaça, alongside figures such as Gajé, Índio, Tatu Bola, Bom Cabrito, Traíra, and Canjiquinha.\n\nThe Mercado Modelo was not merely a market—it was a hub of Bahian culture and capoeira during the mid-20th century. The Rampa do Mercado (Market Ramp) served as a famous gathering place for capoeiristas, where dock workers, vendors, and practitioners from across Salvador would meet. This was the transitional era when capoeira was moving from street practice to more formal settings, having been legalized in 1937 after decades of prohibition.\n\nBeyond Roque''s recollection, no additional documentation of Boca de Fumaça has been found. His name does not appear in the photographic archives of Pierre Verger, the academic studies of Waldeloir Rego, or other primary sources from the period. This is not unusual for capoeiristas of that era—many practiced informally in the streets and markets, leaving no written record.\n\nThe apelido "Boca de Fumaça" (literally "Mouth of Smoke") was a common type of nickname in Brazilian popular culture, often referring to someone who smoked heavily or perhaps to the mystical quality of their presence. Such colorful apelidos were part of the capoeira tradition, serving both to protect practitioners'' identities during the era of prohibition and to create a distinct persona in the roda.',
  E'Boca de Fumaça foi um famoso capoeirista ativo em Salvador, Bahia, durante as décadas de 1940 e 1950. O que sabemos dele vem principalmente do testemunho de Mestre Roque (Roque Mendes dos Santos, nascido em 1938).\n\nO jovem Roque, através das conexões de seu pai Chico Preto no Mercado Modelo, onde operava uma banca de peixe, conviveu com muitos dos renomados capoeiristas daquela época. Entre eles estava Boca de Fumaça, ao lado de figuras como Gajé, Índio, Tatu Bola, Bom Cabrito, Traíra e Canjiquinha.\n\nO Mercado Modelo não era apenas um mercado—era um centro da cultura baiana e da capoeira em meados do século XX. A Rampa do Mercado servia como famoso ponto de encontro para capoeiristas, onde estivadores, vendedores e praticantes de toda Salvador se reuniam. Esta foi a era de transição quando a capoeira estava se movendo da prática de rua para ambientes mais formais, tendo sido legalizada em 1937 após décadas de proibição.\n\nAlém da lembrança de Roque, nenhuma documentação adicional de Boca de Fumaça foi encontrada. Seu nome não aparece nos arquivos fotográficos de Pierre Verger, nos estudos acadêmicos de Waldeloir Rego, ou em outras fontes primárias do período. Isso não é incomum para capoeiristas daquela época—muitos praticavam informalmente nas ruas e mercados, sem deixar registro escrito.\n\nO apelido "Boca de Fumaça" era um tipo comum de apelido na cultura popular brasileira, frequentemente referindo-se a alguém que fumava muito ou talvez à qualidade mística de sua presença. Tais apelidos coloridos faziam parte da tradição da capoeira, servindo tanto para proteger a identidade dos praticantes durante a era de proibição quanto para criar uma persona distinta na roda.',
  NULL, NULL,
  E'BIRTH YEAR ESTIMATION (1910, decade):\nNo birth date documented. Active as established capoeirista when Roque socialized with him at Mercado Modelo (~1948-1956). If in his 30s-40s during this period, birth approximately 1905-1920. Using 1910 as midpoint estimate.\n\nSOURCE LIMITATION:\nOnly documented through Mestre Roque''s testimony (capoeirahistory.com). No independent confirmation in Pierre Verger archives, Waldeloir Rego''s 1968 study, or other primary sources.\n\nCONTEMPORARIES (per Roque):\nGajé, Índio, Tatu Bola, Bom Cabrito, Traíra, Canjiquinha - all socialized at Mercado Modelo through Chico Preto''s connections.\n\nAPELIDO MEANING:\n"Boca de Fumaça" literally translates to "Mouth of Smoke." Common nickname type in Brazilian culture, possibly referring to heavy smoking or mystical presence.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1910, década):\nNenhuma data de nascimento documentada. Ativo como capoeirista estabelecido quando Roque conviveu com ele no Mercado Modelo (~1948-1956). Se estava em seus 30-40 anos durante este período, nascimento aproximadamente 1905-1920. Usando 1910 como estimativa do ponto médio.\n\nLIMITAÇÃO DE FONTE:\nDocumentado apenas através do testemunho de Mestre Roque (capoeirahistory.com). Sem confirmação independente nos arquivos de Pierre Verger, no estudo de Waldeloir Rego de 1968, ou outras fontes primárias.\n\nCONTEMPORÂNEOS (segundo Roque):\nGajé, Índio, Tatu Bola, Bom Cabrito, Traíra, Canjiquinha - todos conviviam no Mercado Modelo através das conexões de Chico Preto.\n\nSIGNIFICADO DO APELIDO:\n"Boca de Fumaça" literalmente significa boca que expele fumaça. Tipo comum de apelido na cultura brasileira, possivelmente referindo-se a fumo pesado ou presença mística.'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
