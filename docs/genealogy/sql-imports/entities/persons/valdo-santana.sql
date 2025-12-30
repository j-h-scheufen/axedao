-- ============================================================
-- GENEALOGY PERSON: Valdo Santana
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1930s, decade precision):
-- Waldemar Santana was born October 28, 1929. Valdo is described as
-- the "younger brother" (irmão mais novo). Given Valdo was active in
-- vale-tudo in 1958 (debut vs Euclides Pereira) as an adult fighter,
-- and co-founded Academia Santana with Waldemar around 1955-1956,
-- he was likely born in the early 1930s. Using 1935 as estimate.
-- ============================================================
-- DEATH: Deceased (confirmed "já falecidos" in sources), but no
-- specific date documented. Using NULL.
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
  'Valdo Santana',
  'Valdo Santana',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://www.isacaguiar.com.br/blog/a-relacao-entre-valdo-santana-e-waldemar-santana-irmaos-e-lendas-das-artes-marciais/', 'https://www.revistacarioca.com.br/revistacarioca/article/view/116', 'https://capoeirahistory.com/mestre/master-ze-pedro/']::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Trained in capoeira from youth in Rio de Janeiro, combining it with jiu-jitsu and luta livre techniques. Co-ran Academia Santana with his brother Waldemar, teaching judo, jiu-jitsu, capoeira, and luta livre. His versatile fighting style blended capoeira agility with grappling, creating an effective mixed approach for vale-tudo competition.',
  E'Treinou capoeira desde a juventude no Rio de Janeiro, combinando-a com técnicas de jiu-jitsu e luta livre. Co-administrou a Academia Santana com seu irmão Waldemar, ensinando judô, jiu-jitsu, capoeira e luta livre. Seu estilo de luta versátil combinava agilidade da capoeira com grappling, criando uma abordagem mista eficaz para competições de vale-tudo.',
  -- Life dates
  1935,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Valdo Santana was a capoeira mestre and vale-tudo fighter from Rio de Janeiro, and the younger brother of legendary fighter Waldemar Santana. From a young age, Valdo was drawn to martial arts, beginning his journey with capoeira. This early training provided him with a solid foundation in agility, rhythm, and strategy—skills that would prove invaluable in his later vale-tudo career.

Following his brother Waldemar''s expulsion from the Gracie Academy in 1955 and subsequent famous victory over Hélio Gracie, the Santana brothers opened Academia Santana in Rio de Janeiro. The academy was located above the Bar Amarelinho in the Cinelândia district. Together with their cousin Aurino and nephew Maneca, they built one of Rio''s most significant martial arts training centers. The academy taught judo, jiu-jitsu, capoeira, and luta livre, offering a comprehensive martial arts education.

Valdo gained notoriety in vale-tudo through his own fighting career. His 1958 debut on the television program "TV Ringue Torre" against Euclides Pereira marked his entrance into competitive fighting. Though he lost that match to Pereira, Valdo demonstrated his signature style—combining capoeira''s quick, unpredictable movements with jiu-jitsu ground techniques. Sources conflict on his match against Robson Gracie, with some claiming Valdo was victorious while others describe it as a draw. Regardless, the fight against a member of the famous Gracie family solidified his reputation in Brazilian martial arts.

Academia Santana became historically significant for capoeira when, in 1962, a young Paulo Flores Viana began training there before traveling to Salvador to study under Mestre Bimba. Fernando Campelo Cavalcanti de Albuquerque (later Mestre Gato) also trained at the academy. In 1964, Valdo invited Paulo Flores and Gato to represent Academia Santana at the Berimbau de Prata competition in Santa Teresa. Remarkably, these young capoeiristas placed third against established groups including Mestre Artur Emídio''s—a testament to the quality of training at Academia Santana. These young fighters would go on to found Grupo Senzala, one of the most influential capoeira organizations in the world.

Mestre Zé Pedro, who would become a grand master and leader of the legendary roda in Bonsucesso in the 1970s, had his first contact with capoeira when he witnessed capoeiristas practicing at Valdo Santana''s academy. This initial exposure motivated him to begin his own capoeira journey.

The Santana brothers'' contributions helped establish carioca capoeira (Rio de Janeiro capoeira) through their series of vale-tudo fights starting in 1955, combating the "kings of jiu-jitsu" as equals through both victories and defeats. They built a bridge between Bahian capoeira tradition and Rio de Janeiro''s martial arts scene.

Valdo''s legacy continues through his son Neivaldo Santana, a judo black belt and Rio de Janeiro municipal guard. Neivaldo is involved in community projects that use martial arts to promote citizenship and personal development, partnering with organizations like Legião da Boa Vontade, Rádio Brasil, and Prime Esportes to modernize martial arts practice spaces.',
  -- bio_pt
  E'Valdo Santana foi um mestre de capoeira e lutador de vale-tudo do Rio de Janeiro, irmão mais novo do lendário lutador Waldemar Santana. Desde jovem, Valdo foi atraído pelas artes marciais, começando sua jornada com a capoeira. Esse treinamento inicial lhe proporcionou uma base sólida em agilidade, ritmo e estratégia—habilidades que se provariam inestimáveis em sua carreira posterior no vale-tudo.

Após a expulsão de seu irmão Waldemar da Academia Gracie em 1955 e subsequente vitória famosa sobre Hélio Gracie, os irmãos Santana abriram a Academia Santana no Rio de Janeiro. A academia ficava acima do Bar Amarelinho no bairro da Cinelândia. Junto com seu primo Aurino e sobrinho Maneca, construíram um dos centros de treinamento de artes marciais mais significativos do Rio. A academia ensinava judô, jiu-jitsu, capoeira e luta livre, oferecendo uma educação marcial completa.

Valdo ganhou notoriedade no vale-tudo através de sua própria carreira de lutador. Sua estreia em 1958 no programa de televisão "TV Ringue Torre" contra Euclides Pereira marcou sua entrada nas lutas competitivas. Embora tenha perdido essa luta para Pereira, Valdo demonstrou seu estilo característico—combinando movimentos rápidos e imprevisíveis da capoeira com técnicas de solo do jiu-jitsu. Fontes divergem sobre sua luta contra Robson Gracie, com algumas alegando que Valdo foi vitorioso enquanto outras descrevem como empate. Independentemente, a luta contra um membro da famosa família Gracie solidificou sua reputação nas artes marciais brasileiras.

A Academia Santana tornou-se historicamente significativa para a capoeira quando, em 1962, um jovem Paulo Flores Viana começou a treinar lá antes de viajar para Salvador para estudar com Mestre Bimba. Fernando Campelo Cavalcanti de Albuquerque (mais tarde Mestre Gato) também treinou na academia. Em 1964, Valdo convidou Paulo Flores e Gato para representar a Academia Santana na competição Berimbau de Prata em Santa Teresa. Notavelmente, esses jovens capoeiristas ficaram em terceiro lugar contra grupos estabelecidos incluindo o de Mestre Artur Emídio—um testemunho da qualidade do treinamento na Academia Santana. Esses jovens lutadores fundariam o Grupo Senzala, uma das organizações de capoeira mais influentes do mundo.

Mestre Zé Pedro, que se tornaria grão-mestre e líder da lendária roda em Bonsucesso nos anos 1970, teve seu primeiro contato com a capoeira quando presenciou capoeiristas praticando na academia de Valdo Santana. Essa exposição inicial o motivou a começar sua própria jornada na capoeira.

As contribuições dos irmãos Santana ajudaram a estabelecer a capoeira carioca através de sua série de lutas de vale-tudo a partir de 1955, combatendo os "reis do jiu-jitsu" como iguais através de vitórias e derrotas. Construíram uma ponte entre a tradição da capoeira baiana e a cena de artes marciais do Rio de Janeiro.

O legado de Valdo continua através de seu filho Neivaldo Santana, faixa preta de judô e guarda municipal do Rio de Janeiro. Neivaldo está envolvido em projetos comunitários que usam artes marciais para promover cidadania e desenvolvimento pessoal, em parceria com organizações como Legião da Boa Vontade, Rádio Brasil e Prime Esportes para modernizar espaços de prática de artes marciais.',
  -- achievements_en
  E'Co-founded Academia Santana in Rio de Janeiro with brother Waldemar Santana (~1955-1956); Trained Paulo Flores and Mestre Gato who founded Grupo Senzala; Invited Paulo Flores and Gato to compete at Berimbau de Prata 1964 (3rd place); Vale-tudo fighter who fought Euclides Pereira (1958) and Robson Gracie; Bridge figure connecting Bahian capoeira with Rio de Janeiro; Helped establish carioca capoeira through vale-tudo competitions',
  -- achievements_pt
  E'Co-fundou a Academia Santana no Rio de Janeiro com o irmão Waldemar Santana (~1955-1956); Treinou Paulo Flores e Mestre Gato que fundaram o Grupo Senzala; Convidou Paulo Flores e Gato para competir no Berimbau de Prata 1964 (3º lugar); Lutador de vale-tudo que enfrentou Euclides Pereira (1958) e Robson Gracie; Figura de ligação conectando a capoeira baiana com o Rio de Janeiro; Ajudou a estabelecer a capoeira carioca através de competições de vale-tudo',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1935, decade precision):
Brother Waldemar was born October 28, 1929. Valdo described as "younger brother" (irmão mais novo). Active in vale-tudo by 1958 (debut vs Euclides Pereira) and co-founded Academia Santana ~1955-1956, suggesting he was born early 1930s. Using 1935 as midpoint estimate.

DEATH:
Sources confirm both brothers are deceased ("infelizmente já falecidos"), but no specific death date for Valdo has been documented.

FULL NAME:
Only "Valdo Santana" documented. No additional names found in sources.

BIRTHPLACE:
One source states "born in Rio de Janeiro" - distinct from brother Waldemar who was born in Salvador. This may explain why Valdo stayed in Rio while Waldemar moved between cities.

FIGHTING CAREER:
- 1958: Debut on TV Ringue Torre vs Euclides Pereira (lost)
- Date unknown: Fight with Robson Gracie (sources conflict: victory vs draw)
- Fought on television programa "TV Ringue Torre" - TV Jornal do Commercio

FIGHT VS ROBSON GRACIE - SOURCE CONFLICT:
- Blog do Aguiar: States Valdo defeated Robson Gracie
- Other sources: Describe it as a draw ("empataria com Valdo Santana")
- Robson''s own recollection mentions being badly hurt, father considered stopping fight
Recorded as disputed outcome.

TEACHERS:
- Capoeira from youth (specific teacher unknown)
- Likely trained with Waldemar and at Gracie academies

STUDENTS:
- Paulo Flores Viana (~1962) - later co-founded Grupo Senzala
- Mestre Gato (Fernando Campelo, early 1960s) - later co-founded Grupo Senzala
- Mestre Zé Pedro (exposure/inspiration - saw capoeiristas at academy)

FAMILY:
- Brother: Waldemar Santana (b. 1929, d. 1984)
- Son: Neivaldo Santana (judo black belt, municipal guard)
- Cousin: Aurino (helped run Academia Santana)
- Nephew: Maneca (helped run Academia Santana)

ACADEMIA SANTANA:
- Location: Above Bar Amarelinho, Cinelândia, Rio de Janeiro
- Opened: ~1955-1956 (after Waldemar''s Gracie expulsion)
- Taught: Judo, jiu-jitsu, capoeira, luta livre
- Significance: Trained future Grupo Senzala founders

ACADEMIC SOURCE:
"Construção da Prática da Capoeira no Rio de Janeiro Através dos Mestres Waldemar Santana e Valdo Santana" - Revista Carioca de Educação Física, v. 15, n. 2 (2020)',
  -- notes_pt
  E'ESTIMATIVA ANO DE NASCIMENTO (1935, precisão de década):
Irmão Waldemar nasceu em 28 de outubro de 1929. Valdo descrito como "irmão mais novo". Ativo no vale-tudo em 1958 (estreia vs Euclides Pereira) e co-fundou Academia Santana ~1955-1956, sugerindo nascimento no início dos anos 1930. Usando 1935 como estimativa central.

MORTE:
Fontes confirmam que ambos irmãos são falecidos ("infelizmente já falecidos"), mas nenhuma data específica de morte de Valdo foi documentada.

NOME COMPLETO:
Apenas "Valdo Santana" documentado. Nenhum nome adicional encontrado nas fontes.

LOCAL DE NASCIMENTO:
Uma fonte afirma "nascido no Rio de Janeiro" - distinto do irmão Waldemar que nasceu em Salvador. Isso pode explicar por que Valdo ficou no Rio enquanto Waldemar transitava entre cidades.

CARREIRA DE LUTA:
- 1958: Estreia no TV Ringue Torre vs Euclides Pereira (perdeu)
- Data desconhecida: Luta com Robson Gracie (fontes conflitam: vitória vs empate)
- Lutou no programa de televisão "TV Ringue Torre" - TV Jornal do Commercio

LUTA VS ROBSON GRACIE - CONFLITO DE FONTES:
- Blog do Aguiar: Afirma que Valdo derrotou Robson Gracie
- Outras fontes: Descrevem como empate ("empataria com Valdo Santana")
- Própria lembrança de Robson menciona estar muito machucado, pai considerou parar a luta
Registrado como resultado disputado.

MESTRES:
- Capoeira desde a juventude (mestre específico desconhecido)
- Provavelmente treinou com Waldemar e nas academias Gracie

ALUNOS:
- Paulo Flores Viana (~1962) - mais tarde co-fundou Grupo Senzala
- Mestre Gato (Fernando Campelo, início anos 1960) - mais tarde co-fundou Grupo Senzala
- Mestre Zé Pedro (exposição/inspiração - viu capoeiristas na academia)

FAMÍLIA:
- Irmão: Waldemar Santana (n. 1929, f. 1984)
- Filho: Neivaldo Santana (faixa preta de judô, guarda municipal)
- Primo: Aurino (ajudou a administrar Academia Santana)
- Sobrinho: Maneca (ajudou a administrar Academia Santana)

ACADEMIA SANTANA:
- Localização: Acima do Bar Amarelinho, Cinelândia, Rio de Janeiro
- Abertura: ~1955-1956 (após expulsão de Waldemar da Gracie)
- Ensinava: Judô, jiu-jitsu, capoeira, luta livre
- Significância: Treinou futuros fundadores do Grupo Senzala

FONTE ACADÊMICA:
"Construção da Prática da Capoeira no Rio de Janeiro Através dos Mestres Waldemar Santana e Valdo Santana" - Revista Carioca de Educação Física, v. 15, n. 2 (2020)'
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
