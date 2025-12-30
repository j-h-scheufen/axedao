-- ============================================================
-- GENEALOGY PERSON: Galo
-- Generated: 2025-12-25
-- ============================================================
-- Full Name: Luciano José Costa Figueiredo
-- Also known as: Galo
-- Style: Capoeira Regional
-- Training period with Mestre Bimba: 1960s (propagation phase 1967-1973)
-- Graduated lenço azul alongside Ezequiel at Mestre Bimba's academy
--
-- BIRTH YEAR ESTIMATION (1945, decade):
-- Galo graduated lenço azul alongside Ezequiel (b. 1941), suggesting similar age.
-- Academic records show Luciano José Costa Figueiredo with UFBA veterinary
-- degree (1971). If vet school typically starts at ~18 (5-6 year program),
-- graduation in 1971 suggests birth ~1947. As a contemporary of Ezequiel
-- (b. 1941), estimate: ~1945 (decade precision).
--
-- POSSIBLE PARALLEL CAREER:
-- An academic record shows Luciano José Costa Figueiredo with veterinary
-- medicine degree from UFBA (1971), Master's from UFMG (1974), and
-- Doctorate from Hannover, Germany (1983), later professor at UFBA.
-- The timeline (UFBA 1971) and location (Bahia) align with the capoeirista
-- Galo, suggesting this may be the same person pursuing an academic
-- career alongside capoeira. Requires further verification.
--
-- NOTE: DISTINCT from "Contramestre Galo" who founded Centro Cultural
-- Ie Galo Cantou Capoeira in the 1990s (different person, different era).
-- Also DISTINCT from "Mestre Galo" of Jundiaí who founded the first
-- capoeira academy in that city and trained Mestre Rã.
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
  -- Extended content (bilingual)
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Luciano José Costa Figueiredo',
  'Galo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://books.scielo.org/id/p65hq/pdf/campos-9788523217273-22.pdf', 'https://repositorio.ufba.br/bitstream/ri/11005/2/Helio Campos Parte 2.pdf']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Formado student of Mestre Bimba who completed the course and earned the lenço azul (blue handkerchief). Described as "a great defender of Bahian Regional Capoeira". Trained during the propagation phase (1967-1973) of Capoeira Regional, a period when Bimba''s methodology was being consolidated and spread. Participated in cultural exchanges with Candomblé alongside fellow students Itapoan, Russo, Bolão, and Xaréu, visiting Mãe Alice''s terreiro at Alto da Santa Cruz.',
  E'Aluno formado de Mestre Bimba que completou o curso e conquistou o lenço azul. Descrito como "um grande defensor da Capoeira Regional baiana". Treinou durante a fase de propagação (1967-1973) da Capoeira Regional, período em que a metodologia de Bimba estava sendo consolidada e difundida. Participou de intercâmbios culturais com o Candomblé junto com colegas Itapoan, Russo, Bolão e Xaréu, visitando o terreiro de Mãe Alice no Alto da Santa Cruz.',
  -- Life dates
  1945,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Luciano José Costa Figueiredo, known as Mestre Galo, was one of Mestre Bimba''s distinguished students at the Centro de Cultura Física e Luta Regional in Salvador, Bahia. He trained during what historian Esdras M. Santos identified as the "propagation phase" (1967-1973) of Capoeira Regional—a period when Bimba''s methodology had been consolidated and was being disseminated through a growing network of formados.

Galo graduated with the lenço azul (blue handkerchief), the mark of a formado in Mestre Bimba''s graduation system, alongside Eziquiel Martins Marinho (Mestre Ezequiel). The two trained together at Bimba''s academy and earned their formado status in the same graduation ceremony. This parallel graduation created a lasting bond between them as training companions of the same era.

Galo was part of an inner circle of dedicated students who went beyond mere physical training to engage with the cultural and spiritual dimensions that Mestre Bimba considered essential to complete capoeira education. On one memorable occasion, Galo joined fellow students César (Itapoan), Eglon (Russo), José Valmório (Bolão), and Hélio (Xaréu) when Mestre Bimba invited them to visit the Candomblé terreiro of Mãe Alice—his later wife and a respected Ialorixá—at Alto da Santa Cruz in the Nordeste de Amaralina neighborhood.

The terreiro, called Oiá Padê da Riméia, was a small blue-indigo house in the style common to the Recôncavo region. Upon arrival, Mãe Alice received the young capoeiristas and gave them a "passe" (spiritual cleansing) and a "reza" (prayer). The experience left a profound impression on the students. As recorded by Hélio Campos (Mestre Xaréu), the visit was Mestre Bimba''s strategy to bring his students closer to the rituals of Afro-Bahian culture from which many of them had been separated by their formal education.

Sources describe Galo as "a great defender of Bahian Regional Capoeira", indicating his commitment to preserving the authentic methodology and philosophy that Mestre Bimba had developed. He was counted among the notable students who stood out during the propagation phase, listed alongside Boinha (Batista Sampaio), Xaréu (Hélio José B. Carneiro de Campos), Prego (Roberto Fernando Diez), Arara (Fernando Vasconcelos), Volta Grande (Jorge Valente), Macaco (Gilson Sacramento), and Canhão (Augusto Salvador Brito).

Intriguingly, academic records show a Luciano José Costa Figueiredo who earned a veterinary medicine degree from the Universidade Federal da Bahia in 1971, followed by a Master''s from UFMG in 1974 and a Doctorate from the Veterinary School in Hannover, Germany in 1983, later becoming a professor at UFBA. The timeline and geographic alignment (Bahia, 1960s-1970s) suggest this may be the same person, indicating that Mestre Galo pursued a distinguished academic career in veterinary medicine parallel to his capoeira activities—a pattern consistent with many of Bimba''s students who came from educated backgrounds.',
  -- bio_pt
  E'Luciano José Costa Figueiredo, conhecido como Mestre Galo, foi um dos alunos destacados de Mestre Bimba no Centro de Cultura Física e Luta Regional em Salvador, Bahia. Treinou durante o que o historiador Esdras M. Santos identificou como a "fase de propagação" (1967-1973) da Capoeira Regional—período em que a metodologia de Bimba havia sido consolidada e estava sendo disseminada através de uma rede crescente de formados.

Galo formou-se com o lenço azul, a marca de um formado no sistema de graduação de Mestre Bimba, ao lado de Eziquiel Martins Marinho (Mestre Ezequiel). Os dois treinaram juntos na academia de Bimba e conquistaram seu status de formado na mesma cerimônia de formatura. Esta graduação paralela criou um laço duradouro entre eles como companheiros de treino da mesma época.

Galo fazia parte de um círculo interno de alunos dedicados que foram além do mero treinamento físico para se envolver com as dimensões culturais e espirituais que Mestre Bimba considerava essenciais para uma educação completa em capoeira. Em uma ocasião memorável, Galo juntou-se aos colegas César (Itapoan), Eglon (Russo), José Valmório (Bolão) e Hélio (Xaréu) quando Mestre Bimba os convidou para visitar o terreiro de Candomblé de Mãe Alice—sua esposa posterior e uma respeitada Ialorixá—no Alto da Santa Cruz, no bairro do Nordeste de Amaralina.

O terreiro, chamado Oiá Padê da Riméia, era uma pequena casa azul-índigo no estilo comum à região do Recôncavo. Ao chegarem, Mãe Alice recebeu os jovens capoeiristas e lhes deu um "passe" (limpeza espiritual) e uma "reza". A experiência deixou uma impressão profunda nos alunos. Como registrado por Hélio Campos (Mestre Xaréu), a visita foi a estratégia de Mestre Bimba para aproximar seus alunos dos rituais da cultura afro-baiana dos quais muitos deles haviam sido afastados por sua educação formal.

Fontes descrevem Galo como "um grande defensor da Capoeira Regional baiana", indicando seu compromisso em preservar a metodologia e filosofia autênticas que Mestre Bimba havia desenvolvido. Ele foi contado entre os alunos notáveis que se destacaram durante a fase de propagação, listado ao lado de Boinha (Batista Sampaio), Xaréu (Hélio José B. Carneiro de Campos), Prego (Roberto Fernando Diez), Arara (Fernando Vasconcelos), Volta Grande (Jorge Valente), Macaco (Gilson Sacramento) e Canhão (Augusto Salvador Brito).

Curiosamente, registros acadêmicos mostram um Luciano José Costa Figueiredo que obteve diploma em medicina veterinária pela Universidade Federal da Bahia em 1971, seguido de Mestrado pela UFMG em 1974 e Doutorado pela Escola de Veterinária de Hannover, Alemanha em 1983, tornando-se depois professor da UFBA. A linha do tempo e o alinhamento geográfico (Bahia, 1960s-1970s) sugerem que pode ser a mesma pessoa, indicando que Mestre Galo seguiu uma carreira acadêmica distinta em medicina veterinária paralela às suas atividades na capoeira—um padrão consistente com muitos dos alunos de Bimba que vinham de formações educacionais privilegiadas.',
  -- achievements_en
  E'Graduated lenço azul (blue handkerchief) as formado at Mestre Bimba''s Centro de Cultura Física e Luta Regional; Trained during propagation phase of Capoeira Regional (1967-1973); Participated in Candomblé cultural exchange visit with Mestre Bimba and fellow students',
  -- achievements_pt
  E'Formou-se com lenço azul como formado no Centro de Cultura Física e Luta Regional de Mestre Bimba; Treinou durante a fase de propagação da Capoeira Regional (1967-1973); Participou de visita de intercâmbio cultural ao Candomblé com Mestre Bimba e colegas',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1945, decade):
Galo graduated lenço azul alongside Ezequiel (b. 1941), suggesting similar age. Academic records show Luciano José Costa Figueiredo with UFBA veterinary degree (1971). If vet school typically starts at ~18 (5-6 year program), graduation in 1971 suggests birth ~1947. As a contemporary of Ezequiel (b. 1941), estimate: ~1945 (decade precision).

CAPOEIRA REGIONAL PHASES (per Esdras M. Santos "Conversando sobre capoeira"):
- Initial/Creation Phase: 1930-1937
- Consolidation Phase: 1938-1966
- Propagation Phase: 1967-1973
Galo is listed among students in the Propagation Phase.

GRADUATION:
- Received lenço azul (blue handkerchief) = formado status
- Graduated alongside Eziquiel Martins Marinho (Mestre Ezequiel)
- Trained at Centro de Cultura Física e Luta Regional, Terreiro de Jesus, Salvador

TRAINING COMPANIONS (Candomblé visit):
- César (Itapoan) - Raimundo César Alves de Almeida
- Eglon (Russo)
- José Valmório (Bolão) - José Valmório de Lacerda
- Hélio (Xaréu) - Hélio José B. Carneiro de Campos

CANDOMBLÉ VISIT:
- Terreiro: Oiá Padê da Riméia
- Location: Alto da Santa Cruz, Nordeste de Amaralina, Salvador
- Leader: Mãe Alice (D. Alice, later wife of Mestre Bimba)
- Experience: Received "passe" (spiritual cleansing) and "reza" (prayer)

PROPAGATION PHASE NOTABLE STUDENTS (alongside Galo):
- Batista Sampaio (Boinha)
- Hélio José B. Carneiro de Campos (Xaréu)
- Roberto Fernando Diez (Prego)
- Fernando Vasconcelos (Arara)
- Jorge Valente (Volta Grande)
- Gilson Sacramento (Macaco)
- Augusto Salvador Brito (Canhão)

POSSIBLE ACADEMIC CAREER (requires verification):
If Luciano José Costa Figueiredo the capoeirista is the same as the veterinarian:
- UFBA Veterinary Medicine degree: 1971
- UFMG Master''s: 1974
- Hannover (Germany) Doctorate: 1983
- Later professor at UFBA
Source: Escavador.com profile (could not verify definitively)

DISAMBIGUATION:
- DISTINCT from "Contramestre Galo" (Centro Cultural Ie Galo Cantou Capoeira, 1990s, contemporânea style)
- DISTINCT from "Mestre Galo" of Jundiaí (trained Mestre Rã, first academy in Jundiaí)
Both are different individuals from different eras.',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1945, década):
Galo formou-se com lenço azul ao lado de Ezequiel (n. 1941), sugerindo idade similar. Registros acadêmicos mostram Luciano José Costa Figueiredo com diploma de veterinária da UFBA (1971). Se a faculdade de veterinária tipicamente começa aos ~18 anos (programa de 5-6 anos), formatura em 1971 sugere nascimento ~1947. Como contemporâneo de Ezequiel (n. 1941), estimativa: ~1945 (precisão de década).

FASES DA CAPOEIRA REGIONAL (conforme Esdras M. Santos "Conversando sobre capoeira"):
- Fase Inicial/Criação: 1930-1937
- Fase de Consolidação: 1938-1966
- Fase de Propagação: 1967-1973
Galo está listado entre os alunos na Fase de Propagação.

FORMATURA:
- Recebeu lenço azul = status de formado
- Formou-se ao lado de Eziquiel Martins Marinho (Mestre Ezequiel)
- Treinou no Centro de Cultura Física e Luta Regional, Terreiro de Jesus, Salvador

COMPANHEIROS DE TREINO (visita ao Candomblé):
- César (Itapoan) - Raimundo César Alves de Almeida
- Eglon (Russo)
- José Valmório (Bolão) - José Valmório de Lacerda
- Hélio (Xaréu) - Hélio José B. Carneiro de Campos

VISITA AO CANDOMBLÉ:
- Terreiro: Oiá Padê da Riméia
- Local: Alto da Santa Cruz, Nordeste de Amaralina, Salvador
- Líder: Mãe Alice (D. Alice, esposa posterior de Mestre Bimba)
- Experiência: Recebeu "passe" (limpeza espiritual) e "reza"

ALUNOS NOTÁVEIS DA FASE DE PROPAGAÇÃO (ao lado de Galo):
- Batista Sampaio (Boinha)
- Hélio José B. Carneiro de Campos (Xaréu)
- Roberto Fernando Diez (Prego)
- Fernando Vasconcelos (Arara)
- Jorge Valente (Volta Grande)
- Gilson Sacramento (Macaco)
- Augusto Salvador Brito (Canhão)

POSSÍVEL CARREIRA ACADÊMICA (requer verificação):
Se Luciano José Costa Figueiredo o capoeirista é o mesmo que o veterinário:
- Diploma de Medicina Veterinária UFBA: 1971
- Mestrado UFMG: 1974
- Doutorado Hannover (Alemanha): 1983
- Depois professor da UFBA
Fonte: Perfil Escavador.com (não foi possível verificar definitivamente)

DESAMBIGUAÇÃO:
- DISTINTO de "Contramestre Galo" (Centro Cultural Ie Galo Cantou Capoeira, anos 1990, estilo contemporânea)
- DISTINTO de "Mestre Galo" de Jundiaí (treinou Mestre Rã, primeira academia em Jundiaí)
Ambos são indivíduos diferentes de épocas diferentes.'
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
