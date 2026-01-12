-- ============================================================
-- GENEALOGY PERSON: Viola (Central Penitentiary)
-- Generated: 2026-01-11
-- ============================================================
-- MINIMAL DOCUMENTATION: Known only from Madame Satã's memoirs,
-- described as "the king of capoeira in the port area of Rio"
-- during his time at the Central Penitentiary.
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
  NULL, -- Full name unknown
  'Viola',
  'Central Penitentiary', -- Context to distinguish from potential others
  NULL, -- No known title
  NULL, -- No portrait available
  ARRAY['https://capoeirahistory.com/the-imprisonment-of-capoeiras-on-ilha-grande/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era
  'Carioca capoeira of the early 20th century. Described by Madame Satã as "the king of capoeira in the port area of Rio," suggesting he was the dominant or most respected capoeirista in Rio de Janeiro''s zona portuária (the neighborhoods of Saúde, Gamboa, and around Praça Mauá).',
  'Capoeira carioca do início do século XX. Descrito por Madame Satã como "o rei da capoeira na zona portuária do Rio," sugerindo que era o capoeirista dominante ou mais respeitado na zona portuária do Rio de Janeiro (os bairros da Saúde, Gamboa e entorno da Praça Mauá).',
  -- Life dates
  1890, -- Estimated: to be "king" of port capoeira, likely peak years 1910s-1930s
  'decade'::genealogy.date_precision,
  NULL, -- No birth place information; likely Rio de Janeiro
  NULL, -- No death year information
  NULL,
  NULL, -- No death place information
  -- bio_en
  E'Viola is known only through a single mention in Madame Satã''s memoirs, where he is described as "the king of capoeira in the port area of Rio." This reference comes from Madame Satã''s time at the Central Penitentiary in Rio de Janeiro, suggesting Viola was either a fellow inmate or a figure Madame Satã encountered there through reputation or earlier contact.

The title "king of capoeira" (rei da capoeira) in Rio''s port district (zona portuária) indicates Viola held a position of supreme respect among capoeiristas in one of the most historically significant areas for Afro-Brazilian culture in Rio de Janeiro. The port neighborhoods—Saúde, Gamboa, Santo Cristo, and the area around Praça Mauá—constituted "Pequena África" (Little Africa), where African culture, including capoeira, samba, and Candomblé, flourished despite persecution. This was the same region where Prata Preta led the barricades during the 1904 Vaccine Revolt, using capoeira skills to resist police.

Being recognized as "king" in this territory would have required extraordinary fighting ability and social standing among the malandros and capoeiristas who populated the waterfront, the docks, and the surrounding streets. Viola likely worked as a stevedore (estivador) or dock worker, as most capoeiristas in the port area did—these were the men who loaded and unloaded ships and developed their fighting skills in the harsh environment of the docks.

Nothing else is known about Viola—not his full name, specific years of activity, the nature of any crimes that led to his imprisonment, or his fate. His designation as "king" suggests he was a figure of considerable renown in early 20th century Rio, yet he remains almost entirely undocumented, a reminder of how much of capoeira''s history has been lost.',
  -- bio_pt
  E'Viola é conhecido apenas através de uma única menção nas memórias de Madame Satã, onde é descrito como "o rei da capoeira na zona portuária do Rio." Esta referência vem do tempo de Madame Satã na Penitenciária Central do Rio de Janeiro, sugerindo que Viola era um companheiro de prisão ou uma figura que Madame Satã conheceu através de reputação ou contato anterior.

O título de "rei da capoeira" na zona portuária do Rio indica que Viola ocupava uma posição de supremo respeito entre os capoeiristas em uma das áreas historicamente mais significativas para a cultura afro-brasileira no Rio de Janeiro. Os bairros portuários—Saúde, Gamboa, Santo Cristo e a área ao redor da Praça Mauá—constituíam a "Pequena África", onde a cultura africana, incluindo capoeira, samba e Candomblé, floresceu apesar da perseguição. Esta era a mesma região onde Prata Preta liderou as barricadas durante a Revolta da Vacina de 1904, usando habilidades de capoeira para resistir à polícia.

Ser reconhecido como "rei" neste território teria exigido habilidade extraordinária de luta e posição social entre os malandros e capoeiristas que povoavam a orla, as docas e as ruas circundantes. Viola provavelmente trabalhava como estivador ou trabalhador portuário, como a maioria dos capoeiristas na zona portuária—estes eram os homens que carregavam e descarregavam navios e desenvolviam suas habilidades de luta no ambiente severo das docas.

Nada mais se sabe sobre Viola—nem seu nome completo, anos específicos de atividade, a natureza de quaisquer crimes que levaram à sua prisão, ou seu destino. Sua designação como "rei" sugere que era uma figura de considerável renome no Rio de Janeiro do início do século XX, mas permanece quase inteiramente sem documentação, um lembrete de quanto da história da capoeira foi perdida.',
  -- achievements_en
  'Recognized as "the king of capoeira in the port area of Rio" - the dominant or most respected capoeirista in Rio de Janeiro''s zona portuária (Little Africa).',
  -- achievements_pt
  'Reconhecido como "o rei da capoeira na zona portuária do Rio" - o capoeirista dominante ou mais respeitado na zona portuária do Rio de Janeiro (Pequena África).',
  -- Researcher notes (English)
  E'MINIMAL DOCUMENTATION: Viola is mentioned only once in Madame Satã''s memoirs (published 1972 by Sylvan Paezzo), referenced as "the king of capoeira in the port area of Rio" during Madame Satã''s time at the Central Penitentiary.

DISTINCTION FROM DOIS RIOS PRISONERS: Unlike Edgar, Americano, and Sete Coroas who are mentioned as fellow prisoners at the Dois Rios Correctional Colony on Ilha Grande, Viola is specifically associated with the Central Penitentiary in Rio de Janeiro proper. This may indicate Viola was encountered at a different point in Madame Satã''s extensive prison history.

BIRTH YEAR ESTIMATION (1890, decade precision): To be recognized as "king" of port area capoeira, Viola was likely at his peak during the 1910s-1930s. Assuming peak years at age 25-45, a birth around 1890 is reasonable. Madame Satã was at the Central Penitentiary in 1947 (documented); if Viola was also there at that time as an older figure, ~1890 birth fits.

PORT AREA CONTEXT: Rio''s zona portuária (Saúde, Gamboa, Santo Cristo, Praça Mauá area) was known as "Pequena África" - the center of Afro-Brazilian culture including capoeira. Being "king" there meant being the most feared/respected fighter among dock workers, stevedores, and the malandro population.

APELIDO ORIGIN: "Viola" is also the name of the high-pitched berimbau in capoeira ensembles, suggesting possible connection to musical skill. Alternatively, it may reference the Portuguese viola (guitar) common in Brazilian culture.

APELIDO_CONTEXT: Using "Central Penitentiary" to distinguish from potential other figures and from the berimbau instrument.

CONTEMPORARIES: Viola was a contemporary of Prata Preta (who led the 1904 Vaccine Revolt in the same port area), Madame Satã (1900-1976), and Sete Coroas (died 1923).

SOURCES:
- Capoeira History: "The imprisonment of capoeiras on Ilha Grande" (primary source for the quote)
- Paezzo, Sylvan. "Memórias de Madame Satã". Rio de Janeiro: Lidador, 1972.
- Green, James N. and Polito, Ronald. "Madame Satã and the jails of Ilha Grande" (for Central Penitentiary timeline)',
  -- Researcher notes (Portuguese)
  E'DOCUMENTAÇÃO MÍNIMA: Viola é mencionado apenas uma vez nas memórias de Madame Satã (publicadas em 1972 por Sylvan Paezzo), referenciado como "o rei da capoeira na zona portuária do Rio" durante o tempo de Madame Satã na Penitenciária Central.

DISTINÇÃO DOS PRISIONEIROS DE DOIS RIOS: Diferentemente de Edgar, Americano e Sete Coroas que são mencionados como companheiros de prisão na Colônia Correcional de Dois Rios na Ilha Grande, Viola está especificamente associado à Penitenciária Central no Rio de Janeiro propriamente dito. Isso pode indicar que Viola foi encontrado em um momento diferente da extensa história prisional de Madame Satã.

ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Para ser reconhecido como "rei" da capoeira da zona portuária, Viola provavelmente estava em seu auge durante os anos 1910-1930. Assumindo anos de pico entre 25-45 anos, um nascimento por volta de 1890 é razoável. Madame Satã estava na Penitenciária Central em 1947 (documentado); se Viola também estava lá nessa época como figura mais velha, ~1890 de nascimento se encaixa.

CONTEXTO DA ZONA PORTUÁRIA: A zona portuária do Rio (Saúde, Gamboa, Santo Cristo, área da Praça Mauá) era conhecida como "Pequena África" - o centro da cultura afro-brasileira incluindo capoeira. Ser "rei" lá significava ser o lutador mais temido/respeitado entre estivadores, trabalhadores portuários e a população malandra.

ORIGEM DO APELIDO: "Viola" também é o nome do berimbau mais agudo nos conjuntos de capoeira, sugerindo possível conexão com habilidade musical. Alternativamente, pode referenciar a viola portuguesa comum na cultura brasileira.

APELIDO_CONTEXT: Usando "Penitenciária Central" para distinguir de outras potenciais figuras e do instrumento berimbau.

CONTEMPORÂNEOS: Viola era contemporâneo de Prata Preta (que liderou a Revolta da Vacina de 1904 na mesma zona portuária), Madame Satã (1900-1976) e Sete Coroas (morreu em 1923).

FONTES:
- Capoeira History: "The imprisonment of capoeiras on Ilha Grande" (fonte primária da citação)
- Paezzo, Sylvan. "Memórias de Madame Satã". Rio de Janeiro: Lidador, 1972.
- Green, James N. and Polito, Ronald. "Madame Satã and the jails of Ilha Grande" (para cronologia da Penitenciária Central)'
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
