-- ============================================================
-- GENEALOGY PERSON: Caiçara
-- Generated: 2025-12-15
-- ============================================================
-- Mestre Caiçara was one of the most legendary and controversial figures
-- in Capoeira Angola history. Known for his hard fighting style, powerful
-- voice, and iconic bengala (walking cane) inherited from his teacher.
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
  'Antônio Conceição Moraes',
  'Caiçara',
  'mestre'::genealogy.title,
  NULL, -- No freely licensed portrait available
  ARRAY['https://capoeirawiki.org/wiki/Mestre_Cai%C3%A7ara', 'https://www.capoeirahub.net/mestres/686db8791a348b787f2a06c1-mestre-caicara']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Caiçara was known for a "hard and efficient style" that contrasted sharply with Mestre Pastinha''s softer approach. His technique was described as "formidable and effective". Beyond pure capoeira, he trained in jiu-jitsu, boxing, freestyle wrestling, and Greco-Roman wrestling—skills he used in his many street confrontations. His trademark was the bengala (walking cane) inherited from Mestre Aberrê, which he used both for elegance and as a deadly weapon. He accumulated 27 scars from bullets, razors, knives, daggers, and machetes throughout his life.',
  E'Caiçara era conhecido por um "estilo duro e eficiente" que contrastava fortemente com a abordagem mais suave de Mestre Pastinha. Sua técnica era descrita como "formidável e eficaz". Além da capoeira pura, ele treinava jiu-jitsu, boxe, luta livre e luta greco-romana—habilidades que usava em seus muitos confrontos de rua. Sua marca registrada era a bengala herdada de Mestre Aberrê, que usava tanto para elegância quanto como arma mortal. Acumulou 27 cicatrizes de balas, navalhas, facas, punhais e facões ao longo de sua vida.',
  -- Life dates
  1924,
  'exact'::genealogy.date_precision,
  'Cachoeira de São Félix, Bahia, Brazil',
  1997,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Antônio Conceição Moraes was born on May 8, 1924, in Cachoeira de São Félix, a city in the Recôncavo Baiano region that he described as "a place of many mysteries and much magic". His mother, Dona Adélia Maria da Conceição, was a Yalorixá (Candomblé priestess) who prepared him from childhood for religious responsibilities. Before capoeira, he worked as a magarefe (butcher)—a common trade for young men in the region.

In 1938, at age 14, Caiçara began learning capoeira from Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos), who taught him "os segredos e mistérios da capoeiragem"—the secrets and mysteries of the practice of capoeira. Before Aberrê''s death, the mestre passed to Caiçara the bengala (walking cane) that would become his trademark for the next fifty years. Like his teacher, Caiçara carried it both for elegance and as a weapon.

Later, Caiçara refined his berimbau playing and singing skills under Mestre Waldemar at the legendary Barracão in Liberdade. This dual training gave him both the fighting foundation from Aberrê and the musical mastery that would make him famous as "a great singer" with a voice described as "contagious and hypnotic".

Beyond capoeira, Caiçara trained in jiu-jitsu, boxing, freestyle wrestling, and Greco-Roman wrestling. He was arrested repeatedly for fighting and capoeira violations, yet police officers are said to have respected and hesitated to detain him. During the 1960s, he and Mestre Traíra worked as political enforcers for Salvador''s Mayor Antônio Carlos Magalhães.

Caiçara claimed adolescent involvement with the cangaceiros—the famous rural bandits of northeastern Brazil—possessing photographic evidence allegedly held by his family. He displayed his 27 scars from weapons with pride, declaring: "I am a sorcerer!"

In 1954, he appeared in "Vadiação", the short documentary film directed by Alexandre Robatto Filho, alongside Mestre Bimba, Waldemar, Traíra, and Curió. In 1969, he recorded the LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara", featuring vocalist Grácia Maria. The album was re-released in 1973 and 1993. He appeared in "The Spirit of Samba: Black Music of Brazil" (1982), was interviewed on Rádio Roquette Pinto''s "Roda de Capoeira" (1975), and participated in the Programa Nacional de Capoeira (1989).

The famous confrontation with Mestre Bimba occurred in the 1960s at a graduation event in Amaralina. Caiçara provoked Bimba''s disciples, declaring himself "the master". When they finally played, Bimba applied a devastating "bênção" (blessing kick), breaking Caiçara''s nose and lips. Bimba''s response was iconic: "Isso é que é jogo de perna, meu filho"—"That''s footwork, my son".

In November 1972, as Bimba prepared to leave Salvador for Goiânia (never to return), Caiçara apologized. According to witnesses, he said: "I am Bahia''s third master after you and Mestre Pastinha. Forgive my arrogance; don''t leave. Bahia needs you". This reconciliation came too late—Bimba left and died two years later in poverty.

Caiçara became the most respected figure in Pelourinho, Salvador''s historic center, commanding respect from criminals, police, and nightlife figures alike. He founded two Candomblé temples, continuing his mother''s religious lineage, though he later distanced himself from organized religion, criticizing institutional corruption.

He founded the Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara, represented by green and red colors. His students included Zé de Freitas, Fernandinho, Sabú, and according to some sources, Sandrinha—though her primary teacher was Mestre Roque. He influenced the "Angola da Penha" movement in Rio de Janeiro.

Known for sharp wit, Caiçara''s famous phrases included: "Roupa de homem não dá em menino!" (Adult''s clothing doesn''t fit a boy!)—criticizing young capoeiristas who claimed master status. Another was: "Está aprendendo a soletrar e já acha que sabe ler" (He''s learning to spell and already thinks he can read).

Mestre Caiçara died on August 26, 1997, in Salvador, Bahia, after 59 years of capoeira practice. He remains one of the most controversial and legendary figures in capoeira history—a mandingueiro who bridged the street culture of old Bahia with the preservation of Capoeira Angola.',
  -- bio_pt
  E'Antônio Conceição Moraes nasceu em 8 de maio de 1924, em Cachoeira de São Félix, uma cidade no Recôncavo Baiano que ele descrevia como "um lugar de muitos mistérios e muita magia". Sua mãe, Dona Adélia Maria da Conceição, era Yalorixá (sacerdotisa do Candomblé) que o preparou desde a infância para responsabilidades religiosas. Antes da capoeira, trabalhou como magarefe (açougueiro)—um ofício comum para jovens da região.

Em 1938, aos 14 anos, Caiçara começou a aprender capoeira com Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos), que lhe ensinou "os segredos e mistérios da capoeiragem". Antes da morte de Aberrê, o mestre passou a Caiçara a bengala que se tornaria sua marca registrada pelos próximos cinquenta anos. Como seu professor, Caiçara a carregava tanto para elegância quanto como arma.

Mais tarde, Caiçara aperfeiçoou seu toque de berimbau e canto sob Mestre Waldemar no lendário Barracão na Liberdade. Este duplo treinamento lhe deu tanto a base de luta de Aberrê quanto o domínio musical que o tornaria famoso como "um grande cantador" com voz descrita como "contagiante e hipnótica".

Além da capoeira, Caiçara treinou jiu-jitsu, boxe, luta livre e luta greco-romana. Foi preso repetidamente por brigas e violações de capoeira, mas dizem que os policiais o respeitavam e hesitavam em detê-lo. Durante a década de 1960, ele e Mestre Traíra trabalharam como capangas políticos para o prefeito de Salvador, Antônio Carlos Magalhães.

Caiçara alegava envolvimento adolescente com os cangaceiros—os famosos bandidos rurais do Nordeste brasileiro—possuindo evidências fotográficas supostamente mantidas por sua família. Exibia suas 27 cicatrizes de armas com orgulho, declarando: "Eu sou feiticeiro!"

Em 1954, apareceu em "Vadiação", o curta-metragem documental dirigido por Alexandre Robatto Filho, ao lado de Mestre Bimba, Waldemar, Traíra e Curió. Em 1969, gravou o LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara", com a vocalista Grácia Maria. O álbum foi relançado em 1973 e 1993. Apareceu em "The Spirit of Samba: Black Music of Brazil" (1982), foi entrevistado no "Roda de Capoeira" da Rádio Roquette Pinto (1975), e participou do Programa Nacional de Capoeira (1989).

O famoso confronto com Mestre Bimba ocorreu na década de 1960 em um evento de formatura em Amaralina. Caiçara provocou os discípulos de Bimba, declarando-se "o mestre". Quando finalmente jogaram, Bimba aplicou uma devastadora "bênção", quebrando o nariz e os lábios de Caiçara. A resposta de Bimba foi icônica: "Isso é que é jogo de perna, meu filho".

Em novembro de 1972, enquanto Bimba se preparava para deixar Salvador rumo a Goiânia (para nunca mais voltar), Caiçara se desculpou. Segundo testemunhas, ele disse: "Sou o terceiro mestre da Bahia depois de você e Mestre Pastinha. Perdoe minha arrogância; não vá embora. A Bahia precisa de você". Esta reconciliação veio tarde demais—Bimba partiu e morreu dois anos depois na pobreza.

Caiçara se tornou a figura mais respeitada do Pelourinho, centro histórico de Salvador, comandando respeito de criminosos, policiais e figuras da vida noturna. Fundou dois terreiros de Candomblé, continuando a linhagem religiosa de sua mãe, embora mais tarde tenha se distanciado da religião organizada, criticando a corrupção institucional.

Fundou a Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara, representada pelas cores verde e vermelha. Seus alunos incluíam Zé de Freitas, Fernandinho, Sabú e, segundo algumas fontes, Sandrinha—embora seu professor principal tenha sido Mestre Roque. Ele influenciou o movimento "Angola da Penha" no Rio de Janeiro.

Conhecido pelo humor afiado, as frases famosas de Caiçara incluíam: "Roupa de homem não dá em menino!"—criticando jovens capoeiristas que reivindicavam o título de mestre. Outra era: "Está aprendendo a soletrar e já acha que sabe ler".

Mestre Caiçara morreu em 26 de agosto de 1997, em Salvador, Bahia, após 59 anos de prática de capoeira. Ele permanece como uma das figuras mais controversas e lendárias da história da capoeira—um mandingueiro que fez a ponte entre a cultura de rua da velha Bahia e a preservação da Capoeira Angola.',
  -- achievements_en
  E'1938: Began training under Mestre Aberrê de Santo Amaro; received Aberrê''s bengala (walking cane) that became his trademark
1954: Appeared in the documentary short film "Vadiação" directed by Alexandre Robatto Filho
1969: Released LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" with vocalist Grácia Maria (re-released 1973, 1993)
1975: Featured on Rádio Roquette Pinto''s "Roda de Capoeira" program
1982: Appeared in documentary "The Spirit of Samba: Black Music of Brazil" by Jeremy Marre
1987: Participated in major capoeira events in Rio de Janeiro and Ouro Preto
1989: Featured in Programa Nacional de Capoeira
Founded Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara (green and red colors)
Founded two Candomblé temples in Salvador
Trained notable students including Zé de Freitas, Fernandinho, and Sabú
59 years of continuous capoeira practice (1938-1997)',
  -- achievements_pt
  E'1938: Começou a treinar com Mestre Aberrê de Santo Amaro; recebeu a bengala de Aberrê que se tornou sua marca registrada
1954: Apareceu no curta-metragem documental "Vadiação" dirigido por Alexandre Robatto Filho
1969: Lançou LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" com a vocalista Grácia Maria (relançado em 1973, 1993)
1975: Destaque no programa "Roda de Capoeira" da Rádio Roquette Pinto
1982: Apareceu no documentário "The Spirit of Samba: Black Music of Brazil" de Jeremy Marre
1987: Participou de grandes eventos de capoeira no Rio de Janeiro e Ouro Preto
1989: Destaque no Programa Nacional de Capoeira
Fundou a Academia de Angola São Jorge dos Irmãos Unidos do Mestre Caiçara (cores verde e vermelha)
Fundou dois terreiros de Candomblé em Salvador
Treinou alunos notáveis incluindo Zé de Freitas, Fernandinho e Sabú
59 anos de prática contínua de capoeira (1938-1997)',
  -- Researcher notes (English)
  E'LIFE DATES:
Birth: May 8, 1924 - confirmed by multiple sources (velhosmestres.com, capoeirawiki.org, capoeirahub.net)
Death: August 26, 1997 - confirmed by multiple sources
Birth place: Cachoeira de São Félix (also written as "Cachoeira de São Felix") in the Recôncavo Baiano

MOTHER: Dona Adélia Maria da Conceição - Yalorixá (Candomblé priestess)

TEACHERS:
1. Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos) - primary teacher from 1938
   NOTE: Some sources identify Caiçara''s Aberrê as distinct from Pastinha''s Aberrê (Antônio Raimundo Argolo)
2. Mestre Waldemar - refined berimbau and singing skills (1950s)

STUDENTS (per CapoeiraHub and other sources):
- Mestre Limão (São Paulo)
- Mestre Wilson Sereno (Rio de Janeiro)
- Mestre Laercio (Berlin, Germany)
- Mestre Sabu/Sabú (Goiás)
- Mestre Fernandinho (Bahia)
- Mestre José de Freitas / Zé de Freitas (Alagoinhas, Bahia)
- Mestre Robertino da Hora (Salvador, Bahia)
- Mestre Valdomiro (Brazil)

NOTE ON SANDRINHA: CapoeiraWiki lists "Sandrinha" as Caiçara''s student, but other sources (ResearchGate) identify her primary teacher as Mestre Roque. She trained at Grupo Bantus de Capoeira. The connection to Caiçara may be indirect or secondary.

FILM/RECORDINGS:
- 1954: "Vadiação" (short film by Alexandre Robatto Filho) with Bimba, Waldemar, Traíra, Curió
- 1964: Photographed by Helinä Rautavaara
- 1969: LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" with Grácia Maria
- 1975: Radio interview on "Roda de Capoeira" (Rádio Roquette Pinto)
- 1982: Documentary "The Spirit of Samba: Black Music of Brazil" (Jeremy Marre)
- 1989: Programa Nacional de Capoeira

BIMBA CONFRONTATION: The fight occurred in the 1960s at a graduation in Amaralina. Caiçara was defeated with a "bênção" (blessing kick) that broke his nose and lips. They reconciled in November 1972 before Bimba left for Goiânia.

CANDOMBLÉ: Founded two temples, continuing his mother''s lineage. Later distanced himself, criticizing "corruption" in organized religion.

CLAIM OF CANGAÇO INVOLVEMENT: Caiçara claimed adolescent association with Lampião''s cangaceiros, allegedly possessing photographic evidence. Authenticity debated.

WORK: Worked as magarefe (butcher) in youth. In the 1960s, worked as political enforcer for Mayor ACM with Mestre Traíra.

27 SCARS: Displayed scars from bullets, razors, knives, daggers, and machetes with pride.',
  -- Researcher notes (Portuguese)
  E'DATAS DE VIDA:
Nascimento: 8 de maio de 1924 - confirmado por múltiplas fontes (velhosmestres.com, capoeirawiki.org, capoeirahub.net)
Morte: 26 de agosto de 1997 - confirmado por múltiplas fontes
Local de nascimento: Cachoeira de São Félix (também escrito como "Cachoeira de São Felix") no Recôncavo Baiano

MÃE: Dona Adélia Maria da Conceição - Yalorixá (sacerdotisa do Candomblé)

MESTRES:
1. Mestre Aberrê de Santo Amaro (Antônio Rufino dos Santos) - professor principal desde 1938
   NOTA: Algumas fontes identificam o Aberrê de Caiçara como distinto do Aberrê de Pastinha (Antônio Raimundo Argolo)
2. Mestre Waldemar - aperfeiçoou habilidades de berimbau e canto (anos 1950)

ALUNOS (per CapoeiraHub e outras fontes):
- Mestre Limão (São Paulo)
- Mestre Wilson Sereno (Rio de Janeiro)
- Mestre Laercio (Berlim, Alemanha)
- Mestre Sabu/Sabú (Goiás)
- Mestre Fernandinho (Bahia)
- Mestre José de Freitas / Zé de Freitas (Alagoinhas, Bahia)
- Mestre Robertino da Hora (Salvador, Bahia)
- Mestre Valdomiro (Brasil)

NOTA SOBRE SANDRINHA: CapoeiraWiki lista "Sandrinha" como aluna de Caiçara, mas outras fontes (ResearchGate) identificam seu professor principal como Mestre Roque. Ela treinou no Grupo Bantus de Capoeira. A conexão com Caiçara pode ser indireta ou secundária.

FILME/GRAVAÇÕES:
- 1954: "Vadiação" (curta de Alexandre Robatto Filho) com Bimba, Waldemar, Traíra, Curió
- 1964: Fotografado por Helinä Rautavaara
- 1969: LP "Academia de Capoeira Angola São Jorge dos Irmãos Unidos de Caiçara" com Grácia Maria
- 1975: Entrevista de rádio no "Roda de Capoeira" (Rádio Roquette Pinto)
- 1982: Documentário "The Spirit of Samba: Black Music of Brazil" (Jeremy Marre)
- 1989: Programa Nacional de Capoeira

CONFRONTO COM BIMBA: A luta ocorreu na década de 1960 em uma formatura em Amaralina. Caiçara foi derrotado com uma "bênção" que quebrou seu nariz e lábios. Eles se reconciliaram em novembro de 1972 antes de Bimba partir para Goiânia.

CANDOMBLÉ: Fundou dois terreiros, continuando a linhagem de sua mãe. Mais tarde se distanciou, criticando "corrupção" na religião organizada.

ALEGAÇÃO DE ENVOLVIMENTO COM CANGAÇO: Caiçara alegava associação adolescente com os cangaceiros de Lampião, supostamente possuindo evidências fotográficas. Autenticidade debatida.

TRABALHO: Trabalhou como magarefe (açougueiro) na juventude. Nos anos 1960, trabalhou como capanga político para o prefeito ACM com Mestre Traíra.

27 CICATRIZES: Exibia cicatrizes de balas, navalhas, facas, punhais e facões com orgulho.'
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
