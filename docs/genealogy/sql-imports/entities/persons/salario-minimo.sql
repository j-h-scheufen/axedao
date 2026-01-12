-- ============================================================
-- GENEALOGY PERSON: Salário Mínimo
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR ESTIMATION (1945, decade precision):
-- Listed among "propagation phase" figures (1967-1973) in SciELO
-- Books "Uma vida na Capoeira Regional". If actively training/
-- teaching during this phase at age 20-28, birth ~1939-1953.
-- Still actively teaching courses in 2008 (age ~55-69 if born
-- 1939-1953). Using 1945 as midpoint estimate with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Dielson Oliveira',
  'Salário Mínimo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://abolicaocapoeiraangers.wordpress.com/le-groupe-abolicao-capoeira/',
    'https://www.capoeirahub.net/mestres/64a60704be1e690014387d62-mestre-bimba?lang=en'
  ]::text[],
  'regional'::genealogy.style,
  E'Direct student of Mestre Bimba, preserving authentic Capoeira Regional methodology. Teaches the traditional techniques and sequences established by Bimba at the Centro de Cultura Física Regional da Bahia.',
  E'Aluno direto de Mestre Bimba, preservando a metodologia autêntica da Capoeira Regional. Ensina as técnicas tradicionais e sequências estabelecidas por Bimba no Centro de Cultura Física Regional da Bahia.',
  1945,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Mestre Salário Mínimo is a direct student of Mestre Bimba, the creator of Capoeira Regional. He trained at Bimba''s Centro de Cultura Física Regional da Bahia in Salvador, becoming one of the many capoeiristas who carried forward Bimba''s legacy after the mestre''s move to Goiânia in 1973 and subsequent death in 1974.

His unusual apelido—meaning "minimum wage" in Portuguese—reflects the tradition of capoeira nicknames often given with irony or based on circumstances during training. The name stuck with him throughout his capoeira career.

In 2000, Mestre Salário Mínimo founded the group Abolição Capoeira, establishing his own school to transmit the Capoeira Regional he learned directly from Mestre Bimba. The group became active in the Arembepe and Camaçari regions of Bahia, where Salário Mínimo taught courses and participated in events. By 2008, documentation shows him facilitating Capoeira Regional courses at events such as the "I Ginga Arembepe" in December 2008.

Through Abolição Capoeira, Mestre Salário Mínimo built an international network. The group expanded to France through his students, maintaining the direct lineage to Bimba''s teachings. The Associação Cultural Abolição Capoeira became recognized as a Ponto de Cultura in Bahia, serving approximately 1,260 people across eight locations in Camaçari municipality.

Salário Mínimo''s most significant contribution to the capoeira lineage may be his role as teacher of Mestre Nenei—not to be confused with Mestre Nenel (Bimba''s son). Mestre Nenei, in turn, became the father and first capoeira teacher of Mestre Kiki da Bahia, who brought Ginga Associação de Capoeira to the United States in 1996 and became the chief representative of Capoeira Regional in America. This lineage connection—Bimba to Salário Mínimo to Nenei to Kiki da Bahia—represents an important branch of Capoeira Regional''s transmission from Brazil to the United States.',
  -- bio_pt
  E'Mestre Salário Mínimo é aluno direto de Mestre Bimba, o criador da Capoeira Regional. Ele treinou no Centro de Cultura Física Regional da Bahia de Bimba em Salvador, tornando-se um dos muitos capoeiristas que levaram adiante o legado de Bimba após a mudança do mestre para Goiânia em 1973 e sua subsequente morte em 1974.

Seu apelido incomum—significando "salário mínimo" em português—reflete a tradição de apelidos de capoeira frequentemente dados com ironia ou baseados em circunstâncias durante o treinamento. O nome permaneceu com ele ao longo de sua carreira na capoeira.

Em 2000, Mestre Salário Mínimo fundou o grupo Abolição Capoeira, estabelecendo sua própria escola para transmitir a Capoeira Regional que aprendeu diretamente de Mestre Bimba. O grupo tornou-se ativo nas regiões de Arembepe e Camaçari na Bahia, onde Salário Mínimo ministrava cursos e participava de eventos. Em 2008, documentação mostra ele facilitando cursos de Capoeira Regional em eventos como o "I Ginga Arembepe" em dezembro de 2008.

Através da Abolição Capoeira, Mestre Salário Mínimo construiu uma rede internacional. O grupo expandiu para a França através de seus alunos, mantendo a linhagem direta aos ensinamentos de Bimba. A Associação Cultural Abolição Capoeira tornou-se reconhecida como Ponto de Cultura na Bahia, atendendo aproximadamente 1.260 pessoas em oito locais no município de Camaçari.

A contribuição mais significativa de Salário Mínimo para a linhagem da capoeira pode ser seu papel como professor de Mestre Nenei—não confundir com Mestre Nenel (filho de Bimba). Mestre Nenei, por sua vez, tornou-se pai e primeiro professor de capoeira de Mestre Kiki da Bahia, que levou a Ginga Associação de Capoeira para os Estados Unidos em 1996 e se tornou o principal representante da Capoeira Regional na América. Essa conexão de linhagem—Bimba para Salário Mínimo para Nenei para Kiki da Bahia—representa um ramo importante da transmissão da Capoeira Regional do Brasil para os Estados Unidos.',
  -- achievements_en
  E'Direct student of Mestre Bimba (creator of Capoeira Regional); Founder of Abolição Capoeira group (2000); Facilitated Capoeira Regional courses in Bahia; Teacher of Mestre Nenei (father of Mestre Kiki da Bahia); Established Abolição Capoeira as a Ponto de Cultura in Bahia; Expanded group internationally to France',
  -- achievements_pt
  E'Aluno direto de Mestre Bimba (criador da Capoeira Regional); Fundador do grupo Abolição Capoeira (2000); Facilitou cursos de Capoeira Regional na Bahia; Professor de Mestre Nenei (pai de Mestre Kiki da Bahia); Estabeleceu a Abolição Capoeira como Ponto de Cultura na Bahia; Expandiu o grupo internacionalmente para a França',
  -- notes_en
  E'FULL NAME:
One source (SciELO Books) mentions "Dielson Oliveira" as the full name, but this is not confirmed in other sources. Most references use only the apelido "Salário Mínimo".

BIRTH YEAR ESTIMATION (1945, decade precision):
Listed among "propagation phase" figures (1967-1973) in SciELO Books "Uma vida na Capoeira Regional" by Mestre Itapoan. If actively training/teaching during this phase at age 20-28, birth range ~1939-1953. Still actively teaching courses in 2008 (age ~55-69 if born 1939-1953). Using 1945 as midpoint estimate. Birth place assumed Salvador as he trained at Bimba''s CCFR there.

TEACHER:
- Mestre Bimba (direct student, trained at Centro de Cultura Física Regional da Bahia, Salvador)

STUDENTS:
- Mestre Nenei (father of Mestre Kiki da Bahia)
- Monitor Nó Cego (current instructor at Abolição Capoeira France)
- Contra Mestre Bobô (associated with Associação Cultural Abolição Capoeira)

GROUPS:
- Abolição Capoeira (founded 2000)
- Associação Cultural Abolição Capoeira (Ponto de Cultura in Camaçari)

ACTIVE LOCATIONS:
- Arembepe, Camaçari, Bahia (base of operations)
- Praça dos Coqueiros, Barracão Cultural Comunitário, Arembepe, Camaçari – BA. CEP: 42 835 00

EVENTS DOCUMENTED:
- December 2008: I Ginga Arembepe (Curso de Capoeira Regional facilitator)

DISAMBIGUATION:
- NOT related to "International Group of Capoeira Abolição" founded by Mestre Delei Kaçula (different group, contemporânea style, Miami-based)

NAME CONFUSION:
- Mestre Nenei (student of Salário Mínimo, father of Kiki da Bahia) is DIFFERENT from Mestre Nenel (Manoel Nascimento Machado, son of Mestre Bimba, born 1960)',
  -- notes_pt
  E'NOME COMPLETO:
Uma fonte (SciELO Books) menciona "Dielson Oliveira" como nome completo, mas isso não é confirmado em outras fontes. A maioria das referências usa apenas o apelido "Salário Mínimo".

ESTIMATIVA DE ANO DE NASCIMENTO (1945, precisão década):
Listado entre as figuras da "fase de propagação" (1967-1973) no livro SciELO Books "Uma vida na Capoeira Regional" de Mestre Itapoan. Se estava ativamente treinando/ensinando durante esta fase com idade de 20-28, faixa de nascimento ~1939-1953. Ainda ensinando ativamente cursos em 2008 (idade ~55-69 se nascido 1939-1953). Usando 1945 como estimativa do ponto médio. Local de nascimento presumido Salvador, pois treinou no CCFR de Bimba lá.

PROFESSOR:
- Mestre Bimba (aluno direto, treinou no Centro de Cultura Física Regional da Bahia, Salvador)

ALUNOS:
- Mestre Nenei (pai de Mestre Kiki da Bahia)
- Monitor Nó Cego (instrutor atual na Abolição Capoeira França)
- Contra Mestre Bobô (associado à Associação Cultural Abolição Capoeira)

GRUPOS:
- Abolição Capoeira (fundado em 2000)
- Associação Cultural Abolição Capoeira (Ponto de Cultura em Camaçari)

LOCAIS DE ATIVIDADE:
- Arembepe, Camaçari, Bahia (base de operações)
- Praça dos Coqueiros, Barracão Cultural Comunitário, Arembepe, Camaçari – BA. CEP: 42 835 00

EVENTOS DOCUMENTADOS:
- Dezembro de 2008: I Ginga Arembepe (facilitador de Curso de Capoeira Regional)

DESAMBIGUAÇÃO:
- NÃO relacionado ao "International Group of Capoeira Abolição" fundado por Mestre Delei Kaçula (grupo diferente, estilo contemporânea, baseado em Miami)

CONFUSÃO DE NOMES:
- Mestre Nenei (aluno de Salário Mínimo, pai de Kiki da Bahia) é DIFERENTE de Mestre Nenel (Manoel Nascimento Machado, filho de Mestre Bimba, nascido em 1960)'
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
