-- ============================================================
-- STATEMENTS FOR: Caiçara
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Caiçara is the SUBJECT.
-- ============================================================

-- Caiçara student_of Aberrê de Santo Amaro (1938-?)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27, capoeirawiki.org, cachoeirabahia.jethsys.com',
  'Caiçara began training under Mestre Aberrê de Santo Amaro at age 14 in 1938. Aberrê taught him "os segredos e mistérios da capoeiragem" (the secrets and mysteries of capoeira). Before Aberrê''s death, he passed his bengala (walking cane) to Caiçara, which became Caiçara''s trademark.',
  'Caiçara começou a treinar com Mestre Aberrê de Santo Amaro aos 14 anos em 1938. Aberrê ensinou-lhe "os segredos e mistérios da capoeiragem". Antes da morte de Aberrê, ele passou sua bengala para Caiçara, que se tornou a marca registrada de Caiçara.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Aberrê' AND o.apelido_context = 'Santo Amaro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara student_of Waldemar (1950s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27, capoeirawiki.org, capoeirahub.net',
  'Caiçara trained under Mestre Waldemar at the legendary Barracão in Liberdade, Salvador, during the 1950s. Sources particularly note his development of berimbau and singing skills, which made him famous as "a great singer" with a "contagious and hypnotic" voice. CapoeiraHub lists Waldemar as one of his primary teachers.',
  'Caiçara treinou com Mestre Waldemar no lendário Barracão na Liberdade, Salvador, durante os anos 1950. As fontes destacam particularmente seu desenvolvimento de habilidades de berimbau e canto, que o tornaram famoso como "um grande cantador" com voz "contagiante e hipnótica". CapoeiraHub lista Waldemar como um de seus professores principais.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Bimba (confrontation 1960s, reconciliation 1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '1972-11-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": {"en": "Rivalry and reconciliation. Caiçara challenged Bimba at Amaralina graduation event, was defeated by bênção (blessing kick) that broke his nose and lips. Reconciled in November 1972 before Bimba left Salvador"., "pt": "Rivalidade e reconciliação. Caiçara desafiou Bimba em evento de formatura em Amaralina, foi derrotado por uma bênção que quebrou seu nariz e lábios. Reconciliaram em novembro de 1972 antes de Bimba deixar Salvador".}}'::jsonb,
  'verified'::genealogy.confidence,
  'cachoeirabahia.jethsys.com, capoeirawiki.org',
  'Famous confrontation at Amaralina graduation event in the 1960s. Caiçara declared himself "the master" and was defeated by Bimba''s devastating bênção. Bimba''s response: "Isso é que é jogo de perna, meu filho" (That''s footwork, my son). In November 1972, Caiçara apologized: "I am Bahia''s third master after you and Mestre Pastinha. Forgive my arrogance; don''t leave. Bahia needs you".',
  'Famoso confronto em evento de formatura em Amaralina nos anos 1960. Caiçara declarou-se "o mestre" e foi derrotado pela devastadora bênção de Bimba. Resposta de Bimba: "Isso é que é jogo de perna, meu filho". Em novembro de 1972, Caiçara se desculpou: "Sou o terceiro mestre da Bahia depois de você e Mestre Pastinha. Perdoe minha arrogância; não vá embora. A Bahia precisa de você".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Traíra (work as political enforcers 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both worked as political enforcers for Salvador Mayor Antônio Carlos Magalhães in the 1960s. Also appeared together in 1954 film Vadiação"., "pt": "Ambos trabalharam como capangas políticos para o prefeito de Salvador Antônio Carlos Magalhães nos anos 1960. Também apareceram juntos no filme Vadiação de 1954".}}'::jsonb,
  'likely'::genealogy.confidence,
  'cachoeirabahia.jethsys.com, decapoeira.org',
  'Caiçara and Traíra worked together as political security/enforcers for Salvador Mayor Antônio Carlos Magalhães during the 1960s. Both were fellow Cachoeiranos (from the Cachoeira region). They also appeared together in the 1954 documentary "Vadiação".',
  'Caiçara e Traíra trabalharam juntos como seguranças/capangas políticos para o prefeito de Salvador Antônio Carlos Magalhães durante os anos 1960. Ambos eram cachoeiranos (da região de Cachoeira). Também apareceram juntos no documentário "Vadiação" de 1954.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with João Pequeno (documented photograph 1987)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres photographed together at capoeira events in Rio de Janeiro and Ouro Preto (1987)"., "pt": "Mestres de Angola contemporâneos fotografados juntos em eventos de capoeira no Rio de Janeiro e Ouro Preto (1987)".}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Documented in photographs with João Pequeno, João Grande, Gato Preto, and Canjiquinha at various events. Appeared together at major capoeira events in Rio de Janeiro and Ouro Preto in 1987.',
  'Documentado em fotografias com João Pequeno, João Grande, Gato Preto e Canjiquinha em vários eventos. Apareceram juntos em grandes eventos de capoeira no Rio de Janeiro e Ouro Preto em 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with João Grande (contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres in Salvador capoeira scene. Photographed together at various events"., "pt": "Mestres de Angola contemporâneos na cena da capoeira de Salvador. Fotografados juntos em vários eventos".}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Photographed with João Grande at capoeira events. Both were major figures in the Salvador Angola capoeira scene.',
  'Fotografado com João Grande em eventos de capoeira. Ambos eram figuras importantes na cena da Capoeira Angola de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Gato Preto (contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres photographed together at capoeira events"., "pt": "Mestres de Angola contemporâneos fotografados juntos em eventos de capoeira".}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Photographed with Gato Preto at capoeira events. Both were major figures in the Salvador Angola capoeira scene.',
  'Fotografado com Gato Preto em eventos de capoeira. Ambos eram figuras importantes na cena da Capoeira Angola de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Caiçara associated_with Canjiquinha (contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Contemporary Angola mestres, both reportedly trained under Aberrê (possibly different Aberrês per Two Aberrês theory). Photographed together at capoeira events"., "pt": "Mestres de Angola contemporâneos, ambos supostamente treinados sob Aberrê (possivelmente diferentes Aberrês conforme teoria dos Dois Aberrês). Fotografados juntos em eventos de capoeira".}}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-27',
  'Both Caiçara and Canjiquinha claimed Aberrê as their teacher, though possibly different individuals (the "Two Aberrês" theory). Both denied connection to Pastinha''s lineage. Photographed together at capoeira events.',
  'Tanto Caiçara quanto Canjiquinha alegavam Aberrê como seu professor, embora possivelmente indivíduos diferentes (a teoria dos "Dois Aberrês"). Ambos negavam conexão com a linhagem de Pastinha. Fotografados juntos em eventos de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Caiçara' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have objects that need to be imported first.
-- Once imported, create statements where THAT PERSON is the subject.
--
-- STUDENTS OF CAIÇARA (these go in their respective files as "X student_of Caiçara"):
-- - Mestre Limão (São Paulo) student_of Caiçara - pending import
-- - Mestre Wilson Sereno (Rio de Janeiro) student_of Caiçara - pending import
-- - Mestre Laercio (Berlin, Germany) student_of Caiçara - pending import
-- - Mestre Sabu/Sabú (Goiás) student_of Caiçara - pending import (same as in backlog)
-- - Mestre Fernandinho (Bahia) student_of Caiçara - pending import
-- - Mestre José de Freitas / Zé de Freitas (Alagoinhas, Bahia) student_of Caiçara - pending import
-- - Mestre Robertino da Hora (Salvador, Bahia) student_of Caiçara - pending import
-- - Mestre Valdomiro (Brazil) student_of Caiçara - pending import
--
-- NOTE: CapoeiraWiki lists "Sandrinha" as Caiçara's student, but other research
-- identifies her primary teacher as Mestre Roque. Do NOT add "Sandrinha student_of Caiçara"
-- unless clearer evidence emerges.
--
-- GROUP FOUNDED BY CAIÇARA:
-- - Caiçara founded Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara - needs group import
--
-- FILM ASSOCIATIONS (not genealogy statements but documented):
-- - 1954: Appeared in "Vadiação" with Bimba, Waldemar, Traíra, Curió
-- - 1982: Appeared in "The Spirit of Samba: Black Music of Brazil"
