-- ============================================================
-- GENEALOGY PERSON: Pinta Preta da Lapa
-- Migrated: 2025-12-11
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
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Antônio da Rocha Azevedo',
  'Pinta Preta da Lapa',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[{"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro as chief of the Glória capoeiras.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro como chefe dos capoeiras da Glória.',
  -- Life dates
  1840,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed based on activity location
  1870,
  'exact'::genealogy.date_precision,
  'Rua da Alfândega, Rio de Janeiro, Brazil',
  -- bio_en
  E'Antônio da Rocha Azevedo, known as Pinta Preta da Lapa, was the chief of the capoeiras of Glória and a member of the National Guard in Rio de Janeiro. His death on January 6-7, 1870, marks the first documented newspaper reference to the famous rivalry between the Nagoas and Guaiamús—the two great capoeira federations that divided Rio de Janeiro.

On the night of the Festa dos Reis (Epiphany or King''s Day celebration), Pinta Preta led his Glória capoeiras in an attack on a "Sociedade de Reis"—a traditional celebration society—led by a man named Reginaldo. During the attack, they wounded a young man named Eduardo Felício from the Arsenal da Marinha who was playing piston (a brass instrument) with the society.

The wounding was taken as a grave insult. The following day, Manuel Maria Trindade (known as Manduca Tambor or Manduca Trindade), Antônio Pereira da Silva (known as Antonico Moleque or Antonico Capitão), Prudêncio José Ferreira, José da Silva Balão, and others planned their revenge. That night, while accompanying the same Sociedade de Reis, they received word that Pinta Preta and the Nagoas were on Rua da Alfândega. They went there disguised, beat him with clubs, and when he fell, Trindade delivered the fatal blow.

In a remarkable display of malandra cunning, Trindade and his companions whistled for the police, posed as victims of the Nagoas, and even helped with arrests of some Glória capoeiras. The next day, another man—João Maria da Silva Seabra, known as "Dr. Cereja"—was arrested for carrying a knife and boasting that he had wounded Pinta Preta. He was tried by jury and acquitted.

Two years later, in 1872, the chief of police was still investigating Pinta Preta''s murderers, describing him in official records as a "member of the National Guard" and "chief of the capoeiras of Glória."

Pinta Preta''s death triggered a cycle of vendetta killings documented by Plácido de Abreu in "Os Capoeiras" (1886): after Pinta Preta came the death of the "Caboclo Jacó" at Paula Matos, then the "Alemãozinho" near the Teatro Lírico do Campo, then César-Maneta on Praia do Peixe, and onward. As Abreu wrote, "these reprisals have continued until today."

His murder occurred on the eve of the return of Brazilian troops from the Paraguayan War (1864-1870), and historians suggest this timing was significant: the return of capoeiras who had been recruited for the war triggered a bloody struggle for positions with those who had stayed behind.',
  -- bio_pt
  E'Antônio da Rocha Azevedo, conhecido como Pinta Preta da Lapa, foi o chefe dos capoeiras da Glória e membro da Guarda Nacional no Rio de Janeiro. Sua morte em 6-7 de janeiro de 1870 marca a primeira referência documentada em jornais à famosa rivalidade entre os Nagoas e Guaiamús—as duas grandes federações de capoeira que dividiam o Rio de Janeiro.

Na noite da Festa dos Reis, Pinta Preta liderou seus capoeiras da Glória em um ataque a uma "Sociedade de Reis"—uma sociedade de celebração tradicional—liderada por um homem chamado Reginaldo. Durante o ataque, feriram um jovem chamado Eduardo Felício do Arsenal da Marinha que tocava pistom (um instrumento de sopro) com a sociedade.

O ferimento foi tomado como uma grave ofensa. No dia seguinte, Manuel Maria Trindade (conhecido como Manduca Tambor ou Manduca Trindade), Antônio Pereira da Silva (conhecido como Antonico Moleque ou Antonico Capitão), Prudêncio José Ferreira, José da Silva Balão e outros planejaram sua vingança. Naquela noite, enquanto acompanhavam a mesma Sociedade de Reis, receberam a notícia de que Pinta Preta e os Nagoas estavam na Rua da Alfândega. Foram lá disfarçados, bateram nele com cacetes, e quando ele caiu, Trindade desferiu o golpe fatal.

Em uma notável demonstração de astúcia malandra, Trindade e seus companheiros apitaram para a polícia, se passaram por vítimas dos Nagoas, e até ajudaram nas prisões de alguns capoeiras da Glória. No dia seguinte, outro homem—João Maria da Silva Seabra, conhecido como "Dr. Cereja"—foi preso por portar uma faca e se gabar de ter ferido Pinta Preta. Foi julgado pelo júri e absolvido.

Dois anos depois, em 1872, o chefe de polícia ainda investigava os assassinos de Pinta Preta, descrevendo-o nos registros oficiais como "membro da Guarda Nacional" e "chefe dos capoeiras da Glória."

A morte de Pinta Preta desencadeou um ciclo de mortes por vingança documentado por Plácido de Abreu em "Os Capoeiras" (1886): depois de Pinta Preta veio a morte do "Caboclo Jacó" em Paula Matos, depois o "Alemãozinho" perto do Teatro Lírico do Campo, depois César-Maneta na Praia do Peixe, e assim por diante. Como Abreu escreveu, "essas represálias continuaram até hoje."

Seu assassinato ocorreu às vésperas do retorno das tropas brasileiras da Guerra do Paraguai (1864-1870), e historiadores sugerem que esse momento foi significativo: o retorno de capoeiras que haviam sido recrutados para a guerra desencadeou uma luta sangrenta por posições com aqueles que haviam ficado.',
  -- achievements_en
  'Chief of the capoeiras of Glória; member of the National Guard; his death is the first documented newspaper reference to the Nagoas-Guaiamús rivalry',
  -- achievements_pt
  'Chefe dos capoeiras da Glória; membro da Guarda Nacional; sua morte é a primeira referência documentada em jornais à rivalidade Nagoas-Guaiamús',
  -- Researcher notes (English)
  E'FULL NAME: Antônio da Rocha Azevedo (from 1872 police records)

DEATH DATE: Night of January 6-7, 1870 (Festa dos Reis / Epiphany). Exact date confirmed by newspaper accounts.

DEATH LOCATION: Rua da Alfândega, near Travessa de S. Domingos, Rio de Janeiro.

BIRTH YEAR ESTIMATION (1840, decade precision): Was chief of Glória capoeiras and National Guard member in 1870. To hold both positions, likely 25-40 years old at death, placing birth in 1830s-1840s. Using 1840 as midpoint.

AFFILIATION: Chief of the capoeiras of Glória. The Glória capoeiras were part of the Nagoas federation (white color), though some sources describe Pinta Preta as being attacked BY the Nagoas, suggesting complex inter-factional dynamics.

KILLER: Manuel Maria Trindade (Manduca Tambor / Manduca Trindade) delivered the fatal blow. Accomplices included Antonico Moleque, Prudêncio José Ferreira, José da Silva Balão.

SIGNIFICANCE: First documented newspaper reference to Nagoas vs. Guaiamús rivalry (January 1870). His death triggered a documented vendetta cycle: Pinta Preta → Jacó → Alemãozinho → César-Maneta → etc.

SOURCES: Plácido de Abreu "Os Capoeiras" (1886); Carlos Eugênio Líbano Soares "A Negregada Instituição" (1999); contemporary newspaper accounts (1870, 1872).',
  -- Researcher notes (Portuguese)
  E'NOME COMPLETO: Antônio da Rocha Azevedo (dos registros policiais de 1872)

DATA DA MORTE: Noite de 6-7 de janeiro de 1870 (Festa dos Reis / Epifania). Data exata confirmada por relatos de jornais.

LOCAL DA MORTE: Rua da Alfândega, perto da Travessa de S. Domingos, Rio de Janeiro.

ESTIMATIVA DO ANO DE NASCIMENTO (1840, precisão de década): Era chefe dos capoeiras da Glória e membro da Guarda Nacional em 1870. Para ocupar ambas as posições, provavelmente tinha 25-40 anos na morte, colocando o nascimento nos anos 1830-1840. Usando 1840 como ponto médio.

AFILIAÇÃO: Chefe dos capoeiras da Glória. Os capoeiras da Glória faziam parte da federação Nagoas (cor branca), embora algumas fontes descrevam Pinta Preta como sendo atacado PELOS Nagoas, sugerindo dinâmicas inter-faccionais complexas.

ASSASSINO: Manuel Maria Trindade (Manduca Tambor / Manduca Trindade) desferiu o golpe fatal. Cúmplices incluíam Antonico Moleque, Prudêncio José Ferreira, José da Silva Balão.

SIGNIFICÂNCIA: Primeira referência documentada em jornais à rivalidade Nagoas vs. Guaiamús (janeiro de 1870). Sua morte desencadeou um ciclo de vingança documentado: Pinta Preta → Jacó → Alemãozinho → César-Maneta → etc.

FONTES: Plácido de Abreu "Os Capoeiras" (1886); Carlos Eugênio Líbano Soares "A Negregada Instituição" (1999); relatos contemporâneos de jornais (1870, 1872).'
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
