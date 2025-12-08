-- ============================================================
-- GENEALOGY PERSON IMPORT: Benedito
-- Generated: 2025-12-08
-- Primary Sources:
--   - velhosmestres.com/br/pastinha-1899
--   - velhosmestres.com/br/pastinha-1979-4
--   - papoeira.com/en/who-was-mestre-pastinha/
--   - capoeira-connection.com (Pastinha 1967 quotes)
--   - nossa-tribo.com/mestre-pastinha-o-pai-da-capoeira-angola/
--   - capoeirahistory.com/the-origins-of-capoeira/
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1830 with 'decade' precision):
-- Described as "elderly" when teaching Pastinha around 1899. If elderly
-- (60+ years old) in 1899, birth decade estimated as 1830s. This aligns
-- with historical context—slave trade to Brazil ended 1850, so he was
-- likely born in Angola and brought to Brazil as a child/young man, or
-- born in Brazil to African parents shortly after 1850. Using 1830 as
-- representative year with 'decade' precision to enable temporal
-- positioning in genealogy visualizations.
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
-- Benedito: African elder who taught Mestre Pastinha (~1899)
-- Earliest traceable teacher in the Capoeira Angola lineage
-- One of the "African-born generation" along with Bentinho
-- (Bimba's teacher) and Tio Alípio (Besouro's teacher)
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
  achievements_pt
) VALUES (
  -- Identity
  NULL,
  'Benedito',
  NULL,
  NULL,
  NULL,
  -- Capoeira-specific
  NULL,
  -- style_notes_en
  E'Predates the Angola/Regional distinction. Taught capoeira using only a drum (atabaque), not a berimbau—a practice common in Bahian capoeira at that time. The berimbau did not become the central instrument of capoeira until the early 20th century. This drum-only practice suggests a connection to older, more African forms of the art, possibly related to engolo traditions from the Cunene region of Angola.',
  -- style_notes_pt
  E'Anterior à distinção Angola/Regional. Ensinava capoeira usando apenas um tambor (atabaque), não um berimbau—uma prática comum na capoeira baiana daquela época. O berimbau não se tornou o instrumento central da capoeira até o início do século XX. Esta prática de usar apenas tambor sugere uma conexão com formas mais antigas e africanas da arte, possivelmente relacionadas às tradições do engolo da região de Cunene em Angola.',
  -- Life dates
  1830,
  'decade'::genealogy.date_precision,
  'Angola, Africa',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Benedito was an elderly African man, described in historical accounts as a "negro natural de Angola" (Black man native to Angola), who lived at Rua das Laranjeiras, number 26, in the Pelourinho neighborhood of Salvador, Bahia. As a freed African ("africano liberto") in late 19th century Brazil, he represents one of the last generation who directly transmitted fighting traditions from Africa to Brazil. The trans-Atlantic slave trade to Brazil was abolished in 1850, meaning Benedito was likely among those brought to Brazil before this date, or was born to African parents shortly after.

Benedito belongs to a crucial generation of African-born teachers who taught the founders of modern capoeira. His contemporaries include Bentinho (who taught Mestre Bimba) and Tio Alípio (who taught Besouro Mangangá). Together, these African teachers form the bridge between the art''s African origins—possibly the engolo tradition practiced by the Nyaneka-Nkhumbi peoples of southwestern Angola—and its codification in 20th century Brazil.

Around 1899, Benedito observed from his window a recurring scene on his street: a frail boy of about 8-10 years old repeatedly losing fights to a larger, older boy. One day, after watching the smaller boy cry with rage from another defeat, Benedito called out to him: "You can''t beat him, you know, because he is bigger and older than you. The time you waste flying kites, come to my house and I will teach you something of great value."

That boy was Vicente Ferreira, who would become Mestre Pastinha, the great preserver of Capoeira Angola. Vicente became Benedito''s disciple, visiting his house every day with the great interest that capoeira had awakened in him. For the next two to three years, Benedito taught him everything he knew—not just the physical techniques like the ginga, but also mandinga (the cunning, trickery, and spiritual aspects of the art), discipline, and respect for elders.

Benedito''s teaching philosophy emphasized patience and restraint. He counseled his young student: "Don''t provoke, boy. Make him aware of what you know very slowly." When Vicente finally confronted his bully again, a single blow was sufficient. The older boy became his friend out of admiration and respect.

Notably, Benedito taught capoeira without a berimbau, accompanying the practice only with a drum (atabaque)—a method common in Bahian capoeira at that time. Historical records confirm that "in early days, capoeira was accompanied only by the big drum (known as ngoma, conga or atabaque), hand-clapping and singing." The berimbau did not become capoeira''s central instrument until the early 20th century. This detail connects Benedito''s teaching to older African traditions, where drums like the ngoma were used to transmit messages to warriors "in a language that was familiar to them."

Throughout his long life, Pastinha spoke of Benedito with profound gratitude. In a 1975 interview, he recalled: "Let''s say with 8 years, with 9 years I became a capoeirista. I learned with a master, Benedito, not Bahian, African." In 1964, his student J.B. Colmenero noted that Pastinha spoke "with words filled with the purest gratitude about Mestre Benedito, a Black man native to Angola."

When the Luso-Angolan painter Albano Neves e Sousa visited Pastinha''s academy in 1965 and showed him drawings of engolo—a combat game he had documented among the Nkhumbi people of the Cunene region in the 1950s—he declared: "N''golo is capoeira." Though Pastinha''s vision was already failing from cataracts by then, this encounter provided visual evidence of what the oral tradition had always claimed: that capoeira originated in Angola. Benedito, as a native of Angola, represents a direct link in that chain of transmission.

Nothing more is known of Benedito''s life beyond his role as Pastinha''s teacher. We do not know his full name, how he came to Brazil, who taught him capoeira in Africa, or when he died. But through his patient instruction of a bullied child on a Salvador street, he became the source of one of capoeira''s most important lineages—and a living connection to the art''s African roots.',
  -- bio_pt
  E'Benedito era um homem africano idoso, descrito em relatos históricos como um "negro natural de Angola", que morava na Rua das Laranjeiras, número 26, no bairro do Pelourinho em Salvador, Bahia. Como um africano liberto no Brasil do final do século XIX, ele representa uma das últimas gerações que transmitiu diretamente tradições de luta da África para o Brasil. O tráfico transatlântico de escravos para o Brasil foi abolido em 1850, o que significa que Benedito provavelmente estava entre aqueles trazidos ao Brasil antes desta data, ou nasceu de pais africanos pouco depois.

Benedito pertence a uma geração crucial de professores nascidos na África que ensinaram os fundadores da capoeira moderna. Seus contemporâneos incluem Bentinho (que ensinou Mestre Bimba) e Tio Alípio (que ensinou Besouro Mangangá). Juntos, esses professores africanos formam a ponte entre as origens africanas da arte—possivelmente a tradição do engolo praticada pelos povos Nyaneka-Nkhumbi do sudoeste de Angola—e sua codificação no Brasil do século XX.

Por volta de 1899, Benedito observou de sua janela uma cena recorrente em sua rua: um menino frágil de cerca de 8-10 anos perdendo repetidamente brigas para um menino maior e mais velho. Um dia, após ver o menino menor chorar de raiva depois de outra derrota, Benedito chamou-o: "Você não pode vencê-lo, sabe, porque ele é maior e mais velho que você. O tempo que você perde soltando pipas, venha à minha casa e eu lhe ensinarei algo de grande valor."

Aquele menino era Vicente Ferreira, que se tornaria Mestre Pastinha, o grande preservador da Capoeira Angola. Vicente tornou-se discípulo de Benedito, visitando sua casa todos os dias com o grande interesse que a capoeira havia despertado nele. Pelos próximos dois a três anos, Benedito ensinou-lhe tudo o que sabia—não apenas as técnicas físicas como a ginga, mas também a mandinga (a astúcia, malícia e aspectos espirituais da arte), disciplina e respeito aos mais velhos.

A filosofia de ensino de Benedito enfatizava paciência e contenção. Ele aconselhou seu jovem aluno: "Não provoque, menino. Faça-o perceber o que você sabe bem devagar." Quando Vicente finalmente confrontou seu agressor novamente, um único golpe foi suficiente. O menino mais velho tornou-se seu amigo por admiração e respeito.

Notavelmente, Benedito ensinava capoeira sem berimbau, acompanhando a prática apenas com um tambor (atabaque)—um método comum na capoeira baiana daquela época. Registros históricos confirmam que "nos primeiros tempos, a capoeira era acompanhada apenas pelo grande tambor (conhecido como ngoma, conga ou atabaque), palmas e canto." O berimbau não se tornou o instrumento central da capoeira até o início do século XX. Este detalhe conecta o ensino de Benedito a tradições africanas mais antigas, onde tambores como o ngoma eram usados para transmitir mensagens aos guerreiros "em uma linguagem que lhes era familiar."

Ao longo de sua longa vida, Pastinha falou de Benedito com profunda gratidão. Em uma entrevista de 1975, ele lembrou: "Digamos com 8 anos, com 9 anos eu me tornei capoeirista. Aprendi com um mestre, Benedito, não baiano, africano." Em 1964, seu aluno J.B. Colmenero notou que Pastinha falava "com palavras cheias da mais pura gratidão sobre Mestre Benedito, um negro natural de Angola."

Quando o pintor luso-angolano Albano Neves e Sousa visitou a academia de Pastinha em 1965 e mostrou-lhe desenhos do engolo—um jogo de combate que ele havia documentado entre o povo Nkhumbi da região de Cunene nos anos 1950—ele declarou: "N''golo é capoeira." Embora a visão de Pastinha já estivesse falhando devido a cataratas naquela época, este encontro forneceu evidência visual do que a tradição oral sempre afirmara: que a capoeira originou-se em Angola. Benedito, como nativo de Angola, representa um elo direto nessa cadeia de transmissão.

Nada mais se sabe sobre a vida de Benedito além de seu papel como professor de Pastinha. Não sabemos seu nome completo, como veio para o Brasil, quem lhe ensinou capoeira na África, ou quando morreu. Mas através de sua instrução paciente a um menino intimidado em uma rua de Salvador, ele se tornou a fonte de uma das linhagens mais importantes da capoeira—e uma conexão viva com as raízes africanas da arte.',
  -- achievements_en
  'Teacher of Vicente Ferreira Pastinha (Mestre Pastinha), the founder of CECA and great preserver of Capoeira Angola. One of the "African-born generation" of teachers who transmitted capoeira traditions directly from Africa to Brazil.',
  -- achievements_pt
  'Professor de Vicente Ferreira Pastinha (Mestre Pastinha), o fundador do CECA e grande preservador da Capoeira Angola. Um da "geração nascida na África" de professores que transmitiram tradições de capoeira diretamente da África para o Brasil.'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- NOTE: The primary relationship (Pastinha student_of Benedito) will be
-- generated when Pastinha is imported, as predicates flow from
-- younger/newer to older/established entities.
--
-- Pending relationship (to be added with Pastinha import):
--   Pastinha | student_of | Benedito | ~1899 | ~1902 | verified
--   Source: Multiple Pastinha interviews (1964, 1967, 1975)

-- ============================================================
-- ASSOCIATED FIGURES (for context, not SQL relationships yet)
-- ============================================================
-- Benedito is part of a generation of African-born teachers:
-- - Bentinho (taught Mestre Bimba) - pending import
-- - Tio Alípio (taught Besouro Mangangá) - already imported
--
-- These three African teachers form the deepest documented layer
-- of capoeira's genealogy, connecting to:
-- - The engolo tradition of the Nyaneka-Nkhumbi peoples
-- - The Cunene region of southwestern Angola
-- - The pre-berimbau era of drum-accompanied capoeira

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/benedito.sql',
  NULL,
  ARRAY[]::text[],
  'African elder who taught Mestre Pastinha (~1899-1902); represents direct transmission from Angola'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
