-- ============================================================
-- GENEALOGY PERSON IMPORT: Pirajé
-- Generated: 2025-12-10
-- Primary Sources:
--   - https://educando-com-ginga.webnode.page/products/jose-nascimento-da-silva-mestre-nascimento-grande-pernambuco-1842-1936/
--   - https://capoeiraracanegra.webnode.page/lendas-da-capoeira/nascimento-grande/
-- ============================================================
-- DEPENDENCIES: persons/nascimento-grande.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1860 with 'decade' precision):
-- Pirajé was among the "most famous valentões" who coveted challenging
-- Nascimento Grande (born 1842) during his prime. For Pirajé to have
-- established a reputation significant enough to travel from Pará to Recife,
-- he would need to have been active in the 1880s-1890s. Using 1860 as estimate.
--
-- DEATH: Unknown. No record of the outcome of any challenge.
--
-- LIMITED SOURCES: Only mentioned in the context of Nascimento Grande's fame.
-- No independent biographical information found.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  NULL, -- Full name unknown
  'Pirajé',
  NULL,
  NULL,
  '[]'::jsonb,
  -- Capoeira-specific
  NULL,
  'Pre-modern era capoeira from northern Brazil (Pará). Style distinctions (Angola/Regional) did not yet exist. Represents the geographic spread of capoeira culture beyond Rio and Bahia.',
  'Capoeira da era pré-moderna do norte do Brasil (Pará). Distinções de estilo (Angola/Regional) ainda não existiam. Representa a disseminação geográfica da cultura da capoeira além do Rio e Bahia.',
  -- Life dates
  1860,
  'decade'::genealogy.date_precision,
  'Pará, Brazil',
  -- bio_en
  E'Pirajé was a renowned capoeirista and valentão (fighter) from the state of Pará in late 19th century Brazil. His reputation as a formidable fighter placed him among the elite capoeiristas of his era, mentioned alongside other legendary figures such as Manezinho Camisa Preta from Rio de Janeiro, Pajeú from the Pernambuco sertão, and João Sabe Tudo.\n\nPirajé''s fame was such that he sought to challenge Nascimento Grande (1842-1936), considered the greatest capoeirista of Pernambuco and one of the most feared fighters in Brazilian history. According to historical accounts, "Nascimento Grande''s fame awakened curiosity among the most famous Brazilian fighters. His crown was coveted by none other than: Pirajé from Pará..."\n\nWhile specific details about his life, fighting style, or the outcome of any challenge remain undocumented, his inclusion among those who "coveted the crown" of Nascimento Grande indicates he was a practitioner of exceptional skill and reputation.\n\nPirajé''s prominence from Pará is particularly notable given that the historiography of capoeira has traditionally focused on Rio de Janeiro and Bahia as the primary centers of the art. His fame represents the broader geographic distribution of capoeira culture in 19th century Brazil, extending to the northern regions.',
  -- bio_pt
  E'Pirajé foi um renomado capoeirista e valentão do estado do Pará no final do século XIX no Brasil. Sua reputação como lutador formidável o colocou entre os capoeiristas de elite de sua época, mencionado ao lado de outras figuras lendárias como Manezinho Camisa Preta do Rio de Janeiro, Pajeú do sertão pernambucano e João Sabe Tudo.\n\nA fama de Pirajé era tal que ele buscou desafiar Nascimento Grande (1842-1936), considerado o maior capoeirista de Pernambuco e um dos lutadores mais temidos da história brasileira. De acordo com relatos históricos, "A fama de Nascimento Grande despertou curiosidade entre os valentões mais famosos do Brasil. Sua coroa era cobiçada por ninguém menos que: Pirajé do Pará..."\n\nEmbora detalhes específicos sobre sua vida, estilo de luta ou o resultado de qualquer desafio permaneçam sem documentação, sua inclusão entre aqueles que "cobiçavam a coroa" de Nascimento Grande indica que ele era um praticante de habilidade e reputação excepcionais.\n\nA proeminência de Pirajé do Pará é particularmente notável dado que a historiografia da capoeira tradicionalmente focou no Rio de Janeiro e Bahia como os principais centros da arte. Sua fama representa a distribuição geográfica mais ampla da cultura da capoeira no Brasil do século XIX, estendendo-se às regiões do norte.',
  -- Researcher notes (English)
  E'BIRTH YEAR: Estimated 1860 with decade precision. No documentation exists for Pirajé''s birth. Estimation based on:\n- Nascimento Grande''s active period (1860s-1920s)\n- The likely timeframe when Pirajé would have established his reputation (1880s-1890s)\n- Typical age for fighters in their prime (20s-30s)\n\nFULL NAME: Unknown.\n\nDEATH: Unknown. No record of his death or the outcome of any challenge to Nascimento Grande.\n\nLIMITED SOURCES: Only mentioned in the context of Nascimento Grande''s fame. No independent biographical information found despite extensive searches.\n\nREGIONAL SIGNIFICANCE: His prominence from Pará indicates capoeira culture extended well beyond the traditional centers of Rio de Janeiro and Bahia. This supports research showing capoeira was practiced in various regions including Pernambuco, Pará, and Maranhão.\n\nCHALLENGE OUTCOME: Unknown whether any actual challenge took place. Sources only mention that he "coveted" challenging Nascimento Grande.',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: Estimado 1860 com precisão de década. Não existe documentação sobre o nascimento de Pirajé. Estimativa baseada em:\n- Período ativo de Nascimento Grande (1860s-1920s)\n- O provável período em que Pirajé teria estabelecido sua reputação (1880s-1890s)\n- Idade típica para lutadores em seu auge (20-30 anos)\n\nNOME COMPLETO: Desconhecido.\n\nMORTE: Desconhecida. Nenhum registro de sua morte ou do resultado de qualquer desafio a Nascimento Grande.\n\nFONTES LIMITADAS: Mencionado apenas no contexto da fama de Nascimento Grande. Nenhuma informação biográfica independente encontrada apesar de buscas extensivas.\n\nSIGNIFICÂNCIA REGIONAL: Sua proeminência do Pará indica que a cultura da capoeira se estendia bem além dos centros tradicionais do Rio de Janeiro e Bahia. Isso apoia pesquisas mostrando que a capoeira era praticada em várias regiões incluindo Pernambuco, Pará e Maranhão.\n\nRESULTADO DO DESAFIO: Desconhecido se algum desafio real ocorreu. Fontes apenas mencionam que ele "cobiçava" desafiar Nascimento Grande.'
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

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Pirajé associated_with Nascimento Grande (coveted challenging him)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, ng.id,
  jsonb_build_object(
    'association_context', jsonb_build_object(
      'en', 'Pirajé from Pará was among the most renowned fighters whose fame led him to covet challenging Nascimento Grande. Historical sources place him alongside other legendary valentões—Manezinho Camisa Preta, Pajeú, João Sabe Tudo—who sought to test themselves against Nascimento Grande''s undefeated reputation. The outcome of any actual challenge is not documented.',
      'pt', 'Pirajé do Pará estava entre os lutadores mais renomados cuja fama o levou a cobiçar desafiar Nascimento Grande. Fontes históricas o colocam ao lado de outros lendários valentões—Manezinho Camisa Preta, Pajeú, João Sabe Tudo—que buscaram se testar contra a reputação invicta de Nascimento Grande. O resultado de qualquer desafio real não está documentado.'
    )
  ),
  'uncertain'::genealogy.confidence,
  'Educando com Ginga; Grupo Capoeira Raça Negra',
  'Famous valentão from Pará who coveted challenging Nascimento Grande. No details of actual confrontation recorded. His fame indicates capoeira culture extended to northern Brazil.',
  'Famoso valentão do Pará que cobiçava desafiar Nascimento Grande. Nenhum detalhe de confronto real registrado. Sua fama indica que a cultura da capoeira se estendia ao norte do Brasil.'
FROM genealogy.person_profiles p, genealogy.person_profiles ng
WHERE p.apelido = 'Pirajé' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/piraje.sql',
  NULL,
  ARRAY['persons/nascimento-grande.sql'],
  'Renowned valentão from Pará who coveted challenging Nascimento Grande; represents capoeira culture in northern Brazil'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
