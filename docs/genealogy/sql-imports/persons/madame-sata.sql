-- ============================================================
-- GENEALOGY PERSON IMPORT: Madame Satã
-- Generated: 2025-12-09
-- Primary Sources:
--   - https://en.wikipedia.org/wiki/Madame_Sat%C3%A3
--   - https://capoeirahistory.com/madame-the-satan-of-lapa-district/
--   - https://capoeirahistory.com/general/madame-satan/
--   - https://museubajuba.org/madame-sata-uma-parte-da-historia-pouco-contada/
--   - https://primeirosnegros.com/madame-sata-uma-travesti-artista-militante/
--   - https://sites.google.com/view/raridadesdacapoeira/madame-sat%C3%A3
--   - https://bafafa.com.br/turismo/historias-do-rio/madame-sata-o-malandro-mais-temido-da-lapa-foi-trocado-na-infancia-por-uma-egua
--   - Memórias de Madame Satã (1972), narrated to Sylvan Paezzo
-- ============================================================
-- DEPENDENCIES: persons/sete-coroas.sql
-- ============================================================
--
-- BIRTH DATE: February 25, 1900 (year precision)
-- Per his memoirs, Madame Satã adopted February 25, 1900 as his official birth
-- date, though civil registry showed 1903. We use his self-declared date.
--
-- DEATH DATE: April 12, 1976 (exact precision)
-- Died of lung cancer; buried in Cemitério do Abraão, Ilha Grande.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
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
  'João Francisco dos Santos',
  'Madame Satã',
  NULL, -- No formal capoeira title; malandro/proto-mestre figure
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Madame_Sat%C3%A3_%281972%29.tiff/lossy-page1-220px-Madame_Sat%C3%A3_%281972%29.tiff.jpg',
  '[{"type": "website", "url": "https://en.wikipedia.org/wiki/Madame_Sat%C3%A3"}, {"type": "website", "url": "https://capoeirawiki.org/wiki/Madame_Sat%C3%A3"}, {"type": "website", "url": "https://capoeirahistory.com/general/madame-satan/"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification; carioca capoeira
  'Carioca capoeira combined with navalha (straight razor) fighting - the characteristic combat style of Rio''s malandros. Trained by Sete Coroas in "the fine art of malandragem": the game, the razor, the smooth talk, the rasteira (leg sweep), and valentia (bravado). His physical prowess and agility were legendary - in combat "his hands turned to feet and his feet, in tumbling turns, attacked with the violence of a piledriver."',
  'Capoeira carioca combinada com luta de navalha - o estilo de combate característico dos malandros do Rio. Treinado por Sete Coroas na "fina arte da malandragem": o jogo, a navalha, o papo, a rasteira e a valentia. Sua força física e agilidade eram lendárias - em combate "suas mãos viravam pés e seus pés, em giros cambaleantes, atacavam com a violência de um bate-estacas."',
  -- Life dates
  1900,
  'year'::genealogy.date_precision,
  'Glória do Goitá, Pernambuco, Brazil',
  1976,
  'exact'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  -- bio_en
  E'João Francisco dos Santos was born into misery. One of seventeen children of Manoel Firmino dos Santos and Firmina Teresa da Conceição—both descendants of enslaved Africans—he entered a world where survival itself was a daily struggle. When his father died in 1907, his mother made a choice born of desperation: she traded her seven-year-old son to a horse trader named Laureano in exchange for a mare.

The boy became an enslaved laborer on Laureano''s farm. Within a year, he escaped, fleeing with a woman named Dona Felicidade who brought him to Rio de Janeiro. By 1913, at thirteen, he was living on the streets of Lapa—the bohemian heart of the capital, where the underworld mingled with artists, prostitutes, and gamblers in a permanent carnival of transgression.

It was in these streets that he met Sete Coroas, the most famous malandro of the First Republic. Sete Coroas was already a legend—a Bahiano who had come to dominate Rio''s underworld, immortalized in sambas, feared by police, and worshipped by the poor. He took the young João under his tutelage, teaching him what Satã would later call "the fine art of malandragem": the game, the navalha (straight razor), the papo (smooth talk), the rasteira (leg sweep), and valentia (courage that verged on madness).

When Sete Coroas died in 1923, he left João as his successor in Lapa and Saúde.

João became a capoeirista of terrifying skill. His battles against police were legendary. He routinely fought barehanded against quartets of policemen armed with wooden clubs. In one famous incident, a drunken João resisted arrest by a 24-man platoon, leaving seven officers badly wounded—two with broken arms, two with split livers. The rest of the squad decided to let him sleep it off rather than shoot him.

"In the blink of an eye," one witness recalled, "his hands turned to feet and his feet, in tumbling turns, attacked with the violence of a piledriver."

But João was more than a fighter. In 1923, he performed as a drag artist in "Loucos em Copacabana" at Teatro Casa de Caboclo, taking the stage name Mulata do Balacochê. He was an openly gay Black man in an era when any one of those identities could get you killed. He refused to hide.

In 1928, his life changed permanently. After his second performance, he was accosted by a vigilante who called him a slur. He fired back. The resulting confrontation led to a 16-year sentence for killing a night watchman named Alberto—later overturned on self-defense grounds after he had already served time.

The name "Madame Satã" came in 1938. Released from prison, he entered a carnival costume contest at Teatro República wearing a fantasia inspired by a bat from his native Pernambuco—all golden sequins and dramatic flair. He won first place. Days later, police arrested him with other homosexuals in a downtown park. When the booking officer demanded his nickname, João refused. But the delegado recognized him as the carnival winner and, associating his bat costume with Cecil B. DeMille''s film "Madam Satan," recorded the name that would follow him forever.

Over his lifetime, João accumulated 27 years and eight months in prison across 29 legal proceedings—ten convictions for charges including homicide, assault, theft, vagrancy, obscenity, and weapons possession. He claimed roughly 100 murders and over 3,000 fights, though these numbers carry the weight of malandro mythology.

He worked as a bouncer, protecting nightclubs and the prostitutes and marginalized people who frequented them. "We are human beings," he declared when asked why he protected those society despised. He raised six adopted daughters in Rio and one more on Ilha Grande.

In 1971, journalists from the underground newspaper O Pasquim "rediscovered" him. The interviews that followed led to his 1972 memoir, "Memórias de Madame Satã," narrated to Sylvan Paezzo. The book revealed a man of complexity—violent and tender, criminal and protective, illiterate yet philosophically profound.

Two years before his death, he performed one last time, playing Satan in "Lampião no Inferno" (1974). He died on April 12, 1976, at age 75, weighing only 46 kilograms. He was buried as an indigent in the cemetery of Vila do Abraão, Ilha Grande, wearing his panama hat, with red roses placed in his coffin.

Madame Satã represents the bridge between the old capoeira carioca of the malandros and the modern art that developed in the 1950s and 1960s. His feats impressed a whole generation of capoeiristas. His life was reimagined in the 2002 film "Madame Satã," directed by Karim Aïnouz with Lázaro Ramos in the title role, which premiered at Cannes.

He remains an icon of resistance—a Black, homosexual, illiterate son of former slaves who refused to bow to the racist, homophobic, and moralist norms of his society.',
  -- bio_pt
  E'João Francisco dos Santos nasceu na miséria. Um dos dezessete filhos de Manoel Firmino dos Santos e Firmina Teresa da Conceição—ambos descendentes de africanos escravizados—ele entrou num mundo onde a sobrevivência era uma luta diária. Quando seu pai morreu em 1907, sua mãe fez uma escolha nascida do desespero: trocou seu filho de sete anos por uma égua com um negociante de cavalos chamado Laureano.

O menino tornou-se trabalhador escravizado na fazenda de Laureano. Em menos de um ano, fugiu, escapando com uma mulher chamada Dona Felicidade que o trouxe ao Rio de Janeiro. Em 1913, com treze anos, vivia nas ruas da Lapa—o coração boêmio da capital, onde o submundo se misturava com artistas, prostitutas e jogadores num carnaval permanente de transgressão.

Foi nessas ruas que conheceu Sete Coroas, o mais famoso malandro da Primeira República. Sete Coroas já era uma lenda—um baiano que dominava o submundo do Rio, imortalizado em sambas, temido pela polícia e adorado pelos pobres. Ele acolheu o jovem João como pupilo, ensinando-lhe o que Satã chamaria mais tarde de "a fina arte da malandragem": o jogo, a navalha, o papo, a rasteira e a valentia.

Quando Sete Coroas morreu em 1923, deixou João como seu sucessor na Lapa e na Saúde.

João tornou-se um capoeirista de habilidade aterrorizante. Suas batalhas contra a polícia eram lendárias. Rotineiramente lutava desarmado contra grupos de policiais armados com cassetetes. Num incidente famoso, João embriagado resistiu à prisão por um pelotão de 24 homens, deixando sete policiais gravemente feridos—dois com braços quebrados, dois com fígados lacerados. O resto do pelotão decidiu deixá-lo dormir em vez de atirar nele.

"Num piscar de olhos," lembrou uma testemunha, "suas mãos viravam pés e seus pés, em giros cambaleantes, atacavam com a violência de um bate-estacas."

Mas João era mais que um lutador. Em 1923, apresentou-se como transformista em "Loucos em Copacabana" no Teatro Casa de Caboclo, adotando o nome artístico Mulata do Balacochê. Era um homem negro assumidamente gay numa época em que qualquer uma dessas identidades podia custar sua vida. Recusou-se a se esconder.

Em 1928, sua vida mudou permanentemente. Após sua segunda apresentação, foi abordado por um vigilante que o xingou com um palavrão. Ele revidou. O confronto resultou numa sentença de 16 anos por matar um vigia noturno chamado Alberto—posteriormente anulada por legítima defesa depois que ele já havia cumprido parte da pena.

O nome "Madame Satã" veio em 1938. Liberado da prisão, entrou num concurso de fantasias de carnaval no Teatro República usando uma fantasia inspirada num morcego de sua Pernambuco natal—toda de lantejoulas douradas e flair dramático. Ganhou o primeiro lugar. Dias depois, a polícia o prendeu junto com outros homossexuais num parque do centro. Quando o escrivão exigiu seu apelido, João recusou. Mas o delegado o reconheceu como o vencedor do carnaval e, associando sua fantasia de morcego ao filme de Cecil B. DeMille "Madam Satan," registrou o nome que o seguiria para sempre.

Ao longo de sua vida, João acumulou 27 anos e oito meses de prisão em 29 processos—dez condenações por acusações incluindo homicídio, agressão, furto, vadiagem, atentado ao pudor e porte de armas. Alegou cerca de 100 assassinatos e mais de 3.000 brigas, embora esses números carreguem o peso da mitologia malandra.

Trabalhou como segurança, protegendo casas noturnas e as prostitutas e pessoas marginalizadas que as frequentavam. "Somos seres humanos," declarou quando perguntado por que protegia aqueles que a sociedade desprezava. Criou seis filhas adotivas no Rio e mais uma na Ilha Grande.

Em 1971, jornalistas do jornal alternativo O Pasquim o "redescobriram." As entrevistas que se seguiram levaram às suas memórias de 1972, "Memórias de Madame Satã," narradas a Sylvan Paezzo. O livro revelou um homem de complexidade—violento e terno, criminoso e protetor, analfabeto mas filosoficamente profundo.

Dois anos antes de sua morte, apresentou-se uma última vez, interpretando Satanás em "Lampião no Inferno" (1974). Morreu em 12 de abril de 1976, aos 75 anos, pesando apenas 46 quilos. Foi enterrado como indigente no cemitério de Vila do Abraão, Ilha Grande, usando seu chapéu panamá, com rosas vermelhas colocadas em seu caixão.

Madame Satã representa a ponte entre a velha capoeira carioca dos malandros e a arte moderna que se desenvolveu nas décadas de 1950 e 1960. Suas façanhas impressionaram toda uma geração de capoeiristas. Sua vida foi reimaginada no filme de 2002 "Madame Satã," dirigido por Karim Aïnouz com Lázaro Ramos no papel principal, que estreou em Cannes.

Ele permanece um ícone de resistência—um negro, homossexual, analfabeto filho de ex-escravos que se recusou a se curvar às normas racistas, homofóbicas e moralistas de sua sociedade.',
  -- achievements_en
  'Published autobiography "Memórias de Madame Satã" (1972); subject of award-winning film "Madame Satã" (2002, Cannes premiere); won carnival costume contest at Teatro República (1938); performed as pioneering drag artist "Mulata do Balacochê" (1923); recognized as LGBTQ+ pioneer in Brazil; seven-time carnival costume contest winner',
  -- achievements_pt
  'Publicou autobiografia "Memórias de Madame Satã" (1972); tema do filme premiado "Madame Satã" (2002, estreia em Cannes); venceu concurso de fantasias no Teatro República (1938); atuou como transformista pioneiro "Mulata do Balacochê" (1923); reconhecido como pioneiro LGBTQ+ no Brasil; sete vezes vencedor de concursos de fantasia de carnaval',
  -- Researcher notes (English)
  E'BIRTH DATE: February 25, 1900 (year precision). Civil registry shows 1903, but Madame Satã adopted 1900 as his official birthdate per his memoirs. Multiple sources confirm 1900.

DEATH DATE: April 12, 1976 (exact). Died of lung cancer at age 75, weighing 46kg. Buried in Cemitério do Abraão, Vila do Abraão, Ilha Grande.

BIRTHPLACE: Glória do Goitá, Pernambuco, Brazil (Zona da Mata pernambucana).

PARENTS: Manoel Firmino dos Santos (died 1907) and Firmina Teresa da Conceição, both descendants of enslaved Africans.

TEACHER: Sete Coroas, from ~1909 (when Satã was 9 years old) until Sete Coroas'' death in 1923. Per Madame Satã in 1971 O Pasquim interview: "The greatest malandro of Rio de Janeiro that I knew from 1907 until today was the one who taught me to be a malandro and met me when I was 9 years old, the late Sete Coroas."

CRIMINAL RECORD: 27 years 8 months incarcerated; 29 legal proceedings; 10 convictions; 3 homicides admitted; ~3,000 fights claimed.

NAME ORIGIN: Acquired nickname in 1938 after winning carnival contest; police delegado associated his bat costume with Cecil B. DeMille''s film "Madam Satan" (1930).

CHILDREN: Raised 6 adopted daughters in Rio, 1 more on Ilha Grande.

IMPRISONMENT: Significant time at Presídio Cândido Mendes, Dois Rios, Ilha Grande.

WORKS: "Memórias de Madame Satã" (1972), narrated to Sylvan Paezzo.

FILMS ABOUT HIM: "Rainha Diaba" (1974); "Madame Satã" (2002, dir. Karim Aïnouz, starring Lázaro Ramos).',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 25 de fevereiro de 1900 (precisão de ano). Registro civil mostra 1903, mas Madame Satã adotou 1900 como data oficial conforme suas memórias. Múltiplas fontes confirmam 1900.

DATA DE MORTE: 12 de abril de 1976 (exata). Morreu de câncer de pulmão aos 75 anos, pesando 46kg. Enterrado no Cemitério do Abraão, Vila do Abraão, Ilha Grande.

LOCAL DE NASCIMENTO: Glória do Goitá, Pernambuco, Brasil (Zona da Mata pernambucana).

PAIS: Manoel Firmino dos Santos (morreu em 1907) e Firmina Teresa da Conceição, ambos descendentes de africanos escravizados.

PROFESSOR: Sete Coroas, de ~1909 (quando Satã tinha 9 anos) até a morte de Sete Coroas em 1923. Conforme Madame Satã em entrevista ao Pasquim de 1971: "O maior malandro do Rio de Janeiro que conheci de 1907 até os dias de hoje foi o que me ensinou a ser malandro e me conheceu com 9 anos de idade, o falecido Sete Coroas."

FICHA CRIMINAL: 27 anos e 8 meses encarcerado; 29 processos; 10 condenações; 3 homicídios admitidos; ~3.000 brigas alegadas.

ORIGEM DO NOME: Adquiriu o apelido em 1938 após vencer concurso de carnaval; delegado associou sua fantasia de morcego ao filme de Cecil B. DeMille "Madam Satan" (1930).

FILHOS: Criou 6 filhas adotivas no Rio, mais 1 na Ilha Grande.

PRISÃO: Tempo significativo no Presídio Cândido Mendes, Dois Rios, Ilha Grande.

OBRAS: "Memórias de Madame Satã" (1972), narradas a Sylvan Paezzo.

FILMES SOBRE ELE: "Rainha Diaba" (1974); "Madame Satã" (2002, dir. Karim Aïnouz, com Lázaro Ramos).'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Madame Satã student_of Sete Coroas (~1909-1923)
-- Sete Coroas taught him from age 9 until his death in 1923
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1909-01-01'::date, 'year'::genealogy.date_precision,
  '1923-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Madame Satã interview, O Pasquim 1971: "The greatest malandro of Rio de Janeiro that I knew from 1907 until today was the one who taught me to be a malandro and met me when I was 9 years old, the late Sete Coroas."',
  'Primary teacher-student relationship. Sete Coroas taught Madame Satã "the fine art of malandragem": capoeira, navalha fighting, smooth talk, rasteira, and bravado. When Sete Coroas died in 1923, he left Satã as his successor in Lapa and Saúde.',
  'Relação primária professor-aluno. Sete Coroas ensinou a Madame Satã "a fina arte da malandragem": capoeira, luta de navalha, papo, rasteira e valentia. Quando Sete Coroas morreu em 1923, deixou Satã como seu sucessor na Lapa e na Saúde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madame Satã' AND o.apelido = 'Sete Coroas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/madame-sata.sql',
  NULL,
  ARRAY['persons/sete-coroas.sql']::text[],
  'Madame Satã (1900-1976) - Legendary Rio malandro and capoeirista; student of Sete Coroas; transformista and LGBTQ+ pioneer; subject of 2002 film'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;
