-- ============================================================
-- STATEMENTS FOR: Pajéu
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Pajéu is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

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
      'en', 'Pajéu attacked Nascimento Grande with a peixeira (knife) and was swiftly disarmed in two seconds. Nascimento Grande then beat him and publicly humiliated him by forcing him to wear women''s clothing and parade through the streets of Old Recife. The prostitutes, who loved Nascimento Grande and despised Pajéu for beating women, applauded his disgrace. This incident exemplified Nascimento Grande''s theatrical demonstrations of dominance over challengers.',
      'pt', 'Pajéu atacou Nascimento Grande com uma peixeira e foi rapidamente desarmado em dois segundos. Nascimento Grande então o espancou e publicamente o humilhou ao forçá-lo a vestir roupas de mulher e desfilar pelas ruas do Recife Velho. As prostitutas, que amavam Nascimento Grande e desprezavam Pajéu por bater em mulheres, aplaudiram sua desgraça. Este incidente exemplificou as demonstrações teatrais de dominância de Nascimento Grande sobre desafiantes.'
    )
  ),
  'likely'::genealogy.confidence,
  'Multiple sources including Educando com Ginga, Grupo Capoeira Raça Negra, Casa do Engenho',
  'Challenger who was defeated and humiliated. Known as a malfeitor from São José neighborhood who pretended to be a capoeirista and beat women. Attack occurred likely in late 1800s or early 1900s.',
  'Desafiante que foi derrotado e humilhado. Conhecido como malfeitor do bairro São José que fingia ser capoeirista e batia em mulheres. Ataque ocorreu provavelmente no final dos anos 1800 ou início dos anos 1900.'
FROM genealogy.person_profiles p, genealogy.person_profiles ng
WHERE p.apelido = 'Pajéu' AND ng.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
