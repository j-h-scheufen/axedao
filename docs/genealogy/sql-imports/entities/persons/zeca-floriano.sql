-- ============================================================
-- GENEALOGY PERSON: Zeca Floriano
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
  'José Floriano Peixoto',
  'Zeca Floriano',
  NULL,  -- Not formally titled as capoeira mestre
  NULL,  -- No public domain portrait found
  ARRAY['https://www.scielo.br/j/heduc/a/xThjX4DzwVwkbbqT65Y8DPc/', 'https://www.tapology.com/fightcenter/fighters/267234-jose-floriano-peixoto-zeca']::text[],
  -- Capoeira-specific
  NULL,  -- Style distinctions (Angola/Regional) did not exist in his era
  E'Zeca Floriano was a versatile martial artist who practiced capoeira carioca/pernada alongside boxing, Greco-Roman wrestling, jiu-jitsu, and savate. His approach to fighting was cross-disciplinary, typical of early 20th century sportsmen who combined multiple combat traditions. He transmitted pernada (the leg-sweep fighting game) and capoeira carioca to students like Sinhozinho around 1908. His capoeira practice likely came from his father Marshal Floriano Peixoto, who was documented as a capoeiragem practitioner.',
  E'Zeca Floriano foi um artista marcial versátil que praticava capoeira carioca/pernada junto com boxe, luta greco-romana, jiu-jitsu e savate. Sua abordagem de luta era interdisciplinar, típica dos esportistas do início do século XX que combinavam múltiplas tradições de combate. Ele transmitiu a pernada (o jogo de rasteira) e a capoeira carioca para alunos como Sinhozinho por volta de 1908. Sua prática de capoeira provavelmente veio de seu pai, Marechal Floriano Peixoto, que foi documentado como praticante de capoeiragem.',
  -- Life dates
  1887,
  'year'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  1970,
  'decade'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- bio_en
  E'José Floriano Peixoto, known as Zeca Floriano, was the youngest son of Marshal Floriano Peixoto, Brazil''s second president (1891-1894), and Josina Vieira Peixoto. Born August 5, 1887 in Rio de Janeiro, he grew up in privilege but rejected a military career at age fifteen to pursue the circus.

Zeca became one of Brazil''s first true sportsmen—a medalist in approximately eighteen disciplines including boxing, Greco-Roman wrestling, weightlifting, swimming, football, athletics, and Olympic gymnastics. At a time when the ideal Brazilian physique was lean, Zeca cultivated a strong, muscular body that was considered extravagant and even shocking.

His combat credentials were extraordinary. He won Brazil''s National Greco-Roman Wrestling Championship at São Paulo''s Politeama theater between 1908 and 1909, defeating renowned international wrestlers like Austrian George Rihsbacher, German Scharmann, and Italian Segatto. He famously entered a lion''s cage (the animal named Marrusko) for a prize and fought a bear named Kluka in circus performances.

But Zeca also carried his father''s legacy in a more clandestine art. Marshal Floriano Peixoto himself had been documented as a practitioner of capoeiragem—that violent underground fighting tradition that the very government he led had criminalized in 1890. Zeca inherited this knowledge and continued practicing pernada and capoeira carioca, the distinctly Rio de Janeiro fighting style that combined leg sweeps, kicks, and unbalancing techniques.

In 1908, when young Agenor Moreira Sampaio''s family moved to Rio de Janeiro, they found themselves neighbors with the president''s son. Agenor—who would become Mestre Sinhozinho—trained with Zeca for several years, learning pernada and the local capoeira carioca tradition. This transmission occurred just before Sinhozinho witnessed the legendary Cyriaco-Sada Miyako fight in May 1909, which would inspire him to systematize his own approach.

Beyond fighting, Zeca founded and directed the "Pavilhão Floriano" or "Circo Floriano", touring Rio de Janeiro, São Paulo, Pernambuco, and Paraíba. He established several athletic institutions: the "Escola Atlética Modelo José Floriano Peixoto" (1915), the "Esporte Clube S. Cristóvão", and a "Escola de Cultura Física" in Recife (1933). In 1939, he was appointed Chief Instructor of Physical Education for Rio''s Security Directorate, a position he held until at least 1955.

In March 1911, he performed a heroic rescue, saving approximately 80 people from a shipwreck in Salvador, Bahia. His boxing career recorded 7 wins, 1 loss, and 4 draws, with his last documented fight on January 20, 1933 against João Baldi at Circo Nerino in Recife.

Zeca Floriano lived into his eighties. Researchers have found birthday greetings published for him as late as August 1966, but his mentions in the press cease by November 1972. The exact date and location of his death remain unknown.',
  -- bio_pt
  E'José Floriano Peixoto, conhecido como Zeca Floriano, era o filho caçula do Marechal Floriano Peixoto, segundo presidente do Brasil (1891-1894), e de Josina Vieira Peixoto. Nascido em 5 de agosto de 1887 no Rio de Janeiro, cresceu em privilégio mas rejeitou a carreira militar aos quinze anos para seguir o circo.

Zeca tornou-se um dos primeiros verdadeiros esportistas do Brasil—medalhista em aproximadamente dezoito modalidades incluindo boxe, luta greco-romana, halterofilismo, natação, futebol, atletismo e ginástica olímpica. Numa época em que o físico brasileiro ideal era magro, Zeca cultivou um corpo forte e musculoso que era considerado extravagante e até chocante.

Suas credenciais de combate eram extraordinárias. Ganhou o Campeonato Nacional Brasileiro de Luta Greco-Romana no Politeama de São Paulo entre 1908 e 1909, derrotando lutadores internacionais renomados como o austríaco George Rihsbacher, o alemão Scharmann e o italiano Segatto. Famosamente entrou na jaula de um leão (o animal chamado Marrusko) por um prêmio e lutou contra um urso chamado Kluka em apresentações de circo.

Mas Zeca também carregava o legado de seu pai em uma arte mais clandestina. O próprio Marechal Floriano Peixoto havia sido documentado como praticante de capoeiragem—aquela violenta tradição de luta subterrânea que o próprio governo que ele liderou havia criminalizado em 1890. Zeca herdou esse conhecimento e continuou praticando pernada e capoeira carioca, o estilo de luta distintamente carioca que combinava rasteiras, chutes e técnicas de desequilíbrio.

Em 1908, quando a família do jovem Agenor Moreira Sampaio se mudou para o Rio de Janeiro, tornaram-se vizinhos do filho do presidente. Agenor—que se tornaria Mestre Sinhozinho—treinou com Zeca por vários anos, aprendendo pernada e a tradição local de capoeira carioca. Essa transmissão ocorreu pouco antes de Sinhozinho testemunhar a lendária luta Cyriaco-Sada Miyako em maio de 1909, que o inspiraria a sistematizar sua própria abordagem.

Além das lutas, Zeca fundou e dirigiu o "Pavilhão Floriano" ou "Circo Floriano", excursionando pelo Rio de Janeiro, São Paulo, Pernambuco e Paraíba. Estabeleceu várias instituições atléticas: a "Escola Atlética Modelo José Floriano Peixoto" (1915), o "Esporte Clube S. Cristóvão" e uma "Escola de Cultura Física" no Recife (1933). Em 1939, foi nomeado Instrutor Chefe de Educação Física da Diretoria de Segurança do Rio, cargo que ocupou até pelo menos 1955.

Em março de 1911, realizou um resgate heroico, salvando aproximadamente 80 pessoas de um naufrágio em Salvador, Bahia. Sua carreira no boxe registrou 7 vitórias, 1 derrota e 4 empates, com sua última luta documentada em 20 de janeiro de 1933 contra João Baldi no Circo Nerino em Recife.

Zeca Floriano viveu até os oitenta e poucos anos. Pesquisadores encontraram cumprimentos de aniversário publicados para ele até agosto de 1966, mas suas menções na imprensa cessam por volta de novembro de 1972. A data exata e o local de sua morte permanecem desconhecidos.',
  -- achievements_en
  'Champion of Brazil''s National Greco-Roman Wrestling Championship (1908-1909 at São Paulo Politeama); Medalist in approximately 18 sporting disciplines including boxing, wrestling, weightlifting, swimming; Founded "Escola Atlética Modelo José Floriano Peixoto" (1915); Founded "Escola de Cultura Física" in Recife (1933); Chief Instructor of Physical Education for Rio''s Security Directorate (1939-1955); Heroic rescue of ~80 people from Salvador shipwreck (March 4, 1911); Boxing record: 7-1-4; Taught pernada/capoeira carioca to Mestre Sinhozinho',
  -- achievements_pt
  'Campeão do Campeonato Nacional Brasileiro de Luta Greco-Romana (1908-1909 no Politeama de São Paulo); Medalhista em aproximadamente 18 modalidades esportivas incluindo boxe, luta, halterofilismo, natação; Fundou a "Escola Atlética Modelo José Floriano Peixoto" (1915); Fundou a "Escola de Cultura Física" no Recife (1933); Instrutor Chefe de Educação Física da Diretoria de Segurança do Rio (1939-1955); Resgate heroico de ~80 pessoas de naufrágio em Salvador (4 de março de 1911); Cartel no boxe: 7-1-4; Ensinou pernada/capoeira carioca para Mestre Sinhozinho',
  -- Researcher notes (English)
  E'BIRTH YEAR (1887): Academic sources (SciELO, Redalyc academic papers) give August 5, 1887 based on historical records. Some popular sources (Tapology, São Paulo Antiga) give 1885. Using academic research date.

DEATH YEAR (~1970, decade precision): No death record found. Academic research states he died "between August 1966 and November 1972" based on: (1) birthday greeting published in press August 1966, (2) mentions cease by November 1972, (3) from 1956 onward press coverage decreased significantly. Using 1970 as midpoint estimate.

NAME: Full name José Floriano Peixoto. "Zeca" is a common Brazilian nickname for José (like "Joe" in English). Also called "Zeca Floriano" in press and academic sources.

CAPOEIRA EVIDENCE:
- capoeirahistory.com explicitly calls him "excellent capoeirista and martial artist of several ring fights" who trained Sinhozinho in pernada/capoeira carioca
- His father Marshal Floriano Peixoto was documented as a practitioner of capoeiragem (mentioned in IPHAN dossiê and capoeira history sources)
- Academic papers on Zeca focus on his circus/athletics career and do NOT mention capoeira directly
- His training of Sinhozinho (1908+) is the primary documented capoeira connection

STUDENTS (documented):
- Sinhozinho (Agenor Moreira Sampaio) - trained in pernada/capoeira carioca ~1908-?

FAMILY RELATIONSHIP (capoeira-relevant):
- Father: Marshal Floriano Peixoto - documented as capoeiragem practitioner (not in genealogy as he was primarily a politician/military figure)',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1887): Fontes acadêmicas (artigos SciELO, Redalyc) indicam 5 de agosto de 1887 baseado em registros históricos. Algumas fontes populares (Tapology, São Paulo Antiga) dão 1885. Usando data da pesquisa acadêmica.

ANO DE MORTE (~1970, precisão de década): Nenhum registro de óbito encontrado. Pesquisa acadêmica indica que morreu "entre agosto de 1966 e novembro de 1972" baseado em: (1) cumprimento de aniversário publicado na imprensa em agosto de 1966, (2) menções cessam por volta de novembro de 1972, (3) a partir de 1956 a cobertura da imprensa diminuiu significativamente. Usando 1970 como estimativa de ponto médio.

NOME: Nome completo José Floriano Peixoto. "Zeca" é um apelido brasileiro comum para José. Também chamado "Zeca Floriano" na imprensa e fontes acadêmicas.

EVIDÊNCIA DE CAPOEIRA:
- capoeirahistory.com o chama explicitamente de "excelente capoeirista e artista marcial de várias lutas de ringue" que treinou Sinhozinho em pernada/capoeira carioca
- Seu pai Marechal Floriano Peixoto foi documentado como praticante de capoeiragem (mencionado no dossiê IPHAN e fontes de história da capoeira)
- Artigos acadêmicos sobre Zeca focam em sua carreira de circo/atletismo e NÃO mencionam capoeira diretamente
- Seu treinamento de Sinhozinho (1908+) é a principal conexão documentada com capoeira

ALUNOS (documentados):
- Sinhozinho (Agenor Moreira Sampaio) - treinou em pernada/capoeira carioca ~1908-?

RELACIONAMENTO FAMILIAR (relevante para capoeira):
- Pai: Marechal Floriano Peixoto - documentado como praticante de capoeiragem (não na genealogia pois era principalmente uma figura política/militar)'
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
