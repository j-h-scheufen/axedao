-- ============================================================
-- STATEMENTS FOR: Tiburcinho
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Tiburcinho is the SUBJECT.
-- ============================================================

-- Tiburcinho associated_with Bimba (maculelê recovery, songs preservation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Introduced to Bimba by Decânio; helped Bimba remember forgotten songs and revived maculelê choreography, which Bimba then included in his group presentations", "pt": "Apresentado a Bimba por Decânio; ajudou Bimba a lembrar cantigas esquecidas e reviveu a coreografia do maculelê, que Bimba então incluiu nas apresentações de seu grupo"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-32; capoeira.online/history/mestres/mestre-tiburcinho/',
  'Key cultural collaboration: Tiburcinho helped preserve traditional songs and revived maculelê, which had nearly been lost. This partnership with Bimba ensured maculelê would become part of modern capoeira practice worldwide.',
  'Colaboração cultural fundamental: Tiburcinho ajudou a preservar cantigas tradicionais e reviveu o maculelê, que quase havia sido perdido. Esta parceria com Bimba garantiu que o maculelê se tornasse parte da prática moderna de capoeira em todo o mundo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Decânio (introduced to Bimba by Decânio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Decânio brought Tiburcinho to Mestre Bimba, facilitating the recovery of maculelê for Brazilian culture", "pt": "Decânio levou Tiburcinho a Mestre Bimba, facilitando a recuperação do maculelê para a cultura brasileira"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-32; capoeira.online/history/mestres/mestre-tiburcinho/',
  'Decânio served as the crucial link between Tiburcinho and Bimba, recognizing the cultural value of Tiburcinho''s knowledge of traditional songs and maculelê.',
  'Decânio serviu como o elo crucial entre Tiburcinho e Bimba, reconhecendo o valor cultural do conhecimento de Tiburcinho sobre cantigas tradicionais e maculelê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Decânio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Pastinha (frequented his academy)
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
  '{"association_context": {"en": "Tiburcinho frequented Pastinha''s academy in Salvador and was often seen there", "pt": "Tiburcinho frequentava a academia de Pastinha em Salvador e era frequentemente visto lá"}}'::jsonb,
  'likely'::genealogy.confidence,
  'capoeira.online/history/mestres/mestre-tiburcinho/',
  'Visited Pastinha''s academy regularly after moving to Salvador and establishing himself in the capoeira community.',
  'Visitou a academia de Pastinha regularmente após se mudar para Salvador e se estabelecer na comunidade de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with João Pequeno (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both present at the 1953 Roça do Lobo roda in Salvador where João Grande first witnessed capoeira", "pt": "Ambos presentes na roda da Roça do Lobo em 1953 em Salvador onde João Grande viu capoeira pela primeira vez"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38; capoeira-connection.com',
  'The Roça do Lobo roda, near the bridge linking Tororó to Garcia, was a significant gathering of Salvador''s leading capoeiristas.',
  'A roda da Roça do Lobo, perto da ponte que ligava Tororó a Garcia, foi um encontro significativo dos principais capoeiristas de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Barbosa (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both present at the 1953 Roça do Lobo roda in Salvador where João Grande first witnessed capoeira", "pt": "Ambos presentes na roda da Roça do Lobo em 1953 em Salvador onde João Grande viu capoeira pela primeira vez"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38; capoeira-connection.com',
  'The Roça do Lobo roda was organized by Barbosa; João Grande asked him what capoeira was at this event.',
  'A roda da Roça do Lobo foi organizada por Barbosa; João Grande perguntou a ele o que era capoeira neste evento.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Barbosa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Cobrinha Verde (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both present at the 1953 Roça do Lobo roda in Salvador where João Grande first witnessed capoeira", "pt": "Ambos presentes na roda da Roça do Lobo em 1953 em Salvador onde João Grande viu capoeira pela primeira vez"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38; capoeira-connection.com',
  'Cobrinha Verde was described as one of the greatest players of that era at the Roça do Lobo gathering.',
  'Cobrinha Verde foi descrito como um dos maiores jogadores daquela época na reunião da Roça do Lobo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Menino Gordo (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both present at the 1953 Roça do Lobo roda in Salvador where João Grande first witnessed capoeira", "pt": "Ambos presentes na roda da Roça do Lobo em 1953 em Salvador onde João Grande viu capoeira pela primeira vez"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38; capoeira-connection.com',
  'Also referred to as "Gordo" in João Grande''s account.',
  'Também referido como "Gordo" no relato de João Grande.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Menino Gordo da Curva Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Jair Moura (1968 documentary, 1970 interview)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Tiburcinho appeared in Jair Moura''s 1968 documentary ''Dança de Guerra'' and was interviewed by Moura for A Tarde newspaper in February 1970", "pt": "Tiburcinho apareceu no documentário ''Dança de Guerra'' de Jair Moura em 1968 e foi entrevistado por Moura para o jornal A Tarde em fevereiro de 1970"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-32; jogodavidaweb.wordpress.com',
  'Jair Moura documented Tiburcinho''s knowledge of batuque and his role in preserving Afro-Brazilian traditions.',
  'Jair Moura documentou o conhecimento de Tiburcinho sobre batuque e seu papel na preservação das tradições afro-brasileiras.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Jair Moura'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Totonho de Maré (1968 documentary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both participated in Jair Moura''s 1968 documentary film ''Dança de Guerra''", "pt": "Ambos participaram do documentário ''Dança de Guerra'' de Jair Moura em 1968"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-32',
  'Appeared together in historic documentary alongside Mestre Bimba and Mestre Noronha.',
  'Apareceram juntos em documentário histórico ao lado de Mestre Bimba e Mestre Noronha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho associated_with Noronha (1968 documentary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": {"en": "Both participated in Jair Moura''s 1968 documentary film ''Dança de Guerra''", "pt": "Ambos participaram do documentário ''Dança de Guerra'' de Jair Moura em 1968"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-32',
  'Appeared together in historic documentary alongside Mestre Bimba and Mestre Totonho de Maré.',
  'Apareceram juntos em documentário histórico ao lado de Mestre Bimba e Mestre Totonho de Maré.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Tiburcinho trained_under Bernardo José de Cosme (batuque, Jaguaripe)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1894-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-32; jogodavidaweb.wordpress.com',
  'Tiburcinho learned batuque from Bernardo José de Cosme in the Jaguaripe/Recôncavo region of Bahia as a youth. Bernardo was described by Tiburcinho as "mestre da arte na sua região" (master of the art in his region). This training in batuque gave Tiburcinho his exceptional mandinga and later influenced his capoeira.',
  'Tiburcinho aprendeu batuque com Bernardo José de Cosme na região de Jaguaripe/Recôncavo da Bahia quando jovem. Bernardo foi descrito por Tiburcinho como "mestre da arte na sua região". Este treinamento em batuque deu a Tiburcinho sua excepcional mandinga e mais tarde influenciou sua capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tiburcinho' AND o.apelido = 'Bernardo José de Cosme'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Tiburcinho associated_with Manoel Carregador (1953 Roça do Lobo roda) - needs import first
