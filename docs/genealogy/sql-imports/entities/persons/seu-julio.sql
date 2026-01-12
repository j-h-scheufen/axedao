-- ============================================================
-- GENEALOGY PERSON: Seu Júlio
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR (1930, year precision):
-- Multiple sources confirm: "82 years old in 2012" → born 1930
-- Some sources cite 1931 (French article, one FlickR entry) but
-- the capoeirahistory.com interview (2012, age 82) is primary source.
-- Using 1930 with 'year' precision.
--
-- DEATH YEAR (2018, year precision):
-- Multiple sources confirm he died in 2018, remained on island
-- after completing his sentence in 2014.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Julio de Almeida',
  'Seu Júlio',
  NULL, -- No formal capoeira title
  NULL, -- Portrait available on Flickr but unstable URL
  ARRAY[
    'https://capoeirahistory.com/the-imprisonment-of-capoeiras-on-ilha-grande/'
  ]::text[],
  NULL, -- Style: practiced tiririca/Carioca capoeira but no formal style designation
  E'Practiced capoeira and tiririca (the name used at Dois Rios prison for fighting techniques). Trained with "nortistas" (Bahians) at Lagoa Rodrigo de Freitas before imprisonment.',
  E'Praticava capoeira e tiririca (nome usado na prisão de Dois Rios para técnicas de luta). Treinou com "nortistas" (baianos) na Lagoa Rodrigo de Freitas antes da prisão.',
  1930,
  'year'::genealogy.date_precision,
  'Petrópolis, Rio de Janeiro, Brazil',
  2018,
  'year'::genealogy.date_precision,
  'Vila Dois Rios, Ilha Grande, Rio de Janeiro, Brazil',
  E'Julio de Almeida, known as Seu Júlio, was a capoeirista who became the last prisoner of the infamous Cândido Mendes penal colony on Ilha Grande. Born in Petrópolis in the mountains above Rio de Janeiro, he drifted to the "Cidade Maravilhosa" as a teenager, surviving through small jobs before turning to crime on the beaches of Copacabana and Flamengo.

Before his imprisonment, Júlio lived in the Catacumba favela, perched on the hills overlooking Lagoa Rodrigo de Freitas. There he practiced capoeira, running, and boxing with "nortistas"—migrants from Bahia who had brought their fighting traditions south. Among his training partners was "a friend known as Boa Viagem," who would also end up at Dois Rios.

"I stole, I killed, all to survive," Júlio later admitted. In 1958, at age 27, he was sentenced and briefly imprisoned in Rio before escaping. After recapture, he received a harsher sentence of 28 years for theft, murder, and attempted escape. He was sent to the Colônia Correcional de Dois Rios—nicknamed the "Caldeirão do Diabo" (Devil''s Cauldron)—where alcoholics, beggars, homeless, and capoeiristas from across Brazil were imprisoned.

In 1963, Júlio returned to Dois Rios with a sentence exceeding 60 years. Despite his criminal past, he earned trust through good behavior and began working in the prison kitchens, eventually cooking for over 1,000 inmates. The kitchen was a coveted and dangerous position—as he later testified, it functioned as "the entry point for drugs and guns."

During his decades at Dois Rios, Júlio encountered legendary figures of Rio''s underworld. He met Madame Satã when both traveled to Rio de Janeiro to testify in court proceedings. He described Satã as "effeminate" with "a similar body to mine, a little bit taller, a bit lighter skinned... a tranquil girl, calm, she wasn''t aggressive... very skilled in her work... she washed clothes, all the business with the director''s clothes... she bred pigs."

At the colony, the fighting art was called "tiririca" rather than capoeira. As Júlio explained in a 2012 interview at age 82: "capoeira and tiririca mean one thing only, it depends a lot on the teacher and the lightness, the instruction—that was different from capoeira." His account revealed that older prisoners with fighting knowledge transmitted techniques to younger inmates while deliberately avoiding the stigmatized term "capoeira."

When the Cândido Mendes Penal Institute was demolished by explosives in 1994, Júlio was released. A former resident described the detonations as "an atomic bomb exploded in my heart." With nowhere to go, Júlio chose to stay in Vila Dois Rios, the only home he had known for decades. He lived there with his family, making periodic trips to check in with a judge, eventually gaining definitive freedom in 2014.

In his final years, Júlio worked as a guardian of the prison ruins, sitting on the terrace of Teresa da Silva''s café with the crumbling walls of Cândido Mendes visible behind him. More than a century after the prison''s inauguration, "the old man no longer seemed to pay attention" to its terrible reputation. He died in 2018, sixty years after first arriving on the island he had once tried to escape.

Seu Júlio''s 2012 interview, documented by the Contemporary Capoeira project, remains an invaluable primary source for understanding the transmission of capoeira/tiririca in Rio''s prison system and the informal training that occurred in the favelas surrounding Lagoa Rodrigo de Freitas during the mid-twentieth century.',
  E'Julio de Almeida, conhecido como Seu Júlio, foi um capoeirista que se tornou o último prisioneiro da infame colônia penal Cândido Mendes na Ilha Grande. Nascido em Petrópolis nas montanhas acima do Rio de Janeiro, ele foi para a "Cidade Maravilhosa" quando adolescente, sobrevivendo com pequenos trabalhos antes de entrar para o crime nas praias de Copacabana e Flamengo.

Antes de sua prisão, Júlio morava na favela da Catacumba, empoleirada nos morros com vista para a Lagoa Rodrigo de Freitas. Lá ele praticava capoeira, corrida e boxe com "nortistas"—migrantes da Bahia que haviam trazido suas tradições de luta para o sul. Entre seus parceiros de treino estava "um amigo conhecido como Boa Viagem," que também acabaria em Dois Rios.

"Eu roubava, eu matava, tudo para sobreviver," Júlio admitiu mais tarde. Em 1958, aos 27 anos, foi condenado e brevemente preso no Rio antes de escapar. Após recaptura, recebeu uma sentença mais severa de 28 anos por roubo, homicídio e tentativa de fuga. Foi enviado para a Colônia Correcional de Dois Rios—apelidada de "Caldeirão do Diabo"—onde alcoólatras, mendigos, sem-teto e capoeiristas de todo o Brasil eram encarcerados.

Em 1963, Júlio retornou a Dois Rios com uma sentença superior a 60 anos. Apesar de seu passado criminoso, ganhou confiança por bom comportamento e começou a trabalhar nas cozinhas da prisão, eventualmente cozinhando para mais de 1.000 detentos. A cozinha era uma posição cobiçada e perigosa—como ele testemunhou mais tarde, funcionava como "o ponto de entrada para drogas e armas."

Durante suas décadas em Dois Rios, Júlio encontrou figuras lendárias do submundo carioca. Ele conheceu Madame Satã quando ambos viajaram ao Rio de Janeiro para testemunhar em processos judiciais. Ele descreveu Satã como "afeminada" com "um corpo parecido com o meu, um pouco mais alta, um pouco mais clara de pele... uma moça tranquila, calma, não era agressiva... muito habilidosa no trabalho... lavava roupas, tudo dos negócios das roupas do diretor... criava porcos."

Na colônia, a arte da luta era chamada de "tiririca" em vez de capoeira. Como Júlio explicou em uma entrevista de 2012 aos 82 anos: "capoeira e tiririca significam uma coisa só, depende muito do professor e da leveza, da instrução—isso era diferente da capoeira." Seu relato revelou que prisioneiros mais velhos com conhecimento de luta transmitiam técnicas aos mais jovens, evitando deliberadamente o termo estigmatizado "capoeira."

Quando o Instituto Penal Cândido Mendes foi demolido com explosivos em 1994, Júlio foi libertado. Um ex-morador descreveu as detonações como "uma bomba atômica explodiu no meu coração." Sem ter para onde ir, Júlio escolheu ficar em Vila Dois Rios, o único lar que conhecera por décadas. Viveu lá com sua família, fazendo viagens periódicas para se apresentar ao juiz, finalmente ganhando liberdade definitiva em 2014.

Em seus últimos anos, Júlio trabalhou como guardião das ruínas da prisão, sentado no terraço do café de Teresa da Silva com as paredes desmoronando de Cândido Mendes visíveis atrás dele. Mais de um século após a inauguração da prisão, "o velho já não parecia prestar atenção" à sua terrível reputação. Ele morreu em 2018, sessenta anos após chegar pela primeira vez na ilha da qual uma vez tentou escapar.

A entrevista de Seu Júlio em 2012, documentada pelo projeto Capoeira Contemporânea, permanece uma fonte primária inestimável para entender a transmissão da capoeira/tiririca no sistema prisional do Rio e o treinamento informal que ocorria nas favelas ao redor da Lagoa Rodrigo de Freitas em meados do século XX.',
  NULL, -- No formal achievements
  NULL,
  E'BIRTH YEAR (1930, year):
Primary source: 2012 capoeirahistory.com interview states "82 years old" → born 1930
Alternative: French Ulyces article and one other source cite 1931 (born in Petrópolis)
Using 1930 based on the primary capoeira source interview.

DEATH YEAR (2018, year):
Multiple sources confirm: died in 2018 at Vila Dois Rios
Remained on island even after completing sentence in 2014

BIRTH PLACE:
Petrópolis, Rio de Janeiro state (French source)

TRAINING LOCATION:
- Catacumba favela (residence before imprisonment)
- Lagoa Rodrigo de Freitas (training site with nortistas)

TRAINING PARTNERS:
- Boa Viagem (Catacumba) - trained together before imprisonment; both served at Dois Rios
- "Nortistas" (Bahians) - trained at Rodrigo de Freitas lagoon

IMPRISONMENT TIMELINE:
- 1958: First arrival at Dois Rios (age 27), escaped from Rio prison
- 1963: Returned with 60+ year sentence
- 1994: Prison demolished, remained in Vila Dois Rios
- 2014: Gained definitive freedom
- 2018: Died

PRISON CONTACTS:
- Madame Satã - met when both traveled to Rio to testify in court
- Knowledge of Edgar, Americano, Sete Coroas (mentioned in Satã memoirs)

TIRIRICA vs CAPOEIRA:
Júlio''s quote: "capoeira and tiririca mean one thing only, it depends a lot on the teacher and the lightness, the instruction—that was different from capoeira"
Context: At Dois Rios, the fighting art was deliberately called "tiririca" to avoid stigma

MEDIA APPEARANCES:
- 2012: Interview for Contemporary Capoeira project (capoeirahistory.com)
- 2012-2015: Interviewed about Madame Satã for academic article (SciELO)
- 2009: Photographed by crisdesign (Flickr)

RESEARCH NOTE:
Seu Júlio is the PRIMARY SOURCE for information about:
- Boa Viagem (Catacumba)
- Capoeira/tiririca practice at Catacumba favela
- Tiririca transmission at Dois Rios prison
- Madame Satã''s behavior and work in prison',
  E'ANO DE NASCIMENTO (1930, ano):
Fonte primária: Entrevista de 2012 em capoeirahistory.com declara "82 anos" → nascido em 1930
Alternativa: Artigo francês Ulyces e outra fonte citam 1931 (nascido em Petrópolis)
Usando 1930 baseado na entrevista da fonte primária de capoeira.

ANO DE FALECIMENTO (2018, ano):
Múltiplas fontes confirmam: morreu em 2018 em Vila Dois Rios
Permaneceu na ilha mesmo após completar sentença em 2014

LOCAL DE NASCIMENTO:
Petrópolis, estado do Rio de Janeiro (fonte francesa)

LOCAL DE TREINAMENTO:
- Favela da Catacumba (residência antes da prisão)
- Lagoa Rodrigo de Freitas (local de treino com nortistas)

PARCEIROS DE TREINAMENTO:
- Boa Viagem (Catacumba) - treinaram juntos antes da prisão; ambos cumpriram pena em Dois Rios
- "Nortistas" (baianos) - treinavam na Lagoa Rodrigo de Freitas

CRONOLOGIA DE PRISÃO:
- 1958: Primeira chegada em Dois Rios (27 anos), escapou de prisão no Rio
- 1963: Retornou com sentença de 60+ anos
- 1994: Prisão demolida, permaneceu em Vila Dois Rios
- 2014: Ganhou liberdade definitiva
- 2018: Faleceu

CONTATOS NA PRISÃO:
- Madame Satã - conheceu quando ambos viajaram ao Rio para testemunhar em tribunal
- Conhecimento de Edgar, Americano, Sete Coroas (mencionados nas memórias de Satã)

TIRIRICA vs CAPOEIRA:
Citação de Júlio: "capoeira e tiririca significam uma coisa só, depende muito do professor e da leveza, da instrução—isso era diferente da capoeira"
Contexto: Em Dois Rios, a arte da luta era deliberadamente chamada de "tiririca" para evitar estigma

APARIÇÕES NA MÍDIA:
- 2012: Entrevista para projeto Capoeira Contemporânea (capoeirahistory.com)
- 2012-2015: Entrevistado sobre Madame Satã para artigo acadêmico (SciELO)
- 2009: Fotografado por crisdesign (Flickr)

NOTA DE PESQUISA:
Seu Júlio é a FONTE PRIMÁRIA para informações sobre:
- Boa Viagem (Catacumba)
- Prática de capoeira/tiririca na favela da Catacumba
- Transmissão de tiririca na prisão de Dois Rios
- Comportamento e trabalho de Madame Satã na prisão'
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
