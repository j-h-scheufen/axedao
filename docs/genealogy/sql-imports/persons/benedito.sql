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
  style_notes,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content
  bio,
  achievements
) VALUES (
  -- Identity
  NULL,
  'Benedito',
  NULL,
  NULL,
  NULL,
  -- Capoeira-specific
  NULL,
  E'Predates the Angola/Regional distinction. Taught capoeira using only a drum (atabaque), not a berimbau—a practice common in Bahian capoeira at that time. The berimbau did not become the central instrument of capoeira until the early 20th century. This drum-only practice suggests a connection to older, more African forms of the art, possibly related to engolo traditions from the Cunene region of Angola.',
  -- Life dates
  NULL,
  'unknown'::genealogy.date_precision,
  'Angola, Africa',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content
  E'Benedito was an elderly African man, described in historical accounts as a "negro natural de Angola" (Black man native to Angola), who lived at Rua das Laranjeiras, number 26, in the Pelourinho neighborhood of Salvador, Bahia. As a freed African ("africano liberto") in late 19th century Brazil, he represents one of the last generation who directly transmitted fighting traditions from Africa to Brazil. The trans-Atlantic slave trade to Brazil was abolished in 1850, meaning Benedito was likely among those brought to Brazil before this date, or was born to African parents shortly after.

Benedito belongs to a crucial generation of African-born teachers who taught the founders of modern capoeira. His contemporaries include Bentinho (who taught Mestre Bimba) and Tio Alípio (who taught Besouro Mangangá). Together, these African teachers form the bridge between the art''s African origins—possibly the engolo tradition practiced by the Nyaneka-Nkhumbi peoples of southwestern Angola—and its codification in 20th century Brazil.

Around 1899, Benedito observed from his window a recurring scene on his street: a frail boy of about 8-10 years old repeatedly losing fights to a larger, older boy. One day, after watching the smaller boy cry with rage from another defeat, Benedito called out to him: "You can''t beat him, you know, because he is bigger and older than you. The time you waste flying kites, come to my house and I will teach you something of great value."

That boy was Vicente Ferreira, who would become Mestre Pastinha, the great preserver of Capoeira Angola. Vicente became Benedito''s disciple, visiting his house every day with the great interest that capoeira had awakened in him. For the next two to three years, Benedito taught him everything he knew—not just the physical techniques like the ginga, but also mandinga (the cunning, trickery, and spiritual aspects of the art), discipline, and respect for elders.

Benedito''s teaching philosophy emphasized patience and restraint. He counseled his young student: "Don''t provoke, boy. Make him aware of what you know very slowly." When Vicente finally confronted his bully again, a single blow was sufficient. The older boy became his friend out of admiration and respect.

Notably, Benedito taught capoeira without a berimbau, accompanying the practice only with a drum (atabaque)—a method common in Bahian capoeira at that time. Historical records confirm that "in early days, capoeira was accompanied only by the big drum (known as ngoma, conga or atabaque), hand-clapping and singing." The berimbau did not become capoeira''s central instrument until the early 20th century. This detail connects Benedito''s teaching to older African traditions, where drums like the ngoma were used to transmit messages to warriors "in a language that was familiar to them."

Throughout his long life, Pastinha spoke of Benedito with profound gratitude. In a 1975 interview, he recalled: "Let''s say with 8 years, with 9 years I became a capoeirista. I learned with a master, Benedito, not Bahian, African." In 1964, his student J.B. Colmenero noted that Pastinha spoke "with words filled with the purest gratitude about Mestre Benedito, a Black man native to Angola."

When the Luso-Angolan painter Albano Neves e Sousa visited Pastinha''s academy in 1965 and showed him drawings of engolo—a combat game he had documented among the Nkhumbi people of the Cunene region in the 1950s—he declared: "N''golo is capoeira." Though Pastinha''s vision was already failing from cataracts by then, this encounter provided visual evidence of what the oral tradition had always claimed: that capoeira originated in Angola. Benedito, as a native of Angola, represents a direct link in that chain of transmission.

Nothing more is known of Benedito''s life beyond his role as Pastinha''s teacher. We do not know his full name, how he came to Brazil, who taught him capoeira in Africa, or when he died. But through his patient instruction of a bullied child on a Salvador street, he became the source of one of capoeira''s most important lineages—and a living connection to the art''s African roots.',
  'Teacher of Vicente Ferreira Pastinha (Mestre Pastinha), the founder of CECA and great preserver of Capoeira Angola. One of the "African-born generation" of teachers who transmitted capoeira traditions directly from Africa to Brazil.'
) RETURNING id AS benedito_id;

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

COMMIT;
