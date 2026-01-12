-- ============================================================
-- GENEALOGY PERSON: Virgílio de Ilhéus
-- Generated: 2026-01-12
-- ============================================================
-- José Virgílio dos Santos (1934-2024), known as Mestre Virgílio
-- de Ilhéus, was the oldest representative of Capoeira Angola in
-- Ilhéus, southern Bahia. Unique for his history disconnected
-- from the Salvador/Recôncavo region. Founded ACAM (2002) and
-- UCASUB (2004). Doctor Honoris Causa from UESC (2021).
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
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'José Virgílio dos Santos',
  'Virgílio de Ilhéus',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-48', 'https://portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-virgilio-de-ilheus/', 'https://www.cedefes.org.br/capoeira-em-ilheus-ba/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Pure Capoeira Angola from the Ilhéus tradition, distinct from the Salvador/Recôncavo lineages. Virgílio represents a unique branch of capoeira angola that developed in southern Bahia through informal street training with local mestres. His style preserved the traditional movements passed down from his teachers—Caranha, Chico da Onça, Claudemiro, João Valença, and Barreto—who transmitted the art in Ilhéus before formal academies existed.',
  E'Capoeira Angola pura da tradição de Ilhéus, distinta das linhagens de Salvador/Recôncavo. Virgílio representa um ramo único da capoeira angola que se desenvolveu no sul da Bahia através de treinamento informal nas ruas com mestres locais. Seu estilo preservou os movimentos tradicionais transmitidos por seus mestres—Caranha, Chico da Onça, Claudemiro, João Valença e Barreto—que transmitiram a arte em Ilhéus antes das academias formais existirem.',
  -- Life dates
  1934,
  'exact'::genealogy.date_precision,
  'Ilhéus, Bahia, Brazil',
  2024,
  'exact'::genealogy.date_precision,
  'Ilhéus, Bahia, Brazil',
  -- Extended content (bio_en)
  E'José Virgílio dos Santos was born on June 26, 1934, in Ilhéus, a port city in southern Bahia known for its cacao trade. Unlike most prominent capoeira mestres whose histories center on Salvador and the Recôncavo, Virgílio''s entire capoeira journey unfolded in his native region—making him a unique figure in capoeira history.

On July 28, 1944, at the age of nine or ten, young Virgílio was initiated into capoeira by Mestre Caranha. There were no formal capoeira academies in Ilhéus at the time—the art was taught on the streets, transmitted the way it had been for generations: through observation in the roda and direct practice. Beyond Caranha, Virgílio learned from a constellation of local mestres: Chico da Onça, Claudemiro, Álvaro, Elíscio, João Valença, and Barreto. Each contributed to his formation as a capoeirista.

In the 1950s, Mestre João Grande visited Ilhéus. João Grande himself had been born in the nearby village of Itagi, and though he had moved to Salvador to train under Pastinha, he maintained connections to his southern Bahian homeland. It was João Grande who recognized Virgílio''s skill and granted him the rank of contra-mestre—locally, João Grande was known as "João Bate-Estaca".

Throughout his life, Virgílio worked various jobs and traveled through several Brazilian cities, always maintaining contact with capoeira. But Ilhéus remained his base, and he dedicated himself to preserving and transmitting Capoeira Angola in the region.

In 2002, Virgílio founded the Associação de Capoeira Angola Mucumbo (ACAM), establishing a formal structure for capoeira training in Ilhéus. The association supported projects with children and adolescents, using capoeira as a tool for cultural preservation and social development. On December 28, 2004, he also founded the União de Capoeiristas do Sul da Bahia (UCASUB), serving as its first president, though he later departed from that organization.

Beyond ACAM, Virgílio taught Capoeira Angola at the Teatro Popular de Ilhéus and at the Terreiro de Matamba Tombenci Neto in the Alto da Conquista neighborhood—one of the oldest Candomblé terreiros in Bahia, with roots stretching back to 1885. This partnership with the terreiro reflected the deep connections between capoeira and Afro-Brazilian spirituality.

A prolific composer, Virgílio released an album of original songs, "Velho Angoleiro: Ladainhas e Corridos," in 2007 through the Capoeira Viva project. The CD featured approximately 20 compositions documenting his musical legacy.

For his lifetime dedication to the art of capoeira and the transmission of Afro-Brazilian culture, the Universidade Estadual de Santa Cruz (UESC) awarded him the title of Doctor Honoris Causa in 2021. The honor was proposed by Professor Camila Righetto Cassano and approved unanimously by CONSU on August 4, 2020, with the ceremony held on August 23, 2021. Professor Sanqueilo de Lima Santos emphasized that Virgílio represented "one of the oldest active Capoeira Angola masters, uniquely distinguished by his history outside the Salvador-Recôncavo region."

Virgílio trained hundreds of students throughout his career, ensuring that the Capoeira Angola tradition would continue in southern Bahia.

On March 12, 2024, Mestre Virgílio suffered a stroke and was hospitalized at the Hospital Regional Costa do Cacau. He passed away on March 17, 2024, at the age of 89. At his death, he was the oldest representative of the old guard of Capoeira Angola in Ilhéus.',
  -- Extended content (bio_pt)
  E'José Virgílio dos Santos nasceu em 26 de junho de 1934, em Ilhéus, uma cidade portuária no sul da Bahia conhecida pelo comércio de cacau. Diferente da maioria dos mestres de capoeira proeminentes cujas histórias se centram em Salvador e no Recôncavo, toda a jornada de Virgílio na capoeira se desenrolou em sua região natal—tornando-o uma figura única na história da capoeira.

Em 28 de julho de 1944, aos nove ou dez anos de idade, o jovem Virgílio foi iniciado na capoeira por Mestre Caranha. Não havia academias formais de capoeira em Ilhéus naquela época—a arte era ensinada nas ruas, transmitida da forma como havia sido por gerações: através da observação na roda e prática direta. Além de Caranha, Virgílio aprendeu com uma constelação de mestres locais: Chico da Onça, Claudemiro, Álvaro, Elíscio, João Valença e Barreto. Cada um contribuiu para sua formação como capoeirista.

Nos anos 1950, Mestre João Grande visitou Ilhéus. João Grande havia nascido na vizinha vila de Itagi, e embora tivesse se mudado para Salvador para treinar sob Pastinha, mantinha conexões com sua terra natal no sul da Bahia. Foi João Grande quem reconheceu a habilidade de Virgílio e lhe concedeu o título de contra-mestre—localmente, João Grande era conhecido como "João Bate-Estaca".

Ao longo de sua vida, Virgílio trabalhou em diversos empregos e viajou por várias cidades brasileiras, sempre mantendo contato com a capoeira. Mas Ilhéus permaneceu sua base, e ele se dedicou a preservar e transmitir a Capoeira Angola na região.

Em 2002, Virgílio fundou a Associação de Capoeira Angola Mucumbo (ACAM), estabelecendo uma estrutura formal para o treinamento de capoeira em Ilhéus. A associação apoiava projetos com crianças e adolescentes, usando a capoeira como ferramenta para preservação cultural e desenvolvimento social. Em 28 de dezembro de 2004, também fundou a União de Capoeiristas do Sul da Bahia (UCASUB), servindo como seu primeiro presidente, embora depois tenha se desligado dessa organização.

Além da ACAM, Virgílio ensinou Capoeira Angola no Teatro Popular de Ilhéus e no Terreiro de Matamba Tombenci Neto no bairro Alto da Conquista—um dos mais antigos terreiros de Candomblé da Bahia, com raízes que remontam a 1885. Esta parceria com o terreiro refletia as profundas conexões entre a capoeira e a espiritualidade afro-brasileira.

Compositor prolífico, Virgílio lançou um álbum de canções autorais, "Velho Angoleiro: Ladainhas e Corridos", em 2007 através do projeto Capoeira Viva. O CD apresentava aproximadamente 20 composições documentando seu legado musical.

Por sua dedicação de vida à arte da capoeira e à transmissão da cultura afro-brasileira, a Universidade Estadual de Santa Cruz (UESC) concedeu-lhe o título de Doutor Honoris Causa em 2021. A honraria foi proposta pela Professora Camila Righetto Cassano e aprovada unanimemente pelo CONSU em 4 de agosto de 2020, com a cerimônia realizada em 23 de agosto de 2021. O Professor Sanqueilo de Lima Santos enfatizou que Virgílio representava "um dos mestres de Capoeira Angola mais antigos em atividade, distintamente único por sua história fora da região Salvador-Recôncavo."

Virgílio formou centenas de alunos ao longo de sua carreira, garantindo que a tradição da Capoeira Angola continuasse no sul da Bahia.

Em 12 de março de 2024, Mestre Virgílio sofreu um AVC e foi hospitalizado no Hospital Regional Costa do Cacau. Faleceu em 17 de março de 2024, aos 89 anos de idade. Em sua morte, era o mais antigo representante da velha guarda da Capoeira Angola em Ilhéus.',
  -- Achievements (English)
  E'Doctor Honoris Causa from Universidade Estadual de Santa Cruz - UESC (2021); Founded Associação de Capoeira Angola Mucumbo - ACAM (2002); Founded União de Capoeiristas do Sul da Bahia - UCASUB (2004) as first president; Released album "Velho Angoleiro: Ladainhas e Corridos" with ~20 original compositions (2007); Received contra-mestre title from Mestre João Grande (1950s); Taught at Teatro Popular de Ilhéus; Taught at Terreiro de Matamba Tombenci Neto; Trained hundreds of students over 70+ years; Oldest representative of Capoeira Angola in Ilhéus',
  -- Achievements (Portuguese)
  E'Doutor Honoris Causa pela Universidade Estadual de Santa Cruz - UESC (2021); Fundou a Associação de Capoeira Angola Mucumbo - ACAM (2002); Fundou a União de Capoeiristas do Sul da Bahia - UCASUB (2004) como primeiro presidente; Lançou o álbum "Velho Angoleiro: Ladainhas e Corridos" com ~20 composições autorais (2007); Recebeu título de contra-mestre de Mestre João Grande (anos 1950); Ensinou no Teatro Popular de Ilhéus; Ensinou no Terreiro de Matamba Tombenci Neto; Formou centenas de alunos em mais de 70 anos; Mais antigo representante da Capoeira Angola em Ilhéus',
  -- Researcher notes (English)
  E'BIRTH DATE (June 26, 1934, exact):
Confirmed by velhosmestres.com, Portal Capoeira death notice, and UESC. Consistent across all sources.

DEATH DATE (March 17, 2024, exact):
Died at Hospital Regional Costa do Cacau after stroke (AVC) on March 12, 2024. Age 89 at death (would have turned 90 on June 26, 2024).

INITIATION DATE (July 28, 1944):
Specific date provided by velhosmestres.com. Age 9-10 at initiation.

TEACHERS:
- Mestre Caranha (primary teacher, initiated him July 28, 1944 in Ilhéus)
- Mestre Chico da Onça
- Mestre Claudemiro
- Mestre Álvaro
- Mestre Elíscio
- Mestre João Valença
- Mestre Barreto

CONTRA-MESTRE TITLE:
Granted in 1950s by Mestre João Grande. Locally known as "João Bate-Estaca" in Ilhéus region. João Grande was born in nearby Itagi, southern Bahia.

ORGANIZATIONS FOUNDED:
- ACAM (Associação de Capoeira Angola Mucumbo) - 2002, active
- UCASUB (União de Capoeiristas do Sul da Bahia) - December 28, 2004, later departed

TEACHING LOCATIONS:
- Barracão d''Angola (Ilhéus)
- Teatro Popular de Ilhéus
- Terreiro de Matamba Tombenci Neto (Alto da Conquista neighborhood)
- Olivença community (per cedefes.org)

MEDIA APPEARANCES:
- 2007: CD "Velho Angoleiro: Ladainhas e Corridos" (~18-20 tracks, Capoeira Viva project)
- 2010: "Resistências da Capoeira Angola no Sul da Bahia" event at UESC (age 76)
- Various photographs with João Grande and Mestre Cabello (per velhosmestres.com)

DOCTOR HONORIS CAUSA:
- Proposed by: Prof. Camila Righetto Cassano (Dept. of Biological Sciences)
- Supported by: Prof. Sanqueilo de Lima Santos (Dept. of Philosophy and Human Sciences)
- Approved: August 4, 2020 (CONSU 53rd meeting, unanimous)
- Ceremony: August 23, 2021

UNIQUE POSITION:
"Virgílio figura entre os mestres de Capoeira Angola mais antigos permanecendo em atividade e é único por sua história desvinculada da região de Salvador e Recôncavo" - velhosmestres.com

"JOÃO BATE-ESTACA" NICKNAME:
Local Ilhéus nickname for João Grande. Not widely documented in Salvador sources. May relate to his style or a specific incident. João Grande was born in Itagi, near Ilhéus.

STUDENTS:
No specific students named in sources. Trained "hundreds of students" (centenas de alunos). ACAM supported projects with children and adolescents since 2009.

TERREIRO CONNECTION:
Taught at Terreiro de Matamba Tombenci Neto—Candomblé angola nation terreiro founded 1885, led by Mãe Ilza (since 1973). One of oldest terreiros in Bahia.',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO (26 de junho de 1934, exata):
Confirmada por velhosmestres.com, nota de falecimento do Portal Capoeira e UESC. Consistente em todas as fontes.

DATA DE FALECIMENTO (17 de março de 2024, exata):
Faleceu no Hospital Regional Costa do Cacau após AVC em 12 de março de 2024. 89 anos ao falecer (completaria 90 em 26 de junho de 2024).

DATA DE INICIAÇÃO (28 de julho de 1944):
Data específica fornecida por velhosmestres.com. 9-10 anos na iniciação.

MESTRES:
- Mestre Caranha (mestre principal, iniciou-o em 28 de julho de 1944 em Ilhéus)
- Mestre Chico da Onça
- Mestre Claudemiro
- Mestre Álvaro
- Mestre Elíscio
- Mestre João Valença
- Mestre Barreto

TÍTULO DE CONTRA-MESTRE:
Concedido nos anos 1950 por Mestre João Grande. Localmente conhecido como "João Bate-Estaca" na região de Ilhéus. João Grande nasceu na vizinha Itagi, sul da Bahia.

ORGANIZAÇÕES FUNDADAS:
- ACAM (Associação de Capoeira Angola Mucumbo) - 2002, ativa
- UCASUB (União de Capoeiristas do Sul da Bahia) - 28 de dezembro de 2004, depois se desligou

LOCAIS DE ENSINO:
- Barracão d''Angola (Ilhéus)
- Teatro Popular de Ilhéus
- Terreiro de Matamba Tombenci Neto (bairro Alto da Conquista)
- Comunidade de Olivença (conforme cedefes.org)

APARIÇÕES NA MÍDIA:
- 2007: CD "Velho Angoleiro: Ladainhas e Corridos" (~18-20 faixas, projeto Capoeira Viva)
- 2010: Evento "Resistências da Capoeira Angola no Sul da Bahia" na UESC (76 anos)
- Diversas fotografias com João Grande e Mestre Cabello (conforme velhosmestres.com)

DOUTOR HONORIS CAUSA:
- Proposto por: Profa. Camila Righetto Cassano (Dept. Ciências Biológicas)
- Apoiado por: Prof. Sanqueilo de Lima Santos (Dept. Filosofia e Ciências Humanas)
- Aprovado: 4 de agosto de 2020 (53ª reunião do CONSU, unanimidade)
- Cerimônia: 23 de agosto de 2021

POSIÇÃO ÚNICA:
"Virgílio figura entre os mestres de Capoeira Angola mais antigos permanecendo em atividade e é único por sua história desvinculada da região de Salvador e Recôncavo" - velhosmestres.com

APELIDO "JOÃO BATE-ESTACA":
Apelido local de Ilhéus para João Grande. Não amplamente documentado em fontes de Salvador. Pode relacionar-se ao seu estilo ou incidente específico. João Grande nasceu em Itagi, perto de Ilhéus.

ALUNOS:
Nenhum aluno específico nomeado nas fontes. Formou "centenas de alunos". ACAM apoiou projetos com crianças e adolescentes desde 2009.

CONEXÃO COM TERREIRO:
Ensinou no Terreiro de Matamba Tombenci Neto—terreiro de Candomblé nação angola fundado em 1885, liderado por Mãe Ilza (desde 1973). Um dos mais antigos terreiros da Bahia.'
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
