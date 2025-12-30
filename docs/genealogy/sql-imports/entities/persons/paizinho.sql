-- ============================================================
-- GENEALOGY PERSON: Paizinho (Teodoro Ramos)
-- Generated: 2025-12-20
-- ============================================================
-- BIRTH YEAR ESTIMATION (1890, decade precision):
-- Paizinho was an established mestre teaching young Artur Emídio
-- from 1937. If he was teaching a 7-year-old and running an academy,
-- he was likely 30-50 years old at that time. Working backwards:
-- - Teaching from 1937, died 1945/1946
-- - If he was 45-55 at death, born ~1890-1900
-- - If he was 30-40 when teaching in 1937, born ~1897-1907
-- Using 1890 as estimate with decade precision to allow for the
-- probability he was an established older mestre when teaching.
--
-- DEATH YEAR DISCREPANCY (1945 vs 1946):
-- - capoeirahistory.com: 1945
-- - velhosmestres.com: 1946 (mentions meningitis)
-- Using 1945 as primary (majority of sources), noting discrepancy.
--
-- DEATH CIRCUMSTANCES:
-- Primary account (Artur Emídio): "morte morrida" - died of meningitis
-- Legendary account: On moonlit nights attempted to fly from a coconut
-- tree using palm leaves as wings like Icarus; fell to his death.
-- The Icarus legend appears to be local folklore rather than fact.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  'Teodoro Ramos',
  'Paizinho',
  NULL,  -- No context needed; unique apelido
  NULL,  -- No formal title documented (pre-formal title era)
  NULL,  -- No portrait available
  ARRAY[
    'https://velhosmestres.com/en/featured-69',
    'https://capoeirahistory.com/mestre/master-artur-emidio-1930-2011/'
  ]::text[],
  -- Capoeira-specific
  NULL,  -- Style classification not applicable for pre-codification era
  E'Paizinho taught capoeira in Itabuna during the height of the criminalization period (1890-1937). His training methods were necessarily clandestine—he trained students "on hilltops, in alleyways, at night and always hidden" according to his student Artur Emídio. He woke his young students at 6 AM for practice before authorities were active. Despite numerous arrests, he returned to teaching the same evening after bail was paid, driven by love for the art. His capoeira predated the Angola/Regional distinction, representing the organic pre-codification tradition of the southern Bahia cocoa region.',
  E'Paizinho ensinava capoeira em Itabuna durante o auge do período de criminalização (1890-1937). Seus métodos de treinamento eram necessariamente clandestinos—treinava alunos "no alto dos morros, nos becos, à noite e sempre escondidos" segundo seu aluno Artur Emídio. Acordava seus jovens alunos às 6 da manhã para treinar antes que as autoridades estivessem ativas. Apesar de inúmeras prisões, voltava a ensinar na mesma noite após o pagamento da fiança, movido pelo amor à arte. Sua capoeira antecedeu a distinção Angola/Regional, representando a tradição orgânica pré-codificação da região cacaueira do sul da Bahia.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  NULL,  -- Birth place unknown (likely southern Bahia region)
  1945,
  'year'::genealogy.date_precision,
  'Itabuna, Bahia',
  -- Extended content (English)
  E'Mestre Paizinho, born Teodoro Ramos, was a capoeirista who taught in Itabuna, in the southern Bahia cocoa belt, during the era when capoeira was criminalized in Brazil. He represents a crucial link in one of the most important lineages in capoeira history, connecting the African-born Mestre Neném to Mestre Artur Emídio, who would become one of the four founding lineages of contemporary capoeira in Rio de Janeiro.

Paizinho was a disciple of Mestre Neném, described as "an African" or "of African origin", making Paizinho a second-generation practitioner from the African diaspora. Almost nothing is known about his early life or how he came to study under Neném, but he established himself as a teacher in Itabuna during the prohibition era.

What we know of Paizinho comes primarily from the testimony of his most famous student, Artur Emídio de Oliveira, who began training with him in 1937 at age seven. Paizinho would go to Artur''s house on Rua Direita in the Pontalzinho neighborhood at 6 AM each morning to wake him for training. The training took place "in the street, on the pavement" but also in secret locations due to the legal prohibition.

In Artur Emídio''s recounting: "The practice of Capoeira was prohibited. They trained on top of hills, in alleyways, at night and always hidden. Many were the times that my Master was arrested. But the next day the bail was paid, and he would leave. And at night, he would return to teach Capoeira, practiced for love!"

This vivid account captures the dangerous conditions under which Paizinho preserved and transmitted capoeira. The southern Bahia region, particularly around Itabuna and Ilhéus in the cocoa-growing belt, developed its own capoeira tradition separate from the more documented Salvador schools. This tradition was characterized by strict secrecy, training in remote locations, night-time practice, and strong master-student bonds forged under persecution.

Paizinho ran a capoeira academy in Itabuna—one of the few formal training spaces outside of Salvador during this period. His willingness to be repeatedly arrested rather than abandon teaching demonstrates the depth of his commitment to the art.

He died in 1945, struck by meningitis according to Artur Emídio. However, local legend tells a more fantastical story: that on moonlit nights in Itabuna and Ilhéus, Paizinho attempted to fly from the top of a coconut tree using palm leaves as wings, like Icarus in Greek mythology, and fell to his death. Artur Emídio dismissed this as legend, describing Paizinho''s death as "morte morrida" (natural death).

After Paizinho''s death, the fifteen-year-old Artur Emídio took over his master''s academy and began teaching Paizinho''s former students. Despite his youth, he quickly gained recognition, even receiving visiting students from Salvador. This act of continuation ensured that Paizinho''s lineage would survive and eventually flourish in Rio de Janeiro, where Artur Emídio would become one of the most influential figures in contemporary capoeira history.',
  -- Extended content (Portuguese)
  E'Mestre Paizinho, nascido Teodoro Ramos, foi um capoeirista que ensinou em Itabuna, na zona cacaueira do sul da Bahia, durante a era em que a capoeira era criminalizada no Brasil. Ele representa um elo crucial em uma das linhagens mais importantes da história da capoeira, conectando o africano Mestre Neném a Mestre Artur Emídio, que se tornaria uma das quatro linhagens fundadoras da capoeira contemporânea no Rio de Janeiro.

Paizinho foi discípulo de Mestre Neném, descrito como "um africano" ou "de origem africana", fazendo de Paizinho um praticante de segunda geração da diáspora africana. Quase nada se sabe sobre sua vida inicial ou como veio a estudar com Neném, mas ele se estabeleceu como professor em Itabuna durante a era de proibição.

O que sabemos de Paizinho vem principalmente do testemunho de seu aluno mais famoso, Artur Emídio de Oliveira, que começou a treinar com ele em 1937 aos sete anos. Paizinho ia à casa de Artur na Rua Direita, no bairro do Pontalzinho, às 6 da manhã cada dia para acordá-lo para o treino. O treinamento acontecia "na rua, no passeio" mas também em locais secretos devido à proibição legal.

No relato de Artur Emídio: "A prática da Capoeira era proibida. Treinavam no alto dos morros, nos becos, à noite e sempre escondidos. Muitas foram as vezes que meu Mestre foi preso. Mas no dia seguinte a fiança era paga, e ele saía. E à noite, voltava a ensinar Capoeira, praticada por amor!"

Este relato vívido captura as condições perigosas sob as quais Paizinho preservou e transmitiu a capoeira. A região sul da Bahia, particularmente em torno de Itabuna e Ilhéus na zona cacaueira, desenvolveu sua própria tradição de capoeira separada das escolas mais documentadas de Salvador. Esta tradição era caracterizada por sigilo estrito, treinamento em locais remotos, prática noturna e fortes laços mestre-aluno forjados sob perseguição.

Paizinho dirigia uma academia de capoeira em Itabuna—um dos poucos espaços formais de treinamento fora de Salvador durante este período. Sua disposição em ser repetidamente preso em vez de abandonar o ensino demonstra a profundidade de seu compromisso com a arte.

Ele morreu em 1945, vítima de meningite segundo Artur Emídio. No entanto, a lenda local conta uma história mais fantástica: que em noites de lua em Itabuna e Ilhéus, Paizinho tentou voar do alto de um coqueiro usando folhas de palmeira como asas, como Ícaro na mitologia grega, e caiu para a morte. Artur Emídio descartou isso como lenda, descrevendo a morte de Paizinho como "morte morrida" (morte natural).

Após a morte de Paizinho, o jovem Artur Emídio de quinze anos assumiu a academia de seu mestre e começou a ensinar os antigos alunos de Paizinho. Apesar da pouca idade, rapidamente ganhou reconhecimento, recebendo até alunos visitantes de Salvador. Este ato de continuação garantiu que a linhagem de Paizinho sobrevivesse e eventualmente florescesse no Rio de Janeiro, onde Artur Emídio se tornaria uma das figuras mais influentes na história da capoeira contemporânea.',
  -- Achievements (English)
  E'- Disciple of Mestre Neném (African-born), second generation from African diaspora
- Established capoeira academy in Itabuna during criminalization period
- Primary teacher of Mestre Artur Emídio (1937-1945)
- Preserved and transmitted capoeira under persecution (multiple arrests)
- Anchor of lineage that produced one of four founding lineages of contemporary Rio de Janeiro capoeira
- Early morning training regimen (6 AM daily) with young students
- Continued teaching same evening after each arrest—"practiced for love"',
  -- Achievements (Portuguese)
  E'- Discípulo de Mestre Neném (nascido na África), segunda geração da diáspora africana
- Estabeleceu academia de capoeira em Itabuna durante período de criminalização
- Professor principal de Mestre Artur Emídio (1937-1945)
- Preservou e transmitiu capoeira sob perseguição (múltiplas prisões)
- Âncora da linhagem que produziu uma das quatro linhagens fundadoras da capoeira contemporânea do Rio de Janeiro
- Regime de treinamento matinal (6 da manhã diariamente) com jovens alunos
- Continuava ensinando na mesma noite após cada prisão—"praticada por amor"',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1890, decade precision):
Paizinho was an established mestre teaching young Artur Emídio from 1937. If he was teaching a 7-year-old and running an academy, he was likely 30-50 years old at that time.
- Teaching from 1937, died 1945/1946
- If 45-55 at death, born ~1890-1900
- If 30-40 when teaching started (1937), born ~1897-1907
- Using 1890 as midpoint estimate with decade precision

DEATH YEAR DISCREPANCY:
- capoeirahistory.com, nossa-tribo.com, portalcapoeira.com: 1945
- velhosmestres.com: 1946
Using 1945 as primary (majority of sources).

DEATH CIRCUMSTANCES:
Two accounts exist:
1. Primary (Artur Emídio): "morte morrida" - natural death from meningitis
2. Legend: Attempted to fly from coconut tree using palm leaves as wings like Icarus; fell to death
Artur Emídio explicitly rejected the Icarus legend. Using meningitis as documented cause.

TEACHER:
- Mestre Neném (apelido_context=''Itabuna'') - African-born; Layer Zero figure

STUDENTS:
- Artur Emídio de Oliveira (1930-2011) - began training 1937, age 7; took over academy 1945

TRAINING CONDITIONS:
- Location: Itabuna, Bahia (cocoa belt region)
- Training sites: "hilltops, alleyways, at night, always hidden"
- Street training: "in the street, on the pavement"
- Time: 6 AM daily (before authorities active)
- Ran formal academy in Itabuna

ARRESTS:
Multiple arrests documented. Pattern: arrested, bail paid next day, returned to teaching same evening.
Quote (Artur Emídio): "Many were the times that my Master was arrested. But the next day the bail was paid, and he would leave. And at night, he would return to teach Capoeira, practiced for love!"

ICARUS LEGEND CONTEXT:
Described as occurring "on moonlit nights in Itabuna and Ilhéus". Appears to be local folklore; Artur Emídio''s direct testimony disputes it. May reflect community mythologizing of a mysterious teacher figure.

LINEAGE CHAIN:
Neném (African, ~1860-?) → Paizinho (Teodoro Ramos, ~1890-1945) → Artur Emídio (1930-2011) → [Leopoldina, Djalma Bandeira, Paulo Gomes, Celso do Engenho, Mendonça, etc.]

SOURCES CONSULTED:
- velhosmestres.com/en/featured-69 (Artur Emídio profile - primary)
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- capoeirahistory.com/mestre/master-paulo-gomes/
- nossa-tribo.com/mestre-artur-emidio/
- portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-artur-emidio/
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/ (documentary)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1890, precisão de década):
Paizinho era um mestre estabelecido ensinando o jovem Artur Emídio a partir de 1937. Se estava ensinando uma criança de 7 anos e dirigindo uma academia, provavelmente tinha 30-50 anos naquela época.
- Ensinando a partir de 1937, morreu 1945/1946
- Se tinha 45-55 na morte, nasceu ~1890-1900
- Se tinha 30-40 quando começou a ensinar (1937), nasceu ~1897-1907
- Usando 1890 como estimativa do ponto médio com precisão de década

DISCREPÂNCIA DE ANO DE MORTE:
- capoeirahistory.com, nossa-tribo.com, portalcapoeira.com: 1945
- velhosmestres.com: 1946
Usando 1945 como primário (maioria das fontes).

CIRCUNSTÂNCIAS DA MORTE:
Existem dois relatos:
1. Primário (Artur Emídio): "morte morrida" - morte natural por meningite
2. Lenda: Tentou voar de um coqueiro usando folhas de palmeira como asas como Ícaro; caiu para a morte
Artur Emídio explicitamente rejeitou a lenda de Ícaro. Usando meningite como causa documentada.

PROFESSOR:
- Mestre Neném (apelido_context=''Itabuna'') - Nascido na África; figura da Camada Zero

ALUNOS:
- Artur Emídio de Oliveira (1930-2011) - começou a treinar em 1937, aos 7 anos; assumiu a academia em 1945

CONDIÇÕES DE TREINAMENTO:
- Local: Itabuna, Bahia (região cacaueira)
- Locais de treino: "topos de morros, becos, à noite, sempre escondidos"
- Treino de rua: "na rua, no passeio"
- Horário: 6 da manhã diariamente (antes das autoridades estarem ativas)
- Dirigia academia formal em Itabuna

PRISÕES:
Múltiplas prisões documentadas. Padrão: preso, fiança paga no dia seguinte, voltava a ensinar na mesma noite.
Citação (Artur Emídio): "Muitas foram as vezes que meu Mestre foi preso. Mas no dia seguinte a fiança era paga, e ele saía. E à noite, voltava a ensinar Capoeira, praticada por amor!"

CONTEXTO DA LENDA DE ÍCARO:
Descrito como ocorrendo "em noites de lua em Itabuna e Ilhéus". Parece ser folclore local; o testemunho direto de Artur Emídio o disputa. Pode refletir a mitologização comunitária de uma figura de mestre misteriosa.

CADEIA DE LINHAGEM:
Neném (Africano, ~1860-?) → Paizinho (Teodoro Ramos, ~1890-1945) → Artur Emídio (1930-2011) → [Leopoldina, Djalma Bandeira, Paulo Gomes, Celso do Engenho, Mendonça, etc.]

FONTES CONSULTADAS:
- velhosmestres.com/en/featured-69 (perfil de Artur Emídio - primária)
- capoeirahistory.com/mestre/master-artur-emidio-1930-2011/
- capoeirahistory.com/mestre/master-paulo-gomes/
- nossa-tribo.com/mestre-artur-emidio/
- portalcapoeira.com/capoeira/noticias-atualidades/nota-de-falecimento-mestre-artur-emidio/
- capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/ (documentário)'
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
