-- ============================================================
-- STATEMENTS FOR: Boa Gente
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Boa Gente is the SUBJECT.
-- ============================================================

-- Boa Gente trained_under Gato Preto (at Escola Baiana de Capoeira Angola, 1960-1970)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '1970-01-01'::date, 'year'::genealogy.date_precision,
  '{"location": "Escola Baiana de Capoeira Angola, Mirante do Calabar, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-71; nossa-tribo.com/mestre-boa-gente; lalaue.com',
  E'Trained under Gato Preto at the Escola Baiana de Capoeira Angola in Salvador for several years (1960-1970). Found his way to Gato Preto after moving to Salvador to find his brother Dominguinhos. Photographed playing pandeiro at Gato Preto''s roda in December 1963.',
  E'Treinou com Gato Preto na Escola Baiana de Capoeira Angola em Salvador por vários anos (1960-1970). Encontrou Gato Preto após mudar para Salvador para encontrar seu irmão Dominguinhos. Fotografado tocando pandeiro na roda de Gato Preto em dezembro de 1963.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boa Gente' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boa Gente trained_under Vermelho 27 (at Bimba's academy, post-1970)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"location": "Centro de Cultura Física Regional, Terreiro de Jesus, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'nossa-tribo.com/mestre-boa-gente; lalaue.com',
  E'After training with Gato Preto, Boa Gente went to Mestre Bimba''s academy seeking Regional training. By then, Bimba had departed for Goiânia, and Vermelho 27 supervised the academy. Vermelho 27 provided the rigorous training Boa Gente sought and later invited him to collaborate in preserving Bimba''s legacy.',
  E'Após treinar com Gato Preto, Boa Gente foi à academia de Mestre Bimba buscando treinamento da Regional. Bimba já havia partido para Goiânia, e Vermelho 27 supervisionava a academia. Vermelho 27 proporcionou o treinamento rigoroso que Boa Gente buscava e depois o convidou a colaborar na preservação do legado de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boa Gente' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boa Gente associated_with Vermelho 27 (Bimba legacy preservation collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-02-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Bimba legacy preservation collaboration"}'::jsonb,
  'verified'::genealogy.confidence,
  'nossa-tribo.com/mestre-boa-gente; capoeirawiki.org/Vermelho_27',
  E'After Mestre Bimba''s death (Feb 1974), Boa Gente collaborated with Vermelho 27 and other mestres (Ferro Velho/Durval, Vermelho Boxel, Bahia, Bando) to preserve Bimba''s academy and legacy.',
  E'Após a morte de Mestre Bimba (fev 1974), Boa Gente colaborou com Vermelho 27 e outros mestres (Ferro Velho/Durval, Vermelho Boxel, Bahia, Bando) para preservar a academia e o legado de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boa Gente' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Boa Gente member_of ABCA (Associação Brasileira de Capoeira Angola)
-- NOTE: ABCA group profile does not exist yet - PENDING
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, properties, confidence, source
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'member_of'::genealogy.predicate,
--   'group'::genealogy.entity_type, g.id,
--   '1987-01-01'::date, 'year'::genealogy.date_precision,
--   '{}'::jsonb,
--   'verified'::genealogy.confidence,
--   'nossa-tribo.com; capoeiradobrasil.com.br'
-- FROM genealogy.person_profiles s, genealogy.group_profiles g
-- WHERE s.apelido = 'Boa Gente' AND g.name = 'ABCA'
-- ON CONFLICT (...) DO NOTHING;

-- ============================================================
-- Boa Gente student_of Antônio Cabeceiro (~1956, Ilhéus)
-- ============================================================

-- Boa Gente student_of Antônio Cabeceiro (first teacher, 1956, Ilhéus)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"location": "Streets of Ilhéus, Bahia"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-71; nossa-tribo.com/mestre-boa-gente; lalaue.com',
  E'Cabeceiro was Boa Gente''s first capoeira teacher. Boa Gente witnessed capoeira for the first time at the Festa de São Sebastião in Ilhéus, 1956, watching João Grande, João Pequeno, and Antônio Cabeceiro play. He began training with Cabeceiro on the streets of Ilhéus—no formal schools existed there at the time.',
  E'Cabeceiro foi o primeiro professor de capoeira de Boa Gente. Boa Gente viu capoeira pela primeira vez na Festa de São Sebastião em Ilhéus, 1956, assistindo João Grande, João Pequeno e Antônio Cabeceiro jogarem. Começou a treinar com Cabeceiro nas ruas de Ilhéus—não existiam escolas formais lá na época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boa Gente' AND o.apelido = 'Antônio Cabeceiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- Boa Gente trained_under Valdemar Santana "Leopardo Negro" (~1970s, vale-tudo)
-- ============================================================

-- Boa Gente trained_under Valdemar Santana (MMA/vale-tudo training, ~1970s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"context": "MMA/vale-tudo training, not capoeira"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-71; nossa-tribo.com/mestre-boa-gente; capoeirawiki.org/wiki/Valdemar_Santana',
  E'Valdemar Santana, the legendary "Leopardo Negro" (Black Leopard) and Brazilian vale-tudo champion, visited the Escola Baiana de Capoeira Angola at Mirante do Calabar. He was so impressed by Boa Gente that he invited him to train at his MMA academy. Under Santana''s training, Boa Gente became the MMA champion of Bahia in 1974.',
  E'Valdemar Santana, o lendário "Leopardo Negro" e campeão brasileiro de vale-tudo, visitou a Escola Baiana de Capoeira Angola no Mirante do Calabar. Ficou tão impressionado com Boa Gente que o convidou para treinar em sua academia de MMA. Sob o treinamento de Santana, Boa Gente se tornou campeão de MMA da Bahia em 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Boa Gente' AND o.apelido = 'Leopardo Negro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Boa Gente associated_with Professor Lee (Taekwondo, 1972)
-- Professor Lee not a capoeirista - DO NOT IMPORT
-- Co-founded Associação de Taekwondo da Bahia with him

-- Boa Gente associated_with Dominguinhos (brother, capoeirista in Salvador)
-- Dominguinhos not yet in dataset - needs investigation
-- Minimal information available - only mentioned as brother who brought Boa Gente to Salvador

-- Boa Gente founded Associação de Capoeira Mestre Boa Gente (1981)
-- Group not yet in dataset - needs import

-- ============================================================
-- NOTE: Pintor trained_under Boa Gente is in pintor.sql
-- (predicate flows from subject Pintor to object Boa Gente)
-- ============================================================
